Return-Path: <linux-media+bounces-58808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OoQOdRb32meSAAAu9opvQ
	(envelope-from <linux-media+bounces-58808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:35:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBC0402A3E
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9137B3130297
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2322C33859C;
	Wed, 15 Apr 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="S+0aMZLw"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657533EB1B;
	Wed, 15 Apr 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245163; cv=fail; b=B1TVn61fDhPYfuO0mKrRd5lApr1At9BgVufzORCYny5dA1lhkxVp1BnuUk+VvagBxshQgBOBSk0RDlk4CghTgfi/qUS7WuGGfOrFFL/SQiXTYvJvIziR/wxSwVJPO7nBMmPqZtNkwcLV3HVifNNkQkqv9F3yKHRw3yLYjSVJ7tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245163; c=relaxed/simple;
	bh=BMM0aHujh/bEanN989RVtTVr3G8EEMS4yOQsZhTtffE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BEf1H+mUmr12HlJ+oKf8QRwRA5lOStyKwDGyZLDkMttcuD8tiUQ03FzeJJrfVaMpCqJvCaheKPLRX1jpRSoasMO7MPRSX5fvRqUYysGWgDALiQiBslgUwq5JClSzPeSIIzSONXXEUE2r5KX6ntHPPPTmj4Z3P09tv6bqUsmi7Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=S+0aMZLw; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuxheGzr6hAGMS2xyKbNmX5Etfovds/L8/RRjDJ/JynP3Ufkwta91CcNPYqwvjrZy5MFzFB1DIMhIjkAkyO6vHp+aDsvPR/IedXtTZaKvNyBm6pl1l9YXqZ9xeGWeIm7TJkKGiXW7jpukQq3jHNzaQ1j/CYB79xULvLQ2grPuFt1l3be0kChPnj5tLBYWIaYC4ZIslJ2roYx1/yyKJ122QujEsgFl7uZFCCG/lBm2r/30/up2gUKa20/D0IHwl5tQ/uBQoRtZZUsInEhuychbUuEmrgf+ZAkv2ybw0njGn2SetJ6HLBJgb5FR0w21fJmzXd4h3NKdmkEwHWB3jsCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4qjSumPl5a5uajT7ZHQbXDOGcVVKBtbY4xN3dK/ns4=;
 b=RjKGY6PXBBetF3N0//pcGGZCbz9py1SHeWwI4nU1CVX6iv4W/bNywspkx2h5mrytPHiieb9dX89UqBPEjzaxVILMR3z4MSJXRNqsU4EYsvaSTVTXgNfyIFIqlnVs2MpqjDl+BqvWguiw+eg9jVTqdlCXaoi+LySbyNkPEfNf45aug6O4kKIZvOC2+OQENhl1hktgch+QYfR+bw1U+lzh6t6ftY7xth4YXh7CNQ2B/LJ5QSHh3sCcNF8aSCQ7VMOXd0ZJEWdINo43/hVNoTnVSmzZ2eHcdoXkhMMRggx5tgu6IyNElTY3FH7C8FXlQZsnpdK2ilFzD2oQ721l55BuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4qjSumPl5a5uajT7ZHQbXDOGcVVKBtbY4xN3dK/ns4=;
 b=S+0aMZLw3AGGRRGC43X40ybW4Uoavk6CfCHcN3oaQAqAEZ72OR9PeooQAFM3mwC32lKEBAknRCVs6D3dix0WI1pxPwg6SXUj+g61xx7UjYNB4f/2gRCUdPw9JgmM+0o2ArfyJ4MYkK56VGdqXbra0ACyqYQhJXfgh4T7xMMKMSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:46 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:46 +0000
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
	marek.vasut@mailbox.org,
	ming.qian@oss.nxp.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RFC PATCH v5 6/9] media: chips-media: wave6: Improve debugging capabilities
