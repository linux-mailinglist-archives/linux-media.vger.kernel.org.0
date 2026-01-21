Return-Path: <linux-media+bounces-51255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ+qL63fcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:16:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CD5840D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 281C7A22B58
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85880309EF0;
	Wed, 21 Jan 2026 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BbFaZTyT"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7707D4963B2;
	Wed, 21 Jan 2026 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003733; cv=fail; b=ogo02m2Ovlgea5yl5arLI93FMfkL/uaMqY5O39bDC/fTeVXmnhY+Ezv1YXbD0VwaVCTN/E5lEi5SD/wGfy1PiX5rSqzUZBKzaDTU2/9ERohMPaKK1j7q2Pgwd4wLKKCpVFmHdIYWgn02UB/coUyxFyptynuj2Hwl5J3Y5TOR4EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003733; c=relaxed/simple;
	bh=MIg4lygrCuC3JAv2bm+nGmRPQ2hCQeg8+In26W2VHSs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z0Sh2omt1DSqUbgK2Rx9wcuAHayqIic6tX6UIPvBCJ80EXbIY7x3b1mEAVySNEHBKjqrriPnSHO2BlRizbrS/QWYN/mNoh9BgIuTb2ZzhFlN89oi03sL2niVqs93jlvwzbO3vK26bk9SGrxamV5Zfy9279++VMFIHycnCx+Ceis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BbFaZTyT; arc=fail smtp.client-ip=40.107.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U054iAF8Asn/w18vAAsXgeLD9Ad/yHxgNBvqSgDHIyAECyxv+wpwqmc5HmpiYvXdfRc2NhcIRXxow115kQDnDvd5Mm/eNjn2eA+f1PLR8Lf3VdIY2TnspE8fnbt0PuDWWR4Nk6Z9XU+rtxHXgYZy0OYOB2FQ02XkMiHpVSIDAX8VqJyFsGYYnYtHpulJ1xt0dgBo6p2CXwrHrqpIdUZv9QdyQktvCB7rKWBOrm6hZbXDgSxyqCI3D4G7jrjTyfCGRnKSGwc4muw9Ad+8jiKaHc7R1RAmJJ8Qcu14UzzneIBZT45xxuL6Z5ZQQU2RbuWnH3WcyghMM6mJKCLftvoeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ORcoSYJKdVknbZfoHLTPqUFXkyfBU5YN5QOo9vecPc=;
 b=xMvtd525Ca95uDpJoxZkr2dTTBWiWx0sXm/CvHBdcINXlc4ak67lv84Wcux4nXzvAKwCKR+AZNmiAX8jAMOcuqOWvQMBmeHXIYzV6UVnwqy0PPdzfRTWpLUW4qkfDSMQI5/pK0gNfU7KFZw8TwU4bNMrF2DAJs2us8+GHYIMLb2HgeNKrnN0vIrvwYxNDz3iMP4Snp8k95tICOqhiRrTIWThFVkkS7/5/iyUvsULUFwrBktwW28NuOdPLv7j6z56/GB2peauEwqy4/E1FFi21UG2RRBXRwZ65EJEIAwLCQ30gndvKYSeYt43u/c/F7VdAYvvY3S5H/vX/WjylWFD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ORcoSYJKdVknbZfoHLTPqUFXkyfBU5YN5QOo9vecPc=;
 b=BbFaZTyTUeQyS1G2uRv9o+z9lflVjc4jF21NegZInwdXJc/BtF+pZUkDyteneS9yl77vhnWrqaMg67h9FmBdV9uYJZ4gpu6b3ynrivwT0JdQ7i0fhlNM/QelLfBHx4IrgQI+zQ3K9FpdobL/jkgYbtGUnHFYEHk8jAJ5z8jLQjc=
