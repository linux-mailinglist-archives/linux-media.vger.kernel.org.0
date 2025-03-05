Return-Path: <linux-media+bounces-27576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B32A4FB67
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6619516B9A6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0AD205E21;
	Wed,  5 Mar 2025 10:12:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021094.outbound.protection.outlook.com [40.107.57.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D822204C35;
	Wed,  5 Mar 2025 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169542; cv=fail; b=WHCrnOTYnUDVnJ3Zq/sEyvb5Ye5XcGPodHgZNqhKg38dZKrzJUIZkPpUQsS/3X7AK0Kzgs7Xa4P6+B3mtGRTJxPCEc/6HvMJX1udrbxsRa+HLqJWrDN33cOjBuk4TbKa7kMHIrO9/+ufLtsgWNS+QxMEafiFNFRnfCGq8wCP/aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169542; c=relaxed/simple;
	bh=y2EjSgpAjZZN+i3wyR38x3HDPtIu/YwLZm4SE0cdnRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cry98H/fBJWq9aQu3FXY6UaMN8JosTTfqvrI+C9k45zPWY1n2ooL94CdC+raL18mZA4E1MWg3q/qwIX6aVmnRt/bu8cn7QufH9yGdvWboWzx7H2UNx40Ljydn8wfYRHWTzYlUXwdD/0SRyRHflxApecajQVGlpF9epRpZxUrOgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nczVCSGBDesyJAVOljWbiQZ+opGUEEEFFcwKh8xGQPUM0d5ncCdaoGFsSvRdXWZRpHhzkhlhyC0DkQDcUB1q8+C/TIhdKLzgqGhxkNIB1seZjR6h21hfg1sUD7FLAF9PmS3PiFkCQqcwmBI/jB0+qSj2sAbIz1L5GXpyF7ni7CHh5P+aQk9clD8Wezpk7e9S6pKq3amwlqa0i40FOKS1Z4o0TqiwNkyHxDoSjp8khr7/d+SY+I//2/mFoeQ/pkdTlVTV3ra4HOwtX3djVH/pexIolERUtGRMorkRGBdf8HJRPArpnDeBvkFttbAi1MpJhAW3xzavw1qC6cAi3aBIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2EjSgpAjZZN+i3wyR38x3HDPtIu/YwLZm4SE0cdnRA=;
 b=VGpOdVwHny6DKOwWx/yc85spUOmW53Wxo8ezrlAF/uwIt7V1P7C8wtK7+64gtvtFuJAgWSWsuEFTGT0Iy1w7NyJWp2WdXsseo7m7HHkURbUwmIXhTfdjXziANdg8vi40qodlp2rMHjAaeZA6LRXFmo0U457ChfhOxQJXGFCl/rxK0HCmAYI1cPTO0ka3+6egpIgbYahXZIVvLLP/HaOFc5BANW1eeHy31N3fcer36bOd+vTWLbGH4O7pakaCUuhJ8vX7/0oyxeYAk0CwUgXmRDHoaVAsw7W2lDqlje2nVVh8i1dkaF/JlCYIsZ8h1H6uGrHaAK9k3J/NV5ukD+DZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:12:13 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:12:13 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] media: i2c: imx219: switch to
 {enable,disable}_streams
Thread-Topic: [PATCH v2 1/2] media: i2c: imx219: switch to
 {enable,disable}_streams
Thread-Index: AQHbjZXLuHB9HV4wWE+uBP0JqYn+p7NkRdyAgAAGizM=
Date: Wed, 5 Mar 2025 10:12:13 +0000
Message-ID:
 <PN3P287MB182955C5B846B0DC522E10BC8BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250305061309.17911-1-tarang.raval@siliconsignals.io>
 <20250305061309.17911-2-tarang.raval@siliconsignals.io>
 <174116672182.2914008.912215873023431841@ping.linuxembedded.co.uk>
In-Reply-To:
 <174116672182.2914008.912215873023431841@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0365:EE_
