Return-Path: <linux-media+bounces-14278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE291AFF9
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 21:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09E791F22D1B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 19:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91D419AD7B;
	Thu, 27 Jun 2024 19:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="klpzawoD"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2101.outbound.protection.outlook.com [40.107.237.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D722F1C
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518333; cv=fail; b=rsRV5oieuYO77a2WAmv9Uwt9bJv52dUkSG/Fh/SNAF1GQNvnkGmqlM5Fp4BpLtigihGLeuRMIrCq6opNYtFz5sqXsNRxi82Mq2mx9wVASOZ+WreSTr03zrPV3h49xa4P9p5MXkKfzJqRvpeiR7OzHpEjA4ahqe21BtzXtbK7S/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518333; c=relaxed/simple;
	bh=9g85kJNOqQbQlBIN3hKLL1Acb1MeOziNluhClkPjRYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SI5nWbgNgIXRJhWLXuEfv6bgG1s20aSMohJkRz7Ql7I3Q6w+xP8tSLE2AkVKINy9TcuUrBxaRLuXrAMWVutAMq5D/rAfO3WtVS14C0tDx6jGVJm7UCYNyux2rF9scp7yPMZxdD2Xttlkv/H47rPEECI+IpxuZ09d+eqU4qMSX2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=klpzawoD; arc=fail smtp.client-ip=40.107.237.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1ZjSOMSQel6UbrpJYr3M++s3nT5eKw094qhR2TzJC5NKDRr5Oito34ZKJcrX6Rf9VviLefcmaRgYPg1fzlt3B/pr9XTp6GYktkgl+uahsREYMpz90dJyU9bWPHPkwHemA2CG8pJnYdTEmBtaNxlH27mroAkRmy9XV1tFJsvNPTvt+krc3VZ8xOx2IPTXE4z5JRxKKTWqeixD4ydn2Ubby43vkXeF6CWFdB7mC11dUQ0fEA9dUmta8VJjLfOC5/zJ95GX8rFTt6lMhCC2ZQ73dLXGs1acO47ddDix9OvOmVG9RP0l2x1oO6iOGIcuVPnsy6tm40eAwAgVb50AcI3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvdtPcHVqbM6EmYl3uZf69R86pZ4EZtMkN1aAB4hKx4=;
 b=TjIjDivHQ9k7XlGJ6LoMjpmbLA0r2GZV4mojP7g/uC9vOCX8vMsbcBT7IM/COvRLWI5bLXl1aEMNVdRGJ24R0yFvsckKdqmZqrz1ETuFmRyKZ4ydGWDvorC8kVDvFhNTqinjpURF5yW9ZGYhzQ65DEPT9MJeYJUTOXUcXzFpTbJEJxCr3vOxSS3YFrQ4xiT5SNdmXRiWjpMatN7EiG9dcxdKgi8UVQHxsZP1vVoxS9AIcHKwlnoG5t22TKYSPyAgAdzj6rflx5AKjR082gaeSoct3dTVlczjWccETrs51Eos3Ay0KzyKuhTsSpMcSmYoKIl6U73dtuu6ZekOZzhB7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvdtPcHVqbM6EmYl3uZf69R86pZ4EZtMkN1aAB4hKx4=;
 b=klpzawoDBRskH950GT76W5SVZEEJU+6m16Q6LwYOd4/U+I102HeAPm/6OcONioL9Caxxts/7Fhxabf6k01vX/ypUZPKPrFfvCdmCduP/jFWTG7HpfvdcFhOAxJpjafWeJAyisivHE/U0R6u9HM6rcoiM16cotyrA0cKGxJ5HFT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 DM4PR14MB5768.namprd14.prod.outlook.com (2603:10b6:8:b7::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Thu, 27 Jun 2024 19:58:39 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Thu, 27 Jun 2024
 19:58:38 +0000
Date: Thu, 27 Jun 2024 15:58:34 -0400
From: Spencer Hill <shill@d3engineering.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	shill@d3engineering.com
Subject: Re: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
Message-ID: <Zn3EavklwTgzvuQK@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-2-shill@d3engineering.com>
 <CAPY8ntBdh05qpKypgTsNA5-rqDUDTU1LJhyH9Xsjh_tvA_ctQQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntBdh05qpKypgTsNA5-rqDUDTU1LJhyH9Xsjh_tvA_ctQQ@mail.gmail.com>
X-ClientProxiedBy: MN2PR16CA0046.namprd16.prod.outlook.com
 (2603:10b6:208:234::15) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|DM4PR14MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3439e9-868a-4d54-75e2-08dc96e3893e
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z/o+rVAafN+oHwBgQHwYffogyV7LxowMcxJEjeP0SkaEBVNxTPMlpDeXX9/o?=
 =?us-ascii?Q?5JCHtQ3UOrdPa1f19xCEqTP4mf8RrF6M2IL++BlILgUDVQGCi6xlMEAWaji+?=
 =?us-ascii?Q?pJQs3Ab1H7ekbi5u5x1BujaJ/dBAs2AzP3i9cdETlMQCxz2GMjWWenqRKXlx?=
 =?us-ascii?Q?N9AF89mTaVheNJrLLKowAdTngd7Vyln/esdsWKB9hnPVjRBVmjueea6BTf6k?=
 =?us-ascii?Q?2BO1Fo18CMK5k5gSakjPfTzWrxjBfuFejQS5PXIMxRygrfeuuLRJ8F7aCyja?=
 =?us-ascii?Q?mlhv0NXc0BzoDLsctZ3CF0bf/SkbxGqTKZEZmvJ+RnAP/O0QeXDUi8BnLG6i?=
 =?us-ascii?Q?QvK6FnjF7MZ0BX1gjZZOswaeTHlcl6NYb97B3biq0oacn3TEIXr6gbgmsh/r?=
 =?us-ascii?Q?ndV+LIlLoBgOEOpKU0Cso0OF0My3pYeC3A/p+asNbFUhRJlfqnOjcCEqR1jO?=
 =?us-ascii?Q?u565jA8oCJDYRaXNLcJFj9CbyDoRdAe+GKI4XWhbORhxkTTXv3qDQSh59oWl?=
 =?us-ascii?Q?HEoZkKglRmsgf1Po16Udbn6mREqKF5FogV1nPEqhxheb7axFTyzf5iulQ3KV?=
 =?us-ascii?Q?d5tuhZgm4KzAqf0O0lmou91Nm2COuoGjRAB5siXDtLGf+x8hwJTSx1pChlIy?=
 =?us-ascii?Q?9FolVbKqtwHTdMmZE8HpZxX2JGLGPNzoAuaV/FwB3UbfQCof+QbQkmG+2SRR?=
 =?us-ascii?Q?jzyE9oE2elzaejEk+dqPhJ8z5jy2UCzy54ZF9I9bYjUALLkaoX74PU8ErUD5?=
 =?us-ascii?Q?piOOpBLKRsvDbNSh15jjEw7djslkOUmwPmWkUKc5xt1h38vueAHEo4HyWOA+?=
 =?us-ascii?Q?qI+8U6BktIf/bEP00g7y9/tQ+CNIabBjsYxjlZMrayDkbNP5qFR9QOMbCtu+?=
 =?us-ascii?Q?YksM8UlkM0zzHeNvwVwys1BEsmuXXDD7lzb2rNQTqf3kr4m2Lytxp6hxTPU7?=
 =?us-ascii?Q?CrhoY9N2IAEI+OZU4VSo3u8++k7NEY7ygzA3CrHR4wAo+T984QlhlEBepb5x?=
 =?us-ascii?Q?U19zp3q5mlJ+a5lSSGaBS6UauZYHTpRooO1ih/joefnmvW8usGoL4VMEGsVg?=
 =?us-ascii?Q?yStBllEu7vIbh3nlgbu3cpvaVBy6fVCNNOQqCMIXzqZ0BSWigh1U+mwHgbdH?=
 =?us-ascii?Q?yAY8CLtD4rAqxDk5O3Q05PKJYlasAtYy+zipTGy2b7h83S5ys1i7DsWeC9Iu?=
 =?us-ascii?Q?/bdFouiNhh1ZJpv3nNw8G3/3rxaAK5CbNADNazKUM6oIA1wI0kO6OWMVeJ1A?=
 =?us-ascii?Q?ykb3Au9Ha7W4QnyOOeLKPP1Zi3XSmANQvmJVcCG1qqk+fkc2ucT4gRkiYJGh?=
 =?us-ascii?Q?3Y4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BLoY7aSRwXNsKicWbqHPN3BtbKXkAIgTnKF9VFKuJpmTCaDXEtvYZbv56k4M?=
 =?us-ascii?Q?xbsQIJ+FFqUqlTKFVAC/zTfn/u2KvtOUra2cJsfPuQ/DigfWytu97IZQTKrf?=
 =?us-ascii?Q?VVtjx0j5JzjK3r40hFp87oOhdqt0sL5BzmtlsoSIYMNBssLhFeTWSve1/mHA?=
 =?us-ascii?Q?nBz1AUxpEvruzqNvJXpwpcw02jt0PRkyD1hyFUxkZ8sIaK8dKmYO9pL/TlDn?=
 =?us-ascii?Q?oZREffcg89HgRBhEpMWe//f+mhy0101MIYlWJap+H6NDvmu5yQPcZIlC/r9H?=
 =?us-ascii?Q?sdVc5/YiTNt+LIyljTiCkmJTypaq+6dV7Lu86CMBpyaWjmYrFwPlWpVsqAfc?=
 =?us-ascii?Q?v6kGb05rROyV7Piy7+7b19oP6d5a9rK2OLpwvYF8n8/yAXOl/4R1+gFre5pY?=
 =?us-ascii?Q?FMySVYJxR+MKoW9mD6S3+WZsFpZyoZfV2zAj4KjP8cECRTan0J3HBAHSihMx?=
 =?us-ascii?Q?qCX0wJKqdkGvNQB4MpflNCGJPLU1qJrIuJ/FZgqfhzWa6KYzYxA4hx3EXZfj?=
 =?us-ascii?Q?bTvc/tyDQyR/57VQDoaOe3KRRPlS4U1vTzzrLAzR0Kevjr9HSRNU2uUY9FnQ?=
 =?us-ascii?Q?581hi4FiMQ8LFFxRtVWLdX9K68DYCfFOEjWMlEmSoPhv9JTdb/581eAldSMb?=
 =?us-ascii?Q?+q33Qye3+dOvfe/lrSFz6Y0KugbiWpI7h2xMVQdnJijfYNH7h2Q2S8HLoZ5v?=
 =?us-ascii?Q?VPMQ2JEQfazvnq+rzawLPQtK7bHb0fhLPqtNQycp3HJpa80sV2ybmiSN4XLP?=
 =?us-ascii?Q?RuU/dAxqdU4qcbOzITnIkJALiy6sgI+pITHLkR6lzI+Ku025apJEJ91rAVpL?=
 =?us-ascii?Q?kJKsjrjMB4q53EJ53QpNZ7Rj5cL1fjbJnSvBkTEWoHQPo6CTK77YVa7o1CC+?=
 =?us-ascii?Q?v5ZDHuMo47NHYPcOmh6rBy8Z7mq3GUxr2l8CJS1P70l+T5APoqC6nJ/+CTXu?=
 =?us-ascii?Q?aGVJMbLoVBnJNeybaTTSnpzh9wEYNO5As7gM1qZAzX/iIZBuykPBe+MOXDrs?=
 =?us-ascii?Q?bgknYFVEhrHOLhOVsv+btZnR3UDsm9IoJGUEMQHeJcxdZu+bHwTmq2IuD6r+?=
 =?us-ascii?Q?Go5EWAAK8ApqEcCDz5UTCRzUUwpMyGwGuz09kDxOdaTBcIkfm6TknJgRSl/W?=
 =?us-ascii?Q?kFIhz/kYQsDKtadZTptvPpzqC5ZrwmP1m4xGD1fezHe0SMw7RFVVdAMUCCcr?=
 =?us-ascii?Q?0fGxZAFzjU3DnrO1W7jMcI0zbG5jNH2FsSnJs8RGARnfvHHDgOAKFJVIh+0B?=
 =?us-ascii?Q?zc4dOt/M4/1/+itywnZmDWBYyRq1IAL8hVRljmnb8aO/1l8tXq6JsFzmqNNw?=
 =?us-ascii?Q?rxu0fk8F/hmCqfv71a9cVfU5cLApeOmXGmYFGlaQ6do7Qd81fVyKKbBJLSS5?=
 =?us-ascii?Q?fqFOsc2qREoOhodlQslZJKtyu+Dxa8o0G0Wky+BQsg6NM2MG4NaZEsXR+v4l?=
 =?us-ascii?Q?mc5v+OKUxJ0w7pYwC0yN2h1lvfun8JRkISTFmSHM9XTyTVywN6NWi1dGYXz9?=
 =?us-ascii?Q?jjM76V0hANJuBY48c3S1cW/rIYnjBLIeBh2r3ziG+9VV/yVRq9quxGu5DzLW?=
 =?us-ascii?Q?MQHFK0k7a0qUajuLbq7pSSE1YAWrKB5F4qe3oPVegKRFDqmqqeI+/G1HOLhr?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3439e9-868a-4d54-75e2-08dc96e3893e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 19:58:38.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwaUpnYEWkjiw/ifDgMc+I8ZJW4EoW6SYzpktljF5uO6mYXQOA/PPTew5c75BmPQLaZ/sWPclolNvaLDi1LBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR14MB5768

On Thu, Jun 27, 2024 at 04:39:37PM +0100, Dave Stevenson wrote:
> Hi Spencer
>
> Thanks for the patch - always nice to see new sensors being supported.
>
> I assume there's no public datasheet for the sensor, but are you aware
> of even a product brief? Reviews are tricky without data to work with.
> I've just read through looking for discrepancies and common errors.
>

There currently isn't a public datasheet available for the sensor. I'll
modify the device tree description with what is publicly available.

> On Wed, 26 Jun 2024 at 22:16, Spencer Hill <shill@d3engineering.com> wrot=
e:
> >
> > Add a driver for the Sony IMX728 image sensor.
> >
> > Signed-off-by: Spencer Hill <shill@d3engineering.com>
> > ---
> >  drivers/media/i2c/Kconfig  |   11 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx728.c | 1167 ++++++++++++
> >  drivers/media/i2c/imx728.h | 3458 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 4637 insertions(+)
> >  create mode 100644 drivers/media/i2c/imx728.c
> >  create mode 100644 drivers/media/i2c/imx728.h
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index c6d3ee472d81..46b6463c558a 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -233,6 +233,17 @@ config VIDEO_IMX415
> >           To compile this driver as a module, choose M here: the
> >           module will be called imx415.
> >
> > +config VIDEO_IMX728
> > +       tristate "Sony IMX728 sensor support"
> > +       depends on OF_GPIO
> > +       select V4L2_CCI_I2C
> > +       help
> > +         This is a Video4Linux2 sensor driver for the Sony
> > +         IMX728 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called imx728.
> > +
> >  config VIDEO_MAX9271_LIB
> >         tristate
> >
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index dfbe6448b549..1188420ee1b4 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -56,6 +56,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
> >  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
> >  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
> >  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> > +obj-$(CONFIG_VIDEO_IMX728) +=3D imx728.o
> >  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
> >  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
> >  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> > diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
> > new file mode 100644
> > index 000000000000..b23359133a22
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx728.c
> > @@ -0,0 +1,1167 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Sony IMX728 CMOS Image Sensor Driver
> > + *
> > + * Copyright (c) 2024 Define Design Deploy Corp
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/clk.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <linux/v4l2-mediabus.h>
> > +#include <linux/videodev2.h>
> > +#include <media/v4l2-subdev.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +
> > +#include "imx728.h"
> > +
> > +static inline struct imx728 *to_imx728(struct v4l2_subdev *sd)
> > +{
> > +       return container_of(sd, struct imx728, subdev);
> > +}
> > +
> > +static int imx728_read(struct imx728 *imx728, u16 addr, u32 *val, size=
_t nbytes)
> > +{
> > +       int ret;
> > +       __le32 val_le =3D 0;
> > +
> > +       ret =3D regmap_bulk_read(imx728->regmap, addr, &val_le, nbytes)=
;
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "%s: failed to read reg 0x%04x: %d=
\n",
> > +                       __func__, addr, ret);
> > +               return ret;
> > +       }
> > +
> > +       *val =3D le32_to_cpu(val_le);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_write(struct imx728 *imx728, u16 addr, u32 val, size=
_t nbytes)
> > +{
> > +       int ret;
> > +       __le32 val_le =3D cpu_to_le32(val);
> > +
> > +       ret =3D regmap_bulk_write(imx728->regmap, addr, &val_le, nbytes=
);
> > +       if (ret < 0)
> > +               dev_err(imx728->dev, "%s: failed to write reg 0x%04x: %=
d\n",
> > +                       __func__, addr, ret);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx728_update_bits(struct imx728 *imx728, u16 addr, u32 val=
, u32 mask, size_t nbytes)
> > +{
> > +       int ret;
> > +       u32 cfg;
> > +
> > +       ret =3D imx728_read(imx728, addr, &cfg, nbytes);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       cfg =3D (val) ? (cfg | mask) : (cfg & (~mask));
> > +
> > +       return imx728_write(imx728, addr, cfg, nbytes);
> > +}
> > +
> > +static int imx728_write_table(struct imx728 *imx728,
> > +                             const struct reg_sequence *regs,
> > +                             unsigned int nr_regs)
> > +{
> > +       int ret;
> > +
> > +       ret =3D regmap_multi_reg_write(imx728->regmap, regs, nr_regs);
> > +       if (ret < 0)
> > +               dev_err(imx728->dev,
> > +                       "%s: failed to write reg table (%d)!\n", __func=
__, ret);
> > +       return ret;
> > +}
> > +
> > +static int imx728_wait_for_state(struct imx728 *imx728, enum imx728_se=
nsor_state state)
> > +{
> > +       int ret, i;
> > +       u32 val;
> > +
> > +       for (i =3D 0; i < 50; i++) {
> > +               ret =3D imx728_read(imx728, 0x2CAC, &val, 1);
> > +               if (ret =3D=3D 0 && val =3D=3D state) {
> > +                       dev_info(imx728->dev, "%s: Enter state %u\n", _=
_func__, val);
> > +                       return 0;
> > +               }
> > +               usleep_range(1000, 10000);
> > +       }
> > +
> > +       return -EBUSY;
> > +}
> > +
> > +static void imx728_init_formats(struct v4l2_subdev_state *state)
> > +{
> > +       struct v4l2_mbus_framefmt *format;
> > +
> > +       format =3D v4l2_subdev_state_get_format(state, 0, 0);
> > +       format->code =3D imx728_mbus_formats[0];
> > +       format->width =3D imx728_framesizes[0].width;
> > +       format->height =3D imx728_framesizes[0].height;
> > +       format->field =3D V4L2_FIELD_NONE;
> > +       format->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> > +}
> > +
> > +static int _imx728_set_routing(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state)
> > +{
> > +       struct v4l2_subdev_route routes[] =3D {
> > +               {
> > +                       .source_pad =3D 0,
> > +                       .source_stream =3D 0,
> > +                       .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> > +               },
> > +               {
> > +                       .source_pad =3D 0,
> > +                       .source_stream =3D 1,
> > +               }
> > +       };
> > +
> > +       struct v4l2_subdev_krouting routing =3D {
> > +               .num_routes =3D ARRAY_SIZE(routes),
> > +               .routes =3D routes,
> > +       };
> > +
> > +       int ret;
> > +
> > +       ret =3D v4l2_subdev_set_routing(sd, state, &routing);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       imx728_init_formats(state);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_enum_mbus_code(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state,
> > +                                struct v4l2_subdev_mbus_code_enum *cod=
e)
> > +{
> > +
> > +       if (code->index >=3D ARRAY_SIZE(imx728_mbus_formats))
>
> imx728_mbus_formats only lists MEDIA_BUS_FMT_SRGGB10_1X10. Is this for
> potential addition of the 12, 16, or 20 bit readout modes? How likely
> are those to actually happen?
>

The sensor supports 10, 12, 16, 20, and 24 bit output. I have settings
that are supposed to be for 12bit output, however I do not have hardware
that I can test it on, as my current set up is over FPD-Link 3, and when
operating in 12 bit mode the sensor surpasses the maximum bandwidth of
that interface and no longer functions. I would like to add more modes
in the future when I get access to a better hardware setup for testing
them.

> > +               return -EINVAL;
> > +
> > +       code->code =3D imx728_mbus_formats[code->index];
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_enum_frame_sizes(struct v4l2_subdev *sd,
> > +                                  struct v4l2_subdev_state *state,
> > +                                  struct v4l2_subdev_frame_size_enum *=
fse)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
> > +               if (imx728_mbus_formats[i] =3D=3D fse->code)
> > +                       break;
> > +       }
> > +
> > +       if (i =3D=3D ARRAY_SIZE(imx728_mbus_formats))
> > +               return -EINVAL;
> > +
> > +       if (fse->index >=3D ARRAY_SIZE(imx728_framesizes))
> > +               return -EINVAL;
> > +
> > +       fse->min_width =3D imx728_framesizes[fse->index].width;
> > +       fse->max_width =3D fse->min_width;
> > +       fse->min_height =3D imx728_framesizes[fse->index].height;
> > +       fse->max_height =3D fse->min_height;
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_set_fmt(struct v4l2_subdev *sd,
> > +                         struct v4l2_subdev_state *state,
> > +                         struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +       struct v4l2_mbus_framefmt *format;
> > +       const struct v4l2_area *fsize;
> > +       unsigned int i;
> > +       u32 code;
> > +       int ret =3D 0;
> > +
> > +       if (fmt->pad !=3D 0)
> > +               return -EINVAL;
> > +
> > +       if (fmt->stream !=3D 0)
> > +               return -EINVAL;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
> > +               if (imx728_mbus_formats[i] =3D=3D fmt->format.code) {
> > +                       code =3D fmt->format.code;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       if (i =3D=3D ARRAY_SIZE(imx728_mbus_formats))
> > +               code =3D imx728_mbus_formats[0];
> > +
> > +       fsize =3D v4l2_find_nearest_size(imx728_framesizes,
> > +                                      ARRAY_SIZE(imx728_framesizes), w=
idth,
> > +                                      height, fmt->format.width,
> > +                                      fmt->format.height);
> > +
> > +       mutex_lock(&imx728->lock);
> > +
> > +       format =3D v4l2_subdev_state_get_format(state, fmt->pad, fmt->s=
tream);
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && imx728->stre=
aming) {
> > +               ret =3D -EBUSY;
> > +               goto done;
> > +       }
> > +
> > +       format->code =3D code;
> > +       format->width =3D fsize->width;
> > +       format->height =3D fsize->height;
> > +
> > +       fmt->format =3D *format;
> > +
> > +done:
> > +       mutex_unlock(&imx728->lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx728_get_frame_desc(struct v4l2_subdev *sd, unsigned int =
pad,
> > +                                struct v4l2_mbus_frame_desc *fd)
> > +{
> > +       struct v4l2_subdev_state *state;
> > +       struct v4l2_mbus_framefmt *fmt;
> > +       u32 bpp;
> > +       int ret =3D 0;
> > +
> > +       if (pad !=3D 0)
> > +               return -EINVAL;
> > +
> > +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +
> > +       fmt =3D v4l2_subdev_state_get_format(state, 0, 0);
> > +       if (!fmt) {
> > +               ret =3D -EPIPE;
> > +               goto out;
> > +       }
> > +
> > +       memset(fd, 0, sizeof(*fd));
> > +
> > +       fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +
> > +       bpp =3D 10;
> > +
> > +       fd->entry[fd->num_entries].stream =3D 0;
> > +
> > +       fd->entry[fd->num_entries].flags =3D V4L2_MBUS_FRAME_DESC_FL_LE=
N_MAX;
> > +       fd->entry[fd->num_entries].length =3D fmt->width * fmt->height =
* bpp / 8;
> > +       fd->entry[fd->num_entries].pixelcode =3D fmt->code;
> > +       fd->entry[fd->num_entries].bus.csi2.vc =3D 0;
> > +       fd->entry[fd->num_entries].bus.csi2.dt =3D 0x2b;
>
> Presumably this 0x2b is MIPI_CSI2_DT_RAW10.
> That comes back to the question above as to whether supporting other
> bit depths is really likely, as if so then prepare to change this
> value based on mbus_code.
>

I will make sure that this changes based on the mbus_code once more bit
depths are supported.

> > +
> > +       fd->num_entries++;
>
> Presumably this fd->num_entries manipulation is due to expecting to
> support multiple data types? Whilst not wrong, at the moment it feels
> a little redundant.
>

I can remove this from this patch set if that would be preferred, until
more modes are available.

> > +
> > +out:
> > +
> > +       v4l2_subdev_unlock_state(state);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx728_set_routing(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *state,
> > +                             enum v4l2_subdev_format_whence which,
> > +                             struct v4l2_subdev_krouting *routing)
> > +{
> > +       int ret;
> > +
> > +       if (routing->num_routes =3D=3D 0 || routing->num_routes > 1)
> > +               return -EINVAL;
> > +
> > +       ret =3D _imx728_set_routing(sd, state);
> > +
> > +       return ret;
> > +}
> > +
> > +static int imx728_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx728 *imx728 =3D container_of(ctrl->handler,
> > +                                       struct imx728, ctrl.handler);
> > +       int ret =3D 0;
> > +
> > +       dev_dbg(imx728->dev, "%s: %s, value: %d\n",
> > +                       __func__, ctrl->name, ctrl->val);
> > +
> > +       if (!pm_runtime_get_if_in_use(imx728->dev))
> > +               return 0;
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_EXPOSURE:
> > +               ret =3D imx728_write(imx728, 0x98DC, ctrl->val, 4);
> > +               break;
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               ret =3D imx728_update_bits(imx728, 0x98F8,
> > +                               (ctrl->val * 10),
> > +                               0x1FFFF, 4);
> > +               break;
> > +       case V4L2_CID_HFLIP:
> > +               ret =3D imx728_update_bits(imx728, 0x9651,
> > +                                        ctrl->val, 0x1, 1);
> > +               ret |=3D imx728_update_bits(imx728, 0xB67C,
> > +                                         ctrl->val, 0x1, 1);
> > +               break;
> > +       case V4L2_CID_VFLIP:
> > +               ret =3D imx728_update_bits(imx728, 0x9651,
> > +                                        ctrl->val << 1, 0x2, 1);
> > +               ret =3D imx728_update_bits(imx728, 0xB67D,
> > +                                        ctrl->val, 0x1, 1);
> > +               break;
> > +       case V4L2_CID_WIDE_DYNAMIC_RANGE:
> > +       case V4L2_CID_TEST_PATTERN:
> > +               // Both of these are configured during start stream.
> > +               ret =3D 0;
> > +               break;
> > +       default:
> > +               ret =3D -EINVAL;
> > +       }
> > +
> > +       pm_runtime_put_noidle(imx728->dev);
> > +       return ret;
> > +}
> > +
> > +static int imx728_detect(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +       u32 minor, major;
> > +
> > +       ret =3D imx728_read(imx728, 0x6002, &major, 1);
> > +       if (ret !=3D 0) {
> > +               dev_err(imx728->dev, "Could not read PARAM_MAJOR_VER!")=
;
> > +               return ret;
> > +       }
> > +       ret =3D imx728_read(imx728, 0x6000, &minor, 1);
> > +       if (ret !=3D 0) {
> > +               dev_err(imx728->dev, "Could not read PARAM_MINOR_VER!")=
;
> > +               return ret;
> > +       }
> > +       dev_dbg(imx728->dev, "Got version: %d.%d", major, minor);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_reset(struct imx728 *imx728)
> > +{
> > +
> > +       if (!IS_ERR_OR_NULL(imx728->xclr_gpio)) {
> > +               gpiod_set_value_cansleep(imx728->xclr_gpio, 1);
> > +               usleep_range(1000, 10000);
> > +               gpiod_set_value_cansleep(imx728->xclr_gpio, 0);
> > +               msleep(100);
> > +
> > +               return 0;
> > +       }
> > +
> > +       return -1;
> > +}
> > +
> > +static int imx728_power_on(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +
> > +       ret =3D clk_prepare_enable(imx728->clk);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       imx728_reset(imx728);
> > +       return 0;
> > +}
> > +
> > +static int imx728_power_off(struct imx728 *imx728)
> > +{
> > +
> > +       if (imx728->xclr_gpio) {
> > +               gpiod_set_value_cansleep(imx728->xclr_gpio, 1);
> > +
> > +               usleep_range(1, 10);
> > +       }
> > +       clk_disable_unprepare(imx728->clk);
> > +       return 0;
> > +}
> > +
> > +static int imx728_get_frame_interval(struct v4l2_subdev *sd,
> > +                                    struct v4l2_subdev_state *sd_state=
,
> > +                                    struct v4l2_subdev_frame_interval =
*fi)
> > +{
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +
> > +       fi->interval.numerator =3D 1;
> > +       fi->interval.denominator =3D imx728->fps;
> > +       return 0;
> > +}
> > +
> > +static int imx728_set_frame_interval(struct v4l2_subdev *sd,
> > +                                    struct v4l2_subdev_state *sd_state=
,
> > +                                    struct v4l2_subdev_frame_interval =
*fi)
> > +{
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +       u32 req_fps;
> > +
> > +       mutex_lock(&imx728->lock);
> > +
> > +       if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator=
 =3D=3D 0) {
> > +               fi->interval.denominator =3D IMX728_FRAMERATE_DEFAULT;
> > +               fi->interval.numerator =3D 1;
> > +       }
> > +
> > +       req_fps =3D clamp_val(DIV_ROUND_CLOSEST(fi->interval.denominato=
r,
> > +                                             fi->interval.numerator),
> > +                           IMX728_FRAMERATE_MIN, IMX728_FRAMERATE_MAX)=
;
> > +
> > +       fi->interval.numerator =3D 1;
> > +       fi->interval.denominator =3D req_fps;
> > +
> > +       imx728->fps =3D req_fps;
> > +
> > +       mutex_unlock(&imx728->lock);
> > +       dev_dbg(imx728->dev, "%s frame rate =3D %d\n", __func__, imx728=
->fps);
>
> Is setting the frame rate actually supported in the driver? I can't
> see imx728->fps being used other than to return the value in
> imx728_get_frame_interval.
>
> Frame rate control on raw sensors is normally controlled through
> V4L2_CID_VBLANK and V4L2_CID_HBLANK, not these ioctls.
> See https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/ca=
mera-sensor.html#raw-camera-sensors
>

I don't presently have frame rate control implemented. There is a
register that allows me to increase the number of lines read from the
sensor in order to lower the frame rate. Would it be better to implement
the V4L2_CID_HBLANK directly in that case rather than exposing the frame
rate this way?

> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_powerup_to_standby(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +
> > +       dev_info(imx728->dev, "powerup -> standby...");
> > +
> > +       ret =3D imx728_reset(imx728);
> > +       if (ret) {
> > +               dev_err(imx728->dev, "Error resetting: %i", ret);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_SLEEP=
);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Could not transition to Sleep sta=
te!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x1B20, imx728->clk_rate / 1000000=
, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write INCK frequency!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x1B1C, 0x1, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write INCK frequency!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x1B05, 0xFF, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write to CK_SLEEP!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STAND=
BY);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't transition from Sleep to=
 Standby state!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0xFFFF, IMX728_REMAP_MODE_STANDBY,=
 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write regmap mode!");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_hdr_fixed_brightness(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +
> > +       // Sony recommended values
> > +       unsigned int exposure_sp1_sp2_us =3D 10000;
> > +       unsigned int exposure_sp1vs_us =3D 56;
> > +       unsigned int sp1h_gain =3D 240;
> > +       unsigned int sp1l_gain =3D 75;
> > +       unsigned int sp1ec_gain =3D 21;
> > +       unsigned int sp2_gain =3D 33;
> > +       unsigned int sp1vs_gain =3D 84;
> > +
> > +       ret =3D imx728_write(imx728, 0x98DC, exposure_sp1_sp2_us, 4);
> > +       ret |=3D imx728_write(imx728, 0x98E4, exposure_sp1_sp2_us, 4);
> > +       ret |=3D imx728_write(imx728, 0x98EC, exposure_sp1vs_us, 4);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Failed to write fixed exposure va=
lues.");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_update_bits(imx728, 0x98F8,
> > +                         sp1h_gain,
> > +                         0x1FFFF,
> > +                         4);
> > +       ret |=3D imx728_update_bits(imx728, 0x98FC,
> > +                         sp1l_gain,
> > +                         0x1FFFF,
> > +                         4);
> > +       ret |=3D imx728_update_bits(imx728, 0x9900,
> > +                         sp1ec_gain,
> > +                         0x1FFFF,
> > +                         4);
> > +       ret |=3D imx728_update_bits(imx728, 0x9904,
> > +                         sp2_gain,
> > +                         0x1FFFF,
> > +                         4);
> > +       ret |=3D imx728_update_bits(imx728, 0x9908,
> > +                         sp1vs_gain,
> > +                         0x1FFFF,
> > +                         4);
> > +
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Failed to write fixed gain values=
.");
> > +               return ret;
> > +       }
> > +
> > +       dev_info(imx728->dev, "Wrote fixed brightness for HDR");
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_hdr_configure(
> > +       struct imx728 *imx728,
> > +       struct imx728_ctrl_point *points,
> > +       int hdr_bits)
> > +{
> > +       u32 hdr_norm_x0;
> > +       u32 hdr_norm_x1;
> > +       u32 hdr_norm_y0;
> > +       u32 hdr_norm_y1;
> > +
> > +       int ret;
> > +       int i;
> > +
> > +       switch (hdr_bits) {
> > +       case 20:
> > +               hdr_norm_x0 =3D 0x2000;
> > +               hdr_norm_x1 =3D 0x5000;
> > +
> > +               hdr_norm_y0 =3D 0x0;
> > +               hdr_norm_y1 =3D 0xd000;
> > +               break;
> > +       case 24:
> > +               hdr_norm_x0 =3D 0x3000;
> > +               hdr_norm_x1 =3D 0x5000;
> > +
> > +               hdr_norm_y0 =3D 0x0;
> > +               hdr_norm_y1 =3D 0xe000;
> > +               break;
> > +       default:
> > +               dev_err(imx728->dev, "%i bit HDR not supported.", hdr_b=
its);
> > +               break;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x9C60, hdr_norm_x0, 4);
> > +       ret |=3D imx728_write(imx728, 0x9C6C, hdr_norm_x0, 4);
> > +       ret |=3D imx728_write(imx728, 0x9C64, hdr_norm_x1, 4);
> > +       ret |=3D imx728_write(imx728, 0x9C70, hdr_norm_x1, 4);
> > +       ret |=3D imx728_write(imx728, 0x9C68, hdr_norm_y0, 2);
> > +       ret |=3D imx728_write(imx728, 0x9C74, hdr_norm_y0, 2);
> > +       ret |=3D imx728_write(imx728, 0x9C6A, hdr_norm_y1, 2);
> > +       ret |=3D imx728_write(imx728, 0x9C76, hdr_norm_y1, 2);
> > +
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Failed when setting HDR Normaliza=
tion gains: %i", ret);
> > +               return ret;
> > +       }
> > +
> > +       for (i =3D 0; i < 16; i++) {
> > +               ret =3D imx728_write(
> > +                       imx728,
> > +                       IMX728_REG_CTRL_POINT_X(i),
> > +                       points->x, 4);
> > +
> > +               ret |=3D imx728_write(
> > +                       imx728,
> > +                       IMX728_REG_CTRL_POINT_Y(i),
> > +                       points->y, 4);
> > +
> > +               if (ret < 0) {
> > +                       dev_err(imx728->dev, "Failed to write control p=
oint %i", i);
> > +                       return ret;
> > +               }
> > +
> > +               if ((points+1)->x >=3D 0 && (points+1)->y >=3D 0)
> > +                       points++;
> > +       }
> > +
> > +       return imx728_hdr_fixed_brightness(imx728);
> > +}
> > +
> > +static int imx728_configure(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +       bool hdr =3D imx728->ctrl.wdr->val;
> > +       enum imx728_img_raw_mode img_out_mode;
> > +       enum imx728_drive_mode mode_sel;
> > +       enum imx728_aemode ae_mode;
> > +
> > +       if (hdr) {
> > +               img_out_mode =3D IMX728_IMG_MODE_HDR;
> > +               mode_sel =3D IMX728_MODE_3856x2176_40_4LANE_RAW10;
> > +               ae_mode =3D IMX728_AEMODE_FULL_ME;
> > +       } else {
> > +               img_out_mode =3D IMX728_IMG_MODE_LINEAR;
> > +               mode_sel =3D IMX728_MODE_3856x2176_40_4LANE_RAW10;
> > +               ae_mode =3D IMX728_AEMODE_FULL_ME;
>
> Unless my eyes deceive me, mode_sel and ae_mode are the same in both
> modes. Why do they need to be conditional?
>

I'll adjust the conditional. When I was originally trying
to bring up 12bit HDR this made more sense and was left over from then.

> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x98AC, ae_mode, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't set AE mode!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0xA248, IMX728_AWBMODE_FULL_MWB, 1=
);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't set full manual white ba=
lance mode!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_update_bits(imx728, 0x1808, 0x1, 0x1, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't enable full manual white=
 balance mode!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x98E0, IMX728_FME_SHTVAL_UNIT_MIC=
ROSECONDS, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write exposure time unit=
 to microseconds!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x98E8, IMX728_FME_SHTVAL_UNIT_MIC=
ROSECONDS, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write exposure time unit=
 to microseconds!");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x98F0, IMX728_FME_SHTVAL_UNIT_MIC=
ROSECONDS, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write exposure time unit=
 to microseconds!");
> > +               return ret;
> > +       }
> > +
> > +       if (hdr) {
>
> The xclr GPIO is optional, so is there a guaranteed register reset in
> the big table to reset these HDR registers back to defaults?
>

I do not believe so. If the sensor does not have an xclr pin hooked up
then these registers will remain the same between runs. If the sensor is
not in HDR mode these registers do not impact the operation though, and
the out mode is always configured. I will investigate adding a software
reset as well just for the sake of sanity though.

> > +               ret =3D imx728_hdr_configure(imx728, imx728_hdr_20bit, =
20);
> > +               if (ret < 0) {
> > +                       dev_err(imx728->dev, "Couldn't configure sensor=
 for HDR mode: %i", ret);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       dev_info(imx728->dev, "Disabling metadata...");
> > +       ret =3D imx728_write(imx728, 0x1708, 0x00, 1);
> > +       ret |=3D imx728_write(imx728, 0x1709, 0x00, 1);
> > +       ret |=3D imx728_write(imx728, 0x170A, 0x00, 1);
> > +       ret |=3D imx728_write(imx728, 0x1B40, 0x00, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Error disabling metadata: %i", re=
t);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_update_bits(imx728, 0x9728,
> > +                         mode_sel,
> > +                         0x7FFF,
> > +                         2);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't write mode select.");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_update_bits(imx728, 0xEC7E,
> > +                         img_out_mode,
> > +                         0x7,
> > +                         1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't select image out mode.")=
;
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0xEC12, 0x28, 2);
> > +       ret |=3D imx728_write(imx728, 0xEC14, 0x0, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Error disabling OB output.");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x1761, 0x0, 1);
> > +       if (ret < 0)
> > +               dev_err(imx728->dev, "Error disabling skew calibration =
from sensor to SER");
> > +
> > +       switch (imx728->ctrl.pg_mode->val) {
>
> Even if the test mode can't be changed whilst running, this could be
> in imx728_set_ctrl as it'll be called by __v4l2_ctrl_handler_setup
>

I will move this code into that handler.

> > +       case 0:
>
> Again xclr GPIO is optional. Are these reset to defaults?
>

These are not reset back to default. I'll make sure that there is a
software reset as well in the next version of the patch set.

> > +               break;
> > +       case 1:
> > +               // Horizontal Color Bars
> > +               ret =3D imx728_write(imx728, 0x1A2A, 8, 2);
> > +               ret |=3D imx728_write(imx728, 0x1A30, 0, 3);
> > +               ret |=3D imx728_write(imx728, 0x1A38, 1, 3);
> > +               ret |=3D imx728_write(imx728, 0xB58F, 0x0, 1);
> > +               ret |=3D imx728_write(imx728, 0xB6C5, 0x0, 1);
> > +               break;
> > +       case 2:
> > +               // Vertical Color Bars
> > +               ret =3D imx728_write(imx728, 0x1A2C, 16, 2);
> > +               ret |=3D imx728_write(imx728, 0x1A30, 0, 3);
> > +               ret |=3D imx728_write(imx728, 0x1A38, 1, 3);
> > +               ret |=3D imx728_write(imx728, 0xB58F, 0x1, 1);
> > +               ret |=3D imx728_write(imx728, 0xB6C5, 0x1, 1);
> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +
> > +       // Assume that everything except 'disabled' requires pattern ge=
n enable
> > +       if (imx728->ctrl.pg_mode->val !=3D 0) {
> > +               ret |=3D imx728_write(imx728, 0xB58E, 0x1, 1);
> > +               ret |=3D imx728_write(imx728, 0xB6C4, 0x1, 1);
> > +
> > +               if (ret < 0) {
> > +                       dev_err(imx728->dev, "Failed to enable PG mode.=
");
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       ret =3D imx728_update_bits(imx728, 0x9714,
> > +                         IMX728_RAW_SEL_SP1H,
> > +                         0x7,
> > +                         1);
> > +       ret |=3D imx728_update_bits(imx728, 0xB684,
> > +                          IMX728_RAW_SEL_SP1H,
> > +                          0x7,
> > +                          1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Failed to set subpixel register")=
;
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_start_stream(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +
> > +       ret =3D imx728_powerup_to_standby(imx728);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret =3D imx728_write_table(imx728, imx728_3840x2160, ARRAY_SIZE=
(imx728_3840x2160));
>
> You've enabled delayed suspend through pm_runtime, but you're always
> sending the whole of this array. Is there an option for only resending
> on actual power up to reduce the time to restart if the device hasn't
> suspended?
>

At the moment the system always tries to reset the sensor if possible,
so it makes sense to write the table again. It may be possible to
differentiate between a power on and a resume and not call that reset,
and thus not need to write the entire table again. I will make changes
adjusting it so that this write is only performed if the sensor was in a
sleep state (indicating that it lost power or was otherwise reset).

> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       msleep(100);
> > +
> > +       ret =3D imx728_configure(imx728);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret =3D __v4l2_ctrl_handler_setup(imx728->subdev.ctrl_handler);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev,
> > +                       "%s: failed to apply v4l2 ctrls: %d\n", __func_=
_, ret);
> > +               return ret;
> > +       }
> > +
> > +       ret =3D imx728_write(imx728, 0x1B04, 0x5C, 1);
> > +       if (ret < 0)
> > +               return ret;
> > +       ret =3D imx728_write(imx728, 0x1B04, 0xA3, 1);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STREA=
MING);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Could not transition to Streaming=
!");
> > +               return ret;
> > +       }
> > +
> > +       msleep(20);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_stop_stream(struct imx728 *imx728)
> > +{
> > +       int ret;
> > +
> > +       ret =3D imx728_write(imx728, 0x1B04, 0xFF, 1);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Error sending stop stream command=
: %i", ret);
> > +               return ret;
> > +       }
> > +
> > +       imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev, "Couldn't transition out of Stream=
ing mode!");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +       int ret;
> > +
> > +       mutex_lock(&imx728->lock);
> > +       if (imx728->streaming =3D=3D enable) {
> > +               mutex_unlock(&imx728->lock);
> > +               return 0;
> > +       }
> > +
> > +       if (enable) {
> > +               ret =3D pm_runtime_get_sync(imx728->dev);
> > +               if (ret < 0) {
> > +                       pm_runtime_put_noidle(imx728->dev);
> > +                       goto err_unlock;
> > +               }
> > +
> > +               ret =3D imx728_start_stream(imx728);
> > +               if (ret < 0)
> > +                       goto err_runtime_put;
> > +       } else {
> > +               ret =3D imx728_stop_stream(imx728);
> > +               if (ret < 0)
> > +                       goto err_runtime_put;
> > +               pm_runtime_mark_last_busy(imx728->dev);
> > +               pm_runtime_put_autosuspend(imx728->dev);
> > +       }
> > +
> > +       imx728->streaming =3D enable;
> > +
> > +       __v4l2_ctrl_grab(imx728->ctrl.wdr, enable);
> > +       __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
> > +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> > +       __v4l2_ctrl_grab(imx728->ctrl.pg_mode, enable);
> > +
> > +       mutex_unlock(&imx728->lock);
> > +       return 0;
> > +
> > +err_runtime_put:
> > +       pm_runtime_put(imx728->dev);
> > +
> > +err_unlock:
> > +       mutex_unlock(&imx728->lock);
> > +       dev_err(imx728->dev,
> > +               "%s: failed to setup streaming %d\n", __func__, ret);
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops imx728_core_ops =3D {
> > +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops imx728_subdev_video_ops =3D =
{
> > +       .s_stream =3D imx728_set_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx728_subdev_pad_ops =3D {
> > +       .enum_mbus_code =3D imx728_enum_mbus_code,
> > +       .enum_frame_size =3D imx728_enum_frame_sizes,
> > +       .get_fmt =3D v4l2_subdev_get_fmt,
> > +       .set_fmt =3D imx728_set_fmt,
> > +       .get_frame_interval =3D imx728_get_frame_interval,
> > +       .set_frame_interval =3D imx728_set_frame_interval,
> > +       .set_routing =3D imx728_set_routing,
> > +       .get_frame_desc =3D imx728_get_frame_desc,
>
> Support for get_selection would be nice to reflect the array geometry,
> assuming the information is in the datasheet. It's likely to be
> mandatory for libcamera soon.
>

I have access to this information and will implement this.

> > +};
> > +
> > +static const struct v4l2_subdev_ops imx728_subdev_ops =3D {
> > +       .core  =3D &imx728_core_ops,
> > +       .video =3D &imx728_subdev_video_ops,
> > +       .pad   =3D &imx728_subdev_pad_ops,
> > +};
> > +
> > +static const struct v4l2_ctrl_ops imx728_ctrl_ops =3D {
> > +       .s_ctrl =3D imx728_set_ctrl,
> > +};
> > +
> > +static int imx728_probe(struct i2c_client *client)
> > +{
> > +       struct imx728 *imx728;
> > +       struct v4l2_subdev *sd;
> > +       struct v4l2_ctrl_handler *ctrl_hdr;
> > +       int ret;
> > +
> > +       imx728 =3D devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERN=
EL);
> > +       if (!imx728)
> > +               return -ENOMEM;
> > +
> > +       imx728->dev =3D &client->dev;
> > +
> > +       imx728->regmap =3D devm_regmap_init_i2c(client, &imx728_regmap_=
config);
> > +       if (IS_ERR(imx728->regmap))
> > +               return PTR_ERR(imx728->regmap);
> > +
> > +       imx728->xclr_gpio =3D devm_gpiod_get_optional(imx728->dev,
> > +                                            "xclr", GPIOD_OUT_LOW);
> > +       if (IS_ERR(imx728->xclr_gpio))
> > +               return PTR_ERR(imx728->xclr_gpio);
> > +
> > +       imx728->clk =3D devm_clk_get(imx728->dev, "inck");
> > +       if (IS_ERR(imx728->clk))
> > +               return PTR_ERR(imx728->clk);
> > +
> > +       imx728->clk_rate =3D clk_get_rate(imx728->clk);
> > +       dev_info(imx728->dev, "inck rate: %lu Hz\n", imx728->clk_rate);
> > +
> > +       if (imx728->clk_rate < 18000000 || imx728->clk_rate > 30000000)
> > +               return -EINVAL;
> > +
> > +       ret =3D imx728_power_on(imx728);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret =3D imx728_detect(imx728);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       sd =3D &imx728->subdev;
> > +       v4l2_i2c_subdev_init(sd, client, &imx728_subdev_ops);
> > +
> > +       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                    V4L2_SUBDEV_FL_HAS_EVENTS |
> > +                    V4L2_SUBDEV_FL_STREAMS;
> > +
> > +       imx728->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +       ret =3D media_entity_pads_init(&sd->entity, 1, &imx728->pad);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev,
> > +                       "%s: media entity init failed %d\n", __func__, =
ret);
> > +               return ret;
> > +       }
> > +
> > +       ctrl_hdr =3D &imx728->ctrl.handler;
> > +       ret =3D v4l2_ctrl_handler_init(ctrl_hdr, 8);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev,
> > +                       "%s: ctrl handler init failed: %d\n", __func__,=
 ret);
> > +               goto err_media_cleanup;
> > +       }
> > +
> > +       mutex_init(&imx728->lock);
> > +       imx728->ctrl.handler.lock =3D &imx728->lock;
> > +       imx728->fps =3D IMX728_FRAMERATE_DEFAULT;
> > +
> > +       imx728->ctrl.exposure =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_c=
trl_ops,
> > +                                                 V4L2_CID_EXPOSURE, 0,
> > +                                                 33000, 1,
> > +                                                 IMX728_EXPOSURE_DEFAU=
LT);
>
> That looks like you're clipping the max exposure time based on 30fps,
> and the units are usecs.
> Units on V4L2_CID_EXPOSURE are undefined, and normally expected to be
> lines for raw image sensors, but that then needs to know HBLANK and
> PIXEL_RATE.
> There is V4L2_CID_EXPOSURE_ABSOLUTE which has defined units of
> 100usecs, but I'm not sure if that is very useful in this case.
>

The recommended values for the sensor were provided to me in usecs and
the sensor allows configuring what unit is used for exposure, so at the
moment the exposure is configured in usecs. Would it be better if I
implemented V4L2_CID_EXPOSURE_ABSOLUTE instead then?

> > +
> > +       imx728->ctrl.again =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl=
_ops,
> > +                                              V4L2_CID_ANALOGUE_GAIN, =
0,
> > +                                              102, 1,
> > +                                              24);
> > +
> > +       imx728->ctrl.wdr =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_o=
ps,
> > +                                            V4L2_CID_WIDE_DYNAMIC_RANG=
E,
> > +                                            0, 1, 1, 1);
> > +
> > +       imx728->ctrl.h_flip =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctr=
l_ops,
> > +                                               V4L2_CID_HFLIP, 0, 1, 1=
, 0);
> > +
> > +       imx728->ctrl.v_flip =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctr=
l_ops,
> > +                                               V4L2_CID_VFLIP, 0, 1, 1=
, 0);
>
> Other Sony sensors end up changing the Bayer order based on flips. I
> just want to check that this isn't the case for this sensor, otherwise
> you need to set the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag and report the
> mbus code based on flips.
>

My understanding from the datasheet is that this sensor does not change
the Bayer order when you perform HFLIP or VFLIP operations. It shifts
the pixel readout horizontally or vertically so that the order of
readout does not change.

> > +
> > +       imx728->ctrl.pg_mode =3D v4l2_ctrl_new_std_menu_items(ctrl_hdr,
> > +                                       &imx728_ctrl_ops, V4L2_CID_TEST=
_PATTERN,
> > +                                       ARRAY_SIZE(imx728_ctrl_pg_qmenu=
) - 1,
> > +                                       0, 0, imx728_ctrl_pg_qmenu);
> > +
> > +       imx728->ctrl.pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728=
_ctrl_ops,
> > +                                            V4L2_CID_PIXEL_RATE,
> > +                                            IMX728_PIXEL_RATE,
> > +                                            IMX728_PIXEL_RATE, 1,
> > +                                            IMX728_PIXEL_RATE);
> > +
> > +       imx728->ctrl.link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdr, &im=
x728_ctrl_ops,
> > +                                                V4L2_CID_LINK_FREQ,
> > +                                                ARRAY_SIZE(imx728_link=
_freq_menu) - 1, 0,
> > +                                                imx728_link_freq_menu)=
;
> > +
> > +       if (imx728->ctrl.link_freq)
> > +               imx728->ctrl.link_freq->flags |=3D V4L2_CTRL_FLAG_READ_=
ONLY;
> > +
> > +       imx728->subdev.ctrl_handler =3D ctrl_hdr;
> > +       if (imx728->ctrl.handler.error) {
> > +               ret =3D imx728->ctrl.handler.error;
> > +               dev_err(imx728->dev,
> > +                       "%s: failed to add the ctrls: %d\n", __func__, =
ret);
> > +               goto err_ctrl_free;
> > +       }
> > +
> > +       pm_runtime_set_active(imx728->dev);
> > +       pm_runtime_enable(imx728->dev);
> > +       pm_runtime_set_autosuspend_delay(imx728->dev, IMX728_PM_IDLE_TI=
MEOUT);
> > +       pm_runtime_use_autosuspend(imx728->dev);
> > +       pm_runtime_get_noresume(imx728->dev);
> > +
> > +       ret =3D v4l2_subdev_init_finalize(sd);
> > +       if (ret < 0)
> > +               goto err_pm_disable;
> > +
> > +       ret =3D v4l2_async_register_subdev(sd);
> > +       if (ret < 0) {
> > +               dev_err(imx728->dev,
> > +                       "%s: v4l2 subdev register failed %d\n", __func_=
_, ret);
> > +               goto err_subdev_cleanup;
> > +       }
> > +
> > +       dev_info(imx728->dev, "imx728 probed\n");
> > +       pm_runtime_mark_last_busy(imx728->dev);
> > +       pm_runtime_put_autosuspend(imx728->dev);
> > +       return 0;
> > +
> > +err_subdev_cleanup:
> > +       v4l2_subdev_cleanup(&imx728->subdev);
> > +
> > +err_pm_disable:
> > +       pm_runtime_dont_use_autosuspend(imx728->dev);
> > +       pm_runtime_put_noidle(imx728->dev);
> > +       pm_runtime_disable(imx728->dev);
> > +
> > +err_ctrl_free:
> > +       v4l2_ctrl_handler_free(ctrl_hdr);
> > +       mutex_destroy(&imx728->lock);
> > +
> > +err_media_cleanup:
> > +       media_entity_cleanup(&imx728->subdev.entity);
> > +
> > +       return ret;
> > +}
> > +
> > +static int __maybe_unused imx728_runtime_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +       int ret;
> > +
> > +       ret =3D imx728_power_on(imx728);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused imx728_runtime_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +
> > +       imx728_power_off(imx728);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused imx728_suspend(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +       int ret;
> > +
> > +       if (imx728->streaming)
> > +               imx728_stop_stream(imx728);
> > +
> > +       ret =3D pm_runtime_force_suspend(dev);
> > +       if (ret < 0)
> > +               dev_warn(dev, "%s: failed to suspend: %i\n", __func__, =
ret);
> > +
> > +       return 0;
> > +}
> > +
> > +static int __maybe_unused imx728_resume(struct device *dev)
> > +{
> > +       struct i2c_client *client =3D to_i2c_client(dev);
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +       int ret;
> > +
> > +       ret =3D pm_runtime_force_resume(dev);
> > +       if (ret < 0)
> > +               dev_warn(dev, "%s: failed to resume: %i\n", __func__, r=
et);
> > +
> > +       if (imx728->streaming)
> > +               ret =3D imx728_start_stream(imx728);
>
> You're likely to get comment from Laurent on this one. He went through
> and removed all the suspend/resume handlers as they should really be
> handled by the CSI2 receiver driver, not the sensor driver.
> Resuming streaming in a random order on system resume is unlikely to work=
.
>

Should I remove these handlers then? Or wait for comment?

> > +
> > +       if (ret < 0) {
> > +               imx728_stop_stream(imx728);
> > +               imx728->streaming =3D 0;
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void imx728_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx728 *imx728 =3D to_imx728(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       v4l2_ctrl_handler_free(&imx728->ctrl.handler);
> > +       v4l2_subdev_cleanup(&imx728->subdev);
> > +       media_entity_cleanup(&sd->entity);
> > +       mutex_destroy(&imx728->lock);
> > +
> > +       pm_runtime_disable(imx728->dev);
> > +       pm_runtime_dont_use_autosuspend(imx728->dev);
> > +       pm_runtime_set_suspended(imx728->dev);
> > +}
> > +
> > +static const struct dev_pm_ops imx728_pm_ops =3D {
> > +       SET_RUNTIME_PM_OPS(imx728_runtime_suspend,
> > +                          imx728_runtime_resume, NULL)
> > +       SET_SYSTEM_SLEEP_PM_OPS(imx728_suspend, imx728_resume)
> > +};
> > +
> > +static const struct of_device_id imx728_dt_id[] =3D {
> > +       { .compatible =3D "sony,imx728" },
> > +       { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, imx728_dt_id);
> > +
> > +static struct i2c_driver imx728_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx728",
> > +               .of_match_table =3D of_match_ptr(imx728_dt_id),
> > +               .pm =3D &imx728_pm_ops,
> > +       },
> > +       .probe =3D imx728_probe,
> > +       .remove =3D imx728_remove,
> > +};
> > +
> > +module_i2c_driver(imx728_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Camera Sensor Driver for Sony IMX728");
> > +MODULE_AUTHOR("Spencer Hill <shill@d3engineering.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/i2c/imx728.h b/drivers/media/i2c/imx728.h
> > new file mode 100644
> > index 000000000000..6f320214b780
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx728.h
> > @@ -0,0 +1,3458 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Sony IMX728 CMOS Image Sensor Driver
> > + *
> > + * Copyright (c) 2024 Define Design Deploy Corp
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +#define IMX728_OUT_WIDTH               3840
> > +#define IMX728_OUT_HEIGHT              2160
>
> https://leopardimaging.com/wp-content/uploads/pdf/LI-IMX728-9295-xxxH-_Da=
tasheet.pdf
> lists IMX728 as 3857x2177 (strange to see odd numbers in a Bayer
> sensor). Do you have definitive numbers for the array size?
>
> Seeing as these defines are only used in imx728_framesizes, I'd stick
> the values directly in the structure.
>

I will move these numbers into the structure itself.

> > +
> > +#define IMX728_FRAMERATE_MAX           30
> > +#define IMX728_FRAMERATE_DEFAULT       30
> > +#define IMX728_FRAMERATE_MIN           10
> > +
> > +#define IMX728_PIXEL_RATE              225504000
>
> 225504000 / 3840 / 2160 =3D 27.18fps. How does that square with achieving=
 30fps?
>

Sorry this should be 248832000, I will change that.

> > +#define IMX728_LINK_FREQ               800000000
>
> 1.6Gbit/s per lane feels high. I assume it has been checked.
>

This is what the sensor seems to be operating at given my testing. It's
my understanding that this sensor can actually go all the way to
2.5Gbit/s per lane, but I do not have a setup that can test that at the
moment.

> > +
> > +#define IMX728_EXPOSURE_DEFAULT                10000
> > +
> > +#define IMX728_PM_IDLE_TIMEOUT         1000
> > +
> > +
> > +#define IMX728_REG_CTRL_POINT_X(i) (0xA198 + (i) * 8)
> > +#define IMX728_REG_CTRL_POINT_Y(i) (IMX728_REG_CTRL_POINT_X(i) + 4)
> > +
> > +enum imx728_sensor_state {
> > +       IMX728_SENSOR_STATE_SLEEP               =3D 0x02,
> > +       IMX728_SENSOR_STATE_STANDBY             =3D 0x04,
> > +       IMX728_SENSOR_STATE_STREAMING           =3D 0x10,
> > +       IMX728_SENSOR_STATE_SAFE                =3D 0x20,
> > +};
> > +
> > +
> > +enum imx728_remap_mode_id {
> > +       IMX728_REMAP_MODE_STANDBY =3D 0x00,
> > +       IMX728_REMAP_MODE_STANDBY_PIXEL_SHADING_COMPENSATION =3D 0x01,
> > +       IMX728_REMAP_MODE_STANDBY_SPOT_PIXEL_COMPENSATION =3D 0x02,
> > +       IMX728_REMAP_MODE_STREAMING =3D 0x04,
> > +       IMX728_REMAP_MODE_STREAMING_PIXEL_SHADING_COMPENSATION =3D 0x05=
,
> > +       IMX728_REMAP_MODE_STREAMING_SPOT_PIXEL_COMPENSATION =3D 0x06,
> > +       IMX728_REMAP_MODE_SLEEP =3D 0x20,
> > +};
> > +
> > +enum imx728_drive_mode {
> > +       IMX728_MODE_3856x2176_45_4LANE_RAW10 =3D 0x01,
> > +       IMX728_MODE_3856x2176_45_4LANE_RAW12 =3D 0x02,
> > +       IMX728_MODE_3856x2176_45_4LANE_RAW16 =3D 0x03,
> > +       IMX728_MODE_3856x2176_45_4LANE_RAW20 =3D 0x04,
> > +       IMX728_MODE_3856x2176_45_4LANE_RAW12_HDR =3D 0x05,
> > +       IMX728_MODE_3856x2176_40_4LANE_RAW10 =3D 0x11,
> > +       IMX728_MODE_3856x2176_40_4LANE_RAW12 =3D 0x12,
> > +       IMX728_MODE_3856x2176_40_4LANE_RAW16 =3D 0x13,
> > +       IMX728_MODE_3856x2176_40_4LANE_RAW20 =3D 0x14,
> > +       IMX728_MODE_3856x2176_40_4LANE_RAW12_HDR =3D 0x16,
> > +};
> > +
> > +enum imx728_awbmode {
> > +       IMX728_AWBMODE_ATW =3D 0,
> > +       IMX728_AWBMODE_ALL_PULL_IN =3D 1,
> > +       IMX728_AWBMODE_USER_PRESET =3D 2,
> > +       IMX728_AWBMODE_FULL_MWB =3D 3,
> > +       IMX728_AWBMODE_HOLD =3D 4,
> > +};
> > +
> > +enum imx728_img_raw_mode {
> > +       IMX728_IMG_MODE_LINEAR =3D 0x0,
> > +       IMX728_IMG_MODE_LI =3D 0x1,
> > +       IMX728_IMG_MODE_HDR =3D 0x2,
> > +       IMX728_IMG_MODE_LI_HDR =3D 0x3,
> > +};
> > +
> > +enum imx728_aemode {
> > +       IMX728_AEMODE_AE_AUTO  =3D 0,
> > +       IMX728_AEMODE_AE_HOLD  =3D 1,
> > +       IMX728_AEMODE_SCALE_ME =3D 2,
> > +       IMX728_AEMODE_FULL_ME  =3D 3,
> > +};
> > +
> > +enum imx728_fme_shtval_unit {
> > +       IMX728_FME_SHTVAL_UNIT_LINES            =3D 1,
> > +       IMX728_FME_SHTVAL_UNIT_MICROSECONDS     =3D 3,
> > +       IMX728_FME_SHTVAL_UNIT_FRAMES           =3D 4,
> > +};
> > +
> > +enum imx728_linear_raw_sel {
> > +       IMX728_RAW_SEL_SP1H =3D 0x0,
> > +       IMX728_RAW_SEL_SP1L =3D 0x1,
> > +       IMX728_RAW_SEL_SP1EC =3D 0x2,
> > +       IMX728_RAW_SEL_SP2 =3D 0x3,
> > +       IMX728_RAW_SEL_SP1VS =3D 0x4
> > +};
> > +
> > +enum imx728_binn_avg {
> > +       IMX728_BINN_SIMPLE_AVG,
> > +       IMX728_BINN_WEIGHTED_AVG,
> > +};
>
> Not used.
>

This is used for other resolution modes, I will remove it until those
are in and it is actually used.

> > +
> > +struct imx728_ctrl {
> > +       struct v4l2_ctrl_handler handler;
> > +       struct v4l2_ctrl *wdr;
> > +       struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *again;
> > +       struct v4l2_ctrl *h_flip;
> > +       struct v4l2_ctrl *v_flip;
> > +       struct v4l2_ctrl *pg_mode;
> > +       struct v4l2_ctrl *pixel_rate;
> > +       struct v4l2_ctrl *link_freq;
> > +};
> > +
> > +struct imx728_ctrl_point {
> > +       int x, y;
> > +};
> > +
> > +/*
> > + * struct imx728 - imx728 device structure
> > + * @dev: Device handle
> > + * @clk: Pointer to imx728 clock
> > + * @client: Pointer to I2C client
> > + * @regmap: Pointer to regmap structure
> > + * @xclr_gpio: Pointer to XCLR gpio
> > + * @subdev: V4L2 subdevice structure
> > + * @format: V4L2 media bus frame format structure
> > + *             (width and height are in sync with the compose rect)
> > + * @pad: Media pad structure
> > + * @ctrl: imx728 control structure
> > + * @clk_rate: Frequency of imx728 clock
> > + * @lock: Mutex structure for V4L2 ctrl handler
> > + * @streaming: Flag to store streaming on/off status
> > + */
> > +struct imx728 {
> > +       struct device *dev;
> > +
> > +       struct clk *clk;
> > +       struct i2c_client *client;
> > +       struct regmap *regmap;
> > +       struct gpio_desc *xclr_gpio;
> > +
> > +       struct v4l2_subdev subdev;
> > +       struct v4l2_mbus_framefmt format;
> > +       struct media_pad pad;
> > +
> > +       struct imx728_ctrl ctrl;
> > +
> > +       unsigned long clk_rate;
> > +       u32 fps;
> > +
> > +       struct mutex lock;
> > +       bool streaming;
> > +};
> > +
> > +static const struct v4l2_area imx728_framesizes[] =3D {
> > +       {
> > +               .width =3D IMX728_OUT_WIDTH,
> > +               .height =3D IMX728_OUT_HEIGHT,
> > +       },
> > +};
> > +
> > +static const u32 imx728_mbus_formats[] =3D {
> > +       MEDIA_BUS_FMT_SRGGB10_1X10,
> > +};
> > +
> > +static const s64 imx728_link_freq_menu[] =3D {
> > +       IMX728_LINK_FREQ,
> > +};
> > +
> > +static const struct regmap_config imx728_regmap_config =3D {
> > +       .reg_bits =3D 16,
> > +       .val_bits =3D 8,
> > +};
> > +
> > +static const char *const imx728_ctrl_pg_qmenu[] =3D {
> > +       "Disabled",
> > +       "Horizontal Color Bars",
> > +       "Vertical Color Bars",
> > +};
> > +
> > +static struct imx728_ctrl_point imx728_hdr_20bit[] =3D {
> > +       {0, 0},
> > +       {1566 >> 4, 938},
> > +       {105740 >> 4, 1863},
> > +       {387380 >> 4, 2396},
> > +       {3818601 >> 4, 3251},
> > +       {16777215 >> 4, 4095},
> > +       {-1, -1}
> > +};
> > +
> > +static const struct reg_sequence imx728_3840x2160[] =3D {
> > +       {0xFFFF, 0x00, 1000},
> <snip>
> This is one heck of a table at 3268 register writes.
> Are they really all necessary, or are some setting registers to
> default values, or duplicated elsewhere in the driver?
>

This table was provided by Sony for bringing up the sensor, I don't
actually have much insight into which writes are absolutely necessary or
not. A quick glance shows that some of them seem to be writing default
values for registers that are changed later, but comparitively very few,
and I'm hesitant to change anything in this table given it was provided
by Sony directly.

> Thanks
>   Dave

Thanks,
Spencer
Please be aware that this email includes email addresses outside of the org=
anization.

