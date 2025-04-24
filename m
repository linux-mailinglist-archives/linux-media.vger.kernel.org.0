Return-Path: <linux-media+bounces-30932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B994A9AA96
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 843C07AE958
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC90222F74D;
	Thu, 24 Apr 2025 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E2DeYSzg"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2058.outbound.protection.outlook.com [40.107.241.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D4225775;
	Thu, 24 Apr 2025 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490874; cv=fail; b=GcqHvSlfLX7flk0GxtZh4w5eodKCZkAjhj9Chc6RAPc/SHMzHeVE3dYVUaDZhBqG70X3fPBl6FpIvqvhl6JBGn0XW3XxoLus/qKcEbuqu4we7va13dnzDRaT/nO1aw2mkThFaNYj7Qj1gwRgR3FinejeQel8oxhGbpxS6lLCqx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490874; c=relaxed/simple;
	bh=FhHWfszj+H3yzvqaa2G7NBJrd5ryW6NCxcLoOo0GArQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gMryboVZPYCMox5Hmbd+iFPCoh2Odg92skZnfk/u/p9MtyoDOZQs5ThmpEzNGVP06ENY/roO8MJh9miYCKHjbKRGqQm93ncG/yIrzTk+/GoQGKi4u+qREF3DvgyqxVOoPDcbQuEQ7y1UVb/8sBT9lA8/rPzd3L34HZax4b2XX+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E2DeYSzg; arc=fail smtp.client-ip=40.107.241.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXeVgKd5tn7dtuFi1fq7laxONfcHx1wZHpBZ1StPAazNfdAXl84vZEud2+7S7PGO7WyM4MWrb9/ir2DP61iryZKXCsdJ7Y0xTxd1RgyS8UiDJxvcP2ce4H0yRhBgzpjcfCIoMT7E6icGG6hREIitxEkSiZCEDSJNAF3zXVdKpzFEIjtpjfvayhGrIFftG6BJ3FArWF8tujEHFEOXizHxaHE3wenE1Ojkkl7V6zKKorbv0XillGU6dqibT0i2T0gZL90t6UNG7MDI4MaJShwq18ZuBY7W1kRHqdaX7hc9jUw+sF6AiQCUIBP6B2kChrNTTrOXeoZ02lqd1YJGHACEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+8RZessY00uHuMXnQRi5/HSBIDqXKuE/luIgB1jbjM=;
 b=RAaJwQgcNW90Eyl1Nzdp7CS8svferMR8t5ujQvcY2j6iAns3P2ygoelffqAAFzqwTw1x5stnhET6+3WZ+/VOPsijuVGF8Pvu48h3oEusEek4+14c2oXOfFsjxICR932xmfrYaqrNjko02rgJWNzfBSGJdZxrXZVIyvJrwnezGmG+ih5Ltf4HDG1H582LKE9bEq47vHobDGZVWhoS+gVLnkC/VF5PQJch6FbJUzzkfh8HqdYfCe777RfCJkdgjAGhdNOqhsdoD7GsRBqDSIcTHSAnrqAETTSmpEaR/VjdmjffY6XFjXsBXNO4hx26pO/B/NQ70VH0fGv+1lY188Flog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+8RZessY00uHuMXnQRi5/HSBIDqXKuE/luIgB1jbjM=;
 b=E2DeYSzgpdIndWwm7GAn4+dVhqHvW3qsYvKJ6sdom3Fl+ZdhGsjM5WxKy8pk1UOZ1j7BWHnAKapspbK1KgjfxihmO7THCi4OWG+bo/5oJSluQftGtC0iWAwuzQmCOhSYUfZOMAQ8Px/qI/oRIuBmBSfyKjL2HmqoBUANFry3fOnLEKOd16mGUE3rA1HA7Qf74ow9oQt1fruxuAF0sBVjdo55dsmQqb05U9Rt4SNpGqSwSLMwWLxeaTFAc7XsxV3PmzmzvxZCP95wu9I0DK+yZpcvd/kH7JINBHz138MO1R7rfeKcDXsNgYx6qkYH036I3AcWmf8rwBSWUI6+2sq+eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6879.eurprd04.prod.outlook.com (2603:10a6:803:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:34:24 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:34:24 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6] media: amphion: Support dmabuf and v4l2 buffer without binding
