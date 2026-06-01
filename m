Return-Path: <linux-media+bounces-63211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNY6Ja8tHWo4WAkAu9opvQ
	(envelope-from <linux-media+bounces-63211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:58:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5C61A816
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BD77301DCD7
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687973845D0;
	Mon,  1 Jun 2026 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4nw4t89r"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC53845AE
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296999; cv=fail; b=pulngZ/IyXL8L+D0lbDzZYqjjj1sz469CQGNeG5wdJ4lOY1tbtduxyXTpnpEct8HbPuIR6+n+BybwhPHNnsV5gmqXiQY8+SfHAVBpiL8dMezg+Itqda0OKqKWmTLv++vlXnLnPZnQYWY8veVMwNB2nHAJpLer3EtEzuzFfjRvr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296999; c=relaxed/simple;
	bh=586/dx2HoMnhALU48C8WAbNCk5NpfArttzCAVa+fYSQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H9s4qGDREvSEEhI1SMFK+VSd+4tsr5UzAXpphxbvBpOdlpYbHU7W6f5+sp2ANfcOgsjxUhUswMYV9RVeKYOb9o7xD/+s30uuPNOxlC27WVWOXkuI08GJmcbIWWT8KdsUjgEDvgGf0QyerGPImCbPValaIIPIuOu4Q7oC7D7pDQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4nw4t89r; arc=fail smtp.client-ip=40.93.194.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acFJwmDexBa6+Fc/CVrtfR768Np6QWQYfJCmEILxo1CxfFBlL9fHKMwnlKFTidXCkUnmHZCRqMDbtdw45ODUjP+xFLhkTYeVk6EOV+Al89LIDfrVztbuwWoXRomU8ktgWo+/qP5X0DvCNL8zWJoQXm6CCjbemoqu62l/earFfYJSh1I+t8D2JKJM4g8LLkvbY2Z80ITxPDbLVH/XR8f/sTC1lpTNLA1m+Cv6YrpRNoEVodyE/MlSzhuqhwuU9nuCtM1UoHQgIOY1ZhmtfeFHNiqWB2PW1EpTTFJsAUtbsBylitpRkJBbbiw8YwQSRfrszOkc3b8w5rbiYkjn77d6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/tJUyZLaJC5vUIFY0CYP2KukX/W+x3l72IjDbVUjHU=;
 b=DGBBciLzrOSGBcP+D4CLPV6LZIpJcY4gyhiI6oEras7Hv75xZISWw1o7lQEzjBeva2RwN9GgONcuMPXGPpaEBhtCTxxYmAudAL7/tp5jmSb6/CdZDPO4C2SFdOKZt0nEYOMt4HUnUdfif/g5M6J36shCHNojP21ybfm2tOd0AYdNjytL4n4mSVizcNmA9rD0QtJBgWkH66I3x7aaLHEBzIQqOc3f/1PCnULPhnAAV6GBL0PcJOYJ2WNhJ6QUWe4BcoS4zOydUr3mCcnIwk9dI6vJR9ZwQjsm8BG6sA3Hc5C9Nxr+MuN3CIkkvxklvgaAeuu3jq5bNi8Ew6CA2W8ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/tJUyZLaJC5vUIFY0CYP2KukX/W+x3l72IjDbVUjHU=;
 b=4nw4t89rfG2/5mJl0Q7tpfH/YEQFSymTM5/TNUqw1CeT9tq6iEIqhuyTZaFYf11K2XErcSkQGrFbjjMrDi/6bbXotO+8VvDJUojaiLOH7Pmm6flrfDj/D7+c8ygtXWES+bLgK34Ro7+Y2QH52wxzZ2ZrdSxSK9OpqIT4RWcXhis=
Received: from MN2PR01CA0049.prod.exchangelabs.com (2603:10b6:208:23f::18) by
 MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.15; Mon, 1 Jun 2026 06:56:27 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::46) by MN2PR01CA0049.outlook.office365.com
 (2603:10b6:208:23f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 06:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 06:56:26 +0000
Received: from BJGBICAO01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 01:56:24 -0500
From: Bingbu Cao <bingbu.cao@amd.com>
To: <linux-media@vger.kernel.org>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <mchehab@kernel.org>, <tfiga@google.com>, <ribalda@chromium.org>, "Bingbu
 Cao" <bingbu.cao@amd.com>
Subject: [PATCH v2] media: update contact email of Bingbu Cao
Date: Mon, 1 Jun 2026 14:55:07 +0800
Message-ID: <20260601065555.150536-1-bingbu.cao@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcb340b-0dd8-4a0e-c2d4-08debfaae6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YU8H3JGvyHQ0BPRWAI4i/n2/th1Cx0pxwkcUoNbnQXioDJVSVRQUuNcWE75jN1dzudIODl661oVbrZFG11NkSxTRcfQayl2Gmlb08M7o3Vs1DtFl3i5EYCB1hCPlEwtTwwhqpHxVSclmYBJlzean77oIEfyDIKnlJDM5h55SmPRNXK9Il+UwZ+elnmC7NQuoITix9HenTF73IwKQG+uXLy51kTO2NdFTV5oRnyy2kqjytN7HMsSm9GmwL+5BNkC0+Nder2OaOFkW2ky9f6I2gf/HE0NOfS8vNILroIb5stjvw2G5J+6ffWQRREA/vv0rzqMexv5itfLDmWS3eNMi6vxUhxmwdmQF3PSJHV93VPpH2DUIeKKm8HShfBqtdbKQU201sy7VhSJ/bdYQW6GecedTpGvs1MRtEYwj97pRnxlnmgMVl6uNCLqsQnPI780hWl1R9D9lOtiu77MncJTQJHwPvvR3QfyA30J687XMhWpNob0Atf3RfIUD/+y2dRooD5beClbtbzg1qITl/iPYxh4vdLn45oUwC2ySbfo2/EqpuKJdS+YhrZCyNtQf49/5bEePQ/rQqp5l5meOCZdBbrsY62s+BYcsesn14ZGBOHM90tGFWB5pHWrScSsrowXMYJd6Lmiw60nfVyAMlY0zRp5nZ1gyBZ3uH6YEe8A8UR1zlIvZmcvHCb029mT2k6eGYSK/72qrQMDe8onKPMMqnOmPC+VtW6FbhSx3fVwiV6Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uwztdg/NYtX1xK5cwdVr7NKymdTIK2RRmlH33qjQRsZF4X/vlOcUY8R2GA5Z3iuR4z5rRjUA5ef+kYwnZ3av0K2rTlKZ6Yc11bnbsVHr31sqX6T2Sn8UMVTzmALkOc2VRtq+NTNsRfO9kwK/TJOePcFTI8+qcZLJJ5C3UdD4Sk7yVn89d/u5r99UuW1awdcOxV+XI7O8kK+lv89gD0edSd0Oiyk7SMMpEfptvCfIinixeeTlYa9rbZhatK3Oz1/K91qfGkHys1tgzXavarl1nC9bNtEfgCQikqef8GnyVvAZyl3xXtae8EKYOjefkzvqb7OVEXg2E+7v4t38lYHSpaMD1dCUM0OgxUMXWIH/JNay7YeIcVse1ps+hqy4aUnzLY4fBkCWlQz1ORAn+znKxL7tMwgKLcCwAYtJzbfmdp63jFEbQb+Q0wI2BMHU1/ov
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 06:56:26.9222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcb340b-0dd8-4a0e-c2d4-08debfaae6bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63211-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bingbu.cao@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CD5C61A816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I left Intel and joined AMD, so update my email in the MAINTAINERS.

For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able to
continue the code review from now, so remove me from the MAINTAINERS
and remove the invalid email in MODULE_AUTHOR.

Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
---
 Documentation/driver-api/media/drivers/ipu6.rst |  2 +-
 MAINTAINERS                                     | 13 ++++---------
 drivers/media/i2c/ak7375.c                      |  2 +-
 drivers/media/i2c/imx319.c                      |  2 +-
 drivers/media/i2c/imx355.c                      |  2 +-
 drivers/media/i2c/ov01a10.c                     |  2 +-
 drivers/media/i2c/ov2740.c                      |  2 +-
 drivers/media/i2c/ov9734.c                      |  2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c        |  2 +-
 drivers/media/pci/intel/ipu6/ipu6.c             |  2 +-
 drivers/staging/media/ipu7/ipu7-isys.c          |  2 +-
 drivers/staging/media/ipu7/ipu7.c               |  2 +-
 12 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ipu6.rst b/Documentation/driver-api/media/drivers/ipu6.rst
index 88f6498e74db..7845998a3971 100644
--- a/Documentation/driver-api/media/drivers/ipu6.rst
+++ b/Documentation/driver-api/media/drivers/ipu6.rst
@@ -4,7 +4,7 @@
 Intel IPU6 Driver
 ==================
 
-Author: Bingbu Cao <bingbu.cao@intel.com>
+Author: Bingbu Cao
 
 Overview
 =========
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


