Return-Path: <linux-media+bounces-45200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BFBFAABD
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47B053482DF
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3182FF158;
	Wed, 22 Oct 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="cYV7H/yM"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021119.outbound.protection.outlook.com [40.107.42.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B02FE067;
	Wed, 22 Oct 2025 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119258; cv=fail; b=l3x8wyiAMX8VbMzPS77Ai9XVX3SV19dOofuqbVsvs11o8P3D23FGzuZWQIMkr4zjrg2iKTB/WAoHnVJ6VOS0PLIwzZG0LiFSdEu2gTBHlRIXORvemkOjlR7vEh5HOWFWs1rc/Y4jQBI7wpjwYvqRfh9j4nSFzdVJDpacawJsyWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119258; c=relaxed/simple;
	bh=MiPOciruQl6GicHZ2BRd0hWSwjcWx3x2Pv01T3prGa4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHVQOGzzMVyet8/58Sj4bQBKc+432W1nFjJcLRQbnK5mQFptPXwMEA7/kW8yd0sfbjioYBRwyzmSOyEDlM49AzV8coZ4YkA8s6w2W2Gt2b7SV/0Z0O6dxeWDtSiRC1zZFpfT/2sGbrWHvCWmfkrFu8LWXhcIVacyC8X8hR5xOG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=cYV7H/yM; arc=fail smtp.client-ip=40.107.42.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elKsqovYSctqrvDKlJ4wiRKBa+HKz7V18UErWp2qqdx6L7FAcbSCwF/BW4PWKvO6SG+VFpD/92LH3tDmgcUX9u38RN4XjIaet2OXpUvHbI+3EFKfyBcbt68aBRBxGJEH6Luj5l+76/O2mlc39PUMpbHrJG0phM/DmzErhU80AJslgizg2aXOjnOTkacfcgBNtd6fBp1sK7udMctzAVLa8QYUBfZEmXnK7HS0T//dN1MrXV82X+ElhqplJh3iZnZsrvsnkTngeY1ANowvU/cbYJnC/zwosHeyNMXzNVROAREIz4SmjsnuUvAYKUxYCtwG2fFh+hFIrVoBIHnRvWUBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKMaKsqQeSyKJ0VOHurfh1R0fk/3kLmtTygBI3w0m+g=;
 b=hI1m2UGIJxCOmCovrn3gecvKFVrpBFS5rhsRxkrLHM7D1GdFqxWZJ9WcthwMnRWHPPm6CSkQv4iA+lbdZfRXutC0F+thtIHjvEphL9OZzsJVMqQs4fz6zdLzUCIx5iBf9Xx53hfmSmmlQaLs9IesaOKQqVtDtvYwI22WhJobXvaSmNO7CHnBRMUTYeI206nxmDCkN+T0hSNdWhkNAQxHjg8RstI76PNREY4mtUpbfrO9mf5lwKEqkBE2EmN3yNXwJ7tDu7HhMQDTM5qDzLoFGTaCpgdjgIAnnDwKGXIxUkz9O2SRMZsSDPjV2nQWTN+r8mQ8QPqjSEYbu13DweEGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKMaKsqQeSyKJ0VOHurfh1R0fk/3kLmtTygBI3w0m+g=;
 b=cYV7H/yMLgnwTKzVXQg3nWomBG/wf2eW+Xb93uMft91wAZSOCzWzslrG0+GA8m3ManKb+xIgr2GXF7ur0grIu/Mk9m3oR3+HlAZcjtajeC0DFdBJyENU8HiCKn/ZVX5vcE41nAGU3/M5XYJPcA+UZ8NWKhpU9vIU4qG9qwOP3NM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2918.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Wed, 22 Oct 2025 07:47:27 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v4 7/9] media: chips-media: wave6: Add Wave6 thermal cooling device
