Return-Path: <linux-media+bounces-52632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNOuETeRjWl54QAAu9opvQ
	(envelope-from <linux-media+bounces-52632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:37:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B320D12B686
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8E5730D6DC0
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C339A2DB7A7;
	Thu, 12 Feb 2026 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YsiFYOha"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE812DAFBD;
	Thu, 12 Feb 2026 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885323; cv=fail; b=cX58GS/M9IHdBCrpvKTbKzpH+sacq9COJYtR6zDQdffjtc3++aWEIhQb3cP9zZW8bunWVSFHg9CIuKvVTksveWKWLHoL5EFSBO3b2RHvE/IpjzOIi1hcRUuYxufMDYE/IbCw5FN4rR+nf0nqD5stYR1UuGE1vxvPX7w4eB03QmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885323; c=relaxed/simple;
	bh=dNeMeLVDeURpfq8dz72NWgnSEKBXNbnCbkJuLsC1UzU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4Q4cAGTEutSPibYlLK7EtglnSWB0svOEXovVygUnpc2ndM6bv4YczaslRt9kw3+pOWFQ7xp+JbOIv9FxvxS3onnwlZD5NuaLMP4aPcxM7Lgqw+nP4CcOvzBNJLwHcitzqxpXn49EZG5/6XHlOnXtRbRcbDK4WT8eIhVBTvHQv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YsiFYOha; arc=fail smtp.client-ip=40.93.201.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eND6QVaeMtWM38VzxaZwHMTK8ps3dslBMKD7dDqPdPu8aw22qdciQ07xlpT1ojhzkOV1r7/9p155iaeHwMjj5ne8sk9iVByVND90O+NhETScLa1a/lyOn0H4ZpygXY2D6oqQaQdjq94ttLxgjE+q7jlm9caOPU/Uaf4nsp8N3qndBgqQ5oWif4gwXdgy1OVz4stEcMC9In7g2i3ohjd5ChlmEHDP72GfuXWvuqCDxE34u8Fv4rrllP9Atj4ad+27patfAFqmytVJWvWyeSpRwf54pSRMOT4e/e+a1Co8xmbL1VqMQ72W82uvpZvpE/f2DqfUYPdRHiEfivqnqUXX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYw4g5Dbn5sbNS8Uvn/wiyVa1Zo7pZOsoW0GdNYUywU=;
 b=MQ39KlFmwtQizjlzcSbaETKpq/2cxDDR+wrOQn4TAj2cCNnQpjWxfSoaaqBq/ltpA1RIqZGNAfzlKkeWIvOzt7KqnTrFcpZjBAhBMA/JcfLmNvBMWTfgeqj/HWNfQcjyzDCnarTztHGHHW6ozQNiYZjUKep5tX1eGc38hUpZKsLCXxBh2EOyLl9drBBHHJS0pJvdfdOurrz0nN9anKZJhxjsAMtZdbQeMny/PoiKb7t4bDoa/T9Iu0lZn/Vy2Iqh0i8f3JE/bScvQ7Q4RlWJVK9fWv6Ttl5mFktoJIHxhgtb+hNvjVZaKaqA4nHyBIBAouqe52dtAuLukVo4oHl9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYw4g5Dbn5sbNS8Uvn/wiyVa1Zo7pZOsoW0GdNYUywU=;
 b=YsiFYOhaPRDBux2uFFP9oji/KJddDu5CfSIYAF+vn57ZxDjT7KsN8kiQpa8UPQ1oc/d4qnzB7Vf0kCOlOCR+vIxHKeVieA42huMH6tUNRtEGe1amIJ+m9V/rIksbrIYcNu4d4cx+lDEICSc1waOpjnf3KZu7X8N/YENUdJvaAeI=
Received: from BL0PR05CA0022.namprd05.prod.outlook.com (2603:10b6:208:91::32)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:35:15 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::87) by BL0PR05CA0022.outlook.office365.com
 (2603:10b6:208:91::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 08:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 08:35:14 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 02:35:09 -0600
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
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Alexey
 Zagorodnikov" <xglooom@gmail.com>, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v8 5/7] media: platform: amd: isp4 video node and buffers handling added
Date: Thu, 12 Feb 2026 16:34:24 +0800
Message-ID: <20260212083426.216430-6-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d44e1f-e479-4c5e-5ddc-08de6a11a51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9wnrLYsPw93qxG9/uwdwYnKijQsRVSCNxGRL/IXzSnJxqb8K81Q94EqoSV2B?=
 =?us-ascii?Q?GkbYZBeWxTRmncMAAZT7YwXoVI4v9Y/OweH3NnEApsjTynmu9LLavtkNB8lY?=
 =?us-ascii?Q?4DGeVyN8A/C3+R+WuPxPLGVZdS2z+U87Jx03ky34NWedvp6rXmq/T/MzBrFf?=
 =?us-ascii?Q?Aa0cA7Cgz+jTtDhjUAYYh+2I0t8Uz3i6bInUkncHYcK+2kA1040GtsbDEeQT?=
 =?us-ascii?Q?14Ao2vbkxa5I5abcE9UF8L1heWl2lwwq75I5/UkuoWgxSHdNMiHe/B3s3525?=
 =?us-ascii?Q?ZVkE1SGJR15LoveeFuxMWUCrUoOURfpN65uQ3TQeUxDvRQ5ewQ5sQSI6suWc?=
 =?us-ascii?Q?pjH29WRzrdh4k77kjGZtT45KQC+PXlneUZbU1SQvI81T5s0kCYkrAFDenjpx?=
 =?us-ascii?Q?0lrj6scT3fZReck3yU2tNNcnuClAmQugVezqSBmT7RT6roLW+fxNBijeQH/8?=
 =?us-ascii?Q?pDDVzpD4WxX1Wb4pyCU9Tr3aACYQEZuiVhH9E9inf25GKv2ckJz3uxFZeqt0?=
 =?us-ascii?Q?d6k7sDKQNRfGCH9fQF0b19vwP8r7DC8EVk0w67NHYQpSEdFYUHDqzDYeYws1?=
 =?us-ascii?Q?1cnDzGF2u6xfWBX6Usy4GKSHTLcRakNFdVt0Y7Bf3A+Gf8nGxs16FVkKN8mK?=
 =?us-ascii?Q?R+6GmR5xGfST05hje4gdVWS5R8DVthUd8STL17ggiFfCzYsXpsktQBNI7J++?=
 =?us-ascii?Q?DXD0Rn6cySTjmNsTNTIGqb7B3L2EQStMcq7BhysVTeMPKlrGkVS+6Lc1xW5A?=
 =?us-ascii?Q?q4458ai/GsyRxswuOvubzsfy1Q07BZYAoajl8cZskhNah4Fjpi+PBq0H9HqJ?=
 =?us-ascii?Q?0DiO6siVdEN3M1aXnN388cAswzVJBF+P50JJuiaerFay4Oedq+lXbsK2ANpj?=
 =?us-ascii?Q?W7MFYDKZd4292j6w6iujTho0dM1SVyD8UWN4yOArl25vAAZ+Ay2jZeBl8AcC?=
 =?us-ascii?Q?fpvmY9KO97XytD1vQbGFKcm44jsbqrAZ04l5GL9c2gfvV1PC9nFHpV6kYydg?=
 =?us-ascii?Q?su0Hh915eFjTOCiaLK2/qcCp2xH5IBoBGLcFcGpwIjA0jCizFnjBjoiNvQXe?=
 =?us-ascii?Q?+cyV+QADGW2SqVnmijbEhtK8vrNNk8cMwPbJowPngC0u8XEHgKYuw2LxT9FM?=
 =?us-ascii?Q?6HozC0ZlnxVqAr9ORIw54iLqdm03YD0pOoXQaU3gwTpHSwLa/XT9EMVOCaGO?=
 =?us-ascii?Q?ECv9h9Q2Sk2xbd1GF/fFakqfPioWF/EOXpatMvj25CWvzRknQUqVUao1tTYq?=
 =?us-ascii?Q?+ePY27TDfRYJIhTstoP1rDu6BoG+WRrr5Dr0VKRDAQvSnwCYVrYrcFTGF3ma?=
 =?us-ascii?Q?43/lrK7Tij6UTzWsjNQz57LCGzw8wx18bLJFzDEyw9OTsxjo0BSmlzk+plbk?=
 =?us-ascii?Q?KjotscRMhJiH16au5NV75wGBmufi9sCzr7tC0MloiZbYWS37gK8iKsoPoObh?=
 =?us-ascii?Q?/071arsv4y1Vr7uFNfCQTdFGH1wRz6sfCQRr/DO+LuKlwPso9HjxNkfd04lV?=
 =?us-ascii?Q?1NeTptAa+NlEGqhVsUIZJykF4vdMMKZp2QYkJS5gyPcBV1588jWZFry16SBS?=
 =?us-ascii?Q?ghT2QumLWgAZB9CmFS+qRBee4uOjiyLO3d5dFj1yt9JBP7HNVuUxybDXamK6?=
 =?us-ascii?Q?nsg3bWAV5z9zRw5ITMsvzcU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c0lpbSKstN5Ofa3HI4scOcNJvSitmuWlew2gKyV/9cORpc8v0x5KM6nmSIPU8Ijlnph9+VSOsvEawOaCZv94qqaLGKGW15Sa0VaVGmilooghNMRmK9z7AaJWHhkHh19nDjHcNS0cVlgjNlWMjToweRH9RwrNW+D2nVjCGQf7W3iRjD0BjxW2oYHiAVXwnOW8xqFVOKwJn4N716obmrO6RgK6KdrKaufYMsXwxHGQkx4mH9S7eu6HQSbWwaZG/JiBDAEfLnFYCY7+SRHdCDkozs3svvWmA0Aoe32pQ9IRytdx108KHeDRrRaCUr6LXYZozJph1dC2gAMmDehNo+H/6RwnPg4X32kDvwEquf/7RPbEMFYDBTpbt3FfzG7MTHnUEvbnokJzoM1oYcjIRqbDnCobj2TT/K/x/L8xQKvDxC0hR86jJ7zEfRHlzIu/yq/y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:35:14.9857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d44e1f-e479-4c5e-5ddc-08de6a11a51b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52632-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,kerneltoast.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B320D12B686
X-Rspamd-Action: no action

Isp video implements v4l2 video interface and supports NV12 and YUYV. It
manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
buffer related fix from branch v6.16-drm-tip-isp4-for-amd on
https://github.com/kerneltoast/kernel_x86_laptop.git

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                                   |   2 +
 drivers/media/platform/amd/isp4/Makefile      |   3 +-
 drivers/media/platform/amd/isp4/isp4.c        |  11 +
 drivers/media/platform/amd/isp4/isp4_subdev.c |  13 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h |   2 +
 drivers/media/platform/amd/isp4/isp4_video.c  | 799 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |  57 ++
 7 files changed, 883 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 48ffc8bbdcee..80c966fde0b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1151,6 +1151,8 @@ F:	drivers/media/platform/amd/isp4/isp4_interface.c
 F:	drivers/media/platform/amd/isp4/isp4_interface.h
 F:	drivers/media/platform/amd/isp4/isp4_subdev.c
 F:	drivers/media/platform/amd/isp4/isp4_subdev.h
+F:	drivers/media/platform/amd/isp4/isp4_video.c
+F:	drivers/media/platform/amd/isp4/isp4_video.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 7e4854b6a4cd..3fa0ee6d8a96 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -5,4 +5,5 @@
 obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
 amd_isp4_capture-objs := isp4.o \
                          isp4_interface.o \
-                         isp4_subdev.o
+                         isp4_subdev.o \
+                         isp4_video.o
\ No newline at end of file
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index e62f5d652d81..9480dfffbcb2 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -173,6 +173,17 @@ static int isp4_capture_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = media_create_pad_link(&isp_dev->isp_subdev.sdev.entity,
+				    0,
+				    &isp_dev->isp_subdev.isp_vdev.vdev.entity,
+				    0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail to create pad link\n");
+		goto err_isp4_deinit;
+	}
+
 	ret = media_device_register(&isp_dev->mdev);
 	if (ret) {
 		dev_err_probe(dev, ret, "fail to register media device\n");
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 6d571b7f8840..5202232d50c5 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -467,11 +467,13 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 	     meta->preview.status == ISP4FW_BUFFER_STATUS_DONE ||
 	     meta->preview.status == ISP4FW_BUFFER_STATUS_DIRTY)) {
 		prev = isp4if_dequeue_buffer(ispif);
-		if (prev)
+		if (prev) {
+			isp4vid_handle_frame_done(&isp_subdev->isp_vdev,
+						  &prev->buf_info);
 			isp4if_dealloc_buffer_node(prev);
-		else
+		} else {
 			dev_err(dev, "fail null prev buf\n");
-
+		}
 	} else if (meta->preview.enabled) {
 		dev_err(dev, "fail bad preview status %u\n",
 			meta->preview.status);
@@ -1006,6 +1008,10 @@ int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
 	isp_subdev->host2fw_seq_num = 1;
 	ispif->status = ISP4IF_STATUS_PWR_OFF;
 
+	ret = isp4vid_dev_init(&isp_subdev->isp_vdev, &isp_subdev->sdev);
+	if (ret)
+		goto err_subdev_unreg;
+
 	return 0;
 
 err_subdev_unreg:
@@ -1020,6 +1026,7 @@ void isp4sd_deinit(struct isp4_subdev *isp_subdev)
 {
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 
+	isp4vid_dev_deinit(&isp_subdev->isp_vdev);
 	v4l2_device_unregister_subdev(&isp_subdev->sdev);
 	media_entity_cleanup(&isp_subdev->sdev.entity);
 	isp4if_deinit(ispif);
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index ceade9fec5d9..ddf6bdf4a62a 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -17,6 +17,7 @@
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
+#include "isp4_video.h"
 
 /*
  * One is for none sensor specific response which is not used now.
@@ -83,6 +84,7 @@ struct isp4_subdev_thread_param {
 struct isp4_subdev {
 	struct v4l2_subdev sdev;
 	struct isp4_interface ispif;
+	struct isp4vid_dev isp_vdev;
 
 	struct media_pad sdev_pad;
 
diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
new file mode 100644
index 000000000000..15a7d7c1e4c6
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -0,0 +1,799 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "isp4_interface.h"
+#include "isp4_subdev.h"
+#include "isp4_video.h"
+
+#define ISP4VID_ISP_DRV_NAME "amd_isp_capture"
+#define ISP4VID_MAX_PREVIEW_FPS 30
+#define ISP4VID_DEFAULT_FMT isp4vid_formats[0]
+
+#define ISP4VID_PAD_VIDEO_OUTPUT 0
+
+/* time perframe default */
+#define ISP4VID_ISP_TPF_DEFAULT isp4vid_tpfs[0]
+
+static const char *const isp4vid_video_dev_name = "Preview";
+
+/* Sizes must be in increasing order */
+static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
+	{640, 360},
+	{640, 480},
+	{1280, 720},
+	{1280, 960},
+	{1920, 1080},
+	{1920, 1440},
+	{2560, 1440},
+	{2880, 1620},
+	{2880, 1624},
+	{2888, 1808},
+};
+
+static const u32 isp4vid_formats[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_YUYV
+};
+
+/* time perframe list */
+static const struct v4l2_fract isp4vid_tpfs[] = {
+	{ 1, ISP4VID_MAX_PREVIEW_FPS }
+};
+
+void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+			       const struct isp4if_img_buf_info *img_buf)
+{
+	struct isp4vid_capture_buffer *isp4vid_buf;
+	void *vbuf;
+
+	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
+		isp4vid_buf = list_first_entry_or_null(&isp_vdev->buf_list,
+						       typeof(*isp4vid_buf),
+						       list);
+		if (!isp4vid_buf)
+			return;
+
+		vbuf = vb2_plane_vaddr(&isp4vid_buf->vb2.vb2_buf, 0);
+
+		if (vbuf != img_buf->planes[0].sys_addr) {
+			dev_err(isp_vdev->dev, "Invalid vbuf\n");
+			return;
+		}
+
+		list_del(&isp4vid_buf->list);
+	}
+
+	/* Fill the buffer */
+	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
+	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
+	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
+
+	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
+			      0, isp_vdev->format.sizeimage);
+
+	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
+
+	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
+		isp_vdev->format.sizeimage);
+}
+
+static const struct v4l2_pix_format isp4vid_fmt_default = {
+	.width = 1920,
+	.height = 1080,
+	.pixelformat = ISP4VID_DEFAULT_FMT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+};
+
+static void isp4vid_capture_return_all_buffers(struct isp4vid_dev *isp_vdev,
+					       enum vb2_buffer_state state)
+{
+	struct isp4vid_capture_buffer *vbuf, *node;
+
+	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
+		list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list)
+			vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
+		INIT_LIST_HEAD(&isp_vdev->buf_list);
+	}
+
+	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(%d)\n", state);
+}
+
+static int isp4vid_vdev_link_validate(struct media_link *link)
+{
+	return 0;
+}
+
+static const struct media_entity_operations isp4vid_vdev_ent_ops = {
+	.link_validate = isp4vid_vdev_link_validate,
+};
+
+static const struct v4l2_file_operations isp4vid_vdev_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int isp4vid_ioctl_querycap(struct file *file, void *fh,
+				  struct v4l2_capability *cap)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
+	cap->capabilities |= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+
+	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X\n", isp_vdev->vdev.name,
+		cap->capabilities);
+
+	return 0;
+}
+
+static int isp4vid_g_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	f->fmt.pix = isp_vdev->format;
+
+	return 0;
+}
+
+static int isp4vid_fill_buffer_size(struct v4l2_pix_format *fmt)
+{
+	int ret = 0;
+
+	switch (fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		fmt->bytesperline = fmt->width;
+		fmt->sizeimage = fmt->bytesperline * fmt->height * 3 / 2;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		fmt->bytesperline = fmt->width * 2;
+		fmt->sizeimage = fmt->bytesperline * fmt->height;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int isp4vid_try_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	struct v4l2_pix_format *format = &f->fmt.pix;
+	const struct v4l2_frmsize_discrete *fsz;
+	size_t i;
+
+	/*
+	 * Check if the hardware supports the requested format, use the default
+	 * format otherwise.
+	 */
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
+		if (isp4vid_formats[i] == format->pixelformat)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		format->pixelformat = ISP4VID_DEFAULT_FMT;
+
+	switch (format->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_YUYV:
+		fsz = v4l2_find_nearest_size(isp4vid_frmsize,
+					     ARRAY_SIZE(isp4vid_frmsize),
+					     width, height, format->width,
+					     format->height);
+		format->width = fsz->width;
+		format->height = fsz->height;
+		break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name,
+			format->pixelformat);
+		return -EINVAL;
+	}
+
+	/*
+	 * There is no need to check the return value, as failure will never
+	 * happen here
+	 */
+	isp4vid_fill_buffer_size(format);
+
+	if (format->field == V4L2_FIELD_ANY)
+		format->field = isp4vid_fmt_default.field;
+
+	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
+		format->colorspace = isp4vid_fmt_default.colorspace;
+
+	return 0;
+}
+
+static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev,
+				 struct v4l2_pix_format *pix_fmt)
+{
+	struct v4l2_subdev_format fmt = {};
+
+	switch (pix_fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1_5X8;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
+		break;
+	default:
+		return -EINVAL;
+	}
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
+	fmt.format.width = pix_fmt->width;
+	fmt.format.height = pix_fmt->height;
+	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, &fmt);
+}
+
+static int isp4vid_s_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	int ret;
+
+	/* Do not change the format while stream is on */
+	if (vb2_is_busy(&isp_vdev->vbq))
+		return -EBUSY;
+
+	ret = isp4vid_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	dev_dbg(isp_vdev->dev, "%s|width height:%ux%u->%ux%u\n",
+		isp_vdev->vdev.name,
+		isp_vdev->format.width, isp_vdev->format.height,
+		f->fmt.pix.width, f->fmt.pix.height);
+	dev_dbg(isp_vdev->dev, "%s|pixelformat:0x%x-0x%x\n",
+		isp_vdev->vdev.name, isp_vdev->format.pixelformat,
+		f->fmt.pix.pixelformat);
+	dev_dbg(isp_vdev->dev, "%s|bytesperline:%u->%u\n",
+		isp_vdev->vdev.name, isp_vdev->format.bytesperline,
+		f->fmt.pix.bytesperline);
+	dev_dbg(isp_vdev->dev, "%s|sizeimage:%u->%u\n",
+		isp_vdev->vdev.name, isp_vdev->format.sizeimage,
+		f->fmt.pix.sizeimage);
+
+	isp_vdev->format = f->fmt.pix;
+	ret = isp4vid_set_fmt_2_isp(isp_vdev->isp_sdev, &isp_vdev->format);
+
+	return ret;
+}
+
+static int isp4vid_enum_fmt_vid_cap(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	switch (f->index) {
+	case 0:
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		break;
+	case 1:
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(isp_vdev->dev, "%s|index=%d, pixelformat=0x%X\n",
+		isp_vdev->vdev.name, f->index, f->pixelformat);
+
+	return 0;
+}
+
+static int isp4vid_enum_framesizes(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++) {
+		if (isp4vid_formats[i] == fsize->pixel_format)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		return -EINVAL;
+
+	if (fsize->index < ARRAY_SIZE(isp4vid_frmsize)) {
+		fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		fsize->discrete = isp4vid_frmsize[fsize->index];
+		dev_dbg(isp_vdev->dev, "%s|size[%d]=%dx%d\n",
+			isp_vdev->vdev.name, fsize->index,
+			fsize->discrete.width, fsize->discrete.height);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isp4vid_ioctl_enum_frameintervals(struct file *file, void *priv,
+					     struct v4l2_frmivalenum *fival)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	size_t i;
+
+	if (fival->index >= ARRAY_SIZE(isp4vid_tpfs))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
+		if (isp4vid_formats[i] == fival->pixel_format)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_frmsize); i++)
+		if (isp4vid_frmsize[i].width == fival->width &&
+		    isp4vid_frmsize[i].height == fival->height)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_frmsize))
+		return -EINVAL;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = isp4vid_tpfs[fival->index];
+	v4l2_simplify_fraction(&fival->discrete.numerator,
+			       &fival->discrete.denominator, 8, 333);
+
+	dev_dbg(isp_vdev->dev, "%s|interval[%d]=%d/%d\n",
+		isp_vdev->vdev.name, fival->index,
+		fival->discrete.numerator,
+		fival->discrete.denominator);
+
+	return 0;
+}
+
+static int isp4vid_ioctl_g_param(struct file *file, void *priv,
+				 struct v4l2_streamparm *param)
+{
+	struct v4l2_captureparm *capture = &param->parm.capture;
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	capture->capability   = V4L2_CAP_TIMEPERFRAME;
+	capture->timeperframe = isp_vdev->timeperframe;
+	capture->readbuffers  = 0;
+
+	dev_dbg(isp_vdev->dev, "%s|timeperframe=%d/%d\n", isp_vdev->vdev.name,
+		capture->timeperframe.numerator,
+		capture->timeperframe.denominator);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops isp4vid_vdev_ioctl_ops = {
+	.vidioc_querycap            = isp4vid_ioctl_querycap,
+	.vidioc_enum_fmt_vid_cap    = isp4vid_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap       = isp4vid_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap       = isp4vid_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap     = isp4vid_try_fmt_vid_cap,
+	.vidioc_reqbufs             = vb2_ioctl_reqbufs,
+	.vidioc_querybuf            = vb2_ioctl_querybuf,
+	.vidioc_qbuf                = vb2_ioctl_qbuf,
+	.vidioc_expbuf              = vb2_ioctl_expbuf,
+	.vidioc_dqbuf               = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs         = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf         = vb2_ioctl_prepare_buf,
+	.vidioc_streamon            = vb2_ioctl_streamon,
+	.vidioc_streamoff           = vb2_ioctl_streamoff,
+	.vidioc_g_parm              = isp4vid_ioctl_g_param,
+	.vidioc_s_parm              = isp4vid_ioctl_g_param,
+	.vidioc_enum_framesizes     = isp4vid_enum_framesizes,
+	.vidioc_enum_frameintervals = isp4vid_ioctl_enum_frameintervals,
+};
+
+static unsigned int isp4vid_get_image_size(struct v4l2_pix_format *fmt)
+{
+	switch (fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		return fmt->width * fmt->height * 3 / 2;
+	case V4L2_PIX_FMT_YUYV:
+		return fmt->width * fmt->height * 2;
+	default:
+		return 0;
+	}
+}
+
+static int isp4vid_qops_queue_setup(struct vb2_queue *vq,
+				    unsigned int *nbuffers,
+				    unsigned int *nplanes, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
+
+	if (*nplanes > 1) {
+		dev_err(isp_vdev->dev,
+			"fail to setup queue, no mplane supported %u\n",
+			*nplanes);
+		return -EINVAL;
+	}
+
+	if (*nplanes == 1) {
+		unsigned int size;
+
+		size = isp4vid_get_image_size(&isp_vdev->format);
+		if (sizes[0] < size) {
+			dev_err(isp_vdev->dev,
+				"fail for small plane size %u, %u expected\n",
+				sizes[0], size);
+			return -EINVAL;
+		}
+	}
+
+	if (q_num_bufs + *nbuffers < ISP4IF_MAX_STREAM_BUF_COUNT)
+		*nbuffers = ISP4IF_MAX_STREAM_BUF_COUNT - q_num_bufs;
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_YUYV: {
+		*nplanes = 1;
+		sizes[0] = max(sizes[0], isp_vdev->format.sizeimage);
+		isp_vdev->format.sizeimage = sizes[0];
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
+		return -EINVAL;
+	}
+
+	dev_dbg(isp_vdev->dev, "%s|*nbuffers=%u *nplanes=%u sizes[0]=%u\n",
+		isp_vdev->vdev.name,
+		*nbuffers, *nplanes, sizes[0]);
+
+	return 0;
+}
+
+static void isp4vid_qops_buffer_queue(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
+	struct isp4if_img_buf_info *img_buf = &buf->img_buf;
+	void *vaddr = vb2_plane_vaddr(vb, 0);
+
+	dev_dbg(isp_vdev->dev, "queue buf, vaddr %p, gpuva 0x%llx, size %u\n",
+		vaddr, buf->gpu_addr, vb->planes[0].length);
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12: {
+		u32 y_size = isp_vdev->format.sizeimage / 3 * 2;
+		u32 uv_size = isp_vdev->format.sizeimage / 3;
+
+		img_buf->planes[0].len = y_size;
+		img_buf->planes[0].sys_addr = vaddr;
+		img_buf->planes[0].mc_addr = buf->gpu_addr;
+
+		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u\n",
+			img_buf->planes[0].mc_addr,
+			img_buf->planes[0].len);
+
+		img_buf->planes[1].len = uv_size;
+		img_buf->planes[1].sys_addr = vaddr + y_size;
+		img_buf->planes[1].mc_addr = buf->gpu_addr + y_size;
+
+		dev_dbg(isp_vdev->dev, "img_buf[1]: mc=0x%llx size=%u\n",
+			img_buf->planes[1].mc_addr,
+			img_buf->planes[1].len);
+
+		img_buf->planes[2].len = 0;
+	}
+	break;
+	case V4L2_PIX_FMT_YUYV: {
+		img_buf->planes[0].len = isp_vdev->format.sizeimage;
+		img_buf->planes[0].sys_addr = vaddr;
+		img_buf->planes[0].mc_addr = buf->gpu_addr;
+
+		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u\n",
+			img_buf->planes[0].mc_addr,
+			img_buf->planes[0].len);
+
+		img_buf->planes[1].len = 0;
+		img_buf->planes[2].len = 0;
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
+		return;
+	}
+
+	if (isp_vdev->stream_started)
+		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev, img_buf);
+
+	scoped_guard(mutex, &isp_vdev->buf_list_lock)
+		list_add_tail(&buf->list, &isp_vdev->buf_list);
+}
+
+static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
+					unsigned int count)
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	struct isp4vid_capture_buffer *isp4vid_buf;
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret = 0;
+
+	isp_vdev->sequence = 0;
+
+	ret = isp4sd_pwron_and_init(isp_vdev->isp_sdev);
+	if (ret) {
+		dev_err(isp_vdev->dev, "power up isp fail %d\n", ret);
+		goto release_buffers;
+	}
+
+	entity = &isp_vdev->vdev.entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
+		if (ret < 0 && ret != -ENOIOCTLCMD) {
+			dev_dbg(isp_vdev->dev, "fail start streaming: %s %d\n",
+				subdev->name, ret);
+			goto release_buffers;
+		}
+	}
+
+	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
+		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
+					&isp4vid_buf->img_buf);
+
+	isp_vdev->stream_started = true;
+
+	return 0;
+
+release_buffers:
+	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void isp4vid_qops_stop_streaming(struct vb2_queue *vq)
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret;
+
+	entity = &isp_vdev->vdev.entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
+
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			dev_dbg(isp_vdev->dev, "fail stop streaming: %s %d\n",
+				subdev->name, ret);
+	}
+
+	isp_vdev->stream_started = false;
+	isp4sd_pwroff_and_deinit(isp_vdev->isp_sdev);
+
+	/* Release all active buffers */
+	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_ERROR);
+}
+
+static int isp4vid_qops_buf_init(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
+	void *mem_priv = vb->planes[0].mem_priv;
+	struct device *dev = isp_vdev->dev;
+	u64 gpu_addr;
+	void *bo;
+	int ret;
+
+	if (vb->planes[0].dbuf) {
+		buf->dbuf = vb->planes[0].dbuf;
+	} else {
+		/*
+		 * HAS_DMA is a Kconfig dependency so CONFIG_HAS_DMA is always
+		 * defined when this driver is compiled. The #else branch is
+		 * kept as a safeguard in case the dependency is ever removed.
+		 */
+#ifdef CONFIG_HAS_DMA
+		buf->dbuf = vb2_vmalloc_memops.get_dmabuf(vb, mem_priv, 0);
+		if (IS_ERR_OR_NULL(buf->dbuf)) {
+			dev_err(dev, "fail to get dma buf\n");
+			return -EINVAL;
+		}
+#else
+		dev_err(dev, "get dmabuf fail -- CONFIG_HAS_DMA not defined\n");
+		buf->dbuf = NULL;
+		return -EINVAL;
+#endif
+	}
+
+	/* create isp user BO and obtain gpu_addr */
+	ret = isp_user_buffer_alloc(dev, buf->dbuf, &bo, &gpu_addr);
+	if (ret) {
+		dev_err(dev, "fail to create isp user BO\n");
+		if (!vb->planes[0].dbuf) {
+			dma_buf_put(buf->dbuf);
+			buf->dbuf = NULL;
+		}
+
+		return ret;
+	}
+
+	buf->bo = bo;
+	buf->gpu_addr = gpu_addr;
+	return 0;
+}
+
+static void isp4vid_qops_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+
+	if (buf->bo) {
+		isp_user_buffer_free(buf->bo);
+		buf->bo = NULL;
+	}
+
+	/*
+	 * Only put dmabufs we obtained ourselves via get_dmabuf, not ones
+	 * provided by the framework for DMABUF import
+	 */
+	if (buf->dbuf && buf->dbuf != vb->planes[0].dbuf)
+		dma_buf_put(buf->dbuf);
+
+	buf->dbuf = NULL;
+}
+
+static const struct vb2_ops isp4vid_qops = {
+	.queue_setup = isp4vid_qops_queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_init = isp4vid_qops_buf_init,
+	.buf_cleanup = isp4vid_qops_buf_cleanup,
+	.start_streaming = isp4vid_qops_start_streaming,
+	.stop_streaming = isp4vid_qops_stop_streaming,
+	.buf_queue = isp4vid_qops_buffer_queue,
+};
+
+int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
+{
+	const char *vdev_name = isp4vid_video_dev_name;
+	struct v4l2_device *v4l2_dev;
+	struct video_device *vdev;
+	struct vb2_queue *q;
+	int ret;
+
+	if (!isp_vdev || !isp_sd || !isp_sd->v4l2_dev)
+		return -EINVAL;
+
+	v4l2_dev = isp_sd->v4l2_dev;
+	vdev = &isp_vdev->vdev;
+
+	isp_vdev->isp_sdev = isp_sd;
+	isp_vdev->dev = v4l2_dev->dev;
+
+	/* Initialize the vb2_queue struct */
+	mutex_init(&isp_vdev->vbq_lock);
+	q = &isp_vdev->vbq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->buf_struct_size = sizeof(struct isp4vid_capture_buffer);
+	q->min_queued_buffers = 2;
+	q->ops = &isp4vid_qops;
+	q->drv_priv = isp_vdev;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->lock = &isp_vdev->vbq_lock;
+	q->dev = v4l2_dev->dev;
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "vb2_queue_init error:%d\n", ret);
+		return ret;
+	}
+
+	/* Initialize buffer list and its lock */
+	mutex_init(&isp_vdev->buf_list_lock);
+	INIT_LIST_HEAD(&isp_vdev->buf_list);
+
+	/* Set default frame format */
+	isp_vdev->format = isp4vid_fmt_default;
+	isp_vdev->timeperframe = ISP4VID_ISP_TPF_DEFAULT;
+	v4l2_simplify_fraction(&isp_vdev->timeperframe.numerator,
+			       &isp_vdev->timeperframe.denominator, 8, 333);
+
+	ret = isp4vid_fill_buffer_size(&isp_vdev->format);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
+		goto err_release_vb2_queue;
+	}
+
+	ret = isp4vid_set_fmt_2_isp(isp_sd, &isp_vdev->format);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
+		goto err_release_vb2_queue;
+	}
+
+	/* Initialize the video_device struct */
+	isp_vdev->vdev.entity.name = vdev_name;
+	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
+	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
+				     &isp_vdev->vdev_pad);
+
+	if (ret) {
+		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
+		goto err_release_vb2_queue;
+	}
+
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->entity.ops = &isp4vid_vdev_ent_ops;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &isp4vid_vdev_fops;
+	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
+	vdev->lock = NULL;
+	vdev->queue = q;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
+	video_set_drvdata(vdev, isp_vdev);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
+		goto err_entity_cleanup;
+	}
+
+	return 0;
+
+err_entity_cleanup:
+	media_entity_cleanup(&isp_vdev->vdev.entity);
+err_release_vb2_queue:
+	vb2_queue_release(q);
+	return ret;
+}
+
+void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
+{
+	vb2_video_unregister_device(&isp_vdev->vdev);
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
new file mode 100644
index 000000000000..c66451e26166
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_video.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_VIDEO_H_
+#define _ISP4_VIDEO_H_
+
+#include <media/v4l2-dev.h>
+#include <media/videobuf2-memops.h>
+
+#include "isp4_interface.h"
+
+struct isp4vid_capture_buffer {
+	/*
+	 * struct vb2_v4l2_buffer must be the first element
+	 * the videobuf2 framework will allocate this struct based on
+	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
+	 * memory as a vb2_buffer
+	 */
+	struct vb2_v4l2_buffer vb2;
+	struct isp4if_img_buf_info img_buf;
+	struct list_head list;
+	struct dma_buf *dbuf;
+	void *bo;
+	u64 gpu_addr;
+};
+
+struct isp4vid_dev {
+	struct video_device vdev;
+	struct media_pad vdev_pad;
+	struct v4l2_pix_format format;
+
+	/* mutex that protects vbq */
+	struct mutex vbq_lock;
+	struct vb2_queue vbq;
+
+	/* mutex that protects buf_list */
+	struct mutex buf_list_lock;
+	struct list_head buf_list;
+
+	u32 sequence;
+	bool stream_started;
+
+	struct device *dev;
+	struct v4l2_subdev *isp_sdev;
+	struct v4l2_fract timeperframe;
+};
+
+int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd);
+
+void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
+
+void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+			       const struct isp4if_img_buf_info *img_buf);
+
+#endif /* _ISP4_VIDEO_H_ */
-- 
2.34.1


