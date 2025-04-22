Return-Path: <linux-media+bounces-30693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAEA9646B
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F71C3A3C96
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4048420B7F4;
	Tue, 22 Apr 2025 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="SQEE61sa"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020072.outbound.protection.outlook.com [52.101.156.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A9F202F79;
	Tue, 22 Apr 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314309; cv=fail; b=d1QzmyaKDXpICNhoz2+3bA6SIwpiL1Sp/VpQzEXHPuBGc148cqMGSlNUqJdVMg8pT8OhXRCjETPVEa4WegJKsekE4xRwkNPvz2U+vJVgt4oSiryH4PoKMBYke2fQ1qQRG8g66d3rCZJQjwuznBRtXsLSgbmSK6LwY/0t3A48VAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314309; c=relaxed/simple;
	bh=AIQ/5DKkQMm6DtvjmKnTR+ZtBy+W6Jec5tuyI5lRiQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9XAXaGPqCUNIoH64zAfDv9Mt7sCsqblDejpcTkw0YiiT6Fkws/H9uog25wLysDh25RRUg004TbLRuM8rnxAwnTvA5gUEVOv9SxqmkBT4+KW3m2q6HS569uwjXB7nm7rRA5lHV+DYaLzq9bJMqw7e78dziG61buCwoI3mo0peCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=SQEE61sa; arc=fail smtp.client-ip=52.101.156.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGhDUoACJJrD7mT5ElTst1ds7+6sge4HucAagcBXFQg1A3Izt+HXZC80+J3jI8ysq8S35h2nk/DkdGvzs/2sIKHq1nD5qjEUVzBD3gJGNktfPHYXGgNBO5iuPSkTuK7yQ3Zr49jJP5c9I9bGsfmSSnNVeHjjFy0JVCrfrE569eZGef+QyZNf+r3MVI5c6iRsPCsaCx/lmoPkk8a0L47H8dQEy+IWqE3Pil5UnBSkJubpMMHcgztcJvK0Mw4nH2Lq0CEJtPvzOlYFrMoECK+2kt9Qjjh1N/MG0H71XYVkqtfJr5Bo58uiSOk1BF88z8FyPCw87GeQJt3FS1out8+aUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+N4TpxLRrGgeXa2rhEIq/bSgqpBgBSr8WrtLE9SwHow=;
 b=chOW4fXpfmfR4zfiJxY1PbfSFjlZJ2a+u5+sU6lYxdhlM3esdZbiNpY7mqeWyGgnJhkLwNYs44u2pSeKru7zFLncdMVfviVXT/IpuL1iIGfZVTvLJaUiRL2L/wEvgwUuB79Itkh3xLAk/X//VC9BpGZMwcfTYhdvcq/nOkioRog3Q5I9oLjK2fADD1B5PGeEGylKlBHtoBf6wyu7WdgJlFnEa/qqvTWVApdnHxGbiFXXlnnwu6f7jpZdKb1K6nlbQkcEb561GrmEj/iZBmjK4vpy5d2KNBxlGW64WKZw1LjaMw85zpQtfYLxX41gqCsqiOKdGzJzecTS90JWbhBZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N4TpxLRrGgeXa2rhEIq/bSgqpBgBSr8WrtLE9SwHow=;
 b=SQEE61sacdAzFj0cjyrxS/tj2MrYg6iQ7hvl5dQarE4kJ6ez5/XoGvh3T71LnKaWJB1Q2BpvoO6fdNIn9PTakOTZ5+5tjEI6+x7wGVmn8x8wKJwy8ocCRSNUhluhvI15nWWQlXjoaJyGS0vWEZFCwvMPTpY/yKJhuI8BRQHWAXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:38 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:38 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	marex@denx.de,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v2 6/8] media: chips-media: wave6: Improve debugging capabilities
