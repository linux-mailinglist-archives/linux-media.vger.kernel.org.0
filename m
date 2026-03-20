Return-Path: <linux-media+bounces-56484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HRvMQcJvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:44:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB82D760C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D65E7313D5DC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168B836EAA5;
	Fri, 20 Mar 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wc93+LXF"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E3E3750C8;
	Fri, 20 Mar 2026 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996140; cv=fail; b=kO3NqlD4ewXjRl7YkiH1Ufpnayj4mFgRgRZLl9gqRoxJ43EcWUYPCt6s4lsuVRuIP1VKaljqQUdYXlBjn+Ncp4mEsIVdACZF1GCP5b+ymk/KsmQM1wbP0mKeKPtd++Qsj0fLzPa4HsxA14qY1XGkL2TZR6O0oJHA4sXjBK5KTaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996140; c=relaxed/simple;
	bh=vc91XSegRXKYpeuNKsenc1iuJYGrpeQ408LmvM0VL98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7ffJISO/TysBPLNasdcDw3EygkjDQbqO+HXLI1MVSHbzRoKFoq7q5jvFGtzZl/7wMnBFwqbyarN96/OfbT1lg/0wWFl+BuQ0HYNVKIo9ufOuCF5LcQC+VT/6Q8iETn2vvknEigMzbthAKbiIcI4XzgLr2ytKLc7nSI4BNp1ihM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wc93+LXF; arc=fail smtp.client-ip=52.101.46.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xsol9WVUBL3+lU7Q4Vxv9BhBqkelesh+ELeLSLRDDsVADoZNnEcEsQaH9Uw/5VueHki0rueUMxXJQtgK/P/BdWU2d69uzfmPbkLwoOBPqXxA/EUA7RtF1IxUe/IWKEu1f7LgsiZ1iqkhgvwbZMfExNYC5OtqJfCIlgcxYQRRkZrRmBW6/O431f2EAPAf7TLfNhqP9MrVBITJb2w1m1at+3qMOfFjx6uQ2K/w3ZTLtqr/YYkYDXg5bfjXY3C7M6/q3PIiC3VfICHQGB4khQRKWIo2ZnzsHlyK1WAEiEE4ndiF3HMYsGApvX/9GM0MyPGlEerwHKBqIXn2qa/lNf45IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1niMOmK77oOeOBJU8fCcbYtIT9LmYUOSdiht7nHm5c=;
 b=aHeEHHdydVPWaUVApBE36sClsuXyowjFhy5Vh8JBY4d8sWGj4d5HEuRpaDwKPltx6ANY3L+ok7GQTJfVKnry4kLRNlA9mrfGfjTvNV8Ph0zxzQjqYpRj4QLrEA2YGZS8+Ail9zx0LIOcwtFPEYSS5ppZ1Ew3Ny4WF7rVWtwaI1KO/I8lk71R8p9NdCXNB3ZSbrWYbugUmT5lNTleHNup0JD3Pw/2siLpJLIxgWQWTzAfp6iFcFVh1kZIk524E4ZfW6ul9YydyFfh5cy05KzMKmC+kjFLG8OLJldW5W3w8vIidHEOXEiKjDmQzq2hhgTMCWn8+OAaCkJZyOcIrLxLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1niMOmK77oOeOBJU8fCcbYtIT9LmYUOSdiht7nHm5c=;
 b=wc93+LXFDHV+VdgjCSsaBAeAy71Mc9+yvSZamSrzoBE9nl6oAYr5JvaBP8bL6peXNasZf1ITFL2EszBMvRI6lb8GCRlVv93NEWbdfcJiVxausdRCO2x4eMeKKpN6sbjuHtmkYHc/y+UDjmjMPbcE540PJC6+7D8eaildwmeVYYg=
