Return-Path: <linux-media+bounces-40670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A2B305DD
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225C81BC1D18
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216D835CECF;
	Thu, 21 Aug 2025 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FZc8FIzK"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301EE35CEC0;
	Thu, 21 Aug 2025 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807454; cv=fail; b=Fa16i83qSA6ZNrftO3Qia7siusGlWDGsFO6pzh6OoJDSUhVmICrxXOXKrP6SYEpWoeyRUKwOZrkpNezTwP1ypciGlfHA4JZnn98LZ0rNj3pyLS7j4c5Q+EYbJd0GYx8arHk7nCWm7h6EXpx8595aQ6sB/xdiZKnAEk8n3s1VOHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807454; c=relaxed/simple;
	bh=pjtVt1UE6iWo82hZu3iG7AmAe3NUNFE8s8Oaj11gRx8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hv8eXBaQimfGhgBitzKRcAXPhDI6HOonqWEwdtpmuorBJae8kmvwpGwZh2xlw8g7azBsGfLd1ab0ydc2n8oatf0fDaHHbyLze/HjMUKHmVYKQT5jHUN99nPJz/WG+cej1IfHqiSDHGx4vz5GWEFM8Wpy8o9YWuPWuYeJCBHtEmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FZc8FIzK; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls1iY2nlZUCEnMRt0ox8/qrG3KaO2MpWPB+xGNc7ffU8S1GRY5KcnP0XNTNhxccoM8jHVRaPBm2HkqsPtFxeh7mY7Wjiacs8pWU/DLxIxhba29NdTNoTKsGj9yfftvBeif2Pw5YIm4gw2DLinlsIsz8O9cwkwE4/tHXDfI5x//HcKn//AvBfSGbJ0CwVXFGLYp17EkxjtofQqvU5XOTnk+q2RH56P1NpFAzyxdIGjG+m+CDKEbs38QNqDFm8//mwIbE2sPctzzdaMJYo8q7F3sRuLBQjHqFreNgMfvHJxkf9sIpqzgv94dTxJLSVrZjgknwAQ09AHKz3IPA6oYuRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10dFbfEWmY6JjMAtUy3PSPRA5Vr28fbyBXNOwzFROzo=;
 b=OM5/CQlK3P1Z9Zsg4O73/IbwVg2UmuAa/FzsT1a5pPIoTBr1HUt6bthe5BxYqo3Mz1F/UrJ/xWqJ2aDviSW5/y0eHtm/VUWE+q57v+dKqj6rRZnzdheRUl9zDP8yQCmAwvrjfdn0ARXZbO6JXHw4BKeOEdRWmFkPZtAg8eubboMDCsMM1A+S+qP1+mw4m9JkrdJbUHbwFOER9MZjgIqdxoU9o8ljjTTQWpaOtWX1TVdVyEK8Sd02yh8QdUQ3qN6o4c/L1E7yYWYIgek0qogBWlO/lr6WFt+72Rj3t+h8/rQWqGgpOBZoqgV6eE4xQu0C2ORoXw0CBSWgh+gyjsX/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10dFbfEWmY6JjMAtUy3PSPRA5Vr28fbyBXNOwzFROzo=;
 b=FZc8FIzKgYrFCl15hL1yXYWRysbv82DEiMVPuXFIGkWyiG1cx17acE2A3/QL378I3HPakNELaw9Ap4lBs8QA0pmTWYvg5H67ct45mx+ALLOpGNaGZdShf9vZQqm3XT1oW3HkTsd5od8zPx7uhDgTOdeddPN5xO5631QCDZnv+MJxb/UILxAcF5nHEDhd4Eo641HGfNmURQLzM7qheBb+c5Y1minCEMTWl6lOq6dkwCx6mnXm1sSTasjroWrzbZVfsK7qxrj54FK2RhfGRwNdyVRRLRO+ZPJU/SNuy6axyPSvkUXXoIshe6+lgkQ0UJzFSPqxhNsSz5KsuZ8vazxG1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:29 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:48 -0400