Date: Tue, 22 Apr 2025 18:31:17 +0900
Message-Id: <20250422093119.595-7-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4efc4b-af1b-442e-7159-08dd81807b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EMylFqXgDrT7cmK11U6sHEVgnN+p5ofMH2ke1ZfG9byNZGk+diFDix9DIxnD?=
 =?us-ascii?Q?/HT+JoSxR7hRjKTYPV2LKghM8ZlRmQ33QJCACNxcUTrz/dBg5YwIx6hWO6TK?=
 =?us-ascii?Q?b3PTDy2j6GRu1QvyD7xJ/myaJFmTngJI3Bj7Jd6L0zSHF/feRmXcjbTSpPVx?=
 =?us-ascii?Q?lI6x7noznSCXV/eBAw99E3HMAdWUCCgQr/JCsrWr/N4l3s5fkhZyG9oPwi4h?=
 =?us-ascii?Q?9LNZqSAx5/40ylZyYkuQdaUzVuE8ahCiaAhVVmFkrBErPI1ITN6LZAG0VuiC?=
 =?us-ascii?Q?xg2eV9WAnbs0CpZpNnpifi+tBWSBgr+C/G2TiYk1OS1R4QPZ9fdQaiPAaygl?=
 =?us-ascii?Q?hA4X1NjHGe2RnC9orWDSQPGlaE+vnj6rRicL7+qNz+yCdlaPbWduEf/Zi5sX?=
 =?us-ascii?Q?o7UcDnZR+Fl+C/3Hs3C5iZ/deHtX9Y9HI5fAIM7Jc2khPsJCzKUkJ1k3sQCq?=
 =?us-ascii?Q?s+46LnA4+LK7OIMqJlHJxPla7WhzVf+hsMgfqzPCUyIISDVvpYnLl1SzXlst?=
 =?us-ascii?Q?pPON8Upg7kls+Kjq/P9jfb8WUahZWcA/sk7/s6rXk5R+MRrKKrO5l1uDhPxJ?=
 =?us-ascii?Q?dsolxIQ4pSWgHtpWCiOVp4JlfljeVcY0TCLM/OmTK3kabR4+dFksvnUgmz4r?=
 =?us-ascii?Q?4EJeOgH77+y8ybCNJoT9J6tErfdumPsKUrayBRas8TN75Spnn7Db5eAn+QMY?=
 =?us-ascii?Q?+VW0dFJZMJBZFxG5BAV/9Q6BebCl2hWcdE7zUf1eOZNmyvBlC2md9B2uZY9W?=
 =?us-ascii?Q?VCeODInuZj9kh4DYQ81ElKbe5WPMhCVyznt+AGXBcjiueflttO1/ik1hwGHs?=
 =?us-ascii?Q?gFi01K3dyInHU7bLJtGdswKjp3SBN04WLU5CfF85/pNgbh4kDts1Iq+sMhcp?=
 =?us-ascii?Q?pZljX3ILEnFrsXHSvqx1jBXWhvi98mXEuwainLp71HzBqcA2ADftPsPXWJta?=
 =?us-ascii?Q?XW1V3NYExxy/F0350TPIbaR8rFP0pEcdhS5V6Hh23732KAJMotRLNfEWoRXH?=
 =?us-ascii?Q?F+3JpKgB27wjNwV1cjcMe881/d3S0PCLOayVeRLG0s6r3gKHf5aaJxgdxVfd?=
 =?us-ascii?Q?8OJcxgmXrMJFjUXkjx1C2YgdPGCSOuwmAoavw9rsnIdt2VJimAqkgQEChTZK?=
 =?us-ascii?Q?5vtjUI0nxReqYUjQb1J+oWhdVP4Cqwh/PkdYWVMYALnJVEWzOBZiIIyS1ZDJ?=
 =?us-ascii?Q?wFS8naKHOANGbue8XpPC473rmRdTh5893kawXu46SeNledKsbYbwh3jjrjC8?=
 =?us-ascii?Q?5G1blzJ2KBZpYGZDzO7MAE1HMPCjOpDkKZubxl348ud9BV28f6kjIlYJYO8/?=
 =?us-ascii?Q?O6zbGXbZqCrmHfHJRp+xu+2ZRXSeso3KJoduzIAD4SYNcNQzSIkbVxxi2LPB?=
 =?us-ascii?Q?742Y9SRpC408CG5y6cr1kK8w02n+PxDyAVb6/34TP1DhFcqnMIAWuDCY2Yng?=
 =?us-ascii?Q?ZA3JVGWGzCjpnfGNJah7wy4+twy19wcRxpl9SSm9TVyMnlfMImCchQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?72k6NUMDZpzH3XTmbIXFXA2YQ9brXD0lr4oyhTcduxPuZVYhvviIQutKiqWr?=
 =?us-ascii?Q?Hedz6/1JXTieILp5RQEp94qkkxwLSh1Ygnv9iDlt0/5N523flofWN+bEiN7G?=
 =?us-ascii?Q?uGtmWU6ncmsdau4J3Jrux8qzM9/BfAnobxgpI68VZhOO4x1xKXbK+vi+Iqxd?=
 =?us-ascii?Q?QBhjin93/j/Mb/QU13FBjAwI7esID4bxl0wt8UAuaD6L4KHEnbo52smE/ySU?=
 =?us-ascii?Q?I3J5F0Cxz0EIRcW3IeFWWk86aafHgYPixi9apr15pJFb+fqgFEYSjiIGT8qT?=
 =?us-ascii?Q?FUhuJ2uXczORVXRUSbjGjAI0btP9U21ixJElYY1xIlYtGxdPvVwlNttT9hAV?=
 =?us-ascii?Q?qPy6zdbo9A2lVyIbwxlGh/c44qsfm/yXzVd4w6CgCWXUm1+9eZOfPaHnp14F?=
 =?us-ascii?Q?mqMuNs8iAitdS5C9i/3UNnLhk59GZRnQCq6F7IjxCtzuG2B7JPdzjxEpLQho?=
 =?us-ascii?Q?Vs3oRKkNcfGRHCSyxZLklrRD66vevRvT0fo4h18t515fwV2lkEqGfdMNj/+N?=
 =?us-ascii?Q?5LSveFxwsr3o5WgnZsmij6xfNUjsa9v9LjNbq/Z1qPs0UEkjnME9rD8PJsEB?=
 =?us-ascii?Q?ixlOmx81wnOX2byidLITIuJSZp9zlzGrbdz6ItmUG1s7CCwMBB9MYyBSGYIh?=
 =?us-ascii?Q?ZaVlhdJChcZgEmcqrifE5gRJixyBQ2cVFRCUxowWi/CkOodF4O/QcW2R2uuT?=
 =?us-ascii?Q?dCj/78gQP6w/VJRoOAlTT0rZG1Hkd3m9zxQn5dBNCIcDZCl/0N7NUNEM0tt1?=
 =?us-ascii?Q?q0R+5YIkcdZZXK6i3tt2esU9ffvXkp1zzc9Ncyk1XuQwN7RKwEzcAu1MOcLm?=
 =?us-ascii?Q?WwYSGsmzC6gF+OnTG4mbjH1okJ1lk9XbrKYhZGiMVVNH89lq0eRndHfoLsxg?=
 =?us-ascii?Q?2APVO/y0pv3MOKymlRsIBhgWFAkioJHk/1CPHLLecjILcSzngOjWd2ykoynf?=
 =?us-ascii?Q?DCJ8VyTK9t7Ux8tqKQw4v+domL3SljgIvVibAWP8S5WcJCwUlBgb9PGvKiMW?=
 =?us-ascii?Q?tUeQPyy4d6V7gU88eoATTz+yj11aBEZ/Kwg5e1TcdUaQARQytd1eiYwY+kDw?=
 =?us-ascii?Q?NJ3v3XnLBhOcPewhlIz6Hk1hoPw7tAEyQ5VmECP229FPzau0dgHUDubi0fVh?=
 =?us-ascii?Q?avVuWNMiIZQUXUu52wOh7NCTDad2LKmx+oS7JswKtbBaLh+zVoneejsQHfhD?=
 =?us-ascii?Q?7kdtVuFhqDweqOcBEtt2T2I0RRR2D9FHUDigqk9MqCxm2pnH5nHurIAh8Gp+?=
 =?us-ascii?Q?Gwg3FN/SQQyiSsi/NtFOQ1AGkDPq+fV2rmSdMvl23lO6vO65YPSWwDXbUB8R?=
 =?us-ascii?Q?bV6dGNHVM44WujKDfWWA/sWRhadk8dZKZzzCzM/a3IhWQ/WpHsAO7KbpjuLR?=
 =?us-ascii?Q?oF5dTBAGE/9mOysCwoN1+Ow3VzHTU0kv9iboTZT1vpEBKCVCMJvGO4Sd5rIJ?=
 =?us-ascii?Q?FjVNNEzP+kBQFHtjwy0OOoEeCEk77LzQLDD2eMawMtcUbnNx/FtW8jAqn4ZR?=
 =?us-ascii?Q?RlPtMStfG3fLsOo5cDDWrVtqq8HL/BbfvuybUNCoWIsAv4QVa9GbivBm9D2I?=
 =?us-ascii?Q?9dA5UEF7kD6qoVhxBqe3qH41eJ23UHRQ2kB1UUQbcRAaIT2HuxP6tMiBEVvG?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4efc4b-af1b-442e-7159-08dd81807b4b
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:38.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkNsZrP1HCvClIRkvosbBaCAp19efZ+e1MqC7/OCCNPUheTr+vDP+PbZ81kM1pumA32TfSPG6wGqYxvDoNkOwiR3RXcl5TSQ1dTcJqWxjpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

