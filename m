Return-Path: <linux-media+bounces-16103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8413594E69B
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01DA91F224F6
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 06:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE1C15C157;
	Mon, 12 Aug 2024 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="GmJ+iL50"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021079.outbound.protection.outlook.com [40.107.42.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC5152199;
	Mon, 12 Aug 2024 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723444180; cv=fail; b=VZRzJXr5mxexT8S54LjYycCGlxuQLDfsKScCtzFYB8R7msYN+m6mYNTi4/peseSiZIVQ3Fqd+0vZZQ7rL/bGiIPfi5K/HkwiJ4qSrJhH2BuAD+EVRGbuq0m8NtFj9PEHvHajvT5aVkozeQ/Pe6hSiZ42EUvccjcjcrenUT4CyZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723444180; c=relaxed/simple;
	bh=1gH8Kst5AyvyREmhJnzJ4WA7ZLdac2yMvVZzwSm6PP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L8XEY08xVtxlTxytyZwYIp71JaO5KV8J8YDULN6sTVUWdi6p6AONUqRrDjahexAj8gNB1sLzUqJhHq9RfkMwOxGtV/nYfIpesDjIr2jeYbd9oHKYYHG0uZBqQsSdtRQu+21C68t9nCuAbTRqA1rLVXWggnUfIL8Md4dpp5YkYBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GmJ+iL50; arc=fail smtp.client-ip=40.107.42.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KENj1CnjA1gIyNFqHOmpbWn2Idofi6gOLkvH5AKv8iEN3ErRhk2UkdHhfjCpcGiwXfAoHRgo9x3d69VW+/GyU+JyQZI/gK+o1pEBcUnDT8FR3wei6Qwn8ZZ4bgUEZoWwjJAwJ/8j4+bfUMliWU8I0HMRW8/SzCB3Ja523/n7isv0QD3s6CVAWbOScMGOVioNUziK8+7NxuOs1v85G6Y8Zar2b3Bguw2/AJiFtyLcqjMkc2BDRMVTiQGevaN3vabl7tkQSYzg24qQZqalc2vxbNZvcHnBuOMvZwgV4xAtD0hxY1jUyFqeuAFbd83ywMIxhXHjsQn5rPELCU9zUsFlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsuiMHgkIfdA/t5ukV023GxxCFgVF8UHfqk1OSNTkb4=;
 b=m0qMIQiRTslrHT/ZIAoAZuyuLumzycEV64MP3+YNT3SwO0IflyX9AG7+zj5Y2fgiSqB61TCXWoyuRzQTlS5AafK7J69Bpa+XHNtQ41GtjFL47XP7v2TnAGIDnl1KYooJQ1uRGxdLYCgRuZeLcvWNdIau+Lafvsk/FG8eWwbVvfoNjZ5eZGnn05u7xkFc4U+i406LggMowiZCou1iMA1nMW+HbvUhBfdIVKmQwTg6ILgB3OeePVLkzJIiCBa1i/T56eOhltX2ypWO/7f8JKeQ9a81Vo8izA9TYRtuS7J9au4k8cpuvF3NTNu13XDtPuw8LeJ3WuujF+xgV0U7SX+ydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsuiMHgkIfdA/t5ukV023GxxCFgVF8UHfqk1OSNTkb4=;
 b=GmJ+iL50N9vl7gTVXbKujiOaVWP9h78PtDDAhWPluQ9yLNiuyOII+H3uYoC2+sb6us19TIKR1cp2cIPYp6rX6TWGJUB84WtH3hWX0n/RJQJIzQobzkP3L1FI1/bA+jAvO6mIdjNarYko9bgv9798MBA4Me3U2YJY6OG5Dhycof8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1812.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 06:29:30 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:29:29 +0000
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
Subject: [PATCH v7 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Mon, 12 Aug 2024 15:29:17 +0900
Message-Id: <20240812062919.78-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
References: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1812:EE_
X-MS-Office365-Filtering-Correlation-Id: 60563810-c75f-4c5c-67af-08dcba981f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z+SHIWSKZb0kW16qUhBi1phNYx2CE7CUT5ixcoJU4AelTX0D/OvE+NR39FT2?=
 =?us-ascii?Q?lEwtmOwaLzl25JAJy5W042furBIGJs8bnnLkmoaE8VCL5z6n/tYiE03Q9NKP?=
 =?us-ascii?Q?OpXBU2U6IsOazD3vc7QM+ioHwfYE42RZaPqcYazxJB70Qxq7c6VC7V5aiLiF?=
 =?us-ascii?Q?JmPfqUpFUXXx14xCtRxSUaMO1urpPSQLH3yNSXEcy/98W6xxtxP6sxk6p79o?=
 =?us-ascii?Q?K+fyoGE5Qqk4asQovwmH6kQI3GX7OsxtQYx3RQ77oyZ4/0Re+1cy6JF2PI0/?=
 =?us-ascii?Q?s4TFPz+H2NMNinDJvQHpN6wSBIVfuXR0Vc5k3W4u7puMNE1AKo4JK74sRgXc?=
 =?us-ascii?Q?d6Wh5eWLqzFYL3a5T1MAcu9dbZSj4kxWFVxckZ96bP8WVl9wcgUPrx0o5rjF?=
 =?us-ascii?Q?Mwt1A/rKvaMy4Tv4hiDH2bsUkgnD8euY5LwAMAnFI8LF7gkb1yXGtaiHnSSv?=
 =?us-ascii?Q?LAm7Gp2Oti9tN5eM3JwTtNP7mwayOgLyBzaMxnE+RN9JIaUjF+fDp5kUK3j9?=
 =?us-ascii?Q?QxVP0cpuaqGZ0SbE11SFn0dqmGPL2eTBGQfEm3YWa3byBAltX5OtMIeDRXnp?=
 =?us-ascii?Q?EdWxOJnKiPLwFDXi7cTR5haAc5lbSbhrGHVtK3YiYiu6hpFATAtytw+X9WyU?=
 =?us-ascii?Q?633OkzGByHH2zwnWTE5IiBVJ75xxLagRmmYzjSWrhTL3FAAo/8JmH334oxay?=
 =?us-ascii?Q?6z4i/9vd0x014Wwbk5yb/h/a6yjJGeijEivY1ShZpi6JBM758XQhi1Fw4Tkj?=
 =?us-ascii?Q?WbOinnYSwHDJGTBddGjbwGDlXv7oTqfMF4UFUeN66AzcaCr7wpCJURoMq0+a?=
 =?us-ascii?Q?1jIfqW63EF4lHSgPww4lRqWl9F7g+7g6lBc0LRmo+yNc+OWwmUZM4OJqRVcV?=
 =?us-ascii?Q?AhkfsXMELlbvWkL9+IYG9hyAqCL2XkXyy1hazdhBICp2QAm85RdcVdtNwllC?=
 =?us-ascii?Q?D8UIV4X3vEzxSw7YPoRoAwb9j4YTHSfTYKDw6y9OtxGpRsvoLysybr2XmhEq?=
 =?us-ascii?Q?VEyogtZSaqtgPTYovtc7fF0eDexRr8+EzhXhaByTqnyo9FZBd+UYa527giv8?=
 =?us-ascii?Q?jkLy/p4V9hYCKhkErocwmWkVt2gktTgTiCADcL5g4oO2k0BXvDx3DIOwO2x0?=
 =?us-ascii?Q?KQWe1t56MDK8jFfRdk6ftnf2LUpRV6nkCbU3hjPDKeeDXQqZ3To87BEIvYv/?=
 =?us-ascii?Q?Nb+gFiH/4fxOvtXwMkTBudbTiipHVA0JBUiY2IQUEe7t79hF4/Hi0f93BRpy?=
 =?us-ascii?Q?vvB8efSVHNI6lso1inaDejG010Er7TBzfysY5M2meOwsj95bKSooRVPCv0sP?=
 =?us-ascii?Q?NUn58ah+p3CKf8HDFNo9b1mIlK6Lvcaf20cVqSG1IRH3C5pwEEvvFy1RoNRu?=
 =?us-ascii?Q?OH0jhDLW7zeL7vGGltmNtqzz1CqPTqk53oOdhvR+td8ot9rjhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NhWn2VVpzUM1TYz2CDFrKmnCy12kwF+Oqi9PU+TVipYksuyeFbXE9q3MXDiN?=
 =?us-ascii?Q?JOwN1tP/ocEP8v2oWqxiR+58AlGhftI+XK7xUxk4ERIkH1fbzMFn0q+3ZUhT?=
 =?us-ascii?Q?eSkqG//GXJUnZi/L8jHuhQXKQkx8zzRelizc/I6bolTisZkuIDeYiaF1/eNL?=
 =?us-ascii?Q?kxmXQ5QFkpQEC8+r3SfTIOUZT6MaDspqYQAdRLPC2KKTy1jHhWWWzhwq37eI?=
 =?us-ascii?Q?6xJcEuWgqWIIvq+g3p7mfPoN2n2DqXTbAMH4wyhm6cFB2rJ46ak4VkurFrjV?=
 =?us-ascii?Q?EBfU0ODbCm286B1i2VEk+ryDPEZ4lXvma2rlrV9XEhnjNjDpTfMOHNcmCZ9G?=
 =?us-ascii?Q?xnsFSWj/zzEIJYJTRvybsRlrasmhYodx+aS7IZjNmScMAz611OqCGC3rctqC?=
 =?us-ascii?Q?cOGXY+XRvzGWA1xT6LJzSfki+RlgRlUeFqens0kKijw6wcTpGPhSkFX2gTNE?=
 =?us-ascii?Q?5MqvKpWEGJWq9wBmTq/T9UGGxumg3AxIDMrOwHUZCnIoOJXtd/xu3d3oYp/y?=
 =?us-ascii?Q?ryscpY5c3waFwhWaf+okobxvgmtOrhoQs+tFGhcWTpoB4xc0HAQWSDbqdyFU?=
 =?us-ascii?Q?ilqD/xVE76YxsNr1rW/uP53juzLe3Nc9+E1x45xL/oyHhVgjvFVfeLtHzQDR?=
 =?us-ascii?Q?V8A4e4RZIrAaUWx9mV1Ceqt1er4SKeoVSfzHXDfYEBRndlNY82MkMBGqRUgd?=
 =?us-ascii?Q?Gn1CrpkC5viZvKbPFgPGJXxy2RfaBi6/G77uTE/BZVlQeXXW4MzFLlui9GNX?=
 =?us-ascii?Q?2bNCu5HGLAvmP7vYR9+VvzwihnubeaGv7zv7deg6WY6pIuv+nDxv2GwLAhZu?=
 =?us-ascii?Q?/VLi3ukNcoZAlIiR1wIMtDFuxbTx5I1QhPmvCqiwHqb4ugGy5s/dj05XwnmW?=
 =?us-ascii?Q?Y5JROZQ817yEJb0VuR7oHMSPcyRQ0SlO2ORGqP1CwDA9i1gSqbxQJ941VXYy?=
 =?us-ascii?Q?sSJndEjcZGBLk7fQThbEVHu9phkDKa1JZbAjTa+nKV0JjejYHCQKfMOqBLdh?=
 =?us-ascii?Q?s6DIDR5FSHuO7zVdm8s4Dsjch0caDvo4fer79wc3FuT/BFmuWtg2JWrG71Kg?=
 =?us-ascii?Q?X3TyA3W679/u7YXciFtp+nrL1WtBJGL56CkTABok+Ho1Srs4RcY/8V4RBc2j?=
 =?us-ascii?Q?1V2R5x8Z85dQ9kGEIl6XGyQwH1zx3iBGWuNnPMDbxxEaERCmQRmk/OIaLVLd?=
 =?us-ascii?Q?tSljAi4ZMaylXy63uext+AJrVc3VtdCmqzzGgVjKfHyQMkMBJnAdbzQxIXNw?=
 =?us-ascii?Q?Fl3navXCG607Tup5WYZ4DLGhY1xB8gARMOWuWWZ0nkOsSRA6n7f2Alg1lPWX?=
 =?us-ascii?Q?qOHMZPLFjdEgP1/ihBREHbb056eBsyh8LLdWQn7/O8ma6TVXUL9H1e4A8X9J?=
 =?us-ascii?Q?9VVBEdbqTMtyx4tS4rsETVNPHjE3p8Hq880wNWB579Fkrw1FEFuIdFsbkImX?=
 =?us-ascii?Q?J44eldqFw/oJUdSMiRjgrokVvmGdyn7uzjrhIJS+ppxDcFRfy/MiOanDQtsB?=
 =?us-ascii?Q?PKxdOOi8nTwJsWFTeVZZibY2tn/4M8g+mARysjyAgyGve62bxvDitolsaUel?=
 =?us-ascii?Q?C3WUxKbrhQOqE8gcgbzHBATA/rQjLvN+ZG6AdNuemgjep7Npiu3ubLKik8PT?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60563810-c75f-4c5c-67af-08dcba981f03
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:29:29.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMKT/QT7m7sIqT8Oh5wxr6vc/eymfXEAEEtDsFIP5FvrOLOtd8N7sU8rl2e6wVQTWsVc+rHjvzK4UypxoIOvpTKJYIxRW+D9YVoKj1E+Eg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1812

Add support for runtime suspend/resume in the encoder and decoder. This is
achieved by saving the VPU state and powering it off while the VPU idle.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 13 -----
 .../platform/chips-media/wave5/wave5-hw.c     |  4 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 21 ++++++--
 .../chips-media/wave5/wave5-vpu-enc.c         | 20 ++++++--
 .../platform/chips-media/wave5/wave5-vpu.c    | 50 +++++++++++++++++++
 .../platform/chips-media/wave5/wave5-vpuapi.c | 33 ++++++++++--
 .../media/platform/chips-media/wave5/wave5.h  |  3 ++
 7 files changed, 118 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index d60841c54a80..a20d84dbe3aa 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -58,7 +58,6 @@ int wave5_vpu_release_device(struct file *filp,
 			     char *name)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
-	struct vpu_device *dev = inst->dev;
 	int ret = 0;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
@@ -78,18 +77,6 @@ int wave5_vpu_release_device(struct file *filp,
 	}
 
 	wave5_cleanup_instance(inst);
-	if (dev->irq < 0) {
-		ret = mutex_lock_interruptible(&dev->dev_lock);
-		if (ret)
-			return ret;
-
-		if (list_empty(&dev->instances)) {
-			dev_dbg(dev->dev, "Disabling the hrtimer\n");
-			hrtimer_cancel(&dev->hrtimer);
-		}
-
-		mutex_unlock(&dev->dev_lock);
-	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 2a98bab446d0..c8a905994109 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -1228,8 +1228,8 @@ int wave5_vpu_re_init(struct device *dev, u8 *fw, size_t size)
 	return setup_wave5_properties(dev);
 }
 
-static int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
-				size_t size)
+int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
+			 size_t size)
 {
 	u32 reg_val;
 	struct vpu_buf *common_vb;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 0c5c9a8de91f..698c83e3082e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
@@ -518,6 +519,8 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	if (q_status.report_queue_count == 0 &&
 	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
 		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
+		pm_runtime_mark_last_busy(inst->dev->dev);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 }
@@ -1398,6 +1401,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
@@ -1429,13 +1433,15 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto return_buffers;
 	}
