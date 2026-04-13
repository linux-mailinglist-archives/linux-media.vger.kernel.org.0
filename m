Return-Path: <linux-media+bounces-58681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKGEN5AV3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:10:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6243EE650
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8362E3047FD8
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC4529993D;
	Mon, 13 Apr 2026 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KHD4Y6x4"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F29E291864;
	Mon, 13 Apr 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096309; cv=fail; b=Uxd61sjUH7EjEqU6dGlqpyIVQO9PQB5/HaqFga6oKu1+Ez2iCXN7YJgbmyEq1OgPNXdqhhSP8FrUFmy/D8IoYN/epoDY+ZEPD63RrqZBBK6nzVY7rw9Up0hrOi/o3E4ksYoC41fdTQgdWBVr9HxVNHXN7Mev1c3p/u8EJexDrp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096309; c=relaxed/simple;
	bh=BWGZs31hTAN7OUpnsh+qTp4jmGFneBMf7YTM74ASUBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sddY/gMqRT1HpIg/wuy5CMWNiXt9z2NvZ3cU21sp+Cr8LL17VgIrkuoTXNBIuCeM3+nTbpGfwlsLFbJI+c57/L8UayVoBju2tQRUMvK+nXtYamf3J6ns159AyhhstFloFCL3K2V3iO1F+SIFLlhcQs1wCCvi14BEAlh5cUXBO+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KHD4Y6x4; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEivLp4Ql+iVtd/P8NTueaAr20t9/MvbdaTyGUdH64zvzuXVw+tLbVAB5kXjImXjqWN3153JytR6P1G+MG6yxQkU8IauYg+wovgv9s00NXWBbrmUu8Nx3hT7TcxvZJ0qbl+NylWQiT9xkW4mHGcJe4kERBXX1b9bVtTprI6Y2HQ0w5xX4KjdDG/d9Z/DlQ1y8J+KHJbEa42baYsiJ2wFgu1QgqFCKep6QFc3x8FAcSvDh7ugIW0l6aeOYC/rS9Y/yiMxw3JfIr+IzdrOnOgEIO9tJXRfGqLbZd95Z1+UEehc6PDBZwK/KKBKCSvYsd1NEVvmzAw6iI/Si+v5HIFl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM6P3vR9JgyS67+s3cH4OZgH27cWWMsVA0b8agaRKO8=;
 b=jEWO7b4ee6b0GgDD4fBa6o7EkxGfiKIp5hBW8eda9Vv8B0QML3EQ6HwLezN0uhyl4IUsmnGbBjJJr5zH7+z4t6CtgLZRJZqljmRQlzg8cz+bODR/29ka/jZ2O/DVTWBHVdpyOGGw45LgHvwbAMc5lSbshB6CciQG9AJbaNS3hFdgEbaM7g+td0zsWAGoy5EQstRpmOXr8Qc+6KwdsbbMSBfxSLjWXtsZBPtaIDWrlWRcbJZtMhoNqqBUqSiyFORZISWqERNQf39lmBLiguNrWZSePsoA17XWYbP1Uz3tbYiNNUR53RsbsGWapn0ErtF33igCAyt+BrEkhJZAl0TcTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM6P3vR9JgyS67+s3cH4OZgH27cWWMsVA0b8agaRKO8=;
 b=KHD4Y6x4iVNJsTo+CXoBmFFRolpTqx/g8PP66r2HvCbjR4GKM6Wt1KovIns/M/V0dILakbjbNVrZwEsKg12W5HwZCVlyJUzqL3MPBOHinxwowIFAHi02aHooFr/b98uNCkQp8C05TXPszX8aJZy6Slar2fH8YtobrZBDE15w9uNh+NKOmNHapD4K5A9ZozVLGaqwTYYPs73vLBgJKLBdE9YAZ2vbi6VylnR+A8l2DE71cxUKp/f2IhdDqCUYtD143BDu3ShLd2SM/6HYxdV6RMq0jF8u/vK/qQln1Jo8O2FV8W9KAnm/0jjyvdTf9Rg2QWfrsrKYRUg2VcXb7AFlBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:43 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:43 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 10/11] media: platform: neoisp: Add debugfs support
