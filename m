Return-Path: <linux-media+bounces-42883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58526B8F0D9
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1969717943A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 05:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4833C34BA47;
	Mon, 22 Sep 2025 05:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="BLt8uveo"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0E2475C7;
	Mon, 22 Sep 2025 05:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520397; cv=fail; b=DC5BIMlQqP3p2MJr2ETevJYRF43FZYou1ApQNac1UWMAt+IunPH6zrMnnB9GyHitoljBDtoYAKg4dknu75YqntPCYZhrGOej6vsIAKlEsqgZsa8dV/Jg5fQUxgfqgg2Neklut8Q/yOoF6OiQY4uRcgwKyj9Kih43630MEBO4VMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520397; c=relaxed/simple;
	bh=OIXEf9bJLoO2eChippuuOTcv4qC5GtmltCC80ZUeFgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VjNNmjpbWeXXxB0p7y8aWfjbkOSSn/vEDt446S9PG6ILigC1X7qCqibvXMYEJr+JMkqOyAocxEFw0d/LZfoYBFvSddziotbXgKcX34OxQeBUA16L+nyVs6LlSn/FzTWljTLCqrsNAHtRnbdEyQ+W1PpJtPi9qgCOhlrC+AROVSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=BLt8uveo; arc=fail smtp.client-ip=40.107.43.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXaalmgProun28A+glvtCR1O4hX5elkPsLNgvel4NQWhlzulx916PxEejmlwC1zfx3VEGzLBmJjJbwxUOZmEwM8k4mQSbnCj3ZoIaOZpOP0veDcpObPmGMtdG8/rG955zHyJoLGJS4TFBTy1cw7ugkmu/phYGSN+ZcOyqriLm+OCgDSqX9E03etoc3eZLRFF4YdjNdvApXgPjCiQVyVVbhPMf5Lj0O7o7Q0eyROq7OIUqiXMgTmhcGLFmGsd45uOoltgt9fty8r7VoAPe5joWbSBmNcNe0ZcnLqXSekGpph2Y/m19oTK1xXztnVVsiJGBMV9p7izbGeKyhK1YHe8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11qiPouyCcfStBRZUwPyNhywChENfBSYwAofnuqqzng=;
 b=x21UyD7mKtdKa1kiSj/ZI5GB+uX3OqqJksEDpAhMPKXLyXDQuW5S4eIATQkmhQJzYoc1HLRJHhejkkSDMtNuReXnrs1hjqhp/VnOEJYCzJokq543g8z2vEkL38tgr8v1MN7uV+OtWliLP/wdn/cvJzUDBWndiRMAzAsW1iuomUiHIvK2TXNHjNAPu3fY4WSiwU5JY2jUGjubmPpqeAyRoMvPgw/ENNugGW0CwVXLJ2zn3uZ1uwz0LmDUENayHB6OqKxgWFUMqxre63fa/4lDuhBtlqvNI7zDu0JpoLfM3YrbVgKSswjXAan/ZlM1LGb1igMO/m0ZW4W8tprQEJGxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11qiPouyCcfStBRZUwPyNhywChENfBSYwAofnuqqzng=;
 b=BLt8uveojm92WOmINrAub3t76DS/FQZ4N+yR1RtIUZHiSLF/ZmIj44Z6wkDqjALRfZwK/mv4cGYoS0pcG8c/+/mgfltYdaJVJ8ylpg+YrlZe+jylPSAQgNnSu5gg/xwRhpU48ZDc6l47HQVXGV0rAFgXoBKI3Wp0g/UPAKm5eQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB3024.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 05:53:07 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 05:53:07 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v5 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Mon, 22 Sep 2025 14:52:53 +0900
