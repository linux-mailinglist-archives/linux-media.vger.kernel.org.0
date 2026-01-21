Return-Path: <linux-media+bounces-51259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAcfOlfjcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:31:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE858766
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EB7C7228AF
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5F03B530C;
	Wed, 21 Jan 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MwgFav9b"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE84A139F;
	Wed, 21 Jan 2026 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003756; cv=fail; b=eQ0lwlmgN4xcZc+89f8fFfQc5VjOzy6B6im1qTBolIj+iSRitr4QqPleOKh9wpj7NHaFhyqDkIhPMLy+7FhiLTusoN3r+hqFmgNOWWtoBFl+IOj6ybIZsY3bsR6UgJ9icPLc1C+xfcYMiT+DjfTAqM7Bqm22dP9+StEV8cf70jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003756; c=relaxed/simple;
	bh=ryeu9Zb3VQrKbwrK/RNa/VwiR0Q0X4WQJ90Gr/lJDGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUfh1kBsdoWhswJ1+ON0gNwPqXael1BfcXpwCutab2XKrYQBQpx1wxFkl7wVSMi0IXrsT2gIRoP8YsJllqRL+LNFJBqpC32H+h1vq0laUgwwoRrtVYMZEv3Ik2jR2hPvHsUpW4xVPazdf8dJq91TI3plHTzep9cSgwViGcRVCV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MwgFav9b; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBDCTAI5VQuGcn9Um5uXfE0WKGaiMFr1mDA7VaJYX+n9pkKOm4dZvCHx/RYJBG0DBztHTVxqCx9hwCiYxnoKvOxE8yIAeORja5VjFjmuejDexe8UB/CTRNiGCvB6oml9gxdKLaY3L6N4dIfM0/gwN+iG1A3XBmYvxMm56rbNkOgQuCef2e5a31zFxGNDVPSWwFQ9ui8njOZly9RzBuLFGeko9z9T78s6RwSHgyP1YRipxz42doHm2wGgbuvNZM8ac/aCczKAC/qswXUamKinV7ZXu5lsQbOtRniUGJZmdN3RdQVIMe1vwVPb6RpWwwJY6Q2on5dBHOu7c5n/7piJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgAeiagqUeNXwACET1h2vrSfF7HWyCytFR5kzgQ4fUY=;
 b=dFFYgQxk8xlyGSuM/Vo9QiVZcp3U+lgl2Op2RR00dcnK9QDk01xhaXS8jrilulq9lQcB7H8vPPfGNpiTAl1mFVtjkm+asgWkKxPGa8e+1NDBSd4Omb06IrAEyovdYzrvxwn+qn8+v/dX5X68r8LoUBItE/Vh2877kcKtFMuQEqn2dG13/56vGwzF9mo125St66pX7uVzCehJATLVhGBDrAVccnX+xTwvdHrl+nT0NyvyvWYu/h3fYSkHnrOWBqjkLyLmZif1Ue8/OuEVPfleZ8O1Duzlsmm7xUM7v7IocBmPNdOed6NYtA9kJ3XFJvo7qiCp01oNRdpeRtFQm+teJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgAeiagqUeNXwACET1h2vrSfF7HWyCytFR5kzgQ4fUY=;
 b=MwgFav9bY6oOo9zZNlnBR78mOPbin3GkY+3R4Tl/7+qMDZLEmZpUOboHfu4AjSv2QChCXgR5fgl+6odkiomOGVZlBtVRTjmpTphdThm1jl1mgSLksF1imGUFXFpGw+JT5kXxsJgMig3xN3hYB42bCVB3STBi4Muhz7KP5tieaP8=
