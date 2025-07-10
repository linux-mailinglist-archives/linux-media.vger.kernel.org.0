Return-Path: <linux-media+bounces-37328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D5B0063A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 055931C2291F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9668C2749DA;
	Thu, 10 Jul 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="IRePiTtu"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA93227467D;
	Thu, 10 Jul 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160521; cv=fail; b=F1TCX6OdQOyKDh0cBxgH5fgvYbyq8XlSSE8YRXHDhzAvmDZdfBTU5KOX5aeofPF0DObmq0bfJkPUmsL6QjXajZWmHFKEz2in/StzrAcd3XvrMQyTTVd2v9LB2jdW6e4IrTHaqa95EJaWJZ/VaPOmioW1SqtSEbwrfbEX5JG0Ax8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160521; c=relaxed/simple;
	bh=ZpqxCLOxshiyjChHKLh3+ryuBju1d7zPI3dLsbdxEzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H4u54Sf5OuyZctYZ2fZjW+D0TPuXv3adcKkOErlbC90DRpjmMJ4yKlNAbYUXzho9DByCHVa6nSptm0mcOdZITjHZ9e99nsXrQtq3IdCoIUOMlazMKD3Co/OvnQWJBO6LYVZ299wXGSNI5yuTy3o5WwJ4mhhoUrFiNkT4qQT3cPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=IRePiTtu; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIeqiAmDrRaNvRriccQ8spMBcyBDBjZg8n15EFEY9CcXG0J9IoTSYfBSYkJdKh1SumHRxLvAj9tfZ1PgamuJNriLLPjnFLuUKRyE4SdKyNbkN/zjv60yHUtwOMZeou/9n14aFILRm6BNBRQ1ooYNYCFvCvG33sLeuCSAFoKVitaP9lV3zrA7NOx1pyIgitn2LeAtPTSqoSZ9ZQ3aLaSCm/MEQJmRVUa9zD22fMW3GJzV49F+hOIYAzJqCqgLDjuiaZrVRLgs6L0sJZlc6jWdSwNyi8gg6pbMR1/EKyO4A2mVU1AjwJI8cfDYbr7bQgu05ZbAfsk2LPY//6QTP2p7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhjTF33eqawaFymWLw6hB/zg11xUk51Q2F1IOLWwQqs=;
 b=J5b99jlvBhi7t9rEu77/vzo3sYkSQ/307qvEvX4sAAA62N1GORiBrr/bddK8ecj7LBL+YYOcdmQs8UH7SmsvPly7RyAQuBYVJJOnJpg2PaPfp8jeHRyYzrXxjFhJi6Yxtl89+l9vqzfumLJTQA8luASx/kF8X5QqNXPgtzdd5xK9uKWFwmGpdSCULSmafBmlTXaXhub4Zn5sZ6H96XZTYUqSGqjQT2IggSO/14SblDOWdBJH7CBNiLOqeT5TMLyaXc/FBn25Q6klGHTq+PAg0NiglxnYQJVLe9tGwDt3sOBTiMZ1db/S2ZzlNr7hH/1fUle3mk5jtl46KF1nHLdPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhjTF33eqawaFymWLw6hB/zg11xUk51Q2F1IOLWwQqs=;
 b=IRePiTtuUcSvI/M3NlmD7Vi+4w0V8SaIdabBiUiS960gRp4qtZYXJV9K4BwH6wU3E7GznJtBTF7c3uHBb2frkDTmtOSmq13a6JOMfz8M56BCoAGIJy1DeP3qf9lbvl3TAuzNwqHYa1AOyefqR4vGAE/MJgkMgQ3Io3Vmuq+ad/u4GMxcbPJ+Q4KmuRNUaK/sHkpRr74CG6YRgqaRsYwPTUEeciZ6c/9q6rmZbqj/u8k/NNZx7OGJnNrrO9D50LuzIciF/D/96kxR8bvPZnPa3JH6kEXu1apcqqCMa6X0vm6itOzWnz3xDa35DTPUkgQPaIQd8WE7yf7aKqYhiGgZ/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by GVXPR03MB11034.eurprd03.prod.outlook.com (2603:10a6:150:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 10 Jul
 2025 15:15:16 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:15:15 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v7 1/2] media: mt9m114: Allow set_selection while streaming
