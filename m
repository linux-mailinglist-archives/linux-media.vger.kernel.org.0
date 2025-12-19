Return-Path: <linux-media+bounces-49165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E13CCFD0E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3683301E3FF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A91B3321A0;
	Fri, 19 Dec 2025 12:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E+U6CBER"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013013.outbound.protection.outlook.com [40.107.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115133122B;
	Fri, 19 Dec 2025 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147426; cv=fail; b=fTDpe0oywQR9bbz/gPautW1ipe0Dq9thq84G/oEO3SAvJz170bMPZoAq4ZUNRKGWtCQP7hpf/uLOuIa8JLvD/QloUzspqDdbHu7QlEtkVKlzRoRb6w3v7nGmW+36LHAl50LEEZWIi6bsxoeQvsUZZqfAz9popMYlaAmpLvr9fPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147426; c=relaxed/simple;
	bh=pOyhbmnq4nXCsrnoomCO61jv16t/YrPmYvMam3Mo2Dw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p8ceHhc6o9a70TpSeYZdIMF+BHhcB6+v6zjRY+kH/PLxekCpmgyew4G5chQBTQ7OZbDUjjBzx1I39UA8WgAJEFtdVlmqa2pjxVJ9NqVRTKrDgX9XtzoI6RX0eB4klCjwoUYOkPhjU+qLSwaq02HZ9/ryhwu64JV8kQUTiJOOMv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E+U6CBER; arc=fail smtp.client-ip=40.107.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9A9GHesymezAfX+r9bHcZw2DNOICEeI9Y7pTbFc9NcFD3NBoam6BxJ/5/rDE0lK9+OVvurilQd+I403GA/qMkmYXyWBbYW4G8FyaIimKc8+4CcRmL7Mb7qsMSuc95oRnmDgLFQJg1yOYSGbkReRarvKt8Xpp/kLpFbeNR/D8OKSw0MvTv7qg4R+e1NrRPvAeHM2F0/SDd+LUDB5L7m/qlVAQjOSFn+m2oFodL5muCDLf05gykS2MV8pqJ2/kNPKr3/oMA//dcG86dcjoWcPs45Ws62js5gdpUN0wL/h82vbLz24Hed/BCIVel0Rkxzlddkk47AGzhZJVL21UZZysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcUF85EnxzD+lyxatWjy8yxpCFYL1O8vkOmgVOERjAA=;
 b=PZ+SKEtiUy2dbA+fqfrqJY3BOLiiGp9WN0JQVgn5nWgu9At7Q0kb2LhyJSTbVYrNZibvYw3nA5BHz9Cbglfws37/oSVYUjzwLOTlQXvxC20uHER+jviHk/gk+6E/fGzGORRHypxumEjW7e8Txl5So7eNvONKQS3nRj7j8OeVHDfsgQX+JtawOrmYHCJ2DLEstIQNOwd95/rHFlv1CTm9pb1oPH+wQAiWUoZuJP0WnWAS0uQv6DJi5OQfgthYeBLKbHOSfe4poovILEDy/1At38uG4kTV5T5FDZIvZFClS0KUbSVH5qRXUg3j0dF1ItybRZh6+KpzWLUy34iAkv5FPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcUF85EnxzD+lyxatWjy8yxpCFYL1O8vkOmgVOERjAA=;
 b=E+U6CBERS4C7drKeo5xjis+UGOjW4dYZjR6tegzVMBsC9/+66m6Ti2lKbA1qJcxnO9co19BaPvUd5UbIG1/iYtiJKxIV3EpgKeGMiIe8skYJfs+XHvx6QwK48NMrUxFXuIxM0ZJnf+Ex1cMTzJie5FC5M4icUQqIZf53dVpU/y0=
