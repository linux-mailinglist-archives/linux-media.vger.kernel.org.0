Return-Path: <linux-media+bounces-55462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FshMrcvsmmzJQAAu9opvQ
	(envelope-from <linux-media+bounces-55462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:15:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307DF26CB26
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF8A93223DFD
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69277383C6E;
	Thu, 12 Mar 2026 03:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t3RG/OVX"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013022.outbound.protection.outlook.com [40.107.162.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDDD386445;
	Thu, 12 Mar 2026 03:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285059; cv=fail; b=gUCboAiiTWIm08KJxoLRlitHp7rHTVfmKK9O3sAszxGiQeupiMPYNbQJ5w24vbggkasjOcE1jQOOxqYOmTKScwoAIR69j5bS138WoPIOw0wIRt79lBFj1zGzbjXYKxEDrWeCttZB0p/jZEv0Jk5doPJjkRxqu/3m9XHTug8anOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285059; c=relaxed/simple;
	bh=Z4wGXOPXMcRd/Yw1bxajsOYl+oE6LoJzX2KbVL071X0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tLF7/QLtz5q/mohVzBsS89CxoUFHg7yPsOEYbWQwHi4akMLjGgz7bj9tb8qtONq00Sw6C9LS/K5gbSLhvhAPo2XT7f+hSmMZNY8wBy4vImEAx2Os5USi+duZqc4b4KDWEP4G+SOiwshKthj3R0oM6Uzhrk9PIiVNSvBiG70XAq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t3RG/OVX; arc=fail smtp.client-ip=40.107.162.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/0n20WwfWUSWPDb0eZyaWik6oKEVEGVY0rUzB4EJJA1V6bjFTc9AV/zC4MiR0xg4Ya5PINQOgft5yfZW+d//2XIVW8VnWJMzAI+h7pw8S4gHXYakkx7Jpbnc0ZagMhCCt7PNp0bmH0xa7zVuoWIAKHbKS+sulBjv20tnUGCLH4goQSmRqCfUYEmd98CQO4psbUQ5wPMRIg1yMPSmQKDMH1WiP/xi6PXIzy0pFOXlkS8sRLXasCCJ7dNXX12YZlfnfmN+kEhT+721cL3uYyealJiK4wG4T6pGeXs2p6XbKOX/My68LLTj1u2ZDI8fsInXyMIybZW8UoV8dxQdlU/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSocZ0yqurS9dkzZfSj9kfI6Fk00KZC0rkfONKKbsrQ=;
 b=vB71I4gMqIYet34Tm6ujHikQGV+NX7I9+MHR4gk02tmjPYfNYw73pIMSUQtTR1B0ueCHoKasdZSjIWEGn6e3U2emtvZFLzu9/kp/Aigt3XMm4078azerDQIO+imH9lIw6UJqpN+qgDxSzLrD4scg54f5UUozuEA0kOchnH4SMFpGl1VOIPXE9X5lmHV+uv4QWpFZYopPt9alj/bOYw6uzyH4oZd/oqqDvly5WJeNsMwI8C+JXmF+xnCGsF631W4yv24E/W96vpJhauiHCCLgSjiN/uthSnavHkUKpd1xTOtXhKI5MaiHlnS8ZyN8pX8fAoWCupv9M4EnV+McU+h7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSocZ0yqurS9dkzZfSj9kfI6Fk00KZC0rkfONKKbsrQ=;
 b=t3RG/OVXpvLgKod4VYo55O6c4uxManvMZKKar5ujLVSWG6gjmRetOt7rAa7UyE8Ahcx8X/YbPHctPh+7CvD3PWB3ZU4BOgPe8kSkzWFHeqZvcN3S0NUAVqSkaDNdBiy+ZzHjo5JkVc6MqLf7ZYkRYbOro+FnEnPe0gMZYNhfcwl+ELSpds+QZ5n5ArzMRLvj7CaU0/eugJXaVZB1Goys6rWUWFaOmNjARBi5yxQ688HVp/kcjeMCDPytDjlhItt7Ymvexm8qxt/aODguYjzP20AKfUF/69xfyVpGO6PEZPkINGoxwTiK9JDMxxzpoqYNhBmMzxop9T4NjPd56wihOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by FRZPR04MB12395.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:10:47 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 03:10:47 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 12 Mar 2026 11:12:35 +0800
Subject: [PATCH v2 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
In-Reply-To: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773285164; l=1868;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=iEZpx+Ce9PnHjW4p7SF6txQjhZq9oXgmIBE5QFN3JAg=;
 b=bNZ8dFJmH7T2IVNnaHVmJ1OsW4vxoNY6m6u0cMsWtY0NUmZKWT9FO2ZocCjaumukLABXMAJFu
 8KHLICmhD2rAIQlOGYbsPkGwZpZ5+ieL62ZT8VBjBZUO6qhCaXrVL2o
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|FRZPR04MB12395:EE_
X-MS-Office365-Filtering-Correlation-Id: a909f594-8612-4148-b1f5-08de7fe4f4e3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 fAK3spkJ7gTvG5OHsW4/8Rc5k3Fuehsh5pC8xp8glefvZoC2B43yviPQnKiWPttJfLU72IdV113MJcaFIhj6hWE1UBJOov0b8YpbkmfHgVPzOx8SXJc1G3jY8r7HMCUji9bNMsJDPnVE5a2ZWmUNdylw/6lfcq3SsdfFguuCfLwbUhJclz72HvK3AeVcYgjJ7XapnziYTa3fOGz1C3SGkalAe332nvwPAPhD6uiBHVftGRQgmK/71Z5p0yYtUj/VuyK/HpMYDOYEq+Z/3OHEmIuMZHHQ4PDgNycYZDoCEDKr7lXJoP0AVTWQ2EJ47loE8wXh0b50LpRz7KgYfTWsa3Y84fzOdqTbkbagMF5yTcXhZ/dRBt4Tg9a3yaCgfVG1HpCJ0m7EOlLLzUat9C+ReVoMXk3yq9GsGYSdCIg523Dj7W3e2mClzZo/zsZsmkpgxGLpnVMp/7YY16ZTR5dsWtUCsQu/7fFU26xHzFYxwS/LbGY7WyL8qQuXnR6IvE99Z+Dn/zZv8qEdQ6j/FICyT8S60NvrnkZaITKuy5xROva75S7164wWBdcL9R+NpHkgOrrUpvqBShJJIbQ2cAHqLEPS34OvQMCw/71JwQtpzq4MLAs9hL3/n4kpy99vU4757UOBsTkkGgKyn1TNzEas6yb5vB78r59g1MxZU0QZuNdJVZN8vQL74zjCjGjnYMB/q2Bv7vfjT3tvr0mkvgRj6DLHs3dzrz2WbBNfRq1C36LS9i++25H5jzDV/6eN2EEl
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MlpRY3JINVlya2FmZGY0cFNoMmpqRFBzSjdhWFFRdHl4blBNam1MRUJ4ZkV0?=
 =?utf-8?B?NTUxRjJaZCs1VW9GeitxMXE2czl0OFB3MWYzQUlsRittbEFrYS9sdDdYY3ZR?=
 =?utf-8?B?NzZDOTdpRjlweHZPbzhMUTJDUFJTTHRoUFNGSmlTUTJoZnZNeEFGWTRwYWVM?=
 =?utf-8?B?QTRzOXdHQzZlRWZJd0VzYXBiblJNdGZ1SFpidGVDcjErWHJJeFUzZ1hYa3hh?=
 =?utf-8?B?akl0Snp4em5jSEdNVjlRcHN1SjRxbys3ckhlRTFiTk1uWGErK2s2aGV4VmJT?=
 =?utf-8?B?aXlkRWRwZE50NzNVOVJWaS9HYW5lSFpwOHJsNzRDNis4ak1jODlXVi9RT3BY?=
 =?utf-8?B?TGVqVmZFUzNQbjJ1Z3pTKzBPcEdLWHZGV24ySTRJTGh6R2YxMWZObXUwUDdB?=
 =?utf-8?B?RS9pYXRvejFMUzVFZURmR29UcEJVRWVFN1dxaDFqV3Y0VTV3NDFwM0JkcENm?=
 =?utf-8?B?MHAzL0d1cnRDdlJMNTFnMHpmbXBRdFhvelc0QlZUaWkxK3VMa2wrQkFpdDFi?=
 =?utf-8?B?QTFZUVdTdzh0bVRnaUJ2RGlDQ3RHRVF4UTI2RkxRbm1NY0g4b2pzNm1qTzZT?=
 =?utf-8?B?UWtGM2xESi81ZEJsUEVsWTRyODFGVjd1Qkd6NUozWFdaTTMrRTVDSGk3TDM2?=
 =?utf-8?B?cktNK3JyQzZ5Sm44MTRGeDN0TjNGQUppRDI5VkllSUpJZDFxL243UENQVDBV?=
 =?utf-8?B?M3ltQklWNlFnS05OalY1UnZXbWxSNU15U29neTFZOExHc1Q0S2FLNUNCSnBy?=
 =?utf-8?B?QmV1OEI3NDNlTm1MNDFLcjM2SVdKZDNwUWh2MUNPN1FPWWRiZVpJR1VyRnhB?=
 =?utf-8?B?UkdkQ0o4bjdNa2NDYWROeEFiTG1Ydko3aE8vcnZ3UGpDaUFqVlVHN3ZFVFFT?=
 =?utf-8?B?a2xTVzBLOG5hRjFlVllrVXJmSlpmbWxiNFJEcXJYV1ljSHZER0RMQnJ6ZFQv?=
 =?utf-8?B?V2lWRFBrbDVtK1BRRHRQVFlvWC9BNVRmaXp5djZYeXFzOXJxUjN6TzM2a2po?=
 =?utf-8?B?MG1UWC8xL00wNHBKbHF0Q3J4ZW05SHdGM2FPZk44QkJ6U0NVOCtvLzA2WG5G?=
 =?utf-8?B?azZhTC90SDZUK0NZTVBFSlJLMnBLanpER1B4TjY1RndLb2VtQ3dka25jRHVs?=
 =?utf-8?B?L05WNUJSeVF2S3U0UDB5OTE1dzZwb29HVTNQc2V1V2p5YkErQ1VEcW41dE1D?=
 =?utf-8?B?dnI2SnptUzRmWG02TldueWJpSjBOdEcyMzJiamVGMnYxZWVlOWZzL295NzVw?=
 =?utf-8?B?Q2JNZWE4YXBWZlRGYkUvUkVXRXg5UDF1d014YTNBenVZTFNuY2V0VjZiaDNx?=
 =?utf-8?B?Sit0NEpHSUZCcFFKWkhaa3FsMStLazVQaUN1TWp5ZlNjb1BYbStTVFgxY3NE?=
 =?utf-8?B?d3MxOHdIdlZyd1JUM1JnK09BUjUzV05ja21RNCtGMTJCRDdwblhYZlcxZDdD?=
 =?utf-8?B?RUxZc0lvVW8zeEY1bFBtR1FxZGJCdHBzQzEwTE9leDNLaVYxeWhMVWJOTVZU?=
 =?utf-8?B?eGJremZ0S0QxaXVGWUFFWkJGSUtkMHhidElpU1plZ1BEem9PeHBURmg2akN6?=
 =?utf-8?B?N2ZoVkwrQVNHdDdpSnFqR094VmhUc1RmVnRkQXdja3JzMnloNlNMY2VCN3k0?=
 =?utf-8?B?RmdZNGMxOEVzM2M2YVM4dTU5RnZoeTVXVHBqS2N1enpnT0tUTTZaRjRYV1Rs?=
 =?utf-8?B?MDQraHRmTCtqL1Q1OFlBamRQRnA1MTVFNXVOZzNYcXZIcUhaMHpwUUUzdy9m?=
 =?utf-8?B?Vm0yVkhzc1kzVTJjK0VEYjhjUzJIcExtNi9JbHRXWTZWZEs2OHRKYjhwc3dO?=
 =?utf-8?B?V3dEakJiSkhjdjhDdnBJZ3BoT3ExcHI5SEZLQmk3eVovWFpkRFNPQXlpeXVS?=
 =?utf-8?B?SnhyQkdEcjduWmE0cEVIWlpIenVKNjRDQzlERzR5eTJxSkJ6WHRsQzd5L2Np?=
 =?utf-8?B?TkdkS2s5RFk2dFczK2ZWRlNvTHpZZjMzR21nYTl1QXhyeDZtTDdvVXluZWFk?=
 =?utf-8?B?Z29UZExxbks4MWpEQUh3bG02eTM3Q0ozcHdkeDYwWG81YzdCZXdSbTNyWlhT?=
 =?utf-8?B?SjdRSWJ1cU81WDZOekQ1ZHh6UktZeER0QUtXbm1UZmRETk5IbzdjNllqZ0J2?=
 =?utf-8?B?d3lDWjhnYzJYWTg3U29OOG5zcXdwNkZOb3Z1L3lGa2NSV3VUU0xpaHcyem5L?=
 =?utf-8?B?c1J2eXFEbjVKS0svRUZhUk5MdFhETUZkbVE2QTVyODNxV081MHZ4ZGtNcnpY?=
 =?utf-8?B?ODF0elVtS25NMUowRjY1aCtRQzUyeE5KaXlxUTFxMG5xRm5iNUxxdDZoUTh4?=
 =?utf-8?B?NUg5YzNKdlA3bmhPM05YWm5pVnY3RDc5Sjd3QzZLRllzQm5USWpGUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a909f594-8612-4148-b1f5-08de7fe4f4e3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:10:47.3267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKNwJTFpe/GoR4ubQz6I2b8nZ9fid8bsqWw37zpyqFyVsZnZyT1X010/5gkZ8n/M+sR6G4t3+ixc3R+XaZ33TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12395
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55462-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 307DF26CB26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Change the buffer selection logic to use pending buffers first (up to the
number available), and only use discard buffers to fill remaining slots
when insufficient pending buffers are queued. Ensure user buffers are
utilized as soon as possible, improving efficiency and reducing the number
of discarded frames at stream start.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Replace "This ensures" with "ensure"
- Put example from commit message to comment in driver suggested by Frank
  https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 1be3a728f32f89338a75ddcc4e96e7501ed954e1..77ebff03323ace50ff039c8333d25a9c3dd44880 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -792,7 +792,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
 		struct mxc_isi_buffer *buf;
 		struct list_head *list;
 
-		list = i < discard ? &video->out_discard : &video->out_pending;
+		/*
+		 * Queue buffers: prioritize pending buffers, then discard buffers
+		 * For example:
+		 * - 2 pending buffers: both slots use pending buffers
+		 * - 1 pending buffer: first slot uses pending, second uses discard
+		 * - 0 pending buffers: both slots use discard buffers
+		 */
+		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
 		buf = list_first_entry(list, struct mxc_isi_buffer, list);
 
 		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);

-- 
2.34.1


