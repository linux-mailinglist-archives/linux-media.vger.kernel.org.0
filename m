Return-Path: <linux-media+bounces-51267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDU1JbnmcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:46:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66F58A06
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E2F15CEE78
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EE04ADDBB;
	Wed, 21 Jan 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t+4qdiQG"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAED481FC0;
	Wed, 21 Jan 2026 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003808; cv=fail; b=q8uCyBYQLNs8uesN7MCAlWim5TCnk9PEljLJvYTsT4e7vMP0/hX2/71R5dN888HPI1x0C3ghoibNytLP1e3V2kq1q46j42mmlK7wEJxt0DICv1Fxo7DT3YiyvOc5Iapucxjde0T78AOiFYuJXi4Ub4irh3MSwR5Mkazsg//L+uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003808; c=relaxed/simple;
	bh=IqBC618vVkrvMWOgTqTWroI/kDeYrreU4ezTqXAsh7E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmQOxpAEDB5LP/a0vocJEYFa1Eu1rUDC7IdpP7yDG72JGtQYM4BgpP5AWpy+1Pe3HKz0Eld1MUMPYEHpVhVQ6ezblFVXxefbqEDxS4bqDPYMTxRYx6RqGJCFq4Ao3UOMPXhCefc6W+EhOv+q0AFdQqYB8EitlkBl2FQf7B149Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t+4qdiQG; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha9Kqb9aUI5YvmaOPPp/Omo7cHfLBcvUASnH5LGGlR4Ma9JtDfDEaiUHdOg+7Asu39jvc+gCFpa7Sve0glrsTdrcyjEPtD8ryWYubfRYothI2Rjmk6TNPari/1aXdjPRxeAxsYCFUFKPIGdFLaTIexh1QID15tMcU6IvEKF5Qs+LbH2t1QByafoRy24cpjd6PKQ3hp8Qf+OH4KfZdVf7aE/l3plMg6Yuc+p9W+sjKNk5nOha2AEWwtrt7QRi+La8xnZ166SH+gEeSskNpT4wQRXFgjYcaWfAsrhVmKzcm/CkddX55QjwMz0IgJ686ldo5yEMMetK+cJErYA/ej7pEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xM2TtWtGehoZ9NoQFehU6+3Qsu1JqP66eqeb04iisnA=;
 b=ci7tbpOfwTKRQNNW1uQDSpc/9hBBEUpgG+JuDyoGDrQXgpTo5RbuuLz7dKUe+rkx3qYdHRd/iNI/BHxRjrfSJjFcK3HcYbovTHFQ8Czt1P9ou/BzAd5sGcdTIT1IPOiQY1aia4pRspA9ql3q074C1C/d29wX6KB+HPQ1MsoPmgITWiZ/4lFEc7PZeisFO4hJ4NTSdGPSgQbfbgHBlRuFtxMhRMHJWqlFSZuxTtDYHhGo9DAjP88srZz7YjQOpzPl43EjBNVP9puLYE6bjQBFsk1mklNzFj8PDVPoGc5BXbmwvi8xXHJXYHxUANf8T1OOD07b+2duBeKbvINu6mD13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM2TtWtGehoZ9NoQFehU6+3Qsu1JqP66eqeb04iisnA=;
 b=t+4qdiQGHy+SV/J8zscFrncmcyUq9Vto0RPnoBcg7a4q2N9lZK1esZSYusHnfsSEkONrDR6SB2Yh/ugnyGK/YFwMDTaGvqKeoiehUpbdv4Em/OpJd0Op7U0A5P8Wv+Z0YSk0/45LH7JPOF4gDyXVrbwS6c4L1Il+bFezGQeiwNQ=
