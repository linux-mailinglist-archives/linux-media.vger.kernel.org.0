Return-Path: <linux-media+bounces-36480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B474AF0643
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC3D444345
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA66309DAF;
	Tue,  1 Jul 2025 22:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nloCsyt+"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7A3093D7;
	Tue,  1 Jul 2025 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407614; cv=fail; b=ji761vnZwENOWzT+0lF5TXZaP4YL1kkVujECoQlbbxdmVGMcmGvpptOO8xToWMwMgYdpBHaTM4Xnr18KCBjwet97QHX0mX1EdNzMSb7diXZCcOmY5nZCYMlxsDks5E16y2xeMFob2eUQFLJRsyqySr/TuuoxANhpt0f0AzUXp/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407614; c=relaxed/simple;
	bh=mYMK8a8YaSKU0g/3tO9F6qC6KrHeGNSFo+W1zeOKT0I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IzPHK484Ee+DaFSkHMLu9z3qw5a8u1kcHtHa92GvJ0DTH7bxuhEdRMGvVOkb2tOhgXsb9GnnQaQKd0YO1uWEzCqsN67Yi1VfFp9r0zy1WjFWREG+ObwCnr2pgcnl4CPGnynMrFNIjcy4jOrKPW0+WJvxyKytH1K12xj/GefLj8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nloCsyt+; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl4WMmMPDZKoLnIO2Iu+rnv9zOiayeVnndjv4pz9K5oWbahqHEeYdwfhEvDTp4pvb82/TWo0cpUmVfGa6kaxZu7LCM7jZiMZyCz5ZwRT9icZHcAoZWd+uiZ9kNtrCK+qdE6KW/FhNHGppbW9kEGDWqTcx0a8j4Xz5oAfK6qhOL0MZobe3UYPpQWTVMxFYwydeDSTnaHRXms2Q6/Tm7B3WxLVIJQRMlBwdaMKgULkn+BWUxerNU+wXd6QlsaDElJUCsOmoiDpCEBIUnXNPChRgYK41andUzf8T65sf+fK3OGFHjN4q3NU+UJWDC6x8IFtBKDo9g05zvSwLwEsOzQz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7amO0DFwct7ZCSdhd+R2zCLB0lIPqGJqvAJllJPkiAA=;
 b=IBtlKssp2irlugZnr5tSVDCb5r+bIj4D8b87jyWi+CI6SVsIjE2K0EnNcPLvJw2B0WPfdbB6AuFjV9Cs5IR8tTBVYuS15eZh7p2wKP7SsMmse/BTa0zH8uDdU6ld443I+GelTvRnPs39BbmjZ9K+c4G8O6t6280g0iYD/1PD92J+wvmBP+vayvdEakiuv2p1mL7MolLAAcmvt3IWXPXOcIKnKUc/SruLABYdBLVwk2jJdoAQIcf7CzQsLxcJZlKL6CLmG8PSIxCTepqIJutpW4iFHuKAzIs1falKAjwNXlNZONgXsKqPDZMK/+di/KSx5RwIfjHwMF+74xi/vahRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7amO0DFwct7ZCSdhd+R2zCLB0lIPqGJqvAJllJPkiAA=;
 b=nloCsyt+vt8/xIpRP2H8Bew9Cw+dXUAAB/MkH+CsSbAtUY5cgffkVlIRunPo61UbG8sHHqjCvuMz2VpAIv++fnoX9PT8nuO53RG33B/GdrBLHrXTpLMuX7ySyguulcvq7wae8goI0L53Ezj+8h32HXpCaxLqKcNK5SaQtfQD3eBp4DiWkXMelayOFJ48u98yRVK3yhobElEIHApkaxL90mYeZygViA3tiFtLUdlXLPn4lAhAGUXKZ3zmmGRA0d/vUhe9/bO9sZXNLuKo8oXC2gk1XhKErYaiKL8GncsWmFCm2X/p9V47KlGy6bvLBHnsXQgId4yUSGOuLJYL63xfuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 22:06:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 22:06:50 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 01 Jul 2025 18:06:09 -0400
