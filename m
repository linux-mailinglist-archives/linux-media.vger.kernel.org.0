Return-Path: <linux-media+bounces-63928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BYe/LKnbImr1eQEAu9opvQ
	(envelope-from <linux-media+bounces-63928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:22:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1679D648CDB
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:22:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d6bDNQUP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63928-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63928-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30CE23036CFF
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BDB837472D;
	Fri,  5 Jun 2026 14:20:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342A382390;
	Fri,  5 Jun 2026 14:20:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669252; cv=none; b=bGLBKnGRgWizMBg8SkypPTvoFGm+AcKRpSdgdtvi0m44GuXd+LeRBgMUucUvqD/AJsPPNzYB3JbPgkox5EeFTFOq0+8O2KteArrhwsM8jXHQWOdpLQjXjTU63a2/AnS4/oxnheQud6sabTD8nRRAtgZm+votD73+kmMprAiPqM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669252; c=relaxed/simple;
	bh=vHxWGiABXfRZX/nTj9f8+kR/kRQsP11gYHu2xJvMhqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foiz5RyqihaW+zOBBXLbABV9YODudVdeKKJ2bUrXHc2KXQdiIxFuryba9qwJeiqF1S9kdBf+d4EsP51tM/zKGD8kUpzEwE2MsElO/7u73PBNsLociElCMdEXtap83r5VTq253sMxHk5ejOwenrfL0yJJ6ky3EAOFZD2FR+a7r40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6bDNQUP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBD41F0089A;
	Fri,  5 Jun 2026 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780669244;
	bh=rZm80SCqfNzEoYvnBtG8GQgboPdoaSiQU7oZ5wE97mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6bDNQUPgpcbZgQiqdR7qpbaVpZqpX22yPzIfuJ+X+GJfUbzwzTmhRuFueQZrfIRJ
	 qxAYnTx7PSD0kxAIrvwBFLS0tADeNc8ISDI/ttUfp3PuPFPJm1KN14jN4sB6gBG/3Y
	 D3bUHFjFi4zKYwkXGsgm7mJvlUoXjGzzhmsJ67QqBI1WH64oZLV3DALzl2SrJvt56j
	 4rt427WTisuUzs/KQveAhMuNFDFthyZOV9ep9fxi4DeqU/w1vvIQQ3NTAGZ5xtpgMt
	 sCnlDWere+e/wn3rpGd8BEgRxwFmJ5ECnsmG0x5jGfDZrRX7d48ldKejKhWolQuCEk
	 NxT4/9TkH5ojA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11C11F4007E;
	Fri,  5 Jun 2026 10:20:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Jun 2026 10:20:43 -0400
X-ME-Sender: <xms:Otsiakb3VgscOwQzObb9TnmCmdWfqsPbh1aKv6Ob1Gd4GnMm7g45cg>
    <xme:OtsiaswjOPU2H6OSi5TRRzTWJN1oxdosSHMWKU_xFLsbRBHQpEW6NqVq9E3l47Ar_
    _lgTF2cByW95QA75xv5ldkBLiujDQu1BJ0vYDNKrvTVE-_5bXKSjw>
X-ME-Received: <xmr:Otsiaq96ApZ9LuO6DemZFypZXDeykSN9R4ZWEMcOu325AV7T_b7aEirzjVs>
X-ME-Proxy-Cause: dmFkZTGmnYP5N/Y3347uBlTz0c7MclhskUD680CYIEvbldBBZOlbo8Ym/SOIKA+wnzZwqu
    zergSXkVsymVPFOH0pDne+qgzS+nkBAu5N0axf3sYZRo2nvTNCUjtPm1MMQssycnGEvk2z
    yaI544/RtZ8irsNtuXAmHJZIpjSaeCpLMs7XgEV+/rn1pCm2lHwIKR5NxoLv/Kp7KTgG1Z
    lLY1vZh76vKJ+oN17gUDdN0Th/LrUAsJPcjSsE776bPWq7CPgQxyXYzm+Vjk8Dm/1y02fb
    puunQqufAKdZiWOXFH4RfjlNHdhu4yzA3qQXzyuuNqM/+68+zvAuDsnJfYTo4B5CI11KSz
    0Z/h4GuSIxa5oqGjjmyx76Enz2u2eUx7GXT1PNjs4iwrlg39TUG6FjeYF87UoM4WeCLG/r
    xouuK/m/Gk1nqyzUOYDGO2U+yhP3S8w2gDavQX3jstdmU+W0AE2r+P4S3TBS1qziQ3CO5x
    8+wy91h1pK5gBNMtQgKVrEL+9GPYeWmYLnGblXrzWiFcUFuEJ8RjuWpZ2Roa3wu45wsPGh
    j2ArhLYXf5wYyOqLiXH6+dkO55yhJCVHrgy+4O67SQ6ZWH6nc5ZcdT7S5//okCwxaE7/Mt
    4OEXVNhzWwVZuRMC7T+q6xEjTLQdr8IO4/n51Tj/DiPrTPnbPzY2g+Kmowwg
X-ME-Proxy: <xmx:OtsiaiX5ZZYYUUWBD0GFrR8lNA7Remyu638zwCJRWBzviig9GfKXew>
    <xmx:O9siarOe-qdwbCXDYWcMKzCkwHhGyJk4yeG00Y1xAGgqgVNz9avZTQ>
    <xmx:O9siaszJbtt1LQ2ng-3qPyR_1TRzEwSqe6XFTozbY0hJbDwn4etASw>
    <xmx:O9siajPKFsXAgrpE11c85DtWGygRvW1UO8lxWAUqZ5z_ine-CUmJow>
    <xmx:O9siaii1Yx2gN81YC7CB5PuXo-Q7xO6ltrA6zbuXUtHBh_gZiER7_fFK>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 10:20:42 -0400 (EDT)
Date: Fri, 5 Jun 2026 07:20:41 -0700
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <aiLbOd9BkRrrzauk@tardis-2.local>
References: <20260605133541.22569-1-boqun@kernel.org>
 <20260605133541.22569-6-boqun@kernel.org>
 <aiLXWHg22P6OTb7O@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLXWHg22P6OTb7O@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63928-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tardis-2.local:mid];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1679D648CDB

