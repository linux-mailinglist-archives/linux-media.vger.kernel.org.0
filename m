Return-Path: <linux-media+bounces-40659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C9B305AE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC0B7AE3AC9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268DC313551;
	Thu, 21 Aug 2025 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GV9L+d8i"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0D26A09F;
	Thu, 21 Aug 2025 20:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807386; cv=fail; b=L1wYWGzgU3aIBxc7MHdF6Lk53KJtI+TipuFjc4VB1HCZW+NJQbdpBaMojV8sSo47Iz2PCkfLl/rzaQT7/YGqBQOaRlxHnx1W9CPdagtRs5Syrx3tHFA9wqK8ftASUFF3zziG9vpR9/HOo+HkcG2bExNNt6AwWBnvoC5nqsWK/ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807386; c=relaxed/simple;
	bh=cHVd3dk4+Wvd6gewVV8jF52PHkO4/s5j/6pa1Fi3I4Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NuHw8+76SXD44O78In20da905O9TzSBVu3UGL5FAQfVydtwJJLBkFKs6woJBzmVWWbftgADvXkFB72PJ7uv3hq0cCXJHaows5dE2tClwPY0IYIN8r++gRjxckWbZMsAd0TwQDISAsYzXPs6j242qV1LE1BNO5ZFk6SuWeCtGF3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GV9L+d8i; arc=fail smtp.client-ip=40.107.130.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHXu0dSxSR2/VVQRjaFRnxObQ4AWhZkLA/euUzNZ6palrLS33aayvh1APWVHXT4GBS10MQrjtlcwqh5BxT0O3kIj4Q6AD3zUiPwHesNbg940TIpGGAAm6HEv5Ya7QNpDKhLMIp1RF85p8jnb8q9Vu+0ebpcDpakNeWFvY+0u+5LKyeNQ76+OfvmYMMpS27qf0xAPAuGYR0kyudBksOGU79r0ADtd7yZDrmHJyl/N0nPWPMcm5XhpqGnqwpIwGkzBuRt7+cMZIJFvoKa9x3NvIXz4eme/T/ODeyuSw7xNSeC8bXhO0IR6r2o01wR+D5bwmQX00vZ8U0VULqeAlQIMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/IKrVeqR2kaTJLCiDkaafeUm1wnwrzEQuYrgccqs0Y=;
 b=Qui4IweP1FOPdgiPaMP0D+VuGcCpj9aIkklQkqpk7bdu9V2SQB5INSU2+Ft1TzPkp6px0gjys9c47kEEI46NRbz/dyxZfLNjEgOPVTXPxs1JTkFrnfE+wlYOFM9gE4FMLdPt2ggxIDPYIiYA/786H7aTg1fEXPm0X50/7agp1jRFlSRioq6h2WHDMoqO3s+deapFUA06X8nMFINYpnT3D71CEhLMYocCSrgHIovLd+q+Ezd/2/iiVzNAT9v+vAeVTcAgYJ9aVLbhqB6AS8lBIuHaHeMuDCKqq86asvS0JFqJSFzrY2AVFQ91meBJmwNqqz35/ocxDSWbrB19wfOv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/IKrVeqR2kaTJLCiDkaafeUm1wnwrzEQuYrgccqs0Y=;
 b=GV9L+d8iYNZtwC1awtocUTnh9RwkOB23U1Cq1+/gNw+FbDCG65cs6Ss3E38SN602tD1aqBhN8jC59Uqr/K0OEbdN1mrMNRuwaxKO3XJgMKwSraLZQmxT2bsk/i+z7Qbirsq2qwFplmeeejJjfX6tJMYllSMXTN9lweW6zhEx0UOjSXyXotVWQaXm5nTcGpiaa6xzmJyVlSvCbZuP1d3cOcB2/Hp02qMmkJNLDVoJDKMpoc16knsGdrdPhENgNblvCEGLHoPuSu+UaNABK+94GMHqZQn4VYBhn/ZMj814ChUAGbCFWlQXFCACNsSdyZN0mpsnOdYM20AQq6fwM9wIsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:21 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:21 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:37 -0400
