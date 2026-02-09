Return-Path: <linux-media+bounces-52453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHQBAxwqimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:40:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E6113A82
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42BA530804ED
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E228B31ED6C;
	Mon,  9 Feb 2026 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LP34voku"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011071.outbound.protection.outlook.com [40.93.194.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2832B37BE65;
	Mon,  9 Feb 2026 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662160; cv=fail; b=ZUrsOMR8X1eNtUPzcqlFi5b2zLc7K2sN2xJyZHt7hX1HmVqvWVDsL9B2zWmyLRrC9x/ikT8b53F/ZGej4H497Zw4gNxkQJJ9w7BrbIpRaliD3urN4jA8cG9FNSvE+G51/QgNiL495x1yL+gjuo0ZoOk4hmI/DDt6z7X98EC1uck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662160; c=relaxed/simple;
	bh=+uTG3sq+fgEz5aHZHf9a4Z4Iygvu6EGOAaN5UkT10k8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjFX2SOi9XlvWthNt2rdLwJfXQxkRsBoGbL2dqijzVr0ncm2+WnEID/X/MnJNl6GgUp9sAV2o7B6tc6H5yFJgaTMo/u7hnfvvcH3SfJymrzrFETBcx9Hjx7NxB9C7Pehj8kgZbqHsjD9+EPutS6KtF4SrhWTcoqecTHtxRc5OFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LP34voku; arc=fail smtp.client-ip=40.93.194.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPuPqaarJz0OBwFhFZ/0zvGfcfZn/xiWJIYmJyJ+njjd75MRFElRf61n385BMtugObc3wj+piTm9HpeM6AL7atcNyw8VtZGTb4AbUZjX3vT75cndttGrfCiY5LqNTviRrcKBTh18rOBqkBfcCTAeOOuckHl9tl2EvOXt6Z95yx5x0/UDz1QNN2429zoTcECoRXbZFLe+Y4OVtWDkXHHy8XjNikptReiybWS3zyt8zXj/PTbB1T3X9aqVjGbXAoeKEMUcHLbWWnz/yfEk9OP95IKrfEk2hy3Jlp4zyIiuRmDJarF2Q+jsSn5zvuJDe5Psy5YdnlpRfg6sYTCzroXyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSN+Tm5gKQ1VWC6/UhyaX5C3HMjzj5Za4eZ2pHCaU18=;
 b=tn4e2Qq0H4pxToC9LeNvbUAUc1RX5Dy9OATT+Gq9QatddSGbWRzZxFnfBSNM80UuuuQLJVXpy11a0OQ2qWnB6mX0hA38HrIx/9GwbIDCg97RdnUsN+7CJi3STADe0vR+JwoywNBee4ekWKQZ+jjqF4xQTyjAnTrcHhBklaV1iiv0wzHcCgbNiUGN3rYruTOjGpZPRK7hH7WDd7mjIld3BMwOJurwaMdFJBanBstwCpkhomBliAFW9rzW4Pt0IH8/6JUdGH0SijWgITTJ8tlEy2pCiZw27YiVXXefxEvNHZRXL83imOSJ4Z0U7EZNm8s+w1/2WG/Fp3u2j2SHuDFXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSN+Tm5gKQ1VWC6/UhyaX5C3HMjzj5Za4eZ2pHCaU18=;
 b=LP34vokubjqnsqWwPjFzYIKjel5Bo3yxYLyCKmXfL6yD4U87A+UPDruuM9c0X5ruCeOSf5YruI6/p4wpLGxUbi+hWU924s6DN6UADTl2f2w0JmqMwMAwnSSfBbodiJT4Tmz01qbveh7Tn9rV54r00860D9o1IbRUxodB7NuH2hM=
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by BN0PR10MB4934.namprd10.prod.outlook.com (2603:10b6:408:120::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 9 Feb
 2026 18:35:58 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::32) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:35:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:35:56 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:56 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:35:55 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt42052904;
	Mon, 9 Feb 2026 12:35:49 -0600
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
Subject: [PATCH v11 08/17] media: ti: j721e-csi2rx: get number of contexts from device tree
Date: Tue, 10 Feb 2026 00:04:47 +0530
Message-ID: <20260209183456.1906327-9-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209183456.1906327-1-r-donadkar@ti.com>
References: <20260209183456.1906327-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|BN0PR10MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 78532149-abf0-4d4f-73af-08de680a1062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y2xIQV644ADQp9kl+srQS7zWhPe3hdVY5pJSUKSxDL7rpzP9zMChXlPFRkw1?=
 =?us-ascii?Q?3UuhAoaiAglcAfu7tncbRm+CNBwtpgCBsp6HxxRKifCmrSrOGuIkt/SqubpX?=
 =?us-ascii?Q?dCC8MBYv6n4xbbaM6st+fqdE7fqYrE+wXqXIZ4gAh2h9BT+fCuzgeIIKDUHB?=
 =?us-ascii?Q?uGAMIfI5n/Oa2jPEgT7Dfd5HWWPwFf51NfC/U7/a+Rt3P9tWN9uMYSfSXfAb?=
 =?us-ascii?Q?3zd4EoYNYSpiH0FgrcU9IeODjlfwe8iFK71RLrYQ5ogUv88j0Q0jLwE8taZk?=
 =?us-ascii?Q?I5ua5oMJeEJvVL4Vo7wPMzmXnKiAqHN/2tMK56Gz4gDgJ5TkJ2Gbe9Pp+oMm?=
 =?us-ascii?Q?hQw5CwbmBMnjpkcqU9FjM4HhyyYvAnXav8Mt4ofOQy0vTCGRuRQFiwiWoHHc?=
 =?us-ascii?Q?zhOvYMY243Y4rA0ncabHBcIujoWIpcyYnmqVIcOnVv8oD57EIR3403cCHhKO?=
 =?us-ascii?Q?h0e4HJBrG2D8BhLg46x8rIIUSIoC3C6wMnQUPIhdhewSYTXgR/DYZOIMVZMl?=
 =?us-ascii?Q?VoXGdN/YrxMOx/SoyOH6InsQ0pDUGRaXhrtb0Tdzvo5dDRXpmbikafqaeUru?=
 =?us-ascii?Q?tcp+LQVcNLAjMcPskXgBmZU2RFzXszr76HSQ7i3h56OUyJsrTmLUjWgJqH9y?=
 =?us-ascii?Q?imJx5OF1Z59yGl2fCW8jtEp/LU/3EzdiODS6zxnhsfzEllTGMO0XZkG1/iMb?=
 =?us-ascii?Q?XvDz7FHthPHcfsmCniFwLnwZ4GE0BnuA0Wfn9youRsI7HC95YDVpMT/rAg02?=
 =?us-ascii?Q?IExUWbcVs2mkxz+HFkOAtRmTuDa4IPyZi4EY4PENsdHA6XSOWY7jDWkEjwXW?=
 =?us-ascii?Q?Usfb5JMyWhKlhUuLkoBqUWKh3vd4IO7b5l6za3jYSARjCbWpLao7hXymrNXj?=
 =?us-ascii?Q?KZjiCqT/uoELL7il0gKkeZLtwc/YysXFrtMditRToQw52UbSsmZHBuqNSUf1?=
 =?us-ascii?Q?2g7N+Ohwoz3z/8RhdbM2EKT9cQsbf4WfI+1KVljCUyxzKYiz0+OYAfN0cd9u?=
 =?us-ascii?Q?3iTeAcdpdReg5/ozXhmE2KncrZs3EKAWoAc8qhkUQbREzpbiBMe3DREZN+mf?=
 =?us-ascii?Q?F87LVpevn26qVGJqZaF7PQWsybZPanNoxmmkbhGUoT8b4Z/rBLeSSsC9865c?=
 =?us-ascii?Q?Kn/krD2+ufFUoAf9ECXBrSrcFGqsfhOtM2f/pmIOpDe41oYF6k/ds2UPTq40?=
 =?us-ascii?Q?NDNW1LL5h0vwgpLscZsF94xg06IDW3b3m+MNGNIkGgFC9eb2u7ukkMpZ/9+a?=
 =?us-ascii?Q?OV3auJe9bgoOyr8iliFpEB/C5cTk8frIMg6IPVcLsj0E4/5pQFAU0CaaEY+N?=
 =?us-ascii?Q?Z0BT+g9y6n9LGnBf62FK8xY7CBGIpsqpTfjIM8D6ADey5+z1uhjDaYPTTXwr?=
 =?us-ascii?Q?fQWDMggUqjWtyvbcVYoUwVnKP2kAWDz8h+OpsFNYrNxfU99FY42kkmUiBTIJ?=
 =?us-ascii?Q?SccJD59kEzgZ/UHgYKJx0JrPW7zt/NXyhNzSw1kUA7JvCXDp6uizf86oW2qz?=
 =?us-ascii?Q?nLfOTUNjg+mRj+fKuKhX9cnLyuJcbtrwKP3CMnUrTjxGca9wBZUVLx+iAbJb?=
 =?us-ascii?Q?ZKnoZMOJsXrFcmNyb5Ev2/thrwFRQSn8Y6QGKY2u/+CJeKQGFMnFkl7ojF3X?=
 =?us-ascii?Q?0ZmdTk4oIuIQyvgLXlPhwFHgHCn+Yv+n37ll7ukPvEwBpfLLk6k079MsQ7ve?=
 =?us-ascii?Q?GSjwPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K2uHyyWpJRoM4+Db6aUDwm/kQ5O+DSQvroM02I7r8cAXwU8hGarrpIWFnhGK42J0tCDkulGOF38FfnU+WM7GMm79QEmzpmGwtokw5y6MMoJ9zZwPTgP5MMQP0+iQey81JoTdlM5oDrMZz4y55bSd0hN19PRkT5N6IDwgpIDLR1DcyIBcU6v1fz5dBmvqGanFkkmmEj2ow6GF2y94CE1nJspD4uZzmTsNMhPvMMhDLwPoVdBlnXC231VK4GSVLP5pgXTphmJ+5gdOW5NOVlq/sIEjl3YTcGiubzYnHpWZi9ykQ2BA8+TWfBztDHAtZFLcypDYdCUlyVl8fdl1IMS3E0iIGblarHtods7GkrovLd01u5LLAN4MplycTSp4w6n2Dps1vUXqWS8JMLrOcnoiQm4YgjYOSjgQM6ehs5XPipRTkrQu0y75/+dIUYsR/xuO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:56.5700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78532149-abf0-4d4f-73af-08de680a1062
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4934
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52453-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 561E6113A82
X-Rspamd-Action: no action

