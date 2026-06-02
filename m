Return-Path: <linux-media+bounces-63345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H0YEqVOHmrmiQkAu9opvQ
	(envelope-from <linux-media+bounces-63345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:31:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1951627CCC
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 05:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A670230816F8
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 03:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AA7368D72;
	Tue,  2 Jun 2026 03:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FYNCd0Ws"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358803672B1;
	Tue,  2 Jun 2026 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370857; cv=fail; b=eoVZWTDWm/d9hwq1wHgouaERbbTFVdeaOiXzf67wa5398Oi4IQkfoz5TAJQAdOzLW1z80MTo25jq624MSOYUuvf2WQuzn1NQ7tfJSSj0naMoMKySU/mywn1UOxYfSyQp2OIgeVDKiW91sNPuECM737A5MNRAN4wzEzxhzHFv93Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370857; c=relaxed/simple;
	bh=+OkulKElNVZK93J9+BBilJaUxpCruqz1yXOqRNqwt8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TjiUmAXe3WAjwXCScreGHsQg3Ghk12t0ZiEQvxmhJpCeywRLKunF0r9DsdK48kvDyl7doBjiVi5DdNwWyRDAhp2JVpunsVHglnv6WYOyDkVDZXLPFY4aAKv49sqDdwcJFJoWvkk7DSeoOAHIkgVmTQ5vw4WSEMg6+w8ExePCKDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FYNCd0Ws; arc=fail smtp.client-ip=52.101.57.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIFsqq692U30uNhEaeItnWHpYbbdEz8NkWchhF6MGUr+MUE1wBnFU7S9J/WEy4ZNVfgNLE5r4OiaBvQJiLEIqhuzO/TWazqQ0CPymuDW85S0cCyW3Zp48e+530TP4SwB6lNEQqESnV3ND9pvnPwP7JCPAHI+Qoc0GoAiiLZFOo5OPv0T7SjWXQd2bQGWzZJsam+9KppBBiboLCNj//aGNlc07aZimRN4wv+ggHZAjqgfDHnakzKoBAmePJ+JAOfRJNDQg3v+5+wV4zMimxIOWvfSzLsl8bgtbyleWullyMpwxUhvq678Z4iZygKlVVM4l5oX4OCDVHwIBl2NLEe9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vMNe7l6KePYO1isdTAI3F/VdDiogfImk+Tqk8XQnVs=;
 b=hgDwTsrfhJBHyzUasqs2CDlQKzWLs/JESTFbq53sDqwHqQp9V18kQ6Yor5eoKfjo6Fi3xzqETPm+Fah45EADxzQM1ENsuB20tzaBdY3/v8t+axOSYKPnNVfattPYycyslu9Vc3ZCHgs0JIfDkENDJ1irVMlPiszSl5BiOmFWPRjZCV/eDwIYlTM2gEWPwzhdJG2aFN1cp2jG+lzz14NlEztl/YgLiUPxaTn2DrYNuOqgLSew9USCouQG/+IVeiudX3zoCDn+FaHaaqTeGjJMoNDQe3jY/cT2bc+rPFn3cv00G+SROGhfWZp7ymBI1N0bwOrTzzLwh4YPE9aQfEp0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vMNe7l6KePYO1isdTAI3F/VdDiogfImk+Tqk8XQnVs=;
 b=FYNCd0WsLgxW7FRgPq1mgoRhTgFz86Ba0s9PcYrJmKJSiWxfPjIbU7Ynfv9Fr4o+MCLzFKj7JzQLwHPZoSkV4xtkzNGGuH180Sdue34u6umW5XZNmWp2wwsCUtRgM8NIBwlWVu83wu/MRQad9//HPifRRPxrIlHTpw+bvng2HrI=
Received: from BN0PR04CA0155.namprd04.prod.outlook.com (2603:10b6:408:eb::10)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:27:32 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::a6) by BN0PR04CA0155.outlook.office365.com
 (2603:10b6:408:eb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 03:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 03:27:32 +0000
Received: from BJGBICAO01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 22:27:30 -0500
From: Bingbu Cao <bingbu.cao@amd.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: [PATCH 3/3] media: i2c: update Bingbu Cao's e-mail address
Date: Tue, 2 Jun 2026 11:26:53 +0800
Message-ID: <20260602032658.5462-3-bingbu.cao@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602032658.5462-1-bingbu.cao@amd.com>
References: <20260602032658.5462-1-bingbu.cao@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 117a1ede-2407-48c0-ec3c-08dec056e20e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RYOjYMBsFLenomyMslrC/VwvB/b8aIvRtqDZion8JN7H5Xh/KxkRsItPYWzpmX0PDrUpLNB5QPkawNC/QZZizm4ZwFFuhq0zTDFzi7r/luq4Zg8tJIiyKtZmCFpDpSBli10pcGp1FpGGUOtqFBppIc3OAHU0IDJSywi6Dov9LcUtG/fkg07iB3edcqMLPf6S0fu+z4SH0lAEjqoT6f7/0fmfrZPxCyKCjTC86qt0IeLVhkSfzyNePsIjHyBtpj0EZVbFVvUQ9pyhViTdGfbLA2q2bb9NZX5jLY4QIQ3t3hxktinWrGtRsiwN5oOG275b+hQ667niBzKtDszf7bbAYhQAxyrCbJhy12EuAvhbnMjnzsdGvcqHI34F7LMcQwGkA2Kt8byViVes22M3wo1JvlIrxzeknVVHmmdroLaXb09PIohwul6poex7bjeddfxgKaKLAcHvWBzbLO+sR7Gb0vXqLYgJ9OylXri4IXeMLKx/JAJxD/g8c4W99ZumfZ/ptjImSyoeUkzRC0Ek/tvY/VwFfiHSX+7OHydCVdcL7RgcvtenwTg6TisPkv3W/0EZWW6wQAAUABagWl3wzKwo0sCLnFXAdmkQjod4/s9/IacIg7qXlAbHOJZ+OvhxtSKFuml2fvrgs1eLmwMBnG+rMRUs8sG+2IJtPYkx14s0RU/U6e+K/+/odbcIRyGoImhBUzLK88b61ieX4c4kJtpMsL4+RLl/EcyDFHuE6DPV938=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qIdwH1ts3AjWw3Lj3iOa+syKBT7NdvgxeRCM3936t6ndRInW7ZniNXBhpJqJ5yyMLusLFNCao8TJdBhjp/iXRk6QOyHulY5gLvmIgCL4WUTHx2LcFO39OM/BslyCudlj10/Ol33OARo9SgeFWX1FxMqwAJ3bVc1Tk0FNCU941vEQBEajRizRMRl0t4Un7RvZR293h5clZ84nlPg6k3cpMWvIsxNgqjYWxjldMS7ThVcMAk4ATS7BQFMcZwTdgqqHwz+yLZlOEe86h2ubfwoB2sqMwTzyFSUIrYOYGMp4s9nJqo7Z2HieQl4snvmVWmIDKLYKkziaRCUXJ8rb1g9fRsznTkDBHK0YNWrsNjA/2O3uZbkjsiQWWIy2viyUtEWuUW/0snDGgvBZ6GPgdVvadE5mOwS1X/ay9GKHq4otUfUCBsRL3zBtwcI1qNUfCnmH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:27:32.5118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117a1ede-2407-48c0-ec3c-08dec056e20e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733
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
	TAGGED_FROM(0.00)[bounces-63345-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bingbu.cao@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,amd.com:email,amd.com:mid,amd.com:dkim,intel.com:url,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1951627CCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I left Intel and join AMD now, so update my e-mail address from
intel.com to amd.com in MODULE_AUTHOR() entries of several sensor
drivers.

Just update the author contact information and no functional change
intended.

Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
---
 drivers/media/i2c/ak7375.c  | 2 +-
 drivers/media/i2c/imx319.c  | 2 +-
 drivers/media/i2c/imx355.c  | 2 +-
 drivers/media/i2c/ov01a10.c | 2 +-
 drivers/media/i2c/ov2740.c  | 2 +-
 drivers/media/i2c/ov9734.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

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
-- 
2.53.0


