Return-Path: <linux-media+bounces-40748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57262B315EB
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86868A01B4B
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7F92FB622;
	Fri, 22 Aug 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZBelq4fp"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230042FB624;
	Fri, 22 Aug 2025 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859882; cv=fail; b=JYJAIxRTfSPD+yGTLygY6J49vm7HfqjBtjIAmpCy9PkXeEkmzivrh0vC8N64+nHLT1X3N+worCEgcA25PsBgw5IkP2nUqjUk2S1RRGBxuDTdP8gEed+8Ca0pdVBMP6jYIKDXAx1Hf9UM3kzy9f2LrUmQpxKInsDdbHFVoooZxjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859882; c=relaxed/simple;
	bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jcyr73zD9Rm1rPWn0WNcRrvx8Hkh1bFsF5/gqSyYgo7RCfR61x8H/usf2xHoIg8gDdt+Y6J97Z7bQAi3gELS5oChPEMxmZm1bQAAFnUWPpNkrdnFDyZ5FF3H0U0GrDVOcJlDfZNOJPGcYp7FWSbuBmZxn2p31Igp7Khd6XbzJDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZBelq4fp; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJ07CpZmz0LcRoRucdeOCSgU5vaEKyaW/2czUdmvUkMFY9xQjyh8Ff0uBQAqx7iemJN9sksKdSqXq4CNfGACG/SjRhXrUi5MyitZmUE+8iiN4ZEfMrhQxpvmIm3kTyKPgsIOl/kCjEQdv9+dwKZGv/GW1GhwdAsM+bZtkqggTHx3u3CHQAIYWADNKHd9xKNK5MTGuEDDjlUNVt9Bud5OoflTgmMaiGrP6EFidc8N+ATeaHqIFatc5cSt1Ye+rQDX3oZ9vtvmfyNUL1n/2MJNpsZaFVSxv5P9dAFYQg2nReEvzvUYCLVJecN0IjWzGOvFucvWy1mTWqsq7DM5MF/G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=D+PvsBJIoZRnbK1Xgw8vliIfQqrhdAWoEyL0mHLuMK9sJNNSMLu6uTWocg8t2fqBwVeDoTCh28n92KWCxuj+pk88ZQkhh2n8cEMt6XB2KzMX9626KG9QQWbMltFxnJ+sU3RwCRei3/iE1V3sPCzs9AbHzeXEXO8Zr5h89T7aesKHzOQ7A/pVLtpxsK+biwoz5Xc8CLhDC0K1mHuZdpULC0+ijYM9Ns2ITYfQrPgoGIDqae9NRGZTCZ7QhcDxsfpMJHsiJ8vgAYuotqu6wiF6gNo1pNjGkJMOeDt6WQIRWTVnHMBIphvZrtNuAAbmVqK8HcT/3YPiiqQQ0K5AvBh24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqW3lbwFPdW7MMz6SF+YFhWAktKZtv7wW9Sr40tBYeU=;
 b=ZBelq4fpzyzuU5EedHa2aGLkk1pNXsKgYz97a+70wJOCWALq6i/QDnpf3Xd0NxoKwtdPsbjUrL7+NXyzAtXTlCf6LcF7A41Mdxw+8S7/bpx1wZR6JD7jhXZYO5sCKCKg0A0MR6kHAzHlNp5KquZGapH0hKpLJY9BfS345KdmvpOsxDCMn8qyMMTV79nWZ/HVLeS5gAVEPdJaFoWC+hmrl7UsLg2w2zVJ7+0C7oqwT4MkOb0Fqz1qfkyFo5zXJd8x150czEpHPvR1UVg4WjIVlrm/08uTzMGm+jiCDdzTojgDaa8av/jGT+jS00N2O3FqToKmN/jbkU3+BOmDvit7EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:51:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 10:51:10 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 22 Aug 2025 18:50:13 +0800
