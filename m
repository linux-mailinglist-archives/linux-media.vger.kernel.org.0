Return-Path: <linux-media+bounces-40995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8AB33C39
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C8283BD198
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067B2DA779;
	Mon, 25 Aug 2025 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OHt15VP9"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F01231856;
	Mon, 25 Aug 2025 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116638; cv=fail; b=mJjfoWKe70S0EnXrrwYbL/ZjlV4k5oddOXYvg1zI1SWLZqNt4pZ+p+Wc41OXGtsPZ1fahgBoiaG6dU3aQ8vyzXZ5loXW3qtbJXnkgVkYWotIL85YgD51M2yIa50KAkyLmHR9Yp3RIqmrCK/E4C3s5XfsOuXVVFJXCobrF9uas9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116638; c=relaxed/simple;
	bh=3bJJ0njQNrO5/8nPmDCi05yYGuVTFGMM2YLoMNm+YM4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=PP/P2/HNJuGD3vvdFTSYX4PRwl5SS1c363sig5zxXEzMPzlQlER0IalClKGsjZVfjtRy34O6A2ZZbYBUX9mH6pcjek2Lo9w2rRjMKSvf2fzmS0mw6aoFqt3kx5Rmj706NqDyxRy3rapf4Sbxc0bSBBrt+jdXxPFGuOnjLQiCYXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OHt15VP9; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmP1fdOhwpHkKnqMwd65R8dJ3ohJuIvWqPk843CdEOk5/FMtmq/Ovz5jqe2M0vNvVjjCFRR9NM7JbssyfYM5tFG1dQZ9/+2eAuRGwc1RmzeG0JnKG4oWyS/kKiEanL1wmxTFO91XUFlWTA3E7so2xBgMKIJIG+XO6zqYMY0Zt5DFjgXYZQz+y9kWZQEP/uPIUK3hdGO8xP+4lcV3lXjMoUyxvcM+G2nCj9Q0K+ZNefHEcIygpEMDcyONQayDL2s5YSlziSGSTQJRg7B/C1qAgln3p6WLHNh8DYiAuvOZNP1PWXZ9xjHcXP/RsXd2MEJl8dgfcOpVjNNXHOzu3y41Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7bquPv5Xba6m52glsuTxUtbFUeXRkcQLRlsaCGrzs4=;
 b=I89hj2K7D6cPAfawKtGiObb+NFn/gcWfxSwM9epiNmBhufYdllyNp/IMcnmSKaa7jrrehaRyShAPw8ZN/Q/KxdeCMVM3Ss7hFcVdqCo1gOp/8pr8VYZlURnDVsNnL89eic9tFGuAFMBDy0nPtVkx+DiRJlYkIdD1e/geA5zpbMy3/timh39nj/JYWE9RECyEUQWN3DEYbcIYvlGILFwa8cHsvjBCUnjWR+N38YUYcp6s1aNyHwJlyRhkippWmJeVzkGh+9H4jOzQhDpheNqDebqH5qUxfn3iV2UYmtAS0vf0LI4iIrKmaEZ+hWFWjsiPliWYFdGaXVm+vx7ceHDgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7bquPv5Xba6m52glsuTxUtbFUeXRkcQLRlsaCGrzs4=;
 b=OHt15VP9SXJDSoNxyI86I3bOQjCGQELOyZqSJUJ5+LgmFinO58Ni2OsggnB9CQvF4mBuibLHvS2qjIvWcjGSbI0roGWaa8l1Ploohk3Cqy6tT/nvt+O0CPbZXuw6rBGBJHefKkTfUrwS4WZeHe/XFwZmnIJVD8BcXzQVi4xcMGJtanZLMWE8Z7Al4DeQxP2cl3t5EkcHSNSqBCMpd49Iphkw0oNE+dIa8LIuK/K5WhgViy9wlamqc9mvaCs+qYf6J15/wnlgR1P0UpMvNclHYB/IyPxRzcq8vyu/w7mxrelQf7hOwas1YxNjl0pCQRF7bjxHItxyw+1ERm0wLwp4EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Mon, 25 Aug
 2025 10:10:31 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Mon, 25 Aug 2025
 10:10:31 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v3 0/4] Add MIPI CSI-2 support for i.MX8ULP
