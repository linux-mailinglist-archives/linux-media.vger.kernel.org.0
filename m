Return-Path: <linux-media+bounces-32010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB69AAF2EF
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 07:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF121BA6E6E
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 05:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57272147FB;
	Thu,  8 May 2025 05:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fBbz6Ztk"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2049.outbound.protection.outlook.com [40.107.103.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDC28472;
	Thu,  8 May 2025 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682436; cv=fail; b=FmwG6PqgSKQH0YlUPj1SzfykTNmy2BGx2yd+0NizbqfEqtDI1OSqHAqNjQhSeK07BIYTvbv890PLvoMxmRF4+TVgMhTh0VplFmFM8Xn1zUvuJG2scSDmmA4QdoRNVx76a78wTmyCBjV7fbcAw3JHTVr0i19TVqXXiL0v0oHurrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682436; c=relaxed/simple;
	bh=1V+fHtfuwy4/3Ylff7x4amBmZL2jZJDAFpQz3ZwIxcY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aW8VGwsvLr2UboMRkTDj1dv2Uz62ZFgO3Om3qNzG8Q9e4cGfhgX11FeTgXm28U/dWS1rBZAquoeXdmfeqqn/jgY45+gJX/K43LfUtl/TDvxWPNtBf1QNWFBU//2DHeZn8abPIBwBtSDjXoxZyXUocqI4Rz/hzvQgwpatLujnIDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fBbz6Ztk; arc=fail smtp.client-ip=40.107.103.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5BD4h1euBup1z9cYCAZC7J11eb8Njy5ZDTX/pyDvVgV0kG7mi/13IXu4i5Z8qpj73w8et/rBtFOFTS54rHu17TaaoRFN8VKSDe4g3AgxUlUgLCO4XsAFohPAV0ywPrzTKfgs4+4mOjTa+LIO5d57EPgY+2WO2Gd9UvO7oSHWClqzmIyec2N5JA6rIadrL2+s3FT7nBp7FyyfRwVM3RY6rGBG+IlJsqYL0gmrPgQAZkLLAlXwSW3jzbqfYiwRYFb2M5O4/UW29SEjjrimLC4RpOEYXF8lYSKLRnzgSkmHZSKBx+E1Byg/EcoOYd7iK0PAvIvca3mAbfpEgvPBGutBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOxq8U67CQoAerniwGsYLBkaik/Z3jEGWm+OBmYA3Mw=;
 b=A4ilq1YNRdCGiGjzUZPRx09irBr4glx29NvuwokMtm/fJYzwRwogMygZ9Ce+ngq2bBd8Upe+G+EIBmTroALg3755Om7mkhCEmFUGqHq7R6ImJQAGeVtZ3ISHdNCTZlpwRHRW3hHqcUfJYNZeLXzwLTN66thCAN1SWXyOSPtmuUGptSAPlqXl1Z9u0nvaGzQWtaoE1WzhPQqGbF1QUB+pSNyRorF+Jl7fNkSdAIi4F83imB1mC5prqh50mudOJjfDjHxEwyU6ERWPnLZwv2NbmTHtaDdgA/Ofhbn8qlMABlU5ThV83nbQKWEyCvu3leruA4xO0Z7elqu0gcj3IsroYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOxq8U67CQoAerniwGsYLBkaik/Z3jEGWm+OBmYA3Mw=;
 b=fBbz6ZtkzrgGsRBQPIkdEFdGokz0rdfD2mt0qZ7XF5PvXZkCH2pQM58A/GrzQhF0OKZEfVfz484z6MpuGMbnuvMYQj01i/thmJ5JhzKfqyEoxpzxIL46wUuf3A8uzfJVfzMxxKmjYo/2OH662m2NWT2Pg/ihoFA6BPVB5+keHUAqpKBE5Pilj3CbaqcsLno/SQaHFl1WsdQSAXfYh2Vvko793XyedJFaGcs6WaJM83Nzt9Unl519qHrKDc+0rky4Fj0eR6chCsVUfKQu8Vtr40wtuDitlNZJMLH872k+BaO6I8mY9Njql9V9VpY2U7DEPvlQF0OIo+Dvtkyo/WdBMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8421.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 05:33:49 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8699.019; Thu, 8 May 2025
 05:33:49 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] media: amphion: Add H264 and HEVC profile and level control
