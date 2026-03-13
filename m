Return-Path: <linux-media+bounces-55615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Fd1JFTVs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 198622804AA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1553221076
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB30B1514F8;
	Fri, 13 Mar 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S+VUvvm/"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E82329E4B;
	Fri, 13 Mar 2026 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392894; cv=fail; b=EobCrPblqDjhxU877IQqW3WXmwjwqNdnwoz9n0m6tBmAILCLBm7GfeLiC/CTc63lFTnVXQkhjr8ZlaHBqSRN/fv9ub/D0ItycQPw3zKmxK+252+wFXy9SDwk6pdjXjKTVvcdeoi59UYSQnb5zEVKpHOvDXtg+z1H32TQrSdiHec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392894; c=relaxed/simple;
	bh=7z75VEyn6FiUydcFYggJChoOw68bkYpdeTZGd/Vv4q0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=drvHNadjdzFz6jZj4exCuXOJ1kaWBAdwtgSBWfc6papuAFKZELHoSoZCjjtNQB3cqd57UW/SmjIIVkZL0gkBiN/ipYCDkue/96N6tJwKJnzoK5R41ZDbzv1XkQPbr3p6yLheBlJ4rFJSFYMMMDOP+WkblAcwnLjJXHm+LQcKVR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S+VUvvm/; arc=fail smtp.client-ip=52.101.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCIPpMiYfRoZJGtfZb9z+x/bhlQ9iBjh/6Z2oCDCRC661m4czkGRPGOzJGlmRBjEWVfBnFNOn3Lt18gJ+Pv3ZHlKKOQye5AZhbML/rlnLKKRe//CP1caRkfdJG26fal91SdSkfDlxoGcMDmEWERz2Fe9TN7606vGtKCBzPxqfTJSj7CI/8Gh6/b9uxvPdfhYaBB0iIZBnAGzJgePZd0H9tGVy4JNMFjvvkLirQHsAIclwHBDUd0SDkh58Vh8+/4hVS0P+O0gTpJmmQCX3yt5+snDX01Y70qU6EnTcLQm9xDvh2vLHtwhcbYWcAoxi2bOb51DbBQNUx3prebL2+HOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7f/Ke718O8AYWKo4HO9AKtgf9VQzCpEPB3m2qPS9OA=;
 b=R/iA8qtV3dQ2CsYw2l5t+2TIRs4/+srZJ0BTfzRlkIx8c7HoUAjmemqNiwkX4ckKTVo3lxKoMruvDYZVYBrXDa0foELwBWMyf+SWwagXplT6p7IHt5IqU4gDN9fkyKtEalVqfjZKrVYD2CrWTkbpFFGpBl0EF7G4EoXQAArasq2znQhu8CIxeyp0/PBdRVr1tFU30WCT5plzzQ3vEJD1imGUTSX3+D/Ao6v/sPwSHuJWp6cyvfZARDvL4lY31Uh7gUONxjKxC15nIcce8AVULhA3vbEI4UbFwS8yFHk2lXGN4hz3QbAsg9Dtp0656Y58JQNnLS9D49jAdvnP6ambeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7f/Ke718O8AYWKo4HO9AKtgf9VQzCpEPB3m2qPS9OA=;
 b=S+VUvvm/j0/Mut90stbro3Uvog1G9KooD24VwVDD/G4wejI2v13vDIJWhVLrYfYJP6SLJL/03uvafsyZhVa2XaI/rSLMOS8dokLwi5YRKw+Vg+IXMaC9R6SZdF0WFdcixFe+e7VBujSTzkgxH5AHz4IE2b5t8H4b1M0BQ41hIFA=
