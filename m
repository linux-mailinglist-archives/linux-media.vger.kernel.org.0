Return-Path: <linux-media+bounces-20979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02BA9BDEAF
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD18285053
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5754C192583;
	Wed,  6 Nov 2024 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AYOv3/Im"
X-Original-To: linux-media@vger.Kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59301917E4
	for <linux-media@vger.Kernel.org>; Wed,  6 Nov 2024 06:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873820; cv=fail; b=jGjCADmoVLLNGFgwvoBuOCmENqlHKAog5SStK1BS3hD5MjvxqcLwnyp9t6C53oY59PbryD/qL0ejClp365fPFe3cPWerZx4O8814LU3/WL66kBpWPtDtDjvU5Rxx5ZEZvPRuZuZSaKuk4Wey3uj1v2+0cHoOScRPr1AJU9QpIKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873820; c=relaxed/simple;
	bh=zHT1KvSiEmLHYc/Wd33yX0TQmlGKLDhSU5F/fGC4A/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lsGgRAcasubQWTi0/FRnlk8z8t7VLVWfs8TLOsq+zHB05AFI9KZpm477ggVq7dD4jVoWER0UE+p2xssxtFzTEcq3VYRsKkslfmRo1hlkechLAUgqOUIx67kJqzG3SGawygPdCQUydOi8Q6StdTeb4B5LBaht3vXfMIYUirVq8kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AYOv3/Im; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEf4f5Q9W2Na8HF6O0RtdKHvCPtQ/BAPU9AHRlhsesm2UgF+EjpIDhUu6wOQxgd85gwaDSeZLcCdKI7A2ixCsenUn3eLWKmDL4+7CDW3LG1b2akg1x2A+2QvasGoIFE+Tr6YJv6ETLiIERnPlBAYyi+C7LcwIiPfH6z4hP5jiqM7pE4pSCYjpu2lsjLR2yNYCt/izgGu0JQbojS71a0FHPk9mplHcDiJpQyBZ7NESr1QN27YC+GCBpyFDf/lDDAngCMQH17JPSpsIkhda7KwCxDa2qRNObsLl2ZQ8w9rovWlEstI2R7sXfjm2z7PTdybCHnw5UMq56YRG4HYjo+0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO2tA97/KHJN4S3MFOlZ0I7sh5dZYw7DkTz5OCKsfw8=;
 b=CLWDhu/P3BilTddQ1jWmT5oEkJWQ39lnSwmfk60vP/NFiKRO1aoP84H+wtd5EAVB0e569Ykrax35xbtf066qxJmBAEVHMASMXeeGl5ssgLnQRORQgIGa43EvV6UIgycj7YsCDwwm/mtBFLbWRvpBJtGo9XCjOqf3S4mUuw42LIb2rSOLZMI7ZUFWM207jxEiC6ZVS1k/mKQC70OerYnzm70+NPX1oOaUkXxre6kSbKgHqohDpWJW06HIWwYTTc/xnHWZnb74NcQGBEoXs4SIHbGvRFEZBk+tLSgfJnU57/Hldrwthf0rx/xiuPmD9GyoBSa2de4wTrwJpt2m2JoO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO2tA97/KHJN4S3MFOlZ0I7sh5dZYw7DkTz5OCKsfw8=;
 b=AYOv3/ImYxLwB0wZaMJo4DCWk/ruB+TV5yyAv8EHlFFbmzgvgm3qbaPRjDcx6MvBd7gvFjoAkK9chLS+x6AESRiCLFM3zQyEon93XFlhchf39dZXl7RPZkjuL8E/GLkcce3LjkB2+2PRc4mdc/3UPfg5bIhmBL6T22tJ6ht3h1y6Mzsr2XQHZupx7wcUacQr7fmxxuOJrZKWEeuu/iFCDNHZ589EJRW4DCOesyYiI/dGWhHhzD/cI2Im+1S6wvvvn/fyk4/jLWLZNSxoGSeoGAGcVVcQSWvi4wq7vsCGOBNcei/uNEfir86t4tgNptCahTWGtspVJe8RbusWW6I3Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 06:16:55 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:16:55 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v3 2/4] v4l-utils: Ignore comma in bracket when getting subopt
