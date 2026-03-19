Return-Path: <linux-media+bounces-56379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDO2IoFevGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:37:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4402D23F4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AA853277E2D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B803B3F99C1;
	Thu, 19 Mar 2026 20:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="rADXOK22"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C803F87EA
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952080; cv=none; b=nDgugd71cu8JCKfyq+XK9CS1sryQhysU1WVtSADjSHHpwkp329J5vYznLkoxfaoz77GR3wbunMgVajAENVQxlvlbpnD6dKGtvbsme1ndEy2W3/P20MkmfhBlM2UqsR5KNG57iB5i0Edk3XaLzKnrnl3bHxCIEvEWywmjfUF+v7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952080; c=relaxed/simple;
	bh=ieXBhtwQioe8uOOGkxVAKRyCV34NjX4e7tdgyCREHoQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IZbe9apAsseNCq4s9rGWn8Sh5xEE+vQdzmQ1GmIO/hgGZecTHwHoD/vVWYysOX8JEpAy7b7Cdll2Xv23D0aR+GNsLUFD4dJQNhJRjTwyEvleML7xTr/Nr8rznGbt8nFLBb+Z/U7y930w8wFcPyCG8aHUfLvlTuIwV848xomjdvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=rADXOK22; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cd90401034so135677085a.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 13:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773952077; x=1774556877; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ieXBhtwQioe8uOOGkxVAKRyCV34NjX4e7tdgyCREHoQ=;
        b=rADXOK225XCC5tdmAxetvDpLPfT2wmZbM3c2fJV2Zw2EXFBaIsXRofwkpUdo6QlAQd
         BQZOabP6gqunyWy7gwaqN3pYgBhUueiE+2DfdOgwYt1grd3zelJIBuMQtMhJ3Ca9kk8w
         KD0CXoWbuRiXwBbBCPpl7vQ0VxB0AJH7e15J60UIivw+TH0U9+EjCc7wLXqEkwq9rZSP
         c9v7MOiWiwqTZ5yseBPx6IqCWOZGxTd6A/Yf1+aFd8CaWXLXCz5vvRVCowLIyK70BOZn
         d65vnZHcuim+NJUDy9bGyg9tDk3javRT5LFvBT/FQsC0H79ASE3U38Db5OsvtA9SeiGh
         wxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952077; x=1774556877;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieXBhtwQioe8uOOGkxVAKRyCV34NjX4e7tdgyCREHoQ=;
        b=rp8UYAt7xinGwed8bZi50Zb/mf8I4LKeOJhTsWx8DF6mcV3ZmKBPRjpqa7GsL5Jzcd
         qMy4o4M2IHcSfHSE3jVF1bxRnDHDgeL8q2JBhn6dJY+talodw6IzO6FQrpi5B6cBaVny
         oh413VUW17WnyX9pQ7ol4pTTNcNgj98w8/LGQJeBerpJYl82l3QrccxbjN6Uz4NDm6US
         Nb4TQry+D1ak7LWtRNXWv7olSewwULmvdpDr17TBElQ87gtWDwvOnM9dxo8afmmr3LQS
         IFaAsd8eNBFY9ASTdLlcSlCYq3mDdUKeetcPDbSrmmwUdwjSOSPLVEcavIh7/rzlGAzC
         hp1g==
X-Forwarded-Encrypted: i=1; AJvYcCX5xYh03qQ1VFHcrD2nuSJlkr1mPlcX3Zj2P8v6rpmdiDJcuA8or7YOLdkhO3DDnEHn4+um0Sifcil4mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8QV2f9k7fnaRbge9NIja5N1/L25DbHlcA5QGML7rH/B5/oN7b
	Fi23Yo5zAhzBtKBAJGgdwqUBJbzHLCOIeAQ4xVmaTm2gnn2jIVRvbMP18f+h5w9PZl4=
X-Gm-Gg: ATEYQzwx8YJDS1dZWTjai+NZEf8uzwUSjaGkBoPrjENZMNfjBf6MeoSoV7uylROKEvs
	z3uvUqUjthlaLcTKV3807A9jYO9F84QlDjjj4t12c6mQ91JurSYiDJCP4QWEaUeyfl0jUXQYiux
	Pd3/tHm/XcRB10vIy1Ii2WEpx7/bgKH0TjG6VZYC9T+dOxs2OGVl2MLnHjygoG2gemELRfc+wNJ
	38cXYkzM/zgFY67F6HGCTyyHdNcH9Hf4IJmb23F92oM78R4br6MpziviHS+PtS2DR7QJfzAwpuo
	v+plYXOVGnUjkBT//O2ThJOFSKRqBd5++OA298XX6c2tZCwskCHNh8Xy2+neJK7n2gBDDR3lRxn
	2VA2je3vAp2uCsTBdMTu+9kRY89X/4k4Z3lHIji4xml0pToGEeFUq2RBPT284T95/EvfpDDo35P
	OhtcSFqSm/O1aurKaWIgFl2O3RZNDK
X-Received: by 2002:a05:620a:4489:b0:8cd:a801:cb1f with SMTP id af79cd13be357-8cfc7f48d36mr97810985a.35.1773952077194;
        Thu, 19 Mar 2026 13:27:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm12702585a.19.2026.03.19.13.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 13:27:56 -0700 (PDT)
Message-ID: <b6b9e336662fece0fc9e2aa132b7cbe02de38885.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: fix use-after-free in release path due
 to uncancelled work
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fan Wu <fanwu01@zju.edu.cn>, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: irui.wang@mediatek.com, kyrie.wu@mediatek.com, hverkuil@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:27:54 -0400
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
	protocol="application/pgp-signature"; boundary="=-lxOLEeh3tHLuJ4rdm5bO"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zju.edu.cn,mediatek.com,kernel.org,gmail.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56379-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,ndufresne.ca:mid,zju.edu.cn:email,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: EC4402D23F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-lxOLEeh3tHLuJ4rdm5bO
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


--=-lxOLEeh3tHLuJ4rdm5bO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxcSwAKCRDZQZRRKWBy
9Kv5AP4qHemcfNFtM1PoQcuuolb7kFnIioH+wVCWJdCrdmbLIAD+LYg4aFIcaLL2
Nr2+VTGkn6ryMeS4088D/Kp/7VyN4wQ=
=EhsS
-----END PGP SIGNATURE-----

--=-lxOLEeh3tHLuJ4rdm5bO--

