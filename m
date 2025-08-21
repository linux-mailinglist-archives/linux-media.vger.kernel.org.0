Return-Path: <linux-media+bounces-40688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B363B30611
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CCD623DB8
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1624D350D40;
	Thu, 21 Aug 2025 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eEVemEvi"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50B350D42;
	Thu, 21 Aug 2025 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807567; cv=fail; b=AamGeB5PI5tClBMspOnMzN2D+QyA32GwuGEBRsDUjGL6FAxLZ71xov9m99zT+40yGSWegQfPvnGG+dotuGizB2EnGL5Y+hC0uVCsQ1koaqBA55hxQ0VgKGnVy19W0ZkrrqfnnM1JtmEDhCwtzqTPIK8j+0gryO++Ts0OmyvWRX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807567; c=relaxed/simple;
	bh=fD21Z3IgVL0OGV5YERhYs5cobWtYWhxXIA6MKxY+wn8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GPKV7jlzIuuTOdR1Rf+uKbH2Qo/OMehv6dUpc4RTjfXNOK7f+uA3xoJW+hf2DC8MXwtekqBUBSS6LRAyLuIy22/1vwW00W/hMomr0u9ZMfpSU2k9fy471vvoRxCf+CJJTKmxwyLKSWGf2UcBPeB0G1PdLJ1QahvFsnsGgJ3qn/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eEVemEvi; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olAPh9/chGVXQMTrYGJDizPWdljvHDBq0+O8E+eMv/huwv7MKSZeN96YDhe3XwXdln/RPufLQtsDvOYBo2S6ENXlcxR/y917jInLBc79wZJrtpwo9gUs55Ustse8C6cgQGgKALmvUWZuMiHEhFT03A63rMbOg22WJOEDM5CEuKsF9GEDEUFPSmdmpGtakszkkqIShv9hDuE4aQ4VSiR1Sutjy+1/UariTGWiP7/C3tHtxPM3GRRmk/P8sHz5K8cPVgmfmV6DGXWisIGc4FfxLU2EAnzz8f8CMOjDedAprxk/xurpo4x0dD7BDSY83ONfFTW5rjdJ1gbxENuJzbsuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtHV5L8M8LFyWPc3pCifM4QbaguhIEhwQRHvvJE1tsw=;
 b=yKZzzWLOwDSDWGJ9ax13Hz7+kxoQ2AjjIuT9fBUnWqUR0jM6ofm4eZulLLg44UbWNyFkRqd7f4Ynoal2TcbeieabJTUyK0aPc6EUIxoclgoWMVjENub1xcOpGyafWYUNVnabZDI0f9fpJ9FetSUImuWuxSIkMv8pMTcsFlorWJhtC30ApVyykZifRAMApZ49zp/L8VbJOlFDnDdF3TtiI78vByjLxRPh4Wcnye7QsIzIPS74rYV5Dbp5c6dsnEj0G56q29ssmTFbyIXN7QYRTaRWj5ZlzhNoAZcNKEBopPSuFXC7yS/zCG6XfpHEQpR984RPyMAvbvE2EPI/4YOxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtHV5L8M8LFyWPc3pCifM4QbaguhIEhwQRHvvJE1tsw=;
 b=eEVemEvitp3S/o6gHluAtsQpNl0L5Ld6L00Ascbsy7dLNqf40rcX2ZICdERX9vCCdVrpZVQNgikj5SNnLD+mfWeXZGhuCSHe6EYmGgLpcW9DYslvY28DvTZ11//6R4mrqBAMxEVJtDiV4hGTdyKZ4K/iaVPn4/Gbb+aqApTPHQ2BllySWv0yXDu2ZJB/+RhkEAy6V+j1otrzZGghIJIIhQ5pxFowBimIZKlw6+s8QUORNyPHzP4qIcS36br7WVzIYskpUrkh/4fofJSAKMMhqbe4eaTxIHVo/Eq3mKlL7D7VNyzjfbH9WC8kmpWmgnkVOYhYx5o+09rKw1C6Tb9qdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9228.eurprd04.prod.outlook.com (2603:10a6:10:353::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:19:22 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:19:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:06 -0400
