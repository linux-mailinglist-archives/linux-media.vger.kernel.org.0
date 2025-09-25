Return-Path: <linux-media+bounces-43146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A8B9ED49
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 12:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2EA175B40
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 10:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D9F2F5331;
	Thu, 25 Sep 2025 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VXzHAy+G";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VXzHAy+G"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D44814658D;
	Thu, 25 Sep 2025 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797755; cv=fail; b=t1F46H9Kh/0IOr/4OZ5ek25tZ8jCPGrxNQIvbc6PQCR59VvMNmKqu7uMJ5MxSBh8qfAejpNwHQNmPexxQYgRiDpGgEptYmmdlIrnNNoXpwVIGxpswHtHwtRU0/rVBnOrZqaoR1F3UmhGBxT8/BKvYTGSSED1Pxce1UcalaRSy5g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797755; c=relaxed/simple;
	bh=5UVHNUGGom84pc0y59VpI817QK+X6jfNd4uGEG4Circ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qrQt9Y+q9DjFj1+2NEKw5RkYA9b1JwpqoqDbkUJQU/76m+6L+SL/pwRg/HG5tJov6zYlNbfOhPoXttB1gLr9xv5dSISIJ87nWzKXGSMxgscwu4riliZRLdGLXsYTQ+5+OcO5cxMohS1RNy+I25oO043BfT2pSx8cS+3ty6AkyGA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VXzHAy+G; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VXzHAy+G; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G5qp3RVjNNgTp6AFu7FkgrQUi8G57TAbINtFB47oiOZOWy7jRjdAqK1xLIw78f/kbYOytYAaAbW1wLDBE8NhmzKOWnSGpOqeBeaC/ovQWju5sjGKfhTMwOVqsVAw9D7L/3M+ZYlnLtRRgrwraBVGA+ieSJj5bQHQj1LavpXri7X+lP6TQ8aCa4ROW/G7/h81KSpKCUw1DuNuDiyf1ZSFpgOsAKHdrYpOywqnAflMNC4SP75aw8tX2R57tX3V4anf0aPXNOhiFAzNEZayRHTOjR6ihDGWgQU+E+vWHm8ELmNpZhaaS1NLO4wF0AbKoA+mEfsZoN8XdqdXFXbvpEj6mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UVHNUGGom84pc0y59VpI817QK+X6jfNd4uGEG4Circ=;
 b=bsT6MnVOzmQgAogsz2Ucc8a2IQvNhqKsOwi8VibM/+P7FgMpN2Q60oe1dfa2h4yFkp6lyQgpw8uzGv7Ebsua/+y4kGvnYhb6wTEYi0cM5FHdni39zqKHvg5wd1W5JW9yDRN9BuU82MYORiZo2WYL++mlPTQWnD09Wac9SYNOtfgoYLjOVMXeawqoS5EpJYY5F8OvpKCBJfhujtUH/EFXRvmf9fTHnv9eRaBXsl2J499dHSBtwdXZHy4K/3qir7aMNuPKiOa6N0kLVXpHjYIAucUacd1oaBAJh+1LsgWBiOPrc7W7hoSs944LZ0v3jj5ZWVpD05nG9sX+BQZ4K7kUtw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UVHNUGGom84pc0y59VpI817QK+X6jfNd4uGEG4Circ=;
 b=VXzHAy+GwNlmrVGswVANlR5dQXFy4g8Spvk92uOKIrx8nFAmrAHJNYr7jjMlmceO1Njb3d89PcEbSu6spFh6Pnz01wF0rljKPG8635Why/iFBNCjx43iATvOZrjEVz6ABAqvcWLFeiV3ImcmbxZYbEtQIAv0yY5KIj2oWxduyQg=
