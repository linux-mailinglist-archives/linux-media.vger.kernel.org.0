Return-Path: <linux-media+bounces-48121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC5C9DEDF
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 07:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8BEA4E062A
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 06:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1617429B8E5;
	Wed,  3 Dec 2025 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n16rBPU5"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF629B217;
	Wed,  3 Dec 2025 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764743372; cv=fail; b=Fs78nQzuLzI5PJLBSzobGvvZIby6oNfg2mnUqZEZ86+rWouQhC6P/1L71gCysUdZ2j+Bd2YTVENC1WeRQCaEbrYu2p7HVNBBh9CiIZy2kZ4uPkglinak71SwdNQU57t2lSSfoy8xr5OqubAok/ybWseymiVDuO4AEfoK0kLdaqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764743372; c=relaxed/simple;
	bh=zaCs3LdSJ46fkG8Sr3HBHSMed5RCZgEgTJ1whEYrn/w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=o03M6ACNM0htgNotZ717DIl7ubVsICr7vFhk8vzZbMrWJwu5fr374UV4Csf8KWPZzS0hVQZyLQ/NfUnmGlvuOOSagT0JzK12GzIsiIPL3pmdSmEIVgIvieNGyc2YrGF3tEDW1Dn4kx+QFgOCQZjdG4qBhh6ih2Yz5daZO/dJzRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n16rBPU5; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoKwT+kI5w37/N/U91aq/trcqw9IajTs4iRbyv6cjJ6+GcYduUnhKCCQN80HsLCRQD5bN2YYHEoY7KBfiWjRmhNdRXDxePp8Ixvg2rsE204qjwTyotz5pqQ/fc6XCa62OpK1X8Y/zbkwpSTyDS4mb/SA2TG/qeumXQ+6AU6s7y/O3iLaC3W4zgAOJTEUwQPpxt19iEmz313bBZEF2dRzBMP/iaYdM1wfq6WR1QImLkf5nD+VpQ2SHDGX06XjMfvXW0Hbj/inEJGmtU/Yikb6G+DF+P6N6XGcM2Odd1YSVPO8u9Bg57d31JU5IgKCJK8dGDDgvvE29bJNCTl647zkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt0W0EacesjQe5+Bx3FHBCFahkq0vCPMXI//XhXkNug=;
 b=JYbObivBX7cO4BRHyByT4oj4A4Z6xYBhlkfV6jMdFXfWJWBfcRJjqIV3PFYBhUidyIwdZ6636D9cy/x48Kdm/4j30jp8sE9jtwEnhQJ/hWZXDhNbnZ1GM3Eji4nN8WJDGAqE690P5qHThJ4qYO759OvWrXpfxPw6VF+pLsTAYuCzLbeeMW6X/gV7iFC3A3hl7Z0BgUbPq8ad8UDiVYWctsGRwwcWiRI2Asga8ZpkT/EMtkqpbmrrrsGt0y1ooLPAWf/suZ/vu59M2cp3HkYSf5GayxVrQYZov8Fs6lDUjix1hNAlML0Mkd74fla6eaHILNaYWziQI/BBsREHEHOT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt0W0EacesjQe5+Bx3FHBCFahkq0vCPMXI//XhXkNug=;
 b=n16rBPU53EidMGkdPJJTOqfRgxckttkpyDEqdaREoniJWLkRHevyklpusfVb2J2cY0FUxhHRIBix1N5VP8bqfbFp25lXHXezuyh012j+Kj77oibI3aKI7oTMVjAY4/DdhNWJAC99+rCYTpvS/2M89AJwKE+b7gDZD4FaeRX/5+d19Usiac9pit2Nz2wotSCaQzjhMXdKkPSoVfLeaB/6FNdKWdDYCPP4TtRKUNn05HRUNMupJuhGd7LHpPD9Ho3u2JYyiyHALlHVa6oFn7rofoOT4DeDB8/q6mgOoHVAnweDl1jZsseBmf/JqbiWPMaZ1WDKiuTlEcHw2aQBZdXmOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:29:25 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:29:25 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 03 Dec 2025 14:30:03 +0800
