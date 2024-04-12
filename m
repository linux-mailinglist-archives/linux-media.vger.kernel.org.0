Return-Path: <linux-media+bounces-9167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CFE8A2C5F
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 12:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1472846AD
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 10:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90483398E;
	Fri, 12 Apr 2024 10:34:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2092.outbound.protection.partner.outlook.cn [139.219.17.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFE26AF9
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918042; cv=fail; b=FTcGBhDdMCFGujGbcBP6OJGY3uV1kurQHW/guAAfjXBtqXAe7GOzDON4Kw9IJkddXBW5CoxipZaT9VIRTPNwYgCW02UsoKLMaoY6EBNScmYODHNt3PX/VQKHBgbalRuUbh0uMATbXqE0yYNY0gc+xZbQOcUB3onfd/6IdN5Uit8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918042; c=relaxed/simple;
	bh=y6XNvWVfRqH8ehqQnSqEpfSSlD3EvmMe4+/uXhPeDBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ex08Oi0cSobNCMO8EVJcjf5oDgTzHsyjmzNVnmSOch/mzsNOW1parwn0HdVDqHNigVodI/Kfc6ijzGAsnylV9Xtc+R3pEk5lIiY7Im4P5GGzr9lSZlTvstrB7DV+R3FxUu1zics6STtvEJeg5ffxvROYiBZh6Nu7J19WrrNCB3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzFLHqyPvAPPc5q5OwHV3pKT7sOAVF+mR4Mr8ym6AJ93U2U+ogmLHsok15dH3VBLm2kLaCloblFb/gozVQzcMbMBO5QNIZgKuSVFDZy8MBfwlti1hr7/Tg0vlifeBpVGf8SPSRsequhiAePHQam7slJ/pQ1i+F+w1lpc3pNtReXArwPcIx2JWl1TR61RVEYw+tJ2/g46BRAC5EURGVg57iRGRp3uKbVcUXW8/o7OKQ85RchgkfZ8Kw4qeCID2ytcawxB4LRmRNXxmHG3k4iSbCrKZvyZ5oKnUCBOf6Q3bmpi4c0KNlb17/7b7/OGvNbWmQpdf4QxlEpHh9RV+hC7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6XNvWVfRqH8ehqQnSqEpfSSlD3EvmMe4+/uXhPeDBg=;
 b=RoP8rhE4u0qwEdjL7wRBdtY7ksUErJ6c30avAJqkiKQ1/FhZVaVC/eFQl803wRL0P4lOQdylmVm+rRoAGQE1kh2/H7RDbr74E2TDtP/Mq9+RgSaAU+IZOhPME2hF4w+HA0thIotPEPCddiZYZZYb+6kNzgDFxOe+RrRbtBT/5v9Q3R/iSrY9TLvXS8Mgj1iG9ArT2FhcxUAo2LH0ovZDZvUMyTUPyLc0jyFtkxtP9U6qBOCRDq6HCN1WITvHaN+FYkSHqDX7Bw09HTcUHyfziEYGnxEuu0T9c4c8CPbau7BGv9oNOBRwE+MGjClYesBAYadcTOQQRHcqV9fYynVAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::21) by SH0PR01MB0506.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.56; Fri, 12 Apr
 2024 07:00:22 +0000
Received: from SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 ([fe80::e223:1266:a32:14a]) by SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
 ([fe80::e223:1266:a32:14a%4]) with mapi id 15.20.7409.055; Fri, 12 Apr 2024
 07:00:22 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Jack Zhu <jack.zhu@starfivetech.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjJdIG1lZGlhOiBzdGFnaW5nOiBtZWRpYTogc3Rh?=
 =?utf-8?B?cmZpdmU6IGNhbXNzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs?=
 =?utf-8?Q?back_returning_void?=
Thread-Topic: [PATCH v2] media: staging: media: starfive: camss: Convert to
 platform remove callback returning void
Thread-Index: AQHai+HmOsw8CG9pWUuKxUNeaRnzZbFkNY+g
Date: Fri, 12 Apr 2024 07:00:22 +0000
Message-ID:
 <SH0PR01MB066755DE4798EB2BD5EE04A9F204A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