Date: Thu,  8 May 2025 13:33:03 +0800
Message-ID: <20250508053304.2057-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad7fb73-c872-4402-ba45-08dd8df1e8e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Op/Wk8oj26vLdqBE1e0Pq6achmbiTtzoR5qabaLbPeObhO98eQ7ZHPcmUMxC?=
 =?us-ascii?Q?NSJ1rUsZIfaVXho2fxsrhFOhhgC2LFcVcB8QIqpsXP1pQ7HM0Xuh5BpWlvja?=
 =?us-ascii?Q?u46qx7btXkGMLCTSjpwb340KfiaeE4hkvQKAzFIFwLOLH8BAaZSX9F2dOl1d?=
 =?us-ascii?Q?Pw36zuMoJL0OdSQWerVKZIg4Yi1YFjiRFNZRVCCnNpS5Is7iX5YqlnB8HDD2?=
 =?us-ascii?Q?IGXe1giz8TmwjPR0apc+fnTW+ItoDfNI/Sa+vJwQOqWsMCq+YZVKxNuMO8Ft?=
 =?us-ascii?Q?L8BIrmInQpjjZ92GvkUmm6CjewffKnmt0NQmpUc7rlXe1pa8x5qpwja6K3M6?=
 =?us-ascii?Q?QUZGIXtWnNWcne5sLi0f83B8BIDB+Rbd/Cyvn1Ba6w/vIehn6NEuL4PSm1kz?=
 =?us-ascii?Q?AG7nTzX/7lr/Iq3/MXo/OKQ9Wmp7U2xNAa5+dijl8mPTyIWtSlGCapnFBlrK?=
 =?us-ascii?Q?D8SV3kCc61BL0J0lkS2Ey1OrmfOwqlFoI5Za+WB6vT/fXtsyXC6epng8PI1b?=
 =?us-ascii?Q?ia33VOXiPBGXNhW4mNk8vUof/B/7uyb1ZYX/HHNrmpJIsY8C3ai8dJIJ5vUN?=
 =?us-ascii?Q?qoPXtkLCQ64uT2M5KkmZ3FSS2RlBj1nP9Ve0dfz8kFIBuYqYyykg5POST1hi?=
 =?us-ascii?Q?N4AYWx0PXsfpoiWCOHdPB3wZQvA0INC4Zjanf18r7L4ifSd+TwuiViiXR1+I?=
 =?us-ascii?Q?/bV8W9fkYv29YW09TJyOPsHmn80MjDtC9PP7jUVM1M6UHTYUUSIYDZ1KvVYr?=
 =?us-ascii?Q?sVKVgYHAJh7mio41ONLA1HLmyumoW8Js/3WiMwfNmToTRtFlfryH5mCAyWRM?=
 =?us-ascii?Q?ZW24EcePgTH+Xx4cmr96ujkCyyhL8Snb3AOgn97dwvj0gbmapBmv1+O8I5e9?=
 =?us-ascii?Q?VgoZsD+iTUsQKU32El35hncnuaD6qVwijIzEjPAWxnRiOu+Ot78D4IRA8Mv8?=
 =?us-ascii?Q?enGVhYPJehM0OuCu6YJ1sWODMkJHdTi/IUf1wry562WWQaeno6TpFcECZXif?=
 =?us-ascii?Q?jZ0ek4uTyl29wLy6VuhYOPaxi+PyRQWoBYYNMsPMcNkdiW01Fy4hVAilKRvg?=
 =?us-ascii?Q?KoTAEAwcJPGEZYLTj78UllJ/0QY+I5EEbQ8coAcP7AKbrO2QsrBq7NbM5GnF?=
 =?us-ascii?Q?EnOmYR/QZHmnbqKpkDXFkEQG+Em5T574OWktcZgcEgtsvFzOGR0F1GiPzC4a?=
 =?us-ascii?Q?xecbB9B8uT5HDtTqjkk7WYHPoCYU8uNqmrPZiQBZs7PTc/+zu4rkoyemHJK/?=
 =?us-ascii?Q?7slFvIm/M8/8omrA+fDOPQ8pgMKD0iJ98mAzobGp2l+FkbDHArY9IZLgS+RF?=
 =?us-ascii?Q?RlqI07PXReIwDaqH5YUjPm8cfludKHR++A4P/dlUoiV7LDdMbF/hMRN+6ZUV?=
 =?us-ascii?Q?/sVYfKqISC87mgq3yuq9vmXDd6Qt/iVoQOvS5KcfducPVD+fklZx5hdQYhgV?=
 =?us-ascii?Q?sf09y3Rk5XBcmfmO5SqHOrCyQHAtmXcRxGnxMcLQZ7FKAOf1XkNo+EO8RxXT?=
 =?us-ascii?Q?YQzUNE8ci46Qcas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u62kBlatEbb9qfCYT90f5dAumvv8zMG33MUQpQ1joNe6IQgoIuuvIymdb9lz?=
 =?us-ascii?Q?wHbL8JlkPgIgQfavPbTjsTr/n3cese+V+p0dY5+TYmE8hBEGgWtBuxmrzl/6?=
 =?us-ascii?Q?TxHlIiwXNcYeIhdO7wyM7z3zoGKJ6q5Htea96OuXRQffkIYvRg3WzVKKXMtC?=
 =?us-ascii?Q?YYK5OCFL/98Zo7lTlbCNeYnMAzvS7rypZ3l0i/NjsiU81BSLkQKDhWdbB4DV?=
 =?us-ascii?Q?gmB9axnhCZ8A6kYzkjIaVg5kFF/RXmQKSJDY7v2bB3E1jKtPH5TEsNM7MW1C?=
 =?us-ascii?Q?d/+4+iZ+A5c1gck1aDTNdfFDWBFRJywGym5ejSG/YfxwFKwlRF5ArwyOp+d1?=
 =?us-ascii?Q?fN6KtKitWUMWdSMUMSa3vw+ezCkSTzO24ASolLf+AUf0U5CxZcG4YOeJ9g9r?=
 =?us-ascii?Q?QyoHQF7yDqPIYLeQuw3HCp4sH/eJC07SxOWOPu5sVCMXa1wqsFMHQmVe6d4+?=
 =?us-ascii?Q?IV0rT6KOlEvVc2R5AsACs19jeNdSFJ7TGWbb1Y2F4iVxBtCDcRur3rk0T1qE?=
 =?us-ascii?Q?uL+bEe/EY/2dMMJg8Tt6GZIcjAYLjm/UUnf9fk8z2Qqi6WbIfkYuRDZ2DLca?=
 =?us-ascii?Q?+YLWUqfpGSsZZEpfZoK83TgS/1xp5DccaSGB1ec4wW2J82M3XiIxVsW4SDX7?=
 =?us-ascii?Q?zi4Xr2IzVOduvlDpDj98ARs72XLtCRMVtfL1/H6A0BmYmyivCkPfTshpjU6x?=
 =?us-ascii?Q?wYJjPkAf2BuGQVC9zvrA8r+HqdINtGwd3rNU+yyxO9+V3eVY9B2tgOWzhJiE?=
 =?us-ascii?Q?8K1qeD/0YDc+qark4zWYJT0cqDTU99UcDMx9U4cHFXJ/FNmHmedIBUGgVLw0?=
 =?us-ascii?Q?IYh60scOIkswaC5FO79CTAWSdnU81cbk2QNEqCyQ8DRNqnNqVkZvxmcDwC8T?=
 =?us-ascii?Q?aHWHXbzLsnO5V04eXSzFli2qgnSQTPusoG0cEu+cMPKeSbonREHUeqmCShE/?=
 =?us-ascii?Q?U3qm7fo74pnBm3Ys1rJwl2nQZLiaFe8JRowcVP4Wn2y+6Tp7PMvYVVuVjOHr?=
 =?us-ascii?Q?opQ9oiuBO6bYpghHPr4TJV5x+Yuzb+IkTs0CE0Sen43MNw9kO/uIpLCAuTuB?=
 =?us-ascii?Q?Xmq2XZv4Ouh1EWTKpHD15hKssCoabMNf6Z6LKgtwngM0QJHkZcVcYM6kgc4M?=
 =?us-ascii?Q?vJlQyD8sQbc3wwfTe3RM0GWzL6SlEjsXa2uO8Kxj+k+Xj1I4b7b6vN1ei/+L?=
 =?us-ascii?Q?4oHtklyZobOgzimKflYJMHVPUcfoq6Q+iGOcuxt7KJHOJRwJbLaiHIcQkGdk?=
 =?us-ascii?Q?PIMSQZHIxanrdmxGGgdrVo+tiq08YX+tKbOFBUt28pFXHWBb+cly3Qkg0TOT?=
 =?us-ascii?Q?STF12z5Kea4yJJFdFoIJNS7cTXJdMUHvEPzvQsOdGKnNJICiDJ6ObVLRsR7v?=
 =?us-ascii?Q?gxHhZCsUBl9rqIx43psYmfHhonrx9/4pVk/K6lQEK4UR3ikMpp2FK9f96zu7?=
 =?us-ascii?Q?/5i71XkvIMeeF9KhUAXK6Xk+NQY3uOFNPw2uqSW8wbUDX6L1Nc15GDd1ycB4?=
 =?us-ascii?Q?X0PRKb8vPvo/S7JrsPD8HjuRVh54urb+NiADcEcn+Z01tUghjuF0qxjYrB1/?=
 =?us-ascii?Q?ZNafDHDGyhG/MIIWEVRJJqRroBql1e7URDKuyIp7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad7fb73-c872-4402-ba45-08dd8df1e8e6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 05:33:49.4967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL8/lSti2DqhFup3bFgBR+1rWn5clqhVv+oRtE1/D/AWu7eo1Q5nLDBMO+hxxOTV22onOUxhl89F9egjjU/lFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8421

