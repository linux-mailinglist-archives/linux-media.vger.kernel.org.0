Return-Path: <linux-media+bounces-41800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6446B44E6B
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2B3A434F0
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE6E2D24B2;
	Fri,  5 Sep 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nZrwe+6I"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F962D46BB;
	Fri,  5 Sep 2025 06:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055402; cv=fail; b=dni3OYAJyi8iqScXUr2NsnsGcD6fcIJECkhR4T03WzoC9L5l5QWGScBq7m2Pq/LbumCHQ1d/h8d4rvCVprtKNtRnadMfRz7g5huvOQjvjYhvobusWMopfYe2hhPBU0YOYLa1RS/xFAucTcAbOKa2o/B4d4vNN9fery8H8YtAeHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055402; c=relaxed/simple;
	bh=Rg/lsuXrBh4spjhlBiqBU+80dA6wqmYH1aOrwmdBLKo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mKoYNmFhuzviizwXebGJo4BoeXETeEMevgElUGXAkbEDdJc+0jNeUszvi9z2H1qiITqpj+jeOHwYJt99sUypwxR9bIAv1ji9FoeP9LquTpZYQG2RqAlJSzV33bqrIpN0HYp3ZPaXJAt2wzmacd8j5IeTbBg7wNYjDNFviYA5/hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nZrwe+6I; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yoz/iXf3aCfwHgWaDk8SCOcN1W3ZB8ZHgyVHdiLx2XiAwLOFM0crfzqQ5mu3l11j/VSeuiUzv12x5ZS3HuYY07FF16AvGMiur2N7Asdyr7UVB93E83Mc31I8K/snEdLL/sKrpzJEmVyVlnLjRkvcLkiqFhZ9ljvt0RJ4mhVcE8BefusxUywEA8PJqGjdCqul2siXtC2KA8My26yN9r5V25uojMeXdr0EDWZhQ3T1epzYNeYxxOh8xunQF8GOirQ/3Fym5UK56LC+bTbVBdHfRlzThwv1Cg1K9+5APKUmDkxOZTuDL7g7C7gLcAHRVNg5zb+FjoPJXHJ44bYXGXa20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=775ijd9CL6iBRmBarNbZmog8EjdlmHWpx+R4d14y2sI=;
 b=lBcuBP8YzPo/H3DcVm3Q95d7YCYWOKl6kDbNdcSGxecETsa6B3o3O/Ek2FlM759SU3UxpatnzR/vhD2YzFNZcCwhwRNDqVwVn3ThMUR+RyGDlE9bKqPSwmLpV49C1HtTmiaABa8lsNNdN5SlB27hIzAe3Apww+OL9BFNMADJGol7wC8CXtkR4IMfdJKuA287/2ZFrYCb58FZ6ETRbDNfya5JQzXBq09zMXY3rJf/tBy4xOcM4wV6ZSrE4+eBF9exDHz+CXmSyVmBm2Tq9j69r1tJrHHUvO+YUcJlELnVhm4kZCmq7WhMrTAItBy8zkVHQLVzPtmzySndlKMdWGso6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=775ijd9CL6iBRmBarNbZmog8EjdlmHWpx+R4d14y2sI=;
 b=nZrwe+6IXiXvZMF8XH7FZmVRGfB72YLZsmrjiBkh8OC1jKXkApv6trTbLA6m745rlxP8zz+J8R3+8EAC5pb8GfcvJ2CNaGkD884Si8nQ2KKAvqWkRh+Axuqzqrtlhh4OJbfZylSoCnqE5glgYmtF9Dg9599d+Omvi0rVVbz9om3ooQ5cVNtiVkukLG/5Y9i2UT+aTOg/1w1b8hEDPUQolctLMuo4e5U7euv1tH2QBurD7imWJ518/7W83+oDA0FTqTVfdNBm9S9J3I3WnW6EQ04AxrN6fQ5SUHk4mJpB1/mBmmmd+lolZKvyv+vqijlFObxwsaE5JTbM26VRffUn2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:56:38 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:56:38 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 05 Sep 2025 14:56:01 +0800