Date: Thu, 10 Jul 2025 17:13:39 +0200
Message-Id: <20250710151340.496218-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710151340.496218-1-mathis.foerst@mt.com>
References: <20250710151340.496218-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0029.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::16) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|GVXPR03MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5b4eae-66b5-41cf-e23e-08ddbfc4930f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H3s5u+ow5O3k8w519YxRIxKuD/wtJxnQyo9SMta0bo9LWDVPa1P066Ginr/v?=
 =?us-ascii?Q?oXQeCqJRDDYNbfbpCt7/WjhavT5/CbL8K0Q96RJlxmN4MpscIh5QdMdFBKK3?=
 =?us-ascii?Q?mvNRMmNPBj8AgyKxlyBSpjtzo5xR99Sto/5UVdqMSaqqQdOlbjtiLJB8thUs?=
 =?us-ascii?Q?H2oIRyABHa4kMRhCq1LQ8A7fvcz348wR5Ny/gb8zUpTSPq08xGF2IqfoRjpK?=
 =?us-ascii?Q?veM73lWV1MdCbfdvQG1Oocj4u6xTXDxIyTj1pjox2y7UxiRw62xOHw4YWjs8?=
 =?us-ascii?Q?PnAPmlnIOddtNrQRJ1Vfd7ND03JbXmoHJZTWGm9jsCSwdKGT9b3Sj6loXTiq?=
 =?us-ascii?Q?OmPS/hYJqNW+LZW+tIFaqmZcmhd8y8QXmBMHvA8E8uwOkDVzFLEhUSFrqjg6?=
 =?us-ascii?Q?vZVJuuVY4THJT2c5gP97hQzIDmHTJ+DldvSU9nhTalAI+B/S25ed9d33yxm6?=
 =?us-ascii?Q?wBVd1pXuF8MGfO1Ptl8wJOxb+i4S5ZsUb3WaRIK2AXcL1Vw52cBbU5dKtZKL?=
 =?us-ascii?Q?ESXeciq9ChY0Bb8Ck3OUHcw2DRHrv1b3kbePbJowV9MgxbYrj2LoqgkCPzht?=
 =?us-ascii?Q?KzuVuFjZLcDElnvCiqaQ6uWSoKT9PFfJh0SBq6Ec7lkpIcDw3oremYGYHba4?=
 =?us-ascii?Q?mStvl9ut7G56QyAMj3Wp0NhwvX23TTcY4dshSZkRW72ZMg8MKnRBsm1tcdn3?=
 =?us-ascii?Q?nK0/UVpoA+Ey2+4tFP8orRI7QfL7ALQfk40ts/bPGZou0TmI0ptjtK8MqflI?=
 =?us-ascii?Q?tJAg/QjEmzvHMgHES4X8rxu2Xk7YGhJ+HEOEWWMbwoYdR28y9tXDqeWJ/3k8?=
 =?us-ascii?Q?TwDhdrsbykyWLdHsy22ShsR7Qginofyea+ZwyJ6WgYUUaP2f2ZtS6GiERh6k?=
 =?us-ascii?Q?LRTiDrQ0fGTYebKZU7clXyy1Aqb1/XRCtAtDZFZlQbpZHJ1X9ysY0ce4U0WK?=
 =?us-ascii?Q?3LxxRuaJ5pOOQ36TU5LaT8DgTPiyAXBgrSAUuVSiRiR4436857c0NALubhFt?=
 =?us-ascii?Q?4B0MA1VBy9OUQ4iBGBvEAV24IoXjGx8lwWTg35v8bJb8yB+JSQopzwXFxNaU?=
 =?us-ascii?Q?tkGtuI01e+5PLfC0XIlWK1J+PzSOW4f4JHWWOheTf8jN/cz6Sv+DiN9bseMf?=
 =?us-ascii?Q?IgTNSVA922VhNYhplCSScS51LO5977I3wgjsCpTS4yo2MX5/Z7ajafPMv4e0?=
 =?us-ascii?Q?N60Qb14P3s3kgHTN1Vr50WF673njj5egc7q0fIgc4wZJJEdJfdan8LEcAvmH?=
 =?us-ascii?Q?wjBuaWfenwztRP4P4XFnLK7U/qg+kE6KxScAVJmw6SmJrhofkwbOJ/2/qDl6?=
 =?us-ascii?Q?woHJI5aUsnnEgcwkax0jyS4FwPlJwSbVv9gJWeDrQW+bYUBa3YAYuR+RoaBa?=
 =?us-ascii?Q?wFfLqRc0Gzbr6gy9ZIBIeE5ZPjOBcnKjCQyrU5l+H/Zyy2Wg9r8G+BaITbhv?=
 =?us-ascii?Q?m2+VYMxRiOF3eeZZIiHgVKGiDuG/XtjNaC6whLLgZzyQWh/hAdFvRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rCnj5I+8nMELJf45cWRxQf2A9/T75PPv5eb72Qn6GoQVMvEsNftXD4imKAGS?=
 =?us-ascii?Q?vGjui3f4IggwWVHtOQAHvLOH0kdcVHDnRMAcLjdy57Cw5At0GKy3OpXgGG91?=
 =?us-ascii?Q?R5LYobxYxIRNTVCezKZhICbGSYaKr6fQXtFEf7k7vefVABTs03xheipspYQa?=
 =?us-ascii?Q?alRHfUQerVRXh/MV1HnO/Tke1opque/nhpsgPqKaazNsPsRWb9PjbTqbpU7p?=
 =?us-ascii?Q?H8Vn2FUV9IYA+CJexLRhC7aUPdD2ZCzi3XEWva/zoQaOMbx7lrAh4cq/2USr?=
 =?us-ascii?Q?/mpl2xfa0a+AE+8ESeDdzimsjUHaoM9GCIefEr6hLyuz8B/LdUjEUyfalfxM?=
 =?us-ascii?Q?f4eEIkljEh8Ic1hR7RnyZ+dPOYcj5Hjt9pz/Fl9OTJIOl//jOjNW/BGbHC/o?=
 =?us-ascii?Q?TN4Md2hUUQ0zeLjTDePiPMb0aE15fQDG1z/HKaEHldk5ghaDdBGmUNoO6HKc?=
 =?us-ascii?Q?TCsT12ko18g73bDCa5KH9niNmfco6RySn93CGNT0sRpNSJWEL6q1LyGdz3eX?=
 =?us-ascii?Q?dZ7ad7JiEW0BXX2iptzRNi5ffYFGfMjwplApbHmpwXvv1xBl2c+ZJlzvQ7wx?=
 =?us-ascii?Q?zjsY+j3lpRpSVT+WPU3EgRFHroRlIuiGm/QjsTPwx1Kj0WAIKYsUSnZxIN25?=
 =?us-ascii?Q?CxAruqqlCt+toXJjbCb6mSOnwLcNdTix0DSvTH11rM51g7JnZVH5bLmKyFJk?=
 =?us-ascii?Q?amqELP0TKHn3YqzVH9PRSKg2HQM1guK8rWv6uPcuISPc6mSsxS82qTOZ+WvV?=
 =?us-ascii?Q?IFCb+R87OS7KQJFFvAx0hXZdGH2sVu+lc82e06oT8rhDxellyHxxeoww4oe8?=
 =?us-ascii?Q?slH+CloFTU1LeNbhV6/BykeXCaH7dpg0Cs54QB0K4P0wUvJNdqYsyamM61dm?=
 =?us-ascii?Q?xaA1LKnl78O1dcCCeSPLSzcCsMopNgznLBu7uinfK7+1OPnTyT0JGO/X0Sny?=
 =?us-ascii?Q?0XC8PsGPmXNweYazywm6+YU6gjUTXxcdiIFxRpqrM9ykSVErA3fd4vvb9LBh?=
 =?us-ascii?Q?SzkPR5dbW87JeQe2FAZ7OEMPTWHHbVyR1dG9Q/HwxxBt9nFn6xE+bT40uKjy?=
 =?us-ascii?Q?8IfJAeUUbCMKhtECb6DR6AjSgGjojTLNK5O5Ts6OlmvB8x5xmxT9vQMEm7h7?=
 =?us-ascii?Q?DTzcljpt+rEiOarOlWVhy9LbnSMBvNDU/uNVWrSC4kSnebc/BgkBl595MfFz?=
 =?us-ascii?Q?m7nSweRdLXlMXN0Khg9SwWceiHb/1KU0RR/pnSG0XZ4nsoKtISHSBOdO65LO?=
 =?us-ascii?Q?GEvTzsqEw1XmqNaRlo8pKuGmv1oHLpYaHknKo7vV9QArUhtWkMmmaE2huNsS?=
 =?us-ascii?Q?dUGGoMd8jKcuCEWQf2n95wnpoLxtgottZafs6VEkkCvIBP+LyyvDK4k66b4/?=
 =?us-ascii?Q?oWmtI2wR5PTU4WW67wgRye65LqZF9xAIRthqOQ4IW+ZYs89pJ+XzRqxi2xps?=
 =?us-ascii?Q?rR9dye5V3wGjkv3N/y+jSGij/kR982TNhu7EJtUU4cA7/hST6Nfh/buF1UKR?=
 =?us-ascii?Q?bhirJ/TnICscJKoso831T7ICm6irIwqDfKYRUf8HV7HjztLSMqWhJL9IgPQ3?=
 =?us-ascii?Q?4ORCjobmsTOwjv5NNSMyxxjxDusFL8wpL0BxoD6C?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5b4eae-66b5-41cf-e23e-08ddbfc4930f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:15:15.9397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1dES4i1KwP0YvHf1GFu+77lYC4mN/sVBFtVJ6pmI6e6MlOb/+c0yxxYSbNPWc3mitZJgvkWS7SdOni6BIeCcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11034

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.
This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.
Under the condition that the width & height of the cropped image area
does not change, the changed cropping configuration can be applied to
the pixel-array immediately without disturbing the IFP.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and the size of the cropping rectangle didn't change,
issue a CONFIG_CHANGE to apply the changes immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 42 +++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 3f540ca40f3c..5f4474d36653 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1287,6 +1287,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
@@ -1302,25 +1303,40 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	 * binning, but binning is configured after setting the selection, so
 	 * we can't know tell here if it will be used.
 	 */
