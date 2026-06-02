Return-Path: <linux-media+bounces-63380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yg0CAnjZHmp4WAAAu9opvQ
	(envelope-from <linux-media+bounces-63380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:24:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ED062E723
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:24:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=e6vAiYnW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63380-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63380-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 266B5305D5D7
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B973ED3AF;
	Tue,  2 Jun 2026 13:14:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4033E51EB;
	Tue,  2 Jun 2026 13:14:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406092; cv=fail; b=cavEUXoxNaTxzieEM+QbWnYU6dOZvNbh/BnCZKczyAF0qrwuVzdwl725gOcUuv7eKQxD8uLjzFjPM2LzIeBVH5jbhIYdK0mKC0QPp/GDUHB9IMnUSkBzysZQtUvJ28gMLN6r1d47E6JNggjbD1BhPGrrLQuxb/ZMMrZmrYv5kpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406092; c=relaxed/simple;
	bh=KzzSxMPp426bH5e7tls5X5ScFt7CRjngfallpfWVJ+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U7hgtR6MKdeKs7emHoUSc8skPRPMYwjhLrDay+hyNoadsOVP3IEF2x8w7DUeFSvWM0dWwbIaS9ECmokvgdVyZPyrGIYRje+m18bOUwlJvlZpJo8xQRh7SdJ/sFO+Lm5YYJ7epPx6O6DwajX0u6uvzRrfoukUz3CHBiqj2nwH214=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=e6vAiYnW; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaYEC3uDdIQGKqOk5twxk76MHij1Av3/wiVnySkBJHbMposHvpTtuONAbRaD+jibjK65EIs96NYsi31foxWxlpELA7Ly7XW3KeBrNopblN8JpIU1SbsBmV6sHtaN8APm5pj+uaMBnuFUMfgl25LiT8hixoTHCsBeeoFcE8HFYiyUwIQ5JX/H0L+Fp+QpxKRao0bQ2LqcvcWTvMCfAbN2HTFva5WqT3VRuqOXqEboaehm4DSd97wu5xt4Q7K5HQd9N/j7K0YCtgsVecKtjd8sAuaUxgS5BbHw52hXxSkRshuhJ7LiLPsKg2MWDm8tw8aRPNPS3774ZYMbB8tTlb3Bzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3hPYCi5GhSF/VMpCP3aWC9ufDW6VFxMQD/0kHDRv9k=;
 b=tCMJJuUyrYKopL93gARNn4G635/wg6b0s+52HVWVPAeOnR37PV1Wx+xPE9QMKoGHAKRWA4yTCDo862TLO0ZzL3IODP0ucbvdT1yhvR/gW+3xNFutBoTYYXcFZX5PojFt8fSyGkRAS32sLFccyDQp8RY9LVf5cnxRcjx1glxkh5fmWT5aX7MO1vEMIWNhbDMBGGii5y51oqEUqsqL3AdYi3f/WC8fujJvyDdIlVNdTCjt+iUyO62WwfMDW9aDEQXQSd80yOUaSdizPvjFwdjlQ6GHeIEdKkkBzEjSsVgNpE3JldemsGDxyqNSoJ5M+fu43jCRYoxtWVLXzCsiTAKKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3hPYCi5GhSF/VMpCP3aWC9ufDW6VFxMQD/0kHDRv9k=;
 b=e6vAiYnWvEfAtW57l/lGODy5xYKc6hc8BldlSwqLNARjorJayGOnx466TtSfZjAVyymPjwgMt4SL8ria/V4iWpxsqkRImwPTKenR39ZszRzh26nE0vuGpP0OEDhDaYaZBaldV7s5Iq/q/xNIt/sh0/dviDxZvtZ1F51zayKX3+Mn50JNQandrM4zKZXMbWlYIkw5QRAOjThp1kpOT4JzkdSRtu3MG7bNXcmso9yvaLYp4HTTR2ZV1h/XHVEMmDIbUTm1Ae+yQ0nVjTppO/7C4CdA1x8J/bYW7RmjnKxAOAnbySuImhDtwttd+S4far+5jIvcQNI/3LrnNRtpv9r+Bg==
Received: from DB9PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:1da::23)
 by VI0PR10MB8834.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:14:43 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::72) by DB9PR05CA0018.outlook.office365.com
 (2603:10a6:10:1da::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:51 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:41 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:05 +0200
Subject: [PATCH v2 08/13] media: stm32: dcmipp: add pixel pipes helper
 functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-8-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|VI0PR10MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: ef45e967-1f19-4ea9-2782-08dec0a8e8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bxxHiikQP9vcoER8301cFl+KtXS0mNx+oCRke8hHPO616M81Apgg9d/Bos/InEBV51ELWhAOKlZct3yi7G9suDeP0PfdM8PMHJCK66Z+SKyonh2PvRBhRlGsSoXvwMxACy3RYyoAc5cwSnYkLCXZSDDgJP69E4xkZtF+TiyuLPLmIUYsVTQgJ4yzLXxpsFD2nMkW0GuHqVkdrD1T08DtVHT7pxreiqg9cNJd6zWDJkYJJrkAlY6G7mtno8u/8B9NUVaGMNeDH1dEXhA+OK93+aw+zcMRL2KvJgJUgoYFJL22YYu8Jo8R+h68S3D600rc7RIJyMiS+cz3KJW2Iz9FMgVDiZ+STBmJVKdlmWL7g7wfA6yoTzSrO+PSHp2ka7ShcBfHH0wVpQWFZEWDabECDDMDUI8OfKCsbt8r2XWX4qOTNZSXDI3fcQwov5unxyNNFhkNf7O+VmIx4mpWQGUa6PFxWXZHYhXClHjUFM6ihloD3Il6kTj5Vv0dyQeOuWifAylsEp8XXT3AQT7eNuKsXLnjrsv48E0wnsL2jJ6+/Bg5YhDN1hJDXUz7sPtXouvl8hFt7bu/W3VUyGW8vHc0m9X/Bdx2IwmJ5An98uJocUVj1v5CTae3sxKRDn0LzBMSVqNGsurLWIo3xjeqa/va9XPRUiZXNRuTqjqAQIlD5XorKdci2YffAU5v5qv3xXAaiO3PUSgtKdJ8ywHt+HNWVAsDEG3w/hPUotNhUZI9AmI=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xf5giYxdn5rD7Z09IieAY+Sp58noJzvlbcEjIPWmje8Bnf5SQmDj4RBuoyV3weou6vEyGsB+U+TmErAxEFPI54ZC87pa/NuAfLuKRxM+l+2xPWayATgPTBZbAGMdNX5jKANvf/jgXsHeq52HTzyMWQR/4EVZ1DpLVAJ1KzARSM9A42D4LE8Myo5zB8S+axEKThS8gcw9yngxiUSeYWEiRK7zWOsSgM7I3x4Kh7bL4MTsjBntfU+ifcc052Sa+N4/BqWhMK47iOEVgdIQCmLNeqv1e5mOImBHoIWvWBBniChoM9GY85SQync3N0KkElb3Gd+fu1g/NXgMHQ62yVtPDXsIbqhOzQprInMs1lHPxhXggV+nIarZgXmvn14O9YtdF2JKn9XMNYDOOFl4ztKZgcvfCCrvXBnBr2qLLzllJ/7rdIDrkdL1wwbbaEIq84d1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:42.5031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef45e967-1f19-4ea9-2782-08dec0a8e8d0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8834
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63380-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,st.com:email];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9ED062E723

