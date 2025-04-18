Return-Path: <linux-media+bounces-30521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610F8A9333F
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ABFB462F4D
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E38026B2BF;
	Fri, 18 Apr 2025 07:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uIrBuJ41"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2055.outbound.protection.outlook.com [40.107.247.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC2926B2A5;
	Fri, 18 Apr 2025 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960195; cv=fail; b=Ku3ojVDw3bdW8+NLOn49hecbCr1k7W5fjgoNMKeL/hONPyztD5tFOc8gZr3E75h1uGigzoPaUl1cespyXf1fIwIMWpx1ZCkV74Aq4uWHHvk9yAezfqVstUNpAeKAKdRy0CYYSJqoAnKrHClx7hCc4mosBoNgOVgeNsGSjd+eMWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960195; c=relaxed/simple;
	bh=hapNgeihPxTVfKmPQQ0CktIZF2uf+/Xued1goM08PoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EC1YVIY6b0mDwsqY9ttXXiJ2lKtdB158ZUO47NzOeDoRLthIahbf8PcAOsKJAmpERXqApT9HlHF68XGB+UYuk2uX4ZmgHnlnngLAYx/ArmcU/Va3OivjUMO4GKFPikNxN7ZbO7cBCXxSQKptxYPo08VjB6fVu2QBp4BH67hXj3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uIrBuJ41; arc=fail smtp.client-ip=40.107.247.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A21DwvnORobb0Grt+C9x4iZpoIU1Sisvj7q89ZR6AGWgbc2ylFPsdQApBvKETuCI4La5llDAjsJUCqrEl1x56YpWp99fdy6VVs0kS56450qQDtv9AxzLhnuwaQbf2EuxlcATfKGB66JT3XU/UkUC6zZdSm9k0EPH3evHJTEaUH/3afhCn/MuH+Mgu2s/1QJdL+EwnEuI5lupKw9SFqpRUboNRRKqKIV8/IdfeH3RrtO1W5To6fdX8AZqx99oSgcku6nYefHfPxwWR0Lv3AXBkN03JSjIaotXnBY3vrmKwux2Tm+oI8+M9/a6CVMqnpY9YzfuAP7Z4lb6oK/EUN6klg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTKcG8iW662T7Nw0xvAA7Bh6amD+CcqUAcjWDySvSy8=;
 b=fpJloIIJ+OlwrG2rN5sryGe6TKLEdScZHCNSYKOGcr57nq/iQu7R+hZPzrnk/RBif35ZbspriGPqtfZBcs/L5b32OHhjENO/23HYu1qL6ozlAsit9LLcJmmw7BYvPwTiRJUMneWUKER6Am+wOi8eGYcdAPca1Fa2hd0zzlp1D42LSWKF69hFEZRa4KOszOzXG9Y7yTo0fn5H3Y0U3ZJTDVjv0VW76akaYXukYUcoVkiZwbx8uthLuvw5ElG3ZWYxVx2Yqpmu+mFlAt25984JvueAr0AMyqzRXNEAtZ0yU5z/nTMXbOeoGBeVimEEos5H8UNo+u12RP5MSYZlOvbBpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTKcG8iW662T7Nw0xvAA7Bh6amD+CcqUAcjWDySvSy8=;
 b=uIrBuJ41Uj2gjWZJreNGKuEVWtdSNb5kPcZGe76KND6qxzgmUqoX1QxdDNpYcfxgPCyiF+vthb8qiAJNJ80NjRCIz4t3DcDozYQHL7qZbiuELSM8HGA4pomSV/3T1V3HGoLEYFz+hcBIIp2Ga/uxSatCmM/+CbH/7Nh5c/j5VJ3jJNT4I7//EtsWUP1a8macju0Plg8LtHTvhmgFx5TPscaEsQ/2tKRbQvJMGqrI3YGgZ/LjAiNk6tK5cRLU6jKDIqDteSFT6BwdUdqmJq4qzOPtFCeFs3lMmOKUELHqUfacRmXeTR6HklXJCOvwwvcTnD6ZixLZe9y5qwozUC2xMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:51 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:50 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/5] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Fri, 18 Apr 2025 15:08:21 +0800
