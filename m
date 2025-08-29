Return-Path: <linux-media+bounces-41312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C6B3B64C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF873653CF
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277BE2BEC32;
	Fri, 29 Aug 2025 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Hf98pMvk"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022100.outbound.protection.outlook.com [40.107.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC4D2D2395;
	Fri, 29 Aug 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457261; cv=fail; b=DqXzVar93bvbeY03EA8HCgsE3i3aOw4ZxS7Oz9yv6V1SI6s9BtHnzuaOrE0zSPySFrQBdMWITrWLihDl8Ml+csxdYYbSD4mqBsXv5jAJyhzGF1aJrFwWrui9nDKCmcj5vqs9p+DgLacpRteWq6n+vCWk4HtVbZDx2gxuLY4mIJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457261; c=relaxed/simple;
	bh=UNa94SUQQtsJl8/AmcBQmMJQuTjw21PfiwvcBaUMcUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eebjK06GHJREfw5yfF339sY7eJHfRU2T737fyiSPAmSXyArX6zRFdiGpHOV/M2yitbHpheXnyrX3IscLRGjRS+JUz5JXME4AuhMNco81w3Ihzhspp7G0KxoEEjCAcqtziyCzyxbisFzwIhIyA4jKJrnXUfHrE82eKh5iUFha3Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Hf98pMvk; arc=fail smtp.client-ip=40.107.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSM4YOfOXQWEcMbEYzuRrgCJ5pWZc1oBPIkk/5ooHtelZ5rBVAEukwlj2uwoxkOrUZ+QODLKN/APmG+luu4L+IF+UaQVgxKsrByxSvmeiFLmmchdX5THj6tYv+GzifVvt9XTKn7IlKAfCy9uLGzdv5mRdnU3FtmLBWDd0zJW9Yn3Kyqp0VcKmvEyPx8hrVd4rVr9lNrzODxbouyWVGP/6mlzKtUzLqGga1xe2f8aP02JM2SV1LXo27w3pm5Yt41sdjvB/16M9gZwQZgg/WhiKBtUFm9Ea4kUS2v+IV4CJhzA845/ssPIaN7sababAlbTlB3qh3MYT72sKvkssKDuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh9QCNFJfNFhwiBZNCNlc80dY4kQBlBV/EZpfUHCPtQ=;
 b=fYG7SXfzr4WQjBu2Uv+LnBTcyQNYmvAeL6aiVij6ua6Pq4+kZCt5G/sWjlLlgrUCSdaSpYugmmqbl2y9Gpx6ZKtErF3JCI7Rto3orSyjJNlEoK4rr5Z4freZB7HQPh741Z0OSudKMOf756kzFzVXVXpRETgEDmn2Z5eKl/R2oP/iqiRbt/YEQEzzGmYn88Yjnn8tGePvaVJDhmgc7NnMXIj1gwwDPnz2J/Li/KsrOdHHE78qJz6ewkGCSyDnCsOmMsahZuX4G7CXVkPr8SudQbD2OSEW3/ppnbCLZglwAS4AlxqKztGmE/qRHVpQAxeyZf6nHNLohJJFT+T7skT07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh9QCNFJfNFhwiBZNCNlc80dY4kQBlBV/EZpfUHCPtQ=;
 b=Hf98pMvkCF8AnkQPD4hDNrw9pbBKUxep1O7BvLOnYEFeLNn1JBO7l5d9E7doRIz1v1yYUA2pNxVTYiMUoiILFh1EYQ8GJE26hHnoNog42CblQKzTdrEucCLtHaW1hSJM7Or2qD3nMtqgrjoS4gxszB4g0vr6aCd0U/juxSkqMR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB3039.KORP216.PROD.OUTLOOK.COM (2603:1096:101:283::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:26 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:26 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v3 6/9] media: chips-media: wave6: Improve debugging capabilities
