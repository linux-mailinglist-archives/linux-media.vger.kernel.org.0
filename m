Return-Path: <linux-media+bounces-39180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29422B1F10F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96027244AB
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CD728FFDE;
	Fri,  8 Aug 2025 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZvHdBoUU"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924529C33D;
	Fri,  8 Aug 2025 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692967; cv=fail; b=Xx3WAUgB6F3sdlzGpmbPfATMqVv9vLcymtaYHNRECF+FfySaa401bPQhZF3JVmtjk4bc8cbfv5Ws0KaVlrTjq+KCWshQ8jRS7KE3VxUnjFCXHvOkNPDKEDPpz7Hvq377CB8TtOvOm2UJt2hboUn3U4pX3ULvDbZeklpMaO5tV0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692967; c=relaxed/simple;
	bh=daq7i7aKSsCMzUnlX1mBjXMtMkUE1oaGrtxxI8/9Ybk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VeHb5pSdHKTgAQiJGxbXUirq8w+zGubSAdfLxdDhsYRMlxtSS1vJaeaQ3lSiXft7N4fW8khxAF6uV03NJayk8nUeEJWAtMgjw6TmyuHBOLgNf2xvWbJoG6A6d99xxOXTcynSB7gwYk00x/brasoBxxHo9qdPrFOyIRz4CnYiW0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZvHdBoUU; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpuX2FBOA8bNvcYH3Slci5LGFZRWUz4T6j7UiBmk1X0qK4fAZ7L026addPyDzzb1dyddlE9KdG78F16OR9WFyJUIZcMOsvRgF7ppRotHKyuLoZhDZegEWmoZyvCCLIcoXWBXerM7klV2H5Wr/r4L53CxzG2nbEY1llR04ChfOfRQPHGywq0fQDe9wqCGiY2+rr32Zk0GO8ORcyJgy/m8Gr4XftRPIGweZahUPWcUGVobWTdvhCbPLjXSEeKLa7IEKBcTXA5ncTyO/S4crW85jdIrP0zSqzF819zUSE5RMYlfxJVQzLplWTUHj3Dl3M/n8ETEl/MeN/g1TRgsQ+YsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YARIe4vs+wjpz1oqgxjWigWW95mmfbsjBcF/8pJ+BkY=;
 b=PS3pwq+eL4U3z16IRAb8Nm0OOc/xpFpc3gTUqzLQkjinRJXUz+oUtGIYA8pZyT4vWQ8aNOV8liI8ZBHRK3ddIV4L+nONIDaGqOA2vUfUMznWlTVBUOHhbfdalNquJFQRx1W6dnxW2kZooj29K+ic3MYL5ZLy1308tRgyAo/XOc7V7nmwQY3iPEmQZfqFWO9Wi3xJlYE5NRuW1NskFyymvHNmWghuwROSoviKsKf3pFVvkHb8tMQ+9mGlEY8lJFCHCJ6r+wHP1hfAtZEoNMDf9tAYyODRG+J5kn6b1ntHzSreMycjPvcx7SF4AF9fWZubNZGre9cFdh9Hv31C8JPYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YARIe4vs+wjpz1oqgxjWigWW95mmfbsjBcF/8pJ+BkY=;
 b=ZvHdBoUUlatDWADaFNN3k0mzCAWIsSAWlZOaUR6V1lgQ8AtNmZr2ukeoiEEcfEfimVx6zQXAP8KOvMwMeKQhJUG6KzY8BzgGKpEKnndL/7S+1rynO+qAblCdJg3kfV/9w2uD5thDW99xCXZffvjtTxQWXQ2JRXNSLrMif2Wj8m0DUunLOJcVYmpyyVCwAJpmMBu4xZv+82yasU6rXE0pOHeQHRgXAn8wbK2FxwUIP41ndv5TiEZ1HvHBF4yrFPVCSBO6ij7kGmZwtc3IX6kUV0BGrNaf8tu93IIVIcTMg/TTFbqCzq8GJhgoHk7atTT9Ype4tdIrfeL+VvjfXZ38tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:42 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:31 -0400
