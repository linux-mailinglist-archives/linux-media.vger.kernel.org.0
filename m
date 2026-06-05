Return-Path: <linux-media+bounces-63926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8kTuIw/YImpZeQEAu9opvQ
	(envelope-from <linux-media+bounces-63926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:07:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C4648B80
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:07:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RApMYwO7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63926-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63926-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FBAE3067F8B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F44361663;
	Fri,  5 Jun 2026 14:04:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2FA40E8F9;
	Fri,  5 Jun 2026 14:04:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668272; cv=none; b=uD1VypcrGwRRcp19jN5qOLxbf51RkCwpf6ofYtXvIo0wybMxggbc3F7rxkPKOHDoMvzkmsB1aT5qxjc+nF97GReSGx0V13hAOR0IZVDHrhFFQxY1EarMx5rJWdiinQV5ViSqAJwXGARXma2YZie7vsWUneRjIYj1gmqsxOM87qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668272; c=relaxed/simple;
	bh=FmOiaWHYYNRw1PqlXtpBZh6nUY7y4GCwrtLkmUAlu3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/SXFRcRJT4K4KYfW+Au/rsB9BxDBcsEF67jEzLC2VP7awRtSo0lnBSqiwyHgg81OoC+ZiMZ2ujLm0zrsVcUd/jSSwyVd/IGRE49ErnW6VGwhEh97xRg6NxdvcrY+bI743z9rH5c35HIVHX21yISSeFFkQihlJafd6rwendF3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RApMYwO7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1AB1F00899;
	Fri,  5 Jun 2026 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668269;
	bh=n9phLvi9RaSkTbiV76v3B+9PIG1KyHFVOKkyTySAtm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RApMYwO7er3nWL423qBa8U7GezuFG85ZFI5QxfxdBRA7oxZOqr3+dUKOvKsQD42dk
	 MBm8gyp4fD+eznKQX2NuNl3PnC9qt/wtqr5m86YXCEdGRJMAhV26S4jY7Kh24jYkAq
	 GbrrIb2q4riaQyR41vegJ4WkCjoH4Em7/d4vKPqhCsKUoNi6h+Hyry4kG2iyFA90Sz
	 5aUMgBIh8jiCcjHLrtWhYi+Cg2DmYH55hjF80jg5xWdqKNdobAdnhkM5bg8xfUaHx1
	 KfNXPeeTrR8LvzTbFRWiEekhhKHP90RPEUV8lI5QIW3OQA8Ix9YzL1OHon50JAkz+m
	 /aMXpi8IlhVTA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 04B5BF4006B;
	Fri,  5 Jun 2026 10:04:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 05 Jun 2026 10:04:28 -0400
X-ME-Sender: <xms:a9ciaqlosAOgMQ-H7Bs3JEtceK8yxjIZyvfv12DxMpT8noa2LvH6UA>
    <xme:a9ciauTmf_0ZDts2yRwzgpvSn-ozgSSUasZ63qxsOL7UFns9IZhhWS3I7kz2NyySD
    srfWhMNvIgstAqsVM9nJB3Ob7qEmVRhMOVTtffqHmvrB1W3bPwETw>
X-ME-Received: <xmr:a9ciav5x9HVbnmYbLxkD4mit0JBd3O-U72si7DYB5phFmSYDmDoybYuX78o>
X-ME-Proxy-Cause: dmFkZTE0LZy4M50cfSktgTQFQkT6rI8G/Y5ximbMU42xvQT/+Sed7xjM9kNTsktTuSYDm1
    BIjZO7IzdASMlhBtV1S7AFMQApb37A8fKR9/AHBLIr/n9d/wlMaBz+PRGef2ki8mMhu9tX
    4JvIRsbSlNYDdkdzSA6KfbTuLTkSgs9bVuP2uAzw08Hls1twdxyz7y7v9YaBKujNxVJEjL
    G0EeIDtlTu2RAmmMKOAuCcjCCAFGKqDKV8vFzoNSBFeiSMcfD6JZu6gP3ORcpCyzteW65r
    25GOeoMN2WTRB5S4afaK+GExykd4IQTngu5itniecfIpXUhstt8v8txm3kk/kZVZbv1bqO
    ino+D2vIRbGMN+F1hRXDOCzUUZ2iJH07hy1zl3BcOJNvFSHyIe1wkLhZ97kGI/eS+3q0so
    mx/DzXcsnBDcWHgz6WWNinkDN6IiI48Vi289YaFfyxv8KArnYJOTUiWIfZ4GiV7IRl+0sO
    be02Isnlw5gQ6PVC39s4/Er7YAf9Cb0CT1xqHgh2ckzV1mpGiJHVHN4FZrGBoUVBJOBAcL
    t+ZwTOzejpgfVg0iqdMKpWeCjLU3a5n44cIPoA/RfgiZ4LMkRNHl2sJkaEZRhYj7pHjiJo
    ZVydVPBt8Dd6psI3xOgvfEiZQ/1XhhJ7y+n8Pv6AmgF9oUJpk/pxlIOaoAdg
X-ME-Proxy: <xmx:a9cialHZ--5RMQutJGNI-mXfgpahld13JBnKh_cXRhsUWb5rNGxwgA>
    <xmx:a9ciapGyCe-Jsr-DKFpFLGNwICjSfAj78LXIpdeH4ICgyDz8UpyQig>
    <xmx:a9ciartEuy8QyrrZg5xel2j7fyTUsmEiLyAvUGLc9pqqbxBhx36GZg>
    <xmx:a9cianI6wu3QjraoT0xkcrI8owwNVsdSwqYU2kw7PK0Smvh6B6QI7Q>
    <xmx:a9ciaizRFxuinjXkGL5XxgnHr3z8LABkzVb52CrBYIK0js_GkvR6y0HT>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 10:04:27 -0400 (EDT)
Date: Fri, 5 Jun 2026 07:04:26 -0700
From: Boqun Feng <boqun@kernel.org>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Andrew Ballance <andrewjballance@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [RFC PATCH 3/3] rust: rcu: Introduce RcuFreeBox
Message-ID: <aiLXaoGZVkiNEAgC@tardis-2.local>
References: <20260605133541.22569-1-boqun@kernel.org>
 <20260605133541.22569-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605133541.22569-6-boqun@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63926-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,vger.kernel.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tardis-2.local:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 173C4648B80

On Fri, Jun 05, 2026 at 06:35:41AM -0700, Boqun Feng wrote:
> The current RcuBox will call the `drop()` function after a grace period
> inside an RCU callback. This suffices for maintaining a RCU-protected
> object:
> 
>   RcuBox::drop():
>     call_rcu(
>       |..| { // <- call back after one grace period.
>         T::drop(); // <- call the destructor of the inner object.
>       }
>     )
> 
> However, to support a different RCU usage pattern as below we need to
> extend RcuBox:
> 
> 1. clean up the object, and unshare it from future RCU readers.
> 2. wait for an RCU grace period.
> 3. no other RCU readers, we can free the memory.
> 
> An `RcuFreeBox<T: RcuFreeSafe>` is introduced to provide support for
> this:
> 
>   RcuFreeBox::drop():
>     T::drop_before_gp(); // clean up and ushare.
>     kfree_call_rcu(..);  // free it after one grace period.
> 
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---
>  rust/kernel/sync/rcu.rs         | 31 +++++++++++++++
>  rust/kernel/sync/rcu/rcu_box.rs | 68 +++++++++++++++++++++++++++++++--
>  2 files changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
> index 7da6b8d22277..7c26591bb318 100644
> --- a/rust/kernel/sync/rcu.rs
> +++ b/rust/kernel/sync/rcu.rs
> @@ -4,6 +4,8 @@
>  //!
>  //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
>  
> +use core::pin::Pin;
> +
>  use crate::{
>      bindings,
>      types::{
> @@ -82,3 +84,32 @@ pub trait ForeignOwnableRcu: ForeignOwnable {
>      /// [`from_foreign`]: ForeignOwnable::from_foreign
>      unsafe fn rcu_borrow<'a>(ptr: *mut ffi::c_void) -> Self::RcuBorrowed<'a>;
>  }
> +
> +/// Declares a struct is safe to free after a grace period if all readers are guarded by RCU.
> +///
> +/// # Safety
> +///
> +/// Implementation must guarantee `drop_before_gp()` makes sure no future RCU reader will access
> +/// any part of [`Self`], as a result, after `drop_before_gp()` return + one grace period, no RCU
> +/// reader will be on the object, and it's safe to free it.
> +///
> +/// Notes for implementators: implementing this trait in general requires `Self` being a
> +/// [`UnsafePinned`], i.e. a `&mut Self` is not a noalias reference if `Self` has non-trivial
> +/// `drop()` function.
> +pub unsafe trait RcuFreeSafe {
> +    fn drop_before_gp(self: Pin<&mut Self>);
> +}
> +
> +macro_rules! impl_not_drop {
> +    ($($t:ty, )*) => {
> +        // SAFETY: Dropping `T` has no side effect means `T` is always ready to be freed. And an
> +        // empty `drop_before_gp()` suffices.
> +        $(unsafe impl RcuFreeSafe for $t {
> +            fn drop_before_gp(self: Pin<&mut Self>) {
> +                $crate::const_assert!(!core::mem::needs_drop::<$t>());
> +            }
> +        })*
> +    }
> +}
> +
> +impl_not_drop! {i8,u8,i16,u16,i32,u32,isize,usize,i64,u64,}
> diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_box.rs
> index 943fe3e8974e..8f52bb472daf 100644
> --- a/rust/kernel/sync/rcu/rcu_box.rs
> +++ b/rust/kernel/sync/rcu/rcu_box.rs
> @@ -6,6 +6,7 @@
>  
>  use core::{
>      marker::PhantomData,
> +    mem::ManuallyDrop,
>      ops::Deref,
>      ptr::NonNull, //
>  };
> @@ -29,17 +30,18 @@
>  
>  use super::{
>      ForeignOwnableRcu,
> -    Guard, //
> +    Guard,
> +    RcuFreeSafe, //
>  };
>  
> -/// A box that is freed with rcu.
> +/// A box that is drop with RCU.
>  ///
> -/// The value must be `Send`, as rcu may drop it on another thread.
> +/// The value must be `Send`, as RCU may drop it on another thread.
>  ///
>  /// # Invariants
>  ///
>  /// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `A`.
> -/// * This `RcuBox` holds exclusive permissions to rcu free the allocation.
> +/// * This `RcuBox` holds exclusive permissions to RCU-free the allocation.
>  pub struct RcuBox<T: Send, A: Allocator>(NonNull<RcuBoxInner<T>>, PhantomData<A>);
>  
>  /// Type alias for [`RcuBox`] with a [`Kmalloc`] allocator.
> @@ -205,6 +207,50 @@ fn drop(&mut self) {
>      drop(unsafe { Box::<_, A>::from_raw(box_inner) });
>  }
>  
> +/// A box that is freed with RCU.
> +///
> +/// Currently we require `T` being `Send` because of an implementation limitation. In theory we can
> +/// support `T` being `!Send`, since the RCU callback is only used to free the memory, not dropping
> +/// `T`.
> +pub struct RcuFreeBox<T: Send + RcuFreeSafe, A: Allocator>(RcuBox<ManuallyDrop<T>, A>);
> +
> +impl<T: Send + RcuFreeSafe, A: Allocator> RcuFreeBox<T, A> {
> +    /// Create a new `RcuFreeBox`.
> +    pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {
> +        Ok(Self(RcuBox::new(ManuallyDrop::new(x), flags)?))
> +    }
> +
> +    /// Access the value for a grace period.
> +    pub fn with_rcu<'rcu>(&self, read_guard: &'rcu Guard) -> &'rcu T {
> +        self.0.with_rcu(read_guard)
> +    }
> +}
> +
> +impl<T: Send + RcuFreeSafe, A: Allocator> Deref for RcuFreeBox<T, A> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &T {
> +        self.0.deref()
> +    }
> +}
> +
> +impl<T: Send + RcuFreeSafe, A: Allocator> Drop for RcuFreeBox<T, A> {
> +    fn drop(&mut self) {
> +        // CAST: `ManuallyDrop<T>` is transparet to `T`, adn `RcuBox` owns the object per type
> +        // invariants.
> +        let ptr = self.0 .0.as_ptr().cast::<T>();
> +
> +        // SAFETY: Per the invariants of `RcuBox`, `ptr` owns the pointed object. And we are not
> +        // going to move it.
> +        let pin = unsafe { Pin::new_unchecked(&mut *ptr) };
> +

This part needs to be:

        // CAST: `ManuallyDrop<RcuBoxInner<T>>` is transparent to `RcuBoxInner<T>`, and `RcuBox`
        // owns the object per type invariants.
        let inner: *mut RcuBoxInner<T> = self.0 .0.as_ptr().cast();

        // SAFETY: Per the invariants of `RcuBox`, `inner` owns the pointed object. And we are not
        // going to move it.
        let pin = unsafe { Pin::new_unchecked(&mut (*inner).value) };

Fixed locally.

Regards,
Boqun

> +        pin.drop_before_gp();
> +
> +        // `needs_drop::<ManuallyDrop>()` returns `false`, hence `kvfree_call_rcu()` will be called
> +        // and free the underlying data after a gracer period.
> +    }
> +}
> +
>  #[kunit_tests(rust_rcu_box)]
>  mod tests {
>      use super::*;
> @@ -218,6 +264,13 @@ fn rcu_box_basic() -> Result {
>  
>          drop(rb);
>  
> +        let rb = RcuFreeBox::<_, alloc::allocator::Kmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
> +
> +        assert_eq!(*rb, 42);
> +        assert_eq!(*rb.with_rcu(&Guard::new()), 42);
> +
> +        drop(rb);
> +
>          let rb = RcuBox::<_, alloc::allocator::Vmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
>  
>          assert_eq!(*rb, 42);
> @@ -225,6 +278,13 @@ fn rcu_box_basic() -> Result {
>  
>          drop(rb);
>  
> +        let rb = RcuFreeBox::<_, alloc::allocator::Vmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
> +
> +        assert_eq!(*rb, 42);
> +        assert_eq!(*rb.with_rcu(&Guard::new()), 42);
> +
> +        drop(rb);
> +
>          Ok(())
>      }
>  }
> -- 
> 2.51.0
> 

