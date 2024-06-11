Return-Path: <linux-media+bounces-12922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420C4903347
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 09:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626EA1C24F00
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 07:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B08172BDF;
	Tue, 11 Jun 2024 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="fAUnG+kJ"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A14172BB5;
	Tue, 11 Jun 2024 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090121; cv=fail; b=HLEGbwXQp+NxJNQGWueSylFT20dDyQ9TFFOw8eT07jPHHzgksaFs0C5TXISr+krHK8yIvX2ZzdMAJojLcKPuM2TC/Y+TQCkaxNA0n3pxm/OvgsSq6HtHP/McLGZ9B/tu2FSFhdqnjhuYdsfx5e75MLzTZlmwuytEnHUkXB9Ysqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090121; c=relaxed/simple;
	bh=VMtPjfoOC0XTH+riNVMx8QR0jvlY6HzL+4rikDpX08E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQqN58R3HfWFYzPe2eqZ8pHOeMo9BKoqY+kG5JrYADyRjAE8S9OoK+KrWZcE/D8E+BQblS6h0eqC7Elc9ifsTWqqQ8yTf9MD8NVp9by7BFmGHdMPpwjZPFl17ML7uwFS/5+EGcPiQvrNKEFSiOCeRs29gVwzlBsn59/UdKwiZbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=fAUnG+kJ; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRXwJeDAoEIffoVg2VAjqQ9phr6NHTNkP21Y5huYHliDaWxYy+FpLMMU+w0b46qsJJVK4v9xtzgkjULoXVFkatisTkHi07zrlsZkCOXRIK3t/A9+8lDQYZSLChDpqab/SJxwet19s7KEHfGE9b6enrGBNuidBlZGniqJqTUDfm49V1EqUU5EOsKlYsc/6qzqQbiQy29GwMviNjzHeOh+7QPtgmtJbJMRMxrCKMxPmPfCrkppdu7gnUWw8doatKYO2Muu7SquVDg75YotQxvxpbxHXqi31qSPUtC1Z88n+e2XZVefCG7WuzOHbgrayMlLW92FWEYFA97f4i5QSnNVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=ZGsco1arTx2hBRTUsIOIkIxv5F7Y2aHBdZmmdEQcusfGv+bAkpissIlcFyQO7nrEJAHNbNd0vw4I1ONZ+qTOTvx6F9OqY1WmjToCHnmCFhIH/nLfTs7gbSDtjkoS50zCIWQxOUo+XpWvJz+sRznKx9H0QJU6WzPRo6o3xRtqslokqMobtZ+eFzTiKLGCD42pHkdg35zdFHx5grgSPH837xsw/A2a50gq42/Wa9P+gAy1QgyENhPqSj1sMCfqNKhh1DEQY4A34Qborh/fPsylUTJpdr0R6qeyD129/o2Cewive/O83sWMrxO4ueZyS/SbPuwGOd2zFlXAQmMMPdB+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0rAwfhgGXe8i8mWUYHlL3qQfx2HZL4rsIULoSdXt5Y=;
 b=fAUnG+kJR7slXPP676MRLfkNy2PdBWmnrntSfA1j9Ks8dHzZMdVjAKDbeWhuqwJr5cSCo63Pb02eSsSISvinZVYWp/nzYJKKNsePQAAzWhDGRqEFnqZ/0grXWgncY4RSreRgUYyreujxrsRYEBO2n0mUPMrVWmrYxkJuujOgdXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SEWP216MB2956.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.36; Tue, 11 Jun 2024 07:15:10 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:15:10 +0000
