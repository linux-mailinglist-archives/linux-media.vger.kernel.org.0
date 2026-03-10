Return-Path: <linux-media+bounces-55038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEuWIpu/r2kucAIAu9opvQ
	(envelope-from <linux-media+bounces-55038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 07:52:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C05246003
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 07:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A19130A186C
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 06:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6F634EEF9;
	Tue, 10 Mar 2026 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AUt8nsNE"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013070.outbound.protection.outlook.com [52.101.83.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228634A765;
	Tue, 10 Mar 2026 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125493; cv=fail; b=T++fUy75yX+EXWoNtpc23RkL98atjgVHhiNgJzu1megv1SgmME8CD2QNkmJsP79jaR72CtxlRhqJ0fov4cI9kpPhcH7qu0a16KJ67qnvyFq9OMB6Z3Pa+QUER8K94PfTToLGwMqQ0ItVgjX44qfb4FlaAHRHcdKz8qf7kdVnDGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125493; c=relaxed/simple;
	bh=y+d0S1NDxP/1gDdxmuv0OpjnXbDCuAKBoJiTIlGEwEA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=Bj80GqxPyFFMcdLZ/ZCR92HKgrkUeRLBjDSOCl08YkwnaOv07UIELzAFGsF2NoYaxxNsG+RJKlxefBv15DVgjKpXrGjcWOLwMhgkTAJNrHMGOYZ5kqwnz97spQNKHot1ONlUxgOwksPoRAqwcp8VTVyzJFGQ0clyr29zvOl+WPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AUt8nsNE; arc=fail smtp.client-ip=52.101.83.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFYw8kT7Brbc4EBkKS7xVDLkGk6pghjyZjPEwfuI/KZUUotMFei1n0RHYMEvGD2hBdzDiOA5RwP+PGHxIzMp1d5K8lG+3e/yJD1PmxXy/ZAkCa9b1PtLwJUybWbr2ra6wLUzcQPk692ig+wH3FMivAaXwyt9Smqk7083vTri4zP3hzslMsHZYaCssX4eTPxsWTg76njXl9Mb/qILoGP8TyjDeaST6dZj804Wdv8lRmr9COkvrtZUf60Yk5bzF8zYDtLK4GcvmfGMYFOh6YOYVJA1HjPeTqdWDrucbKWHde2eL7ZllKz8ZMUcz5PtLHw0GLJZIfjbAzABlaUiLXNgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYnD8uUn4swwpv6qSc3qFRKck3ayc4dgIXRm+sIAaRE=;
 b=j5i0WZAHgvI3dKRQBWZ4H5T15NdNlRpABuJQP+Pq00GHDsqUIaU3Upu//zGq7Flzl1Tdq8BIyFSGBkUBAGNCwag4RGHspfZ7RSkWsu6ThgFr0Iv0xw/ndoxyIqumJgOuLEZ7t3VpWwTqqDXfGYevJOC2FgGwAyCr5zfQmLdvGzXDMssyYzwfsII4DxzX0tzbHxSFBzIAOpfcgwvIOMsJRy1wjc9ipQmTXyAKOvX99l8280irQgby0TMwe/m/27SoMTBXCAvs7Qn5TL6HXh2UJX6v/n7M947JE9hJ1eCVlquLhcS7APNNK/7H+Upuq7aBpzfzBiaDzhOU04A3bN2yEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYnD8uUn4swwpv6qSc3qFRKck3ayc4dgIXRm+sIAaRE=;
 b=AUt8nsNEG7UGeI5oH0LbnXzYysihONZsokP5lFSx1nMh3ExR52lZq3OAHwj+zzBya2nvflv1/SePftonugufJThAvREyawsugfAToBt5DC8AjiyC8Kd86DJ1BfD8TvBXSEpL5f8eEENbwB8iUooe1xHVB4Su3JAXwJIJqBqHZDzNB+18+qTGI6odikjq9hMHetslHHElUSGK58GbGuko4ZZ3yyy6Ss/j3+JSiVFks9vrtB1qqGoodVzTjoOAC/xJ78FTwKMYGTQxw/0SgevCZNhT8HfzubDieIvif+yKj5eflUU9mOi4DYr38J8UEuUIhIOH6Cc59vH8olPNyBet8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10342.eurprd04.prod.outlook.com (2603:10a6:800:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 06:51:26 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Tue, 10 Mar 2026
 06:51:26 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 10 Mar 2026 14:53:10 +0800
Subject: [PATCH v2] media: nxp: imx8-isi: Add virtual channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com>
X-B4-Tracking: v=1; b=H4sIANa/r2kC/12PzW6DMBCEXwX5XFf+YbHJqe9RRdXa3i0+BIghK
 FHEu9chtx5n9c3szFMsVDIt4tQ8RaEtL3kaqzAfjYgDjr8kc6paGGU6ZVUvK/GzRWk8cPIadKt
 IVHguxPl+BH2f37rQ9Vbp9X0UM65xqGmnpmNte9QJWkZLqrMmhT54dLZDMk5ZF4FbwFduwIVkn
 C6XvFZjImPZawRSPpDnwEA+OeqZQnQGIQAbx+LVYMjLOpXHsWzTR4X/IzYtteSkglcWko7pa7z
 Pn/WbOO/7/getVT8FHAEAAA==
X-Change-ID: 20260309-isi_vc-285fd815140e
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773125614; l=6012;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=QFEtFLlzntrSR6TdySi9sHm9h8CN0uSrqEO+aHPSXCg=;
 b=SxhdRjXIowm7X/O9mtNy2BloQ6AXh25a5N+3ByEfB5r+DxfgyUKBbKOZW+dbM+qgsoCrXuqYm
 Cd2/+iJzXYpDY12WeOzevCNshwQT4ozFYoc/PdSN7K1uMkuca/p7pMT
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0280.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b8fca3-c9c2-44b7-3c21-08de7e71732f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 1k2fYHopZuHPuTnjJmsNX//WdEPhMo+qPq4x3gh9YVCmyDdB6vqf+gICG+nPYR0JE0fL6wxXzSB6/YlscHr6fL3BOCYP7IQtui7FVnJOoEfQgIGBFe/QVZAY7uvVJTDd2wZwePwmyWHF5EfO6tL1Heh/1pcyxoNa7+tzEtl46hWzvFkvVSZnzudgff/Ek2ohLBj5PfsWEtbZa8CknHIbZf2AHnS3d48VBgaDn5l8ZDaAqeQL9EXWcwMM+ZFweWnPBS5aaFz2C8ASFO06MzBVB5w95+8/vBPUNUVxD2DWlelbIxPht6ZUqYOclfOFyZ21UfvE50AuGQPQA9Q/rqsDtdhTmw6+kNUkdB6qKL7GnkLRdWXq7jiLJMYuYCtj9r5lcto36dtpiS7k8f9U2322o33y4UC/uQZSbW9AMnkMRmLrpKQmBSdmFPV7CgWWbLRC/g2pGd9hdASWmB4ZG0KyVrRhMAvhjQBFx1DSxJI7Qfp0JP7JiBOD634BokrYzJCR6w4ifFixtbcV74a4Hhh186xSnfmEQT/1W6zD0/Z/93lp78dNcPP9t1qjLy2ENWhqsVprv8Ja4I9d0PlM/vyfrX2/4cRvqOPhsdfbP5Rm+1S1uo7/n+sd09f0l3RyK4QoV4W4WmKIOsKODWzGR95wDkFY/ZSz8TuNqhhGB9HZgpXLLMuWhe3M+jToc+WtERwG9VVbNa1NPbkJZuTYVsMJmtomP6m7A2k+xp/c18hycGcqUJ1N2y2mo7eLR5Sb/XPiXn0Wqy81SQ88oYKFsACVr9+l8vydBSf6nCDxwPMO1Dw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MFZIL0RLT0FXdlVZZVRSUFhTSVZtZ0l6VmErby9TeDZrdy9lOXVRNmFPS1FP?=
 =?utf-8?B?ZWQyZ0luU01IOTFaUDFlV2ZTeTBLdWxnRTI3TG9nT2FRMk1BTmlaMC9LSlFo?=
 =?utf-8?B?R1pIZHJha2tsTXB6SjdyencvcXZJa2dnOXlsUDNWQUdESDdwQ0diemtxcVdW?=
 =?utf-8?B?UzFsOVFtWlNIMmRtR0Y5VTduLytLZ0YyS1NSaW1HT2c2N002ZFZrZG95cHo3?=
 =?utf-8?B?SDhZck1OeWdNaXJQM1YwbndBMUowYkxDNCt4THR5bklKY0ptWUFQbVoyajYr?=
 =?utf-8?B?U3NacnVSY28yK3NwQ3hJcEc0ZnNCb1N5bmZkSXdzOHpGRGhOelIxTVNSUUxZ?=
 =?utf-8?B?VWltb21mWjVMZXlVSS9PV2l2SEEwYS8rMzlqWGdRbThXRzlneXUxb3BTM2tV?=
 =?utf-8?B?eStpb2VqSGdGdnZSSitDSGw5WkxGODY0bTMyM2NyeUtpNmVxQlhqQ0t6NjVx?=
 =?utf-8?B?RGg4bFpnUU1jT3MxcENRblJsWEFSTGhyaVV0QksvS1h1bmRON3cxRjR0SmZQ?=
 =?utf-8?B?R016R3ZiKzNPV2U2OWhkTytnajZqUHJGYjVwcTA3ZS9uMkNGc1pzL1hyc1h4?=
 =?utf-8?B?QnBZbjZtZ0lCOWJVNXhNcTV6bWVJcVV6Rk0zUzRWWmZ1K29YeHJQUGM4dUkz?=
 =?utf-8?B?VWhxZVRXTEllMXdra1R0VlQvNnVtZjhKZG80cVdzRmdKRWFyd2RwODJxRVkr?=
 =?utf-8?B?M0hRa3daaXY4S2xsMWFIZlVEU2dlQ21uWXRVOUI1dnZZTTFhYXd6UXBWMEhW?=
 =?utf-8?B?SENYcW14blNFNmU1NVg2VjJPdlVNVTBuWEdkYnQ4QzQ4czlCYjJIdkU5VGlG?=
 =?utf-8?B?VEJMYlJKbzRXcnUwbnFQdnIvakJkWjNmRmZxb1hLWXlBNThXaG00aWhYQXJm?=
 =?utf-8?B?TGtVTmd0OWxqSFhxSzlzOEdFUnZyVXZMSnUydmhZa0NnUVhDSzQrRU1aME5U?=
 =?utf-8?B?YXJNY0FZM2xJS0ZNTVZ3VXQzRG5NVHBaYkVKU3VMbjdjaTl1RjV5dDJ6MG5B?=
 =?utf-8?B?ZTBaai9JZkJWSnFwZjVsMnNjRk0vVDN5K2VXdjlPRUhINFJhUFQ5Z2pYejlO?=
 =?utf-8?B?cUNaT2x0ckFlNG5jZkFKUTdQakhpYTRPVjM5b0h6dkQ5aFJkN0RieEo5TGly?=
 =?utf-8?B?a29Cb0FqNjdEdGtvYkpxTXJLM3MrbUdPSDJyUzhia2lLbjZPUVI4WWpTbHdh?=
 =?utf-8?B?MHZqanVCZVhqT2ZEb2gvR01mTVlseXdQUlplMnZXbFdYYjlDaDNaOXh5M3c0?=
 =?utf-8?B?WDFFVzR1TVVQaUVCRGtxaXpNdTUzSVNGa1I0VXFaWnZkTStLY3JRcldsa1Fx?=
 =?utf-8?B?QTNxbUJZUTJEWVlOQlNkVnpveklndEZySzcxck1pY3BLUU5Kakp0dC9wZVNi?=
 =?utf-8?B?RWR1S3h3ZS9mSEhPNmdQWklJa0w1R05MUG81TU9lc21WdGx2Q254Z0RCN0hx?=
 =?utf-8?B?a0poTjJYdjljOXdJNXdESXMzdVNRMzlEVVNQNEQwYzFDbDNRWkdETjYvY0tR?=
 =?utf-8?B?UUhiN2ZMcXVrUzNNLzFlZEJqbjBWUllpT2YwdWp4N2RrMzRMZER1N083dlF1?=
 =?utf-8?B?eXFkd2poQjkzWGMxWjhDRnMzT3ZxbktHSllzVGRiWHRDcU94N2xXSTBMWDMw?=
 =?utf-8?B?MU9wQjEzQWNBUVozVzEvUThuaGxxcDU4alZJaFJTVjUvVWx1Vkd3SjZuSGRz?=
 =?utf-8?B?VkttR1BWVlZSWGJBRWVFRlJNWklXTjVmcDkrWEx1amxuSlVXNlE4N1JzZWNo?=
 =?utf-8?B?TDNjQzlxaENwZmNtdUJYWWt1RlRvaDYzV09LNUZmY2N0MHp3S0JwdXdrOTNB?=
 =?utf-8?B?VEtaa29KeENJQXVDK1IzMDJFTnRueXU1QmhrVW9nMkJBaEg2Skt4NjJyMUp4?=
 =?utf-8?B?bFdlbTFES3dReDYvNWN3M1ZTcE5UYWVlbVpBK3JtUCtXRmpwc0pKVDgwVnlh?=
 =?utf-8?B?RkpyeEtiQnlRMUZLM1ZDRng2bmRVY3piQzZtZFQ4VW0zZDZ4cTl5OVBNbkhX?=
 =?utf-8?B?VXdFVkZQNjlRSlBtTXBBQXE5UENvVWk1ays3STdiR0tNbWZUMmlQMWJWblhI?=
 =?utf-8?B?c01lbGpMbUEzQzR3ekd2eHVvY1p6MzAxb2pCcjZ5aVgrTnBkYzNhS1B6K20r?=
 =?utf-8?B?bGVyeVcvNzVWYjgrVnN6MUtnL1Q1TDhYbVpQUWZLdjNDeXBSbEZSQksycVZZ?=
 =?utf-8?B?UVhUMERnbUNvOHRkcFdjbWFXOStlMUJjcFpmRVczamkvTC9FaE1oSzBESkdF?=
 =?utf-8?B?MjhUaVYwTnlybzAvNGpyVEprbzVrbkM2V0dhTDd0VitmdXRzWDk4RTQ3U3Vs?=
 =?utf-8?B?YlUwcGwyZGxCYitBVWlBVkJIZndybytDbW5YakY3K2c0eTUzRmhHUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b8fca3-c9c2-44b7-3c21-08de7e71732f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:51:26.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I79YuQ3naygF4Wq4AwPfwHZP5mJAzmuvm6D1nMZUt4MuhdIBJaAZ24hc30FO/ij9Finsrz2rNKn6Pp1Tzxjmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10342
X-Rspamd-Queue-Id: E3C05246003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55038-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:email]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add virtual channel support for ISI driver.

The ISI supports different numbers of virtual channels depending on the
platform. i.MX95 supports 8 virtual channels, and i.MX8QXP/QM support 4
virtual channels. They are used in multiple camera use cases, such as
surround view. Other platforms (such as i.MX8MN/8MP/8ULP/93/91) don't
support virtual channels, and the VC_ID bits are marked as read-only.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Add Rb tag from Frank Li
- Fix typo in comment(s/support/supports/)
- Update commit log to include more details about ISI virtual channel support
  on different platform
- Include bitfield.h file to fix following build error
  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h:23:65: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
- Link to v1: https://lore.kernel.org/r/20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com

Changes in v1:
- Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  4 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 43 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  6 +--
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..11a5e395792f11752c44d73818c825f2f175aa1d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -256,6 +256,9 @@ struct mxc_isi_pipe {
 	u8				acquired_res;
 	u8				chained_res;
 	bool				chained;
+
+	/* Virtual channel ID for the ISI channel */
+	u8				vc;
 };
 
 struct mxc_isi_m2m {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 0187d4ab97e8e28fca9013f6864a094e08f2c570..2babb8573227de9e1aa36d9a39be41b286cf0c57 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -338,7 +338,9 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	} else {
 		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
 		val |= CHNL_CTRL_SRC_INPUT(input);
-		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
+		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc);
+		/* Platform like i.MX95, ISI supports 8 virtual channels */
+		val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
 	}
 
 	mxc_isi_write(pipe, CHNL_CTRL, val);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..cc4348ea6006ee19243aae3abceb235d00beea4d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -232,6 +232,45 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_pipe, sd);
 }
 
