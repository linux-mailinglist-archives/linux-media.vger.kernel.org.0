Return-Path: <linux-media+bounces-32877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB7ABD244
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30A78A1B70
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E460C25D8E2;
	Tue, 20 May 2025 08:47:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF8218596
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730861; cv=fail; b=ZA64GbDvKbWLkR3m9MWAiTrJHZ4ASzfF8j+hP2HOceIJME06rAIXWUGrEo8XaszfZ8v7cir7ZLftpXrjQtPtI9SnkaShxXx1/Fp06W/nbJ6Rxd0mwYsYmWE3PlRwi8OdJJo9kg6L4JTd/kmRtwDcPOwejAZbN5T/3VU51LQwO5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730861; c=relaxed/simple;
	bh=wBFZ6P+8Bb6CdAUEq5dlBjcwihXXZWvPq9Z1LY6IynU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qY+2t+TRYJA5XvHhBFndbGMvt+MKSwd6tJqeWiQt5mJ4fmTaaFZPbTWL3xF97/x/acyIuET5uKW2Q3CUaFrYoUrLVqmK3lXF3L48abkPNJ+iRXwXotk2bSZTduvPJ4cRu36Rr/mXrV05j1fayG4lWNEaVQZCZjVp18ls3kOXvmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHer5SsYnK9mC6lOGdlFVHGzQ8I0rxA0ZABBo7m1Wep6KtNRze4xhSve4DCrwzDQLZWt932k1H1B9UX3Bv/LtD9lv/YKDrUNQlhSsbZJMZkgQ161du8DCD772lVJf6j3EWpcQStXdwIHp/pON0yENiwquFkfUTneLkq30gJR5IKXwD+YkiPyawGArSb13tstWNE/7GSyM+hHDtJpfpQKku4+CYNEQ0DJ+FKCYnQ6Eug4Qn6sKKE7/iiR7tl4mmJ7KgK89g3f+LDGFczaE7i4PamsCC9FI0sgDtiYH29PsaBsrPAxpHitXMTBmghtYfxe39n4fubcvyvUtE0Pvr9blA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBFZ6P+8Bb6CdAUEq5dlBjcwihXXZWvPq9Z1LY6IynU=;
 b=PzkOdl+Z8v3Y1/fcYWJLDQaK0rjEMVpik80fKGpWVLYOmSkqpeaqy7GkqoZ2WJbisCots+0IMPbijhFr5UI2KvMrBnjl+QA+dB2067Ft+9er5l1ojBImrvkv7SRnhSmSzoVvMqLrY/3/dDhMk6P4X9rICdj9ZT3eh8pGIzQM3VyFpD/uuC6L2suHg1DCj6haymE3JMXv6LU8wplFqPO+cdIzeNs/MQfyXOPhaU+Aj7erAlR+OJzATc2YcRM60U0oQOVixgqrz/CKAvrFdwKswe12hg6wTNjvoOGd3Xwz0r+go28wtb2QbD2UsYmfXxfUhHRPCxJzCJ9asbj/FxZD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1270.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.40; Tue, 20 May
 2025 02:13:46 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8699.040; Tue, 20 May 2025 02:13:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jack Zhu
	<jack.zhu@starfivetech.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Hans Verkuil
	<hans@jjverkuil.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@iki.fi>
Subject: RE: State of the starfive-camss staging driver
Thread-Topic: State of the starfive-camss staging driver
Thread-Index: AQHbyPgLmfy2w5OrKEWQ3xNhMWTkjrPax7Hw
Date: Tue, 20 May 2025 02:13:46 +0000
Message-ID:
 <ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250519195539.GA4641@pendragon.ideasonboard.com>
