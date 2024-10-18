Return-Path: <linux-media+bounces-19811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C112C9A31E8
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 03:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80B192846A6
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 01:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B8C5336E;
	Fri, 18 Oct 2024 01:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lKJGijsS"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F68620E31E;
	Fri, 18 Oct 2024 01:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729214345; cv=fail; b=n8dJ+jxKah6+w7lzXl5tXhoj5vaaLV36dmZ2g2rGNxFW4Fpg03jGA6cYfXaItlf+vDFcox4fAaae6GjJFzEXzIV/fU4bbMeBceZPKq0hm/MbrhVey6ipGraR51DVargJuJIRrFCirOGvDz8BWzFOtXLPSyvKLqcTinc5A4A5H6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729214345; c=relaxed/simple;
	bh=CgQfVgYzPyWA3joqOLutORn80jV7WdlEgmPwluyDWnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mtzelJU0lKwc0gbolb8t5EcabHSTniwNPk0kgBDS71DAyZye7LgCUYI3sML5hC390ftccqMOROQopLTlOaBGJQ0dKMBFYx1M4MkmdxQmqqoJ/DRaL7hnlppNI/GE0j/dT6yrVdUOU8JtY1VWJsw5jCyfQNuT0Jymmkn0+fVIaKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lKJGijsS; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCuKQlJ+uN0U+7I+byeyRTItmChmUFhWI7lIgDacYAgLDoc7z+EwqSnz3fLWkCfkNHEVziL2K9fppTlK7NSaqGMGJ4Pgt+KnpfYRyOweZWSqA4uVVivnmflleY38hhAnRfwdN4zsrKl63MhgvNWDWAaG3h6nd68mp/FJjo8JcJu2Eq4ee7+oY7QMXfNMa0/6O3tWtBTLkqkfd3Br4TgTdyA7b9jYErWCzIzRYk6cFkIzhnxGVCstn9tHtIXpPtNV+lthD64UhRknOXemtukjSoQ/H86nSj2XZGLQs94HI5KDDXwenW/8xyyEA6KDQ03vF01D8UJ8WWcbR4EyHbQWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J70SfSjGMpe8fOfkPK77EAwEFI4m2UQjeBWfmNrzHz4=;
 b=XzUqJInk4kSd5q/tMpEt2Q8TGE48JBXuMcaM/C5CZkxIo2SCj4bRZrdSztGcCKeugtrIGIgYIWDlX11jGJi0yInYwMSXC72Yup0df0/zuy1Gpyqjo/K+Q9cr00gBvocCUCy5+IQAgbVpDndBmhazVA9M2UbrJhZo5aFZD/yBv/R7AfFJ288HrJkBNlXtBommllDZGWlkQ0yyWetda5SyYpMBZPun5KUb1dX4Dc43WWxSoYAeanhqjA0mEiiAr3drv6oqn8N4QEzKiQ9PsZi0bSUnwGi7IXCrHETdbp94Cefp0a83z+WCNj8czv1/Tx5CaWW/XwWtpSYBwHd8DjeuMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J70SfSjGMpe8fOfkPK77EAwEFI4m2UQjeBWfmNrzHz4=;
 b=lKJGijsSwdtJsWWGmZyVIeIc6qxRf03T6oVPUp5wzZpQ2YvxSdndS3TlzrgslBKE+MMyt8XMArsyQ/2mibMsHQorZ4EH9R5rCHpd+f/1VSgmDD1gBACwWvGLNBYYaBQP22M8ew94BhqEky9ooy0BvnRMJT7m6iIHNXXcgc8kc90F4CFSV6m6h3FZxATuBkDUC+/byq5ab65/mmGiAwfqbRMz2K5yBpYjC9skIQ/+Us0Cu1fURhEAtJUREPU+XvNIxA9WDkTZRTAqFBQ9wQC5z1LLiRBRTAfX/icuvMcRyJSZOMYlxWFhaxX6U3x0U1Cx/aBj4J0dsvPSgQi3LKDwTQ==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PR3PR04MB7450.eurprd04.prod.outlook.com (2603:10a6:102:8a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Fri, 18 Oct
 2024 01:19:00 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 01:19:00 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Mirela Rabulea <mirela.rabulea@nxp.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, Tao
 Jiang <tao.jiang_2@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [EXT] [PATCH v2 next] media: imx-jpeg: Fix potential error
 pointer dereference in detach_pm()
Thread-Topic: [EXT] [PATCH v2 next] media: imx-jpeg: Fix potential error
 pointer dereference in detach_pm()
Thread-Index: AQHbINP0obZaVqm3kkiGXw967DsIHrKLtV0A
Date: Fri, 18 Oct 2024 01:18:59 +0000
Message-ID:
 <PAXPR04MB825417A4E1A4B9A9381BA791E7402@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <ZxF0yOCms6cldOlV@stanley.mountain>
In-Reply-To: <ZxF0yOCms6cldOlV@stanley.mountain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|PR3PR04MB7450:EE_
x-ms-office365-filtering-correlation-id: e589c059-f1a4-49fe-810b-08dcef12d888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gQ2oiglf03hAFU/ipFQYINrQunyoywHScmnUifWRhanZVCjB5LaWTNOMnepY?=
 =?us-ascii?Q?QHnHuXizLbqJI6clB6EIqIK0ISTvGUZmMqUq5qxMd112f+Ppx6aURBegDzao?=
 =?us-ascii?Q?jAR3Aq1QJ+hoHKN1nMxohZPcewdE3hEoeGqWGpWKorO9NqnhA2AamoKmxEyE?=
 =?us-ascii?Q?/NYPJgTkDakyxeXm8y3q5DKbVIGAgh/CvP9nKYFFnK9fjEQ4WPGpMwjUdQLD?=
 =?us-ascii?Q?ztS37ARHc0uD1cHCtOi2ydEstNUUkrkXUQjU97zNfHKEI+4fDjIl2AdKnwg0?=
 =?us-ascii?Q?I+8kd1fFyrUIVq8doPoj8ybgKxN/KvS4Q3yRNt1s5UhDqjclYKBgkfd/sCq1?=
 =?us-ascii?Q?u0SuWE9LixLos+U0CZ5CT0fMAZm9nDPvmhydQUAIi3S4D63Q3BN2LW0f5rwA?=
 =?us-ascii?Q?bSkX+LJtP6vr2+WHJh/bEn6wauYpa/59Rn8Kd8U6rJTweZXZ9NEBzxueI+a8?=
 =?us-ascii?Q?XwSU7CDXZyOKavCZHErFP04oE2xjUHgEh3OCQtK4tcgXDRNvW12fHKmqeCq6?=
 =?us-ascii?Q?234O9r1R7AJRvoBPz4PbARcIM84HcNcjKo2T/ePy4AiRsMVsRNKmzfHejFi8?=
 =?us-ascii?Q?10sOZ4/P838jpP5Ed0WXusIWQq541dk4ANPPayvgSXXDS+hkrCRt2HGn1P1P?=
 =?us-ascii?Q?umrtxaie/XInCnwEISl+G5DRHjTVdc9aHLrHZLyflXVdnWsGvX0CzZPmqPfU?=
 =?us-ascii?Q?livq7JduHSQjvG8LR0KcvPzYi1Rg1BeS8mO6IiQZv5HAOkzQMfoqSZEIXM/N?=
 =?us-ascii?Q?C6y3kWZxlHH25IpX1uiIIsT1hVPR21RIp6LyAkmUPFV+HwGlGseJsovOG0UI?=
 =?us-ascii?Q?NXVcsc0d/nLaTkXg+88OIZGP5fASNtetSy3HjZV4+spJ+euj8kH++X50qTha?=
 =?us-ascii?Q?spiwHvl0q2pZX4gry168ioBR7Sle/CfjZhQVwKq4JrvtDMxzsgpULXek3Thv?=
 =?us-ascii?Q?pkNRPPWy6fncxKmH2k738kDCpM3InTcCws/hrtAoFMtSGiIhEZy0IEs7NX7Z?=
 =?us-ascii?Q?gxUTvJJF8DdOYU91yqaISM7Kt+yZ+zWjZIXWNiAR1u12LtYq/x4uawpE4E7Q?=
 =?us-ascii?Q?VhgZN3IIIxZhAARADiZjyQZcga2llgCNAgJuabwtCX7c+Vp4Q5CEijDtzvUm?=
 =?us-ascii?Q?eqEN9V71dJa06+mNgNNC2r6P3i1VROdgHUv3kGi7YT57SrbdFv3528O78FIy?=
 =?us-ascii?Q?/B2W3AB+6omjOyhLskMrqaMPp5jAPZ2T4W8u0kVgPHCMpx9WJRJOh0n4/3yB?=
 =?us-ascii?Q?LE/eoltv4wEE66JHEcmdCsHlxYmmKSA/5PvplNhpS2AIlidB8RnMvNH8Ry+f?=
 =?us-ascii?Q?XguJjhGITAZ60yWuVHVsQWTamnCFL0dTWYCvfVaG6YbAYSetmoF3sT9R3ajG?=
 =?us-ascii?Q?phrXKU4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CYB0DUP5x/wDpSqwgCoDJU7vovi1bpNzBKj9MAiEPN6iVWrSZPStGrVXiWqa?=
 =?us-ascii?Q?xpFRwsjaJUhmujCVOdPPowyYPfEXBjRdA25Yap8B9KkvAvhcy8bgPOEhlOq3?=
 =?us-ascii?Q?yFHJ8oPgBE+7COteFNQ1Zev7veirpe1Q2VFSOcE4Gz5qrux2Bn2XQ+kIuvSx?=
 =?us-ascii?Q?C06Y8XvzoopvPGyRj0ahn8oYZmybLCajNJ3ra6UTJ/TqrVJX2QqdFVk2gHRj?=
 =?us-ascii?Q?66/A8UVQSz6x/1noUcBkFEqenNtMXh7RzF5Thd/d3UxuUkLsWROOiTpdh39A?=
 =?us-ascii?Q?wlm7yCAtGXfI4qZ6/zBlJZYCj8SI3r9PeWOZOc4aEZU0+KAudfT3YFp4qkoQ?=
 =?us-ascii?Q?MvRpOAYCh9ciO7vpLXfW/uXx1Jci3SrZivC9ZVbs+qFRl3Z7RQtF83X4Mnlw?=
 =?us-ascii?Q?G2YFvqvEo6HHlsqRAnzMGcJ3QQvNaMy8xz2DEQo68RcN0e1WEnzqdwN/Gyh5?=
 =?us-ascii?Q?uVFRJzWSr9y8BBWh6T0Lt6B5+Z4hEZBhRAa7hjQpzE4x7oQu0fXyz8Rj6ZRZ?=
 =?us-ascii?Q?FRIChG+mUm5OrT2dxnbbPbiXyvL7d05oQkDY4s9nCY/gDdN/hMWM+6Xd7cte?=
 =?us-ascii?Q?13sPY/2V9oYIs0EXzkeVtJxmKy2COAs7n4KaXQPUaghDzQmX224YIzqvk0ah?=
 =?us-ascii?Q?Ef0GwCZDbKsvjE3BvR/3dNr9XqbW7zAdzEXLXNKKbPD/UFFtVbuIu3TM8heU?=
 =?us-ascii?Q?LXEQPDgCtlE68GfId4+ZZogRx9sWi7hN0uMBJl7hyViuKmqpZQZuoaLrpkJI?=
 =?us-ascii?Q?ykLLxcT7w4JXlPkUyDJoHy5Vh3Wv/xX0VuPW4gu+7m08jCnOu2vc0k3FrQQs?=
 =?us-ascii?Q?oJAlEa1bvbFDG+/rLlYjnxh+acyAv++vvyFybKXaelQfE0MrUvhnP0MbY+Qz?=
 =?us-ascii?Q?MkOZxGd4UvSHHBuN1JuH7mdEmZ3szW1gZbJKiUFaxNZFmhXT0CiqGkdXsthz?=
 =?us-ascii?Q?ocIVN5b6B8n+YSGn76L7svg6zCewvI/kAHENp+vKytmffFy70SjxxYYP+qae?=
 =?us-ascii?Q?OPuUTvo6QjJu1B3Nq59dteay94JDRAQUJzDgi1mMEMr3Cl+5HbXySkDYnjFQ?=
 =?us-ascii?Q?b/emU3qADUjfyiHmVc2dcBEMAccqZ+khXgegNXnMHgCz6GdZ7xvnvAnu93X6?=
 =?us-ascii?Q?qv1N5haYUY9iUhgopW4IRel3vmuEJWMyKAv7H6k+7AgQcr1Z8O3Ggo4cXBB5?=
 =?us-ascii?Q?Mw6iba8JZKMEWDedgZSV4sya3K/bDjor0Yq+w0Wo6SSJn5diqmDKfq6dNqul?=
 =?us-ascii?Q?C+BVG5DEmxxFHn5azdM4wv8RrQYGguXOGbyGUMQYWBhuukpb9Ji+6/PZDXiX?=
 =?us-ascii?Q?FTPu8+O4jFeMUXlvXCHpqa4YYdoYfwGAyWT+/Pr4//a1ecdMcLII2N7rdhcn?=
 =?us-ascii?Q?4ArtmHFCmu8IRpUnf4GdWK9Tm65b5SPH2Wdex6GNwJyNk2QJHtO/2TnyxvPE?=
 =?us-ascii?Q?K51G7Qav0MZoMISSJQpMbSm81nkwUzx7voIGKh+5kEF0BhVgDE5MeQjqInew?=
 =?us-ascii?Q?+yk4VqEO24gifAjfYmAk5WTtmwt6m5DjM3qHhlYNy6baGFJdtPlgtcSciYrG?=
 =?us-ascii?Q?DyNfEIjNxTlSH71WFMY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e589c059-f1a4-49fe-810b-08dcef12d888
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 01:19:00.0829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BHBqkel6xVfl8jYPXT4K7P8nGgxlhbakpyaE5aMIKyfD+L/D4hKm71ppfWBjMnQ/ydenCrwMGTvaEaQFo1fpUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7450

>The proble is on the first line:
>
>        if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))
>
>If jpeg->pd_dev[i] is an error pointer, then passing it to
>pm_runtime_suspended() will lead to an Oops.  The other conditions check f=
or
>both error pointers and NULL, but it would be more clear to use the
>IS_ERR_OR_NULL() check for that.
>
>Fixes: fd0af4cd35da ("media: imx-jpeg: Ensure power suppliers be suspended
>before detach them")
>Cc: <stable@vger.kernel.org>
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Ming Qian <ming.qian@nxp.com>

>---
>v2: The buggy patch hasn't hit Linus's tree yet, but it's destined for sta=
ble so
>    add a stable tag to this too.
>
> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>index d8e946aebba2..918ab12edc9e 100644
>--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>@@ -2679,11 +2679,12 @@ static void mxc_jpeg_detach_pm_domains(struct
>mxc_jpeg_dev *jpeg)
>        int i;
>
>        for (i =3D 0; i < jpeg->num_domains; i++) {
>-               if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[=
i]))
>+               if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]) &&
>+                   !pm_runtime_suspended(jpeg->pd_dev[i]))
>                        pm_runtime_force_suspend(jpeg->pd_dev[i]);
>-               if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
>+               if (!IS_ERR_OR_NULL(jpeg->pd_link[i]))
>                        device_link_del(jpeg->pd_link[i]);
>-               if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
>+               if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]))
>                        dev_pm_domain_detach(jpeg->pd_dev[i], true);
>                jpeg->pd_dev[i] =3D NULL;
>                jpeg->pd_link[i] =3D NULL;
>--
>2.45.2