Date: Fri, 29 Aug 2025 17:46:46 +0900
Message-Id: <20250829084649.359-7-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250829084649.359-1-nas.chung@chipsnmedia.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB3039:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c3bcd2-6e48-4c37-969d-08dde6d8adcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Eka9H0GDJawGVDNEmEER6XHwyYFpPMllDiFPNjfSk5+FWTZT/jtp2gtQ2J/a?=
 =?us-ascii?Q?PxEt3ZE6C3BbiuGL+ZAhusZQAORlE8vG5aaQRsJGPtFr+1zZlKm5n1LyuigD?=
 =?us-ascii?Q?QhzHGDMpyGd1y12d+QonkXraEkVWHuHY/Ad2f1X0SuJs4PQDZg5jV3LV62Gn?=
 =?us-ascii?Q?QUpxv8FEvw+dRe5mk7bThenvMPivVZpgwDl8dFdISYqihr/6za5Y/65754PY?=
 =?us-ascii?Q?EwCcJ2eFqHmSFXjxwEnOPh0dUltilIqHf5EpVKpGw+x2hcjIBrmkEpjdMAxh?=
 =?us-ascii?Q?1aoNSuzFKYz+VQSMQnCKluJ1fY2pyXJvXNqERHyfFNzQiWqOi1S6I1MiP2pr?=
 =?us-ascii?Q?p8jTOYpvc+upRxjWIa6o549fXCAl5ug5gwCf6eCb+ZDOgveNTuuV2ivi2k8/?=
 =?us-ascii?Q?2F8KxVgiu2xVbpb7PPnZ4hyfPgznpWvhjnq4t3xmrACNkRzlFg9WiH6GYf1a?=
 =?us-ascii?Q?MetIRAdRW/fY/kO4q6+K7wt90UXMxC13h+OdWI6HFWfuFJspHir5XBITxtX6?=
 =?us-ascii?Q?Y0E92q2rBeubD2CHrsrncR/y+rFiiqea0Xyba50uAF1QUyCCdKqbjBlkoaAn?=
 =?us-ascii?Q?6Rhx5T48iIS0pv79Rp5Ya64sqBObVnHxEYxm+o3c71ZzNY6JpHsahBIOQvZ3?=
 =?us-ascii?Q?aEfNFFbL8FE8hrKuHbQZ25SZKB8AxN7cLj7zsZ5hauGEQeoUSprRGWYegVuL?=
 =?us-ascii?Q?yn6ehkwd3d7zzBF1pdL//9xvSUL9US9q1jqQu+gcikNhULk/4MZEjaaijKdM?=
 =?us-ascii?Q?GgcEIdSQ6IyGp/KKJSDeIctrOAr4M7uHroZ+9J5UoHvBuoeB2OLv3FVSZbVu?=
 =?us-ascii?Q?WDLs57rZMD6JybsJJtB42tZykNzMHYL3XHQg3MyvKJz3pVFIkSz6npu4Z2Gw?=
 =?us-ascii?Q?vMoRESYdWao3xAX5piBzbC097RcpjIQ7WGe5bQFPbTcqQ90Y75jiyH2fFhVV?=
 =?us-ascii?Q?Zv/tsPXl6GDgys7goJIyYeZfSQtUrlXa3zOADc/XJE+7OJJfMSCoYr+DtAts?=
 =?us-ascii?Q?NFN9Qf9IYX7juDKwThNrlNR5cEzJQG8NhnFrmUmN/FcT/izRXFCiHiZSGE9k?=
 =?us-ascii?Q?XrahVVRnpNm0hPdAqoi6lSYsjD8aG1hYW0cIi1EOp7kqyuzuibzyRukKPVsx?=
 =?us-ascii?Q?fyiHskLTDjbnRsFwC3dL7RvrL7RTmR/6Z+TVkJxj3jO8C1siLQOw5qcpSzRx?=
 =?us-ascii?Q?dsMAh9r2qVQjBTVa0/F0S2jikVAZE2BWqTk+yHqXFcp4p+289s4Pyuj21Ad1?=
 =?us-ascii?Q?GifrHVy3Vn3sfUHzO0w6bduXN8aYHv0oVZLuLk5os+PQXb6rUdyCxjK61uTx?=
 =?us-ascii?Q?5B2X5lWFcPHJtKuwBp3Blsm+pRkOPVfxyC/cJ6v0izf/2EgZoU9xRjq49KCB?=
 =?us-ascii?Q?8N8LaQRKcTa6F8Ukiw46ZuuNcjpffv0yRO1CjafyD7GlbJXuewfxEtwJ/BHS?=
 =?us-ascii?Q?3a9McVmV0fYRPGGJl4QSpVffRglFsVkE927UlE/LkNjZRmyYfEWxrg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8jbZxyRG+2azwjetpuQHtJlcSWo2RUGwLYZy0xdc5o5jfri0JmwryUiLelUW?=
 =?us-ascii?Q?jgMQDA7VkqteL8Bck28SwCoDy3MAtybg4V70NEj/61eecRn0pDrPgGCjLKM0?=
 =?us-ascii?Q?ZxzMgddUCpJ3tACkbYSC60BcM0ItWiLzeuVukRzjfmgecjoS5Jg9EX9jpm7h?=
 =?us-ascii?Q?YKsyNZjJIL/Dn0xqLGqlIUbGV4sFqBhlWjXNMD4koCTnXtxdIDZbQhThHmr3?=
 =?us-ascii?Q?4U+AGWbBd1tL4Ur5LMbNQcio7uXiNvm4BPOVPvuexNzCwzgpCq/epvTJAe4e?=
 =?us-ascii?Q?kYo9yLna+MfteCovq9SLGdZrxdayHHFLIp+tikqp5pDGb+yNPsJMv1Bp9qD6?=
 =?us-ascii?Q?uahEoZXem4DSKhQhxQxaSrHjPFf1oad4B7iEH0DVWFrsqCQpL4Dgg+8ZjeDs?=
 =?us-ascii?Q?HnzgIAkt8e8NqS2rXsjTPgAgNd2Caa7GTtPXiRUqSBlkEVUTe64xGLtjwI3Q?=
 =?us-ascii?Q?1VQ+ht18ux/bTEMb6ulPONaure1r8p8tL6mov+D0Aktj7tdSjQQgU0PqT8bh?=
 =?us-ascii?Q?cDKpOFWeZyjss554l593lpBqatBP+AimK/1Ix7NwRxyhUfP763SiHhoXYiTd?=
 =?us-ascii?Q?/dpoBeu6Nzi9qKxzBUnTw6fpYJbIr1UlwjBxHizlD2gPi5YtcDUTNONZt1Sg?=
 =?us-ascii?Q?EkqaseQGc5SuXUl8BP5FzL8PFby5I1Z8iuBjbf+6Ags484a9kVWfm6yWRBQ7?=
 =?us-ascii?Q?wt4WJFDdlvCpgVDkiVJ5br1AodpiRET3vIsPwsIy2vYF2UvSag1W9p1Ag6lc?=
 =?us-ascii?Q?YBmdholw/EI6soa7LoeBwxWq/u6Z+S0TPe1HZsX4ObkDer0Wm440bXneF4G9?=
 =?us-ascii?Q?2jhb9zKuYURHMuoYD04DiQ0HouHoP1hEQryqqeAMKpKpMh0jRk5TxQq8WWS4?=
 =?us-ascii?Q?vJ5Ex4efPL4qas3ZTmPm735VfVyA3lylKjvE2VEz9hFiqR+xR5cCyptrwGb9?=
 =?us-ascii?Q?2NY2AKS145UBf8B684Z14KcXAXrauvs6JTFPRJSfgHzvq2CeAuJoxLFSMijG?=
 =?us-ascii?Q?Kkij+zLVFj4+Gv14bjmrBC6/8wHIUWFGv3SkJdJmFGAKkguu1LhzcuZUzSHC?=
 =?us-ascii?Q?N84xNN1haDdXNbA1ErLoUh9mrsU7CCDnnm7JH7ZtZke1MK7aoIDN4FJ/uwKC?=
 =?us-ascii?Q?7nAvZt1OG3tfExCB0+9ExfAG/89kw1rXlh7kA39AVCgdkBvkQ2LrRzPnmjhe?=
 =?us-ascii?Q?hkQSp63NORD7zm2kdaZjusvxq6i8h1WJq2bg0ZcWEaajS2GTiJiCSbYxb7OD?=
 =?us-ascii?Q?kg3kqevdy1T/r6U9MNsUJfeAgcNP0cisvufr67oIp1s8WoXKsoKAQfOdH4v7?=
 =?us-ascii?Q?G/Nz1OYlCygFiRD810vWZEa00DG2RfuoN9iG/ZcgSEIEthcmimm6Vg4E3/b1?=
 =?us-ascii?Q?u2wIwzNnnmz0wVD7N+PSk0AQEJfwmSiT2NVjOYfrvjdTL3MlysuII63kdIZ2?=
 =?us-ascii?Q?AZYoC9TgsiNvS9qzheCJSOXKQBXtMx8bwoWZw4tobbcxc4g6vlBcv89kRLHc?=
 =?us-ascii?Q?7jP9nwQ2CE+06iNePbeiF17m811LwD98xl+zB7VbSZ2odara6JrnBO4LLqyc?=
 =?us-ascii?Q?gbcCUjAuKcThA1UkaQ5DxonZRvXBE4kTeygNFkWZ7TwboBwQsFa+Q57P2rrA?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c3bcd2-6e48-4c37-969d-08dde6d8adcc
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:26.2604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JItHeqQBpUjqSg5wiJwEnr4bVpOu3EtpsEJThwbkm3lMxCKlA/zQfvXG+/btOp488c8xVXc0Q7N+WU04rETntSk1SGMMPqNPYzGLUrCfeHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3039

