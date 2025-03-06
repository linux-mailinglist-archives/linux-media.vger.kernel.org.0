Return-Path: <linux-media+bounces-27773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868BA55203
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34093A9C9A
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2649326B965;
	Thu,  6 Mar 2025 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="buxsMBlC"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023113.outbound.protection.outlook.com [52.101.67.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920E26AA93;
	Thu,  6 Mar 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280194; cv=fail; b=H1YERCTq2zjBaKzS1ew9u57sXNDUBCOyK7IGbKpERU5A6wifBP4XtVl1Wce3z4JfG58IDts0d+9WHQ1UtZ3NF1IkHb45QswNLxMr/2+9y7Q+mea16tGwsiKJkkCkfHv2gHkUxDY/n0vVj8liQYcsQp13NZQ3IHja4wpDzT9uIyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280194; c=relaxed/simple;
	bh=O6C5i9vmAK+MSXSwiwsvwi0MA2QtOMo2691qtgVSKjM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RrQFVa8AS76wdONDLi3wWNN49bF7Iy7KLMoap69n8A/bihHiV3zJwceTbLFl8MyOqO90Qb5UeBDI9vXMMjejyVSg/8FDjtk8jFRDE4Swef/PxWUfsnUdsKKJX67Zr0xa8mYh8B4IMnpNfwB6hdtWvYf4/DUSnVJefl33ckKXnP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=buxsMBlC; arc=fail smtp.client-ip=52.101.67.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE32QKNpEhisW+yvuKK5AeBeFjUr9/wS02MhP7KssFRcuEPe4mUE6rx8x06AXPQj9XOh5XONA3JsBgyBLsud3OP4tsvrd9fKRBWLzRx9pHUENr+AcAJEM+sp9ZY3vUsb4xeFti5mbEa7TUePi1Z2KnE++xMscYgqGb0pWHYWiyrgrHjesandNdZY5hb3dkG2dAB9tELRHhdCVQq7BB6MSGcPincjx6V/oLUgJTr1dRBSv30ECbZ6xwXSZIRaMs9EpsHHxpHV0eFzMxVol0Iwvkmr1Vt2FOQ9Tlgw7ifQRJPgIJVNUXwtiShucWQxDL7Z+K9Hy6qiRFqvmBPrN5YVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAtgJa+/EwNCVWEDtt1GoWNhickiQDHH53RIj5CHu/s=;
 b=YM1/1c/F+AIAXA63lShYgXZwE/c49lQILrdgltE2stOt9Gb305FtIhDdLrGpudeHVia0Adgs2vuBCuN/Ll++d6hyBIRYZdUva04vrrHq3kuIdwCTUpk5BcdQKJo7uhKX8Er4AyGnj6wSTqkv9n9fW8IPUqHF3MJ5E+ZCL6A9nQH7pLlGsCXWnpdmLUwRK5qsXyshcx/pwCPyYJJ8aa4hppTI+diPNqCrlqG8n/ll+d58iWmNAgEWpQJEFWtI5zk+BYu33XFS6tetMUQjLcoxaQQZslaWBaJnh+2ohmbf0AXUpHU4mSeDveMqD6JTUPxJbJkG7MwhC22i6bfuDfnP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAtgJa+/EwNCVWEDtt1GoWNhickiQDHH53RIj5CHu/s=;
 b=buxsMBlC4ErcZtadjqtVIAxzhAQ6hB/zmaUy5rQ9SjYrXeyjq80W0ewB4fg2I0GaY5t0C7Ya/IgAs84QiLOn+JpzkU1+MwXDqauuT1QnrNZtb7eqGcIjoa3/AQinFy2eKROTxeizY8zlERYpVcOawWZZRxnldOOWPT6PcLGE3Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:20 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:20 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:08 +0100
Subject: [PATCH v5 07/11] media: rockchip: rkcif: add support for mipi
 csi-2 receiver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-7-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=24737;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=O6C5i9vmAK+MSXSwiwsvwi0MA2QtOMo2691qtgVSKjM=;
 b=mG0oci6uci0tpBYy7J5HJ0dkxCYhYwbFDMhDl6bNp6G6k2KPovL2B+f8t8ivqE6gSZp7beUac
 J2VetqogTC5B/DJnQTUdFpc1SWXNHLNuzf02rjHEtsIhG4Qim3LoqaB
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a2966c-75fa-4ba1-eb80-08dd5ccfd183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHh1YkZncXRsWGsxWEI5NzRBTkdERDl0VEtmOHgxWmg5WXhhd2pNVDI4SzNm?=
 =?utf-8?B?Vko3U3lkMm91QW5qTWdlcUxtcm9LelkrT3hZK0hvVnVOQVUwL1d6YVpoRUZC?=
 =?utf-8?B?aFBGNUpFbjdXV3FETUFwNnBaK0tWcmtsUS94K3NHcUdTajZJZHgzYU5PQTU5?=
 =?utf-8?B?N1FPZFhrUDIvWksyRWFuSU9JOGhTWWtMTGh2cU05Vlh6a05Nc0pydXZKUlRI?=
 =?utf-8?B?WEFndkhURGhXSjhwYzlqRzlXVW5nWlYvTU5GMzlLMjBQQi9nWkZPSGU5QmVn?=
 =?utf-8?B?NERGWU1JRkhOVEdPWExjMnppU3JiV0FDTGZvT2s5VVg3ZVM1Q0VrakdJMDRk?=
 =?utf-8?B?MlZMdkNVNkRNVUxYSnlKTmJvanNrTkdpWkVQUzhyZ2FQaEdBYTkrWWMvbFZM?=
 =?utf-8?B?dmFMRE9hUUVISllTM0hIK1VlNWNJL2pYOHZBU0Y2U05JZjk2NCt1Vzk1cmkv?=
 =?utf-8?B?TmxRUm9VblNRL09pTUNEUk5IalFCNTdkU0xPMlNpR3RhcUlIbzVlSHNrMFFw?=
 =?utf-8?B?QXk5c0d3cHIrZ0pENG1ka2lobENEdmpUWHFwcnB0YUpHcThqbXZBMnFQcVNj?=
 =?utf-8?B?c2trcHBRTVU1K3pFK2Q1NnVIRTNoQjJYdlRXbG1Zb1VrRnpockVxcFNBUk0v?=
 =?utf-8?B?a256c0NMMU1ZZHhHR2V4N1hEREJoS2g1TC9hL28yUEFZbGt4dlc2ZC9iazJ5?=
 =?utf-8?B?aFpIR3IxUnAwRnlGV3k3RE9rNXpYQnZmekRjcTRLQ0dyWXpvT0RpQ2lpekVX?=
 =?utf-8?B?NFZrOXlWL1JXaktUWWV4N2dLSVpLejhtRlJCREtKd2JmM3ppaVNvTE03UjNj?=
 =?utf-8?B?L2l0cXg4SlEwdlQ1U1p6WW9lem5ralNEOEczY0hTVlUzTVZ5ZWRVa09nV1VV?=
 =?utf-8?B?R3FmbDRqcmFSTk0xMmI0SE1EYm8ydlF1c24wS1VpT0Rkb0NRRzlyZnpVTDZ6?=
 =?utf-8?B?bXJDaHM1R2laZTZneWdrdFJmYUhpU1BaU2FiNFlPZEJIeVNLZTRqRXIzOE5p?=
 =?utf-8?B?YWtSckZZSWdyZHdnc2FoSlBUM1F2SjZ5eEdaYWV2aXNvU056ck0zSlpndyty?=
 =?utf-8?B?Um0rdUI3U29Lcm1jbVBVblNUVStmZlRXYXd3TGljSUR2VXNaaUUrZWFoT0dr?=
 =?utf-8?B?UXY0WjQ1N3FXdStlNVBCSEFzWmQvRW5IVnJkM1BJMlQ1Zk1DdjVpdmhDeFFO?=
 =?utf-8?B?NjJPeUNYZHlLU1hIeXNnK2diZkRhLzNOaEJ4aTJZbEJWTnJpanhCSVJTNE54?=
 =?utf-8?B?ODdDSlhRUjRlR21leEdRUU9yZEJmc3NEQzc2VVBLVGUrYkppZ1M3bjFLVjVs?=
 =?utf-8?B?NEtOeHZoY3dGTm0xNCtwMjE5RjN5ZWVxbHFQWmM3bWZ0MXd2ZDJrNXlsTDdm?=
 =?utf-8?B?alZpSWxGOGNTVkpJbEhCU1c4dTRLcHlhTGtoZUthNDBRRXhtZDJWWjdiTTYv?=
 =?utf-8?B?UDA3eEdWUHJGSm5vUnEyY01Lb2Q3c1ZuYUZka2dzbVg2S2hEZXZTUUJ0djlx?=
 =?utf-8?B?QVVrOEx4SDAzSlAyUmErOXdZMlQ2cVFQempQc0VxTE8rVFd1eUtHTVRsWmc0?=
 =?utf-8?B?R0diSzBhSFpLTTJ6L1hNbEtPT2dCQkdscGNWdHgxWjFQWC90Vk9TeXd6S3VT?=
 =?utf-8?B?T3ZOQklpbHRSTmFIbzVsNXZJVkRWU3dZNnVZeGFNVEE1Qi90ZHJXRWJZMENj?=
 =?utf-8?B?NDM3QTV5czNkQ3hvZlN2dFc0UzRmbDNkM3IzcTlqWTJvcElKazNIL3RXTGpX?=
 =?utf-8?B?M0l0SXJNM2JGcm1RbFFHMVdnckZLVTJqZFRBcW5hN2Y3aFY1VEIyNzZRU0Va?=
 =?utf-8?B?MGxiN2VnMTROR05tQ1ovQXRyOHZUN1JLSStzWHFieDlyVmFPK21uRTRwSzVJ?=
 =?utf-8?B?SzhkMFRhd25GZE11bmx3cjBjVTI4NUhnWGlTV05wUys0bE44dGhCcjJBOGs1?=
 =?utf-8?B?ZVU2MER3WlR1NjFPTUxDOFNnSXQ4RFdJNFZJSzVTRTl1U0xQTXhwTzZZMVRt?=
 =?utf-8?B?WkZXL3lMTWpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDVVOHV4bHQ5NUxrWXorSldIZ0JNNUV6TnpNcVZWd1NHb1A3MjFzWUZsSXdq?=
 =?utf-8?B?S1R4NXo0c0RLa2dleFVwT2x4bEd5UVRJYmxLdDVsSVBXQ1NaRkhOWlpKa3lk?=
 =?utf-8?B?dy95Nm0xWHk1bG1aRis1bUpzb0NqemRPK1NONlZKNlBwd1BkVng1TlBoR3Qz?=
 =?utf-8?B?OVpqQzc5NUNaNWNyM2JsQUp0U3RKNXRZNThtWjU3V09FRTZLMWpXUVNQdmZl?=
 =?utf-8?B?bkFhK29GanoxakZlUUx3UERsTmU2Ty9pOVdmcmp1RWhhWEd6MHZNV2NteTk2?=
 =?utf-8?B?eURZN3MvejRtYmZveFd4ZFZNQUxhTTBOK1JEQVoxU01ILytzdTZCRG5iaTE0?=
 =?utf-8?B?QWg5OExUczAxYm10bEdzSmIySVhVZ09WSjlYdUF6eGN3N2RJSEZOYUc2WnB2?=
 =?utf-8?B?anBocXZwWURIZXRMeER4Nk1yOTRUdlRwWVV5d0hHWVhMVlpkeldraHVoY1FO?=
 =?utf-8?B?cnlvNTZmcVBVOHFrN2c4bDV1YUUwb0hUK3l5SDU5R3RmZ2pHMkJndUFlZU1W?=
 =?utf-8?B?VlhYQjVNOXFUblFVRy83YVhTbEl0azd5WVNxeEpOQ3JvWUlwZjUxaVB0WXJQ?=
 =?utf-8?B?WDUwSGIwYlVnUWNiR3dtVXZnVU9jZ0EvL2FIS3NIZDQxZ2M5b2ZoSUJMU29S?=
 =?utf-8?B?c0pkREcvSEt2SnljbFk5MzZKNWtkN0toeEZ4dVdsR0RQM1B4STBXa0w1eEJa?=
 =?utf-8?B?UFBsb1lWUDlsREE4UjZtSDE4THBORXYrQmpxd1B5YzJ0bHc1ZUowbE5DUUF4?=
 =?utf-8?B?L0loSHlqT2dKaTBJQjMrTE4yUWU4UkZCTE1zVXREMUhCNmdlRWhJcUg3WlA0?=
 =?utf-8?B?UGVxQ2dRV1o4Qlg4bEE4ckxCQnQzM2gyUnc0bnh6R0tjcFA3NktiMi9kbjhy?=
 =?utf-8?B?bWhqeWY3SUlaTmRhVjZ1cS9aMmtiM2dNd2pRdlZSbUZmVURWdEIxSmJlRVY2?=
 =?utf-8?B?Vm04R1A4S1lSSjVVaVFldTdwM01SOU1vNGpaRXlrb0VwajRRRTVOYXFScTl6?=
 =?utf-8?B?K2NBMHUzNEtZdTNnKzc3NFZudnVRVVg3cHMxZjljR0lsVjNraCt3L1RsbTF0?=
 =?utf-8?B?WGY0QU9YUE9Iem9EN2l4UnhkdkhqeTRNS0JXbHo3ZlRHZjBTSjVURWF0aDM2?=
 =?utf-8?B?SklNUUdIcUVRem5SUllDcVFESEFZNGp3MEhTODV2TWFaNWVVdUpQays2NWVN?=
 =?utf-8?B?N0FtNWV3VnJ4SkU0Y0dUU2dDOE83RTJ6WnNmY1ZSVVk3eTcycHllRWdrZC9U?=
 =?utf-8?B?RzQ3Vmc0TGdxNnI2Z0E2YWZhSUFPV0VkTUtzbGx2aEVBdXN2dUFwK1VHOFBJ?=
 =?utf-8?B?NXJjUDI1RGxLYlZRY3lvakFmZGJnaXh5MDRsR3VYU2tMZCt1bzFiQmloVXNn?=
 =?utf-8?B?QWZyTDFYTXRFK0J6R1RTQVN0RmI2eStUYUZteFRRN2FIbXVwTXFrRUo5ZXNk?=
 =?utf-8?B?ZTRpckkzcU5NQjRVUURiR0U2dE1hOVM0eVIvaWRsSFkwT3I4OW1kQVVtR1BE?=
 =?utf-8?B?d2dEWXFzSEc0b1FoKzIzekZLQzBOaWp4TDZ5QUxkK05qa1V0SmJ4U2dCRk1T?=
 =?utf-8?B?NnpwWk5ZOWdHREp5UWI2bjZiSTFsVXJKS0NYYlRQYXhGcXg4WGk2ZVVQTEhu?=
 =?utf-8?B?bDY0Y2pLUkF4VHBlL3hKb212V1loM0pwWThSTEU1aTc2cWpVZnZiY0FkRXpY?=
 =?utf-8?B?Z0s4dmNuQ2dhMFhpTkxGL296VkgvYzVxdzNnT01hdWUzeE9qQi9JM0V4ellF?=
 =?utf-8?B?V1pCVGM3eVdFYUhURTAvb0dZVHM4NzlwRjNvWTlEc2VDNkxqR0Y2SGViV1VM?=
 =?utf-8?B?dXByQ1pMNUxkSmRzR1ZHbTdHeWdGRGF5akZqMkNzN2pKcXlnS2xFY3RMNGJk?=
 =?utf-8?B?VEI1M1lLall1aXZDSzdiQ1FSVktQeG9QNHRxRS90ckFxMyt6L1h1UEFOUGg3?=
 =?utf-8?B?K1RkV3ozUTl2NzdrUGRodHdic3pwTXVaRE1jYW1EaUxUWVYxbDQrYnBVVkgv?=
 =?utf-8?B?TktQR1JlNWw4b0JZYlllQmM5QlFNWnlzYUZLdHlYOWZGczBKbUtvK1V0OTdP?=
 =?utf-8?B?REdldjROMTdYQ2NWakxDMnVxZjE5OXh3bzI3cHA3K3U0TDVLVUlEeWlicFRU?=
 =?utf-8?B?TG9UR1BQN3pJMXFSVHZtMVBEdTNnMXlGQzRKY0hGSWNoSHBENndOWVpKcVVr?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a2966c-75fa-4ba1-eb80-08dd5ccfd183
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:20.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKzkffoABHQEZkSANstQ958GfJgDyiLQjPGBjYtve1NNZRZrWo33frk6XlBajw6YWfLR0xVmxyX6coW4pc6rRgkbEtZ5ZQXZzaph+c4mB8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 receiver
that can receive video data and write it into system memory using the
ping-pong scheme. Add support for it.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 695 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   2 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  16 +
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   1 +
 .../platform/rockchip/rkcif/rkcif-interface.c      |   5 +-
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |  24 +-
 6 files changed, 741 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 0c3f7b8cfa18..dcc0c4aeeec4 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -6,22 +6,717 @@
  * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
  */
 
+#include <linux/interrupt.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
 #include "rkcif-capture-mipi.h"
 #include "rkcif-common.h"
+#include "rkcif-interface.h"
+#include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_MIPI_CTRL0_COMPACT_EN    BIT(6)
+#define RKCIF_MIPI_CTRL0_CROP_EN       BIT(5)
+#define RKCIF_MIPI_CTRL0_TYPE(type)    ((type) << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW8     RKCIF_MIPI_CTRL0_TYPE(0x0)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW10    RKCIF_MIPI_CTRL0_TYPE(0x1)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW12    RKCIF_MIPI_CTRL0_TYPE(0x2)
+#define RKCIF_MIPI_CTRL0_TYPE_RGB888   RKCIF_MIPI_CTRL0_TYPE(0x3)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV422SP RKCIF_MIPI_CTRL0_TYPE(0x4)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV420SP RKCIF_MIPI_CTRL0_TYPE(0x5)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV400   RKCIF_MIPI_CTRL0_TYPE(0x6)
+#define RKCIF_MIPI_CTRL0_CAP_EN	       BIT(0)
+
+#define RKCIF_MIPI_INT_FRAME0_END(id)  BIT(8 + (id) * 2 + 0)
+#define RKCIF_MIPI_INT_FRAME1_END(id)  BIT(8 + (id) * 2 + 1)
+
+static const struct rkcif_output_fmt mipi_out_fmts[] = {
+	/* YUV formats */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	/* RGB formats */
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
+		},
+	},
+	/* Bayer formats */
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+};
+
+static const struct rkcif_input_fmt mipi_in_fmts[] = {
+	/* YUV formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+	},
+	/* RGB formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+	},
+	/* Bayer formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+	},
+};
+
+const struct rkcif_mipi_match_data rk3568_vicap_mipi_match_data = {
+	.mipi_num = 1,
+	.regs = {
+		[RKCIF_MIPI_CTRL] = 0x20,
+		[RKCIF_MIPI_INTEN] = 0xa4,
+		[RKCIF_MIPI_INTSTAT] = 0xa8,
+	},
+	.regs_id = {
+		[RKCIF_ID0] = {
+			[RKCIF_MIPI_CTRL0] = 0x00,
+			[RKCIF_MIPI_CTRL1] = 0x04,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x3c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
+			[RKCIF_MIPI_CROP_START] = 0xbc,
+		},
+		[RKCIF_ID1] = {
+			[RKCIF_MIPI_CTRL0] = 0x08,
+			[RKCIF_MIPI_CTRL1] = 0x0c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x44,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x4c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x54,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x5c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x48,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x50,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
+			[RKCIF_MIPI_CROP_START] = 0xc0,
+		},
+		[RKCIF_ID2] = {
+			[RKCIF_MIPI_CTRL0] = 0x10,
+			[RKCIF_MIPI_CTRL1] = 0x14,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x64,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x6c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x74,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x7c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x68,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x70,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
+			[RKCIF_MIPI_CROP_START] = 0xc4,
+		},
+		[RKCIF_ID3] = {
+			[RKCIF_MIPI_CTRL0] = 0x18,
+			[RKCIF_MIPI_CTRL1] = 0x1c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x84,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x8c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x94,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x9c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x88,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x90,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
+			[RKCIF_MIPI_CROP_START] = 0xc8,
+		},
+	},
+	.blocks = {
+		{
+			.offset = 0x80,
+		},
+	},
+};
+
+static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
+					      unsigned int index)
+{
+	struct rkcif_device *rkcif = interface->rkcif;
+	unsigned int block, offset, reg;
+
+	block = interface->index - RKCIF_MIPI_BASE;
+
+	if (WARN_ON(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON(index > RKCIF_MIPI_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	offset = rkcif->match_data->mipi->blocks[block].offset;
+	reg = rkcif->match_data->mipi->regs[index];
+	if (reg == RKCIF_REGISTER_NOTSUPPORTED)
+		return reg;
+
+	return offset + reg;
+}
+
+static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
+						 unsigned int index)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	unsigned int block, id, offset, reg;
+
+	block = stream->interface->index - RKCIF_MIPI_BASE;
+	id = stream->id;
+
+	if (WARN_ON(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON(id > RKCIF_ID_MAX) ||
+	    WARN_ON(index > RKCIF_MIPI_ID_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	offset = rkcif->match_data->mipi->blocks[block].offset;
+	reg = rkcif->match_data->mipi->regs_id[id][index];
+	if (reg == RKCIF_REGISTER_NOTSUPPORTED)
+		return reg;
+
+	return offset + reg;
+}
+
+static inline __maybe_unused void
+rkcif_mipi_write(struct rkcif_interface *interface, unsigned int index, u32 val)
+{
+	unsigned int addr = rkcif_mipi_get_reg(interface, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, interface->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused void
+rkcif_mipi_stream_write(struct rkcif_stream *stream, unsigned int index,
+			u32 val)
+{
+	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, stream->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_mipi_read(struct rkcif_interface *interface, unsigned int index)
+{
+	unsigned int addr = rkcif_mipi_get_reg(interface, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(interface->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_mipi_stream_read(struct rkcif_stream *stream, unsigned int index)
+{
+	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(stream->rkcif->base_addr + addr);
+}
+
+static void rkcif_mipi_queue_buffer(struct rkcif_stream *stream,
+				    unsigned int index)
+{
+	struct rkcif_buffer *buffer = stream->buffers[index];
+	u32 frm_addr_y, frm_addr_uv;
+
+	frm_addr_y = index ? RKCIF_MIPI_FRAME1_ADDR_Y :
+			     RKCIF_MIPI_FRAME0_ADDR_Y;
+	frm_addr_uv = index ? RKCIF_MIPI_FRAME1_ADDR_UV :
+			      RKCIF_MIPI_FRAME0_ADDR_UV;
+
+	rkcif_mipi_stream_write(stream, frm_addr_y,
+				buffer->buff_addr[RKCIF_PLANE_Y]);
+	rkcif_mipi_stream_write(stream, frm_addr_uv,
+				buffer->buff_addr[RKCIF_PLANE_UV]);
+}
+
+static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	const struct rkcif_output_fmt *active_out_fmt;
+	struct v4l2_subdev_state *state;
+	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
+	u16 height, width;
+	int ret = -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+
+	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
+						      stream->pix.pixelformat);
+	if (!active_out_fmt)
+		goto out;
+
+	height = stream->pix.height;
+	width = stream->pix.width;
+	/* TODO there may be different factors and/or alignment constraints */
+	vlw = ALIGN(width * 2, 8);
+
+	ctrl0 |= active_out_fmt->mipi.dt << 10;
+	ctrl0 |= active_out_fmt->mipi.ctrl0_val;
+	ctrl0 |= RKCIF_MIPI_CTRL0_CROP_EN;
+	ctrl0 |= RKCIF_MIPI_CTRL0_CAP_EN;
+
+	ctrl1 = RKCIF_XY_COORD(width, height);
+
+	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
+	int_temp |= int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
+
+	ret = 0;
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	struct v4l2_subdev_state *state;
+	u32 int_temp = 0, int_mask = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
+
+	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+
+	stream->stopping = false;
+
+	v4l2_subdev_unlock_state(state);
+}
+
+static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
+{
+	u32 val;
+
+	val = RKCIF_XY_COORD(left, top);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
+}
+
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 {
+	struct device *dev = ctx;
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
 	irqreturn_t ret = IRQ_NONE;
+	u32 intstat;
+
+	for (int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
+
+		for (int j = 0; j < interface->streams_num; j++) {
+			struct rkcif_stream *stream = &interface->streams[j];
+
+			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
+			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
+				rkcif_stream_pingpong(stream);
+				ret = IRQ_HANDLED;
+			}
+		}
+	}
 
 	return ret;
 }
 
 int rkcif_mipi_register(struct rkcif_device *rkcif)
 {
+	int ret, i;
+
+	if (!rkcif->match_data->mipi)
+		return 0;
+
+	for (i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		interface->index = index;
+		interface->type = RKCIF_IF_MIPI;
+		interface->in_fmts = mipi_in_fmts;
+		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
+		interface->set_crop = rkcif_mipi_set_crop;
+		interface->streams_num = 0;
+		ret = rkcif_interface_register(rkcif, interface);
+		if (ret)
+			continue;
+
+		for (int j = 0; j < 4; j++) {
+			struct rkcif_stream *stream = &interface->streams[j];
+
+			stream->id = j;
+			stream->interface = interface;
+			stream->out_fmts = mipi_out_fmts;
+			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
+			stream->queue_buffer = rkcif_mipi_queue_buffer;
+			stream->start_streaming = rkcif_mipi_start_streaming;
+			stream->stop_streaming = rkcif_mipi_stop_streaming;
+			ret = rkcif_stream_register(rkcif, stream);
+			if (ret)
+				goto err;
+			interface->streams_num++;
+		}
+	}
+
 	return 0;
+
+err:
+	for (; i >= 0; i--) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		for (int j = 0; j < interface->streams_num; j++)
+			rkcif_stream_unregister(&interface->streams[j]);
+
+		rkcif_interface_unregister(interface);
+	}
+	return ret;
 }
 
 void rkcif_mipi_unregister(struct rkcif_device *rkcif)
 {
+	if (!rkcif->match_data->mipi)
+		return;
+
+	for (int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		for (int j = 0; j < interface->streams_num; j++)
+			rkcif_stream_unregister(&interface->streams[j]);
+
+		rkcif_interface_unregister(interface);
+	}
 }
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index ee1a50a59505..48d04a60c750 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -11,6 +11,8 @@
 
 #include "rkcif-common.h"
 
