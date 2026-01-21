Return-Path: <linux-media+bounces-51248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HF6AoLicGkhawAAu9opvQ
	(envelope-from <linux-media+bounces-51248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:28:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B79586C0
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8ECC5A477C1
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA8248C41D;
	Wed, 21 Jan 2026 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MvKtv0zw"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CAA283FCF;
	Wed, 21 Jan 2026 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003686; cv=fail; b=mqcv4lbfe9826MM2cuXhm55AganCysPjuqM4BazoTyYQy6oQhCg0kmSCOR9hn+6RVA3CwIMmo8SdnNwrvZRH403PrkYwMUx/efOLmGKd9PFPcZ7Kt7qJ8kq0r6Jox1yAL6BjtME66TsvhUm6uLi5BS/AgMQE3Kc5+/qaY1npDuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003686; c=relaxed/simple;
	bh=e4k4T+9841E42wDdKrSFNliznEwQTUstZ8bKQSR2C7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K4jDKtKalqJ+Sbv8HUrXN8Nz4a9Gna6D/J3UQz/KQkkVimIo8cBSvCG/gvEeb7fxm58qBQVp8hQDWlCNJCCeYh6orFe1A3Ae8RxcNgvssu+ISAeKL6nlQS/tN2NG0eNs+8riKO7jyG/LsUw2ThNWDZPwCsPn2S2rkilt39eVcoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MvKtv0zw; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEAwmD95XZjr1yY3uw4jPfbPizZmFevWkmq2+tsfrkGhpQ1Tc+9qDsti+gPnEJ+MQrLGn6u0F3Cc+fNmJvilrVyFP0bxASeu0rAoPmfcBtE/veOUHycX29lrbytymXcSWAnZYZe1DDhYilyi/BfGAeDhzhDuD0bb260pXBtP5qAs8s0F9Z0iYPSCA8ygSDK0LoyVg0XUCrqNsGhPCQd0iyRYMceQdztJg0vK7TOHg6tUnDqa+6w7ZBdho8dWuoYGrEx/tjQ5Ug5tu217or4u7I+bAVZxCM591Sk0Edhr+wLuM3B/YIqfDIlPmlQtOYgIWlN/VmzerHBkjzrJBPND5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mEA+xNJEHktVK3Ys+ObwSM7KLbj9Z+hyHul+N+bwjs=;
 b=GhWV+EIxpu2TqMfyLN21idz2DLf6FcAgevEXARo6KLkdILESQimUOtXaRpHSXHZb2V7epM0r1MTQOiNITGHkb83d+jYkBNt6wKVj/8RKzOLepE9Qd7EX8fYAsKHsnY+96v9ZDAnsyGD1YTyox2nH5YoSaNfgY49THduL6lMKtJNvdVSifOa947NKrc/34Q/Nlv9BM3rjhAmoHmWMDL2XHEyPMr38w6JLacjPjwPSn1NLyvEV90nmuF70VeHKzB6HOfQRMA+r/SUh/fb0CT+Q+wOdsyk7Q4PEU+TO+BhqcR8ixgRqGZSnHOyPWKKKwvWXHt0sIUtqsAG/p3FQtm2nuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mEA+xNJEHktVK3Ys+ObwSM7KLbj9Z+hyHul+N+bwjs=;
 b=MvKtv0zwV/+2zOl6NMZMW115/yTnPz7MEHPD43TYSMX5ruqMyklLbv6TrvdeY9SoXFTF/ekJw1RIi9iI6LI87K8HhoDE8VPkiuK+5x49IOq1xBCSQi+02znSPO4HLOa7KUHjIa1LSkMF5yklT82p9bXU6IBKvaQD8Rd0pRyTgsY=
Received: from BL1PR13CA0018.namprd13.prod.outlook.com (2603:10b6:208:256::23)
 by DS4PPF3984739DB.namprd10.prod.outlook.com (2603:10b6:f:fc00::d15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:54:34 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::2b) by BL1PR13CA0018.outlook.office365.com
 (2603:10b6:208:256::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 13:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:54:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:54:32 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:54:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:54:32 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPI63104105;
	Wed, 21 Jan 2026 07:54:25 -0600
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
Subject: [PATCH v10 00/18] media: cadence,ti: CSI2RX Multistream Support
Date: Wed, 21 Jan 2026 19:24:06 +0530
Message-ID: <20260121135424.1185710-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|DS4PPF3984739DB:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bb086d-f09a-4bfd-3e95-08de58f49b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?65EMAW7S1xer335LKStX6LNH0JQx0kLNYaSyKPE4/D7GKhK1RaicDGwYL8Qn?=
 =?us-ascii?Q?5yhYamG/vt1//piyPanB2iG4QF+4qRzwk3NrAPX//mwNc5aHw4wzGYY8fSD4?=
 =?us-ascii?Q?/3LpFp7elyb2E9yZ8Fq2g+0SIFT9N+8ztA6prLFSTsgKMlGpYIScZ0f7yrYL?=
 =?us-ascii?Q?rqhZd2UM9aUXzZvz79r23bDQBxVSX/nNkk2dByYp3Kykh13p9+8B+5/XhN0C?=
 =?us-ascii?Q?6j7UvGvJPzWHL8m2ZkrDiGVaQ33b1u+NAYRx+uJGHVxtR9hin3PP4hkgIrT/?=
 =?us-ascii?Q?ChEbgYrNNzv2Ae4MIiUjnD2RJ7kN+cnAmQbOGgr2oAzBalLF35a1Z2AH+jhx?=
 =?us-ascii?Q?kTVjuc2fwUjP0/a7LGvR0NSvRmyEGAo1a5AuxRtYfjdrw+gFw6h2op9TGc3H?=
 =?us-ascii?Q?8/yrvthm918juzfPQJ9eaEDVroE0bx3Zpysy6oGVWu1Mxn1VlhSFM7wve+Ai?=
 =?us-ascii?Q?uJsWGhsTKXgyOvPFhAAe/k6o+POLW1TOD/AldaW8C2W2yCrlK9EC+kl9GlgS?=
 =?us-ascii?Q?WTO5sWY/t1SXVYIu9Ga7gqUIWJXlc4Tm6+m34vaTG53uLc3ZuOJuWS1OOUnF?=
 =?us-ascii?Q?41VNtlHG+0wWX/omMUdwR181JqDYFDmjn+z3OVq1Td9vhh/c1pluyuUKilod?=
 =?us-ascii?Q?8dTlVOMazxH1vADKzt5uDh4YmJ5W+ntjmGZn1OxfJ3RxOq+eoQ1TJmbZKrMO?=
 =?us-ascii?Q?5B+5dIuRCfuYYrFvkagIlqjDvc2egegRLs+rJTnW/jpjUftf0Ib1wRkSA4uk?=
 =?us-ascii?Q?seXiULCn7+xj1FHFa3mqZEEWRCu74wm2icWxIo2nJWqU3TSEsSrwdCYGiChD?=
 =?us-ascii?Q?Xtxj8lTq1UF4E55xldeTj1VYY1jml1TF5K3tALZmxKgkAlYPYAaJmXpql4AP?=
 =?us-ascii?Q?/17rjsWejNWYR68aMXaa6rp8QZbXwhrS8fuhw6PakumPIOz9YbDRyJVzRj3u?=
 =?us-ascii?Q?HrSOzW+H3SYOu2OkAxIsFAC77KuT7uBlW1bN6XdMlasyZi5bPnzpG1Up97OA?=
 =?us-ascii?Q?C4mwK8Mg+UjrFT9Ril0gtZzeUgM3a1tPiQ0+938G7wsQHC39NpRUqE4ZGz3O?=
 =?us-ascii?Q?V/XNxFa2cGexLx9ZjOouDLR/AG0fvIjNItHmRf0lfKC9fJ2ldmP/zRzBiMv/?=
 =?us-ascii?Q?qMXOQIRNSP1d5zWDI1gxZQ0V+6+ZQ0fD7fEhcBReNTFOPO9UDrSRMfpWMqTS?=
 =?us-ascii?Q?vf0AiEbgiscSFe10TN5KjogFljfFRzVkiLYGxuektVTA6A95vQc/4sFURGGU?=
 =?us-ascii?Q?/7oknciJkSwSajPqtxb1b728srKvmyJ7DXQwG/mtBk+spO4kMhapyC3Nqc+i?=
 =?us-ascii?Q?i48fv1O7HyYmGlJvvc8UZM77vMfK1aCnZ+2dgi1eJzD5tHph8Z++okxswqvX?=
 =?us-ascii?Q?KwDatly9h2lugPm239m9hLng0vOCSWTJn84d30hS/xMLkx3FM9JerVGMK2rC?=
 =?us-ascii?Q?SyzGAsTt1LJzYts4ZbciEgZ9MUT411MKghCJ0GkpkxF5+N4KhcyavyAxamzi?=
 =?us-ascii?Q?pR8rSJyOGnWKeasBPuemk0J9HD31gH79zirOiv4XTbz7imnoAmalIntESKRI?=
 =?us-ascii?Q?rQtozcN+5eCv3FXlNylUw6cJz4nA3sHs2rDfFEmtmMryx6A4QPM6UOxqqF2G?=
 =?us-ascii?Q?Cr/3mngVwR1rGFKWzwdUhqG50p+Ablr16a1lw47h2DTelPXBC4QgdvQCcZ/A?=
 =?us-ascii?Q?D0RxQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:54:33.3429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bb086d-f09a-4bfd-3e95-08de58f49b57
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3984739DB
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
	TAGGED_FROM(0.00)[bounces-51248-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ti.com:mid,ti.com:dkim];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 68B79586C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds multi-stream support and PM support for Cadence CSI2RX
and TI CSI2RX SHIM drivers.

PM patches are picked from:
https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com/

PATCH 01 :    Remove word size alignment restriction on frame width
PATCH 02-08:  Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 09-10:  Use get_frame_desc to propagate virtual channel
              information across Cadence and TI CSI-RX subdevs
PATCH 11-13:  Use new multi-stream APIs across the drivers to support
              multiplexed cameras from sources like UB960 (FPDLink)
PATCH 14:     Optimize stream on by submitting all queued buffers to DMA
PATCH 15:     Change the drain architecture to support multi-stream,
              implement completion barriers for last drain
PATCH 16-18:  Runtime PM and System PM support for CSI-RX.

Testing for this series has been done on top of media tree with 4x IMX219
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Runtime PM and System PM has been tested with IMX219 camera module
connect to TI's AM62.

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v10/

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/7be1b76ab5620f9459345de8e1e8fc33

---
Changes in v10:

# New patches in v10:
[PATCH v10 12/18] media: cadence: csi2rx: Use the stream from route

#Changes
[PATCH v10 06/18] media: ti: j721e-csi2rx: add a subdev for the core
- Remove unwanted mutex
[PATCH v10 10/18] media: ti: j721e-csi2rx: add support for processing
- Improve commit message to remove info about get_frame_desc() usage
  in single/multi stream usecases
- Add break when stream found
- Report error when no stream found
[PATCH v10 11/18] media: cadence: csi2rx: add multistream support
- Move the code to set default VC0 inside if statement
[PATCH v10 13/18] media: ti: j721e-csi2rx: add multistream support
- Make the pixel reset assert and de-assert more symmetric across
  the start and stop path
- Remove the vc_cached variable and associated checks
- Move enable_count == 0 check at start of
  ti_csi2rx_sd_disable_streams() with a WARN_ON
- Update the commit message to s/4/32 for number of possible streams
[PATCH v10 15/18] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
- Change the commit message to talk about streams only and not
  VC/DT
- Improve commit message to give better description regarding continuous
  drain
- Squash [PATCH v9 16/19] into this patch
[PATCH v10 18/18] media: ti: j721e-csi2rx: Support system suspend
 using pm_notifier
- Add comment before register_pm_notifier() call

Link to (v9):
https://lore.kernel.org/all/20251230083220.2405247-1-r-donadkar@ti.com/
---
Changes in v9:

# New patches in v9:
[PATCH v9 08/18] media: staging: starfive: Move to .enable/disable_streams API
- Remove the s_stream API and use the enable/disable_streams API in stf
  drivers
[PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial frame as error
- Return the next frame after drain to usersapce as VB2_BUF_STATE_ERROR

# Changes:
[PATCH v9 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
- Ad R-by Tomi
[PATCH v9 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
- Squash [PATCH v8 08/18] into this patch so that we dont have to use
  s_stream
- Use BIT_U64() instead of BIT()
[PATCH v9 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
- Use BIT_U64() instead of BIT()
[PATCH v9 11/19] media: ti: j721e-csi2rx: add support for processing virtual channels
- Update to commit message to s/hardcoded/VC0/
- Remove the mention of caching VC data from the commit message as that
  is done in 13/19
- Update the commit message to s/per stream/single stream/
[PATCH v9 12/19] media: cadence: csi2rx: add multistream support
- Remove the s_stream fallback
[PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
- Move the code that is accessing the state from .start_streaming() call
  to .enable_streams() call
- Remove the check for V4L2_SUBDEV_ROUTE_FL_ACTIVE
- Change the logic of for_each_active_route() usage to break the loop
  when the route is found
- Change the format variable to static const
- Update the commit message to s/4/32 for number of possible streams
[PATCH v9 17/19] media: cadence: csi2rx: Support runtime PM
- Shift to goto based error handing in the .enable_streams() function
[PATCH v9 18/19] media: ti: j721e-csi2rx: Support runtime suspend
- Make variable i and ret unsigned
- Move runtime_enable() call before notifier_register() in the .probe()
- In the .remove() function if the runtime PM state is active, set it to
  suspended and remove the pm_runtime_set_suspended() call at the end.
- Drop the call to init_dma() from init/cleanup_ctx()
- Remove pm_runtime_set_active() and pm_request_idle() from .probe()

Link to (v8):
https://lore.kernel.org/all/20251112115459.2479225-1-r-donadkar@ti.com/#t
---
Changes in v8:

# New patches in v8:
[PATCH v8 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
[PATCH v8 08/18] media: ti: j721e-csi2rx: Move to .enable/disable_streams API
- Remove the s_stream API and use the enable/disable_streams API right
  after adding the subdev for core device

Changes:
[PATCH v8 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
- Remove define for PSIL_WORD_SIZE_BYTES.
[PATCH v8 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
- Use v4l2_subdev_state_get_format() instead of using the get_fmt from the 
  subdev pad ops in the ti_csi2rx_link_validate() function.
[PATCH v8 11/18] media: ti: j721e-csi2rx: add support for processing virtual channels
- Move routing support form this patch to PATCH 13/18.
[PATCH v8 12/18] media: cadence: csi2rx: add multistream support
- Move support for enable/disable_streams() API that was added in this patch to
  PATCH 07/18 earlier in this series.
- Remove the mutex from the driver
[PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
- Move support for enable/disable_streams() API that was added in this patch to
  PATCH 08/18 earlier in this series.
- Remove csi->mutex protection inside enable/disable_streams() function calls to
  solve circular locking dependency warning.
- Mention that DT filtering is also supported in the commit message.

Link to (v7):
https://lore.kernel.org/all/20250911102832.1583440-1-r-donadkar@ti.com/#t

---
Changes in v7:

[PATCH v6 03/16] media: ti: j721e-csi2rx: separate out device and context
- Resolve bisect test fail because of undefined 'csi' variable
- Resolve bisect test fail because of 'vdev' not being in scope when used
[PATCH v6 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
- Resolve compiler warning regarding missing error code 'ret'
[PATCH v6 12/16] media: ti: j721e-csi2rx: Submit all available buffers
- Remove unused variable

Link to (v6):
https://lore.kernel.org/all/20250908134729.3940366-1-r-donadkar@ti.com/

---
Changes in v6:

# New patches in v6:

[PATCH v6 14/16] media: cadence: csi2rx: Support runtime PM
[PATCH v6 15/16] media: ti: j721e-csi2rx: Support runtime suspend
[PATCH v6 16/16] media: ti: j721e-csi2rx: Support system suspend
using pm_notifier

# Changes in patches from v5:
[PATCH v5 01/16] media: ti: j721e-csi2rx: Remove word size alignment
on frame width
- Remove restrictions on minimum frame width in ti_csi2rx_fill_fmt()
- Add Reviewed-by from Abhilash
[PATCH v5 02/16] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
- No change
[PATCH v5 03/16] media: ti: j721e-csi2rx: separate out device and context
- No change
[PATCH v5 04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- No change
[PATCH v5 05/16] media: ti: j721e-csi2rx: allocate DMA channel based on context index
- No change
[PATCH v5 06/16] media: ti: j721e-csi2rx: add a subdev for the core device
- No change
[PATCH v5 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
- Solve compilation warnings
[PATCH v5 08/16] media: cadence: csi2rx: add get_frame_desc wrapper
- No change
[PATCH v5 09/16] media: ti: j721e-csi2rx: add support for processing virtual channels
- Remove unnecessary call to v4l2_unlock_state()
[PATCH v5 10/16] media: cadence: csi2rx: add multistream support
- No change
[PATCH v5 11/16] media: ti: j721e-csi2rx: add multistream support
- No change
[PATCH v5 12/16] media: ti: j721e-csi2rx: Submit all available buffers
- No change
[PATCH v5 13/16] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Squash implementation of completion barriers for last drain cycle
- Make struct completion per ctx

Link to (v5):
https://lore.kernel.org/all/20250825142522.1826188-1-r-donadkar@ti.com/

---
Changes in v5:

# New patches in v5:

[PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size alignment
[PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain

# Changes in patches from v4:

[PATCH v4 01/12] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
- No change
[PATCH v4 02/12] media: ti: j721e-csi2rx: separate out device and context
- No change
[PATCH v4 03/12] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- No change
[PATCH v4 04/12] media: ti: j721e-csi2rx: allocate DMA channel based on context index
- No change
[PATCH v4 05/12] media: ti: j721e-csi2rx: add a subdev for the core device
- No change
[PATCH v4 06/12] media: ti: j721e-csi2rx: get number of contexts from device tree
- No change
[PATCH v4 07/12] media: cadence: csi2rx: add get_frame_desc wrapper
- No change
[PATCH v4 08/12] media: ti: j721e-csi2rx: add support for processing virtual channels
- No change
[PATCH v4 09/12] media: cadence: csi2rx: add multistream support
- No change
[PATCH v4 10/12] media: ti: j721e-csi2rx: add multistream support
- Serialize stream stop
- Remove the break statement to avoid early return in the loop, as
  reported by Sjoerd
[PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available buffers
- Delete the list node on DMA error to avoid kernel panic
[PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Mention about next frame after drain being bogus

Link to (v4):
  https://lore.kernel.org/all/20250514112527.1983068-1-r-donadkar@ti.com/

Changes in v4:

[PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  - No change
[PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
  - Add ctx identifier in the dev_err() message
  - No change
[PATCH 03/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  - Reduced the name string lenght from 32 chars to 5 chars
[PATCH 04/13] media: ti: j721e-csi2rx: allocate DMA channel based on context index
  - No change
[PATCH 05/13] media: ti: j721e-csi2rx: add a subdev for the core device
  - Add .enum_mbus_code callback
  - Replace statically allocated struct with a global static const struct
    v4l2_mbus_framefmt and used that in the _init_state() function
[PATCH 06/13] media: ti: j721e-csi2rx: get number of contexts from device tree
  - Fix the drain buffer being leaked
  - If the shows more number of ctx than the TI_CSI2RX_MAX_CTX, return an error
    instead of warning
[PATCH 07/13] media: cadence: csi2rx: add get_frame_desc wrapper
  - No change
[PATCH 08/13] media: ti: j721e-csi2rx: add support for processing virtual channels
  - Call ti_csi2rx_get_vc() only once on first stream start and cache the VC data in
    the driver, use the corresponding VC in all subsequent stream starts.
[PATCH 09/13] media: cadence: csi2rx: Use new enable stream APIs
[PATCH 10/13] media: cadence: csi2rx: Enable multi-stream support
  - Squash the above two patches into
    [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
  - Use already obtained csi2rx->source_pad in enable_streams() and
    disable_streams() call
  - Update commit message with the reason for using a custom helper for s_stream
    instead of v4l2_subdev_s_stream_helper()
  - Use v4l2_get_link_freq() variant that takes pad of the source as its first
    argument instead of the one that takes v4l2_ctrl_handler
  - Call v4l2_get_link_freq() with bpp = 0 to prevent fallback to V4L2_CID_PIXEL_RATE
    in multi-stream case
  - Use lock guards to simplify error handling
  - Call csi2rx_update_vc_select() at first stream start before enabling the controller
[PATCH 11/13] media: ti: j721e-csi2rx: add multistream support
  - No change
[PATCH 12/13] media: ti: j721e-csi2rx: Submit all available buffers
  - No change
[PATCH 13/13] media: ti: j721e-csi2rx: Change the drain architecture for multistream
  - Fix checkpatch warning
  - Change commit message to give a better description of the patch

Link to (v3):
  https://lore.kernel.org/all/20250417065554.437541-1-r-donadkar@ti.com/

Changes in v3:

- Drop [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM from
  v2, support for runtime PM will be added in a separate series:
  https://lore.kernel.org/all/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com/
- Change the drain architecture to prevent FIFO overflow in multistream
  usecases.
- With the new drain architecture, we don't need the the driver to wait
  for userspace to start streaming on all "actively routed" video nodes
  before starting streaming on the source. So, revert back to the capture
  architecture where streams can be started and stopped independent
  to each other.

Link to (v2):
  https://lore.kernel.org/r/20240627-multistream-v2-0-6ae96c54c1c3@ti.com

Changes in v2:

- Change the multi-camera capture architecture to be similar to that of
  Tomi's RPi5 FE series, where the driver will wait for userspace to
  start streaming on all "actively routed" video nodes before starting
  streaming on the source. This simplifies things a lot from the HW
  perspective, which might run into deadlocks due to a shared FIFO
  between multiple DMA channels.

- Drop a few fixes that were posted separately and are already merged
- Fix dtschema warnings reported by Rob on [02/13]
- Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
- Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
  streaming
- Only allow single-streams to be routed to the source pads (linked to
  video nodes) of the j721e-csi2rx device
- Squash the patches marked "SQUASH" in the v1 RFC series

Changhuang Liang (1):
  media: cadence: csi2rx: Support runtime PM

Jai Luthra (9):
  dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  media: ti: j721e-csi2rx: separate out device and context
  media: ti: j721e-csi2rx: add a subdev for the core device
  media: ti: j721e-csi2rx: add support for processing virtual channels
  media: cadence: csi2rx: add multistream support
  media: ti: j721e-csi2rx: add multistream support
  media: ti: j721e-csi2rx: Submit all available buffers
  media: ti: j721e-csi2rx: Support runtime suspend
  media: ti: j721e-csi2rx: Support system suspend using pm_notifier

Pratyush Yadav (4):
  media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  media: ti: j721e-csi2rx: allocate DMA channel based on context index
  media: ti: j721e-csi2rx: get number of contexts from device tree
  media: cadence: csi2rx: add get_frame_desc wrapper

Rishikesh Donadkar (4):
  media: ti: j721e-csi2rx: Remove word size alignment on frame width
  media: cadence: csi2rx: Move to .enable/disable_streams API
  media: cadence: csi2rx: Use the stream from route to get format
  media: ti: j721e-csi2rx: Change the drain architecture for multistream

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
 drivers/media/platform/cadence/Kconfig        |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  508 +++++--
 drivers/media/platform/ti/Kconfig             |    1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1208 ++++++++++++-----
 5 files changed, 1308 insertions(+), 449 deletions(-)

-- 
2.34.1


