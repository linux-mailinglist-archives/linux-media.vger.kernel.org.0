Return-Path: <linux-media+bounces-40686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A64B30616
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635151D00422
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3427B3126DD;
	Thu, 21 Aug 2025 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lyiG+DVH"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFE3126C9;
	Thu, 21 Aug 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807555; cv=fail; b=bJBImHq73oqMoMXt2SBkBBjnJwG3wt2RAjvjFthYpNl1xBw5vMbqvmX774+4cf+6cGwjSm37Jb8G8OutYCD3AnMVhRsgBNndC/S2SVn/5WNyPrUwcPRdELsWdLbW/JlWcq73oU3pJfpOLpLSMJzseeib5daWOMsaLXqA5m3J+YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807555; c=relaxed/simple;
	bh=EnlPFtAMwndOMxRTOWn8TbIqdQ46Y45Jr3TbziDk7A0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AP1Aczc4uZQbkHNjOuXJ4ODxmIpIE8XXydFu9s1QeMFD0lY5tqS2YqrXMZwTlVR8xH6RiMPYY00jYYldcL421MSJ1jLGhq918jrd4wmOJJo+tZaiNjvcMVFQ14qhcZrLU16J8kmsVU0pSVW9tWoVUoT0QcdCGo/PZMCkpMMrvDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lyiG+DVH; arc=fail smtp.client-ip=52.101.70.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw/1qXGlrEjpYcz7yaTu3YbkUjjQvBpgysm4G3CKWtS5M3DwliD0h8brVq5SrVba9jRUEyVklNK6c9DpJ+J698kAkGoT/WOp5VjE2OOnwAdsKMW080b/LMZlbLwoboMWvtzWkdHaGBrP5i+SPBbsivK1JhMsxqShKlzzMXqjVNKj7cDsxN4ynfNyB78pFfuZ/CsnabtOY5c4Yt/F4YFbGKaBEt11h+TciA3Qucc7ncakBewSIN0g144rwvvwgWlno5gwwJ4fPMtMBLU+louMXU9ovbmCBHKiwTmriE+RRlTiUdGO8A+sfHJ3JMtZTcytXfta3Qw5jqRvg1FKyZMHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTbqwj8MI2s1pwYuSNfQDbQDe42z2ipoHz/a4XwGonw=;
 b=b4dxxDGWWz8NQEfTRW62cO2qkoNq4q4gHEj1JBjK8sf4nTsXRR9KxVUAavJUhr7yv8vmmFL4KicYmGtJ0pmlg2YoeAqHkIv2wj4QGhXGYU8t0opESLxQhWMf9xfGIccLRR9VtK94AaohxKzJzZwQANTkW0HZxK7232OFjgDHtxgNwxUzPg3HsWkXURZomlMo+vYf+UFXFMlLewdrLx5o69Ne9pQpb9UanFJkl7k+lzy9k/Hoq6wOpdNPcJEoMBqubbwoJ3ziZzAFt8eY7HUpIjen0bIg3K9vs4obsC12Oe6tYGN3ZL24KrJTFA2pkIIW8VysBfpIpUANN4eM0lhrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTbqwj8MI2s1pwYuSNfQDbQDe42z2ipoHz/a4XwGonw=;
 b=lyiG+DVHn/3cWAGxNqtxTLGv2c9Dd2qUpoO9Jay+7v2AXqB+QMWmC6LBDxQlCjsTTpUgafLord6JyQyFMo4dGUXQ/KoC3t4tSrRqzkYV7G+lCYAHOtg9K7/2HFKkC88oaaJquU/X+V5EtkSdRYAG8J6Stux3GBm+QmtoJrl0JPzsfaWC67Rq3xz6ByMXdXHsowSXUeTK7yNsh36irw4w3s73Qa9sPxApa5qLxFrxWMT3puJxOIVpS0xnniIi6IlMJUg7UQFeu1iAPakMcs6oQrBrSbjjQ815ABYq+y+D/N7vdv1d9Wecw0pfHh0TRG3ntlU/UFzr1dRImZWE5BXQ8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:19:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:19:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:04 -0400