Date: Mon, 13 Apr 2026 18:03:30 +0200
Message-ID: <20260413160331.2611829-11-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d363bb-879b-400a-8eaf-08de99765ff1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003|18092099006|10086099003;
X-Microsoft-Antispam-Message-Info:
 rkWOaXnKYEPU1aA38IlV/ABoWrDsaeiroqNB567ZtQDnc33Zk5Mm2sksmCuuAzT3t2r6ArQoUnSPKxPkMt0ExTUEinY+wtkgxc8FU4nV/OjzonRqG8fb6Q4k60Q9RTchoUt9/MgnYAKs9qCiJBDJ22T3f+fpxIFBeJ3D0iEpIBl1fxKVdcHZ3AsRxO1g+rvIkNr+hWPbGZFZrBkX3kQbT7WkY5x7j93gaPdgDx599UgkRE6r36GgDvpxKvuyHqK8qcep6QfnLGsep9kjAF/QNK7aBFALOSivbnOi35WOjh0i1M66LpZG+u5GhESth5Oc4XktUSPnb9UNN7kEfyK43S9NwdE3dgvQB3yi/PV4zz9x6NPcS1WMlGGEQWbCkZr2UdHOt8HGcr4e5+vdNXtYxt+2/BhaBQNUSdG5c6ZOTWotQxly2N31Vi3QyYGQ1k3BZKcqPm3M9S4jI2cBBn2dPyFGDfXNIGiHJSC4ajTl1rcc+m9HvVJny7iFEYJ2D9iN0uzEvIVDYUuVpfhlCpdWbtPTYd1ki8QmpBj8WdL5SXrLMWnB/Rj61V7ON20ReX0EW9opf+FldFOx6jyOkebwyViFh9cR+6C/k2fxmEh/hK4bfhWWcWCaasrLLXRfCrJ40G8gIKVootwVHvLJUIpfGnZpnwh3XhZVxvXOlIjhIPlV6qLdWdL/zhN68cEcEAi+Bbpw2sweg1WsqvRxt6HgIHjHxlEH+9uhqAWHJ1TpsX0FrkERiZrZbJO1R4mM2SsuX6dVBFAII57Nl0BdSYh7R9bDSShxXfeEHgxS7uF914+5dpDVxcNQLCSrYTV4mkUh
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003)(18092099006)(10086099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?lVc8yCdjMj0gVpU7eu8mVkVsG7pTY07kuZ5XPaAfDjfG5JHeoWpD+rDpVNu9?=
 =?us-ascii?Q?R9ylooQMdrM4M4uwfMUMdUENE1swbRzE2oF+zfzpBSjZ+KvPK8uvqBrMIaIb?=
 =?us-ascii?Q?j82b06BrHd4+JUQCKBWHnWLG1MeBjLs+m6J9PH1x3TSxS45XU3aCVjWCJNCe?=
 =?us-ascii?Q?Tz9R+xjDCN7x2E++PrRmgXezwnoNeZj/aCLeclq3DyO17AlFctCWCHfoDhmb?=
 =?us-ascii?Q?FMb53jkTYPCvXuMhVwUAYMGp8V2SCvdhzQZA8czJIpJQidZ5XzofouL0SA1g?=
 =?us-ascii?Q?Z794MjT6wjvEQr1m3D+Y/+DjrDMxkZxi1Hpqknrd9sOJCYo5AQ7aBErRE9oc?=
 =?us-ascii?Q?bWGouhzN+cCk1L238/rPgUX1pSKsOU/dJ0HLEgDaapZEuVs21BouTVW8hA04?=
 =?us-ascii?Q?D+QBVA0uUR/F3TbdjR61w3aC1zifj1IV3/28Lf4dCMUDdPwz6oi7zKIC19Wm?=
 =?us-ascii?Q?mC7WeMxUlIvH3JZuXoMcsVCOLyQKpgbcowhaF+TSoLF/2BMbECSqDQKEPOxO?=
 =?us-ascii?Q?aZOHogJEv+vjPTQOIEIh4mDNVAINvZt7+toKBkaRybOKsgKDNccvcTDXn48n?=
 =?us-ascii?Q?CymHQqdrn2so+isJlph3zFgSiGHms6IzLWdCn8qT82HfA8hc5dl7pJTM73NR?=
 =?us-ascii?Q?LOm5a+ZyMqogF8hZMkTfuYr3bQVMbgiv7ov1ncLyp3VBcdtrdAcCvwmQW5fM?=
 =?us-ascii?Q?OPkoeOgd0rdxNBHEc4BTwxRc/nxMDQTmn/yP/E/0pa40kyVrAghexVa57eBd?=
 =?us-ascii?Q?4Yxr2EIYA3IHT/YZPeMPDpHxVrXqWGWl9e9FQFsqASGTulFBY9mh/GM/kyui?=
 =?us-ascii?Q?gK3EUXg/4oyc3EyNlNQyVWOkAlmKTLicN/2aPfWfCbtljb4hsNcYXbu6Rqxk?=
 =?us-ascii?Q?z7hSvla3Ivj4evERybMDW/v8b74FjkF5s1JFi4YWTebTIIRKhSvRbGLy/CKg?=
 =?us-ascii?Q?FD+qI4KwBSCS3wU0vhZbx81iVs2aAuy6ZT7wcKVz26RnWlKRvtiSkUnG/CVe?=
 =?us-ascii?Q?EtkoueaCt4dkvF+eZMRXPwZBcErUW5FEwZ59eT3ZSBNWUxJGlrUKr04TxuDD?=
 =?us-ascii?Q?CbZrYfF3poZ7ALHTVJjHkuEYyrqa2ecmtbi7e85KdblwyU8SpySDl6424R4C?=
 =?us-ascii?Q?4YIH9Rufvjx1o6xonBoquIdsRFoIIQ1Ajgw0guyRrIQ87xAYN4hFzfYlZQ15?=
 =?us-ascii?Q?bl7RxJHYtZ59WkBi6MOC7HOMPNd1U6bih30aIjTRy/RhtHL9PCPv/27LbcCh?=
 =?us-ascii?Q?+L87s+f7mf+NX1XUiRJenSgtrEasptdBQ2YS4fQlCIllAj0AV56TNOec9xs9?=
 =?us-ascii?Q?8ga/VODGYA5xcixfM4vjRWBXg0bkWan+B3bn5SwnitRuspJin7a8S3zd4foj?=
 =?us-ascii?Q?35VRba5wa2uSZLEs83cYl1RwAYMiUqL3HOcAHern3YWNNKcIbhOX1LrAYcW2?=
 =?us-ascii?Q?ap81ZwjPxjgnw0wwZensThAc3GibE03rzRE0mwD7v6cm4XVrLHqy9W+5Q1HA?=
 =?us-ascii?Q?RLc3nw0sGBWKKfr0MxqG4mPsbWXsfuOib1dTSyiCusFb4vjGfn3joDdEl/ws?=
 =?us-ascii?Q?GCvhrudMmV71x2rjxvcnaEc0mC0TSUnA3b4SP2q9OkX7huqCY23F4pZEFevW?=
 =?us-ascii?Q?byBB0VOSG3rJFy/WAnODnHtTVc9R3lJKyfMNqd9w0mP1Hj2nMOxBnuMSJV1G?=
 =?us-ascii?Q?SyTd4H4LFiUJNq9l2quYyCOCIuPqKcsSgtmt4G+yrpAYRsGo1UtyAz19lNCn?=
 =?us-ascii?Q?rrbXv4TzQA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d363bb-879b-400a-8eaf-08de99765ff1
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:42.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I09uDv+qv8BboTg8J6/t7vbx8IyQ55CDeGi5f1eqOljmpTYp+CJSmPeOfpx2P5A+IYf+Lgwjp+sSq0X+a1ZHXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58681-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB6243EE650
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add debugfs entries to dump ISP registers, and some internal memory
regions used to store Vignetting, DRC global and DRC local coefficients.

Debug mode is activated with the `enable_debugfs` module's parameter, to
avoid runtime suspend which blocks register access when IP is not active,
so we can capture an ISP snapshot after a frame is decoded.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/platform/nxp/neoisp/Makefile    |   2 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  16 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      | 494 ++++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_main.c   |  15 +
 4 files changed, 527 insertions(+)
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c

diff --git a/drivers/media/platform/nxp/neoisp/Makefile b/drivers/media/platform/nxp/neoisp/Makefile
index 7652df785e98..c68e216980dc 100644
--- a/drivers/media/platform/nxp/neoisp/Makefile
+++ b/drivers/media/platform/nxp/neoisp/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_VIDEO_NXP_NEOISP) += neoisp.o
 
 neoisp-objs := neoisp_ctx.o \
 	neoisp_main.o
