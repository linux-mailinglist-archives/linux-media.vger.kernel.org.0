Return-Path: <linux-media+bounces-61124-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HyFCNbZAWrPlQEAu9opvQ
	(envelope-from <linux-media+bounces-61124-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:29:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1350EEE3
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDB4A3075BEC
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742793FA5F7;
	Mon, 11 May 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YkGzpigb"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195EE3F7897;
	Mon, 11 May 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506033; cv=fail; b=bd75QSSAFj+DIVGLxfOQK/i9XVsKhSHq5t6ptTQKsyN4kftYdOiV4QEjRLyAQ8GlVc6XMtXJm/qK2a5+NzTe+hfxbVtvuoBsh0nMlmyGw17zkorB1BNplWXUAYGyCxDwiKSUJ3ZSLSIxSJsTh/3ZxvqjsKRy9b2Dtx1mOTSYM0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506033; c=relaxed/simple;
	bh=71k04Q4vF3k//QF70p2YlLeVym7l9a2l4tmUh+hLVRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oae+8WP5klBzJxqcJOOs86JB54zyrGo8ZOuvJX6d+zzwxQD7mttwPHdaEJsHcfHFpFI7A8KUAPRjgV+y+j8g2j68oNo+V2uiKK8w1CzDTP5N1yJjv2tEuN3IA/OzGvfLniwwIezowNIBQWhdZXqzOcpRcF1YnujP7hugzzxW1wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YkGzpigb; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHhcynwXRnoCTOTWtP2YlW3cm7Myc9fg/E/WnkYmAifTr9XA9BNng+n13FNp6lWF/RDYTaldsv89G6Yq8v+OcvZ6bDy+PpnXYSCjvN3THO/fV1lG7A9JJrJloNwQbsl+qAgdqTvGdyO0ILfxW10U3GhyH6H17PaAwzJJP3B7Fihyaw9J0vLkM77BElzOCZdDHZKC+bBCEtnB3IjygyKJV3/PnCQEV6ptTWFFwVMVI6DSRVqmI7HPxtjSJPcK1WGC0i67bfgZU/QuZNurG/z1avNKhFlmwVOnnQYcAH9+dinzcQN5LK89e6YgsgCQ8INwLATLK2G6rbolB9T5JqiY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lqsh8mD53ORexkaiMJpeUn6rnfCB8AEChwTKnil7wY=;
 b=kkp1+cz/kneOAN5QsErBnx4YxtFfMkv5rtg/OxRH4yll4Xi5xs0AUzLxLq8m9ICVoUw/xjmzdpbXrgA9L8XsZuTIy0szRsCaYnR0uDud+i1ZF1pEzQWBcYusZwNpn+yddupFfvGoCOsIWdd0a892YcJyi4DBTCAZTMl58slMfdGhPFduyPqeG/XDHZCCQ/9/NCra3VHWD54XjGvtKAJs1OCWcsiqp2iFDHnAuOXWxsGxI9TamOxqu1yW7S1/BYoWSfKgwe1ktKrz2HG/obkbWD3glgG34WtVCI1ghrSmC5LQETcn/eCau5mkqENIbnmcs4yIC2mecMLhRBQBS99Fpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lqsh8mD53ORexkaiMJpeUn6rnfCB8AEChwTKnil7wY=;
 b=YkGzpigbu2kdAfkaG1tWEhy0S1bXLFeBwNeGES/3x5v/EdFUaXRtfMrU3e1+Lsfnzp0Y6HBhD0Gzf6Z9GjTWBkO/9IbInBAHx5uEi8NnK20RCuovkpTEKfp+bP1ZmBcmcJdb0N/SZ1euU/ZX/Ik37FyqCK2jdL7d0+mnXYpW6/YV8mHG8wdOwvxOEGa/Hmcl2Rpoyew8QeUwj6k8V7ztdyeCEKSKvfSfXhYifFkbjFXDRqV1jhs098Z1ookrD+AWTUOXdEUbPRkB2Ov1m9YlHcK7e4JXASSql6Qt65SxODFy61n1XbGviM1xfcb6qSf9L1/H90dMpB5eTI7O8Tto4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM9PR04MB8131.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:27:05 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:27:03 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v2 7/8] media: platform: neoisp: Add debugfs support
