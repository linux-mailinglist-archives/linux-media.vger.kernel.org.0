Return-Path: <linux-media+bounces-39112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA4B1E620
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 615BD18A5FC0
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B15A26E700;
	Fri,  8 Aug 2025 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTML8GXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF42222C0;
	Fri,  8 Aug 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754647605; cv=none; b=eZLatwF/azKSRNDtcrsX3xlG6iag2LbKUeoVnoBcykWAcWVje8H5DxDThPyRQw/uWBauwkzsjBMqAb81hswFEh6UtMQ2fPAyRXYbsT/wApZTNvqrN3bf0zWG4Mhprnw6mwKpEVIg9bdI3s55CpHMKPsLwU96YHKC1C90frZ1ILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754647605; c=relaxed/simple;
	bh=io0W5ZUkyF4BQOZtHK83UojIhkqZGN7x93gjkzYLdSA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=mrH2S26sSOJSV+3KvTTRfAemr+T6TFN04dMIxkvvDP7m8sUE9ht6PwWnmOtX6TyRfkeEkNVnDk2SnCPDywCna2zlh4OyPRN4H+mrGSfBMrNiu61aigvgCS8QAXxZEW45+AP2aE4UaIqRh7ZkFgOumQvVR+ffudK0SC0MO+3J80s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTML8GXG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so12482295e9.1;
        Fri, 08 Aug 2025 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754647602; x=1755252402; darn=vger.kernel.org;
        h=cc:autocrypt:subject:to:content-language:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=io0W5ZUkyF4BQOZtHK83UojIhkqZGN7x93gjkzYLdSA=;
        b=bTML8GXGXNCcy7vCPYpFg3DCam9bcEK5ep0L8MUMVgCSofrLsVZyFb3TjjQn7GS2Vg
         9bY/KLCgnoXKpp7ebhsPBIZsGAdWQ4UiRNUh2M6YXyJHq+vcgL8UHaQ3Z6B7IyvsxVWr
         jQAErZItv9QLjg2NsQ60r0qLcj5dRANHzH53WkKD+06eDlwM1rl7L+WnY8kude8kRpHu
         DCCWh4GhwxbU/LOYnPzMLfRlPOZgx7oZH06eWBF4kadNsaqcaJvTKlovOxwhK9JknkKH
         AphveXojW0CMuo5BDPZYkRsL0CekAs2P2lvp8bf4iT55oOwbV48MF3E+JGzfyryyPC6E
         Jn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754647602; x=1755252402;
        h=cc:autocrypt:subject:to:content-language:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=io0W5ZUkyF4BQOZtHK83UojIhkqZGN7x93gjkzYLdSA=;
        b=eGmy39x6YFRDrTj5cvNu3PxKyCcQC2cD1BTYcuffC1/BcIZn64skDdV5OXPxRowvBZ
         YCv3vjrOr4GHoBIfBlC2LXHkMmxjpsmXuz41+qI76+rr3Nz8Rj9fMequzLvEHguxVMrK
         3pJO7F5oJ9WzNyxfjShuX7iDCMgLbzk+gqa8pRecgUEd5DIumOMWf2T2s8GteODGqDc7
         mtcnwYfdG3S1pWZ01MSLKsjP/sJqX+3SEDyKHXtO5t9l7P/zeInF/lueNHpS5YAZT9Du
         jPZcYK4eY2dh4zuxWk5IKOjAStj4IhKptuvzALWH6TfmvgRnU1x2YLwfYWgGaWTi4us/
         NagQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfvrjMjZDWlQXGp9bv7Ld/P6NVDQp1ISYq5eXS8dTBh0lJs+w2oj3+kzqn+LdxOpyegoghtX5IQ2jp0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIgBVgO9pEf6teM/h80jdI/Ugl0DyMU/RrlBX//uNru4+Rx3y
	Z68XAFNMV2mFbDQg/31Y83Yb0tqrJNVU562vgVre/x+Y4dDPjzEVT3G9
