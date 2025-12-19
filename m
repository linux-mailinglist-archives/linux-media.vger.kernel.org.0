Return-Path: <linux-media+bounces-49163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96308CCFD1D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 270723043D63
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3B71C5D59;
	Fri, 19 Dec 2025 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u6k05+cx"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCDA32938D;
	Fri, 19 Dec 2025 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147411; cv=fail; b=qlzLd+7A2Or2mVjU0nyHXoa1i9AWJLQj2N+BRQwIftjDFl48NMhmvs8hRDvL6PJu3Dld+AuSkRxEEznQff/HzLF0r4R+kE0PIYOt6sPQdhqFN8yjpRMUHRkQcoN4XlQD9xEL7tX9MOb/i5G+S6t3kgq2d8ADW69GARSYBB09OvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147411; c=relaxed/simple;
	bh=1wSoQ56NuJr9k3ko7WRsVLcoeZNcAd7R6M5ujdmwsvk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cCBhAo+k1L2QLJCOYzQcQnrIplcSEsHSQ3LjUAbkUTeJ8WSdN0Xli9YNruih9ypurXYVhba+Vc0l/ylxkLEcQR39QIuBpz+zIiBXbcewVuB4c6hdsCYQFng5RaOg0VD/cdMy6p1cSyyuV6kTKkIhbQp6u9WK4yHHBZke+GP/+Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=u6k05+cx; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpJz83u1EJMyJIVDN/I8Xt25d3VACsETvxtZUdv/QBwXqJwtqK2U5upvpHq/TbhrMIJReldZxt9vO52IzZAbYOPj3w8s45p/O3vefi0RY9AzUEhYk9ga9GDDIwNQJU4hIFi6HaVbT9siyPy20u5A1JTdCt7SuYnOpo9ONEDqkhska73ezVnS14RqSsMCOqDvoaKlmv4+ZLAHM+YApwiczC+2SXWFYfl+zQaE3huCDrA9jxvpiZePG7Yst05uNJ9kJezfKOA887zpPT/BovawchU4TUVXcM7ZuJ2UL+s5RR3EYf+k9Na7dbKpDw+nK7k1aI0ous987WbXHoCxyuWxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAuewyw0THultDlMhhHQ1WMR7u5jw5THT6yZqlpAx8g=;
 b=ePnnOK9ufFJoovVh7Rgq+MbP1Tp8CcLOxPLmjRO0M57wxy82hCu9Qf9WZETfAL+Z76478nsm17n8Z9XXMz27rgCKUrZ45xoKij7zysDpzbyw8A63FOc/H1J3/qSm0DMIms71R4Ci+FUfPXLPXmXC4iQZE/k8VlOVnwJ71ABYN2WivXdfNWsM7U4qRruSDXL7uPmW6aLDlUcEVv9kkW9vuPleAetvas2OlfvpWZTkeVE6hx9jmAWf6GLg0jBlb5yeW/98JAUJ+ArIGx0gSXfhDcfPkNEAsQSaMZ3np5nBEJGHDISi9yWe/gENTBRpw+gG8ZzuuXvBL8I5yWNoncaNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAuewyw0THultDlMhhHQ1WMR7u5jw5THT6yZqlpAx8g=;
 b=u6k05+cxtQAy/ROHapFtGv6C9j+xZrsiocxu/LKkHPBKx+Kuq4ZH5zLoCXUI32OIQXOBWhGurRZJyGZWYU1TKTitAJs841Q4Ha3x0/6xgKC15kgRI3fTofh8T1+TyDssRQeT3jHhtlVxcuAfQTI3dkg8zZ8WnbqpCFmrGKu/9c8=
