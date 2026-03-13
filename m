Return-Path: <linux-media+bounces-55621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK/NJoHUs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:10:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF752803C7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 352F03045938
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209DA38C40A;
	Fri, 13 Mar 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="df4W9mlB"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CA038BF6E;
	Fri, 13 Mar 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392944; cv=fail; b=PeJmV7LVX8XCAKvInxb8Uqn0oUuLcrlCEAZ4iX7OH2mJ8drQBESy+MX81Rd5ajQlCLqwbeulLJnPWtKORwmmu/SMp1YTg5AGQYyvLn1b3WL4rKKY7iyTZusGVZn3rwYZsGT7Bp8kR4eaXGTwKQ9+4Yf+9yTkC9m/2FAx04BBi5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392944; c=relaxed/simple;
	bh=shQZQWljKPjyIij1BS6k6FyQxTYWdrxf5waSL2kLafg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHUbIwP0mhOZQEhY1osGjh/QrRR+2t/FfWHpV9WaRKU1Djcp9EqsRp2mGVaGPFAseGafprNVaTGIzn0LRINU8oB2H4VL9rmciayAulV2eX7f1sT71IMng9XqDXfDM7BE2naz2PMYkavdKBK7Gzo5jygYNC0fiYKaE8v9/nre8b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=df4W9mlB; arc=fail smtp.client-ip=52.101.53.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXr7PfvXsnAe+/skzGZ6iNPbCHe5kJKPeQ+sVONvOnXTvzb8VSECRlIQBn1atnLv2Rjs9tV+l2tPWw49hy4YRY9FAXfZ/RGyxJ/+hkwA7umUQXaoQupSNB/xJj10KiKeXKj9yPefodFZebDSK3Wx+GsO20MN+Bgrj59jC7NISiq71YmC/6+Z3lmceo4mvIPPHXmP+lkICWub67cD1NbYcenZ9F84kbXEnLWAQJInC0iNqsSvpPw/fcse+v8PB5gb4er3pE3hOHnuyqfIOIqULbrNEldrt6/ayL+xrS9syaGxIl4y7K3mf/0Cydp5gn0EKpffQbvlR0tERHh0MRgBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxU/a1HTR/HFYYhf9ApatX4RWUKpVOS/e1r3gKK1JLA=;
 b=FWZHUuTXG7RsjxQ/Wrz8mMRcKC4WBO+3F5968StUTM+aJYPj/LqiokLhnupcsMDWWVpJQVKQXths2WhV6MNQrX7pV5XEjULDCteyl+f45EH/ODiLtoZM1Q+o+b22/IDI7RBwF04DrwU+Uz1S/yhY/J3Ly4aSYjtsEcPPWGE6aJys6i/Ivrj8pmIEDVp6uToV7LcMz5NNDzTmzrUYUOQZpJi+QZllOuAOz6nkapPCG/qXxCBLnzgrSZ1RMFHXvjNJYz6tVOwFsM6suQxHcmWLrROeaW+LBIWCPpG9/G9B9/jID7yTeDeHPbw4iCAFi/Mna8Kjvn+6tDz9yDKhB0NGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxU/a1HTR/HFYYhf9ApatX4RWUKpVOS/e1r3gKK1JLA=;
 b=df4W9mlB0vzhRTyAcxP/U7H/MsFTVEdqAT25/qyZImb4krQMjQB6cigkAIjpOao2n4n8JrwBp6A6LOUoXlGySggL3Sgpc+VITwdzSkBn9VWvwQ3q3hEJnrTBwKbfg3FQHVsYvvMBHYOsJ4YBRp/L3Nwxz/PAuKUeF9mRlHZgchI=
