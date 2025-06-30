Return-Path: <linux-media+bounces-36356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAFBAEEA36
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59B823A3A24
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC152E718C;
	Mon, 30 Jun 2025 22:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Setv0EoB"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C165D28DF40;
	Mon, 30 Jun 2025 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322514; cv=fail; b=ja6LeSE8xl9BULNXkWdofV63nrkto99NgDfyAc15TIqynOLOx72TYqhMNvqgDbKZYSIaCXMxV7yY+gr2Jj9Rx7MU1ClWBxkYyPCtEDzuxnMYWS5oBw6rHqsJLCMuxmmNm3ZmSoeaP6Qx1DRd09NnzLC+80KIdmOZrf7ql3csHgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322514; c=relaxed/simple;
	bh=03ylvT4jpq143Urq2Yjv59M6npopgFmxxOqncg8lYJ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=An7QEBFYPWqss8/dQMeWZqm+NznBkc0dzL/8elkp/NZktibPzMEo2Nv87oeA1q6/jtAD2R8lDOikenswgxaO538IXOxuorNswDAM1N1Im1UQMjXBKTouQTra3+wxRrrqdWV4WaSB1/fcmCXFn9zkWqhq1h9S5dvE9XJjPR6VQtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Setv0EoB; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM794XWQH7Rmi5UaGKa9VjWom1Sivmeph6XU7BmyVXSK/9DOnF9cmQpEi7G73MNnhFztULFhM8ws39xXXCIgXTglLJG21Cq/oE2GKTYF6safJyFu7H+utUGP2Z7VgM6LzCnpxMux8+vv12GNRUtpHIpWDZlPtaksr1h8bTxst4neYr56fKHvdj0XTVGBIjRUXNQokzAIefmSgik4Q2EEhlrb0POOGvGyYRknhWOPqFxm7gRh8WpKYsuEICxQu+b/zlo2P2WMKUJhNAAbVIt8BmCkYyHl4AU8JrBM62Aw7QOGOv1L/q4RrLzsYE042j235Qfc46L1Ps3Sa8yjHqhgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+G8l/tUltCCqB0LK0Wsb2A8vYfxkQv/KenfOYZR/6Y=;
 b=VNnx+3HVZy39RG+nXRp+xh2vrL1wi3hcPijxz50p6wiWQ71vAW3gvKwARqdAS1S+rj9glry+uNK/doJYwzbFCteA3zPrO+P3yLzdJF4UShLJUoZZVDPV5qHW6DTI+2pFg4rGVT4UtZeWL02MRsJHvwyCPZmWCZQA/XevoO1ZNarzGrdQ4vv5ImlaKeioWpmPmCmJKxHPMRUmWALDWe8fv49aY3gJvIX5GHnuU2JSGF3tqh9iIqJJdqxH2jLjCDzvFHs6uynE/Xx9ByUhvRwz8sGYVs8iWRGdY0E/1PSpHE/ykT3I/lIeSjKdF22OgYdF6xnOQPrsDfv6NWr1kalS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+G8l/tUltCCqB0LK0Wsb2A8vYfxkQv/KenfOYZR/6Y=;
 b=Setv0EoBJTsvNMAdZaJVCBa/m+5AL8/7pObM6RHnshJ/xt72g9TMuUD1r6V4N+CTFLwUYID+1fAO6w33RKyjMF4iedofnfRBCF3fpI1SWZg0yrcVIfD/HaW/vXoSkxvRt27BFB8Fh8UhoE2nSUHAOMsKQuJxPaZI+gwrbzdZiHeYNPKwgmIFCsxInNfP3YIioB2rIOiXc0CmuBj20i7Dl72cdbdYce2rZA9zMQqVJAsPMrVH8SVw3yjM63rJySzp/yCm0btcgglwt0HXewXufReB+lfpK/RuUDwX7wq0bfRw/Te0BbvRbR6Oq+Nf+AfWf0OXzY/qnS36H0+vPUHXkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 22:28:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 22:28:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 30 Jun 2025 18:28:18 -0400