Date: Thu, 24 Apr 2025 18:33:24 +0800
Message-ID: <20250424103326.1728-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c94c0d5-db71-4197-54ee-08dd831b94c8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MSH87lWj6G4H4SH84Nt8x9zJxbGb4gVUujVi5ajYUQDqHb/HwaQGEOwgFvrW?=
 =?us-ascii?Q?bssA/2CAiMb9LrKOUIXQgbuOj5nik4M1fOW/ULh6vgfkPIkMdHTI+/fKa9p8?=
 =?us-ascii?Q?N18sPkvYKunckrxflenk2jGIKokgY3PCH0K04o//V9rwKBVB94JllcFnebLO?=
 =?us-ascii?Q?gUfP+gMOMBO58kSXFktKeDor+azXY8TYYW+fsROUBANQDeSgWVb+KTyKKPFZ?=
 =?us-ascii?Q?oupibGe+RfCDsruO2QDscvkzC+sufqWSss/jahL9NF+gx9atbxxnPCBwRUIW?=
 =?us-ascii?Q?23E8W28W0+J5GzEB0fqdHETQttkzQmEv1aCACucSXjX1PWNE+WZGCBgV2hLq?=
 =?us-ascii?Q?rT8t0CwePDlZxamIH7yS9wkix9iMukkIlkY2ifk1XgKutPnGXvJl2i4aTu0e?=
 =?us-ascii?Q?Fz+gdkPIvP6ZVfUhcCoekTWpac+Wl/5+a48/8iWSa4VFDhWUJh++qzlqP8Dq?=
 =?us-ascii?Q?homZqDSqM+xkWF344OKOtpS4MCqfdWbofVDBnG40oAzXGuu5hoYdbq5QECgl?=
 =?us-ascii?Q?U8/hR23CcqzEo+vfYnir757qtt52QyDtou+yl0Oe2Ig5JRd93Eb2A18IVlH3?=
 =?us-ascii?Q?ZGcyy8ESHUQ3uHOgB8KH3YJOyeV4Zmqs2bPFf1PbtuJ1czB66ttV39wFzDz+?=
 =?us-ascii?Q?nktE6g3W1gQaC8mWAL+luT5styUIusZFEZbAZ+mlkXTUxAhJftjZIe3N35dv?=
 =?us-ascii?Q?khL9so+ZT0n3SAxsDpwaxQUbhx2BM2td5BcBhSQtrcGc3i+pYWshC8uj+zvi?=
 =?us-ascii?Q?Z6slV8mIrK9JYJcRnpfczqkQxHBbY8raHHBx3Gv89TtrT8Q0ylAtS4nsupGa?=
 =?us-ascii?Q?L0tXnYgsJbALWVZzFrNiE0SPLzDoP80ABQRaT8FhkkTkApYCpxRTfHObn6AO?=
 =?us-ascii?Q?XXmj0RKawX6+uVpwcM5Yn7vpmAuA5sZcV7OMOY4jjF7Gp3YW8gb6WR8YbDUa?=
 =?us-ascii?Q?V2tFVRWfhYku7I/q2TEkztE8O+GzO/KL2pEfLtFH1DjxD8LPTs0+H9ZEf0nP?=
 =?us-ascii?Q?ZxAc+vRRPUU/Urt9TWJw8vfxWjlAoHPSCyj6oiVCEprJfo4pKuEORbz91Vcj?=
 =?us-ascii?Q?bXg0bVcEQI87kzQR1QkhKHgKbkiRCeS+LXB1SswnlDVpHF6HA8kTZaFQr844?=
 =?us-ascii?Q?jTtj6bs3/bBA5Uzwh9PpUSt0k6dPW0ItE5P5RNCkV4DM41/FuMK3Q4JwYWGT?=
 =?us-ascii?Q?lqXw0PIC3B0mjTVCtgPW+/mnrkVL5PwVJFCxbU1OnHBfRfW/RKY8WI0V+43Q?=
 =?us-ascii?Q?kig0Rz6bo2Z2/mHTkKKlDLggVoRV5pEnruSddaqLqmG07puHQ0ZiGmgDBZLQ?=
 =?us-ascii?Q?mbTZ24m5YJ+eV3EHB8XjfdYcZHWH656npy0/VEseEqc7Ngv/KHV9pW9FGcc3?=
 =?us-ascii?Q?dwF6B4+useg5xm4ohEEwjYgEztVkYPBh/CXnbC0Viw9sq7gHCoYzdeZaSQu8?=
 =?us-ascii?Q?oGpEwgPbWxxZpVRLa/1G03Bk7PvIn64uWXaBx7bP8OsELqlL7ycMoQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W1BK9hPmvQi3YHq4R0kXgMDkCxflr0stQ6zTicO7L0znAq6j10x+cVjG3DoB?=
 =?us-ascii?Q?D7/XqA3B8k8rGjPxsyq2sWgMtanBqQw7DSPEzWOzw9joN8PhkGowDWePr9ev?=
 =?us-ascii?Q?jIcGlJOZL9kJIhj/1pjJIeAbvL1c5Coo854ppZqsZbsQd87U+fqXCjXP/RcH?=
 =?us-ascii?Q?mxMJp38M6K6zRxOW+cwRUlNH7k7JXaMfkkjYA5jZ5/ah7pb1FwKJrPL0Z2Dj?=
 =?us-ascii?Q?xwYfOctTrr596jxH8v8LsOHTGJ6TE7HBC9fy5Uu1H61cdYSR8lVLN++ArQ0F?=
 =?us-ascii?Q?t5/jXXXEsJBLbzJls7cLjCMxcRRvXhAF0o8+pc25pGtZBCFDmC0/ZZpBPNpz?=
 =?us-ascii?Q?cDUFZTLuroCYDEBrs8K+9UBdzooVZtee/LSDjlwkMQw80GMkKirStovV9f9D?=
 =?us-ascii?Q?thRusFPFvvNNXPTa+TY8UbKzY8ew1uP+GuJV9b0gDBnuB2StYk8oInA5Sle7?=
 =?us-ascii?Q?KMF0Qk1guM0SSPjsoL1DFFdQQDEQxouszsk/RAuqylbQqlwMuVWABCNO6D0V?=
 =?us-ascii?Q?jUCQ/9N5ORthiNvszzvOWWihVvE3RxGFDZqieffGfeoXqutkP0rS1aAByBK+?=
 =?us-ascii?Q?yOIiuoek4waAf3gljhuYiZq/2rHgMk5010oQfwXImDeVwrBbV6OKidNMHaWn?=
 =?us-ascii?Q?JrMmjpHjjV+QymRG7I/Rj8SKNZi7zbVjbC5PGhdgWl5Iak7S20cgQSTWprNe?=
 =?us-ascii?Q?HluK2a8ucltEVfLo90QmAOnP7w4GQq9UL3dUJgO+9CkydNHxB84BhYv9JtLz?=
 =?us-ascii?Q?WnxcU72JXlFD6sc6wcHrZ/r+AhhPLxSjsEO+ZF7o/uZX4JXTlOBVPHnT0jeH?=
 =?us-ascii?Q?kkYnt3vuN1c+EyPQtY/uqflqQ2DdxIpqfNXOztMnI5wBsNKYTIXeUY5tQdC5?=
 =?us-ascii?Q?BfkrGpfjUSrwy2+yyTrWkE+KeQhElmVU1EDu2Uf+VuRcEeLoLoQNYQnlpG4v?=
 =?us-ascii?Q?G1Tovx6tWOlLbA7sU7avVh8OVlmPN3niZAyDp8zGX8mnyMRzBomHDCT5Wo9F?=
 =?us-ascii?Q?0GT9ZgUd+7C5HWjAtko62KvXeC0JlMaf/4Oece6/mGGa+er0GQT2mVm/KDoI?=
 =?us-ascii?Q?o2KEKIhoJPs1fg8C+O4fWdMT29yI2Eu82cEaLlJm8H04yA3sqi0GFDIFjhOL?=
 =?us-ascii?Q?P7BQBu03y9eQtlejx1qUyAiNCwX4irK1wUF5YkAO+f83gKfoSsBc5mJxO9Cv?=
 =?us-ascii?Q?dnD2EyW4911ZfVFbfISRlGT0PDnYBh3XsThvaH/TYqaiyWNvGri4RjYe6/UN?=
 =?us-ascii?Q?ogby2ogwcg1Y2TJV8P+cyBLZEBABcaZclRlX+hxBEvTJZeoCDzKt0YrbN35a?=
 =?us-ascii?Q?obkS4SsKoKrSAnQ+rVhCSj8y4fuaMro404wB2c6DwtE0UWrhn5kzHi9BS6tw?=
 =?us-ascii?Q?By0TOEcA0UUSbWrgbtZJ3hBfBh2mz2q7Qdqgg128Jyowg2/c/8lc75A2Q37i?=
 =?us-ascii?Q?LXmqFzC5wNuRZeAUAO+HGE8+OPu/aA+syfo/iGlwZRZBEmbVg93VKYoSC7e9?=
 =?us-ascii?Q?hRxL2D5NGtzSKBvkPE1UGzbITtl09NuBvzO1o3Jw7WihMCRM31Dr3RpAyNsd?=
 =?us-ascii?Q?VWJKLvAM+fFSAGopwY6l5ZyCEsoXj41+hQmR6SaA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c94c0d5-db71-4197-54ee-08dd831b94c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:34:24.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17jg/m1cd67TrzYNBb4lMwW/QyRMWZhTCmXI5eoRXFOk2M2twSjQXXZem0+RZ7/6QaH3tgxwGpgPvmgtgpj+FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6879

