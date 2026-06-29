Return-Path: <linux-media+bounces-65865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKs5OnglQmra0wkAu9opvQ
	(envelope-from <linux-media+bounces-65865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:57:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D686D73C2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:57:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="NNgk0/l2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65865-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65865-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EBEC3106CDD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7813DA5B4;
	Mon, 29 Jun 2026 07:42:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7481A3E1CF4;
	Mon, 29 Jun 2026 07:42:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718973; cv=fail; b=j5Q6mopw6u7XvBR23B8qmtku1QzZN8TfyA9wBj2KGJ7DRMO7EpXUN0ZF19Y5jqXwTWaTUwG4iiQBzazR7F8GdOJI3uNOLrhg0QoKjKmuMmzhrnVR4SuW5xnFQAaOuiRCEgMijEpuagpk+WRMve4i16+uMfnnjoJc5/od/RQImVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718973; c=relaxed/simple;
	bh=Z+SMz/vj3cHr+jhqrLw5NM63oyPEqQyiDxD/GT32hVE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KXuQ8PlenCrbVDc0BOf+UddSdvALPOymTn/HoFI8YozFpB7MaXbGG+XOTMbyxTy8t39A/N/t/HVW4SNN5vPD9VqYK5H9WITr2sKyJV2glEooy3QLHAbZyUCriY1qtErUs8tP0uqfa+uqHcA7NmEBrFbNxHRDOg1S+NkB5fvJw4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NNgk0/l2; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1VNFmOf+5Vf/npluJx4U34NMziwWkyNM18SE7+Q8GAgD6Y+yiW0qb1xZDmlcAuOL/kDqC+H7LNq/JwWthI85ULMI7BeUMp1Gq/9sbd/zWdTkLJ+LhqB5qOopbZflsR5yA1nf+aC/EVj+wEZMbMN4ZjrOYCajvSOLKDPSgv2xYjeAE/Di/oRRmWFtufNEJa370bwgUW2xIIzodjdhs9k8ESeDsgu6kOp5htX2IxinKsh/xKNjM4NLewXC3VNTjzPiYL3YiiGcUUmuzWjxKNH+hDMOB7cQEf/FGu9vG9gMmWzCcUvbk0XFTHUgZs3YhyiIfAn6iplisEDOcDoexY/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tk/ajo1oHzz1CeHSiWfx900kkhjKm9icWgg0KFJFFuo=;
 b=IMYvw7+e+VrDzpTkm/dkENjSBAPmtzIzwdXThij/q4O1rX5soYiNf5k67uTxE8Omq5y7THdM1wIWSqsT+IBs6N6Pn19TnnEh5wT1VVKBBjt/i/3WsUxxU5ygon+Lxi5C3CdituejUwvVkWweHubgNmJraRvclWr1cYMyBSe8gPg6iFlMvYhpfCaHU2gKYlG1N86qPnSUz5Z449cJutG7BTpeuPdPSVaMpPDZDnUbICVZu6pqw3O7I+Z/UKJKLAYgn3nP2l19f+arultNvP+7xZx/euZoDZYcXLZftIDiEqubRJGiFJO3CDRfoMxIJpnGq2ZyfO+e+I0fEaJwfaRDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tk/ajo1oHzz1CeHSiWfx900kkhjKm9icWgg0KFJFFuo=;
 b=NNgk0/l2zHGPTV+U8uuMhruOFIzFrnZu+5fBNMv0x2SSsEg3S4OSvNTKGUs9XsIAPLdIE6XDuz5hbOeEXGtnBXfQcT5HW+E1zCEx/ExTCHS3x47+2fVdGBMHpgmDKAXJG6zm85obBCFS2q4UyRiNmdJiDNBaYrh6qDCmHcOL57QE3P29Elqv79WkTq0FabGLAKJHfahp77kCXVs2MOKFaSw+kS2jAAPkZ1JRH8f8OpiD+HVk5m70Sup14o8erV2vltLhf+Ps5Wnrnnrae6aDev8DJz+1+ecihvgGPP2Vpd/8RqGB955thTd9it1x8PwrQ87TTH+fsbw5iyQsv2L5MA==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM0PR04MB11932.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 07:42:41 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:42:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 29 Jun 2026 15:44:58 +0800
Subject: [PATCH 4/5] media: nxp: imx8-isi: Correct color map between V4L2
 and ISI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-isi-v1-4-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
In-Reply-To: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782719134; l=1078;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Z+SMz/vj3cHr+jhqrLw5NM63oyPEqQyiDxD/GT32hVE=;
 b=xok4ORyim6msiDs8uff+KbDT2eWk/3iw5RPOrTHCu8nI5cvsjog7M65i4hRHxnJMkOgogwEvb
 f7TjaPZxoQ1DgxdiPuxMqM72ujpI5BPXJtmrFopd7lhlc68yKHSTolU
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM0PR04MB11932:EE_
X-MS-Office365-Filtering-Correlation-Id: 844e1515-e2fe-4718-2c0d-08ded5b1ff8f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|7416014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 PKRHTa+uO9wwQoYlEUCmQyOFN8uQi8b01jB0Vm5Ad1lSejspRi+p45AwITFiAY2iJSui17B5IaMvCFL/etyWUO242YkXQUQ90i6j9lHTamTCJvFPIWEF3TSlkrd//L0VQ1ErJqcaCl/6KCQJizvihmaOwqxGwxy2jlIroTjzV025X/H2tVfQ4X4+8pNzM7cNFTWwojiMvEhKQXWxxjqBgw4AnFXDYEZQdcJqTWCHUNQHUXvF+SEiKlpymjfRSBw2RSNmKlDwEJe7H4m+HU9R4lP2RzpJZoP+0d/4eUtu7HuHJIn/9FbBf7Oj+XmYE0UVQJiIiuy36JczyjW23aXvXdowx6wJheXyhiB2uka+Rfa7UmG2AuDP2rfJBV8kFWAQKwysMpd/AtHN5hpx0Uya3XwA9g6gRuCr58MXXtYx11E1ySNKxSeBAfDeT1abZUU3fKxCEp+2qXf2uDsFNdaUagaihgpS6jiEViIf/7KecyLq7Ffj9QvEkBB5kGq3BJZXrT6JiQPI6y8u1HxLW6pHi4+LgCeNJqHnjHBvWV6MSVkWp5U+++9Yv/xKf+DrUa/1OvDGAxSY3Upx6Qt026PixW0qzHlLD6xg4ueJqJfNgDvGrdT4KIFObdvIgw8zAllFfNoiuF1W1GqWMO3v8P4CQoh0vNcyDQjdoBd0IVlLLrY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(7416014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MG5DbStwbHRFU3I4eWdBd2hnaFJpdjd6RWZzOHRCYmZjSkZZT0VaMzNHNVo5?=
 =?utf-8?B?Ui9oR1FtOHRMYm8vcUhWMTRhK0hTbFJqUVJLTnp3cWMyZm8vb0taa1hSTUEy?=
 =?utf-8?B?V1hJcGxWampNOVdBaHZRZk9neno0Q2FFcTV0c0hzeXlhOWxkem84V3BjUi9I?=
 =?utf-8?B?Z29yK3YyVHBXWnRZb2syZ21nY3VFTHBFSEdmVWFIUXFDUlIvVFhsTGl6U1lj?=
 =?utf-8?B?N0pWM2YvUnBUYzlVMXRaQkQwbW1sN0R2enFCclgzOTU5dUFhRkRNWHAzbWc1?=
 =?utf-8?B?R3ZqTWJlNXhNeGlFOEs5SWFXcVhndDZkaklha1k0dXNVRmVwQ0pqVlhudEEv?=
 =?utf-8?B?azBoK3pGK2cxNVJtY3kxdUhPalp0ZE90K2R5Z2psaCtBbHdKa21IelhIZ0lB?=
 =?utf-8?B?VTRkNWFGUVgwUTE0QzFvRDR6bEhmbFZ1SkhIRkhoS0lXU1pnVUxrOTFRbEdS?=
 =?utf-8?B?cG9XOG1yWmdRTzBuRHRjYWR4QVlkcUkvQ3pVYlV6NXdENThDMVgvWUFiVW9i?=
 =?utf-8?B?bXZ5MmNBTnNWVjNZenR4VDRiK1RkSElDTG4wZFJNQThXMFpnV0lsNWs0YWRs?=
 =?utf-8?B?YUowWG1kV2Z3dVY0S2QxQ3dYejhIM0pZczgvcDUrMFFuM2pvdWdwZHFMZUpG?=
 =?utf-8?B?ZEhQbXRjVTZ4L1F0TEdXajFKRzlpVDZNSWdyUng5ZnUzTk5VWThDVmxOSDMr?=
 =?utf-8?B?R2x0VldSMHMxUTkrTmtsR1lSNnZUL3E1SStRTzc1Ym83Z0pzZ0dzVWdDZUI1?=
 =?utf-8?B?bGhRWmlTMWI3WGZxdUl4Y3ZhQ29uVHZzcS9ickZxYWV6ckpPVTFWaVM5TUVm?=
 =?utf-8?B?bWZmU3dROFc5aE9EbUhReWVrQnVIQ3JndDBHMS9Wa1I2MnJOZythMHQ4ejNR?=
 =?utf-8?B?QmxMNW1TWjVneDFOc0ZiRjU1MDNYaWRMU3l4TTZkazdFd2pUTzNyQmI2VlQ0?=
 =?utf-8?B?eERVM3pXTWhiS1V4VldTSUNxd2h5NlpKSGcxZDBqNlNHOTJwc2RDOGk2cWlI?=
 =?utf-8?B?UHhGZTNvUjZwWmJ2Wi9rcHUvQXpzd0FIS01OS0ZadlRRZUphV2VQWXM1RmVF?=
 =?utf-8?B?QWRJL2t0RDhJRU15MXFUckN5OVJvd1hZcDg1RlkyTnpwZlJjNzNNRy85VURq?=
 =?utf-8?B?Z1ViV0dWUHErVE5EQnhNR283cENkdTFUNU8rRktkRlV3QUZuN3NsRm5oUXFQ?=
 =?utf-8?B?YUY3UUsrc1JkMk1sdXN2cEN5Yi9qNWZVMGF5Y0NDck1NMStOR21qQ1o2b1J5?=
 =?utf-8?B?cG5zNGF1blVnb2p0djZhSm1HRmlFY2RSNDBWbmV3WjM2d05MZjZOdDJLVEdx?=
 =?utf-8?B?RGJ2Tk4zQ0hjVmRWdVlVa0RLNFBuSXkveE5JRXZyWUhZajE0NHJLSmdLSTZh?=
 =?utf-8?B?QVdsSWIzcFgwc3MrUXdRUDlGOGNRSGplVzd6dlM4UHZOTHMxOGFpSHZENU5m?=
 =?utf-8?B?bWZteDZpajZhcGdVbjZyQ0pLNitybGdEbUowL0k5NmlNRzJuWnl6YXpJcGRl?=
 =?utf-8?B?SVF3ejc2aUFrNmtwNkFJbDVtb3RZenpmZVZRTEg4L2x6VnRBMytuNmhXZURj?=
 =?utf-8?B?Rlovdkd5eSs3OWZpL0tPc3QxUTgya3JoSm12N3oyTlN4NWFLaFd2R1JsSkIx?=
 =?utf-8?B?NjU0NkhWNjRKNSs5dU1vVm5VcFIwMzdwcGc1ejR2ZG53NHJOMUZ5b2lISkVo?=
 =?utf-8?B?QlhOTHA3bHVHZDM0WEF2VW1hOVoxWlpRWng5eWx4YllTdFY3RmVvSjRhY1ZY?=
 =?utf-8?B?N3d4bkVwUnRVV3Vham9PUWNmRW9iM2tZcjZhZ0pkcjN5d3pWUjl0d2hUY0FI?=
 =?utf-8?B?TGNwa1pHelJEVHBqK3lPUGhTeEFVQ3N0RGlZdGRUaDgyQ2k4SEVQN3VzbVJl?=
 =?utf-8?B?QnA1VkRobkVITVlHalh1NWNMcnFNcHl2ajRoT0VCTmdtcGdaOEl0SHRFdE5H?=
 =?utf-8?B?R3Nwby90NnV2bEF1M2FkYUdzQTdmbVh3NG5PK2s3TVlIOFp4S1NiL0V6QTJS?=
 =?utf-8?B?MHNnUEdMNGR0Q1YrbC9oVU5TZWl4MFlRZVFwUjdkcW9zdGVHK3Yrdy9xeTRE?=
 =?utf-8?B?cnZJTERFMkVZeWx1VWE2cWNEZzVtK0NOcDdMUXJuMmRwd0RWQW1halhJNGsy?=
 =?utf-8?B?TnNmT1hjYXJNYVQ0bW9KemEvdHZUT1JVNG1IMytzK05JTW5US2RzTW1LWDlI?=
 =?utf-8?B?YlQ4SVEvM28rTVNvQms1clA0YmhOTlgzcmZXZnJOc0xGaGMzNnBaZGJxYTlT?=
 =?utf-8?B?ZHdUcld5L2lheXg0Mk5wQTZ2bHlvUTZHakdGdWNRTUU4NnBuMVpwYmhWbzZp?=
 =?utf-8?B?VWQ4YWdWY2RVYS83R0o3Rk5MRFp5b3BpUjVxOWlMdzN5TWViVW4wYXNYYnJq?=
 =?utf-8?Q?pcOppvhELbSKfB8L9mOYO0q+3WyqE3wXehGJr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e1515-e2fe-4718-2c0d-08ded5b1ff8f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:42:41.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJEKaAfenRhCY2P8qsPCL1hKDO9RqyRzbJKXf+DSa5owKoAd5tpOxcDVd/L8ThZn0Mp2wXfXGcQf3JvFLWzfQa7KUbV1pN/LApSOdXpWNrgU17o7j4mvoblZPrwPUKkN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11932
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@oss.nxp.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65865-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,nxp.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7D686D73C2

Correct color map between V4L2_PIX_FMT_XBGR32 and ISI input
format XRGB8 when ISI works at memory to memory mode.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 5eb448f4c26f..05b51b98344b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -151,7 +151,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.fourcc		= V4L2_PIX_FMT_XBGR32,
 		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
 				| MXC_ISI_VIDEO_M2M_CAP,
-		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,
 		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XRGB888,
 		.mem_planes	= 1,
 		.color_planes	= 1,

-- 
2.34.1


