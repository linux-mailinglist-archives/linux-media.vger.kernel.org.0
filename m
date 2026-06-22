Return-Path: <linux-media+bounces-65382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y5hXFS9JOWrNpwcAu9opvQ
	(envelope-from <linux-media+bounces-65382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:39:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEC6B0635
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:39:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=GVs3HBCV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65382-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65382-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E96DA308A624
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66F1287259;
	Mon, 22 Jun 2026 14:31:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013049.outbound.protection.outlook.com [52.101.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F49289E13;
	Mon, 22 Jun 2026 14:30:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138660; cv=fail; b=eZo9mVW0+rUNjs5L+w4DdSyEAXFgSzqIP1/IthFg08FV6yTaRPQN1J8jZ/w23hdeMUQmERrLIrcJDmC03B4uP4s0zywQag8m5n5N5q38bVocK5bEzmkTSyq5QFJbmKBrWWt3S2BZ40B64F90CqYhDm+A3PUxlWtOcZlImabrh8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138660; c=relaxed/simple;
	bh=cQiLbDupU1TdIYtI++A3ieVL0SireJjWL4zGEbKDfHI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g0a+LOX+2Au8ixkOZxArwvAF2vNKuF6p6JKY/qGTcVCj+EkXGiRlBoAKxEq3toqVQ/jxtxueHKxbjTSuFMQ37/4pFL9r9340/KXx4ll/JyCk02VYUosdixR+9Qx64lgsOjVg3cKxrz4bKGPSg32CqWUflo++oQBTH7/cA4QUDqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GVs3HBCV; arc=fail smtp.client-ip=52.101.83.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3lbptzlH85/XJxoY4ZwBwkCzsVolg8KX49OF2FBLLEgcpC6h83QZVW1DGKUubK8tPG5cTGZRb4TPFHWdoKtadp70m91FZdQQxDYbwiohAJeoTDlhUhZbsX0OJUVjQxnwtNFZLQWF7mDovHyfURtzCeTiBl1rxy7L3Wu4BZMi5lsVVwh4SOh+Ri/5wC3CLf8aTmtvF+dOdCpSt7qaDuopuhF1QHSLtejGB/x1j+Goxl3QVgLYpZjmrNTeN5L1LWwdIqqnNr9x8f+lYKjJpJOGBE7s36A9YmOHtk7UMz2NPH1NE4NLmn9MqbkG2UlPh+34xlvEvpCNdCunNjA4UCLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNOSn7PtCv2NxWPzhnkH+bkeTKkNe4agPjoTfo2xHYg=;
 b=hAmiaALeG+GpFACiEw23UFGKCbzr+5rPXx8ql3UjKNAI00hXRHI+7Nfv2Fo9UW5/ts4wgKu4edIsV7aWI4Dt4gjfswKqFVflHOLXSh0wEXyaXMmGHKC5AnJofZn6zNSuZVLqEGKx+b5yt4+JtWj25G6YEUzUTdJEH01s8vI6huJGEYHE8k38sM3udcRC7NF4QNFee4SsjKS3gcDp96OcE7vqYBHZaWaNn8r/PZ4+szMp4ZQtMScPS1FKgfQzHI8Y7ZJaTdLqZKjWXxqC1leuL2PFEq9Ky/FWXMTITl0UaJelP6t/G3bO6PI2vyRZt+x9Yb/ohSZZ3x9HUZQj+8YIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNOSn7PtCv2NxWPzhnkH+bkeTKkNe4agPjoTfo2xHYg=;
 b=GVs3HBCVL9PbaI8qpipuvvdwOkSAZ9iCxcuAkfs1DPvply27QpuhNp0ASa5+E9bFxkA2UVGje5Am8+BVRezsYcw0OHWwYXTH4RI3+wFVkmVTH7hApfsAmxXoL4idGftZLQMmFSgAU8jaDRgHh3StHuhE5riD/H5r4cyH25r5bME/2lQ3rB59Gg8OQvoq8KWHggehbMS41CnflOkvPSGZieFlAXWAQa4KpsuFBXWI0Qcn7n6c/rjUQwCBHo/ctP3UHA9pS8lczv8S7wUvp2RC0wjlNSAM5K6S4iPfL6KcMwP1yN/Tc4jn4pquwaoJb7poNTxu0wZtHNzty4CQGB/UhQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 14:30:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:30:54 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 22 Jun 2026 10:30:14 -0400
Subject: [PATCH 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simpifly code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782138630; l=1377;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vS1Saviq156Hsarb8tnP0Q9S86W1eT38WwRH5+2bsg8=;
 b=6mAYCQDt0zdl9Qc486/DwTyJkzaqTlAflxZ2FBE5MULGWwogzrOIUuh7Y9zGbSbs+jzPibDnC
 YUGbJ+SiBG4BiDdAMd6Z+fkxzhN8Yg/hbFa6AjpT75uq/onOc1+H4T5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:806:125::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d8dffc-09ea-4645-be06-08ded06addcc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 /YxZFh2vvhRqi7pbMx4+Ofo99juM7BPqHSbJBAo5qAqHO3/G421A9gieBOkK0fnaF8RAx+eLZQezf88Dz9OrNwRxZodcYZb32Vxjd64zd5bJMMWU0a6IRWkcy2sae5dyNeIfdg1heK3ll3jWIWdxAMXjPW8iej6F/dB6viZj4zJJfsOlBMbJ49aP9GoC4clKdCqQzSSok34KrOCoMOEDfElFiFnHI3esb3UkkAv5WhrQwVmXx9f7m1ZUKSPoxwCb7N9r1Vvl6cMjwirnBN5Op111il+R9HlRiK2iHQoyy4JkSLaIo4d9+gYv8CQN/tqk2YvRiRrLlTe4K31/ebq+1NSNsxVY8e/D6oHjapIhfriEPRvSJHpk0hnssnQrUHaaXaLH9ktT/atvHTxMnJ33o8afCetmDBzEKQe4g4LqV0IMtimhEO+tKPuX4iffjeuxsVhDXma3xjUr4VjCZwwUUBCS+WY3EG0VIO/Fhh15meaDIn0fV7OdriW9YIf35x52r1sNBEzBufIcTXXJZoC3PgqYsxszjOQoaxtfvoeEPZmyrb8YaKpDW3moO0rsldLKFTyxRjrLPBL4lEKBvYuPqT5S6dY7t/E+YNNb24k45dBMA9Bbj6n2xMQvwqfyOsodhrVswhz6v507wn9+h+mJBCJ1D7Ael4XH4nkA9RDbcayhxkcoiy56leqNOMKfv10zrNKhp0SAdxSJ3dSlf6zEow==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MHBUKzBLMUhaWEk4K294eWsrUXVJS29saFF4b2NIdThOZ3NiUjJsamFaTEpU?=
 =?utf-8?B?U3VDZWFad1pacEpTZDRaR29JRUoyTjdNRkpUaTdzckYvZXJZY0V3SXh2YjBF?=
 =?utf-8?B?Vy9xTmh5R0xKbUxvajYvYktydk5qUXI0YmdEZDZ4dEQ5RXBoQkhBNWhLVmxs?=
 =?utf-8?B?UFB0Wjl1TjNsRi92SXFHMEZUbHcycHJKZ3JyUkQrSTBseUhOU2FRRkcvejlQ?=
 =?utf-8?B?Z1hYK2FoZFJDTlN1bWdoYzJGemlDdW14SEpoMGFuVG9ZMFFJRVJYUkpTbFYz?=
 =?utf-8?B?Y0IwZXYzNWpnSkFna2x4dVJNdU00M1lvZC9ueVpFOXN0aVN5SGpNSURyU1ZQ?=
 =?utf-8?B?VWdTV3lxTkM5dFAxaUxQMFM3RVB4LzRhRnJjTjdsTzJTclY1OFUyYXorVEJy?=
 =?utf-8?B?bGRIVVB1SjdUZU5uaU1ya1ZqampoaGI1d2UvWHNyRTNaQ1pnSkV4YnF5NVlu?=
 =?utf-8?B?OFY5Rlp1ZzlEemxjb0RlZ215VUZSVTZUVW9UVHNYWEkyU2ZlWDVneDliTUlm?=
 =?utf-8?B?WGw5NWF5clh4TDBONVFVMFZpbHNWRkl2dkdweHl0S0VtTEtpc1lHREIvcXVZ?=
 =?utf-8?B?VWY4UzFYTjYwNytlVmRTbThhNkh6TFRHdXlOREFaWGh4NlBGVlM5QVlsUkRR?=
 =?utf-8?B?REpLaUpjSmZCYzhHcjEzUjdpamlCNU5xY3loalFEMGUwcXFKNU9SUmRCdjIz?=
 =?utf-8?B?U0pRV3paSmYxZnZMVy85N1pmWGs1MFNPUVJlZmhNNHhUT2JnYXhNb0M1NjhT?=
 =?utf-8?B?RTZqWEpvUlhCa2tlc0RscG50YmczcVJ0emh2cStUbm5paC9aS1I2MlM5Qm5N?=
 =?utf-8?B?Y3NBeWJIbEdZYXNNVFI0MjdxVW5qeERwandLdEJBVHBWYmdTRlVONkVrenB5?=
 =?utf-8?B?b2hHSDZFUFBkaXBkUnB3dWdwdnd6QWZGWHV3c3hCRy9WOVlFcHJ4c0NjeS9W?=
 =?utf-8?B?K252Z2dQMm5uWkwzWnI5NUdUT0VEaU11UThXbDlzR0F6ZDBNem5uUWRkOUM1?=
 =?utf-8?B?T1oyZ3VxNEQ4K0RZVjk2Mk1qanhsdzAyc00wTVJRUi8yUURLU1ZiS1hRdWxM?=
 =?utf-8?B?U0pPbDZGZE4zUytvdU5wUVc4Z1ZiUDE3dTdvL3RiL2hhM0VTakFKOVFaQjZY?=
 =?utf-8?B?N0NhMWNkaWFPQ25WV2gvSHpKenNMdTNNUTQzUkxFdWIzNmFZY0tHOXJrc1VN?=
 =?utf-8?B?eGQ0aElnTUR6bDRPTCtyS0x6VUFnVkQ3bGhvMlpkVXBpV3BsTm1oV054eGE0?=
 =?utf-8?B?VXYxQ3hlUlNuYUpRQXdEWGNGYkFjQk0yYVhnMnpMSlFUbDFQL1lVL0ljdVRs?=
 =?utf-8?B?azJmcUk5MTFoTXRnUXBOMFdqTXZPQ09JOG1oSnkwWEEyVHQ5akw2L1F6UHZP?=
 =?utf-8?B?WEFQZkw1RjFIOXRNUDBXMWlwUUpTS1RYSUx5NW1sQmhGNFRuSXRWaVFZUlYy?=
 =?utf-8?B?RDV1eXdoWU1lWDVRcmdCNTFtVmVYcVM0aytZMjNnUGtjN0RWMkYwWW80eDNp?=
 =?utf-8?B?ZGZLT29vOGxUTlZxeE83Nnh6N3cvQ1YzVFZtNXhvdHo4Z2pnN0hVTHhETjhw?=
 =?utf-8?B?Ni84RVBkL2xwK1lKVVpwTGhaWVF6cEJzVytrNXN1QjV2Y2VRUWJ3ZlhKWXhU?=
 =?utf-8?B?cHFKUW9MZkFwNnMrZGZMRVh1ejVHdjQyVmsyczFLTDdmdXpOY1ExM1M1L0ZN?=
 =?utf-8?B?MWVFSzR1cnBRNU9SYUtxQng3V1YvaGRQazhBOFI4c3VjejVLNHpOSFZkQzhG?=
 =?utf-8?B?UlVDaUUrZ1hIUzNYNTQ0ZlRxbDFPWXJCRk1zV1JxL2lBZUdxQnlFTTVOTHB2?=
 =?utf-8?B?eHdGNWRKMktiNmYwbzNqcXFYeGk5R0dzcTVjM0Q5Wm5nU2ZjcGlCZFV6TTB2?=
 =?utf-8?B?cHBNZXpTcUFuODd3WG5NS3VLbndob3VHcFZFcXdnOWtlK0Zhbnl4V2dSVEh2?=
 =?utf-8?B?Mm82ZER5alRSaEl0NzBGSDBiZEFBanY4SEZBR1RsSVd0NUdvZmpPZ1I0clhU?=
 =?utf-8?B?djBIZ2RZL00yZG9DNHU5bndEUVY3R3pwWjc1eVY1eVZaOXRzSE1sbm1QYXgv?=
 =?utf-8?B?QmJKcUxBcjl2VnhhZ2RTTy9NdEV5YU1NeWw3QURHRUMxNGwvMnRqTzVqd01U?=
 =?utf-8?B?MjhvR0RnMmlDQWFJSjAvd2hrR20zNEF6bUlzZE40UDZZTklrSXFIVTl2QWtK?=
 =?utf-8?B?dnVBZ1N3SVltaldnNkJhV3JwTTU4eFJjRE54SUc0NjJWcmVsRDJKUmlwZDRz?=
 =?utf-8?B?dnFzREtwTFJPNDk1YWFaM0FQdmg0K2tWSUNJRDY3Z2U2bWxaN2NNZjIvZVkz?=
 =?utf-8?B?Z2tQUFk5VUd0UFdDbHEvS0xLWXNlK2FsWHN1TFVKV05VSnNJbW4ycXlVait4?=
 =?utf-8?Q?oPAx0lav/WdulruQ8YKERN3ByE9oZk3pV4KPa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d8dffc-09ea-4645-be06-08ded06addcc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:30:54.1809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+HYV3GapAu7aE2W/qNzXXOfDwZA6WhKP8iKffp1NEN/qkSE13+lYDsUVRYGyvZ6gRH01V3My7jioVAEx8JYnszW+NS31uA6diMUPaRM67iKNXhMq5qfBv+NCIDcoK/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-65382-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1EEC6B0635

From: Frank Li <Frank.Li@nxp.com>

Use fwnode_graph_for_each_endpoint_scoped() to simpifly code.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..23f3cc30a15a5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
 static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
 
-	fwnode_graph_for_each_endpoint(fwnode, ep) {
+	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct camss_async_subdev *csd;
 
 		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
 						      typeof(*csd));
-		if (IS_ERR(csd)) {
-			ret = PTR_ERR(csd);
-			goto err_cleanup;
-		}
+		if (IS_ERR(csd))
+			return PTR_ERR(csd);
 
 		ret = camss_parse_endpoint_node(dev, ep, csd);
 		if (ret < 0)
-			goto err_cleanup;
+			return ret;
 	}
 
 	return 0;
-
-err_cleanup:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /*

-- 
2.43.0