From: Ming Qian <ming.qian@oss.nxp.com>

When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
may not one-to-one, a single dma-buf may be queued via different
v4l2 buffers, and different dma-bufs may be queued via the same
v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
as the frame store id.

We can generate a frame store id according to the dma address.
Then for a given dma-buf, the id is fixed.

Driver now manages the frame store and vb2-buffer states independently.

When a dmabuf is queued via another v4l2 buffer before the buffer is
released by firmware, need to pend it until firmware release it.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

---
v6
- Remake patch based on commit 0af2f6be1b42 ("Linux 6.15-rc1")
- Fix dismatch to mismatch
v5
- Avoid dynamic size calculation in memory allocation, use kmalloc_array instead
v4
- remove unnecessary 'out of memory' message
v3
-- fix a typo in NULL pointer check
v2
-- fix an uninitialized issue reported by media-ci
---
 drivers/media/platform/amphion/vdec.c     | 235 +++++++++++++++++-----
 drivers/media/platform/amphion/vpu.h      |   7 +-
 drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
 drivers/media/platform/amphion/vpu_v4l2.c |  11 +
 4 files changed, 220 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 6a38a0fa0e2d..3a7ee787f0cd 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -26,6 +26,7 @@
 #include "vpu_cmds.h"
 #include "vpu_rpc.h"
 
