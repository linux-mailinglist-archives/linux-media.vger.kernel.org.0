Return-Path: <linux-media+bounces-25504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636EA244C4
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56703A492F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1561F55E8;
	Fri, 31 Jan 2025 21:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DFW+aw5E"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428251F5439;
	Fri, 31 Jan 2025 21:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359280; cv=fail; b=X1pvvQUuei3LWHGeC9KwFZtuaa6JKQYkWT/9q9OlfeyTGPuwRlWa5cxNRKrMOp0z0cn04HTaKVALJHH3oONzcTj6c75Y8fPkkKwlZSYkNdZFJmep0qg+EH7Uc1pi+d7TLcXLwGvXWL9JCKMw+EzyrShbpDFHzPNWCRJI4HiYn68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359280; c=relaxed/simple;
	bh=yZxMDMcZ0fNNRbJ78kOjbG5arrBzpUHNSu7I3DYJTR8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fNBo+4d9mgjOfJ3NnO3s7bQeC/kgjm1FgXl+jv61eVl5FcHSxez4QORKMYIWOOcgSJKvDQU+pDzTwP2LX/2kcDv24AevU00ao0U7A1NTa6foMQm9cWO9HWiLy9GgmWfXFc51zINECzUhX1GnpJ/+RRqXQ4bFvxmlkH6mwmDKxVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DFW+aw5E; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlL9aTymSRtHYrGqFsxrxx1DZoYfCfYZGB+K+Ps5lNbaWVHwn+TiskHvgC3PZ73D8YSZaxat1bAgqOinm74OgeoqlKuq4TK+vVSNFNp7BTQyKn2GLtO4lA1Nzlyh6Hj6j/vyFz+zTfwr5R0BWpOQu17rpb7jJSR9CFS4j83kAKtpmVlXcTguUc6IB6IDtp8u8ok5lq/a18H8QEH+1Jsh4BZHa7wolGwemCwPGnsQ5ecW8Vp9VRvvRb2uPY2dSfxGFGEJm13W9GWtXwfZsPY9XPqQpEEI4RgBEmNf3GHia786+BPsi3uN8U+eaK/i7ltv3vnRx4qnqCPJd67C5sW1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAMxKSY1QWFnn/O4OwL0ajYy84VdJKjkizOJjoyo20E=;
 b=gfRl392Ynn0tdpO8kbd/db0isOES1OKDCSyV3phGSOVMw2zsgSfhAM5BWxCnf2wl1yWqDsitdTLcjrnQG6wTJkOM6kjWAGqay075CTzXh7xSGErFjA3gENNtes42kYAS65p2+Qw24P2xC35Z97YR5ccTUwa0iNzOxo/GQZL/r6jXibTneRIkbVmLCoLN6aKD+A4E2CCw98t5svbKnEhKqstX6D5wBjfviUpVSR7Yoen3DfQg8xNWncHrKT+5Rg5/elvSl/nXGs/ow6LbGbQc1o99bPve+NSt0suICNffZq10jm8+FifOlgkVHNSOMNb2WpsNASW+XZeOchaheJYN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAMxKSY1QWFnn/O4OwL0ajYy84VdJKjkizOJjoyo20E=;
 b=DFW+aw5EmuqIQbrJ4DaNyD6sQLqKhxxclFRtP/DvNTSov0NyPZh+LLmbAtnYM+7s+3NVeolsPj7EgTvsKUU2+k2WHRaLRL/Zkqnrn0aL1NlJISV9bS6tNFT0ARXOM4wyy0xxYDEZwgoHbhljgiuPw2bPYWKbpHYzuZ9/rs+Qr9ZFW0Shxpq/Ib42ZktSTPHo2pagTFnVzc4pxfx1ptKTqftF9UUE0FjO4C1I796j7qKVFpkfWslq0I3ytGKTpMyzE+dlZnqI969BlGeKzGeGRoxuXcBkE8eDI/PbhtoS9bx7a4SwLu+FW531CEWcTqTIjhpWp43SwkMpDdxF3EjMlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:51 -0500
