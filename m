Return-Path: <linux-media+bounces-64991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N5HdKk00MWrQdwUAu9opvQ
	(envelope-from <linux-media+bounces-64991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:32:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 006CF68ECE1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:32:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=rVv2OSsS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64991-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64991-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DC643160E3E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0003BE65C;
	Tue, 16 Jun 2026 11:29:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D43BADB3;
	Tue, 16 Jun 2026 11:29:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781609346; cv=none; b=isuZU4WBbHftdjyb+s/einPRDiBYg0obJPUT8bF1WSaDNILj05vGyiquQqis94tmvG8CqmLmW6E7WuejOxSXGpuGBlynbWD23WnqzfDg+Ta0xlHI2lSFwRgoEz46+UM61CHj7wNhi9EwY34MH45LcITufF0rT6EVvvlLiMX7wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781609346; c=relaxed/simple;
	bh=sWOXWTKF5X4rIT0RcpwHCvomYOwWW7ISCvRf69QrMHo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0AC4IrwH4CiLFrjnQCi9omdHpUsonOc0NvDxFoIFgYSHdEnG6y2xr015tGyXAO9zalZlCb1/fDxRe5koTvARK3orElyuDEblvszV+jtqfLmm3lJYlhp6y3Pk9fhr9QqgLOSf7uK9gs0sNlPBIGkzsVP5TtpgAkEKumAhd2+szY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rVv2OSsS; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gfl9y4Kz7z9vHQ;
	Tue, 16 Jun 2026 13:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781609334; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWOXWTKF5X4rIT0RcpwHCvomYOwWW7ISCvRf69QrMHo=;
	b=rVv2OSsS1WkU4oeWYWilXliqnNHBLySYmrspykGaFYJ1mzdIz4KWDwxQMbsCoAVDWaoiUN
	6xpR74n2/x3G8CQQc99Rr2be0BHMbeE0THGlbywMmhnymDrageF6zgyTT61G5NLB6Q/cKZ
	4XoLBh5O1q8Su0IFK9dwTjgupdERai/8nom7OzAdMgMEvRdkfOjd6dRZOZ/3ISQbR9W9IK
	D00cjrnd4/MbWzM72L0VaGrzI+W+YmouzLDXXUY9x5eW/TBiEdVXBS1/mLUALs3WFwkhCb
	vyw4YfP7g3aRMTBRJcVVlvDGAcIn0qLKO8hoBALqGMknPMJJX286EBa91vBbCA==
Message-ID: <cb369c1ab1deff4242084a4cfca94a1c7dad1af5.camel@mailbox.org>
Subject: Re: [PATCH v2 0/6] rust / dma_buf: Add abstractions for dma_fence
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, "Paul E.
 McKenney" <paulmck@kernel.org>,  Frederic Weisbecker	
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki	 <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>,  Zqiang <qiang.zhang@linux.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes	 <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori	 <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>,  Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, Boris Brezillon <boris.brezillon@collabora.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rcu@vger.kernel.org
Date: Tue, 16 Jun 2026 13:28:43 +0200
In-Reply-To: <DJAF8AXHRRIX.2E0FNAQP3DOWK@kernel.org>
References: <20260616082819.2943886-2-phasta@kernel.org>
	 <DJAF8AXHRRIX.2E0FNAQP3DOWK@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: s9uupdk8efzhymxogiegp1x63zgr8otu
X-MBO-RS-ID: a7fa06f888fbc53f17c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:li
 sts@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64991-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 006CF68ECE1

T24gVHVlLCAyMDI2LTA2LTE2IGF0IDEzOjAyICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Ogo+IE9uIFR1ZSBKdW4gMTYsIDIwMjYgYXQgMTA6MjggQU0gQ0VTVCwgUGhpbGlwcCBTdGFubmVy
IHdyb3RlOgo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiAKPiBJdCBzZWVtcyB0aGF0IHNvbWUgb2Yg
dGhlIGNvbW1lbnRzIGZyb20gdjEgWzFdWzJdIGFyZSBub3QgYWRkcmVzc2VkLCBkaWQgeW91Cj4g
Zm9yZ2V0IHRoZW0/Cgp5ZWFoLCBhIGJ1bmNoIG9mIHN0dWZmIG1pZ2h0IGhhdmUgc2xpcHBlZCBt
ZS4gTWVhIGN1bHBhLiBOZWVkIHRvCmFkZHJlc3Mgc29tZSBtb3JlIGlzc3VlcyBpbiB2MyBhbnl3
YXlzOyBidXQgd2FudGVkIHRvIHByZXNlbnQgdGhlIHJvdWdoClJDVSBpZGVhIGhlcmUgYXMgYSBo
ZWFkcy11cC4KCj4gCj4gSW4gcGFydGljdWxhciB0aGUgcGluX2luaXRfZnJvbV9jbG9zdXJlKCkg
bG9va3MgdW5uZWNlc3NhcnkgYW5kIGNhbiBwcm9iYWJseQo+IHJlcGxhY2VkIHdpdGggc29tZXRo
aW5nIGxpa2UgKHVudGVzdGVkKToKPiAKPiAJbGV0IG11dCBjYWxsYmFjayA9IFNvbWUoY2FsbGJh
Y2spOwo+IAkKPiAJdHJ5X3Bpbl9pbml0IShTZWxmIHsKPiAJwqDCoMKgIGNiIDwtIE9wYXF1ZTo6
dHJ5X2ZmaV9pbml0KHxwdHJ8IHsKPiAJwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBgZmVuY2Uu
aW5uZXIuZ2V0KClgIGlzIGEgdmFsaWQsIGluaXRpYWxpemVkIGBzdHJ1Y3QgZG1hX2ZlbmNlYC4g
YHB0cmAKPiAJwqDCoMKgwqDCoMKgwqAgLy8gcG9pbnRzIHRvIHRoZSBgc3RydWN0IGRtYV9mZW5j
ZV9jYmAgZmllbGQgd2l0aGluIHRoZSBwaW5uZWQgYWxsb2NhdGlvbiwgc28gaXQKPiAJwqDCoMKg
wqDCoMKgwqAgLy8gcmVtYWlucyB2YWxpZCB1bnRpbCBgZG1hX2ZlbmNlX3JlbW92ZV9jYWxsYmFj
aygpYCBpbiBgUGlubmVkRHJvcGAgb3IgdW50aWwgdGhlCj4gCcKgwqDCoMKgwqDCoMKgIC8vIGNh
bGxiYWNrIGZpcmVzLgo+IAnCoMKgwqDCoMKgwqDCoCBsZXQgcmV0ID0gdW5zYWZlIHsKPiAJwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB0b19yZXN1bHQoYmluZGluZ3M6OmRtYV9mZW5jZV9hZGRfY2Fs
bGJhY2soCj4gCcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmZW5jZS5pbm5lci5nZXQo
KSwKPiAJwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ciwKPiAJwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFNvbWUoU2VsZjo6ZG1hX2ZlbmNlX2NhbGxiYWNrKSwKPiAJwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCApKQo+IAnCoMKgwqDCoMKgwqDCoCB9Owo+IAnCoMKgwqDCoMKg
wqDCoCBtYXRjaCByZXQgewo+IAnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9rKCgpKSA9PiBPaygo
KSksCj4gCcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRXJyKGUpID0+IHsKPiAJwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGxldCBjYl9iYWNrID0gY2FsbGJhY2sudGFrZSgpLmV4cGVjdCgi
c3VjY2VzcyBwYXRoIGRpZCBub3QgcnVuIik7Cj4gCcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiBlID09IEVOT0VOVCB7Cj4gCcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEVycihDYWxsYmFja0Vycm9yOjpBbHJlYWR5U2lnbmFsZWQoY2JfYmFjaykpCj4gCcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+IAnCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFcnIoQ2FsbGJhY2tFcnJvcjo6T3RoZXIoZSkpCj4gCcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fQo+IAnCoMKgwqDCoMKgwqDCoCB9Cj4gCcKgwqDCoCB9KSwKPiAJwqDCoMKgIGNhbGxiYWNrOiBj
YWxsYmFjay50YWtlKCkuZXhwZWN0KCJlcnJvciBwYXRoIGRpZCBub3QgcnVuIiksCj4gCcKgwqDC
oCBmZW5jZTogQVJlZjo6ZnJvbShmZW5jZSksCj4gCX0/IENhbGxiYWNrRXJyb3I8VD4pCj4gCj4g
UGxlYXNlIGFsc28gc2VlIG15IHByZXZpb3VzIGNvbW1lbnRzIHJlZ2FyZGluZyBEcml2ZXJGZW5j
ZUJvcnJvdywgaXQgc3RpbGwgc2VlbXMKPiB0byBtaXNzIHRoZSBsaWZldGltZSBhbmQgaXQgc2hv
dWxkIHByb2JhYmx5IHVzZSBNYW51YWxseURyb3A8RHJpdmVyRmVuY2U+LgoKQUNLLgoKPiAKPiBJ
dCBhbHNvIHNlZW1zIHRoZSBwYXRjaCBzZXJpZXMgd2FzIGNyZWF0ZWQgd2l0aG91dCAtLWJhc2Us
IHdoYXQncyB0aGUgYmFzZQo+IHJldmlzaW9uPwoKQnJhbmNoZWQgb3V0IGZyb20gZHJtLW1pc2Mt
bmV4dCBmb3IgZGV2ZWxvcG1lbnQgcHVycG9zZXMgKHNpbmNlIGl0CmhlYXZpbHkgcmVsaWVzIG9u
IGRtYS1mZW5jZS5jKQoKSSBjYW4gcmViYXNlIG9uIGRybS1ydXN0LW5leHQgZm9yIHRoZSBuZXh0
IHJldmlzaW9uLgoKPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0RJVzNaSzVO
TEtVMy4xUVlNUUIwSVNIRkJHQGtlcm5lbC5vcmcvCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9ESVc0MlRPNUhZNkguMlJMTDhWOEg0OEE1QUBrZXJuZWwub3JnLwo=


