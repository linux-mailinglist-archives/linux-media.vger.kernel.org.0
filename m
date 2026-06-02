Return-Path: <linux-media+bounces-63384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hBg8NR/YHmqnVwAAu9opvQ
	(envelope-from <linux-media+bounces-63384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4662E680
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=XrP8mFUW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63384-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63384-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38E7C304C495
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7110A3EF653;
	Tue,  2 Jun 2026 13:14:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F83E95B3;
	Tue,  2 Jun 2026 13:14:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406095; cv=fail; b=T3VNIoO7/0VFpxygM5Se/WhFar9AR0uN9P9FXWYgmQO9HPjsRXmqWqsmgzaMKkgESdiyksPceI6YPWzdJcUsN3WzLkkCY92XY5cZYhb7gkuQOPGT++IymkS4FidBQBcWgIhGiXW+hh6x4QwbUHLhJgxyzPD6tDPK546jHgDdsYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406095; c=relaxed/simple;
	bh=QZwGAUug/My1jOzuoCOR/K6I5G7rxMaRFRAo2pKqvok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nLOSOPYDXhN8QdkQspdp7DMamzPpd8+CRgKwH4yNZ/Rb2koVtLLlQLmTSrJWlvd/oaKLhEgzgQCtdfqtemd/dpXmI3GP5qktfDBCHFF6t2yuf3572HGEpod1k45Q7x/BJB4zMDOlR0YZk4CcPCqTXHdbWtYfAiXqBr5ODJt6XmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XrP8mFUW; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unI00QrItBBB+/Z1BJb2snr9tv+vI3v+YT6Si0e00wo51IvMWVbd7eQOpXVx4OwLkkIEYy0/MFy3KmOWn4qbgBzpohd1HHEKzm3UHVQGfR46aTOOfevi+VkDhGXgZl2K6gFOc11EW5f771xrGgwavCdB1uxhSbVoqksRMD3j9LyrvF2suy6AS4Wn7WA4G2OTS5Av+IchvXrTniTlyUirA2SiCBFLDuVTtTwLBcEJAv0oegfjubzxzo1BTsnSmIspC36ieMB9Q2fWJT3pQ61i2Tvitqh80D+CUdVQtQ4IgydV05aGvd761fjlI66jqNtqCdaxAlqys+SFQ/IAvKi1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKW5dDC1uZc8KXlFqM18sWGfGm8AGzygmXM4D5vJCFU=;
 b=qhnRQ/mUXra6zimo80Lon1xseJNdsQ0/Ua51ttj8hlO5sjdQVqeRrzGHwRmsfETKfNJ3JENv74V9mPrgKskMJl9fg003LL0trbQDAAHY0srIcfJdd8RBIO0Q6RWeORlxpG4nCCcqj8ZxBr8VJV/1brgmZLHrAm7H3jq1hGIk2CY2Jj8zsuj3YBKgEoEYNBfBdy374a/cPy3UB0wF0euv98ermFI66Gz8NShf+Ik8qH/WIDkn/2HG2StnfpkcDVT0AvhHcprI1Rr4iP9qe9/3L1pCvVLLivrQWitRZYEfBQZYHOGG1ytETLE2SowxNOIgQXDYQCOeA45dDsm1t/wsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKW5dDC1uZc8KXlFqM18sWGfGm8AGzygmXM4D5vJCFU=;
 b=XrP8mFUWXvkUlFp5AMYn/cIOlhHwqWDfgob6SN+JFFu/i2G9LDyH7RNgeXj+sF4Qne/UREYpltUDC+j0Ea1VbSsELHfFZq8oqikgnndXsDnG8WwntpRgWk7r7Z0c9Ij/OzDH+vrzGk1tU/EmoZxZaTFbqJ9+SF2kmNaU8JEV85gOx+qQe14W+6Mp9S+Pq3pSlGKtmuBazwWu9Kmz7APIcdA8kWnQTG00HTNmFF977EQomb98c2CYRLCZNbztBCS/GVMmfZxTw6pX+c3A3PbgvMRdjSxiqhHhP/Nv57NdIteacbph0SDkrIMF0km+qng/N3m2spaCQS01SNrjS1GMMA==
Received: from DB9PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:1da::28)
 by AS1PR10MB5530.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:475::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:45 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::1f) by DB9PR05CA0023.outlook.office365.com
 (2603:10a6:10:1da::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:52 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:43 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:07 +0200
Subject: [PATCH v2 10/13] media: stm32: dcmipp: pixelproc: addition of
 dcmipp-pixelproc subdev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-10-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|AS1PR10MB5530:EE_
X-MS-Office365-Filtering-Correlation-Id: 3557a11b-f12a-48e7-518d-08dec0a8ea71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|4022899009|82310400026|376014|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	BmYl3yTflOxTLkm9of+Q1CUhbe1/+AhVBvKKdzvrqCqtXHFMUckQ0GHgYvPd0gjWEXtwZObq9JqRH+p+weZFjFzFoUQYNlh1WqYabb2aUZioIzhscfB5zUzzLc/5cJ5yOclSNtGqhUvdgRceyFkX05+fI8cOoIfC4LkIpRt+MtmnTao91qPiaS8vX/FrEGRQ9iyaRpvMFstonkweJhOYqfc6I03bgwljUbb4t5L+IHUDXVGpsD3S4IDVlx4VzC3ylso6NjhHE9MAy44sJyj05RKs0o+KwZCxTBHBFcOetsZHvFLDetzqb0Wd40OuHuImQKJoyysxpBqDWe79pQXjm+p4f8MybgSBbwfKfME4RTrcYMW4HeNyf0q5JIeJyy31RxrwC8bhCf1xV8SVzs4RdtfwUYwddqxj/k21TQQ097c61nN+3mqCjDGhEsW1JDriQhtsIH+9EP5Jee5pc4IvcpnwvgQIehMSdABH4/UGem9tuBHh0P+6suLBvQI+RnDpYBlO4vwEeEimkOmiWUMKForQgMNROxWOmwppjIbQmOJmXKDVPMobd/CvmA22tOh4Nc7ifCiH6qL50itSL9kKoA0wUF9g4Y2fsy/83wpipRkvpm1jUSbniaZ9DyKswuErZQ59Q6Gxo1PD81y9uNgcQ5fuIw9Z43lujekTseBLbeNaV0tpN94TBcP0UlOn1gUA3gzPVlPsLcRXuWFZZn8sh7PV/pQ7tDkVFWIxRj33xJM=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(4022899009)(82310400026)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R5ICm73ACsledlfhTdtyeSXe5ig1pA7s7A5VxAZPXbF9F0/7E2E4vAZB+7nJ9njGswrsFBN6DMjdQCcSDFzHM32/zygEYlRuEKSYpdm2cRtyef5gqp2nrDDE/C7KEP3uzh1K+r9PKBqnTKud8o3XKmhgZ2DRyp4anurgAQdNEoA5L66y3EFFTeOrsGRICvVqSpZI3jVFl3A+EAnR0UpVbEP+XBzX252XERB4QT8qAr2XJYTqrPuTHogML0dBiDC4VPvRR8CkCGsEanCb6MKNcQ2H8Vq2PIZYQWJk0OCESfTzZUVOAHlwvCROG7HlQftBqZOD0fXHi/wyLOUCiL9HmGS/UEj2/uda3P07IaBHkvNNtxSiI7gSTlpN7TPs46SPYcsQ6jr8Y6uX4GZAFmi3oQwUtCdtKgb3CQPKWlYq25osa4GOBKQg0df4RR1ezFJm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:45.2327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3557a11b-f12a-48e7-518d-08dec0a8ea71
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5530
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63384-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim,st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76C4662E680

Addition of the driver for dcmipp-pixelproc subdev.  This subdev is the
last one before the capture device at the tail of both main and
aux pipelines.

It is in charge of:
  - framerate adjustment
  - downscale
  - gamma correction
  - color conversion
  - pixel packing

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 935 +++++++++++++++++++++
 3 files changed, 940 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index a708534a51af..7178934bb116 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
-stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index e04fde86550a..8f41473605aa 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -285,5 +285,9 @@ void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
 					      struct dcmipp_device *dcmipp);
 void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
