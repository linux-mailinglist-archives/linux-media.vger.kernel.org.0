Return-Path: <linux-media+bounces-63205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD0BFgInHWq6VwkAu9opvQ
	(envelope-from <linux-media+bounces-63205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:30:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C161A2EF
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E6CE300A120
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA25D351C25;
	Mon,  1 Jun 2026 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5A4BxPQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A9B351C2A
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295418; cv=fail; b=EvBCjylOApgols49okR24CfcT5OUNkhueWEmvlzE651YmTjzwuKWPUSj+Q8QMU0QqHyfxXXbtcjOaBj2MR0cYXcHae3NlE2/lsG5Ij6InYgGh4fxuqn/ouviIQjZzpkqMNUtsv3Y0xp4ikE+bSZtaJ50JuUtoYEitx6dFQCNgG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295418; c=relaxed/simple;
	bh=DNO4h0m/M5k3Q77bjDD5wfX7RyBTc7oAPlqEb7/Ab+Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ndCmuPe7E9BVt0CJKPCgKMd4uFrPil1OnayOTbhZG0YqQM+Qs+0fFv8VX2vgPLr+b2L3OzosiWAWNY9OOl3ZPELUmjML/Rj4tH+cSZe0JObDCbXY1pR+Fijz0jpp0FM2fp0SoP0DeB4eqU+3UdNvNm8f5VWEoaNq5UFk7kcLfPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5A4BxPQ4; arc=fail smtp.client-ip=52.101.57.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkLtE6PiQY20TLuPDBmGeEBjmqrhie+thuAZpx0UCaqLF7eKH9kSGXwLItfPrhVgW6E3QzKtOgqRlv113HegEsBxVDMnmG12txb6v7q+2FP01w0FQ6uBBvA2gDEQnDiLJMnRvdAlTqynL58374R6WnusCqUnVYn4+SnDd7ueFJQBXQ02dZoWo5A9Cm8n70STLA3jHtEVwfxgJePqGdyv8YYs0/6Qaaz4+6E2uRzrJG3CqjfzKaSat1BfZqpJ8kvrSuX8ktcB9HewPbb/QdLDSp4DJzd+z0D/XqgwcOCxB5CncQJcL7VmcELKhuEpIBTbLwiKU5gbZ0A8/JToycRRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHzbvgk2iGzBDryDCB0LdObkhvga14FXJVqbLmGeQ9o=;
 b=n1P4mLlC/vQKgwIrkxDRd16BehysYAeBsV16ePSXhK0DbO2j6Ce7pPD7nn96EdDoAjTEn+ur5n1yuti3v3z6izSUUswFN8cGcf4atcCEEYpXO5apB3JeZssNevyM5P99VYN+w8VA4f1FpFXMflDt9vm5KIjV41WmObnqbQb6R4dt2ggMBOxhnK7W8wYRdFg4mhC44wMc/GogijG4IF8yGRhsPIb5E9KAVetD2IFWTvM5ohggaxZ9k5opayuA4ar5NTHXYbfdL2tTlHSVGvVmzED8V7RxOMkTsXPNsp0DhieKYYukh46qRY16ha9knjhkQ3xJk1xGzDbheUNk4xcgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHzbvgk2iGzBDryDCB0LdObkhvga14FXJVqbLmGeQ9o=;
 b=5A4BxPQ4ByqGjBQUpVgouic9PvQp3IXpnXluGX4dJsyuTvymV0Apqp2Oz595gHW9zErO0yvPgraTzmik06SMt4drbUxYJIjtFKlLWEj5bzOQFmXNP+2y/6X+hRHwGUJu/1EtpLnQzkzF3rVXT1nHemeU2q2HvQISANef+4zu2qo=
Received: from DSSP221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::8) by
 CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 06:30:09 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:3d5:cafe::2d) by DSSP221CA0011.outlook.office365.com
 (2603:10b6:8:3d5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 06:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 06:30:07 +0000
Received: from BJGBICAO01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 01:30:05 -0500
From: Bingbu Cao <bingbu.cao@amd.com>
To: <linux-media@vger.kernel.org>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <mchehab@kernel.org>, <tfiga@google.com>, <ribalda@chromium.org>, "Bingbu
 Cao" <bingbu.cao@amd.com>
Subject: [PATCH] media: update contact email of Bingbu Cao
Date: Mon, 1 Jun 2026 14:29:41 +0800
Message-ID: <20260601062950.131642-1-bingbu.cao@amd.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 06893cd7-dad4-4a53-ef47-08debfa7398d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	cRVoSsShIRDpmsFCReDTTWYeVjKyazmlFOGvvQjuW4qWebqyAtiaJ5F+61BvxlKUGLpUAB0/7EWfnXXg0UEuHRTdxeMcHcBC2QCMdwVZyGASchovsSIgykrq2wyhyQFZs1U5/tJpgXYkFbnszTZk8cqVnnSFfw62+x+pUves83L31a9dk4mCDgNF1bxEruD/GutY378GynpUvoKoNQt4KpcTy8UxIqiKwQM1wn0G4MdfOGk3d6P7djokU/LcFyBVPCDkEBmr5T5lY7ir31NZrkgYT0Ghx3t391ORuBf215FInb7m5WZPdjaNE2ISIALxvrgstsFgjZRKWMdgQXiZOEY/TOSurRFaVHh51bO5bd75mo4jlVtAzzDBjfCyJ0r2AHHaU9LxDZweISneJh3KIPOyF1t0e38ibYWG8ZxlV5cpfpyyERheJTV0hLBf7BfmbJryhPRM3GqO6/1N0emItOdftJjDWH3+69/P9wIuGxvpMTV2QP3sgpD+dMuw9uWN811V44ZNYffOjlUj3ejF+1y0EHzeb9MzGjINYRF3eux8iLLwg2jJODFD+NUuVJBV+JUpRbsARLRbwEJW6vEg4PlpRKIJJbFN42KlaK0Ig3BB2fSCERvrDx1fkhRq8VZFGyc+lFymGbCRI9tjcKXFwz+nvRPFb9MriYoRH7WGYHqg0g0I1gqZcI1CTzBwzccA6A+TDRjgSFQO7DspzLidPReIdoPYRUk6e9+YXwzXKdc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jRQUpKBk+PTdEsyOGkVllz1xf38Nhpe+TLrATz+zpF9poqk61Ltz3cIaby3NEFXAgtrW8+lYGtQl0DHZJqWsLJBFwniZIxeFw+Dcj8OY7i+/nBOZu/FBXDetfcnkbjU4zPCSgmouGlQKQLlnFOuoxDeET4H1mVxYXtgT48p6XKv7Znd08Bv1klV4p+vWSnZqFjn8r6vKyQS9sD1umNTOXeiK1Gks7HjcEoZeK2P/EdWuVz6BSSX0sxf1aAyoWM0fs1oe/ziZDP8Br5WQfCDoYumWgcIhc0OCEreR9HyT+ttGWYFUlcdOfaSTZvIUWldqlyujeNwFfp9KKOh9wgfor9Nj244/SOKA+D40evv2csedCrdPhlts9s4BI7cIenivNiKEQIAYuP5ic0FUwi6xsVrNf0MLZsSUNNVzC1kvrEOJed46r8Pi/xUoeyBrdwZW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:30:07.8486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06893cd7-dad4-4a53-ef47-08debfa7398d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63205-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bingbu.cao@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE3C161A2EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I left Intel and joined AMD, so update my email in the MAINTAINERS.

For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able to
continue the code review from now, so remove me from the MAINTAINERS
and remove the invalid email in MODULE_AUTHOR.

Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
---
 MAINTAINERS                            | 13 ++++---------
 drivers/media/i2c/ak7375.c             |  2 +-
 drivers/media/i2c/imx319.c             |  2 +-
 drivers/media/i2c/imx355.c             |  2 +-
 drivers/media/i2c/ov01a10.c            |  2 +-
 drivers/media/i2c/ov2740.c             |  2 +-
 drivers/media/i2c/ov9734.c             |  2 +-
 drivers/staging/media/ipu7/ipu7-isys.c |  2 +-
 drivers/staging/media/ipu7/ipu7.c      |  2 +-
 9 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..da53dec5cc6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13016,7 +13016,6 @@ F:	drivers/iommu/intel/
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
 M:	Dan Scally <dan.scally@ideasonboard.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
@@ -13027,7 +13026,6 @@ F:	drivers/media/pci/intel/ipu3/
 
 INTEL IPU3 CSI-2 IMGU DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -13038,7 +13036,6 @@ F:	drivers/staging/media/ipu3/
 
 INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-M:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -13048,7 +13045,6 @@ F:	drivers/media/pci/intel/ipu6/
 
 INTEL IPU7 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -13350,7 +13346,6 @@ F:	drivers/net/wireless/intel/iwlwifi/
 
 INTEL VISION SENSING CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
 R:	Lixu Zhang <lixu.zhang@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -19671,7 +19666,7 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 F:	drivers/media/i2c/os05b10.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -19766,7 +19761,7 @@ F:	drivers/media/i2c/ov2735.c
 OMNIVISION OV2740 SENSOR DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -19909,7 +19904,7 @@ F:	drivers/media/i2c/ov9650.c
 
 OMNIVISION OV9734 SENSOR DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
-R:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -24919,7 +24914,7 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
 F:	drivers/media/i2c/imx296.c
 
 SONY IMX319 SENSOR DRIVER
-M:	Bingbu Cao <bingbu.cao@intel.com>
+M:	Bingbu Cao <bingbu.cao@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 9a2432cea3ff..bb73cc1ef991 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -352,6 +352,6 @@ static struct i2c_driver ak7375_i2c_driver = {
 module_i2c_driver(ak7375_i2c_driver);
 
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@amd.com>");
 MODULE_DESCRIPTION("AK7375 VCM driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 953310ef3046..87301d62eb8d 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2499,7 +2499,7 @@ module_i2c_driver(imx319_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Rapolu, Chiranjeevi");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@amd.com>");
 MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Sony imx319 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 27a5c212a527..9969c61f1ec4 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1892,7 +1892,7 @@ module_i2c_driver(imx355_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Rapolu, Chiranjeevi");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@amd.com>");
 MODULE_AUTHOR("Yang, Hyungwoo");
 MODULE_DESCRIPTION("Sony imx355 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 8a29e5b4b6ba..f857d3dd8ec5 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -1131,7 +1131,7 @@ static struct i2c_driver ov01a10_i2c_driver = {
 
 module_i2c_driver(ov01a10_i2c_driver);
 
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@amd.com>");
 MODULE_AUTHOR("Wang Yating <yating.wang@intel.com>");
 MODULE_DESCRIPTION("OmniVision OV01A10 sensor driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index fb590dfadda1..f5d5a3b8f87f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1481,6 +1481,6 @@ module_i2c_driver(ov2740_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Shawn Tu");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@amd.com>");
 MODULE_DESCRIPTION("OmniVision OV2740 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 0eaf33807fc9..2c94691741d8 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -989,6 +989,6 @@ static struct i2c_driver ov9734_i2c_driver = {
 module_i2c_driver(ov9734_i2c_driver);
 
 MODULE_AUTHOR("Qiu, Tianshu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao <bingbu.cao@amd.com>");
 MODULE_DESCRIPTION("OmniVision OV9734 sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index cb2f49f3e0fa..78f6c52dc1bf 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -1157,7 +1157,7 @@ static struct auxiliary_driver isys_driver = {
 
 module_auxiliary_driver(isys_driver);
 
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..c990a95aa59a 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2774,7 +2774,7 @@ static struct pci_driver ipu7_pci_driver = {
 module_pci_driver(ipu7_pci_driver);
 
 MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Intel");
-- 
2.53.0


