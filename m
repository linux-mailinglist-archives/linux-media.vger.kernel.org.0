Return-Path: <linux-media+bounces-55617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDyyKmPVs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:14:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A22804C1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C24D73120C41
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E414138A286;
	Fri, 13 Mar 2026 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RCS3k2/c"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544E383C84;
	Fri, 13 Mar 2026 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392909; cv=fail; b=oVr5cvTbn8mVtwUNM8GS4h87AsO9QUFI3cGQD4W5ymBm2h+H5jY58zn8vK1yfqnTkY1FpuHeP6HMfrmUjj0z1p8MA2FcHpKN0Dhtg+wlRpJ9baEJghHeb8UmUzW6B3syOEIfGqID9YJHDbF/KtjIi/BaR1RHLd/7BuAN8F3uGHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392909; c=relaxed/simple;
	bh=2YjwLJpEzrwqrv8YpRyKZlJ4NO8gSy582132YoHofTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mv4VnomUXyOl6Xgx9vJfp6zTI3OZYiM75ATqP2fet5AinI9k4ID+qJaEOX/SQ8drxsQzyQ7LAgXQ/s6PQad1c0edZlHmIEKIUTbmhXUuIZ3WdT2j/XRGYMaQ4JrbHzEc+datwHU6eLD2hlUD2SUzl58A0j9dK2/jNl5+ddUm3R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RCS3k2/c; arc=fail smtp.client-ip=52.101.56.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdaqrdjcvPIDjHntuhmd/wSrhbZJwNC68f/b4nTT2SXwhOWIN3GPvf9jAtZ1sfau0xsmmF9vsjXwslICuKt3WrRU4FxwLJFhtd77dSp3sE7dCqNC2gZy7oVmkkk5uH6/G3Mh8mOVypsNG/vd0ge1RWtjdrwHXtwZcMnjD83O67pLvh1vjhe2VcvYVdfcEsKAHGfVLDOvu5tgodLE/MR/3r0G1m/3cAJVa5AZboOY4VGalCiwQWJno1srZaSNXnpz03BLRmqFlEnNFC989e92vTlZau2Va8uJ9UfC6cG5gSfxv0SGFpQZLGQm8ikX56VHNuKyx/V1t8LDyIl3yAVdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckHbVOhu//h/i8M6mtO9fhPp8bYcDlyd88/gqxdkXCo=;
 b=QIn8rUtVbsWOoh15BWaHkfY1+3/X9Eh89gLvbLXm7gSC7OBZbsDfIGilKCd42yk7Mzz2MvBv2GXeI/uXKqLJgT4bqrphGXNV6UCOwi1jfDtZZTA7kcBDqTMhCkJ7KE3OVqx4qZXkrP+EFpknX/ihnkkL+ngJIDOl7HdoXBE+jpZL74DFv4/mFHtPBDktvmg6P2B0IughMWQiZI5HcJM1aXraMT2iVcH61pevp4sXxuUHvHdPvo5tvbhO81BYwxS9S7dbkEuMvaVMM76YJHcDcdKpC/BjYop9KwWbOnL+JwdQMGwiF/Ue9dmmn9ImQbh9hdvvnCoDJOThVQBMlixlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckHbVOhu//h/i8M6mtO9fhPp8bYcDlyd88/gqxdkXCo=;
 b=RCS3k2/cKRqk8Bd4tuevaTmovo13F1hjiSOiDqMMSt81DF0TGdqaxnk1OEi/iRdxxcznB/jM2f1QSX2QBqUTAcIUTYia+3qeIxEj0ViZdASJxCQANhhk4mQV3ktPuKJb2F64IchV1ywoQokglifhA9UOBIwjqQ7RQQwj4Ntoj6g=
Received: from CH5P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::6)
 by BLAPR10MB5057.namprd10.prod.outlook.com (2603:10b6:208:30e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 09:08:25 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::fc) by CH5P221CA0001.outlook.office365.com
 (2603:10b6:610:1f2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 09:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:08:23 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:02 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:01 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bc274611;
	Fri, 13 Mar 2026 04:07:55 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v12 08/17] media: ti: j721e-csi2rx: get number of contexts from device tree
