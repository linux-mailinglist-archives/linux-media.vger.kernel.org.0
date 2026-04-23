Return-Path: <linux-media+bounces-59371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKSXFx/X6WmglQIAu9opvQ
	(envelope-from <linux-media+bounces-59371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:23:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC1744E7F6
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76260308B944
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E043BED10;
	Thu, 23 Apr 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qtN5CLW0"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754FA364923;
	Thu, 23 Apr 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932505; cv=fail; b=E9eOvKgkutL/Mm7Ybq+njNYDBh+ooaYJChhH4liFBD6PpoP6oxMe+ksrUdh4bpnj8x0cqZEyYVxbHirKMxe7HzD8o8Eo4z/FKvwOBFlUKPHxOMLwTR+lfWtMrjYYV9bPLNRYjAS8YiI47cGqBE8OKLvP+IVZcOxhWWvnOp2bbww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932505; c=relaxed/simple;
	bh=qTfbNQYJOl0EfWb6ZvLgi5GQHx1GlZhU/RMREe/0rrc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nZ9kZ4QAztbyluSoWEskN2HT6GYLSU8GIshR64KAZc8Lgf2LrXzqIGBzaF3pS3BFWPTknODRKot8WiSPUkbthaPbiBQpQFUohohSbv/nguPIfqdrs3im3QnuG/g0J3/cWS2J1wGzIS2IXioUMd5AyGzB4TWdp66FA8H52r9RHNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qtN5CLW0; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejJF/cXDcygB6XEnypnAevuzlRjsPf9GE+y6Qh8NTh8ZT4fpkDAPx7hjiwqrkVPnO2aKR5O2TCCTV73e6vtW+AvZFd8vyYXVsKqPVUzzAEBJlH2Q+yBZIWOEbmsPhB7unEnhek5nvivm6hlAfyWbuGhD5mMHZHTB7Ht6Vo+aWUqFytPIbndjNl/b1Rb8WW5+wbcaGLtM0xtUuAI0RlLtMgUMFNxu9DEmxuCrj3+3X+SO61Ww1MdupH8F1YD4XQGgUgRjUskirrgrRGWLYlYMURplCT8e9ifXHGtX0l/OPjYYe0hY51/Z9ynOxDpMZpBAWZ3uiWCay+6+a2UJ5+RYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gScxbMYe3rm6VLKB7p5bdG4iI9bvwQCDQuNbNJc4/ss=;
 b=zKFFJghCCzeOQBYcracJP0im7/DoxldMWGtqIeXSB2gd/J77fk7xgqjT6Tqhy+i8qq1pmNGumLyGlrZbb+c8eM1UbM1mEFmofIwXL2MMpMMRky/M2lToaRDvH6tQg1Z8zx5pJu+/kydc+rAuAbzaoeu4K65WbKaYS4+wQJFJQF5FndInWvkmJ0XP1Qvx/KQgVyFXpRR6uz8WZEaYPdHMGHihcy8dVIpUJSqejh0WCS+yPYnm1fuMS9MIny5b3M68aTC7ByEmVGnIyW4/JF499NImtEmKLGSfeXHtYzqPF6mLtcJusdlPZaRJqcPuZ1109Kh225LXvR+a/hbhMB4Q6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gScxbMYe3rm6VLKB7p5bdG4iI9bvwQCDQuNbNJc4/ss=;
 b=qtN5CLW0X7TsALSxPDqz8LuN88i6vKTQtIS1UwX+0h4Qn630bkvMTaCve1EsUumKFybyPays/tjYvzfKXI7FttLe23irDR5R+Aiy4LCzLVpZ+zmMhfaJdiZyvrr8BI0NxZJ3u6vFXwOyBpBMhDl/GOKVesmQZvI/DqOpQ6aEMzyUxZmf2CuXfTs5ckh0mYfIO7Fh6ClA4aUyjPhDrcypZQ1BLmB8tjGE6WNQpcCDdaLpTH9eSPWbJ1sNNmj/V2Y6GaQlkhMzd/EXvUsT6ofh2EkYYQbOBb62mjdNtNVqATdQ5yg2L2rSSiurZ8WxNgga3rByijshkiuuYnESCEIBog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:21:40 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:21:40 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:23:01 +0800
Subject: [PATCH v2 6/7] media: dt-bindings: add NXP i.MX95 compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-6-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=2042;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=qTfbNQYJOl0EfWb6ZvLgi5GQHx1GlZhU/RMREe/0rrc=;
 b=K+O/K9Jz5h83huNgo79fg6NjQFV9WwQDXqwbzLMkkEIvkxgbGY+DuNWexTsiYexQ/DOvqHknF
 hzDscA12U1IDN9Tg9DrlIQprZhlrOrWe2qAlb9yNngQI/H+XwJ4/i2b
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f89e5df-7ae2-48dc-6208-08dea1115839
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 gx+2hqR+7DFf+9iOXpMxxy5SxYHahe+86MqZ1f7k7NJcz4PzAQprbqKpn/WqMtU7sY/Wg0ClTZFVJlhCoBr6mRhEw1XOdIv8HF9LkqQPndpJ3ttz+tAuectTJIElWj4Fqm7PcQJT06tcBuv8HBqFw9lZa4VBRt7UH09DUD+jvgX3AdIlDtzDi8vXIB8/XCqbMO9M0Z5s0p2fFKuS/ddvtxJ5Jfu0Sdc3IJrSu94EEOQp8rXXxJ982D/ICa3i+JCRq7LXGUsS8f/5J11qTQOjdHglbztg2L0jo5H8nif9a20ne9tpnHLzMygg3gfMwiC1YPMy5lTmACc8vL06RXASyKUBcaPElwWHUxxo7wuGM7XA1YzWcxH1K0gu+6k9wcXduKO2oUtWfqrxkSfy/g8PlJDznkz1eiIAWVS1KOETG/ecLkjuUvXYbbMf1UCko2VoEvhaHyvQ7Gx96lbMYA6Pn5vuOINw1w+QR5/g1quDwCCf1U6jUZcZK7DET+/Ce6PNhjaf1hPRwB4qQCoDrX/El/ZdicAzP1g4FT/dRf1SEaXdMCK+gu7/7ndxYfCvsmPrO5tmdNAsiDwVoOBtdB/JTf44mIcF4AYtUqgL80Qgk3AZYcfik9qGFvN8Am3TU8CfaVp0ez64MPiGaLdTJcDriS+YhhGhx33+kzhWhuwjiDXHUTPMfHg1WC9yBG40tjNb6L0kaNlqIhhL4witJM+teFiMtKgOt8blojFUCO92chK6NPv9gpmtkcrs2aEZTSB4Y2yv93PMMakX+U4oW9Bvo01jOX56c1xAaRWzT3QOPmJ9gIjjRq71ANP+X/9TsSxI
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OUdUMjdPRHhOS3JvckdVMlZwWW9HL2J3b3pDZXpWV0ZIWlpNcnZpa1ByMWt0?=
 =?utf-8?B?UmM2Q1NGTzNyUjB0ZStlcWI0SUNhb3lhRnRkUy9oRmFEeVhiWXYxMlE2cFV2?=
 =?utf-8?B?d1BWM3BRdlNtYW93QS9MQWk2YkZKc3kyT2N2UHFkbGtlakZUbzBIKzQ3dHAy?=
 =?utf-8?B?dm5xa0d5REFqZTJvemNhWWZicFF1bmZoaWZhYjVqMGlGRHVxYUhHVkFqSzgx?=
 =?utf-8?B?M2xKcU05bnBsSzl3TXFNaVg1VDhTTHpaVS9oUUJEcWVnOXVCZGVKOG5sSEpK?=
 =?utf-8?B?ZDgyU1IyVTdqU3JZZ3pjOEdyL2czYXJ6dVdjR3hmUVptTjk0dWNkUmt3M210?=
 =?utf-8?B?djlTRHpmeThxL0hVdUk0RWpTbGFQVjZYcTF6NGZBbXdCRStmQit6V0cwTTN2?=
 =?utf-8?B?NkNHREd6MUpxWlMwRmtFMC9JR3cvQmtXcGROSTF3NWEvU05KeVIvZHlpaEpO?=
 =?utf-8?B?dnJVajJNeVBOdks4dVdaNHdkeitqVytIaTJJOHhldzNMQW10WTMzUDdzcmlP?=
 =?utf-8?B?WnZXeEJoL3JqaXpNTCtwNDE5K0E0V3dVeFhWVnZud0tkYlg0cFdPRmM5T2NT?=
 =?utf-8?B?RUdKRFZ1TTI4bjRPZTNUU2RpeEdXaHcvY01VZENNRHBSWVdGZHBKUENtWUpG?=
 =?utf-8?B?R1FmbXRhZXlkQlZwY3JlVEpyMkwyaGRiNFZ5dzZkYUNOQkIyU0x4aW1sY2NW?=
 =?utf-8?B?OGwvbTVQMnFFWU5sME94dWVMaEh3OW5paVRISVJJaU1zMXZKc1JRTGhtNG9t?=
 =?utf-8?B?TUZpWDRYeDd5NWVUUmhLb2xYSTBML0lGV1l4RG9rK0IwZWdFcU8wZU05TTJt?=
 =?utf-8?B?MzZxWnJGSkk3Q2N6cDFDcnQxL2xmeHJOYURuQUliR0ZtcXpsSWhITVZtckky?=
 =?utf-8?B?Tk9PUGR6d0RWSG41U2JncGM1WWxpMU9aWlREQ2NjVVZIblBCMTBRRFlENXdi?=
 =?utf-8?B?Yi8yK1Ria2tpdkNzdXQwUjRQK0lBN1FYWlc2WGFXSVFjZHRBa3lGajZIT2xr?=
 =?utf-8?B?Qk5aWE03cWpEbFAvRTJiSmxCYlg1dEplSU1ZajdpVGx4dnpFaTVlTG1ZVmdZ?=
 =?utf-8?B?akZqd250aXRxaU9CaGJvdi8vUmUvSXZWQXp6akREekxBd1JtNVpwZ1JYZ1hu?=
 =?utf-8?B?ZWgzQWRvNkFNR21GeXkwQ25nTlVKRWJpSjVtSlQ1UmhuQVE4dHdNa2hhbzBl?=
 =?utf-8?B?WGFjamw2cmRXeTAvck1ldFZRaXVKRWRISzVERDNJb1VPeThmcEJTMkZ3eEx2?=
 =?utf-8?B?QVh6SmVLZk1oSXh0MXFJMUNuWVNaeHFJcDZRU2t1ekRLQVlhSXY1NjVwVWRG?=
 =?utf-8?B?L0tvbG1mSE94b2NaRzdwTWVndmZOa2xTUEgwZFRRNC82K3lIQmNSOXBIbFpG?=
 =?utf-8?B?NmwzRzlHK3F4eVpMVHZNV1h5bkxOUGgzY2hNa1g1NWpVTE8wVXpKa3Z3a1Jj?=
 =?utf-8?B?b29lZzNnRnV6KzJPaWZBTUVIZnNBNDJVYmNDN29nUXoveDM4OUVhSndWZ2hK?=
 =?utf-8?B?RVJTZ2xoQWJrZys2VENkMU9HV1k3emZTOThvRDlxbit3eWc5V0g4TGpldFV4?=
 =?utf-8?B?c2NsdXVzSzVCank2SGU2ZzFPQklvWmgyaDlBUklHQlowQmo4WkordkowVnhx?=
 =?utf-8?B?WHFUTy9vRks1ME5xdGt6WDlSeXp0c1MvSDV3S2FGU3JsQzF4VklOQS9EbzQ1?=
 =?utf-8?B?NCsvOVE0S2lnelFGVjR4SlVHNWpYNFQxK2VNOWt6MForZzlSMll3RzBvR0lF?=
 =?utf-8?B?eXBTRjhBQUEvalgvZjhuMWU1Snp2OUlRK1kySGpSVEhpQUk0ZmZDdUNnRDNI?=
 =?utf-8?B?dVJmdmVoTk9zU0RWdEJKNDB4aTE4Y1hDNXdKbDU5T1lGcnlDbitkZlFYaW9u?=
 =?utf-8?B?bnErNC82VWxxY3Y5UjZtY3FMZ3NMN0krdUhnWUtjMUZudGR0dzkzRzJBTXVl?=
 =?utf-8?B?NXRocjFZeEdjV2NVS0RBeFdVTzNyYUtCSk40Mm8xYndOTjdlYnVvSnBZNEQ3?=
 =?utf-8?B?c0hYOXhCUGNmWnFXMndldk13b3hnSzAvc1BlRkhXc2RYckpzTHVYRnFkZkdV?=
 =?utf-8?B?WXNUa2ptY29xOEl6aXBsam54NUxwV01XQ2tXVzFEYUMzWTVQRHRhYWVVa3E5?=
 =?utf-8?B?M2NZd0wzOW16cEhlcXhUeXV1TW4rZTc2aThWd21CZThINTNETmJpVkpqT3pm?=
 =?utf-8?B?L1pTTU1DS1l0SVdSaDZkelZvNG53K05KdzkxMEVTODdGSFZJNTZQMjhYeHNt?=
 =?utf-8?B?T2tBRmtxN2FuUzd5RkRBUHBqUTUwd2gzK0FGQ3Z5UDRQVVh1WGNMempwY1Rx?=
 =?utf-8?B?Z3RJM0ZEeW95bnBKcVdsWXp5eThXa2lqaTgxeFBjQXBKNWZrK09Cdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f89e5df-7ae2-48dc-6208-08dea1115839
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:21:40.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKIewtJ8wCXOmwlhx4k4TawE7SixOcpJWBYCIQnp4BBLu+S+0NVxQJGDBDoNol0x55d3GjuPjUb/J2u35jLnRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59371-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: CCC1744E7F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
main difference being the data output interface:

i.MX93 use IPI (Image Pixel Interface), which requires:
- Pixel clock input
- Software configuration through registers

i.MX95 uses IDI (Image Data Interface), which:
- Does not require pixel clock
- Is software transparent (no register configuration needed)

Due to these differences in register layout and initialization needs,
the two variants cannot share the same compatible string. The driver
needs to distinguish between them to handle the interface correctly.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add dedicated constraint block for i.MX95 to reflect different clock
  requirements (only per clock needed vs i.MX93 which needs both per
  and pixel clocks)
- Update commit message to include more details about interface differences
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..4e0bc75c2136 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - fsl,imx93-mipi-csi2
+      - fsl,imx95-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -135,6 +136,21 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.34.1


