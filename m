Return-Path: <linux-media+bounces-39108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1193B1E569
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C362418C5FFF
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C08826CE0C;
	Fri,  8 Aug 2025 09:13:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020143.outbound.protection.outlook.com [52.101.225.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3436B1E008B;
	Fri,  8 Aug 2025 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644388; cv=fail; b=WogzwgQBuET35amQXpm2k2049m4UFCEo8DMLuSlQEs5XOr9PkT85uGnyrzmcUs5Q9/dm+xNlICaFuGzePkaJAf4d7Za5XXm99A5FdiO/ERef6gNaWVYoMqg4qq617UoK+Uw5aG0QMCTY2DQflevc/ZlevtK53/zuRuY9jQcg8Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644388; c=relaxed/simple;
	bh=8167dRj5PqBdt1niuDLwXwRqXxdFDX5alzt+pQP6Dk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DDCpHGyP/xXeiR0rw1Z9+ZAeYo9EF8CU0BtKKDNhf0HFwj1b+i7LGVeetZhJdU7G4U2gpydqQpRS2iNJbFjZqTNvYv61BcUrhlCPpjZ5/BlT65oC4aotyLpIY4JOa+a66RLHhFGRsDgSOT/A4jBP+05cmj0i+WXryqy2uuQvAxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUR9UAITFExS/g6D/otmKESxvmj9+lVvULTgO+MyioqIHS3q6yTrMq4SQ4j61PRdjSgKoTMU1HfjY00KfwWXJJSjkQYo994k/fHD8UtF9gJTOIoLdv8uo1e46Ufj2uHEhj/0Qbkgnx3NQptZw52aR9xuDWCsydUyzBSRZHSbx+TFd9qKI2u/p7xZKfp5GXJhviQU4j0jHtSL2phzKoc3SJhLdDdsUmXZi8boTbcw86WIDzuyaGc9Qr5XS5cKya/IK/ypj1NdSBQciGAJxvmOZ5d3IRX8aBBwSQboSgQk71kY+gq0M2jOVVHIXjFThQYvSNBvmtG5GYU+nAD3MtDSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8167dRj5PqBdt1niuDLwXwRqXxdFDX5alzt+pQP6Dk4=;
 b=JfIGWEcCBuNP3TUGuEoIM50Dm99NK9uo7g8b1BsUMnoUe1OQP+77u7AHEHwALmo3JWMWqUT7+skIA7XCgUMgXEKPY2uzCJYtHLyG2PJRJkv7EIJl1H2wfAb9DnwgqtLrt0K7wFIML9G1QEIENR0VpSSoBf1wS179pKgrfoprbJZJKz7xcGbJZzfqbozV/J/WDG09j543dEVD5hpsxkC+CjjZCVJtQAy/Zf6xXU1OlOQy/jIRTAOmMpN62zTJGG8UvqHjuSrsMB3e8epkocAWnx3vADjD5p+5CMbXrnz8VAhwkunF/Qfm36Usp7ot7HXxmv7J/LlyTjK9ujlBIiKfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3P287MB1103.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 09:13:01 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 09:13:01 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Tarang Raval
	<tarang.raval@siliconsignals.io>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>, Arnd
 Bergmann <arnd@arndb.de>, Jim Lai <jim.lai@intel.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/2] media: i2c: Add ov2735 camera sensor driver
Thread-Topic: [PATCH v6 0/2] media: i2c: Add ov2735 camera sensor driver
Thread-Index: AQHcAeHQHdwfLPTOs0igfNM/aBCf+rRYhMil
Date: Fri, 8 Aug 2025 09:13:01 +0000
Message-ID:
 <PN3P287MB3519EB2966DFF198318CC164FF2FA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN3P287MB1103:EE_