+#define VDEC_SLOT_CNT_DFT		32
 #define VDEC_MIN_BUFFER_CAP		8
 #define VDEC_MIN_BUFFER_OUT		8
 
@@ -41,6 +42,14 @@ struct vdec_fs_info {
 	u32 tag;
 };
 
+struct vdec_frame_store_t {
+	struct vpu_vb2_buffer *curr;
+	struct vpu_vb2_buffer *pend;
+	dma_addr_t addr;
+	unsigned int state;
+	u32 tag;
+};
+
 struct vdec_t {
 	u32 seq_hdr_found;
 	struct vpu_buffer udata;
@@ -48,7 +57,8 @@ struct vdec_t {
 	struct vpu_dec_codec_info codec_info;
 	enum vpu_codec_state state;
 
-	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
+	struct vdec_frame_store_t *slots;
+	u32 slot_count;
 	u32 req_frame_count;
 	struct vdec_fs_info mbi;
 	struct vdec_fs_info dcp;
@@ -258,6 +268,63 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 	return 0;
 }
 
+static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vdec_t *vdec = inst->priv;
+	struct vdec_frame_store_t *new_slots = NULL;
+	dma_addr_t addr;
+	int i;
+
+	addr = vpu_get_vb_phy_addr(vb, 0);
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (addr == vdec->slots[i].addr) {
+			if (vdec->slots[i].curr && vdec->slots[i].curr != vpu_buf) {
+				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+				vdec->slots[i].pend = vpu_buf;
+			} else {
+				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
+			}
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].addr) {
+			vdec->slots[i].addr = addr;
+			vpu_buf->fs_id = i;
+			return;
+		}
+	}
+
+	new_slots = krealloc_array(vdec->slots, vdec->slot_count * 2,
+				   sizeof(*vdec->slots),
+				   GFP_KERNEL | __GFP_ZERO);
+	if (!new_slots) {
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
+		return;
+	}
+
+	vdec->slots = new_slots;
+	vdec->slot_count *= 2;
+
+	vdec->slots[i].addr = addr;
+	vpu_buf->fs_id = i;
+}
+
+static void vdec_reset_frame_store(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
+
+	if (!vdec->slots || !vdec->slot_count)
+		return;
+
+	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
+	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
+}
+
 static void vdec_handle_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -714,11 +781,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	struct vb2_v4l2_buffer *src_buf;
 	int ret = 0;
 
