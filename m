Return-Path: <linux-media+bounces-25510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C062A244D5
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DDBF1884F56
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233951F709D;
	Fri, 31 Jan 2025 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ceGrZhBG"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C111F7089;
	Fri, 31 Jan 2025 21:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359315; cv=fail; b=OD57l3YD73pE4TW2vXv2Bmn3HlB1T6w0rngUCBQmZBxkH1L8qOFiDTqQCNG1uCwzll+EZELSZ0wJy0XioreaijJmgliao7T28pZ+0ACQxL8cNACgwHbjW9h086J27xUJ33y1ywF9QMOSzcGrM9zlxiue1m2rprGcWGeF/2iVx64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359315; c=relaxed/simple;
	bh=wPaxA7QFMyHVItcU9vluOWaD3PLB74E5EH3/QvGa2EQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KoguS5YzG7u4nD3D5y5LdU4dTgU5ZVi140wpagBYLNi8hpljhXJTDpyTlougCl/3GtDTOEe3b/wX2y3Q5CpWNU/hmHT0jIqPHG411B7X3Y8YrlQgBGFfnymmEQA2C4XGzUpqcR3JKKOsKf40ZyCDVPiYVbQhuXZORrtjA2+W4sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ceGrZhBG; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9y/qR2fK/cWYW4tEuYGfuCop5efv0yioQOkWkzqCRNRDJgGAYMManOIAgO7T5Oc5aMuo+CdsyXT/OvKdXTH1iRsjnM8qaYx5xbmeobtLw+qPXIx3XWPgTDFJGyriyvk6OXQKxpG8BsMWfzZTaxAmRHpu24+iWKPFWVK2SvSxCkLHrvGItN0iJdkKLRUhQQNbaDizAJUMYM2dy8+ivsdfvVZXSREyHBAoAgh7Gx0UsiLjCXr5+CeTbakXe+hp3I+cZVkvdNnCXAr1IEsx1jImdrGgWAKXDY/h1E9shFzsZZwvWlCI032YqdeUqW/Inc2hC5jvnSUckT+3AaNBCAYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZNnDAgClErc+qtTNreqMtJI8UiWUxRY49NcV72SDSM=;
 b=YSc5qh1K0/HTESjdHQYZNjwdygw003s/cwFjl8mwI5+iXbiE90lHCMh7IVIAsqmy3awZeYu9NUbXl1m2+pKQ7hwrlFXjdxTlPT1HLkcLZNxhIxXsUuPtOe6+YLVOMEDDpqvxfSAzKR1zM0M84WMwlh1RNANoerAK8GUyk2qd1YYT2Ki8pE5twqoiouYljIIpqxZfSHkrCFEptKoEqMjvGaKocP66/LiesbREibC0sPlnKNcbpmqLJEH4Kh1RmOsXfpe/BX/8prG/GqRzYjTn5sn6YLyoWAf2rSPA/dfwCfKIL6i+znP7QoLxUDluk0WKmIre3zD3KSYhdI34YMZe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZNnDAgClErc+qtTNreqMtJI8UiWUxRY49NcV72SDSM=;
 b=ceGrZhBG/nkOq3Kn4ow7syi1Au1X/N9joyK4ToW3G1k1rQb3m+p1JwJN1fKWjNC1HNPTIsFxNQS4iQ/SCaY9Wjy4KNylYnWdKkEf0L9PVba4uPtaY2g76kw1VOguCetaqKTvL0hz0+aLLp1QoS0faOIPsSFSYJXELjoM2Muf67flXWlOXCBlM8C+Rps10UOWvSw53ljAN6hiY2ejq4LwMNZhrn9hbfnsUuLU0KtdEY23WfB2NSQuhB1PkHtUCgyrQ/tM0XXPks/0ZDm0EpQlxsvbgRoQRe5IF6HrgWuIT8BBGzdgsqlkmCTFgAPwPsWrdm8BHA0EpPe07krGGm4EEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:35:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:35:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:57 -0500