Subject: [PATCH 06/14] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-6-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=2036;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yZxMDMcZ0fNNRbJ78kOjbG5arrBzpUHNSu7I3DYJTR8=;
 b=JPvaKAiuQB+KbLat4HOJlt56XhTPiZFpwWEUJSEvvLOrQXj08wYR5TMUPy2LohQRm3EPN+KC9
 8RjpLz7lOtaCnZpD9fwZBTU0PTWcHPPkO7CVa0r2/ODxKymHijrBkOw
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
X-MS-Office365-Filtering-Correlation-Id: 7393559d-b014-4bc1-cf6b-08dd423f0eba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?U2owREtZU0ZnRW5xNFE5dDhiYVUyNU0vd25KVVp3Zk5xOWdvS0RIdzc4dzJp?=
 =?utf-8?B?NSt6V2hvbTZOTVM5TWkyYVVJNDFFb0Q1VFF2Qy9vMWlpcFNmdUdVeWduTzkz?=
 =?utf-8?B?Wk54T1dXRnhBMDNIcWY0ZmJhSkZVb1lwT2NTaW95ei9qLy8vejA0MXRlS2Vr?=
 =?utf-8?B?ZGwwTG5nR3VCK1dkVkFUK1VYL0lHMzBaRmN3bStpb1NsRndsZHJWOHpWVndv?=
 =?utf-8?B?eiszV0ljMlBFSTJUYTUwOVZ3eVpIZytmN0I0T2hCaURiRUFrd1pxYkpPTFlM?=
 =?utf-8?B?czJ6MTRCa3JMcXJGUDFwYkc5S05ubUx4eWQzcDh6dzJydGpncUdscWhSdjFZ?=
 =?utf-8?B?OWVXQUhEWDRVS2xidzcvL0k5enI2M0JYOThLVmFGQmtSc3A2WFBCSWw3Z1JW?=
 =?utf-8?B?OFZoa1ZkNlcwRHd1cVpyZG5OKzFlZi9rb1RiOXJJbUVhODNDZzNaTy96dFBh?=
 =?utf-8?B?aUlZZnNvZVZmb2JOSlI4K2R2SmRSemxpdHNvb2R6cVN3U3NmWVJMS2FtSHRC?=
 =?utf-8?B?c09DeCttdDBnbnpLTkk3Ym9kR3BiUGRMbmhFZ0h5eWs2TkMvSTJ4SW1lZXc1?=
 =?utf-8?B?OEZrYTNqQ1NsNkVyK2gxdGg4SWN6bnkxS2NXbWNPTEhqSEgrdW9GUVhhWFRO?=
 =?utf-8?B?ak90MzBvc3RyUiszOWY4QllUcndWSXY5RCtzOG1ob3dOdm1Nd1doNUIydFZx?=
 =?utf-8?B?d2F6QzVYV09FQTltOXA1TjN0SEt2N21yd1VQS2VSN0hGUHBPQnBOMlJXOFpu?=
 =?utf-8?B?dmV4dXl4bWUwUTdwelpDdG41cm8yMUVOaVAwWUlPb2N0eXhKZzZEK3VoYU11?=
 =?utf-8?B?ejNja2tjSEpIU1FTNWV1Tk9WNEJXN1M3SUo5dHJsL2pNK0pKRXVpWklmb0ln?=
 =?utf-8?B?NGZicXNzakt1Nmg2bnRvUWNmT2xHZGpQeVVVSE4yMUJSbjFDdHFMVXFoMUNN?=
 =?utf-8?B?UjlDZGRic3VXeXFDR2hxTEN1TWlQYzkxM0ZRaTA4UjRMUUF0MisrSm5iRHB3?=
 =?utf-8?B?cmV1L0s5cE1hck9Za0xUei9ZLy9NWUJXbHJVQ3RmbkVEeXBqMlBzVzFwdDRO?=
 =?utf-8?B?YzJyK0pDUUxqY3Yxai9KNk9TdU9aQkhBaEtYbXBvcFJGckFaUmgrb0lSUkdj?=
 =?utf-8?B?L3pPaHk1Z24vWGhEU0QxT2V4cDJHOWxQWE1RakEwNjBjNG91K293Y1R4aUha?=
 =?utf-8?B?ZGFQd1p2SWhPSTgySGdOcnlnZlRIUjMrMHBnK3RTYUorMmRDVy92Sm5IeThM?=
 =?utf-8?B?NDZCNlk2RnpKQ0lSVGVYRURiL3NweHY4V1VqVGoybEN0ZFJLRVBXUGVLT3VS?=
 =?utf-8?B?TzFlc1A0d2xpZVQ4bC9wQ213Q0RBWmk1ODdGOVhrMENDUGFBWXQ0VFJGRzBJ?=
 =?utf-8?B?Q2NaS0tIUlJhMmFKTE0vMDBjT05iMEVMOEFJa1NOWjJQbGRsUTNIWXFYdXV2?=
 =?utf-8?B?SkJvYU96NXpyQjlDRjh6YUF5bWwyTmdQM3h2SmVyMXBERjhiNXRmMnRYbnU5?=
 =?utf-8?B?NDc4ajhyRGgvQXpXVHR4MHVtWTAzV1RhaHlMb21TZzJCRTBJR1NUTW5TVjVL?=
 =?utf-8?B?a2pGWVNYankyYXJySDZXOVp5THR4KzF3eFRzN2wvL3JvUmlSaFlpb28xR0oy?=
 =?utf-8?B?bWFYbDdCazdaYWhDbjYyODBMblhVQS80SDl0UGxhbGtBQklXTkNuTUQ3MkJK?=
 =?utf-8?B?ME9rbXQ1MjhPVk04bS9NNnBFaWllWHAzNlpnc0VBZmVWeHA3YWF2S2FuVHNm?=
 =?utf-8?B?Zm9KcEhKM3VORnhsQ09MaERodmNua2g5QzlWY3hhKzhPQlJINHRHd0QwN3dQ?=
 =?utf-8?B?MThSYWpheUNIcVViVjJXc044LzVEcS9MeldYbG0xSUFwdHNuQW1SaGxFVEo0?=
 =?utf-8?B?YUc5N3JWK1E0SlljMjBHWGlOVUswcUdPMHIrV1g2cE9WdTdJdW5aZWhaRU5P?=
 =?utf-8?B?T25rRmprNnJSZmhKWkFwRnlIbG5zSHV3enVLSDVNMUc0VCtrTXEvZ0hTUlgy?=
 =?utf-8?B?ZWV3em1oSlZnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RS84MFBYYXAzdmxybTkzT2tub0RmQkZhQ2M2ZHlJNEhDU0MwclRyYzc4UUpp?=
 =?utf-8?B?NGNzMXFBNjRCdW93MGdDVDVBS1dXQ2o5N3JWZHFXTWNNVWI4UEk2UFh5OGw4?=
 =?utf-8?B?bVpLYS9vcHVEMEw3anFJQW9Pc2lzWHFua0M0UXB1RkpCYmNzaW5XeWZweHNu?=
 =?utf-8?B?TEdEQnNmOW1wTVZBNzMrWnlvdko2N3NldUlkelZlTWs4WDdHSUVvVlRKb29z?=
 =?utf-8?B?ZVhmRDJtdEFiMXozV2F0bHBQeUtubytOYWJwMmtEVzJtZlhvRDVhSnZZdGp5?=
 =?utf-8?B?VzNhb1RKekJlQndFWHA1d3B2R3l4U1ZvWlhTZ2pFNnNwQVkwYTFMSW13V2ly?=
 =?utf-8?B?enFZTkk2VjQ1MnVrNCtCclh6OFNaQTFJWndqbDJzVlpOUVZBQnQzZll6YTVu?=
 =?utf-8?B?UFBsMm9DdTNSU3lPZFJjcnBzSTgzVlNnUVRtYndFbkN3NzM1VHd4TEhUM1E3?=
 =?utf-8?B?RjhyRTNPUnZYL2wwWnZiZ1M1S1czRk4wR0lYTmlKZzV0cVVlR1lRN1J2YW1J?=
 =?utf-8?B?UHgzNEt4a3RLUTFKMGJvN0gxL2Z5M0w2TXpGcHlkOHZadExzMDNaSStpOXRm?=
 =?utf-8?B?NWhYQ25QK3BDSkZVTUxVQjRUVEFyczN0WWF1b0xQNit3cFhJQ2JYYjI4bkxF?=
 =?utf-8?B?RjRRZmt5U0RacUdVYld4QlJqSVUrcEg0KzYrZkhIak13eThKUnpkeGtyTmp6?=
 =?utf-8?B?R0VHbHFmZlJyQllMQTMxVktzTXc0dGNveGx4L1huQ0lETWhKVHVsTm53LzdJ?=
 =?utf-8?B?UWhLcTBiMDdrS2VZdS80MFlPMHMxRUJkWTBWOVM3MCtlMWZkbThFWFZWY01J?=
 =?utf-8?B?dGFicENZTUxzZ3YwNWx4S1ExbG44VjdWOHlTV2wyWlAwZ0hFaWZTQlBCUWV6?=
 =?utf-8?B?S1Q0QVFBRng2Y056TGN5V0lUeDVvVTJGcWQ2WG5RaDl1djM1dlBHY0FONkt0?=
 =?utf-8?B?SzlOOTRtaFlBd096ZEx0T1ptRWduTGlQd2xQZERKbkdSTGt2T0ZVRzErZHdK?=
 =?utf-8?B?SWxNSnpFcExrK0x6dTAwZWxjOW8vNFViMHpJOWFZd0hXZjRFSDdFN2dtNitG?=
 =?utf-8?B?NW9xOUFCRzFVVG5waTFPMGtCWVcyY0pXOHEzdE1sRmp5U3B5ZFFVVEo0eEQ4?=
 =?utf-8?B?ZFo4UWR1N1RpTS9wUXN5eUFxdXpHL0VpWkx0aUx3cUFwb3piUUdoTG4wQTJv?=
 =?utf-8?B?a2dsT3JaSEhRMFNWZkxMMW1WSExlTm83YWovMFJkLzhTTkF3cjBRdXppeHV3?=
 =?utf-8?B?VXBURVlKRFY4QjVCYWxmb3ZybURPejdZRHlNT2c2Ukt1OUdBNmRNc2swQkJ3?=
 =?utf-8?B?cTduUlROYUQxaG12Q09tdURlcEhoYVZJNEJ5ZHlmSVFFc2VCY1J6Q09rbHRG?=
 =?utf-8?B?eDBqU2ZpQ1BCcW1UVGdqM3hFRHI5c2xZaHdDdmZqc3NHWE4zbm14NDYvQW1Y?=
 =?utf-8?B?SUFsRHVoUGlHSUFmT2pVRG4zajNaSnVjWTJOa2VuNTgwS3lFOUI3MmVhdWlS?=
 =?utf-8?B?TFdDeWs3VkdjWi80eUZ1RFJqK1IwZkdJcTFxbzNYQks2NCtIaklkOTVDR0Jl?=
 =?utf-8?B?SFhDRGE2YXpoK0s0djArUFkzM3ovQ0NQVlJRNTJpUWJ0bWdSbEgzaVhuSEhF?=
 =?utf-8?B?blg2NmUwTEpwS0duMzFyWCs2Ly9XNUpPVHp0NmE2OEZZeHZZbHpSbzNoVVhz?=
 =?utf-8?B?UmlYdFdrdXY2SmtpOFJYUHpOdzlDenR1dnhmQ3Y3eWhJN2M0MEtqeWpzaWp6?=
 =?utf-8?B?Z0lJcnRTeWsrVm9TS1llNWsxa2JPeVY3RVRMVWQ3WFdhYVBsZGQzTUpRM29w?=
 =?utf-8?B?UGQ0WFZOV3kzN0YyZlZXZjJMWHpQUTIrUkdOZUgzaDdwTnhvN3NhR3ZpYUZj?=
 =?utf-8?B?VmxGMVcvb1pxeFhzTXdIaVUvNllud0tLSW04ejJLd1h2Nk5IOEJhMk5tWHVZ?=
 =?utf-8?B?RjJ0clpTS09sazZTNGo3NVExZEhaSk1BNUozMzJvSi9LcGpkVWd6YXdkWUhR?=
 =?utf-8?B?WVhpV242VUEyRzNGY0ZJcksxZDlDRlR1aDNjd3BxbnZuZ3BmTXg2WG5Nb1Rt?=
 =?utf-8?B?VTVIU2lxc2x6d3lnMnJ2Q1hnMklYTXJRNU9TcStGdVdjOW1KV1FYNUJtL2Vs?=
 =?utf-8?Q?2v66UvzduloNjY/jefSiV/o/D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7393559d-b014-4bc1-cf6b-08dd423f0eba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:35.5111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wndYocNQkDRcO+GJnFClJB4T6ec2+/B3+lDgMq0AwQV0KYF270+C+Zf1QkrhNP4wcPmjNJ+nDTBOrrfUuVrAHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Allow num_sources (drvdata: num_channels) to be greater than num_sink
(drvdata: num_ports + 1).

ISI support stream multiplexing, such as differentiates multiple cameras
from a single 2-lane MIPI input, or duplicates input stream into multiple
outputs. So num_channels may be greater than num_ports at some platform.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..ba5b2d3617a23 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 	 * Create a 1:1 mapping between pixel link inputs and outputs to
 	 * pipelines by default.
 	 */
-	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
+	routes = kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERNEL);
 	if (!routes)
 		return -ENOMEM;
 
-	for (i = 0; i < xbar->num_sources; ++i) {
+	for (i = 0; i < xbar->num_sinks - 1; ++i) {
 		struct v4l2_subdev_route *route = &routes[i];
 
 		route->sink_pad = i;
@@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	routing.num_routes = xbar->num_sources;
+	routing.num_routes = xbar->num_sinks - 1;
 	routing.routes = routes;
 
 	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
@@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 	 * the memory input.
 	 */
 	xbar->num_sinks = isi->pdata->num_ports + 1;
-	xbar->num_sources = isi->pdata->num_ports;
+	xbar->num_sources = isi->pdata->num_channels;
 	num_pads = xbar->num_sinks + xbar->num_sources;
 
 	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
2.34.1


