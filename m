Return-Path: <linux-media+bounces-16046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365E94CC32
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47CD91C22C04
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A37F18E764;
	Fri,  9 Aug 2024 08:29:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0082177981;
	Fri,  9 Aug 2024 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192185; cv=fail; b=mzhmJALJ1EjIr9tJDMfUvIOCGtU5caXbFuDSKmyxQYmYsa3sQ6/uszSf33dAW2UGzn6vifLvpEHryLQdM8f8nx5pEirZCmZd1Vr+wDS37Z79lmDNCQooOmkK1RRYumuoy05HA7z10k1Wk0gYS6yWkHW+oyNoP7BFcLvnfO4BKqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192185; c=relaxed/simple;
	bh=KqSDEUFs6YLqgLpeb589BKJuBST7Qh9FpTpOv5NbVDo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XDGyTKvW4dbA6M7VVCbVtOeJXmB5qGnP68pXR2l5uHisfw8rzk5uMdMLobwyxp+OSPoNy5mDtp05297jjFYlDVS1R5vl6mIIjpYJhlZFpxpEqtPqHe7v3AcXbul3nljwf2wkk7CTBsZuwJiST/zmQ0Uqm/nqFVjB/6CiS/SrET4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYhxkl39LLzIrrx1K0mmVBkFRN3DrRSJsOFdIgLz/yQVLKwQs6a4vs+7ABFBiEhf9tsPqcZXYRIbstn2WhexU4dSbBfx2UlX0PYF0bXVCTUjsKo5m/8CyX+H0nGNqORSdbF4QQSWclrXXPKe98fNBZj9v89IH3plgfs9lkV1TSfVPee/IxbRcr458D57LPd9nASdWsv2ExuBRTUWnQ9Alz+S4GnLotQeOs08M4maOYf5jyatPdHU8jqyvqeTj6nVoFWb7tpcBrupYZm/P6tlXIdeccpCUAB2jBvjdyCYCNcZwa/LY/gGdlG7e9JG4DQLCPETq+0SM01vIirv4zHVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqSDEUFs6YLqgLpeb589BKJuBST7Qh9FpTpOv5NbVDo=;
 b=AVLa30H38sbQtfSzop8MGM8K4qAhwvcSvYsiDo/tXmXoRBblGB3jaRxv7YCF8raYZmSFoSjA42dWliQ8oQjo0LuKobnUHC+i/g5wGTkJLzcZeY7QfUq3gMUpRmOWruol4YiTZ1YB+GaflwO9asJ5yjNWItIPMlygFeoz5p23mdPF/bkZIsekJkuk/mGAfjJi+GN7xRLFTC0l3AS6tIgH35YXFTLvfcI74fMYY8FH1CZJGTJ7rNCuDe194J33/xGRjiC1MZGFCU2Hb4zcUkxZkWEFwH/uczgIRKYpj7tT0HKgaI6Q7lDHIswQanyHy1QYLh1adpCqIlRY66dlOR3ANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1110.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 08:29:31 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7828.030; Fri, 9 Aug 2024 08:29:30 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIXSBzdGFnaW5nOiBtZWRpYTogc3RhcmZpdmU6IEFkZCBt?=
 =?gb2312?Q?ultiple_resolution_support?=
Thread-Topic: [PATCH] staging: media: starfive: Add multiple resolution
 support
Thread-Index: AQHakjJgnQOCOrefE0y1na0O5Q3CHLIfR3cA
Date: Fri, 9 Aug 2024 08:29:30 +0000
Message-ID:
 <ZQ0PR01MB1302A3ABE95897046ED4F502F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1110:EE_