Message-ID: <20250418070826.141-6-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 74789385-34f2-4960-9c4c-08dd7e48028d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EBXfid9TWBGlaMI9dxCtlGr5dr+LGX8gRTpfdyOdfYtnZRj1Lqjx5KLBleuO?=
 =?us-ascii?Q?rWk1no2iqyHQPuhrjp1lDFMJWoNQ+3Gh+Jt4uk90pSRl1mQKnzfdvVSRPVV8?=
 =?us-ascii?Q?XXHAm2Uzd5Ubmvuurfy8y15IjBZ5h0LGvHyGFeM/uWlw32sFmFc3HAlsOAFB?=
 =?us-ascii?Q?+iymDf3O1ttDSB7Rv1AHJTLmdTpteboyzyTxxGB4UxZA6kWc5n8iz8r2fUHy?=
 =?us-ascii?Q?BIBDQs8Ng++AF1C7T5MKFh8VkoijAGe7c8dHTOPLrS0o0tRviF8biSQTR+im?=
 =?us-ascii?Q?EswKqUjjrmYbm0IhkpWbtG3VvIuHiD/CRWLKhj4VMOIVQycEr/96uRmM0rGh?=
 =?us-ascii?Q?TpKaxG16MWmXncugZcw9QQ3YTyP9HrhX1zQj5A1FFrcu4lixX9x5Djz2hhKv?=
 =?us-ascii?Q?URrMgOI152pXKQiAGQrpxsCvE3mc6uUJpAf6Xzz+HhnusTlcU6d5GS4/j1yj?=
 =?us-ascii?Q?TKBrzv+VXjaCGpd8dBrOovdfilDyIAOeKRsNqIMPpcsiniiaRe+PyrHxU0/i?=
 =?us-ascii?Q?QS4n7l93dY7OFnNRjP4M0gLjCbeksvGczJ2SMIdHNoyPfJlJVEvREp4CyY1j?=
 =?us-ascii?Q?3K/jmeJOkiavr21LOVkGHR2ZWKdygLWCBi3YJWuPu7i+os5Ua2VJMB9PJWct?=
 =?us-ascii?Q?RiD2LdTJQ4HkJQuWrMQuZaTl2hG9Rftc30fm8wmFtyNwDTijuBMKprsjSjO5?=
 =?us-ascii?Q?mp9b0Te0h7PNbUYuD6/cdoU+QRL5AyRu0cydull/nZuALxzi201BLyahHdsv?=
 =?us-ascii?Q?jUqjZ+bxE5TnKWrkNuxOfByeql1ZskqHSJ3ODIo1qK9A9WqzY8NvjE+6gU/A?=
 =?us-ascii?Q?tD5U4xyjF2Gec9ilEciLhZADCMC/783SNYEv31a1UpGHVM7wzWtyTsh6Or/T?=
 =?us-ascii?Q?/xWTAYFlCl0haTE/La4MIq6cj+HlMnKyu5RFOMegQEEDfRcJCYDgi4SzsiC6?=
 =?us-ascii?Q?0QGxTIjdCcnhgpFHipcKySQFO/0BHuY4BFsH8jXFW+nI0sraPyytRoVt8hb7?=
 =?us-ascii?Q?405WsorqvOUkb0jDAGSwzsEpZGTm7pHKGvLZXM2YZ7a+jY/0psfwPJsLpHD+?=
 =?us-ascii?Q?AY5kzyLse2qNGMPO6mZl+tJATi8edaMqhn/VyvwueQ6CORy1MjqBlt/K/cF0?=
 =?us-ascii?Q?c+mvHxV2HMpm5prew+U92KujPPpcDQbZ3ZoxPKBJasVdV4gP32zXIf6T7hEr?=
 =?us-ascii?Q?ws6J6G+K6Y7QNOwkybvIsYj3Ovosb70qZfqMDx1raKQuLgaGt/5tedF9W0PI?=
 =?us-ascii?Q?7tmuLiLudtolltlcWgez6IKlRH20YY0GuK7RS+KtRuLFXxpxnAwpPgcbChwG?=
 =?us-ascii?Q?KTw4uGSvd1Pwt4DqXZgpFM+i7zXcfwc2jLK+9kQNWRiqJjpJx7OD/T994IKm?=
 =?us-ascii?Q?YCLdrUGyTrVjpOW1gABR7uak7Geo88vwcu8wlkEALWB+kfXPtz7evrw240Bb?=
 =?us-ascii?Q?W+ASueePU6ZVvEB3XQpEh2GHOl8A8KXSk/G4Vw7DxWAbxx/F8Av0ptuOoRTx?=
 =?us-ascii?Q?aBKk1ICAg+VX6KM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xn9EMfxRr41WW5eZxL7x4yiAT1mkjhVgcmo3FhLtp6cyGbi70c7zxRNdIF1D?=
 =?us-ascii?Q?323jzmDxJY3C4wmYm/Ah0KDBOZ2xjsqtqmIie3CuwTIri09RVv9lXXOCkHoO?=
 =?us-ascii?Q?/ZFbhFc2CkmN8GOhSSvV9J2XeWESrkJsg07d5sg7F0r+2ke2axeJ3nR9CJ0Y?=
 =?us-ascii?Q?dKiP0IImepQp9IRApJqaGk5nVtqRHeAeVjqXWwDbCPXG99Z1M3rxWziZVfzG?=
 =?us-ascii?Q?uLH4eyXJLEHHlYFdPEwu/jBVZQ8ENSL8EIzRziG79sESjC40RiOdXgdO3xm2?=
 =?us-ascii?Q?GHstVdIdGUFRQk84v+0VTo1nJmV1nwIHxJLL3oks57Z7nyshR/lhBY91KKKj?=
 =?us-ascii?Q?eSZZGm2Z8vG9Tgrvh3yMq7LOIelVpqmykny5BZQ+2B2NXmiRRbMZU887V0VT?=
 =?us-ascii?Q?lKGShfi9ZJffLDENa9cqcmWIQXDNwf2rgNVzdBEgm1vRvvheqe80Ngunxqk1?=
 =?us-ascii?Q?GhUD5YtVj2PHRxdi3YcX219pxVS0f+awuOhlj8RiLRRlACXQehncEzyPeaXd?=
 =?us-ascii?Q?jFIDtZLwJ3brTx4hKFEnf6k/QyizXGi6OPEN6oEcZ/yeZP0xUop6Mrvdp7lx?=
 =?us-ascii?Q?Ieffo8Zw5zrxbYdQ3TBZw6FJKnTYIvJVkESvoHCDiPWgoH52YAQPPGBurAHX?=
 =?us-ascii?Q?OFME86sbbIKtwHtRMyqBVo8aRw1OP4DUeHcvak0NqW08LxIXBitZ48W85Qaw?=
 =?us-ascii?Q?9/zlWWm3AuW9U0OuJdw2r2+29T4DjfHa42PnpKCiuHubHUz8IU0z3RsoXKlc?=
 =?us-ascii?Q?1BcfOb3NxZRQCecpWQkhX+YAfsNYKYGaDunG1PDt7NDF7U/mlhehMDNA+R81?=
 =?us-ascii?Q?vv/hLczGxqdBTOq73RjUtHYQRGPH3mt2qCZWwy7z+o2SFZM/SXIz+C0o1Qp/?=
 =?us-ascii?Q?xJOZlRHeWubZvHq3ADEwF40PBi6Jx3uEMKMU6PVgx/X+R6fKC7nbdyBHdOfv?=
 =?us-ascii?Q?hRaeZ7v4gb2RpWxxbDMGd5L5UpgNrIK4JRTCOAa9lZgL6wo5RZQTTdZsJcVv?=
 =?us-ascii?Q?EmttPBjE6gvGQbL+k6WVAWFIKpmPH9EnVq8gAiE2T9iXg7VAHFg17F57Ae2y?=
 =?us-ascii?Q?tDzfmOcXBVO2sh1jjvxeXrc4lPPgbSXidsN8U+iad4u1SNSf/32bdurosDbz?=
 =?us-ascii?Q?PGCLn1btFqnkAbi67VMd+7S0d5H9uaC1HVgFLFUkLhJcooCE7t8qVKS5ZLb/?=
 =?us-ascii?Q?cX+lNo0SZA29IRf1AO3tVKG70xMUsNK5XYJxsgJ/JqJCrE8ihjQTrklIfOeg?=
 =?us-ascii?Q?sl/8He9N7uepk2WY2BS/MLux/hbURQyQ/8hEW/SCeC4Zlms8+XohN3NPtysv?=
 =?us-ascii?Q?okyLZ1duktFOBhqXwx+QKRbzXg9JsgwE4s/fy1Fy7pVXmi+561xKItBqLLxc?=
 =?us-ascii?Q?tbU1F4kPBFwpQ64wLnPUHJx2IiUQeLska1w74OZs/BVAxqB/Pautr12ioaas?=
 =?us-ascii?Q?HnV2TE1mcMKvgFnqBEzMJBXYoB+zrRtSv2S6EOlduaPkRoVhsMFSpXs8WSuw?=
 =?us-ascii?Q?3oghALLeWfxQ4FHn84QS01jyx238nGyI38DCpsDQptzZDEbmT2P3kC/SdvpF?=
 =?us-ascii?Q?YFtmbePIgxVVeiUfQ9DRIuXvRxuTUOkD5+mIJnff?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74789385-34f2-4960-9c4c-08dd7e48028d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:50.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: araD+uNq12O9zZGdlVVR4t8FHRKviySF/Qzr4zYuGB2CGBSDItQB/evRTeOdBJgvw36aQ8Tfnz0v6Sn+Y0waMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

