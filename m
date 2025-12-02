Return-Path: <linux-media+bounces-48077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA14C9B1E5
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 11:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02FEC3A6CFD
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 10:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C839630DEDE;
	Tue,  2 Dec 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LnmjGyoy"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C11E9B3D;
	Tue,  2 Dec 2025 10:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670951; cv=fail; b=BBHF564cBHN0r3fs3EAPmI1enO6l6Jj6vsuuAK3XoB9UdolUfrBJNn/PHYHBViWaoiVUZPanAISYgRg/InZCBJEZoSQfOO+2a1u3NJU/SaiOuKW83VItCknR0uWmPnl3Xq8foTgni60HQ89liuLAv3D9YRRiDIXZZSPAJWfK+jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670951; c=relaxed/simple;
	bh=2VgFyZf3brvp2+fj2KyVP1xmRg5io1llAELyt5gnjOo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iwvq+1zLz0xk7Cn6BQcsXEK15c4PMiiLBRmhylHGGd/EfoNHC+pll9ffCCaxfCDC7WPVoT2r1Eg8zbQBBsa3k9zqRVbwAtHwAg7KCT2pEB6ABbBX3enjz3iJTYHd7tqIkOdX/MElBqZ8d9MZgNALRP8geWUw3pD/rcecwck737w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LnmjGyoy; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgI+lMwNp6rFBiHZPbgIrBvhObcC5Et8LqWc823R2zddX8KrA1jrdDm3rTQ7My4mSrsXO9vyniKdFJWEG++hBOY9HZxVUrNjnSWy++QYJ0TK9eLl+U9kwWbUiNXoBKlQh20zPO7W457fMEqTn1yhB0DT4XdJv3NDQ6H0lEAzX0v/8mEWnrmlMVPZXzDc58kGfTFw07z6b3tbTEAa2igUqdgHVO7shsEfC/IXN0QWZjos6aUiUyBqvjXVEQKI4wy0t1xzd9X+SFSPKfukxliJblxKtD2XJ5yox99lkTEtRt5gWT7nsgPMLFxC4DQv3PNZfgTlosI0FaXzhkpRmHy5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmcS6vPulqWlvbjXKirL4AcC8RUILI97lsKtLPXHGhE=;
 b=UHiVPcdyX9rNgxmlwlLB/Gie0CR+Om93ptqxnru2EnE4ifqkTVBkznE4XkOqKiHOqNBZCKcnyKBpq04v2+t+PsxjSGI7lLPVD1L/N0vhRXjKM4VNR6R2d4u1hXvyHbqGEoD3B/5dV+cmIoJtMkhDek+QcPCbslOuFKv3NklKGgC1kZW+qXcLZSOd+D4BvGVOfiJw/BuehEDYvdE0dBHi0GY0fL4TPbuE6hF6QkxOAI4Vwhp2hn3MpKJGnQpJIEoC9/WH18vw4SwuoJ/RVmpM9IMoCnQryq7afJyt788dmigOV9kHrKRfygwIWzcB6qvO8123v4BKE2znBguLLvOUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmcS6vPulqWlvbjXKirL4AcC8RUILI97lsKtLPXHGhE=;
 b=LnmjGyoyntQtdJiBcsQX8hFNB6cazOTYL42eXtgcYdn79kHG+0EfI/ykA97VmYd5KOSJImrp8cBFuZ66Vq/lD6OQZfgh1h4glnh0A+S6k9atDVSbtCbyaigww0c/FZ6/ovlhUgRoh46mxwOJTbotGaCpuJuLr84vRUnJGJD4ZeM=
