Return-Path: <linux-media+bounces-51252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFD5Dj3mcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:44:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B819F58956
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EF42A08F05
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD704921B7;
	Wed, 21 Jan 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="da2CX6T0"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C72492511;
	Wed, 21 Jan 2026 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003711; cv=fail; b=S/XbhuL1FO2Sdlowq9p6gxLstiSohdLJfSbVwaedaWViz5879len9C+K2YCjY2kTuTiHq/UEn3oGGoND/1NEJv98GAbIfGyKtvYo+2HI419WvLkGFM+JhzpmHxl//BBiNCUmTiqfFgPt6uhLzDNeQ9cmhiRZW2Y0F/bEU8Us3pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003711; c=relaxed/simple;
	bh=2AzDDQ/c33gDTUejdZzmjwebk2IrQn3OwFoYgpL3lnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9sIJH9N8V8FP+/+PeMMnyig/0zA3WJzV1aoyqHIOFEuXy0NZSqRbu/VRt3JrPgNnTRcPOKY7nudVF5+HpMuFvZP9dWPPAaO46NsoJLHf2SAfCuUhhcXhiHexzXVnW23DZE0R7cRNEHbiea1AgjHka8KcSoeZRE4H69GMWOjtZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=da2CX6T0; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqI1/JZpZOV2eMR1pRTzK7UiJtvFonrRsERRkoKJZHF4P9Dh7s3jlfXtgahbq+tVxVJ/sbz2EHulhjqnaTKuvxpCWZVXwyCj4W0/JLPeIQM6PH5gECo71B61zbc1l9skfBjZkmo0qPGBC2fvk+vjBY+ZpfMKB1Q8Grk8knyNRFn6K7K3XksfApDb6fEQK9GlLgE6Rl4SpkL6Zd4+eWdojHyy3nHwEAc3Wx5//ETSolbO/6xQmXi8LFESKjTniQW7SaxfHMtCi2Dd3xk3TTj9NM3W8DD5zsYFrEn6s670Vz33bGhGx3rOBQc+Qo9ve7U1WoKzYWU2O7Vo4Y7U4FJvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2uVnM4fJLG2Q8yNrNtcnhK4gAywDIJhuWg84A8RS4A=;
 b=lgy/Cq/RdMX/oaQE1xwFAtqOd+VMpJc8eleqwYwvCBgpNCfLmH147x7+iKuCVglGyQCc6ezqt9ea0h1/VBu2ZdAE+wbcshAlWQ33alNBcdY7FzityEZkjaneQY/nuTcs0i17qjKOU0pOQoHp1KMCxJ/tN4gCbBoiQPzF7TwounnjBSxy8hB+BzPXmYdPBtIhlANBdL8R3OqSJxvw4j5wFHzqn3gFFPb0vCFH+q5NtIOvMq/9GiRAEIXmuGnhMfIMciJT2+XnAl7CYf4w+my/Nkg/ruui6KY2tSxhPUlo83jtge1VnMFOQNMY+8UiEsABx6VKp1gBUgQW9UZC6VoLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2uVnM4fJLG2Q8yNrNtcnhK4gAywDIJhuWg84A8RS4A=;
 b=da2CX6T09O/VBsWp/UCX2+pcpuE1KL5k+Wz4r/1WhgU1ZSz+dzOAdfhkoaJDFinBi+WZRe5pHfqL9kzX79jLkzqaEc8Wnxw2Up1VTx7fGPmNauQdAU8RiiT3HRXa1r1831cTUwCgC3SmnO82pTLjvErngXF+2qGKwOD5L1X6MN0=
Received: from BYAPR07CA0074.namprd07.prod.outlook.com (2603:10b6:a03:12b::15)
 by CY5PR10MB6238.namprd10.prod.outlook.com (2603:10b6:930:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:55:03 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:a03:12b:cafe::6) by BYAPR07CA0074.outlook.office365.com
 (2603:10b6:a03:12b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:55:02 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:01 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:01 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIA3104105;
	Wed, 21 Jan 2026 07:54:53 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v10 04/18] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
