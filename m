Return-Path: <linux-media+bounces-63562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q8zgKlr2H2o3tQAAu9opvQ
	(envelope-from <linux-media+bounces-63562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:39:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 094526363B1
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:39:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=GiV2P4f3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63562-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63562-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74CC930954DC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23AB4028ED;
	Wed,  3 Jun 2026 09:35:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0100A3603DD
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 09:35:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479347; cv=pass; b=lbgg6nCc5rtNjZOabDGvHQHEU34yRtqcmZG83wNKVK/j63A1o7tnuRhjuR0msx6Ux067ufyARGiPP4XaBd9pkq/BGg5x4FNdkIdekKBn+BnRYA7yMXA+SB1iLBNvdDbdVllPjn3AtsV41Fkt2AZ2B+OdT8d6uumciKJ0mVa7zjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479347; c=relaxed/simple;
	bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFh/jhG8JEfxB2ox4Q1C8zLGgVSl6M7FFqgVQj8s2e18zSLEp3wC78Zv177qu0ynW+P9JP3UsVZl3an95v4WwzYZ02JbTWb4HcpU+8RHQJykZYbxUELu3LdeVdgqau9hMArnPhTWNyRotPOkxm3xxFNiIE+qKP3WF7/foJCf6uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiV2P4f3; arc=pass smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b64c8311so8150735e9.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 02:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780479343; cv=none;
        d=google.com; s=arc-20240605;
        b=LbgSY31H0BN5WDEbvtxZPizJ10usXT9LtNx+UCbG8OIYVsCmY1NKmHPblKrBCN/VmO
         sDb1z6uMI4RJMqSOXb9yz8SY6iWhtBgcTPPszfbzPyd0RtGV5yi84BLJs9N3Yg6d72ea
         mVbEVwdGN2anANdpc5YCro0Ozogdfbldr4pB/jwX9mzNY9G8T+hKrKI/mfPbp8ChkDvl
         PJ0dvcSAdiFQbWIILT2pLVDTBT2nzoYRrJgxbOKqLK//SYi9StOo1uRtKSogdDvol0FJ
         rXYzenS22Re5n4SFq6wioHWjwoEycMyPl2xgSezNf6KCtEjvugoBqALN0N1E+C42NOMq
         hNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
        fh=qckMdXVZXU49i1KP91HqzNwuaqCPoNK54AcykXf7IA0=;
        b=iAMHrLRGtpOg3c3w1a18lVGlZH9LWGY+6Xi2Bqa4t8+u2iMqj3scJ+toszl2x8Zhuz
         iShwSBRym0I3CVRCfyal9Z0J+TEoLIFI7K2RIyxBlTk9NBfdNiFEOgE9hHiPY+LC2Kb/
         meHUH5B7jhSXp+8ZQDg5AORFZM8ayfvmkY1uvNPlcy7wJe7TmHosrERxYK4gN4Cwg7Zu
         HWpOA8zd20wgrGiENViZ9t6aLjHn/kxeZFf6SIdRZXzRyo8hI0sHPH0hTQSk098IsYHZ
         /WA3ekqp6Rb/VzvXNecxrfXONmlLpMVOFdfiYqLKeDb2L7OdkkH3KOCdnAJrIh/+1XjF
         TrFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780479343; x=1781084143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
        b=GiV2P4f3PopCt4Y3ZQchR9NalsW55dkf2SjcvmJGXIYL71soDe6I7mW5dqve9FlqFE
         GOL1V6LhpSuHQsjNOHvy3BXc708CCd+HmZtuV6hQbBI9N5aRRzL2U+0bjW5BTQumMph9
         GG9+4jSZOSUPxVhYpNhLwKNI6vuQ4DtVRZUHiKIqheF1BVAdjnUhvOJz2bLTVmydCAGr
         iYE/DDYNRtMAf8Sxq1XB1IvgHlZBdfJ010h5AazpE2PhnDEchXhXwFLsMoLh6UMU4RFe
         1suDTdsGtchHFLd6nyWxFzQHcCWYr27K6NeCzYSOvFlrypOmZMC8zYQwORsE6zPU/1qu
         V6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479343; x=1781084143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
        b=kIL6K+OeTDNFeMOEyjaJ0jaUI1b6hk8ueozlc/QzhRvnTChB5lmeSb2bumXyL60QPb
         DQM6lBFSqCw1bWfJG4Q1HxiBxEiapfifI0v1lWCKAb2UB0gwNHhQJ4jDFW+ku/evX3hJ
         YN5kEVg67jAej4os4WJlJWkUctCsp4nzQRSq0/+Fzl+QzhGGRAGJr+c23/evB7BXpNDb
         a24xrTU72WAqu83U6DEeiAxIeWhfvvFHNphNzvp+kQSNgPu0M6QHWUd1osf3a7cgFY+G
         3KQgDqOWsM/swN/QNJ0R6eFwV4rntlRIU4vWUUHsTyeITpZoBRv3xN92XAvbCbN8FuSU
         F1CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aFzR+p/SWVU13aYCekzQHo8KqhHUbBppY/4QHj2ZWX7V9BTdsOpV1s5eLg7jpzxIIBzuLo66wOSQXvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRo/VuaJXaatXdrMzipk2pKE7fzU729rahuT9YCiIqttNO1oHN
	HzIycsylF5WkMND5R7wIB7he7qDiwxv/FVjShdjTqrD4GujXjfIZJBvMWNiJeuzkJ1xlJpjjwYi
	ANCrgzPciZaINaq6CatJMU+pPifYDTyP6T6RQmDrV
X-Gm-Gg: Acq92OFb9DnDJE6PjUlXT+CmyVZTUPCipo3YWioevFpbrnaQk+BvdBPT6btFZsb2amh
	E9DPqwuP7xdjEbd+a7Wzf92uoyiniaHH3VrzZlir7YiJnvoc7NIpC+SZxfAHtzE9qYMRCAGmIju
	r0fhhK+nQb1sZ3BupC6IuxxBfSu0PhVscZDv9ZW+R86DzVJCxGo59ajqKmw2dEiyJWQdSw9lz18
	WZldiYqEPpyggeYJWvShMKFlkUHSYv6j6mC92wZQq66kphUgCVSzXnCR8UPYtd36HH5OwMnRt4L
	xe2iyopZqjFRMykigcVIP8V1NzIZlax6n3roWyWSQ9d2EpGNzZKZC8jHYsHY1iMU6FbmEWo4f7T
	QaR2/
X-Received: by 2002:a05:600c:8184:b0:490:5cd8:d213 with SMTP id
 5b1f17b1804b1-490b5eb44f8mr43679475e9.15.1780479343116; Wed, 03 Jun 2026
 02:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-4-phasta@kernel.org>
 <ahr9gtzQLSbPeBx_@tardis.local> <e8b16f3b40d42f3b0a8814180fa9b06f82c9d901.camel@mailbox.org>
 <ah2L-TMT5UHSd_Hs@tardis-2.local> <441fccce521857ab82b84bb8e5ab539ee3810a36.camel@mailbox.org>
In-Reply-To: <441fccce521857ab82b84bb8e5ab539ee3810a36.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 3 Jun 2026 11:35:28 +0200
X-Gm-Features: AVHnY4JfNUks84z0WqzXiLep0aUyPzGhK0pYIVWREZIpQzivqBZzfg4IE8o75iI
Message-ID: <CAH5fLghA5LfV+=r4-LbX+gaNo6v_-gSdcXOJHa76Lc74WCJ5JA@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
To: phasta@kernel.org
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boqun@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmai
 l.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63562-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,mailbox.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 094526363B1

On Wed, Jun 3, 2026 at 11:33=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> On Mon, 2026-06-01 at 06:41 -0700, Boqun Feng wrote:
> > On Mon, Jun 01, 2026 at 09:56:23AM +0200, Philipp Stanner wrote:
> > > On Sat, 2026-05-30 at 08:08 -0700, Boqun Feng wrote:
> > > > On Sat, May 30, 2026 at 04:35:10PM +0200, Philipp Stanner wrote:
> > > > > From: Alice Ryhl <aliceryhl@google.com>
> > > > >
> > > > > This adds an RcuBox container, which is like KBox except that the=
 value
> > > > > is freed with kfree_rcu.
> > > > >
> > > > > To allow containers to rely on the rcu properties of RcuBox, an
> > > > > extension of ForeignOwnable is added.
> > > > >
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > ---
> > > >
> > > > I have the following on top of Alice's patch. @Alice, @Danilo, thou=
ghts?
> > > >
> > > > Then we can have:
> > > >
> > > > type RcuKBox<T> =3D RcuBox<T, Kmalloc>;
> > > > type RcuVBox<T> =3D RcuBox<T, Vmalloc>;
> > >
> > > No objections by me.
> > >
> > > I just think we have to decide how the treat the namespaces, though.
> > > Probably Alice wrote it like that so that it's very apparent that thi=
s
> > > is not a normal box. It still breaks the naming convention in my
> > > opinion.
> > >
> > > rcu::Box vs rcu::RcuBox
> > >
> > > With all other subsystems, naming like that seems not allowed.
> > >
> > > dma::Fence vs dma::DmaFence
> > >
> > >
> > > I probably would allow the user to decide whether he wants to just us=
e
> > > it as `rcu::Box` in all his code.
> > >
> > > But no hard feelings.
> > >
> >
> > For this I think that rcu::RcuBox is a bit different than dma::Fence,
> > because Box has its widely-accepted meaning through all Rust code,
> > while `Fence` doesn't. Hence my current thought is rcu::RcuBox and
> > dma::Fence. My personal preference is using namespace as much as we
> > could until there might be some misleading.
>
> Yoah, probably better we're safer rather than hyper-consistent.
>
> >
> > >
> > >
> > > >
> > > > and Philipp can use the `RcuKBox` in this patchset. We also need to=
 impl
> > > > InPlaceInit for RcuBox, but that can be added later.
> > >
> > > So shall we merge my series with Alice's patch, and later we add your
> > > patch and other features, or would you prefer to have the additional
> > > boxes from your patch from the get-go?
> > >
> >
> > I would like to have it from the get-go mainly because of RcuBox vs
> > RcuKBox naming. Thank you!
>
> Fine by me. Just process-wise: how should we do it?
>
> I could include your patch on top of Alice's. Would be a bit more
> consistent regarding the git-workflow if we'd squash the two patches,
> but then you two would have to agree on authorship.
>
> All is fine by me, but I wanted to ask instead of just do A or B.

Squashing is fine with me, thanks.

Alice

