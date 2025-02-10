Return-Path: <linux-media+bounces-25959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04746A2FB32
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38E2C165769
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156FE24E4A3;
	Mon, 10 Feb 2025 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fXu+VR62"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8A124CEE2;
	Mon, 10 Feb 2025 20:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221202; cv=fail; b=tNWHTD4VAb4vOV94tXewGhWvcoUR1LxIkYyAjK0lMrvVqC7S16VEnJOm3MkvwBdcw1mt24L+UhxiRiDxnADrpCFjCYFklY7rnCltlTuxwbbPlqXlKT9zZ7vWbR2lLZUE/KT8Mg3a8IwOe3Mt4k1gPJpPsEj9fkSNDdOeqKlgxHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221202; c=relaxed/simple;
	bh=PPjam9Mn3rObWQsmhxiyi/pAvTD6/2dsCVVP0bFqAE0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NJq1G+9vobsGo6BrcT/4qqHqHm71EVB5iWx04ZIeEOa7++/73qgJhzY+/oYhr7b9EcZoi9tKI91zxhyMy8zSbOFTqH53F/ecneU1dklf5jXbxs60SSoyDXlkWEF1jtHheSXcouxzjO0uxmiISxvqHGzNkNzMzxnLpXoIA+sdkOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fXu+VR62; arc=fail smtp.client-ip=40.107.20.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Idojt7t76WJkox14O1kH86C3X25h862OsXTgDPeeQhptTauVBCdIVCtgYx2T5UJ/tAgkx4tNq+qcTtI+oi0NOi2YrcENJmFRi5jQiVuvTsdXLQE4tEy8jCD3j0QpzADKdPEweApvzL93J9zn9ZkVoRxNB9x2zyp33pL2UHilnRDSRR8Q0d03i2BiE0JfGnJhGdsR0ZObpciRWs9VinTGa3TB3fzMRJW0Lmp8l6B8U+xbSxwfxlHNZ8iKv4XjG9w+yBclAYTmtLlzIydwsmwbWi2dHx6P8hxbgdgzFqz6lAW1L9E0OY2XfPwieiKC0WsgR0p5hS2OEeZXKhEfebIvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1aXolojXY6vlMkQiAWdnICZ/shxDbWwsQEWVWdqr3Q=;
 b=FS1lUBbgfis/VkEBBicG9kygaQSwvHb+FxVKAVq+Zp7CcIDFHBCIY5RbxOxe8WeAoXmtURWOkANbTJBNkawHb7gQH6UrYJBlZ/m+3IjTEs9OAc28OiKhBTbeOO2lWkSAOYsYXE2ujtfUack1Ba8sXckU6Vm8stX630YvoiAOfBcqGIBGR5HELeaGhYg1Pw9yP4LIozvO9KHuhbIW6Gt3Ak7TGnKhbFDmE5KyL56XYO4U5UoTQDL7OcyY+LcF0s0jo8g/JNrGEFpeeacrI8sburU90sY0JLiaph+16s+1+Nu8rTDUxYz6oQzfCiyaxNm+9wgFYgNjfvR/Dc9+MyshHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1aXolojXY6vlMkQiAWdnICZ/shxDbWwsQEWVWdqr3Q=;
 b=fXu+VR62jFjp2HLfjnWrwLQjo9GLcD08GjQMiqQIqxjRqvH86/ibn2//PbG5ytcBkRuT1gLGpNn18lJ1GscM5iReBY2qx1r58lxDk21JDfcOsYWXDwP2vIua27LFB1ncYeDfMzKMAM0ykaH4geUKcdNmCNBoW7qTVr8ij2nioLKe0bnN7d7n3zLvcCGXRA1rbdVip9XbzWu90AbfceMfbp4PwJaSVOoaAlwcFOC/zkzVoOg80BsTatNKRhHSi0HTepVs4n0Kq/EeH8FFEBudgVPFREzKZaY/yhVE/9VpyPBJhnkwie9Os7YCKeHbg1TtaKkWIuojb/26KaYdtbGvAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 20:59:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 20:59:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:21 -0500
