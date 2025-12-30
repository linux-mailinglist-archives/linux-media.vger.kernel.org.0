Return-Path: <linux-media+bounces-49676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87878CE91E4
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDD93067650
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736EB30BF6B;
	Tue, 30 Dec 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oCeTEYD4"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5F30BB89;
	Tue, 30 Dec 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083615; cv=fail; b=AlIkkcTSoRcJcnnb0j91cGdYNgxJOJhMJrEoDsO5gnOtwSA0PGoNeE8b0iB4MfV67xY+ROZZAbMof6bbPA/pkG4QtxYrXcO0scZG1pKmbP5aTNmJp1zwYtPvgph8N7T1F5umv+XUsM4dkuR6N5g4T3p4ZPlvJ31DSHWnHRNkpcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083615; c=relaxed/simple;
	bh=t9Mjp5eiG2qveJ+ny7IkuRomW5A0CUL19HDCHwqNPa0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2BUEE3FVfboUFh7eyHXHiXRbolRcM1ikoNFea5vOcOwTbYQA8UXpw3PcqitUQ3/rX3SA4iAMyge8kDW1wOR5dKU0FHzxneyCNJLNj2k/zNAg9osfkMaHFMRIgI19GzHCSpcc+oaQoD6hfQMvj5wkJACOoRD+8oCykwhNLVf5mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oCeTEYD4; arc=fail smtp.client-ip=40.107.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ti6yAUWd7PjY/f1mNuHr0tz3iRsz9kJhqT60HKXbE+1t3CkgggkFyLTg6c6VamDeDWwrHNFb9AUU1g0v1wUVxEYChHOTz791GVTbTI08i3/Up/ufzgyoEEylFNB/iOzGK7/M1e5JpW2pWwGiArqSVBUVDRv40vribCRWdyAKfbWo+RIHjkra4MTZPCTi/gRTHuzFWNFEqhGcLQZTFOIfxCRV04OpY/vuHDzwAUaB8uxs2/cLQlT/6+cyKIOz8ezUfK2R3+wPUit91smlgPZN6QAYD/KOOMMWMozNYaJwoFGBFJPD9bRV4KtFNnodJbTTw86lzX4Uf6QlZRT8vrtpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbJb5a4qg9ir82UPcZLTERF+rnnt8LUWuA0eGQVbBvM=;
 b=VQ4iwf1AmLwU+DN/3joB9l8ZTI7BBQ/rLCX7tW3Am2ELqRfjwVAbHFpQAOlZN34uAHY7qURUIgbewAOkiHu6aCfKYubc4vfdmAj0YU+seDt9l965sai9iPgG+se5gRWMeHQesoIMEiRMXbVP6Z8niS22F8/Q7j9Ql6OeFCutU/gYw1mQLfY7XTEujKkICsPwlTNKpQj11AyBQhhDmjdyC1uZMVyG86mHwHWXST2MX2Z287HzWhkoDaJUcOg/t5HFjg3mAmQx3u8y++R2EndO7hHY+vS5I3fWCntOvPXADMG9xjx1UqXd4PUS1KeB+stRiIkuke2iQ8ISEJclXKgYcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbJb5a4qg9ir82UPcZLTERF+rnnt8LUWuA0eGQVbBvM=;
 b=oCeTEYD4ZcLphR3Gu0w6p5NKvj+8K2fXf5lLacVT4q5oAlAERzIG7ZGksgV+N0HUyrLzndr6bsmf1B+DnRQery+nBA2q4WhyeBaBpkMFBtS/vAEP7wlKYeQVViF2m/b7sT8VTWgckdbC7AYM42t1if8YD/UgNK6dXcW+4WCYO9w=
