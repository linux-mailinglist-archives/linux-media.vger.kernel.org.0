Return-Path: <linux-media+bounces-52460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFsGFK0pimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:38:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1896113A26
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3C35304D124
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5143A1E94;
	Mon,  9 Feb 2026 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UQ5Hyim1"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013056.outbound.protection.outlook.com [40.107.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BA93A1D05;
	Mon,  9 Feb 2026 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662210; cv=fail; b=eg1EntHXUum2d16/i6o34OPgmC2g5SCka4zgFSeso1Wa3cq0HFT9l6uCUvGcmEwJ9c6Ghr8eoI4fWoKdxokOkQp8/24sTGJhggSXG/+CkCA6+EAUeWztQbhWS89y/bmKJ9ZdAMuNGRotIkbZ4bLuq2qhuiEfwLkSVgjFghyCjfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662210; c=relaxed/simple;
	bh=Emrsvc2fQrq9w3u3/wua3InwnKbMSxntVTEA2sz8JQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsoQ7p9or9Utleij4U4BekHMlRjJXPs+1FmT6e80mfOZ8u2wZ8WBcJXxtJmcVhKT7uglA4FoHSUfqVZHCw2y4llizavKlDktl5wu2aX6EPCX3AKzpe7n6Puy+09efE0b3I2Jicv8gf6AR5KbKdgT7dBVOsrVI6MSixBSvjjPnC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UQ5Hyim1; arc=fail smtp.client-ip=40.107.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ed/VcPhVpC3s2kfkhQWOHe8XrLbmOZq18RInhLuOndqyy4/2NsPL5mKEVxuujiwFY1udASAf8gEEfzfSQVf6CYsL+9oHD0c/3Yfrb49ePnNEAjRENMGHGk5gziu+CBBQXhpQi+ec1kTaMxMOiFSGjy5YzEeUkP9wSNPu6TZLuR5MNmbP036W6UC7GntBG+zy3oQl+QV+7JjyW9fXgF8Jp76th/ajZlSTP3J9PfIRqFFrkqCia/J9IBBZyQcKBAB3AKTs3npMZHBSo/ZQPsOk83OHidTR+mi3CMjUCxMC9tHcfT0fDW8/bs52jgKvL323udsSdM9c7GXc8fD18IPEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVUHTzGSq+DUecXAoKien2prvgKA84n0KTS5YvenEmY=;
 b=v6ucK/4Okm1y7LdEqHVjXoFfJJWkkjHTA99pn8s1r9z5u6C7lNSa+73fmwvXyA2hxedVnMZR7ddLooJ745FJkD2Yg2/3QS/2y5jEcDeMs3MVRuzd2qIHmAIXQ/LoiUpuDiczIcktWudXv9QOo7XcjZnpkpJSw9LmureN8jG+p45f1I0QMckNJNX9yJjIB1+YZNOebQ+Zauye8EEWZ20BmgHaxHa2/SDAmX6radDhObV4OcdrYr3VyJ7pTjexzci8RVRPsczs9cA/PrcBNemS75nN8DSN7tVPwc731O9Dj+iV4cxxEj9mvahjbD/wXm9BSI3FkU6xOwTi7f4+/TDB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVUHTzGSq+DUecXAoKien2prvgKA84n0KTS5YvenEmY=;
 b=UQ5Hyim1C+/U+YqztdiRIEpv0eRfyk1/F6rEnZVGBpGTnCEqFsrOXTpD2iNIlVOqYU26Eeu2JKjSSvDtxLZ0+7M+f4B/U1q1EcMjAOh09LNIFBWg6PrZM7IPFDnTio36umB9zt1+bHUDVhr9ofTXvIkCgFN2CNN5KraZmLpfvjU=
