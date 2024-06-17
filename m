Return-Path: <linux-media+bounces-13378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB390A391
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 294E2B2126C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 06:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2EA1862B7;
	Mon, 17 Jun 2024 06:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="gg6dydMr"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F96184134;
	Mon, 17 Jun 2024 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604013; cv=fail; b=qJvgOrNLIFLLsRbdDuwiCxKKNBsRmpO6wHgadrfq0ao/4pNHofapxhwdBI4kfavHSizBDE3unNwZ/hzUil+dZmK0nMGzw9OjRwjoJGnV5dXfG7zjEPkUZqQATD8gZQAqw8tMnZ6YjG4INLKkbES+HKGZIBiT0JJ8JYMLTHRnsP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604013; c=relaxed/simple;
	bh=VMtPjfoOC0XTH+riNVMx8QR0jvlY6HzL+4rikDpX08E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M5Lmpt3rxMGQWCBV+54O1NM9xPyRqvX5BYpiJfzLwVytL/MtnoordiIQZ3iUdlrwEy5tHYg/iv42IiLecOtVCOrk8sIHlSt5P72SKW9tiF6/scuvlnSseeDRIOVMXTFQ6MgRvchhSyWkgySyYonFeRl6rO4eTuN40CPS2dvHXpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=gg6dydMr; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GprCnY3VSZaKW1aN4zlUB5y/fgiqePpTZsK5HuV4jegSQdpcnU4matOFUsd6xbR+zDBKPkEb73WdncfSfJk8GO5jA27eZkC95u7OwXmtWgHXIeWuru4qAFkm3pfLzQEKrrWrEQiVwWdX44n5RT7VpatYMXhoqQ+N+tLNPJACmo7lc94IDdd1xFwFDTZi/1Y2CnPy7ca52McSVB4MtxACHmxFYBKWjR6DyRIkKvmAnE2VEIkgxtnaLhEdkqaZWtkWyDwHQ4qgOLjCXuh6G7dKMbxnu08tssSR7r/wFMOLoIVa4hfW3kgZE2GcXzlHqdSKXwOklIDfYc9ClTbqH3ralg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=nxvwjEyqyhIY9pR3ennf2Q0V/CGth4JaqpDaAh64t/kKYjG8fEVx5UajmjHyum5yhCVCemFVM2/dDo6jDTU+fLogBVhQfcVWErkMlRSlDPk5DrANtok856kcQ5IzKi4jdKm+aOIdoA/JVmPx9+2eIkwgizs+hbrcCgixzY7khI7tMT3gmdQBuaBYTp7lXR342K9IszDPRjJgwx+SrByBS73pgtubTpUIfZfbxFSSRS+XH05bte5WDhoteW+9Z25Gwz/LRnA1BXwQ+a3PFrOkTJoJ5P9JJhyni2WTUNMQZP9AoEwsRlKJHfxXswJc3e8YYkxBx6/4lE3oiaWSQMKLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=gg6dydMrVCDW92vjmOMRVpKeoxJpmAIZ08bt+BcEboJ+R2BfiguAfZ8aLPcrJXcsgL1LjyRTQODAuRulBTSalbJ2Z4TXiagm8lctHUMtkR4mhgpTN76g1osXP0JZZvSJEjUxAioqJ/jmGAoFGilYwpsYegPTGRvdziZHTp2FKkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB2915.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 06:00:06 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:00:06 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v6 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Mon, 17 Jun 2024 14:59:57 +0900