References: <20240411072836.221625-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240411072836.221625-2-u.kleine-koenig@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0667:EE_|SH0PR01MB0506:EE_
x-ms-office365-filtering-correlation-id: 9d0d44df-fcee-4690-379c-08dc5abe38a9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +btHFOGp0AoJSU0GYX5En7dhOFWUFYPO3hjZ0QcW1IK1Z2VAElm/vqt0CDWlwucfWIZ5/G+/H4mIA3hJFEU3vfcXuPTz3EWVnlr+abP5YPLA1kxc2rMMeWEjnOf4+XiEGmNocHq7WCyRsepnXPOX1CVIcAWBOgPOpiSL57T8ziCbBi5A3KdnP1wCvydOzhAI+FhaY6jao82dWmPd4it+A0ZGk1Ln4tVcVIg9OKgI6tppbMDAGyAZOVZlEqRd7geaCrynGp8lDRlRa5gZm9wWkjf5BR/yposLVHalkbiFHoXVSVipqUlfihSVHoZPVLa6Y/MspzbKKHGV6ep0CdKwxI+es6sj4yGSR+simWj918Z/6vwyCb/MrxEsX5565vtmTzFXLQ+sN2LHOMZtD0/slseRsrEmCIC+dnsWyg1Ts2xXmvvyM6adgCdoIX4rW/C9dOiUAQ2RfP0b9LpSQ+xo0aPZMHu/H7+07XGz+J5rzr87R2brCSAPrw/+LEZ83YrRldrvfQNmp6dGtHPyog5AhdB/ck96viq2IVkOe0uGeWvVXgR8UR+8gbfYPqCxsF8GGk/NfXtNRqwwM83L6pmpsy5BK9B2trt7mYq4yXpWW1Vdk+gCFyifVJBug4x14sED
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(366007)(41320700004)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enhPWG9YaGw3bFYzN2xaNkc5cEVjWC9nSmJwKzY0K1k2WSs2SjByL0o3cVpX?=
 =?utf-8?B?WjZjaENPRGYyQzZEalZQblNraUsxMkNjYnVGRGtoR0F2MDk1R1FZTktETUZ2?=
 =?utf-8?B?eGh6K3RVLzBrZy9Xbm1GS2tlR0FRM1dmd2g4TE1BVUlaM2c3a252UmVlcmVv?=
 =?utf-8?B?TFROaUpYb2hieVhZL2s4Y1lIUHZEOWFuL0tiUUc1YVVXdXMzbmwvaHVSWDlI?=
 =?utf-8?B?M0Jwc1NYd01ac0lVWWQ5RkY3M3RubG1RRDM0VGVhMzdGaVRkaWZ3b1JYN2tD?=
 =?utf-8?B?UzExNEVtUHFCRm1TeTMwU0RJQlZOeXRLTk9ROHZTbXVTaFZkbGU2U3d0WnRB?=
 =?utf-8?B?QXFQbklrNllPajllSzNZZnNKS2FDTEhHUm4rS3BYaE5OTU9WNnVYSStwM1NT?=
 =?utf-8?B?S2lWSUdMazliMDZPVW9oNnkvaFBRSkx1ZmdKMWFySWsvQ21FZFFadG9PN1dP?=
 =?utf-8?B?TEVpL0VOK0Z0b3U4MytoWW1lTms4TXo0cTNtQUQxQlN6elpnTndTZTNPck1j?=
 =?utf-8?B?M2UzMFVqcFA4eXlpcHl0dW9PeFZkd2JZT1pRWUJ1TXVOYVRjZmVvRnpINUN2?=
 =?utf-8?B?OGpMbmpNU2FEUVdxUlFURmdJSllhNlVpU2NOblR0Nktzb0lzd2d1UjVUajlN?=
 =?utf-8?B?V3pVZFdaVEF1ZFc2Qkt2cGd6NHk3anhBRTNFTnBnR3NmNy9IZjRUVWx4UXhL?=
 =?utf-8?B?TWNiTmpLWm5LdmgrdlZVcURnUWh3QUk3YmErWUN2d1gvWnFIVWU0bkN0ZnJW?=
 =?utf-8?B?T3FXcEgwdWhKcU5OeWRtdEh3bXpZdk92aVBXbTMrU0M4blBXZVlZWVVWNElC?=
 =?utf-8?B?NTBxeDJtVEhtYm9hZ2NIa09veFB0UXFVSm95NkVrd05NTFVwZWp1Tm9vSkE0?=
 =?utf-8?B?Y3djVkhzQlcwSzJYVjdySDk2eGhhVkR3SFpMM1h1OVNUSi8rMEs1a3ZBV2FC?=
 =?utf-8?B?OTFReWxvWnBPbDdMM1lheFdscXY3ZTBGUEJDbE90MGNnQncrUlhVRzNjY0xQ?=
 =?utf-8?B?dXUrQTUzNnlZSHJOdHdxb0luaFhrTWNBVE9OQ0d3NFRkZURRYmhPNGZIS3VC?=
 =?utf-8?B?ZU5QR0U5OHo4bG1MZ0JjZmwvQzY0QllyRXE4Q3czMFA4NTJ5K1Q2dThjWlNE?=
 =?utf-8?B?TTdsUkZwYjhPc01NdG9ZaHFqQ2lTSjkwVlZkQ2tBYy9Mb2tUOVhtZG5HdXdG?=
 =?utf-8?B?RzRHUzBoRjY2anpRVXFyRmgzNGF4VDRDZTY2U1hoL3RSTi82eHZuQXlsN0hN?=
 =?utf-8?B?WUhQVDFuYlFHN1YyUi9vMjJCd2FiU05JdXdMdTlSV2lGdlhyUkFDek51UUxw?=
 =?utf-8?B?SFVCdHVqVmRiRTB0cTVVZFhlUVQvWTBPNENzYXFPK3YrM1p4NXhFUVhnUCtP?=
 =?utf-8?B?SDVLdGkybWZRb1o0Kys5VEF1NkhtenoxWDUwbEhKa3F2eEZOSzd5czFsbjRN?=
 =?utf-8?B?MGI0S0x2UlMra0k4Q0IxcUJxdWNhelRub0FDTjVoSVB5d3dBSzNZY1pocUdR?=
 =?utf-8?B?Z0k4OXpZNE5WMkRzdlZRNzBIQ1ZPc0wrTi81QUkwNVdrek14OXN3ZHhnM2Ja?=
 =?utf-8?B?RFUyci9jLzEyYldqNVArYlpMSVg4WXJGY0x0Tm9SWU80VndPS0tjRjJtR0h3?=
 =?utf-8?B?Vm5heUdXRnlsTWg1UStGcE5XNmdudThmRGJTWTVzVnBBZUZMdkJ4WnlrZXJT?=
 =?utf-8?B?ZlpZUGFYK2xGT3JWalIxeThJTUFlaml4djMzVkU0VVVuVi80d1dlTmk1aWo2?=
 =?utf-8?B?NnR2cDFsZFhYa1NJU2NuaGJjWW5zdDNkRCtsc1RRdk5qZndnT3VNaVEyYm1t?=
 =?utf-8?B?czRTUWtPNVM3MTVwZDB1WERFME91M3N5Mk13UDZBS3pvbGE4M1BIaG83WGJj?=
 =?utf-8?B?YnlvdjZUdTdzQ3Q4bFltYTZsOGdxOFQ2b3BpTVFsR1BXMkJ1b2lkYmZkQTBH?=
 =?utf-8?B?RnladkJGd3cvVFJic1ljQTRLdjBDd2R6RUZBa2szRXA5RDlVYnN1eXdYVENB?=
 =?utf-8?B?NDU0blZVWmZqcEhmRlBFZk5KSWtpQlJiZm1xRU5nUFp5Y3RPeG16RWp2bUZq?=
 =?utf-8?B?ZzNYLzdEazZXaS9DM0RHNkhaMGg5Kzc1VVhrdXZSeUw2WlFnTWFLeUdqNkdQ?=
 =?utf-8?B?ZGt4WU4xeWtjUUtNdEVJZEJsK09pTEF1Sld4Y01ncFI0UEpVZnVsN1RodElE?=
 =?utf-8?B?OGc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0d44df-fcee-4690-379c-08dc5abe38a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 07:00:22.0435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tt+kR5/47x2Ii2yRM4Fb3iQAOnVPXyw4MMqxb1f92ihovtYzQPx1maiIXA2L3e92E+Pk9sRECg4DVMT08t+j5QGWHvvJWRp4XFN842kxmoRoshpIl6lstP4doxi6kV94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0506

