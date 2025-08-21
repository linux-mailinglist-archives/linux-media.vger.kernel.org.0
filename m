Return-Path: <linux-media+bounces-40663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8917B305BA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBFE4AE4EA4
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0ED35206C;
	Thu, 21 Aug 2025 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pgq8DSce"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302D834F481;
	Thu, 21 Aug 2025 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807411; cv=fail; b=KkgZUUUUvG2236igXva535U4nidAm7TYhFRDe+TLNLeaJ3rhj+b3JyR5AuDT2JkOzMvMnH9bM3mkYtB5ijGrEx0Ci58E40f/RArPWmmqf7dJxZaP8Rl8gFSnfxJiXlcDpfX+bMxvJycc4RN+VPkTdCktgayt9SKC5KkHZRBuqWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807411; c=relaxed/simple;
	bh=ZPa6mjkgxqtQVjDUUTFy5knCNwpffsk/7qHAD9es29U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gVAlAc4F+839fXs6GmVhqv5kHYJWPt0vEyt3nFvcS1iBFL499D0edRYeMdeocf3msx7ztLmxq/OTK75Slp0onbhBmL3OWyjilv4k8FJZXR9fJaSMPBqeaJ+4nX92qHHswdKZW/js8B5z++DO5MDKcrl+m0tzYWlHeRFwfxMi0U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pgq8DSce; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDuEvElnpnR/6zuuG9+JfzicUxOdpl6BvGgv1AEDUVfdgpj311DR21wCAXYjTantmVfuElkRI3QxpmE1eqrSnE7/zYQmZHE+9CXxeoHurlR6Ls0P/07RiS7RZwQPXYQmtxg2jnKA6xxprH1lvK/y9A8e1bO6ncoGMTez0oPEGGlTYtiW9etD/vbSpZ4c75dU4kQfNPe8N7lnKJTpNEfUZhtE4GDFGzHyBpF8pgWvbQ0Mg/Sq75uUcEUJrhuM9CCcSbdXSfll+9cRtGGtN13d6swtNlWE325jdPYYA1IzbJXg9SsLLH5DMcNt6nRljgk1ZA6tgonvVlN99XUI1qsKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRqelGO03ujk0kGPxK0ruEl8D+gjJr44LC7/09+yWy4=;
 b=pzIfX+CJLbMstFnpNP4uQgtQ7mwPOxu3bTUHSM07Xg80YmVImQZMg8XfVKmB7Bsw0hoPYLpDkOgS/75MmzIR9S/IYBbIxcoFj0Y0IxkeaN9NoSXcE5gbr8X+WhBm8fGkaCcoZR8bFmOUVzP/W04nYAIjdFhm6XtL/BTZHLEzta8YxJG9ARURQW2zh2TbhqTKF5yXk/7DEYDYweXVkuvFxKJqMyTo3eLZlypl+vKh2QTsljnQS1oLrcxImsaB3Nja34XrGB5EDaWkqsPpJJt5wQYa63VGxGDIpH3gk9AN6Z/dL9m3Q6BB1lS5eLnjhbzNDhLTmTjIzGvn21vV7suxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRqelGO03ujk0kGPxK0ruEl8D+gjJr44LC7/09+yWy4=;
 b=Pgq8DSceuC9tQkeJUaupmDkm7MjVX3DWea/SpnVW6ctbCwxma5+ZTr6sDYDob4QLudoGrHLJwldMv8UaJA1IsSWwxWws2eSGedLvBBzHn7B3BcFJQf9l6f7CRQEcW+60be8ZXYvSHMqo4f9YS+xOuJgnaNJzHo+6RIz8oifsHRks/8mMuaMIO2hBJatBcoi1yNJNl5LDlu4iHuWfYlkL0R5hWuBTgRtdBTSLq6OcuRhgVIHcJCcNoYe77W2xv7wohfAIo3d4VReQzd4Jj4JcGNp3mwVhYT6D9sl1IQOJmsmidd1adIGrDp+SbC/HIdLWrHdkTvE+M4reLukC4BS5Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:46 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:41 -0400
