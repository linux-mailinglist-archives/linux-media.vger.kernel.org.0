Return-Path: <linux-media+bounces-14894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC192DE2B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 03:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAEB91F21C03
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E62BA37;
	Thu, 11 Jul 2024 01:56:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4498830;
	Thu, 11 Jul 2024 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720663003; cv=fail; b=pSNDCLZO+HmZrMWPqgGKtY+bzZ4hxY5PFWT+QHh8ODO2tA8n818eviy1BCRmwWJeuJZWHLC9op8pi5fZ4x+GcUFhNxGRgfjh4c6Eg1xeo4mIq3kew3dMmcJhKD538z66g6YmNQcKyLSSKU+1MoPyL0Ym2oUjKfqQROPrDfoh3sM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720663003; c=relaxed/simple;
	bh=oToAf4xAAlaAbg/CqjnCZXNEXn/COTk6emMiPJMrQ4I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QYEWT70C7LkIoduGeI6KqF0t0Ow1Ck8CmeIq2vP7eq4UxyJUD8DtYa5KjNDWWZaOz0ZAuQfcCWDOU8hvr0F45BDMatgBEK2UoZ3LqsTCuWgmw07ifFI622vFoQp9TbGvKlI2WeiMSUo4jvjKaqcUQlvtFx4QT8kU81qgdwKtrz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9rftspVvgsg8IgqXcMN+DsGRlL/hFskeMuQRuBDKHQYSh+8TNgvcrT5uuP3jl2aBb3PVFCEVqGlUyg4BWsUDgjwH07veNkMvn+dXetpGGTmAqIftR7eI7/8Z37lFxGpHxl1HTB0Aygl39CWFEYiRRRF+3wjl4XeIWNBd5PxBuxKYCpuBtKz4RO6/AANzKimXsMyuRyor/cFm1fNcjvej55vlolwkG4unUEWxE3Ut/UYd9v3s9pTZP0cPbqTEFoTb9WgjsMakAaVuPeQpSysmrSlMnYkvlVnjusfzLsY0WG1E/5AUPuAmYpzzx9voYcSZ6w6MWoBKN6RpflyXZNhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oToAf4xAAlaAbg/CqjnCZXNEXn/COTk6emMiPJMrQ4I=;
 b=ljZgTf350+PW+qB4uuZMKV7J8mtqLXrq/XaE5tYwJZp7JKaVJw3vd+nefL9nI5FalavkJdlA0J8j+k5halUP4o1EcORpPh7LBE1q8Mm/lKGVImI/dFW5Xhc6/8liq3dPD1IL2TvHLl/oH7F7oUVDr3WSWkRo74MOniCi2WBpB7E+LheoxHBlnumGae+OTE5s4iiRMt/t8X/p4YLkwbtrhnO0VCWVCtAo2FflMaWSJx4sgloKIIiiw62Trae7yk3Nsb/gHD2zDqq1qOQ4LQfeyRpIX4Vti81IH5dI3ARLgSPHckui4PSV0phTgOLEEYaKyI9ynjpiTtaHkYyrPFJEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1286.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Thu, 11 Jul
 2024 01:42:07 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Thu, 11 Jul 2024 01:42:07 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Jack Zhu <jack.zhu@starfivetech.com>, Keith
 Zhao <keith.zhao@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMDAvMTRdIEFkZCBJU1AgM0EgZm9yIFN0YXJG?=
 =?utf-8?Q?ive?=
Thread-Topic: [PATCH v5 00/14] Add ISP 3A for StarFive
Thread-Index: AQHa0dthgZaKRMdgYEm7fjIwp+OqNLHv9LaAgADNYyA=
Date: Thu, 11 Jul 2024 01:42:06 +0000
Message-ID:
 <ZQ0PR01MB1302E6647F9D1B6AC21B274CF2A52@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <xk2dqqzpaah6lbx2fwa6aokm6sw3auyrntstuvuik4cevuaekw@ylgbnb43le47>
