Return-Path: <linux-media+bounces-53288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC2/F1GOnWkXQgQAu9opvQ
	(envelope-from <linux-media+bounces-53288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:41:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E776C1866F8
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7270C308B9A2
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 11:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E8337FF43;
	Tue, 24 Feb 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cnH6QJC9"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61198226D02;
	Tue, 24 Feb 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933187; cv=fail; b=STTPXdCuomSf/RVXYu9HQdcG6Lzb9kUJxyjxLH7JUXyGEOVl7i4AZXkrv/14mCqtCLDVzcFzu88/OwoNAq3l8FsxmpetU5ndpdD6OJpv6lIWz/Dyne3SVrTByrV/oKSX+DFuTxcUPme2wnL/XrqZIFm4A6p8EVeQUE6em1HKPyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933187; c=relaxed/simple;
	bh=12OV9qGVNfRrity6P7aIuDA/V0xYvEqUi8c8DqGBJJI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2LdZ/rAMJaJc5en3yXuj7T4m1izVKpyRfH2LcrTDXZWo1YxKRaOjVZUga0B6dkHmiuwvCU4wpo+GkM2sGJ5fL3DkjTXzdMn7UhOPQQgmW6cGDsOqncggk7TC7/TkikI+9PmeSGB2FgWzCwxXWH3J4fCD4F2LTf7ZxcrN8qvmm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cnH6QJC9; arc=fail smtp.client-ip=52.101.85.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXajPJFQczoN1l+F5cNzE/MAsYD3RpTnbiWIhs6cECdI27rhDQ3WH7TrXjknyPypI71w5ga242W9IaBSOu6AqL92eNIHd5Z+DCtVBjK0puzY+iCk1kjoMsR6F/kACRfC5eJye5CDe8R0IjrNu2U7IKihtdm7eGdasaSy2cQ+EftLro9rtgxeDy1BVidBFxr9yqL5uuFVWSovBXefE8ZxZa7ftIV1zdaRt6y3vPBM2KC/kQij+8bSDOFcLy88w+OcIKx0BtCjGtW3WaizdBUjcSWu8J3M7VRXoLirin/REAmd3IsbqZqcRCj31TSa5+QzEefi2c0K25ueCiBxZEINcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTSYfdC+XOSHpKm8UI/kWXrYhVvC3K8KUJT/CgVBJso=;
 b=iL+DjdqO9G8Igs/BhyJeqNg1AOpHpcObSRufUoOPYMQ8ub3d135YYunnHSeP1xCHibC6uoiUFnNOCmrZ9Eue9ToNffne2gPOEVQblsRZ+sSR/VFBsaMF/yjCmsvIVAx/HYfNKUZhKzzayLPvPALhxSg0aj7mDwQ0MO0vkKSDhamwy1EnYi2EumYbUauMfdWA2k6wElBLeYiMHH2kEPZlWTPjOdplKZUCHJwD9cQCyP7OG7+Og3U96+2pgjB97V/2XCZwerOB0apggczuYCwv3gnTOUQp2TRR0XkGyJa+1stsMRJbmYIM2wG4fTPFQvSjhaq5ZzJD86pFIjP1svlKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTSYfdC+XOSHpKm8UI/kWXrYhVvC3K8KUJT/CgVBJso=;
 b=cnH6QJC9G8qyHgp9GYJIqGd/gCt7c8HP755wQP3Gvdd6O5nAa5m4/6alBSOsVRUqHUV4XI2cWUYm+34UseeK0vIEbpl+ym7D9zYqUUKpQrrknG6fdp1ly3HOQ6Rrz8a4qrEBviRtpoQlupWxYn2kc8Ei6Oe2uqZ4xBtTHgFiO6s=
Received: from BY5PR17CA0019.namprd17.prod.outlook.com (2603:10b6:a03:1b8::32)
 by DS7PR10MB4832.namprd10.prod.outlook.com (2603:10b6:5:3a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:39:44 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::e0) by BY5PR17CA0019.outlook.office365.com
 (2603:10b6:a03:1b8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 11:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 11:39:43 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:39:42 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:39:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 05:39:42 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OBdaEx2658018;
	Tue, 24 Feb 2026 05:39:37 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <johannes.goede@oss.qualcomm.com>, <mehdi.djait@linux.intel.com>,
	<vladimir.zapolskiy@linaro.org>, <dongcheng.yan@intel.com>,
	<sylvain.petinot@foss.st.com>, <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <y-abhilashchandra@ti.com>
Subject: [PATCH V4 0/4] Add support for DS90UB954-Q1
Date: Tue, 24 Feb 2026 17:09:20 +0530
Message-ID: <20260224113925.19983-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS7PR10MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a5b982-77e6-4e8e-b75d-08de73996736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HecSvGOYEU6kUqM7cuwtZjmn+5qRJtj8ErWwBpuPfk4oCxxRrKrXYVrXJHVh?=
 =?us-ascii?Q?IQl0mmHUgYtSUwx7hewAn9uyDImxaCtSxod8kT+c/1jlyhyiFGtlfmw3rPmK?=
 =?us-ascii?Q?4ueKNRbOvzVq6tE/QumAFdP0RC0Rmiutadjlrogio10gh6pLkw9FsRP5ltyt?=
 =?us-ascii?Q?K57huh7kVKZL4czTonL+j4AE+F1ooTohRLHlYPPdc6fbVSOWR90S2+OIhpTU?=
 =?us-ascii?Q?YFAAzxggfr+4/lHWBVqA22jpw8Sl2/L1a0t9ZmU0Bh3/bd8z64ta4mF3i+X8?=
 =?us-ascii?Q?YLNQQ/3Mnu66MT1wdbEKgtXuuVppWtp9EtIf1uVEXP+++umIIJwTuVzRGcOK?=
 =?us-ascii?Q?zRxUSP+fgUSJU+0VkVC4kClSUPDe/Jlbw2kYs9p1walW9sq3f5eFTSC2YYRH?=
 =?us-ascii?Q?FgfC/K5dtGWuOdqRokYeYb/r/wQzXJPsPFLeV+bYQWA1JTaxKVjNRCpwEflG?=
 =?us-ascii?Q?Bke0yZBwyt4VWv5P8ukWvP7Al0zC4mHl7uqF2vEDea9IMHF0yVwg9mZ2528S?=
 =?us-ascii?Q?7ahTPNMWdfC71i7Qw+G16HJXtdIrJrxDleLXlW/cJOFTT6lVKH/02z6L8jRq?=
 =?us-ascii?Q?a5RJDyQ7RYA5ZNlVjUGWC2CVDV4V9i+T/b/yzSIxvQP93l/ae1gCN62gG3tT?=
 =?us-ascii?Q?5ClMdu3z2LSpMHHCAGNbx64M4W6+Vh7I97xGwdtGYLVfSsXUS6lFn5Hx+Dii?=
 =?us-ascii?Q?LBHsTeGvla7H17eEYwmrG13+rxX3SjV1dTH9jptwbm/sWMHqNHI13AFIRj1Y?=
 =?us-ascii?Q?P5h/O3fDEACarxzQA2wW28dLhqzQhgxbyNtGutsITyoUSM88aLTXH5KnkdRE?=
 =?us-ascii?Q?fHAxzHQ6D/vxhl1GP35K1/xaTCA/iXbpMlrJg4I5Vaa/usUnB/MezAvLVnqK?=
 =?us-ascii?Q?u7FQJKz1ZYqsAoYZUBQHP5wjDDPCFJaDJxsug9L+AhZesEntKDdRplyAcezR?=
 =?us-ascii?Q?DyyDNzH3C5GxG0hAnxdU+TfS1gq0vG856rLoiOHgNj2P8Tx9ADTcKs2/ch9u?=
 =?us-ascii?Q?+h/ElQ4H8e0AQoXGVZkYifAdG156pLp6NAP2y+d3PI97Hbw5GCyM7LDSWP/E?=
 =?us-ascii?Q?qMi7O3aI0pMeUMnFlQkR4QyZTBAfF9FN4s9PsLYkAZ6uenf0UfNYiqO0/PoO?=
 =?us-ascii?Q?xL6lj77EQpQbgCioTVuMIDXyJ0EY4/qE7+OyrWDMpeqPfJ03Ms2w//D800Ao?=
 =?us-ascii?Q?CgvJVRm4GctFYyjU9rIfEn++kIwti5qNphDL3fCvb6LYMuloQEMmTm2Elaul?=
 =?us-ascii?Q?H8jdrw0yEXtvjgDiuIEqteZEvjhUqbnPUCVcGi2P14w/JJbi9QGBrngoFYnq?=
 =?us-ascii?Q?bmb9e51hfVF0xjftpPnZd6NIQj9N1q5BucIqiFAkiTScdyW4DV3L/FdbnC/w?=
 =?us-ascii?Q?4Ad64HcvWlnigyLbXdSghirYy8FNDMA7Y9fGzcxjs6goi4S/0reNs72TczCe?=
 =?us-ascii?Q?zf+6V45Y9eNzXpd7KrbNAfQlq0dXfY5fHVpwFOSbQeyZgTYWt+fkjg7H0qjv?=
 =?us-ascii?Q?6GrYIKfwh8ulRLSI4wZ9CoeGiOJXgCEwLvcOnNQl1xe2udPdp7KEBXr5qAtK?=
 =?us-ascii?Q?2LzkO0lj5aIJS9IoLps3xkJCDpibwceZwM+sr7RY6XlAisMRIiIm05f4YkPw?=
 =?us-ascii?Q?jplc1SSfR8qntu6yRu5l+1R1r36cDeqGO/4PuZzztsf1+rKhDY4ic1lmsAss?=
 =?us-ascii?Q?K5bydQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dgFoLo9iX4y+j6LXczLh0g29mXeMTOcJMkfqCUtYaLEE81hoEPB4nf3dcLV828Fna+joUKsEYdPemt9bYVY7mf/m3hMH+Y/oSUVZHulUALzP2PTm7SH8/yl5qJwaAj/EGId/W8qtnyY9wuGF7FyqsjMuJV99qTGrDF8FY9z06A6+4BR6b6pjGvRXMrhUkIhRh64ocpnCXYSCf7V+p8wO/93zo0x2sEZuLVTQQZ16DUd8Lu+P6bTjKsXbuuh+0FAwIWBW+m7RkX6SVFwVUgxXsieqtp30+Si+FOpIeO9EjkCOGOpJUaH6PUPPKP2SXKy0RJoPzv+aDe9/DiH5C3xoGLZbrG0k9cVgtxrZFGaqZQN9zYolRXGIuUej0UkY4xo5wYyaC5/s7Q8d+lAmB0HsLvonB6U/aLZu54bAziH/m1dejCJmOywt3LgPljiK7XD3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:39:43.0643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a5b982-77e6-4e8e-b75d-08de73996736
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4832
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,xs4all.nl,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53288-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E776C1866F8
X-Rspamd-Action: no action

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing DS90UB960
bindings and the driver.

Changelog:
Changes in v3:
- Rebase on top of next-20260223

Link for v3: https://lore.kernel.org/all/20251219122955.2078270-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (4):
  media: dt-bindings: ti,ds90ub960: Refactor port definitions
  media: i2c: ds90ub960: Use enums for chip type and chip family
  media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
  media: i2c: ds90ub960: Add support for DS90UB954-Q1

 .../bindings/media/i2c/ti,ds90ub960.yaml      | 213 ++++++++---------
 drivers/media/i2c/Kconfig                     |   4 +-
 drivers/media/i2c/ds90ub960.c                 | 216 ++++++++++++------
 3 files changed, 263 insertions(+), 170 deletions(-)

-- 
2.34.1


