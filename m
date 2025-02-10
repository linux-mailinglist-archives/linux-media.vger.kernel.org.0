Return-Path: <linux-media+bounces-25886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB999A2E74D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D9EF188A17F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1AA1D514E;
	Mon, 10 Feb 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Yj4csc3o"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022096.outbound.protection.outlook.com [40.107.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C01CC8AE;
	Mon, 10 Feb 2025 09:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178477; cv=fail; b=ZQI77ipMqbq93BTRSvUble8r5tL+MLDL5FggJLeUM59f3XQl/Fwjpvw3gMG2iE+g0NTcOFZ58n4B7Od/YIrSVIcM2/lmS4IG1JAkMiTQFTjWl92REdCZufmt+mkhoHtzsuqZXkx1eiobKsJ6JMgR4zbd7SOCvRqzh9yvrCaoa9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178477; c=relaxed/simple;
	bh=nqfUv8Xa4BrZj7263foo1DKNRR4WXAR9OuyDzhwi8dU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awDZ9JArcv7Jd7iARXV0yspkX77cvpvzsnk3eduFYqYzhq9eMuLi9v3wmX6nkeLl/DCHhqw01GyVzCEo1h0RuCTWm3BX6lfKtciOGyC4QIZu7/91PPe90tupAMxkIGnEK10UHkL+jWuf2Y3A6hnvViulVrpNDxfdWKychMHpubU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Yj4csc3o; arc=fail smtp.client-ip=40.107.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXS/rbTSS2YHAJvOmczrHa0dXQxltQQBeqDB1k/6l43hyzWLeAkVWmaw47JXa2nI9zDEEuKpyXoq92aazKsn2qKa0ofuI3W7kIH3eUBV62Z/b5F7sDiIJODcmnVqfZlP7pdDsYtDk6uMGabmhQn20o0Jr4rsZmMQxi1+KbzgOO8Tvi4MQjevT/CeCO+p0RWWpq9ALZWxNTc7Y2MjEctj3+XaokkpPpzX+3JWZXKvbabk8NdO0asoIM4/0EEn1y/7neMu2AMe+X3/R9aZWatR1RdAdU3tFnOFTg4PdItk12iAWeqRZlMPs7FnL7OPNHgSU3O2p/eqgSn5NUQ8oiQm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjJRISxY2hEy7QrDhXcrw4aY+JmWA+tRXoy027Y9gj0=;
 b=DnVHtvJXYPNRHngVpFPkWJpW3f9kGS6+0Ibq0rtwjAfBMeQPkgr7VDs8PbKP1O982urqVVcfu5BtGWt8MYMyWVmHuL7rZUoBspKYYSsos1tXgWAwISFLnv9LB7NzqmF0045QdmP7DVeBlwRi2A0Xmq3Yv/ju50aa6BWEsMiP12wDHxYGNb9Q5SFGCRwvHESm/iO5mejE9T1waPzWFQ0Gm6eED9YwgGlaLJ5bWuMQTUHoc0oWkSWsUuq9I2gqBXfEoKTWSVFZaQG7VqdiRaWG4Kt2e2a3s7LwjP5IBiqey0mNBh07q+CrSd8tSVZ+s1ySP9kI4zYDJIgD5feHJRq/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjJRISxY2hEy7QrDhXcrw4aY+JmWA+tRXoy027Y9gj0=;
 b=Yj4csc3osoZ0uUpQC0OKZa5nmLbBq7OSJ6IlffGqyFqkKD4TfJg230jTLvTNvgOrASh+aoYrakRfoePFXQ+ctLWsCwzWEpHN3mj+RafBRna5ie4pe1EL5uhWV5V27l3mpaTBf5gIslaa/k6jCAympjMyTh2ROTFn17Z6V0IkvIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:38 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:38 +0000
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
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 8/8] media: chips-media: wave6: Improve debugging capabilities
Date: Mon, 10 Feb 2025 18:07:25 +0900
Message-Id: <20250210090725.4580-9-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f3274a-b5ea-45fd-8099-08dd49b25dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jvZc+KNznguk+PWtDOfut5DuPPFATEKx7hhIX3Ptk2AEsALmVBhVoSM9uvgC?=
 =?us-ascii?Q?m/dws7EPcfaowg56zsRQ+iQyRUg57ZeRphWYo5ljG1YSijNiPkXqBjDA+7ip?=
 =?us-ascii?Q?ZTFvX3vxIswuYDcXYCMb9IU4RWDPRZWjqtYsHltlNAmKM0fGlDnB2mdmq5Tb?=
 =?us-ascii?Q?LpMVQpjIAcrqt4Xy+WaffrmeDK60AcR0JnBeQ75G3Wk+93q3+j7oJWtvqGDR?=
 =?us-ascii?Q?xatbHAd54YBjzKtSI94ZdUQjfFZfiGQ69GHqc9ZU3upKYwCaF41y0y0vlMnv?=
 =?us-ascii?Q?HxJ3MBcT2bgXAJFkQh69U184tix4T1HRmKU+1dluiBgyXG4oYXmOyLAD3qug?=
 =?us-ascii?Q?WIKN2uTv2BMSsfjC+QmElEEYu5HDKeu2TqW1N8XskZUFLVohLY0XzvdWeH2I?=
 =?us-ascii?Q?is76Zgp/LjgNSBHEzPaP0U9LK1awmYqUdfGvS1Lw1bFFeAlTtFE/I8kQ5JTq?=
 =?us-ascii?Q?2+5ekDVLvg/NSLHWgSQjD3ilbDYEOl6+YsDW/B6RrisPhxpqnJm4OCEOV2Dt?=
 =?us-ascii?Q?ASEJN4WT+ouURpAtKPK2jlcuhiKkwywH8mHzEFv283RYHSkpxSDXZVM4Qz8T?=
 =?us-ascii?Q?3tKYH3c9me3ta9ONnpLXk5Bgz+iEXxNdbt24UBs/puMpGTj9/MGWUoVoz6gT?=
 =?us-ascii?Q?JGHzYa6GoyswvUgYu3sydoomVI2NNw9+oFCjmZCgghIT1dtLsuJCgOd4mmmU?=
 =?us-ascii?Q?9CKWSyifw9wPMwJTVkiJZv7iuc8XBIRnFFKDk0Pw4yo7KFeUasrO4APEOkji?=
 =?us-ascii?Q?JoTBoN1CUy6F6P5E123MSVl3bazcgCTlr3pJ7EEU77hYBCuHCTKIvlL2Hh1l?=
 =?us-ascii?Q?Yks64UHLCbAl7S/fGzmRw7M36lieveYikMcdOdIGmXnnxV0rAapdaT2brBso?=
 =?us-ascii?Q?joRJZo1UOGV0X5y6Oy0R0ntB1egpjA9ImlBLnyDZ/2a8wnapt36GLELmAGWq?=
 =?us-ascii?Q?uMeyWYZq7uuhKGje/WwVm3BlWNxQ+GTOCX3BBvccnyzHmGmHVSlPFK9b9OgG?=
 =?us-ascii?Q?AR43FR1cfHJk2y+lMKeJ8/AWK1U9Ep/O61fvlMhFXQEi1ndYRyM+Z6yztXNQ?=
 =?us-ascii?Q?4edsKoOi8Yy6QJs5Za431V8QH9Hu6/BMGEYkoesPPBnwSEwtZW3PLkAxKiTr?=
 =?us-ascii?Q?k3GwISKAQOK8XlkpDrQVTiI/qwYODAGHP3YrQApwR+onzbsc10K3QOsqxML5?=
 =?us-ascii?Q?KK/ZyF8ndQ17ql8zIOrmU835UJvdvaN/0n5kLrP/VqimbEZTpsv7RdisabKc?=
 =?us-ascii?Q?po1TxV1ddlhYoum8F63MRUii7Dx3Ti9Xjpcnphp/8ZGWSwpTwGAjZKw0Vy92?=
 =?us-ascii?Q?J40v71lcdKPmbIunfOLuQ8mQPQr9gtEMabKRfwD1IQFCvJ10ty/IOmNbkW2W?=
 =?us-ascii?Q?z9xG11vlmqy189smaDUfTc8RNyihY6a+j9JWjWNPTSsgMhvHEQOrRrneJXLJ?=
 =?us-ascii?Q?bvayiC3qxVz/yl9LxsLxO9Wg/9BNZVrf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?byR1zErcXSBWNLjmipsCjnwzw3g4R9gWsRiUeAQ0faAkUoOM9X/M2jQsggf0?=
 =?us-ascii?Q?xdZBgmuNlm63+CmFK9twQgYdV6aodJ4D9x2RP16Lf/iPsI2Ne7q9mq3sCQ3X?=
 =?us-ascii?Q?8/InUM42aC1iuie8tBJAQ8K0UShCwCSDB4tAKQzOVrNqkxbTnU2azAZ/gBSL?=
 =?us-ascii?Q?dUuMVzvZZtkLa6VYMdHl5e9X3AmZxC+cMI8NZ/ycwXNPPIihN5N7zpkJxJUE?=
 =?us-ascii?Q?OLstsFNtW4ccgyfqx3lFrL9mvLelrcq6yubFBxDuODfDvQ7qS5MUdEwZMPDj?=
 =?us-ascii?Q?a5TsYLDPqOpIOnOHq0CZzl44XKy0ZMJtCEcnOQ5nX32xKw6W75yXtIcLCQN6?=
 =?us-ascii?Q?Z3uoVpObK0TDGXMQ1E4nf9dfZrv4OIHnZOR6uAHytU9pnvn3MIa/Pau2+zrB?=
 =?us-ascii?Q?hCAvld5p10ATEaRM9T2KGWkWjh1OYLy+PfOlbCPjwgJ4TTiGGuAyg+0OSxxm?=
 =?us-ascii?Q?OXkRhK5VugYzJcA3a+nfgKLXcQqsIZs6ZK2FvG9K8naZwPIG6A2nN+i+PrZp?=
 =?us-ascii?Q?4HLa1fZAw/FXHHteBSQ4yNiRrMgyen+IK2bbBnugLilQeEoj0MPcqDUmW/nZ?=
 =?us-ascii?Q?kzE7zhET87vvpaXNFjtCKrbtcJ0rciXfhf5ijHlDJTWwzk+gf5JutaNzbsDf?=
 =?us-ascii?Q?4oe5e1Vd4IannEhK92OKZK5FDGFx/ROof7QlX3hbVjctyZeO3KwoqI4P5T5M?=
 =?us-ascii?Q?1qtKQ/xZFyYU0hkUQlcVHVEMrvF2Gu3fH+6VvnEmwE5SqSYMZaIY4DTUUh1r?=
 =?us-ascii?Q?IwBN7vzApwRvEVYsgTOp5VOMGElFNh5Kz9V8u0k1dJ5a21ANAfKPeR+M3fcj?=
 =?us-ascii?Q?OCaE7ZgC9xnta1a7s5BFNL8uMo/bLIAEStO28JY7IF9C8wBMY2TUoL9ymAmi?=
 =?us-ascii?Q?v+6EDFZrlFcO9iVHt6qIE7VmE8d8VhXcZE+n4iw4FC0Tv/q5MuW/AfS8aWTI?=
 =?us-ascii?Q?psJ3tIT7mGEGtyPO6iXkYgh2TO1znflqaEgSLUSj45QAe36gw8S6piVVEp8d?=
 =?us-ascii?Q?22+WXv92qqb0AB9klV+ExqIAl5NxB/o+Hjsts4AMA/HG2vkK/PJmeH21g6IJ?=
 =?us-ascii?Q?raVSqtdiq86KUzJ0xy/xoeNgR7aPp5PTTXSvM610F/pU1fSQ/OYJpJjt0tdD?=
 =?us-ascii?Q?hhdT0qkOgKaj0t+JoeID78QvAJzdZfP8yN0jBw/tehJ6gqbkjqCTOi+Cq2tT?=
 =?us-ascii?Q?dbDkxhaMM07IOJxNfVb2OLHJ7+++PW+Q6YP0/XJsIQXdq6XWy3iFZ+4aRY1j?=
 =?us-ascii?Q?1xA7gm2JgDtH7PoHqUOemjD7c2D6kGZJ0vyVX1JwCEQFlTuGUxqCpaVD2AIh?=
 =?us-ascii?Q?kxkOD/0eT9wOCy0IBwojy5WxSq9OHscaiiz86DMSgljNvirMNCc7iH0X12af?=
 =?us-ascii?Q?kS+UBdLOqj6SsiJYbDe+Z0k+ujd1Ea8adxX49dA8idUDnZmwx83ef/HHCVYx?=
 =?us-ascii?Q?H4jkHoLMSPVJblcbHwRwEk7nL1KKm2YxqIZI9Fyl5KpaSe2y411ZgwfuAXaz?=
 =?us-ascii?Q?xr5EDtIxcUNSGCA0ILxwoXC2quRclYFzqrnpjJ9leOo7ZWQFdPx+fQGzgl9M?=
 =?us-ascii?Q?bpCvcjiLTZQbCddDx6nMa0fhvGXwCr2O5EC/5lG4uK5ZL9MHKRUCd+DNiL0e?=
 =?us-ascii?Q?SA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f3274a-b5ea-45fd-8099-08dd49b25dcb
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:38.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGfdys81UgbtCZCbgx+eB9dB4b9J15vld2b/6uP2/e3nIA0o5u6GZ/Q5UPUJtWojgRH6xM2YJfCZpeEEn8ZPBTwjNf5e/mhhOxfBT8xDj4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

