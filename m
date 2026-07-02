Return-Path: <linux-media+bounces-66383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mt3tJ3eQRmqeYgsAu9opvQ
	(envelope-from <linux-media+bounces-66383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:23:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6B6FA1F2
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:23:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=tUNIOZoa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66383-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66383-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73FC5306A281
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38D2311968;
	Thu,  2 Jul 2026 16:04:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745522BEC2B;
	Thu,  2 Jul 2026 16:04:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008258; cv=fail; b=nnrxn8x8XhZDv6yl9lnBGrCfv+RqtiruwofzZKnr4ph1P9C3n1pDOD3p6VyI990glHQT8scU2+0OTfw79dKjGhgghmJItY25QDtNBKXL4bsB302GbnAIVhMZ/mTsey7Ji83OYZYZW75/FEowO7Q4a8XKD47p6VYz6DZ62Hg06YQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008258; c=relaxed/simple;
	bh=ZBwVmVoGQgSKkvwefHcxIuCc1TV67ashTeJwlO2hQVY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=uMzlkrkl31+3l3xDLvHU4TAYTER4ZPGwigDuGJtQo66ruOkuuCb33ZsMEEPrxBM6MfKd/J+XZqqb1m+oHLNwNDBPd6mkV05oRCTJmxdhpfKOSTnNwZPLFsWJ7SrPDFaOOVkdkNbbXwbbc0VzDk/PE5EI6nhOy6LaoXLtIT5eaeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tUNIOZoa; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jfcwri+zIeWYpso27dCsx2WOeYGl7QenKKC1KiEy4x6QDsbL6SLPFD1lHbgakJrvxRFvpJtjnqP2qyTz8DKb3QvIkdP6ERlYutDjmSZSIXE1j/6qVdHeJY96lS3ljwo4o5pj7c/F2uldW5v4O8hXsEPEZzOyfQnSChnhBIQ8IWPR9srqCWdHgmBF7kcuoUfkEbDgm2LvLO+wIFFGHfZ1qcpxZevpNMQhaCBhEem3zKorvQ3RaB4AJyMobZKSapJHrOL/TSTpQsuovrD4sj0Mw3XfZpNGi5z2GrIygRMyxSokm2CBqkogbTdi5I5sNxJNrpkEapNQHbFVLx1mZoVB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xl25fAZp6nlCeEl+vyXkAVZW6oGVmfnS8MHx33WKpFw=;
 b=GNSwgAJ0UUyLSc7WzgmorTku/YMkAaIJfvii7AUkINekwyqbNkzeB4hJkg+a8y1FuUOLtq20zcH2SoMliEfKGVTlV6BQJIxn22Jnftq63drDjChwTX8I2Ne8nJyyxmmf8tWl5tcUB9z+0BwEKqLlZoidG+7DHVuRmdPiycknbuLyFSi4QQ2e++qqu2l+rX29MtDKxj7OI+Tc4d9U1UPY82WoHllnaVg27EZ6Q6MbzZdg52hfLD72S90PFTBWwzCF+qjOv6YcjaOYtJ+2W47w6AyTZ0UYWWwdT0zvicxAd0NCSnsM8pY9AyxuXkgYWFpgYw8v6YpqAUeHgqgsgTK0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl25fAZp6nlCeEl+vyXkAVZW6oGVmfnS8MHx33WKpFw=;
 b=tUNIOZoaLw18tT6BmydhjC6D38H+u4BMN1Mkme26rT8gduATHTHIViFxP4c3QzyOfRsenk3znTmRW91G5F+Do6uSQlVPGaJ0sZFSdinp3ub9F+AD5IVrwXe3uhyJUBDeBximZr8sdJHcP3irIRKMpylpy3Ee1W4+zEZGA7R4SFyiR+wcOFMlbUgx31NzxRn7WvwOVNWUZ9HPznjcqG/kR/CsHsKJ0d1lR9n8puusn2n9tbstTtysi/sGcXxEr1GALFWl04vRiM9PAVqG41kY9b83yAhOOQQnNYL83R+8o6doW5SXMTpytDHWv1cr6TEeyNJl37Lc5BrIiTX6vchDxA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:10 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v7 0/8] media: add new API simple subdev register and add
 imx parallel camera support
