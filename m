Return-Path: <linux-media+bounces-48815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC1CBE979
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 16:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E89DE3002153
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 15:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921FA333431;
	Mon, 15 Dec 2025 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RtAXfEMp"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160BE2D7DD0;
	Mon, 15 Dec 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811997; cv=fail; b=Rg5hTcokQBgoYJNi8rVjvRYYFYWjrYPxP0mFJoXfpVTgQRjH+uNdnwXWa75qZ3zPmA5L0UrDimu3sBbqOcxGMhpJzxxk6czPb3rhcGJnzLyktO7QMNWiXXpvte+080tiqA/FWZgVVZLObt5zJdtlIHK29XVcm7IFphtnE8yQhBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811997; c=relaxed/simple;
	bh=4J0r9srxp/t7pm5XeC7OZoQf+Cuz2n2+9/nYijS60VA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fnclBFCPBo0Z/RG12zHCw9kOzZp/+opYWyMVT932ngaScP70p5PnUwbJhBO5YUtoYVjIwvbENCEHRqkfABIf1NAPvwxmlwbsmwb316NupyfGg+5kl/fdJzCWns/xS1+eFgvhYDQCKoDkr/oqTRJ9TcnWkv3CBMv3rpjgvyPrdwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RtAXfEMp; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMyjvXCybCgAy0PM28tmk5a2J2sLH7It75ijASqH9Vwuu9Eb+dpPZJEsqxVtpBoSupU4v59gTidSjAoksxzviZRzywePbWm+LKEtcoQ5LvolF88qx1+BYfZkzpDz5CMxuFU12YZNl3HnGpZ0HlKRx4i5XXFVfFqZJ1+VpAgZ9IjkM5VxLL8CCxJcWelypiO/t8FE9tTBsVILZQOVbKZWW5Ff3kOD5rrsBIuboGrOK7qIutKaSRQuhn5+ookWYf51eKuUC0fx3j69ABjevttXkyba44LBQHh9G0xwKOrVPo9DsXjnWC7JFlfNQeICZ0nXTD70J1A39I+cyS6eg6C22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUs/xu8C6tIsMI3/8+w1WW7B0ecsn5tf7+pM3XelV0Y=;
 b=uJNPrHNmVGeZS+daRg6TbBMDfziPY1TDMJ0VwRgaNGTJdP08I5expHTHOoNyjBgB1AHMgx94/Ss5UGCyqSV5gDadr9mhf7Psp+zz27DmRwzYTgheumOwPcD/a/Jt6l20klybZYZKpT3w9pdDuiysDUs9L27T+E56wWh2epVuM4mISErKHnKDp1YWjn6YcKR6EqxToFrxrWNB5HOKjSQcSjeEAUZ3fOMBBkEZRy+PnER6XZrv4At8sob8KOxlf2GgOqOYVakjlQVbBtBLiIVk9PtO+GnZXTIZVdSJx9Ovevk5LbtmyNDa8Ys+x6zPt5E0z0iMbMjsOV2GGM3Skm+r4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUs/xu8C6tIsMI3/8+w1WW7B0ecsn5tf7+pM3XelV0Y=;
 b=RtAXfEMpDPa5Kc7/yc+Mp5bBrOeeR5CAPMcINShyLrNBuqL0FjG4MI6jF8YcyvLd5Xcbk3VoRtwGxNZZcbDJFTFZo31PZcRFem2kECrnQePELZAoENvL5xKbDXPTzun/NKQPU0ZJYLwBNT5aGKWtBYyqZT39wX8IpQ5OCsrkpu2hr1RNYMvq/bMe+umEtnlbmdYA+XON2t0bReqLffAUjHPMAiOQhFD7KncqRMgcXXVavjzbsgKEPUQrfEyLyOKvG6rJzVsUFeD8a52PhMxUM6cA1oeYX90/NtOV2cOdjfrkEQ4Ougn6WiRwUJYTLE5kWJ29EjIG6CDOiWFtpPM15w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB12158.eurprd04.prod.outlook.com (2603:10a6:150:2bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:19:49 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:19:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: rmfrfs@gmail.com
Cc: Frank.Li@nxp.com,
	guoniu.zhou@nxp.com,
	hverkuil@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	ming.qian@oss.nxp.com,
	nicolas.dufresne@collabora.com,
	rui.silva@linaro.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/1] MAINTAINERS: Promote Frank Li as i.MX7/8 media maintainer