Subject: [PATCH v3 31/31] media: synopsys: csi2: Add simple synopsys
 platform driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-31-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=4025;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fD21Z3IgVL0OGV5YERhYs5cobWtYWhxXIA6MKxY+wn8=;
 b=qXsK0j0q9fU3CKGDmWBzMuffd8e3wzrmpa/4E0/e1L10VXDLuJI1rim8ligKvwD7I3VgdWl7/
 657za9GragqAXITimr4RmXjYv85E7FtHek9vX1amq6tUQc38pe6rSs7
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
X-MS-Office365-Filtering-Correlation-Id: 9ebca454-6df0-4b25-4796-08dde0f00431
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VzVMTE8wQ3RERC9UTC8wbnpPbzFWeWYrZFlBZDBmM1B2MWJjQnVIQnl3MHB4?=
 =?utf-8?B?SGdSUVdKZU5zYW1Fck9PbkZXWXBPTkJGdlQ5TVd6WG4zN3pPa0xqNWRaRmM4?=
 =?utf-8?B?K0ljRE45dGNKWW1aQlVaNW84Q1hoVExTMmhVZS90Q21YT2J5YzFyTEZqQVY1?=
 =?utf-8?B?SlB0TXFoTkR5dzI3dHdkVG04S3hnbGJlcldPditEbllNaCtlR0FQN3k5OFBU?=
 =?utf-8?B?NWVpL25ieit4bjY1cG9rYjNEL0paUlkzcHNxbnk2TFpXYWJMVlNXN3ZwbHdO?=
 =?utf-8?B?L1BZbTJRSzY0eUlNc0E5dmllOXNCMWxnZXNORU5Qa0Y4R1VSVFNWdjFBbmoy?=
 =?utf-8?B?QnlBTUNiSk5EdXlUODlTMDU0ck1PMmFLcWF6VDVrVGZKUlJNM1JMa0x0NlNL?=
 =?utf-8?B?OVFnL3ExN0c1eW5ZbG8wNzJHVWxtL01la1hISUdJaVJ3SjQ1Zm9UaFJaeGpu?=
 =?utf-8?B?UHFvNU9ROUtjeUdCLzdpWEZVMWE2QkxsQlVvM0loNmZ2VEdFRERZTERTSjly?=
 =?utf-8?B?bnZEQlpOZTN5YW15L0VmZXRTbW9HMGxBdHBWQkdSMXJvdWpOMTltNkJxWW1w?=
 =?utf-8?B?NCt3UnBDRlFmNzdjVUJ3RUVCeFNuZlZ6N0VoTnlrbDk1VXpyWVJQUTQweXNN?=
 =?utf-8?B?NGtiT0h4Y2NZM0g4SE5HZ2I5R21TUEhwb1RtWDZPdGRGL3hTMjhkYVd5bUl0?=
 =?utf-8?B?Ynpxbyt6NVdsR25XYThoTkx6Z0NtVUhuL1NjdjN3YjZESXdhcS8zY0ZyQldL?=
 =?utf-8?B?eTV1VUhJdzBJTDdwSGg2Y2s1SG1zR1Bua01ZeDJQVFViNlVSRTkxcmZRbFI0?=
 =?utf-8?B?UElZSGlYVjVtRHpwRnRqelJXNWJLNGFlN25PNG9hR2ZoL0Y0MjA5MHhHTXY1?=
 =?utf-8?B?VDdZaUpKR3hNU2JVc29ab21GZXBWbWhRR0VUZFM4QzlWVkdaR25PSG5tQ2Nq?=
 =?utf-8?B?eWV5WnprOThwY2g0T0RqUEhvT1hWUFRXZG9BVU01bEhzV29tQmNBdXZZTU42?=
 =?utf-8?B?emZoNVJHZWI2UW1vVm05a29tWVFZRTJYbE9kbHVGdUIwQVhwNGpFUlY3TTZy?=
 =?utf-8?B?SzFXazZkakxTSzAvUjFVbWZFcWhlQnlIdjdvVlZOVzduT1dzQjZWVEE1VmMw?=
 =?utf-8?B?RnQ1ZU1uTXVZWDFOQ0dDYmRxNDVGM3oyYTJLRW5jN0tGbUw4QWtkNUR6VVVP?=
 =?utf-8?B?Qjh2UUdkUFhZeDBBSmdxb3dTNnpwUmZlM3FBMVlYOGkwM0dvRDgxSUpld245?=
 =?utf-8?B?V2tuQUNSWjJvTDV1cDBoQkZPRlYyQUZkdzZuZDdUVU5jT1ZSRkNFL0xaUGIz?=
 =?utf-8?B?SHhuaTBNaVhreHF0T2JQVEU1YVBhSERCNmIyeXM1R1ZiQW9wYzdCL1F4VTFZ?=
 =?utf-8?B?ZkhNaXpqQkdpU2ExS3J1a2lORTdSQ1ZlK1FJSkwrbjJvcE40Z1ZRVXBtSW9R?=
 =?utf-8?B?bURPaWpBcUVkN2xoT3oyb0hvbm5CdVJrS3lHbGM2Nk8wVkFxY0hLOXliL3FJ?=
 =?utf-8?B?WnVDMzBrVlJRSHZuZGxtTWdsOG12U28vSW9iakVXSTgzSlpGeTZJNFlvSi81?=
 =?utf-8?B?OVI5bEZuUUN3cFBQUlcvTHhCMU91UUxLNFhuK0FuM2lVWWlXWTQ2SkdwR2Mw?=
 =?utf-8?B?dFB4NUVmMTdiMnRnTHFBcnB5a1ppNHNVcGdCRlZMZjN0bmsyQi9yK0ZjTVg4?=
 =?utf-8?B?eDFYbXR2QjEwdFdzR3grQ2ZZMk9LWmkyYldaT21LZVppbWlZa2RDYWlOUEFs?=
 =?utf-8?B?YTkyWCt6UnBhNFUzRWhOeThIMHZJYTdxY01oUFdMZG9iN25PTmRuOHM5SnJa?=
 =?utf-8?B?dFpyTm8xaFhZbjhLR05QdHNSejBuV1Y4T285aGtwOTM3SlRUSnVOc1E2Q2xp?=
 =?utf-8?B?U3ZMZWlpNVFGTWpNMXdtZ1BJSTlHMWozWExPSTN4S2xBdGw4UE9PdjRkRUFs?=
 =?utf-8?B?Yk5hRVJ4czZiQThRMEJ5ZlBoK2xaYzFIbFhCOHlhMVdKT21uOW9SZzcvbzM4?=
 =?utf-8?Q?MyQ9dR1b480ApnUU09XvEaolUVSYDg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NkFLeVFPMzV2bEJsNEp1Vm9CNkV5clRqWHFldEVVdndGRVVUVGh0aStLY1JB?=
 =?utf-8?B?UnlBU1RXMlpvSldhendKZ3ErRll4M1dPZGtyelRydFhVV0hWRFpGRVFmV3gw?=
 =?utf-8?B?L3VTa0Q4SjlCYUhnaDNEY1g0QVFaWGkrV1JlMmttN0gvYTRrZXI0dDNPK1lL?=
 =?utf-8?B?bHVPZWRCZkhEQ2JxTlZWemVMYzd5b2hYcEQ2M0NEajBLaURTR2ZLZVRsczhi?=
 =?utf-8?B?eHNYTUxqTVpCbkVtZWE4elRIakNpV0x2K3l5L0pGb2c3M0dvTEhXbUsvb053?=
 =?utf-8?B?azVRU0hSSjRNN0RBaFF1Kzk1dUV0MWNsMjJPdXArdFlLcEcwaGZxVTZwZXox?=
 =?utf-8?B?R0IxNGxua25ydllONVBMUTBNeEI3VkR4ZFhLZkJoWjhaSzJsKzkvSWd6Q1Rj?=
 =?utf-8?B?Z2xuN204T0FLS0JhTThGczMwZUxBQVErOWdndDY5a2F0SHYzeFdYR09vLzFL?=
 =?utf-8?B?YXZMKzUrbmxLL1YzZkNSZHI1WmdFdWNKMmQxdWRqNEM0TW1wdlZvdFJGaUlH?=
 =?utf-8?B?T2gvRFNpUjlWWWdqSHNDSXlzdTlsNSt6dTJQS3lNSkp4dUR4UjNRREVCVTdi?=
 =?utf-8?B?UVZoWGo3b0ZMTE03REM4RVYwSndxNEtkNzhCTGNwT1FvSWJZdW4xYVZOcUxK?=
 =?utf-8?B?VmJjaVJZMUdaRVU3Nzl4T2J2UjNOWkh6dVJZalRwQmx4c2s1Y3l1ZkJhYWZl?=
 =?utf-8?B?S0JvSnlkbUxNNk9jUmFna1BrYVRpZ0w3dUdjRzFjaFQ4WTRjRUcvTGtzZ2pO?=
 =?utf-8?B?ZnhrWCtXUXZCS011cVVUWGRKTHhHUjRpcEtQZVQ2RnVQV2RFSUtidXNZeG93?=
 =?utf-8?B?TWxLaWxLZlpvRk1nQkZSUDhhV29jY0dydDhNMDJuaE1nWGpEUGU2bnZRRXhU?=
 =?utf-8?B?RmJFNnRKY1pPUFg3VTVUdE5oN2NORW9Kb0wxOVhxeXY0SVNOUDJHRkN5UExF?=
 =?utf-8?B?eG1OMEUxUy94N1RkcmxSUW1obmpmb2dFSU9LOVladFRYQVZTNUFsVjdRdHo0?=
 =?utf-8?B?WFRRaURjYTQ1SkNXUXVsRWtDTWpWcXFPdDRLY1pxVUk5TmdhKzBNUm00VDli?=
 =?utf-8?B?RW1jdzFNVldONkhPTDVGcjRVWGlWMDEyVzZLTHNsRkMrbVZHdmhiYlkvNCt4?=
 =?utf-8?B?NzNPcEpnVkpkNnFodlc4Wnl0U2o2RWdFY0tURzVCS08vSDJmMkl0OUorTVZq?=
 =?utf-8?B?V21MbWR3QXJJdG9Oa0xSc1dZWkUwK0RhNzlCaDVkWWdmYURxMjFWN29hMmh0?=
 =?utf-8?B?QWJISjE0OSs4L2NaUW5hcXhnNEZIYzUxaWZWbjJ6SUNCNERxQWZucTBXWjNQ?=
 =?utf-8?B?MVpmVWdpRkRzbnlweEtYdCt4N2JNUGM5SmxSTUIyT1haa3pDSXVVeVVRWGdG?=
 =?utf-8?B?RklwdkN0ZlNVZS9QOWVKbXBIUXhaM0ZyRUx3MXppUW8xeFB3N1BWNVJ2SFpI?=
 =?utf-8?B?QXViSm15b1FmeFg2cWVQVU9NNlgvWTA1SXc4SVlDR2tubzk2LzZTL3ZQYnhq?=
 =?utf-8?B?dlNGN2tKbW1CTm0xSitibDJ4M1VNOEhXYnBwTjJXazNMb2J3R1NsN2x4Ty91?=
 =?utf-8?B?dkVpSTlBYVRid3prazhRdVlkTUdPU0xGVVFvdncwTDlTL1c3WUx4NEo3TjZU?=
 =?utf-8?B?TDV3YnRLb1dlMGlvSVg5YUZNM2NYMUZyUUs5WnRsdWc3aEtzb2xMMHlJblRr?=
 =?utf-8?B?MFAvUTFYMDVxQ1YwdFBIMmhaNmNZZlJTaFZKcGd3bERjQVdpZVAvS1ZBaDdX?=
 =?utf-8?B?Nlcrd2RaZXd0QWZuejNBei9Lcnl2MUFZYUgrcWIyMlR1bVJhMEhtVzV3dkdj?=
 =?utf-8?B?emJ4MmtPby9GTHhVSjdPRWsxZkd0NjV1SGdQcWZmVVAzdmN6Y3pzVExyUktF?=
 =?utf-8?B?TmhyY0QvN3dOZXZlc1prM1RLcmcwRTNod2s2dkV5UHJsSjhaaWNkWWkxa1d5?=
 =?utf-8?B?T2xzajRJS2tIVUM0Yzd5U3NZUk92V1R5bnVMOXAyVHJSWlpLdzBrNGptWWNY?=
 =?utf-8?B?TGZOTEw1Y05tcjl5TTcrSldZYjN5dThXQlVOYUdGTEVCWllMblFqd29DRXlv?=
 =?utf-8?B?L2ZzSGY3eFNpNXNLUktON0hRWi9hL1FkaWx0ajB1RC9jRGdxZ09NNXN2UW45?=
 =?utf-8?Q?X5LY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebca454-6df0-4b25-4796-08dde0f00431
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:19:22.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0d3twhPxpALc207VMFmaIdTwRgTCB0PfiaUUeSOC+HllIOrt3UFsWxlWnHMleoJWfb3ShR15PTjyrxjVBc4gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9228