In-Reply-To: <xk2dqqzpaah6lbx2fwa6aokm6sw3auyrntstuvuik4cevuaekw@ylgbnb43le47>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1286:EE_
x-ms-office365-filtering-correlation-id: 3bb86fc4-4545-4a65-3134-08dca14aac54
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 H6hOYqlp/TbCahHJOGRhNcDpnzyR5bsy4pteFACSqGmGkrkp+scwahCm8A7HfuOGELi6PhR9VdRV0lGBVvGO/lzjJTRdruQVWvKvDt3yxX6/OGlgMyubrnAJGRn31kRUY4EZA+/Qha2REyiYgdsLW94AiZbmQj97/I9URPpONPv7oKKrQXq/7VVKoOfD71uzF/5DuRYKi+NDVvIQAIWhC8Plb9O7dU92StTB/I6TpCsWIN6VNv856ImzeVVA9Bv64YreKbvyx+tdHZjO9cQT3w9CvTKXvslLR74hk5EUGJNFZCU4FcFJzjMkVF0Fsp1Ifx5NHBofY6fXBMObanXtiVnSfNNrig07P1uREL2zANGqdnRKslFq+PQY/5ee30yYDNi4eNjJ2Q/BHa9+ynP8iqow0BXV/ehZG9slWoh37exE+64NGqOfNaYuexOIEhW+j4ikwT6h6dOj8Np89NxMbYjnOUSL7DnvfFtFSSR7C0Uzn4Fd+++zdXOZhulJWZTSRR219Vd8EP9eAjKosFVUJoTgcv+QnNHOcFQPtM2Azv6ydkrSFGlU5aDGWSiXXWObhw9lW2/nN7MjwlgJv1rLaMn2DaPo4/zC8ZGxyBYzIXqM+38v7fCvUjSPtYY0k0HW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3RneHJkK1RtaHZsa29Wb2NIMVhzN09tb25USjdxbnRxRWZTNTlnMytIaXVy?=
 =?utf-8?B?dXhiSjR5TFJNa091aHBsWEhnMVdTQVJDWHZtOVB4cHBMRi9EQXF2VUZHS1E0?=
 =?utf-8?B?bU5zQXUraER1QWVHWi9uV1hJVk1kMndka0ltWFovMnk5MkFCUGJtaHNuSVVK?=
 =?utf-8?B?SW9pMW1WS1JjemJXclRaYkhNL3l0alVudldvbzRLTWtOb0ZGcTdQdEEzR09N?=
 =?utf-8?B?SGRFSmlVOWpCZlE5OHVHSHIyb21OZFp0dnlMcDVPNlVNSkFoTTVoT2hGSyt2?=
 =?utf-8?B?QzdJMmVqZXBmeDZzY3kxdkpDMXp5N3dld0hnK3JwbTVweFVKT3FDb0dOSjZL?=
 =?utf-8?B?azA2N2IrS1ROL2hjbmhpbnZTd0tLUG80SzA4T2FDaExNQXEwVGtZUzlpaXFi?=
 =?utf-8?B?STdyclVrYzdjelFtenNQUy9VdXNENXE4OGJDdGNVRHZMSWl6K3drQW14Yktz?=
 =?utf-8?B?RG1IekVxdER0R2Q3WUdmVi9MSDFKYUQ2RHRkczU1VlNPSzQrb3VrOExuRjh6?=
 =?utf-8?B?SW1xaEYrc2ZSWktFazdWcUxybE5ENlB2WTVxQlZFWlNRdjN1OW1Mc3djejFj?=
 =?utf-8?B?cmNoSkROcis1TVJnUVd1czdMdGpUT0VqbEVGTUwzWTdnNGtwY2JucjF1ZkVE?=
 =?utf-8?B?STE0cElvWEwwb01Lak44cUYxTENBNXdPOElHam5DelBhVzhvT1cwUysxdkxm?=
 =?utf-8?B?MkVDaE82T05PbUVNWTI3WjRrYVN2RzNvTGhidnI3Lys0RWFsZTZ0VERnaGFt?=
 =?utf-8?B?YS9ZNWxTdjZuT0FEeFY1OWtpTlRleGxYK3R6RnRhNXJiWnpyY2d1VmtrZ1cz?=
 =?utf-8?B?QXpadWUxK3BCa3NTekU3aFZXYk9DU0dNMjZCNFljcmg0aXJEVWd5bjBtUWNi?=
 =?utf-8?B?QXl0ZnRTa0c1SVFWVGdWZ3BlSkVBaXV5K00yWWc3SXVSUXplQjFaelJoNEFH?=
 =?utf-8?B?MURSRnNNNlZIbndLZVBJUTNMakRJdE42eDErMi9qQjRqYmRVQU9nOTdDL2Vq?=
 =?utf-8?B?RVpGWTJOenZhTDFtci9CdEF0cStNcDMzSmtudGo3amlXV3ltd1F3UXcvOHUx?=
 =?utf-8?B?RFBBMm9BM0lXQjI3ZnJkYWl6YWJhUG9tNU4wUXdmS0tFM29iVDN1dlp4eUM2?=
 =?utf-8?B?UnBhU2xFaFJJZEFSa2JkblpUc203dG0zbDdXSVlVdE0vbFNqVkMraHI3MmdC?=
 =?utf-8?B?WG5wOUpwdlJxZXA3SjNpVHRMSXMwUjhKanpHU1dBY0pRL3pVYnZtRFJmeXQ0?=
 =?utf-8?B?N21qQmFtVktibU80WTBnOGVRNU5zV2gvbkJqNFAyWVpiT3BzOU9tQWxaQ3JW?=
 =?utf-8?B?MHh2ait1U2RKSmRTSzFtZkdweXlJVlFPc1hMOVVNN3RnRTBWRDhjckk0Qysx?=
 =?utf-8?B?ME5EaFZ6VUdCeElKU2xiOWZLS2tjaENLSlQ5S0dONmxocGpuMkhkTVpmNkNS?=
 =?utf-8?B?Z2hNMklHTDJNdzZ2aDdoU2Nsb0xtZ1dYWmVsM2Q3d0JCU2ZzV3Q5NGpZaDR6?=
 =?utf-8?B?cm90RkhIRTFPY2g2VFhWZnBWTWxNZDVkNFd5QjBRSnBJMmVpL29hR29KUjB0?=
 =?utf-8?B?aHBGMnF6QXVIT0V6UVlKU3B0WlZDYUVVTmdqazVQejRwOEhuZUdwMVorVFFJ?=
 =?utf-8?B?OG1mS1AzaE02TEs4TTZYSkI0SC8xSkNTTlZneEpYc2xuQlVaelpjMWVZMkNH?=
 =?utf-8?B?VENWQWJ5OHNIdzFSSmdqYVJMbmRVdnBybEQ2NDBkNnBVSkFrVDNGanh6cG1l?=
 =?utf-8?B?NUlTSXp5MUNLS25COUNiZGlyODk3dmszNDJKWE9aOUNocVVXam1pYkJrRUJz?=
 =?utf-8?B?UnR0WGpORGxHVjFGc2RaRXdtWHBqc1hGaXlUTnBpd2N6MW5XTTlYcHRtZWc4?=
 =?utf-8?B?Qk4xLzc5dGxjZDdkam5ab3dCZEV0V3BscjJjTmQ2d2k3clUwTkJwWXVJVjda?=
 =?utf-8?B?cVZJRUVkbCs5OWdyL0I0bkxoeCtJdk5uWHg5QjBRZHdEb0gzbzAyQXduZDFp?=
 =?utf-8?B?dFpVekxaeUl2UkhHMWNZQzVOOWNpZFNiTVFuTndvd2NoQ0lIZ2E3MFlubkth?=
 =?utf-8?B?RFU2K2NyaSt3emlaQWZmZzd2U1Yza3FVL09Eam9mc0NHK0Z1aXY0aDVuYklv?=
 =?utf-8?B?K01XTWxKVHcrVFAwa2hENFl2RjNQWThBMUdka1NDV1NNRmRwelQ2U2RzY0lW?=
 =?utf-8?B?MVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb86fc4-4545-4a65-3134-08dca14aac54
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 01:42:06.9985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRSSxB1Ixx19pqDDgAwaV8JYUbDFP4FCXFjL2hkEVfpx+Glr96bVVB74DnPEuQ7dQ6g43j+g5CsliCFQU7UoidtuOCKx9r4mYnTKgpHTpRjnIYbnHzHCvWS/Zq7uwmSx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1286

