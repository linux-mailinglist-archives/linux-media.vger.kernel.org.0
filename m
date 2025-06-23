Return-Path: <linux-media+bounces-35557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC5AE3310
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 02:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 835777A5CC7
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 00:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09307E555;
	Mon, 23 Jun 2025 00:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="aLYXtHc+"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021109.outbound.protection.outlook.com [40.107.42.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D184C6D;
	Mon, 23 Jun 2025 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750638132; cv=fail; b=D5vZS8hPmRmXK6g4J1hJgO5zEd3qbTqsq+SSHSh2XmtoCxvoHooe4ta5gghI2c+WxP9tYEWzzgIvH01rMb/kdIHmy0xoUp9lxbzIFdU92aDl3sXhQxma6Xeox2rRGgKOeFTQlRqMKnY+In4O5uJQIJF/MXcTM7Rzvbubr396LuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750638132; c=relaxed/simple;
	bh=in98pwW5kO8SKzf+UqmKnePWValGOVjWCB0KqqGGtAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S2KVWt3blCDKyfl045BxjgTFY2LQZPJW9lppe1n10KtkaCSaFmSEzlzN+wtZtncTWngZGWmip2u/6iAaUE+Wi3E+tAeNLzebDMwmG8kFrwqzW4DGHgr1XeruVnceXJAZlIiNLTRg+XCl+1jhReZl/KDh0eQE965pF/1IHPINBWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=aLYXtHc+; arc=fail smtp.client-ip=40.107.42.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9WkCfT+grN7bKUQIMxPjy7fa4Fyw2BQfjHjZhRKAxDrVe4iGycevg23UpL9ofvygPDL1ldzHJkdwuSN5JmK5HTEZHQZCYhELQrSFQP4wZmeOC38dAHc8eluR/42dAhYKKbkiPr0cIrKeuRhZzHEfWbYR6ewO5F1h7gsAjD7/jmaJyG2d5cjxFoSgRoh5dhSNQ74OWBHhVE56BGCs+RsbcVUkbF09U+9oeH9jHEuTcI0N8Itw5BTQctnseMfUtu9ywWxTrm4eTsnlhbHjcE3SiXxPEKqYXG+SVKC/lctTyRSEVUwhcjofudhn4Qtlsd9WVZfG6qOK//NqxJYVCFxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcDtq3pdHJFkdbkWeKZwrG8wu3yyPp/ONyB/+pyqqJk=;
 b=WeZZY0Xp2cGB7hYMRKwHZ8/uJbZN64Pe3FU87BZrq2nzTqrZoWU3pTzdpKKsJ2SDrW3DFnfvPS2YbBupwTYvCVv6RzE19dKrrXEJczKxINnsvSTMztyJ2FSuSJCUpMGkJi0KZgszrYlezonEqFRjKvF7Lz537cq6YYraIrT/t46U2yFqhYbt12Jogyw1E5E+4mzsw2b5J8gZMG27Jk0iMi29dLv1NqhxZAf00YwlQ2NE/qgHeWuA75kf7aYnY3yKsqpOsddstnfMVZsXwiCpUy+cteBi4jbR+HryZ0Qvrz8xovS5Eu7GTMbSruDiiR2PNj7zVW7+eS0iQfkyVP3nbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcDtq3pdHJFkdbkWeKZwrG8wu3yyPp/ONyB/+pyqqJk=;
 b=aLYXtHc+QQdQtl1AUsfYSQfI282gBaJYJaYv4b/tMCMmSCyRF6lMiYin+7bphEB6Y25cUmSYWxN2KzrUppHAU+uACIPP1ao0drgORYRMzoSxF5PnBaGZg2UonlxyKFHXfyFDkI90d0QmxwcmiID35N1+G0dNcJdyJ/aeuWT9wVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB3126.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Mon, 23 Jun 2025 00:22:04 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 00:22:04 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v3 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Mon, 23 Jun 2025 09:21:50 +0900
Message-Id: <20250623002153.51-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PUYP216MB3126:EE_
X-MS-Office365-Filtering-Correlation-Id: 34568bbc-8160-4a0f-edea-08ddb1ebfa9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2NhwfGywQFgNzQxrdZRMGGkEGgtmYaZbAs+G2u6Z4fd7UZtR+xnt3oHZgGC+?=
 =?us-ascii?Q?fyzGxxi0/ZuNU+F0a5NHrsey4dYrqGWhtQa4d7lMS+YYsw3PLiTKTKX8dhVS?=
 =?us-ascii?Q?l4WcPmh/I+ZP1D0EUhRQvY09OGzp+uRXCVDsccq49//Xm2T5hKhTsjqee0gv?=
 =?us-ascii?Q?2k22gzKKHWkweqq01mxKmdyXAYQAiTnwr22c5C81kMbXLRVn2EY5RE3cmxyg?=
 =?us-ascii?Q?VRjjaCLwXL1hJ9kKMTjCeOECtQ1TwwYQY4lyKq3f86s540SAl40xnf8EASnQ?=
 =?us-ascii?Q?DFAuahiowQbsDMJ4oqcVIrNzV4dqFWYYxm8YNbjCIdOQBPH4TygkPc23QSDE?=
 =?us-ascii?Q?IjYXrMyHl+OlBQe2za4HfJR9DNAbkzHuJCm+PcFyeTEwYfY36E64HPeF1lWf?=
 =?us-ascii?Q?eoK/oXl22NvrxHs8yJWf8cxr1T9oSFm+wR8QFCeXiebimQl1fVKBCPaWE+Wq?=
 =?us-ascii?Q?EK4655EVu5V4l84oP/8RqznCfat0202l7nA09AHEU2hsqO1TS6rlGjUGQpZ3?=
 =?us-ascii?Q?ii57UfQLr9qyVEb2QLBMa0t3/50+yO5raXbtoFz6j3X3soUrZzAte9Mic3v9?=
 =?us-ascii?Q?dipljU3eagSrcWvT0mS+8JQ299Kn7hUzT8teF5+yyINMS05ce/x5V+9StZH9?=
 =?us-ascii?Q?qFDNd4Z98pq5F/eBtHV77DlJBA5PUEGiJCpqpkOsWBzj7MYL4SII3PRA64bS?=
 =?us-ascii?Q?0lI4ZvH1Bp5mjQ9mXDP7xX/wHNwqGFntBzQZilgUor3coWC3ZZpaMRsZxGkT?=
 =?us-ascii?Q?pvaWQguS3+5/syMNB/TRs/emOS3DfkCCvfxoacgCF+bnmr5MFuFgAeLrgKVL?=
 =?us-ascii?Q?dcAZMnpw93eiVCSMZC/Pcd45GTJfPKV+XyD7VyNkOy1hmYBDvKvGEQRV7iF9?=
 =?us-ascii?Q?feUon0M8DdVRJo2gImCirIOSoWo+RLZa8qB+myxGR+BBsQW6V5rEVDJcww6t?=
 =?us-ascii?Q?sMWkcLxhmO7z8cVL4x5fkVTBHd6wNAy8KXGisBC53FM6t+9Dzkj9qLeWXSjy?=
 =?us-ascii?Q?H2mBHBpTR053bXbE8kL0YCV3qMu9HQPUmNzKWIljiD56Gab6k6YRHcvBT2nE?=
 =?us-ascii?Q?yDhWtOiDOUqlxnwZy/uN7IzdA9Yp/swpm4nAwVoFqJBuzwoTI6InxRow/S1C?=
 =?us-ascii?Q?224Q3337bWikxb/9z+pNUWM0bI29Cm2/PZgqpdQPc6IrPXo0d40iaGO+AO/D?=
 =?us-ascii?Q?KSdsGoJK5wrRj1alLodeIDxQ3xD6LcKjXIvy8WBmQEfOtQnEQOIN3wjf2u1s?=
 =?us-ascii?Q?p4CeP8uj3cYgErZidyTCAlltJOGqHea26l+PJREavRq3FdqqYKrZLkM8xKHW?=
 =?us-ascii?Q?6/ixMR4/jPZlh83NrjR9I3ri6LHNGshtpK4AtdYKTBxWS+kW7H3+AmBDA1PG?=
 =?us-ascii?Q?RP7WLrSJzyXSdYeWuJG4Cs92lx5ABQppKL/O9j3bIyR44tR7ha9jPnCx/miy?=
 =?us-ascii?Q?HyACJ/2SNlGPIT6lwwMkJET8w7Q5BOXU6etIooLwdErZUaEnRWjuhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6aRUWOx2ovlk3k67OMQyVjOPTbXVP6102bduBvi9jTEHYXOnAOHTGfc8U3Y6?=
 =?us-ascii?Q?RVqMO+gOMB/RaP0dziPzE/a76NX7ftNgvuJUGZtA3yVINohLOqm/KSa4Gq9h?=
 =?us-ascii?Q?Uuk4LO2Dnjneex/kwRxMNPR+ZJSPo5+rFQgJhkDKy2iqnl9ax99hcl/gla6M?=
 =?us-ascii?Q?VjHughvkfL+zaS9VSwJmZziV6RUYc7aGYOzk35pgulu9/ytlWqX8JYqfg3u9?=
 =?us-ascii?Q?2y+v6nhKlbnfimCQfIEvF0b2Sth+UzYyAJedNBstN2BCoeT7v30Q+nRh1LGF?=
 =?us-ascii?Q?fliqsq8YA9I6dQ/vJ6A98EeX93g6K7Fz4Zx7/yk06032d8tRShAAg9d3I6LM?=
 =?us-ascii?Q?Z69eB4zZIfHECYK8j+JEZCCU6XpqhbJCzw137ch+7YtrX3XIaMzFwdbEPSSF?=
 =?us-ascii?Q?of/3/l39mrRSLYzPvZSXxtJBc4jAxZVg6mtT+7/KL4uhDIwlQLmK8HWRYLXz?=
 =?us-ascii?Q?pGF/K0MgFwRbJyELsGwS4GgtQIPaHGmXkEBWAqBLYoa8fjBzkHervy8oxR0r?=
 =?us-ascii?Q?jRBIpaWh+Z+f5oCbGH3lUlszXKOkfR2ipAEJzCq+PXEemfYeeFKD7FZDsLar?=
 =?us-ascii?Q?SeUIFBardt3/GvX99CbhjrtPAsBQFsIkwbPmpymjNashV6snMZZrQ+cxIrQf?=
 =?us-ascii?Q?PBKMO0BnSMsivDQdjjUy68JT1/p+WbCO/332Aw7beNY+qhaSfhalB4KswEG+?=
 =?us-ascii?Q?GCMBYFLeZ2zTmXIYHEUjEYGJlPj0Id2NZS3bbJoCIp6ekwJRGXKzPm/x6QfA?=
 =?us-ascii?Q?RZipnTFiGkCw+bhhV5ldKF+IJH5sw0n5KAu9dSRtP6kZ2w0CJrr6DXvbCTEl?=
 =?us-ascii?Q?GxUbKexHvNto0svAdHCQ0F7qewH1nQpFXrC6ZXD7u+Fznt8Inve6H1lPP0+M?=
 =?us-ascii?Q?FFKw+hv2iVxIlsEhQOEoB/rQmAkvcit1RKEPrYES73xCTLolhcZ3thgXHelB?=
 =?us-ascii?Q?l9CCpfjBmdqOAkJFcVK35S+WF6Gq4omZqDBiCsowcgKJoWfa4fGnfKCft8dN?=
 =?us-ascii?Q?5Hh10nEQHjW/PwAbaayAmMxshfpHGFLwD5ybXCXrDFPvQUF+VEP8fE+kdFXS?=
 =?us-ascii?Q?9ZhNudwxauP73xNKkdGserrmU5EW1T40PwkbYnA4rysIJdWasbAvn3i16/+1?=
 =?us-ascii?Q?mZQHtf1pylzNZliO0d4pS5ulhGGTIa1jgwnkRIYz+TeofujEttv3hJ8oBxrV?=
 =?us-ascii?Q?3anOSu97dyLDUXoorLvTI+7OiN1jiHa0TsPyf2xZqsyciT5R3gzfQNHziYmO?=
 =?us-ascii?Q?oqigfCcJ6sCCQITUxlPQo/gb5RapxiIJHV/wPekXmda9+ffMwY0xpba3f09L?=
 =?us-ascii?Q?xKIKB/MPzQAfqdROU+947xH3nRAQEGc6kv4a95zclRvs3h6xich3+QLZP2Xd?=
 =?us-ascii?Q?MZ9Xc7bsbFPWUIIbDXfuoj/LLTieH2qtFfd3WHb9miJBZlW//MuDL6CkaExB?=
 =?us-ascii?Q?GtNXymyrKFit8yOnArE6trCR3IN9QuAqMmNdpDQN4OVpzyU/zONrZbsqr2bL?=
 =?us-ascii?Q?aPPeHHpFhJcxoSENPT93pIJdQaF6nBjOG9ZFCs8v6A19sn8hptNaH/VN6xuN?=
 =?us-ascii?Q?uRir6Ve4PPDoWvCXlzSgFjllSXWiOx4KI0g/N+ON4WsERQz3aLOMAcc/bbpn?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34568bbc-8160-4a0f-edea-08ddb1ebfa9d
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 00:22:03.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6baQZzqcARZ2GosG35DtJbfX+YNh41+hsZtf7UnFe7LfQnc4alblwbxg5erDy3i1I/jjfXzsZO0kDFcC8uy4RdmHUFWH97dSQsFL9TxfqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3126

From: Jackson Lee <jackson.lee@chipsnmedia.com>

SError of kernel panic rarely happened while testing fluster.
The root cause was to enter suspend mode because timeout of autosuspend
delay happened.

[   48.834439] SError Interrupt on CPU0, code 0x00000000bf000000 -- SError
[   48.834455] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834461] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834464] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   48.834468] pc : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834488] lr : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834495] sp : ffff8000856e3a30
[   48.834497] x29: ffff8000856e3a30 x28: ffff0008093f6010 x27: ffff000809158130
[   48.834504] x26: 0000000000000000 x25: ffff00080b625000 x24: ffff000804a9ba80
[   48.834509] x23: ffff000802343028 x22: ffff000809158150 x21: ffff000802218000
[   48.834513] x20: ffff0008093f6000 x19: ffff0008093f6000 x18: 0000000000000000
[   48.834518] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff74009618
[   48.834523] x14: 000000010000000c x13: 0000000000000000 x12: 0000000000000000
[   48.834527] x11: ffffffffffffffff x10: ffffffffffffffff x9 : ffff000802343028
[   48.834532] x8 : ffff00080b6252a0 x7 : 0000000000000038 x6 : 0000000000000000
[   48.834536] x5 : ffff00080b625060 x4 : 0000000000000000 x3 : 0000000000000000
[   48.834541] x2 : 0000000000000000 x1 : ffff800084bf0118 x0 : ffff800084bf0000
[   48.834547] Kernel panic - not syncing: Asynchronous SError Interrupt
[   48.834549] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834554] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834556] Call trace:
[   48.834559]  dump_backtrace+0x94/0xec
[   48.834574]  show_stack+0x18/0x24
[   48.834579]  dump_stack_lvl+0x38/0x90
[   48.834585]  dump_stack+0x18/0x24
[   48.834588]  panic+0x35c/0x3e0
[   48.834592]  nmi_panic+0x40/0x8c
[   48.834595]  arm64_serror_panic+0x64/0x70
[   48.834598]  do_serror+0x3c/0x78
[   48.834601]  el1h_64_error_handler+0x34/0x4c
[   48.834605]  el1h_64_error+0x64/0x68
[   48.834608]  wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834615]  wave5_vpu_dec_clr_disp_flag+0x54/0x80 [wave5]
[   48.834622]  wave5_vpu_dec_buf_queue+0x19c/0x1a0 [wave5]
[   48.834628]  __enqueue_in_driver+0x3c/0x74 [videobuf2_common]
[   48.834639]  vb2_core_qbuf+0x508/0x61c [videobuf2_common]
[   48.834646]  vb2_qbuf+0xa4/0x168 [videobuf2_v4l2]
[   48.834656]  v4l2_m2m_qbuf+0x80/0x238 [v4l2_mem2mem]
[   48.834666]  v4l2_m2m_ioctl_qbuf+0x18/0x24 [v4l2_mem2mem]
[   48.834673]  v4l_qbuf+0x48/0x5c [videodev]
[   48.834704]  __video_do_ioctl+0x180/0x3f0 [videodev]
[   48.834725]  video_usercopy+0x2ec/0x68c [videodev]
[   48.834745]  video_ioctl2+0x18/0x24 [videodev]
[   48.834766]  v4l2_ioctl+0x40/0x60 [videodev]
[   48.834786]  __arm64_sys_ioctl+0xa8/0xec
[   48.834793]  invoke_syscall+0x44/0x100
[   48.834800]  el0_svc_common.constprop.0+0xc0/0xe0
[   48.834804]  do_el0_svc+0x1c/0x28
[   48.834809]  el0_svc+0x30/0xd0
[   48.834813]  el0t_64_sync_handler+0xc0/0xc4
[   48.834816]  el0t_64_sync+0x190/0x194
[   48.834820] SMP: stopping secondary CPUs
[   48.834831] Kernel Offset: disabled
[   48.834833] CPU features: 0x08,00002002,80200000,4200421b
[   48.834837] Memory Limit: none
[   49.161404] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c    |  3 ---
 .../platform/chips-media/wave5/wave5-vpu-enc.c    |  3 ---
 .../media/platform/chips-media/wave5/wave5-vpu.c  |  2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c     | 15 ---------------
 4 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index fd71f0c43ac3..216b024c42d8 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1830,9 +1830,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1e5fc5f8b856..cf20f774ed1b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1774,9 +1774,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0..b3c633dd3df1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -322,7 +322,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..e94d6ebc9f81 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -250,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -720,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -764,12 +755,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
-- 
2.43.0


