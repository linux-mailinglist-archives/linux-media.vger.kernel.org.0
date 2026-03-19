Return-Path: <linux-media+bounces-56378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMIYMHpdvGnLxgIAu9opvQ
	(envelope-from <linux-media+bounces-56378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:32:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840A2D2331
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C447305EBBA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA523FFAC6;
	Thu, 19 Mar 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="haieW3A6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF793F99C3
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951963; cv=none; b=GdtXo2lFl0vZ4zK6FiAB20J4xAsVsIXp86007Q5PfeQ4CwE6e5p92cIVeEk4oioqZzuREUy4YgZtDQgOJ2W+l3NbnZfVw55LeklDWXw1TN0fDg8I/ZQ+TZcECsHBq/t85VP4t6GDKawXSiIa/bkkuCbCZep9UZFE6OV/0IyojtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951963; c=relaxed/simple;
	bh=0EG1mGn2kxG0H8cSWyUCSFvDfHZ0uJ0D9oamMM5Wir8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rDM4spFYSshITm4soGYyBz9jZMzbskXOn7LdbD2OdWsGCWKli9wqWzrShMQ/+ISUmWOY59g49yPqTrgg+qLN/mOocVjCCm/KFBHlwENwm4Doymo+vLr2zyqEvYacRLK7CKs+g2HzqUBTieLnvTvffSZQFQh/I/xP0foV0K+dHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=haieW3A6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cfc3ca1922so71296885a.1
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773951955; x=1774556755; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0EG1mGn2kxG0H8cSWyUCSFvDfHZ0uJ0D9oamMM5Wir8=;
        b=haieW3A6AzE86jDkjVlHsxzVOwDExBlNdTEOpniZArjuK7dQNVuAnsgnCbeHvP7HQU
         jYVT6rJbBEs3Efse2e+Snzeim+JpeZL7xu9VB7zf4qsSwURU9uVPF0ImO8XGuqAfop48
         iFrOD3Kawi2xRk0biYILkNWwjLqpZFbFABVb4zyaU+dZbgSafc8LxSS29ckd11sK6XlV
         EI9PzxQCoc3HNtd8Qmd5waEyfJ5skdvZV9bHDpDeF+OFo1zhcNzouNtRVVqenP9aUWqZ
         3NpZ6aMZLQO2GCEDsGNdGTmZFPORxA8VKC0G4G/CDnncw+ScA8/ZPdcFS0DVisiDEhdX
         qWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773951955; x=1774556755;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EG1mGn2kxG0H8cSWyUCSFvDfHZ0uJ0D9oamMM5Wir8=;
        b=cKUNZXAMClQn9AIa5FQevvwiwDLGAHM12Ev0LNo735Av0Oi+0938Wzy50vqw4cPMX7
         ZTjv+FlEmRdVT2QLmbhKNdUeRGvgmf0ddNzPQl4X42NTZFFG/78e883k1IHjNkSDdCNW
         Mb4TGUAJRKxkc4eW6GXpbtLgovOvFWdBL/BvNL8CmTM+KH6xW0OzwhjNuHu9UnzouvUq
         3/+AuC+JkFBC/P7qCNHPEsGJUIvTMaDpbkhBMl3mUQxkIUs0E8dIUySWnGZ6VpCFg/em
         1qFkp6wp56vJfscGMEzvYjGunPtMGhsrzHUg+rsr63TngnnF757mB2fHGTlrSqhEOwTI
         w95g==
X-Forwarded-Encrypted: i=1; AJvYcCUPSm89rY4KCbXE3QM7HlBWcZUnHZ8B7cUUoLpJ0QBp3rrJ0wcYV7QWvw1wEy/jgo7aUjatK0pbYxW3jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjcKbTaFyzYpqnLbU1WY1wnCDaj0SdG0tfIDrS42b6N0AGqIQu
	AYr9t8/hp/gELAUcnJpD+IUBubNyPFsm/5rnWBiAc3HF0RGW2GD0X9fe1ebVDiOAYnA=
X-Gm-Gg: ATEYQzwSweXGnMZnIAMbsBAs8vKu0BX6XBk4pQbzKhzyZDP1R3sysUg/EFJ9w6D9MHf
	BA/L6vtpL2Q69ZYcLlMuCaT1N42BgLrgNi4UZmZJbrjoaoI5fFaFTW7yT+8gHismrmBsSCYia63
	3EBYxMI0enpMWPu6hctPCw5MDJ0jmSF9QGMrFBs67NrgXUZBZXmb7152fFWTog7CJZTzFOuR+XC
	+Zv+qY32LEKCKn+euUKv8mY6X5uwm8K8sf2SHvxpEQJZfQQRp1XfBrBYD4555akhUY2NHYnOXzI
	Aht5UNf0Oh+YJDQgL8WumeXunzLeurZc2MszYRB1QzkRNuMHKFJY1iNzpz8iMYqGMwhLrOzO9qh
	7qGgofBAAm69hz7byEXAIz2Sa2AAnSfD2i9tHlkEKjsZtjndaJFCqSqjK5/sQlpzMu9uYXfURg6
	Knnhvfj5bxMS1waBzIXFCMS7EGvJNQ
X-Received: by 2002:a05:620a:25cb:b0:8cd:9142:ed6c with SMTP id af79cd13be357-8cfc795a3aemr110705385a.1.1773951955162;
        Thu, 19 Mar 2026 13:25:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fbe4edsm11003185a.20.2026.03.19.13.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:25:54 -0700 (PDT)
Message-ID: <9816ad4b43c67b3e4dd779b44f5ee0d7d09d5ecd.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: fix use-after-free in release path due
 to uncancelled work
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: irui.wang@mediatek.com, kyrie.wu@mediatek.com, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:25:52 -0400
In-Reply-To: <20260304031934.147483-1-fanwu01@zju.edu.cn>
References: <20260304031934.147483-1-fanwu01@zju.edu.cn>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Fr5ososJn9zdO55z0gpD"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zju.edu.cn,mediatek.com,kernel.org,gmail.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56378-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,ndufresne-ca.20230601.gappssmtp.com:dkim,ndufresne.ca:mid,zju.edu.cn:email]
X-Rspamd-Queue-Id: 3840A2D2331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-Fr5ososJn9zdO55z0gpD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

TGUgbWVyY3JlZGkgMDQgbWFycyAyMDI2IMOgIDAzOjE5ICswMDAwLCBGYW4gV3UgYSDDqWNyaXTC
oDoKPiBUaGUgbXRrX2pwZWdfcmVsZWFzZSgpIGZ1bmN0aW9uIGZyZWVzIHRoZSBjb250ZXh0IHN0
cnVjdHVyZSAoY3R4KSB3aXRob3V0Cj4gZmlyc3QgY2FuY2VsbGluZyBhbnkgcGVuZGluZyBvciBy
dW5uaW5nIHdvcmsgaW4gY3R4LT5qcGVnX3dvcmsuIFRoaXMKPiBjcmVhdGVzIGEgcmFjZSB3aW5k
b3cgd2hlcmUgdGhlIHdvcmtxdWV1ZSBjYWxsYmFjayBtYXkgc3RpbGwgYmUgYWNjZXNzaW5nCj4g
dGhlIGNvbnRleHQgbWVtb3J5IGFmdGVyIGl0IGhhcyBiZWVuIGZyZWVkLgo+IAo+IFJhY2UgY29u
ZGl0aW9uOgo+IAo+IMKgwqDCoCBDUFUgMCAocmVsZWFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBDUFUgMSAod29ya3F1ZXVlKQo+IMKgwqDCoCAtLS0tLS0tLS0tLS0t
LS0twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0tLS0tLS0tLS0tLS0tLS0t
LQo+IMKgwqDCoCBjbG9zZSgpCj4gwqDCoMKgwqDCoCBtdGtfanBlZ19yZWxlYXNlKCkKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG10a19qcGVnZW5jX3dvcmtlcigpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY3R4ID0gd29yay0+ZGF0YQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGFjY2Vz
c2luZyBjdHgKPiAKPiDCoMKgwqDCoMKgwqDCoCBrZnJlZShjdHgpwqAgLy8gZnJlZWQhCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYWNjZXNzIGN0eMKgIC8vIFVBRiEKPiAKPiBUaGUgd29yayBp
cyBxdWV1ZWQgdmlhIHF1ZXVlX3dvcmsoKSBkdXJpbmcgSlBFRyBlbmNvZGUvZGVjb2RlIG9wZXJh
dGlvbnMKPiAodmlhIG10a19qcGVnX2RldmljZV9ydW4pLiBJZiB0aGUgZGV2aWNlIGlzIGNsb3Nl
ZCB3aGlsZSB3b3JrIGlzIHBlbmRpbmcKPiBvciBydW5uaW5nLCB0aGUgd29yayBoYW5kbGVyIHdp
bGwgYWNjZXNzIGZyZWVkIG1lbW9yeS4KPiAKPiBGaXggdGhpcyBieSBjYWxsaW5nIGNhbmNlbF93
b3JrX3N5bmMoKSBCRUZPUkUgYWNxdWlyaW5nIHRoZSBtdXRleC4gVGhpcwo+IG9yZGVyaW5nIGlz
IGNyaXRpY2FsOiBpZiBjYW5jZWxfd29ya19zeW5jKCkgaXMgY2FsbGVkIGFmdGVyIG11dGV4X2xv
Y2soKSwKPiBhbmQgdGhlIHdvcmsgaGFuZGxlciBhbHNvIHRyaWVzIHRvIGFjcXVpcmUgdGhlIHNh
bWUgbXV0ZXgsIGl0IHdvdWxkIGNhdXNlCj4gYSBkZWFkbG9jay4KPiAKPiBOb3RlOiBUaGUgb3Bl
biBlcnJvciBwYXRoIGRvZXMgTk9UIG5lZWQgY2FuY2VsX3dvcmtfc3luYygpIGJlY2F1c2UKPiBJ
TklUX1dPUksoKSBvbmx5IGluaXRpYWxpemVzIHRoZSB3b3JrIHN0cnVjdHVyZSAtIGl0IGRvZXMg
bm90IHNjaGVkdWxlCj4gaXQuIFdvcmsgaXMgb25seSBzY2hlZHVsZWQgbGF0ZXIgZHVyaW5nIGlv
Y3RsIG9wZXJhdGlvbnMuCj4gCj4gRml4ZXM6IDVmYjFjMjM2MWU1NiAoIm10ay1qcGVnZW5jOiBh
ZGQganBlZyBlbmNvZGUgd29ya2VyIGludGVyZmFjZSIpCj4gU2lnbmVkLW9mZi1ieTogRmFuIFd1
IDxmYW53dTAxQHpqdS5lZHUuY24+CgpSZXZpZXdlZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8bmlj
b2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMgfCAxICsKPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYwo+IGluZGV4IGMwMTEyNGEzNDlmNi4uOGM2
ODQ3NTZkNWZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
anBlZy9tdGtfanBlZ19jb3JlLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jCj4gQEAgLTEyMDIsNiArMTIwMiw3IEBAIHN0YXRpYyBp
bnQgbXRrX2pwZWdfcmVsZWFzZShzdHJ1Y3QgZmlsZSAqZmlsZSkKPiDCoAlzdHJ1Y3QgbXRrX2pw
ZWdfZGV2ICpqcGVnID0gdmlkZW9fZHJ2ZGF0YShmaWxlKTsKPiDCoAlzdHJ1Y3QgbXRrX2pwZWdf
Y3R4ICpjdHggPSBtdGtfanBlZ19maWxlX3RvX2N0eChmaWxlKTsKPiDCoAo+ICsJY2FuY2VsX3dv
cmtfc3luYygmY3R4LT5qcGVnX3dvcmspOwo+IMKgCW11dGV4X2xvY2soJmpwZWctPmxvY2spOwo+
IMKgCXY0bDJfbTJtX2N0eF9yZWxlYXNlKGN0eC0+ZmgubTJtX2N0eCk7Cj4gwqAJdjRsMl9jdHJs
X2hhbmRsZXJfZnJlZSgmY3R4LT5jdHJsX2hkbCk7Cg==


--=-Fr5ososJn9zdO55z0gpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxb0QAKCRDZQZRRKWBy
9MsFAQCQeJjdR5w3hB/AAU/cM8jUtrK2jP1cB1pJtx3YrdQDZgD+NwcbZU9Z0Exl
7VAkWg98FEyqc9733fs0ajNBFsNqMgM=
=Rhr7
-----END PGP SIGNATURE-----

--=-Fr5ososJn9zdO55z0gpD--

