Return-Path: <linux-media+bounces-51258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GfWH9TfcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:16:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BFE58432
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8BBF1721EDC
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4371F4A1392;
	Wed, 21 Jan 2026 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cmxobkdD"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF38C49553B;
	Wed, 21 Jan 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003751; cv=fail; b=Nj76xepvC3L0tvqxfXcy5fhBRlYVVi1EqMyqjzVDj+wViALuthif7czRIJMg7PijmSX76PD0FzFTr30DNgAhhmH2LpHeSu7Un7BDK211CBUa+b7Z/vF/t43eHKUNLoGmg3VB4SLrEsUcOovSFUif+IfCX3PstOLI/Ni5vtHMSVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003751; c=relaxed/simple;
	bh=EnKzAVgrka77LP26Zt9rYBkJ4+lj61TViRMgwNk1Gp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TjTap1O6PpDDh7JWmYLO2DT0vOKQUeDER+NVXppJKiRFnFk9Hr1VWSqp4mQPXHyqIypZ/oUZhYDmlj9+VWaPuYjwxg904M/h1UBeU5Z1gon4rvIs6uFLL4u835UwNunpwPXy3Xz3BllssS08RGijXOg7sw76OgFZP2ymzb2J7Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cmxobkdD; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH3UsJmP7YucQv2o8cvq7kvL7tFGyV8eifuqi5C7o8S3msS3sPvK3Bo2KM2aONHzhasebXdAOogg2wUA1sMsO1TDDYDxbkaeQ+K1tQgScUAmFcZQGFrAiOUHC/eevPeB2RSBdtPKtE77UdPPXTqlQKnYUvoN6OuX1vxUBpX6Qmbn+q+rteYYS7msp/3YjoPEWxrv9o8d084X9Mr5d0sO2Zu8FDtXBJg8e4CcWDeaBx3Vi90HYpZsLar0+c8aorXq/vGDlX8p1sqW7haSL/9SCruKNrjM+G13zqPCDGgMBnaK/ig66Lb7kDS27BBfdYfYzsCcK7nfHOzLJh252AXwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRQb1xfhobyyQd8pxONvKgzkLVyWHBaYmUmTKv81df8=;
 b=HNiAs5p7GIbzfnCih2jmfZiViv2X7/T65V8C3tvYh41fjEj/0mElIceuDAcAH5j10e5X8UY8CPy1+26PziOeblaVL7uQJ/A5vxK225+UnUZIse62tXLm4RBfuYDvFV2w+o31eiVfUorYkGCF7n/PLHYtnkadzK33evBDXMiMKthcnMlH2clb6PnQxnNZ7GuIuBjrvECFvy9vcIPN+4mNA9RuRRRNyAvhZ3WZiLuBT3/bMfpZ4lq22Ua3+tMrItL+kdgpihQxCBwEMNyGflsjb89G+ELjt7/znXGwKva4JA5JfTTpNxtd95smdO0iCyBc9GLSFu8qdiba6ZM85dJFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRQb1xfhobyyQd8pxONvKgzkLVyWHBaYmUmTKv81df8=;
 b=cmxobkdDR30tF/DPEZOT3qIlG99F4hd71cDBMbmL9Y7UNCYuTNm5XTIyI6hV5wfe9wzXcflSUDGDB1rcUW37FFZ95gNce05Yx73Gr/R8doYnVP5GBAjlGUAZJVmetFOndTBBRDn2lBSiMhwpaTik2pHWR6Fi6M/hm9z6x37Hy/I=
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 21 Jan
 2026 13:55:47 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::41) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:55:44 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:43 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:43 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIG3104105;
	Wed, 21 Jan 2026 07:55:36 -0600
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
Subject: [PATCH v10 10/18] media: ti: j721e-csi2rx: add support for processing virtual channels
Date: Wed, 21 Jan 2026 19:24:16 +0530
Message-ID: <20260121135424.1185710-11-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 809cd43c-7ab5-4315-a970-08de58f4c5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?og4mQD/mQ1VF2OJmUThC8aWdEDa9eY4+9H7oRt6q7dNz/PtLG78EyTQ5DQeF?=
 =?us-ascii?Q?W9gLXaD2cgqSb7ycXFArvqnbxBQk4FWPKK/y97RdrQxU6pnEwzyVxdWMa5cU?=
 =?us-ascii?Q?dYynbvBgeJyAX7JF4VlSdHUvPleo25jRRy4iTjPobH+Crfcvhqbwiu7T3cnd?=
 =?us-ascii?Q?o5OH4pcdqGvgBfFf2ghanbt+eyL2r0OQa3bfX4KeWwBL5OYb1cHnpgdViI9r?=
 =?us-ascii?Q?khltcKQeXvmCqiCobwIbb11MB3lbX9nRel6V15U8mMT5R/VfOT190+IzmtEP?=
 =?us-ascii?Q?o5e4JG2AukLRYjQ96Sm/3BPLI7azjK9UkwZ3Wxn2ZqjoxhFnHglt/ZxXSYyd?=
 =?us-ascii?Q?x5i2uX5iIKx7fQ0AgwjBwybeSHWpcIhtKaOoCqPPBYxC2e4PWkYAbv5Cj+RR?=
 =?us-ascii?Q?weEts8Y+SByUPaq7w9SJGAYo0036vzkcx3R42PIGAtnTG6a0PpzD6gEaFloy?=
 =?us-ascii?Q?CdXjmVuMThLIMmeOXNhs34zepv59fRYULKcT0Sxm+SgomeD8f4hkuX+yIP3g?=
 =?us-ascii?Q?aN3kEQ458VGIYamftHJEi/vV8ZrVOkCAUA3VJXEoWtb2JqQURpmKFDmfCfGc?=
 =?us-ascii?Q?Vlaqf2Q4y/90cRGfcz9Z+EFH+SdjfUxd/EdngzJC0VF8SxTt3nVoLRBXf9E0?=
 =?us-ascii?Q?e6iKtLhSVdjXZzLU/ppYGnYRl+sL6Z/LzEwIe7jIWh/Jwpd47QEvmuVd+w5F?=
 =?us-ascii?Q?Af8chPUOT+ODMcSA7qese/E/HN7J2Klz7ZYNtTTz2EEzMrR2bIFOpWCYGAZF?=
 =?us-ascii?Q?4MGpGpfQB1oYYLbiL0EaZEJD10684U/DaF90ZQMEWOwRsGnzdSLc8R3qmNUk?=
 =?us-ascii?Q?ioYpgRya/dt4mifm/mkHzdqaBLV298STPD3Pjd3xAW4m+V0SgXJ+O20c2hTy?=
 =?us-ascii?Q?HKeBt3ao07aizEYMvSW7aB3QXQv9k7VM0jRjZKd5gxm+fhDgiRIIYbeB+YEN?=
 =?us-ascii?Q?qph5LPmDq5a2rdP+XQ6rygT2rYW9jKXwRmZDgsf36q6ZPvCzGWtK14EC9NL5?=
 =?us-ascii?Q?6+QVFc1BdId6hv/D9likWMno4cqgD691jqsDanfEomHA0sOoIaIku1kyn8GL?=
 =?us-ascii?Q?E3W4c1+mWSsB44ZTCa5AyDtb/GLJNusnMetvNUHEWTKk/fjSblgzEGF9/IYI?=
 =?us-ascii?Q?/HSds6L+i9P5nXHf0ilBEU6mPUxFxM90t/WKU87b8rlmDkrBjVWme01+TX2z?=
 =?us-ascii?Q?dX/SRn0/5ZXcFn4snkexeJIaTwPPQPLqbPtdCiyh22I15qrA1+1zB5cHJjBT?=
 =?us-ascii?Q?QBUTZ+Go8QlMK51OjNZENQvK3k0AbiIr4JhdmLubxbOFR1+Tac0lgbSBPPZu?=
 =?us-ascii?Q?yD3zmTnWVKIOq8D5jcow3EFY05BbGEcakCzGblAXe1PvmUMmvX33prDTw5z3?=
 =?us-ascii?Q?SNYujaudiZy0fdAixtX0x69HQY5XUeWb3O/js/s81E4GiAKGqaHAx0jDZLox?=
 =?us-ascii?Q?fXLHTEkDOegQdSmmyEexRcAxHfpsj2+zi94wJGgTWuD+1d81YpLxlV6j0LDL?=
 =?us-ascii?Q?a8Q8oWWnipnpy1ljPHZk7pYHMmI3OZYFXd8B4clQOa0umNvG9vl+qoehzTk5?=
 =?us-ascii?Q?NcQwz52AjdKJ8XAX1yJeAW8wE1LaUO4juUcQq+rcEOYsuvyAysPOf3bIspOr?=
 =?us-ascii?Q?sqZtrRTtx0Fsx8e+2T0pgMsdXNondHlS1u4Vcnk90n99LVV4avvwkLorfa/W?=
 =?us-ascii?Q?5RuUig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:44.7534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 809cd43c-7ab5-4315-a970-08de58f4c5e8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
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
	TAGGED_FROM(0.00)[bounces-51258-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:dkim,ti.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 41BFE58432
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel instead of VC 0.

As we don't support multiple streams yet, we will just always use
stream 0. If the source doesn't support get_frame_desc(), fall back
to the previous method of always capturing virtual channel 0.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index aa038d1badc07..81c86e2cc4a50 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -32,6 +32,7 @@
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
+#define SHIM_DMACNTX_VC			GENMASK(9, 6)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
 #define SHIM_DMACNTX_SIZE_8		0
@@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
 	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
+	u32				vc;
+	u32				dt;
+	u32				stream;
 };
 
 struct ti_csi2rx_dev {
@@ -569,7 +573,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
-	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
+	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
 
 	/*
 	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
@@ -609,6 +613,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	}
 
 	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
 
 	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
@@ -883,12 +888,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct v4l2_mbus_frame_desc fd;
+	struct media_pad *pad;
+	int ret, i;
+
+	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (ctx->stream == fd.entry[i].stream) {
+			ctx->vc = fd.entry[i].bus.csi2.vc;
+			ctx->dt = fd.entry[i].bus.csi2.dt;
+			break;
+		}
+
+		/* Return error if no matching stream found */
+		if (i == fd.num_entries)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf;
+	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -903,6 +942,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	ret = ti_csi2rx_get_vc_and_dt(ctx);
+	if (ret == -ENOIOCTLCMD) {
+		ctx->vc = 0;
+		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+		ctx->dt = fmt->csi_dt;
+	} else if (ret < 0) {
+		goto err;
+	}
+
 	ti_csi2rx_setup_shim(ctx);
 
 	ctx->sequence = 0;
-- 
2.34.1