Date: Mon, 15 Dec 2025 10:19:30 -0500
Message-Id: <20251215151930.2896266-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB12158:EE_
X-MS-Office365-Filtering-Correlation-Id: c72344fa-29a1-41e1-3683-08de3bed6367
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?LAG0DrJjWrv6c4JESgaJoDcBhMaxaAXI2tmZTsmA5QzCR1KoNbVIDY5k4cyE?=
 =?us-ascii?Q?ME7fbROrEBw5DUwfAlX9JglM7xPSHvkSaSPWmTcZk9tZmk5C/7aQOtgozGWl?=
 =?us-ascii?Q?zUwjTxkH2dLxMW+MaLfyKkxNlVSj5KjtgmamlwSioGgEE5kYP5NfEvje8eAO?=
 =?us-ascii?Q?BrW6QU9v7DqGCHfHcSsvQUZQyCnToKU++xXItxI19wpZ6itMviUil/6Bhbr9?=
 =?us-ascii?Q?E3tnG9hFfEPj/LpO4TvYtluNi/W9AG1rKiBPcWb6yE4zAx6AGO0HJEwchC1b?=
 =?us-ascii?Q?Te4+T6KGi3F+LKfq4dJCPpkybzAxXGQtStrvxgPEYGpgwNZy0T/slLKsMPG/?=
 =?us-ascii?Q?R6LMjh6KDowT3M5V7kxwU+M5Gv63xeoP45c9iggLUlv52FSG5HfucCbbN7LX?=
 =?us-ascii?Q?tsQ2z/WpJMT2KMOVmD3sIOmXJEbdmI3iKMWAd3hAiIezzSJ3XwIX4sntVz/u?=
 =?us-ascii?Q?tZyfVLNFnvjYBODtVJu+zXQXxuG3vVXq4enDXWtXH+Odly6Tgkhc9Xx8lUkl?=
 =?us-ascii?Q?/2i0JgvF901BloziF/672+YsSg1AgkJCxD+MLpyfdRMcwiTPxPQAQ2BEaSvH?=
 =?us-ascii?Q?/cKVjjCirmoBz5LlM2zIPob1PQwzc2foXqV+DWQPyGYgtHAWHR7zkR0DvqAg?=
 =?us-ascii?Q?fXx+lk0KYA1zKd/CffXXx1l1tHgoTY2ucchVoZGvkurYjijf4aQerVFNzHpZ?=
 =?us-ascii?Q?SglAPJxO47WQLwMCsgdfT5YXzuX0a+nycCcJL49ueCqL0xpV41GYDE3y3bS7?=
 =?us-ascii?Q?bpF2WvC5Tzj+8vYEGt6ISzlIaZ8qW1Xp6h/Mg75zQzZUxp4vhiFbwpmERJUg?=
 =?us-ascii?Q?kU5TZ3KUAbdz/evIf0uAA4s44ZDKGtlhN/1Yma3Og0tYqk6FuYSUOR/VXxW3?=
 =?us-ascii?Q?AVNn5uawJAOx+ZGPcA014Rz2s46y1f+ITFWwnqrU9x/QgSV5H4AfGxoVk/7J?=
 =?us-ascii?Q?SqwSNgHz1Ordp0ksC12R8F1d2PPaD1BOVTl2Rht0tRwtYJ1lh1XBUCiRUQib?=
 =?us-ascii?Q?GGMonnT+0yulEw5+FLrAyZgh8mg4rzhOUdunqHqF2e9lTyZJZARKM6fsDQvA?=
 =?us-ascii?Q?KK8CLCK736r8ks7JwoYrvaXaGXBr8a2wgzjspTEFnhNgmVR1HQqeeoP6r70N?=
 =?us-ascii?Q?cl9Ixb4m7/aVRfkpp8InVN2AdAJO0y3hOekf/nbqxICq7SgUjIHNoRc1mhPp?=
 =?us-ascii?Q?GPSkNTToktPmdOrLkRB7S+v/HrsO8WLOfWOxr5mqwCMexgZX/yQyOVn6a7Q0?=
 =?us-ascii?Q?cMp7pR0QhKSUVJw2nwa1huHv1S1/7kMNUU8I7hO7RgpUPGJPgC8SEfDtXIjh?=
 =?us-ascii?Q?mBQs1tieFVKAZUDkXUvnr+Um8fwzexM9+3LxO9Bb1inR0wLX9Nd/zhaa6dge?=
 =?us-ascii?Q?zwERk0trVmIiRqlejnl+pGtpl2WdZF74V14oa9wzrK+PC0LCghLS/zTSZNEn?=
 =?us-ascii?Q?AlxJgc9zQ70G7qOz60uRpNsvTJYb2L1RqKJ7CaNpm8+/4l6QPG4ABdRg5+w/?=
 =?us-ascii?Q?6hQqspYuXjY9FfsDu+O/qoAmsCTf9rh1We4gtxVVMFrgvUsWnfnQN0LPEQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dbKz7Iz9UsELWEDwdDAJ/PeFnAJyIp1Z3bqUQeogpMSgrp7bfuLcF/FXv6gu?=
 =?us-ascii?Q?VnBYEXltoJ5h0++fGDqUTcSnSMYHOaM+2ncjX3/Q3BKOAlHg1Fk2pQ1iLhIB?=
 =?us-ascii?Q?0tkujuGY9S5KLGKEj40Puv7dERsr9IN+4a2275ehDKUcT3J4IP+kZT00EsDl?=
 =?us-ascii?Q?jQR9AOZ7OE5qJkKBPpi/t7pn8wr2DdUycz74gNq0P1pYC/GU4y4GgvwgtwIr?=
 =?us-ascii?Q?kVJPfoWg1PAFmx9yUQzKAxXna6EH2OBcatHteCyEiGjreAL+wyIHcmFvWn/L?=
 =?us-ascii?Q?gzs+eahYQxc5UgpQrRd+ynwRgKk2X+reTRp6DEs44LKQhaY+Av+talwm2d/v?=
 =?us-ascii?Q?Rw42XmoluxiAnNZTPXLLjaMFjdqqxniA/9syVSj4O2WiDNNgQg4yArkKUX5x?=
 =?us-ascii?Q?jCKsP2NiNSt0qfgCM2aMbnuBv+imPie/P3mXtC5UNKKXIJsxKf/ynwdgv/x9?=
 =?us-ascii?Q?D8LiBXnXA2y5FzC2ozGSg0wXL9pqgyow3uMoD0PhqXqjJe11Qborp2dZN4DL?=
 =?us-ascii?Q?Fw/C5TnTySZBbQTqpL4sdwC8SiWJsPrMEFvF2JMnV050IQPhZ+4CChmP9CR+?=
 =?us-ascii?Q?ZLDn2IjQWEELBaEE1iCS1JfEcz/tizGiTIvI4lI8A3QgjdgXLmF8c4HlBGtO?=
 =?us-ascii?Q?nt+f7jX8rJElDueVMhRCyk0k5rZBrs1r13oT1udsnxM4Cbhh9tt86VYK329A?=
 =?us-ascii?Q?G1e8imBLlABNHxQprkGQPS+2agVL4shh5R8hsnyh4RPkSP7tGLkJQC65ceh6?=
 =?us-ascii?Q?z1keDvWnz4rYfy1kr6jIVzac8vfGiNkGbpuMD310egTd6a/SWJB1pmq4+85M?=
 =?us-ascii?Q?3A6c/MTAb/B+J3WNr6jMGZ6xbAEw3NlPL5MXyJFy83Pqk+FO9ulCazzFgKdG?=
 =?us-ascii?Q?T66KDEyHI9lpTQacrp2RZ5S8J0L3grpFa8yeKaHMc+hrx4+4QfxuosI9AJw0?=
 =?us-ascii?Q?F0A/sDCOnLXKJKfB3iPJg9KN2EEmjWTxNlbEZOwcU3+tpiUQ4fQFxX0SLRj2?=
 =?us-ascii?Q?ZI6xiMuhXSog+RLgBS12DcqCy3jcEPyoC9pT55tMzUx4S826NjV2KeDS6D87?=
 =?us-ascii?Q?+nd01A8w85t4nQL9yTm1iGtIzIsRnUq+MBXzt5vLYV3+TdBOj6dKzRaVHu2B?=
 =?us-ascii?Q?CgwWDJkHqFt7pGKb3wzMCEhitTfwGb0ZcDRG2tTL2nmj6XR/B/vSpYVQxwWs?=
 =?us-ascii?Q?POCnpF0TNkktVcUl28e2EFMTnoJbyrAY/kbpe4XIoaRcl4Vsjc5J79MXjGct?=
 =?us-ascii?Q?3M9oc0tvcwqF3mI+bUm9spQkPBaq6fgy7GY6Jywo2jX2Sg/oOGYwFngdvXCA?=
 =?us-ascii?Q?560cucB/Npru03PIJEmWI49RhepnmfNa0mlyN/OtyU0wnsjjv07gYjRmoE5E?=
 =?us-ascii?Q?e1ug0RIdKW6yyk+zdimJQLiN2EYUJryV/8mA3NPcTNsdFex33W/7P3xuSBis?=
 =?us-ascii?Q?Xu7eUSeOofoVWCNSFsbWwALUN1xxYKCP5FQrlr3gWbGoDnQX3FN8M1Pqalrj?=
 =?us-ascii?Q?KjOJZ/nJXm0kwh1hkWGPDEpchfGnrcyx3yNb2mOMTfD5Wc+SzLDxV8KCg4xH?=
 =?us-ascii?Q?akqfso3+sTAbCqXQ3W4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72344fa-29a1-41e1-3683-08de3bed6367
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:19:49.5488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qEKToIJnr4zL8pZ3f/nJiB8cfLq8mOqsFajHkyaCcJsf7Ry2KLKnImp2bHaJSHsLvDlRSEHO14SEqM/GCHXbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12158

