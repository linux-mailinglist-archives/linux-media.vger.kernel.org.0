Return-Path: <linux-media+bounces-51250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK2KNlTfcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:14:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580E58396
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2455038BA78
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632AF492506;
	Wed, 21 Jan 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aniKXOiX"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD847ECC2;
	Wed, 21 Jan 2026 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003700; cv=fail; b=CTBouov6lQFsJ2k6LsdGIRACs2yXyofDglAD7zsv0PzEt4BKSmw1ArQVNbSRCngn8lYulhZBPkp5VVE6OBWlOE0jqvZztThn3FAQOm9HJCFipigV2O4HuTCXHinH6OQkxSuMz/2nujTWa/ZDstjk8HkpYNaB8IOVcpTrMSdRtBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003700; c=relaxed/simple;
	bh=s1Z6i8nmkzcw+5uOaYPg9pWYsuDmjnhT7v4WJaHkyLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QiFdHno0pw+w0bXh79mFhazdDwz8iFL0vKBxHjXPRR3wDio4DsRxTaRhKZFwNgPXe3Ib9kwEgIqdvoYWTaShzaHFj8wVklA98GrXbLfQGaB88BhpCxVp/JEZ4yh+ze5vMmj5Q3HFYvSfGPVDQUNz7ku5JcVigDPx6rkyfuu7gI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aniKXOiX; arc=fail smtp.client-ip=40.93.194.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ar4Uc8+oOIbkoTHuzdFXm1j83ghoS/8v6WYsl5unEYgz03GMRcJvzymdlqMYGLRkZKEU9QuKn2HzM5rb5prYjk5TR0ASfo0FaN2dVnk+dAZELvSN2oe+5OhxQ2Qe15RTidvdJXyEHC0Ehqng9zy+T3joGf8jo2GCkGNJ4NZLideuFcyzs7igS04xXmQ0rtNHkQ8Qi1CikskptQ8GafWAv0suaj+joIRUdhjwk/hIzM2/zG9Q0U5NoD9lq8Xf4B9rPsZeOFLklS7EzcpYWl+X5vUT6sZKTy7srEqz3UPxdsaV3gjxqGTr05eAt3T6qAJTfCG5ukJw5eAbMf3sRQH0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=N2/igoKaZQW/41RILuKs23GaT+H53fLRJCB5PD+Bgegp/n5R4sJxcqnbXvJ5KQvyKcqNyhQRDGBCiNwu7Tq4wiGJFymJXBrSSKiRZU4rV430tS9SSW/z445ZJPoOZgSygHfnkJ1k2g/gyqQ1RFp10Lt5e81k82VyX4tYefbqarzz8KymTPhjCj322sIvzgaBpAl/nNo3nZkbk+1nGs3uLstaNBXQdcO4IYe+Y8zvNRQVTgg1hdy2RBNybD8gbs0JBEXgNm9BiT64kjBsyT6nU/GIhLjhMqff4eDBA5B/sJ1Eci3noBC0sxwyQwIB/Iu6bdZkdYiT9AmZlneyciz2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=aniKXOiXg8ehIveVxdhSJ5aUwbqcAa5z+T+aTMe7vH1maPTkevDhYRJciYgP4aBbNsO1Chc6yDi4FS+IIECMJt3/eshOnkoNeyuBSkRpy18+m5/t6wGnxUSaEaOW2mmgIQmExrUB7PnTCEEmR/x8jfXnPGpC/+GdHyYXAyGWgrs=