Subject: [PATCH 4/7] phy: freescale: add imx93 MIPI CSI2 DPHY support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-95_cam-v1-4-c5172bab387b@nxp.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
In-Reply-To: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>, "Guoniu.zhou" <guoniu.zhou@nxp.com>, 
 Jindong Yue <jindong.yue@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407588; l=12364;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mYMK8a8YaSKU0g/3tO9F6qC6KrHeGNSFo+W1zeOKT0I=;
 b=V1l8T6lXbx2UV2o8wmbgh2A8WM6DXQWTmm8CkALGki+RjQ3Qx9zp6JBUAEhw1kDJWH3QKJv7Y
 5v8J4tUKgGADQMEhhiAwV36fuXSOKxIvtQLkcl/FwQ69jc7mFVbREZH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d15c71-c284-4e98-7ebf-08ddb8eb941a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Mit0Q3crczdxY0xQL1ZOMjJKekNSUCs0Z0FYaHFUdEtacmdhZ0NsOGo0cVpx?=
 =?utf-8?B?MFJCN0dxN3RSRUI0bUZENm4zR1p6UllreHF4TXFLbjAySHdqM082cXpJam1l?=
 =?utf-8?B?andCOE5ncWp5VUFyc1ZxbFVnQ0JHTzBYc3I2R216K3hINmRhNjZFNzFKU1V6?=
 =?utf-8?B?dHRkaWlKcjk2RG52ZEcyVnJRYzMyQTNCc1ZKd3NYUWtpMHhHZS8wcFdXUkJU?=
 =?utf-8?B?a0wxcGY3ZFB0Y2tlck5wS1k3YkxMUVBZMzNiTE45dGRXRWRTOVFOamNNOTNy?=
 =?utf-8?B?M2Q4OStTY1pPMjZoSEk5WnJhWitqQXVJdzZIR3IrcU1JWUtzcFpZaHBTSXFy?=
 =?utf-8?B?UVMvdXpRT0xMWk1QNGhMRlZ6bng3RUM5bkxIcUZOVDV4RXVJUnJMWHhtVWV0?=
 =?utf-8?B?aE9rRU9uU1dZMXVVQjk5NFRHekUvNVZBcWkycm9XMXJERjhCSkR0OTNZQWRz?=
 =?utf-8?B?TWxtenZ6aFdzUXFlcWJMSS9SaXU1OVc1Zk9nVWQyTURpMFZMeVpMSXJmMFZP?=
 =?utf-8?B?TExjTlIxWjA5dVZJVFN4NVdUZEtUZ1pMZmdqeUJzcXJxcDhsRkpoQmdTU1lS?=
 =?utf-8?B?dXpzbDJYSS9hVUVWbnB1cWgzSEkxSUwyV29TSjE5RVNiSTl0VGdFSTRzZmtx?=
 =?utf-8?B?RithbnJ5TEtkSDJXNUtCdlZ2RDhyalhIYlhINVdFQWRoWGdtMnNIeDNRNXFl?=
 =?utf-8?B?L1c2WGFMTjhYRTFMNnI2YXJ4UHpwK2VXUkZjT1BCVDNYMUhhTHNzc29OZnFi?=
 =?utf-8?B?M3l0THZWM3d3MGYzdjhzLzBSd0RNUWYxVWZyRmhZYkZvTG1ZOGFuTytaakR3?=
 =?utf-8?B?d3VYRGFZemJER1FHbTZ1djN4dW4vNnVwdnRtajhGcWNGZTUyejIvRGFiaFFX?=
 =?utf-8?B?aHJFTjBONkp1YWRNQ1RBSVpPNTEyNURucEl2aFVaajArNlB6MWxQVTN5UDNy?=
 =?utf-8?B?dWxJcVlrLzNWdmZCd0VCcyszOW9DSzR2Znp3aklCWGQ4Z2Fkb0ROc3VnMENo?=
 =?utf-8?B?d2xmSmVCYkxJckFKbWlxenhtNVBsdjBBMFhhc0oxQ1RqejBzaXJtZCtHaDRo?=
 =?utf-8?B?enIwSEFIQlBjeVNNWENSRDZXT3FPTnI2VnMxSEFrSC8vanVESTNPSFI1STJY?=
 =?utf-8?B?L0dYSFd0aTMzZ3BsbkxFUHdOdWE2cHg1bzRVU0Radlg5UkFERG1ya0pMbXo0?=
 =?utf-8?B?Q3dlUnNrMENnQTRPbzh4Mk13ZTU5bnhZalBiODR4ZnBPQ1llUW9ZdXZ3WlB2?=
 =?utf-8?B?SlN0S3VmTjNUeGRFUEx0RUU2U2pOdmFyOUo4eUdMKzA1aWFxS3RPcTBnSUNy?=
 =?utf-8?B?NVJPS0JRUEVSK3FkeG5meG5sL014d0J5dXlpQUN3Q0M2dzJsMGF0RlVySFNR?=
 =?utf-8?B?RWhLSC94VmZFSytKcFdXN3NiNGVLVHFJancyRzJKMHhhRG1yYTVuUmdIdnpP?=
 =?utf-8?B?MXlLWVhuYVNDVzI5ZXpDcmpwNFBmZDF3Qy9LVk5CU0xQSGQ1YytjV3NheGQ3?=
 =?utf-8?B?Skc3RksxU3I4T29XbENTZnk0RlFmUUtBNUc0UVJ3djM4Nnp1eG1UMEw0VUxv?=
 =?utf-8?B?OFV4anZkaVRQVzRZS2YvaXFvT2hSNzllTnVsaXdZU3NFMDNzbDJ6K0o3d2JB?=
 =?utf-8?B?enNBQ3dnbnhkWEZIYU9xOCtZdlRROVd2SmRrdVRFd3MyQUVkdVM1MDdPMzZ1?=
 =?utf-8?B?ZmlzZ2Jrd3hjamd5LytvY3E3WXZERFB1eTEwd0xmZ1pDRlE2c2Rsdy9qMkhB?=
 =?utf-8?B?Y2lmUmk2SnFxczdTR2Eyc0dSRHlvdlJxMXQzL2xaVFEyTWNqWjZnWERwS214?=
 =?utf-8?B?YUZaQU8xUEcwVlVrTnhaZmFPZVFmQUZNMXR5cWtrNUpLR0tRZ21tN1pKSWM1?=
 =?utf-8?B?d0dCTzdMVVJXOCtTOXlsbGxBd3g1SDlLbU1hR3FJMmhlOVE3WmR1TTg3d1Yz?=
 =?utf-8?B?NzNNZS9jV0RoemJMTFZGdmtXSHo5N0lVV1FTZWNIVmIxVnNPdEhEaE9YQWpU?=
 =?utf-8?B?V1hXVGUvZnh0aXhTSXRDenRnUHlLY0lBSkpyeFhvU3BJYWRxUFVJQUZ4YjNV?=
 =?utf-8?Q?xjD9yM?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OFBUSW0wais5NUR4YndNem9Na0dCOEN5NWZzYllrTForaEZzQ0Q0QnEzQlF3?=
 =?utf-8?B?RmpPRXBjTkJhWmo5bUtLNTQrRWVlc1pYa0NYcjdEYzJyN1kwejVCZWlaQXNS?=
 =?utf-8?B?ZFQ2bXhiSC9rZ0kweEh0c0ZqeUpvbGtzMHNoVGNBNUZ4YktJbWVqQjRrZVJ1?=
 =?utf-8?B?YU1HMzZNamY3aWQ4ZVJCRWlnM0R4V0w0ZUplMEd6aFI4Y21pQlFlS0lxSjBZ?=
 =?utf-8?B?Wk05OEdLZXlrMVJwbHNOTjg2SU5PN245OE05S05kTFVuWmxPTzF4aEQ2V2Jx?=
 =?utf-8?B?M1U5MUtWa0pDZkRuQ3RZRUxjbW5uaVRaWEFnbldlelhPSXF3bEkwaGJLTm1Q?=
 =?utf-8?B?K2RxZnkvSWt1NDRkQ1NJbEJjd0tkQVM4cDR4d2NPOGhONFlUb0RuamVVRWNq?=
 =?utf-8?B?Uis1cVkzYWdKRzlYT3M5RThRWEpxQi9IekVvL2h2dE96OE1wK2xmNi80OW1B?=
 =?utf-8?B?N1ZlRFBQS3dXbWtRN3RGdUlwMU8xU2d1WkY3a0l2cWV4WU5FTThROHV5T0Zo?=
 =?utf-8?B?amhWN0h4cGRsS1g5VWZEV2RvQ2dmbUdZQ3RnZXNHaysvdHkwaXVZdWRCTVRa?=
 =?utf-8?B?OVliL2lSdkdCUjMwSXVpUWRRc1gya1JsWGxQUGNoWUUyS0ZvZTh0UVgvL0dk?=
 =?utf-8?B?SWxlYVBhOE1kSFFvWWIreFdiaDBmejVEYlFLRVQyK0NWcWNJWWIrOHBjTzZy?=
 =?utf-8?B?N0V4SHdrOGxiMlpDcnl4QTFvT2szSWwxK3h1d3g3a0RmYnhTbFFJYjgvYXc0?=
 =?utf-8?B?Q1RVL1ZCdjZpL0FzcjdLK3dpZUVxeUZObzV2bU5NT0d5L2JWTGVHdFNWeGdB?=
 =?utf-8?B?ZUNYbkZxNWN2OW96d1V5dkNtQVZXb0tadTdrUk00S2JLWjZWVUZ6RjBSVWRt?=
 =?utf-8?B?a1hsSThmQzhteHFDdGlKbTZEYWJReHhCR3lwSEFySS9SMXVvZnU1RnNwSTBj?=
 =?utf-8?B?ZjdtcWZvVStiYjd2T0V5VDBuYjFwdGoycDgxQkJ2Q1ZPeXkvUnkvUzRpamFU?=
 =?utf-8?B?Q1VlamF2cXZMMEFSbXpJclhLQlpLbnFPcFFMU2t2cGp5dTIrS0lqMm14RTYy?=
 =?utf-8?B?Z1FwU3JiL24rY2xkQWJ6VDB1SEJvWGhGVEJMbUxJdDh0UVoxRlZ5cGFFVERr?=
 =?utf-8?B?ZmcvRld5NmNHYkh5MW8zajU2SUhRcGJEeGVKdERlUnRwTVE5b3MycVF2eUVj?=
 =?utf-8?B?Q1FtdmZuVG5JWGl3Sk9DeHlPNWhsR2N2ZnR5Y1BVaXphWm0vL2JDcWsxaFIz?=
 =?utf-8?B?THR2WDlCT1pqWXpFbFFQS3hVSGZsVXJFRFFXb1NPcGp4dzBPeWJJVmNuUHla?=
 =?utf-8?B?SnM0T3NiN3VIcTQrVFJxbGFJMVdTazU1WjNJVXROKy9PODdhK3dHR3RqVldC?=
 =?utf-8?B?U1A1NFFpNkE0ZVFwMzR1Z2NTd21QM1hkNU5BeEF2Z1NnZkJVMzBudmJMMFNy?=
 =?utf-8?B?T3F6L1lrWlI1TnBCZXV1cTlvNlFDNmlEZCtGOXNKYVRkZG5Sb25hNktvekZB?=
 =?utf-8?B?MEtTYmhVUjA0S3gzVG8yRS9taTU5c01IRkFkOVh1Z0N6Uk5vVk5KSHZEQ0Ns?=
 =?utf-8?B?bXFIaWZPd0NDUHI5ZjJoVkZIQzcveE1xQjZ1S014a3lzdGg2RzRHTVc5cnkz?=
 =?utf-8?B?MG12ZUJWaGdTVnYvUEdOcFpPdjhXSWJUcVE4N3dRZld1dlJqdTZEaS9LaHpu?=
 =?utf-8?B?a0FnWU5LMTBJaXlFTFpIdjhRV2lXU2p4T2RjQThVdDdoZEszVkJjekVoem0x?=
 =?utf-8?B?MnNjWTJOeDBTM0NyK0xzeVlvUHB6Z1NocXdRUVVsOFNjK3NreFZKc292aHRr?=
 =?utf-8?B?S0tvaXpyZ0ZsWWhxQ0ExUUJqZWpDOS9TUHNLT2lNMG1oSGlMQ3NPR2JJRzgz?=
 =?utf-8?B?cG9YRjNmMGE3WDZqUExyV3EwcTdMQmwrNzJwMTIxcTByQy9jTTJPeVhoVzRm?=
 =?utf-8?B?ZEluQW9sRnY2dG91ZjE0UkpDVWFXak1IUngvbjNpSzZFV2V1NVFUMlNVeVpz?=
 =?utf-8?B?NmtDNXFPL3VkdHJPdnVTamNNYWJ6Z094bVFHNG1wSXBTSlhEYXQvQlQ1RnJI?=
 =?utf-8?B?NkNGTmZaNTBEdktHRWxlbnRwUmQ1WDNjOFJTWm1UcHE5Si82bFZqTVpQbDZq?=
 =?utf-8?Q?GeTzNItU/aOdo3fuc3wtqg2l6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d15c71-c284-4e98-7ebf-08ddb8eb941a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:06:50.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwHT1UTJGi2YKd0Cb0WZhBDbImuXI/BENo3Gs+Y1XaXubBpVbv4wwkvRY4/p/YwcaTbPwoWEIp1mBar3DBLL1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