PiBtZWRpYTogc3RhZ2luZzogbWVkaWE6IHN0YXJmaXZlOiBjYW1zczogQ29udmVydCB0byBwbGF0
Zm9ybQ0KPiByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gDQo+IFRoZSAucmVtb3Zl
KCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1h
a2VzIG1hbnkNCj4gZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0
byBkbyBlcnJvciBoYW5kbGluZyBieSByZXR1cm5pbmcNCj4gYW4gZXJyb3IgY29kZS4gSG93ZXZl
ciB0aGUgdmFsdWUgcmV0dXJuZWQgaXMgaWdub3JlZCAoYXBhcnQgZnJvbSBlbWl0dGluZyBhDQo+
IHdhcm5pbmcpIGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLg0K
PiANCj4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbg0KPiB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSwgd2hpY2gNCj4gYWxy
ZWFkeSByZXR1cm5zIHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMgYXJlIGNvbnZl
cnRlZCwgLnJlbW92ZV9uZXcoKQ0KPiB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiAN
Cj4gVHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHpl
cm8gaW4gdGhlIHJlbW92ZSBjYWxsYmFjaw0KPiB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFu
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+DQoNClJldmlld2VkLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFu
Z2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCkJ1dCBpdCBzZWVtcyB0aGF0IHYxIGlz
IGFscmVhZHkgbWVyZ2UuDQoNClJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==

