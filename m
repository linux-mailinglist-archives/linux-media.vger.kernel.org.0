Return-Path: <linux-media+bounces-62254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPJeDP+jDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:07:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E458D499
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7507930C26CE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230EB3DC4B7;
	Wed, 20 May 2026 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ASvAQYRd"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86D3DBD74;
	Wed, 20 May 2026 12:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278463; cv=fail; b=fgyrx3n2GB5f1s0LK3TBKym3m6l1SRDRjvWZVBdb/nRJLfyufNkE8toXFXm3aJ3lfeTDVvrGPJqL/ks1ETID//ktqQe4R7qVIMRulKPpA5Ff2vFp7lSOwG2ggxtuSmkHdBI6iTRvcwIzaOgcQmA/QWI2aOX8Mly7jnECEyix6mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278463; c=relaxed/simple;
	bh=Lta/agtx1R/5P7aK9d78MqHf5QQkwTHcW2IPJM1VNlk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iWBL9tFAGt8hQZGQrxOII9JJfPDNVw10FH7d6SxqALo51aCLmStxVzOX9HVk3sDfaANk8IUlc9Jado7xbfWnKMka/uL05y330vbm/4XdeGi4VL5xo4FS6AnBfeWx0/XvSAeNGLaMHoLvtIQRmZ9DZtan5Rm3A7eSdYP2ogRHSiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ASvAQYRd; arc=fail smtp.client-ip=40.93.195.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oP2jbL9i6jzY+3OiofIqJvbBR1toBm6sTEX2vZ4xK/Xo6NE3P2flieyKzQG48DvixRjTDh6Hey7EY+gCadh7zTS/9ELqrcBARAHAH5qaCDBR3chaOWjrGJeXfH27JRRQL6pU2btb9uv2r6dYI+9hnBDtS+1TiY5peuOF3/EQv8hDNqSwu4KrGpIscg/UCR3i5VpnB1e3FUpnsxJ0AP8V3H7EcyZXcjEQX11EBnjgRjj8e+nSky3r3FtbgxG73T2dwkTU7iZEbtwtqGvzMi+7NftfReerHWv4jUAY4jXLb4EqLy/fs0rqxsW/wmmuSQr5WdXOBudl0ncecvqXF7hwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny6c72rJmCYfd2ckAnRd0/HqV6xu+Lno98w41y4ZpcM=;
 b=FCuQAlNYQ5gazgdFT4n5i3sKouyq/ncDaaJJP6L8IIqvLMtpD8o7QazbF+D0zErzen83qAHJKZRfiRROVJlnFIdD3WyleX3rId1H5k5siwu5vt4+uSZiAGumnFckbg+GETZbzXyeVmZYT/+U4FN4oG5HQqp0ViVZ0t0RKpvPosGbnsQzx1DxYxoTzVLTar6AM2cCaYPJOc5bVflRvhoCwSbL2J4pPiJiBZ61D4XG+pF/OTuvBZo1QwCLjmoiAOXLbzQmMQ+FrKB5ffJGCJgQorw53j1gjqWufaRG0B6HMAeGCtLkZd0ARfzq+lDIbchMalyL4pAonP6U7zUgKmN8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny6c72rJmCYfd2ckAnRd0/HqV6xu+Lno98w41y4ZpcM=;
 b=ASvAQYRdpi4bDauFoVBQYE1dCNhjo2W2gJGZP/sPjWnh4cchlpXl9zvDvEvePC04bEE3MwW3U8WhJPGl37LUTCCQwuBbphwl8/wFIRldCE3b6oPTLcQzrxQLvuINO8VnJXKhMRHJS1ZP0la9UICBEKsW8Uv/0HHF4Ut3RCTgXqo=