Subject: [PATCH v3 13/31] media: staging: media: imx6-mipi-csi2: move
 csi2ipu_gasket_init() to imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-13-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=5048;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=pjtVt1UE6iWo82hZu3iG7AmAe3NUNFE8s8Oaj11gRx8=;
 b=15JjKviRh8wK/akL1ruS3x9GNSk9J+Bvx+ZeZ3GM9Y9kmBZB7NfO4aKTu98wD9gdVueUe/QAv
 oGIy1c+8mxnApxjeXrkZK2KjzMkwnuJwMxCOXaMR+gTunMXACj1SKNe
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 633e3de7-d0d6-47d8-6cb0-08dde0efc0ed
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?M0t2SDYySTV0Tkx1TkI0Skt6cHc3MUpYdzRxVUtqK1hIaXdFYUEwUG5vd281?=
 =?utf-8?B?TmU3T1dybnlTc2ltUXJYUVZPKy9XbGEveU1VREl4U0s3SjFTZGZ6c1BMS1BH?=
 =?utf-8?B?ODNGeW1UaU1aSVZUYjNNTWpQQlMrM1M3dm1BNGdoOG84TjVaTDM2RTc0WXNn?=
 =?utf-8?B?RTNZTmQ0UWRBOTREbkdXa3F6bWd3cWZZWnBQWk9UNGMyYXVpK1pvMldzQ1Jw?=
 =?utf-8?B?dkFZSnc2ZFJ2Vk05VWhLWWNvUDBEMXN5allYTUYwWFB1cnJhN2NHU0g2a29T?=
 =?utf-8?B?bURnUWNWZWNFYUZDeFNjNU5uS09sajVhMjZwZDd2a204elRoVXhlT2FjYkFS?=
 =?utf-8?B?MUo2eTh4Z0VBZTVTNzdWTFhXV3ZpYkFua3ZmK2FobElsUEQ4MDl5RmVlVHYy?=
 =?utf-8?B?RnRHd3JrWUNOT3hyblRKMU1SQllFeVZxV1pjVkwrUWRDaFdhaHNDaDVmSm5H?=
 =?utf-8?B?MklDdjBhVWJrSldQTytlbkpxNXg3WDZWUktsanlKczhIYjY4amx1dFJWLzEw?=
 =?utf-8?B?cjUvNTBrUEFFNzVUUml1ckhnQXdIOENjdGpSWm1TR3pKeU1Qa2huNEg0YWRK?=
 =?utf-8?B?M2hwcGhFNWJ3NU5teXRyNEVBb2VZVmx3Ykl6K2VpUkNzODNPYzBvdjNlakU1?=
 =?utf-8?B?RTU4MTdDRXZ1L0lWdnlYZVdLRW5aOTVDbXZGanBLaHRIOGRHdkVydFVKNjNw?=
 =?utf-8?B?MzhvQTNSdmcxTTFFOVNPVkNjZ255M0JPUncydm5hUnZNMnh3NlBMYlBqc3Vk?=
 =?utf-8?B?VlRCenhkUzFLYlVxRi9aQ2ZPV2VteE10SDBjUXc4Umo4TStkMWIwZ0VVZnRs?=
 =?utf-8?B?UlJyV1BjUEY2cXVVc3pnN1krZGZ1RjRvQlN4NnVaanpxdkRlaGpDOWFJYW8v?=
 =?utf-8?B?a2FCa056MHliaHJUcWpsMWc4RllVZHVXc2pCN1FkeUE0cW40bkFyUCtNRXFU?=
 =?utf-8?B?UDJPc1ZmWjFJa0x0SHQwZkhyaEthc2lqUHVITU9OTGRvSERRVG9VZkxRa21J?=
 =?utf-8?B?QzJwUTd5bUxqS1pxVVIyZ0Ztai93d3Zhbm5udzF5QTN6aTVmaGNrY0RLV0xZ?=
 =?utf-8?B?UFZ3MFNTbnNHRisxWGpsYkNuQXRsUSt4dTFhRGlOMzBzQ1p0S2YvbnBnS2Np?=
 =?utf-8?B?VHVBMWJCU3hETVIwcC9tcHlPTkY3WUpZSEF0dklwU3JIdjBIY0tTWVp1YzBo?=
 =?utf-8?B?UktzdzZPWkR4NVcxNjZielNUUUNxaXVRSW1CdGpQaTc0aExSaTk2Yktjc3My?=
 =?utf-8?B?ZWlCS0lERjEzVUFjdFBJdDNEMDRVQ0c3cDZGNS9TRVo4Y0ZWaGtIbXVocEVv?=
 =?utf-8?B?UTlFM3JaZVR3YzFGR2FjZ01BaFRNUG5QV3kwRHhDRUNid1BnU1ZPWmlLOFBJ?=
 =?utf-8?B?d3FsY1VkMm5IRzAwc1BBMUFyZVNoOXUra0Nxam9vdGVMazJrbStYYWw1UHBq?=
 =?utf-8?B?VXpnWFF0TlUzTjZ3S1Raa29nREdiU3Z6VDBnUnMzOGpIVG1WTDljZW8zMVdT?=
 =?utf-8?B?bmEzYTErR0hVZ0g0VVFWV1daWEZUR0laekdBZ1kycks5TXFhRVIxWDAvUDhm?=
 =?utf-8?B?RDZoc1BJbVJLb1B4WEk0VFNzaG9USWdscjRUMWcvb3RkT0dpeVpUVmcvbUN0?=
 =?utf-8?B?UisrZFRGUkZERzhRb1NsYmJZWURldG5VNCtBNVJ0UitPcmNrKy9YaXg5Qm11?=
 =?utf-8?B?Y0ptUkxhclowM096ZWJmbHVMRmptdGZsR1M5eEVJb0EvWjg1cnhjRzFzcVNI?=
 =?utf-8?B?dDd3bS9pY1Q2NDErRVFvSWplY01jV2Y0ZzJPU2hScFJFU1ZoL2RNdUZBNjVT?=
 =?utf-8?B?OHpKVXFkZC9GU2NlSU4vYThTVkhVcU0rcVJ3OGYrM2pmcnhnMUFidzVHTUFy?=
 =?utf-8?B?NmNPSS9WL2NwOFZYdDV6ajl0UTY2VW5XdXVGZDlSSkxuMG13UnQxS3c2ekZt?=
 =?utf-8?B?N1R5eForS1RIRFA3NUd2YzBBUEhZNXN4STJwRFI1NTEreFpDM3hPWjNramJw?=
 =?utf-8?Q?C/O6Y9I+bQwuNp/1srUgCndxZvvwOI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NTRDNUtmY2VnRmR5RjJ0KytDMGNGUGZhWTNyclJacVZmV3Nuc1BUWFNaa3lk?=
 =?utf-8?B?cHQrOHdRU2o1TmxwK2FlR042ZU5VWWwzSVVqMlV3RFhHMFIzbHNFOHFyOWc3?=
 =?utf-8?B?UjZBRTEvR1FmbE9jV1VrZnkrdS81MUdzZzNZcXVtdDN2ZEwxTmI0VVp2SHAz?=
 =?utf-8?B?dkdrc2xqaE1reXJxYzJneDNHMlJMZDdrL2VXNXdSU1lDK1FRVjZCM1h4amNE?=
 =?utf-8?B?djZYcFFyTVNSb0ZRMkdzWmlYeW54RG5xRXh6a1plKzIvTUk5VVBQNVg0Nlhp?=
 =?utf-8?B?bWxvVnU5S2ZJa0RZTWg3MnpVYjlscFl1N2REOVZDN0JET3gzaG1NSFJCOHpW?=
 =?utf-8?B?cUFTREZMd1hZYnNYOFpSQkt2VUgvRTB6b0UwamJ0Q0w4SmxsVytMUlNESkFR?=
 =?utf-8?B?bUJtUVJ0K1J1WnZVTFpjMWdGK2d6OWswQUpOY0dHRHlxNTdnYjlBUkNhNWlJ?=
 =?utf-8?B?UGJOcmFWUFpRNzA2eVZVVGRiZFJsTmlaKzRXbGYzQWMwTkRpd2MvSUFnVHN5?=
 =?utf-8?B?OVlLRFVaWlBpUVE2L1FoK1cxendDWGplT3c0dnM4S3Q3QzZMcExPK0hyQ0VG?=
 =?utf-8?B?T2lvcjNVeVNWaGRxUTBSSnptbmdQMnNXN2tyTTU1R3o3QkFlSlFLZ3ovdVJo?=
 =?utf-8?B?cHNxOVVoT0tNQUY3ZkpjeUFMak82STJqY1Bkcll5ODNnQ3RuaHZ3Si9NSnNW?=
 =?utf-8?B?QnZrZHAxcVk1Y3lVQVJPMGluZnZqZDJoQldkZk1QRTlMU3JwTlRJZXBDbys0?=
 =?utf-8?B?QVdsQXNPNlUwUTlmUnVUZ09zUU0yek8vckVZRzFlRjNmMEY5UHBMVkFMaEUr?=
 =?utf-8?B?ODhYRkVTNW1zcXhVMXg0bWszYkU0ekdZNWcrVWN1bW00OTFhMDVRQ2ZIZ3hP?=
 =?utf-8?B?T1hvVGpMSjc5NW1FR1JKbUt1QXEvU0pKZmdCRC96UHU4YWlyeFB5WVp2WmNL?=
 =?utf-8?B?RW1qYUhaaUM4cDM4YzNtaDZhYnZoZWE1S0kxblVJOUN2akNuOHNRbk9OWVJT?=
 =?utf-8?B?VWp0ZStRV24wbGVIVkpRWjEvQjg1d3JaVVY1K1FoUk0rN0JHaGorMlRpb1Y1?=
 =?utf-8?B?anRtVFZGK1IzQ2dLRHNTVzhic2dzZW80UjhiK3EyWUFCd2k5NFM3aFovN0dj?=
 =?utf-8?B?TGFSVzIwbEtCTlJNWmc3cnNyNTBKLytFN0tGYkhnanZ0VWw4MmhMNzFJV1Yr?=
 =?utf-8?B?Qi92Y3lzMVhsazNOc0RhZTBhQXdHaDViWEtEMzNDSDVyYVFyZ3ByT09qa1p3?=
 =?utf-8?B?eGNLQmtIUkZlalZ2QlZ0SlVsYVcvUW1HczNWcXpIaElRUkZ4a2R5S1A2QnNr?=
 =?utf-8?B?QW5JTHFtd0xZbnNNZE1hWWxOUUw4UE80U2d4QjJzRVAyei9XVUsrK1VLaUFX?=
 =?utf-8?B?aGc2eXVEcDF6LzdJeVRydFhqOWl6T24yd1JDdUQxc0hVZm03TWNkZlpjMUFh?=
 =?utf-8?B?L3Q4eXRSYXNlMEN6dDQ2L2tRVmc5djg2cFZBUldlbTl6TC9vdDFEL0lCbmRW?=
 =?utf-8?B?TmZYNkRBZm1YV2lTVmZGQnpDaDFWSGFnVHlTUFdqT2NDbWhxaGNaRXNRbjdx?=
 =?utf-8?B?VVJsVVFpTWxMWFJaZC9DUTRHamM0amM2UVlPQldXcnQrY09BNnMzSENtc3hm?=
 =?utf-8?B?SHFPdDlBZjEweCtOZ3pDREFwUnl2clJFeXJNc1dsdmZXcjAvYzFHYVYraENN?=
 =?utf-8?B?aVhGd3BGMnhaUzNUQkpNdzgxc0pXVU9QUk9mUjdkR2RvODlMaUtXN2VPMTZH?=
 =?utf-8?B?UUpQVUZsaFRwM2E3ZkRSR241b1pmekFCYmxBcEQ5c0xudFAzNE96bzlsKzVC?=
 =?utf-8?B?UjAzYVl2SkMwdWdIVVNtK25BdlVtUlFKck1WUDRLVnRka3dVdVpUL0F6eVJp?=
 =?utf-8?B?N1J4N2xEQjhEcUZPR1dpOWtUTmJ5enBWSU1ZVmdTdE9JTHppa2F0SlVJVU10?=
 =?utf-8?B?VnN6Tzg2RmlJSWczYjdyRkp4Zy96MlpFa2VROHpuUE5QSzhKTW16L3VRTVMv?=
 =?utf-8?B?ZUs0b093YVk3cFdZUmFrcU5sSDNTOGtlUkdpcGFocFdmWTF6MGt1dWs5bEt0?=
 =?utf-8?B?bHlVM1hwYkZXMmg1M0tGU1p5cUV5dm5xdWk5RXVuSXY0ejFPdGE0SlprZlRE?=
 =?utf-8?Q?9Wcw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633e3de7-d0d6-47d8-6cb0-08dde0efc0ed
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:29.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQgVlS4m0849nfQPmXKyPeJLFY83pvpI8bejT91gnqHwjBJnTh2iOS6XBu7RmC9Wm6+WLRHQNf681K/RfYGm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Move platform specific csi2ipu_gasket_init() to imx6-csi2.c.

