Return-Path: <linux-media+bounces-13225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42A908400
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 08:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AA48B24B19
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 06:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DAB11487E9;
	Fri, 14 Jun 2024 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BbwoNRhm"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5EA1482FC
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347931; cv=fail; b=jgj8zYp5ERvphrn6OsaNp9KGz2iVa08cvAGRt8HHEddCfvlDFgwbRERgeAwbvLVMev2De4A+saCblOZBB2fZDb0q6WY0az2/fN/+T/IrXhvJxMKuEVP11hj34FkS7z8uuB1VTdKiOHaoqiOBipwzqT8UqW2JyYaeHZoGzqlrqSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347931; c=relaxed/simple;
	bh=5hDGx/BZ1B3XlewhF9Vk7IA5uVsA7iol0qkfLaf7q8E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D62Yd2e5w0SzJFDNCv7KynDHPl5ZIG1r3y2B5TtYetJzfkY8rsVS747vuLK92Oh6V59KFdGhwT6WX2PKQXNtxz5uYmn/wBniOgNsooDiQF1wuLQceKJbPQ7YSsQx4/UEtO7RMEYYZ2oCuUmzBDdZZaz6lHQXWHvMHlk5xjVk5mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BbwoNRhm; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHZdw7tDZBBg1Ys4eA7HGZRz9wYtua/LTjvsicG0kXS4VGeLInXLB3hi7kSdce2+5qviFJGjjcYNpNNUksSgn2dD/lMMU4WqPDoG3VQhpfHgwgIgRsrlXX6Ai80VxGoOtMSDCrouuqPGAetBhsON5Qyo+z7ha2JTUEaid/Yxwj6KqX2vP1AAT+C1iOpx2Og5tIYkURJSGVfCwQLIhobNPT/eEzqSEzZCHp4si70AUtJCPQ58tqM/Z24GwbZL8JdbgF8onXiXKQr9etGxDpe1zSDeHlCcQJSB7JaEumFsDs2FQLAbRETTgNRXA9tkW6GE8ixgOpnxEmVctngM8aVz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oDTON2/5qjoBVQvrNcgyTl4aQOPbud15u8HPLKhDM4=;
 b=OjLndZcGgXXhs5LvGIyWfdzzpYK0hRFmfLqSkHzuXfbHCaa2g/nBfT9ocVSIvjUbsbxvWreuBZwQnWZeIFsIhNjfzLuAmhBypPaoDw58E4InamNjAnzxoYVyTK9jdU9QO313BSwl+6jXs5Ahr5/hYNxhddiSA/9kpK+zkRRJFLRDaZJGdQKGn02YkiBoqGZEchMsQAKIxUgLsQV6aujUgrvsY0Bo4zPTh9TdY5cnm3x2OMiVxFZ6HNCNFDLiAKUzPGG+LVBmB0xyc5xbgSOSV6xdkPpeVppPKvpicqrBBT1jR2WoaKosh57X+47rfhXk+mmcF8FOIV4YSMP9XkDpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oDTON2/5qjoBVQvrNcgyTl4aQOPbud15u8HPLKhDM4=;
 b=BbwoNRhmCxbK/vymjbyeEVkkGzXI9nBav3ICIQTCp/1Li0mvIJ5pbYBLtZWIrnESscJqFf4NNqZVUTrSmLWA5yiXYYsHGMGKS9+KYdsthZwqp3Rkdk1b1vT0pIvxlDUPIg+zoFycYXWjnhAHCQCalZhZb6awsZBEU2euefZVNdQ=