Message-Id: <20250922055255.116-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::23) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b0a57b-b2a6-4efd-9781-08ddf99c4d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Eb1QbbgGKmIMhtdtvHld1UHYOGEJVAX+M9KXXPkGef+IHz1dgETBaZmLSP33?=
 =?us-ascii?Q?dsxemLo9cyM01bMKZ6stv0l5i2aarW2Y9BTCcr6U1th55KQ/ss6AVsxLiBB+?=
 =?us-ascii?Q?yT67kgPQ2nWeIKJeSyKnrjyJ56MWiTc/jCFM99XrHtMyVLAx3YmxJESfGaKC?=
 =?us-ascii?Q?RWXOkFllhhMpxTiXIjsQFwUwpRKcYTCPYhPJQmkPIcFA4oYoluVa58QDmmAc?=
 =?us-ascii?Q?Fx6vACzFQ5/Q5IteyXz7GQAXiAScVdMwohL2oIBGWvr0QHLq6n0g5cDRSQD6?=
 =?us-ascii?Q?W+wXOmqyegnRSW0sbFXAOntPNm6QiNd2Lacl33+6CI3iCY6RNF2Ludv9iGfO?=
 =?us-ascii?Q?HxufEYkjKzqG/XvV2A5ieDIvxaX0UrclyG83zY+BG93irMYc0CD04H3LhyG8?=
 =?us-ascii?Q?11Dc4TfND2AayPhRrge1QwHuqO/E59l+mQYYqFVeHOBURRBGRjAZ2GjvNo/3?=
 =?us-ascii?Q?yaAqkXeFRvNduRc8CYwuyWP/poolQcaWW242dqUOZIavTbYYUK+tfF9N9COJ?=
 =?us-ascii?Q?Fk7phiFwj5hZiMu+3oCWddNqK1vswBlK7CC59gh7QA7Bd11MNX2PMyOS1vvD?=
 =?us-ascii?Q?QgzbA43bfrna+Ut1mlrN3P2RiUCm/xPZKcEQfd4HVYqeNaLMZU5K1F6louo/?=
 =?us-ascii?Q?Br/duKIqhDVACaDuOJ7SuDbuT1Jco24B82RoDcYQwJg4EzXsJuERD7Pus2ze?=
 =?us-ascii?Q?1ZDXNTc4WuNKrjC8rkfzHNmEle8Yfkecr0pdajzhePxfswfXUynjd7bMS/LD?=
 =?us-ascii?Q?LSZ1ft8GKRzIp7g3xLR4rxEZNufIth2CHqRy7Yo+hg8YeBPnotTHvbG8cZUr?=
 =?us-ascii?Q?3GlYg//SpwzoirxQNxXkFphHKgUZuGv1AhlZ1+EwccNsbYhmurriBiHNHwNl?=
 =?us-ascii?Q?DYpShYeprv214EDvKgqE9194OOI9gc0hRnfhGYrPDnOZ7aQ7QfiqFqMYs9T3?=
 =?us-ascii?Q?yZHBYAngnFdzY+NwTfjg71v5Y/xwGIApoNRuJgSwKB6x5yRiJKcaHSIitfiF?=
 =?us-ascii?Q?e7ux0wT/jrpbPB+IO84qFkxQPkGeaZLOb/nxK6NHbBzBQU0DMvwwJ3uNb9Dx?=
 =?us-ascii?Q?H7iTDipwWH6iMbFCgJhDBGUeGg0vtnXeqnLUymWE+CZbN7O6xc1vGRcFduan?=
 =?us-ascii?Q?p4GxH/oDD37nATIOfsKrUlj192wVeokq8hJ7Y0zjJ2vSLw/QlnAPQl11MzRu?=
 =?us-ascii?Q?diOPmcRHr9Rwnu0VNjn3JutJnvvcKbw0fw83LBHiSNZfz5Powp5u1Ecc4fVC?=
 =?us-ascii?Q?BAZyIHa5O9gaycLt2emX1mpY7I7mINTf6bCKac+sHnnR5FOpYYzE6MMPiBs1?=
 =?us-ascii?Q?eTPceN9beJF1HAZrcqHlPwBXZUyqqH/jcIYHlfNaHhTMjjDTrHbiGKOYzRns?=
 =?us-ascii?Q?u97ZezcPH7OyhQI8a2sGmpY9xdzFEGspNWAnnY7mGTipUZ4M7kqzGJNlS5BC?=
 =?us-ascii?Q?rf0vVcejkvrQI70ZSm5+ZPHtEUwu3PLqF0++rzhUgmTRzGFpTqkACg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RFJgd7E2q50LFCO1+1czkdAkHZ7c9BYdYPFfKKOrwkkvtQty5D+bWHP6RWuQ?=
 =?us-ascii?Q?ayFPcWqHO54enlmx2eyKI3ZWOKU0XDB1hBIw6l6LQFCtutf6nk10sFs5JxqT?=
 =?us-ascii?Q?6XkrM3ZCFEwUaFLhsLJc3qiccD/pLrLpxYvpCEUBHwOOoD7N3eQy0F3rC/aD?=
 =?us-ascii?Q?NrjXxikgdysF0XUwvk5AZbQQtWkKNZfKA7ICHgY/ZLMgBvCTIPsDBnYbDXPp?=
 =?us-ascii?Q?sIyPhgOZOz2gJm60p5pgm2iP58eKaDxgjjuuhlkEKgWAOLRyjXcNJgT57Lqe?=
 =?us-ascii?Q?qweuaAjPU9coyRpVIVrvjqXqNEt39uelSWpBwetonFcFp3Ke5kUSTNtRta0v?=
 =?us-ascii?Q?3/8XkrAJPcCcEDbZBXm83mU6dhUiqQn/9EFFna6BIiOqVMTh0awOg9wS24Tw?=
 =?us-ascii?Q?EfHbyO3QLj9uN4UY0xSqRNc46ZhiJmZkb/Fy9C1YqC2eUPU8RmgabxoV0y3m?=
 =?us-ascii?Q?NwUGeLiSD+H8jFz8UFm/wD5yA7Drgh0NRWqBfjgW+7vztETg1rlslgKt5OEl?=
 =?us-ascii?Q?Oyw1mtsFYeyW/yJWvzSb+K//G+hdyPIeydzLQtsImTKZSJ6V5DYfBg9HolFV?=
 =?us-ascii?Q?XBUrvYuYViJ2hgodr9lJbZuLmJAZkWKf+h4wbEwhK06sctbcMilg7i2ZjWY9?=
 =?us-ascii?Q?f0K9D9HSkX19cy7nydgDOTkZz/Pf7tnlbsLnqrjLOxF/lvFUmUxFfxV2BFrv?=
 =?us-ascii?Q?LqMhiEukLFSFiMSm2gfMO6Wi/ZXo2WCDnBRvtUidMGPGE2BkItcpbIvI2aRn?=
 =?us-ascii?Q?D23v2tlRrDMigwNce5o38UI6DLeC7spIE1KQcybW+JE/lFSTMT6Fi12y64/N?=
 =?us-ascii?Q?gAK578pWeCBvMdwPEDguEthKjFuU5cLPesTJcapeNha5tykf6yvC3uK+pfFd?=
 =?us-ascii?Q?vQTAbjZNICWJN/oWTWc61d1+hHi3TPG03DSe4BCDseAnfh6B/63GlziW3N7e?=
 =?us-ascii?Q?9/xl/IJgDX2xXX/RPEz5xUcNJk+Q1TrTowL1PjX+PukZ5Y38Tt5RuRlWZ7CW?=
 =?us-ascii?Q?KZp+Ts7kRsfwqMozgxUqFOYJVGEdoBmABwbcVUhOCU+3iPqXB03vj5CDkw/F?=
 =?us-ascii?Q?6R+uBebFVMXYgHhznWyqAKo7xS7uThfGqmhdEcDf3CafK57cch5obpnmhslg?=
 =?us-ascii?Q?5rdENxYQFYugkAE26AI5I/2gOO2GIOfvmwSuothGz7XLOAXeGKPNP2mtl7am?=
 =?us-ascii?Q?w7UyYKVmBsLvOFnqoXAkrR1nDBfK8u/by2cRnAJbCJCYL1cqo7dUZYaNocn7?=
 =?us-ascii?Q?CawxXWNIR4Ruaj5GOKW7gdmc3VHJqlTKfKv6RFCm91AIWPCF4WXCH2su3oU8?=
 =?us-ascii?Q?PAKxuALu9V8xT1Hnlqg4yBi6rcGW6yZuC/stz8+ihKvWzrnbnJcSE9sm3ALU?=
 =?us-ascii?Q?KVZH98PBqXNgJ7rKHthZgohtadXCMXcVMb8Yji/MWRfTgajQ2Uzumn4WCW1v?=
 =?us-ascii?Q?YclKqvKgFfGL+wmQIPqsogZymNMXUbsYWDooBDzPEw7JhQ26wLww/HI4NjGY?=
 =?us-ascii?Q?0VibdYmFHsoWrbuqINkDAUiNIDxcG1Uxlvz3/k8X4Wu5IJ3OmjYyVa5CKTrx?=
 =?us-ascii?Q?l9Z1a+yebUd82oIef8tz6Sk8zcO/IyfuFTartRU3cVF/fotfyoqgB40upbdd?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b0a57b-b2a6-4efd-9781-08ddf99c4d77
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:53:06.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7vGFmDkbY8+GWuctFe2TeQxhP0ANRe7h9bKYOqygQasiyBUWy2LkodbX1Rwa5fMmQ5E4yDRYeXc0iLorw94MnGsLmRzvT/JJhAQCzG8Ohs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3024

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When multi instances are created/destroyed, many interrupts happens
and structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in the decoder,
so if the structure is not protected by lock, Null dereference
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 28 +++++-
 .../platform/chips-media/wave5/wave5-helper.h |  1 +
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 +
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 +
 .../platform/chips-media/wave5/wave5-vpu.c    | 96 +++++++++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 6 files changed, 130 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index f03ad9c0de22..53a0ac068c2e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -27,6 +27,11 @@ const char *state_to_str(enum vpu_instance_state state)
 	}
 }
 
