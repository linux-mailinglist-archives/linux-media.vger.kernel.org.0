Return-Path: <linux-media+bounces-14276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13091AF2D
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 20:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94B27B21764
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 18:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FE719AA63;
	Thu, 27 Jun 2024 18:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="TUdfI8LZ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2100.outbound.protection.outlook.com [40.107.243.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C61198E66
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719513556; cv=fail; b=ITfYke3GJp9wdVqQCYVVhJY5+s3ysYCJHt4xPUhz79q1K4sHqEQGb8cXeC7io4ivdpPCMZm8+809AhzVbYlBAUJWvtUiwjACOjtogJVY7HIxBAXMTVWo+7ceFAh0c4ED/rdDCdP6/H2yOoni9oLipsofog76urV2qd6G9NYA70Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719513556; c=relaxed/simple;
	bh=IF86MNK4LaCZMFO1uI+ckCSCUtXN7Q2A6sONz1N2SqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s06isXMt89srQ/Vt5ObWhdarIFsykjilueOsW93GpC63LnJp1uvuFqOzekMXdtE9RW1NUPGzdePXo2Vw+G/GDauOJSVc0Iy4b2tTgtHjGfo8YnGOJppNOLWfR5Bqs33AhwsgUKpS1wH2tSII1uwOXgmypOC6AbHCA5hkGD0rbe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=TUdfI8LZ; arc=fail smtp.client-ip=40.107.243.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KESPhfUr58bDAB770VhZAoHgFH6ffHJmqJkPNvNloBSQO9HVgfC178Gz2sipnYaI7sn1ljnvzzS8j7s+Krmzfzz3xJqQhTvz591cLdBqYKt6XafPVMfAK93aFmKcvwUmHJhxAZcXFzh93w89kSEVrOhvOmZZu6V3OVXvh9GwAr0mZ56zSuN4jx3c2BpfopqCw/qJ7BET2JS42uorwk4QOUQ6cQEZAWvTrbi+AqOK09pvKipB1M3PdInhKMWXtul7bJAEuHTDniQvLzksuXDWEsaRc2bWcAhkX0A7RZuCstMElBr7NynWV9xEZNCzLZ57ZHxvQRqYTH3EdZ2LnkZYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm0L9YhlH+f9+sqAYTliEwkKs25p7rr/bsxFqUPEjaM=;
 b=ZlmRtid79z7+haaTH39TDcplQwku5x8sYRCmmJVO8aGrdrvJV0H+Yvw/ogr7L55aQwTAzzjF9uU4vdp/RF/UzJikZtxYff1K3f5nh/8xoPfnJLIFwGp07VDfx5iQ3slcr1TvAwVNK0KamMqtje8F3ICUNpkO0FxUMcEGFTKX9oOFc7fYH8Wh98aIcjjSohYWpMewuJ1RWOv9oENnA+AnuyIwmxdXRZ89T2LD2rHyPesQ9HpVRBjQewmqMpIo/rjKwY4TxO2hKNEdnjvMdqBTC6JQ2i+yVmRebP+F7IP2FpxktDrL0gww8b5qfWnh9FvvlQk7tUEh9eoL7d9vK+ZjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm0L9YhlH+f9+sqAYTliEwkKs25p7rr/bsxFqUPEjaM=;
 b=TUdfI8LZvWbaKPwaBCIT1zATDGTDs1HrkttM70FTkHxu7Zr4Qg6HRxNp+Io14Neww0UqBbAmdahA65lySUusGd55N7tDGLtv2+/caxOcdA5VjgLteYYMc4hPkGejg408t4hZs+biL8274n4e0caQrPj4RJpSXcmAnTFmNDNtjws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 DM4PR14MB6375.namprd14.prod.outlook.com (2603:10b6:8:100::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.20; Thu, 27 Jun 2024 18:39:08 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Thu, 27 Jun 2024
 18:39:08 +0000
Date: Thu, 27 Jun 2024 14:39:04 -0400
From: Spencer Hill <shill@d3engineering.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	shill@d3engineering.com
Subject: Re: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
Message-ID: <Zn2xyPB3rDvSqssS@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-2-shill@d3engineering.com>
 <2688825.Isy0gbHreE@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2688825.Isy0gbHreE@steina-w>
X-ClientProxiedBy: MN2PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:208:d4::16) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|DM4PR14MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4b5e84-30c1-4778-1856-08dc96d86de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?fdhp7uaI8Qw5JjzyDiu/F8UiddmLM6ULUdzYwhhg1x5L+rark+qx+zPRtL?=
 =?iso-8859-1?Q?w69vqihaiPbvZMosUO3VHCGhqDdBMBk3WUNqsqvlKQOdj7K/wilIDwNZsF?=
 =?iso-8859-1?Q?hw5K0rIImYOQbHLKr7dBYqCyEfWGOeIdDKo3lUyCVIKogHh6lcMDwH4XGB?=
 =?iso-8859-1?Q?ntFDrkQJFssy8B/IZn1LYHOJz0YeHZVXeJ38eaRpBq66Xq10iZywW4rH9q?=
 =?iso-8859-1?Q?g20d9FZKPiCiqyC6taRF/QEccGoXoPSfEPY+pOOfQ1lthPstkTQej+d1xU?=
 =?iso-8859-1?Q?RfAN/zDfwbS70fPal5NWiSFJUzZh9vzCE93UrBP1M8Oc3h7ZVlcN0i6UXo?=
 =?iso-8859-1?Q?pMd6PDuDPjiJkCWaN2CTPED5fJayVddgqBOT7bkukCOYrGdkHGfTjAKaLc?=
 =?iso-8859-1?Q?2F6y4+k6L4+Zhs02BvZnB97ZYM0/KXyKibLSmCSW3Xot2lxKDW1PEfzvJ5?=
 =?iso-8859-1?Q?rZOvVhXkmjr5h+7MGFIQSRqHW4BXTfnZp4tHjV24KnihfWxzv+t/z2aUa3?=
 =?iso-8859-1?Q?DaHMZqA2yYaRcB+Ote19DgLaB60ghjiV8lAAMfCBhhZl4Q1MSnUTJC26vg?=
 =?iso-8859-1?Q?dFvDFL1CG5cGCm8AzipHuhj4nOUYWCRj6BVYM3TWMykTnZue3yteWUm3ow?=
 =?iso-8859-1?Q?ZXMcORicbj8KnmaML3H/pZLkqGY/qSP1GmzZPKEvH84EcpYmlTyUWVt30H?=
 =?iso-8859-1?Q?OrM9IrIpNLyLl2d8OWPRpCe2iNtjOP4b97SbA/56YbEmVZsm45NTwW1IHR?=
 =?iso-8859-1?Q?xl5soi1RCEVaPDZvkpcnpOSJcEiacN9tEH4mkbout7vz1tSqAWUX92+DPC?=
 =?iso-8859-1?Q?j0ZB2tKui4Tw8Vc3+zJdeJ/TBdpTFbK3EuKklSkueisTSoqLBpS9p3/cf+?=
 =?iso-8859-1?Q?+rwbsG6TAbO/1T6WngRzh4gwIaBCg1eyREWowZ6GR+H0CdkEncbrhu8P71?=
 =?iso-8859-1?Q?U5fNGmQbY92hJy8tpbxsOdFWYes74KfMyjREVyV2VzGvZz1XQaXaszEKAi?=
 =?iso-8859-1?Q?VsT5EeqgrtFRpgUnUDiWiGG2n2ptfj+K8C2HXWOTCD+sdQdrQOWacoVOZB?=
 =?iso-8859-1?Q?HNS2AjhAV6QXaiVT7EudjdfZASXfVPE7HmCGMhpak7gZT334U+d2Vey2QY?=
 =?iso-8859-1?Q?Pe+1yDUqfRNlGNJai8K4vkNS3R4C8rt5Lg1YLvvC6gdzVk/uZTAHXIjYrV?=
 =?iso-8859-1?Q?fBbaMcb8XyCcxC1sFL1VAheCs9JziDLhqHzB52rHVGZz+coIQATk9xCSpa?=
 =?iso-8859-1?Q?Eo4RXk/oxukSUKUq6Nj25VzM4pfS/FDuTML5+JNdcXr6Dd88TR7LcF5ERG?=
 =?iso-8859-1?Q?qQms8NmPXQszWf8liWpIlLDeJ7dn7mTz6iORb5VAVhwCnok=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?+srpXhmCZ9ODoM7/JbhZDKeoWWfLSAJaMCy7KAF8Czf/7QiUPnGuvAEagf?=
 =?iso-8859-1?Q?DjVlLH1YEE2Dwqg/rHbTsd/3wEXiIMRONfIGFO4Wj5AckVnuAgZkXJ4AYV?=
 =?iso-8859-1?Q?webDJBHg1lcTF3XpKIF9k4rwYDqWdLUhiGMaz6uWUlln4cIQS0BeDK1369?=
 =?iso-8859-1?Q?mwxJTH6a278Xw53oYSIyCiLv7nUxaEboB/CELVEZXvMVEUCVWFTPgjny8u?=
 =?iso-8859-1?Q?86syrOc8CzjRMgd+cQhkJ+CdCWzL2++zSIeGuheNZ8RomLA74cT5wl8I7v?=
 =?iso-8859-1?Q?SDuVctcMxtwn+5BTd906peRuBc7T2kW77gUilLuzKPjXWoQqBFJMjMnzpv?=
 =?iso-8859-1?Q?go00ez8plPwMn+Pi1gxFPEMX5/qXbxQmQ4dVF5npggdxnU6CztUUCHBCHO?=
 =?iso-8859-1?Q?5bMSXkg4QooUmy1nyxKhM4yHRp2B3vzEfokm8Ppzk+Ai5nGose6wN2FYF1?=
 =?iso-8859-1?Q?OkH/PeXh4h1XrGkbRArek6LMnqVNm3CokBEgBD0/bGfv1CiJpdg3KeUUGn?=
 =?iso-8859-1?Q?A+4Nk90mYgucsJVJ/rKI17AHYHZ/izuSwmS8wI/JgsvLO3+iQzJLXBGkdQ?=
 =?iso-8859-1?Q?vMGM1lXu0ML7VaQFYxVZ618PvDUCJ5yupHs2SbNiLHrh3RnWRH0IXMemzR?=
 =?iso-8859-1?Q?/EtzrfaxL7GsvRX4nrumcAS7ctN+nQdoQfdsMl6BWmGwT7B+hDkwZhOsqP?=
 =?iso-8859-1?Q?Le59fUvKuFnQOKD8+dEAyY9Ie02Ivq1rk5jqbCCa1F4MN6xNmCm531+/FQ?=
 =?iso-8859-1?Q?PFYwS4isOnCLDY7+a8WZzAbR5FkFfGrdsnarsXW8fh4J2dctKhFmLtYKwh?=
 =?iso-8859-1?Q?Yad60tfT0CBvXmEq6bTAp4lXC/WLsLqqwLwzLUOaPpE0RADTKgGx+Og0JG?=
 =?iso-8859-1?Q?euN1JIUOc/2zeHl/wBNfcBuVyv35oY1VUA3u9MHPKsfm6jskmdiWg1WUIx?=
 =?iso-8859-1?Q?rMtd1Q8Tfkl6e3h50uxuWzDtNIY7imC1yh9J6793dpQZbZXfybYqLFtQZ0?=
 =?iso-8859-1?Q?Ai6Ku8Tz23MPOLknA6iIVjLlBafW8QmT2KjKlUD7Va+8zqCvwUq15PEX/H?=
 =?iso-8859-1?Q?IKR9+WU+qXu7MfLZGu5LJahHMW73Hi2f68bN0HBA9Nx/PBZd7JVcYIi/9V?=
 =?iso-8859-1?Q?kSj9tGgELzsV94wscenHY6LBT3Gr1xU/jJB7NNvggz9LsKp2S7T1PnVtFY?=
 =?iso-8859-1?Q?xmkg87pbZBDCiV5KFtlDOlRKFawo7C6nEdULRwOnnnKZKEhAamRRLey/PG?=
 =?iso-8859-1?Q?rFgDQpfkNUxtfGTTJ6StiSFJlufwD6l3Ku0BIo5UAp2q0HX8zyRNxDZb5k?=
 =?iso-8859-1?Q?Bm4i9vmO0OOZUJ6ERfxxoX+JF9+yE2DS1hZPojtHA2H0wQ4JIdFflYJnQA?=
 =?iso-8859-1?Q?P4yCoSoUQrTF/4s2guyVJbxGM2yad2R9S7+IVtIYE43Oe9CzZn05jWCYx8?=
 =?iso-8859-1?Q?CHhzdp+lJfDUAj1ZFfqkzo20GIbOhqEAt4t1DSgi4mUX3RkkCbHuBtQ3B3?=
 =?iso-8859-1?Q?1uQP8XERNSDHEOmSyVg4zdsVbW6JcSqPgmFe2tJM9y92m7qNVi+UHz/80J?=
 =?iso-8859-1?Q?NoCr7SlNUIrIU+yqcdULBJB1NkYcviN//sSTPAk3XGUS5GpjZ+4cks7k5y?=
 =?iso-8859-1?Q?nx2sg2NLNrQrdKJomhyyFmCHsfZZxQm3V9fd1/QiNkKoA7oAu1+jBLew?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4b5e84-30c1-4778-1856-08dc96d86de5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 18:39:08.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8B3682frd67hZd1A+uLIhK9+iV5sAWhP/TXdfg+8lAUF7CRiyPlBNmf3Gf7oa7/JfGkOiTyKXYHPGEiXIq65CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR14MB6375

