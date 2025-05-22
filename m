Return-Path: <linux-media+bounces-33154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E48AC0E57
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4260189A189
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC7828D8D0;
	Thu, 22 May 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lH4WXOkK"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B0528BAA3;
	Thu, 22 May 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924576; cv=fail; b=DGLn7qi1w47YYf1o7RBbUqhIi7ZWcnEX9/6o2IUq5yq9vBR3Y/hhZhAy6RDB6lrVaoTTaSam2S0DWKKukYjrsqT1UVKDDfueIdBOuHqGnySf8Gr7nN/9iIMBoqWcPpkmhdrcmnSBx5c/5DazuD3qQpGQzt7qKT/1EwuQG9LHcBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924576; c=relaxed/simple;
	bh=TV156EtxR6hzu3CGex0/aWTtznD3wHRyinXVeLsQk4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mBsIs8LiMdaffTHgCwKjoxiHbN4E3UTEMheCgJ9D0qcOnWoM41kgWH3DMl+0/KEeZWbcHXkpGRrndnXxxyaiXbT1u+FwxipALJYNEqlGptknWTuVEiywlJbPktW0IlWPYToxosWZT+shpJx6wq8BLG9MIuxoewvIRPTBQMYGQhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lH4WXOkK; arc=fail smtp.client-ip=40.107.21.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byO5HevfQfGWlHskZNMY3jM7fjQBhd5c29H96hmUxNMwvvso2EDYrI89YEtxHJekPWCjRHoEnq/yJTiaTW7o3dzbNLtrMu8mn+BPD38OFXLG4V6yvNxvt45EvPpJBKgjVERa5/HXV+Liyw5amLC9+c9qb4CDjXQiX5xC+QBj4XitqtB311GFP0y5Gw/BtsbedJIzBQFvZ8WPdEFyMAn4mXp88XQm+UrT/VNaI386sauXgcMANhNFtni2VL6p+WMdhKEBAepwNm1JYfmBmWXwcIlBYQMvOdAkNpJyHvDXnB9GGaJBmBSKMHWbmWGQ/PBkjMf0+0Q/LZE8LWq3M7EyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=;
 b=kd8mI6WhL+Y1bc06bZsvrGne8qd94eSCtrXa0L09gDJNzC3O1N78SicUYPYX9ZkOh6jGnMqSkfrLT33Op5yAhW0qZPP9H7On3MO0DwTPhWtQHpdxZR8CXYTHZVajOaDPGsR0pMZPBys8Vg4vEDfoFJAs99xLLDFLur0wxi5Ay+G0GmaHfyeqCBgPHUBhJ6MEyojVHzmx+qvhOi4OutjcFHoxluZxP0014GOGP4e3Fw0bjdRONdi+c6Jb9F9qLfRZau5cS+ZtldfS3p6FtChBBG13Jiouakxf0QcIKoIMk3eUQGwQ6G34hdS6PIj4fDJhOgtske7AbXGm+ndkxImtNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=;
 b=lH4WXOkKRkeAnRSrZA0EanCVST9NQKfQbUD+4wcCNnG+IwAP98I2QvvQVAh9c0YLnsj/q4gDfegFcreVnoAQd51rZHp0YiWiddtmn/R6sOgQnQ5JwdavdQGCBQDnyvsyuzAyTmJK8H0a3UhuIkIiLSbLWmk79jnPRUIA064A1/ujcrcCAfeusFLayWn/c5xwlh9ePvWJhcMa4o7D0TnH4euKeGLTX8IU/cXCyt8LzYNS1vWhIubfBPxWW2lvo9NN7Hlkxd3uuXC/kVgV13I3IVOl1wkRBka3srnLoYVsTeTPfHTeUZfkgjFZoeEruPazDp+9rCkbdATz7e9sIgqb1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:36:05 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:36:05 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v6 4/7] media: mt9m114: Apply horizontal / vertical flip while streaming
