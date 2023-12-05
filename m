Return-Path: <linux-media+bounces-1688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2A805D17
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 19:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 828821C211CE
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 18:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B417768B8B;
	Tue,  5 Dec 2023 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DxH1pk0c"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7225BAC;
	Tue,  5 Dec 2023 10:19:50 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B5IJdOJ041306;
	Tue, 5 Dec 2023 12:19:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701800379;
	bh=WAEGbkCdkZQkNXT1+Kwb7nEHiZjAZT6KEw41iaIbNQo=;
	h=From:To:CC:Subject:Date;
	b=DxH1pk0c8WJqs8oE4Yrex1n24HrbWfUZEafC3RW8/Wh54ZtQe7gNBNVX76a7i2rRV
	 kPdwpNXDbeRmkKe9uz11KAndcPW2Zi7qE5s1DFlhrgekAOybMWcY/hQYqk/x2by8W5
	 VQX+SC6aD9CuorLNUYL8VcCm4IUU5wowVshGsS7c=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B5IJdID115823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Dec 2023 12:19:39 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Dec 2023 12:19:39 -0600
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.023; Tue, 5 Dec 2023 12:19:39 -0600
From: "Brnich, Brandon" <b-brnich@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Nas Chung <nas.chung@chipsnmedia.com>
CC: "Menon, Nishanth" <nm@ti.com>, "Etheridge, Darren" <detheridge@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: Remove K3 Family Prefix from
 Compatible
Thread-Topic: [PATCH 1/2] dt-bindings: media: Remove K3 Family Prefix from
 Compatible
Thread-Index: AdonnnBOfXbF7ysvRZOWDYpHdQCVVA==
Date: Tue, 5 Dec 2023 18:19:39 +0000
Message-ID: <5240cd51831a471f859a0440f5405c51@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IE9uIDA0LzEyLzIwMjMgMTk6MTQsIEJyYW5kb24gQnJuaWNo
IHdyb3RlOg0KPiA+IEszIGZhbWlseSBwcmVmaXggaXMgbm90IGluY2x1ZGVkIGluIG90aGVyIFRJ
IGNvbXBhdGlibGUgc3RyaW5ncy4NCj4gPiBSZW1vdmUgdGhpcyBwcmVmaXggdG8ga2VlcCBuYW1p
bmcgY29udmVudGlvbiBjb25zaXN0ZW50Lg0KPiA+DQo+ID4gRml4ZXM6IGRlNGI5ZjdlMzcxYSAo
ImR0LWJpbmRpbmdzOiBtZWRpYTogd2F2ZTU6IGFkZCB5YW1sIGRldmljZXRyZWUNCj4gPiBiaW5k
aW5ncyIpDQo+IA0KPiBUaGlzIGNoYW5nZSBicmVha3MgdGhlIEFCSSwgc28gZG9lcyBpdCBtZWFu
IGl0IHdhcyBub3QgeWV0IHJlbGVhc2VkPw0KDQpUaGlzIGRyaXZlciBoYXMgbm90IHlldCBtYWRl
IGl0IGludG8gcmVsZWFzZXMuIEl0IGN1cnJlbnRseSByZXNpZGVzIGluIGxpbnV4LW5leHQuIA0K
DQo+IA0KPiBQbGVhc2UgdXNlIHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRvIGdldCBhIGxp
c3Qgb2YgbmVjZXNzYXJ5IHBlb3BsZSBhbmQNCj4gbGlzdHMgdG8gQ0MgKGFuZCBjb25zaWRlciAt
LW5vLWdpdC1mYWxsYmFjayBhcmd1bWVudCkuIEl0IG1pZ2h0IGhhcHBlbiwgdGhhdA0KPiBjb21t
YW5kIHdoZW4gcnVuIG9uIGFuIG9sZGVyIGtlcm5lbCwgZ2l2ZXMgeW91IG91dGRhdGVkIGVudHJp
ZXMuDQo+IFRoZXJlZm9yZSBwbGVhc2UgYmUgc3VyZSB5b3UgYmFzZSB5b3VyIHBhdGNoZXMgb24g
cmVjZW50IExpbnV4IGtlcm5lbC4NCg0KSSB3aWxsIHVwZGF0ZSB0aGlzIGluIG5leHQgdmVyc2lv
bi4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KVGhhbmtzLA0KQnJhbmRv
bg0KDQoNCg==

