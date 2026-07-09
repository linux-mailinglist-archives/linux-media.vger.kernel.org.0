Return-Path: <linux-media+bounces-67152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0jV+OkKbT2qvkwIAu9opvQ
	(envelope-from <linux-media+bounces-67152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:59:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C61EB731527
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:59:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=SyP27AtA;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67152-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67152-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B32C930656DD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4912343BE;
	Thu,  9 Jul 2026 12:48:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A02217704;
	Thu,  9 Jul 2026 12:48:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601313; cv=none; b=kEkJ6BB+It/f3yZtLnEGxbU1tMrJkF4nXg+7liOfmC2N9MnsqXcC+OQy0QxyJXWFXo9flDRk38EIja6765aKbc6iQyXKSqdqSOavV+CroK3AuxAOYdNRAdHuqGx/7v90Hip/J2kFUXG8ztM2yDBwXyphSmMyrqvB35aL1ZH6bFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601313; c=relaxed/simple;
	bh=Q8F7Ydf4iiYgUnPjio2guFDq/pTESz0XaND2UttaFp0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pRIn7LdXAs/tKYhLQr6yD3iq9g9kDuIFz4oFLKproozyTUhwyA7WJJlvW5rBigbvNZp+sq9z9xwX1kiO60lMb2XsIDlX28Yjt+ktX4lS2Kd5dNuk1avcfavnkmdMKHMT/1M/mZAQLUDqydupnlM+HUxKWMBl3upEv8MQ5LJ9w5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SyP27AtA; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwvs71btnzKvyK;
	Thu, 09 Jul 2026 14:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783601307; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8F7Ydf4iiYgUnPjio2guFDq/pTESz0XaND2UttaFp0=;
	b=SyP27AtACus3s2PPrUtLG6txMXppuoTZdFw7ziYA5Z1RzHigp+Y6NhJ2WYnUZvZXlz7TH/
	DDdLeRWvbc6x0wbFZ9sKXfa1COdqMC8lmBOjxqiubcgXH/rR4zi7XVn0Q+HwxhjYlcd0wr
	xzfOXM8U6phtPwGqmule4jWsbOl4PTLa2D2NxcwO/NFarWppn2RL69SbaBY5GxVEApwLtV
	ct4wATrPU7fEoRj9WIpq3WtmnokJBJqK0J3mFthb+dTebJnUw+GsisYe7NndtxdeuAIEtX
	fKh1zDYS7qY2bMiguw3bMMfr5clHK5L+xs/n/XAhRmpwGLcNpqqnKtLggXGURA==
Message-ID: <00bb53bf021920b2387f8f7930975b8e01d25aca.camel@mailbox.org>
Subject: Re: [PATCH v2 2/2] drm/drm_crtc: fix race with dma_fence_signal()
 in ::get_driver_name()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Thu, 09 Jul 2026 14:48:19 +0200
In-Reply-To: <20260708-linux-drm_crtc_fix2-v2-2-cf72be75d75a@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
	 <20260708-linux-drm_crtc_fix2-v2-2-cf72be75d75a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 6d60292ef67eb0da134
X-MBO-RS-META: 78sfwghyroxtiaygf859n8nu1dog9z6u
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-67152-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C61EB731527

T24gV2VkLCAyMDI2LTA3LTA4IGF0IDE2OjIyICswMTAwLCBBbmRyw6kgRHJhc3ppayB3cm90ZToK
PiBTaW5jZSBjb21taXQgNTQxYzhmMjQ2OGI5ICgiZG1hLWJ1ZjogZGV0YWNoIGZlbmNlIG9wcyBv
biBzaWduYWwgdjMiKSwKPiBJJ20gc2VlaW5nIHRoZSBCVUdfT04oKSB0cmlnZ2VyaW5nIGluIGRy
bV9jcnRjJ3MgZmVuY2VfdG9fY3J0YygpIHZpYQo+IGRybV9jcnRjX2ZlbmNlX2dldF9kcml2ZXJf
bmFtZSgpIHJlZ3VsYXJseToKPiAKPiDCoMKgwqAgQ2FsbCB0cmFjZToKPiDCoMKgwqDCoCBwYW5p
YysweDU4LzB4NWMKPiDCoMKgwqDCoCBkaWUrMHgxNjAvMHgxNzgKPiDCoMKgwqDCoCBidWdfYnJr
X2hhbmRsZXIrMHg3MC8weGE0Cj4gwqDCoMKgwqAgY2FsbF9lbDFfYnJlYWtfaG9vaysweDNjLzB4
MWEwCj4gwqDCoMKgwqAgZG9fZWwxX2JyazY0KzB4MjQvMHg3NAo+IMKgwqDCoMKgIGVsMV9icms2
NCsweDM0LzB4NTQKPiDCoMKgwqDCoCBlbDFoXzY0X3N5bmNfaGFuZGxlcisweDgwLzB4ZmMKPiDC
oMKgwqDCoCBlbDFoXzY0X3N5bmMrMHg4NC8weDg4Cj4gwqDCoMKgwqAgZHJtX2NydGNfZmVuY2Vf
Z2V0X2RyaXZlcl9uYW1lKzB4NjAvMHg2OCAoUCkKPiDCoMKgwqDCoCBzeW5jX2ZpbGVfZ2V0X25h
bWUrMHgxODQvMHg0NWMKPiDCoMKgwqDCoCBzeW5jX2ZpbGVfaW9jdGwrMHg0MDQvMHhmNzAKPiDC
oMKgwqDCoCBfX2FybTY0X3N5c19pb2N0bCsweDEyNC8weDFkYwo+IAo+IFRoaXMgbG9va3MgdG8g
YmUgY2F1c2VkIGJ5IGEgY29kZSBmbG93IHNpbWlsYXIgdG8gdGhlIGZvbGxvd2luZzoKPiAKPiAr
Kysgc25pcCArKysKPiB0aHJlYWQgQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRocmVhZCBCCj4gCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvY3Rs
KFNZTkNfSU9DX0ZJTEVfSU5GTykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3luY19maWxlX2lvY3RsKCkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3luY19maWxlX2dldF9uYW1lKCkKPiBkbWFfZmVuY2Vfc2lnbmFs
X3RpbWVzdGFtcF9sb2NrZWQoKcKgIGRtYV9mZW5jZV9kcml2ZXJfbmFtZSgpCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBvcHMgPSByY3VfZGVyZWZlcmVuY2UoZmVuY2UtPm9wcykKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICghZG1hX2ZlbmNlX3Rlc3Rfc2lnbmFsZWRfZmxhZygpKQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG9wcy0+Z2V0X2RyaXZlcl9uYW1lKGZlbmNlKSBpLmUuCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZHJtX2NydGNfZmVuY2VfZ2V0X2RyaXZlcl9uYW1lKCkKPiB0ZXN0
X2FuZF9zZXRfYml0KFNJR05BTEVEKQo+IFJDVV9JTklUX1BPSU5URVIoZmVuY2UtPm9wcywgTlVM
TCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2NydGNfZmVuY2VfZ2V0X2RyaXZlcl9uYW1lKCkKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEJVR19PTihyY3VfYWNjZXNzX3BvaW50ZXIoZmVuY2UtPm9wcykK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIT0gJmRybV9jcnRjX2ZlbmNlX29w
cykKPiArKysgc25hcCArKysKPiAKPiBJIHNlZSB0d28gd2F5cyB0byByZXNvbHZlIHRoaXM6Cj4g
YSkgc2ltcGx5IGRyb3AgdGhlIEJVR19PTigpLiBJdCBjYW4gbm90IHdvcmsgYW55bW9yZSBzaW5j
ZSBhYm92ZQo+IMKgwqAgY29tbWl0LCBhcyBpdCBpcyByYWN5IG5vdy4KPiBiKSBwYXNzIHRoZSBv
cmlnaW5hbCAnb3BzJyBwb2ludGVyIG9idGFpbmVkIGluIGRtYV9mZW5jZV9kcml2ZXJfbmFtZSgp
Cj4gwqDCoCB0byBhbGwgY2FsbGVlcy4KPiAKPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgb3B0aW9u
IGEpLCBhcyBiZWNhdXNlOgo+ICogSSBkb24ndCBzZWUgbXVjaCBiZW5lZml0IGluIHBhc3Npbmcg
dGhlIGV4dHJhIHBvaW50ZXIganVzdCBmb3IgdGhpcwo+IMKgIEJVR19PTigpIHRvIHdvcmsuCj4g
KiBSZXF1aXJpbmcgdGhlIGRtYV9mZW5jZV9vcHMgaW4gdGhvc2UgY2FsbGJhY2tzIGlzIGFuIGlt
cGxlbWVudGF0aW9uCj4gwqAgZGV0YWlsIG9mIHRoZSBkcm1fY3J0YyBkcml2ZXIsIGFuZCB0aGVy
ZWZvcmUgdXBwZXIgbGF5ZXJzIHNob3VsZG4ndAo+IMKgIGhhdmUgdG8gY2FyZSBhYm91dCB0aGF0
Lgo+ICogVGhlIGV4aXN0ZW5jZSBvZiB0aGUgQlVHX09OKCkgZG9lc24ndCBhcHBlYXIgdG8gYmUg
Y29uc2lzdGVudCB3aXRoCj4gwqAgaW1wbGVtZW50YXRpb25zIG9mIDo6Z2V0X2RyaXZlcl9uYW1l
KCkgb3IgOjpnZXRfdGltZWxpbmVfbmFtZSgpIGluCj4gwqAgdGhlIG1ham9yaXR5IG9mIG90aGVy
IERSTSBkcml2ZXJzIGluIHRoZSBmaXJzdCBwbGFjZS4gVGhvc2UgdGhhdCBkbwo+IMKgIGhhdmUg
YSBzaW1pbGFyIEJVR19PTigpIChpOTE1LCB4ZSkgcHJvYmFibHkgYWxzbyBuZWVkIGFuIHVwZGF0
ZQo+IMKgIHNpbWlsYXIgdG8gdGhpcyBwYXRjaCBoZXJlIGJ1dCBJJ20gbm90IGluIGEgcG9zaXRp
b24gdG8gdGVzdCB0aG9zZS4KPiAqIFVzaW5nIEJVRygpIGFuZCBmcmllbmRzIHRvIHRha2UgZG93
biB0aGUgc3lzdGVtIGlzIGFuIHVuYWNjZXB0YWJsZQo+IMKgIHdheSB0byBoYW5kbGUgYSBmYWls
dXJlIGFzIGV2aWRlbmNlZCBieSBtYW55IHRocmVhZHMgb24gTEtNTCBhbmQgYWxzbwo+IMKgIGlu
IHRoZSBrZXJuZWwgY29kaW5nIHN0eWxlLiBIZXJlLCB0aGUgY2hlY2sgd2FzIHByZXN1bWFibHkg
YWRkZWQgZm9yCj4gwqAgZGV0ZWN0aW5nIHdoZW4gc29tZXRoaW5nIHBhc3NlcyBhbiBpbnZhbGlk
IHBvaW50ZXIsIGJ1dCB0aGF0IGRvZXMgbm90Cj4gwqAgaGFwcGVuIC0gYW5kIGlmIGl0IGNvdWxk
LCBncmFjZWZ1bGx5IGhhbmRsaW5nIHRoYXQgc2l0dWF0aW9uIHdvdWxkIGJlCj4gwqAgbW9yZSBh
cHByb3ByaWF0ZS4KCkkgdGhpbmsgaXQgd2FzIHRoZXJlIHRvIGRldGVjdCB3cm9uZyBmZW5jZXMu
CgpJIHRoaW5rIHRoYXQgZW50aXJlIHVzYWdlIGlzIGVmZmVjdGl2ZWx5IGludmFsaWQgc2luY2Ug
Q2hyaXN0aWFuJ3MKcmV3b3JrLgoKPiAKPiBOb3RlIHRoYXQgdGhlIGFkamFjZW50IGRybV9jcnRj
X2ZlbmNlX2dldF90aW1lbGluZV9uYW1lKCkgaGFzIHRoZSBzYW1lCj4gcHJvYmxlbSBhbmQgaXMg
Zml4ZWQgYnkgdGhpcyBwYXRjaCBhcyB3ZWxsLgoKbml0OiBJdCdzIGNvb2wgdG8gc2VlIGZvbGtz
IHdyaXRlIGRldGFpbGVkIGNvbW1pdCBtZXNzYWdlcywgYnV0IEkgdGhpbmsKaW4gdGhpcyBjYXNl
IGl0IGlzIHZlcnkgdmVyYm9zZS4gVGhlIHByZXNlbnRhdGlvbiBvZiB0aGUgc29sdXRpb24tCm9w
dGlvbnMgSU1PIGlzIG1vcmUgc29tZXRoaW5nIGZvciBhIGNvbW1lbnQgaW4gdGhlIG1haWxpbmcg
bGlzdCA7KQoKVGhlIGlzc3VlIGF0IGhhbmQgaXMgcmF0aGVyIHNpbXBsZSwgQUZBSUNTLiBGZW5j
ZXMgbm93IHNldCB0aGUgb3BzCnBvaW50ZXIgdG8gTlVMTCBvbiBzaWduYWwsIHdoaWNoIHdhc24n
dCB0aGUgY2FzZSBpbiB0aGUgcGFzdCwgd2hpY2gKdHJpZ2dlcnMgdGhlIEJVR19PTiwgd2hpY2gg
c2hvdWxkbid0IGJlIHVzZWQgYW55bW9yZSBhbnl3YXlzLiBUaGF0J3MKdGhlIGNvcmUgb2YgdGhl
IGlzc3VlLgoKVGhlIG9wcyBwb2ludGVyIG5ldmVyIGNoYW5nZWQgaW4gdGhlIHBhc3QuIEkgc3Vw
cG9zZSBpdCB3YXMgdGhlcmUgdG8KY2hlY2sgd2hldGhlciBhIHdyb25nIGZlbmNlIHdhcyBwYXNz
ZWQgdG8gdGhlIGNvbnRhaW5lcl9vZigpLgoKPiAKCitDYyBzdGFibGU/Cgo+IEZpeGVzOiA1NDFj
OGYyNDY4YjkgKCJkbWEtYnVmOiBkZXRhY2ggZmVuY2Ugb3BzIG9uIHNpZ25hbCB2MyIpCj4gU2ln
bmVkLW9mZi1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4KClJl
dmlld2VkLWJ5OiBQaGlsaXBwIFN0YW5uZXIgPHBoYXN0YUBrZXJuZWwub3JnPgoKPiAKPiAtLS0K
PiB2MjoKPiAtIGRvbid0IHR1cm4gZmVuY2VfdG9fY3J0YygpIGludG8gbWFjcm8KPiAtIHVwZGF0
ZSBjb21taXQgbWVzc2FnZSB0byBpbmNsdWRlIHJlZmVyZW5jZSB0byB1bmFjY2VwdGFibGUgdXNl
IG9mIEJVRwo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjLmMgfCAzIC0tLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jcnRjLmMKPiBpbmRleCBk
NTVmMTM3N2VjMzYuLjM2YWU1MGRkZjUyNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jCj4gQEAgLTE1NCwx
MSArMTU0LDggQEAgc3RhdGljIHZvaWQgZHJtX2NydGNfY3JjX2Zpbmkoc3RydWN0IGRybV9jcnRj
ICpjcnRjKQo+IMKgI2VuZGlmCj4gwqB9Cj4gwqAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFf
ZmVuY2Vfb3BzIGRybV9jcnRjX2ZlbmNlX29wczsKPiAtCj4gwqBzdGF0aWMgc3RydWN0IGRybV9j
cnRjICpmZW5jZV90b19jcnRjKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+IMKgewo+IC0JQlVH
X09OKHJjdV9hY2Nlc3NfcG9pbnRlcihmZW5jZS0+b3BzKSAhPSAmZHJtX2NydGNfZmVuY2Vfb3Bz
KTsKPiDCoAlyZXR1cm4gY29udGFpbmVyX29mKGZlbmNlLT5leHRlcm5fbG9jaywgc3RydWN0IGRy
bV9jcnRjLCBmZW5jZV9sb2NrKTsKPiDCoH0KPiDCoAo=