Received: from BL1PR13CA0236.namprd13.prod.outlook.com (2603:10b6:208:2bf::31)
 by IA1PR10MB6219.namprd10.prod.outlook.com (2603:10b6:208:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:54:49 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::5f) by BL1PR13CA0236.outlook.office365.com
 (2603:10b6:208:2bf::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.2 via Frontend Transport; Wed,
 21 Jan 2026 13:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:54:47 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:54:46 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:54:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:54:46 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPI83104105;
	Wed, 21 Jan 2026 07:54:39 -0600
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
Subject: [PATCH v10 02/18] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
Date: Wed, 21 Jan 2026 19:24:08 +0530
Message-ID: <20260121135424.1185710-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|IA1PR10MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f00d8d-e64c-4bb4-267d-08de58f4a39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rbFbzEa7zzpy+uo9Vq/ON6h0FEz2ERStWcxVjhtoZNwjK/IBlwfGAWtDx/lT?=
 =?us-ascii?Q?ueEeDjLmEz+rTVj1P8nMesX/2rrXywMZnBZUwD5IRmfUfx+Mut2MRs+qB8J0?=
 =?us-ascii?Q?VgyuZMtbED/RIqwH/dW2R21DiH0qa85Hp6ji+JZNXMTeHnKBgKF0NAiRHgAX?=
 =?us-ascii?Q?UQWOC65ZNsjhA0G9h79VBzKpueYseWdluPOV2kfWm5lp/DwQeY7+Dee5qk86?=
 =?us-ascii?Q?oceXCh7RTmrnt5jIpHwWaOSSZAt6ekDBX1dBF8fk6NK3JBWdyyphC+aJyqfJ?=
 =?us-ascii?Q?lGV5GDvABgxgW+b9q5fhbeXuSXQ6S8tRm216ApE95g+QixsS0NUmith5ZAED?=
 =?us-ascii?Q?Qf+EvabOaEuY2Qc7RyUkkECGF2G8sadYjzfhS28/ogDznYvmJhHWKbP7tJzu?=
 =?us-ascii?Q?VMBMvYuWl74XCZagmB0Pb5v4iMkOScblJGPHOLMi5yCInw1pFw+t95dzvPJ7?=
 =?us-ascii?Q?ebZMmU8fQZC29FwThunfBkVw/ysKULQ1Nkr3z/T09YJygs2hJG1mOE73xFjr?=
 =?us-ascii?Q?YUkX5PSQJI5TZRdDIWQx2TUhtZF04eexaWm360niyEXh/YobLCjIA/hqdZgs?=
 =?us-ascii?Q?UNm6tmn5EXSh+fIdoCEmq1TZJJEuAmrtvJ6Iq7U8jr5dP3PoR4Xa5rWNLJk9?=
 =?us-ascii?Q?iuIn4Jc7xqF2rFd0DdB6iK2Pq7vR2kGZre/rSHl7hFeAIJwAKcYeyplgdLJV?=
 =?us-ascii?Q?bn33W6r7eNSjR/uIfFFDqIb6nKOpIhMrCOeSsMBrqg9kH8P9c5yc3/6bW0Nl?=
 =?us-ascii?Q?li+1fhscv8GkQwwjwAVK5dgdFiL723TFHUqLgzzSo/gaf/QAfl2grQWTjIGh?=
 =?us-ascii?Q?ivsITo8WLIOoQxyS6blp8i+zwDwhDp1ilyqHHj4satJd12sfsI4AmaKh6ntb?=
 =?us-ascii?Q?KwX/7Uon7hKSiB72X1Bu04ErqEXb0iy+F5STT+RlGJMPZ94xc1XE4uRvhmFR?=
 =?us-ascii?Q?FK8cPoW9Vwp45a1aUS/DP5S4iQCtbMu35EjGCMKRe7Egh0vpub/Fe0W4MM8Y?=
 =?us-ascii?Q?But5w1r1IrmZIWDWPUveB+ferCTbfxsRRUZvPeid4gcdj+EuHmBWKPPSYabV?=
 =?us-ascii?Q?L2OJbz9nsTJOBtYs3VyUzrcpCUxf+qQedTxH3eLr+Zp0UPV1724RYr6juJpP?=
 =?us-ascii?Q?qXwzbsYbKSwqpeNzF5tDNcfExPHLm+jQrUveKnxu2/XVymchIPL6/g1xUTEi?=
 =?us-ascii?Q?rkF4E54l2H9r0aF0UMqj5phviOxm8nWqLSlod79fw+HPsDO+emFY0wZyJORa?=
 =?us-ascii?Q?y7skF8EadKoAr6N8NBtraycb75BVprk+etPZvfS/aHhLafOqK2FayY5zUKkX?=
 =?us-ascii?Q?C9+eEgu3BKSIbQ46KOKBnpi/jDI/rGyoqHD8SWfmlXu8KP8QxTfjNOCI0FHL?=
 =?us-ascii?Q?fAnnYe9QUnt+OUgJATJJRBknU9BDbxnzeMSIT87d8SInOrqEH65zbk2ZVVpr?=
 =?us-ascii?Q?15k/usP3SH1nbMTB92cy5hNeKqq1g7NRNQmymKp72m5RMjmMGrxtRzcXiY5X?=
 =?us-ascii?Q?2tlL+FsMq6tj/YTFwuBQmVWzkR88qu8wK4r7rIqATOhopGFSdX7G+SUj45YS?=
 =?us-ascii?Q?gdbjUQ/ONRdOt1aRkqZZZGGVGiP28ehCCS+nUneKHRL50SIJdFRERbi+VI+Y?=
 =?us-ascii?Q?s+/VzZP2DnbFyq4bXft3tUiwvbUA/aV5rskEnPd+OIJ7w9KdVB/33snMEmu2?=
 =?us-ascii?Q?7xkG7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:54:47.2200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f00d8d-e64c-4bb4-267d-08de58f4a39c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6219
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51250-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.68.170.32:email,ideasonboard.com:email];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8580E58396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