Received: from MN2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:208:1a0::31)
 by CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:30:19 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::87) by MN2PR07CA0021.outlook.office365.com
 (2603:10b6:208:1a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:30:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:30:18 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:17 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 06:30:16 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJCTuJl918224;
	Fri, 19 Dec 2025 06:30:11 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<y-abhilashchandra@ti.com>
Subject: [PATCH V3 2/4] media: i2c: ds90ub960: Use enums for chip type and chip family
Date: Fri, 19 Dec 2025 17:59:53 +0530
Message-ID: <20251219122955.2078270-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CO1PR10MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d471f65-eb98-44a7-cb1d-08de3efa5eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gXJT2zzuPK9aUWasn8rfv9WGlQjShCgEfeuAZ0o0CWfJDQCy3Ws1hocVgROG?=
 =?us-ascii?Q?4x8xSWYQiTP42i3v0MTm7ikJG3xLKd2iMkwe59Z6u0zl+/XS6QquurkGFwa0?=
 =?us-ascii?Q?tJS8WEk/Mq6MZPdgUZ7+RElQCvp4koJ1INtJYo1XgRn/fzqviBzOkkKkaBJD?=
 =?us-ascii?Q?Zk3qMNcLvpEIeyzviFAwk/VaRDlqxRQSOARKQYVaxWvylK/cfo1gBwgFJPll?=
 =?us-ascii?Q?CdNBBvYqPscA0of0ctZOCEn2bQ8yGymGjtzoJktKR8gx3dm9VR5kd6fxi3RH?=
 =?us-ascii?Q?/Xzs4caVXu7HyoRq93/F/vkOdO+pBmZa7OHqtlh78lXZN6AwUUhzxDcO8kap?=
 =?us-ascii?Q?MTAwuopHXa0EvyZjdLxXJ+VoEmv+n8Kt0QP5KqF0Sf4cvFCfhGsxVGQ9hcu8?=
 =?us-ascii?Q?CmtIe2VNeFJE3uM80PtOMsjN9zIpJCvar46+w/X1fJlwAENvkxB1VEP43+s5?=
 =?us-ascii?Q?hyycM6y2ihRqftKvBywQWpQGAXHXOP1C33/f83W2XxLeqW2tOdMvqNuEsoLD?=
 =?us-ascii?Q?0vQSF7Rfg5AV3LWqIQAZKGhzOPaRTudd53l6v8NPZojczUrMKkBNgmF3nPTy?=
 =?us-ascii?Q?F3imJrZgihqglzCBuxqtVxV+v3z5oRYGRhvVU0EIsxwelkQHjJSCrkZbuHwi?=
 =?us-ascii?Q?JiwDQ4AO+Nc0C3zYX4+UGP/xUtkfQNHYfQoBSUHkAl2bw3PMvPq5k5gg/5pP?=
 =?us-ascii?Q?UyLIcnnI3CLza3atCuNc2SsuF5qYG4kXptb2Htdd9WfSITB9hFxZfLXAZI1o?=
 =?us-ascii?Q?75C04WZoVAKbcyolzLpLTC62G2phsgBvsdu9YTlLsT1PB7H6uhawzb/Fn9CZ?=
 =?us-ascii?Q?IvjOSwDdMH9yyhEAz3MLul5IsC3RKgmb1aF3WicR3PjQJdk+CHGCYU5tQ57f?=
 =?us-ascii?Q?moowOpLhwhtIzmg0XgT/yRA75wdn+Jxw8mqI+5382LAqchXotDr53wRnBBpX?=
 =?us-ascii?Q?DFY8GCtAX3s1YqCmE/3y5yCHcIE7C9LO5jpZMNhuPjfclMJLTcSjqP/nL3qa?=
 =?us-ascii?Q?S2+6kqsZlLxWrCCOVg/m7AGwb5tASujHUy0S9ZPX8h71lHIZXn0j9b/n/TMf?=
 =?us-ascii?Q?pHySK+vfk2efmBG5TdVjD7t35HHrITBMdzUJgyS+KV0iCFITYhPBC0wlZJuA?=
 =?us-ascii?Q?fm3dxNHTv4mUlVhIh4kbzhjFaBAr714pxf6fr/PN6fvTV1Bt/TCkp8M5QK9W?=
 =?us-ascii?Q?E/kW9/zPThyil6Np9ffNt8d7wlhpb9C1oXJrEymyzujnVRYyztNGfsiM0gwe?=
 =?us-ascii?Q?b/78ZWRLUEz29GlcPSYlu5uOZEnu7r1b0MQ9ZnWm1SAsOH80cwBgsNiLw0jX?=
 =?us-ascii?Q?A0yIK5ALAkygx3T5id4a6ybtOXHft358TBHMYCSUoR8m62F6FmQ4ilnAAx6F?=
 =?us-ascii?Q?Rl9cYeesVh1ma+hZKXNlhTNvZDtUE0rVON/AFdrW0Zy3fxsKCGeWHyHnNGnv?=
 =?us-ascii?Q?0Fu9obWRhYay/WbTGi6bHhR8Hjiw3CZPIqn+zZtkGyWmR8w/pbTnU8vxJTVG?=
 =?us-ascii?Q?O6vHcnxqnmeXW0gP2ADoaYIs8s+HhfGyjZXwoiIIQ0Zt3vfihIU3+osFnfFF?=
 =?us-ascii?Q?LurzA+2gZvxWl6aAAqM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:30:18.4028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d471f65-eb98-44a7-cb1d-08de3efa5eb9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4468

Replace chip-specific boolean flags with chip_type and chip_family enums.
This simplifies the process of adding support for newer devices and also
improves code readability.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Change conditional checks to check for applicable chips over negated checks. (Tomi)
- Keep the model name in the ub960_hw_data structure and remove the switch-case from the probe function. (Tomi)

 drivers/media/i2c/ds90ub960.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5a83218e64ab..bb453d39e0c1 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -454,12 +454,22 @@
 #define UB960_MAX_EQ_LEVEL  14
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
+enum chip_type {
+	UB960,
+	UB9702,
+};
+
+enum chip_family {
+	FAMILY_FPD3,
+	FAMILY_FPD4,
+};
+
 struct ub960_hw_data {
 	const char *model;
+	enum chip_type chip_type;
+	enum chip_family chip_family;
 	u8 num_rxports;
 	u8 num_txports;
-	bool is_ub9702;
-	bool is_fpdlink4;
 };
 
 enum ub960_rxport_mode {
@@ -1933,7 +1943,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (ret)
 			return ret;
 
-		if (priv->hw_data->is_ub9702) {
+		if (priv->hw_data->chip_type == UB9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
 				nport, ((u64)v * HZ_PER_MHZ) >> 8);
 		} else {
@@ -2195,7 +2205,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 
 	ser_pdata->port = nport;
 	ser_pdata->atr = priv->atr;
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
@@ -2361,7 +2371,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 {
 	int ret;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_init_tx_ports_ub9702(priv);
 	else
 		ret = ub960_init_tx_ports_ub960(priv);
@@ -3633,7 +3643,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (!priv->hw_data->is_ub9702) {
+			if (priv->hw_data->chip_type == UB960) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
@@ -4259,7 +4269,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		if (!priv->hw_data->is_ub9702) {
+		if (priv->hw_data->chip_type == UB960) {
 			ret = ub960_log_status_ub960_sp_eq(priv, nport);
 			if (ret)
 				return ret;
@@ -4417,7 +4427,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
-	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+	if (priv->hw_data->chip_family != FAMILY_FPD4 && cdr_mode == RXPORT_CDR_FPD4) {
 		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
 		return -EINVAL;
 	}
@@ -5019,7 +5029,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
 	else
@@ -5038,7 +5048,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 
 	/* release GPIO lock */
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
@@ -5111,7 +5121,7 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ports;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_init_rx_ports_ub9702(priv);
 	else
 		ret = ub960_init_rx_ports_ub960(priv);
@@ -5180,16 +5190,18 @@ static void ub960_remove(struct i2c_client *client)
 
 static const struct ub960_hw_data ds90ub960_hw = {
 	.model = "ub960",
+	.chip_type = UB960,
+	.chip_family = FAMILY_FPD3,
 	.num_rxports = 4,
 	.num_txports = 2,
 };
 
 static const struct ub960_hw_data ds90ub9702_hw = {
 	.model = "ub9702",
+	.chip_type = UB9702,
+	.chip_family = FAMILY_FPD4,
 	.num_rxports = 4,
 	.num_txports = 2,
-	.is_ub9702 = true,
-	.is_fpdlink4 = true,
 };
 
 static const struct i2c_device_id ub960_id[] = {
-- 
2.34.1