Received: from PH8PR22CA0006.namprd22.prod.outlook.com (2603:10b6:510:2d1::10)
 by SJ2PR10MB7826.namprd10.prod.outlook.com (2603:10b6:a03:56b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:31 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::33) by PH8PR22CA0006.outlook.office365.com
 (2603:10b6:510:2d1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:28 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:14 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:14 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9a579464;
	Tue, 30 Dec 2025 02:33:08 -0600
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
Subject: [PATCH v9 07/19] media: cadence: csi2rx: Move to .enable/disable_streams API
Date: Tue, 30 Dec 2025 14:02:08 +0530
Message-ID: <20251230083220.2405247-8-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|SJ2PR10MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a49068-1849-4ede-9d1f-08de477e1bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbhZTj5aNBmxUGHGKpIjz3eqOxaDW+XKMcKhRPy3sGz31oup04OMojNa4tbq?=
 =?us-ascii?Q?GREwvoKC3XTU2Bjy/YD56woqKeoBSrMAUyKj2RvhnfYudokdZT5KWthS6NtC?=
 =?us-ascii?Q?UhZnjIgz/99rl43mNpTls1n2KvT/vnXZu9HTuaRV02P/WCHv6EF+l7cwyvNH?=
 =?us-ascii?Q?JuAd1Y93K51fjxCAudT/KSDvdtpDOQvs8p8odmfgwQbhhmUqb7FYz/djH8u5?=
 =?us-ascii?Q?eY+uJLBWSdAOS5gR+PBAdOQKNxCYXGzNAEGhbq1gYLqmExSUKgUwy6AqSfpc?=
 =?us-ascii?Q?OmcZRx1S8LCnFqLKWZrZ2oOnA1NM1pLhsk3DkIGRUbejkxauLmGwveF1mF6l?=
 =?us-ascii?Q?ytqkNPuceA6/4+IT3UJZqRGD8mKYEN2qzcLnZBWazo+oPlRe6WOJaZc7A0kC?=
 =?us-ascii?Q?LaQwHRdSRXiFNOCpo5nqRxAoC5iMB4g29D0VXhA6bufo3UF8enot56MGPT3h?=
 =?us-ascii?Q?Kqba7GK1PHggblvr+GZkoQ3upidV0TeCsgQN+5GxM4ZOThsNQrog8c8ImRns?=
 =?us-ascii?Q?337o6n8dmgho1WeMgjnWulrWBsGlF7RiMk95OVLqpDr8XfF9wk3jvwlJoXcN?=
 =?us-ascii?Q?EmrXCZ9bfdpjMtIv4mJR15vQw5PuxAIvph3+tvc4dEpNkZfyaYhNshy3ycLQ?=
 =?us-ascii?Q?6uX1mo+tapN+3daWF3Lst4Qt3Y14XzEM3t2Q675+bPbuFe78ZkNWZJDmqEe+?=
 =?us-ascii?Q?s3Tm6WigqajA9PX9cvdHRA4UiTzU9ObbRTjqUHJgUhxg5LfXfP8hNFrFt1uW?=
 =?us-ascii?Q?Am97WQYt8HgkkFZlBjZvE8kMfLfBj3r8pHERwn/tylJ+Xmd+IAgqX9vpG2KZ?=
 =?us-ascii?Q?dQ0SWkhUcnPGBCdFEarWkZxGIyZUM41bLOeqQhNaV+75WcEL+oyYk842z2N/?=
 =?us-ascii?Q?R6KwLyqMbwavGAxTNauFNIq+FdENnMyOwVb9FvgNHcY2VK3FPSRlZmu7eLtE?=
 =?us-ascii?Q?7joq7dtNZpbCYTBj+BDGLM+lC6+1TFwCYaSOiVCB4TuvE0bsWjVRNQE+oNhG?=
 =?us-ascii?Q?laLojrWoZvdM8HLim075bBFXOICCm3lnH4qATEZ3crVA19299AoGz5k+DynF?=
 =?us-ascii?Q?oG9AkCqXIW14R7iS66lIOaGePHxHJxT/DXOGORIAGQoY0N4TUyR/vtKRYslf?=
 =?us-ascii?Q?6e2fBv/kX0b9CEXGcVl48+tDywGQTpLQj9QosiV2TekhiJpmgmU09+ry6xt/?=
 =?us-ascii?Q?sFSReX3zMM5SQQUNOJhWhlzmvMoWZ4Ylbhdf6scOQvO1gXQWJ6BNBDsqNBgM?=
 =?us-ascii?Q?bdhEtPHyBt7t/wkKbZBj7s1GMG8JejPUVcnYcjG9J3lCOnaO9tQ3bysTR1RP?=
 =?us-ascii?Q?3hpAvViiqYDUhC6xNnX7tW5uSYBrvCLHQtNKKZlLXw5SZcbmPQncFmoTTdVf?=
 =?us-ascii?Q?UFsFaic0JSJhGwtcZJ8wtxsKzGfFFUgEK3znZ6xwHi3khGcdycv15pHD3l71?=
 =?us-ascii?Q?2Ab11LBobfc5P3aOwEauY/4Y0rj2II5rFsIt9M6pvc5Ca6hXbywsxzTyoue0?=
 =?us-ascii?Q?E2/X78l+99qWCYofn2aaCx46oGMg0Pkl+1zdgHF3O8ICNMYnsaaVTDeotpxF?=
 =?us-ascii?Q?FxfGehOx+tiULpVqwW0=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:28.9252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a49068-1849-4ede-9d1f-08de477e1bbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7826

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev. Use this
API instead of  s_stream() API.

Implement the enable_stream and disable_stream hooks in place of the
stream-unaware s_stream hook.

Remove the lock that was used to serialize stream starts/stops which
is not required anymore since the v4l2-core serializes the
enable/disable_streams() calls for the subdev.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 108 +++++++++----------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8c19f125da3e5..8e7af2da62262 100644
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


