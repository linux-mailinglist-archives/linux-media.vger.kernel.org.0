Return-Path: <linux-media+bounces-41218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D28B394E1
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87873BA1CB
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA48E2D9797;
	Thu, 28 Aug 2025 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WkSdhYWt"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098E32D77EF;
	Thu, 28 Aug 2025 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365529; cv=fail; b=E2HuOoQLnCCeR1h+LO3SL1skggMoQqXrvjhrSzVEfCHzRqwJqP3jyiraSUvLeRR0pQWGzVhinIhG8IhAQ2Xg20CEy20PFZwVSkOGgYUXRFf/mzjD9ZL0oFU57aAxz8hHvGmNAnpf/ToMUYSvd/eze7kFBa9Ooc29FT0uXL2viGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365529; c=relaxed/simple;
	bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=L0wGjHDrmICvguv1KmjyrnZwsVMwBFFH9k5YFowmC/B3fvy3FW0BRcjJh54WVOIqESbvWs4EMDEzHuRoaBFw/KLOb7CWBAMjYBsvu2N5w15l0E+Eou4ArRnReRgbgXqv0iEGxSJlOTU1dBmgtX5Kd9ebyAmYwmD+DasCSbgK7nY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WkSdhYWt; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtN6xDGjt2bwTlsL6ViZfykmRKcv47FFbcPewnhNmb5t6Bfc1ehuamdKrn6IETg3gL0vDgu3mPOYMsJNl34FcknomhQpiP7jfKsIXzfUk4+UcF6v+cB+/6bK8HGKaONJ1ryEUze3sDF9IJHeG1nNPKzx7MvKAleYKDMHnA6sgH9iI7cvn4+ThUGk0R3ppUaXlCmBnjJ7bur94x93RkEpBitEDZhfH0rEjOTXAA9peuJ/pr5ZFvA+ynHV+xUTFm64wHJq2ohnknSLN54Gk1uatNolcRsMfpiVCjJzcmZ/WT4ocaaqmKo3VwEGaIFLeNPRbLRe5vLti6kL/FWyG+cudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=zViWUHE8WVgUJaLnv/P35zS31cU380fYtc7CI88fsFuE767cxpYn2NNLIF2bisx0YXtFiC0EQv3VA+6vd4xoLuEWWkvTO9PW6KnKgYbfF9AB5R4jhrdZIOphYXGcUMnaATFeLTfMVTy4xDrJUMPoBk7XPqgwWmxFCvXNk0Wk/SKZDC2Ejg3DWNQOVpvi2b7uUjSNoCcQTDx/ysoxhpVlrhsMqWAM5MT7Z9kRhU03YRj5UIDMoba6/Po6OhBRKIVYFbaj5a3ibfvJdlTXI9ktJJt6G55NT7BHzfB1smp08KGJVEXyDNWIXhvvMtJd4n5ieO5PtVUp6bdlPCpZSElkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=WkSdhYWtwH8IZhF/aFu9TdnbzYmytDBj5mx6Wg0m0CdjZXpT1o30mluY48chZcQteGi6d3sI5K1AjI40oY46u6Dv/6r9/2r2Oths6Dbbz+kDXBG0kvEYbOJvgAGZye8MrPFMIbEkdXQuEg8mE8FaHGNSQzpYGN9k+WlYJfWEv5bYN5OoDimMOKVFThLL3+EH+belQx6mqeEyLdaEXh5nT6fUQwr55BoEbcgEKjtGivsypUGt3X3bzgx3Br6nAQIZwzvjRG7KHQOhiKUkXFILbTAlPp1Gt8X7Zuglfe/AhQ4FnMLHxQOLzvgJ6HLTCSRRrvNpWzjDYowdFidFN+21Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6785.eurprd04.prod.outlook.com (2603:10a6:208:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 07:18:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 07:18:44 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 28 Aug 2025 15:17:34 +0800
Subject: [PATCH v4 2/4] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-csi2_imx8ulp-v4-2-a2f97b15bb98@nxp.com>
References: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
In-Reply-To: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756365509; l=3924;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
 b=n4Vu8BpcGtaF+wihxlQ652QbD0LysfDXf8tZWD75JGOCXS1v5eqMewGDhDNGqCEMsg8xnxhwQ
 KKJYHrUfZyFBl3wJU+XfG5m/xVoz8F8x1dYJJ9UIxVQOo6mheVbTAqJ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 30684a00-6821-406f-fee3-08dde6031f4f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V0hmb2xBNUc2SnZUKzRrQm5IWUt4dE83M0NaK0thQk51UEkxVHhyUmRqUzdo?=
 =?utf-8?B?QndUVzZ4R3dYc1M2V29lR0JEV1I3a1dsS2JHdVhudFdWVExlOWpJUFFnZGhZ?=
 =?utf-8?B?eW8yK3RZWk9xTk1jZGdNenp1UWtrVStlWkZHVEVlT1Z4aVBwbWx1dHQzbmp0?=
 =?utf-8?B?WC9FbWNMUzhoZktVZlZKSTdrKzBwNHlPVms4dXNjQUxGY3lmM3FCdnVRK08v?=
 =?utf-8?B?Q0RPUUFBcXZxai80RElJRFRVOXEzNWtSNHpxdnZ4aUNUQU5Dc1JXSHVid2RH?=
 =?utf-8?B?L2tLU1QwZG9rTzZVdVNMTUFTR3cwYjRCRXpmSTg2Z1BNN3hZY1d4c052UVZi?=
 =?utf-8?B?K3hrR0lwMWMwK2IxeDFhcXRuazcvSVpLR0d0dTZuUlAyM1JCMzBLWVMzVzVi?=
 =?utf-8?B?Yk1ycDRwMmJiZUZjTVhBNEdvR2xpSFBMcXRiK3pZS2d5czdGemdZYXVMOFhY?=
 =?utf-8?B?QzRNMStsRXdrZkNUbUp1Zzl2bnBWcU9PZk9pZEh5bFB2bFFkUExtaXNZb2ox?=
 =?utf-8?B?RFJkQWNGS0M5WFF1bkNyaGZSR3lEbkNWY0VGZkJRdnBhejRiZGQ5Y3A3UmRS?=
 =?utf-8?B?a0pGSWxvS1dKNnEycUloTmtSWWJvZFRxWENuMXQ0TnA2b0cvR1lvV3EwUEtV?=
 =?utf-8?B?clFNRzREeEp5OW9qb0dyRWRNa2QwQkE0bkpLRmdSVWZHRXZndXpONnpYTnpO?=
 =?utf-8?B?SWVyTDA1U0IxMVRJRWJhQzlIemtBOFAvUmh6SGpxTzFtREV2cUVXMlVjTXJW?=
 =?utf-8?B?enM2TmREcXIvQzhDVFE1aHJLS0l6Q0I4MHZVWmZWaE9hck9odEN2NGxWN2Nl?=
 =?utf-8?B?empsY1ZzVEdnWHhrUW80MEtYay9La2dEYTlhMjhPVGtHL1BvZ3hPZnhTWnlk?=
 =?utf-8?B?RVJUaWhwcXJWNWFaenhxc2gvb0dZWm5ETmFiRlpIQnJiMWVaZ0g3NllkTXlV?=
 =?utf-8?B?R3ZmR21paUZlOEUxcUhpdjdqUlgySWtLU3U5RGd4WkoybnNmRWE4bzUycmJS?=
 =?utf-8?B?YUttTkR0MGxDOGRnS0x2QWVHRTRJTXBGMkp2YTVUWGw5RnJjTWxXb0ZUZEx6?=
 =?utf-8?B?UjN2WXpNbGxGbDVxNnBnSE55RDFlWllSY1p4SDJDRXdhYi8wWUh1dzVxRVVR?=
 =?utf-8?B?Mmd5cW12TGNETHNXVGV5VVZDSzUreUMraFc1UnFQTVZJcUczNGFRdm5QdTJQ?=
 =?utf-8?B?VTR5R2FoUDBzalN2VENKeGxsMXp3MDZXbUIwdUlpdnR0c20zMGxtRnA0NE8v?=
 =?utf-8?B?OWpEa2JxdmpSeXUwU2VUdEtHMC9BM0VQRitNNmFacVBIcmUrV05PVU1DVmJ2?=
 =?utf-8?B?UFR3bzM4bUt1Wm5tclRBa3JaQXJaNEp3MW41ODNjZ3gvS1ZMUHVHSG5OTTUy?=
 =?utf-8?B?Nzg0STc3ZjZaTWVxRlQzM2N0VitpRFUxQzVISmdpdWdnWE44Smduby9weldI?=
 =?utf-8?B?eE1lc1h0WVVtVGRuQnFjUmphVUh5bmRsaDRsUkxlSVpDM3BFWm5EVFMvc2lZ?=
 =?utf-8?B?YmdyOS85b2xWUHU1T2xneSs2Q0dZTk1QS1dOdXZzVW53dHNZY2ZRZXRiVHRB?=
 =?utf-8?B?eDlLMEFKNGhUd0VHQklNUWE1NTlBVnlINWZadXliQ0o0cjFuNnM2RW9sSnVJ?=
 =?utf-8?B?OGVsdWY1SCsyS2xVdG9pSW9YcGpRMG9hNzBqOGpwNVByRGY5TGgwbmdEN0Jr?=
 =?utf-8?B?SWNCSDFudzlXSk82T1JMNUV1dkVoblJnc0NyTnp0NkZKTDBZWWRNcFlFY1p3?=
 =?utf-8?B?TlNPQXVjTUN1WTZBLzVLZTRBLzI2UnlBVFk5K041L1h1eDlIajFERkdRTklJ?=
 =?utf-8?B?NThHNVRaaGlJUlBmMWJyVG1qSTZFcWZNWjhCUDZjYUl0SS9RKyt4TFVsNjVL?=
 =?utf-8?B?ZG5UQzBRZWIxNmZDUG43YWJQRXR3dFRCZTlhbGZlWEFoQ0doa3pOaWwxSTNh?=
 =?utf-8?B?WHVXVC9NcHg1dXBDeW5CRmYzemZJVjFJUjFXc0tTWC9YOWo5clRoODRkTXIv?=
 =?utf-8?Q?dH++qqpJz2XOIr51DM9ItZ6agXnr3o=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bVRkRmkxd3dMZGFNLzlJQ0NSdjJJT3RTSFhSc3h4Ym51Q1hsOWtPOStJUzd2?=
 =?utf-8?B?TC94S0llMzdNS2xTNDdFQnFNay9STFJQK1ZmM29jK0N6ZWxXVjFyT0ZoRVEz?=
 =?utf-8?B?RkJJdFZMUGhwMVVQWS81QW0yK3lSai9QNHpMbmdLdHdlL0pyTzFuSXRsR2Vq?=
 =?utf-8?B?REhhV0EzelNvcjVnTmVLamFOV3J2REt1dUp2elhuN1B4UnJuVkUzMzBIK0Y4?=
 =?utf-8?B?cHhHd2MyQ3prMmtNN3VYV2JTZFlNR0pwbExMT0dvTXRKbURQQUxLVlFTT09B?=
 =?utf-8?B?VHZ1eEZhS2NScUh6Q0dnVDliL3RzR0Q5dGVGU3hka3I2NXNhekliVEpiOG1W?=
 =?utf-8?B?WWY3MnBDOWRBQ080RG5GcUtqVFRkc1ZVaXpjOFlUTTBsZ0pWZDZtcDFRNTk1?=
 =?utf-8?B?ZzM2QTFPb3JtY3E3RDkyQW8zUWQ2S1RIWWY4NC9Lamo3ZkRVQTVTSWJSejdw?=
 =?utf-8?B?U1NvNkdwWkdyNnNLczlrNG5ZM3BUQkNNa29MOXNUeklGTDg4czdnTUJ4VGR4?=
 =?utf-8?B?UmtidUYwZUZQTDVUV0JLTGZxU1FDRG14WVRIUjBGakZCdjFXWTB2TU94V3Iv?=
 =?utf-8?B?YW1BVVlhWVkyay9vVnBmdVBvZ3pmdzgwZ0hKWTBxRDRlNTM3cnZlMHhzVndG?=
 =?utf-8?B?YjJzV09KbUIrd2pBSlV5b0t0UDVVK2NXazJENVMvYzhBcVVRdmp2eGFFRjF4?=
 =?utf-8?B?R0NQTXUxWDFnaGVUYVdjdjVNUHMvV2ZvOTFVSjd5ZUpJNlBhelVyWmpFeUph?=
 =?utf-8?B?RERERGMrWkl2UGthdmV5S0Y4Rko2ZmE3MjhYUS9UWGcwbFpXdHRrRENGRTBB?=
 =?utf-8?B?SWxlVGZaN1pJVDAyT1ZzekpWODhPUmdFanduNUdWN3B4ZUV4SVNvSlF1T05B?=
 =?utf-8?B?SG5ndlhMY0kvQ0Iydk1ZdXF1RDhXUUlNeHFyTmNGSkVQajgxWUNpVFgydGl0?=
 =?utf-8?B?eWJYdisxZTBPeTJKQXcxd0tNRWRGYXZySVptMzM1ZHdMN25MYmY4Ui9JU3pi?=
 =?utf-8?B?dGRrZWx2VnNKK0ptMndpUzE3bDZ3bmxhTDFYVDJObXZscE9xT0FYa3hoc3cx?=
 =?utf-8?B?V0lXYjI3ajhCRmRZZUcvQ20zTUs2QmRPOXBCMGE0QWVGZ0QwY0hGNDJRay9K?=
 =?utf-8?B?MW1ncFF1ZUp3UmxHa0J0OVNsYWZLNXBqQlpyV2hPMFBNZFhhbFJsbVhDTHU3?=
 =?utf-8?B?MG9JVUtHRlJKU1BWelV5WjdkUzkxNXFtRFNNVGFWVHlxb1diODZMaWJsMkgv?=
 =?utf-8?B?OCtFUDFMd0VVcjBZSmdYejJ3QzVBYVdRcisxUFNFZENMK2JyWHlFUWw4dlY3?=
 =?utf-8?B?ZGJXS1oxRHVvNm53QTM1QzFwUE5rZkp1a3NtYUJUZFpXU3V0VWRuVVoveEk1?=
 =?utf-8?B?dU1Qa05hMVR3cFBoRm0yckp5NmZvakVFdkpPamJkamwwTjVBTXVjL3VEVERS?=
 =?utf-8?B?YUtScVpDSDh3TXRmdExkOVhSRzZLVnNETjIvQ1FYR0ZEUG1XRngvdWxTUkc2?=
 =?utf-8?B?dDIxWldySStJZjVWL0QzeFF0eXhLSmc1R0JCKytaclRHbm1Rd1Qwem9IWlla?=
 =?utf-8?B?ODdRdnJxdlBHNDB5eTVOckcvVzM3aFdOWUI2VCs1NUZHMVkrVWV1TEZGWVRY?=
 =?utf-8?B?alh2a3NIZ1d4V3dva2JOZXordkVvQVZEZ3VNajVXc2k0cC9TeDJaVk11TE5l?=
 =?utf-8?B?bnZOQVFwMkw1SXBuMjdSckkvL1VmdVpmYmxuV25ZZzg5RmozYTVIbUZ0djYy?=
 =?utf-8?B?MGJSRGFFSTVZNjUwUDFNZDFObUxSZy9zcWdralBodlYxbWFOZ0JtdDNUOHcr?=
 =?utf-8?B?Zi9ZbjdpRWVUQWRrdW43R2dBeTdzbW5ES3A3YmxiblJsd2F5N2ZSLy9CYnhU?=
 =?utf-8?B?VE45Mm1odTZDUkYycTlCRTRGRmovRUNESUdOeEtzalJIK1NGYklhSkVQUjZQ?=
 =?utf-8?B?TmovSmRkNkJHMVpxdmdQL01MV2JzS3Zsam9ORW1IR2xKdFZBMWdzdjl3VzVS?=
 =?utf-8?B?cUNlNkZBaE5qSjcxdWYrVjNoaDB2blVrNENDWmp1RS9RVnlQQ2t1Qkx4Ritp?=
 =?utf-8?B?L3psa0h1ZkI4L2lNWTZKUXluRE9SYVdVWXpQUHl1OW5NN2xlZEYyeitaM2t5?=
 =?utf-8?Q?TVn3kGyfxrYOWG8G3bXcHR0mI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30684a00-6821-406f-fee3-08dde6031f4f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:18:44.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqDzNekA4ngpSFn5ptwK/XFwGh9tIDstuGv3KRQzq9wSUeQVub+LExLgqFNt54MHuX+QWJwsFqMo7/+K+JSG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6785

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++++-------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..2bf11984690af2e687a3217e465697333d9d995d 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -71,21 +71,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -111,7 +96,8 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -384,24 +370,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return NULL;
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -456,7 +434,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(find_esc_clk(state));
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -783,7 +761,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -801,7 +779,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1027,9 +1005,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 

-- 
2.34.1


