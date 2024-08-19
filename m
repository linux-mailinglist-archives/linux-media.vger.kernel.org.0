Return-Path: <linux-media+bounces-16480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42B956DD4
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 16:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECA3FB21D37
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 14:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0C51741C8;
	Mon, 19 Aug 2024 14:50:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2125.outbound.protection.partner.outlook.cn [139.219.146.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69A4171E5F;
	Mon, 19 Aug 2024 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724079041; cv=fail; b=dTlHR9iNYBg4FgQN7yuN9RhkOmCR9fy3KXRIBLmWPbPGrUGSXo++TBW9BnIGkqYoEeY5IuuQWFHXiuEUOahrfUuWEm9QkGoXof3i+2lzBSHHU73NRbtXCt0qGpscF9DXkUgZOgr1qWJ1/iu5vTa/SuCcMFrSeHf2k1v0Y+kdIG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724079041; c=relaxed/simple;
	bh=2AHVNPAS4Mlz1dpGWmirsFEWQBxGGLgKssMxlok7Rag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hR+PbJnih0+uhtgEoz9bpezxwl+dTQ/es8gNPf+IRQxBfT7NGxbustfigESfiafQqrUO/q8OEhXYVGTz9QLpazBWPcbrytkhzo5r6aUPngbeeJmF/NsatErMuZTRsaP8slJwJAZc5jPtYPQMi4aa37lQvBQ0/R4x8Z3NR80iFEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gol23tp33w5aRR2BdaDrVRogArT/Zgx7ELSxawDk9Jx6SklHMNo+5aeWWzORdUR1lN8TfFzyslCJpr9gZgHhIUjrf7itBJoRdnkWiFkLhBaqi2w+8Pk2P3Ae1jfx5iD6JvQaAzywf84EdRtMdTgE3Ci5n1t/ecTDbtCesoSCWU5E3VyCmxn39DJe/TY9CDXwa+7va1QMcuxY80FN7dz+OOEfN34p9lBtBcKPvCVDDyA+cwXUo9pzBZGRoFcPze2SHInDJQG2dtVrdq7qIIzBtB4PWEqwmbfb5LWqbFTuYJ4f0y4Fvjg+6dHKUGDWvemDrwKPw5sRYUQSvMCD1HTiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AHVNPAS4Mlz1dpGWmirsFEWQBxGGLgKssMxlok7Rag=;
 b=ULD73Ht7tzeHoB3GV1ApFaTdzBPLtyXAYryAaQOwZEDEWFRFnemjwEDF7BT8fkLVWePIKERs/3Jber2Zbq5i+vutwRHfRxmghqhly3PwqdPp1CjUEonnbPZrcAKf45jCcIdUT7MLMDt0zr/Q7CNbmrrkSuqLd6Ct0n4S6+DWGZQqM0CxQuejn/tHqPmDqmxMGNjaIpRoamWcs1TI9uHbCMGVjhdGOWEjT33+EZpLVCCMUzAxf6LO5w4sfoK+5J9lAxliSYbOqN/jgblHGNaNpFtaKz3M2DxRa0HZBMsQsROar6eHtpJHlH6sgjZ2wkhGsHtShXLlDRwIUbwzmAxKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Mon, 19 Aug
 2024 13:18:02 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7875.019; Mon, 19 Aug 2024 13:18:01 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTog5Zue5aSNOiDlm57lpI06IFtQQVRD?=
 =?utf-8?B?SF0gc3RhZ2luZzogbWVkaWE6IHN0YXJmaXZlOiBBZGQgbXVsdGlwbGUgcmVz?=
 =?utf-8?Q?olution_support?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0hdIHN0YWdp?=
 =?utf-8?B?bmc6IG1lZGlhOiBzdGFyZml2ZTogQWRkIG11bHRpcGxlIHJlc29sdXRpb24g?=
 =?utf-8?Q?support?=
Thread-Index:
 AQHakjJgnQOCOrefE0y1na0O5Q3CHLIfYLwAgAAkcMCAABXlAIAEdWGwgAARb4CAABoVkIAKON+AgAAVSICAAHKggIAAUsGw
Date: Mon, 19 Aug 2024 13:18:01 +0000
Message-ID:
 <ZQ0PR01MB130204B8D11C2D13E3248870F28C2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240809132624.GB1435@pendragon.ideasonboard.com>
 <ZQ0PR01MB13029DA731711FAA57BD13A4F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240812103357.GB18729@pendragon.ideasonboard.com>
 <ZQ0PR01MB130236FA891A04350CBC4245F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240819001327.GK29465@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CE9D6EC726D3FBE8D6EDF28C2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240819081953.GM29465@pendragon.ideasonboard.com>
In-Reply-To: <20240819081953.GM29465@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1031:EE_
x-ms-office365-filtering-correlation-id: 6cd11664-0a2b-4bf9-9f8e-08dcc0515a0d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 sLA+H0RFd7iwDx4E9f6DosFYt/soBuqiC1bOkQOeJ7Wf0IBduFuR2c8ysH26mWIH2nfbkoDvNjBj7HoYw79iMLUo+TGPdqypPw21RY3DbDa58Z4wdbuVtmBAdgAbTzWGLhPr/bZKdP0wV3AHUXuqUTGd7BNU5Hfs+EIUXub0J4BqQ/xGmYcUpAcQ/g0jSuVvu1POOG1zmrmgjq4aAOPWarosu+JFnP6nJswj0Z/2ideJ14hcQlybhClYI+r52ND144ZHd+8WQMqSceXn9QgShJfP1WCIppKEGQ+0ztjuQDwLSIjAHW0TUWnYzPBcVeXYT6QFlXHW42tytpCRjRV5jTT47NkSnQseC53HVD+PkGJsg/0m/UZxiNmszK37KgH/xMZ7p9M/rW5sMKZUmsvgSHSNQtUW+x7692/l5eyJJ2YSpMAySmhwqwcr+3rTu98mB+7HigjqtstSFGwutsWs6lPlXpvxoPnlISGTQ3OVQCyTyVhmEv8ClQxqzbjoiXflKFO8JJvM5AF9da57gyUE3W40E4kRZxX+Xndz6EDm8ibE2qIEuJowrB6gfK1NGR3rdwWcNCkRE1ed/9qPqegKeBo9zs2LmvfD0caRsf2q3nqxUD5ELtIJzbikRX0eIl6U
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czRDY0RTRXNkRGw2ZG8rZlRhL3lIejdaaXhGTVpXVEVVYVM2Mm1Zamp1SnNq?=
 =?utf-8?B?TVh0ZGRQYjRQMXhSTFVaY00vYWhxeGZ4NE5lMGVGSDh1VnljWVUwb0U2eU1u?=
 =?utf-8?B?S1UyL05QTzNYOUxRKzRBM2o5aUlKS1RsaTlUSUFIaUh2QTZXdVlMT011STF1?=
 =?utf-8?B?eXVaeGJxZFd4VFI0Yk13T0lLSXRESFk3MWgydFFQMzRweVdJRHpjbmVDRkhZ?=
 =?utf-8?B?Z2pQZWpranhSeEpMY1RqOU5wQ3Y4dEx0cTlsL2plY2R4S3hQS2I2KzdkcTY0?=
 =?utf-8?B?bFdTSVRncSs5OCtUTjg0NEMyQllkeHpBUXppaTF3OWVBYTh3NHArVXQ3Z0xU?=
 =?utf-8?B?M3ZPTEFOZGkvdXZHdjFTakx3d3lDS2oxbGdQMlpBMzhHV244ZkpFd3NhdVRJ?=
 =?utf-8?B?TjV1c2ZpMmFReDJjdVlYU3RIY0UzeS9VUFc5bkxVZmlaaFI5WmxoUjA2NklN?=
 =?utf-8?B?LzVsRFAwTDlXUWxDNXAzWkdTa3ZkZE1POENBODU5Y2g0a2VwK1Q2WXV2dGRq?=
 =?utf-8?B?b29kOTBPM2RCZm1ycitpRlJrWktJbUdpTzN2OVZpcE5UajIvMTNLYi9ZN25j?=
 =?utf-8?B?SDNCZWtGY1MveC9sMHczVDgxNzBDRE9SSVN4WlBtVFFZVVpla2dHYzBZdWF6?=
 =?utf-8?B?MEN4dWYwamRIdjZtb0k5NCt0Um1KdVdJOE13a2xpZk5zSnJ0TjJ5UFFKNTlK?=
 =?utf-8?B?cTZqQU1OVEtBdnhvOFhtVFphZnp1ZnFld2dvc245TENtQUE5V3BqM1o0Z3Y4?=
 =?utf-8?B?ZVhaRlZtMHRJWjZreXdaMFVvelZDbW9GWGRVeGNPWnppQ1QrYzZFWGRpSXc4?=
 =?utf-8?B?bXdBMnErNFRSbmJDNVpMeW1GRDdNeFhDYVl0TFZBOEgwS2ZZYVowR2l1ZFhN?=
 =?utf-8?B?YU9jaVBQdVU4dVpVZ1A1VlpmLzF5UzNBaHZZN2pWKys2eVBkRFZ4ZUpsRUpG?=
 =?utf-8?B?UExhUzJsZnE3MDlpR3QwcW0rQ2tSbjRhUDhRVmxtditlMFh1SGpZS0xJQ1ZI?=
 =?utf-8?B?RHlnQ1Y1ODZuSVU2dU15eDdFNUJyQkNURlZVWFhHcEJwNFBwWU9JSXdISVFj?=
 =?utf-8?B?TDBjblNDMzJzaVZEN1pJdXRJZVo3cDdWWHNodjU3cG5rV0xhOFBZcjRyU1h6?=
 =?utf-8?B?b1o5MVB5VmdadXlBT0VROTBnMDJqMVlrZitaVnBYOUFhWHZDODhrc0E3RWFx?=
 =?utf-8?B?aVJxb1crVVlJemRmZytJS0xXakxabE5BSVdHbVMzeWVTbVVyb1d5Wm5IbVJG?=
 =?utf-8?B?bmtEL1JuU2FEVlM0RFpOcGJKbmEwdFFXckNTSVUyM2c2NmxhS3VaZDNsWTkv?=
 =?utf-8?B?cC84ZnV3ZVZ4NDFuWGFVOWlZR2FBdmpHSm1OSlc3Y2dEV3FOWFhpUkdSNjAx?=
 =?utf-8?B?bzloc1dsRDJPUFltNjE0U01DdEdKbkJlSXQyMFRnMllsNENhTUpRQ0xHcmxN?=
 =?utf-8?B?bFZiWE11SFpXbmU0alFrL0FyRVZMSGhVRW9CWmdBdzFjS2ZlNzF5ckh0ZkJR?=
 =?utf-8?B?V0xUeGVBbGZ4MFBPeSt0MmYvR1lnYlM0ZlpTZlhET0tGZVBJT0NzYXlGdG10?=
 =?utf-8?B?dVBWNTdTWHlGVS8vbDBhVnFZb2dhOW9QZmIySFkzaXJSRmdLSHphaSs0Sm5y?=
 =?utf-8?B?bGpyN0wzaUNrSkQxMXB0dEk2cUpRYzhZQjgvbk1qRDhnbGlXaWlKaEpteFVO?=
 =?utf-8?B?R1VYdnl4bkVTTFAwem94RUNmUTRHMzdOdkE5Tko2T0w1bVJBTFdKMmhoeUxZ?=
 =?utf-8?B?a0RycU8veGIwTk0vem1SRFhOaWVyb3BMQi9BNGdlS2dleVN1Sm5zSFk5Z2pJ?=
 =?utf-8?B?Y1Z3UWc4Nk1kQmQ0YUxvOGdqZUxvZXkveHpTdTBVQjMzWVlNSlpPYUk5eEQ3?=
 =?utf-8?B?NUNIOXhSc044eCtMVDJpV2VqN2F2dDNQZzhKcHBsbVhwbVlkRXpTL3RsNXps?=
 =?utf-8?B?dG5OakxCMFJGc2UrZTFzaFdIOC9mRXAyN0I0QVVGd0RkWkdDc2o3LzU1d25y?=
 =?utf-8?B?Sm02aU16NWZoN3RyZ0hDM1V6bTNxWGxKM0FRVWhtRTNQbjFIWXg1c0wzUGdL?=
 =?utf-8?B?N0Q1NUhyZkh6QXJIQlNpcnNPRlNzQlhjdGVXOFpQdTc5S0RaWWhZQkozVXAx?=
 =?utf-8?B?dGNKR1ErcEU4Y21mQk90T1RHdXBUTVRNMUc3akF6Ri9NeE1meU1VT0pPZkVh?=
 =?utf-8?B?SWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd11664-0a2b-4bf9-9f8e-08dcc0515a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 13:18:01.5225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zCWJzPvyhF6afKqbPJf5mEgaH6EtTJFVRdxfr9eVIe+WKKdzKhx3PqLyGVD/Ve5Ja5lat+8nYGCB/LbGR5RcglVtywd8XE4/44FrIsz/An5evuJx8NC9di63FNlw1Cb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1031

SGksIExhdXJlbnQNCg0KPiANCj4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDE6Mzc6MzBBTSAr
MDAwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiA+IE9uIE1vbiwgQXVnIDEyLCAyMDI0
IGF0IDEyOjEzOjAzUE0gKzAwMDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiA+ID4g
T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDk6NDM6NDdBTSArMDAwMCwgQ2hhbmdodWFuZyBMaWFu
Zw0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gRnJpLCBBdWcgMDksIDIwMjQgYXQgMTI6MTI6
MDFQTSArMDAwMCwgQ2hhbmdodWFuZyBMaWFuZw0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+
IE9uIEZyaSwgQXByIDE5LCAyMDI0IGF0IDAxOjE5OjU1QU0gLTA3MDAsIENoYW5naHVhbmcgTGlh
bmcNCj4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEFkZCBtdWx0aXBsZSByZXNvbHV0aW9u
IHN1cHBvcnQgZm9yIHZpZGVvICJjYXB0dXJlX3JhdyINCj4gZGV2aWNlLg0KPiA+ID4gPiA+ID4g
PiA+ID4gPiBPdGhlcndpc2UgaXQgd2lsbCBjYXB0dXJlIHRoZSB3cm9uZyBpbWFnZSBkYXRhIGlm
IHRoZSB3aWR0aCBpcw0KPiBub3QgMTkyMC4NCj4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gRml4ZXM6IGUwODBmMzM5YzgwYSAoIm1lZGlhOiBzdGFnaW5nOiBtZWRpYTog
c3RhcmZpdmU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGNhbXNzOiBBZGQgY2FwdHVyZSBkcml2ZXIi
KQ0KPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBDaGFuZ2h1YW5nIExpYW5nDQo+ID4gPiA+ID4gPiA+ID4gPiA+IDxjaGFuZ2h1YW5nLmxpYW5n
QHN0YXJmaXZldGVjaC5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4g
PiA+ID4gPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYXB0dXJl
LmMgfA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA1ICsrKystDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUu
Yw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9j
YW1zcy9zdGYtY2FwdHVyZS5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGluZGV4IGVjNTE2OWU3YjM5
MS4uOWU4NTNmZjI1OTZhIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNh
cHR1cmUuYw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
c3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKysrIC5jDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IEBAIC0xNzcsOSArMTc3LDEyIEBAIHN0YXRpYyB2b2lkIHN0Zl9j
aGFubmVsX3NldChzdHJ1Y3QNCj4gc3RmY2Ftc3NfdmlkZW8gKnZpZGVvKSAgew0KPiA+ID4gPiA+
ID4gPiA+ID4gPiAgCXN0cnVjdCBzdGZfY2FwdHVyZSAqY2FwID0gdG9fc3RmX2NhcHR1cmUodmlk
ZW8pOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgCXN0cnVjdCBzdGZjYW1zcyAqc3RmY2Ftc3MgPSBj
YXAtPnZpZGVvLnN0ZmNhbXNzOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArCXN0cnVjdCB2NGwyX3Bp
eF9mb3JtYXQgKnBpeDsNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlz
IHZhcmlhYmxlIGNhbiBiZSBjb25zdCBhcyB5b3UgZG9uJ3QgbW9kaWZ5IHRoZSBmb3JtYXQuDQo+
ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgCXUzMiB2YWw7DQo+ID4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAJaWYgKGNhcC0+dHlwZSA9PSBTVEZf
Q0FQVFVSRV9SQVcpIHsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKwkJcGl4ID0gJnZpZGVvLT5hY3Rp
dmVfZm10LmZtdC5waXg7DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gQW5k
IGl0IGNhbiBiZSBkZWNsYXJlZCBhbmQgaW5pdGlhbGl6ZWQgaGVyZToNCj4gPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gPiAJCWNvbnN0IHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgKnBp
eCA9DQo+ID4gPiA+ID4gPiA+ID4gPiAmdmlkZW8tPmFjdGl2ZV9mbXQuZm10LnBpeDsNCj4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
IAkJdmFsID0gc3RmX3N5c2Nvbl9yZWdfcmVhZChzdGZjYW1zcywNCj4gVklOX0NIQU5ORUxfU0VM
X0VOKTsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gIAkJdmFsICY9IH5VMF9WSU5fQ0hBTk5FTF9TRUxf
TUFTSzsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gIAkJdmFsIHw9IENIQU5ORUwoMCk7DQo+ID4gPiA+
ID4gPiA+ID4gPiA+IEBAIC0xOTMsNyArMTk2LDcgQEAgc3RhdGljIHZvaWQgc3RmX2NoYW5uZWxf
c2V0KHN0cnVjdA0KPiBzdGZjYW1zc192aWRlbyAqdmlkZW8pDQo+ID4gPiA+ID4gPiA+ID4gPiA+
ICAJCXZhbCB8PSBQSVhFTF9IRUlHSF9CSVRfU0VMKDApOw0KPiA+ID4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiAgCQl2YWwgJj0gflUwX1ZJTl9QSVhfQ05UX0VORF9NQVNLOw0K
PiA+ID4gPiA+ID4gPiA+ID4gPiAtCQl2YWwgfD0gUElYX0NOVF9FTkQoSU1BR0VfTUFYX1dJRFRI
IC8gNCAtIDEpOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArCQl2YWwgfD0gUElYX0NOVF9FTkQocGl4
LT53aWR0aCAvIDQgLSAxKTsNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBJ
cyB0aGVyZSBubyBuZWVkIHRvIGNvbnNpZGVyIHRoZSBpbWFnZSBoZWlnaHQgYXMgd2VsbCA/DQo+
ID4gPiA+ID4gPiA+ID4gPiBIb3cgZG9lcyB0aGUgZHJpdmVyIHByZXZlbnQgYnVmZmVyIG92ZXJm
bG93cyBpZiB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+IHNlbnNvciBzZW5kcyBtb3JlIGRhdGEgdGhh
biBleHBlY3RlZCA/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBPdXIgaGFyZHdh
cmUgd2lsbCBjb25maXJtIGEgZnJhbWUgb2YgZGF0YSB0aHJvdWdoIHZibGFuaw0KPiA+ID4gPiA+
ID4gPiA+IHNpZ25hbCwgc28gdGhlcmUgaXMgbm8gaW1hZ2UgaGVpZ2h0IGNvbmZpZ3VyYXRpb24u
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFdoYXQgaGFwcGVucyBpZiB0aGUgc3lzdGVt
IGV4cGVjdHMsIGZvciBpbnN0YW5jZSwgYQ0KPiA+ID4gPiA+ID4gPiAxOTIweDEwODANCj4gPiA+
ID4gPiA+ID4gUkFXOCBpbWFnZSwgYW5kIGFsbG9jYXRlcyBhIGJ1ZmZlciBvZiBvZiAxOTIweDEw
ODAgYnl0ZXMsDQo+ID4gPiA+ID4gPiA+IGJ1dCB0aGUgc2Vuc29yIG91dHB1dHMgbW9yZSBsaW5l
cyA/IERvZXMgdGhlIGNhbWVyYSBoYXJkd2FyZQ0KPiA+ID4gPiA+ID4gPiBpbiB0aGUgU29DIG9m
ZmVyIGFuIG9wdGlvbiB0byBwcmV2ZW50IGJ1ZmZlciBvdmVycnVucyA/DQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gVGhlIGhhcmR3YXJlIGNhbiBjb25maXJtIHRoZSBpbWFnZSBoZWlnaHQgYnkg
dXNpbmcgdGhlIFZTWU5DDQo+IHNpZ25hbC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJbWFn
ZSB3aWxsIHRyYW5zZmVyIHdoZW4gVlNZTkMgaXMgaGlnaC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBWU1lOQyB0aW1lID0gKHdpZHRoICsgaF9ibGFuaykgKiBoZWlnaHQ7DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBXaGF0IEknbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBpcyB3aGF0IGhhcHBlbnMg
aWYgdGhlIElTUCBpcw0KPiA+ID4gPiA+IGNvbmZpZ3VyZWQgZm9yDQo+ID4gPiA+ID4gMTA4MCBs
aW5lcywgYnV0IHRoZSBjYW1lcmEgc2Vuc29yIHNlbmRzIG1vcmUgdGhhbiAxMDgwIGxpbmVzDQo+
ID4gPiA+ID4gKHRoZSBWU1lOQyBzaWduYWwgaXMgYWN0aXZlIGZvciBtb3JlIHRoYW4gMTA4MCBs
aW5lcykuIFdoZXJlIGluDQo+ID4gPiA+ID4gdGhlIGRyaXZlciBpcyB0aGUgaGFyZHdhcmUgY29u
ZmlndXJlIHdpdGggdGhlIDEwODAgbGluZXMgbGltaXQgdG8gYXZvaWQNCj4gYnVmZmVyIG92ZXJm
bG93cyA/DQo+ID4gPiA+DQo+ID4gPiA+IElmIGlzICJjYXB0dXJlX3JhdyIgdmlkZW8gZGV2aWNl
LCBubyBpbWFnZSBoZWlnaHQgY2FuIGJlIGNvbmZpZ3VyZWQuDQo+ID4gPg0KPiA+ID4gSW4gdGhh
dCBjYXNlIHdoYXQgaGFwcGVucyBpZiB0aGUgY2FtZXJhIHNlbnNvciBzZW5kcyBtb3JlIGxpbmVz
IHRoYW4NCj4gPiA+IGV4cGVjdGVkID8gV2lsbCB0aGUgcmF3IHZpZGVvIGRldmljZSB3cml0ZSBw
YXN0IHRoZSBlbmQgb2YgdGhlIGJ1ZmZlciA/DQo+ID4NCj4gPiBZZXMsIHRoZSBidWZmZXIgd2ls
bCBvdmVyZmxvd3MsIHNvIHdlIHdpbGwgdXNlIHRoZSBzb2Z0d2FyZSByZXN0cmljdGlvbnMuDQo+
ID4gSW1wbGVtZW50IC5saW5rX3ZhbGlkYXRlIGhvb2tzIGZvciB0aGUgQ1NJMlJYIHN1YmRldiBh
bmQgImNhcHR1cmVfcmF3Ig0KPiB2aWRlbyBkZXZpY2UuDQo+IA0KPiBJcyB0aGVyZSBhbiBJT01N
VSBpbiB0aGUgc3lzdGVtIHRoYXQgY291bGQgaGVscCBwcmV2ZW50aW5nIGJ1ZmZlciBvdmVyZmxv
d3MNCj4gdG8gcmVhY2ggc3lzdGVtIG1lbW9yeSA/DQo+IA0KDQpKSDcxMTAgU29DIGhhcyBubyBJ
T01NVS4NCg0KPiA+ID4gSWYgc28sIGlzIHRoZXJlIGEgd2F5IHRvIGd1YXJkIGFnYWluc3QgdGhh
dCA/DQo+ID4gPg0KPiA+ID4gPiBJZiBpcyAiY2FwdHVyZV95dXYiIHZpZGVvIGRldmljZSwgaXQg
d2lsbCBiZSBzZXQgYnkgc3RmX2lzcF9jb25maWdfY3JvcC4NCj4gPiA+DQo+ID4gPiBUaGFuayB5
b3UsIHRoYXQncyB0aGUgaW5mb3JtYXRpb24gSSB3YXMgbG9va2luZyBmb3IuDQo+IA0KPiAtLQ0K
DQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0KDQo=