From: Pratyush Yadav <p.yadav@ti.com>

Different platforms that use this driver might have different number of
DMA channels allocated for CSI. So only as many DMA contexts can be used
as the number of DMA channels available. Get the number of channels
provided via device tree and only configure that many contexts, and
hence only that many pads.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Co-developed-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 46 +++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 8b29aeac7c485..5fbadfcc8ce3a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -43,7 +43,7 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
-#define TI_CSI2RX_NUM_CTX		1
+#define TI_CSI2RX_MAX_CTX		32
 
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -56,8 +56,8 @@
 
 #define TI_CSI2RX_PAD_SINK		0
 #define TI_CSI2RX_PAD_FIRST_SOURCE	1
-#define TI_CSI2RX_NUM_SOURCE_PADS	1
-#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+#define TI_CSI2RX_MAX_SOURCE_PADS	TI_CSI2RX_MAX_CTX
+#define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
@@ -116,14 +116,15 @@ struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
 	unsigned int			enable_count;
+	unsigned int			num_ctx;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
+	struct media_pad		pads[TI_CSI2RX_MAX_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
-	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
+	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -458,7 +459,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 
 	/* Create and link video nodes for all DMA contexts */
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
 
@@ -1250,10 +1251,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 
 	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
-	     i < TI_CSI2RX_NUM_PADS; i++)
+	     i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
 		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+	ret = media_entity_pads_init(&sd->entity,
+				     TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx,
 				     csi->pads);
 	if (ret)
 		goto unregister_media;
@@ -1344,8 +1346,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct ti_csi2rx_dev *csi;
-	int ret, i;
+	int ret = 0, i, count;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
 	if (!csi)
@@ -1367,11 +1370,28 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	/* Only use as many contexts as the number of DMA channels allocated. */
+	count = of_property_count_strings(np, "dma-names");
+	if (count < 0) {
+		dev_err(csi->dev, "Failed to get DMA channel count: %d\n", count);
+		ret = count;
+		goto err_dma_chan;
+	}
+
+	csi->num_ctx = count;
+	if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
+		dev_err(csi->dev,
+			"%u DMA channels passed. Maximum is %u.\n",
+			csi->num_ctx, TI_CSI2RX_MAX_CTX);
+		ret = -EINVAL;
+		goto err_dma_chan;
+	}
+
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
-		goto err_v4l2;
+		goto err_dma_chan;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
+	for (i = 0; i < csi->num_ctx; i++) {
 		csi->ctx[i].idx = i;
 		csi->ctx[i].csi = csi;
 		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
@@ -1398,7 +1418,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	for (; i >= 0; i--)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
-err_v4l2:
+err_dma_chan:
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1409,7 +1429,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
-	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
+	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
-- 
2.34.1