Add debugfs entries and trace events to provide detailed
debugging information.
These enhancements help diagnose issues and improve debugging
capabilities for the Wave6 driver.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave6/wave6-trace.h  | 336 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.c         | 230 ++++++++++++
 .../chips-media/wave6/wave6-vpu-dbg.h         |  22 ++
 3 files changed, 588 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-trace.h b/drivers/media/platform/chips-media/wave6/wave6-trace.h
new file mode 100644
index 000000000000..8ddba6926c60
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
+		__assign_str(name, dev_name(dev));
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
+	TP_PROTO(struct vpu_device *vpu_dev, u32 id, u32 std, u32 cmd),
+	TP_ARGS(vpu_dev, id, std, cmd),
+	TP_STRUCT__entry(
+		__string(name, dev_name(vpu_dev->dev))
+		__field(u32, id)
+		__field(u32, std)
+		__field(u32, cmd)
+	),
+	TP_fast_assign(
+		__assign_str(name, dev_name(vpu_dev->dev));
+		__entry->id = id;
+		__entry->std = std;
+		__entry->cmd = cmd;
+	),
+	TP_printk("%s: inst id %d, std 0x%x, cmd 0x%x",
+		  __get_str(name), __entry->id, __entry->std, __entry->cmd)
+);
+
+TRACE_EVENT(irq,
+	TP_PROTO(struct vpu_device *vpu_dev, u32 irq),
+	TP_ARGS(vpu_dev, irq),
+	TP_STRUCT__entry(
+		__string(name, dev_name(vpu_dev->dev))
+		__field(u32, irq)
+	),
+	TP_fast_assign(
+		__assign_str(name, dev_name(vpu_dev->dev));
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
+		__assign_str(name, dev_name(inst->dev->dev));
+		__entry->id = inst->id;
+		__assign_str(cur_state, wave6_vpu_instance_state_name(inst->state));
+		__assign_str(nxt_state, wave6_vpu_instance_state_name(state));
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
+		__assign_str(name, dev_name(inst->dev->dev));
+		__entry->id = inst->id;
+		__assign_str(type, V4L2_TYPE_IS_OUTPUT(type) ? "output" : "capture");
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
+		__assign_str(name, dev_name(inst->dev->dev));
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
+		__assign_str(name, dev_name(inst->dev->dev));
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
+		__assign_str(name, dev_name(inst->dev->dev));
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
+		__assign_str(name, dev_name(inst->dev->dev));
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
+		__assign_str(name, dev_name(inst->dev->dev));
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
+		__assign_str(name, dev_name(inst->dev->dev));
+		__entry->id = inst->id;
+		__assign_str(ctrl_name, ctrl->name);
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
index 000000000000..40fe75c08eeb
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
+#include "wave6-vpu.h"
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
index 000000000000..fd7da1670925
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
@@ -0,0 +1,22 @@
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
+unsigned int wave6_vpu_debug(void);
+
+#define dprintk(dev, fmt, arg...)					\
+	do {								\
+		if (wave6_vpu_debug())					\
+			dev_info(dev, "%s: " fmt, __func__, ## arg);	\
+	} while (0)
+
+int wave6_vpu_create_dbgfs_file(struct vpu_instance *inst);
+void wave6_vpu_remove_dbgfs_file(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_DBG_H__ */
-- 
2.31.1


