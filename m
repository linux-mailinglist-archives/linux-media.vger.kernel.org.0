Return-Path: <linux-media+bounces-52634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIFFMgiRjWl54QAAu9opvQ
	(envelope-from <linux-media+bounces-52634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:36:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E99AF12B640
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2F573048FAD
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1782C0F89;
	Thu, 12 Feb 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XK08zbqW"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C72DE6F3;
	Thu, 12 Feb 2026 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885335; cv=fail; b=GtC1od4V+3HFBiSwCycgVRg9MXI/ZKc2+WIcTv2JLzdWXSP77cL+XC7Cj/5qOX6qkhp0rLbgCA9Fzv5KvniXVl7dUb8NqKccch5oOvCyj0AC0ZDBRfw+SjLGXNQ7hHn7e4AqU34mQt3uj6lWMl6SlLh7lPnPAdQdq1z3lgDnciI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885335; c=relaxed/simple;
	bh=L/D4M1uUh97+0QlISXQ4qe1pcG8w1nkjcoyPdhxUOhI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEzHIeqb7X1VYs0iHWUDir3NBrfO4uloOP/RckvJyQHLErV89JKZsdAMBOdskCfbaWKjA2Td8uV4BCEtmKRe6oluUIeMVnBizEV96sEBZuBFQNjESzzbHpcM24DW+feSvGh4hb4a41TdRvOvf3akZiSXAPSFJsFZ8ltuX0zcXXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XK08zbqW; arc=fail smtp.client-ip=52.101.61.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpScelIgtwDQl4faMd4Jet3GHPBeO93f8HTw3IlViVOh9uBBeuaJ0ZJ1FnfGs3aS+OOF4jSZ5b3Z4y+T6y28dEcdzitRoaXhbSNm528AO4ZbkUWsUP0RACKDu2LjtVe899ozShY/XnWlu1rBgCYl3Up6SW1IOKiO4/Qyn4gZBTxNaYUoRC+xlLaKFEgiCsrUu/4m6WOAAOiuKiZA1kRnS63i14rCLJnQRkiN9e9AVDkZLBpdvPzTDqyUhCJg8o6NsmSZ+0Kjh2K1Vp15bYla8UseWS50jTSFrSldb1vjI8tt7WRwsMt+dru4Bi/m7OF253wKztvWRaAbBxqL+oBnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPEo44rdS7XJEhEhc/j5KeRfd8omhIM/5XHVbkKb/mU=;
 b=pDg3Bl35Qoec9E+BYx7Y34GVW40/id1UDmS1f6Dyq121If1NNlqgodeE1pZA4DFUWnZ5S0Gn4V9OBdoY8RbfdpaAq/dd8NmTL47b7muk0esSu4p2zF39P7WTL0jexlY+EDsm+4NfrEJ9TFpN+DMV+U2P6SmvB87NB3lIvmzZhaSTuNX3ZkDqI7yrvLzDIkCZ5VTI9uL9wROQqK+mr2w5Ztg8QEdO26LhHkFBBPVA0qWXgqc4WcMS76EH5cdR8WF4f3hXoHcLa9pcVT8Z5p/kprtuzYybq4aZbtwrK5Chlm3ekrSNJHq3qJXXFP1gqaLFTNYOv+hJR2VFrW0CE4ZQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPEo44rdS7XJEhEhc/j5KeRfd8omhIM/5XHVbkKb/mU=;
 b=XK08zbqWS6v9I6QZWCebjHXUilVTJx5wCglyKkyWey5U3wh9QEAXg4pXWlFI1+fuaWASDBlefTcNB/sZvTsue6Wlx1L3L1Hqy1M7TWGT5FOjspnE/Wy3+GhttRoz4l8hGDjKa/fp4j+hlC0LAeBPWMR6t5NW2WaPPHQrcoNktxs=
Received: from BL1PR13CA0337.namprd13.prod.outlook.com (2603:10b6:208:2c6::12)
 by DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:35:28 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::fd) by BL1PR13CA0337.outlook.office365.com
 (2603:10b6:208:2c6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 08:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 08:35:26 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 02:35:19 -0600
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>, Alexey Zagorodnikov <xglooom@gmail.com>,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v8 7/7] Documentation: add documentation of AMD isp 4 driver
Date: Thu, 12 Feb 2026 16:34:26 +0800
Message-ID: <20260212083426.216430-8-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212083426.216430-1-Bin.Du@amd.com>
References: <20260212083426.216430-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 649b57bf-a688-4cec-6a04-08de6a11ac1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E3zRzWyWhJTIcueVWZGfek84NRfhki0tlcyrJIdUhRo2tvXY7Bls9DPis9dw?=
 =?us-ascii?Q?irNwt/iO6MtSx3s6lmCZCW8P4eBhnjo7WZR4oyixbWiBJvRfBzKj3gfmh+Qq?=
 =?us-ascii?Q?6hV3+3By6RQrULQz7OAOBRJlY1/fLq5TijBYRqHFG9kbt8iZmvhiVOIKhDBo?=
 =?us-ascii?Q?c7ZCkNgevN5aJKEP4zxLI11wGrn1qs+szQo63QK9OyzqRQ7UK4l2+EjM0Wel?=
 =?us-ascii?Q?hAIZqIjNZk7Q3JYhS9O19XGjsg5W9M92DevuQRccyK8EOQvwk8OVPXUjVDxi?=
 =?us-ascii?Q?4UA77G1VcsZuWLeWWcAQvOGDHcho2NGOkSWSlZQsgjpWJQAJ4Kw26VCsjGKp?=
 =?us-ascii?Q?ARuU7wygCxmdxk8RA23QyUDHKsIaFYOiyb0fA8GdY5DnO2iFBLLUWHYDBRsE?=
 =?us-ascii?Q?1yvcS8wmxzWteaO36RHE5pW+Bwry2q3Rl6GogJ1YFlIbT5dPRDwHlVRB0iXT?=
 =?us-ascii?Q?6af3FkDvkRLrrexPNFFb9cmy1++AGBbqDHh4AAm8Jsd4442iUJxVPw4jNNc5?=
 =?us-ascii?Q?GLKkvA06nMiKEhb4SNnQQTDJIUl4DGPEA/R6ccMucn7BkRcfjfIYucjyIwGx?=
 =?us-ascii?Q?BW3WyImr9G6pHi+LN84Y9UCbkecqTdct4tOvhmJXryZstO/aVUfEq4sSep0F?=
 =?us-ascii?Q?VK3Vruo6dwhThDLQUQt7ho5cZp5n/n9buPTDeRic/Sza1Eeoi0upF2IdTck8?=
 =?us-ascii?Q?vjoOdn5JzaMEmvR3rV92r8jqkUhusuqO1OQJykqQ0IaOv00FRR3oHfK/okF3?=
 =?us-ascii?Q?hXw6092AYyacRRs8i/JKOZRIqoGplBMpVg7rWSUCwGuQMl+x09BTxbp5KLXx?=
 =?us-ascii?Q?q1EAnf1et8MT9j2W0P22jB7KqgnhZx96izds5FCkTdsLqV6SwYu8aCDf+opD?=
 =?us-ascii?Q?oeXor0rf1IxLqDzIpsf84bnnMPqeIKhJdLVKm501DsDaXkhT4vQqQRGpF0P4?=
 =?us-ascii?Q?tM7X6H3U7b1yadodtWgcIFDiLMKL/Q9hmHMuuNrPYy/iRVbem4I9gwkHDb13?=
 =?us-ascii?Q?vDvyjGJXSXej+fNLgR6IPjdVzgimRoKRcTsHy3brSizMsX72Cd2tFAaBP+Se?=
 =?us-ascii?Q?erJaKYSXzjvIt9qONTF/VL8tqKicpopt1ZIPCdtNdf5cExxreBuFTLUmhbQE?=
 =?us-ascii?Q?Qudn4sTU7pnEiyFOPxbFig24Wlr3xQ6KqniXFElpCIQT/P2nXLJJcgSvWlt4?=
 =?us-ascii?Q?JesNlBybe9f3YDbvn5Z5CjOTbbQd6q7cywl/Lf6nh6QQSBV76noviZFk806P?=
 =?us-ascii?Q?mZq4EguPoKM5wZrxR0J0ayRD0jkeTWxIyUXkGWBAKAMD23xSl2rdN5nvqEEt?=
 =?us-ascii?Q?aBTdXNRhOuZKXOataJn5mEyftfBOQagRFSLbmTHtSF2VatVx5e1QZSid7ib+?=
 =?us-ascii?Q?BfXqYwE5VHF+x7tasRdtJPSegHOrdDT7E0+cDiUqX4NKj/EzIR2h3BuLM2Ce?=
 =?us-ascii?Q?RcLyDQz3E+uUcQ9bFGDTS2Y461BV76OUvJ+H8lHWL3aTrrUcZdso1jKsyiYV?=
 =?us-ascii?Q?+vQLcugYfqQGp5trCw+8x5Y45btVRCyS88Au2UZHFa2dS9E6wSpKHMxks9Co?=
 =?us-ascii?Q?kYBJU43UAM6l7bVT3KtCNOJ7FlDbtfigb3RogLGejOROhDtWjLmX/ppj5pYu?=
 =?us-ascii?Q?Ib42/HxXRYcrFy+qNm+FGzxom3JB3JzOSRvS+BSKkF7kyNY/FVfADI3JX3lp?=
 =?us-ascii?Q?+ZxfJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n4CICandWRvB8edvsisrDCq6CMZGFqwePnFafPC5KdcFAPi7g4fQrjBdbNBLaJV4xVXvVMoA83UkKUhvsUMxUu74wmfkhr3NHtZnmf2LcC0dtuV/ywibb99Ei1IY1RON6BGotihSeVAEV7lN25Xw/zbDZknXfVd/MMdekRlpcSA8crZTrfRUia8aFeKFFo6IqUHkojThaTTQXnW6JOxy5TruoY28ck+h5HOshjS+xsvKxNbxqx7+O3xuZ4Zf7Ol9kCzkOcB4Ht2oA8MtBORGWlw35L5sUaYxIgzfOpHuvWlJAunpiHarTDXQ52SFxS/2zhmpVB0eESBjeLiPtwM8ncTP5PZuhkQgduKj4DY7rtW56rz45+2LkgF47NboMZ/tZDxpg+TBSqAPdbAEVs6oDO1vmmAx4D9F+WWpsJ6JdrYGGQjGBqaJjYd/g4c73JrB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:35:26.7343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649b57bf-a688-4cec-6a04-08de6a11ac1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52634-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,kerneltoast.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E99AF12B640
