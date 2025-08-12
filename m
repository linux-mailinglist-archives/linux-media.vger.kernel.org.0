Return-Path: <linux-media+bounces-39553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484AB22287
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 726A068084B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB802E8DFD;
	Tue, 12 Aug 2025 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D5QkPhu8"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EABC2E7BBE;
	Tue, 12 Aug 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989787; cv=fail; b=LvTN/47F5bXXQ569N+VJXPhIGauxCirPRSI7S87J7YjVsI2WrtRoY5Ku0qK0kU3Yc63CC+5Oobz7SPMUS95DG4dRhPej4FIQNFXudRLHqt+rs3PPDLpQ/g24ggo6r/HIXyklg67OK2or5IpCmC06R0JeXP3W79AvA/VlH18mW8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989787; c=relaxed/simple;
	bh=yVEhF6NIlvKAF7roM4aEr9BhlgvzYwqUUoRszvEx9Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WcKAkGlHCbq2iggwPWe+0M8ZAD9No5q8Az+WLyvLNcAqhHzeEgWjvA5FJRC+AnvHyPeCe492wR4dTlrSmQUxY3j00+nT9B9ksgUg9vlLNgWi3t4+8hBTieMO4wkPhjjDKw9c+WJq5wDkMFyFwbxp29guLKQZPFeM+G8ce8rG1UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D5QkPhu8; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYzW71ASRGhRaq8FDmMr0VeuAD/A1BskXsXAYc0xng+j49LWirDbOUN6WVVph9G5lDO7ubXWjg8R0bxnJOAFk2dGDWZqGcaWQv2Dxaa0AONRZz5sNxJ5uRKnIc0xSYFH1SIW5PQ3vBn4aXh/XncTd/CyxJsUtVOmFCmySSDTOmAI73n8eIAbX51uSD1ekEl4++sWaoIlwumU1qj7kD3VNZeygU86hgNXtccwUAWOGhUd0UbPVcqVZIx2tKt8YAhr9I4GcNFL+5C+i29yv3Lr6pcVXiW3agNXgexK5NZZaJwpbIRvFrBoh45QkpaX54Q1MukCqrJ4fODP31SoHpwMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjm/4SOcTyhhzOaQG9LD6Hg5sSE911nmhyFldazbYDU=;
 b=aiCybcN4Eu77oSOt35r0zvY58//ZiqDnDwNKBvmh/gH+Ue48EyQ7ITCcUvJOPLLxHCJFZWiH1W4RbyFowj/Nfo9MgXNQ4fi5jbcVQkgqfrWwdV4MUcnxSV6tKcOylsVVTK/8lZDKE2yPKHEPQ5G9KH/H6QtTkynL1SyAmJCF+sKJN7ZeL1sU2VV12lIkM88odZ8ysRkQUoQBP4JTamejQq2kQ47212z5g7ZU28I46ZBUV+37dDrE4svLIrYlqcjU5vJ7QxkT4e6352Ljmc91YRxWhfSc5MMJkNFyQIvKDu847NAvWwIaqbKMYWCJWUJT37VEMcvJcPoVU3J1dGx4Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjm/4SOcTyhhzOaQG9LD6Hg5sSE911nmhyFldazbYDU=;
 b=D5QkPhu8UzctNRE5YERho4NYyMkO/H6SDWQqDe5eq3SxpqAC9xS05wYaOvG6v6JxX+39C+k/+iwCCGao6EpF0NzyTE4NtViDER+MfbLrw3ht1Yc03pM6dcZFmXuuwtqxadGlIqAIlBZJnEVYQVSazh9JOjwFreoAmXeP/eqDZoh0AUl01mqC8s/jx5iaXMhqgDyvjshph5eaPjueLWPy6PL2e7kd34ma8yr4A/5IVaiumVsZNYCt2SnMqBtRAMkD4FAFvBvdN5yplPs80HQzzqXWLw+XztPfLedyzRIrvbnXSBRVqNBVdhpIHwU3fEHE/k/EPWCIMah7JXLxSTAEyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 09:09:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:09:42 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v2 2/3] media: imx8mq-mipi-csi2: Add RGB format support
