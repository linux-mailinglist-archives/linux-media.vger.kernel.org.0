Return-Path: <linux-media+bounces-39163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E878B1F0D9
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F672171B9E
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B86290DB1;
	Fri,  8 Aug 2025 22:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gLmpa/BE"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80928C2D8;
	Fri,  8 Aug 2025 22:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692868; cv=fail; b=aK4IgTcr5T+4whcHTvQbITi06z5FBd0AK82MPlljY5xoFMgwcUDCt0+CleLzYt1cudVXscXdoLoVeT3KOxObCFhS+fhKjaDMfrjLQsa5YA9wLjg4n7kQmGk5AWPEX+mLs5QaOtwRjSgQPNzxAGFHH5P51PRYhuSRxpF4wOy9nl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692868; c=relaxed/simple;
	bh=rJ7QrXrcHMmxAYidmTFUf1EPyQ9mGpNP70C9vu60VbA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=muE/nDiEWqKyoqXqrm8Oupd6MOsKVDUdshWikD5anJugt554agkmewaJ+tFVMA6aH7mUjG06SDe6pZeHBIO074PWKndy7M7izNKIQXr4L3qz7iyvK1tax+Z4Po7s8jeZwJtD5sQ5qzTI5+5gmPW2WoEggYs5PXPD2r3ep2rLnIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gLmpa/BE; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgY4KkP3J79yMoOQx9+emOBvuIRJKt9D0rBzT+8DdvHe3qBI5Lejz2VfsR+su+tXOWEQpVTZAua9GpqeMWE0nz5kKG53hwy5cqUWI9wsJ1t4EwF3kup2ED7B5pcBCNqsgE6Yk1bVcyChbYb+ImLMaUJMoQaXrUoZWF+gBa+pBuFTYG5q9o1E61XmKToT5Zbl+z2d4IpJtbMo+LKVw7FvfHEV4v91ta/YcoXfDn135gUL7FfQ3v7HJIycBC3pY+v+zN8gp0qPHS0O/+tnZ2FUc9bYfvljB5FVXbfL6RTDCXbHzQB8AHn8tojOyiV2vQqLUY/+B/k9BwH8fW3fWsoz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8bxR3UhWAD+ez+Lvt92BgCLyelYrxDOCwUJSrX+B74=;
 b=xLSxqewb9SYaDJBlaCCCCE2hpV19QFOYGearTi2bQEij1O8BDVFH/FoPMT7iN6g/Xaw4/SETjigNDIS674kuKn0eO2UEcBY3zfxq4tBUhcRKAAqE0wvbpjd22YjQN1PEnm7pSsFFSFzi5ComLY9lT6IC2UX30ASV7V9ShbzEcfcnmkYvTMRHpUmcSFrD+fhUoiDupvdE01qQz5QCN5wr2lIuJIY4Qi/roTCkvPq9razrEDyW5gxtpxpCdyk2JAzwcC49J5EqMue1A3TVBYx0sNG/ToG6GNYDgXnCTQ8ZZFPF5H66ZPi3XmNiL6rMoIslUEIPYdHd8HHIHFoB/Fh82g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8bxR3UhWAD+ez+Lvt92BgCLyelYrxDOCwUJSrX+B74=;
 b=gLmpa/BE6mY0RMuCiqBDce+RpjrPTRpsMaMry87OOTx6htIIVMBpLKoieJEffv49v+dkFIuDw+OiNB+4DRyOawHeibCQRiO1jEyF1+z1G1kZGrXKXTl4ZKg7cY1p/hsxfyRrGXDjRYLfY+y2u5naGcL8LOLc7/IEPMJUp6C+Jff7ckmiznUDdffLcVP7WRKQJhDZoYLq0tpMyQKXorQMKSfRNaDo03+HKl4NL709EAsDsTI5caTqtF3beWoH7AS5xzULDu0Ve6qwK8z0g1SRia+3zHAWw49RXpBRPR+d7Kdf47F7fG2vDdcRKMmL+NUjMecyFMvlOXRnY2JKU97vHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:14 -0400
