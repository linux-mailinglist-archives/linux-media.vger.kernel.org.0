Return-Path: <linux-media+bounces-5172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5DE85546F
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 21:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 428CB28C729
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 20:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B58913EFE0;
	Wed, 14 Feb 2024 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Uf52aUzW"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2052.outbound.protection.outlook.com [40.107.114.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51ED54649;
	Wed, 14 Feb 2024 20:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707944261; cv=fail; b=QN4T/95067q3CMJOB1NSt3ygVdMg9Q0tpJR2I9wSAVXWlXjPQ/uHZO5akc/6uArruXOLx4YQqI6SDagkg0bclOsfUBxUlJGNy+rL/YrqTKY7cz0wEpWcKXLqCDf+g01mQBwxxYMmDjHf1fSaJCBUZb/Z/11+Ainfj9VRVTiNfmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707944261; c=relaxed/simple;
	bh=fXCxBcfUnhIc45XkvGDCwIwAumCRI5H1Yp6VirZuH5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=odX4xrvapRedouUHUe12NP0Hzfg0huAlgpT/G+wWE6U+4dyKF1s36wjC4PtzvuGBOoj2s798jDKm67wUKv9BYhz85csrrkpyvch/C94Rgmpv2A573v5GPZfoJZhNrfP5EaobtbXvx1n9agkl5Mq283sVMhWYeBsUg1EUl5lJMCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Uf52aUzW; arc=fail smtp.client-ip=40.107.114.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMBLaI1riup+Pluc9YzpUFgjrb+srIyeLryshsIOtoumgxt2ZQhFQWbV/4QzKERyQyjJoc4kTyUFMgatuUPKk6Q/6cojuElBdVLd/vK+OX3UZUqlLA0dKpMtN610PYQcsbWNHXrWRbkulV7eTroWinQIHb+o9zx/0O0xaC29kshS6NC/eSZaxT9ZfaFjxzvmIbL3U1+He1NwufA5021JMDDBIAyUv04fiiworIpoYkbN5xQYuYPEDjlSFkD1pZcOjFT96Gi5zOSTgiRau+nsq7nhcEkeAvNeMAR7mriUaMYQ23IXCiOByLe6A0/6LVNu+kMa1qyDC3iPbTdIMCRrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYpR1FVinaVlOT1kWpGb4RoW4G5v2kxjU3sglwRZKzE=;
 b=gNOrqqeQ6/GNtSZK/NODnmnIjE2HoOc9fOeZX9cx/rDpTCxL/lshse3hMOSBJ14Frvqy5fSxX51HGCTMLyXjQr+v7xF3wuE05OP4ssn9FuGvCJ74kGcvTRmqeIMp7Woq/NyFlTVkNSTTDaHVPrfW4zEAbHW/UHLpH3o92dTcm2xxpUgmV8hmGFKtRLCqE7gKwLsAIRdQMewxZCUSOrxsDCNGjP57f55mHeTH6dWKMPlyf6FeXERi/UkOXj+N/GOyIZN8lw8LfQDhLjY5/HvfIr/F0qaFPEHCTdrNOK46YumVH1lDrdy6DOoO4w3NqS/y/nlKJcjh5q008U/iIHupIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYpR1FVinaVlOT1kWpGb4RoW4G5v2kxjU3sglwRZKzE=;
 b=Uf52aUzWPyUuak52I5ChddfjHPS/BIFZ4sgWJkEH8EVhHCIfQ9mXVXJ9pOsk4a0nXhTRW4X8LiXfhR5Wj3sY9R+3DZM8tVWsQliTixeb0NHIZSHQfYEfUB5kaFPPoMi76UeGPKaObQpKpSQNPRYJBewlb4k2G9kfOC8lRsUCS7I=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB8642.jpnprd01.prod.outlook.com
 (2603:1096:400:139::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 20:57:36 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 20:57:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Wolfram Sang <wsa@kernel.org>, biju.das.au <biju.das.au@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Thread-Topic: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Thread-Index:
 AQHaXoVU9ilCtHOjSkysdyM8MSKnYrEI2pOAgACbwACAAAz2gIAAw/DAgAAKV4CAAABRgIAAAVWA
Date: Wed, 14 Feb 2024 20:57:36 +0000
Message-ID:
 <TYCPR01MB11269D1C9578F27DE69E732B6864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
 <ZcvsyRfVwC0aJ5fb@shikoro>
 <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>
 <Zcx6Ty2tu_ZGdURj@ninjato>
 <TYCPR01MB11269CC8B2EAB564154C829A2864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <Zc0nWfwFFGhqxHQq@kekkonen.localdomain>
 <TYCPR01MB11269F35E38BE52CDD6628006864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11269F35E38BE52CDD6628006864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB8642:EE_
x-ms-office365-filtering-correlation-id: ba26d790-ffeb-49df-15b1-08dc2d9f927f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Xfb8781XWXAzdo3+SToyQ5RPYVoWngOLMvXJmNuHJ/aM6AOe0Re8vgGqxxazM1u1XILEL4sWxv4P9hlDxkDO26egDMOVo1LaEwkW+zOt60kmy1tlHcTvoBgVU/SwuOEEcknYq5C5ij1WE+ow6V+lf13OA1WaAdBC6wO5RWpuqkBoPLQq1qni+q3KE2FpoFmD5PJmjr2Q1BSx4I/X09QQ2wqOfkJCy+k7JYjGzMOmZCZ8pyW1DRxJZy4m7c7cUpiZNSI/Tb67o9NBZxBWfMEZpgWwhdDd/yZcgf3D4aAZzuO+Zj4wHLBn2ylSoAbmqG1uPoSmCWEJS01gdyfyxk3WQustyjbVPmt+0oA6zOU9DygXibEokr0X5TNPzq2QOX/IcYgD3UXTynAtxgWQjH2Qy1O66GXhLXhnO2NXGantT8F86kjhZam3ZGPTJkUEgf0Z+kWnMqo08phpqCslSHenwbMP+nhCNPmu/vBF3EzsTz7gwVhNy5A5youYNOe1d+qsr5Ws9JsFFoh+k75++tChoVjw5SwXrnMSw3GzjiIp2AOiGhAPWolL/mymIPSNxc+h4AAYhvP/mHnHBq7r7vuXGg53UFicay3xGQ+/DjPZ4HPNgH95aRU5qj7bJX2/6r0l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(55016003)(122000001)(66446008)(2906002)(86362001)(6506007)(5660300002)(52536014)(8676002)(66476007)(66556008)(64756008)(8936002)(76116006)(66946007)(4326008)(6916009)(33656002)(83380400001)(71200400001)(53546011)(7696005)(9686003)(54906003)(316002)(478600001)(41300700001)(26005)(38070700009)(2940100002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yIBmXgkScuJeoOkVHbDqZc6uOD2VXUVpcC5+oIaPqwO+ZETwtAm29CGC1Mgs?=
 =?us-ascii?Q?DRTSmAS8ejeCsYaE/mCv7+W7lJ8u/4nrry/1SBmQAukWMyuQkl2CkBgULHEw?=
 =?us-ascii?Q?v3vuaVSN1454JQ1/cS3hqZKp4iwJGXWAySb0/h/EGJsc6xRRpX7ZFSBolj/e?=
 =?us-ascii?Q?6MTAwPaRDU5DKFt+VhDBlMdL7PZI5F5Y6Z2lhgBIAiQ+BJlgvwLej2O2yNS/?=
 =?us-ascii?Q?pPj09I/n6J3LiJAOfw4OA2gx38C053pg3bOZa1yVmaGXZQjBhXGy42fF5uSp?=
 =?us-ascii?Q?PCy1qzCPJOiD0lvaSbcxG+dvckIWfwzL0PBNJZIqN0vTAh6/vmabkfhnAWq1?=
 =?us-ascii?Q?zAmhK2JOJQKrYsrZnJ5A5wK2xRANuYaCs7qB8jPmc90aYqEUEvfbUw5WEiet?=
 =?us-ascii?Q?/j+oAgpvL9r2CA/A8eCusz4pL5LoDMHGH0hTbhhOhCiOjMVkFzLZHQpeIN0e?=
 =?us-ascii?Q?+o+FdqAlwDXHRe6BJ41mNk0gFwylM+bjhUf2QX30aim7r3y+ZdQRjLSol5OO?=
 =?us-ascii?Q?p97vbdg1SO6HKJAaH7HDTsEg2d9HfaJVrU5MFEcvBF9Hzs2bHDqxPaF2k+yl?=
 =?us-ascii?Q?DjEbDTKyMV1VwVp3qLXYWQIYcKyNIADwy6I9ph5wXbkcxvKjcxgGLCJu65Bu?=
 =?us-ascii?Q?bWeK8NUuU3q/RuVxwZ8e0H6RhTN57wNWU+eunVwDUnuDAddy7/QDa/too1ae?=
 =?us-ascii?Q?IyIdnflGWmfxzrI/V+bfugAHjLoi1eZTOAn7HGluDyXKtqpXyCsff4zLZxAj?=
 =?us-ascii?Q?Yt2xDdTpejeY8F+/2xkKJU0DgsTQ79VysyWMnbJOh1juTh5iqlspIfn25sJP?=
 =?us-ascii?Q?ZeIyEgT+ixg9jCj+w+IphAN0WBgvUq16SeBIjrM7d5R/+lrwMpBAma5R/1jV?=
 =?us-ascii?Q?e5p8ZQCHWk7o/IiX/tGFZDYvHAjwFDyS34oVxvxtvBcEHRSvZ3SJGeVjUvdt?=
 =?us-ascii?Q?b0e+/qk4GaHdjiwYeTBuwHSEaugk21B1RHTSS4KNerShABNy37NYpQ24BWAi?=
 =?us-ascii?Q?z9gIouFSqRKCEXWQTkV/WJhM8DPklZZgjzJsqDu3GrIFkUs5TnpEtXg+mjIe?=
 =?us-ascii?Q?b8ySoHmLtKaNugtY8h8xDjKZNdjeRZZVvgJaXTZKbadgraRINBJtySYKOBUB?=
 =?us-ascii?Q?NubPbPP/Wy0IBwO7BNb46qYTzXrjfA3rMyorCJJ6Z/+zOdtaIuj7Fq/4XEeX?=
 =?us-ascii?Q?QoOVbaz0AQQmohou+dkNmOce+yb1lI10vh8/TKrsFj8TK+2W9TaVQFqMq4Wo?=
 =?us-ascii?Q?v8uTm3uemsTDrTomqPoqdqQAJCMqE4ba9TIpjm0RT4mfps2BFk9PKIE+lc+t?=
 =?us-ascii?Q?rhwYhPHGb3nJno1p9qXxf0vHJonVXke9wQmbyr6WJsFVOgTdpJgsalSqfNuB?=
 =?us-ascii?Q?j0+be6gOYH1mMTho7EU+UHq1hgCRUNDZqlODulMDYqtEOXwQ1KNuK93McxBC?=
 =?us-ascii?Q?nykudyX1mtFtWx9dlynkhUJ8Cx2vJhmiT0Y69lN4b3Z1rC2rGht92R69nS9C?=
 =?us-ascii?Q?zgEc7hI80dmh8kPtezvAz1Vgs+antN21VU785xUVnA6gU2q3YZoq+HmLYiog?=
 =?us-ascii?Q?YhmyOB2giUX2KyTw3YWlBKfvurrZgbVuXzPBR5qM9g+aaIg83ocTo0apjARG?=
 =?us-ascii?Q?aQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba26d790-ffeb-49df-15b1-08dc2d9f927f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 20:57:36.0579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hTLj18ykeJu95YEYy0OaVD4PW3X0+GTFIeejWZd/vx/W6eROAQXrWg05pkwDZNjbvHNQRANGy13uUmSyET/Hhu1k8HwP3xiBASqssbH88RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8642

Hi Sakari,

> -----Original Message-----
> From: Biju Das
> Sent: Wednesday, February 14, 2024 8:55 PM
> Subject: RE: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 fro=
m
> ov5645_global_init_setting
>=20
> Hi Sakari,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Wednesday, February 14, 2024 8:49 PM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008
> > from ov5645_global_init_setting
> >
> > Hi Biju,
> >
> > On Wed, Feb 14, 2024 at 08:25:16PM +0000, Biju Das wrote:
> > > Hi Wolfram,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Wolfram Sang <wsa@kernel.org>
> > > > Sent: Wednesday, February 14, 2024 8:31 AM
> > > > Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register
> > > > 0x3008 from ov5645_global_init_setting
> > > >
> > > > Hi Biju,
> > > >
> > > > > I think it is different here. That 1 msec is delay associated
> > > > > with applying hardware power see [1]
> > > >
> > > > Okay, ack.
> > > >
> > > > > I will restore it.
> > > >
> > > > Thanks!
> > > >
> > > > I had meanwhile another thought. What if we kind of merge the two
> > > > patches, so the outcome is basically this:
> > > >
> > > > In ov5645_set_register_array:
> > > >
> > > > 	If (settings->reg =3D=3D 0x3008 && settings->val =3D=3D 0x82)
> > > > 		usleep_range(1000, 2000)
> > > >
> > > > ?
> > > >
> > > > Then, we don't need to split the array and we are also future
> > > > proof if we ever need to set the reset bit again somewhere else.
> > > >
> > > > Bonus points for replacing 0x82 with a define :)
> > > >
> > > > What do you think?
> > >
> > >
> > > OK, this will do check for all other registers.
> > >
> > > But from your power down clue and checking ov5640.c Looks like there
> > > are 2 registers changes values after writing.
> > >
> > > [1] 0x3008, 0x82-->0x80
> > > [2] 0x0601, 0x02-->0x00
> > >
> > > I think [1] is soft reset based on ov5640. Since there is a gpio
> > > based hardware reset available, we can safely remove soft reset[1]
> > > and like ov5640.c, if there is no gpio for reset, then do the soft
> reset[1].
> >
> > I guess that would work. My understanding is that hard reset control
> > is mandatory for the device, so there really should be no need for
> > soft reset in the driver.
>=20
> OK.
>=20
> >
> > >
> > >
> > > Then add 1msec delay for power down/up(0x3008: 0x42,0x02) and 0x0601
> > > registers.
> > >
> > > With this looks like the Camera works ok @400kHz.
> > >
> > > The plans is to add a u8 variable for delay and enable delays for
> > > the above registers and add a check like below
> > >
> > > static int ov5645_set_register_array(struct ov5645 *ov5645,
> > > 				     const struct reg_value *settings,
> > > 				     unsigned int num_settings)
> > > {
> > > 	unsigned int i;
> > > 	int ret;
> > >
> > > 	for (i =3D 0; i < num_settings; ++i, ++settings) {
> > > 		ret =3D ov5645_write_reg(ov5645, settings->reg, settings->val);
> > > 		if (ret < 0)
> > > 			return ret;
> > >
> > > 		if (settings->delay_ms)
> > > 			usleep_range(1000 * settings->delay_ms, 2 * 1000 *
> > > settings->delay_ms);
> >
> > I'd prefer checking the register address in the write function instead
> > of this if you really need it. But it seems you don't.
>=20
> With delays in powerup/down registers (0x3008 : 0x42,0x02) it is not
> stable.

Typo: without delays in powerup/down registers (0x3008 : 0x42,0x02) it is n=
ot
stable.

You can see 0x42 followed by 0x02 which is an indication of power down/up p=
rocedure.

Cheers,
Biju

