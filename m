Return-Path: <linux-media+bounces-40664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27CB305BD
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA4BAE5116
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360FA352093;
	Thu, 21 Aug 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WVbEVPSe"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827FC35207D;
	Thu, 21 Aug 2025 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807417; cv=fail; b=O0t1q5VE/PjFEhNBscI5JSQvQuChku4C+VtVl2qD5UfWyXgCVUAcDHFF/d0OVVBClJZx1SWmsWXcnu3T4GklRwCIWxJsW1reuYCwLeGSpYvZ8OaFjUMS8fPA1nrX5RgCua8Uv2OWOuF9LvLWwQ5HNsKiFgLcLP6nbWGk/KvEQIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807417; c=relaxed/simple;
	bh=Nx6m2kTz9MnGvT0LPTpNQlk+9kR/GrBRxiKGW1eySIc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S4QwHdIejnocDKVRlPTrptfQx4sxyvF5H+ljf63A7RR3xdNjZWDAfy2oazljCUnc3f6bJ2ZBvLBpq7vrBFdEZO0WgjEPU++EEpUJM/6XHzGNW9ViCBhLevt3CJ7CVrEQ9os5COM8MooWet4Yk2FIfG7pQ5DZbJRgy3SRh1ahXLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WVbEVPSe; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clvQ5KN3CnYyr7G5i2lAUZ4silvxZVKumzErurChDD6rFIywVhIfCgZATbWy+1flO/lMxthhnnpwB4gzU81weFXL9aeqm6eaY5WXtigN2p0RLp3RyYmdzOhVnqRkq+o9VvsEFnTvwm5KZ306On7aiaoMwIRaZLeJzS9IP/e4OFld8NZfLpFOUsIm86/NJLqBsDID7bvmA0beCwsGF2EpeIhLDqdLKREFC6w8szqpMXiTdVPUUF65Wh9PRVoYpfrf6lIt1wyN7smkY9djZoCLLxQhoQELXGEuwJq8NYlyvwnSb5R4CZCMEwdmRY0u858XArj853y7urJHyGOemErVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2IfrSM34hUvUtXMsyqdeTNctH21ohqKZkLvLNQvb1s=;
 b=phLKvEr79M3tm7xKKkY/+5wrbp2qd4+qM8697FeGYKeF8P/SBoc+D+UTe3B8cg5p0yqT1tA3whyp4yWJothzZukqC0C8kVsYif5WdHAFmFAc7m2qG/brIYymT1VreV+rrwf79oLp5xza+lsZHrAvB6S8eVakL59NL46LuCame6NkP8l+o2vvD3148mW8HS9F6ZCkcdV8DMt385aQR0m5fuPPNt17aZajXxhgQO5ApSluTY1qgw2Tt0nE1KMinb5zZ1CKJNg7kiWWyZTugw8GGQVGQNRyG8hAqJkxlOA+GhpeMhgXGZCgBj3zcyiCsI+GifVymF7Al6K68kw+p0Xc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2IfrSM34hUvUtXMsyqdeTNctH21ohqKZkLvLNQvb1s=;
 b=WVbEVPSeOuWluNHFeVR56RIBMFrjs7XGzN52rDvTy5L5w11/l9ose94nrdXy6EC1SY5FHKmZ6Q3+zitrRFryrDyKftG9AslQovoCUn9pth6L06rCVjDw5iB1nfh61C8zVvXm2lFYfOMeA1fUo2DLmFhPvRbTKLSVBN11b6FxqaldqFRSCiKNmDwle1+pKrfJSVD8/FlrGfkgyOkXohxUw/ZFjQVXkNRiFFGbgzo2HzUqwmJsFJxKdjRLjqK1JONBysz4VDCWfwPgkARrSW9NtfPKuEZuP2IwUKlq0bnT0LDJyR+Jz1Qu2wev0EUr915iSPjvW42BwkXzWv3NwB3O4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:52 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:42 -0400
