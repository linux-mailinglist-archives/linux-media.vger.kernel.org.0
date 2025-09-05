Return-Path: <linux-media+bounces-41798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15F3B44E64
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771F43B2A37
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E10B2D7DE9;
	Fri,  5 Sep 2025 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mySdHkKY"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013038.outbound.protection.outlook.com [52.101.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F43F2D7380;
	Fri,  5 Sep 2025 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055393; cv=fail; b=igVVYIGcqClpJb5HZFBnvfFrdGfG2lF5f79WpvD9LSPz51i2hrAzePbpAM5Xw/L5MZCZvhJLqyoUe9igsuSzFeFhoYBpkbYuiIt9rqESiABX24bao4yaJ31H2x8T6riVVOfyJ8KifL4W/DDmsL4ALWKCAdYxNGHGHk/n1fJxViY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055393; c=relaxed/simple;
	bh=y8jYKdvvsEpVr6gl5/p8M/ap+22rj5s7BqOk4OwuQvE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iU2vbYZlcMO8EB+YTzQCM++LF4fb9lJIDAKp5/ZZSAHysiQKJxJ7jAWlaeL3ohB/FbHt8hEcv3uvz9+Hhi4jYdY0kgso01/EFx9zpw/YkXWWmrFUrrVcOJAY70L0j0YxV4RNxJleKlqSDvSK2ueZS63ZO5tRiDS1lf+8CX1Kgms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mySdHkKY; arc=fail smtp.client-ip=52.101.72.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzUa/QPFgjhbbP1rjtXpVNmVMnlpHEslds1PU/Rw7eH7P9siPAYWUrYRa1M7M2cLUEsnWW1lQyNmuvgUHbMH5zlAx5WoRrn8BqNKQktWytmEm9+UKDA9ZVwUUX5LrRJSeqgESyBF2gBphCoGAo7QfxvOn4t9hQiiqyfcchd8+X5xNpQWWU9v9STvsljr96DIP2jDEDR9zuZr9a23DN2ikpXHBRzymb4i5AkHVJRSsrlz3I5CJaK6PZEpwWyDZW2t/4wxw4KXCBYb8jvEa9AjHb1LW4iX8vC//dCYll+MMOTst7PaCUzaKNeMoKZQsyfdC7gcbvfsyyNyjlx3nSozbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueSf1bE7vKs9BWwH6h1oq6ulhf8474p4tPKfV8f5yBg=;
 b=Uiv3glCyiSLChW+JD+obOfvks7Lzh1+zcjJGOz3c6THkZBsLzXFpNS/ByRAAhwo6DDVJibxiqsiPy/LleYXaalGwhmD/x6JFHWbS9nYV5bTd83ZdRE5wtEoaiVxgIA8DgDVtpvsG5Mv8PW4j7M0y7WjuzkFl11dw3OWfSNgI8Xb6FsPZNo1141H13fMYMnqECmUEpeEVYr3eUhn8iGwdOTSYTyVoXbJ+GwslkMrEz7zpnH/1fktSBphTufgmJlXWgNOzQKgofBvWrPO1h/a5smq2xIliIhLdXUQC3JarfEkonRR8oYqXD2R9+yCgf4KPdlCDqBVR2KPo3qtVsRW1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueSf1bE7vKs9BWwH6h1oq6ulhf8474p4tPKfV8f5yBg=;
 b=mySdHkKYq8EmvUURrdIyz1EgkelPyVC5aAk/mDr8MoXVY4IUl15miFGG5ASjJYHp50R0xniJ5avPEuMiOfiKIGaFov3KX1KJxV4q5t3KDRFPvxQCbafJMozZeLbl+YZYyqodJ67c0VU8IwHmiXxHQGLtkkvIvk2Ke0zjOcqEIaCOdemwbvoI3QgV78kJSDb9sxUXQU7UQKp57os6sTiliDaibrAqng3YSr3jrWdOkWBWG0GJPLOvn/n+9wzvzkVCB+ctDelBtQ/JkInlEgv+0slIlUmWRHqp3Thbx7HcMlyG6fLC962Pdvp0wF7L6g0kZFUh0WoPwuogDj/vHaicnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:56:28 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:56:28 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 05 Sep 2025 14:55:59 +0800
