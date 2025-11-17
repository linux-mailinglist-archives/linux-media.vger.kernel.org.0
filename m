Return-Path: <linux-media+bounces-47224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9A2C65E2B
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 22E0229C72
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 19:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B63D3451DC;
	Mon, 17 Nov 2025 18:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y3URr+Lu"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772533F389;
	Mon, 17 Nov 2025 18:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405927; cv=fail; b=Ggkw5su9VqzDrTCmfYqMDdAmo6qdNVjUzmWtuhpurRDD4hVd04yhAsocTU4VZzS7j1qzX9pRT7hTunoelsL14jQRCON+wAufsoY7nzloa6WOqrfZAtIDLaxTNQdqLKtBkBTDF8GWU3hl2FCnf3UFwvD9Co19HYAwbhdDpYfey2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405927; c=relaxed/simple;
	bh=JE+P4oB+UnzyXanBhPbuK5EKzK7+Fkb9G9SYPXUoyH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=p8TFj0ttRDshXlmBJSXw8FPcTpjj1OFViIqeo82jhOxHO/WSUE6BG66XXtJ+hxEB6eW1hT3Qo1tPf3zUskihwwcEeaDzKhUQXp077HfK/V+m3D42L4tYwYqmYEmHGNx63BfEnZ5EkLLgOc5n6ScM2+w3i5bK2ShReatEzo6lXmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y3URr+Lu; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHiMu523vvHZ2ULgN+Dcp4F33tB8LvDeISA1jyYqeHV+lTsmsYMIVOeITHkYLs35jcQmF7Df0rzb1wjqG/IVw8CGYJQrxdGy2rMoKyHQf1/ZK7LbvgwDD/8QT1RpAYAqrJEq4hN6aVwqgxLXwH+hedCuhoJnoNWHrb9GGTKr6HmM2Ix0+BXdqq2PrBlVQH9suwhGZYAxXZvtm7SvCRPb9KvmkNeAFiBiMPoBGiBIIk6dKRdyvG6Knmrws4hRMn5dFziO64EQi5phk6VIs7bteZ369WM7gK/SxaxCY5svBrcEaTViN0P6J+1K4iPksDb2qY1zFprKd30RjPDGwzeGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dnm1U+05I79lqjr77e6KfZzcrtkTKalmesBDf3GH5QI=;
 b=ppNnuE83vb0Vas0WuK42vmUMJhqX/r88B5qgPyTql6sOujc1d54puObMLL+WuOyrdkmcUbGMvaahsxtsO7i5w8EcregX9I4701OlzkmoKvKARjU1YqRk8YZq6hRK/GhwuXDh2sM/XEEgu0UFPUakbsYPEN3MUZI1ZWfQlC9PlxNEFHR3cSiVyL3Mg2KJLmTnzU6aitAj5iM2VeV/RdIAMvYM8zk8Ey10XCLvcL/bUpJpKPu4EAyppY+Y7LmlQUahIIbHqLgogtAjEDgYG2oo8LqB+fOcYtN35on/pkKkqKAGaEvUW1qvJJGl+Pe7hZE1P/a5kv0+rXNcxFv9XTOxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dnm1U+05I79lqjr77e6KfZzcrtkTKalmesBDf3GH5QI=;
 b=Y3URr+LuwMmqJc33VuDlULaWFGUjB2/y4NlK8HzP6KtEJK3zfMBL9kWUUyDF8XlN5Hy9qcPywhlNdGBKgmsf6czIensfTWWHQIbOFU44RMxo8crpJ43v2AJeXvnf7Sk5I5XIf5WfJh75Nfkc5xvhnYFEGu01naFYnowxWxSYRatW/LD9+uHf4qEjGD9JsxzUdBXdrctWZW+lfCvu99+biBmWn1nsKrNeaQX/chDaXeodHpjtSW+6Hb+kbZMLfVyJmH5zXPfkd4dpHJhXk/ze+6MbGsYT+P8Qb1BqtHMtVeEnrS5wmyvQm2Xt8ULgLbjAxg1s+1/z14AdQXYMyzEsBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB11030.eurprd04.prod.outlook.com (2603:10a6:10:593::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 18:58:41 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:58:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 17 Nov 2025 13:58:12 -0500
Subject: [PATCH 2/4] media: nxp: use dev_err_probe() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cam_cleanup-v1-2-6cd42872db79@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763405910; l=4352;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JE+P4oB+UnzyXanBhPbuK5EKzK7+Fkb9G9SYPXUoyH4=;
 b=OjG3Ikly1IMQd3r+WZb1ntX6sYCMtAyDtKP+y6H8kJRlhvaYHBKOYbvQDY7fcOwal3iRccoq5
 rjbneGgwjm8C50e3azNeTstt3hHziQXmaKRpuek3p6isJeUSRPSkfac
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
X-MS-Office365-Filtering-Correlation-Id: ce643d18-d005-4e2f-6863-08de260b530f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?anNBY0dYMWdMK2pZU0pjMUoxRVRnV0hSMVBwMW93RW9zcFRPV09yeUM4UnFT?=
 =?utf-8?B?NVRzYjV1eTlJZXJ0R2wzcXFRYzhuOHZzU2pPNnQ1UnlnbE9tV0RDMlZSa1RG?=
 =?utf-8?B?bUJnb2ZMQlV4MXZVQVpHMWtidnNCUkRFWmpsV25BTWJnQnU3NkRzVzF3QzdO?=
 =?utf-8?B?em52clo4TTVkS3hma1pQcXArSGkrQ2lvWWlHKzJsOXIzNURGVkhoQ05SRkta?=
 =?utf-8?B?TTBpS3pKWCtGeTJxSUsvWkhQd3FOMjhMb2VVa1hTSnF5cDUvaE9CZDFXd2RV?=
 =?utf-8?B?ZXdxcE05cHR6MkNyWDFHYVFOZGgyVjV2N1NibTFJTVQraTJRWlBwa29nVGVk?=
 =?utf-8?B?OElvQktGM1FRNEdZSXRCZnBQSUpZS3Q0ZVFjQThHYWZUcU9yUmp5b0pRUkNG?=
 =?utf-8?B?ZWFsaGZRM01SOWNaaUxrN1NobnBnallwdERzMlpubm53NHNVSkJpWit3N0Zo?=
 =?utf-8?B?OHJTZHg2OUR6dEVsRG1SbzJJZzN0b0txWUZWS0lrbDBTOUJXOTNGWjlWT0I2?=
 =?utf-8?B?WVNBUnBMNDBTWTNpODNnMVFDcVV2NmVwQkhpejRpd2hSN2RhMEh5ME50QlhH?=
 =?utf-8?B?V3hEb1pmSkxzemFKQjhHY3ZFTC94YlJ4OHFqTjVSTXVXcHFGYWpFRFRyQjVH?=
 =?utf-8?B?SDBuLzZrTm9oVWRNdjJ0c2FHL0lhVkEzY0Q3U1VzUng2RU1Ydy9wN3liSzRS?=
 =?utf-8?B?aHlkaStQZ0FKMUkzOWQvd01iZ3dhZ29IMUhtSXRmb090R0hmajRQZmt5ZjJG?=
 =?utf-8?B?ZEhNN0RpQXp1TmNPUGk0WWtxcU52ZmFqKzZaZklFbU5CL2lhenBxMyt5Vjdw?=
 =?utf-8?B?Zmg4ajBOWmM0aTNjTGQxWFdINnd0Uk05cVV2UitqNlZoZVIyUGRsS2dTT09R?=
 =?utf-8?B?NldycFBxQWgySmQ1ODFBNDBiaHRKNmV4aGU4dllMWDYvSTk4ZWdMY1JacDZQ?=
 =?utf-8?B?UUNZVlBab1hWbS9wR3dIeEhNbTllZWV3TXpzK04xY3BGUjE2WmtGcEtTWW5k?=
 =?utf-8?B?Y2RaRzFQL2gyM2ZXTFg4T0VUVnpiRzVHaERndG1iR2s0MmcyTDJaejl5dEhS?=
 =?utf-8?B?OEtUb0o3MzMvNUVpU1UyR1FpMEp1dmd2ekJTOU9jOXQ5T29mTHNKWm9vTysv?=
 =?utf-8?B?YlJTYlRVT285YjNJTU5LNGJTSHBFbjd3Sllsb0lWLzE1elZ6anJIeTlEUUJF?=
 =?utf-8?B?NDI5dzJhWS9kSm9tb1RKZ2VQczlrRFRtRGF2dFhxL3FJdG16cG5kcXlwbGVW?=
 =?utf-8?B?UjUycnRLbG0wUGpKbW8zaFQ5MzBudCs3Ymk3UXJJTXhibHZhU05uUTlLYlBi?=
 =?utf-8?B?azlmQ29WQkNMTzU5Tm5ScEdOcGJlMEs0OFI2NVZpVmRBbU11TnVmNGpmb3BK?=
 =?utf-8?B?TjQ3YXNkdTVWeW9JOFcycWJDenNVV1NMcVlYY3JUeFN2aVp1SXBuQWdHQUlh?=
 =?utf-8?B?UXROY0hscDNEU1JsZVhSYy8yT1BXdTFzb2RkU243Q2ZnL2hnMDdaTGFSckJp?=
 =?utf-8?B?ak9QNENtazlSNnZaWkJDSGRKTkY1dTd6R0ZUSHpFNEl1dDJXVlVzckN0eVhG?=
 =?utf-8?B?NWRjM0VDWnMvTWRWODVVZDY2dEZ5cHhYUjczM0tRdEhONnFxcmZBRUdsdUN1?=
 =?utf-8?B?MDIvM0ljZStKSmVrazhmUVdnUkwwMCtDQk9zaTdYRkdYZGpsOXEzS0VUUVBx?=
 =?utf-8?B?VlJCTitrMmpnNW5RNUFza2lDQTF1U1E0S29vUzUyQUpuWXFhakNlVU1DNW5u?=
 =?utf-8?B?Z0N2eWRVZGQ0dHVvZ3hzTHpFNnNEakU0eUVPNU5mTkJqWTNHalBUc09Vc1dE?=
 =?utf-8?B?V29jRDdrRFF6aXlwV1pYTGdacVRtNkJmR3BFWG0ycFQ3dnFYNjlEWlpTaTJD?=
 =?utf-8?B?UFNybDgxQ2svUEJhZTgvMStZV1pFWi9rdE5UL21MOHZGZE40ZkdhVUJFbUU5?=
 =?utf-8?B?d3c4SVl4UUVZQ0NudFpQVlhSbkpqWXB2a3RlNXN5VVpiT2ZyQ3J3bDAvZGNy?=
 =?utf-8?B?QnJKZmgxMFJhek55RktLMnlUbkl3SlM0VloxNGdLSXpVc2RsL08wNnprUUsw?=
 =?utf-8?B?V25WUEhoVStZT25HUGxuem5STldFNkxDQWoyZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OW05VDV3WldEZjc3TEwrTy9OWEV2QnM1VDZoWm9ud3NkQldWZHRFZG9VODFz?=
 =?utf-8?B?YVFJOThEVmJRcVRyQmFRblVhdVB0aUJNcytqd2hXYTNvekxjVncvbW1reGNV?=
 =?utf-8?B?L21mOGhWOGh0ZERFcXVDbnRPWjBRWk42SVBXSWMrcVlDREo2MWtyL3c2eXlL?=
 =?utf-8?B?ckZtaWtvQmRvTk8yaVJFY3dxYUZtaU9HbGZmQmVPRXRjUnl1TTZ5M2tZWU5V?=
 =?utf-8?B?c3FJS3VFYzMvNll0ODE2S1BEbk1vMW9VWEcxcjZVYWVEUnd5OUFGZkxaZHJz?=
 =?utf-8?B?QS9HM21ySHE2aFYrbHlYSndVUTNPdDFBYU1lMUxpWktMdWNjRGlxSlBUWEp6?=
 =?utf-8?B?U1ZjY21pMEc4L2EyRDg4VjdnU1pzRDk0VnMzdDFBdDF5dDRVUXU3VkVjcEpK?=
 =?utf-8?B?QVdRNkNGN3RreFpKUHB5cHZEZG1sRU56ZmQvakFQR1o3K3BLTUJObkhLc29r?=
 =?utf-8?B?U0FWNHh0S3JvNWVGOXJaWU5YdmZyVmlwNStqdWFRbVJwYUxBSFpKSlZoL0l6?=
 =?utf-8?B?b0tMOW9BRVYydGNKeUl3c0cxbVlZU1BYZVBMSUN5U0wzQXdkckgrV2oxY3hq?=
 =?utf-8?B?RFZoRHY1a0xoK3ZaODFxQUc2eFc2K1hMVVlvd3o0U3pyZVBBNk5JN2lGdUdG?=
 =?utf-8?B?L0JqbW5SNUdBRmd2dG0ydDdBZjJoVmJHL3pkUTZzdWhtNmlQek44VWYvUEtp?=
 =?utf-8?B?RENISHZVaVJTYWM2K2dyTE5GWCszdDRsWkN6TktPWW8vaWlwMmNpV1hVWXhG?=
 =?utf-8?B?aW1YRk9YTlRPMGpVTzYvWmJNVVdCUXpvMmNua3Qyekk5Y2JzTmxwYWRaSG00?=
 =?utf-8?B?Y1BudnNDbS9uQTVQNUk3QWNVcG9tUllSRTBUUnB5L1pwanVDbEd0TXhaRURB?=
 =?utf-8?B?aTJlMFVyY0J1MnRhWmNEZ0pmenJlUlZCa2ovYXA2bjBxTnNuNUJRek9wTkFX?=
 =?utf-8?B?NEhLSGttSnl5VUxWSjgrTHQraVJackNqMkRQclE2VEx3Uk5lRHFyWjJVMDF2?=
 =?utf-8?B?VHVjeHlvODhmS3BzeTBWWm9aQkNjT1NWcWc5S1VpS05ZcWxSK3cwKzBZbEFp?=
 =?utf-8?B?M3FiTms0Qkxua0lUNUFpR0IzN0FUbzlMYWJUZndXWWM5OStGbjdOZ002SDZw?=
 =?utf-8?B?VDdDUVlBcjA2L2QxUjUrR2NUR1NNaXBGTS9BYVVlMTB1V1VwQktUTEdjbU9Z?=
 =?utf-8?B?Y1dLYWpKYnlIeGFuRzgwS0kyZGc3cTYrdXU3V2lPOTRkM2NaM2kxMExCNkJ4?=
 =?utf-8?B?WWErdGNkMW1iUFE0ZlQyTjdFRWxuZ0NIMW5GVWErM3hSR2ZZdXpydk0xU1hG?=
 =?utf-8?B?MEdJQXFnb21EYTVKNzFLNVNnYmF1Q0FubEcvY2I2WjVPYmtvcnNYQytyL0dW?=
 =?utf-8?B?R0xLd25xOTZzdk1Zc2E3UVd1MEt6VVFHSHNGek5vcHh1V2R0c0lnL1B4MjZQ?=
 =?utf-8?B?amhzclI2eWpmK1RETk4yTDRva2VOaEpUdGhoSjhhcExkSGNGdG5Ca1Vzajl3?=
 =?utf-8?B?cHZuTiszdzEyY1Y1cU9QUXJjRHlDRHVWOEFrMmIySldFY09hVngxWTZOb2U0?=
 =?utf-8?B?MTBSZ1hwdXNlMXR6WDlSdmp3ZFI2L202Y0tOQU42ZHdwV01XMkI1Y1ZSQzR5?=
 =?utf-8?B?SWUzOWZPQnp0MjFGc0hhL3pBcmtScUU5c29oa1dJdXN5azBEMEdmNlQzNy8r?=
 =?utf-8?B?L1RmUWE5YjZJSHJId2lVdWp4R0U3K3BuaCthaDg3VmNlcjNHenREdDVlZ2hW?=
 =?utf-8?B?K0hybjhJNkRBaWp5eEZSV0NLczlCNXd6aXB5dHdQY3AyNzZ0R0NjL2JIYVVp?=
 =?utf-8?B?Sk5nSEJKcnN1MGpabUVublpBRDg1YlNnSzRTMG5KYURBOGRRQW9UV2N1WWF2?=
 =?utf-8?B?elhmb0xYR0ZDT1dvT0FUMDAwcUFBYk14MzlaNGpZMG9iZnN6Z1JiRzh6MnNa?=
 =?utf-8?B?TkpUSUpOWHhvWE0xalpSOVAwRHNWbWtENmI2UnBRZVY1eDRoUXZJSm9jMEZU?=
 =?utf-8?B?bDVzMHVhZjZET3U1YmptTzV2eGJCOUc1SWxzY3gzQ2wzRjBERkdGV2ZBcVJZ?=
 =?utf-8?B?djBUSldNTzB4VXczTmFOUW4zOU5lN2t4Y21YMnh2aW41YUpPd1BjTzc1Vzl4?=
 =?utf-8?Q?x/3JWeL/RXzXroGDbH8xoSRZL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce643d18-d005-4e2f-6863-08de260b530f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:58:41.5139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgF8TYpvPVx0yApBg9fxZSlyDfTWO8XomeZ3vaa2efa9Q78sNEcu0CJZgMnWsJLyJACJTkqQsi0PXqjHnQ3zVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11030

Use dev_err_probe() to simplify code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++----
 drivers/media/platform/nxp/imx7-media-csi.c   | 13 ++++---------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 28 ++++++++++++---------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	/* Now that the hardware is initialized, request the interrupt. */
 	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
 			       dev_name(dev), csis);