-	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
+	if (!info || info->id >= vdec->slot_count)
 		return -EINVAL;
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[info->id];
+	vpu_buf = vdec->slots[info->id].curr;
 	if (!vpu_buf) {
 		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
 		ret = -EINVAL;
@@ -739,11 +806,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
 	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED)
 		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
+	vdec->slots[info->id].state = VPU_BUF_STATE_DECODED;
 	vdec->decoded_frame_count++;
 	if (vdec->params.display_delay_enable) {
 		struct vpu_format *cur_fmt;
 
 		cur_fmt = vpu_get_format(inst, inst->cap_format.type);
+		vdec->slots[info->id].state = VPU_BUF_STATE_READY;
 		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
 		for (int i = 0; i < vbuf->vb2_buf.num_planes; i++)
 			vb2_set_plane_payload(&vbuf->vb2_buf,
@@ -766,11 +835,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
 	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
-		if (luma == vdec->slots[i]->luma)
-			return vdec->slots[i];
+		if (luma == vdec->slots[i].addr)
+			return vdec->slots[i].curr;
 	}
 
 	return NULL;
@@ -804,11 +873,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 
 	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
 	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vbuf->vb2_buf.index != frame->id)
-		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
-			inst->id, vbuf->vb2_buf.index, frame->id);
+	if (vpu_buf->fs_id != frame->id)
+		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) mismatch\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
 
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
+	if (vdec->params.display_delay_enable)
 		return;
 
 	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_DECODED)
@@ -821,10 +890,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
 	vbuf->sequence = vdec->sequence;
 	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
 
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	vpu_inst_lock(inst);
+	vdec->slots[vpu_buf->fs_id].state = VPU_BUF_STATE_READY;
 	vdec->display_frame_count++;
 	vpu_inst_unlock(inst);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
 		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->sequence);
 }
@@ -1052,18 +1122,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (!vbuf)
 		return -EINVAL;
 
-	if (vdec->slots[vbuf->vb2_buf.index]) {
-		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
-			inst->id, vbuf->vb2_buf.index);
+	vpu_buf = to_vpu_vb2_buffer(vbuf);
+	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >= vdec->slot_count) {
+		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
+			vpu_buf->fs_id, vbuf->vb2_buf.index);
 		return -EINVAL;
 	}
 
+	if (vdec->slots[vpu_buf->fs_id].curr) {
+		if (vdec->slots[vpu_buf->fs_id].curr != vpu_buf) {
+			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
+			vdec->slots[vpu_buf->fs_id].pend = vpu_buf;
+		} else {
+			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
+		}
+		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
+			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
+		return -EAGAIN;
+	}
+
 	dev_dbg(inst->dev, "[%d] state = %s, alloc fs %d, tag = 0x%x\n",
 		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec->seq_tag);
-	vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 	memset(&info, 0, sizeof(info));
-	info.id = vbuf->vb2_buf.index;
+	info.id = vpu_buf->fs_id;
 	info.type = MEM_RES_FRAME;
 	info.tag = vdec->seq_tag;
 	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
@@ -1078,12 +1160,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
 	if (ret)
 		return ret;
 
-	vpu_buf->tag = info.tag;
 	vpu_buf->luma = info.luma_addr;
 	vpu_buf->chroma_u = info.chroma_addr;
 	vpu_buf->chroma_v = 0;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
-	vdec->slots[info.id] = vpu_buf;
+	vdec->slots[info.id].tag = info.tag;
+	vdec->slots[info.id].curr = vpu_buf;
+	vdec->slots[info.id].state = VPU_BUF_STATE_INUSE;
 	vdec->req_frame_count--;
 
 	return 0;
@@ -1144,25 +1227,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
 	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
 }
 