From: Jackson Lee <jackson.lee@chipsnmedia.com>
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
Subject: [PATCH v5 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.
Date: Tue, 11 Jun 2024 16:15:01 +0900
Message-Id: <20240611071501.80-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611071501.80-1-jackson.lee@chipsnmedia.com>
References: <20240611071501.80-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0014.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:117::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SEWP216MB2956:EE_
X-MS-Office365-Filtering-Correlation-Id: 793cddaa-b995-42bd-8654-08dc89e63afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rUQeBllPyATxnW8xn+ysTt6zmdLMqTVKuudu+4KfhKndZLQsFGPLWo5d44Eh?=
 =?us-ascii?Q?X4kQ0MZtXAa/eAP9KSdrtCp4McWDD+19Gs24g/5R9lZqAf4oN+2FrFpvUKVO?=
 =?us-ascii?Q?h1u0iCOdp2lTi82zAJmiapM7LCKTvZ2Y7zkKdmm7LFA/8acFfWU1/zb9Q2b4?=
 =?us-ascii?Q?TZtTUoJSqQYRvgqJhwpcasl8Hi+HF6ux9Jgpl/KjoI2b/PTaqDMO8rt1CCMf?=
 =?us-ascii?Q?RCJ5oRt+gaRhjDjQ6m54AEx4dsuxLdElBVtj5h2Rc9GIraZz5rToBQdGWXPJ?=
 =?us-ascii?Q?6ZisQvFWtuRzrB7j1dStSQ4ttaEQOYMwnapFeuN3OrwnlPI/OtgdoKhV+dDe?=
 =?us-ascii?Q?4fopGGdp56eXIZjKszlsxMCIkm/LrXvSs9jsa/UvnuJyrIo86bpBQoFKV5i3?=
 =?us-ascii?Q?AciN+rHufekiGPeG0tr8jdGKKVOTPI2DIhSfNZIKvxqShwl1TfgH/6atB4sP?=
 =?us-ascii?Q?nPUIAmPmKKljDDpBTK/2uun/TRfWD8JhiyUZd2s9JcTSWk22y79SC9vD9Pxd?=
 =?us-ascii?Q?a9ctoVJN4O8/zd+BP2lUrMqaSPsATC8Nf3ec/NFcFxRAPMZDuS7BIYHGEys3?=
 =?us-ascii?Q?fNpQmjlJcmiVfUSjt06A6GoJtvKq7ADGG6Zm9i4UgzAIX3fgJrLfRM4Mc/vv?=
 =?us-ascii?Q?FP3UddXUDTb0Iaotiw+vX3lh5xxTCifjwCIupqAoVHkePDnWa51Jk1j84iGI?=
 =?us-ascii?Q?0U1wk39B5pERls2yQZuCrV6G5GiP7+DOJ1zuGEkg0lrCQwb0l9mBZ4hKEYPV?=
 =?us-ascii?Q?fQ5X8NRwJzw8od6hb2Y04xHMA4UTtnJc95f5xVjROZ+GPtgBe3m1d/uOUacp?=
 =?us-ascii?Q?wGY3UcYlIIgFhYh5oJtyVQ7rONM3R9h7MI+1JdLTpXwZf91+bNVxjnCAJihb?=
 =?us-ascii?Q?9q2C2s+0D2QyMUkmWzBEgRKM/FbzkvoHUb5UarHq8/tSExjJYTzFEmG713MA?=
 =?us-ascii?Q?nvB4zi8635XHGYsoVwql/qLKdyD6BUL3VVjccR7s7srCsCTosaWSd8NzLcop?=
 =?us-ascii?Q?G5kcp3Ol90NQjhT5mvn81TMPHzOEKQbWQsfc5NuoOdyQWGQl2YVeVzctKGm9?=
 =?us-ascii?Q?JC+XsQ+juGKI4rfAP4HNoFSEO/HkpEuZv/5q31nLAjYoz3xwcHEbwpFBvkLy?=
 =?us-ascii?Q?CeA9AFoCgipOIRtDztT1VdTLMSxNhUZNHaF0EdE0H5r4g087L78c/xs4oQAs?=
 =?us-ascii?Q?wxkQg8NNsxq7j73GiBIbPhyqtsF62DRKDDGDwEY4x3+Zo+0IC3wGt2Mhy5fK?=
 =?us-ascii?Q?RyxZ3HK/WmyUx+rncjITvtw29nsaIUVqMBzqGWoFlBKrfAniFcaTObsJcpoY?=
 =?us-ascii?Q?y90MQhYYIr0CTtTVzF00S5Gw9XFtI3BY8cmPJrO6FISOnAxOJRD9guPud/My?=
 =?us-ascii?Q?ISq3sMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z2IzdICBmeD8FkrQq/mnhbbiD4r5naIRL5yMOrmZUJ0dh1RxQn87tJvOfF5x?=
 =?us-ascii?Q?U+cl90xcFFIqZH+a0Sz3BSMtKrXOAYHi9iX4jFQPp/AqTeSVt97mLfw/1wZT?=
 =?us-ascii?Q?P1AyxBdjnQTlEcM44Nz6gY+Lf6HvaQZCe4oVkJ3v884u0WAW3/uVq7E1zEkV?=
 =?us-ascii?Q?pFUcmEV8Y08KH8o00t1aPuVK+f4ISw3PWjnkxFrEvrQV32i/Sjho5jsUgbEE?=
 =?us-ascii?Q?U0eJofeIuz4mg5qQ7TvpURfZqnUqU464z7P4401Z+3lLWWp5WwmOrcpZeF8/?=
 =?us-ascii?Q?CvVwehABkJWVvf7eJfMW4sWqfo+SCdo3wdZpDzxwdfIFU7At/C4pfFeQnNzn?=
 =?us-ascii?Q?ssO2LglNrg9u4v+IrcKI7hyUXhpaUtadvyBLeubPfk3qQUSOm6dYvQGpgqhu?=
 =?us-ascii?Q?vy3IplhiJs67Pk4egGvlhPhkBbKfsVj3RViZCSMYL4z34q9Y46J7x0SV7aph?=
 =?us-ascii?Q?7gZzEQBcT+9JvgGo8nugUQQRzpkJ2FiEMWXDD1/bXy/BM55yJXzUFYxIWmg5?=
 =?us-ascii?Q?6sjg6Tj2FmAerQFKYdnF68u12eMN/s1aQWkZYvoz6E59cWUZHsDxRw/GhTGw?=
 =?us-ascii?Q?ayAju998cGrjUO+MQVFdaNWbqm8OQMX8A+CgHB6InBHY99coxbdovasUUWxj?=
 =?us-ascii?Q?7bpUELmsAJE2rbY2aikHl7FPqMXmQ+YOjNKmu8fhHpzdHIFuvGSgF8chq/yh?=
 =?us-ascii?Q?QRncBTN8TUR+7/auwdTIu5ycBFGMSlXEiYYNTvBjPySTk7yR1PZCqz+Pi9V3?=
 =?us-ascii?Q?8hlRehoulxRm5sG3pPwOrqJn2JjlGjnt4eb7hiPzR7Vefp9jGPlpmH6jH3xu?=
 =?us-ascii?Q?uIQH7vBp/GmXbVAH/0VGt1iBGilFvv//EnV6KKUCgByaoOEuRnmqz7iK4eWn?=
 =?us-ascii?Q?kk0L88n7dGY6NBquojyfZYUXPlZuYrhpylZ7TgMiUGuM6tjVvaI25QhPsc1u?=
 =?us-ascii?Q?N3mIX0XwbAh0oi78g7UNxvqXX8NItG63tCRezSUMrny6p4mBX7H2+bhW50be?=
 =?us-ascii?Q?brUsXgAVsIOmWDN6vL4yU9Qv5rdxg/YPoNIzwD4BZa0+5y1uBTunU6OFTvxM?=
 =?us-ascii?Q?vhG/q0sxSuK1IanHn4AgRl/3NRRliHl32VS4XUK87ICciePkISkwc7T4IoA6?=
 =?us-ascii?Q?EChBVXLTdvOOA+ZVciyoCTsceRJxWlNriaZJ0I0JGw65+UJS4UbUO+GnNHEz?=
 =?us-ascii?Q?jhx/Tp1NmLr/+7BarPA1j+dZrSHe7VzpIrS4AVulWgy+uquCUsQjVxvhV6O5?=
 =?us-ascii?Q?/117iqFTP4HnD2SgjuA5dPSB0Gwuc+MZr3sWT4wybnwhekmki+A7AN5ql5qo?=
 =?us-ascii?Q?S3lsGwjcRAkbix30RdWp0WEYN0X8EORCZI76YeB+g+qFoFcsrYe0kKanyvhk?=
 =?us-ascii?Q?CgfsuSlgrD4lx+c+Erzp70lu+tUG7/Kqh6KH0D6VWgA5k2Z17T6FWZrZd+5b?=
 =?us-ascii?Q?GgLdhYA23+47FCTrmLXeFLd5y76xwedmzda6c2oqVE86SKdd0JMZXrUoydVd?=
 =?us-ascii?Q?vYphEPL+fIz1bc1fyIwcwHiwAneUDBspjhuaJCYXb6DtCVLLBMoRM77RNKCs?=
 =?us-ascii?Q?UkIQJz6gfHY8MsdKSjj6S+8KvCFbmAEsWbj15mDgos9SYIv7o76R5uax6TVD?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793cddaa-b995-42bd-8654-08dc89e63afc
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:15:10.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VADULM5Ju2LpOxrXnQA2CRO5C0oyF/yyk7PS4sgegecbZFyaV2NIRTwctvz4ad8KnbOCgmrLohYxJ5e0NgkyGNQueLnTqR1Jb5D+GK//vOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2956

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


