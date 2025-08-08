Return-Path: <linux-media+bounces-39152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13996B1F0B8
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D9987A7B59
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BF628B3F1;
	Fri,  8 Aug 2025 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c9LyAkYv"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013027.outbound.protection.outlook.com [52.101.83.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62328A73B;
	Fri,  8 Aug 2025 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692806; cv=fail; b=jPxM121/zHiMkxYD8Lgs2tBlR0vDwgxU7GmUY0JE71bfjcajZkSMRL66Nkvm7cQIsrnT/ypT2U+yD+stXXQoKMaUENBxSeLPbs4ShEglen4eoHAuJtQK9cldG3nlZfy9lqXvwTmv731JZSoiGjwn1DTuaPutlDSK8+4fepGtkuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692806; c=relaxed/simple;
	bh=QCFfRh2TuVE6D2GZcOWQb9Z99Q24DQoTUpFcwuYayvI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Cb2DtAU+MslMkRbicgp5oBxmtdo/zlijsBSU7oNe7+hmm8rmH1eYGHCFSBmVQBk2zaNbtvIHVT5vg3pTjr5j7l78OdK2gGZZ+Zdj8nei0qm0ph1N49wnK9TA4u9Lg3D0C3msCSKDGPOZ7ival5PKGgCvgNiYf3kXg93NzVlVNHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c9LyAkYv; arc=fail smtp.client-ip=52.101.83.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkCxsshZGRhM5xeDItSMMqU8vvN81/38/Rb+kgs39uuDUBld2cU9XYkO2Ks4EUC0xAChSpn5cwAvpwXKNPiLeQs4gWukjAkput3dfTIBG/DJFljqmHLFI0BsiJevaGJ5h1YpJlO0S3TN8XP56ISd/tCwdSbPsr6/pELkGeYixrA3yNBp6lLZPPAdfVB61L+mLVnWsalAwDboZCb/92detKeKxvRw7LcENEGFDDvf+yqFABllYRJBMbGmECjAlBQLlgGlmCjJLCXCDbngBWl09LbnC8+5rLYIlCj9n4Qr5qCz6NLE+RMmwEagyZOWKulzp6Ls5rkWRzfjNRS/X6QA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ze8SLnbKV0VX5oprvp+8qsrPWEfxssuhVYrPqjycQIA=;
 b=dOtPNn2zCfDcCwBDVEmh2lEQDJK9gjwXBe6WYeZDupwfRCtgpgjuUmTb1nABj5S28QaX23DcYhiGWfpC42+2OMlPeaHcDs988MLsfrSGgAEZtWL8vm60kDGFA9YUzAtDGVhy6n6S3sUcfy2mNJzU8SwM0qD0Ph7VVAb/NDl/fIH/rR9mR8JqIRsXp9sU+K4d9323UpP8MEFYCl73Z890pj+lwVWvi0dq4reSSpuXtOAtarJDyCfudxeWKsBYYbUfvw9NmJ1qyUOoUFkf9uYBSF5vglQbEpcDjpqGmDsAx8/CW+O/qgXYrhNLdzl/gA4lZBwWFGEEerJaQk6c+QaePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ze8SLnbKV0VX5oprvp+8qsrPWEfxssuhVYrPqjycQIA=;
 b=c9LyAkYvtXI8v3PIpTj6KnMDI8y8RDI7RXC4sJMgTAgnDgdxF/hBHYh7wwMMsiMJlIva3K8D/deoy1W/Lc6jPIRdhFDCTQMUsYJ6moLWvbu8q9DUYu5dNn8E2hJ3w0GT/I6ifMEjBeQ/awgDQSG0SYVVtXZoqh1u8EfDvud2HnsTCygjp9G8rsVJ4teoN7ydYztWpJ/1DeHmlEc8R62GjuZOy7a/regrSTDoeDCmuA2hPraSGw/2IXBecAp2IRy/4d6+OZOvAVWeKuWT2afL0hALbVTehKUKFqGVVoGHeJNl1EVx1dG9OkQ0QJxTJIWK/iSlCIpwTRYzp7baFn0V1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:39:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:39:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 00/32] media: add imx93 mipi/controller csi support
Date: Fri, 08 Aug 2025 18:39:03 -0400
Message-Id: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIh8lmgC/zXMQQ6DIBCF4auYWZdmoCLVVe/RmAYQ6ywEA42xM
 dy91KbL/+Xl2yG5SC5BV+0Q3UqJgi8hThXYSfunYzSUBoFCYoMNa+XD6pkZVVtsaz3w0UA5L9G
 NtB3QvS89UXqF+D7clX/XH6GQ/4mVM2RWciWMNperMje/LWcbZuhzzh9H70EimgAAAA==
