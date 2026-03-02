Return-Path: <linux-media+bounces-54041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLC5H7g8pWne6QUAu9opvQ
	(envelope-from <linux-media+bounces-54041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:31:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B71D3EE8
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00747301DD9F
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 07:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F550383C62;
	Mon,  2 Mar 2026 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qCHTwm5U"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5FA37FF40;
	Mon,  2 Mar 2026 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436654; cv=fail; b=KrBWPRH0EleBoc7eWQgttlwNR4O5D8gZF1zHyz8hmhLsmV0261LYByD29dvNBFgkEDCkl9A3dIg7QNIFzKhR4hMxAvPHS6Nvo3NSm0KiSNTnEohzAUdEJqqsn4lj1QJcfQP13QHoErOpuDNR+El2SpP6MW39iorYiMXBlGFXTjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436654; c=relaxed/simple;
	bh=i8aauwa6gAJAfMfbWR13sj+xaYszm0YIunUsJeqkkJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k0F/Xp6HydjA3ddUWrTdsZTulGQhc3UZb4tM0yWcpawjeMh4yz6+WQCk+Pd09m52xzGFNjOXYEn5oExjUOaFzo+w1KfOouupk46EzwsBfGkJ6+GEGOh6hRuKSguykDTbXg2x4Qz64PffAEZQGB2oK7tciJt1C4gfTmCYeCvaM+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qCHTwm5U; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y++Nbw03b68SUS1tomPbStS5beyUWpM8FGn4t5lbxVuoUaIzodc39+el2vBwOBDh5VUKR9+KbnYsg79t7S2+HOx0Iw5Vcn699JZIzehpjqm73xkSEdGKhIGG09QhjiOjNXdfS+KQ0+RvgqB9sHtoVcTS79o/AxV/hpVmL2K20q166u+Uq7qGztZLhQQO8m9WPzKZWmpXJa1/dS1ZJ+7PsfL3QY/h9djx/SIG49kwUczExvjV/850OcLN8NFx8IRLvBSjK/ha8QwESfg4ygdan2jPga8eUEqUMskjqTsOJy7IzRSdONE/jDZ2CJRAse72lfvYrRKP0t1cn74tVvXS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCOpDPg2v+lOcQx7DKjsR/M1MQpGP1v8npa1na4eegA=;
 b=xm9KZ3dsQHiPRAEU3gP7SbGoMxKBd2I3xO3L3XRdosV2X51t/WDjjMxKngQcHjFULkqTu7nGaWdfbM2z5He3KQbJAaFoSv8fOmx5Qz3lzQnw3oNktKvWDDmdXTDnod3c3t9Rb6WxphLAlh/RL+gzKla8GSi5y0QI56ROtidwNNY68LEyyspx0DQRxQobRYy3FWi+Gwf5BVRD9xufkkLzs85o+EezwyOrzjk/bEfnqCTpNhngvsENHbRmrnr2ikxv6InIU9e1tr8fcFFh/O91aUbi9TyKTrmm+7B3sKa8DALon1xkIyi3KmUnuzeQnffM/yrB1kVBDUPGtsn+bpaYyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCOpDPg2v+lOcQx7DKjsR/M1MQpGP1v8npa1na4eegA=;
 b=qCHTwm5UfoANgY8ZJd76u/MlBiJfMEkuHvF1DIIj/TKKXEHOGlXarHAh3mQnfD2LKdISeOK+YNSleaBISvpxycm+R9z1bzhuJTBHN8tvZc2mTds65GkQmrl2N1uMx+7tEPgHlFd7RzWo2rWCqEy9oDNIszdtr3IpX09XGsYiy28=
Received: from BYAPR06CA0063.namprd06.prod.outlook.com (2603:10b6:a03:14b::40)
 by LV8PR12MB9135.namprd12.prod.outlook.com (2603:10b6:408:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:30:46 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:14b:cafe::96) by BYAPR06CA0063.outlook.office365.com
 (2603:10b6:a03:14b::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 07:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 07:30:46 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 01:30:40 -0600
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>, Alexey Zagorodnikov <xglooom@gmail.com>,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v9 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Mon, 2 Mar 2026 15:30:14 +0800
Message-ID: <20260302073020.148277-2-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302073020.148277-1-Bin.Du@amd.com>
References: <20260302073020.148277-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|LV8PR12MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: e72383ae-9893-441c-a30d-08de782d9e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	rLjVsgYCgYhgetKasPziiGwKQHoIiWMfk1JkrBGS7VibOQEzGM1zh0lbRNnLFZrNVjVdWDGBNBifp6VHfXlcX0XTSAUX0ThaqzJEbf2HGw0aH7ZjtzZBNo9YB8hkA6DKqm0dcEOkKNYPE7KmsGr5oAwE4beEKiY50lTi75L+jym2CdVLMlE/iERrqy2K+mrTtPaV0i+d6y7PGoM3y1FrIucKDOU9V6JuYInqb/K+oRKb92n1E4L2ERgsXlXI5ykOhyQgZfsYHzcoYtieZlyA9rxFXhL/FnpjnMMOKAkifRmRSmKzGW6ZPlgKpgfRA4xF2ZXSMFwLAnnsMhvH3qIvaUkKWxobyZOyZdUY9jYUu+OeTZMkqrNjCSbpVdaHc7+uf5FLAPCwzQRgt0OLYWaJuM0v2+VfWanf3VS4GD2VpIzAHG0/jEx9Z4ooydn3so1KKNs59XhgpM9zip22uB0VC+KdSVjUNNbS/Q2WoNg4Vwa+P5N6we5AGm789zzn29eqEl+q3MutO1dS6BFhwNcvk/JrIvqicL2LlhR48/1Rlt4zGt8gseaag8KTqMDZ3ZwcIn3kwkYCg9an8m8UOlT9/ponZbJ11EFC16h8adiXCT5JFeMU/zDDDInprtfKKvz2G7KbFhY49uC3AmR04BLvBM/w1T4Hunza+EweIDdFwmigXAhacIBMejFu953cZe87lbVakem8XMbvjlNdn2muJWT6gc+3hCzIWkhPhz8IVqb9xOOXR4W+G7B81agH3dV+fNkTcGZ1Phm7Ia+25nl398AyWODRmv2czYT4FK74T1UAwTLOgd3Aup0p1UMVsOE4536yttpWTvzXqFHx9cpokg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G1NyPvQqIpn5tsDQ82CAocCtxzXX9ABwB728bJj3w8vIVzZ7/91/mL/da2+F73rYPUavovQ+YmwQ7agrF89NWTTG7dBmN765mHjLjRqiArvYHzIHsIFfMGDYVu4oVTz+ZICCL1JQzW1K/u+siNpWIn43sFa4SfCrH9i1Vah3kyoxGF5IeuvXEwgo4r126w+/V4m3l10KPg5SzKyyOhPiEN9McXz+SdlfPjxsmSp51RdWvfLEBsS8301AIhpophXBSlYvaUtNn40CGlMr2la54s6qT4AapMLB4vO7GvojAjerj5iy8hG+j663DROr/XA4Uy/byckRU0QOKZGfHm/Q8xZrdBXCCnDu7/kPvOUBUQZSCXEvThWYpOI82mhPRrhhNlA//khv+RCsGrsgDXVtjAokGZ5rXQlw/3MvDUeGa7+5ik5Nzchrgy/mFR3b0M0x
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:30:46.0648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72383ae-9893-441c-a30d-08de782d9e8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54041-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.freedesktop.org:email];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C61B71D3EE8
X-Rspamd-Action: no action

AMD isp4 capture is a v4l2 media device which implements media controller
interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
be connected to a remote CSI2 TX endpoint. It supports only one physical
interface for now. Also add ISP4 driver related entry info into the
MAINTAINERS file

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                              |  13 +++
 drivers/media/platform/Kconfig           |   1 +
 drivers/media/platform/Makefile          |   1 +
 drivers/media/platform/amd/Kconfig       |   3 +
 drivers/media/platform/amd/Makefile      |   3 +
 drivers/media/platform/amd/isp4/Kconfig  |  15 +++
 drivers/media/platform/amd/isp4/Makefile |   6 ++
 drivers/media/platform/amd/isp4/isp4.c   | 127 +++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h   |  17 +++
 9 files changed, 186 insertions(+)
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Kconfig
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..3640a1e3262c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	drivers/iommu/amd/
 F:	include/linux/amd-iommu.h
 
+AMD ISP4 DRIVER
+M:	Bin Du <bin.du@amd.com>
+M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/platform/amd/Kconfig
+F:	drivers/media/platform/amd/Makefile
+F:	drivers/media/platform/amd/isp4/Kconfig
+F:	drivers/media/platform/amd/isp4/Makefile
+F:	drivers/media/platform/amd/isp4/isp4.c
+F:	drivers/media/platform/amd/isp4/isp4.h
+
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9287faafdce5..772c70665510 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -63,6 +63,7 @@ config VIDEO_MUX
 
 # Platform drivers - Please keep it alphabetically sorted
 source "drivers/media/platform/allegro-dvt/Kconfig"
+source "drivers/media/platform/amd/Kconfig"
 source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6fd7db0541c7..b207bd8d8022 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,6 +6,7 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
+obj-y += amd/
 obj-y += amlogic/
 obj-y += amphion/
 obj-y += aspeed/
diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
new file mode 100644
index 000000000000..25af49f246b2
--- /dev/null
+++ b/drivers/media/platform/amd/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+source "drivers/media/platform/amd/isp4/Kconfig"
diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
new file mode 100644
index 000000000000..8bfc1955f22e
--- /dev/null
+++ b/drivers/media/platform/amd/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-y += isp4/
diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
new file mode 100644
index 000000000000..55dd2dc453a2
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config VIDEO_AMD_ISP4_CAPTURE
+	tristate "AMD ISP4 and camera driver"
+	depends on DRM_AMD_ISP && VIDEO_DEV && HAS_DMA
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_MEMOPS
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_VMALLOC
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This is support for AMD ISP4 and camera subsystem driver.
+	  Say Y here to enable the ISP4 and camera device for video capture.
+	  To compile this driver as a module, choose M here. The module will
+	  be called amd_isp4_capture.
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
new file mode 100644
index 000000000000..500b81ce5d14
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2025 Advanced Micro Devices, Inc.
+
+obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
+amd_isp4_capture-objs := isp4.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
new file mode 100644
index 000000000000..58b21258b6d3
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ioctl.h>
+
+#include "isp4.h"
+
+#define ISP4_DRV_NAME "amd_isp_capture"
+
+static const struct {
+	const char *name;
+	u32 status_mask;
+	u32 en_mask;
+	u32 ack_mask;
+	u32 rb_int_num;
+} isp4_irq[] = {
+	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
+	{
+		.name = "isp_irq_global",
+		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
+	},
+	{
+		.name = "isp_irq_stream1",
+		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
+	},
+};
+
+static irqreturn_t isp4_irq_handler(int irq, void *arg)
+{
+	return IRQ_HANDLED;
+}
+
+static int isp4_capture_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int irq[ARRAY_SIZE(isp4_irq)];
+	struct isp4_device *isp_dev;
+	int ret;
+
+	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
+	if (!isp_dev)
+		return -ENOMEM;
+
+	dev->init_name = ISP4_DRV_NAME;
+
+	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
+		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
+		if (irq[i] < 0)
+			return dev_err_probe(dev, irq[i],
+					     "fail to get irq %d\n",
+					     isp4_irq[i].rb_int_num);
+
+		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
+				       IRQF_NO_AUTOEN, isp4_irq[i].name, dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "fail to req irq %d\n",
+					     irq[i]);
+	}
+
+	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
+
+	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
+		sizeof(isp_dev->mdev.model));
+	isp_dev->mdev.dev = dev;
+	media_device_init(&isp_dev->mdev);
+
+	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
+		 "AMD-V4L2-ROOT");
+	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail register v4l2 device\n");
+		goto err_clean_media;
+	}
+
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+	ret = media_device_register(&isp_dev->mdev);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail to register media device\n");
+		goto err_isp4_deinit;
+	}
+
+	platform_set_drvdata(pdev, isp_dev);
+
+	return 0;
+
+err_isp4_deinit:
+	pm_runtime_disable(dev);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+err_clean_media:
+	media_device_cleanup(&isp_dev->mdev);
+
+	return ret;
+}
+
+static void isp4_capture_remove(struct platform_device *pdev)
+{
+	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	media_device_unregister(&isp_dev->mdev);
+	pm_runtime_disable(dev);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+	media_device_cleanup(&isp_dev->mdev);
+}
+
+static struct platform_driver isp4_capture_drv = {
+	.probe = isp4_capture_probe,
+	.remove = isp4_capture_remove,
+	.driver = {
+		.name = ISP4_DRV_NAME,
+	}
+};
+
+module_platform_driver(isp4_capture_drv);
+
+MODULE_ALIAS("platform:" ISP4_DRV_NAME);
+MODULE_IMPORT_NS("DMA_BUF");
+
+MODULE_DESCRIPTION("AMD ISP4 Driver");
+MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
new file mode 100644
index 000000000000..7f2db0dfa2d9
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_H_
+#define _ISP4_H_
+
+#include <media/v4l2-device.h>
+#include <media/videobuf2-memops.h>
+
+struct isp4_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+};
+
+#endif /* _ISP4_H_ */
-- 
2.34.1


