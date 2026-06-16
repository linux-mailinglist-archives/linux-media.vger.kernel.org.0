Return-Path: <linux-media+bounces-65041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J64VA/5iMWp8iQUAu9opvQ
	(envelope-from <linux-media+bounces-65041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 16:51:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C59690AC1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 16:51:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=onurozkan.dev header.s=protonmail header.b=frlJVMVp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65041-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65041-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=onurozkan.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8175A3012774
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEC33C062A;
	Tue, 16 Jun 2026 14:51:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FF36A35A
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 14:51:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781621487; cv=none; b=bZt+hKcrSl8YZoWn9t6BspO1p5IsvFJFLHWdvaBgn8uj9MgH+tbyJiov1IkpDGrb3xg7KNaVlRcdsyQEe170gowQqLi0fjeD9frA7ktCqF5fRlL0ZeH6OM1soAHi0JMNAP3c3RuveM7OQIt+rbrF8OWH5/vO+7LHODeXzvgcfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781621487; c=relaxed/simple;
	bh=8lg0lMM++bEYHjTp0b5ME3AVk0YuMGGw60/KhELAHHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxEn3GcypJE6AcxexLwTO+yOMhJO26XpbcJZDn1uFlrUl+n9arLnFO9iEhrkavS7DJKUJyIClqHWPPH44Q5/pTCuXPHwTDIGQ/vbJ//wnRDXfmqRmd0d5T+ouAiy+SOZRi67Ex51UMISzJFOU75TtqF5+53y2UrVq6xTM1CLltY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=frlJVMVp; arc=none smtp.client-ip=79.135.106.112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781621480; x=1781880680;
	bh=8lg0lMM++bEYHjTp0b5ME3AVk0YuMGGw60/KhELAHHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=frlJVMVpec64vFDqx5fdB8XDPtgKB/tWL7HRxgIspC73pZxexP3/M6050v9LV+EBR
	 5eU27vNdh69Jajt1fmYlyjG84fyrFsk0Gm7ZwrahvHwnuv1CtNkWd3EzOw9EECf/oV
	 1f1LdftmcQxuBLZlGi+kMPfJ6hW1CkEF6lvNjKF5ivzHfukwBIB1QPns1GmJAMatjz
	 hbXFPCA/0Nh1XVHUTEiCGmPJE0blabPn7rWYC4yPekp4CtWK6UNrC4IGvPWhphzQVV
	 P68Zg0VJ9i0SkCm1ec/2B89kk1K9RwlSGc2ENeJz30CxDj2cr15Qnc5MBtyp6+racn
	 TFN9SXPp7E7BQ==
X-Pm-Submission-Id: 4gfqgP6Gpyz1DFGT
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Philipp Stanner <phasta@mailbox.org>
Cc: Philipp Stanner <phasta@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rcu@vger.kernel.org
Subject: Re: [PATCH v2 5/6] rust: Add dma_fence abstractions
Date: Tue, 16 Jun 2026 17:51:11 +0300
Message-ID: <20260616145112.14201-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <d074d3105a2c1d4f594bc6d7b0b09e62757790d5.camel@mailbox.org>
References: <20260616082819.2943886-2-phasta@kernel.org> <20260616082819.2943886-7-phasta@kernel.org> <20260616124755.460550-1-work@onurozkan.dev> <d074d3105a2c1d4f594bc6d7b0b09e62757790d5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65041-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankari
 ak0208@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1C59690AC1

On Tue, 16 Jun 2026 16:38:51 +0200=0D
Philipp Stanner <phasta@mailbox.org> wrote:=0D
=0D
> On Tue, 2026-06-16 at 15:47 +0300, Onur =C3=96zkan wrote:=0D
> > On Tue, 16 Jun 2026 10:28:17 +0200=0D
> > > +=0D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DriverFenceData is rep=
r(C) and a Fence is its first member.=0D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data_ptr =3D fe=
nce_ptr as *mut DriverFenceData<T>;=0D
> > =0D
> > Either the field ordering on the type or this code is wrong because the=
 first=0D
> > member of DriverFenceData is `rcu_head`.=0D
> =0D
> Yeah, that's a bug introduced in this revision. Thx for pointing it=0D
> out. Already fixed it downstream.=0D
> =0D
> I'm just wondering why my test did not blow up.=0D
> =0D
> > > =0D
> > > +}=0D
> > =0D
> > I am unsure whether it is safe to cast the pointer in Fence::from_raw w=
ithout=0D
> > Fence being #[repr(transparent)] as the layout compatibility is not gua=
ranteed=0D
> > explicitly.=0D
> =0D
> Shouldn't #[repr(C)] do that trick, too? Do you need both?=0D
> =0D
> Who can answer that?=0D
> =0D
> =0D
> P.=0D
=0D
You shouldn't use both and I think it wouldn't compile anyway. repr(C) only=
=0D
makes sense when the type have multiple fields.=0D
=0D
Thanks,=0D
Onur=0D