Subject: [PATCH v3 02/12] reset: imx: Add SCU reset driver for i.MX8QXP and
 i.MX8QM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-2-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=4608;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=PPjam9Mn3rObWQsmhxiyi/pAvTD6/2dsCVVP0bFqAE0=;
 b=yu4BiMeaYrgfgZw4+Ft4HHQgdCwJitlFkID1aILHrWM03kzNfFcNlJvbStralp6iJ38GJK/rl
 E2nrrjJPO7UA14rSaGP91EPBg+B3eg403szKzYvmKtXL1zI+Wtb1mNA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4a19a8-d261-41c6-fe97-08dd4a15e061
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WlBjTUMyWm0reHRBV1B0QW1HR1N5WmRlS0tNdEJFOHpMMjVRS2tnWWJXVVhn?=
 =?utf-8?B?YmtsWTlHeUJiNm1rN1U0VGJleFZCM0ZWak9rbGJwazIxWnZRTmhoZytBYVJX?=
 =?utf-8?B?ajQ0clZEWU5HU2pjaTAxYytPZ3ZlV0NUMmNkTXkweVAzVHRzQUFzNXRLQ3BE?=
 =?utf-8?B?YUthU2Z0dSthaGo4WDBUaGtOUlpsS00xSi92K0k4UCtZeDQxUXBzRFgxRHB0?=
 =?utf-8?B?dDA0UW5nRFJRalUxZk5hQzZUYyt0N3hYTXB0L29hamFYSEZicHJ0YUIxMTFH?=
 =?utf-8?B?dFlHNGxKcDJFZ3RXeWhiK01VbDhpbEtES2dGT0VXOUFoNktaVGR0enlDOHZk?=
 =?utf-8?B?VWRpekxOWFYvdDlXdkJBbTJXT3FMUnpVaHB5cUJod2lGeXdNbG41YmZzVlVh?=
 =?utf-8?B?bm1ZU0dYWWtQSzE0a3hFWFFDeHc0bHFuTnQyK0dEYjdSc1pzb2VuVHBYY3R4?=
 =?utf-8?B?Qi9nNy9yOW9TaUpRaU52a2Q5eVBUYWEvd0RMem9lanY0MUFqZ1ZWbi9IQVp0?=
 =?utf-8?B?cmxlbFpxVUJEM3ZRRFNhTjNpOGdXWWdtdnlvaDBaZmlRLzE2dG9wYWxlWGEv?=
 =?utf-8?B?eUZqLzU2YVNWTjVrNll3eXlQU3c5bkNENk9aazJPeWdwSU9lWEhuRjlCYjh3?=
 =?utf-8?B?Rk5oSW15NkFzeHYyRWZySEdJNUd5M0RoaDc1UDFaU2pjVHBZS1FkeDhJeFVv?=
 =?utf-8?B?Vk5aUFZOVU5CYzVkbEVoT1djeFZZcnlyUVUwRlVjT0tIc1VpbXJYV0ZLWWFV?=
 =?utf-8?B?WXFoMDB3Ly9UM053bzNmdW93YmtmRWFvNHBrOEF4MWNSN3ExTGVKVktSZk15?=
 =?utf-8?B?TmJwYngxUDJHOGE1Qys2bjdGUzJ3aG91WlhjVkNEZTBqWVlUdUc0UnBNMkxZ?=
 =?utf-8?B?cEdkM2F1WnpYOGtiMEhFNTF6ZC96SGcrMGNNOVpFK1NSdUVNcjVWc3lPV3FO?=
 =?utf-8?B?ZVpxVFdueFBxTHlaR0E5UkRxYUpoR283ODJVTTFxcXppV1RNTzdiU2tPSFVv?=
 =?utf-8?B?alRGVnh5MnptVWptd1BBOExYYjFENHk5NGVBVW5iY1FYQ0xsdGlibmRvejg5?=
 =?utf-8?B?Q0czR3dwckxXSzF0UWFiU3VYd2ZtMXduR0s1d3huKy9kbnB2S3JkaTltakU2?=
 =?utf-8?B?Q3Y0UU9wemVkTzN2VUZBUEZmbTE5UThRd1hYakNWcmJUbXVYWUhTbVdoaGFL?=
 =?utf-8?B?dFJ5c0JReDF1WG5xZ0lRby90a3dBN0F1K1JSMWlsRlYzc3BuWmRBWUx0NEtq?=
 =?utf-8?B?cnRMbER3ZFJyVVVyODBVcnhxRWVPaVBwR0V2Qy84RTVORVhTYU0zMzUyWDdC?=
 =?utf-8?B?MzFuMHc5NW9oaks5anFlb2F4WjVKam4zNG95ODFzczM0ZnNHRDE5cG1CWWo0?=
 =?utf-8?B?WGdTbkZoOUozQlhKNVpxTXJXVXFxOEZYRGdzUjhUdVN1em0yWU83aisyNmRB?=
 =?utf-8?B?cEQ2MHEyMVZWMTA4MmRqaktGd0ZtaEVPWHZ4cTcrNUNXMm1sbzkyQ1NnL200?=
 =?utf-8?B?V2JzNHM5dkNWVzZEM3VNR2ErVVNZMlVEcFgyTHAzY0xDNGp0MUxvZHh5Vllr?=
 =?utf-8?B?R05sNEd1aUN0Q014ZWZES1NFaGlTYUoxS2k2blZGWTZhcHRCSHdxSlh6czIv?=
 =?utf-8?B?WG01NWV2OCtSeUpFci9OdzZLU1h1bnNMeWczY0ZNYlFuKzhLWHBXTlJDbHBp?=
 =?utf-8?B?L0Fnd1d1czBoYytkYnpHNGNPZzJpRVVVbEp4cTcxUjZRQWlMOWpLNEhYa3FI?=
 =?utf-8?B?VExyRkE2OUo0cHFBbWhTTEx5QnFrUjNpMTJRT0tDSDB5RmhJcUlsVTV6akVI?=
 =?utf-8?B?TkZDZ0pGWWdPZXFqNEtPL3R0WTlFK1MyS3YwQk5nelRNYklkWFhMU1Rmc2Q2?=
 =?utf-8?B?NTljR1ZuRUp5NExTbFUwaGJ6K0MrNkhLL2RzZjI0RngyT1RqcS9DNEhLTFFE?=
 =?utf-8?B?MHUvM3gzQ2RBbnZyYnhHalVRUFpKejVaTFlHeVFOcGNiMTlZYnNRWDdtQ1Zu?=
 =?utf-8?B?VFJQcjRGR21BPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a3FnVllWQ1VVai9XRGlDNldLcklBbElKak92eHRkenJXUmMzejRZWFMxRm9P?=
 =?utf-8?B?Y2tFSmJCUmIrOWxTRkh1RXFIRDJEd1JwazcxT1Q4Z0VBOGw5U2FHajNlRzBZ?=
 =?utf-8?B?aVBqR1lxNGp5MmhLOEdKczJPTVdOcUxlQ3hVSitsS0d0WS9LeHJaNjl1am1y?=
 =?utf-8?B?dFlZUWZodkFVTXJqOEJudXBtcjNFV2kwOENOTGxvblhnU1hOUEUvSHEybEkz?=
 =?utf-8?B?Q2IrQWtYbUtObDhJOGZ6eUgvNm5VWmlmbDJZUVVzMXRPWXg5ZFBsb0lYVnB2?=
 =?utf-8?B?SjNOak5hZnVSUTdLZkdBMEZuVGhKVHc3R3BuTE5EZ0pyUDlLWHBuQlAzWmlK?=
 =?utf-8?B?UGdFRXNSTjFWNFJtMkV3U2tlK2lGMjF3MzdNd3FMdjZoTVp3MG9LZDNiMnlk?=
 =?utf-8?B?ekNYeUQ5b2hPR2dNSUlaVUd0UmVvRUZvaWpLUUJkaU9BdUovVEhKQVJLWVU0?=
 =?utf-8?B?dWdnSXJEUGQ1Zkc3L0ljdmVxa3JNcHR4SlAydzlCMDduQ1hTTXhBM2h6SnZK?=
 =?utf-8?B?dFBLaXYxNkxUcVRkRUZxTTF0bHd4N3g4Z1JxSVVnQU5MdGtaSytjWlByalY0?=
 =?utf-8?B?ZmV4QnpxWlo3WU9HbUt5Z1kzMThiSmJDNFlhNERnUENrVUQ0MStDNVBrZEhE?=
 =?utf-8?B?aXJVSXlyMVRyTHNwYTNJc3BnSGpydkg2TzJNVzBHand0YndJN1MyRU1VQnBq?=
 =?utf-8?B?QU1JK2lXSWVHeng1eGNLS0ZmSUp2cHhad1VybFVraHFBK2t2Ykl4TTRyWmJ4?=
 =?utf-8?B?YTlMVGxEYkJ4VS9zbkx4ZXA3UGo1VEV2K0ZGb3FjczI1YlJBNWdlMENJWVlE?=
 =?utf-8?B?dDBaamI0SEFSYW5CczllamI2dlpTUnQ0Y1Q5bFZyTU1pbkRuZFQ2alR0U2FQ?=
 =?utf-8?B?ZUt2WC9GYk5Kc2pncnd4SzJodlp6eWdSb3RzdGRvRDZxa0hIaFZ1ZjRWYjVT?=
 =?utf-8?B?RFJTZFMxeWJqWTREdm9Zb2VtV0xKeGhzYURORnRQcEtzVnltYXNQS0krdmtF?=
 =?utf-8?B?c2lGVmhIbjI4YmZoSUdLeWdEdkdVMng0MXZzem5ubk0yTjNBZDQ3bkdpaVRY?=
 =?utf-8?B?TDJ4UStrU25ybDVMYUhYNTBkV1d3U20xY2lSYUpDKys1MGtkNlBRUGN0ekxZ?=
 =?utf-8?B?dGJSWDIxeGlTakozdjJhUkV5ZWlaQzc1c0g5T2dUOXZ6engyVTF2NGNZRGFj?=
 =?utf-8?B?Tkd5dWhIMThSWmU4MkRldGpCR05JbkJKZlpBQ3UxZElrWkdjRUFVL1BwR2Uv?=
 =?utf-8?B?Mm1sSmQweHJSWnJLNi9FNW95ZS8ycWVNRVpHNGNyN2pselZEMUNnZ0JsT1NW?=
 =?utf-8?B?dFY5dVNFRXBzS2w0bHdWeURFb1FoNjdCckJMMmo4Z1NnWm9mNFloWk4rRzNs?=
 =?utf-8?B?L2JORXVFK3hKS2lOTXRQVnFvK0VwcmUrdlZGbEhaQ3ZZeHlHZTFlWHlaUFNt?=
 =?utf-8?B?ZXFKQkJvcUgyVWFXQWpHL09FNmpVQldkaFR5UHB1RXlwWkVhV0ZlUmx4Z25J?=
 =?utf-8?B?dm9sZlJvMUdWdmkxMWVCN0V2Tm5pR0tncDhGTkkrK29hd3pFZVZkVGNOMU8y?=
 =?utf-8?B?Uk9Xa3JtODJuS21TcnJ1ZWZIVmNuZjFzMWJSN3R6UlB0Ym4xTWNBRHpLblRy?=
 =?utf-8?B?WTlETG9ac2Fjb0R1c0J1cmlpV3hLaCtmWENYdlo3QUcrenp4TC9kV2NCeGJG?=
 =?utf-8?B?eWd5b0xHd2U4Y0MvZEhmQ1JjNWVTcGVqNUNEQWs5U2x4WW5yOW5LZ1hlZmlD?=
 =?utf-8?B?QVFlcVY5UnZtYzNJK3E1eVNDRXg4Qm1lZmh3cmVPb253aWVzT3JIT1FFM1VI?=
 =?utf-8?B?TnpHaEg2YUZPNmVUMlgxNWN3dUxEOGZGMzkyTHhhUDE2TXJuMmR6QXYveE9T?=
 =?utf-8?B?T1I4NjBIdzVlczVDY2xIeDlmSnlhNFFvdlQrT2Y3YUltbjFxZFFzcnZTbnY2?=
 =?utf-8?B?SjJnY3h2bjlEQ09oTHVsVjhpZCs4OVp4T09MUnBtUnd6eUhvY081NW1nMXNq?=
 =?utf-8?B?YlNFSXVhaFA4eDZIWDMzZTkyVDdXMUNROXZLblBsem9vY1UrZmZId05FU0tH?=
 =?utf-8?B?OW9ETEsrK1dReUNoazBXbmRySGFjQWpxeUlmZTRDMURtYjU3VGhSVzlKRGww?=
 =?utf-8?Q?LSF2BUfjJOQ3Nh0wZQ6ds1iMT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4a19a8-d261-41c6-fe97-08dd4a15e061
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:59:57.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb55H01mufsKDrYvzYK4m4TG7eyqtY4P9f/PKFWFMdGZiV/muNpqvqdxcQfgges+gknfusgcwux+z6YLPPXlyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