X-Change-ID: 20250606-95_cam-b74c094ad1fb
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
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, 
 Luis Oliveira <lolivei@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=5030;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=QCFfRh2TuVE6D2GZcOWQb9Z99Q24DQoTUpFcwuYayvI=;
 b=yUj0KPA5iX99n7NQ+R0ueIqRNd24SRX8CJZqbwEcLPzNfzMILbV/9c2HiT9eCvfztNHKIm1QS
 yWgXyGhpcY1CZGrtMRvHlWUwZ/Kl87ijxy36RrggnahAzC9HXDGCAZp
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fc3299-001f-47b0-15f9-08ddd6cc80e1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VURxQ3IyVTdIRnF5TzY3bTlOYm91RktWK2dGVExRYU9PU2lOTGZsdlNsVnZq?=
 =?utf-8?B?cWpTRzFraVRsOVYwSXpoOHgweGswQ3ZwdnJ6UnlVWHd4aXZLLzhRV0FWUmh3?=
 =?utf-8?B?enZRTkZXL0JhRmxlYXNHaWpuQUg2eVl0L2JQRzQyZi8zd1lneVA4a3hJV2FJ?=
 =?utf-8?B?YWlobS9DNzk1MlNKeGFwS2xFa3gxNEhOdGM0VjJhckRrdTFJSU5ndmtQaldr?=
 =?utf-8?B?MU91Sk1rblhERi9LZ09sK2xoNVZ3Wm9tQklQVDIzYWF5ZFZOdkNYc085WXZm?=
 =?utf-8?B?dlVJbmFydEFYdmk5Q0RmVlNhOEZPY2RMUEZqK1JuaXhBcHQzcGF6WERoOXl5?=
 =?utf-8?B?THl6NWtWdDIreHdWaFFFV1VqdmZpLzlVa1VRVWpYN1pYVS93RTZGczJWbkZp?=
 =?utf-8?B?NEtZcXRrZDNYRzVuOUx5d0dnTVF0TVh4d3ZQZWFqSzN1OGRmbWVxK3hxdVVZ?=
 =?utf-8?B?d1hxZFd6SXEwdnRxb0tJQlFkMzJ0THRSMVVicTVaaWRrSjlXRTR4T1cwSHVi?=
 =?utf-8?B?WnoyNWFSbGZOMWk0cDRNSUZuSEJod21BWEh0NDg4U3BsRldDaUhKRFhBUVhG?=
 =?utf-8?B?V01sMWJjbEp4eGRVV1Z5cnBJbkdkSVh2ZFdnRjRON0NWZ29PZDRYVXJCdWJl?=
 =?utf-8?B?ZklITTAzQTV1ZDBjRW9mRTFVdlF2cGNpWVRvbU41WnUvREQvZXRXTEV3MEt1?=
 =?utf-8?B?WGRRU00xSUZ3MlB0L1dTYmVjWG5xMEdhVlJhekhhUmljOXcvU2NYa01WVkNh?=
 =?utf-8?B?OUlLeU4xVGRESU5kZWxZczJ0U1ZrY3hPSUN2SEFETzJjNFFhVkZGZW9TSEhT?=
 =?utf-8?B?dkZUSTVndW1XbGNOZFNRSWVsa0RhMlFxaDJtaUxoRVdXTHNVSlh2QndmM05H?=
 =?utf-8?B?M2htRXcyck1USFJ5V1Nac0drcERPbU9QQVJCcmRtTWlQY3gxdytlTnFjQXND?=
 =?utf-8?B?K2U0S2VvbDgyUlRVMExvaTJlbTF4UVJxVVdVSnVEdFNyYjNwSkZsVEZNNk4r?=
 =?utf-8?B?NUpFUHpZTnphakkwSC9oSkVvY29VNUwxYzNKV3loL2VNeHg0dXU4T2wxcW1x?=
 =?utf-8?B?VC85cjBUb3BhRFhXcVNPVU5LZFZlR2Nqcmlia0xQaXYzTVdITzhKL1BpejJ1?=
 =?utf-8?B?R2VGcllBYzBzaGw5VzM1NnRZQ3pVYXlnZGJjWVgzbU1mQm4zZGl1MHFwRERG?=
 =?utf-8?B?UzBiaGJYTEd3dlQ1ME10bE1xZmZnYzBiQ2VBRmMweVduS2J5U3NRd0E4dnJh?=
 =?utf-8?B?eFhEZFMrRFJ0dFh2UDRDNWJBVHY4cURIL2tLQ2pteG1GWVRMc3psUlpNcDJa?=
 =?utf-8?B?aCtwcEIvcVNEQXZTMzRwVjFTeTgwdFhuR3ZSNlUvR2NXZWJBbkl3NjVQU2ZV?=
 =?utf-8?B?QmF0anFEQzIzTTJRRndVd0hueStjc1BTYUx2Y2xuZkZsTWhoblV4SEpNSTE4?=
 =?utf-8?B?d2pTVTVkSndKUGkxeUhBSnFXMmpaaTk3eXZMSWJEQTJ0WGlkNjNEZURLMkgv?=
 =?utf-8?B?WkhoYnhPU2VoRmZpU2tNSmt3a3pubVZINk5TMkU0dW52bTFtakp4RzdaT3dX?=
 =?utf-8?B?M0FmKy9WcHMzNjZSL1VhZTNyUUp6QUwrWmhud3prZFoyLyt6ZzJIRUVlMlpM?=
 =?utf-8?B?WWN1aDZ2V2lxdENvUzhNMFZwbkp1em04RkRGV0lSOXducHpKdzBmSjNEdVJl?=
 =?utf-8?B?VHpsR3dGVlZvMEZydW4vWnkyaDNPY0RvbTRJbEFVSGs1cHhtTFltOTc3SzRO?=
 =?utf-8?B?R2l1aE5XNnptK2pOWVNadTJUcEFML1g5R2R5K3NvTkl4V2p1NzJzS0hjc3pz?=
 =?utf-8?B?TFo4emF4UnA4SUtFS2NUSHlYR0FPVjFnbSt6NEFLYlgva2gwSlJISmt3ZDZO?=
 =?utf-8?B?eEdmQTlvZW1pQTFYei9HQkJYd2wwN1puTCtFK0RjejlLVlhhMHNMTkh6bnRS?=
 =?utf-8?B?U1VnaDJ0TEx1V0pnRFVLbGZlU2tvUkxSVWZhMnh0cEQyV1JTWEkxT0hDU1hY?=
 =?utf-8?B?cHhVeHh2bytoOTJsbEt5bHVQQ01KdnpsSlVaZHIwWjA2Ykp0QWRSWkF6Wkk0?=
 =?utf-8?Q?hB8860?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TFBpNHQxUmtNdndmUiszUlU1VUVlc3JrRTFtaW5nWEQrUnJkdWg5cVRyTlEy?=
 =?utf-8?B?Wmd1c3lsbjBQanRCK1I1UG90RVFBVHhOZmtNYTgyNkZEb1JuaFMxYi9xTW4v?=
 =?utf-8?B?NWUzMFJRRkdybUoycEJ5bzdZYS9xeS9sc2l6YWVPakFYVTZ4cTAwdlVGU2dH?=
 =?utf-8?B?eHVpUDhNbWhWdEFqZ0RwK0tnUS9obFJtWmxMSnVFQWtmSWZJR0ZwVkltUUdD?=
 =?utf-8?B?bTdRTEpWNjFaZEdDL3ZMdVVKaHMvYUt6NTRKV2krS0gvTnZhTmF0TTlkSkF4?=
 =?utf-8?B?aExnNDJ2ZE9ybkNiM0VRdnZLeVBvY2FHVW4yV0huMVU2dnRvUXU1cU92d2RV?=
 =?utf-8?B?aTcwYXlXQ1B1OUhBTUtFeXE0dXFQN2N1QmZuYUN3b2htTzVuTzNYSWZWZHlO?=
 =?utf-8?B?UnRwWmdSZDBpL2NiODA3bUR3NmtFUVMzWExkcnBoaHByeVcrY0RyT0kxWWFh?=
 =?utf-8?B?QVJ2MjJPYUJxZWZCUjA0SkhjSC9IUW5kVnAxTnRRZFpDdGZyQ3hhVDlCUU9C?=
 =?utf-8?B?d09xVGZuN0FYVzlHOUdVbStQbUNQcXJOQ1RoeWZyVmkzaWVIUGMwc2ZuRUdS?=
 =?utf-8?B?emxsRlkvZnI2TDdUYzgrMzlmMFg3Nm1yWXJWY2w2STR0NllaMTdMQnlERnQ1?=
 =?utf-8?B?aHRjOGFhQjBYcVpvcy82WTNKcXdoQnIwYjNBbTZ4aFdLZ1BPbnA4RzBpMzRr?=
 =?utf-8?B?Vk8wcTZHYTJRd1A0bGZZc2lBQ0V6ZlpaTEMwQ2NFeFZIVnIzazEwc1RDVjVM?=
 =?utf-8?B?NGtjNmUzbThCU0tVdmJXK0dPV1Q1VGJzZEFCT3pYK1pycW5hMWdoVUtkaGl1?=
 =?utf-8?B?SWpWRFdxeHY5UFd0VjcvUGxIQ0pVbFkvY3RkejQzdXdRMFEwT3F6Unp6ZGlZ?=
 =?utf-8?B?MTcxRXlCZCtoc0xXVStoaDBlRXFPbno5aEp0OTQ4NTZEU3NRYjFmbFVqUSta?=
 =?utf-8?B?bWl5YmdhQWxUcUFaRWNRekZhWVF6Yk12NDRSUTFYSWt0TmNING9PSFF5Q2ll?=
 =?utf-8?B?VVd5MXpmaVM1a3Q1ZGtsR0NjY3VQUGQzVEJzRFNYMVhNVDhsVGZ1dUNmcXBX?=
 =?utf-8?B?MXJiNnd6U2F3dmVRMzdrOVJ2d3gyUWRTZXdvRHZmdzVaQ2xHZThhOWFRRS9F?=
 =?utf-8?B?TzAwdEZzUk9sQ2hPQ01JVlNSRlJWZ2JOc1A2OXkzVGdPY2tpODlzTFFRd3pn?=
 =?utf-8?B?andXWnF0QWtGTFNKY2hZd2NtZFBmcTNCYXdIaDBXQUplZnZvSWhRZlJnZnZw?=
 =?utf-8?B?TklZWlZ1b3VhOGlqVTRqVmhIT2krd0tYOUh2bk9CSE12bzY5SEE3TkIrenVp?=
 =?utf-8?B?MVFVdDNNNTVFY1VXV0NMamdBaHdqWGdFc2ZqVFEybkM2UjZsUVBoUS9DUVlH?=
 =?utf-8?B?M3hJOWlFbHZvbm1FWE9oaCttQ3ZWN1B4bDhhOUhNZTNycmpUUFliYkRBMHN4?=
 =?utf-8?B?SEwydjJTdFFHM25JL2ZPTzRKZTdiaG91WTJVb05Jdlh0T2hFOUZubitIdVZI?=
 =?utf-8?B?NWJUdlNzL2lzallwTDd6SlJWQzUvcURtUGs1RUczMXRNaEwwUDVCSXpIY1lW?=
 =?utf-8?B?SnB0bzFiTFZVUU56MWkrNDFhVjdESFg5cmxxZGJUSFBycFRCdWpFK0VpVU1O?=
 =?utf-8?B?WU5tQi9VaHBiaVBDbmdWUGZtK1Z3TkhuTmVTOTlNUW5BelZQVHQvUllVUVlN?=
 =?utf-8?B?YVdUZEx5UU5UOTFHSm45a3FZay91RnIwZGFaSUp3WkorZy9SRUw1ZkNaemRM?=
 =?utf-8?B?bURMTW9MNWxFdU9FWXZBRWpOL0VtdlpzQ1NVMDh2bDE4azdTMU1PcjBzYlY5?=
 =?utf-8?B?TE9qQUJRTVhtRzRqczZsU3diV1E2dEF6NkRaVVZVZTZIYm5xd29RMHBVVzNR?=
 =?utf-8?B?bGZzbXZjOE56QmZNYkd3K1NGcks0eXdTc1B6UkNpSWh1VmVnd0dxUHJMSEs5?=
 =?utf-8?B?am5KM2NVd3Ywb1plQmxxQWhtb0RiTjF2ZnZSdTdNMGI0djBrbG8vanJ2VEFQ?=
 =?utf-8?B?RkIwUzRKZTd4UjJiZkF1UGlmNnZjMUJTT0VKWTI2d2VYcDhiVDd1WVhvalhv?=
 =?utf-8?B?RHRqcnhDK2FJcFdzbW94QlQ5OEpjalJCekdEREdsTXVRdDVwOFBsUW9qM3BO?=
 =?utf-8?Q?BznsTl4kMN25IyEcTkAuVw0PU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fc3299-001f-47b0-15f9-08ddd6cc80e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:39:58.3610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Tc5wBIfQWMy86lny38me45fPQKyrtrm94LkYbqe07TLvXvqc7wQ9SbefeP5ux3AW7nCiDa+W5P5ia/ROkOrLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Totally rewrite CSI part driver compared to V1.