In-Reply-To: <20250519195539.GA4641@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1270:EE_
x-ms-office365-filtering-correlation-id: 2e593099-ae74-4cda-11c9-08dd9743f3c8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 sAHISpT3bWiDv/8WjKZTrlVisiUpL9N/lqWBWgi8qEaKEtam/aJkpBHtxBeT3k9npsh4kx7iF8aJsqlM1rCsZ592f6I3Sfpj+rOeIbY7V+3Q5r0oEFAix6GU8G3/BIKg1EDBE2nZ0FFFXlS/ABNc+aY222hkpee6pBglA3UZwEuVUXr58iaFXVkAg2llGBDOQCLHCUvH8TjiSSMBH2moWPQ/ohzfBX0Yas402tsDWMkj0/jhN/C6MblVHHQCcyv5I+oEaWQ4Rl3hb22SZf3X8WTYSrQ0oyoNiIuhcn0VmZwWS7SDRDI2J8wl9YnS8WvHPhFjG3YGxKGL65n5cdAJ5g41p2GWL/PO1EEzoTdXJ9voLi6rPjLgmMhFv9e88MGY+xERbLhJHQUxaMUWlUWkAjwvaNac8Diu2kyiv6bzYBw6ezSDiLqS5850OTY+y/rPcBuC8k/DjwLSlT+55X5xgnausukYdyRYQSbSK2VApzNDNbqIdsT8u3/aOSHt5shHR2gdL5oMhwA723AmHzttJAJYxHVFK7bCkf+4QIDnAnbWzqEHm1J/Hh1lWF95prk/xrNNCvGRC++6Ne2q7o3zl3KhqEFbaWSk8+A3pk3BGTA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0J5WDRYU0k4NVdwMlljNys2cHg4MVI1THQzVFUrazNmdDZmQ1EwUDgrN3Zk?=
 =?utf-8?B?Z0dndXVuVnYySWt5a0h1dEJSeHcrWEl6bmpydG1rVld3ZllDM1hYbmhCcHFI?=
 =?utf-8?B?c0k2UmpKQkwyRVh6TXF1SC91dHlncHlUenlnYWhyV0UybjFMeGExdnJmNldC?=
 =?utf-8?B?Q09kY2RxTk9yOUFPODM4VHAvWjdldHprcFk3VEFKZm83MW9udGVIeUhKcTIx?=
 =?utf-8?B?RFYrc0czZ3E0ZXpUS1dGSEt5MTdvV2xxTmJHYTBTZWJXaUE4Vno2M0U1Wkpx?=
 =?utf-8?B?UFd3SDFzS2lRWS9mWWExTnRwdlBBY2l3TnJkcjlrZ0xLT2dGTWhsUmdlUjkz?=
 =?utf-8?B?VTVlUkwzSS9ub2phU3NESGZEaGhNaEwveVNRbXk0UUpnQmZ0SkRrTGtScEMr?=
 =?utf-8?B?K0JQYkRZbVoxZTBZcG5rRnMwQzNjYVhHV3ZwdFFwWitieUF1YUF5dWFsRmkz?=
 =?utf-8?B?dEh5NFkyZStVMXdQUHUyWGQvTnp6dWhnaUZxbDNaVE81K2ZnREFPRE4yZXRv?=
 =?utf-8?B?bE1kaGlFSEgzd0piTVVybWlXVkd3emltcVlvaE9aNEVtb1doeGtVaFRhNlRP?=
 =?utf-8?B?ZzhUR2Y0QUN2aGw2STRsbUlxNmI5ZTg3UEtPOVpIUkVWV2pxUS9qOTQyZ1hH?=
 =?utf-8?B?OHBFMTN3TXo1ZEx6ZzVSRjRickJPRTlHRFEzVGs5Qm5nZU9EVmJSUGZxbkh5?=
 =?utf-8?B?bFluUDZybnVUOWtHQTNVQmFsbXMvN1JNam04c0QrdHk4RGFaZEZNWmhyUFRV?=
 =?utf-8?B?ZXQ3eGxTZzJLck1rVU9uV0RIcmxQeUFzSlZxVEIwZDJzcG1TWm5mYVZycktJ?=
 =?utf-8?B?QWpYSG9EQTFUOTAvTU5SQUtYM0JMYzVQaE5TTk1nUmpmSmt4Y3BVRkhMSVFW?=
 =?utf-8?B?RmRsNVpobk42cGk2TWJLZGRSaFdRQ3hhN3JuSnpDQ3lHSDM0bjdwaW01M3FV?=
 =?utf-8?B?Q1psQ1VNZUpCUlJYRlJWTnRvazRyS2x4a0Y4Kyt0S2I4eHkxZy9ZaHVYM3F5?=
 =?utf-8?B?Tk5YTDlGbXBqS3owc1B6T3RUdTFKZFlDVnphN01XOVh5aWhRL1FPRnBsS1Mz?=
 =?utf-8?B?TjZoNzQ4eGkrcHR0NWxzOHArRWJSV2RqWkt1NWlZYk5aZFdENDFaSEpOckNa?=
 =?utf-8?B?KzVOdW9VQ1d2OGNnOWtlL2c5cUt6RDdibkFYN3M3d09SYy9tWW1nWXJxK1Qr?=
 =?utf-8?B?RmRVTWhpbUFJRDlsdDRkVHp5bi9LSGVNR3N2RDFKaUFTL09wcHRvWEY4TklG?=
 =?utf-8?B?MGNPdnNtejZnZUVxMGtCcG1xUDJMR2VlSU03ZlBRTDNhQWVkQ3BRUHBpdDBJ?=
 =?utf-8?B?dm04N1hzdk5MWEhaR3lGY2NrMnZZRnhkYWlGTGdybzIydE1LaXB3K2NtNzFC?=
 =?utf-8?B?amJYMTVPWCtvaHEyQkRRcWlXNGZNY1pPbkwyaEZTOGNvQjJCTE91ZDZJWDlj?=
 =?utf-8?B?cG5hTHQxYXhGSU5VUDNDREpTKzNWeTN5WHVka2xBNUptcEUzaWp6UGdLa1N1?=
 =?utf-8?B?aFlDMUx0OExTNXQramNGNVZaY2ZvTVBQSUhuUU1nMFBhWGhFb0pCRnRJb25D?=
 =?utf-8?B?ckFhSStIc0Jrd2ZWTHFmNFM2SmQvQndDU1Z3bnFqbDdVQkV1NzFYVlhBY0lj?=
 =?utf-8?B?QTd4MkhkNVNMTzh4elRpVjN6WEF1ajFtQjNHbkhzcThiczRlbVRndlJyN3h5?=
 =?utf-8?B?dU9JOUlYTnVGVTE5NGpOQWlDR2FqT0ZIcjVKVGNGbzNNdTNha1ZtZDJLZlhk?=
 =?utf-8?B?SXE3WDRNVXJ3ZXRQcEg0eHNpWXB4U2VqeENlMEdwRENGTFFkbk5LK2ZEZ1gy?=
 =?utf-8?B?a1MyanZXOEdoR3FSV05UUVZ1UVBtS3lVM1B2dmMwekpVTmxablpNZTlWMk5Z?=
 =?utf-8?B?YmkvRVJ0SE14VGRaNjdHS2xBZWNwaXJzZy9saExiR1I2cGh4VytuQzNubzB0?=
 =?utf-8?B?S3JDYVYyeHVHeTI4NytCT1IrdVdySGZRdC9ldUp5ckRPTXFIc0NaYkJSVjhP?=
 =?utf-8?B?c1VaQzFnaWNIZk9UeTg0bHZGeWdrd1BJdWFpMDh0VmhTL1JBM2d4NFdxUFRO?=
 =?utf-8?B?Mk1QSTlmeTAyVjkyWTFuMXRNUzZHd1NUeXd5NHVTdjdTcklIRWp2Tys2VFVi?=
 =?utf-8?B?Q2o3Z1g3VWdKQVBvZHpINGJPZk1JQTBSVkZxNmltN3FEbHdCbUpRd2RydnVm?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e593099-ae74-4cda-11c9-08dd9743f3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 02:13:46.4550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxK0ZAS3BZF2x8XUuX11/YzU7SIveL0DQHiuT4BlixRJEmhgnQPKDY3oHYh42SiraQUDZMnk3WZzBCBq/j4O5Ne+XcSKVMJpjKV3OCoWWLEbz1g+aM/8khlyiVvPZzu6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1270

SGksIExhdXJlbnQNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KDQo+IEhlbGxvIEphY2ssIENo
YW5naHVhbmcsDQo+IA0KPiBUaGUgc3RhcmZpdmUtY2Ftc3Mgc3RhZ2luZyBkcml2ZXIgKGRyaXZl
cnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcykNCj4gaGFzIGJlZW4gbWVyZ2VkIGluIHN0
YWdpbmcgZHVlIHRvIG1pc3Npbmcgc3VwcG9ydCBmb3IgdGhlIElTUCBzdGF0aXN0aWNzIGFuZA0K
PiBwYXJhbWV0ZXJzLiBDaGFuZ2h1YW5nIGhhcyBwb3N0ZWQgcGF0Y2hlcyB0byBzdXBwb3J0IHRo
b3NlLCBidXQgd2l0aG91dA0KPiBkb2N1bWVudGF0aW9uIG9yIGFuIG9wZW4tc291cmNlIGltcGxl
bWVudGF0aW9uIG9mIElTUCBjb250cm9sIGFsZ29yaXRobXMgaW4NCj4gdXNlcnNwYWNlLiBUaGUg
cmV2aWV3IGNvbmNsdWRlZCB3aXRoIGEgc3RhdGVtZW50IHRoYXQgU3RhckZpdmUgZG9lc24ndCBw
bGFuDQo+IHRvIHByb3ZpZGUgdGhlIHJlcXVpcmVkIGRvY3VtZW50YXRpb24gb3IgdXNlcnNwYWNl
IGFsZ29yaXRobXMgZm9yIHRoZSB0aW1lDQo+IGJlaW5nLCBhbmQgdGhlIHNlcmllcyBkaWRuJ3Qg
Z2V0IG1lcmdlZCBhcyBhIHJlc3VsdC4NCj4gDQo+IFRoZSBtZWRpYSBkcml2ZXJzIHN0YWdpbmcg
YXJlYSBpcyBtZWFudCB0byBmYWNpbGl0YXRlIGNvbGxhYm9yYXRpb24gYmV0d2Vlbg0KPiBwYXJ0
aWVzIHRvIGltcHJvdmUgZHJpdmVycyB1bnRpbCB0aGV5IGNhbiBiZSBtb3ZlZCB0byBkcml2ZXJz
L21lZGlhLy4gSWYgbm8NCj4gc3VjaCB3b3JrIGNhbiBiZSBleHBlY3RlZCBpbiBhIHJlYXNvbmFi
bHkgY2xvc2UgZnV0dXJlLCB3ZSB3aWxsIGhhdmUgdG8gZHJvcA0KPiB0aGUgZHJpdmVyIGZyb20g
dGhlIExpbnV4IGtlcm5lbC4NCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgbGV0IHVzIGtub3cgd2hh
dCB5b3VyIHBsYW5zIGFyZSBmb3IgZGV2ZWxvcG1lbnQgb2YgdGhlDQo+IHN0YXJmaXZlLWNhbXNz
IGRyaXZlciBpbiB0aGUgbWFpbmxpbmUga2VybmVsID8NCg0KVGhlIG1haW50ZW5hbmNlIG9mIHRo
aXMgY29kZSBoYXMgYmVlbiBkaXNjb250aW51ZWQgcGVyIGFncmVlbWVudCB3aXRoIHRoZSANCmxl
YWRlcnNoaXAsIHNvIHlvdSBjYW4gZHJvcCBpdCBmcm9tIHRoZSBMaW51eCBrZXJuZWwuDQoNCkJl
c3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg0K