+int wave5_kfifo_alloc(struct vpu_instance *inst)
+{
+	return kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+}
+
 void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 {
 	int i;
@@ -49,7 +54,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 		v4l2_fh_del(&inst->v4l2_fh, filp);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+	kfifo_free(&inst->irq_status);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +66,29 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = file_to_vpu_inst(filp);
 	int ret = 0;
+	unsigned long flags;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	/*
+	 * To prevent Null reference exception, the existing irq handler were
+	 * separated to two modules.
+	 * One is to queue interrupt reason into the irq handler,
+	 * the other is irq_thread to call the wave5_vpu_dec_finish_decode
+	 * to get decoded frame.
+	 * The list of instances should be protected between all flow of the
+	 * decoding process, but to protect the list in the irq_handler, spin lock
+	 * should be used, and mutex should be used in the irq_thread because spin lock
+	 * is not able to be used because mutex is already being used
+	 * in the wave5_vpu_dec_finish_decode.
+	 * So the spin lock and mutex were used to protect the list in the release function.
+	 */
+	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
+	if (ret)
+		return ret;
+	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
+	list_del_init(&inst->list);
+	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
+	mutex_unlock(&inst->dev->irq_lock);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 976a402e426f..d61fdbda359d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -33,4 +33,5 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
 			  unsigned int width,
 			  unsigned int height,
 			  const struct v4l2_frmsize_stepwise *frmsize);