Create callback function in struct dw_mipi_csi2_config.

Prepare create common library for dw MIPI CSI2.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 28 +++++++++++++++++++++++++++-
 drivers/staging/media/imx/imx6-mipi-csi2.c | 28 +++-------------------------
 include/media/dw-mipi-csi2.h               |  6 ++++++
 3 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 66274d8d73b67b35682bb82a9eb745bb24da7ae4..b7ea710df07cba33465d79ef57be4792c503958a 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -15,10 +15,35 @@
 #include <media/dw-mipi-csi2.h>
 #include "imx-media.h"
 
+/*
+ * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
+ * not part of the MIPI CSI-2 core, but its registers fall in the
+ * same register map range.
+ */
+#define CSI2IPU_GASKET		0xf00
+#define CSI2IPU_YUV422_YUYV	BIT(2)
+
 struct imx6_csi2 {
 	struct dw_mipi_csi2_dev dw;
 };
 
+/* Setup the i.MX CSI2IPU Gasket */
+static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 reg = 0;
+
+	switch (csi2->format_mbus.code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		reg = CSI2IPU_YUV422_YUYV;
+		break;
+	default:
+		break;
+	}
+
+	writel(reg, csi2->base + CSI2IPU_GASKET);
+}
+
 static int csi2_registered(struct v4l2_subdev *sd)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