Received: from MN2PR05CA0050.namprd05.prod.outlook.com (2603:10b6:208:236::19)
 by SJ0PR10MB4510.namprd10.prod.outlook.com (2603:10b6:a03:2d6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 10:22:25 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::9b) by MN2PR05CA0050.outlook.office365.com
 (2603:10b6:208:236::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 10:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:22:23 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:19 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 04:22:19 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2AMDKP2072084;
	Tue, 2 Dec 2025 04:22:14 -0600
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
Subject: [PATCH V2 0/4] Add support for DS90UB954-Q1
Date: Tue, 2 Dec 2025 15:52:04 +0530
Message-ID: <20251202102208.80713-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SJ0PR10MB4510:EE_
X-MS-Office365-Filtering-Correlation-Id: def63466-726b-4c8f-06a3-08de318caf23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+DcehsaQNqIqTPDQFxSbv9RENGOXUHS3xBvjZvj81/+sTNh4xAfbRk+SAEz/?=
 =?us-ascii?Q?Rn4at1CvDD1u52YrCGPWCNzzfBhMB+6Yx5pqF6Dy5m8eyFuB4rciLR6/H8GU?=
 =?us-ascii?Q?yeKqsqLt6Tomjy4coa9U9tuXQqHClb1XzT1lsWIQPqYoTiqZ32B8dsiEFwz8?=
 =?us-ascii?Q?eAeLMBd5whrPn2zxxOa+1cekGCavXdhKvgRu2Wh53zWLFRVRiklPPHzXG6Js?=
 =?us-ascii?Q?nXFSOIzObIg4WsbP387FrjLFTBfA0yM1QqOBmJqg/rm3tk13hb9lzvkUc72e?=
 =?us-ascii?Q?+Lv+RKMZWj2nYOYgahKwytlboDGrRmvT+z0kOCc1YISJ68iAYOs4O5MfsWJ9?=
 =?us-ascii?Q?ux7uO9uGTdzS/vJHhjkNymqiZUQ+pH+a1MPBnTA0F/ID6LGjKMZtJUSpbmdr?=
 =?us-ascii?Q?0u3MfJg46RBs4bfidJd2Yt6vXZX6p1l7jlBc/8rlo/xanH8PlSMQaWUWsMmk?=
 =?us-ascii?Q?WKbnJ1gIXWAjIFamn3IMB62CY6uGEA1H06RT4DvBgpqjpd7K49BsFJRI2cRU?=
 =?us-ascii?Q?YLkeGiEvAcRysgzplwqNcChhp3fP/8yeaBZPrRugc/fGrfuXwhzMGMkt+47K?=
 =?us-ascii?Q?X7SclDNk1ezhiUQd4PdfPWfiYdXOozf4RFs4nwaXq7HGc5lvAFfP51wP9Rp+?=
 =?us-ascii?Q?ThSh/g3GbPxguhLZFrlt2FtUtt4vbyas2xoFhc8H9xc0caPVIefbYcjBF6y1?=
 =?us-ascii?Q?SE9JWCKoi7e8i5zCLrHJXST2Ph6rjJq27xWjulH5khYEI9us4QD7jUbaTjUE?=
 =?us-ascii?Q?ACshHwdOlzf9gnsspG2NfYuum4uV7sDveHwZ/FhtmVI/JNYir4FhVck+PjBU?=
 =?us-ascii?Q?PnUBzGTAv6QquZB64oPP75ceJG7BWhl4e6a/fvxOm+FKqcY5VgFcpCZl+Nkc?=
 =?us-ascii?Q?SSMiNo+wypxI1QEFiFngzFMNrP4IVOxHMLdAzTp3yeL2YbG3YtsH8g5yqZyu?=
 =?us-ascii?Q?v+hTl19TJpKKxoGIcGMsLKpYy1Lk4l0eN/hc0oIV/Hm8kY9jGNyy9NJ501r1?=
 =?us-ascii?Q?f7zhJZq2CWGcXNISkiUrqfW7qdS1M4qNdYGA1rJ+zbCRYGRy72UlmLj8808h?=
 =?us-ascii?Q?vHvXst7yc30Zuhc2feSvdP4GcGhEyaXEDwdDO3yB63pCkIZxfESxt2QWuGP+?=
 =?us-ascii?Q?x4SLWZgJwsFl9KnJ4iUNOhWqDvkniMuIEcKnvA6LcNyRl/JNUfbTRnQW0haB?=
 =?us-ascii?Q?mdheVevogiLttbvaqBUkeYktcZ4nE1xmtD+KUiIUwjLUBzqHxXQuOHrclWjm?=
 =?us-ascii?Q?bEMR6UvMKJ2akv2U0R4GFzgkAs+dBVi2SZ9AAupZnqiy1loJCPp+MItb7nqo?=
 =?us-ascii?Q?2gunvKnZRtg4GeAArok31Ld9WAJO/4PsSpSVkCpdCf6bJKDmGQX1b4fU6A4U?=
 =?us-ascii?Q?hvgmO7EkK2XQg6Nxj+YyYLEp/OvW3Y8a/NfLXzmvhPZloi4ZTXah4qvKtVzF?=
 =?us-ascii?Q?+i8fIgq43ylRRIYryseI++n2NJAFLwR//BMn/BVaQTajFEWu9DTmDVIpXdIo?=
 =?us-ascii?Q?VNN/n3L4IEsW7lH6kuuKL+TRxjhg2P2thAK49wlbcIILIex+1dJS5As9ABRA?=
 =?us-ascii?Q?ZdnYovkI+I2uk97Baq4=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:22:23.5590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: def63466-726b-4c8f-06a3-08de318caf23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4510

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing DS90UB960
bindings and the driver.

Changelog:
Changes in v2:
- Refactor the port definitions in the DT bindings and then add support for the DS90UB954.
- Use enums for the chip type and chip family.
- Some status registers are reserved on the DS90UB954 and always read as zero in log_status.
  Skip these registers.
- Move the link-frequency check for the DS90UB954 into the existing block that validates
  allowed link frequencies for the DS90UB960, and check for DS90UB954 first and then 1200 MHz
  next, as this ordering is more logical to readers.
- The strobe setting registers differ slightly between the DS90UB960 and the DS90UB954. Update
  the code to accommodate these differences.
- Although REFCLK_FREQ measurement is not synchronized on the DS90UB954, a single read is
  practically sufficient. Remove the loop that performs two reads.
- Fix a few minor issues in the Kconfig description and code comments.

Note: I did not collect the ACK from Conor since there is significant change in the bindings in v2.

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/ca582375fe682221c6597e60f247d92f
DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/bd6050d021f72a78ac82b3b342e923f2
Link for v1: https://lore.kernel.org/all/20250523083655.3876005-1-y-abhilashchandra@ti.com/

Yemike Abhilash Chandra (4):
  media: dt-bindings: ti,ds90ub960: Refactor port definitions
  media: i2c: ds90ub960: Use enums for chip type and chip family
  media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
  media: i2c: ds90ub960: Add support for DS90UB954-Q1

 .../bindings/media/i2c/ti,ds90ub960.yaml      | 400 +++++++++++++-----
 drivers/media/i2c/Kconfig                     |   4 +-
 drivers/media/i2c/ds90ub960.c                 | 221 +++++++---
 3 files changed, 461 insertions(+), 164 deletions(-)

-- 
2.34.1