-
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 
 free_bitstream_vbuf:
 	wave5_vdi_free_dma_memory(inst->dev, &inst->bitstream_vbuf);
 return_buffers:
 	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 }
 
@@ -1521,6 +1527,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	bool check_cmd = TRUE;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1544,6 +1551,9 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 		streamoff_output(q);
 	else
 		streamoff_capture(q);
+
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
@@ -1630,7 +1640,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 	int ret = 0;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
-
+	pm_runtime_resume_and_get(inst->dev->dev);
 	ret = fill_ringbuffer(inst);
 	if (ret) {
 		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
@@ -1713,6 +1723,8 @@ static void wave5_vpu_dec_device_run(void *priv)
 
 finish_job_and_return:
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
@@ -1879,9 +1891,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) && list_empty(&dev->instances))
-		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev->vpu_poll_interval * NSEC_PER_MSEC),
-			      HRTIMER_MODE_REL_PINNED);
+	if (list_empty(&dev->instances))
+		pm_runtime_use_autosuspend(inst->dev->dev);
 
 	list_add_tail(&inst->list, &dev->instances);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index b731decbfda6..985de0c293e2 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021-2023 CHIPS&MEDIA INC
  */
 
+#include <linux/pm_runtime.h>
 #include "wave5-helper.h"
 
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
@@ -1310,6 +1311,7 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret = 0;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
 
 	if (inst->state == VPU_INST_STATE_NONE && q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -1364,9 +1366,13 @@ static int wave5_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count
 	if (ret)
 		goto return_buffers;
 
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return 0;
 return_buffers:
 	wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
 }
 