@@ -40,6 +65,7 @@ static const struct dw_mipi_csi2_config imx6_config = {
 	.name = "imx6-mipi-csi2",
 	.internal_ops = &csi2_internal_ops,
 	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
+	.gasket_init = csi2ipu_gasket_init,
 };
 
 static int csi2_probe(struct platform_device *pdev)
@@ -50,7 +76,7 @@ static int csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
-	return dw_mipi_csi2_init(pdev, &csi2->dw, NULL);
+	return dw_mipi_csi2_init(pdev, &csi2->dw, &imx6_config);
 }
 
 static void csi2_remove(struct platform_device *pdev)
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index ff06a739b957b305625d145c04c06999d0c13cae..e5593f23253b92def63040fa70fcf5fb50ec2fd2 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -92,13 +92,6 @@ dw_csi2_reg_err(csi2, #__name))
 #define PHY_TESTCLK		BIT(1)
 
 #define PHY_TESTEN		BIT(16)
-/*
- * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
- * not part of the MIPI CSI-2 core, but its registers fall in the
- * same register map range.
- */
-#define CSI2IPU_GASKET		0xf00
-#define CSI2IPU_YUV422_YUYV	BIT(2)
 
 #define sd_to_dev sd_to_dw_mipi_csi2_dev
 
@@ -288,23 +281,6 @@ static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 	return 0;
 }
 
