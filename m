Return-Path: <linux-media+bounces-49675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B0CE9111
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F101330895A6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2282730AACA;
	Tue, 30 Dec 2025 08:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i3dgPPri"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C5C309EE4;
	Tue, 30 Dec 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083607; cv=fail; b=JPB95tXeyAW4rNatKT35gw8twmb1MDclM46U69vqgbc0e/d9KL7PDu8w9+wRx2w+g++kFp5x/o0n2n1ub7BwCr0P8mzQm5iObQLGaoeeEhynLwYGoo/N5fYtZ29gqTeGiZAi8vmCmhaUBD5LtwUa3QPoXA7LsveAQFwKDZNgVDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083607; c=relaxed/simple;
	bh=pBsQWvBHrmsVDa/SWVrQAt+bC30SA+waF3/TT35CK0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zkk3JN35fRb0Oz3bRbBv244upY5f2sLe/gAXngYqysvC01SlR1U0jz7EGH2k/RVof34YW7wOC8AWRzLnXVlD4SLOPu1bDrp0G8aYHNFveDSUfOfcZeX/7/LrWu4Y8SnnUuZeMKfki+PW7SJHvjXc9SS7ElZpTSjeu7pX3YCEs3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=fail smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i3dgPPri; arc=fail smtp.client-ip=52.101.46.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTpwhCT4KWq9EuNW2J9LIu5cF8AMRqd+mvj75SGlIimZH1XEAHS+WHQQZ/8XQnV8209Pe7y62nzg2hIBK1g+OxIs43KWx/kpSy3JzkdMVJBoUqpP35uFohfdbIi/SKtgSV3LtUbjujMJmEGFF/GESnQNjralhH/Z2uCgVr6loqV2qpERHrcyvUe7QozQ9bqSKyT0mPMff2u2Uy0oWcU3WgVn43Qz71mFGBFPlM2xgf3+DZ4acOQgXb1sHI7hDf7FYNV0koRUmfQn5zJJZdSaNH05Eas/6q4kLDEWi0iDBpTaN3pXHnhLGrCo286A5HrKbErIKxjnqeinl/XL61jygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKhxZNFEFRIkpao3jeyaYMYmryLG/+hERaAdjWyRUOM=;
 b=kzD+VB0XaSg9xIwfjg00zQBAmkp9SZ5/oykzXD2dT7Pb27gFfrbbCp51YGqbCN5bJF7dgVNcWPF9hvRQOCYwAT8sYGwY4Qrsqs37mE33TbwgnyGswdFmH09PZV8Q/I4Wp0D4Rg0yp0l3krEss2tDVNv2SspUb7+2wg6jljTFfPQtd2GCQqjqZguSQwilVMVQTXolljRgwlVYv/Rr15qw9n7s9ITHathpoKGa3LBuxk0vCe1jNv4zwYvq9ospZOUP4sDZ6wJhJ0uP6/djr9aMT3FXXJ+7CWDXiBHvFZ1jKfadsZhQx0bP5miO3Wsz71mOnzdwx0QCGLjXataeMflZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKhxZNFEFRIkpao3jeyaYMYmryLG/+hERaAdjWyRUOM=;
 b=i3dgPPriU0Lb2zvi6IBTcg7+Pv2SlsHwKoYzXKSaUmMbtwS89kqmlYFBhdUvZO2VTGuDKlEGyxRlGGR8o2Xgs7t3HVPPu8WnOYVSaJiO+LLB9WWznqKnAvDi5BQArJb/gqCMV7LEQWTQl3P+yKe/uxc82J/RSqXcwTkyA4GWKSw=