Subject: [PATCH 2/5] dt-bindings: media: add i.MX parallel csi support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-imx8qxp_pcam-v1-2-eccd38d99201@nxp.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
In-Reply-To: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751322499; l=4121;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0zWesMw1WPI6S7FIv9qrpNxnK7mUVn/sPi1ASIXjYt4=;
 b=UbqoQxoK81FZz3cRptABuA76FP/LEdazTKidLVCyDOXT6nAPj2HKOiAjudhrrDXORFg/U2VBf
 BP61HbgENm9CyLOyNz8nZA91BsMRtzIAMntzeIM7WdZ4o7jp9kihnpd
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM8P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f097f2f-558a-44a7-1cb1-08ddb8257077
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a0xscTZoeFgzN2NzdGFCd3VPdDdxT1BRR2QyK2JlUGU0Vnhpa3I4cmtyZ1RO?=
 =?utf-8?B?YUxTOUVudEt4czhhcE4zRE5LSUhEei85WXNtUGV2ZnJSdXJMVStPVU5KeXhp?=
 =?utf-8?B?TGZIcm1POWpIUlMyMnRFWGVDdjIzSmJ6STJiQnozMitHNGdxMndYVzlxbXlQ?=
 =?utf-8?B?T0w0ZEJ3cTFrbXJ3OWtZZ3Q5NGtVSlMvY0N1aDQxdXFIdHR6a05DTC9xMXhF?=
 =?utf-8?B?NzA3SVlKYVpJQncvbEoxT0xzL2xaN3o4NTl0SW1nRXpXQjVNTG1OWjJYWUk5?=
 =?utf-8?B?N0ZRNEF1V0xDczNkcFlwT0hjZlV3Z0hEUmx1dzFqR1pDVWJYK2lwYjFvRjBp?=
 =?utf-8?B?Q1l4b3lQZjBYQW9UamRKWlVpRjNnOVo2YjV0UmNpMXZqdExGVUF5TjVlcHZC?=
 =?utf-8?B?ZUQwU25GMldCeVRzdFdUclVwTkhoT3U2cW5rR1VoVVl0N2Q0aUFKNE5TSTQ5?=
 =?utf-8?B?cElZV0dXalRWZXRURVVIRmlJck5wOWVFVVdMT0VkbGJMd3ZEYzJ0cjRIN0Jo?=
 =?utf-8?B?VFhiZEVtR05pMjkveW83ejhtTmdwVXc0NTZaeHZoY1pkcW5KMzMwL2h0WW9M?=
 =?utf-8?B?RDd5a1JnbDVNdGtHLzg3c2JEV3o1S3pxTm5QYzQzbU9ZRndSUlZNSXpRbjRr?=
 =?utf-8?B?MWI0ZW11S0tEOVJVZ3lZbmxpZU5zV2RHN2ZFUE4vQmFjT2ZVcHpxT0xsbGhj?=
 =?utf-8?B?WjRMcFFpWnNleGlISEdQeVpsamdYSW81UE9GS1ZGays4L045Mmo5VmJjb0Fs?=
 =?utf-8?B?UnYrcWRJU0swMENVRnJZeXZ5YThzS0h1VUZHZ1VCbldTMjRrTjFQZ05ITXF4?=
 =?utf-8?B?MmluRDVUbVROSklSa3pLNEpRVzJGdWNDczlvWTh6NnRsQ2RtOEpvc0paVmVj?=
 =?utf-8?B?d3dFeHp0UVgwVkJ4WjB6Tlg1QjJHOWRsWk1YYno3elB3QjhJK3FLMjBWZ2kv?=
 =?utf-8?B?ZHdvSGVjS0M0b2tPL24wMEdnQjlwQW1jY0N2NDREeDNpR0ViVWovMitjTlBk?=
 =?utf-8?B?Z2duamxuMmdGRE5Xa0ltTmY0NWtYbWF6ak9wUERZeXgxSE5lcnRhRHBCaEtq?=
 =?utf-8?B?VnM5djJ6RmExQWh6T0NSbkNmZ3lwL3crK0pscS80V0xSNzNIMkpHb1QrUW1J?=
 =?utf-8?B?YjR1NUkrSUV3OW5icTBpemF3MC9WSTMwZHNWejhoSHQrS3Fud3BDNlJKWnRO?=
 =?utf-8?B?Q2t0eml4NmZBZUxYbjNCRzdBODVqQXBKT1ZQMmU1WnFLYVBrK1J6VTFxZ0J3?=
 =?utf-8?B?N21JQ2djSHNxREw5NDlGZ2RKVStVaGg4UEVFcFE0VkV6cDBWV2lGbUpmcmZR?=
 =?utf-8?B?WGdwOFBuRWRSWmFmZDBhaHBMYmluWUJmcXhhd3g3RzBYbWhtY1BDRHRONTZY?=
 =?utf-8?B?VkppNERNazR2Q3NXN3J1UUN6UDM3bnlIOHBYMFJzKzQ5VFBSN09lMUdFN09W?=
 =?utf-8?B?VkR1Q2xRZ3VwRS9RRTZYSEx5Q3pkeXJ5SlhTY3RkUWxjOCtMWjZ4U3dGMXl6?=
 =?utf-8?B?MTJWNDZWY3BGeWFHdCtrK1poakNTdmM0NWxjdXo0NnZtTnluWXd2WjRIY2R4?=
 =?utf-8?B?TXlWVDFsNkVxbGhXSitrOCtyWFVVUk9LZGlRaWVPdk5uTFl2STRWQnpJWEor?=
 =?utf-8?B?c1pKdW45K0NkK2hhWThsNVhHSmQxOGlvdmZsR1EyODJVYUpSTTZwb0I3Njkx?=
 =?utf-8?B?TWhkMFFsUGFYWXlsNEJhZFNMMlIwVXlzQ1crWnF4TjdvOWIxQ1FSZWNxU2pa?=
 =?utf-8?B?cFAvZmRlcFdiWHlKbWw1eTRNL05zQVV0dUJRZmllalZjSXBEWVRtWDlocG9w?=
 =?utf-8?B?cHhCUXZNOTdBTmRtdmZTMkVEVERDcjNNdVJnUHZJSURObXl5V3o0UFJ6dmR6?=
 =?utf-8?B?V29ucVByblBDRXJhby9KSDhXZkFYazRiM1R6QklLWXBWWlg0OTRiWW1IWGdq?=
 =?utf-8?Q?YzcxSXnpDXiTJ8dvXCu31cZeoqmiZbWw?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VithekZEbmx5WVJMVnI3NDlpVk1kVEdOY3I2ZTFaajBSQ0wxdXlhdDYrOVN3?=
 =?utf-8?B?YlZoaExPVjdtWk95bW1keG51cmpzRWRsYkoyNVRxMlVJcEpLL21qUFlhTkhp?=
 =?utf-8?B?MGdoWkZDNGE0TzB5Sm5UNi94UzJGNEZ1aEpSdmZIblNJNWx4K2gxd21URFZm?=
 =?utf-8?B?d0duZEJMbU85OTdaV1RsVncrNjJQSFV4UThOZUJER042NUNiY1BaWUszempa?=
 =?utf-8?B?ai9OWmpOdDNkQUxUWlZZWVcyaGVuY1FyWkh3Y3BvelJNQXNVTFl5bDFOcXpO?=
 =?utf-8?B?Q3ZpQVNUb1dXRWlDMFc5ZWlKMk9XdTlmSTNtKzlJTlpOQTRHZS9mT1QyanA5?=
 =?utf-8?B?NzUyMTVyeTgrK1JsRnpoNy9HQVhiY3dJd1J4M1ZOdGNCamRDUkZnOW1xZW1w?=
 =?utf-8?B?SGRrSVRDTlZINEtoeGl3anBMQjdLNmZIKzdoOFJ0QWhWOXZFcEpOZlNpMWxK?=
 =?utf-8?B?emdpMndGMkh0UnpWb3lRNm1UV1lBU3I0QnMvYkZmbGN1aDhwaVBoNmdSOG5n?=
 =?utf-8?B?TXVDSUtwalRDUmtSaXdvRVF0bWpsWWsvaTJ3cldXcTVMZUJMZGJmMDFEWGYv?=
 =?utf-8?B?dkZZUEhac3hoVTJmT0I0bG1tRGJTT2JSbGQ1eWk3anJjSk10SmVLMnMzVGxw?=
 =?utf-8?B?R3ZlK1RaMWlXSmcvZXdaZXZkaVhTek1pVk1tOFJzYVM0dE1RYnRKUUhOL1dl?=
 =?utf-8?B?V0wxT3VWVDFXNkRxRGJONGliM1JiQmFtQzl1VlFFcmJPODh4MHVoaStVZWk5?=
 =?utf-8?B?WXRCTUxQeHIxd2tsVTZST3FjOUpueHo5QVROcndPSUNtOXFXTU1yeXJXc2Yv?=
 =?utf-8?B?WGJ3MFRSbHBraEhYMXV4bFhkZ2pVcUxELzV5L2RWNnBBZkk3LzBaZ0VPZ0l0?=
 =?utf-8?B?ZHBYYmJpZDVwcloybVc1bW9tNy8rOVl1dWpMdVFKMmRKQ1pxaEFuaThkdUJs?=
 =?utf-8?B?V2RRdWhNTTU5eTgvT1pNZ25GbUlHRm02bGVNN1loOUkyVWVJRnptTm1wbFV1?=
 =?utf-8?B?MmxrNVcvNUd1cGY2a3NRRnNERXo5M2ZzS29VcGlRRU0xYzNSckRrQWtRNGox?=
 =?utf-8?B?bld3TjlNbXV3dHFGR3F3T0ZWcUxaTjE4d2RoOWh6QVlVK2k0b2tKWU1jOGtw?=
 =?utf-8?B?dEFRWnVSRFFIczlvUGtscnJDQjBiRjY5QnBRK2ovL2lhZ1F1N1ZmQk9XSHls?=
 =?utf-8?B?bEV3ck1DcFdENVdkSkJwaXh2YnhpWXhudzRjZDVDL0dXN2RWNVFqMk1oMDJC?=
 =?utf-8?B?Vyt2NW1WV2xBWktscGFtdDZzMUUxNytkZ092TjRiTlpDWkpRQTcwTXl3MXRw?=
 =?utf-8?B?N0ZXRFJ0TmFGMzk5c0E0Mk9NcnJvTUg0Y2VpOWhEZC9EU1VKYzJDa0pKSG5F?=
 =?utf-8?B?WXNXWDVudHJrbzR5K044cDhXWVoxUy9hb0ZSYllRekpZeDRYU1FmRThubElG?=
 =?utf-8?B?c0dMdjF6dWJYeTNRZCtXRzkzTUY3S1FXeUdYQ3BOdUN6WHQ2MGI0bzhRMlBI?=
 =?utf-8?B?LzMxazVnZHdXaWh2ejZZZWhBQWFNdkxzU29YdFJIVEhwQklVK2JiaXRURjJG?=
 =?utf-8?B?V0RFWVlaRkpWZm5EV1lXNmJSTDYyVGhIa202RW8yUFRwaFdDN3owalk5TDVX?=
 =?utf-8?B?a1Rvbi91SldhbW11R2JaWmJqVEk2bkszUk51TFZrL21HdTlLVVdkWWlDcFBF?=
 =?utf-8?B?UmFWeFFFL3VFZUJZdVNkcmx2V25RRDFIM1Nkb1RDM2dGcEZ5OHY5VWxkNm92?=
 =?utf-8?B?ZnFRNDVmZy94QXJ4QndCM3MwYVdGQWpodjlobnl5OTUyRVplUENmZ3ZyQXRQ?=
 =?utf-8?B?aVAybnZGZjVuVU5FeWNBL1pBSFM2ZkNZVE03K0FxUXFFamRIbEZkWWZ3WUFp?=
 =?utf-8?B?MkxOdEJHNkJtUmpzWlMxTjIwNS8rclkzUTFJQmxVVXJyVmtkcXo2bUkzWDV6?=
 =?utf-8?B?K3dpSEJOazAvbDZiZ2JHZlVWVDFJOXNPMGlFUS9NZW5KZU1MZ2xJOFd4Z3pS?=
 =?utf-8?B?QmcreGlIcC95YllCZytSdzBqVldHYmExQTZNbTBpV3VwSnFyZXpnak1DRGNM?=
 =?utf-8?B?ZEsyUE1XOXZkU2xDQjBGcis0cWZYUmdkRFZsYXo5emJXSGhiNWk1OWZkWTNG?=
 =?utf-8?Q?0p7rBqPxXjDWcF3MW0WDJg1W8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f097f2f-558a-44a7-1cb1-08ddb8257077
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:28:29.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+51HmdV45pJgR1ZS5rbKrSd6n1azwAMlCEOGJyP93OOF5PI/WCI6tq0lQryJvdDht3Vu81k0wsA8/ZhuhBCOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