+extern const struct rkcif_mipi_match_data rk3568_vicap_mipi_match_data;
+
 int rkcif_mipi_register(struct rkcif_device *rkcif);
 
 void rkcif_mipi_unregister(struct rkcif_device *rkcif);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 32f6f0238656..99249a85048e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -93,9 +93,14 @@ struct rkcif_output_fmt {
 	u32 fourcc;
 	u32 mbus_code;
 	u8 cplanes;
+	u8 depth;
 
 	union {
 		u32 dvp_fmt_val;
+		struct {
+			u8 dt;
+			u32 ctrl0_val;
+		} mipi;
 	};
 };
 
@@ -183,6 +188,16 @@ struct rkcif_interface {
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
+struct rkcif_mipi_match_data {
+	unsigned int mipi_num;
+	unsigned int regs[RKCIF_MIPI_REGISTER_MAX];
+	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
+
+	struct {
+		unsigned int offset;
+	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
+};
+
 struct rkcif_dvp_match_data {
 	const struct rkcif_input_fmt *in_fmts;
 	unsigned int in_fmts_num;
@@ -198,6 +213,7 @@ struct rkcif_match_data {
 	const char *const *clks;
 	unsigned int clks_num;
 	const struct rkcif_dvp_match_data *dvp;
+	const struct rkcif_mipi_match_data *mipi;
 };
 
 struct rkcif_device {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index 2f45229183f6..5cc4e458ffa1 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -49,6 +49,7 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.clks = rk3568_vicap_clks,
 	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
 	.dvp = &rk3568_vicap_dvp_match_data,
+	.mipi = &rk3568_vicap_mipi_match_data,
 };
 
 static const struct of_device_id rkcif_plat_of_match[] = {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 7131de68de2c..163ee9e2fc6f 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -188,7 +188,10 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 		stream = &interface->streams[RKCIF_ID0];
 		rkcif_interface_apply_crop(stream, state);
 	} else {
-		/* TODO implement for MIPI */
+		for_each_active_route(&state->routing, route) {
+			stream = &interface->streams[route->sink_stream];
+			rkcif_interface_apply_crop(stream, state);
+		}
 	}
 
 	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 07fd64174e80..3d1f0c45c638 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -30,7 +30,29 @@ enum rkcif_dvp_register_index {
 	RKCIF_DVP_REGISTER_MAX
 };
 
-#define RKCIF_REGISTER_NOTSUPPORTED           0x420000
+enum rkcif_mipi_register_index {
+	RKCIF_MIPI_CTRL,
+	RKCIF_MIPI_INTEN,
+	RKCIF_MIPI_INTSTAT,
+	RKCIF_MIPI_REGISTER_MAX
+};
+
+enum rkcif_mipi_id_register_index {
+	RKCIF_MIPI_CTRL0,
+	RKCIF_MIPI_CTRL1,
+	RKCIF_MIPI_FRAME0_ADDR_Y,
+	RKCIF_MIPI_FRAME0_ADDR_UV,
+	RKCIF_MIPI_FRAME0_VLW_Y,
+	RKCIF_MIPI_FRAME0_VLW_UV,
+	RKCIF_MIPI_FRAME1_ADDR_Y,
+	RKCIF_MIPI_FRAME1_ADDR_UV,
+	RKCIF_MIPI_FRAME1_VLW_Y,
+	RKCIF_MIPI_FRAME1_VLW_UV,
+	RKCIF_MIPI_CROP_START,
+	RKCIF_MIPI_ID_REGISTER_MAX
+};
+
+#define RKCIF_REGISTER_NOTSUPPORTED	       0x420000
 
 #define RKCIF_FETCH_Y(VAL)		       ((VAL) & 0x1fff)
 

-- 
2.34.1


