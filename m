Return-Path: <linux-media+bounces-25963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FFA2FB3E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ABE83A679B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5298524CEEB;
	Mon, 10 Feb 2025 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CFVc7xUr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72522505B9;
	Mon, 10 Feb 2025 21:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221221; cv=fail; b=RUeuhyNlA6wWPHwKueygHEn8h2YQdSXk9v64I/I3en3smH10pTZOyo1tjl8eBrmhmO2ZywWhknbcYsA2TuhvrjGgfWct/t0+MxsrMfbinlvSGtQ+IWT/l1rO0J0SZ+n6/ftEI6Km6Tx+gcdvdr2XfBMKEcd72XrTaU4DA73SHxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221221; c=relaxed/simple;
	bh=Tbc3N7syV8hH20Mtv+2HgKb7LHrbjj3SPSrkoQKcGvg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N0WuRErpe6OYtY1O8P0LlZ3RMk4V/UwDrV0HjX3vsPX/AzSSMOwPkepoaHysdMfDeKM+DISJmcbVOFnNGYHCaXkq9vkfoyT0qC5RiFbwxh0DXIrdN1EpQ5cTuHMD8d+XUVYYYOpivHclo128LVeRC+vwZZA8ilzHZwZEWfHtS4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CFVc7xUr; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCWGYXOE1t4lhspNkP4OHvqgXz4vNHZ3/TLRqnM7WrtNpfhtK5ptruRwx2lhxOf0Is8Qvfldba0/vd7ALaiM5hGP8It5iO2xKUbOzE9MMv2ptzRMXm+3Y29SWZMlraWD1zU/BcgffReH4PWk4kC4pgNJbk0CqaKMHOICkA8YOzYjqBjKfezMv/wMzwXU63MBq6FNS/F58AxRGa65cBMkflh3/6ovWgbkvBM9k2yKLZYabzVC2YiG0TIQ36n9ReV8+THjj937Yptao2jp4hmr0NyYosZ1vKvnUldYGrZG0gcRdGT8X76LZzwrtL/Y9ka7vJ/nKDPLY4ROC/sqSwWDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C1sKja9LYQGpBT6Y5p14gBIpMLPg9Psfzfh9no6+So=;
 b=x3bD8ZHFS0qGiGsRUinh5KCmRkw6l+VJRjnz5L8UEW3lsSJ/1R1E/ONoC3ZfoXXGOHdo8d1HDRIx2cssLEY1ZXOm/eLMJHaGoeMP2x8FqcX2CXezwdd0Xr2OSl9reJ2Xr1MZeDPryuh/kF55g4ofPPgodZ4el/tgRCBgdH9I55Q65rlcDdIAkYC5OI1oX7ut4mCjNlnFQMiSPX+pNyOOTKeUPS5DzTFXAOwNYNkcQrnezAUjzwIzcSf2N2GRyM+vYy3uoKz14LFQQ2zgrl3qomlpM2+DjIXJfZmvLKwL153XRna+nmXlaEg+7TzELX5w06zjQjDL/lbQszmvTxtkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2C1sKja9LYQGpBT6Y5p14gBIpMLPg9Psfzfh9no6+So=;
 b=CFVc7xUr4SnaPvohHVMAR81vLIRacwIbOFoBJku1O+zzUesN5RXK4jf2OWsgEjGSlNdEOooQXZphnmdgGpxGbUuS3QP2xUGy2J/dtqkApNv9dVmtrAiWzOTyOkR04KCWM1JaoVq543RdjH+R0PfsXE90S3AHoXKPf7fQFDcgL4zP8SJq6yjguJBmSyHAW8yZSCocrGVcn2J+++Grt5p/1N6fne6LtHH4sxDWnoTFGxwNuNoLm7pL0dpwbebJRVvgaAKCGx5+BzWmOHcWOz/sLSjPkB/wtKkMC5PjV0NNeCiiIaF5ApxcBHN810sqFetqL5PJVSMctUGJdOmNvmt0kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:00:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:25 -0500
