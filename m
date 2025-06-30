Return-Path: <linux-media+bounces-36354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3272AEEA30
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A15A17E87C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C1328B3EF;
	Mon, 30 Jun 2025 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BzmVx1CA"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4021C161;
	Mon, 30 Jun 2025 22:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322510; cv=fail; b=kqTQErXMpTWBKYbPailWrxbgFMowcn58Rry+522iJHb1Duz5rtt775RuuJmB4hvrbXF0j9qaBTB1SCngPN2BXIXLTbkYQJNWZpBQJutk2QGxvhUsXLjWjHuFpoxOSj/M3Hi4nhPo32ssbCnGMOOgHyG+3f3kWGnu2yPf6dwOzpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322510; c=relaxed/simple;
	bh=D2cQKYybkbT0MD11MQV15bPk9FO7aJUO14zEh8AhPAY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bj//g5bPEG+GPOdGWdUgchRaYU4mLJUVchEWYm310vwvIfOO7q/rxyJcdS6KyCw6OXm9hhdWsQofHMG/5B3+7q/TsUHjaJxtnrofbT4czjyYMVcoxCJhnjaMu/+22mglcKzIN5hupkaNnBgJwtcKcZw6DNBItKz3nFfoMw5O5w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BzmVx1CA; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfKw1CxwaUk9crt2BOis38Ltfg7XQsdCsZAs8M4GXJiU2LuYzii5BQkTOC9BDtMrKdOLA6FM62+tvdclvI+W1eNmHsHpmPTKt/EIYAAMPRhW0VyvcsUTvibP8DyqOG0hVZSuqDW7qNnDW+6hneOM4gDF6BB3lVjV9/GXdb5sKidyGT1Hvi18OYrv4QsOqQG9+CeQu325vaiVo31GViRfRtYezVXVG0LeYHJqV7v0AeHhuwJFwZgwoEKtdm+PtIIBHHaEVjVq2gPWN/i083XTzBzgdtemWtnva6n4atdQBDKn5/rNW9ty0vZf/W5s0l2G4Yg/Lu2ZSjhrZPVxhpbcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r69ApxzGa8I/WbkS3F7Nqt7l2JP7J8isaXe72LhDYxU=;
 b=IMR1JMNwL1t2xgKnGOJA50ZaathvUyF5KPfxMX5SNzUVsTPKlQB2iW0Pdqz4fhxI6CJdVseR+RMJpPA77XjvKZ0D71gbBrrCBUW8r7jeC8/bunIXM3KIOPZpcGZMRnzLXnca/wK6A2Ylv14grC1yhhal2edyD17qab/O/QkesLttae0w+QNhmyk0TkuDAnkhPJsFAghhC7LIRMUVNZhik9I1mK50mgH1ZQL5m09tH+ja+24sn76+rghqIBTOxwxMyIfEaDTnXAEMpT1UXt+5OrlShhMbtD01R+NZyAcUOlpzzFpPQzVM/heDc39j8fH/zcz7ABAPkKx/4GCIFkN3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r69ApxzGa8I/WbkS3F7Nqt7l2JP7J8isaXe72LhDYxU=;
 b=BzmVx1CAqlWvuYv4V/gOFVBC3g7FhGtPAYNdBKGrNjgkCXV9Kp7PZl+FpNEjwG6kzNMQ25Ukw3iE/i0+EvRN0k67JyfkWa8cl4VzPnFkvNuGIuHj0sxBen8J9wIafwxpwtURH/9fs1qMwDEOtQin6J4LimvY04+QkcuYll9CjucDtLFl5E8W0f0BrDFlhIxwYHhsk/013cqiLWZoxFmD1SA2qyIIvAob9Q/tsy+bH6CFIEmMJtuBu+zFyjCxFWtXCZ0anMpmjReDB0H1lviq9RLIYiPqAJe+PAWL+GOUkZ7WMuO23kVLgLQzAsdGByV5mEFX9l1fZ0HcJV8NfsCCgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 22:28:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 22:28:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/5] media: imx8qxp: add parallel camera support
