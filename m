Return-Path: <linux-media+bounces-65591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y3L5HKNAPGrZlggAu9opvQ
	(envelope-from <linux-media+bounces-65591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:40:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAC6C13A3
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=oap7ewyF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65591-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65591-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1133C302B5BF
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6105A3E317C;
	Wed, 24 Jun 2026 20:39:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D782FFDFC;
	Wed, 24 Jun 2026 20:39:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333552; cv=fail; b=O0yaGfEKUe6bKjSSGr7PPuxtHPyZfc+bxwE9NjUWTRymz0MMcjPCsu4tj9ydMuu1gi3t4k1banPWER8mwYuk3Ia45M/5s/wq7t+rJlFzjQmgLvkdU3lo8ZfNJTpg7rP/oeK7zAiuS7dHM9BMl6AzVkXJfx599Y87yjxD8s4H5VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333552; c=relaxed/simple;
	bh=BlcAgvn371ltHNrE61YFsyc1JIWrRe5zC765N2bb5XU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qUgbaa/2yVmTFgvXSR7bIxS0mEZcFR2soHdt30xb7AMjQMxbiQA26riYg9rWPi6zEY7WmvMq6j7pE/jTVOfwdGX+317YcnVM1MlxA3dIMGNr5XhpSQVYsh6Ct7XO0Gkfz7sG9pztrqD4PKi5ZdqYIJQj1pXWgcQ3BDrFEGVHxZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oap7ewyF; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+y3hNS7uUnxocvMUbp/DvakinxbO3Ileqyu/xBSPXuiOoxZ8CsiGyOqx0o96NyOjddw+CWkN9UukKjwWQpH3o3Yidpbl7ACgW2vwCirJp9k0H3rJybF8UQCwjEHcLyZnjI4Unyfwhp7705ofBmcKEuomCuu4sOUfHN1v1wZi2Nolj/beRXXK1xqUTkX5RarMZ6tlordoaqXWKs/cnrjgQ2PLgdBjkKe8cVz+hLUyHLhwfDIeAOtDXaAvOmWUqZHD/MQxPQTF0br0cRk5D22MnA9rAvT87zymtBfBtgPo4MyKCqW7sbGK2UN+/C8vVIzb4tbrxMmeDT6evCBLQGydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE0LVqYVzou+tUYBRUvj2i8VPBqSKgfEC13q+4eCGO8=;
 b=YiIgpp6QBfqyK91fsXLePFkeJkz0NkF4MhMmcKyLlAPXCoU83yGPrvsG7BOeDM8tdhAZtl+Qka4ioV7oNoCQdGf9ihyk+mtHZrl6vUhR4uTGQxmhUEHD8vrX6u2RvTGamJUMmrp3tLfjt97nc36cRBUBX13iTZ3kjzvUbGoAtqy5cAtdHFcbE011hXjjhIVtGFMebRGVGPSl9FvsaEyDfHYBHlqHWGpm98130nGci/tbII0NNzEEi0WV0UkEyU2phtem+R32tmqASwZMN2e4+o342sS15wDm2npLZVOwxgoE+W5XRFMQsUNOwyv0hUKWS7uMbdGPA08uKLRvK20H4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE0LVqYVzou+tUYBRUvj2i8VPBqSKgfEC13q+4eCGO8=;
 b=oap7ewyF8ToFGd5TZhw+3TUq81Y9SPRmlNgQZB2TFzmIaB2lMdSSqZZo0vDPtZG2jrExEm5kLaOPYf0V+o3ZXFBZzBCRTuZgsy/yBIYFypghxdxrOhSyyg8RHYvp86eJAbie0Dr6iUugcMZG/1K0aAtZbIIHjnGzow7Ht3VBa9X6RYeao/ZugXcZteGa+INpe3Nu1C0/e2lar8WHKOcgvaxBfdIXTdu0o7qA1pRnQK6z2WdOBJojONjc2IvKBpkrbC+B30Q1MCfQK0g1yn0hSXQFn0QrQ2WfnUuNvBoBGz5p5KzJXlh8EWUlEwHYHvAlNLM2YBP50Jfi0Yfmok2SeQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:39:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:39:02 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:52 -0400
Subject: [PATCH v6 5/9] media: synopsys: Use media_async_register_subdev()
 to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-5-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=11465;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eLtd/hGiGBiXFdu4KynKvIlxICANABnuw6WlHAG2mR8=;
 b=n46EwWT2mQLn5oIRKPjchGRlawnWfuT6fzFsS9FDfUDjG/MRkWpRW0h8hDa0vNBSHiGGRO8i9
 cxeQZDjcjD+DazHbIeWUeGIsWUF3LPM4MA5pFhYNsAxrTfHpmcD/B9r
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d2b78f-029d-455c-e785-08ded230a098
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 aLp6iTKnZD+UJpoiMo6xIPS3DThMVe5BOq0EzjV/bVxj2P1KTCSQMKfXoq3RfryRvUtAdRC1F0Q6ox8VgKI8jaqghwfCB+TSR2B1gCpjYTPMpMGfQdWIGN2STqGFi8rHaVu8K6TH5s701ACBcszLLNFPLOiw8p5jIz5h5OEdHnGtARRmW0PU05QwMS9ilGcq9h+4SLd4INqmoUm9frmdbKHWSsERbtatzASNqJxbViM2or/YsgMGjmO/TriGj7u45PbjUoFvu6FRmoabDhb/AywdOje1bnpw9x9isogoYkvE8zjoO76468MQgDWtlWq85KuSmiZctCAXhJWD3oikBDFDwwYrCnr5UZbTpcflyS5OcFoo4g6rSUSXxBlNpS2ls+UykOtoN2b/GSTyk6FQ/36KrE8zw4oqQyo/HeiPv67/RZZIdxhPUXXz3to9o+JqEfm0ec0gtTr6jf6NmSkDG4oRYEM/8ja9LTARfOjOR6Oc7qCd2qg6g36R6xduy0r1SAayua+4fsjCLO83Gvwid6dSdyfqgOqn9BLL/iG3GvYJ52BoBCBX5Og5TCBA2jGHwlwytV4xaMmATIKxELbUhxCh1oKQjUu6cgL4JMV7j4ofmjC1x6woiugT381nmaVOUU0hZw+B9FEuKwha7F5/+swxBTANcFv4ZqFo/hfLbVehE55DC7PQXBFF8Ttceb73xbP14PA66pjGkQ7w0NxtzQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eEkyVllDMzJRN0NBRHhPMHZIbjUvZXE0SndyL3VTR1JpN0pIcldnVnpxWkd4?=
 =?utf-8?B?QWFSTzcySnpsQ2YvSzdXdkNVdDQyamo1MU5qUHdIRzhaelMyanpMRkZDdDBT?=
 =?utf-8?B?U2RWZ0c1TkFXQkREQXU2VlZZOE9SM2lLVFI1d2tBSldHWWpWaElZWEZHSnlq?=
 =?utf-8?B?Zkl3WDF3TS9WaVNNTVNiYU40M1p1MUpEdUFYcGhoTkhTWnQxOVZ6NVdqbHpO?=
 =?utf-8?B?Q0hNMFE3bGpNZDQ0MDhySkJXY1YxektRN2FPSHBMRkt5MnlxWHVSVjdjMnlv?=
 =?utf-8?B?UUtJekFXdHJnbEMxb2hGc3c5cEd6Q0E5ZytoOTYxejFzdzNSWm4ySnhybSt6?=
 =?utf-8?B?T0psUmpFaGxEVTNPdkQwUmdsVUFvZzZjN1Qzb3plSU9aU09WNFBsTVhMOTdi?=
 =?utf-8?B?V203R2FaVVVMOHJ5YU1DNmxwQlgxeDdVUFpsSzBCeVJ5STN3NDRiZldxYzVX?=
 =?utf-8?B?WEdkOElGZ1dQWEppdjZKT09aWlRsWWdMSEpHYmFiK2pibGluK01YOVFXMmUz?=
 =?utf-8?B?N2drMGQwMnFtWFFUY1AxcEQvWFliU0U3VVV5QVN6U3FtNHhzMSsvTm5rQlFY?=
 =?utf-8?B?M21uQ1FoRkx4NFZkbllpRlB1emxwaVF3ZUxBUkFCMkcxdDU5SHpkclQxditE?=
 =?utf-8?B?R25uc1AzR2xKcnRGMWNaandsMlFwY3JxUE9DOU50NS9aZnVTVzIvZUExWnVG?=
 =?utf-8?B?Nkg3T2cyZS82L2ZGTzlvSHM3b2hMMU9ndmxoakpDZE5wN0R6cFhFaDFGejJv?=
 =?utf-8?B?cWJZOWVWaHprcEowTTNlZFA1NmNBZ3h4VWFqNExOV3ZOQXovZ1d2VUE5amtH?=
 =?utf-8?B?WTNYeG15SVRqdnlTSGd6WjBkRG5vQXNuditQeWpsd0tWL1VmYndBOHVrNjNz?=
 =?utf-8?B?Y3JLWFl3blBHSXY0REJGbzBXZlRaYy9wN1kzWkpEZmRTcmNqb0F1YVhadTJR?=
 =?utf-8?B?RUhaVG9EQzBERVBmT3R2SVl4RG9PMmJGRlc4dTVsWFJnaWJoSWFTcC9mVHBO?=
 =?utf-8?B?aDhlVDFEQ0tHZ01udFJ1WmxXUjZtWWl2TExaNTVNLzVwd3l1Ryt2MGRONXVD?=
 =?utf-8?B?c283UlJJSzJSZy9yc2tzSEp0RUh3V2c4aDNWQ1BFZDNYdXNHeVVwdzl3WXlJ?=
 =?utf-8?B?YnY4Y3o3dm5jZFNVOGwzbTFhd3haak01cElEQVlzdEF1K1VYTDZvV2k5REhj?=
 =?utf-8?B?bUR6eDg1UGUrcWp0ZnZJYTJUM3NWNXR1TmlRTm1Ib2ZSaG9rbmZlV1cyYXNa?=
 =?utf-8?B?aTVSZzMrQnM5amt0UjNhYUlOVTNtYW41K2dhcFFPTUY5bWQ4Yyt3bTRDMTND?=
 =?utf-8?B?RjZIUWl1a001RmhiN3JMTlpoVmJrOUZhdC9seWMrcGtlTGNheUFEOW5PUTdH?=
 =?utf-8?B?RWs2SXl5K2Z3ZlR0RWdiZEh1NHM5SEM3ZmFlZXdrWTl5N3VHN2hUdmNIOWdV?=
 =?utf-8?B?YVo0elE1bW12dk5kd2dKeDhxamR2QjRvRnlReEtaaU5vUXZpbGlock84WHFU?=
 =?utf-8?B?cnNZYjFYbUtvc2NVMDJKaDAwa2JVSUpmSVEwN2RETnNMS1dNalNpSVpsR1Np?=
 =?utf-8?B?VlJwM0ZCc2hFRk5jcGNzRlZaZUVZQmxDL3F4TG1ZMVExY2tSWHUwYko0cGth?=
 =?utf-8?B?dTlKRHNtK1IrR2RJWXdBWTJoSDgwMTAvcWdZbmZ3VGRLTDMxeStibXRwRllV?=
 =?utf-8?B?aWdISThCNW1DeVlZNC82RGYrWk1MVU8xRm9BZjIvTzhRc3YzMXpZVGJwNVdp?=
 =?utf-8?B?cm1KQUJ5MldOQWNMeUJ5bThaN1oxOTFKL0VLMm50RDJhdkZ4dzAwZWtRT0th?=
 =?utf-8?B?L1BOOXVkQTFYY3NIMjA5VVVVYUhHT3plNDVzb3g2VW1mU3lVYlpZM2I0QWpm?=
 =?utf-8?B?WHcvYWpFMUVyUzkramxMa1NqYW81RnhkV0s1VXl1dUNxTHZzNXJraG02STB6?=
 =?utf-8?B?MnVUYjhBRnRMS0xzaHBxajdEMXk5b2VWZkFwWDZtb1BnT25wTXJkYTRFemds?=
 =?utf-8?B?dVhkNDU2U2JSMkc0aldVYkNjNlR6Rng5VHNyZmxCZXV4bWpqSXRqSVphMUpy?=
 =?utf-8?B?TGFaUWFxcElaRk1PVEFaa2JucVRBNjJMQU1RN0l6aUZJUS9XWGNzbFF6ZEhu?=
 =?utf-8?B?ak50dXc2Mk03bDF2Q0ZIWFBCcXFUL0tSN2h1cERvODdnSEpNSU5HaDJsLzBC?=
 =?utf-8?B?eGh0akM2a1ppeGY5emRNR3FTQmhFTDlIVFU0bHUwR3kwdng2WEFsUGxiTWEv?=
 =?utf-8?B?RDl3UldaZ1BjYWVQZmxON00wWVNWVHA0Yk9lbm5hSUh0K00yOGVvTTVMNFh0?=
 =?utf-8?B?ck9EQUV6UkNRQm0wY2V5YmVSUGw3bzJRdlhxNUVyZW8xZ0JpQnorZDFDWk5m?=
 =?utf-8?Q?HKuZk5mCQzIqTg6RJcIG8EiUkI38MPR7367vI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d2b78f-029d-455c-e785-08ded230a098
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:39:02.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nN2CVBegaZol9CjK32JGj6h9MoUm557y6QbxL4YV7gh4J0aug/hw9+gUUPchb4zfyW+ov/oKsurH51WWSLSGpT6L4vPnLOTCdC+wH51vwUp1vnDZxBz0D2wEG1zeWEfb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65591-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CEAC6C13A3

From: Frank Li <Frank.Li@nxp.com>

Use the media_async_register_subdev() to simplify the driver.

Replace the local subdev registration and media pad setup code with
media_async_register_subdev(). Reduce boilerplate code and aligns the
driver with the common pattern used by simple subdevices that each media
pad has one endpoint in fwnode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v6
- use media_async_register_subdev()
- remove sd_1to1.

change in v5
new patch

previous method:
https://lore.kernel.org/imx/20260226-v4l2_init_register-v2-2-902d7140f9fa@nxp.com/
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 178 +++++------------------
 1 file changed, 40 insertions(+), 138 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f51367409ff46..0fabc89a49b80 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -78,12 +78,6 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_MAX,
 };
 
