Return-Path: <linux-media+bounces-40511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B67B2EDE9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246205C0FE3
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700FC2D3A7C;
	Thu, 21 Aug 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TUdT6BMl"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FE7376F1;
	Thu, 21 Aug 2025 06:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755756542; cv=fail; b=OG1CiXWTcH0h4CX1+E4seDeKo3h881ktQ6wgi4kXY+GqT6wW/q87xSgpT1lWo/wZubNsW3brpEir8R7hIKUWJhAGLLhIdEroyn1H5CuZmNEUuGkwc+wBh90QsI0rXr+ZOQBiPEv3BYeawbwgUpZcJGZjElH5mqWUSQahjapHbwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755756542; c=relaxed/simple;
	bh=IZ+4/ZLi7CIpplBkxqrrXcSkfsKyHP9z264o3XucrnE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=ZjRvjGJx5Zcl8t3N0vXhJdaio+hnfmo6FchEK+pejfZA+vg6PUcrOiZG3ovPcwIBrU+bogdxq4PrIOxQ1qZni8Qa3KilZODJ40dDdV/iLU52MzOGdj6P2iOaFWNBI/r5na3gC6bPfuBTLkrV21yFZWzEqml7T4Hjh2Fx0E2yTCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TUdT6BMl; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+l0dELm0+HhhahxbEFfvBXpP6uHvmK4GhHTPLckloT8cwmfbehonaCYhu4cgHCOWY9tn0k5Qkb9jDR7hL9ARmfl3D2Ymo6tWUxdjncexSXpJimLdRrp2uWCRD1mV1umeiV7jDSMZI87YkbPBnpkWys/NRQyKB776tKFM8yj6QdIpQDsygkTsMfrEzpCWgrfNUD5owN6BbsYDqAHzr0wwdVUHb4xI2jUlsmqeGhFDSw52oeRndFyca7ueO6+nytKB5j7CvmTHJgtx9u9TRwoubJ/1y0exriBjBDbHctijIlw4XGud0Y2Xmgsuafl9pa5DD6yjEbLSXR0sC0fxgAaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IbMqUaCy71uGUTTqMfwG9bpJ7hAi9Llt0f4ipNmohY=;
 b=w5ekFEdt1yCZrzY/NRF0xRyHHW/bulHJVZsg+GSFEnl0DyFv3BfBnhlZpKyIMo6mqqRUYysUU7z33fw1M3dGPKIqcyM2Eh+ACextMJgmFMHgEv1DxeGgGHi8DbHVBefceoCMCba0xCsOkbS0mQBP6B+8i7OE5elSTJIg0qu//+RvotlfFe6HFWfs4q1BIeYJ8Qr+HrciEv9XaFiVMq9b7XqR991ww/xJLG05vd9b0SyyHnGXJEALzr1iHx3gsls+HZ1E0roynh4Al7sm8J7CuZIAHV0YoCH+VqB2uZxY1vE/SoRtWhiCpPMzqDRSw8fMG2wdc954R9m5KL58mfEmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IbMqUaCy71uGUTTqMfwG9bpJ7hAi9Llt0f4ipNmohY=;
 b=TUdT6BMlzTt/9Y6fYYil9fWFMjqfKV+bkGxZ0yiHR82xmBydbyZjWe6quWEuXeZE312WHie08B22Q/nJVuHzwXeT0WQb/hRWpb4s86jn1ad2mR57pQad1xPrY5GBvg3JPyy0de1Y4hf7Abj66wF+MyVBrKc1ZFrE5ZFF8MOIuJnIpdC+m4kGXKt3b+1AGMmWLZ1lf750gwcsYoXcfHUkzHVcPmXfmmaa9xmDVxFsPgA+I1/0U4vk5wgoG0+ohEvRUomxt1Cam9WtamtqQ34U544Lf54X6JDeYO3Y9boe4TM3ZboOUjEyRPTlnICo6tWxtoyyMHO2p9MnnIiYndCqrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10125.eurprd04.prod.outlook.com (2603:10a6:150:1ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 06:08:57 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Thu, 21 Aug 2025
 06:08:56 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 21 Aug 2025 14:08:29 +0800
Subject: [PATCH v2] media: nxp: imx8-isi: Fix streamon/streamoff calls are
 imbalanced issue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-isi_m2m-v2-1-c616e4b00600@nxp.com>
X-B4-Tracking: v=1; b=H4sIANy3pmgC/2WMQQ6DIBAAv2L2XBpZJdKe/EdjGsC1cgAMNMTG8
 PdSrz3OZDIHJIqWEtybAyJlm2zwFfDSgFmVfxGzc2XAFkUruWS1eDp0TBmBXScV3VBArbdIi93
 P02OqvNr0DvFzjjP/2f9H5owzrQn1MPRzr5fR79vVBAdTKeULIIoXEJwAAAA=
X-Change-ID: 20250818-isi_m2m-ac52338ae925
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Christian Hemp <c.hemp@phytec.de>, Jacopo Mondi <jacopo@jmondi.org>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755756531; l=4052;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=IZ+4/ZLi7CIpplBkxqrrXcSkfsKyHP9z264o3XucrnE=;
 b=33UmHtQJejF2Zg9vRMxaCRwbftG98n9DKy/aRBVnb2bsijcpae1XfVnbe7XHbaqUknCWov2uO
 Wkv5iG9XnQHA47Avf3xsLFI4kKMRw7bAyIQWFhpKCE7Nwl/A4jio1qx
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::15) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV1PR04MB10125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bbe1fd0-1c0f-4abb-fe70-08dde079363c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S0tZSjgzRzhLQkNybUxxZU1qcHFFOGwwYXFNZm1TdHNWTFRORlQ0b3lsdE9z?=
 =?utf-8?B?clAvSHpiL2pmaldsS0ZPOFY4RzhudHpUUms0NUp1QVphQWlGWHV0WEVYK3pw?=
 =?utf-8?B?SWRQcyswNlRoUldJMk90dXNaQ2NyMWx3MWsyNk8yd0xuRys2RjJKd1dlMnZo?=
 =?utf-8?B?VDMwbytvL2lLMzZZSmp1aGhpNS9tOWlFNGJGbWxrc2xSRDlRL2NmTnBwS3dB?=
 =?utf-8?B?cEZWdWtDK1c5aytMR2NSVUIyQlRlb00rVFFHV0ZBZ3ZTdXBGQ2ozMDJwS1pH?=
 =?utf-8?B?RmUzUVdZM2N4YmNHb09nMXR2N0VsQUtUSG5YSlN6RjZVdENTNjNtZ1hhZkNF?=
 =?utf-8?B?Z3JPZW1JRDlzWjgvMnF6dzRTMTBuT0pXS2duV2RET3lNOWV4OHhabG0vUzVw?=
 =?utf-8?B?ZnJmZ3F4M3pZaGo1ajVZK3Y2MllneHhjZjhyY2t4cjRocng5eitPVGtIajIx?=
 =?utf-8?B?QWI0OWlpYjFhVTVVT0hiaHl4dksxMnQ2NHpSTTRibWwxSG0vTnl6ZTNpZmhm?=
 =?utf-8?B?V2VSUjRGTm9tZ0pUVXRhR2QwOGVEZElybnNpTVpQeWFNei9QSCt2aWFxMncy?=
 =?utf-8?B?NmRQWXYzaFhqYi90M3p0MmJnTmRBTW1uL001NDY0dGNlR3c1RzMvandRTlc4?=
 =?utf-8?B?bmdjRDNkZEFobzZwa1hEcGdkc092SlE5SE5vdE1nT2tudjlZTHlaMitJUlI3?=
 =?utf-8?B?MGdsVTBEUWVRaTFiYzUzd2g2bitneHRadHJNTUdWcE9kQ0RIeElwMWtGSGNN?=
 =?utf-8?B?UjdjTHRmbnJaeFdYOFdlQzNiQ0tGMXRxYlBoL2gvOEVRY2VSUG1odzBaSWFP?=
 =?utf-8?B?WVlQL0owT0tIZ1IwTTJUWXdJZkg2NXErUlFsQ2ZFTXNCZS81a2RqbUNQblpk?=
 =?utf-8?B?ZThsd3k4cThwNG1Ed1BwYVFQWlFMVEtXNDN2T2RQY2J2bWpEQitIZGFMTmVo?=
 =?utf-8?B?OGJxU2NpTU9kMmFZZHVxK3B2V3NIb2ZWVlFCRVBDSWhWai9oRVF5Y09RbUVh?=
 =?utf-8?B?eUhkWUVKemlmNlRMek92VXlNcGNUYUo0bUpqWUhUZzJOSGFvamJJVTRVeXJS?=
 =?utf-8?B?enA3YkgvQ0F2ajN1c24wYVJLT05MdnErY2ZVdlg2ZC80SnpnTmFyYjd0Qy80?=
 =?utf-8?B?Zkx4TU5wOXpwbXVZZks2cUhuQVFxcU1hTmhOa1Uxei85SmZ6MGpEUHZZOG05?=
 =?utf-8?B?L015RTN0dG1QRE9xZjNQU0J3TEM2WmJTenI0ZXpESENmeDVHeXNoc1hPRUVX?=
 =?utf-8?B?clRudUlvMkJsWGFpUnJ3UmtwRUFlTzVXUXNNM2xTdzRBU1dGdGw3L205UTBs?=
 =?utf-8?B?cytxclhNcjlRVU8xaVJ6WERQSGJpcExGL012bEJTUHllcFBtQ2drRE5iM0VD?=
 =?utf-8?B?cm02ZFd6YjVrTHJXeGNxOStYZzY1bENZeEM2Mkt1SmpmYmc3Z0dvZWh4RklM?=
 =?utf-8?B?ckloRGtLUUlBUGwyVFRQK2ZuWitpNCtBL0JrWnlGRm5hd01uRjM4ZG85TUZH?=
 =?utf-8?B?ZytDeGNuSEdFcjk0bk5XVG83V0FvdGlYSy90ZVBYdDlDdk9Na2RiUTExNzZq?=
 =?utf-8?B?cWRneEZtaDFrT0lZN2NiOXhHS1dMTnhESDVyUXBJS1cvSlhITUVMNER1RnA1?=
 =?utf-8?B?SDZsUmgxcFN6QmhFZnBFZk5BcG05dW5lTlZDdWpEWFZobktZZ0w4bXlFaUUy?=
 =?utf-8?B?Qm01TTRGSElZWG5zRFNXbE5lQ0lrWmYwNmVoKzltZUpTZ1VCbW9WSEI4T25i?=
 =?utf-8?B?V0U4cHNxTzUxR29BdWpydFBscEovMnYxdzluTExDSnFSQ2pDaXhSTFY1cTVs?=
 =?utf-8?B?RVR5NVg5eU5GdVppQ0MzbE5YVFVoQW5nODBvT21qNEY5KzhqN2VneFBMdkRJ?=
 =?utf-8?B?ZUgrS1lCeVgwRlFocXZVNWthMGx6eFowVG9icGI1bnVvTXFIM09BdzY0dWhX?=
 =?utf-8?B?dmZwY0JZVTZoMUhSOUN1OXBxdzFBSzRZcTdJZndxOHQwUDV3WlpBU3Mzbkxx?=
 =?utf-8?Q?Zj7yeeN7/ZW5ITHXrqCDNo36MgyteY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y1hmakUrbGNVaDIvdUhQdU9jUDB5bzNxWk5mdEZjMys0V1dMNGdyZU11c3dm?=
 =?utf-8?B?a29HbWR4U0VqbXR1TWtjUm5pOEN5aWRVck42cFV5WXdBbEErdHlhZjBvVmZ5?=
 =?utf-8?B?aEg4VWRzRjRySnB1WTZtRXMrZlJKeDJTa0xYUUNFaDNUby9QZDNLSjIvS0lN?=
 =?utf-8?B?V2pyd2JET3UrZFUzWk82aGlFQ3RXRkRYMytxdFF6WDZ5VGdUZVZlTjhaZG4r?=
 =?utf-8?B?SlF2ckxXQ3Uwd2hoRDcrUHlPcU14c2EyQXFya3BiZXdMYzZPcnpJcFNkWDh2?=
 =?utf-8?B?YktlZG9mL25LelN5cGJOOWFaczQzeVorUGs5Wng0cWtQRUx4dGpIZkRqaEVn?=
 =?utf-8?B?MmVVQ1ZlUmZtRVpwRVMzMURxaG4wU2xQSlgrWHdOK2V4SFBPSG9VR1AzcTV1?=
 =?utf-8?B?cXVzQmhyMlJaSmQzQ1RYaGEvd1VGUHY4R1I3V09icTlOekgzMTVvYTlEL3Fm?=
 =?utf-8?B?VHFtSmFJcktEb3hVVElaS3M0ZzR0TlI4Y20wamkzVjc5WlpMV2JMZ2EybUc5?=
 =?utf-8?B?aEhRdU93WkRqQzU4ajJmeDhucFgyc05veUd2Z2xJU2lZK0JVZlJuL2F1VW9m?=
 =?utf-8?B?eHRKZXpxZzBqbG1MeGptRjdFMlQzQTBUNGhnVGNadHo5bHY5RWVCbUo3UjJH?=
 =?utf-8?B?S2ozUi96UlN2RG1qaEhaZUp0WU5rZ2lGcElUcUJCbEFYbkR2NE1SREtldnRY?=
 =?utf-8?B?RE5IZVU2cmhWalZrZDdUbno1aDZad3BWZjFvWmdtSDFQWGlWMGxYa2xLZTRP?=
 =?utf-8?B?dy94Ymg5dHJhSVhRb0dBbkFpOXd1blVkUVlDb2lBbjFKakRYRGdKYitZTzdo?=
 =?utf-8?B?VFdzUE1EZjNWL2FwVGdtMGp4VzNCWEo3STRwMHI1OVhQblBlc3hlY3RNeW9J?=
 =?utf-8?B?dG11QndHNzJvZ3JLaWN2SVZ6Qk9PNWszN2dJWDZ3M3pRb1NBYWRMNHZMSzRX?=
 =?utf-8?B?dDNmanM4TGtpT3lGQVUyRVR6dUJRTllkc2ZoU3ozUjlWWGVMTVY5N3BPSXBL?=
 =?utf-8?B?SWZ6dHcrb1ZNQlJDaVJFbmhaYlEyV2dxWFdHdm1ZQ2VJV2ZpYUFIaHcxNGsz?=
 =?utf-8?B?b0ZSRzlMZWJmNmYvVlcxTWxGZmN4cW5kZVI2bUZHTGxKcGdPYUtKaGE0SS9p?=
 =?utf-8?B?WUd2YWZRV3ZNYUdNZHlERlVmTHRPRGtWb3c3bUlZeFVjM0wxOStROStHdTlG?=
 =?utf-8?B?QzlHQjJ2bWFkTjNpT2lUNXVGc0dwL0JPZ1RUZVNSRDhoaDNadnFUMU9WSzdQ?=
 =?utf-8?B?TEVOVWlwbGNyV05vamdCQzlDbEIzdVRPZDRLOVU1RjBxMmN4ZXZsbld5YllK?=
 =?utf-8?B?cXQvRWk1VXByQ0ZXQzBJSDdzRVpsYnpwQlpkY1VkaFZmUmE2UU1aMFBlc1Jl?=
 =?utf-8?B?djlrV3hUL3FEVjRzM3RiU2ZUeGk5QXo5RG5NU21LYThsTVB5Y2hLTzRISnJp?=
 =?utf-8?B?R0pmM3h2WlQ0N3A3MnB5dDZHOEVIbHlzd2o5d3Q0THowTnN2Yy94QndhQ3NJ?=
 =?utf-8?B?aTYzeVNRUkVqZ0ViWXBtbGpZbzM4OWVJb2N4Y2VuMmg0UkZnUURJbmdBTmZG?=
 =?utf-8?B?enBFbklyb2ZnWlhaa1Rrc3ZjVVdWNldSV0tVZ0RUdnpkN1NEbTlldTB0RVJ4?=
 =?utf-8?B?THYwc3pkQjc2V2xFblpWWk5yRXdpejdzWitVNHozSW9KeHQwaTREc0ZoVlhv?=
 =?utf-8?B?QW83QUt5UlJjLzF6eXVxcjhWRy9BMVZKaFlFVVd1TE1kS050ZC9PeFluM0xT?=
 =?utf-8?B?cHFTMmlLYWtDc29tQzlGdkZLTi9ZK2VNTDg5Rk9jTDh3R3V4bTFvVTdGMGVQ?=
 =?utf-8?B?NytDNXliLzBBR0haY2RiNEdHN1dUam9QbjQwSVBCZm9Gd1RXU0J6WDFLNGl3?=
 =?utf-8?B?QVlHcExON3NBOWpoS1FQN0JtUjZkRFZvU09PaGhpSW94TEVUNThjalhWamo5?=
 =?utf-8?B?Z1FxNkNWR2RkYm5oeFJLUEJZYWx6TlFndDRQVWc1WVJWRDlKMFVFN015TVF1?=
 =?utf-8?B?bzRhTkZhN0NBNGRxNlZJNFdhWEJHYVF0NTN5Uk1ORWozZDkwM1Vzd0lBaitI?=
 =?utf-8?B?RUhPdHNQS0dHZGhjT1RzQllqWDlBT0pCNGZCckpRNFY5Y2Jjc1RWN0h6VUMy?=
 =?utf-8?Q?exclo2DE8xhSF76hwDx5m5fXo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbe1fd0-1c0f-4abb-fe70-08dde079363c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 06:08:56.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzOl5UE61W3R+mthezeVzAXoeY4sKXFR3FaTEylWtYz8xfKo91eD+WX+Hrjp33jmB14ag6MgJ82DZkJTilvjFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10125

