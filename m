Return-Path: <linux-media+bounces-48446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C8CAE45B
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 23:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD9723058E6A
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 22:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161CB2E091D;
	Mon,  8 Dec 2025 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lynne.ee header.i=@lynne.ee header.b="AuROe5eL";
	dkim=permerror (0-bit key) header.d=lynne.ee header.i=@lynne.ee header.b="aApQLsGE"
X-Original-To: linux-media@vger.kernel.org
Received: from vidala.pars.ee (vidala.pars.ee [116.203.72.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CFD3B8D41
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 22:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.72.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231601; cv=none; b=aVdHKUOcrrkloHL+bDJdA8lGZ9H+XqWDLoGWA0n6b0WHqoanF8wy3/43Cg/uabu22q5iN4NjxN/v/ytiMoroyBYFA2VssjgJ834xy47oSsyyWQYF1DOHgy50s7vOz+6ptA9zkqu/e5X+ZucWeHQNmMryO+gm2J5twTnk/O1ZjhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231601; c=relaxed/simple;
	bh=hBr/lcamzqe8lILRCdzdcyPssW/Mkc50HDnS+jNsNjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAEjLFyBwgItRJMNfXNUzcBmiOmAbKeYyB7dIYyDFPzz0k7JuY9dX4EhPd0lbn7FIJ8AP/ilxQJ3B9pORs4PGMI67n2YqPz6Xjl+gw2FlBXZTo6IYd+6UjIAsJND95zWLBE0FJxsKgmHaT9GF58h+O0DVgGuaZxhjE6Us0/vtHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynne.ee; spf=pass smtp.mailfrom=lynne.ee; dkim=pass (2048-bit key) header.d=lynne.ee header.i=@lynne.ee header.b=AuROe5eL; dkim=permerror (0-bit key) header.d=lynne.ee header.i=@lynne.ee header.b=aApQLsGE; arc=none smtp.client-ip=116.203.72.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynne.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lynne.ee
DKIM-Signature: v=1; a=rsa-sha256; s=202405r; d=lynne.ee; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1765231457; bh=hBr/lcamzqe8lILRCdzdcyP
	ssW/Mkc50HDnS+jNsNjc=; b=AuROe5eLaRbZ9Z+r/hmMehRkf7PMiHfqRvCT4+GTNLBxubsKQl
	H7nn8Gs/z7kA8xAkS1ZZK8UKha7B+EGI9Z9yWUyYUXqQFXK4DD+2k1JSzmnob7NT4nVFgPPn2Tg
	6R5ACAUmcHuWjtRpynjk1Y27eSiM6A+gRiLnWBkxYeJmGD/LveWhO/qdFd+UNK4JGt6U5Ezqz/p
	07P/MblicL2RA68nEk5wbIrQuJIp7o5qzQSMlMqs00vhwlHoaXJHcz4T8AD2Zlt41N45SLgBs4T
	Dryn9ivEmSlryFm6Ue5/rAZI6guHnNIsmEhE4y+7ANFPiGaE4aSoYWHZXNmSFgvzImg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202405e; d=lynne.ee; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1765231457; bh=hBr/lcamzqe8lILRCdzdcyP
	ssW/Mkc50HDnS+jNsNjc=; b=aApQLsGEAPc/7cn9i60t+4OdhGGazoZajEzZ5wMImX9yUkyrW2
	5r4Udsp8CPPZttRxRAkAdYts6/msFQHPrGBA==;
Message-ID: <b8e02d7c-2dd6-4445-8315-b157ed434201@lynne.ee>
Date: Mon, 8 Dec 2025 23:04:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc_video issue: Panasonic S1II initialization fails in webcam
 mode
To: johannes.goede@oss.qualcomm.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
 <20251122151401.GC15447@pendragon.ideasonboard.com>
 <7ce47ae4-f45d-49f6-919d-98f301aaaa75@lynne.ee>
 <4402b9bd-b74d-4a92-90b6-3edd38db8cc9@oss.qualcomm.com>
Content-Language: en-US
From: Lynne <dev@lynne.ee>
Autocrypt: addr=dev@lynne.ee; keydata=
 xjMEXnFG3BYJKwYBBAHaRw8BAQdA3FyJpqEdfQj4GA7OUWVrNheT9dUsIs+yUx6Hljr9mYvN
 FEx5bm5lIDxkZXZAbHlubmUuZWU+wpAEExYIADgWIQT+UBOcaAVyyv1SH42i/qXwPwNEZAUC
 XnFG3AIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCi/qXwPwNEZOTWAQCSNEA+kZLI
 NZ2dsR5Qg988c0HXpOXThZEjg+h1TL7KGgEA3Gff0c28efI02S6iMxazrpdWGHqHk7JN7pCj
 nt397wzOOARecUbcEgorBgEEAZdVAQUBAQdAjDdFQ5H+AJ9vwXrOb7val460g45EsheIaL5S
 7/zSaX8DAQgHwngEGBYIACAWIQT+UBOcaAVyyv1SH42i/qXwPwNEZAUCXnFG3AIbDAAKCRCi
 /qXwPwNEZKaxAQCHLV4gAk/B9JvRG27MYm22X3+5QRCLBtEILP29aDh+MQD/V8JFHATDXRY3
 0LsmqR3sPQ0BJ1UFVZA5BUoIJPJZWwg=
In-Reply-To: <4402b9bd-b74d-4a92-90b6-3edd38db8cc9@oss.qualcomm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jtSkFk6o6C3iEOoD2dlTmSSf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jtSkFk6o6C3iEOoD2dlTmSSf
Content-Type: multipart/mixed; boundary="------------3n2CBzLiiGHsyJd4f6TRy0gA";
 protected-headers="v1"
From: Lynne <dev@lynne.ee>
To: johannes.goede@oss.qualcomm.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Message-ID: <b8e02d7c-2dd6-4445-8315-b157ed434201@lynne.ee>
Subject: Re: uvc_video issue: Panasonic S1II initialization fails in webcam
 mode
References: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
 <20251122151401.GC15447@pendragon.ideasonboard.com>
 <7ce47ae4-f45d-49f6-919d-98f301aaaa75@lynne.ee>
 <4402b9bd-b74d-4a92-90b6-3edd38db8cc9@oss.qualcomm.com>
In-Reply-To: <4402b9bd-b74d-4a92-90b6-3edd38db8cc9@oss.qualcomm.com>

--------------3n2CBzLiiGHsyJd4f6TRy0gA
Content-Type: multipart/mixed; boundary="------------eLM88C0xugKU4h42keGgQCUG"

--------------eLM88C0xugKU4h42keGgQCUG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgY2FuIGNvbmZpcm0gdGhhdCB1bmxvYWRpbmcgdGhlIG1vZHVsZSBiZXR3ZWVu
IGVhY2ggaG90cGx1ZyBhdHRlbXB0IA0Kd29ya3MsIGV2ZW4gaWYgdGhlIGNhbWVyYSBpcyBr
ZXB0IHBvd2VyZWQgdXAuDQoNCktlZXAgaW4gbWluZCB0aGUgY2FtZXJhIGRvZXMgbm90IGVu
dW1lcmF0ZSBhcyBhIFVTQiBkZXZpY2UgaW1tZWRpYXRlbHksIA0KYnV0IHRoZSB1c2VyIGhh
cyB0byBwcmVzcyBhIHNpbmdsZSBidXR0b24gb24gYSBwb3B1cCBtZW51IHRvIGVuYWJsZSAN
CndlYmNhbSBtb2RlLiBJdHMgcG9zc2libGUgdGhleSBtYXkgYmUgcG93ZXJpbmcgZG93biB0
aGUgVVNCIGNvbnRyb2xsZXIgDQp3aGVuIGl0IGlzbid0IG5lZWRlZCwgdGhvdWdoIEkgZG91
YnQgaXQuDQoNCkl0IGRvZXMgbG9vayB0aW1pbmcgaXNzdWVzLiBJZiB5b3UgaGF2ZSBzb21l
IHBhdGNoZXMsIEkgY291bGQgdGVzdCB0aGVtLg0KVGhhbmtzIGZvciBsb29raW5nIGludG8g
aXQuDQoNCk9uIDA4LzEyLzIwMjUgMTE6NDEsIGpvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29t
bS5jb20gd3JvdGU6DQo+IEhpLA0KPiANCj4gT24gMjItTm92LTI1IDY6NTggUE0sIEx5bm5l
IHdyb3RlOg0KPj4gT24gMjIvMTEvMjAyNSAxNjoxNCwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToNCj4+PiBIaSBMeW5uZSwNCj4+Pg0KPj4+IE9uIFNhdCwgTm92IDIyLCAyMDI1IGF0IDEy
OjI4OjQ4UE0gKzAxMDAsIEx5bm5lIHdyb3RlOg0KPj4+PiBUaGUgaXNzdWUgSSdkIGxpa2Ug
dG8gcmVwb3J0IGlzIHRoYXQgdGhlIGtlcm5lbCBmYWlscyB0byBpbml0aWFsaXplIHRoZQ0K
Pj4+PiBQYW5hc29uaWMgUzFJSSBEU0xSIGNhbWVyYSBpbiB3ZWJjYW0gbW9kZSBhcyBhIHdl
YmNhbS4NCj4+Pj4gU2VlbXMgbGlrZSBtb3N0IHF1ZXJpZXMgdGltZSBvdXQgb3IgZXJyb3Ig
b3V0IHdpdGggYSBnZW5lcmljIHByb3RvY29sDQo+Pj4+IGVycm9yIHJldHVybi4NCj4+Pj4g
SSB0cmllZCBpbmNyZWFzaW5nIFVWQ19DVFJMX0NPTlRST0xfVElNRU9VVCBqdXN0IGluIGNh
c2UsIGJ1dCBpdCBkaWQgbm90DQo+Pj4+IHNlZW0gdG8gaGVscC4NCj4+Pg0KPj4+IEkgc2Vl
IGluIHRoZSBsb2cgdGhhdCB0aGUgVVNCIGF1ZGlvIGRyaXZlciBmYWlscyBhcyB3ZWxsLiBU
aGVyZSBhcmUNCj4+PiBxdWl0ZSBhIGZldyBkZXZpY2VzIHRoYXQgZXhoaWJpdCBpc3N1ZXMg
aW4gdGhlIGludGVyYWN0aW9ucyBiZXR3ZWVuIHRoZQ0KPj4+IGF1ZGlvIGFuZCB2aWRlbyBp
bnRlcmZhY2VzLiBDb3VsZCB5b3UgdGVzdCBibGFja2xpc3RpbmcgdGhlDQo+Pj4gc25kX3Vz
Yl9hdWRpbyBtb2R1bGUgdG8gcHJldmVudCBpdCBmcm9tIGxvYWRpbmcgKGFuZCB1bmxvYWRp
bmcgaXQgaWYNCj4+PiBpdCdzIGxvYWRlZCBhbHJlYWR5KSwgYW5kIHJlcGx1ZyB5b3VyIGNh
bWVyYSA/DQo+Pg0KPj4gSGksDQo+PiBJIGR1ZyBhcm91bmQgc29tZSBtb3JlLiBXaGVuIHRo
ZSBkZXZpY2UgaXMgZmlyc3QgY29ubmVjdGVkLCBldmVyeXRoaW5nIHJ1bnMgZmluZSwgYWN0
dWFsbHkuIFVwb24gdW5wbHVnZ2luZyBhbmQgcGx1Z2dpbmcgaXQgYmFjayBpbiwgSSBnZXQg
dGhlIGxvZyBJIHBvc3RlZCBpbml0aWFsbHkuIFVubG9hZGluZyB0aGUgdXZjdmlkZW8vdXZj
IG1vZWR1bGUgYW5kIGxvYWRpbmcgaXQgbWFrZXMgdGhlIGNhbWVyYSB3b3JrIGFnYWluLg0K
Pj4gRGlzYWJsaW5nIHNuZF91c2JfYXVkaW8gZGlkIG5vdCBoZWxwLg0KPj4NCj4+IEhlcmUn
cyB0aGUgbG9nIG9mIHRoZSBkZXZpY2UgYmVpbmcgcGx1Z2dlZCBpbiBmb3IgdGhlIGZpcnN0
IHRpbWUuDQo+PiA8c2FtZSBhcyBiZWZvcmU+DQo+PiBbwqAgKzAuMDAwMDAxXSB1c2IgMi0z
OiBTZXJpYWxOdW1iZXI6IDAwMDAwWjEyRkIwMDkyNTENCj4+IFvCoCArMC4wOTQ0MjVdIHZp
ZGVvZGV2OiBMaW51eCB2aWRlbyBjYXB0dXJlIGludGVyZmFjZTogdjIuMDANCj4+IFvCoCAr
MC4wMTcyMTddIHVzYiAyLTM6IEZvdW5kIFVWQyAxLjEwIGRldmljZSBEQy1TMU0yICgwNGRh
OjIzODUpDQo+PiBbwqAgKzAuMDAwNDkzXSB1c2IgMi0zOiBGYWlsZWQgdG8gcXVlcnkgKEdF
VF9JTkZPKSBVVkMgZXJyb3IgY29kZSBjb250cm9sIDIgb24gdW5pdCAyOiAtMzIgKGV4cC4g
MSkuDQo+PiBbwqAgKzAuMDAwMjY0XSB1c2IgMi0zOiBGYWlsZWQgdG8gcXVlcnkgKEdFVF9J
TkZPKSBVVkMgZXJyb3IgY29kZSBjb250cm9sIDIgb24gdW5pdCAxOiAtMzIgKGV4cC4gMSku
DQo+PiBbwqAgKzAuMDAwNDA3XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2Ug
ZHJpdmVyIHV2Y3ZpZGVvDQo+PiBbwqAgKzAuMDA3OTYwXSB1c2IgMi0zOiBGYWlsZWQgdG8g
cXVlcnkgKEdFVF9ERUYpIFVWQyBlcnJvciBjb2RlIGNvbnRyb2wgMiBvbiB1bml0IDI6IC0z
MiAoZXhwLiAxKS4NCj4+IFvCoCArMC4wMDAwMDRdIHVzYiAyLTM6IFVWQyBub24gY29tcGxp
YW5jZTogcGVybWFuZW50bHkgZGlzYWJsaW5nIGNvbnRyb2wgOTgwOTAwIChCcmlnaHRuZXNz
KSwgZHVlIHRvIGVycm9yIC0zMg0KPj4gW8KgICswLjAwMDQyNV0gdXNiIDItMzogRmFpbGVk
IHRvIHF1ZXJ5IChHRVRfREVGKSBVVkMgZXJyb3IgY29kZSBjb250cm9sIDIgb24gdW5pdCAx
OiAtMzIgKGV4cC4gMSkuDQo+PiBbwqAgKzAuMDAwMDAxXSB1c2IgMi0zOiBVVkMgbm9uIGNv
bXBsaWFuY2U6IHBlcm1hbmVudGx5IGRpc2FibGluZyBjb250cm9sIDlhMDkwMSAoQXV0byBF
eHBvc3VyZSksIGR1ZSB0byBlcnJvciAtMzINCj4+IFvCoCArMS4wOTEwMTFdIHVzYiAyLTM6
IEZhaWxlZCB0byBxdWVyeSAoR0VUX0RFRikgVVZDIGVycm9yIGNvZGUgY29udHJvbCAyIG9u
IHVuaXQgMjogLTMyIChleHAuIDEpLg0KPj4gW8KgICswLjAwMDQ0Ml0gdXNiIDItMzogRmFp
bGVkIHRvIHF1ZXJ5IChHRVRfREVGKSBVVkMgZXJyb3IgY29kZSBjb250cm9sIDIgb24gdW5p
dCAxOiAtMzIgKGV4cC4gMSkuDQo+PiBbwqAgKzAuMDAwNzYyXSB1c2IgMi0zOiBGYWlsZWQg
dG8gcXVlcnkgKEdFVF9ERUYpIFVWQyBlcnJvciBjb2RlIGNvbnRyb2wgMiBvbiB1bml0IDI6
IC0zMiAoZXhwLiAxKS4NCj4+IFvCoCArMC4wMDA0MjZdIHVzYiAyLTM6IEZhaWxlZCB0byBx
dWVyeSAoR0VUX0RFRikgVVZDIGVycm9yIGNvZGUgY29udHJvbCAyIG9uIHVuaXQgMTogLTMy
IChleHAuIDEpLg0KPj4gW05vdjIyIDE4OjUwXSB1c2IgMi0zOiBVU0IgZGlzY29ubmVjdCwg
ZGV2aWNlIG51bWJlciAyDQo+Pg0KPj4gTWF5YmUgc29tZSBzdGF0ZSBnZXRzIGNvcnJ1cHRl
ZD8NCj4gDQo+IEkgdGhpbmsgdGhpcyBtYXliZSBhIHRpbWluZyBpc3N1ZSwgd2hlcmUgaWYg
d2UgdGFsayB0byB0aGUgZGV2aWNlIHRvIHF1aWNrbHkgYWZ0ZXINCj4gcGx1Z2dpbmcgaW4g
aXQgaXMgdW5oYXBweS4NCj4gDQo+IFRoZSBmaXJzdCB0aW1lIHRoZXJlIHdpbGwgYmUgc29t
ZSBkZWxheSBiZWNhdXNlIHRoZSB1dmN2aWRlbyBtb2R1bGUgbmVlZHMgdG8gYmUgbG9hZGVk
Lg0KPiANCj4gQ2FuIHlvdSB0cnkgdGhlIGZvbGxvd2luZzoNCj4gDQo+IDEuICdlY2hvIGJs
YWNrbGlzdCB1dmN2aWRlbyB8IHN1ZG8gdGVlIC9ldGMvbW9kcHJvYmUuZC91dmN2aWRlby1i
bGFja2xpc3QuY29uZicNCj4gMi4gJ3N1ZG8gcm1tb2QgdXZjdmlkZW8nDQo+IDMuIHBsdWdp
biB0aGUgY2FtZXJhLCB0aGVuIHdhaXQgMSBzZWNvbmQNCj4gNC4gJ3N1ZG8gbW9kcHJvYmUg
dXZjdmlkZW8nDQo+IDUuIENhbWVyYSBub3cgd29ya3M/DQo+IDYuIHVucGx1ZyB0aGUgY2Ft
ZXJhDQo+IDcuICdzdWRvIHJtbW9kIHV2Y3ZpZGVvJw0KPiA4LiBwbHVnaW4gdGhlIGNhbWVy
YSwgdGhlbiB3YWl0IDEgc2Vjb25kDQo+IDkuICdzdWRvIG1vZHByb2JlIHV2Y3ZpZGVvJw0K
PiANCj4gSWYgdGhlIGNhbWVyYSBub3cgd29ya3Mgb24gdGhlIHNlY29uZCBwbHVnaW4gdGhl
biB3ZSd2ZSBzb21lIHRpbWluZyBpc3N1ZS4NCj4gDQo+IElmIGl0IGRvZXMgbm90IHdvcmsg
dGhlbiB0cnk6DQo+IA0KPiAxLiB1bnBsdWcgdGhlIGNhbWVyYQ0KPiAyLiB0dXJuIHRoZSBj
YW1lcmEgZnVsbHkgb2ZmDQo+IDMuIHdhaXQgMTAgc2Vjb25kcw0KPiA0LiB0dXJuIHRoZSBj
YW1lcmEgYmFjayBvbg0KPiA1LiBwbHVnIGluIHRoZSBjYW1lcmENCj4gDQo+IFNpbmNlIGl0
IG1heSBhbHNvIGJlIHRoZSBjYXNlIHRoYXQgdGhlIGNhbWVyYSBmdyBzb21laG93IGVuZHMg
dXAgaW4gYSBiYWQgc3RhdGUgYWZ0ZXINCj4gYmVpbmcgcGx1Z2dlZCBpbiBvbmNlIGFuZCB0
aGF0IHRoZSBjYW1lcmEgZncgbmVlZHMgdG8gYmUgcmVzZXQgYmVmb3JlIHBsdWdnaW5nIGl0
IGluDQo+IGEgc2Vjb25kIHRpbWUuDQo+IA0KPiBXaGVuIHlvdSBwbHVnIGluIHRoZSBjYW1l
cmEgdGhlIGZpcnN0IHRpbWUgYW5kIGl0IHdvcmtzIHByb3Blcmx5LCB3YXMgdGhlIGNhbWVy
YQ0KPiBvbiB3aGVuIHlvdSBwbHVnZ2VkIGl0IGluOyBvciBkaWQgeW91IHBsdWcgaXQgb24g
d2hpbGUgdGhlIGNhbWVyYSB3YXMgb2ZmIGFuZA0KPiBkaWQgcGx1Z2dpbmcgaXQgaW4gd2Fr
ZSBpdCB1cCAob3IgZGlkIHlvdSB0dXJuIGl0IG9uIGFmdGVyIHBsdWdnaW5nIGl0IGluKT8N
Cj4gDQo+IEl0IG1pZ2h0IGFsc28gbWFrZSBhIGRpZmZlcmVuY2Ugb2YgaWYgeW91IHBsdWdp
biBmaXJzdCBhbmQgdGhlbiB0dXJuIG9uDQo+IHRoZSBjYW1lcmEgdnMgcGx1Z2dpbmcgaW4g
d2hpbGUgdGhlIGNhbWVyYSBpcyBhbHJlYWR5IG9uLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+
IEhhbnMNCj4gDQo+IA0KPiANCj4gDQo+Pg0KPj4+PiBGdWxsIGxvZyBpcyBiZWxvdzoNCj4+
Pj4NCj4+Pj4gW05vdjIyIDEyOjExXSB1c2IgNC00OiBuZXcgU3VwZXJTcGVlZCBQbHVzIEdl
biAyeDEgVVNCIGRldmljZSBudW1iZXIgMTAgdXNpbmcgeGhjaV9oY2QNCj4+Pj4gW8KgICsw
LjAxNzMxNV0gdXNiIDQtNDogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTA0ZGEs
IGlkUHJvZHVjdD0yMzg1LCBiY2REZXZpY2U9IDEuMDANCj4+Pj4gW8KgICswLjAwMDAwOF0g
dXNiIDQtNDogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2Vy
aWFsTnVtYmVyPTMNCj4+Pj4gW8KgICswLjAwMDAwNF0gdXNiIDQtNDogUHJvZHVjdDogREMt
UzFNMg0KPj4+PiBbwqAgKzAuMDAwMDAyXSB1c2IgNC00OiBNYW51ZmFjdHVyZXI6IFBhbmFz
b25pYw0KPj4+PiBbwqAgKzAuMDAwMDAyXSB1c2IgNC00OiBTZXJpYWxOdW1iZXI6IDAwMDAw
WjEyRkIwMDkyNTENCj4+Pj4gW8KgICswLjAxOTIyMl0gdXNiIDQtNDogRm91bmQgVVZDIDEu
MTAgZGV2aWNlIERDLVMxTTIgKDA0ZGE6MjM4NSkNCj4+Pj4gW8KgICs1LjEyNzMzNV0gdXNi
IDQtNDogRmFpbGVkIHRvIHF1ZXJ5IChHRVRfSU5GTykgVVZDIGNvbnRyb2wgMiBvbiB1bml0
IDI6IC0xMTAgKGV4cC4gMSkuDQo+Pj4+IFvCoCArNS4xMTk4ODRdIHVzYiA0LTQ6IEZhaWxl
ZCB0byBxdWVyeSAoR0VUX0lORk8pIFVWQyBjb250cm9sIDIgb24gdW5pdCAxOiAtMTEwIChl
eHAuIDEpLg0KPj4+PiBbICsxMC4yMzk5MzddIHVzYiA0LTQ6IFVWQyBub24gY29tcGxpYW5j
ZSAtIEdFVF9ERUYoUFJPQkUpIG5vdCBzdXBwb3J0ZWQuIEVuYWJsaW5nIHdvcmthcm91bmQu
DQo+Pj4+IFvCoCArMC4wMDgyNjRdIHV2Y3ZpZGVvIDQtNDoxLjE6IEZhaWxlZCB0byBxdWVy
eSAoR0VUX0NVUikgVVZDIHByb2JlIGNvbnRyb2wgOiAtNzEgKGV4cC4gMzQpLg0KPj4+PiBb
wqAgKzAuMDAwMDEzXSB1dmN2aWRlbyA0LTQ6MS4xOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSB0
aGUgZGV2aWNlICgtNzEpLg0KPj4+PiBbwqAgKzAuMDAwMDI2XSB1dmN2aWRlbyA0LTQ6MS4w
OiBwcm9iZSB3aXRoIGRyaXZlciB1dmN2aWRlbyBmYWlsZWQgd2l0aCBlcnJvciAtNzENCj4+
Pj4gW8KgICswLjEwMzA5NV0gdXNiIDQtNDogMzoxOiBjYW5ub3Qgc2V0IGZyZXEgNDgwMDAg
dG8gZXAgMHg4Mw0KPj4+PiBbwqAgKzAuMzU5ODI1XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRf
aW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KPj4+PiBbwqAgKzAuMzIwMDU2XSB1c2IgNC00OiAz
OjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KPj4NCj4+DQoNCg==
--------------eLM88C0xugKU4h42keGgQCUG
Content-Type: application/pgp-keys; name="OpenPGP_0xA2FEA5F03F034464.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA2FEA5F03F034464.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEXnFG3BYJKwYBBAHaRw8BAQdA3FyJpqEdfQj4GA7OUWVrNheT9dUsIs+yUx6H
ljr9mYvNFEx5bm5lIDxkZXZAbHlubmUuZWU+wpAEExYIADgWIQT+UBOcaAVyyv1S
H42i/qXwPwNEZAUCXnFG3AIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCi
/qXwPwNEZOTWAQCSNEA+kZLINZ2dsR5Qg988c0HXpOXThZEjg+h1TL7KGgEA3Gff
0c28efI02S6iMxazrpdWGHqHk7JN7pCjnt397wzOOARecUbcEgorBgEEAZdVAQUB
AQdAjDdFQ5H+AJ9vwXrOb7val460g45EsheIaL5S7/zSaX8DAQgHwngEGBYIACAW
IQT+UBOcaAVyyv1SH42i/qXwPwNEZAUCXnFG3AIbDAAKCRCi/qXwPwNEZKaxAQCH
LV4gAk/B9JvRG27MYm22X3+5QRCLBtEILP29aDh+MQD/V8JFHATDXRY30LsmqR3s
PQ0BJ1UFVZA5BUoIJPJZWwg=3D
=3DylY5
-----END PGP PUBLIC KEY BLOCK-----

--------------eLM88C0xugKU4h42keGgQCUG--

--------------3n2CBzLiiGHsyJd4f6TRy0gA--

--------------jtSkFk6o6C3iEOoD2dlTmSSf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT+UBOcaAVyyv1SH42i/qXwPwNEZAUCaTdLYQUDAAAAAAAKCRCi/qXwPwNEZF7R
AQDhnmJMquyRD0D+Dj4kmG9j1Jbz+ucvR+CnX+crfOUBCAD/ZhbQ/8uKlnZEJHXle0xuQaUZaEj+
BbZOVSZgoomwOg8=
=1uZ1
-----END PGP SIGNATURE-----

--------------jtSkFk6o6C3iEOoD2dlTmSSf--

