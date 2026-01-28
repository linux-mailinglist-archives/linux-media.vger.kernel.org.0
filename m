Return-Path: <linux-media+bounces-51753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIDdJCZ2emmE6wEAu9opvQ
	(envelope-from <linux-media+bounces-51753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 21:48:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBAFA8CF6
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 21:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F83630080AC
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 20:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A0A237713;
	Wed, 28 Jan 2026 20:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S0DXJjYr"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22813376491;
	Wed, 28 Jan 2026 20:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769633308; cv=fail; b=cQ7P8/yYLkffoFUKMGhfLtety0jhJkJ7aoWJDZO0ybm+lKb7SrdWAs8sQ7YCDITPfl4D7jklS5DRZgfrDnDLN+osdObMqv4rs1FRAs60Kgr9tmGTw/CqC0QzBmJCd2QtfyXjqRP47+Zg0LJFKue2YefUb1+/KOjHJZgBUjvt6rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769633308; c=relaxed/simple;
	bh=jD40GN4XjWd6Hi8ezzeystKoSzfebY9HRPNivlLEfpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kMgUkLidOtpd9+GR5VbXS1WbuQS8JpbS6AwKe1/4XCPbGYIwv6R9nroLozoJ27rANfJrulLETlFybMpAvkKC4LlhryySE7ys4K7jNRvf7sZ4kuRr+pN9GXG8MFPNUj4GZQY5vkdcV8VzDu/gF/9xyPr1slOcIg815e0EqossbAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S0DXJjYr; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzzXxsnvqqiB6PFvCuKuH/EVo5wKqxG07yZmvZAduYcdmUqVGjLIwngvyCUWKsXqbAvy5jAzHFZXzqT+O2Tg89eFd8UJ1I7NOQOcvqy1TwPGzm4LZ6ob9UBXm9rRWuD16FEBNsHfVqkyJnj/VFR4dn5cAG1oEzfV1JZEHGwuGPM9QsEpV2p8v3wyaLdJl6lU1xUHcB+jJmrPjKi/4DHQtzdqQHajBdBICgNrwQqddaDKinEi/29h5g8QlaxE53NCMbXPCcbO6ZLJyQzmoAq3XtImZtuImIBsDDHPOS4TTXvml3d17/NNHUYF2Pc3unve686ZuV/gK3z654zKy0OOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o2UjNmkLouzNQAKF/2VvJmVq6pcaEAibnvqOK9vuE8=;
 b=d1g0zyWqKEqD2NaOjOx8fAOFOUYOHrxVbg1VDKzkEJBPJqE2ZVhGKch7gqhaieqsxf/T55CEk4dqzeAfKy++raWMhcEYqD/zEwZ9FDmJzIH2VStr4jm77M6ROu/I9no128n88mazVQI7B+SsIpT84ZN78o4/KE91agXzCvwKjGnFEpkQj2S5N4owcSLXljP3cW7MUNuuy+QJbxSLq3s0/kuDYSYp7ibgK1gqPCCQkv+YA40IdOQGe3NGwG+m85RCiYbgcO6S0owP/hKZWRDy1nb+HhQQAecyLj9ObKewetLrbtC/lv/gTcLqG55lx0BN2F5V484epf2c+7y2tiOSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o2UjNmkLouzNQAKF/2VvJmVq6pcaEAibnvqOK9vuE8=;
 b=S0DXJjYrKx9Ydj3kOsdUfE3sPgyxA6lFfy4VObDLyMDbG9LtHe0GkiIL4i4gbrrh/+PO3n7qAsCOuoPDIhop9cu/6PYiGJxYexIJWjZiQcVCVkzwAN884oPainWbWJ2sAOpaIl+JpmM8UNEpB8tCL2rvYcuHDQII84cEr1eUmSl553Z3zC3jx1M8Gyi1dcQeAslK9pVhMz3nUvID8Q6Fwm9oaROf5Dil0CZT6kXeqNKRD7NBt4LJW0PTSpOkcy748w7aPCSbTEUkgv6IAWcqOel+hMCd6D/OKYoVJyPQN4RvPsfRCpNgGa/2H7Z9A1135yFgq0Fz3VRAD8I8P2kGfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10797.eurprd04.prod.outlook.com (2603:10a6:150:20d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 20:48:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 20:48:16 +0000
Date: Wed, 28 Jan 2026 15:48:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx-jpeg: Add encoder V1 support for i.MX952
Message-ID: <aXp2CHEX+YCHogjW@lizhi-Precision-Tower-5810>
References: <20260127073702.1782-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127073702.1782-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:510:e::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1d6e75-e509-4ba5-5eb4-08de5eae8f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AWlwmwFERMXAdB4RT9byULVdOkC7de6kZfuu/5zUr7PTx5w6bzB56R5XbbhG?=
 =?us-ascii?Q?6MELGk7YZNNIcTNyZxb4PHqhbg1ZEtufzfZWfvrhO4VdFfz0/h1pzoRGj6Ic?=
 =?us-ascii?Q?cCWaG6fUh4rK0kpG5n1y6tMoHi/iRhU5dM23keXLrK/F9rHx9hx2lfL24Qqj?=
 =?us-ascii?Q?JKWym1ipDdKB0HRpLe152rCg9vHKMpSaqMOtYOryzaAb+1ZUnjdIc9J6mOpg?=
 =?us-ascii?Q?8sZxjUypiypPYo6zid6iI5ZIoDK0fa7YVr+dzbUJ3rXhd3/ZZ3unE4Jsdylc?=
 =?us-ascii?Q?UIx21HSLzZLazmk+B9tTzdxbld1GffNdA+9TxwGjVyBif5lS1BhdzwUEeGvT?=
 =?us-ascii?Q?mUW1j8u2YyHYL703JCqXttJf9H7jWi/m7MNvWhViVlnBjGee0QTmobVGI0sH?=
 =?us-ascii?Q?fIjEB//UkiQbqKNy6kHVqgSg1YadHPAFGNsgeaNflM2ZBigIxe58iGaNj5D7?=
 =?us-ascii?Q?ShTrOsZsMtDt/lnViVQKcTJqjrJBoWlGSnZa1k8qmeqogTzKLSdND2Yw49tQ?=
 =?us-ascii?Q?5Itet1rktO7rOORZQMzAcEKF0I2Zb4JcdbwK94iHYnB+SCG7csWKYHB0W1R1?=
 =?us-ascii?Q?cpjoEBDASe3aBmdAdxXYIMdIkmT0sk7kGBaRa+5tR1iPpjTzaw4ypwZypCmR?=
 =?us-ascii?Q?A7BKHk7FbfQR5mW7pd9458kKO147+/Z05+356MGTwMWujRE5fxOAru1NxmXh?=
 =?us-ascii?Q?sG1i2xhQpGEvaYj/UZsQoeK0RVliF2Tez39QCXW40ClBxQerjmB3LgZaBKmJ?=
 =?us-ascii?Q?dneV1QEc70oge/9Nr3KeMoJK0CPDHvAJBRmN5IgPPg7Riayrag4kez9FiRO6?=
 =?us-ascii?Q?hy+0PVqoM/qAED24R3gHG37TZxcwZazZ/Wn7dwBuQaLtTNgxb17Odbdhzaz2?=
 =?us-ascii?Q?pamTCox7p6SPErFlAV1SB5EJnMjREgrSHU6kJJMddK0kNlc2B98Rhp7eBOTo?=
 =?us-ascii?Q?s+Wk+2y+0j4LIeWrAUHB+Aec1Ri/Egmn3Ra6xY4fMXLopix//wEi2RF5SvEU?=
 =?us-ascii?Q?j1ygaChf0nkqrjs4sQ1w0mw58ZqT5gIO/HjKlxgu79bHSPMKUl9I9NH0rkJl?=
 =?us-ascii?Q?lrao6bHPb4mRO17x3fgJhA3v4epj75jfd8wIQJIoPf+v+nIyuUMK+3rn86Lf?=
 =?us-ascii?Q?4Apzw9WcxSFG0liD4GGhbIU2g4EPgQeMJvBoOafi3Ziiv2OVve5ba4DUTB5U?=
 =?us-ascii?Q?KfFzpxH0Kdv8EpUhTgF9qX80Jev/9CrsvUQnhG+n5WukUT51TGpnFpRqVWNJ?=
 =?us-ascii?Q?m6UPfPZqg7X4NOnAFZ4QFXUMPwMoNM8cIZ2h/RHPPSJDtyREXs3n0D1KIJaa?=
 =?us-ascii?Q?CRgjhwKdA8HprHaQTWugZ+37m2kZBe0BoeL5s+hFKrvxQudRVUDpDidpZJ1J?=
 =?us-ascii?Q?qYIWShEFScAJmhztI6Vlq9eNpnC4NzHDMwiBgwweOPROr9s5Wi/JEdZSYzO0?=
 =?us-ascii?Q?edjy30BHyvYYEU/tsCp1BeCN0DI4pZELrIQp6WrnM3hOx7TsMiWalMDb5X41?=
 =?us-ascii?Q?YOwTrY/bKHSUIS23qxmZbjcqrjQb7mTIoClBy62X/HwKVMiUVLEoshV/G76+?=
 =?us-ascii?Q?rQIE1Tp5tX9I4LCxUWN8HUNn2+GZ5dYQXJtiZysLpyswoJUqzNDwkP6tSxC3?=
 =?us-ascii?Q?pUpEjfVAwa0/8NL3sxcIN7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?suMxAPKcBnxZWXrfTnZ24zbOw4L7GCuURb0qbBVc1wCWHp669kGW3Tid8/Kp?=
 =?us-ascii?Q?1DFUPntqi06PFkpBxzcQ8amV1tDAlUOuRBLk4ISfl1lPT1QeyZDjdWXiE8XI?=
 =?us-ascii?Q?TAEb12o4rCaycyTT/2YsgAbjfjHuCJc2o5VUkMdoZnRkdKlKFpzic8A0u2E7?=
 =?us-ascii?Q?Pc7FKJEIgl6ju+65c3lvK3AhoG3qpx2H6Rufmkq4XfuPFwROcpAx1wGP0r9M?=
 =?us-ascii?Q?1pA0Jyn5gj/K1L3rvJvac/ll0+7dz88lMYPeSwPQ63cSIgHf/Siry3WVbTNH?=
 =?us-ascii?Q?yXmGglqpjCz1zc2GvycX0xi/SOekWR2sYSNKSQKD8zpbCXTFPbH+crhjrU9H?=
 =?us-ascii?Q?HQ/kIqtTeNVBjIgYGuY+yvbE1yJbozVy96H0we7jPaYehrwljgIg5cg+Jxmt?=
 =?us-ascii?Q?v29tERPJ7XMb2Z24OENTrTz+xiNyW71Gjr51BrZ+1gJEYy32JGBLeFxdZJt7?=
 =?us-ascii?Q?ruNqHMyeleY+/rjdOoiIMPVCNPtq/vNPbi1XwMCk9MrEfgh1Rz7UcH8hbf/w?=
 =?us-ascii?Q?179MAn6tsw41dibkw16I3ei7CDmgOQE9wnyz3aUJL3/HbgKbBDIZkcdh9Ait?=
 =?us-ascii?Q?QOoPbG5SHt6cOyidv2+mxosiP9lOeH8IJ4hsa5fRuPdLV6FKoJRaLwu2Fv2C?=
 =?us-ascii?Q?y22hKd+1GpdkCdb+Iku2YhdKodM8omHg4xPCwqoniJuZ0xYZYBe8VK6DinmB?=
 =?us-ascii?Q?Frycv8aPEqRStXfJXHnEFeYsBiFRK0fJ4Z3CMIz0uCc5OBB4YkpQZPEvayPe?=
 =?us-ascii?Q?d2gsSG0tZz5wwkt/6iok9d65UDSEns6FADpxy8CduPWm7BUDdpx7Ix066g8s?=
 =?us-ascii?Q?XgcqcqpbnJwYhQoRZVC3QCu/VURluyBQwH8sdtbfNcQQhZWYiCwKNWwIw30+?=
 =?us-ascii?Q?LdBi+WVl53pHubfJ9ipbDfmNPx0TG5AzBwLv3F6uRgXERcjTnGZleXoMsaJU?=
 =?us-ascii?Q?ieKlAAPk+ciYeAf21NtqimzS6LgOrZSwpnGYuD/E3XVqtq9/6d5M300dcSZE?=
 =?us-ascii?Q?095/eZRrrslQBQ3IL1zsdJsFubHjtfgLrVk8zqxS6buu/dZQ2evWDP1uQZ5t?=
 =?us-ascii?Q?L4na/uwdA3wGLZoVI75l1VAd7VpjYIAXUqcy+7LdI0ALm6Lun7XvIX6OLfOq?=
 =?us-ascii?Q?3fyevc4ku1AkK/SMfkK2YNncU0Jb7ufJygYSbkpWDvNMEg6kO1Nq2eVrTRBp?=
 =?us-ascii?Q?7HQxBINmPBLMRoYRp2lKpR1PPopQLk8pv8S+WlFMlq1Nskd8NGdXiTrULc5F?=
 =?us-ascii?Q?eru6DHO7eo4WjCMvXrCUP5mirTLt5CELQMDiqzIAwOt6V/SARoM77OLT/qh7?=
 =?us-ascii?Q?RoYdrLh+DbTxwpnqx2qyyt1TrpOlV075+MiyvMnQ5MAw1n343r1JWimHM36E?=
 =?us-ascii?Q?PJSnavFbEJZqD/lsydWXbVpLlzpRnlXpUbZB8YGsFF7ELdqOxEa+TtacTjtI?=
 =?us-ascii?Q?gQthOLs5CcS6mNc/NAT0QK67UnbNFNexY+tjam6d87E6J1QivgXuhb8LtQFe?=
 =?us-ascii?Q?Xz4Ixqf4eTGpC2sZmWEBL4iZRUDV79FD2DQuUuvZ1wvz+3UyGdZwpjvh6K8V?=
 =?us-ascii?Q?orbbGjbiD+nhJqrCv8WoKDQAKo+gXRcwgOmh5ekPvSKf2jnuQEcskIIeZoWL?=
 =?us-ascii?Q?DBVgC3AmisqE9Sd/8ViCfdcSrUMIZvQwVsr8mj67vnhMhSZPpLt1VOY1gCRC?=
 =?us-ascii?Q?zTh11DouW8ViOXi1THQ8pGRwWUMETHaYRmf9rT0cyM1g9VtpENMPgkAyc3hM?=
 =?us-ascii?Q?NCC3GhHJxA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1d6e75-e509-4ba5-5eb4-08de5eae8f7a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 20:48:16.0216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1DvvymwxLnLmkHvawEuVn6aEMDfDVj7KHKCkq44qDYRYSxjXhJPCWpp8+knz2JC6k+gWQWpR+mZhy0iE+/MOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10797
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-51753-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCBAFA8CF6
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 03:37:00PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> The i.MX952 SoC features an upgraded JPEG encoder (version 1) with
> enhanced descriptor-based configuration capabilities.
>
> The hardware version can be determined by reading the
> version register.
>
> The v1 encoder uses an expanded descriptor format that allows
> configuring all encoding parameters, including JPEG quality,
> directly in the descriptor. This eliminates the manual
> configuration phase required by v0 and reduces the interrupt
> count from two to one per frame.
>
> V0 encoding flow:
>   1. Write quality to registers -> trigger config interrupt
>   2. Start encoding -> trigger completion interrupt
>
> V1 encoding flow:
>   1. Configure descriptor with all parameters including quality
>   2. Start encoding -> trigger completion interrupt

AI polished commit message

jpeg: imx: add support for JPEG encoder v1 descriptor configuration

Support the upgraded JPEG encoder v1 found on i.MX952 SoC.

Detect the encoder hardware version via the version register.

The v1 encoder uses an expanded descriptor format that allows all encoding
parameters, including JPEG quality, to be configured directly in the
descriptor.

This removes the manual register-based configuration step required by v0
and reduces the interrupt count from two to one per frame.

>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c | 10 +-
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  4 +-
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 92 ++++++++++++++++---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 24 ++++-
>  4 files changed, 112 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
> index 9a6e8b332e12..97a6e1426ba2 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
> @@ -2,7 +2,7 @@
>  /*
>   * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
>   *
> - * Copyright 2018-2019 NXP
> + * Copyright 2018-2026 NXP
>   */
>
>  #include <linux/delay.h>
> @@ -189,3 +189,11 @@ void mxc_jpeg_clr_desc(void __iomem *reg, int slot)
>  {
>  	writel(0, reg + MXC_SLOT_OFFSET(slot, SLOT_NXT_DESCPT_PTR));
>  }
> +
> +int mxc_jpeg_get_version(void __iomem *reg)
> +{
> +	u32 regval;
> +
> +	regval = readl(reg + GLB_CTRL);
> +	return GLB_CTRL_CUR_VERSION(regval);
> +}
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index adb93e977be9..e9c7573f0fe4 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -2,7 +2,7 @@
>  /*
>   * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
>   *
> - * Copyright 2018-2019 NXP
> + * Copyright 2018-2026 NXP
>   */
>
>  #ifndef _MXC_JPEG_HW_H
> @@ -73,6 +73,7 @@
>  #define GLB_CTRL_DEC_GO					(0x1 << 2)
>  #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
>  #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
> +#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(0xF0000, r)

0xF0000 use GEN_MASK(16, 23)

>
>  /* COM_STAUS fields */
>  #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
> @@ -129,4 +130,5 @@ void mxc_jpeg_set_res(struct mxc_jpeg_desc *desc, u16 w, u16 h);
>  void mxc_jpeg_set_line_pitch(struct mxc_jpeg_desc *desc, u32 line_pitch);
>  void mxc_jpeg_set_desc(u32 desc, void __iomem *reg, int slot);
>  void mxc_jpeg_clr_desc(void __iomem *reg, int slot);
> +int mxc_jpeg_get_version(void __iomem *reg);

Only use at mxc_jpeg_runtime_resume(), it can be removed here and it can
be static in C file.

>  #endif
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index b558700d1d96..9624eea2450d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -37,7 +37,7 @@
>   *
>   * This is inspired by the drivers/media/platform/samsung/s5p-jpeg driver
>   *
> - * Copyright 2018-2019 NXP
> + * Copyright 2018-2026 NXP
>   */
>
>  #include <linux/kernel.h>
> @@ -64,6 +64,12 @@
>  #include "mxc-jpeg-hw.h"
>  #include "mxc-jpeg.h"
>
> +#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
> +	do {								\
> +		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
> +			(jpeg)->enc_cfg_ops->op(args);			\
> +	} while (0)
> +
>  static const struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "JPEG",
> @@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>
>  	if (jpeg->mode == MXC_JPEG_ENCODE &&
>  	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
> -		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> -		ctx->enc_state = MXC_JPEG_ENCODING;
> -		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> -		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
> -		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> +		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
>  		goto job_unlock;
>  	}
>  	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> @@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>
>  	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
>
> +	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
>  	/* setup the decoding descriptor */
>  	desc->next_descpt_ptr = 0; /* end of chain */
>  	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
> @@ -1335,9 +1338,15 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	struct mxc_jpeg_q_data *q_data;
>  	enum mxc_jpeg_image_format img_fmt;
>  	int w, h;
> +	bool extseq;
>
>  	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
> +	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
> +
> +	ctx->extseq = extseq;
>
> +	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
> +	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
>  	jpeg->slot_data.cfg_stream_size =
>  			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>  						  q_data->fmt->fourcc,
> @@ -1348,11 +1357,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>
>  	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
> -	cfg_desc->buf_base1 = 0;
> -	cfg_desc->line_pitch = 0;
> -	cfg_desc->stm_bufbase = 0; /* no output expected */
> -	cfg_desc->stm_bufsize = 0x0;
> -	cfg_desc->imgsize = 0;
>  	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
>  	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>
> @@ -1372,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
>  			 STM_CTRL_IMAGE_FORMAT(img_fmt);
>  	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
> -	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
> +	if (extseq)
>  		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
>  	else
>  		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
>  	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
> +
> +	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
> +
>  	dev_dbg(jpeg->dev, "cfg_desc:\n");
>  	print_descriptor_info(jpeg->dev, cfg_desc);
>  	dev_dbg(jpeg->dev, "enc desc:\n");
> @@ -1388,6 +1395,54 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
>  }
>
> +static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +
> +	ctx->enc_state = MXC_JPEG_ENC_CONF;
> +	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
> +}
> +
> +static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +
> +	ctx->enc_state = MXC_JPEG_ENCODING;
> +	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> +	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
> +	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
> +}
> +
> +static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
> +
> +	ctx->enc_state = MXC_JPEG_ENCODING;
> +	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
> +	cfg_desc->cfg_mode = 0x3ff;
> +
> +	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
> +	desc->cfg_mode = 0x3ff;
> +	desc->quality = ctx->jpeg_quality;
> +	desc->lumth = 0xffff;
> +	desc->chrth = 0xffff;
> +}
> +
> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
> +	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
> +	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
> +};
> +
> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
> +	.setup_desc = mxc_jpeg_enc_configure_desc
> +};
> +
>  static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>  {
>  	int i;
> @@ -1593,12 +1648,10 @@ static void mxc_jpeg_device_run(void *priv)
>
>  	if (jpeg->mode == MXC_JPEG_ENCODE) {
>  		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
> -		ctx->enc_state = MXC_JPEG_ENC_CONF;
>  		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
>  					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
>  		/* start config phase */
> -		mxc_jpeg_enc_mode_conf(dev, reg,
> -				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
> +		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
>  	} else {
>  		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
>  		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
> @@ -3006,6 +3059,15 @@ static int mxc_jpeg_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>
> +	if (jpeg->mode == MXC_JPEG_ENCODE) {
> +		if (!jpeg->enc_cfg_ops) {
> +			if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
> +				jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
> +			else
> +				jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;

This should only do once at probe.

> +		}
> +	}
> +
>  	return 0;
>  }
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 9c5b4f053ded..8e68dcde9613 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -2,7 +2,7 @@
>  /*
>   * i.MX8QXP/i.MX8QM JPEG encoder/decoder v4l2 driver
>   *
> - * Copyright 2018-2019 NXP
> + * Copyright 2018-2026 NXP
>   */
>
>  #include <media/v4l2-ctrls.h>
> @@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
>  	u32 stm_bufsize;
>  	u32 imgsize;
>  	u32 stm_ctrl;
> +	/* below parameters are valid for v1 */
> +	u32 mode;
> +	u32 cfg_mode;
> +	u32 quality;
> +	u32 rc_regs_sel;
> +	u32 lumth;
> +	u32 chrth;
> +	u32 nomfrsize_lo;
> +	u32 nomfrsize_hi;
> +	u32 ofbsize_lo;
> +	u32 ofbsize_hi;

Do you only use one desc each time? if desc is array based, it will impact
v0.

>  } __packed;
>
>  struct mxc_jpeg_q_data {
> @@ -105,6 +116,7 @@ struct mxc_jpeg_ctx {
>  	unsigned int			source_change;
>  	bool				need_initial_source_change_evt;
>  	bool				header_parsed;
> +	bool				extseq;
>  	struct v4l2_ctrl_handler	ctrl_handler;
>  	u8				jpeg_quality;
>  	struct delayed_work		task_timer;
> @@ -125,6 +137,15 @@ struct mxc_jpeg_slot_data {
>  	dma_addr_t cfg_dec_daddr;
>  };
>
> +struct mxc_jpeg_enc_ops {
> +	/* Manual configuration (v0 hardware) - two-phase process */
> +	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
> +	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
> +
> +	/* Descriptor-based configuration (v1 hardware) - single-phase */
> +	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);

You use callback, suppose callback name should be the same for v0 and v1.

for example:

	void (*setup_config)()
	void (*clean_config)()

v0	enter_config_mode() -> .setup_config
	exit_config_mode() -> .clean_config

v1
	setup_desc -> .setup_config
	NULL -> .clean_config.

Frank

> +};
> +
>  struct mxc_jpeg_dev {
>  	spinlock_t			hw_lock; /* hardware access lock */
>  	unsigned int			mode;
> @@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
>  	struct device			**pd_dev;
>  	struct device_link		**pd_link;
>  	struct gen_pool			*sram_pool;
> +	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
>  };
>
>  /**
>
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --
> 2.52.0
>