-static void vdec_clear_slots(struct vpu_inst *inst)
+static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
 {
 	struct vdec_t *vdec = inst->priv;
 	struct vpu_vb2_buffer *vpu_buf;
 	struct vb2_v4l2_buffer *vbuf;
+
+	if (id >= vdec->slot_count)
+		return;
+	if (!vdec->slots[id].curr)
+		return;
+
+	vpu_buf = vdec->slots[id].curr;
+	vbuf = &vpu_buf->m2m_buf.vb;
+
+	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
+	if (vpu_buf->fs_id == id) {
+		if (vpu_buf->state != VPU_BUF_STATE_READY)
+			vdec_recycle_buffer(inst, vbuf);
+		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	}
+
+	vdec->slots[id].curr = NULL;
+	vdec->slots[id].state = VPU_BUF_STATE_IDLE;
+
+	if (vdec->slots[id].pend) {
+		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_IDLE);
+		vdec->slots[id].pend = NULL;
+	}
+}
+
+static void vdec_clear_slots(struct vpu_inst *inst)
+{
+	struct vdec_t *vdec = inst->priv;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
-		if (!vdec->slots[i])
+	for (i = 0; i < vdec->slot_count; i++) {
+		if (!vdec->slots[i].curr)
 			continue;
 
-		vpu_buf = vdec->slots[i];
-		vbuf = &vpu_buf->m2m_buf.vb;
-
 		vpu_trace(inst->dev, "clear slot %d\n", i);
-		vdec_response_fs_release(inst, i, vpu_buf->tag);
-		vdec_recycle_buffer(inst, vbuf);
-		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
-		vdec->slots[i] = NULL;
+		vdec_release_curr_frame_store(inst, i);
 	}
 }
 
@@ -1263,39 +1368,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
 {
 	struct vdec_t *vdec = inst->priv;
-	struct vpu_vb2_buffer *vpu_buf;
-	struct vb2_v4l2_buffer *vbuf;
 
-	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
+	if (!fs || fs->id >= vdec->slot_count)
 		return;
 	if (fs->type != MEM_RES_FRAME)
 		return;
 
-	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
+	if (fs->id >= vdec->slot_count) {
 		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
 		return;
 	}
 
 	vpu_inst_lock(inst);
-	vpu_buf = vdec->slots[fs->id];
-	vdec->slots[fs->id] = NULL;
-
-	if (!vpu_buf) {
+	if (!vdec->slots[fs->id].curr) {
 		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
 		goto exit;
 	}
 
-	vbuf = &vpu_buf->m2m_buf.vb;
-	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED) {
+	if (vdec->slots[fs->id].state == VPU_BUF_STATE_DECODED) {
 		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
 		vdec->sequence++;
 	}
 
-	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
-	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_READY)
-		vdec_recycle_buffer(inst, vbuf);
-
-	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+	vdec_release_curr_frame_store(inst, fs->id);
 	vpu_process_capture_buffer(inst);
 
 exit:
@@ -1485,6 +1580,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
 		return;
 
 	vdec = inst->priv;
+	if (vdec) {
+		kfree(vdec->slots);
+		vdec->slots = NULL;
+		vdec->slot_count = 0;
+	}
 	vfree(vdec);
 	inst->priv = NULL;
 	vfree(inst);
@@ -1606,11 +1706,43 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
 	return 0;
 }
 
-static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
 {
 	struct vdec_t *vdec = inst->priv;
+	struct vpu_vb2_buffer *vpu_buf;
 	int num = -1;
 
+	vpu_inst_lock(inst);
+	if (i >= vdec->slot_count || !vdec->slots[i].addr)
+		goto exit;
+
+	vpu_buf = vdec->slots[i].curr;
+
+	num = scnprintf(str, size, "slot[%2d] :", i);
+	if (vpu_buf) {
+		num += scnprintf(str + num, size - num, " %2d",
+				 vpu_buf->m2m_buf.vb.vb2_buf.index);
+		num += scnprintf(str + num, size - num, "; state = %d", vdec->slots[i].state);
+	} else {
+		num += scnprintf(str + num, size - num, " -1");
+	}
+
+	if (vdec->slots[i].pend)
+		num += scnprintf(str + num, size - num, "; %d",
+				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
+
+	num += scnprintf(str + num, size - num, "\n");
+exit:
+	vpu_inst_unlock(inst);
+
+	return num;
+}
+
+static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
+{
+	struct vdec_t *vdec = inst->priv;
+	int num;
+
 	switch (i) {
 	case 0:
 		num = scnprintf(str, size,
@@ -1664,6 +1796,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
 				vdec->codec_info.vui_present);
 		break;
 	default:
+		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
 		break;
 	}
 
@@ -1687,6 +1820,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
 	.get_debug_info = vdec_get_debug_info,
 	.wait_prepare = vpu_inst_unlock,
 	.wait_finish = vpu_inst_lock,
+	.attach_frame_store = vdec_attach_frame_store,
+	.reset_frame_store = vdec_reset_frame_store,
 };
 
 static void vdec_init(struct file *file)
@@ -1727,6 +1862,16 @@ static int vdec_open(struct file *file)
 		return -ENOMEM;
 	}
 