From: Ming Qian <ming.qian@oss.nxp.com>

As the first frame in "repeat-mode" is the pattern, the pattern done
interrupt is ignored by the driver. With small resolution bitstreams,
the interrupts might fire too quickly and hardware combine two irqs to
once because irq handle have latency. Thus the driver might miss the
frame decode done interrupt from the first actual frame.

In order to avoid the driver wait for the frame done interrupt that has
been combined to the pattern done interrupt and been ignored, driver
will check the curr_desc and slot_status registers to figure out if the
decoding of actual frame is finished or not.

Firstly we check the curr_desc register,
- if it is still pointing to the pattern descriptor, the second actual
frame is not started, we can wait for its frame-done interrupt.
- if the curr_desc has pointed to the frame descriptor, then we check the
ongoing bit of slot_status register.
- if the ongoing bit is set to 1, the decoding of the actual frame is not
finished, we can wait for its frame-done interrupt.
- if the ongoing bit is set to 0, the decoding of the actual frame is
finished, we can't wait for the second interrupt, but mark it as done.

But there is still a small problem, that the curr_desc and slot_status
registers are not synchronous. curr_desc is updated when the
next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
after the 32 bytes descriptor is loaded, there will be a short time
interval in between, which may cause fake false. Consider read register
is quite slow compared with IP read 32byte from memory, read twice
slot_status can avoid this situation.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v4
- Improve commit message
v3
- Read the slot_status register twice
- Improve commit message

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 31 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index d579c804b047..adb93e977be9 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 45705c606769..4346dcdc9697 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -910,6 +910,34 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	/*
+	 * The curr_desc register is updated when next_descpt_ptr is loaded,
+	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
+	 * So there will be a short time interval in between, which may cause fake false.
+	 * Consider read register is quite slow compared with IP read 32byte from memory,
+	 * read twice slot_status can avoid this situation.
+	 */
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -979,7 +1007,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
 		goto job_unlock;
 	}
-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
+	    mxc_dec_is_ongoing(ctx)) {
 		jpeg_src_buf->dht_needed = false;
 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
 		goto job_unlock;
-- 
2.43.0-rc1