Received: from DM6PR07CA0089.namprd07.prod.outlook.com (2603:10b6:5:337::22)
 by DS0PR10MB7455.namprd10.prod.outlook.com (2603:10b6:8:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 12:00:56 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::77) by DM6PR07CA0089.outlook.office365.com
 (2603:10b6:5:337::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:00:55 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:00:30 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:00:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:00:30 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3P1914726;
	Wed, 20 May 2026 07:00:23 -0500
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
Subject: [PATCH v13 00/17] media: cadence,ti: CSI2RX Multistream Support
Date: Wed, 20 May 2026 17:30:05 +0530
Message-ID: <20260520120022.539913-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DS0PR10MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 360e40ac-1b61-4aa9-bf70-08deb66772c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|18002099003|3023799007|56012099003;
X-Microsoft-Antispam-Message-Info:
	PIqOeMaJJrsClCu4Kak9aqs4e+Rao1fudaMugLAhwDt0FumCKcQ++kI7u06Xo9rsNqRXZfhCJ0suqRSmlbBI+n8iOznKyLwe2sfOy6QBshqylkewtR/gBxwEmoeniAo8EH2rltIpEVBsV0oqkd0DRvC/wYxJFfdpvOT6dP98DimR4y5ucF0Sti+kypfa8Si7Fz29JxuHqhaZSVwL2mwRbDRRFbZpdwKYemyST8INCVFo/5bu+RebjGvgCsFHWpG2ER/4gkq+6VP8k+cqpxzsg4B03RmfU7TNPEupoVFUJ73xJXK0fZJqlKWOGjSNyA05ZdBmYnQzH005uZRw7YX3/ROddFnaTHCxbjQADdncruwB9tPQZpR7K94B/S9l6EBUtZfiGgfheJpT35gBzIM47U8UuBzYgr/OC7tOOqXhbIDfs7Py8JFtfLf0hoaLnpAygVo7pdVD9LasPa6u4bJA0Nm2ehwvnnpHA4W9abqqDNwE5Sh9zZKzUx7p4BYz1SDksCfnh6mAoG+qLIkZp0ZJHB9C2aHfh6DdzPqINJotGsDo4StzdXCPXJmjHmcC9DLy8Ttjv9IXwbRPGWEOiITfa/jNTWGbfxU8I/sSjNwWYcF+Mzhcm1D3FDheAeXBV8Qry+B7RGzPr0q02qzTKxzP7lq4b9nqndKeZ8P/8VhvqqxwVNo1pivcK/Bq2aHGWKzcCwtBbNLZuaIMxye0J1kmj0/MOi4P9p+GvhNa+/fGWYI=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(18002099003)(3023799007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+tJ9UikfJroZcBZgpRDgcxXnMdaDoWI6e/RLC8JqHlYyX8Ao2eG4f2QzHmhgMFhdfSsXSnfso5C5DjVutiI73GvMCM/eNES4S04011fjZ6+GvRqhR+n6MItIRhmhXCQVSAWt4CT1buZ0Y3eZ7kXB5JAVK0uUy/698MhXd9cqrbPwGrEh32EvDMyEM5cbl3SrhSgLJZIAzMmNkoUYyzdls60udDxud0Yz1Aj1A4AiZ01crMZmIGDPzzHe2qYzJDbYbw4vN6K6q8wEm7oi/B7QFpW8m1z0goIgdwMDkyTYS7c7UOYqDrwYOTqRCCvyDQ0K4+wXN1M0HIfvp+IDKfu5D55hEc6sJ9xcEUp6rIpoaxs150UfKh8pE9yEf2rvuQWCg+2OEv/ZiekutIy/VVFGK9ZK7YB8stIeMHwHBvCEa22pYqoW/wd36WiYHQthDpbb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:00:55.5891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360e40ac-1b61-4aa9-bf70-08deb66772c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7455
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62254-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ti.com:mid,ti.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 995E458D499
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
<>

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/167939426647a158f93e6fdd5cafc73b

---
Changes in v13:

# New patches in v13
[PATCH v13 09/17] media: cadence: csi2rx: Add .get_frame_desc op

# Changes
[PATCH v13 10/17] media: ti: j721e-csi2rx: add support for processing
- Fix error handling for media_entity_remote_pad_unique()
[PATCH v13 11/17] media: cadence: csi2rx: add multistream support
- Add csi2rx_get_frame_desc_from_source() from [PATCH V12 09/17]
- Remove V4L2_FRAME_DESC_ENTRY_MAX check
[PATCH v13 15/17] media: cadence: csi2rx: Support runtime PM
- Declare i with the for loop
- Use while (i--) instead of for (; i > 0; i--)
[PATCH v13 16/17] media: ti: j721e-csi2rx: Support runtime suspend
- Remove Redundant initialisation of variable i
- Declare i within the for loop

Link to (v12):
https://lore.kernel.org/all/20260313090701.646534-1-r-donadkar@ti.com/#t

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

Pratyush Yadav (3):
  media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  media: ti: j721e-csi2rx: allocate DMA channel based on context index
  media: ti: j721e-csi2rx: get number of contexts from device tree

Rishikesh Donadkar (4):
  media: ti: j721e-csi2rx: Remove word size alignment on frame width
  media: cadence: csi2rx: Move to .enable/disable_streams API
  media: cadence: csi2rx: Add .get_frame_desc op
  media: ti: j721e-csi2rx: Change the drain architecture for multistream

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
 drivers/media/platform/cadence/Kconfig        |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  449 ++++--
 drivers/media/platform/ti/Kconfig             |    1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1220 ++++++++++++-----
 5 files changed, 1260 insertions(+), 450 deletions(-)

-- 
2.34.1