Add simple synosys platform driver, which use standard PHY interface and
only 1 sink and 1 source pad. No format convert between source and sink
pad.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/Kconfig            |  8 +++
 drivers/media/platform/synopsys/Makefile           |  1 +
 drivers/media/platform/synopsys/mipi-csi2-simple.c | 75 ++++++++++++++++++++++
 3 files changed, 84 insertions(+)

diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index e54dad835349d420dead6d5313c0623567c28c0b..642b7dcd8dfb1bafa3b6dbdba1a1d99559d3c01a 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -12,4 +12,12 @@ config VIDEO_SYNOPSYS_MIPI_CSI2
           To compile this driver as a module, choose M here. The module
           will be called synopsys_hdmirx
 
+config VIDEO_SYNOPSYS_MIPI_CSI2_SIMPLE
+	tristate "Simple Synopsys DesignWare HDMI Receiver platform driver"
+	depends on VIDEO_SYNOPSYS_MIPI_CSI2
+	help
+	  Simple platform Synopsys MIPI CSI2 platform driver, which not format
+	  convert between sink and source pad. Only 1 source pad and 1 sink
+	  pad, use standard PHY interface to initialize DPHY.
+
 source "drivers/media/platform/synopsys/hdmirx/Kconfig"
diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
index 045ed3177738e6d28aa223804b79e6774e141dc8..cac610c8e08abeebdbf14157d8edcdc5a635dd00 100644
--- a/drivers/media/platform/synopsys/Makefile
+++ b/drivers/media/platform/synopsys/Makefile
@@ -2,3 +2,4 @@
 obj-y += hdmirx/
 
 obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o
+obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2_SIMPLE) += mipi-csi2-simple.o
diff --git a/drivers/media/platform/synopsys/mipi-csi2-simple.c b/drivers/media/platform/synopsys/mipi-csi2-simple.c
new file mode 100644
index 0000000000000000000000000000000000000000..bf34a515b41290339db06d74d7135c575a8bf031
--- /dev/null
+++ b/drivers/media/platform/synopsys/mipi-csi2-simple.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Synosis MIPI CSI-2 Simple platform driver
+ *
+ * Copyright (c) 2025 NXP.
+ */
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <media/dw-mipi-csi2.h>
+
+struct simple_csi2 {
+	struct dw_mipi_csi2_dev dw;
+};
+
+static const struct dw_mipi_csi2_config simple_config = {
+	.module = THIS_MODULE,
+	.name = "dw-mipi-csi2",
+	.num_pads = 2,
+	.sink_pad_mask = BIT(0),
+	.has_irq = true,
+	.has_phy = true,
+	.need_dphy_reset = true,
+};
+
+static DEFINE_RUNTIME_DEV_PM_OPS(csi2_pm_ops, dw_mipi_csi2_runtime_suspend,
+				 dw_mipi_csi2_runtime_resume, NULL);
+
+static int csi2_probe(struct platform_device *pdev)
+{
+	struct simple_csi2 *csi2;
+
+	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	if (!csi2)
+		return -ENOMEM;
+
+	return dw_mipi_csi2_init(pdev, &csi2->dw, &simple_config);
+}
+
+static void csi2_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dw_mipi_csi2_dev(sd);
+
+	dw_mipi_csi2_deinit(csi2);
+}
+
+static const struct of_device_id csi2_dt_ids[] = {
+	{ .compatible = "snps,dw-mipi-csi2-v150" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, csi2_dt_ids);
+
+static struct platform_driver csi2_driver = {
+	.driver = {
+		.name = "dw-mipi-csi2",
+		.of_match_table = csi2_dt_ids,
+		.pm = pm_ptr(&csi2_pm_ops),
+	},
+	.probe = csi2_probe,
+	.remove = csi2_remove,
+};
+
+module_platform_driver(csi2_driver);
+
+MODULE_DESCRIPTION("Simple Synosis MIPI CSI-2 Receiver platform driver");
+MODULE_AUTHOR("Frank Li <Frank.li@nxp.com>");
+MODULE_LICENSE("GPL");

-- 
2.34.1