Date: Mon, 11 May 2026 15:26:27 +0200
Message-ID: <20260511132629.1300868-8-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa54dc3-a9af-4e74-7ea9-08deaf60fcdb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|22082099003|56012099003|18092099006|18002099003|11063799003|10086099003|921020|38350700014|3023799003;
X-Microsoft-Antispam-Message-Info:
 B0bTzhJd9Ns5270dRas8dVM03ZcYbpVyBneuS8PP0NwuLyHF++l8GS3nbrRv6Y0qU8IUBQlniaPfaUY5kpps7B7gyEE+4msAqI5eFeKVIsx/VWIMM/WbipOFs4p1YWqKqIHBzOUuh8jcUJT9E+/cddR79PFpSWaAsVeF+0uSsoYbj9hRYBFvIOhnl++fD3e3zxgPb1h++mPGBOGxZmNNp1N/wRdssLXswfN73F/4YRKI9GGiFi86zPjHULSQgx9VZqP6GXt11XQKKbykeMvyDs2WJDkBtIfXuSZRZnmNrhLBqmcs76Jor73JTzWhztUFNyvELA+V+mCaQk/BhsSC4G3bCNVZN0r5J+R2ZFbiZLYceP21yR0lFQKtoIs5VFJixD1MFwso/8agDZgD7MKnVzizmYKOXVcPO11bGhCO0bbsQe9Fzx/DKDCgZuMoC6fELvyH7tDLtzXRhPZC1GsVaJvlo07N3CpoDCjhsAgwnvMzdGhakgLS7C4GKl5RQEGm0NMDrrno/nGTVUyOCjNIXqfhyJRie/Yi1uHi/Sq4ro829tyHBnYWJmjwg2mcya+rBNh5mfYrBYAszRL9TQ7AhejbfaNb3TUcweR71bx5Wz7KPIBZl46QH6dGnj7BDWZTQSl6/VZEkEhCoGjTGkJhiUxLu5zLlgT8nYHlTUhgQjBNpKb2A4V3VGKKV+FOzIlRmAiavlpuSoq11nDDKAKF8o045yb+qabFQh/nPlEVWZF2Uq1sWY+0GSUHZxeU50iAy2GdKi/oTEcQ0glNEQgS4Q==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(22082099003)(56012099003)(18092099006)(18002099003)(11063799003)(10086099003)(921020)(38350700014)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xKlKxwKLX3X3WCeEJ5eO94WjFWxwP5aLes7G4GJpMgHTVRWCvJwiuc2wxbl1?=
 =?us-ascii?Q?aGWMF7bSuZ9PVB4tWGrYK4UBTQ8l6qwRx6vHSE18jxEa7Br2Ebkv+49ZwqHk?=
 =?us-ascii?Q?v+L8+VCxMZJjwUrQLSzpY/13xgJMGaGU0SMwDCGac9mP2zb4ElBhEhMANWu5?=
 =?us-ascii?Q?HUzwsxU6XoRN8Ue6HNKJ6L8817qZFUcCkZDea7kuqF0Op3yfw8Bu0vkYckkt?=
 =?us-ascii?Q?FVzZ10M/uRCAo+swBtsZ5JLn8jMJxLO4LbNyvynXG5cXiTR2rg8YuLX3K/W2?=
 =?us-ascii?Q?11higMerK1PLfgxHYwqpi4EFoBILgpW3L6UwPesnFE+JxpQ1jeX4RpgD1r64?=
 =?us-ascii?Q?Uq6ug2K/aeBkUpafvCPxWxg5ACu6JA5KB7PxPVzNjLXP+Eab15YuqRXp9X8C?=
 =?us-ascii?Q?VD/hYkMYoELfna2ODhj3kNiwQjMdUHYqGsc51ucslfFs0NPcsu/tUAhL3/qb?=
 =?us-ascii?Q?V3cz2daspvQ2H6etWmEFDIc5LS5van5GpvnbyrsEDKg+fMliHU/STRZweQmh?=
 =?us-ascii?Q?eKq/tzFUCk3V6+G/ZE3SdG0RJ8eHkpX7uhJJ4TSV9m/QH4NkHOQXpW5OdBYM?=
 =?us-ascii?Q?Mb+aj245LfO3Iwu+bCjgom3KwZ+iCFCO8c2tHnXWWRYM/JuDRQEckGxv7USv?=
 =?us-ascii?Q?RT0A0KKfErWKYAfP7dcjQAT6jOC2Ns+nEHJ8uy2423pqOk19fF2CgpS5g4uQ?=
 =?us-ascii?Q?kBTVaAl33g51t1z7RE4+I8aJc1PEulilLbFzlv9w3msV2a2ppkrG/WeKrcWS?=
 =?us-ascii?Q?PqOeW/xlBs6J8mgtnCjvmIV+bBlyxjDez5luyYz3RGr803J3n7T0UdU5DkRg?=
 =?us-ascii?Q?eF6Yb2IXIM/YfIvG36wWMhMY+Qnk+5iENVJbmK9ll5f+hTx4JqlTWuDi38rQ?=
 =?us-ascii?Q?hwBKBWpE7YKq7LgVQmX6bfllnRx9LRVvESQeUHQAJTAR/iLbPGtC2ki3SYT3?=
 =?us-ascii?Q?wCqa2zLD/mzc//7olA9+PANCzaDIlZGkhUsyY/rsP7pK7zNeTYQZW7725XN3?=
 =?us-ascii?Q?myMUhXkXkd/edFUbZv8XW437GbwvLM2Cu85CI6M7a2NZAeGGOyrz74h5xKva?=
 =?us-ascii?Q?4BNxD0kZ0BZVwWJIl93dO+HtU5J131o96G0NyM7LNm5StjfSERLm2OIwKy3z?=
 =?us-ascii?Q?hPOcuiliA+x8w2Lpf6a/9kXe7ai2bjdtCF3tdsg/hOM/A8TB8U0kQQjS8hsX?=
 =?us-ascii?Q?C9D9UUJiM+2rXh55PY/jSJNBiRq+F1fW0Gb2ruI+rGHBTOP3oVluygE28BwV?=
 =?us-ascii?Q?xhmXZw8gkHLco19zQy/BLR0p/YhU4ahu28rccVtAO7A8KH1ACMZBsCSFePNw?=
 =?us-ascii?Q?KSj38uLrkYWFUkO12NfYnbJgKzzMR56NRtzwHOkLFhCEnC5blnAY0R+zmej/?=
 =?us-ascii?Q?n/GJgTHXcucZIT26kkbZZNY/K73enZ/JJGVnM32kB6ffSGuzJmi6Og7mTkPO?=
 =?us-ascii?Q?f9bn31fa5DksTg6O3/LcVmmXB6Kigop1blHkSfVzVWKp8VtrhOEJ8PWS9gBO?=
 =?us-ascii?Q?zHQ1xwZV4epUnpmPSJyVnoe6dFVtKZvYb73HRWoA/YZKp8WxxE5KA4hENFVx?=
 =?us-ascii?Q?D0W9l3S/V3xIhGpCmpfVRimsE+Y8ynQQTlK3DxwvQ9vdRHyPhECO27TONk4z?=
 =?us-ascii?Q?bXjAXyjus9Wce40dG2fOT45oTKrD/boKgeXq8IooZo663TbN6mBuGV/wdJcR?=
 =?us-ascii?Q?FqMT+07bQjYLu7eyyYmcfQ2QOymRopvK/fVSybyxuHU3eZB0umI1f9rPhNUr?=
 =?us-ascii?Q?Gr2VHe36sw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa54dc3-a9af-4e74-7ea9-08deaf60fcdb
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:27:02.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xic9vBQHj6AXLp5VIYJu0oWRkNKs4pkiOiOpnTRujwvaX893eUbpe8K98kd2OVgWk+SwJ/q+rtlBk2GEXOWCNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Rspamd-Queue-Id: A5F1350EEE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61124-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add debugfs entries to dump ISP registers, and some internal memory
regions used to store Vignetting, DRC global and DRC local coefficients.