Subject: [PATCH v2 4/5] media: nxp: imx8-isi: Reorder the platform data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-isi_imx93-v2-4-37db5f768c57@nxp.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
In-Reply-To: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757055383; l=2380;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Rg/lsuXrBh4spjhlBiqBU+80dA6wqmYH1aOrwmdBLKo=;
 b=Je3M8hf8DjCYXhMJeUFW4OAUpL40B8oiDk/3QzLG5QpI42z/Hc/SVZ3OMBDPr8EJCtpwevvDu
 mzVhoP8j11GC+lUZXlNjGi79Fq6Rv7B2O5z/EPj5WOVuMc5eivRHJX7
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: d715039e-eb0a-42fc-6338-08ddec495c0d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Sm4vTkk2LzFlek5nRVEwQm9vZGtKZGw0YzRoWFVlUVpVQVFweHl6b1Jpazg0?=
 =?utf-8?B?U3hReHB6MDBRY2p5VFJqWEM4QUZLOUNscWtobzEyS0NJTFBJcHpFbUM3dHVZ?=
 =?utf-8?B?MVA0aVFyV3NiOEs1SG5NNE1hbXFtbEpCWWM2QjYvYjd0TG96SVhDRFE0UTZB?=
 =?utf-8?B?N1o4YlRMUDgyRnJMK2VCam56MWFzTGhkdjlIUzNodU1yaU9ldGtQejluQVNr?=
 =?utf-8?B?V2ZoQ1p6Ymg2WmVGUUQ2QkQ0aGdaN3lwVVdDeVljdGlXTTNaeFFLcGhXL0FY?=
 =?utf-8?B?NEJ2VlB6WU9WYzZvZ2pGTEdDSnBkNnJqNmlKU1ExRlhzR2c3a2cwTFAvckFZ?=
 =?utf-8?B?UG1QUys4alB2U240SUNGKzFiR1d5azc4U1FieG94MFg1WkFuZmRnaUpUdjNl?=
 =?utf-8?B?aVRmZzZPc2F4UFFjMWNmbFVseXN4M1NHcWNKSGZhNkl6dWpCQ0xveUJ1UUFE?=
 =?utf-8?B?ZlRXS0lRRWljUXV0QndCdWtDenM1UXoyYzZSOWFpelNhcHBEblpMbkRldmMy?=
 =?utf-8?B?Y1Fkd0NnbW5EYVo3RUxzK2hwbkV0VTVCYVZKOGM3aWFlMUorVThZcVdjSnN0?=
 =?utf-8?B?TEl5ZlpwOXU1MnRFRVM5KzVGYXF6aXF3QTgwUGVEb2tkclNGQzJYc1d1cnEy?=
 =?utf-8?B?VlRUbytGQjB6MmlvSTlYRTVmSUV3OGlocllRb09Qd3dFNzRvSlhsRGljOGJi?=
 =?utf-8?B?RUlyeWFxTHEzRitZdjJ6UkxDOHJzNXBVakZTK1RsTFprVUM3WE9OeUh0eEJu?=
 =?utf-8?B?bDZPL3FDU0t6UWJDbHVjSE85SzJqL2hQK0c3cUJwZzVHcC93MU5sUXRwVGsr?=
 =?utf-8?B?dm0rQzhSWmIzWnFDUzBNT2s0Ym5nVEMrMUdYcGVqb0VSUEJpWlBEMVBHdmc5?=
 =?utf-8?B?eXV3bnF3UjBQNkhJbVZTeG9KNFpRczV3RTFMckFabEROV3lSeDBHbjI2dU1u?=
 =?utf-8?B?VUpoR0tFQjlGZUlNNHRGeDZyV2ZWdWRVU3gvdjNBd2JRQU1BRk1OV3pDV2JH?=
 =?utf-8?B?THdEdmZCeUxjTjVSUDB2MDE4eTV1Z1YzOEpFR1RzdGhGOHlodXMxTThSUkxM?=
 =?utf-8?B?VXAwT3I3cnQxUThNbFV0R2hhdFJjYzdiVEpQeGY5MW9xMndEMUtkMHA1NFl4?=
 =?utf-8?B?d2MvbFF4U3h0WlVCSk42WW5JVnNkYm5FaEg4eHcwUkxUM1BZVk1SbWtmR2tE?=
 =?utf-8?B?MUdjL0h5YlZ1RXliL29hNDhoWGhjOHhCT08wUVhKYnhhaFo2UUVzMldqN2lW?=
 =?utf-8?B?UTlmU3gxTlBhbjQ5QkZWVjFoNHFGN0xDKzB1T3NobVZ1b3BQZ3diU3FkQVZK?=
 =?utf-8?B?L1NyWFVISkhHQzBYUHAzVjE5TjNoK3ozb3pLNkdocVo2SFkra3pMMFpEcEFx?=
 =?utf-8?B?N1VKNTljdmIwbnB4a01YbG9IbFhSMnFjdXFDWDJyOHh5eHRSUTB2d205Y1Aw?=
 =?utf-8?B?YmlHdW1QdXh4SWhEOWhUV2U5bTk0dmNENzlHejF0U2w5aXdsckJWS3ZxbVpm?=
 =?utf-8?B?Sk9GTFR4OVp3U3ZqQ1BMSENHOVphbk9lQUFVemJJTGhkUW1LQXNYbzdYMGJy?=
 =?utf-8?B?aTdtTnZSZnhSeEUwTGpoZks2Z0RBUDhVWWFNeU9rRzloVTBXQXVhdCs4MTB4?=
 =?utf-8?B?SUUxR1dzdGM5L3FlYjJmZ010VTIrSnZzTXVFYlFFMWhTMTU2SkVqaG5NYmNl?=
 =?utf-8?B?b3ZIVnR1cUpJVEFUZHp2SDlKWjNNRkRaM1g2UGFqM0FiUTBhUUxBc0xLdkN0?=
 =?utf-8?B?UngxYkk5TnJ4bVN4M3MzZFl4WU41MDNSeGNySGY3Uitxd2h4TkEyUVlxY01n?=
 =?utf-8?B?SkR5UFRzbGNmOUJUTlRqVWtiWVJlb3B4dldzekRST3MzaEc3NkpKUTU4QVBk?=
 =?utf-8?B?S0lCSlFSNjFTVkFlK0hVWDVaSmdLTjVkZHlZWEtTTkdXVURSczdybVVpSmxz?=
 =?utf-8?B?WlIxQk45bDVlK25RbHZwbjlpMENVRjRrcnFCaktqSDVxWVFZV09nUktQbEJ4?=
 =?utf-8?Q?njxqX9gfD7QauEp/97tLZNR6RdOU8M=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a2dRTE9DSGlPek1MamJIdWZWbzBEelc2V2tlVEttTlo0bElJK2NydWhpSlNW?=
 =?utf-8?B?bXQ4NEFtUVhMM01EdU1zTWxsWDhxVmlZc29PNC9TUHYzKzF4T0RSbk1tZkwz?=
 =?utf-8?B?RDc4TUNjV3pWRFRwRnVPRFhOcTJkNFdXdmVVWHprVnk5VzdoRzE4dzcvbFZq?=
 =?utf-8?B?aUZTcUhuZE9hZmRXTE5EclJlTldMYlh3TGNSK3VpTHdlUHBEdDNEMDZxMUo1?=
 =?utf-8?B?WEk1MWN2T0xRNFBWTlF4djJKR0Q5bSsrZHBqd1N3UW04bnhkZkJFdWViTjk5?=
 =?utf-8?B?d0lmZFMwV2g0K3VpV3JmM2RIZlpQOFlOdkVOOERqMWU5ODVJaGhUVHNGenlk?=
 =?utf-8?B?Y1pFcElrK3daZ1hjS0FSTDArQzIyOTVQK0RzNGlVaE9XS3JseU1heWZKcmE0?=
 =?utf-8?B?cHdTWFFZdldmK2xaVzFxeGxySHZ2ZDRyTkpzblo4ZzBuMmp2d3dQVElRWXZk?=
 =?utf-8?B?YTR4akYralNGN0VSdkhlUDBiTmdRRllvYnNkbkVEOXNTQmZXekladENVZkRK?=
 =?utf-8?B?VStHVXErWGZUc1FnZE9admordDJTVnFZY3A5Z0R1eWpZeVhNVWcvVnlDb1Ix?=
 =?utf-8?B?UjUvVWRLRGJlalc5eUZacFRXSFhTSW5Kb1RlemdSRTZ1bklEMUpHMCs3WjVn?=
 =?utf-8?B?QmU2aUJ4RFhpZWVCSUhTVEw4RElFYktWeWFNZ3FvSXBDejFJUE91c1k4WW5P?=
 =?utf-8?B?TzAvdG9WckpSVzJ2WEdrNTBWRWo5RGUxZDNaRjFsSXpRN0YxQkprMnR4VGhy?=
 =?utf-8?B?OTNuc3FnS2lpWURaVjE5Y0tOYURQaVNtSG5ocGdPYjRZWmg2aWJ3NXlqaHlC?=
 =?utf-8?B?Q2pRcjZIelB1WEFhRmlFNElrMVdkSHFRNkQzNzh1VGo4dHBCWHdOR29uRDM1?=
 =?utf-8?B?VVVPbERxRGVGRUVXcjdiaEFsQzUrek1oSUFUK1Rua2czK3VuQ000YUNxMHgx?=
 =?utf-8?B?V2NxUWh2YTNlcHJvQ3JmSjVzdzFyb2J2a1lsYmwvZEE1QjZucFlsQVZiQnhQ?=
 =?utf-8?B?blN3SXltWmJSUHFjcmdiSkJHcDljaXFFYmNvYk9GZDQyODBTYzRjVU5tbU0w?=
 =?utf-8?B?b1pFR2NCaXhHc3pzejQxdHZTTTMwODM0cmF3akRYY21RbEFRQ0QxQXB3bktF?=
 =?utf-8?B?ZW5FNEJUTFdQUlp5bDRKNm5MZ3FvYXlwRE1TdWMyTUhTenc1SFdhS3pMd294?=
 =?utf-8?B?Y3cvYlFKOGVyRjg0WDZlWHpObFpRQUNKN3BKcjRlbnlGOTBzWEdjVkZVemtz?=
 =?utf-8?B?QmttT2RBV2FmeXBQcGErVk5WK1RJQ0Y4WHEzbTVqN1dlc2lqTFRuc0JXQm1C?=
 =?utf-8?B?bzVNeUFkaE5QZjFYb0trM21jZXpOYllFVDVBSWk0eVJacnBZTlZFeTZnVUxt?=
 =?utf-8?B?cGwwZ0xXd0pUNU45S0lXR3FyaktUdWZJRHhjQU9XekViam4rWmxCODh2a3dG?=
 =?utf-8?B?TCt1QjJxb1ByZlJCbTkyTmlSRWd6R255c2txTVNtdU1FQU92TXFuc3ExVTgw?=
 =?utf-8?B?L3VocWs1dTdrWVIvTnNoWWR3cXVaUFVtQnYzd3g5Y1FBL0VGc2RnWi82dHpq?=
 =?utf-8?B?azdZWUlMVVBnZ1A3bGo0NGM2cDZBa0FjRWhHcG95Tm5pbVdGbTlPUFBLdk9O?=
 =?utf-8?B?RGJNaGxFRGhZb04zeWgvTVlnYXlTVm5QcGdLb2RlZlVpa0w0TGhYT29va2h4?=
 =?utf-8?B?bkdSWUpZU21VYmdtT3hTdmUyRFVrUkJsbWZzL0R2TEVySGFwOCtYbHdaL2xp?=
 =?utf-8?B?THNzZy9meUc2aHZKR2c3V2hqUzVmQ1ZqN3paQWZLaktnYXNCd0s5UWRDR3Va?=
 =?utf-8?B?SHBkTmlUMktpZER0dGFmbkYzdnlwUCtic2ljeHBkOGZPUSt3K1VjNDhsNWFP?=
 =?utf-8?B?UmQrZnpsUDZJekJFbENFNTJnQ0V0NXNUaXpSRFNBcXpNRjVxd2tlTnA2TEJz?=
 =?utf-8?B?K1JBbzVaNi9pdmJHb2k5bVA0cjBVdG5IeE81ZmlINWFaVHNxcE5WZ2tzWXBX?=
 =?utf-8?B?SmRERldhTWJDZE11U0ZsZkwwZ05uV21xM3dPTDcxb2Y2dUJOUlh0TnFmTitZ?=
 =?utf-8?B?eVZ0b2xkZ21MVm5iZEVRSklsRTZ1ZzZYZ25lVjhyekVOSTlNZ0JPbVB6QzN0?=
 =?utf-8?Q?WlwkEcVu7E+BzqB7CACjwTCkS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d715039e-eb0a-42fc-6338-08ddec495c0d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:56:37.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlBHz0+/YwH7KYRYqRwZp+Q9SQeRxJn1K+mlxbmhFPqxhdmiQy29dB469Ufqjg2gsHl1Y2ZHBZ6JlSVcAJhIHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

Sort platform data in the order of compatible strings in of_match table
to make it more convenient to read.

No functions changed.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..0155c75983f02f33f7f0669e73188222ebb5e816 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,6 +314,28 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_qm,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 6,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.model			= MXC_ISI_IMX8ULP,
 	.num_ports		= 1,
@@ -337,28 +359,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
-static const struct mxc_isi_plat_data mxc_imx8qm_data = {
-	.model			= MXC_ISI_IMX8QM,
-	.num_ports		= 5,
-	.num_channels		= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_qm,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= false,
-};
-
-static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
-	.model			= MXC_ISI_IMX8QXP,
-	.num_ports		= 5,
-	.num_channels		= 6,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= false,
-};
-
 /* -----------------------------------------------------------------------------
  * Power management
  */

-- 
2.34.1


