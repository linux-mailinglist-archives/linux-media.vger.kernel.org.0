Return-Path: <linux-media+bounces-63381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +zNcA/bXHmqLVwAAu9opvQ
	(envelope-from <linux-media+bounces-63381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:17:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6AE62E664
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:17:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b="J/f6UgZs";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63381-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63381-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 164183046420
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3313EDE59;
	Tue,  2 Jun 2026 13:14:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F083E867A;
	Tue,  2 Jun 2026 13:14:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406093; cv=fail; b=jsxzDMB7JL3MgiA1BdHH5O2L+Nc8vaKeF4tlwwOHCLYZDibt4dsu7iLHlx1WLB+C4yiXjjbwQeXW3YOi/6vIs/vKmAZUvAB7E055B7eK3YztK96GNvrbI60zj4MUJ7xw9XG2q1PNT+ZZMIe3fCFykz4VnSRbxYKysjp+mZjKwX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406093; c=relaxed/simple;
	bh=yXrA/sBs3YjxsJCYK42aKzH6ZlSVP3uJa2oPluxNXhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dO9A1mSY9LQgDm6w1fokhhfkFisvDuHR8o8qHLpQf9iUG7f/aAy9ntTOPdL1vIofJSMIPUH/70w2/KoUe6gZM0+s2Ka+jmKTJdf592yLLI9z+DKJ3f+/m81kNIpudpb0dWIQ+EKXMz1ASI4zsMHQIYYk2hYjH2J++mai0FF0asQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J/f6UgZs; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fd8mU1I3YkdaOD/GBTAeNgonzvwhnK+dVI7OcMvIDbG7M9JnmuuSYbjTvhSVK/qgu7iUbc/lrxHwtRMtpN1fzQbVPR+uX5e3K/oB/XbgNVKnX/zRuE2v6n9hUbF5UEv0YPdqFU9rSs+jLO+fYNwf1o4gd8Vb/235otbXLcCOSaCyWrmULYyy7+9qhZiV3wrWtwFw3NHBx2Lkd1hGGwmCKl7FY1r0xw2zfDVSUr7u2okjopoIcGASZImfjiMGARzrNvwiuUnsWz8zmE+zg4Mm7L0x/a1U5BUPASBKAK2oE36V+KxaBQhBs6qFX4midvx3qRG+gAtbqBjOAUbjd/TWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpV5f9Rqe9E5qVjWa6G3zKLVR3aINDeufSHs67rle+w=;
 b=WzOLy5oq2d2ONbr6Mwet3ct7FLuNDBOly781J4lyLO4KcVFwhrclzg8r7FQVO9PYlI9d9Jv12rTyJqewZoWQBlNNfsdxuNlcaW6U/7LqWMlaRGsUQZFcZtU2AeR/SVvajW2ykW8TpoQ4Z832QBz5OE78v7ZE9qJALN1rY7nvAbgSSIPtpa71jXRgOwH7xLVzroAeFsKixgzjdnqS0iBGwFzYuyFlNsBV7M3JUF10PSwxKCPthOxqNYYXB/xGVHpZDXyD2q+5Zk/PZKBZRwY+e0cfOsY9C3smCe9RqnlLYwHssWfQG1z1REl9pbzFJJ4N4kMztNvPxh75kCBEegFsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpV5f9Rqe9E5qVjWa6G3zKLVR3aINDeufSHs67rle+w=;
 b=J/f6UgZskW0yRzMu2Dmq328LdpGMt21f18SHQ14JFosTVXWipWK8ASWGZExZ2K/xv88DmEVuUHwXhehLOQlUmLcQP2cHfNHdhvdv4oD1BlGy2FrIEfSXsNcTaWt21JqD/3JTWklY5IfvgQ9WxgnJAvGol28ZMiJxWcq2MV4AMESB8ex/GGvyoNvdofiD298K83EAZASgtPhlsddRnfApo9J7P7PFX5BKZnIY7MmvnfvRBfZuAINF8poJbMLti0mtFXSoqggrmlydSjI+/RfFI/tx+wQexdnM9Vc5rHQs4eCSc9sJ+TZ3+ti8sIwAs6WtsGAcMw+2D0eH1xlC1ske/A==
Received: from AS4P191CA0054.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::12)
 by AM0PR10MB3460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:14:43 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::a1) by AS4P191CA0054.outlook.office365.com
 (2603:10a6:20b:657::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 13:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:26 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:42 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:06 +0200
Subject: [PATCH v2 09/13] media: stm32: dcmipp: addition of a dcmipp-isp
 subdev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-9-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|AM0PR10MB3460:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de434c7-07ff-4ed8-ba86-08dec0a8e92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099006|6133799003|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gXIZC1oDfBtpD0SU8m6EWzGX+/b8cupB68+J6xAzRGtkuCxP/OKOxHkcvcO3Vs3dncVYh9QPP+05PMiV9iQAySiahhRyAZbQ3wiYX6iiAbKGq9YceHcZ7li3MNnb+wtGod+E/yGRxjL3Vym8mtvZCe84e1osA+u5oeOgCPIUEz9wz91C/le8UOVDaRcfsSb3lBfLeaD4oAL0+2DQHsiin+/K5KkyWm6OrSzQ+/80WGxGQSydpg9mfqmyE0G0OPM6X9DsHmqLuODd2qxFo+M1qYOmke3WY51M9YztGHZKXw25da7lbSu0viSOHWkPSBToDK+Iv1RQy1PNplrlPYB9KybylqMTQfSygPuz6Ru6PsgDKiniObM12Gt5rMc8Kz2AxtGgGchWVfb4N74NIhcchXpaKgZOaoBB7zC53UPDoEl5C5EF8QP2VUYRLoXLbljOKoUZzcGkF+2VWzGC/OVy3nCDyB6XvL1n2tZg+UVYK47xjEBC0pQJ/p/J6O0Up90zaAPRQFQYTgHeP3swPkdRg2nS3upo+9Zs3q2xPunp1Kt0uQviKhrL25ueyFL/0Dbnp5gQi3rWw4kdD9V6XzNCtEB54LppoMFn7aa3MtejlxcX+ksaXZYXWN8+xCYcKYhw5rW9XKr4EP2nAYKJKP9y5rL7AgPI0vHj1Zb59Q5Y4KrSYDG1/+k5jFxqfibtQrXljGZL2LxkjLajMAX0K4xj3XVe4+cFp8CoRZr7bC5/gW8=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099006)(6133799003)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EDspu0exKMFuz3B2cE9ar6MdFybb3C9RLCWPmHqil98KNbiPj3D8P/3jAle7j5TaBklIEHzn3jgMiuRbYki5foy/BcDiSxu26TeNj0uSQWuBUQs9/e/noH79ltOOCxDhP5RxtfWpZsgdafIyWpkMielZpY2W+eX5fMlAhozrvnFrqxjWLoMU08ut9CJuCnmslh8Cu4kPf+MUNYDwVEnEuV5rBpp9jxM4NP5WbKfU6zBbNEf8DKCyCCMbGMTNYwqz6xmbHZHrzyMJEPUPLRFWhSxfjO9RY/6TrFvPvqNjFxGe2gQdqjbfQGMVPLKrp5CloawEyxqQ5ldXfnyjqEUEj/wo54QyTYYNH+34Ed9hMlrxcDGjTDkbCQJGYfgz3qcJDYtxMwKQE10OM6cdbz6macMPVDvTRRdV+JFYQPqUeS0bfDg7xpwXX44CR2gsBum0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:43.1381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de434c7-07ff-4ed8-ba86-08dec0a8e92c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3460
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63381-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C6AE62E664