Message-Id: <20240617055957.135-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
References: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB2915:EE_
X-MS-Office365-Filtering-Correlation-Id: 432afdf0-e15b-4a5b-1fc1-08dc8e92bc99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A3lvt+LQ23/QlTe6GTuT00hLOICEJnoOxRGut2x7SUlcbrfRk+CLbyWjFJK4?=
 =?us-ascii?Q?O4fzAKpBptVF7tFAwKeKez78lFyAhYTdTuEp77G2UTnXONyHgWqF08BXLmez?=
 =?us-ascii?Q?jw9xUEz4w20UyMcJB1QUQjCVjvhITSnQZuq6NqMyV2z20SgV3tLLLGBtBExx?=
 =?us-ascii?Q?yrRX8rB6uY8fvbkaPRbTibb+YRxtbgVitrZezMBvUWn/W5HN0hureJ84T7FP?=
 =?us-ascii?Q?zxHji7vN2WKUpAt+B3ZUE54lyOybOfS/fM7Qj8GkZLGSkGOAU4U+GV6UW0Do?=
 =?us-ascii?Q?Kj6CIlc8Jlc1bddM6jVS9fpP0/FkpgsmdBngJyGsSF3sEk/r+RCEyKsV3u6g?=
 =?us-ascii?Q?nZ9Iw281JzLrHU0Qj0TwSr6UUVUuqVyVrFVTgGyoIbHNxACwvNlrx25SEugh?=
 =?us-ascii?Q?U4r28oMk2VbipnGb5odkUi2qQQsLpLNNv2YreyD/su4C/g6nrEYVoJ6H90AY?=
 =?us-ascii?Q?sd7doZJhgw3YWySmbT3bD/JejQLCXDczOU+ZH9BtQQ6uwkIQm4a+RGh2lz7k?=
 =?us-ascii?Q?0byvBFa1DAD82YA0nEjAwctrrHyFF5w5fXtQOM1pyR18cfHn0GmRgbm/umbj?=
 =?us-ascii?Q?8yjSJo7KYBsNiSywrFsIhxMVl91KwtQuvgl1XofY8tXpfxt7MvTwLAZwuJkS?=
 =?us-ascii?Q?RrP0/WE+ZRxzHE1YiDrjy10NNgr+YWraDUrSkFOlfw4Frpwzf26k1G4grk4c?=
 =?us-ascii?Q?69OYpNJ+Ur49NzVnSTEd55xjg3Abu/8tctJ2AjQqtdcZuszg3C0oTPzl4irQ?=
 =?us-ascii?Q?R34RstiFFXdc2XnuEvdJRSvkm+1i0j41REYW3OVPRYpK5HSM9zv6YF7TU5BR?=
 =?us-ascii?Q?wqIGUKRMLI8f/vENEAi8VryvyYZPOlijAQzVg8r+GBvDGSrVGYKRveoPRC6W?=
 =?us-ascii?Q?A+n8j2ZHaOYQSguMtZhEVN0GeXVYkz69DZPNyT3HqQ7nzFLoZ42Yx4FGZbpZ?=
 =?us-ascii?Q?zY+32AY8MeayeKMljToXzr6HRGKe4WNRjZEaLtjQM4A4OGM0LIxB3oHH6cVP?=
 =?us-ascii?Q?i7r/A/GS8qD4SSbH3S01OC+OCMsVC+IUeCmVHQbJDnJr1UFGpu2tYi5Rw9e0?=
 =?us-ascii?Q?mD9E0A/wnrtX9Ut4jJgFTSj0BnWJH9hzJlIp86APOP8s6Y+VfiLEDLbuoU1u?=
 =?us-ascii?Q?ldhJ+DukwnY2rmr8DRT2HRi1yFMmiGT7XIFJpzIn1L91NBgd5c6RZNn+V/NM?=
 =?us-ascii?Q?/TAwXZToI+buvoVzTeNeW5HBEDvPuHIge/4LHpAAc8/7H3QHnFYiAGD5nS3P?=
 =?us-ascii?Q?zmo7N6vHszxXZu3YAbbKcAKAhoQdMstZ4x6wJHZJOvmn5gZGddGaJ5BBWath?=
 =?us-ascii?Q?TehGxyt42Xk9IuKFZSo5L8BWEabXv8Rn4YWoOneGJqROXVZ7xc02Zerad8PL?=
 =?us-ascii?Q?AXZOvJM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7qu9ro4a+6tUIKX2oJlPKAxtcK1UhorrAspa5szmGYbvpsnnPJCBUfi+gfC8?=
 =?us-ascii?Q?qAY2sTiLuJUYEZKFuQGP2etzg94VRWO0fKkuAVrUcqyYRarlCzabgNmfksx/?=
 =?us-ascii?Q?BWO2ihs7iqsoZoXPPSzNWMb8huHWHNQLapPf+brDflGh/4ig4uslNrGwvydv?=
 =?us-ascii?Q?7uAfL7Liuulqcq5qqz7KJdmwEIKvAMhq2sDTYdBDr47ToK2ETlOycYoAepTP?=
 =?us-ascii?Q?PVXj0z1YYndjgLCJ0rulmlMty880AXrrVbGAxFzTnNktMjty16I2kawt3ihN?=
 =?us-ascii?Q?NcHJSMgRbVRniN9c1lq0B+cENw87YvArf0+AUHvww5z/1YR9dMO59/hflZGB?=
 =?us-ascii?Q?GZ83TbGNJsp0f8r8hhzxpYF8Eh+MfXZ0bj6ZGIBds9B8xfNskde+kgGppJKR?=
 =?us-ascii?Q?u6Bvi7Z1gNpDnFGkoyIPXyPaWL8Pr95qKteH7DlMNG3Jgrip+uotiOByz+KJ?=
 =?us-ascii?Q?4wPVVdcj7DFDEAOcUi8gauSQulyaLWQvvj8Lw312dUUNIpN10XTyOA6MfPHE?=
 =?us-ascii?Q?IKDl1TZ9CZROqMVy3qX5Bn0No4gfI3f+C2tJfgvLpzgwFM7/LwzJ/71xdKC0?=
 =?us-ascii?Q?EkfVeyOpPPwPC9VzNofKQHEsVikxA4zirolMlCS9SQeArYMGyrAypIMr2KrW?=
 =?us-ascii?Q?c7oWgniS/vhVA4AflT9WPd+sw201lUltFOA66EovJowPflOxEsMLX4PR8m56?=
 =?us-ascii?Q?F9SJHm5+tNp64sho4Q5xE9mi6seO6rPFZ5enYh1xrIja9U1aEw0j1Ai52ehq?=
 =?us-ascii?Q?1JTLxG0P6kV4G1H7EO6FutFZxCtIi8vlwDlN+JWCm6vWChEs43q1n7e9LYXN?=
 =?us-ascii?Q?Ra9SFJocgWdtCnsFfB8awUBIVDbPZnhVV2qcwY7VtoHEnL34ssorhwTCRLE9?=
 =?us-ascii?Q?ttLK3BpPMBsH6TxyY5UF4GTYegyzAn52k6yPa9wSC6PUoy0/TmuWrZ1pRFjR?=
 =?us-ascii?Q?4I6Qnqj3nkk+tKnNPKQ2W94ceZXwF/VSyNuB0tHmHKrUZcOmQgrCei5Lrs7L?=
 =?us-ascii?Q?DnkwZAIqJvLeejiTbr+09S/iC+81z3tYabE1568/DjbDAP0q6foWr3/ZKav+?=
 =?us-ascii?Q?ijWId8Uw9rc5/Zgu0xhXH2kRGe5ebJ7urbw7mb10VyWZcsg16oOKo0cPnRIL?=
 =?us-ascii?Q?k4+8g/74QaA6s/MoJG5zjs/JMBxTlWQh71KQEpRVhPo4dWhWB/4NOucMhDsd?=
 =?us-ascii?Q?Qxgw+Hsi5BRIV9yoptpY4aMhcy9oKsdhM7fu+UZJCcjp3UjGlG1Ejboj2sQp?=
 =?us-ascii?Q?XmX6RblRHXnLO/xdi9aoUlc5oSA3Vno5B6dt5gVR/MKSbTuMnkRtVaNdGWPP?=
 =?us-ascii?Q?ITO5u5YcuRMiGY3xayNwfRy0JW6B0/vqdh7bRPTo76pZFBlQxjpfRAyZaVuk?=
 =?us-ascii?Q?//vdT4Yu2Hyq2q2+z0i045fLDn/zdCxBuAkF3elCDcb5ASkTwP+Y2OaiLBi/?=
 =?us-ascii?Q?ZHJ+7LnyvA55KAPu/p7Xe4k3iSKzHKy7Fq1b9dThwTNY/zFI5TLElv2qOOtn?=
 =?us-ascii?Q?k8QTSuHPYS1reesJWbSCHLYMNk/64Z6UFev4zhF7BHc5HikLSZ28/1dThHkR?=
 =?us-ascii?Q?5o3g/n0LKXnaRcAq3G2C2vakmVMSbRR2Nk1BXJaluVDUEaSz8ymJAauE8lwO?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 432afdf0-e15b-4a5b-1fc1-08dc8e92bc99
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 06:00:06.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90iSjDrR7SJNUba01aSq7Nf/dhe26ftwOvhHFlZK+gozvTYQ4Wif6wu/QpCLK3tqFhzOkNNO5Jjdalghp7l56TkBovVqojoPSgLsFq7wcjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2915

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Add support for the YUV422P, NV16, NV61, YUV422M, NV16M,
NV61M raw pixel-formats to the Wave5 encoder.