+int wave5_kfifo_alloc(struct vpu_instance *inst);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 1df78e427c6a..a3a135946078 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1810,6 +1810,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index d2b047706626..f84146aa4915 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1759,6 +1759,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index b3c633dd3df1..c00595b43bd3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	u32 irq_subreason;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
+	int val;
+	unsigned long flags;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
 	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
@@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
+	spin_lock_irqsave(&dev->irq_spinlock, flags);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
@@ -82,22 +86,54 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
-				inst->ops->finish_process(inst);
+				if (dev->irq >= 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				}
+				val = BIT(INT_WAVE5_DEC_PIC);
+				kfifo_in(&inst->irq_status, &val, sizeof(int));
 			}
 		}
+	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	if (dev->irq < 0)
+		up(&dev->irq_sem);
+}
+
+static irqreturn_t wave5_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_device *dev = dev_id;
 
-		wave5_vpu_clear_interrupt(inst, irq_reason);
+	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS)) {
+		wave5_vpu_handle_irq(dev);
+		return IRQ_WAKE_THREAD;
 	}
+
+	return IRQ_HANDLED;
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
 {
 	struct vpu_device *dev = dev_id;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
 
-	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS))
-		wave5_vpu_handle_irq(dev);
+	mutex_lock(&dev->irq_lock);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+		while (kfifo_len(&inst->irq_status)) {
+			ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+			if (!ret)
+				break;
+
+			inst->ops->finish_process(inst);
+		}
+	}
+	mutex_unlock(&dev->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -121,6 +157,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static int irq_thread(void *data)
+{
+	struct vpu_device *dev = (struct vpu_device *)data;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&dev->irq_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		mutex_lock(&dev->irq_lock);
+		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+			while (kfifo_len(&inst->irq_status)) {
+				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+				if (!ret)
+					break;
+
+				inst->ops->finish_process(inst);
+			}
+		}
+		mutex_unlock(&dev->irq_lock);
+	}
+
+	return 0;
+}
+
 static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 				   u32 *revision)
 {
@@ -224,6 +289,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,9 +333,13 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
 
+	INIT_LIST_HEAD(&dev->instances);
+
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
+		sema_init(&dev->irq_sem, 1);
+		dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_PINNED);
 		dev->worker = kthread_run_worker(0, "vpu_irq_thread");
