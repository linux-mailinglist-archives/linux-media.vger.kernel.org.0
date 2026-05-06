Return-Path: <linux-media+bounces-60550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N3uGusC+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:59:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6E4D8382
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD0DD309B1A0
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFDF3EC2C9;
	Wed,  6 May 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NX3BDoPv"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8703E9589;
	Wed,  6 May 2026 08:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057557; cv=fail; b=LPpLjZWPrvYwrdWUlsDa6Q+feMZSOv+WGGHaAbB6eClnoTDriTXL5nHjbg7PDCBWpmsjIoyPzaoHt/4SkzLRN8t0D2Imx+bI2S8koqr5VyjmApsFMCr2D7JYFwm2/plfG3w3DxiHjE6ixF566B+kH3UGhPjQjnybpBnwVND8wwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057557; c=relaxed/simple;
	bh=bG+DS/0ewMdNHV23cYrXxlFJm8KaPiWL/g0hJ13vsnA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ITlpvUpObDfYupTNGGVlNDS2UQ8QjFyRGM8KW6eGxcJOS+JyGvxBP8xKIoHNUikSHIw7M+W0qlHUBkHoEGVN5SzZnFrKBzM1Wa3H0dRDum7yKSdbjSLyARaeANC+huqAq2kRbOUGQ1JXy9QLKm8o3f+M+TPi8vn8kly/NptPTtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NX3BDoPv; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuzZ/bCN7rewqgFis1fqQuYw7N7C+GtejBZHCoUcDiD83LHl+icp3meHlu0T9m7Hb7YcMw2sDtmN2knjrIjis1oWP5XfMXwrL10BwW+s8dIfvYBe5OeeNt+pnPngiLbVaVByqe9pjl2xm4InzWM5sGiNiPO7WztenaG/5AEUdAmjVLUtTQWU1lY3WCSHsXJ8/gT+rJ37ez6rVORXQXPzlOgWuOKP5zX67NYlCA8aksSXS20MgKO7ypu6wV7X05CCXV4zE9C47YUSIPbHcRblgUYMO6Ejh0K2LnGUDfrtmiJhyt//DzEpvF1iLQT5jXPywBkejv64O6LcAEmXtMiYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHB9SHi+fKnZBXLXZ1bu7K7W3GRCfhmbGidPvdUtrIg=;
 b=dkiUuJW+yU5ONo4YaTCRlu5Ci2a6nD5Y3lIxPThy+c6lwK4rBM1tRDCU0sWe/tI2VNZbFJqFBeFGE/AqAdyLs9e34i3cTxDX+swPFFrBpYsZ/kK2NTBxFv8STYaBKyhK0CUH1D7t4XhRQksFQkVV/M3QBMnAF8EoGai4glachVbNQCbNRtqNQGjsMAMoJUMwC9Prs/P/ZauiwvYwYOt4Eegq03zrljC+FyPFCARRR2vfKnbkWVeUL8PslO8L/t5gbNwiJDkEUg+z5+O3KXRZk29aSCRR/Q2Rv3ELVjRz/zkKiOt1wGDfUG8kyO5KtUhbDx+mGoLVndMJcC921YFs0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHB9SHi+fKnZBXLXZ1bu7K7W3GRCfhmbGidPvdUtrIg=;
 b=NX3BDoPvlqCtieV8C/aO4IhO8IX0OGOsHSaW4xweAZT+pivtYsgQK+s9RCoZB6QWoeE7Oz3rXGWbMOGjE0dtfEf7ZmDIsH3TQy0ssogz62NI63WUPjGfmvz58SbHNtt5Rre8LGQ9RMTF+jGH+I9SxRh0XbfkqmIyUhtXfkdYCws2qsY4/ZhsfmTSsMFCl/oEye5Q2wZh3TjKO0YcoXEp+4Vv5MPzW4cPOLxo5u+GV8Mxf2mZvah1fWCIelc5qicZYSLg/w/Dad8YVMxs4PcLLXJAv3q6iYGI4WfZy5bdeNieYjJlSXsbvoZVDwLsmOFKFErjOcvXxb258/qZ7NNP9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10915.eurprd04.prod.outlook.com (2603:10a6:102:492::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:52:25 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:25 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:04 +0800
Subject: [PATCH v3 5/7] media: synopsys: Add PHY stopstate wait for i.MX93
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-5-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=4340;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=bG+DS/0ewMdNHV23cYrXxlFJm8KaPiWL/g0hJ13vsnA=;
 b=AbfnjaBvUPYqsFzQYFx5C3Bkkg82J0o7y8VaWKrx6azzPKEwXMmQdFuE/zZHVB/sXmKTztC2P
 LefjI8fJcBhAi3DicXQ3WdvU2CxjlRYGLkWqnF80qegOagxj2w5Iaj4
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10915:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1e3faa-a83f-49da-db25-08deab4ccb85
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 wJYE1u9lT+YFHX7FSbz4H1p+JxIhtDG/vmaNJRmWulJD1TeG2dGxjPBELEsdF0xThp7CqdOKIkGcfBZWbaqFpm5OxhYi9zo4EKclCiS78mxAwYvytZedYYIhKL6M2AvbMwFcA8hrYUOvuiXdU/3MsNMVzVzD75+mu+iHtTGbc5ryv5vahneuvVBLs3xJDwCtWhslBXKHN5Wkt2ehGDX2tuJPN+QmIsyVC+cfE+rsm1quVg9rQke/54SSAsryVpr/oYmwTpLkmHO+7ZiwGRZbH2yNTBwmCAv9w2cEZlshtn2j30RI1tzNDRV/XAiLIE/DHmRbt3rr6CMpyBPw/4s6GdIGbXB0yaHgvXJhBVAG8XmiSn7ErvZK86YhfeoD8tjEWLkAAVN6aPAdpqpX2mwriyT7hKz0MvSAkZDZLGNIFR9gyvGp3I92IeIM9w4eSQa1g8XJRJzk0aBll0ilVzp5+0qtf4BV59Ig8iWp+jZxgK622ZXS2PvrAyIPIaDFf53nc9Jupk7NFg0zaZvu/LJOssvpaNSQ7bXX5rvN9TgdrZWRoD3B2HMLzLZFMd5wCJquXhqDrxfPFS0i9tEjtxguo3Rhd3MgrkRD/KxmBi2PC8oVilYBDGfl3knYgdD9uWVViK4zxCCErAYtFVc0mqWpBNuQ+QB8ixLEJfgs3kDjDcgCshSz1hGKCIVqSQsvqpNwTM9lBaITPs+/z+PTXpH7EqFrSXS2sAmVXWBPKUl2LIlC7Rt3++AwR8WSVS+BX8hDcgmY/eIcKQESImrg2ZpXww==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aFV1RlFyQk83L1ZjVGViQ2NYdUdMWnNkYURHQmxIL2ZzeDNrcjNKTkdWanNK?=
 =?utf-8?B?bFZqb3N2MkgrN3VRamh4a1pFVzRvSFk0aWNjY0dITUl6WW0xMGhEeVZ5U2Fh?=
 =?utf-8?B?dmR1QngxZldmblE4VkQyWVJoWDNTVVpUVXFKTzVDRGdTQlJVc3YvVEJaYVpY?=
 =?utf-8?B?dlJoakF6WkpyeGVMQW5BRFpqaUdHTFRUZk9Eb0V0RnJEbXdCQnJDZURhZEVx?=
 =?utf-8?B?a2gvRWN4UmtYa3RGMDNwWW5MaS9KajFCd01XTHMzdmtYQlAwRlFFL2ZYNnU0?=
 =?utf-8?B?UThVQUpTRk4vc3BWWWlKcFVrTDJldmY0bElQeTl4cnNqbTVVRTVCcmdBbytz?=
 =?utf-8?B?M2plVlEvbVhzYlZVRHJ1SWNrbXkrZWFIbGVsQko4dFhJaTArTlRZZHAwemI0?=
 =?utf-8?B?M2wrT05PdGpnTDY3MEljeWIzVHJudDh4WUpCcDJRUk5MVklObzRXQUxLM3l6?=
 =?utf-8?B?bWNqWWswY3hHQUxEK2pvRlVnd0RYL05QMDlzNnVVcEdZTllLdW5JUWtGSkI3?=
 =?utf-8?B?SEx4dHRuN3ppcDBKWCt6TEZYbkVhVm1iUzdNTUFGK3kwanFJb3dTelNheDha?=
 =?utf-8?B?SitGWExYeEVtcUFiWUNvYlpmZXFvWk9YQWJtLzdaaDkrMFBrZTBNcTNQeTlM?=
 =?utf-8?B?cGZMLzNieGYra1JRZFhDeXBXODVHYmhoVEFHR2kwcStSMnc5RUxJMzNrbmJK?=
 =?utf-8?B?eXBIM01FSHUzMGtYRGVhVnhxb3cxZlhkTFJEWDUzNitnWHVBN1JneHpIeWVp?=
 =?utf-8?B?MWdXVWdjVHNjcHpvT2kvamN5MVVOa0Vta3U2RjZSVjg1Qm42R0tJclhGNkk0?=
 =?utf-8?B?Y2tVc1pDbW5kYU5kUTEyTUMrTXhtOGREVXFLbW9DaUVteVc0K3lqdG9VVFov?=
 =?utf-8?B?c1M4bWhYejAxc2dndjBudFNjK2pXSFltTFYya24vSFh6UjlRM2dLSFBNeXZV?=
 =?utf-8?B?YS9TeVl0ZTdZT25rTlpScE5Md1hVYXdnTitaMlIvNTRKaitWUVBCbWpSd3BG?=
 =?utf-8?B?UlpieENwS1JsSm1iTDI5bTRUZWExZnBZZzRpY0pxMHV4N0dQczR4aHQ0cjRj?=
 =?utf-8?B?NDJLMHBtbkZOeVNjZGFYUFpoUHB1bXJvSlpYZG5GK05xS1dZSWFWQWhyWGZq?=
 =?utf-8?B?Rm5JM1RDdjF6ekUrc0pHTU51V2hhK1RkMktwdHd2R21GcHB1Z1FCTmJWMXFt?=
 =?utf-8?B?YUVqWU1zalhxbXBCclZGYUFoS2N6cmMrUjF6c0YrWkN5QXUxY3hLZVpNcERt?=
 =?utf-8?B?dDRHSUU3Y1ROSENVK3RIVVhLaUc2MnowNDB0Y0pXWWJTb2tkeE1DUE1YOFp5?=
 =?utf-8?B?OFEvVE11a3k4alVuWCs0ZmUrdGcxREVRK2t2aU1NbW51eVFoc0JydGxzMXRY?=
 =?utf-8?B?OUJNeitySGZGV0QwTDg4WkxBNjRzY1k4TWcrNEhmY0tPNzJuYlg2ZkhtNThp?=
 =?utf-8?B?S3hIcGZWQ3F6a1NpVVVub3U5QzJlU01Bc1VjZUVCN1Z4QXUyNm4xajdKSWVm?=
 =?utf-8?B?WDFYa0NOV3o4Nk03SDJOZEMxeExoTmNlMXhCSTR5VWF2OHE0UU1MYmJ3MGNp?=
 =?utf-8?B?SVhTVy9WZnVNaWIrc1h6VHhub0JkajRodk9YcWtieUJTbUZ4VHgzaWV3U2JR?=
 =?utf-8?B?MVRnd2Rud0ZBRFpyaEZMUjEzdG9ncUdMcUtoOUdUaXZXUC81VEZ3ZmlqSVpv?=
 =?utf-8?B?bDIvNlpYWS84Uzl0d1l5cldjdmp0cEdQdFRTa0RMZEo4TFB2K0VSWndjUGFG?=
 =?utf-8?B?REp2NUsvWGNHVXlFbmVZelBrZ1BzN2tzUkhlNTNJbzYveG1aRmVkcDlkbElI?=
 =?utf-8?B?YW9kRGFDUWlhbmQ0UEYzNlFFSERldityY0E0Rm1HTWlqT2dhQyszSWdTb0Qv?=
 =?utf-8?B?N1FUb0xxbHRER3JsRmhpTktUUlpkblhmWG9rQmdxWjRqT2h3M285eTZ5MW9X?=
 =?utf-8?B?c2Z2K0F1aHd3STFuRE9hbUpVd1o3cCsrN1JGOGt3M3hyRFFWZm9qb0lmWFNl?=
 =?utf-8?B?bVJpaVRLOGkxUEw4N2xRRm12eXB1Z1lYOWZZa1ZKT0dwbEwveGM5S1YxNGZ3?=
 =?utf-8?B?VmFsQ1E5YmhnRm9QT2lWeGRrTktLVUp6RFBqUUF0S1ltNnBlRGJmQzhISExI?=
 =?utf-8?B?YVI2L2lvaUVQVUx3ZHJGMzRhblFQb3NHa0dON24rTmhoa1dFMUpZWStnb0Np?=
 =?utf-8?B?aExMcDFBYjdWOElvU2YwcDBjM3RhTDE5dEFPKzMwbnY2Z2ZKUWFNUUZSVE1V?=
 =?utf-8?B?d1BnUWpwUUU0VFlPZnhhKzNldHBzNVB0RzdJQnB1bEZJT3JoQW0wK01udVpG?=
 =?utf-8?B?WEw2YjVETE9LZzJBOFlDaHI0anZ6YUJQc3NZN1ZoUFYrd1cvZGtSZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1e3faa-a83f-49da-db25-08deab4ccb85
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:52:25.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zc06U1lKrEnSFF8BcD4+apVl00xicxNu43P8ZYR91aYtiIy4U1KeSFUghmtzirORl57GKWu36saC869NO7j5+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10915
X-Rspamd-Queue-Id: C0D6E4D8382
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60550-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]

Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
ensures proper PHY initialization by verifying that the clock lane and
all active data lanes have entered the stop state before proceeding with
further operations.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Removes redundant register availability check
- Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
  readl_poll_timeout() with direct register address