All these formats have a chroma subsampling ratio of 4:2:2 and
therefore require a new image size calculation as the driver
previously only handled a ratio of 4:2:0.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../chips-media/wave5/wave5-vpu-enc.c         | 89 +++++++++++++++----
 1 file changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a470f24cbabe..fee24b427fd1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -66,6 +66,30 @@ static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
 			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
+		},
 	}
 };
 
@@ -109,13 +133,26 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 	struct vb2_v4l2_buffer *dst_buf;
 	struct frame_buffer frame_buf;
 	struct enc_param pic_param;
-	u32 stride = ALIGN(inst->dst_fmt.width, 32);
-	u32 luma_size = (stride * inst->dst_fmt.height);
-	u32 chroma_size = ((stride / 2) * (inst->dst_fmt.height / 2));
+	const struct v4l2_format_info *info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = 0;
+	u32 chroma_size = 0;
 
 	memset(&pic_param, 0, sizeof(struct enc_param));
 	memset(&frame_buf, 0, sizeof(struct frame_buffer));
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->mem_planes == 1) {
+		luma_size = stride * inst->dst_fmt.height;
+		chroma_size = luma_size / (info->hdiv * info->vdiv);
+	} else {
+		luma_size = inst->src_fmt.plane_fmt[0].sizeimage;
+		chroma_size = inst->src_fmt.plane_fmt[1].sizeimage;
+	}
+
 	dst_buf = v4l2_m2m_next_dst_buf(m2m_ctx);
 	if (!dst_buf) {
 		dev_dbg(inst->dev->dev, "%s: No destination buffer found\n", __func__);
@@ -480,6 +517,7 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	const struct vpu_format *vpu_fmt;
+	const struct v4l2_format_info *info;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -501,16 +539,20 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 		inst->src_fmt.plane_fmt[i].sizeimage = f->fmt.pix_mp.plane_fmt[i].sizeimage;
 	}
 
