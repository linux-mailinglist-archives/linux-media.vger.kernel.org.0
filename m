Return-Path: <linux-media+bounces-51411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE/CNqpCc2mWtwAAu9opvQ
	(envelope-from <linux-media+bounces-51411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:43:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFEB738EC
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E78312E286
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389C636EA91;
	Fri, 23 Jan 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfVrSsGm"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E9A314A95;
	Fri, 23 Jan 2026 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160977; cv=fail; b=nhWL4LqJQJLQWVMbywy9fZBa+EtcZgU64DNiDPad8d7XfSFtKEBi9+9yG2EnzZKTQFG59Bi0Neb3csmYLY+g5XwJigTDV9zDw1fza1P+sPWQeBEoE+rn9Hns3Pns3tL2j7KO3/29eiOah+QN44wjglNzPbQ6KIKtVqV2/kPhpaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160977; c=relaxed/simple;
	bh=G5OEtgmPwW2lcZlSPBqGR8tZDHis+JTcpFDd3OmCXMU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pJoqgp8BjpZsfzS2gGjHT0ttw18vyvoXo6yhuEH2MvAbI4WOSkf97SyZheRd7pNNeNJs7whqSbYDWxONVGu2cBuUx6QtbKinbSixI4nIbIVRNUUltcCR4bj0pnqJAbvzZGiWfjs1C8vwDf/q2Jq3T3p1ZoLZDil24/OLARBp3FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfVrSsGm; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeIIHT/iVFyR/E4qL++v41i8XiMiHb40rlTN9Pd33WfLrGNI1XN53YSI/fUpszv9HPY6hYI1Eog+0QvMSyBi94m4nQdZshBogSrDiCdT/J4xgabAn9QDGiMhrmORqWJUie7q4P4pZP01mw/5uXfJchju2diwOeRBZDmxSDYiIq7xl5u3nReiVK4DtXwEu0LWn7mkaPEW2yxQzAkdZTRiltxlaxrDeqFQr35C6BNpizhWPDbNfT5+xF6dvbIh7Sz4NrHomE0YvrI3tpS3b/dOSwp/q1Ye+RuUI5L0UYr5IklOT2kXxJQq2mO1YXxVdSHItD4ewRm1yBQ/opg+ltC+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AziNd7gotnLH07NwJmXgd8k5pkDuYz7e1RbBFNKeTY=;
 b=VNyYYsyqewC/gVmNN3ywT2Crx/DNxFzM66Db+iGWSk4y+o5z1MnQhNS6fq0zZi2LBsKZlVe88CqnqBn4r0dqo054Az+FS6LLjYYNmKfJOxSrmeljsoEhHpyY0Fi7281hy5jX7NU9J7Z0GuSC+UedE2jlqyKMGnB7bf0oBdiQGkfrfgI16QiOPXg92cx4uk01GpmITwOjOYvzlJY3Py8ui8usBTecHV9rxAmzIDGpwVwIHTptwW4IiskT5YE4MNiWAZqxP9tW3AiaoGj0OfflbN1pkFbbkKdO5FaCUo3ywZWSSK0tLewNY7jzT3a+q0k8QzCT3OWriUHX0gEUdnpDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AziNd7gotnLH07NwJmXgd8k5pkDuYz7e1RbBFNKeTY=;
 b=XfVrSsGm/eo0pOIQUpL842SZnYrFKKiVktxBeFlWkMs2lZlthsOowDE64dBuBl7FxV3AKp/YDFTcP7ZEOihJGgsaQqrlmIEgiTC6gSWlRRbcH0Ve7cdygrn03rIFddOPzYeGaO4r4HLeUyrA9KqCjXxZunbHTXxAEglsM/iMYF+UxsCrxRWxz8hmLoM/0wntC81cZ9hg2xQecPrRm/stC8ahyFT6GVR20Jkd3SRhfIAfTt++fEIHnzgLJ0+7SKxs61Ra97oXOuLAn7oaojK8/Gg4jmZ5x5LBGxUEJhcTIxK/5I+g6psuarBIsWDfo039B9yrVvCCJFJv8dyum1EPpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:36:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:36:07 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v5 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Fri, 23 Jan 2026 17:35:16 +0800
Message-Id: <20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANRAc2kC/13NwY7CIBDG8VcxnJcNM7RT8OR7GLNBGFYOtgaaR
 mP67ks1ZrXHb5Lff+6icE5cxHZzF5mnVNLQ19F+bYQ/uf6XZQp1C1TYAmArfUk/cchnN46cJVN
 Aq4GCZxLVXDLHdH309oe6T6mMQ7498hMs12cJlV6VJpBK8tEyQNMdG8u7/nr59sNZLJ0J3yx0a
 4vVEgIZF41CUJ9Wv1u7trpaQ0YFCqZTFj5t87KkAHFtm+VvpOhdAK+1+7fzPP8BEB9P71wBAAA
 =
X-Change-ID: 20251125-csi_formatter-e6d29316dce6
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160965; l=6285;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=G5OEtgmPwW2lcZlSPBqGR8tZDHis+JTcpFDd3OmCXMU=;
 b=XvPw2mYo5P4h0hPnHBsR6gfm5eLz3NJODRWJaVjETs9cB7WpcJgdFKow6q1Ine2nKRgZMGEUx
 9N88/+40hoEDGNvz6qGXx0YoAc9HF9QCTYJD51D++8TdstIf68rHvEA
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc8534e-43a4-4820-89ae-08de5a62d566
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014|19052099003;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NzRHajJra0xYem5sRHpHQXJ0YmVsekg2NVdsSGxYY0ViNzJRY2Q5NnA5WUl5?=
 =?utf-8?B?aEVwOHVpQzhxM3ZWMEhjbUQ4cnF4YlRiYXlUK1dydit6eTJWbnpZeXl1ekFL?=
 =?utf-8?B?Qy81MGc3S2E3RHZWRExCWXhuUjFrd0lSZkFDbUdtRS9tNSthT210OEdoaGVh?=
 =?utf-8?B?RkFWeHY4Ry9Qb3dGdFI0SmE4dzhaeEl0Mlc2TFp0bnJiQXVmUWNzY3dhQS9w?=
 =?utf-8?B?NE5wYTV5bEdWYkoyMDVmOU04Rkh2VUN0M0k2WnZxc2w4ZGRWZVlYSWttSG85?=
 =?utf-8?B?dlFjSk0vaXZ3WHRHbXZIWE5hYkN3TVBCazJXSUJMN2JpRlp1WENCbHhEVHcy?=
 =?utf-8?B?cUVrQ3FHdy9PeHdiM0ZCSzR4cmlWSVVvVzFDODMzZytnUTY2VWpRWHZsbmZt?=
 =?utf-8?B?a1Q3OForUlRXT1A5TjBxWi9ILysyUzl4SlZXRE1uY1AwOXBpcXZheWxHYk1u?=
 =?utf-8?B?SnBzS2RwWHNwcStBUHc3Y2daRnZoeGNYbmJMRUV1WHBzeXhyVzZJZzhtZWNm?=
 =?utf-8?B?WUtTdmJ3T3RvY0lGRUFyK0w4N28wdHY3N0tReEJkT0l4Y2M0ZnFoa3Q2M2lS?=
 =?utf-8?B?QTB3elFYRWRuWnl6Tzg5SDVZWXA1eXpDN0ozSVdFYWNvYXp3dGNBYUZXdTY1?=
 =?utf-8?B?Y1F6clExSGdyNE10dDQrY2d5azJyUHN1UVNlM2pXWWV6TytpUXFCN3hzcjBx?=
 =?utf-8?B?NFdWOHBET0lDTHJOUjNVUkFOUTZLUFV5SmU5UWRnUnRkbU1odmRBQkhMS3Nr?=
 =?utf-8?B?c1FjR1NlbkVpR0xHMjdPQXRBTWlUY2hLRE5BNitlNVBnZWVNeDdhenF2b1V1?=
 =?utf-8?B?VnZuUWR4RVBaWjQrdVk5TDlaRng3alUrMUxKaWRhT2ZQdkdrdHdMMXpyYlNv?=
 =?utf-8?B?RnZHeUlDZDFISmRIS0s3ZnlTQWVDTEx4QUMxdXk3cFQxNUxJbFNsMko0bm81?=
 =?utf-8?B?RGE4ZUozVWlyelhOS1dCYXdRLzdWT1lzZ3N1czhGeTV4K1gwRVVnTzhHTFY2?=
 =?utf-8?B?KzlqajdOdFF0eE9jU3BXcVV5Qm0wZU9iY21sQVBWSEdUdnlKVEc5ZjhSRkRL?=
 =?utf-8?B?K1gzYWpPSS9zUitodGxzOEZYQ1FKYndwbnBxZmNJSlNCamJUc0llZSs3N1FR?=
 =?utf-8?B?TGRZbDhyakV5ZmpOL09tYWwyWDRsbndMTTVjS296WkwrOVpvSTU1bmM0UEsx?=
 =?utf-8?B?WmpIZGJianhGUHJpWDFlOFRieS91SkVMTlB2ZE9YdVF0T0FRS0FHZDBGUUVh?=
 =?utf-8?B?VWs4VlZJemZQWU43UnIzb2Q4NkVxQjhIamNjalBBSENuOXBkQWNXV2s2RXB5?=
 =?utf-8?B?UE1VN1NadlBKaVl4M254QXlPM3dpMGFxTGo3eFBaTk95ejdKZFMxRjh4RTlp?=
 =?utf-8?B?Z2tXTmNsMjdxQS9TUEdTZTEvV1NHNUI5YTNjS0QvQnVVYVdSeFhibEZESk1m?=
 =?utf-8?B?VjhxZkNBRzlwcFM0UC84RDh4L1JHQ3E5U0YxejdlTjRaMjV0NlU4ZnNDSDda?=
 =?utf-8?B?UXpzY0psUFJUa0xtUlNIVW80N2NYTHhWODlzVFQ4WUVmcUR5azBad2lEbGxG?=
 =?utf-8?B?aFdlcHJ2SUtKazJGejE4cFJYTWZ6MkRTdWRBSlYwV01pMGFWQVZBNnlTNnc1?=
 =?utf-8?B?RXBrdjNhRDYxeTFpdHA1WG5rQTYyMDQ3Qzc5cFVGbHQ3cUwzUG9qL2xqYUFk?=
 =?utf-8?B?NExpQlhnUWpJbkRwQlVrZWlEY1U4LzQvdk9DcG9hSnR0L0ErNjhjdFJpNktG?=
 =?utf-8?B?WWJrVVVUYkFId0RjYUhoeVpxeWJwZ2M5dk8rMGJpU1czZjh6VWtma3lEejFJ?=
 =?utf-8?B?M1VHeDNyTUNNd0xTTWthRFpKY29KTXFoN3lJYnFXZUxOemtIdVpPK0lveTRJ?=
 =?utf-8?B?T0dWalFPNThuazVGUTdGUFBqbmVVeUNmWENzUlNGWnlOMENwWHFzRGwzMmRS?=
 =?utf-8?B?QXRZdVdVMmI3L1RjemZNUFhNWnpuYXpNUnRkU1FpNXljWEkrR0M5MVZjR3dQ?=
 =?utf-8?B?UnU3eVZQak5oSFgxellFSzJJN2VkUnlkbXZXUGVTWFlUcnV1VDY4cmM2NVEx?=
 =?utf-8?B?bkdBcFBiMmpEbiswUnUzN0Q2N0RUYW9OMWVuN05GaGdlbzR1MXJCUXgwWmht?=
 =?utf-8?B?OC9vSGswV0k3Y29nTThyYVBwYzBWa2hVNVdFK3JPRDIvdExXT1ZBY2dBeW1m?=
 =?utf-8?B?WVZ4cEZ5bTRzK1A0T1RIVzZxaXZhR0t1MVhuVVJkdk9QajJWdUlBZmJzUEFs?=
 =?utf-8?B?M2dyZlJLeGdJZzd6M0dqeERIVjZnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N29JcG1SNUt4VFM4bFJ5WlVpN3FLbjV4TTdWb2tiTG53THN3a0xWcDZOT2pV?=
 =?utf-8?B?SXpiZDlxTEZJZjlxZmpmeGxxU2ZNT0JMdEU3eUFtNDJCRWU5NkRNU3lDZ21F?=
 =?utf-8?B?NytyK1ZZekl6UU4zVStzQ2l2YTlQbk9LbWlrS1lpdUw2MmtlQlhsZTJ2YnhB?=
 =?utf-8?B?YmRNbU80cHN1S0lBYUZFQ2Z6RW9EczdKa3hjS1orekkwL0MvbExMN2lTY2lJ?=
 =?utf-8?B?NHdCTzhQbVdFTWRQK1V1N0NxZ1FzZnQvazh2RlVMTGpsWjNkbmJtTllmaTNP?=
 =?utf-8?B?bmUvckFPQVloUm9XbDNCMkJNZy9HSHI2dW1QdnpEblFlanRkNWdsUFVkN0U3?=
 =?utf-8?B?cFVEbWNydVlnQW0rTG9GTi9kZW5CTUFSdG5NM3ovTFdUdUxnS3NnTkxEUjNa?=
 =?utf-8?B?TkRUNEt6Z1BNQVNMWlZoeWRQeWtNUDZuVlp5UExERitoM29BcktOdW1mNHll?=
 =?utf-8?B?eDh2S00zWTRYeFcyS0pMZkEybXpFVFdlczFHNDg0cEFlQURObzNSam4yd3FJ?=
 =?utf-8?B?cWpoNktHV2RGNE1NN3NNZ0dHeU9YaHVmbU5xMkdQSzd3M095eEttTVhDeThs?=
 =?utf-8?B?M3ppZ1liKytWOVFHOU1MTXBsOEhrK2prVzBCMDNHNEIwc1E3bUNjOEhJOG5N?=
 =?utf-8?B?VVUyVm1lZFZIOWNvTmk1SFZScnMrdXVLcWxKOUFvUUQvZC9ITGVCQmovbEZz?=
 =?utf-8?B?ODYrMGI4TDNGb1hkNEdDSGhVNXVGcU9CclZka2dKTEVSd0pLVVFsZE56L2Rz?=
 =?utf-8?B?elNGS1c4Nkd5aStXZXYvYWxvdXUwSnhQa2s1THRpLzl1UCs5YjFWYTdqdWIz?=
 =?utf-8?B?Z1VTMjFCQzRQQ05iQzVCaDNFQnAxQWYrQ0NXK1FpaXppekszWmpjMHZrQ2tO?=
 =?utf-8?B?NUVNZFh0ZE1haGVaakJlWUJjSjF5dUd3VGo4alNlMGhna21Sd0UrQlJ1SHlx?=
 =?utf-8?B?SmhjazlqN3FCS2pmYUIzR2pETGUvOGpkb0x0TDhxaGNVNDN6eTZWSlBhaW0r?=
 =?utf-8?B?ekJ1YmoyZm5nUTdFMDA1YUhZbDhCQWNHdDd3Z3cwRXhBZldhMVNIRkxzSXl6?=
 =?utf-8?B?V0RmbmNaWHB5K25vTmhBdmVCYXc1elVwQUM0RXhJWmJFNEpVSWlZR29RVlB4?=
 =?utf-8?B?RE9rbFhvY1dtSEFTcGozVlVmdXdHRiszVDR2cnhwY3QzZDAvaWJPMk5IVXJC?=
 =?utf-8?B?VCtUcVhUeENxWktQQ2JqZjlJOFc2ajNieElXYmFoWW14alkza0ROeEgwWjUv?=
 =?utf-8?B?cG9xWFpvbXRBTVRTUUwxQU1wTi9Nb1Z0QW51VVI1Ky9KclJ3K1IrdmF3VFhP?=
 =?utf-8?B?WmlPekcySXhIWEtvMzFVL29TOXFqcXl6TVlZNFBmdG0rVWpUOWgwbldCd21R?=
 =?utf-8?B?aEhsTEpFVmI0NTlnc2owN0VXNkFuZGt6WmRaUUVvbWhYd0tUVUVRYUN4YWtw?=
 =?utf-8?B?Z1lYOGpyT2RnRlVIazlCMkcrbjYzNEVyNExmb3ovRFFSYUlFVDlreGlUWlBT?=
 =?utf-8?B?N3dUSVd0cWxsd2pycmtXdEJwMXdEbWxWa0h5Z0V3d3piVFlVT3RkSk9iZUI5?=
 =?utf-8?B?ZHp5NGJKcmw5VU96bCt6R0dXQzVOL3ZDd0FWRDdZN1Q3d0tsaGNwdzBCdEhv?=
 =?utf-8?B?OXMxY2E0ZkYrMDFlQjV2Z29VckREYm5ROTQyZEM5Q2Vlang0S0R0V2czWWZJ?=
 =?utf-8?B?a1JSRlFMNXFoRHdUTzBjV2t4d25QdTh3TGpzVHErQkNtOWZKWTlObFlUbG5x?=
 =?utf-8?B?d1VMZUxtTGQ2UWpiM2pxMHRObU1tcTJiNkppR2pQNzU1WDJXZzJxc3JZUFZS?=
 =?utf-8?B?TVlVOEQ0dHMxZDhVeE1RK21xSWdsMURJNUc1ellodjhoSkt4VDdZRFRVRlRj?=
 =?utf-8?B?ak5CQXFWNm9UdHFFeVN0NDhWWTNRMWhGVWI4elNEK25nOGpQclZGbkZudGN3?=
 =?utf-8?B?MFRFQ3VrSWJaWUkvNWd0TEdCRVI0aDRGS2JVcCtncHMvNURxU3NOMU4wOWNm?=
 =?utf-8?B?VDRmMVJkTUxyeTRSUTA1TGNaazE0U3ZZSjVxbU1aK3FEWFVUL29nZDBDWnJ3?=
 =?utf-8?B?UW9GU3hPOXdGcjh1MzRaWkdUZnNiZHAzVHJxTDZrbnJDRkViS2ZUWVRPeEZz?=
 =?utf-8?B?Vk1xcVp3cXJnN3ZBUXEwbkhocUJrdEFndE0wdWlZTGx0VEJaQ2kzbzNhSjQx?=
 =?utf-8?B?Y0VpVDdBYnpjQ0VWaVlIVlBMS291UVdIeWwyaE15VzJCeDV4VW9GU3FWYnpJ?=
 =?utf-8?B?dnRzYVpxRFFBMEN1YXI1MVhPNDBzUlE5UDR1eTM3NDJOVEV2WmNSQmlwV2o2?=
 =?utf-8?B?cGpBWVMwbWF4dng5R2lNWUJHbWlGc2wwaE5sSVRBNFAxZHRiaU9aQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc8534e-43a4-4820-89ae-08de5a62d566
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:36:06.9636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVgokTvyWbjemiHfzU84kYCbf3xeVMH4cdrDkIIfpT1AaNdD+TVRHkIjJqqEsNeyOMb6kdNQuHRh3cqGlzLlkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51411-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 3CFEB738EC
X-Rspamd-Action: no action

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

 .../bindings/media/fsl,imx9-csi-formatter.yaml     |  87 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c    | 861 +++++++++++++++++++++
 5 files changed, 971 insertions(+)
---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


