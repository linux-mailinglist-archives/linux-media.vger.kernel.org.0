Return-Path: <linux-media+bounces-61076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMmeKfmlAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:48:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55E50B473
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BABD3100AB8
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0CA3BFE33;
	Mon, 11 May 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D6wbCAuK"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD93BE644;
	Mon, 11 May 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492484; cv=fail; b=UgkxSOMa/De+n3vecnPV9FLMrQPdJgKpQSQ8sg4ggIII7HPX7y8BSBb12vL1527b070/tP/uAbJ8HGRrauia+CwtxLHBdWG1rME+idsLeADdQYWI8qmnxzrZPiB3jV1AUSUU2IszbVHoEVd85+wvgca75sG4iAfTwYbbyYYn3HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492484; c=relaxed/simple;
	bh=dfCmNI4EA0kx8BPJqkW8Z66QCK5TQdCiEe7LtloMptU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=O6UJ24xUc/cZtk0iXmNFfrLq6Yj7QE/v/s6g74JMO1EuemqZZtK2JgClS0PlMpxTiytbjPDcdMhTCB7Yfis0cM2y97fGzw63vXXQfswFHxA110PpVHA6IJFUXWgspNewPvsRuMr1gcZzf30RdLWeffZi+IBkNV9+d6faLgft0Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D6wbCAuK; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJHeQMM4NE0p02UQTfbKmC1Z8A4SSQd/zuDsflfHCb86KEHjcmIR1vECcyeLkf9lBrMVprlHbJF2BbB0zRu2jVt7M26p1VL+1yn6Hjog1aAUW4klC2ROaHOlCH7TKJQBPwmpv4MVYYcgBB14iXDp99+zI/usmfQoCHkC2r7DlpxnEyfOz606F9nDEKajbbFTyBaHq/qRiZy3nimP68WnYyOQh/kh910AyEc95wouaeONyZvoKLETP9CNUECIzwlVvMMN9XSXIhiqEMpCQ6CIC9iAS0XcQxSTajXXOocZQqOvh47LjJLFg/Ae/hJjy5HiQN8+CH8VOqhl/E/qhCv9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80ipE9PKSkYyK5hr5uojM19L4XRE9XGEFcBgx9wno4Q=;
 b=Y1B9nQEgxeyEhvE2CDCiv/lCpcUYrZDWZcT0cNB3rbEmXCwzPxWcnJu/w51abIbyXIHXs7pEFR077L5gLdU1Ef7QLXBo4yQjlA6wVwo/agHZ2RrFPpc6An1LO73CBxXRfKQJZFhlNk5D6z8iLva6wS2DhE8hFio79a0kYKkvG1Ttv0Mv0HpB0AdvllKJqWFe79fNe6YoJf2vbG31r5Klub/l/1HSzZ6rxs3dE+9h4MbBv99B5rRTOjvPEDfITcJPIfQctB1ZALeL0009MacSPgoOOr36CYSXbShSW6RuC2012IpLosJuAZzBThvg+s08eCihupMq+4n/j468EFQG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80ipE9PKSkYyK5hr5uojM19L4XRE9XGEFcBgx9wno4Q=;
 b=D6wbCAuKM8v//WcREppzev1AbaM8KkMK52/TrTUzjpzKXISlnloQe9u2bjR0J5tBJ12HiV9JCwy6obSSKQSpBhxGcOGYUu/V0BarrZ/utTt48lxrlABIN7orRFlEzdgnZD6GgQLmsJBnO7kI0wH3n1TgCNH46EEsNTi8LBPnPrC31pEPEu6H2Bf72pWHY9RlaWPAv8c67gmypGVIUgK20kdDJB4rKT67+f/3bFRAK8oSiYAKEuJtbmlfk5pQ4eiWAPQ3dvBitMTM5JtZr/r9LqvG1Je0zewkuDHr2hHjqn67lExzyX2s9KhPECJZqBNz7RcvBFQIBPTY9MOYuVNygQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB10030.eurprd04.prod.outlook.com (2603:10a6:102:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 09:41:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:41:10 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 11 May 2026 17:43:42 +0800