Subject: [PATCH v3 29/31] media: synopsys: csi2: Add Image Pixel Interface
 (IPI) support for v150
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-29-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=4156;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EnlPFtAMwndOMxRTOWn8TbIqdQ46Y45Jr3TbziDk7A0=;
 b=5ErZCnNiV45Q+Jkv6tIKUUMyHEfmqSjY2u9YJe9pdkHYC/TqyvkDC/zsibDUs/QFJ6zjz9UcD
 dX4zm3o8ltKDlnxzmTsduWZF7F0ACkaGJiEZ8TaPN/EVLK9n47PFM0W
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b457cff-a708-459f-b694-08dde0effce4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?b0tlTjRMTnVHV0NMejExZlBwSUR4eVNEQ2NXbStYeVlKeHBwZWFkeFRXOFhQ?=
 =?utf-8?B?aFU4WE85SXpxbEhmWnpSYmRxdkVuOE15cmFZbGtPU3J4M3grTUk0Z01jQmJH?=
 =?utf-8?B?VjF6SFNmZUE5ZmZ6YzluU0hDZGNPTUsvZkhKelBBSWJhQ0xBTENVV09FTFZl?=
 =?utf-8?B?R0ZkcUJMZGdtQ0NkVmwrM3FHc29PLzltQ2V3ZnIxWktUT3Z5aDVjQ0d0cTN6?=
 =?utf-8?B?NFBqRmZXZ0xJQ0pUaFZubXNSNEE5eWFUVG9TdGZodTk4UFNHakorZ2NQSVVk?=
 =?utf-8?B?RWRlYUxHZ1l0NXdreWpSelliS2ZubnpGVGJQRysvdDN6aE9Vdnp2SW1Odjli?=
 =?utf-8?B?TFowOGVNek9mSkxSOENDTEpZZWpYRjYwOStNR0t1UURkSkQwRkhSL0FaN3dO?=
 =?utf-8?B?d3h6cVRyaGJqekZ1dlE5aUV1aTZaT1J6VEN6SVVubER1WFVZb1pxRDdpOHFw?=
 =?utf-8?B?MjNWNGtzaTBKanFIY2Z5eXNQRzQ1OXdYZmFQd2Zpa2htRDYvV0FwVldNOHFK?=
 =?utf-8?B?aXlNRFMzR0NkVHlVU0FQVnRNZVNCZzlYUEoyS0NEWnhIaFVBN0tvUTBUb0FD?=
 =?utf-8?B?Rk9WdFE5SkJqOVc1bUZIaEZ2UXQwZlRvL1FPSVNYOXdMOCtLM2JtcWxtTXVy?=
 =?utf-8?B?aXJxa3pVRHJaNDZ1a1dNYjhPbEtYSkdxMlg5MitQLzY3cXR2V3ErNkZ0ck1U?=
 =?utf-8?B?VUY0ZXlNVkpuRzdhbzgrOHZZcmhWMm1ZZnczbDd6dHhSQ204R3JjdG8wV0ts?=
 =?utf-8?B?ZUZiWU83MDVtVWt0enFCRlAyVGpMUEdHMjlqOGNYVU1SMWgrdlRxSkM2UXZG?=
 =?utf-8?B?anBTMi80N1gwYVR2Vld2WTdvT1cxMk5yaWp0VE12Q2FlQldxSmlhd2JBcGNh?=
 =?utf-8?B?VjgyK01jOTVMbWg0V2NhZ0NjVzRmYVRtcEVMS0Zjb2ZnT3lhVk8zcjAzd0Nv?=
 =?utf-8?B?OEF1Q2FrKzRodmtldVZJMkhLRzBUc0x6bkJ2a0pzTG9nQkFOL2ViWHEvSG9Q?=
 =?utf-8?B?ZXJtemk5eWFxNDZ3Z1huakwwcnQ5SzJnWG8vRWYxRUZjenBtVkNkOGp0ZUZZ?=
 =?utf-8?B?STJXSEVyZ0hEWmtTcmVhY3lFNnpFSGQyTThUV09aTVM3WEpuTitOelNsTGdI?=
 =?utf-8?B?cFRUTVpwME54VW5uc2ZtejFjUWg0WmtmZzlqVmhjZGlHYjE3ZkJVblRwbGta?=
 =?utf-8?B?MlBZMk1DbEtyUy9PeUhTYjFGVUQwZmlmOHhIZWhFejd1cjJuanpUTUtVdlBM?=
 =?utf-8?B?UVhKWE40MUZrOVFyUDMrckNYbmNyWWhQQlBPdjFPMjRmcjdYb0NFK2FXS0wy?=
 =?utf-8?B?bnJTOWZReEpVa3ZMb3JIdFdiTHV4V1JJWHBlMUZkbW12Lzh6cGhCWG9MR3dn?=
 =?utf-8?B?d09hdm4zb0pDdHV2c2lqS0FkOGxqWmlXcFFMRDFOVmw4VUFabTcya1Nwbjhq?=
 =?utf-8?B?TDNBNTFUcjNxNFJLN0x3ZXE3dFBlRnJ3djZWS2EvRThwdlZ3dUxzSGIvRjFs?=
 =?utf-8?B?ODdjUlBjeG5FVnA4ZGQyNFNiNTV0MjY4aHBpRXVwZGY2bGg4VjRmSWV6REhn?=
 =?utf-8?B?akJZWVJndXdZeUt3eTNtdHEvdmlvMlBaWXdvWnp0RmxQa1NNdDdQaFVKSnpN?=
 =?utf-8?B?aUFvRzBxbnpGUXhtWS9ybXpQWjRic25IaGVrYnBGTXNMcTBXVHdiZkRFak9Y?=
 =?utf-8?B?aVk0bFQ5WVBmMVdqMEYwYmFDMVM1MUcxdUNNNjFSMGNQbW5TWDVFbmJraWdP?=
 =?utf-8?B?NFRGY3hzTDNadmtFMlZZSGtURTRsVU5SZDdZMFBUV1gzK1hOY0hmVzhDZDVx?=
 =?utf-8?B?Q2dnNE9Tejk5ZmJIK1RzbXhEdS8zaEU2WlRTcG9kM2J1VS9VUC9SbWZpVzl3?=
 =?utf-8?B?LzU4RjIxd1dkQ0hFQkJQTUVZaUZqbWUvbFYrQ3lZclcvTTdwSWJSaVpzNXdl?=
 =?utf-8?B?N0phVkoxRTFQZU9aYU52L2F2NzBiTlREM3ZoK3g0djV6VTVKYjhTNkxjamcv?=
 =?utf-8?Q?SLdFSfNh6fweA9Z7JyvvcGvxy1ZaNA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NGNHcGpjOG9qUUJoZnpQaUtEbk9IVEUyWHBVWTFoSE83b2V0TTE5VjVZZW1p?=
 =?utf-8?B?R05mS2U0ZkQwaWZpWEFlYnV0cGtKRk5OOE5FRnJLK3o5VjZZSkJVMHhoaW04?=
 =?utf-8?B?eGJiZmZyMUNDZDhHVmJ4ZlRyZnA2VUV0cmw5OEhtWkpvOUdnTTdDem51SXFG?=
 =?utf-8?B?aXJ4YWZrZVJ4a2dOTzFVRFNhTnNWVmo5U0lDNnphYTVnS3FyN2FTbUFqZEJS?=
 =?utf-8?B?UllqaTRFTllteXJQZmtOa3pabERXeU9JSUZQWW85bVpTNDZieko3bW5jbXVW?=
 =?utf-8?B?V29VeEEveFV6RHVLQjZEaUVLcW1hb3NQUFdhbmpqcnJQNnA2aWdEdWJXQ1Uw?=
 =?utf-8?B?Vlk0YWxtMExZSGtjcFc0aUxlUXp1UzJvTFlhMk5wVFFhMXBSR09DZzFIU1hI?=
 =?utf-8?B?QitmRGRqd0VWei9VK2VsUVBWWUx2VTl1VDQ5bGtDMFV2QkdhZFluUElyRXNl?=
 =?utf-8?B?L1dWb1gxQ0QvUXR2WkJiY3RsTmxicFRjYmE0cEQ0MVVWQVV0dmNrc2YxN0Rn?=
 =?utf-8?B?RERrNVR5ZElWMjkyS3BhdHB0WkRjTmVheFd5dEsvQXRmNzZPQ1FTZTRBekho?=
 =?utf-8?B?WHhxdUhnUjU3STJzRk1uK2QvaHJuVU5nUDZsVVVYcnczVm1LbVoxWFhsdnA5?=
 =?utf-8?B?WHJrMldDMzN4QXpSVTg3ZmtVdGZnSThGR3VmbFZYMXBTSG9rTGRCejM4YW9h?=
 =?utf-8?B?WU1rWDE3U2d0VE55V0hMSmZYTGVEUVZvSEw4Zm1KbkZ0ckUwV3pycks0bE5F?=
 =?utf-8?B?WXgzSEpYbGk5TmtNbWIrNGkxeU53TmFJcTlCTFJyQWVIZWdxZ0llVUtEZGZF?=
 =?utf-8?B?dStNU1RHQi8rS2hsendldzNoS3QyeDREeG90Vnp4blIxb0ErenJweUVqdFh2?=
 =?utf-8?B?SHB4blZUVElWMEw3V2tEMk1nRldVQ0lIWTA1enRBSlBaWC9INGIwdVdpQnVx?=
 =?utf-8?B?NzhzbHZINVllOVRmTzhQM2tQQUxqTXQrOXJGSk9rUHZZQ1oxVUlSMjl4ZzR6?=
 =?utf-8?B?T1ZqVEN0cUd0ZGJYcytka3p6cmZMRFkxL0hyWFBzbWcrRnpHZ0I0bTFVUGU3?=
 =?utf-8?B?UnpkSnl5aVU0c01GWE9MOWNocE1JNXJmTVVDakxzYTEzcXNJay9kODJpQWM1?=
 =?utf-8?B?WTI5Yk95M0tyeis0NnJTV0Y0K3g0LzNoaktndGwxcmhUSDZ4UXNJSXM0M1Fw?=
 =?utf-8?B?YXhpcktITVgycUZqNmxkOVJNb3lhY1NpWjZ4cEhnNEdTK1l5dTBmOUZHYWJw?=
 =?utf-8?B?YXBhUmZpUzRVTTVNVDVsZ3pMaTJYYi9abzVQN1dINkxVMWVZS1VQU2ROLzRM?=
 =?utf-8?B?YlpIc3hJR1BZU1ZwTzlUMUMwMHc1ekg1WkZwbnd5dC9maXJySzFkai9UVDZS?=
 =?utf-8?B?RFNYaitTSE9WMFRMMXZBQlV6akxuK3pBVTVzYWtQaTNFbFF6NS8zT3dVOGd0?=
 =?utf-8?B?M1J1VkR6MDRhdHc1em9nWkczMTQwaU83SEJqOGhFeTYwSHUxZUU5YXp1MzVY?=
 =?utf-8?B?eTc5cVdBSXd2OXNNeXlZVnZ0amtudWtNZ0ljM0R3Z0VnY2ZYT2sxTzJqNHdk?=
 =?utf-8?B?cEwrcVdhVVNaOWpEeExxeCtJUmVZaWhKTC9GWjYzQTV3dEd4YW90WFQ5UTVX?=
 =?utf-8?B?WVhvdzdZMDEveVEydUpKa1FhOW15Y244V3FzSm1wNm1tUS93MFpuaUp6RVhY?=
 =?utf-8?B?TmpsNnN2TXlXK3JCdkUvWmNPZWlVdEVuSXpvSlppMkdBQVZyZmJzWEptaUps?=
 =?utf-8?B?eUhmZUJMZWQrMHRSTXppU3RhdW5CQnhNY2NOVUE3YllEeGVLUC9ZWkxPSXRR?=
 =?utf-8?B?WUR1Vy8rckhUZG5jR1ZPdkd1eUNXNmszdWdCSEJxOE04cFpJRW1iTGQ4eFJ3?=
 =?utf-8?B?aGQ5STBiZ0l0R2QwcXpheDc3T0FnbVVJeEx5V2ZrcGlpYjZoM2NzK1p6c003?=
 =?utf-8?B?SXZLaXk1UFVWNW9hc0ZJSjJOeXhTRGZtV2ZRT2JzL0V6Q0twNDBGQzBBRjVI?=
 =?utf-8?B?Y0xrSDNDY0ZteS9UanAxZ2xBUlFTMU9vRTZIWjdpRnR5Nm5OY1VoaGp0dzEv?=
 =?utf-8?B?U2F4bm54Sk16eFdlR2YrQ3o4YTY4UXA3THNOOE1OZWc0NmtPeXo2Y0RxQk1K?=
 =?utf-8?Q?Berg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b457cff-a708-459f-b694-08dde0effce4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:19:10.2326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDjd11s3eib9f+9FKxRCId1fPY24iEB3rJFf9mtz0ohhiHtnzILEDhilhLRRHqmpj97vEbtFHXbeX3aWBIRaPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