Received: from PH2PEPF0000385D.namprd17.prod.outlook.com (2603:10b6:518:1::6b)
 by BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 13:56:42 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2a01:111:f403:c91d::4) by PH2PEPF0000385D.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:56:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:40 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:56:39 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIO3104105;
	Wed, 21 Jan 2026 07:56:33 -0600
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
Subject: [PATCH v10 18/18] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
Date: Wed, 21 Jan 2026 19:24:24 +0530
Message-ID: <20260121135424.1185710-19-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|BN0PR10MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: b39ce0fe-f8eb-45bc-ae97-08de58f4e845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j8HYG2MLYkfdtnEsyvTyIo4EPTC9IJ3iq+zt6hcaY+oXf+ojl4TvD5+Ph/g5?=
 =?us-ascii?Q?hUBdg69GK0hcI/PcQflqWEjM8zQvsNBRtkdmoqCNYR1IY2wjiOGeAxsrl8EN?=
 =?us-ascii?Q?LJX1HfaHFcNOrOknMvAEKznROKHakmPIvu/8Odar4lYf2ow0zZRS+/VHVksr?=
 =?us-ascii?Q?kulBCyxrn/MscUZ3K6RmoWbCFMQPFXhr9/fAtmPImpqu/fgI7uOfaMS2ovZk?=
 =?us-ascii?Q?KVpuB7EhYp/maA8Grpo9ZZao4f+yAtkOaDKQVJ7Ue0FACXqzOzSTga+2lTzz?=
 =?us-ascii?Q?dV1KjcsEqJ365gkY0U5VTZYZpIk256WnpJBbC+ffhN5NERAyjOS54c3cgY7w?=
 =?us-ascii?Q?cA5yFGG9UDf2PsGhfOC0VrFnPtLHRCayPvOXEWQNUkQ/kwL5uGXXkTns07Kk?=
 =?us-ascii?Q?GSzRVeGOqT9WaqJuHpFsJKg9/JKPfiCKLj4MuggqYywWj+suvNazVwx4e059?=
 =?us-ascii?Q?i8oTNdHRfLlKF8XWvm9yMu1gEFUhJ+cHP9SB9sWD3DT95b9n2ikoXVK96E7N?=
 =?us-ascii?Q?My3MTDEJwj86POen10HZHRc9WBP2seBKJzXwa+kBIEh31QfWqCwB7NTopvSl?=
 =?us-ascii?Q?c8IUyk7u5laGbDmGAI8NR4LCDbsjG8axhy1ro1lYB8+0qYlbBpBC9rIAMAPN?=
 =?us-ascii?Q?Lyz3N0AjLSQD46I+pcpQuvF/TnXXk9ItQKPFZy5j4CW2kGGkII2mq27ZGw34?=
 =?us-ascii?Q?+Bjr8079Zf+bxBUm0VdbTY6YMUDVNqX1RPVJDbq89QJOsifkfZaw+d4d8Xdx?=
 =?us-ascii?Q?dBjjc7P2LAvS5vYoN7ma5kWVgqHUBdP9Kv7kmH8xAk0uCGjTXCArfM0VFaLj?=
 =?us-ascii?Q?2io5AGQNaU0pmRk4eaNP8/szzdydtEgFWzghNMW4yxDht0yqU7DhGdHwqu6m?=
 =?us-ascii?Q?i83rJHyhl454uEG3ZDPzE/8+eKc5Dozr9aTivIfd9KbXtT3/VafdPVTCUIj7?=
 =?us-ascii?Q?ktrdZAvjcSWlX0dwLxDQdJQ4y5jUrKd7oqwntG732qk5biJzLgdlTKdbSv+R?=
 =?us-ascii?Q?tNd8yNyVjQT+3cZRnbSKlfv59wtlNmIFbSCDi7IWe/jC10LAC8C+scYE4PeL?=
 =?us-ascii?Q?SK38FYaGDcEccpoI+l9HaLcMUYyU3RrfSn5m2vGex6/deBqWNawNnbqK7Miu?=
 =?us-ascii?Q?ooUSkzArUnw7cZBzMH8ZVLbgOuFoBaquVLQxiOGsmlDTW0+QQzdlD2JSMXrH?=
 =?us-ascii?Q?ghcrsRrh/E1GIXoJACDO9pR3iB4dxbFkJpwj6k4Pb0/EhiVXip7fa5Q/ijEd?=
 =?us-ascii?Q?lQXnetJqySq0K2sZ1Ho7hDhuSFVJZhxgNtQ3gRkwpg6JjFyRxt4X95LiWUkK?=
 =?us-ascii?Q?vt+NOFQB9vuVmlQ/BOw4EZOK/kDmFSPv1nEIxS2JEuer4vbclsjS2jthlWWi?=
 =?us-ascii?Q?BL/wORFqCqN974RuJzGF6lEhvUG6q5vCbX6rRmX0hii8TkO9nftCG6isH7qU?=
 =?us-ascii?Q?SB9Rd4MaSI9KArz3t5yWOiK3GwQJ0QqD+62zXM+0k6iqGo5qt01ImEB2b2Qe?=
 =?us-ascii?Q?BtkTLbwfgfMXkPuQHB50Q6PhxJVv+yDIqnyHAcnH4BgVFcaVXTz17v6FndAI?=
 =?us-ascii?Q?3BydizMZjYTUJwRtOaUlb2XHI0mhwJz5xTMGPNwai5UeZa8wL+fZVFM1ghlt?=
 =?us-ascii?Q?jL4FxCzZe80H3Fg6lK2fSj90UXjCpggkWlf8QOaQU7BGnEnNPytgSpaDip8A?=
 =?us-ascii?Q?iqrlDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:42.4017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39ce0fe-f8eb-45bc-ae97-08de58f4e845
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5128
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
	TAGGED_FROM(0.00)[bounces-51267-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ideasonboard.com:email,ti.com:email,ti.com:dkim,ti.com:mid];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F66F58A06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <jai.luthra@ideasonboard.com>

