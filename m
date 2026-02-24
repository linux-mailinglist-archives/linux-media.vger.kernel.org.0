Return-Path: <linux-media+bounces-53290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKDxEWePnWkXQgQAu9opvQ
	(envelope-from <linux-media+bounces-53290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:45:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E218682E
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A5B031F864D
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 11:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549B337FF5E;
	Tue, 24 Feb 2026 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rxsPy6dx"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAAE37BE7A;
	Tue, 24 Feb 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933201; cv=fail; b=og3xSOufUKTDoEdKqoQr6lU5Im3mWn6trlOG4tVmFC1sLYCIhzvNgxCU6rbzHHmZ90MDUthLa5h3uVclgXhv3CqQKLMY3z2143BB+CPNRBWkwd3W4mR+9eydDQMb5jGRWWL+EjG1dNPmoIgZKBHFcswElaPbjg3B9fGlK+8BvvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933201; c=relaxed/simple;
	bh=4vso/EKSKrMmic2A/qzRYhVzXsduNum4v8VbJJmhtjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SsHqu3lpzF0Mfl2MBSSazDYpI3o6l1APXgMj5RuWUYJnM9IrcKd89LFFZ5IcKE24Dif6DZ6/6lbGXGnOq8KQw15yLgIHR1yXAxjZ+f08jSgbb7rmN7PapiUpKvt/KJoaIwyL1tAqRUmnSssOo8looPm0/AYiQqpv53KKazyxVyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rxsPy6dx; arc=fail smtp.client-ip=40.93.195.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1xc3A7fBH9rXh4uTqkIuoPZQVN4cydguBrCjg/jEVKssWf/ua6k2okZLAYcKzdHYT5wRbdR1wk7VJ0Zkc7mHQ+0YbTJKgQXSGLNqUOgztoLElRj5FH0Pw5Bi6e8w7DWNiybeEUpMDdUx5RevtWRmIj4DMc2BfNRyPaNOi2dswL4TOuhOjSVG78WFo3oeaKWPuo8kCxKPFu+S8WOAwgaQhC1jGf5SJn+dGnHrhDxjNNEqhBkbh9N7PT8TIqm9pimUVdDEUfxJlCqIYHY1GkW7HB+89W1bkiFyUw84SMmXwc8qXpV2bGPbLnq/yuyXlbyleOT5sedD3QE2l9XFdIVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqPWfYkB/cKIu8/8QPY/jmSU8tTwZABwO2o+4bd4xT4=;
 b=LBOeTRypWldAIhUIT0KUM0uFieH85wiJ0xI/Y+U05oN7GI6rif1exV6rehgc318iv5Xo2tAFkPV8RQvZnE5pMUynFid8ICaynB8lD14UPvjOL+l4FIVdwCA4VYtLSgsIU1VisBkwKT5cFfmFk5en67c/Io3TvX7kPuDy2OQw43LkJGivJ/aWSlqZDJo9gdoZVC9v52maiQ7PfnI8DK81AEghzc0R3zGhKTkAb1ed3RC4Etli6aZ5r6mkFCybTgaHEdb0AE2AINwu43t6XRMrs3Jg9cED+9x0S9rgNDbLPv5A25OYnz3uxB842i4BDU2S3cTKLXqyDlPXGqBrPIdORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqPWfYkB/cKIu8/8QPY/jmSU8tTwZABwO2o+4bd4xT4=;
 b=rxsPy6dxlye7CYWLWwT2pC25ys7hFXSMpPx2O+FHDt+As+slCWr3Wmkauv8HlJkFUOIIZ89wBi9QrWf7ch5kv7Wx7VVFDg45LQmfyf78NXQrYLvmYHjfUHCtzdzNB23MshCZWcLVL+KdMgyzR3rZ+pRKdZZs2UFljiWvMulXnG8=
Received: from BN9PR03CA0778.namprd03.prod.outlook.com (2603:10b6:408:13a::33)
 by SA3PR10MB6969.namprd10.prod.outlook.com (2603:10b6:806:316::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:39:56 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:13a:cafe::fd) by BN9PR03CA0778.outlook.office365.com
 (2603:10b6:408:13a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 11:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 11:39:56 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:39:55 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:39:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 05:39:55 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OBdaF12658018;
	Tue, 24 Feb 2026 05:39:50 -0600
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
Subject: [PATCH V4 2/4] media: i2c: ds90ub960: Use enums for chip type and chip family
Date: Tue, 24 Feb 2026 17:09:22 +0530
Message-ID: <20260224113925.19983-3-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|SA3PR10MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: a676af09-611a-4b60-82ba-08de73996f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?McBKzKIXdVehFpNQ7cmv2hdzpxzcYTAjuISd/zLgj6YHE3H20UYz0L7AIyvv?=
 =?us-ascii?Q?ufWJxgugtDrG+ic6+Avws7I6WtMNY3Tc7ur0XlVdYbvuzAiu3BsHyDuWGqG8?=
 =?us-ascii?Q?vExqXcjhM19SF86/n66XKJl9Ih7df1bPnV1Kvb8oguzg0l5cCApBDXwCEWl6?=
 =?us-ascii?Q?Ngr2xmBdUS/X0ewYnoLos+n3xB/HkXxrX2YLdPtysy7mt/9Zwu8K/afa3Saj?=
 =?us-ascii?Q?dw41A56HkyvKbymfcQTP7HmvXny6F0xu5ms+0wONhDIUSFSfnexDswZJQ1pL?=
 =?us-ascii?Q?svVftg5erhCfrDSw1GTdSLYqvqrDzifF7tFQyJegBl+VIJmCDXtzsFg+YD35?=
 =?us-ascii?Q?8qRSAYaqc4qNQxPgbNSRC3aTHIrHAnRTLN9T5p/VYNVUvcLBR05W097RM/0B?=
 =?us-ascii?Q?MwE1iWSavyhAE7UchAR9SmPOyEC5c9+6BIJ3hKc0j7eblWMPppBf5iXxYZbw?=
 =?us-ascii?Q?ltlk9StRGyg0iurmtpK2YUeyU7BQgYTL99xWOtLwt3Xzt1RcXBuVCHIOVt+R?=
 =?us-ascii?Q?gXOnq7A2CuP0LBImlG12h/kflid5jkMZYEq+bYZsA5GUZyvhQR/DznlZvwPJ?=
 =?us-ascii?Q?7t6OVN28JBJWjSsJ1Z+RKakG7p5b7sP0qvZf5fpV4vnIPceETZB8h21gNreV?=
 =?us-ascii?Q?jZu6NBv9eZweW8s/a+8D6KE65XxQbBTrCpGNF4plfAboi6AIB0pxi4hvJuOf?=
 =?us-ascii?Q?BCxWNZY8ADEgvy2v+OHi1h20RgSjYncIH9Gg9S02V+C7kwsPdgrDl5ikaEjf?=
 =?us-ascii?Q?bHqaxpMyGVP33a6PsUFhZ+SnqkllgyIoxnUtv2/JufIgjgDyeM2lf1hzNFJj?=
 =?us-ascii?Q?WI1ncuGw/36R2QfEfK7cLubHckQJNPu4x2cy/yuf8T0HrqZBV9XlLDm3lfU9?=
 =?us-ascii?Q?wIaKD6+pms9Za0Nop4BVpZeefD/v21MYQT6JyWClmVJYa8r2mnILHiKgQuUJ?=
 =?us-ascii?Q?8mCyhiO2R7+dERD0tqCrwOyEv50kZK4g1/iKXQFpYKqJ9dXDEL52mZEzg3aa?=
 =?us-ascii?Q?9ct3kF5S1FoKjKJTqUe43c6vlYc+1TI205RLJEQ0p09uHxi75IJbQRI2acuJ?=
 =?us-ascii?Q?gtMUtv9brFwWD5XsbNIz27ZFcEcTwJiTfmgR4p3GgXsA9uGB3vEgXiq6YgkC?=
 =?us-ascii?Q?NnnY69V38wzwmEBq8lbO9eZRkhUEDOmDk8falbiIuOihvcWd5DFoktYQac5h?=
 =?us-ascii?Q?ILBIuf3PZcykr6eirKqSTx72MFjPhjnkWKQ/f+TvhcuIvHLqC94UiQm0y+yA?=
 =?us-ascii?Q?XOhZeCdzjsLjZih3RMgwiLJlc2NOZYSCCjpZC1Ssl/WljmP7Wb0jGXPiUsgp?=
 =?us-ascii?Q?aYlotzWZRBcOJNEO+ZbSTghbh0f0yqJahTwoJYV7Cldb4UhSBl8Pyf48tjlJ?=
 =?us-ascii?Q?lOhjB6Hhh2lXTDbdTeMs+EOUiFWhQIkrGNxLcbbe8egGK/mvxntnVZC5OWUK?=
 =?us-ascii?Q?U42sJtc7iFh973sgnzTRiQiksI8wrSYI/dLw6aLlOiOJJf/4v7PrTL3wuhLG?=
 =?us-ascii?Q?sIKpr3aOoiL6ayXmPbzMRdunwJoBc/CdHc5RgiIDBG5HakjSBi7lnilbIn9M?=
 =?us-ascii?Q?xdMDPES1ZC2orKUoq62a+j2BHythHT6Wqmlmw870RPUUpVsyKMheFz2sid6J?=
 =?us-ascii?Q?TR/m7tgvUCcNSXEDBqRZHCWxIu1yzW7bkbtXc7ZNlFlMIiNY7Hi/bMqetJ66?=
 =?us-ascii?Q?KJTo3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7OtTurj55m8gizcUx5hEWKXTZQ/3Gh2Fe6GsZQUpqnuC8u1axl+nQ8GV0OOG6cC3HyZfBe2VQuYrO6/WQZBHhYQmOixEoyeQHdJ5oVgFMBIpf8d5P4kvWY/oQrRX/tZaMGvgsw1jqOxGPN746jyICgnPKRERwMdi4YCGUXq6wkP/j97GmjanymEG9iIjoJRv7cP8gHZhwqz2zUR1i2hLZ3ldkpQ3gF02RdP17vaNGGF2Pgpl0WrCskeFqU5d0FLHE4/lywZ70TvHDMSM+H85PZ6Q5xxf2u+mjk2X8AHkFDjzhxQN60BFWbkshYkS/t7TmVJVM88/f+oonDrHKjfO5nn0G7PAYxWu1LE5OmWTHawN+j34oBMf/HP8Hs0b50QZgOFzHguN+eeJdq6apEUZkS1YCIKviOWS8WO6vVtse1RYVPIfsxecH/c5N6hWezJK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:39:56.3461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a676af09-611a-4b60-82ba-08de73996f1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6969
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,xs4all.nl,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53290-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:mid,ti.com:dkim,ti.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BF9E218682E
X-Rspamd-Action: no action

Replace chip-specific boolean flags with chip_type and chip_family enums.
This simplifies the process of adding support for newer devices and also
improves code readability.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Rebase on top of next-20260223

 drivers/media/i2c/ds90ub960.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index f453d96d9e43..ed4d6f786e15 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -454,12 +454,22 @@
 #define UB960_MAX_EQ_LEVEL  14
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
+enum chip_type {
+	UB960,
+	UB9702,
+};
+
+enum chip_family {
+	FAMILY_FPD3,
+	FAMILY_FPD4,
+};
+
 struct ub960_hw_data {
 	const char *model;
+	enum chip_type chip_type;
+	enum chip_family chip_family;
 	u8 num_rxports;
 	u8 num_txports;
-	bool is_ub9702;
-	bool is_fpdlink4;
 };
 
 enum ub960_rxport_mode {
@@ -1933,7 +1943,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (ret)
 			return ret;
 
-		if (priv->hw_data->is_ub9702) {
+		if (priv->hw_data->chip_type == UB9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
 				nport, ((u64)v * HZ_PER_MHZ) >> 8);
 		} else {
@@ -2195,7 +2205,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 
 	ser_pdata->port = nport;
 	ser_pdata->atr = priv->atr;
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
@@ -2361,7 +2371,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 {
 	int ret;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_init_tx_ports_ub9702(priv);
 	else
 		ret = ub960_init_tx_ports_ub960(priv);
@@ -3633,7 +3643,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (!priv->hw_data->is_ub9702) {
+			if (priv->hw_data->chip_type == UB960) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
@@ -4259,7 +4269,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		if (!priv->hw_data->is_ub9702) {
+		if (priv->hw_data->chip_type == UB960) {
 			ret = ub960_log_status_ub960_sp_eq(priv, nport);
 			if (ret)
 				return ret;
@@ -4417,7 +4427,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
-	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+	if (priv->hw_data->chip_family != FAMILY_FPD4 && cdr_mode == RXPORT_CDR_FPD4) {
 		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
 		return -EINVAL;
 	}
@@ -5019,7 +5029,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
 	else
@@ -5038,7 +5048,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 
 	/* release GPIO lock */
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
@@ -5111,7 +5121,7 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ports;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_init_rx_ports_ub9702(priv);
 	else
 		ret = ub960_init_rx_ports_ub960(priv);
@@ -5180,16 +5190,18 @@ static void ub960_remove(struct i2c_client *client)
 
 static const struct ub960_hw_data ds90ub960_hw = {
 	.model = "ub960",
+	.chip_type = UB960,
+	.chip_family = FAMILY_FPD3,
 	.num_rxports = 4,
 	.num_txports = 2,
 };
 
 static const struct ub960_hw_data ds90ub9702_hw = {
 	.model = "ub9702",
+	.chip_type = UB9702,
+	.chip_family = FAMILY_FPD4,
 	.num_rxports = 4,
 	.num_txports = 2,
-	.is_ub9702 = true,
-	.is_fpdlink4 = true,
 };
 
 static const struct i2c_device_id ub960_id[] = {
-- 
2.34.1