Subject: [PATCH v2 2/4] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-csi2_imx8ulp-v2-2-26a444394965@nxp.com>
References: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
In-Reply-To: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755859853; l=3924;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=0AVVXE+OjkLsObQx7EyYcQBVkLrBIL95byUmMC9N880=;
 b=1MD9Or1zZ6zOCh6Hro/QLUmkXmpGy0SCv/dXJwvLuex2ugUfOVZVBdmVw15yy02JiIwATP2ND
 4yXUXDMJJpmBvdFR3eXkCJ1jwsrjgTzVzys2gDL2guYxRkrqwZVFow7
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcaaf92-92ab-4a8a-8c87-08dde169ce14
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SVNqVEVFOU9mSytFdmcwMmJNYUFCTDRaMHdOTjFhdUcwYjdocmhhVlEvU2Nj?=
 =?utf-8?B?MjVhcHF6ajNUM3dNVktVSnpXcmxXMlRUVWNDd3UzTFU0enpuemxjdmR0N2dL?=
 =?utf-8?B?YUNRazR2Y0xlVUFzWVBSaFlLK3liWkZHUG54RHRzYllBUkFTNzVKYlBPN2x6?=
 =?utf-8?B?OFlVc2Qya25aTXRpOE9yUWVLeWNQWVdyRy9WbTNQM21UOFpPb0dYQWl5QjR5?=
 =?utf-8?B?VjA5K3RCV0hZOTIwSnBqVkdjTEhLc0V5T2lWNHhycyttRjJjWHpud2pEUHhT?=
 =?utf-8?B?MXJMMFpuUFhWdWU5QmhLVHg3TFVmQlVZT05IUjgyR29zOW0vSXc0OFhERlZ6?=
 =?utf-8?B?U0xDOFQwMHhPRVpEaFF4SlE3cGVEZ3FmL0Q3NnhtSXFobko0bkQrU3UvYmp1?=
 =?utf-8?B?NDB6MHdmR1lMbGVUcmhEenJwZnM1TXk1OVJyemFZOEVKUVIwbHZpZWVmZXBO?=
 =?utf-8?B?WTM4MDRNSVpSK1dFWVJ4QUN5b1RXdXl5WHV1Z2xoaCtBcW1JMnUwMEltalNM?=
 =?utf-8?B?Rk14SVhDeW5vdTQzMG9tT2FjT1NaK3o1bEkrVTNmayt6dzJpTXREeExodzdz?=
 =?utf-8?B?RXdHYjNkeVFkOW9ha0g2WEQ0dWg4MWErb3BrcFdncHozZHZQUkFjckdLZFdP?=
 =?utf-8?B?Ny9wYjkydmFyaG1LOHppUkhiR1c5ckJsRzRlY1NhUmswelFuU3J4MU1nN203?=
 =?utf-8?B?YUd0TUNpeW9yTklMS1JZU3dzOThhbVk4UkhlV2xaVU5WTWFFNmswRWQ2N3N6?=
 =?utf-8?B?UFdWZjJJZVo0cmlDelM0Q2lvRUNLd2F5MTVPckIzT3ZnZWNnN0FncTBHSito?=
 =?utf-8?B?cDlWdTV0cFkvSVk1TFdIUmozdjJMNUwySHNhd0V4N0QwODZuaC9tczhGMlps?=
 =?utf-8?B?bzZqSVJxSm1pVVFncERjMnNtTUZieTNTYWdmTEJpUk00UVJNZ2lKd3AyUytr?=
 =?utf-8?B?M3JHM2VzcE5FN3Q1VlBSZnVsMm1rWE5CZVovRGY3MUlnYk14YWRLanZCbmVV?=
 =?utf-8?B?RUJCY3MwejFPelM1UERmNU5sN1pQZER6dVRVcDlLT2I2Zk5UUzRGU1NNdEtJ?=
 =?utf-8?B?cW9EUnJtd25hSjRSZ01LL2pic1JVTjNJSVBPZ2prY3gzNmhKQmZWc0draUli?=
 =?utf-8?B?V1J2b0NpaVNNRWZ3ckVBNDl4S2YvemladEhlKzBOMm1ZTDArVkJaMUNjQnRI?=
 =?utf-8?B?MHUrS1ljZTdFZ0s3QkhrcVp0VE1lMXBScTkzVDd2bHJXOW5pcVNxN0pheTU5?=
 =?utf-8?B?NFBTYjFYM0JDYWkwN2JkZ0xld2VndnhScE5uL1BOQmZNNDAwaXJEbnUxU09S?=
 =?utf-8?B?QkoyTFFhUjU3VEpqVXFaK0NEc1ZKM2lVQWdQcGdjYW4zVHVOdFgxdUJSQWJJ?=
 =?utf-8?B?YlpiU1NBKzlqMmJGNkEvUENLT3BQbTdtM2I3ZFpVSzA0SUdkTEtPUUZwVVo5?=
 =?utf-8?B?Q2g4cVQ1Z0ptWHQrOEtaSnlIRGlkaHJXNzZKcjc1bWNacVI1TitXVWRHSzl0?=
 =?utf-8?B?a25XYWJza0s4VG1EaHdXTDJvbnZJMXQ5NWdaQnZLbnlRbjBJMG5rU01QbWl0?=
 =?utf-8?B?N0h2R2x1cERWaTNHRVp6YkNscnlLUWFRamF2ZE1TcHNIMmRsL3lCaHRmWHVq?=
 =?utf-8?B?NlhGUnlUTlRHclVxMkoxTzRIWDUyVi9reVhHWWpQZTVWU3pCUnJRYWpaNlc1?=
 =?utf-8?B?VHI3clljYUZITnljWGxHT2d4RmlSWWNZSmZZMFJmK213WWJkcmNuNWdPL1Ft?=
 =?utf-8?B?UEhWWDk1VDNGVlFZalF5NnBVRUpiejdHQW5zaWVmZnMzclhvdUlBY1EyeE5w?=
 =?utf-8?B?Nktha3gxYmxxcWlUVkkvcUUrcmJTVDh0emo0b1hwL0R6cWFiL2ZQbjkyOUVi?=
 =?utf-8?B?Zi9rMUw0WWdDZDU0dU5ZSnVXaU5tbEpqYkNwSDkweVlZVFlNM0JyZ3EvelA3?=
 =?utf-8?B?bER0NUlna2tJRndFeEFaaTUrcXZ0VHFCSFllNTg0Y3J0TmdrbVFNSFRNSjZl?=
 =?utf-8?Q?n/JIWFvtGrwi4eBiiAWmWhUSIRis34=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NUl4VUJiSkdXSlRoWmdYWkR1MHJ4eE1JcXl2UkxGRy9DZEc2QTdiejZKeEFN?=
 =?utf-8?B?eXpFQ2l5QjdacmlaVitMOE1lbFpBUGJZZEgvQkRsQXcvYmx6cEFLVGN2VTFU?=
 =?utf-8?B?QmZEL2tpWkV3ZVBCK0V6dk5FdTJQZVV4Rk8vcnc3WlJ3MDA5bURQYytUc0Ur?=
 =?utf-8?B?NGR4NTZlWld3NDBxY1hqcHFwUWxMYnFRWExXTDVRb0h1Sk9ZbWZXZ1BpbmVO?=
 =?utf-8?B?YXZjdmlpQU9lTFNYeFBveTZNZ3dJZ2hIRjJ1aVZnVE5vUEhpb3p4Ym1QK3Mw?=
 =?utf-8?B?TU8zZm9haXpodDBsdCt3Nzl3Tkc0U1RDcEZJSnVqOStOQjFxTzJDbHJvclpJ?=
 =?utf-8?B?VXBtNkgyWWNUS0FRQTBEaWpjS1Jsb3JxMVFjQmdYZkZxcmlMUG9QcHNiUjA3?=
 =?utf-8?B?SklsUm9rRFJKUUwydHVOcXovbUxuRTJGRXhTeDMyYlQ1ZXVwRVpSS2h6Rmdh?=
 =?utf-8?B?NnUwM2trem51RzE1MlFlQ1FkcnFwaU9WZFNDdGVNR1dVK0tpclQyV3NSMVFa?=
 =?utf-8?B?eENtdWEvcFdGcUFIMzNXVEJ5ZEJLYXlVVmxaazhrWVNFNDRWb0s5WUdTWDdh?=
 =?utf-8?B?NFVza1pPYjBld3JwaS8vU3dpTlRIM01tbWVHdHJXeVpRRERaZlkyY1UyWVpn?=
 =?utf-8?B?SVBsL2d2c0VURVZQT1lGaS9uUDFBM0loWm54ZUNyUnJjelhhS1BnQW5tNnRv?=
 =?utf-8?B?SUpoVy92S0E5b3QyeWxFamRGN0NjQWFLbFNCb21oUnpnWmw3SFdwWDUvendy?=
 =?utf-8?B?Zk16NjJoY1pMU2lpY3hxNml5Q0Ezcmk2cWpzZUQrTlA1MEpwT3A0VTJCcVFW?=
 =?utf-8?B?Q1JLdFJXQjI3clJ4aXlkcTN6alVwRDZmRWhHcG5DZTV6T2FyV29XaWVzWXlh?=
 =?utf-8?B?MExBdFd4SmlIa3lZTXozaDU3Y01rR1BUcGs1WlN1WWcyZlNLeHBmNlN2cnU2?=
 =?utf-8?B?T1NPZzl6b3FMcElHY3JZeWl3cmppUUVVVTZVK3dxTU5hNi9BdDQxbnJJazJu?=
 =?utf-8?B?aHZQZXRBYVFIbHlJODlwNlBBRjJzQ3A5M0c5S1pockRrWi9jdUw4RlROajRU?=
 =?utf-8?B?cE9jZnBlUEluajdiOWt3Si9rK1licEJUWkNoNGJzMlZaZU11bERaRHJHRFNV?=
 =?utf-8?B?ZXFjSHpLbEJLR2d1ZHA4R2tHR1AwVlJxd3JpQXZUcWhhSjRPNUM0NGc4NTEz?=
 =?utf-8?B?RFM4WTNpaDNlc3RhTWw0N3AvOGlWRDF1ajdFakZFNytUUis1V3hiY01IRDFP?=
 =?utf-8?B?S2l1Ulh4NTJkTUdBb2lpb1Fkd3RBS0EyQjkxZUM4Sk1Tbnc0a2puOFdVTytD?=
 =?utf-8?B?cGZPMUFmQXJtM2prbnRWaFRzZXJmM0djTkI0TDBxalg3MDhPVE1VZnFCSU5a?=
 =?utf-8?B?RFV4RGFsVlVURW9kak5DVzd1WWJUN1ZGb1hDbDMxUFU5ODMyQzQxTlgrenlH?=
 =?utf-8?B?ZUt2TG1CUmJCNktRYnIzSHNlaUNxK2R3MHFvaW4xZ2NPZ0o0a0JraHAwSzlB?=
 =?utf-8?B?bXNxOEVxQUFreEZ0UmluRDl4ZENhOUNsRDB0Vld0TllBbWVVQUlJamFQVzU0?=
 =?utf-8?B?NWtmZDRuR3dvOHBKb1dDQ24wNmJ2SXBycWh3K3VhbnBJVVJIYmFCTUhFSUFt?=
 =?utf-8?B?KzFScGV6U29vY3hXT0l0eGhNdTJsanVhVmdSVmFMaUcyTGpxOTFQNXFsRzc0?=
 =?utf-8?B?OU93eERTNjRWMUdYTFF4VUZpeTdHM2U2MFdpU2ZSMS9rWjFvL29lUERBSE1l?=
 =?utf-8?B?b0UzWDIyVXhzdkRWQjFqblQ1ZDFveVVqMWxEMnJXVXJlUDQvVWltN2M3VGJW?=
 =?utf-8?B?M1VxbDROUFBDTVdGNk5QNW44dWc0elFIMTRGbTVXdjNaY2JOdUp0UG9HQ21n?=
 =?utf-8?B?ZEhPSjVGTVZKYXEyRU82OUMrL3NRWkRRbkgzQVZ0TlNMcmp6RWhPYjF5TWRn?=
 =?utf-8?B?bnlIV21VUHZEWDdLUi91aW1HN3FVYlFoRGh5QVRHcnpabTYyVWN6ZjFjald4?=
 =?utf-8?B?YkJBb3orMGFsS3VTK2NBemRSODhtS2RqVEUyMFg0VFVnQjQ3dmlLalNVNFhx?=
 =?utf-8?B?cEJwYnJYTjUyOHkycXJ3Mng3VWZVamlvZFdLY0ppZWQ3RzZRRGJNM0RoSDNo?=
 =?utf-8?Q?qnn4f6XmmdRB+11LpCcLgco/M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcaaf92-92ab-4a8a-8c87-08dde169ce14
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:51:10.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VR66ZDlUMMDuZbDfdTcG5SN9IIIoFV1m1BcuXbiVstFNI2qeHL+gd4AKyC0Zn0e2pYVvp76rM9H0v7FJzCOBIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207

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