This adds debugfs entries and trace events to provide detailed
debugging information.
These enhancements help diagnose issues and improve debugging
capabilities for the Wave6 core driver.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../platform/chips-media/wave6/wave6-trace.h  | 336 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.c         | 230 ++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.h         |  14 +
 3 files changed, 580 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
new file mode 100644
index 000000000000..5b7a0aff5132
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-trace.h
@@ -0,0 +1,336 @@
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
+	TP_PROTO(struct device *dev, u32 addr, u32 value),
+	TP_ARGS(dev, addr, value),
+	TP_STRUCT__entry(
+		__string(name, dev_name(dev))
+		__field(u32, addr)
+		__field(u32, value)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->addr = addr;
+		__entry->value = value;
+	),
+	TP_printk("%s:0x%03x 0x%08x", __get_str(name), __entry->addr, __entry->value)
+);
+
+DEFINE_EVENT(register_access, writel,
+	TP_PROTO(struct device *dev, u32 addr, u32 value),
+	TP_ARGS(dev, addr, value));
+DEFINE_EVENT(register_access, readl,
+	TP_PROTO(struct device *dev, u32 addr, u32 value),
+	TP_ARGS(dev, addr, value));
+
+TRACE_EVENT(send_command,
+	TP_PROTO(struct vpu_core_device *vpu_dev, u32 id, u32 std, u32 cmd),
+	TP_ARGS(vpu_dev, id, std, cmd),
+	TP_STRUCT__entry(
+		__string(name, dev_name(vpu_dev->dev))
+		__field(u32, id)
+		__field(u32, std)
+		__field(u32, cmd)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = id;
+		__entry->std = std;
+		__entry->cmd = cmd;
+	),
+	TP_printk("%s: inst id %d, std 0x%x, cmd 0x%x",
+		  __get_str(name), __entry->id, __entry->std, __entry->cmd)
+);
+
+TRACE_EVENT(irq,
+	TP_PROTO(struct vpu_core_device *vpu_dev, u32 irq),
+	TP_ARGS(vpu_dev, irq),
+	TP_STRUCT__entry(
+		__string(name, dev_name(vpu_dev->dev))
+		__field(u32, irq)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->irq = irq;
+	),
+	TP_printk("%s: irq 0x%x", __get_str(name), __entry->irq)
+);
+
+TRACE_EVENT(set_state,
+	TP_PROTO(struct vpu_instance *inst, u32 state),
+	TP_ARGS(inst, state),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__string(cur_state, wave6_vpu_instance_state_name(inst->state))
+		__string(nxt_state, wave6_vpu_instance_state_name(state))
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__assign_str(cur_state);
+		__assign_str(nxt_state);
+	),
+	TP_printk("%s: inst[%d] set state %s -> %s",
+		  __get_str(name), __entry->id, __get_str(cur_state), __get_str(nxt_state))
+);
+
+DECLARE_EVENT_CLASS(inst_internal,
+	TP_PROTO(struct vpu_instance *inst, u32 type),
+	TP_ARGS(inst, type),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__string(type, V4L2_TYPE_IS_OUTPUT(type) ? "output" : "capture")
+		__field(u32, pixelformat)
+		__field(u32, width)
+		__field(u32, height)
+		__field(u32, buf_cnt_src)
+		__field(u32, buf_cnt_dst)
+		__field(u32, processed_cnt)
+		__field(u32, error_cnt)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__assign_str(type);
+		__entry->pixelformat = V4L2_TYPE_IS_OUTPUT(type) ? inst->src_fmt.pixelformat :
+								   inst->dst_fmt.pixelformat;
+		__entry->width = V4L2_TYPE_IS_OUTPUT(type) ? inst->src_fmt.width :
+							     inst->dst_fmt.width;
+		__entry->height = V4L2_TYPE_IS_OUTPUT(type) ? inst->src_fmt.height :
+							      inst->dst_fmt.height;
+		__entry->buf_cnt_src = inst->queued_src_buf_num;
+		__entry->buf_cnt_dst = inst->queued_dst_buf_num;
+		__entry->processed_cnt = inst->processed_buf_num;
+		__entry->error_cnt = inst->error_buf_num;
+	),
+	TP_printk("%s: inst[%d] %s %c%c%c%c %dx%d, input %d, %d, process %d, error %d",
+		  __get_str(name), __entry->id, __get_str(type),
+		  __entry->pixelformat,
+		  __entry->pixelformat >> 8,
+		  __entry->pixelformat >> 16,
+		  __entry->pixelformat >> 24,
+		  __entry->width, __entry->height,
+		  __entry->buf_cnt_src, __entry->buf_cnt_dst,
+		  __entry->processed_cnt, __entry->error_cnt)
+);
+
+DEFINE_EVENT(inst_internal, start_streaming,
+	TP_PROTO(struct vpu_instance *inst, u32 type),
+	TP_ARGS(inst, type));
+
+DEFINE_EVENT(inst_internal, stop_streaming,
+	TP_PROTO(struct vpu_instance *inst, u32 type),
+	TP_ARGS(inst, type));
+
+TRACE_EVENT(dec_pic,
+	TP_PROTO(struct vpu_instance *inst, u32 srcidx, u32 size),
+	TP_ARGS(inst, srcidx, size),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__field(u32, srcidx)
+		__field(u32, start)
+		__field(u32, size)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__entry->srcidx = srcidx;
+		__entry->start = inst->codec_info->dec_info.stream_rd_ptr;
+		__entry->size = size;
+	),
+	TP_printk("%s: inst[%d] src[%2d] %8x, %d",
+		  __get_str(name), __entry->id, __entry->srcidx, __entry->start, __entry->size)
+);
+
+TRACE_EVENT(source_change,
+	TP_PROTO(struct vpu_instance *inst, struct dec_initial_info *info),
+	TP_ARGS(inst, info),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__field(u32, width)
+		__field(u32, height)
+		__field(u32, profile)
+		__field(u32, level)
+		__field(u32, tier)
+		__field(u32, min_fb_cnt)
+		__field(u32, disp_delay)
+		__field(u32, quantization)
+		__field(u32, colorspace)
+		__field(u32, xfer_func)
+		__field(u32, ycbcr_enc)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__entry->width = info->pic_width,
+		__entry->height = info->pic_height,
+		__entry->profile = info->profile,
+		__entry->level = info->level;
+		__entry->tier = info->tier;
+		__entry->min_fb_cnt = info->min_frame_buffer_count;
+		__entry->disp_delay = info->frame_buf_delay;
+		__entry->quantization = inst->quantization;
+		__entry->colorspace = inst->colorspace;
+		__entry->xfer_func = inst->xfer_func;
+		__entry->ycbcr_enc = inst->ycbcr_enc;
+	),
+	TP_printk("%s: inst[%d] %dx%d profile %d, %d, %d min_fb %d, delay %d, color %d,%d,%d,%d",
+		  __get_str(name), __entry->id,
+		  __entry->width, __entry->height,
+		  __entry->profile, __entry->level, __entry->tier,
+		  __entry->min_fb_cnt, __entry->disp_delay,
+		  __entry->quantization,
+		  __entry->colorspace, __entry->xfer_func, __entry->ycbcr_enc)
+);
+
+TRACE_EVENT(dec_done,
+	TP_PROTO(struct vpu_instance *inst, struct dec_output_info *info),
+	TP_ARGS(inst, info),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__field(u32, dec_flag)
+		__field(u32, dec_poc)
+		__field(u32, disp_flag)
+		__field(u32, disp_cnt)
+		__field(u32, rel_cnt)
+		__field(u32, src_ch)
+		__field(u32, eos)
+		__field(u32, error)
+		__field(u32, warn)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__entry->dec_flag = info->frame_decoded;
+		__entry->dec_poc = info->decoded_poc;
+		__entry->disp_flag = info->frame_display;
+		__entry->disp_cnt = info->disp_frame_num;
+		__entry->rel_cnt = info->release_disp_frame_num;
+		__entry->src_ch = info->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE;
+		__entry->eos = info->stream_end;
+		__entry->error = info->error_reason;
+		__entry->warn = info->warn_info;
+	),
+	TP_printk("%s: inst[%d] dec %d %d; disp %d(%d); rel %d, src_ch %d, eos %d, error 0x%x 0x%x",
+		  __get_str(name), __entry->id,
+		  __entry->dec_flag, __entry->dec_poc,
+		  __entry->disp_flag, __entry->disp_cnt,
+		  __entry->rel_cnt,
+		  __entry->src_ch, __entry->eos,
+		  __entry->error, __entry->warn)
+);
+
+TRACE_EVENT(enc_pic,
+	TP_PROTO(struct vpu_instance *inst, struct enc_param *param),
+	TP_ARGS(inst, param),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__field(u32, srcidx)
+		__field(u32, buf_y)
+		__field(u32, buf_cb)
+		__field(u32, buf_cr)
+		__field(u32, stride)
+		__field(u32, buf_strm)
+		__field(u32, size_strm)
+		__field(u32, force_type_enable)
+		__field(u32, force_type)
+		__field(u32, end_flag)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__entry->srcidx = param->src_idx;
+		__entry->buf_y = param->source_frame->buf_y;
+		__entry->buf_cb = param->source_frame->buf_cb;
+		__entry->buf_cr = param->source_frame->buf_cr;
+		__entry->stride = param->source_frame->stride;
+		__entry->buf_strm = param->pic_stream_buffer_addr;
+		__entry->size_strm = param->pic_stream_buffer_size;
+		__entry->force_type_enable = param->force_pic_type_enable;
+		__entry->force_type = param->force_pic_type;
+		__entry->end_flag = param->src_end;
+	),
+	TP_printk("%s: inst[%d] src[%2d] %8x %8x %8x (%d); dst %8x(%d); force type %d(%d), end %d",
+		  __get_str(name), __entry->id, __entry->srcidx,
+		  __entry->buf_y, __entry->buf_cb, __entry->buf_cr, __entry->stride,
+		  __entry->buf_strm, __entry->size_strm,
+		  __entry->force_type_enable, __entry->force_type,
+		  __entry->end_flag)
+);
+
+TRACE_EVENT(enc_done,
+	TP_PROTO(struct vpu_instance *inst, struct enc_output_info *info),
+	TP_ARGS(inst, info),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__field(u32, srcidx)
+		__field(u32, frmidx)
+		__field(u32, size)
+		__field(u32, type)
+		__field(u32, avg_qp)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__entry->srcidx = info->enc_src_idx;
+		__entry->frmidx = info->recon_frame_index;
+		__entry->size = info->bitstream_size;
+		__entry->type = info->pic_type;
+		__entry->avg_qp = info->avg_ctu_qp;
+	),
+	TP_printk("%s: inst[%d] src %d, frame %d, size %d, type %d, qp %d, eos %d",
+		  __get_str(name), __entry->id,
+		  __entry->srcidx, __entry->frmidx,
+		  __entry->size, __entry->type, __entry->avg_qp,
+		  __entry->frmidx == RECON_IDX_FLAG_ENC_END)
+);
+
+TRACE_EVENT(s_ctrl,
+	TP_PROTO(struct vpu_instance *inst, struct v4l2_ctrl *ctrl),
+	TP_ARGS(inst, ctrl),
+	TP_STRUCT__entry(
+		__string(name, dev_name(inst->dev->dev))
+		__field(u32, id)
+		__string(ctrl_name, ctrl->name)
+		__field(u32, val)
+	),
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->id = inst->id;
+		__assign_str(ctrl_name);
+		__entry->val = ctrl->val;
+	),
+	TP_printk("%s: inst[%d] %s = %d",
+		  __get_str(name), __entry->id, __get_str(ctrl_name), __entry->val)
+);
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
index 000000000000..f3bcb9ec5ea1
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
@@ -0,0 +1,230 @@
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
+			dev_name(inst->dev->dev), inst->dev->product_code,
+			(inst->dev->fw_version >> 24) & 0xFF,
+			(inst->dev->fw_version >> 16) & 0xFF,
+			(inst->dev->fw_version >> 0) & 0xFFFF,
+			inst->dev->fw_revision, inst->dev->hw_version);
+	if (seq_write(s, str, num))
+		return 0;
+
+	num = scnprintf(str, sizeof(str), "state = %s, pause request %d\n",
+			wave6_vpu_instance_state_name(inst->state),
+			inst->dev->pause_request);
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
+	num = scnprintf(str, sizeof(str),
+			"capture queued %d, consumed %d, used %d\n",
+			v4l2_m2m_num_dst_bufs_ready(inst->v4l2_fh.m2m_ctx),
+			wave6_vpu_get_consumed_fb_num(inst),
+			wave6_vpu_get_used_fb_num(inst));
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
+			"latency(ms) first: %llu.%06llu, max %llu.%06llu\n",
+			perf->latency_first / NSEC_PER_MSEC,
+			perf->latency_first % NSEC_PER_MSEC,
+			perf->latency_max / NSEC_PER_MSEC,
+			perf->latency_max % NSEC_PER_MSEC);
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
+	if (!inst || !inst->dev || IS_ERR_OR_NULL(inst->dev->debugfs))
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
+	if (!inst || !inst->debugfs)
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