On Fri, Jun 05, 2026 at 02:04:08PM +0000, Alice Ryhl wrote:
> On Fri, Jun 05, 2026 at 06:35:41AM -0700, Boqun Feng wrote:
> > The current RcuBox will call the `drop()` function after a grace period
> > inside an RCU callback. This suffices for maintaining a RCU-protected
> > object:
> > 
> >   RcuBox::drop():
> >     call_rcu(
> >       |..| { // <- call back after one grace period.
> >         T::drop(); // <- call the destructor of the inner object.
> >       }
> >     )
> > 
> > However, to support a different RCU usage pattern as below we need to
> > extend RcuBox:
> > 
> > 1. clean up the object, and unshare it from future RCU readers.
> > 2. wait for an RCU grace period.
> > 3. no other RCU readers, we can free the memory.
> > 
> > An `RcuFreeBox<T: RcuFreeSafe>` is introduced to provide support for
> > this:
> > 
> >   RcuFreeBox::drop():
> >     T::drop_before_gp(); // clean up and ushare.
> >     kfree_call_rcu(..);  // free it after one grace period.
> > 
> > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > ---
> >  rust/kernel/sync/rcu.rs         | 31 +++++++++++++++
> >  rust/kernel/sync/rcu/rcu_box.rs | 68 +++++++++++++++++++++++++++++++--
> >  2 files changed, 95 insertions(+), 4 deletions(-)
> > 
> > diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
> > index 7da6b8d22277..7c26591bb318 100644
> > --- a/rust/kernel/sync/rcu.rs
> > +++ b/rust/kernel/sync/rcu.rs
> > @@ -4,6 +4,8 @@
> >  //!
> >  //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
> >  
> > +use core::pin::Pin;
> > +
> >  use crate::{
> >      bindings,
> >      types::{
> > @@ -82,3 +84,32 @@ pub trait ForeignOwnableRcu: ForeignOwnable {
> >      /// [`from_foreign`]: ForeignOwnable::from_foreign
> >      unsafe fn rcu_borrow<'a>(ptr: *mut ffi::c_void) -> Self::RcuBorrowed<'a>;
> >  }
> > +
> > +/// Declares a struct is safe to free after a grace period if all readers are guarded by RCU.
> > +///
> > +/// # Safety
> > +///
> > +/// Implementation must guarantee `drop_before_gp()` makes sure no future RCU reader will access
> > +/// any part of [`Self`], as a result, after `drop_before_gp()` return + one grace period, no RCU
> > +/// reader will be on the object, and it's safe to free it.
> > +///
> > +/// Notes for implementators: implementing this trait in general requires `Self` being a
> > +/// [`UnsafePinned`], i.e. a `&mut Self` is not a noalias reference if `Self` has non-trivial
> > +/// `drop()` function.
> > +pub unsafe trait RcuFreeSafe {
> > +    fn drop_before_gp(self: Pin<&mut Self>);
> > +}
> 
> Should this have an associated type for the rcu-safe view?
> 
> pub unsafe trait RcuFreeSafe {
>     type RcuView<'a>;
> 
>     /// Access this value in a manner that is safe after
>     /// `drop_before_gp` for one grace period.
>     fn rcu_view<'a>(self: Pin<&'a Self>, _rcu: &'a RcuGuard) -> Self::RcuView<'a>;
> 
>     /// Drop this value in a manner where it may still be accessed via
>     /// `rcu_view` for one grace period.
>     ///
>     /// # Safety
>     ///
>     /// All other accesses to this value must happen before the call to this
>     /// method, except for accesses using `rcu_view`.
>     fn drop_before_gp(self: Pin<&mut Self>);
> }
> 
> The idea being that once you call `drop_before_gp()`, the value
> immediately becomes unusable as the type itself, but you can still use
> it via `rcu_view`. The `RcuView` type can then be a type that has a
> subset of the type's methods that is safe to use for one grace period
> after `drop_before_gp`.
> 
> If you define the trait like this, then PollCondVar becomes RcuFreeSafe.
> It can't be RcuFreeSafe today because you must not create new waiters after
> `drop_before_gp()` is called. With this modified trait, it can simply
> not provide methods for registering new waiters from the RcuView type.
> 

Good point! But I guess I could keep RcuFreeSafe as it is but remove the
`RcuFreeSafe::with_rcu()`, and this should be sufficient for
PollCondVar. I do want to wait for a meaningful usage of `rcu_view()` to
add that, but I think your idea of that is great. Or maybe you have a
potential usage in mind?

Regards,
Boqun

> Alice