Received: from CH0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:610:b3::26)
 by CYYPR10MB7567.namprd10.prod.outlook.com (2603:10b6:930:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:23 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::43) by CH0PR03CA0051.outlook.office365.com
 (2603:10b6:610:b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.13 via Frontend Transport; Tue,
 30 Dec 2025 08:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:23 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:21 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:20 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9b579464;
	Tue, 30 Dec 2025 02:33:14 -0600
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
Subject: [PATCH v9 08/19] media: staging: starfive: Move to enabel-disable streams in starfive drivers
Date: Tue, 30 Dec 2025 14:02:09 +0530
Message-ID: <20251230083220.2405247-9-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|CYYPR10MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c75d89-ff14-4680-10c1-08de477e1880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3mlb8caBNeivGtq1iOipJoPP+9aVANo2qXqa/Im3w/2pKuVYpHvcehJ+jFUc?=
 =?us-ascii?Q?rgu/ZIXk0VpxkeNva1TB7r/9WbMquJV+BH0w2ChUh8y7PA4u3OqxN6/xGUe7?=
 =?us-ascii?Q?s64N9MDu1+QPousUBw+BB9OqSaOS5tfU+VBqRA/kyBAFBna9DVK+svHHI9tn?=
 =?us-ascii?Q?KgBlVCsSSxvfz6EAWRXjPfHs1HYdqv4oYtmYg8gwJVGmI1mr4YiPJULB84j8?=
 =?us-ascii?Q?6/m9QvPuqCBXnE7qSPGEO75AilXOj2ir1yho9frculh9JQINaaxbsYByEVk5?=
 =?us-ascii?Q?rcSDmgI01qVnulOu/V7sayB+BTJyEAiKd0Wdw4JtuLzrSQ7XkSxnRQfjAfS8?=
 =?us-ascii?Q?7NxsOAm/HOD2I7gDcgjON3ER26bYe7hCiimwEsRZtpBPfhtrTUXQBRM40iNL?=
 =?us-ascii?Q?m2avuw7PB7mg4ToYhON7CXN7c1SmNKTXzFT7xX/hIogc39XrrV5YaEGQnQWM?=
 =?us-ascii?Q?96Cfe31LqyqayUDkgz6sw5Lq+6UFAqKG9XIsYG5q9ocb1adhCL7pxkA2l89k?=
 =?us-ascii?Q?u69jrL6NZVWVKkziYKrgN/URf4nH3kIETy4GE9GHXJflDu/AjcoOEV9rL88x?=
 =?us-ascii?Q?3E1DtHO3y++RREbeVDcJolv0BWwKbuj4DpEAM32WIsISp1F2a7GposDWNMiY?=
 =?us-ascii?Q?ShWis4dnQbJ12nl1SEIeVFaC1plQSU0Fi23yBprDvB2iBvqNgTNzmv+Hd6er?=
 =?us-ascii?Q?8O3N/iBuslk1T9nFw2KipUYMLqfPAtJsZ6fooLi0yOi8jOMbNjZaynC3HFDp?=
 =?us-ascii?Q?yY4GnvUvIWLTC1/lqccTACLmT+aNduf1nBpzihlV5+PoHS9b5jeKfS9IA2rP?=
 =?us-ascii?Q?757UQVJX568nIlAgL4HcutI5m9h0wM3qlg2JBkpes4isIwWrsUro/D/pSYgt?=
 =?us-ascii?Q?juR7uBoz4CLiZm2lpJGWaV7T3xZHAnVKbpKJ97cJIzbsLMYNa6TVtIivp1Y6?=
 =?us-ascii?Q?mv75nnhuChPbntx1xNo9QcFhOqmvftJ+4DCjI2tjUIGCXaPDyusVDiTEl6T7?=
 =?us-ascii?Q?c1tzuBlsh6F/EOtzjYlCyIYvPd61weZXd0/2AyuYZR0Jquvsx7HDMT4vFR25?=
 =?us-ascii?Q?Hp5KxjsEDvBODq/+wlz+Y/VeyREJfcXRZ1lMx4h3F7dh924uPYjmMzduK320?=
 =?us-ascii?Q?en5LU4kFKfX+h6xzYMcSg5KZ9HS18zQBu1zyBmhAspExC1PhHuWqASsfJne8?=
 =?us-ascii?Q?EjI8f6mXp5vdBtME7qkA+QoFe2xbHeslwGiw/C+ZWGjf+pMvix/fUNP3KkwG?=
 =?us-ascii?Q?a3QAnx4PTFj51Leal9NcXYhxVGydmKEqiVrSno2y+PjnKbe4IY2V97mkv8zF?=
 =?us-ascii?Q?I4FMgDLcv7vMbKfLSlVJLXx6clG0Ly+lYA7eC+MqHx7jcNldl2dywR8HXHMI?=
 =?us-ascii?Q?2IMKl6/x9WsTm2kdTJWhS1g788IBX+U3YuFGRY86S+NH6sCdC3CdxqbhwNBn?=
 =?us-ascii?Q?y5CBKhRZ1co89XlXB6uplarrbjGXbGV46KEOIczejZXU0mjF8pmzh54n+E1A?=
 =?us-ascii?Q?uxh1KjGx38Qw1nyIm0DFncZ14rSs3OugkK1/PhbIa6knRze0lL2doKKheFvY?=
 =?us-ascii?Q?3O+pz7Gebrx6eP3gHNw=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:23.4714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c75d89-ff14-4680-10c1-08de477e1880
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7567

The enable_streams() API in v4l2 supports passing a bitmask to enable
each pad/stream combination individually on any media subdev. Use this
API instead of  s_stream() API in the starfive drivers

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../staging/media/starfive/camss/stf-isp.c    | 43 ++++++++++++-------
 .../staging/media/starfive/camss/stf-video.c  |  4 +-
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index df7a903fbb1b0..4930ffb0e07a6 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -55,27 +55,43 @@ int stf_isp_init(struct stfcamss *stfcamss)
 	return 0;
 }
 
