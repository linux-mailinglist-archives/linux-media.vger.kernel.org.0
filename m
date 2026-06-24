Return-Path: <linux-media+bounces-65573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1fU6OzwOPGpwjQgAu9opvQ
	(envelope-from <linux-media+bounces-65573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:05:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5130C6C0376
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:05:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=DRKCIYNz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65573-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65573-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 966F3309F049
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15A6351C34;
	Wed, 24 Jun 2026 17:00:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7060D35201E;
	Wed, 24 Jun 2026 17:00:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320427; cv=fail; b=HHK1Q2xOWNNCEUW/CEBJQh8opxTrAT9E1/D0CC642PmzzWsRf1iDkrA2HbgwGA6+XmmSBa0CaFfL5zhPC1ckZrwkDZTOejkQXRbZLsV9s9enw646LRpaaHqekWFRa27XjmpiJ85eu6YZBJzVs7e8v0VpBg3dYVIEPW9eJuXND88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320427; c=relaxed/simple;
	bh=dSt0Cqa6myY1x5WpxRiPCVHZLPsfM9g1vvU6ht/OX6Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L8re1tSRz4eTmSNj2+waPoGR32KCOTWnrvGBKuxHRSDoLY7bmC/Orn90yhcReqSA2vOM1vZC4mV2dvJRlZSYAJGFw6+UxaFdliu1p//nMKHTpdAHScCcTnwuXrIQid3k/dWusoCZ5n+wKYHt+PglaBljJ3G4u045DcrBN+rWq+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DRKCIYNz; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXFNdkTxKnYMxV3/rJCh0mjk2pp6IeQwh4iynaWDQ20aJmDIEWij4q0D4EjbetYy7ZbL8rht/lKk9IePtXwFvkrtAWJaJc1r7+erHZAZSnEa1Xc3tnQTZCbocgtncnW470Z+nLY+8WIgxu2GtteF5xVSV7bWnFkzfXgdyeUxW5dLxI+LcG8VF3N1EUnpt4LASsrZqldHHX1hgbrSmFVOE+dlKEXuF4wohoDz+P1E/OkjiX0ruzfVcf4W/sRKCiAJA/c72v2kGSvAjhCUhUygC0Gn+eSPGEsXCm7irqpABviqXlgaxC1726wY0EZVheSt/+wlqB01W1j3ee9s2EUK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIrEjkqk+9eEqxtKWSPR97puO4C8rT2c6QbQoeqwoCE=;
 b=v5XbK6nFjZVqmjarGdpAZzM8dUGsbUydAFB9u/yct0PHBOCV7wqeL1Fvp/judABq4gM+VNM/jBNgdWCxLyhvBSeIGPjpsPr5PT4BFQVwdvAU8TBiUGQU02MhOtdmtpag9X/osJfk/NdsWGXZuHAvmn6Sc+bWoU9QPmb+76bMR97i0gIOtHNCw0U+9qk+HY6K4vI/yrSowb0+n4VErKTG5VKL53D5TtU/P4ACN/P5bEerUpgvU/bMuR4DXLJnYATHzQoEGN8knHZMriAQusQrXacBqt2oURRRNbHYhTSO8xCFWkoFKbfvk73USVEo5z8fuC7Sfxfw7ctjQp9dRlZ2bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIrEjkqk+9eEqxtKWSPR97puO4C8rT2c6QbQoeqwoCE=;
 b=DRKCIYNz/GGX7jH3+LM5MNnAaQvLveIVNYpGgfGQx6B9eJmBxrXdDx7Bvi2PWcoRJRW3o8UfRBf94vn+fNpPDSI7Lonpi55PoZMr3r20zCd1PKgmJvu9X69JacRilN6C+i2Aq/+l+yshY571/WOfYSPM6LVwR5s0PIo4jaVZ7iDZSwDlqitvvUxedQXt3Pj/eArs4+IZyNT0ynr14c7WpO3dZitPTQHoAsF+fyz1SOQU4Sors4Vsea50nlaGuNoHHMt0F+F/6smOfqUMfzsqg5/xUHYnyd/QIYYoF8wJZ9ddIvXzvbwwFI+Y0g2eW4a9stN4du4w6przZKImIhwdkQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11642.eurprd04.prod.outlook.com (2603:10a6:800:2ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 17:00:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 17:00:21 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 13:00:09 -0400
Subject: [PATCH v2 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
In-Reply-To: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782320409; l=1804;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=3lC8NlPGTPzxImfQb426jsNcLdL+1P2DeqEUdj0TjKk=;
 b=HwQ7Fb95ZjcHBXKskR6EOQLR4pT5M5T1dCvv5CpiDhqzqB32kn8EpovN0Xhh0mqDPMQfAM1U/
 f8d8s4Z26ouB2gfj1Qc24cuDCNHKr6OOAnshh4oCPGwTnJ/zw7QN8gA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11642:EE_
X-MS-Office365-Filtering-Correlation-Id: 75cdb3b1-7a2d-4584-a33d-08ded212135a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 lv5/l4nzvasE1c+V7GsIl+CTA6E/NtryUF0xk/g4RiQGdTw2ocFUJC2fSNG/k3LxanBSOqkhCSZY7Nk87UY5usmKAOklmCrFyoOO6cJRGwttgXWY+U06uuiUaWYhpz/2/96l0NlHty8eaFBFfgwtZ5y91zXkcqCuFMhtY/rzmyTQZBkB246C9wTdDXjo/N3oOxAw3UCtBVgYz8uxx3/cJUN5CLwJdRfTOIpc4/P2Lkx2FlHr26Nv/WwAMuF5MEuwL0e+nDVCezujGz398DJNimT1q4z/YnLkwxsxv+PS3sAdG4i/rtCdet52fHpttEthb3vPj/tVcy+X9nxxRgdfmkyVw6J132SLTB8v+YcGzkyE5LqUM4j118C824eUJp9YdRiT5AjYYpbxbKQT7vqCQrpfuooet5zmWupQkTov1jUaeaBjPucyEZhiA4N9gI5isJ8sucST9JhJXqNqXXlsK+Ug1EgDLpHjX/UWvuuOi673CpwjFdpn+IKAZMAw+n3ecnzn2o5H1uB/275F5BgS898r9JdmnG4DeBSCN9GZXlzppPt6pocwnjbvM7Px4w887lAKSGRb4MeP2i+JxtKlgQgzVytBrZmnPDGYDKIlRD2RZDoLAeFcrePY9C91Jz9etec4Hzb8C+mt2ivQKrjPEKIsBjON52vXisgFGvsm0+3s0QJShr46IkOYlwWlIbjYkaVpTAVHkC9/bXqGJ5oChA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WG1KczRKZGJMZkg3aW9zZzUxRGRzMDNPRkYzb0h2cElrYmNTNzdQcnI3YWdS?=
 =?utf-8?B?OVRRRFo0Q0lhSzRVQUg1RTJ4Sk16bjBxT1ZCWWY1Q2lsU2MzUGNLV1BxY1BG?=
 =?utf-8?B?WFIrTWxEZ0NoWmZlMjl1bURQekRlZS9KNFRMSkhMM3BXQTEvcHVmSFU1aEFo?=
 =?utf-8?B?UUwrM2lJZVdPWFREU0dTR29CWGw5K3NVdEdrWE96R2puVDZmYTl0MDdpVzFJ?=
 =?utf-8?B?ci9RaUZZM0l2VGtvNjVRdUZMTFRiTFF1OTA0Y0tOQy8zL29UcFZzWXNQWU9n?=
 =?utf-8?B?cVZFOWNyUUp6K05rZW03S1pHajJBcEo3eVlnaEhxR2dxMitnM2RlWUJWRjlx?=
 =?utf-8?B?MHNDeXFVelJyemgvdjF1V2h4QW5QWkdQRmt5OWJXWmdBb0RRdXlBVWZ1ZXFz?=
 =?utf-8?B?a29YT1lka2E4VUw4a3hCOUFSV09kZU5Sc1VZeFM5cHVRU2Foak95VllpV2Fa?=
 =?utf-8?B?aWdVL2lyRXJzWWJvZWtFVDZSM2VZaFJVSndTMHJSejhnZEltck5oRU1ZTkEw?=
 =?utf-8?B?UCsrcDFXV2NsSzlwc0RJNFNzSlVXZnJibWdUbk10c3NYcExidzREaUtabFg4?=
 =?utf-8?B?OVBaL2FqRGdSeDdyUG5vV3VRdklUSlJCcHZMMFNyTHdadkpJa3Q5NWJaWHJV?=
 =?utf-8?B?Y3ZYRzlRRWhla3VtVE9pWlJndFgzVFRUQ05jdGdwN3NqMmlwdzE2dlhDbkFz?=
 =?utf-8?B?ejdrMGdxWWNpL1RkN1NuRmFmRHp3dmc5cUFrc2dJTUhkb21FWU5vZWpQQyti?=
 =?utf-8?B?MVk5UVZqbGszeVZvOG0zeVdlamRIUE90VVVvVHRlSXNBS3pUaEN4VDdsQzJB?=
 =?utf-8?B?QkVsME1TTEtKY2RVNUdVK3BBWVhEYTFxdHdjdVZnSUdlNWY5eTJ0TEFxdmNa?=
 =?utf-8?B?aXR4STU3U3J3dW5aaXFkV2thN2JoeUtZUFJtZFhaVlVuTVNYMlJaWmthT2xK?=
 =?utf-8?B?WWxpdkNMQmtzb2d5bWxJM0JUK3g1MWhrVjBqQU4xM2NRVm1Gb3BoeCt2NGx6?=
 =?utf-8?B?Z21DMDdocGsySjhicVhBNEpGZjdjTCs4SVNTS0lqYVpXbXFLL0gwVEoyOW9F?=
 =?utf-8?B?bDF6OUcxRjA4ZDJGN3UzQnJ1eG13WnVtR0FtZks1bzBuSkxHdjJKVG00WVdJ?=
 =?utf-8?B?K24rcHdNL2FiU0RxVzhCQ1g2Uk1EMDAvaHMvVlc5WHYydTRhMFd5RFNJUThD?=
 =?utf-8?B?bUNsS0lEZmYzTVNWK1FuY3hMZ0NMVU4zRjRzaC9rZUxNTTF0bU0wU3huRGtE?=
 =?utf-8?B?eE9zTFJXSzNJY3NCS0dHSFdaa3pDSkxuVVJGZnZidms2em1NbjdMam5jYnE1?=
 =?utf-8?B?cnpyZWc5N2hGenRmZmcwVURaVExodWYyVEhYQmVzbXF2YjEya3N2cVJ4cWl5?=
 =?utf-8?B?bkE4aGVnUnlrdHdJdWxkMnlJdit0UjcyemgrMnFxRTB2dUd3VTdtK0dXOWFj?=
 =?utf-8?B?d2piQUgzSVF5MTFMK25oL3ZSSnphYzhJWnR1cytqcGtMOGxlYnp5TFRSTUx1?=
 =?utf-8?B?djU5ckJRcGNDVURSQmxLNWJ5YmhEbVQ3OXpqUnFJYTN1NCtTdTVmNEk3M20x?=
 =?utf-8?B?Rm8wUEtkTFFmWktUL09Nc1NneHlUV3JGbFJRQ29nbGhsaUU3aWxKYnl5RnNq?=
 =?utf-8?B?SDUyV3UzeWgvZnlPK1diNHMzcEhNK1R4M2FDeEQ3aGIvSUdrbWlsbGhvZTBJ?=
 =?utf-8?B?VEloYXNSVXkxcm1IRGthaGhqcEdPVHBHTVRxSmpBMUZ3WHVhVUxGd2djT041?=
 =?utf-8?B?bkpyeHlLZ0ZXYzdGR3pHRUE5aVQ3aHorOCtvM3I0UThSVEVIQXd5b0VXZXM4?=
 =?utf-8?B?NmdSWjVOMDZEd052a3ZZT3d0d0twTXA2NzVIeS9manVFNk5BZHhVZWFoQVZj?=
 =?utf-8?B?dTB3RG45THpjcHpFbWZaV0xNU3IzejZyV2l2MXpvZlBTUm5ML3JLbUhRZnpT?=
 =?utf-8?B?Z0MyVHE4VXpUNDlqMG9YcE5rWkFwa2lmNFBLWDB4OHJ6ZC9qeElwSWYyenZx?=
 =?utf-8?B?UVFIc2Z1NW9YYVROUXdZSUtZelVFR2kwTFptMnJNdWVkYmJYa2ZkZmxNME1u?=
 =?utf-8?B?bmhhZE12K3NCazM2M3I1bEt4eCtMVWlHbUtpRHh2UmVsYnZyQ0oyNHJzTjBm?=
 =?utf-8?B?M0dlZFNJU2gvMmVTMWNBajR3WldmV0JaQS9OZ3JGWTArd05tMmtDaWJZMTRm?=
 =?utf-8?B?Nm5vL1RIWDY2TzJ2OFJyUXhEM1VRZ2k5VjkxdFJ2czExS2F4U0VWQ3FCcjhI?=
 =?utf-8?B?aG9aS0luT2pDYVl5SGVFQ3F1d1JtTTVRZXoxayt6dTY5VjJNREk0MlkwOXZ1?=
 =?utf-8?B?bXliNkZYSXJHajJmMmpkR1VhdkQ5QkRTY2tkRjJUTUxJSHFZenBSNEhaZjFV?=
 =?utf-8?Q?5J0tFFpZnqHwoi54=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cdb3b1-7a2d-4584-a33d-08ded212135a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:00:21.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aR7Y0uwrXe8LT8d7N9sBiduZ26d+kyJ3O46dDM7uUH75AXtqyYJJ8hE+IuifF0Khay1P7PcTZYA7eDQGQtjQXwLTxJcOF4mnRXEC6ZzopVrIaDNIHAzcBmR8sGtm7Yj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-65573-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5130C6C0376

From: Frank Li <Frank.Li@nxp.com>

Similar to recently propose for_each_child_of_node_scoped() this new
version of the loop macro instantiates a new local struct fwnode_handle *
that uses the __free(fwnode_handle) auto cleanup handling so that if a
reference to a node is held on early exit from the loop the reference will
be released. If the loop runs to completion, the child pointer will be NULL
and no action will be taken.

The reason this is useful is that it removes the need for
fwnode_handle_put() on early loop exits. If there is a need to retain the
reference, then return_ptr(child) or no_free_ptr(child) may be used to
safely disable the auto cleanup.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- collect Andy and Guoniu's reviewed-by tags
- fix indention
- remove extra space in commit message
---
 include/linux/property.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db46648..d51824c13d2cc 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -545,6 +545,11 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
 	for (child = fwnode_graph_get_next_endpoint(fwnode, NULL); child;	\
 	     child = fwnode_graph_get_next_endpoint(fwnode, child))
 
+#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
+	for (struct fwnode_handle *child __free(fwnode_handle) =		\
+		fwnode_graph_get_next_endpoint(fwnode, NULL);		\
+	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))
+
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 

-- 
2.43.0


