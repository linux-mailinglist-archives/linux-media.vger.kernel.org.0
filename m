Return-Path: <linux-media+bounces-60561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCUsO+AL+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:37:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9E4D8B74
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2C7A304B2AA
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9EE3E9F7D;
	Wed,  6 May 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="czkFM/K3"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2793E0C7A;
	Wed,  6 May 2026 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060010; cv=fail; b=AQnr0sVdgEzbN0d4b7eeoetsjuQFPgR0sgYI5H1Oe5A2KEvcOCczMCCSxdHaXJPzsTM01DDInFs0qOUNxqLokYmt3QuIbKFRLYakdTMtlygtch+riSfTzvFMM37o2qJElH+Bk59ix2Riaxlk4c7j0BWPYpk1qBCcpfkZdQNY2eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060010; c=relaxed/simple;
	bh=n2Oi9lPeC3wgTZEsPPN4RNUAEeDEgxAvACpM9K1g5uM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSlmsGP6/Y6CFAZAVl/7SMq1GIO2NGE8A36e0URbxqhZyQXoul+WAY6s8BIzpw1VU7SiKHZVdpTxrGmLy1vUR7h8hMx3ficwWXreg+8TsqZg+fvxbwT+M1f1y8JagNjPUlbeUIecoFXXQkCYD2/8fQyAmvBlv5/avRVDhBjvujM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=czkFM/K3; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQyO20KyZ8U1FUZhc2fY7M49H13SdiTtbC5J0nSQ1JeaT550q48tKKR4niijh8nG9DwFHh7FqGXMjAr2skCf6c0NljaIyGfT+VjA+ueLz6vpA1JdcSPxOnVPKwQyeVmRN80B4B2WlPV32P5frVCK9ursU90NbzNVjtfAyWGfHfKvUXhkP63AufXhplvPAI5MghlCO+TY2P84sXBcPZscPfq1Go7gZvzHe1TeyZjqxRxqVRygSOHit9VJNMGQY4eDB9tuLVctSz+/JlVN2/saG+tXOB5wLPnKouSdnPXFXPG8563Q8uflwk5Ne7pwnkSTb2g+P2068JLaGqEwYQ/gkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeAguZs0ZeIGa360ZQVrAxYFRLfSBenmoPHzIlYbMZQ=;
 b=Jesd04rZjRiAkJ1FB6+nqnmpFwnjHJV1Mgtw0m5pE++/tF59qAyU13sz5MN21K9chMNXUF8jjLs0XOeXi6/raowCUQoA1yjzOR4Om+t0lL33fwN/3Uluhh3jm28b34KjB2tiswmN5GFnnkSwAUzPe9eciU9ECDplqEpOtQiICAgvgdmq7prvhZnCNE85zwa4WZDJ64Jtre0Mq1iP5Tffj2zTT1iSMguCIKNL+RoMCc7rI9S/ya5a52tjE3g6+XQpHGjlhXE3TlC7vYS4+nzszPOtlzEHwyHP8OVCFXPJOR+RrWgBID5ULWE4N7qCiXEcNCuDM8HjbsKrofGzQIZ+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeAguZs0ZeIGa360ZQVrAxYFRLfSBenmoPHzIlYbMZQ=;
 b=czkFM/K38/ZYviBZIMtcAAG+Ov1wAue/tmUJ8Et3GwBiZuNadWAGl3TS8fFN1y0ONuC1T2koEAhIwIyu4B2ZFg/ZU74Ap0oJs2bEU2uHUFfVD0r23mULrgD6ZPMPxW4LsN3aekdp7LvlqHWFu8BRfPIsXFzL6vTvthL+xHT0WkE=
Received: from CY8PR19CA0030.namprd19.prod.outlook.com (2603:10b6:930:6::21)
 by DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Wed, 6 May 2026 09:33:23 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:930:6:cafe::e6) by CY8PR19CA0030.outlook.office365.com
 (2603:10b6:930:6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 09:33:22 +0000
Received: from ff1c6181612b.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 04:33:15 -0500
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
Subject: [PATCH v11 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Wed, 6 May 2026 17:32:43 +0800
Message-ID: <20260506093250.93460-2-Bin.Du@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506093250.93460-1-Bin.Du@amd.com>
References: <20260506093250.93460-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: c432f0b9-bda8-4827-4b5a-08deab5283ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IG9OT8ARGignMz4EU4F66IGl0W6lgiQvmavwtnPBIHoWo/uWfXvlSxzK63s/jQor+VLxObJk8yD13sIdXrA+oU/od0plgUo6aUO77iRHtNhpaYjheQRUtkoHqXTHQ9+yzonRP93Qxg8OHjKqh7W2KExT+7wfHEWK3WeGLF0Ou0PunBlFiTLdzsk5ntPEydMSK3je3+MxotoptaUz1UheAWC4WnnWRngbCcN6yktGlnrj2kEwmxR7xzp19KgzgoTkHP/XqG0LqPSXKqW+AOveCuVHn1Q2VNoraUetk9xS/+J01CoCbEblNS72Ym0zs+OR96XP34POQNYlZARkMaFHVBICuL8RIAU+Nfgd2lqKpkOCMHfjheDFNr+buA9gxmXz2OlqTs4wAjThf0o7MKzb7oDghj0siumxreHHp/9VTMsi4BH8YhQcFmMD1rL5edqjz9nK68BJaD6GOaDm3MuFdKuxBZnLvYaakQco003MjWpxv61Lj6JOvyZfPkqj+zbLIvNYVwus/eYDdwJlOaqOTGVf120GL0ZI6cLNN83aL9ITX5v8IAI5kqxVh3fc/JnzqbnD0cGlmzSwu8SKlgvXae+3XAMUFf3RAXJ1sbjbKk1U0stRE4Cf+WVp9Jwh5wtdSokSZn4PrgikR1oeywj2N2qaNJCWApns9CxhEInWIdrJjBj3opvM6DO+Mqub3TsBz0Q5nMWBT5Gx+8crPlDpgVpkHMq/ifJDP126UC3sZz0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5armnUrW3lEnliQfBjIV+xPl2SLbPf4Q+87M3gSd+RaFoqqI9nRxBuJf2eSlVhgb+yucJUMiIw7N2LPcFPgMpcsvQwmCV4gg6Bqj4iNfwA3+GkcXsFZopS8tdchV/nFxNJnYWZwf3eCbY2fLrhQ8H3tQCbNZmGX9m7aiFCfr6V6bkiMygkJoza5qoe3bfFMIxoCEsO9EaO2PXdmkFaP3TU/UboxwUTA5EQCD3uVd015zgQf/n22+xewdbJs8CE1G39fQc9HkZmpvG5T9ABC5e/NMBJDqvuC/V0feNjGGwFdHBS7v8P9iA7A36leT0+Ph454iN7vaQax086gss8dFRtSUn3B+pNbT3WIkG6a/dWMZSzikls0dUY19qfxiNNVHoxdqmMb78eQDkk9XlZicGN+j/+n9bx20pNgN4wSL5pVRD02CZafQTorFhRtfE9sq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:33:22.1675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c432f0b9-bda8-4827-4b5a-08deab5283ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327
X-Rspamd-Queue-Id: 4AB9E4D8B74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60561-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kerneltoast.com:email,amd.com:email,amd.com:dkim,amd.com:mid,lists.freedesktop.org:email];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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
2.54.0