Received: from SJ0PR13CA0116.namprd13.prod.outlook.com (2603:10b6:a03:2c5::31)
 by CY8PR12MB8409.namprd12.prod.outlook.com (2603:10b6:930:7f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 08:42:14 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::e3) by SJ0PR13CA0116.outlook.office365.com
 (2603:10b6:a03:2c5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Fri,
 20 Mar 2026 08:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 08:42:13 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 03:42:08 -0500
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
 Limonciello (AMD)" <superm1@kernel.org>, Alexey Zagorodnikov
	<xglooom@gmail.com>, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v10 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Fri, 20 Mar 2026 16:41:40 +0800
Message-ID: <20260320084146.200988-2-Bin.Du@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320084146.200988-1-Bin.Du@amd.com>
References: <20260320084146.200988-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|CY8PR12MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bde2406-2ab4-466a-986a-08de865c95c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YC4jlynUD7bmWH8E5L6M50bH7YNERed9V13Ii/wfu7Avk9Y2abAA2KhBG6dA6d248HSHLW4ab7BfUZG8uV0vVhOkRzrWGGhkP8TGiwod29RnimSj/Urt/EbonkHnn6vDtw4OHxGFC868xqr0qXHd525aF2y91GGhkj+wbN7XLpMuymJPMqsvgLnneE2A0x1o6Ta9QnHKuQbTD72NS2S7YB8yxgjb33uITxR5PaY8kPrVLCZLkxtQOsSH3o8Q7FlcrERDxr1/Lz0qAA4RqHY1wpF65IcKa/naXCliGc1RTaQGIzvfiYeZTTRs/SDG584/8D9IColI3nr6nYzkVhVxvpEjQ0twN+BZwp8XdfYIP2T+cMLrQq6Ag/twd8up4ANgMLvAb85HYQB/TrXfuXmWwLTOEe2Bn1gSUjpcJQ6nObTQl8mLBh2OTHqCTI0Q4o3Awu8osqff50sijdrNbhzezm6dix+bLRNt/TKlLZCTnh2UZ+u0ZnMy0bn+3D+DdXdtCVE826yEHdpDATB1PtuWCRokgkHLZzIbI9X/2+IsCJW2S8SDlPingfF11Hzomb9JNLbq59TFDwCGwf05nTF2BD50Kt+ixgHGQkKQH1/k6QMXnkPRYCCknJR4yB+QYGhH1+U6dT86nTBK5hq1X7DQSBiUr7bmdeswiH5yUysiKzCrnPFFysAcQg4uYP2oBgE/aw3FmO/yZbyZPlmJkWRXH3OUafGJYtHtlsKkHgEH4dRB15fRKMaNrAIfhAgHQDDGprPLsWCsMx5Dvab+eAscow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8pGx72OEmD+9ZIaWqH21yVXsRU/Atawi7SStmPGTfi6GcOYQhcZpJssfUpu3Vc7A8o7EgxwF7G9w3SZFVZE2RQ7jyhUJVBhW+fYVBJuH8s6F/W50S850ekzYnZJH+8IQjjNMBf78Qt2HtHHDFt34eswofgaFzJVUHL4XaPJ0XJJ7/mRnoOi7VH1IkbbhzfXSl5tHuJQldV9TUekXyQBJrS4NDNeDf1KbqiGwIjjCOajflVw6FCbdzM1yc9aOJtqlg9INOSxuLt8MXfGwxeZ2t72cOn4T7XKv8vi0WfY9azpcV/DXwoTjxwvL71ZNGQ6rSgVSSw/aCjmJzkW20wVbSKz70mK7ScTPTpd2uFcGjMCCmQ2SlNyVlxbR36hoFri2Wbi04f+ujvahGcO0VVBl/mW/GTwqipyZ5QOllGZjn+dDBNNY+rnDppcOyukp0coo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:42:13.9745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bde2406-2ab4-466a-986a-08de865c95c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8409
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56484-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.933];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FAB82D760C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 61bf550fd37c..e5b39120e7d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1162,6 +1162,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
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
index 3f0b7bb68cc9..0b33e927bd59 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -63,6 +63,7 @@ config VIDEO_MUX
 
 # Platform drivers - Please keep it alphabetically sorted
 source "drivers/media/platform/allegro-dvt/Kconfig"
+source "drivers/media/platform/amd/Kconfig"
 source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/arm/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6d5f79ddfcc3..16c185752474 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,6 +6,7 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
+obj-y += amd/
 obj-y += amlogic/
 obj-y += amphion/
 obj-y += arm/
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
2.53.0