Date: Thu, 02 Jul 2026 12:03:56 -0400
Message-Id: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOyLRmoC/13Qy2rDMBCF4VcJWldFmtFl3FXfI4Qi69Jo4UvtY
 lyC371yaImj5RF8/4BubI5TjjN7O93YFJc856Evw76cmL+6/jPyHMpmIEALA4bnbqWvdfwYvet
 4IC0BCRV6ZIWMU0x5vefOl7Kvef4epp97fZH7618IxXNokVzw6H1ACk0DQr736/jqh47tmQUe1
 AqsKBQqidpIOgmTKopHShXFQj1pxKiEDjVVBwpNRVWhKiTvVAyQyD5T/U+NMNJWVBdqkzOeok2
 tq6g5UFAVNfvVFpPS5ZPK3Qfdtu0XshGD3c0BAAA=
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
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
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=5878;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZBwVmVoGQgSKkvwefHcxIuCc1TV67ashTeJwlO2hQVY=;
 b=DJLgQbB192Rf8l7CrwNhtIy9wfmR+AowI33dPq6yl/Ggrjs3xtZ707bcGXaD4j3verlhTIgKj
 BDAO30FVAmvBwgKPH61Peo95jaMhpl0miio2SRbEbzjOrlDVcvGtEIl
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:806:121::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: b34aa194-d072-4ec6-515b-08ded8538da4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 nhHsZZo6351Kr6rz60dq8qLCsBGfMaldLQz+xtyfg/HFOhKAsXasz4Ge+uL6SolZJ8WCkr/JJj7EhwgDhtrFJYUSa5BIE0I6Wtnrk00giGIG9PMLJvnugVlOHcsBcw9JNyQDNCJwMJ4qkEHa/ma5tGtLoFyDHXoyETSF159f2F/8OIhxD4BnMhtXqy7eEg7Pic/IfZHSpkB9XKeW4qCvlm7wqAbeqGBQaNGCsqF7Wzul1wFBnCtodBXZllst9tfMhPVtkHxCZ28D+tMi8khMo1ft7FIvt+g3t6eWmF07BYOhqCTG73NEKG5SXr+sRIpW1h/YS9sq8JtwuU1EqoVVCdT1L7CUFfNpOwPCt60Xp85JPa8AR33s4n8O7iJNTCEbCQdRy+fkLFAP8U+0KrAy5hHpvzG/JL8eThHbo2vZGKz4m8uGslZ0p9xVKR6DErlGt8pCQ9IuauYzejIVb+/u0R7cCI9h/zlrxtXoO6AhFx51ljppFV0BM4SKS3mnZ6BFFp3mjTfwhC76XY5bJii7dZzxxivsyAW3FeEuhlIk8vaLxY7Yzuk/jUiDDUifb+6obANolnW6zpdZ3j4ffy5VhAQNfB8JgS0tivCtm6m+KFhR27ipOagjr5gHzN3Kl8qG9XdfWOtbBOg2oSFLDLotA82H2Okrkb/4P+f7S6GdDkQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UE13U3VibU9yYVhudWJxbFlDNnEzRHBhUmRqWnUzbFRTcTNBNEpVc0JPUU5V?=
 =?utf-8?B?Ukhrb1UxdkZBdjhtL1FqcHhDOVFHZHNNL3lOdnYxdjNYS0FvN2FvV2lLcjJZ?=
 =?utf-8?B?VFJ6cElIZ001dkxNNkFabnpCZDhQem5XbWlsVlNodXlJdXBiVWVtNmVxZjRj?=
 =?utf-8?B?T2w3SnlPL09FQzlFRTNCTmZhbVhKWHBKb1pHUUtGREpXYU80YldicHhDSFdx?=
 =?utf-8?B?NUcrSUc1SmU5Y0xpK3Z0bnVEcWUxZG81bmhrRjIzK0dmdXE3VG1lbjlvY29B?=
 =?utf-8?B?ckZZQmEzYVVka1oxWWdtTjY1UDEwaHhDejJWbngxY1ZMb1JwZ3M5b1NzRHFI?=
 =?utf-8?B?MUdnalR3MHQyV3JmMXpHU3g3S1FtWEZPTDdvNWhqQW9Xcm5HbHJtUFJCWU5u?=
 =?utf-8?B?dVMrcFRDb1k3djdMdXlkNis4UTRQL2pFZGlhcWtvb2U1SjE0TnpyaG82cEh5?=
 =?utf-8?B?Zkh6bTQzRHhaUVZiYVNuT2JaZmFvM2VXWVR4RWN5OWFoYk9xNUhpY0prRGtR?=
 =?utf-8?B?UXRZVG9nZHcyN3FnQ09qT3JoY3ZwZkNMQ2h5VmZoclZnUmZWelQyQ3hNU1Q2?=
 =?utf-8?B?YVNnZnNDQmlsZ21LY21MK3lQMkhENGVSTWg4Y0UrSmJ5WlEvdDlWd1c5SC85?=
 =?utf-8?B?QWRPUkxWYUtQM0lEdUJtb3JBbHNrajk1R0lWbnlQZVpaZUlnQmNnRHczbVYr?=
 =?utf-8?B?a0pNSDRBNGVHZjlDd1MzZEpMK0FWYlFRVGRFUG9YSlgwL00yWS9icmtNYTk4?=
 =?utf-8?B?eDdqdHNoOUM0a1owSE5lUU05MnJpVDZVUDZzU2pHYW5SZVVGZE9rVEJlUmpW?=
 =?utf-8?B?VTdYSGQ2ZitCVmlOWEViL2h5c0szMXE0bTBBdm0vQnlMczNzZ2xua29rOUJt?=
 =?utf-8?B?dUYxdFgycUczYXJKQk5rRmwzMk1DeWltZ1NlbnBKRzdHa0JDN3Q5N0cvcFlX?=
 =?utf-8?B?MERrZ2p2SFd2VHNOWk1DQytveUpGdVNKRGU5dTR5aWVuSy9VVmhqK3BFWnE5?=
 =?utf-8?B?VVRyZkJhL0JnRmVDd25KYmFKNnUyNldOcVNGbXFKQVdNN0tpYUxCb1ZwWlFm?=
 =?utf-8?B?d0JJdXBHWUpIYWc5YkwyUFpwSmZpRStmL2hPYnV6NThPL01XMUsyWFNLSXlQ?=
 =?utf-8?B?VzY3NWszbEdCdTdLeDNrK0hKYjFrdFZsM3kvQmV5ZWZZSkREOU4xNXdyRXdu?=
 =?utf-8?B?aXJyYURwbVovT2NGWmZqU3BNWG51K2FWMml0d1hMa3cya2xZcy8vT0tsVzcv?=
 =?utf-8?B?YWxjelhac2FBaEZ3a2dBT0lDS3VTRmxJVGIvOGdlbENJUHM0Z08xSEJDN3F0?=
 =?utf-8?B?aEZBaHcxQmRFR0tmYjZObmNNeUQzMlVydGswcWhPTjNYSklncDZXMUo1eFh2?=
 =?utf-8?B?akMvZTNPc1EyQmZDejZiUHd0VGhITitJd01vWEZBZklUUUdKWjRQSEdKNmxm?=
 =?utf-8?B?TnYwNDJrRHNxQXU4VVh4WmtwT3lvSGYvR2h4YVNzUmNVVjBiOVlaNHE2RUYv?=
 =?utf-8?B?Mk1vbDdNVnVkVHg0S0NscWFFTVBhNzJ0KytSUjNWQno4ckN6TERxR2ZQa1Vs?=
 =?utf-8?B?SnZUdkN2YitIVEpCcWV5Z211M2h0ZUp5WlVTMzN6Q2IrMTNUY2FkVForTEdM?=
 =?utf-8?B?TnBQTjlFdmpyNkIvY1E0L1FMR2pFYkIwMStuTTkxM0JsaWI0OHVzTjEyTFVP?=
 =?utf-8?B?TGtjS1g4UFlrUUJKOXh1N1ZveWthME5jWlZiQVp4TlFYaFFwenlPMy9qSXJ6?=
 =?utf-8?B?OUo5K29FNHdRSDRzNmpkL2JzN3F0RDdIalgrdkdoVU81UGR6dUVqREs0eS96?=
 =?utf-8?B?TmRCSVdUS1dOUnA0QXFFak5NVWRVQ1JNRmsxM1dnS2VoUnpJTjhhU2hYZ0l5?=
 =?utf-8?B?Z2tyZEFFWTdZeXVReXFsTVZkaThGSS9CT3hqZThzY2MwZ0VjdDR2bE1tRUNj?=
 =?utf-8?B?Vk1tQW9aVHNQMFV2WWFtempqMGs2WjRNN0JHckZlcDVhYVZ0RnNqcXdJQURj?=
 =?utf-8?B?RW01Zk40K05TREd3dnA1b3VwV0pmWmIrS2lLaGdoRXNiTDFodzBGbGFJQ0ti?=
 =?utf-8?B?Y2hDU01OYTNyMGwrVGUxZ1dhVFpMM081QnJtRFN4c0N5UGpNS1VjdjBqQTU5?=
 =?utf-8?B?V3U1L2Y1THlDQ2JMckllQ0lSUm9HSnI4UnBwOHdNcnJWUVo3WENwTkZDbm1M?=
 =?utf-8?B?eE9lT09HQU1JNjY3ckI3aUUvVHp0ZERFeGdaenJpak9PblhKSGV4Z3JLMUNm?=
 =?utf-8?B?dGdvd2YwNWgxcjdxNDc2SDJ0a00wRjhyQXVjMjNWZnJSNWNIbDZiTXVtdTF0?=
 =?utf-8?B?TThLT2FxVlVCbkx1ckVpeFczYXNsbWlQMHVSSWZldHYvREh6d1V0VXZvYmNY?=
 =?utf-8?Q?+8WHql3KG9LLjYxN0shNrqq7hgolCu1zCIoHu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34aa194-d072-4ec6-515b-08ded8538da4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:10.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waYcO+ddpQpwdPpDOiiyX64CpIzuodg8T7naNxvsTmUgpmLkQ51qbtJveiUatGvViU0i++UsWASU8tXGGA1VQ/HSo2FwHJyPO12wYoTMujdEAF858ipg72uMUp6c9RIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66383-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DC6B6FA1F2