Subject: [PATCH v2 11/32] media: staging: media: imx6-mipi-csi2: use
 devm_platform_ioremap_resource() simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-11-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=1412;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rJ7QrXrcHMmxAYidmTFUf1EPyQ9mGpNP70C9vu60VbA=;
 b=QJ2KAwws4xYypaOM2xinTLMNDrPVW6HJMPsIyl8R/klK7P99A/oNXhpSSshUOI7m+/Z5dBFjF
 2DxCE8ulvIBA8c6Z5bP0Ac9CT7KJfMwnZQe1Qrs2EhIrZ5kDaOTG/Ne
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
X-MS-Office365-Filtering-Correlation-Id: af26bfe4-6fc1-441e-590c-08ddd6cca76b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eTRHblRMeEsyS0dUU1dFcUIwTzJxNnRwOXJrK3dnNkNoWXJBcjJQaGlzbnpD?=
 =?utf-8?B?WmZ4UlFUa1NncUh5K2hNVHpjSDlncXE1SHNnSGZndDlYd0lLaHhhc2FkZHRU?=
 =?utf-8?B?bklkL0F0N2Ezenk2M05sUWplSFcyR3dhQURhNnlqZGFZaWxiSHlsSFhJb1o5?=
 =?utf-8?B?OGs0Vy9QMEExUHhlT0txb3pEeFpTd0ZXS1lvVFNvSk5QVlNrUm1QK09IN0Vp?=
 =?utf-8?B?UkNYZmQ3Q2hobVM0VEM0S3ZWM3E0RDJkcExpdVRsMXl3UFdnR0J1b2ZhSWh4?=
 =?utf-8?B?TXJZNGlLUWhuUGJGR3h4MmovTjdjbWFwdWc3cld3UmQ0eldHYmgyNzBxY0ho?=
 =?utf-8?B?bUJlcUhncHRid3pidFZsVU9jN3hLSVJ0WVVqR0VaNGJEdHVFQUdLK0o0NDRH?=
 =?utf-8?B?L1dQeHBFb2xEcFVFVWdSVW9aQzNpWmRSSG9KYXgwbFRWOG93eVQ2ejFTdHRF?=
 =?utf-8?B?MHd6ZnhlbHNUM0ZXZXdFZFR5eGsrSEVTbERraUF4YnppdlhoVy85YWpEdytm?=
 =?utf-8?B?a2tYcFFsRHgxN2hLWVdZVTJYaFNKWjk1ZXVVNjdUeTZ6VHBZb0FKOFg1eGR3?=
 =?utf-8?B?dUg5aC9wY3ZiRGhhdnk4K2xTMUo1Z3VqamNxMkMvekFTT0JraDhzRVJTR1R3?=
 =?utf-8?B?R1lKYlQ2WGp1eTlIMFhLbTliQUF3OCs4aEZUNlo4MUxySFdmd0V5Y0oyejg1?=
 =?utf-8?B?MUE5c0ZKU2UxRlRGZGlnYjFkeTN6N0NxQnEzcEJmWUlDZmcyOEhYekE5OVdn?=
 =?utf-8?B?VmJTZElmcDFodE1OMENwcVpLdWM5Wmg4dU9BcUpYQkh0N0loWmtIOC9UVzRx?=
 =?utf-8?B?andsczE4UVIxek5Id09GenA2MXhmWnFEWGVadExjUWJudkZCdVI5NFhtT3ly?=
 =?utf-8?B?bFRmbHdiSjUrc1gxMy91d2xPMEU3b2xnRWtvY2VVRk9iYjBQd0k4MG5LVkFM?=
 =?utf-8?B?RkRZYVE1a2E0eXhZa1RPL0VhOFF1NFI3QzIrbWRLSVFUV2tDaFVvQzVsSlBj?=
 =?utf-8?B?VFlxaXV3VHgrSzNIUm9rcXQ4ZlEzYWMrdWxOZDN1YklqbWg2dGtMS1RocDJh?=
 =?utf-8?B?TXNHUFBpNUoxNkxMbXh0MmV6SUR5cStZY2tIL2UyOFc3MEoyM0lTWmxTNVor?=
 =?utf-8?B?S1B6dDVNbkRIa1QxNnVrN09GcTBqSk5rT0R3c1pzc1lTNDBudXRrbDB4eDNX?=
 =?utf-8?B?RkNFaHlIb2dFd2k3cXg5d0hCWFk1ZTI5UEhoaEhkNWlJRHlCdzFQTy9TZ1Vl?=
 =?utf-8?B?T0tFazhWd1ZDNE5vQVpwL1p4Z0FnK2lLcjF2OHozaGhPTE1oWDcvd05VaCs0?=
 =?utf-8?B?TXc1UjFyZTdtVTVhenJ5T2ZmZ2FHaU5sQzUvdmVvalF1djgvTW01eG0yTG0v?=
 =?utf-8?B?OFdXTW0yUU04SFEreGErdHM0UlVTTFRMaWJKaWg0VTdVS21lRksxY2VCS1JG?=
 =?utf-8?B?MW4xTjlGOXVvK2ZYK1dVSGt6VmlNaVA0ckhsL2RkRlgrT21ta1JGUmpUZmRr?=
 =?utf-8?B?SkdwbmQ2N3RDUGw1KzRqUEYzTUEyUjl4Y0pJQnlNSGtKWDAyeE1IeExOY1Qx?=
 =?utf-8?B?cUs0em1SQnhjMzNQYzV0YmREblMxaklzdXlOTUxyWEJ5OXRvSUt1eGxWUStP?=
 =?utf-8?B?WGpRN01pWWlHTzl0ODVDSXZEZ2tpQWdZckpDeWN1L2UramFDZVR6Y3VmMFk4?=
 =?utf-8?B?QXRMeU4rWnNDUm50NVZxRXdVcUlRdU44eGdDeU1PS2E5c0hmcDFic0djSDJQ?=
 =?utf-8?B?aFdZa1NtSXhJazYrZURDTDdhZDJGN0NLSnBtZytNQ2JiVHkydTVKY2lpdjJh?=
 =?utf-8?B?M0d4Q2RxWGJWV284Y3JCRFVNbS9ycHNFMFBVdDRxSXJaRXlFWUp0NGFhbHN6?=
 =?utf-8?B?TnBOUVU3aVEvLzFoWThlRmU0QUtNSkRYTXFzaFZXdlVxUnJaNmhacTN3RXRP?=
 =?utf-8?B?SFgxdTVMMnMyTDNuNWVpRHJNMU5YSk5lRmF3RUdUV1VPOEJGWDIwOXY4UUln?=
 =?utf-8?Q?MxbBJSezG3an6q9fvVFPEL29HR+tkk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NXlsMDJEdkFQNjdkRllMTHErZXlxdFV2LzRhZ2U2YkxoMGxKMEp0NHlMODNB?=
 =?utf-8?B?OFhUbS9tb2dneXJEYVlqanI2YkF6cmhIbm9KQmVCYkVoWHpET2hkMy95Vk1w?=
 =?utf-8?B?Z2VqSmJIWVU3bk4zSjB2RUJLcVFsbE9uZXVvMnBtZk10cVlja1Y1Z0JiMThu?=
 =?utf-8?B?ZThpdkh1L1hHNWp2ZnR0WndGZ2NWQVRjamQzVmNPWjQxOEtUSnFmRE14eVJh?=
 =?utf-8?B?SGJIL1dGSnNRUHE4Nk5tTVBvYnptV3VKeUVLd3c5VC95VWo0dHAyRUwvTHZS?=
 =?utf-8?B?NGQvZlVZRy9pNmxWdUZoRjRaRHVlaFlLL2cvenF0Vm9jdVJiSTFYMnJVV2pB?=
 =?utf-8?B?OVliN2xsejhCVW9yZHVGOVZISnhndlZFUnEvRjUvSnE5YnlXSWE4dzhpUkxQ?=
 =?utf-8?B?VnBNUzdDUDlUcVF5RkFPaVFlbzFFbFhmZVJudWNXRWxTNlA1d21hMlprWEEr?=
 =?utf-8?B?VFpGekdHTmxydE03RjdSRXo1MjdFTDhkUVRWNW9RMWNybWVXVkhVejg5bXor?=
 =?utf-8?B?d1pYNTI3ai8vaSs1c0NKQW9Icml0RFN3WUxNbEZQZk5DZDBUOUlRWlBLU1JR?=
 =?utf-8?B?L3VIYlVyTWFKekdxVjFNOWlTSXF3ejNUMnFkL2VVMUk5Qjcxd3AxMENWRnlm?=
 =?utf-8?B?aWR2YUZnYjdMdGorNjB6c0J1RXB1am5WVkNXcEFQeGlzc0NSQ2hLK1NHSFdM?=
 =?utf-8?B?Zlp6KzN6a3lOUUl2SzhOZ1NhYVc1cU5aVXh5dy96eDlmaWRocjA5UmIwa0Fv?=
 =?utf-8?B?Q3F2VnJYZUhoV042eUltMTVXNzNyV2F0cmpCeHpQZERRVmdURWhPdW00Mzd2?=
 =?utf-8?B?K3JISHJXUmd0MVFmOFBncENYYmVEc0FPcnVycUFxTjd4OTN0cm1qNm9OSDdR?=
 =?utf-8?B?QmN6L0NDV09CbExTdHF6dHNJN090NmhGSElPSmlsQzZ2a215Q0Q1b1ZsN3RK?=
 =?utf-8?B?MnZQZGwyYkJ0ZGNZbkNiaEordEZQSGRnVnRxa0s4dUtYeGdtZ1FYN0E5S0pX?=
 =?utf-8?B?RnlleWozekFsRFA2djZmOEl6TFA2MC92UUIxc0pkSjU4L05IWFJoQ1MxR283?=
 =?utf-8?B?MTZ1NW9wVWYvOUpMRm9ISHhjWVlkVEU2U0s2ckNhekVYTmd5U09qTTQ3YjNy?=
 =?utf-8?B?c016ZGl6d2ZCUGpHV2k4YXRKZWQ3OUUxQytrWUtaOXA1eUZHOTNZREVMcEpV?=
 =?utf-8?B?cjQrYnBIN0pkUnJJaytYcXBtZEFoL0V2d2kzQlJSVVNhNmpJQjBXZ0dGaGU2?=
 =?utf-8?B?R0EwY3AzZklxT21XbHJyVXlnZDY2bEJWTEhRNHVLSzdUa0VkOHZtYUZ0Nzly?=
 =?utf-8?B?eE9rZWZ3bHZOeURJSGV3SDRDdGNhTjNPbkgyNnBpNnlmVWJBOVJpN2Zsb2J0?=
 =?utf-8?B?ZE9GV09kSExsdWhlbHlWdkMrRWNsR3N4U1ZBVTZpWGorY0dTNGxtM0VnSUVI?=
 =?utf-8?B?RmxiOG52ajhUOWtNWXFzUFR0Q3d2OWRkTnlydTBCM1BmYUowaExjN0QvamJL?=
 =?utf-8?B?VUNnR2w5a3l1RVFSR0Z3V2tYVHpHbTBFQkFZTVk4VzExK0NZeGdxQmRhZU1E?=
 =?utf-8?B?UVE3VElmV1dtL0xFdVNJanJlTnZlZHN4eSsrVzdscDhwcnk3RTU5M2ZuU0Rl?=
 =?utf-8?B?Y1ZZbkdvMk9XVFkyZXduYVZUYzkrVzd5OXA2cE9ZbW9OT2pVelNlcXo2TnZj?=
 =?utf-8?B?aWhzOEtaSWVOSWhUN0JaKzlMRmcvSGd0YyttMjRtYnBTRmVDQkVHNVMyYVNP?=
 =?utf-8?B?MUo2ZHJIMU5EUFBjSm13M1pLb1RBYVpNQUxYMXlTclJEeUFSd044TmVrblFs?=
 =?utf-8?B?K0JoVllVemNIMnhxWmgzMlJ1NC9DSHBnWUJ3UEphNGhsNmFkRU5jYWdFVlZ2?=
 =?utf-8?B?VWNWYXFqVUFBRUJEMGZ1SUtUNmdneGN0TzZIOE9XZzl0R2Jub2h3SWVXN1gw?=
 =?utf-8?B?dzZQRDhtYW11anp3SlZ1VlNOc2UrS0lXbU0zZzliRXBKYWlmeFZvTUg5NlVq?=
 =?utf-8?B?ekJLNFdNNkoreXB1azhCTit2MEZ2dnVtV1owSUh5TmxRRDcvRmE1SGYrclFx?=
 =?utf-8?B?K2JVZjEyZXc2aXA1ZEFEWTVDWnlnQmhkZ2VVQ09rQk9Gd0RlT0c0cFNnVVF4?=
 =?utf-8?Q?dWqcd/lmxMZVovKsTjaVeuFak?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af26bfe4-6fc1-441e-590c-08ddd6cca76b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:02.8952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jj7JGTf21VIgS8VhNKUBtlMxFAj6LAKhP4wrcbU/EJzgejCMSsjoWBblIelEA/OLrtp6pY2WylW1m4UHoXT2Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Use devm_platform_ioremap_resource() simplify code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index cef9a5dbca40c94a36d5d8473d3b7d9806381bf9..3956c352a27ae6d962e74a4ce7733946574668ef 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -738,7 +738,6 @@ static void csi2_nf_cleanup(void *data)
 static int csi2_probe(struct platform_device *pdev)
 {
 	struct csi2_dev *csi2;
-	struct resource *res;
 	int i, ret;
 
 	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
@@ -772,15 +771,10 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		v4l2_err(&csi2->sd, "failed to get platform resources\n");
-		return -ENODEV;
-	}
-
-	csi2->base = devm_ioremap(&pdev->dev, res->start, PAGE_SIZE);
-	if (!csi2->base)
-		return -ENOMEM;
+	csi2->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi2->base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get platform resources");
 
 	devm_mutex_init(&pdev->dev, &csi2->lock);
 

-- 
2.34.1