Subject: [PATCH v2 2/5] media: nxp: imx8-isi: Simplify code by using helper
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-isi_imx93-v2-2-37db5f768c57@nxp.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
In-Reply-To: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757055383; l=1611;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=y8jYKdvvsEpVr6gl5/p8M/ap+22rj5s7BqOk4OwuQvE=;
 b=NRq6Mb96D4p6xZCfpTGea0ZeAZfYnhwy/40oRFX+EgapOV1M1p5C4Smg4+/eSLgaAIYpfBKSk
 VfgoA/JWwrDBeZkIqtuGqwSBuSof6rrAP4WPwO/iI23HS2ff1muFonZ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 18df2a0d-8b6b-4d4f-9b54-08ddec495647
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dTI0OWcyaHpVeU0yRERvWXhmb1hONWJFbmhta2cxSThISHV4ZFBqTzhDbXF2?=
 =?utf-8?B?akU3bkR2SFpWcDhVYll4M2pDNWg2YjZYekczUW9TVnlrNlppVWV0UjM1TUl1?=
 =?utf-8?B?QTRvbC9nU2dYZ1N6NlZXb08xYjQvNk05SnJxQnYwdmtmeklDWnlpUUYrbVpJ?=
 =?utf-8?B?VXFiTUpCMzc1Vlo4dkxaV0puMlpPL2RLdXQyZ1BGK3hVVTJWT0Uva1BKUUN0?=
 =?utf-8?B?ajQyZkx2UDM2dkx6dzdvcis0dXNXN01LWnNEQStpZ09rVlJpbW9aQWdVWFQ2?=
 =?utf-8?B?SUs4N3AvZHl6YnNqZUdBcERDNHptcTV2RVF2U3k2NnFvZWRYVzhJRWhBZSsw?=
 =?utf-8?B?UEJ6WDFUU3RlNXJpMGN0d3k4ZkVaQkNqMEIwd25POVFqMWR0bmRqRGNLWlNZ?=
 =?utf-8?B?K0pnZkV3WWNtcUNjdmcxaGdMeUJYbkVNOFVtZ2RMdGxxVXZ2M3NiUk95REYz?=
 =?utf-8?B?Y3JvRUhXTDhSM2RldUFhcU4ycDhwR3VxV2NZSU1tYXNVMWpESWFVa1ArOGJJ?=
 =?utf-8?B?S2NkMm5iMklSUkpNYTMzaWtLaUc4Y0lCQWlWMFV3b0srZUYvQ0JKUGtBMjFC?=
 =?utf-8?B?OTlseEl4QWZmRmlnUWhrRFN5dXNHaHZaSzdoWmNGZ002bExIV1VHandjT0ZB?=
 =?utf-8?B?VzhaMFljWjkxZEtYYytqTFZsWDd4M0xObnd3blZrdkVIYUgwaEgyRHlvUVkz?=
 =?utf-8?B?WGM0ZzVBT1Y2TVRacTg1SHRtVVdyVmZFZlEyekh3ME8vdDNBOWt0SnNBcGZ6?=
 =?utf-8?B?K01sTmV0SWVtTldIMXJkVmwvWVdTVHBYYUlRM09pemZHTEZUcEEvekcvTHli?=
 =?utf-8?B?VGI2cE1vM1RmNFlFS0sxRVppT3V4SGlPTkxOL2xBU01BR3piS1F2dGFnQnZm?=
 =?utf-8?B?YTYzd0RDMzhzN2JvUllSSU4xUkNwMUF5aWZnbW96a0JySlFRL3NyL0g0T2Fm?=
 =?utf-8?B?czFmOU5tRm1PYzhqbHVKV09BQmJNTzY4MkljYWdwYjJKQXhWSEg5QUNiN2Zm?=
 =?utf-8?B?Y3d1TXFjVFYyc2RSYUltSEdHeVAzdlFPMG1ueVBxKzI1US92OGpVYVcvS0dn?=
 =?utf-8?B?dVRvUkdLdFRJWlluamg3eE84QVliWFlmNFIrcXhLdW5jUlIvVDFPaWRGeWJN?=
 =?utf-8?B?RnRRU1ZIN2FYTHVLbWwxUk83NjM5U1QzVmx3bVpBYnlLRzNudjlLYXc1dGNj?=
 =?utf-8?B?LzFoVGZ5RTRXY0V6MzhUWXdLMWNwSkRFTkNuWFNnV3FnU2kvMHFRaDU2bG01?=
 =?utf-8?B?dVIyalYvRzZWYzZmVmtaQWFBa2hSb2p6UE5ka0ZDczFTY1JrN1pURUlkRGgy?=
 =?utf-8?B?clRQN3ZMQmdEQlpvRGYrQ3ZiMmtuWG83MEY4QzNJazJ0T1FHQVpFaHJYeGhB?=
 =?utf-8?B?bXBkTTFmNHIzRGJORDlqOHBDeWczL01iY0RkUEJrTk9mdUI5Z1JDcWlNQmJt?=
 =?utf-8?B?cW50bzM0eEQzNkxzR285WDc1blpYYWNKYk1RTXJlTHA4MmdtRG51Y0xHd1Q0?=
 =?utf-8?B?R0dBa21mMDB0WHZxUDZ6eURVR1B2WFZmRDVvSUJKOFFVKzljWVFzZ0RIeUp1?=
 =?utf-8?B?Y1ZnbitDeGpodVdja2RUQXNrbGJoeFFkdHRscEg1Rml1cUJlc2t0QWlsZzdp?=
 =?utf-8?B?YTZMc1dOaDhxS0RBQllQYnVyd3FUUjlMdHJUdFM1Vkt4NG9zOFpZZlk5RjJq?=
 =?utf-8?B?b3MzbS80Tk9CbkZYdVVTUU5YUC9qUUc5QkpPbXRiUDlQWVZ6d3dvUHM1SDY2?=
 =?utf-8?B?RlRtNGllNU9lYjdNc0lOYzA3T2VoTVRLVU91bkgxYVFnSlZ3V2U1NjJSQVQw?=
 =?utf-8?B?U3dEWTlmbFMwSUlmeXJKdlFkZEdVRjd6UnZlV3NMa09hNUtiUEVjOUtjRm02?=
 =?utf-8?B?NXJjRlFCRXlicC8xc0E5NGo3eEhBRnVWbkdHKzQ3Z0hNUnR5NXJwd0NsMXNM?=
 =?utf-8?B?T0kyR1BUUy9KbFBGamZtd3JUL3JVLzF5WDVUYmFOb0YwdkRLRVZUOUdPZk1V?=
 =?utf-8?Q?QM9Hcd8CJqUmgqXeSDo8vTRwoMn8gw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TVBhclhuZmkwNkZPRndKQ0sxdjVFMzJMNzQ2dmRkVklQelVTUEduRGZFOTV2?=
 =?utf-8?B?K2piY1o1bThDUUcxeU5wL1JYSzFkc2lNMDdMdEJ5Z3owK05OK1NzQmxDa1cw?=
 =?utf-8?B?citFNXZjQTFTVlFQN1ZFMXVieEFiMDd1Z1JXZTd6aEpxV2VGLzJzNUpUSGZR?=
 =?utf-8?B?U0hjZFYzOEJDekhsYWMwK1ZqUE8xR2NqSno1TFBDVGNMMXhlMUZjNjdtb1Bw?=
 =?utf-8?B?MnlTbHIrV2M2T3dDRGZqMmllVnl4ajd0S0gxMEo2WThkZ0RRbmZDWU9DNjFO?=
 =?utf-8?B?SXAyVTVrcGZUVm12MmNXb0N1ckhpMTd0Uy9qT3dVWlVRdW5GamNPeXRtU3RP?=
 =?utf-8?B?bENQUWJxSUZWbnBQU3F0OExWb3o4aGRpM3lxY0duRkdFTTlvaFU4bjZNVndH?=
 =?utf-8?B?ZVd3MWQ0TU5QOEN4QVphOVlIYURCemxyc2ZQTy9kYVg2YkVKdHdkVmtHVkJN?=
 =?utf-8?B?MGo1M1NOUEVlV01QR095QTNlV0F0T0Y5d3VQMGdlbWs2clVkeENITyt1UjJo?=
 =?utf-8?B?bmRkRGNGdG1WOGxWaXlHNHMwVFp5TXowNHBIeXZ2aUNTMmFJQkkrUjZIc3hX?=
 =?utf-8?B?anpmZXhSVHI1S295aFhvZFRLWkhLVnRSNmE5ZEtMM2xoRjVIcWZnS21Gbkdk?=
 =?utf-8?B?YUxnbCtoQ2d2eHFudVh0TmR6K2xEMzljVDhJQjg4WkRNUEI1RXJOdHBVcEZU?=
 =?utf-8?B?NXF3bTVQdUZGN0pRSTVaNW4vTWhQZ3JnNkVmWm93eG42R204aEpXS0Z1VHB3?=
 =?utf-8?B?dWlSekJpRDFBUjYzR3ZQZ3BpbHRITHBIMkEzc2xVYXg5V2xPbVp5VHRXVHFz?=
 =?utf-8?B?eHlaMkN3ZHRwNHRjRkF0OHBGMzBGTFBYZzZ2TUpkYjZQR1RiTk16OHFuU1Yv?=
 =?utf-8?B?VVdyVXhnLzNVQkxYaEVaSDdRekV3UTZ2c0twUE00Sm1NSHJ6MnZGcjJoTGNE?=
 =?utf-8?B?c0IvTTNZd2JIWDlnd0JSK0ZzSWJva3huQThKc25Yb0oyWjR6OFBseFl4MWE5?=
 =?utf-8?B?NXArblBLdWs0azFETE9rODRKZEZaaTRKNHYyM2xCN0xsTjVIei84TFFKZHVh?=
 =?utf-8?B?TWJDTnRsNTBzbFlycE1DUHQxdHc2QXJZck50M21vNDB6ZVhRVFVVV2NaWmRL?=
 =?utf-8?B?YmFmWUR2cmYxSHV5cy9DYmZ6T2NaMFVUSVl3VkpSUWdhOGZVaExxRHhQcVhF?=
 =?utf-8?B?Q2VOR0lOaWdoYmVKeTVaYVNqdDRsSnJYRUhISXpXZEordDJydVFqTTFjTSto?=
 =?utf-8?B?VElaZityV2YrZTVoK2doTTFqWHdObjQvMDFRMlhxL3d3cncwSUdCRmIyQ1pO?=
 =?utf-8?B?K3BudFlmRU9BQnNJQ0x0bEdkeTlFYnk4MG5uVG5YZ2xCMVZVSEEyU0RtcEk2?=
 =?utf-8?B?S0kxY3phNXN0RGYrdHQ0b2kvWk5WakNKMG5BTFh0Zk9XMFVXaGNsSUFOUjFq?=
 =?utf-8?B?bStYMVBweDBDK2IvRjE3Mk0wNkJ3VVhYWndVbWo0Ujhud1owVnFnY0grRDZX?=
 =?utf-8?B?MVpnK0ZiRDlPcWVhU2F4dXQ1RTNwK05MMS9UYzF2dUZISkUwanYxQkxUQTln?=
 =?utf-8?B?eWU5MnZOOWRKUDZJc2ZDYUlXRGVBdXU1L0E1eVNKS0xhbWdZem1PbHRFTVQv?=
 =?utf-8?B?RFltSEl4S1AxR0t5dUkvcFBxdEp6UTZKUkxJTTJlaHllSi9hWlRZSDlYUXRT?=
 =?utf-8?B?aTZVWjE2RUN0RnRpbVQyY1RQdFQ4Q3pRc2JpMFZCNHoyd1RDZSt3aGFvaGhj?=
 =?utf-8?B?MVRqck1kazhPeVRMZll3ZUE4dkJjNTQ2QWI3YnozMGpzamlyYmRpN0lZWk90?=
 =?utf-8?B?akdlSCs4NHZtWktYcW04ZW5abVJRbUJFV3MxWnBja0hYVTdLYk1mNHlaUlkz?=
 =?utf-8?B?SUlDZStPd2xwdTZpS3lENlVUSEJwUVdZcHg4b0hPVEgxUnlMWTc2TTRPNVBO?=
 =?utf-8?B?V1lFVnBXYnlISjJaUENrclVhWFZZSVdUVlRibkUrZnpaMUc2UTJTRi8xZktL?=
 =?utf-8?B?QVlpUnRpUGtJbFJ5dFI5U2hUOXgwVERzOHBKQVlxaDYxQjdlZTY3UDdSaWhw?=
 =?utf-8?B?OTdyWHYvYzR2SzFRUGpsaVR6VFJ5SWpBRGZrVlkwKysxT3Q1cTQ1TmRzRnpP?=
 =?utf-8?Q?+rUZ4VbOp9H9Jpioatn4iDOLK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18df2a0d-8b6b-4d4f-9b54-08ddec495647
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:56:28.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4rIFYQ9qmzZxb8wn/TRSiMafhYEgpfpLj4INMuYMjEU+mvr3NoVYBIQktiaJwkgSwyDGpxagLymjzoOBarZRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

Simplify code by using helper macro FIELD_PREP() and GENMASK().

No functions changed.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index f69c3b5d478209c083738477edf380e3f280c471..2f5e7299b537d612fb1fe6688c1b75bfd2d6049b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -3,6 +3,8 @@
  * Copyright 2019-2023 NXP
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/regmap.h>
 
 #include <media/mipi-csi2.h>
@@ -16,8 +18,7 @@
 #define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
 
 #define GASKET_CTRL				0x0000
-#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
-#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
+#define GASKET_CTRL_DATA_TYPE(dt)		FIELD_PREP(GENMASK(13, 8), (dt))
 #define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
 #define GASKET_CTRL_ENABLE			BIT(0)
 
@@ -58,7 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
  */
 
 #define DISP_MIX_CAMERA_MUX                     0x30
-#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
+#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
 #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
 
 static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,

-- 
2.34.1


