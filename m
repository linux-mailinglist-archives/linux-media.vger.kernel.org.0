Return-Path: <linux-media+bounces-59483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOZKHZgU62lsIAAAu9opvQ
	(envelope-from <linux-media+bounces-59483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:58:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7745A6B9
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A4E63028826
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 06:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF20235F162;
	Fri, 24 Apr 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gTIujgEc"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A34282F3A;
	Fri, 24 Apr 2026 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013302; cv=fail; b=ouObYOym2Wwa+JtxEVblIwasKsI/yYgjZi1kODYJ2RHLxrGUKfCS0r/jLM39991u63Rr7kGdEDqAkiSd7F/TJQaJIvX3EivkUD39FdlbHQJDxbdXSIwfgrl69imlGFypSqRp8CH9aM4v1KSas4CTedlhh6FG3sH2KHSCAfsO6gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013302; c=relaxed/simple;
	bh=tV/GCF75Mal68b6jVfbtaGotC4RyS5BPPNijCjUXxYA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lI/ojc1TvlsbbO4S1PZNkXHKtbcFKnvCFzB/zsWmNBjFlReimOk/jo2OrcfwxqbnyRW3Sl53eBCCyoHZAWSQg6ismKCbkoFgVU1dOKYvNxhrFfFjXAUGp3QHmxefVWKDtzx0CcBSLAsqddkXT2WMJXhb9S1D2rSuek0FuUGNsL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gTIujgEc; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HukIGUi2X9P5HooGlDexci4heBjGBcraM2o3kpbVhZHegAuaRF2kA4H1Xr2EMkuVqHHy4nuanzc6idqmDRHM4jdqSS5uzmjKnDJhSRSyrKoXtovYm0YTwPqmi70lM1OLq6+OQ43tIqa+Z1Jexm7zfNaTyHdzJLl3hkp/cKXvwWmsyBxBpI9AAc1vVWHOpMb/ZYdxVMbPm561dehnr2UJebtja/Ctj5HkFEIbzP3Hd04jwJDjjMYmPJssJDMeYbceL5W9263KhSN0l9OqE2FN80KAt0q7fCJldmqDXdvga88X5dJ4bTLNPDGrL8OGGx7dsEnsGlPIubTGwxq98x9Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kLlcZ788tXaNN/+sKvun9sr55BDHs+1SnnpTa9xDN4=;
 b=uLkiP56LMI6P2wMOjy6DorCDG6yv7mzxw48HAo+ZCsse3S4E2BHrwX6ewdjEP4qfFI9W7huzCOqd6PTZmqRFZzg2aCv2g3edGhJBiSJhgGd9UReFFm9kLS7cLCg4o60fwlJPsDvt74JmmBs61w5dUb/ebLzvxcwY/70W8NnfUVVAQbO/oa5EBBB3Vmza9pzVwHyFR/MZqKOj1UmcAb/8uKEt4r4MYMBKH3wlZY6aVXvggPh5hdZZYDAYaQLt6KUYjKBElLrsTNiOBUjjTNO2iIZmlhWdZoE6GAAHG57mqiLnKVjrpv6znDlVycQHvgRJK8YdYPLREb1vUXtqC2Drew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kLlcZ788tXaNN/+sKvun9sr55BDHs+1SnnpTa9xDN4=;
 b=gTIujgEcMu4m/tQ5z2DGPi4AqFvwqs079hyU3meVHkTAd/2sqdkk0oc771xK8mlrmGjzCK2t9On+Po6nT6Io0eYPFANotQi3Y3l8FUwU7+GRHkeUj1EUtFrprHhjJGyzML+R/uzURruO3X2MRyQhenf0rLgA8A+/vTHChJuXjeVSQH4ehgeoDrkulOVU9RZdhNKMnAmEVlsX1KvhHqhvEA/jcV1CnBFKuI414ebZPRRE3NE14lsYKLFPNaCpet4fFeUKGgF+CWIF3fuSfxdtqfRuYn+DCQkNIGiCvvDCaa5fmC3Hx0OUVaLifMJgBRxfIsSsl/UqbW7n54dBmprTGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Fri, 24 Apr
 2026 06:48:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:48:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Apr 2026 14:49:51 +0800
Subject: [PATCH v12 2/2] arm64: dts: imx8ulp: Add MIPI CSI-2 and ISI nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-csi2_imx8ulp-v12-2-da148eabc035@oss.nxp.com>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
In-Reply-To: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777013438; l=3152;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=tV/GCF75Mal68b6jVfbtaGotC4RyS5BPPNijCjUXxYA=;
 b=sJMoIo3ztmjnnnbv+EV4GyJmOMW42xLeN3ir7+K3QquSigIF/kYKBObbrFj6mAMvJHxOe+noY
 xeSuoY6EkbcDaZYppBtEm7cMzidE+2oT6cvqrjlxnib3Qn+h1VRh1pv
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b24236c-4a88-4340-668e-08dea1cd770b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|52116014|19092799006|1800799024|56012099003|18002099003|38350700014|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 NVLLojuUBbt4sa4EMVdFjp8kpk/A6rTP92ibJ8+V2ufo/a6oRSv0xCogpHUAFdJLxdbpQm8NkLylOGKd87US3e2jQHz0DqCbNCYPPpCse80buwcOhwBzDwlqCciGUxF1m3VXzA7BTEN3hCiqoH5G58SPTAWT7R9Pw2Ip5sSexAPAlNC9g7zGOZM9l2Zz1y5jKRC0FbmXFnr1M543M5w6wCRGazJy/pgKDTVE7J4x8KDhGZ0Fi153qxF1t2lwX1i+ms2ot2C6NmAjzwla19VgadU+mgyqJuAQjE1bJbbiCh2Y87FrM3D7luJqya3XadW6HaDocqxHhEyQS44ltbmeNbhaJsNG10eIdalhKJnfR33Tu6ArgYNI75lAFeBvn6WB/hFImOVCCu5TADU8yA1MhSE52WSso+goQPgkzW6Tww+Zf/HrPigO/7TILqq67xEbTIGvLlzVLfwQK2fd3kvors2PqFzx6CrUoRYWuDJI1hMCNlf9DASOINohfpMXgf7grvS14tppnePNgw3HQlM3umbyWwCAW9GH7pIDyRYpffw8li2xM9oskIlwVusR5Rsl22ijQvqqfIpEXwfMK5XQTL4kmtvqL3OcsMNmz0RFYxDi9GZUxPC6F7+O2uWe6rmrfN/yESkaGO38VIJJwvfxC8Oku4e8TA0TcVCJu+XaPClAJ+pCbsksfGAJ26jwU9If+y12ehZI9l6fMkOWJ52sV9/qZhBtys2YafllsiJNpyD286WSqDx2g6Gx/ZaaaQWZ5tywGa/Cy80aQA61JDgpKfEAKAKeee2q1sN/hAb/kVbTbbn3B3rwAqwvfCkMsJYw
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(52116014)(19092799006)(1800799024)(56012099003)(18002099003)(38350700014)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NUc0a0txZUQ1cTNtUGRFNTgrRzZDMXI2b29SazRWTXdDTUpDc0taK1VENXFh?=
 =?utf-8?B?ajlhZ1JLK0VQSTkyWnE3QVhLVFQwWFRsMHJhNUNnUWZ2Y2ZjSXNQTGJTNVhT?=
 =?utf-8?B?ZUhVSnVzN1ltUkRrQnMvMmIwWUNFbDh5TUY4Qm82KzVzckVWZ1N0UENLcWw1?=
 =?utf-8?B?V2JFS0dLK09VSXFLeVR6QmxmbzRZaVFXQ016WktUQUdIcUdiVmZJZXR6SFVx?=
 =?utf-8?B?d0NSMU9YOFJTS05FVHozT2h2RkJkVkhOTWVGZ1JOWExSNmd4M2tnYVlaQTFY?=
 =?utf-8?B?S1YrYmFaY1RFKzdGdWJwdEVQMXZhWWVZNVA0UktUd1ZEeC9EcWtwejhLYnBK?=
 =?utf-8?B?SFlSZnZXZHlVKzN5bUZ0VFhqaUs2M3FFT1lNMGdKNTZqV3k1bFNkOWNKRDNE?=
 =?utf-8?B?cXVhUHNIRWoxZmN6RDRhVzM3aHBXYVY2WE8rbmQxMENYbmNjaDAyWHNVVnYz?=
 =?utf-8?B?T0krUlBsa0t6S205N1E2UWdha2F2T0N5MjVwV2lsaDhPaS9NVG5meElPVzhZ?=
 =?utf-8?B?aGdQTGlnVXB5QVQwQmhTalQxV045TUN1enV1RDBvQnpTVFdzVmhPNFF0bDRO?=
 =?utf-8?B?M0pHYURwWUY2ZEpveTQyNFBKZENSOHY3V2RSM1p2MG1zZ0FoWEhJY0FSNnVr?=
 =?utf-8?B?c1ljeURENnZNWTVRUit5eGIxYjQwVXk0YmVRMGgwSGlLV1dxMkJHcGtaeFpN?=
 =?utf-8?B?bkVFQnNzS2ZzZjBkeFR4c0p1akd6Sk9mdm9UZkFDRUpaYVAvaTdnSXdVRjRE?=
 =?utf-8?B?aGtFK2dkQTZRQjRrNjUwa1ZneW8vM0JyWi9SSm1CaGZJMXp0T1BpREplSmVS?=
 =?utf-8?B?TEVFQmxsc2pveHlHN2R2eDcxVnNWaXQ0R1RmaE1FM0IyS2ZYV2t2Q0luL043?=
 =?utf-8?B?YlphTTRUdm0vNENtRldoczlwN29qLzgzZjBNdDNZMVJMT1VIbG1RVDJlLzN4?=
 =?utf-8?B?YlRqYTJKZi9DbXFjUjd5dDZxT1E0NG5Hb01pTkY1YlcrVFEraXJVV2duUzhp?=
 =?utf-8?B?Z0k2c0x5b2d6TWROSHE3UVJENG51ci9tdWo4MUovZE9xeE5McTJ4anR4Y3d3?=
 =?utf-8?B?b3dNV2FCQUpwTGJ6Y3ltUjdTdE1uV004UzVSeUZiTzJIL2xHRURKSi84eDlt?=
 =?utf-8?B?bTVvcUhLZTA2blNKN3pHeHVRcisveno3cDNoTWsvbFk1QUlKc1MvYURNdGpO?=
 =?utf-8?B?OVVHcXJrZXNicWY3eFRNYU85dkxQR0gwdGFzbjJNZ3JsZlZtbGN5Q1lmcmdT?=
 =?utf-8?B?KzBpQlZTZ29Eamk5L1NNV2gwdmc1UlBPNkVobENkenNZd3lMK0Y0R2xQV25C?=
 =?utf-8?B?Y2c5UEkwaTNjQytvYkVId2pUczMzZjUxVTJIeEl3VnJHNHdtaXpqa1JYeTV0?=
 =?utf-8?B?ZlltOHFKcHRwNXZGUzg1dUl5R2VrZ25lTmhkWVpjQi9LUzc1aG91NUlYRXBS?=
 =?utf-8?B?eEZCWFZZL2xwaEo2NFdCL1QzeE5jOENRdTY2SVlNbWhWbm1GaGtCUEdIbnpr?=
 =?utf-8?B?cUNHQ0t1ckVXVHVxV3NnQ1VoSHlQUmo4VHNQdlB4SmJ3aWp3MFl0S0N0V3ll?=
 =?utf-8?B?bHUvaGgrbjJOTUg5VUhXam5PZGpLcFRhZ2VvSUhHSW5yR29MOEFDUktaWnFR?=
 =?utf-8?B?TDlxQTJ4dWo5Y1N1WnhxUEFBbFViN2treXU1UlFyaStLTG1sWmU4Mm56N3M4?=
 =?utf-8?B?UGVFYVNLOEdCcjlVYVJ6M0IwVm9XMElzVjlPOXBuWnlSZVRqTEkycHBOQTRD?=
 =?utf-8?B?djFIMm9PdW1IUVNhdTBnRmJRTlJIcjh3Y21BMkRpbmRlMmFBQWJ4Z1R0Yjdi?=
 =?utf-8?B?QWZ0MTdMQXo3bmQ1bjFoZ1VWeWUvNmRMTEtqUE1UZTloUXlmS2xVenN3a1JO?=
 =?utf-8?B?QS82L3Fkd0RWU3BCelZvaGlNVnh6SFdpcXNrcUQzd21HMWZKK0JsQUxNZ2Nu?=
 =?utf-8?B?VWsvTVJMUG5GZWY5VDFweUU3OXlRQWk1MTAwb0t5R3BDbm00N2dPUXplZXM3?=
 =?utf-8?B?OHB1M0sxWmJpTnlBcU1TQWliNXQ5Q05ZN200MFR1WnV3UlZPVmVQVjlYWUJ1?=
 =?utf-8?B?VklQRWVDeDZ1ZmtXcm9uYXJPNEcrYXExc3ZLSFlBa1drWkZSK0xZa05tZ1Fh?=
 =?utf-8?B?U0lkNWROUU5SVTRNTHZnZ0YyK3Rjd3JEZEFZQXlaZkpPVHB3SGN2MmNvdWxS?=
 =?utf-8?B?T25NWm5nZCs3N1J2SlB2UjRTK041Rmt4dzYyNHUrbnRGcy85Slg5RUhzMUw0?=
 =?utf-8?B?K1EzTnZjOGp1U3dvaHpSbWVVb28vUjRyZVNpOGI4LzZoR2I2ajZXbEZIYVgv?=
 =?utf-8?B?R2xSbENHbFZVelRIZlVDL281ZHdodEVLN1E2TE5HQWlwNjVFYjZsZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b24236c-4a88-4340-668e-08dea1cd770b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 06:48:17.2850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeDk3+6p3BuqEnXX4hv2VLTs3oZRuzmsthFqKbR6BszWpaIMSLIzDwmuJ66ssrtKcUrM2ahyXr4NbhL0xVeEsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-Rspamd-Queue-Id: CCF7745A6B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59483-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,ideasonboard.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_SPAM(0.00)[0.652];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The MIPI CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the MIPI CSI-2 and
ISI nodes, disabled by default, as they require an attached camera sensor
to function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v12:
- Swap ISI axi and apb clocks to align with dt-binding requirements
- Update commit message

Changes in v11:
- Removed #include <dt-bindings/reset/imx8ulp-pcc-reset.h> which was
  deleted by Rob's dt-bindings cleanup series [2]
- Replaced reset macros with numeric values and added comments to
  document the reset indices

Changes in v1-v10:
- See cover letter
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..c5cae7675ce0 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -859,6 +859,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>,
+					 <&pcc5 IMX8ULP_CLK_ISI>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 5>,	/* PCC5_CSI_REGS_SWRST */
+					 <&pcc5 6>;	/* PCC5_CSI_SWRST> */
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