Received: from SJ0PR05CA0143.namprd05.prod.outlook.com (2603:10b6:a03:33d::28)
 by SJ5PPF0447EC1A8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::784) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:55:27 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a6) by SJ0PR05CA0143.outlook.office365.com
 (2603:10b6:a03:33d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Wed,
 21 Jan 2026 13:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:55:26 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:22 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:22 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPID3104105;
	Wed, 21 Jan 2026 07:55:15 -0600
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
Subject: [PATCH v10 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
Date: Wed, 21 Jan 2026 19:24:13 +0530
Message-ID: <20260121135424.1185710-8-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SJ5PPF0447EC1A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 79507b20-54b6-4847-d5ff-08de58f4bb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E09wlSSMl673kMtdAczR7xRiJHQK3fcJzH4FAu4jz0WB7ZktlyqfOeFtU8B+?=
 =?us-ascii?Q?61hHlaDjHbT79pAWD8tuhmBNffFGGxA/N3ZLuifSvfghYprMGFZJod8R6WVj?=
 =?us-ascii?Q?1rY5+yHIogx/hyUFonq8X0Ycw0xSGPMDU1caUTG6rTv9GEmaFjGPnSSHud+Y?=
 =?us-ascii?Q?pNTH4ZW8MnxrchXcM9KuimPC0Q+2uMYhE3xVkwL5pA2EeklcewHUWPJUWVHv?=
 =?us-ascii?Q?Cv7i59d7jDpmoC4jCXOj0w6ZvEmJIbkd4vU3jJ1QyMLe38ZBtHcafNsC/744?=
 =?us-ascii?Q?Tim9BMfM4oqha75EZHZmKuOPUSvOZZvO3Paz8aEyNAhczpuaqGKhP35N0w7H?=
 =?us-ascii?Q?N8+k1tlhiSIR156CSnvF/Kk1P4hj3WjWy55wBogy2Ri7mjt5s6kmv7R8Uflk?=
 =?us-ascii?Q?2xu0haZM8tSLMVDB9wt/w4lOPc4emfWf+OGyaN0/Hac2X3jeKr1bsvlr3mrp?=
 =?us-ascii?Q?BJ2LyISEaLlaBlEd/GHd5MHVkQ6oueDSy0VuM6zIsNUkZMkyKBffkJJM2BvO?=
 =?us-ascii?Q?EG4x/GbgCA47ti8IOUtiDw7Lbsl5EPnxOtQnInq0BKG2wYleXmTmaYqYaW+9?=
 =?us-ascii?Q?tUfZgeNXvHNi7L6JluVICia3rS3tM/nxH3hCVZxHWJdzU9vFwgRV86WHzEAw?=
 =?us-ascii?Q?zmqxjTUcy46hAmmNDeZKxShpinzJNJGJnGKFZfbyzDn2pQk5ngrc4Ju+f+1A?=
 =?us-ascii?Q?wj5y7MEePpFr450v9tZ8Ht1JtyRV2tHu3ubx5mjum+Qd1hlzpmWQRqzdNfTj?=
 =?us-ascii?Q?puO8c6nNciyJLtSWOlevZ/vURcuJxV1Fa7diqYzQzlSpj4Tqw/joeeNbX2xT?=
 =?us-ascii?Q?hG40vxutd+Wgje18i5mK8V5khA1wPRIYQTcpsHd5fvYfNjeOtefk+ekcUjRw?=
 =?us-ascii?Q?falbYIqmvyf2aB0PsoSbxxgg7yG3tLCIjUmeogs/0o5E+CEAiH5m2GAZCAdp?=
 =?us-ascii?Q?GsGRgyNKtPupt6GUfkGpN48zLmjyoG3CDnRJFvZiKBr/EPnq+D9kRrHsLK8e?=
 =?us-ascii?Q?ER32Mm7/3fT0/BXMgfaaDkGrOSQPdQBFIXypUXqTX/bsDMj/fn+pn01AK5FV?=
 =?us-ascii?Q?WWYFE5ruM1LfCVnqxfyjdz2/VeBzHO84HbOV+1x1zeh/ujLZTnexWCJWmARH?=
 =?us-ascii?Q?28ZXDLB87MWG85I6suHt82HjnkLUCZHvo0aZEjWgHsw/9DKKcw0W2izWHXOp?=
 =?us-ascii?Q?eqxhIIWJD7AeVD8ipNoGpzNBjEij4lnyKAY6CTBY9XTNtW4bnBTc6EKxCkQY?=
 =?us-ascii?Q?VVuG7cIcV58ifTFllQ9enkzqIW2p/pcs6GBNpePD7nBQ3oz5sxEPqxllcfBM?=
 =?us-ascii?Q?ig1CQKWaoD6N914/N/iaKmYU+OLTpnfRHtZarjTWacP1zHpFJI8kvTmww+I2?=
 =?us-ascii?Q?XAaHPdtkQHw2iMRq4HUOh5ACZuNI/6iMnTQcGGccKOs947P0Tv2oRvNBYQZe?=
 =?us-ascii?Q?/8alLRCQzgNPozyjOZ7l2Hxs6A/dKlOoHwt8BL2xchj7Jc+T+0VgEWxU482Z?=
 =?us-ascii?Q?VSwivKq+GcqL0NXjn5gmo7WYNd+Y86izgFHoP15gkmBDHiidFbOV62YzxqJx?=
 =?us-ascii?Q?/y6RyOM4IsBUD2JT/HcorkeyZ52Q5u998BRYpMMQ1jNQ2WNac+J85fSUiNvI?=
 =?us-ascii?Q?KAvuBuLFA/UNDzegz3WqDQktS281+AEla+Ni8SnmiFkavsLnaUeqeLZYEvRm?=
 =?us-ascii?Q?oMaFIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:26.9683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79507b20-54b6-4847-d5ff-08de58f4bb4f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0447EC1A8
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
	TAGGED_FROM(0.00)[bounces-51255-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ti.com:email,ti.com:dkim,ti.com:mid];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 684CD5840D
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


