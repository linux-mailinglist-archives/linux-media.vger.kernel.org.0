Return-Path: <linux-media+bounces-28844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A10A72E3F
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E90131899741
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749C620F066;
	Thu, 27 Mar 2025 10:54:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021114.outbound.protection.outlook.com [40.107.51.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117F186A;
	Thu, 27 Mar 2025 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072897; cv=fail; b=sPs1yhv61zfIVW8jZ3f2VGVmY7prB9SMk6njiUfgJB9MFLawJnZq62rR2LIUIngYvjy+5zdEdawGLy3+33RxXvr1oRxQSPi4RD/4/ajxoH8IEVoU0RiecYnquknxYoIFyWaz18cw8GlVLCodgYcZOLrewung8r79nCa77pWpWi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072897; c=relaxed/simple;
	bh=/LolEmuCR/A0QlFytMHHnMlGkVG8TFIXzIgYe8v7ZB8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LY51TGoE4+Q+cd3HynHkoFd5CeMCnNsV8wXrBnCdTfx43GLuJH7WSFo6PBkHmr65fPHif3mwASfas8mXotj0dhRG+ScrD2uar9wOTqPywiTo8C87fS0PB4niXQTIJrSshtNa6PUpwuTnRrIil4lvYzHerL4wRN0Ho2rX9lyTUVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cq+c8iMVw1AFYZBz1i/kEX90Dj198o5NTDlyjhgDKqeNt6axefXbnhrZD1RnymlniQIpWV+/7K5YO1scyLVokg58DvGoDSnNPA0hyFftpYRRAcDWpyKxffNz56SiZ82Jy/DlyW+HCBvNy0vgXiDxmNlJY9+dSob+04oWZcLzsWZEKdngdZ1JG6pcx1SSmZNHiVxXZHobTy56dUgmM2n0YTnn4iQzIglqOd5/OS7fUELuqHa0cZNqdVSfzflJZjOGNoCClXGP4LDNQE9G+1l3/EDnWtvZjoX65VUvZ+c8MnGZB6obNygWhgEHnBR0BNVYiG8uSE0bTof4de44kaRiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LolEmuCR/A0QlFytMHHnMlGkVG8TFIXzIgYe8v7ZB8=;
 b=e6+7bs9W+ErO1EyGN2R7mbHNRj4xv8MvpTBqz25idbdLJl9kj8clQJwYH/SFYguKsqdeOM4qsTt44Tz0yE51ivkImiACsB5DI0hxwkqUs2xkhWqg/rtorT9YB//sk4sRkCtvzz3dQSAZuiaeiU9849l/fMI0zVJFBSroKrHnpKJKqR68qk+WxhoR79+JO2mDC+G68/DMkXUI+nVUm02D6A4PlDJUXmBU9O2mhPqwTFrlCxPkDksmvVyUBAFEwlrffc8cpAiNHzeD3ES7IFWKmsbCAq4avILg0r+zV4OChHxn5m7CdnbnOxxAEq66+m2nNEMZqGi1rCZYwnv+5cp2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0542.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:54:50 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 10:54:50 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
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
Thread-Index: AQHbkYze21WXVq2lI0WizvQdhNA/mLOG3YiAgAAHtdU=
Date: Thu, 27 Mar 2025 10:54:50 +0000
Message-ID:
 <PN3P287MB18292A67AC52F0D877D480AF8BA12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-5-tarang.raval@siliconsignals.io>
 <Z-Uj1VnLKQH09__5@kekkonen.localdomain>
In-Reply-To: <Z-Uj1VnLKQH09__5@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAZP287MB0542:EE_
x-ms-office365-filtering-correlation-id: 13eeeafb-40d1-4750-debd-08dd6d1dcc2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7vOwS2Jm9EKyO7SdgrPuM8GIsl7tuqbl50ElOj0Pj4HxrHLKqLzDdpKwE4?=
 =?iso-8859-1?Q?kuB5BnbJVdTiUUtkdWLm7sDpgBIHcymopKwifhrm/TAkbiE1vA0NuYI5B/?=
 =?iso-8859-1?Q?dSTp/KN3PXY9Ua/YubDYxWlSrfICKUbIhsF+CWeA6JyrjmSURkMPSAdv3Y?=
 =?iso-8859-1?Q?MaAt3srDwO1BiCmPkQOJWGFTya94gAv9oRrJ+E0QaB9HWtAKNOWf/PLUKg?=
 =?iso-8859-1?Q?yhRjeX7BOUWJN2JUeglWU+9UHmIt5eu0x41X1kqhupJyONbf8If9bmfJYJ?=
 =?iso-8859-1?Q?gSDMeA6I5ir9IDgIAz085M6MbB+Sp2J2oEfAEtoz7pEnX7oqFNkgggbULq?=
 =?iso-8859-1?Q?Mmq9erWXXzBqwTAg8QgNnXr36YnlBN+ZgePFvL7f6sMYu/HJxbh9F1X1TG?=
 =?iso-8859-1?Q?9cUVMvCKEPcLXRyOC99iXfB1H8BPkx1Dks2A+KgGNakEeon/z0KzwHmeuH?=
 =?iso-8859-1?Q?uJVjT9OQjultNlQTRcw04xHkcZU+lIjVpA5XRiB0A2HtbaHHuHgnssQlI+?=
 =?iso-8859-1?Q?6xQE+eVmeFG1X1suKwsPbRXNQ3euiZlcQHp4xeBMsePgJoSW0CuL3gYRpA?=
 =?iso-8859-1?Q?ckvXosVH1sCur9AVWVdjXkN4kz/GA07Jnqu6Lobg3hDZ/UMWsi/IwQP4EW?=
 =?iso-8859-1?Q?ZCMc2GY6baHbLBwuvs+QKZZoaLGfFcq2mXoUP1O+7Yypd+Mvn69B2lBWKJ?=
 =?iso-8859-1?Q?EIuPDCb0wnBIqzD/EJ9+YTB4Z55k+xSLgILHRIVmi2rnoYRI+OjnZ/RVqL?=
 =?iso-8859-1?Q?rgOzwAcxqmS00YcWYfHLlE5g/bN8lIFHR5EeJ1o3hLbsbL+CRE8fMeL+df?=
 =?iso-8859-1?Q?3J3anr+Tfau5xkzzoX3IZMBKiIZpbXML8mvaUS5sp1jRbhku/POXD1BzqJ?=
 =?iso-8859-1?Q?U7UasJVD8cnZbYiBfNrGBk4fqLb8VblF6EqcntZ9zksEZ8a27nImemSkeU?=
 =?iso-8859-1?Q?5cs/0tchXcKXJ/95Q2UBM2biN23pA4/x3rQtwTg8TsxyhMs2oOQgTz6spv?=
 =?iso-8859-1?Q?NVsFVZ3CUvRZ+CwaxQzb6QvCvSM1Bwnm5nOxgYsga1H0MaWf3/ZJaBNlUB?=
 =?iso-8859-1?Q?Dq2LrN87+0kySgbIALff76O4BEz8GX2WVJjJ9yIE3cY4vVncQJ9IHTUE6y?=
 =?iso-8859-1?Q?9ibbp+tvBBPQKosgak6a5Y9Z8VxlZVEnDp5hKshFMQJUc4lpERkVkJQOji?=
 =?iso-8859-1?Q?fKjXQ07wUri9yfIKNq7wtbAQkwAkPQKs7SexyvbwEzrk4gZzyr2fUT2vZg?=
 =?iso-8859-1?Q?7PTNoXvciyORpqCzUq1Kp1iPmk4vYpxOM1YqmeDPZPotdX8CRh86bCOcnc?=
 =?iso-8859-1?Q?Stur5AKrPS7uXOM96CH/tMLoOaIsIwfD0L1cKmYAbfUQUgrBj9bihiRydk?=
 =?iso-8859-1?Q?QbfnCGTqeyjWbRwc+xCR/7k/m0aFTKVSCWkXgNT7jg0wGix5XhjJyw5/wQ?=
 =?iso-8859-1?Q?4zNjzZNIr7GOuevxpS33dWs9xHbjyJXpBjqT969EGMCWS95ZPmwtBWTHrB?=
 =?iso-8859-1?Q?PG4JkSqFiCChNbxUWZnGKc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kueaUgFCqN8qm8eqIXixjw3rraz6rufPKY9yd0Rl4pppMAMNzsD0nckozf?=
 =?iso-8859-1?Q?rYdGcj+2IEGyWya8FS2+66ooF9uw02xnjxqHunmk4qkXjSuKyXm8purUBB?=
 =?iso-8859-1?Q?eTiuGqwA56iSze2aWrr2Y3WEP9GGWi8muzlIOR4F5XcDh8Y3P7jd0IF0Yj?=
 =?iso-8859-1?Q?7N3RKJtstd5hB4zOOGetVfwcTqRk76cnoXeCmfd+2gBaiHyL7OumrQspLn?=
 =?iso-8859-1?Q?x1qk4p7KApGHyMR6AMQyd2xmNGj0rNNhQ8njho7gSM+TH4l6JDDjU2In1o?=
 =?iso-8859-1?Q?QWdRmP/D/u6uCtBDkhf73ygla1yerGe6z0cUgvbDLt+OGTPfllY1XhHhvD?=
 =?iso-8859-1?Q?RyVs7M78MB+JjN+LLbvtHZUewAh70T9InDc6bzEsJk74+zCo9GW/akd9Id?=
 =?iso-8859-1?Q?jSPcP52MFGOS8E+1rhk4yhKi1I9ZbeT1FlDapchztB6shKKQw6D6QOHJFl?=
 =?iso-8859-1?Q?iuyG0hEcPN0FECQFSZPfuOEH41C/83Pc6HooLngxFq+84iWvKdPcW/Yeqz?=
 =?iso-8859-1?Q?gaTyx/pNLLqGUa/3a+gaM1RUYoWqYBRr9A2IB70t4Kq0bz05nNqRUjUick?=
 =?iso-8859-1?Q?WOx9haubf0yU00rv8iuE4UmRvA88oWlcGu6SM+M8Y8kcHfmTCMsSUl4Yb+?=
 =?iso-8859-1?Q?y2er/Swff3zew+z7N5yQoofvYNtpvr3EvFM50cXaJzkAThPMt/tvb0vrym?=
 =?iso-8859-1?Q?xhmR+TNCk01Q0uFZZ9yh0Q5mNWFTsllW034HMD6QCEmD95TgDGwDpuG7tF?=
 =?iso-8859-1?Q?+jTwVCh5T4f4v9b9+qjDubEcy9G8N3NFiu/6kC5G7pZm0TmNufOZkxeogT?=
 =?iso-8859-1?Q?xUchC3PjyI+M6Z256DT24Et6TrGtJhWM9uGHKctOxEvQWcmwuVnFGN5DYb?=
 =?iso-8859-1?Q?4n8VLZ6+MaoGzATWMg0qTZEFSg5s0+VetjVg3CXzlh53VSgvQP5vI3Nx3K?=
 =?iso-8859-1?Q?kA3HKWMhzN5lbiVGilFAhstG2FDcm/tIU/VzjjTMZfB/tsidiYzjlBzh/K?=
 =?iso-8859-1?Q?lYbzZm+bKSL/2Lw0Exx1SBYvckBwQO91trOoGEZnrdQJEu1TjqXG3jeNtb?=
 =?iso-8859-1?Q?f4Yqy9HmcaVWrUvgkLPf8NPCDqy93qQzr5DexGAyjEo2PPFfbdc3e5vtud?=
 =?iso-8859-1?Q?QOjqyMZTpc3bNYxRGgh1s6jqyJ/vAzU2vnjGl3+kV4crQx6pwfRneXMrK4?=
 =?iso-8859-1?Q?j+cOQLfsxdlJ7fw+xu9I08j0vW6YG92nglb+xJPbFFW+PneYWEydKB6Erl?=
 =?iso-8859-1?Q?ANP6HcCMLrh/mtdetYDNWo9orv7jDIFQC9nBajS07d40d+wASmT2A2u66Z?=
 =?iso-8859-1?Q?cDo3Nb4ztnIycx+30yOQ04qjlmnkwsI0ZDWNPIr3LNUBHNkI/P/tVhM2jr?=
 =?iso-8859-1?Q?oUsrcGoAq9nhvIgOus3nW97fqJCPKv8hNYUwN3we0EqBqZRnykIV4R7wpW?=
 =?iso-8859-1?Q?ZFV7N7sKmrtWaUh3rHdC8gqt95tps6FBQ2T3ynrqr9/IdTnegPU1pau/+x?=
 =?iso-8859-1?Q?MBtZdNdC5HvPye3NJjblQIz2L3nHjtpgFmrDuivH/pw5qpClQMg48EPik0?=
 =?iso-8859-1?Q?ysgTag4ZYOCxwsLQoUqDFndMTd1g4YnXi/GvaLdcIAmGtuf9QD18ERla2D?=
 =?iso-8859-1?Q?vDR/vmED2gkn52ZaQhmvT5fdlY67N+wlP9vNQsBANSWVIq+Het9DQz0w?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 13eeeafb-40d1-4750-debd-08dd6d1dcc2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 10:54:50.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HcdV71aIb/5FSji/rucJxNuqgLP2CqWJWk9tkerC7PNOc8Gn4oPI+u77tR/RunLAdGO8SAp1PPjKXju2d/SBsO0z7eE+G2D0yTY6E/WaUQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0542

Hi Sakari,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> On Mon, Mar 10, 2025 at 12:47:46PM +0530, Tarang Raval wrote:=0A=
> > imx334 can support both 4 and 8 lane configurations.=0A=
> > Extend the driver to configure the lane mode accordingly.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> > =A0drivers/media/i2c/imx334.c | 22 +++++++++++++++++++---=0A=
> > =A01 file changed, 19 insertions(+), 3 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=0A=
> > index 24ccfd1d0986..23bfc64969cc 100644=0A=
> > --- a/drivers/media/i2c/imx334.c=0A=
> > +++ b/drivers/media/i2c/imx334.c=0A=
> > @@ -47,6 +47,8 @@=0A=
> > =A0#define IMX334_EXPOSURE_DEFAULT =A0 =A0 =A00x0648=0A=
> >=0A=
> > =A0#define IMX334_REG_LANEMODE =A0 =A0 =A0 =A0 =A0 =A0CCI_REG8(0x3a01)=
=0A=
> > +#define IMX334_CSI_4_LANE_MODE =A0 =A0 =A0 =A0 3=0A=
> > +#define IMX334_CSI_8_LANE_MODE =A0 =A0 =A0 =A0 7=0A=
> >=0A=
> > =A0/* Window cropping Settings */=0A=
> > =A0#define IMX334_REG_AREA3_ST_ADR_1 =A0 =A0 =A0CCI_REG16_LE(0x3074)=0A=
> > @@ -107,7 +109,6 @@=0A=
> > =A0/* CSI2 HW configuration */=0A=
> > =A0#define IMX334_LINK_FREQ_891M =A0 =A0 =A0 =A0891000000=0A=
> > =A0#define IMX334_LINK_FREQ_445M =A0 =A0 =A0 =A0445500000=0A=
> > -#define IMX334_NUM_DATA_LANES =A0 =A0 =A0 =A04=0A=
> >=0A=
> > =A0#define IMX334_REG_MIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00=0A=
> > =A0#define IMX334_REG_MAX =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xfffff=0A=
> > @@ -181,6 +182,7 @@ struct imx334_mode {=0A=
> > =A0 * @exp_ctrl: Pointer to exposure control=0A=
> > =A0 * @again_ctrl: Pointer to analog gain control=0A=
> > =A0 * @vblank: Vertical blanking in lines=0A=
> > + * @lane_mode: Mode for number of connected data lanes=0A=
> > =A0 * @cur_mode: Pointer to current selected sensor mode=0A=
> > =A0 * @mutex: Mutex for serializing sensor controls=0A=
> > =A0 * @link_freq_bitmap: Menu bitmap for link_freq_ctrl=0A=
> > @@ -204,6 +206,7 @@ struct imx334 {=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct v4l2_ctrl *again_ctrl;=0A=
> > =A0 =A0 =A0 };=0A=
> > =A0 =A0 =A0 u32 vblank;=0A=
> > + =A0 =A0 u32 lane_mode;=0A=
> > =A0 =A0 =A0 const struct imx334_mode *cur_mode;=0A=
> > =A0 =A0 =A0 struct mutex mutex;=0A=
> > =A0 =A0 =A0 unsigned long link_freq_bitmap;=0A=
> > @@ -240,7 +243,6 @@ static const struct cci_reg_sequence common_mode_re=
gs[] =3D {=0A=
> > =A0 =A0 =A0 { IMX334_REG_HADD_VADD, 0x00},=0A=
> > =A0 =A0 =A0 { IMX334_REG_VALID_EXPAND, 0x03},=0A=
> > =A0 =A0 =A0 { IMX334_REG_TCYCLE, 0x00},=0A=
> > - =A0 =A0 { IMX334_REG_LANEMODE, 0x03},=0A=
>=A0=0A=
> Not a fault of this patch but also the closing brace should have a space=
=0A=
> before it. Could you address it in the earlier patches?=0A=
=0A=
Okay, I will correct it.=0A=
=0A=
> > =A0 =A0 =A0 { IMX334_REG_TCLKPOST, 0x007f},=0A=
> > =A0 =A0 =A0 { IMX334_REG_TCLKPREPARE, 0x0037},=0A=
> > =A0 =A0 =A0 { IMX334_REG_TCLKTRAIL, 0x0037},=0A=
> > @@ -876,6 +878,13 @@ static int imx334_start_streaming(struct imx334 *i=
mx334)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
> > =A0 =A0 =A0 }=0A=
> >=0A=
> > + =A0 =A0 ret =3D cci_write(imx334->cci, IMX334_REG_LANEMODE,=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx334->lane_mode, NULL);=0A=
> > + =A0 =A0 if (ret) {=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx334->dev, "failed to configure lan=
es\n");=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
> > + =A0 =A0 }=0A=
> > +=0A=
> > =A0 =A0 =A0 ret =3D imx334_set_framefmt(imx334);=0A=
> > =A0 =A0 =A0 if (ret) {=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx334->dev, "%s failed to set fram=
e format: %d\n",=0A=
> > @@ -1022,7 +1031,14 @@ static int imx334_parse_hw_config(struct imx334 =
*imx334)=0A=
> > =A0 =A0 =A0 if (ret)=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
> >=0A=
> > - =A0 =A0 if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX334_NUM_DATA=
_LANES) {=0A=
> > + =A0 =A0 switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {=0A=
> > + =A0 =A0 case 4:=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 imx334->lane_mode =3D IMX334_CSI_4_LANE_MODE;=
=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
> > + =A0 =A0 case 8:=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 imx334->lane_mode =3D IMX334_CSI_8_LANE_MODE;=
=0A=
>=A0=0A=
> Doesn't this affect the PLL configuration? Presumably higher frame rates=
=0A=
> could be achieved at least.=0A=
=0A=
Sorry, my commit message is misleading. The intention of this patch is to=
=0A=
configure the lane mode dynamically from the streaming function instead =0A=
of using a hardcoded value.=0A=
=0A=
You are correct that supporting an 8-lane mode requires changes to the PLL=
=0A=
configuration. This patch does not address that aspect yet.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
> > + =A0 =A0 =A0 =A0 =A0 =A0 break;=0A=
> > + =A0 =A0 default:=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(imx334->dev,=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "number of CSI2 data lanes =
%d is not supported\n",=0A=
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus_cfg.bus.mipi_csi2.num_d=
ata_lanes);=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Sakari Ailus=