Received: from SJ0PR03CA0296.namprd03.prod.outlook.com (2603:10b6:a03:39e::31)
 by CH3PR10MB6763.namprd10.prod.outlook.com (2603:10b6:610:147::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:36:47 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::13) by SJ0PR03CA0296.outlook.office365.com
 (2603:10b6:a03:39e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:36:46 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:41 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:41 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvtB2052904;
	Mon, 9 Feb 2026 12:36:35 -0600
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
Subject: [PATCH v11 15/17] media: cadence: csi2rx: Support runtime PM
Date: Tue, 10 Feb 2026 00:04:54 +0530
Message-ID: <20260209183456.1906327-16-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|CH3PR10MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bf0651-98d1-4578-2df0-08de680a2e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GKxBJFGAdyvIVHWhIzsSIoB9qrUQGkEDKffn/7avYwtic1pA22ueHd9hHDtE?=
 =?us-ascii?Q?uDSJp1NpNIInz8zw13MaAx+Qqubb1M8Pyc8dhtyhiaV1eVQBgkRrBp4ftWCi?=
 =?us-ascii?Q?wglQ1ksDR2Rqn2TnIfo3k9KoYIn8P3ojXDbiw1kGJvo/DGNb8xpQHRUIJW+P?=
 =?us-ascii?Q?Z8l3rDQxcz4UGybH5hsdgWL9wphntzYKQxVAK+S88q/I2MqIGroFOBM52YEN?=
 =?us-ascii?Q?ztBycytQeJ+YXGJVXAaimyzk25uZwrXYISjUkY6EaML7mPQTuN05K2D551gX?=
 =?us-ascii?Q?gioYoPK2JWYgiMxUYSiEeVfRnvcbyyjy68U5VRjRnfoB3AMsJfn/0dLIYPtj?=
 =?us-ascii?Q?62IPsWfcGx6wF4X+f3gNmPM6huBac15uydJTs6ua0PPddSt1YQ1XLrL5Yuiw?=
 =?us-ascii?Q?i6ysvQL//zPRYRhYlE1gtoSpayESZgoJKl+l3GhF7JyVvlfoH98OzCzKLD4Q?=
 =?us-ascii?Q?xZwUkD0MlapvNmEpFgd7xkHTVXqAiLpP4DKnbgcgEoI5pmhMP45doCCqicM8?=
 =?us-ascii?Q?Zm6FMiYyDBJvmvoUgaCh8SYpp5mDMqAOzmOgJdEiPKNb7FGDN2Ev5S+4VTpO?=
 =?us-ascii?Q?g27X8x17fKQGh+zVXhwcySHWqW/E9sUlDshiPolRXaYKgP0+qX6W7LOQfazj?=
 =?us-ascii?Q?PUXUc64OjHqeH9YuZSv5Ixbd0ldSdDLAO3kFDT8uCu3+yF1u1QP8ssw2JyoS?=
 =?us-ascii?Q?bppEDIk98ai4YsfWJLICVlU/chcIDb8R+uiyIErVl/kRBxw4l6BpwixKIaHA?=
 =?us-ascii?Q?fwE9vz6V2/jU2zITKZ7FlxWOClDXgnKLMb+Q8uLlAoonuBkLmX1fIn/R8pXq?=
 =?us-ascii?Q?gkUlYNlx/z3rsJrqoD/eVyUFk3Aq4BSoKU3qdQVyQvyvQKZmLj0qL+2rj8Cd?=
 =?us-ascii?Q?J1MRVRFHsVi9GI4E667UbDV9TMHt8r0g7So/Pah6uNsSbhAiH/AQF42G2Osv?=
 =?us-ascii?Q?46aXf149SCMIVIgjdj+VFiSMo66K0tz24XVH8QnEApnGeAjXKSnR7fFi03W+?=
 =?us-ascii?Q?qe3RfOOkO/q6iTJtMMWUErC/6GwkJD2/JicUosGnkSYnMCEFgNTQDUkDYQFr?=
 =?us-ascii?Q?hcPW04jKGUoIy3rz0cTViCsq/RHNW4SU39kWOZIVFvdX6BW/CJ0KTiLhP+jL?=
 =?us-ascii?Q?TUrBvVlBGhWzMjhtPvABbrRAtczB/z8VPh/ls08UmQW2OleTWOFFzv2fLLHO?=
 =?us-ascii?Q?s3XIf2O1Sv/sxQURLKbVYYIVFyVr9MCrJSY7i93cX0rCyl7DSAwQr4fuj2Gf?=
 =?us-ascii?Q?xf37UkvwdExqRF24vS/L628TH6Kw2ifrCYJmt6V7+n0XrNWlb/JAwn7QYQPO?=
 =?us-ascii?Q?7G26vEyKRdSO7qgFBTC1uj9XaUa+AmuWFPT5XqVKk30kX+xJkKpbCcH9Wcn/?=
 =?us-ascii?Q?n6Z5TvaVr2mdFtbcCfsHy7t49EWnLHlmxrvD/Y6u8Vm55jQDESaNg2lIGx3L?=
 =?us-ascii?Q?CR3or8XCwaFknDrKN2h0TyxSTXzvAqprJ+sMAOJaJVrgJYTDeUZR4J2uU9vJ?=
 =?us-ascii?Q?hdlyKft1ihXRPJniqtcgHQIBhLbNAsj9w3gseOM+v97Z2FLtejeBiZTcRhRq?=
 =?us-ascii?Q?jRR+vEOmBuDVaa4vn7WYX4Odn2cC5f3qWFZLMwkpAxVPx+JOSlXJOEQV9eGy?=
 =?us-ascii?Q?z7tUBadF5Qb9wiFdoWTMb8agvKjZHKnW9R5N7zqnC50PFibs3YF1dUDnnqvs?=
 =?us-ascii?Q?VLvFSQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	znf6P0QuQZsC1zaqT0R4dyytEdJQdQrn4XJDLO0KZqFMIDMT3PR0W8k6382CEgfWmIfNh5pbzD6o/vQKHhZMXE353s7roJS7CiiwAX8yABafONoeRLlBl5TvNpFXxSN2cab6QsT4zV34B5UyhO3CgM8jZOCQFmX3jXWhZodpCsUY4p04FB0f2Zq7yfC/2e7q9hF5oyQIXVOANw4L935kXmaNjEzftXLrXCqz2vFn4kOEt3WkyMqXMcC3kICiJqs8c886g3dQqhkIYuJAwLPNjKkD/GMxyKA1HoTuxoTBY+iI9l2beMtbr1EMGz6HwNM6MPzS+BFMFZqWodxY+v2tIzTyNrZ/+QMvBWicgJmwJohFJ/st0XEL2mkoQiDEU7eL5gXj8ZAbXD0OQPuYDMGvsl2MPF+Sv7brR0x9xgIRqZHE6cGs8wE9NPN4BQQSDdQD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:46.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bf0651-98d1-4578-2df0-08de680a2e1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52460-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D1896113A26
X-Rspamd-Action: no action

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Use runtime power management hooks to save power when CSI-RX is not in
use. Also, shift to goto based error handling in
csi2rx_enable_streams() function

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/Kconfig       |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c | 136 ++++++++++++-------
 2 files changed, 88 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 1aa608c00dbce..ea85ef82760e6 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
 	depends on VIDEO_DEV
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index db9871fdbe3a4..041d9288af3ba 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -340,11 +340,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
 	if (csi2rx->error_irq >= 0)
@@ -385,7 +380,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		if (ret) {
 			dev_err(csi2rx->dev,
 				"Failed to configure external DPHY: %d\n", ret);
-			goto err_disable_pclk;
+			return ret;
 		}
 	}
 