Date: Wed,  6 Nov 2024 15:15:35 +0900
Message-ID: <20241106061537.211002-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106061537.211002-1-ming.qian@oss.nxp.com>
References: <20241106061537.211002-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb5006c-df7e-4ffb-f9c0-08dcfe2a9cd9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?a6Wk5Sn5KW3iD1TDG0PbhynTHFidsnqtSpBpp31eYMTRz9VpBACIweHbWwYQ?=
 =?us-ascii?Q?yEIPMFhg2AE1w4ej51OMivRl2wH3/d69FinbG3MFKB8vpLStHmOiJ2fag4WP?=
 =?us-ascii?Q?thr+T7fNtSdTc+oGmYbAkXWFkVBzqBOPx/vArIA1qoLtDW+a7Ijv6anMGAmF?=
 =?us-ascii?Q?/z5nqDYPLbf8o1cd1YafgmCtrf1w3ibA/s32BnjGg5Kn55psp0W1yIAykkiH?=
 =?us-ascii?Q?wLDVO4tgcDD4YyJoO3Z8kMF8lcVcU2GBP8wzFPSc3MlNIS2WTCNPCJRaYK4D?=
 =?us-ascii?Q?ZBv+L81YO+c6k6sL78AZsY5Qwqwqn0xgzadxHetIC6zE91GHe5C4NjXkhNRN?=
 =?us-ascii?Q?9+oVjJUv1ET46sII2jUyWtsvEiltjsT4VcSLfEx7vnuKiVMuiuIgGu/1ds1E?=
 =?us-ascii?Q?O6lb7FEvve8e7TEVTKTOUzJl62apTPERiqhigRtqOjsE3r7XXytIGF4OzFoS?=
 =?us-ascii?Q?Y0MVIT7FEfHNniTG/GmkD7GlpUmQTAInAN4Q2+3a9C38Gxw4Aw9gmYIBjaa2?=
 =?us-ascii?Q?ZfZ9dSot1lNsm3Vlv+2rNDtn3YxAWeXTcxUztIh5M/pM0xgthjNdMBNGm/bK?=
 =?us-ascii?Q?X9fhJjVGlMkFnxhFR39I2MIPNfqbPEh1HdoB8Gbja0uQJIbSqJ8JccCWAKZb?=
 =?us-ascii?Q?16ZdPdBE1qJhrJ7cpUhLCblQkMT9wMbElqLbFhd9Y+c/3kYxAnUTAyxeW6p4?=
 =?us-ascii?Q?7xkqAfK4eNPZBARPE0lfL/GyPDC1mkuoQsTHbs0H5DagxlSTp7jRX3M5IO7G?=
 =?us-ascii?Q?xoB0xC5kAo4JouVPvoJ48HdpEfI3W8LADz0PPzdd/c/FqEtBokkXMHK+9mOR?=
 =?us-ascii?Q?WwgIYRJiLPcrufqupxPwMkztRitfcPfMjmaOnciJqe17DS44txMDlSYRcC1W?=
 =?us-ascii?Q?gHj0GCinqMCMOqQGHcPjt+Eekkx/5JdFqaRCIaOKAc4B9y/Pb1I0K7c1x8Gm?=
 =?us-ascii?Q?kgCzt4ofWKKk7iIsVQSLZ79A9llka66yptN9l361Pg6n6oKOyDdj6tHCLTnG?=
 =?us-ascii?Q?8q/7CKnjfO+ZMocFfdIUIh77BWPINkMx/00GUIXn6gPBEfW24v4JQA69s4Ft?=
 =?us-ascii?Q?7lhs31AT0yOFA7kVcWFKvB8Zr2j5hGYjl3k+0wsHcQpBYZLrBYnO+RUakwRs?=
 =?us-ascii?Q?2BMrFgg6hFmUpoAKWKYgGC9jsqnBXMgExyhhEmAENchGivKBfRC6HJpWZrmx?=
 =?us-ascii?Q?FgQYdVTrebRun4kZwGJDsS/pMGNlwo3soc15mc12BGgeF2BuKo9W6ShqCIZe?=
 =?us-ascii?Q?iq8Dctu56uJDZUy23pcZezDFvXG/Le81BdNYUpQ1o6XhnF49gIH8fL5sMHzB?=
 =?us-ascii?Q?4WbztRkTp7IetWrOuj9UqTAlXUrQIjPyBfdK6YtC4ZK3ftVznPCQ2Qdhpub0?=
 =?us-ascii?Q?/wmwlSw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?23szk9yywh55VSYvNYXuFYYgoZesZ3xXHu9tJebgkwVZhr9Zs1yxPm5IJT/d?=
 =?us-ascii?Q?C+CdvOoSqbLMdPqlq1IlNoUagkc2j9yvzzddHrbjG7ZWV+t9IZsJb7hjUAuX?=
 =?us-ascii?Q?DYX9oAekRrJfYuaMyfgzxh3d9r4RbsSl/ZH4YesElBZhgzk4Oau83k9dJGC0?=
 =?us-ascii?Q?T3yfU3SLQYMUTA1XF0raeXhLkEtC9TS5r3o+cyZEWzCqstuMkVPd4L7EsXVA?=
 =?us-ascii?Q?VDog+0LyrMxJhpAodRYXr2G+oLT/xqOE8g7Y3Lg8AkEj9lkyKxOjWehwqCf+?=
 =?us-ascii?Q?z9X+NiXGvbYa/hWBsbRxogDbYo26nUroWBlpyaGaFfF9rkw5tpLwFOnS25nD?=
 =?us-ascii?Q?h0pVlrVLykrMPfT+WQOLk8znLCUFMfz3/f/tpElbNc3gUtT9iOn5pp6zWAn5?=
 =?us-ascii?Q?Sz3eeJSToqHp7LOuVUTu4Yg7QJGqJh9choygwYm+AXMQ4NbyiQrBgBhP8oD8?=
 =?us-ascii?Q?rTGHlDZg6TUCys/lq8s1DQsHCwg13aGLuO+La5UZUO1DzpZ2L4g4GposvYHa?=
 =?us-ascii?Q?wJTcpgrsOTRr2YXJlQG9ZVGvEoSEIXWUESPF5a/MUyrH/ORUCItXPjziJfvJ?=
 =?us-ascii?Q?qgGx2l9gClCToOqrYrTy+wdFT0XKKToEzyfUuCIw9+Ho+tg6tJGP+QOi8S0e?=
 =?us-ascii?Q?eOF37sfKYj9Rs7vbJDb+LrezKDROxg7oAvW+t+tZc6T/hUwXsNI0V3On3t6c?=
 =?us-ascii?Q?V4K0mPxMPCmmfItjXqTbOqekDUgfhyh7c52iPRJ5yqw5XlotUnwDbSYjcFa3?=
 =?us-ascii?Q?auxYjgygbjWS2tDYm49vXIjNfGunZV79tEQ6W8CBgPiTYLVvL3jTCVwGb26e?=
 =?us-ascii?Q?2cE4Piqdh3Wgg+cxAW1A3498r/jf4PV2UQHWqpTS4EpkwjUhA62iSem/XH0j?=
 =?us-ascii?Q?b6CTMoS30VxSrPdTaGm56joCCJqw3qm1JmxBP3vvGUZzXA/h4grJKA5BiYD4?=
 =?us-ascii?Q?ddNKiPsjA6J+GtZhdjs5LOHdBpUrFC3DNiYpnWcyso1RslbnKEtdMw0lAtlN?=
 =?us-ascii?Q?INpODDRTpDILHd9AiOshJWJ3+TiU3UBKdAgR/8gPS5u7y+4PxKXYAdWbwLtM?=
 =?us-ascii?Q?QVhwGIqDygxe5qwfRMfJGWJlzJp1NirT48C7ijI1gWDrC9O5ryjZpkUGPLTR?=
 =?us-ascii?Q?P3q6gHsCs0h+Dni6ljpOjPCVJ5LCtgqSWkk89Jm7kL3pI5ea+/tCjABBmGhf?=
 =?us-ascii?Q?LhA2RPzj1uof75I3n4/oSXPqf5gS+3FRh6dU7CP8ZRGajPmt2VkcN/Np7oYm?=
 =?us-ascii?Q?G9SV4H8vyAhAiQro/U0rtsmC7cVph6CeYzfVWZcQxLKFr76mNbWFD12fE4bV?=
 =?us-ascii?Q?BPP35R/nLsb6zNzkkIrGJFex6a9uxOSSPR/tY59c3Zb0JFxHBkUg15DaDQ5V?=
 =?us-ascii?Q?dvgpVSs279ks2cxUmSsRdh4Vlh1lx/wB9N9Iu44bFf6/0ueVfYwA0/1zhxJc?=
 =?us-ascii?Q?Ng1rAsQL1OIYeTqqDZgh3/OZ5GocGL3UOzeRqz37DmW7i06KvLCyWSWR/sID?=
 =?us-ascii?Q?/EFiKF8ekSrmfUW1ZV0M3AXBYvHvSYgGfjWGQ02G1E7URQ5w5TjZFLwbAp2e?=
 =?us-ascii?Q?mQ16G48nCNufDJPXRWztzbPVLfJKMy6YC96A8QcM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb5006c-df7e-4ffb-f9c0-08dcfe2a9cd9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:16:55.6441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAYdglkqXgZt5wAtupipQSprplxLSZ25pWlnoz6yNJYE6EKQZQwzimZLMptPvzizSi5I+b0BzrlUqS1BAcS28Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599