Received: from BL1PR13CA0188.namprd13.prod.outlook.com (2603:10b6:208:2be::13)
 by IA1PR10MB6028.namprd10.prod.outlook.com (2603:10b6:208:388::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 12:30:07 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::ef) by BL1PR13CA0188.outlook.office365.com
 (2603:10b6:208:2be::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Fri,
 19 Dec 2025 12:30:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:30:07 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:03 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 06:30:03 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJCTuJj918224;
	Fri, 19 Dec 2025 06:29:57 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<y-abhilashchandra@ti.com>
Subject: [PATCH V3 0/4] Add support for DS90UB954-Q1
Date: Fri, 19 Dec 2025 17:59:51 +0530
Message-ID: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA1PR10MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: fe39a836-1ce9-42bc-d1c8-08de3efa57f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M9qb3UD5ANeGUA+9MFIyCWrIvm5BZWrJPhjzdRqRuPxI/zvMJuHrKV2eRzM6?=
 =?us-ascii?Q?bxFh2tHZbxVzPEQAgVl7f5H2oszlu23w//uPJXhjZrnzJON5JvC1Z4KCQfia?=
 =?us-ascii?Q?KpzV00zwn5/oZhzUr8cYjB8fekZsM4bof4nkKd+HZMmWIAWnwspI1FgPgUNg?=
 =?us-ascii?Q?yS3jVw1rsEtLORm93HuDgdBrKFs+8/AB8JkatS+oCCctTUr94SCL88ITtTHQ?=
 =?us-ascii?Q?xOM/3mUwFrrTFN4CUrVkRPb7d1/j34p6pqBJDMNe7THLmJL3sTwgt+mCsTKr?=
 =?us-ascii?Q?UJzaimeJPyhGAEgJKjV3V3Dbi0/zDJ76c3P+3n3TJRlrhfQIsBbBIZC4Fbm6?=
 =?us-ascii?Q?w7FGXdTNvDLwU4yGp098CwuVvvtQV5lWeY8c7/n8MrbCn4Xl9iMCcVRFDVfx?=
 =?us-ascii?Q?bI4wCQ+negABng04+tLI3Jhd6o940/uzxH8WUYReUOF9neBbERRGua2WpTpg?=
 =?us-ascii?Q?5fmYjr6YunWPEIwDbAQXw4R7OtONlIRUOnmB+AZUPxhgodIBK35w2cxuX8EI?=
 =?us-ascii?Q?qTjvjpmK5/YFtV89GKTpJA/j4oT1fmcmuu0RvTinVtBnG6O27lqS/cKi6AtY?=
 =?us-ascii?Q?KLvoj3ENMRTxtJLB4qNw01BwXBgPXQTTGDWR6mHDaADU03Cgzp3zVNFtVoJ4?=
 =?us-ascii?Q?j8Sm+ZzBlW5wQo5g+vO9yYjLkD3bTP4g6rmkRnuD9VOQ+TyHONHpQAPnz5Z6?=
 =?us-ascii?Q?ThFK4c6xDp8UR0VueR+WFtZyl3MG/UeYe/P1nOARribi5ZAPAN3LouSTEb9K?=
 =?us-ascii?Q?0n2+QFhX353cL9+SXuA6NytfxAOieR/cn1RiKsgQrWk6DiCXUL5VKyZawvck?=
 =?us-ascii?Q?ydGTwvRwrsgMLuhYwFFIgbfEr7/F7lgY5uuLN45L1HnzWGdv1ZmtLP4jac9h?=
 =?us-ascii?Q?hXZk8uRu9imjFMLeQ23ikSdo8rT4sBmjWd5RM2sPvTv7bl59mPbwHmj5+NlC?=
 =?us-ascii?Q?Act93+maeUa55HMAuEn2bizoeG2aYH8DL+LvK51VUH7Ctujv8AEPgjjF+GLP?=
 =?us-ascii?Q?CMWz8PYAAlFkKkdxKEyJJVBxXCL6CEH2oTPLShbGUM6N7OLTR+laifq2+avK?=
 =?us-ascii?Q?/cKYiGB5BQNGa02Zx3iLzNTLEusYH9F/dA8vbiq8QrZu0XV79v5P4NFaCpe2?=
 =?us-ascii?Q?hLLpoJWfb6Nzg7V4hu9NP7C5kPZcpPo4v+wUudFpi/0/WsnKurM1dPpad9Hq?=
 =?us-ascii?Q?IHqvoa9RRParBgODYD+fGny99XYwAbQIU0kuPaC1m2aD9ZIpANi2oHQCX/NM?=
 =?us-ascii?Q?aQc98REpNTSmQmfM6IyFmo6SoWQebSBq2xKCm3Ga+ca+t8ChB2cSHWDn9EF/?=
 =?us-ascii?Q?A1KAgJdR/98MIdBislp4tBybNOfh4nF415C0ghAD/sL2JXuh4fkq+Mx/Gg84?=
 =?us-ascii?Q?CRqk/+I1Ajd2DXkHYwKNr/QrpUCTFomRJnB80n+/oOt5NVU3shbXFTfDiVAe?=
 =?us-ascii?Q?ztW31VK3FuYTvK9FsdmVOjsR/th/ne1b06pkThDoa4V33AV4586vjp4IZ7py?=
 =?us-ascii?Q?RYH7ab3P6lZJe3kDKK02BDWOMvyJU2bnU3Pv99tI33cGBYfLIyhzNcZ5Bh02?=
 =?us-ascii?Q?ome1M8/pUWFTvSU2aWg=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:30:07.0816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe39a836-1ce9-42bc-d1c8-08de3efa57f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6028

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing DS90UB960
bindings and the driver.

Changelog:
Changes in v3:
- Remove the '|' character from the ports description since preserving formatting is not required. (Rob)
- Wrap the ports description at 80 characters. (Rob)
- Remove the example added for DS90UB954, as it is just a subset of the DS90UB960 example. (Rob)
- Change conditional checks to check for applicable chips over negated checks. (Tomi)
- Keep the model name in the ub960_hw_data structure and remove the switch-case from the probe function. (Tomi)
- Remove redundant reads and writes to the same register. (Tomi)
- Correct the bit positions for data delay in set_strobe_pos for UB954. (Tomi)
- Address a few minor nitpicks in code comments. (Tomi)

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/ba055ea9fd2c559d0bd939c3da724e4d
DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/1092d51ca809bfa494449e6d7f06df73
(No errors related to ti,ds90ub960.yaml)

Link for v2: https://lore.kernel.org/all/20251202102208.80713-1-y-abhilashchandra@ti.com/

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


