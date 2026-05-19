Return-Path: <linux-media+bounces-62060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIhCFmrFC2qWMQUAu9opvQ
	(envelope-from <linux-media+bounces-62060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:05:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D65576437
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 598033026325
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF822FFF89;
	Tue, 19 May 2026 02:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q5audZeU"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9C27A133;
	Tue, 19 May 2026 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156313; cv=fail; b=VNB0cmQr0Db8pNbbkOtyoPcVqGQljOHElJbF0X4VRY0AU/Agz9nxb9nqlhz8qKakWgaVz21ombLTWCYJapSa77L99csUKDrmUL5rGUPLAeZcjbANGFVPk83NqcWJ0CmtP9j/2zh2+kbcgxR8zSxKW+3lLchOXQSzDJ1PKTbqtYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156313; c=relaxed/simple;
	bh=Rn8TnQJjmRPkiB5CCPvUwKEP+EE4Cv3ervNNIU5lK88=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NtX+IVRZBJ7zCFvX9pZLNbIl3iAzZQVUDl90iwt/Toqv78wco+RMBLb2fzqSlAelMhhfmSBKvtxLIT9LR/36rfJrF4N2naFJG4jRpdH1lqObWkFD5X+JncsW1ACT5pBrvhUavq+01VC9Bub4FSBn1dGuOoxF1zSQjYRj0ivXe/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q5audZeU; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR7e3aJFPTc22mNKIr9Atnv25pD+3oex+X2/n4amYRUKkSDJd/u/aw4kD6JJj1XTbrGM2QNIvopQ65iQrUzzfIFnLh7DcoqfO3ok0CorO9PSks9pTc7LQdvPlPTmtdwJbuV/PXmS1jh5WNzH26U46yTBJWsMa0d6fSyzrf+xuiYV09QrcSfA4UqcWnon9sMM7uBSW8NXenrTijo4CnWduzdMzHQAI9jV1yovEIULl7+7bdQuV+mE9xyYbCAmDCazWRLicr7EvBQcEOZ0zTqEzmZgL9Ozjpl7SMAMca7EJn/swYrg3vwmqSYL93GH4Pwnhfazp7Gct6Oi+hNbzH/c7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKDURrsM+oXpN/TisDvkA3PaQKF4uByazJIrJExHD0s=;
 b=vrCT2k3qYlDNTEY4AptY1lpKPQm8FnZ09TrdqJnOdtqrK6e9x5krF7275a9Me9OSoW3XVYllt5TOUVmcKdf415iEfh8P59/FveSEXZY7a5sYdalDmU8qttBJUfzBbZTe9P979VcmlhEuJJYkLTFY1uMKo5Lf32KnbJfHNqb50S5/PjpGBSWgC4B5yLvxK6bPsvmcGW7BLmrETiSocXMTQMDFRa9ShKQrDCpIYzKKtY0Dg2OaKSMFTsKLAsKIjg7zj0rUSivRRXE2UxENgJ8hGIf+O8pCQOdpReX7TxqVE4vZAhLQaL+rqOIdnUwMV2z+n/yPN2hoDKZL0npgRvymYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKDURrsM+oXpN/TisDvkA3PaQKF4uByazJIrJExHD0s=;
 b=Q5audZeUGYBJ6L2VZFIt/+BpBkq3IR7xADFpicC/gTmP0crh2Y+ZQvK1H1VL0YqaCpowNgTSB76K01ZafHav9AYpWo9Vo4vUQ5AhG0YOMs7QO+YieQyGrzN+lzLCU++19oJlrOwwt3mNhKRBDjmrhuwWECTAFkofv2wXcObCyXhytUrvI6PcDZMfHKhSIRQhddLGNEyuMOUY9B2mpT1FOd7Ygg/g61GIy73T8cT1O+TGwbRSnswNOCqPnFf7N9piPnpU+sxip3JFsEuZofMOMCQiae5deIf6T+OEYGA6vyfbfv7uWCtT4NIAe6t2bpmK8lR5Cx5OxHvhNwXCTTBRYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:06 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:06 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v4 0/6] media: synopsys: enhancements and i.MX95 support
