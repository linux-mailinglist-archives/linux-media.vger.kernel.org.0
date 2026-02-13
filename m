Return-Path: <linux-media+bounces-52784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIRqImeJj2nURQEAu9opvQ
	(envelope-from <linux-media+bounces-52784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:28:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41713968B
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F37F316BAA4
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D865286D5E;
	Fri, 13 Feb 2026 20:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Uwy7U7qz"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA45283FC3;
	Fri, 13 Feb 2026 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014362; cv=fail; b=O6X2IJ77vWZetbrLl3jsBWXmLEVfyanPXIuNIC3jFZrTP8USiy9fCNfmnemQ9vis5sM7AvFARyBhqdVsQTAYFSU+XsdWJtOCN4m6DEM0UuQ3TqlAum4an7hLHYEBikE8muUFyWMCGWzUis24Zxz3nJr8qeqBET7QtDfMzAEP4g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014362; c=relaxed/simple;
	bh=T+N+B64XXm+xEEQgF3hxG1g/2x45ysK/l0AVQVrzHNA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S76W+rgY6ms7ORUYFm3WpW1dxTY7TD30Mkb+L2SohEnuDhZjjzrgFCVqLCoGYBzygW69fttLTB7WH+0zhy265ZlrevN7AgJtJNhvqB4LH3mOLKbWMMWNzt8FmJ/T87mWwe6FC3E8CkM71OvZwSh6H8mRe4UxhSQs0LsDVSQpvbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uwy7U7qz; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZjPVGlIzPJgt8Gl7H0ws04TSPkFbpe/Tux+yr2rpC0k1PktrxZASFg47mx9ZZGsTQfcmKDbihtGcEt+7lDE8jPQ9AK2HHXFOWpQe9OIDElqcV79jS8KxAHjZobNHdC522loyRxYMVAAV8Q3fxiZZiNX1mlgVqd5PApSmz8/VWuS92h9uY5MmOs/T5QF/+J48035iSzQscT1APBDtYZN9oyX3OXyrCvBvyVDF6XwlVVoJb2osPzrUK2yl2xXN/ZZfl4yrkaLabOxs9aHKyyT/BBqBMz0sy2y9Kfx7ld9o9xIp0gtJyjQlohrWT3P178/eY3M8wH29MyenooFFDsu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3GPHKcKvEUt8k0pB6eyLaqKi8wJVBM8rvxzuDinhOY=;
 b=HWffJe8g//YPNhEfJKhtj3qxPjybiaUUmIFta/cQSZR7xMRa61vqgOXOT5WL4WdEihsauBXILJW/cgxa+e6waVvjQArKkHy10dvyToScv4BxDDNvi4sO5F9dh9ZCcAQjWEyd9FecS9bdIJpYVumPwZBDRb0SUhGtT7yKX8mhxRLccKxqdU+nyj/LDcrgxvzb5GDPL4ECJzarI+XuwR+mS0N7L3i7JR2Xh8Tt2GNAV9Rk3HHCJ2DGPjxh2y3+nYpiZKaEikhodr6ASJPOooSnxZFjI86GBsGic5kyTAub1Vqnq6uM++yXAgaM3bRRkEMORqAx4DKqgim630K6QSFfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3GPHKcKvEUt8k0pB6eyLaqKi8wJVBM8rvxzuDinhOY=;
 b=Uwy7U7qzRRfi5Zr9zNK/hkUeNr4jSmp7ciGHkKOODCRhnacMDqbKD10MV3dZ3GswbM46B12dhOdAGueg1rVmp/+iKAKcFXBUkvMrbZlqNqw1Lq91y8O+X+Fi2aas7Va1+DAIZm2uXOMERYLrc+GpQOO5kh5EfDgwPKM2VjyRNCYdLIVT/LfDUiSO1FpDgCzxEhNxCjXOj8Rk1rHtUeYK6Wzv0zHy0lK8vT73KXDq33+ltoTrypozYTqXLxfkIq80uwCDB8WvgfeEh7wMJ8purA6nYYhSki6Z/c8+kMPb3ZM2S5Pvp03+zpLI8ukbsTDQpcExhJhX9GAtbTwSm6A/Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:25:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:25:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 15:25:13 -0500
Subject: [PATCH v2 4/6] media: synopsys: csi2rx: Use enum and u32 array for
 register offsets
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-imx93-dw-csi2-v2-4-8be6039f44c6@nxp.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=5258;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=T+N+B64XXm+xEEQgF3hxG1g/2x45ysK/l0AVQVrzHNA=;
 b=Ek0SlnwNXQvD9l+N9e/z62P/xY6FDxyozv9E+lIJJ3+LNblhD4W/SfOX3sJzIYbKQaWFSO2Bj
 NhH2I7wMJTUC1ddhyg5VxwN4xxErh9ieihLrnKiNuvStIIuE9AMNrlJ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3438e7-6d37-4a89-4083-08de6b3e1800
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?U3QrR1gvdzdrRitENkVTcHZGaWJBMWhQMUpzWDVNd2Z1QVdIenBvcUlsdWtS?=
 =?utf-8?B?NzRMeVR3dmhvTGFEei8vUDlueXdRTTIwTkNWckk3VlBqTlgweEJkZmsxUEov?=
 =?utf-8?B?U3BiT1p3cklPaUtFZUZIcmhHYkdFdWZLL2tKazZBb3F3S3FYUmRaK0FEdzVU?=
 =?utf-8?B?dytFSUZCZjk5RE1sUG5ZeXZPQkRmMjJBcHIzNEVaRVdWZTFjK2lla0RGTk12?=
 =?utf-8?B?OHFjbHlZZ1VpZVNJK2VaOVVzV3lmNjc1bi9FTEJRR0hWamRYeDJ6NWJqTity?=
 =?utf-8?B?ZStYdi8rMTNVMU95c1NCd3lUSm0yakptYnl3dUkyam5VNW00WklaSUorVG9F?=
 =?utf-8?B?M3REZnJVR2JnWGtQd3VBYWNDWGF2N0dkTk0vNVNwdnM0dzZRRElXY3hOeWI3?=
 =?utf-8?B?ZE5xc1A3dHo3WTU1MFpLNnFDbUpjVStZQytGMXIza0pWSlJCWEtjbTVGcmVP?=
 =?utf-8?B?ditMbU54d3Nwc0krdDAyc1JzazZuYlU2S1ZFTm5ieVFxVnhpRE5zS2FmRHlw?=
 =?utf-8?B?dWRSOWx4Smt2M0p0YVNvSFdjYWZ3SzFYR0hBdWlLYjlPMFhPdVoxSVI1a3pi?=
 =?utf-8?B?emtkNU8yK3Qyb2lBQUdtYXhTZUN0SjAxTExkTXNYM2cxWkM5QWdvOTFzSlZ1?=
 =?utf-8?B?YzJTY1kxQTMweTVIRVhESndHeTVabVBaamFwcHlaTnRNSFRmcThTZGtxVkJ0?=
 =?utf-8?B?dlNDZnJBM2hTVVRPR3djZ3JPZXJieWR6Y0lQeWZPdmZFQUtXRC8wNnREcE5a?=
 =?utf-8?B?N1hETUpEUllZV3NQZGVvOWFSUUtNRjBQemhLNGlLeXJScDZUcEx0QmM5SUNh?=
 =?utf-8?B?TzUydkVnQUYzcTZpeWNDR0NSN3JCR1V3cjJoN2lRZXFRMURzRGZWb29PZzFY?=
 =?utf-8?B?bzdzNzZZUFR1cFdzaFNXYXNiRUpxbTJzdnQ3SmMyNm1haGxxc0ViaHZvbmhC?=
 =?utf-8?B?REFkcFF3ZEZlUlZFenREdmI3ZVVkSXNkZlg3Y1JlQkdtbWpRcDVLNTNoREdV?=
 =?utf-8?B?VnJIL0NKSUlqNy9GdnN2NENFNjNXd2lXZVpaVXVNcWl1R3l2YkdDTlpxdkRS?=
 =?utf-8?B?N245THJycWpEdzRkTDBwMVk4R0RoZVhlYjBpS0RkM0I1TkoxbTlTOWFieTJ0?=
 =?utf-8?B?czVlUEl1ckxrNk1FeWEzMnBlQ1ptUloxeWVIa1lhRTlTUEtoSmhIbTUvVjlU?=
 =?utf-8?B?RVhrQUxtU09zL2t2Qzk4Q2VMUWIxV2o5VTNZMG81d0lVdkltcyt1NVJEK1VP?=
 =?utf-8?B?T08xWVFFNkpOcUNUZTVQUUJhanpVWEx5WlovTXFTWGMxaDdCclhvdEdXbUxE?=
 =?utf-8?B?bjh2Uk5JaVhINmFWbTZwQkFyNms5T01wSnVHNGpCRmRqV1JjTElpa0ZOWXpk?=
 =?utf-8?B?Wit3R21LVnhoOENzbzE4TGV6NXVmM0lOSmxqWWM4RDRiWEMxVlUrMEQwQUpN?=
 =?utf-8?B?c0xtQXNIT1doZElzY0FPN0hkamtqT0dVb0g5bGhTcEp6Vi81dStjalRBS1BC?=
 =?utf-8?B?WitlUzN6Z0ZwM2tsR3BxVTZoeDBUOWVQTUNWM3loM1hVR09JWWluVGFpOHJX?=
 =?utf-8?B?YkhxWFVoMG5qMjNQT0ZoNGl3amdqaDQrR3V4VWV4S1N6R01jYWdDbTd5Q3Nq?=
 =?utf-8?B?UlQxd0dIVjYyUm9nSUdKc2tLV0dsOU9qbnJBUSt6aFVNWGpBa3dFNnJwMHF5?=
 =?utf-8?B?QUdDeUI2TjFxZnpmS1JFcVJzZGhDbVFGby8xeUN2a0Ezc1c4T1JVSUtaakdC?=
 =?utf-8?B?b0pvc21kOVRoM2JEZ3dZV2crTjk0aVd3Y0dvUkEzcnBoSDZUWHVtelF0U0px?=
 =?utf-8?B?QStHUWgyY2FtY3ZQazBkSlp4ODArdlZYd2tsYlpDQTRyRTNXeUJyeXg5dWUr?=
 =?utf-8?B?RVJtckliWTZBWURpOUl5UjkrcExjMjBpOHRpTlZuMHp0RHJISzNFalZlZFN0?=
 =?utf-8?B?NStSaTZOSk1Fb25tbFo0OFd5UDBIbnA1aFpBVDdvbTFTdjd5V2owZG1XbWhM?=
 =?utf-8?B?a1dGUmdVVHRPNUxpUU45UU9DNGFvQjVTYzBuL2x2eE5uMlJMUDh0WWdGcW94?=
 =?utf-8?B?YThOakJRejNoc3FGdnl2VURJS3JvU3VSM2FidktNVkdLcXVRZmg5NUUzbmdH?=
 =?utf-8?B?VTVhbkZaeC9KTWNHNENxTTVzVzlKVDlnT1VjUDlmcXh4eUttOFNMWm9YTUFD?=
 =?utf-8?Q?gRstrSLUGP4n7uptcKX4T5Y=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TEFDUDREOVNlN2N3TEVrbzhrVUdsVHhzekQxcEdLVWdUYVl6cUYrMHRNdDBm?=
 =?utf-8?B?enJINUJrM3BXdWc5TkpRZDNweHpkL1MrcEdzd1ZuYWRTUzlveHhDOGNaMG9x?=
 =?utf-8?B?OHRoWVNQZ1hwanlEcHl3S2draHRPRWZ4YlVMR3dkM2thc0xFM2pkUUF1SnNS?=
 =?utf-8?B?d2ozcFpuR295QkpTdkJSVStBVWdlT0VHVXdURDE5NVJ6dWxoTW9rTVBUT2FZ?=
 =?utf-8?B?THhmQVp5S1MxZHZMRHFHT3RIKzMzd01NcUJEeW9pZytaZUgzbkpheC95akQ1?=
 =?utf-8?B?UVoxK0xjRjc2b3lXbUoxQk1kSDdZbWNPbi8zRlhGS000ZUVjL1cwZnZZb3ZI?=
 =?utf-8?B?UHZtTjlLbVdnY3RhS3V1KzVCRHVOQjhjLzkyTldnZ0ZJZHB2RGQxVXFQcmpy?=
 =?utf-8?B?TG15NHcybVNEZVcvN1hBS0VjZ3ZBMHdkS3ZaMXMzRWovSGpXTjU3Z0RzU1VR?=
 =?utf-8?B?NVlrTkdOQm9hblZDYTVvNGp5L2s3VDd1VVRoRHppS2RnNjdCNTcyNWZHeUQz?=
 =?utf-8?B?dUJxNFRpNFA2enFKMmY5R3NVZjg5NnpQcm1pWGF0bUhjb0c4Sy9WYWp1SXZp?=
 =?utf-8?B?N3RIRnRreWNGcTZRbTYzK2gyWnZEK3ducm96ZlFFbENtM0hIOXAwT1l6dnNr?=
 =?utf-8?B?bnB5V3VLV3h1WkNMNktDdGZsWE9uT21qRlBJRkQ5dGx4Z0lXQ1hRQ2Nzajdn?=
 =?utf-8?B?MkU0RU4yR1RRWTYzNk5iTEpGY2xtQzNaNW1sZS9MVXhmZ09aNXZabkF4c3Uv?=
 =?utf-8?B?VHo5S082QW1DN2JUaEFoUFhCb1BiYXRMYVF2OGQzcldYUnpxV1Vla3IvOC9m?=
 =?utf-8?B?bExtNWl5VXJMazhLdFdaZWg1bWN3cTVuRmlPZU1vaEpyVW95QmNlSmYwc1BU?=
 =?utf-8?B?MkhjT0hBN0VBVXdOMXhPK1A2cGNjS1VwZHRXTVRoaXVKTXR0R29WS05uMmpj?=
 =?utf-8?B?Q245d3VJMDdNbCtRM2d6YzNQblM2b2lPS3pGYXcweUZKTWxQbGcxV2pKbmhi?=
 =?utf-8?B?Z1ZTR05lUkJCQzNycm80Mlh2UXJ6QmdjTDhLUWxwMDdCYUUwVGY2dHpiMjFM?=
 =?utf-8?B?YjE5elgwZEJlRzIrR2lJVzJUdE43L25YcWxkaENEOFhKdXloc3h4WVdmNFdL?=
 =?utf-8?B?YTVoL0hpRjBLV2kzSzdCeXNxbDZPTUE0ZVFKdERzekJQTDljWExUNGhPdmI2?=
 =?utf-8?B?OEtpd05yNkxPZi9FbWNzcnNwYmF3TjFDbkd3TGg3bC80My85eHJ6YnU3dm1z?=
 =?utf-8?B?QUhuTy9neDN6di83S2hVaHRGUVI2R283eTBsQzVjeFZMb3hzRyszb1daeWhw?=
 =?utf-8?B?UzBnQnVTQmxEWGZSM2o5R0ZxTjZiODBFbVVsdUE5YktYeFErOS9TTE5YQ3Vw?=
 =?utf-8?B?UUJnYkhEZDBxVmQwaUlmRDVXZjRCQmlhKy8wb0VmTUJLeFFrVHh1NDhXWGJ4?=
 =?utf-8?B?Y29zYytURzAzV0g2UU0yTEJFYy81L2pzaWY5ci9ZK1VBZCtoRjRkazBuK29Q?=
 =?utf-8?B?TzQwSWhrZExIZFNRQkxlNFVvYmVaUjFGWmdEMGtqOEloL0hQMHJRQTloZFZo?=
 =?utf-8?B?cTBCNmZkL0lHZnhwQU5tLzU3S0haWTM4NkU1RHlrbFJ1VFE5MmZ5Q3NvTFcv?=
 =?utf-8?B?VGlUTVBnbUY1VGRaOGpyUzRMVjNncnVhZVpzKzF3Q2dwTjFkYkU0VDhWdGZL?=
 =?utf-8?B?MGlsaE9XMXd6UGJkK1ZhSjN0cVlhRTBCL2MyeGErd0w0WnludnBqdi95clcx?=
 =?utf-8?B?eUhwdDVlL1NQdmpWSElkSmNkVEYrSGgvZWliTVo2MVFZNGJYT1dkbUtiblR5?=
 =?utf-8?B?V0h1V0Z1dm5Ga2xmcHhDLzNiTXdNYnl6VWdvcHhMakhjc0hxMGZWT1Y1SDZB?=
 =?utf-8?B?OExTRTVTVzZocHZBZVJPZEhXSjEvdXlOL1RIRXFDK0F6ckNSeFM4cExUbHJZ?=
 =?utf-8?B?R2RpWlpWZmRLdjVBUFNjSVA0ZVZHT0RUb2dNclErZHN1YWZ6RExCTVRNbEdn?=
 =?utf-8?B?MFhqRmt6SjJoWWNnYUhWTVZXdkVPd3ZCaXRXUFpRdnhYNDJwSzJhQkxhZTRh?=
 =?utf-8?B?Z0tnVjVmVzczUCtKOHhrZnltelF4ZndLSUpTcTc1TUtzaFJFamdhRlA0ZnV5?=
 =?utf-8?B?bXg0bjVMbUcwSmxkM2Y0TkF4a2Z2b2hCQXFUMllKeVplSnkwMi91OURvNXlm?=
 =?utf-8?B?d2ZTeGFNanNOa1FTQ0Yvd2RsVUtIdHNIbzg0bkZFeHJGSzhuY25QSGNNcmRr?=
 =?utf-8?B?ZnFRWXdJeXh2cUZVOWxNWE53aENka0ZScEs4MExZakNMWWJkZ1FXb3owK2ty?=
 =?utf-8?Q?EKnH8hwCqUFJBK/WBx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3438e7-6d37-4a89-4083-08de6b3e1800
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:25:56.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LhRx3e2NtGqplUzrT4ABe6A/JRpFcvh727C/oiVlRDKOOdjTf3w+dYPmzNxkswu+7tl9GVO4q0KiPX5a9EKEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52784-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: DE41713968B
X-Rspamd-Action: no action

Use enum dw_mipi_csi2rx_regs_index together with a u32 array to describe
register offsets. This allows supporting new IP versions with different
register layouts in a structured way.

Add rk3568_regs matching the previous macro definitions and pass it as
driver data during probe.

No functional change intended.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- change to use enum and u32 array method
- use order
 - #includes
 - #defines
 - enum and struct definitions
 - the rest
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 91 ++++++++++++++++++++----
 1 file changed, 78 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index a6d251ca5ad14c5138a6fd0202a970460e64c68f..b00ae5fb328da4cc78fe36b629d6661d438e124a 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -24,15 +24,6 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
-#define DW_MIPI_CSI2RX_N_LANES		0x04
-#define DW_MIPI_CSI2RX_RESETN		0x10
-#define DW_MIPI_CSI2RX_PHY_STATE	0x14
-#define DW_MIPI_CSI2RX_ERR1		0x20
-#define DW_MIPI_CSI2RX_ERR2		0x24
-#define DW_MIPI_CSI2RX_MSK1		0x28
-#define DW_MIPI_CSI2RX_MSK2		0x2c
-#define DW_MIPI_CSI2RX_CONTROL		0x40
-
 #define SW_CPHY_EN(x)		((x) << 0)
 #define SW_DSI_EN(x)		((x) << 4)
 #define SW_DATATYPE_FS(x)	((x) << 8)
@@ -40,12 +31,33 @@
 #define SW_DATATYPE_LS(x)	((x) << 20)
 #define SW_DATATYPE_LE(x)	((x) << 26)
 
+/* Help check wrong access unexisted register at difference IP version */
+#define DW_REG_EXIST		BIT(31)
+#define DW_REG(x)		(DW_REG_EXIST | (x))
+
+enum dw_mipi_csi2rx_regs_index {
+	DW_MIPI_CSI2RX_N_LANES,
+	DW_MIPI_CSI2RX_RESETN,
+	DW_MIPI_CSI2RX_PHY_STATE,
+	DW_MIPI_CSI2RX_ERR1,
+	DW_MIPI_CSI2RX_ERR2,
+	DW_MIPI_CSI2RX_MSK1,
+	DW_MIPI_CSI2RX_MSK2,
+	DW_MIPI_CSI2RX_CONTROL,
+
+	DW_MIPI_CSI2RX_MAX,
+};
+
 enum {
 	DW_MIPI_CSI2RX_PAD_SINK,
 	DW_MIPI_CSI2RX_PAD_SRC,
 	DW_MIPI_CSI2RX_PAD_MAX,
 };
 
+struct dw_mipi_csi2rx_drvdata {
+	const u32 *regs;
+};
+
 struct dw_mipi_csi2rx_format {
 	u32 code;
 	u8 depth;
@@ -72,6 +84,23 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+
+	const struct dw_mipi_csi2rx_drvdata *drvdata;
+};
+
+static const u32 rk3568_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x10),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x14),
+	[DW_MIPI_CSI2RX_ERR1] = DW_REG(0x20),
+	[DW_MIPI_CSI2RX_ERR2] = DW_REG(0x24),
+	[DW_MIPI_CSI2RX_MSK1] = DW_REG(0x28),
+	[DW_MIPI_CSI2RX_MSK2] = DW_REG(0x2c),
+	[DW_MIPI_CSI2RX_CONTROL] = DW_REG(0x40),
+};
+
+static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
+	.regs = rk3568_regs,
 };
 
 static const struct v4l2_mbus_framefmt default_format = {
@@ -186,16 +215,46 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
 	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
 }
 
