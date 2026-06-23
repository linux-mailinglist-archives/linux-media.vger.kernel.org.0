Return-Path: <linux-media+bounces-65465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YF/CFftvOmoG9AcAu9opvQ
	(envelope-from <linux-media+bounces-65465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:37:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CB6B6C1A
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:37:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="hG1D/dwv";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65465-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65465-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B1A93049E25
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 11:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076133D4133;
	Tue, 23 Jun 2026 11:37:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C88371053
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 11:37:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214623; cv=none; b=RiJL3WA52F+cP5/W/ZnB9nehZ4Xw2ffUEjZuKqcTK6NagZEzauIIaLO18qaEYnq2gpPoc3OZp3xfnkVUlyqsyPS1XsWknlaOqaL7pPOt4AGNlCGXDtdVCiJbHUU0ly5LjACqFBJxUn3bvZdyXaoiMsjiqgEl5Y8gcQRQtK9Ywj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214623; c=relaxed/simple;
	bh=vrJY9tPoVNjhWds3xBnPrrXJRaSMY2w+oQ1XUr+IdIA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VSCZ4ZLBqT3KBVL31beXInTFjoAFh9bRNLS9JQ23cXY7Wjk2XGR60SZ/2vnI4Jsv4nlKUU96OmClWHLkXTW5IvIwSuthGIbGtSEtIVAntpQIBgcXsqNTFfrGT3Sbxaas/Yof1aOIub3PMbo9A835YCmCrh1CM4oONLBi4XYYjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hG1D/dwv; arc=none smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec450b950dso804791466b.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782214620; x=1782819420; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vrJY9tPoVNjhWds3xBnPrrXJRaSMY2w+oQ1XUr+IdIA=;
        b=hG1D/dwvp5HamvL7C9CZPVRuTmyDx+ihX6vaJCo9ezZTgKEjTqBisjaPGx2rlNOyVs
         q/Na1WULYm7q31HMvhThk+FcSCHTz9MC4o+uycinedBkBTOHPxpGOtfoog5J2d5/RmBo
         7Kqj2CH7CKb7Nc92ycaw8jJ08I0Rs0hNbZAkUADCGLCSKehSHsB2QOOA7WjhhkkrfeTT
         G3ehrlCWC2w1og5iPlr/971ujTvnJyI6pBwdTucegxrCZI8guSQirdcoezo1NwtXIPzj
         yR8b5xUEr3/67TwmyUnsiguxkWxvEsr5QU+B1a6FAT8xJH88cW/Mx20711z/njubyIDO
         8ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214620; x=1782819420;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrJY9tPoVNjhWds3xBnPrrXJRaSMY2w+oQ1XUr+IdIA=;
        b=E3EgCeYCOHbZm4f7G1vBtUqji7ij8HZ1f9I+ieEjvIxki8ZU1dDICGFhY4WK5mGbTQ
         HAa7kitS4WcbD9Uv+W2oLN85w+LWpx1C871TkKYMMTOAgFq/P/+rYApMXRyDrxRMe0he
         kT3Ll4Ul7UzLKc6UgtXc89KBSKPRY1Kj1xuR6yJSvJJNyCCmiYAcD02C4o90ne00aNjg
         j+3CXglnkdC+LUDA4vgsh+mgo5UVRDZyXqVbmfIgzgsdRt9w670cwfPDozilzVYQlsUN
         yOn3JCwznnNxOraQGuO2GG+leAi1O4FnCPeWIEOEHIgYki2JAcA4Gsu1EC19VAt2zXaU
         dOTw==
X-Forwarded-Encrypted: i=1; AFNElJ9EnbGFPuToHFl1mqMzrOxDm3Lj/OW4aT5ayHCwO3SDzUhK7E2r/TQRwVyVuwND2afVd4BmaHcedtiupg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGCQgHESwHHFzTA6/Zb8ew22MdJNM0Ne1v5/SGrsfPRku8eHP
	NzMYR7kd+VIruyvTqpsuSYe6McuuxONwzpQXbOXAKB03lkFKH7z5xuAftwq3VZr6XHg=
X-Gm-Gg: AfdE7cn5cwTjblasggGSYcZpcMkSteffciAcaATpE8v8Nwujfp1dF6x3hrKdiRaWYrS
	JmWDve5amKGbLAzB4/jwCmuSyWmmCeZwDFdEtfo3349VKfP4utVolGTZVbSMSs8frKyf4X4hU8P
	WBZcoBlGKOamWKzzLkpM/MX3diP9mKfdzYuuw4pDnhL3yoSYFu8c+10d4l/9qcwYsV8EwMHkm8Q
	pJOX9b/D3RMhp5wc0P4+0DEb//yjoqgNvJRoRPdUMRxom8weshYArs73P+vHqfCw8IYW5mLSPA4
	WYyQm+9hAqwMK5hZO3hFea6yyfW8fYEcSFGaoAy0LGJcPH9PbnpFgjZlK6qZJG1glDHFFtIHIAT
	FOUtnJ4nL7mfApgtyhZroZQ+1M0NRaLLkt6bnHcYjBu+0Mp6aRIJbw6dubo2CxYBiDRqfi7x3Q7
	gPIWto6AKuK5g7HQMMa7TeTVpncBQ12g==
X-Received: by 2002:a17:907:3d0e:b0:be2:7f13:8e33 with SMTP id a640c23a62f3a-c107ff8ee16mr115376566b.45.1782214619931;
        Tue, 23 Jun 2026 04:36:59 -0700 (PDT)
Received: from draszik.lan ([212.129.77.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm502806066b.62.2026.06.23.04.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:36:59 -0700 (PDT)
Message-ID: <6483098adae29787862473e39b1f9cf3c3f16625.camel@linaro.org>
Subject: Re: [PATCH] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: phasta@kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com
Date: Tue, 23 Jun 2026 12:37:02 +0100
In-Reply-To: <1cfd56b7f1a166e25d6588d66a621524f3d983de.camel@mailbox.org>
References: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
	 <1cfd56b7f1a166e25d6588d66a621524f3d983de.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65465-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A85CB6B6C1A

SGksCgpPbiBUaHUsIDIwMjYtMDYtMTggYXQgMTc6NTYgKzAyMDAsIFBoaWxpcHAgU3Rhbm5lciB3
cm90ZToKPiArQ2MgRGFuaWxvCj4gCj4gT24gVGh1LCAyMDI2LTA2LTE4IGF0IDE1OjAzICswMTAw
LCBBbmRyw6kgRHJhc3ppayB3cm90ZToKPiA+IFNpbmNlIGNvbW1pdCA1NDFjOGYyNDY4YjkgKCJk
bWEtYnVmOiBkZXRhY2ggZmVuY2Ugb3BzIG9uIHNpZ25hbCB2MyIpLAo+ID4gSSdtIHNlZWluZyB0
aGUgQlVHX09OKCkgdHJpZ2dlcmluZyBpbiBkcm1fY3J0YydzIGZlbmNlX3RvX2NydGMoKSB2aWEK
PiA+IGRybV9jcnRjX2ZlbmNlX2dldF9kcml2ZXJfbmFtZSgpIHJlZ3VsYXJseToKPiA+IAo+ID4g
wqDCoMKgIENhbGwgdHJhY2U6Cj4gPiDCoMKgwqDCoCBwYW5pYysweDU4LzB4NWMKPiA+IMKgwqDC
oMKgIGRpZSsweDE2MC8weDE3OAo+ID4gwqDCoMKgwqAgYnVnX2Jya19oYW5kbGVyKzB4NzAvMHhh
NAo+ID4gwqDCoMKgwqAgY2FsbF9lbDFfYnJlYWtfaG9vaysweDNjLzB4MWEwCj4gPiDCoMKgwqDC
oCBkb19lbDFfYnJrNjQrMHgyNC8weDc0Cj4gPiDCoMKgwqDCoCBlbDFfYnJrNjQrMHgzNC8weDU0
Cj4gPiDCoMKgwqDCoCBlbDFoXzY0X3N5bmNfaGFuZGxlcisweDgwLzB4ZmMKPiA+IMKgwqDCoMKg
IGVsMWhfNjRfc3luYysweDg0LzB4ODgKPiA+IMKgwqDCoMKgIGRybV9jcnRjX2ZlbmNlX2dldF9k
cml2ZXJfbmFtZSsweDYwLzB4NjggKFApCj4gPiDCoMKgwqDCoCBzeW5jX2ZpbGVfZ2V0X25hbWUr
MHgxODQvMHg0NWMKPiA+IMKgwqDCoMKgIHN5bmNfZmlsZV9pb2N0bCsweDQwNC8weGY3MAo+ID4g
wqDCoMKgwqAgX19hcm02NF9zeXNfaW9jdGwrMHgxMjQvMHgxZGMKPiA+IAo+ID4gVGhpcyBsb29r
cyB0byBiZSBjYXVzZWQgYnkgYSBjb2RlIGZsb3cgc2ltaWxhciB0byB0aGUgZm9sbG93aW5nOgo+
ID4gCj4gPiArKysgc25pcCArKysKPiA+IHRocmVhZCBBwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGhyZWFkIEIKPiA+IAo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlvY3RsKFNZTkNfSU9DX0ZJTEVfSU5GTykKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
eW5jX2ZpbGVfaW9jdGwoKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN5bmNfZmlsZV9nZXRfbmFtZSgp
Cj4gPiBkbWFfZmVuY2Vfc2lnbmFsX3RpbWVzdGFtcF9sb2NrZWQoKcKgIGRtYV9mZW5jZV9kcml2
ZXJfbmFtZSgpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wcyA9IHJjdV9kZXJlZmVyZW5jZShm
ZW5jZS0+b3BzKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWRtYV9mZW5jZV90ZXN0X3Np
Z25hbGVkX2ZsYWcoKSkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wcy0+Z2V0X2RyaXZl
cl9uYW1lKGZlbmNlKSBpLmUuCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fY3J0Y19m
ZW5jZV9nZXRfZHJpdmVyX25hbWUoKQo+ID4gdGVzdF9hbmRfc2V0X2JpdChTSUdOQUxFRCkKPiA+
IFJDVV9JTklUX1BPSU5URVIoZmVuY2UtPm9wcywgTlVMTCkKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
cm1fY3J0Y19mZW5jZV9nZXRfZHJpdmVyX25hbWUoKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBC
VUdfT04ocmN1X2FjY2Vzc19wb2ludGVyKGZlbmNlLT5vcHMpCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIT0gJmRybV9jcnRjX2ZlbmNlX29wcykKPiAKPiBOb3cgdGhpcyBs
b29rcyBsaWtlIGEgdmVyeSBzaW1pbGFyIHByb2JsZW0gdGhhdCBJIGhhdmUgcmVjZW50bHkgYmVl
bgo+IGNvbmNlcm5lZCB3aXRoOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZl
bC8yMDI2MDYxMjEwNDI1MS4yMjY0NzA3LTItcGhhc3RhQGtlcm5lbC5vcmcvCj4gCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL2ZhMGRjOTc1N2JmODM0MzUxNmM0YjE1NmEyYjcw
ZWM5MWI2NGVmOGYuY2FtZWxAbWFpbGJveC5vcmcvCj4gCj4gCj4gSSBjb250aW51ZSB0byBiZWxp
ZXZlIGJlY2F1c2Ugb2YgYnVncyBsaWtlIHRoaXMgYW5kIHRoZSBvbmVzIEkgaGF2ZQo+IHF1b3Rl
ZCBpbiB0aGUgdGhyZWFkcyBhYm92ZSB0aGUgcm9idXN0bmVzcyBvZiB0aGUga2VybmVsIGNvdWxk
IGJlCj4gZ3JlYXRseSBpbXByb3ZlZCBpZiB3ZSBjb3VsZCBnZXQgZG1hX2ZlbmNlIGZ1bGx5IHN5
bmNocm9uaXplZCB3aXRoIGl0cwo+IGxvY2suCgpPbiB0b3Agb2YgdGhhdCwgc2FzaGlrbyBoaWdo
bGlnaHRlZCAgKHZpYSBteSBvdGhlciBwYXRjaCkgdGhhdCB0aGUgZXhpc3RpbmcKY29kZSBpcyBt
aXNzaW5nIHNvbWUgbWVtb3J5IGJhcnJpZXJzOgoKaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNjE4LWxpbnV4LWRybV9jcnRjX2ZpeC12MS0xLTgwMWYyOWM5ODUzZEBsaW5hcm8u
b3JnP3BhcnQ9MQoKSSBiZWxpZXZlIExvY2sgc3luY2hyb25pemF0aW9uIHdvdWxkIHJlc29sdmUg
dGhhdCAoYXMgd291bGQgYWRkaW5nIGV4cGxpY2l0Cm1lbW9yeSBiYXJyaWVycykuCgpbLi4uXQoK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fY3J0Yy5jCj4gPiBpbmRleCA2M2VhZDhiYTY3NTYuLjMxYzg2MzZlNzQ2NyAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2NydGMuYwo+ID4gQEAgLTczLDYgKzczLDkgQEAKPiA+IMKgICogJmRybV9t
b2RlX2NvbmZpZ19mdW5jcy5hdG9taWNfY2hlY2suCj4gPiDCoCAqLwo+ID4gwqAKPiA+ICsjZGVm
aW5lIGZlbmNlX3RvX2NydGMoZikgY29udGFpbmVyX29mKChmKS0+ZXh0ZXJuX2xvY2ssIFwKPiA+
ICsJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2NydGMsIGZlbmNlX2xvY2spCj4gCj4gSSBhZ3Jl
ZSB0aGF0IG1hY3JvcyBzaG91bGQgYmUgYXZvaWRlZCBpZiBwb3NzaWJsZS4KCk5vIHByb2JsZW0s
IEknbGwgY2hhbmdlIHRoYXQuCgo+IAo+ID4gKwo+ID4gwqAvKioKPiA+IMKgICogZHJtX2NydGNf
ZnJvbV9pbmRleCAtIGZpbmQgdGhlIHJlZ2lzdGVyZWQgQ1JUQyBhdCBhbiBpbmRleAo+ID4gwqAg
KiBAZGV2OiBEUk0gZGV2aWNlCj4gPiBAQCAtMTU0LDE0ICsxNTcsNiBAQCBzdGF0aWMgdm9pZCBk
cm1fY3J0Y19jcmNfZmluaShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4gPiDCoCNlbmRpZgo+ID4g
wqB9Cj4gPiDCoAo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyBkcm1fY3J0
Y19mZW5jZV9vcHM7Cj4gPiAtCj4gPiAtc3RhdGljIHN0cnVjdCBkcm1fY3J0YyAqZmVuY2VfdG9f
Y3J0YyhzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiA+IC17Cj4gPiAtCUJVR19PTihyY3VfYWNj
ZXNzX3BvaW50ZXIoZmVuY2UtPm9wcykgIT0gJmRybV9jcnRjX2ZlbmNlX29wcyk7Cj4gCj4gKzEK
PiAKPiBCVUdfT04gaXMgbW9yZSBvciBsZXNzIGRlcHJlY2F0ZWQgYW5kIHNob3VsZCBub3QgYmUg
dXNlZCBhbnltb3JlLiBUaGVyZQo+IG5lZWRzIHRvIGJlIGJvbWJhc3RpYyBqdXN0aWZpY2F0aW9u
IGZvciBzaG9vdGluZyBkb3duIHRoZSBlbnRpcmUKPiBrZXJuZWwuCgpZZXMsIEkgbWVhbnQgdG8g
bWVudGlvbiB0aGF0IGluIG15IGNvbW1pdCBtZXNzYWdlIGFzIHdlbGwuCgpOb3csIHlvdSBtaWdo
dCBoYXZlIHNlZW4gdGhhdCBzYXNoaWtvIGhpZ2hsaWdodGVkIHRoYXQgdGhlIGV4aXN0aW5nCkJV
R19PTigpIGlzIG1hc2tpbmcgYSBwb3RlbnRpYWwgdXNlLWFmdGVyLWZyZWUgZHVyaW5nIGRyaXZl
ciByZW1vdmFsIHdoaWNoCkkgYmVsaWV2ZSB0byBiZSBhIGNvcnJlY3Qgb2JzZXJ2YXRpb24uIEl0
IHN1Z2dlc3RzIHR3byBhbHRlcm5hdGl2ZSB3YXlzIHRvCnJlc29sdmUgaXQ6CgpodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MTgtbGludXgtZHJtX2NydGNfZml4Mi12MS0xLWMw
M2U3N2IzNmYzNEBsaW5hcm8ub3JnP3BhcnQ9MQoKPiBEb2VzIHRoZSBDUlRDIG9yIERSTSBkZXZp
Y2UgbmVlZCB0byBiZSBrZXB0IGFsaXZlIGZvciB0aGUgUkNVIGdyYWNlIHBlcmlvZCwKPiBvciBz
aG91bGQgdGhlIGZlbmNlIGhvbGQgYSBwcm9wZXIgcmVmZXJlbmNlIHRvIHByZXZlbnQgdGhlIHVz
ZS1hZnRlci1mcmVlCj4gd2hlbiBnZXRfZHJpdmVyX25hbWUoKSBhbmQgZ2V0X3RpbWVsaW5lX25h
bWUoKSBhY2Nlc3MgdGhlIGZyZWVkIENSVEMKPiBzdHJ1Y3R1cmU/CgpEbyB5b3UgZ3V5cyBoYXZl
IGFueSBwcmVmZXJlbmNlIG9uIHRoYXQ/IEl0IGFwcGVhcnMgdGhlIHVzZS1hZnRlci1mcmVlCnNo
b3VsZCBiZSByZXNvbHZlZCBiZWZvcmUgbWVyZ2luZyB0aGUgcmVtb3ZhbCBvZiB0aGUgQlVHX09O
KCksIGFuZCBJJ2QgbGlrZQp0byBwcm9ncmVzcyBvbiB0aGlzLgoKQ2hlZXJzLApBbmRyZScK


