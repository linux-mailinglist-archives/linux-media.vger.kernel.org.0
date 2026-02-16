Return-Path: <linux-media+bounces-52928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFqHB0luk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:21:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E8A14745A
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7072C306361A
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3262ED873;
	Mon, 16 Feb 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JnXsbkE7"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702721B185;
	Mon, 16 Feb 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269555; cv=fail; b=EBr6X6WRY8lTgkyINL1wogHO+N7Ev+LH812SfaCIQoS4H9/rG+FMpFd2O+VZ5P8XU0A965DydMyPZM381HoF0PBHZHh68qnjdWMvkwHsmx7KW7oE9prfrCgdAwX2cg4lfOKbvf7+kGe6fdthsMcPTzb0YIOerKFWT62QyGPdEJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269555; c=relaxed/simple;
	bh=nz6PgT2/WB/nQj+S3EJGo+/N5sevH57Nzc98WcGHhHk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SEpcodFjeWU5XcyxYnzrU29bwX97hfYCCCbNZ//3OpskC7ntGbo605znIMl3Oi3xngknKOuU3BWIDZYKb0c+p8xvId4kLTG3efL/h3ZfmH5P54eibPoz9jBaE7NVlleOLm8hMr5oq+zkkE3Mi9aK3h+xc+Mj60IDOAKPytYY01o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JnXsbkE7; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=og5Zwrk89lc3FLor43INnd/oErE+Y7xWBWAKBr70FgeBRdFyKnhqg5/tmdoPivwrbwcqd92MjlMi1DnSYLkSkb9c9RJG0BW4Pjpss91UX8IQr4zxak6BwToStMmh+gdKIByFsqDnsVef6LpgjYSzhHFwAzRHn0MLryRKgeJub9DMJAT4kElzZpCnhTBnQ0vpNXNF+RaiOP9yHCoj7FVoorlHfqgobq1lLthAuYXMigwDBmCLqHEXXmCJ/O5wbuP02/YXBXZCVUXgoqnClHETOI+elnXaLMv64rB+tb1yuNPZC34TutirluMDVetVq9sRsv/qd9OSFVrs0+Qo6oCQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLqQYyxjfs7GSkxNzVvjeesGmwtsDi5YgIlmLXo+T3I=;
 b=pWt+K8n2pG+JelYsNeB+ddGUmIYKRnLITdMb2lmGU/HemYDZC6AE6IP9YpApKOUdwBnsztI6Or7ikPmUY83GkQFp95pOESeKLx7bC0EVTrUEx7SzzFdUkkbukdkSk69zrfrBP1c9F7GDgBEhWmleo2AvcpdO5UPp1lyR8G+wEQU7vx01V35o0ldJaOHa5zJ1eMu/GFFwmcq99FbNUb3LEBCcyr0Y67kHBdwguliKCnI2nQls0AIQqxJPdPvZvaxZcZRASRyUWfzvpzRxUfoRxq1exi0AnilLiguBw/Tzi+oorf22+a7/a5m53g91dHa9PF+dGLMtomrNZb2nQnI9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLqQYyxjfs7GSkxNzVvjeesGmwtsDi5YgIlmLXo+T3I=;
 b=JnXsbkE7XcKytv+te6pv/bsQ1SmAn17BMKdWalN8hNHQFeceSwQJSicq0EqVJf83Jy++zijJXcsUHyVzIB8H4L/m1V3ea/7WFQuNnPu1SmBT3ThXZ5GhM2bhj4YHX8FWKmNWhQFijSsuzhbbo62DvVlXdxFR0XiUq8gh97CCmuezb0suqkI93wN4p7Dm9b4cDUlZPmNSrrIwe6hTgpPHWmEzxBgG4sUeUWHAnSJdlLPnEQGBHF3c3NzMp3GZv3u8cfMQc7Fna10GDQKVbaYbfVKBUv49a9pQUb30c//u/qW6ruZtBPoWK0S/TquOgGRMXnd65m/p2cGbhVqxiu4kIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:19:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:19:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:43 -0500
