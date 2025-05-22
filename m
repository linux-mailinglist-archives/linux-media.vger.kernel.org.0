Return-Path: <linux-media+bounces-33079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9CAC05AA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66B4C189C4A6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719BC223DF1;
	Thu, 22 May 2025 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="lPbQjs5t"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022136.outbound.protection.outlook.com [40.107.43.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDAC222580;
	Thu, 22 May 2025 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898786; cv=fail; b=Ygeob/MTy/FObn6h00zo8yKpvWkTKCiznT/05TLWRU42TERH5TlY2e00EB2c4nhBDTVHsylvct+HhjVDL/zDW9iVCRBemc7JoVxS3ePE4Hy8J+XlQoFlLAZzYwH8x4QnBPxBQTEks36t0R+7Iw0BBDWkzKBRF/3uNig0a5n8zbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898786; c=relaxed/simple;
	bh=+Ix7EvhTmY3l8L5NG7HsX6FdTSFpfjGfxHhmtae2vXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PXoL55DLkKwxxFhKG6JA4MbV20LeyOuJnQLh7hrnEkSOAZCCPe8U9RcMVEFX+lYlzQisj6lTgBdeJaiBzWXEEVqcqx/CSe4Eo5A5xK7lF68IpNFwQGIZe8nxNGsk23bqjfKSVVXEVWxHMqnNnFSv6DmuxKVlq+by54FcCFkZkco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=lPbQjs5t; arc=fail smtp.client-ip=40.107.43.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jokrtI5U9MvaYvpGnNqSuvAHBf/32nOeqkmvffKWaH/8wZbrHFkMDsi9ZMon0MCFkpgbo7FIXTtZgGHXmPGSVldNEJGJ3dsJpvL+3abuG2e266bbnLu2LjGcTIF089ovaU8qTPGgd95kcZe5KWPEzEqvrL6tyIsjU+8Uy46PwLPcmpkkCvP/TpJGN3DDEAevFDLk1sp2N0zWFOb5bboNMzvt8R5guKZd7pDFDBau4uGSkgO57zRQb13oXvQg77NdVjDaB3Q0AN0eKueMfnfpsRE6uWE3XCx64BLMdxwPxgn6TnbQybRwfZpB9cwHZIpFbaF61I4EC9cIF2KS7gXhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je68ULeDxVx5AGcE88T83kqMHhC6Oa+gc7PFyc7jR1A=;
 b=bWguU8imtl+qempBW5+9BTcbtbJphUzbuhCgv0flgmJo/vIGq49KXbT+WyoFwB0CcWFvo4LQFPSpnppOjQD/0GWJK2+jP1uGHiu6GcE6z3zkLPADM4l9lAw0dvGkgnTz8YovZf+B9JgV2n1stsZqC4L9jH6AE2finr2mwv7H7HsA7tF3ew3tNeGsFfrW4x0BOJNacO923bgoI+9NDUgSdd3BQkP5Rtpp0ei0TWFSGEaVjuo3c2zx4/xkAe82xUSiWKnEWjT7ena3wCZoS1HBVGKYLrzwNOA39fq82s8k5Igq/8UztVNL3ukpSiukBglFml4/5VkpXI6DL5DXkMFSoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je68ULeDxVx5AGcE88T83kqMHhC6Oa+gc7PFyc7jR1A=;
 b=lPbQjs5ttZh0gWppqJaYazdbfk0vzBYr11uOvRjpLk2RQESq8e/s0kGhFW3qr2mMV5XQv6wLUdx0WnkNk86MAqEKEG6aB9ssLfswEVgSd+6OhDf3goeugszNgVgN2T20UqX2E/mSeqXI5avCCoKujF6tZW0/L74hJasscS0uWlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:16 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:16 +0000
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
Subject: [PATCH v2 1/7] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Thu, 22 May 2025 16:26:00 +0900
Message-Id: <20250522072606.51-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PUYP216MB2872:EE_
X-MS-Office365-Filtering-Correlation-Id: e67f1cd8-e8d0-485a-9794-08dd9901f012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KR0Y/808mldD948INE84A6ekFOXqO3+LdSYrRt4hovAoT1zFzoWiZnwqAbH6?=
 =?us-ascii?Q?weOJJureyj0cWGYAH8K/qX7halo/Vl+zL+Hk/gl5m26gDje0mJTTwUzqS48Q?=
 =?us-ascii?Q?pQ+lbseET5Dq1qHcyrKCPbgvYsTjVKv0QXEb/TSN1mlh+H5R4I4FHN4GB1a1?=
 =?us-ascii?Q?i1O8V6bfe646LnZw1Up+uid29AglySFcCayADEZyfZyH7ugevbBuz2Wlhexw?=
 =?us-ascii?Q?A8CqJbhoUFGIs2mHLMJz0945ByIwH6sN+6vMUuRUwee3G8pKOMMsXjMtjsMy?=
 =?us-ascii?Q?Ji5DBkdaeKm+Ky6npmJvhmUxk6vb5/Ud9nMH7ckM3pD2hxlaaok+u85YtdKy?=
 =?us-ascii?Q?qh4Dn1pEUJPjdzh7CJwpMHiEUYlmbRVHiwdoRZHih5+eYp19UqSDobGIhbpQ?=
 =?us-ascii?Q?3H/4/wHgjIl3iu4+KXYptIvm/riFRfiNAxO1mh0SzUVpSHlDozsDbF8wB9+K?=
 =?us-ascii?Q?8PCqwdEEtAXjaL/ebmD3Nh/NpMjKQ80juosZDrPsHqwaRmgvTPbWhh6DuSvF?=
 =?us-ascii?Q?L8+mPk0z5+xUQJUIb6fI6T6kNmKc8p8BGCbaJfDxR1MoSSu+Zity1Rnl0NDK?=
 =?us-ascii?Q?MXrF5y3/Y3JXh9+kICiu6gLumf5tlUWAeGD9ejDdeOKB4dGOcMT+BnF3sUSa?=
 =?us-ascii?Q?wtBpOfar0czcr9fma+9T71u/DaKbxRaPmRJxzHmsZqRakelFO7S5wYujn5Ig?=
 =?us-ascii?Q?BrHD9zs4Aw+FjYfoIQ1foXSOoI77fXv4zvLvl+OtzPUDUaFZXolbtLC8trLW?=
 =?us-ascii?Q?krWx9+VpDP/jzFV3DNgAjtxUpY09xxFuQ7FaIj4L01XqiF2HK8i4xh/LAopM?=
 =?us-ascii?Q?RDfjlWHVkjd6eUKVBeBESYp0zMbL+mE13Xc7eepuvnDVXvZW4uvJJ9H6z/Hn?=
 =?us-ascii?Q?ZhcCghRNOxlsnPmswIIDgxpAp1tO++gX2xbwvROg8MRPqFSmrzCGNGEqFiHR?=
 =?us-ascii?Q?/zRMz3pEWmSQZKNxwZZ0/7ge7h4m2+KQ9JwW4rr1urBUqB2k4PRVzawL2Rky?=
 =?us-ascii?Q?mLwP2gFPWlDdTfZimbGXa9qO/An4jr5KUEudgYo3dhw1zBEAlbBsHNV6ASAL?=
 =?us-ascii?Q?IzqbjZsBPD75SzRMqqDU3rBQfpHilP+KUs6anGnkrnIfLzq8233HhiILBa8C?=
 =?us-ascii?Q?JZEgBOiWcsMcC+WTl6Cdh5hzxK+wRn7/qn25lnUSrbswtez435F24HnT7Fbd?=
 =?us-ascii?Q?F9qYdRvYytCWoIt7pL+7uYdq0nlskmRtjigce2GDDYFfrgCYq6fa4o259EwW?=
 =?us-ascii?Q?U2E/JBBx4oRdbvpw/2ODNpK9GcCAKJY8s8sAbNV/1IEhXXtKx0bOeWS7BPzZ?=
 =?us-ascii?Q?oQXz43DEk4vowjr6beZZJ4wB4kcVfvt6K66zs0yVKiJ/4ImGFZyYUOdzjTki?=
 =?us-ascii?Q?GLiA5wMn0uauyUBsFLLDSkIDTt2kcgh9nXQ8V8PEtRHsdQZdS0A3YbG8fgdd?=
 =?us-ascii?Q?owNA8ubHqYHY68qiETN9Wg85mY4RAeqqAqTFUH19moyuICJnOeVDug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?56cTQxKpTXXEsFL9rT2+/EoZDzzszGsZxu2lfXyNrF9vVSaofhhu7rCqqxP5?=
 =?us-ascii?Q?oo9NmrdjQjS0+Bwfh8bBJp4YH42ft/3/zQ+OErTotPMI1QXeADSleujnQuaZ?=
 =?us-ascii?Q?1rc/PknLcGwhq0vhzsbZf4AsBEzmIy8FTPRkI1NGzavn3UVHEaAG7U5npmjA?=
 =?us-ascii?Q?1gKKTRsR63cohO90nshl3gSzGFF8rZIeM1Ft3RutHebLBq6OVAOKBeOQgpXU?=
 =?us-ascii?Q?xMUliYiXzvmbJXhYhKZJXVcHGeXVw6JWDa35GerPlfg752x2xUZwpFxRLqr/?=
 =?us-ascii?Q?RFGJ8ZBTs03MmVlOC6YOHiu3ZQMUMJckscqbdAN5itRxNHqNi4eSZ7zg1ACe?=
 =?us-ascii?Q?yHqGACWpy61Ek4i9JbuAc2Zp0c+sXDJJ6bUDi5yJ1Tfs6+d1btn+2MMDdH/0?=
 =?us-ascii?Q?ei9N+vVepzXRFEfSmYFbfSJfibnNgHQz5Ti6ssmG/AaBfn2B5cY8PBGUgDcp?=
 =?us-ascii?Q?fOq06yJOEvtqefqIUGVa7gQlAB/mdPgLS+6ajtzEYJTNSbTZtIi+9NKX/z/5?=
 =?us-ascii?Q?scnS17X7s7vf0j5RlIquny3k/6xp6NaeAIX54yNLOy5LTwM4+GZO6fXOvtxk?=
 =?us-ascii?Q?EXhCrXtSDsWgYQK8nNQmcwWd+dtiFulTj8m5PkisxNiZowWKNaAWXAMREvDz?=
 =?us-ascii?Q?HUK5I4Z+pnp0PnJ289dYEvqcKHDa7g7a4BymrsMTJ+RMMm6jFKHBkzrz/uao?=
 =?us-ascii?Q?8PlMnfIJprNnxyzeInz1iuYRZk2+8INCYH+HFGKokqlaPaJWrK3w4Rtsm3+s?=
 =?us-ascii?Q?ih+W/k+QHl29YRae7NSjvnkdpSYm7CtcsEZYF9tWS+TJOK0Eu0a9kurgTh8S?=
 =?us-ascii?Q?shYvrWCAZ0IMeCtL9BnVnFB2ZT+Ex31QQH40ao9j0HEgtv2D/4iAvGw1r1EI?=
 =?us-ascii?Q?+je4aBc7O12klm8B10FgLME2mzj70oDjjom9d0Ie5NrFAFUB//gU9qCd0wbx?=
 =?us-ascii?Q?yXpVQ5Ay8wugxOkAG1cqGnm2HUiSuS40PXz5E4KSQdNaZQ5UHN7zJi+XMWon?=
 =?us-ascii?Q?VFOK+I10esjj9+4n0Kib63kxH1g6gdi/oRIKXmBs/wj5ywA0/q6oDhz4cYIu?=
 =?us-ascii?Q?uvBOz5vyxkfgZRT76vdycZRGvQ+1zdbAfTayBrc/x2rSSC+sEbfX3NONZEai?=
 =?us-ascii?Q?jN9FOLEGwDpS/sQcJR2a0eNgSziYVpvRauNfOI+ZX1dROOqJYzlKTHxU549v?=
 =?us-ascii?Q?jY8HVhT9Hh+Uc6GxrY/x2w/kCojoPpmDfZUC/QMTrm11xbK0FUGlZlX6yjvf?=
 =?us-ascii?Q?+OcaaiOEKHg+d4U3XeZX1y+hdfO38QK+bYolAMSH/Ie0wCW6IK00C1fk24Ux?=
 =?us-ascii?Q?qTAEJOgbudWIdXIfq5LWEcYjCTEtjXQU7CfX8EJqQJ/Uhcm7A6/KcaS/W+9O?=
 =?us-ascii?Q?4JHkEvf2UTmvpCqcgI+D2maZ4DJ8EUWiYPQ2p6oZWEjw9YjF9l8/Il0zf8Qk?=
 =?us-ascii?Q?aUMFq9FwRBavIXuCpO5y5NSKCKfoCyOR0iVl3m1vyUYfCF+kB91kKOYkfp22?=
 =?us-ascii?Q?6FdwVGK174jvfpFr2QnIIuJ8qUKm9PWWyd4zy0yMeLymBOCPQ8vOY0r8q1vP?=
 =?us-ascii?Q?FZJwPZNPBQBVQW/V3utgf5Z4QbXAuPUpzkodHh/KoyRP5Q7y+c2XbaJSzNz1?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67f1cd8-e8d0-485a-9794-08dd9901f012
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:16.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg5EZoWES8MRzFfQ1PfHgI2bV2FLQTfJXN0wNfwG41bfiKiWa7Wja8ReI9Zng+JSmAKh+sbKobdUfkSzJfGBpeSZ1WpEKTn7BTGqXF7ysUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

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
 .../platform/chips-media/wave5/wave5-vpu.c    | 69 ++++++++++++++++---
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 5 files changed, 86 insertions(+), 9 deletions(-)

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
index e1715d3f43b0..a2c09523d76b 100644
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