Subject: [PATCH v2 28/32] media: synopsys: csi2: use standard
 v4l2_subdev_get_fmt() function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-28-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3568;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=daq7i7aKSsCMzUnlX1mBjXMtMkUE1oaGrtxxI8/9Ybk=;
 b=U78kU4Hicw33T4W7HaFXpx8dk7HqZiM2P6P3d5duLc9VYurn6VXnHkZD9quNHfBGp9ge2+UGp
 almuUbCQkDLDew6Bga+g1zVoPLsdv//gusowsaYE/G48wMiPnyZOijn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: db26c3a4-00b1-49b7-0d44-08ddd6cce294
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WlBWc002S0diUHV6SHRGcFR4MVpwanl2b0o1MHBCNnRwczNUdm5oWllWR3BU?=
 =?utf-8?B?WU1kL0FHLzRadFIzM3B1YnQvZHVGOTdwZ29kZmNCSXMxU3VwaWtlTFlhQTd1?=
 =?utf-8?B?aHZIZCt5Rmhzb2lpZmhWb3QyLzRWaUhNVXlsNkU2ZEFsMk5hWnZZV0ZSOUVr?=
 =?utf-8?B?d3NGRnp6RTVKUXlaTVFDaXV1WlFVQUNxQ2ExdC9GRmY2UU51WWFDUHp2Y2E5?=
 =?utf-8?B?UHFPTTQ3YnVQL05mNXlDVFZhSDY3YkoxUklWK1FTcjhYcmNPTStxUXpQSW5h?=
 =?utf-8?B?VzhxRTBOMVFYZlIzK25DcGFIdTliSWRjZ2J3bjBkT0RJSkVsMy8wOWozbTha?=
 =?utf-8?B?bzR4NThDd0kzbXIvOUNDa0FtTytLV3VzUFlBMEJJdmJCR1lPYmJBTFZkNVk3?=
 =?utf-8?B?bGVkZlQ0SEduWmtzMkFzRVJqcXJJQ0dlM2Y2OExEdlk4WFNrRHg3QlJyT29t?=
 =?utf-8?B?UURkMlN3TjZLSDFCd2l2bUh6Z2JTaE1ZY3RhS0FjTy9IS1BiVGhSR3k4bE04?=
 =?utf-8?B?UitnNlE4a2NWaGdCaVhmKzdFcVo0bUgvWXplbzk2QWZwRExadGs1WlZLOEVz?=
 =?utf-8?B?NmhsWSszL1V1MGtJcElxWEl4WjRtVWpDQlE5QWh3cFd0c1dHQ2VPMkJ0bFNX?=
 =?utf-8?B?S3RkSitMNUZjYS9GajdJN2JyNisrYlkyTWxqV0plMkYwZ09JVER0Ri9nQzRy?=
 =?utf-8?B?V3JoMUo4TjBsQXlKSTN0dmNYTUh5b3VvYUNmZ0JxQlpmMktUK1kycGFNbHZT?=
 =?utf-8?B?K0lybHF0ZmU3b3liUXJ3T21lMll6ellaQVZNajFYWjR5NitJVytnNjZTdzJi?=
 =?utf-8?B?RDhzZlpFdTZCS0doNC94TFJweW5UQ0NiNW85dkJkNTRFMTBMbEdGMmliaUxO?=
 =?utf-8?B?d3RnZXlIY0lSM09JVURpMk9sTlpmbzJudmxxbDBPUUxGZHhEZDBmZnJwMXRN?=
 =?utf-8?B?THNhVkdncHFyWHF0di9TNk4xYTV4RHdLR2VoN01WUGd6N2x1QVM4VHFva1ow?=
 =?utf-8?B?SlZGc3ZCSXNzeWsxeFViYjgzUUp3SzhWYk1JeTFjZFJvbnVtYWwyT1J0NjFo?=
 =?utf-8?B?VDViYXZRb2xHRVErM0tVVkFJOHJOSjh5ZmhYcWVySzBRUUxhR0VuK0NLUDM2?=
 =?utf-8?B?ZjQxWWdlSnVKcFdVUGRIZG1tZytBQnplaU9ndXNBUUF6R1oxYUowdlR4TGN1?=
 =?utf-8?B?WUdPaE0wdHI1dGVvYTR4cC9DVDNueVptZS9yVXJnbWxQYmRHMEpLMHltTzZU?=
 =?utf-8?B?Uy9DZnpyQWpua2lnQXRTQ0ZVbUNTSmwrSDNsaVpoT1M5NGxrTXJ2VlptdVpp?=
 =?utf-8?B?dkFwZWtDMVNpZFl4cUpCN0dSWDZxZFN2NzVUeWNGak5iTjlpYnhoalB2Vksv?=
 =?utf-8?B?THFZNkh5TDRFVGJyMk4xaHNHbFNKZFlqdk9iV1FLMXBZT3AwM0QrRWJKaTVh?=
 =?utf-8?B?Y2ZpM3o0UVFIem1xZnFxRTdVRlVmTzVRNkY1TjNsSDNuWC96VGdzSmpsczhU?=
 =?utf-8?B?OC9zV1hneDErdGo0bi80dDIrb0llQXZCZW9CUVdneGRmYm95TFhsOVZpSXJN?=
 =?utf-8?B?bEZsd0dTQ0U2MHhidFRJK3M1TTFNM0RYNkttdHFzS0N3TEhzY1c4M0pqbktr?=
 =?utf-8?B?bTVNOC95dnRxZU1MZnZLQlo5YlNmTWViR0xDcnlQZTlpNTJoSUl3aDg4MHRw?=
 =?utf-8?B?T0NkdG9aaG90VU1INEgrOFBHSHRROEFsbUhmRFZBcENBMkorazhOOC9ZRmQy?=
 =?utf-8?B?aVhiejhtdnNnRnZzczBRL3ZEbytFcUE4YVFyQW5VVlFkZmNDc3BJMTIvQ1JS?=
 =?utf-8?B?VWtXNFV5S2hLUUo3Vlhtc0dhRmpXK3RFNEpVSHNMdzF0aENVSDlCRVFCZitE?=
 =?utf-8?B?NlpVOFN5c3RtRGhieThXYllYL3B1Q3pwSlRydWNRR1NyZXBpQnVaZXBTT0U1?=
 =?utf-8?B?UlNvM2trT2ExeXYwbmZPSlpxSTBFRlVFcGFFNTlCRWkzVk1sbnhHK2piaGds?=
 =?utf-8?Q?p6EAwBpZtwVIvvAP0Df52cEt3YgRCI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cjF3SktSSTRRRE5CaXJiRndmMGdyRGpZTzd5Q1BGZDBTbXFMMEg2Q1pBWlI0?=
 =?utf-8?B?OUhPaW12eGI2bDN5dFdzU2V0U0Q4QXl4VTJNM0U5RVBTdzVpMHdwMXJKOGU5?=
 =?utf-8?B?Zk5DWWJGL3htUUFncFVsU1NVdnJTY2pIQnpqVmVKL1NSY1hzZXN2MkZGd0k5?=
 =?utf-8?B?WGR1dHdKME94WjM0YzRFUWFqeGhNNUd6dEtjKzFRZmdHZW52dVhIVTBEKytk?=
 =?utf-8?B?a2pGVmUxdE5xTEpMTjBmcHJiS0JoWFJpNHZyVS9zbVUxcVlhWWFJRnFiOWFM?=
 =?utf-8?B?SjdBYUtzblpOUXJJT3Y1VGhNYkR3emRxM3dZaFBGdFZYTUJMdXpIVkdDbEdp?=
 =?utf-8?B?TnJMMHRwRVJTWkVZNmxZM3Q1dlE3aFJsOERuWEJ3MXhuZ29CWnVDZjJmKzkx?=
 =?utf-8?B?eEE3QkFNM2pGZXI5K2s4eE9DUFV4MEIrcE5JMXRHbXB6WlNkSUtoazNvSlVn?=
 =?utf-8?B?b2xFVHFmNjBRNWx0a3NXYzV1OExDL01Kd1ViSmRKUTVVNU52OEtNQlVMQ0NX?=
 =?utf-8?B?Mi9HQ2R3NmM1OG1kTU9mNEQzemRmL1Fwc2pYRmlLK1BIKzRhY3Z2OEhId3dh?=
 =?utf-8?B?Q3FtclR6OEFlNU5yUURHSlRMNUwrNW94S1VYbUVPcmdVbVVhWXdjWnFkNXdQ?=
 =?utf-8?B?Vkk3Q1JJdmI5ZnpNaE1icmtISG1kTWVKSEVTYU1UUWR2UDJNK0tnS2laU2sr?=
 =?utf-8?B?azRBUklGL3EzSjZYaFpqeEJsVkkvVHJuWU1LVGtlOG1qalVJZVY3S0lMMWM1?=
 =?utf-8?B?TnNpS05HdUJBN005RE9NbVBWaTVjN1JRMU1YM25PUjF4NjZ5MG9LV2lBbVc4?=
 =?utf-8?B?TmhNaXZscm8rN0p2Z1Z6RU9XMGNRaGlyWjZvenJpUzV4VFdZSXJrS2ZNWkRE?=
 =?utf-8?B?emVwaGJXc2I0bkwvMkV4RlkyVlNWUlNXVmpPVTV5RnNhR2FBVTUzVUd0OWZC?=
 =?utf-8?B?VE1XTzdLZzFPWThFVlpQUUtLTzJ2R3pGM2R4UlRaL3NCNWhDcUcvMy90RnF3?=
 =?utf-8?B?aERlWmwrUCs3LzQvTEttQ0l5eTkrelpaS2lRZFBGc2NLQzZZRU5rTUxlbFd4?=
 =?utf-8?B?a3hUcHZCbnEyZytLODJIVFFZclBBSGJnTVFaeXBsckh4eHJ5ZWpuZlZWWXh0?=
 =?utf-8?B?anBEU0kvVHY1bUx2alYrOG9WT3F2ZVpsOWFxSHR0cHFnSVZVaWpxUGJMMEhZ?=
 =?utf-8?B?WUYrVEJsaWVFTXhJYjQreWZMQjVyd2NtZW5oK2NMMUIvZk5Nb3AweGdQczRZ?=
 =?utf-8?B?SHdMaDZsc29pdGhHUUdseWFJZVU0WTI1N1dQR3pIWFhBaXRWdjhseUYyMWZy?=
 =?utf-8?B?UzVDZ05OV2sxVTFOYm5XZGgrV1dsemdZR1k1M2lmZ3dwNXZVcG5NOTI5Z2FN?=
 =?utf-8?B?RmNiMVlkZk9PNXBWdVJyV3V1SE1DY0V0ZktwbFFNd3pFK2NvM3hnTURFZHpq?=
 =?utf-8?B?T0ZycHNZZEVjNkNOQ3EwYmEyZGl2OE1QRnFNZ3pIcTNEejg0MjlNS3V6c3Jm?=
 =?utf-8?B?dkRybHlKWndGUzhxdUpHcC9SeDVWZXl3YmFoeG9BcFBoNHhtTGVkNS8xRllz?=
 =?utf-8?B?a2FpNEs0c3RFTnN0LzJoS2l5bWpCek1ETDlTbnFOSm4zazZZNEdqa3RlQXh4?=
 =?utf-8?B?Rng1Y3EyV0o5MEpjekNyYnErU3duMklrRTAzN1FTNk9sa3RIY1dDK1IzclNR?=
 =?utf-8?B?Vm5sdVBua1lHNW16TUN3VWEraDlnM0NDL2d1SlUxemFoclBSRWN1TnhBTkJv?=
 =?utf-8?B?aXFtMFNKNlJKa2YvbU9aRUc4MVF0N21mY0JqN2lJQzE3OVFsN1B2aUIvdThs?=
 =?utf-8?B?NG9jd0dONU1XUVdHeGdpSDdHbDJkUE4rUmdzNkk3Wm9CM0RHbEE3L200S1Nm?=
 =?utf-8?B?MS95b09TUWlWd0tybmVraDduZnVoYThRZmJYV1M2c0czY0NnT1Mva3I2aHZ6?=
 =?utf-8?B?ZzRTbUJXNnNPZlRYU0sxSlhvZk5JWkRwNzMyNEhUZFA5WDB2endjYi80c2RQ?=
 =?utf-8?B?cjFHU1BKcFl1dHZPbDZkTCtoRmdneEJ0V1I5RWFhdzhGUnZkMVdSOHBQOENH?=
 =?utf-8?B?TFI4a3E4VVRkZGMwOHJJM1hwSkNQV080RGtqajQ0bis5UFU3T3Q5YVFJRnZL?=
 =?utf-8?Q?WWD+SV9GuI3Kbln0xgSWD6v/n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db26c3a4-00b1-49b7-0d44-08ddd6cce294
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:42.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8zWnMdq1UrClvXTG69wACrmXMJqpnbr/6zPggSKc+ytWzwGfQ0ZX2t1hpWTVwiuFrAGUC7EBRTYjfHTIIb26Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Use standard v4l2_subdev_get_fmt() to simple code and add missed call
v4l2_subdev_init_finalize().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 49 ++++++++++-------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index a9bf7ce57adc4d2b071f2f7c39f19855dc226a40..f174dfded167fbd52a72894c3f63871812ca799b 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -714,38 +714,13 @@ static int csi2_link_setup(struct media_entity *entity,
 	return ret;
 }
 