Add driver i.MX93 MIPI DPHY controller, which is wrapper for Synosys MIPI
CSI2 DPHY module.

Base on
https://github.com/nxp-imx/linux-imx/blob/lf-6.12.y/drivers/phy/freescale/phy-fsl-imx9-dphy-rx.c

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/phy/freescale/Kconfig                 |  10 +
 drivers/phy/freescale/Makefile                |   1 +
 drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c | 306 ++++++++++++++++++++++++++
 3 files changed, 317 insertions(+)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 81f53564ee156..cb34e151e86c4 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -44,6 +44,16 @@ config PHY_FSL_IMX8QM_HSIO
 	  Enable this to add support for the HSIO PHY as found on
 	  i.MX8QM family of SOCs.
 
+config PHY_FSL_IMX93_DPHY_RX
+	tristate "Freescale i.MX9 DPHY Rx"
+	depends on OF && HAS_IOMEM
+	select GENERIC_PHY
+	select GENERIC_PHY_MIPI_DPHY
+	select REGMAP_MMIO
+	help
+	  Enable this to add support for the Synopsys DW DPHY Rx as found
+	  on NXP's i.MX9 family.
+
 config PHY_FSL_SAMSUNG_HDMI_PHY
 	tristate "Samsung HDMI PHY support"
 	depends on OF && HAS_IOMEM && COMMON_CLK
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 658eac7d0a622..8e122a07695f0 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
 obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+= phy-fsl-imx8qm-hsio.o