Date: Wed, 15 Apr 2026 18:25:26 +0900
Message-Id: <20260415092529.577-7-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415092529.577-1-nas.chung@chipsnmedia.com>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: 58144639-70c3-4b1b-3827-08de9ad0f9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	41DCZQPSTbiY2WYdfBtdn3600tZt9CEmeu+bGpE5RvtK4tdMgrmNUQw5ucLG4BXkoGobaOL18uRzDCrWoqKbW/MoiR8GJl3Fx5qT2i+aB7J5dHihX+gDhE6DSBG6h2nsCOSJI4xGJVsI0HpfbJ2Cx+MoCBtRBK3PLgG0aqrEbSw7RnrEsFz3sotdaAvnZyKRXJ1oNJnqXeqWKphwiBF5j9hUrQJkKo2aCLaWc2HpiKtVFMjTm33B+yQIrGwcbvfEituX1TZnW8JK084ayS05WPObjUAyIu/Er14FPzVot9zS6bxMtuF/4vovocMeImfMdqj10UFwlkDO3F5pQr/dmhpT4rlJNI+TPPuCFsPsPWYG1OnsxvZ/bw5Cbq61FIjT9ZO2+TmkDDiK9D9aiT62KJBajdgcF/fa3+VKrcIj+xnHvaQFNwgl6WWuVztak/QzUCsaheenROc5RBFW1v8/PHHxRZiTCk4RjWMTYyzNw6H8IPRgwUij767xQv5YLGxK+ABjldQXLQ0I0Q2by4NMPR2i874fAzsNaPssHZXUUGx8BwJTx+/Qt1AOZ9chHolq47Uy5O9y6wKGOH6evXVNTLxPcN0m+JxXzmSfwPBzlDSMOu9NEEU830szv9yunNfWXp2gKqqNahtqAy0R9CteYNubnocDdg3X9grbcjSZ27NqsHlzSLQxZylrKrjaKctJSOTmGuoxIZAcWpwT8zHxA6t4TaHUn5eSRKdES2KFWSJmmxd5bg2JwDnivtgGOw4zVzF/3jvZX9qwfHJlQOJNB4k3RiWVrmiYO8VOhyd0y8g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4dA/4hIlXeRIpFWTMII4s7e9SkZfGZ99/LLgrcktGlLlwkO8p6egogeV4rwl?=
 =?us-ascii?Q?UzH1f0L+OYF0l84Z/b1bYXv8Bsz0+8TV5ChBXHyrkM5Zo1AUZoCT2gCtCGqi?=
 =?us-ascii?Q?BL2mX8rEXdODkb37Ni/AFO55XM4tTXLmmmfbCxm/7e6rwr9h0L1528l+C8kg?=
 =?us-ascii?Q?gA8Kq94cWRbTn78l0x3sShU5TXCsGWs9ZdLyqw7x/DWKDTDx6jQrTaJnGoSI?=
 =?us-ascii?Q?IoZB3et534yDRNKjuH8sQbomC3NqGJY9UVRFgmvJUxYyzurrW/fnfnWnVv75?=
 =?us-ascii?Q?jCrOR1zblNl+RUF5NoaX5ghTqxWj42utTLC0AoY9JVzo3a+64kxq892jvrMQ?=
 =?us-ascii?Q?+5BeSXAVXg9a7ujjRBuU6u3mDEM4cc7JDFcP7m2EPQPjf6dU5iY9QuGHuVX7?=
 =?us-ascii?Q?3KpAnMWhdP15yHrYTyTuGvPNF+M0ySPhgzu13xj8HhSysEdX7re8gDSuP9Z0?=
 =?us-ascii?Q?B+YQ3ZZmDvkx9JPPZ0zNe3pe+WGl6OM30kZ9EbWuugntmU3Hvp0S9D+AqW6W?=
 =?us-ascii?Q?5EXg4LFBS2MC/UVc6phMQ71uOyAojbVHtC1OH97dgXyx+BN1drJo3USebdSz?=
 =?us-ascii?Q?iDx0EYMtd/ok1BX7hMPdismXnMtUkl3n6Ij5RhypCO6DRjrvKOpm1tFXngRd?=
 =?us-ascii?Q?NLCBv2sdP09PTCbRLsu6CRvKo426oko1uGAv+rdL+LZ5ansXR0YfvaLJi7ZX?=
 =?us-ascii?Q?qgmEUfcXYdZDlNOFR3hp+FBZ+F490wdVY4TdY+W2WK0Nj2SM1cZn4UL6Si3+?=
 =?us-ascii?Q?CxjnBHBrxHnpswzWIsA99EU+KkahXaT12cbHEyCm+fPDa5eFvZt1Zouh2f7t?=
 =?us-ascii?Q?S5Snaeq2JEKWgAvFU31RKmFO1W/sT0CIbFx7PlNpyGoM757clpNHmFEM7WA6?=
 =?us-ascii?Q?Rkz7NaRp3xyqwF5ecelSXZToAaBvCLEeNEyoWY9POGTU50UDsWNLxRM3Ugep?=
 =?us-ascii?Q?dm0n3IW8zP1Tcy13BlHhEmAyUcoFDpZzDXcn80CNzpDUAMCMe9dKKVegkn3y?=
 =?us-ascii?Q?rBqALzB4KaPvS7km5i1Tw/JqitOI78Pubq4DEXMXXSo2jJWCTFxKfzftENWK?=
 =?us-ascii?Q?H4oRftmJiPY5OcKPjIuvS2gZiXXbg41bmYcEC+Nj7xj8+cbIQLdrSgGsNwtP?=
 =?us-ascii?Q?cR9ufyPLIpG6hpAJsSdOiYqKJ5B2nLrE9BoP8fnEXyisNrTq61i7jaZQub6R?=
 =?us-ascii?Q?P2aevWAtIeUGtTSunfvtmBamemnqQ08DMM18tUGDyC4U3yDkLKUjC0y1iv6G?=
 =?us-ascii?Q?hyzKtM3YbZTGqYSlbSWXEu1wq0KMAjvRpTQ0GOMzApu6zJHKHMgDVyXc9gZ+?=
 =?us-ascii?Q?OH18sFxcDgqLE9l5qYJ/4Yl0MUcjJUsLM2lKWKxisNI9lE7JF9qauYx1tr9c?=
 =?us-ascii?Q?0V/J5ugDTum+pDHEj2uJdbgfSAHD5t2wa8BTzuKmbFWtwq/AawWT+qAg0XLv?=
 =?us-ascii?Q?BTmQiTLiZnz29I4UQxTOAmOK8fRs78sWIoD/zZjog40uxtAQdMp1hBr/eL4+?=
 =?us-ascii?Q?3LSSVMriUtSK2GeMRuMi+ovrFjVzD3E0OHhIAzYFKLH9hQrAs91jKMqb7+mZ?=
 =?us-ascii?Q?rSKWYsvNqkuTX3R4c63MbaM6ff2MXFna0wotJyWIlfxi5s1QHx6rvBzOkgTx?=
 =?us-ascii?Q?Fla4cJdxL+oHP7a2fB83hasvrPAxUdxuo/opjnWJ9St9+Lz7PefZdSy3SODO?=
 =?us-ascii?Q?4npN1UW+JQzp9nxiv3dIHMYgJhOpqyuI1ivPexIb9ZDpoAvIpjuhFPcJRB5B?=
 =?us-ascii?Q?mJXqL8sIUsIt9jfjzKaHzm2w7okl4ao=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58144639-70c3-4b1b-3827-08de9ad0f9a6
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:46.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUqFT9I+1xoH2+gy5m0FtxQdbohORnstHWw45coHbMl50mrUnMhlFV4c57L+3k58LqHyU4rmYf61ga+RakHGmsxL1ezRcgHvYet/89YBB2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58808-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,nxp.com:email,chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: 3DBC0402A3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