Debug mode is activated with the `enable_debugfs` module's parameter, to
avoid runtime suspend which blocks register access when IP is not active,
so we can capture an ISP snapshot after a frame is decoded.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/platform/nxp/neoisp/Makefile    |   2 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  16 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      | 494 ++++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_main.c   |  17 +
 4 files changed, 529 insertions(+)
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c

diff --git a/drivers/media/platform/nxp/neoisp/Makefile b/drivers/media/platform/nxp/neoisp/Makefile
index 7652df785e98..c68e216980dc 100644
--- a/drivers/media/platform/nxp/neoisp/Makefile
+++ b/drivers/media/platform/nxp/neoisp/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_VIDEO_NXP_NEOISP) += neoisp.o
 
 neoisp-objs := neoisp_ctx.o \
 	neoisp_main.o
+
+neoisp-$(CONFIG_DEBUG_FS) += neoisp_debugfs.o
diff --git a/drivers/media/platform/nxp/neoisp/neoisp.h b/drivers/media/platform/nxp/neoisp/neoisp.h
index e4932fc4a001..55b752fa60c2 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp.h
+++ b/drivers/media/platform/nxp/neoisp/neoisp.h
@@ -9,6 +9,7 @@
 #define __NXP_NEOISP_H
 
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/media/nxp/nxp_neoisp.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -225,8 +226,23 @@ struct neoisp_dev_s {
 	dma_addr_t dummy_dma;
 	u32 dummy_size;
 	struct neoisp_context_s *context;
+	struct dentry *debugfs_entry;
+	struct debugfs_regset32 *regset;
 };
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd);
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd);
+#else
+static inline void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+}
+
+static inline void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+}
+#endif
+
 static inline int neoisp_node_link_is_enabled(struct neoisp_node_s *node)
 {
 	return (node->intf_link->flags & MEDIA_LNK_FL_ENABLED);
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
new file mode 100644
index 000000000000..656475c8b9d1
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NEOISP debugfs definition
+ *
+ * Copyright 2024-2026 NXP
+ */
+
+#include <linux/debugfs.h>
+
+#include "neoisp.h"
+#include "neoisp_ctx.h"
+#include "neoisp_regs.h"
+
+#define NEOISP_DFS_REG(reg) {.name = #reg, .offset = reg}
+
+static const struct debugfs_reg32 neoisp_dfs_regs[] = {
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SOFT_RESET),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_BUS_TXPARAM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_XFR_DIS),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_FRAME_NUM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CMD),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_TRIG_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_EN0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_STAT0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_STAT),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SKIP_CTRL0),
+	NEOISP_DFS_REG(NEO_HC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LINE_NUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_REDGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_BLUEGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_HOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_VOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_R_GR_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_B_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CNT_WHITE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_BLK_SIZE0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_CURR_BLK_Y0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_GB_CNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GRGB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGE_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGES_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_LINE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_ROW_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_FRACY_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG1_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_IMA),
+	NEOISP_DFS_REG(NEO_IDBG1_IMD),
+	NEOISP_DFS_REG(NEO_IDBG1_DONE_STAT),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT5_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GBL_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ALPHA_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI0_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI1_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_STAT_BLK_Y_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_CURR_YFRACT_CAM0),
+	NEOISP_DFS_REG(NEO_NR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_NR_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DF_TH_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_DF_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CORING_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CLIP_CAM0),
+	NEOISP_DFS_REG(NEO_EE_MASKGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_EE_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_CCONVMED_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_CORR_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH12_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_PACK_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL01_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_MAT_CONFG_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG2_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_IMA),
+	NEOISP_DFS_REG(NEO_IDBG2_IMD),
+	NEOISP_DFS_REG(NEO_IDBG2_DONE_STAT),
+};
+
+/* Structure to store word when reading memory */
+union udata_t {
+	u8 byte[4];
+	u16 half[2];
+	u32 word;
+};
+
+static inline int neoisp_dump_memory(struct seq_file *m, enum isp_block_map_e map, int wsize)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+	union udata_t data;
+	u32 addr;
+	u32 *src = (u32 *)(uintptr_t)neoispd->mmio_tcm;
+	u32 offset = ISP_GET_OFF(map) / sizeof(u32);
+	u32 size = ISP_GET_SZ(map) / sizeof(u32);
+	int i, j;
+
+	for (i = 0; i < size; i++) {
+		addr = (offset + i) * sizeof(u32);
+		data.word = src[offset + i];
+
+		if (wsize == sizeof(u8)) {
+			for (j = 0; j < ARRAY_SIZE(data.byte); j++)
+				seq_printf(m, "%#x: %#x\n",
+					   addr + (j * wsize), data.byte[j]);
+		}
+
+		if (wsize == sizeof(u16)) {
+			for (j = 0; j < ARRAY_SIZE(data.half); j++)
+				seq_printf(m, "%#x: %#x\n",
+					   addr + (j * wsize), data.half[j]);
+		}
+	}
+
+	return 0;
+}
+
+static int neoisp_dump_vignetting_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_VIGNETTING_TABLE_MAP, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_vignetting);
+
+static int neoisp_dump_drc_global_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_DRC_GLOBAL_TONEMAP_MAP, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_global);
+
+static int neoisp_dump_drc_local_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_DRC_LOCAL_TONEMAP_MAP, sizeof(u8));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_local);
+
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+	neoispd->regset = devm_kzalloc(neoispd->dev, sizeof(*neoispd->regset), GFP_KERNEL);
+	if (!neoispd->regset)
+		return;
+
+	neoispd->regset->regs = neoisp_dfs_regs;
+	neoispd->regset->nregs = ARRAY_SIZE(neoisp_dfs_regs);
+	neoispd->regset->base = neoispd->mmio;
+
+	neoispd->debugfs_entry = debugfs_create_dir(dev_name(neoispd->dev), NULL);
+
+	debugfs_create_regset32("registers", 0400, neoispd->debugfs_entry, neoispd->regset);
+
+	debugfs_create_file("vignetting", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_vignetting_fops);
+	debugfs_create_file("drc_global", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_global_fops);
+	debugfs_create_file("drc_local", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_local_fops);
+}
+
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+	debugfs_remove_recursive(neoispd->debugfs_entry);
+}
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/media/platform/nxp/neoisp/neoisp_main.c
index c814a32e868b..a2bf3ba76bd9 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp_main.c
+++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -41,6 +42,10 @@ static int standalone_mdev;
 module_param_named(standalone_mdev, standalone_mdev, uint, 0644);
 MODULE_PARM_DESC(standalone_mdev, " Create standalone neoisp media device, default is 0 (off)");
 
