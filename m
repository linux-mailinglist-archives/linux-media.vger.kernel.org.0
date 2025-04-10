Return-Path: <linux-media+bounces-29820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D9A8356F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E5C1633D5
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D265D137923;
	Thu, 10 Apr 2025 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Y4kSP1K+"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021123.outbound.protection.outlook.com [40.107.42.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418FC13B;
	Thu, 10 Apr 2025 01:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247317; cv=fail; b=T9bNhR5tWLHYViDcpsogsnS86H7mCkuYN1C0SrloXyDmpbB0ZODQH2LrjSStdn/5O2P22ppPtvh3ttAbxbWWbaEi2IPNwjK/DXiCz39gL3hO0eYrb9jVrfDcZQeBBRm4sxTihldYW3Na+MoSMtWUJ3FBvuKixj7vNNMRor82HYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247317; c=relaxed/simple;
	bh=YYyAeLpW4vipwI+e7DPZ+U2TdfP4pmNlVJ46ZE35GvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fmJMAlHG3bm/9vROpARqx2f7RlIAp0nfgmqrkheNheIkV996z77LXNVPw6BUBMW4GDuoxhIcUExnavBqDnfBsagVVVx6dniXx2X52OCvESl6Poc9A6hrifoqSZNGmytaQzJwe5QVnrogkEmKeVcBJth8pgFw9tpYkhuG8gyAY94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Y4kSP1K+; arc=fail smtp.client-ip=40.107.42.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFlPclVRR4TkVi0Z9xr0QVutDo2ic92dXflVB5APPFRA69FQrDjt+gMbtVbHHzkbKQ0gTE/NFS75wKmK3Ayf9te5wClh7ym9GESTlFixYZi3vCKew0iTeI5RwSvpLwUQRIyGhEzMNFtqziM/qbHew6IIQ0AtdeXxLBYO7vaU3vGhpVnRm2W/w+OFLK4Nn0CrbJImDdYXFtWoTvD7m9RyIIsFq5ggrqD8MWA7DfLHkKGEXhwOtZ/52KHKKPqNt+1ySCQF7SQLTT4cD4g+9DJdOKHP9TsGYFg+UzYJar0hwGUCWyLrnIRo8lNnrvtBBlh/i/9QL7TEkIYQw+yxg8lPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEpcFnUz6GCo97dFlsyfZ2Ur8raX2EqapoLu7MGFadk=;
 b=Bv07h53HuPPFqyrV5JZx/a/me02BGulctY4zqU4J+mq6ErGfi4ds6RV+HESJXL52ixYp+ZBpIad83F0tjvHYRj7o3jGooF+4DHTyO8U04Mw6SnyNu7otLZlo7fQ+T8IqKCUrdPSLkZQOMyfj0SdUfkqyH/46BpuQx3LetC6hD+qnqojHysFUIM2wTdX/2nLEnZh2VsXqxdMPjUbPGM0N+qCvbgtnqBMPdecM/3pjtFVoNkb91diwR9BOidNowoywYcI+JlTLXI+TMJUbfT3Hp7jHmuzz7IxLf48TWsmz5bWjBLRd330FpfyRcpA851kkl7oj4rNcpDfYdyAjUkSx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEpcFnUz6GCo97dFlsyfZ2Ur8raX2EqapoLu7MGFadk=;
 b=Y4kSP1K+oQWGXp9/Y50LpHHFdl/wAkAlr2zQ+uBlQSE6keTDkztX72m+q5721KyXKPpoSPow57vF1qrZiYiXQ0XHGworgMlmKolaWFgR+YDhXnIo8ZA9gla8JuO7J1564A5DoKtzV1CKkO4woXdITC3axau52EaCzCv2y3JPrmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB2928.KORP216.PROD.OUTLOOK.COM (2603:1096:101:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 01:08:31 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:31 +0000
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
Subject: [PATCH v1 1/7] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Thu, 10 Apr 2025 10:08:15 +0900
Message-Id: <20250410010821.52-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
References: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB2928:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da95945-f4a5-4d21-8a78-08dd77cc356a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/WS8U6MzgNyPHuDfSK6bKP4kiXryK9M9GGMIeF0feUlTr0SetqvvNS4Q9aZy?=
 =?us-ascii?Q?7Qly3/qXMDs4HCaf5AO0OOUhD5TnKHKUyFKhNc7ju+TScLmU08tTZ6XZ57B9?=
 =?us-ascii?Q?RDXo3fQtTTWYifd/zmmb0HD9KL5f1r0p9H4nvUZVRBBc9ydCDbMKDTcKVGGW?=
 =?us-ascii?Q?QnLnn7u6b34mXegA0WEtHlxanoIDeQG7jKdOCIxAwr1w4uwX+rp71uocDRYj?=
 =?us-ascii?Q?jSysgmfEGKSE/uavxk0+jPezAwe6LymCjbzfeyG4+0xj5VsQ1HBTtVBU7h0t?=
 =?us-ascii?Q?JFYh6RGN1Zab85TRuXqVIh910VQbaAtwnb4CrMdiyb/AsGoZIUaKdJ9bcTYC?=
 =?us-ascii?Q?FktWKFO7gwpzoRL4SPT56MyFo5I45QjyXySylryivC+s65s5sHTYl5W9GYLi?=
 =?us-ascii?Q?GMjR6QPWN9Rj5SIAXhux941HfyymRdzFowk0FTbZPGeKF3vKOFTvHecyT+Ed?=
 =?us-ascii?Q?cPb46VQAD0MIH2TRd/z0aPsHiykfycJMPJf8CMRQ8VN3/y0iZMcpe3ENsehq?=
 =?us-ascii?Q?ODn+xh+CD0SRavHLj+dOdlufZZdaoDuXDnNJF1zqwDKCF66hJscFRc6bxA52?=
 =?us-ascii?Q?gdhYjeXhaHNeVcFTL6EvW+5sGGuibJSmMtBTxWdOGyGsa5C3Q1GF1Dp8lpy6?=
 =?us-ascii?Q?ZOE8klIwfzmSL0N2jrMijlxaYm20qFCRLVUz5t/EMghW1iI1aChh785zyY3k?=
 =?us-ascii?Q?ET/mIvGiRR3m2eTWOmYIEy5pFb9XPtPUE8oeAzegXz+vxeSAc3aq3OQGqgwP?=
 =?us-ascii?Q?uXPBZr9D+9NpMI4M+R32rguFx8wS9w+w2Yc4pWmWt5JsFBdN03IokBvO7ztV?=
 =?us-ascii?Q?CcUEJ7GqdUJ/5T7VotPgM+DEC2v9xbqdan1OhVO2rBsX13CvrHCZG2BnpUPS?=
 =?us-ascii?Q?jVnWRS3nQ6IkXX08NfdExLM5U2wrju4Msi8zHQ9zr5Sps1MteE6mpoGLpThf?=
 =?us-ascii?Q?ZwCbLda1tri/WEghAg3K1caRuH3UeF980D939eOYL5pX5IKxtH74NInfD5hD?=
 =?us-ascii?Q?9K+Vxz1GOFvaqh/JDyl068wpWowVIrZ/QGcvq5xi4y4ecUkLpIb4EqG/oWjD?=
 =?us-ascii?Q?F6p2ol9l6r6bvn+r4PUPOzLWCf8WdpUEvhML3axJjbfaKmdCM9i28mtpF5Tx?=
 =?us-ascii?Q?axmbkGEExIOiFSZe2vCtFWEQky2gq6vMcqhD0O6wvvYtAQmUpMTr9oev/1Bf?=
 =?us-ascii?Q?ouWc9cxk6JOTsIdGm3N02eD2IPrz/pPSKAER8wiw0MD89GQ09ZXh67RJE8Oh?=
 =?us-ascii?Q?/s9IARRsCKY1r6MPk0x4fyvMLbQhWb4aV1GNklsA9/5wigd+BJol6damJoki?=
 =?us-ascii?Q?0sAD9VtgVkEBkIrI+Bm6zFVS+B4j/vlsY9l4Gpz/XJx45cOu+u88CRMBbGUX?=
 =?us-ascii?Q?FaruEhTvf+jliRRr+LaXKIQQtIIllBV8UvyQXNGJJ6tpWGxyUjgh1FnMZrvQ?=
 =?us-ascii?Q?h0wh95Vw+lkZ+Ncq1FzkSLQ9bzMfMDrMvv7uQzm1OTDrHEg2xoWo8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UqVZyNq3scURsLqavc3pLYnscKk/ap0GJyud7coOri2gcoSLv/8X9cnoiGWt?=
 =?us-ascii?Q?RBxgqW7ARkiFR+2I9LGJGS06XE3dF62gJjOYdN8VjBes7xv9UGO2JRWF0/vI?=
 =?us-ascii?Q?299QZjGMdlkw6pRF426pVGFk3BT6RAyN09rE3YTGb6+/KU4AoRbn/67O2tHE?=
 =?us-ascii?Q?NhiTeT2CFrgocmDzXIIiXW2UY9H98KDScB3eFmZyMVfDfjhq3X7eczpr3R/n?=
 =?us-ascii?Q?5XMywCedNcv6GoS62BuTjLoHjki4PXPWuIpJj4hCGrJCeyKH4fxZwiirpoVQ?=
 =?us-ascii?Q?mXvuGeMwzbmzShLjgFQsTtVmiUwM8v6hoJF00UKzZovAElDAJEpBSL4eKoec?=
 =?us-ascii?Q?63oukWKTPX7QjArJfSEiE/hFAPBen3HAaA115qm32F2XQ7uMniANhnzL8ult?=
 =?us-ascii?Q?24QTBZTTzepumh8ICErVqF5iUjG1WurC1HZBogGqu7pUWl4L1NEkHoVd9oYO?=
 =?us-ascii?Q?cQKNCin5fjNvd0X8b4a0TUcQd8wODSRwgRm4DWsjk72ssr2mDyoYo/R+fY0Z?=
 =?us-ascii?Q?KIDW8NLr81a9b4HPmfb+R0yug9CCdVtPZeru/yzjml8JsgOIOyfysuCPHGWt?=
 =?us-ascii?Q?HtS2MGVbbDIqo0gxgpMp4tP1g1TXT4YKu522iOE4+4Xyk1JDbAN7S5RI3uhm?=
 =?us-ascii?Q?Y3YRrOjSkPZmjmxpzWqV+6UY/w5OXscEminJ54wPSe0ojhQ2QiXw+wUQ3jDV?=
 =?us-ascii?Q?fTOJnn4loQQ8Ef55tQgAD8CIuRA8uYERbkCjWuxFhFpPIkvJ9hAIeRjuiHUL?=
 =?us-ascii?Q?83fERM2aqGgLPg9eEAafItZ7oGvoe5yorOKGRehKFpAxBj62zcM6ekOpX+Xi?=
 =?us-ascii?Q?UWlUId5vMuZD8I8cq8iW4H9TPAn77CXKGXO/0/MD0n8XaoWrjpZbCCM8/dgJ?=
 =?us-ascii?Q?yJ+Qa0LaBHkixgF61adCJAlN5ca3HBcDTlMB10KNFD2PbKfsZsG9mOimuhSq?=
 =?us-ascii?Q?4lvzlFQf8kAYhvoFRUJeW8T0R8JsV1iEI4IbktnScIQvX3RmgHutdbdS4gNR?=
 =?us-ascii?Q?kxFffoT/272p/uvbX9MoLG6igmJqMNW8NZOR9BXGP51f3scnIhyeqrNk+61K?=
 =?us-ascii?Q?r8N/bTFcsa9rOcm37MEbCCmkbR5bkUlXUE+jRpMUuGsPbB4XxkG0rTzbSx39?=
 =?us-ascii?Q?3Z/Y5iOndgccOu2Muv7roGEay4cSH3LREEMKUwglVwr4RVj6hEyg/1CEz/0N?=
 =?us-ascii?Q?byKM4vsqToR2iMYnSn/ENcSVV82BQ9B7pGZcu6glkdPXsdNcmE61TFKinVJM?=
 =?us-ascii?Q?fEEA/XJ7kZGOkH/fb3cgsGSc8FjIgzZE1eQJiIL1XrNRIj1q0NI0c0h4fj5d?=
 =?us-ascii?Q?T1kqttAeP4Lv+e3JDpkUq1iIo25OfvQGHlVd692E2D4oYaR9FSG4nC8mXTU4?=
 =?us-ascii?Q?QtF5C5N11YZzjfsIG94Fc+ibPsEZUzqssZv7edU511KQUwGY0TXkpq5dugjb?=
 =?us-ascii?Q?vhOFPiVfVEWqJBXvKKWJeMHNRz1e6UZnqJfBx1QTofWfAkQ6s/QsxIEFWU+m?=
 =?us-ascii?Q?Sde8pB2mUi3XPKXv+NdrR92mRfuw/cjXNJ0tL96jn6KONmi+8w524h0mQ28U?=
 =?us-ascii?Q?nAkm3Yc1tsNX/zEfDEUUUU3kcs7DkuivtU4Nkb3tsy/P0nQ+xuN84CXWRhtf?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da95945-f4a5-4d21-8a78-08dd77cc356a
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:31.2792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfBR34PwiUkdLVMz19yRHsG1z8cMvAnyER87X/K+08s/80+GTJOCsHKbs4gTgQjDoErWha/qG02Uc3e5712FLx45b3FilVTKt5rVJBWz8Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2928

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
 .../platform/chips-media/wave5/wave5-helper.c | 10 ++-
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 ++
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 ++
 .../platform/chips-media/wave5/wave5-vpu.c    | 68 ++++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 5 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 2c9d8cbca6e4..5d9969bb7ada 100644
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
@@ -61,8 +61,16 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
 	int ret = 0;
+	unsigned long flags;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
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
index fd71f0c43ac3..32de43de1870 100644
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
index 1e5fc5f8b856..52a1a00fd9bb 100644
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
index e1715d3f43b0..c53ac9a5c1c2 100644
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
 
@@ -265,6 +308,9 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
+	sema_init(&dev->irq_sem, 1);
+	INIT_LIST_HEAD(&dev->instances);
+	dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
@@ -288,7 +334,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -351,6 +396,12 @@ static void wave5_vpu_remove(struct platform_device *pdev)
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
@@ -361,6 +412,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..f3c1ad6fb3be 100644
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
+	struct semaphore irq_sem;
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


