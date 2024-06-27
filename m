Return-Path: <linux-media+bounces-14275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFE91AE7B
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 19:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673F91F231CC
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 17:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1DB19AA55;
	Thu, 27 Jun 2024 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="M64NdKPe"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2115.outbound.protection.outlook.com [40.107.244.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05D219AA47
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 17:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510627; cv=fail; b=pbaLqb54v0Is80VTeXmt4oULRSJfLXGJMSWwm6BLG1aQFfBMIiv6hArvobneqz1l4npQYbKMqfdmvPi4SOFWBK7YvEkT5bvl9Mo0t9rr/OSuYt4PMqF4ebzYj5vgf/dWErwVk+SOKyQuit5lfj1ZdP1ipPeMuvS3xa7YmGVxdBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510627; c=relaxed/simple;
	bh=KEmVO2fDal5g518zf5EEf4yjtn5C3FL+6CQwcr4I0Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YNzXQZrVkwnhoB0930X7fClThfe0An/wrT15MwdhrWrti6Ah3FmUmrpV6nPOml54BZIyoh+BUXvjLlCkPpGMHOTilqTiApgZNO3/8vX1WpQivhw1w+0+0Mh1QIrHzID0Qa+fU2Dje1yToC0tnTM7TGUas7AfJVDJnw2g9yBuS5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=M64NdKPe; arc=fail smtp.client-ip=40.107.244.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiRXyhTBYInyb88hi4LK7r4JzmPiRP19x9BzUR8/B57B2KB7eXNvmbR9uiPSSkYUySJCoYMgL5ZyKLWPlz+MmMnHJ5wrQXEQT/EpEJQ07py1U0R0f+GIqjtNy7d2C4wXvt21XtGmql0N9tQsGCtVgoBmMl5NHB7ODd/WLuMvejNRsFkVBCQW7uggyz3wcMMc8T7GVpKTuXFHRNMDH/mDDYYL3ReZXsaT/r6kv9s6Sp2qn/DTc5C/vUG8hYhz/6fFtYMDFokuWFFS0OgszRoFUQ7YNrrxeg5RLVpg5ENV1bEpOfiPVgsXUiEl3oz7PAqf2U1C1+lw3Aaj1X2XjSC76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtvSU+hGDM1YchIAw+GYY0OIiaTZbAn8t7+bseoSsWU=;
 b=h7yzXQUVPKtUxaDQYklVyiDfJgc1oOApynEn+JN+JcMzmRPg5pwpVCWA6ed7Gcgx8es3BqxRnzHKfmlZE88y10UQDbroL6/sdZz32aKpuEYfDnDlH/pc/D7NBtbvDXBWUpRxhVNsihaDmgj6xw5W+XgqvvZ80NhwhoFIcPhjnoNMN5aYoCTAjK6+fDdAG5T8N09Fegoav7VyQuoh28JxpTmai8O5PtxSHs2E9WqqfN3aaAfP1lP6YdDPOAX1b6rNLZX8iPcpJapx0dgSPkblxxZ2mUpcPVZZv5enxFMPLYsNdZ8Ig6yRWaAtZu4pv/C8R6COtQgvwQ32IfCepmbMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtvSU+hGDM1YchIAw+GYY0OIiaTZbAn8t7+bseoSsWU=;
 b=M64NdKPeziQ0OEllNwtpR4z+qlCJvr3CMJZNRwMfQ8hxebwYOdhO1H5UyRYwyqJFjlj/eggLd9zVJcDUyIOx9MBFAJksEYLCzE3A+lpIEWs138Ni2Y11U4xJtE+Fo51fU4l6hfVWDKukYTobQiLLyKq+JEbQ2KAmszIxXAljwIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 BY5PR14MB3862.namprd14.prod.outlook.com (2603:10b6:a03:1d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.8; Thu, 27 Jun
 2024 17:50:23 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Thu, 27 Jun 2024
 17:50:23 +0000
Date: Thu, 27 Jun 2024 13:50:18 -0400
From: Spencer Hill <shill@d3engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	shill@d3engineering.com
Subject: Re: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
Message-ID: <Zn2mWm3slWT+ijF8@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-2-shill@d3engineering.com>
 <502c3e98-79f7-47f7-a960-1a0e5b4bc379@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <502c3e98-79f7-47f7-a960-1a0e5b4bc379@kernel.org>
X-ClientProxiedBy: CH0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:610:b3::14) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|BY5PR14MB3862:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f95107-b2c3-4176-8a05-08dc96d19e4b
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vaoMr4j+BGLzofd2fjXqQDZEQc5ZT6/NWfjezJvYexYvwN727HAQZmIvdUwM?=
 =?us-ascii?Q?EeIQmMxDJwx2eDVTYnsleo0Ult+OjM1F+i3GgzPRy8dGfIx5goIP3FYHl4pr?=
 =?us-ascii?Q?XnW95k0ZOtofptNz5SAGk9Kcjwn/2GbnWOHROnMv8OBkPqa5PeqEPaqGcqI0?=
 =?us-ascii?Q?9D4Qnfu6gO5vu2l/B11j2OozriqxdBcpjoVyBcKMJvo2tTIEVXRV/8eYly6R?=
 =?us-ascii?Q?ghFLoAcZSsjONcYiY5LgVk+P+78N7dY89o61da08tehXvv7KCV0BqtwSx9pG?=
 =?us-ascii?Q?rnvkjVcht8JU5l5HfjBTK4obhMltcM9BrW3iF+4iBEE5Vz//Z8rlV2ZQ7kx4?=
 =?us-ascii?Q?tL4hin3RPIE8AwOze5GAXQ8BnU3dLzZR5vxxErzDAm9LszLde8luoW4e2nHl?=
 =?us-ascii?Q?KN2rYt8NdNO72h8mlTp5S/Ah9iqmaJIr+9iolE+Cn7fC+r2VNJTDFzQ3Nhj7?=
 =?us-ascii?Q?F9RS0bE+6TlFbtlOIbFiKqga8RTrdzgd9M4YUUp6n0B0tx4roptSqAQEbrjT?=
 =?us-ascii?Q?98z5z5EtdhuNI2G/pndw9Ryc4/nWjhvgXEIwC9H3BQwhODdKec8BfMSEuyJE?=
 =?us-ascii?Q?Wwj9rju6/j3rJc4wneUFaEfWvkp5xFCPbLJ2kBu6uHNWAcYlwrLyJCAg8SOa?=
 =?us-ascii?Q?11dAmhBhArMag31TZnE/9v01+FwxuxwbJq1wZVBCE0hP1zx36tFJFgHF2n47?=
 =?us-ascii?Q?exSosaEsNtbTkirl2SAIRWtuLQdDqBymL7Sf0+xvYL+6z6EZf0afZS1rX01I?=
 =?us-ascii?Q?r6B+80VMFWAAbJLdEW5p+qSmONxlUrow4/5lPuO3o1wN3sNV9CgWhDDLBV53?=
 =?us-ascii?Q?agmMhqgtTXb310eC2E+K5ZycWImvZzbkUcM2r0LWxbFazfqKqntTTOD2CgPj?=
 =?us-ascii?Q?WEYnpiTqsX+9nM8lKzwYbNZLuPs5s6GAerWArUpvbWvgkBpAmwYMIPIJi2wH?=
 =?us-ascii?Q?DZLsZACQFZatoH9YBXPSsF9SEGKxOLXftK8BO95/PdhIAaQ3TxIB2Y7X2bh/?=
 =?us-ascii?Q?B26iNoTF+SnGTVlvDNuni6zNSrpJQFOzdGyiYaYZ5AxBndvHg4ZoZZvaOP0L?=
 =?us-ascii?Q?8IXZGjV2RAmSdnen8wX+pXWTJPZeh0FuS3gT+Q9Ye+Ah+3dQAPorpm6wq4Ks?=
 =?us-ascii?Q?dFLDnT18HTiJZoQRIqoxJ+ymEuavZgIWcM1vAiw6zl0j+fLTuQeamjlQkbbF?=
 =?us-ascii?Q?M7bSVTNVXDAWTZZHNmg2TguuKkhTyIU+Q/En0U1BmoUnG1wr9s2ZXtJI/imj?=
 =?us-ascii?Q?Gp/vvAjmPcq+pgEC4cD7uHVRgJE8fQl86Pri9YzBIkKyi2r9XS9BV62wvDxZ?=
 =?us-ascii?Q?zjDHj4cvSX35ykeG3sxEnPRsSvtBnGRUWvAjWq/ImDDxXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zkv89AhdLRLuz9C/jJ7ObT7yq4u6TCSsE+UNlnHpHDcmkK60osaNP0sVvCLD?=
 =?us-ascii?Q?c2tiXawrTJ7678Po1u5m7Hz+stPCGdi5ZFOtCpQUBZ5d6jqZfgzQiSH6i1fk?=
 =?us-ascii?Q?zSyJhtlJ18GDG7SERMStsBxgndlBtYL8HCWd8Pt9I1X9018vQKEphs9C5DPv?=
 =?us-ascii?Q?u4ZEZ5T2D1T5yvLVBIxRGhN715hGT7Lk68gPQpCOXOZWZYYKatu9FbmyjvcN?=
 =?us-ascii?Q?hXgrP+H6oNdG9z+aXIz7guLLeNi+RHkF0a8fG25acUaMzxuU23nAYauNnIwC?=
 =?us-ascii?Q?Msm2lREZymFYoz2U05FG5cSSgYN5zy05z0HjCvDQ5gvMgLiUJL7vtSQINcXM?=
 =?us-ascii?Q?1jgBbC14/NoWJhrpEqu6OR1e6BWJhrNjShMepNLdEvbV02A8oKqjj7Z9FwPw?=
 =?us-ascii?Q?3ajQBSPnYv7zMmwnzP8fYeunU1C6Ym+cbAPRhzpS3qhIC5ODKFBS30w0HCKe?=
 =?us-ascii?Q?M+Yd/IJ8wQqSXPSLu2mPntgc5KNLpuQMEYfdSkW0uRFTfQdobRSw7gk2Z9OV?=
 =?us-ascii?Q?sNTuun6SiC5G9elrNAt+GolaEO86jrBkVIfsutHDJoSzDQlwxCqvrS0D6Nsh?=
 =?us-ascii?Q?kHfjPbTIBXXmn6HO6GuT+GCG1wxQv24JcmvCgyCZI1r00P7sWk7lNx9eePnM?=
 =?us-ascii?Q?JDV/u/eQn6qWidVJZqkUeawSmkaCJfv948wBUrFdWi05K2DJMbnWXyGSgchz?=
 =?us-ascii?Q?lEwJf86wJsQKAnwF1v+N0jSu/NL/q0hG0YUzwK3HEFM9u9x03Qpn1kh/4ctu?=
 =?us-ascii?Q?rJJhHvvZ9fTGjGagoxbjQlUsOD5UPDosDfFFqQK/X8TYbhkRnjedWzUmPcZ4?=
 =?us-ascii?Q?riEXjUaWnyIt9P9w4kQy0ol5HygZPxwD/IXnMTi2tPZENs63+ldSeCOX1hes?=
 =?us-ascii?Q?KxFZyMmcmk6J7fKfychSa6558escTXio1NOX+8qkLoj3XlZL/83J4EngdB6i?=
 =?us-ascii?Q?tZ3GcgqJxkBblkqsNl5sUBP8PJZGOpEOOHfKYLPpltiZYfc6n6GJoCU5GIIZ?=
 =?us-ascii?Q?m4jqQm8Jd5IdcK36X+RUuk/mRvVo+/p4YmUAmC67JRb26J7ckflih739AhIG?=
 =?us-ascii?Q?c8/bzQhpyKcvIOJECrbacz4m19Aam8k7H+tVsaJQS0an77/5scsMUtiq8Q+g?=
 =?us-ascii?Q?mUESXrspLBkWtmMdWlV4FbhTo+3nsNYrxzROOKGqCEYxwZeaWSnp9KuQHINJ?=
 =?us-ascii?Q?Ex3EJlwlb4ArFFAj6S0YdhFV8+1CCPFtONZso7eP0RdGzbJzt26zbSbQd4kd?=
 =?us-ascii?Q?Bf0+L5eKI9KA8py19Q3wANwxoPNdSmIa2RrHaGPQwqew2pceNWS06FYqPktG?=
 =?us-ascii?Q?7IxTApiZW+qEbwhQNlQr7A/oBOunYGh+ZkJ9mvY8WPeYHIJpWK6Enye2dLWC?=
 =?us-ascii?Q?bKBd9T6m5jb407zzVabEDCCnNUgjWZvCUuE9YA0kHi3rPBjxGNUwbUnpCSUs?=
 =?us-ascii?Q?yA/zksOlbDzPshu6mUOMk/zMbeWgnww9HRvcfmusssEANhrUawk/TVeiDdSn?=
 =?us-ascii?Q?LxeMtDsb9CtCu8DJulZdOFFFrgulN3kGbD+bQjIirgnrEQbJBVneXVsVnAaB?=
 =?us-ascii?Q?efEmosE2UVYDYUqBplYS0rUGBh3rOEyNOM/c9w9JlN0es+U3cvkmpG7/hma/?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f95107-b2c3-4176-8a05-08dc96d19e4b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 17:50:22.9357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqRCgMNdjGJZeKl/FDQGOjOa5gVfFJBjQB0544cDjMmGvITKu2ETTsvi4HltEBpFzTz7uYQbNyoxUAQYTvdjWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR14MB3862

On Thu, Jun 27, 2024 at 08:57:59AM +0200, Krzysztof Kozlowski wrote:
> On 26/06/2024 23:15, Spencer Hill wrote:
> > Add a driver for the Sony IMX728 image sensor.
> >
> > Signed-off-by: Spencer Hill <shill@d3engineering.com>
> > ---
>
>
> ...
>
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
>
> dev_dbg
> clock rates are easy to check from sysfs
>
> ...
>

Will fix.

> > +
> > +       dev_info(imx728->dev, "imx728 probed\n");
>
> No, drop. It's useless and there are existing interfaces telling you this=
.
>

Okay

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
>
>
> > +
> > +MODULE_DEVICE_TABLE(of, imx728_dt_id);
> > +
> > +static struct i2c_driver imx728_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx728",
> > +               .of_match_table =3D of_match_ptr(imx728_dt_id),
>
> Drop of_match_ptr(), you have warnigns here.
>

I'll remove that.

> > +               .pm =3D &imx728_pm_ops,
> > +       },
> > +       .probe =3D imx728_probe,
> > +       .remove =3D imx728_remove,
> > +};
> > +
> > +module_i2c_driver(imx728_i2c_driver);
>
>
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
>
> No, NAK. You cannot have data allocations in header. This does not make
> any sense and leeds to duplicated structures.
>

I will be moving the code from the header into the c file in response to
other feedback, does this solve this problem?

>
>
> Best regards,
> Krzysztof
>

Thanks,
Spencer
Please be aware that this email includes email addresses outside of the org=
anization.