This adds debugfs entries and trace events to provide detailed
debugging information.
These enhancements help diagnose issues and improve debugging
capabilities for the Wave6 core driver.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../platform/chips-media/wave6/wave6-trace.h  | 286 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.c         | 225 ++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.h         |  14 +
 3 files changed, 525 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
new file mode 100644
index 000000000000..74227a059ca8
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
@@ -0,0 +1,286 @@
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
+DECLARE_EVENT_CLASS(register_access,
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
+DEFINE_EVENT(register_access, writel,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+DEFINE_EVENT(register_access, readl,
+	     TP_PROTO(struct device *dev, u32 addr, u32 value),
+	     TP_ARGS(dev, addr, value));
+
+TRACE_EVENT(send_command,
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
+TRACE_EVENT(irq,
+	    TP_PROTO(struct vpu_core_device *core, u32 irq),
+	    TP_ARGS(core, irq),
+	    TP_STRUCT__entry(__string(name, dev_name(core->dev))
+			     __field(u32, irq)),
+	    TP_fast_assign(__assign_str(name);
+			   __entry->irq = irq;),
+	    TP_printk("%s: irq 0x%x", __get_str(name), __entry->irq));
+
+TRACE_EVENT(set_state,
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
+DECLARE_EVENT_CLASS(inst_internal,
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
+DEFINE_EVENT(inst_internal, start_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+DEFINE_EVENT(inst_internal, stop_streaming,
+	     TP_PROTO(struct vpu_instance *inst, bool is_out),
+	     TP_ARGS(inst, is_out));
+
+TRACE_EVENT(dec_pic,
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
+TRACE_EVENT(source_change,
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
+TRACE_EVENT(dec_done,
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
+TRACE_EVENT(enc_pic,
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
+TRACE_EVENT(enc_done,
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
+TRACE_EVENT(s_ctrl,
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