+
+neoisp-$(CONFIG_DEBUG_FS) += neoisp_debugfs.o
diff --git a/drivers/media/platform/nxp/neoisp/neoisp.h b/drivers/media/platform/nxp/neoisp/neoisp.h
index eff86c3a08e1..fe4ca935d6bc 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp.h
+++ b/drivers/media/platform/nxp/neoisp/neoisp.h
@@ -9,6 +9,7 @@
 #define __NXP_NEOISP_H
 
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/media/nxp/nxp_neoisp.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -225,8 +226,23 @@ struct neoisp_dev_s {
 	dma_addr_t dummy_dma;
 	u32 dummy_size;
 	struct neoisp_context_s *context;
+	struct dentry *debugfs_entry;
+	struct debugfs_regset32 *regset;
 };
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd);
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd);
+#else
+static inline void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+}
+
+static inline void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+}
+#endif
+
 static inline int neoisp_node_link_is_enabled(struct neoisp_node_s *node)
 {
 	return (node->intf_link->flags & MEDIA_LNK_FL_ENABLED);
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
new file mode 100644
index 000000000000..656475c8b9d1
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NEOISP debugfs definition
+ *
+ * Copyright 2024-2026 NXP
+ */
+
+#include <linux/debugfs.h>
+
+#include "neoisp.h"
+#include "neoisp_ctx.h"
+#include "neoisp_regs.h"
+
+#define NEOISP_DFS_REG(reg) {.name = #reg, .offset = reg}
+
+static const struct debugfs_reg32 neoisp_dfs_regs[] = {
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SOFT_RESET),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_BUS_TXPARAM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_XFR_DIS),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_FRAME_NUM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CMD),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_TRIG_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_EN0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_STAT0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_STAT),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SKIP_CTRL0),
+	NEOISP_DFS_REG(NEO_HC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LINE_NUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_REDGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_BLUEGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_HOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_VOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_R_GR_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_B_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CNT_WHITE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_BLK_SIZE0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_CURR_BLK_Y0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_GB_CNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GRGB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGE_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGES_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_LINE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_ROW_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_FRACY_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG1_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_IMA),
+	NEOISP_DFS_REG(NEO_IDBG1_IMD),
+	NEOISP_DFS_REG(NEO_IDBG1_DONE_STAT),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT5_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GBL_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ALPHA_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI0_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI1_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_STAT_BLK_Y_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_CURR_YFRACT_CAM0),
+	NEOISP_DFS_REG(NEO_NR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_NR_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DF_TH_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_DF_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CORING_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CLIP_CAM0),
+	NEOISP_DFS_REG(NEO_EE_MASKGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_EE_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_CCONVMED_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_CORR_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH12_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_PACK_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL01_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_MAT_CONFG_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG2_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_IMA),
+	NEOISP_DFS_REG(NEO_IDBG2_IMD),
+	NEOISP_DFS_REG(NEO_IDBG2_DONE_STAT),
+};
+
+/* Structure to store word when reading memory */
+union udata_t {
+	u8 byte[4];
+	u16 half[2];
+	u32 word;
+};
+
+static inline int neoisp_dump_memory(struct seq_file *m, enum isp_block_map_e map, int wsize)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+	union udata_t data;
+	u32 addr;
+	u32 *src = (u32 *)(uintptr_t)neoispd->mmio_tcm;
+	u32 offset = ISP_GET_OFF(map) / sizeof(u32);
+	u32 size = ISP_GET_SZ(map) / sizeof(u32);
+	int i, j;
+
+	for (i = 0; i < size; i++) {
+		addr = (offset + i) * sizeof(u32);
+		data.word = src[offset + i];
+
+		if (wsize == sizeof(u8)) {
+			for (j = 0; j < ARRAY_SIZE(data.byte); j++)
+				seq_printf(m, "%#x: %#x\n",
+					   addr + (j * wsize), data.byte[j]);
+		}
+
+		if (wsize == sizeof(u16)) {
+			for (j = 0; j < ARRAY_SIZE(data.half); j++)
+				seq_printf(m, "%#x: %#x\n",
+					   addr + (j * wsize), data.half[j]);
+		}
+	}
+
+	return 0;
+}
+
+static int neoisp_dump_vignetting_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_VIGNETTING_TABLE_MAP, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_vignetting);
+
+static int neoisp_dump_drc_global_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_DRC_GLOBAL_TONEMAP_MAP, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_global);
+
+static int neoisp_dump_drc_local_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_DRC_LOCAL_TONEMAP_MAP, sizeof(u8));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_local);
+
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+	neoispd->regset = devm_kzalloc(neoispd->dev, sizeof(*neoispd->regset), GFP_KERNEL);
+	if (!neoispd->regset)
+		return;
+
+	neoispd->regset->regs = neoisp_dfs_regs;
+	neoispd->regset->nregs = ARRAY_SIZE(neoisp_dfs_regs);
+	neoispd->regset->base = neoispd->mmio;
+
+	neoispd->debugfs_entry = debugfs_create_dir(dev_name(neoispd->dev), NULL);
+
+	debugfs_create_regset32("registers", 0400, neoispd->debugfs_entry, neoispd->regset);
+
+	debugfs_create_file("vignetting", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_vignetting_fops);
+	debugfs_create_file("drc_global", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_global_fops);
+	debugfs_create_file("drc_local", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_local_fops);
+}
+
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+	debugfs_remove_recursive(neoispd->debugfs_entry);
+}
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/media/platform/nxp/neoisp/neoisp_main.c
index 9d92b52e5911..a54269082bf4 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp_main.c
+++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -41,6 +42,10 @@ static int standalone_mdev;
 module_param_named(standalone_mdev, standalone_mdev, uint, 0644);
 MODULE_PARM_DESC(standalone_mdev, " Create standalone neoisp media device, default is 0 (off)");
 