Date: Wed, 22 Oct 2025 16:47:08 +0900
Message-Id: <20251022074710.575-8-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PUYP216MB2918:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a1d2cc-0fbe-4a83-a98b-08de113f3f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t2npnKQ8sBtMsevXDO5+zjvHTp63Citbh0M+33QCF2lzRYXk5SUHBvK2kVnA?=
 =?us-ascii?Q?9dbfcxsYMsqcvVskvtnh6kG+30Ilfa3xdjrVU6GhRM0uhlG4eN5NzK/HF089?=
 =?us-ascii?Q?OeYdF8KW044z5uXn3131HVscdc7b02TlIbqYsFNI2zOiO1sP/LrNeCYMs8iN?=
 =?us-ascii?Q?Ptsu3WHy8kP9qEKNKl45S/vNkAghNWjkhC9VRPIH7IozSJJej0D2DzxYzvpJ?=
 =?us-ascii?Q?OWVBwrUToFK7YdUoZgiV+YEjbnQMWxlL6tZpHBYwd9Tr95f1Ps9uZhsaZgaC?=
 =?us-ascii?Q?cMzyTgBRIcAJDGSG9FOGnZ0iWAJzu+V/Y+rEA3cWX7kOuDwJ27ITNq0d8nsI?=
 =?us-ascii?Q?SOm6TUnm+OHwt4bedQTb6biDmVkvJg47UYO7cuFhAtvwUJXUhdjSgcKfl+gQ?=
 =?us-ascii?Q?OygFzwEOLQ+HC+A+dngc0GDrXU1/kmemOjK9/q40AXb+0ef54YdNGffX8m0k?=
 =?us-ascii?Q?6j70RXxWNMMzh5450TlbqDxYzUQvkvcW+oNeCKTF/hHEO0ls8Ge35HFKuLnZ?=
 =?us-ascii?Q?fBg3JMjaHr/8XHAI0j8GZys+Shr/Tb4g0Jufa/qRSNA9SWO6E3a7G55GgRno?=
 =?us-ascii?Q?ERHMwULvMHAGhYo0IM9a2Y82Ez8btpCz9iXHhq0k/CfGhVDea6XDfq4fHPVD?=
 =?us-ascii?Q?Q+rt489chpTayeUa15BKuqar2nNkf2zMxu+NPQIENJqOvJRGPbv1sjX0bLBt?=
 =?us-ascii?Q?wLaM9/G2KfinDX9oXXAdJP7tNKKARib9soEZNPJ+11kNDU3RTygarxXp2U3J?=
 =?us-ascii?Q?zIFz+feLM6f6pZ9k4XBQk9bU+lAXAXw1lUbyNeH33QMtWRgaAa5T02cUM+yk?=
 =?us-ascii?Q?Tq/X9kBV5uMmUcwlIbZACN9zdJ9txxSVogSwfFonXV8qc1hdNL9R94//QJ3b?=
 =?us-ascii?Q?E93UROetVbRLTAqdWW+d6Tj/ate2Qho4CVKRuFKNpnV1eEbHGXj+gxb1TkE4?=
 =?us-ascii?Q?sWA91J79QcV0PlpSG+Y2ks80VXm0s8TMrBC1ueLzczjLIMYLk6LWyUkS6UwS?=
 =?us-ascii?Q?jabEwWhfrj6seceR4FTTfVq1iDoJoiaQNWoATEYLjgaa2vdCv34AlNYlTUgw?=
 =?us-ascii?Q?TNY9VFA4mH2HtpIAsVQEezmiq2jnA+k+1UqxUGTuWGE4k2WFQ9oKt/6Z5zjK?=
 =?us-ascii?Q?jYQ/lCRvJCIOVSVWp9+JtQKGnOMJWOqe+A6TmVC/bXZjaKowYaz4Ad6yY8xS?=
 =?us-ascii?Q?WoxS/fRXe9I7TVyhmZGB/wHg3jwdhPSGEzZH9YCsQGEF1+5uOSBY2d4vDN2u?=
 =?us-ascii?Q?iU5SCgNMP/gzcFFUE1XWdqEKynOzsbMtkh+ACpTPOKQxOJQauSxqMypMBYPm?=
 =?us-ascii?Q?w9EwSCMU/25Ad2dZCeHI9jmcO/gQlTC87iNWYTbxD+EduPjNIQRnf84JXrx5?=
 =?us-ascii?Q?DVb0qqMhrxrpjz9PfT9wCFQKKKEUm44U9oczlPQOq6oF2vZQudO8PHQVnCdq?=
 =?us-ascii?Q?G6MUzhvpY4TpYXvk+71shc7zbCmiPsGvrbuU8O1cRXOg7crRlN10t2FS6pPx?=
 =?us-ascii?Q?H/URf+WIs2Eo12MkC6i59KtP5v3hkFLxOlau?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hOLXjJm++dSZigjBmxdytoai1Gu5iFMgrgwp3IkdUCfNxaVCWw1kP9d55GDe?=
 =?us-ascii?Q?eAVG/OrsmFo08/pFhZ0b/vt9gFsFYt2P0fl0XH3NZjhRZVp7O9EM32zTCk5s?=
 =?us-ascii?Q?Mqgr/HOR7YrvZa73wpaPbQ24BQfdVRxxKwqRHWkjvaBGgBnudgkK9kD9bNjZ?=
 =?us-ascii?Q?iLhI2evOBvJfZu3uhuLYlN1RdeYyXhI3iLi5pCJXXlmV+dx0N7GCU+xR+FDz?=
 =?us-ascii?Q?Ff4UpZgwbm6PaF13LguNRdSRMe6wTbRb0I9aIx4w/GLsXAFPjb80+IyeDUNz?=
 =?us-ascii?Q?cA22o+m5tZ8SKGV5GJxYv+W8+vLAeCq6ZJWmiyARe9sdDpNyNR1MrUXdjEmx?=
 =?us-ascii?Q?YaiQ18Wok066XgOreYEp9WG5FEzvI+wpUGgoGpC1ggNcH+qc0ZnJDiA2kP9u?=
 =?us-ascii?Q?sJe59Bhx12NdsY68W9WXawQGluz9zMP9egQqeUxQyNa00i7M+wELijzkSwlX?=
 =?us-ascii?Q?e+o/oEqDK/2NQ7bug943F8EGtv84Aaf5FYk6sSrAIpJ+uaeGNVIwcgV/GIW3?=
 =?us-ascii?Q?8/DDMGmnS/kI/JptjwTlsRK1xnAlh/M4h9chjpiy5zKpfv5ZdMFyRwywtDi0?=
 =?us-ascii?Q?sSUBkAjeK7AySLm92DkkhrkPWJS4sb95FxyHLhbQrLSZ2EWWwrcSHIGqOtoU?=
 =?us-ascii?Q?AIvhfl11BAE3sgEph5vCuJ3OLJqUDmIC6IlTUuzGK1aP62itnJIgW5sbFwI4?=
 =?us-ascii?Q?4vbglGXhPKvpdw/CAl7sRXFAZU7ImBg6kL6r5HzadNdpZxIVF0wgzdljn5Cb?=
 =?us-ascii?Q?fw1Vw3tvrJppU9Fa7kxjhhMJWN33iDN0t0WHfMJZaCNhqjT5h3qvTuttKp+2?=
 =?us-ascii?Q?5lX1PiB/gOh08truGJYMjGKwLXikNgTIVMBALaHK44EWqO9RoutRwCV3FF+p?=
 =?us-ascii?Q?ut0O3ZTf3BTCK6UcvU7qTeS+ZaBcKqkj7HZExu2gvqWHZRF+0SlNgsruyKTD?=
 =?us-ascii?Q?Pu6CXDwt57t8aYuOS1VktzgQe6OoqhsbSWOqDO5OIYVEhHBG7qbx2EwsoWMD?=
 =?us-ascii?Q?ou43FrWCpP1rXuRGvWBdfZY0PZEQrhBfA8ubUEjJLLFbjQAI31APHlzKDp4l?=
 =?us-ascii?Q?z9YKMeiGMbXOLJ1xnjxU3A+d6Zymtre6x0kio3yu9VIg4GjhwMmbiShR7IU7?=
 =?us-ascii?Q?aKi4xKIUtmbiB/xhcJYdBqpJZQbsUcjVMklg6SuRCP+YKIN6HpafscMFpuIC?=
 =?us-ascii?Q?BQDUmr5M6AwGTMheeqydiw5rDU96Ge4RDpKnR8Bz2a/sCgyB3PA7HENrv4CJ?=
 =?us-ascii?Q?fjVtzb2Ml/MPSg4SwpkQYsy17lRGpdI/Lh0n7KN8S5Z+/GOzmCpJepFr27G0?=
 =?us-ascii?Q?NLcfzAm799PbkWgvJHrGAXvgMBjFpN6YF1rILi/uYGcTkFz9JAxJxXTpydO1?=
 =?us-ascii?Q?b6v6bcB9Bo/X0kcxPXO4efTx+20QnFKOdC/jqVIyuY72JauvjKvFQaAGSs/H?=
 =?us-ascii?Q?0SiAMym2Og9O8crM6kzhYx3iYVU7TZcAQ66dxHY16KXsKahqp9mB12QzI/hb?=
 =?us-ascii?Q?36lr/5cIPcwf6o2pHnwGzn8kvarF6IdWUkBwwTMV8ipHawSK1oMj9cj6eM7L?=
 =?us-ascii?Q?MQWWRrItMIQrMhrAA9McBpIPUcB392xmKIAef7jUMx/73mu9A12+F6zc6ATv?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a1d2cc-0fbe-4a83-a98b-08de113f3f11
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:27.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9WqMmrNUGMmfxTBJHIgWfTj26T02QMfDRhTFnBXXyQ5NN7NY2pWu5QswbrRlVK8sBLBnH8GqvASJlXvpxz9NQfuZkS0fk9Rl+JSUbN2iHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2918

