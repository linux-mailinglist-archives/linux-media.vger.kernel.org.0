Return-Path: <linux-media+bounces-47032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E73C5AE52
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 02:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 706BC4E76AF
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 01:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4202E26059D;
	Fri, 14 Nov 2025 01:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="KyBoKlBt"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98385254B19;
	Fri, 14 Nov 2025 01:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083312; cv=fail; b=il0pRMQfkky+5NyfB+6vP2Rj/FtJAYx7ru+EQukQ0DuccJg1mqCFYImcUCdMiOQkGnFkNub9jTzkS8z/gEpun5euwjGA4+DeDpO4YrWZLRV5HEJdLk8vqYP/xraefHTPMMYkSxWQ1ef7+vku6YQLHe0YDhOTKDJlU+nAWovDv90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083312; c=relaxed/simple;
	bh=TUOZWFog8cuGr8/2USfN0OMdVbQNkfCH0PHlfgWSM2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=azzPM87N516McH8hXubMecIOONI8auYpfjiEspfXNSSokKKfTLnBWChMneIfoXYIGr2rtCgA5tXVqwN5AN4pW77nB2coHaSeoUoubvEFFnD7eVQZyLxWXbQ6tdXflqrxc5JTS4+X/JUmhQBvGy2L6MP7unuyUZhIQ6aW9kRg86k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=KyBoKlBt; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0S5zEol589cogRw4nTznsRZpDHN+hUEeG634VDaAp39xfy06B85y9U6IK9EMl9zNmaRWSIpiKzd+SRjY/j+mv/j//LP5t1nfhCptDd3KmHaoBziYYIn2fy0mC18wppIQ2Z+onAaPeVGhj/o9yFExNZVgQrMaguEch6zGJqIw2+8HJcx9pvGsAx3aILgc/77Eo5Mu7rR2JhTqvTaEDoQ0i3d6rCaFpdX8BeDSpKMQ/Cbkdrf0B5xlKzdRZB64hCclaV3obwhN8Qk1lFUSVRL1lJhUzOb+U+NFxYnnfjk6GOopAX5k6VahB54VhRJEgQr7aSI1OPa8JgxD+Ia4Dk6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qGfKNOZ7ZzMKseBL4ukPseWIPsLpbocHvdclnb9w0w=;
 b=ttFJYts0aivxJqZHV0W1l3RG9pCTNs2ICM/gQWS4vRrpr0UekctT5KHqOz2+qYmv98mfye9NcMV/49+zturgVV2l4duyCnOwMAkG5yoJjuL88/pjWXMVr0M2a093w9jWvFkO35CCE+UTNBgdmuLJxKWy4AR+mUg70nA79VQaRrDTJeQ/YkmV2g5347iS55eyYUnWDa7uo+wdWnkCFpmjlc1lvrLgH9+C9F8UvBOypSfi5ZWOBbgIHZoDuCl3bDq5HwpvDptyOvYrhepF9U1zv2EHD+ysICzDMEOhIYJny9g4NelnPTxeVrcSs06xwuNS5LGRLhZDSIMSiD0mLYxEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qGfKNOZ7ZzMKseBL4ukPseWIPsLpbocHvdclnb9w0w=;
 b=KyBoKlBt8Wzz8eB2YpoFbuNayxpT85TwrXp2UVYy4tE1Bw213Hy7p4HYbyow9NzCI1rCWWq1/nwF/OL/quh4pMa8HXD0eGKcPYbNfbYGm/d8WaN/QSQMaAz1egkEeFv2Wuu0h7rDAkSTJzmq6+626rEZHsfWCWb2bVFGFRMYM1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2850.KORP216.PROD.OUTLOOK.COM (2603:1096:101:290::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 01:21:47 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:21:47 +0000
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
Subject: [PATCH v6 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Fri, 14 Nov 2025 10:21:28 +0900
Message-Id: <20251114012130.59-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
References: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::10) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE2P216MB2850:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a86af0-5c2b-436e-d775-08de231c2d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tP20LjbGYpFUhFqggohRMY+IgmRAKhuGLDJd6Iye1IHeR881qyx18ktOA04P?=
 =?us-ascii?Q?AjOYsPgIuPK7boqqrRbpzOxCshRfou/UWgh7B7P4laRqpOYIyAZjIR2cpFJb?=
 =?us-ascii?Q?p51QRjnVM2lAWVXNPLZYh6I8Aeez5qXuqtKTjFFvslKkNq39EvhLRa0Crooz?=
 =?us-ascii?Q?CNvukVQYqA5ta+3HLUFtrpaQ8aQjXFAa64OHF98oAt9Y4FM3+dWk4vJ3JmH1?=
 =?us-ascii?Q?ocQjd1OW/cP+JxIgXbwnSDE6MPCF7wgN6DRhOTxKOpiplYnr5oFQFHZCl2qi?=
 =?us-ascii?Q?GvveTQuqcsJwQpc2JFKUfyFKQPF40vx9Nf8PPduVnu19OlXwIOZxwgGsGc7b?=
 =?us-ascii?Q?Ubqlf+LWsgMdiZfLuSRDnlZgCE15TgySZLo6kyuDqtOMgUiViKXyFsftHgzA?=
 =?us-ascii?Q?8QclGr+l25ne6NAZqMwuKzpUDAZdujKPKpoxjJoWGJQLxO28YYyjHLjW471d?=
 =?us-ascii?Q?t2XmHx3GfIBE1RSFKmIUk8Gx3+Z69odnWZHEee4GuMloRWREBSY+2ntaNmsQ?=
 =?us-ascii?Q?RKJD1BhthQGvuGEiU1869IEkGkPTlODW7+axdhwEVxOEK3PokgnHlPoqI4x1?=
 =?us-ascii?Q?Wz4BeRnaqlasogwSrEOtCNLjGsEBrcjru2vXFSALsqC/XKGcdxcE45Lj4qs7?=
 =?us-ascii?Q?czBEXn9zHxCzE8GjHV3T3fgbLQN88+CdBeg5BatLkCWkw94QcnSQf4SWkgG2?=
 =?us-ascii?Q?ExrnlUCRXIWy8vQCMp3N4QvoGSKUU/bnVPiRpGywPjZzBOmefNxQTSzULzS1?=
 =?us-ascii?Q?HU9iKNyATl7nvB3fiuKvhm0knQM0K5Xwj0QyufP6iaV7Kc5SpPZ7bxZfXJTt?=
 =?us-ascii?Q?URoDe9syGS1fDE6jED+LpxHNSOB5p9Sy8AC6rjxiSQGyQCT0w4EaOZpF6/ru?=
 =?us-ascii?Q?J4vGxiVGQ9aKheHfP8F7gzhuqPH78L3tvRbKjia0oEWbX2tjBfjgkYgNAZvj?=
 =?us-ascii?Q?BT2y95QBHDVWtc7MxxhAjbGGKrmSpdEnovbmHyp8ICGeP9K4BMdqzANbA4oL?=
 =?us-ascii?Q?oMfTWuH1G1M8y/g7/3qSPiXGafKEvxCGNdoJ/RGyD2EZD9zVrXTzXirSh6MC?=
 =?us-ascii?Q?O4EXcIRjZBmLK+VJxsU+BUr0W1AMC3eg4BD3+RLeYez9dCOCYkahsUiaiHFj?=
 =?us-ascii?Q?24X+BJhcA80DwGZz71tpMhXmliF0XpkjckXcZuVxWMhxRrWRPEQfYYCYz0EQ?=
 =?us-ascii?Q?N4ei/V2uzy7OXLsxnWFwmrTLGpv39KblhwTvaWxLbiPF9n/ImZCmVQ8eSwBJ?=
 =?us-ascii?Q?m3X2YqU2OmVA4EOlasanDk3kIfziwS7bjmSvnaaxit+0jqViWxIA9PPHmcNh?=
 =?us-ascii?Q?42WRSzxnENztx0wJ9FZDwuHZG9cj1jXv+VQzeypk+BXzvaZDj1LjLfUHtQlv?=
 =?us-ascii?Q?4b7OixQDAICw2w+hs9Tz7ZyIYzbFR3jE1Yx3DcrLCMGARR634Wf2Wh1HQmWd?=
 =?us-ascii?Q?ii5BZTAtqa81B1j/Z9pMwB6R4DC55+vxU714FgREM1WRvxPE1V34DrcOl60A?=
 =?us-ascii?Q?cOSGCh3rMUapjMvazdjrFyRhiudvLwk11aSn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6S2zWK18uUOu3+rXpztw9I1e9wMB4Ra0KnYkfpsonaCtSaSjifp+Oqn2UmMP?=
 =?us-ascii?Q?n9WAMcKErlsIF9d4VPUt+dOZiASOURycZDUre/N00Lo/vM7s5yJaLzkvDJ3J?=
 =?us-ascii?Q?u40px1eSx4FHO1NiZ5pBtapyy6D+wJ2YAe21kUYddB/0bSIoHMw3Hs/evsGf?=
 =?us-ascii?Q?UHSQytCYe8CMdlpxwxuvwsNrk4K4IyLvCJQTKEaF+MpNcZjqeHXCpeuZ/vue?=
 =?us-ascii?Q?TxQwvz2ONpNo81nHLNptbpbpv+mKDlPAxX37rXJCcp/J6sv68uut15NsHlUJ?=
 =?us-ascii?Q?5PGteKzfKlgjHGdT62H3dfpjOznws9IsrWyEt2FlPrHzScGHTAXM+D8LFUT9?=
 =?us-ascii?Q?M7nZgwb6ytwSioHIll7s8rdK5YL37ybM6ak7J2PA9kQKCtH2j6xqTqZjJ8dX?=
 =?us-ascii?Q?Fn226dQZTpqKzbOjGKSCW3MEIKS2OSoBWFknaBTJ1Uw09eLeYjf016bM3hBj?=
 =?us-ascii?Q?hzhe5InC4P/CTQGoKfs9ITgODbiNRmIg+TQWNbyYQVhMiipSeOzr52F1G+jl?=
 =?us-ascii?Q?RvW5cIDGzdIAal2cCrktMBDH7Nid50UO0iV0VUrd0r1C3zWiv5eIuL785WQ5?=
 =?us-ascii?Q?uY/NcvqTuEnqHwAKF1+V2cTs+rDcH5iRZpNCNXgQ/15SOXi0HZCOEBPBXzNF?=
 =?us-ascii?Q?EEuGhWaelISh4Tj4wky8GyU0CWTwLZBcxllw8V8qGZARjJJOz6RYOKTbvMeI?=
 =?us-ascii?Q?oja6ba/TNCI2yMkd11IORmUqRFexbCrfyFFjblDEPuyb5OS65LgK0snWFjy7?=
 =?us-ascii?Q?s89jQQEt2fgq5C7GRwZIhjARbjPZBNww+cY4nZ6GL1tRCdVwMkM52s27DXTZ?=
 =?us-ascii?Q?DP+KjG+7sjvY2oKi9LNIevDWjKADwABRMxdIcprbQNIt0GJ56ihDsUQ6QN6S?=
 =?us-ascii?Q?gx/zEAhTYhar8OO1dzNKLrVa7YUABL4YwZNZIuq2zvM7Y39Ifsd0n0Dm2o1w?=
 =?us-ascii?Q?N7bprhUECD4Of+pnR8LLrovSnYhj4gXA47GCEm9UJ3+JdjZsxpmPcDNmNYWj?=
 =?us-ascii?Q?CW3Tx8RWEDmjoiepsOCNxtx1E4El3uQjzV8DZue6WtRMYbAv8ziL1elbVZsE?=
 =?us-ascii?Q?8nNjIWPKzjvXgQDlO3z4c9gd4P8oOoNL22B7exf5okJYWjLvby0NNpucGyTE?=
 =?us-ascii?Q?DPxpiv1k2BECUTRusp3ObObrLqvHP6Dbs2GiM+gu0ldrw+HZQqUcF8PZ4O6S?=
 =?us-ascii?Q?DYDVUlIMI8f2hO6ZZNd1QQ+rrwyNcbMmfAutztxKOzslJNz6cF0nY7klCyyR?=
 =?us-ascii?Q?8W4IT78wJNRl18+FkD6GysXC9X6vGg7wnQC+M3FZiEJGH/y9eJTCQR067giF?=
 =?us-ascii?Q?QIt7A9GxUl4yy66tWm5RJ8uifoI8QhtW7EEQR0nRxsxzKqtkrNwBY2cRrIAl?=
 =?us-ascii?Q?DWPKRuqkyM3WgUyQlzpwuGXj4oEUOx4cp7LCrr2ovAl3ZngESbbm/rDlI6vL?=
 =?us-ascii?Q?Edsgh8w/QiTkBrdNlTO1LsY3DoOst+I9hGZrbApOJA1Gq9v3vkoimpHP75Q5?=
 =?us-ascii?Q?4ZI8hT5a0V+eKwtZhJbbwzmGLK0sZ8QgsfeD9sCNSaEilbEdNSl2DSQZLR+T?=
 =?us-ascii?Q?gBhxa6K2ksTXa9/DzvgTXurfgz8O+RmPCzjnsK/JV6FnTv+QTdILoDZdMbP/?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a86af0-5c2b-436e-d775-08de231c2d3b
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:21:47.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UG+GH0yUHvIEwAoSKO1SkZklufpnKCi58EvCFUxbOQuxfFLM70zBOQkCdczkGpnWpHVcNr/zXx4GXoMpFNbuOUepMjGE934xqsdqDxVMBE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2850

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
index 528387c6ecf6..b10396fa2379 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1808,6 +1808,11 @@ static int wave5_vpu_open_dec(struct file *filp)
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
index 1bf1b92147bb..7714826277e6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1754,6 +1754,11 @@ static int wave5_vpu_open_enc(struct file *filp)
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


