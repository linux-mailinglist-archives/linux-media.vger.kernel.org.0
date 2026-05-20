Return-Path: <linux-media+bounces-62263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LgoJmSlDWrp0wUAu9opvQ
	(envelope-from <linux-media+bounces-62263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:13:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F83358D68D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7017D31C3FAE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C593E0745;
	Wed, 20 May 2026 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eHdkjxHH"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8523DCD96;
	Wed, 20 May 2026 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278521; cv=fail; b=MvPbpQKfPm3aqBIL+h/MOTmDOfGfuOn2sFeoSbpVSOEYOGTcR3obqUm0qEI7ludYxogIcJlSLnLK3yTTTMplUAyJLMgzA1LeWhj2OXlP1OqLM9122jPaTeELMIdMFqyo5/UAT9VUDCr/sVv2Qsj7zFfsxzgmojAQ7+kvtkriMr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278521; c=relaxed/simple;
	bh=DLZgBMAaUfYvrcseo4bioESIEOSEojKWzsAXopu5g8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0GKrYs3PYeJKqImZ5bt0K86fT8M+L7lIJLdMBqga/gpVFffCSiz+xCCuTHCxqtUmrgqgz1ztrcbcOOOl47LmivuXFYOLrWUrrWXU61HYKT5oh3B0BPwdYyu4t4Wv0+Pm1B4HuZdvuPGozZYHLYUQoZViDXc0PmQUjX0B/A2Pjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eHdkjxHH; arc=fail smtp.client-ip=40.107.209.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wunX5OyARN+hi97RzGez+YJNPZIts62GD9FG6MQYbQVex080SKHm3Bo5ync4da3vFY3R+iX/GyfOghsohteOh6kzVtjtNhB6KbOuYnJ1fL9crg93KzumAS/KTB4tSiyYQWyVYrMM0pBDpF8HWWCqNctuw6YlUclyLxb+U8ZcZjI0UDhckxVg6IdfigSkUY+EOx5STuQMZ4Nd7SmFTVP5zfPXx9ds54MlSxNo/AC5cXeYLCZZyoCcemLKIRR2jZWXb5jq2x00Hww5caqvPav92Bp6keWdHgxwPAB0RnLnt9JLEB7WVrpvgey9Up5s5udRrahWugOEEvHj4pob1fhZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2ag0VuZMw5/ia0HF47n/0NUmX08UakUhVcr61U6dL8=;
 b=UFYVc/8YfoIJqyeGyox1l+740/6R5JGC4xrKmzwKy8+wc4haMsuPdRESTsHojQ56rx/hSVUxFXOJ2Sq8atczss/ZmDVSRtURDmq0Ar930HFcORYqVB0Vo6K3pPg2kwO0ePotsYZNrUoLV75a3Dlf4pBKM0TX5+Ur4hQ5jf4rtv0G7fl4HNn//o0xyXiPyiIZGZm9SEplN7A0/49B2FicP/7lZxEQziASWhPhUkeuLiF+YQ1HZBIaQ++wYXxtz+eIMAWIMuxW2TkRfPI45lb1gXNcORdqxnNdX9UIeFRjob77c/VpXGO84KQJAQNJqXaCoE0TptLkaSwJZl5IyEYTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2ag0VuZMw5/ia0HF47n/0NUmX08UakUhVcr61U6dL8=;
 b=eHdkjxHHXOH8EKEOtAqlPgLIBVeFBe6Y/IOg9EXX6AESg2XfO8mdIBUjvzPV+7szXYfyxwHc0pqJPa0+IhR7pDYkZj7X10k48NayyJ4rPte+AUEAWCS44mNxLC9nSoErp9ykoDJuTJdHt5RPIZJlbqmlTbACWJ0O5vD9cjM7j2s=
Received: from MN2PR20CA0038.namprd20.prod.outlook.com (2603:10b6:208:235::7)
 by IA3PR10MB8490.namprd10.prod.outlook.com (2603:10b6:208:572::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 12:01:56 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::c3) by MN2PR20CA0038.outlook.office365.com
 (2603:10b6:208:235::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:01:56 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:49 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:01:48 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3a1914726;
	Wed, 20 May 2026 07:01:42 -0500
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
Subject: [PATCH v13 11/17] media: cadence: csi2rx: add multistream support
Date: Wed, 20 May 2026 17:30:16 +0530
Message-ID: <20260520120022.539913-12-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|IA3PR10MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bd18fb-daf0-4635-9c88-08deb667973d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|18002099003|56012099003|5023799004|22082099003;
X-Microsoft-Antispam-Message-Info:
	G4iB21RjOP3ok38ZikX38SLjAotp/+2/smVzux2wu9aje4fmabMdnCxe3Xn00A4nNCnCdRL2t/0/HuwjVahOFIrgcrdoEJtKLAVbAznIryh/GMnHS0gzXIkyJ8clOLlDHInZkVmcmbHx3X4qDX/+Mqk5OFPw1UoX9pRnLeIkPlxjgNlZ1bVatJEgSP2bdZ9t+K+z4VXJu8z6ejUTgY91wvJj2jh9eylaarKrdnNvRoRB5pPoBA0J7HeBd74rjED1kFjeWPzB2/IU5TsdRHFTIyR/4D4Jk4YfQxwfSxt5XE2Av1a9HD/OHO6XUPPoKZfmgHAQBp6cC3pN4DmPMed8DL7an/b1FKbEFLbATujjPMO6OMbYj853hb0LYATgb8MWrsLXrrReZ0PPqWn1fsDQOkmLsMJ5M2Wk9u/tDP/VwsKFNxipbuSXj1SLwjMKEKG+yTezcPwEBzR33UwFMmY+ON9Maz/MPTzg8dJD1issW1KDuIH9mdw7y0YtbqjU/8gN1MaVl22iajWrlfWWY2PfKyA5vqZPleEmMbRiZN/CJ7fqJ77TQpRhaJnvkMcYK7Zcsi+6VWeXG8TpTbeJZ85VKeRY841Zr1UwvcTvIJmX5NWEuW8mrkvGz8ZcnEXC91Po+4hASDThf6v34oO+78WytkwkIfaFYW653E7+8pmFc6LAq8+Qm3bL/thnj1QGncU3iBxrxLKc5xzJg/mi5+4BM1U4Yn+Iy+G9cpRlws7YkOA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(18002099003)(56012099003)(5023799004)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pCsCySrcVA++wbgoMSCPBiQ/4+yetrJ2StPq7veMSDXOE2WOfNawu2U9lMncImgsMinDgPyBU4JUEUStMCQb1tS9Qfezbc5djuB1jBjq8Fpc7+JIuQO/kyY8q7FUAF3sLng/A9MuNZXXrCTMEMwSQf4aiaA1oZdbnp9G+PU20Gisy4vQkiJwDC0GfifPIzdC0DUVH615/aicNk4XGNYnwCqYcQNdDWy4sZPtpdoUfF8X7ijKa6Qa7d1lQRC9zR+G4Lr9bwYEdAi3CJmtWxa1WYP2lQ9HdLXd9hFf6T+qYkEBALCAONMnJMBStf1GlcVpokT5gZoIM6frm2XCt4Z8DYAvydcxOwsL7CmZ/97W51eyZMszisOjoVFpbqdoC+bl7t3PgVnjFXJxFI27QSnbx0Qcrd+QbSdmybiMmWiMZJof9VRi9pSbBWk4LSkzJYvs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:01:56.7263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bd18fb-daf0-4635-9c88-08deb667973d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8490
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62263-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,starfivetech.com:email,ti.com:email,ti.com:mid,ti.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2F83358D68D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
of data over the same physical interface using MIPI Virtual Channels.

While the hardware IP supports usecases where streams coming in the sink
pad can be broadcasted to multiple source pads, the driver will need
significant re-architecture to make that possible. The two users of this
IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
have only integrated the first source pad i.e stream0 of this IP. So for
now keep it simple and only allow 1-to-1 mapping of streams from sink to
source, without any broadcasting.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 241 +++++++++++++++----
 1 file changed, 190 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index bba0e4c0a34d..8931e824c597 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -135,6 +135,7 @@ struct csi2rx_priv {
 	struct phy			*dphy;
 
 	u8				num_pixels[CSI2RX_STREAMS_MAX];
+	u32				vc_select[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -229,6 +230,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
+static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
+					     struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2rx->dev, "No remote pad found for sink\n");
+		return PTR_ERR(remote_pad);
+	}
+
+	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -258,30 +274,46 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 
 static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 {
-	struct media_pad *src_pad =
-		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_subdev_state *state;
 	const struct csi2rx_fmt *fmt;
+	struct v4l2_subdev_route *route;
+	int source_pad = csi2rx->source_pad;
+	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
 	s64 link_freq;
 	int ret;
+	u32 bpp;
 
 	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
 
-	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
-	if (!framefmt) {
-		dev_err(csi2rx->dev, "Did not find active sink format\n");
-		return -EINVAL;
-	}
+	/*
+	 * For multi-stream transmitters there is no single pixel rate.
+	 *
+	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
+	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
+	 */
+	if (state->routing.num_routes > 1) {
+		bpp = 0;
+	} else {
+		route = &state->routing.routes[0];
+		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
+							route->sink_stream);
+		if (!framefmt) {
+			dev_err(csi2rx->dev, "Did not find active sink format\n");
+			return -EINVAL;
+		}
 
-	fmt = csi2rx_get_fmt_by_code(framefmt->code);
+		fmt = csi2rx_get_fmt_by_code(framefmt->code);
+		bpp = fmt->bpp;
+	}
 
-	link_freq = v4l2_get_link_freq(src_pad,
-				       fmt->bpp, 2 * csi2rx->num_lanes);
-	if (link_freq < 0)
+	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
+	if (link_freq < 0) {
+		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
 		return link_freq;
+	}
 
 	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
 							 csi2rx->num_lanes, cfg);
@@ -379,11 +411,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 					  csi2rx->num_pixels[i]),
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
 
