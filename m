Return-Path: <linux-media+bounces-33186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE9AAC12DB
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3711C01727
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F58228C5C6;
	Thu, 22 May 2025 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XeJdtmaO"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3229B780;
	Thu, 22 May 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936666; cv=fail; b=Ighw/55720Rul/Ge5yKmSobnulmToBrXVLRh1eT9URC1TNu2A08pKEdRpyXk3f6LOxWymiipF+Ht9XV38VexP6ZUYJecc9YOjegwxivThEgMW2YrRUx+pSOlYQ0b2zxonc+LD0mL5xYU49fFvi8/e0msOuXsYtl9RklQYZa0LgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936666; c=relaxed/simple;
	bh=BbYVA/dodS+lHlXVqhUCslwGlN1E7Tl/NRVv5MOVQJI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hks8qw2EnOxE7x4+mUvWYfszvG4crtWirLTyo59ooH8SCeayNQndqiRgx0Gkrbmzm+8JqPdkzTm+ySkP9WRFmvE7tLtJu9qeug1px8h51KXzbVx1+3KG/9WLOLGKenAETHncJwxWq3Ecqtj+EGJE8LaKONIi17/AlBxmArQ2sj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XeJdtmaO; arc=fail smtp.client-ip=40.107.21.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHNkOi17zn/Mp3pbVUYB/S1Q4HjgggZ1FJxR1S4Uy7BDta8ge/xnRTSnTnOnNKb7U1NbGjzltnXEtM0MmYybA+RFa32f7RLvSqY+JQYPtkFbjT+uGKiV2zzekn4JLM37yTXZicre7wnJqIabRRug+Eu/VItxjh5+aMHwNTwh0Bp4L4eHBpnWeC3nj3OWg48kha/VXj1NCBlAwGblBH+MeBEmV4kiTwET8ml/XYKzSJP6tbXMcF7jAp668VyCOTQdCIXyKfHA689BQQ5CJSbgL70J6Nq+i7WoVGn0WFON7/DYNX78HA+MVQygjAIjAxq8+nU6ih0cy0GO1DcTvdNOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xyj6nzmMEoKA8hpEHVPHZ8lsoduUQUv0lukSfgLGyw4=;
 b=RgYYy0Kb4/hTQzCeyAjNglXq9CCa12vNt3hHfqOizLdjRh2F+mYhTolRI/xrL6exbZCPdWlmiqx/vqlWsZub3dDVudSoINGmOsPxqSRhfjc7rjAlIcfM8TIKca08FEFs79ozedls2qxV2ElAgRJvr+XJNyb3Tw5z8dlRGwsTLOVxIukNKvOKlrQOPDVytraZQYuN0KBvcdpL79lWPmEUYK+D/6+GZASpCT//mrjHzjreBSwvuHCvQoFTanRhocxBFVMzdMLGbwAMhDp6JzbqnU6UkrW1GNIHNu+9Jn0oVAXU8lwUMQ6YD0bpcnUv31OSdZH2ph8+mVEyxk6TQBjULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xyj6nzmMEoKA8hpEHVPHZ8lsoduUQUv0lukSfgLGyw4=;
 b=XeJdtmaO8XvoY0dVf9P/F0Ge42N9/TH7K+KBKB9PXvywcoWeSq5yQ+LVh33loaGBcQgZPorXAFtNG2rIXCIZ3UNfnakhKxDR8aMZMmiaPPHvYzt/tbmZfptYYIsYc+PbzAt5w0+8kGvoNKy28Nn5JkjP0puLnTrzTKZEiGzst/hnNifXm43PZgdObuR5V5NPn3d1DyyaSCnbyMOkPJ8KYKeG4+zLbRyFDMUHfA/Xgn6Y+AIyl5u4JKWuXQNc8c5a6uBGbt2x54TmEtifxfo1C2SnGykK7c+Orjb0zK0A1jD2TWkGXXDeuKY9bShj5dko3y2yobK0+JctS7JoxgDjTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:47 -0400