Date: Tue, 12 Aug 2025 17:08:43 +0800
Message-Id: <20250812090843.1035800-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
References: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: d37f7ad4-1a05-4bc4-29c8-08ddd97ff8fc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bnNsaHB1ank5VVNwR3NEZFNBaForajh3ZE9PRTVPb0kwdzdkWDY0cjRBZjBD?=
 =?utf-8?B?d1M4MmliSmtIOWM4dzU1U2xkNzhNMDVISFlwOVVmSXZhYlU2dUNKWk11djdK?=
 =?utf-8?B?U0FoS0J2VWJHYTlrNXhJMVpKR05IaXZJb3o5Ym9VakluL1FmVGo3Tjk4Y2JQ?=
 =?utf-8?B?QkRud0tjZWtxTDB1dUlwYndSdjNEaHk5VlZZcnlEUi96NTljeXpoQlRSb3Nt?=
 =?utf-8?B?TmNmbVpFQnRESzdtNzdzUWtGdlkxNHRlWFhqYlY5OEN1bEV6Q0hrZjgxSDJu?=
 =?utf-8?B?V3hmK0JJMFlONWVTM2tjU0RQTmRwajJCUEhPWU9IbDhCSzFCV0k1Vk5ERkR1?=
 =?utf-8?B?enRHSDI0aytqTURza2NiclNuOU1TSHd0VmtYRmRNMDQ5aHpGOUdFbFJjamZ2?=
 =?utf-8?B?NXl4MjZXdjh3K3VhNTFraWhaZEpiZHErdllzVVkvWTJ1NTFBdTljU0tZYUFo?=
 =?utf-8?B?VXBBRTFmSDJrcSsvYXhkVks0d1lzWjZMb2w4eUtaSDBPRXJ2bXR2OCt3Tm9P?=
 =?utf-8?B?TzN2QWVTdHFiYkIyUC9nUWo5SlMxQ2txaTIwQ0Jaa2k5MWRMQzhwYUpraUJC?=
 =?utf-8?B?blNBbzhDNXd4MHRKYldybHUzRW5GbzlWak9udmJWZ0tFdE9OQVFmTVdNSndH?=
 =?utf-8?B?Y1hSV0xKbXI2d0twY2FxYmY3WlFqdXB6MjF2VVV1WDdVRVFqMFAwdW1ZdTh6?=
 =?utf-8?B?ZWg4Q1QraEc5VEJsUTVEN0QyMDNqWU9BcitiaFA4RTBLRlU0QTcwWGNyNlpL?=
 =?utf-8?B?QUtObmhmODZlVjkxUVoyUWtxRVBEbE9Ra3ZFQkREc3FFNW5oTmY4anA4Y3Bx?=
 =?utf-8?B?clYraGR3Wk1oM1MzVU1TN0d1UnRXMHFxeUExNHFDMXNWa0ZEYkhDcnRNU0R5?=
 =?utf-8?B?ZVpMd0toZjJMdVo2a3Z4Y05ycmIvUlpOaHcwN1lKWjNKYU9relJNM2l1ZjlE?=
 =?utf-8?B?dmtMTjduNytjWFlNUWpCcHpWMTBNamlSbDdhbVZyZXlzbWJGSlFyNk5nakpq?=
 =?utf-8?B?RW5NTmZYaXFERDcyeE4vOXIySG03NHF4a0loVzR5aTdEKzVUSXFvYVZNZlh3?=
 =?utf-8?B?akpTL0gxc1BaY0lQSENyN0Z1R21XUG5yR2ppTnhzRHF3MGZGdS94Q0NSVkpO?=
 =?utf-8?B?NnlpbVFzR21MWXpiY211WEdocWRFM3VnV1RkT2t4ckhtYkJMVmdCYmFicnR1?=
 =?utf-8?B?eEpKYXBoOWxYbEtWTkljalg5TThOUVppaEptY1JCRWdTWGN0bEtvdDE2Q3ZB?=
 =?utf-8?B?MlZrSzVldzljWktMUmdsU08rYzFNQkpndWR0b0dkbTN5V3dVVHJPVUZWQmtC?=
 =?utf-8?B?STFabzFXUnVQMkluUXlHeUpUV0xEM0ZRTHNvS3dHdGhTRXR3QTFjaVBibVBQ?=
 =?utf-8?B?MEFvSHBSdDE5NFJEYnVLMjYxRloxRkhqMXhsSDZCdFg1SkNaOGR6Y0xDOXlx?=
 =?utf-8?B?M1pVVks0Q2lPMVBZaU9lWVlvWGVBM01aQTRpY3l3K3BuWFo3QWJPbHhrUVY0?=
 =?utf-8?B?RVRBY1N1TFpnME1DSzBrVVMraXZ0RHVuUCtYWVpka0xVZURuMXpKQzNLb1Nw?=
 =?utf-8?B?aDFVK0hyc29pTG5ZeVd3alRucm5OYzdycmtZVDJiSUhkK3NkREpaWmg5eno3?=
 =?utf-8?B?b003UHd0am9wMlQ2cEN1WHVoVGVtMk5xQ0NsMUxUNDAxanREQXRONXpPN0J5?=
 =?utf-8?B?U3c5cWFhRC9BNWlIMlZMeXdBTzJNS08rc0NsNkFSSjlsaGNvSEFYN3ZSMklG?=
 =?utf-8?B?b2M5YkVHbFZtODE0dmlKL3I2U0VRenB3bE5YcnBKVWFvZ0hPMlVrTE41QmV1?=
 =?utf-8?B?Mlp3UjFzMnZpeFNqVm96QzErcEhXbkNONE1lV1o0TVIwenJ5UkU0ck5TdEli?=
 =?utf-8?B?cFFKS2ZNWnZhWVJVbmQybmJYZmlwRFl4c09yeFBIeVNoSFVJZzk0NmcrSllh?=
 =?utf-8?B?L2pPMTJCMkc1aFloQWp0V1FtNHVPMHJMUy9rYnpreFlXT1M2VkM3UklZNmRC?=
 =?utf-8?B?TXlyaEdXNmt3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T3k1MjdMbFRRcmUrWS9UYmVJZGlQdFZpdDZUbTcyUEpabmVxVlFabHJ5RzJq?=
 =?utf-8?B?QWZkdjMyUEhicklndElQcjJLNXhyWjVOUkxRVmgrOWhkeHhNVkorRXFEd1Mx?=
 =?utf-8?B?VDVpa2NjanViUmkrU3lYRVVUcUdWRGJhT3Rnd0luOFgwQXhQbDdTRXdUK2JW?=
 =?utf-8?B?UEh4Zm8yTnpYY0hCVHZQSk5HVXdWbTRpT0hBSXpiUE01ZEpZR2RWa2pOdE9w?=
 =?utf-8?B?UE5CZ0svNlRGRjFVbThWbUZ1UUNvcEI3TDEvU2F2YWNCc0xTbHNyMkxuYThi?=
 =?utf-8?B?RHljKytGV3ZEclYrZGVLYVptNGtOejIzd1NRWVVCdU5tUS9mWDZSRmpTemRI?=
 =?utf-8?B?NHp6Z25qQ29XRnNuSkN1RU5QQXVYb2ZoeTlTd0FFL0tEOXFrb0V3SGdteXF5?=
 =?utf-8?B?ekhMOXhCR3lWMVhXdWIvY05uaWdpNzcxdC9vZEJQMTdGcGhlWVhGK0FZT2cv?=
 =?utf-8?B?M2I2RE1zcHdNQkkxcHE5TjRJaGx2bklnc2FmOUJhek9Wb055a1F1U3o3MVp3?=
 =?utf-8?B?WTNqYzBWVVhXTXFDVFN4Uk10NUhIUi9XUVE0Uy80RGVxYUkzd212dmxIL252?=
 =?utf-8?B?M0pSYWhPUkVnN202cGtUTDlRWVQ2TnV3SkdWdUYxeDMxOFdHR3RCbnBLM25S?=
 =?utf-8?B?TlRRdllSbGFZNS9KcEVTSURLRFp5dVdXemRtZ2lWSWxHdWVjQkE3SExQWmRE?=
 =?utf-8?B?SUVrQXYxMkkyemI3Mi9NQUhtcXBtNW1pWGw1ek5rUEh4eTJEejV1dDcyVll3?=
 =?utf-8?B?RjB2NXhjOTZsMkxVYnljYndNb1VWcW9mZ1B4dVFzOHd0M2syWlBPQUdib2gz?=
 =?utf-8?B?MkpJU0w0c1NCV3dRQ3NjalpoaktRdXd4eUQvdkFsOC9pcDRoYm5xejlRMmRp?=
 =?utf-8?B?eXY2ZzZJZHJyTjhqMzUzU25oS3RjanZQNmlRVDhQeXZMdElpa2orT0pHaHE3?=
 =?utf-8?B?bmtCUytaK1c2UmRwencvcXVlR0tqcVhPZGd5TmQ3RXVRVmIxMkppK2UycVp4?=
 =?utf-8?B?d0JmOTQxMkZOZ2MwbEpuL0hBc0hOZjRXanVjM0tZRUF2ejdwNVVFOTFlRzZX?=
 =?utf-8?B?RVA1ZzVLUWR6emMzRjQ2TTBMRDhZMDc3b1RlSS9Jb0xGREpwODJ4UG9LQ3ht?=
 =?utf-8?B?cTVuMTVRY011eXowT241Ky9DQnNEekMrbC80djhlNzBhQktZUE9rYVRocHVW?=
 =?utf-8?B?SGFUK3dodlRXYnh0S3dmcWZpSlROWXhnSFNDZ0Ztam5RUVNDM2tYNHErUWFV?=
 =?utf-8?B?SEVMYUlxeTBha3Q0cW51Z1A5V3U4VWVPR3lhSjFEUmhLSS9NRCtYZWhMVzhR?=
 =?utf-8?B?ODBNV2Q0REdjOXE3TzczVlZnS3FNUWVidUt6ekFtMVIxY1ZDcElPQW5MRXNs?=
 =?utf-8?B?RU1HQnZwdHRDbmRQaG1nSEgvTTIyT3p5UENDbnBQd0hwQmV6OXhsYmZNVVMv?=
 =?utf-8?B?VkF5NFR1aUJRNCt6OXlKZHBQSXl5NzZseFJ6bkJNVGJnUk5qYVFPZkVNMG43?=
 =?utf-8?B?SVk1Sm5DTEZLbWdyVDdwMEZFKzQzTmpURXptT3k4c254U1NUMlMzUm1BVVMx?=
 =?utf-8?B?ZjNIWVZXbXpxdkxmMHJ6a3YyQ2RhaEFyMkRzL3Z3bG9QdTN6anFZV3Vyb1lH?=
 =?utf-8?B?M0ppdThmK1k4aWc4K2RlZi9Od0UzRzZSc1YvNW5xdGhnaC9NVTFqbHRGLzZV?=
 =?utf-8?B?Uk5ZeFNicUwxdmhBWjVMQ3pBS0ZtUStlQzJZeEFEME5Nd0RINjVPamlsbURB?=
 =?utf-8?B?K1h4bStHMGFQR1NCeVpoUS9rcjRpUlN6Qkk1RGMreDQ2S08vaGVjVlhLQ3hh?=
 =?utf-8?B?bk1yekxlMXlGdzRkODVFZlgxeFl6T3prYUZuS3pRQ1FrMnlCZ3REaW01WVJj?=
 =?utf-8?B?VFB5SFl1MTFpM1YxS0VsengzdThHR3JEZ0Z6dGIvVDlpek5WYmtwbEFnUGFV?=
 =?utf-8?B?QXBKTHJYZHQ3VTJFZnJCT0o0KzBuZGpkUURyQTdLaG4vdEFsT2hGUnQzYWFm?=
 =?utf-8?B?UUZPQm0yYW10SklhYkExZTlic2hrclJUSjV5azJCN0RkWS9STUk3U1ZUcEN5?=
 =?utf-8?B?Q3JKMG5zY1FLeVFBck1YdnpRLzVvNjc5SHJ2SU41UUJVbFVzdkF1WjBVYVlp?=
 =?utf-8?Q?+xjTikIpZISLAlf6zSuut48KW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37f7ad4-1a05-4bc4-29c8-08ddd97ff8fc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:09:42.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1szMZ1ZPXvpqeKpx/6hBAfCR0r3WFJcRzSd6nyAuQaSCVMZztvJWlLp/vdlhWOdRgKvlJ+IEtnZRKMq041wYlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add format RGB565 and RGB24 support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 7495400adc22..3de9007ad122 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -348,6 +348,16 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
+	},
+	/* RGB formats. */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+		.width = 24,
 	}
 };
 
-- 
2.34.1