@@ -1408,6 +1414,7 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 	 */
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
+	pm_runtime_resume_and_get(inst->dev->dev);
 
 	if (wave5_vpu_both_queues_are_streaming(inst))
 		switch_state(inst, VPU_INST_STATE_STOP);
@@ -1432,6 +1439,9 @@ static void wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
 		streamoff_output(inst, q);
 	else
 		streamoff_capture(inst, q);
+
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
@@ -1478,6 +1488,7 @@ static void wave5_vpu_enc_device_run(void *priv)
 	u32 fail_res = 0;
 	int ret = 0;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	switch (inst->state) {
 	case VPU_INST_STATE_PIC_RUN:
 		ret = start_encode(inst, &fail_res);
@@ -1491,6 +1502,8 @@ static void wave5_vpu_enc_device_run(void *priv)
 			break;
 		}
 		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+		pm_runtime_mark_last_busy(inst->dev->dev);
+		pm_runtime_put_autosuspend(inst->dev->dev);
 		return;
 	default:
 		WARN(1, "Execution of a job in state %s is invalid.\n",
@@ -1498,6 +1511,8 @@ static void wave5_vpu_enc_device_run(void *priv)
 		break;
 	}
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
+	pm_runtime_mark_last_busy(inst->dev->dev);
+	pm_runtime_put_autosuspend(inst->dev->dev);
 	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