-enum {
-	DW_MIPI_CSI2RX_PAD_SINK,
-	DW_MIPI_CSI2RX_PAD_SRC,
-	DW_MIPI_CSI2RX_PAD_MAX,
-};
-
 struct dw_mipi_csi2rx_device;
 
 struct dw_mipi_csi2rx_drvdata {
@@ -112,12 +106,8 @@ struct dw_mipi_csi2rx_device {
 	const struct dw_mipi_csi2rx_format *formats;
 	unsigned int formats_num;
 
-	struct media_pad pads[DW_MIPI_CSI2RX_PAD_MAX];
-	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev sd;
 
-	enum v4l2_mbus_type bus_type;
-	u32 lanes_num;
 	u64 enabled_streams;
 
 	const struct dw_mipi_csi2rx_drvdata *drvdata;
@@ -360,9 +350,10 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 
 static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 {
+	struct media_pad *sink_pad = &csi2->sd.entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	u32 lanes = sink_pad->vep.bus.mipi_csi2.num_data_lanes;
 	struct media_pad *source_pad;
 	union phy_configure_opts opts;
-	u32 lanes = csi2->lanes_num;
 	u32 control = 0;
 	s64 link_freq;
 	int ret;
@@ -370,8 +361,7 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 	if (lanes < 1 || lanes > 4)
 		return -EINVAL;
 
-	source_pad = media_pad_remote_pad_unique(
-		&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+	source_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(source_pad))
 		return PTR_ERR(source_pad);
 
@@ -380,7 +370,7 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 	if (link_freq < 0)
 		return link_freq;
 
-	switch (csi2->bus_type) {
+	switch (sink_pad->vep.bus_type) {
 	case V4L2_MBUS_CSI2_DPHY:
 		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
 								 lanes, &opts.mipi_dphy);
@@ -458,16 +448,16 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
 
 	switch (code->pad) {
-	case DW_MIPI_CSI2RX_PAD_SRC:
+	case V4L2_SUBDEV_1TO1_PADS_SOURCE:
 		if (code->index)
 			return -EINVAL;
 
 		code->code =
 			v4l2_subdev_state_get_format(sd_state,
-						     DW_MIPI_CSI2RX_PAD_SINK)->code;
+						     V4L2_SUBDEV_1TO1_PADS_SINK)->code;
 
 		return 0;
-	case DW_MIPI_CSI2RX_PAD_SINK:
+	case V4L2_SUBDEV_1TO1_PADS_SINK:
 		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
@@ -487,7 +477,7 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink, *src;
 
 	/* the format on the source pad always matches the sink pad */
-	if (format->pad == DW_MIPI_CSI2RX_PAD_SRC)
+	if (format->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
 	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
@@ -549,12 +539,12 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	u64 mask;
 	int ret;
 
-	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
 	remote_pad = media_pad_remote_pad_first(sink_pad);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
-					       DW_MIPI_CSI2RX_PAD_SRC,
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
 					       &streams_mask);
 
 	if (!csi2->enabled_streams) {
@@ -608,12 +598,12 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	u64 mask;
 	int ret;
 
-	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
 	remote_pad = media_pad_remote_pad_first(sink_pad);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
-					       DW_MIPI_CSI2RX_PAD_SRC,
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
@@ -649,9 +639,9 @@ static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
 {
 	struct v4l2_subdev_route routes[] = {
 		{
-			.sink_pad = DW_MIPI_CSI2RX_PAD_SINK,
+			.sink_pad = V4L2_SUBDEV_1TO1_PADS_SINK,
 			.sink_stream = 0,
-			.source_pad = DW_MIPI_CSI2RX_PAD_SRC,
+			.source_pad = V4L2_SUBDEV_1TO1_PADS_SOURCE,
 			.source_stream = 0,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
@@ -666,95 +656,38 @@ static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
 						&default_format);
 }
 
-static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
-	.init_state = dw_mipi_csi2rx_init_state,
-};
-
-static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
-					 struct v4l2_subdev *sd,
-					 struct v4l2_async_connection *asd)
+static int dw_mipi_set_pad_by_ep(struct v4l2_subdev *sd, struct media_pad *pad)
 {
-	struct dw_mipi_csi2rx_device *csi2 =
-		container_of(notifier, struct dw_mipi_csi2rx_device, notifier);
-	struct media_pad *sink_pad = &csi2->pads[DW_MIPI_CSI2RX_PAD_SINK];
-	int ret;
-
-	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
-					      MEDIA_LNK_FL_ENABLED);
-	if (ret) {
-		dev_err(csi2->dev, "failed to link source pad of %s\n",
-			sd->name);
-		return ret;
-	}
-
-	return 0;
-}
+	struct v4l2_fwnode_endpoint *vep = &pad->vep;
 
-static const struct v4l2_async_notifier_operations dw_mipi_csi2rx_notifier_ops = {
-	.bound = dw_mipi_csi2rx_notifier_bound,
-};
-
-static int dw_mipi_csi2rx_register_notifier(struct dw_mipi_csi2rx_device *csi2)
-{
-	struct v4l2_async_connection *asd;
-	struct v4l2_async_notifier *ntf = &csi2->notifier;
-	struct v4l2_fwnode_endpoint vep;
-	struct v4l2_subdev *sd = &csi2->sd;
-	struct device *dev = csi2->dev;
-	int ret;
-
-	struct fwnode_handle *ep __free(fwnode_handle) =
-		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
-	if (!ep)
-		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
-
-	vep.bus_type = V4L2_MBUS_UNKNOWN;
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
-
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
-	    vep.bus_type != V4L2_MBUS_CSI2_CPHY)
-		return dev_err_probe(dev, -EINVAL,
-				     "invalid bus type of endpoint\n");
-
-	csi2->bus_type = vep.bus_type;
-	csi2->lanes_num = vep.bus.mipi_csi2.num_data_lanes;
+	if (vep->base.port == V4L2_SUBDEV_1TO1_PADS_SINK) {
+		if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
+		    vep->bus_type != V4L2_MBUS_CSI2_CPHY)
+			return -EINVAL;
 
-	v4l2_async_subdev_nf_init(ntf, sd);
-	ntf->ops = &dw_mipi_csi2rx_notifier_ops;
+		pad->flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 
-	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
-					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_nf_cleanup;
+		return 0;
 	}
 
-	ret = v4l2_async_nf_register(ntf);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
-		goto err_nf_cleanup;
+	if (vep->base.port == V4L2_SUBDEV_1TO1_PADS_SOURCE) {
+		pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
+		return 0;
 	}
 
-	return 0;
-
-err_nf_cleanup:
-	v4l2_async_nf_cleanup(ntf);
-
-	return ret;
+	return -EINVAL;
 }
 
+static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
+	.init_state = dw_mipi_csi2rx_init_state,
+	.set_pad_by_ep = dw_mipi_set_pad_by_ep,
+};
+
 static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 {
-	struct media_pad *pads = csi2->pads;
 	struct v4l2_subdev *sd = &csi2->sd;
 	int ret;
 
-	ret = dw_mipi_csi2rx_register_notifier(csi2);
-	if (ret)
-		goto err;
-
 	v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
 	sd->dev = csi2->dev;
 	sd->entity.ops = &dw_mipi_csi2rx_media_ops;
@@ -764,45 +697,12 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2rx %s",
 		 dev_name(csi2->dev));
 
