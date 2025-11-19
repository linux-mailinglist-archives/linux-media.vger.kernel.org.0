Return-Path: <linux-media+bounces-47422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AF7C712C0
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6D80F2F8F2
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E756A3246EC;
	Wed, 19 Nov 2025 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DtxbK8pT"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEBC31A046;
	Wed, 19 Nov 2025 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588100; cv=fail; b=ejIT00lw2arDCVJVWwxxJeExp5w5K3UqZoPZM6goaNpMev+EHudzDFjnTlcUBcJ7s9ae2cZO98uEGwKd3tVXlm953eekJMr+zKXFus3S8FdgnmIrbExa44NEKexd3O/YRcE77a+Zmaj+gKZ6de1WhZFpXhhF/rvIu6TRto8AsWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588100; c=relaxed/simple;
	bh=hOSFMCym/hb6glt2EBJMskpJPVTVCs8BXm2UMYWYrG8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ipl74EBJSIGNWRIpZgYr4yiJMbrTt/dlCBbY2FFVs4WWNX68jS8d6/vOqjrAcKkW4jMWWlJydaSi2EhBbS1wpATQGEDqLcx0bTzQW8VJtivDBdYK8klvbkx/NOCpHMaqgbWakVgxH785g3xWHnhnDEFC5B0DqNyOdxj4FpMisio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DtxbK8pT; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZcDtxMeW2qwhLrlwROwGzyf6pJJhNqNSS0oHEHCL+yPAEX4EFzxPPoeLYfqNOx0PXzJ8Jxv8b/QRUuDWBZOFgBfMw/tZr4HJUXsg/xP34ZrXiyjp9WUTMZnqXxBx15/nsc2WiZbG9iF/RIldduA6TYE8LjB8EaNgSFhPVAB8ixu24o49yP4pavKl87+EGlTHSh4leLKQ/erx8x4Vv9LwLH1T/JkiVIlth9CYVzqT6jxWz6kMj4dBqOqSMDOzYq++aUk6VIGjBQuY4ZDF2+ge/S4pA7ECkdqSuEYM32W8QTGAgU586TyHjzbR/q8UKYYpf1aAaQCHau1IJZuULBVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VkQKXGP34QywJh4JwW4foCeHf47CEbE7fOOMjXDL7s=;
 b=ntlSkrzHJiynls8bynmTxsBxUoCT/B//diwm06H7CpT9euzf11+3+VtKMXPg42I4IQVb1GI2Ro+m/794F/xMBjk5Klr+F6zOZw2kj9Ke6c1DAo1tb0kOqsA7W53avKG3YrIG0gi18h9ju0SFF7hkokb5ZS12lDr7NfmqJ50hBqzius0iA0cmJgw3FPnM07nArU0q7OF/FzvPy/ngISwMlPdfYwQrsynMrAwnPprZLBL4Xlc/ZKlulqvG9QRLqBJx65HLzj7BrcYo7G90YDha89KOajGIJ+P5qZkOENtyjHvwxfz1/bePuO3/TUZY14PsmZqbVpD6m2ZMPU6xF8C0Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VkQKXGP34QywJh4JwW4foCeHf47CEbE7fOOMjXDL7s=;
 b=DtxbK8pTrwTLdaBwuKcwsdca6zd2ujwsCHjcaB+k4m3ZChS80U4v+N0UrSWeTbz82p9NkEazA7PuewG/ez3ZXontoQXDwigp5ceghFFpk7un7UORwsAtWu37IVTlQbtCG6VM0C/wQ58chSNHZf5MinKnSf3J1MHZX8ZUt8qsfUxjsiETpboWV7spBtOz328uY/tjNIdrxZJWJQCV9Fx8WXMa8Qcr1v0eVi0L4K5hzRc6SkHGU6r1X079dmOIBqCVSeFTnyqoMjL2+QsiJf2DeOv7Frru7cJYi+EsgCnzIXRx4U2IpSGcyODd99lbdLQ+WsLHZUZwIeFWl03IdnAc0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:34:55 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:34:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 19 Nov 2025 16:34:28 -0500