-static struct v4l2_mbus_framefmt *
-__csi2_get_fmt(struct dw_mipi_csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
-	       unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	else
-		return &csi2->format_mbus;
-}
-
-static int csi2_get_fmt(struct v4l2_subdev *sd,
-			struct v4l2_subdev_state *sd_state,
-			struct v4l2_subdev_format *sdformat)
-{
-	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	guard(mutex)(&csi2->lock);
-
-	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
-
-	sdformat->format = *fmt;
-
-	return 0;
-}
-
 static int csi2_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
+	int i;
 	u32 align;
 	u32 bpp;
 
@@ -756,7 +731,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	 * The CSIS can't transcode in any way, the source format can't be
 	 * modified.
 	 */
-	if (sdformat->pad < csi2->num_src_pads)
+	if (csi2->pad[sdformat->pad].flags == MEDIA_PAD_FL_SOURCE)
 		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
 
 	guard(mutex)(&csi2->lock);
@@ -771,13 +746,17 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	v4l_bound_align_image(&sdformat->format.width, 1, U16_MAX, align,
 			      &sdformat->format.height, 1, U16_MAX, 0, 0);
 
-	/* Output pads mirror active input pad, no limits on input pads */
-	if (!(csi2->config->sink_pad_mask & BIT(sdformat->pad)))
-		sdformat->format = csi2->format_mbus;
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+	*fmt = sdformat->format;
 
-	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
+	/* Output pads mirror active input pad, no limits on input pads */
+	for (i = 0; i < csi2->config->num_pads; i++)
+		if (csi2->pad[i].flags == MEDIA_PAD_FL_SOURCE) {
+			fmt = v4l2_subdev_state_get_format(sd_state, i);
+			*fmt = sdformat->format;
+		}
 
-	*fmt = sdformat->format;
+	csi2->format_mbus = *fmt;
 
 	return 0;
 }
@@ -818,7 +797,7 @@ static const struct media_entity_operations csi2_entity_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
-	.get_fmt = csi2_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = csi2_set_fmt,
 	.enable_streams = dw_csi2_enable_streams,
 	.disable_streams = dw_csi2_disable_streams,
@@ -1071,6 +1050,10 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (ret)
 		return ret;
 
+	ret = v4l2_subdev_init_finalize(&csi2->sd);
+	if (ret)
+		return ret;
+
 	ret = devm_add_action_or_reset(&pdev->dev, csi2_nf_cleanup, csi2);
 	if (ret)
 		return ret;

-- 
2.34.1


