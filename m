Return-Path: <linux-media+bounces-21615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA429D33F7
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 08:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77A34B24851
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 07:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646081714B2;
	Wed, 20 Nov 2024 07:02:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7CA16F831
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086160; cv=fail; b=b++aYrhnR9K57vR4deWBIuT4XwAYCGe/oCR23bgSvMgQdG4DhP9QU/pJhW7J20Wp8BpCKOevNM9e3i5MN9nrBI4MIhcgTxUhYYrseCEMc2nVrz1YjBSyNzrypnslOfCJVnwbBTHxf26v2inVQauBCybziF47qzMtIzrBipqCiXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086160; c=relaxed/simple;
	bh=NjQ+WAaop2Zy7YWE8+rNSb0Kl0TU12AJJ3GWdxdBBvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H7DeU7BOuBbOV/iKjKDxhsDvoUlmKWK0goKSH8o0jl6QtFbupfIWAg6SRb44tNQDvz6qgd82rDFgBd7TUsV4USj4xgCFNLPve5AXAvd7ak7XzvhGcMsYsnzZ13CgFSO446uwtFgr4Oi/QJbZxuSeR5Uui640Sem253mgzR5pAcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0wqSGDfHmdr7rD9uMtoUw1qZkT/r1l37XS6rAbnujVo0dQ8zoH8c1kMkrvHmUJ7iqDT6iFxTwwBzkYJSro0ZFfwQ3DlyzVVf0kD09Uhwol8YgjI09OIikTrwxg/YkGNq8IWQo5U1uqC8xUlCMzl2IvVeIEOGe7hSLCZZFZVNDnso384pG+Puip4ZQjJnvMGfsJTp7Su79s8rJYvwnmLdEpdX3Nc8MW5kONowaoq0S5ap9aCyjVE7CxTsV8XusXy7W4tscj6NRu29Bo/lHKRFRLYdd/CMqPndTk/EOMvp/OoYgWdPeJuQzW56hzfwOWg/zi77cIUchIHnXzphxjJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fayuAiirRdowoNUdur0nbZP7qamnJP1glQ1fGhKbvG4=;
 b=Snz1nJmIj1TSArY2YGh2wE/ShyO0OqvPtet6I9Du8/0H5hNQ3WgpEkoxnooF0rFUY/PAtH1wxvT8mKBBiaQE6FasOSvDi58R/Kp85WXFpa8C1WXdxwmtwpux2Fy9fKOfLO1JeiMqgPwfM1ntuiPogdeNUUIbWbX2ptdoBBgEM+MwstKSTivrOnLKFADqEtfVqeLPil1UAjI9wokvHK7GdL8APP+gcHzObX+3Ra4kb0WmMXO363F5sF046aakRaJX9+P2ZaLAPWPpBqe0+5wQjkp+XbRErwUNee8yX3zrfATYfGQo/OY34IgUz1V9VZQYZ6jOvI0Sn+EzpOe3nNoOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0555.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 07:02:30 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 07:02:30 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>, "joachim.reichel@posteo.de"
	<joachim.reichel@posteo.de>
Subject: Re: [PATCH v5] media: i2c: Add Omnivision OV02C10 sensor driver
Thread-Topic: [PATCH v5] media: i2c: Add Omnivision OV02C10 sensor driver
Thread-Index: AQHbOu+YwAdWcNWdX0K2O1n0dMRSqLK/tWqo
Date: Wed, 20 Nov 2024 07:02:30 +0000
Message-ID:
 <PN3P287MB182900D74B96BF156E2CF0BB8B212@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241120015726.778892-1-heimir.sverrisson@gmail.com>