Subject: [PATCH v2 5/5] media: nxp: Add dev_err_probe() to all error paths
 in *async_register() helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cam_cleanup-v2-5-df732cc83ff1@nxp.com>
References: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
In-Reply-To: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763588074; l=5132;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hOSFMCym/hb6glt2EBJMskpJPVTVCs8BXm2UMYWYrG8=;
 b=jfafW0LvIfsoTu4uEO/M6nWXC9+L2VODVjXCBsnsgY+xEhJsqyonlSSzZ7atUKJg1FZ7cK5Sj
 ok/HvQzB8ZHCPkiQFBb+2n+MNWi6HeLTAh0doHY2OiHCokbB7bxHNaG
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI1PR04MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a0e955-fbcc-4388-4ccb-08de27b37b26
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T1RpNkk3U3lWWWd4OEs2a2cvYUttU1JNT21wTWdHa2RhMnpDeFlJY1M3QjMr?=
 =?utf-8?B?VTlmYXVaYldYVERzdGgweit4WmhvOHFaOFI1bG1OWUVvVnZxdStPS1hEVHpD?=
 =?utf-8?B?aVpxdkJWV3ZTKzVWaitURDBCanpaUHdCYmZuRmdQM0hheXI1dGt4YmVMcTV1?=
 =?utf-8?B?amdubWd1ZGRqYk1KUC80cWM2cDlPOUluTXJlWU5sMG1SZnZaZDFrMDh0Nmcw?=
 =?utf-8?B?QVZtNDQ0NmNVeGI4RVp4UUZmaG1CaGJJcnpZelpmR004bU4vSXRtekhaUlFs?=
 =?utf-8?B?OWVreUVjQnZ4RWtNZXo5TnFMbE9najhHSE1haDEvVUF6aGx0QmZRWGIrQzQy?=
 =?utf-8?B?RDdtdEk4T0pKOVFxWFhyaU5Qa2NnQ1l4NlVicFNoWWJlUnptVFh2dFV5NHdV?=
 =?utf-8?B?MENnNEFjVnk4NG51WVJ0RHN4S3Z5bFZQYWZ4OThPV0RUV2ZpZ0xjWXNOT0lH?=
 =?utf-8?B?RjhMWDU1T2hya3VFV3d5NmxaQU0wM1RxeVRreDRxQkFmb2h5RHVIK2lhM3A1?=
 =?utf-8?B?aGtMc3JjY25UODZFOEZUandheGxQS0pneTI5MmhGdlFQTERacWoxZkNsNEM1?=
 =?utf-8?B?Y1o5Q2hEaVB3SDdoQndNUjBmY3NreDJYaGZKS044QTlqSkJqeW10QklPY3Zq?=
 =?utf-8?B?eTYzdFpGWHFQemwyMjMxWkNwbHo3QjJyWmJMTk1DU3ZLMGRTUGs1NGhMakFw?=
 =?utf-8?B?OHdvZUVYbTN3YklLM2VmeDRTWGplU2J4dnJJbkREQVIzRm52KzA0SUdxTmtr?=
 =?utf-8?B?ZWQyN0I5MXpVczZkNFEvY1U2bnhzMnQ4WC9XN1RNUk1GRm1WZnJSblQ2VWRz?=
 =?utf-8?B?Y1FOaTlMM29ST0wyMVh0czVpdDk0Y0grVUMzTVNRVmw2UkFLOUlPQTA3T2xR?=
 =?utf-8?B?dHFjazNCKzlSSkJYV3doQUtDY0hKM0JjY2hCcTlDai9laC83WDJFajh1UnJX?=
 =?utf-8?B?cXBVdjZjbjBBRVhkVDArQytFd3UvUTJHNTA4K2Y4dHhzaE1TTTI1L25QMHlo?=
 =?utf-8?B?eEZHemV5TWdaZjNlY2VxYjhOZStaSUxyVkRuOTFMVUN5RWRtcG9WY3pCL1hZ?=
 =?utf-8?B?WUlNUnMxT0lXYjh0SjNCd1R2MUNseFlGOFpydW9zdVl0UUc3VFdLbzhMM0V0?=
 =?utf-8?B?SGJwRjVsRE1YdjVPckJwbTBPZmhwQzF0V0dPS3VDcUg3WW5DV0Fmd3FkV29P?=
 =?utf-8?B?M25aRGJ6SUYxNzJUcTZYNUdLSGgrUDZDLzJXcUlBNUFsNnFpdjh4STUxbFRE?=
 =?utf-8?B?S2N4Tlk1S2kyaEdOalJyU0owekcrajQyRHBFa0Y3ZCsvclVxcHZyT3YxcGtV?=
 =?utf-8?B?YkpxYTEvaUpBd1ppWG45VmpNR292OEhvMm9BTWEvZmxzSTRhL0JvZUhOZHZM?=
 =?utf-8?B?R2ZmVmdTempMT1ZhcG1Ua3N5aUE5Q1BTaXBtaGdVU0ZjbFFxZVMzdW5CSXhk?=
 =?utf-8?B?UFh4Z2p0MlpRQ0g4UURqSkRVVUp1dVM5U2k4dHV2UUdGcDc4dXVrbFRFalNv?=
 =?utf-8?B?ckpmcFAwTElMOHIvU1NkTThkUjIrOG4wVXVEam9wL3pod3FlRGtRZDF6Tnlq?=
 =?utf-8?B?czRWWm0xL2JBVHFWRzJUc1pISUg5QXNUTkp5TjJMamhubW16aitPeWkwRGhh?=
 =?utf-8?B?UGpxS3k4MFVzZzdJaDFwY0txOWExZzczWHFlRkVnOEV5eVZVMER4b0JVSXpi?=
 =?utf-8?B?V1AxM1FUMVRyeTF1Mk0wTk1FTkR2angvRmhMK1V0SFNvRkY0eFhxTXRvWWp5?=
 =?utf-8?B?enAxRFNibDdwbVZPRFk1NW90TWtRZ0dHZm9PV1hvcDNzdG41K0dNLzdSRzNX?=
 =?utf-8?B?TnlnMHBkU0J1dW5oYmh4L0N2bWg3eG41S2t0NndnbEVVakwwOEJheURWcHVn?=
 =?utf-8?B?RTJDQTRwQlJBWGZEcFFJMUdMSkdjNnVVd3FBWmNsdXl2M1hnVU9CMC93b1BC?=
 =?utf-8?B?Nk52KzZnaE9jRnViTVdmbGVWL1NQbEdyT2hlSkJJd3dVbWxjbHAyRXJDKys5?=
 =?utf-8?B?YTBEYy9aSW1tc0FReUlNbEtQcjNBeUI2UW1vbjVTRnh1M0ZmTUg0M25CSzZG?=
 =?utf-8?B?TWVsRktVM2FMUk00bUx6Rk4rcmtPVzZwYjYyZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cEhUNkVUZFl6azBodzV5ZXZma3ZqcjVNVW1Vc0FWV1dVVFp5RFAzMlBpS3ZX?=
 =?utf-8?B?Sml0MldxMjVyOTY4UUM1YkZCQWZZU3JNTm4xL2h6ZzRHaE1mZ0Vkd2Y5NFdl?=
 =?utf-8?B?eWcwNW00cXRCSGllSTBTK2dqREFsR3NkR1V1TFNjamdSckc2eWFaQnhiMkpJ?=
 =?utf-8?B?dlVTL0lVVVE5d2lab3ZSZXRQak1MZk5IYTVaNE9CNEgzQ01ibk5tMjBjZG1X?=
 =?utf-8?B?dWJGRXdNUENpZTZ3aGdmRnpYdEorREVlZmZka2Z3bXNSVm02R1VKRjI4eWpM?=
 =?utf-8?B?VW9CcFI5Yk42L3BING5JUE4rUXZUdmNBWW5WSkJycUlrd3hubndnM2xDTktR?=
 =?utf-8?B?dDB0U293ZUJJQW1rcndMK0dQdVJxK3hSYy9xWG8xK29ublY4aVp5VE5qd1lv?=
 =?utf-8?B?NU83L0lNTXlUakNzRDNZRG4yU2hoNElpQnZDRTEwUitVcWdrZnEwWjY5ZnZZ?=
 =?utf-8?B?cHB4QlNqcng2QlE4Mi9XS0VpUXYzYTZFYk9zSTJ4eTJQdVJNYmNUMVo2SFhI?=
 =?utf-8?B?elVXR2F0d00rU2FCSFNkSktuTXZseVBPUWVuRU84d0FHcm44ZktGQWs5VzBZ?=
 =?utf-8?B?V01mVk1WOUl3b2tNaTFPQTMvWElOK3pYNG5LSm8yQmRPcGdRUTF2WER5U0J5?=
 =?utf-8?B?OTdyeldRZU1zeTF2QmxvbGw3eVIzSUtseGdTZWI2dWYwS2J5aUQzRzZaKzA0?=
 =?utf-8?B?dG40bmwxOURFa1F3bTR4ajJySW5sN2IzaUYwcUppczFtVEtObWo3UitqK1lX?=
 =?utf-8?B?UU9BdFFwOGNhWWNDdmt6QmFYWGdhYVlSVXdtWFFlNzlJb1NaQWZSNXViRHEx?=
 =?utf-8?B?V3Y0YmFvUG1sWS9tdmVMWVJDUkpPbGFHUzNEWEF5Wmc3QlRiOUhZTlBQWWs1?=
 =?utf-8?B?VnhjcSt4cGRxWjlFTWd2Uy8rbEMrcUVxdldmVHFQRzFKN2tMOUUvcXJXZUdX?=
 =?utf-8?B?MUF6ZWRyT0FRdWQ2UGhUbVhXSXVjQ1ZOenZXeHFRNTRLeXpFYUszMEp6VkVJ?=
 =?utf-8?B?aGxzMzBzWlluWXQxRUNaWGRxUHRlVFdaalVBQk80RmlHc0d1MTRVZ1IvVG1U?=
 =?utf-8?B?d1BJNHFISjllSlgxaEFKWFBlYVo1cDZCSTQzbWhYL3B6OC9YNTBHUzAxaDBD?=
 =?utf-8?B?RVk1VlI4UlFmUGRSVVNjME9XZzkyNGRKbEg5UU9RbW1YZ2M3c0xmR2dYZGdY?=
 =?utf-8?B?SjJtS0pyTzVmemhYZWx1bVJoWXdHSS95dUhTNkZvU1Q5NmlYd1N2NjRHcWJW?=
 =?utf-8?B?UU9qa2dDeUNua0tMc2pvcWEzTTdialo4RUhZa3lDRXBPY244VjZaSDZ4WnhT?=
 =?utf-8?B?dkF2VTBwWUlhalFWRXVEVjV3U2dqS2k5VzNDVU1qUTdEWWZaWVZqV0Y5Z0hr?=
 =?utf-8?B?eVA1cTFIOURlOVc4Qk1PRC9tL0FiL3dRb2FGenU2cHZDc1ltalE5d2tsSlk2?=
 =?utf-8?B?WHZ3bXlyTmI3WHNndGVhTGNOWHc1ZEpQSy93R2hxeHNDNVBJZzlyLzNVSmdY?=
 =?utf-8?B?aXB4eVd3ZE9mR3FWcXFadWFOb2VYTmtKKzNEaHV6ZjdxazdmNlU3aWlLb0ZC?=
 =?utf-8?B?NEJ1NHF4OUg1SjhmN3hxU2tnYmgyWXNCZ3FZdVFOZHZiNFdKNGZiVlpwakxF?=
 =?utf-8?B?NlNRZS9LSFFvQ3gvSk9GbklJM1NxUGNaT2JXMm4zTkJYRWpua3J6NXdmZndB?=
 =?utf-8?B?Q0ZFSXU2MGFhUE02RE9FcldwMWhkdEJjRmZWeTEvMUZJLzNQeUZ6a21DSklZ?=
 =?utf-8?B?YVA1a1ZQUVdXblVvN0N4aFdKUjJYdmFLdW44cXJyZ0RMLzdvdFU2OVREbVcy?=
 =?utf-8?B?ZkF5Wks0NnlrN2E2a1RpN3A5N250TUdjc2dmVmpaYTM5L2lvQ1gydDM2cXhB?=
 =?utf-8?B?UjkzVE9GYWFGQWxrVVQ4VWxTbi9hL0NBZWtDZWhSSmoyMUhrU3ByNzF1QzVm?=
 =?utf-8?B?OThoSWxNbm0rREZTS0NwR2JRQUs5YlNWa2lxR0ZQTXlIRnMvcjNZY3ZpSC93?=
 =?utf-8?B?R2FyaGcvN2hRbUF5SS9lVFBibUFQTk1vUUMvbkFIekR0NExhcWxtNFN4RE5J?=
 =?utf-8?B?dnppZWVQcFFiYWdwSmFjbi90OEVKbVFya0RPai9sSm9VT2M2LzMwZUJrQXJp?=
 =?utf-8?Q?8GDly/EU++Myo5AqkTrEUqHPV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a0e955-fbcc-4388-4ccb-08de27b37b26
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:34:55.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6gbNCmyrUZrRfmGbOR49iqA+2m1acw2p+8G1McPrhilDBk1P7/rAcKq1phI5aJEv1pA2b1UA/ytynZbbQ4SMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071

