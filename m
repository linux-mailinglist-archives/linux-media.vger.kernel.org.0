Return-Path: <linux-media+bounces-52455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLDTCFUpimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:37:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2231139C3
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD97303A86F
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65463A1A5E;
	Mon,  9 Feb 2026 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v8eWPTum"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012040.outbound.protection.outlook.com [40.107.200.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4C38A9AA;
	Mon,  9 Feb 2026 18:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662173; cv=fail; b=koNcKYtlF8Jf2iZOQyrDD5IhORKsRRYhQZ1RZ9OF3WAvLZDgx5JfEzqyv+VnOT7bNswB5W4ULAd4IX5ky0HC2+BxLNoAs/jEWMjwydiPTGrOytjZePpxHx9DV1LhhmCuNw/UYum8v7SRv0wC1IwV22DAIK+gBsOdMW09L+5p7GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662173; c=relaxed/simple;
	bh=JZZkIYtjzY6RqcNAOxaRep7insu97t7LOce/MqY9/hE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTNX4wLoaxEA1FTwFJKz9QTKqXr2NLotXay8F3I9lpKHcxydzKXdWS444ALj+Ulg2ZOgoN7CwTnkL+HNgLVUsUWunfXCJzBYooCbbQCwNLShN9CVGGCdlxkH+SN+HWxihvKgwiZKh7nlKF/cLRGfNfTtHKhwKXt1eYMh/t1/v68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v8eWPTum; arc=fail smtp.client-ip=40.107.200.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdeY57ckbrlcoHHME2UPUlFkMcc6Rt2v6EXNv/nVlRbGZnYYhyDdKLFFnQhaIPuRhA5K9RsMnuJvsfxWBSjlFI0wH5aGrxlx1REPW1s2KQMhj2EfHvvmyC8ooSkHUXgAveSayokG6ezHK3Rj8YqW5ZB6HNrE/XIvUrRkWphuyrqDHcvc6Qi+JIesF0igcb+A8nRxNTe03kCY2NoH5B5cQWhVphF5LdOwXjStILnE9n4mURxzD3r6wCHNfK0/oNplVCrof9Hta9DQNUizlKOCR141HkmhWd1D2HWbgAPVL6fuwDhBlFHfovGmzqWR4uM6Y0QkQIEN28EpAAxXJEmqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTzSx7E0rJuN9J5gcYD6pwZrHRzqXYA+9bFtftr3+Vo=;
 b=CbD9iQzi4L9gBFCe/kNMRnxj7GcaNCZAhe00qt2nnadk6FWubePg4CbmpxfAtRjXwAJHLfdbIehGdWqIG2e4TIlfOMxNKoEcJBMOtm+1W9Qjx7aQx1Pk72CJ/a4b5DFzOm+SDXmkQgaSh3C8h4gvLdsi0xAwt63vSzSI6E93/XKhw4LDQj72TediHnX5y9eQenZUEQVqrftNPNU60FgIdocHA3U8oy/awZsn4uTRMlhTjis+/bC06kbk4XvmVe9gNWU6Vsr02yCFZcjpB1PgjyQ6a8kX/sYbOmBjoNSiyt2yElmaO8g/a2cN5nVWbwq0eX30YLPzK705XQzUJA9CWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTzSx7E0rJuN9J5gcYD6pwZrHRzqXYA+9bFtftr3+Vo=;
 b=v8eWPTumBy3La2BV8qyM1uqCjLPaAYor7BiBUA4pW7Ar+0W1JMP1dLcXhUSIkaxjvr2EwTDKPnCHfZRe/83BJqoIH7gcAX4lHzcJW8QrnofeS7wEzzjCmR698m0lQB/ceLZj+h/Fn9deOPVd6Gn5vvMze8DLFx3YM0GZJPkN/gM=