Add a thermal cooling device for the Wave6 VPU.
The device operates within the Linux thermal framework,
adjusting the VPU performance state based on thermal conditions.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-thermal.c     | 137 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.h     |  25 ++++
 2 files changed, 162 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
new file mode 100644
index 000000000000..9ca4f343187a
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/units.h>
+#include <linux/slab.h>
+#include "wave6-vpu-thermal.h"
+
+static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *thermal,
+					    int state)
+{
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (state > thermal->thermal_max || !thermal->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(thermal->dev, "receive cooling state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(thermal->dev, new_clock_rate);
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(thermal->dev, "failed to set perf to %lu, ret = %d\n",
+			new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_max;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_event;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	thermal->thermal_event = state;
+	wave6_vpu_thermal_cooling_update(thermal, state);
+
+	return 0;
+}
+
+static struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_vpu_cooling_get_max_state,
+	.get_cur_state = wave6_vpu_cooling_get_cur_state,
+	.set_cur_state = wave6_vpu_cooling_set_cur_state,
+};
+
+int wave6_vpu_cooling_init(struct vpu_thermal_cooling *thermal)
+{
+	int i;
+	int num_opps;
+	unsigned long freq;
+
+	if (WARN_ON(!thermal || !thermal->dev))
+		return -EINVAL;
+
+	num_opps = dev_pm_opp_get_opp_count(thermal->dev);
+	if (num_opps <= 0) {
+		dev_err(thermal->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		return -ENODEV;
+	}
+
+	thermal->freq_table = kcalloc(num_opps, sizeof(*thermal->freq_table), GFP_KERNEL);
+	if (!thermal->freq_table)
+		goto error;
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(thermal->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(thermal->dev, "[%d] = %ld\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		thermal->freq_table[i] = freq;
+		thermal->thermal_max = i;
+	}
+
+	if (!thermal->thermal_max)
+		goto error;
+
+	thermal->thermal_event = 0;
+	thermal->cooling = thermal_of_cooling_device_register(thermal->dev->of_node,
+							      dev_name(thermal->dev),
+							      thermal,
+							      &wave6_cooling_ops);
+	if (IS_ERR(thermal->cooling)) {
+		dev_err(thermal->dev, "register cooling device failed\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+	wave6_vpu_cooling_remove(thermal);
+
+	return -EINVAL;
+}
+
+void wave6_vpu_cooling_remove(struct vpu_thermal_cooling *thermal)
+{
+	thermal_cooling_device_unregister(thermal->cooling);
+	kfree(thermal->freq_table);
+	thermal->freq_table = NULL;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
new file mode 100644
index 000000000000..b8c45f6785c5
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#ifndef __WAVE6_VPU_THERMAL_H__
+#define __WAVE6_VPU_THERMAL_H__
+
+#include <linux/thermal.h>
+
+struct vpu_thermal_cooling {
+	struct device *dev;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned long *freq_table;
+};
+
+int wave6_vpu_cooling_init(struct vpu_thermal_cooling *thermal);
+void wave6_vpu_cooling_remove(struct vpu_thermal_cooling *thermal);
+
+#endif /* __WAVE6_VPU_THERMAL_H__ */
-- 
2.31.1


