Return-Path: <linux-media+bounces-28860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3044A735C9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 16:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D2E3BD0F9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 15:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643F619C552;
	Thu, 27 Mar 2025 15:38:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021078.outbound.protection.outlook.com [40.107.51.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C8198E91;
	Thu, 27 Mar 2025 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089911; cv=fail; b=VkepNWYh9pvredsHU/C+n6NJPb/l2xAAruWHHeZw7AbUiJLi33otGXO8tvtpsGLld4sy8AJADMcpQiQjwykWVYEKyh+SNxMKJZobCMhu8RGC37y/p2OgxrOUeBR5E8DItpCxq0BLKRPtZ/YL0J2lQURjjCca6Hr2JvN14/o6+pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089911; c=relaxed/simple;
	bh=0kKwcGSzGvwu+eEqnUMz4kVJrn5issQY0RwdOXUMMyo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cQd1d9mLHlm87l29OON/yYWtGjp8+Dfng5yI0NctYCyUHdM8DA5lUFf0PPEqvb7EPUSAZRqI7y8wcgWb9GmWnHLAgraYuORTBoOV4XeLnpsQOFVtBByYECLIOSLgoLQLGKfFuk4c8WHKvQ4SqKAvdtfn+gFC85+xZKOBjsX2Y2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJ+Pcv8cxLONJTrcM7JhHK1dazGcv9CIUGxBEmII3GyGcJC9KirUNm1PXdjLtki8Y7Ab6s5J0GFlE4Jr6q0g6L0RlFXF8HXueKDl3yH1JM/rpNFlEjic5ckQFU8OX4YNvvfE1HgpYKFRmnlY3PSIU/rTm2iWEUZxW5B+KetbrZ0AKKnZNS7fYVAM64KjdpiPjvSQXkUFqvt+EPNWLfrLH+DAURzYDVEnaD7/zgbrtQ1Cgwio/9SvGQcNuIVt3DdQA82BRZfi7RKoRdnxDceSxRgx3jMFr9Nhh4sdCEyAN74k39CIMoc3wCRbVc5i0CkvZt8G+eohzHPpwQnlhORCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNDOE/d3L9/yV9xjfIJc3qA6qRuFhFdTLABvOWH82oA=;
 b=UAo2rx0+4lfYM39sFivSr7nE/9LSDKIG2ExEY1f1YX8ip7XlY2IoQdkmuOlBPJvyj7xwXdn5GBZ7Qcaw+cdQF9xAhdBGug2xN7/aHSnRcPhmryOeDdvAB1MSAZrPk8SXtFGP8dy9VbnHSTGVq94+XglLET60g6SXttpEHPLD1Yq+Xvg6AnpzJqQfI+aoZVaoRGW/mFVmKMecAhs44xrS6ML8/JnfvKvIJfVmoDmLcvQCXZzGKPDYz8pugP/Ni4bk+EvGOBDYuE6tpjfKEKNVITQjUg9BJSS8ylDdyTrcUwKpr0AsR7T6F+5vuF12CMFjOkfs1qWk0NeSE2d396KKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2061.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:38:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 15:38:24 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain
	<umang.jain@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>, Julien Massot
	<julien.massot@collabora.com>, Luis Garcia <git@luigi311.com>, Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/6] media: i2c: imx334: Support 4 or 8 lane operation
 modes
Thread-Topic: [PATCH 4/6] media: i2c: imx334: Support 4 or 8 lane operation
 modes
Thread-Index: AQHbkYze21WXVq2lI0WizvQdhNA/mLOG3YiAgAAHtdWAAEG/gIAAD4LC
Date: Thu, 27 Mar 2025 15:38:24 +0000
Message-ID:
 <PN3P287MB18294408F7BFA1B93162FF9E8BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-5-tarang.raval@siliconsignals.io>
 <Z-Uj1VnLKQH09__5@kekkonen.localdomain>
 <PN3P287MB18292A67AC52F0D877D480AF8BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAPY8ntDAkA9Srmru3WZO1HibGDZM+PMiRyWcikh3BcLmezb+ag@mail.gmail.com>