+static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	struct device *dev = pipe->isi->dev;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
+			       xbar->num_sinks + pipe->id, &source_fd);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get source frame desc from pad %u\n",
+			xbar->num_sinks + pipe->id);
+		return ret;
+	}
+
+	for (i = 0; i < source_fd.num_entries; i++) {
+		if (source_fd.entry[i].stream == 0) {
+			entry = &source_fd.entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(dev, "Failed to find stream from source frame desc\n");
+		return -EPIPE;
+	}
+
+	if (entry->bus.csi2.vc >= pipe->isi->pdata->num_channels) {
+		dev_err(dev, "Virtual channel(%d) out of range\n",
+			entry->bus.csi2.vc);
+		return -EINVAL;
+	}
+
+	pipe->vc = entry->bus.csi2.vc;
+	return 0;
+}
+
 int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
@@ -280,6 +319,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 
 	v4l2_subdev_unlock_state(state);
 
+	ret = mxc_isi_get_vc(pipe);
+	if (ret)
+		return ret;
+
 	/* Configure the ISI channel. */
 	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
 			       sink_info->encoding, src_info->encoding);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 1b65eccdf0da4bbc3a77c91e06fccc35d6c7e022..a4036da72f0057265e991087f21bc079bd6c6573 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -6,6 +6,7 @@
 #ifndef __IMX8_ISI_REGS_H__
 #define __IMX8_ISI_REGS_H__
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 
 /* ISI Registers Define  */
@@ -19,9 +20,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
-#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
-#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
+#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
+#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
 #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
 #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
 #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260309-isi_vc-285fd815140e
prerequisite-patch-id: 6f139a1d54fa3e0632db9b8a736ae27037c5f45a

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


