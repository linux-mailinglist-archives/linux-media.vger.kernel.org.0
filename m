Return-Path: <linux-media+bounces-63265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aERuOlSOHWqpcAkAu9opvQ
	(envelope-from <linux-media+bounces-63265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:51:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A316204BD
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FC83090A19
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE0C3ACEF4;
	Mon,  1 Jun 2026 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZD/1qwUQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860E37F8C9;
	Mon,  1 Jun 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321279; cv=none; b=CzJPXiLa8PxMQtlbk28zFS5jHfhBiIz96v69oS6MtGYmlUYfBcRvTVrQyH8ez7IGiSt04kigWcdDNFwnlBRpD0xbQwM54vxuhp4IvsR9iv2IJNZvvf8CDfXe5//pkHNv4pbwELfVXkgmUWWqutuEFUjWgwD7PlENBzza75DcuUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321279; c=relaxed/simple;
	bh=5/o6NQqtTVwjIlNjXVO4Xt/qjxB+FqG1olLOJTKzZw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB31v3uWfrX4ZbmsWAUk/rwVePBb/oET+NqF+jKA08QVBdkJN8CyUZ0AZ0o34BoxamNfxmI9yzaNMNNmqzrVbxsSd4B0660rTtI16CbD4VtsCSPZHlXwOVmqYtdiMrCqKrSBvaSLemNge+dE0wKOl+cZMjO5/ZZnmDb4ypGe6W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZD/1qwUQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D0F1F0089A;
	Mon,  1 Jun 2026 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780321277;
	bh=Cy/Wx8iHE+k3tnhZgJfl2Qf8HrXMI7saH/g6ishR5cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZD/1qwUQecSnKfTT66yrGOSNo8WOMEXQQQ9R3IbvQfQhjd651FrPeqeL9Sn+VJ3ax
	 BhVO0KmIo1FTz6s2UpPkb2oYSpR8G16KywEdVOf7XlNJOOsprbclirHrtIeOIh8XlD
	 9FTViaKyzZLTta5KwN4fdKsMj0UPdzR8r5vZi0M8mvA0GZOInaBEKLSfvnNsl/O878
	 L5K5x/D/fK50wEW7ei7xUvYiAUp1WNnHvvHfIHKWJoetIptRK+EuazavG0TZg0EMQC
	 bIJwzQ2KWq0h00FyAkNS2XmSfHclYfo2Ew+WkNKhCqg/GxdHYlj+Llt4JJHfAzw1tI
	 SibGx2RMqrrKQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id BA7BFF4008A;
	Mon,  1 Jun 2026 09:41:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 01 Jun 2026 09:41:15 -0400
X-ME-Sender: <xms:-4sdarzHZ6Vq9HtsOFeOO85MzAGI-Ah0vFhwMTBVZIvO-rjjhM5M3g>
    <xme:-4sdalq9FJxZ0-F_IItS9avqwcYvsI6ZePdHcjdKwhyQtRAzq80GCyEoeFZj14KxA
    rZw9xfOUUr9sCcPlvf5wM5h7Ug-qLjRbF-8leyFgb58_oUGZJuq>
X-ME-Received: <xmr:-4sdav7VT4VL2EfhcT26KxLioXm1vn5EArLtJ0_EXYRD-cYr7ZlUaHk1oL1T8Zhy0HI017nHtgidGp5xoBWdYKtWV5MO7I8cuQ>
X-ME-Proxy-Cause: dmFkZTEQx9WLyMJiwmRV/+uLnLi6x4tXtGJyKzl7rVMSP6cJN4a3LJQXrGvoa5s5QegsPj
    cBG9+VIEViyPnp9vQVotsHJtdGjqtL8FjYMeqtYA04kgCDQXIM0kLMdz+KfFxGn/jm2kHV
    UPnXdzWfZjVLyVBPSvBY72/HFGneZCGM2MkwQhN5CaUI8t2NuPJFNw0c4FeZxthAmhyRiv
    NN0aTXWc0JrQXjEClv0gxSkxg9jvRYyZeqON0CnaaBjd6BvKn/mQbMrHfoUJUig1DYbcUD
    XxkCwq+IvtsoGKWSaiESv2T4BxPHNSjkq4ZmvgZ7/OVZkTpvSG3l8Q7eAtkEZapasA3Rco
    tQ7QJ65HWT9eVssyAmvMK2peoVFi3X7P2LXRootOWWQ45mZ4ro3AWW/OvA4g7MF1Sf/jgP
    mBGJ2O81xU6Q4lsGyjn0nIMJN+CG9xgVjzeGgSgZQYQJM7XG7oQ6amNwo+5eGdcWoKNiYE
    Bi/DK+s1w/v6o4mdBq9vPdYSX+rsc5L50f3RnkZhV9On5d6fsJOXwS4FtcqG9bZGRmyUQA
    FJjm/HtDkgcrhhDS1LcKFDdQovY02T4TIBh1TpJvMCvl+aisTIozYS6Oz7JdstEJ14gIpx
    EAExkYvv/PzMdfThegFq1qzG2GVqxy80uwMbuMemZqJzsIOZnaJFjK0PpOOQ
X-ME-Proxy: <xmx:-4sdagC00o4l8d5ZXp0MOHiTuMek0dQUNf3hXe7v_xU6la8nXPt3kA>
    <xmx:-4sdal3oR2JPLGLZe81XDLAecgKlmBHwTTyMlkPsL-c0iw1kHSm3rg>
    <xmx:-4sdavZrr0U6gJ7bPYpk1cz8VGFwicN1CkhMOu3-ZsnFf9ouUMa0Bg>
    <xmx:-4sdap-lry_mBVdMIgF886GkdpB-LkVWd-DVIW-izB0N48WCQ8mWbw>
    <xmx:-4sdapOo-eGQE5QSonTMmvPTDYsc5Gw3FV2qQsXBiil_-0azbG9Hnwro>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jun 2026 09:41:15 -0400 (EDT)
Date: Mon, 1 Jun 2026 06:41:13 -0700
From: Boqun Feng <boqun@kernel.org>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
Message-ID: <ah2L-TMT5UHSd_Hs@tardis-2.local>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-4-phasta@kernel.org>
 <ahr9gtzQLSbPeBx_@tardis.local>
 <e8b16f3b40d42f3b0a8814180fa9b06f82c9d901.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8b16f3b40d42f3b0a8814180fa9b06f82c9d901.camel@mailbox.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63265-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tardis-2.local:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44A316204BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 09:56:23AM +0200, Philipp Stanner wrote:
> On Sat, 2026-05-30 at 08:08 -0700, Boqun Feng wrote:
> > On Sat, May 30, 2026 at 04:35:10PM +0200, Philipp Stanner wrote:
> > > From: Alice Ryhl <aliceryhl@google.com>
> > > 
> > > This adds an RcuBox container, which is like KBox except that the value
> > > is freed with kfree_rcu.
> > > 
> > > To allow containers to rely on the rcu properties of RcuBox, an
> > > extension of ForeignOwnable is added.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > 
> > I have the following on top of Alice's patch. @Alice, @Danilo, thoughts?
> > 
> > Then we can have:
> > 
> > type RcuKBox<T> = RcuBox<T, Kmalloc>;
> > type RcuVBox<T> = RcuBox<T, Vmalloc>;
> 
> No objections by me.
> 
> I just think we have to decide how the treat the namespaces, though.
> Probably Alice wrote it like that so that it's very apparent that this
> is not a normal box. It still breaks the naming convention in my
> opinion.
> 
> rcu::Box vs rcu::RcuBox
> 
> With all other subsystems, naming like that seems not allowed.
> 
> dma::Fence vs dma::DmaFence
> 
> 
> I probably would allow the user to decide whether he wants to just use
> it as `rcu::Box` in all his code.
> 
> But no hard feelings.
> 

For this I think that rcu::RcuBox is a bit different than dma::Fence,
because Box has its widely-accepted meaning through all Rust code,
while `Fence` doesn't. Hence my current thought is rcu::RcuBox and
dma::Fence. My personal preference is using namespace as much as we
could until there might be some misleading.

> 
> 
> > 
> > and Philipp can use the `RcuKBox` in this patchset. We also need to impl
> > InPlaceInit for RcuBox, but that can be added later.
> 
> So shall we merge my series with Alice's patch, and later we add your
> patch and other features, or would you prefer to have the additional
> boxes from your patch from the get-go?
> 

I would like to have it from the get-go mainly because of RcuBox vs
RcuKBox naming. Thank you!

Regards,
Boqun

> 
> P.
> 
> > 
> > Regards,
> > Boqun
> > 
> > ------------->8
> > Subject: [PATCH] rust: rcu: Make RcuBox generic over Allocator
> > 
> > To support RCU-protected vmalloc allocation, we need to make `RcuBox`
> > generic over `Allocator`. Currently this works since all `Allocator`s
> > are either kmalloc() or vmalloc(), and kvfree_call_rcu() works with both
> > allocations.
> > 
> > While we are at it, add some basic test cases.
> > 
> > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > ---
> >  rust/kernel/sync/rcu/rcu_box.rs | 96 +++++++++++++++++++++++----------
> >  1 file changed, 67 insertions(+), 29 deletions(-)
> > 
> > diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_box.rs
> > index 2508fdb609ec..5c344d82c0d9 100644
> > --- a/rust/kernel/sync/rcu/rcu_box.rs
> > +++ b/rust/kernel/sync/rcu/rcu_box.rs
> > @@ -4,47 +4,59 @@
> >  
> >  //! Provides the `RcuBox` type for Rust allocations that live for a grace period.
> >  
> > -use core::{ops::Deref, ptr::NonNull};
> > +use core::{
> > +    marker::PhantomData,
> > +    ops::Deref,
> > +    ptr::NonNull, //
> > +};
> >  
> >  use kernel::{
> > -    alloc::{self, AllocError},
> > +    alloc::{
> > +        self,
> > +        AllocError,
> > +        Allocator, //
> > +    },
> >      bindings,
> >      ffi::c_void,
> >      prelude::*,
> > -    sync::rcu::{ForeignOwnableRcu, Guard},
> >      types::ForeignOwnable,
> >  };
> >  
> > +use super::{
> > +    ForeignOwnableRcu,
> > +    Guard, //
> > +};
> > +
> >  /// A box that is freed with rcu.
> >  ///
> >  /// The value must be `Send`, as rcu may drop it on another thread.
> >  ///
> >  /// # Invariants
> >  ///
> > -/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `kmalloc`.
> > +/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `A`.
> >  /// * This `RcuBox` holds exclusive permissions to rcu free the allocation.
> > -pub struct RcuBox<T: Send>(NonNull<RcuBoxInner<T>>);
> > +pub struct RcuBox<T: Send, A: Allocator>(NonNull<RcuBoxInner<T>>, PhantomData<A>);
> >  
> >  struct RcuBoxInner<T> {
> >      value: T,
> >      rcu_head: bindings::callback_head,
> >  }
> >  
> > -// Note that `T: Sync` is required since when moving an `RcuBox<T>`, the previous owner may still
> > -// access `&T` for one grace period.
> > +// Note that `T: Sync` is required since when moving an `RcuBox<T, A>`, the previous owner may
> > +// still access `&T` for one grace period.
> >  //
> > -// SAFETY: Ownership of the `RcuBox<T>` allows for `&T` and dropping the `T`, so `T: Send + Sync`
> > -// implies `RcuBox<T>: Send`.
> > -unsafe impl<T: Send + Sync> Send for RcuBox<T> {}
> > +// SAFETY: Ownership of the `RcuBox<T, A>` allows for `&T` and dropping the `T`, so `T: Send +
> > +// Sync` implies `RcuBox<T, A>: Send`.
> > +unsafe impl<T: Send + Sync, A: Allocator> Send for RcuBox<T, A> {}
> >  
> > -// SAFETY: `&RcuBox<T>` allows for no operations other than those permitted by `&T`, so `T: Sync`
> > -// implies `RcuBox<T>: Sync`.
> > -unsafe impl<T: Send + Sync> Sync for RcuBox<T> {}
> > +// SAFETY: `&RcuBox<T, A>` allows for no operations other than those permitted by `&T`, so `T:
> > +// Sync` implies `RcuBox<T, A>: Sync`.
> > +unsafe impl<T: Send + Sync, A: Allocator> Sync for RcuBox<T, A> {}
> >  
> > -impl<T: Send> RcuBox<T> {
> > +impl<T: Send, A: Allocator> RcuBox<T, A> {
> >      /// Create a new `RcuBox`.
> >      pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {
> > -        let b = KBox::new(
> > +        let b = Box::<_, A>::new(
> >              RcuBoxInner {
> >                  value: x,
> >                  rcu_head: Default::default(),
> > @@ -53,9 +65,9 @@ pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {
> >          )?;
> >  
> >          // INVARIANT:
> > -        // * The pointer contains a valid `RcuBoxInner` allocated with `kmalloc`.
> > +        // * The pointer contains a valid `RcuBoxInner` allocated with `A`.
> >          // * We just allocated it, so we own free permissions.
> > -        Ok(RcuBox(NonNull::from(KBox::leak(b))))
> > +        Ok(RcuBox(NonNull::from(Box::leak(b)), PhantomData))
> >      }
> >  
> >      /// Access the value for a grace period.
> > @@ -66,7 +78,7 @@ pub fn with_rcu<'rcu>(&self, _read_guard: &'rcu Guard) -> &'rcu T {
> >      }
> >  }
> >  
> > -impl<T: Send> Deref for RcuBox<T> {
> > +impl<T: Send, A: Allocator> Deref for RcuBox<T, A> {
> >      type Target = T;
> >      fn deref(&self) -> &T {
> >          // SAFETY: While the `RcuBox<T>` exists, the value remains valid.
> > @@ -75,10 +87,10 @@ fn deref(&self) -> &T {
> >  }
> >  
> >  // SAFETY:
> > -// * The `RcuBoxInner<T>` was allocated with `kmalloc`.
> > +// * The `RcuBoxInner<T>` was allocated with `A`.
> >  // * `NonNull::as_ptr` returns a non-null pointer.
> > -unsafe impl<T: Send + 'static> ForeignOwnable for RcuBox<T> {
> > -    const FOREIGN_ALIGN: usize = <KBox<RcuBoxInner<T>> as ForeignOwnable>::FOREIGN_ALIGN;
> > +unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuBox<T, A> {
> > +    const FOREIGN_ALIGN: usize = <Box<RcuBoxInner<T>, A> as ForeignOwnable>::FOREIGN_ALIGN;
> >  
> >      type Borrowed<'a> = &'a T;
> >      type BorrowedMut<'a> = &'a T;
> > @@ -88,9 +100,9 @@ fn into_foreign(self) -> *mut c_void {
> >      }
> >  
> >      unsafe fn from_foreign(ptr: *mut c_void) -> Self {
> > -        // INVARIANT: Pointer returned by `into_foreign` carries same invariants as `RcuBox<T>`.
> > +        // INVARIANT: Pointer returned by `into_foreign, A` carries same invariants as `RcuBox<T>`.
> >          // SAFETY: `into_foreign` never returns a null pointer.
> > -        Self(unsafe { NonNull::new_unchecked(ptr.cast()) })
> > +        Self(unsafe { NonNull::new_unchecked(ptr.cast()) }, PhantomData)
> >      }
> >  
> >      unsafe fn borrow<'a>(ptr: *mut c_void) -> &'a T {
> > @@ -104,7 +116,7 @@ unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> &'a T {
> >      }
> >  }
> >  
> > -impl<T: Send + 'static> ForeignOwnableRcu for RcuBox<T> {
> > +impl<T: Send + 'static, A: Allocator> ForeignOwnableRcu for RcuBox<T, A> {
> >      type RcuBorrowed<'a> = &'a T;
> >  
> >      unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a T {
> > @@ -114,7 +126,7 @@ unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a T {
> >      }
> >  }
> >  
> > -impl<T: Send> Drop for RcuBox<T> {
> > +impl<T: Send, A: Allocator> Drop for RcuBox<T, A> {
> >      fn drop(&mut self) {
> >          // SAFETY: The `rcu_head` field is in-bounds of a valid allocation.
> >          let rcu_head = unsafe { &raw mut (*self.0.as_ptr()).rcu_head };
> > @@ -122,9 +134,11 @@ fn drop(&mut self) {
> >              // SAFETY: `rcu_head` is the `rcu_head` field of `RcuBoxInner<T>`. All users will be
> >              // gone in an rcu grace period. This is the destructor, so we may pass ownership of the
> >              // allocation.
> > -            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T>)) };
> > +            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T, A>)) };
> >          } else {
> >              // SAFETY: All users will be gone in an rcu grace period.
> > +            // TODO: We are luckily since `kvfree_call_rcu()` works on both kmalloc and vmalloc,
> > +            // maybe a new `Allocator` method is needed.
> >              unsafe { bindings::kvfree_call_rcu(rcu_head, self.0.as_ptr().cast()) };
> >          }
> >      }
> > @@ -135,11 +149,35 @@ fn drop(&mut self) {
> >  /// # Safety
> >  ///
> >  /// `head` references the `rcu_head` field of an `RcuBoxInner<T>` that has no references to it.
> > -/// Ownership of the `KBox<RcuBoxInner<T>>` must be passed.
> > -unsafe extern "C" fn drop_rcu_box<T>(head: *mut bindings::callback_head) {
> > +/// Ownership of the `Box<RcuBoxInner<T>, A>` must be passed.
> > +unsafe extern "C" fn drop_rcu_box<T, A: Allocator>(head: *mut bindings::callback_head) {
> >      // SAFETY: Caller provides a pointer to the `rcu_head` field of a `RcuBoxInner<T>`.
> >      let box_inner = unsafe { crate::container_of!(head, RcuBoxInner<T>, rcu_head) };
> >  
> >      // SAFETY: Caller ensures exclusive access and passed ownership.
> > -    drop(unsafe { KBox::from_raw(box_inner) });
> > +    drop(unsafe { Box::<_, A>::from_raw(box_inner) });
> > +}
> > +
> > +#[kunit_tests(rust_rcu_box)]
> > +mod tests {
> > +    use super::*;
> > +
> > +    #[test]
> > +    fn rcu_box_basic() -> Result {
> > +        let rb = RcuBox::<_, alloc::allocator::Kmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
> > +
> > +        assert_eq!(*rb, 42);
> > +        assert_eq!(*rb.with_rcu(&Guard::new()), 42);
> > +
> > +        drop(rb);
> > +
> > +        let rb = RcuBox::<_, alloc::allocator::Vmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
> > +
> > +        assert_eq!(*rb, 42);
> > +        assert_eq!(*rb.with_rcu(&Guard::new()), 42);
> > +
> > +        drop(rb);
> > +
> > +        Ok(())
> > +    }
> >  }

