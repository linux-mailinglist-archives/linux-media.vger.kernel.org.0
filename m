Return-Path: <linux-media+bounces-62768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLPBLVZhFWoiUwcAu9opvQ
	(envelope-from <linux-media+bounces-62768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:01:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F32715D2E15
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 478973069EA1
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66D53CFF5D;
	Tue, 26 May 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PvSW/3XW"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81A3CF69B;
	Tue, 26 May 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785718; cv=fail; b=NjCPEVLp7GVDwRDt5sCa/J+/hoz2+RhVJ8+Z33ofmtKclBcEBrDcvx4JgJTGh2h7MQNxNB3hhoVcB3UqCt+a5oCiIyIpr6EXW1AU3wousoHYmIAPqcYl4wowysdC1zowwdeKrWUOdZvyHyinEcz3DOpfOWHnd1C9jKIdzkFG8Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785718; c=relaxed/simple;
	bh=Ar6vNN2c0xENZnipXzYWzwseXrBxuBy4/vdi3uEiRQo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Xjqy7joBx/gJjGEA8v1FxUjMB7LB9KGMTmvq50cO06jJiD/DVbHcIEvnqpjY8OZSZ0vbUEc7NPiXCyAxfAF3psbp4/pUE5MRJ5ZtVnymPxxaZl+1EQQtN7sLA3cmLPWzvlBkXifl70uLnAwrNJc3yR051lPij+LGsg2RceEwZIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PvSW/3XW; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZE/C+SaA8ebm6Dydi9WSDZQnJYmrmctAc48MOCOB2SbUhls5FW2+vQox2sutfH8N/8XsgdXrtvzdkFXmVRpG+w0iT38LYMP+/dR+PPTPXef6S/vW3w+yWAzUbqvHwdj73zv7r4i7uxS51SmAIohqd2auQh4TMwhSmO2l9Lbh/eZIUhnxAsD2klPzNNnO1jlvQoaXcK9pNDHEOftCGxVe8cQ3VIL36Xz32W2D94Gu96EsdDecun0Hf+Hxd6k7AwJbtJ9pMbQNkHGG1CHfUuRMd52kxpuIJJQVI0iKdGdPpsHsGLQ91BD8nVoFJy29tdLtHYorUSf+YKptIYlYq290w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mx0dNMeVljYeBtbQMyEdlQeMBUtxDM8SvYb9qD27jaM=;
 b=R9hKUy7fAFnYVYNNrWrcb32CGO5qTS4UwesKyhwvQ54z1nsprmYIItr+J8vsZNFhHGNWLYfbp65oShh70I0hVSJmWGPjwjy0Qp96Fa2YUMKnmJG9w4DpazCvbgNnAHrN70bgEq/550bpvB+vuvcw+d7ZPD++wgo/6gG7+oA4RvXFKAvGvB0/6doQM3yRlpkvAc0SR8Ky6Y+lBbRhti8pF5xGVNgbnLKZd14lvujvwmMSyl0sThN02JGmRcmeUb3BGv9ZIvYgoUsoT0wYufHh/haYGm/8ApcPcjL55zMcr8GkU5hGC8tL0w0LlTIBHkfH36L/X6tbXN3mZoVHkfieIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mx0dNMeVljYeBtbQMyEdlQeMBUtxDM8SvYb9qD27jaM=;
 b=PvSW/3XWvCRKMDIV2GPmKCwm4vt9QU6fHi5KzjsB3z+eYcA9oe9KzXJuVza8nKgLM9EVA1lnP5N84FjEXiAkaaiShN573fsjKnXGe5Rt2RsMrZfAZIGkRti5Mwb7LfFnmx8kuQjphd3BN4YBjH+ThKB5XyPtoBZ6e2pud/Ry6nMjn0KATF2GyGhfNQi1zMJU2nz9jR+G1lP4RVQcen45sP25Sw4Zx0RvOXZjvgyU7Q5dJjNxcc5Yz+fZuM/88xIEwnXFw78XAyw+w9U2StRtUnDwNLS25YuxYvBQftw5/J5XEpVLwIWv3B59v+FhT9OPv1bFKk0EXSm+EH35Edjp9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA2PR04MB10446.eurprd04.prod.outlook.com (2603:10a6:102:415::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 08:55:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 08:55:07 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 26 May 2026 16:57:22 +0800
Subject: [PATCH v9 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-csi_formatter-v9-3-ca3d8c334c39@oss.nxp.com>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
In-Reply-To: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779785861; l=27155;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=cGePtnuxst4ur1gkIooiO1qBT9G9m6zzgLNKpKdlNXw=;
 b=PGd4KYhnshLBHZgSyVQwMtUrpRw8qOMJDkihMal7JTcueIAGy8hh16/2Xiqbrhb2YDP0tuu5r
 N9Z/46BBRfGBt2V3Irf9xqlOtKYILOPQf0w6jHstbaBd+AkIk5awyE4
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA2PR04MB10446:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2c770b-52c1-4204-2fa2-08debb047c88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|11063799006|3023799007|6133799003|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 +3WmpzHmj/zyC0q3QWcrS6ayx+XC5awYp6nE3oDW17TEW87g7niWcwp7dO8udDRN5A81it7aua7Hpr2LJLawQcvdwl4ll7sveRWotP1/95ZqIVDpaC8zzL1tPRvbBdVvSIGzTPnLkN/5B56KgSArutDQJmYGEmyAgfTE6ioa5PzCpsIbDeVSGMCR0JvPlvV64IIbYRCe1VGZH6mg0NpgYlrO3gMI/6QYE/gtqrxQbkmMtSvXkp3F+NaWlPPRRXtgAnRdPCuh1uBjcbd/MKwLP4URyO70qOwMoA8F6x7q/6z1+rL/6UfJX2pftrH0zby0uLTviBvt1aEYq4hkEd7zbt5sY/YyhUfNW+ig+MJEOZHUyUK6fEF3C7nPtjYSyKemZzYaBaYrPGYKI8H0/oAZc664We/NPmcZFiG72O9vvJd+wDVWJiclagI4XyQjydzkyTTedke7qYe/lLAy63SJREllDuDk7G8ytS9Hn8xESOKnuMt203c5KooMj+n7SeJ0iXu09ASOHoz5QFjWI54WT56WftxpZS/cHY+HMdW8Jrgm6o0jRlM71JdjUj5dXL8NDiwSYM8vs3QmEWxq0zYXHQ9MYCwmUnNz4yPJua53bORUQ7ieQtsaiyxTo30aDcGclaS3Gwi5dPInU6Waqs+bKlnq0K2TcXK+W7ak7k8uvRxI+oz/zAr0yC2hQEaKqGDxo2i4jfb7SJ5BUYuxDczOwgaeJp/lZ0R/FhNgHuzhgxdqX1YsIWqv9ZfeIIUQW38pzb9cXyJjQmoaFN3Cq7WroA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZFBncjNERmJWT2F2eDVMNXJ5eDBDSHdzd1lRUG5RdVhLekZ6QUR5SnVtY3pG?=
 =?utf-8?B?MVhuZXExNEhDWXdRTC85bHY0WTlkVWg3SUQrWGtKUHRwWGdQS0hIallTZGNq?=
 =?utf-8?B?bWVGYjhkMGxicWgxYWk1TWNqdmExa2NlRm9MZXArNXFPWGhINHVTUFJLdXJN?=
 =?utf-8?B?bW5BSzZ3eEF5V08vMDJzQnd4U2xkcXJCeFd1TVpWL3JKZUwvUHhnRXBiQ0h4?=
 =?utf-8?B?N2R3V3NNWUFHdFFUNnRBWW92emdVZk9OVHkyb0VudkVLNHNHNzVYd1pWdnFB?=
 =?utf-8?B?WGVtVkEzTGRpOEFPSVIxRU9VRWdINUJEdlBNcmdLZjA0TlZhOU8zZ0NmYy9h?=
 =?utf-8?B?VDRONDZQdm1Qc1pPcFpZM0Y3bkdabWdaZHdZdzlwcjJyK3ZIMlBVdDZKemN4?=
 =?utf-8?B?bnNoK0ZMT1U3dHNnUDlBamZ0Mk9ZUGFHWlkvSzU3TDE3NGdWcEVWWUFobEFG?=
 =?utf-8?B?YWpkbVFCUUlKQkNRQ0pQYXZ5NjFGdXhGRVBUNUFKbU5wNEtpMTUwNlZpanVE?=
 =?utf-8?B?bDRkSCtPRUh5YlAyTitQQ0lkZDNTQXNPMkpmRGs1UW5aMkRWUCs3QVRYRk1W?=
 =?utf-8?B?Um80ZHlUWGRSOVNES2ZFT25CSWtPaUNZMjM0aURQcEFYL3ozTXJLaGRZdVF2?=
 =?utf-8?B?UkNwLzFtTmViMDhEZk5hK2RBVVJnSEJqYndjdEZ3aWlHcWJUWXZXUStxbmhX?=
 =?utf-8?B?YkU1WWlqVTNhWHJZQ2JJTFpTY0t4WGc2QVJiTVRjVzA3aXg5THk2Y09vM3Ra?=
 =?utf-8?B?RURIRklPOGlKdXdDa3NLQmZYOTZBb3hlUDY4cG5ONDRPT0pDc3ZGQ1Y4QmVT?=
 =?utf-8?B?RDlRQXNUTXN3UmVOV3BISUJpMTR3dHpWNTNBYzFSaHRPa1Mvc21NSjBMYkFV?=
 =?utf-8?B?NG5INVIwdmJrNWQyOHNVWjhXNDJtajRybkVnTWlnMTJzOHdKQUZrTGxPQTB2?=
 =?utf-8?B?YWQzUHI4UVZLdFVseG9IeXFZZGNWTm9rYm04eWlEaVhVN1luelk2RjJlb2p5?=
 =?utf-8?B?Wmp1Z3FJQ2k0dnhKdzBYODNIYm5NU1M2VDRTTDVlVjhIMTVUNGNXOS9hVFBi?=
 =?utf-8?B?UWNYQzdXSG1GNkplNkpLWlBwMmoxME1sTWUyblpYK1kyNWYzdmRqbE5OQnl5?=
 =?utf-8?B?WTdSRVBYWDREbnN1RnlUTUYrblBuMUpobUJtaW9aWllQdVJYVmRkRVlIbjMw?=
 =?utf-8?B?aVR3NDBWS2Q4aGI3MEp3UVFlbFlZT2I0ei9SRkt1MW1jYkF3NkJxeVBPSVQ2?=
 =?utf-8?B?NWExd2llOGRsUnZucXF3VlEyeXdyNmlDZXVPNFBKdlJmcGhXTWpUNmNWRWdn?=
 =?utf-8?B?N25FVzNiYzNSZlJ6R0NteUo0ZXM3bUtYR2tFeTRNbWJaV0pLVXdGU0UyQU5L?=
 =?utf-8?B?OXVNaDY4bklXdjBKSGNYeExOdndhVmpLWm40cmxSeU1jV2VyOTR5aWRWbXE2?=
 =?utf-8?B?Ykp5N0I1Q3NhWlNYaUtrdVJXMmpleVp2c2x5ZWNhUDcwM1FPMUI5czQvMVgz?=
 =?utf-8?B?WlBoWVd1YTduaGx0MnpEUEpwSXNmekkxOU9VakZXRjREQ25WN1NYRTFnTDB6?=
 =?utf-8?B?cGdvOW81ZjdrRGxpWGlkWjZrQVJiMFozV0JJSWpzTFNBcjFhTkowVnBUZmNh?=
 =?utf-8?B?U2tXSHFSYjE3MVluaWhjSUNFNlpRR0JvNXY3VVdYQ3N3bWMxQTdnS0htNHZI?=
 =?utf-8?B?YlFVdVBuYnhZTmExak8zb2hFTzduTEU5L29pd3ZSZ3dKQzkvVjdONHdzRFpu?=
 =?utf-8?B?MjQySEtyMm9wUUlOSFdRSDNlYjVlZVNtaHFha3Q1WUh0ZHBIUFBZUzlmcTZz?=
 =?utf-8?B?c0hPeGx3bGtBck9WdTlqOTIzRDlocEhXOUtRSTU1RldYMmpKeGxGaHVWM3JR?=
 =?utf-8?B?VnRrVGtOZDI4aW12Yy93RFhRaXppMnRXb2cvVUVZdmtRcTRjaVVlQXB0V0RT?=
 =?utf-8?B?eWRPaXI0dzZrQ2J4eGdaVHFycUNNelZXaENaNXdJK3RNQ1hOTFZVK0wzUlVL?=
 =?utf-8?B?a3J6bS9paFpKZzM0NTVucEpEdXNjbkFTUEZvTVM2NVZHbXN6ZTU0S2M0QW5u?=
 =?utf-8?B?d2E2ZUZVMFZ6SE9UQ3RTZ3cxY0JYT3Jmd0VlQnUwck5uVHcvZ2Y4NTR0L3BB?=
 =?utf-8?B?T3J3MGtpQ1RuVVJzaC8rM2J5VG1iREVNb3ZoTTFzYTZKL1RscG5OQURQMkpI?=
 =?utf-8?B?enlldVNFb3FFeStHaFdVSEZDR3JmQm5VbkZ1Y3Noa3BhU2Y0eE81a1dQUmg1?=
 =?utf-8?B?Sk01bUhYL1k1dFpkUEsrem9XcWhSdXpDdk9Kdk11Sm8wcVQ1RE5wakJ0K25E?=
 =?utf-8?B?anpDVXVrQ3U4NFFKODZTZGZEMXVROHZycXlyQnJINm95VGFNL09hZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2c770b-52c1-4204-2fa2-08debb047c88
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 08:55:07.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFHKUZaoOm4LrmEmwfRBMgqGsLuOgrCUVR08g7JelM19ALFFcfIf+FODVuLzkWSTpAsA9AIGBkpc1Aa9XyvkhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10446
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[nxp.com:server fail,sin.lore.kernel.org:server fail,oss.nxp.com:server fail,linux.dev:server fail,NXP1.onmicrosoft.com:server fail,i.mx:server fail];
	TAGGED_FROM(0.00)[bounces-62768-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[linux.dev:query timed out];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F32715D2E15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v8:
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Fix typo: Formater -> Formatter in Kconfig help text
- Improve grammar in data type index mapping comment

Changes in v7:
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration

Changes in v6:
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
---
 MAINTAINERS                                      |   8 +
 drivers/media/platform/nxp/Kconfig               |  14 +
 drivers/media/platform/nxp/Makefile              |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c | 758 +++++++++++++++++++++++
 4 files changed, 781 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3124500ff432..5229b75d930a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19269,6 +19269,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx95-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e2..1eccf128d149 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX95_CSI_FORMATTER
+	tristate "NXP i.MX95 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX95 series SoCs. This module unpacks the pixels received from the
+	  CSI-2 interface and reformats them to meet pixel link requirements.
+
+	  Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb713652..6410115d870e 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) += imx95-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
new file mode 100644
index 000000000000..9dee38d85839
--- /dev/null
+++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
@@ -0,0 +1,758 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI Pixel Formatter registers map */
+
+#define CSI_VC_INTERLACED_LINE_CNT(vc)		(0x00 + (vc) * 0x04)
+#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
+#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
+
+#define CSI_VC_INTERLACED_CTRL			0x20
+
+#define CSI_VC_INTERLACED_ERR			0x24
+#define CSI_VC_ERR_MASK				GENMASK(7, 0)
+#define CSI_VC_ERR(vc)				BIT((vc))
+
+#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
+#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
+
+#define CSI_RAW32_CTRL				0x30
+#define CSI_VC_RAW32_MODE(vc)			BIT((vc))
+#define CSI_VC_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
+
+#define CSI_STREAM_FENCING_CTRL			0x34
+#define CSI_VC_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VC_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define CSI_STREAM_FENCING_STS			0x38
+#define CSI_STREAM_FENCING_STS_MASK		GENMASK(7, 0)
+
+#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
+#define NEW_VC(vc)				FIELD_PREP(GENMASK(3, 1), vc)
+#define REROUTE_VC_ENABLE			BIT(0)
+
+#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
+
+#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
+
+#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
+
+#define CSI_FORMATTER_PAD_SINK			0
+#define CSI_FORMATTER_PAD_SOURCE		1
+#define CSI_FORMATTER_PAD_NUM			2
+
+#define CSI_FORMATTER_VC_NUM			8 /* Number of virtual channels */
+
+struct csi_formatter_pix_format {
+	u32 code;
+	u32 data_type;
+};
+
+struct csi_formatter {
+	struct device *dev;
+	struct regmap *regs;
+	struct clk *clk;
+
+	struct v4l2_subdev sd;
+	struct v4l2_subdev *csi_sd;
+	struct v4l2_async_notifier notifier;
+	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
+
+	u32 remote_pad;
+	u32 reg_offset;
+
+	/* Protects enabled_streams */
+	struct mutex lock;
+	u64 enabled_streams;
+};
+
+struct csi_formatter_dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+/*
+ * The index corresponds to the bit index in the register that enables
+ * the data type of pixel data transported by the Formatter.
+ */
+static const struct csi_formatter_dt_index formatter_dt_to_index_map[] = {
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
+	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
+	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
+	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
+	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
+	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
+	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
+	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
+	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
+	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
+	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
+	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
+	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
+	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
+};
+
+static const struct csi_formatter_pix_format formats[] = {
+	/* YUV formats */
+	{ MEDIA_BUS_FMT_UYVY8_1X16,	MIPI_CSI2_DT_YUV422_8B },
+	/* RGB formats */
+	{ MEDIA_BUS_FMT_RGB565_1X16,	MIPI_CSI2_DT_RGB565 },
+	{ MEDIA_BUS_FMT_RGB888_1X24,	MIPI_CSI2_DT_RGB888 },
+	/* RAW (Bayer and greyscale) formats */
+	{ MEDIA_BUS_FMT_SBGGR8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8,	MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_Y8_1X8,		MIPI_CSI2_DT_RAW8 },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_Y10_1X10,	MIPI_CSI2_DT_RAW10 },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_Y12_1X12,	MIPI_CSI2_DT_RAW12 },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14,	MIPI_CSI2_DT_RAW14 },
+	{ MEDIA_BUS_FMT_SBGGR16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SGBRG16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SGRBG16_1X16,	MIPI_CSI2_DT_RAW16 },
+	{ MEDIA_BUS_FMT_SRGGB16_1X16,	MIPI_CSI2_DT_RAW16 },
+};
+
+static const struct v4l2_mbus_framefmt formatter_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920U,
+	.height = 1080U,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct csi_formatter_pix_format *csi_formatter_find_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	return NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_formatter, sd);
+}
+
+static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					      struct v4l2_subdev_state *state,
+					      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&formatter_default_fmt);
+}
+
+static int csi_formatter_subdev_init_state(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI_FORMATTER_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI_FORMATTER_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __csi_formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					       struct v4l2_subdev_state *sd_state,
+					       struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
+						   code->stream);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	code->code = formats[code->index].code;
+
+	return 0;
+}
+
+static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *sd_state,
+					struct v4l2_subdev_format *sdformat)
+{
+	struct csi_formatter_pix_format const *format;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	format = csi_formatter_find_format(sdformat->format.code);
+	if (!format)
+		format = &formats[0];
+
+	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
+			      &sdformat->format.height, 1, 0xffff, 0, 0);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
+					   sdformat->stream);
+	*fmt = sdformat->format;
+
+	/* Set default code if user set an invalid value */
+	fmt->code = format->code;
+
+	/* Propagate the format from sink stream to source stream */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
+							   sdformat->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = sdformat->format;
+
+	return 0;
+}
+
+static int csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    enum v4l2_subdev_format_whence which,
+					    struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __csi_formatter_subdev_set_routing(sd, state, routing);
+}
+
+static inline void csi_formatter_write(struct csi_formatter *formatter,
+				       unsigned int reg, unsigned int value)
+{
+	u32 offset = formatter->reg_offset;
+
+	regmap_write(formatter->regs, reg + offset, value);
+}
+
+static u8 csi_formatter_get_index_by_dt(u8 data_type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
+		const struct csi_formatter_dt_index *entry =
+			&formatter_dt_to_index_map[i];
+
+		if (data_type == entry->dtype)
+			return entry->index;
+	}
+
+	pr_warn_once("Unsupported data type 0x%x, using default\n", data_type);
+
+	return formatter_dt_to_index_map[0].index;
+}
+
+static int csi_formatter_get_vc(struct csi_formatter *formatter,
+				struct v4l2_mbus_frame_desc *fd,
+				unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int vc;
+
+	for (i = 0; i < fd->num_entries; ++i) {
+		if (fd->entry[i].stream == stream) {
+			entry = &fd->entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"No frame desc entry for stream %u\n", stream);
+		return -EPIPE;
+	}
+
+	vc = entry->bus.csi2.vc;
+
+	if (vc < 0 || vc >= CSI_FORMATTER_VC_NUM) {
+		dev_err(formatter->dev, "Invalid virtual channel %d\n", vc);
+		return -EINVAL;
+	}
+
+	return vc;
+}
+
+static void csi_formatter_stop_stream(struct csi_formatter *formatter,
+				      u64 stream_mask)
+{
+	unsigned int i;
+
+	for (i = 0; i < CSI_FORMATTER_VC_NUM; ++i) {
+		if (!(stream_mask & BIT(i)))
+			continue;
+
+		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(i), 0);
+	}
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      struct v4l2_subdev_state *state,
+				      u64 stream_mask)
+{
+	const struct csi_formatter_pix_format *pix_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_mbus_frame_desc fd = {};
+	u64 configured_streams = 0;
+	unsigned int i;
+	u32 val;
+	int vc;
+	int ret;
+
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < CSI_FORMATTER_VC_NUM; ++i) {
+		if (!(stream_mask & BIT(i)))
+			continue;
+
+		fmt = v4l2_subdev_state_get_format(state,
+						   CSI_FORMATTER_PAD_SINK, i);
+
+		pix_fmt = csi_formatter_find_format(fmt->code);
+
+		val = BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
+
+		if (ret == -ENOIOCTLCMD) {
+			/*
+			 * Source doesn't implement get_frame_desc, use
+			 * default VC 0
+			 */
+			vc = 0;
+		} else {
+			vc = csi_formatter_get_vc(formatter, &fd, i);
+			if (vc < 0) {
+				ret = vc;
+				goto err_cleanup;
+			}
+		}
+
+		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
+		configured_streams |= BIT(i);
+	}
+
+	return 0;
+
+err_cleanup:
+	csi_formatter_stop_stream(formatter, configured_streams);
+	return ret;
+}
+
+static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					       struct v4l2_subdev_state *state,
+					       u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct device *dev = formatter->dev;
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	guard(mutex)(&formatter->lock);
+
+	if (!formatter->enabled_streams) {
+		ret = pm_runtime_resume_and_get(formatter->dev);
+		if (ret < 0) {
+			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = csi_formatter_start_stream(formatter, state, streams_mask);
+	if (ret)
+		goto err_runtime_put;
+
+	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
+					 formatter->remote_pad,
+					 sink_streams);
+	if (ret)
+		goto err_stop_stream;
+
+	formatter->enabled_streams |= streams_mask;
+
+	return 0;
+
+err_stop_stream:
+	csi_formatter_stop_stream(formatter, streams_mask);
+err_runtime_put:
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+	return ret;
+}
+
+static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+						struct v4l2_subdev_state *state,
+						u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	guard(mutex)(&formatter->lock);
+
+	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
+					  sink_streams);
+	if (ret)
+		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
+
+	csi_formatter_stop_stream(formatter, streams_mask);
+
+	formatter->enabled_streams &= ~streams_mask;
+
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
+	.enum_mbus_code		= csi_formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi_formatter_subdev_set_fmt,
+	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing		= csi_formatter_subdev_set_routing,
+	.enable_streams		= csi_formatter_subdev_enable_streams,
+	.disable_streams	= csi_formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = csi_formatter_subdev_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static const struct media_entity_operations formatter_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int csi_formatter_subdev_init(struct csi_formatter *formatter)
+{
+	struct v4l2_subdev *sd = &formatter->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &formatter_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
+	sd->internal_ops = &formatter_internal_ops;
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS |
+		     V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &formatter_entity_ops;
+	sd->dev = formatter->dev;
+
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK
+						      | MEDIA_PAD_FL_MUST_CONNECT;
+	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
+				     formatter->pads);
+	if (ret) {
+		dev_err(formatter->dev, "Failed to init pads\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static inline struct csi_formatter *
+notifier_to_csi_formatter(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_formatter, notifier);
+}
+
+static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asc)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct csi_formatter *formatter = notifier_to_csi_formatter(notifier);
+	struct v4l2_subdev *sdev = &formatter->sd;
+	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
+	struct media_pad *remote_pad;
+	int ret;
+
+	formatter->csi_sd = sd;
+
+	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
+	if (ret < 0)
+		return ret;
+
+	remote_pad = media_pad_remote_pad_first(sink);
+	if (!remote_pad) {
+		dev_err(formatter->dev, "Pipe not setup correctly\n");
+		return -EPIPE;
+	}
+	formatter->remote_pad = remote_pad->index;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations formatter_notify_ops = {
+	.bound = csi_formatter_notify_bound,
+};
+
+static int csi_formatter_async_register(struct csi_formatter *formatter)
+{
+	struct device *dev = formatter->dev;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
+
+	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto err_cleanup_notifier;
+	}
+
+	formatter->notifier.ops = &formatter_notify_ops;
+
+	ret = v4l2_async_nf_register(&formatter->notifier);
+	if (ret)
+		goto err_cleanup_notifier;
+
+	ret = v4l2_async_register_subdev(&formatter->sd);
+	if (ret)
+		goto err_unregister_notifier;
+
+	return 0;
+
+err_unregister_notifier:
+	v4l2_async_nf_unregister(&formatter->notifier);
+err_cleanup_notifier:
+	v4l2_async_nf_cleanup(&formatter->notifier);
+	return ret;
+}
+
+static void csi_formatter_async_unregister(struct csi_formatter *formatter)
+{
+	v4l2_async_unregister_subdev(&formatter->sd);
+	v4l2_async_nf_unregister(&formatter->notifier);
+	v4l2_async_nf_cleanup(&formatter->notifier);
+}
+
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int csi_formatter_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	clk_disable_unprepare(formatter->clk);
+
+	return 0;
+}
+
+static int csi_formatter_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	return clk_prepare_enable(formatter->clk);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
+				 csi_formatter_runtime_suspend,
+				 csi_formatter_runtime_resume, NULL);
+
+static int csi_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi_formatter *formatter;
+	u32 val;
+	int ret;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->dev = dev;
+
+	ret = devm_mutex_init(dev, &formatter->lock);
+	if (ret)
+		return ret;
+
+	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(formatter->regs))
+		return dev_err_probe(dev, PTR_ERR(formatter->regs),
+				     "Failed to get csi formatter regmap\n");
+
+	ret = of_property_read_u32(dev->of_node, "reg", &val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to get csi formatter reg property\n");
+
+	formatter->reg_offset = val;
+
+	formatter->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(formatter->clk))
+		return dev_err_probe(dev, PTR_ERR(formatter->clk),
+				     "Failed to get pixel clock\n");
+
+	ret = csi_formatter_subdev_init(formatter);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to initialize formatter subdev\n");
+
+	platform_set_drvdata(pdev, &formatter->sd);
+
+	/* Enable runtime PM. */
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_cleanup_subdev;
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
+		goto err_cleanup_subdev;
+	}
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(&formatter->sd);
+	media_entity_cleanup(&formatter->sd.entity);
+	return ret;
+}
+
+static void csi_formatter_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	csi_formatter_async_unregister(formatter);
+
+	v4l2_subdev_cleanup(&formatter->sd);
+	media_entity_cleanup(&formatter->sd.entity);
+}
+
+static const struct of_device_id csi_formatter_of_match[] = {
+	{ .compatible = "fsl,imx95-csi-formatter" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
+
+static struct platform_driver csi_formatter_device_driver = {
+	.driver = {
+		.name           = "csi-pixel-formatter",
+		.of_match_table = csi_formatter_of_match,
+		.pm             = pm_ptr(&csi_formatter_pm_ops),
+	},
+	.probe  = csi_formatter_probe,
+	.remove = csi_formatter_remove,
+};
+
+module_platform_driver(csi_formatter_device_driver);
+
+MODULE_AUTHOR("NXP Semiconductor, Inc.");
+MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


