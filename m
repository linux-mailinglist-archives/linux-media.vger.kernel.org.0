Return-Path: <linux-media+bounces-53292-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ8VCbOOnWkXQgQAu9opvQ
	(envelope-from <linux-media+bounces-53292-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:42:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D793186761
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A59A53032DC4
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C5237F8C2;
	Tue, 24 Feb 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oxoc4LID"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34137AA72;
	Tue, 24 Feb 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933219; cv=fail; b=tRhEzMMLckrTaxOnU8hudSI+pSpBmbgvNUsv3WTbEsXabTk7DwpcLe0lPpgFvnWeXd9S7NuQYba6KM7X6d1KTvRAfXaW5KlL1bSOIaJUo4b8qw43lWE4ZDfx0DruofoXfO7mWe/YIOaELewxoEZB3vYem4AsHvzp+tVy1deNwpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933219; c=relaxed/simple;
	bh=oQWKAw5q6ep5v5qpYw+X7lUxv/X15mbSB+kjb1n8JlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xeal+YbqGXJcJP5ILc19qbBFnfcEOqLDEM/PZFgKTvpNBLXpflZzNSmoVX6/WJKeqKJAAb27kMTduziBTMOJ/mXhUQrh9k0vmOWUqiye4nwC4U8baWaunoT9tCAzJbAIUr1wBc8OGmXwahS1FXe/m5d/X+dRZpUDszvK+ub7DXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oxoc4LID; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufQknYeg3NeQRjG7rg0OlId5hAmO9m1TZI/AjbXSzLAgBf6mi0dsgSmdnKT5yEuT86ngAE7FeoD17krHPI74ntmGPxPAn2yKix5AjbaV6ak/jNklsTtVNItsy9ZY6BC0Oxc+7MT+2HhlG0gB/NXCE8PWmPB3vngw+YylupteGpKyBasZsaL/+6Nix41n7BtyxsB9SHevy6n0T9xuTccpgil4WK0sr4cYEoLQUJZek9qg8ev6s+0g+vYdY5DZj3h505UEfYyK1YbSg3/lFxX4t/yi+ORKJEmrqLCdqMvSi2vncY4MSGk4SeuV3LWVjJunPMAreUC0qBpUrgVly3JaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YBkRCnMNJTRF8BKV453P2jZonFe6yjZGzVwU7059Gs=;
 b=PIO1XUW5/Hsn+ffmoF37Sz49+QoYvk/2KB5sMnCxEArTeCnwU3e8thC983vMN5CkSuauSKd36ic4S1p4GbOh4xbWZ6qEWZMDaaSBhI0fQf+gUZI5llEC2OuJeGx11B+8rUewKmoth8iPnPkwz1+/8cIpqgIy02/F8vGjpRcCaJBz9vqRhnfBOex8p/b4svzSn0lFNvKgAyIhrKAN8lBmnidqXit37gHp6+k1RXfs8Xja7SZ7NL+O6ICgJOMK7Uawiut5uwQVqfGvOIKt5B6TW/ikRcta+jizq3968BgKU5M7Pr96CQtpf2fJ//uBisPj9rxcG0wEiefAmRXrKPJDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YBkRCnMNJTRF8BKV453P2jZonFe6yjZGzVwU7059Gs=;
 b=oxoc4LIDG0ej1KlwzMGlXAEAkovnQLhZIq3u/sADv1IgRWje35FU7D8+9QkyjXRMRL0RaUjxGbT7xcucIPvG2iyZYkWcu1k9qyrcduC3VCByG8mzrmnYsphVJIoY1yNJlkw31xXkW9deBC0DdbqDebFuTjo534SgMaox7QG7tUc=
Received: from SN7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::33)
 by CY5PR10MB5914.namprd10.prod.outlook.com (2603:10b6:930:2e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 11:40:11 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:124:cafe::bb) by SN7P222CA0010.outlook.office365.com
 (2603:10b6:806:124::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 11:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 11:40:10 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:40:10 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:40:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 05:40:10 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OBdaF32658018;
	Tue, 24 Feb 2026 05:40:05 -0600
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
Subject: [PATCH V4 4/4] media: i2c: ds90ub960: Add support for DS90UB954-Q1
Date: Tue, 24 Feb 2026 17:09:24 +0530
Message-ID: <20260224113925.19983-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224113925.19983-1-y-abhilashchandra@ti.com>
References: <20260224113925.19983-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|CY5PR10MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a28217-ef31-45cc-86d8-08de739977c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TcioY/3klFbIAyXzaktsevCZJT3o/MFBBdQ3f7Lt0tp8zLiVLwJ9YbGFcHbn?=
 =?us-ascii?Q?8nk8fld5U9eJtEtFTfW+uG9tymFRgELJlOJdP62coL5QS513aT9K6BG6p0se?=
 =?us-ascii?Q?r7BC2gN1/XzGuixsmP0ZqvpW6MBFcxwPtC9vSJaEs6PxSrEGoZvLUsYPGXwm?=
 =?us-ascii?Q?mbaFOkW4+Cy47Ahr069oQ723LPnYaiAqC/nCI+Z+NsCOY7nVh85/lK/6U07L?=
 =?us-ascii?Q?nhF0nK7Q1tYv1RkjO9ns3/YRG4nuEPRk31g6hpq+wh/kUDAQzxvxxGKSKjqF?=
 =?us-ascii?Q?k1VirERPYh8VDAHBv3voLXfD/eELcW3JpVWyuSJ3+2E2V9ktqY1cunwv4c5L?=
 =?us-ascii?Q?yjh5fq0mUnJrOKCXHf+NhsMbUAuYQdjqRmIOWDTnLplep2Yvz59/2Q+xdUqb?=
 =?us-ascii?Q?SsHCz6VOkxX+aqWzXkce1m8mwdjOn2SvdjMAgODhJ/ywoOqXu4ip2VONfhQp?=
 =?us-ascii?Q?eXGJ7WYTspQwHiukvRqacrY7hqEClHUiWRGe87sqAPEu2EvsDF+FJsmvw33Z?=
 =?us-ascii?Q?2G2f49H+3/P4QpCV1v3U8jcmMjCAdJ3aFlogHWW9d2X4rnmBGR7k6o7lGaeY?=
 =?us-ascii?Q?oM0mmTvnLRIvXqAWNGikR8BMgB+KmgNPH0vieseX/l/DDBzELhIrp4ivcxXb?=
 =?us-ascii?Q?ijoXMqYek4jwCt9FLCfOs9TTDihmlK15ITALUydEykHiuK9Nka9cI9x0g9Vu?=
 =?us-ascii?Q?vM/lUzEFRiqM5CvkSFunCATZssH2JrDUuY2r2MlTw7TVPgsTNGlTgKEBxcI/?=
 =?us-ascii?Q?ZC0tt4hw4y2dGwlHULOLN+QCHx9+DGP7yNho+QRnmhnjFfNzCSQ2pAG1Qzf9?=
 =?us-ascii?Q?1akKXeBM2/cNZcFIBO21myumWsVNlSgGVqDMGn774vQZD41IsSRjU2vxo+OE?=
 =?us-ascii?Q?Bh5VcUSSZRYiEEZCADsrpEEkSgZFFQwUPWxQ0ai/3VB710B7rC+rM9lIa4wS?=
 =?us-ascii?Q?IfeXUW1operKdV1PutEB3vckwvhHb634p1rTqlkPywAsvRChTa0l6uQhlmo6?=
 =?us-ascii?Q?FMkR1Gav0/V3+D2TP9mV9EaNS18WjrZ4X4Z2mOWBMp4YPEGXpI4V9NvpDmUY?=
 =?us-ascii?Q?mzRquYec/YQFhJJAgxKP1A1Pug+7BmnlCeVSMSeGg9qQqQ/wsVe4ilkUmK7E?=
 =?us-ascii?Q?tzQTRyejnoB4OSVlwft60C5+OHSJsy+S2BGQwe3HE4X9mBVT9RefWUrfSt9y?=
 =?us-ascii?Q?8xJmbrohfXrkfp6exePLFuHj5D6Hbz+V+5g+IesX4qdIxtAamhByqlMYPAQX?=
 =?us-ascii?Q?rW8p7IOMqihaLolJdMGlewv4Eow37ts+6jeVlemQINmR32HlqG8Jj/s906KR?=
 =?us-ascii?Q?SvQpPMhMBpZP1bf46pvy8aEUs3NlPP2i5asSAkyJxu/pYsnw7Dr5p7Wwk0HV?=
 =?us-ascii?Q?jNUVTpilyTlEBsn/CYc05XkFo0hax/ro/6QqHLLvvgIQA41FEjYA60lGdiTk?=
 =?us-ascii?Q?isLjJOh6rPEDxe7GX3hY0OwwmMwtiCDCwO4bDbXlNPEUaZP3+mdcDPCX/Cbj?=
 =?us-ascii?Q?8P7flc9yUNK72Mc9he7hxuCzjDHF96WpOw3KUBskig1A7rj7S3xdKoOwwvyA?=
 =?us-ascii?Q?MLW5f6ZD7bFEiyTUpBXbPJf+K7Us1kj+U3pA1IrEPTDWsMwjbqIqs2Uo6qCQ?=
 =?us-ascii?Q?XdGaqI6pELm/oRzQ68E42GG3OuLEGsPG23muYcq92Scckh6NuD9cDpskJ4Yb?=
 =?us-ascii?Q?Ls+tEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RgpsR/6TOGEoeLal8bTqfN4BrKuyzde3yqbD+AdHt73ByNURGbzvUNX3ZLlrtJlATTNGHC2wRvMsZVIPpspmpYhwBEweMAg8Xd0wKQT1iXWW6XV/cWlUcalpzGmOTz2laGHID2j6iyGIK2cPTX9DGvXaz15Ikhj2KNyE1E7P4XL0cokNTO9RRkKRVs3tt9r22tQ8EpAW03yChvbFHlSKPYq30v/gFRRtQW2X4qnLEqFVfsc6WrmgL53Hw/S9M3M9TtWAwTy18qietvTfmQxtZripavKhOSjjNIMMxwdddpPAL+ghC+mXlvNCRjH7tijXiXcoIvOkkhm/2IUB/SVm710RImuuCI4rwLiqVZ5VQbaZmPjKmVDkBoK1gpwlu5b9Fal6KLkvqY0UP5LlE4kz0L0am/MDgbMHen6uXOZaLQf9vkU8qUDPexhR+hYxvaT2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:40:10.9164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a28217-ef31-45cc-86d8-08de739977c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,xs4all.nl,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53292-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ti.com:mid,ti.com:dkim,ti.com:url,ti.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8D793186761
X-Rspamd-Action: no action

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports half
of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX port.

A couple of differences are between the status registers and the
strobe setting registers. Hence accommodate these differences in
the UB960 driver so that we can reuse a large part of the existing code.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Rebase on top of next-20260223

 drivers/media/i2c/Kconfig     |   4 +-
 drivers/media/i2c/ds90ub960.c | 182 ++++++++++++++++++++++++----------
 2 files changed, 129 insertions(+), 57 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c4a5006e8c72..c88b34a1aebf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1736,8 +1736,8 @@ config VIDEO_DS90UB960
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
-	  Device driver for the Texas Instruments DS90UB960
-	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
+	  Device driver for the Texas Instruments DS90UB954, DS90UB960
+	  FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializer.
 
 config VIDEO_MAX96714
 	tristate "Maxim MAX96714 GMSL2 deserializer"
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ed4d6f786e15..97c2b9352833 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -396,6 +396,13 @@
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
 
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_DATA		0x08
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(7)
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(4, 6)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_SHIFT	4
+
 /* UB9702 Registers */
 
 #define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
@@ -455,6 +462,7 @@
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
 enum chip_type {
+	UB954,
 	UB960,
 	UB9702,
 };
@@ -1001,6 +1009,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
 
 	lockdep_assert_held(&priv->reg_lock);
 
+	/* UB954 has only 1 CSI TX. Hence, no need to select */
+	if (priv->hw_data->chip_type == UB954)
+		return 0;
+
 	if (priv->reg_current.txport == nport)
 		return 0;
 
@@ -1425,10 +1437,11 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	priv->tx_link_freq[0] = vep.link_frequencies[0];
 	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
 
-	if (priv->tx_data_rate != MHZ(1600) &&
-	    priv->tx_data_rate != MHZ(1200) &&
-	    priv->tx_data_rate != MHZ(800) &&
-	    priv->tx_data_rate != MHZ(400)) {
+	if ((priv->tx_data_rate != MHZ(1600) &&
+	     priv->tx_data_rate != MHZ(1200) &&
+	     priv->tx_data_rate != MHZ(800) &&
+	     priv->tx_data_rate != MHZ(400)) ||
+	     (priv->hw_data->chip_type == UB954 && priv->tx_data_rate == MHZ(1200))) {
 		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
 		ret = -EINVAL;
 		goto err_free_vep;
@@ -1552,22 +1565,35 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	u8 clk_delay, data_delay;
 	int ret;
 
-	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
-	if (ret)
-		return ret;
+	if (priv->hw_data->chip_type == UB954) {
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
+		if (ret)
+			return ret;
 
-	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
-			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
+		clk_delay = (v & UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
+			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
-	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
-	if (ret)
-		return ret;
+		data_delay = (v & UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
+	} else {
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
+		if (ret)
+			return ret;
 
-	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+		clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
 			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
+		if (ret)
+			return ret;
+
+		data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
+	}
+
 	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v, NULL);
 	if (ret)
 		return ret;
@@ -1588,26 +1614,49 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 				       unsigned int nport, s8 strobe_pos)
 {
-	u8 clk_delay, data_delay;
 	int ret = 0;
 
-	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
-	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
-
-	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
-		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
-	else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
-		data_delay = strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY;
-	else if (strobe_pos < 0)
-		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
-	else if (strobe_pos > 0)
-		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
-
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
-
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+	if (priv->hw_data->chip_type == UB954) {
+		u8 clk_data_delay;
+
+		clk_data_delay = UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY |
+				 UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+
+		if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
+			clk_data_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
+		else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
+			clk_data_delay = (strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY) <<
+					  UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_SHIFT;
+		else if (strobe_pos < 0)
+			clk_data_delay = abs(strobe_pos) |
+					 UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		else if (strobe_pos > 0)
+			clk_data_delay = (strobe_pos |
+					  UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) <<
+					  UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_SHIFT;
+
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, clk_data_delay, &ret);
+	} else {
+		u8 clk_delay, data_delay;
+
+		clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+
+		if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
+			clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
+		else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
+			data_delay = strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY;
+		else if (strobe_pos < 0)
+			clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		else if (strobe_pos > 0)
+			data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+	}
 
 	return ret;
 }
@@ -3643,7 +3692,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (priv->hw_data->chip_type == UB960) {
+			if (priv->hw_data->chip_type == UB960 ||
+			    priv->hw_data->chip_type == UB954) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
@@ -4177,33 +4227,40 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
 			 v & (u8)BIT(0));
 
-		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+		/*
+		 * Frame counter, frame error counter, line counter and line error counter
+		 * registers are marked as reserved in the UB954 datasheet. Hence restrict
+		 * the following register reads only for UB960 and UB9702.
+		 */
+		if (priv->hw_data->chip_type == UB960 || priv->hw_data->chip_type == UB9702) {
+			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tframe counter %u\n", v16);
+			dev_info(dev, "\tframe counter %u\n", v16);
 
-		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tframe error counter %u\n", v16);
+			dev_info(dev, "\tframe error counter %u\n", v16);
 
-		ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+			ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tline counter %u\n", v16);
+			dev_info(dev, "\tline counter %u\n", v16);
 
-		ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+			ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tline error counter %u\n", v16);
+			dev_info(dev, "\tline error counter %u\n", v16);
+		}
 	}
 
 	for_each_rxport(priv, it) {
@@ -4269,7 +4326,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		if (priv->hw_data->chip_type == UB960) {
+		if (priv->hw_data->chip_type == UB960 || priv->hw_data->chip_type == UB954) {
 			ret = ub960_log_status_ub960_sp_eq(priv, nport);
 			if (ret)
 				return ret;
@@ -5029,6 +5086,11 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
+	/*
+	 * UB954 REFCLK_FREQ is not synchronized, so multiple reads are recommended
+	 * by the datasheet. However, a single read is practically seen to be
+	 * sufficient and moreover it is only used for a debug print.
+	 */
 	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
@@ -5188,6 +5250,14 @@ static void ub960_remove(struct i2c_client *client)
 	mutex_destroy(&priv->reg_lock);
 }
 
+static const struct ub960_hw_data ds90ub954_hw = {
+	.model = "ub954",
+	.chip_type = UB954,
+	.chip_family = FAMILY_FPD3,
+	.num_rxports = 2,
+	.num_txports = 1,
+};
+
 static const struct ub960_hw_data ds90ub960_hw = {
 	.model = "ub960",
 	.chip_type = UB960,
@@ -5205,6 +5275,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
 	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
 	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
@@ -5212,6 +5283,7 @@ static const struct i2c_device_id ub960_id[] = {
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
 static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
 	{}
-- 
2.34.1


