Return-Path: <linux-media+bounces-55608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPNgGMjTs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:07:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA355280308
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0C23303409B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EEA3890FB;
	Fri, 13 Mar 2026 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L6z2iia0"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BC0388E4C;
	Fri, 13 Mar 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392835; cv=fail; b=WfBiUDQfeiWySy3gtC61B5dB62Xt8Jb/blK1eMH217U2C26VMnFQGJwX1IL3+NYCDlcphg6M4H98iQhd02FLD7uKBhjjxZENmfTShkpb0CQGRe98EYymMSoFyu9Y9WIzmzSEouXgeevCKn30Bx4XmaErtAe7h6+dlv+iwLkntxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392835; c=relaxed/simple;
	bh=Xr/ApYpg+sgSlp0Vmh1ILPRocsLuyotrrKCs2pV7Ot4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bdAxlfP1JZW0LyPg9qkjVPjAG2UqVcU+e33IF2Ttho66DjZG+gIbgSnn0nCyKC9MJUtl+NmHJMIAbU9vdRIc+kUrjOjFpMmNko+G5G6VMp2zS8FMD/UnKMD2wlYx3q72/nmr7gSqEiquY7+blBakqEVw/azSryxCWl9Q28qFM2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L6z2iia0; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nR+EJJpbaOFO7WvOF5Mz2CUo2A8naAdPctqsjvw7ub/kkv5gO93zwOb5kmL07hMOnjXTqG21vhCjYxkSLe2g6MWBB+WjuwnZ/diBE3pmpgQ8ZEX+tQp3pre0AkbMKSh28X+ejOTC7QUV9FM/GmFM7dCK5uSkLZatvjlfySR/mPS5yOggNgbhCG4f+Kpw3LEFvIiR1Yi4db6UNQM0Y5/iqzVFc5GLlmibJZnVWpFm3ulEQ9l5KEahdRkcfnjHduzBFjyeXrpOLkWbsph/8IY+CL4uiM5CsFob7iq3zoiQDkJZrxdpkTaWyhn/VDNSwo4Q0rddqsGXkOMFtl+xQdSSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qibd+OOnrI66XVbmkPIQP/UK3q1cBobN81ofF8ojFxQ=;
 b=BVas0oCL6aGoZcprGPy68/N/ybv3N1GPkH6XDMg2vp08XdDxb7w5NGjU1wt9Z0ZAqOlbW83q+05sAYxgOi/zbG1IUVk9BlM55KbQdqDCnn4JbYE7TW1oTUsS065tBrekEZg2+TdXQ5D/mKtm1YcZT8DOutf7FX6OE2ll+iOKRaerPIPyTnsj7IkRQ4IiaAm36Skr+uBggFBvEQX+vV30ctiYJD3vclZ28dhB+A25hzgZyRHKENbew9l5eJxRK+G6piLMsGR1EFKqQQEE5AO5kQEcLhRYaKcyvG4SRTqb6kAxOIaxPoPBJJKdJHE/b2et4jzULTIvetyA8hS+Ny5JzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qibd+OOnrI66XVbmkPIQP/UK3q1cBobN81ofF8ojFxQ=;
 b=L6z2iia0JbJA2ub/BDRxzD0mbPvoYWTMmtAkxgSOMvCDy1k39JvoQhbaiurZxBB68SKw1GoiGhnYwibSizosHvpJs1yUdHP7LzslnyfUVokELDXY5spyBAsW13Ja9vgsW5Bsc2mjz1MAChl0SN613JQ3zpFAXAa9GsFx9oeUGsQ=
Received: from SJ0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:a03:39c::17)
 by CH0PR10MB5035.namprd10.prod.outlook.com (2603:10b6:610:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 09:07:09 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::b4) by SJ0PR03CA0342.outlook.office365.com
 (2603:10b6:a03:39c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.28 via Frontend Transport; Fri,
 13 Mar 2026 09:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:07:09 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:09 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:07:08 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bU274611;
	Fri, 13 Mar 2026 04:07:02 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v12 00/17] media: cadence,ti: CSI2RX Multistream Support
