Return-Path: <linux-media+bounces-65048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fyP2LV5+MWoukwUAu9opvQ
	(envelope-from <linux-media+bounces-65048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 18:48:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB069277E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 18:48:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=onurozkan.dev header.s=protonmail header.b=BNogqe4N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65048-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65048-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=onurozkan.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CB34304A456
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 16:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6BA478E5B;
	Tue, 16 Jun 2026 16:35:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61440478E26;
	Tue, 16 Jun 2026 16:35:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781627751; cv=none; b=vGvYeGSn7dRjCbKVOn6Bz8KTphO3Wxba1j2t/yyPPJQP264KRKULNnpvhoXVT3qeV6bVUm08+LdW1GnWUzhbMpfDWT5VvejVx0HEuTmAHuahlbQQhngBUia9rxmW+gArS5lzL81FGmuD/qtTpshjQOQ0zIAGVYVfvQ/9NKvHTU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781627751; c=relaxed/simple;
	bh=P2r8RWkNdoFBCLrjIXLOkZZ8fH3MNFSSDE0O0qYF6ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rITFQ5AGBxdJoQtrF8zdFfQOZw+zePMFK4BYzmiymUIsuIHGHijABf3ZX6VMzvE/HuNXVff6hKIUMQknL5N8NiV/PoDiD4/Hpt0SIZRsdFEKfDUHpgXGvzDoXrOZaDkYHyFDCuBvqCAk2qhJQt3M8kGvrlKuQQ9P/EFWyI/zI8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=BNogqe4N; arc=none smtp.client-ip=109.224.244.106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781627738; x=1781886938;
	bh=P2r8RWkNdoFBCLrjIXLOkZZ8fH3MNFSSDE0O0qYF6ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BNogqe4NJSTrXOs4CMdDsbFTEMDm+K6W9ODrr/FMiCgu8IPVCldAUGpNYsM+s7/ol
	 ecj/xutzHQw54+MFvOHyc3HfAkMV2PM97gUUZY6Alkahh0vts+BZKC3yxzXZEdvWBa
	 MgbPy2Wae4urKGibQJcqahhRTPKFsZLwjC47UZ+quN850YZukaVOEYEOK2kTOihmNd
	 +yGTk3kU1gTygDcnV3g4b6tK8xVJHI9DaA5rKzJdtJFslc2plwGQxI8XBz8Is0ysyO
	 RJcBjahrNHh2HxZGLqHmmhovyZJl5Ezurk9YFbRJBedyqthKpt1HBC+SSfieK70gz4
	 AFI8iISJLDpIw==
X-Pm-Submission-Id: 4gfszk6rs8z2ScsV
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@mailbox.org>,
	Philipp Stanner <phasta@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
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
Date: Tue, 16 Jun 2026 19:35:26 +0300
Message-ID: <20260616163529.6880-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DJAKVXTHQJ99.152VRPFJDPTRU@kernel.org>
References: <20260616082819.2943886-2-phasta@kernel.org> <20260616082819.2943886-7-phasta@kernel.org> <20260616124755.460550-1-work@onurozkan.dev> <d074d3105a2c1d4f594bc6d7b0b09e62757790d5.camel@mailbox.org> <20260616145112.14201-1-work@onurozkan.dev> <DJAKVXTHQJ99.152VRPFJDPTRU@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65048-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@mailbox.org,m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankari
 ak0208@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,onurozkan.dev:dkim,onurozkan.dev:mid,onurozkan.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5AB069277E

On Tue, 16 Jun 2026 17:28:04 +0200=0D
Danilo Krummrich <dakr@kernel.org> wrote:=0D
=0D
> On Tue Jun 16, 2026 at 4:51 PM CEST, Onur =C3=96zkan wrote:=0D
> > repr(C) only makes sense when the type have multiple fields.=0D
> =0D
> I don't think that's universally true. repr(transparent) guarantees the l=
ayout=0D
> and ABI match the inner field. The wrapper is passed through calls exactl=
y as=0D
> the field would be. repr(C) guarantees C-compatible layout and makes the =
type=0D
> follow the platform's C ABI for passing an aggregate, which isn't always =
how the=0D
> bare field is passed.=0D
=0D
I was too focused on the field ordering perspective during the review, sorr=
y for=0D
that.=0D
=0D
Onur=0D