Subject: [PATCH v3 02/31] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-2-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=2204;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cHVd3dk4+Wvd6gewVV8jF52PHkO4/s5j/6pa1Fi3I4Q=;
 b=MR3d66F2ITTAyRU1zEBcOm6gjCUtXpLbb3+wm25rzmzyisn/JV+LrbN6hQz481hyla36R4DZN
 jFJmkw5E9BOA7lvaHE4K1bkkQaXXnRxKqCqeS2cbns3rc6yPNeGjqr3
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea1e8ae-764a-4d3e-ab26-08dde0ef982b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UUs4SExGUStqekFTSzg3RkE1TFJEd282T0d6K21xN1hLQ2F6RUlFYXlwOEox?=
 =?utf-8?B?MVRyTm8xSm00VmcrZ2dSZFdPbm0xc1JpU3QxS1NselcralJkS2EyYW5aNDYw?=
 =?utf-8?B?N0dHNTFpcVhicEp2dkJaOTd5a2RYVXVFcUt2QVFLOUN1SEx2am1PZWxPUWRy?=
 =?utf-8?B?M0F5Qmpad0tEVmR1Nm5IN2R5ZmdqMFRUd2VvVk5tTkRWY0NDMWpXK1JXcVZE?=
 =?utf-8?B?MkNOTjd4Qkl0Sk81NmU0aVllMEZWeDBrRlcvMU1jWVlBZWc0VGJxcmFWWXk2?=
 =?utf-8?B?TG9tekZ6V3l4cjNRbW1iTTlvMWtIYnJPY2UybkMyclljZGV1eTd1MDRYeGdM?=
 =?utf-8?B?T0s2aVlhRkNhclQxTTFwM2hyN25oQ1YvSjVibldWNXMybHJwYWt6K0JhUmRM?=
 =?utf-8?B?Qk9LSWZaTk9NcklrNVZDNWhmVUxXdnlLNU9aRWd3MXFqb0c5NlNta2tucCtB?=
 =?utf-8?B?QWVLV0YxVzhHa3JiSml1dTZwRVZ4aCtEVlJBcmJIOWoybHQ1eDIrYTVwRkEx?=
 =?utf-8?B?WmZ0MVZlZVJPVG04LzhydStxRXp5YnZnQUpEQlAzYXhlWCsxYmtIOVdva2Fz?=
 =?utf-8?B?UW5jRk9BQ1F5d2JBeWxUL29NQXpRZi9Ic2VMcTRkb3N5YVRGaVV2UUdkNWt4?=
 =?utf-8?B?am5WWnRVMWZXZ0RRcm44Ly9RRU9jclZCT1BHL3ArWU9hbGxUYW50OXlBYmpV?=
 =?utf-8?B?RXJNdVozSFVpUzI0YzRVRGxvdjlVd0xLaFMzQkV2QTlycW9ERU1SMS9lb21j?=
 =?utf-8?B?OVUvMFMwVENYQ0YraUpteTVtWTFOZGluV3pGdGY5ZmNhMmEralVXTTZJb0p5?=
 =?utf-8?B?b3dwTHAyUDFmckhOVExIN3krM2hHZmU0YXNTRnVlMmdSaVdFQXdvSmRJSk5t?=
 =?utf-8?B?ektvbFdFeml3aGxyMUY2a0UrSjJLTWZOZWQ3Wk54eUF0NXNpNnA2UXFPSXg0?=
 =?utf-8?B?RHFUbGhMbnlzYTZ2cFNZT1lKUkVXTSt4WGY2aFowcTBTZDJjaHhwQ0M3SVEy?=
 =?utf-8?B?Nm9RbGU1VnBNaFUvUDcrS0ZMcXQvOWR6TjJKMzYxb0YvaUI0aDllanJheUxj?=
 =?utf-8?B?QWJaMmZqQklPcWpRZHNqd2VoNWR6aHA4ei9OVDNaVk5kUDJnTVhRTHB1Z1Fo?=
 =?utf-8?B?N2o2U1R5OVdjSTl5NjEwMVdMZy85ZG00cWxzRlRVTHJPaDU4Qk9jNDVRY0hM?=
 =?utf-8?B?TEREdVhwMjBSWk8xNkVFQ20wZzZoUTZjdHExa0tyMUpDN2V1YWRodC8wZmdH?=
 =?utf-8?B?cTBZb2RJalZIQjA3ZHNodVJLVDZTMGpzZWNYb01VZnBvRFgrUjJDU0tncGtk?=
 =?utf-8?B?cGJ5eHJnN1pDS01SaTcrZWk0NWZnbGdpN3J0cTdvN01SMksrcktmb0FReTR0?=
 =?utf-8?B?bHdLUk1TSzRpOVFTd1RVR0lId2VzaXlUZDhtdHJXUzZRcExBSnFoZEJocjBy?=
 =?utf-8?B?SmtlbGkwRkR1d0l4cFdtaUxsZDFibTNIRDQ1UnlCdHBSM3NPbWZnb3Z4QktD?=
 =?utf-8?B?UVJIcmhBclMrVXpLcXIxTVhMcGFtWGxKbjZyWUtKeXpQSW9qN1NvOE5TQ202?=
 =?utf-8?B?QVlrY2FueTZ2YkNIRDV2Qi84MmI1VjBGT2RIbmNLSzFBcXlCYm04MDdQUXlQ?=
 =?utf-8?B?UTVvS05tazZIbXdnY2hKTDU5UUVOKzlwZFd6NzRFV2VlM2lUUVhNbzFQUVdw?=
 =?utf-8?B?N3FodUtVbVFzQ2t4MmJFVW5Lb283QlhWU2RFQ1FSZ2MvMEZnWGdnblYwTVNT?=
 =?utf-8?B?c3ZDZnNsdzJINVFMazk2MTZJMEZERjhsQmRrc1VlY1JsQS9VcVNCY1NjbUZ0?=
 =?utf-8?B?SXVFbjd2c0dOT1hpZ0VrUTltRDRiV1EwMTdUU2J2N05kSWwxWUZGY2ZaV0xK?=
 =?utf-8?B?Y3NhMXhtb1VjV3E4bnhFR2NsTzBKU2cvdVhsMCsyMll3WU5VdkVvTmhVTEx2?=
 =?utf-8?B?Vm5uZVozaDBoc3FrdGRXK0FydDdsbDZLM25BdDFQMkhNNHNvM2s4amdjaWV0?=
 =?utf-8?B?cElIMTRFUkVIN3Y2ZkdVWmV4U3FEeXViS1hLS3RoMjRMa0pJNENvdnB5ZklC?=
 =?utf-8?Q?nxImzJ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?STJ0RjdFdCttTUc1ODJ6K0F5R3UxODZCKzI3cWx5T2EyN0FRMkRKckE0T3Jp?=
 =?utf-8?B?d2toM1NQeC9nYUlFVlJXQno1Skt0RHZSbE8xa2R2UFlCa3BMYTkrT0lIbGlk?=
 =?utf-8?B?Ynh3TFVwZGoyT3BFSU9KL1RMUmVBUkdRK1cvdnRXQlArRFFBNGtYeWZORG5I?=
 =?utf-8?B?d0ZDczJ0VzFDd21DV3lBTjB3aG9vN0NuQlZOK01wRXpVY1ZGU3VBVENpUHp1?=
 =?utf-8?B?MTF0UnJ0NWFkTVVtZzgrUEJscVQ1V3Y4UEpLUUpMM1loT2pvbjhERHdsQzd5?=
 =?utf-8?B?WnVDRWduNCtJNEcxK0RHMERDVEZMUTVJMmxJbk5xWXRhVUE5SVdXVnZ2RG4y?=
 =?utf-8?B?Z1JkaDEybFIzRURQZkV2TzJtZlFZLyttV2diYXVseGNkcDlTN1ZNSitQWW5I?=
 =?utf-8?B?bWxWby83QzdFQWlnT0EwUHJGemdxNHpuQkNROHFiVXBRVk9yTGxNUmZZMkYr?=
 =?utf-8?B?RTdFOUlKOWhqY0w5WStpL0IvbE1YWFVzUWh0NmNJMEcrZ0Y1aFlLdC9IdjNT?=
 =?utf-8?B?a3A3Umg4a0xUQUtmN0RJcm1pL3o5cUZON0xOK0dqREZ1a2lGV2lOd2cxRHp0?=
 =?utf-8?B?cC9vUEZuQ0dWRmREWklRbWVnLzFoejRNT2FIa2dxV29tU3hUTjNQNXFQTG5k?=
 =?utf-8?B?T05zM2poNnJNWmdmdGFVL1lndkFqQWRiZEZYdFRSaFdtN2tieDVjbUVMSnM0?=
 =?utf-8?B?d1VMZnZWakFwZXZWdmhpVndpcGJscHJRUGRUYTc1ZlBIZjBXMUtYWFJzQndV?=
 =?utf-8?B?Z2VuWWo3Qm9BY2owemk2ckJvcnZQSDBoVnpLQm03ZHQreVdOdnZ6bCtsb3gx?=
 =?utf-8?B?MHhaMFlya2pVTWpuTnQyZHowc2ErWmtzdXkwajVidWlvZnRrbHFSZlN3VVZH?=
 =?utf-8?B?MzFZbDQxeWNheVcrcDlKN29MdlB0c3B1R0hCT0pzSmtadXFjVmhTQ1NGanpS?=
 =?utf-8?B?NUJqSjBzSzRVMGlYQjc3ckd1SmVTN0hVRWhBNkMwMWNrMWVEcFNkaEJlU0RC?=
 =?utf-8?B?WEFWNTVDdGxMNEtJOTU0RTFIZmZJcmc0cUMxSS9XcGxVa0l3Wk01MDViTmV4?=
 =?utf-8?B?NU9ObEFPVDZWdzJuNzlmTFJFTGQvZUh5MHJncVlJU1c3TExqMmxFb0VJN1lD?=
 =?utf-8?B?MnZtVFVrQmxyOVVCY1kwK1dDVFh3TWNIYVVHYTRyTGxZbTJJWmRwai9tS3lv?=
 =?utf-8?B?NXk1VUtmcXhJb3hwTTFVcVZ1L0RldzJKalRJc2cvc3d2dVJtR3RmMTg0ajFR?=
 =?utf-8?B?ZUlkL0ZlN0ttQzhnYVdUM0pxMEd6U1BydFlHSGlEek4vMWpOSjNMNm00K3Z4?=
 =?utf-8?B?cFZPS2Mwd0lNZWRhS0xyZ1Y3aThLUEQzdUcvcnJvWWo0WThiRXpjUDJmOEFX?=
 =?utf-8?B?TnY1QzVDZ1JmL3k3L0RndFUwaEdsQTNUOWcyd0N5dG92YXUrVktVYjdFYnNS?=
 =?utf-8?B?b2JkbzJYcXhUQVRvT0pNNnlncE5pWW05WEE0U1lsajkyMlN2RDE4aS8zOHo2?=
 =?utf-8?B?RjJvZnVNa2tMeDkwUkpaZ3JpUUY1OC8weGd2TmNLWW8zUmRFU3p0SlV6TVVS?=
 =?utf-8?B?RzM2NWd3dmtCem1aenkxTXlqUlBCeFBpdlVJYzJUaWl4RVBvdlVodlVqeHlu?=
 =?utf-8?B?Q1QxWkRUc0pTN0F2R21zQlQ2Tnd1MjJKby9kLzhtN056dWU2eU1Ja3Y3V0lJ?=
 =?utf-8?B?a1ZSQ2sweTl3OGhOTy9NeW1wUHRtd0hsNmk4dWw5amFxbEJiU2lLRHlUU0tR?=
 =?utf-8?B?Q1VTbEh4NDhLekVjaTBmbTFlWTg3Snl1Y2FLL0h5NXRwUzBaVHpUWWtUL3BB?=
 =?utf-8?B?WEQ3MzMxNnRJVTlyL2xUelZKbXkwUEdFdi9xQ2VZM0gvK2NQbDRybDBEc01l?=
 =?utf-8?B?QUJ6SWZjY3Noc0lReXpRR1BvQWV5QW5KdTk4eG51ZUo1YmYxQkFrRzVJY2Jr?=
 =?utf-8?B?WnlRTXRFMTVLSnJXekdUWVRnWVpvcXRFUjBqSnVDdTI4bnoyVlVLZ1Z4eTk3?=
 =?utf-8?B?M3FrU2JNV3VtU3hRODFUejdzUEtHWjZ6OTFTWGFsdWdxU08raUtPc0p3eHlR?=
 =?utf-8?B?SmtWais5cTFpMWRDSmVJMXpaeFBTOVdpd3phZE5sU1VrM3hqQnJLRjN2NWE1?=
 =?utf-8?Q?LqgNkgY7vhpHUIvf7WAoIaL2N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1e8ae-764a-4d3e-ab26-08dde0ef982b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:21.2943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5bSDPM7zPKn1n01WNNPVcCj0M7Mm5eeV4tOd5JefhUfbL00VciVSbONao3uD6a0/9zNeOUPnMlfFZItudW/XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Add helper v4l_get_required_align_by_bpp() to help get width alignment