-	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
-					      MEDIA_PAD_FL_MUST_CONNECT;
-	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
+	ret = media_async_register_subdev(&csi2->sd);
 	if (ret)
-		goto err_notifier_unregister;
-
-	ret = v4l2_subdev_init_finalize(sd);
-	if (ret)
-		goto err_entity_cleanup;
-
-	ret = v4l2_async_register_subdev(sd);
-	if (ret) {
-		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
-		goto err_subdev_cleanup;
-	}
+		return dev_err_probe(sd->dev, ret,
+				     "failed to register CSI-2 subdev\n");
 
 	return 0;
-
-err_subdev_cleanup:
-	v4l2_subdev_cleanup(sd);
-err_entity_cleanup:
-	media_entity_cleanup(&sd->entity);
-err_notifier_unregister:
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
-err:
-	return ret;
-}
-
-static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
-{
-	struct v4l2_subdev *sd = &csi2->sd;
-
-	v4l2_async_unregister_subdev(sd);
-	v4l2_subdev_cleanup(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
 static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
@@ -879,12 +779,14 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
 
 static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
 {
+	struct media_pad *sink_pad = &csi2->sd.entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	u32 num_lanes = sink_pad->vep.bus.mipi_csi2.num_data_lanes;
 	struct device *dev = csi2->dev;
 	u32 stopstate_mask;
 	u32 val;
 	int ret;
 
-	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
+	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(num_lanes - 1, 0);
 
 	ret = read_poll_timeout(dw_mipi_csi2rx_read, val,
 				(val & stopstate_mask) == stopstate_mask,
@@ -993,7 +895,7 @@ static void dw_mipi_csi2rx_remove(struct platform_device *pdev)
 {
 	struct dw_mipi_csi2rx_device *csi2 = platform_get_drvdata(pdev);
 
-	dw_mipi_csi2rx_unregister(csi2);
+	media_async_subdev_cleanup(&csi2->sd);
 	phy_exit(csi2->phy);
 }
 

-- 
2.43.0