Subject: [PATCH v3 06/12] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=2621;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7wXZhwTRfjUe7ha7KJiQ5NyLlzlXsRv2ixjhl52x4f0=;
 b=SFnCN1SX1BaQNZ6+VChvVSkVF9aP1dMxsR2iviGajUf6g4Oc0oU8oPGaCe34WQxTM186vG8Mz
 jwJKZorKZ+SCZLNaUH8P84ACzTJ4FtwdP8qAfwkceo6ah7deTydvzA1
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
X-MS-Office365-Filtering-Correlation-Id: 4ac3d1da-6199-458d-f113-08dd4a15ecda
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a3UyUTNyWTBTUDFQeHRsc0JkMkVUeVJTem82bGlua1ZScXU1RTJ5UGNYMFJv?=
 =?utf-8?B?NnR2RTdDS25wYzRZL1FkNFBZM2FsN1crRGw5T3psNE81eDhWVVZRRkhxWkxO?=
 =?utf-8?B?T29NRFdHRU9CU09BQ255ZE83YlpVaHF1U1FHYXh2aGpqMkJxaEJOczBBWFhE?=
 =?utf-8?B?d09ILzZwT0pkTkJ2ektZVTNOMWtCeWFhYW8zMXpVelQ0UlhIb2ZzbXYrcHZw?=
 =?utf-8?B?cm5YSmhNc3pCT293cWIwUjBVcFRWYktuMXFEMlZHWnZ5bHJoOUdsTUdSNjJi?=
 =?utf-8?B?dG1pYmlTSk9WQ1AwelYvdDVWMjB1RFhWcTZ4UWRoakdOdmNmLytlTHdwR3V5?=
 =?utf-8?B?L0YxVkVwRjMyQzErV0pPWkc1TjBkQnJMekVyYWRabzdhT0h5TEpzLzZtaFU3?=
 =?utf-8?B?TkhFQXBCN1RuK0JKS2FmLzVROVQ3TGFUNUY4SFRzQW9vL3QwWEZHZFI0Yk8x?=
 =?utf-8?B?SDFsa1FobWJhZFN0QUgxVUNyOXovRmRBdEUydjd6eFE2Z0t2NnVuVyt2dkFq?=
 =?utf-8?B?clc2RWtvR3pidnBIVTNpWnZDL0pTNSt4UkNJdEhZS0toTk5kcE93S2NhQ3pE?=
 =?utf-8?B?WVVmUGVQc0UzelNtKzRSUEhueS9NTUMybjBMSk83T0hJQnhkU3M4aE5EQkN0?=
 =?utf-8?B?eEVNRWxtNWx6YytsYld3cjE5UzFJS3VpalhGYkdNQytzU00zRnFCemxmOGtH?=
 =?utf-8?B?Ty9kUDFadjV0dDdsUVcrU1hhZVZzSjN1dFN3RnJxbUhnMHR4WkJMY1JHMXZH?=
 =?utf-8?B?K3R5RzAxVmZlWHljbVJjbEN4NDhqSDdCNVNmSHdBM1dRQ1QyUHphMDZPMGpL?=
 =?utf-8?B?Sk43UW5kNmpzbDRkU2RTVm9nNjhCV0Rsd3grbjlEbHNGNkduSENYL0QzVEpT?=
 =?utf-8?B?T0k1RVBxaUVxNUx0WGc4eDR4UFBJWGp0OG90bW9jS09mYmc5RTFBNlJybGFK?=
 =?utf-8?B?dllMVitDeC9FZ0RWNitTKzNPMGQ2Rng3cEFZL3hIQitqNFpZTzVUekdiSEtr?=
 =?utf-8?B?WDFBbU9LTzNJSU9wYlk2cVZvVjhCaXRPcXFDcVhRRTg0TmZjREx5c1I5YVVp?=
 =?utf-8?B?emJmNTJGMG1zR2IxWVZFSDhUakhPTFhzTGxSRlEyT2NaQWxHYWRGZXo4TWVk?=
 =?utf-8?B?U0xZeWdVaGl3WGxUd3BDV1BMZzRzd0dZMFkyMXA2WEphQnN3M3BrVVYzTG1v?=
 =?utf-8?B?ek1zN01FeUxFMnpHUVN2eUlIU28wcW45V2JkbC9zNGgxaHNCL2l0cjJKZDJL?=
 =?utf-8?B?T05BVmxvbU15cG9aMjFTTi9hRTA2WTQrSGJJMytJN0JoMlc4Qk02VnE0Slh5?=
 =?utf-8?B?T0h3c09jbldiUXZmRXNOUzBQUXV5bHR3WEtRNUs5SVlTODIxZlRIc1dwOGFp?=
 =?utf-8?B?aW8zYzdOUDVXR1Z6M3lVMDdlSm5CMnZQaCt3c1RBNkZLVlBNbi8yZWlGcTlV?=
 =?utf-8?B?VGh2R3lNbTlHek1lZnRlVmFjNTNPaW5MTmhCZHQweE90UDNuZmh0bXdUQ1I0?=
 =?utf-8?B?cXVBMUpmOUJmTEUzcVNnSml3RjQySlpDT0hFdjRLNTNjNGYxRkVVeHdkbWRJ?=
 =?utf-8?B?dTRselc0WGJzazBhWjFMelh4Tlp0bGV4MjMxK3VGdWNIREtOZVl1eHlBRzYx?=
 =?utf-8?B?aTNPaWlHRi9lam1HQUZROERGM3p5RnlKUlhQUVVhd1RBQjliZzNhdWd1d0VX?=
 =?utf-8?B?d015eElWeHlxM04wWlVPeTQ2ZDRsYUVHWTh5QmVpQnlaSnFXQ29KWkkzbnZG?=
 =?utf-8?B?UVM4SjB3NmM5cHVkdTl0UU4vRW13aVF2Q296ZzdNenowY1E5WmpGQnRCMUhC?=
 =?utf-8?B?R2FPWDhSRGk3dGhWSXhWQkVyLzloSUlUVVJETFg2dTExRSthVEN3OTZ3VzVn?=
 =?utf-8?B?WnhFL1B6US9vdjNIMCtiMHBwN0toL25WQ2o0eFNKSDRoTStxUittTXpVSUcy?=
 =?utf-8?B?dkpBUnFLcElhZHFCNWRQMW8wVDdhWlIzWTN5ZkVxNWtpdnpwcUZzOFhhdits?=
 =?utf-8?B?NUZkRmpmNVBnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aXNWVzhLK1dJcFlaNkpiamREZ3hGOTZzNWpVd0xWOGRQdVRGcUxpNTBnRG9i?=
 =?utf-8?B?bXNqZ2l0QUZqVzN4WXRxTjNwQ2srZ1drOW5IYUdJYkptYUhGZWM4OUU2RXFq?=
 =?utf-8?B?NjA2QmlhQ0FBaU1CcEk2bUdqTUE3ODFRZjFkRVp4QzRENkVIQmtzdzdOWTly?=
 =?utf-8?B?Z3pHTVJzSldBR0dkMFdsTENpQWlaUEdTUVp5T0o0NkI4dG9JUlZCaWRja29L?=
 =?utf-8?B?NXpaMmlGTzRtMFp6ZmFVVjdQdTFsWkFkem9uRElqS1ZXOURxbzZNcFBLbDdZ?=
 =?utf-8?B?dWlNUXNsalhId0xaMzF4RllRWTlsQXliY2NMUUp3QkRvNHpwSjUrbHhpUXlk?=
 =?utf-8?B?T3B3WjNQZ1FDQk0wSFJMcG9KVEZzTkNlaVNYRGNpVHRzWjM3T1hlMFZDVWJ4?=
 =?utf-8?B?S1Jydk9mZ3V0TndjQU5xNzhyREdmVFhSdnpSY0J4THNPRUdXSHJtR0grYUF6?=
 =?utf-8?B?SlpBbHArMnd0TGlrVklzN3JWMDlwRUhJUzhLS0tvMTNMdFdMMUQrUE9zbytt?=
 =?utf-8?B?Z0N6OFB0UDB4UEJRUFFiSExXRUdpb2w5T0VSaVR3V2NaRVFkTVVyOCs5UFJ0?=
 =?utf-8?B?N2d1SlNZWHIxZVlWYk84WS9xRktDQUJuY1NxRFFDMDU1TXE3VWNuclExY3pO?=
 =?utf-8?B?TU1nckRDWkh2TGdKelA1dGZMYWdMTXR5aEcvbWkrMTIxUnk1RTNFTTBGRzJq?=
 =?utf-8?B?Umg3VFEyZ1JqV3BDZHdadDJHaFFsd0ZlS2pLMEp6MkdBVjBTWG9IcjNCcFVD?=
 =?utf-8?B?Skpsclh1Zk8xNkdPWWpuQUdLcEU1MmlkLzVwdVVSeStLMzZTRmk1KzYybXBu?=
 =?utf-8?B?NU5PbmdsNllQdUN4ZFM4NzVFa2lwWjNyenlmQ04wdmpqVWhTTndwREhLdVdx?=
 =?utf-8?B?ZGoxWjdNRUc0NkZVSmc5dTNtcjh6cnZOUEhJUldTQStzSEdXWk0rcVF0RXlj?=
 =?utf-8?B?eWRLMWJCMzdYWHpGaFpPM1Y0cjlxVENzcnpmdnh4bDVuRE1jeTNrUUVUdldE?=
 =?utf-8?B?NUFIY0ZNOXgyenBLczhjVjRuL3ZPTkhkOWNFaURYWlA4RGFsUFduUHhkbHp4?=
 =?utf-8?B?dmJwREdFaDdQMUVxakYzc1c0QXpuVkFub2dRZ3QvSFRJbXZWQnF4SEJHZ1Vq?=
 =?utf-8?B?UUtBK2RWRHgvRG91eGpXNU9vK3djMG4vSWZNQ3BOeUZPVEI3VUtlNzVMb1RN?=
 =?utf-8?B?cmR0MkNSVUFNOEhRUnRGd25yM3dtUUdWNnJLeU9tdS9uNVU1THJtZENUTEd4?=
 =?utf-8?B?MXZRVldpNHR2RlZMN0RNOTdrTGpLV1piZ0U4STlIR1FPK0Y5YWdhQ0NPaTJS?=
 =?utf-8?B?aDVhU1lvaDdXbThKSmtuRy9EQU56TjdOcUsrQnh0L1h5U3U0ZTRuSmUzZzJR?=
 =?utf-8?B?a0paY01YZzlsejBraUJPVGZNWUlBVEhlK1NDYWtHNmIyMUFEUjE5OFdtdWpj?=
 =?utf-8?B?V2N3RWhRSUpTTEQ1SkFaNThWYXUzczFZZWhOMkRDbnEzS2xsWHlVcDRTQ0RH?=
 =?utf-8?B?dXZOUXM5QVNjd1paazB3TVFBYmN4enZwbU54VUNSZklHY05Jb3VmbmxmMTZR?=
 =?utf-8?B?c0NsamEwa3ZXODI2R282Y1M5b1JLTFRpcGczZVNGblBlMERWM1lGSU8xQXRP?=
 =?utf-8?B?RjNMTWdEa1EveUFIcis3Uk1acFY1U3FMd2JCVXpVdGFSaVBTY1NYNTdVajFN?=
 =?utf-8?B?ckZtRk1XY0p4SnROYmk5K2VnYXhFRlk5bWlxTDNFKzB3Y1NoT0xRNzJEbVpv?=
 =?utf-8?B?VmVaWEZFMkpSWExsV2J4anJiaUtVUkdrSVF4K0hUZ2Q3Ty93YmVnUDhiZ0d2?=
 =?utf-8?B?eXgrV2JpcFVLVDRMeDBiSEFHYi9PSThUVC9ZRDdSTjB0dWNhTUtubE5JajZI?=
 =?utf-8?B?d0pmWkJyeExnWHlZMllncGplUFJJL1cvQ1I0OXErejRsV2djelNZcmp5SUlj?=
 =?utf-8?B?R2dxOU5vSzRpdGRqWGYwSEhvVittMERKRGhJRWJHcFpHR0pqSHYzenk0dFEr?=
 =?utf-8?B?TzBUdmJSWEpZVys5YTBWakZCWGZIRGNpNnlRUWx1M003MklCc1lzUVJlclVZ?=
 =?utf-8?B?Q2hNV2FWUTYrbjV0QnBFWGpzRlVVSFJhWWhSTWRXWEhwdHp6aWhHbXpJMGsw?=
 =?utf-8?Q?IGnQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac3d1da-6199-458d-f113-08dd4a15ecda
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:18.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRCJ8tAPuVqlZhbZflvHxIry3AudavXflS6mJDoEwD0W8hhCk8RvKgocsYNjZsAZf6ilfGeetqGMRwDpKKXNfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
fsl,mipi-phy-gpr from required properties and add new reg space, since
i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.