Subject: [PATCH v5 09/13] media: imx8mq-mipi-csi2: Add imx8mq_plat_data for
 different compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-9-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=4436;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rC0dKkjRxOYFvadzTuB0UEFSHcTAwY53ZKHtb+2qn2U=;
 b=mDrb36cEZRqIAmn5ELKmlsP/NfD3qAh/ou3OyNKiHiVQtd14grx1KpNE3OvS7fYR/MIaZrld1
 /aGsJi83oRSDc3c9UR2KB4koeXMwcKZ42TkgOmMgt5GSouvN3P05WaC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 9980e99e-e856-41f6-5f17-08dd995a2566
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?b2hVVlJ4M0FseVZvb2RCVTYrMjE2cnJXKzByV3U4ZC9uWTYxbUd2OVhDR1pX?=
 =?utf-8?B?N3hBOFRQeEJqTWVTcEZhSU1DQmZ4TzZ1T2VBd2ZkSWNPdzVaUTJ6aGFyT3Aw?=
 =?utf-8?B?ZnI5eHFmc0hsdUxtZWVpV3JBMUFVKzEyRHdvaGxYQ1dUV2k4dHNUM3JxZ0Ny?=
 =?utf-8?B?TlB1d0I3MDlFaXZPNGxCUGVtKzFjV2JDSVY0WGNlUTZ2alNSUHk5a3pUVzFC?=
 =?utf-8?B?ZWZ6YSs1cG1wZjVDcmZpMnZyZXZITkRWODBvU25WNGp0RUQ5ZTRZUlZReDVh?=
 =?utf-8?B?REV1V3RXS2Y1c1pvUFNLQW1MNEQyNEYvYlNBb2s3elpYTm5GZmtIZ3JpQzE0?=
 =?utf-8?B?M1dXR09YaERHdENzVkx4TURhamMvZlVQUDNKZzFpSjMvdFh1aFRiZE0wTTND?=
 =?utf-8?B?M0lMSjNwQWxUbnNxYzQ0T3J2ZTJPSkZIOE8wMVo1T0NEcFVNMmhISHlOd1B4?=
 =?utf-8?B?dnl2M2tkaHVKb2JXL2VDaklDZ2Y1ZTQ2WndwWjFLakF1Q29tWnRrMUZ3NTRv?=
 =?utf-8?B?U1FrdU1HWm1PQmxYWDh0U2NKbEJwRXBKL0xhSGE0MlhRajcyVXJUODkxdTFr?=
 =?utf-8?B?Q0h2eTJ1cnJqbENWZ09menI4MXAwR01FRmlqcEwrckF1S20vL09pR3FUVGJG?=
 =?utf-8?B?ZGF2NjR4SFpOTXVqQXQ1eVA2SStyZWxLcjVZSXhEZDVkY0FqOFRiQjFhWE9W?=
 =?utf-8?B?TExGSW1FRXZma25tdnF4cnlMTE1tMGZOYXVZS0l6NmN3YjUvb0EydlM3ekZ6?=
 =?utf-8?B?bVM0QWt3VlU3T2VDSUMzVXk1L3Y4VG9BMjFrb2VTUHRUcUJDN3hscnAwOXpa?=
 =?utf-8?B?V0F4MVZxZVpvelMxWUdBVGdyNkJyK2JLY2ZIS3gvSkNVdzBudnVEZ3BZWDFt?=
 =?utf-8?B?ZUJkQTJEOWJwbUEyZ3FBQlJiOThvV2hmTElOTDNSRlBYdnhQMVhFcnNsYmxx?=
 =?utf-8?B?STJ5VEJZejh3aWlUbHgwcW9WSlBFV2hoa05UZ1ZLK2ZFUmNhMTJaL0Evdmw0?=
 =?utf-8?B?eS9IbEc4VDJRS1NpbkFxVEp3OGlnN0VrazRUWjJaMjZlaU5rOG0yQ1pBUjBL?=
 =?utf-8?B?VGdCajFyKzN4cTl4NDkwcXlKWDN4MjVtbnZSRGlnTEtMZEdUbWdrdzc1Tkhv?=
 =?utf-8?B?Y0srS2FOVC9nbE9jNVk0S1JIOXlYV1FLNjBFL1FPNUhNRE5JaHBKS29YejZR?=
 =?utf-8?B?T0lBdjZrVU5GMS9JNEtyZDNlVDUvTXRBN1ZTMUZkRHJ3S1lPZEU0eDNwZmhB?=
 =?utf-8?B?dUlvQUFnUzNvSGNDZmlrK2ExU21TUDZmbjg1c1dmZy8wa3JYNmp3TGNLS241?=
 =?utf-8?B?b1pkQnhDT21wZE9JSGREVEdxZFExR3IxdnBJR2FqYklmeUV6MWV1OS9Id05R?=
 =?utf-8?B?OE8yR0FRTVVnWmdpby9SQjZvaGxJN0dPSjBOM2dtNk9HVzVCYjVlM1B5S09Y?=
 =?utf-8?B?WEtrY2NWeWhQRWJJUDNHa3dISkVrSkxYNjFTc25PNUxLeWs0cTI0ZDBTRjNE?=
 =?utf-8?B?MEtNTk5VZlFURTB0c1poUEJ6R0phb081TXI2d1BZR2ljYUorTTRKODZ4QzJS?=
 =?utf-8?B?RE1rRzVoZnNiMFFXYlczTWpmUVJieXF3aTYvcHNWN29CdGNmWHNIdnFuQklT?=
 =?utf-8?B?TVJYaWVzVmJIZE5qWVF4Nld2N1VKQXpRNU9xUmxXQ2JDOFZoeHVhWDk2c0pD?=
 =?utf-8?B?a3JRNllmSFBxYnhCMHRSdWlrR1hJVS9QSmhIZ202MXY5THdGRTBRdkVLRkR6?=
 =?utf-8?B?YnJqN2s5SC9vM1U1L01LaWtiUWo5MC9mSjRLOVlIOGZ5Z256ZkJyMjZzZTd6?=
 =?utf-8?B?SlZRWkdIMmxaSmVRQnUrbG94WnBmSGVaRkxNYkg2R043a1l0NWRKTzVnblYx?=
 =?utf-8?B?bWlOMnU1aFgrVDFJNUQyYkZrSlJ3eTVUU1Bwc2xOZW9sY3JNQkt1M3J6OGFK?=
 =?utf-8?B?YXF3UEU3d1NOUFN3U0pGdC9va1QwZlFBRm5oMmMwK3hGTVdtQWUyazR5VExB?=
 =?utf-8?Q?iV1NW24onz8iopVpvj2zddOQPosrPY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bGVEWURoaEx6Qk1aRkNBVjA2UVFxOTZKUjlnbC95aG9xb0p0R1lwdkRJUmQy?=
 =?utf-8?B?MEc4MnhidkdXRW14a3dEakU3eEdTMElNYnByOTA1MkZFWk9Oa1V0QzNHaGpx?=
 =?utf-8?B?blRZTVAxaDhKTVBFM21IbHFxWHQrRlRNcmJ0WGdRYjB6R3BmQmZGOXNQYXJn?=
 =?utf-8?B?TWh6dkFkSTdWZHVKOHRKL2tIelZ0M3hMU2xYSitFRHlmK2lac1lkOUVId2tD?=
 =?utf-8?B?VEltNUpEQjE5eDYyK1JMMGZVaUl0b2lpOERLQW44ZXArYVhVNkZvUGh6S0FR?=
 =?utf-8?B?SjVld3c2bWp5L1JEbjQ1T2tKdTQzTjQzUDQ4T1RFN2lMNWtXNHZpRk9hRmNu?=
 =?utf-8?B?T2ttZE5yTWg2bTJzR1NLOEJoRk8xMzFndzg4L3RxcGJPNzgzZ1RxcFA2U2Fn?=
 =?utf-8?B?cXcyQ2hKY2xRNW1ORExIdC8xODBDNHdaMit4enQ2VFZRSGIwOEN1SXptaVFm?=
 =?utf-8?B?SGswNDRmVDc4ejhEQ1VJSy81Q1NKS2xSMWZwREUvaTZIQkhjM2c1RXdQUTRj?=
 =?utf-8?B?VkdvOUFhdzFSendrQWNPTHVjMm5MZ2d4YzdFdEhiZm5YM2IyYS9FakdGYVlG?=
 =?utf-8?B?ampTV2dycnV4eEtCSW5IQXRNTmI2YXpUT29sOVNGLzltYTlLUHYybmk0cHM3?=
 =?utf-8?B?MHo0c1JCTVBoQU5xOW1qYTRNY2FUaU9lc3QrUUdSaWJyMHdpanZBem1KM0Y5?=
 =?utf-8?B?K0JZUXhhSkZ1T3haWHBhRkNQa1pKRHlOeVdLWlBZZ0ZOUEFkQXJGdmtwZG5J?=
 =?utf-8?B?KytxR3RhaTc3MWlVVStVdlZNcXdrM21PZ1NydUJnaUloZTZmRFgzOENxTnov?=
 =?utf-8?B?TEZYNGdQcUl3UWJXeCtaRFdJNkhOeDF2M1FIUm5YbmFicEwxWG5JSUJMbGJS?=
 =?utf-8?B?SldURnZXTFRmL0hxRlBqRklWdi9VaE8rKzZvTnd6RHB4ZzBqVUxSTEhsMTRY?=
 =?utf-8?B?WWFDMmFPWnlIZVBEMk12bDRteC9zNVdKL0xRa1hTUkMrS1EraFdjL2pFTkhy?=
 =?utf-8?B?YkhzZXRQVkc0QjdFMUlKT3hPWllFU1JjVE5BU2dXcWp5SjlndXVGR3JWQ3Zq?=
 =?utf-8?B?QUNZZTJQdWxTbFByaEIyeVlYdTlHbXY1bG9uRnJhOEh2R3Z4cHllcWNvcEUr?=
 =?utf-8?B?UUErZFAzNkxDU2lGaElZVGV1RWRBYk8rWW43T0czUUxGRHVIVmRyYUpBT1Ur?=
 =?utf-8?B?YW1nc0lIRENrZ01SclU3TEdwY0IvREFsTXVQQjFtSWdrV0UxMVY3K050dmVQ?=
 =?utf-8?B?U0JPWUlDYm5yVUpYbTkvcEhsSmliMEdCSGtPVThmYTE3bUtOcStISTFBRENk?=
 =?utf-8?B?VGtKMjlqM2R0OGM4dThvN0hkdkJFTzg5SE1MVXFNV2U1M21ORzZ2d0V1eERy?=
 =?utf-8?B?WWNJMFVjeGsvRGJCZ1daTTNTeWlGZXJrbWtlRVhVVWlrWDhxVWpLenRvbHMy?=
 =?utf-8?B?akF5MWgxTFY4bUpqY0U1akRVaDVZTVdqWHVKc29wM0ZCVUlnR1JoeWdpaVBy?=
 =?utf-8?B?RzBKS0NNNDFiNlk3dFVVUXBETkhaUzJpYjZMSUUvOCtqVUVTdVVDcGN3T2h5?=
 =?utf-8?B?Tm5WOHFIbDhwWXNVQzlkNy9lVlZQY290ZHAxNGsvN0lueUJWS2NkWlpmRzRU?=
 =?utf-8?B?TG5ZV0tsL1lHY3NLMlVRVi9VMTZOSjZkbWVuMW0vcVdVRXFpU0hPVkVvUGhJ?=
 =?utf-8?B?TUNCWUt2aC9sVXdlRnFGaDBqQVd5REh1M1pKTWdOUFFFQzNqOHVxeUFNRlZ2?=
 =?utf-8?B?S281QmF6TmdzakpJak9OZnlsTVFDN0hPV3lwR09wbnhFdDJXWjhsNWs0MXpm?=
 =?utf-8?B?RVJ2cmdWTHlHUVMyL0V3ZTQwZkpMMFRsZUpIL0VKRXJUYnl3clA0MGF1Lzc4?=
 =?utf-8?B?a1pzWG1RZU4xYmh5NmJFcXh4eERDWG5Ocnd1dXg1WnJrbVhZSXZYMThtMkNE?=
 =?utf-8?B?TktlTlowTVArWnp2c1JVeU1sWnpGelVhajZSSFU3M3R5Ym5VUWs2dEQ3SXp2?=
 =?utf-8?B?dzV6T0Y3Um9NZFF1SU42byttN0E2YUhScHFGeldEMXp2dDVXUUlNWUFZb2hM?=
 =?utf-8?B?a0thdzN3d0dRRm5wVDBYVkFxV214L1JReWk1VVBDSnFnT2dMTjA5NTRMYk9K?=
 =?utf-8?Q?LX8i/KOoHHbIbyUyCkyWO5Ygc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9980e99e-e856-41f6-5f17-08dd995a2566
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:41.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64r+woHwxaJ0HrK+jqr5BEFQcRHh7peA6COwr6JXdYUw0RuHZo6NtsVpeZqHSVAY4KoIaBlkQsw7s4HlQoaK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Introduce `imx8mq_plat_data` along with enable/disable callback operations
to facilitate support for new chips. No functional changes.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- none

