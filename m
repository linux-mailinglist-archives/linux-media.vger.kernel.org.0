Return-Path: <linux-media+bounces-63221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJPgBo9HHWohYgkAu9opvQ
	(envelope-from <linux-media+bounces-63221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:49:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A363461BC07
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 10:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E23B4300D1D8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 08:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609F834753B;
	Mon,  1 Jun 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l+L4lkx5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15935343D86;
	Mon,  1 Jun 2026 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303605; cv=none; b=kZVXS3z10D0bClvSGtNuzaQpGYB75AnWMVSYvLFStuYZwakFZnSZzfJZtACcI4Qe8lWdS7Eag2sp4spmUn6msb3hx0JBEQVYmRxuP0c/cRnPiiyY3xafYbL2tnLS5FyMAP4xm0FwPIhoZWzm+X/dZF9vLLNDmxy/b3d4IrrysmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303605; c=relaxed/simple;
	bh=TRfcJtRlchZEGxap6JkQGnGqe9tHTNUIeQjlYrEhxs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbmd2gZcnm0KxwzpN7YQSL6WyxI4hbq6jZn8tDJVDkTWiLKuzsoQD24Ng3dBJMa1q81tgLVblkffmhGlV+5GjB6D+8P3sDeinJxH5lK3Ti63c9qqv5Ksfp0rBOQekuDGV4S/OM5bLu53ptEh7khxR7Yq/wYoreOoYTy5F41cq5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l+L4lkx5; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gTSHh09Pdz9smP;
	Mon,  1 Jun 2026 10:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780303600; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRfcJtRlchZEGxap6JkQGnGqe9tHTNUIeQjlYrEhxs0=;
	b=l+L4lkx5YykvlZQQ78XWjIA6WEdByX0p9ODGpQG0i7HCziAq8cfWlQaF04W54go7TCGLXY
	SDxoOfHqTW1b7btZjZsYeCoazTQKE4F1DuXT7szg3AGSoiJpvOIChcaPDWRkI+bwWXXOnA
	2k01Pio/CM829xoopFjDlv5vxLrjIzbcVb4rSWkQ5sdhC3IIeRBdub1LshfGjHODqiVjze
	KaIWiCEHjRwq/+aXTNL2OyykkgJObBIkgKuBmUOMTDL9EVuw9hR/tzGOruI2TxU3GRpljy
	g307wc/GZwe3P1/bXaT4sMwXvQCv/wsZe6FvghgoWUsGY+N+09vPF5CFPG79Ag==
Message-ID: <08b87b07279e7774c76c0267b1d6c337f705acda.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
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
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Date: Mon, 01 Jun 2026 10:46:19 +0200
In-Reply-To: <DIW3ZK5NLKU3.1QYMQB0ISHFBG@kernel.org>
References: <20260530143541.229628-2-phasta@kernel.org>
	 <20260530143541.229628-5-phasta@kernel.org>
	 <DIW3ZK5NLKU3.1QYMQB0ISHFBG@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 3ism9n1pwksnxia1e8r9xncusxhxj974
X-MBO-RS-ID: 388db5ec2fecad88473
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63221-lists,linux-media=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A363461BC07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCAyMDI2LTA1LTMwIGF0IDE3OjE2ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Ogo+IChOb3QgYSBmdWxsIHJldmlldywgYnV0IGEgZmV3IGRyaXZlLWJ5IGNvbW1lbnRzLikKPiAK
PiBPbiBTYXQgTWF5IDMwLCAyMDI2IGF0IDQ6MzUgUE0gQ0VTVCwgUGhpbGlwcCBTdGFubmVyIHdy
b3RlOgo+ID4gKyNbYWxsb3codW51c2VkX3Vuc2FmZSldCj4gCj4gV2hhdCBpcyB0aGlzIG5lZWRl
ZCBmb3I/CgpZb3Uga25vdyB0aGF0IDotUAoKPiAKPiA+ICtpbXBsPEY6IFNlbmQgKyBTeW5jICsg
RHJpdmVyRmVuY2VBbGxvd2VkRGF0YSwgQzogU2VuZCArIFN5bmM+IEZlbmNlQ3R4PEYsIEM+IHsK
PiAKPiA8c25pcD4KPiAKPiA+ICtpbXBsPEY6IFNlbmQgKyBTeW5jLCBDOiBTZW5kICsgU3luYz4g
UGlubmVkRHJvcCBmb3IgRmVuY2VDdHg8RiwgQz4gewo+ID4gK8KgwqDCoCBmbiBkcm9wKHNlbGY6
IFBpbjwmbXV0IFNlbGY+KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBgcmN1X2Jh
cnJpZXIoKWAgaXMgYWx3YXlzIHNhZmUgdG8gYmUgY2FsbGVkLgo+ID4gK8KgwqDCoMKgwqDCoMKg
IHVuc2FmZSB7IGJpbmRpbmdzOjpyY3VfYmFycmllcigpIH07Cj4gCj4gV2Ugc2hvdWxkIHByb2Jh
Ymx5IGFkZCBhIHNhZmUgZnVuY3Rpb24gZm9yIHRoaXMuCgpBQ0suCgo+IAo+ID4gK2ltcGw8VDog
RmVuY2VDYj4gRmVuY2VDYlJlZ2lzdHJhdGlvbjxUPiB7Cj4gPiArwqDCoMKgIC8vLyBSZWdpc3Rl
ciBhIGNhbGxiYWNrIG9uIGEgZmVuY2UuCj4gPiArwqDCoMKgIC8vLwo+ID4gK8KgwqDCoCAvLy8g
T24gc3VjY2VzcyB0aGUgY2FsbGJhY2sgaXMgcGlubmVkIGluIHBsYWNlIGFuZCB3aWxsIGZpcmUg
d2hlbiB0aGUgZmVuY2UKPiA+ICvCoMKgwqAgLy8vIHNpZ25hbHMuIE9uIGBBbHJlYWR5U2lnbmFs
ZWRgIHRoZSBjYWxsYmFjayBpcyByZXR1cm5lZCB0byB0aGUgY2FsbGVyIHNvCj4gPiArwqDCoMKg
IC8vLyB0aGF0IG93bmVkIHJlc291cmNlcyBjYW4gYmUgcmVjbGFpbWVkLgo+ID4gK8KgwqDCoCBw
dWIgZm4gbmV3PCdhPihmZW5jZTogJidhIEZlbmNlLCBjYWxsYmFjazogVCkgLT4gaW1wbCBQaW5J
bml0PFNlbGYsIENhbGxiYWNrRXJyb3I8VD4+ICsgJ2EKPiA+ICvCoMKgwqAgd2hlcmUKPiA+ICvC
oMKgwqDCoMKgwqDCoCBUOiAnYSwKPiA+ICvCoMKgwqAgewo+ID4gK8KgwqDCoMKgwqDCoMKgIC8v
IFVzZXMgYHBpbl9pbml0X2Zyb21fY2xvc3VyZWAgaW5zdGVhZCBvZiBgdHJ5X3Bpbl9pbml0IWAg
c28gdGhhdCBvbgo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIGAtRU5PRU5UYCAoYWxyZWFkeSBzaWdu
YWxlZCkgdGhlIGNhbGxiYWNrIGNhbiBiZSByZWFkIGJhY2sgZnJvbSB0aGUKPiA+ICvCoMKgwqDC
oMKgwqDCoCAvLyBwYXJ0aWFsbHktaW5pdGlhbGl6ZWQgc2xvdCBhbmQgcmV0dXJuZWQgdGhyb3Vn
aCB0aGUgZXJyb3IuCj4gCj4gU2VlbXMgYSBiaXQgb2RkIHRoYXQgdGhpcyBuZWVkcyBwaW5faW5p
dF9mcm9tX2Nsb3N1cmUoKS4gWW91IGNhbiBzdGlsbCB1c2UKPiB0cnlfcGluX2luaXQhKCkgd2l0
aCAmdGhpcyBpbiBTZWxmIGFuIGEgXzogaW5pdGlhbGl6ZXIgYXQgdGhlIGVuZCBpbiB0aGUgd29y
c3QKPiBjYXNlLiBCdXQgdGhlIGZlbmNlIGFuZCBjYWxsYmFjayBmaWVsZHMgc2hvdWxkIGJlIGZp
bmUgdG8gaW5pdGlhbGl6ZSAibm9ybWFsbHkiPwoKSSdsbCBpbnZlc3RpZ2F0ZSB0aGF0LgoKPiAK
PiA+ICvCoMKgwqDCoMKgwqDCoCAvLwo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFNBRkVUWTogYHBp
bl9pbml0X2Zyb21fY2xvc3VyZWAgcmVxdWlyZXM6Cj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gLSBP
biBgT2soKCkpYDogdGhlIHNsb3QgaXMgZnVsbHkgaW5pdGlhbGl6ZWQgYW5kIHZhbGlkIGZvciBg
RHJvcGAuCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gLSBPbiBgRXJyKF8pYDogdGhlIHNsb3QgaXMg
Y2xlYW4sIGkuZS46IG5vIHBhcnRpYWxseS1pbml0aWFsaXplZCBmaWVsZHMKPiA+ICvCoMKgwqDC
oMKgwqDCoCAvL8KgwqAgcmVtYWluLCBhbmQgdGhlIHNsb3QgY2FuIGJlIGRlYWxsb2NhdGVkIHdp
dGhvdXQgZHJvcHBpbmcuCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8KPiA+ICvCoMKgwqDCoMKgwqDC
oCAvLyBXZSB1cGhvbGQgdGhpcyBhcyBmb2xsb3dzOgo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIC0g
T24gc3VjY2VzczogYWxsIHRocmVlIGZpZWxkcyBhcmUgaW5pdGlhbGl6ZWQuIE9rKCgpKSBpcyBy
ZXR1cm5lZC4KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyAtIE9uIEVOT0VOVCAoYWxyZWFkeSBzaWdu
YWxlZCk6IGBjYWxsYmFja2AgYW5kIGBmZW5jZWAgYXJlIHJlYWQgYmFjawo+ID4gK8KgwqDCoMKg
wqDCoMKgIC8vwqDCoCBmcm9tIHRoZSBzbG90IHZpYSBgcHRyOjpyZWFkYCwgbGVhdmluZyB0aGUg
c2xvdCBjbGVhbi4gYGNiYCB3YXMKPiA+ICvCoMKgwqDCoMKgwqDCoCAvL8KgwqAgaW5pdGlhbGl6
ZWQgYnkgYGRtYV9mZW5jZV9hZGRfY2FsbGJhY2tgIChpdCBjYWxscwo+ID4gK8KgwqDCoMKgwqDC
oMKgIC8vwqDCoCBgSU5JVF9MSVNUX0hFQUQoJmNiLT5ub2RlKWAgZXZlbiBvbiBlcnJvciksIGJ1
dCBgY2JgIGlzCj4gPiArwqDCoMKgwqDCoMKgwqAgLy/CoMKgIGBPcGFxdWU8ZG1hX2ZlbmNlX2Ni
PmAgd2hpY2ggaGFzIG5vIGBEcm9wYCwgc28gbm90IGRyb3BwaW5nIGl0IGlzCj4gPiArwqDCoMKg
wqDCoMKgwqAgLy/CoMKgIGZpbmUuIFRoZSBjYWxsYmFjayBpcyByZXR1cm5lZCB0aHJvdWdoIGBB
bHJlYWR5U2lnbmFsZWQoVClgLgo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIC0gT24gb3RoZXIgZXJy
b3JzOiBzYW1lIGNsZWFudXAgYXMgRU5PRU5ULCBlcnJvciByZXR1cm5lZCBhcwo+ID4gK8KgwqDC
oMKgwqDCoMKgIC8vwqDCoCBgT3RoZXIoZSlgLgo+ID4gK8KgwqDCoMKgwqDCoMKgIHVuc2FmZSB7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5faW5pdF9mcm9tX2Nsb3N1cmUobW92ZSB8
c2xvdDogKm11dCBTZWxmfCB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxl
dCBzbG90X2NhbGxiYWNrID0gJnJhdyBtdXQgKCpzbG90KS5jYWxsYmFjazsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGV0IHNsb3RfZmVuY2UgPSAmcmF3IG11dCAoKnNsb3Qp
LmZlbmNlOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgc2xvdF9jYiA9
ICZyYXcgbXV0ICgqc2xvdCkuY2I7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8vIFdyaXRlIGNhbGxiYWNrIGFuZCBmZW5jZSBmaXJzdCDigJQgbXVzdCBiZSB2aXNp
YmxlIGJlZm9yZQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBkbWFfZmVu
Y2VfYWRkX2NhbGxiYWNrIG1ha2VzIHRoZSByZWdpc3RyYXRpb24gbGl2ZS4KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZTo6cHRyOjp3cml0ZShzbG90X2NhbGxiYWNrLCBj
YWxsYmFjayk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvcmU6OnB0cjo6
d3JpdGUoc2xvdF9mZW5jZSwgQVJlZjo6ZnJvbShmZW5jZSkpOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgcmV0ID0gdG9fcmVzdWx0KGJpbmRpbmdzOjpkbWFf
ZmVuY2VfYWRkX2NhbGxiYWNrKAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZlbmNlLmlubmVyLmdldCgpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE9wYXF1ZTo6Y2FzdF9pbnRvKHNsb3RfY2IpLAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNvbWUoU2VsZjo6ZG1hX2ZlbmNlX2NhbGxiYWNr
KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKSk7Cj4gPiArCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hdGNoIHJldCB7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT2soKCkpID0+IE9rKCgpKSwKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFcnIoZSkgPT4gewo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gUmVhZCBiYWNrIHdoYXQg
d2Ugd3JvdGUgdG8gbGVhdmUgdGhlIHNsb3QgY2xlYW4uCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgY2JfYmFjayA9IGNvcmU6OnB0cjo6cmVh
ZChzbG90X2NhbGxiYWNrKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGxldCBfZmVuY2VfYmFjayA9IGNvcmU6OnB0cjo6cmVhZChzbG90X2ZlbmNl
KTsKPiAKPiBXaGF0J3MgdGhlIHB1cnBvc2Ugb2YgX2ZlbmNlX2JhY2s/CgpSZWxpYy4gV2lsbCBy
ZXdvcmsuCgo+IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgZS50b19lcnJubygpID09IEVOT0VOVC50b19lcnJubygpIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRXJy
KENhbGxiYWNrRXJyb3I6OkFscmVhZHlTaWduYWxlZChjYl9iYWNrKSkKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVycihDYWxs
YmFja0Vycm9yOjpPdGhlcihlKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0pCj4gPiArwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoCB9Cj4g
PiArwqDCoMKgIC8vLyBTaWduYWwgdGhlIGZlbmNlLiBUaGlzIHdpbGwgaW52b2tlIGFsbCByZWdp
c3RlcmVkIGNhbGxiYWNrcy4KPiA+ICvCoMKgwqAgcHViIGZuIHNpZ25hbChzZWxmLCByZXM6IFJl
c3VsdCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBmZW5jZSA9IHNlbGYuYXNfcmF3KCk7Cj4g
PiArwqDCoMKgwqDCoMKgwqAgbGV0IG11dCBmZW5jZV9mbGFnczogdXNpemUgPSAwOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgIGxldCBmbGFnX3B0ciA9ICZyYXcgbXV0IGZlbmNlX2ZsYWdzOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFNBRkVUWTogT25jZSBhIGBEcml2ZXJGZW5jZWAgaXMgaW5p
dGlhbGl6ZWQsIHRoZSBpbm5lciBgZmVuY2VgIGlzCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gdmFs
aWQgYW5kIGluaXRpYWxpemVkLiBJdCBpcyB2YWxpZCB1bnRpbCB0aGUgcmVmY291bnQgZHJvcHMK
PiA+ICvCoMKgwqDCoMKgwqDCoCAvLyB0byAwLCB3aGljaCBjYW4gZWFybGllc3QgaGFwcGVuIG9u
Y2UgdGhlIGBEcml2ZXJGZW5jZWAgaGFzIGJlZW4gZHJvcHBlZC4KPiA+ICvCoMKgwqDCoMKgwqDC
oCB1bnNhZmUgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmluZGluZ3M6OmRtYV9mZW5j
ZV9sb2NrX2lycXNhdmUoZmVuY2UsIGZsYWdfcHRyKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmICFiaW5kaW5nczo6ZG1hX2ZlbmNlX2lzX3NpZ25hbGVkX2xvY2tlZChmZW5jZSkgewo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBsZXQgRXJyKGVycikgPSByZXMg
ewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpbmRpbmdzOjpk
bWFfZmVuY2Vfc2V0X2Vycm9yKGZlbmNlLCBlcnIudG9fZXJybm8oKSk7Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYmluZGluZ3M6OmRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKGZlbmNlKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpbmRpbmdzOjpk
bWFfZmVuY2VfdW5sb2NrX2lycXJlc3RvcmUoZmVuY2UsIGZsYWdfcHRyKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoCB9Cj4gCj4gUGxlYXNlIHVzZSBhIHNpbmdsZSB1bnNhZmUgYmxvY2sgcGVyIHVuc2Fm
ZSBmdW5jdGlvbiBjYWxsLCBoZXJlIGFuZCBpbiBhIGZldwo+IG90aGVyIHBsYWNlcy4KCklzIHRo
YXQgYW4gb2ZmaWNpYWwgcnVsZT8gSWYgc28sIHRoZSBsaW50ZXJzIHNob3VsZCBpbmZvcm0gYWJv
dXQgaXQuCgpBdCBmaXJzdCBnbGFuY2UsIEkgZG9uJ3Qgc2VlIGFueSBhZHZhbnRhZ2UgdG8gaXQg
YW5kIHRoZSBkaXNhZHZhbnRhZ2UKb2YgZ3JlYXRseSByZWR1Y2luZyByZWFkYWJpbGl0eS4KCj4g
Cj4gPiArwqDCoMKgIH0KPiA+ICt9Cj4gPiArCj4gPiArLy8gU0FGRVRZOiBGZW5jZXMgYXJlIGxp
dGVyYWxseSBkZXNpZ25lZCB0byBiZSBzaGFyZWQgYmV0d2VlbiB0aHJlYWRzLgo+ID4gK3Vuc2Fm
ZSBpbXBsPEY6IFNlbmQgKyBTeW5jLCBDOiBTZW5kICsgU3luYz4gU2VuZCBmb3IgRHJpdmVyRmVu
Y2U8RiwgQz4ge30KPiA+ICsKPiA+ICtpbXBsPEY6IFNlbmQgKyBTeW5jLCBDOiBTZW5kICsgU3lu
Yz4gRGVyZWYgZm9yIERyaXZlckZlbmNlPEYsIEM+IHsKPiA+ICvCoMKgwqAgdHlwZSBUYXJnZXQg
PSBGOwo+ID4gKwo+ID4gK8KgwqDCoCBmbiBkZXJlZigmc2VsZikgLT4gJlNlbGY6OlRhcmdldCB7
Cj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gU0FGRVRZOiBUaGFua3MgdG8gcmVmY291bnRpbmcsIGBk
YXRhYCBpcyBhbHdheXMgdmFsaWQgYXMgbG9uZyBhcyBgc2VsZmAgaXMuCj4gPiArwqDCoMKgwqDC
oMKgwqAgbGV0IGRhdGEgPSB1bnNhZmUgeyAmKnNlbGYuZGF0YS5hc19wdHIoKSB9Owo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgICZkYXRhLmRhdGEKPiA+ICvCoMKgwqAgfQo+ID4gK30KPiA+ICsK
PiA+ICsvLy8gQSBib3Jyb3dlZCBbYERyaXZlckZlbmNlYF0uIEFsbCB5b3UgY2FuIGRvIHdpdGgg
aXQgaXMgYWNjZXNzIHlvdXIgdXNlciBkYXRhCj4gPiArLy8vIGFuZCBvYnRhaW4gYSBbYEZlbmNl
YF0uCj4gPiArcHViIHN0cnVjdCBEcml2ZXJGZW5jZUJvcnJvdzxGOiBTZW5kICsgU3luYywgQzog
U2VuZCArIFN5bmM+IHsKPiAKPiBUaGlzIG1pc3NlcyB0aGUgbGlmZXRpbWUgYm91bmQsIHdoaWNo
IGlzIHRoZSBwdXJwb3NlIG9mIHRoaXMgc3RydWN0Lgo+IAo+ID4gK8KgwqDCoCAvLy8gVGhlIGFj
dHVhbCBjb250ZW50IG9mIHRoZSBmZW5jZS4gTGl2ZXMgaW4gYSByYXcgcG9pbnRlciBzbyB0aGF0
IGl0cwo+ID4gK8KgwqDCoCAvLy8gbWVtb3J5IGNhbiBiZSBtYW5hZ2VkIGluZGVwZW5kZW50bHku
IFZhbGlkIHVudGlsIGJvdGggdGhlIFtgRHJpdmVyRmVuY2VgXQo+ID4gK8KgwqDCoCAvLy8gYW5k
IGFsbCBhc3NvY2lhdGVkIFtgRmVuY2VgXXMgaGF2ZSBkaXNhcHBlYXJlZC4KPiA+ICvCoMKgwqAg
ZGF0YTogTm9uTnVsbDxEcml2ZXJGZW5jZURhdGE8RiwgQz4+LAo+IAo+IFdoeSBub3QgdXNlIE1h
bnVhbGx5RHJvcDxEcml2ZXJGZW5jZT4/IFRoaXMgd2F5IHlvdSB3b3VsZCBvbmx5IG5lZWQgYSBE
ZXJlZiBpbXBsCj4gdG8gJidhIERyaXZlckZlbmNlLgo+IAo+IFRoaXMgd2F5IHlvdSBiYXNpY2Fs
bHkgcmVpbXBsZW1lbnQgdGhlIERyaXZlckZlbmNlIHR5cGUganVzdCB3aXRob3V0IHRoZQo+IGRl
c3RydWN0b3IuCgpHb29kIGlkZWEsIHdpbGwgZG8uCgpQLgo=