Received: from SJ0PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:33f::30)
 by PH7PR10MB6458.namprd10.prod.outlook.com (2603:10b6:510:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:55:51 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::3f) by SJ0PR05CA0055.outlook.office365.com
 (2603:10b6:a03:33f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 21 Jan 2026 13:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:55:51 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:50 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:50 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIH3104105;
	Wed, 21 Jan 2026 07:55:43 -0600
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
Subject: [PATCH v10 11/18] media: cadence: csi2rx: add multistream support
Date: Wed, 21 Jan 2026 19:24:17 +0530
Message-ID: <20260121135424.1185710-12-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|PH7PR10MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 1676de88-7ba1-4fe8-d548-08de58f4c9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GC7ihBmu/noQtWPLrdh5WYgk3brV+1V9VIOPM3jDtYioVodGxTZwdBaNGhvJ?=
 =?us-ascii?Q?f8/GqBv01+Cav3l10zpbt4jS6DQt2k2rRrVxKVLgRvGRCHpJ1NS10q7BFLZk?=
 =?us-ascii?Q?Gh4gQRVwlWrf144atlisuTmGTBqMSlpoEsIr2NZ4ocffnFNGhl6LFxdam2aM?=
 =?us-ascii?Q?gipt8b5Ra+g1Gt7W1AhJwsYIqBAT1Dw3Nh2Y5Dn9Lqk+cM971+GT0A8IxE8L?=
 =?us-ascii?Q?Zuq02ZJedC+ggI+oj4ai6yRWt96QE/Vm6FXdXv0CpRxoIn3JzlYCfHhgGxKg?=
 =?us-ascii?Q?QvovWecWWWKfhK0SL1Dgr+wUCh7rgsgyUECfPBXmiSzsA+cqdbI4TOtIJP68?=
 =?us-ascii?Q?x6DPSJkixCNVZd7MKeYQfrUECEgfsw2MGs9nrzdf6YbOrcZdPjuD8ZDZzG+T?=
 =?us-ascii?Q?uKId9PVgD9vgfvYy0agAd/LGbyyhW29YOS1/SEKdSqxaX0v1oXKzGZXsCzsL?=
 =?us-ascii?Q?O1IzaOVICtWX2m8NLYHxCAz6WRov8folUTlsgMkax8D8C8s+lYhmj90Jm0Eh?=
 =?us-ascii?Q?1nYHwI3tD0dJjPUYPz/VExRgIBaBzhbyk6eCPFSJwTO+ZVMZCf+3Yl4Tk2Xp?=
 =?us-ascii?Q?tgShcNYd5Wg9W3/uy7TCYdgIi0Tvr68B0+3YlFbYuLanWbkQ8Gqdsq3VVoPs?=
 =?us-ascii?Q?xEXCTYsbaUcMQMP7U67v24r6AFv1oVi5sI/llhkRZ0+EwylcD7OQryK9WalU?=
 =?us-ascii?Q?4W4HVfwqiu2qbI5w6VLcvoOaSqrDVYsiNy/CLokFgmzBhQQ6UO0Woo/G9Zt+?=
 =?us-ascii?Q?/j8P/b22CfmlCYNGTEXukjuP4zCX9j3iDg5zmTOoa1J2lldUCvtgpGiIoUW8?=
 =?us-ascii?Q?OniYGScJVJopEm94k1173l9sscqBm2FhYXbA0GlIL0YIEHB0zQFO+prINXp4?=
 =?us-ascii?Q?AKRIBjE7GqPNNqvfCWN/k+Avpfu6HBQ7R8ZnYJrRH1Qblxx+EW8TEDVMInJP?=
 =?us-ascii?Q?A7hyllUwITanJJs/0PJ85/cErk1wPREY8sRU1/mADAE3K1lpZ9J6Cs13OGKR?=
 =?us-ascii?Q?m2h/9LPgev54kaoqEpGviPvq1NsVgq1pXx75gucrXOu9SDzs6wkrcVv8OY9D?=
 =?us-ascii?Q?3A4HJZWtlcMOeXCV+nIouLZvN4RIA8wcdqPyY2hmf5rW3fr9Aj/S1RLIsk7U?=
 =?us-ascii?Q?H7L76E/5dQho+H50C/QGXQBpMqvuT0Hzm4Ag1FoML+KR8jiKwqxAc4t7bMxy?=
 =?us-ascii?Q?VnOWtXbxZ937aLOYtGw0as6RsdAQGFYZ6nlvVnbEujzTL35nnK+vebVUMAdd?=
 =?us-ascii?Q?OgvfcdY/liBxtjiysb3yq8R49EnwRpWjzcaQd/LP2CAO8MVV4hknExyqK41A?=
 =?us-ascii?Q?f8JnMiLNelmTdt5NyRsvO53y0BNTwOVG5LOInyvZ8t2TCSm1WD/GapUZJggw?=
 =?us-ascii?Q?1KP3qZuyI4zBwoqvTUCpMvoa5oSw42eg3uc6HZhMF/iha4CQqBIYlvVCabxw?=
 =?us-ascii?Q?kYfX1XcdLy9Aebj/nACUrepv/3HN/VYOmTQQTKzbes0lZEe6SxdwCir8FRdk?=
 =?us-ascii?Q?IOZtO+I0tkdenD0FHU8x/yLL9xw84/KdfXrPmyXkZZGtnE1Y0L3nCCrpPMAH?=
 =?us-ascii?Q?K3/pzzGKZNCTr7C5oBm9s3oOj2o9ZMdemMzhRBYF2eMT0k0wHGYHUQg7bbP0?=
 =?us-ascii?Q?L+2VukeyMoSONqlZTxg33dapZqXptY3aDi3bUQ6dApCDLVp4lByTv/EaFKxG?=
 =?us-ascii?Q?y+1wMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:51.4091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1676de88-7ba1-4fe8-d548-08de58f4c9e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6458
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51259-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,ideasonboard.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ti.com:email,ti.com:dkim,ti.com:mid];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A8FE858766
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
 drivers/media/platform/cadence/cdns-csi2rx.c | 246 +++++++++++++++----
 1 file changed, 199 insertions(+), 47 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 65c6acb02f85b..175366f889115 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -135,6 +135,7 @@ struct csi2rx_priv {
 	struct phy			*dphy;
 
 	u8				num_pixels[CSI2RX_STREAMS_MAX];
+	u32				vc_select[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -273,30 +274,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 
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
+		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
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
@@ -394,11 +408,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
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
@@ -486,18 +496,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
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
@@ -505,10 +554,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 
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
@@ -523,9 +573,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
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
 
@@ -550,12 +605,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
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
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
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
@@ -567,14 +666,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
@@ -582,21 +683,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
@@ -630,17 +732,66 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	struct v4l2_mbus_frame_desc source_fd = {0};
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
 
-	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
+	if (ret)
+		return ret;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(csi2rx->dev,
+				"Failed to find stream from source frame desc\n");
+			ret = -EPIPE;
+			goto err_missing_stream;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = source_entry->flags;
+		fd->entry[fd->num_entries].length = source_entry->length;
+		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc =
+			source_entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt =
+			source_entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+err_missing_stream:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
-	.enum_mbus_code	= csi2rx_enum_mbus_code,
-	.get_fmt	= v4l2_subdev_get_fmt,
-	.set_fmt	= csi2rx_set_fmt,
-	.enable_streams         = csi2rx_enable_streams,
-	.disable_streams        = csi2rx_disable_streams,
-	.get_frame_desc	= csi2rx_get_frame_desc,
+	.enum_mbus_code		= csi2rx_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi2rx_set_fmt,
+	.get_frame_desc		= csi2rx_get_frame_desc,
+	.set_routing		= csi2rx_set_routing,
+	.enable_streams		= csi2rx_enable_streams,
+	.disable_streams	= csi2rx_disable_streams,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
@@ -876,7 +1027,8 @@ static int csi2rx_probe(struct platform_device *pdev)
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


