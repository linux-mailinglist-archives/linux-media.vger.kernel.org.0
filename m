Return-Path: <linux-media+bounces-45199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1BBFAAAB
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6BE18C7D93
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A091D2FE560;
	Wed, 22 Oct 2025 07:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="UD1IT7bM"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021119.outbound.protection.outlook.com [40.107.42.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1F2FDC2C;
	Wed, 22 Oct 2025 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119256; cv=fail; b=DkTf65k9I1BnZgO/AwxwnRcWNBKeBaYIvxkAMRGIH6Ps5XmLHljWUFc3wfsrK5lUMCIKThUcmkQYVJM5jRiDzydAAeuwmkyMeviYvvTeycwcfUjlgEWQD2KcDe3q4kvPF6lEWftFku40wBfwgXIWTEjbwlYbJ3fN2wL68ef49V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119256; c=relaxed/simple;
	bh=BMM0aHujh/bEanN989RVtTVr3G8EEMS4yOQsZhTtffE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S2f+UUls6xPmm5pzxruwzseytuEpXdBHMKgBZyLgCFucktelQzjbsHjto1zN7K59ZtqzcqYsqQs4BXU1yb2Y9mYKeAA2w2GzJ6e8xKPngFquUFTKbL0e5DNVKDTmuhIAOfc19abFN6PrvI7BLtJK8kR2s0FaxiyjncZ2R6phd+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=UD1IT7bM; arc=fail smtp.client-ip=40.107.42.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5tt0WmNKmBdE/8NvXb8igmCz6cSl6r2oSuLv4VslZpSvBPqAGYjBPxU53BL/UO++Aiz/ZRP7vin5Jcup64+jhR5ioBhKlga42m4sw0pMQo5uUrEW2fEftVpgfTgnZtgz4FZ7T0sJobFfXgrNZBhBHAjSugM6XiS0jYuFjzFphJOeMsvj+PBUQ0vd763gB8z0eAYasS2qkRmA6PQlnR+p5GUEWxwe0ALZfaFXpCUaWShLpSTrrTIw/14PuWXBowdQift04d2jAoqL34OuPVKX0GWg1cVK/lOxCi0JgEPMYDaWPVNqnzffAatPPFYEafWd5DwsL2CoVOLOOSedTECZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4qjSumPl5a5uajT7ZHQbXDOGcVVKBtbY4xN3dK/ns4=;
 b=gwN+LIdDcIsTpmIWmSSJq3Iy9FWbOpvTO66isl8vfwAgkjcJcklx4qGdWDhdNQ7l4H+kWaDskxiP9MH+hFFEnMq9f9zpzmseu4eukG0mS18X/9vtRHeQSxF/EVzk0RTbyA6JziQ1NgfZlD9dc0pCfl387YKfJoWhzvngMmNF+FgByd5E7oQ6ji3Ap3jk3tKKSvR1lpoDGZ9p1zxFYtnOkQS5wLiE6mofMif1fgwJghtQxD5D0Edf0QLfRf/jCuQW9Hq/NI9k+Z1ekEzDOJLfXi2XUQhGU0RjpSANRAx15DiFiiTaRL44WnDWTaEtinTo5UKCrLfSxKXW2zeRLEXDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4qjSumPl5a5uajT7ZHQbXDOGcVVKBtbY4xN3dK/ns4=;
 b=UD1IT7bM1PkO2nWT2HLeEb7xBYaDT12EqLjswR2g9ubk6iDNOvwDC5yTFE5dvz3/d5cNs0rDGyoN6VZ6IQ9wuNSVOO1wFiog5R6jrTwHLtEmkAA2oYKWVqwR2+q0LYZhqLuf69UAPMGjS1PQrlsj2UvikZ0n0yRIy2WFCu59oj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2918.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Wed, 22 Oct 2025 07:47:27 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:26 +0000
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
Subject: [PATCH v4 6/9] media: chips-media: wave6: Improve debugging capabilities
Date: Wed, 22 Oct 2025 16:47:07 +0900
Message-Id: <20251022074710.575-7-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5d4afd3e-11e1-48b3-c432-08de113f3eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WBvev6vzRGbyeq+DKFSgfB9YnreGB4DAFQt2ZZC3/lqrHlR4IVNBjRj4M85+?=
 =?us-ascii?Q?CGRdvyZMCvrSqPq3GOQARgwzyW+e0CJtibJ2u3TFjJWoPX0nPvBD6xb33wey?=
 =?us-ascii?Q?L9YmvpN+iftKgG2b8YXdHtIwDq9Q4Shh5Z5HxDJh/VSC3hG++ZvPaAn9reyh?=
 =?us-ascii?Q?rSbhEa9x4rqG354Okm9QGX3FE0Bktrx0oZ7BEW6qr5eLI1lAW78k6C5QCDdf?=
 =?us-ascii?Q?CI6Mc4CRu6xGHpp3ErRGGHCsXMOEjVcaINOzmXCNSrJZNYJKfkg+XxlD42jb?=
 =?us-ascii?Q?m6CyUeEVXdjs+b34IYVLR1icDXcMe6pLZ/YwuZFKk521QzF2onnfnH9T9eDi?=
 =?us-ascii?Q?L5cqmHDi1itTOxclr4IVRBJXYPN9F4ncQIW0zlA6tk2j87gWItIl+AYJqMou?=
 =?us-ascii?Q?JX4Qe0zzSGZlVCsHDG/cC26rWasD48KoU8nzsR2l1dVeCe/Z/oD6DHPUh0Fm?=
 =?us-ascii?Q?WD1Yt7PwylENVos/RYSAmv3XGkeF2LFLl+Ou5H3bvmuk4USr2xTX+1Ki1BoG?=
 =?us-ascii?Q?608z9gnqGyLIQIDarH+RWmSbqD2nRWMFlfOQX0w7ULvUs7CmO8gfxImFhMQQ?=
 =?us-ascii?Q?/lq6tmoBtcS37cwF+ukqitskHRlOqsJYmdYbNqLxd8hJV7zTNfTvdMAVD7tv?=
 =?us-ascii?Q?tPxsGHMxJBX3czM3NjJZKRIciFkyrbZg5qTQK2qFIRjsYZbTH55PHLTO+SFO?=
 =?us-ascii?Q?g3DXtLLKTg3A7WjTgr7arp3dCuo/U/M/EWphHCXC9KYomFHvt/m8uYfNu0XD?=
 =?us-ascii?Q?4I25W4U9igKhNdAMIt/KVmYPIuUCT3WKtNuQD/zuExiQu7FRY09Icgv3Lyxu?=
 =?us-ascii?Q?dHhS7rOs0I6yk40x+BOmQnCFCpaHCwWRS/oQWk8IVeMTtvyZgtHJlYlT1iew?=
 =?us-ascii?Q?ve5qnnN38WMwPMTXP/qDO5ga8/efFbArll9Pa0opZ5nY4vDia2G3Kl7Rb2Bz?=
 =?us-ascii?Q?H6e6JBEIuFu3okY2WdjZdJJl+r26xYN28g1e1HCOsK6prYL3y/WaXPds2ycf?=
 =?us-ascii?Q?0MtXz/fvRs9SNXD10aQInR51hjxB6LhTPEMSIvz6veDGzuJRqCtZGMLwSpNz?=
 =?us-ascii?Q?o/BHk8keAXv+i7VcEVf2olQrISaps1oHyetBJ4m0nOHIfq6gjqxj2yHlBnhj?=
 =?us-ascii?Q?PZUDsCvlZsVxuDuSNce1xE6hPSI2BycUXGILqxabYaEmxddpgSTAw4P9AASX?=
 =?us-ascii?Q?zyD3uJnGR4uKy3+8j5vTfZKnRCMLnM4OSgulB2dZ+qg5eH8Ig+KWlBf8jjVh?=
 =?us-ascii?Q?D8xTVl9gOsl5YyaGFO7vcjj28RCbBEAVKeXwtqcVCCm/3xp6XjduJdtskT0/?=
 =?us-ascii?Q?dlZloYTkbLXARa4Nuo5tzZXOloAQbJOxbKvuaI5BqrL4Tt3ne+eVru84b4Xq?=
 =?us-ascii?Q?JcLjW/ely8e2QgeMTpszdM461P3itqZor9RhXUX4AVwLmpI6a+CY1ArfJ0lX?=
 =?us-ascii?Q?huimZZleLklEKX+Ml84OceHMPzIHQQkW0X3T/n1s+RtbXsdlBieCSJFG2uka?=
 =?us-ascii?Q?xD/H7PkfDz3Vn9p7t4KeK4Pegj36LwBcfMtp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ErXAB8IlWUz9TN0WRik9UNqQRVkRnMxaRVIJHo4aXS9A1ywUkKqxyWvPZNw2?=
 =?us-ascii?Q?1x3ZWKAwbcMnjk/SGmfcnANltbQMuhkUwMssftWGvAVApWSccQCNyduHW3zL?=
 =?us-ascii?Q?ErMcNMQidw+LZ4qElJvcf2GGG6c3Qw4iQftRti6UtSzpEGleVjWLwae1B5Tl?=
 =?us-ascii?Q?aF1uAeDr9GYvtzXg0lCfzPisgtUsR+qCpBVp9I6fgKkZDt9RqCKMN1+ZPUud?=
 =?us-ascii?Q?DOw2kxQ+KPD5D206zIvlVQoUyQAYyB1hBybuFcMlyWUwreEPG06hLrApdLrq?=
 =?us-ascii?Q?fBS1uSX97MH9p76tfER6kkKZFB8Mz2UEQRn2sPM0oYfScQINw+TBYqVDMFtw?=
 =?us-ascii?Q?YY4ZwMsrNBj6ssJkgFz5r1iKA2KL+jXG1bhhduW+Ksktj2jKA59vWhvUukPr?=
 =?us-ascii?Q?L3Amd5c/uZ6andTj2QRRJa5S+LoGon64aKu7zPrYekpqOjmYNigXMjKNyvBU?=
 =?us-ascii?Q?RSdZJqp3niTSRgKTDLK8Vef0+KNMHgStUU7qobu2muPj6fuOUXyH5UK4dqkC?=
 =?us-ascii?Q?K9WPhH261Ap0K3Y3QscGlt8Pi11S9ACGbxTVjfMFXwq3uWOPT1pkkZ59Hd8+?=
 =?us-ascii?Q?92vGMtTHy7g1ZsdcMnVht6k/xBa4m8KMKuAG5vvjfHmyarOHIu872hX+QhoV?=
 =?us-ascii?Q?05uvCf9EYv3pZ12nAbzZggG31RrH1hNYHhw/Heoavs9YYB3XIeY9el38DWNR?=
 =?us-ascii?Q?L1mKQhhdHXDDGlk9dTF+kvVV9fNYSeJCkwc5W3ERKaP2bVwmHaaiGD15+mgJ?=
 =?us-ascii?Q?26uou5FiZ1qF4EPHcOJ+o6DwYUU+Y+AnNa3WCZWpKIJZUYpyLZ7DHVyL+zxS?=
 =?us-ascii?Q?GRwPtPPKQfzMGyauDxTBH2LG7QNPYogv5NpCJLUI80UbOa6YcrecKM809nBD?=
 =?us-ascii?Q?poUeZuKNw28pbBNq3qlXO/f5DzM6SiPgEKPku8GKP8eME9Je/Xu6QD6o0O4L?=
 =?us-ascii?Q?e8iYKqUjkCk6urugCrwjIunzXR6zpXZQhQMfhsuylGcbpDBD+h52tGtXJoGW?=
 =?us-ascii?Q?a3EagFzreTqerqwg1yuqdUfwJOU5bwuvEnqsR1oT4pkf4XhGh6d5henuk59I?=
 =?us-ascii?Q?6aZF6Gx6zeGKhYBZno47WmAaVg4MDehxJKvdBx+S/ryvhs5M6oAeas3p8cgY?=
 =?us-ascii?Q?hkOg9Kqs97zp3eDxd4vyl85AdZXZDFEr7+CgsWSrjpuMXMcYWxsDfeCWw8uA?=
 =?us-ascii?Q?x3lEw1mAHwZuWKnFO4LkFucy+CaiUA/BpPu87+/oZghu9X64k4dAbnOpYJzc?=
 =?us-ascii?Q?ykgevpAxFqchGSYwmCW4+M+j5ft+XvJmpGYu+Tj0kCCWCg62Q4+owlqPFhGu?=
 =?us-ascii?Q?QzbmLh/OiRcCbIWKUDPvERkbcnHgX14595e1Fq/yCylzZSpZdaWEx6QsAu7F?=
 =?us-ascii?Q?H84opd65Y+SXIoa+lC0w4CWXfAPTXWbhcfIalVhgZGuTJhzkmi+Y/WON/Rrf?=
 =?us-ascii?Q?8Iql/bv/TXMFIW40i6W8MrPCCAfxgjFOpT5KvwDJTj8EUjz6tCWDmv93PKWa?=
 =?us-ascii?Q?GO2nlgidVEOswQ8KQ1Q+yw7jzmv4E5Mg5Y7PmcofdL7s8mI9DIQYJme56mZQ?=
 =?us-ascii?Q?W4zHZzLrSU7aSkac7k0450a0/JRiQsRgAJh1KnSKkdWDaSWncgHTzzCpk8jj?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4afd3e-11e1-48b3-c432-08de113f3eca
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:26.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUUHvm4kq4E6kaAHfV+fgOf2+isCY6YGKPOgKWesXCy6Q6NJSPaUajDDekdZn+NwYFzIV0KGEkyolYsvZsuClekd6fGkgyV4YdALg3JfFyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2918

Add debugfs entries and trace events to provide detailed
debugging information.
These enhancements help diagnose issues and improve debugging
capabilities for the Wave6 core driver.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../platform/chips-media/wave6/wave6-trace.h  | 289 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.c         | 225 ++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.h         |  14 +
 3 files changed, 528 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
new file mode 100644
index 000000000000..2c80923e2f29
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
@@ -0,0 +1,289 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver tracer
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM wave6
+
+#if !defined(__WAVE6_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __WAVE6_TRACE_H__
+
+#include <linux/tracepoint.h>
+#include <media/videobuf2-v4l2.h>
+
+DECLARE_EVENT_CLASS(wave6_vpu_register_access,
+		    TP_PROTO(struct device *dev, u32 addr, u32 value),
+		    TP_ARGS(dev, addr, value),
+		    TP_STRUCT__entry(__string(name, dev_name(dev))
+				     __field(u32, addr)
+				     __field(u32, value)),
+		    TP_fast_assign(__assign_str(name);
+				   __entry->addr = addr;
+				   __entry->value = value;),
+		    TP_printk("%s:0x%03x 0x%08x",
+			      __get_str(name), __entry->addr, __entry->value));
+
+DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_writel,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+DEFINE_EVENT(wave6_vpu_register_access, wave6_vpu_readl,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+
+TRACE_EVENT(wave6_vpu_send_command,
+	    TP_PROTO(struct vpu_core_device *core, u32 id, u32 std, u32 cmd),
+	    TP_ARGS(core, id, std, cmd),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, id)
+			     __field(u32, std)
+			     __field(u32, cmd)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = id;
+			   __entry->std = std;
+			   __entry->cmd = cmd;),
+	    TP_printk("%s: inst id %d, std 0x%x, cmd 0x%x",
+		      __get_str(name), __entry->id,
+		      __entry->std, __entry->cmd));
+
+TRACE_EVENT(wave6_vpu_irq,
+	    TP_PROTO(struct vpu_core_device *core, u32 irq, u32 idc),
+	    TP_ARGS(core, irq, idc),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, irq)
+			     __field(u32, idc)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->irq = irq;
+			   __entry->idc = idc;),
+	    TP_printk("%s: irq 0x%x, idc 0x%x",
+		      __get_str(name), __entry->irq, __entry->idc));
+
+TRACE_EVENT(wave6_vpu_set_state,
+	    TP_PROTO(struct vpu_instance *inst, u32 state),
+	    TP_ARGS(inst, state),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __string(cur_state, wave6_vpu_instance_state_name(inst->state))
+			     __string(nxt_state, wave6_vpu_instance_state_name(state))),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __assign_str(cur_state);
+			   __assign_str(nxt_state);),
+	    TP_printk("%s: inst[%d] set state %s -> %s",
+		      __get_str(name), __entry->id,
+		      __get_str(cur_state), __get_str(nxt_state)));
+
+DECLARE_EVENT_CLASS(wave6_vpu_inst_internal,
+		    TP_PROTO(struct vpu_instance *inst, bool is_out),
+		    TP_ARGS(inst, is_out),
+		    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+				     __field(u32, id)
+				     __string(type, is_out ? "output" : "capture")
+				     __field(u32, pixelformat)
+				     __field(u32, width)
+				     __field(u32, height)
+				     __field(u32, buf_cnt_src)
+				     __field(u32, buf_cnt_dst)
+				     __field(u32, processed_cnt)
+				     __field(u32, error_cnt)),
+		    TP_fast_assign(__assign_str(name);
+				   __entry->id = inst->id;
+				   __assign_str(type);
+				   __entry->pixelformat = is_out ? inst->src_fmt.pixelformat :
+								   inst->dst_fmt.pixelformat;
+				   __entry->width = is_out ? inst->src_fmt.width :
+							     inst->dst_fmt.width;
+				   __entry->height = is_out ? inst->src_fmt.height :
+							      inst->dst_fmt.height;
+				   __entry->buf_cnt_src = inst->queued_src_buf_num;
+				   __entry->buf_cnt_dst = inst->queued_dst_buf_num;
+				   __entry->processed_cnt = inst->processed_buf_num;
+				   __entry->error_cnt = inst->error_buf_num;),
+		    TP_printk("%s: inst[%d] %s %c%c%c%c %dx%d, input %d, %d, process %d, error %d",
+			      __get_str(name), __entry->id, __get_str(type),
+			      __entry->pixelformat,
+			      __entry->pixelformat >> 8,
+			      __entry->pixelformat >> 16,
+			      __entry->pixelformat >> 24,
+			      __entry->width, __entry->height,
+			      __entry->buf_cnt_src, __entry->buf_cnt_dst,
+			      __entry->processed_cnt, __entry->error_cnt));
+
+DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_start_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+DEFINE_EVENT(wave6_vpu_inst_internal, wave6_vpu_stop_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+TRACE_EVENT(wave6_vpu_dec_pic,
+	    TP_PROTO(struct vpu_instance *inst, u32 srcidx, u32 size),
+	    TP_ARGS(inst, srcidx, size),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, start)
+			     __field(u32, size)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = srcidx;
+			   __entry->start = inst->codec_info->dec_info.stream_rd_ptr;
+			   __entry->size = size;),
+	    TP_printk("%s: inst[%d] src[%2d] %8x, %d",
+		      __get_str(name), __entry->id,
+		      __entry->srcidx, __entry->start, __entry->size));
+
+TRACE_EVENT(wave6_vpu_source_change,
+	    TP_PROTO(struct vpu_instance *inst, struct dec_seq_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, width)
+			     __field(u32, height)
+			     __field(u32, profile)
+			     __field(u32, level)
+			     __field(u32, tier)
+			     __field(u32, min_fb_cnt)
+			     __field(u32, disp_delay)
+			     __field(u32, quantization)
+			     __field(u32, colorspace)
+			     __field(u32, xfer_func)
+			     __field(u32, ycbcr_enc)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->width = info->pic_width,
+			   __entry->height = info->pic_height,
+			   __entry->profile = info->profile,
+			   __entry->level = info->level;
+			   __entry->tier = info->tier;
+			   __entry->min_fb_cnt = info->min_frame_buffer_count;
+			   __entry->disp_delay = info->frame_buf_delay;
+			   __entry->quantization = inst->quantization;
+			   __entry->colorspace = inst->colorspace;
+			   __entry->xfer_func = inst->xfer_func;
+			   __entry->ycbcr_enc = inst->ycbcr_enc;),
+	    TP_printk("%s: inst[%d] %dx%d profile %d %d %d min_fb %d delay %d color %d %d %d %d",
+		      __get_str(name), __entry->id,
+		      __entry->width, __entry->height,
+		      __entry->profile, __entry->level, __entry->tier,
+		      __entry->min_fb_cnt, __entry->disp_delay,
+		      __entry->quantization, __entry->colorspace,
+		      __entry->xfer_func, __entry->ycbcr_enc));
+
+TRACE_EVENT(wave6_vpu_dec_done,
+	    TP_PROTO(struct vpu_instance *inst, struct dec_output_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, dec_flag)
+			     __field(u32, dec_poc)
+			     __field(u32, disp_flag)
+			     __field(u32, disp_cnt)
+			     __field(u32, rel_cnt)
+			     __field(u32, src_ch)
+			     __field(u32, eos)
+			     __field(u32, error)
+			     __field(u32, warn)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->dec_flag = info->frame_decoded;
+			   __entry->dec_poc = info->decoded_poc;
+			   __entry->disp_flag = info->frame_display;
+			   __entry->disp_cnt = info->disp_frame_num;
+			   __entry->rel_cnt = info->release_disp_frame_num;
+			   __entry->src_ch = info->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE;
+			   __entry->eos = info->stream_end;
+			   __entry->error = info->error_reason;
+			   __entry->warn = info->warn_info;),
+	    TP_printk("%s: inst[%d] dec %d %d disp %d(%d) rel %d src_ch %d eos %d error 0x%x 0x%x",
+		      __get_str(name), __entry->id,
+		      __entry->dec_flag, __entry->dec_poc,
+		      __entry->disp_flag, __entry->disp_cnt,
+		      __entry->rel_cnt,
+		      __entry->src_ch, __entry->eos,
+		      __entry->error, __entry->warn));
+
+TRACE_EVENT(wave6_vpu_enc_pic,
+	    TP_PROTO(struct vpu_instance *inst, struct enc_param *param),
+	    TP_ARGS(inst, param),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, buf_y)
+			     __field(u32, buf_cb)
+			     __field(u32, buf_cr)
+			     __field(u32, stride)
+			     __field(u32, buf_strm)
+			     __field(u32, size_strm)
+			     __field(u32, force_type_enable)
+			     __field(u32, force_type)
+			     __field(u32, end_flag)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = param->src_idx;
+			   __entry->buf_y = param->source_frame->buf_y;
+			   __entry->buf_cb = param->source_frame->buf_cb;
+			   __entry->buf_cr = param->source_frame->buf_cr;
+			   __entry->stride = param->source_frame->stride;
+			   __entry->buf_strm = param->pic_stream_buffer_addr;
+			   __entry->size_strm = param->pic_stream_buffer_size;
+			   __entry->force_type_enable = param->force_pic;
+			   __entry->force_type = param->force_pic_type;
+			   __entry->end_flag = param->src_end;),
+	    TP_printk("%s: inst[%d] src[%2d] %8x %8x %8x(%d) dst %8x(%d) force type %d(%d) end %d",
+		      __get_str(name), __entry->id, __entry->srcidx,
+		      __entry->buf_y, __entry->buf_cb, __entry->buf_cr,
+		      __entry->stride, __entry->buf_strm, __entry->size_strm,
+		      __entry->force_type_enable, __entry->force_type,
+		      __entry->end_flag));
+
+TRACE_EVENT(wave6_vpu_enc_done,
+	    TP_PROTO(struct vpu_instance *inst, struct enc_output_info *info),
+	    TP_ARGS(inst, info),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __field(u32, srcidx)
+			     __field(u32, frmidx)
+			     __field(u32, size)
+			     __field(u32, type)
+			     __field(u32, avg_qp)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __entry->srcidx = info->enc_src_idx;
+			   __entry->frmidx = info->recon_frame_index;
+			   __entry->size = info->bitstream_size;
+			   __entry->type = info->pic_type;
+			   __entry->avg_qp = info->avg_ctu_qp;),
+	    TP_printk("%s: inst[%d] src %d, frame %d, size %d, type %d, qp %d, eos %d",
+		      __get_str(name), __entry->id,
+		      __entry->srcidx, __entry->frmidx,
+		      __entry->size, __entry->type, __entry->avg_qp,
+		      __entry->frmidx == RECON_IDX_FLAG_ENC_END));
+
+TRACE_EVENT(wave6_vpu_s_ctrl,
+	    TP_PROTO(struct vpu_instance *inst, struct v4l2_ctrl *ctrl),
+	    TP_ARGS(inst, ctrl),
+	    TP_STRUCT__entry(__string(name, dev_name(inst->dev->dev))
+			     __field(u32, id)
+			     __string(ctrl_name, ctrl->name)
+			     __field(u32, val)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->id = inst->id;
+			   __assign_str(ctrl_name);
+			   __entry->val = ctrl->val;),
+	    TP_printk("%s: inst[%d] %s = %d",
+		      __get_str(name), __entry->id,
+		      __get_str(ctrl_name), __entry->val));
+
+#endif /* __WAVE6_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE wave6-trace
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
new file mode 100644
index 000000000000..7f04060f0aea
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - debug interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+
+static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
+{
+	struct vpu_instance *inst = s->private;
+	struct vpu_performance_info *perf = &inst->performance;
+	struct vb2_queue *vq;
+	char str[128];
+	int num;
+	s64 tmp;
+	s64 fps;
+
+	if (!inst->v4l2_fh.m2m_ctx)
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "[%s]\n",
+			inst->type == VPU_INST_TYPE_DEC ? "Decoder" : "Encoder");
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "%s : product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+			dev_name(inst->dev->dev),
+			inst->dev->attr.product_code,
+			FW_VERSION_MAJOR(inst->dev->attr.fw_version),
+			FW_VERSION_MINOR(inst->dev->attr.fw_version),
+			FW_VERSION_REL(inst->dev->attr.fw_version),
+			inst->dev->attr.fw_revision,
+			inst->dev->attr.hw_version);
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "state = %s\n",
+			wave6_vpu_instance_state_name(inst->state));
+	if (seq_write(s, str, num))
+		return 0;
+
+	vq = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+	num = scnprintf(str, sizeof(str),
+			"output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
+			vb2_is_streaming(vq),
+			vb2_get_num_buffers(vq),
+			inst->src_fmt.pixelformat,
+			inst->src_fmt.pixelformat >> 8,
+			inst->src_fmt.pixelformat >> 16,
+			inst->src_fmt.pixelformat >> 24,
+			inst->src_fmt.width,
+			inst->src_fmt.height,
+			vq->last_buffer_dequeued);
+	if (seq_write(s, str, num))
+		return 0;
+
+	vq = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	num = scnprintf(str, sizeof(str),
+			"capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;\n",
+			vb2_is_streaming(vq),
+			vb2_get_num_buffers(vq),
+			inst->dst_fmt.pixelformat,
+			inst->dst_fmt.pixelformat >> 8,
+			inst->dst_fmt.pixelformat >> 16,
+			inst->dst_fmt.pixelformat >> 24,
+			inst->dst_fmt.width,
+			inst->dst_fmt.height,
+			vq->last_buffer_dequeued);
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "crop: (%d, %d) %d x %d\n",
+			inst->crop.left,
+			inst->crop.top,
+			inst->crop.width,
+			inst->crop.height);
+	if (seq_write(s, str, num))
+		return 0;
+
+	if (inst->scaler_info.enable) {
+		num = scnprintf(str, sizeof(str), "scale: %d x %d\n",
+				inst->scaler_info.width, inst->scaler_info.height);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+
+	num = scnprintf(str, sizeof(str),
+			"queued src %d, dst %d, process %d, sequence %d, error %d, drain %d:%d\n",
+			inst->queued_src_buf_num,
+			inst->queued_dst_buf_num,
+			inst->processed_buf_num,
+			inst->sequence,
+			inst->error_buf_num,
+			inst->v4l2_fh.m2m_ctx->out_q_ctx.buffered,
+			inst->eos);
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "fps");
+	if (seq_write(s, str, num))
+		return 0;
+	tmp = MSEC_PER_SEC * inst->processed_buf_num;
+	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
+		fps = DIV_ROUND_CLOSEST(tmp, (perf->ts_last - perf->ts_first) / NSEC_PER_MSEC);
+		num = scnprintf(str, sizeof(str), " actual: %lld;", fps);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+	if (perf->total_sw_time) {
+		fps = DIV_ROUND_CLOSEST(tmp, perf->total_sw_time / NSEC_PER_MSEC);
+		num = scnprintf(str, sizeof(str), " sw: %lld;", fps);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+	if (perf->total_hw_time) {
+		fps = DIV_ROUND_CLOSEST(tmp, perf->total_hw_time / NSEC_PER_MSEC);
+		num = scnprintf(str, sizeof(str), " hw: %lld", fps);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+	num = scnprintf(str, sizeof(str), "\n");
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str),
+			"latency(ms) first: %llu.%06llu, max %llu.%06llu, setup %llu.%06llu\n",
+			perf->latency_first / NSEC_PER_MSEC,
+			perf->latency_first % NSEC_PER_MSEC,
+			perf->latency_max / NSEC_PER_MSEC,
+			perf->latency_max % NSEC_PER_MSEC,
+			(perf->ts_first - perf->ts_start) / NSEC_PER_MSEC,
+			(perf->ts_first - perf->ts_start) % NSEC_PER_MSEC);
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str),
+			"process frame time(ms) min: %llu.%06llu, max %llu.%06llu\n",
+			perf->min_process_time / NSEC_PER_MSEC,
+			perf->min_process_time % NSEC_PER_MSEC,
+			perf->max_process_time / NSEC_PER_MSEC,
+			perf->max_process_time % NSEC_PER_MSEC);
+	if (seq_write(s, str, num))
+		return 0;
+
+	if (inst->type == VPU_INST_TYPE_DEC) {
+		num = scnprintf(str, sizeof(str), "%s order\n",
+				inst->disp_mode == DISP_MODE_DISP_ORDER ? "display" : "decode");
+		if (seq_write(s, str, num))
+			return 0;
+	} else {
+		struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+		struct enc_codec_param *param = &p_enc_info->open_param.codec_param;
+
+		num = scnprintf(str, sizeof(str), "profile %d, level %d, tier %d\n",
+				param->profile, param->level, param->tier);
+		if (seq_write(s, str, num))
+			return 0;
+
+		num = scnprintf(str, sizeof(str), "frame_rate %d, idr_period %d, intra_period %d\n",
+				param->frame_rate, param->idr_period, param->intra_period);
+		if (seq_write(s, str, num))
+			return 0;
+
+		num = scnprintf(str, sizeof(str), "rc %d, mode %d, bitrate %d\n",
+				param->en_rate_control,
+				param->rc_mode,
+				param->bitrate);
+		if (seq_write(s, str, num))
+			return 0;
+
+		num = scnprintf(str, sizeof(str),
+				"qp %d, i_qp [%d, %d], p_qp [%d, %d], b_qp [%d, %d]\n",
+				param->qp,
+				param->min_qp_i, param->max_qp_i,
+				param->min_qp_p, param->max_qp_p,
+				param->min_qp_b, param->max_qp_b);
+		if (seq_write(s, str, num))
+			return 0;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dbg_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, wave6_vpu_dbg_instance, inode->i_private);
+}
+
+static const struct file_operations wave6_vpu_dbg_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_dbg_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst)
+{
+	char name[64];
+
+	if (WARN_ON(!inst || !inst->dev || IS_ERR_OR_NULL(inst->dev->debugfs)))
+		return -EINVAL;
+
+	scnprintf(name, sizeof(name), "instance.%d", inst->id);
+	inst->debugfs = debugfs_create_file((const char *)name,
+					    VERIFY_OCTAL_PERMISSIONS(0444),
+					    inst->dev->debugfs,
+					    inst,
+					    &wave6_vpu_dbg_fops);
+
+	return 0;
+}
+
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst)
+{
+	if (WARN_ON(!inst || !inst->debugfs))
+		return;
+
+	debugfs_remove(inst->debugfs);
+	inst->debugfs = NULL;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
new file mode 100644
index 000000000000..6453eb2de76f
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - debug interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_DBG_H__
+#define __WAVE6_VPU_DBG_H__
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_DBG_H__ */
-- 
2.31.1


