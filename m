Return-Path: <linux-media+bounces-42601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAABDB58E3E
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 08:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643032A7C9E
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 06:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DBE2848A8;
	Tue, 16 Sep 2025 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dHyhEcku"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECB189;
	Tue, 16 Sep 2025 06:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758002974; cv=fail; b=fan5NvcPSxgXujeiAO/8Yf6xxaUvSaZHumNtJleor0a66RdIOz5/hrBAawboZpNUaex0Yywns7+nyKuX6ntN6Q3/Q7Ya81vbpfOCdmcbj1R8JAOVXxvJpcLBroPMPe57LKTlLoaXlbGez/vKbkSx0l3RWvMZ2szb402BY6rHSo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758002974; c=relaxed/simple;
	bh=wqjzW6rN832P13S+hm9+48VFngo6eiKSTY8S0KwPuRs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dd7n95tiOjT8jO24sUTmuKF487I68n3DOV59XaqVM6vAlRruU+gC3Gmkzegd2oyfY5ogb0gUZyTA350TF1RPcf2JABnoB2/2ZJTdwtgalhS+5kyXIrqi50YzB56ewFIgSOXfLamrvfjENU3VTtVssnST13Cv3scr2xDGBgm+zSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dHyhEcku; arc=fail smtp.client-ip=40.107.159.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xfd4BcLCI8Gnq3eg+P3XXeKiago2CeF3WMft9ICRDdEe+xQVpbOT3bXLK4g8cdGGhTh1wFi0tElAl1Yym8pH9W9/qpuKOoizuYxsxs37Bn+gfkbzX9YXXAW2verM/CVxgGnAa3a7Q6uCVz7iv/2PQJpo+PTQtAMbm92uc0DsLK4U9r3ZI9o0xqvgN1tuVX5RYKePmmjcjFcn7SU4YTUH4A3UoTG1pHhuUB/xM9+rME3MHmPo3ypU+VVLLRgbgX3EMmOCqW9A/imACQ4ddyA6CUkOUIsYX+fIgsCrJGdFt3vyEC8l8mLvoT/USK4tYSwnR2Ox/Fu8YhmSCILkp/dzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EvtdIb6xCzyfy91z/nzJciuVjqS5Wvh5zHb+NWxyjk=;
 b=u7mJfwSj1zkmR54q1Qb9UmKX/UNXBqf8GvcjAMceWpHvSC9a1RqZ7ugOf3t+eXwvsHYa5FSxQA6ALWcVjWdEGOzctI7NzIKD/LAdTdr1nMecG0Mh7uQK3zNJ2k4TDl245HrEWZSem+/dk9IVJ9R1SAKxBowt4cmJYRP1sQpx6DbsNSZg3EOLQqtsA3f0ZwS4HRLiNL2Vgplqmgp1SPfq+ubVRyiTVtXdkfWJyx/v8rIfuKYsqUIIF60g24zlv5MS8UofEV0UBjfR9tN1NxFiMvs9b7Lj1sXCqAJsmA98e+PYIVTL9qa/o4d0x7XqIy7bKau2Myg2Xrt0+xhxLmsdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EvtdIb6xCzyfy91z/nzJciuVjqS5Wvh5zHb+NWxyjk=;
 b=dHyhEcku7W9yyR67HJYcr+AF1dI9H47toqfL/ULlQiHl+gSukHOiEWPu2Ip95ZzgkDIhAr2Sor+Lu4t+Xc3H4ZHsCdgf7y0qGbPskOMtbyrqHrhh6cPv+s1L3Isd2XFJ7V1F3IB2q+MNe24y2Oo1USrvbtSNyAXU7bQFd+ucNMZ4B+NWAjae+biln5SuQVqhbvAGoBUoyWHTUz22x/VJ5ob6Ekrdz6H3pd/sNqjQUlGdT7w2boHZUkAvEg+/J2n1cyEtutftOgRrR4PsUlGvJyu3NDHNGpx56FAhVmCyj26WhglQ46oykjPMtDcS4v+SF3yj79BaoUtpUN97LdWiCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Tue, 16 Sep
 2025 06:09:26 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 06:09:26 +0000
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
Subject: [PATCH] media: amphion: Remove vpu_vb_is_codecconfig
Date: Tue, 16 Sep 2025 14:08:53 +0800
Message-ID: <20250916060854.1387-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba8cc67-a871-4d29-b57b-08ddf4e795f4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ANGXSKevmdi2ZDtef84oeYxXxk7AjWRof8SQXwWNuu7PlE8oyTqSyumc6QsZ?=
 =?us-ascii?Q?0uR9yigHcoHCL80v9/Yx8zbNInmCzHip+gzmbUhkiNQjVGqjTyelOHXsH6HH?=
 =?us-ascii?Q?zQKj0hd5ROK6GIGxICnsGBA8kl9Z7Usx9Hqg7k3wchhuTkH2JbtmKSGkxAMo?=
 =?us-ascii?Q?I90FWBJXlARG714G/7di/TI8OMPHTOEiiXZTg5DGDO7eESGbNJ7z+lYun5sG?=
 =?us-ascii?Q?xoX1jrLViIYXItQ/Ta75sVnIljk41eIg0iZ9xl4VGfW1ddNY/Gh5LCsHqkWu?=
 =?us-ascii?Q?7SrX7lVPTbwus7IbWKfJHNe1/IvkFIYYowSTBGEOE9JpvdNH37KaGVxPXHmk?=
 =?us-ascii?Q?nYKxORW20u0BgqpwpuOYm3y0QGgKtnN+egxAWOLbFw2yUuJlf+yNJu98Bv7T?=
 =?us-ascii?Q?d40wiKHy4wYDztVMKRtsB7DsAO2M1FMg8DJiP+O2XyF1412JT3Y5IX6tjYAG?=
 =?us-ascii?Q?pXxd0+wP51DDkwqf9rTcyRkATnG42irrg+WiwSDeXVzsOC9O9WZP+IMiyg/F?=
 =?us-ascii?Q?wbEPUD80GlTjAv5N4SshTFmGR162q8BGWh2ld3eb/Dybtua2N1Ao7C/d3rmF?=
 =?us-ascii?Q?nUl9U9ohId72Y1LEkdO9UAirhQAN2KEyZpI4XycrGCr/CM2rYARmjtfCzRmn?=
 =?us-ascii?Q?rYrZdsxvQUtqzY12T/Ba2rQqcPDUrMoUtd5k8DRp+MDoBoLOO8qBFoxYtGtW?=
 =?us-ascii?Q?Y/lP5DYBOsw19lwUOG+kABwdTH1gfYRPYCBdV+Sp7YiCxCFzFJjD8lKRR1do?=
 =?us-ascii?Q?q/mtDlaNwZESzToCfJLPW2M2t0aEllZrCMAm3wIFZWVhWu24e5V672oXbllJ?=
 =?us-ascii?Q?AcFcJ11dTsMFkBUw5l4xRofxaPYOnnrTJNu6q+ytp0X0TQYkS1HVriVeJ95V?=
 =?us-ascii?Q?fuXH8Wp7sMyj+A8rsIP31BpEljAE+N4HFuVj3yOJh9cH8kYW9rhS8tSY9jhf?=
 =?us-ascii?Q?Gz+BcKm1AGQcBlDNwujKBQrLe7S5up2sE/FnvIWcCdPKJUn63D3KP+cje54L?=
 =?us-ascii?Q?RODOlePfXaqwxh4sNr4t4GtF+bCvVjsO83+Aw+n1wvVUR8hA9uDtuf4kiDSo?=
 =?us-ascii?Q?41TOnoZtG8wsCCMIkAlJySc3u5qHjHh2fX3socxYaEHDXOi1PesBA+dyoiPc?=
 =?us-ascii?Q?LDNmqwiQAsMWrskUVWBY6Fdkt5zCP53AVBYStW4SNQ0lnPhNNlPvVpUZXcoL?=
 =?us-ascii?Q?N2byewGm9XokIsImJP4YZtQ8d81UjmLrJ17wgo46PvpXo8UiekiNTjIAYQPU?=
 =?us-ascii?Q?ca94dU/mCd771NMRqbY5/j7o3A2WwYNDrHDVwJHLUK1iyoZEPXDzgZYB58/S?=
 =?us-ascii?Q?6ZhUgVVQUne0uOQPSCHwv4sAWHC8k6Mqt+Pp6eeXD4KIe+7ZekGFU/7uaTa5?=
 =?us-ascii?Q?z09xsGVOD8vezHWEAl4r/118v+NADLq8TlO9c3FIZgxeC08s0IE4Wb+g7inp?=
 =?us-ascii?Q?2OXhZ/SxWg/EmOAkgH2tF060l7B3Dny9IlkXgxq4qnN8XL3uiffJkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jk5/s+rcNFBaJAYCgU/St8nYWG0zYws2ir1qVFFdTWnigVcep2P1pjkRLIA5?=
 =?us-ascii?Q?nCFN1HXglSPcid2Ui+pHYr/GX6JcvGMyqqjn+BAVdZGmgXoaeGWgSURPiNlN?=
 =?us-ascii?Q?WMIE5Ykkm239koGImjRHVzNLMSr+YNVkHwxzxegL1cvnNN3OhyVU1izgi2TF?=
 =?us-ascii?Q?ov4WG/VkHvN23gmhEYnD6yUY/v/BS3LGQuHc1x5UaobRoA8eBiGo8SaaLX1e?=
 =?us-ascii?Q?isf25912QAcLonB70KqPeHyY2GUTtqGT0g7gkzdBw1WTH6jKYMRi17y1Y7vP?=
 =?us-ascii?Q?05bN1U3LaGg7QHVwGfGnpDcXf/c+9NKPo/z3KFXdw3VmT+bXnxKj2rHyGuaG?=
 =?us-ascii?Q?QEzwyHJf1sm7A6qhet3eWrwS2hWPmg5+9REOy0NIrq6jZ1KmKmK+MW+1L6HV?=
 =?us-ascii?Q?8u2DjK1JvJfq9MGGz+6WdDM6QbdTM5oE9u0jZZdZ/W6yy+2UmRZdexEj9KLz?=
 =?us-ascii?Q?CY0nFQSzfG/fsjnanJKxtzFqlfNjo/HhQNFS5E3YuNpuVDfJgt1mINheBF9S?=
 =?us-ascii?Q?Kb1i/cwAzFY/3OTBzYNuo8zBrIElnwvPyo+nV98+REQzJoCZS2uoyb0BQ9C+?=
 =?us-ascii?Q?K+d27GonrgmrSTB5UyzpRpi77tFoQg7R6B4xsJCrq0BVWaMXQoDZceHslZAf?=
 =?us-ascii?Q?1BEz5D1kOkj2vgRm5xkSowiK4XfHlHcBnalrD+Y6yDrLone5YwGbekQ/nRod?=
 =?us-ascii?Q?rRGLBWkcP3YZgabc/6eRjqwoiYnum+W5vFOOFCd1R9oq28HT8fSKj2jkOfDs?=
 =?us-ascii?Q?ACkqVKxMTeJf2JMtZWgZFjfy1/LBcThyydpSfJf9uAa4ROT6mz+oNq+7tB+L?=
 =?us-ascii?Q?TmVtpr69FXo7yA7uTT2W9Rov2pdgeTkK+iF2yWgEy4p86KOIqczP/1mHC4My?=
 =?us-ascii?Q?REJb7RbPdhG1qO6nxa7JSjX9MgqUphHL6u31ZteNdgvuorFngDCxGFS8vHuF?=
 =?us-ascii?Q?yHTFrAVjlCIzZNqrNvifshLJhXY3DrWxnx8ppfLyzexUgchrB96W4bELO5oi?=
 =?us-ascii?Q?rXHRtb1DeqqLRlTPzCHwjAH9DU1sBPFXd6hzrpynEvnZcCFnxU5IXozX6UT2?=
 =?us-ascii?Q?RJ4FzRgMJr+NGY2s5T6UpjwVqQDtKno9c381NeRaAM3IfD3nIEn6gqzAXX7A?=
 =?us-ascii?Q?QxsIoKtz4VBPIkQCaMrrtwdWcaAAjAzqUMhUHWU3cajjHb3G1SfCJn642asr?=
 =?us-ascii?Q?qVcY82QupXejiQOW/PeQ8nBKUvHma4GKQF8+R7LpQDAK+9v9XbX45yVb7vH+?=
 =?us-ascii?Q?WQmSzL2YvLhlrRyLQAc0vGQ+E1goKyzCyWIWp3gJtF/zrfST1RfI81h7vn7e?=
 =?us-ascii?Q?MNp5ObvlZIc3TITbuiP0IW5EYoaVaQXEkNed0LJxtEI4QZSbSwgmoJmN4QBg?=
 =?us-ascii?Q?Mvj7D9waz8fz38wjLZ4u7/hFUqqPCvC8H7CNZ0gMZPBiFa4gMvQ+dwaIvG+g?=
 =?us-ascii?Q?8YQDaVKvlD9i0Z/02eM/oPl3Pwe+x5lA4x40aZTNOO3J1J6pj7xIdivV7VY4?=
 =?us-ascii?Q?udsqmbXAZ0aQfzOLPmUIqx/KSah9CQn2PDY4+lRBXWK7EbZKJuV1iN3qKUQm?=
 =?us-ascii?Q?1c7UvFa7LUO9aE90dkDsVbaXXeYxC8nfga1+GogO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba8cc67-a871-4d29-b57b-08ddf4e795f4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 06:09:26.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21mmZTf2jLhXtgfgTpDOByXoG9h9TzWuKjSzHpHmB257ThvBgKGnLYdYjmDccqrBmN+Q5MhijVUV6OzvhKTwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