In-Reply-To:
 <CAPY8ntDAkA9Srmru3WZO1HibGDZM+PMiRyWcikh3BcLmezb+ag@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB2061:EE_
x-ms-office365-filtering-correlation-id: 8a8626cf-80fb-4ca3-810d-08dd6d45693d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?oBqcBnADBmI5yjwyIMEp6YMpxM7aRECM7IUnqHNe/tZvY97NDPZsrfbL?=
 =?Windows-1252?Q?15rCtkLgM3l4Zvg3wYTWFG6fgB4zX+fiHvHsUf+KK+6UVvW1sVjq5GJZ?=
 =?Windows-1252?Q?Uwu2DUExt/+Qyf2NBvqv/erEd3Fb+H3emJzdkGZHmzkOaYOSJYNDdn6P?=
 =?Windows-1252?Q?av6wA8V6xApjwFL1hThjK+OgOmZSD1UX+H11LpX5aaEa90qX4xaqYXN5?=
 =?Windows-1252?Q?ZhijViiIK1QQ1gqw3lX2oCWs+MXO2QAXDm+WVGbCM0qZjqxYDfVhjQJx?=
 =?Windows-1252?Q?f8699upRdpAgORoTL+W6W1b6l8gJjn/xXEQO2Lrz/YRcU7Ss2DIc1wdT?=
 =?Windows-1252?Q?AGpEzqb7onkMGfUP+kdjesnzCBfO7d92gDuqb/uo1OQFvVXm+3O8oQJj?=
 =?Windows-1252?Q?GWVNewgvzj70ZY/5SHTO/FTa6yLIGiYXgu66aVcIFFyc0ruXNv2tlyHZ?=
 =?Windows-1252?Q?LdDcJ2bGymRyWJkapFnmnthiboFA1lSdWvECLa6UK5FNF/jgsFCY/uLx?=
 =?Windows-1252?Q?YLlTGWyJH50bHizIkWDZKFXX40Pf9PCuHV/yND542zCfg8IE4aef2c8B?=
 =?Windows-1252?Q?EbMWi1Je2Cdo8Vgq3yPBioaKvYZn7LFUIx3AXSQjG3DIN/O/c8diUVhO?=
 =?Windows-1252?Q?+QtGwn2AAgxZ7RQH0uQDWrt9QfNQv/JuIML4xLpukNmKI3th/BKyaEjZ?=
 =?Windows-1252?Q?e4AxHqwSFdrs81gkNDitsvmnzCCTV8O9H3L5/Gz0koarE572X0BwBebM?=
 =?Windows-1252?Q?Nrbx2fyWh7r6BloIumF1p+sL5TjvOJMKEWEtccuYvd0fGaeuX05yzTFe?=
 =?Windows-1252?Q?LH5vrK0aJyYGJzAMwTHDGdLJwzvsoJxuYKoksE+c6MpDOgox5y6mEIgs?=
 =?Windows-1252?Q?9xaZgQUjZe/0bB6WCOQBNi13bM1sI3zhS6BUY+QBDgmbF2v7HbdczhGh?=
 =?Windows-1252?Q?4doMWy15W0YdTjpz8Jwn9VR1NslDwITz5hr9QPVRxB0KuG+4JR7t0Vqt?=
 =?Windows-1252?Q?iMHm027hTAunnBPpPe1A/CEybtfc7GSRNpL8PCCD3q2rSjX9wxj39vJI?=
 =?Windows-1252?Q?dB+Igwftn5pN5eJokL7z2rZjj3hILZOMU0B6KFRjcNByTK5vDs4zJvtq?=
 =?Windows-1252?Q?s2ugjHEzU2BbK60E6P7hqylxyu3998CAGw/kfGa6Beqopp+gbMI970dJ?=
 =?Windows-1252?Q?x6TQH/3BJPD2LJlR3RnkFzFYTtNqzR8KvdwBmLznQoGhNcE2UIjB07A0?=
 =?Windows-1252?Q?dDNDwKsIZNkyIPoGyqXIrj0Av3OUEnpB19PF2hM362F2VpBTf0wVe3ra?=
 =?Windows-1252?Q?Mbn3BPtFYQgYAO9PMtjTL7lHMsITGy3eMQ0KuFhvlhZkfOBgElJNGf23?=
 =?Windows-1252?Q?zORr3eLFNCODIaZk45xUjUhrhNysvr9f4O1BnuB/hg39PPslryDtWQbG?=
 =?Windows-1252?Q?OUcL8EPYJAJOyMvafr6rrWgabEgwx6xQUgivv01yowhiTbg19WeRoZbG?=
 =?Windows-1252?Q?mLeUvOqm3yfKPvAnri5fjF27HFD0qA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?NyFpkncXJucGCo6sXAlXg0HhzRBgD7U/WSK0KuBQ9QuEwktN1Kud1ah3?=
 =?Windows-1252?Q?zBgSkWgTGdW5sLn05kAXgrNW5nn5V1t2dgbovvKxmDY1Zx27agSfuEUr?=
 =?Windows-1252?Q?QU0tf9tSVJqk/muau8Gn+qFC4arM26hPFS4KhS6qdi1BdYO53pxtio4p?=
 =?Windows-1252?Q?3abIbn24g3hH4suowaeZJyuOUmuoG5XFIWmQg+DWCsRwKQ1NPurbnaS4?=
 =?Windows-1252?Q?96cE/WFxnM66uIXtcaRTZUdey7Fi2AESJikpTQTFylHaH+nxvFer78B5?=
 =?Windows-1252?Q?x0M+JCTbamDwSQWu9l5DAaHJGOCEb9oNgLD6/XoxCXpvCw6hjYD6+uPk?=
 =?Windows-1252?Q?+O/4G9V5dXSwOu1R6M49JQDQK62eyeg6BGPpA/X/O58QiavelOuyVWcp?=
 =?Windows-1252?Q?VppgpDfAnDoUPnHHHGx2CE5VxFg/KZrCW0i9pzIf1AB27Ylb3/dKLYr5?=
 =?Windows-1252?Q?UNs8Jsn6J0QV3BL17mgOptAnSxnQ+QSEYIdt31MWz8e7WCx0FnoccJD2?=
 =?Windows-1252?Q?LpvuBvhgM6h2sq1FXP6xq7RFsXp+OwOkW11pxGj9jb78K7srmhIpCiO8?=
 =?Windows-1252?Q?31AkpIEMioKPZN8QlxYZ9kBM+YIH2e+ddW3B41/BZUauzWQabuxGHjJV?=
 =?Windows-1252?Q?bkVkgjXptavBiZMsvP4UFM14h+wKqgh1NrdDvM1nCrAwjdnGO1PEIcCC?=
 =?Windows-1252?Q?mjPG5gtBN1H7VMX3QbRQkJa3vo//ZiGtmqUgpsEwX7HB8nfwBuLShYsi?=
 =?Windows-1252?Q?3RPw6K47AiceCmUi4HSPRCtOdynQksNdb4Prtj/XPUDjkOEh6cJ14xUo?=
 =?Windows-1252?Q?XaPgeWPusLDoj7K6Pukrz4+R+/8LKh5GKk7flgOjnJsFdClhl8VhuG1V?=
 =?Windows-1252?Q?VFz0lc9nf18WLFpJI+WjrctzZrI7LO2aWL+q4w8ddVnpyvNHT1xR94Ti?=
 =?Windows-1252?Q?tHjrogNBAaW9G2W3Wc3ZCgbgD0VrAAxfH0uyOoP9A1oBHkUjfo06hUFY?=
 =?Windows-1252?Q?v5u+ECb/FZsE7+dMan5Ufbb5YVwA7e7pA+z/pC6MvCA99jlkIGYrNrEe?=
 =?Windows-1252?Q?rGZ5B8JfmgRCFnQ/T2joJGMkDtCwnJ3l60cHcsBX14fzXw/YNUXXlNVg?=
 =?Windows-1252?Q?fOkz4WZqO30SJXc8nw/qWJTLCR+Y2e0KxDd4r6XqLAtaR5ShFPNviErx?=
 =?Windows-1252?Q?4mN6JRL+/pXA+vCBEECinXMTRmsQYKje3MOG3h08TnazlXfoWKqp5/LX?=
 =?Windows-1252?Q?KNUaPBd0b/gfVaQm1S4u62/M2vC1O6Co+0dCoX8GlWz0Y1T96783lg6r?=
 =?Windows-1252?Q?f3Gx/GNVNCMqIvhQ3KaoXUdnl5083a3NRefBkOG+j2agA+FKzlez3RIT?=
 =?Windows-1252?Q?OZVWMgOO+XE6zciUBj5ECxwXkg4vTTrzXnp0DtYRl9tMQQoTc6bfp7q3?=
 =?Windows-1252?Q?LufeiVqnXNbdcpkjy/DgHQPe58JCqnTNcmaC2glV4UnIh6RVGE/0lQ4m?=
 =?Windows-1252?Q?lM5SZkwJe5C376XBFMh7kj8w2Z1kCtwAfXokqmNQgZZC4stvnpyUo9ds?=
 =?Windows-1252?Q?jE2a6kJxq2DFSI4iqeCB8DuyPeUv5cN064GvQB76QB+48J7g5FzqS9kR?=
 =?Windows-1252?Q?y8qs4aR3wD2DKv+ne2LH24VwwntScpQNBSPCgU5ucOJUPjJtWANnX1Q3?=
 =?Windows-1252?Q?9HSq26f+3uAwOWVKg0n828WzJj+rc2WlpY46u6FVButKk7Hk73AXaQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8626cf-80fb-4ca3-810d-08dd6d45693d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 15:38:24.2094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clzwGkQVVGXvkaxYJ693j5+2kwL1rTmOjQozggv6MOFkza4IBDl1+NCk571PsYGrZDhaj/l5XQtf3fB2irN6bzEMSFgmEVWz5reEWMpvATE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2061