On Thu, Jun 27, 2024 at 04:03:36PM +0200, Alexander Stein wrote:
> Hi Spencer,
>
> thanks for the patch.
>
> Just having a glimpse and giving some feedback.
>
> Am Mittwoch, 26. Juni 2024, 23:15:28 CEST schrieb Spencer Hill:
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
>
> Use cci_read instead and remove this function.
>

Will do.

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
>
> Use cci_write instead and remove this function.
>

Will do.

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
>
> Use cci_update_bits instead and remove this function.
>

Will do.

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
>
> Use cci_multi_reg_write instead and remove this function.
>

Will do.

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
>
> Please add proper register defines using CCI_REG* macros.
>

Is using those macros in place in these functions OK?

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
>
> Are you sure about this colorspace? I would have expected
> V4L2_COLORSPACE_RAW, but I don't know any details on this hardware.
>
> Also set ycbcr_enc, quantization and xfer_func.
>

V4L2_COLORSPACE_RAW is probably more correct.
I am not sure what would be correct for the ycbcr_enc, similar drivers
seem to use V4L2_YCBCR_ENC_601, would that be correct here?

> > +}
> > +
> > +static int _imx728_set_routing(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state)
>
> Why this special variant with a underscore? Just move the code
> into imx728_set_routing.
>