+static int enable_debugfs;
+module_param_named(enable_debugfs, enable_debugfs, uint, 0644);
+MODULE_PARM_DESC(enable_debugfs, " Turn on/off debugfs, default is 0 (off)");
+
 static inline bool node_desc_is_output(const struct neoisp_node_desc_s *desc)
 {
 	return desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
@@ -1744,9 +1749,16 @@ static int neoisp_probe(struct platform_device *pdev)
 	neoisp_init_hw(neoispd);
 	neoisp_set_default_context(neoispd);
 
+	if (enable_debugfs) {
+		neoisp_debugfs_init(neoispd);
+		/* Increase pm_runtime counter to prevent suspend */
+		pm_runtime_resume_and_get(dev);
+	}
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
+	dev_dbg(dev, "probe: done (%d) debugfs (%x)\n", ret, enable_debugfs);
 	return 0;
 
 err_pm:
@@ -1761,6 +1773,9 @@ static void neoisp_remove(struct platform_device *pdev)
 {
 	struct neoisp_dev_s *neoispd = platform_get_drvdata(pdev);
 
+	if (enable_debugfs)
+		neoisp_debugfs_exit(neoispd);
+
 	neoisp_destroy_devices(neoispd);
 
 	if (standalone_mdev)
-- 
2.51.0