- Fixes stopstate condition logic
- Check PHY stopstate after sensor enable instead of before to ensure
  correct timing.
- Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
  balance performance and responsiveness.
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 92178a3dec5d..8a34aec550ad 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -35,6 +36,8 @@
 #define DW_REG_EXIST		BIT(31)
 #define DW_REG(x)		(DW_REG_EXIST | (x))
 
+#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
+
 #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
 
 #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
@@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
 	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
 	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
+	DW_MIPI_CSI2RX_PHY_STOPSTATE,
 	DW_MIPI_CSI2RX_IPI_DATATYPE,
 	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
 	DW_MIPI_CSI2RX_IPI_MODE,
@@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
 	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
 	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
+	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
 };
 
 struct dw_mipi_csi2rx_format {
@@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
 	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
 	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
 	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
 	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
@@ -556,10 +562,19 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err_csi_stop;
 
+	if (!csi2->enabled_streams &&
+	    csi2->drvdata->wait_for_phy_stopstate) {
+		ret = csi2->drvdata->wait_for_phy_stopstate(csi2);
+		if (ret)
+			goto err_disable_streams;
+	}
+
 	csi2->enabled_streams |= streams_mask;
 
 	return 0;
 
+err_disable_streams:
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
 err_csi_stop:
 	/* Stop CSI hardware if no streams are enabled */
 	if (!csi2->enabled_streams)
@@ -871,11 +886,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
 }
 
+static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct device *dev = csi2->dev;
+	u32 stopstate_mask;
+	u32 val;
+	int ret;
+
+	stopstate_mask = DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - 1, 0);
+
+	ret = read_poll_timeout(dw_mipi_csi2rx_read, val,
+				(val & stopstate_mask) == stopstate_mask,
+				 10, 1000, true,
+				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
+	if (ret)
+		dev_err(dev, "lanes are not in stop state: %#x, expected %#x\n",
+			val, stopstate_mask);
+
+	return ret;
+}
+
 static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.regs = imx93_regs,
 	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
 	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
 	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {

-- 
2.34.1


