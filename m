Return-Path: <linux-media+bounces-35558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3357DAE3312
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CE493B0722
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 00:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073AC2110E;
	Mon, 23 Jun 2025 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="PqjfWKQy"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021109.outbound.protection.outlook.com [40.107.42.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F3ABA2E;
	Mon, 23 Jun 2025 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638134; cv=fail; b=JuEiB2G7jfrHoWzW/ghJIS+koFUdPt0yewItZyPyI34RkrF2tBJLJCtq/xgCmUih2Y2v4gaiz1CGQCYzazSRMtwIWSzcuSkQRjlTJiIXHvZOcU/Z8Hiq15YGhDFP0MHPVfwep9gqkDFxcTN/sltGPLIhkXZA3WEGrdTDx2HprZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638134; c=relaxed/simple;
	bh=TzgvmvKbiqsMToktbwz78XpsA9hTZQMcwcJhIM6k7PI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rSEGzUHNq7SdKyadGcwx6r8RBd0a3R1wBwhzA5I5PlKU/OuhYQW4h1oEUHb2AhzqbUWFjVRP5Tuc+rShUMA7ZIZ7MFxn4/CQKZyEogcwSznwupMp0fWGfRFvWyv3ubbo33PgadFJsC6Ck8gvvbs+36rBSAfWUl2G644wOluo8Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=PqjfWKQy; arc=fail smtp.client-ip=40.107.42.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuEGr3MKsNnrMgpekmiIIUxVoUXI++ZWlvQV52aYvoZal3tdUG5/90HYEviPTJPYdc3e/9ouHzY6g9Q5Xu8s+w5O1wTX8Bmzi7HtgeTGyOPlNYpE9hE/AFNN/rGsJJBaAHuVZtgQwVCDPKO0NXtZFLOte9GgIqjuSeMZPijzwOJQCHe8RAY8QGTMaBlwKRMM0JSmc3p0W4RAnDcN3J/BJT/SKZWQduFP+VtcvG9T0C/NaAJrRnfuqb5Vk6HBadzUyLx34sma9z7nmX6i6hvDOGtRtSp4VlQO9jWX8s1kJcuwDeUWnwKgM6X/8D440YlolxMHnV4gsCqXCY20aKAgyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTtmV1Cj6MGKRZ/bmUugCu+u9oLT0m4bTehooJwx744=;
 b=k9UqP2hi2A+xOyvRbuU+v+kZx4cNlEWhKh7SCD0cnXaNAsmR+K/790rYskeYd7+uUj7ItI5+N+JWwvZ9Z+GSfdaDsy3ahlJTNaeWzrDyFoIk/2S0Co5vFANm4YqR0AXIsFb/bFbO3TdhBgKNducPWkEJJpUqblaHBZRJLi7RzcbFtc7bnXG3FTBFlMXl73rHP1POaIQds95i1SI2SkLMQZn4QdTAnWszdFZrjyLHTHE+rNIEY3QxZPReM06kQWXKj8Wld3r9zPjH7cm3eqDS32yF7QPRRfBBiT/E40wAnKK3tzXp8RO8171zzNHmuMOF1XCWyOPXcC7l6VKtoK56TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTtmV1Cj6MGKRZ/bmUugCu+u9oLT0m4bTehooJwx744=;
 b=PqjfWKQy3FMRTUxkujnqiP3PCXF6pfTKPagLOwlJwYCiECfbumm2XyB2z1g+48atAW7uPPC266ytlyFc5Zwtvsm2a/vYL8M2Oa8oGTaPN5COFyPAAqY67d1QnuUY6iJBhA7OHPqLUYI0JB2u9H3xlvJqFrpXtt0oVqJVFzdpUto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB3126.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Mon, 23 Jun 2025 00:22:05 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 00:22:05 +0000
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
Subject: [PATCH v3 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Mon, 23 Jun 2025 09:21:51 +0900
Message-Id: <20250623002153.51-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PUYP216MB3126:EE_
X-MS-Office365-Filtering-Correlation-Id: 673fd0e2-6a03-4e50-e48a-08ddb1ebfb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xdvs/GL1LBRDp259nLd6HdCAlyQBk8fvOXJ2AHjA6Yz40nADNLpFBQz+JJP3?=
 =?us-ascii?Q?wH8lynuZWE1GvFrfSrDevAYBldrY27X+CXRAqMAw3FcZA+lIaWM7EKgEzjFw?=
 =?us-ascii?Q?X0LoZ5U++HuV26d5TJL0eGEkKc8rEEg/r8144GOapVLBojlXuG1hsyYmR0OU?=
 =?us-ascii?Q?lOoflfNmEb2HlrlDdGxqc85ioT8KPzxHUAo0IirRqSlnXI11fk/73phYlW7j?=
 =?us-ascii?Q?HlQMtHMZqfqSNcTDsvakTACM3qabddNbO8MTPvxfX12boBf6Ou1zv7342h7T?=
 =?us-ascii?Q?vEfeTYFw0YvlJxcnDSeq1EmAx7ahXmIYTPeKGMfQzNWDbirhO/J0HgCHwWiW?=
 =?us-ascii?Q?SynMI+HvFKqoxUgeOpSl8/iQpuGh47kQdaHy2SvpjtJQxsMAHva3lwM4R7n+?=
 =?us-ascii?Q?3Vcjimu1YJzYIqfQJ7lPZ5naO4rSGsTXDMC8JSKjQ7JXgJrUiTyyUyriZV9g?=
 =?us-ascii?Q?YjKLgrv9sDoozIWqh7NH3VECeBvoJRaU5Xq/ry03M8l/esCe9tjHSHyULB/3?=
 =?us-ascii?Q?42H0ThA9AqxTicqeMS0PXf6k7Ew/c2W/o+aAIkF6D1ei48sv7wLcHHSpKM75?=
 =?us-ascii?Q?x6vrrmFo9+HX2evfVwAU7f1vvFmS+UB0UxlfMnRyVJXwMxG+3BLKfWQq4/J4?=
 =?us-ascii?Q?bUAMis2ops/nF68OmOB6kpvOQ6kGZlej53VIvFxzCPwtTGju/GR+S+2VQ32M?=
 =?us-ascii?Q?AnRHlPY//Ik2CQa2DKmhxR5W7L+jHuHgC1AlRKLQmoJQDvnPVa2I8zsgE81c?=
 =?us-ascii?Q?wnv3tKiEzm6qjeAF2hz9ZI2GiJcjjuQXuCwWfjthO8y+sjfKuH9BAT49t5xK?=
 =?us-ascii?Q?LY5wLncy+1YkVfqkYBDYaGuX5iUaS6/lVhc3Vi8EC10Gql5zzWI3bVrPIBKZ?=
 =?us-ascii?Q?yIGkYcaBbex6L2W2Pxhjxg6fUimzss5fWJrFdWpla+jdSlalubfilpRkwxdH?=
 =?us-ascii?Q?a7GkQwLFR6ETeITrYAPFdP3tWHD2Bj+F3KKHz67LHYN/LxKKhJlgUBkOxjjT?=
 =?us-ascii?Q?gD83JA/QDBh7Aa5Rjoqf1ktA+eSEa738N3TjZu2EA3q8N1e4CwB2trk2LhAN?=
 =?us-ascii?Q?oleiCgvn4j/fvJK4yOU2NxjESEdDWG4hZKjrnii0ruD+OpkF9o8eqB2B8IHU?=
 =?us-ascii?Q?EQzKPATMnRnvg+N8CBwPUyHTGsVjzZ+k5ee32FHgMcD0Izlywghk5wNWYyF4?=
 =?us-ascii?Q?gZEXg2RN4BF2ZX9nqaYUYMOUa6WgQqPX/Vc6pOVfv2DhQ8MeDTn+pvLto0gT?=
 =?us-ascii?Q?/2tmYF5Mqn5jrl0JXnMlxKhMczvdCvSTPuhm9FWRNdsBHFSWrwUEp6gnKjE1?=
 =?us-ascii?Q?r8ZiNIwVeht6B8E3d8XDnNf9JJV4hOk7QwvKrobgfFE3ze/LMEAQxByL4GG4?=
 =?us-ascii?Q?GHQd0c3Z7shRgCxrpLItH53iQjZAqgtqM48WbG2IBSzZI78rrkPtZsU9r+24?=
 =?us-ascii?Q?HRBZb6/lGgnMf4tbAF5JrG1QcZbWyGTwLfRt2QkvcEckQIrDcD+cyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yk9Yli70/+gtmERdodAM9Kw36H8k+Pf3bCqs5KXRTqrc7lk5PxYClVYkYfaG?=
 =?us-ascii?Q?EfJIRrLvXuhonGIn/83W3hwCbV8QLu3KWiAblGxTO33ehSmTP2SKsHcpooy7?=
 =?us-ascii?Q?6C+Z6kWiO7WYTbMR15W9FYzkRLWNjZAkv16OePk4woHU+pKCT33VCdeTkPQY?=
 =?us-ascii?Q?a4aZsRCn5DBDPcuuKCNohXlknJyFSjv/nJdKcqu4YeK5Fsw4PlwDz2WCIhEy?=
 =?us-ascii?Q?pN1bSXCBru0NnsfgpT4YHc7uw83GM340U9rvI/fssmLL/Zh4RB0JFeVxbPJn?=
 =?us-ascii?Q?lXws/bk0DVYcjIfOo7G0EqewcD3GcZBR0iEhA53oP/NeUlDhhJ5uQEabvUWi?=
 =?us-ascii?Q?U6J0vYg8GFDVCYoB1TIsL1alfnr6eHO2MyoJn7Aqwk62Y/ze5Le7ycUhj0PB?=
 =?us-ascii?Q?a/d7fHEcTy+5Bk70sQMH0vNtrqvnR6lC1EVLqS8W8qW7rnTDyp+E00okXGxo?=
 =?us-ascii?Q?mj1zAk8u7IO9eLEzwapaWpsOeq/oULTEANwiSkPc69TD81C+PngWCH+2Uv3/?=
 =?us-ascii?Q?GxxO7oNonmQN7v0NRj8cGbLv3qZc3Je8zwT/ElRpMRsbkCgNVFZ61sJWRpLm?=
 =?us-ascii?Q?aAI+3bJXKYlpoUoGq4qvZm/uE4hTpRm73mG5XLHjK66pYYRA/f48YBvfo+ON?=
 =?us-ascii?Q?lLvAIeoOXpHWVkggL3xxngohWUxpkkdU2oIkD2yQ5f+oHr4t3AyG4Wup7FsB?=
 =?us-ascii?Q?rtuDqBvIy3XJqiu8JccAyDcSqCys2X1A8ZQmrNK4+VFE4X63t/Wh5TSFpJqU?=
 =?us-ascii?Q?qtm0B9kNfA4xClYo+yRXlVhVcnU5/pdEGp2n1eHgiC9vGWku745uFXXS7Hp/?=
 =?us-ascii?Q?4mPxi72/0Rif5Yd9/lqKw9i8nbRkQT5/N1uMuLsVk4b7f5dd79RsjAOf8DRo?=
 =?us-ascii?Q?AcP0eVV8jUQlEYOg6UEidVZKxu5ZtZDol6kOV33K8kJRbRMmnSqoNa+eoVdY?=
 =?us-ascii?Q?L/Zy2Th+qoHlS0S2858P2js7obDKDQBFuTKE4J2p85+5U7mgZE525MNClgcP?=
 =?us-ascii?Q?jb/hP+Y/WFDQJ24V17Zr4XF4sQHsJ4v7hiXbvynClQvGnO7EEUj6AfOnKcjG?=
 =?us-ascii?Q?lhw+qCwgn9/nU2k9boMh6kDbq5EHqqywUuiSWdE7PYzBlWCg8n94IdE2l7Rz?=
 =?us-ascii?Q?qfJT0R7bsuYwjqfuyXHwB0zH6Pnlq/Zra4EyiecT9tu6CIFpnx94ynb4hRRU?=
 =?us-ascii?Q?ZOsSFwVtRacKJkhZ8Rewi72FaMy6OZv4WpUP1i4ngKGMTUsnoC3ck5agdNpR?=
 =?us-ascii?Q?tjWealIRM0UGvJnZvS3UxkVjxyq630UiNwjrFYup5Bis/OjKcsiiFG5Yoeku?=
 =?us-ascii?Q?XI54+G27UeL0VA4ZUdLGcDLUXzKkHrQCxsjivDZzywdOqI5+cLRGDS93bBNe?=
 =?us-ascii?Q?aSxXZgtk8OCrcSwtPmjjRs7FhDNzKYbReQYCPtNTbA0Nzo64egpjj49ygd7U?=
 =?us-ascii?Q?iQL5JeYiRl9g07FhFrA9YAXWf7dYxc7G4YJ5Y2Goa545eROkme8AW/rejWqn?=
 =?us-ascii?Q?xgo5Yt5dF2dIE356N4P/vhhZJ57b0GNIdUETyJDNMB8ZA68Q6oR/VdjVBRMC?=
 =?us-ascii?Q?52RveGxolafoEm0w2dwMp6XuenCmw9ui2vxitBPv00vqL4iruIZqnxg7Re9t?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673fd0e2-6a03-4e50-e48a-08ddb1ebfb13
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 00:22:05.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ylScxE9tNEayb16MEqZA5gxKrM/wDju4EGhw0wbkIg7Cfsh5nBdtRBx/kQ2SNjctoPYkokPRYiCkYZ+S5bBIZq4L+iDxEsYzUjcpKkBX5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3126

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When multi instances are created/destroyed, many interrupts happens
or structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in decoder,
so if the structure is not protected by lock, Null reference exception
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 23 ++++++-
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 ++
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 ++
 .../platform/chips-media/wave5/wave5-vpu.c    | 69 ++++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 5 files changed, 99 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 2c9d8cbca6e4..02914dc1ca56 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -49,7 +49,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst)
 		v4l2_fh_del(&inst->v4l2_fh);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+	kfifo_free(&inst->irq_status);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +61,29 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
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
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 216b024c42d8..2df7668575f4 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1811,6 +1811,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index cf20f774ed1b..7f1aa392805f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1760,6 +1760,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index b3c633dd3df1..24a9001966e7 100644
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
@@ -82,14 +86,22 @@ static void wave5_vpu_handle_irq(void *dev_id)
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
-
-		wave5_vpu_clear_interrupt(inst, irq_reason);
 	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	up(&dev->irq_sem);
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
@@ -121,6 +133,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
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
@@ -224,6 +265,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,6 +309,10 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
 
+	sema_init(&dev->irq_sem, 1);
+	INIT_LIST_HEAD(&dev->instances);
+	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
+
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
@@ -288,7 +335,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -351,6 +397,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 {
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
+	if (dev->irq_thread) {
+		kthread_stop(dev->irq_thread);
+		up(&dev->irq_sem);
+		dev->irq_thread = NULL;
+	}
+
 	if (dev->irq < 0) {
 		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
@@ -361,6 +413,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
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