From: Ming Qian <ming.qian@oss.nxp.com>

Currently the function vpu_vb_is_codecconfig() always returns 0.
Delete it and its related code.

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 23 +++------------------
 drivers/media/platform/amphion/vpu_v4l2.c   | 10 ---------
 drivers/media/platform/amphion/vpu_v4l2.h   | 10 ---------
 3 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index ba688566dffd..80802975c4f1 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -1337,22 +1337,18 @@ static int vpu_malone_insert_scode_vc1_g_seq(struct malone_scode_t *scode)
 {
 	if (!scode->inst->total_input_count)
 		return 0;
-	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))
-		scode->need_data = 0;
 	return 0;
 }
 
 static int vpu_malone_insert_scode_vc1_g_pic(struct malone_scode_t *scode)
 {
-	struct vb2_v4l2_buffer *vbuf;
 	u8 nal_hdr[MALONE_VC1_NAL_HEADER_LEN];
 	u32 *data = NULL;
 	int ret;
 
-	vbuf = to_vb2_v4l2_buffer(scode->vb);
 	data = vb2_plane_vaddr(scode->vb, 0);
 
-	if (scode->inst->total_input_count == 0 || vpu_vb_is_codecconfig(vbuf))
+	if (scode->inst->total_input_count == 0)
 		return 0;
 	if (MALONE_VC1_CONTAIN_NAL(*data))
 		return 0;
@@ -1373,8 +1369,6 @@ static int vpu_malone_insert_scode_vc1_l_seq(struct malone_scode_t *scode)
 	int size = 0;
 	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
 
-	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))
-		scode->need_data = 0;
 	if (scode->inst->total_input_count)
 		return 0;
 	scode->need_data = 0;