x-ms-office365-filtering-correlation-id: d47a1f42-1597-4804-4b57-08dd5bce3341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1xRVbFu/LEn5W4SpHCAGmdGhd4//eildQGtzo1F/I0HWWGXoNDpwnTrR1/?=
 =?iso-8859-1?Q?eRjp2sC4UUOJ3UzTMh1aPn+FSRzyFybIrkp6KFWGU0m7DvVN1zPyZhN+7a?=
 =?iso-8859-1?Q?81hgrCVYIocroCyqhFXbJmIGSFJ88RoDBqeeNSeQngCfSLKW2zuAW2pvaj?=
 =?iso-8859-1?Q?P2ZSXZa+VXW6ZvgHu0mnGxCb6i+dnP3WPspJ26pezev55oL4AEePB5pD8Q?=
 =?iso-8859-1?Q?oIG3qT0oh2zrzoYwm3ZSSn55g6UTT6MUkhVmmkCVI2K6D5VI74tCdA7Rhq?=
 =?iso-8859-1?Q?djdAzEFWxOH67COoKOGGSmuxnv46EcajYXckQ2DHlQjcsftMpmNRVyKFX6?=
 =?iso-8859-1?Q?4+GmCw2kdbalDU4Vw+uPB7OoTdYWbL2C44sJBl2HvlhHOsc5FvlZl4kdQH?=
 =?iso-8859-1?Q?l60dHi5QrCyhdukdqwwkAknDlu3yL0sH9S68nhRfoVe21/wSRfifihtyCG?=
 =?iso-8859-1?Q?aDzb3INRg4FgUQC3rwL16/jdkJco9ppL9H5cU8azmiC3g/lKHcxvK2s38v?=
 =?iso-8859-1?Q?az3IWAb72CbyU80CFi9sTqCGOmHCFBxiariAvrB7yVvd99pzApUrjSBntm?=
 =?iso-8859-1?Q?L7YO/gXTVcVt0qRBggGKl99qnbzfkPzjfZxaJrrSR4eG9yfqdL2w6K5QlZ?=
 =?iso-8859-1?Q?7aJ3Q2ZOTB0YLpLeNSrjDmcABdlOoyMhgB/IGmCAO48DG5xFqdmyvcr8wG?=
 =?iso-8859-1?Q?50FTdVceeHumSmXD9QuJFPOf0/XjXrhwSYj2S3VtteHrfeuwgP8WMcJuH9?=
 =?iso-8859-1?Q?9kLIQF8z6El5XXdIT96D2/oQ0K5mnUThQPnxbfUW9okQ+gFEc8Pkk+of7l?=
 =?iso-8859-1?Q?jRtC/nPC14ZId5qzdCJ3bd9xz6gnfEMgHM05+t/Il/ivmayGe9M8pNwhf1?=
 =?iso-8859-1?Q?xQWnuvJBq9mw5+niqML4dY3J8EN9H+HfQrwf65O4i8gJGbF33wOnP+PbFa?=
 =?iso-8859-1?Q?qJo/S1WcM7n+VlX4EHv1w36j/MvWA40VssEhoUFBQ3huimEUgUW4Cjl6Aa?=
 =?iso-8859-1?Q?UzUsA+/g3Um62BOXdMAf07K5OGVOz7qqE2Wuf8yP+/7je7ZrhssNPNFWh2?=
 =?iso-8859-1?Q?vRBCPX64nQlhRVWfqez/+oURrB0r26IBSY7n5dCJ/rq9eT0HYjC1Do7EBt?=
 =?iso-8859-1?Q?8HB7yo/30OvosPzeOJc1rmK1Cmt4eAfmfNbQ+IdnFS0O4dVtdczNSGrSNQ?=
 =?iso-8859-1?Q?PynNgIjgMNEPJcoqjenW+mYQbpwjUeXcdLv2wNbo4N5gSKCmafwKmBFqHS?=
 =?iso-8859-1?Q?F5G2QcUpsmYWPQSVCouZBYf2D84ViCx1EiDNmSkKdY3DrCikVV62SVJJZR?=
 =?iso-8859-1?Q?TxpY64HX6WWIAPGaDJI6k4ks0UuNgY7XDVqPwZg+e1yRimxKsZCfvd51if?=
 =?iso-8859-1?Q?8WU91L8440zOwmoBUNi6q33MWgS2/yVfrp/UrEMPOSnrrtEl3173N8hQfL?=
 =?iso-8859-1?Q?52KsQBWoqrlL/CINOJzHXoB4HL2l+D2TTB08tWMHoAb+lbm232/rQ951Zt?=
 =?iso-8859-1?Q?A+q8SbuLWQLFXbc4uscI4p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rqandmrGBP0IiretGpDdgpmOviHsbJlxJ4xYYsmKtC2mJ2amrV7kJZld2b?=
 =?iso-8859-1?Q?PFMzVGo4T+NjnYMQOEY/VOxtDsG3B4gQ35Qu6RZ7BGw3aY8rMc0DmeYmN3?=
 =?iso-8859-1?Q?zAuZrHlYA6//Gf5iyUW/+NcxPMDpgNquYkRjzyXdXlTinFu9np4lqNjZWX?=
 =?iso-8859-1?Q?3V32zLjaURTJj8nKMgQ12hRliMkhV5a8MxagZBQ/9dBqltlxQP7RwUZuqS?=
 =?iso-8859-1?Q?isWI3OGwtUOvLyim5xcp+8L4gCskrAO+ba6sc33TCXxhOOHBHO+f4xTW8A?=
 =?iso-8859-1?Q?6/6oaUliijSElxjB1MPM3fuWNJxFutWTc9jQ6Q4jGH7ubOjTnSpmbAUag9?=
 =?iso-8859-1?Q?c7u9hD2kXCZY7DLJc4Old9N9BaTwRBsrckT02NInmEPf/4JGpKjWlFMuGc?=
 =?iso-8859-1?Q?rUYW5el/ZAu0T95AYQ0bN5lCWa5Nb2/VprqW04cG6e21D0y4DjlWuRe24P?=
 =?iso-8859-1?Q?ZWt+Ayu09JakdFlM4O91PAAxIIvGsChh3iT/KVTh0mV523xqQZAoyJ6xb9?=
 =?iso-8859-1?Q?CRL5qoJL2jn2qOdjC0gpPy4gAp6l7I7YdXuuFkJlCOghwJd7Qjo1UmA3gR?=
 =?iso-8859-1?Q?NqYrdFH+/9WUyNkcWNM0tBc/+G5qm7F9rcFGYRmj55XGTzU/JpcpV1AKYc?=
 =?iso-8859-1?Q?qsSFHkmQkMoYwUnLpbsuKgDuqM87ohRy3ZbJ7u9wwaigKBzrRQMMciM98o?=
 =?iso-8859-1?Q?73ux+n/y2nQ+L/+XwrP0JPqV+ZLeSKlwsPCzQ+UV6SQznusWMEHB74NP6D?=
 =?iso-8859-1?Q?iXyrWxY2S2kSo2phGQOS5+1bqnhkBR6n8aBngkRlcXzExHE7BjcCHidFyo?=
 =?iso-8859-1?Q?qG1x4lmj1os1AopA2ZVJXX/GLp8ZVY8oqLnIglfvYX1Bb3HvByPmEF6GxJ?=
 =?iso-8859-1?Q?VXiIUOnxFwmxcnTT7E5Tb07+daOZgJChS2e9pKvz+jitIG6DmKZn4rsuvC?=
 =?iso-8859-1?Q?/8bTcnCCnzFInPa0QTHZjeIX2UYT78OvQfCodeH/gPAML46cQK7tQ8WPn1?=
 =?iso-8859-1?Q?BAboSwRfGVnYaczDHz/OjTMPTaTnSb8tckc6AKyNq8aHEl5hwK6syXeBFG?=
 =?iso-8859-1?Q?vLr8mJE4y4FUOg4aAIA9iSYwQMSU91h0P90lWNsPst49CXC1k9JLQnFx7K?=
 =?iso-8859-1?Q?X5nH8aBBY0fnnSsNA0BXErEmfN7LdmjrOnkcgswZ8nIT7K98NUrzokqCcl?=
 =?iso-8859-1?Q?yc++YLt97oyvmWSCzsdjGmbtbJ5a49PUwWChpXmT0XK6m3Lov+lnBFKmjU?=
 =?iso-8859-1?Q?3Uwtziigbb21nUMkNP7FsXYry0axL3jKpMUfVp9DRhi49rV4CUWJewNp6f?=
 =?iso-8859-1?Q?rVwptIlgVgrI6UN/hUCOyTpiKS1WC2GqMmmbxpvOP4e/bjFtPn8EQYGgHm?=
 =?iso-8859-1?Q?7UtRKINaKPR1OOnmRdGmjJKyTYSeQsKSbKKNYyxjDFT6Ykf4HVcY2n2mhZ?=
 =?iso-8859-1?Q?IbC0hXa5csjczxlFYaBpAGzQ9PZ/kkp9Fkfjln4Uc00On1sVpdENvlyb6/?=
 =?iso-8859-1?Q?uVxn8uChxvUb1twBp7AGVDl5Ja2YOm0B6AvL/vX47J3bySTh0cT/icyXMR?=
 =?iso-8859-1?Q?pkgpBbzZu2TVDjX/b+Fl0v2zhQGLS8LZveC0FO1I0uRzel/O77QykVQrDx?=
 =?iso-8859-1?Q?GqamqbhM4wzXD/Ijpkb41jNko4Pyt4gI+ugyjV49ZG///yXUKkKZZIpQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d47a1f42-1597-4804-4b57-08dd5bce3341
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 10:12:13.7580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gaBedgY8iV+PlA4B045aPZtPVlkt7rv6ajS1MqIKt1WYHM2KiAObGh+jfPqAPRbPuWzu/vzW4OXo3Lc6qgGIyURZu3MrodOe9/Mhdt1HoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0365

