Return-Path: <linux-media+bounces-53690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAnhHFh+oWkUtgQAu9opvQ
	(envelope-from <linux-media+bounces-53690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:22:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8431B679D
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2C37310C484
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C363EF0A2;
	Fri, 27 Feb 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HSA5rhIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6A36AB6E;
	Fri, 27 Feb 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191174; cv=fail; b=cMVPol8jZND99kjR40q08fAMG04Kx2AauyvoZetFQwoZY1OGxMeFMtriwtL1I/XmzI0doEzY8ihzngaPBxKynEr0fNWvk6cCMP8e58xW7OnPrQNK67F+hPvjuTAwKs5w/mGjbXYpuq1//vBkHSWx+J0Q47iaFanfwywNLmxctls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191174; c=relaxed/simple;
	bh=sGTDEbuD5+FsRk/UPMr+caZRmCvUhridDtSV7HDUKg4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bgGoQYawpaNdT2deg2y6Kgl+ebxW1ZXR8Oyl2uzse4g9CNFEd7mRFa/vSBQSRzxnNW8PKLIBX1SK2rE7BbPasZDX8jTG8RWOXxUoKEMLyQI5S7HjEMnkevdpt6J3I6AToGaejWKrVEEEhF4ND/XpzaHCj0dnjhcMc0WqSv5uTX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HSA5rhIZ; arc=fail smtp.client-ip=52.101.65.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTPb6yvzuTc6KcE65IbCSupMEfzfJfguKx6pUDlT9wiZTE3h31et6RHYkmwqx7hzjw+pBXlm6XfMqEnBz+/R1RR7Ld/9Pvua8YxxF83psd4IRKSv4PgWHl4lr18aI3g1rwgwz2Z/OHxE6KjiBMPuLquikUM5xdoxf7wjvGp3RMWyPpVVPBwJ2q30AYwy7z4UH1i9W9mQ2gqCPzzW1BEioXhJRPF660X7dS3W+C8BP7WdB9Cg8O2oK7dMogh+R3IT6FdheNqe2UZACIVzga3/9RXEHu3y7UvBrb/WqG0mLZsNegfjVvxYh8gKDDN2IYf37jxxNKssVOS/8KA7bQOS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEF0yux/kfbcKG3e0TUnMMoyU7mVygFYLUyKEFYF1o8=;
 b=hi6HIlZxQXlJmS/vZEhwztVyWsTzwuR6ItqAhRo1QHhh+ChOFbuK6qEJdqB//59t0m2D0oS67loGaVRO9tSVi3DhSi2mFu65oIJX9/4U6AviXVR0gURzLSfpaLzOITeR/uHia7ZSiO1VB2F8ouzP7Mmn9SLHRATui1jMjgfbLYH9eDv1fyLlEO6lAEMQTJd9xhKSzf+BxJogcirKg34PmgWWtg1p4vTmquCgLyRQtINyJbKMiYofl7MeP+yu95XF/a+360B3N+7TD+pDVcGniMEHh5HlbREX4qTkPJ15oMp5KnMP5nHIL+BUDldtNnecHf4Lz4nidhBxzdPzuxnISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEF0yux/kfbcKG3e0TUnMMoyU7mVygFYLUyKEFYF1o8=;
 b=HSA5rhIZqEYjQsLymkgGwa4IPlt4t8gWzkxj6+PketBKHeeIW4yzKrAwGA1t5oU8ZX94cWDTjessGoIx1XeqPWQ8e0cNcc8+vjq9vFPHbjGC3wNF0YVwYzUsQnMgspdJxGhGsI3xooRpX9EfTWbKDQkfCuGlRsGxDCjFP/1rh7dipiiSt6WaNnc4q3k2cQsCtpDWYzmUhj6BZdrvKc3fw3//N0xcQYk7vHCtS8KwWL9ToUIGK5+qESgVcPkMEtmoI1i09Iaf7fZ2Mx89pGTrLx3j2+WCALsjxtebJhQq2oizmUGsq2Igbi69rli9RBqVSbL8CAbkEChVpB7DGzZ1bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:19:27 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:19:27 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v4 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Date: Fri, 27 Feb 2026 19:21:09 +0800
Message-Id: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACV+oWkC/1XNTQ7CIBRG0a0YxmIeUKB15D6MA34tA9sGlNQ03
 bu0MRGH3wvnsqDkYnAJnQ8Lii6HFMahjOZ4QKZXw93hYMtGFCiHDgi2qYOX7jjDRLSCtoYzBYD
 K+yk6H+a9db2V3Yf0HON7T2eyXb8VAlUlEwxYyZYw77X1hFyGeTqZ8YG2Rqa1q3/PtDhgzknht
 NC8+3esdqJ2rDitpTaCN9wq+XPrun4Aq/KYAxABAAA=
X-Change-ID: 20250901-ds90ub953-168628c53a00
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772191287; l=1871;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=sGTDEbuD5+FsRk/UPMr+caZRmCvUhridDtSV7HDUKg4=;
 b=H83mjfZw1a0eTEGjAV2h+w2s8ksPTJGZbM78K0DZmgFdmEVVI01IDIA6R1jV4jpv5u0mR9KOg
 uUvRzErZlqABI8cuZ6c+i6fyKCyIVsFO8NCBT9gEcVhF4VCF+Xum/mE
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 0205a146-0100-4bab-0980-08de75f2118a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	kv2dUVff6FCvTU54xnPtVsUmCYCMixkAfkd6Dt0eZk6YcbBThpN/9alIy6ZZk4Qbfjik6VvtwtZRB0ViJ2/reO7UTuD/gnBlCFRNssiIMPz50GqgJGxUfgFTSEqvxw606KsuXlCIHT4zE031eLxrZMM3QKy4ueJbokeVVhrRFiz1YbmUw7tZrwJOHhHAdm+XJLhrcuxmwAS1H5ctqZW/NCO7uMjSTv36xLlCpCdIdRER+XNMZQ8Cx4o2t7SCeD2o2p7gOdZlReEhNbVLYLJJxDZI0xU3UnLn6hrYPWlwR6qjv1Qj9GtZHI9XacNf7vX7SL0hMxfDBqy+dRdmnYHJoWZ5e41aD2PyhL1c5iI67xNw8M5+m2D9MtQj/V33RmJZY16vhxMC5NRD4dtjlXwe+GbGJGKcbAy5CasXZnMpA8OhPlYdNEBrIFt2uVKPN7YyfTfREDq7KNteyWF6HR+gh4v+RxCl+lfFGY+eyxiI8vITRufJIj5EwHAMB6O3zXXUN2nodq2xvsMEEzNdzaJ9n6mzBM6j+E6jbEWihGv9IL2w0bLqxDSOy4krK20kxsif/c5gU1grHqoXQhLqup4k03n+5vQL8aBpV0tIwe9lhlDrEmgGBkuvLXQ5btrybIiQHDK5hLaUIsp/8IRUT4eCbu+0UmJO/iamZI2YhRRaksfo7dqre54NaPWpPidjqtsbgrRqo9uY4JN83WhOR79Q7qjR/bZXFj1RwaepyjC61abKW5tlPBo9h3owgA4NkFk5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWhUNEhKNGNCV256M2cxcUsrRnNiemsrSnNZb1U3KzdkWTRrRlozQ3VNcWRv?=
 =?utf-8?B?NzlzckszL2pVVzZld1JyT01SMXVkK1hUZ3YvYUd2d0cwT1BZRkhvaWJZL0pr?=
 =?utf-8?B?STh5WGxxMG9IM2UrcFhOOG92V1FqdnpGanF6dmFid25IazliOVg4TTQxNFBF?=
 =?utf-8?B?V0dIekxadlE5SER4cHU2YXgwZUtNaGpCdVliemxhNnZxRlZ5ZmM5TDRQZ2Nr?=
 =?utf-8?B?aUZ3eGFTVmhGelNndkoxcithZjRCVU1uSmIwSkxUaS9SdCtkd3ZJcUdPS2Ez?=
 =?utf-8?B?THFzUUZFSXorcHBpS3BYeEgySjIvYnAyQmN1bXMxMmt0L0pjbnJxRlE3L0NC?=
 =?utf-8?B?UndVSVlENmZsTUxTaXR5bzhMT055TlJ2N3JyQTBCTHByRkxrbllSME9pcnBo?=
 =?utf-8?B?M3pWSlA4TmhOVVI4UElpY2tRRnE3KzJTZTJXQUhtOXYrZGZIVEl4WTNHRng4?=
 =?utf-8?B?cWQ4ZVpUUVJnM0RRS1Buc1Q3bFVqdW1HZjdBd3FMMVNDSzFEQXlsaWQ2Rmh1?=
 =?utf-8?B?SjU5RjdlWTNzQ1FxU3ZMWk0zTXcxNmxuSVA2aXNDYy9BUUVybmJrWHdCRVhY?=
 =?utf-8?B?RDVsdEFUM01uQ3MzNXpBWTdsWGUrL3RrdVJFUTFVNFd2c0Q1bEJ2VHA2bFQ1?=
 =?utf-8?B?djF1Wm9mL3VTK0xwbWRMREpGSUlQL1RQOXl2b1hQNjJlMjAvdzZrOXgxczM3?=
 =?utf-8?B?TnplRVFoQ1VyQ1pWTmpta1hsVmNjeVRhSHM2dkhjZ1JNYjZpdGpSZTc3RkE0?=
 =?utf-8?B?Z1p1di9sbmxPZ25TUUVMcVRRbTVYRG1vQ0R0OERCMFBSM0NYT2lXb0NNQmhP?=
 =?utf-8?B?YlRWMjFaMGRuK3BCOHNlMmhGMGE3VnFjUnZHN0p1Y1ZpeHd2QzBNVWM3TDlF?=
 =?utf-8?B?N3pRQ0pkQ0Q0Znd2dDVrNmZkSkZWL0FVN0lyWkRNcTdpaUpGZGNpVDVpQlgw?=
 =?utf-8?B?ZExhN2pqaTdQWTVpdnptSTVFcEg0T2dLeXo3a3RjOGM5QlpQU3pJZGRuZ0li?=
 =?utf-8?B?WW15eFRDQmJ3dllzLzl4aE1YOGM1WmRPL0JzVER0UzUwalo1bHdhbE1hdU4r?=
 =?utf-8?B?TThuYVAzbjczaXA5S0hIMW5qUkdOYm5EQW84RW5pNE9CSjJWbTNtVExIbnRk?=
 =?utf-8?B?UDdaRExmV2xleWlmYTA3UGVEclVPc1R5Wm9nVUdyMEdwV1doY2l1dmlITXNo?=
 =?utf-8?B?K2d5VS8xT3ZtNEpYREZQcXFSbXJ4SFJxamdBZUtpdGIrUHZsUnFPMWROT1NG?=
 =?utf-8?B?eW16eVNXM2VMYjdqTWZHUEV0bmcxQnJuVVNocXg4RXFwTzAzdjRqQWI0bG1Z?=
 =?utf-8?B?OFQram93ZkVJaDRFUklUTmxCQTVDb2hpTEtwcm50dlZacnFkbkFqTHN4SVk1?=
 =?utf-8?B?RG5vVldXaXZMd1dLenZKQlM5dCt6Nmx3QnpHRFdFNXh1UjNrcGk0M2RjYnlk?=
 =?utf-8?B?b2VjUlBHZDNzbXNaWnp6aHpJTmhyYUUzVG40VEp0ZVJjQVB6akhQVklraFRP?=
 =?utf-8?B?KzM2Mnh6dmo4ZWJCMEpreS9OWTFHWHh3eFVjZGhjbzl4a29GZGxRNXJhSW5j?=
 =?utf-8?B?V1Q3SGQyMVNGb3FnTXpTT1JkY2dCMUliM0NQNHh6NjQvRVBKa0sxbnJwNEli?=
 =?utf-8?B?R0J4T1ptQ0hvK1hIWWpjMENZSGRFZmdVTyt4azl1NkljTEhQWEtkSWZxMlE2?=
 =?utf-8?B?eWlaOXNJWE1KSTgyc3h0OWlLRS9LSUlhTjZhQTJ4Z0hXU0cxQlIvSFZNOEZQ?=
 =?utf-8?B?RmJKZ3gvUUY3UEFwY0RkbnhCQUdZcW5ld2ptMGtVTjVNcEhtVWVyekh1SG9Q?=
 =?utf-8?B?RU5VVEdicHMwSGQvSUc3UHMwTThtMjVZdkxwOE54TVN5QzJzK1FUWG1JTXl6?=
 =?utf-8?B?dDU1QkhUVVF3bFhydXJVaG9lbmVGRW9CcUxjUmN0cy9zS2ZDckk2SDd3TGo0?=
 =?utf-8?B?UEFuVzlkcFJWNXpkWUR1MnF3bDN4SDZ6MjVUOWVET1lSNTZsNDVBTWh5RjJp?=
 =?utf-8?B?ZjJkemJjWjdFcXlBVmdJaXNTZTQxUUhxVFF5YjdTZXJSUkM1ZUN1M0RNVTRr?=
 =?utf-8?B?ZkUrTThMRmFhQlRWQldVWUR1YkZGcVRuVTY2a1I5RFI1elZjV0FxN2ZYSFFB?=
 =?utf-8?B?aC9yY1BZZmtoT3NuL25Majk0UGkxVEVGbmQ5WFZCV3QxUFBBUXB5YmtXbm4y?=
 =?utf-8?B?aFpFT3gwNVdCSVE1eWpHUXphR3g0K0Q2ckwxbUN4WXk4cGhZMzVLUEFBK2Nl?=
 =?utf-8?B?T0JocWJJVjF2VW1YTTk1UlB0R1NoOVd1Q2loWE5lRnk4UmtMWDBQQWxkV1A1?=
 =?utf-8?B?QjVzR25sZmlkMzlYODY5K2JQT1BLVnZBYnBMOTlxdURZU0VNWDVtQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0205a146-0100-4bab-0980-08de75f2118a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:19:27.3328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Gy5e8bipFbFhWK6suTAol9TCsm6Max9j8+GG3V/QFYUmn5G22hax4/13D73C1oeaHIqfxoyFyPzEMa0u9Mp0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53690-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
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
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: CC8431B679D
X-Rspamd-Action: no action

Add back channel GPIO support.
  dt-bindings: media: ti,ds90ub953: Add new range for remote GPIO data
  media: i2c: ds90ub953: Add back channel GPIO support

Use helper macro to simplify code.
  media: i2c: ds90ub953: use devm_mutex_init() to simplify code
  media: i2c: ds90ub953: use guard() to simplify code

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Rebase to 7.0-rc1
- Use folder block instead of literal block for #gpio-cell property description. 
- Only log GPIO 0-3 stats since remote GPIO 4-7 reuse GPIO 0-3 pins.
- Link to v3: https://lore.kernel.org/r/20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com

Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.
- Update driver to expand GPIO range.
- Link to v2: https://lore.kernel.org/r/20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com

Changes in v2:
- Remove new property ti,gpio-data added in patch 1.
- Add third cell for GPIO controller to select GPIO output source.
- Move PTR_ERR() in dev_err_probe();
- Link to v1: https://lore.kernel.org/r/20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com

---
Guoniu Zhou (4):
      dt-bindings: media: ti,ds90ub953: Add new range for remote GPIO data
      media: i2c: ds90ub953: Add back channel GPIO support
      media: i2c: ds90ub953: use devm_mutex_init() to simplify code
      media: i2c: ds90ub953: use guard() to simplify code

 .../bindings/media/i2c/ti,ds90ub953.yaml           |   8 +-
 drivers/media/i2c/ds90ub953.c                      | 109 ++++++++++++---------
 2 files changed, 66 insertions(+), 51 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250901-ds90ub953-168628c53a00

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