In-Reply-To: <20241120015726.778892-1-heimir.sverrisson@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0555:EE_
x-ms-office365-filtering-correlation-id: e872504e-3bdf-4b2f-f984-08dd09314ce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Q4GuUqZ0IE81+dwz9ymEdeIJlhIaBUjzm45MYhqZfzh3zPtB0KP+7W9sk9?=
 =?iso-8859-1?Q?Ho5UBE3jlU40Km4+jINwA+jo/CEqDL0AmYp6VU3Ow3FQXeHaS48K7b3Ec9?=
 =?iso-8859-1?Q?7R5isvAYor4rvZ5+m+zfiT5wMcpkz1DyMxx9mlnJsmCx6srFv7c88f+HMm?=
 =?iso-8859-1?Q?ELApWJgW8XreF3SNfi3FPio7+myfkJgBLER3/PZAOiA1N1dRVqRbrYdc3P?=
 =?iso-8859-1?Q?B+8D0RDEQUyd6B9I/GFaTUhrvzhCSSnnDisPU/vbSGIUdu9KdVQ0fGFWS4?=
 =?iso-8859-1?Q?Vbg/WIueO9jS5umzsDsCqiTwsVaQ+qajl9XBcaI98q+oGONbR3qPsXdbF7?=
 =?iso-8859-1?Q?yA3zb3kVdKWRsHlb3YGGUtGQMnuHxhJpdhB0CYp9shQtAyv3wEn45zmpry?=
 =?iso-8859-1?Q?CYBKVFNCI3ZHCoLq4jMdqTjq/IoktXE6KlXxOKP0oNtB9/bP9dvph7jjan?=
 =?iso-8859-1?Q?js0or0mH0aa9ilYtbUIenStLma/MOI3NmOLKIsdXH1VpxhbqsoAFxubfcS?=
 =?iso-8859-1?Q?4cs/lohORik++MVGmLu5aP2t4E+ZgTMuKPEPkmo5Ul0GKwkYpfk5cYg/3z?=
 =?iso-8859-1?Q?bfc7FKpfCllHbltqLKn54kj2mGeNqfjj21fVMZkxp/t4WHldV5ZTRW9Uvf?=
 =?iso-8859-1?Q?4CTtIjilmdmHrAmsGbUVndTziqvtnaolw3p293QFjH3Nas56zmLp4v5YHw?=
 =?iso-8859-1?Q?s/EmfitgoSl1o7FP9nA+eH70BNenys8rM19cwtZu3dewKAg+tJLDMquWNO?=
 =?iso-8859-1?Q?g3F+iblnfikyZk4uJIhG3ntrmtQfmBaNTOaEm4VBkT/tK51bZ/I2eviF2f?=
 =?iso-8859-1?Q?bd9EO1QLD1f0loQmXQlKsoEtTL/fU/5VCvUchploLsCkOw2CI7xknAoo2d?=
 =?iso-8859-1?Q?mZgKrJi/nCqIr26NNT13c0v1hAL98F9yf4Ee3gciDpZ8s9ScGETFK6lV0g?=
 =?iso-8859-1?Q?gQsVqiC1xLR+vSbdBvSzXY1Ku7+M+v6zrGbrdyFIhpcM/RaqNG9KUtu27n?=
 =?iso-8859-1?Q?yEMDlKW46+o7gMxzmWeqp0yrplTFQL8TTnnxyo5Vmnu4RregCvnAXdcy++?=
 =?iso-8859-1?Q?IEcCWbh0SayM0JtqEW+TGkk8HD1YtCqf/ikPSdzNN9UhZtbkzO3P1Uyg8t?=
 =?iso-8859-1?Q?DYIFesfC1XEVmd3QDep7vxTg0H8OorKGMhDNHV0zEaI/dvDRoO/a7Y/gVt?=
 =?iso-8859-1?Q?R7x9B3b6VfUYYlbuRA1SV/o5Ey6kJ2Orn4oC7nZQiCJY0E0IIvf3a0oPGW?=
 =?iso-8859-1?Q?lwX/lYm+BE8OlzQSlysJDlSRPx6xt0awrXmvlergo9YiQtENz2Nc0RJM2m?=
 =?iso-8859-1?Q?2PBNPr/3XJAtszL6ylxGTnQjnWe6ewhWCK402dWCBgiGlkRvO6M99z1/+0?=
 =?iso-8859-1?Q?lDNKlyhf4U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0CdCMtX+YWa2TcEO/M2xRylrVnKhvIsSu5b5SRmJwdP2pjg9jKRJ8dANT5?=
 =?iso-8859-1?Q?VV5CjxjLjfntaXyI92wPSvJPoprrGI8DIBKK+l0dp3oMSHOfhWRg1p0K/3?=
 =?iso-8859-1?Q?YeEeGTW6kBoh4FcsuRpAzHumwELfSpllmVdn38lpY6DeMtf9gVw1QB3AAB?=
 =?iso-8859-1?Q?o4QJ1mrEMNJvOAnLAH75xdrWOW28M9x5EYY6IfYRVza9T0Y/V50FT0ORgx?=
 =?iso-8859-1?Q?7j54TRuSIpBVlNAhpV4peZEgHJbfj5rIOPL+7C9Md8yyQ1AkLHQjJfdQkA?=
 =?iso-8859-1?Q?ZQVAuokDofTwtSi5Ux67wqIT/aq54k3SGGKNKUpWEI+1G1So+eeY2X5Ihw?=
 =?iso-8859-1?Q?MPeMmIB1OAAoI927iAuD0rPO2R+QW1LCcT+Vtrk+cjx/SqM20OToXTre9G?=
 =?iso-8859-1?Q?5a6HVfnUJwCO0YK+Kzi7VfsauXs+UozYdxCgNHqPm6XBRA3YHXS01F/cVk?=
 =?iso-8859-1?Q?5vCp4yEhzX5dIhWljLXjaDc7E92kJqZeJxII9dd7vnwKX+J7+jANuBFqk1?=
 =?iso-8859-1?Q?t9L7ozuJU/Gs/g0kC1NlR6NGDfZH8xksV1EzjjVEe8oxh4lnbydl4i/bTR?=
 =?iso-8859-1?Q?46uDNIpdu8vO/zIqzK9ofH3IRm4LJwX3yL2df0tMke/oGbXX4C+2/Gs7gk?=
 =?iso-8859-1?Q?sHG+KQcSWE/QCWwaa5LB+Xn4KX2+9bwVU152nBUKqi7naqTGU1MOxECxt7?=
 =?iso-8859-1?Q?ZS0Ldj81YTrJTMTLCjjXPeWXoD3bRKE+gLwu1TZLSWUHVz2D/OW3VlPOJh?=
 =?iso-8859-1?Q?j7SZ9eXU8vmICnNvTR1+4g2tW7XD4xg2jYHdsXy7rgQsROWvWpWu71cmdz?=
 =?iso-8859-1?Q?EzsjJVbZcofxhmeiXsvW2yqBC2b987UlB5FEnQRDUn35TRLA81+SOuvlSe?=
 =?iso-8859-1?Q?ZTVs+VdMMVtY6o7SVLkD+jZOTDtOdXOMhc7rV5zyouvx3g+FWDxVVnT+TC?=
 =?iso-8859-1?Q?4KjDcudDpjI+8lcWlfCZAFdILg3YBjwLKOjFa620RnNP92uuOsmw0/har/?=
 =?iso-8859-1?Q?Dqw1PGMTL+XkDNXBX5fkVHMYM3WU+LSUYVD4rbDrw1CFuO/P8ZMI+1Xevs?=
 =?iso-8859-1?Q?XIAY5Yc8LeVY6V6KvbYe+zblMNbN9pAw6Knr5rf3nnOnWmhhbBr4MgSm0I?=
 =?iso-8859-1?Q?NvyET4POMf1cCR+R+HM03+25zSkWUQ4IQ4RORv7kOERS9tgeRmX9m1tPwx?=
 =?iso-8859-1?Q?jpsHBQVywqgXj0NV9h6hFWw6hONhGd4hNA9C7glYYMj7lZv4Yf0IghS63W?=
 =?iso-8859-1?Q?pcO1NQlhuNEJkDTXu42pwOeYGzEtyWx6pqu/Jshc2k0nx5+tFsYVdLKDoW?=
 =?iso-8859-1?Q?cvTaCEg8cKlSBdOfBzRFF+YKzUSHPZBkcJHPNuaBedQyR6bbnY3UqKPxBF?=
 =?iso-8859-1?Q?fQXQ0SNd1romE8SU2HVph85D9vHyHgIgMl4JrAGexRmKN6jyJ9Qf2tz2pU?=
 =?iso-8859-1?Q?6ipmTX6eNQweuGf9vP91VIznKUMiMS4XXFpNDY1Hj2fY4SmleHtyfGwwBw?=
 =?iso-8859-1?Q?d6CW80GFd/CPqbD1uPaDy1EOw9jZXBkOT1b/dZxPJBhnCcZjFOFGBKHlV1?=
 =?iso-8859-1?Q?4WHzlVfanVbVaoA6RdEMZUUxHkaOswMc6U71jG/FxNmeYf0hzaSwCpauSQ?=
 =?iso-8859-1?Q?ag7U/+J1Pl4mu+qO8Qpj0ApqVE+4f6X05kpvxUwKiee6w4On4Ob8ReuA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e872504e-3bdf-4b2f-f984-08dd09314ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 07:02:30.4796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Idvh67JrOD22AA/yRPPc+F6NsH/4+UM5di+duaob/4S13nWiK90pXQXgTRmbAHOj5KWNLFCU9H0y3lIDU/2JR5M5aTiWWTeRGZ3bVRfArCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0555