SGksIEphY29wbw0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNCj4gDQo+IEhpIENoYW5n
aHVhbmcNCj4gDQo+IEkndmUgcGFzc2VkIHRoZSBzZXJpZXMgdGhyb3VnaCB0aGUgbWVkaWEtc3Rh
Z2luZyBDSQ0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbGludXgtbWVkaWEvdXNl
cnMvam1vbmRpLy0vcGlwZWxpbmVzLzEyMjA5Mg0KPiAwDQo+IENvdWxkIHlvdSBjaGVjayB0aGUg
ZXJyb3JzIHJlcG9ydGVkIHRoZXJlID8NCj4gDQoNClNvcnJ5LCBteSBiYWQsIEkgcHVsbGVkIHRo
ZSBicmFuY2ggdG9vIGVhcmx5LCBmb3JnZXQgdGhlIHJlYmFzZSB0aGUgbmV3ZXN0LCB0aGVyZSBp
cyBhIGNvbmZsaWN0IGluIFBBVENIIDM6DQoNCjw8PDw8PDwgSEVBRA0KLyogVmVuZG9yIHNwZWNp
ZmljIC0gdXNlZCBmb3IgUmFzcGJlcnJ5UGkgUGlTUCAqLw0KI2RlZmluZSBWNEwyX01FVEFfRk1U
X1JQSV9CRV9DRkcJdjRsMl9mb3VyY2MoJ1InLCAnUCcsICdCJywgJ0MnKSAvKiBQaVNQIEJFIGNv
bmZpZ3VyYXRpb24gKi8NCj09PT09PT0NCi8qIFZlbmRvciBzcGVjaWZpYyAtIHVzZWQgZm9yIFN0
YXJGaXZlIEpINzExMCBJU1AgY2FtZXJhIHN1Yi1zeXN0ZW0gKi8NCiNkZWZpbmUgVjRMMl9NRVRB
X0ZNVF9TVEZfSVNQX1BBUkFNUwl2NGwyX2ZvdXJjYygnUycsICdUJywgJ0YnLCAnUCcpIC8qIFN0
YXJGaXZlIElTUCAzQSBQYXJhbWV0ZXJzICovDQojZGVmaW5lIFY0TDJfTUVUQV9GTVRfU1RGX0lT
UF9TVEFUXzNBCXY0bDJfZm91cmNjKCdTJywgJ1QnLCAnRicsICdTJykgLyogU3RhckZpdmUgSVNQ
IDNBIFN0YXRpc3RpY3MgKi8NCj4+Pj4+Pj4gMGVmMWMzZWI4NWY1IChtZWRpYTogdmlkZW9kZXYy
LmgsIHY0bDItaW9jdGw6IEFkZCBTdGFyRml2ZSBJU1AgbWV0YSBidWZmZXIgZm9ybWF0KQ0KDQpT
byB5b3UgZGlkbid0IGFwcGx5IHRoZSBQQVRDSCAzLg0KDQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

