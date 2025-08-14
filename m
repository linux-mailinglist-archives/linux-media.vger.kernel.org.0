Return-Path: <linux-media+bounces-39916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8951B267DA
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 15:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29B1E189CB24
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 13:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC3930E0CC;
	Thu, 14 Aug 2025 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ASjLcqab"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012063.outbound.protection.outlook.com [40.107.75.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BBD307492;
	Thu, 14 Aug 2025 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178252; cv=fail; b=UToAKw3QSYpt5IIBiwtEg9GTLPAeHJjZtiAahEMwm8JOc73ak1geRhMQH1LPQsBE8DhF55R6dk411ZQ68d/BLOY9nf0LXXytyfseEW/EcwJXSzpVdVQnkhtzgHucVrLU5/ZeTGX9uFw9M+KXdfRHJ50ZEbv0NM7X66j7dac1qO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178252; c=relaxed/simple;
	bh=gKSSAgmkySrLAkVUqzeaSenMwepIwiHfj93vhYtiI38=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bSyQFQcuHs0Yu4UH18ZHbBS4YBrMYZKdRMymttvhShYNTXqCW8iGgj8Nq0uV9qRgauNmluaczAdvKRRMTH02+EmWDE2pQr7Dy6Kg6EkND39mhTi30FtA5gDVWjwWy4LNjyfQAqU2Nr2eg3yAU2/k3Oqfjv/1Asn1KxXecr+tY/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ASjLcqab; arc=fail smtp.client-ip=40.107.75.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe477L9BoHBudDvYc4xRnTJoEg+IJKRBhzdVQ2kN9Lb3omvYtEiupwlDwlG3VEJtOLILGBtzQzSRSNt7LJjUrnHMVq4B8eABPLb2wRKXQzebaVF3wpBvKm42vLG3cMuyRvID9EJXFQAMktiotXXV8HSdzYc8CAOsCFZAX58uUVnePLzK71kIdUWMI+TA4+ICbg/r1wAsSj9c0UJWmrInVvvgDMLW/v51m4lB9wnVFZEFKrrIW7arLfjvGxJMbBneC+27zlQcwt4tU4JdmU7jw5eb0+TQimeEIUNLsO/vwYCpyGcvtCnjO6cR+WdgMoVFRDSHTx8JUvvIikfbobM6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/FhS+w0rZn61MZXATBH5umOL+/7ttnYZOVKLfAd354=;
 b=o8y/N+FOiZRPT/PbIicwemAE+CY2q0rxnx9TbdSZYwhDCFvKLjly/THszgQNO7cOXXha0o71ROGbEb83ZtlCpYxfIdbn4LYictnsdd7Tro9+zSzCNQMLzNSJO8gIpF7RVWivDKs8J5p0QtpNvrhPAtO6+RpRcHCVJeokDlT9QWQaMvMFsh9/wXLPu036ZmfPljO5S86jvd9V3+hlx9I1N/AMiRsv//7+VCSHzJ3LkXmdE6QRHfOxZXpmJlkdsMtDMKRBNU1QVqdtKwpzTXpuKbpfELKAueA7+mvqEpUss6T4GJn8mnOVpoFPNhdnbJqotWvUrAz3Xcoq8K2aoO1y5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/FhS+w0rZn61MZXATBH5umOL+/7ttnYZOVKLfAd354=;
 b=ASjLcqabZN4SLQyhrDa2+BQ0lI8trdmQTyL1gdDyQnxOTl0MTzroxBl0/MlxTOeXdYLvvypojF4nGYw14DzbvXCioB/DOQwIMIpn7yAT8pAgVJRugXvIwXOgVO5SpkaKCQ7rdUfW/NBNH8gME4eAHktXq+er2XvPLpi0nFK2NLP04+sX8faIeHsrjcGCcCsd06stOQEZw0qeDPkard+DNLIhMTX/maoHrY7c0rrSAv8WpSL1BiY0XbtMMZRQEWWtxVqiWRmm9F09BaAqL04LCthkuv+TTGeGHY71hRMsxzUrK2gxexgHwsxjtivfqaNE9H8I5+exMAzRZ5HQwUs+AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 PUZPR06MB5819.apcprd06.prod.outlook.com (2603:1096:301:f0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.16; Thu, 14 Aug 2025 13:30:44 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 13:30:44 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] media: atomisp: Use vmemdup_user() instead of open-coding
