Return-Path: <linux-media+bounces-22846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE059E8B0D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 06:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE7218844A0
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 05:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9181C2304;
	Mon,  9 Dec 2024 05:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="URE9/W0i"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021102.outbound.protection.outlook.com [40.107.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55CB1C0DED;
	Mon,  9 Dec 2024 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722630; cv=fail; b=ey5S0HjYIDkEyiUvSnzIJOnp7t83h30CrgsetNi6OgunDeMty+O4wpu248w6VDycXGt5mmcPjQYDOAOVyUOmIoz9/FKvHj0PbwuNQ63qCAGUwoRfRhWHGBueFOx2auxeq+vp78NJi1r4yINyO546EtcnXC2nbY1TJRdsHKb7leU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722630; c=relaxed/simple;
	bh=yvEX9kLTXiGl1IHcoffjzsUsLxKTj7HHrndozi0qKO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q0MMwGjdI3sS/K6nN6NaiFK1lf+TlKipcyaqGiXo+T6B9ZmMci3rgSactqNiOreowtuaajhVXjnvDjkKOvMKAwCvN7TmHfW+OipAEN+xwXWBY1Mhtt8FEjoIhrBaNqEJnFuiakXt7Rxk54zSOEC3dI4QwxWTjqZSKv4ISKiR+k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=URE9/W0i; arc=fail smtp.client-ip=40.107.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgdZYchqYRUDtRzWfiEcCuNnubC4dVOEiZ3UhlBRvubntisdAQqmGC8NrsvRVVYqzxRFNR/fTUBMcDr6ne3wH5hzvFCZHodvW+pr/U97U/HzWO9p4f+PFKO3JyAcRHeA5/1U+8IoziulUFot9tQeyBeb3mvFfCiS/XSeT72EHdHIi46fCDKOScKI4bD8Ikyn9XkltmTBZmKQa09f2q5oBGc/SgWB2gUPrtJ29eWTbFSjTN1nS1JvrPFZGs/Z/ShzZXT3OjGOgyHtWemcayk+GCVAsLGY0N9oWaegHus0P0qj/9D5QtbqD9vrOM8g3sNF9lK9HCYd64B6VbxKPr+xJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N86sxHpu0ZmI+36m85EhEa8AuGXjwCSEGGlTjuc7HhI=;
 b=l5oPPx/1EiiRm+FX6YdtBLdaljDutrVtFIXvKuOtNmRiVJ9IhODDJxFuwfdS0TsZJqZ+jDQLUwjG3dloIsrBMnMvcQA2mLekv+lWa7eAZxu3FRQmqOiBr6cqtSNcNGZ5FoRLb/0XBHPmuMDA42PPO8JL4LPbUQKWnlQIL/auOOT4IoR4o3hTmoVHbLNPRkIHgL3vb2MA0mwSUSMLpGv5LS6nbWXWNgzT+EfE2eUa7lys4ez4K/1ii+szuLJcTwrgzIwwIrcf6CAMhoMTYk3z/n4WPFZ4BqosuWZLqYrphhh+8kK/id56Bxc+bTgw988wj/M1d8rLOSLvjcmcXFJpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N86sxHpu0ZmI+36m85EhEa8AuGXjwCSEGGlTjuc7HhI=;
 b=URE9/W0iee+GX5wv/TGx1De5JVpBoPytsMEVNiBfU8n4fDrgnw6tC3xPYIgsT741S6SEXVIDmCBOMHQFGDSYQZ6v68eyfF0N/0AqPNITJEXdSzH0VMBBJhN6r4AVxGLMvt8EdT5CC32QJ+PngPfdqmVgybgN2YPGsos3hGLogCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1966.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Mon, 9 Dec 2024 05:37:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 05:37:04 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v1 2/5] media: chips-media: wave5: Avoid race condition for interrupt handling