Add System Controller Firmware(SCU) reset driver for i.MX8QM and i.MX8QXP.
SCU Manage resets for peripherals such as MIPI CSI. Currently, support two
reset sources: IMX_SC_R_CSI_0 and IMX_SC_R_CSI_1.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v3
- none
---
 drivers/reset/Kconfig         |   7 +++
 drivers/reset/Makefile        |   1 +
 drivers/reset/reset-imx-scu.c | 101 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5b3abb6db2489..99f6f9784e686 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -96,6 +96,13 @@ config RESET_HSDK
 	help
 	  This enables the reset controller driver for HSDK board.
 
+config RESET_IMX_SCU
+	tristate "i.MX8Q Reset Driver"
+	depends on IMX_SCU && HAVE_ARM_SMCCC
+	depends on (ARM64 && ARCH_MXC) || COMPILE_TEST
+	help
+          This enables the reset controller driver for i.MX8QM/i.MX8QXP
+
 config RESET_IMX7
 	tristate "i.MX7/8 Reset Driver"
 	depends on HAS_IOMEM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 677c4d1e26320..31f9904d13f9c 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
+obj-$(CONFIG_RESET_IMX_SCU) += reset-imx-scu.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
diff --git a/drivers/reset/reset-imx-scu.c b/drivers/reset/reset-imx-scu.c
new file mode 100644
index 0000000000000..d3074eaad4c99
--- /dev/null
+++ b/drivers/reset/reset-imx-scu.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ * Frank Li <Frank.Li@nxp.com>
+ */
+#include <linux/firmware/imx/svc/misc.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+struct imx_scu_reset {
+	struct reset_controller_dev rc;
+	struct imx_sc_ipc *ipc_handle;
+};
+
+static struct imx_scu_reset *to_imx_scu(struct reset_controller_dev *rc)
+{
+	return container_of(rc, struct imx_scu_reset, rc);
+}
+
+struct imx_scu_id_map {
+	u32 resource_id;
+	u32 command_id;
+};
+
+static const struct imx_scu_id_map imx_scu_id_map[] = {
+	{ IMX_SC_R_CSI_0, IMX_SC_C_MIPI_RESET },
+	{ IMX_SC_R_CSI_1, IMX_SC_C_MIPI_RESET },
+};
+
+static int imx_scu_reset_assert(struct reset_controller_dev *rc, unsigned long id)
+{
+	struct imx_scu_reset *priv = to_imx_scu(rc);
+
+	return imx_sc_misc_set_control(priv->ipc_handle, imx_scu_id_map[id].resource_id,
+				       imx_scu_id_map[id].command_id, true);
+}
+
+static const struct reset_control_ops imx_scu_reset_ops = {
+	.assert = imx_scu_reset_assert,
+};
+
+static int imx_scu_xlate(struct reset_controller_dev *rc, const struct of_phandle_args *reset_spec)
+{
+	int i;
+
+	for (i = 0; i < rc->nr_resets; i++)
+		if (reset_spec->args[0] == imx_scu_id_map[i].resource_id)
+			return i;
+
+	return -EINVAL;
+}
+
+static int imx_scu_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx_scu_reset *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, &priv->rc);
+
+	ret = imx_scu_get_handle(&priv->ipc_handle);
+	if (ret)
+		return dev_err_probe(dev, ret, "sc_misc_MIPI get ipc handle failed!\n");
+
+	priv->rc.ops = &imx_scu_reset_ops;
+	priv->rc.owner = THIS_MODULE;
+	priv->rc.of_node = dev->of_node;
+	priv->rc.of_reset_n_cells = 1;
+	priv->rc.of_xlate = imx_scu_xlate;
+	priv->rc.nr_resets = ARRAY_SIZE(imx_scu_id_map);
+
+	return devm_reset_controller_register(dev, &priv->rc);
+}
+
+static const struct of_device_id imx_scu_reset_ids[] = {
+	{ .compatible = "fsl,imx-scu-reset", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, imx_scu_reset_ids);
+
+static struct platform_driver imx_scu_reset_driver = {
+	.probe          = imx_scu_reset_probe,
+	.driver = {
+		.name = "scu-reset",
+		.of_match_table = imx_scu_reset_ids,
+	},
+};
+module_platform_driver(imx_scu_reset_driver);
+
+MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
+MODULE_DESCRIPTION("i.MX scu reset driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