@@ -1739,9 +1754,8 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (dev->irq < 0 && !hrtimer_active(&dev->hrtimer) && list_empty(&dev->instances))
-		hrtimer_start(&dev->hrtimer, ns_to_ktime(dev->vpu_poll_interval * NSEC_PER_MSEC),
-			      HRTIMER_MODE_REL_PINNED);
+	if (list_empty(&dev->instances))
+		pm_runtime_use_autosuspend(inst->dev->dev);
 
 	list_add_tail(&inst->list, &dev->instances);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 7273254ecb03..41c4bf64f27d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include "wave5-vpu.h"
 #include "wave5-regdefine.h"
@@ -153,6 +154,45 @@ static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 	return 0;
 }
 
+static __maybe_unused int wave5_pm_suspend(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	if (vpu->irq < 0)
+		hrtimer_cancel(&vpu->hrtimer);
+
+	wave5_vpu_sleep_wake(dev, true, NULL, 0);
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static __maybe_unused int wave5_pm_resume(struct device *dev)
+{
+	struct vpu_device *vpu = dev_get_drvdata(dev);
+	int ret = 0;
+
+	wave5_vpu_sleep_wake(dev, false, NULL, 0);
+	ret = clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+	if (ret) {
+		dev_err(dev, "Enabling clocks, fail: %d\n", ret);
+		return ret;
+	}
+
+	if (vpu->irq < 0 && !hrtimer_active(&vpu->hrtimer))
+		hrtimer_start(&vpu->hrtimer, ns_to_ktime(vpu->vpu_poll_interval * NSEC_PER_MSEC),
+				HRTIMER_MODE_REL_PINNED);
+
+	return ret;
+}
+
+static const struct dev_pm_ops wave5_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave5_pm_suspend, wave5_pm_resume, NULL)
+};
+
 static int wave5_vpu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -281,6 +321,12 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