-	crop->left = ALIGN(sel->r.left, 4);
-	crop->top = ALIGN(sel->r.top, 2);
-	crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
-			      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
-			      MT9M114_PIXEL_ARRAY_WIDTH - crop->left);
-	crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
-			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
-			       MT9M114_PIXEL_ARRAY_HEIGHT - crop->top);
-
-	sel->r = *crop;
+	sel->r.left = ALIGN(sel->r.left, 4);
+	sel->r.top = ALIGN(sel->r.top, 2);
+	sel->r.width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
+			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
+			       MT9M114_PIXEL_ARRAY_WIDTH - sel->r.left);
+	sel->r.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
+				MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
+				MT9M114_PIXEL_ARRAY_HEIGHT - sel->r.top);
+
+	/* Changing the selection size is not allowed in streaming state */
+	if (sensor->streaming &&
+	    (sel->r.height != crop->height || sel->r.width != crop->width))
+		return -EBUSY;
+
+	*crop = sel->r;
 
 	/* Reset the format. */
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/* Apply values immediately if streaming */
+	if (sensor->streaming)
+		ret = mt9m114_configure_pa(sensor, state);
+		if (ret)
+			return ret;
+		/* Changing the cropping config requires a CONFIG_CHANGE */
+		ret = mt9m114_set_state(sensor,
+					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-- 
2.34.1


