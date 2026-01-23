Return-Path: <linux-media+bounces-51441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJyLEHvNc2kCywAAu9opvQ
	(envelope-from <linux-media+bounces-51441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 20:35:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EAC7A2E7
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 20:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C00253040216
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 19:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D390321FF5F;
	Fri, 23 Jan 2026 19:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qy7Z+tuv"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B71D7995;
	Fri, 23 Jan 2026 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196882; cv=fail; b=Byn5Io7NgWLw8ho6Eji/ZJe2uwWAdhfI1tyR6ZIbwTicpiESL2CU7vNFh0Dt8Ji2F3/bihS/FQi+QgXEDFNoPP+L4zUCoROM20RWfuHv9uHHo2Yo+a9+J82G1yXDZWD+ho3w6dKHBjuos3yF1OrUF8mV0adx5wvR4UAjnAbeBqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196882; c=relaxed/simple;
	bh=SSbVW9w+OOLrrzcJ2XFVuzUDQFIeHU1mE0kGiwhYI5Y=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CMJ1eLFC3X7QgMtMQYxQdxdzR8oK5uM9AA4E+yaKNYSlnkmNKTY0Gy1W3INLr7tcnoutzG07fwAZTTVEQr1rAmPz83opxswONNU0gPGS2FOmMh6fxn7IxAbJ1R2QX04QHW36IBytILQAZ9B7LWX8owwjvCDo5EF7+XP63PmxgGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qy7Z+tuv; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6vg8NZXR+SnvEdjsxqiAA+GERvz7c/cvSHNPoHGWVGrQGY77iN/izNPQ4s2LpRTpVNUwcTifbom5f8cmx1ROQvwB1VR1A/wjFkZJd+rpYP4mp/mjTAuqSF9oHnL0Ao6UuJ5e2Yvi9HSK0BAHm7hrAbdLElQ7qt2TauTlwR/F6hfZkByFUI8tMeh10HuyIJS38Y6WaIrCapnZsoTA/XjkwmELq/BA86yL9aY8zZN8ZM+6zKStVcQ909s1+0/HQmKNHB36jRZde4YBY6qAiaEyGj+XuToUBO4IPSvK2hNeuF1mmJKnZE9ULY8gQK1tg773w+1cizbUbCggKcCwSLvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf2vPQNvIH3VY5s9TAFfTKGpo5/XP5xcG+xIvVP/uUE=;
 b=vynxZ+peCF/iWimIgIafj+JzML4/i+GgsIfHryeo2jRetnLC671x1n1QHkbCpm6pU6VNpUyvnKjROsmRxPWK7Iii3ovekM6bW2XOJa8KzwLy/zfMQnfc/uYiQiUOgBDX/1QZdZahLFdBstyj0AnO9UZi94TjE6ezGLyciI2Oyzzn1PI+eQun29KhL2+CnEBLkf7V/gi3YaAFXxzUl8N6xIqIud3D05YoNx3E0Tu4ozr89i2rqGiDDErl5urPr5ikCD/1y+kpUi1HOQQqOJTo2+rdDHfpEvb/e2dbvXD3GX7ryIElN8Vm1TCH0j0jRsNMGIDwiRuhVhmPHtbgeSuu7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf2vPQNvIH3VY5s9TAFfTKGpo5/XP5xcG+xIvVP/uUE=;
 b=Qy7Z+tuvRLSC6GkeeApIxkyF8vLZOfwUOfmP8ieJJL3DKJZb0GYCxQU57yiCyjLSnyLmOy9B0pLzHOUfSPC6rZzkf2iyxzjrghKN0VtP9K03VeTFh0Iow8M0cQbRYdBleG5LFejTtiqLJzfSV2T2r+MljidivNn29wJuw73iaqO9ZMJmhjGc6V+74RT8bEftlIrt3XHjFpgIn9p6n688XtzF61ZAORcNChivHeO/v/F50yrAv8p/DBI0aJEmAwWS9dcAF32vArVsz7lB/+qaIwNqzAER8U28wq57+xnvU/GtunGxsQtwlJwRyIDzioyAGmQ6fkm8g/fwq8la8jRlWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by GV2PR04MB11591.eurprd04.prod.outlook.com (2603:10a6:150:2b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 19:34:38 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 19:34:38 +0000
Date: Fri, 23 Jan 2026 14:34:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Michael Tretter <michael.tretter@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: staging: imx: fix multiple video input
Message-ID: <aXPNRbXBt2PRdFe4@lizhi-Precision-Tower-5810>
References: <20251107-media-imx-fixes-v2-0-07d949964194@pengutronix.de>
 <aUPEs4wUHgAyMrPX@pengutronix.de>
 <aXOo0cc07cRi7-rF@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOo0cc07cRi7-rF@pengutronix.de>
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|GV2PR04MB11591:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b0c0c4-bbf3-423b-08b6-08de5ab671d6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?hQoJRBXwK4AoZ70c7GSohCUH3io6MkgqMpa5Oq+gYw0sFGcbnesDE8J9og5U?=
 =?us-ascii?Q?ykr2+8m5vW43gZ825Qakjle+JSpi4yMtc+1gqiXfvNXW7zwmpDRn87ck8Kxo?=
 =?us-ascii?Q?0/FhdwAjJk6SubIEanDQ9M9r2B2C/+MOuCka6nUa4JO3vOZ2p1isum1GpOT1?=
 =?us-ascii?Q?uD83L76qtoMlWgB7TJb/0MQgmxudU2RPKpboRf2wmK+TqZ7rVbC40pspxbTz?=
 =?us-ascii?Q?/c4+W1jc8xaoFA/YCpQ0uDmpzoLcEZjjf4YMW8q3eyuX1Y7fZjHxjFlYUUVi?=
 =?us-ascii?Q?BwyBIbdYPbCUtBFVIi+MvolrOZPIr65xW3BvHM/Wu8wZhOv6XgR2+Wv0JF24?=
 =?us-ascii?Q?BC06ukNtZEMJQfKuA6uTwGMEJrGuHgnSyICyz/mPEuncRSsNYDPqVTgFzWh2?=
 =?us-ascii?Q?ZQLToG6DpXMqAHFJ43KTnbzPiLVAPSelsA7h1e7aj+h7sdXdqNSn+oXllGUD?=
 =?us-ascii?Q?EBqTzfGMaDbZXQZ5f0vF1b2AuL9PpJVQkZcHIFMewqP8fRNGHzvREY9C+N/C?=
 =?us-ascii?Q?KsyXK8LsqOCU7oXhO/BSElxMxD8CFoA8vK50+pOJPfj1yo16pD6BYix1V5Tk?=
 =?us-ascii?Q?AI62PE5JL80B+1RfCtBw3iv/5Wt2iwhO8lELV81hNqqwzqddpn5MPkULKMgX?=
 =?us-ascii?Q?5XE/qfcA0CZbDtD3wTjIyyaqr3B4n4Xpxn8xRTfb5izGjSSFtQaXn5AxEXwx?=
 =?us-ascii?Q?oQZBTxLP6yR8sHFlzKzKAZPTBZm6YVyz6swc9DHKD2DViszS4PCAtwHXrJ/y?=
 =?us-ascii?Q?wDK6je2CgIozA7BZDev/hXfACgS2djGvIA7GESAc41aLhnyiQYlraCXTixJF?=
 =?us-ascii?Q?+saDMF4fvcOrJK/UQD8A5qSj7HBkAorUfjoGwTq9joldWy3tXC7O7zg3yoYO?=
 =?us-ascii?Q?EqSNV7czLoLs9PJHnh3t9n+m6qj+Sa7K4orquul3IrLhKPNdcQHT/vTsrabG?=
 =?us-ascii?Q?5MiqHd/lJG/XQokNXzrMvFVbUG+NFnUBINjbOgPrS/hjDB1mAm8d2A61JM4S?=
 =?us-ascii?Q?ya78Z81zRIO4zQs8CsC77wuRfH6FSUe3+YiK/O1GHHhfkTb8zvdBmP9CHhRj?=
 =?us-ascii?Q?Zr0YoQ5sjz1ZSrItCIbIkPUaBwg4op3Lt3GfkWKt+cEps2uKg4kWtzSavRwx?=
 =?us-ascii?Q?F4yA1yHiHV7DBbi1GVSKlfOtjsMsgVFr/P1P2e+xMi8wlRCfMFfnYJMXFFXb?=
 =?us-ascii?Q?RQqhkVNgWJBoDlm/0yO7pBj3DkpcaD7JT8sLrnNI1zDNNGT5GMlcTfZojBwM?=
 =?us-ascii?Q?G6EMmE63c+n2cREERWrHXUENSbPEn2L26/7jS1K0Z0ZVDmCGWlP62ApM/SNw?=
 =?us-ascii?Q?ujcOxwn1URcHLoo7IpTgh36avRDP0xuuYmmdtTDeW22N2H6sgHqV2lxJzR0Z?=
 =?us-ascii?Q?vKUxM8shITF35rStfX2fd4Ewu0TZODp6YE4/CK+Q1AfDetFNxztdHB0w+BG4?=
 =?us-ascii?Q?Sex82g+qNvdL2sgMOdkbWFfn2twEq5GhW5QZvOU00L8dPZPXlknKWTTwm2C8?=
 =?us-ascii?Q?k17+iST0H+1DV95BHJKH5mF3SfbHiNViMGhWZE2rnfYW2+/Af19lqFaEcbJe?=
 =?us-ascii?Q?uNja/1KMpbUW4uHeQMYJ5jgiITL+iicT6fp8AcfOzlG24Ro06L94tHZfKEOb?=
 =?us-ascii?Q?CZYI725bGTREq+vLx5iA0DId0+UT3TNsgPC83XAdB71c?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Mx8iH5We2LwMpuyTLZgCFLrziDSJDXZ40aiQkoQM0BqYPmcXR9Fa/V3z2qCo?=
 =?us-ascii?Q?EsrW4EYWN/99RLgjpte2MqMKYm8O76oHd70l+fGup++KUp2bTqsvMuVtLyAh?=
 =?us-ascii?Q?iqk7lO3ZBnM4SEp1ynYLlCi0xNLTQFy9ubPOfoeV6DlVhTygEzOhg6vWxaAr?=
 =?us-ascii?Q?s4iCEPSxEN7+gfiehDVMJ17hk4o8dLKh/F0rOq+oy0Gk2rpFt0A3bOwh312L?=
 =?us-ascii?Q?kyZW2QCycYKUs/YtbIa+vrhfkuEIfcvLMUx0hBZtkrfsm2DDKIU89f8S3bg7?=
 =?us-ascii?Q?YbdynFNIP4HaUVM9DfcvjpaYO2dwUqNOaWT5bpCn1xFEpbX+jtJFqbTd10n2?=
 =?us-ascii?Q?jT3m/6NkKVCb8BIY7Ctzm/Kg6kZdtPs/j1XoCwYrDSnG6ZJGTxzVAaGhXT0N?=
 =?us-ascii?Q?sWV0BOne+nV7y6JoBYauoTpNPl/VBYbCTmIrcJzQp/SJ+R+4y6he5FWlsuI6?=
 =?us-ascii?Q?UwDKMrVN92nPMsRm5lPLgjHuiHADHuvrH6lOI9b3niJ5NJuNKDzl/psRWsqT?=
 =?us-ascii?Q?osgf7990D5Sy2trd8q7AAoqbcfNW1gMba2GWg4kp1Sw4P7dwC1jyMOzkLezE?=
 =?us-ascii?Q?yDox3XKL7WGzglL1tmToAmc94YyUNdyBejDOPtRW4f/9x5fQkfbrj8skIUn1?=
 =?us-ascii?Q?NZmTwBkjwHEtNBKuohKHLxY2hm+Wo1aItl9TOxwB3cJ18kXppskFSE0KeMH/?=
 =?us-ascii?Q?g8qpW0UHG3BepeDTz5HboiTXP4ijKU5zrJB5yBYmKHXZApWCE8J1J2ZIJjGF?=
 =?us-ascii?Q?jJckLyUCfIbCgGpe0bBCliCxyKTBvO+7j68zLSK/Usq/8Hqro+pyaMMj1xL6?=
 =?us-ascii?Q?kZs3uwAOU8DvCRcxxnXzo5CC7oIZEfgalW+UMrf9/AetuX0Bnzl+uCdvGD6Q?=
 =?us-ascii?Q?c1feU47d/FISpWKVE7+hwo/UD6mqsF1cZh56VjF/IjNo31I9qGQLOSwBP+d3?=
 =?us-ascii?Q?xKnWGn5mSYfRXAc/JStVyBuMWgvRcnpXJFY87rqnMNZzaHxkrPlkoiWEQFBV?=
 =?us-ascii?Q?b+jWwRgGFQkLm/8MlH8HBJJN+6I3UWE+JBrX0Chs+jg2b3X60LSdAbbNs+22?=
 =?us-ascii?Q?W332LANUTaOZeJ+ncHBEpgCOTJNN91wm6D4C5Yhovai+gKvW4KTCh19DqIaB?=
 =?us-ascii?Q?S8cFSopTgiOlHD7R0EAUHgSyMDnRW37mxEv8Ju9z4RZNN7G48/1clPyt/x2S?=
 =?us-ascii?Q?ekpO3W2xXFkbYcZ48l+Mv5uf4P3CMVQhtWTEszk6aI5vCuU2VDCw/Ojn6v7d?=
 =?us-ascii?Q?J1DnKlptQfP4TVovz39xsYslr0wCVOAuOkzH7NNzjsuuD4DAH4o6meqQFNcM?=
 =?us-ascii?Q?8nkmhcYVFUFqdpfxFq4c0o4YeKw7/rL6UYe1wasO7B4YUhikfS7yWV2A7oZR?=
 =?us-ascii?Q?PB5zBGy1Z42k8YxQ6AmCHcEP7zBrD9CvY3UNToDlgKTVtvH7jBnTZpMXhPQJ?=
 =?us-ascii?Q?wVIAdAAkzPSzd6tngKsDTLcHRRQd8+SmjbLe6dVd5aTYky0+n0S9hMcA0WiS?=
 =?us-ascii?Q?vFk8sDhbIKvQlnfl43b9i9L3687myuRQA3fa40Td3fGhV73x4SzveWHlNRX9?=
 =?us-ascii?Q?u+DZSCFCADZUZY+s1i6Z1BpA1qiHpg/kCKB3Dv5WKMweFOGIMD1S0cK795iW?=
 =?us-ascii?Q?dubmSttxlMfbZGS7WyVjgtI7qHvPEVk+sEVyekOyg3Jaj8gF7mgvpLP4lsze?=
 =?us-ascii?Q?NQYFBZRBo5VAbH0B/yiUfu61ZTfSgC6qcN9d6fEgtD12YgUU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b0c0c4-bbf3-423b-08b6-08de5ab671d6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 19:34:38.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8msosFPWQRDiIBllgn772Uq+mZJR36hHv7LvtsXbtVxsiGkqGIjefkdXDfa52QkFxZBlrrOoUDvN8nHzWj6Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11591
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51441-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,kernel.org,cisco.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8EAC7A2E7
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:58:57PM +0100, Michael Tretter wrote:
> On Thu, 18 Dec 2025 10:09:07 +0100, Michael Tretter wrote:
> > On Fri, 07 Nov 2025 11:34:32 +0100, Michael Tretter wrote:
> > > If the IMX media pipeline is configured to receive multiple video
> > > inputs, the second input stream may be broken on start. This happens if
> > > the IMX CSI hardware has to be reconfigured for the second stream, while
> > > the first stream is already running.
> > >
> > > The IMX CSI driver configures the IMX CSI in the link_validate callback.
> > > The media pipeline is only validated on the first start. Thus, any later
> > > start of the media pipeline skips the validation and directly starts
> > > streaming. This may leave the hardware in an inconsistent state compared
> > > to the driver configuration. Moving the hardware configuration to the
> > > stream start to make sure that the hardware is configured correctly.
> > >
> > > Patch 1 removes the caching of the upstream mbus_config in
> > > csi_link_validate and explicitly request the mbus_config in csi_start,
> > > to get rid of this implicit dependency.
> > >
> > > Patch 2 actually moves the hardware register setting from
> > > csi_link_validate to csi_start to fix the skipped hardware
> > > reconfiguration.
> >
> > Gentle ping.
>
> Is there anything still missing to get these patches applied?

Add Laurent Pinchart.

Frank

>
> Michael
>
> > >
> > > Signed-off-by: Michael Tretter <michael.tretter@pengutronix.de>
> > > ---
> > > Changes in v2:
> > > - Document changed locking in commit message
> > > - Link to v1: https://lore.kernel.org/r/20251105-media-imx-fixes-v1-0-99e48b4f5cbc@pengutronix.de
> > >
> > > ---
> > > Michael Tretter (2):
> > >       media: staging: imx: request mbus_config in csi_start
> > >       media: staging: imx: configure src_mux in csi_start
> > >
> > >  drivers/staging/media/imx/imx-media-csi.c | 84 ++++++++++++++++++-------------
> > >  1 file changed, 48 insertions(+), 36 deletions(-)
> > > ---
> > > base-commit: 27afd6e066cfd80ddbe22a4a11b99174ac89cced
> > > change-id: 20251105-media-imx-fixes-acef77c7ba12