requirement. Basic replace below logic and enhance to any 2^[0..31] in
drivers/media/platform/nxp/imx-mipi-csis.c

mipi_csis_set_fmt(
{
        ...

        switch (csis_fmt->width % 8) {
        case 0:
                align = 0;
                break;
        case 4:
                align = 1;
                break;
        case 2:
        case 6:
                align = 2;
                break;
        default:
                /* 1, 3, 5, 7 */
                align = 3;
                break;
        }
	...
}

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
The same patch will be see at https://lore.kernel.org/imx/20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com/
dw csi2 patch also this
---
 include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 39dd0c78d70f7b935c2e10f9767646d2cedd3079..0a9da5e8daaddf26903d9ff4bed08b283dcd38b2 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -704,4 +704,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
 	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
 }
 
+/**
+ * v4l_get_required_align_by_bpp - get align requirement for
+ *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
+ *	given number bpp, get width's alignment requirement. For example,
+ *	if align is 3, means require bpp * width must be multiples of 8.
+ *	    bpp     return  width's requirememnt
+ *	    0       0       none
+ *	    1       3       8 (need 3 zero bits)
+ *	    2       2       4
+ *	    3       3       8
+ *	    4       1       2
+ *	    5       3       8
+ *	    6       2       4
+ *	    7       3       8
+ * @bpp: input bpp
+ * @align: expected alignment, 2^(align).
+ *
+ * return: required alignment.
+ */
+static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
+{
+	int pos;
+
+	if (bpp == 0)
+		return 0;
+
+	pos = ffs(bpp) - 1;
+	return pos > align ? 0 : align - pos;
+}
+
 #endif /* V4L2_COMMON_H_ */

-- 
2.34.1