From: Ming Qian <ming.qian@oss.nxp.com>

v4l_getsubopt() ignore comma in bracket, then we can set
rect value in the format of (x,y)/WxH.

Add macro GETSUBOPT_IGNORE_COMMA_IN_BRACKET to enable
or disable this feature.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 include/v4l-getsubopt.h | 35 +++++++++++++++++++++++++++++++----
 meson.build             |  1 +
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/v4l-getsubopt.h b/include/v4l-getsubopt.h
index 60e7b9767ab8..4c9cf509fc0f 100644
--- a/include/v4l-getsubopt.h
+++ b/include/v4l-getsubopt.h
@@ -7,12 +7,41 @@
  * So add support for it here, if needed.
  */
 
-#if defined(__GLIBC__)
+#if defined(__GLIBC__) && !defined(GETSUBOPT_IGNORE_COMMA_IN_BRACKET)
 
 #define v4l_getsubopt getsubopt
 
 #else
 
+#include <string.h>
+#include <stdlib.h>
+
+#if defined (GETSUBOPT_IGNORE_COMMA_IN_BRACKET)
+/*
+ * Find the first occurrence of C in S or the final NUL byte.
+ * But ignore the C in brackets
+ */
+static inline char *v4l_strchrnul (const char *s, int c_in)
+{
+  const unsigned char *char_ptr;
+  unsigned char c;
+  int in_brackets = 0;
+
+  c = (unsigned char) c_in;
+
+  char_ptr = (const unsigned char *) s;
+  while (*char_ptr) {
+    if (*char_ptr == '(')
+      in_brackets++;
+    else if (*char_ptr == ')')
+      in_brackets--;
+    else if (*char_ptr == c && in_brackets == 0)
+      break;
+    ++char_ptr;
+  }
+  return (char *) char_ptr;
+}
+#else
 /*
  * Import strchrnul(...) from uClibc version 0.9.33.2 since this feature is
  * missing in the Android C library.
@@ -41,9 +70,6 @@
    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
    02111-1307 USA.  */
 
-#include <string.h>
-#include <stdlib.h>
-
 /* Find the first occurrence of C in S or the final NUL byte.  */
 static inline char *v4l_strchrnul (const char *s, int c_in)
 {
@@ -179,6 +205,7 @@ static inline char *v4l_strchrnul (const char *s, int c_in)
   /* This should never happen.  */
   return NULL;
 }
+#endif
 
 /*
  * Import getsubopt(...) from uClibc version 0.9.33.2 since this feature is
diff --git a/meson.build b/meson.build
index ce6db73c7014..84a863f3ca65 100644
--- a/meson.build
+++ b/meson.build
@@ -46,6 +46,7 @@ common_arguments = [
     '-D_GNU_SOURCE',
     '-DPROMOTED_MODE_T=int',
     '-DENABLE_NLS',
+    '-DGETSUBOPT_IGNORE_COMMA_IN_BRACKET',
     '-include', meson.current_build_dir() / 'config.h',
 ]
 
-- 
2.43.0-rc1