Base on patches "media: add and use fwnode_graph_for_each_endpoint_scoped()"
https://lore.kernel.org/imx/20260624200237.GJ851255@killaraus.ideasonboard.com/T/#m7969735b6c236c6b3abc16b9f3f55ec0488dbe89

This patches base on previous' thread "media: imx8qxp: add parallel camera
support".

Add new API media_async_register_subdev() to simplify subdev register.

Require only one endpoint under port

	port@n
	{
		endpoint {
			-> sensor 0
		}
	}

Do NOT support
	port@0
	{
		endpoint@0{
			-> sensor 0
		}

		endpoint@1{
			-> sensor 1
		}
	}

By centralizing firmware graph parsing, media pad creation, notifier
registration, and link creation, this helper reduces duplicated code and
simplifies error handling in V4L2 sub-device drivers.

Add media_async_register_subdev(), a helper to register a V4L2 sub-device
with the asynchronous sub-device framework.

This reduces code duplication and simplifies the implementation of
simple bridge and converter drivers.

    In subdev driver:

    your_device_probe()
    {
            v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
            ...
            return media_async_register_subdev_1to1(sd);
    }

    ...
    your_device_remove()
    {
            media_async_subdev_cleanup(sd);
    }

This API help reduce over line duplcated code in synopsys/dw-mipi-csi2rx.c.
And use this API at imx8's parallel CPI driver, which over 90% code now
hardware related.