+struct dcmipp_ent_device *
+dcmipp_pixelproc_ent_init(const char *entity_name,
+			  struct dcmipp_device *dcmipp);
+void dcmipp_pixelproc_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
new file mode 100644
index 000000000000..40394ebfd827
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
@@ -0,0 +1,935 @@
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
+#include <linux/pm_runtime.h>
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+#include "dcmipp-pixelcommon.h"
+
+#define DCMIPP_P1CRSTR	0x904
+#define DCMIPP_P2CRSTR	0xD04
+#define DCMIPP_PxCRSTR(id) (((id) == 1) ? DCMIPP_P1CRSTR :\
+			   DCMIPP_P2CRSTR)
+#define DCMIPP_PxCRSTR_HSTART_SHIFT	0
+#define DCMIPP_PxCRSTR_VSTART_SHIFT	16
+#define DCMIPP_P1CRSZR	0x908
+#define DCMIPP_P2CRSZR	0xD08
+#define DCMIPP_PxCRSZR(id) (((id) == 1) ? DCMIPP_P1CRSZR :\
+			   DCMIPP_P2CRSZR)
+#define DCMIPP_PxCRSZR_ENABLE		BIT(31)
+#define DCMIPP_PxCRSZR_HSIZE_SHIFT	0
+#define DCMIPP_PxCRSZR_VSIZE_SHIFT	16
+
+#define DCMIPP_P1DCCR	0x90C
+#define DCMIPP_P2DCCR	0xD0C
+#define DCMIPP_PxDCCR(id) (((id) == 1) ? DCMIPP_P1DCCR :\
+			   DCMIPP_P2DCCR)
+#define DCMIPP_PxDCCR_ENABLE		BIT(0)
+#define DCMIPP_PxDCCR_HDEC_SHIFT	1
+#define DCMIPP_PxDCCR_VDEC_SHIFT	3
+
+#define DCMIPP_P1DSCR	0x910
+#define DCMIPP_P2DSCR	0xD10
+#define DCMIPP_PxDSCR(id) (((id) == 1) ? DCMIPP_P1DSCR :\
+			   DCMIPP_P2DSCR)
+#define DCMIPP_PxDSCR_HDIV_SHIFT	0
+#define DCMIPP_PxDSCR_VDIV_SHIFT	16
+#define DCMIPP_PxDSCR_ENABLE		BIT(31)
+
+#define DCMIPP_P1DSRTIOR	0x914
+#define DCMIPP_P2DSRTIOR	0xD14
+#define DCMIPP_PxDSRTIOR(id) (((id) == 1) ? DCMIPP_P1DSRTIOR :\
+			   DCMIPP_P2DSRTIOR)
+#define DCMIPP_PxDSRTIOR_HRATIO_SHIFT	0
+#define DCMIPP_PxDSRTIOR_HRATIO_MASK	GENMASK(15, 0)
+#define DCMIPP_PxDSRTIOR_VRATIO_SHIFT	16
+#define DCMIPP_PxDSRTIOR_VRATIO_MASK	GENMASK(31, 16)
+
+#define DCMIPP_P1DSSZR	0x918
+#define DCMIPP_P2DSSZR	0xD18
+#define DCMIPP_PxDSSZR(id) (((id) == 1) ? DCMIPP_P1DSSZR :\
+			   DCMIPP_P2DSSZR)
+#define DCMIPP_PxDSSZR_HSIZE_SHIFT	0
+#define DCMIPP_PxDSSZR_HSIZE_MASK	GENMASK(11, 0)
+#define DCMIPP_PxDSSZR_VSIZE_SHIFT	16
+#define DCMIPP_PxDSSZR_VSIZE_MASK	GENMASK(27, 16)
+
+#define DCMIPP_P1GMCR	0x970
+#define DCMIPP_P2GMCR	0xD70
+#define DCMIPP_PxGMCR(id) (((id) == 1) ? DCMIPP_P1GMCR :\
+			   DCMIPP_P2GMCR)
+#define DCMIPP_PxGMCR_ENABLE		BIT(0)
+
+#define DCMIPP_P1YUVCR	0x980
+#define DCMIPP_P1YUVCR_ENABLE		BIT(0)
+#define DCMIPP_P1YUVCR_TYPE_RGB		BIT(1)
+#define DCMIPP_P1YUVCR_CLAMP		BIT(2)
+#define DCMIPP_P1YUVRR1	0x984
+#define DCMIPP_P1YUVRR2	0x988
+#define DCMIPP_P1YUVGR1	0x98C
+#define DCMIPP_P1YUVGR2	0x990
+#define DCMIPP_P1YUVBR1	0x994
+#define DCMIPP_P1YUVBR2	0x998
+
+#define PIXELPROC_MEDIA_BUS_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
+
+/* Macro for negative coefficient, 11 bits coded */
+#define N11(val) (((val) ^ 0x7ff) + 1)
+/* Macro for added value, 10 bits coded */
+#define N10(val) (((val) ^ 0x3ff) + 1)
+
+/* Macro to convert row matrix to DCMIPP PxCCCyy register value */
+#define CCTBL(rr, rg, rb, ra, gr, gg, gb, ga, br, bg, bb, ba)		\
+	.conv_matrix = {						\
+		((rg) << 16 | (rr)), ((ra) << 16 | (rb)),		\
+		((gg) << 16 | (gr)), ((ga) << 16 | (gb)),		\
+		((bg) << 16 | (br)), ((ba) << 16 | (bb)) }
+
+struct dcmipp_colorconv_config {
+	unsigned int conv_matrix[6];
+	bool clamping;
+	bool clamping_as_rgb;
+};
+
+static const struct dcmipp_colorconv_config dcmipp_rgbfull_to_yuv601full = {
+	/*    R		G		B		Add */
+	CCTBL(131,	N11(110),	N11(21),	128,	/* Cr */
+	      77,	150,		29,		0,	/* Y */
+	      N11(44),	N11(87),	131,		128),	/* Cb */
+};
+
+static const struct dcmipp_colorconv_config dcmipp_rgbfull_to_yuv601lim = {
+	/*	R	G		B		Add */
+	CCTBL(112,	N11(94),	N11(18),	128,	/* Cr */
+	      66,	129,		25,		16,	/* Y */
+	      N11(38),	N11(74),	112,		128),	/* Cb */
+	.clamping = true,
+};
+
+static const struct dcmipp_colorconv_config dcmipp_rgbfull_to_yuv709full = {
+	/*    R		G		B		Add */
+	CCTBL(131,	N11(119),	N11(12),	128,	/* Cr */
+	      55,	183,		18,		0,	/* Y */
+	      N11(30),	N11(101),	131,		128),	/* Cb */
+};
+
+static const struct dcmipp_colorconv_config dcmipp_rgbfull_to_yuv709lim = {
+	/*    R		G		B		Add */
+	CCTBL(112,	N11(102),	N11(10),	128,	/* Cr */
+	      47,	157,		16,		16,	/* Y */
+	      N11(26),	N11(87),	112,		128),	/* Cb */
+	.clamping = true,
+};
+
+static const struct dcmipp_colorconv_config dcmipp_rgblim_to_yuv601lim = {
+	/*    R		G		B		Add */
+	CCTBL(131,	N11(110),	N11(21),	128,	/* Cr */
+	      77,	150,		29,		0,	/* Y */
+	      N11(44),	N11(87),	131,		128),	/* Cb */
+	.clamping = true,
+};
+
+static const struct dcmipp_colorconv_config dcmipp_rgblim_to_yuv709lim = {
+	/*    R		G		B		Add */
+	CCTBL(131,	N11(119),	N11(12),	128,	/* Cr */
+	      55,	183,		18,		0,	/* Y */
+	      N11(30),	N11(101),	131,		128),	/* Cb */
+	.clamping = true,
+};
+
+static const struct dcmipp_colorconv_config dcmipp_yuv601full_to_rgbfull = {
+	/*    Cr	Y	Cb		Add */
+	CCTBL(351,	256,	0,		N10(175),	/* R */
+	      N11(179),	256,	N11(86),	132,		/* G */
+	      0,	256,	443,		N10(222)),	/* B */
+};
+
+static const struct dcmipp_colorconv_config dcmipp_yuv601lim_to_rgbfull = {
+	/*    Cr	Y	Cb		Add */
+	CCTBL(409,	298,	0,		N10(223),	/* R */
+	      N11(208),	298,	N11(100),	135,		/* G */
+	      0,	298,	517,		N10(277)),	/* B */
+};
+
+static const struct dcmipp_colorconv_config dcmipp_yuv601lim_to_rgblim = {
+	/*    Cr	Y	Cb		Add */
+	CCTBL(351,	256,	0,		N10(175),	/* R */
+	      N11(179),	256,	N11(86),	132,		/* G */
+	      0,	256,	443,		N10(222)),	/* B */
+	.clamping = true,
+	.clamping_as_rgb = true,
+};
+
+static const struct dcmipp_colorconv_config dcmipp_yuv709full_to_rgbfull = {
+	/*    Cr	Y	Cb		Add */
+	CCTBL(394,	256,	0,		N10(197),	/* R */
+	      N11(118),	256,	N11(47),	82,		/* G */
+	      0,	256,	456,		N10(232)),	/* B */
+};
+
+static const struct dcmipp_colorconv_config dcmipp_yuv709lim_to_rgbfull = {
+	/*    Cr	Y	Cb		Add */
+	CCTBL(459,	298,	0,		N10(248),	/* R */
+	      N11(137),	298,	N11(55),	77,		/* G */
+	      0,	298,	541,		N10(289)),	/* B */
+};
+
+static const struct dcmipp_colorconv_config dcmipp_yuv709lim_to_rgblim = {
+	/*    Cr	Y	Cb		Add */
+	CCTBL(394,	256,	0,		N10(197),	/* R */
+	      N11(118),	256,	N11(47),	82,		/* G */
+	      0,	256,	465,		N10(232)),	/* B */
+	.clamping = true,
+	.clamping_as_rgb = true,
+};
+
+/* cconv_matrices[src_fmt][src_range][sink_fmt][sink_range] */
+static const struct dcmipp_colorconv_config *dcmipp_cconv_cfgs[3][2][3][2] = {
+	/* RGB */
+	{
+		/* RGB full range */
+		{
+			/* RGB full range => RGB */
+			{
+				NULL, NULL,
+			},
+			/* RGB full range => YUV601 */
+			{
+				&dcmipp_rgbfull_to_yuv601full,
+				&dcmipp_rgbfull_to_yuv601lim,
+			},
+			/* RGB full range => YUV709 */
+			{
+				&dcmipp_rgbfull_to_yuv709full,
+				&dcmipp_rgbfull_to_yuv709lim,
+			},
+		},
+		/* RGB limited range */
+		{
+			/* RGB limited range => RGB */
+			{
+				NULL, NULL,
+			},
+			/* RGB limited range => YUV601 */
+			{
+				NULL, &dcmipp_rgblim_to_yuv601lim,
+			},
+			/* RGB limited range => YUV709 */
+			{
+				NULL, &dcmipp_rgblim_to_yuv709lim,
+			},
+		},
+	},
+	/* YUV601 */
+	{
+		/* YUV601 full range */
+		{
+			/* YUV601 full range => RGB */
+			{
+				&dcmipp_yuv601full_to_rgbfull, NULL,
+			},
+			/* YUV601 full range => YUV601 */
+			{
+				NULL, NULL,
+			},
+			/* YUV601 full range => YUV709 */
+			{
+				NULL, NULL,
+			},
+		},
+		/* YUV601 limited range */
+		{
+			/* YUV601 limited range => RGB */
+			{
+				&dcmipp_yuv601lim_to_rgbfull,
+				&dcmipp_yuv601lim_to_rgblim,
+			},
+			/* YUV601 limited range => YUV601 */
+			{
+				NULL, NULL,
+			},
+			/* YUV601 limited range => YUV709 */
+			{
+				NULL, NULL,
+			},
+		},
+	},
+	/* YUV709 */
+	{
+		/* YUV709 full range */
+		{
+			/* YUV709 full range => RGB */
+			{
+				&dcmipp_yuv709full_to_rgbfull, NULL,
+			},
+			/* YUV709 full range => YUV601 */
+			{
+				NULL, NULL,
+			},
+			/* YUV709 full range => YUV709 */
+			{
+				NULL, NULL,
+			},
+		},
+		/* YUV709 limited range */
+		{
+			/* YUV709 limited range => RGB */
+			{
+				&dcmipp_yuv709lim_to_rgbfull,
+				&dcmipp_yuv709lim_to_rgblim,
+			},
+			/* YUV709 limited range => YUV601 */
+			{
+				NULL, NULL,
+			},
+			/* YUV709 limited range => YUV709 */
+			{
+				NULL, NULL,
+			},
+		},
+	},
+};
+
+enum dcmipp_cconv_fmt {
+	FMT_RGB = 0,
+	FMT_YUV601,
+	FMT_YUV709
+};
+
+static inline enum dcmipp_cconv_fmt to_cconv_fmt(struct v4l2_mbus_framefmt *fmt)
+{
+	/* YUV format codes are within the 0x2xxx */
+	if (fmt->code >= MEDIA_BUS_FMT_Y8_1X8 &&
+	    fmt->code < MEDIA_BUS_FMT_SBGGR8_1X8) {
+		if (fmt->ycbcr_enc == V4L2_YCBCR_ENC_709)
+			return FMT_YUV709;
+		else
+			return FMT_YUV601;
+	}
+
+	/* All other formats are referred as RGB, indeed, demosaicing bloc
+	 * generate RGB format
+	 */
+	return FMT_RGB;
+};
+
+#define FMT_STR(f) ({					\
+	typeof(f) __f = (f);				\
+	(__f) == FMT_RGB ? "RGB" :			\
+	(__f) == FMT_YUV601 ? "YUV601" :		\
+	(__f) == FMT_YUV709 ? "YUV709" : "?"; })
+
+enum dcmipp_cconv_range {
+	RANGE_FULL = 0,
+	RANGE_LIMITED,
+};
+
+static inline enum dcmipp_cconv_range
+to_cconv_range(struct v4l2_mbus_framefmt *fmt)
+{
+	if (fmt->quantization == V4L2_QUANTIZATION_FULL_RANGE)
+		return RANGE_FULL;
+
+	return RANGE_LIMITED;
+};
+
+#define RANGE_STR(range) ((range) == RANGE_FULL ? "full" : "limited")
+
+struct dcmipp_pixelproc_device {
+	struct dcmipp_ent_device ved;
+	struct v4l2_subdev sd;
+	struct device *dev;
+	bool streaming;
+
+	void __iomem *regs;
+	struct v4l2_ctrl_handler ctrls;
+
+	u32 pipe_id;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.code = PIXELPROC_MEDIA_BUS_FMT_DEFAULT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static const struct v4l2_rect crop_min = {
+	.width = DCMIPP_FRAME_MIN_WIDTH,
+	.height = DCMIPP_FRAME_MIN_HEIGHT,
+	.top = 0,
+	.left = 0,
+};
+
+/*
+ * Downscale is a combination of both decimation block (1/2/4/8)
+ * and downsize block (up to 8x) for a total of maximum downscale of 64
+ */
+#define DCMIPP_MAX_DECIMATION_RATIO	8
+#define DCMIPP_MAX_DOWNSIZE_RATIO	8
+#define DCMIPP_MAX_DOWNSCALE_RATIO	64
+
+/*
+ * Functions handling controls
+ */
+#define V4L2_CID_PIXELPROC_GAMMA_CORRECTION	(V4L2_CID_USER_BASE | 0x1001)
+
+static int dcmipp_pixelproc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct dcmipp_pixelproc_device *pixelproc =
+		container_of(ctrl->handler,
+			     struct dcmipp_pixelproc_device, ctrls);
+
+	if (pm_runtime_get_if_in_use(pixelproc->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_PIXELPROC_GAMMA_CORRECTION:
+		reg_write(pixelproc, DCMIPP_PxGMCR(pixelproc->pipe_id),
+			  (ctrl->val ? DCMIPP_PxGMCR_ENABLE : 0));
+		break;
+	}
+
+	pm_runtime_put(pixelproc->dev);
+
+	return 0;
+};
+
+static const struct v4l2_ctrl_ops dcmipp_pixelproc_ctrl_ops = {
+	.s_ctrl = dcmipp_pixelproc_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config dcmipp_pixelproc_ctrls[] = {
+	{
+		.ops		= &dcmipp_pixelproc_ctrl_ops,
+		.id		= V4L2_CID_PIXELPROC_GAMMA_CORRECTION,
+		.type		= V4L2_CTRL_TYPE_BOOLEAN,
+		.name		= "Gamma correction",
+		.min = 0,
+		.max = 1,
+		.step = 1,
+		.def = 0,
+	}
+};
+
+static void dcmipp_pixelproc_adjust_crop(struct v4l2_rect *r,
+					 const struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_rect src_rect = {
+		.top = 0,
+		.left = 0,
+		.width = fmt->width,
+		.height = fmt->height,
+	};
+
+	/* Disallow rectangles smaller than the minimal one. */
+	v4l2_rect_set_min_size(r, &crop_min);
+	v4l2_rect_map_inside(r, &src_rect);
+}
+
+static void
+dcmipp_pixelproc_adjust_fmt(struct dcmipp_pixelproc_device *pixelproc,
+			    struct v4l2_mbus_framefmt *fmt, u32 pad)
+{
+	const struct dcmipp_pixelpipe_pix_map *vpix;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_pixelpipe_pix_map_by_code(fmt->code,
+						pixelproc->pipe_id == 1 ? DCMIPP_MAIN : DCMIPP_AUX,
+						pad);
+	if (!vpix)
+		fmt->code = PIXELPROC_MEDIA_BUS_FMT_DEFAULT;
+
+	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
+			     DCMIPP_FRAME_MAX_WIDTH);
+	fmt->height = clamp_t(u32, fmt->height, DCMIPP_FRAME_MIN_HEIGHT,
+			      DCMIPP_FRAME_MAX_HEIGHT);
+
+	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+		fmt->field = V4L2_FIELD_NONE;
+
+	dcmipp_colorimetry_clamp(fmt);
+}
+
+static int dcmipp_pixelproc_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state)
+{
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		*v4l2_subdev_state_get_format(state, i) = fmt_default;
+
+		if (IS_SINK(i)) {
+			struct v4l2_rect r = {
+				.top = 0,
+				.left = 0,
+				.width = DCMIPP_FMT_WIDTH_DEFAULT,
+				.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+			};
+			*v4l2_subdev_state_get_crop(state, i) = r;
+			*v4l2_subdev_state_get_compose(state, i) = r;
+		}
+	}
+
+	return 0;
+}
+
+static int
+dcmipp_pixelproc_enum_mbus_code(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
+
+	return dcmipp_pixelpipe_enum_mbus_code(pixelproc->pipe_id == 1 ? DCMIPP_MAIN : DCMIPP_AUX,
+					       code);
+}
+
+static int
+dcmipp_pixelproc_enum_frame_size(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
+
+	return dcmipp_pixelpipe_enum_frame_size(pixelproc->pipe_id == 1 ? DCMIPP_MAIN : DCMIPP_AUX,
+						fse);
+}
+
+static int dcmipp_pixelproc_set_fmt(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *fmt)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
+
+	if (v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	dcmipp_pixelproc_adjust_fmt(pixelproc, &fmt->format, fmt->pad);
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
+		/* Forward format to SRC pad */
+		*src_fmt = fmt->format;
+		src_fmt->code = dcmipp_pixelpipe_src_format(fmt->format.code);
+	} else {
+		struct v4l2_rect *compose =
+			v4l2_subdev_state_get_compose(state, 0);
+
+		/* AUX (pipe_nb 2) cannot perform color conv */
+		if (pixelproc->pipe_id == 2) {
+			struct v4l2_mbus_framefmt *sink_fmt =
+				v4l2_subdev_state_get_format(state, 0);
+
+			fmt->format = *sink_fmt;
+			fmt->format.code =
+				dcmipp_pixelpipe_src_format(fmt->format.code);
+		}
+
+		fmt->format.width = compose->width;
+		fmt->format.height = compose->height;
+	}
+
+	/* Update the selected pad format */
+	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
+
+	return 0;
+}
+
+static int dcmipp_pixelproc_set_selection(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_selection *s)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
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
+		dcmipp_pixelproc_adjust_crop(&s->r, sink_fmt);
+
+		*crop = s->r;
+		*compose = s->r;
+
+		dev_dbg(pixelproc->dev, "s_selection: crop (%d,%d)/%ux%u\n",
+			crop->left, crop->top, crop->width, crop->height);
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = clamp_t(u32, s->r.width,
+				     crop->width / DCMIPP_MAX_DOWNSCALE_RATIO,
+				     crop->width);
+		s->r.height = clamp_t(u32, s->r.height,
+				      crop->height / DCMIPP_MAX_DOWNSCALE_RATIO,
+				      crop->height);
+		*compose = s->r;
+
+		dev_dbg(pixelproc->dev, "s_selection: compose (%d,%d)/%ux%u\n",
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
+static int
+dcmipp_pixelproc_colorconv_config(struct dcmipp_pixelproc_device *pixelproc,
+				  struct v4l2_mbus_framefmt *sink,
+				  struct v4l2_mbus_framefmt *src)
+{
+	const struct dcmipp_colorconv_config *cconv_cfg;
+	enum dcmipp_cconv_fmt sink_fmt = to_cconv_fmt(sink);
+	enum dcmipp_cconv_range sink_range = to_cconv_range(sink);
+	enum dcmipp_cconv_fmt src_fmt = to_cconv_fmt(src);
+	enum dcmipp_cconv_range src_range = to_cconv_range(src);
+	unsigned int val = 0;
+	int i;
+
+	/* Disable color conversion by default */
+	reg_write(pixelproc, DCMIPP_P1YUVCR, 0);
+
+	if (sink_fmt == src_fmt && sink_range == src_range)
+		return 0;
+
+	/* color conversion */
+	cconv_cfg = dcmipp_cconv_cfgs[sink_fmt][sink_range][src_fmt][src_range];
+	if (!cconv_cfg) {
+		dev_err(pixelproc->dev,
+			"Unsupported color conversion %s-%s => %s-%s\n",
+			FMT_STR(sink_fmt), RANGE_STR(sink_range),
+			FMT_STR(src_fmt), RANGE_STR(src_range));
+		return -EINVAL;
+	}
+
+	dev_dbg(pixelproc->dev, "color conversion %s-%s => %s-%s\n",
+		FMT_STR(sink_fmt), RANGE_STR(sink_range),
+		FMT_STR(src_fmt), RANGE_STR(src_range));
+
+	for (i = 0; i < 6; i++)
+		reg_write(pixelproc, DCMIPP_P1YUVRR1 + (4 * i),
+			  cconv_cfg->conv_matrix[i]);
+
+	if (cconv_cfg->clamping)
+		val |= DCMIPP_P1YUVCR_CLAMP;
+	if (cconv_cfg->clamping_as_rgb)
+		val |= DCMIPP_P1YUVCR_TYPE_RGB;
+	val |= DCMIPP_P1YUVCR_ENABLE;
+
+	reg_write(pixelproc, DCMIPP_P1YUVCR, val);
+
+	return 0;
+}
+
+#define DCMIPP_PIXELPROC_HVRATIO_CONS	8192
+#define DCMIPP_PIXELPROC_HVRATIO_MAX	65535
+#define DCMIPP_PIXELPROC_HVDIV_CONS	1024
+#define DCMIPP_PIXELPROC_HVDIV_MAX	1023
+static void
+dcmipp_pixelproc_set_crop_downscale(struct dcmipp_pixelproc_device *pixelproc,
+				    struct v4l2_rect *compose,
+				    struct v4l2_rect *crop)
+{
+	unsigned int hratio, vratio, hdiv, vdiv;
+	unsigned int hdec = 0, vdec = 0;
+	unsigned int h_post_dec = crop->width;
+	unsigned int v_post_dec = crop->height;
+
+	/* Configure cropping */
+	reg_write(pixelproc, DCMIPP_PxCRSTR(pixelproc->pipe_id),
+		  (crop->top << DCMIPP_PxCRSTR_VSTART_SHIFT) |
+		  (crop->left << DCMIPP_PxCRSTR_HSTART_SHIFT));
+	reg_write(pixelproc, DCMIPP_PxCRSZR(pixelproc->pipe_id),
+		  (crop->width << DCMIPP_PxCRSZR_HSIZE_SHIFT) |
+		  (crop->height << DCMIPP_PxCRSZR_VSIZE_SHIFT) |
+		  DCMIPP_PxCRSZR_ENABLE);
+
+	/* Compute decimation factors (HDEC/VDEC) */
+	while (compose->width * DCMIPP_MAX_DOWNSIZE_RATIO < h_post_dec) {
+		hdec++;
+		h_post_dec /= 2;
+	}
+	while (compose->height * DCMIPP_MAX_DOWNSIZE_RATIO < v_post_dec) {
+		vdec++;
+		v_post_dec /= 2;
+	}
+
+	/* Compute downsize factor */
+	hratio = h_post_dec * DCMIPP_PIXELPROC_HVRATIO_CONS /
+		 compose->width;
+	if (hratio > DCMIPP_PIXELPROC_HVRATIO_MAX)
+		hratio = DCMIPP_PIXELPROC_HVRATIO_MAX;
+	vratio = v_post_dec * DCMIPP_PIXELPROC_HVRATIO_CONS /
+		 compose->height;
+	if (vratio > DCMIPP_PIXELPROC_HVRATIO_MAX)
+		vratio = DCMIPP_PIXELPROC_HVRATIO_MAX;
+	hdiv = (DCMIPP_PIXELPROC_HVDIV_CONS * compose->width) /
+		h_post_dec;
+	if (hdiv > DCMIPP_PIXELPROC_HVDIV_MAX)
+		hdiv = DCMIPP_PIXELPROC_HVDIV_MAX;
+	vdiv = (DCMIPP_PIXELPROC_HVDIV_CONS * compose->height) /
+		v_post_dec;
+	if (vdiv > DCMIPP_PIXELPROC_HVDIV_MAX)
+		vdiv = DCMIPP_PIXELPROC_HVDIV_MAX;
+
+	dev_dbg(pixelproc->dev, "%s: decimation config: hdec: 0x%x, vdec: 0x%x\n",
+		pixelproc->sd.name,
+		hdec, vdec);
+	dev_dbg(pixelproc->dev, "%s: downsize config: hratio: 0x%x, vratio: 0x%x, hdiv: 0x%x, vdiv: 0x%x\n",
+		pixelproc->sd.name,
+		hratio, vratio,
+		hdiv, vdiv);
+
+	reg_clear(pixelproc, DCMIPP_PxDCCR(pixelproc->pipe_id),
+		  DCMIPP_PxDCCR_ENABLE);
+	if (hdec || vdec)
+		reg_write(pixelproc, DCMIPP_PxDCCR(pixelproc->pipe_id),
+			  (hdec << DCMIPP_PxDCCR_HDEC_SHIFT) |
+			  (vdec << DCMIPP_PxDCCR_VDEC_SHIFT) |
+			  DCMIPP_PxDCCR_ENABLE);
+
+	reg_clear(pixelproc, DCMIPP_PxDSCR(pixelproc->pipe_id),
+		  DCMIPP_PxDSCR_ENABLE);
+	reg_write(pixelproc, DCMIPP_PxDSRTIOR(pixelproc->pipe_id),
+		  (hratio << DCMIPP_PxDSRTIOR_HRATIO_SHIFT) |
+		  (vratio << DCMIPP_PxDSRTIOR_VRATIO_SHIFT));
+	reg_write(pixelproc, DCMIPP_PxDSSZR(pixelproc->pipe_id),
+		  (compose->width << DCMIPP_PxDSSZR_HSIZE_SHIFT) |
+		  (compose->height << DCMIPP_PxDSSZR_VSIZE_SHIFT));
+	reg_write(pixelproc, DCMIPP_PxDSCR(pixelproc->pipe_id),
+		  (hdiv << DCMIPP_PxDSCR_HDIV_SHIFT) |
+		  (vdiv << DCMIPP_PxDSCR_VDIV_SHIFT) |
+		  DCMIPP_PxDSCR_ENABLE);
+}
+
+static int dcmipp_pixelproc_enable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Configure crop/downscale */
+	dcmipp_pixelproc_set_crop_downscale(pixelproc,
+					    v4l2_subdev_state_get_compose(state, 0),
+					    v4l2_subdev_state_get_crop(state, 0));
+
+	/* Configure YUV Conversion (if applicable) */
+	if (pixelproc->pipe_id == 1) {
+		ret = dcmipp_pixelproc_colorconv_config(pixelproc,
+							v4l2_subdev_state_get_format(state, 0),
+							v4l2_subdev_state_get_format(state, 1));
+		if (ret)
+			return ret;
+	}
+
+	/* Apply customized values from user when stream starts. */
+	ret =  v4l2_ctrl_handler_setup(pixelproc->sd.ctrl_handler);
+	if (ret < 0) {
+		dev_err(pixelproc->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(pixelproc->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dcmipp_pixelproc_disable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0)
+		dev_err(pixelproc->dev,
+			"failed to stop source subdev streaming (%d)\n",
+			ret);
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_pixelproc_pad_ops = {
+	.enum_mbus_code		= dcmipp_pixelproc_enum_mbus_code,
+	.enum_frame_size	= dcmipp_pixelproc_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_pixelproc_set_fmt,
+	.get_selection		= dcmipp_pixelpipe_get_selection,
+	.set_selection		= dcmipp_pixelproc_set_selection,
+	.enable_streams		= dcmipp_pixelproc_enable_streams,
+	.disable_streams	= dcmipp_pixelproc_disable_streams,
+};
+
+static const struct v4l2_subdev_core_ops dcmipp_pixelproc_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops dcmipp_pixelproc_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops dcmipp_pixelproc_ops = {
+	.core = &dcmipp_pixelproc_core_ops,
+	.pad = &dcmipp_pixelproc_pad_ops,
+	.video = &dcmipp_pixelproc_video_ops,
+};
+
+static void dcmipp_pixelproc_release(struct v4l2_subdev *sd)
+{
+	struct dcmipp_pixelproc_device *pixelproc = v4l2_get_subdevdata(sd);
+
+	kfree(pixelproc);
+}
+
+static const struct v4l2_subdev_internal_ops dcmipp_pixelproc_int_ops = {
+	.init_state = dcmipp_pixelproc_init_state,
+	.release = dcmipp_pixelproc_release,
+};
+
+void dcmipp_pixelproc_ent_release(struct dcmipp_ent_device *ved)
+{
+	struct dcmipp_pixelproc_device *pixelproc =
+			container_of(ved, struct dcmipp_pixelproc_device, ved);
+
+	dcmipp_ent_sd_unregister(ved, &pixelproc->sd);
+}
+
+static int dcmipp_name_to_pipe_id(const char *name)
+{
+	if (strstr(name, "main"))
+		return 1;
+	else if (strstr(name, "aux"))
+		return 2;
+	else
+		return -EINVAL;
+}
+
+struct dcmipp_ent_device *
+dcmipp_pixelproc_ent_init(const char *entity_name,
+			  struct dcmipp_device *dcmipp)
+{
+	struct dcmipp_pixelproc_device *pixelproc;
+	const unsigned long pads_flag[] = {
+		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+	};
+	int ret, i;
+
+	/* Allocate the pixelproc struct */
+	pixelproc = kzalloc_obj(*pixelproc);
+	if (!pixelproc)
+		return ERR_PTR(-ENOMEM);
+
+	pixelproc->regs = dcmipp->regs;
+	pixelproc->dev = dcmipp->dev;
+
+	/* Pipe identifier */
+	pixelproc->pipe_id = dcmipp_name_to_pipe_id(entity_name);
+	if (pixelproc->pipe_id != 1 && pixelproc->pipe_id != 2) {
+		dev_err(pixelproc->dev, "failed to retrieve pipe_id\n");
+		kfree(pixelproc);
+		return ERR_PTR(-EIO);
+	}
+
+	/* Initialize controls */
+	v4l2_ctrl_handler_init(&pixelproc->ctrls,
+			       ARRAY_SIZE(dcmipp_pixelproc_ctrls));
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixelproc_ctrls); i++)
+		v4l2_ctrl_new_custom(&pixelproc->ctrls,
+				     &dcmipp_pixelproc_ctrls[i], NULL);
+
+	pixelproc->sd.ctrl_handler = &pixelproc->ctrls;
+	if (pixelproc->ctrls.error) {
+		ret = pixelproc->ctrls.error;
+		dev_err(pixelproc->dev, "control initialization error %d\n", ret);
+		kfree(pixelproc);
+		return ERR_PTR(ret);
+	}
+
+	/* Initialize ved and sd */
+	ret = dcmipp_ent_sd_register(&pixelproc->ved, &pixelproc->sd,
+				     &dcmipp->v4l2_dev, entity_name,
+				     MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER,
+				     ARRAY_SIZE(pads_flag), pads_flag,
+				     &dcmipp_pixelproc_int_ops,
+				     &dcmipp_pixelproc_ops,
+				     NULL, NULL);
+	if (ret) {
+		kfree(pixelproc);
+		return ERR_PTR(ret);
+	}
+
+	pixelproc->ved.dcmipp = dcmipp;
+
+	return &pixelproc->ved;
+}

-- 
2.43.0


