Return-Path: <linux-media+bounces-11142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9138BFCAE
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 13:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D69F1F22398
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 11:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA65768FC;
	Wed,  8 May 2024 11:52:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D9823BF
	for <linux-media@vger.kernel.org>; Wed,  8 May 2024 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715169136; cv=none; b=frF3Z6i9iZ8XdbKk64VaDvPiR4PAP3sdMc/hyzGHROUIyX/uDJ0OUB5RExyZnu94rSSeKo4895USr+QbpPCsxt4qCFDLFHnPW/c+XeEULrRTOnHIjCTErNDgvbh5aBy6WlM11Pcam9YtvWPfFdgzrfr4HCqFaUcvKspLxfHUpJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715169136; c=relaxed/simple;
	bh=3TcpGLamPR+er3cedcxqpNcBb7/RyBJ4tTHiLInhVpI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=EUxRBh8V+uiOuyewowKk6TkNyOnjUKVWOzgK6p6d0xgRWoIxht04hDJ29VU8vAbkC1Kwt3EMI3/MIgV7YcTT7rFguVid5vmnAQ+LU7oKBQdO2jtC053HafSp+pnJWgX68/W4GddxkIhEItAUjgUXkuKtcZknWWFczgM5IGZs5VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-28-ejStQR8JMFGrAgvUcnec0Q-1; Wed, 08 May 2024 12:52:11 +0100
X-MC-Unique: ejStQR8JMFGrAgvUcnec0Q-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 8 May
 2024 12:51:40 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 8 May 2024 12:51:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>, "T.J.
 Mercier" <tjmercier@google.com>, Charan Teja Kalla
	<quic_charante@quicinc.com>, zhiguojiang <justinjiang@vivo.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "opensource.kernel@vivo.com"
	<opensource.kernel@vivo.com>
Subject: RE: [PATCH] dmabuf: fix dmabuf file poll uaf issue
Thread-Topic: [PATCH] dmabuf: fix dmabuf file poll uaf issue
Thread-Index: AQHaoId+JYKtMQTt+U6dUCQNubR7xbGNNzKw
Date: Wed, 8 May 2024 11:51:40 +0000
Message-ID: <c0fe95949d4f41449f17add8300270b9@AcuMS.aculab.com>
References: <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
 <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
 <ZjovD5WaWjknd-qv@phenom.ffwll.local>
 <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
In-Reply-To: <44b08793-cf44-4cbd-a3bb-583af351ab9e@amd.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZw0KPiBTZW50OiAwNyBNYXkgMjAyNCAxNTowNQ0KLi4uDQo+
IEkgYWN0dWFsbHkgaGF2ZSBiZWVuIHRlbGxpbmcgcGVvcGxlIHRvIChhYil1c2UgdGhlIGVwb2xs
IGJlaGF2aW9yIHRvDQo+IGNoZWNrIGlmIHR3byBmaWxlIGRlc2NyaXB0b3JzIHBvaW50IHRvIHRo
ZSBzYW1lIHVuZGVybHlpbmcgZmlsZSB3aGVuDQo+IEtDTVAgaXNuJ3QgYXZhaWxhYmxlLg0KDQpJ
biB3aGF0IHdheT8NCllvdSBjYW4gYWRkIGJvdGggZmQgdG8gdGhlIHNhbWUgZXBvbGwgZmQuDQpS
ZWx5aW5nIG9uIHRoZSBpbXBsaWNpdCBFUE9MTF9DVExfREVMIG5vdCBoYXBwZW5pbmcgdW50aWwg
Ym90aCBmZCBhcmUNCmNsb3NlZCBpcyBhIHJlY2lwZSBmb3IgZGlzYXN0ZXIuDQooQW5kIEkgY2Fu
J3Qgc2VlIGFuIG9idmlvdXMgd2F5IG9mIHRlc3RpbmcgaXQuKQ0KDQpRNi9BNiBvbiBlcG9sbCg3
KSBzaG91bGQgYWx3YXlzIGhhdmUgaGFkIGEgY2F2ZWF0IHRoYXQgaXQgaXMgYW4NCidpbXBsZW1l
bnRhdGlvbiBkZXRhaWwnIGFuZCBzaG91bGRuJ3QgYmUgcmVsaWVkIG9uLg0KKGl0IGlzIHdyaXR0
ZW4gYXMgYSAnYmV3YXJlIG9mJyAuLi4pDQoNClRoZSBvdGhlciBwb2ludCBpcyB0aGF0IHRoZXJl
IGFyZSB0d28gd2F5cyB0byBnZXQgbXVsdGlwbGUgZmQgdGhhdA0KcmVmZXJlbmNlIHRoZSBzYW1l
IHVuZGVybHlpbmcgZmlsZS4NCmR1cCgpIGZvcmsoKSBldGMgc2hhcmUgdGhlIGZpbGUgb2Zmc2V0
LCBidXQgb3BlbigiL2Rldi9mZC9uIikgYWRkcw0KYSByZWZlcmVuY2UgY291bnQgbGF0ZXIgYW5k
IGhhcyBhIHNlcGFyYXRlIGZpbGUgb2Zmc2V0Lg0KDQpJIGRvbid0IGtub3cgd2hpY2ggc3RydWN0
dXJlIGVwb2xsIGlzIHVzaW5nLCBidXQgSSBzdXNwZWN0IGl0IGlzDQp0aGUgZm9ybWVyLg0KU28g
aXQgbWF5IG5vdCB0ZWxsIHlvdSB3aGF0IHlvdSB3YW50IHRvIGtub3cuDQoNCglEYXZpZA0KDQot
DQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwg
TWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpDQo=