+	vdec->slots = kmalloc_array(VDEC_SLOT_CNT_DFT,
+				    sizeof(*vdec->slots),
+				    GFP_KERNEL | __GFP_ZERO);
+	if (!vdec->slots) {
+		vfree(vdec);
+		vfree(inst);
+		return -ENOMEM;
+	}
+	vdec->slot_count = VDEC_SLOT_CNT_DFT;
+
 	inst->ops = &vdec_inst_ops;
 	inst->formats = vdec_formats;
 	inst->type = VPU_CORE_TYPE_DEC;
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index 22f0da26ccec..76bfd6b26170 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -223,6 +223,8 @@ struct vpu_inst_ops {
 	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
 	void (*wait_prepare)(struct vpu_inst *inst);
 	void (*wait_finish)(struct vpu_inst *inst);
+	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb);
+	void (*reset_frame_store)(struct vpu_inst *inst);
 };
 
 struct vpu_inst {
@@ -296,7 +298,8 @@ enum {
 	VPU_BUF_STATE_DECODED,
 	VPU_BUF_STATE_READY,
 	VPU_BUF_STATE_SKIP,
-	VPU_BUF_STATE_ERROR
+	VPU_BUF_STATE_ERROR,
+	VPU_BUF_STATE_CHANGED
 };
 
 struct vpu_vb2_buffer {
@@ -305,8 +308,8 @@ struct vpu_vb2_buffer {
 	dma_addr_t chroma_u;
 	dma_addr_t chroma_v;
 	unsigned int state;
-	u32 tag;
 	u32 average_qp;
+	s32 fs_id;
 };
 
 void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 940e5bda5fa3..497ae4e8a229 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -48,6 +48,7 @@ static char *vpu_stat_name[] = {
 	[VPU_BUF_STATE_READY] = "ready",
 	[VPU_BUF_STATE_SKIP] = "skip",
 	[VPU_BUF_STATE_ERROR] = "error",
+	[VPU_BUF_STATE_CHANGED] = "changed",
 };
 
 static inline const char *to_vpu_stat_name(int state)
@@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_vb2_buffer *vpu_buf;
 
 		vb = vb2_get_buffer(vq, i);
 		if (!vb)
@@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 			continue;
 
 		vbuf = to_vb2_v4l2_buffer(vb);
+		vpu_buf = to_vpu_vb2_buffer(vbuf);
 
 		num = scnprintf(str, sizeof(str),
-				"capture[%2d] state = %10s, %8s\n",
+				"capture[%2d] state = %10s, %8s",
 				i, vb2_stat_name[vb->state],
 				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
 		if (seq_write(s, str, num))
 			return 0;
+
+		if (vpu_buf->fs_id >= 0) {
+			num = scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
+			if (seq_write(s, str, num))
+				return 0;
+		}
+
+		num = scnprintf(str, sizeof(str), "\n");
+		if (seq_write(s, str, num))
+			return 0;
 	}
 
 	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 45707931bc4f..74668fa362e2 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -501,14 +501,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq,
 		call_void_vop(inst, release);
 	}
 
+	if (V4L2_TYPE_IS_CAPTURE(vq->type))
+		call_void_vop(inst, reset_frame_store);
+
 	return 0;
 }
 
 static int vpu_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
+	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 
+	vpu_buf->fs_id = -1;
 	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
+
+	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	call_void_vop(inst, attach_frame_store, vb);
 	return 0;
 }
 

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.43.0-rc1