As this device is the "orchestrator" for the rest of the media
pipeline, we need to stop all on-going streams before system suspend and
enable them back when the system wakes up from sleep.

Using .suspend/.resume callbacks does not work, as the order of those
callbacks amongst various devices in the camera pipeline like the sensor,
FPD serdes, CSI bridge etc. is impossible to enforce, even with
device links. For example, the Cadence CSI bridge is a child device of
this device, thus we cannot create a device link with the CSI bridge as
a provider and this device as consumer. This can lead to situations
where all the dependencies for the bridge have not yet resumed when we
request the subdev to start streaming again through the .resume callback
defined in this device.

Instead here we register a notifier callback with the PM framework
which is triggered when the system is fully functional. At this point we
can cleanly stop or start the streams, because we know all other devices
and their dependencies are functional. A downside of this approach is
that the userspace is also alive (not frozen yet, or just thawed), so
the suspend notifier might complete before the userspace has completed
all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index c01905680e108..335aa89bcd959 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -131,6 +131,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
+	struct notifier_block		pm_notifier;
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -1535,6 +1536,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int ti_csi2rx_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	enum ti_csi2rx_dma_state state;
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	unsigned long flags = 0;
+	int i, ret = 0;
+
+	/* If device was not in use we can simply suspend */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/*
+	 * If device is running, assert the pixel reset to cleanly stop any
+	 * on-going streams before we suspend.
+	 */
+	writel(0, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+
+		spin_lock_irqsave(&dma->lock, flags);
+		state = dma->state;
+		spin_unlock_irqrestore(&dma->lock, flags);
+
+		if (state != TI_CSI2RX_DMA_STOPPED) {
+			/* Disable source */
+			ret = v4l2_subdev_disable_streams(&csi->subdev,
+							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							  BIT(0));
+			if (ret)
+				dev_err(csi->dev, "Failed to stop subdev stream\n");
+		}
+
+		/* Stop any on-going streams */
+		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+		/* Drain DMA */
+		ti_csi2rx_drain_dma(ctx);
+
+		/* Terminate DMA */
+		ret = dmaengine_terminate_sync(ctx->dma.chan);
+		if (ret)
+			dev_err(csi->dev, "Failed to stop DMA\n");
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags = 0;
+	unsigned int reg;
+	int i, ret = 0;
+
+	/* If device was not in use, we can simply wakeup */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/* If device was in use before, restore all the running streams */
+	reg = SHIM_CNTL_PIX_RST;
+	writel(reg, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+		spin_lock_irqsave(&dma->lock, flags);
+		if (dma->state != TI_CSI2RX_DMA_STOPPED) {
+			/* Re-submit all previously submitted buffers to DMA */
+			list_for_each_entry(buf, &ctx->dma.submitted, list) {
+				ti_csi2rx_start_dma(ctx, buf);
+			}
+			spin_unlock_irqrestore(&dma->lock, flags);
+
+			/* Restore stream config */
+			ti_csi2rx_setup_shim(ctx);
+
+			ret = v4l2_subdev_enable_streams(&csi->subdev,
+							 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							 BIT(0));
+			if (ret)
+				dev_err(ctx->csi->dev, "Failed to start subdev\n");
+		} else {
+			spin_unlock_irqrestore(&dma->lock, flags);
+		}
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct ti_csi2rx_dev *csi =
+		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+	case PM_RESTORE_PREPARE:
+		ti_csi2rx_suspend(csi->dev);
+		break;
+	case PM_POST_SUSPEND:
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		ti_csi2rx_resume(csi->dev);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static const struct dev_pm_ops ti_csi2rx_pm_ops = {
 	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
 		       NULL)
@@ -1607,6 +1726,20 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	/*
+	 * Use PM notifier instead of .suspend/.resume callbacks because the
+	 * ordering of callbacks among camera pipeline devices (sensor, serdes,
+	 * CSI bridge) cannot be enforced even with device links. The notifier
+	 * is called when the system is fully functional, ensuring all
+	 * dependencies are available when stopping/starting streams.
+	 */
+	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
+	ret = register_pm_notifier(&csi->pm_notifier);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
+		goto err_notifier;
+	}
+
 	return 0;
 
 err_notifier:
@@ -1634,6 +1767,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
+	unregister_pm_notifier(&csi->pm_notifier);
+
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
-- 
2.34.1


