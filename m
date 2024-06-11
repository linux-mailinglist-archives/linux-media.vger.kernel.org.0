Return-Path: <linux-media+bounces-12920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD57903341
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 09:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D9BC1F287C0
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14F5172786;
	Tue, 11 Jun 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="HXo9bMJr"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B313D8BA;
	Tue, 11 Jun 2024 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090117; cv=fail; b=XYnHu001QmNrW1rRX7a0hpGWh/vFavQwbTFwhNc46Lc5N3/863969l+toLimlgxV7AoFJ6Q9JyL1SygryZsH/Nziunv7MHbdmsbPbxl0h+JX3NXoMzIMVDg5LPcaAXMc0dXvUwxRhvXsULuULc4Kv/SpT+LdT+WdSDY/BaQ9Bvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090117; c=relaxed/simple;
	bh=3ZvN1fiAdPJHTszHXG72sa+MecgHPE4+a/u6mD6C70E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l+fC0MYkWIGLNBkMo6V/iX6CDrL8+S0bJadullcJgKDEoYHeTbDjg8JC2x7wVFvVECcipoJJ6doA3HiT8zqzC74D+6o9eantiF2CxSmBgF5yIQZw37aQ3NrpKgrnHgA3GvQKEUEpwb0AN7WT492zcRjw+zWi0RcETU+yvClUnl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=HXo9bMJr; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiAi9HzE2zznYt3qCrw8PrOJBmErkQ2grf2BRD1LVWf3mx3LkBxnFud0Rod5CmOjnYDZdAXxjeC+kxJWzrmc9YSvfYy50f444shhpyHvibY4V24Guo1/ZKbmGPilIKBAUsS60bc4qHiMoLhy/ZGFwQ7S9lGGpgMxhZ2vH6nBw2px/9aFflt7z0PECZPG+qNmVI4JUrkUZw06e9hX6wZ3Mx36lEp42oUITjm4ws5KBxNj+eHl7rk51xw3tnhKoDpr6vfK2oblnUUdiZ2eOoRTFIZCyxhjDELq7F3gGDQJL6/1QQTyvJL/TPSvdJcJQWcE+WyEKvQjBypE6yClpgjWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THhEhPuuas6UR2pTquwSWb58Jb08aVXfEQX5oBWjfU4=;
 b=dT/4vPqXAqmtWkhSm6p6ZKa1TtwlRnG1awveW0lNI0j/LAL2/8c4ojjomXu65gS1CFh1VRIW/e3e5QlmLAV6UV0akFASS87Z1+m32JwAZo60uQpNFmfDUTCKOIOSoh+oO8fgyg8r/ALXW/nwPf3zcyo5qVEjkb+dZWlDCgRB5NjE5jgSAGUClrZ0iRqceFG2ELMwfMP4TUMyPIuhapqc2Axwr9RyILS7DXsIbUtz8oQxtTvE/Nb4PMdIHtB725pOw3Ub19f4HcCD2w0LgD2r4iHuepiak68tFOOCJ0uXk3ohypvU2CrBpwUtJMTtqEHOWtQYKE6QVyMvmXvpRldsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THhEhPuuas6UR2pTquwSWb58Jb08aVXfEQX5oBWjfU4=;
 b=HXo9bMJrq2XE9fkAvqv0JDODn84hK7EaJMOHQzwP9KJ9kNkdjY6tLxLpKo6tnAiUQPI43OBWoPzjTiIbXxIDKBKuQ0PmLZbf1DZuA5mev3YaQAQ8UowCkq0Syi/i9FsC6eBSY//qx4p9MBf3/ECmKmGHdMYOs3u/M5Dqy8DnViY=
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
Subject: [PATCH v5 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Tue, 11 Jun 2024 16:14:58 +0900
Message-Id: <20240611071501.80-2-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3417979c-e93d-4211-901f-08dc89e63a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zhmbQ39T7Z5mfxv06J6hVLZGFuFsKoAmrEWaicFJaxNMh5Akc4Dorbf9A5+g?=
 =?us-ascii?Q?vJYJKIbJlQeyMWhdzKs8hiY4xdKBaFQI9gWpOHnLOuEeijsBHZ1wjuUGS1ay?=
 =?us-ascii?Q?tpXBUxDV5UL3I0Rjv7vgMGl5JNsM5bir0m5m7u1UzDToLm54TTYEYcf+ly0k?=
 =?us-ascii?Q?JWUIEDwDAjlPcZflP/7xUnsnyNXIgdsedWn13zmQtg6dYF/J8IqbryqVWUoV?=
 =?us-ascii?Q?CzEUKrH+c92SNs8n/TAh/yjLDURLxPrO6R4RwXcxWRj78/Q+G56jRSt3Gh6q?=
 =?us-ascii?Q?hIcXgq4Rs0/GTA1pIoq+YdWOlS/J2qQg6iW+BdlVooSXBENy6F5yk8n0QhX6?=
 =?us-ascii?Q?hU8mpvIt11w+7cnbI8XvyhTB7PYcfZ1cMKcWY/AHFVq+i4+WgatK0uRzSwNQ?=
 =?us-ascii?Q?tugtYRVS/HdAf1CWaahkrs/kdZcw1030TiwnwZNwASgBfygocIPbG7mJhaJ0?=
 =?us-ascii?Q?3WN8I3MWYchNh57oEeY1WYId24jHGkN+MH9aVFTA87Q3rpOYX2QeYGC8ya81?=
 =?us-ascii?Q?0Vh2rz1yjAXhnSJRrqpu7a1OEAnW7+FtfN4MDpLYflFzpjCkBkmmNen2i2rZ?=
 =?us-ascii?Q?rcOO2nyCbvWmWKNjSoGiKcWgn2xeoP8eDn/ETE/WUUHcxCRjgo37mKQ6pRm7?=
 =?us-ascii?Q?+Ukx8pSCjFxxDOIfK5SwzYxO0tScpHSCnirNR+rwWWhAoFK7K5RNtKy/D6VG?=
 =?us-ascii?Q?R9EpDx0OuAIVyEpISkHIjklRy+gC+4aauf8GPeBCnPebDZQyPXwjf44dt14W?=
 =?us-ascii?Q?iRVBjkjV4iPZZVaKrH8ET06bfIBEQpdWjPKE6YUGZiZ9hHsKDbt2H+zpbS1y?=
 =?us-ascii?Q?RR37TveAzSybbMhgDxJozCsptKnS01fym4LSJAUd5SpEm5hEyAtL4aRPcs5N?=
 =?us-ascii?Q?uDCJNg724zOBZMmDK+L7L02v4NCU8WD2AThF4OZ+geOyrXBqtrYo9/FfIzuz?=
 =?us-ascii?Q?z0oOvTxkalmdGjA2GjLgx9+bmGtAuazSqNwJLN5rrBFJRkKEhnlxe9uAeswn?=
 =?us-ascii?Q?OdNEj3Ph4rTAJKIEnIrEmBkpK126ZPfAB8BnhWWNcFwj0NnzwwGATLcCNzZQ?=
 =?us-ascii?Q?soYbmOTcdbjZcxyES1bRmAIFpoP9w+nEs1lL1P71BYU83dAl1I4nq/cfrkqX?=
 =?us-ascii?Q?qyjYShVAgpc2D8xoxrTXaIZmUmniM+LIlSqBu/rPNNkhVdpLMhgfGJO2Ghwm?=
 =?us-ascii?Q?g0DMKkYigB6nRE3FPOIZZQrq4YIkj8uhs1YPAiZyxA34GRDM20nZNKXv75q9?=
 =?us-ascii?Q?W7yME7NpfutJvEuzFyntG8f0koRoN+Nq2zUoBOhfxGei5I3KmskZPpFRAF+G?=
 =?us-ascii?Q?nRkJoaZ3s0ibPqqrdBVNIQGeNFijsiWtm1UOg0OHLLb8VlgGRyOEO0zjJ0Un?=
 =?us-ascii?Q?/DwwOrY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rtNLRXlxsGTHGbGehV0K5BfOMRyGqIxe3i96wb/uE+3UyAATvdz9FDUwwjJP?=
 =?us-ascii?Q?ieB8NzYpYo3MOPg/6IrvstedjZF9ia07FdHR8CEdho2mTLfU/3XYtZnRHx/u?=
 =?us-ascii?Q?vaX4pCHNxlhYAWV/LyUM2wD0+LbMJ4fqfM1mFA9EoIunTyYz5HB3Oe7OOzuX?=
 =?us-ascii?Q?OpkfRlflp/A31+H2G6XYISML1fLUPnUxkSKGAzmVadTBAcU0cDTT3xSqcjhx?=
 =?us-ascii?Q?YMLmVU1HQh5hPuKyK8Xgp9wEwzyjlmG8xKW9lRWGRLRn15qdtVU0o2nF5Vym?=
 =?us-ascii?Q?VCPxCN8V8KtaS+JcxYnDsDPnx5SQT8V6ArwZiAPt7iCUBqblYnDOcXKL2r6n?=
 =?us-ascii?Q?RRJ6jR6/+FcGjq9Us1VtFhgkV9+bkzy/8RJ5poso9lb3oOy7bOtcUk+mHQsC?=
 =?us-ascii?Q?ZvbzFXCCyhue6uwMZyFw/Bu0t3kpDKv1/t9f2JzkQVvZ7slXGHfCQGuXPow3?=
 =?us-ascii?Q?wRCE9RHlPUUCHeDyvDEGF8vyL0UnrRN8bAu+u4NX4YJv4m9rhl9gNCJs4XDO?=
 =?us-ascii?Q?7mrKDApR1QgwcVeOPlRUA3SVp5ipIGqYBo4qFigt8Sm/jabMwStGHr28JrTN?=
 =?us-ascii?Q?fI4MCWM2v0wtntHmV+rJpOOINjj3U4fOZ/cEFOM2owhwD0DDUwj8jxX3SY2n?=
 =?us-ascii?Q?mgatwgS/WrCvoBuZ3uwi1OjpcGqZh6yStWIry1omVSEs/FM41ltnvxDF3F5q?=
 =?us-ascii?Q?DLLUyIi05NAv4Ak0f/ISJccG95G76im5vXK/LwaRNcxYdfSlHaGOjtXAqpfI?=
 =?us-ascii?Q?M/wp6AnZ8nB9lo2z2KV3uRguxrLEirRS+G64FQdmujfFD1YMW6hcQy53FQpt?=
 =?us-ascii?Q?T8Mm2EKhC6EOzG9QmUoPnNpCL4LYCjOfK5bWtyMRdKu+VPiY1lB5HlEgv17u?=
 =?us-ascii?Q?2H9bACX8yJTUCmFJp5SAe0MWnqglCwT1STN9Qn7ykYg5kgtnQyASpGWTZ8Ax?=
 =?us-ascii?Q?gJ4f/odCOfUbj2luG+Fn3HVjLh/LbuIjhY0l+/3vBkfMsFwqUuYqhw04TQ8U?=
 =?us-ascii?Q?E/Ej649yS3SvpU93brhINe4Z5hgtmXG4ldpICMjNiMRTVzSBvopEea0cwKki?=
 =?us-ascii?Q?WnMgUW4NNW/W0FVFbzURlxg4Rw8PVyEHN4eyJN8cDf5sAq/uUnW0gguQ1EaG?=
 =?us-ascii?Q?YWKZbYIMiLRiM9cyRJ+65T5a4FIDcVa0+aTvAtS1whTUFWl712wONGXVa91g?=
 =?us-ascii?Q?e/IWwF7NBBb8HbpbHMu2U+F9BB1Ncly5ztBwyxXX1XPe6Wn7b0k7ZARX1sU0?=
 =?us-ascii?Q?ZqHysEtoxb1IwsE3CfCAuJXKPjSbU6/rc2g5tlhGmdVA51Mjg9jhY393UNJd?=
 =?us-ascii?Q?eNm7kmZGOfZ7ngPFPB3iwGCCl9GE/Xhvio3BIhaho+eSlsmuufmmYAXRAhnZ?=
 =?us-ascii?Q?Y/PQRFDS7snK31VlSfe9O9BTXkYybSooECQLQIDXvZhJ+Kt4JJmhQZ1IfBZz?=
 =?us-ascii?Q?nWZcXoc1tHiZNYvf3hua6S/Kn3SepJfubD0eEQqAzZydjHJgEEYj5Y8rm3rW?=
 =?us-ascii?Q?2VfXWdMkFagO3dZJ2pB0AQN8349pyPY9f+KoPhbPboKpfGqH7aZaj58Ai1LA?=
 =?us-ascii?Q?TBf3r4fUBHMBBhKZKqDcnNoPjU1oliN5d3+0sxr7BjN+MXygL4hbj7KnGQp4?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3417979c-e93d-4211-901f-08dc89e63a99
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:15:09.9061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDMcRKw3WPP9YMDAPNH+acZgcB11k8q5H8j9DNaNR+Uqv1twxFZWwn1/l7iPvLmpceNAZmAaCyb1bdJJdmuwHgZOGbLPuPcLNq+LGOwdGtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2956

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     | 19 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++++
 .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 2d82791f575e..fff6e66b66e4 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -23,6 +23,15 @@
 #define FEATURE_AVC_ENCODER		BIT(1)
 #define FEATURE_HEVC_ENCODER		BIT(0)
 
+#define ENC_AVC_INTRA_IDR_PARAM_MASK	0x7ff
+#define ENC_AVC_INTRA_PERIOD_SHIFT		6
+#define ENC_AVC_IDR_PERIOD_SHIFT		17
+#define ENC_AVC_FORCED_IDR_HEADER_SHIFT		28
+
+#define ENC_HEVC_INTRA_QP_SHIFT			3
+#define ENC_HEVC_FORCED_IDR_HEADER_SHIFT	9
+#define ENC_HEVC_INTRA_PERIOD_SHIFT		16
+
 /* Decoder support fields */
 #define FEATURE_AVC_DECODER		BIT(3)
 #define FEATURE_HEVC_DECODER		BIT(2)
@@ -1601,12 +1610,14 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 
 	if (inst->std == W_AVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp |
-				((p_param->intra_period & 0x7ff) << 6) |
-				((p_param->avc_idr_period & 0x7ff) << 17));
+				((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK) << ENC_AVC_INTRA_PERIOD_SHIFT) |
+				((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK) << ENC_AVC_IDR_PERIOD_SHIFT) |
+				(p_param->forced_idr_header_enable << ENC_AVC_FORCED_IDR_HEADER_SHIFT));
 	else if (inst->std == W_HEVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
-			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
-				(p_param->intra_period << 16));
+			      p_param->decoding_refresh_type | (p_param->intra_qp << ENC_HEVC_INTRA_QP_SHIFT) |
+			      (p_param->forced_idr_header_enable << ENC_HEVC_FORCED_IDR_HEADER_SHIFT) |
+			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
 
 	reg_val = (p_param->rdo_skip << 2) |
 		(p_param->lambda_scaling_enable << 3) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a45a2f699000..a23908011a39 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1061,6 +1061,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		inst->enc_param.entropy_coding_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		inst->enc_param.forced_idr_header_enable = ctrl->val;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		break;
 	default:
@@ -1219,6 +1222,7 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 		else
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
+	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1701,6 +1705,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 0);
 
 	if (v4l2_ctrl_hdl->error) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index edc50450ddb8..554c40b2e002 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -566,6 +566,7 @@ struct enc_wave_param {
 	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP */
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
+	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
 };
 
 struct enc_open_param {
-- 
2.43.0