This only includes CSI related patches.

DTS part: see https://lore.kernel.org/imx/20250701-95_cam-v1-6-c5172bab387b@nxp.com/
PHY part: see https://lore.kernel.org/imx/20250701-95_cam-v1-4-c5172bab387b@nxp.com/
AP1302 part: see https://lore.kernel.org/imx/20250701-95_cam-v1-7-c5172bab387b@nxp.com/
	upstream: https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/

First 3 patches add some common helper function to simple code and remove
duplicated code in difference CSI2 drivers.

Clean up stage imx6 old version csi2 driver, and prepare create common
dw csi2 library for difference IP version.

Move stage driver under driver/media/synosis.

Create simple platform driver for common dw csi2 use case.

TODO:
	1. create bus, to probe phy driver under "test_if" interface for
specific phys under CSI2.
	2. support to combine phy, (which connect to both dw CSI and DSI's
test_if). Need use DSI's test_if to config combo phy to switch to RX mode.
and also need config RX part's phy register by use CSI's testif.
	3. move other vendor's csi driver to use this common DWC CSI
library.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- totally rewrite, see above section
- Link to v1: https://lore.kernel.org/r/20250701-95_cam-v1-0-c5172bab387b@nxp.com

---
Eugen Hristev (1):
      dt-bindings: media: add DW MIPI CSI-2 Host support