If streamon/streamoff calls are imbalanced, such as exit application
with Ctrl+C when streaming, m2m usage_count will never reach to zero
and ISI channel won't be freed. Besides from that, if the input line
width is more 2K and exit with Ctrl+C when streaming, it will trigger
kernel panic, like bellow:

[ 59.222120] ------------[ cut here ]------------
[ 59.226758] WARNING: drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:631 at mxc_isi_channel_chain+0xa4/0x120, CPU#4: v4l2-ctl/654
[ 59.238569] Modules linked in: ap1302
[ 59.242231] CPU: 4 UID: 0 PID: 654 Comm: v4l2-ctl Not tainted 6.16.0-rc4-next-20250704-06511-gff0e002d480a-dirty #258 PREEMPT
[ 59.253597] Hardware name: NXP i.MX95 15X15 board (DT)
[ 59.258720] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 59.265669] pc : mxc_isi_channel_chain+0xa4/0x120
[ 59.270358] lr : mxc_isi_channel_chain+0x44/0x120
[ 59.275047] sp : ffff8000848c3b40
[ 59.278348] x29: ffff8000848c3b40 x28: ffff0000859b4c98 x27: ffff800081939f00
[ 59.285472] x26: 000000000000000a x25: ffff0000859b4cb8 x24: 0000000000000001
[ 59.292597] x23: ffff0000816f4760 x22: ffff0000816f4258 x21: ffff000084ceb780
[ 59.299720] x20: ffff000084342ff8 x19: ffff000084340000 x18: 0000000000000000
[ 59.306845] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffdb369e1c
[ 59.313969] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[ 59.321093] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[ 59.328217] x8 : ffff8000848c3d48 x7 : ffff800081930b30 x6 : ffff800081930b30
[ 59.335340] x5 : ffff0000859b6000 x4 : ffff80008193ae80 x3 : ffff800081022420
[ 59.342464] x2 : ffff0000852f6900 x1 : 0000000000000001 x0 : ffff000084341000
[ 59.349590] Call trace:
[ 59.352025]  mxc_isi_channel_chain+0xa4/0x120 (P)
[ 59.356722]  mxc_isi_m2m_streamon+0x160/0x20c
[ 59.361072]  v4l_streamon+0x24/0x30
[ 59.364556]  __video_do_ioctl+0x40c/0x4a0
[ 59.368560]  video_usercopy+0x2bc/0x690
[ 59.372382]  video_ioctl2+0x18/0x24
[ 59.375857]  v4l2_ioctl+0x40/0x60
[ 59.379168]  __arm64_sys_ioctl+0xac/0x104
[ 59.383172]  invoke_syscall+0x48/0x104
[ 59.386916]  el0_svc_common.constprop.0+0xc0/0xe0
[ 59.391613]  do_el0_svc+0x1c/0x28
[ 59.394915]  el0_svc+0x34/0xf4
[ 59.397966]  el0t_64_sync_handler+0xa0/0xe4
[ 59.402143]  el0t_64_sync+0x198/0x19c
[ 59.405801] ---[ end trace 0000000000000000 ]---
		VIDIOC_STREAMON returned -1 (Invalid argument)

So check the queue streaming status when application close and call
streamoff to fix the issue.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- No functions changed, add Cc:stable@vger.kernel.org tag in the sign-off area
- Link to v1: https://lore.kernel.org/r/20250818-isi_m2m-v1-1-bbe2b774d4bf@nxp.com
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..7650a9fe6b093e2b4e09e3e66b624c8c019c8583 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -709,6 +709,14 @@ static int mxc_isi_m2m_release(struct file *file)
 	struct mxc_isi_m2m *m2m = video_drvdata(file);
 	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(file->private_data);
 
+	if (ctx->queues.out.streaming)
+		mxc_isi_m2m_streamoff(file, &ctx->fh,
+				      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	if (ctx->queues.cap.streaming)
+		mxc_isi_m2m_streamoff(file, &ctx->fh,
+				      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mxc_isi_m2m_ctx_ctrls_delete(ctx);
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250818-isi_m2m-ac52338ae925

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


