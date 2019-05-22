// Generated by Apple Swift version 5.0 (swiftlang-1001.0.69.5 clang-1001.0.46.3)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="InputBarAccessoryView",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class NSCoder;

SWIFT_CLASS("_TtC21InputBarAccessoryView14AttachmentCell")
@interface AttachmentCell : UICollectionViewCell
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)prepareForReuse;
@end

@class UICollectionViewLayout;

SWIFT_CLASS("_TtC21InputBarAccessoryView24AttachmentCollectionView")
@interface AttachmentCollectionView : UICollectionView
@property (nonatomic, readonly) CGSize intrinsicContentSize;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout * _Nonnull)layout OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC21InputBarAccessoryView17AttachmentManager")
@interface AttachmentManager : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface AttachmentManager (SWIFT_EXTENSION(InputBarAccessoryView)) <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
- (void)collectionView:(UICollectionView * _Nonnull)collectionView didSelectItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)collectionView:(UICollectionView * _Nonnull)collectionView numberOfItemsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UICollectionViewCell * _Nonnull)collectionView:(UICollectionView * _Nonnull)collectionView cellForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGSize)collectionView:(UICollectionView * _Nonnull)collectionView layout:(UICollectionViewLayout * _Nonnull)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC21InputBarAccessoryView16AutocompleteCell")
@interface AutocompleteCell : UITableViewCell
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier SWIFT_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)prepareForReuse;
- (void)layoutSubviews;
@end

@class UITextView;
@class UITableView;

SWIFT_CLASS("_TtC21InputBarAccessoryView19AutocompleteManager")
@interface AutocompleteManager : NSObject <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate>
- (void)textViewDidChange:(UITextView * _Nonnull)textView;
- (BOOL)textView:(UITextView * _Nonnull)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString * _Nonnull)text SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end




SWIFT_CLASS("_TtC21InputBarAccessoryView21AutocompleteTableView")
@interface AutocompleteTableView : UITableView
@property (nonatomic, readonly) CGSize intrinsicContentSize;
- (nonnull instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC21InputBarAccessoryView19ImageAttachmentCell")
@interface ImageAttachmentCell : AttachmentCell
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)prepareForReuse;
@end

@class UIEvent;
@class UITraitCollection;
@class UISwipeGestureRecognizer;

/// A powerful InputAccessoryView ideal for messaging applications
SWIFT_CLASS("_TtC21InputBarAccessoryView21InputBarAccessoryView")
@interface InputBarAccessoryView : UIView
/// Returns the most recent size calculated by <code>calculateIntrinsicContentSize()</code>
@property (nonatomic, readonly) CGSize intrinsicContentSize;
- (nonnull instancetype)init;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)willMoveToSuperview:(UIView * _Nullable)newSuperview;
- (void)didMoveToWindow;
/// Invalidates the view’s intrinsic content size
- (void)invalidateIntrinsicContentSize;
- (void)layoutIfNeeded;
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
/// Invalidates the intrinsicContentSize
- (void)traitCollectionDidChange:(UITraitCollection * _Nullable)previousTraitCollection;
/// Invalidates the intrinsicContentSize
- (void)orientationDidChange;
/// Enables/Disables the sendButton based on the InputTextView’s text being empty
/// Calls each items <code>textViewDidChangeAction</code> method
/// Calls the delegates <code>textViewTextDidChangeTo</code> method
/// Invalidates the intrinsicContentSize
- (void)inputTextViewDidChange;
/// Calls each items <code>keyboardEditingBeginsAction</code> method
- (void)inputTextViewDidBeginEditing;
/// Calls each items <code>keyboardEditingEndsAction</code> method
- (void)inputTextViewDidEndEditing;
/// Calls each items <code>keyboardSwipeGestureAction</code> method
/// Calls the delegates <code>didSwipeTextViewWith</code> method
- (void)didSwipeTextView:(UISwipeGestureRecognizer * _Nonnull)gesture;
@end




/// A InputItem that inherits from UIButton
/// <h2>Important Notes</h2>
/// <ol>
///   <li>
///     Intended to be used in an <code>InputStackView</code>
///   </li>
/// </ol>
SWIFT_CLASS("_TtC21InputBarAccessoryView18InputBarButtonItem")
@interface InputBarButtonItem : UIButton
@property (nonatomic, readonly) CGSize intrinsicContentSize;
/// Calls the onSelectedAction or onDeselectedAction when set
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
/// Calls the onEnabledAction or onDisabledAction when set
@property (nonatomic, getter=isEnabled) BOOL enabled;
- (nonnull instancetype)init;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// Executes the onTouchUpInsideAction
- (void)touchUpInsideAction;
@end


SWIFT_CLASS("_TtC21InputBarAccessoryView18InputBarSendButton")
@interface InputBarSendButton : InputBarButtonItem
- (nonnull instancetype)init;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
@end

@class NSBundle;

/// An simple <code>UIViewController</code> subclass that is ready to work
/// with an <code>inputAccessoryView</code>
SWIFT_CLASS("_TtC21InputBarAccessoryView22InputBarViewController")
@interface InputBarViewController : UIViewController
@property (nonatomic, readonly, strong) UIView * _Nullable inputAccessoryView;
@property (nonatomic, readonly) BOOL canBecomeFirstResponder;
- (void)viewDidLoad;
- (BOOL)resignFirstResponder;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