Frank Li (31):
      media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
      media: v4l2-common: Add helper function media_bus_fmt_to_csi2_bpp()
      media: v4l2-common: Add helper function media_bus_fmt_to_csi2_dt()
      media: staging: media: imx6-mipi-csi2: replace space with tab for alignment
      media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
      media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
      media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
      media: staging: media: imx6-mipi-csi2: use guard() to simplify code
      media: staging: media: imx6-mipi-csi2: use register structure to match hardware
      media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
      media: staging: media: imx6-mipi-csi2: move probe part to imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: move sd imx6's specific initialization into imx6-sci2.c
      media: staging: media: imx6-mipi-csi2: move csi2ipu_gasket_init() to imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: move number pad macro define into imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: move dphy init part to imx6-csi2.c
      media: staging: media: imx6-mipi-csi2: use runtime_pm frame to control clks
      media: synopsys: move imx6-mipi-csi2.c to synopsys/mipi-csi2.c
      media: synopsys: csi2: Remove deprecated s_stream and use v4l2_subdev_pad_ops
      media: synopsys: csi2: Add phy interface support
      media: synopsys: csi2: Add basic v150* version register
      media: synopsys: csi2: Add irq support to record error count
      media: synopsys: csi2: Handle alignment requirement for width
      media: synopsys: csi2: Add register prefix to register field definitions
      media: synopsys: csi2: Add need_dphy_reset in config
      media: synopsys: csi2: Add default simple dw_csi2_subdev_init_state
      media: synopsys: csi2: Add v150 lane stop state register bit define
      media: synopsys: csi2: use standard v4l2_subdev_get_fmt() function
      media: synopsys: csi2: Add customize get_frame_desc() callback
      media: synopsys: csi2: Add Image Pixel Interface (IPI) support for v150
      media: synopsys: csi2: Remove source pad connected check at dw_csi2_enable_streams()
      media: synopsys: csi2: Add simple synopsys platform driver

 .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  158 +++
 MAINTAINERS                                        |    1 +
 drivers/media/platform/synopsys/Kconfig            |   20 +
 drivers/media/platform/synopsys/Makefile           |    3 +
 drivers/media/platform/synopsys/mipi-csi2-simple.c |   75 ++
 drivers/media/platform/synopsys/mipi-csi2.c        | 1258 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c              |  220 ++++
 drivers/staging/media/imx/Kconfig                  |    1 +
 drivers/staging/media/imx/Makefile                 |    2 +-
 drivers/staging/media/imx/imx6-csi2.c              |  181 +++
 drivers/staging/media/imx/imx6-mipi-csi2.c         |  846 -------------
 include/media/dw-mipi-csi2.h                       |  120 ++
 include/media/mipi-csi2.h                          |    5 +
 include/media/v4l2-common.h                        |   30 +
 14 files changed, 2073 insertions(+), 847 deletions(-)
---
base-commit: 33652d58b64e92d2598205fd992989bd93cd61f4
change-id: 20250606-95_cam-b74c094ad1fb

Best regards,
--
Frank Li <Frank.Li@nxp.com>


