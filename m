Return-Path: <linux-media+bounces-65575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BZXUOjkNPGozjQgAu9opvQ
	(envelope-from <linux-media+bounces-65575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:00:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944046C031C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:00:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Bf03cZCB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65575-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65575-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E22B0300F776
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F373D356A38;
	Wed, 24 Jun 2026 17:00:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2935201B;
	Wed, 24 Jun 2026 17:00:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320436; cv=fail; b=GE3P1FsDbT42pJOKRg6WVEhZbl1tErS9Os/LulxN9v3J2NxT80R3PriGZ1VrGntIIXRhICgpGC+n16lYyyb2M3uW8umTNZE/dW5wJaHDBMxn5lfvOFXGg/9Pjx8BCp9Bu3ICbHPmEEyatK409+Yu9sAbxrj1iDt8jatN4jXjUkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320436; c=relaxed/simple;
	bh=HBMTfbptW1oTdtT1aT31GXHFA+gdXI8w+gl7jjGKv7w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QHeJM2DZC01toHVW1AO+zpxLiV6ngo+8PC2VWY0pUCFdzgB9bnUBOtuXSykGXl6NlHCPk4ahWQRUKkBRxlcrm3uqnSSRUmtcKdO4gAJRIYjEeN4II+IUVZrEU8n5mYTxaTU30iknALpSAfEBqXA9l8Awfsl8FXObAMvNUBGqDp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bf03cZCB; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oz142pCscAZe18uL75Ijv2undiVKFpUNT7g7GxFTER45eUvDoZjzWmwQ4hLzbdAYCOXUki8m1326NVU6NUmTCtZlLbWXKCVFqucDARp0IQA7xcsJb7lfKzgyOA9roUvP+lzyRfvf7jNcpnbv250SRlxygxEhLUi7Xf4yLpqbrFRvbZ5sUoysRNpNc3WygypaD1qB5brfm6DHn8OmOQMvCbrOgDp3vQQeTaIlpxoa3Nx3HLKatdV8cEIuIBtV8IHmATV9axvxEAyKrAQOP90GtMIQ32M/EZuZZKNLcYQffOvjeI7eRix4YnDuJOBsZyU/m5sBZ8yLyZa9Stpqyelwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNC0hsBc8q4PRyUELWogBLjtZ90eshFYYmoXolcjuvM=;
 b=ILP8xDcosgfErSy5ye1S+BJ9bUN+tuBIK5ytGNvG99nreK6BSXPr4pcaUGnW72Zmh8Pw9PS9uCsPDfPjcPPzgS3Vv5jRKeqLQBH53IMduZVl81JDbdJEjAEbeB4v99lcGf/9iPyHGZFSm1uCH4otwoi7qcw/mixto4hMO9rNmlq2WlEgsRAh5tKtBKN55h5a5ZjZyQybHg6Z33HKKmVzQ7f5AI6H8NuqJHXJH7FzHEHlZFrvqjT7LuXGmmJ6gDTAHSpGBPnUIuFOqa41OfmbR5OhPN6Pw28HFfZ8OZBG3B9hIovKELvimX2UD4Hj7jg0v0Y2/o++VZEnM/ip5iflEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNC0hsBc8q4PRyUELWogBLjtZ90eshFYYmoXolcjuvM=;
 b=Bf03cZCBDcTSKTpz8WRgdhTFuWZoyuYzg7dsmWp9bS2O1nYTEx1bTbuJ7LPHPF//RGCbJSVfsvZRd4zVVI/MA8x3RIeUhjdzK6dcnNzK6EQa8QWziYq0iPLO7IbndSq0DHuQJp4rMDKoxWvPbEf/isaNMfk/PAMYJQGP/7DH0Zrnh4z3yn0ezDq0eGXggq7ogkUnbhNPzobaVbgjC3Ppb2DAddTaW9Ez/VFZ69ZMC7VZdcZXZRU3lt/4NGAgnbEKpt3KO7lLO/9ib5DIrYIXFpMmq7PCPVlP/J3gMPHOxp0Pj9anqZ/nfR30vgWC0v5q6j7bPKc6BZJHz+WmEkCNrg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11642.eurprd04.prod.outlook.com (2603:10a6:800:2ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 17:00:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 17:00:32 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 13:00:11 -0400
Subject: [PATCH v2 3/4] media: rkisp1: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fw_scoped-v2-3-0a8db472af4a@nxp.com>
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
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782320410; l=1601;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=npuQmHdPEoT0bnHFL0wsPXRRGfGrNFMcP1DZrBPW7t4=;
 b=wGwirnX6z+h2otSVUwp0ch+pSKWNdoWwYTiyM7O2QV6HHziNVvOnDtYt0SJwaUfJHF0qloFjX
 +433ZhwHJs0BFjI94rBn+NtVbeZbSZTTxxNosZj23MBHmdpWP2OZlPW
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11642:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b39bd5-07a8-4e49-bf43-08ded21219e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 Y6GFLZ6TzW8k7ciA1JxHblWO+lmry5UxQIz6HS/PBB/q1shQjQ4tuCVeA+AMq+Si+Oxfx+jAXWKiV3oOWF3bcy5WkMztXMLmyHvE7YMIQAMGYVGBbwRfbLUs8pgUyQJM34d1TMzx6B3zDzjti4B4F/MDmwtD70DpVYEUqe4x2KOQls4WvTYASxxOUZy1sEoK41P/cHOb7WBD3F3rYIRZvBblvPLFDSymEaAkbpY4d9JeamnxRl1v7A/jXps73LvfTV2FvbWfq9gWojlkT72vDHfbk5OeZZKOZXybMpy1zlX8wysNS4ViMDJ1GAAe3NYsZtRlsO0Jkrg7Rg57LwfToRRff8oxAUIYs9yx9H6JxJ7U+W0m1esfKVYpSbJ7GoxPvE2bErRC+3h3yvc6liyO/ecuPxwGbZTu4MjaMAUWak3b/QO2OIQBKSAj8CImY3rng2dmueB2UA6SMq2UxbqmG4SktE7HMLc28glSOUDifES02qUy647Intk+Oey1MgOtmlwpJsZdpzSxkSrJkXopwA/5d2TJ6jbn70Vsxr5d8QHqxAV4VJWBg8P9ayp+bu/C5NWPQWU8cPXbwkgSvtf8MpJuRQyFG1kqwTs7xusFX22B+BPVpy8WzEf/bAT3w0vbjie6RR+5a+MzeGDq9U1xrQvZ1azwjreTfKGZC1dGMXjB7kABk/Y+1CZE7F/iGe/LJkH/gd0feoKAXK0gvGIo0g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Tm9aQ1E4SjBUMnBCNFZVZVRCeklKYnZQaDc4aEZuWVQ1ZVhYV2FmdVZ5a29L?=
 =?utf-8?B?QzQraWtDSFJnZXM5dG5mK0JtNXJESTVrdlJlam01bHFnTGtBUDllYlJrMmNa?=
 =?utf-8?B?M0pRSSs3Q2NNbXdTQklJWHEvVmNkZFpqditRcHJRdGpmdk8vUUs4Tld4N2Fu?=
 =?utf-8?B?WTlJdXo2YlJIZGE1aXRIRUVMRll5ZTUxK09YMjJPKzlVbEpDT2paQkhNOFlR?=
 =?utf-8?B?VlFVaFE2eE9aNThqTjF3dTM2Q1ZyeFp5TmFZRVlCRWIzUkFWTkNZQzVCd0ha?=
 =?utf-8?B?Q1dlOWViTy9SeEVwWlBUYnVxa1djS3BUOG5VZUZaUkFvVEZXbU0vN2FOQ094?=
 =?utf-8?B?ay9HZUdteWZNWUs1QTk1QVlndXJ1bjBGQUE1TW1kWXJvK242aGk5SHBaU01G?=
 =?utf-8?B?bmRvd2I4cjJZckk5akExY2FkRFhnbi9wN2hMNXZwT3JnSFBRM0IzVGd2Mmdq?=
 =?utf-8?B?OXNPRGJVUzZsK1FCbklqaUY1N2J0S21wVFNHZ1o4VFI5ZGcyeEpZOWFLVWsx?=
 =?utf-8?B?OUVLdjB4cmdwRUhUbFZIanRoWWdpSDIyRGhLbFdTQWNoWE1GTmxJUm5wdy9a?=
 =?utf-8?B?N256UVFLQ1V1bkV1SHdjS0dGUW9FcWU3Yk1lenlMOUtvanpOV09iQlZIUnk0?=
 =?utf-8?B?dzJBWjdlMXFUUkNKNEIvbTR1ZENWclloVXh2K2VRSXhCbGxJMXlvdGJuaDky?=
 =?utf-8?B?aGNFaW1kL1BtNEtOS1dLRjNldlRaNWVLK1hNVzdudDJDU2taQ1VzTi9BYVVy?=
 =?utf-8?B?UUdtL1I2akZaaXV6eHRJQ2JWc2JLcllOZ3ArVUx1S2ZrOUFwOXYwNUVZQUFw?=
 =?utf-8?B?cSt6bW5GV0VBRVpFc1EzKzFMd2tsSE4xUW9xOEtHVnZCMk12dmVYTElWbGx3?=
 =?utf-8?B?a0ttYUVSbnFOZ2RaU0wydVFOOWtsY2UwcGFvVGEvWE45QWs4bVJ6cUk3MmE4?=
 =?utf-8?B?U1dUMzZXOXNBa0RZZHZ2eGhLeVg4eUhnSzJESGRWRGp3VXFEcUxBdCt5eWQ1?=
 =?utf-8?B?V0pTSURZWkFzUmw5Uy9nRjFyaUtGMmoweWpmWmVqVldHM0lxcHNXVDVPSm5t?=
 =?utf-8?B?UFdpMjVvOVV0VmdZVU45VkxsVjZ0VjdBQ2luaGlCbzhFTXpPZklCc29QN2Mv?=
 =?utf-8?B?MnBGUnVkLzJObGpSb1FMOUYvUTY5L3crOHdwQVg1WHIvajFNQklGUEdORGNC?=
 =?utf-8?B?c0ozT2lPVjdTZENxRGdyOFpFK29tYU1CSEJiSG1pVVdJdTZFQWd4RnJJbUVC?=
 =?utf-8?B?Q2YvMzBrdkhRd2JEOUo3YTNYbk85dWlhWnNmTXNodlFPbHcyb3hlWVp3ZFpy?=
 =?utf-8?B?RUtXczJmMk5HN2NBM0FYOG5YMEttRWtIZGV3RUhrR0Y5KzAyK2pTeXpmSUJi?=
 =?utf-8?B?OWVmRU5OaGYyNWZuZlk2RVlUeTRyYjZ6amdNVW5LNWxFSWF0S2E3eFBzNE5G?=
 =?utf-8?B?b0NLUGo5R3EvUkxaSWlaUWZZczZCUFpBMzgzTzlEbnNMUmdyUjd6M3pPZ0cz?=
 =?utf-8?B?djNjYWdHYVJHK0RUY0FRV3N6YUZLWS9MWlA2Z0lWaFd6QkRNcTFlZEJTalBG?=
 =?utf-8?B?RXJJc3c2VUxCcS81YTFYT0VsZGtlS0xZY0wyaW5ORTRXZ0hHYXZoVGpjNDJy?=
 =?utf-8?B?ME0yMFdHTUlkTWtsNGMvQ3U4czFGRE92MTNqWW9vRm5DRzU0S3VjUEJGc1RG?=
 =?utf-8?B?M2t4WWdWT1IvalVFeFVOMHlKT1JscGhBU1hGOGdmbVJyTG1xY0lkNWxrL21u?=
 =?utf-8?B?Wi90VHRIUzlzMUNoUlg2MzJuMFprelA0MVZvSVF6RVR4cWNkdHJlVE1zaExT?=
 =?utf-8?B?YU1TcXVuVUp4czdZNW1SVEowamNRb1pVNzlnK1Z6UWlHaWxiQXllR1A1M2xZ?=
 =?utf-8?B?b3BURHl6dStUT3E4bDJaVlJiUjFjbTRFTmVSUHdYZ1dTNi9adFVLWktmbDZu?=
 =?utf-8?B?d2RXOHhuSXp5TnJxdUt4T2hYWlZIaXg4T290NWVDbWZ5aWVuSytIUnRtSXh0?=
 =?utf-8?B?MG5mSkdFVkxxTU5BQ21rVEMzaWpDcGpLNnBRNUdtY20xZjFESnhMcE9ET0t6?=
 =?utf-8?B?MnU0OHhuTGR5YkMyQUNDWTVVYVNhYjE3Uzh0M0VDaEE5VUtwcUNQT0hLSG9N?=
 =?utf-8?B?NCt5bkhsbXRMSTJaWEVjTGJFKzdVQzMvdllzMlNMNm40OS9mNElHRlljSUQx?=
 =?utf-8?B?SFVZUFJmakYvNmwrWmdoa01sWUFFb3BYYmVhRkxqRkw2OFgzT1drMlJaYUZI?=
 =?utf-8?B?dSs3OW9mUUVUR3FEZE9DZjlNdmdIR1hQWTMzQ0FzVzM4ZlVmZmQxbUVCZkg5?=
 =?utf-8?B?alJPanhyaWNmY2t6anhDVk9KeFFuZ1ZjTUdjUVppeUdsYTIwLzZXaDFFeXBM?=
 =?utf-8?Q?BAdSUNumNO6QrjcQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b39bd5-07a8-4e49-bf43-08ded21219e4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:00:32.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD6/Q4JniycVhkuMDi+gGwShOfQHYqTgG/mD1lk40PMAHjIB2FhU4f6JTkUfhFsgIHw1adgNZUbmU7+Si3/PW0+pk1tWz+u+BPk5YwpaCl6Bg3cVfKrDFVA5te4JUcNR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-65575-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 944046C031C

From: Frank Li <Frank.Li@nxp.com>

Use fwnode_graph_for_each_endpoint_scoped() to simplify code.

No functional changes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Andy: Keep original code because too much break. and I am working on more
generally solution, so the whole function can be replaced.
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 1791c02a40ae1..f90e01301943c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -187,7 +187,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
 	struct fwnode_handle *fwnode = dev_fwnode(rkisp1->dev);
-	struct fwnode_handle *ep;
 	unsigned int index = 0;
 	int ret = 0;
 
@@ -195,7 +194,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 
 	ntf->ops = &rkisp1_subdev_notifier_ops;
 
-	fwnode_graph_for_each_endpoint(fwnode, ep) {
+	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
 		struct fwnode_handle *port;
 		struct v4l2_fwnode_endpoint vep = { };
 		struct rkisp1_sensor_async *rk_asd;
@@ -286,7 +285,6 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 	}
 
 	if (ret) {
-		fwnode_handle_put(ep);
 		v4l2_async_nf_cleanup(ntf);
 		return ret;
 	}

-- 
2.43.0


