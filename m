Return-Path: <linux-media+bounces-41217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D62B394DC
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4C203B9569
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D700521CC61;
	Thu, 28 Aug 2025 07:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B1WDcKIC"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1D30CD89;
	Thu, 28 Aug 2025 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365523; cv=fail; b=Owdoz070KG/lex0Zbf2GIyXAjrnjhbTOeFY8Vs6nAAShClKZ62ZU2ZBzxXHIX5/zzhVMR27fhuDAfWyV2klIFdEwvqnZrKg65O0h6XMEusvIK7z7yc9HyRv6PgpGpJOuaVsusjDycUak9I+fM2eZVJee9DyPDzdhSNYX4X90YBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365523; c=relaxed/simple;
	bh=UAhA/N2OR4JvvWO//9JdDWWyYMi2Iin4ALUdK9RCeKg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aRhUmXiuQKiOcbs4EMX9fVU0qekvBVjzu2X1X//taL8FKXXL5qW5+rSdhZSyzBMj0B+Xn8ZXx5J65eFqMGQGczI71iKcdzeTffUtAfOs5RFOuVDOvAURktbaIHazpqypUx9Q0BRJT3RKkJWo0EX7uRGwWrTKMBUmT3uufMYQjaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B1WDcKIC; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upN7Y0G5tsUB9h7TqdT+SNTVRebFgcAGS/+bfBeR0g2xxeQm1wrVEJy6ewjnrdXDnUj/L8jAu2kQi3cCuQ4KCBI6QCvmNHaWpRjdxMgGHALYr/eFX44E6Vrv/auek7/yL3aYDgjTxsEEv9e/3hpXx/xrYrpZyMAqI6gt9SL0xVOd/zz0XpXT1z3fZXcuxyFWVlkB5Ycca+lsyxKpwF49UqG0qSpipgvvGpXy/aD+JU8voCgQ2ye/GrwS/a8JXtOdwGQcgcvyuj89LjB00WVeJi98p72NfVSTe3NMEa3AGPYAFd4Yn1Hc0QegiMRT+4KLILh/GNpX7K4U1PLRjRiQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moXnuRhTZIRyJ0jbOjofS7Ol6ukotM6BX4aTln2XDCo=;
 b=xAPv6OtgowgCEFiI/hUxjJ/XoBkjKVHYKLtj/9dBYre5o9ltuE/uppspq+lZfi8JtWx8cVitP6ojdbeTJY5wzogIAgWD9vswN4fpDkDzsfpVuk8za9ghKk47l96AOZfXXNJJHlmAX3W9LJtwX6cpAAfuz6TAPkniLKLTOKjUG9eip1SJpKsQvHb3WxlgsToSXKvQvhg/cvY3zwqm2PXe2msr/rVkW16TWtByIGC7x8ICl++gHv+cFaw5c9E2ARVHKQl/aOgn5tTVfxCzSSIEq+LJAoZd7H/wNqksnP2osrZ1swgqn0QzsNPAX1oGOfaIk+Ai+hSsURWpUM60O4rZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moXnuRhTZIRyJ0jbOjofS7Ol6ukotM6BX4aTln2XDCo=;
 b=B1WDcKIC+FB9Ariu9D899uHsWIw8KVMm4Zp91gOrPkY1bB4EdlhpBUZ2vJTtbO0pS37snZlJ0smeNrDaATyfY0Rzj0DsdZsr8ObQiPpKsIcAAbTRvRbX/hlCyMy5ewoU/SmM8oI4lEPBHeXDw8msWCig13thjpVGq16X5Ej8JPVoxS2fYoR82pzXF3k2N3SxxwV7t9i68Pe+9OemzptK2SDn7nkR58QBVOtK3UMIPFESogzEJEIKcTcsZExWYT9LRdla4xNu5y56l+G1YCIb5cl47mesJi/c1tBOhDYnMnBnaqlB7gZF7lX4R5QtFw4+VKUorZu/dFpyJUCKHZNiKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6785.eurprd04.prod.outlook.com (2603:10a6:208:189::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 07:18:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 07:18:37 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 28 Aug 2025 15:17:33 +0800
Subject: [PATCH v4 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-csi2_imx8ulp-v4-1-a2f97b15bb98@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756365509; l=2926;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=UAhA/N2OR4JvvWO//9JdDWWyYMi2Iin4ALUdK9RCeKg=;
 b=fnDaD4FkRFBfM5CGgr50X++8wja5ZpIZS8YV0/U6yPq+kWkcwlyZAcJKwuQK4ivFKXPipOUq4
 GzXXbbXlLNBBSUe5m1PJFjrawW3MCbAd8biS/IYx3U2eZIgB3hEYUNK
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
X-MS-Office365-Filtering-Correlation-Id: ac65f55a-663f-4012-adf5-08dde6031b07
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YjVwUERjVjgvOEZyMThhbjdBRlZIenU1dDU3Y01SbEFrYXlTT2QxNWRQcmVD?=
 =?utf-8?B?MllkN2ZERkg4YjlYUW1malZRc3cydDREd1dXOFg1NVR4U1ZzU3piSlpsSGEz?=
 =?utf-8?B?MGh5SVJGOVZHdzJJOXhKdGJMeWRCT0p0UFdseGFQUmMwUmR2a2EremxoeGFn?=
 =?utf-8?B?amJQVmFkcGIzdWpMZkc1b3BDVUpxR2JVVHpJV2c4dEV5RWgrclZ5Z1dwdjgy?=
 =?utf-8?B?Z3JxTVQrem5JeXVDQUlUK3k4KzdTRHY3bkkrYzhOYjNUU3VXOSt0OG9TK2pD?=
 =?utf-8?B?akwvaUxtUlNVV2FyemtGa1dqSVAvdmdOWUpJUGRGdms4L2dlbmdkZnBnL09v?=
 =?utf-8?B?QlNPYVMzdWMxT21qSTdLUG5jOHV1aHhGcHhwVHNoSGNMZVhCdWk1RVFPaEtU?=
 =?utf-8?B?R1FaQWtFenk3UXFjSENQdjBRU2QvQjZMbjJYdVA4cG15d1VGUitabVNaYnl4?=
 =?utf-8?B?QWlxV3cvbWZMQWRIVUlHQWMzaXFteDdVbGpmM0FiR25YbXdLdWx2L2pXQktU?=
 =?utf-8?B?TExvU3VNaGloYjBVOTJ0ZmFkYy81aDZXQTU4N3BlUk1vTWwwWE5wYnhibzIv?=
 =?utf-8?B?Zi9OWUpOTU9CRXVvNUNBUVpzMGhlbmlyaXRaM2dicWVBS3hITDB0ZVhlemxO?=
 =?utf-8?B?TlB4N1N0N1J2YzUyUS9JT0JEcGhtYVZjVHNEUFJRa3RTM3EvSzM2Rmo2WTBl?=
 =?utf-8?B?d3RuWGVpZzNqM1RMeVgvVGNlZkM4aE5JUjZaSmkvOERsaWRHdURBc3V1cENs?=
 =?utf-8?B?eVpDU2czVkNxYzV0V1NyQXVxQ25weGRKd1lOWXkwdUdoM0xrSHNaK1NpSkZ3?=
 =?utf-8?B?ODU1OFllS3YwTEpObG4waENuWUEwaDl6MzYwQ0pIa3Z1SEpicWFkTURoRkJH?=
 =?utf-8?B?UEVjU2FuRFpPeUYySFFWaVRJQ2Rja2JhSW40M05nNXVUZDdSR3ZmVWdDSkY3?=
 =?utf-8?B?Tk41M0p1UjFFNURwVXJNNVUyY2Y0Y0x1YUNXL2Q4VmoxcXpYZGZadm4yR1Fs?=
 =?utf-8?B?UnQ1V2diNFZGdEtVRUlaK0dzcndWUGpYa2RhckVIRG5aRjAvYjN1R0xSUktv?=
 =?utf-8?B?TDFUc041RW1sRjZVbUhoR1J3VW54OWNaSi9SRHFWWXZ6d1MzTks0YW1xM1Jk?=
 =?utf-8?B?VU1ZS0FDQWtTQ0E2dHVTRkp3cGZXc1VEQkw4TDM4a2pZaG8wNXNCMVYwaEV5?=
 =?utf-8?B?cXc0T1QwZXV4YzJBeXpFejZaVDBkYjVBdmg0L2RmWVdlOVJ2LzJVaHVkZkJ4?=
 =?utf-8?B?Q3RrNDQ1cHNVdWFiUlJpa3hoMjczWmdYdlNXU1dGbmhOZzhnU29CK2hrQ0Y0?=
 =?utf-8?B?aUpzMkwxL1FZVkRzcE9xOGg4OFl1VHpVakZqYlpuQ0lmMitEUkU3THRtK3hB?=
 =?utf-8?B?YjRSbHN5cG0zeDFDemVNdnBXWnpsaUM2Y1BTYlNZK2Y0UGEzb3lWOVdQTGlP?=
 =?utf-8?B?SlkwYWtkNkxJUUIyMWxKdTJRT3Nnd0lCUXZJdW0xV2FMeUtGcmt5bGQrTzVU?=
 =?utf-8?B?eks2bUhvdjNBWEJZQy9iQmc2OEIyRGFWblVVcFM2RXlxUEttczJlWm9ENkVt?=
 =?utf-8?B?ZElNVGlzcXBIbEVZQmI5dGhhRnJicVNTcHR3UHcrZEt6czlRY2tiWEt4S3pZ?=
 =?utf-8?B?RVgxZDFiQ1JkWFkwVTUvVWNRT3JsZkhIN2l0UzIwT0ozcnNLZ1ZsUUxvektn?=
 =?utf-8?B?K2tVcXlDcDdJQ3ptaWE0QW5iR2NDUWcwNHgrMzVsZ3BhcS9oUlJvOHlQZHRL?=
 =?utf-8?B?YzUxcGcyZHNIZzZqeFg3UEtOaXE5dWxEZGovWkNHYUZBemdhRi9TS0dnZVRz?=
 =?utf-8?B?R3RPekE3UE9nYWp1K21WTU80KzliVmZvbjJ1YkNDb2NyTDhYeXpPTEozM2FX?=
 =?utf-8?B?QTBDc0ZXWmlKakVDL1l2ZGdMR255Z0RINmtEZFhDbVkxU0JHMlZ5VGprd1p5?=
 =?utf-8?B?OEtmbk1pNkUyOVkySjRjbEl4WUpLdkFCWHBUMk04UWdwU1NNOHVoWTRuaDlk?=
 =?utf-8?Q?EP81PXBFab46D9H6bE8Ben25mYRX3U=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WmlFTzF3RldjYjJQMDVVS1J3MktBaWFsY3BSVE5HR3Zhc0UwSE4wSFpNL3Yz?=
 =?utf-8?B?M2s5SFdlYmVXZ3ltbVhySEg0Q2FXcWRWc1hnWEkrTFdWVFNISkVWSUk2ZjdQ?=
 =?utf-8?B?UUE2RmowWnJiZC9XdnN1UStMSXVjMVFDUWVOUlNVM01Vb0VSamJwbXFEVmRP?=
 =?utf-8?B?bkV2QkJCUjUvNGxnZHNvMzllWkFNYkR4VGFhVVV5N1o5RHJud3hjQmEvWFp0?=
 =?utf-8?B?K21mbkM3RitqVzJteU5rYkhESkpJL1A0eDBGcDZHd1VSOWh5Sjg1Vk5JWHN0?=
 =?utf-8?B?ZjFkY3lDNlY3VnM3UWJuUHlHUDZQSTBhZkhXTVJSRnpXUVZTVnZrVTZ3czgw?=
 =?utf-8?B?MkJkQXRSUGdFMlhCRFlSWi9TL0VWSExxcjQybk56TUQ4ZTl0T3lxNXJzQVJ3?=
 =?utf-8?B?Y3Z4WWVONm9KcEUybzlhVTl0bDBsNzVyWDk5SDFSZXRCRnIwNE56S2hxUjNQ?=
 =?utf-8?B?UWNjRkIvQm5CanRLUFlDRW9NVldxSjBiZmljZS9ybXdsbHNQMmpMU1pkVVps?=
 =?utf-8?B?NzBDOGR5eFJmTTJOK3RUTFd2VFMwbmc4UjZQbjE0STVDUmxsTkNmMG1yS2JT?=
 =?utf-8?B?NThjdFpmUlgwMVdMM3BxTy8vbFozVytSSTM2eW5uUHVoZTVJK1NFZ2tCRGFI?=
 =?utf-8?B?MVJaR3RCSEJHSFlWZVQyd0hGRlgwQVQ1dHpIMHdZN096WC92eTBqSUNjZjd4?=
 =?utf-8?B?WlVJMVNGZGV5a05yUnBpbTlwZVJvN3hsWjh1QXA4b1ZUWnM0RTFPWTR5WlRa?=
 =?utf-8?B?QkdhWmJCNSsvRFFGTWdIV0ZXeTZSTmdtdlZwT0wrMXBmRkIvQU5YQWpHS28y?=
 =?utf-8?B?Nnh5TTZENy9VT21vb1IwOTFYaVEzM2JoemNwdUgrQlAyQTNMb0c5Mit6bEVs?=
 =?utf-8?B?QTZmNlFXOGpSamYvTmlBakJXWHd3aTFYYUE2N1VTd0N6SVZBUWEvZlEyaE1T?=
 =?utf-8?B?MzZaK3NqRWxCK3ZpRkplYTlhbHMrM0t0SjRrVTFzL2pYS0ZHV0JDOXhreDcy?=
 =?utf-8?B?QTc1VElvTnR6bWEwNWtQNWRJL0VKU0Jad3lIanZoMk8wSTBjeWRYVFcrNnhq?=
 =?utf-8?B?K3YrZGYxclFtNDZuMXFLWU5MWnVwazgxWW8zbUNsMC9JRWdaVjRZZ3hSVnFn?=
 =?utf-8?B?U0o5QlpjS3ZyNFMvUm1HcFI5bldzejNrWGVpb28zRGtVUUpPNUJBUWRBdnIx?=
 =?utf-8?B?Tk90VEhlaytGdzZMRXdGaHh1a0ZKYi9Uc3RHaXFKK29vTlB2SlRhQVNZOUNE?=
 =?utf-8?B?aWNTQ2M1elVNMTcwMWhKb01PalhoUDBwZDVqcU9SUzRIUkNDMWRQRklkbjRV?=
 =?utf-8?B?aG1oeDNQQ3NHdTVJanFlNHpkWGhJQ0NvSGk5L3R4QmVlZWhKSmFob1k4YXYr?=
 =?utf-8?B?TlM0UjJtaDdtQndVVnE2d29BcnhWMTZwaUtnMnBpajQ3NEhlOE54S2RpT1Ax?=
 =?utf-8?B?OXFrbnFoQlVrMVhDbnpPSm14anA5KzMzTDlwZWtva3Q3T3hTc2c5VzVwcTNv?=
 =?utf-8?B?L1JaT0hqdCtYekhET2JXMGQ5cStqMFFxSmphZHBTMXY4dG1DTE5mVGNkYldF?=
 =?utf-8?B?enQwUzhQSGZuVEp5clBhV2NNMjZvNUVlSmFGN0d4MXZhd3d0a1JSNXpwdTZS?=
 =?utf-8?B?SWFIY3VUbVN4Z0VqWHdlc3NNbWIvZ09takQ2QlVvSXpoY3BwUUpEeW5VUTZh?=
 =?utf-8?B?ZzhDYzV3YmhtYjdDdDJyZXRveVlOS3I3QkRCa0N1ZzUwTnhDSXdEUmEycGYx?=
 =?utf-8?B?eWl5djlUb3NpSE1GaVI3RWxCNHFyMzA0NUowVGttb3pHSlI2WFE0ZTNxcUtx?=
 =?utf-8?B?VUhLbWRRdzZ2bStYQVZjTGlQLy9YZmNtWVpieDRobUlFNmcyYnBmbE1vUDdr?=
 =?utf-8?B?cWtsaUF2Tmx2cDNpK21HaGNxOHNhS2tMUGdtd1A5eWgvQ1FpbzlkNnBRekNa?=
 =?utf-8?B?OTZ4VWlCVUVDQktXY3pYMG5mdGJGTmgwRDI2eGdTWmFIbkNTWnhyaDZmRGFp?=
 =?utf-8?B?NHNPLzVSZzA2UTdkcTRVOGV1aUR2R1UyTWEySHlpb0doWDdwRVk3Qlduc1Ix?=
 =?utf-8?B?OHA3b2VzclV4Slk4c0N1UWlhVDBHK3BVQmZYVUY5eXpjWFNjYStqNFBWTlFh?=
 =?utf-8?Q?yjY875ZT0vtxNoMcgOCd+lWh8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac65f55a-663f-4012-adf5-08dde6031b07
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:18:37.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4evaQYZn4zTaB94NX3yWlqGVlaPEySe4SL8tQ9t+r3ejAfTS6ItV+tauE6/amooro0QREzQ0qFhRQzMG6NRgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6785

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
clock as the input clock for its APB interface of Control and Status
register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
same restriction for existed compatible.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..38900e76553f639036815c1ae5d97f4dc46f5b13 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -21,7 +21,9 @@ properties:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
       - items:
-          - const: fsl,imx8qm-mipi-csi2
+          - enum:
+              - fsl,imx8qm-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
 
   reg:
@@ -39,12 +41,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is clock for csr APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -125,19 +131,55 @@ required:
   - ports
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8qm-mipi-csi2
+          not:
+            contains:
+              enum:
+                - fsl,imx8ulp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mq-mipi-csi2
+    then:
       properties:
         reg:
           maxItems: 1

-- 
2.34.1