+obj-$(CONFIG_PHY_FSL_IMX93_DPHY_RX)	+= phy-fsl-imx93-dphy-rx.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
 obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+= phy-fsl-samsung-hdmi.o
diff --git a/drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c b/drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c
new file mode 100644
index 0000000000000..f5155ae68c50f
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx93-dphy-rx.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define IMX93_BLK_CSI			0x48
+#define   IMX93_BLK_CSI_CFGCLKFREQRANGE	GENMASK(5, 0)
+#define   IMX93_BLK_CSI_HSFREQRANGE	GENMASK(14, 8)
+
+struct fsl_csi2_phy_drv_data {
+	u32 max_lanes;
+	u32 max_data_rate; /* Mbps */
+};
+
+struct fsl_csi2_phy {
+	struct device *dev;
+	struct regmap *dphy_regmap;
+	struct clk *cfg_clk;
+
+	const struct fsl_csi2_phy_drv_data *drv_data;
+
+	u16 hsfreqrange;
+	u16 cfgclkfreqrange;
+	u16 ddlfreq;
+};
+
+struct dphy_mbps_hsfreqrange_map {
+	u16 mbps;
+	u16 hsfreqrange;
+	u16 ddlfreq;
+};
+
+/*
+ * Data rate to high speed frequency range map table
+ */
+static const struct dphy_mbps_hsfreqrange_map hsfreqrange_table[] = {
+	{ .mbps = 80,  .hsfreqrange = 0x00, .ddlfreq = 489 },
+	{ .mbps = 90,  .hsfreqrange = 0x10, .ddlfreq = 489 },
+	{ .mbps = 100, .hsfreqrange = 0x20, .ddlfreq = 489 },
+	{ .mbps = 110, .hsfreqrange = 0x30, .ddlfreq = 489 },
+	{ .mbps = 120, .hsfreqrange = 0x01, .ddlfreq = 489 },
+	{ .mbps = 130, .hsfreqrange = 0x11, .ddlfreq = 489 },
+	{ .mbps = 140, .hsfreqrange = 0x21, .ddlfreq = 489 },
+	{ .mbps = 150, .hsfreqrange = 0x31, .ddlfreq = 489 },
+	{ .mbps = 160, .hsfreqrange = 0x02, .ddlfreq = 489 },
+	{ .mbps = 170, .hsfreqrange = 0x12, .ddlfreq = 489 },
+	{ .mbps = 180, .hsfreqrange = 0x22, .ddlfreq = 489 },
+	{ .mbps = 190, .hsfreqrange = 0x32, .ddlfreq = 489 },
+	{ .mbps = 205, .hsfreqrange = 0x03, .ddlfreq = 489 },
+	{ .mbps = 220, .hsfreqrange = 0x13, .ddlfreq = 489 },
+	{ .mbps = 235, .hsfreqrange = 0x23, .ddlfreq = 489 },
+	{ .mbps = 250, .hsfreqrange = 0x33, .ddlfreq = 489 },
+	{ .mbps = 275, .hsfreqrange = 0x04, .ddlfreq = 489 },
+	{ .mbps = 300, .hsfreqrange = 0x14, .ddlfreq = 489 },
+	{ .mbps = 325, .hsfreqrange = 0x25, .ddlfreq = 489 },
+	{ .mbps = 350, .hsfreqrange = 0x35, .ddlfreq = 489 },
+	{ .mbps = 400, .hsfreqrange = 0x05, .ddlfreq = 489 },
+	{ .mbps = 450, .hsfreqrange = 0x16, .ddlfreq = 489 },
+	{ .mbps = 500, .hsfreqrange = 0x26, .ddlfreq = 489 },
+	{ .mbps = 550, .hsfreqrange = 0x37, .ddlfreq = 489 },
+	{ .mbps = 600, .hsfreqrange = 0x07, .ddlfreq = 489 },
+	{ .mbps = 650, .hsfreqrange = 0x18, .ddlfreq = 489 },
+	{ .mbps = 700, .hsfreqrange = 0x28, .ddlfreq = 489 },
+	{ .mbps = 750, .hsfreqrange = 0x39, .ddlfreq = 489 },
+	{ .mbps = 800, .hsfreqrange = 0x09, .ddlfreq = 489 },
+	{ .mbps = 850, .hsfreqrange = 0x19, .ddlfreq = 489 },
+	{ .mbps = 900, .hsfreqrange = 0x29, .ddlfreq = 489 },
+	{ .mbps = 950, .hsfreqrange = 0x3a, .ddlfreq = 489 },
+	{ .mbps = 1000, .hsfreqrange = 0x0a, .ddlfreq = 489 },
+	{ .mbps = 1050, .hsfreqrange = 0x1a, .ddlfreq = 489 },
+	{ .mbps = 1100, .hsfreqrange = 0x2a, .ddlfreq = 489 },
+	{ .mbps = 1150, .hsfreqrange = 0x3b, .ddlfreq = 489 },
+	{ .mbps = 1200, .hsfreqrange = 0x0b, .ddlfreq = 489 },
+	{ .mbps = 1250, .hsfreqrange = 0x1b, .ddlfreq = 489 },
+	{ .mbps = 1300, .hsfreqrange = 0x2b, .ddlfreq = 489 },
+	{ .mbps = 1350, .hsfreqrange = 0x3c, .ddlfreq = 489 },
+	{ .mbps = 1400, .hsfreqrange = 0x0c, .ddlfreq = 489 },
+	{ .mbps = 1450, .hsfreqrange = 0x1c, .ddlfreq = 489 },
+	{ .mbps = 1500, .hsfreqrange = 0x2c, .ddlfreq = 489 },
+	{ .mbps = 1550, .hsfreqrange = 0x3d, .ddlfreq = 303 },
+	{ .mbps = 1600, .hsfreqrange = 0x0d, .ddlfreq = 313 },
+	{ .mbps = 1650, .hsfreqrange = 0x1d, .ddlfreq = 323 },
+	{ .mbps = 1700, .hsfreqrange = 0x2e, .ddlfreq = 333 },
+	{ .mbps = 1750, .hsfreqrange = 0x3e, .ddlfreq = 342 },
+	{ .mbps = 1800, .hsfreqrange = 0x0e, .ddlfreq = 352 },
+	{ .mbps = 1850, .hsfreqrange = 0x1e, .ddlfreq = 362 },
+	{ .mbps = 1900, .hsfreqrange = 0x1f, .ddlfreq = 372 },
+	{ .mbps = 1950, .hsfreqrange = 0x3f, .ddlfreq = 381 },
+	{ .mbps = 2000, .hsfreqrange = 0x0f, .ddlfreq = 391 },
+	{ .mbps = 2050, .hsfreqrange = 0x40, .ddlfreq = 401 },
+	{ .mbps = 2100, .hsfreqrange = 0x41, .ddlfreq = 411 },
+	{ .mbps = 2150, .hsfreqrange = 0x42, .ddlfreq = 411 },
+	{ .mbps = 2200, .hsfreqrange = 0x43, .ddlfreq = 411 },
+	{ .mbps = 2250, .hsfreqrange = 0x44, .ddlfreq = 411 },
+	{ .mbps = 2300, .hsfreqrange = 0x45, .ddlfreq = 411 },
+	{ .mbps = 2350, .hsfreqrange = 0x46, .ddlfreq = 411 },
+	{ .mbps = 2400, .hsfreqrange = 0x47, .ddlfreq = 411 },
+	{ .mbps = 2450, .hsfreqrange = 0x48, .ddlfreq = 411 },
+	{ .mbps = 2500, .hsfreqrange = 0x49, .ddlfreq = 411 },
+	{ /* sentinel */ },
+};
+
+static int fsl_csi2_phy_init(struct phy *phy)
+{
+	struct fsl_csi2_phy *priv = phy_get_drvdata(phy);
+
+	return pm_runtime_get_sync(priv->dev);
+}
+
+static int fsl_csi2_phy_exit(struct phy *phy)
+{
+	struct fsl_csi2_phy *priv = phy_get_drvdata(phy);
+
+	return pm_runtime_put(priv->dev);
+}
+
+static int fsl_csi2_phy_power_on(struct phy *phy)
+{
+	struct fsl_csi2_phy *priv = phy_get_drvdata(phy);
+
+	regmap_update_bits(priv->dphy_regmap, IMX93_BLK_CSI,
+			   IMX93_BLK_CSI_CFGCLKFREQRANGE,
+			   FIELD_PREP(IMX93_BLK_CSI_CFGCLKFREQRANGE, priv->cfgclkfreqrange));
+
+	regmap_update_bits(priv->dphy_regmap, IMX93_BLK_CSI,
+			   IMX93_BLK_CSI_HSFREQRANGE,
+			   FIELD_PREP(IMX93_BLK_CSI_HSFREQRANGE, priv->hsfreqrange));
+
+	return 0;
+}
+
+static int set_freqrange_by_mpbs(struct fsl_csi2_phy *priv, u64 mbps)
+{
+	const struct dphy_mbps_hsfreqrange_map *prev_value = NULL;
+	const struct dphy_mbps_hsfreqrange_map *value;
+
+	for (value = hsfreqrange_table; value->mbps; value++) {
+		if (value->mbps >= mbps)
+			break;
+		prev_value = value;
+	}
+
+	if (prev_value &&
+	    ((mbps - prev_value->mbps) <= (value->mbps - mbps)))
+		value = prev_value;
+
+	if (!value->mbps) {
+		pr_err("Unsupported PHY speed (%llu Mbps)", mbps);
+		return -ERANGE;
+	}
+
+	priv->hsfreqrange = value->hsfreqrange;
+	priv->ddlfreq = value->ddlfreq;
+
+	return 0;
+}
+
+static int fsl_csi2_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct fsl_csi2_phy *priv = phy_get_drvdata(phy);
+	const struct fsl_csi2_phy_drv_data *drv_data = priv->drv_data;
+	struct phy_configure_opts_mipi_dphy *config = &opts->mipi_dphy;
+	struct device *dev = priv->dev;
+	u64 data_rate_mbps;
+	int ret;
+
+	if (config->lanes > drv_data->max_lanes) {
+		dev_err(dev, "The number of lanes has exceeded the maximum value\n");
+		return -EINVAL;
+	}
+
+	data_rate_mbps = div_u64(config->hs_clk_rate, 1000 * 1000);
+	if (data_rate_mbps < 80 ||
+	    data_rate_mbps > drv_data->max_data_rate) {
+		dev_err(dev, "Out-of-bound lane rate %llu\n", data_rate_mbps);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "Number of lanes: %d, data rate=%llu(Mbps)\n",
+		config->lanes, data_rate_mbps);
+
+	ret = set_freqrange_by_mpbs(priv, data_rate_mbps);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct phy_ops fsl_csi2_phy_ops = {
+	.init = fsl_csi2_phy_init,
+	.exit = fsl_csi2_phy_exit,
+	.power_on = fsl_csi2_phy_power_on,
+	.configure = fsl_csi2_phy_configure,
+	.owner = THIS_MODULE,
+};
+
+static const struct fsl_csi2_phy_drv_data imx93_dphy_drvdata = {
+	.max_lanes = 2,
+	.max_data_rate = 1500,
+};
+
+static int fsl_csi2_runtime_suspend(struct device *dev)
+{
+	struct fsl_csi2_phy *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->cfg_clk);
+
+	return 0;
+}
+
+static int fsl_csi2_runtime_resume(struct device *dev)
+{
+	struct fsl_csi2_phy *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(priv->cfg_clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(fsl_csi2_pm_ops, fsl_csi2_runtime_suspend,
+				 fsl_csi2_runtime_resume, NULL);
+
+static const struct of_device_id fsl_csi2_phy_of_match[] = {
+	{ .compatible = "fsl,imx93-dphy-rx", .data = &imx93_dphy_drvdata},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fsl_csi2_phy_of_match);
+
+static int fsl_csi2_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct phy_provider *phy_provider;
+	struct fsl_csi2_phy *priv;
+	unsigned long cfg_rate;
+	struct phy *phy;
+
+	if (!dev->parent || !dev->parent->of_node)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->drv_data = of_device_get_match_data(dev);
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->dphy_regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(priv->dphy_regmap))
+		dev_err_probe(dev, -ENODEV, "Failed to DPHY regmap\n");
+
+	priv->cfg_clk = devm_clk_get(dev, "cfg");
+	if (IS_ERR(priv->cfg_clk))
+		dev_err_probe(dev, PTR_ERR(priv->cfg_clk), "Failed to get DPHY config clock\n");
+
+	/* cfgclkfreqrange[5:0] = round[(cfg_clk(MHz) - 17) * 4] */
+	cfg_rate = clk_get_rate(priv->cfg_clk);
+	if (!cfg_rate)
+		dev_err_probe(dev, -EINVAL, "Failed to get PHY config clock rate\n");
+
+	priv->cfgclkfreqrange = (div_u64(cfg_rate, 1000 * 1000) - 17) * 4;
+
+	phy = devm_phy_create(dev, np, &fsl_csi2_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, -ENODEV, "Failed to create PHY\n");
+
+	phy_set_drvdata(phy, priv);
+
+	pm_runtime_set_suspended(dev);
+	devm_pm_runtime_enable(dev);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver fsl_csi2_phy_driver = {
+	.probe	= fsl_csi2_phy_probe,
+	.driver = {
+		.name = "imx-mipi-dphy-rx",
+		.pm = pm_ptr(&fsl_csi2_pm_ops),
+		.of_match_table	= fsl_csi2_phy_of_match,
+	}
+};
+module_platform_driver(fsl_csi2_phy_driver);
+
+MODULE_DESCRIPTION("i.MX9 Synopsys DesignWare MIPI DPHY Rx wrapper driver");
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_LICENSE("GPL");

-- 
2.34.1