Hi Kieran,=0A=
=0A=
> Quoting Tarang Raval (2025-03-05 06:13:08)=0A=
> > Switch from s_stream to enable_streams and disable_streams callbacks.=
=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >=A0 drivers/media/i2c/imx219.c | 43 +++++++++++++++---------------------=
--=0A=
> >=A0 1 file changed, 17 insertions(+), 26 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c=0A=
> > index f662c9d75511..75d3123d47b4 100644=0A=
> > --- a/drivers/media/i2c/imx219.c=0A=
> > +++ b/drivers/media/i2c/imx219.c=0A=
> > @@ -723,12 +723,17 @@ static int imx219_configure_lanes(struct imx219 *=
imx219)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(imx219_4lane_regs), NULL);=0A=
> >=A0 };=0A=
> >=0A=
> > -static int imx219_start_streaming(struct imx219 *imx219,=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state)=0A=
> > +static int imx219_enable_streams(struct v4l2_subdev *sd,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> >=A0 {=0A=
> > +=A0=A0=A0=A0=A0=A0 struct imx219 *imx219 =3D to_imx219(sd);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevda=
ta(&imx219->sd);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >=0A=
> > +=A0=A0=A0=A0=A0=A0 if (pad !=3D 0)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > +=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_resume_and_get(&client->dev)=
;=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > @@ -767,10 +772,6 @@ static int imx219_start_streaming(struct imx219 *i=
mx219,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> >=0A=
> > -=A0=A0=A0=A0=A0=A0 /* vflip and hflip cannot change during streaming *=
/=0A=
> > -=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(imx219->vflip, true);=0A=
> > -=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(imx219->hflip, true);=0A=
> > -=0A=
>=0A=
> Why do you drop these lines? It's not mentioned in the commit message.=0A=
> Are these handled somewhere else now ?=0A=
=0A=
Thank you for catching that. I had made this patch earlier and sent it with=
out=0A=
re-verifying the changes. =0A=
=0A=
I should have reviewed it thoroughly before submitting.=0A=
=0A=
I will correct this in the next version.=0A=
=0A=
Apologies for the inconvenience.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> --=0A=
> Kieran=0A=
> =0A=
>=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> >=0A=
> >=A0 err_rpm_put:=0A=
> > @@ -778,37 +779,25 @@ static int imx219_start_streaming(struct imx219 *=
imx219,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >=A0 }=0A=
> >=0A=
> > -static void imx219_stop_streaming(struct imx219 *imx219)=0A=
> > +static int imx219_disable_streams(struct v4l2_subdev *sd,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> >=A0 {=0A=
> > +=A0=A0=A0=A0=A0=A0 struct imx219 *imx219 =3D to_imx219(sd);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevda=
ta(&imx219->sd);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
> >=0A=
> > +=A0=A0=A0=A0=A0=A0 if (pad !=3D 0)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > +=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 /* set stream off register */=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(imx219->regmap, IMX219_REG_MO=
DE_SELECT,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 IMX219_MODE_STANDBY, NULL);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "=
%s failed to set stream\n", __func__);=0A=
> >=0A=
> > -=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(imx219->vflip, false);=0A=
> > -=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(imx219->hflip, false);=0A=
> > -=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev);=0A=
> > -}=0A=
> > -=0A=
> > -static int imx219_set_stream(struct v4l2_subdev *sd, int enable)=0A=
> > -{=0A=
> > -=A0=A0=A0=A0=A0=A0 struct imx219 *imx219 =3D to_imx219(sd);=0A=
> > -=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> > -=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> > -=0A=
> > -=A0=A0=A0=A0=A0=A0 state =3D v4l2_subdev_lock_and_get_active_state(sd)=
;=0A=
> > -=0A=
> > -=A0=A0=A0=A0=A0=A0 if (enable)=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D imx219_start_stream=
ing(imx219, state);=0A=
> > -=A0=A0=A0=A0=A0=A0 else=0A=
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 imx219_stop_streaming(imx21=
9);=0A=
> >=0A=
> > -=A0=A0=A0=A0=A0=A0 v4l2_subdev_unlock_state(state);=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> >=A0 }=0A=
> >=0A=
> > @@ -992,7 +981,7 @@ static int imx219_init_state(struct v4l2_subdev *sd=
,=0A=
> >=A0 }=0A=
> >=0A=
> >=A0 static const struct v4l2_subdev_video_ops imx219_video_ops =3D {=0A=
> > -=A0=A0=A0=A0=A0=A0 .s_stream =3D imx219_set_stream,=0A=
> > +=A0=A0=A0=A0=A0=A0 .s_stream =3D v4l2_subdev_s_stream_helper,=0A=
> >=A0 };=0A=
> >=0A=
> >=A0 static const struct v4l2_subdev_pad_ops imx219_pad_ops =3D {=0A=
> > @@ -1001,6 +990,8 @@ static const struct v4l2_subdev_pad_ops imx219_pad=
_ops =3D {=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 .set_fmt =3D imx219_set_pad_format,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 .get_selection =3D imx219_get_selection,=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 .enum_frame_size =3D imx219_enum_frame_size,=0A=
> > +=A0=A0=A0=A0=A0=A0 .enable_streams =3D imx219_enable_streams,=0A=
> > +=A0=A0=A0=A0=A0=A0 .disable_streams =3D imx219_disable_streams,=0A=
> >=A0 };=0A=
> >=0A=
> >=A0 static const struct v4l2_subdev_ops imx219_subdev_ops =3D {=0A=
> > --=0A=
> > 2.34.1=0A=
> >=