Subject: [PATCH v6 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-csi_formatter-v6-2-01028e312e2b@oss.nxp.com>
References: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
In-Reply-To: <20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778492631; l=26829;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=s2OrUlRrKt5l2KTr8do1re+Ka6PPwWMk9X4K9uK1zAc=;
 b=+4L1HmLs251mJdSjSaeDukW7DbQGniwv4Q0m5RsvG6/RKr2myvcbAcmAHHxThTVb8WKkF+YeA
 hhfIkZOfxSgBwTk5w5PL/GSdeXQFcSCdYZE4XcxIsrC9HZ3XJtPYS9t
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB10030:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d007577-de1c-47a2-b7af-08deaf416f37
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|18002099003|3023799003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 ylKMDUBsxUMno6As39r08YNOYxWjgVPKzWS1nzGRgnh3j06OgvB/71amjH0SV7g6+3ZBB5YLnneYyaubiT5RXbZdFUAn5LTJg06v16PbLbZZpVCSEXegc/kV+lALCgJdFZRBIbH2CwoE3+v1FL/qYAhy/FEYgdeja4McmCzkQM4a4+euq6mKE7COc1W1W4FB9LF7wAr7K4oobDNQKzHtc/XaVSvPHe20Z+NcxArn258WJnM1RlpSJufLamjbO34UtyGHs7zHXYOvzALLf6kmopvxlN9WqfYRyAe3YsU7FRN5ZTXTJnMvvOrcuy/Wb2Khl4jEiODmiImMK6E4LpPBZtG6OfX4w+TalsaM5X4U2WOMx7AFAQa70gfhrqN4z1QZF4nZo1a6ZH+vzzZjfji3Qnbj9wBvTIXet5bPppfDL/jG/b2GSHRhzmOxMqhcVVsiCTF2U0ww8UTofcUIjaU0yFyt88elVBh4aLYAGbQ87xkFMqpR16PuFS7f2muUifgsTvmOTNU9K4Lvt9uufZFQ4rfUQCvOmvszQLWJcHU3cWOaDvk/kaaRLy65cXVg7L7qiZD+VTmvoNexwFYqFgiXhNkOQzUcGBBDeUjAgvnEzAreffg9AI/mL224mou/FezUCAhCSqCz3yj5F4tBX/KmfnNS99UePFvU2t6aIAaHl0FT6cnZkDMoaI7m9MoxJXlmzYNGm+27noOtGK/mkQ1yGQOSJ0ct6q7ulXPcrLb8uWlub4hIbJCxgFGO1UXifgtlhw7sJjvN6VUdPY3UltHhTw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(18002099003)(3023799003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bExYcHhjc3NNczVjU3VSM1JNb0VtaDkwRktSbGxnUUUxaXpYNXg2c0VoNHZ0?=
 =?utf-8?B?UEI3bUVUbnlYMHFlL2RBTytjV3hjL0IyNmlGa0J0bFQ4aG9JTTIxWjZaNTRS?=
 =?utf-8?B?Q0UvTTR0bnpHUFBmVDh0NEZPb0RHbkR2N2NUcU1jcXNnZVJRZGxPK0N0UFA3?=
 =?utf-8?B?eFNRTk9Ocm9DbXBMVGhIMUVWUndPdEdRZlQ0LzIraWZjREhEV0YyWllTcGYy?=
 =?utf-8?B?SVJzZE54eHdpZ1UwMlR0bVlRZmJDd3hXbVNSYUQxTFEwc2ZCQzYwOGN2SXdG?=
 =?utf-8?B?ck8yQm1MNEI0bFZSOXJoSUlia2x1ejJRblhRU1BWVHo2Y0QxYTFReWk0Ym9J?=
 =?utf-8?B?c1plRVNtRU9HSWtDT00vNi9HMUkyZG91dVROZWxGcWZ0TS85RTdqSGVpcStz?=
 =?utf-8?B?WGt3UndBcFo3VnJLZ2FMMk11MHZDZ0dPNnVieXYzU1hpaXJtT3dLa24vVHp1?=
 =?utf-8?B?OUUwVHNQSUo1RElYRVhCRnZWekVqK1pUcnd5SVcyVXNTRVhnUUtxTUNPUG9M?=
 =?utf-8?B?WUdiS1JDdkIraXc0RVI1ajZ0ZFRoejhYNDlFSnJtTGc4VUY1ZmhKWWdwSm54?=
 =?utf-8?B?aVovenl6VWVQczNCRlB1TlJ4Y1JRM201bTJKWWpneDRTYWIySE5YS3BpY29m?=
 =?utf-8?B?RkMwQTNyZ2NPQWdVSmtnZVMyL3FDUUg1enJ5VmhKODMyL1J5MU5xWEVRUGJD?=
 =?utf-8?B?c2xPNTJCckVicEFQNmNoWDFTbDBUWmE1cWNaL0xrL0kyN21pZFdlRm9CL05l?=
 =?utf-8?B?dnNHWHpzRHBKZkdGNzRCdW1PdWd3YkVUM2pRSXZJOEZhcVRVOTNxUFY0Q055?=
 =?utf-8?B?ckM2b1ZMd2N3dk55R3Zub3A5S0k3bytHRnhFWlJDQTdQMDFSaXF1YjFQV0p3?=
 =?utf-8?B?Q2o2aG43VjRUa2xORnlSbnUxbkJjenplWGM0Wi9jMUJTZjFJakEvN1hucm5m?=
 =?utf-8?B?NmVDa2J1MGtTMUUvWUJkL0ZlVjQrOXNqV0tpakUvUHl2MEFvMzd1Y2drUzAr?=
 =?utf-8?B?NFcxMVc2c01TNHBvMjlyc1ZLcjRwTGkzcHJUU0xpZG45Y3dXcmQ0U2dlSFVx?=
 =?utf-8?B?U2ZPLytIL0tra25RQmxqNjJ3OEpoOFpxbVVzaXhEZ1NkOTNFRmdUTTRscW5r?=
 =?utf-8?B?UHVVWDA0dlROMTFmL2I1YW9mNWpRb0xqQk1mc2MzS3ptYzV1M055V2V1eUdk?=
 =?utf-8?B?aGdGZUdXazgxTFF0Y3ZLWnpEcXBBcTM1RTV2OENtUnJkQ1FmaGdERkQxVmVR?=
 =?utf-8?B?bFVqVGRPQ3NUb212VWpsRmxZbEtRSEZ5cDlISXMreUxESSs3dkNCSzROaVZR?=
 =?utf-8?B?L3lxMFlqUjdlZDN6S1Buck1sdXZSTVBtZGRwRzFLb3lnZlhUNEdIbElJcnhC?=
 =?utf-8?B?aUo0eHRJdkgzaWxqSm1iNUluNE9IeEoxVU1DS3R1Qm00UVg5cFIyQ0YrK3pE?=
 =?utf-8?B?ZVl3bjdNSnVBSklvVDl3Y2JYK3BiYkRhN1hDNGhDdFNaRzNZVEhoWE1PYnZU?=
 =?utf-8?B?VU9UYjZDTUlNT2hMNzZuNFZOM1krTi9zK2srZDZxNGFhTGt2bCtJUVhiT00z?=
 =?utf-8?B?L3JPL3BBc1NQaVBRWk5pMktVS3RIVmNyc2RDRmFITUIzZUVLZDBvT0d5MmlU?=
 =?utf-8?B?NVl1YWRmUzJSeDVGeUFEaTQ4dXR2c3FMU3h1UEtraVRrbklIYVlDMU1NWXox?=
 =?utf-8?B?QVNMaXByZmkyQUtNcWoxWnFCYW1kc0R1TG9NbEVxRzFFVU1MVkQ3NWFnb0Nw?=
 =?utf-8?B?L2FCWEttUk1VZElTZGhHQzByc1Rpa0FnNllvMlZLWFZucE8vTVJWMzNNK3pZ?=
 =?utf-8?B?cko2TDdZNXVWbGdJNFcrSzkyeVc3eXltRlVTUkhOVUF5bnluRXQ5enpKNVNN?=
 =?utf-8?B?ajhNRStsNzJKVzZHVTlDaHJFbnQwRzJ0b0FjakE4dGkvZHk3dVR0SjFCcmFB?=
 =?utf-8?B?OXBaL0VBV0VuY0Q2K2NNd08zRnZ1QTVLbmE4aG5PYkR3Vjk5MndNTXB4SVYz?=
 =?utf-8?B?Y0w5N0FOcTYra0pid1BQUTFUbkoyR1pYM1ErWlNaOHNOb3RxMFpiNWdpK0tn?=
 =?utf-8?B?UjVSRHNzMFB0bWhnbzVNQ0VLcmQrZnhaT1Y3aGJONmNiV3JFUlA0c3FzaVlp?=
 =?utf-8?B?RnlIWXNnWVUzT3pxZ3p6SE4yZS9uZnBHVUt1VnN1R200UUE0RUZLMWgyeVEw?=
 =?utf-8?B?Sk42aGpRa3JLL041azEzZVBLclRrZk5zVUdSUGM1ZHB0YlNWK1RBMmxZQ1Fz?=
 =?utf-8?B?N293ck51clh4SHdGeWdNRDVGUFdPVnB6RHR6NmtBNENqT3ZyWS9WS2ttSTdK?=
 =?utf-8?B?NE01eU1OSWNWYWFLdHdqS3ZBUlVZNm1SUzd3bjFEVnN5VlN5cndYQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d007577-de1c-47a2-b7af-08deaf416f37
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:41:10.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFTVS8aFqJ+KkHKfjJ3magZIiwnSCyACqUaiefoUjkxSBD0Z08XQ+sAEYE0O8rtNsAz7bjxC8ZyirPaSRgjG0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10030
X-Rspamd-Queue-Id: 1C55E50B473
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61076-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,i.mx:url,oss.nxp.com:mid]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
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
 MAINTAINERS                                     |   8 +
 drivers/media/platform/nxp/Kconfig              |  14 +
 drivers/media/platform/nxp/Makefile             |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c | 776 ++++++++++++++++++++++++
 4 files changed, 799 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d53481d3f7..096361682b23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19265,6 +19265,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx9-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e2..952deb3b81c1 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX9_CSI_FORMATTER
+	tristate "NXP i.MX9 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX9 series SoCs. This module unpacks the pixels received from the
+	  CSI-2 interface and reformats them to meet pixel link requirements.
+
+	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb713652..39ba5660ba92 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
new file mode 100644
index 000000000000..aca04de8e0ed
--- /dev/null
+++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
@@ -0,0 +1,776 @@
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
+#define STREAM_FENCING_CTRL			0x34
+#define CSI_VC_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VC_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_STS			0x38
+#define STREAM_FENCING_STS_MASK			GENMASK(7, 0)
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
+struct formatter_pix_format {
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
+	const struct formatter_pix_format *fmt;
+
+	u32 remote_pad;
+	u32 reg_offset;
+
+	/* Protects enabled_streams */
+	struct mutex lock;
+	u64 enabled_streams;
+};
+
+struct dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+/*
+ * The index should correspond to the bit index define in register
+ * which enable the data type of pixel data transported by Formatter.
+ */
+static const struct dt_index formatter_dt_to_index_map[] = {
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
+static const struct formatter_pix_format formats[] = {
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
+static const struct formatter_pix_format *find_csi_format(u32 code)
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
+static int __formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_krouting *routing)
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
+static int formatter_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state)
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
+	return __formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_mbus_code_enum *code)
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
+static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_format *sdformat)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct formatter_pix_format const *format;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	format = find_csi_format(sdformat->format.code);
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
+	/* Store the CSIS format descriptor for active formats. */
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		formatter->fmt = format;
+
+	return 0;
+}
+
+static int formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					enum v4l2_subdev_format_whence which,
+					struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __formatter_subdev_set_routing(sd, state, routing);
+}
+
+static inline void formatter_write(struct csi_formatter *formatter,
+				   unsigned int reg, unsigned int value)
+{
+	u32 offset = formatter->reg_offset;
+
+	regmap_write(formatter->regs, reg + offset, value);
+}
+
+static u8 get_index_by_dt(u8 data_type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
+		const struct dt_index *entry = &formatter_dt_to_index_map[i];
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
+static int get_vc(struct csi_formatter *formatter, unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int vc;
+	int ret;
+
+	/*
+	 * Return virtual channel 0 as default value when remote subdev
+	 * don't implement .get_frame_desc subdev callback
+	 */
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &source_fd);
+	if (ret < 0)
+		return (ret == -ENOIOCTLCMD) ? 0 : ret;
+
+	for (i = 0; i < source_fd.num_entries; ++i) {
+		if (source_fd.entry[i].stream == stream) {
+			entry = &source_fd.entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"Can't find valid frame desc corresponding to stream %d\n", stream);
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
+				     u64 stream_mask)
+{
+	unsigned int i;
+	int ret;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (!(stream_mask & BIT(i)))
+			continue;
+
+		ret = get_vc(formatter, i);
+		if (WARN_ON(ret < 0)) {
+			dev_err(formatter->dev,
+				"Failed to get VC for stream %d: %d\n", i, ret);
+			continue;
+		}
+
+		vc = ret;
+
+		formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), 0);
+	}
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      u64 stream_mask)
+{
+	const struct formatter_pix_format *fmt = formatter->fmt;
+	u64 configured_streams = 0;
+	unsigned int i;
+	u32 val;
+	int ret;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (!(stream_mask & BIT(i)))
+			continue;
+
+		val = BIT(get_index_by_dt(fmt->data_type));
+
+		ret = get_vc(formatter, i);
+		if (ret < 0)
+			goto err_cleanup;
+
+		vc = ret;
+
+		formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
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
+static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
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
+	dev_dbg(dev, "Enable streams: pad=%u sink=0x%llx source=0x%llx\n",
+		formatter->remote_pad, sink_streams, streams_mask);
+
+	if (!formatter->csi_sd) {
+		dev_err(dev, "CSI controller not linked with formatter\n");
+		return -EPIPE;
+	}
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
+	ret = csi_formatter_start_stream(formatter, streams_mask);
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
+static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
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
+	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= formatter_subdev_set_fmt,
+	.get_frame_desc		= v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing		= formatter_subdev_set_routing,
+	.enable_streams		= formatter_subdev_enable_streams,
+	.disable_streams	= formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = formatter_subdev_init_state,
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
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
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
+notifier_to_formatter(struct v4l2_async_notifier *n)
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
+	struct csi_formatter *formatter = notifier_to_formatter(notifier);
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
+		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
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
+		return dev_err_probe(dev, ret, "formatter subdev init fail\n");
+
+	/* Initialize formatter pixel format */
+	formatter->fmt = &formats[0];
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0)
+		goto err_cleanup_subdev;
+
+	platform_set_drvdata(pdev, &formatter->sd);
+
+	/* Enable runtime PM. */
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_async_unregister;
+
+	return 0;
+
+err_async_unregister:
+	csi_formatter_async_unregister(formatter);
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
+	{ .compatible = "fsl,imx9-csi-formatter" },
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
+MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