Pixel pipes are made of an isp subdev (only main pipe) and a
postproc subdev. This commit add a helper functions common to
those 2 subdevs such as for handling format enumeration,
set_selection handling, so that they do not have to be
duplicated in the two subdeves.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   1 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 +++++++++++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +++++
 3 files changed, 222 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 159105fb40b8..54231569ed6f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
new file mode 100644
index 000000000000..8b0699e870ef
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
@@ -0,0 +1,180 @@
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
+#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
+#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
+#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
+#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
+#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
+#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
+#define DCMIPP_MAIN_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
+#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
+#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
+#define DCMIPP_AUX_POSTPROC_INOUT					\
+	(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
+#define DCMIPP_ALL_POSTPROC_SINK					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
+#define DCMIPP_ALL_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
+
+#define PIXMAP_MBUS(mbus, applicable_pipes)		\
+	{						\
+		.code = MEDIA_BUS_FMT_##mbus,		\
+		.pipes = applicable_pipes,		\
+	}
+static const struct dcmipp_pixelpipe_pix_map
+dcmipp_pixel_formats_list[] = {
+	/* RGB formats */
+	/* RGB565 / RGB888 */
+	PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
+	/* YUV formats */
+	PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
+	/* GREY */
+	PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	/* Raw Bayer */
+	/* Raw 8 */
+	PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
+	/* Raw 10 */
+	PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
+	/* Raw 12 */
+	PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
+	/* Raw 14 */
+	PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (dcmipp_pixel_formats_list[i].code == code &&
+		    dcmipp_pixel_formats_list[i].pipes & DCMIPP_ENT(id, pad))
+			return &dcmipp_pixel_formats_list[i];
+	}
+
+	return NULL;
+}
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int index = code->index;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (!(dcmipp_pixel_formats_list[i].pipes &
+		      DCMIPP_ENT(id, code->pad)))
+			continue;
+
+		if (index == 0)
+			break;
+
+		index--;
+	}
+
+	if (i == ARRAY_SIZE(dcmipp_pixel_formats_list))
+		return -EINVAL;
+
+	code->code = dcmipp_pixel_formats_list[i].code;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct dcmipp_pixelpipe_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_pixelpipe_pix_map_by_code(fse->code, id, fse->pad);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fse->max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fse->min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fse->max_height = DCMIPP_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r = *v4l2_subdev_state_get_crop(state, s->pad);
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = sink_fmt->width;
+		s->r.height = sink_fmt->height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r = *v4l2_subdev_state_get_compose(state, s->pad);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format)
+{
+	if (input_format >= MEDIA_BUS_FMT_Y8_1X8 &&
+	    input_format < MEDIA_BUS_FMT_SBGGR8_1X8)
+		return MEDIA_BUS_FMT_YUV8_1X24;
+
+	return MEDIA_BUS_FMT_RGB888_1X24;
+}
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
new file mode 100644
index 000000000000..db29e1fe939e
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#ifndef _DCMIPP_PIXELCOMMON_H
+#define _DCMIPP_PIXELCOMMON_H
+
+#define IS_SINK(pad) (!(pad))
+#define IS_SRC(pad)  ((pad))
+
+#define DCMIPP_ISP		0
+#define DCMIPP_MAIN		1
+#define DCMIPP_AUX		2
+
+struct dcmipp_pixelpipe_pix_map {
+	__u32 code;
+	__u32 pipes;
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad);
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code);
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse);
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s);
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format);
+
+#endif

-- 
2.43.0