Date: Thu, 22 May 2025 16:35:08 +0200
Message-Id: <20250522143512.112043-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::6) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 543faa17-f7ba-4700-df12-08dd993dfbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?45OWknirFbVXCQweo5vs24eBzUCmrD+gZQWUA65WZeOwoQUrSNpPRncO0ZLU?=
 =?us-ascii?Q?LCqWLHrFsgcmesDXRj3s6Ao8HmlVnRZeL6bUAPah9Feuf+RLXs1t/Xyv2XxS?=
 =?us-ascii?Q?BZ8KuddzQMgiSr37i6y4xi9YcE1RLjD8IQHmtFN9GAuukZ6jeMhzQCQbbVSZ?=
 =?us-ascii?Q?Q7KFJXGpG5+Ly0fPdt9Cxd1BkHD9+n7jyyVulB3zAPoOW6KfVfFfbaFD5Tju?=
 =?us-ascii?Q?/ncobKKfIIm8OgnT3keDh35RF2KSagsPwfXRZsnDkF971Y7C+aatW0+AwJcA?=
 =?us-ascii?Q?+bzgQ52M7OrXbqtB2f+7MPdqeyQs52WB2WclCQF/COWHv0fLiBU8TH6lRzLW?=
 =?us-ascii?Q?AK6UClrRFIhk39YH1FqIy0pwTH9sw6S35DWhR8/vajB6RFiF7SWf8caC9pV2?=
 =?us-ascii?Q?QdD1ZO/hnMobTX50aG2EwC8lJXEzFKnJPUDrm6qLnE8ocIMqU//TKuIkYVbI?=
 =?us-ascii?Q?mIedgJj2v1jqKnzuIroAIoQ+DZqmq2CtfzHXGziuge9/u5c1BRGuqLuAgMGy?=
 =?us-ascii?Q?B/dMb+BGwFkdzQyle5vn2Y0YzJF4mnvJybwQBeRxraTVcSKSyqs0qWnBokMr?=
 =?us-ascii?Q?eQ1Ufl6eIhBrn3+7RI3VfckPQwoOXMcUeQPBlJaq21I07ACY/zHFfS63akGo?=
 =?us-ascii?Q?xLvAVYrKYeqwKxmWPdxQWG7J4C/ST1CrdxW/7AlN2SobpKWox9DIe+G1ozEz?=
 =?us-ascii?Q?SCvdtZOx7FC3PQtGY7bbB3k8HG8Se6G7czri0bi7Q7Awk0xucgpuSvqOM7Iz?=
 =?us-ascii?Q?kQVAId2cx/s3nVOH4x5qDURFnDLNt0V/qvtNNdz8yQs6Dlc1UPr52fiUIUtc?=
 =?us-ascii?Q?D+v0oBBxBiwt0sqdhDR1v/lhRU0dwJe9lDg1KIUVI1F3bb7XCl6agWAOqNoQ?=
 =?us-ascii?Q?tM5e+TB/b3ZmXdzg4NhH7IRjSEz4yYkZ4KJahyfGmgrMEPTedST8V2r3/+1K?=
 =?us-ascii?Q?9BCly3N96XiNWDK5GIK+5srDUu+NIjnUJHaQD+qyZiHw7VyYmg6fRQzoBK1x?=
 =?us-ascii?Q?wIlPbDaJ1oBXezCe46wuWKkTvqznkiSBF/mAGdGiWJidSGntODCuEfbB48xF?=
 =?us-ascii?Q?q7rR3Yn0JLXzo3V9wWOKQvQlU2QqjRJ4y3QCirL/5GgwVKvT3ZGXVVLbNR80?=
 =?us-ascii?Q?1hz0Gr7koD2LILTlBMWGEiWYDSaG/K6Euleb1r9P7cBwxkHJ0sGzxaPjjmTC?=
 =?us-ascii?Q?t29KbzfrgUopkhlSXJC7m/dPj2jiGg35VQj5gL2xMbdaru9fcW/IP/N+HSmS?=
 =?us-ascii?Q?BZsHelVWK7tTGCDlYnNP1YRBk79q5c+XoKKKfsvMdY/NRZ2rX45and9U26l9?=
 =?us-ascii?Q?qejfWHPsTQZ9SOQKFbzNIRqeCZ7j95haEhn/3I7zBUjPFSKo4WAFet4Oaimq?=
 =?us-ascii?Q?SfCSKWi6mPEyNnf+bFQMCg9mA1otNcXux1BUUbeN6CPAc4vkYu5rBBs3QFQe?=
 =?us-ascii?Q?5XENhXX7BV0fn8JFOL0At/Bi9VuXDPENFM0Q/TuII2oD+8pXwKmfiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LZETnTViR49oNawpsG5Ttm+z8MeWHFljvWSzkPk1TjKgOnJlLgHt1ElZ3iKL?=
 =?us-ascii?Q?ydTl7ZFsSVIgdp7wmh1zwWqCiDRHrPtatTFlN//IQeFrniVn92EGxxEQxtpU?=
 =?us-ascii?Q?2UErAxJM30wkIl0PA9e+k0jX4HcgFpP/POC3P61AA0QDXTfldrYzw6/SM3fT?=
 =?us-ascii?Q?4fSXaoH/DaAtr/vhsUpXFNgv0r7pthC6Z3o5JxiG8Zk+c9mW3KEHuQzE5UnT?=
 =?us-ascii?Q?90BYEl8qj3cOIXpIrns6aFO5wHJFDMI2oRaTGYBuyL79uIFFbJxQlgGgUbM3?=
 =?us-ascii?Q?JafLaF2aF8PzqvMOgnSNdevVUE4hlXIPuhup9kNPr5xYj1ggAfhkhOJdsohn?=
 =?us-ascii?Q?ffRcDfJ8x89zI+v1L3YAqmPD/kcQOIYhK78x1UD4svDGGR8Ft3JNumdiKGMg?=
 =?us-ascii?Q?u/YrIQEhZDSFsmv5pX1fL9m+blR5XoXcQMF/8fNrCMJrACOWLG/FJtbaN18Z?=
 =?us-ascii?Q?tEpYFAzIvfPsrryEmP9AcIyUnnhdvL2ahWNpmWEmyAieuEK2YhAHChcGU98R?=
 =?us-ascii?Q?JPi2l7gYg99iqrVHnrpS3/xnd9wuqtLEwa6Y9mJO8qa9mwozlSf9ODOSpFFV?=
 =?us-ascii?Q?0eCLaXiAcFEg8kSwKHdGDaid/17VzP07kbmlRa8wqnz0mEJyX7M94uOyxGCH?=
 =?us-ascii?Q?M+1nB3u1/C49SuIBT/E2SmqdRBzhpLxIjrEJHa5EVrPMh4hcjaxTiOoyv94d?=
 =?us-ascii?Q?xKxFsv8w1RkSDCxqi4LsfHdcIVENRIRi5oIGqx4S2gr2vwNJSDRw5eintVui?=
 =?us-ascii?Q?LB23fCa+eakE64I4RfIQ3rf/fNL22Dd+xF8p0JWBuAqv/zCwc1Y2C1bcLbPk?=
 =?us-ascii?Q?LyfFug3kPKyKmZ9yN8zE4RTrVedhWsRUIzaUWScNWGRIh1UxqForPQpbYrIm?=
 =?us-ascii?Q?TIUYS31C+YzhIt0qPGeJ1iaGyG8qy/woAyhdx6zySr8N9Q2Nlzohhh496sfm?=
 =?us-ascii?Q?taKkvFQs8UpTu7ZhBeQnwu8vWyJyT3hPSWFkXyJqXEd8ZxE/oH0eTNv8m8bT?=
 =?us-ascii?Q?LOQXk1h5eZPBQvq+4fuGk4IZWuj0Wu1Fl5QLo8eOUUAfVZWj3Qh/gfrG8C4Q?=
 =?us-ascii?Q?Ck1libBzNKcXupxgmCFJrz1viq7jSTbqROH5xJk1VdyMhvWPXDJgUY2a3ByI?=
 =?us-ascii?Q?4Qavh1WnlVTGVKu674oHjQVpTVFhSxYOymvLhLuJGs+5Grd2cxGtc3jNLONd?=
 =?us-ascii?Q?nCDuNk6fggMtzyQrKswAC24ztUWDbwZlBiLmlqetLj9DHMsG+bszWAFL8f7U?=
 =?us-ascii?Q?AAv60JQyRkaV5fX3UsW5hrfPkWp72TxrfoubnMORWJ1v8pYzkqPE5vyobDw1?=
 =?us-ascii?Q?T5JW5iUo6G5d1oz69HIz1iWdlUqLlbfZ6b3YcXxba3so9PgE4eMwMNecwR1o?=
 =?us-ascii?Q?NDXJtnBKtzsOMJV+Q9NAMeFYGrrF7pcHs2ZhOVTuHhzt+JN0769+z42tyfj0?=
 =?us-ascii?Q?cdVIDnkF/4hwT7e9TenTTFstSFE2yTl6EO17UdFNtoNTq8ewA7ATYL6OLVZ2?=
 =?us-ascii?Q?vygo4mbef+16qV+WZ2N0ytj2c8apDISkYWDSy7Zv1U3bEoeu3X8/rJkwRQB+?=
 =?us-ascii?Q?dsnKERMhcs+C8sIJd2/a/JPyU/PBGK3EemVXeU3C?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543faa17-f7ba-4700-df12-08dd993dfbba
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:36:05.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bV2yf+wCx+ayLMuJsGiq2gkPhcdumD7lJcCk8mZO81wmpR8jWQ+oTYufWXatFxqhBgOwYYWDwjpqqxryE4kncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912