Date: Thu, 14 Aug 2025 21:30:29 +0800
Message-Id: <20250814133032.236533-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|PUZPR06MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb68d61-d82e-42fc-3751-08dddb36c525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g1TjJg7U81eRpbmRBHexB7JufZiDgevOikrbpGkthmD/aWP+ZvaIDYj3N3zz?=
 =?us-ascii?Q?jAeVKEz6rrMSOnFYmU/MY3SlV1BKdVPUUOxTIgdA0z2q2BS4O6XcbZOXuCF+?=
 =?us-ascii?Q?0AEaFqjrI1G2T3Os0IobfzkjtIL+9idzTRmkTP4Q3XbpS/ppprj4U/e8/Cpq?=
 =?us-ascii?Q?VW29AprVHwEGQ9Qxhw18AknzvGmTUGk17Tv0hWmfchLOiP+HUGo6wAWs84xQ?=
 =?us-ascii?Q?NMK4UVfVmr8WEE4bDInOP8eDFk1OFg5n9G3nH6kLBUTivCIZ/Gia8Fe73bqa?=
 =?us-ascii?Q?97f3MFcYhGIq3q2QzarT3b/KaMeqFI8y7cRWX050Z/6QcT0HxWIXgZTB7QAv?=
 =?us-ascii?Q?T0JsgHV66dzK3PTuc59C9QPtepDNDwy35Kub+bZe+T0gUsYv5IotbmGXyEzd?=
 =?us-ascii?Q?JdD8VsBgrGpaeud4HvmE8J88QItTa+mgjMGzfQVzFs2/QM50qzNhE6ITGIFD?=
 =?us-ascii?Q?9nAYMd8W9vu+A+9nC0+ij2iOZcqtvOQS3rN1eDP+byO5mtSK/rMYWGCD0o/i?=
 =?us-ascii?Q?tedGrZywRu3ufyJkd3PbUjEFgDYVUWbhfqDRaDJr3vqmDQ5aYOtAqmnNUzZ7?=
 =?us-ascii?Q?GpvqG0S9uVE3Jm2iHP/c42n0DDq9YxGgutv+11wQk6x1ii6uVupPGtlUcWc/?=
 =?us-ascii?Q?ijcuizwUh4jgp4DBZLishUeNFDP9QyhJYDnxvxk5SiLCUot7e+p8VFL5y5Be?=
 =?us-ascii?Q?byNJxb9LXFEScKNu9PzhoY17uEHy1XgkHpFsV+XYZVu0u3zgR4h46Ozj8RjH?=
 =?us-ascii?Q?P78nZSPtGwyC/Xn6huPQ8qFObXvSODPvSU2gEa1X8qP7iDyayKvXoADtk9hR?=
 =?us-ascii?Q?N214ZhqOCWN6BzSvkX+twt+d2aSi/314jim0O43u/8t87tAMg77ozGTkHlmj?=
 =?us-ascii?Q?Xf5iEJdlu8VFHyKksBWM8ReLm/5da4VfWms2WNqPniBRDwXF4wvTS5gGo6XC?=
 =?us-ascii?Q?7/F33/FB0j96dnNLWY2rSH11G4+MI4AYR05kcw53dUJXQLZ5+9v3XZXgfprI?=
 =?us-ascii?Q?NWyCY2brAGeE/B/xi75pTZahSQEIHs6Lh5rw+rChsnrzLnK6zHE77Ifo/8PG?=
 =?us-ascii?Q?wk9Jp/KfVze1LvJVCUQilpMsrUiu38U7FF+pQGptdsrmBGCt5FkB8uxotavq?=
 =?us-ascii?Q?j6rd/DqPd1FOt3KK0skJXjbUI8Z9kkDYnLj5pnnGW5/9Np8Abe05i9mA8vvQ?=
 =?us-ascii?Q?bRseekNtPJWhdb5nou/n8UNt7TGzYcXxGvnBJQCX8uml0ObpEk+nys7Ly+8f?=
 =?us-ascii?Q?auR+NneSDH9Yd268uFPqZye0+PQFpJF5wFgFECGAhezLGqqWbbO5wal03QM2?=
 =?us-ascii?Q?0c7CI3POjRd1+80zAQyGkNfpc9gUTs7ZRHsrntsiNKEb6eUWeIwA5VQF7zjl?=
 =?us-ascii?Q?N6U9Wt/q6ItWRig5jXGqkW9Vioe6Q23Ph8BxZnoUwj1DCl+rqgLcXWcbZBGe?=
 =?us-ascii?Q?M4Cm7E6RILNhPNcwPagnUnsb545A79+S00lZe+GkGSGS6BrCjut0PQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?53l8m4RPxRQsiei2ULYYFDtxHJMon1c4pwUiiCUyLCYL87Pf7ixViHagIa62?=
 =?us-ascii?Q?tjUI/UcxaJOcL8iUEblIV0pGVydDINbCrK5jy1cvkmqrqfngw1S+2FnOyqN6?=
 =?us-ascii?Q?EdfRKA/C3UuNrrpl5ce9Hst67jroHtq9nvqfPlT7D9MhowSlL5SAS4qtkRy2?=
 =?us-ascii?Q?QtW62yRVTTmGiBX+m58Qa34TiMNMw2mHwnji5xxKxDddxD1H75mMIbG83/f7?=
 =?us-ascii?Q?KVUG6P+OqI+bz10RYVoeCK144q7jWecmrXEh1MfGR/CemUPUpXUUvxeXHlW8?=
 =?us-ascii?Q?9C3xMXDetWkGqm5y2fmvVRclePnCUItPJFfMpR52j1E0XI1dpdgTvsPRrSLw?=
 =?us-ascii?Q?Bgymeu7yCiwlYRr+8oiMJNskIATU9S7yA4JuHTkmKriTwouyU2u4xAhg6NlY?=
 =?us-ascii?Q?/dNGz4s/KSlruYucLk/8lCAwnbIVOAnV8ua3qUpADqCMfkwoC7iD1HyzRONM?=
 =?us-ascii?Q?ueXiKb7xZIwHGZslE/u1FGTEUde0iwIqeZyobz7dhSzTalY+9XqltPiCoAE6?=
 =?us-ascii?Q?N2tQjbe4SobeATz1xLT1g9xqtIa7t5uoYQ2GK1Vsbj13TAPnl6h20Rv95+ol?=
 =?us-ascii?Q?8CdCa1YU40aFaijH7B26H39suCPjXxs8WsL4P5B10LKvaIMEkS4L+RJp4P40?=
 =?us-ascii?Q?MLmBSQplH3OhFNdKdurf63K+6biXyU7MB6byxOFCdKlaptgDt2Rd35fLV7tf?=
 =?us-ascii?Q?KkpwoFmanb12nk1nM5z6Xui7PKBidid81D0G/bdv1fgkNCxvJb9m6HOhcg9r?=
 =?us-ascii?Q?HVWwZ7RA/yXnwGrFQKRxACjmoyFvtMoPPwiOzkzxOTDETrWrNXiu3KPBMdEp?=
 =?us-ascii?Q?dsXUIoMHmr/4l9IOp4hBn/nTfPKfIKzp61yxrBkcIWHsTPMPapI3abogLFqD?=
 =?us-ascii?Q?v35JEUsG+jqmiPBmsb/L1GwJYtoIZn2q0P11egVxJEM9nvQtUOE3I1YZNGfo?=
 =?us-ascii?Q?6EAGDvTOvwDQgqWzDNkltFUZmrZNaTkmCcTuKLopHhVN9+NF696YD0/iYdPi?=
 =?us-ascii?Q?QkZg7FJVExbweqyGvNWlj2I+6Yu/We8DYa62GQHIszQGpS+ss1XgDynouW1T?=
 =?us-ascii?Q?M3z6A4D4K/xNzx0wgaFlQFNXG4ZX4X2DcVXgJDwX7Q9H42ApWJTQ2wkTgMGb?=
 =?us-ascii?Q?r6SkDHcwv0fMeyv2JhOX0oPlsQ+82JUVX36qFGX8gu4/zlICKLZ0VbUpNWd2?=
 =?us-ascii?Q?uIvOnzuqIwVU2gNhxCnFeDP+ZeY4FaWa37ZefWjWQmVFDhE/5PQN5DDEoSyr?=
 =?us-ascii?Q?BNojFxmGm1DxPX1Z9h3TtUUqNSEF+KpSwRkDUQ5TqHI+2MNNy2Exqx5hmROo?=
 =?us-ascii?Q?VhvinJ/+8w5o6EqiohUPiIU+c1891R/5j9/UTNTyNskg2qiKc7fM6g6mKnui?=
 =?us-ascii?Q?3VR02yRd+patB43XN1hitQZCyepDvAa+vNm5sjcXaM39eE1hffIzbgn/UKVc?=
 =?us-ascii?Q?tK8aoRHG0oPm1vpcJaAfy91r6IEp5i8Ir2/P3jILiInz7ZExsAhzC8JSaBo6?=
 =?us-ascii?Q?rrUO8c0TM/kX3qsxdBfSxv2UXGzOU/y3gckM7DT7tIkrUYax4cJr9turq0L/?=
 =?us-ascii?Q?Va7EqQmN79ZHD4kcqqoN6Rmmbfa3+keBd4M04UAd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb68d61-d82e-42fc-3751-08dddb36c525
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 13:30:44.0749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pp95NEQ38afDCUV1YL22Ia0jJDe1Dwy/VYC/J1ag/Nc3loXxPUaZN7QhomDTDq3O/6Iwdq4N6000prbPYY7byw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5819

Use vmemdup_user() to get a copy of the user buffer in
atomisp_v4l2_framebuffer_to_css_frame().

Compile-tested only.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..d6fa1605a096 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3326,14 +3326,10 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
-	tmp_buf = vmalloc(arg->fmt.sizeimage);
-	if (!tmp_buf) {
-		ret = -ENOMEM;
-		goto err;
-	}
-	if (copy_from_user(tmp_buf, (void __user __force *)arg->base,
-			   arg->fmt.sizeimage)) {
-		ret = -EFAULT;
+	tmp_buf = vmemdup_user((void __user __force *)arg->base,
+			       arg->fmt.sizeimage);
+	if (IS_ERR(tmp_buf)) {
+		ret = PTR_ERR(tmp_buf);
 		goto err;
 	}
 
@@ -3345,7 +3341,8 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 err:
 	if (ret && res)
 		ia_css_frame_free(res);
-	vfree(tmp_buf);
+	if (!IS_ERR(tmp_buf))
+		kvfree(tmp_buf);
 	if (ret == 0)
 		*result = res;
 	return ret;
-- 
2.34.1