I will put this into the other function.

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
>
> This should be done before calling v4l2_subdev_state_get_format, no?
> Also ycbcr_enc, quantization and xfer_func are missing.
>

I will move these to be before get_format, more similar to the imx290
driver.

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
> > +
> > +       fd->num_entries++;
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
>
> Are they not configurable while streaming?
>

My understanding is that this depends on the mode that the sensor is
operating in. I believe in the current mode it should be possible to
configure this during streaming. I will move the configuration into a
new function and allow it to be configured while streaming.

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
>
> Error message doesn't seem to match. This is a fixed write, independent f=
rom any frequency.
>

This write is the enable flag for the configured INCK frequency. By
default the sensor ignores the user configured frequency until this is
set.

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
> > +       case 0:
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
>
> Please use devm_cci_regmap_init_i2c().
>

Will do.

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
> No need for this. clock frequency is available in debugfs if necessary.
>

I have changed this to a dev_dbg

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
>
> There is only a single user of this header, move this into the c file.
>

I will combine these two files.

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
> > +
> > +#define IMX728_FRAMERATE_MAX           30
> > +#define IMX728_FRAMERATE_DEFAULT       30
> > +#define IMX728_FRAMERATE_MIN           10
> > +
> > +#define IMX728_PIXEL_RATE              225504000
> > +#define IMX728_LINK_FREQ               800000000
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
>
> What does ctrl_point mean? What is x and y?
>

Control points are used internally by the sensor to adjust how the HDR
data from the sensor is compressed into the output bit depth. The values
used were provided by Sony.

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
>
> Are you sure this is the only supported resolution? I would prefer using
> actual numbers here.
>

This is not the only supported resolution by the sensor, however it is
the only resolution that I have a configuration for at the moment. I
will remove the defines and switch to actual numbers to make supporting
other resolutions easier in the future.

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
>
> Please use struct cci_reg_sequence.
>
> Best regards,
> Alexander
>

I will change this.

> > +       {0xFFFF, 0x00, 1000},
> > +       {0x1749, 0x01},
> > +       {0x174B, 0x01},
> > [snip]
> > +};
> > --
> > 2.40.1
> >
> > Please be aware that this email includes email addresses outside of the=
 organization.
> >
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
Please be aware that this email includes email addresses outside of the org=
anization.