Move Rui Miguel Silva to reviewer since he does not have sufficient time to
maintain i.MX7/8 media drivers. Frank Li has the hardware, complete
documentation, and has participated actively in patch review. Promote him
as the i.MX7/8 media drivers maintainer.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in V2
- rebase to v6.19-rc1
- add Rui Miguel Silva's review tags

v1: https://lore.kernel.org/linux-media/DEOWTEQ7X9OX.2CNNQEE5IOLSB@gmail.com/

According to discussion at
https://lore.kernel.org/linux-media/DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com/,
Rui agrees that Frank Li will maintain i.MX7/8 media drivers, and moves
himself to reviewer due to workload. Thanks to Rui for his contributions
and maintenance of these drivers in the past
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d599e8b8b008..711f3e4b7e407 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15612,11 +15612,11 @@ F:	include/linux/imx-media.h
 F:	include/media/imx.h
 
 MEDIA DRIVERS FOR FREESCALE IMX7/8
-M:	Rui Miguel Silva <rmfrfs@gmail.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Martin Kepplinger-Novakovic <martink@posteo.de>
+R:	Rui Miguel Silva <rmfrfs@gmail.com>
 R:	Purism Kernel Team <kernel@puri.sm>
-R:	Frank Li <Frank.Li@nxp.com>
 L:	imx@lists.linux.dev
 L:	linux-media@vger.kernel.org
 S:	Maintained
-- 
2.34.1