Date: Mon,  9 Dec 2024 14:36:51 +0900
Message-Id: <20241209053654.52-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0219.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c82ca1-95f2-4267-6521-08dd18138383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n2HB05KSTDOk25Wln7wgVTs/59Mvz8JISIDRDfyxhcNPFDYTfHroYT7rMLkt?=
 =?us-ascii?Q?mwL/P+qwkncm0RK1olYbP+gFhVnE8NmKymFSKZ3COsIpUSdHs6KcxlY1Cq12?=
 =?us-ascii?Q?xBfIAnDI96Q6cpEforJb2ZaknYh3cEe+Q9iBnfzx1Ra3WKXjzH5ewIgPTXd+?=
 =?us-ascii?Q?yn9cyTnVXWT63fqoa6/6qnyBD6SpABHoOen2RKpu3aonmiXeWKmGkDI6K01M?=
 =?us-ascii?Q?+lzqPHHLMsVogFnGXMoMoR+sq4avV9pQzZc58G4FpVtK8TJqg5OoHYeh+rmI?=
 =?us-ascii?Q?SV/N6i3Ngo2H+YNw51pCne/DfowaIFKB+F4LRHJ4Krl1dCoOPl0O2nESsWaM?=
 =?us-ascii?Q?NXE7iFzz0eIuok2wSjIp8Q00ihz0xyX5NZzFKSSJYCwMcfOxBt5uYNhmGpAt?=
 =?us-ascii?Q?3JbaMVWlqrMAuTqjZ9ffMnqNdQLSrMTZgZkYBESx11Gd0fyHDqROUXI3yH5E?=
 =?us-ascii?Q?s5YQX3lHkGC6MCn1+QaAbFnxobDdLeNr9+F54yV2dSoQZt8rlaWrkja6qB0g?=
 =?us-ascii?Q?9PzauIDFqw3luElC54hBaA69Rirc2OUEX4DByx2MuPtQss3fb3Y+GDXMWK+H?=
 =?us-ascii?Q?EOo91C90yM/v17xQEYxf9fFy99mewfxMevkxaGMockJa+qtjQU3IlM4hkfMY?=
 =?us-ascii?Q?AJFIOjEQmospvMexTmyVW3mTXBVgcbvxgYKhD91ITb8rlpA1hfc+qPrz4AgM?=
 =?us-ascii?Q?5b5sFVcrB9YFvX77TW2+BDSBwXEafrvrTEeOxjZrGST+Swz4Yj7kNaN9QE9X?=
 =?us-ascii?Q?C+Z16NDVmUIEJl2E0pDm00fChHwhNbcwTeEfN0yeUb3od0w0OCUQcMCqeL2J?=
 =?us-ascii?Q?cskIkP3peGpX8qC+rm34dlyV9T4oLFKrxmbngwi7nJiP/rogRfnL/+LmetdU?=
 =?us-ascii?Q?HmLu5J++Tt476RVxPJwNc8SJe2OXlltey1JMkNj8mNkoWJtGJJFGOguHw3x0?=
 =?us-ascii?Q?w/9spMei0wR4TDaJrbP1fax9ZEtMB2ImsCfguARi2b1L3AwF1Gom1t1T32d4?=
 =?us-ascii?Q?e0Zp6GO+OfNBrjphBfX7OnsvHUDxmqTYyrNefhgT4b8/BAcucJQBOdi/wT+M?=
 =?us-ascii?Q?LEA2YrXp4K2RcOE9Q9Eu1WmEhDkbvE/EEYR0l0UXkvkySoJ+M0mdpD6uhhEO?=
 =?us-ascii?Q?MC7iit88Txj6FPyrriPbRMjCm5GcOBZEkSb+STyPNMiKg+eLg++IoNLMfJw3?=
 =?us-ascii?Q?Z2UjERmLNcYhpUMRZ022JukmxNooPB/v4jZKetfHUbPwYGGWgF3YslMysbga?=
 =?us-ascii?Q?gVx1hmRy9mCLD36WIPByNSAhAXNxptG+sFz8HPKOvfhs1bmVg7i5XEyksWzS?=
 =?us-ascii?Q?lXpXcd32TeQu4/KDVBxPja245JegcMv78+on6NUmrzeLCW4rxb3cWwd0dPQ6?=
 =?us-ascii?Q?dFiiaCootglPA9PH32JKT7h9s1zvlHg+i4nZ77sT0rfcgpC/hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QvWvyDF41gcasiVTQHPNWPZju2bUGATm4jVBNMFKdPCaidaXCnL3k1tzZorp?=
 =?us-ascii?Q?7pmlBSFX0can1MjX+1s8xQrkI0aAOnoHs/K471yiDP9DkY9AnDcIxsrRhLzW?=
 =?us-ascii?Q?2wzfYr/hN6sGL/gzaG3PlTeKdBwxGiOIokFwmUduIVbiaX94ddZDWeIWlXcd?=
 =?us-ascii?Q?lPbIOEk8RZwe5PIjj96eJQNCcP5BT/OTI8NMWO/O97ZuycTsYyNkDi1+OCTA?=
 =?us-ascii?Q?Zh2Qq3I5ieZvU/BHbqDpHDn1CDle/G8E2XmGGfIgr3dtjOC4YxdF9JnKwBzc?=
 =?us-ascii?Q?XA/we72TdROL2zborVaU24nTVQE5bHeOTafx6iBT1kAGnzgmiMKzEOpzIinI?=
 =?us-ascii?Q?SfXS/0d3f/5eO5nkmIgOF3OQq7zMokVRyMC5BXp04nU+YF/BhjGDxib2vG9r?=
 =?us-ascii?Q?RuUuXPvCcsaC7xdAFjbxZxfDnnnSLSShgjMPKd4Ot6bsfCF2duTwjbr4LzA0?=
 =?us-ascii?Q?L34OhBEMv9o0yTciKh12TrWER1iYEn3/DrBqnKnMLcf2/u4I+3YgXZUQHhMK?=
 =?us-ascii?Q?cyb5BNuKYuANk8/7pMcaAAl1kF1bCqRrPQ6QtxlV2ql5ZDAvcuqYgrsyxRQ0?=
 =?us-ascii?Q?hdfMHm+kXM1l+YX+YOJl8jOLVBwxHb/MN4oyMFEYvWXjnuztRFbrf7iG4HL1?=
 =?us-ascii?Q?yJHXkYcWSLBuD4z1VfgVppR9LdThamRq2pOIHwLED7isqI3PtyB97ghbV7FH?=
 =?us-ascii?Q?n0HWAJe+x1gtuSRcoxoyQc/AMqZlkmBPFn3W32ZdwXvMS2N+Mp20z9WlYUNr?=
 =?us-ascii?Q?tLtTWLFc4bo/VqZLwXnz0LgSHAOjjQWHLQrhSYi2KP/Idss4CIYlXX9Ymwyb?=
 =?us-ascii?Q?3zWekJnIHBCORyQL16R/CoQ8/YP0ZaDKKeWD/BwEgoCv4ASz+el5Jq5fCV0z?=
 =?us-ascii?Q?MKU9SFOHOyStBm4AqBTDkArur1C0/ZfcG+ZSjvKtLo7oT0mSOIcJhgshNbN/?=
 =?us-ascii?Q?h+ZnltFApzYaZ1+yK80hAfxr6a0wbLRdBfnJpEYSKU0sZIadzmW2ragtf02b?=
 =?us-ascii?Q?AG+vIqu7u+GHpw1ixELyyIowu8ff4ISxf934qqiktC8yuTDWBGiGCaRa6yJw?=
 =?us-ascii?Q?tGv7lqPV7e/Vqrx4q658jpdRCUiZ72AWKaHYBraMjddSgYLmDYxFMyrorJrW?=
 =?us-ascii?Q?Y94HBlsjdAuXTuQXRwpI7WTofSXzkNOHnU6CeZ9WHTsjGUvCbuRE4lWViumm?=
 =?us-ascii?Q?y3fUDyIdwWScIBPgYPoL5NhUx0SVKvRZ/1BESYBDk46SDtjcrSCm3zA2b+ti?=
 =?us-ascii?Q?CD36diUCn9nzyUUMdUNHNKr89frd6MYqK7VWnJy1K1AwyIEfONdDQck1ZxD4?=
 =?us-ascii?Q?CnSVmBSfBhv4SX1YdnNpNnDTl6GVyosCPUWbC8Lseavy6gF1qGYz+nMMq/oe?=
 =?us-ascii?Q?fn4iQX7f9PnaStXp9V6KU75BOxOdzqk30ae2BCtPIBqe+Z8h3zEuEXv6lOCp?=
 =?us-ascii?Q?c1rnYT7Ng1BW5oxTVaDeGn0cwjhJ58Ds4qKCclyJ4Cg40mAt3NttWs3RtsBJ?=
 =?us-ascii?Q?8Oc9YJP6hmaZ059Wty5ia2kuspaGisnd5iiUVorDgkNGAr9ts48T4TkYWOw6?=
 =?us-ascii?Q?xj14sJO7cISk5bRgNt0b4YWnIADGCQPvS8UgaNUo3XfXb32/gaF33OsSUh3W?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c82ca1-95f2-4267-6521-08dd18138383
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 05:37:04.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJajTe0GZle/8L8wcplqkZkkrf9oiu/IUU8HfExRPvzdZOxKGwbCwtG/5RFwR+9RaZfWkWUUVbX2aE11ha0FobYzcJb2HMe9SVjUDAveMGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1966

In case of multi instance, interrupts can occurr for other instances as
soon as interrupt is cleared. If driver reads the instance_info after
clearing the interrupt, it is not guaranteed that the instance_info is
valid for the current interrupt.

Read the instance_info register for each interrupt before clearing the
interrupt.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 6b294a2d6717..63a607d10433 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -55,12 +55,12 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	struct vpu_device *dev = dev_id;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
+	cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
 	list_for_each_entry(inst, &dev->instances, list) {
-		seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
-		cmd_done = wave5_vdi_read_register(dev, W5_RET_QUEUE_CMD_DONE_INST);
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
-- 
2.43.0