Date: Wed, 21 Jan 2026 19:24:10 +0530
Message-ID: <20260121135424.1185710-5-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CY5PR10MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: feb3f0ce-fa31-46fb-7cc4-08de58f4aca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lFIfM3vCyslVvGzeNwaOGdfWXvPLdcOz+Sm0FIxF/lZ/q1jAWexZpKciA/cV?=
 =?us-ascii?Q?FCkm/sHiWf6JfF0df+dX0f+bMajcxwMLrWc7eRMOhgUU7JgngMlJPMDOoHDA?=
 =?us-ascii?Q?KNr71YfK3U0AXOVykshyLi/97kL9s/EUqMrjOegdStx56/hPrh1Y6s0qtkKs?=
 =?us-ascii?Q?M+X1G/EmkSl7BGFcDJ0N58bmJNvETDU2QdXLce07iL4yIRwo4Jh6EmV5Om0p?=
 =?us-ascii?Q?ojmwRqnu1Pl7yqLKuYgOB98X1AvnperhKQgaQ8dpm1gghframYF9VgQXuKsz?=
 =?us-ascii?Q?nwpH9n6aBS70yssi+O008+vY9vOIBMlkVTTVEiOPWT5/9BRvAYzz9fDahu++?=
 =?us-ascii?Q?LQS26tDfsnHgzmoPFBfu76PUg+HNhUNRaGxGIZUFjaEsDB0oHePkhcJ++iwT?=
 =?us-ascii?Q?fYgbrPhYUcN2Wu1siDSZm6B/9KL/WX/080PnVbDLWVGkMXlZUw7e3Z3m7bPu?=
 =?us-ascii?Q?BVIvCQpUDC0TIcTvqmr8nk7WDR/oPPysPYN0j4d4ygGPtM2QGo+4edzjp82i?=
 =?us-ascii?Q?D5vu6VAiETpBDQkF+M+NMPc2z86kxkXICEDUZiZtACHQvr/CxAolJaQ4+hDa?=
 =?us-ascii?Q?8V2fpaTtkCgQypaA3XvqGQjFbwmi+qYi/AJUPyYLRgs6i4IbNxqy19kbpWJm?=
 =?us-ascii?Q?5nokYTHqLcxfGrOTTBv8fAwN/rSl3hwbaK5suY0owvNMlO1Z06fvODRffgFz?=
 =?us-ascii?Q?ggJz+517EGNKUNeYh/9HMNgJYNNj8I+YvnGYjAPcLBcMwkZvOWMUFQh6ITAq?=
 =?us-ascii?Q?1a3ryPEyWRwEkvR59g1FwGuYjIcUwvQ6pl2hq3nXqLMxZGxgJ3dgMLn7i0Un?=
 =?us-ascii?Q?epgdq5zlWvHSgqC71qoGtffz0zKxLMdYuZAJ94dai1E5Snz942fCJYR0kPPX?=
 =?us-ascii?Q?bFvBpI5MM3BGIJ3AfurJuGwckWu2k8HYcVe/1t7J3UDzsriefPDsKtpKMlge?=
 =?us-ascii?Q?w/Mdrpoe1EcoqZanWdnELaol7D+OdR2G3EISevD81wbDlqpddSrXvfPrNjva?=
 =?us-ascii?Q?BzSegwitAviWJef6+fmxKF5D+afcdV7yXNP91FbiZedKpf92yPn4C+Hn3g+A?=
 =?us-ascii?Q?fFlRByQwo5UY6zepNweayIoigZmPZsR8EoFCCwuEZ+gPsy6vd5e0o+0mblT5?=
 =?us-ascii?Q?eKsNXKgyux0dhJRnN8Ci/lAQS3inkPSgvRgXhPGTJXv1xGsyzx1GNc0aVZEx?=
 =?us-ascii?Q?V6NNxDzHoWWKAhlmveb/ErKc+aNz5HXflSLnlCs2qFPvcfJpVuw3UGj1/onP?=
 =?us-ascii?Q?3ey/SuMUwg5xEJRUubyMYQtj5Tlw+AgseTM0Qib/PM3nP1jVxYCdLAxgv/PL?=
 =?us-ascii?Q?1vShZrV2DvDYpSiIAGyBDUNTl0532dx16yl0QvXWaIP4EVXU6Hh3coYsNSnA?=
 =?us-ascii?Q?1AmFyOYOygmuKbjpuql5Jg4wn7LbdLkvIDnj+AwSO6tyR1zi1TfxJzi0rQEs?=
 =?us-ascii?Q?o/o/s7F85N2n3IXnDGfA1+ITCrKoYjO1YcnapET+R7tt/iuEyMLmftNSvJ8z?=
 =?us-ascii?Q?Muy2v45ont7Cj5xrSkTeQzdpfw9gCcS+zv92uGhCPPbZD7noPUDhsSCNNEVL?=
 =?us-ascii?Q?Y8vTuLL969SZ7Z++8rebsE70E0DIXlqlOYMtY+G+x3Ogi9Nh8JbkfGPAwv4c?=
 =?us-ascii?Q?9ltDRL/Mf8K4jNJn847hjwj16aR1GiB3wb5SOrXPo1t6Is2ZwIDxpyZz/jMG?=
 =?us-ascii?Q?ucbtLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:02.3381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb3f0ce-fa31-46fb-7cc4-08de58f4aca0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6238
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51252-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:dkim,ti.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ideasonboard.com:email];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B819F58956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

Currently the SHIM code to configure the context only touches the first
context. Add support for writing to the context's registers based on the
context index.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 23717a3b6c4cf..fdbe72df5c5f8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -27,7 +27,7 @@
 #define SHIM_CNTL			0x10
 #define SHIM_CNTL_PIX_RST		BIT(0)
 
-#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
@@ -38,7 +38,7 @@
 #define SHIM_DMACNTX_SIZE_16		1
 #define SHIM_DMACNTX_SIZE_32		2
 
-#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
@@ -568,11 +568,13 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
-	writel(reg, csi->shim + SHIM_DMACNTX);
+	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+
+	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
 	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
-	writel(reg, csi->shim + SHIM_PSI_CFG0);
+	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
 }
 
 static void ti_csi2rx_drain_callback(void *param)
@@ -890,7 +892,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -905,7 +907,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
 	if (ret)
-- 
2.34.1