Subject: [PATCH v3 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-5-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=2649;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=nz6PgT2/WB/nQj+S3EJGo+/N5sevH57Nzc98WcGHhHk=;
 b=9aDZHvxlNe2blq2HX7/JQXc80uVzUT6RRaqZvZ4JBJLKuWzP4Qhn7I6Hwftv6nuYSJFigjBi0
 5jBp1Cjezm4CXpKBMyTDKVVGjWsWGd/G0fTZoglOdXDTzldLxFB0SyD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b76dfade-a1f2-4bfc-a840-08de6d9042b3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MWh5RVdseVhsQkNCMzgrQWZxOHpZdVRVZUpJU3lIZlZkdTBpNU9WaGtBNkp6?=
 =?utf-8?B?Qk5pTjVGR09VdlI5SjBYblNydVhac0p0Wjl4SytESkJVNjhiMEZIaFFGajJW?=
 =?utf-8?B?NUxiNlJISnQxMDRRTHZFOEh1V1lXVW5COHkvVlFkSi9JR0EySXhTU0lydTM3?=
 =?utf-8?B?ZTNqU2tpeU4rTFFnQW1SaFg1azdlUDhCb1JjeUhLeHI1MWdJL2xjSGxtcWE2?=
 =?utf-8?B?REtWc3dDVGFsZ3IzUHFHNUZlOWFLVzNKS1dGWlVVS3M2b2M0VFVVRzlsR3VH?=
 =?utf-8?B?ZmxpdHRGdHF6Z1R5L0FFR3A0K0NoUTdSbElFcGpFWmZvY3NpSUJHa292eFFX?=
 =?utf-8?B?UHh6dlk1VnFGSWtTdCtneWZ1N1JtOU9HNnlRMjFTd25LVk52Q3Jzd2tudGR0?=
 =?utf-8?B?Y1ZKb1JDRFJCVVd5RFNYSUxBQXhnK1Z0T3ZBTnpoOGd1Nlh5YTRnbm96TTRs?=
 =?utf-8?B?MVYwcGZySXNkeGw0eHE1K2thRHJKYWhxdlBJK1AyczhpTUl4eStuRVBhaWR3?=
 =?utf-8?B?bnRsamhIaGRuck1NditwVzVLdndKOWNLbW5ZRG9taVFnZi9ZL0pKQ3ZDK1Rw?=
 =?utf-8?B?K2c2aFptaDdWMHNZN25MSDlEK2lQeWJjS2JiOGo1VHRDWHNQdEtLNWZRaEt1?=
 =?utf-8?B?WnRUQTI0QVdYRy8xRHlWV041TjcwRnJza081WlVpZStyQzA1aTdwNVc0S0ZR?=
 =?utf-8?B?SFp3OUVOZDdRV1FIVXJQUGJzZWtoY25JWm1KVlN0ZVBUdU5WWkI1Q3pQUEhQ?=
 =?utf-8?B?MFhXK2JHMXQrQ2NlVWYyTEMwRUJyUE1LMFk0WWttSjdDTzVEU2xTQjU3MVdY?=
 =?utf-8?B?d203T1lyTTJzU0NUK2FTTlo2NExVVW51YVU1MU5EcXFBTWtQMjFjOHVJekww?=
 =?utf-8?B?WWoyd1EzeTFaUDZoang0UkpydWJYN3c4VEwxdWRhN3hJbnZYdE03ZlVTdG93?=
 =?utf-8?B?N1lieXRzMmtkOWtKWkZaVG83TjlpalJCREpDSERmbHJUWlp6WXBwOTBLaURE?=
 =?utf-8?B?amM2R3ZjZ0JycHNISnBYdmhLbXRUQkJvaWgvcVlMUDEwM1lxVVZiZmlTTWll?=
 =?utf-8?B?S1BjK20wRUJNNzZ5OXdISWMzT2RzcDRDRm1ER1dJSFkxbzl1d0hBS1RpaklF?=
 =?utf-8?B?NHZ2Umw5YVNNUzd5ZjVBbnA0ejZVUDFac2ZBTzJzRU15RFpXRjlQU0lraU5u?=
 =?utf-8?B?R3dLUG1KUWxGTU1BZ25rTkhqWnMwVXQ0SmFMdGxGU09IVE80RmU0eFdTSE9h?=
 =?utf-8?B?WlprZ01rQmJFK2YyUlpMeXZ2YnhiNlRmeWtGVnljNmZDYXJPaGhqQXhtYmNR?=
 =?utf-8?B?SHRJelRIMldoSE92ekI1bExFcE13eWZ4VmJibGcvQXp0cjM1endlU3piZU9n?=
 =?utf-8?B?dnY0YVVoUlBCODRseVoxSGc2cDBhWGxISE5iY3JtVGFtMks1MUVQNTY5bUk1?=
 =?utf-8?B?NEYwMG1JVDFVL05Ed2xlL1ZLdWVieHRzVm9Sc3BPaWdEQmhpcHMrU09TODRN?=
 =?utf-8?B?dDBsZGpQRHJOZXc1Y2xTcDFGbnk4d0dwVGkyNkFlV3JRSk1wR2txUlFwNzlZ?=
 =?utf-8?B?RVpTQnd4UEpUMitjaXhBeGR4WTYyY1NtaStOKzJHWnZ0dzk0MjdOQ0tOcmhW?=
 =?utf-8?B?eUVjdXByRVN4SjlQcWRyQTZrZG5Kc0hqanM0NDlhelNobVVWa0RzbHVkMkh6?=
 =?utf-8?B?K09sMnBxdlhTUW1MeVQrODZJVDhweDBoSjd3Kzl5UUZrbUwzT2R4dks5blVq?=
 =?utf-8?B?SHlJVGEzTFRldEtsUk1DK05zQVpZbXdSQkhtcU12eDYyTW0rb0pacHR5K1JT?=
 =?utf-8?B?VkYxWU8xUGtjNEZnbnEvUHQ5TTdsMFBpZFhXR0dsakhpQ3h2NWFKVlJtdmhk?=
 =?utf-8?B?d3llUXJLcXl3MVNQQ3NWQitkdzZ6T0p0SlJva1VmQ25EQk1HelpKNDRRa3Zk?=
 =?utf-8?B?Qk9NVHdaZjF4bys1YUgxZlVEcGJDSXNNZGhuSXNhZnFpYU1FSm5uUHpCWG9h?=
 =?utf-8?B?bHV4TTBrTzArTW1NL05uVTcrN2FhZVp2WVBOUGZzRFY2VVRYMkJ1eE9RaThD?=
 =?utf-8?B?dDhxMVhWSTJTczNMYXRacDdhUkNPbDZzb3RoN09CdytkM0F5dkE1UFI3R1NN?=
 =?utf-8?B?M2p6ZExvbVY1QXQ3YWJZd3Y0Ynd5NXBxQmVENExSbzAyUUJyaVE5TWtSRjZN?=
 =?utf-8?Q?GfAnQOcauk2K/gLCcpQqXDc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d1NnTVdPaVFlSWs1ZmhQRkNLamVuM0JyeENMQlorQTVzRzZnQ3RMaDNHelUv?=
 =?utf-8?B?R1hJbk0vZUtwUW0wNG1CaUdyQXZKd3JzVnRreHJUWW9VRm4yMlpRMXcwK1oz?=
 =?utf-8?B?U293a0tXMVFDNGcwZ3BMODlTZWR2VVFvcGllVHNRZTVpYTdjYk9kVzhNN2x1?=
 =?utf-8?B?YWhZekxtZGNaNFZPRFVkb0FFT1dSdnZVUHkwN011bGRMbVdVdjZRVG1Tdk15?=
 =?utf-8?B?UnVoSk5wUm1LaG9SMVJlRHdOYzlmSTBZdVM2UEdMOTlWY2dWZ1RQaThhNjlM?=
 =?utf-8?B?cFQvcEEzY1ZPN3NGQmFUWHdxeFZCdGdsdm9ubldxekJxekJ3SWlhU0N6cFVp?=
 =?utf-8?B?SmV5L3FMRnN5U2k5NnhTMFdxSk9TTTZVQ21EOStrNDF5UUM4bE9kdC9EMWtO?=
 =?utf-8?B?bG9MYlAzK01ZVDZlbFQvK2d0Q1hOemNIaU85MnIvYTZ3bHFGT3lIY1gyeGhF?=
 =?utf-8?B?YnV1T1F2U3VUUXEvMWl3di9QTHk3Q0kwanh1T1BwZ1FLK3Q0dnVaVXlBRjkv?=
 =?utf-8?B?ejVjdFFJNmZ4V09ZZEp2Z2UvZGVGVWRCRENmU2Z6U0pnN0V0NlNQa3ZxS29C?=
 =?utf-8?B?WXkwMWFDbFZDZDlYc3NScXlKTVF0WG9vRXBzZWJ2cCtLTGJRVmQzYkxLV3Bp?=
 =?utf-8?B?RUs5bjUyTmhucEJGQ0Y4NFM4THBMejRXTXl6Z0hpQ2U5NUMwaXZSdE80RldU?=
 =?utf-8?B?cGpaSTZNMTAvT3BrSWt5d0hLRTBIL2cyalZHc3hxU0NvRWdRY2dqbEdaUWN5?=
 =?utf-8?B?NUpBalNIazRKOFp4SUtnOG1ReGl4MkVDSklIbVpmM0FSa1I3dHBudEIyWmIy?=
 =?utf-8?B?QXRKYlUrT1VxQXlCVXU3OENiYnJPYldxSUQzc25GN1d4K045LzQ5TUEvVExq?=
 =?utf-8?B?N29UeFFUMEpLcThIVThRU1dXakRTdk85Q3ZiSXE0SGhkZnp5dFdZYkRFNE5v?=
 =?utf-8?B?TTYycWsyWXRkZWs2YVFRUFUxMVZuRUZ5MXY5eTdmZjlPYzFwa0tRTVQ1WWxP?=
 =?utf-8?B?bFp5T0xOc05LQVo0b2R3dEhkbk1mbmZrRjYzWDQ5dWpPRENtdU9uMXllL3VC?=
 =?utf-8?B?UVl4a28zMisxVGViVk1VMHZnZUJuNWU1WlJEcGVEamZuNkYyaUZzVDRWNS8r?=
 =?utf-8?B?eVoxaWpQclBrbHlSRFUzY093UHg4UVFLNWJyaTJQQVpZbW9xT0cwZ3IxNTlS?=
 =?utf-8?B?NlJ1OWRTNmdUb1lBeHVFcElBb0VVRkRyU2x5ckZLcDI2WW01aEVyT2dXQmxw?=
 =?utf-8?B?QTFUM1E4empnelZxM0pJVHFlYlhRV3l5UmFQUEpQZHdsc2FKOFZRNW9WZXNo?=
 =?utf-8?B?ZXdsZ2xCaEgyaDVpWlpRNnpuQ3BnYXd1VzltbTBHWFp3YTNrT09nL28rK2FZ?=
 =?utf-8?B?TjdwNTArM0ZrMzFqVmdHWXhtbUo2cGtOaDJTcWJ4bW1ScHgvQ1RXNEI1aTNI?=
 =?utf-8?B?RVNOb2FReHBaNjIzbVF5UjBPa1dKODQwbGpQUEJWYUZnTEtNQ1hMUTVkMU1a?=
 =?utf-8?B?OVUxWkV6c1hTcHAxZ3k1czFtbkFRV1FteFZJVGJrNXhSN0YvMzlkWDVFRG1q?=
 =?utf-8?B?VTFLUVM1Q0RDeTRsNU5RTEJ4Y0srZWhaNnZFcUdYWW0vZEtnK1VaenRUVVlG?=
 =?utf-8?B?dUVoTFUvc3kweERmR0NWTVNQTFlqMGpSdDVYaCt4UnBxUDI4cnVLcTRaR1RJ?=
 =?utf-8?B?WGtBT2pJbTFzQ2kzV3MwbkNpQi9sNEFnemdLTnR4MW8rTTBwdVdaYVhjV0R6?=
 =?utf-8?B?VFM4a0JITXR5ME0rZ3VWbEdwNWJ6RjVKSDJxYUFmcUhIWjdKRXlkQ2RGVjQ1?=
 =?utf-8?B?ZEthMVpMYThKQlNneW8xSnVZN3RFcHgyNi9FbkkwVXJ1U3FsbXoyalJhTGR0?=
 =?utf-8?B?bUVJSk04MmNXTE0wZmZRYmsxcWlVMDdwLzd2THlPUzVQZlRYWlQxUUdJTlFm?=
 =?utf-8?B?RU0vaHYrNVJ4UWc4KzUrMkh1aGpFMDRXQ2V4RjdTWW1oYWhycG9wOFZ0bm1u?=
 =?utf-8?B?SnpxRUpEaWhlN2VxbUVBU240RVptNmlYYXRJcTQzWUVZaDdqaFJGcWQ1RERV?=
 =?utf-8?B?WHpQVmpuQk1EdGcranc3d0VTTDg5TlhvcUV3S2lua2hlQkFTYmpUczVFOUd1?=
 =?utf-8?B?Q0J3amxLZ1B3bk1EZ0ZQbTk5UDJ0c2Z2UDRTTERuaEZzQW5LM0k5c1JSbUk5?=
 =?utf-8?B?c21PWEJJRGlYNUJVVWlSWFJha2dQN1FwZDRqT3MwTThqbllhTnJlc3lMdDR3?=
 =?utf-8?B?Rm52V3NZMEZIRzczY3BEL2lEMFppbmhpNENMK3o5V3dXQTk2elZTS1VuM3hp?=
 =?utf-8?Q?WkWUSvP2QEYqF2NzMB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76dfade-a1f2-4bfc-a840-08de6d9042b3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:19:09.6522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqYkJQ06kMQj8vyb7QFwlfvuGhUW/wltTLeJ2RWaJUw7K9Za1VD/Qmhlc3bPiOjiUb3wundQtfjU0yP+PluPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
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
	TAGGED_FROM(0.00)[bounces-52928-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: 72E8A14745A
X-Rspamd-Action: no action

The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
Rockchip RK3568 implementation.

The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
"fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
RK3568.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- use RK3568
- add Acked-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - fsl,imx93-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -26,14 +27,23 @@ properties:
     items:
       - description: Interrupt that signals changes in CSI2HOST_ERR1.
       - description: Interrupt that signals changes in CSI2HOST_ERR2.
+    minItems: 1
 
   interrupt-names:
     items:
       - const: err1
       - const: err2
+    minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+    minItems: 1
 
   phys:
     maxItems: 1
@@ -88,10 +98,43 @@ required:
   - phys
   - ports
   - power-domains
-  - resets
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.43.0