Subject: [PATCH 12/14] arm64: dts: imx8qm: add 24MHz clock-xtal24m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-12-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=855;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wPaxA7QFMyHVItcU9vluOWaD3PLB74E5EH3/QvGa2EQ=;
 b=RW1CE0TIbBjsnjhNsB5qbfDYW7N5+jZh0R8LIQLAOMlJdzAPodAuLFXwJfxx8INOEp837wr0R
 5C1ZOfJpy3bAqbvpeAHArAjI/sdUM9l2ABU2Q8j7QcFXQzd6mtvpp5q
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 4669241c-4c97-4146-8f29-08dd423f23bc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OTZjS1ZZcjN3REVLRWZKM2NXUVVYSnFUKys2QTNSR2FEUWl4cEpyeTVXKytu?=
 =?utf-8?B?bFZzOGR0d1Q3K3p0NVoyb2NLWkJhWE5vcFZRS0RDdXUwUi9MbFBEdWE3bzcw?=
 =?utf-8?B?NXRsNWxkZzkvQ21Od2R4d01pMm5IdU4yS3JqMkVEMi9acnRDSjlaNmpnK2RY?=
 =?utf-8?B?UjJEUW9NcE8ycFQzcHNKWGVWTG5XbXFXbEJoQXZ1cWliRFh4YllWUFY4ZlZ2?=
 =?utf-8?B?MkFneDRmM1NVZDR1SjRyUElsUkFhMnR5SC9TZnhoZloxTUlHdlZuZlREZXVI?=
 =?utf-8?B?TkpOZEROOFVnRlBXelA0d1luaGZUQnFUellTdjdEU3RRbWxYakZESVBGODVE?=
 =?utf-8?B?aGcxb2JYRnNneDhmU1hCaldVb1Azanp0VUZJVFFDYmJicnpWWVVmUVZGazZo?=
 =?utf-8?B?TmdaTktWOVJscnhxMFZiUUt1YkMzVXFhYXFadGxCZm8wcTVxMmNnQm41T2J1?=
 =?utf-8?B?R2pEemtlb2ltN3I0UjNsS05lc3U3WU51VkRBWXhsNzdjZHdza0JEMnJNOGta?=
 =?utf-8?B?QW5oSlh2MzIrcWR0TWhEdHFTQXprdndTOG1uYUpyYWpIOC9zVExqcEVFTk5H?=
 =?utf-8?B?NWNDTTBUU002Zmk1SnNpUVF1TURlMHd6UENTVDl3OGVwZGVEVkJJMkFVZUY5?=
 =?utf-8?B?NnlrM0UvWUxiOEZQM1k3eXFTMmh1ZFJJeTJuYWJYMVBCa1RScG1ER2VCY2xj?=
 =?utf-8?B?eEJmbSsxWEM4R0QrR0pXSWU2TkZnbnE2Tmo2UmZJeWVnVWpWYjU2ZFBJSUZ4?=
 =?utf-8?B?TjhMQXQxZVIrNTJxSWI4Wjhpclc0Y2FnOWw3VUNyeFpnN0RmQy81SkhlejVr?=
 =?utf-8?B?YSt5UGNZb2RqVEVsU3BtbWMxdkhQbnVDNlR0WEZZMHJnMCtJSE9iQ3FTdUpT?=
 =?utf-8?B?Yy93VWlqWE9JUkpyTDZodFN3Z1Y1aVZwYnI3NElvaGtQZEJKa0ZYaCs1UEtU?=
 =?utf-8?B?MnA5aUFkbWdxZGlmdTEzYlpTdGpnRDhIelpjU3VReHRKK3Z2dmtIS2ZnSlFj?=
 =?utf-8?B?dW5UYno4UC9BUGxBcldic21CSHl0cTlpcEZGSndSc2k3cHRKN21JYWdBeEJ2?=
 =?utf-8?B?SFB2NzdkRjEvQkZoMXNNaWV5Q2N1blBsUUpvWWw4a0QwRkpKdDFmTG9qcUs3?=
 =?utf-8?B?Q242bE1JQnc3RU0xMTkraWNTZ0dGT0lEZUNONDhtQzdKUGVPdXNPZUE5NmJB?=
 =?utf-8?B?NXJlSzNIYVFGRGtlek1Vd0E4M05nNHo3MWQrYVNxdU1zdHBwOWpOL1pvVWRk?=
 =?utf-8?B?UVZFbGR4QXM4MW9DcDJoK1B4SC9wSUNoS25hd3NwK2RLRTNocVRQK1EzaGN1?=
 =?utf-8?B?S2kxVjV4NHpNdTNHRXBwYmF2cDdFZFpEck9DdkZLelU3cEtmeTVwWW81elNP?=
 =?utf-8?B?S2FXaC9aanBZcHNVdmtpUXhmUTNjSzV0bmNHOHlwY1NOVmFZZjFRRi9tS1Vq?=
 =?utf-8?B?ak5sMCs0MEhWeUlQOUVoK3pZS1BwemtGZ3p3RjhnOGo4RjNyY2ZzOXVIeEdi?=
 =?utf-8?B?Skx1UUR4bXJodmtLbURCRUpoNVJxditHZEdMOXdtUTl5U0QycXQrbmZ5OFZQ?=
 =?utf-8?B?K00wS0w4MVF0dXNBbENVcWhreVdJN3U2NElzTmtpekw1VUZHL0pWYjlrMkRX?=
 =?utf-8?B?c3drY0FseThUQ0lXN1dDNUU4WFhOUVNCYnZVVERFV0kybVh3Mi84SDJmY3Y3?=
 =?utf-8?B?RlFnL1Bxa1QxQ3ZjUGR0eWlvUW04SmhNekhZU2k5R2t6S0ZCL0lKRGNQQjdZ?=
 =?utf-8?B?WjAzd2VNaXdrVnZZYzUzTG90V1B6bEpHUlFsQkhZVWhqU2hYMjkvaEF6R1Q1?=
 =?utf-8?B?TU8vdUdNS2pheUx0cWxqY1FZb0RaUHRQVktldjNpa3VDeW4xMTZNNHQ2QjE5?=
 =?utf-8?B?UWhkZWo2WlU4SXlDZGFWWGxyaURIM1FZT1NUdHZZbnVRbEI0S0szaDdFRDBC?=
 =?utf-8?B?VFozVGlBaUFJMDRqQWZGb0grTkVvaVRKaUZ6WExFSk1vQy9JREgwaU13MWNZ?=
 =?utf-8?B?TUIvK2pidElnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c2JHOFhYSnF1ZGRDbXN4U2pvK1dRUVV1TmZrWXA4V0hpWEFWWUhKNkd0OWhV?=
 =?utf-8?B?Rmo0TXIwczRTYjZ6SUY3TmQrV05lOU5Qdnk5KzR0bWNQY0VndHhTWnNDcCt6?=
 =?utf-8?B?UHNMMlhkbXI3OXJQNkNaeU5WWFdGSnRUSGxLSUQ4YXVDSlpKY2xCSXVweGJI?=
 =?utf-8?B?dlNycGdCMERZZGJJTnlodDJkZFBVakJtSDRBTXJ6eUg1OUgybWtPQ1RyMS8y?=
 =?utf-8?B?Rit4eGRoU0M3MVVCNlRaNHdwN2t1WjJaalQwTjRaTWlHRTcyQ1JPTGhYd2NG?=
 =?utf-8?B?M3psQk45WnB2amQvVWZTWW1oUC8rNHlKR3JURGtIb3pzRTMyRTV0ZGN6V0Vl?=
 =?utf-8?B?N21kNlQ0NmowNnJRMHhUL3lCZmthT0RDcmVMaFRLRDA1V2srYUU0UzFVV0pl?=
 =?utf-8?B?WFo4R0xQN0IyOWdDWXBWSXFyU2QzMlB6VzlwUmxHZHpDdHBPRjVpby9TYzVV?=
 =?utf-8?B?Z2NtbmZGRllmTlV5cHdwYXBhWm91Y3A5bGlKcXBTdkM5bDdoSUJxMmR5UGJa?=
 =?utf-8?B?OGxVejZNNWJZT0cvZXVWYWJBY1hheDRlSjc2a1VzMzE1Nk9WYkhHeXN5bEg3?=
 =?utf-8?B?clVZdVlkVFZjaFl2QlZiL3o0UWRiNXFrMlRrMVpDaVRoampMMEhnTURQT1Ew?=
 =?utf-8?B?YzBuUE9KdW9lWGJwb21KMEpLQ3NkeXdyaDBsOTZlSERYQkpGOE81bExPM29H?=
 =?utf-8?B?U3Jkb2xqUzJWKzhmY0xadGVGZXVEam9mT3E3eGR5aTRIRUU5L2RJblRhZ2JN?=
 =?utf-8?B?ZVIxZDAyUzFmQmNpb2g1U2pvVG85dFZsN1B4UXZhYVJuUG1hOEJ5R2Y4Ylpl?=
 =?utf-8?B?TDROWU9TTk4xWTQyaUR5TWdoUlhVVkplMks3VmFYdTJVTXBmSzBDMjRtSFFD?=
 =?utf-8?B?MURPZ0ppNTQ3U1RuV0ZzcmdsdVY4b0xyUHQzdzBSdUxxOFQ1Y1AwbVJlNmFs?=
 =?utf-8?B?M0o4Tm41bFpScFlKblM0MDFTMGFuWnhxS0FCeS9EMlpPV1JLMkxNL3A4aHVW?=
 =?utf-8?B?Tzc5RlllNGFvOHc0K2ZTdFJIV0o0Qy9vS3pvK3dnUEtaTlpDa3Z0aXhpK0Rw?=
 =?utf-8?B?OXJjVlBhcStOWlZvT0o0ZlRGd3BsNGlUMWRVOEUwWVJJVFNuUUpjSG1rRkh6?=
 =?utf-8?B?WnE4bUhmb2lsK25GRVlHbnFFbllGUmFpNk1iWjdtQXpZQWVaTXlxS0R6U005?=
 =?utf-8?B?aTJOZjJ6cWlZVEJtK0RVQ01GTlhQNUtoZ1NHMXEvS3hpU3h6TXRjNmdhVFZw?=
 =?utf-8?B?dzdjZVdWV245eEJkQnByTnB5UlYyd3I1dWlWYkFVaDdDWW9HdG1IeTR2ckxq?=
 =?utf-8?B?SHN2QjlsN3orUnFzeGdQMW9aa1NoQkVkVzUvdER6TXNXa1hPbGp3N2dJMzI0?=
 =?utf-8?B?OE5XOFZZdWZOSmEzb3o0OTAzNEhZaFZyYmRpRExpWFBrclJ2cVVKcFZEUWRU?=
 =?utf-8?B?VlV6SUViajFjY29yVmUyM3c5d2ZNOVNmZHAzWjFuSmZFNnNYbWVUUkFBZjJI?=
 =?utf-8?B?RjgvbWQrOGxPL2MvVVVOd0J4ZGtJUUl5UDc2UUI2T1lKR3N2NkJHWkFSakN6?=
 =?utf-8?B?UEJ2Z0c4UmQ4K2h5Y0RMckE1enFUYmhRVmJvTjJSK01UbENJZ2cwbkNVUzRH?=
 =?utf-8?B?ZkIrSk02b0U4V0Jma3E5QmFpZ0JvVDB3YTh4UnZwWm9NQkdkUzhrRXRRdDl4?=
 =?utf-8?B?WVJYQm9GVExUYjBXSWZ0amw2MCt6RERMOUFkK041Y0RFZy9Lam1pL2xVR0tK?=
 =?utf-8?B?Z0tLTHJDTlBEME5FVkdoQUZ5dFl1cTh1a1hJOTJBUU9pQ255bmtBVUNDSmtD?=
 =?utf-8?B?VXY3VkVhUy8zSzByUXkwbk5IYW9UN3ZPLzZwVjhSQVo1c2N0UmpiRm1peTU3?=
 =?utf-8?B?d1dFN0liOXkrU01oTDgweGh0VTNzVlZRc1pCb3FpRm1rUXZKL3ViRldBZVA2?=
 =?utf-8?B?aCtWUkNyb3EyMG5QNFpsRXRDWHN5cTVHTVJHd3J4Z3BGMDcxR1BNRFY2eit2?=
 =?utf-8?B?c0ZnR3cvTEJ3V1VJYXpTT1VZcFJrSTBGUEVWRVFBQ1lpWVFKY09vYjd4MHpR?=
 =?utf-8?B?RTBKSW1ERk84K0VHWVBGcTBpSEtXTjhOOENkRTRpZGZZRVBRamRYcW50ZS9J?=
 =?utf-8?Q?GVBs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4669241c-4c97-4146-8f29-08dd423f23bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:35:10.7413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIs3siNj1YcBAATkrjlwKhew2+2kttv/0HAroAiMgR8Pv37UE2s/7jX5MXf7R0tDIJopbGCZ0Tziew8AdlYOPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add fixed clock node clock-xtal24m to prepare to add camera support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8f..0d562c1997c47 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -585,6 +585,13 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	xtal24m: clock-xtal24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal_24MHz";
+	};
+
 	vpu_subsys_dsp: bus@55000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.34.1