@@ -280,7 +351,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		dev->vpu_poll_interval = vpu_poll_interval;
 		kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
 	} else {
-		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, NULL,
+		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
 						wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
@@ -288,7 +359,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -352,6 +422,11 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->irq < 0) {
+		if (dev->irq_thread) {
+			kthread_stop(dev->irq_thread);
+			up(&dev->irq_sem);
+			dev->irq_thread = NULL;
+		}
 		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
 	}
@@ -361,6 +436,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..bc101397204d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -8,6 +8,7 @@
 #ifndef VPUAPI_H_INCLUDED
 #define VPUAPI_H_INCLUDED
 
+#include <linux/kfifo.h>
 #include <linux/idr.h>
 #include <linux/genalloc.h>
 #include <media/v4l2-device.h>
@@ -747,6 +748,7 @@ struct vpu_device {
 	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
 	struct mutex hw_lock; /* lock hw configurations */
+	struct mutex irq_lock;
 	int irq;
 	enum product_id product;
 	struct vpu_attr attr;
@@ -764,7 +766,10 @@ struct vpu_device {
 	struct kthread_worker *worker;
 	int vpu_poll_interval;
 	int num_clks;
+	struct task_struct *irq_thread;
+	struct semaphore irq_sem; /* signal to irq_thread when interrupt happens*/
 	struct reset_control *resets;
+	spinlock_t irq_spinlock; /* protect instances list */
 };
 
 struct vpu_instance;
@@ -788,6 +793,7 @@ struct vpu_instance {
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
 
+	struct kfifo irq_status;
 	enum vpu_instance_state state;
 	enum vpu_instance_type type;
 	const struct vpu_instance_ops *ops;
-- 
2.43.0