-/* Setup the i.MX CSI2IPU Gasket */
-static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
-{
-	u32 reg = 0;
-
-	switch (csi2->format_mbus.code) {
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-	case MEDIA_BUS_FMT_YUYV8_1X16:
-		reg = CSI2IPU_YUV422_YUYV;
-		break;
-	default:
-		break;
-	}
-
-	writel(reg, csi2->base + CSI2IPU_GASKET);
-}
-
 static int csi2_get_active_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int *lanes)
 {
 	struct v4l2_mbus_config mbus_config = { 0 };
@@ -352,7 +328,8 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 		return ret;
 
 	/* setup the gasket */
-	csi2ipu_gasket_init(csi2);
+	if (csi2->config && csi2->config->gasket_init)
+		csi2->config->gasket_init(csi2);
 
 	/* Step 3 */
 	ret = csi2_dphy_init(csi2);
@@ -700,6 +677,7 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	strscpy(csi2->sd.name, config->name, sizeof(csi2->sd.name));
 	csi2->sd.internal_ops = config->internal_ops;
 	csi2->sd.grp_id = config->grp_id;
+	csi2->config = config;
 
 	for (i = 0; i < CSI2_NUM_PADS; i++) {
 		csi2->pad[i].flags = (i == CSI2_SINK_PAD) ?
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index dfd25e23ea93fd53b064471b6a9557ef9c070fe7..d3e1c334df692c5dff10b467d759fe4da45b7b5f 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -9,11 +9,15 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
+struct dw_mipi_csi2_dev;
+
 struct dw_mipi_csi2_config {
 	struct module *module;
 	const char *name;
 	int grp_id;
 	const struct v4l2_subdev_internal_ops *internal_ops;
+	/* Deprecated, should go through phy interface */
+	void (*gasket_init)(struct dw_mipi_csi2_dev *dev);
 };
 
 /*
@@ -48,6 +52,8 @@ struct dw_mipi_csi2_dev {
 	int				stream_count;
 	struct v4l2_subdev		*src_sd;
 	bool				sink_linked[CSI2_NUM_SRC_PADS];
+
+	const struct dw_mipi_csi2_config *config;
 };
 
 static inline struct dw_mipi_csi2_dev *

-- 
2.34.1