Subject: [PATCH v3 06/31] media: staging: media: imx6-mipi-csi2: use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-6-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=4005;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZPa6mjkgxqtQVjDUUTFy5knCNwpffsk/7qHAD9es29U=;
 b=wj5R80/E7hitRcqphfBamLhnesJBJ8YAX8wN/WpKVWs0EFERsbeMiW5TQKFLHOJfi2IVrkttM
 Q4B3xzKsDFIB1MGVgb2y8gilbn2Oris3QH00eO3eNdhzBn4m0X+3pN7
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
X-MS-Office365-Filtering-Correlation-Id: be780b85-795c-4e8d-09eb-08dde0efa70c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bEU4MC9TTEVLSWVkS1cvbWNYMjVlNmh5dUxNNHBuWUp6a1lPZ2dRWnB3cmxm?=
 =?utf-8?B?bDhwbEZJVzVlZHZsWDl4bXRCOUlibzZESk00elp2bGZLVmhScWt6N3hmYmcx?=
 =?utf-8?B?S3VaQ0hEU3ZPcWNBMnpRSmhGYlphZjVBSmVnTUVxUU5SbWsweGNaVEQ0OFdm?=
 =?utf-8?B?UFg2L2o0Y29jOFhoQkltT0xiaGJLR1BJWDZrNGRHbHl1QkpkeGptZCtJejU0?=
 =?utf-8?B?NW8zR1UxM2FwRWVORmZmOEF2R1I2WlBHWVp3NjViMVFBSUVCS0RYdzVZK1hQ?=
 =?utf-8?B?VEl5dmh0aTBSL3MzengxRHphV25WOFpSc0VsZkFGSHB1TnJ1blJzU1JIdUJy?=
 =?utf-8?B?OFd5d0tMT2lCNnowQTFlSSs3eVc0WjY1Ukt5dE1OeVFaaThpOVU3U0lHWTB0?=
 =?utf-8?B?L2lLK25NcWtLcmxwc29wT2R6MUlDaXUzR0xVaFFKSm41c1oxRFRZbU5ibUUy?=
 =?utf-8?B?QjMxdDR3M2x3enF5ZEhJcTloMndrNnNqYjRoTTEyWVZiK2JrZTR3WmhTRU53?=
 =?utf-8?B?UW1nZ1Z1UkJsNFN3dGUxRjFrbjhXRUhyZHE1ZU5ZUHdHZWlKM0FQRnlFTDVX?=
 =?utf-8?B?VTNxR2s5ZXFmdU5wNFRNRXo3eExNY3hDNGpOaVNrSExMb2xsRktJSWUrY040?=
 =?utf-8?B?M1lmQkQrK2gxd0lOL2s0NVZvU05aaWEyNzVRTG5XR0MwQkR3bDNWSDBxTEg4?=
 =?utf-8?B?aEZoQzdJT3JsRTVBZUdVV3kyRHFqYzNsN2lka1hrNWN5K3hLbzFHa3lBYmE2?=
 =?utf-8?B?a1FVbGJlSjBZcDZldHNtQ05ZaGp5WW10UXVXek1Xbm9RR3pVK056L0x4Q1RN?=
 =?utf-8?B?SHo2R0IwQmI1WUoxRkxORHQ3N2FLMU5vZFFyTEMxYjlieTVqcVl1NFc2T2hJ?=
 =?utf-8?B?WHRaUmtEejMyQi9oemdsU1A4eXl2WmxOSi81Q2lwYStIb1dJcTdyNUh3bXlm?=
 =?utf-8?B?aTlMWm5ZckRTWjBBVTFxd3lvekpMTzBYa3ljNTBXOXROa0V4b0h3b3dXTllX?=
 =?utf-8?B?ZXQwTVhYYkxhYzlVTE1MeDk1YXhNODlGdXRWUmpuN3VBMGV6YTZuOEVUNFZ4?=
 =?utf-8?B?MTdEQzhhTVByTUIzbHk4SWRac1Z2UUkwMUlsd2xuRkpGbThEaDNlYytoQ3R6?=
 =?utf-8?B?N0hxc1A5TFZCcHg0UEhLZW9iSmw1MS9aN0s4a2puUTJjdUtCMHRQclh5ZW1q?=
 =?utf-8?B?aHdDZDRNVnpjZnh3dk1xSkxGU2hhMW1yeGViZkM4WjU3K09JM1NJWEd6Z3J3?=
 =?utf-8?B?TFdZVlhQZTlIbWdOTFdmdTZXaTZzWncrQndIZ1hrZkdEazdOeUN2RFdReU9W?=
 =?utf-8?B?L2dmNjVaVDhsNE1tMDJUWm9ZTVo4ajZPU0JhRUVFOEVxMU85VkRrUGVtdklF?=
 =?utf-8?B?UnBhR3BNVGR0WHczdmxIeXVLS1V1Y3A0dnZRQm45SHZWN0JIWFkxSmQ1QnFB?=
 =?utf-8?B?aWVpajJ4anNTSWFDOXVCMDR3Z1QweTBsNWJGVU54OUl5Q244eGtiZXRnZ1hl?=
 =?utf-8?B?bjhPdmFiN2FoQ2dDYmx6THNINFlXQ3IwWndJSFROb3JvZGV1R1FoL1hQb2Yr?=
 =?utf-8?B?RzRPMWh0OEw1SHlwcE5uQUhoSUE1RTdkbk9VVVRQc2xTMkJzendBcjFHZW9m?=
 =?utf-8?B?ZC9ROWJaaklKUmxSZXo1bmIvYUp4b2xNZE5hSS9OM2pHa2xua1VNeGcrRHRF?=
 =?utf-8?B?c3BBWnpkejBoL0E4d1NxaVUxZy9uNGJGOGpXQ25aR2JQdHJ5Qmw0ZVhmOVJY?=
 =?utf-8?B?dzJiSmlIbHpqcStVa1RvNi9hWlI5WFVqUFdybUUrWXNCYjhHc2FBTWtnZFdP?=
 =?utf-8?B?ckJHUFVUZHZ0VWNWV1Y3eTl0Ulh2WFNKNHo4MjFLZVhWRThDcXM3b1lESk5X?=
 =?utf-8?B?TTh4enZKTGRoQitUakJXUHk2aUtDMnRnbUV6S2loUjVUZUxnYWw2ZGljblU4?=
 =?utf-8?B?VE5KVUZwcG0wTjVYQ1BjRWx3NmtHZk16bVd5L083UTFjR3NoSVMwQlQ0bEFN?=
 =?utf-8?Q?DttaIIDrroFJI/X6jxURSyJ7CNJzeI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a3hoUzIvVzIreVRNT0tySTZKY2pIZTcvNmNLTGpMRmhJMS80OHROZnk0QVRu?=
 =?utf-8?B?bnRjM29lTkpRTVg2OFNQbE0vREQvYWNRZGJuT3VEQ2xVeU1mdzdTZjFEYW84?=
 =?utf-8?B?RTI5WVI5K0lqa1ZZK2p5cE1XcHB1UXR2V2E4amxwdHlVbjA0M3dQOHpEMkpj?=
 =?utf-8?B?Q0ZsQmlLVnlQTmx6eWlrZ24vaGdWM1FTZEkwTUZoUVdCMXVaWEZzbGh6YlZu?=
 =?utf-8?B?UTRQWkJKWmZ4ODBOdUJYYnQ2aW81cnoyMlpqTmw4Z0pDbXZQNXJFaHhpVkVV?=
 =?utf-8?B?b0NoTXFJeGpIUjk3Sjd0YnNDcXVFT2p4OTNHS0Q0OVQwOVVuVWRVUU1raXp6?=
 =?utf-8?B?NlE1czh2NjVZRlNHRERGWVJKMk1KcHdueklDNENoQzZvUVFXYlFYTURtVVRt?=
 =?utf-8?B?bUprSTFNMklRQmZLRGdmN2RRWGMyNnJ3RjErU1V3amNKOXAxeWkzY2IyR21V?=
 =?utf-8?B?bk50QkpBN1lxSVVmM2RDbzA0bzYzZUpoWE1MZkhSVnIwVFAySnRVeU02M0NI?=
 =?utf-8?B?T2pRb3ZiSVpiUnl3Tmc0dDdlV0tZOGR2ZVhmY3QvcStUekozYlc2bUZ5aUFM?=
 =?utf-8?B?TXllbzVLem80YllWbW9UV1ovTEVTSGlOWFk2ZHF1ZTF3OXBYbHNtbHNhdUtD?=
 =?utf-8?B?NFREeWZNZHlDcHZ2M1IwTmxCeE0zdEpid2x3ZWIzZDVqbDE3bUY3UEt5SCsw?=
 =?utf-8?B?cnlyaE10bEIxRm9HVHBpR1lweWtIOVZaZVViRllTTFlNZHVqQThvZ05xcGZ5?=
 =?utf-8?B?QnNQMVUxM0g2MVF2TXRONGgvM1BMcFRsckhXb09iM1hPTjRmT0w5c294Y1F5?=
 =?utf-8?B?WmttVHFaVXZxejgzSll4akczMFA5TFZTTFVSZDBmWFpmbjNJOFIxNFdMRGJ4?=
 =?utf-8?B?ZXRhMGlIamFaK0pUSTFlbHpoNGNlQ3hGSlBZQzdJblROQktxNzR0WHRxeW9G?=
 =?utf-8?B?RFpGd0o1TGxZZitoTXRVaGFNT0ZEOE55UXRhcDc1N0Uxd3FGd01LY2E3bUo2?=
 =?utf-8?B?ZjFPNEJ1RzY2bU45UGNUQzdtdmlZUlRqNTVWV2Z4ajE5Zk9USFAvZ0hmWGV3?=
 =?utf-8?B?SUZaTmIvTDJTb2tLbnBEdFZUWVE3U2JuU1hYOVlaOVYxeVlmNzBVa2xoS3BY?=
 =?utf-8?B?bUwyKzJPZjJ2VXRPaUpwR25SZy9vb092Y3kzTnlnT3RHR2pZL0JOeWRWQTBC?=
 =?utf-8?B?aU1PTjFRYXNvZzZRVnBTaVFwVERuNWhwdjRaY2VNSFFIM09qTExKNVVUamZa?=
 =?utf-8?B?aFNQRWtqSTlwMTJZYTR3dVdHVVhxTndOc0QySElNR3hwbjJsSHk4WVc0MTUx?=
 =?utf-8?B?SmFWdTB0bS80TXhVUzBDZUpBL0pFRlBONXR6MW5QQkdXY3A0OXg0V2Fzb2xH?=
 =?utf-8?B?WTRpRHJyREtaazdqNEpoMXVENitQa0NWMlp3OUcrUldEYVNMemdqY09KNmhJ?=
 =?utf-8?B?eXBlczI3Zk91aTBYcTEwQUhQdzQ5cW1YaWlSL0drTlF4ZXdRVVFvSGxZUW5D?=
 =?utf-8?B?Q0FJbHFTMHIxZm51c1IrUURSa3JESGJBQW54amxDakRPY0xjcEp6YXZVOUZy?=
 =?utf-8?B?STVpR3pycEhtTnpOcm9ORHZmd0ROTTEvaXBZejNvUFlGcmVOMlUvZWlPQkts?=
 =?utf-8?B?L0tWbVBleDZJTU5wSkI3Q2ZpZ2xrWU1maThPbDR2L25FYVN3TS9RaWYxYUhu?=
 =?utf-8?B?dWRENFlGMUlFcnFmUGpVTHpmNDN2aVhzeEpmMXh5ajJqNFU1RjA1L24vdlBR?=
 =?utf-8?B?OWU2Z1dRaHgwd3hIV1ByMUFUWG1mT1JnY2I2M0xhMituWUpVRUVVYXlmTHUz?=
 =?utf-8?B?M3J1NjVjdmNmb25YZDNyRlFKUkxPY256U0d1clo3MWN4MGNCRVlYYnJjRElG?=
 =?utf-8?B?VnRraTdUeElNTmF4WVR0bzhvQ3phay9rVDc1T2NVU1hlSUtoMXBtNWNTRVdv?=
 =?utf-8?B?eG5HYVNiZCs2R1lyREZ2ZElzSTJDY0xRQlZYUDJBY1QvWXRBY3ZjV0Jjc2dK?=
 =?utf-8?B?QUpud1ZBZENxTG8yM2RRNFdYU1A4MVNod05DZW42b3NiZkR3UzcvT2VxWEgz?=
 =?utf-8?B?bFVxdjBNZnVOL0p1YU84WE9XRlh5ZndiTFhCbmdsUk0zT2xxQ2hiRWpNV1hE?=
 =?utf-8?Q?V/Gg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be780b85-795c-4e8d-09eb-08dde0efa70c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:46.3518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6bS8YX0uvvNvwzwsTikfFDYjr2x5GJkdWLVJj0wy768y/qNVtRelT239M+wyLyHAlqjHKf9f0QK4HZViMHbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Use devm_clk_bulk_get_all_enabled() helper to simplify clock handling.