Keep the same restriction for other compatible strings.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- use dedicate csr register space
change from v1 to v2
- remove internal review tags
- remove reg maxitems:1
- remove 8ulp part
- add 8qxp compatible string and make 8qm failback to 8qxp
- limit reset and power domain number to 1 for 8qxp and 8qm
- remove power-domains change because 8qm/8qxp only need 1 power domain
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 2a14e3b0e0040..522449e50079e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -16,11 +16,19 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx8mq-mipi-csi2
+          - fsl,imx8qxp-mipi-csi2
+      - items:
+          - const: fsl,imx8qm-mipi-csi2
+          - const: fsl,imx8qxp-mipi-csi2
 
   reg:
-    maxItems: 1
+    items:
+      - description: mipi csi2 rx host controller register.
+      - description: mipi csi2 control and status register (csr).
+    minItems: 1
 
   clocks:
     items:
@@ -46,6 +54,7 @@ properties:
       - description: CORE_RESET reset register bit definition
       - description: PHY_REF_RESET reset register bit definition
       - description: ESC_RESET reset register bit definition
+    minItems: 1
 
   fsl,mipi-phy-gpr:
     description: |
@@ -113,9 +122,30 @@ required:
   - clock-names
   - power-domains
   - resets
-  - fsl,mipi-phy-gpr
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