The CSI2RX SHIM IP can support 32x DMA channels. These can be used to
split incoming "streams" of data on the CSI-RX port, distinguished by
MIPI Virtual Channel (or Data Type), into different locations in memory.

Actual number of DMA channels allocated to CSI-RX is dependent on the
usecase, and can be modified using the K3 Resource Partitioning tool [1].
So set the minimum channels as 1 and maximum as 32.

Link: https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/10_00_07_04/exports/docs/linux/How_to_Guides/Host/K3_Resource_Partitioning_Tool.html [1]
Link: https://www.ti.com/lit/pdf/spruiv7
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../bindings/media/ti,j721e-csi2rx-shim.yaml  | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
index b9f033f2f3ce4..bf62998b0445a 100644
--- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
+++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
@@ -20,11 +20,44 @@ properties:
     const: ti,j721e-csi2rx-shim
 
   dmas:
-    maxItems: 1
+    minItems: 1
+    maxItems: 32
 
   dma-names:
+    minItems: 1
     items:
       - const: rx0
+      - const: rx1
+      - const: rx2
+      - const: rx3
+      - const: rx4
+      - const: rx5
+      - const: rx6
+      - const: rx7
+      - const: rx8
+      - const: rx9
+      - const: rx10
+      - const: rx11
+      - const: rx12
+      - const: rx13
+      - const: rx14
+      - const: rx15
+      - const: rx16
+      - const: rx17
+      - const: rx18
+      - const: rx19
+      - const: rx20
+      - const: rx21
+      - const: rx22
+      - const: rx23
+      - const: rx24
+      - const: rx25
+      - const: rx26
+      - const: rx27
+      - const: rx28
+      - const: rx29
+      - const: rx30
+      - const: rx31
 
   reg:
     maxItems: 1
@@ -62,8 +95,8 @@ examples:
 
     ti_csi2rx0: ticsi2rx@4500000 {
         compatible = "ti,j721e-csi2rx-shim";
-        dmas = <&main_udmap 0x4940>;
-        dma-names = "rx0";
+        dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>;
+        dma-names = "rx0", "rx1";
         reg = <0x4500000 0x1000>;
         power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
         #address-cells = <1>;
-- 
2.34.1


