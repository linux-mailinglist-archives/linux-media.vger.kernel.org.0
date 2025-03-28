Return-Path: <linux-media+bounces-28914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43FA74423
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F6A175109
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 06:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4949C211474;
	Fri, 28 Mar 2025 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UEgWIsJb"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74CCC2C8;
	Fri, 28 Mar 2025 06:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743144542; cv=fail; b=a7BVybt9JTPvNDaOTesxGmCw6vq3vIsOkI3jvjtw3o8dkK1DdmzFLxNXOlyBfLvVS6uTdHuY5RoV3fBuToRj+xhj+KfFXSJmwxgn6Tc0q48O1daW12QuHOlpT8GcWi2MnlIboA6Hlaaw7KjKLsE1qot8HndYg/4JPO9iK+C9OuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743144542; c=relaxed/simple;
	bh=xHZDnYG03wp6BJNxXhjj4caKNy/G6vwR4WxVbbqDVTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s1YR0CSKY4DgEHDPXx3AYJ1yliuBMQ8cfQTgZGQtS9/2eINwfYhAM80ttamZjKhJJoz78JOxjBBkGCkOUtqXXgcYR1VlZM3Usntd01AZULz7xRTS7THweXq1ycQwnlukwAY8DJPI0ijJiGkqMAwbMnHuuwqM+s+zSfzrb8o7gL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UEgWIsJb; arc=fail smtp.client-ip=40.107.104.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdIn/bHZVWLF2fTFTo37SSlvihvU4cqTLFGQB/f03WobGLBwmEwgmN6uwZBD4Jm+3HU+IG3/zoOJ0HMFB9SFRQZQSeypXUovnCOtXT3dboIWkAyONq84Ia0Z0iBBEpC+51l9Bb6zAjuXNfFfgm6VAPr0rSQGtmbE+Z0fJfBLbtoEieTOfYHyyFDsLdaYYS+8VUFIx6KCGFfk+5KtxWqhC6yLfiWysyLep2NbqQTWw7YSsk1x4BTlVT/HO1+WLZ+iHKRbDwsCVOA+BcAge3FP20sZGmNnFbuk9S5t/vehN5cG0k+7/oEVGowxu4eFE4X0+qAr4EXFroHiEgXqb3bAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ljEEqKGIjyiNI+y1MvfBRN/8nfmxQruZGYaWFrDjq8=;
 b=JOD7zNSb8z5F3MslqBKIvrVgi8CpuzUVhHE2QdBe8uhjyazlUgljYlPeeZtUi/op1E3rGNHfuBQzGFqYRhuW4ctFEtfXHe6P8l1fH1+Ek/lhZxRJgLQfgctcYGxtL/h2Hv1yGC5kHHOZaTR3BHVKAz43knd8PGzhTGLH2tyzly9mSAOThTirRNkF2CIOHXdJ0kFygI5AkxyF6B7dx5khb8+HACpJyRDaAT+xaXpjo49zVRS+8QYehjK5ZbkrXTeJMec3jR9V94O+8bEHP/2EBtvZinZg1QnKumpOFqj5RJC7ptY4giGAO8pIVdNlzMPfIuRqS9YjPL4vXUYh0cSK8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ljEEqKGIjyiNI+y1MvfBRN/8nfmxQruZGYaWFrDjq8=;
 b=UEgWIsJbf99OTGUk1KuX8FHblXtk8hsQRzApuyzDIzJK7y7CKz9kS2hzxezulXdz+DJEaXUX7nR6Bgn31h34h+Fq4gShW7HtHUL/Wtg9OmeYeXV6XdxdeYz7r7UgWM/HaUR11WfLqMiIkdmYULhzUIDBog3w4LTbXH2l/EpqlRmiKZztq+kQ90Q3PerLCdpDUdk1DSpp0mOfHFr1RnW2g0QuNcMbsA/CLvgt/Eu0n9bGJrLc47LkZryhwoMdoLwBgwnYaQwwuc4RAOd9b1o6Urgjm6fQ1On5jzpcZmpczlv0yPEhfoxLPYMT41y5U6Gp2qMzkZDiaz0lC5QA1tW0Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:48:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:48:56 +0000
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
Subject: [PATCH v4 2/2] media: amphion: Add a frame flush mode for decoder
Date: Fri, 28 Mar 2025 14:48:17 +0800
Message-ID: <20250328064819.784-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250328064819.784-1-ming.qian@oss.nxp.com>
References: <20250328064819.784-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 17427d67-5c9e-4aa2-4b47-08dd6dc49c8e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lgTmzothLyBbNN4/A9coftnwngCVBiIZcLmmNl9qQyiMG2Voy3/TuFCTY0iV?=
 =?us-ascii?Q?+0QJm8e8KnEt9A17HaFQ7BYSpaDZgNtn4LVccbaLeTpc13zP80bB7Q5LgNRa?=
 =?us-ascii?Q?lT3kwi8lM4soy0w8G244Gd+d7SoOTusi80hLbLmwfBqFovRMFaRJ/rcGELth?=
 =?us-ascii?Q?RrFu4TdVQzPPyETjvdpXKfCWDU21bcb+RAS/ecN3j/hvFUSB8RBmXzOM94u3?=
 =?us-ascii?Q?pJisKMXZ8xHmTfPu+SG4+NpKmnMCM8VXWdAZCKDiYs0mgLvHecMEZEe/YWGV?=
 =?us-ascii?Q?LLZEwkjv7mEn3z1lJYTKOwXyvlPGw2sxrkTTpWdzgufCynfmD9+KWscYNDZH?=
 =?us-ascii?Q?RbbOrH/CU/jowzpepvsjmN4wzDpyLGEVXNHuqZJ8w099DMvtiT911uRI2Sbn?=
 =?us-ascii?Q?olyN0jr8C/Q5ndW5tGewvxINAf32QZcj2cITevQciqetjXzKFnM7XjeoZRbu?=
 =?us-ascii?Q?G5rVe9RtPDw9Tw1vCZAFD5Pb1jUhjHMYhEEA+FMOgtIoYVXfS7ErfwI743ux?=
 =?us-ascii?Q?8zHiK+vwKrRDp0MAOKOG28FjNtZ/wrD1gNZgcYhr7Pzc9fEetTLN5liogERe?=
 =?us-ascii?Q?K8dT1seQIaX4HEvNJ44tq73cQT/+87Hup4DBraugHtxUC59jiLJnlKy+UQKo?=
 =?us-ascii?Q?ftltI2H2MQvoyw7xs0mOrZlc/jcVWjzyk00ECgXxbvUY3B+P0CEiFPTTuL2l?=
 =?us-ascii?Q?+sxHZCga5D1VepcohIRQNMl+uszuqk5UvQYR9C7wgQzb/u/DXeXFwg4LoduV?=
 =?us-ascii?Q?iML/Ca6yDOnI1p4zm8xrlS3fvJ2ctDL8VYY3xECdCunLPag1ZyzaBwaro+y6?=
 =?us-ascii?Q?jhNSC+sbvf+izR2vOBHkx3AQsBtImOE/MTaC4I2tTfRnDkkL7/FGKdH65moq?=
 =?us-ascii?Q?IX3Tewcu/L7Z/S/9CUjcQ+Qt7XdywjS0vz1c6u41RrKz7+EeIvjKMqez9sm1?=
 =?us-ascii?Q?Y027b0jK2ZOUUXawKwuBUJtiZNF0h4O4DAr26gk/p+a0IinB0zrN7MCfv9t+?=
 =?us-ascii?Q?JqxBhlSiWIRiQCc1OttcEwbR4ZIgLOHtRUS+pISzxnaFNi7RBtaGYj0u/0Es?=
 =?us-ascii?Q?CMwN9xtIF+q21ydtINmfSPU2LgTGZtW8MmgG1KndhEjt5TlrSMmJAKbBLpBs?=
 =?us-ascii?Q?f5g6GOgMLF0oPcZpvuhVOZ4x/8avqMJsSOZ6D5nURHfuaC00g54smwBLX9GR?=
 =?us-ascii?Q?WYRQ7aWFHt7c2phLzR5iZ9TzrBljKnvOnFbr34jjCuvaS2H/3Wl8n55iYdn0?=
 =?us-ascii?Q?739SBBXXplhY4GN4YswEM2vjBbRwVC5ju7ENVTIq88xc5XdEmJZYyFmlPlzM?=
 =?us-ascii?Q?9G2d5fga63Wqk2gvTiOQPGRQ/2Lj2qJsmxo3MJthwUZ39Lbpk3dk09knRMiW?=
 =?us-ascii?Q?q2ASCS/pWiISWEISEgaklWcJ3oGuHXbt/ynfpdmfHlO4ms3mFwFcLoAg8kjl?=
 =?us-ascii?Q?zzmfRmuA7oWmFOosXiHjAYicOQ0pzVGs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zKjr7T9qGBTIIgg+ZsnBprmyp63Goi/f7lx4BRWUfcEDxIwr4qikQuQZ+DBa?=
 =?us-ascii?Q?0DKPM/LztwGlMpCYgi+TKNIsGFWe5hmUUUYi9Ojo1w/IrZ7s7eJuxSlClYsS?=
 =?us-ascii?Q?/uqAGQkPE5DMtarpVzm57TNIfoLRvra0XM7fq+KKxVc1t/HrN9eITEz1KAJA?=
 =?us-ascii?Q?U8+CkhgKehZSZefztspNpnVLPG1K89qg8Rt/WJLooEGzuGz79DSdu/J/SMeP?=
 =?us-ascii?Q?LPBSLEIGXWnIE9wOHSck+2DylCPNUQJDfHEiAPe4vel3ja9U+/uwdSTNvJWj?=
 =?us-ascii?Q?jxwcX88g9Z4qmgCZS4AcHKrCie/malGMe3JRDfwjK0AdYNzbrvCxi9l4YXs7?=
 =?us-ascii?Q?VuGDd9VHYuRnmqWrrHOXE76UUQJJAgWxacmGy8WQ7KnTszdzZvTz2YMkmDk4?=
 =?us-ascii?Q?YT23zISZwmVP5vTaHKqGvUrQgkbjdZHYcdgjiPwmzGuR6kmKlRRkfP3hDrsh?=
 =?us-ascii?Q?PbOmaqKvJjj2kQ0xd61VBAhMrBcpZd5vZNgsnjrden8Gqb0XwoXXs3iEIgd+?=
 =?us-ascii?Q?eF0TJvwqGt9vPwLgXmv2j+La+rhxwrNP7fgYsuwDdUa3sWWsqGI38K3w7rFu?=
 =?us-ascii?Q?YoP/Xm51X5le5TRiC44tq/0PzqCyORSlNEGLPd+9dCBrFL00flb2YcmYzgle?=
 =?us-ascii?Q?/s+qxcBbOG3eAi72JA1bvjbtJGxh9H09mE4Tj3QemL8pR2Lu4L5qUoHn2FjV?=
 =?us-ascii?Q?bbV2B/RlSJyDdml8PM9r68ymzU7sNT/2DqbJXcUIAR9MxgskUr0pNLugIXg1?=
 =?us-ascii?Q?P1sWfVs7tgwlCokxwxx7tUi4nBW+dbMoR7oXR0yIDClpeos0dgZ0keACFVlE?=
 =?us-ascii?Q?QW/4g+8M3t6L3YiZnWTE1mQtCcOHUXqBniNxGEOCW5p8+qeZ0Lx8tQN0rWlr?=
 =?us-ascii?Q?HaGf/za4kLRVGilngNDMOnw9HYBKO8MwCyFOsnkWuhugIRkHYoze1C+T/5He?=
 =?us-ascii?Q?FtbMkKXJq3+kYwLIzLlGRxgw+wM1K+iBscazYOZo6iScHUgPvgA9dXwFWY8B?=
 =?us-ascii?Q?4gy0tuk6SN3b2e0UKXhRBRs2A2I0q5HH9a3w5WmuLu/BKUx1NFYF5Lcs6Em7?=
 =?us-ascii?Q?gPQNAh+fyvF2xd6yxmon30uLJQT/BNM46FRt6f8zWp+tYH98+IdJVE1f+pgz?=
 =?us-ascii?Q?nMKYU5983FWa1U7mHrUKNVx0xXVFOb8gdZrlSngyGHEDGHSM12oWAjeyj8ku?=
 =?us-ascii?Q?AjsINT5vZME4BjLCrkiYqyh3Nk0GE8/fGgSYk7rSwk1natUETprvPqf+oY3O?=
 =?us-ascii?Q?WUMzeEGHYZf4CIqM76w1NZRjDwSTSLWOpCSiWxsIgaG8xKMvXFeRGMJ1Qrs3?=
 =?us-ascii?Q?ZLMDBFVFsKAxP9qjyETAdl+Y7Z5N9nWltC1dqy0wNpAoFB81BwpmqF4UnLsD?=
 =?us-ascii?Q?NJzidJysCzkWqrBO9EEJo5acC9VqQ0Ff4IC4LjfbKVRoxy7S+cvilvot8zwH?=
 =?us-ascii?Q?puGUJ5N56u4ATCX8d5nTuwkrSWTTWD8Vs816aF8ISWCc79os8ypYJKb7cksM?=
 =?us-ascii?Q?80H/QH5PaEz8O1FAToozBvhaOzoYDJNgDFM3/sBPwesBuke1RqT0ssxKGX0i?=
 =?us-ascii?Q?dFrg4jCjiuLd6WabXoaNq7daXeFpgPl9wSOPJrRB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17427d67-5c9e-4aa2-4b47-08dd6dc49c8e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:48:56.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7or76MARvzfGCfLo69MgHxqgxt8f3KrtG9VhE7fwyyvB4q8MkaY9fUxNm+utSmwB57zrXCj8UeZuF8Y0Hn6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