Hello Heimir,=0A=
=0A=
> +enum {=0A=
> +=A0=A0=A0=A0=A0=A0 OV02C10_LINK_FREQ_400MHZ_INDEX,=0A=
> +};=0A=
> +=0A=
> +struct ov02c10_link_freq_config {=0A=
> +=A0=A0=A0=A0=A0=A0 const struct reg_sequence *reg_sequence;=0A=
> +=A0=A0=A0=A0=A0=A0 const int sequence_length;=0A=
> +};=0A=
=0A=
now its unused you can remove=0A=
=0A=
> +static int ov02c10_set_format(struct v4l2_subdev *sd,=0A=
> +                             struct v4l2_subdev_state *sd_state,=0A=
> +                             struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +       struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
> +       const struct ov02c10_mode *mode;=0A=
> +       s32 vblank_def, h_blank;=0A=
> +=0A=
> +       if (ov02c10->mipi_lanes =3D=3D 1)=0A=
> +               mode =3D &supported_modes[0];=0A=
> +       else if (ov02c10->mipi_lanes =3D=3D 2)=0A=
> +               mode =3D &supported_modes[1];=0A=
> +       else=0A=
> +               mode =3D v4l2_find_nearest_size(supported_modes,=0A=
> +                                             ARRAY_SIZE(supported_modes)=
,=0A=
> +                                             width, height, fmt->format.=
width,=0A=
> +                                             fmt->format.height);=0A=
=0A=
The else part does not seem helpful to me.=0A=
=0A=
There is no need to send the next version for now.=0A=
Please wait for the maintainers comments.=0A=
=0A=
Best regards,=0A=
Tarang=0A=
                                                                           =
     =0A=
________________________________________=0A=
From:=A0Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>=0A=
Sent:=A0Wednesday, November 20, 2024 7:27 AM=0A=
To:=A0sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>; hao.yao@=
intel.com <hao.yao@intel.com>; mchehab@kernel.org <mchehab@kernel.org>=0A=
Cc:=A0linux-media@vger.kernel.org <linux-media@vger.kernel.org>; hdegoede@r=
edhat.com <hdegoede@redhat.com>; joachim.reichel@posteo.de <joachim.reichel=
@posteo.de>; Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>=0A=
Subject:=A0[PATCH v5] media: i2c: Add Omnivision OV02C10 sensor driver=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
Add a new driver for the Omnivision OV02C10 camera sensor. This is based=0A=
on the out of tree driver by Hao Yao <hao.yao@intel.com> from:=0A=
https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10=
.c=0A=
=0A=
This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI=0A=
driver and the libcamera software ISP code.=0A=
=0A=
Tested-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>=0A=
Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>=0A=
---=0A=
=A0drivers/media/i2c/Kconfig=A0=A0 |=A0=A0 10 +=0A=
=A0drivers/media/i2c/Makefile=A0 |=A0=A0=A0 1 +=0A=
=A0drivers/media/i2c/ov02c10.c | 1338 +++++++++++++++++++++++++++++++++++=
=0A=
=A03 files changed, 1349 insertions(+)=0A=
=A0create mode 100644 drivers/media/i2c/ov02c10.c=0A=
=0A=
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
index 8ba096b8ebca..9bca187d89af 100644=0A=
--- a/drivers/media/i2c/Kconfig=0A=
+++ b/drivers/media/i2c/Kconfig=0A=
@@ -355,6 +355,16 @@ config VIDEO_OV02A10=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M he=
re: the=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 module will be called ov02a10.=0A=
=0A=
+config VIDEO_OV02C10=0A=
+=A0=A0=A0=A0=A0=A0 tristate "OmniVision OV02C10 sensor support"=0A=
+=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
+=A0=A0=A0=A0=A0=A0 help=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for the Omni=
Vision=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 OV02C10 camera.=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M here=
: the=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0 module will be called ov02c10.=0A=
+=0A=
=A0config VIDEO_OV08D10=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 tristate "OmniVision OV08D10 sensor support"=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 help=0A=
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
index fbb988bd067a..5842346c220d 100644=0A=
--- a/drivers/media/i2c/Makefile=0A=
+++ b/drivers/media/i2c/Makefile=0A=
@@ -82,6 +82,7 @@ obj-$(CONFIG_VIDEO_MT9V111) +=3D mt9v111.o=0A=
=A0obj-$(CONFIG_VIDEO_OG01A1B) +=3D og01a1b.o=0A=
=A0obj-$(CONFIG_VIDEO_OV01A10) +=3D ov01a10.o=0A=
=A0obj-$(CONFIG_VIDEO_OV02A10) +=3D ov02a10.o=0A=
+obj-$(CONFIG_VIDEO_OV02C10) +=3D ov02c10.o=0A=
=A0obj-$(CONFIG_VIDEO_OV08D10) +=3D ov08d10.o=0A=
=A0obj-$(CONFIG_VIDEO_OV08X40) +=3D ov08x40.o=0A=
=A0obj-$(CONFIG_VIDEO_OV13858) +=3D ov13858.o=0A=
diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c=0A=
new file mode 100644=0A=
index 000000000000..3c7b085ef81d=0A=
--- /dev/null=0A=
+++ b/drivers/media/i2c/ov02c10.c=0A=
@@ -0,0 +1,1338 @@=0A=
+// SPDX-License-Identifier: GPL-2.0=0A=
+// Copyright (c) 2022 Intel Corporation.=0A=
+=0A=
+#include <linux/acpi.h>=0A=
+#include <linux/clk.h>=0A=
+#include <linux/delay.h>=0A=
+#include <linux/gpio/consumer.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/pm_runtime.h>=0A=
+#include <linux/regmap.h>=0A=
+#include <linux/version.h>=0A=
+#include <media/v4l2-cci.h>=0A=
+#include <media/v4l2-ctrls.h>=0A=
+#include <media/v4l2-device.h>=0A=
+#include <media/v4l2-fwnode.h>=0A=
+=0A=
+#define OV02C10_LINK_FREQ_400MHZ=A0=A0=A0=A0=A0=A0 400000000ULL=0A=
+#define OV02C10_SCLK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 80000000LL=0A=
+#define OV02C10_MCLK=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 19200000=0A=
+#define OV02C10_DATA_LANES=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
+#define OV02C10_RGB_DEPTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 10=0A=
+=0A=
+#define OV02C10_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x3=
00a)=0A=
+#define OV02C10_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0x5602=0A=
+=0A=
+#define OV02C10_REG_STREAM_CONTROL=A0=A0=A0=A0 CCI_REG8(0x0100)=0A=
+=0A=
+/* vertical-timings from sensor */=0A=
+#define OV02C10_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG16(0x380e)=0A=
+#define OV02C10_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 0xffff=0A=
+=0A=
+/* Exposure controls from sensor */=0A=
+#define OV02C10_REG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x350=
1)=0A=
+#define OV02C10_EXPOSURE_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=0A=
+#define OV02C10_EXPOSURE_MAX_MARGIN=A0=A0=A0 8=0A=
+#define OV02C10_EXPOSURE_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
+=0A=
+/* Analog gain controls from sensor */=0A=
+#define OV02C10_REG_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 CCI_REG16(0x3508)=0A=
+#define OV02C10_ANAL_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x10=0A=
+#define OV02C10_ANAL_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 0xf8=0A=
+#define OV02C10_ANAL_GAIN_STEP=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
+#define OV02C10_ANAL_GAIN_DEFAULT=A0=A0=A0=A0=A0 0x10=0A=
+=0A=
+/* Digital gain controls from sensor */=0A=
+#define OV02C10_REG_DIGITAL_GAIN=A0=A0=A0=A0=A0=A0 CCI_REG24(0x350a)=0A=
+#define OV02C10_DGTL_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0400=0A=
+#define OV02C10_DGTL_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3fff=0A=
+#define OV02C10_DGTL_GAIN_STEP=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
+#define OV02C10_DGTL_GAIN_DEFAULT=A0=A0=A0=A0=A0 0x0400=0A=
+=0A=
+/* Rotate */=0A=
+#define OV02C10_ROTATE_CONTROL=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x3820)=0A=
+#define OV02C10_ISP_X_WIN_CONTROL=A0=A0=A0=A0=A0 CCI_REG16(0x3810)=0A=
+#define OV02C10_ISP_Y_WIN_CONTROL=A0=A0=A0=A0=A0 CCI_REG16(0x3812)=0A=
+#define OV02C10_CONFIG_ROTATE=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x18=0A=
+=0A=
+/* Test Pattern Control */=0A=
+#define OV02C10_REG_TEST_PATTERN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 CCI_REG8(0x4503)=0A=
+#define OV02C10_TEST_PATTERN_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(7=
)=0A=
+=0A=
+enum {=0A=
+=A0=A0=A0=A0=A0=A0 OV02C10_LINK_FREQ_400MHZ_INDEX,=0A=
+};=0A=
+=0A=
+struct ov02c10_link_freq_config {=0A=
+=A0=A0=A0=A0=A0=A0 const struct reg_sequence *reg_sequence;=0A=
+=A0=A0=A0=A0=A0=A0 const int sequence_length;=0A=
+};=0A=
+=0A=
+struct ov02c10_mode {=0A=
+=A0=A0=A0=A0=A0=A0 /* Frame width in pixels */=0A=
+=A0=A0=A0=A0=A0=A0 u32 width;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Frame height in pixels */=0A=
+=A0=A0=A0=A0=A0=A0 u32 height;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Horizontal timining size */=0A=
+=A0=A0=A0=A0=A0=A0 u32 hts;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Default vertical timining size */=0A=
+=A0=A0=A0=A0=A0=A0 u32 vts_def;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Min vertical timining size */=0A=
+=A0=A0=A0=A0=A0=A0 u32 vts_min;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Link frequency needed for this resolution */=0A=
+=A0=A0=A0=A0=A0=A0 u32 link_freq_index;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* MIPI lanes used */=0A=
+=A0=A0=A0=A0=A0=A0 u8 mipi_lanes;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Sensor register settings for this resolution */=0A=
+=A0=A0=A0=A0=A0=A0 const struct reg_sequence *reg_sequence;=0A=
+=A0=A0=A0=A0=A0=A0 const int sequence_length;=0A=
+};=0A=
+=0A=
+static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] =
=3D {=0A=
+=A0=A0=A0=A0=A0=A0 {0x0301, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0303, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0304, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0305, 0xe0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0313, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x031c, 0x4f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x301b, 0xd2},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3020, 0x97},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3022, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3026, 0xb4},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3027, 0xe1},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303b, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303c, 0x4f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303d, 0xe6},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303e, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303f, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3021, 0x23},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3501, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3502, 0x6c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3504, 0x0c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3507, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3508, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3509, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x350a, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x350b, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x350c, 0x41},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3600, 0x84},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3603, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3610, 0x57},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3611, 0x1b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3613, 0x78},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3623, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3632, 0xa0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3642, 0xe8},=0A=
+=A0=A0=A0=A0=A0=A0 {0x364c, 0x70},=0A=
+=A0=A0=A0=A0=A0=A0 {0x365f, 0x0f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3708, 0x30},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3714, 0x24},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3725, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3737, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3739, 0x28},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3749, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374a, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374b, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374c, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374d, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374e, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374f, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3752, 0x36},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3753, 0x36},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3754, 0x36},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3761, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x376c, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3774, 0x18},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3776, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x377c, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x377d, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x377e, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37a0, 0x44},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37a6, 0x44},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37aa, 0x0d},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37ae, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37cb, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37cc, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37d8, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37d9, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e1, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e2, 0x18},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e3, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e4, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e5, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e6, 0x08},=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* 1928x1092 */=0A=
+=A0=A0=A0=A0=A0=A0 {0x3800, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3801, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3802, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3803, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3804, 0x07},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3805, 0x8f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3806, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3807, 0x47},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3808, 0x07},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3809, 0x88},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380a, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380b, 0x44},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380c, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380d, 0xe8},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380e, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380f, 0x8c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3810, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3811, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3812, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3813, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3814, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3815, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3816, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3817, 0x01},=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 {0x3820, 0xb0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3821, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3822, 0x80},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3823, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3824, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3825, 0x20},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3826, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3827, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382a, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382b, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382e, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382f, 0x23},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3834, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3839, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x383a, 0xd1},=0A=
+=A0=A0=A0=A0=A0=A0 {0x383e, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x393d, 0x29},=0A=
+=A0=A0=A0=A0=A0=A0 {0x393f, 0x6e},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394b, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394c, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394d, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394e, 0x0b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394f, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3950, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3951, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3952, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3953, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3954, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3955, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3956, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3957, 0x0e},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3958, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3959, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395a, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395b, 0x13},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395c, 0x09},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395d, 0x05},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395e, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3960, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3961, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3962, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3963, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3964, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3965, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3966, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3967, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3968, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3969, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396a, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396b, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396c, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396d, 0xf0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396e, 0x11},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3970, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3971, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3972, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3973, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3974, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3975, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3976, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3977, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3978, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3c00, 0x0f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3c20, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3c21, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3f00, 0x8b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3f02, 0x0f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4000, 0xc3},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4001, 0xe0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4002, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4003, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4008, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4009, 0x23},=0A=
+=A0=A0=A0=A0=A0=A0 {0x400a, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x400b, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4077, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4078, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4079, 0x1a},=0A=
+=A0=A0=A0=A0=A0=A0 {0x407a, 0x7f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x407b, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4080, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4081, 0x84},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4308, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4309, 0xff},=0A=
+=A0=A0=A0=A0=A0=A0 {0x430d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4806, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4813, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4837, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4857, 0x05},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4500, 0x07},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4501, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4503, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x450a, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x450e, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x450f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4800, 0x24},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4900, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4901, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4902, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5000, 0xf5},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5001, 0x50},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5006, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5080, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5181, 0x2b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5202, 0xa3},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5206, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5207, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x520a, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x520b, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x365d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4815, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4816, 0x12},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4f00, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 /* plls */=0A=
+=A0=A0=A0=A0=A0=A0 {0x0303, 0x05},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0305, 0x90},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0316, 0x90},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3016, 0x12},=0A=
+};=0A=
+=0A=
+static const struct reg_sequence sensor_1928x1092_2lane_30fps_setting[] =
=3D {=0A=
+=A0=A0=A0=A0=A0=A0 {0x0301, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0303, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0304, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0305, 0xe0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0313, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x031c, 0x4f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x301b, 0xf0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3020, 0x97},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3022, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3026, 0xb4},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3027, 0xf1},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303b, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303c, 0x4f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303d, 0xe6},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303e, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x303f, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3021, 0x23},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3501, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3502, 0x6c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3504, 0x0c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3507, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3508, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3509, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x350a, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x350b, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x350c, 0x41},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3600, 0x84},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3603, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3610, 0x57},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3611, 0x1b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3613, 0x78},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3623, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3632, 0xa0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3642, 0xe8},=0A=
+=A0=A0=A0=A0=A0=A0 {0x364c, 0x70},=0A=
+=A0=A0=A0=A0=A0=A0 {0x365f, 0x0f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3708, 0x30},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3714, 0x24},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3725, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3737, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3739, 0x28},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3749, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374a, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374b, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374c, 0x32},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374d, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374e, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x374f, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3752, 0x36},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3753, 0x36},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3754, 0x36},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3761, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x376c, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3774, 0x18},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3776, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x377c, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x377d, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x377e, 0x81},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37a0, 0x44},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37a6, 0x44},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37aa, 0x0d},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37ae, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37cb, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37cc, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37d8, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37d9, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e1, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e2, 0x18},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e3, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e4, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e5, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x37e6, 0x08},=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* 1928x1092 */=0A=
+=A0=A0=A0=A0=A0=A0 {0x3800, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3801, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3802, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3803, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3804, 0x07},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3805, 0x8f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3806, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3807, 0x47},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3808, 0x07},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3809, 0x88},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380a, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380b, 0x44},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380c, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380d, 0x74},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380e, 0x09},=0A=
+=A0=A0=A0=A0=A0=A0 {0x380f, 0x18},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3810, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3811, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3812, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3813, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3814, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3815, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3816, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3817, 0x01},=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 {0x3820, 0xb0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3821, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3822, 0x80},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3823, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3824, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3825, 0x20},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3826, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3827, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382a, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382b, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382e, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x382f, 0x23},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3834, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3839, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x383a, 0xd1},=0A=
+=A0=A0=A0=A0=A0=A0 {0x383e, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x393d, 0x29},=0A=
+=A0=A0=A0=A0=A0=A0 {0x393f, 0x6e},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394b, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394c, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394d, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394e, 0x0a},=0A=
+=A0=A0=A0=A0=A0=A0 {0x394f, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3950, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3951, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3952, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3953, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3954, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3955, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3956, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3957, 0x0e},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3958, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3959, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395a, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395b, 0x13},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395c, 0x09},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395d, 0x05},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395e, 0x02},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x395f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3960, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3961, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3962, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3963, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3964, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3965, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3966, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3967, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3968, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3969, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396a, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396b, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396c, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396d, 0xf0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396e, 0x11},=0A=
+=A0=A0=A0=A0=A0=A0 {0x396f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3970, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3971, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3972, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3973, 0x37},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3974, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3975, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3976, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3977, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3978, 0x3c},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3c00, 0x0f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3c20, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3c21, 0x08},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3f00, 0x8b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3f02, 0x0f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4000, 0xc3},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4001, 0xe0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4002, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4003, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4008, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4009, 0x23},=0A=
+=A0=A0=A0=A0=A0=A0 {0x400a, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x400b, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4041, 0x20},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4077, 0x06},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4078, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4079, 0x1a},=0A=
+=A0=A0=A0=A0=A0=A0 {0x407a, 0x7f},=0A=
+=A0=A0=A0=A0=A0=A0 {0x407b, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4080, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4081, 0x84},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4308, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4309, 0xff},=0A=
+=A0=A0=A0=A0=A0=A0 {0x430d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4806, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4813, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4837, 0x10},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4857, 0x05},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4884, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4500, 0x07},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4501, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4503, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x450a, 0x04},=0A=
+=A0=A0=A0=A0=A0=A0 {0x450e, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x450f, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4800, 0x64},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4900, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4901, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4902, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d00, 0x03},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d01, 0xd8},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d02, 0xba},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d03, 0xa0},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d04, 0xb7},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d05, 0x34},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4d0d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5000, 0xfd},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5001, 0x50},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5006, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5080, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5181, 0x2b},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5202, 0xa3},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5206, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x5207, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x520a, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 {0x520b, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x365d, 0x00},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4815, 0x40},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4816, 0x12},=0A=
+=A0=A0=A0=A0=A0=A0 {0x481f, 0x30},=0A=
+=A0=A0=A0=A0=A0=A0 {0x4f00, 0x01},=0A=
+=A0=A0=A0=A0=A0=A0 /* plls */=0A=
+=A0=A0=A0=A0=A0=A0 {0x0303, 0x05},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0305, 0x90},=0A=
+=A0=A0=A0=A0=A0=A0 {0x0316, 0x90},=0A=
+=A0=A0=A0=A0=A0=A0 {0x3016, 0x32},=0A=
+};=0A=
+=0A=
+static const char * const ov02c10_test_pattern_menu[] =3D {=0A=
+=A0=A0=A0=A0=A0=A0 "Disabled",=0A=
+=A0=A0=A0=A0=A0=A0 "Color Bar",=0A=
+=A0=A0=A0=A0=A0=A0 "Top-Bottom Darker Color Bar",=0A=
+=A0=A0=A0=A0=A0=A0 "Right-Left Darker Color Bar",=0A=
+=A0=A0=A0=A0=A0=A0 "Color Bar type 4",=0A=
+};=0A=
+=0A=
+static const s64 link_freq_menu_items[] =3D {=0A=
+=A0=A0=A0=A0=A0=A0 OV02C10_LINK_FREQ_400MHZ,=0A=
+};=0A=
+=0A=
+static const struct ov02c10_mode supported_modes[] =3D {=0A=
+=A0=A0=A0=A0=A0=A0 {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 1928,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 1092,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 2280,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_def =3D 1164,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_min =3D 1164,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .mipi_lanes =3D 1,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .reg_sequence =3D sensor_1928x1=
092_1lane_30fps_setting,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .sequence_length =3D ARRAY_SIZE=
(sensor_1928x1092_1lane_30fps_setting),=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .link_freq_index =3D OV02C10_LI=
NK_FREQ_400MHZ_INDEX,=0A=
+=A0=A0=A0=A0=A0=A0 },=0A=
+=A0=A0=A0=A0=A0=A0 {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 1928,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 1092,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 1140,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_def =3D 2328,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_min =3D 2328,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .mipi_lanes =3D 2,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .reg_sequence =3D sensor_1928x1=
092_2lane_30fps_setting,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .sequence_length =3D ARRAY_SIZE=
(sensor_1928x1092_2lane_30fps_setting),=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .link_freq_index =3D OV02C10_LI=
NK_FREQ_400MHZ_INDEX,=0A=
+=A0=A0=A0=A0=A0=A0 },=0A=
+};=0A=
+=0A=
+struct ov02c10 {=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
+=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler ctrl_handler;=0A=
+=A0=A0=A0=A0=A0=A0 struct regmap *regmap;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* V4L2 Controls */=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *link_freq;=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *pixel_rate;=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vblank;=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *hblank;=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *exposure;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 struct clk *img_clk;=0A=
+=A0=A0=A0=A0=A0=A0 struct regulator *avdd;=0A=
+=A0=A0=A0=A0=A0=A0 struct gpio_desc *reset;=0A=
+=A0=A0=A0=A0=A0=A0 struct gpio_desc *handshake;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Current mode */=0A=
+=A0=A0=A0=A0=A0=A0 const struct ov02c10_mode *cur_mode;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* To serialize asynchronous callbacks */=0A=
+=A0=A0=A0=A0=A0=A0 struct mutex mutex;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* MIPI lanes used */=0A=
+=A0=A0=A0=A0=A0=A0 u8 mipi_lanes;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Streaming on/off */=0A=
+=A0=A0=A0=A0=A0=A0 bool streaming;=0A=
+};=0A=
+=0A=
+static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 return container_of(subdev, struct ov02c10, sd);=0A=
+}=0A=
+=0A=
+static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (!pattern)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return cci_update_bits(ov02c10-=
>regmap, OV02C10_REG_TEST_PATTERN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(7),=
 0, NULL);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTE=