From: Ming Qian <ming.qian@oss.nxp.com>

For format H264 and HEVC, the firmware can report the parsed profile idc
and level idc to driver, these information may be useful.
Implement the H264 and HEVC profile and level control to report them.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Check H264 Constrained Baseline Profile
- Check H264 Level 1b
- Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH
- Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH

v2
- Add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
---
 drivers/media/platform/amphion/vdec.c        |  59 +++++++++
 drivers/media/platform/amphion/vpu_defs.h    |  12 ++
 drivers/media/platform/amphion/vpu_helpers.c | 123 +++++++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h |   5 +
 drivers/media/platform/amphion/vpu_malone.c  |   5 +-
 5 files changed, 203 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index 85d518823159..55067d9405c2 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -232,6 +232,35 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
 			  0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+			       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+			       ~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
+
 	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
 				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
 	if (ctrl)
@@ -1166,6 +1195,35 @@ static void vdec_clear_slots(struct vpu_inst *inst)
 	}
 }
 
+static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler, id);
+
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, val);
+}
+
+static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
+{
+	switch (inst->out_format.pixfmt) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_H264_MVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				      vpu_get_h264_v4l2_profile(hdr));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				      vpu_get_h264_v4l2_level(hdr));
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+				      vpu_get_hevc_v4l2_profile(hdr));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+				      vpu_get_hevc_v4l2_level(hdr));
+		break;
+	default:
+		return;
+	}
+}
+
 static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1189,6 +1247,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
 	vdec_init_crop(inst);
 	vdec_init_mbi(inst);
 	vdec_init_dcp(inst);