-		/*
-		 * Enable one virtual channel. When multiple virtual channels
-		 * are supported this will have to be changed.
-		 */
-		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
+		writel(csi2rx->vc_select[i],
 		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
 
 		writel(CSI2RX_STREAM_CTRL_START,
@@ -471,18 +499,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
+static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
+				    struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_frame_desc fd = {0};
+	struct v4l2_subdev_route *route;
+	unsigned int i;
+	int ret;
+
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
+	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_dbg(csi2rx->dev,
+			"Failed to get source frame desc, allowing only VC=0\n");
+		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
+			csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
+		return;
+	}
+
+	/* If source provides per-stream VC info, use it to filter by VC */
+	memset(csi2rx->vc_select, 0, sizeof(csi2rx->vc_select));
+
+	for_each_active_route(&state->routing, route) {
+		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
+
+		for (i = 0; i < fd.num_entries; i++) {
+			if (fd.entry[i].stream != route->sink_stream)
+				continue;
+
+			csi2rx->vc_select[cdns_stream] |=
+				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
+		}
+	}
+}
+
 static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_state *state, u32 pad,
 				 u64 streams_mask)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	u64 sink_streams;
 	int ret;
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
+
 	/*
 	 * If we're not the first users, there's no need to
 	 * enable the whole controller.
 	 */
 	if (!csi2rx->count) {
+		csi2rx_update_vc_select(csi2rx, state);
 		ret = csi2rx_start(csi2rx);
 		if (ret)
 			return ret;
@@ -490,10 +557,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 
 	/* Start streaming on the source */
 	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
-					 BIT_U64(0));
+					 sink_streams);
 	if (ret) {
 		dev_err(csi2rx->dev,
-			"Failed to start streams %d on subdev\n", 0);
+			"Failed to start streams %#llx on subdev\n",
+			sink_streams);
 		if (!csi2rx->count)
 			csi2rx_stop(csi2rx);
 		return ret;