From: Ming Qian <ming.qian@oss.nxp.com>

By default the amphion decoder will pre-parse 3 frames before starting
to decode the first frame. Alternatively, a block of flush padding data
can be appended to the frame, which will ensure that the decoder can
start decoding immediately after parsing the flush padding data, thus
potentially reducing decoding latency.

This mode was previously only enabled, when the display delay was set to
0. Allow the user to manually toggle the use of that mode via a module
parameter called low_latency, which enables the mode without
changing the display order.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v4
- Improve the comment expressing
v3
- Improve commit message as recommended
- Add some comments to avoid code looks cryptic

 drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 88f8c16a451e..7f6251f7becb 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -25,6 +25,10 @@
 #include "vpu_imx8q.h"
 #include "vpu_malone.h"
 
+static bool low_latency;
+module_param(low_latency, bool, 0644);
+MODULE_PARM_DESC(low_latency, "Set low latency frame flush mode: 0 (disable) or 1 (enable)");
+
 #define CMD_SIZE			25600
 #define MSG_SIZE			25600
 #define CODEC_SIZE			0x1000
@@ -1581,7 +1585,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 
 	vpu_malone_update_wptr(str_buf, wptr);
 
-	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
+	/*
+	 * Enable the low latency flush mode if display delay is set to 0
+	 * or the low latency frame flush mode if it is set to 1.
+	 * The low latency flush mode requires some padding data to be appended to each frame,
+	 * but there must not be any padding data between the sequence header and the frame.
+	 * This module is currently only supported for the H264 and HEVC formats,
+	 * for other formats, vpu_malone_add_scode() will return 0.
+	 */
+	if ((disp_imm || low_latency) && !vpu_vb_is_codecconfig(vbuf)) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
-- 
2.43.0-rc1