-static int isp_set_stream(struct v4l2_subdev *sd, int enable)
+static int isp_sd_enable_stream(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				u32 pad, u64 streams_mask)
 {
 	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev_state *sd_state;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop;
+	int ret;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	sd_state = v4l2_subdev_get_locked_active_state(sd);
 	fmt = v4l2_subdev_state_get_format(sd_state, STF_ISP_PAD_SINK);
 	crop = v4l2_subdev_state_get_crop(sd_state, STF_ISP_PAD_SRC);
 
-	if (enable) {
-		stf_isp_reset(isp_dev);
-		stf_isp_init_cfg(isp_dev);
-		stf_isp_settings(isp_dev, crop, fmt->code);
-		stf_isp_stream_set(isp_dev);
-	}
+	stf_isp_reset(isp_dev);
+	stf_isp_init_cfg(isp_dev);
+	stf_isp_settings(isp_dev, crop, fmt->code);
+	stf_isp_stream_set(isp_dev);
+
+	ret = v4l2_subdev_enable_streams(isp_dev->source_subdev, 1, BIT(0));
+	if (ret)
+		return ret;
+
+	return 0;
+}
 
-	v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
+static int isp_sd_disable_stream(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
+	int ret;
+
+	ret = v4l2_subdev_disable_streams(isp_dev->source_subdev, 1, BIT(0));
+	if (ret)
+		return ret;
 
-	v4l2_subdev_unlock_state(sd_state);
 	return 0;
 }
 
@@ -300,20 +316,17 @@ static int isp_init_formats(struct v4l2_subdev *sd,
 	return isp_set_format(sd, sd_state, &format);
 }
 
-static const struct v4l2_subdev_video_ops isp_video_ops = {
-	.s_stream = isp_set_stream,
-};
-
 static const struct v4l2_subdev_pad_ops isp_pad_ops = {
 	.enum_mbus_code = isp_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = isp_set_format,
 	.get_selection = isp_get_selection,
 	.set_selection = isp_set_selection,
+	.enable_streams = isp_sd_enable_stream,
+	.disable_streams = isp_sd_disable_stream,
 };
 
 static const struct v4l2_subdev_ops isp_v4l2_ops = {
-	.video = &isp_video_ops,
 	.pad = &isp_pad_ops,
 };
 
diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index a0420eb6a0aa0..2db29bf8bdef8 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -287,7 +287,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	video->ops->start_streaming(video);
 
-	ret = v4l2_subdev_call(video->source_subdev, video, s_stream, true);
+	ret = v4l2_subdev_enable_streams(video->source_subdev, 1, BIT(0));
 	if (ret) {
 		dev_err(video->stfcamss->dev, "stream on failed\n");
 		goto err_pm_put;
@@ -311,7 +311,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 
 	video->ops->stop_streaming(video);
 
-	v4l2_subdev_call(video->source_subdev, video, s_stream, false);
+	v4l2_subdev_disable_streams(video->source_subdev, 1, BIT(0));
 
 	pm_runtime_put(video->stfcamss->dev);
 
-- 
2.34.1


