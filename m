Return-Path: <linux-media+bounces-65222-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gclvDD4XNGoEOQYAu9opvQ
	(envelope-from <linux-media+bounces-65222-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:05:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 789306A1769
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 18:05:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="NOo/dWtt";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65222-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65222-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBC0F3112E6C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89546331EC6;
	Thu, 18 Jun 2026 15:57:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFA2F8EA3;
	Thu, 18 Jun 2026 15:57:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798223; cv=none; b=kL+FQisonIDiUXKkuqXUAQx6lWyFGeFr4kMchRRY1S0+IClDnyF2oX0NKU9aps05aj2V8NZp7bLERxCEBElBbZsC99sHJnzc/RcEPl8D93tHD29543uSztGOH6nIdEPpIfS5pUtMZyRL1QVKpVuosJLhfWbrI2e6Io7qVruVIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798223; c=relaxed/simple;
	bh=6aizdFkIqLFEJ4z7XPhhns4usTTHn5FWq31bHu1viOM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gXNzaQy6sW8j0UBsjcFBIrf+7A/V6o0kaulKeiYFFZPZEfLN/yNkemrt9IR7v2ZP4sOPg6K5WZLAWAfjGfdaGY444YmWHSBq+3Vch3EU6kK5pKMPDci9gh32EoRnaRRigzOjtN5mOXccakVzHotqTAa9eyNVhr6re0tKjHQjYD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NOo/dWtt; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gh52C6y17z9tbP;
	Thu, 18 Jun 2026 17:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781798212; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6aizdFkIqLFEJ4z7XPhhns4usTTHn5FWq31bHu1viOM=;
	b=NOo/dWtt7vvHOgFy2KDZDg+KZ/YRuYr4OBJFSmKs5x/NtwBc8fnJr1D60Y702bXkZEcczn
	A4TPmv8CB7elRd4ODprKDHZ+TwTapAsRL0Z7uMp3QFbiWcop3sqG0c2E+PflhEpVM6fcjM
	UdRMFJpy7omv6ah/MX1UUmQvWGukoxMem7Z2hx20EnliUbVgWNUG6GkDtQMwF4lBbzk5NC
	6SBbJf9GkNzW3byGBrHByzXkMwVvMtLPgvFMxKnQr3ZbM7ecQVDQrUunGoGCoohHlMm/IO
	XpRA+HNRvfXvpzdjMnVUfNTTR9rwc/Ug7Pk7P2kzQ33KgirwZSXCRPcscPc0IA==
Message-ID: <1cfd56b7f1a166e25d6588d66a621524f3d983de.camel@mailbox.org>
Subject: Re: [PATCH] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 18 Jun 2026 17:56:44 +0200
In-Reply-To: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
References: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 58eddd6e67adae314d3
X-MBO-RS-META: seh515wnyz1d1petqa69u45wbazq4k6h
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65222-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 789306A1769

K0NjIERhbmlsbwoKT24gVGh1LCAyMDI2LTA2LTE4IGF0IDE1OjAzICswMTAwLCBBbmRyw6kgRHJh
c3ppayB3cm90ZToKPiBTaW5jZSBjb21taXQgNTQxYzhmMjQ2OGI5ICgiZG1hLWJ1ZjogZGV0YWNo
IGZlbmNlIG9wcyBvbiBzaWduYWwgdjMiKSwKPiBJJ20gc2VlaW5nIHRoZSBCVUdfT04oKSB0cmln
Z2VyaW5nIGluIGRybV9jcnRjJ3MgZmVuY2VfdG9fY3J0YygpIHZpYQo+IGRybV9jcnRjX2ZlbmNl
X2dldF9kcml2ZXJfbmFtZSgpIHJlZ3VsYXJseToKPiAKPiDCoMKgwqAgQ2FsbCB0cmFjZToKPiDC
oMKgwqDCoCBwYW5pYysweDU4LzB4NWMKPiDCoMKgwqDCoCBkaWUrMHgxNjAvMHgxNzgKPiDCoMKg
wqDCoCBidWdfYnJrX2hhbmRsZXIrMHg3MC8weGE0Cj4gwqDCoMKgwqAgY2FsbF9lbDFfYnJlYWtf
aG9vaysweDNjLzB4MWEwCj4gwqDCoMKgwqAgZG9fZWwxX2JyazY0KzB4MjQvMHg3NAo+IMKgwqDC
oMKgIGVsMV9icms2NCsweDM0LzB4NTQKPiDCoMKgwqDCoCBlbDFoXzY0X3N5bmNfaGFuZGxlcisw
eDgwLzB4ZmMKPiDCoMKgwqDCoCBlbDFoXzY0X3N5bmMrMHg4NC8weDg4Cj4gwqDCoMKgwqAgZHJt
X2NydGNfZmVuY2VfZ2V0X2RyaXZlcl9uYW1lKzB4NjAvMHg2OCAoUCkKPiDCoMKgwqDCoCBzeW5j
X2ZpbGVfZ2V0X25hbWUrMHgxODQvMHg0NWMKPiDCoMKgwqDCoCBzeW5jX2ZpbGVfaW9jdGwrMHg0
MDQvMHhmNzAKPiDCoMKgwqDCoCBfX2FybTY0X3N5c19pb2N0bCsweDEyNC8weDFkYwo+IAo+IFRo
aXMgbG9va3MgdG8gYmUgY2F1c2VkIGJ5IGEgY29kZSBmbG93IHNpbWlsYXIgdG8gdGhlIGZvbGxv
d2luZzoKPiAKPiArKysgc25pcCArKysKPiB0aHJlYWQgQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRocmVhZCBCCj4gCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlvY3RsKFNZTkNfSU9DX0ZJTEVfSU5GTykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3luY19m
aWxlX2lvY3RsKCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3luY19maWxlX2dldF9uYW1lKCkKPiBkbWFf
ZmVuY2Vfc2lnbmFsX3RpbWVzdGFtcF9sb2NrZWQoKcKgIGRtYV9mZW5jZV9kcml2ZXJfbmFtZSgp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHMgPSByY3VfZGVyZWZlcmVuY2UoZmVuY2UtPm9wcykK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghZG1hX2ZlbmNlX3Rlc3Rfc2lnbmFsZWRfZmxhZygp
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wcy0+Z2V0X2RyaXZlcl9uYW1lKGZlbmNlKSBp
LmUuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2NydGNfZmVuY2VfZ2V0X2RyaXZlcl9u
YW1lKCkKPiB0ZXN0X2FuZF9zZXRfYml0KFNJR05BTEVEKQo+IFJDVV9JTklUX1BPSU5URVIoZmVu
Y2UtPm9wcywgTlVMTCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2NydGNfZmVuY2VfZ2V0X2RyaXZl
cl9uYW1lKCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJVR19PTihyY3VfYWNjZXNzX3BvaW50ZXIo
ZmVuY2UtPm9wcykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIT0gJmRybV9j
cnRjX2ZlbmNlX29wcykKCk5vdyB0aGlzIGxvb2tzIGxpa2UgYSB2ZXJ5IHNpbWlsYXIgcHJvYmxl
bSB0aGF0IEkgaGF2ZSByZWNlbnRseSBiZWVuCmNvbmNlcm5lZCB3aXRoOgoKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjYwNjEyMTA0MjUxLjIyNjQ3MDctMi1waGFzdGFAa2Vy
bmVsLm9yZy8KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC9mYTBkYzk3NTdiZjgz
NDM1MTZjNGIxNTZhMmI3MGVjOTFiNjRlZjhmLmNhbWVsQG1haWxib3gub3JnLwoKCkkgY29udGlu
dWUgdG8gYmVsaWV2ZSBiZWNhdXNlIG9mIGJ1Z3MgbGlrZSB0aGlzIGFuZCB0aGUgb25lcyBJIGhh
dmUKcXVvdGVkIGluIHRoZSB0aHJlYWRzIGFib3ZlIHRoZSByb2J1c3RuZXNzIG9mIHRoZSBrZXJu
ZWwgY291bGQgYmUKZ3JlYXRseSBpbXByb3ZlZCBpZiB3ZSBjb3VsZCBnZXQgZG1hX2ZlbmNlIGZ1
bGx5IHN5bmNocm9uaXplZCB3aXRoIGl0cwpsb2NrLgoKClRoYXQgc2FpZDoKCj4gKysrIHNuYXAg
KysrCj4gCj4gSSBzZWUgdHdvIHdheXMgdG8gcmVzb2x2ZSB0aGlzOgo+IGEpIHNpbXBseSBkcm9w
IHRoZSBCVUdfT04oKS4gSXQgY2FuIG5vdCB3b3JrIGFueW1vcmUgc2luY2UgYWJvdmUKPiDCoMKg
IGNvbW1pdCwgYXMgaXQgaXMgcmFjeSBub3cuCj4gYikgcGFzcyB0aGUgb3JpZ2luYWwgJ29wcycg
cG9pbnRlciBvYnRhaW5lZCBpbiBkbWFfZmVuY2VfZHJpdmVyX25hbWUoKQo+IMKgwqAgdG8gYWxs
IGNhbGxlZXMuCj4gCj4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIG9wdGlvbiBhKSwgYXMgYmVjYXVz
ZToKPiAqIEkgZG9uJ3Qgc2VlIG11Y2ggYmVuZWZpdCBpbiBwYXNzaW5nIHRoZSBleHRyYSBwb2lu
dGVyIGp1c3QgZm9yIHRoaXMKPiDCoCBCVUdfT04oKSB0byB3b3JrLgo+ICogUmVxdWlyaW5nIHRo
ZSBkbWFfZmVuY2Vfb3BzIGluIHRob3NlIGNhbGxiYWNrcyBpcyBhbiBpbXBsZW1lbnRhdGlvbgo+
IMKgIGRldGFpbCBvZiB0aGUgZHJtX2NydGMgZHJpdmVyLCBhbmQgdGhlcmVmb3JlIHVwcGVyIGxh
eWVycyBzaG91bGRuJ3QKPiDCoCBoYXZlIHRvIGNhcmUgYWJvdXQgdGhhdC4KPiAqIFRoZSBleGlz
dGVuY2Ugb2YgdGhlIEJVR19PTigpIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGNvbnNpc3RlbnQgd2l0
aAo+IMKgIGltcGxlbWVudGF0aW9ucyBvZiA6OmdldF9kcml2ZXJfbmFtZSgpIG9yIDo6Z2V0X3Rp
bWVsaW5lX25hbWUoKSBpbgo+IMKgIHRoZSBtYWpvcml0eSBvZiBvdGhlciBEUk0gZHJpdmVycyBp
biB0aGUgZmlyc3QgcGxhY2UuIFRob3NlIHRoYXQgZG8KPiDCoCBoYXZlIGEgc2ltaWxhciBCVUdf
T04oKSAoaTkxNSwgeGUpIHByb2JhYmx5IGFsc28gbmVlZCBhbiB1cGRhdGUKPiDCoCBzaW1pbGFy
IHRvIHRoaXMgcGF0Y2ggaGVyZSBidXQgSSdtIG5vdCBpbiBhIHBvc2l0aW9uIHRvIHRlc3QgdGhv
c2UuCj4gCj4gTm90ZSB0aGF0IHRoZSBhZGphY2VudCBkcm1fY3J0Y19mZW5jZV9nZXRfdGltZWxp
bmVfbmFtZSgpIGhhcyB0aGUgc2FtZQo+IHByb2JsZW0gYW5kIGlzIGZpeGVkIGJ5IHRoaXMgcGF0
Y2ggYXMgd2VsbC4KPiAKPiBGaXhlczogNTQxYzhmMjQ2OGI5ICgiZG1hLWJ1ZjogZGV0YWNoIGZl
bmNlIG9wcyBvbiBzaWduYWwgdjMiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxh
bmRyZS5kcmFzemlrQGxpbmFyby5vcmc+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2Ny
dGMuYyB8IDExICsrKy0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Ny
dGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jCj4gaW5kZXggNjNlYWQ4YmE2NzU2Li4z
MWM4NjM2ZTc0NjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGMuYwo+IEBAIC03Myw2ICs3Myw5IEBACj4gwqAg
KiAmZHJtX21vZGVfY29uZmlnX2Z1bmNzLmF0b21pY19jaGVjay4KPiDCoCAqLwo+IMKgCj4gKyNk
ZWZpbmUgZmVuY2VfdG9fY3J0YyhmKSBjb250YWluZXJfb2YoKGYpLT5leHRlcm5fbG9jaywgXAo+
ICsJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2NydGMsIGZlbmNlX2xvY2spCgpJIGFncmVlIHRo
YXQgbWFjcm9zIHNob3VsZCBiZSBhdm9pZGVkIGlmIHBvc3NpYmxlLgoKPiArCj4gwqAvKioKPiDC
oCAqIGRybV9jcnRjX2Zyb21faW5kZXggLSBmaW5kIHRoZSByZWdpc3RlcmVkIENSVEMgYXQgYW4g
aW5kZXgKPiDCoCAqIEBkZXY6IERSTSBkZXZpY2UKPiBAQCAtMTU0LDE0ICsxNTcsNiBAQCBzdGF0
aWMgdm9pZCBkcm1fY3J0Y19jcmNfZmluaShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gwqAjZW5k
aWYKPiDCoH0KPiDCoAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgZHJtX2Ny
dGNfZmVuY2Vfb3BzOwo+IC0KPiAtc3RhdGljIHN0cnVjdCBkcm1fY3J0YyAqZmVuY2VfdG9fY3J0
YyhzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiAtewo+IC0JQlVHX09OKHJjdV9hY2Nlc3NfcG9p
bnRlcihmZW5jZS0+b3BzKSAhPSAmZHJtX2NydGNfZmVuY2Vfb3BzKTsKCisxCgpCVUdfT04gaXMg
bW9yZSBvciBsZXNzIGRlcHJlY2F0ZWQgYW5kIHNob3VsZCBub3QgYmUgdXNlZCBhbnltb3JlLiBU
aGVyZQpuZWVkcyB0byBiZSBib21iYXN0aWMganVzdGlmaWNhdGlvbiBmb3Igc2hvb3RpbmcgZG93
biB0aGUgZW50aXJlCmtlcm5lbC4KCgpQLgoKPiAtCXJldHVybiBjb250YWluZXJfb2YoZmVuY2Ut
PmV4dGVybl9sb2NrLCBzdHJ1Y3QgZHJtX2NydGMsIGZlbmNlX2xvY2spOwo+IC19Cj4gLQo+IMKg
c3RhdGljIGNvbnN0IGNoYXIgKmRybV9jcnRjX2ZlbmNlX2dldF9kcml2ZXJfbmFtZShzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSkKPiDCoHsKPiDCoAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBmZW5j
ZV90b19jcnRjKGZlbmNlKTsKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogZTJjYWUwMGMwNWQxOTY0
OTFjMzE4MTk2NzkyMjk3ZjJkZmJhYTAyYwo+IGNoYW5nZS1pZDogMjAyNjA2MTgtbGludXgtZHJt
X2NydGNfZml4Mi0yM2E3YzM1NGE0MTIKPiAKPiBCZXN0IHJlZ2FyZHMsCg==