+
 	return 0;
 
 err_enc_unreg:
@@ -310,6 +356,9 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 		hrtimer_cancel(&dev->hrtimer);
 	}
 
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
 	reset_control_assert(dev->resets);
@@ -337,6 +386,7 @@ static struct platform_driver wave5_vpu_driver = {
 	.driver = {
 		.name = VPU_PLATFORM_DEVICE_NAME,
 		.of_match_table = of_match_ptr(wave5_dt_ids),
+		.pm = &wave5_pm_ops,
 		},
 	.probe = wave5_vpu_probe,
 	.remove_new = wave5_vpu_remove,
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 1a3efb638dde..e16b990041c2 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -6,6 +6,8 @@
  */
 
 #include <linux/bug.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
 #include "wave5-vpuapi.h"
 #include "wave5-regdefine.h"
 #include "wave5.h"
@@ -195,14 +197,20 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
+	int inst_count = 0;
+	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
 		return -EINVAL;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_sync(inst->dev->dev);
 		return ret;
+	}
 
 	do {
 		ret = wave5_vpu_dec_finish_seq(inst, fail_res);
@@ -232,9 +240,14 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
+	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
+		inst_count++;
+	if (inst_count == 1)
+		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
+
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
-
+	pm_runtime_put_sync(inst->dev->dev);
 	return ret;
 }
 