@@ -400,12 +395,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 * hence the reference counting.
 	 */
 	for (i = 0; i < csi2rx->max_streams; i++) {
-		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
-		if (ret)
-			goto err_disable_pixclk;
-
-		reset_control_deassert(csi2rx->pixel_rst[i]);
-
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
 			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
 					  csi2rx->num_pixels[i]),
@@ -418,30 +407,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
 	}
 
-	ret = clk_prepare_enable(csi2rx->sys_clk);
-	if (ret)
-		goto err_disable_pixclk;
-
-	reset_control_deassert(csi2rx->sys_rst);
-
-	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
-
-err_disable_pixclk:
-	for (; i > 0; i--) {
-		reset_control_assert(csi2rx->pixel_rst[i - 1]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
-	}
-
-	if (csi2rx->dphy) {
-		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
-		phy_power_off(csi2rx->dphy);
-	}
-err_disable_pclk:
-	clk_disable_unprepare(csi2rx->p_clk);
-
-	return ret;
 }
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
@@ -450,10 +417,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	u32 val;
 	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
-	reset_control_assert(csi2rx->sys_rst);
-	clk_disable_unprepare(csi2rx->sys_clk);
-
 	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
 
 	for (i = 0; i < csi2rx->max_streams; i++) {
@@ -468,14 +431,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 		if (ret)
 			dev_warn(csi2rx->dev,
 				 "Failed to stop streaming on pad%u\n", i);
-
-		reset_control_assert(csi2rx->pixel_rst[i]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i]);
 	}
 
