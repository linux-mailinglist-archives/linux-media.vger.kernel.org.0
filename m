Return-Path: <linux-media+bounces-15238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D786C938CF1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 12:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54CA01F21BE3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 10:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E639416CD29;
	Mon, 22 Jul 2024 10:00:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2112.outbound.protection.partner.outlook.cn [139.219.146.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB7816CD1D;
	Mon, 22 Jul 2024 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642409; cv=fail; b=TdsqgNotcUO6lemdUc9+8oab1PSV7armNoc4a4pcGT/fSTnzhv40pfWpKfk2n7+xjv73RbU4EfDbOs7KHFUgX3IUya2nrnlFh6SzbcVbBaEfBBNJI0OGXqmYjMfAxgef722FWHLKr80cYK1QlXJEIAFAexluoEm8OuVW+Q2VxVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642409; c=relaxed/simple;
	bh=TWW/ZZuG3rWYfJt8YH3bhZqezQN1wgTs7Zyz91NAqIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A0/U+BFPCSFTAxaVr4gIijER4j1SCukK8Kv9Gvv1uYYKgUef2ud/NwyCl2JSTn1rf4K5E64or6GJqbFiB/pjisryzoyIc+LEmKvDO6saMWVMeHr5EEru4Jyl/9TysBNvbd1ykJyLZlZF1v6H5RRG8BeGhfJ8rcF+TYQeUmkGYyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH6z+Za57Mws90Xi51HPggLyqSoGBFcloZEYiQ3Dk9WyQBVixRnXOj5/kvr4XOAwYlNHO4kFNVftAIp3Dp/YpjsA/ub2Hg6wA8L0/KjSfmXXkmyRfXkAMVipdGaR9Ls5QX40zkcsN/kIwdvqlc7kyHHR93+2hPJCComYWeFWZE64FatxKiIdHQrG60l5e4fn217yDaYBMH5RBYR0tejpI106jY5hpBTeXbqQp/75iqSN2sGCl/KQRKLmcZm1nhIddEUqjcY8tllXepGML7Gs4ILBaQcdcRdJah5i3ZmfRiIdSKB362p4Dc95rIxuvZ+PFmcPjCD8OKM72jHi6ICZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWW/ZZuG3rWYfJt8YH3bhZqezQN1wgTs7Zyz91NAqIM=;
 b=bLdmtTsMXbsL+Xfvi6QHXQKpmPsX7hu+4M2H+ED9E+B4OcKrICK02J3OSurs0wpKeYcdz08T2c3CHZJ7/Y5pLxQvkyL9PrpM0xl13yt2Gg3TGS/06AgvGv3CyYQY2AljAboB6RaRPSTP8lK3pSTBLL8m6s/VTnpYJjdfN5ZvWlWvipgZ0mBUrW17xISGKYvqFMxBaE8XPG9eh3xiyfEw+d+axm8UHQNZzU5hLgHr5ywNxjzW7lhiNic/tTiLs6/VNr2k03eL5nm/FYJtVuiPBUEyaZUHyCt7VC2R1v+A2p1kFOmgc2+4cUTX3Fulyxw1AJJq7Bapzn5ZA875TnQ5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1318.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Mon, 22 Jul
 2024 09:25:40 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7762.032; Mon, 22 Jul 2024 09:25:40 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard
	<mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCB2MiA1LzVdIHN0YWdpbmc6IG1lZGlh?=
 =?utf-8?Q?:_starfive:_Add_system_PM_support?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgNS81XSBzdGFnaW5nOiBtZWRpYTogc3RhcmZp?=
 =?utf-8?Q?ve:_Add_system_PM_support?=
Thread-Index: AQHa2MKZbrZfMyANlEOl190GEqX0o7H8k6oAgACvhLCABTXCAIAABV/A
Date: Mon, 22 Jul 2024 09:25:40 +0000
Message-ID:
 <ZQ0PR01MB1302125C99BBA016C257A7F0F2A82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-6-changhuang.liang@starfivetech.com>
 <ecqbazcjtzat7yxwh7uuerjrrh3umpwutiwha2zo5njmwnj25g@ocpntbuecb3z>
 <ZQ0PR01MB13020F080F8D1B024D211971F2AD2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <zmuytuvsjpe4rx7oak762onncax7ko5ljfzber3dsirrpbpvne@lr7t2ultlsdk>
In-Reply-To: <zmuytuvsjpe4rx7oak762onncax7ko5ljfzber3dsirrpbpvne@lr7t2ultlsdk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1318:EE_
x-ms-office365-filtering-correlation-id: be9a6daa-c099-42f0-f60c-08dcaa30412b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 b76Tl+YDSf8u4MnMj1zQ9mZrwgkdmY60vwJzH9K3uSzogVpCQwivD3Insid1QFIJE4mevgPPXOKJNyGBVgDqbctO5DcuhWE73zVHxX+zUddIlSkzdzbupC2Akfu+HNKzKntPrWuSrSsEPL1OY4KHWaX1spl5xRDCRFcDnurZ5EonLeCKPSq15Tm6hj1TWnXZOATOIP6oS0QYk0E654bHKwp7T+03CKxOywvly4zxWPOdy1Vj/B+BzIqZMhBbLYZcA/OIL9CCOCsGcStkQ5+5+J5GbR5ezjTycfnImttjSZ+8B+E3yrP9OzVZT8w0JvkKYPdEJAvdiG+RYMu24b7koSe2dj0LZ76fKjvLUoHt/6OVGQqMzA4LmmfY5rqs2ABBnv6MHHh8XXBngyBm4Gs+20PyX2Yrgb0SKPmuGWUoDClbB+Bc2nk42f0D740dD1QsGr0OF6Z+tmuFF+nOR3mkKAyNyNp8wHVKia3ZeheL4va4VOBcCxifcu4GUOWp7F7Oe4kSjX1k/rmDoOlmzkqnD2oU0y3WdzEUgBG/MyD0sD4612NxIkuOAtg5TdaCovfgaMeruoO8YGVebi+zzCU1+g8eS2mHXmY5ftb9lKuRAiTMgcm6cvTQB0PRGv6X5nry
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0poSzVzd3YvMlBFSThQRFphb0ZxaDZIRTB1V1JacWcyZUJFdnBnYTRHU3hL?=
 =?utf-8?B?OVR2ZmV6T3lrVlQzYkxOM1NidVZVRjB1RFVFSUhUVjhwTFNYTGFQUDRCQUhu?=
 =?utf-8?B?Q0Y2NnlmT282MnJFSEkySkNiVUUyUFhROXRmaDlmbjhQdE5QTC8zQlZKUFJ6?=
 =?utf-8?B?MTFnUTcwWXNoa1BCZ1A3Yy9WQkx3ci8yNUc1WWVQSWFSTWV2dGlKOWRUNGtI?=
 =?utf-8?B?aEorRnpzWWprZysxL1ZuNnd5NjAzMldob1FzanA4aHhXZVg2NjUrNDRSNTU2?=
 =?utf-8?B?djQrakZrZnhPYStRM25KUCtaQ1pLSGtKaitnNEF4TGM5TXEwN3o3UTE4Vlhk?=
 =?utf-8?B?L20zcmpjbmV3alVhbTdIS3RkczhXWmJzbFd3UUFseWpNV1lkcmk0ZVlwOHZ6?=
 =?utf-8?B?Njhsc0tXVmxpL0lQUlRHSjd3N1J6b0svYkUzdlZ4RzhLaWtReWVkaHo5cUZ6?=
 =?utf-8?B?eVZmRnlQbDR4OWNiazJJLy9XR2RBMGgwZ1JMeE1GYkRDSmpPSy9CUHZvQkg4?=
 =?utf-8?B?TXdZeWhtTkV3VzIzdXBBYytZZWlsZkk1blU1djdBMmN4dVRtajZiUTVXamV1?=
 =?utf-8?B?UWZ2QmNuNy83TW04TWh1aXBNVXpRWXlDbXM3eFhrOEMraU9YbFJldWExUUk5?=
 =?utf-8?B?REMvMWdGR3h4L1lBOEt5amsrYWRVSlM3UWNJYlRpVlJ5VG40dXRta0hZTWN2?=
 =?utf-8?B?NHgzNHJGa0hQRzRPUmxZQXR5UGQvZHhNZS9kRTVTYmtBZFFwcldVb2g2akFr?=
 =?utf-8?B?dDNTd0Z2dFpPalBOTFRnMFJKUm5FdlJEZzQ1SzdhR1dXMEVqRm96eldIWnlB?=
 =?utf-8?B?b3NzS29kei9jRncxcFBLN0JYdkI3eGFLNW9oZHNENFhybE1QVTlsaEZmcDYr?=
 =?utf-8?B?aCtGbWJOVXc0c3M0RjJMOXUvME9Sb0ZLNENLeFZlZCtZd0gycGtjcDRNSUVl?=
 =?utf-8?B?YjA5WDVibDhBMVVSbUJpcVQ5T29iNUE5R20zT0RtMmRJcFpsQ3JMNEN3TnBt?=
 =?utf-8?B?eUZvaXo1RVBKT1VnN2V1ZklwNFZXODQrRGFyVHd4MEpJKzBKbGV1YWpTeDJV?=
 =?utf-8?B?WkFQcTNVb2w1NXJsTEdJWnZ3MllDY0E5OVNyb1dwMExjUTZDVDVVRmVCZmtP?=
 =?utf-8?B?alF3RnZHV3ppcTl6VEZyS2lCc200VTd2Mk5uaVBQWERDY0ZhUk1vVHA5bGMw?=
 =?utf-8?B?KzBEdStrZUZ6bWl3S2VTaGdlYStVaW4xZE8xQmxvb3NuL2FCSnh2SkpMa1NF?=
 =?utf-8?B?Qll0YitVVnV5cWlSaG9xWlBMR1JiUlA3MFdVTUgvZCtqcVQ1WDBmOS9RS2Rq?=
 =?utf-8?B?djkvL3JKeGhpOGZWRnB6UEQyajRvRzgxbUptZnQ1Z0JPMVRhSGRWMFFQNXdj?=
 =?utf-8?B?MzJsbEhHKzhndGpOazM0Z1l0NkFrcHNlRTNRenRqK3Vialpybyt1WnA1YkNk?=
 =?utf-8?B?dFhXbDdXNUxuQmE1OFFVS2x3UGhSdWFsU3JWcUNvSzcyUThBcEpuOVdJdFdJ?=
 =?utf-8?B?cEtIdytHTHlOc2xmT3RWZFVQeXp0VzVLNUFqbDk2WXREZ1F0UVN5eDMrVEMy?=
 =?utf-8?B?aXovTVJRemgrUXRqelpLcm5CbmgvaG9Eajg2Zk1pSE40dStjRVd4V1J4c0M5?=
 =?utf-8?B?Wmc3MEQrTjdIQWVSb3NLV1ZDaGFweUpkNzR3L3NRcU5rciswQ1duOHJJWVRl?=
 =?utf-8?B?Z1VyS1YyeGY3YmhuL08rOS9mOHFkSFAzUVIzZUVHLzQwZkMvSEJ1Njk2YnpU?=
 =?utf-8?B?TmhXbjFXdWNodURMS3F6S0Z1elV3SVkwb0pHTWlRdVJXUEgwQ0oxU29SVytO?=
 =?utf-8?B?cjVvdkZhSmZ0ZE0xc3l6MlFYcEoxdGZaZ0FYeEZ2TFZKTEhWcGdzRzFzbDI1?=
 =?utf-8?B?QUVBY0Q1bE0yS2ZtNWlCTCtkcmtYYzRHOU1EZlV1UStJOThhRTRFN29wYk5p?=
 =?utf-8?B?QTFGbXZQcHZON0lRR0VuQVI3L1R6MkUyUkVCajdML2RtdGpYeE1jVkpOVk1D?=
 =?utf-8?B?amNhdXpYS2VEdVpEUlIzTS9ndy9maGUwWE15N0p2d3llUVcvWWViR29na25C?=
 =?utf-8?B?WFNNaFZRUSt1ZHJYRy9LV1B1VTBpRUd0ZGF4bitLcE1XaHlVNXpwMzFCMzU5?=
 =?utf-8?B?dXdpSWdPcDlnZ3ZyUGlYYWFHaTh5MSt0d0poNGc0OUpJellGa0Z2TC8vQXBX?=
 =?utf-8?B?cUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be9a6daa-c099-42f0-f60c-08dcaa30412b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 09:25:40.7880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N1Ie/FTZFarGR7JI1dCUyyq6mu3IB4XVZiW0orW5BnS8Wmwkq4eYZN4mziST7m05SqD5bRl1wWLgBOPbia5DiqjE0dT0shmEG4SOcCn2YSZ9KmQD3xYM2inIwo0Cx5+o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1318

SGksIEphY29wbw0KDQo+IA0KPiBIaSBDaGFuZ2h1YW5nDQo+IA0KPiBPbiBGcmksIEp1bCAxOSwg
MjAyNCBhdCAwMjowODoyMEFNIEdNVCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBIaSBK
YWNvcG8sDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQo+ID4NCj4gPiA+DQo+
ID4gPiBIaSBDaGFuZ2h1YW5nDQo+ID4gPg0KPiA+ID4gT24gV2VkLCBKdWwgMTcsIDIwMjQgYXQg
MDg6Mjg6MzRQTSBHTVQsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiA+IFRoaXMgcGF0
Y2ggaW1wbGVtZW50cyBzeXN0ZW0gc3VzcGVuZCBhbmQgc3lzdGVtIHJlc3VtZSBvcGVyYXRpb24N
Cj4gPiA+ID4gZm9yIFN0YXJGaXZlIENhbWVyYSBTdWJzeXN0ZW0uIEl0IHN1cHBvcnRzIGhpYmVy
bmF0aW9uIGR1cmluZw0KPiA+ID4gPiBzdHJlYW1pbmcgYW5kIHJlc3RhcnRzIHN0cmVhbWluZyBh
dCBzeXN0ZW0gcmVzdW1lIHRpbWUuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENo
YW5naHVhbmcgTGlhbmcNCj4gPiA+ID4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNv
bT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1z
cy9zdGYtY2Ftc3MuYyAgfCA0OQ0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYW1zcy5j
DQo+ID4gPiA+IGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYW1z
cy5jDQo+ID4gPiA+IGluZGV4IGZlY2QzZTY3YzdhMS4uOGRjZDM1YWVmNjlkIDEwMDY0NA0KPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNhbXNz
LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0
Zi1jYW1zcy5jDQo+ID4gPiA+IEBAIC00MTYsMTAgKzQxNiw1OSBAQCBzdGF0aWMgaW50IF9fbWF5
YmVfdW51c2VkDQo+ID4gPiBzdGZjYW1zc19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ID4gPiA+ICAJcmV0dXJuIDA7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICtz
dGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0ZmNhbXNzX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KSB7DQo+ID4gPiA+ICsJc3RydWN0IHN0ZmNhbXNzICpzdGZjYW1zcyA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KPiA+ID4gPiArCXN0cnVjdCBzdGZjYW1zc192aWRlbyAqdmlkZW87DQo+ID4g
Pg0KPiA+ID4gQ2FuIGJlIGRlY2xhcmVkIGluc2lkZSB0aGUgZm9yIGxvb3ANCj4gPiA+DQo+ID4g
PiA+ICsJdW5zaWduZWQgaW50IGk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlmb3IgKGkgPSAwOyBp
IDwgU1RGX0NBUFRVUkVfTlVNOyArK2kpIHsNCj4gPiA+DQo+ID4gPiBMaWtld2lzZSwgaWYgeW91
IGxpa2UgaXQsIHlvdSBjYW4NCj4gPiA+DQo+ID4gPiAgICAgICAgIGZvciAodW5zaWduZWQgaW50
IGkuLi4NCj4gPiA+DQo+ID4gPiA+ICsJCXZpZGVvID0gJnN0ZmNhbXNzLT5jYXB0dXJlc1tpXS52
aWRlbzsNCj4gPiA+ID4gKwkJaWYgKHZpZGVvLT52YjJfcS5zdHJlYW1pbmcpIHsNCj4gPiA+ID4g
KwkJCXZpZGVvLT5vcHMtPnN0b3Bfc3RyZWFtaW5nKHZpZGVvKTsNCj4gPiA+ID4gKwkJCXZpZGVv
LT5vcHMtPmZsdXNoX2J1ZmZlcnModmlkZW8sDQo+IFZCMl9CVUZfU1RBVEVfRVJST1IpOw0KPiA+
ID4gPiArCQl9DQo+ID4gPiA+ICsJfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJuIHBtX3J1
bnRpbWVfZm9yY2Vfc3VzcGVuZChkZXYpOyB9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBp
bnQgX19tYXliZV91bnVzZWQgc3RmY2Ftc3NfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikgew0K
PiA+ID4gPiArCXN0cnVjdCBzdGZjYW1zcyAqc3RmY2Ftc3MgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsNCj4gPiA+ID4gKwlzdHJ1Y3Qgc3RmX2lzcF9kZXYgKmlzcF9kZXYgPSAmc3RmY2Ftc3MtPmlz
cF9kZXY7DQo+ID4gPiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2X3N0YXRlICpzZF9zdGF0ZTsNCj4g
PiA+ID4gKwlzdHJ1Y3Qgc3RmY2Ftc3NfdmlkZW8gKnZpZGVvOw0KPiA+ID4gPiArCXVuc2lnbmVk
IGludCBpOw0KPiA+ID4NCj4gPiA+IHNhbWUgaGVyZQ0KPiA+ID4NCj4gPiA+ID4gKwlpbnQgcmV0
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0ID0gcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2
KTsNCj4gPiA+ID4gKwlpZiAocmV0IDwgMCkgew0KPiA+ID4gPiArCQlkZXZfZXJyKGRldiwgIkZh
aWxlZCB0byByZXN1bWVcbiIpOw0KPiA+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArCX0N
Cj4gPiA+ID4gKw0KPiA+ID4gPiArCXNkX3N0YXRlID0NCj4gPiA+ID4gK3Y0bDJfc3ViZGV2X2xv
Y2tfYW5kX2dldF9hY3RpdmVfc3RhdGUoJmlzcF9kZXYtPnN1YmRldik7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwlpZiAoaXNwX2Rldi0+c3RyZWFtaW5nKQ0KPiA+ID4gPiArCQlzdGZfaXNwX3N0cmVh
bV9vbihpc3BfZGV2LCBzZF9zdGF0ZSk7DQo+ID4gPg0KPiA+ID4gSSB3YXMgd29uZGVyaW5nIGlm
IHlvdSBzaG91bGRuJ3QgcHJvcGFnYXRlIHN0YXJ0X3N0cmVhbWluZyBhbG9uZyB0aGUNCj4gPiA+
IHdob2xlIHBpcGxpbmUsIGJ1dCBJIHByZXN1bWUgdGhlIGNvbm5lY3RlZCBzdWJkZXZzIGhhdmUg
dG8gaGFuZGxlDQo+ID4gPiByZXN1bWluZyBzdHJlYW1pbmcgYWZ0ZXIgYSBzeXN0ZW0gcmVzdW1l
IHRoZW1zZWx2ZXMgPw0KPiA+ID4NCj4gPg0KPiA+IEN1cnJlbnRseSBvdXIgQ2FtZXJhIHN1YnN5
c3RlbSBjb250YWlucyBJU1Agc3ViZGV2ICwgY2FwdHVyZV9yYXcgdmlkZW8NCj4gPiBkZXZpY2Us
IGFuZCBjYXB0dXJlX3l1diB2aWRlbyBkZXZpY2UuIFNvIHlvdSBjYW4gc2VlIG9ubHkgb25lIHN5
c3RlbSBQTQ0KPiBob29rIGNhbiBiZSB1c2VkIGJ5IHRoZW0uDQo+ID4NCj4gDQo+IFNvcnJ5LCBt
YXliZSBJIHdhcyBub3QgY2xlYXIgKGFuZCBJIHdhcyBwcm9iYWJseSBjb25mdXNlZCBhcyB3ZWxs
KS4NCj4gDQo+IFlvdSBhcmUgcmlnaHQgdGhpcyBpcyB0aGUgbWFpbiBlbnRyeSBwb2ludCBmb3Ig
c3lzdGVtIHNsZWVwIFBNIGhvb2tzDQo+IA0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiArCXY0
bDJfc3ViZGV2X3VubG9ja19zdGF0ZShzZF9zdGF0ZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlm
b3IgKGkgPSAwOyBpIDwgU1RGX0NBUFRVUkVfTlVNOyArK2kpIHsNCj4gPiA+ID4gKwkJdmlkZW8g
PSAmc3RmY2Ftc3MtPmNhcHR1cmVzW2ldLnZpZGVvOw0KPiA+ID4gPiArCQlpZiAodmlkZW8tPnZi
Ml9xLnN0cmVhbWluZykNCj4gPiA+ID4gKwkJCXZpZGVvLT5vcHMtPnN0YXJ0X3N0cmVhbWluZyh2
aWRlbyk7DQo+IA0KPiBBbmQgaGVyZSB5b3UgcHJvcGFnYXRlIHRoZSBzdGFydF9zdHJlYW1pbmcg
KGFuZCBzdG9wX3N0cmVhbWluZyBvbg0KPiBzdXNwZW5kKSBjYWxsIHRvIGFsbCB5b3VyIHZpZGVv
IGRldmljZXMuDQo+IA0KPiBJIHNlZSB5b3VyIHZpZGVvIGRldmljZXMgcHJvcGFnYXRpbmcgdGhl
IHNfc3RyZWFtIGNhbGwgdG8gdGhlaXINCj4gJ3NvdXJjZV9zdWJkZXYnLiBBbmQgeW91ciBJU1Ag
c3ViZGV2IGRvaW5nIHRoZSBzYW1lIGluICdpc3Bfc2V0X3N0cmVhbSgpJy4NCj4gDQo+IEFjY29y
ZGluZyB0byB0aGUgbWVkaWEgZ3JhcGggaW4NCj4gRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9t
ZWRpYS9zdGFyZml2ZV9jYW1zc19ncmFwaC5kb3QNCj4gDQo+IHlvdXIgJ2NhcHR1cmVfeXV2JyB2
aWRlbyBkZXZpY2UgaXMgY29ubmVjdGVkIHRvIHlvdXIgSVNQLCBhbmQgeW91cg0KPiAnY2FwdHVy
ZV9yYXcnIHZpZGVvIGRldmljZSBpcyBjb25uZWN0ZWQgdG8geW91ciAnQ1NJLVJYJyBzdWJkZXYu
DQo+IA0KPiBJZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHlvdXIgQ1NJLVJYIHN1YmRl
diB3aWxsIHJlY2VpdmUgMiBjYWxscyB0bw0KPiBzX3N0cmVhbSgpIChvbmUgZnJvbSB0aGUgSVNQ
IHN1YmRldiBhbmQgb25lIGZyb20gdGhlICdjYXB0dXJlX3JhdycgdmlkZW8NCj4gZGV2aWNlKS4g
QW0gSSBtaXN0YWtlbiBtYXliZSA/DQo+IA0KPiBBbHNvLCBpZiB0aGUgQ1NJLVJYIHN1YmRldiBp
cyBhbHJlYWR5IHBhcnQgb2YgYSBjYXB0dXJlIHBpcGVsaW5lLCBhcyBUb21pIHBvaW50ZWQNCj4g
b3V0IGluIGhpcyByZXZpZXcgb2YgcGF0Y2ggWzIvNV0gaXQgZG9lc24ndCBuZWVkIHRvIGltcGxl
bWVudCBoYW5kbGVycyBmb3INCj4gc3lzdGVtIHN1c3BlbmQvcmVzdW1lLg0KPiANCg0KQ3VycmVu
dGx5IHRoaXMgdmVyc2lvbiBzdGFydCBzdHJlYW1pbmcgYW5kIHN0b3Agc3RyZWFtaW5nIGFyZSBj
YWxsZWQNCg0Kc3RhdGljIGNvbnN0IHN0cnVjdCBzdGZjYW1zc192aWRlb19vcHMgc3RmX2NhcHR1
cmVfb3BzID0gew0KCS5xdWV1ZV9idWZmZXIgPSBzdGZfcXVldWVfYnVmZmVyLA0KCS5mbHVzaF9i
dWZmZXJzID0gc3RmX2ZsdXNoX2J1ZmZlcnMsDQoJLnN0YXJ0X3N0cmVhbWluZyA9IHN0Zl9jYXB0
dXJlX3N0YXJ0LA0KCS5zdG9wX3N0cmVhbWluZyA9IHN0Zl9jYXB0dXJlX3N0b3AsDQp9Ow0KDQpU
aGlzIHR3byBob29rcyB3aWxsIG5vdCBwcm9wYWdhdGUgc3RyZWFtaW5nLg0KDQpNYXliZSBJIHNo
b3VsZCBjaGFuZ2UgdG8gdXNlIHRoaXMgaW4gbmV4dCB2ZXJzaW9uOg0KDQpzdGF0aWMgY29uc3Qg
c3RydWN0IHZiMl9vcHMgc3RmX3ZpZGVvX3ZiMl9xX29wcyA9IHsNCgkucXVldWVfc2V0dXAgICAg
ID0gdmlkZW9fcXVldWVfc2V0dXAsDQoJLndhaXRfcHJlcGFyZSAgICA9IHZiMl9vcHNfd2FpdF9w
cmVwYXJlLA0KCS53YWl0X2ZpbmlzaCAgICAgPSB2YjJfb3BzX3dhaXRfZmluaXNoLA0KCS5idWZf
aW5pdCAgICAgICAgPSB2aWRlb19idWZfaW5pdCwNCgkuYnVmX3ByZXBhcmUgICAgID0gdmlkZW9f
YnVmX3ByZXBhcmUsDQoJLmJ1Zl9xdWV1ZSAgICAgICA9IHZpZGVvX2J1Zl9xdWV1ZSwNCgkuc3Rh
cnRfc3RyZWFtaW5nID0gdmlkZW9fc3RhcnRfc3RyZWFtaW5nLA0KCS5zdG9wX3N0cmVhbWluZyAg
PSB2aWRlb19zdG9wX3N0cmVhbWluZywNCn07DQoNClRoaXMgdHdvIGhvb2tzIHdpbGwgcHJvcGFn
YXRlIHN0cmVhbWluZy4NCg0KPiANCj4gPiA+DQo+ID4gPiBZb3UgY2FuIHVzZSB2YjJfaXNfc3Ry
ZWFtaW5nKCkgbWF5YmUuDQo+IA0KPiBJIHdhcyBzdWdnZXN0aW5nIHRvIHVzZSB2YjJfaXNfc3Ry
ZWFtaW5nKCkgaW5zdGVhZCBvZiBvcGVubHkgY29kZQ0KPiANCj4gCQlpZiAodmlkZW8tPnZiMl9x
LnN0cmVhbWluZykNCj4gDQo+ID4gPiBJZiB0aGUgcXVldWUgaXMgc3RyZWFtaW5nLCBkbyB5b3Ug
bmVlZCB0byBrZWVwIGEgJ3N0cmVhbWluZycgZmxhZyBmb3IgdGhlDQo+IGlzcCA/DQo+ID4gPiBQ
cm9iYWJseSB5ZXMsIGFzIHRoZSBJU1Agc3ViZGV2IGlzIHVzZWQgYnkgc2V2ZXJhbCB2aWRlbyBu
b2RlcyA/DQo+ID4gPg0KPiA+DQo+ID4gSSBzZXQgdGhlICJzdHJlYW1pbmciIGZsYWcgaW4gUEFU
Q0ggNCwgc28gaXQgZG9lcyBub3QgYWZmZWN0IHRoYXQgZXZlbg0KPiA+IGlmIHNldmVyYWwgdmlk
ZW8gbm9kZXMgdXNlIGl0Lg0KPiANCj4gWWVhaCBJIHdhcyB3b25kZXJpbmcgaWYgeW91IGNvdWxk
IGhhdmUgc2F2ZWQgbWFudWFsbHkgdHJhY2tpbmcgdGhlIHN0cmVhbWluZw0KPiBzdGF0ZSBpbiB0
aGUgaXNwIChyZS1yZWFkaW5nIHRoZSBwYXRjaGVzLCB3aGVyZSBkbyB5b3UgYWN0dWFsbHkgdXNl
IHRoZQ0KPiAnc3RyZWFtaW5nJyBmbGFnIGluIHRoZSBJU1Agc3ViZGV2ID8pIGJ5IHRyYWNraW5n
IHRoZSB2YjJfcXVldWUgc3RhdGUuDQo+IA0KDQpJZiB1c2UgcHJvcGFnYXRlIHN0cmVhbWluZyBv
biBwaXBlbGluZSwgbWF5YmUgY2FuIGRyb3AgdGhlIHN0cmVhbWluZyBmbGFnDQpmb3Igc3ViZGV2
LiANCg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