Date: Fri, 13 Mar 2026 14:36:44 +0530
Message-ID: <20260313090701.646534-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|CH0PR10MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e53eec-370a-4914-ed3d-08de80dfe845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UCcGUsOf206hh0rK2B3nNcBBiOpjlv93vu0I+d2+QXW87Wq9GTAERfqw42FAUEhC9QKdbD+Jxob6wrRaTkSvQbcXyamY9u5+viFTSAfhG8BLXdOk8gtDzcEYLp2K115+33e+hN85b4ei4CsE0aPWpU4eu9aU26j1Qp/VfeMB4HvFjnd9vwiD9EXf2ospVWTeHkK/Pe0iC34Yj4rRzHZcVOywvRqPhLJsqDMfzLSqjFJd1VVBXf56kLRBnU8+c951qT5c80yr9MJDy/Z4gugwFhD4/HGV3t62fSWeNzrWbLTL1hlvgUulurthHTQj7x4YtBWpwAjkXRM+9JfZ85ntVAnAQqa8YOFRVvF9yz8WPdA5hIzEFPwTmxxtplmIhTjAqLVeodCGzU/IZyXqDGC7qy3yohsMDoJVbmzCWGJrgbgB8Wg2rZ6cFqItY+OPGNayGALR68yXU/3ZozP6Bw2rD+gEyODrJESNxBIklSeokBukRNKcxVKiRi0LxPklvvkpmwlixWXg8dZOC5uC9abzoxSAMbayj84qh1hKV0C3u6wK2q3Jdy6f7+qkg78cNot1RYpCwjGkA4Fv/Yqv186JftfCzznuOLyhDUnGQCTOnuhVMGLQoJ5bVpRvJi5Tg53qu521UNNefEHFuiZv7lnPv+D9yyX13MhTGfsLC/wFsnCi3XNw0M6FzZk2ZKv8k/qQpgCIU/8p9f2hFcFF49I+0r8VKjvtx8SxCkoX0Vb2ZQo=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lEEOogWGZwu8VHN2MkyEtNA0DyWJ6s0siNur4pUs7ANN42BqXE7jFEcwMx9YcG/ltVYoeZn65EOOervtMBfuBwbtIC47Y2afkR2usD59OYtESzgXMjDOUs2hCRcPzLUavhY1gN70sS7K+ndpM3FuNPZZMSJvyYACnENKvKrU6i9V5fUgix73NtjA/wOBh89kdNfN/8CMC63QJw9CBD6YPmngln5cVTduH4qxJT6mD1Q0HMBb2H4QAMG/kS6Ivz8j97zo105+0cXQjmacO4pDlBBdg91vHd6yXGNn7Do4dqMsJHk7JzChXssb6uE0rhPkSzdijdvANHL5VqotRs9lrVz/XY7IDKyxGos0ZJmFx+jTmYaxFtckQAbjc5BlXT2D098K5ykcGSaYCtK7GbnJYC83PJCsFpOHt66nUjmlRgiyzp9fmn+XdWYq8KwVdad9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:07:09.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e53eec-370a-4914-ed3d-08de80dfe845
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5035
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55608-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:mid]
X-Rspamd-Queue-Id: AA355280308
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
PATCH 11-12:  Use new multi-stream APIs across the drivers to support
              multiplexed cameras from sources like UB960 (FPDLink)
PATCH 13:     Optimize stream on by submitting all queued buffers to DMA
PATCH 14:     Change the drain architecture to support multi-stream,
              implement completion barriers for last drain
PATCH 15-17:  Runtime PM and System PM support for CSI-RX.

Testing for this series has been done on top of media tree with 4x IMX219
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Runtime PM and System PM has been tested with IMX219 camera module
connect to TI's AM62.

Follwing formats and resolutions have been tested:

Format    | Resolution | Sensor | 
----------|------------|--------|
SRGGB10   | 1640x1232  | IMX219 | 
SRGGB10   | 1920x1080  | IMX219 |
SRGGB8    | 1640x1232  | IMX219 | 
SRGGB8    | 1920x1080  | IMX219 |

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v12

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/85d2f1ceab61fdc4e3340349c12823b4

---
Changes in v12:
[PATCH v12 06/17] media: ti: j721e-csi2rx: add a subdev for the core
device
- Report the format not being present as error and use dev_err instead of dev_dbg
- Add .has_pad_interdep
[PATCH v12 11/17] media: cadence: csi2rx: add multistream support
- Add .has_pad_interdep
[PATCH v12 14/17] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Remove debug print when wait_for_completion() timeouts
[PATCH v12 16/17] media: ti: j721e-csi2rx: Support runtime suspend
- Init dma and request channels at probe time

Link to (v11):
https://lore.kernel.org/all/20260209183456.1906327-1-r-donadkar@ti.com/
---
Changes in v11:
[PATCH v11 04/18] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- Remove register write that caused bogus image for SRGGB10
[PATCH v11 10/18] media: ti: j721e-csi2rx: add support for processing virtual channels
- Update commit message to mention about DT being handled
[PATCH v11 12/18] media: ti: j721e-csi2rx: add multistream support
- s/form/from
- Move code for falling back to default VC and DT inside
  ti_csi2rx_get_vc_and_dt()

Link to (v10):
https://lore.kernel.org/all/20260121135424.1185710-1-r-donadkar@ti.com/
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

Rishikesh Donadkar (3):
  media: ti: j721e-csi2rx: Remove word size alignment on frame width
  media: cadence: csi2rx: Move to .enable/disable_streams API
  media: ti: j721e-csi2rx: Change the drain architecture for multistream

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
 drivers/media/platform/cadence/Kconfig        |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  509 +++++--
 drivers/media/platform/ti/Kconfig             |    1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1219 ++++++++++++-----
 5 files changed, 1320 insertions(+), 449 deletions(-)

-- 
2.34.1


