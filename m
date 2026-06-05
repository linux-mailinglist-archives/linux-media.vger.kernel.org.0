Return-Path: <linux-media+bounces-63925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FKdTFEfZImqPeQEAu9opvQ
	(envelope-from <linux-media+bounces-63925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:12:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B3648BFA
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:12:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=GUoXzFnC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63925-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63925-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82445307CD35
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFED35E1AF;
	Fri,  5 Jun 2026 14:04:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0C40E8F9
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 14:04:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668253; cv=none; b=r13zxUwxduX+/RSJZHRgxBzHBt2kezmX9DjmeJZNuTFfveGPtKEoOtQYE9vsYLV+anBGQojKlxTvSiICLFiezlbWtXIlv1uEdFNY6M9QrDHf+AZfpBVa2XovJkpqnu8U/8XtLA/Wo/dCgNvA+50fm66yojgtYyYekSVpwpclYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668253; c=relaxed/simple;
	bh=nE+jrhG/ppYv31sfWuxQUTVFQS7am2LwuFIGyuBECqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AmhJ/nK/obDAkiI9BJ/oNz5v2oKgD4TpiSAoKQ15WaWqFpdxQ/tE99pmA5O4HOa3llf/AXa73PPa5oRryozqN8SumJ0rcKzAKBVjaO5bISSiCRJLK72sgpu4z9h8oD4XI0Rd53hIyT/vnWoiSabV6uIRK80j0YplJcD1mLol/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GUoXzFnC; arc=none smtp.client-ip=209.85.128.74
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso17058845e9.2
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 07:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780668250; x=1781273050; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KzxQflFVSTadDNXMRobclacHPyZHXHcPR4PL2Kdl0Ys=;
        b=GUoXzFnCTBFfQI6dDid1XcZGmj7m2tSJY7WIFu2ckaLvRyF1aJ3fw4aMzPHvtGcze2
         QZtE3FTt88bH8jLLG1WFqSHA/WaYnVcx0syrgdlApwIkmT2ctoQ/OQjyqsGo+RH6LiQp
         t7dpVTiDiyi7PgEX/QK6OsVfFBqUjVXFWJ723rkfFIrHKbokTUMlKAgtrgZ0/oJn387Q
         UcevcjD8fNoA7vlfqBVR+FMkgvu5bbPMiHEBbZJD89PGagrKGuUSBHzUdl4LiwLDbMYc
         YKYiHNxind5lwKlIPAaCkYY4Etop/9jnA5MbnYuFV1ESvHOVoBN5q0Y3mPR66YR7KzSp
         v0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668250; x=1781273050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzxQflFVSTadDNXMRobclacHPyZHXHcPR4PL2Kdl0Ys=;
        b=Isa1XKe+qu70Jxwsc4EwUxs1kvn+slEG2kC7EnOeGYFA744dyvsOY0lGzmJlcDFg+t
         u5aMI/IiY94ggy+Qcqa9NMHMcg38JYUv3vMG/tWL1o8aNlTzBQG6jhnzPxyHu1228oSB
         OLSeyA8RwRD9eYEzF0IF/qVSNTeGw8HbwwdsiI1RlrlenU7XMvz0bE8yzlS7366qxwSn
         Nv5p7jHq42UlEysYwt/7TZJ7g8UiNTMRnROwTCTML7zT9hWHbP/ST18kpLAjOVAw57kY
         7SDFK9dFd65pfZHbbe1FCcBTLX3yS+4BzuIb2dCmmvt2OlGjjU7Wtnz1GYY693Vvm8AP
         FYQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aP6FzNeiGaG6jctyPm3VnvX0VATL8XELqeVGyMsio50hylX+kRrKdoJwIeA1ITcahZNcD2oYB84O/Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIV6ORuIyyGK79GPsymSmMqnXPzjmypyIcVNfVvws6PTk99a7J
	Iox5C2GW+gx13aZrh4iZSfF5KqtPHvMSyQtMfGAQ7v3sHQxO7o2wmA305LyOeAkqTl0EZGnX03G
	1e8anMjwVzJ3E1jTbIA==
X-Received: from wmsk10.prod.google.com ([2002:a05:600d:848a:b0:490:acbb:67d7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr52711405e9.28.1780668249942;
 Fri, 05 Jun 2026 07:04:09 -0700 (PDT)
Date: Fri, 5 Jun 2026 14:04:08 +0000
In-Reply-To: <20260605133541.22569-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605133541.22569-1-boqun@kernel.org> <20260605133541.22569-6-boqun@kernel.org>
Message-ID: <aiLXWHg22P6OTb7O@google.com>
Subject: Re: [RFC PATCH 3/3] rust: rcu: Introduce RcuFreeBox
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	rcu@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Philipp Stanner <phasta@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63925-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E0B3648BFA

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

Should this have an associated type for the rcu-safe view?

pub unsafe trait RcuFreeSafe {
    type RcuView<'a>;

    /// Access this value in a manner that is safe after
    /// `drop_before_gp` for one grace period.
    fn rcu_view<'a>(self: Pin<&'a Self>, _rcu: &'a RcuGuard) -> Self::RcuView<'a>;

    /// Drop this value in a manner where it may still be accessed via
    /// `rcu_view` for one grace period.
    ///
    /// # Safety
    ///
    /// All other accesses to this value must happen before the call to this
    /// method, except for accesses using `rcu_view`.
    fn drop_before_gp(self: Pin<&mut Self>);
}

The idea being that once you call `drop_before_gp()`, the value
immediately becomes unusable as the type itself, but you can still use
it via `rcu_view`. The `RcuView` type can then be a type that has a
subset of the type's methods that is safe to use for one grace period
after `drop_before_gp`.

If you define the trait like this, then PollCondVar becomes RcuFreeSafe.
It can't be RcuFreeSafe today because you must not create new waiters after
`drop_before_gp()` is called. With this modified trait, it can simply
not provide methods for registering new waiters from the RcuView type.

Alice

