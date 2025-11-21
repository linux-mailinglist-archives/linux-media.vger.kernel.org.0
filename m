Return-Path: <linux-media+bounces-47539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2CC77099
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76438356213
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743B7272E7C;
	Fri, 21 Nov 2025 02:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ps2dRj44"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AA296BAA;
	Fri, 21 Nov 2025 02:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692900; cv=fail; b=W33NlMev/XMIlFk7RC88Gspw8wAhPCQhHccTNt2WtO3ssvCgWWDp4gwHrmHK/XuSCw8W4plPAq4VxFSnU5lW09a6hz6VjV7eY/9Qb80SP2cZ5Raoij/xYYPx8x/b/4OR53gFvZ218JEriFEkQb3XpYDG7ZyAKoUkVyZvjpOrUaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692900; c=relaxed/simple;
	bh=oNi0Mmv0+5T2a8aVYHHR+mPLHtroiiadmHmhFg+bAX0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rrwWu3SLEQ762Q0qFtq7D4vVTVdNtdcasWxxRd/jpQo8OLjhBBLh2a+lAye9YtkTb1yASD8Keq4PNzn6WnFhdpJQ39rGyZokawL1pf9zfi5527fsdviItB23BOGfyieN7dNhVqwGqRN0Ul6eSLtgF5Kkp/31j4V/H1qAigp2q20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ps2dRj44; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gj1MTcXEJk9pNbBrOAuJ4x7jJIMo+OpziEEqDIZhRxIMDODkcA9stXvq5LxcDRk6wiZpzeb0ChmL+EvMdob8K4uos9Bs8QHo6cI0XWwraaXqp5sG+sp76kz+xbRLRgQfqrgQugQUmb0isbc45f77FObnDAg+8p9PniC99eUFd/JfAnxf98gei/qvURIGzta+LZmit9VSKnS64sMxXc30cssb5wHzZzg3HtXHRzLcwYJv0XIbxU4jLoFEQH1ZnnE5Oz/u+q9hzJV8lpyu5XEsnivWkgX7I+eRWutfaNCFRFaiclHEcJe/mrGN2Qd57T/s5jb4708doP8BzgfL4fricg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kbrSeA2ymhFVjdiC6YaitVkJnKrsBq0rRH1hknodW8=;
 b=Nvhwo6p7uc0vO11Kjn4fCgEmxksDkPPDWbPjYoBZwAEVX82P+GAR3ypieXceM6J67BW4NHzAa5YwEtmhpH4+6axRk/Fsaiv6vjNJyq7QUxNIZpNBfp7X9SPon5Yzj63l+mWnU/n8V0C4jDxM9+7f/C5KpmiOFPZ1yxNH6PK/trkg3kmKd4ZhvQHPvOtJVE5FBvCXIIY66nk3XHk07idTpOJ+WZhWWF1jtultb4Q+ULlHGYTlG95T+nFyEWP6Sh+zHVevGyTprNyP962ljFso6V/qwu1E8oI5SKJzBus8LFmqbBEb7csqj1DHCFiuxb25S/IFDDuDcxyXyBu/qPjbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kbrSeA2ymhFVjdiC6YaitVkJnKrsBq0rRH1hknodW8=;
 b=Ps2dRj44HxOa6cvbfL8PE9YoSQ8kCu2QnDAenfN4c5IIolspNUbPELzzsWm8VxmRG1hTybXrRgHnNYyWT6yvg97rgmlE6qKOMs4nJoU5r6T6OWBbjSh5Oaaeojv+LiGy4MjupcWPyIq3/r3jqYxeDJ3eu6num3IsWAiloPJ1YKARm1SQ9Uz3aE8x0WkczwPhCwnU3b55AtrEQWoyfKJiHZ9AoBxsCEV02JXrXibwGannmC957AJvXJ4TaVQ6tIHX2VUYfno137j+VFScv/e6k6HYAk8CbquOaPzaBR6ddwVMUM3IA4EMWi1wKMme2u2PEoxKQw82ffrSJeo8SpS8Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 21 Nov
 2025 02:41:35 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:41:35 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 21 Nov 2025 10:41:55 +0800