Date: Fri, 13 Mar 2026 14:36:52 +0530
Message-ID: <20260313090701.646534-9-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313090701.646534-1-r-donadkar@ti.com>
References: <20260313090701.646534-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|BLAPR10MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: e3103a5d-98c8-41dd-c212-08de80e01487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HCDvjOg/cT9g1YqRRs0WfXo8gd26vfZ5sQQskht13Ezu3ggQ5TvpifFqsIRDgziuWFq746EkUM8s6j+kOzA5OLccwRoKGLEXi+pZdosvM0KHDuBAL5EHnlJVORizYbgpjtLTZ2/xk8OTbKXso3xcfkv5lc7gZXs9+jRhO3MuA+Gsgm9/VcglrETusIEfaSu+5ELBEr+bCftKi7mdqFmSmdK/wCR+qC3ZMDUoy8umScAeaHtIa80ZMIawl5NDSwZU8AROAnrI/MLR2BC8gbqyHsyC3qgPK48TGvDYPBXQnImpJv6JDyBNsJG0GOd+4QZXtKpSeTdSt7OQ6x2NBjsOnVemAzEH4GgjA6rq4ZOBYssN9CmTLOVfXKyzEeH2x2/Bzgeb5s1/0mPfVz/EcTxmqslsB6GokFfWk7zMUpz+/kfDzCZFiOLx2Q1HXVX+gReXU0vj8tuvbXCyrqo6U6wg7fkzl1qa+X4k3vEhs7QTmZwQAHrNGlYY6gnREXZc67fDaLOtzsqITXdypv6OkzPmAYFoJDli7FEa5PFVoCvmLk/J04eXeqNoOj6/nNdykETubYWJVsMOJzEPydVgJbwIo3huzAeLqytcwRRllJQVCTNUVLXViagI85FdZNDyOLCqgkJk1aWedqDFeWCrg5WRnT31FzgE2awrXL5kOLon4pzrmjVCMzXfzbO+Rq0nG3A3L0Qaz9EflhfmoPZvMGVggjmcCRWiTK78hXwYZSta4TM1iP2sy/08ng2kM7svPnEI9cVMZyf2QQRr5QwV5mYkeQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jkl4HoQejiY23W8wibKNBeJeYGJPwArsQ/o/7gcVTuhVMSqMr6xymJvp83i0zIM3ccgU1OuFbQ6oQxT/zTC2iB3buIYmuETqqj9ezeAfN3CHsSIY0Ck/9D8TLSQrCfl6l7qVMMYEDlbVgeROEky0K5MBdGNMYZYNvyKqa1y9e76sRDPUide8p5JVOBaFYtDkSqZXQqt11HA392nCqfKcjH6nN3CJNcSnAyi3uZD0KG0Ju9w3w/sqrH51MhMQuHw+vUHOTYCP61pAeLPOkrq2fJyWL34JwuZzOUINUzNFxrGqUGYG6+fE7qY0Lqc5gGn4sJIMl/vysthw+v2ugyEayxb4Hie3iEM1G5TvzDYLUDKQ9Qli8PQfyXOFtBgssdVsyfYMzRLvXNgXWVLPteFaYzXxhRjs0/BZIyoJs95UWkxwpU4Tu9SPZEgh8BD8I943
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:23.7776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3103a5d-98c8-41dd-c212-08de80e01487
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5057
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55617-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid,ideasonboard.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 257A22804C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

Different platforms that use this driver might have different number of
DMA channels allocated for CSI. So only as many DMA contexts can be used
as the number of DMA channels available. Get the number of channels
provided via device tree and only configure that many contexts, and
hence only that many pads.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index e01d95eab19c3..26a8eaa98b3da 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -43,7 +43,7 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
-#define TI_CSI2RX_NUM_CTX		1
+#define TI_CSI2RX_MAX_CTX		32
 
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -56,8 +56,8 @@
 
 #define TI_CSI2RX_PAD_SINK		0
 #define TI_CSI2RX_PAD_FIRST_SOURCE	1
-#define TI_CSI2RX_NUM_SOURCE_PADS	1
-#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
+#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
@@ -116,14 +116,15 @@ struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
 	unsigned int			enable_count;
+	unsigned int			num_ctx;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
+	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
-	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
+	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -458,7 +459,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 
 	/* Create and link video nodes for all DMA contexts */
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
 
@@ -1251,10 +1252,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 
 	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
-	     i < TI_CSI2RX_NUM_PADS; i++)
+	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
 		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+	ret = media_entity_pads_init(&sd->entity,
+				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
 				     csi->pads);
 	if (ret)
 		goto unregister_media;
@@ -1345,8 +1347,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct ti_csi2rx_dev *csi;
-	int ret, i;
+	int ret = 0, i, count;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1368,11 +1371,28 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	/* Only use as many contexts as the number of DMA channels allocated. */
+	count = of_property_count_strings(np, "dma-names");
+	if (count < 0) {
+		dev_err(csi->dev, "Failed to get DMA channel count: %d\n", count);
+		ret = count;
+		goto err_dma_chan;
+	}
+
+	csi->num_ctx = count;
+	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
+		dev_err(csi->dev,
+			"%u DMA channels passed. Maximum is %u.\n",
+			csi->num_ctx, TI_CSI2RX_MAX_CTX);
+		ret = -EINVAL;
+		goto err_dma_chan;
+	}
+
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
-		goto err_v4l2;
+		goto err_dma_chan;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		csi->ctx[i].idx = i;
 		csi->ctx[i].csi = csi;
 		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
@@ -1399,7 +1419,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	for (; i >= 0; i--)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
-err_v4l2:
+err_dma_chan:
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1410,7 +1430,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
-- 
2.34.1