Subject: [PATCH v3 07/31] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-7-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=1431;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Nx6m2kTz9MnGvT0LPTpNQlk+9kR/GrBRxiKGW1eySIc=;
 b=tjV8h6yTb/HTsO0TZA9jyD/lDQtQypQ2VVDusG+7YVtmFEGP+Epofwo1U1aW2K5w/QIVgdP4N
 XRdizlm7AUZCLxYIWyxn68nirO9OnogGcv44yYHrrTTSbXGpO4pj+8V
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
X-MS-Office365-Filtering-Correlation-Id: 989ed605-c612-4c94-51c2-08dde0efaad3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UXo2OUwzeExaOFpIa2oxVHNSSjBGWHkzZGFBckMwQ2ZJQnorQjhyZGtoMjYx?=
 =?utf-8?B?Z041Tzc1cUNNaE5JekZ2YWwxbGc3WkVjMjBaZEtRdlpsQVdKTUp3dnNYalNw?=
 =?utf-8?B?aFNYN0RKdFBUNUI1QlVicDlHL25lTit2ZldUVnBSRXgwejlYc1RHZFlvSytU?=
 =?utf-8?B?ckZGZVF3SVd4UXo1VEszckdTQ1pwbkFkNGwxb21EMHZTTWxVWkpkUXV5Wndl?=
 =?utf-8?B?Si9XUTllMWY4WFBDWHA1T05oY0E2b2dFTmJtWUdoZjRKSHlldmsxckVBVC82?=
 =?utf-8?B?RnBmREd0ZmZUSG1PdE10OUhSajFIWFNWQ1ArV1kza1k5RTFJb0NhOTltYlZp?=
 =?utf-8?B?ckF6LzNjNnZrMWVoMENWbXZDRUUzd0hjWEhzYnoxUG1iVVlhM0NuL0JuT1B3?=
 =?utf-8?B?RlNQZnV1MHNBcTNGQXJnNG5JSTF2a0ZiTlpOeVU1U091aWJVSlBNMDR2OHRF?=
 =?utf-8?B?eHBiS2l2MXNzL0lKQXBDSkZzNjJUMTJycFpVV3ZJbytUN05wcUd6YUNlWnhB?=
 =?utf-8?B?TlRINnhYVjFKcWFDN3NuMFdTbkRVL2trck53N3BlNCtBSlNvZzBueWZUQkk2?=
 =?utf-8?B?L2loTFZKMDh5eEo5STVZeUQxN28zblpSUnVyaEhKRXRHNEVGNER0TUdUdEZv?=
 =?utf-8?B?TWJGRXVGYUhqN2p1d1ZZZ0RvOWNKVm5rR3ZOQVVJZXE0aUtsSVFrZVR5R1Bv?=
 =?utf-8?B?RFJYemRRZXZuWHJDNW1aL0RWVytwZ0FBOThjdlBMdHFjUVRaNDIyWUZPMVJq?=
 =?utf-8?B?SEJMMWYwTVBwK3ZOdkluSkwvNDZ0OFRuV3htOEhFL1U5Y05lUTY4ekhRTlMw?=
 =?utf-8?B?aXdBR1VrNVRjSzU0R1Zlam9iUnkrb1JKZExKWVgwdHBZQzQ3Z3pvN09WVXpO?=
 =?utf-8?B?c0dEZndhU0hhc241VFBOVWU2YjJxVXdaL3UxVkxJSFFZaXpLQnRTT3dIVFFQ?=
 =?utf-8?B?QWl4Q0lpdzBXdCtNSHhUUUlGV2Q1R2xXOHRtNVlmSDJia0M3eG1vcU5mVGRP?=
 =?utf-8?B?SUx5U0R2TkxFQWJaTCtwcGN6TE1lRlJGcWI4bk8zM3I2a1F4MHdiZWtXYzcy?=
 =?utf-8?B?WDRCUFcwUzNKVmh3ZDQ0MDVReXVGc001M3crUHYyeXVGVTNKdUFWZDhMT3p5?=
 =?utf-8?B?MHBTVWdBZEVjbmVIRGFXQk5yamJOWTNoK3kzczIvMlpEQjVsOHNhY0trKzhC?=
 =?utf-8?B?dm0xRWQ3emw0TE9OMmcwQWsvbjVJSllEcDFkVnpBcXRnUW5sVGkzSk11RWhN?=
 =?utf-8?B?WHFzbFVUUVdjR25UWGJyekpKNW1PWDZJYkRYaWthL3Roc1ZHTklnWHBxZmlQ?=
 =?utf-8?B?OUxzWHc4ZEg1UDFzR291UlVPQUZ1aUJGQnYyMHhIZ2JBSGI0LzBCMFBlTXBp?=
 =?utf-8?B?aEc4Sk5QeTQrd1VCRGxiWmVRU0VrSDNoTkI1aGgrOWwrSXFYM3ZTdjZqT2VE?=
 =?utf-8?B?VGhLd01LRndWTnNBZUpwSlo0TFp4bVpSVHJONE1zaFBNYzdCSm1DbzhTTVQ1?=
 =?utf-8?B?TTdmR3lJay9Xdjc1UEdEMVppYlBrVGFOdGdCZkYybnRsZ3FmeVNvK21GaC9a?=
 =?utf-8?B?bzFiU2UxRkpqRTR2eEh3WGdNM0ZTazlzTXkvd0pEa0FxMDVFRmFnQ2lMbUhj?=
 =?utf-8?B?TXR2TllIVGhhK0oyYklocjU1N21rMkNUdnlDeHB0Y0QzOVBLTnU3bVFoMktH?=
 =?utf-8?B?bmFiaXdyemRvemtDMkVkZHk3VnVpeklhTDBoSnY3S3dpRWJNM2kyOUUzc0FP?=
 =?utf-8?B?K1dIOUsyZzBxTzc1THl6dHJxblBpbElyODdUc3o1ZzFGUkd3aC9DSkU1cFp5?=
 =?utf-8?B?VTRmcEpqbnAyWHlBdktmMll2Ry8yNHFuVFFFNHhQVkQxSmtQMVJiektLc1hq?=
 =?utf-8?B?cUJpeWZKRU5nWitKczBpT094cUEzbEhoN2VqWDE5MzBPK2ZOZnJwMkhLa0dy?=
 =?utf-8?B?NFh1YjdkQnEvZHZRZDQwV0JwTU5udm05SXJjSmszNlcwdnRaL2h4dWx4Y3V3?=
 =?utf-8?Q?3kx4IfkTjyCz1zBN8qP5M8XOlYq5+o=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SUVNMjhnTitsMnRYdTRhc1hnSUFlRCt2SGtqUllIVEVqVm00S2VXek1EYlAz?=
 =?utf-8?B?ZGp5NlJNeFQ0K1Y2MmYyVnlJLzNqTkxVcnF3RHJhblp1bEVTZEtGSE15L0JQ?=
 =?utf-8?B?RXI0eTh6WnBtc25ZeUVqMHBiTXlseVN0ejJiRFhuSGJtTUF4Y21ZbVFrTThL?=
 =?utf-8?B?YXk5blVheFNKaytzWnFqbEl1WXUyWVhsK2phYlFucFZlZEw3bDJTNk9vb3ZH?=
 =?utf-8?B?c0xFSWdpdmpVMVNwWlhDb0lzMTh2ODQyQktJOE50cDVkc2lTb0NEZGhZSExR?=
 =?utf-8?B?dmpaR3c3bk9RZjNWWEd5cGhrdlVQTmlYUUtnb1VPTHgrRmtWMHUzeGcxZEkw?=
 =?utf-8?B?aTdHdVpSUWhWcnI2LzA4OE1YU3RLSFI5d0gvWFFibHJwbkRGelBRbUszR3dS?=
 =?utf-8?B?Q0tSQ2d0b0NSbUFMWmJpbU1yNWpPUzliK1BNK0Y5eHI3NzM4ZkNoOS96alpG?=
 =?utf-8?B?bi9EM2NTNmF5d0VlWUJzM1ZEK0EzTnFZSkJKajl5cjVqbWdaMVFWVk5GUVhU?=
 =?utf-8?B?T1FpMWE0QXlmbEJiZmVSUllJaUlkRG1sdVVhMlBuWWRRTDF4bDhneDJBQkV2?=
 =?utf-8?B?dU5OcUdCbFFLL1Y4cEFFTXV6WHVTUlhQWFZCUEwwSkdwOW5FUGxoelpPQlg5?=
 =?utf-8?B?N095aXUrSk15WFZMblE4Z092d0hGaTA3UjI2b3B3Tmdmd2lLbWR3b1NFcENy?=
 =?utf-8?B?emYwL2pjdFBJT28rUHd4bVVybXNhZFJSZE82eFhUT3MvS2p5bFlEV0tXaVhC?=
 =?utf-8?B?eU1jL0ZvblhJUG9LWEtLVlJ2OTJiMUE4SWRnUjJ1ZFM1NTNjb2U5clJvdVpF?=
 =?utf-8?B?Smd6eTNKa1VRYkNnTjYyczVOc0xxQi92Z2ppQ3dFUEp5KzhxUTJOV1A4Umpr?=
 =?utf-8?B?dVpLb1Q3cWMzdk9VTENsTklyL3lxNGRlWW5xV2wxQTYrYjZpRnlOWEdUNXlt?=
 =?utf-8?B?Nm1QeXJnc0l6cExVTTMrU3dVdWJ3djlJMEloSUliZXJkSGQxblNRVVlBWlBI?=
 =?utf-8?B?amZYZUhzMFdJS0NLV2VIaFpyYlZBZlk0NnJnQWlrR3dhYXBUOG9raGJmUVFO?=
 =?utf-8?B?UFIzSmJ1QlRqZkt2RzRyRFBDMUx2cnRIdjJVT2dUbWwyLzFZVnl0VTBVMW5B?=
 =?utf-8?B?a2NMSEcycHArd1JGYmJTYi9hZG8zYWtNZFc0TTk2MFFTbk0yakJHb2h2Zy9q?=
 =?utf-8?B?aGNwUjBUeUszZjcwY3o5MGhvQUFISmJROUZybDFBMWFzSW1oOEE0VWh2MU5K?=
 =?utf-8?B?dGlnUTliKzJ2M0kzZXUyZXZETGYxdVpoeUNhSkpqUzVleFNsVFFjdEovSUI0?=
 =?utf-8?B?REFwclNCKy9iVzdIcVZzZVZPMG5IRHVGK3NtVnZFNDhldU11VXJKNld5eWlG?=
 =?utf-8?B?UmpSMXNNbmpmZnUxTURpLzMxNm4rYjNnelMyd3k4ZDBBeGp3YVdzWk45OTdP?=
 =?utf-8?B?bXRsa3l2ZDFWYUw5T1dneVE5QlVQT1dYeEdSdWFoQ0RIalpUaTk5bkNxWVAw?=
 =?utf-8?B?SjNKVXhKRHhEVFp4bnhSeFJFaHA4L3I2OHh1OGFhMjBHbUhrTXprQmxXelQ0?=
 =?utf-8?B?V2NjNS9oRFFONzVGTTY4Uzl0d1gxRnE5dEp2S0pTOU0vZDcvYXhFSFo0SjlW?=
 =?utf-8?B?S09Zd2JuODFsY2JTd1JYSG9oTnpNdUhiSFhCVFNMaVIvZVNUTHhyNzdUS3Jj?=
 =?utf-8?B?R2xESFRCMjhZc0xOQ3NkU0IvOU1mVW5neVVTZjVEd2s5OUVIditKYzZVUE9s?=
 =?utf-8?B?SU4vNG5VRUM4a0tPNElWckhGbnl0bHJaWDh5K1g2cnpVM25ZOVJsRGNFSGdy?=
 =?utf-8?B?MjQ3L0F2N3ZyWGJzbThCWnJyc2RKSmhIdnBCQW44NWpFYXdLcm92OTZQTkd0?=
 =?utf-8?B?alY1SXRScUdncVJRajR2dzhhWVVJbUxjY0lWK3Z6SGtoL0xiSzdPL1VaZUZK?=
 =?utf-8?B?a01FVlFiZXlrc2xNWUFQSlJuNjZQMG1zblNjM09sYzRhUFZ0d0tET1VhdlJj?=
 =?utf-8?B?SG1uVWpmaU9yNzR0NTJkUUtBamsycUZycUo5UFdhODhHZkdsOTdsVDQ4R3Vz?=
 =?utf-8?B?Z01aWDhMb003Nys0UXZNYnNzeEdLSW1HWnA5KytxTHRxZmxXeXdnRTFuMFkr?=
 =?utf-8?Q?QnDY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989ed605-c612-4c94-51c2-08dde0efaad3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:52.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23QVYO8TW5wWsyAXKcKLww/vMYmW6qExpus0WeRZBAKjwV/hJ6JH/E7SzXB4SXewt0RdSWB3mB4J1QjjNalN4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Use devm_mutex_init() to simplify the code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 32ddcef7ec8535a44e121754bb621c0d2e226369..f8d0b3b8b250774af51f2aba731e639131aceff9 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -771,30 +771,23 @@ static int csi2_probe(struct platform_device *pdev)
 	if (!csi2->base)
 		return -ENOMEM;
 
-	mutex_init(&csi2->lock);
+	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
+	if (ret)
+		return ret;
 
 	csi2->num_clks = devm_clk_bulk_get_all(&pdev->dev, &csi2->clks);
 	if (csi2->num_clks < 0)
 		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
-	ret = csi2_async_register(csi2);
-	if (ret)
-		goto clean_notifier;
+	return csi2_async_register(csi2);
 
-	return 0;
-
-clean_notifier:
-	mutex_destroy(&csi2->lock);
-	return ret;
 }
 
 static void csi2_remove(struct platform_device *pdev)
 {
 	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
-	struct csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_async_unregister_subdev(sd);
-	mutex_destroy(&csi2->lock);
 	media_entity_cleanup(&sd->entity);
 }
 

-- 
2.34.1