Subject: [PATCH v9 4/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-csi2_imx8ulp-v9-4-05b41b897e50@nxp.com>
References: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
In-Reply-To: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763692932; l=1214;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=t+a81OLQrJrjWUzID8IiSu1QHIrjs+uIpoJSaoxZEC0=;
 b=RjuH7r3JVCs6hvCYp8u2e8xGN2RCuwjFrEi/bY4JYdeX4NRO9H14HZYI0tlqf7Chp0TzPo/j3
 A6WAUSDdg9TBFr2C5x20xeS4IcFeITWR7N00VEpfim1ovG6pIEU4Xnk
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 298533ac-aff9-464a-4258-08de28a77cda
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Yzh0ZkRSR3JTTVVZVnVIY2tmMHFaQk1RdU1NOU1kUVppM3lkY1NxeEw4Uzhr?=
 =?utf-8?B?bVQxNnFWbi93cm5UMEI4NHlSTloyb1V3R2Mrdk40ZVUyYmR3bElSeW1mYXdB?=
 =?utf-8?B?QURHcjg4T3BWQ2wvOWt3ay9OZXhGdHlmUU44Z0kxd2NkbEtWcW53MEJIQmNw?=
 =?utf-8?B?MmZYQlpLMHhEQlpqN2dISTJ1NVorUjB1UTQxMjBJMlZDZG5rWGpNR1dZb1k0?=
 =?utf-8?B?MDJOVGNLYTBMbE5VWHVFRzhmUHc5aHZTNnQ5bE8rdUx2cFNGQktEYTlxSkxM?=
 =?utf-8?B?SVNWNURkT0xIekdwNTg4YmRkVjQ4dEtIbFNLWi92TGZQWFdJVWg4K3RXOWZa?=
 =?utf-8?B?YVR3SmsxUU1zRDk3R3lHejRDeEhoQzZEaHlBWTZRUm5iU1p3V0pYSmJHcVhF?=
 =?utf-8?B?Z1JNMjRLQk5GREJoQzFKcnFBc0QzMDdtT2JWY01pNlNGUnJONnRqSDYzN2JB?=
 =?utf-8?B?N3A5eW5PamVobDNZcjZ5Sk44c3ZSRDNCRmtuTzJpUWVrTWpHK2xINEhhT1NQ?=
 =?utf-8?B?MS8vY3Z2MHJNVDRzRkpHVVYrRDlLcjFYVU04VXE5N2tnUllPQldvT3E2WDdq?=
 =?utf-8?B?SFp2U3Z0bXFyUk1VbGY5YmJ5c1hEays5YzI4QzZHTmZEY3RvaTVLR0wxUTN3?=
 =?utf-8?B?aTdaTDFYWVJWZmdUc2FsNnpDdFBIZU9QUWFvL2FSeTkvRlBhM24wQnZFc3JE?=
 =?utf-8?B?TUo3T1lmbEJwdDAxMmJBYm9HRmxyUXFudE4vRUlXZjIySUl6QXBmdE5YMDlv?=
 =?utf-8?B?M0kzMUFUZ1NUZlE1SU1wNEJCd1ZBQ0VSRTBmUTh4SEF4cjhUMUt1alhIbmtG?=
 =?utf-8?B?ajZmTmhVa0U2NEJISHI5QVlxWE1RbXlnM2lwMm0xMHVaQUVTWkdKNmJVSDBL?=
 =?utf-8?B?Z1BmaUNBblJVbjlWSjhHenc5eXFDUDRUMEhiMTh6TGM5cVpWaHBpWmlIcDVC?=
 =?utf-8?B?NFFVNVUxMitjNXhCYlB4eWRrOVl3QUY1VFhCSU9WWSswQ0ozUmhGanNwbzBG?=
 =?utf-8?B?MmcwejE1M004M2hrUVdON0dQMkpTRlhOWHVlVWJmdE1iR1I2UURCSTFVMFpH?=
 =?utf-8?B?NEVOVzF4eDlKQTR0ZXowMXZFUjBDV1ZURmJDa1M3UlVlT2U2dkdvUUYzbzA4?=
 =?utf-8?B?cDEvWm4rSlJWQXBINVQzN0FmNzVqOVRDYUFGVlltdXNpTGdBbGxHc29tN1Uz?=
 =?utf-8?B?cUY0L1FJeHgvZUFmcUN6aldCRmYzQ1NmQ2dIeUZBb0tyeDNHanNKTG9jdUIx?=
 =?utf-8?B?UkFZWitDRUR4OWlHWFJFZ1NkOXpBWnNiakpCaEp0V2NvVkNIRnkyWnYvRWhX?=
 =?utf-8?B?VGl0czFrVkR1ZWdPV0tSODhNM3p6RGpqZTBYa1l2bFI5dCsycXBQdzZqNFVv?=
 =?utf-8?B?ZExqd1hTWUJUb2pJbHZtR1IvLzg2dmQ3OXJPZ3krempETFczaWRFZ3FOMHFD?=
 =?utf-8?B?dW5LYVh3c1NPR2czSjNrZEtCNHF3MndQTENteWVTZXQveGNRRmw4OEtWMWxu?=
 =?utf-8?B?S0ovODQ3YXdqQkJQUG9HcFVzVExmYTVCU3V3QTRtb3A4WWxCTlRpbFZLQ3dJ?=
 =?utf-8?B?TUllWjV3NTEzQkFydDVEbHQ1YU5kWXBHY3Y4aGw3cE9vZkRVM0VtdkZIODB1?=
 =?utf-8?B?eXF6bHlXSm5sQ1FkdHZmdW5zZmJ2SlExKys3Q0VVbXFYRFNjZTUwYUVIclh4?=
 =?utf-8?B?RGpObkRhOUFJcUdjM1JwNzJha0p1dVdOT2trOXdjeWIzWkRJZzVIOFJkMDRt?=
 =?utf-8?B?SFhCNkJ3MXhqQ1NlUFJYc25neC8vNmxMN1NFWVdEVEQwdWRNTkJpaFA0K25U?=
 =?utf-8?B?WGo1UGhzd2l0VWpTUzJZbysvRzF2ekJkRnNIR3lORlNieklJbjdwRXVrYmty?=
 =?utf-8?B?b2NJOWMvMmtHNDZJR282eU56a09HMUlXeE1JcWZFNENVK09GbDcyR1BVaVpV?=
 =?utf-8?B?MDZ0ZmtFczRtU0RuUjJOOXZNTzJRQjFZWUo4eDRlNGFMZFE2czZXd09Nenc3?=
 =?utf-8?B?QlA5MmtRckpYc1QrT0REMmluOG0zemh5N3ZmdFptdnRqYUdRY010aytTdVpC?=
 =?utf-8?B?bmI2U0NSd0ZSLzdsRkNrQnhhaER2Z0JGSk5uZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M3ZyM1I1OXpTUDdPbUJraEE5WUxhK1BtSEpQRUFvN002OWlnNStFMjU1RHU3?=
 =?utf-8?B?d2gxWFZic3hzMTFpa24zL0pJcHZHTFJQZU90bEUvcGY5b2p5cW8zZ0Y5THBI?=
 =?utf-8?B?WkljSU5sY0hidFEzZUpBYysxdDRTa1YzRU93NDVPREFNS3NuTTY4QS9jU0hR?=
 =?utf-8?B?akpQclloQVBIaEp0cUdZNFNKYWJTdXJvZnFiazcrN0ZPbkNqSXl2amJ1VVNN?=
 =?utf-8?B?clFlWE8xcklPV1B2V2tmeTlYSDRPQWd3TVpDTm1QcXdvMDNYbllXbnQ2K1dK?=
 =?utf-8?B?SW9LN1FZeXh4VUNTblJxNEJWS2RSYXlic0QwOHVzK1ZvY0NGSDV1a3hCbkxo?=
 =?utf-8?B?NXFEUzgwbFdhbjF3N3FGbUZJQnNyTlhKTGF1SGtEU1hCU2xMZjU2a2tQY2hR?=
 =?utf-8?B?emc3RzB3VGZQVFp0b0ZJT3oxMUQ2OUJQaEk1cnRRT281My9ITXBEelVRRUox?=
 =?utf-8?B?ZWIxaUJoZ0psaG9OMHdQZUVBMUVsVGUycGxRa1AvUlJlYlQ5TjJ6bVVEQXFD?=
 =?utf-8?B?NGdsMHRGcXMzS002bEpXUkdZbHJQY2hVbDNnK2IrYU9EOXFEVmhYZnVaNXpR?=
 =?utf-8?B?RERyMWxzb2JMbnB6UkszNG94d0tTdGFVckdqbzZWelZSb21ic1RDV25oRjU0?=
 =?utf-8?B?czRXU3h0L0pVbGxSWWVPMmtRckwxa1ZoNSs3V3RkQ1psbVk4YTRhb3ZMK2VJ?=
 =?utf-8?B?UmhiQ2hzY2xnUGRzdTdQN2h6T1BadnkxZFltYnlRck9IRDdveHRZbHlQamxi?=
 =?utf-8?B?S3lRQzYwYXUzT2prUVF5WVc2UXlnb1FUTXVDWDczSDE2dnFNY2grZlhkSXVP?=
 =?utf-8?B?OVlwemR6d2FVRzU4c3ByQVlwN0o4Ymcvc3hZei9NMkVCVlp3RVhSZnIwVkY3?=
 =?utf-8?B?VmxLTnRtWnF1N05WTUdmclNCdjNHY0FpaXF3czZ2Vk41eEwxZUNxS0Z1WER1?=
 =?utf-8?B?RVpKTWo2bGx5NGdRc21zdWRYTjNhZ21xUW11VmpPeVU3VldJdnpyTXJUODVv?=
 =?utf-8?B?bXlhaEErU0g4bkJyand1dVdoeFB4V0dmWTFjbzYwSXRxLy83OElPZ1ZBNjRQ?=
 =?utf-8?B?clBxZlljYnRNdDZxRkh1MUtuajY1OVRqbDNKNk5vWWR0aE84RnZrQU5YSWpO?=
 =?utf-8?B?b2ZYMys3KytiUi90RTRFTFJHMUZ3RHlZZC81ZnNndzNvYjhoZllDUjJSaDFz?=
 =?utf-8?B?dkNZbENzbWs0akFVWEVoVGcydm1MeE53QnhpRHJqT29zTUdoMFlPMEFteGVQ?=
 =?utf-8?B?TzB1akd6L0ZEY3BnalphQ054TU43c1VRNDRKdmp3b05XRkU3K2tIUEtTQklK?=
 =?utf-8?B?TWZVbms4NkRRSWRsK000RzAwT0NrTm1aYXhNeXl5ZEtCSnQvM0JkclY5M3ds?=
 =?utf-8?B?TENmdUZTWUE1eGp1SmNNd21FbHFPRHVwYTluUzE2S1U1WTN2eHU0M2VPOXVE?=
 =?utf-8?B?dUk3QmFwUzBxSGtNaGFzUGtXSjRId1BIQjFYS0REcWxKQ1hFKzhQZ01yeENq?=
 =?utf-8?B?eWZWdFdsNTllRXdQMXl5enl2MENNNW5kRUJRR3NlN2tPcnVWcnhwYk5HdThU?=
 =?utf-8?B?bHljSzBocmZjZHg1cEJuZ2l5d2R4N3U1Y0ozMHpKd0UwdGpYeXo3VUhtTWdu?=
 =?utf-8?B?clNIMm9xaEVOalI4K1p1VXFERlJkT281RmhHMm9DYnB3OWo0SFhoS0dpQTBB?=
 =?utf-8?B?N1VDb2ZmOHdQcm84aTJjaTVDZEZmK0ZlOSsybXRielR2VEVCOEpzZFJ1em9t?=
 =?utf-8?B?ZllPemovQmhrdHMrWktFOGY0YzZxc3ZZR0p3ZVdvSEtQYllIcll5VGNRYjQy?=
 =?utf-8?B?cFpuenpKMjAyblNRUEtuSTBOQTZOREdRSlFHNU9VM0I4WnY5ZFRRS21nYlUx?=
 =?utf-8?B?amVNZlkxMFptYTVQQUhGOXlSSGlFUnIwVXQvU0lMaHJVV0pzdHZqQVVaRjJ2?=
 =?utf-8?B?Mmd6YUZjS2FaMmlycXBWRGJ4WFU5U0VFdktOZE9rdkRIQmlhMFJRRkQ0RFlX?=
 =?utf-8?B?MUk5ZHRldVB1eVpZSVI5MXY0eVB4a3lGbFh3b1BadWVzUGxYazR0Vll5aEU5?=
 =?utf-8?B?QVhkTlZoYnZYeGoralRiMGhlaWdiOW0zNlc0blNGY1AwZGcrSmRnalo0djJY?=
 =?utf-8?Q?FaX6X77vAVebW5dMItpg96k/b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298533ac-aff9-464a-4258-08de28a77cda
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:41:35.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XQjNxMK6lEkf2WdjhNean5ce2gf/q6PZMbg4ogvmqa46JOu0bj6iZOv5a8KHxXaDWDZ9N2OYlntRAUuWHNmsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
clocks and resets, so add compatible string for i.MX8ULP to handle
the difference and reuse platform data of i.MX8QXP/QM.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index b6de7a33d6f65a13e2c950411f66077aebae2f8a..ceddde196d189bb7dc2dc0fd14d28880f9b11eb3 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1074,6 +1074,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
+	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