Received: from AS4P191CA0054.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::12)
 by PAXPR08MB6623.eurprd08.prod.outlook.com (2603:10a6:102:155::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:55:48 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::2b) by AS4P191CA0054.outlook.office365.com
 (2603:10a6:20b:657::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVTVSnEvSEzU3P+g8+jDh7ZyUj8s2Fve8N6OFO7xSLnkUDzG+uonyydIJd3niimh0kXgwvjYoR/c+O2zBBgknTRVsjSD0vxe8/H7pOsrbVnc80Tdec5vyt/KNVzPFmet/u7o3m0qubDGgMy7ryAK5y54a0kVXJlCU2HpP0OO/zuMcNDZvIsel0TCE9o6/ZcfD0tC946KR42xXt4WHk7s256eHge+0Aj3Dh4xPaNoS01InLapgkP4OjWH0+t7czq088mW2tQcVNYRE90wTTJKJLTKL76dlbKJiYyuKOqhfwfcyqU+Az50iAXf30wSwm1klZDWB/t1M4toye9Z26YU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UVHNUGGom84pc0y59VpI817QK+X6jfNd4uGEG4Circ=;
 b=T67iJhwYTkH8sZozKpDu01AZMTGprk08/q9sNuMpYqbX/wLTMhYyeyZDeCYS2lnwYwej3QCCoFRl0whrVJyqZlREND3R5MJO8mN/OF5+hiu7HOjjDqmKr/A0uYjiF64wZuC9eoCjLGOyBT7fcMOwgsF7it5or5/cfy3Rtj061lTACxpOgo7STHxkUkm4skEaZhB1LW5u5Br0rnpjGxsMZwBmyok4cHkcHI1dOjXth5I7rfKK1i0gwbFy5NFr97dAfkWeSzFQ6wFUweKGq7HPItVA43XuCtDVOGrshibglx24qxu40u7FIOxoiVvgjx0htagCMuQTV/eyys1ghXF0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UVHNUGGom84pc0y59VpI817QK+X6jfNd4uGEG4Circ=;
 b=VXzHAy+GwNlmrVGswVANlR5dQXFy4g8Spvk92uOKIrx8nFAmrAHJNYr7jjMlmceO1Njb3d89PcEbSu6spFh6Pnz01wF0rljKPG8635Why/iFBNCjx43iATvOZrjEVz6ABAqvcWLFeiV3ImcmbxZYbEtQIAv0yY5KIj2oWxduyQg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8836.eurprd08.prod.outlook.com (2603:10a6:10:47d::22)
 by AS4PR08MB8069.eurprd08.prod.outlook.com (2603:10a6:20b:588::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:55:15 +0000
Received: from DU0PR08MB8836.eurprd08.prod.outlook.com
 ([fe80::9aba:aa1e:acfa:8165]) by DU0PR08MB8836.eurprd08.prod.outlook.com
 ([fe80::9aba:aa1e:acfa:8165%7]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 10:55:15 +0000
From: Anthony McGivern <Anthony.McGivern@arm.com>
To: jacopo.mondi@ideasonboard.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	hverkuil@kernel.org,
	kernel-list@raspberrypi.com,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com,
	tfiga@chromium.org,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev context
Date: Thu, 25 Sep 2025 11:55:08 +0100
Message-Id: <20250925105508.2323797-1-Anthony.McGivern@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-12-c9b316773486@ideasonboard.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To DU0PR08MB8836.eurprd08.prod.outlook.com
 (2603:10a6:10:47d::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB8836:EE_|AS4PR08MB8069:EE_|AM3PEPF0000A791:EE_|PAXPR08MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 6044713f-37d6-4118-6c03-08ddfc22151b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Cqz2pxvTSdBAEP4TJfhEE/GjevEdkr5Qb2GEBfsi5UmYh7lhHB4jNuGgbbvL?=
 =?us-ascii?Q?89eACpkcy37xfv/lMTZDX5a9D9JZH+Q08aiKM/Q1H7ND9amb+2vORIkrz8Gg?=
 =?us-ascii?Q?iKbrCaHmLpG7FvnC/BjFSfBhpahtbHuWiFDa7I8UOoeXS6be+xaC6gAIt/7J?=
 =?us-ascii?Q?veER7engb9/qL361a0cDTy8y+YMyV+wF6nhNXrI/HkyWCPyRA13nR2/sX9rs?=
 =?us-ascii?Q?KnxJl83MZpup0i+hpf0uxnEyWZyJ89lujyRchYsR5axS+NxdWH5Ek6yyEJx/?=
 =?us-ascii?Q?SGTvf3GLd9swGT7nWDk2OS9uM7jHfPxi+nvXIFmPBwXnnwOl4nz0OqobYluI?=
 =?us-ascii?Q?/EP2V2HuwFloNS+iaLw0PoQHbMRJ+39jMeBUIaAnju9fzDxsCEzB/Jb51Y57?=
 =?us-ascii?Q?ZOjK1KJm0P8VGaTaGR9hC3dH8rOa1TkNK8Ezn4D1gRJ2IJR8ZiU2Cd/XQifj?=
 =?us-ascii?Q?MY+k72E5L+Y4xYNbMKwpq63uZNeNvcsK23xym6eolGg1C3Cpb5YNAqliYcsu?=
 =?us-ascii?Q?4jUViTlOknCi+uH3FipWAuQIsI7DfH+rn6NlSe3WAWE2+XEBLe3i5+LZDLny?=
 =?us-ascii?Q?tlTYivqyc1DRd6C51uUICJaBwkg1ewf0CDmGkXLsh4hC9eiEgIK7PLVLPzjt?=
 =?us-ascii?Q?GBb6vp7wLNuwPr1EuM7cI8Ctw2aT4fZpGfi2dWNFoQu6ysQqxPP6tWMHrYuj?=
 =?us-ascii?Q?PrmzyKLn5/SzahQIP0uVdKQKqdy6YDfoFATRCcPBQbTJBWQLqOdVqoxmrx1q?=
 =?us-ascii?Q?dZWxHPiJNUGvdoqxXeDxSl+eVb4cnKOJYPYTo/O+tuj5fDoCij/6eKt849ru?=
 =?us-ascii?Q?rSg/blkiiDII2ZuNeKAZvNnabs/UyXTvEuwOUrAtPYsBT/LM5R7VAxv6hSXE?=
 =?us-ascii?Q?Ngj8u/Gfj5ifKfPqyh8fZJuV+oCUyRyanDYrI1a0k6/8Vz+Fv82ZIvHQ2uEw?=
 =?us-ascii?Q?s30G6tmR74YN70xwNa4uqG0ZM1sNVPTNqIqBzbjtHMIR1VMscv7f/LziKRTg?=
 =?us-ascii?Q?yJ5hcig1G5i6xtMxnRMEJO/uf8zMHgPn1DOoWceiNpms5TX5QM9UvxGJG+8z?=
 =?us-ascii?Q?IPzEKK2zRwY1bvWiHAaVmQ7C+U6n7nS/wUB4pjjo7/JGIK3EzCtMkugkF7xp?=
 =?us-ascii?Q?6W0C1MCzArLBi61pbDob65Gg7flnL4re42l4embyLMsGuOXAfnn+8scunxMU?=
 =?us-ascii?Q?j1mvn5txKH5qKkaaKwHWO9kOqkc9CY//QAckcBsjPqmkH2QXYeDLzh0HZ/Nq?=
 =?us-ascii?Q?zANuAU0cAIfdBqEUYqshmKacclY1XwD6p2L9QDou3dmudx3y1vhQvcBmWkfP?=
 =?us-ascii?Q?f5W+7RozZYABLig2tTieiylMGCvPTPAXoZAfNiZoLDKX8I0NAv2Dvama/kx5?=
 =?us-ascii?Q?F0CndDvCQoawYTvcpmOKk2EqKIQaQ/+/YwKsGjaHwDjolFcJZDg0gxRGI/Gq?=
 =?us-ascii?Q?r8s9cFtlKdNdLE/OXDEII5MfmBtDAgWB?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8836.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8069
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05c012f1-ddc2-441b-4d2f-08ddfc2201f0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|7416014|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AzziEetqOCSFePERtFS2rXjWTinFg9nRhQBigHKr5mDrwE63DyrCCZockq7E?=
 =?us-ascii?Q?ccZcINUE6nBU8IrLDprgQ4TSlk0eXb9PiXBzx/29HmMMueU1bVeUBMB80EHf?=
 =?us-ascii?Q?qaHxlV6c3qo2xsF7Mj/vZdgK2DZwCf4ZQIJgCJYo6lgubrKIqP+lb0xbvLqU?=
 =?us-ascii?Q?Ivb8HTIilgUg+nFq0PO7nTTnL8rahiYVbU/NLPPV3FaKxboSeScOp9NX66/l?=
 =?us-ascii?Q?diz/3gPcgjHgr5v7xdH2nlddMdtiYxz1bySVexBHS8Lu9dLrBERRkIhzzczJ?=
 =?us-ascii?Q?N1L03iNQXiqBYP5Htb3K5yv3prllD5ZDHDElsjPFrqpzV629GUeaczmswTUW?=
 =?us-ascii?Q?KjivI+hKQJWB3wmnuwcVSgvmHvbNjA43U9Z3Bl7BAH2NGLCf+vBOw5R3ZPtf?=
 =?us-ascii?Q?XzNAq5LEqTS+3LWFmPmxIofZwpl1S7I0esA3sZ0JVPvmdQxV5xZ/lXF71+LP?=
 =?us-ascii?Q?Y3NTbrhs3uFovmZ7gCwqApdBChBYtX5OnZqJ3HDQISg6WuSfoGwlj2pEaZU/?=
 =?us-ascii?Q?Nmh9I3W98M9AOFuUofmbf8I1Za+ZahHd4KvSYFhUPOXbNo8kKG+VFsyuNZeq?=
 =?us-ascii?Q?7WpSbCmcU7llYK81hlEklZvx1d50hCBJ2ucpBoWKBBnGq1dDSMSQbxQiFP6/?=
 =?us-ascii?Q?H+xNH/nkoEcdT2uyhMqNaQHZZYQdLsVbJRvO3+H6f6LlU/SLrKPk8W7W2WXG?=
 =?us-ascii?Q?kIK+dAJ7tdhDKeJgHULT43zV/s2bK2Tf7p5XKYUPtdpHMiqZ90E6Vi2M0PD7?=
 =?us-ascii?Q?E7DsVoymqo3f328jtfqeyaUbI+T6KYuj7m83pmp6eJfoetlJ3pUCnjx2Qfja?=
 =?us-ascii?Q?lM1CSR63o/gbb4VUpQcBuIWAfhJV7w+NuV3T+KaJmUuOwChb56klLNAqcCcI?=
 =?us-ascii?Q?fB3a2GBVC9/tLQY20aUdi/DtqhrH2bd3fwloQPl4Rza5bgtP4y4HaIEfLuO1?=
 =?us-ascii?Q?F3W7ffvHpcmuOxjyR9tMtW01As/BV8xY85q/gvCvXkw9dSsr7GbU6GFOCE5O?=
 =?us-ascii?Q?0nErGWU9XH9uXznWc/xdcWUwh0Y9qbXorkDGF/ZqBB7zoedaaxYa8T9mOuS4?=
 =?us-ascii?Q?8cLB0tz0ca+INEs1C4LzYWWpCICqCcSq7g0Y70Vd/QxxFKjTLWpXER/6VZwN?=
 =?us-ascii?Q?5EDJP9xVfcd0MiGq8Wj5f1ub1jnh0gS5/ePyJPFXRzSz2bgdpGdFmnTWhSOK?=
 =?us-ascii?Q?/qpwRV78A+tbeTLJ2WknN6fEw8DPcqPWnK6zvDL2UgymPyqXOGGl7ehXtnyt?=
 =?us-ascii?Q?gpck6NWtXbmaBY0+wkw72x/10XZYZe82dh9zYpZyw5FF6C0gtlpVCva/ymX8?=
 =?us-ascii?Q?qn59w/GDLRTuCg0fb2wH3Lj9yq4OZ8tenW0IS78W5LLfCIwzOA/ikLw/+JKT?=
 =?us-ascii?Q?CNWNIN8dsSoqFQPCFxiS8upGBq8ptCh6hLIQghKrm0b0nNnrwqyWnM1lj5nE?=
 =?us-ascii?Q?QXaaxLItJzyXSPT5UdtYCbQ5tXwPUgWNwvZKPPFs7O6t4LzJ+qxZagaMi3cw?=
 =?us-ascii?Q?eDszCgVoGnJ6RpKzpRwMW+orzd7PQgNdRJZn?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(7416014)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:55:46.8579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6044713f-37d6-4118-6c03-08ddfc22151b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6623

Hi Jacopo,

On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
> contex. It extends 'struct media_entity_context' and is intended to be
> extended by drivers that can store driver-specific information
> in their derived types.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

I am interested in how the sub-device context will handle the Streams API? Looking at the commits the v4l2_subdev_enable/disable_streams functions still appear to operate on the main sub-device only. I take it we would have additional context-aware functions here that can fetch the subdev state from the sub-device context, though I imagine some fields will have to be moved into the context such as s_stream_enabled, or even enabled_pads for non stream-aware drivers?

Anthony