Received: from SJ0PR05CA0112.namprd05.prod.outlook.com (2603:10b6:a03:334::27)
 by SA2PR10MB4443.namprd10.prod.outlook.com (2603:10b6:806:11b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 09:08:09 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::c2) by SJ0PR05CA0112.outlook.office365.com
 (2603:10b6:a03:334::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Fri,
 13 Mar 2026 09:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 09:08:09 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:08 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:08 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bd274611;
	Fri, 13 Mar 2026 04:08:02 -0500
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
Subject: [PATCH v12 09/17] media: cadence: csi2rx: add get_frame_desc wrapper
Date: Fri, 13 Mar 2026 14:36:53 +0530
Message-ID: <20260313090701.646534-10-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SA2PR10MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d4e185-5eef-4499-fdc2-08de80e00bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OGGLJWoYCaDVxUjTBiVOyKr3/dP6n0DoMd42XK/AyCHpDLUZv8cX3cD0lDDyfFuokyokCW1lGiHbqsg56e1TK0/ZHbPQqKVyUWccxMuMIqlItYIFbCY442uxsh7K4rGWj3NG5rV8+ev7pPPooNLyD/xLfTDct/ezhrK6BceTJuInCST2jF2T4dlFUnUBa5Y+4eLlsDOLUwFZ67LhZCkgqzs7+HgXDjcMrV6B40zkc/lcdux3/cR0XOMD4m9HHiA5qGaPAYl4zBFVAvjVxIojq0TawCoaOi2GIA3OR8A/RKwufKStpqcX/7WsJaUPz+eh77LPyw8ty4MAFcegZuFaqn+AhM6TsLTBYTC+h3mduiLsfcfj/Ze3DzbZbUEdtIUJ03gdtlHx3ReSGDBq07nuJiy8Z0biv4danGZNQ7hDEt59dGEjql7ke5o0qtXIixw6z075ytmV33RES0rQjDI6+6nSfIDVtjiK4e/2mrYp/fgIDhUGh+qPds/WOHjrj+NUEijA7Df6ATj2sP/wOQqDkdHZf8DfnJZsHAWiE2EIWXv89EO8IIc80paRELY8NTjJ6UlBD42msrBD3r7gV3HtQ0xtMUhUdqo1eiKB47+TD6Ou0wngDzS6Rt2DJOngbtFa9+I1fjcqAOmTyBLdC6y7qC9prJ+xCbBw0cHZ4CLFJCxQOFYl3cbQpA9cMNY2DXRkXnZdoEYUhAHs55vL/HreSurrxngBjoYHG50XkMTqmJAbut/aMTcQkz4THtIlfEwNIOI4DGVSCz6kvs/Ogi/wYQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AfGQFwPZj/hiPct7i5bNu4Szjcq5ujE41wAk3KNUG90p8Hsy8SGc8GyQWsR8Hi796Vd7uM61SWsnJN9ssJ/qXg117cqyege+2oSXcySd5TBMtEYrJgJQMoDpHHhgJvRJpvqZYQtwtQeRMu5pufscZQoaihCaky7DLdgZAlt9m5gx23vy+arlaO836tompWPOPXotnUtGwYeR2VCkzLYMI3X/Xd3bhFnKmj9vBqz23elF3Qqg2nuPCgzqqgI6qVvftnteCLutufNWkx89UckenU24jUw4axMkRaj4gHhK2RxkMAqs/aSiVWzrR5QKQL5bHaZoCXzGYMD9jETjoi0cNHXBuOxdRWzw806OpIiLRMl1MbgIGuT4hfuSau09qatJ+hXdWv2k85bbboHTedb+aY28n3WYTYYc/wgWURJoyj8yfpW38my9zfZIqRhAZX8x
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:09.0603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d4e185-5eef-4499-fdc2-08de80e00bc8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4443
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
	TAGGED_FROM(0.00)[bounces-55615-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid,ideasonboard.com:email,starfivetech.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 198622804AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

J721E wrapper CSI2RX driver needs to get the frame descriptor from the
source to find out info about virtual channel. This driver itself does
not touch the routing or virtual channels in any way. So simply pass the
descriptor through from the source.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 2b25314ba6ab0..52ca940acd7d0 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
+static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
+					     struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev, "No remote pad found for sink\n");
+		return -ENODEV;
+	}
+
+	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
+static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+}
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
 	.enable_streams         = csi2rx_enable_streams,
 	.disable_streams        = csi2rx_disable_streams,
+	.get_frame_desc	= csi2rx_get_frame_desc,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
-- 
2.34.1