-	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
-	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M) {
-		inst->cbcr_interleave = true;
-		inst->nv21 = false;
-	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
-		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
-		inst->cbcr_interleave = true;
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	inst->cbcr_interleave = (info->comp_planes == 2) ? true : false;
+
+	switch (inst->src_fmt.pixelformat) {
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_NV61M:
 		inst->nv21 = true;
-	} else {
-		inst->cbcr_interleave = false;
+		break;
+	default:
 		inst->nv21 = false;
 	}
 
@@ -1095,13 +1137,23 @@ static void wave5_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
-static void wave5_set_enc_openparam(struct enc_open_param *open_param,
-				    struct vpu_instance *inst)
+static int wave5_set_enc_openparam(struct enc_open_param *open_param,
+				   struct vpu_instance *inst)
 {
 	struct enc_wave_param input = inst->enc_param;
+	const struct v4l2_format_info *info;
 	u32 num_ctu_row = ALIGN(inst->dst_fmt.height, 64) / 64;
 	u32 num_mb_row = ALIGN(inst->dst_fmt.height, 16) / 16;
 
+	info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!info)
+		return -EINVAL;
+
+	if (info->hdiv == 2 && info->vdiv == 1)
+		open_param->src_format = FORMAT_422;
+	else
+		open_param->src_format = FORMAT_420;
+
 	open_param->wave_param.gop_preset_idx = PRESET_IDX_IPP_SINGLE;
 	open_param->wave_param.hvs_qp_scale = 2;
 	open_param->wave_param.hvs_max_delta_qp = 10;
@@ -1190,6 +1242,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
 	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
+
+	return 0;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1285,7 +1339,12 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 
 		memset(&open_param, 0, sizeof(struct enc_open_param));
 
-		wave5_set_enc_openparam(&open_param, inst);
+		ret = wave5_set_enc_openparam(&open_param, inst);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: wave5_set_enc_openparam, fail: %d\n",
+				__func__, ret);
+			goto return_buffers;
+		}
 
 		ret = wave5_vpu_enc_open(inst, &open_param);
 		if (ret) {
-- 
2.43.0