@@ -1560,7 +1554,7 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 	scode.vb = vb;
 	scode.wptr = wptr;
 	scode.need_data = 1;
-	if (vbuf->sequence == 0 || vpu_vb_is_codecconfig(vbuf))
+	if (vbuf->sequence == 0)
 		ret = vpu_malone_insert_scode(&scode, SCODE_SEQUENCE);
 
 	if (ret < 0)
@@ -1596,7 +1590,7 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
 	 * This module is currently only supported for the H264 and HEVC formats,
 	 * for other formats, vpu_malone_add_scode() will return 0.
 	 */
-	if ((disp_imm || low_latency) && !vpu_vb_is_codecconfig(vbuf)) {
+	if (disp_imm || low_latency) {
 		ret = vpu_malone_add_scode(inst->core->iface,
 					   inst->id,
 					   &inst->stream_buffer,
@@ -1643,7 +1637,6 @@ int vpu_malone_input_frame(struct vpu_shared_addr *shared,
 			   struct vpu_inst *inst, struct vb2_buffer *vb)
 {
 	struct vpu_dec_ctrl *hc = shared->priv;
-	struct vb2_v4l2_buffer *vbuf;
 	struct vpu_malone_str_buffer __iomem *str_buf = hc->str_buf[inst->id];
 	u32 disp_imm = hc->codec_param[inst->id].disp_imm;
 	u32 size;
@@ -1657,16 +1650,6 @@ int vpu_malone_input_frame(struct vpu_shared_addr *shared,
 		return ret;
 	size = ret;
 
-	/*
-	 * if buffer only contain codec data, and the timestamp is invalid,
-	 * don't put the invalid timestamp to resync
-	 * merge the data to next frame
-	 */
-	vbuf = to_vb2_v4l2_buffer(vb);
-	if (vpu_vb_is_codecconfig(vbuf)) {
-		inst->extra_size += size;
-		return 0;
-	}
 	if (inst->extra_size) {
 		size += inst->extra_size;
 		inst->extra_size = 0;
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index fcb2eff813ac..511881a131b7 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -349,16 +349,6 @@ struct vb2_v4l2_buffer *vpu_next_src_buf(struct vpu_inst *inst)
 	if (!src_buf || vpu_get_buffer_state(src_buf) == VPU_BUF_STATE_IDLE)
 		return NULL;
 
-	while (vpu_vb_is_codecconfig(src_buf)) {
-		v4l2_m2m_src_buf_remove(inst->fh.m2m_ctx);
-		vpu_set_buffer_state(src_buf, VPU_BUF_STATE_IDLE);
-		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-
-		src_buf = v4l2_m2m_next_src_buf(inst->fh.m2m_ctx);
-		if (!src_buf || vpu_get_buffer_state(src_buf) == VPU_BUF_STATE_IDLE)
-			return NULL;
-	}
-
 	return src_buf;
 }
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.h b/drivers/media/platform/amphion/vpu_v4l2.h
index 4a87b06ae520..da9945f25e32 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.h
+++ b/drivers/media/platform/amphion/vpu_v4l2.h
@@ -39,14 +39,4 @@ static inline struct vpu_format *vpu_get_format(struct vpu_inst *inst, u32 type)
 	else
 		return &inst->cap_format;
 }
-
-static inline int vpu_vb_is_codecconfig(struct vb2_v4l2_buffer *vbuf)
-{
-#ifdef V4L2_BUF_FLAG_CODECCONFIG
-	return (vbuf->flags & V4L2_BUF_FLAG_CODECCONFIG) ? 1 : 0;
-#else
-	return 0;
-#endif
-}
-
 #endif

base-commit: ecba852dc9f4993f4f894ea1f352564560e19a3e
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1


