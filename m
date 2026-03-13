Return-Path: <linux-media+bounces-55616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCctG4DVs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:14:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EBE2804D7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7DF310E206
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD023890F9;
	Fri, 13 Mar 2026 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FPbHIn2z"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4826383C94;
	Fri, 13 Mar 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392908; cv=fail; b=eReOk2qD+1dqM9Ymyx4ENHNn4+LJhxkV3lxPoDTqT2F4QXryU50Jf7APiJixdzKuIDjP3CBTVRc7VXJg9ChOaQf4tyNg9Y52TxuUM7mwhCFgev2zRKGoZcRWp6xzUQ45pfgGfBRNpMcd1wF0mmM4ILHEatScMpUJbCUtVYv0F/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392908; c=relaxed/simple;
	bh=94+Q2wkVURdl3/1PsBzy7QqBWa0CJKh1kIIpH6VY8qU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAM8bUtj6UzwDxrP0A5NMWIciA5SNctvDf6X7zkv3o01V/rZqIZNWHfQw5jXhB8AkCaHwLyRFhmF/64MXAu2t1h4hQt+vRhQyuEPdO7po/sPIsHsxyMRduxxQPDrog+Eqv1305M/Nmd0fXoQoqjx2XtTWWDVIdkQq+r+u8u/i+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FPbHIn2z; arc=fail smtp.client-ip=52.101.62.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEk/utWpNPGW4EwHIS0vAKndlbDLmE8KR6fW+/AyU7bxSx/+s6jnGCq8LL8i/cLStydm1bgbFs+MAbW7kVBsALnkIALu07qKyVy98ZpQxyC6chKIzwZdaMdSHSN/zX0iEGQCzuD4r91DrOz8aM1tVp8grFW6/VEjjUT2JIFrrtSfRTvKRv3u615UyH8OxTGHdB21lzQW05DvHaM0YSrH1ANxXI0SqWvG8PzWBxucKq9E4FqhbhYnj7WZ1wGyK/NfveG3zMZ4Nr0GKOb+xAudlQmtVEmfFdi4iUBzxWbHvV+LDQ6KXkdT2UGhrLfNo4ezbqQpSuEDXRI7erAYOkKGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0znzgp/EQukFhrwlnbvh8BhHPCZDMCGjRM7xJ+VXw4=;
 b=CwDX8Y3v5I2GTjbqgooiqWw5U82mzm6kCNTwq6Mfu9OSZKZg/wWfiBNYLs+10IOLM/TmYXXqNuiiPihCr/m1zYpKHQZHsLk2CBUuMRWNMWLce+rsyRJmWJhvnCI8Swpdh2iv/3JbstT9PoZPR2YqxHquJg8e56JKKgBvpzrUT/Z/54MeNWJHOHAMGbFpM8mmTSt8EAeju31JeSVJDdrKRhe2C+BTy65HwgD9W50qgJalje32BuEAUaRgdFhEYDwezvFzI7fauW4k5PD3YMAYodhU9NxQNF3HeUtehL4oQhMuQRkNCxze5hP6Ew7c7RkEif4p7HHTAKyz7sYs/l5mzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0znzgp/EQukFhrwlnbvh8BhHPCZDMCGjRM7xJ+VXw4=;
 b=FPbHIn2z6q1lD+4sS0M6mWMtJu/gRXrXgvl6WoQtpSIPYIYFBJTVfwC3W0A+dFm0uNiThvQ3iwFZpyyNN0H13JkvUcA5A8BDPtBeoTh45wHngDFBC9TRZDXYi2eOUCiMXcME/yKnlpHAdNcIhyVlTH8eEncfCsaWZ5zf+vHRcG0=