Defer all clock prepare and enable to csi2_start(), which previous only
enable pix clock here.

We can safely do that because there are not register access before
csi2_start().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 52 ++++++------------------------
 1 file changed, 9 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index eba9a650030f5e380aa900b94728ad375171c6a5..32ddcef7ec8535a44e121754bb621c0d2e226369 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -39,11 +39,11 @@ struct csi2_dev {
 	struct v4l2_subdev		sd;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pad[CSI2_NUM_PADS];
-	struct clk			*dphy_clk;
-	struct clk			*pllref_clk;
-	struct clk			*pix_clk; /* what is this? */
 	void __iomem			*base;
 
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+
 	struct v4l2_subdev		*remote;
 	unsigned int			remote_pad;
 	unsigned short			data_lanes;
@@ -343,7 +343,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	unsigned int lanes;
 	int ret;
 
-	ret = clk_prepare_enable(csi2->pix_clk);
+	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
 	if (ret)
 		return ret;
 
@@ -390,7 +390,7 @@ static int csi2_start(struct csi2_dev *csi2)
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
-	clk_disable_unprepare(csi2->pix_clk);
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
 	return ret;
 }
 
@@ -401,7 +401,7 @@ static void csi2_stop(struct csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 
 	csi2_enable(csi2, false);
-	clk_disable_unprepare(csi2->pix_clk);
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
 }
 
 /*
@@ -761,24 +761,6 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	csi2->pllref_clk = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(csi2->pllref_clk)) {
-		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
-		return PTR_ERR(csi2->pllref_clk);
-	}
-
-	csi2->dphy_clk = devm_clk_get(&pdev->dev, "dphy");
-	if (IS_ERR(csi2->dphy_clk)) {
-		v4l2_err(&csi2->sd, "failed to get dphy clock\n");
-		return PTR_ERR(csi2->dphy_clk);
-	}
-
-	csi2->pix_clk = devm_clk_get(&pdev->dev, "pix");
-	if (IS_ERR(csi2->pix_clk)) {
-		v4l2_err(&csi2->sd, "failed to get pixel clock\n");
-		return PTR_ERR(csi2->pix_clk);
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		v4l2_err(&csi2->sd, "failed to get platform resources\n");
@@ -791,19 +773,9 @@ static int csi2_probe(struct platform_device *pdev)
 
 	mutex_init(&csi2->lock);
 
-	ret = clk_prepare_enable(csi2->pllref_clk);
-	if (ret) {
-		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
-		goto rmmutex;
-	}
-
-	ret = clk_prepare_enable(csi2->dphy_clk);
-	if (ret) {
-		v4l2_err(&csi2->sd, "failed to enable dphy_clk\n");
-		goto pllref_off;
-	}
-
-	platform_set_drvdata(pdev, &csi2->sd);
+	csi2->num_clks = devm_clk_bulk_get_all(&pdev->dev, &csi2->clks);
+	if (csi2->num_clks < 0)
+		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
 	ret = csi2_async_register(csi2);
 	if (ret)
@@ -812,10 +784,6 @@ static int csi2_probe(struct platform_device *pdev)
 	return 0;
 
 clean_notifier:
-	clk_disable_unprepare(csi2->dphy_clk);
-pllref_off:
-	clk_disable_unprepare(csi2->pllref_clk);
-rmmutex:
 	mutex_destroy(&csi2->lock);
 	return ret;
 }
@@ -826,8 +794,6 @@ static void csi2_remove(struct platform_device *pdev)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_async_unregister_subdev(sd);
-	clk_disable_unprepare(csi2->dphy_clk);
-	clk_disable_unprepare(csi2->pllref_clk);
 	mutex_destroy(&csi2->lock);
 	media_entity_cleanup(&sd->entity);
 }

-- 
2.34.1