The current implementation does not apply changes to the V4L2 controls
HFLIP & VFLIP of the sensor immediately if the sensor is in streaming
state. The user has to stop and restart the stream for the changes to be
applied.

Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
sensor is in streaming state to apply the change immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 43 +++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 6c80c6926aef..7d39978835fe 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -399,6 +399,11 @@ struct mt9m114 {
 		struct v4l2_ctrl *gain;
 		struct v4l2_ctrl *hblank;
 		struct v4l2_ctrl *vblank;
+		struct {
+			/* horizonal / vertical flip cluster */
+			struct v4l2_ctrl *hflip;
+			struct v4l2_ctrl *vflip;
+		};
 	} pa;
 
 	/* Image Flow Processor */
@@ -1059,6 +1064,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 	u64 mask;
+	u64 val;
 
 	/* V4L2 controls values are applied only when power is up. */
 	if (!pm_runtime_get_if_in_use(&sensor->client->dev))
@@ -1095,17 +1101,25 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HFLIP:
-		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
+		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN |
+		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
+		val = (sensor->pa.hflip->val ?
+		       MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN : 0) &
+		      (sensor->pa.vflip->val ?
+		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN : 0);
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
-				      mask, ctrl->val ? mask : 0, NULL);
-		break;
+				      mask, val, NULL);
+		/*
+		 * A Config-Change needs to be issued for the change to take
+		 * effect. If we're not streaming ignore this, the change will
+		 * be applied when the stream is started.
+		 */
+		if (ret || !sensor->streaming)
+			break;
 
-	case V4L2_CID_VFLIP:
-		mask = MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
-		ret = cci_update_bits(sensor->regmap,
-				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
-				      mask, ctrl->val ? mask : 0, NULL);
+		ret = mt9m114_set_state(sensor,
+					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 		break;
 
 	default:
@@ -1406,12 +1420,13 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 			  sensor->pixrate, sensor->pixrate, 1,
 			  sensor->pixrate);
 
-	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
-			  V4L2_CID_HFLIP,
-			  0, 1, 1, 0);
-	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
-			  V4L2_CID_VFLIP,
-			  0, 1, 1, 0);
+	sensor->pa.hflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
+					     V4L2_CID_HFLIP,
+					     0, 1, 1, 0);
+	sensor->pa.vflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
+					     V4L2_CID_VFLIP,
+					     0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &sensor->pa.hflip);
 
 	if (hdl->error) {
 		ret = hdl->error;
-- 
2.34.1