+static bool dw_mipi_csi2rx_is_exist(struct dw_mipi_csi2rx_device *csi2,
+				    enum dw_mipi_csi2rx_regs_index index)
+{
+	if (index < DW_MIPI_CSI2RX_MAX &&
+	    (csi2->drvdata->regs[index] & DW_REG_EXIST))
+		return true;
+
+	return false;
+}
+
+static void __iomem *
+dw_mipi_csi2rx_get_regaddr(struct dw_mipi_csi2rx_device *csi2,
+			   enum dw_mipi_csi2rx_regs_index index)
+{
+	u32 off = (~DW_REG_EXIST) & csi2->drvdata->regs[index];
+
+	return csi2->base_addr + off;
+}
+
 static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
-					unsigned int addr, u32 val)
+					enum dw_mipi_csi2rx_regs_index index,
+					u32 val)
 {
-	writel(val, csi2->base_addr + addr);
+	if (dw_mipi_csi2rx_is_exist(csi2, index))
+		writel(val, dw_mipi_csi2rx_get_regaddr(csi2, index));
+
+	dev_err_once(csi2->dev,
+		     "write to non-existent register index: %d\n", index);
 }
 
 static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
-				      unsigned int addr)
+				      enum dw_mipi_csi2rx_regs_index index)
 {
-	return readl(csi2->base_addr + addr);
+	if (dw_mipi_csi2rx_is_exist(csi2, index))
+		return readl(dw_mipi_csi2rx_get_regaddr(csi2, index));
+
+	dev_err_once(csi2->dev,
+		     "read non-existent register index: %d\n", index);
+	/* Return 0 for unexisted registers */
+	return 0;
 }
 
 static const struct dw_mipi_csi2rx_format *
@@ -631,6 +690,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
+		.data = &rk3568_drvdata,
 	},
 	{}
 };
@@ -652,6 +712,11 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base_addr))
 		return PTR_ERR(csi2->base_addr);
 
+	csi2->drvdata = device_get_match_data(dev);
+	if (!csi2->drvdata)
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to get driver data\n");
+
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
 	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");

-- 
2.43.0


