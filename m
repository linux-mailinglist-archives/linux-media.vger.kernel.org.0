Return-Path: <linux-media+bounces-18696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7163988575
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 14:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E93FF1C2370C
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811EE18C01D;
	Fri, 27 Sep 2024 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gCFW8iqJ"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30476185931
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441206; cv=fail; b=dYATzawQH1Tckj4eVXTQc15/un+znbXdQEDwCSwz5HJG29ZS9jSzOx8dehmvmdC1ylJCFZX9BxVGKQcyqAShYdmgyzsAfOFrKJi9kZf1S/RPsH0cXpL02MKM/ytZl4Kh1qS+g1sXxRtQWS5YeCIE6Dl/zFnodNHr8oLjuzZdnY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441206; c=relaxed/simple;
	bh=m60Vg0M7SR+pMH+AW6dVjLg8R/HQUVBsJso9cz/NpyM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SJJe/J+0C0cPzpYdnR9kvtGnWhJA2Q5JjrZ/KXo85maPXcJI998a+dO9rfFT2Yvs9K+4zWCaCV1ft3Um/wBWM0fFatSUlQz0Gr1pnUkJ8oQF82z+OkjVYLFxKf58b7cA1f5K3x6JUuf0SXWYI4GxlNKQwxQGIgzTv4+3oHjD14s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gCFW8iqJ; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCRfgcIp4RAVRY5CLl1Mmk34z/tX6d/qUXTP/barMqMN8aeFYnHDf/KQrqLmEBNIv5WJYIA65lcNIdfZLFCI4tuo+xodUObXZojiGB591rR72cZ/N/EjiMwG2e/1qhcE3/JwpZzItvtYq5icQWlpPdWRZxpEkygcUvRhPL5kllrjuRFrxHED0erTt6vaZ2kxfULXffrJ35yEqPUf5foyOHpw7EAI83EQ5o6ZvK3pExOtQFUAxVjKlobCC38RymJgXvkJIuflVbaI7jneszHKyEfxApX05uhP10VUkZIvuDu/5D+m+GoNn7ELtbj7Tqeemcg9JN5Ufvj3XJLBtkz28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IUDwcLm+9cKHV1mi7EZooyfzDlEtrkxmj14ei0Pj6Q=;
 b=jA3gTS8CCPzX/jMgDj9BZsCYlozze6RVdAzEq+O5gN6DD+eb12cTmAPWZpIMPt792G9XJurU43UsAmIZP7bKLVTz58tPT73+RJhaUW8gyDwzJoQx7w+4vQ1WuftKQeUe5a+gYhTU/3F1rk3hA0TMouyKAfoqqYwNXkeqHiV+Jp+LoB0B44JyyRhbKFGZFq1oQZblOfae5C9x+BlvQapXmPisp14P3pWuR+NxDL8hTqEmUAVaDPrm2uMGb0VGW6RkKwYVtHKBG3ta2w610R2nHfcIEd5CkSuiDysPckc5HHmM4QOpkgEQRwLb+HL/6Ly9xKPuXMCHmOuJX6vhIlWmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IUDwcLm+9cKHV1mi7EZooyfzDlEtrkxmj14ei0Pj6Q=;
 b=gCFW8iqJykl+Unn76bCFKRFNC/72lmxu1LjPV+wNqaKJcE7xn6CXcoLPV9tS13BF/WvSbxbOOQDwbQykdz3SDsMgJY5lqxBwXr58GBYYHkrlf/APkHMrCneNBSU0ImnilezaA6vn4Tz/M51Uz/OMGOXiNjSi/4lyCKr1EHvA/YA=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSCPR01MB13142.jpnprd01.prod.outlook.com (2603:1096:604:354::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 12:46:40 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 12:46:40 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>
Subject: RE: [PATCH 2/4] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Thread-Topic: [PATCH 2/4] media: platform: rzg2l-cru: Use v4l2_get_link_freq()
Thread-Index: AQHbC1pxFt1UHrlYMU6rFp0HCPYrXbJrnomw
Date: Fri, 27 Sep 2024 12:46:40 +0000
Message-ID:
 <OSZPR01MB70192294DF1A7907395A2257AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-3-dan.scally@ideasonboard.com>
In-Reply-To: <20240920124115.375748-3-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|OSCPR01MB13142:EE_
x-ms-office365-filtering-correlation-id: e1e1409e-a8b0-476c-5e35-08dcdef26eb5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yIn0U7hXhU8Ov5hqvuU1OqK3jAtAoSEB8O3+xtWjzZXvt19R7UO46GUKNvRn?=
 =?us-ascii?Q?vRMZbwgWL4vZKj9jusJeWiJO7C+GJNZUrldKcFP6dbAfDfTD880jxgFnQQNi?=
 =?us-ascii?Q?l+GY0nIsyYOIKJ++e7EQzkLIJ2BMXAArfg1J/Ghj7DVYOyM/scw9D9zdEoir?=
 =?us-ascii?Q?RwkSo9jAI8qEB/Zo10Z3GmqRrFNJpkfO2lQoX+rTYW6PTVDlSdSGIcsfyzdh?=
 =?us-ascii?Q?+d8v1MBtm0NEDV20pJLxQPJj+YyANLOLxZe8d0YWLRGHE9ETX0mQPjRatmy3?=
 =?us-ascii?Q?mY8IuWurN7P6weQNIUhNCd0Jv6yy4CYhNiYbOSSP3X8+T2VIq5RcOAyhJ4Xp?=
 =?us-ascii?Q?ICsO+7UyGOPYl5KSfqpaTlzGxA4+IjdP5Izoh6cKFtPDhwfyf+dmTaqwSL/+?=
 =?us-ascii?Q?zjq4mvQTRJRScYEjRldwLmP9qxfYXhEx81Ad6Edw9rpKvgW27Rp1uZvs82Kt?=
 =?us-ascii?Q?oBlOOm97+IyXx1yrxaqTBk4qaKsdtT8mMgRV8cU6Om5HQq3WfQW8Br2+1cSO?=
 =?us-ascii?Q?bMmyjrrHcGfAK+N2ctcIY70xGNZQiZ/QJ/lnMmdwvmyUwXPlHRy6nGBbgcTY?=
 =?us-ascii?Q?uXSCwtCUCY/YKIhIVGIG6YuqR1zAAAEZq+G95q8uWtML0bSUL1gJJMrhMTfQ?=
 =?us-ascii?Q?iT36FZWLcVmap92YQ1/4ZK0mihJQ9Dn1wzeyzJHHqBymjfzU73ci1xm9Xp8S?=
 =?us-ascii?Q?szsSLJ8gA3rXgw2otKwZOABSA48f163DrFpCWhB81VqaSwf+ZwFBCeOUxMBc?=
 =?us-ascii?Q?IUTWJrOcaF/cIKpPqei980/dPnjbnUD1kP0C7nWuFp5QrgOlVloAUwg9oKVn?=
 =?us-ascii?Q?bzUGzLCr4bhrEOil1yYoEwcw9wj75afQ9xWdl09LTHlePK2oNsAWggLWp4SP?=
 =?us-ascii?Q?NR1MpoCzdezFb3IpdTbpCZOZjsG3f66vF5KJn/ZnaUcVKypU8nBsT9n3w63I?=
 =?us-ascii?Q?j1zyJWOi0LXirhy9K5CBZMXYEG21apT2mXuVvTEDID6mbEzAtdP8ggtz+ebW?=
 =?us-ascii?Q?St9mru/xDI8hwJ+hI4cVV/sntjAm7z9omQy4rOpPNUpygzkZgY7SpmzA5ODD?=
 =?us-ascii?Q?vuKw3ZeLYUbc8IFQdmbFLTdJAW9fmRGQZ1eWmS67JYRAyJuIv/3hRrkmrvKe?=
 =?us-ascii?Q?a7mU79dUR8GyTQZZEjrYJbQ+EyBN51J3ZlWq3+AKyOPUeUgZMuGB5JBrB3OV?=
 =?us-ascii?Q?BnxNqxpt4YUltNl6wmY9lf1g0NsrHYHfBnYozUzwDVPl5Y96ERg91SG1SdlH?=
 =?us-ascii?Q?pDG64c7srqju7Mi4gHO2rOmQzfQpQm+SOdhZ2T1egUdA7QfFb1JMQVv+fB8M?=
 =?us-ascii?Q?IBZP0I0Di0nO5HwNuhJZ0u9Vz5O9ehGLyam4edzWg+YeDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rwswPBmAwEki214aZ9m+24uzYpNfHTePlq6MqAdcUHQAPh8tbpq6PsIRELzx?=
 =?us-ascii?Q?5cupshdF6uVrUU20wN5SYj300GMuMsCkYkOYZslFn/tW7melmR14LUI4A5MT?=
 =?us-ascii?Q?s8yUF75kb4wncST0PJLFjsOSo4GnFw7JGZLlwgmPBdwlDhosYzVzrPbfbFe+?=
 =?us-ascii?Q?leVLSUvpwpShK04PUhby7ixj8+m30PmHfpnbhEDgUcpe5T61fVvEzzNkxTsc?=
 =?us-ascii?Q?2IGQYzphPhKdZkN0VJZMQ8chKLjdRHVdB9axQ0zvOfwnPRn72lEIxxvtzidE?=
 =?us-ascii?Q?pQh0kKq7T/s2KO22PMh7EU5OX/5g1m1tRBs3D+0acMtbW0sIydUF/ZTJXQWP?=
 =?us-ascii?Q?Oc6auA640fcPcjMbRIdZJYhXIMAOWDbbp9VmxQRcwSDT86Yp+vr6h4YZJnbZ?=
 =?us-ascii?Q?qZwLzVOAFSbGIDXSBdUm+AH8j9PyhEOxPKm+tMiL1KAG0HBSfSYu/dlyYDXB?=
 =?us-ascii?Q?dPKFGiBQ3Fdrx2ADwvKvozqOaUfUg+o1SXODfGU+vVkbft+l3AQpHmVWa3yz?=
 =?us-ascii?Q?qiRA1R35hIQq4R5Q/piYF3v0zYRnqOiQVvR96ASxVcR0y09AfzFb14WSeXLs?=
 =?us-ascii?Q?kQ47KdU4UwAad1CMxAGZlXoNJ72ye2bGDci9u1CBNpO6m+SySgvQF7z3eKsS?=
 =?us-ascii?Q?ZgzXZYKr177ubFu47s0XO5ah6TiizPdNQ42n4V7gOxRYNxpc4h+pK8NOotsc?=
 =?us-ascii?Q?Ad5JmvwtGVRiUF98KpM5FDyogl5cjZvgdmcCqIq47ATji/uuqPtxDqwcu5UR?=
 =?us-ascii?Q?y9FUENDA3Z3g78iaLECJlMKF7Jl8Cb0mt0PofVb4PQKXM5tt4F0smTqAiQ5F?=
 =?us-ascii?Q?CWJue5BBOTjk1jIghXPc7UcRynPhxXinjZgVXQdrPLN28eDf+tRaV7vy0rYS?=
 =?us-ascii?Q?u+1+pCtqU05FeDOLe0Kpgh3s6vOEgSnH5mbMlzzYHVLQ8/hQ2Ut1WH8Jjt/n?=
 =?us-ascii?Q?3AiJjbRsvt/TcTC+AEQWLDelFiFR7wsFDQOlowIAz2Hfn/Uc0tnTs3mrXf/X?=
 =?us-ascii?Q?3HxGEpx5GvlxE8c6t/EnHlfosCprjbxriftXWlZtRKaSzu3vnW1ji/wxgv4p?=
 =?us-ascii?Q?iEI6eXgbxxMR7AKfEXr3lz9x90sQqIz8exvHaWXr62qWIVtdUg6hO4+INTL7?=
 =?us-ascii?Q?Jalwiec/MrQxHxcU5Ml/CbgYZHoixM7ljVQLNRSt0D06rBhYt8DQJ4p/hKyj?=
 =?us-ascii?Q?5hqfK9lcHmNPq1BiKT3e9IX1dLepJSZJriAZvZ0Hig6CcRY6Z5vQ472eoi97?=
 =?us-ascii?Q?snKBsmHjEhkg9z5szscYLqUWUFq6tuTfmLnpDYgPE+OGs04RoMLANZHEO9In?=
 =?us-ascii?Q?RTLRYNGY+kzHSUec9H9pAvVThSgN13r9RmwL1Ub1HHa+//Je0Amaq/PNlIsg?=
 =?us-ascii?Q?8XbHqKSPt+Wx3i+zwIICh2IIQcQKcBEgIEA5AxRWRgIYK0ASYaSiehfCNpH/?=
 =?us-ascii?Q?3hS+/Sg599QRDEaMKt0R6f3p2oyFjbP/EvrAPAfdoJEU/bHPJzksovjIVaUx?=
 =?us-ascii?Q?1t3W+semddYTjAEpy9x6n1JErL3/7J/owiQlgpxcdUdXhD4NHKP+M2FZ8e+4?=
 =?us-ascii?Q?VMZ/2Fm5ozCu3QIKmcSkWFSBfJrJ71zKkhR46b//sh2MTsUOc7Ujl+CvPaPy?=
 =?us-ascii?Q?rMQyKPLZmlqryPZi+pbcGWM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e1409e-a8b0-476c-5e35-08dcdef26eb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 12:46:40.0515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gBiaqJqgiGJ6GPPXP8Q8FUeB8lww/m/drOITaVtzVZSze9KGCweKiq9mGjplDBDgj+8x24J5XQ6ufZJ38fxkMlMjGvJ87nUSJASdY3Nu+owl7cQ6hLxo9J5t9Zb29Eil
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13142

Hi Daniel,

Thank you for the patch.

> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> The rzg2l_csi2_calc_mbps() function currently tries to calculate the link
> frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control of the
> remote subdevice. Switch the function to v4l2_get_link_freq() which
> correctly targets V4L2_CID_LINK_FREQ before falling back on
> V4L2_CID_PIXEL_RATE if the former is unavailable.
>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 25 ++++++++-----------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>=20

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index d46f0bd10cec..9609ca2a2f67 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -242,28 +242,23 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2
> *csi2)
>  	const struct rzg2l_csi2_format *format;
>  	const struct v4l2_mbus_framefmt *fmt;
>  	struct v4l2_subdev_state *state;
> -	struct v4l2_ctrl *ctrl;
>  	u64 mbps;
>=20
> -	/* Read the pixel rate control from remote. */
> -	ctrl =3D v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> -	if (!ctrl) {
> -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> -			source->name);
> -		return -EINVAL;
> -	}
> -
>  	state =3D v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>  	fmt =3D v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>  	format =3D rzg2l_csi2_code_to_fmt(fmt->code);
>  	v4l2_subdev_unlock_state(state);
>=20
> -	/*
> -	 * Calculate hsfreq in Mbps
> -	 * hsfreq =3D (pixel_rate * bits_per_sample) / number_of_lanes
> -	 */
> -	mbps =3D v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> -	do_div(mbps, csi2->lanes * 1000000);
> +	/* Read the link frequency from remote subdevice. */
> +	mbps =3D v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> +				  csi2->lanes);
> +	if (mbps < 0) {
> +		dev_err(csi2->dev, "can't retrieve link freq from subdev
> %s\n",
> +			source->name);
> +		return -EINVAL;
> +	}
> +
> +	do_div(mbps, 1000000);
>=20
>  	return mbps;
>  }
> --
> 2.34.1


