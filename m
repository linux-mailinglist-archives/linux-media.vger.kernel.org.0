Return-Path: <linux-media+bounces-47611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B64C7CE55
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 12:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 392A43A9198
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 11:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F68D6F06A;
	Sat, 22 Nov 2025 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lynne.ee header.i=@lynne.ee header.b="cZg8iow9";
	dkim=permerror (0-bit key) header.d=lynne.ee header.i=@lynne.ee header.b="UBgrMijG"
X-Original-To: linux-media@vger.kernel.org
Received: from vidala.pars.ee (vidala.pars.ee [116.203.72.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3542FE06E
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.72.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811081; cv=none; b=nUtxzcsrFkcvpmDcijPrXAACbTVmR27Pr2Xut+5884tn231X+gS+12qgGbjBeB4ZEW9hCxRRcPWz2XHQ5WT1ZMZPg7BHrcNJVtPM+QZbjJvri8G+IvdkScB/MXbYkYI15Z7zLjxB8vT2+mSknVwgh0/4s3s3kKSC/eGcQ5uZdes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811081; c=relaxed/simple;
	bh=EM9VVLyyKo0Ohg4omI3bDGg4eXXGeec4Ioh03oiTai4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=u4e+zGG2EZq0XiAPljeAfJ3jBHYH5mJgTzl+ajoAbuwgGr4dpjGoN7L0Ju4GcIHexYyd5ZoKaNX2FJskFNH+5UVClluKqEEpyS3QFyzKvhOGXtwRUyka3soJJXtTTNbFYoNsLxsZwKA7jwU2iqSNWo9fdXlj8Tr041MpHvdc6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynne.ee; spf=pass smtp.mailfrom=lynne.ee; dkim=pass (2048-bit key) header.d=lynne.ee header.i=@lynne.ee header.b=cZg8iow9; dkim=permerror (0-bit key) header.d=lynne.ee header.i=@lynne.ee header.b=UBgrMijG; arc=none smtp.client-ip=116.203.72.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lynne.ee
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lynne.ee
DKIM-Signature: v=1; a=rsa-sha256; s=202405r; d=lynne.ee; c=relaxed/relaxed;
	h=Subject:From:To:Date:Message-ID; t=1763810928; bh=EM9VVLyyKo0Ohg4omI3bDGg
	4eXXGeec4Ioh03oiTai4=; b=cZg8iow9TefCWgk4iqLfshGFI/Cfqx9mdRh8TDwDGQIR9314if
	wLALND4PBYsWCx2Y4oyN7Zhk/7J1J/5rAYTgb1NYxMNoToZGWKY/LuX41MCDaMBZombZ9gIwFGa
	RAIAiPNhpsOuYGtIwlkBgYff0yJcbucCOHLXpZFbJKXC276CyT6KXnps4C1ng3PCHbzdCGmooco
	ak28jp5mZNprKAXT/wjWMk0GG29bTNt1jI1QUoP9MUWYp9InRm5g+7C61ZRPwygu75QLZyWDHUf
	UQhc0Mm5FVZcv1dEGocWyVALyY1K+XJe0fQRoVQjTxOVdWLRjKg2WjhsAn3SxJq0OXg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202405e; d=lynne.ee; c=relaxed/relaxed;
	h=Subject:From:To:Date:Message-ID; t=1763810928; bh=EM9VVLyyKo0Ohg4omI3bDGg
	4eXXGeec4Ioh03oiTai4=; b=UBgrMijGM2fTMYGSa/UMBAGR5W8/j4vNfHKc0wZz6CHVmEDDEQ
	DvMch+luRe6rvYzGeKqUEZ2Pdl3PW043RpBQ==;
Message-ID: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
Date: Sat, 22 Nov 2025 12:28:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 linux-media@vger.kernel.org
From: Lynne <dev@lynne.ee>
Subject: uvc_video issue: Panasonic S1II initialization fails in webcam mode
Autocrypt: addr=dev@lynne.ee; keydata=
 xjMEXnFG3BYJKwYBBAHaRw8BAQdA3FyJpqEdfQj4GA7OUWVrNheT9dUsIs+yUx6Hljr9mYvN
 FEx5bm5lIDxkZXZAbHlubmUuZWU+wpAEExYIADgWIQT+UBOcaAVyyv1SH42i/qXwPwNEZAUC
 XnFG3AIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCi/qXwPwNEZOTWAQCSNEA+kZLI
 NZ2dsR5Qg988c0HXpOXThZEjg+h1TL7KGgEA3Gff0c28efI02S6iMxazrpdWGHqHk7JN7pCj
 nt397wzOOARecUbcEgorBgEEAZdVAQUBAQdAjDdFQ5H+AJ9vwXrOb7val460g45EsheIaL5S
 7/zSaX8DAQgHwngEGBYIACAWIQT+UBOcaAVyyv1SH42i/qXwPwNEZAUCXnFG3AIbDAAKCRCi
 /qXwPwNEZKaxAQCHLV4gAk/B9JvRG27MYm22X3+5QRCLBtEILP29aDh+MQD/V8JFHATDXRY3
 0LsmqR3sPQ0BJ1UFVZA5BUoIJPJZWwg=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6KZNB941bpKSx6bZMSVwb40q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6KZNB941bpKSx6bZMSVwb40q
Content-Type: multipart/mixed; boundary="------------xHleJHRKuW0TeZEKJkeZpyKD";
 protected-headers="v1"
From: Lynne <dev@lynne.ee>
To: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 linux-media@vger.kernel.org
Message-ID: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
Subject: uvc_video issue: Panasonic S1II initialization fails in webcam mode

--------------xHleJHRKuW0TeZEKJkeZpyKD
Content-Type: multipart/mixed; boundary="------------Ty45Diy4o4sn82QzgIkhPIIQ"

--------------Ty45Diy4o4sn82QzgIkhPIIQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhlIGlzc3VlIEknZCBsaWtlIHRvIHJlcG9ydCBpcyB0aGF0IHRoZSBrZXJuZWwgZmFpbHMg
dG8gaW5pdGlhbGl6ZSB0aGUgDQpQYW5hc29uaWMgUzFJSSBEU0xSIGNhbWVyYSBpbiB3ZWJj
YW0gbW9kZSBhcyBhIHdlYmNhbS4NClNlZW1zIGxpa2UgbW9zdCBxdWVyaWVzIHRpbWUgb3V0
IG9yIGVycm9yIG91dCB3aXRoIGEgZ2VuZXJpYyBwcm90b2NvbCANCmVycm9yIHJldHVybi4N
CkkgdHJpZWQgaW5jcmVhc2luZyBVVkNfQ1RSTF9DT05UUk9MX1RJTUVPVVQganVzdCBpbiBj
YXNlLCBidXQgaXQgZGlkIG5vdCANCnNlZW0gdG8gaGVscC4NCg0KRnVsbCBsb2cgaXMgYmVs
b3c6DQoNCltOb3YyMiAxMjoxMV0gdXNiIDQtNDogbmV3IFN1cGVyU3BlZWQgUGx1cyBHZW4g
MngxIFVTQiBkZXZpY2UgbnVtYmVyIDEwIA0KdXNpbmcgeGhjaV9oY2QNClsgICswLjAxNzMx
NV0gdXNiIDQtNDogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTA0ZGEsIA0KaWRQ
cm9kdWN0PTIzODUsIGJjZERldmljZT0gMS4wMA0KWyAgKzAuMDAwMDA4XSB1c2IgNC00OiBO
ZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCANClNlcmlhbE51bWJl
cj0zDQpbICArMC4wMDAwMDRdIHVzYiA0LTQ6IFByb2R1Y3Q6IERDLVMxTTINClsgICswLjAw
MDAwMl0gdXNiIDQtNDogTWFudWZhY3R1cmVyOiBQYW5hc29uaWMNClsgICswLjAwMDAwMl0g
dXNiIDQtNDogU2VyaWFsTnVtYmVyOiAwMDAwMFoxMkZCMDA5MjUxDQpbICArMC4wMTkyMjJd
IHVzYiA0LTQ6IEZvdW5kIFVWQyAxLjEwIGRldmljZSBEQy1TMU0yICgwNGRhOjIzODUpDQpb
ICArNS4xMjczMzVdIHVzYiA0LTQ6IEZhaWxlZCB0byBxdWVyeSAoR0VUX0lORk8pIFVWQyBj
b250cm9sIDIgb24gdW5pdCANCjI6IC0xMTAgKGV4cC4gMSkuDQpbICArNS4xMTk4ODRdIHVz
YiA0LTQ6IEZhaWxlZCB0byBxdWVyeSAoR0VUX0lORk8pIFVWQyBjb250cm9sIDIgb24gdW5p
dCANCjE6IC0xMTAgKGV4cC4gMSkuDQpbICsxMC4yMzk5MzddIHVzYiA0LTQ6IFVWQyBub24g
Y29tcGxpYW5jZSAtIEdFVF9ERUYoUFJPQkUpIG5vdCANCnN1cHBvcnRlZC4gRW5hYmxpbmcg
d29ya2Fyb3VuZC4NClsgICswLjAwODI2NF0gdXZjdmlkZW8gNC00OjEuMTogRmFpbGVkIHRv
IHF1ZXJ5IChHRVRfQ1VSKSBVVkMgcHJvYmUgDQpjb250cm9sIDogLTcxIChleHAuIDM0KS4N
ClsgICswLjAwMDAxM10gdXZjdmlkZW8gNC00OjEuMTogRmFpbGVkIHRvIGluaXRpYWxpemUg
dGhlIGRldmljZSAoLTcxKS4NClsgICswLjAwMDAyNl0gdXZjdmlkZW8gNC00OjEuMDogcHJv
YmUgd2l0aCBkcml2ZXIgdXZjdmlkZW8gZmFpbGVkIHdpdGggDQplcnJvciAtNzENClsgICsw
LjEwMzA5NV0gdXNiIDQtNDogMzoxOiBjYW5ub3Qgc2V0IGZyZXEgNDgwMDAgdG8gZXAgMHg4
Mw0KWyAgKzAuMzU5ODI1XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxl
ZCAoLTcxKQ0KWyAgKzAuMzIwMDU2XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNl
IGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIwMDEwXSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50
ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIwMDExXSB1c2IgNC00OiAzOjE6IHVzYl9z
ZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzE5OTg3XSB1c2IgNC00OiAzOjE6
IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzE5OTk4XSB1c2IgNC00
OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIwMDU5XSB1
c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzE5
OTM2XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAg
KzAuMzIwMDAzXSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcx
KQ0KWyAgKzAuMzIwMDEzXSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxl
ZCAoLTcxKQ0KWyAgKzIuMjM5ODk4XSBlbmRwb2ludF9zZXRfaW50ZXJmYWNlOiA2IGNhbGxi
YWNrcyBzdXBwcmVzc2VkDQpbICArMC4wMDAwMDZdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9p
bnRlcmZhY2UgZmFpbGVkICgtNzEpDQpbICArMC4zMTk5OTNdIHVzYiA0LTQ6IDM6MTogdXNi
X3NldF9pbnRlcmZhY2UgZmFpbGVkICgtNzEpDQpbICArMC4zMTk5OThdIHVzYiA0LTQ6IDM6
MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtNzEpDQpbICArMC4zMzYwMDBdIHVzYiA0
LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtNzEpDQpbICArMC4zMjAwNjBd
IHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtNzEpDQpbICArMC4z
MjAwMDNdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgtNzEpDQpb
ICArMC4zMTk5NjNdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFpbGVkICgt
NzEpDQpbICArMC4zMjAwMzFdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFp
bGVkICgtNzEpDQpbICArMC4zMjAwMDBdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZh
Y2UgZmFpbGVkICgtNzEpDQpbICArMC4zMTk5MzldIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9p
bnRlcmZhY2UgZmFpbGVkICgtNzEpDQpbICArMi4yNzIyNzFdIGVuZHBvaW50X3NldF9pbnRl
cmZhY2U6IDYgY2FsbGJhY2tzIHN1cHByZXNzZWQNClsgICswLjAwMDAwNV0gdXNiIDQtNDog
MzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC03MSkNClsgICswLjMxOTk2OV0gdXNi
IDQtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC03MSkNClsgICswLjMyMDA0
MF0gdXNiIDQtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC03MSkNClsgICsw
LjMxOTY4N10gdXNiIDQtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC03MSkN
ClsgICswLjMxOTk3Nl0gdXNiIDQtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQg
KC03MSkNClsgICswLjMyMDAwMl0gdXNiIDQtNDogMzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBm
YWlsZWQgKC03MSkNClsgICswLjMyMDAwMF0gdXNiIDQtNDogMzoxOiB1c2Jfc2V0X2ludGVy
ZmFjZSBmYWlsZWQgKC03MSkNClsgICswLjMzNTk5NV0gdXNiIDQtNDogMzoxOiB1c2Jfc2V0
X2ludGVyZmFjZSBmYWlsZWQgKC03MSkNClsgICswLjMzNjI4OV0gdXNiIDQtNDogMzoxOiB1
c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC03MSkNClsgICswLjMxOTc1NV0gdXNiIDQtNDog
MzoxOiB1c2Jfc2V0X2ludGVyZmFjZSBmYWlsZWQgKC03MSkNCltOb3YyMiAxMjoxMl0gZW5k
cG9pbnRfc2V0X2ludGVyZmFjZTogNiBjYWxsYmFja3Mgc3VwcHJlc3NlZA0KWyAgKzAuMDAw
MDA2XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAg
KzAuMzE5NzMwXSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcx
KQ0KWyAgKzAuMzIwMjY5XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxl
ZCAoLTcxKQ0KWyAgKzAuMzE5NzI5XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNl
IGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIwMTQ1XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50
ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzE5ODg0XSB1c2IgNC00OiAzOjE6IHVzYl9z
ZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIwMjY0XSB1c2IgNC00OiAzOjE6
IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIwMDEyXSB1c2IgNC00
OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzE5NzA0XSB1
c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAgKzAuMzIw
Mjg3XSB1c2IgNC00OiAzOjE6IHVzYl9zZXRfaW50ZXJmYWNlIGZhaWxlZCAoLTcxKQ0KWyAg
KzIuMjM5NjgyXSBlbmRwb2ludF9zZXRfaW50ZXJmYWNlOiA2IGNhbGxiYWNrcyBzdXBwcmVz
c2VkDQpbICArMC4wMDAwMDZdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZhY2UgZmFp
bGVkICgtNzEpDQpbICArMC4zMTk5OTVdIHVzYiA0LTQ6IDM6MTogdXNiX3NldF9pbnRlcmZh
Y2UgZmFpbGVkICgtNzEpDQpbICArMC4yMzMwNTNdIHVzYiA0LTQ6IFVTQiBkaXNjb25uZWN0
LCBkZXZpY2UgbnVtYmVyIDEwDQo=
--------------Ty45Diy4o4sn82QzgIkhPIIQ
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

--------------Ty45Diy4o4sn82QzgIkhPIIQ--

--------------xHleJHRKuW0TeZEKJkeZpyKD--

--------------6KZNB941bpKSx6bZMSVwb40q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT+UBOcaAVyyv1SH42i/qXwPwNEZAUCaSGecAUDAAAAAAAKCRCi/qXwPwNEZD0Y
AP91brPKIB6Zl1SZaY98SNSrA0AYgRzNjPyuFHjb1QvvYgEAmpHOHwwYg21mTMAkJ6L2lsAmVvxi
Jm8ktLCQZABLZwM=
=SF/d
-----END PGP SIGNATURE-----

--------------6KZNB941bpKSx6bZMSVwb40q--

