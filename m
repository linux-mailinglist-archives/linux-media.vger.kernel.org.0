Return-Path: <linux-media+bounces-63343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPxoDIBOHmrmiQkAu9opvQ
	(envelope-from <linux-media+bounces-63343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:31:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB82627CA6
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD344305E447
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 03:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8EC364047;
	Tue,  2 Jun 2026 03:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sVf9u0UJ"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF0D356768;
	Tue,  2 Jun 2026 03:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370844; cv=fail; b=dB+DBj2DQAONzjs036iDqWWvToRXhqxf7JGqltRpyAFO6GREnVpcaM/HCi0mcpkq9monTK8uyFhVhsJAyX7AEuWOCg0xVBaRr298PSjttVgoK0rGcB632ke+MwwsGgeMlU9Dho35B2MK5X03rbOlfP85yP0ZFHbMjW+BSvLqcyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370844; c=relaxed/simple;
	bh=r36qpPIzHcS8miCHoB0T0/3CDzYNMc96bpYSUorw4PI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uzoz+DI6Z0rx/HDuP9QnDV7w7KNY/4bKvqIeBXwm42hVXbCUvZhdbjS7Scj9nBjyX9qn45udU6mnA+peYlcTOdBmtpA+mPW97HbePuDYnstWGsPnSJCIykdltYmAVEZVNbYElyh0M5FJazOtdk02YwLACxr8+pGMsxgvywR6gOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sVf9u0UJ; arc=fail smtp.client-ip=52.101.43.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHPBTMwUk5HEj6vKWNFtc86ELGBolsPprRZM1akE/ZBJJULwIA+lilctcriPnp3GZT6irOqdV/cmOmOkNls+1Vj8dUPrpIYKy4IusBGa1TUWGkpy3sakdkPjFQt4H3YgWOpFRun/j1lAnk0J0U6/EWwpEqm9zxG40TE3cS4cJEJZ9Xgt7bFWSbAiXtaFCJxjHhdA9z9hQUYL5+g6xWYOuUBieO/P3RDkOBkZnPWuWBndUzkLu2V66Rf+QxuwZdPm1tGBsN0S8g6B2VhObbs2sSJ63QC8Lifpu9K52YPJEnWrhMuoH8ufXyyBjQaRXTtba7XuB3zZ4QZ5vWpAyAtFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C78jvnjA36pFniJ04oCYQ1Z5LgS84znfdHriJNyaEiw=;
 b=aLL7uXKBEd2BbfBvgP2WMCk/D03AhS8PN9E1YJDREbWNHF4zHnYM++s80/ozkKRVuhazwX0FmeDcn4yIVx7XBrPz62EdlPEdwX/OQNyBs5T+C+iQR/b0ysHNdujA/fM43ywgyI1uxw3+WRiuSnA7xxgAs/vXldRu4ta4+ahKGFSLhKwv1sRIBlBY/nyfToYv97H2Pj48dqhPxPYmu0+6vDNOZ34X5dPQzS4/rem3U8XkBpl24QoYRykDO3ZID9ZoFgsyfPm0erQEWU1pRH+/At/sNlvaYHHrgWBR6nWaX9fVQ+p46Xfh+o0nJVwYKfau/XfRTrWq10AJO/sFW729zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C78jvnjA36pFniJ04oCYQ1Z5LgS84znfdHriJNyaEiw=;
 b=sVf9u0UJf20WU/M4oSaJhVjZVDuawEH5gV6azh+rdHiyzM9gPiTRoWM8uVlHPvV8UQDb4dVb/ZvHX98MJ6mLUwJpf8IfcYGugTxRpV3WOxCfPpWWNwEJhHR1y+2SBg7SpklvADEGIx2IXzqjBHBYvS57eEiJhdYFjQ7GVWOHmy4=
Received: from BL1PR13CA0024.namprd13.prod.outlook.com (2603:10b6:208:256::29)
 by SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:27:19 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::4c) by BL1PR13CA0024.outlook.office365.com
 (2603:10b6:208:256::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Tue, 2
 Jun 2026 03:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 03:27:19 +0000
Received: from BJGBICAO01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 22:27:17 -0500
From: Bingbu Cao <bingbu.cao@amd.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: [PATCH 1/3] media: ipu6/ipu7-staging: drop Bingbu Cao's e-mail
Date: Tue, 2 Jun 2026 11:26:51 +0800
Message-ID: <20260602032658.5462-1-bingbu.cao@amd.com>
X-Mailer: git-send-email 2.53.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SA1PR12MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e28684-58e5-416e-9989-08dec056da28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	q+esSGQV0aC8XkB6ITeHGNJERkoEHJ4jdBUQqZaveuLfd5kRBt8/RMhPg76VLML1goHBGnL93v6ZQcTZibX9ztBdQ0TV1Dof2wkHwYHsUK4Z9BrVb8CdGqJCtvX7QenVVyiRTjWQmLnkC8ix5p7ijJVrZZdorcs9GUIzQ6n3zYK/5M3JHQwbeyCywNTJPVk+spqkSsBdo6z31PG2pUf/IfCQTNjMWFZ2GaYeN+ZdR9yZa5JMCy5vMzk+tNpj7Gqz/5F8aUbf7yr5urfGy9fAZWE+FwUs+hnlQhEOZIoZOQ97NqwtiJyJmEqGfOBXD7OMdJT2GCrSFycfCQga0jiAeK7S64Y/7ZrHhIzssZFTNXEdLYHmFlsNGesYv9O5nXLYXzgATMWf5ZIJ1x60fFRt9QsHdWID4duBzE0nvy9B4lQ5pd6omRfcj1qCaTbnmfqkG3Pgt49MFYauDHIz31MnIl3eNy8++NgBx4WRHOCtYBzqETURyraVgMIcXeJ0NMeOGUVu85aCf+1VlDjKIlAY4gXg0L1WQnfODKHBPNUiaZ+mcLZe1dHWq5W40G7djI9L/ZFjMMHFo4EyymbZkTl2oIfUYhWpny595AhvAwzcaSGiLcJKrOzfNzE+yHq59s46h7svL/Cph5HxpKzD4V6TK9uEVqeBNqdD/+Td8GIyDaMPizrrBx1dpsA4eMtIfq0JF9T0jBQ/qs369ZHJpjJV8JFqaiSkaGd3b7jTbAwhCns=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6/8XCm5UIXaRAhSIiQ6HGdftl9MNZptf3P/mlvI+iyKjn2/OJVTyWJyzUhXcfE5Ks9n2rOa/3pv59wUgoh2fFnARTqv1SizIus22TSFedoFDcfeKaoUwGwz9WOI8im9KwOUAnuWLn5CJSlhkc9Ooun7nHOd7ssJIVIvfxZ91HsMXg8M4zayzP2z4ICuOXhFrPEclTScAAvRdDIWDip/NNnNm8zbG2IA2nDcLIjXpuNpH97LPlo+vyTRZjS3rkEF5cpLFEd4n27r44Mmcmu4EBE5Ay3X9HT0k37cFCBxms2ccWG4nzUbkl04Ox7e2kn1RDuubRe5HN9XLFOdVIRhSzNaPPHfJL4McTQatuSR0YCGG4sUo003gzlFDz0atZVlviOZ2zT23JVRlW+EEtGr3UCvll6HCM+vtG+xXytZAuVQcmQmv/pa8lqf3cRb49q+Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:27:19.2573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e28684-58e5-416e-9989-08dec056da28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63343-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bingbu.cao@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AB82627CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

My Intel e-mail in the MODULE_AUTHOR() entries of ipu6 and ipu7
staging driver is not valid now , so drop the e-mail address.

No functional change intended.

Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6.c      | 2 +-
 drivers/staging/media/ipu7/ipu7-isys.c   | 2 +-
 drivers/staging/media/ipu7/ipu7.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c9cdeb7054d7..f33a6da2f669 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1356,7 +1356,7 @@ module_auxiliary_driver(isys_driver);
 
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao");
 MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
 MODULE_AUTHOR("Hongju Wang");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index d033d4618169..5b99cc4a419c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -840,7 +840,7 @@ module_pci_driver(ipu6_pci_driver);
 MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
-MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
+MODULE_AUTHOR("Bingbu Cao");
 MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
 MODULE_AUTHOR("Hongju Wang");
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