-	if (ret) {
-		dev_err(dev, "Interrupt request failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Interrupt request failed\n");
 
 	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(csis);
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..82109e6884a4d931a84ef02e2bde41d0d7248511 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2218,11 +2218,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	/* Acquire resources and install interrupt handler. */
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(csi->mclk)) {
-		ret = PTR_ERR(csi->mclk);
-		dev_err(dev, "Failed to get mclk: %d", ret);
-		return ret;
-	}
+	if (IS_ERR(csi->mclk))
+		return dev_err_probe(dev, PTR_ERR(csi->mclk), "Failed to get mclk\n");
 
 	csi->irq = platform_get_irq(pdev, 0);
 	if (csi->irq < 0)
@@ -2236,10 +2233,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
 			       (void *)csi);
-	if (ret < 0) {
-		dev_err(dev, "Request CSI IRQ failed.\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
 
 	/* Initialize all the media device infrastructure. */
 	ret = imx7_csi_media_init(csi);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0851f4a9ae52d3096f454da643cfdc5017e000b1..75709161fb26a61239b94430365849e022fdc14f 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 	int ret = 0;
 
 	state->rst = devm_reset_control_array_get_exclusive(dev);
-	if (IS_ERR(state->rst)) {
-		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
-		return PTR_ERR(state->rst);
-	}
+	if (IS_ERR(state->rst))
+		return dev_err_probe(dev, PTR_ERR(state->rst),
+				     "Failed to get reset: %pe\n", state->rst);
 
 	if (state->pdata->use_reg_csr) {
 		const struct regmap_config regmap_config = {
@@ -977,24 +976,21 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
-	if (ret) {
-		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "no fsl,mipi-phy-gpr property found: %d\n", ret);
 
 	ph = *out_val;
 
 	node = of_find_node_by_phandle(ph);
-	if (!node) {
-		dev_err(dev, "Error finding node by phandle\n");
-		return -ENODEV;
-	}
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "Error finding node by phandle\n");
+
 	state->phy_gpr = syscon_node_to_regmap(node);
 	of_node_put(node);
-	if (IS_ERR(state->phy_gpr)) {
-		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
-		return PTR_ERR(state->phy_gpr);
-	}
+	if (IS_ERR(state->phy_gpr))
+		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+				     "failed to get gpr regmap: %pe\n", state->phy_gpr);
 
 	state->phy_gpr_reg = out_val[1];
 	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);

-- 
2.34.1