Date: Tue, 19 May 2026 10:07:37 +0800
Message-Id: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnFC2oC/2XMSwqDMBSF4a1Ixo3c3JtE7aj7KKWkJtYMfGCKW
 MS9NwqlSofnwPfPLLjBu8DOycwGN/rguzYOeUpYWZv26bi3cTME1CCF5GXwePfNVCiulbHgsko
 TGBZBP7jKT1vseou79uHVDe+tPYr1/WbUPjMKDjyzmipSkGeiuHQhpO3Up2XXsDU04g4jHTBGX
 JAsASuSiOYf0w8r0AdMK1b00E6YHKw94mVZPoA15zsgAQAA
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=2775;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Rn8TnQJjmRPkiB5CCPvUwKEP+EE4Cv3ervNNIU5lK88=;
 b=IsKeJcnzL6mZymKRjlxoRxq+vsMc3dlVWiPdYZoGKxFML+sJLg64god3AtM7pDtd9VgWYWqna
 d92+UQUm8LaBwT79At3UmsLWDGEVmjmaGk4zC8EFosoXaxiGhUjFo86
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU7PR04MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 016425c2-34fb-4694-16f2-08deb54b0bce
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|3023799003|11063799003|38350700014|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 cWbQ86amv7tLC/od5mlbTA6FVJS8ufwGs0w6O638VuG+MJtshDEKH2IOw+YCXDicJ9g6Co4jEMb8H2mmaybfosNjpeO5sAmTRAYuI8WRs9V3IpHJpAyJmeBDQeQHEJ0x21rP3DDeJVF0p9ox+0gy46fDZoFk/1N8KHIZ1iDaFlQ4v5dF0wTz7TnyGCKknQcFD1qWC+8nP+qKk9sxWzXb6IHTcU/KEr41724ZCCf7qup89kYZnTqwKgnjsbFFdNI4q4JKkg89iQoduWVKC05HN8uWFIwQY3ugdQNYWsZqpwkAJZYOfi1XufDEFN9SvBTAb+ZXHmmAu5l6aDgArV888NTtfdkkNAMN1rTdRA2Kr6EWg9AkEpxDxiqOqIUZFFc712+PWK2OgZ4d5xv+bdQv5ewUKCxEd4jv4HKGkMstpdqYwqPaVXG8XFwqpUIe335oUDeR3c7sYC4Lk8j/zZyXqSl6S2ND82/ZeMZHmey9eE8GN9J90ubKBm+rQOY7bf/TpFWoSo0lZMOQIgcvOd1UV8nX+XiglcNL/A2Of7nwQCuO41S5SwCq8gGgI36CRjPjwRYTUrEiDtbNt5FphyHEDW7psK0ZJ/fYW+O0+rrkECdJGuqSrsZoGs1ouJy2gv/G42fIL0zcZsKC4hI6fIxOLst/gIpa0SG/XOWxui6An10NBf2FRlC0yrqEUgPCGpmVrXchlAwlsxQLPl8L/szg6JWZlhmext/KSeUsx7QcYePwCM6+6Xxw4O8JU2cqrP6ru4aZz4j4RmKI6EMOJBwbCg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(3023799003)(11063799003)(38350700014)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bC84R1B4M1Y0UmwvOWdsRlF1Z0IrSXJVSytRT3dJaERUeW1WTC9kVXBCWnhk?=
 =?utf-8?B?Qng4bnl5d29JRjN2UkNvd0dyd2NmRXYva3p3OHp2alB2ZDNLQ0UzSXR4WGNr?=
 =?utf-8?B?QjZLMjM5MkozbTJlSVdGM1hmcS9VOWIyMnFhZHhVRjJ1MWNpZnJvMkxYODA1?=
 =?utf-8?B?UzRjelBTUjFVZlppWXYrM1FoenVqREUxc0MwWC9OT3RpSHoySEpEV01CUW1n?=
 =?utf-8?B?a0xsR2F3R09uaTZtdzVjMXBlM0phdTB0TW5EclloOCszRnpkQkZUamhBUzdR?=
 =?utf-8?B?a1ptdTlZRk1laWRoaC9XbjlkeklqZ3hBQUZkczA5Y0VpVTl2RXU1UjJtRm9F?=
 =?utf-8?B?RlBQUVNTdXhuMkpiRWhzRGVBbE1LK3BMZHBla25Od3hrazVoT1QrSE4rWWxE?=
 =?utf-8?B?blZRUlh3VlhRUHFVWDIya2ppNGI2ZEgzM1BPaktxWnBFWGR0OG1GcS9mamRU?=
 =?utf-8?B?eHFGZENKb3Rhc1JrV0ZiVE41NEEwaHB6YU1VUU9DSjlHT2RsR2lOandWMysw?=
 =?utf-8?B?cUxyOWE1S0U5ZHBwbmdDd0I5Y2dMb2VkVnBqNVA0NWFCYUFkdzJ0RkNiU1Bi?=
 =?utf-8?B?MW5YSjVyQmNaS0FZaE9rV21kd2s5WWJBSS9LQ1AwLzhjOEpJMnJqbndzMDdF?=
 =?utf-8?B?VlZraUFESVR3anhtMjF2eWhYSm5zcEZ5WFBaM3BmSHk4aG1DTEdyclE0cEl6?=
 =?utf-8?B?QzJ2VnYxQ1hDUkcxcjROZlZ2djBRM2hPYkhyU2NCWmpDd2g2Rnkrcm9uc0pS?=
 =?utf-8?B?VUF4SVptTHAvSWJkZjhXVEdGTGZ1TmhqbFdITS9sYlVxY3Fyb3JpemhpUWFr?=
 =?utf-8?B?S01VRUdJczRvdHJPK1crbFpCMkZUNGVmZStHSUpiOUY1a0lxbmtSOGxOZzhv?=
 =?utf-8?B?dHNEVFRVTmFwUG9Ma0w0RUlMSVpQVEFzYk5oNDJaMlF2RjhPMU9pWGZXd3I2?=
 =?utf-8?B?RzMxRnVmTFZxb0FLSVdyQmo3ZnpaWHV3MWE2Wm9WOUxuV01aN3QvSkNBV1Vt?=
 =?utf-8?B?VVNOeDcrNlpDczNCYm10SjZaRmtTbmVsK2VMUlkxems2WTlTTG9SOVdOeGVJ?=
 =?utf-8?B?Q090cjgwZm9DU3NvSU4vV1BmY2k0dWpuVU92cUpwUC9rOGhibzRVbTNybmQz?=
 =?utf-8?B?RjB6bW1zRE4yclFHbkt0NWs3OWc0eTl2RTM3RlBheU51aDNVMlBpRkRHeUE2?=
 =?utf-8?B?MExCVjZWRGFtM0d3enByVEUrR0NmT1cxckdUZWhHVWpvUmFTcXEwT3Y2eGpa?=
 =?utf-8?B?dHk5TUFUWngyL00vNll3MVMveEkzM0ZqcHR5RXkydVd3RTllSzRGSmFXbXhO?=
 =?utf-8?B?dnNoREhmMFdjSW1ZdGloUDBGOG5abXczdnhOTWx6RVYzNzdVd3dpL3hOc2Vj?=
 =?utf-8?B?Wlg2b3dVZmpOakdPT2J4OVlGOUs1Zk5EYXBXOWZQSm1Zc2JpTXpjUFNQa2N2?=
 =?utf-8?B?QTRZbU5OanVna2ZaNXlNMkc4cXJ6bHhOck9HbmlNb0NMSHZLWENMbnhDS2I0?=
 =?utf-8?B?WExJbWhHNUFTRDhXd01Db0lFMUpBakdvOGszTlRYWDdkTTRBWVhXUFlVRDYr?=
 =?utf-8?B?QVZMbUl2QUIzaXpIWUxEZFFLeEcxYzFvem8vUnFRU1Nab2dVOFFKMXJYcUFJ?=
 =?utf-8?B?ZElXSlZEUWlCbVpiTXJobnFKMlhrM25iL0lneU1nOStxcW1hbjNJTkFwSWlS?=
 =?utf-8?B?UHFxOVhvalgram80U2dpVjNDZWM4MXlIMDdPVWFQd3lQRWI0TTdXTDEzTnk5?=
 =?utf-8?B?aGc3MENLUmNEQ1RJaDQvcGkxVm5PLzBSYTVXem9jMTZSVlg0OU01UmRKbnFn?=
 =?utf-8?B?Q2xaNDU5TE9ZS3ZGOXp3MjczWm5qTXdmeHlmRDFKMXpvYmJIUFVyOE1xTGl1?=
 =?utf-8?B?d3hKdlhZQWVmZ3hHYTJDdmkybklaNVg1M1MzWnZ0UHBvWDdwS0tYUEVsUU5i?=
 =?utf-8?B?THpyMk1Ea3JnMlBrSG91czhMTXJUWGt4cEdnYStaUDZNZW80TDZ4SlZSbnM1?=
 =?utf-8?B?TEZyVzF6Y3RiWE9YNWdyRXVxNUZrbk5mMlVQdHFnKzBla0JRSFBVcjhIb1FT?=
 =?utf-8?B?WlVsV2lHNXhZVXhmbFpoTTY2RUVGb3M3UE42cmJ5VUNSd1U5QUJDOEY4RjlD?=
 =?utf-8?B?OWROTnpSMWphRlFBeExTZHZ4Mk1jSGZYeEZoR2VQRlYwUFBRaUp6LzBkNUc2?=
 =?utf-8?B?UEI3Z2ZmMmk0Z0R1MTRiYlhOVmZMbUZyOGgyOHNrRWlsSGFEUUgvd0FTVzUz?=
 =?utf-8?B?cHBZbFRUUnYzbjNBZnNxWWpJV1BzWm1yNW5CMUhHQVhjeWtUbzRINnkyamtU?=
 =?utf-8?B?UVpMTTVHdzkxamlGOThDZ0NneUpWV3dVcUpXWGZNbVpmZDhaOS9KUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016425c2-34fb-4694-16f2-08deb54b0bce
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:05.9889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgjGfEDwukneV4xFruiNSDUq7cvgOpXfAae8/rG+6b+D1jxxzHgu8FmlYkPxuLpkn+vS/5nk6XcQHO/epFOs4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62060-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: B9D65576437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
with multiple stream support and adds i.MX95 platform support.