RN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x03, p=
attern - 1, &ret);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTE=
RN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(7),=
 OV02C10_TEST_PATTERN_ENABLE, &ret);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D container_of(ctrl->handler,=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ov02c10, c=
trl_handler);=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&ov02=
c10->sd);=0A=
+=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Propagate change of current control to all related c=
ontrols */=0A=
+=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Update max exposure while me=
eting expected vblanking */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D ov02c10->cur_m=
ode->height + ctrl->val -=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 OV02C10_EXPOSURE_MAX_MARGIN;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_modify_range(ov02c1=
0->exposure,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->exposure->minimum,=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max, ov02c10->exposu=
re->step,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max);=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* V4L2 controls values will be applied only when power=
 is already up */=0A=
+=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(&client->dev))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
+=A0=A0=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(ov02c10->regmap, OV02=
C10_REG_ANALOG_GAIN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
trl->val << 4, &ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 case V4L2_CID_DIGITAL_GAIN:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(ov02c10->regmap, OV02=
C10_REG_DIGITAL_GAIN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
trl->val << 6, &ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(ov02c10->regmap, OV02=
C10_REG_EXPOSURE,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
trl->val, &ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(ov02c10->regmap, OV02=
C10_REG_VTS,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 o=
v02c10->cur_mode->height + ctrl->val, &ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_test_pattern(ov=
02c10, ctrl->val);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 default:=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static const struct v4l2_ctrl_ops ov02c10_ctrl_ops =3D {=0A=
+=A0=A0=A0=A0=A0=A0 .s_ctrl =3D ov02c10_set_ctrl,=0A=
+};=0A=
+=0A=
+static int ov02c10_init_controls(struct ov02c10 *ov02c10)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
+=A0=A0=A0=A0=A0=A0 const struct ov02c10_mode *cur_mode;=0A=
+=A0=A0=A0=A0=A0=A0 s64 exposure_max, h_blank;=0A=
+=A0=A0=A0=A0=A0=A0 u32 vblank_min, vblank_max, vblank_default;=0A=
+=A0=A0=A0=A0=A0=A0 int size;=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ctrl_hdlr =3D &ov02c10->ctrl_handler;=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 8);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ctrl_hdlr->lock =3D &ov02c10->mutex;=0A=
+=A0=A0=A0=A0=A0=A0 cur_mode =3D ov02c10->cur_mode;=0A=
+=A0=A0=A0=A0=A0=A0 size =3D ARRAY_SIZE(link_freq_menu_items);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr=
,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 &ov02c10_ctrl_ops,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 V4L2_CID_LINK_FREQ,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 size - 1, 0,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 link_freq_menu_items);=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->link_freq)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->link_freq->flags |=3D =
V4L2_CTRL_FLAG_READ_ONLY;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &o=
v02c10_ctrl_ops,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID=
_PIXEL_RATE, 0,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV02C10_=
SCLK, 1, OV02C10_SCLK);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 vblank_min =3D cur_mode->vts_min - cur_mode->height;=0A=
+=A0=A0=A0=A0=A0=A0 vblank_max =3D OV02C10_VTS_MAX - cur_mode->height;=0A=
+=A0=A0=A0=A0=A0=A0 vblank_default =3D cur_mode->vts_def - cur_mode->height=
;=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov02c=
10_ctrl_ops,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_VBLANK, vbl=
ank_min,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank_max, 1, vblan=
k_default);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 h_blank =3D cur_mode->hts - cur_mode->width;=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov02c=
10_ctrl_ops,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_HBLANK, h_b=
lank, h_blank,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, h_blank);=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->hblank)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->hblank->flags |=3D V4L=
2_CTRL_FLAG_READ_ONLY;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CI=
D_ANALOGUE_GAIN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=
V02C10_ANAL_GAIN_MIN, OV02C10_ANAL_GAIN_MAX,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=
V02C10_ANAL_GAIN_STEP, OV02C10_ANAL_GAIN_DEFAULT);=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CI=
D_DIGITAL_GAIN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=
V02C10_DGTL_GAIN_MIN, OV02C10_DGTL_GAIN_MAX,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 O=
V02C10_DGTL_GAIN_STEP, OV02C10_DGTL_GAIN_DEFAULT);=0A=
+=A0=A0=A0=A0=A0=A0 exposure_max =3D cur_mode->vts_def - OV02C10_EXPOSURE_M=
AX_MARGIN;=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov0=
2c10_ctrl_ops,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_EXPOS=
URE,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV02C10_EXPOSU=
RE_MIN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max,=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV02C10_EXPOSU=
RE_STEP,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max);=
=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_o=
ps,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_TEST_PATTERN,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(ov02c10_test_pattern_menu) - 1=
,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, 0, ov02c10_test_pattern_menu);=0A=
+=A0=A0=A0=A0=A0=A0 if (ctrl_hdlr->error)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ctrl_hdlr->error;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->sd.ctrl_handler =3D ctrl_hdlr;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static void ov02c10_update_pad_format(const struct ov02c10_mode *mode,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt *fmt)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 fmt->width =3D mode->width;=0A=
+=A0=A0=A0=A0=A0=A0 fmt->height =3D mode->height;=0A=
+=A0=A0=A0=A0=A0=A0 fmt->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;=0A=
+=A0=A0=A0=A0=A0=A0 fmt->field =3D V4L2_FIELD_NONE;=0A=
+}=0A=
+=0A=
+static int ov02c10_start_streaming(struct ov02c10 *ov02c10)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&ov02=
c10->sd);=0A=
+=A0=A0=A0=A0=A0=A0 const struct reg_sequence *reg_sequence;=0A=
+=A0=A0=A0=A0=A0=A0 int sequence_length;=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 reg_sequence =3D ov02c10->cur_mode->reg_sequence;=0A=
+=A0=A0=A0=A0=A0=A0 sequence_length =3D ov02c10->cur_mode->sequence_length;=
=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D regmap_multi_reg_write(ov02c10->regmap,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg_sequence, sequence_length);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o set mode");=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_hand=
ler);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov02c10->regmap, OV02C10_REG_STREAM_C=
ONTROL, 1, NULL);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o start streaming");=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static void ov02c10_stop_streaming(struct ov02c10 *ov02c10)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&ov02=
c10->sd);=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov02c10->regmap, OV02C10_REG_STREAM_C=
ONTROL, 0, NULL);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o stop streaming");=0A=
+}=0A=
+=0A=
+static int ov02c10_set_stream(struct v4l2_subdev *sd, int enable)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(sd);=
=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->streaming =3D=3D enable)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_lock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 if (enable) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_get_sync(&cl=
ient->dev);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runt=
ime_put_noidle(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mutex_u=
nlock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
ret;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_start_streaming=
(ov02c10);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enable =
=3D 0;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10=
_stop_streaming(ov02c10);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runt=
ime_put(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 } else {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10_stop_streaming(ov02c10)=
;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev);=
=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->streaming =3D enable;=0A=
+=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov02c10->mutex);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+/* This function tries to get power control resources */=0A=
+static int ov02c10_get_pm_resources(struct device *dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=A0=A0=A0=A0=A0=A0 int ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->reset =3D devm_gpiod_get_optional(dev, "reset"=
, GPIOD_OUT_LOW);=0A=
+=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov02c10->reset))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, PTR_E=
RR(ov02c10->reset),=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get reset gpio\n");=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->handshake =3D devm_gpiod_get_optional(dev, "ha=
ndshake",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 GPIOD_OUT_LOW);=0A=
+=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov02c10->handshake))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, PTR_E=
RR(ov02c10->handshake),=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get handshake gpio\n");=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->img_clk =3D devm_clk_get_optional(dev, NULL);=
=0A=
+=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov02c10->img_clk))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, PTR_E=
RR(ov02c10->img_clk),=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get imaging clock\n");=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->avdd =3D devm_regulator_get_optional(dev, "avd=
d");=0A=
+=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov02c10->avdd)) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(ov02c10->avdd);=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->avdd =3D NULL;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret !=3D -ENODEV)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
dev_err_probe(dev, ret,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get av=
dd regulator\n");=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int ov02c10_power_off(struct device *dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(ov02c10->reset, 1);=0A=
+=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(ov02c10->handshake, 0);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->avdd)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D regulator_disable(ov02c=
10->avdd);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 clk_disable_unprepare(ov02c10->img_clk);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static int ov02c10_power_on(struct device *dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=A0=A0=A0=A0=A0=A0 int ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D clk_prepare_enable(ov02c10->img_clk);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to enable =
imaging clock: %d", ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->avdd) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D regulator_enable(ov02c1=
0->avdd);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err=
(dev, "failed to enable avdd: %d", ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clk_dis=
able_unprepare(ov02c10->img_clk);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
ret;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(ov02c10->handshake, 1);=0A=
+=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(ov02c10->reset, 0);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Lattice MIPI aggregator with some version FW needs l=
onger delay=0A=
+=A0=A0=A0=A0=A0=A0=A0 * after handshake triggered. We set 25ms as a safe v=
alue and wait=0A=
+=A0=A0=A0=A0=A0=A0=A0 * for a stable version FW.=0A=
+=A0=A0=A0=A0=A0=A0=A0 */=0A=
+=A0=A0=A0=A0=A0=A0 msleep_interruptible(25);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static int __maybe_unused ov02c10_suspend(struct device *dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D to_i2c_client(dev);=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=
=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_lock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->streaming)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10_stop_streaming(ov02c10)=
;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov02c10->mutex);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int __maybe_unused ov02c10_resume(struct device *dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D to_i2c_client(dev);=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=
=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_lock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 if (!ov02c10->streaming)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto exit;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_start_streaming(ov02c10);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->streaming =3D false;=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10_stop_streaming(ov02c10)=
;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+exit:=0A=
+=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static int ov02c10_set_format(struct v4l2_subdev *sd,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=A0=A0=A0=A0=A0=A0 const struct ov02c10_mode *mode;=0A=
+=A0=A0=A0=A0=A0=A0 s32 vblank_def, h_blank;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->mipi_lanes =3D=3D 1)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D &supported_modes[0];=
=0A=
+=A0=A0=A0=A0=A0=A0 else if (ov02c10->mipi_lanes =3D=3D 2)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D &supported_modes[1];=
=0A=
+=A0=A0=A0=A0=A0=A0 else=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D v4l2_find_nearest_size=
(supported_modes,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(sup=
ported_modes),=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 width, height,=
 fmt->format.width,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fmt->format.he=
ight);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_lock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10_update_pad_format(mode, &fmt->format);=0A=
+=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *v4l2_subdev_state_get_format(s=
d_state, fmt->pad) =3D fmt->format;=0A=
+=A0=A0=A0=A0=A0=A0 } else {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->cur_mode =3D mode;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_s_ctrl(ov02c10->lin=
k_freq, mode->link_freq_index);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_s_ctrl_int64(ov02c1=
0->pixel_rate, OV02C10_SCLK);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Update limits and set FPS to=
 default */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank_def =3D mode->vts_def - =
mode->height;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_modify_range(ov02c1=
0->vblank,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode->vts_min - mode->height,=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV02C10_VTS_MAX - mode->heigh=
t, 1,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank_def);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_s_ctrl(ov02c10->vbl=
ank, vblank_def);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 h_blank =3D mode->hts - mode->w=
idth;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_modify_range(ov02c1=
0->hblank, h_blank, h_blank, 1,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 h_blank);=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov02c10->mutex);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int ov02c10_get_format(struct v4l2_subdev *sd,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_lock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fmt->format =3D *v4l2_subdev_st=
ate_get_format(sd_state, fmt->pad);=0A=
+=A0=A0=A0=A0=A0=A0 else=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10_update_pad_format(ov02c=
10->cur_mode, &fmt->format);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov02c10->mutex);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int ov02c10_enum_mbus_code(struct v4l2_subdev *sd,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 if (code->index > 0)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int ov02c10_enum_frame_size(struct v4l2_subdev *sd,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_frame_size_enum *fse)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 if (fse->index >=3D ARRAY_SIZE(supported_modes))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (fse->code !=3D MEDIA_BUS_FMT_SGRBG10_1X10)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 fse->min_width =3D supported_modes[fse->index].width;=
=0A=
+=A0=A0=A0=A0=A0=A0 fse->max_width =3D fse->min_width;=0A=
+=A0=A0=A0=A0=A0=A0 fse->min_height =3D supported_modes[fse->index].height;=
=0A=
+=A0=A0=A0=A0=A0=A0 fse->max_height =3D fse->min_height;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int ov02c10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)=
=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_lock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10_update_pad_format(&supported_modes[0],=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 v4l2_subdev_state_get_format(fh->state, 0));=0A=
+=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static const struct v4l2_subdev_video_ops ov02c10_video_ops =3D {=0A=
+=A0=A0=A0=A0=A0=A0 .s_stream =3D ov02c10_set_stream,=0A=
+};=0A=
+=0A=
+static const struct v4l2_subdev_pad_ops ov02c10_pad_ops =3D {=0A=
+=A0=A0=A0=A0=A0=A0 .set_fmt =3D ov02c10_set_format,=0A=
+=A0=A0=A0=A0=A0=A0 .get_fmt =3D ov02c10_get_format,=0A=
+=A0=A0=A0=A0=A0=A0 .enum_mbus_code =3D ov02c10_enum_mbus_code,=0A=
+=A0=A0=A0=A0=A0=A0 .enum_frame_size =3D ov02c10_enum_frame_size,=0A=
+};=0A=
+=0A=
+static const struct v4l2_subdev_ops ov02c10_subdev_ops =3D {=0A=
+=A0=A0=A0=A0=A0=A0 .video =3D &ov02c10_video_ops,=0A=
+=A0=A0=A0=A0=A0=A0 .pad =3D &ov02c10_pad_ops,=0A=
+};=0A=
+=0A=
+static const struct media_entity_operations ov02c10_subdev_entity_ops =3D =
{=0A=
+=A0=A0=A0=A0=A0=A0 .link_validate =3D v4l2_subdev_link_validate,=0A=
+};=0A=
+=0A=
+static const struct v4l2_subdev_internal_ops ov02c10_internal_ops =3D {=0A=
+=A0=A0=A0=A0=A0=A0 .open =3D ov02c10_open,=0A=
+};=0A=
+=0A=
+static int ov02c10_read_mipi_lanes(struct ov02c10 *ov02c10, struct device =
*dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .bus_type =3D V4L2_MBUS_CSI2_DP=
HY=0A=
+=A0=A0=A0=A0=A0=A0 };=0A=
+=A0=A0=A0=A0=A0=A0 struct fwnode_handle *ep;=0A=
+=A0=A0=A0=A0=A0=A0 struct fwnode_handle *fwnode =3D dev_fwnode(dev);=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);=0A=
+=A0=A0=A0=A0=A0=A0 if (!ep)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=
=0A=
+=A0=A0=A0=A0=A0=A0 fwnode_handle_put(ep);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 2 &&=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bus_cfg.bus.mipi_csi2.num_data_lanes !=3D 4=
) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "number of CSI2 da=
ta lanes %d is not supported",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bus_cfg=
.bus.mipi_csi2.num_data_lanes);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return(-EINVAL);=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->mipi_lanes =3D bus_cfg.bus.mipi_csi2.num_data_=
lanes;=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static int ov02c10_identify_module(struct ov02c10 *ov02c10)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&ov02=
c10->sd);=0A=
+=A0=A0=A0=A0=A0=A0 u64 chip_id;=0A=
+=A0=A0=A0=A0=A0=A0 u32 ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->regmap =3D devm_cci_regmap_init_i2c(client, 16=
);=0A=
+=A0=A0=A0=A0=A0=A0 cci_read(ov02c10->regmap, OV02C10_REG_CHIP_ID, &chip_id=
, &ret);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (chip_id !=3D OV02C10_CHIP_ID) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "chip id =
mismatch: %x!=3D%llx",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV02C10=
_CHIP_ID, chip_id);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+}=0A=
+=0A=
+static int ov02c10_check_hwcfg(struct device *dev)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .bus_type =3D V4L2_MBUS_CSI2_DP=
HY=0A=
+=A0=A0=A0=A0=A0=A0 };=0A=
+=A0=A0=A0=A0=A0=A0 struct fwnode_handle *ep;=0A=
+=A0=A0=A0=A0=A0=A0 struct fwnode_handle *fwnode =3D dev_fwnode(dev);=0A=
+=A0=A0=A0=A0=A0=A0 unsigned int i, j;=0A=
+=A0=A0=A0=A0=A0=A0 int ret;=0A=
+=A0=A0=A0=A0=A0=A0 u32 ext_clk;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (!fwnode)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);=0A=
+=A0=A0=A0=A0=A0=A0 if (!ep)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EPROBE_DEFER;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D fwnode_property_read_u32(dev_fwnode(dev), "cloc=
k-frequency",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &ext_clk);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "can't get clock f=
requency");=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=
=0A=
+=A0=A0=A0=A0=A0=A0 fwnode_handle_put(ep);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (!bus_cfg.nr_of_link_frequencies) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "no link frequenci=
es defined");=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_err;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < ARRAY_SIZE(link_freq_menu_items); i++=
) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (j =3D 0; j < bus_cfg.nr_of=
_link_frequencies; j++) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (lin=
k_freq_menu_items[i] =3D=3D=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 bus_cfg.link_frequencies[j])=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 break;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (j =3D=3D bus_cfg.nr_of_link=
_frequencies) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err=
(dev, "no link frequency %lld supported",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 link_freq_menu_items[i]);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D=
 -EINVAL;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto ou=
