Return-Path: <linux-media+bounces-62261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBKACFClDWrp0wUAu9opvQ
	(envelope-from <linux-media+bounces-62261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:13:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5858D675
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15B943116ED1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416363DD857;
	Wed, 20 May 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UTHl4EOV"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C513DB961;
	Wed, 20 May 2026 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278517; cv=fail; b=KY6C9fMtVVbe9ZKIYU0AyDyS0Vdh1oPxzXHZScvHrHC7kW1/FCDkKe7XQ9Qe1k9Fq6w1yR0y6Qm+HZTBn8GPTzWIQTSItUMzXftH/hcwCpD6mGwBtpDiiuoDOCBBg1KQp6r0JwdOrwgH6+eXmrafzsHqXxSLak1UpCoDQ3OHQDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278517; c=relaxed/simple;
	bh=NxIFYi84SGs0XRNlESfaX4rvi9+nt/aS9uFSktFFp0Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7beCxCOfnIKJbrA5dGW+rqcuHfcxyxyOlp95ewo6iu/nPDWHkUcVCUn8xEXSEEee0L+lmggUxD4QlPPrxAd9RZXUXkBsHTYw6oV5Ez4uJXLXvUw8X6Ujwl0f9mR3QkH8PF3pcSteqTvpUFh5vDsE1+AckLOCrHCSwcV6QhK8QI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UTHl4EOV; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLc+HETuJVvjWWoJIfkykR21xcsbAlyViz5V0ZtqHNpYaDdPkKtxfV3xsuWB5vQpMrYTJ/yGd4Wu05gLutRwiwbplnlDpfJmmIhWsuJiRCV9WKXsir24BPchv1aKl0wsS/N1P2zj5h8jQgaX4Yfn+D3HHkLAin58H5S11c/SiU+w/EKb73Uw45H5yBA0vLLIWKTOJigmgTmMDivuqJt6ihmT6h4zd99fAfa+UXB8qTsijgfWRAgvwuBSvJNArNKvQm3PNPhrWPjorv8ugfM2FyC7jpmASvPVPyButq8eoiw59tw6AnqCtM9g/FJj52cgIvoaEUghRZCw1TDGzZ7fVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGidkcTltGJOLjBqrAA2OJ7zAioaWZXoj2ZKsp/tJVA=;
 b=Hb1eqDqmxN0/9CUeKWtyWz9Ty9dReF4vt82e1BUXKHp7TLYV9J88CjmMzRQTduNbRGKRwcpncZj8q9sDg4Rub2Uqd+7tb5Fs08Zdfi8906S9fQFIu2O1aOS7Mcd1hNvn7Tv6hae6hXnwYVZlgtzW9ZeR/m0W2Gt3OkENHWcRySkoqf2hADlxmcOilw9sK5KpUtXpXTcvFqjPvBUzRMnKWhOLSIbCf/0xf+qtto9aRVv8Tl2s4tv+vvBFHN8pwDJwswZM+LF0FKFsZnlSJSOVJ+VQkJs7JqDb/EON0ncTt37U2v+JKmnXeTL29gdQDUFOM+RCCLy4xymEvPVfLV8s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGidkcTltGJOLjBqrAA2OJ7zAioaWZXoj2ZKsp/tJVA=;
 b=UTHl4EOVQisogoIO+JZ5AYKkMvXXdtjYEfn7d8/TJxAjzB8AO2eeqmxXAKxVU/VCQ/Zo7XA2s5aK+SEIrSX4+EVA6NPiCOyO7n+GcAKP0pNbsIWlg6Q4Z68wYPISwL8uYnvuKjBVln7gXWLfKtK3uQ+P+g/oP7lSZ/LTSQk5Mo8=
Received: from DS1PR05CA0001.namprd05.prod.outlook.com (2603:10b6:8:457::18)
 by CY8PR10MB7146.namprd10.prod.outlook.com (2603:10b6:930:74::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 12:01:54 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:8:457:cafe::7d) by DS1PR05CA0001.outlook.office365.com
 (2603:10b6:8:457::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 20 May 2026 12:01:52 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:34 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:01:34 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3Y1914726;
	Wed, 20 May 2026 07:01:27 -0500
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
Subject: [PATCH v13 09/17] media: cadence: csi2rx: Add .get_frame_desc op
Date: Wed, 20 May 2026 17:30:14 +0530
Message-ID: <20260520120022.539913-10-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520120022.539913-1-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|CY8PR10MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: e2425b1e-292b-4332-11c9-08deb6679498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|5023799004|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZEv+dJ113cIGazqBZbiCeeSND0azwXDgQa56m+P4+g9nvKRBtupT86zW99c5ybRu18/JAeDA1dRlrhw2inPe9bvz5qKBAx6z7NZFlK4GljtGzsEufHNX3bbtGL6tpOZI1Adp2nisV4aNNQlHq6c+2I3XiI+I9m2oD289Z1m1ZoIb4YjcHCDIEkc5aTAPZDgPzmrAWrecECBJdpSpH38zYy1ZW1u/1Sivjx70XV/14MCkH/kP6dJfGP+R2uluFeqygS3ZKIW3YJJ8NDgRN//6GN71AGgwAMDZ3fsASE15BLv1iZ+mqq7hPYYCdHD02+FmwtNEf2nN1TK+5IFdO7Hk6GZUp0SOVx/8AI+hUwkUs49+xFl/t4R3+dk2gPhH7V0YFXgRgNneAwBOYTw8LQLnnl2462qxZfwDmOkPiuU3pdakLUBTA8dGPbl2CJwld8gvVBnWkI0bHHTYyypwKZet3e+hjW5ufnmYhn6dqodjE2LS2LVKK7lKTzsoGveLTmLio7d2KQ6qKWA24w/dRXwjsMlzQIjcInP1InnVg1HO5l+FODbc4KWQ0sdk6LuzBO+SN7ID1ad+yINJsx9mOs4FgHXHV26u0hTKtkXqx4SN8lFQ3bwUCn992g1mIskX9Qn3GMjEFI+A9MLlmuo+0hPXZhYQCC/GbBzXMtYqrBfSqMoPGop1lUK95PjcKVKa4OnnXazsvOus2AsxTNLDyUBqu9bRwmvveeI4t4Cy4Nu2bnY=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(5023799004)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sz9W31bkV/y7ZvGmSoWbjPBX8H67969UVrfAn+KVu5J1oy8Wo5EEy1mDzVAH226swHVe9FCabdLABKqzKLpDbaXaOAUmDxl/wrvG+DmJ62tPO8N/U2JLNWSYmo4zmG9Pz47GS1CquDE84I45htwrCLyWwiexiBHNin8vxs3xb/hWtSYmNLlzkv33Vu6rMI4ibR8TpIvCy62hXU53hm9Yg1rpwaFrxd9yfP9DSKWgrMzrB3l9dkfTS1M75tU9AdqoKHO150Fs8PMc0HTqGlZ4gQlyE2dl2uJk4lzrlyORv4EMZfvvcONQNcZdiM2c0f4Y3KL8S67GUsruTl2cg41cP4EoYlWanvVRd+2Qgwk5rfM+BCjg7CgBHu5UegA0zX2utsvxPg7fv4IMwKOPrJEcPCwgfw+6IW14Gd7FzwLYGVLHL5xZaHm4TbvEEjjq29u4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:01:52.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2425b1e-292b-4332-11c9-08deb6679498
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7146
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
	TAGGED_FROM(0.00)[bounces-62261-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BFA5858D675
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The cdns-csi2rx subdev passes streams through without any
modification

Use v4l2_subdev_get_frame_desc_passthrough() helper and add the
.get_frame_desc op

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 2b25314ba6ab..bba0e4c0a34d 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -617,6 +617,7 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.set_fmt	= csi2rx_set_fmt,
 	.enable_streams         = csi2rx_enable_streams,
 	.disable_streams        = csi2rx_disable_streams,
+	.get_frame_desc	= v4l2_subdev_get_frame_desc_passthrough,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
-- 
2.34.1