Received: from MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7) by
 MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 09:09:00 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::27) by MN2PR01CA0038.outlook.office365.com
 (2603:10b6:208:23f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 09:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:08:58 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:21 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:21 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bf274611;
	Fri, 13 Mar 2026 04:08:15 -0500
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
Subject: [PATCH v12 11/17] media: cadence: csi2rx: add multistream support
Date: Fri, 13 Mar 2026 14:36:55 +0530
Message-ID: <20260313090701.646534-12-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 56faf358-85e6-41bb-89d9-08de80e0293e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zhXjWlcIpTAvcdkuXlYzT6aQVHXxLht33/Hs/t16eMMwN4V1XwhpwIPFVl1Jddpcfy2tVog0hwjpvovTLWHJUgGkSAxaZgBPf8QWFr2FTWUngWeSmKcb7EjdmiaNwLTEuEymN5O1KXFMBthNJN/TwID5SzlM7eyzZRv1CfYsrFH2qsfcsu3x5JP2OqVwPrHmIjzHBGECxKypDVb0QBv68GUPJfPvmTvbMPjxtKpqiWi1xxWJEHCE4LPwWMR41q9Cs+/0QD38qzcPAnWPgWWxuLpdj7a+C6gakBJh3L3MvG+/mdgUJepx7Bvc18uA+/DekWGgWXc7Ozo09UO6heURziN15j62D+kq786Bve4qy0QGm+52GoaiN/lAktSiecVER4e0D9Z4BMKgN8ajhTnufwqJl1GEZhhqqkxKxWNNqFROq0ClW9rtyioBaTyvQs1bH7LCxbHU7scLiyi8NbfJQ8XadRx+mwqxdjlDFWzdWMmXdL5FUSXNPysm2FUmAreXNr73mj+NlCj2xjzxUB+Em9aBY5d6lxR6MbmhVdYgdBpEomU3opfWYm9KaQJrUakmDErXwP5QdfVf5GeDhUVcZT1PhWMgGjNwsFeg6kmuC6LGSye98rn184LgI4w0VWInGaqI0MvU0SRqUX/TsF9TzpQbtvG9wuwUMCzb10QYaX3GHtO9w61TrC8uVs1g9aOl9UAK3t7USG9JNuN27DnkWc1Qg0LGLENc3MwI2EY8WgDfkothAMqo9cWS26/P30woMQCk1sihMCSEJPTcjwWURQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gp9nbCovhE8HzaCByLScv0H9GsobQANLuh3m5ZaWkxW+jCsFqNryl45zVa3zH+nHaUu2Vdu9N/NBc8Hljyk1SUiQPho7xtBcqYTkeUHlZ2xaOunsq6+wy+NhPVuIC7zR6nS+go3dQY5K8MWWnfLxlk6P8m8gw6VaINsbXZf9QAxPc1aBAK0wHMqN1c7xdUKmjTecE6nHEtRlgpo4N1EX+GuTQQb4YHSvPdOxhsPhH2C3mOxfycUMARJZxsVC69k42Qdp103qxssv8csPzBMIzxIHeoduoMmXpvDn3LHGtFFsh/8DUy9rYOQAx6CTH7lmrVSf76uJRZue+duKZvTlrC9mHhLMa8XFLP4tb6pgkXZELW37KbedLHeUyVC43GNTQztP0si8B2ds7TcSbIK5W7Nx/OhqviJ+q10YwqOMSwkt3SKr2zNPmr1yhnSiAHyY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:58.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56faf358-85e6-41bb-89d9-08de80e0293e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55621-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,starfivetech.com:email,ti.com:dkim,ti.com:email,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3BF752803C7
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
 drivers/media/platform/cadence/cdns-csi2rx.c | 279 +++++++++++++++----
 1 file changed, 227 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 52ca940acd7d0..f34df341a2cac 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -135,6 +135,7 @@ struct csi2rx_priv {
 	struct phy			*dphy;
 
 	u8				num_pixels[CSI2RX_STREAMS_MAX];
+	u32				vc_select[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -273,30 +274,46 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 
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
@@ -394,11 +411,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
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
@@ -486,18 +499,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
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
@@ -505,10 +557,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 
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
@@ -523,9 +576,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
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
 
@@ -550,12 +608,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
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
@@ -567,14 +669,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
@@ -582,21 +686,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
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
@@ -604,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
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
 
@@ -630,17 +754,66 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	struct v4l2_mbus_frame_desc source_fd = {0};
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+
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
 
-	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
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
@@ -659,6 +832,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
@@ -876,7 +1050,8 @@ static int csi2rx_probe(struct platform_device *pdev)
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