Add dev_err_probe() to all error branches in the *async_register() helpers
to provide clearer diagnostic information when device registration fails.

Drop the explicit error message after returning from
mipi_csis_async_register(), as the error is already reported by this
helper.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- new patch
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index f345aba63936f5ee86ec4c621f3cb434002d7c8d..75d1a40530b51d4cdcc69371b9263cf6df6a1a52 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(csis->dev, -ENOTCONN,
+				     "failed to get remote endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to parse endpoint\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(csis->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(csis->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
@@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(csis->dev, PTR_ERR(asd),
+				     "failed to add remote fwmode to notifier\n");
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
 	ret = v4l2_async_nf_register(&csis->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&csis->sd);
+	ret = v4l2_async_register_subdev(&csis->sd);
+	if (ret)
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, &csis->sd);
 
 	ret = mipi_csis_async_register(csis);
-	if (ret < 0) {
-		dev_err(dev, "async register failed: %d\n", ret);
+	if (ret < 0)
 		goto err_cleanup;
-	}
 
 	/* Initialize debugfs. */
 	mipi_csis_debugfs_init(csis);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index bb9dace0cfac08dc43858b69590f3d73457b3c4c..34500c358d9d3551492e102a59640647e153c763 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(state->dev, -ENOTCONN,
+				     "failed to get remote endpoint fwnode\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed parse endpoint fwnode\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(state->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(state->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	state->bus = vep.bus.mipi_csi2;
@@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(state->dev, PTR_ERR(asd),
+				     "failed add fwnode to notifier\n");
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
 	ret = v4l2_async_nf_register(&state->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&state->sd);
+	ret = v4l2_async_register_subdev(&state->sd);
+	if (ret)
+		return dev_err_probe(state->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