+static int enable_debugfs;
+module_param_named(enable_debugfs, enable_debugfs, uint, 0644);
+MODULE_PARM_DESC(enable_debugfs, " Turn on/off debugfs, default is 0 (off)");
+
 static inline bool node_desc_is_output(const struct neoisp_node_desc_s *desc)
 {
 	return desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
@@ -1758,9 +1763,18 @@ static int neoisp_probe(struct platform_device *pdev)
 	neoisp_init_hw(neoispd);
 	neoisp_set_default_context(neoispd);
 
+	if (enable_debugfs) {
+		neoisp_debugfs_init(neoispd);
+		/* Increase pm_runtime counter to prevent suspend */
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_pm_runtime_suspend;
+	}
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
+	dev_dbg(dev, "probe: done (%d) debugfs (%x)\n", ret, enable_debugfs);
 	return 0;
 
 err_pm_runtime_suspend:
@@ -1777,6 +1791,9 @@ static void neoisp_remove(struct platform_device *pdev)
 {
 	struct neoisp_dev_s *neoispd = platform_get_drvdata(pdev);
 
+	if (neoispd->regset)
+		neoisp_debugfs_exit(neoispd);
+
 	neoisp_destroy_devices(neoispd);
 
 	if (standalone_mdev)
-- 
2.51.0