X-Gm-Gg: ASbGnctWr+GzcFUSpnPenT54+HlXQ0sKtEPkiPrlG1nn7h08G/09uwtw/Natjx1OBUl
	SG5xpEhl7pvYjfGh+q5zTv/mFH+bz5GWr5tKRK0Nj8CqJXmPHKEL9sHsM+Sx9WOoB/vCEC9odvI
	vDAb5vibFirT+v+AmVbg4mLyUgqZaGV75ETXcUJH29UnkeKbEKa4jjrESe29s6EPgTdRIXzD8NK
	D2aRM5sisZoicY3Cm6lUqr3SRXT1PcHsdGIgWP9+3ZFwiAMmk3+iX045+RhSH3JOciE3ODxcBzK
	xluZsX8TFtm6PLZFsxPcFaoua60VGiF0tP6zbFCSA0vL64fJMIHQ70isqVY+cMTRLLXREFLp/X/
	VmmI5FZnfa65+2Z8g6/6L1eSYwU2m
X-Google-Smtp-Source: AGHT+IEObtFgh3ZGTf91Pphc4hvMw/HdYmC4o88atdidCuJDwo78GI2hW3jhgAhqbCVsloI/JjDYzw==
X-Received: by 2002:a05:600c:1d09:b0:456:18f3:b951 with SMTP id 5b1f17b1804b1-459f4f52793mr24215365e9.15.1754647602150;
        Fri, 08 Aug 2025 03:06:42 -0700 (PDT)
Received: from [192.168.1.248] ([87.254.0.133])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459de91ea4csm183586455e9.10.2025.08.08.03.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 03:06:41 -0700 (PDT)
Message-ID: <9b3313da-9cc3-4d3e-b271-05ee36736e4f@gmail.com>
Date: Fri, 8 Aug 2025 11:06:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Content-Language: en-US
To: Yong Zhi <yong.zhi@intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "mailing list: linux-media" <linux-media@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: media: staging/intel-ipu3: css - possible typo in array being
 assigned
Autocrypt: addr=colin.i.king@gmail.com; keydata=
 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
 FVPMkxl2UyaayDvhrO9kNXvl1SKCpdzCMQ==
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iMR1GU76jux04c0OnV7Zhg8y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iMR1GU76jux04c0OnV7Zhg8y
Content-Type: multipart/mixed; boundary="------------ihZSP9d8oGbm7bFbCCqRDTyG";
 protected-headers="v1"
From: "Colin King (gmail)" <colin.i.king@gmail.com>
To: Yong Zhi <yong.zhi@intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "mailing list: linux-media" <linux-media@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <9b3313da-9cc3-4d3e-b271-05ee36736e4f@gmail.com>
Subject: media: staging/intel-ipu3: css - possible typo in array being
 assigned

--------------ihZSP9d8oGbm7bFbCCqRDTyG
Content-Type: multipart/mixed; boundary="------------YQUBdPPgpdrf0SflEkXmss59"