Received: from MW4PR04CA0161.namprd04.prod.outlook.com (2603:10b6:303:85::16)
 by SA2PR10MB4618.namprd10.prod.outlook.com (2603:10b6:806:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:36:10 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::b) by MW4PR04CA0161.outlook.office365.com
 (2603:10b6:303:85::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:36:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 18:36:09 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:09 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:08 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt62052904;
	Mon, 9 Feb 2026 12:36:02 -0600
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
Subject: [PATCH v11 10/17] media: ti: j721e-csi2rx: add support for processing virtual channels
Date: Tue, 10 Feb 2026 00:04:49 +0530
Message-ID: <20260209183456.1906327-11-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|SA2PR10MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a363878-581d-4ab9-a95f-08de680a1845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dwcshjcVE90rAMMe2pVni03GGXusmQlx1NTjvZzom92dJmTGqsbphuv58ZX2?=
 =?us-ascii?Q?BhEPk6bJAJwquuffn9QwEQL0yEntKZsWgJm5FIzMO8KttLYvyqzvJ3Jv9Z4W?=
 =?us-ascii?Q?1QDJ8huBuZ20mBZBlNnyYkPOwreFMJbyCFhBt7lSojO0+Dos7lKDKgleW7om?=
 =?us-ascii?Q?1cfJCHVggjJ2uwCUu/nfhiTpKiGXIPuyxcrODOpLgeKXyq+Gs5ZHRnGIoPFv?=
 =?us-ascii?Q?qoShyk4yOE6w6pOqB9flKwMaTKWXCM5urBPDqRhYXJiK2hIj0IO2MZR0Ijo7?=
 =?us-ascii?Q?iosXZEhGziW8S0iDGsiDGR9CNSi6XCYrewYHerFcWemuPHOYyXTdER20mlED?=
 =?us-ascii?Q?ZCUEXHy0fgoyNikGaQnL5O4CyH0PomPTB6nWsWINNSAKEt4fMrVqbHP3ubyh?=
 =?us-ascii?Q?2+3oxsh33Rn3hJubhU8VnnTAbXRxWfpCQYrsUnrI9XqVqt2OkqUzo62v2gZE?=
 =?us-ascii?Q?QPAanV3BO/Kl41orN+6blNC9eYP0JKKg7z3xt6qvzMBqcaA+Nc8zp6Wns0kq?=
 =?us-ascii?Q?tdvPiiuRQHhtIyCC2wzyrLcXQxTBO/cmKkWFRh94T3A0q4L5HaQa+xc9B+vs?=
 =?us-ascii?Q?R1b8cAdj6AAdHDa/GLb/ar+4RZtmX32OwU8cYOaoaM2JfWrQEn7GWeR4gS5i?=
 =?us-ascii?Q?W+oAfB4dWKtDlxTzkf9nlvNo/9MxLg8XtmsiHlyKqcD68efid+VhOrAYcZ6G?=
 =?us-ascii?Q?9ZEITzpcmE0IQc5phN5AjtCQsss18Kb8cUj31Qu8JO5U11u9JbU/kipRy7Pt?=
 =?us-ascii?Q?R/WU49waUokCnyw2ENsG7XnGBGwpH+pYSwqGh+YCzjisRryWu5iuvya8hvyV?=
 =?us-ascii?Q?plk+USteX9BJBiDwEqAlavdVLGURFqVx+Ut0fBPHg4hG0rDwtPGLo7/ckLGP?=
 =?us-ascii?Q?+tmaEa2YSGxwTl8HCRzKRd6I1AxD5Tv9kQ72PmFfYsuR5L3KT3v6v0rFWMJ2?=
 =?us-ascii?Q?BTbAdPP/pmUN5Wo3XUEgfS6j7sFWhnKaWtp9ptnwrQT/pwSMpo98SUTYI24U?=
 =?us-ascii?Q?cweb4+fY15w3LxKyJcnDHNnKBNc9fKn/k04GXlJDtogkAPKItEgBs50BNgzA?=
 =?us-ascii?Q?eXMVBMRF9UGbSbOhgCGBOYFdHtmo3jYmcNyp1LRLyU3e1CWDKbPawHdvs5Vo?=
 =?us-ascii?Q?Dvjl8l/oqwUYI3J9Z7sKpBYBoqGCtgkhS9ixAKGlWW/rLfjjWwU8rb7I2eoi?=
 =?us-ascii?Q?2gH6tZa9WkyHLeNIPNEbnxypmY+wfCFPSlLHX+27LRRcaueW2H733LjiaMA3?=
 =?us-ascii?Q?M7GNqpQzKxMPC0YqLiPEpnk8Q5vH8/M+FjW+C8qQRbIutvl2t8jxvHn0VooG?=
 =?us-ascii?Q?RZFi49msv/zFc7Q5E93AAjd3IxP1mCgcoZnChnNeN/b145SFKdpyiyzrOGJB?=
 =?us-ascii?Q?hFVY6jo+ddGLGM87goVFtB1UCyOJAmXIfK4pUdeoOnU8hMI+eDXRwL9fXIVv?=
 =?us-ascii?Q?IGDz9YdHPcFgXKvcjzAktG+hqniJgYATqufGsXkQ1r0H+9YgaSxwxPg5rg/Z?=
 =?us-ascii?Q?Ka+HCEEt4ecl4T9Ocg/0O6k8pjlGW3Vijra2r18ctXW3nWq+pZ7PqNsqANCd?=
 =?us-ascii?Q?s/3TRM4/HngBua8GqTMqTPS2TsoL1w95y38/Dg0+u89OHDZYGJRln9xAydBs?=
 =?us-ascii?Q?9V81QW44KN2bpqfjAJ2j0peiMCaoHf6DRLvmT0iOAxWe7ZqLt4CdbxCPpCqO?=
 =?us-ascii?Q?8g0l8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SJNscXHZG5u+IIJF7OyYmQQsj5Ycbhp9EqR0U6IQmkSxxPgU6Vt//c5+tt4eQ7kOIFD7D2uxb/gWbX7xbF+fxEKIoJI7t7Rvc0Vcjvte6V/5dGpVtomxXZoGXF0GTY7JaeRbTX2CdakA0SAjWfdeMIV629cMwriVM5DM0Bd8lzSSpr0yjnwLixWBA3hLuytNiuUFASIdiezRb0OW+sBU7ZkAFvGcJPM4emmFOB1tDWunB2FBWGHR5YEPyj2ub0ifvZ7486sSvW9vfDSxdUOKVDJYTVEUbVF+Yn6pBe/wBm9u6OwzsWEGSf/v1VLVBthOxxKlCGHG/EfsEFouAmlbpBwGlSZcghbB8tLBF5Kuundpbti9Che5oZrCl1eNl1TqFscVq1c0XvYQd+yWfWutAux5UHyQzbc/yD2cdKuuKPilv51DnpAcoYwlMKBFf/Qv
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:09.8102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a363878-581d-4ab9-a95f-08de680a1845
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4618
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
	TAGGED_FROM(0.00)[bounces-52455-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE2231139C3
X-Rspamd-Action: no action

From: Jai Luthra <j-luthra@ti.com>

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel and DT instead of defaults.

As we don't support multiple streams yet, we will just always use
stream 0. If the source doesn't support get_frame_desc(), fall back
to the previous method of always capturing virtual channel 0.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 5fbadfcc8ce3a..e38b6995ca024 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -32,6 +32,7 @@
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
+#define SHIM_DMACNTX_VC			GENMASK(9, 6)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
 #define SHIM_DMACNTX_SIZE_8		0
@@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
 	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
+	u32				vc;
+	u32				dt;
+	u32				stream;
 };
 
 struct ti_csi2rx_dev {
@@ -569,7 +573,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
-	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
+	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
 
 	/*
 	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
@@ -608,6 +612,8 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
+	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
+
 	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
@@ -881,12 +887,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct v4l2_mbus_frame_desc fd;
+	struct media_pad *pad;
+	int ret, i;
+
+	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (ctx->stream == fd.entry[i].stream) {
+			ctx->vc = fd.entry[i].bus.csi2.vc;
+			ctx->dt = fd.entry[i].bus.csi2.dt;
+			break;
+		}
+
+		/* Return error if no matching stream found */
+		if (i == fd.num_entries)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf;
+	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -901,6 +941,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	ret = ti_csi2rx_get_vc_and_dt(ctx);
+	if (ret == -ENOIOCTLCMD) {
+		ctx->vc = 0;
+		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+		ctx->dt = fmt->csi_dt;
+	} else if (ret < 0) {
+		goto err;
+	}
+
 	ti_csi2rx_setup_shim(ctx);
 
 	ctx->sequence = 0;
-- 
2.34.1