@@ -697,25 +710,33 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
+	int inst_count = 0;
+	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
 		return -EINVAL;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
+
 	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
-	if (ret)
+	if (ret) {
+		pm_runtime_resume_and_get(inst->dev->dev);
 		return ret;
+	}
 
 	do {
 		ret = wave5_vpu_enc_finish_seq(inst, fail_res);
 		if (ret < 0 && *fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
 			dev_warn(inst->dev->dev, "enc_finish_seq timed out\n");
+			pm_runtime_resume_and_get(inst->dev->dev);
 			mutex_unlock(&vpu_dev->hw_lock);
 			return ret;
 		}
 
 		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
 		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
+			pm_runtime_resume_and_get(inst->dev->dev);
 			mutex_unlock(&vpu_dev->hw_lock);
 			return -ETIMEDOUT;
 		}
@@ -734,7 +755,13 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
 
+	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
+		inst_count++;
+	if (inst_count == 1)
+		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
+
 	mutex_unlock(&vpu_dev->hw_lock);
+	pm_runtime_put_sync(inst->dev->dev);
 
 	return 0;
 }
diff --git a/drivers/media/platform/chips-media/wave5/wave5.h b/drivers/media/platform/chips-media/wave5/wave5.h
index 2a29b9164f97..2caab356f3e1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5.h
+++ b/drivers/media/platform/chips-media/wave5/wave5.h
@@ -62,6 +62,9 @@ int wave5_vpu_get_version(struct vpu_device *vpu_dev, u32 *revision);
 
 int wave5_vpu_init(struct device *dev, u8 *fw, size_t size);
 
+int wave5_vpu_sleep_wake(struct device *dev, bool i_sleep_wake, const uint16_t *code,
+			 size_t size);
+
 int wave5_vpu_reset(struct device *dev, enum sw_reset_mode reset_mode);
 
 int wave5_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_open_param *param);
-- 
2.43.0