X-Rspamd-Action: no action

Add documentation for AMD ISP 4 and describe the main components

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 Documentation/admin-guide/media/amdisp4-1.rst | 63 +++++++++++++++++++
 Documentation/admin-guide/media/amdisp4.dot   |  6 ++
 .../admin-guide/media/v4l-drivers.rst         |  1 +
 MAINTAINERS                                   |  2 +
 4 files changed, 72 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot

diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
new file mode 100644
index 000000000000..878141154f96
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4-1.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+====================================
+AMD Image Signal Processor (amdisp4)
+====================================
+
+Introduction
+============
+
+This file documents the driver for the AMD ISP4 that is part of
+AMD Ryzen AI Max 300 Series.
+
+The driver is located under drivers/media/platform/amd/isp4 and uses
+the Media-Controller API.
+
+The driver exposes one video capture device to userspace and provide
+web camera like interface. Internally the video device is connected
+to the isp4 sub-device responsible for communication with the CCPU FW.
+
+Topology
+========
+
+.. _amdisp4_topology_graph:
+
+.. kernel-figure:: amdisp4.dot
+     :alt:   Diagram of the media pipeline topology
+     :align: center
+
+
+
+The driver has 1 sub-device: Representing isp4 image signal processor.
+The driver has 1 video device: Capture device for retrieving images.
+
+- ISP4 Image Signal Processing Subdevice Node
+
+---------------------------------------------
+
+The isp4 is represented as a single V4L2 subdev, the sub-device does not
+provide interface to the user space. The sub-device is connected to one video node
+(isp4_capture) with immutable active link. The sub-device represents ISP with
+connected sensor similar to smart cameras (sensors with integrated ISP).
+sub-device has only one link to the video device for capturing the frames.
+The sub-device communicates with CCPU FW for streaming configuration and
+buffer management.
+
+
+- isp4_capture - Frames Capture Video Node
+
+------------------------------------------
+
+Isp4_capture is a capture device to capture frames to memory.
+The entity is connected to isp4 sub-device. The video device
+provides web camera like interface to userspace. It supports
+mmap and dma buf types of memory.
+
+Capturing Video Frames Example
+==============================
+
+.. code-block:: bash
+
+         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
new file mode 100644
index 000000000000..978f30c1a31a
--- /dev/null
+++ b/Documentation/admin-guide/media/amdisp4.dot
@@ -0,0 +1,6 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{} | amd isp4\n | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port0 -> n00000003 [style=bold]
+	n00000003 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 3bac5165b134..6027416e5373 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
 .. toctree::
 	:maxdepth: 2
 
+	amdisp4-1
 	bttv
 	c3-isp
 	cafe_ccic
diff --git a/MAINTAINERS b/MAINTAINERS
index 8478789ac265..c34137e27b55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1139,6 +1139,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/admin-guide/media/amdisp4-1.rst
+F:	Documentation/admin-guide/media/amdisp4.dot
 F:	drivers/media/platform/amd/Kconfig
 F:	drivers/media/platform/amd/Makefile
 F:	drivers/media/platform/amd/isp4/Kconfig
-- 
2.34.1


