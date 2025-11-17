Return-Path: <linux-media+bounces-47226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2154C65E31
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id EE637297DD
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 19:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54C5346775;
	Mon, 17 Nov 2025 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Acskasg0"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23DB345CAD;
	Mon, 17 Nov 2025 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405934; cv=fail; b=eZs7Ab4SIZpV3In+L5fcWONGe843sYpfgeo9PLNOLWZUFkaRrU9I/y3l+7JVM48XY2nV1xUDPeXfxlm7JV9E4gk2ZDslK3koIT0wPvb2H/VANf2l/jbAC1bJYbu1yoCfbKajD9oHJjoVNWXhzrKlILfpwto1BmkiyMxyhWDvxOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405934; c=relaxed/simple;
	bh=YNPqdD0kd3pdtCVRYCUxeHy5zguOY4Bm/pVnyP+rdV4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hRfKWuINRFSNhw+RG5CV6yb2Uv4f/tbhAOVVabLyiN69PhdkulA1/ciSS3aRpmFGCiAnvrsJjdfpmTWXutITm4rJcW3JkqgCG+E/PR1Aee11uupRr+4yT3H1Ep0r0BPjyxqFXZ61mQeq28UUQno3aXIQ8itSeiLmvBbRE36WRAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Acskasg0; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hi1s0OwnmPmW2tRxBR/M+2JfHeSruZoyHhABCpEV/70fe1PrGnv7UtzieGFA7Hb3eylW+JYPsyykW9DHNCYfJpOWLnMuHi0SA6idDymIilCLuEYfONPhTlomUdEHe4E/rIAutoVnHqd0/TSHafNTAwXBITvFCs/BaqQ/INDOSeGJWVbM3BY9xpvEV269aR1uaZ6IsqQbAY0t/9IJxseMpToe81ngIgTVg9MGpSaeA4kullD8dhBU4wN27Z7V1ZMbyOKAthSORfBJx6butSu1iMt4glrr3zzkitJ4sdlJhE1PEtIYnX/hqs6mB9P57TExnH3fz+S5dydaeoa6n/4Q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD/yjQP86hb2xgIO8HmcLBuFMjM29JNMeVd8HfBQ2mY=;
 b=n56eDLr45BaWuKGncvBzkz/3kuSTwqgL8lbFWpsabUF//VomvIsMxkRLFXBa0KyjxB38iVZQ8spgLMt4gE3/ZNxsy4OUASfCDgcnb/LPCYmDlnSLNqV3SlQTM2yT9kR2yGDecUG6ybj8JPmato4NAwRNUNKFe0/pirWX+jBVd/iqULAJuXpv/X9I7HpCoNODCF+1W0ISAIy6Wojo+tGluhxMcrN5virI4dI1tFrckcqFoqQMcQKzf/Lv4MaPY1YEIqtSs7uSCmi1SLv9mLO8KI/2CqS+1k6qw4Vge1sFOGQl5HZIXr49vTzem/phajZc9pbo+9ghaW3xSX6b8eN9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD/yjQP86hb2xgIO8HmcLBuFMjM29JNMeVd8HfBQ2mY=;
 b=Acskasg012CcQJc2aElYjnjMlzFbrUHkCQQLvIDKVPk/veUdE7PuHaeCjdaP7MkfqWA3++ZzOck+DBuWtr5A+l8zwVvIvazsSFD9HPuajj7OwnYRdAYtkc+1AAfwXhbKnNInWaCHHLfF4oLIyarHT4VSlfuSrQkpK2h7oHcT1JfzCApGIf4X/7jThTpJxe02NOomwUNqT3TYg3VunXEvUn+f8qxwM2fAIZnkAM+bc16QOv3OTbOH4fDK1BzDEZ7onru8DmTytZghU3jI/42wEJOcn9A3O06jy1uq/5xo/o13F5x+M6lSNmnd5RnAvr+2i1wuc2JFGJnLVT61TSNVNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB11030.eurprd04.prod.outlook.com (2603:10a6:10:593::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 18:58:48 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:58:48 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 17 Nov 2025 13:58:14 -0500
Subject: [PATCH 4/4] media: nxp: use cleanup __free(fwnode_handle) simplify
 code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cam_cleanup-v1-4-6cd42872db79@nxp.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
In-Reply-To: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763405910; l=5050;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YNPqdD0kd3pdtCVRYCUxeHy5zguOY4Bm/pVnyP+rdV4=;
 b=KexX+ebW9GE8ZzA6Qww9rFGMcjivsRHvV0E0/6frp+iMypAUZANiNv8QkNAMiUIyghivV/A+r
 KiKjzFFtV14DS0TbapIbyhdOSF0Ik01evyprHY2y5cEDXfpQK1OLich
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:510:f::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bfda3e-eae3-4566-d7b0-08de260b573d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SXIxc2hadnc1enUyU1orZ0R0R01veVV4THUxbXFTV2JucUQrdUEwYWlZZXBu?=
 =?utf-8?B?N2R6SS9iRit0S2FmR1hEMzE5VHBQUFhwVzJwcW1lWXRVV2dwNWFPd2lzRWdH?=
 =?utf-8?B?ZWdXSnRib0htZ0N0bWROQk5pV1FOQU9HYld3VGt4bFlvVFd3MFJSQU1zWjY0?=
 =?utf-8?B?SlZGQkxxYXNmaWJnaUt2T21rc0ZrUWIweElETEtmTGdPTzRpNFd6a1NNQ2Fm?=
 =?utf-8?B?Si9TL3Q5ek02SHVRQWFteTJCa3BSTnBQTkZkSkJnMnppRnhPdk43VWdmMjBO?=
 =?utf-8?B?UTFKWGFvSWwrQXdJQVZ6ZnNYRUNIRE9lcTluaXkvQjhlS3BncmRRelF2SUUr?=
 =?utf-8?B?cnBFbUdxdmZ0N0x6dmExWCt6ajY3S3l2c1ZmdDZuanJqVS9ZSklyKzAwYkVG?=
 =?utf-8?B?Y29KOE5GU3E4YjZkSEl4QUNhSGg1RW9nZW1TcGNLMTl6STV3eUF6M2V6bFF2?=
 =?utf-8?B?aGt5cUZvODNCRHFPN0t2VlZwQTZrckIzYnZNL1RtdENKYU5tdXc5OG9QYmtM?=
 =?utf-8?B?eHY3WUdTNXZYUjdOYy9zeVhQWnEwcWJ1cFFBTGVQVjB6STBvY2JFcTNXSVlP?=
 =?utf-8?B?MHF5Tmt6TmNld0xGRlI2dVQweERBRG5OZ3lCMHFXSWs5bVhCQ25pNEtoZTR3?=
 =?utf-8?B?UFE4OVZOUGpuSjBOR0I3TVlMSEZ6b3BZeW1ndjQ1dGdmRUhJTFVvZ2Q4amhx?=
 =?utf-8?B?aCttME9RWTdSU2pTSTJ2RXFPVlhGUmIyaTFaMkthVGlMV2VZQWFEK25pYlFz?=
 =?utf-8?B?Qm5JVWlGSnVuamhBWHFiNXRjTnRWMitVRzhCeDRIQlQ4RDZRSU5Dam5WUFpM?=
 =?utf-8?B?Uytic0cwZGI4MHAwdks5cHlGYXBWbGJZcHdkRE0yd1ZoMFI1NXVpMDFNTUlC?=
 =?utf-8?B?TW4rWkptY3FLblo3TFlpaDNTb3ZQWUZxU2VKV0xTcndVTjB4SWREMkZ1VjF1?=
 =?utf-8?B?cm9SMVNWQ0ZMYlVSQlFtL3luR3VJTm42ZzRycTBpQ2hXTllsRzBMWXlxTHVm?=
 =?utf-8?B?bmw0MVI0dVlKMEZhVytKSmphVCtDYkZnc3NXNkd6aDB4TUpTVXVQQU9ZTU1m?=
 =?utf-8?B?K3grM1ZwZzBaanYrakdvOW9XTUIxbzZsS2V2MmZQUnFrRmVWR2xkbXlwOGgz?=
 =?utf-8?B?ZUFQQTZhT3FSZU9GRUk0U3BJdG9yY2R3OGpPblByQ29BSnFkR2JKS0tkaDI2?=
 =?utf-8?B?aUhNMTY0dGxWS0IzWUhGOFA1WDJ2R0xXeC9DUWg2VVl0b1FJc0lzTHI1dm0y?=
 =?utf-8?B?OWJ5ck9PcWFsa0sxSW85V3hQK0pXTkI3MmdPVHRTdW5rRE1WQVMxVWJ0L1Er?=
 =?utf-8?B?MEZCNjNwSnJBUSs1VmdjTWdMeENUQ0FibFM4Wmx5THNkRXp6dzZiUEtFUGdN?=
 =?utf-8?B?QjhBTGYwbzU1VEJLSmZxb2N3Qi9jOHB1U1liTGJ0UWN1UGxiVTdhdGIwVXNQ?=
 =?utf-8?B?RElmLzlQNDR5MDdtZnlYaVdyWk1WV3JFdTAwVnFJWXBvWldoMHR6SEwzckVM?=
 =?utf-8?B?SUdPZHlUZzF3aUt0Mjl0RkVIRHRZd3NpZFRaU0dmbWtyMGhBQkI5WUdxdUJq?=
 =?utf-8?B?U1B5VlFTWHJ3amsyWnRIRUNMYi9IeXBvdW53ZXVoUXFaUkU3eUF2UUpnb2l2?=
 =?utf-8?B?dG5rSGhJN3JUTEZ4Ui9RVnpyUUJHcHcvWkpJNFVZeHZjQ09OWGtSaEFoRTNN?=
 =?utf-8?B?M0U2OTk0TnNaUDA0UEZLZ0JsWG56MjNRN2FXOGhqbUdlQ3RFQlVZaU5FQWhl?=
 =?utf-8?B?Y0RIUlVkSXNZdHpqdFNvcUdBMUw0OUt0aERDdkVyN283L09SQlNucGVoZ0pu?=
 =?utf-8?B?WWs0bUl6WEVmcTZVVG81SmMyclhKWVVJRUFUdzhDZ1BsK0dvM1NZbVFkY1lM?=
 =?utf-8?B?VkNoSFc5ZVNIQ04zOVJrNUxJa2ZKcmNGbDM1cWwzYlJtOUhhNUV1b1oyNDNx?=
 =?utf-8?B?dUVEZE9HMFZvNkhaK3NaSStwQlM3dU9pYUJPV3V0TmxwR2ZhYVBzaUFldlJD?=
 =?utf-8?B?eWFpdUE5NmlpenJrZnJXNHk2V2c2bDNKQ1ZLdDI0OVF4SGdaSTZaUklTWVJX?=
 =?utf-8?B?RVlRMUt3Um5IWU1PQkJIazBhVDlvVUVmQzJEUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c01RN2FxZ0VmTmp1TFhHVjUyVGIrRG41U1FtQ3U1bG14TFBySEtBSzlQTk9P?=
 =?utf-8?B?V2VaT21jME9SK0RFZGh1MFM0VlNYWkh2Tm1UeXhRS0Vua0Y3Q2N3Nnl3SHRS?=
 =?utf-8?B?Rk1Jc3NTYTE4U1ppUkhack5lV1Q3b1R5MlNrR21vcmcyUlpwQnRraHE1eFNv?=
 =?utf-8?B?dVJRNjlBbzBCTXdRNGJ6bHZBNEF1bEYxZk1kRXYyeUNmQUxBWit1aSt3RlRP?=
 =?utf-8?B?ajZ1S1FVWnJ4NjdZaEtiV1FNRmhpUzI4aDdub0luRkYxaHAxcU9VQjFCbVVi?=
 =?utf-8?B?NnNoSnpXcGZHYUFkWXFWS1pRblEraEdwMGx6dlg2dDJCUG1XWXRlSkxvVWdP?=
 =?utf-8?B?enFGVkdPN3dKVU9HaUI3cU5SaEMvd2RVc0xmenRHZTNmVDgzUUlZTWtCWEUr?=
 =?utf-8?B?bDlZdzVoYlQ3M2FmMm4wcGR0TmZIeGJmN2h3OTY0RmFEZllJeGJUanZ6Nm1Q?=
 =?utf-8?B?QlBGVWhaZzZMK1ZPeDZHKzN3VkR4a1RMZjRhZlc0OWxDL2VTdWtHajBRYUhP?=
 =?utf-8?B?N0k0L21LcDlpQllscXN3UndyZnlseVNNYVJMZThNN3I2bXlmNFcrL2pFL3ZW?=
 =?utf-8?B?UlNyUWtYWmVjbC9HQlpVVHR0SFNJVFh1RGpyeHVURVRucHdqOXVMQ1VRVW9h?=
 =?utf-8?B?RVRCb09iQW5ZeHd2ZVZ2ZXFqTlRjcFl4NS9LaVdTMSs1MXJzK0xwUmFvYlZQ?=
 =?utf-8?B?WldtQ2FPb2Ewek5aN0JQdUFLc2hnT0xBUWRBK0dhNnB2TzZNeTBvU21IYVBT?=
 =?utf-8?B?NmtHN3pXd1ZFblFkdUpnV2d6N2k4Y1JBMCtxKzBCejNERmxYTnpTSHdwVDdS?=
 =?utf-8?B?LzZFSkEwbkttTmRCSlFuSmlWamRraWxST0tYNTNuUFJJcTUzVElnd2t3NjJk?=
 =?utf-8?B?MXo1NEhUT1FHNTFhU3ZoZHcrcHR6WGJNZnVDSnZhYzI4b1Ruc3RzR2I1d1Q4?=
 =?utf-8?B?K1k0VU05ZHNhQTFPWnBLR2FRZS9MNVB3eGxDRzZYcHB5b1l4azJwN0d3NVBK?=
 =?utf-8?B?b3ZORVA5Q2hySVA4OExMVGlkb01ZWDkrc2E2RXY4SG9heUdNR2YvLzR2Unk4?=
 =?utf-8?B?VUpkL2JmVnViQmZVeElmZnhNTitXVSsxQmoxVUZVVWd2cDFOaVlDQXM3b3Az?=
 =?utf-8?B?RVFld3Uzem81MEJLY0h2S1JHRmhSZFRaWHozRndlRzg4K0NrUW0vZlluUTJv?=
 =?utf-8?B?MTVKSzJ3aHJXV3p2M0JSU1lIS2MwOXdGeURSL1A1bWwvSXd4bVVKYjFwVWdM?=
 =?utf-8?B?aTE2MEY3QUUwckR2UVVHYlA5dERJK2p5TXpDclRaR2tYRFNyNVFBNDduTmxL?=
 =?utf-8?B?Zzk3Si81cVpTR2JpNW9MaXNhaDdQNkxNMmxyRUo1NlZveTdvTDc3TjdQUnkz?=
 =?utf-8?B?THhZaFc2STV1Uk80Vm1OVW9UQ2ZmdHIvR1NDcDZmUHByR0NSTVZiWTBCSUJP?=
 =?utf-8?B?aU9aU2M2RjU1RnVRK1FBLzFRRm5vVktna3l5Rlp5ekwvOUFYc3ptY0Mzd0tX?=
 =?utf-8?B?VGlNZVEzLzViaHVvUWQwRlNBdXh1Vk5CWmVRNzZSclQyWjY4cm1HVWR6aThY?=
 =?utf-8?B?Z2kwVVljQXdhTmdaZnR1bzZHRnordHZkdndrL242OHV0VlJiU3JSTXZRQjhX?=
 =?utf-8?B?YkozZXFPVzllZHRZRW93cDlrMlBON3l0KzZPcWtSNWpPRXBNWXhFNFFGaHpx?=
 =?utf-8?B?TXNQL2gxZWVXaVA5YWpGUmhyYlovVzVNUWxKU0kvZmtDNG1vd2UxUjJjQ2dB?=
 =?utf-8?B?c1hqemNJZXpwMkZ1cTAwclFRNkVWNUhKQ3lYa2FiODFjdmFIY1I4LzZycHFM?=
 =?utf-8?B?R1Y1TnVGeUlWUmQzeTBqRzR2R3MyRUZ5SFZUZC9KVlkzRVZsRmttQjI2YzI3?=
 =?utf-8?B?SVgzOGdnckJFaG5seHZhcisycEY3SzVlMVJ5ZG1oemNMQzJZVktzclNneEV2?=
 =?utf-8?B?d2RicWtuWlBPaDViVkpJektqMmlHOUFseitzNG5lSmZVZmlEYXZneDFBeXR3?=
 =?utf-8?B?bWduZ0Exc21SM0pmMjRqZ1Z6SGd5blFjREpvaGxheEZUYkdCOFJDbXFBSzNH?=
 =?utf-8?B?TUpndG8zRVh5MlNQTm92S1JVQVNVak5tUk50ckhwdXMrWVpNY3MyVXZWdzhK?=
 =?utf-8?Q?4jLP94QrmobICLZ5DP5LecZsA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bfda3e-eae3-4566-d7b0-08de260b573d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:58:48.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBx5HzVg/udXTJOioGJatsDNRgy0NBo+THLpC9IQ4cPdhctbQERdLBHcYU/iBv1ywS3U3RT/zRpcRP92MUxIQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11030

Use cleanup __free(fwnode_handle) simplify code. Change to dev_err_probe()
because replace goto with return.

Add missed "\n" at error message.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 31 +++++++++------------------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 31 +++++++++------------------
 2 files changed, 20 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index ce93d868746f002c22e2f86b1e0aa84ec1a76061..d924adb406a30797b66f0094ab17e98ad44fefac 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -12,6 +12,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1349,28 +1350,25 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
-					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
 		return -ENOTCONN;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(csis->dev,
-				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(csis->dev, -EINVAL,
+					     "data lanes reordering is not supported\n");
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
@@ -1381,12 +1379,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
@@ -1395,11 +1389,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		return ret;
 
 	return v4l2_async_register_subdev(&csis->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 75709161fb26a61239b94430365849e022fdc14f..94882568405db55593c5c51722db2233a64d53e4 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -717,28 +718,25 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
-					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
 		return -ENOTCONN;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(state->dev,
-				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(state->dev, -EINVAL,
+					     "data lanes reordering is not supported\n");
 	}
 
 	state->bus = vep.bus.mipi_csi2;
@@ -749,12 +747,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
@@ -763,11 +757,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		return ret;
 
 	return v4l2_async_register_subdev(&state->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