And also benefit on going pix format patch
https://lore.kernel.org/imx/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com/

It will also reduce missed media_entity_cleanup() problem at some error path
https://lore.kernel.org/linux-media/20260614202835.11977-15-birenpandya@gmail.com/

Previous do partial simpilfy at
https://lore.kernel.org/imx/aaisdJSsFE5-PLx1@lizhi-Precision-Tower-5810/

To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
To: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Rui Miguel Silva <rmfrfs@gmail.com>
To: Purism Kernel Team <kernel@puri.sm>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v7:
- Don't save struct v4l2_fwnode_endpoint vep to media-pad
- add vep argument at set_pad_by_ep call back
- Link to v6: https://patch.msgid.link/20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com

Changes in v6:
- Change API to fix more width user case, assume a media pad have one endpoint
on dts.
- other detail change see each patch's change log
- Link to v5: https://patch.msgid.link/20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com

Changes in v5:
- Add media_async_register_subdev_1to1() to simple code.
- Link to v4: https://lore.kernel.org/r/20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com

Changes in v4:
- remove imx93 driver support since have not camera sensor module to do test now.
  Add it later
- Add new patch
  media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
- See each patche's change log for detail.
- Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com

Changes in v3:
- replace CSI with CPI.
- detail change see each patch's change logs
- Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com

Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel CPI support
      media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Frank Li (6):
      media: subdev: Add set_pad_by_ep() callback to internal ops
      media: subdev: Add media_async_register_subdev() helper
      media: synopsys: Use v4l2_subdev_get_frame_desc_passthrough()
      media: synopsys: Use media_async_register_subdev() to simplify code
      arm64: dts: imx8: add camera parallel interface (CPI) node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  12 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c      | 629 +++++++++++++++++++++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 194 ++-----
 drivers/media/v4l2-core/v4l2-fwnode.c              | 169 ++++++
 include/media/v4l2-async.h                         |  39 ++
 include/media/v4l2-subdev.h                        |   7 +
 13 files changed, 1151 insertions(+), 154 deletions(-)
---
base-commit: 3c96488c275bd6a036b4131b0838affd371d55c2
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