Change from v3 to v4
- Add Laurent Pinchart review tags
- remove unused 'names'

Change from v2 to v3
- none
change from v1 to v2
- remove internal review tags
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 58 ++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index a8bcf60e2f37d..59ec7107b4508 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -62,6 +62,8 @@
 #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
 #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
 
+struct csi_state;
+
 enum {
 	ST_POWERED	= 1,
 	ST_STREAMING	= 2,
@@ -83,11 +85,10 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 #define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
 
-#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
-#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
-#define	GPR_CSI2_1_HSEL			BIT(10)
-#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
-#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+struct imx8mq_plat_data {
+	int (*enable)(struct csi_state *state, u32 hs_settle);
+	void (*disable)(struct csi_state *state);
+};
 
 /*
  * The send level configures the number of entries that must accumulate in
@@ -106,6 +107,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 struct csi_state {
 	struct device *dev;
+	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
 	struct clk_bulk_data clks[CSI2_NUM_CLKS];
 	struct reset_control *rst;
@@ -137,6 +139,34 @@ struct csi2_pix_format {
 	u8 width;
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8MQ GPR
+ */
+
+#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
+#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
+#define	GPR_CSI2_1_HSEL			BIT(10)
+#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
+#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+
+static int imx8mq_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	regmap_update_bits(state->phy_gpr,
+			   state->phy_gpr_reg,
+			   0x3fff,
+			   GPR_CSI2_1_RX_ENABLE |
+			   GPR_CSI2_1_VID_INTFC_ENB |
+			   GPR_CSI2_1_HSEL |
+			   GPR_CSI2_1_CONT_CLK_MODE |
+			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+
+	return 0;
+}
+
+static const struct imx8mq_plat_data imx8mq_data = {
+	.enable = imx8mq_gpr_enable,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -371,14 +401,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 	if (ret)
 		return ret;
 
-	regmap_update_bits(state->phy_gpr,
-			   state->phy_gpr_reg,
-			   0x3fff,
-			   GPR_CSI2_1_RX_ENABLE |
-			   GPR_CSI2_1_VID_INTFC_ENB |
-			   GPR_CSI2_1_HSEL |
-			   GPR_CSI2_1_CONT_CLK_MODE |
-			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+	ret = state->pdata->enable(state, hs_settle);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -386,6 +411,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
 {
 	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
+
+	if (state->pdata->disable)
+		state->pdata->disable(state);
 }
 
 /* -----------------------------------------------------------------------------
@@ -876,6 +904,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	state->dev = dev;
 
+	state->pdata = of_device_get_match_data(dev);
+
 	ret = imx8mq_mipi_csi_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
@@ -953,7 +983,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
-	{ .compatible = "fsl,imx8mq-mipi-csi2", },
+	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