t_err;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+out_err:=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static void ov02c10_remove(struct i2c_client *client)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=
=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10 =3D to_ov02c10(sd);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_async_unregister_subdev(sd);=0A=
+=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&sd->entity);=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
+=A0=A0=A0=A0=A0=A0 pm_runtime_disable(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0 mutex_destroy(&ov02c10->mutex);=0A=
+}=0A=
+=0A=
+static int ov02c10_probe(struct i2c_client *client)=0A=
+{=0A=
+=A0=A0=A0=A0=A0=A0 struct ov02c10 *ov02c10;=0A=
+=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /* Check HW config */=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_check_hwcfg(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o check hwcfg: %d", ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10 =3D devm_kzalloc(&client->dev, sizeof(*ov02c10)=
, GFP_KERNEL);=0A=
+=A0=A0=A0=A0=A0=A0 if (!ov02c10)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_sub=
dev_ops);=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10_get_pm_resources(&client->dev);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_power_on(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(&client->dev, ret=
, "failed to power on\n");=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_identify_module(ov02c10);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o find sensor: %d", ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto probe_error_ret;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_read_mipi_lanes(ov02c10, &client->dev);=
=0A=
+=A0=A0=A0=A0=A0=A0 if (ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto probe_error_ret;=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 mutex_init(&ov02c10->mutex);=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->cur_mode =3D &supported_modes[0];=0A=
+=A0=A0=A0=A0=A0=A0 if (ov02c10->mipi_lanes =3D=3D 2)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov02c10->cur_mode =3D &supporte=
d_modes[1];=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D ov02c10_init_controls(ov02c10);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o init controls: %d", ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto probe_error_v4l2_ctrl_hand=
ler_free;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->sd.internal_ops =3D &ov02c10_internal_ops;=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->sd.entity.ops =3D &ov02c10_subdev_entity_ops;=
=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=
=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D media_entity_pads_init(&ov02c10->sd.entity, 1, =
&ov02c10->pad);=0A=
+=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o init entity pads: %d", ret);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto probe_error_v4l2_ctrl_hand=
ler_free;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&ov02c10->sd)=
;=0A=
+=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed t=
o register V4L2 subdev: %d",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret);=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto probe_error_media_entity_c=
leanup;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 /*=0A=
+=A0=A0=A0=A0=A0=A0=A0 * Device is already turned on by i2c-core with ACPI =
domain PM.=0A=
+=A0=A0=A0=A0=A0=A0=A0 * Enable runtime PM and turn off the device.=0A=
+=A0=A0=A0=A0=A0=A0=A0 */=0A=
+=A0=A0=A0=A0=A0=A0 pm_runtime_set_active(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0 pm_runtime_enable(&client->dev);=0A=
+=A0=A0=A0=A0=A0=A0 pm_runtime_idle(&client->dev);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return 0;=0A=
+=0A=
+probe_error_media_entity_cleanup:=0A=
+=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&ov02c10->sd.entity);=0A=
+=0A=
+probe_error_v4l2_ctrl_handler_free:=0A=
+=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);=0A=
+=A0=A0=A0=A0=A0=A0 mutex_destroy(&ov02c10->mutex);=0A=
+=0A=
+probe_error_ret:=0A=
+=A0=A0=A0=A0=A0=A0 ov02c10_power_off(&client->dev);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 return ret;=0A=
+}=0A=
+=0A=
+static const struct dev_pm_ops ov02c10_pm_ops =3D {=0A=
+=A0=A0=A0=A0=A0=A0 SET_SYSTEM_SLEEP_PM_OPS(ov02c10_suspend, ov02c10_resume=
)=0A=
+=A0=A0=A0=A0=A0=A0 SET_RUNTIME_PM_OPS(ov02c10_power_off, ov02c10_power_on,=
 NULL)=0A=
+};=0A=
+=0A=
+#ifdef CONFIG_ACPI=0A=
+static const struct acpi_device_id ov02c10_acpi_ids[] =3D {=0A=
+=A0=A0=A0=A0=A0=A0 {"OVTI02C1"},=0A=
+=A0=A0=A0=A0=A0=A0 {}=0A=
+};=0A=
+=0A=
+MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);=0A=
+#endif=0A=
+=0A=
+static struct i2c_driver ov02c10_i2c_driver =3D {=0A=
+=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "ov02c10",=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D &ov02c10_pm_ops,=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .acpi_match_table =3D ACPI_PTR(=
ov02c10_acpi_ids),=0A=
+=A0=A0=A0=A0=A0=A0 },=0A=
+=A0=A0=A0=A0=A0=A0 .probe =3D ov02c10_probe,=0A=
+=A0=A0=A0=A0=A0=A0 .remove =3D ov02c10_remove,=0A=
+};=0A=
+=0A=
+module_i2c_driver(ov02c10_i2c_driver);=0A=
+=0A=
+MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");=0A=
+MODULE_DESCRIPTION("OmniVision OV02C10 sensor driver");=0A=
+MODULE_LICENSE("GPL");=0A=
--=0A=
2.47.0=0A=
=0A=

