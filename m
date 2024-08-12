Return-Path: <linux-media+bounces-16110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2994E76F
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4EDF28264D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4891509BF;
	Mon, 12 Aug 2024 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ULORrAst"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021080.outbound.protection.outlook.com [40.107.42.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7C15886B;
	Mon, 12 Aug 2024 07:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446529; cv=fail; b=L1YaY6XuSUJMfG6DvKcYywr6rBV3y44DCKZZpIWFIPzlmNTGOITxBxATMYXWfONSJbcPyFzfXXSDmsiyI4Z8x8T0eKd7B4W5uukwBedeLYXTY4RzlIHacd5ObnNbxFEKXMf06/eGit5g49/0dSY3TYrJFvhRf8WhtDIrNuMavN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446529; c=relaxed/simple;
	bh=1gH8Kst5AyvyREmhJnzJ4WA7ZLdac2yMvVZzwSm6PP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uB3O9TwngrN5odCwZjRESN8lJLpKyK4JrOl5HLZFw9wng3RTL0olwZT7L3lYM2QJB8hTGivpK6mHH2XPAWgAi4MbrHd2y4KYGgS0JKrRo7flqgal5WJY9FekpcZd588NC0Iw68cad5PMp+f9IwvDyQsLBZ2mlK0RLzokTElX5x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ULORrAst; arc=fail smtp.client-ip=40.107.42.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhfPT/fGEvPFEAi9yrP+YlKkdAyFEsuRXeeNroJPRlLL3+ooZ3asULURwIHgMyyCvp3OdcU1GHfrP0gCig7B0EQYEadtEir2k/n/TCScJTtcr+8CwOf+xNVO3aHT6kUmHDisYIiZ6SrW7l3UzM4608e+GAKM44Bf7Mn/KWrTcfyTru2LStDRUlROWu3DnbTU11esl3Ku/ZsbPzryDn5BTGoGkoVc2B2s174FAByNJ8mtP1T2466VV71wRj3eEf3Q0paFj8QXecomM97J3gVaiPgv0JzXTKpsLL706jthDH45YdG4NibovCoS5ngbIVIgI2iYtXydzmsSkoYbmKhVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsuiMHgkIfdA/t5ukV023GxxCFgVF8UHfqk1OSNTkb4=;
 b=DbVqyvucTYAEV5Q+IBK8X8zhX9lp4bzPmYAi7xxGFIgK8t3E/oe4vDaI+MUi2W5m8ilK84LoRizdH8xHEm+Nwx83lisZMfHExnyg12gLhEVFizCuJBL0nnAvtOddE7jvYPNQQ6QUuItMP50cHDPIHCtyVFDj+f8+DbCFz80IJHaxTe055s33RqMz1kfEKl16RAV9MqKI9vBhYJdJ6iD5i1NLzlAhxJSLdQ/JLvTs17MPfuGPyvZkZM6/mjoHDG7rAH80fFk296gy5ZQ3GHHYMw7pshcXuHdByFZyJY88v7/mhgFWQAcqEV0YAKpwN4it2RBM/bEbg8qCtJX1Zaa2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsuiMHgkIfdA/t5ukV023GxxCFgVF8UHfqk1OSNTkb4=;
 b=ULORrAstXNi3kpWhF1rhMmG4gOJ3NCLdw+3XHrcbxYisehlsxkwje/drV8nVIGJIjHrEKDjzw9aN8dDeSxb0BUbxWLTAU55LbyUuu9QBkBtY1kAv8jUw4a9HkXr4KBDsHBQz/Ll5qRiEZiIkW8sNIGAYJ6NM7hdXuVdcqrf1AyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1530.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 07:08:39 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:08:39 +0000
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
Subject: [RESEND PATCH v7 2/4] media: chips-media: wave5: Support runtime suspend/resume
Date: Mon, 12 Aug 2024 16:08:21 +0900
Message-Id: <20240812070823.125-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB1530:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce200ae-d417-495e-7e1b-08dcba9d9783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ivzttITxAecFrZUMcwUoCa7erS16i8ycK2zH2jaGIiS1yNdTnJsJkQZsvKGQ?=
 =?us-ascii?Q?OpNbNlXL4RtazGL0NVaXoxz8efNl1pln97mTpwqy+sUavWJvNlxRuyuhLLBp?=
 =?us-ascii?Q?UEs5XHsq0H2eHvjXtL76eSG7dVzuJodzbZJbITxN5yfJeiw0MZo9sbf2QPXn?=
 =?us-ascii?Q?2fpCDRliPd1HErJ1v4HkaqcGxdwyL6dYndnaUwhpzVBJI349lzcaNvByqttg?=
 =?us-ascii?Q?dV/gTqkigELfP+iedxqAXyfSPDaJ3TVWW3ZAyvDojKM10Y0InAh19UyeEBve?=
 =?us-ascii?Q?UQJOMYeUxHX4FRszWCOmhWk9tuxK4G6KuzAKj0iik9I3xwU4bYT4RnYJS5bh?=
 =?us-ascii?Q?yJqZBXrco083Gh6i4O9Sa+eOx+z/rJJBFFwjHOKZo84PgaVQPgI/wDeb/+kp?=
 =?us-ascii?Q?4TZrwwevcgKNSf51z5+q+QJzOjFCl4GDGxSpS8CMbfWiinHTMzhgKfjwQMOF?=
 =?us-ascii?Q?2j41bE9BAPNA3RvYmWnPQGu3hvEuURvicixeBs4XiFrM/adUwYNs55eKz4NW?=
 =?us-ascii?Q?qq0gPAl3VvcofYtdIC81dgvQXzXaTuJ6Wg+naNyy9J2ctjLpvF9aGLx3ZHob?=
 =?us-ascii?Q?4sazUT5ozKyVkByayDaGNs2ZHkq7irVKIKQHOGvX7T2MlQnRdz8T9yuhRuBf?=
 =?us-ascii?Q?LWWByIKSvTcs96HSl/lwyONiP9IMzlN9GgMPSdI8SYdxiLzrWrJpNYWFNBEG?=
 =?us-ascii?Q?+4Zj8BJgXUVfyr8U9FOe06ohbHFANg3Y0Ez8ur3ntF5D26fLde+AKDfkXpQh?=
 =?us-ascii?Q?Eo/UdbPft1WCJTr3qcflAiPH7czz0/ljRJIwYmw+Nsk9i7VGVRKek4q84fPq?=
 =?us-ascii?Q?kW36nIsNGYEwNsDSzkHVqyUiLev4I/mpnRaar7/PAJndCA5TJTkMcX1qfTqr?=
 =?us-ascii?Q?Wl5KrYU13fi60rfaMUCJGEPTHP0R9w1XNymaXOE0LjjfN//QvYGowQiiLqE3?=
 =?us-ascii?Q?LOVxR3qd0Y8HX1vf4FyR6hyevVMQXom4p1JaAweTntpeo9puEsdsf+9oqvUv?=
 =?us-ascii?Q?MFmOqPssYiTxhN6oTeCkvkP5b9/h+z6nmYeatHtlabat+oo+wROKvFU2h6tb?=
 =?us-ascii?Q?OiivwP6snzYSWptk71fnGuZGQNmPcsPag8+HN4YrvmIakT51254uVa5dPL/w?=
 =?us-ascii?Q?1F5mIF1FYB4l52K2/zUcVFcGsCShMWKxC5aNy6QbPzaOQhHpsQZO9TZ1nPD7?=
 =?us-ascii?Q?VslFTl/68ue1wIxOi3YVK01r4dIfef10JYQYqsyAW+mWIqcsAWSwtEP/0wya?=
 =?us-ascii?Q?0Se7zlyE9RNVnGGQ6WXJXM3nrujhe63VLD9vJOSM48fh1TaadvV9SmQfIP/1?=
 =?us-ascii?Q?0OS/R9Ia4tUTS8ifYytBhRyHfurFJBh+fAb9FA4keBZpZ4aRPwRoCQ3HB6/0?=
 =?us-ascii?Q?dv5xtaid11W8/5nsWwd1aWtJooG/ckxudjCbVSlxhv6cCFqlkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lfL33ojQNp0oXDuDJTclyPCaV7jsfQ9GKm8FYzGOqCO6Jm6a6jmC5WAdsyQy?=
 =?us-ascii?Q?jU5DaOta39Bs7LdvJqd+zL67w1JwtFcn4injf4gpBQE3C/X5h/qj9qgKrNIZ?=
 =?us-ascii?Q?YQlmSE8Yd4yFNnXFR9Zj3gvWJJIPTBVBF6c1jb5ipkMGGMc2RR6dWNje5NFE?=
 =?us-ascii?Q?6QzlZRw8U5GSO2A5ZWTczVHif6XfU5kPx7SCyjyKqVlWT0L0AMjjb+W0D2AE?=
 =?us-ascii?Q?R9tttK0+QeVM7iejUAiVd3LL2XFYms0VjyaTswpwgpnELi8tjNXlTwa8Ejzc?=
 =?us-ascii?Q?8VXwGn/I2Yr3KVwDqPfY2NVmvQiwno3Ur5mv7sydakLeqXewnO6JEbB/KsNk?=
 =?us-ascii?Q?o7DBuaZqHe0IvsP9Og018xVGftaLxkb1dA9AuoJPAOWBNLKw6PLvCw0f+V6S?=
 =?us-ascii?Q?y8arYncOnCB6aA+kFbgawBZXVaXU758ZfPR2PmNladTv1OkQpgJRipj+Bjf0?=
 =?us-ascii?Q?Qlz56w8KLxDhv2I1Sg6907qSIPRPWjEA8ObolTxpjz58oa4NTTfqItzGAo/S?=
 =?us-ascii?Q?psASc2cXVprdxo7uhxz1n51whhn9k2ofAgiS+l1fUUNaMkfhDBm1XoFjaIoV?=
 =?us-ascii?Q?CBpbli7pguwPXr2Pqab30pzqrs5Bstee6lPml+8DuZvOrydoir2yw4fSRCG3?=
 =?us-ascii?Q?Mf4cARK6HK90s5Pnap8O5wc3VJ6IMvqnU4esw6+Wi3hmL4q+hri86ulSzuh0?=
 =?us-ascii?Q?ChqHUhfj5mN6O7wVt/5pOXRQMgvR1seaTZBqwSFyk/AwzWft3/DiIVhmH0XT?=
 =?us-ascii?Q?5QvUiW4lwFYNpiyD9+JC9Xy49fazSzkFNMZvv9Jk9FG1FibvCMjYV5yTieGK?=
 =?us-ascii?Q?VPB0upLjCPWiqjH2d3masQZ7eRKXw8sYqYFL8YTnMAwPYl0Ij0lNo24NPOi0?=
 =?us-ascii?Q?LC/8du8QCOK7+qd8rEohN2E5rpH+vdjW56Nkf89yyfSnJ+Om9+VrlaH9KAGL?=
 =?us-ascii?Q?OnwP5aVI6RBDbVDz0p3qh3ojKyHTzibGKWRmkrpRpFbviFNWK36Ipq24eS6V?=
 =?us-ascii?Q?xCvHp0t1+s1Hi00eiZaOuEW8vPNunIurPYM0UCD907hj1II8uAwZAEO8X5Nl?=
 =?us-ascii?Q?RTcdS1ElVAH0nq6TZob/dpaVEyDsFWhdHwSKStPxm2D/vcQahCts4GPcJjsw?=
 =?us-ascii?Q?C/n4W/1QCmhl7Gam0BbneYH0g9w6H42El/eGExKOHjiHiOzfrCNRmTKiQHwj?=
 =?us-ascii?Q?kyK2UmNu8aDr69pPB1XGnye1w+hPzDcAWzm/d8bNr2XqrYoecrCZnQY9u+qM?=
 =?us-ascii?Q?3miov4upa803ELOXg8PpQqhUJO+9QC0UHlrAiR/Yk2ETAdjck3FyShnge5Ob?=
 =?us-ascii?Q?CNXbwX4Fxpslv2GzcD4ssVCfcvy1esqT5OMZcfP1Umi67KhD8ZvgYcBCCIsB?=
 =?us-ascii?Q?zc54dZGAQCTn7tmX/qi81ohoVuqQlnuHC9XAvyr0GQBIJMmQVjPLs4iOCy3j?=
 =?us-ascii?Q?mRR8guYLuXHjTE53pManm/ERF7C3Zhw330HvTlDNJG5G+kHbiZblTYBzcLKy?=
 =?us-ascii?Q?3O2yYwxt1UAjT2vTbIYXstWeKWUoGUyrBVr93l3uwER5tfJt1S/Yo3GCWmgH?=
 =?us-ascii?Q?RZG4nRpthKyBlUjLqOZ+KDW5/zy9Uh6R5cTiizkT3jif8OUb1y+TvFo8uH+t?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce200ae-d417-495e-7e1b-08dcba9d9783
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:08:39.5900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63aQOa5fALN8xHhZWRyVZnE0fbzx0OUthzYNSaulpjDfjdQxC5v0nhPkwv8zZT5EraM/ZaywkyJDAHd5EMv5khULsBvYiNnrSr3ZU61gAss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1530

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