x-ms-office365-filtering-correlation-id: 42db6b78-0934-4678-6a88-08ddd65bc66e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?xBMcFVfUrakVGcQm2JafdEVAZBAE1lTT6VajueKBu7PI+t9Cyoi2VyT4?=
 =?Windows-1252?Q?XIHTmZbAD8OcgIEdHTGsHtTPNPP0qLYMeYlyozx8C0pmUcz4Nz6MwIZl?=
 =?Windows-1252?Q?G68VoMw/D6LWtO2n8CnPws/uL4DQT4qRoMkfYw5v6MyOJKzSdTE/uGe0?=
 =?Windows-1252?Q?9/skac/JPEL0LUXzvyRijYHiD+r5lIsEYnKPxLBoObynrc2BoJlRf1/5?=
 =?Windows-1252?Q?AyqUV4eYNaTV/FSyazLnQgjbF6skFz/akLlGespONoMDoaKrQDkDWwm6?=
 =?Windows-1252?Q?tg0Jihf1nF9g9zEWuF66VjKAuH5FkShtZ1c79hdgfr5PBUKIfQSSYHCG?=
 =?Windows-1252?Q?81SWHcXNivjiuN71SBgNYVHIe/NkaYQL4HO7doTfPx4qtACeN4cT5rmR?=
 =?Windows-1252?Q?wvhbr88+OPrI+U1Gzj2i2aDSMN2t5dTh1FVkwdWP3UVgXHqhUgdvgDCc?=
 =?Windows-1252?Q?SBBchXq3VMqrP4GtZbAiYzu0bbGI8ckt8IOUvbPMsTf0pe7jHBUtzbw3?=
 =?Windows-1252?Q?5Rqu6QOYxCgW3e1vFiwcW9aRqhQv1XEsEkp3l6wTdenSJp+MdjYkdfIO?=
 =?Windows-1252?Q?ArQRZchkVvXaai/GAJgxrgJUtns+Wd0syF3X6ozFJ7PxAVX9cHd4vbBb?=
 =?Windows-1252?Q?wd4WxFWBa3qlKpBMiieUQgtEk8q2Lz16inwNTn+wAL9zGIr4UpIx2LJj?=
 =?Windows-1252?Q?HM8DBbzAGYATwaGCEig4ZPoASrb3fUC3rM2UftFiMKG9UGpC/jmj14C8?=
 =?Windows-1252?Q?AybY3ATIoIm4IIbsVZg1WiTBVIskeZ8ngdVlHJxpUXGuzJtbPEsXH6If?=
 =?Windows-1252?Q?LcHq00mrl5mxF2qUZIBxU91ajZD0M8nMXD2cQJsgtpgExKk8526u+7a/?=
 =?Windows-1252?Q?KPeNIhG5Z/nY7d2o1BI91W9wFloSRFPwtxkgwrDHrfReGAk+dnEEq6Lw?=
 =?Windows-1252?Q?vK5K26aalmA0a5Wb6XGSu4AwXQItn78pVrUID7TseVx+O/EmnMPzjVvk?=
 =?Windows-1252?Q?IaX+m8/ECiHEuf0pSqhbe8ALv/yjakP2rxyNeo1G8ppyqpmjLHPL3qVp?=
 =?Windows-1252?Q?3kIov/r2RpYDPcfZItx1S6ebsf2YPIwb40SNvx2fhDeYLi9bH0Nx1uG5?=
 =?Windows-1252?Q?alCLfH7N/OCHvourXzmxaWxp4W/BY77gE1bZkMU67u/T/HtpNpmNLo7F?=
 =?Windows-1252?Q?PkjSlCCUDFmQ4VvxEXEMw5c7XPYexBHIKeG6Cgz0F+CWzxhYgfP8xPiw?=
 =?Windows-1252?Q?rkCSoxq479YAhUxAGju2IXjNEMevSbC4vb/0VXlWSh/uzKFdwKG8cvCo?=
 =?Windows-1252?Q?2Do+DsKwHGcqS2BJlj07icp+mZY3uBuzuRhep+HzhL2S63ymQHlVp1NJ?=
 =?Windows-1252?Q?1gEIK24/eRTMXjCqQPCeHplE/2oW26eDrs2up+rvWwxSUQ4mzdwigBJX?=
 =?Windows-1252?Q?TjQycEtWT6mnyTjZuvjgUm0RLah/59Uyjayxgvrcc3QRKCYkiyFcfRRm?=
 =?Windows-1252?Q?LE/cfOfvUlGdo3EcSAkgQf36YlmT9/cK2Mp3M+gI5AGjQ67ooj0WGjaH?=
 =?Windows-1252?Q?uYm8jV8HIuTLNO+jW4Rav7eeR+iCcGv8g3OELg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?1IF0Nln4d1boudB6sOiZLG4j8psSxASwiwkL2LC0Q77k9fAvNnR4wppo?=
 =?Windows-1252?Q?OmbFWSOTYO44JATCVFhnnwo4Bz2Wn+qtBRfoyUVUGfQeeEczrVt4oEMY?=
 =?Windows-1252?Q?HKfxFPJHe2olGVHxbT7R9b53nXOQu+hpaCjAuKvFJAZtGZ+l8CaxJ/yQ?=
 =?Windows-1252?Q?RhvcQN53F/b+Vn7Zbkxd8OzSaPcrS7csYgnS0ZAjgv381p5/oxeiEZ59?=
 =?Windows-1252?Q?H5BUMP42OtzeTe3VcxFqi7hNChCkmB12NtC03jdpNdnwplo3UxdjUN1r?=
 =?Windows-1252?Q?GTVHBlWi98p3BIYjrQww4rATPiKau1qe2A4r9wkAqVnQsf6MrIL2siqO?=
 =?Windows-1252?Q?kUC9CZcwsR3fa23qTTZqiHxVQnkDbKTUrmniZbAl7vs1EUEc5+eq5gsA?=
 =?Windows-1252?Q?BI54Y7O23Ix/MogBC2T5eaAhhtfnyi7uIOB1+a7lCYM8EP4A+65R2g57?=
 =?Windows-1252?Q?aMFKpyzrkiHMv6lo0+vkjgyMmi2WErHj3zduN2GVZV2e1DzgsMT6QXnO?=
 =?Windows-1252?Q?FBB0qorEXUvcgLb5mWOQaBdtXNwdmePppZ6gf9ytcb3ThsMyhzk5fXtf?=
 =?Windows-1252?Q?QMkIB76lcty1RvQTJNYYmr8u4B5o8/B/ahEiue+/Xg6W4ZK7AAwRK+tR?=
 =?Windows-1252?Q?Ov1psbJbccoIC+YJBKoz+hWRKxqYaXvy3mDm1iYZSzMBe4YvLKJHsDRt?=
 =?Windows-1252?Q?ZBjYyg/LpLv5fwOw0rqJLWZzNzOqCkuV6wN3ONSF59JpzgxfNf9EUzbA?=
 =?Windows-1252?Q?9kkCAv/JxBxxQi86KNG1mDkUYReo/CpIS26Lkiqm5SFa2cU5+yQd8ybO?=
 =?Windows-1252?Q?8HZ+loT+8V6YXMUQ+l4mYgVnNHbrxTfmZ9xakKlpnniqY5AJbToMAamJ?=
 =?Windows-1252?Q?GMRXNAghxFTjLCmSo3tWvrF42FGd8JFAJsP4PP9RQcLiEMOQ18GLhjT/?=
 =?Windows-1252?Q?S/61fxK64rQ3/tHYHCyZ+EHEQ7FPgO7z61zdSiJpXi9+8QNWKRJBmzw2?=
 =?Windows-1252?Q?edbND/IS3+u5r3W4SpzluJQpAM9qJlqXiMe89pF/LADbNQ7vLuif0Kb4?=
 =?Windows-1252?Q?4NgfZgDd74JrUlYYxz/pXrHN3rvGKh2sUpmoE8I/01L4TVyMsQt6vaV+?=
 =?Windows-1252?Q?KSxg2EwvhsglGohyCe9oIRtDiDKBvOew3RbutRoxP4bzd/Aohxkt77KL?=
 =?Windows-1252?Q?pxKlnd8I8K8R+RHpw6B9+rIZEMLTlbVaeyB83oFcUqmTOHp6L89qNzTk?=
 =?Windows-1252?Q?w5zn19GrQL9x0KVtMuo7bjUV7JecbUa9AdOVP50Cy3lngTo1pwwTLqo6?=
 =?Windows-1252?Q?flb7vmcGacajEaWtn0DhIorhHJ5RxNvxrNaYOLENK+1Cu0KHxVZDQoGr?=
 =?Windows-1252?Q?nfkm9nMyZMnliofjMWu8Wq283Qel/vbdTThF2eW/Te4RHCmao0EgELh2?=
 =?Windows-1252?Q?wpFIuFOLNSdxVfpoIsSbYTMo8RTGR78Eq9VdovJ4ZWb2iY+2yK7DPWZ4?=
 =?Windows-1252?Q?MJMSbpCKvXXPEUcXPQjoEe1l4nviq1ba5j4T70NEPOf4GkhDQDCYK4U6?=
 =?Windows-1252?Q?V6d0Jp0hlZAwbaHXCdmjFi9bSXoqKgXA3Kox0XwkrXFzq+d8pyyC5U0L?=
 =?Windows-1252?Q?zFljtS1oTOItHZ48SR1KLcqDAP7VvVvuIY8U8LABp7HGCrlCFG5xhtJy?=
 =?Windows-1252?Q?Tt47hxP407mG075F59rSQhh3697CbO/VICYSOyBGt7w9viRIepwxmw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 42db6b78-0934-4678-6a88-08ddd65bc66e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 09:13:01.5534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kTiTAP1AWq4SnmxBo+KmyDIaOR528Uyugm0KC/ZvhuMRSNZ5c9DifytxzzJfqw2uXYQ3KA9hJ41iswZ1WDoSdWy9muLxeURaf1Rr2hdvIpXHqV92vEKrNhRqib16jBCe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1103

> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> active array size of 1920 x 1080.=0A=
> =0A=
> The following features are supported:=0A=
> - Manual exposure an gain control support.=0A=
> - vblank/hblank control support.=0A=
> - Test pattern support control.=0A=
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).=0A=
> =0A=
> The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a=
.=0A=
 =0A=
Hi Sakari, Laurent, Kieran,=0A=
 =0A=
Please let me know if there=92s anything else I should improve or change.=
=0A=
If not, I will proceed with sending the next version of this series, =0A=
including Andy=92s and Krzysztof=92s changes.=0A=
=0A=
Best Regards,=0A=
Hardev=0A=
 =