From: Alice Yuan <alice.yuan@nxp.com>

Document the binding for parallel CSI controller found in i.MX8QXP, i.MX93
and i.MX91 SoCs.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/fsl,imx93-parallel-csi.yaml     | 108 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
new file mode 100644
index 0000000000000..b4657c913adad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx93-parallel-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8/9 Parallel Camera Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This is device node for the Parallel Camera Interface which enables the
+  chip to connect directly to external Parallel CMOS image sensors.
+  Supports up to 80MHz input clock from sensor.
+  Supports the following input data formats
+    - 8-bit/10-bit Camera Sensor Interface (CSI)
+    - 8-bit data port for RGB, YCbCr, and YUV data input
+    - 8-bit/10-bit data ports for Bayer data input
+  Parallel Camera Interface is hooked to the Imaging subsystem via the
+  Pixel Link.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx8qxp-parallel-csi
+      - items:
+          - enum:
+              - fsl,imx91-parallel-csi
+          - const: fsl,imx93-parallel-csi
+      - const: fsl,imx93-parallel-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: ipg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    parallel-csi@4ac10070 {
+        compatible = "fsl,imx93-parallel-csi";
+        reg = <0x4ac10070 0x10>;
+        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_APB>;
+        clock-names = "pixel", "ipg";
+        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
+        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+        assigned-clock-rates = <140000000>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mt9m114_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8dc0f6609d1fe..3bd6772c11539 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
2.34.1