--------------YQUBdPPgpdrf0SflEkXmss59
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgYmVsaWV2ZSB0aGVyZSBtYXliZSBhIHR5cG8gaW4gdGhlIG5hbWUgb2YgYW4g
YXJyYXkgYmVpbmcgYXNzaWduZWQsIA0KaW50cm9kdWNlZCBpbiBjb21taXQ6DQoNCmNvbW1p
dCBlMTExMTBhNWI3NDQ4N2NmYzk5ZGFkOGE1NzQ0ZmUyNjc4MmY1ZDljDQpBdXRob3I6IFlv
bmcgWmhpIDx5b25nLnpoaUBpbnRlbC5jb20+DQpEYXRlOiAgIFRodSBEZWMgNiAyMDowMzoz
MyAyMDE4IC0wNTAwDQoNCiAgICAgbWVkaWE6IHN0YWdpbmcvaW50ZWwtaXB1MzogY3NzOiBD
b21wdXRlIGFuZCBwcm9ncmFtIGNjcw0KDQoNClRoZSBpc3N1ZSBpcyBhcyBmb2xsb3dzIGlu
IGZ1bmN0aW9uIGltZ3VfY3NzX2FjY19wcm9jZXNzX2xpbmVzIGluIA0KZHJpdmVycy9zdGFn
aW5nL21lZGlhL2lwdTMvaXB1My1jc3MtcGFyYW1zLmMNCg0KICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChwbF9pZHggPT0gMCkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIEZpcnN0IHByb2Nlc3MgbGluZSAqLw0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcF9wbFtwbF9pZHhdLmxpbmVzID0gZmlyc3RfcHJvY2Vzc19saW5lczsNCiAg
ICAgICAgICAgICAgICAgICAgICAgICBlbHNlIGlmIChwbF9pZHggPT0gbnVtX29mX3NldHMg
LSAxKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogTGFzdCBpbiBncmlk
ICovDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwX3BsW3BsX2lkeF0ubGlu
ZXMgPSANCmxhc3RfcHJvY2Vzc19saW5lc19pbl9ncmlkOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgIGVsc2UgaWYgKHBsX2lkeCA9PSBudW1fb2ZfcHJvY2Vzc19saW5lcyAtIDEpDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBBZnRlciB0aGUgZ3JpZCAqLw0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcF9wbFtwbF9pZHhdLmxpbmVzID0g
DQpwcm9jZXNzX2xpbmVzX2FmdGVyX2dyaWQ7DQogICAgICAgICAgICAgICAgICAgICAgICAg
ZWxzZQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogSW5zaWRlIHRoZSBn
cmlkICovDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwX3BsW3BsX2lkeF0u
bGluZXMgPSBwcm9jZXNzX2xpbmVzOw0KDQogICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHBfdHIpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBfcGxbcGxfaWR4
XS5jZmdfc2V0ID0gcGxfY2ZnX3NldDsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBsX2NmZ19zZXQgPSAxIC0gcGxfY2ZnX3NldDsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICB9DQogICAgICAgICAgICAgICAgICAgICAgICAgcGxfaWR4Kys7DQoNCg0KVGhlIG5v
bi1udWxsIGNoZWNrICdpZiAocF90ciknIHNlZW0gc3VzcGVjdCwgc2hvdWxkIGl0IGJlICdp
ZiAocF9wbCknIA0KaW5zdGVhZCBzaW5jZSBwX3BsIGlzIGJlaW5nIGFzc2lnbmVkICh0aGlz
IG1heWJlIGEgY3V0LW4tcGFzdGUgaXNzdWUgDQpmcm9tIGEgcHJldmlvdXMgaHVuayBvZiBj
b2RlIHRoYXQgZG9lczoNCg0KICAgICAgICAgICAgICAgICAgICAgICAgIG9wX2lkeCsrOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwX3RyKSB7DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwX3RyW3RyX2lkeF0uc2V0X251bWJlciA9IHRyX3NldF9udW07
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cl9zZXRfbnVtID0gMSAtIHRy
X3NldF9udW07DQogICAgICAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAg
ICAgICAgICAgIHRyX2lkeCsrOw0KDQpBbHNvLCBpZiBpdCBpcyBtZWFudCB0byBiZSBhIGNo
ZWNrIG9uIHBfcGwgdGhlbiBzdXJlbHkgdGhlIGFzc2lnbm1lbnRzIA0KdG8gcF9wbFtdIGFs
c28gbmVlZCBhIG5vbi1udWxsIGNoZWNrIGluIHRoZSBjYXNjYWRlZCBpZi9lbHNlIGNoZWNr
cyB0b28uDQoNCkNvbGluDQo=
--------------YQUBdPPgpdrf0SflEkXmss59
Content-Type: application/pgp-keys; name="OpenPGP_0x68C287DFC6A80226.asc"
Content-Disposition: attachment; filename="OpenPGP_0x68C287DFC6A80226.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBE6TJCgBEACo6nMNvy06zNKj5tiwDsXXS+LhT+LwtEsy9EnraKYXAf2xwazc
ICSjX06efanlyhB0figzQO0n/tP7BcfMVNG7n1+DC71mSyRK1ZERcG1523ajvdZO
xbBCTvTitYOy3bjs+LXKqeVMhK3mRvdTjjmVpWnWqJ1LL+Hn12ysDVVfkbtuIm2N
oaSEC8Ae8LSSyCMecd22d9PnLR4UeFgrWEkQsqROq6ZDJT9pBLGe1ZS0pVGhkRyB
P9GP65oPev39SmfAx9R92SYJygCy0pPvBMWKvEZS/7bpetPNx6l2xu9UvwoeEbpz
UvH26PHO3DDAv0ynJugPCoxlGPVf3zcfGQxy3otydNTWkP6Wh3Q85m+AlifgKZud
jZLrO6c+fAw/jFu1UMjNuyhgShtFU7NvEzL3RqzFf9O1qM2muj83IeFQ1FZ65QAi
CdTa3npz1vHc7N4uEQBUxyXgXfCI+A5yDnjHwzU0Y3RYS52TA3nfa08yLGPLTf5w
yAREkFYou20vh5vRvPASoXx6auVf1MuxokDShVhxLpryBnlKCobs4voxN54BUO7m
zuERXN8kadsxGFzItAyfKYzEiJrpUB1yhm78AecDyiPlMjl99xXk0zs9lcKriaBy
VUv/NsyJFQj/kmdxox3XHi9K29kopFszm1tFiDwCFr/xumbZcMY17Yi2bQARAQAB
zSdDb2xpbiBJYW4gS2luZyA8Y29saW4uaS5raW5nQGdtYWlsLmNvbT7CwZEEEwEI
ADsCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQRwYtqk8AG5xmFnAM9owoff
xqgCJgUCY8GcawIZAQAKCRBowoffxqgCJtd/EACIWcaxfVt/MH4qqo5ELsjCFPVp
+RhVpQDWy8v9Np2YbTcZ4AY2Zj4Pq/HrZ3F/Bh02v85C6mNv8BDTKev6Qcq3BYw0
iqw6/xLNvRcSFHM81mQI9xtnAWIWfI9k5hpX19QooPIIP3GOMdMc1uRUGTxTgTFA
AsAswRY3kMzo6k7arQnUs9zbiZ9SmS43qWOIxzGnvneekHHDAcomc/oho7kgj6rK
p/f9qRrhForkgVQwdj6iBlW934yRXzeFVF3wr7Lk5GQNIEkJiNQPZs54ojBS/Kx6
3UTLT1HgOp6UY9RPEi9wubmUR+J6YjLRZMr5PCcA86EYmRoysnnJ8Q/SlBVD8npp
GVEcuvrbH3MBfhmwOPDc3RyLkEtKfSTB92k1hsmRkx9zkyuUzhcSnqQnpWGJD+xt
KHvcHRT7Uxaa+SDwUDM36BjkyVcZQy8c+Is2jA55uwNgPpiA7n82pTeT+FRGd+7i
CLQHaryu6FO6DNDv09RbPBjIiC/q814aeKJaSILP1ld9/PEBrLPdm+6lG6OKOt9D
DV6jPmfR96FydjxcmI1cgZVgPomSxv2JB1erOggB8rmX4hhWYsVQl1AXZs3LdEpJ
6clmCPspn/ufZxHslgR9/WR1EvPMQc8XtssF55p8ehRIcVSXDRcMFr3ZuqMTXcL6
8YbDmv5OGS95O1Gs4c0iQ29saW4gS2luZyA8Y29saW4ua2luZ0B1YnVudHUuY29t
PsLBdwQTAQgAIQUCTwq47wIbAwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgAAKCRBo
woffxqgCJo1bD/4gPIQ0Muy5TGHqTQ/bSiQ9oWjS5rAQvsrsVwcm2Ka7Uo8LzG8e
grZrYieJxn3Qc22b98TiT6/5+sMa3XxhxBZ9FvALve175NPOz+2pQsAV88tR5NWk
5YSzhrpzi7+klkWEVAB71hKFZcT0qNlDSeg9NXfbXOyCVNPDJQJfrtOPEuutuRuU
hrXziaRchqmlhmszKZGHWybmPWnDQEAJdRs2Twwsi68WgScqapqd1vq2+5vWqzUT
JcoHrxVOnlBq0e0IlbrpkxnmxhfQ+tx/Sw9BP9RITgOEFh6tf7uwly6/aqNWMgFL
WACArNMMkWyOsFj8ouSMjk4lglT96ksVeCUfKqvCYRhMMUuXxAe+q/lxsXC+6qok
Jlcd25I5U+hZ52pz3A+0bDDgIDXKXn7VbKooJxTwN1x2g3nsOLffXn/sCsIoslO4
6nbr0rfGpi1YqeXcTdU2Cqlj2riBy9xNgCiCrqrGfX7VCdzVwpQHyNxBzzGG6JOm
9OJ2UlpgbbSh6/GJFReW+I62mzC5VaAoPgxmH38g0mA8MvRT7yVpLep331F3Inmq
4nkpRxLd39dgj6ejjkfMhWVpSEmCnQ/Tw81z/ZCWExFp6+3Q933hGSvifTecKQlO
x736wORwjjCYH/A3H7HK4/R9kKfL2xKzD+42ejmGqQjleTGUulue8JRtpM1AQ29s
aW4gSWFuIEtpbmcgKEludGVsIENvbGluIElhbiBLaW5nIGtleSkgPGNvbGluLmtp
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
=3DQKm6
-----END PGP PUBLIC KEY BLOCK-----