/// A UIStackView that’s intended for holding <code>InputItem</code>s
/// <h2>Important Notes</h2>
/// <ol>
///   <li>
///     Default alignment is .fill
///   </li>
///   <li>
///     Default distribution is .fill
///   </li>
///   <li>
///     The distribution property needs to be based on its arranged subviews intrinsicContentSize so it is not recommended to change it
///   </li>
/// </ol>
SWIFT_CLASS("_TtC21InputBarAccessoryView14InputStackView")
@interface InputStackView : UIStackView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSAttributedString;
@class UIFont;
@class NSTextContainer;

/// A UITextView that has a UILabel embedded for placeholder text
/// <h2>Important Notes</h2>
/// <ol>
///   <li>
///     Changing the font, textAlignment or textContainerInset automatically performs the same modifications to the placeholderLabel
///   </li>
///   <li>
///     Intended to be used in an <code>InputBarAccessoryView</code>
///   </li>
///   <li>
///     Default placeholder text is “Aa”
///   </li>
///   <li>
///     Will pass a pasted image it’s <code>InputBarAccessoryView</code>’s <code>InputPlugin</code>s
///   </li>
/// </ol>
SWIFT_CLASS("_TtC21InputBarAccessoryView13InputTextView")
@interface InputTextView : UITextView
@property (nonatomic, copy) NSString * _Null_unspecified text;
@property (nonatomic, strong) NSAttributedString * _Null_unspecified attributedText;
/// The font of the InputTextView. When set the placeholderLabel’s font is also updated
@property (nonatomic, strong) UIFont * _Null_unspecified font;
/// The textAlignment of the InputTextView. When set the placeholderLabel’s textAlignment is also updated
@property (nonatomic) NSTextAlignment textAlignment;
/// The textContainerInset of the InputTextView. When set the placeholderLabelInsets is also updated
@property (nonatomic) UIEdgeInsets textContainerInset;
@property (nonatomic) UIEdgeInsets scrollIndicatorInsets;
- (nonnull instancetype)init;
- (nonnull instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer * _Nullable)textContainer OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (BOOL)canPerformAction:(SEL _Nonnull)action withSender:(id _Nullable)sender SWIFT_WARN_UNUSED_RESULT;
- (void)paste:(id _Nullable)sender;
@end

@class NSNotification;
@class UIPanGestureRecognizer;
@class UIGestureRecognizer;
@class UITouch;

/// An object that observes keyboard notifications such that event callbacks can be set for each notification
SWIFT_CLASS("_TtC21InputBarAccessoryView15KeyboardManager")
@interface KeyboardManager : NSObject <UIGestureRecognizerDelegate>
/// Creates a <code>KeyboardManager</code> object that observes the state of the keyboard
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
/// An observer method called last in the lifecycle of a keyboard becoming visible
/// \param notification NSNotification
///
- (void)keyboardDidShowWithNotification:(NSNotification * _Nonnull)notification;
/// An observer method called last in the lifecycle of a keyboard becoming hidden
/// \param notification NSNotification
///
- (void)keyboardDidHideWithNotification:(NSNotification * _Nonnull)notification;
/// An observer method called third in the lifecycle of a keyboard becoming visible/hidden
/// \param notification NSNotification
///
- (void)keyboardDidChangeFrameWithNotification:(NSNotification * _Nonnull)notification;
/// An observer method called first in the lifecycle of a keyboard becoming visible/hidden
/// \param notification NSNotification
///
- (void)keyboardWillChangeFrameWithNotification:(NSNotification * _Nonnull)notification;
/// An observer method called second in the lifecycle of a keyboard becoming visible
/// \param notification NSNotification
///
- (void)keyboardWillShowWithNotification:(NSNotification * _Nonnull)notification;
/// An observer method called second in the lifecycle of a keyboard becoming hidden
/// \param notification NSNotification
///
- (void)keyboardWillHideWithNotification:(NSNotification * _Nonnull)notification;
/// Starts with the cached <code>KeyboardNotification</code> and calculates a new <code>endFrame</code> based
/// on the <code>UIPanGestureRecognizer</code> then calls the <code>.willChangeFrame</code> <code>EventCallback</code> action
/// \param recognizer UIPanGestureRecognizer
///
- (void)handlePanGestureRecognizerWithRecognizer:(UIPanGestureRecognizer * _Nonnull)recognizer;
/// Only receive a <code>UITouch</code> event when the <code>scrollView</code>’s keyboard dismiss mode is interactive
- (BOOL)gestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer shouldReceiveTouch:(UITouch * _Nonnull)touch SWIFT_WARN_UNUSED_RESULT;
/// Only recognice simultaneous gestures when its the <code>panGesture</code>
- (BOOL)gestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer * _Nonnull)otherGestureRecognizer SWIFT_WARN_UNUSED_RESULT;
@end








/// A UIView thats intrinsicContentSize is overrided so an exact height can be specified
/// <h2>Important Notes</h2>
/// <ol>
///   <li>
///     Default height is 1.0
///   </li>
///   <li>
///     Default backgroundColor is UIColor.lightGray
///   </li>
///   <li>
///     Intended to be used in an <code>InputStackView</code>
///   </li>
/// </ol>
SWIFT_CLASS("_TtC21InputBarAccessoryView13SeparatorLine")
@interface SeparatorLine : UIView
@property (nonatomic, readonly) CGSize intrinsicContentSize;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end





#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