x-ms-office365-filtering-correlation-id: a2392e95-a04a-425c-d8da-08dcb84d63e0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 TxftXRe6htYod8ZBB6/VcEq1tfq2/JnvSu3f1+gku886uueHgt3w1z7k16S9R/H6YSlHoM2UZ0g5mIhbpUKt3/l0MoZBoKgxcT0vFFPjATFjEGoDAswS5mUYVKvmj7URuO0tnplAsB/6/Uzr1vgljAnHQ/wmGo4olUpVxPU07iUcus3wyM2zqChwFOqq0AbQjyvAbXXfXCA0+TDp+AK/LbIPy0yDq5jL/AwH2DbloYR1jvYWpX/fBhqHC7nqNFEJqnPhz38YDb9akzUsheUQnCvQatPjoB+zuac6F9srTgahZcJALMITkkmM8H7bjdc0R2u12BIlIgz3ofR9o01stcFMApvfISD8yG5zDiv6Xq2WSuXojV0Uw7J2popnfTYbyv8VloXVOfo34Udl+jJH0sIZH0zVG0MlcWU4hEEAyy6aJ7VzFHfTZacnvH/tQ10o76SiwzGaRkC1lEgKb5SR8hkC2Bs/+OhU2IvGET6ZpE7r53UaCuHxqzoC3jyw/YAbLLdg9aD6L9E7TcHILvXpJ6u1/TZn9S0aR5S+MU/NJy0FqQLafX6GObfT1T98MGJR36PX5gsqxDmh3noQcktboi1xCctr7UJg4Sg72X79TY5NFWIUc73b5QKzUNNOx0r0
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?TmNKMFo5YURybGUraTNObU9qQU9lS25lVnNGckU5eUliQVM0NVBrUzlpbEtx?=
 =?gb2312?B?MVFjZXoydTJHbmMzZHo1VGpYSE5hOHR5K1dkQmNJakI0WHRla1pVbzZweWRr?=
 =?gb2312?B?clpuaWtjUEswS3VUbk1paUxwZTE5TWlUeWwxckZtVjFIMnZqTkhFemFvUW9s?=
 =?gb2312?B?NkZjaEJWcW41VVFBU01rVEZNeXc2K2JrWUxGOVlzdWpocjhsWVZiUzlPcWRv?=
 =?gb2312?B?aEJaVDVHODltcDlqV2hTK2ZGWTQ2eWNIUUdLek9ZQnI0T2tOZEt2ckhwcytl?=
 =?gb2312?B?K0d4WVptNEtTTDQxRENkQ1NtcnN3ZDh5ODJLTlF1dWRKUXE5NWVkRVdGd2c5?=
 =?gb2312?B?ZE5CVHA0VVkrZXFIc0hnbFNqeUFORFBSSGY5NjlEVHVoMTljVVlsdGNQYmRj?=
 =?gb2312?B?YzN3cWNJR2poeTlobnJSNmZ6UG5MQkpDdTNZT2FRMjZwYVhXWjkrbStaSndD?=
 =?gb2312?B?WE80RnpMUFpkMC9HTTBNRWlkT1JUM2ZYY0h0TktmMVpwSEJCaHZac3NXVzBq?=
 =?gb2312?B?ak0raDRqbUhrUVNlZmhzUFlDSVZuK0dYWjBqVGlQWFZUWVNvNDlld2pzakRV?=
 =?gb2312?B?M0Y4VVlaSW5YRFI2R2VnK29pNEhmQm1NTXVoTGJNUytYWkFwQkZSaW0xbXFX?=
 =?gb2312?B?dkdPR1d0VFk1N2g3bGdGSWtaWXBqb0tsbHRMOG92dkN6c285eCsrT2c0SWFB?=
 =?gb2312?B?dVM4VWlqazhkTDlsOFdqRlRXY2c4UUp0MkJtQzFWVkQzbXlDSG50d3hjbkNx?=
 =?gb2312?B?RDI3dy8xSUNhQXpZc2NJR2hOekRPNHlNakx5RThKOXJHMFNMaTJYeXpkK05k?=
 =?gb2312?B?dlVhUG9NWitQbk5KOFVhY281cHZUb1Z6WXJsdngzZnk4MWdzS2hNcTJJd2k0?=
 =?gb2312?B?Qy9waVR4a2tPeExpNXloQW9VRElHRkZtQjhxeFBPYUxsWjcrV3dUamUyWlFL?=
 =?gb2312?B?RGdjZkNVVnFJOFV4amp1a0orMG1pS0FOSmhPN3psczN5MVpSdlJZeW85MEo5?=
 =?gb2312?B?d05oVmN6NFBFR05lTHhiZG93SXRQZDRGWmtBSzhQc2tUaTZTY3ZUN3Nkd3Ft?=
 =?gb2312?B?dVUxWDJ2cTZZSHozNVVPdTQ1VnJWZmJHNzhMV1ZhTCtmRjZ3dnlrWDlUamFM?=
 =?gb2312?B?R1JFUFZLbVQvL28vWlI5SEZnbkV5YTdjeGMrbnRuYnVLdHl2N3hxdnFhUTZn?=
 =?gb2312?B?SHpOSXZNSis5emZENnlya0pPUll1MmFEbTR3anhFZUNYTGZjQXFidW5jblZa?=
 =?gb2312?B?QU5TSFMzTVRoR3daeWZGY1NKY1U0cWhCVG1uM1hoTHMvOTcvMTFHYUFGNDlS?=
 =?gb2312?B?S0EralZ1aThNbHd3SnVMaElOYzRUZ01jbmVnSmp5Y0lRazhJZk5KTUFnclFr?=
 =?gb2312?B?RHkzRUEwakgyMjA5WkJtUG94QWpQZUZ6dlNrZ3ltNzlmZEs1aVl2VmZkSVFE?=
 =?gb2312?B?RVBCZm5nM3JnVXdlYUJ5VXRWVVoxV3paVWdvTDIxN1Y0Q3ZEcGQ1cSt2YTVL?=
 =?gb2312?B?MVFndlFuMXVjWUxrZUI3eWJ4b2hObWhuRGFUdlM1UXZ4aGJmbjgzckYybHZQ?=
 =?gb2312?B?TURYK3lrVmhiYUZxMmVSYVNjL2J1dHdBRnd4QnRDNGx5dHJ4dnZtWEIveWlP?=
 =?gb2312?B?bUdSS3pyMmJPTUFpRG80aWN1V25PdDYrQStacVEwam8raGdWOHpseWVuRjZh?=
 =?gb2312?B?TGRKQ1NlVEtJQmg0cmRGcWY0bHBWMVZSZkVNUi9td3FUWnJrWGdhZW8rem9w?=
 =?gb2312?B?aVZrQnJLZnk3U21VTXN1ZVdZc3JLMWxEeU5lTHFENXhHdWtRQ1pzZVhEcUIz?=
 =?gb2312?B?MmtndE1PREdtb3pLMmEzb0RYajlpM3BqMnlLTTU5T2cyZllRc0dJaG1DOTFt?=
 =?gb2312?B?akV5eFEwV2tUcVhLLzg4M2kzRkt2dWZCYnRpTGJ3VURyWlBiNGs4bGpLOWFn?=
 =?gb2312?B?cFIveHJGbjZLWjhEYlNBd2hseDF6a1NKdkNrbDRYUndMQmV1Y3dtM3V2OWw5?=
 =?gb2312?B?YVozR0ZqYlZqYzhTRlFQN1JwTk82cldIL1ZxallwNDdDMUk0OUNMaHlYdmIr?=
 =?gb2312?B?VFlvZXF3SDRlbnZsdzFxTE5xdnNFK2QzTFFidEFSb3hjMWVLa25RYkNjRldT?=
 =?gb2312?B?eUtsdDgyS2RWbStra1dXRGFWeG5RbE5Hdk9LVUlXdWhyQ3J6Z2l3RnFiQlk4?=
 =?gb2312?B?SWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2392e95-a04a-425c-d8da-08dcb84d63e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 08:29:30.6365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9+yYJko3lAjZCVCmOp4FrDazCsd2j3ghQgE96Okvj2UC+PqlJRDKNlzwZ6reZlZI7nG1fV2UkBwkKV4y68ECdkHM3bWb883QRiUS9tzXBgEUAfnmdOLgliaauu/btIG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1110