Date: Mon, 30 Jun 2025 18:28:16 -0400
Message-Id: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAPY2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMz3czcCovCioL4guTEXN0UC1NDI2MLYxPjZGMloJaCotS0zAqwcdG
 xtbUAPqdLuV4AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751322499; l=1862;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=D2cQKYybkbT0MD11MQV15bPk9FO7aJUO14zEh8AhPAY=;
 b=kwYX+LtrnHOm6Il4XGUVkxoqJ4sECjbGja+A983Qv7VrRPRTYdnRhXK9svf1oNW0F1/Hc92It
 yYpaIdiyt2zBVOrZrl2+kGj91O++3EgNzDQg6BFTjled7Yb+mXat7ph
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM8P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd85901-6ec7-4402-d4ca-08ddb8256c7c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bXBDeGYrWC9uNHl6TitnQWNPeDNUYnpLNjBVelp2MzNXR2VTY09zeFVOUjZx?=
 =?utf-8?B?eG5YeXZRNmdmU1ovQU83ZkFwU0dDOHFycHU1N0Q5cytiamdiYkVBbjZYV1hX?=
 =?utf-8?B?TURQOWd5WnJCV09oNGtVVTFYbWU3enBCaDJUQUY0TDNUVmh3bm83Qk1zc3ls?=
 =?utf-8?B?Vkg1SU5tR1B5cGRtOVFrVG9JRFZnV3NMbHN2anFFN2JGZERObkhNaHRGbmR2?=
 =?utf-8?B?QUFDbWlDWGRyb2IyeDZweVd1UnlxSDlBOGVvemIxd3hkTkJFNUhMV2tkY1lz?=
 =?utf-8?B?d1JlL2VRUWlFMENVenV6NlZBUVV6dzlRMVVxU0JWbFEySENJdmVDdEE0WjBY?=
 =?utf-8?B?bVdyMGsveE5adnlwVStOMHc2M2xrV2N0K0ZheitNQUdCTS9BTkhMd0tBWko4?=
 =?utf-8?B?bmRPODRrVGJmc1ZlQlR0SzVheTFoYysxQzZzY3NLY29aWk9GL2dNZGpKaFM1?=
 =?utf-8?B?aGt5WEttL3o1ZE1wVGN1cHRrbUNMK04zUjUzbWlzd1VZSnNtd1R1Mm1rNzhh?=
 =?utf-8?B?YkhYMjhhOG5obEZUaUlSY1dZanhJam5rQzFtcG5RdDY5cTRJUDRzY0Z0RlE4?=
 =?utf-8?B?a29pMFVwdHRmdTZ1QXZlakFSN2cxOTkrOEdEQmZTTU5xN05zdEU2SS94UXQ4?=
 =?utf-8?B?K2tBR28zK2xJdEpxVU1BVHJnTUt3RThUMGFMMVNTSWk3d0R1WnZIMHhZMlVM?=
 =?utf-8?B?SWFQUjVmaEZxbmlvZTh3NjA0WTlUMTQ5S2thb0srUGh0YktJWWZyWTdIWEx2?=
 =?utf-8?B?ZitQVjlSTlc4QkNVWStET2doaDRTV2VRVDJteDZSR1ZDWldoeHArNHJCZjFq?=
 =?utf-8?B?QlBzN3hrTFZHVDl4emowa0s3T2ZKWXh3RDJLazJiSjlGc1E1UW9tNDdFL3ls?=
 =?utf-8?B?VzBLSTJQWW1lenhXa1ViU2ZQaVYrdStTajVCWk54RWowdnFVbWZXZkpvSXhF?=
 =?utf-8?B?Y1RFV0c4UjIrdHF2SHhlaXdMWGlZVmNYTUhyNFVsTDdaZEFkL3pCd0RyUjZz?=
 =?utf-8?B?Q3MydHNMa3VzR0FLNVZORm1ZV3dWL2x1MHhzcDFsQk5BNGZlWWVwZmt4dVkz?=
 =?utf-8?B?UTVhOUpBUHJlOHNSZlFUajNzQjBDT2QvNSthWnZDMXdxTFFkTGJWbWYyT3JB?=
 =?utf-8?B?clVBQjFhN1VpTWN2aUdnc3Myc2lUblJXVjlERGxRMWJGektmTlZONDNnMzNX?=
 =?utf-8?B?aXprT0lYdmh4TUhnUE9JdndNVzZSTlVVWFlXb1gzWEdNcEtLWDFmS21SMis0?=
 =?utf-8?B?ZlpDMWtVNUJtYldudDZSM0NFNUUxemNCa1JSdGlES2c4Y016aFpqYVhIZStl?=
 =?utf-8?B?emZtdnp3d3lVY0g1OCtMQkd0d0Q5bEZEakpaaTVJcHR0T1pLRVJiVzZLaytK?=
 =?utf-8?B?UUZqc3crNWpDZm1WQktRTHVpNEZIM0hENFhQNk5jaUlQSVprd2RmdC9EaCtF?=
 =?utf-8?B?RG83eWJQU242WjF1b3drRGFCL0lma2kzVkdabVpaOU45eEt0NGpqUGIvR2E5?=
 =?utf-8?B?K1RGc0d0MGlUZUZSeXF6TkNZMmFPdU5XWUJZbmVMYXZPMThHd2JLVmFiVUFK?=
 =?utf-8?B?OXhGWWFRMC8rQll4WTJJRG1PTGdzWFZwdG1aWFVNeGswTG1HNDc4UUNQYno4?=
 =?utf-8?B?dUtkN0ZLbVd3djFIakMwTzVLK0NyaDd0NFZpdGJLZzUwYUk1WVdxQVA3clRa?=
 =?utf-8?B?RWEyVXF0Rm9QWXhlWWpFV01xYjdZUThwTG9ZNlZXNzlzc1FNd3h4cUNFbVhC?=
 =?utf-8?B?V3ZJdERkT3BlZTZxcEVUY0dpdms2T2s2VE9Cakp6QjFpYWNUSUZkUTVDeXpq?=
 =?utf-8?B?VzRPeDM0UXJQbTl2L2lyd2ZpZ0p4Tyt1U3VCQzUrUmJuV29SRndDOXl1aStH?=
 =?utf-8?B?WWtoSEV5czUxdmVES0hLMXNKYWR2VmkyM2lKcXNqSzhqSmhVOTl6Zk40NFU0?=
 =?utf-8?B?R2tWQWMzb0xJSUFQU2Q4U3pzcGVpZE9wMjlCUVpMamNBcWc4Y3dKR25jYjNY?=
 =?utf-8?B?Vm9EK25wVElleERKaHhXU0NIVkg1R1FIWXVZR1htUERUckJiMDRBRmxXM3lT?=
 =?utf-8?Q?twBnvZ?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UTZ0bVZMR01ZV1ZYS1FSaHlXMUtYODgyK1pjWk9hdHFaamhnOVFoS3RMNjAz?=
 =?utf-8?B?eGxETDFYZVlZWE0yeTNuUXBncm9kTnRQSVdudUVwakVBUFJGN21EdnhFUE5C?=
 =?utf-8?B?bmM0U0F1YWlFZzNTU05GWE0zZFBjVUVGWUYyZW9NZjdOTzlmc0UxUDZQSGlj?=
 =?utf-8?B?RzlxRUJZcXhHQU1ZeWlNM2tlbjlaejRscDJJaHZvK3kyaEcrQ3BSRXp5ak1j?=
 =?utf-8?B?U0p4cm9ZQlZsSncrMUh4cHA2S0E2MWw3dm1wWFcxdjJ5QUZpcjFXSlNkRnhB?=
 =?utf-8?B?V1krb1MvOXhIYklJdWY4V00ranUwR1YrZkdTeFEveFhEYmM1amdrcEt2SkZy?=
 =?utf-8?B?SitHTVd0UnozQTFFZ3MxY1BMMFNiUkRRRUFWRUpxN3V0VTQ1clcrNVlhaVZo?=
 =?utf-8?B?cG43TjI2QXRBTHVySTFiWjVnL25OMDJodUJjekU5MFEvbUxKNndralRXb2dL?=
 =?utf-8?B?ZGUyTlRSaDVpNVdTZm1STU9xc3FQVXVMVG83RmV5YTFBL0I4a1o0YUh2V0da?=
 =?utf-8?B?bDRYOVdoRlFWMi9sTlJMZUZzd2Y0OWN5RkFJcTFwd3cvMGlKeGR6MDhkelZI?=
 =?utf-8?B?azNOZUJDSThneFlOTy9XcWpyV3FXZ2tRdFFDcEJOUzBidHJibnAxdERSeElN?=
 =?utf-8?B?OHZvMjFJYUg3UTlacWROcUFGWkhsQUFUbkgrQms0ZUNVWUxNcTNOVkVwZGo0?=
 =?utf-8?B?NnFpaTBNNkVJVkthUUJlNHdDajNFYU5mMmU1YmNWelhLTW84QjhSUExRVStC?=
 =?utf-8?B?K0hFdUVRV3BJaTlEVjRPOVExeldzYmk2aUk2RjBrbmVMSXVXNnJ2WUpzTG5F?=
 =?utf-8?B?TCtJYURGaDU1eFp6TnNJOXlKaVM4U1FiWTQ1SUJrb1RWVmZqWHd0azdOQ21x?=
 =?utf-8?B?WGpzZHI2SkMzcXN2VmxCV3NuSDRpYzdTUmZVdy9pMS9SZXZWRHpKNjQwYkp6?=
 =?utf-8?B?M2MwMzBuRnpJYmVlY1FQcnNTZlhuQ3RwMXdxL1VJeC9FcDFBdlEycm5UM1VF?=
 =?utf-8?B?MmpDSCtUSUhQMnNYSHhsdHBKWEJtc0RHSC9wR3hlWit1WFNtRFVCU3lFcGo1?=
 =?utf-8?B?T1RHTC9iNW1iOVY5S3BVUm14elJtWWwxa0NzU3FQZU9SeUx5WUFoK2pZMVFJ?=
 =?utf-8?B?cFJRM1NTOVhRM0hjSkl5elQ5WXJTSjVoTVNTdzR0akFIdjYvZEhqNS9lMFFy?=
 =?utf-8?B?UHFKeHF6L3lMUXp1eldnRE9SSEloR0pZZG9tdy9LOHloZHhaQnVSS3lQWVBY?=
 =?utf-8?B?ekYwdExzNS8vNE42T3UzclhFcEdtaEtqYlpGYTRIeTF3Y3pYNjVEWUQ2MkFS?=
 =?utf-8?B?czYzV2tLY3FKMjRxYzdDdDBxa3l6ME1heTJyMzNGcnAzSmFSZzgxMnFZTmFF?=
 =?utf-8?B?WTZveTNLdFZVbVBWSHI0N2p2SThlSjloM0Nma1ZDNHBJa2twTk1YYmFJaFFy?=
 =?utf-8?B?bHovc3JUTmxZTTFhR0JIemlOWVp1L1JJdXFHdUNuVm9aSER0NUR2NHJlQ1Zq?=
 =?utf-8?B?dERSdXJxT2JSNG5zYTZnZ0doTTJjK28xMFA2cjNYTkFUOUtNcitlcW54UGVY?=
 =?utf-8?B?VXRwb0RjZDhZaWpMQWFCWTV1QWZUYmRBcXNCN0JBL0dHaWxCMnlyd3d0UTZY?=
 =?utf-8?B?Y2xPS3RDUDJsSm50Z3V5SFBNaForVXdOejVOVXcrYnYzeWM0NUdqK2pya25h?=
 =?utf-8?B?OFZ4M2NGSzBwR0dPOGxGS3FsOXY4aEdJMVpjR3pIODF0SkIxRktUSndpV3Y2?=
 =?utf-8?B?Nlp2Wm4zMTI2K2hWbE12ak9SWEZUNWp4SlBTZ1RzUkhHOTBqMjczQ0FlS0RV?=
 =?utf-8?B?czRGSi9BcVhQb3o5R003ZFdMUXBQOUpocmJhNk1HczBFNnFRMGEzVXFnMnE1?=
 =?utf-8?B?K0diWk5vVEdvbHA5bFA0NjhJOWxtSjZucDNraEEvdjJRRGdtMy95L0Y5S1pE?=
 =?utf-8?B?ancwMTB3d3dIVDlwcUkxdWV5Qm9iVll1NlpvcVlIc2NvMVJDTmFMVldocHBr?=
 =?utf-8?B?RmFqUVBTeTBXTTJLT2ZodVNuc0ZPamdRS2h1aDVoeFFXdDEyak5KbExEYk45?=
 =?utf-8?B?dGg3eHJBR0pSZXczT3dnOVVkaENKMTZQZE8raW1VR2VsZ09MSHR1eHVqSGY5?=
 =?utf-8?Q?P4Mk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd85901-6ec7-4402-d4ca-08ddb8256c7c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:28:23.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VI/0136QOEvQFS6lqUVv4DfHSWhH+GYhhhDDzw/fkdVLuAsJdk7rfweC1qQdFyWb+LdPRD9fntzceYGmoWyBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

Add parallel camera support for i.MX8 chips.

The below patch to add new format support to test ov5640 sensor
   media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes

The bindings and driver for parallel CSI
   dt-bindings: media: add i.MX parallel csi support
   media: nxp: add V4L2 subdev driver for parallel CSI

DTS part need depend on previous MIPI CSI patches.
  https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/

  arm64: dts: imx8: add parellel csi nodes
  arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Alice Yuan (3):
      media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
      dt-bindings: media: add i.MX parallel csi support
      media: nxp: add V4L2 subdev driver for parallel CSI

Frank Li (2):
      arm64: dts: imx8: add parallel CSI node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../bindings/media/fsl,imx93-parallel-csi.yaml     | 108 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  37 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 .../dts/freescale/imx8x-mek-ov5640-parallel.dtso   |  43 +
 drivers/media/platform/nxp/Kconfig                 |  11 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-csi.c      | 952 +++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  10 +
 11 files changed, 1207 insertions(+)
---
base-commit: 93355cfe8aec9e47fc93fbc940f1bbeedd62e249
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
---
Frank Li <Frank.Li@nxp.com>