The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
IDI is software transparent, only a different register map is needed.

Tested on i.MX93 and i.MX95 platforms.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- Rebase to latest media/next(bc1ba628e37c)
- Link to v3: https://lore.kernel.org/r/20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com

Changes in v3:
- Added Reviewed-by tag from Frank Li for patches 1-6
- Fix formats array out-of-bounds read during enumeration
- Add NULL check for csi2->formats to handle unexpected format lookup failures
- Call pm_runtime_put() after dw_mipi_csi2rx_stop()
- Balance PM runtime get/put for asymmetric stream enable/disable operations
- Add Reviewed-by tag from Krzysztof Kozlowski
- See each patch's changelog for details.
- Link to v2: https://lore.kernel.org/r/20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com

Changes in v2:
- Add two new patches
- Simplify error handling by keeping goto labels instead of early returns
- Removes redundant register availability check
- Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
  readl_poll_timeout() with direct register address
- Fixes stopstate condition logic
- Check PHY stopstate after sensor enable instead of before to ensure
  correct timing.
- Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
  balance performance and responsiveness.
- Add dedicated constraint block for i.MX95 to reflect different clock
  requirements (only per clock needed vs i.MX93 which needs both per and
  pixel clocks)
- Update commit message to include more details about interface differences
- Add Reviewed-by tag from Frank Li <Frank.Li@nxp.com>
- Update commit message
- See each patch's changelog for details.
- Link to v1: https://lore.kernel.org/r/20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com

---
Guoniu Zhou (6):
      media: synopsys: Fix IPI using hardcoded datatype
      media: synopsys: Add support for RAW16 Bayer formats
      media: synopsys: Add support for multiple streams
      media: synopsys: Add PHY stopstate wait for i.MX93
      media: dt-bindings: add NXP i.MX95 compatible string
      media: synopsys: Add support for i.MX95

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  16 +++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 128 ++++++++++++++++++---
 2 files changed, 131 insertions(+), 13 deletions(-)
---
base-commit: bc1ba628e37c93cf2abeb2c79716f49087f8a024
change-id: 20260414-csi2_imx95-65ad0e7f630a

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