-	reset_control_assert(csi2rx->p_rst);
-	clk_disable_unprepare(csi2rx->p_clk);
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -549,10 +506,15 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 	 * enable the whole controller.
 	 */
 	if (!csi2rx->count) {
+		ret = pm_runtime_resume_and_get(csi2rx->dev);
+		if (ret < 0)
+			goto err;
+
 		csi2rx_update_vc_select(csi2rx, state);
+
 		ret = csi2rx_start(csi2rx);
 		if (ret)
-			return ret;
+			goto err_put_pm;
 	}
 
 	/* Start streaming on the source */
@@ -562,13 +524,20 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 		dev_err(csi2rx->dev,
 			"Failed to start streams %#llx on subdev\n",
 			sink_streams);
-		if (!csi2rx->count)
-			csi2rx_stop(csi2rx);
-		return ret;
+		goto err_stop_csi;
 	}
 
 	csi2rx->count++;
 	return 0;
+
+err_stop_csi:
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+err_put_pm:
+	if (!csi2rx->count)
+		pm_runtime_put(csi2rx->dev);
+err:
+	return ret;
 }
 
 static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
@@ -590,8 +559,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
 	csi2rx->count--;
 
 	/* Let the last user turn off the lights. */
-	if (!csi2rx->count)
+	if (!csi2rx->count) {
 		csi2rx_stop(csi2rx);
+		pm_runtime_put(csi2rx->dev);
+	}
 
 	return 0;
 }
@@ -1077,6 +1048,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -1091,6 +1063,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -1109,9 +1082,73 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
+	pm_runtime_disable(csi2rx->dev);
 	kfree(csi2rx);
 }
 
+static int csi2rx_runtime_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+
+	reset_control_assert(csi2rx->sys_rst);
+	clk_disable_unprepare(csi2rx->sys_clk);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		reset_control_assert(csi2rx->pixel_rst[i]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return 0;
+}
+
+static int csi2rx_runtime_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+	int ret;
+
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(csi2rx->p_rst);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
+		if (ret)
+			goto err_disable_pixclk;
+
+		reset_control_deassert(csi2rx->pixel_rst[i]);
+	}
+
+	ret = clk_prepare_enable(csi2rx->sys_clk);
+	if (ret)
+		goto err_disable_pixclk;
+
+	reset_control_deassert(csi2rx->sys_rst);
+
+	return 0;
+
+err_disable_pixclk:
+	for (; i > 0; i--) {
+		reset_control_assert(csi2rx->pixel_rst[i - 1]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
+};
+
 static const struct of_device_id csi2rx_of_table[] = {
 	{ .compatible = "starfive,jh7110-csi2rx" },
 	{ .compatible = "cdns,csi2rx" },
@@ -1126,6 +1163,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);
-- 
2.34.1


