Return-Path: <linux-media+bounces-27238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F2A49AEF
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 14:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0734B1884DCD
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7D926D5A5;
	Fri, 28 Feb 2025 13:47:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400333E7;
	Fri, 28 Feb 2025 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750452; cv=fail; b=KFgeJx9XsaHz/cTptn4KG8USW9yNTP3pF7sr2ZBLcuvrea1qn1ps3FvI3vbt/bym23jqf3GEKIg8Ek4agKM3qHKDO2Qdj5TMYwDwHKjijML1f0HFSTXo9k27JQWMDG2k/ZFopwDVvqbRYHUz3LBoNRL7BZtgWDqJIfdeHO3P9QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750452; c=relaxed/simple;
	bh=j6naD/7hzqWQZSs8fOWGo/uzAxpBjhO4d71N7acvmtQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X03J0u91PSprujiCTfeBm1aQkghBZdO7SMWHCSCmymeDllnr8/ZbDGftbxpvYrboAnBdY3Tb18SsrT8Mxzue9a3gqirq3rrQEJWMl18FYpJnOHk98znLIKNNSgF67I9F+M0M/yC1z5A57DVy65wK+uNGTx2/bx7OkotGV4JVTnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eg92m6cv4hOe8RB/kn/KxgaHYDyWM6SUqjHBsNLJ1I7LW//vqq8/O2oDQzDbOLywaDO9WLXERwuhvxwxNi0ERhapULDcaJRYE+8gZVrafsCTpVUwwElpDlQ+lzjmOO23uyBzdeU4Jets2PZDKsRdiZ0dajWYr2/k7LdmTj5pz14oinIi8ABnxILDjJ5mEuEI6vuni2eQnTTH8H+bTk8cnL4ZT3Kq/+hS3Z7FEKwMArQOFxZsLV6YHl3O8NWx+1+jaLgTTCjezxdoixSwooOVtYAZrph1Uh+vzh9JkmQIc82sz3AXsy9D58Bf1XQhF+JNdU6PqdnKchqx2WPZ8YeJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6naD/7hzqWQZSs8fOWGo/uzAxpBjhO4d71N7acvmtQ=;
 b=iw1D5G8UDwFFKMZI2YimRcJq0q8+qWY1BLoq24egFgqwSy7L89pLXZAmjAQ1CI1n7JaJdmCguwGWP3EA/Pykg/pFQ0ZutO9d/CeyYId1TDMMFZ5/sc11i8gwV8oL+Mofv+P+IvjcXQMzevENhoZFdMiXdSrUJ3jEAsWPfRUELhGsQkREIgo0CHadXxGqmKkPjYNY5ULhI5yIVPeJnvIg3gOT7ajJyTpJXDGcYYEOskzpDd952oXXxfVNUMAMYx7ubwTKdb5dpxgSn0AF8wPlFxqDCzMJSZYn7MvjBtPOYAmQhj0oUPy7KiBWS+W106HcAhly9f1fFDCR5Z/Dcwswrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.15; Fri, 28 Feb
 2025 08:13:28 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.8489.014; Fri, 28 Feb 2025 08:13:28 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <jai.luthra@linux.dev>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mripard@kernel.org" <mripard@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devarsht@ti.com" <devarsht@ti.com>,
	"vaishnav.a@ti.com" <vaishnav.a@ti.com>, "r-donadkar@ti.com"
	<r-donadkar@ti.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHY0IDEvMl0gZHQtYmluZGluZ3M6IG1lZGlhOiBjZG5z?=
 =?gb2312?B?LGNzaTJyeC55YW1sOiBBZGQgb3B0aW9uYWwgaW50ZXJydXB0cyBmb3IgY2Ru?=
 =?gb2312?Q?s-csi2rx?=