+	vdec_update_v4l2_profile_level(inst, hdr);
 	if (!vdec->seq_hdr_found) {
 		vdec->seq_tag = vdec->codec_info.tag;
 		if (vdec->is_source_changed) {
diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
index 428d988cf2f7..f56245ae2205 100644
--- a/drivers/media/platform/amphion/vpu_defs.h
+++ b/drivers/media/platform/amphion/vpu_defs.h
@@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
 	u32 decoded_height;
 	struct v4l2_fract frame_rate;
 	u32 dsp_asp_ratio;
+	u32 profile_idc;
 	u32 level_idc;
 	u32 bit_depth_luma;
 	u32 bit_depth_chroma;
@@ -147,6 +148,17 @@ struct vpu_dec_codec_info {
 	u32 mbi_size;
 	u32 dcp_size;
 	u32 stride;
+	union {
+		struct {
+			u32 constraint_set5_flag : 1;
+			u32 constraint_set4_flag : 1;
+			u32 constraint_set3_flag : 1;
+			u32 constraint_set2_flag : 1;
+			u32 constraint_set1_flag : 1;
+			u32 constraint_set0_flag : 1;
+		};
+		u32 constraint_set_flags;
+	};
 };
 
 struct vpu_dec_pic_info {
diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
index d12310af9ebc..886d5632388e 100644
--- a/drivers/media/platform/amphion/vpu_helpers.c
+++ b/drivers/media/platform/amphion/vpu_helpers.c
@@ -509,3 +509,126 @@ const char *vpu_codec_state_name(enum vpu_codec_state state)
 	}
 	return "<unknown>";
 }
+
+struct codec_id_mapping {
+	u32 id;
+	u32 v4l2_id;
+};
+
+static struct codec_id_mapping h264_profiles[] = {
+	{66,  V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
+	{77,  V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
+	{88,  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
+	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH}
+};
+
+static struct codec_id_mapping h264_levels[] = {
+	{10,  V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
+	{9,   V4L2_MPEG_VIDEO_H264_LEVEL_1B},
+	{11,  V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
+	{12,  V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
+	{13,  V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
+	{20,  V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
+	{21,  V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
+	{22,  V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
+	{30,  V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
+	{31,  V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
+	{32,  V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
+	{40,  V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
+	{41,  V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
+	{42,  V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
+	{50,  V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
+	{51,  V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
+	{52,  V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
+	{60,  V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
+	{61,  V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
+	{62,  V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
+};
+
+static struct codec_id_mapping hevc_profiles[] = {
+	{1,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
+	{2,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
+};
+
+static struct codec_id_mapping hevc_levels[] = {
+	{30,  V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
+	{60,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
+	{63,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
+	{90,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
+	{93,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
+	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
+	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
+	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
+	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
+	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
+	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
+	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
+	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
+};
+
+static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 array_sz)
+{
+	u32 i;
+
+	if (!array || !array_sz)
+		return 0;
+
+	for (i = 0; i < array_sz; i++) {
+		if (id == array[i].id)
+			return array[i].v4l2_id;
+	}
+
+	return 0;
+}
+
+u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	/*
+	 * In H.264 Document section A.2.1.1 Constrained Baseline profile
+	 * Conformance of a bitstream to the Constrained Baseline profile is indicated by
+	 * profile_idc being equal to 66 with constraint_set1_flag being equal to 1.
+	 */
+	if (hdr->profile_idc == 66 && hdr->constraint_set1_flag)
+		return V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE;
+
+	return vpu_find_v4l2_id(hdr->profile_idc, h264_profiles, ARRAY_SIZE(h264_profiles));
+}
+
+u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	/*
+	 * In H.264 Document section 7.4.2.1.1 Sequence parameter set data semantics
+	 * If profile_idc is equal to 66, 77, or 88 and level_idc is equal to 11,
+	 * constraint_set3_flag equal to 1 indicates that the coded video sequence
+	 * obeys all constraints specified in Annex A for level 1b
+	 * and constraint_set3_flag equal to 0 indicates that the coded video sequence
+	 * obeys all constraints specified in Annex A for level 1.1.
+	 */
+	if (hdr->level_idc == 11 && hdr->constraint_set3_flag &&
+	    (hdr->profile_idc == 66 || hdr->profile_idc == 77 || hdr->profile_idc == 88))
+		return V4L2_MPEG_VIDEO_H264_LEVEL_1B;
+
+	return vpu_find_v4l2_id(hdr->level_idc, h264_levels, ARRAY_SIZE(h264_levels));
+}
+
+u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	return vpu_find_v4l2_id(hdr->profile_idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
+}
+
+u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr)
+{
+	if (!hdr)
+		return 0;
+
+	return vpu_find_v4l2_id(hdr->level_idc, hevc_levels, ARRAY_SIZE(hevc_levels));
+}
diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
index 0eaddb07190d..dae0770e2285 100644
--- a/drivers/media/platform/amphion/vpu_helpers.h
+++ b/drivers/media/platform/amphion/vpu_helpers.h
@@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfu
 
 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
+
+u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
+u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
+u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
+u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
 #endif
diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index feca7d4220ed..ba688566dffd 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -908,7 +908,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
 	info->frame_rate.numerator = 1000;
 	info->frame_rate.denominator = pkt->data[8];
 	info->dsp_asp_ratio = pkt->data[9];
-	info->level_idc = pkt->data[10];
+	info->profile_idc = (pkt->data[10] >> 8) & 0xff;
+	info->level_idc = pkt->data[10] & 0xff;
 	info->bit_depth_luma = pkt->data[13];
 	info->bit_depth_chroma = pkt->data[14];
 	info->chroma_fmt = pkt->data[15];
@@ -925,6 +926,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
 		info->pixfmt = V4L2_PIX_FMT_NV12M_10BE_8L128;
 	else
 		info->pixfmt = V4L2_PIX_FMT_NV12M_8L128;
+	if (pkt->hdr.num > 28)
+		info->constraint_set_flags = pkt->data[28];
 	if (info->frame_rate.numerator && info->frame_rate.denominator) {
 		unsigned long n, d;
 

base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
-- 
2.43.0-rc1