The ISP subdev is the first element after input of the main pipeline.
Part (static configuration) of this block is done via this subdev while
other configuration done on a per-frame basis will be done via a output
metadata device attached to this subdev.
This subdev handled the following features of the ISP block:
  - statistic removal (top / bottom of the frame)
  - decimation
  - demosaicing
  - control of frame export to the aux pipeline

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   3 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 482 +++++++++++++++++++++
 3 files changed, 486 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 54231569ed6f..a708534a51af 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
-stm32-dcmipp-y += dcmipp-pixelcommon.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index ee9f36268e64..e04fde86550a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -282,5 +282,8 @@ void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp);
 void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
+struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp);
+void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
new file mode 100644
index 000000000000..ed7281495e16
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
@@ -0,0 +1,482 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+#include "dcmipp-pixelcommon.h"
+
+#define DCMIPP_P1FSCR	0x804
+#define DCMIPP_P1FSCR_PIPEDIFF BIT(18)
+
+#define DCMIPP_P1SRCR	0x820
+#define DCMIPP_P1SRCR_LASTLINE_SHIFT	0
+#define DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT	12
+#define DCMIPP_P1SRCR_CROPEN		BIT(15)
+
+#define DCMIPP_P1DECR	0x830
+#define DCMIPP_P1DECR_ENABLE		BIT(0)
+#define DCMIPP_P1DECR_HDEC_SHIFT	1
+#define DCMIPP_P1DECR_VDEC_SHIFT	3
+
+#define DCMIPP_P1DMCR	0x870
+#define DCMIPP_P1DMCR_ENABLE		BIT(0)
+#define DCMIPP_P1DMCR_TYPE_SHIFT	1
+#define DCMIPP_P1DMCR_TYPE_MASK		GENMASK(2, 1)
+#define DCMIPP_P1DMCR_TYPE_RGGB		0x0
+#define DCMIPP_P1DMCR_TYPE_GRBG		0x1
+#define DCMIPP_P1DMCR_TYPE_GBRG		0x2
+#define DCMIPP_P1DMCR_TYPE_BGGR		0x3
+
+#define ISP_MEDIA_BUS_SINK_FMT_DEFAULT MEDIA_BUS_FMT_RGB565_1X16
+#define ISP_MEDIA_BUS_SRC_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
+
+struct dcmipp_isp_device {
+	struct dcmipp_ent_device ved;
+	struct v4l2_subdev sd;
+	struct device *dev;
+
+	void __iomem *regs;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.code = ISP_MEDIA_BUS_SINK_FMT_DEFAULT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static inline unsigned int dcmipp_isp_set_compose(__u32 size, __u32 req)
+{
+	unsigned int i = 0;
+
+	if (req > size)
+		return size;
+
+	/* Maximum decimation factor is 8 */
+	while (size > req && i++ < 3)
+		size /= 2;
+
+	return size;
+}
+
+static void dcmipp_isp_adjust_fmt(struct v4l2_mbus_framefmt *fmt, u32 pad)
+{
+	/* Only accept code in the pix map table */
+	if (!dcmipp_pixelpipe_pix_map_by_code(fmt->code, DCMIPP_ISP, pad))
+		fmt->code = IS_SRC(pad) ? ISP_MEDIA_BUS_SRC_FMT_DEFAULT :
+					  ISP_MEDIA_BUS_SINK_FMT_DEFAULT;
+
+	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
+			     DCMIPP_FRAME_MAX_WIDTH) & ~1;
+	fmt->height = clamp_t(u32, fmt->height, DCMIPP_FRAME_MIN_HEIGHT,
+			      DCMIPP_FRAME_MAX_HEIGHT);
+
+	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+		fmt->field = V4L2_FIELD_NONE;
+
+	dcmipp_colorimetry_clamp(fmt);
+}
+
+static int dcmipp_isp_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
+{
+	for (unsigned int i = 0; i < sd->entity.num_pads; i++) {
+		struct v4l2_mbus_framefmt *mf;
+
+		mf = v4l2_subdev_state_get_format(state, i);
+		*mf = fmt_default;
+		mf->code = IS_SRC(i) ? ISP_MEDIA_BUS_SRC_FMT_DEFAULT :
+				       ISP_MEDIA_BUS_SINK_FMT_DEFAULT;
+
+		if (IS_SINK(i)) {
+			struct v4l2_rect r = {
+				.top = 0,
+				.left = 0,
+				.width = DCMIPP_FMT_WIDTH_DEFAULT,
+				.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+			};
+
+			*v4l2_subdev_state_get_crop(state, i) = r;
+			*v4l2_subdev_state_get_compose(state, i) = r;
+		}
+	}
+
+	return 0;
+}
+
+static int dcmipp_isp_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	return dcmipp_pixelpipe_enum_mbus_code(DCMIPP_ISP, code);
+}
+
+static int dcmipp_isp_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	return dcmipp_pixelpipe_enum_frame_size(DCMIPP_ISP, fse);
+}
+
+static int dcmipp_isp_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_format *fmt)
+{
+	if (v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	dcmipp_isp_adjust_fmt(&fmt->format, fmt->pad);
+
+	if (IS_SINK(fmt->pad)) {
+		struct v4l2_mbus_framefmt *src_fmt =
+			v4l2_subdev_state_get_format(state, 1);
+		struct v4l2_rect r = {
+			.top = 0,
+			.left = 0,
+			.width = fmt->format.width,
+			.height = fmt->format.height,
+		};
+
+		/* Adjust SINK pad crop/compose */
+		*v4l2_subdev_state_get_crop(state, 0) = r;
+		*v4l2_subdev_state_get_compose(state, 0) = r;
+
+		/* Forward format to SRC pads */
+		*src_fmt = fmt->format;
+		src_fmt->code = dcmipp_pixelpipe_src_format(fmt->format.code);
+		*v4l2_subdev_state_get_format(state, 2) = *src_fmt;
+	} else {
+		struct v4l2_mbus_framefmt *sink_fmt =
+			v4l2_subdev_state_get_format(state, 0);
+		struct v4l2_rect *compose =
+			v4l2_subdev_state_get_compose(state, 0);
+
+		fmt->format = *sink_fmt;
+		fmt->format.code = dcmipp_pixelpipe_src_format(sink_fmt->code);
+		if (compose->width && compose->height) {
+			fmt->format.width = compose->width;
+			fmt->format.height = compose->height;
+		}
+		/* Set to the 2nd SRC pad */
+		*v4l2_subdev_state_get_format(state, fmt->pad == 1 ? 2 : 1) =
+			fmt->format;
+	}
+
+	/* Update the selected pad format */
+	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
+
+	return 0;
+}
+
+static void dcmipp_isp_adjust_crop(struct v4l2_rect *r,
+				   const struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_rect src_rect = {
+		.top = 0,
+		.left = 0,
+		.width = fmt->width,
+		.height = fmt->height,
+	};
+	struct v4l2_rect crop_min = {
+		.top = 8,
+		.left = 0,
+		.width = fmt->width,
+		.height = 1,
+	};
+
+	/* Disallow rectangles smaller than the minimal one. */
+	v4l2_rect_set_min_size(r, &crop_min);
+	v4l2_rect_map_inside(r, &src_rect);
+}
+
+static int dcmipp_isp_set_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_selection *s)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *crop, *compose;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	if (v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	crop = v4l2_subdev_state_get_crop(state, s->pad);
+	compose = v4l2_subdev_state_get_compose(state, s->pad);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		dcmipp_isp_adjust_crop(&s->r, sink_fmt);
+
+		*crop = s->r;
+		*compose = s->r;
+
+		dev_dbg(isp->dev, "s_selection: crop (%d,%d)/%ux%u\n",
+			crop->left, crop->top, crop->width, crop->height);
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = dcmipp_isp_set_compose(crop->width, s->r.width);
+		s->r.height = dcmipp_isp_set_compose(crop->height, s->r.height);
+		*compose = s->r;
+
+		dev_dbg(isp->dev, "s_selection: compose (%d,%d)/%ux%u\n",
+			compose->left, compose->top,
+			compose->width, compose->height);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Update the source pad size */
+	src_fmt = v4l2_subdev_state_get_format(state, 1);
+	src_fmt->width = s->r.width;
+	src_fmt->height = s->r.height;
+
+	return 0;
+}
+
+#define STM32_DCMIPP_IS_BAYER_VARIANT(code, variant)	\
+	((code) == MEDIA_BUS_FMT_S##variant##8_1X8 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##10_1X10 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##12_1X12 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##14_1X14 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##16_1X16)
+static void dcmipp_isp_config_demosaicing(struct dcmipp_isp_device *isp,
+					  struct v4l2_subdev_state *state)
+{
+	__u32 code = v4l2_subdev_state_get_format(state, 0)->code;
+	unsigned int val = 0;
+
+	/* Disable demosaicing */
+	reg_clear(isp, DCMIPP_P1DMCR,
+		  DCMIPP_P1DMCR_ENABLE | DCMIPP_P1DMCR_TYPE_MASK);
+
+	/* Only perform demosaicing if format is bayer */
+	if (code < MEDIA_BUS_FMT_SBGGR8_1X8 || code >= MEDIA_BUS_FMT_JPEG_1X8)
+		return;
+
+	dev_dbg(isp->dev, "Input is RawBayer, enable Demosaicing\n");
+
+	if (STM32_DCMIPP_IS_BAYER_VARIANT(code, BGGR))
+		val = DCMIPP_P1DMCR_TYPE_BGGR << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, GBRG))
+		val = DCMIPP_P1DMCR_TYPE_GBRG << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, GRBG))
+		val = DCMIPP_P1DMCR_TYPE_GRBG << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, RGGB))
+		val = DCMIPP_P1DMCR_TYPE_RGGB << DCMIPP_P1DMCR_TYPE_SHIFT;
+
+	val |= DCMIPP_P1DMCR_ENABLE;
+
+	reg_set(isp, DCMIPP_P1DMCR, val);
+}
+
+static bool dcmipp_isp_is_aux_output_enabled(struct dcmipp_isp_device *isp)
+{
+	struct media_link *link;
+
+	for_each_media_entity_data_link(isp->ved.ent, link) {
+		if (link->source != &isp->ved.pads[2])
+			continue;
+
+		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+			continue;
+
+		if (!strcmp(link->sink->entity->name, "dcmipp_aux_postproc"))
+			return true;
+	}
+
+	return false;
+}
+
+static void dcmipp_isp_config_decimation(struct dcmipp_isp_device *isp,
+					 struct v4l2_subdev_state *state)
+{
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct v4l2_rect *compose = v4l2_subdev_state_get_compose(state, 0);
+	u32 decr;
+
+	decr = (fls(crop->width / compose->width) - 1) << DCMIPP_P1DECR_HDEC_SHIFT |
+	       (fls(crop->height / compose->height) - 1) << DCMIPP_P1DECR_VDEC_SHIFT;
+	if (decr)
+		decr |= DCMIPP_P1DECR_ENABLE;
+
+	reg_write(isp, DCMIPP_P1DECR, decr);
+}
+
+static int dcmipp_isp_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Perform configuration only if no other pad is enabled */
+	if (sd->enabled_pads)
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Check if link between ISP & Pipe2 postproc is enabled */
+	if (dcmipp_isp_is_aux_output_enabled(isp))
+		reg_clear(isp, DCMIPP_P1FSCR, DCMIPP_P1FSCR_PIPEDIFF);
+	else
+		reg_set(isp, DCMIPP_P1FSCR, DCMIPP_P1FSCR_PIPEDIFF);
+
+	/* Configure Statistic Removal */
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	reg_write(isp, DCMIPP_P1SRCR,
+		  ((crop->top << DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT) |
+		   (crop->height << DCMIPP_P1SRCR_LASTLINE_SHIFT) |
+		   DCMIPP_P1SRCR_CROPEN));
+
+	/* Configure Decimation */
+	dcmipp_isp_config_decimation(isp, state);
+
+	/* Configure Demosaicing */
+	dcmipp_isp_config_demosaicing(isp, state);
+
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dcmipp_isp_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Don't do anything if there are still other pads enabled */
+	if ((sd->enabled_pads & ~BIT(pad)))
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Disable all blocks */
+	reg_write(isp, DCMIPP_P1SRCR, 0);
+	reg_write(isp, DCMIPP_P1DECR, 0);
+	reg_write(isp, DCMIPP_P1DMCR, 0);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_isp_pad_ops = {
+	.enum_mbus_code		= dcmipp_isp_enum_mbus_code,
+	.enum_frame_size	= dcmipp_isp_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_isp_set_fmt,
+	.get_selection		= dcmipp_pixelpipe_get_selection,
+	.set_selection		= dcmipp_isp_set_selection,
+	.enable_streams		= dcmipp_isp_enable_streams,
+	.disable_streams	= dcmipp_isp_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops dcmipp_isp_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops dcmipp_isp_ops = {
+	.pad = &dcmipp_isp_pad_ops,
+	.video = &dcmipp_isp_video_ops,
+};
+
+static void dcmipp_isp_release(struct v4l2_subdev *sd)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+
+	kfree(isp);
+}
+
+static const struct v4l2_subdev_internal_ops dcmipp_isp_int_ops = {
+	.init_state = dcmipp_isp_init_state,
+	.release = dcmipp_isp_release,
+};
+
+void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved)
+{
+	struct dcmipp_isp_device *isp =
+			container_of(ved, struct dcmipp_isp_device, ved);
+
+	dcmipp_ent_sd_unregister(ved, &isp->sd);
+}
+
+struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp)
+{
+	struct dcmipp_isp_device *isp;
+	const unsigned long pads_flag[] = {
+		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+		MEDIA_PAD_FL_SOURCE,
+	};
+	int ret;
+
+	/* Allocate the isp struct */
+	isp = kzalloc_obj(*isp);
+	if (!isp)
+		return ERR_PTR(-ENOMEM);
+
+	isp->regs = dcmipp->regs;
+
+	/* Initialize ved and sd */
+	ret = dcmipp_ent_sd_register(&isp->ved, &isp->sd,
+				     &dcmipp->v4l2_dev, entity_name,
+				     MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER,
+				     ARRAY_SIZE(pads_flag), pads_flag,
+				     &dcmipp_isp_int_ops, &dcmipp_isp_ops,
+				     NULL, NULL);
+	if (ret) {
+		kfree(isp);
+		return ERR_PTR(ret);
+	}
+
+	isp->ved.dcmipp = dcmipp;
+	isp->dev = dcmipp->dev;
+
+	return &isp->ved;
+}

-- 
2.43.0