@@ -508,9 +576,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
 				  u64 streams_mask)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	u64 sink_streams;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
-					csi2rx->source_pad, BIT_U64(0))) {
+						 csi2rx->source_pad, sink_streams)) {
 		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
 	}
 
@@ -535,12 +608,53 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(subdev, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
+}
+
+static int csi2rx_set_routing(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
+		return -EBUSY;
+
+	ret = _csi2rx_set_routing(subdev, state, routing);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt;
-	unsigned int i;
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad != CSI2RX_PAD_SINK)
@@ -552,14 +666,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Set sink format */
-	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	/* Propagate to source formats */
-	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
-		fmt = v4l2_subdev_state_get_format(state, i);
-		*fmt = format->format;
-	}
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -567,21 +683,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 static int csi2rx_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format format = {
-		.pad = CSI2RX_PAD_SINK,
-		.format = {
-			.width = 640,
-			.height = 480,
-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
-			.field = V4L2_FIELD_NONE,
-			.colorspace = V4L2_COLORSPACE_SRGB,
-			.ycbcr_enc = V4L2_YCBCR_ENC_601,
-			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-			.xfer_func = V4L2_XFER_FUNC_SRGB,
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI2RX_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
 	};
 
-	return csi2rx_set_fmt(subdev, state, &format);
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _csi2rx_set_routing(subdev, state, &routing);
 }
 
 int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
@@ -589,35 +706,55 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
 	const struct csi2rx_fmt *csi_fmt;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
 
 	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(subdev);
-	fmt = v4l2_subdev_state_get_format(state, pad);
-	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+	/* Check all streams on requested pad */
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != pad)
+			continue;
+
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+						   route->source_stream);
+		if (!fmt) {
+			ret = -EPIPE;
+			*ppc = 1;
+			break;
+		}
 
-	/* Reduce requested PPC if it is too high */
-	*ppc = min(*ppc, csi_fmt->max_pixels);
+		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+		if (!csi_fmt) {
+			ret = -EINVAL;
+			*ppc = 1;
+			break;
+		}
 
+		/* Reduce requested PPC if it is too high for this stream */
+		*ppc = min(*ppc, csi_fmt->max_pixels);
+	}
 	v4l2_subdev_unlock_state(state);
 
 	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
 		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
-	.enum_mbus_code	= csi2rx_enum_mbus_code,
-	.get_fmt	= v4l2_subdev_get_fmt,
-	.set_fmt	= csi2rx_set_fmt,
-	.enable_streams         = csi2rx_enable_streams,
-	.disable_streams        = csi2rx_disable_streams,
-	.get_frame_desc	= v4l2_subdev_get_frame_desc_passthrough,
+	.enum_mbus_code		= csi2rx_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi2rx_set_fmt,
+	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing		= csi2rx_set_routing,
+	.enable_streams		= csi2rx_enable_streams,
+	.disable_streams	= csi2rx_disable_streams,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
@@ -636,6 +773,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
@@ -853,7 +991,8 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
 		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
-	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+		V4L2_SUBDEV_FL_STREAMS;
 	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
 
 	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
-- 
2.34.1