Subject: [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-csi_formatter-v1-2-eb9e1147b49e@nxp.com>
References: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
In-Reply-To: <20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764743424; l=28623;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=3zENuN+6jlAC/eE9/RZkN0iXnwZ0or8Got0I9QSN4XY=;
 b=zgXG7oWWwa+OHMrDW+Sw/HOAfE3d+I6yY4+xXZFNFAKSvg1SJTjO2aflPJhkmb/4gJ/aX8F2e
 FLHbG7LHr/bAWFZoWEHbB+oG/+c2xE4IcQBrHgvinyV1sQbcNJfQq3a
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8678ff-ad7b-4967-9f1f-08de32354df6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RWlpbGh5KzQvTWRkSG9WNTRDMExTK2s4NnhCVytGQ0ZGQzMvckdwZDYwaGta?=
 =?utf-8?B?b295NjZ6TlhCcGhqLy9yd2cvU2FVSlBnOWgwM2tQQlBnclNwU0VQMWdNS3hn?=
 =?utf-8?B?c2w4QUNvcUJVWXk2YS9OaGxscWgwcnk3SFJPcnNVM1lxb3RETFRJN2pVbEpF?=
 =?utf-8?B?TUpGN2JERGFMVFJCSnFuS0FPamR2dVJIV1hpWEZabUVaOWhOUjFZWEpGVTZU?=
 =?utf-8?B?YldaK2hNSjVvcGd5Ynk5ZXRVRjZMUkN5SGdtWGpYWFhFRmdjaFN2MW13OS9u?=
 =?utf-8?B?UFpRTjZDdEtLSGR5YXloZk1MUGlvaXl1cUZjQ1FiUGdJU1lxd0RLdUhYVzlR?=
 =?utf-8?B?Y1I5clllblVRcmNTanpxU1FjVjQzaTJkam4xdXJkZldaUmZCQ3FtdlVWdm5R?=
 =?utf-8?B?anRGOFpRNTlsK3pCallxZkd0QklVOHpSOFFId0lFR21qendDdUdabTYycjdy?=
 =?utf-8?B?Y0FqUE5LZzVRL1MrMmlrYmpXZ2FIZTdFNHhhUFNmTXJDSEtPNDNlTlZkWkV6?=
 =?utf-8?B?akx0dHIvSThnTkVkSlNGOVRjYXlZS1hVSGk3MlE1WXNiTUVyL1pvVzRKRWxM?=
 =?utf-8?B?VHdkRXdrWk41bUdJcFJPbE1jZjdXbExIYmkyK1pxRm9tc2h5UVlBMm5QNlcr?=
 =?utf-8?B?andDN1p3YmJqUG1mbE5Ya3R3WGNSK1VrVnVvcjh6RlpYL0lzbjUzNGtQcnNQ?=
 =?utf-8?B?VjZVaXV5ZFg5K2Q5YmQvTXptNDBqbGdwU2xSYnFLa3V2Q1h3NnpJNDlNWmpr?=
 =?utf-8?B?eW5uT3B0RmNmbFJsV01WdnJMeXFpamkxeTkvaVM0SGFzZUhEUW16d1lmZEg1?=
 =?utf-8?B?YlY2amtmQkpJVFpuYjVpWmRnNDJBZmRIU1paMUVkaVorK3hNYVROQndKR21o?=
 =?utf-8?B?U09YbmVNaFRHWmYwZDBrWEdmN2NXK1NRUkx5TTF5bzdLNkVPeUdESU5lV1hx?=
 =?utf-8?B?RUFrWHk5VDRybnNBR3R0YVZvZHhUa1dNSEFkVWJPTnFoVWRCYVkrMW5EUGdi?=
 =?utf-8?B?eHk3SldMK2FmMWtaOHZpRjZpYVhQQ2xJdUVSMTdMOVU1d1FZa3MyR3g5ZDQx?=
 =?utf-8?B?TWErQWNOYVFxbndSTXRGQVhBMG01dHp2eGdaR1FEQ3hwQUp6VmVuS3NNbkk2?=
 =?utf-8?B?MGFEZ3l3TGs5emdQbkYyMjBaR2liZk16V0UzZmlIYUVFYStGRlVJY0ZMMDVr?=
 =?utf-8?B?NlhPSWR5OCtWSy9KamIreTBValA5dEg1cGNmMldRd3dweEFKb200c1F3RDdJ?=
 =?utf-8?B?YzBHaVZFdEM4amxlRGFnUEFoWHR3VTIyM3pySmpteWJtMnBmVWwrMGtBeGp1?=
 =?utf-8?B?eXpjY2xQUmFmZmVSTkJ6SXF6WTEwbFp5T3VtVmtRaVZmMjFZS2NvWWt2eVJt?=
 =?utf-8?B?K3JyY3FET3JVT1FKOUlWQmRmdDVPVzBubC9oQ0gra0ZFQU5CUGZlN1QvS1F0?=
 =?utf-8?B?S2Z0OTJPeHNxMStjNjdGOGIzNmJmdjZ3NzlBUjlEc284aHJyUjZWdW9vbW5Y?=
 =?utf-8?B?ZGFZMmxiaGpiVVBHSDFYVThZcXVDdkR4WDc2WDY1enhMS1EwSlA1ZmRoU01o?=
 =?utf-8?B?ZHFJWnRxN21JVHRmKzlnQUhPRDY4clhhbzFtRlRSZmpKUEhSMlhvVVVoT2hE?=
 =?utf-8?B?dEgxTjI2b00yZ09KUnVjVjAzVzBPVkw5Skd4akJlQzBWR1EyL3BNVE9QS1Zx?=
 =?utf-8?B?Z3c5Tk5YcnZ5aWxvay9vVGw2bWVJa3pqMmV2KzQ2QjRybDJwSE5FMzIrM2xS?=
 =?utf-8?B?Skw2OGsrOUJQZEJQKytIMUZSTVZpSzNHZTFDcG1wSlY4Zk9zV0NyVWVScXZw?=
 =?utf-8?B?QzBROVRDYTh4dTE4RWJiNGQzYVZlcElNSmkwb1gyUEc0NFUzT0x6SWd0RW95?=
 =?utf-8?B?SVBFaDIxaThCNmdjazhtdVZaUW9EVStGa09MMWxnSWV1VG5sZHF4MkovWVpy?=
 =?utf-8?B?U1l2dUY1WDJyT2NhQ2Q4S2RQV2tlSjB4bTFlMmRoZkg3bkcwbXVMeHd0WWEz?=
 =?utf-8?B?MVp0ZGlINWZkR01UK1I0dzQ0Y0hIcFkvOTdmak9VSzYrV2JTT2NTU0hJU1BF?=
 =?utf-8?B?L0NybUovay93TVRmM1dkelcrNHhncDQySjF1Zz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(921020)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZjJ4dEFJdHQ5L01oUGJHQXJQMW5zZ211WVF3bzFkSldpNW5TTDVHdzBMUXBM?=
 =?utf-8?B?bHY5Ukd2V2IzMjdBb0swQjBzMGpJbDdXVjlsUllhbFd1d2hnTXlmN0xXRnVI?=
 =?utf-8?B?NlhwYUJnWE9wSDVKeE5DVHR0RHRIZ2dYcnovVXpvUWJUTDhiTHNJaENkdEdO?=
 =?utf-8?B?THBDUE44UkdiM2Z5YklVQ29DMWNWQXZXMmxDdW50VUZOUlc4V2xQTjFwU0Rx?=
 =?utf-8?B?ODhmMzBuYmhRcXVQcUFvZ0cvcHlMKy9YK3g4TEhyeWx2VFFobFpFWU90dTl0?=
 =?utf-8?B?bkltYjczVkNxMVZLRDJYU1JONHlJdVUyS0dMcW1MTUV2dDRLVGlLTW5RTEp0?=
 =?utf-8?B?ckgxYlVRWncwMGQ4V0JsSnFQTWdsb0kzK0hDN1ZwREhsaE0rUG1GdXhMMWxo?=
 =?utf-8?B?dVF4Y1hlMC80T0xxMm14eFQrbXdDbk93WG1rTHNueS9ZOEdmUG5JRGxrQUQw?=
 =?utf-8?B?YVpVMjhHeDlkZitnZEMwVEJUV0lsdDBSSjExM0hUK2dSQ3A0RkhiQ3J4UEUr?=
 =?utf-8?B?aHQ4VWsrY09ZYjBJZ0puN3J1dFdLeGFEV2ZpWWQzbzBZK01RcWkxczZnQWh6?=
 =?utf-8?B?SFBNK1RYQk5pVlVsbURZZW1URzVrdEJDZ2l2UHUrNm1WWkJiKzd2RllUakxl?=
 =?utf-8?B?N1hiSWEyZzVxNFZ1KzBVSE9WRU1pSC9MUmc5NHZzMkxXV1Z2K0VNOHdTOExu?=
 =?utf-8?B?U0lTZ211SUVaMitZdmdvNEd3MlJiYnZkTjVZbExlMGJSd1NseHgyU1c0MHlJ?=
 =?utf-8?B?NEU1S296cDhrK054cmV6ZUhDTmdMbkZjZmJwMjZLN3B2MEJqbk5McVVWZm9B?=
 =?utf-8?B?SFliQi9HZXhqY2k4bWtCYWlHN3hINXRDY1RWREJ2TDE1aTJzcWhWeEJpeFFm?=
 =?utf-8?B?eVhRd0xMTHROZ3J5blBvNFpIdjFjTkJpWGFNUTNCMUJQVEJVbHVVR2RVWjFC?=
 =?utf-8?B?WkxaTjV5dUNPNjRzTXQ3VHJhTVlZRkVFVmhKYmc3RGpIRHM0VjVuVlZDN3gw?=
 =?utf-8?B?ODN1cnNnaVVrUXVZaWdveFZZanVEQ2xLOG1PWjhYYTNNVDFqOW4zTFYxZlRj?=
 =?utf-8?B?UGVpUWtkWHBhdVVDM1E5Z3lEWEJQRmNFcENEWUQ1TExqYzBxR0lpa1N5V0dL?=
 =?utf-8?B?eU1IWU52SHJBS1o2V0xYSDhWRk0yQmhNSmoyUWtySTZjczN2ODhQd01Jc2tJ?=
 =?utf-8?B?WmYvMzZSUWxTN0dqL1Nwa0hHZmtUSHlLYmxvcUZJWStUR1M0bHN3VEE0R0l5?=
 =?utf-8?B?Z2NXWmQ5emlyUW12Y2xKVWg4NjRKWmpDZ0l5Y2crNTgrLzBZb25iWnVDQ096?=
 =?utf-8?B?U2VhbnZwVnhqWTluNVF3TmhRbEd3NE43YU9KT0xGNWZHUVBTcUV3Z3c5Q0lI?=
 =?utf-8?B?RWxKNWpEbmlveVJlemtSamV2MStsTWYwWURkTDNXamtiVjF3ZXhyWk9FTko3?=
 =?utf-8?B?RnRERHhtYXpIa1RDTUhjbHM2MnF4YXpxT2NZTjZmMFlVdTVVV2RRa2s4Tk9T?=
 =?utf-8?B?MENKSDA0OFQ1YmRTR1Jha2MxQzBUVVFYOFpLUmphL1RFNWh5MFZIdGNGcXNL?=
 =?utf-8?B?M3Vsa0Npanc0WVNTQXFJYWp1UkEvdlZaVjRkdWNPRDVPcm54aHVsSjhsdnhh?=
 =?utf-8?B?c3FDTDhzWm5MM3F4WXdlMlZqcmtZdXBGRjFBdXA3TENaMURRM29tY29QUmlV?=
 =?utf-8?B?azJsb0dmZ0l4ZkF6U3NLOGk3NThEdUsxVy9OUXB6U3RpLzVZQW5VU2U0azQ2?=
 =?utf-8?B?UzFwRVVkSDFUYmk4T1JyVEhpYTBwZnd2SmVXNzNVeVNQamZDaTdqa0xlWXhu?=
 =?utf-8?B?R0J6VllHK3RGT0pFa1dBRXQ4Zy9kUDkrYUxvRFY4NUE3RERaZXNlbUJheXl2?=
 =?utf-8?B?QVVSVVkrbktUbC9IZ2pNS0VxeTVMb2JLdnV5SG8rTjZhZHp3K1NtMmxOK040?=
 =?utf-8?B?c3VtcG9NaitUbU1HQzl2YjA4Y2RsQlE5YlNxZ2R0Njd3QVBWbVJyRjdyQkQ5?=
 =?utf-8?B?Lzh1K2hUNXhzdVN2ajJNeS9rTkVLaE9HMWJMazI0VjgwVEZtUEM2TUpOQjM3?=
 =?utf-8?B?MzZnS2VVR2FBMTRmdFhDbGp4ajhHd3NKZ1NtL3dJcGlQbE9aWlNpZkZlaTQ1?=
 =?utf-8?Q?BXEz838KxWkJtceriwR4gLU8w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8678ff-ad7b-4967-9f1f-08de32354df6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:29:25.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mz1ZTnnlT7CEKHVxw81E05wLSZ377l2K5pkV2yxcrRj8xS4xSWQLN9o9UFxhop6dByAbtoAxdZ0SDUT64CyEjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

This driver adds its data formatting support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 MAINTAINERS                                     |   8 +
 drivers/media/platform/nxp/Kconfig              |  14 +
 drivers/media/platform/nxp/Makefile             |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c | 894 ++++++++++++++++++++++++
 4 files changed, 917 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4205ca007e076f869613032b51e8cc5bff06b98e..24681a787818c3e69f93dcc220ee9838cef99886 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18626,6 +18626,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx9-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx9-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50fa488aee9590a87 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX9_CSI_FORMATTER
+	tristate "NXP i.MX9 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX9 series SoC. This module unpacks the pixels received by the
+	  formatter and reformats them to meet the pixel link format requirement.
+
+	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b01b5b34a021dad7bb3 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
new file mode 100644
index 0000000000000000000000000000000000000000..59ccbd26d8acdbca79ea9093746524df803473fc
--- /dev/null
+++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
@@ -0,0 +1,894 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI Pixel Formatter registers map */
+
+#define CSI_VCx_INTERLACED_LINE_CNT(x)		(0x00 + (x) * 0x04)
+#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
+#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
+
+#define CSI_VC_INTERLACED_CTRL			0x20
+
+#define CSI_VC_INTERLACED_ERR			0x24
+#define CSI_VC_ERR_MASK				GENMASK(7, 0)
+#define CSI_VC_ERR(vc)				BIT((vc))
+
+#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
+#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
+
+#define CSI_RAW32_CTRL				0x30
+#define CSI_VCX_RAW32_MODE(vc)			BIT((vc))
+#define CSI_VCX_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_CTRL			0x34
+#define CSI_VCx_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VCx_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_STS			0x38
+#define STREAM_FENCING_STS_MASK			GENMASK(7, 0)
+
+#define CSI_VCX_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
+
+#define CSI_VCX_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
+#define NEW_VC(x)				FIELD_PREP(GENMASK(3, 1), x)
+#define REROUTE_VC_ENABLE			BIT(0)
+
+#define CSI_VCx_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
+
+#define CSI_VCx_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
+
+#define CSI_VCx_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
+
+#define CSI_VCx_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
+
+#define CSI_FORMATTER_PAD_SINK			0
+#define CSI_FORMATTER_PAD_SOURCE		1
+#define CSI_FORMATTER_PAD_NUM			2
+
+#define CSI_FORMATTER_DEF_MBUS_CODE		MEDIA_BUS_FMT_UYVY8_1X16
+#define CSI_FORMATTER_DEF_PIX_WIDTH		1920U
+#define CSI_FORMATTER_DEF_PIX_HEIGHT		1080U
+#define CSI_FORMATTER_MAX_PIX_WIDTH		0xffff
+#define CSI_FORMATTER_MAX_PIX_HEIGHT		0xffff
+
+#define CSI_FORMATTER_DRV_NAME			"csi-pixel-formatter"
+#define CSI_FORMATTER_VC_MAX			8
+
+struct formatter_pix_format {
+	u32 code;
+	u32 data_type;
+};
+
+struct csi_formatter {
+	struct device *dev;
+	struct regmap *regs;
+	struct clk *clk;
+
+	struct v4l2_subdev sd;
+	struct v4l2_subdev *csi_sd;
+	struct v4l2_async_notifier notifier;
+	struct v4l2_mbus_framefmt format[CSI_FORMATTER_PAD_NUM];
+	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
+	const struct formatter_pix_format *fmt;
+
+	u16 remote_pad;
+	u32 reg_offset;
+	u64 enabled_streams;
+};
+
+struct dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+static const struct dt_index formatter_dt_to_index_map[] = {
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
+	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
+	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
+	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
+	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
+	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
+	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
+	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
+	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
+	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
+	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
+	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
+	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
+	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
+};
+
+static const struct formatter_pix_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	},
+	/* RAW (Bayer and greyscale) formats. */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}
+};
+
+static const struct v4l2_mbus_framefmt formatter_default_fmt = {
+	.code = CSI_FORMATTER_DEF_MBUS_CODE,
+	.width = CSI_FORMATTER_DEF_PIX_WIDTH,
+	.height = CSI_FORMATTER_DEF_PIX_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct formatter_pix_format *find_csi_format(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	return &formats[0];
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_formatter, sd);
+}
+
+static int __formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&formatter_default_fmt);
+}
+
+static int formatter_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI_FORMATTER_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI_FORMATTER_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
+						   code->stream);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	code->code = formats[code->index].code;
+
+	return 0;
+}
+
+static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_format *sdformat)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct formatter_pix_format const *format;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	format = find_csi_format(sdformat->format.code);
+
+	v4l_bound_align_image(&sdformat->format.width, 1,
+			      CSI_FORMATTER_MAX_PIX_WIDTH, 2,
+			      &sdformat->format.height, 1,
+			      CSI_FORMATTER_MAX_PIX_HEIGHT, 0, 0);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
+					   sdformat->stream);
+	*fmt = sdformat->format;
+
+	/* Set default code if user set an invalid value */
+	fmt->code = format->code;
+
+	/* Propagate the format from sink stream to source stream */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
+							   sdformat->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = sdformat->format;
+
+	/* Store the CSIS format descriptor for active formats. */
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		formatter->fmt = format;
+
+	return 0;
+}
+
+static int formatter_subdev_get_frame_desc(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct v4l2_mbus_frame_desc csi_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	if (pad != CSI_FORMATTER_PAD_SOURCE)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &csi_fd);
+	if (ret)
+		return ret;
+
+	if (csi_fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(formatter->dev,
+			"Frame descriptor does not describe CSI-2 link\n");
+		return -EINVAL;
+	}
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < csi_fd.num_entries; ++i) {
+			if (csi_fd.entry[i].stream == route->sink_stream) {
+				entry = &csi_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!entry) {
+			dev_err(formatter->dev,
+				"Failed to find stream from source frames desc\n");
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = entry->flags;
+		fd->entry[fd->num_entries].length = entry->length;
+		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+out_unlock:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static int formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					enum v4l2_subdev_format_whence which,
+					struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __formatter_subdev_set_routing(sd, state, routing);
+}
+
+static inline void formatter_write(struct csi_formatter *formatter,
+				   unsigned int reg, unsigned int value)
+{
+	u32 offset = formatter->reg_offset;
+
+	regmap_write(formatter->regs, reg + offset, value);
+}
+
+static u8 get_index_by_dt(u8 data_type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
+		if (data_type == formatter_dt_to_index_map[i].dtype)
+			break;
+
+	if (i == ARRAY_SIZE(formatter_dt_to_index_map))
+		return formatter_dt_to_index_map[0].index;
+
+	return formatter_dt_to_index_map[i].index;
+}
+
+static int get_vc(struct csi_formatter *formatter, unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Return virtual channel 0 as default value when remote subdev
+	 * don't implement .get_frame_desc subdev callback
+	 */
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &source_fd);
+	if (ret < 0)
+		return (ret == -ENOIOCTLCMD) ? 0 : ret;
+
+	for (i = 0; i < source_fd.num_entries; ++i) {
+		if (source_fd.entry[i].stream == stream) {
+			entry = &source_fd.entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"Can't find valid frame desc corresponding to stream %d\n", stream);
+		return -EPIPE;
+	}
+
+	return entry->bus.csi2.vc;
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      u64 stream_mask)
+{
+	const struct formatter_pix_format *fmt = formatter->fmt;
+	unsigned int i;
+	u32 val;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (stream_mask & BIT(i))
+			break;
+	}
+
+	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+		dev_err(formatter->dev, "Stream ID out of range\n");
+		return -EINVAL;
+	}
+
+	val = BIT(get_index_by_dt(fmt->data_type));
+	vc = get_vc(formatter, i);
+
+	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
+		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
+		return -EINVAL;
+	}
+
+	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), val);
+
+	return 0;
+}
+
+static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct device *dev = formatter->dev;
+	u64 sink_streams;
+	int ret;
+
+	if (!formatter->csi_sd) {
+		dev_err(dev, "CSI controller don't link with formatter\n");
+		return -EPIPE;
+	}
+
+	if (!formatter->enabled_streams) {
+		ret = pm_runtime_resume_and_get(formatter->dev);
+		if (ret < 0) {
+			dev_err(dev, "Formatter runtime get fail\n");
+			return ret;
+		}
+	}
+
+	ret = csi_formatter_start_stream(formatter, streams_mask);
+	if (ret)
+		goto runtime_put;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+
+	dev_dbg(dev, "remote sd: %s pad: %u, sink_stream:0x%llx\n",
+		formatter->csi_sd->name, formatter->remote_pad, sink_streams);
+
+	ret = v4l2_subdev_enable_streams(formatter->csi_sd, formatter->remote_pad,
+					 sink_streams);
+	if (ret)
+		goto runtime_put;
+
+	formatter->enabled_streams |= streams_mask;
+
+	return 0;
+
+runtime_put:
+	pm_runtime_put(formatter->dev);
+	return ret;
+}
+
+static int csi_formatter_stop_stream(struct csi_formatter *formatter,
+				     u64 stream_mask)
+{
+	unsigned int i;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (stream_mask & BIT(i))
+			break;
+	}
+
+	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+		dev_err(formatter->dev, "Stream ID out of range\n");
+		return -EINVAL;
+	}
+
+	vc = get_vc(formatter, i);
+
+	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
+		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
+		return -EINVAL;
+	}
+
+	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), 0);
+
+	return 0;
+}
+
+static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
+					  sink_streams);
+	if (ret)
+		return ret;
+
+	ret = csi_formatter_stop_stream(formatter, streams_mask);
+	if (ret)
+		return ret;
+
+	formatter->enabled_streams &= ~streams_mask;
+
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
+	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= formatter_subdev_set_fmt,
+	.get_frame_desc		= formatter_subdev_get_frame_desc,
+	.set_routing		= formatter_subdev_set_routing,
+	.enable_streams		= formatter_subdev_enable_streams,
+	.disable_streams	= formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = formatter_subdev_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static const struct media_entity_operations formatter_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int csi_formatter_subdev_init(struct csi_formatter *formatter)
+{
+	struct v4l2_subdev *sd = &formatter->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &formatter_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
+	sd->internal_ops = &formatter_internal_ops;
+
+	sd->owner = THIS_MODULE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS |
+		     V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &formatter_entity_ops;
+	sd->dev = formatter->dev;
+
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
+				     formatter->pads);
+	if (ret) {
+		dev_err(formatter->dev, "Failed to init pads\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static inline struct csi_formatter *
+notifier_to_formatter(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_formatter, notifier);
+}
+
+static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asc)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct csi_formatter *formatter = notifier_to_formatter(notifier);
+	struct v4l2_subdev *sdev = &formatter->sd;
+	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
+	struct media_pad *remote_pad;
+	int ret;
+
+	formatter->csi_sd = sd;
+
+	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
+	if (ret < 0)
+		return ret;
+
+	remote_pad = media_pad_remote_pad_first(sink);
+	if (!remote_pad) {
+		dev_err(formatter->dev, "Pipe not setup correctly\n");
+		return -EPIPE;
+	}
+	formatter->remote_pad = remote_pad->index;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations formatter_notify_ops = {
+	.bound = csi_formatter_notify_bound,
+};
+
+static int csi_formatter_async_register(struct csi_formatter *formatter)
+{
+	struct device *dev = formatter->dev;
+	struct v4l2_async_connection *asc;
+	struct fwnode_handle *ep;
+	int ret;
+
+	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		fwnode_handle_put(ep);
+		return PTR_ERR(asc);
+	}
+
+	fwnode_handle_put(ep);
+
+	formatter->notifier.ops = &formatter_notify_ops;
+
+	ret = v4l2_async_nf_register(&formatter->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&formatter->sd);
+}
+
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int csi_formatter_system_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int csi_formatter_system_resume(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0) {
+		dev_err(dev, "force resume %s failed!\n", dev_name(dev));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int csi_formatter_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	clk_disable_unprepare(formatter->clk);
+
+	return 0;
+}
+
+static int csi_formatter_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	return clk_prepare_enable(formatter->clk);
+}
+
+static const struct dev_pm_ops csi_formatter_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(csi_formatter_system_suspend,
+				csi_formatter_system_resume)
+	SET_RUNTIME_PM_OPS(csi_formatter_runtime_suspend,
+			   csi_formatter_runtime_resume,
+			   NULL)
+};
+
+static int csi_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi_formatter *formatter;
+	u32 val;
+	int ret;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->dev = dev;
+
+	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(formatter->regs)) {
+		dev_err(dev, "Failed to get csi formatter regmap\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(dev->of_node, "reg", &val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get csi formatter reg property\n");
+		return ret;
+	}
+	formatter->reg_offset = val;
+
+	formatter->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(formatter->clk)) {
+		dev_err(dev, "Failed to get pixel clock\n");
+		return PTR_ERR(formatter->clk);
+	}
+
+	ret = csi_formatter_subdev_init(formatter);
+	if (ret < 0) {
+		dev_err(dev, "formatter subdev init fail\n");
+		return ret;
+	}
+
+	/* Initialize formatter pixel format */
+	formatter->fmt = find_csi_format(formatter_default_fmt.code);
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		v4l2_subdev_cleanup(&formatter->sd);
+		dev_err(dev, "Async register failed\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, &formatter->sd);
+
+	/* Enable runtime PM. */
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void csi_formatter_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	v4l2_async_nf_unregister(&formatter->notifier);
+	v4l2_async_nf_cleanup(&formatter->notifier);
+	v4l2_async_unregister_subdev(&formatter->sd);
+
+	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&formatter->sd.entity);
+	pm_runtime_set_suspended(&pdev->dev);
+}
+
+static const struct of_device_id csi_formatter_of_match[] = {
+	{ .compatible = "fsl,imx9-csi-formatter" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
+
+static struct platform_driver csi_formatter_device_driver = {
+	.driver = {
+		.owner          = THIS_MODULE,
+		.name           = CSI_FORMATTER_DRV_NAME,
+		.of_match_table = csi_formatter_of_match,
+		.pm             = &csi_formatter_pm_ops,
+	},
+	.probe  = csi_formatter_probe,
+	.remove = csi_formatter_remove,
+};
+
+module_platform_driver(csi_formatter_device_driver);
+
+MODULE_ALIAS("platform:" CSI_FORMATTER_DRV_NAME);
+MODULE_AUTHOR("NXP Semiconductor, Inc.");
+MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