Add Image Pixel Interface (IPI) support for v150. Check the ipi_mode
register to determine whether the hardware supports IPI.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 695159f463f872ee0775c271b8e1c4e1d289de20..8ccd3d4960801cccd8d24647f726e4653955f90c 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -40,6 +40,11 @@ struct dw_csi2_regs {
 	u32	msk2;
 	u32	phy_tst_ctrl0;
 	u32	phy_tst_ctrl1;
+	u32	ipi_softrstn;
+	u32	ipi_datatype;
+	u32	ipi_vcid;
+	u32	ipi_mode;
+	u32	ipi_mem_flush;
 	u32	int_st_main;
 	u32	int_st_dphy_fatal;
 	u32	int_msk_dphy_fatal;
@@ -90,6 +95,11 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.phy_stopstate = DW_REG(0x4c),
 	.phy_tst_ctrl0 = DW_REG(0x50),
 	.phy_tst_ctrl1 = DW_REG(0x54),
+	.ipi_mode = DW_REG(0x80),
+	.ipi_vcid = DW_REG(0x84),
+	.ipi_datatype = DW_REG(0x88),
+	.ipi_mem_flush = DW_REG(0x8c),
+	.ipi_softrstn = DW_REG(0xa0),
 	.int_st_dphy_fatal = DW_REG(0xe0),
 	.int_msk_dphy_fatal = DW_REG(0xe4),
 	.int_force_dphy_fatal = DW_REG(0xe8),
@@ -115,6 +125,31 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 #define INT_ST_MAIN_ERR_PHY			BIT(16)
 #define INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
 
+#define IPI_VCID_VC(x)				FIELD_PREP(GENMASK(1, 0), (x))
+#define IPI_VCID_VC_0_1(x)			FIELD_PREP(GENMASK(3, 2), (x))
+#define IPI_VCID_VC_2				BIT(4)
+
+#define IPI_DATA_TYPE_DT(x)			FIELD_PREP(GENMASK(5, 0), (x))
+#define IPI_DATA_TYPE_EMB_DATA_EN		BIT(8)
+
+#define IPI_MODE_CONTROLLER			BIT(1)
+#define IPI_MODE_COLOR_MODE16			BIT(8)
+#define IPI_MODE_CUT_THROUGH			BIT(16)
+#define IPI_MODE_ENABLE				BIT(24)
+
+#define IPI_MEM_FLUSH_AUTO			BIT(8)
+
+#define INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
+#define INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
+#define INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
+#define INT_ST_MAIN_FATAL_ERR_SEQ_FRAME		BIT(3)
+#define INT_ST_MAIN_FATAL_ERR_CRC_FRAME		BIT(4)
+#define INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
+#define INT_ST_MAIN_ERR_DID			BIT(6)
+#define INT_ST_MAIN_ERR_ECC			BIT(7)
+#define INT_ST_MAIN_ERR_PHY			BIT(16)
+#define INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
+
 #define INT_MSK_DPHY_FATAL_ERR_SOT_LANE0	BIT(0)
 #define INT_MSK_DPHY_FATAL_ERR_SOT_LANE1	BIT(1)
 
@@ -449,6 +484,48 @@ static int dw_mipi_csi2_phy_prep(struct dw_mipi_csi2_dev *csi2, int bpp)
 	return ret;
 }
 