SGksIEhhbnMNCg0KPiBBZGQgbXVsdGlwbGUgcmVzb2x1dGlvbiBzdXBwb3J0IGZvciB2aWRlbyAi
Y2FwdHVyZV9yYXciIGRldmljZS4gT3RoZXJ3aXNlIGl0DQo+IHdpbGwgY2FwdHVyZSB0aGUgd3Jv
bmcgaW1hZ2UgZGF0YSBpZiB0aGUgd2lkdGggaXMgbm90IDE5MjAuDQo+IA0KDQpDYW4geW91IGhl
bHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2gsIFRoYW5rcyBmb3IgeW91ciB0aW1lcy4NCg0KUmVnYXJk
cywNCkNoYW5naHVhbmcNCg0KPiBGaXhlczogZTA4MGYzMzljODBhICgibWVkaWE6IHN0YWdpbmc6
IG1lZGlhOiBzdGFyZml2ZTogY2Ftc3M6IEFkZCBjYXB0dXJlDQo+IGRyaXZlciIpDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNz
L3N0Zi1jYXB0dXJlLmMgfCA1ICsrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYXB0dXJlLmMNCj4gYi9kcml2ZXJzL3N0YWdpbmcvbWVk
aWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUuYw0KPiBpbmRleCBlYzUxNjllN2IzOTEuLjll
ODUzZmYyNTk2YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZl
L2NhbXNzL3N0Zi1jYXB0dXJlLmMNCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJm
aXZlL2NhbXNzL3N0Zi1jYXB0dXJlLmMNCj4gQEAgLTE3Nyw5ICsxNzcsMTIgQEAgc3RhdGljIHZv
aWQgc3RmX2NoYW5uZWxfc2V0KHN0cnVjdCBzdGZjYW1zc192aWRlbw0KPiAqdmlkZW8pICB7DQo+
ICAJc3RydWN0IHN0Zl9jYXB0dXJlICpjYXAgPSB0b19zdGZfY2FwdHVyZSh2aWRlbyk7DQo+ICAJ
c3RydWN0IHN0ZmNhbXNzICpzdGZjYW1zcyA9IGNhcC0+dmlkZW8uc3RmY2Ftc3M7DQo+ICsJc3Ry
dWN0IHY0bDJfcGl4X2Zvcm1hdCAqcGl4Ow0KPiAgCXUzMiB2YWw7DQo+IA0KPiAgCWlmIChjYXAt
PnR5cGUgPT0gU1RGX0NBUFRVUkVfUkFXKSB7DQo+ICsJCXBpeCA9ICZ2aWRlby0+YWN0aXZlX2Zt
dC5mbXQucGl4Ow0KPiArDQo+ICAJCXZhbCA9IHN0Zl9zeXNjb25fcmVnX3JlYWQoc3RmY2Ftc3Ms
IFZJTl9DSEFOTkVMX1NFTF9FTik7DQo+ICAJCXZhbCAmPSB+VTBfVklOX0NIQU5ORUxfU0VMX01B
U0s7DQo+ICAJCXZhbCB8PSBDSEFOTkVMKDApOw0KPiBAQCAtMTkzLDcgKzE5Niw3IEBAIHN0YXRp
YyB2b2lkIHN0Zl9jaGFubmVsX3NldChzdHJ1Y3Qgc3RmY2Ftc3NfdmlkZW8NCj4gKnZpZGVvKQ0K
PiAgCQl2YWwgfD0gUElYRUxfSEVJR0hfQklUX1NFTCgwKTsNCj4gDQo+ICAJCXZhbCAmPSB+VTBf
VklOX1BJWF9DTlRfRU5EX01BU0s7DQo+IC0JCXZhbCB8PSBQSVhfQ05UX0VORChJTUFHRV9NQVhf
V0lEVEggLyA0IC0gMSk7DQo+ICsJCXZhbCB8PSBQSVhfQ05UX0VORChwaXgtPndpZHRoIC8gNCAt
IDEpOw0KPiANCj4gIAkJc3RmX3N5c2Nvbl9yZWdfd3JpdGUoc3RmY2Ftc3MsIFZJTl9JTlJUX1BJ
WF9DRkcsIHZhbCk7DQo+ICAJfSBlbHNlIGlmIChjYXAtPnR5cGUgPT0gU1RGX0NBUFRVUkVfWVVW
KSB7DQo+IC0tDQo+IDIuMjUuMQ0K