Received: from SJ0PR05CA0206.namprd05.prod.outlook.com (2603:10b6:a03:330::31)
 by SN7PR10MB7001.namprd10.prod.outlook.com (2603:10b6:806:345::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 09:08:24 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::43) by SJ0PR05CA0206.outlook.office365.com
 (2603:10b6:a03:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 09:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:08:22 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:55 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:07:55 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bb274611;
	Fri, 13 Mar 2026 04:07:48 -0500
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
Subject: [PATCH v12 07/17] media: cadence: csi2rx: Move to .enable/disable_streams API
Date: Fri, 13 Mar 2026 14:36:51 +0530
Message-ID: <20260313090701.646534-8-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SN7PR10MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: a9711b8b-a142-41ab-0a7b-08de80e013dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gGAtdv4cqzNLgLY8r4KkVQ6Gfz1RwqIJ0eYTVC39nRlmSLBgnbl4piH4QQ7dRopvZzlOsquLS1uUnERF7q7ir0/qY+0bAd2qZ4jqxhHgHWYG242jNk6r2OukgR9idpjcDicl9dAjPYv2FY5EIy1dqO0AEy9+pMZaEf3XVjnPrbzTB0T9OPn6JjJe1XKeRkH1nbA7Wod3y+ifKqVpmVRBaaXOcVC03YbV+mjDdk5HiaTBGcVayPiuKQWuI5emAi637Y2zlieLge6eu9nbyi1ev8JiFSdtu7lGG7duMiv43av6HAdpQI6alnokyEPOMR6hjownpboiXsE9s+bJKdGhpgAYWuCrcpiIxGoiy7lWauDjI075EYtRXTSP4P0rtNqkbeksWWLcRi7ggs/kTChrm9oFkFUpE4akSZAoGkk2crL0oSUWKnX3DUYfDOPMArBwP0Nh/6hXC5EV51mwuEhMiG7ZWTImhYWeiHC+mgyMXewubCYbYIxhvb+8Ij2vH/Z3eS6zj6HSD1t+ieX8ru0aVyVFT5fCUGbO+jvBtggU674f5ZeuYZPSNOsHH0wB7yiK7xSaVtHnZIrmG3Qzw9AWHa4Z1kc0fnkupTmqnNXbHYBw2Ym3aJaMZrBIqmjVyvZPvPVJbfLMgbk65dV3GFfoh78AyS4SpyJeLNhSKlUQ9c/JtuywN9M3zu6qh7OutDSh3KDGcc9jNFkupbye3SwZWoJG/o8ogCkGcsUimRA1LFE7UaVAm16fxl3NrRYp25yXtriAwwOhB8NyiQlXN2X7HA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tXWRfs5B6JbfU40V7yEORAlJBc5SJS3xPuLjbiubZ3P5WCueg8ICViXGCdXXmJzWumB06hyBLpMdmxEp+m19Z5iI/Z7nLLYT6H2u83HRQLlzRJ0ZknEHPVKcMByWzJNSjwNT/TliMhjimX9UwcxVtVgs+ezX/s8GQ1gXP3iSKLDOZbSQGldAh5b5CDVeD+QVRiSVDPtOo3zcymxMb0Oe7utrBi0lDvPJX+ETlkyoJiq9jFEF0z3ETCiyeYaRb11epjhe2WWtElT0rKqMyrwfpWrnAwOn39Pzxsp9TUwI/b+YSoWFTVELKFu1yp3nZdQNz1FPkoQy9GrtLOw0w9or6D1+jdByeUjYT8XrPpCptSK9oq9r1Y+I3FPEULlz2PZ8VWE5p2kHZZP+/i+bCWKm/L3blBYTdRMuL3UoLiROQgqKnE9QXL6oQuNx8Bc6y9hj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:22.6078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9711b8b-a142-41ab-0a7b-08de80e013dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7001
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
	TAGGED_FROM(0.00)[bounces-55616-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: C1EBE2804D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev. Use this
API instead of  s_stream() API.

Implement the enable_stream and disable_stream hooks in place of the
stream-unaware s_stream hook.

Remove the lock that was used to serialize stream starts/stops which
is not required anymore since the v4l2-core serializes the
enable/disable_streams() calls for the subdev.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 108 +++++++++----------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cde690c6fdee6..2b25314ba6ab0 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -125,12 +125,6 @@ struct csi2rx_priv {
 	unsigned int			count;
 	int				error_irq;
 
-	/*
-	 * Used to prevent race conditions between multiple,
-	 * concurrent calls to start and stop.
-	 */
-	struct mutex			lock;
-
 	void __iomem			*base;
 	struct clk			*sys_clk;
 	struct clk			*p_clk;
@@ -268,20 +262,21 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	struct v4l2_subdev_format sd_fmt = {
-		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad	= CSI2RX_PAD_SINK,
-	};
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *framefmt;
 	const struct csi2rx_fmt *fmt;
 	s64 link_freq;
 	int ret;
 
-	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
-					    &sd_fmt);
-	if (ret < 0)
-		return ret;
+	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
 
-	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
+	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
+	if (!framefmt) {
+		dev_err(csi2rx->dev, "Did not find active sink format\n");
+		return -EINVAL;
+	}
+
+	fmt = csi2rx_get_fmt_by_code(framefmt->code);
 
 	link_freq = v4l2_get_link_freq(src_pad,
 				       fmt->bpp, 2 * csi2rx->num_lanes);
@@ -401,16 +396,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 
 	reset_control_deassert(csi2rx->sys_rst);
 
-	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
-	if (ret)
-		goto err_disable_sysclk;
-
 	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
 
-err_disable_sysclk:
-	clk_disable_unprepare(csi2rx->sys_clk);
 err_disable_pixclk:
 	for (; i > 0; i--) {
 		reset_control_assert(csi2rx->pixel_rst[i - 1]);
@@ -459,9 +448,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->p_rst);
 	clk_disable_unprepare(csi2rx->p_clk);
 
-	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
-		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -485,38 +471,56 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
+static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
-	int ret = 0;
-
-	mutex_lock(&csi2rx->lock);
-
-	if (enable) {
-		/*
-		 * If we're not the first users, there's no need to
-		 * enable the whole controller.
-		 */
-		if (!csi2rx->count) {
-			ret = csi2rx_start(csi2rx);
-			if (ret)
-				goto out;
-		}
+	int ret;
 
-		csi2rx->count++;
-	} else {
-		csi2rx->count--;
+	/*
+	 * If we're not the first users, there's no need to
+	 * enable the whole controller.
+	 */
+	if (!csi2rx->count) {
+		ret = csi2rx_start(csi2rx);
+		if (ret)
+			return ret;
+	}
 
-		/*
-		 * Let the last user turn off the lights.
-		 */
+	/* Start streaming on the source */
+	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
+					 BIT_U64(0));
+	if (ret) {
+		dev_err(csi2rx->dev,
+			"Failed to start streams %d on subdev\n", 0);
 		if (!csi2rx->count)
 			csi2rx_stop(csi2rx);
+		return ret;
 	}
 
-out:
-	mutex_unlock(&csi2rx->lock);
-	return ret;
+	csi2rx->count++;
+	return 0;
+}
+
+static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
+					csi2rx->source_pad, BIT_U64(0))) {
+		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
+	}
+
+	csi2rx->count--;
+
+	/* Let the last user turn off the lights. */
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+
+	return 0;
 }
 
 static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
@@ -611,10 +615,8 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
-};
-
-static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
-	.s_stream	= csi2rx_s_stream,
+	.enable_streams         = csi2rx_enable_streams,
+	.disable_streams        = csi2rx_disable_streams,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
@@ -623,7 +625,6 @@ static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
 
 static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
 	.core		= &csi2rx_core_ops,
-	.video		= &csi2rx_video_ops,
 	.pad		= &csi2rx_pad_ops,
 };
 
@@ -829,7 +830,6 @@ static int csi2rx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, csi2rx);
 	csi2rx->dev = &pdev->dev;
-	mutex_init(&csi2rx->lock);
 
 	ret = csi2rx_get_resources(csi2rx, pdev);
 	if (ret)
-- 
2.34.1