Date: Mon, 25 Aug 2025 18:10:09 +0800
Message-Id: <20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAII2rGgC/1XOQQqDMBRF0a1Ixo2YnyimI/dRpKiJ+qEmkhixF
 fdelRba4R28w1uJ1w61J9doJU7P6NGaPfglIk1fmU5TVHsTSCBNciZp4xHuOCx5eIxUqprnmVJ
 ZrVqyT0anW1xO7lbu3To70Kl3uvpF4ICAxyxhkouUMtoFazDEr96Gwnofm2WMGzscZI9+su55H
 pzhgD8MwP+XGWhCIauEEFwKmaXFVym3bXsDTQl0pukAAAA=
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756116629; l=1722;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=3bJJ0njQNrO5/8nPmDCi05yYGuVTFGMM2YLoMNm+YM4=;
 b=egT5kfMqH0hW1ZIqLZv/CF1tBFkGK+jCOkOc8oSwhhvX0FIYkUAZZshMpRMyOgKdpRvwJgUqQ
 4uO5VXr2Nm6AMDW6WYlVP7CfcnfXJ+09ZVso9QgiCCDSrxjgaHgKMz4
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI0PR04MB10639:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c7c2aa-77bf-4525-c7a5-08dde3bf9fba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T3oxN0g4VjN2a1FVTDFzT2Y1K1ZqeFp5SjVRb2I1UmJ3eFdMQ2FtbkdQNWZy?=
 =?utf-8?B?cVprbmo1Q2taVWw5Qi9FTHJoc09XQUpLelhFcjBuVlF0TysxQnY1aVNreEJk?=
 =?utf-8?B?K3dQcVFhZjJGRmIreVMzTlhOazBSNmk0UkVxWWd6L014ZDlQVjk0WTFCZGpC?=
 =?utf-8?B?aGdWQytOM00vRU9SNDE3VjFZZzczcmhwTndnQnZReU1LNDhOVkNTcFc5Ly9p?=
 =?utf-8?B?ZXdVOEVEZlU1YmdFd1p3S2pPWmFZU2duN2QxNzk3QWlndkVuOG9CZzZ5dWNJ?=
 =?utf-8?B?RXNBbFdpU1MzclNUUWhGWVU2YVpZQ3pPc0JEMWJoR0FEenk5OGQ0M0E0RDVO?=
 =?utf-8?B?Z2FUajRNRjJsVkJWL053cXlFTzlVZDRKUTRQMlhOUG1mM1VySmNveWRoR0N5?=
 =?utf-8?B?WTBVV1UzU2ZTcUdYRkd4dTRhVnltYWpSQjdFWmZxSlNTOFgwSkkxZHh4cnd4?=
 =?utf-8?B?akRJc0gvY0liT1BQUVI5OUdkUWw2RlljVXVLZlkyeC8rd3E0YVBieXQ0YU5M?=
 =?utf-8?B?bUQ5UUN5Q21RQ1paTmFOVE9DcEJYVHM5TThlNmV5bG9tMFVvcmk4Q1YwclhO?=
 =?utf-8?B?NSsxYXhrbDIvaitjSll0MnVzbkZaMW1JZGF2U1RTYmpFNnk2NWRwci84R3Nw?=
 =?utf-8?B?UkR2VWlpY2RxL3J0c2hURjN0Z3hrbjlGbURFRTVWMmU3Z2xnVXpUbitDMldI?=
 =?utf-8?B?ZTFKQVoxN0N1UDdZZVJ2M1BBblVEOXB3b2VvUCsxa3p4QzVUR1Fsc0RQYUJy?=
 =?utf-8?B?b1RUQWdia0kyU1Q0K0tvSUZ1QzlIR0M0UUxCLzQ4MkUxYjdLb2V5Y0toaWZC?=
 =?utf-8?B?VmVMUk1RcXVXUTVoWVY3QjBGSmpWZEVzQnpUajc3S2JMQ0JaQmJSazd6UXph?=
 =?utf-8?B?QUtEQWpCcG81MWRlblFkWlZaVFVqUG44QXRRMnoxckdqQ0ZrTUNZTFVPbVR6?=
 =?utf-8?B?eTJYbWlmRW8reHU5R2lzMjk3a3BweXZIem53M3BLcUl6ZjFNcDF3KzRGTnF0?=
 =?utf-8?B?dlQzR01ldDNmVnpXMm9raXhxWU1SWmlWbkVvTE5nUU95NXY4cFJ2VHluQy9r?=
 =?utf-8?B?VUhIbGRFUDJRTG5hSWZuZm0vUXNiamVzNFJzQXd5NjVsTlZXNnpUV2VHNWI0?=
 =?utf-8?B?QUMxaDBsRFdCK0wwelVtWjlOWHY4bVEzOXRpYWd4TkV1N1R2SllmbHBMUFdE?=
 =?utf-8?B?RjBMUHc0UzRQbWZyWkJFakVNc3h3ZDF1WU54NkVPZTVPem9LZTFFclZ3b1dk?=
 =?utf-8?B?dlhmbTNsM2NZbGpzUHg0U1doTWxSRmlWbXFCSm1SVmRTeG1EZFB1WDJoaXMz?=
 =?utf-8?B?TFBvR0lrTlB0bzU4bkJPckQwSEt0MGplTnhPck1ZVTdjUE9ndjc2RTFZY2pY?=
 =?utf-8?B?Y3cyZGU3cW9hNGdkSlpSNnBPdUVwRXhYZ3orNXZUbHI3aVRQT2dvNngrR3Fx?=
 =?utf-8?B?MElpVU0rbXhoZGJtQk85T1RwdC9acVpHTnhmbGpZVG5PWHJkWE1OVXpiRlF5?=
 =?utf-8?B?cVUrbzBETVphbWpyek5WQjNkV2hMelR1RFJhV3RuSng1L2FwTlNsVVQ3VmUv?=
 =?utf-8?B?bkVkblEyVTM1dWZDNzM3dFJjdFloUWFBM3FXTW9KNUZwN0VQeUJxdk83dXFY?=
 =?utf-8?B?THRzU1VTMmNvUjVtTkxwZDRKemVhY08xd2tpSEFoeE4xK2JjNnY3RXVGZWlu?=
 =?utf-8?B?b2ppeDI2ZVlUNmtENXpnZXh4RldMNmgyUnhqaG5NdjdzdEc1bW40MXphZVhs?=
 =?utf-8?B?ZTU5ZTNMeU05TGhnQUx6SGlSelI3RGdsaGg4TThRbG5IeDJUZURWQS8rSk1C?=
 =?utf-8?B?c3ZqdTExRjlCMnhUbHhZREY3N1VxNnNja1VqV250RlI1NTFoVVJ4aVhGV3E4?=
 =?utf-8?B?Q21xQU1yeCtZZXdFL0RwY2MvS3VUU1U5L3ZIQXQxNU01eU1heXN1akhuVWhW?=
 =?utf-8?B?NGdUN0NtK3crVVVUNVZXRnlRWGgwdnJqYlhHbFZhc1pUb3dERVZZaW5GdHMw?=
 =?utf-8?B?Ukg4NnF6U2xmOUdNbFExOXdtc0tFN1dzNzdKMEttLy9TRlp3QjhNN0Vaclhn?=
 =?utf-8?Q?gvNwXk?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TFB3VW9KcWozQzAvNUU4bzllcTIzN3A2OEJoQ0liVWlJbWF4WDZsaXhnYmlU?=
 =?utf-8?B?ZXJ5Y1M2UlM3Rm9GYWdlNGp0NEpPc25qNWJpNU9VTG9hWktXcHd6b05OSW9P?=
 =?utf-8?B?bDR0Q3hvczcycmFzZmppN1lsb3RVd2k0RnRmdXZOeEhMRzBDSlVUZGk3bnFx?=
 =?utf-8?B?YXNqeGJSV2FTMFEzVXV6Z2xySkNCWXFnZW9ibU1HakNLdXh6Wnc1T0ZRbVlG?=
 =?utf-8?B?ZGtES1Vjc2NkZStGc3lRdjg5cFJPV2hMcXlJWmdIMlBZb1d0VUJtRmJ1bXc4?=
 =?utf-8?B?eVRscVpzZDNzK2ZLektsc3l1Z2VsQ2s2OTdTWTFTd2pIY056OEdTQ0FBdk5u?=
 =?utf-8?B?RHNaT2VnS1R2VnR5aUwzZWRlUzN5T0FMZEYxM0d2QUR2dVU5NE1rZVVLUlZK?=
 =?utf-8?B?YWw3UW8yN3c2VzdZOGQ5dXlwUWw0dG9yVUl0czJZNkF1M1l6U2xneDJldGxJ?=
 =?utf-8?B?YWJ5bWovWEZoYlZRZXZwMVZNTTV5ZzYvR2ZwVlBrVFFyZldmVzRxc25xQi95?=
 =?utf-8?B?dE4yZ1VQbG5KenptcTd4UUkvTlJDWmJyZlpRM0I1czZUOVlyc0RUTitPaXJ0?=
 =?utf-8?B?Zkl6UlRMZW11U3pxek53cnNQakVyRmJpSUZDZnEzaVlIbldFSnluV3dYT3Jx?=
 =?utf-8?B?a2g3VThQdmlrOENnVmNMRGZKSXNLcWdwMCtaeHJaZjNhVkdZWmo1WHJSS0hK?=
 =?utf-8?B?SXovSXVxc1RhckFSdFgyVDhDZGhXaEhpR1JHTlJyT3ZUb083MDhmaDVlZUl4?=
 =?utf-8?B?NERXUmxtenQvbnllWW54NnhZcGFERXdXQzJ6YzJxb0o0akVtMkd6Mm9yV3lp?=
 =?utf-8?B?MWVEeE5KWm1maStDSkxtUjRGdnl3bEVUWXdsRnFSRGtKbFRZbW02OFBBdkp3?=
 =?utf-8?B?SXFMU0ZOdGlUOW4yZGxSQk5mZWFuVXhsWVMxelpaK3o3R3AzT3NCMUl6S3dE?=
 =?utf-8?B?Y1ZBSzJVeU5MQjhNNCt2TWVxcXAxK1V4ODRQb3l1QmFFN1lzRlhDQ1FQbWw0?=
 =?utf-8?B?ZzZTRXByT1F4ZEtnV2JMT2RaMHJ2VmxFa0I0RFRsWWowNkd2M1h3YXBEZlpZ?=
 =?utf-8?B?LzRxMjA4Q1dKVkNuSmliY1hKL0NESUZiV3UzV21SVU1ER0hOTGFCeFNuOU03?=
 =?utf-8?B?MjJqcUFxMUJ1eHZzWW5PSVZCMzBCclBkd2JpaEJuU1pqSGpubHB0ck1nZ2ds?=
 =?utf-8?B?eEFsT1Qzd3VSN3hkdVRVSUYwa05PSmd2WTM3MTZXVkpRaCtQci9DczAwMVZH?=
 =?utf-8?B?YlZxam5tQlFkZFRIY25wUy9xcGNYOElZZ01kaWZ3QjhFSlhHWFNCVk00SXFS?=
 =?utf-8?B?ZVQ1akVjREg0eG02MTN5ZzJZaWJrQ2pnSDNOTDRQQzZ5NFZtbmhkOHlDZDht?=
 =?utf-8?B?SlB0ZC9LSVlteExoMU9hbWc4bk5BN2k1SVFTZVZnWmdveE9vZmNhU3BTaWxk?=
 =?utf-8?B?U2c3ZFJ4aVRKNDBueGpGd2p0RTEyUnl6K084UUxTSm1tVTFBVDZka2l3RDU0?=
 =?utf-8?B?NG1hOU15Q0JVb0ZQd2ZhTmYrWDlINEpLTjlxZkxuS0N2QTdkaEQxNkJFK29S?=
 =?utf-8?B?UlBaS0kxeXNHTENlb2F4NThCZ2xJVXNRUzN2T0Noc1lRakZ6WFVxNkh2VlRt?=
 =?utf-8?B?YXc3bzVYM240Q0orWGdDVE44aUp1WENBN3BJaDIrOHJqZ2ZqcndoTXBDMFYy?=
 =?utf-8?B?ZFFkeWtTcG1ZN2xWVno2UEthNXE4S0dOaXliL3gydUJqTG9MOWpFUTRZOVhE?=
 =?utf-8?B?T0ZPSWVXcTJybnhSd2VJR1JOLzFwTjdKRGFZVnhzSjJ6N1Y4R1NJYndFZDR1?=
 =?utf-8?B?VEltcjFCZHJvTmFFMWFWV0N6MDdqNXBtaXNVZ0Y0M0tVY3Z5eTJrcFJ4aVND?=
 =?utf-8?B?NFlrQVNRNTdHNXZyeE9BT0Rjb2pnZTBOVDlrRnRqWUo3VmJCVnd5Y2I4Nlh1?=
 =?utf-8?B?cVpBam5LZzlVR2srYlFHaEZ1K2FyaDRENTF1NUJmZGFYbFRXQmV4UUdmUkRM?=
 =?utf-8?B?WklYbjNLdEFHQ2xjMEdyS2d1NHA2UW9IdGNBRkZYNktEZGtZdDcvMkFmN2xw?=
 =?utf-8?B?YTlXZUVXc2hNV1JoeUNxaUNWcERDN2VWUTVSTnJJOURmWEN0TW96Zm1sRm5C?=
 =?utf-8?Q?iYf/85AThFm9fvng8/SIM8rB+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c7c2aa-77bf-4525-c7a5-08dde3bf9fba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:10:31.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5IzQuOy5gqBOHpBniYEzijj1Foji6RrkbZerVnwFrxVdLNdVSaI6IxSYj8XVA37z6uC0Cs6r5LA+j3fb5SZXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Correct the order of "fsl,imx8qm-mipi-csi2","fsl,imx8qm-mipi-csi2".
- Correct the order of minItems and maxItems.
- Restict all variants.
- Change pclk clock name to csr to match IP port name.
- Align description about csr clock with IP datasheet.
- Add reasons for adding a fourth clock(csr) in patch 1 commit log.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com

Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (4):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 40 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 60 ++++++-------------
 3 files changed, 122 insertions(+), 45 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