Hi Dave,=0A=
=0A=
Thank you for your detailed feedback.=0A=
=0A=
> On Thu, 27 Mar 2025 at 10:55, Tarang Raval=0A=
> <tarang.raval@siliconsignals.io> wrote:=0A=
> >=0A=
> > Hi Sakari,=0A=
> >=0A=
> > Thanks for the review.=0A=
> >=0A=
> > > On Mon, Mar 10, 2025 at 12:47:46PM +0530, Tarang Raval wrote:=0A=
> > > > imx334 can support both 4 and 8 lane configurations.=0A=
> > > > Extend the driver to configure the lane mode accordingly.=0A=
> > > >=0A=
> > > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > > > ---=0A=
> > > >  drivers/media/i2c/imx334.c | 22 +++++++++++++++++++---=0A=
> > > >  1 file changed, 19 insertions(+), 3 deletions(-)=0A=
> > > >=0A=
> > > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.=
c=0A=
> > > > index 24ccfd1d0986..23bfc64969cc 100644=0A=
> > > > --- a/drivers/media/i2c/imx334.c=0A=
> > > > +++ b/drivers/media/i2c/imx334.c=0A=
> > > > @@ -47,6 +47,8 @@=0A=
> > > >  #define IMX334_EXPOSURE_DEFAULT      0x0648=0A=
> > > >=0A=
> > > >  #define IMX334_REG_LANEMODE            CCI_REG8(0x3a01)=0A=
> > > > +#define IMX334_CSI_4_LANE_MODE         3=0A=
> > > > +#define IMX334_CSI_8_LANE_MODE         7=0A=
> > > >=0A=
> > > >  /* Window cropping Settings */=0A=
> > > >  #define IMX334_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)=0A=
> > > > @@ -107,7 +109,6 @@=0A=
> > > >  /* CSI2 HW configuration */=0A=
> > > >  #define IMX334_LINK_FREQ_891M        891000000=0A=
> > > >  #define IMX334_LINK_FREQ_445M        445500000=0A=
> > > > -#define IMX334_NUM_DATA_LANES        4=0A=
> > > >=0A=
> > > >  #define IMX334_REG_MIN               0x00=0A=
> > > >  #define IMX334_REG_MAX               0xfffff=0A=
> > > > @@ -181,6 +182,7 @@ struct imx334_mode {=0A=
> > > >   * @exp_ctrl: Pointer to exposure control=0A=
> > > >   * @again_ctrl: Pointer to analog gain control=0A=
> > > >   * @vblank: Vertical blanking in lines=0A=
> > > > + * @lane_mode: Mode for number of connected data lanes=0A=
> > > >   * @cur_mode: Pointer to current selected sensor mode=0A=
> > > >   * @mutex: Mutex for serializing sensor controls=0A=
> > > >   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl=0A=
> > > > @@ -204,6 +206,7 @@ struct imx334 {=0A=
> > > >               struct v4l2_ctrl *again_ctrl;=0A=
> > > >       };=0A=
> > > >       u32 vblank;=0A=
> > > > +     u32 lane_mode;=0A=
> > > >       const struct imx334_mode *cur_mode;=0A=
> > > >       struct mutex mutex;=0A=
> > > >       unsigned long link_freq_bitmap;=0A=
> > > > @@ -240,7 +243,6 @@ static const struct cci_reg_sequence common_mod=
e_regs[] =3D {=0A=
> > > >       { IMX334_REG_HADD_VADD, 0x00},=0A=
> > > >       { IMX334_REG_VALID_EXPAND, 0x03},=0A=
> > > >       { IMX334_REG_TCYCLE, 0x00},=0A=
> > > > -     { IMX334_REG_LANEMODE, 0x03},=0A=
> > >=0A=
> > > Not a fault of this patch but also the closing brace should have a sp=
ace=0A=
> > > before it. Could you address it in the earlier patches?=0A=
> >=0A=
> > Okay, I will correct it.=0A=
> >=0A=
> > > >       { IMX334_REG_TCLKPOST, 0x007f},=0A=
> > > >       { IMX334_REG_TCLKPREPARE, 0x0037},=0A=
> > > >       { IMX334_REG_TCLKTRAIL, 0x0037},=0A=
> > > > @@ -876,6 +878,13 @@ static int imx334_start_streaming(struct imx33=
4 *imx334)=0A=
> > > >               return ret;=0A=
> > > >       }=0A=
> > > >=0A=
> > > > +     ret =3D cci_write(imx334->cci, IMX334_REG_LANEMODE,=0A=
> > > > +                     imx334->lane_mode, NULL);=0A=
> > > > +     if (ret) {=0A=
> > > > +             dev_err(imx334->dev, "failed to configure lanes\n");=
=0A=
> > > > +             return ret;=0A=
> > > > +     }=0A=
> > > > +=0A=
> > > >       ret =3D imx334_set_framefmt(imx334);=0A=
> > > >       if (ret) {=0A=
> > > >               dev_err(imx334->dev, "%s failed to set frame format: =
%d\n",=0A=
> > > > @@ -1022,7 +1031,14 @@ static int imx334_parse_hw_config(struct imx=
334 *imx334)=0A=
> > > >       if (ret)=0A=
> > > >               return ret;=0A=
> > > >=0A=
> > > > -     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX334_NUM_DATA=
_LANES) {=0A=
> > > > +     switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {=0A=
> > > > +     case 4:=0A=
> > > > +             imx334->lane_mode =3D IMX334_CSI_4_LANE_MODE;=0A=
> > > > +             break;=0A=
> > > > +     case 8:=0A=
> > > > +             imx334->lane_mode =3D IMX334_CSI_8_LANE_MODE;=0A=
> > >=0A=
> > > Doesn't this affect the PLL configuration? Presumably higher frame ra=
tes=0A=
> > > could be achieved at least.=0A=
> >=0A=
> > Sorry, my commit message is misleading. The intention of this patch is =
to=0A=
> > configure the lane mode dynamically from the streaming function instead=
=0A=
> > of using a hardcoded value.=0A=
> >=0A=
> > You are correct that supporting an 8-lane mode requires changes to the =
PLL=0A=
> > configuration. This patch does not address that aspect yet.=0A=
> =0A=
> Is it actually required, or just a nicety?=0A=
> The datasheet [1] says:=0A=
> "Maximum frame rate in All-pixel scan mode 3840(H)=D72160(V) AD12bit: 60=
=0A=
> frame / s"=0A=
> The current driver configuration for the 3840x2160 mode is a pixel=0A=
> clock 594MHz with total timings of (3840+560) x (2160+90), which gives=0A=
> a framerate of 60fps. So you already have the maximum capabilities of=0A=
> the sensor exposed.=0A=
> =0A=
> Adding the 8 lane mode gives you the option to run at half the link=0A=
> frequency of the 4 lane, but Sony Starvis sensors have a FIFO between=0A=
> pixel array and MIPI block. All the other Starvis sensors I've=0A=
> encountered are quite happy at any of the link frequencies as long as=0A=
> the horizontal blanking makes the line period sufficient to send each=0A=
> line.=0A=
> =0A=
> The datasheet does say "The bit rate maximum value are 1782 Mbps /=0A=
> Lane in 4 Lane mode and 1188 Mbps / Lane in 8 Lane mode. " (page 78=0A=
> "CSI-2 output"), but then also "The maximum bit rate of each Lane are=0A=
> 1782 Mbps / Lane." (page 81 "MIPI transmitter"). Surely all lanes can=0A=
> either do 1782Mbps, or they can't. They won't have downrated just=0A=
> lanes 5-8.=0A=
> Presumably it works at 1782Mbps/lane in 8 lane mode or you wouldn't=0A=
> have submitted the patch,=0A=
=0A=
My patch aimed to make lane mode dynamic (4 or 8 lanes) based on hardware. =
=0A=
not to add 8-lane support my commit message was off, and I haven=92t tested=
 =0A=
8 lanes. =0A=
=0A=
Thanks for pointing out the PLL and datasheet inconsistencies. I=92ll fix t=
he message =0A=
and leave 8-lane support for a well-tested implementation in the future.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
 =0A=
> We've been here before with the imx290 and imx415 drivers and what can=0A=
> be supported with each combination of lanes and link frequency.=0A=
> =0A=
> Cheers=0A=
>   Dave=0A=
> =0A=
> [1] https://en.sunnywale.com/uploadfile/2022/1205/IMX334LQR-C%20full%20da=
tasheet_Awin.pdf=0A=
> =0A=
> > Best Regards,=0A=
> > Tarang=0A=
> > > > +             break;=0A=
> > > > +     default:=0A=
> > > >               dev_err(imx334->dev,=0A=
> > > >                       "number of CSI2 data lanes %d is not supporte=
d\n",=0A=
> > > >                       bus_cfg.bus.mipi_csi2.num_data_lanes);=0A=
> > >=0A=
> > > --=0A=
> > > Regards,=0A=
> > >=0A=
> > > Sakari Ailus=0A=

