Return-Path: <linux-media+bounces-37781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1AB05AEE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 15:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF77C3A4F7E
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18CD2E1C54;
	Tue, 15 Jul 2025 13:11:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021086.outbound.protection.outlook.com [40.107.51.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20F71991D2;
	Tue, 15 Jul 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585101; cv=fail; b=FVoCLMbfKwBRyLAS0/SJlCbZLxXFm9lPLNyV+djkZmGSusWPNz4p97eh4DIzpfwMzBiK4DGOiiTF/5ZHWx+b0q5v4FbylMg7SyQlVpxUkyDSotPb1GbpTqI6hVjmV2nj35uJwHfIkbEafwmJzWv5xJVd5o170kJ0bsMGDyC8/pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585101; c=relaxed/simple;
	bh=pNN0xGyBBTqoUbnqxtujMxeQ/GdI2EOu23PMJPuaG/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ga5h/E7v7oC8gF8stWHmwLNwj7c0P9Jb8IWh/hlX6HOxwTj5ATmQ4NjHhTCARNlEzTWJI4h2utUsoKuw98Umhw0mZhgql//IWMayI9WyY3y4V9fsrPZwR9+XxznblfNSZhC7QK6+H5FGbMDdUVl/i/3APYycG7BcXfo2F50e4cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woRx0indNWu0Gwvl48neo0P8EoFdcynZA1IGmZQXCIcT8JTUSBuQUPiLaLrAyC7V0qjL3uE9pWr06ztPC6+WM5Ka66GPl8g4h4m0yQHagdTZLwuZK4eGl2qJgseWmJyAY0/z9hPlxy92802NEJWzkXY+lJ1/qmPgf0drRNaz2+Y2KwBnXMZSsBOXpa8jle5ZT6kfw2X9lKkUZ7iIUJ3Px10IW01LqedRtevrPY6Ktsd5Ksiw7WJ66CMFVa8AXto++OQpcUUeN1iOEWghlBL1Fgkmu07/NH3p8qicxAP4CHPtA/TiEPNhNybrOMoPP33NUhHubx9Q7I5Zhtm8TZWzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNN0xGyBBTqoUbnqxtujMxeQ/GdI2EOu23PMJPuaG/M=;
 b=L0a24bJXYHuQxNExIJLGqc95l9muOh62n7IMvb1cjbmzCuywHtXwxz8/6VDhOO1Qly0V4uYu+lOcO7H7xfZNCYn4pWsd8EcOtgqkyyEn/4kxvkurqOoujrFS/RVt8eMoBH0b7v+NMIDyJYLuDtr+9brFbsW5OSwcMTDFGt+AIC9h+mEtTGkaDR/0hul3sKvICVZDzAfWdU2VSSB/BM8oOgS/AUoxb8+B6o3i69/YTg4QsfdQVYRO79/0VRM7MVMnMhaxyc3WIppGLp3adFktOi/ncwJTHmLTawCVCVnHHwIlUuZhrEhS+by8XPP7erWUqky+TabKTw5NXL7StsQVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0238.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 13:11:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 13:11:34 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Michelle Jin <shjy180909@gmail.com>, "andy@kernel.org" <andy@kernel.org>,
	"hansg@kernel.org" <hansg@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
CC: "lkcamp/patches@lists.sr.ht" <lkcamp/patches@lists.sr.ht>,
	"koike@igalia.com" <koike@igalia.com>
Subject: Re: [PATCH] media: atomisp: fix trailing block comment style
Thread-Topic: [PATCH] media: atomisp: fix trailing block comment style
Thread-Index: AQHb9YLeI1arcN3vwEeRmpY8YocDlLQzIwIM
Date: Tue, 15 Jul 2025 13:11:34 +0000
Message-ID:
 <PN3P287MB1829790FCBF0CFF1F06585728B57A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250715121839.12987-1-shjy180909@gmail.com>
In-Reply-To: <20250715121839.12987-1-shjy180909@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0238:EE_
x-ms-office365-filtering-correlation-id: 02338573-3860-4483-03e8-08ddc3a11fe5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EPb74i9rdSTTEdHElKLgdLfxEFzgCAw+B93mKUgIPMxhVDcUqxhPzmzxkb?=
 =?iso-8859-1?Q?ZMUlOvrV+EGda42UGGcFSGj6lOXg+OPIBprSct7qm7erg7EBHIL4z5/sMD?=
 =?iso-8859-1?Q?UAl6CpNmlaGC52sYkaeVeie5nPK2q/ge2wgIpTFZZHFtvhnn9mLgbCNHOl?=
 =?iso-8859-1?Q?W/ZAVevXjkxiEoVxLnBWkEYk5+57FzRKk0bNGIutJeoAS1zlgJhiNFIX5L?=
 =?iso-8859-1?Q?EOLIhPNvVd6OUjlysvu0uBlJdMI/yiqUPIuPoo1obk2URtBP9dgybwm65b?=
 =?iso-8859-1?Q?JjwIjKmqNzRChoq34hr/DYs20DgrrItf1AwiPLoeTC41vcFiFLBcLWP/zf?=
 =?iso-8859-1?Q?U4569w71y7si7uyAb9WhFKViM/J7kurSnUQzkMnwWm8aahQD2i0EWMDnAG?=
 =?iso-8859-1?Q?NIPwJtDfg58uX7sWMEucxzTjtgJtFMMokWST/b0sbHVBromyY/AQ8ZDCAm?=
 =?iso-8859-1?Q?0zqcJf3/bynaWsXbmNqXEExFlzIT3Or2+/pAQQknedT/Vlz/aHIvogiPtL?=
 =?iso-8859-1?Q?6aU/HnaovTXsOGi/eeDy83A57/hmo0hYZqmLhRzN+02xCNtfvz/Z5/4B4Z?=
 =?iso-8859-1?Q?bO0eev5o9PIfcE1SEoaAeeQPHMkGqtDRH5wtlbGveLYosDJwM/CpAi1f2Z?=
 =?iso-8859-1?Q?63glQIP3UX4e3otzpeoI0gigm+95VFyei3x46d4TJ6raFUeqE2bsFenu3t?=
 =?iso-8859-1?Q?/iOJlb6KZOsdApFW0oyPx0pp0ngNp5iUYrWQmV7Wc2IecQtjb9YxsFLpY2?=
 =?iso-8859-1?Q?TsoJf2+PKUYe3T9g9lwwVuxPzSLU608yMQUmWSveeP7uIpS/SL8wbOw7En?=
 =?iso-8859-1?Q?4TZESuKFGxptU4wE924906787dFIxllCwBVeQtw+kX66Uvd10x7Oc2D6nv?=
 =?iso-8859-1?Q?YBmNQSV8hZzga5AiWnOksxs/w+i+DHLWgpmfMzM//83xhZRLGxysnlWIWc?=
 =?iso-8859-1?Q?wOIYTGL2YAOFBFPtDNonf97N6ENMtlmb2nXIk56EFbaHOHPMdmL59EFzJO?=
 =?iso-8859-1?Q?Mi8tV1YfazHu38nbAmrZsiUSnDJ4VRr5eXGKy8NO5uPplSvDsHiUnf8lZy?=
 =?iso-8859-1?Q?ECnEjeh6LfhdBS3P5I25fTHNKSf6CAUtyFWDbRbnEqXdsC+6tmJ5IFhNUI?=
 =?iso-8859-1?Q?LjaYE//bvhXMUj/UT14OzwRHWksNuY44mTllzelfpl9Kh2c8SR3yknq2yN?=
 =?iso-8859-1?Q?9xnvL5dZTCi6dofAuhk2qiaZ2CThkT+0eZiXFyL8koW8cDZM2kI5Xv2oCC?=
 =?iso-8859-1?Q?2U5SI7GVd87fmbhUWeN47azpWe94mmqBrg/H6JmZqwc6e3ZEfX99IoRjRk?=
 =?iso-8859-1?Q?FEXB17xeYTUmO3WkT08ml6k8InjBJQYzE6F+IMGkmUMiWV/KBe/pNNtlb6?=
 =?iso-8859-1?Q?LsCDN2Uq/HKrgVk5Sccl9orFsFM8Lg/tnNnViUFkTtdDENuytr9yQCzMw1?=
 =?iso-8859-1?Q?0mve44epjv5Z8PEiC0z5webeCS08W1yy0oJUJs9sA+hkl+ft3Nu77fRbvm?=
 =?iso-8859-1?Q?TUHDubFD9sQ1exm6/2sKwMO6/zJ/q3LLZFwxrrM7XzQw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NUtVLVumcXdeC7vPJNNBmu0KJ/drPK3lXMhiHvf5EqgAcFvhOhMxsFg7rf?=
 =?iso-8859-1?Q?T0/udroiFFatX03CApLyLtELCaGHQHYRExybbdTUl/DQFCUN2JiVXWiskT?=
 =?iso-8859-1?Q?os28Wn2C8QZndAUq/d2YMzKhUJPTgTgGkIDKhw4GkHgjDI1Bhphse5+JBw?=
 =?iso-8859-1?Q?oKnWIEDmIxG3ZI6USL7IbUX4gyQkk6DKqyPwcnjX2B+8OvPAlLuiASxSTm?=
 =?iso-8859-1?Q?rhVaYag3CCHnPC9mW8pulsrXhQL6+Hjg3xRa8szG1L8DbI2ayc9OQeDG/5?=
 =?iso-8859-1?Q?ev5WHw+zJysVm33ipqy2b79RpU7qi9fMf1Oh7loIr44pkx9Nl8n8bCXxdx?=
 =?iso-8859-1?Q?6KQAtcyTZ9ong30+5Z4afKk/gCpjSyU/o+G4xDJU4usE1CL6JM1/UdCPew?=
 =?iso-8859-1?Q?c5DTxRZK9f52ZZaXiKhFOkwSItuIw3rarRVeK+gGORAMiNoyoeZyN4HfDp?=
 =?iso-8859-1?Q?bYanbufoIneoBb0LijY6Hb5ysH3v+B9Vf+Ptv9qjlgQ2RZIy5nnaQmG0ge?=
 =?iso-8859-1?Q?LRbUBjDqHedEyjkPtgxFACxKjU1EVcW17J0zrgatkl7oR5yj/y6vGf4cdj?=
 =?iso-8859-1?Q?114vsSes4ePMsyYSX+34pY/jJJCaIQhRx3HcR740hGH/vmVrdqqdRBTwxA?=
 =?iso-8859-1?Q?8i6JoVeqlAVml7WhCgymzUZMPktKOFzocwVRpztdyY5EUdrzy46TR1CYlJ?=
 =?iso-8859-1?Q?yrc56EugwJkI7L2PcMvLJ5KzksvkaoxPdX9ogUhwwZhkRYrwG49OjwOV/G?=
 =?iso-8859-1?Q?FyXsPFvceyjhKqxgUx3j0j8RswN9NfRZNiYXIyGSz3euSX07jy/aBljxdC?=
 =?iso-8859-1?Q?9K99M8ulqYfw43Q8vzXpEI6rtKvgSiY1Vz7erjIMtYmXsrTjGYWBGtleY7?=
 =?iso-8859-1?Q?DyucwYQ4nhZg7TEI3a4rZuoDRhncc95o1cUHyxO/Xh+dLO1O41/Oe5kJ8g?=
 =?iso-8859-1?Q?iufHrKxiyRjQ7BY4+/hCJYTxR/p8U/8c1xFIRbqN0bZGxR5ioNsw8px5VL?=
 =?iso-8859-1?Q?MsgQXH90F9AWyJtd5OsXjfO+oKWp6D1hev2g7YvksGhmtujDE760p9jzCD?=
 =?iso-8859-1?Q?uIHt6EIE9aGjwPMld7aCjGMpDBq7uUGTQCtwoledq4gU7EyBKtsyvPvn6z?=
 =?iso-8859-1?Q?rV4xSqQlzchSM0tRWX9o0M6dTXlbfdN1uKB6aV5tiPVpgHbj2uq8jG9NfW?=
 =?iso-8859-1?Q?OV+pN9YG6JgGHC7uZA2BEAFRR9WdXlMOT6hst8oWhXVXqfXsWr291d/HVo?=
 =?iso-8859-1?Q?CFQLA0Z1cRg1/3xoWr1R7dJqN/Av7Z3bVbr6R9JBMOnxmQBR7c5/l4qaFR?=
 =?iso-8859-1?Q?UHu0w/4gndxV4ZIOnJJvb7lVPpQLt1OiK/DWR7GI0VtXz3tJtpEjICjuLM?=
 =?iso-8859-1?Q?cYJAInTC8zu0J+mBdeHDQWcUCDLG1eM6h0x3/umJbsLl1E7+GIvldHRP8a?=
 =?iso-8859-1?Q?tbgWzfxE5ETY+47IVn0xtFHuMabX3ARKtDpxq7n7jq99i5z7bHHsLlmYD4?=
 =?iso-8859-1?Q?An198P6+SKEE3j3lbt2paXsDXZM6qFdF9OqGaL2HtjdpOgPz0Q3wtZNCH+?=
 =?iso-8859-1?Q?c6GctMhsEXcee+YgQjTlbsEq8XE+R/IcmNiYnH9P6hgVo1HSBYEH+Jtqv/?=
 =?iso-8859-1?Q?ciQNmp2E7t9EqXyNZ09a4XXtWEL3Yq0KvNVd/EJCYUkV8teE96R5k2Sw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02338573-3860-4483-03e8-08ddc3a11fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 13:11:34.8288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLHtF6MHrq/r+OAvo4BSfqJ5g8kDmbAFuamX15Ctmp7xZ/++4d6LJsdy8P63sRUrUGrr7jOxsYMWU9SYUCBt4Z4UBoLXT7YPSh9mhm5iVFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0238

Hi Michelle,=0A=
=0A=
> Fixes a checkpatch.pl warning regarding block comment formatting.=0A=
> =0A=
> The trailing '*/' on line 78 was moved to a separate line to conform to=
=0A=
> Linux kernel coding style guidelines.=0A=
> =0A=
> Signed-off-by: Michelle Jin <shjy180909@gmail.com>=0A=
> ---=0A=
> =A0.../media/atomisp/include/linux/atomisp_platform.h=A0=A0 | 12 ++++++++=
----=0A=
> =A01 file changed, 8 insertions(+), 4 deletions(-)=0A=
> =0A=
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform=
.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h=0A=
> index 6146555fe9cf..95e18c7ddc13 100644=0A=
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h=0A=
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h=0A=
> @@ -73,9 +73,11 @@ enum atomisp_input_format {=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* CSI2-MIPI specific format: YUV data.=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
=0A=
It would be better as:=0A=
/* CSI2-MIPI specific format: YUV data. */=0A=
=0A=
You could further improve readability by converting some =0A=
multi-line comments into single-line comments, where =0A=
appropriate.=0A=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,=A0 /* YUV420 8=
-bit (Chroma Shifted=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Pixel=
 Sampling) */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Pixel Sam=
pling)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
> =A0=A0=A0=A0=A0=A0=A0 ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-b=
it (Chroma Shifted=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Pixel=
 Sampling) */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Pixel Sam=
pling)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 /* CSI2-MIPI specific format: Generic long packet d=
ata=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 */=0A=
=0A=
same here=0A=
=0A=
> @@ -119,10 +121,12 @@ struct atomisp_input_stream_info {=0A=
> =A0=A0=A0=A0=A0=A0=A0 enum atomisp_input_stream_id stream;=0A=
> =A0=A0=A0=A0=A0=A0=A0 u8 enable;=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* Sensor driver fills ch_id with the id=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0 of the virtual channel. */=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * of the virtual channel.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
=0A=
Preferred line length is 80 columns, so I guess.=0A=
you can write it in a single line.=0A=
=0A=
Best Regards,=0A=
Tarang=