Thread-Topic: [PATCH v4 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Thread-Index: AQHbibYgFGqb0Mv2TUqT4WB2cqPhxLNcXTCg
Date: Fri, 28 Feb 2025 08:13:28 +0000
Message-ID:
 <ZQ0PR01MB1302A225A08A120789EC318DF2CCA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250227082920.744908-1-y-abhilashchandra@ti.com>
 <20250227082920.744908-2-y-abhilashchandra@ti.com>
 <20250228-sandy-nightingale-of-improvement-6eef5a@krzk-bin>
 <24y6ggufmhmjkfxymhhxslthpbrsthfp67hkvq36dmnewpnv5c@dbs3hhhpme4w>
In-Reply-To: <24y6ggufmhmjkfxymhhxslthpbrsthfp67hkvq36dmnewpnv5c@dbs3hhhpme4w>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1013:EE_
x-ms-office365-filtering-correlation-id: 2b85fc7e-1b50-4ad9-73fb-08dd57cfc815
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 R6oG8/KR/k3HRiNuhc5AVsLzNcnbZi9Z6+yt2GnKkQh9RAWHtalx9w0kgte5AXHkT6KvvuGCoQUl1zMi3K/LUFMKZ6DxnWSTyb0tvzCHxN8RZMWlPbbfqSqmZr1Xg+TZC7eLjtnScp4q5ungtfkAzfsftecE6mHvXBWVfoBI7XbvN02fn3iQg5GQCybY21EIVvimkMsD9qPJTK6BUg14ZDai5eV0iGSBb5x8REsAsEFD6ZmTh9PKLkvtkH40FkFhAnPzEjHsxnDzrw5GMwuOkYClbNFwpYfYwkQnxwLfZ+ZbJOvb+PP2STZC6MARmGv0xQh90JwQyNZRB+DbGgrQpDdn1yzrtcWz+nISMG2uvI0a6IfhuSJjJP9g1BTnucdIZdp9Cr77HYljEa6UiCgr7zzQkclk6ehtoypefXiKcl5y45Hy0ZUQgQJvpKBUMOQ0dNfud8yJw2xwRUGd9vZ3QrwPy8QXI0kPuPoU9xfnOoiRDh1tYOZv72vC0uSfTL1Y/DbrctAjil1YmES47vBPNoGfxrOQQcBIMkEWGAuW/qQzTgLbSMofTZ3S+RvNpcGSjut/VS0rDcCcLCi/su0ovIV92NdD9FfiYekBns3mlJE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RWRSWUExV2pCYXRLbDV5SVU3S2k2dngxdE5HNWsxTFJpYUdKQkVINDNaTVcv?=
 =?gb2312?B?YkxJbXIvZFRwbVZueTVXN29rSFpQQjg5SkFGN3Q0dDdHNDBnK2JPUnpYOUtu?=
 =?gb2312?B?TXVlTDUvWFAxMDZkVXlrZmFnR2JVcm5GYjB6SnoxZTV4eDNibXEwcktOVEh6?=
 =?gb2312?B?cS83M0h5UXNCS0loNFJ4eVpJNU1OeDZMd3NObThmV3U3UkFndWd1TTBnUzVJ?=
 =?gb2312?B?VE54WmtTLytjY3FycUhhQ1B2UlV1aVpCRDRxZEZWN3Y4VEhTL1YxV2JwZWdB?=
 =?gb2312?B?eGpDc0pWUFZOcVlySVVScmtnMm5OMHVCUUhNU1NndmRnbUtydmE3VFlnNDBR?=
 =?gb2312?B?blROb2JKOFEwSGNrM1ZGTFpGcVdpVU91Tk9TVHJ4dk0raEhTbWZlOGlTS1pI?=
 =?gb2312?B?aWY3ZHkzd0ZqT2dlWDdzd1VIT1F4K0RwZmIwS1JvK24vMU9ENmFnNnlpRkVZ?=
 =?gb2312?B?cjE3TCtIbnFOZzEzM3lRQTBDcTB0MStTWGwzQzBvT2gydDZzeVVqMDY4dTFu?=
 =?gb2312?B?M0R1WFcyWDBjeUw1Y3U0ZzQwU3VBUzMyOXJEbkRNdXFQZHJPdENydDV0Y2VP?=
 =?gb2312?B?aThWanpXaXBQZFVWZXJsRkY0OGpNM0RRRDVoQ0RDMmxNdFdObEhKQmJPQVZR?=
 =?gb2312?B?U2dtWHhGK3JUOG5CWVVKdzQyU2tnUS9uU2x5SjJzd3NNQXZDaDQ1bFpCT2xT?=
 =?gb2312?B?WTI1L1JPRDlJU0t6cFBmSVZRNGJnR3BUK3ZOb0dSb1RxYytQK1dUam5NYTdZ?=
 =?gb2312?B?K2JlNTBSRWhSSWFBMTNiWXRwUHlMdGs2dEoyQ2dhWEZsemxXdndiM2R3c1V0?=
 =?gb2312?B?WVJ4RFg3SFNwSDdRRHJoMXVsVHJOcG1ERmRpbjF2dW0zUFpNeUpoMXc4dEJH?=
 =?gb2312?B?WkdQWnFBbEhTRnVwa0tHVHZ6SXV0ZmZIbUlHTWZ5QVZUcWdXcFUwcFFJbjd0?=
 =?gb2312?B?a2ZCdXljZTFsVVp1UHkzQTdIK2luQU1ZbXB6bDAreTVndjFXd0pjek5hc1dU?=
 =?gb2312?B?TFNFaWQ5Y05sK3FpKzNPRVA3elVTZGtSNTQ3L1V4a0gvNHVGQzF4ZWppQXdx?=
 =?gb2312?B?RmhXRFVFQVlLZ0RKc1NiRnBwdW1Idk10L1pPd1hLVWwrRHlpc0Ruakg4T1FK?=
 =?gb2312?B?dzJ3aHhrckxpZWIxWVpnTCtGMU5lL1krMFlyeUMwMllBaFpoZi9MZTNmOU0v?=
 =?gb2312?B?TEtzUEx2R3IrVkhpdjlhRnZ4SVdsejVjRmNBSTFmK0RUN3A0ZVMraURBQ0hh?=
 =?gb2312?B?cVM1M0UwREcvTzlLWERmYXRLV2E4eGRGUmY3VmRhTDR6QmZzR1l3a2M1Ynpo?=
 =?gb2312?B?ZDlCN3MzN3hETkVtSVNOdjNXcnJaY1RST2E0UU5ya2hQQWNFTmFRbVU4ZzM1?=
 =?gb2312?B?NVIrWE40RnEvY0xQMFhpOUxacE9yYkc1L05RTm5jalhzYWVQOUM3eHVBUG5y?=
 =?gb2312?B?Y1NlK0M5NkhrL0xOUFB5YUJGVkhQRzFMOS9Rc1hnQU1sR3lrbDJ0OVovZnBv?=
 =?gb2312?B?b1pqdXVpTk9Ld3pKRHpIQTFlTCthdDlVUEd6ZUhQa2xTdDZHWitWK3Z0VW5K?=
 =?gb2312?B?bEpGdWlpQ0xaTCs5MU5rNXpDaE1DMHF6ejBXTUJlQVIvN3JwbVRjVlNhN0Rs?=
 =?gb2312?B?Z09TZk1TMlYySXo1aG9heEs4bmlyQ3RJZzBENmFsc3QyVGFjbFJzazFON3NX?=
 =?gb2312?B?TEdXRVoyOFhnMHVUb09lVW91dk5KWFdSY0ZIUWRibmpiTllNSjYyK096NUpk?=
 =?gb2312?B?M3MxVnRSOEJER015aWU1cUxSOUZjYnZTN0RqeEtkemhVZk5rZUFBSzF4bG04?=
 =?gb2312?B?amZwVkdDdUFWRzdPRjdYUGU0eEloRmx0d1FVdzIvY0RlWHF6dGJNWXorcGQ4?=
 =?gb2312?B?RjJQNlB1ck9LZU51eEdjMXBDTzE2aXVDeG8ra2tHQ2lwL2JXb0dEQkJYNm5W?=
 =?gb2312?B?a3BITER1ZUJjZXBaYWY0UmpzaEhBWW1oY0tWbG15N2M1MVlkMmpMeFJhem1l?=
 =?gb2312?B?OWdnSVBqdUpGVGtVWnN0ckFFZmlwYkFXbklxVWdzcVRZRTNkenNGUkk5blpI?=
 =?gb2312?B?aFJscE53cS9jV1lmRG9hWWZDVnJGRE5KWE1tOUJYZTY1bWlUVUE3MmZ0Wmtm?=
 =?gb2312?B?V2YvZGZzSlhweXh5dStrSXhsd2R1RVpxVU5uVno4NDZZRThrcEZjenZuTkEw?=
 =?gb2312?B?OWc9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b85fc7e-1b50-4ad9-73fb-08dd57cfc815
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 08:13:28.2835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7BGDZ92d+SabiU0jSS4tKuBkxorr5VViNxdPiLKn51Crm4u/wxIKEVZYiUGS61EXmzZ27RVVVTI2mJkv4GAdtvhOEQE94lvzpjCBDOKPsaPf1gFtuLneSjGqt+2em15
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1013

SGksIEphaQ0KDQo+IEhpIEtyenlzenRvZiwNCj4gDQo+IE9uIEZyaSwgRmViIDI4LCAyMDI1IGF0
IDA4OjM0OjIyQU0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gT24gVGh1
LCBGZWIgMjcsIDIwMjUgYXQgMDE6NTk6MTlQTSArMDUzMCwgWWVtaWtlIEFiaGlsYXNoIENoYW5k
cmENCj4gd3JvdGU6DQo+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9jZG5zLGNzaTJyeC55YW1sDQo+ID4gPiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9jZG5zLGNzaTJyeC55YW1sDQo+ID4gPiBp
bmRleCAyMDA4YTQ3YzA1ODAuLjA1NGVkNGI5NDMxMiAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9jZG5zLGNzaTJyeC55YW1sDQo+ID4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvY2Rucyxjc2ky
cngueWFtbA0KPiA+ID4gQEAgLTI0LDYgKzI0LDE2IEBAIHByb3BlcnRpZXM6DQo+ID4gPiAgICBy
ZWc6DQo+ID4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4gPg0KPiA+ID4gKyAgaW50ZXJydXB0czoN
Cj4gPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiA+ICsgICAgbWF4SXRlbXM6IDINCj4gPiA+ICsN
Cj4gPiA+ICsgIGludGVycnVwdC1uYW1lczoNCj4gPiA+ICsgICAgbWluSXRlbXM6IDENCj4gPiA+
ICsgICAgaXRlbXM6DQo+ID4gPiArICAgICAgLSBjb25zdDogZXJyb3JfaXJxDQo+ID4gPiArICAg
ICAgLSBjb25zdDogaXJxDQo+ID4NCj4gPiBBbmQgaG93IGlzIHRoaXMgc2Vjb25kIGludGVycnVw
dCBpbiBleGlzdGluZyBpbnRlZ3JhdGlvbnM/DQo+ID4NCj4gDQo+IFRJIFNvQ3MgaW50ZWdyYXRl
IGJvdGggb2YgdGhlc2UgaWYgSSB1bmRlcnN0b29kIHRoZSBUUk0gY29ycmVjdGx5Lg0KDQpTdGFy
Rml2ZSBKSDcxMTAgU29DIGFsc28gaW50ZWdyYXRlcyBib3RoIG9mIHRoZXNlIHRvby4NCg0KQmVz
dCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