--------------YQUBdPPgpdrf0SflEkXmss59--

--------------ihZSP9d8oGbm7bFbCCqRDTyG--

--------------iMR1GU76jux04c0OnV7Zhg8y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEcGLapPABucZhZwDPaMKH38aoAiYFAmiVzAsFAwAAAAAACgkQaMKH38aoAibw
Jg/+JYSJvtZkr8C7U5FH5+VOJZmwINaVQhYdOdZzuXqPLS3PooRF5f7254iKtsbP8szeuampOXBQ
3eWFFtYom8pBtdWBvwgfFnavR/r8qXAOPLnTXkaRsLpNmcda4b1JGsKURXUec7I2e0N6frh0UEpA
aGjaMvblHp3w0i5dO7So3zF4vCH2RLfAcUVndRVm2+g71oCae5nVMyF8eTeCLBUB6XSQffgEARrK
hOYKn+8LSp+fFvtBuOSk3g6noTDcLl5Y6OyfCf2dumFYNjxavVONV7R6C577Rr04aVVjNo9mMqyc
T0njCTJlD9Zf17ve5dkPeslBMgfDZLzr+4c+v2suspn6V3RKzJJq69ZfQyBv9iC8e3YO9ZcY+j+a
G1M8Dg8H5T8cqtxajGzzPYucN/cEpqftKk4QaGhBAgoZiXyWyQ25cjFPJb7k863PEQ0lugXXcs64
28lRJdCe49s4I80KkgKTyVdT9cFfY1VecGECuFKMz26+znSOGyELjtLd66Sdb1pe3txc7ccbGa3r
5sWvb1tzyJbI957UAuAREdhaZ7AA4h6X0cMQqL078755eaozLlGBjopVJR05qsjSNv1Gjhmo3hPY
lptvxxtCTfsTnGCi03/685AEXRuJ1aCSKboUrKyd5J9QBDwogqwqW8LCL58f2F/6pthyAgwGta6F
RH4=
=ctpJ
-----END PGP SIGNATURE-----

--------------iMR1GU76jux04c0OnV7Zhg8y--