Received: from BL0PR02CA0071.namprd02.prod.outlook.com (2603:10b6:207:3d::48)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23; Fri, 14 Jun
 2024 06:52:06 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::d3) by BL0PR02CA0071.outlook.office365.com
 (2603:10b6:207:3d::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Fri, 14 Jun 2024 06:52:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 06:52:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 01:52:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 01:52:04 -0500
Received: from xhdneelg40x.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 14 Jun 2024 01:52:02 -0500
From: Neel Gandhi <neel.gandhi@amd.com>
To: <linux-media@vger.kernel.org>
CC: <neel.gandhi@amd.com>, <hverkuil@xs4all.nl>,
	<laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
	<mark.hatle@amd.com>, <varunkumar.allagadapa@amd.com>, <vishal.sagar@amd.com>
Subject: [v4l-utils] utils: media-ctl: Install media-ctl header and library files
Date: Fri, 14 Jun 2024 12:21:20 +0530
Message-ID: <20240614065120.896247-1-neel.gandhi@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: neel.gandhi@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 9447d072-0613-40db-5e5a-08dc8c3e8134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230035|82310400021|376009|1800799019|36860700008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1yfEsq8ge7kcWXT6YFpcGQgl4JeZUC96y1svRXMbTdzsoazxs6yjtPuIZed1?=
 =?us-ascii?Q?7bGBTUTx7gD0P0NVOUjOxW2ldY/HOz0fp2rq5iNnBFpOP3y0UnF+5NWANoOq?=
 =?us-ascii?Q?UCldL4LKqjAmsLTyUlELdSS3p7dpOhNv/Q8xpTtGfh4ILuDH8om7MjzSjHzR?=
 =?us-ascii?Q?8jC1B6gdQZ+6Dg+9yqOXWWlT48t8dwofODyV3JHXU4U964XBuiqJKZmuus5Q?=
 =?us-ascii?Q?IOFgMEXy0YEvqoT/RZXAwE1lpDEn7DrqugFTLFGODUFYJWLeI73xZqgjimGU?=
 =?us-ascii?Q?ygWiyIiuZxQcIQGVV7CD4d/wpqcp9HVZIgOnyFubvART0LVgOIdcHUbJUPWU?=
 =?us-ascii?Q?YMVZbD7Z94VcltzlTL7HR7G2GrFOHAafPcG23PWRJJUkJnIrXZ+WhVUYdjxb?=
 =?us-ascii?Q?GJxckgPQ1u/Sdgwx/wtg//4QlQX8XVclIs/DZZsMBWS5bXQhQBoo2ddnStkg?=
 =?us-ascii?Q?fdWkyeBDw6CFk4mfg7qawrG7lH9DRkdxus6xSrgXHQ5I2E83qgUaLzxF82Hw?=
 =?us-ascii?Q?YI7BY4I4IHZDsvag0tfkkLDZfN8dz8pEctW5GU/sNkCJcPl7sycqzouXYaZO?=
 =?us-ascii?Q?EAwath/qvIoBlDIyJ25Icp6cAZqJwIb8MncWcHmFwgEjh4h/0GCVXoor55Ee?=
 =?us-ascii?Q?oWVJFGEqzaAycvgn380POfNViQRG+8RopPpOGczkacCAc6JuzVLwM1moKGiw?=
 =?us-ascii?Q?UidiFGKt+sFY07PCz93iyQCg1fOlPVGFMCdw/cV7fvcs95w0N3xEJli3SP44?=
 =?us-ascii?Q?e6OFT7tXUtNJsRZFMYucujSUMSFJ3GSRZ75ZgsPqfNF3SphVpZpc0sDnTxZu?=
 =?us-ascii?Q?bLl39itHvMfXLfCRA54+tJstlSxVFuRWASIPe4v0EqlAk8o6m2JYYV9Fl85J?=
 =?us-ascii?Q?HpcjGILE89a8E1amsxqSQiSeNQnSIvrz4yyQD4czg5IpjAZmLmDl0k++MUD9?=
 =?us-ascii?Q?dYpPTKAHWSGPm1ISO1iBkk8R8Jx05mbk3fla5HSDzG8NjE0UEWKejbk5YcWN?=
 =?us-ascii?Q?bRaH8hXstJK7rmliTHrcF77btZFfOaB7tyf4BsAbLvBqYS2cq+ImGYOSEHbw?=
 =?us-ascii?Q?/IuMrX6jkNw+nEhvoE9WbZuIDR76OalzurbdOK7S8OvrZhO/XToPEKAMliRX?=
 =?us-ascii?Q?iwa53IFvpHGc/k6ucIf0q+y6LuTnIIkFGIBFW81phZcfqcifpQ4LJyqLCNXw?=
 =?us-ascii?Q?tphaGvZQDgNoJJAmYTRMmYTxxjzTwWK7Z5aBJGK4B0XX9DMV6WpUrJGQgE2E?=
 =?us-ascii?Q?Ng6JCbEP8umdruP7PhYva6MTIM/AREenX2jPDAIRVE8Ajo0OwKR6XBsrD2+a?=
 =?us-ascii?Q?m8JWiPB76iYJUUGHJbo/aAxJrVwy63FumHqrSWHkOcTDW1/Fs/r8SoBWRYPV?=
 =?us-ascii?Q?hKMVBpaROGqjEfWatQ2q7VnXmEIdvACPPaXdBb3o/8cmnVNK9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230035)(82310400021)(376009)(1800799019)(36860700008);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 06:52:06.1134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9447d072-0613-40db-5e5a-08dc8c3e8134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958

Install mediactl and v4l2subdev header and library
files, which may be required by 3rd party applications
to populate and control v4l2subdev device node tree

Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
---
 utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
index 3a7b0c9a..40669b4c 100644
--- a/utils/media-ctl/meson.build
+++ b/utils/media-ctl/meson.build
@@ -3,14 +3,24 @@ libmediactl_sources = files(
     'mediactl-priv.h',
 )
 
+libmediactl_api = files(
+    'mediactl.h',
+    'v4l2subdev.h',
+)
+
+install_headers(libmediactl_api, subdir: 'mediactl')
+
 libmediactl_deps = [
     dep_libudev,
 ]
 
-libmediactl = static_library('mediactl',
-                             libmediactl_sources,
-                             dependencies : libmediactl_deps,
-                             include_directories : v4l2_utils_incdir)
+libmediactl = library('mediactl',
+                      libmediactl_sources,
+                      soversion: '0',
+                      version: '0.0.0',
+                      install : true,
+                      dependencies : libmediactl_deps,
+                      include_directories : v4l2_utils_incdir)
 
 dep_libmediactl = declare_dependency(link_with : libmediactl)
 
@@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
 libv4l2subdev_sources += media_bus_format_names_h
 libv4l2subdev_sources += media_bus_format_codes_h
 
-libv4l2subdev = static_library('v4l2subdev',
-                               libv4l2subdev_sources,
-                               include_directories : v4l2_utils_incdir)
+libv4l2subdev = library('v4l2subdev',
+                        libv4l2subdev_sources,
+                        soversion: '0',
+                        version: '0.0.0',
+                        install : true,
+                        dependencies : dep_libmediactl,
+                        include_directories : v4l2_utils_incdir)
 
 dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
 
-- 
2.34.1