+static void dw_csi2_device_ipi_config(struct dw_mipi_csi2_dev *csi2)
+{
+	int dt = media_bus_fmt_to_csi2_dt(csi2->format_mbus.code);
+	u32 val;
+
+	/* Do IPI soft reset */
+	dw_writel(csi2, 0x0, ipi_softrstn);
+	dw_writel(csi2, 0x1, ipi_softrstn);
+
+	/* Select virtual channel and data type to be processed by IPI */
+	val = IPI_DATA_TYPE_DT(dt);
+	dw_writel(csi2, val, ipi_datatype);
+
+	/* Set virtual channel 0 as default */
+	val  = IPI_VCID_VC(0);
+	dw_writel(csi2, val, ipi_vcid);
+
+	/*
+	 * Select IPI camera timing mode and allow the pixel stream
+	 * to be non-continuous when pixel interface FIFO is empty
+	 */
+	val = dw_readl(csi2, ipi_mode);
+	val &= ~IPI_MODE_CONTROLLER;
+	val &= ~IPI_MODE_COLOR_MODE16;
+	val |= IPI_MODE_CUT_THROUGH;
+	dw_writel(csi2, val, ipi_mode);
+}
+
+static void dw_csi2_ipi_enable(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 val;
+
+	/* Memory is automatically flushed at each Frame Start */
+	val = IPI_MEM_FLUSH_AUTO;
+	dw_writel(csi2, val, ipi_mem_flush);
+
+	/* Enable IPI */
+	val = dw_readl(csi2, ipi_mode);
+	val |= IPI_MODE_ENABLE;
+	dw_writel(csi2, val, ipi_mode);
+}
+
 static void dw_csi2_enable_irq(struct dw_mipi_csi2_dev *csi2)
 {
 	u32 val;
@@ -583,6 +660,11 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_stop_upstream;
 
+	if (csi2->regs->ipi_mode) {
+		dw_csi2_device_ipi_config(csi2);
+		dw_csi2_ipi_enable(csi2);
+	}
+
 	dw_csi2_enable_irq(csi2);
 
 	return 0;

-- 
2.34.1


