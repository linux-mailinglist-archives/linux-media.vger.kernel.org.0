Return-Path: <linux-media+bounces-39167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B65AB1F0E5
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401B017566C
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B40128BA88;
	Fri,  8 Aug 2025 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BoJ4tWFm"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013054.outbound.protection.outlook.com [52.101.72.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E80293C59;
	Fri,  8 Aug 2025 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692890; cv=fail; b=EtVyj2OXQlFqSaBAb3/27UDQ14n2He8O56Vq5DrRlKVT0bjJV7WL+nYY4yeH7/mRMM24lzVAWgoCtgvJfGFTgvj3eFWwAqaZd41hAqSFLNVwCCWXV7Ia51lqynSq5Js1JygsBQZrrT1CCTz3Chwkaw3CiJIuMmFhbBtX0MOh6rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692890; c=relaxed/simple;
	bh=BoULEVc2I23WTYELp0mIHfk6O6OkSkEprKcOc5ev0jY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TTJPo3A+sk+se2l76Cn+906Kvk50Pq4fv6aLvgTK1+2+kE0kahliPGzDFP369nPiUp/vygzy1FSd+bmoWMbi5xNDL7bjciMcE/Ytk+sffdL9NO1qG5eqiJZnAgwLVe+wArf6lELo4MOQblw9mQ992BDcQAPZj0VZNmGUCBaFa4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BoJ4tWFm; arc=fail smtp.client-ip=52.101.72.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK7sLp0FuOJ5khUIbmdmprePYR3M1rbKfJIuV7+WvFOPg7hvt72TzzLgi3HDVhLeSs4JAxv68WANFYZLruaPQLBMNROUSIflb0S7Vgoa2sd8rK9eqX1+A6h/yobOhWf3wXWSYoA44L+B/DzZdcQ1yP2nh/YCv1QHBNUFlIDdLJpxbdkzijLXO6xZoG8iTc8YJaichwvf42XwecWPfZTyW4SCL0C040/XGuHzLerifnArJEyIipPlIXofMen9BpU/ZBC61EXMrCiHGCsWJ6nFcjZBk5x3V319DbC2ak7/stQPY8MRmrHpx40uJzS0HgFBZrguVgeJ/Cd2QqYFU9awMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gJwsbOiexhMy6CDHzvPsz5o/xaP6D/Le8KAZo8WXWE=;
 b=e+HPEhoVEjlPzcL2E9Fm4LtOqcKerO/5ZP8bUZI2BUrwS4o+cdT4jD8yzD0kI5haXn29XeNzfAM7mSw2tIUC7Z9iVaidrd9M3Srh4FyzrYmkUF5/1ItSPVyh/K2Tdm+A1K4eA8Kylj26wpKfDUamgNPZU9GIb3/tWWGdiXFc9hNg0adkW16QAalF7X7ObsIvrhydoaGVeIEUa79k1UB2bxxQ/IMidF93W0CL5AaJmIZBuYnXW2WJn+waUvbN3z+3UvkqbzOtHJRSgsuHcDqK2rk3WXBs8PbEczJbL5Ctj6R5yOVdHiY5Jn/dM2f7p4LZHEZhqHKJKiPzkmMUg8RESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gJwsbOiexhMy6CDHzvPsz5o/xaP6D/Le8KAZo8WXWE=;
 b=BoJ4tWFmL9XOEObc9H0XBKKoDyC2YsNnM+kVoHAWDM5AzV+gENBTlvc7NxtUGhXIwyUob3Ixl0gUc9vTjUEPAmQx/JwhcvHBEg91DMWgXzJHOZmwQ/5VqSlFhfPQ6Oe4Pu5jtO2ulxLCKxkos5P+lVZBbEuhbBkx5/W1kJ5Dj7U2L2C0mquvsVQCsmTKfXfgPtM6gHcz+bgKKDgouTP/DIndzgiufCUdssd9vIOw4ru6c02+JKDgWeIoZmC1bLjgz7IS6MGnTLt37HwBMlh3PMlr/Fh7pM3ntSk4mKjJEWiUhGhlPn9DeiAjMM844IPwx5YwsyA1QatzjZLnIXDVgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:18 -0400
Subject: [PATCH v2 15/32] media: staging: media: imx6-mipi-csi2: move
 number pad macro define into imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-15-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=5799;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=BoULEVc2I23WTYELp0mIHfk6O6OkSkEprKcOc5ev0jY=;
 b=+35xYEe+1YGGEhUdf3z3kimjYsZiC7icY2RiKeub6wc4EytCmCPa9jKCZPkd8q+dNtYQAm/Os
 HVMmxWyWBOCBKY7kj1IOBCffUYjyvkbqwv7IXkUCuP7h//RkASQOFxv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e6e173-87c7-4469-474d-08ddd6ccb549
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cXZsQy83NDhFRmE4MzRDb3JQbzNPTnZGcTEzTnFjd0NEeTN2OVBIeHI1NmlL?=
 =?utf-8?B?clNURkZkdDFIQ0pXeS9zQVNJVzFFakI0QW9VZFNKd2ZCUXJsUjhDd21oYi80?=
 =?utf-8?B?T1JVTUJJc3g0SFNza1phYi9aUGJXZlhsYkd2QTZjVHl4bjZjS3RLTEFnVzFU?=
 =?utf-8?B?QVZ0UEFJN2puUlNsQlVXUVIwcmdaTTE1aURKNDEzbzU5RWV0bGZhOE80OHE4?=
 =?utf-8?B?UDRQU3hZWERnRTFNZzNYTlNYV1hORjIzMzh2MStiaFBMbEp4WVBLK01LRkdX?=
 =?utf-8?B?TnVVNzU4R3A4VkFWK2pYUVZsWDUvMERCQ01ab05YbzFOS1NGb3BJUWExS2Zo?=
 =?utf-8?B?bmp6a0w4WUZIK0llU1I1ZmtGYU1sd1JiT3BKdEVla2NwWkgzNGtTcndLMGpS?=
 =?utf-8?B?eHB4eWNnZUYva01rRzNHcGh3RG5aTmtDYm84SE5XcnFCU0o0NUxIZ3ZDRTlt?=
 =?utf-8?B?aTQ4aXNEbGlodkpJODVMS3RBcm1LRCtLTUtrOVdGUXdQR2IyU1p1THpTb1Ur?=
 =?utf-8?B?VHNsRm13MjNxdUlzK2ZBS3l2bjAwb1FST2FMNWc2Z0kwTHpkbEhka25wcU9J?=
 =?utf-8?B?OUdRQjJ6U1p2S2JXWEVRWXpGTm0zSTdYUHpvL3Q5SnlrM0JSelJZUUNxakhV?=
 =?utf-8?B?bjZQYUozMGZMM2NjcG81bkcxWC9lVmszODc3WndsWGZONlJSLzQ1b2Z6ZmxO?=
 =?utf-8?B?cVB4WTAyUUh3M1FzU0FQU0ZzcGtDL1lSbW5YODRMbW1lRkRwa1BEL1dQODd4?=
 =?utf-8?B?bXJ6bG55SUNJYW5MVm9PL0R6Z21MNDhvdHRMVFhTcURPc0hnR0pNeVkyMWlB?=
 =?utf-8?B?U010UnZQOUNLVkJYV1h1M1drd09kM0ZMdlkrb3MxQTZ3QmQycnR0djBXVWlv?=
 =?utf-8?B?VjZQRzVTUGxzdG5aSHVSRi9VRHBQWHRSbVkvY0V6aXVZaGhhTktIZ3hnN25M?=
 =?utf-8?B?S0txblMwNVdENWxYUlAzY1ZoRm9IZ1dxVEQ5NnRQSCtTbkpQQXpBQlp2SU1i?=
 =?utf-8?B?dVRlYUZmZnBMMEZQcXpxVDJNVzBBK3V5a3lJa3hPTDM4R0p6WDYyZVB1NkJS?=
 =?utf-8?B?VkhSMWI3bjJrODBXNDVMOTFJRE4wbU9FODZ1YVpTdG5YK0Q2RFQ2QW9BRDRP?=
 =?utf-8?B?V1dCcjFRTC9pYi9FNkQ4b29namU3UE41MFd4WTBjMit6M0x1SjBlcjI5T3Vn?=
 =?utf-8?B?VDFXYWxSTHF4VWJyMVg5V0xCa2tGeE1JVGFlV1J0U28rMitDcm4yK2E2bmNQ?=
 =?utf-8?B?a0JDWnFkc203UG9uL1BGSy9mSHVETkg4R2d1Q2hZUEJWampyVk82a3ZUeExa?=
 =?utf-8?B?RENzbklNbXFqMkVsTGU1K0VLdG43VENNazMzL2pXdUc5NXJhWmJyQUJJMkdj?=
 =?utf-8?B?ZE9rL2RRaFFtNnRzeXBybG9OYXNzZGFRTDE3ZWJra1NVVFliaFpJMnRKVDhN?=
 =?utf-8?B?c2RLRTJLUittWjdNTkQ2eEdwekdIaG02eDFjUnNsVTlkcFNhczA1ZUtVcjR3?=
 =?utf-8?B?YkpWM0dnUVdRRnNEVi9lbXM3VW5MTnZFaFhWWmQvVWVsdk15YVZZcVk1N20x?=
 =?utf-8?B?Yk5wRmhERkFCa1didHJLRUFBSk9VelBJcHR6NzRkaFEzN0xqYytuUWYyaVg2?=
 =?utf-8?B?TjhLbk02Y1NVcHNnN3p5THJDRWQwWlVOSXNTKy9hWVhMNTN1MHRETkVKZzZD?=
 =?utf-8?B?OURiVUdMNDU0Z3hEYzFzU1h6U25QbXh4N3lWRVdxM0hMM3Jhd083d0tTQTBH?=
 =?utf-8?B?b21iNVFiMlh3dW1BbkgzaXZJV0V6ditPOC91aVl4M0NFeXdDR0ZtTmFKZGo1?=
 =?utf-8?B?OWFYbzU0WEJPOTlxbDVGT2U5K1hGeXFnbjNIc2JNOWJabHNIbTk5ZGh3RTNa?=
 =?utf-8?B?U1NkQjNqUVRyMjBFYlNpMzZjcjA2NmxlWTBCSXE5cEF4a2JnK25xVk1lZm5u?=
 =?utf-8?B?Qmp0VDF6clZaZXRCOFd2aE9ibmxrS2lFL2VTNE41ZHJ3VFowb1Q1RUorZVBO?=
 =?utf-8?Q?nW6T6gvnGjl3eqjRuls4aDfrWdaOl8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TG1jcEljTjA0VlNmaXI3aFVTSTJnVk1VdGZmUEdveTFMOWNPNjg3elJuWG9r?=
 =?utf-8?B?L0RnZTI0eEM0eVF4bWVNZm54YmpwclZia1JRbFcrQjlwOTRSTE5aV0M1a21K?=
 =?utf-8?B?RFNtRHpBbWdPKzJUYzFtU0FLeUducmNmRDRxTThqYUJHRkErVXNhdmlMdTVi?=
 =?utf-8?B?SE5VMmcrWlEwR0JyQngweU9aNnFPVDJFVjdjcGw2bllZTVg0R3ZtUTA2dWpI?=
 =?utf-8?B?TG5SZlkxWVRGT29pNnJqNklySldUUGZKZlJxbXphRzJ1UklGdnB5dC9YYXAv?=
 =?utf-8?B?YUFtNFRLWmFjS3Z4Y0xuTGNRU1dJZHRRT244dHVkU2dDQTh2Y1BnNXNZaXlZ?=
 =?utf-8?B?dXpCL01wYjBmZ0NMM1Btc21MODVpT0c2Unk3ZDlTRjlGU2RXcDdoaDNNWHIw?=
 =?utf-8?B?cXBaMTZPeDdnT2ZiYnM0Z1YwRWhzOEY3bVlmd2U3ekVxbmRFc1VvNHpvN3Yx?=
 =?utf-8?B?aUU4U0FzSE1aQTRyMFNpQmRkUU5sUllTV3F6NzE3WmdZT1k5T0ZkMVg4ZlZM?=
 =?utf-8?B?dm92SU5Kd054a3Q3WWpzaHY4dmdPZzlnRXFhcWxUeEZYMFpHTXM1WTR1UTBF?=
 =?utf-8?B?VU5RNkJQMXZCUjEvZkQ2Z2FZR1lDbHNZWGVpQWNzMnlsaWpPMmtDeTRJNExY?=
 =?utf-8?B?bG5BUWNSUms0YlZORHNCalhtRndrckRZNTIzcy85UjJRbEowUGxVN2Q0Skpn?=
 =?utf-8?B?VHQvUm05N2dHUGNmcUJJakw3eGI1bk1GQURjeUF1WUlPNDJIMG1XU2gzR2hK?=
 =?utf-8?B?L0tYZ2k3YkY1cFBKNTdBNm14d1dWV0FJMTJJSDIwVmFETTFDSDBYdCs3RXp0?=
 =?utf-8?B?SkNQWWFBS0g3QnFESlJZZGpxdHBvNWdudHdEU095N2svYUc3THo3Q1VnVFhu?=
 =?utf-8?B?cGFFZmtWRkE2eWZjc21ROU1QNWwrME5QbnhDeG01dXd4a2w2Vjd3TFFKSXVx?=
 =?utf-8?B?Q2l4QWEwVmsySnA5OUx4UFlEd2tTcTFnQmppS3hRdStQSDBobmJLR3I2bmts?=
 =?utf-8?B?dS9udHN4dHNEc3lVYndTODhoLzBWZUxHVjdVOUZhNVNhVlEzME1Kc2l1aXI5?=
 =?utf-8?B?czlmTGpFRS9ncW5HRzA0c2FVeSt2VEIvUDAvbG14TmpIN1JWRW1wWm5nakV3?=
 =?utf-8?B?U2dXbG9JN0g0Szd3MTJXRUpmL2EweFBnTlVhZ3FxM1RTK0NRQVJvaXd0bXhv?=
 =?utf-8?B?WTVENUVoWDEvZUlqWXpjMWk3NTRzbDZoV2k3RTBScGdoSmtjOU1zbjlIYjNq?=
 =?utf-8?B?bVhRVTdIaGlJK29ObnJNaWx1OFdiVmI2L01NVmRScWUrRkxyN08wODBEU0U1?=
 =?utf-8?B?cU51NjhuZXF4dzVzOEZYQzR3WXpoLzVOWUprTHlkVjBYZTlXSXNOT1RrWUhW?=
 =?utf-8?B?R1FySXg4SnY4bWtFakp5SUtQRDFOY2Z0bVlHUmdGRVFjd2RrdEdzNmdOUEpG?=
 =?utf-8?B?UnJqUlViY3cwMVgyYjQ4VDVyaEYxTzk5dG51VFdjWU9mY3VPdEovVGFkT1hz?=
 =?utf-8?B?cFFwancxWkRmSEdyT0RMMlM5QW96b013Z2k2UlZpQWNUWHora2h3UllseUxl?=
 =?utf-8?B?aWJZVEtjZHlvbjVNa092RUlXZUFaYmJ4cFVsMmhsZ3lxUnR4NDNnUG5DZjRV?=
 =?utf-8?B?VXVuclgwYm5WN0QrZzdRNE0yNkRyMHMyRzNKVVRxdkdESWM5M2w5bkJkRFdi?=
 =?utf-8?B?MmNlZEJYWHdlNHBiUE9UN1U1aTk3UTRPQ1kxOFRGNy92WVEwM2lGQU5BcUE2?=
 =?utf-8?B?Zm4xbXQvemRyOE5GNGFSYzFpSTgwNGxreU1YVHVJRTZwMGs4S25tZFlHbmw1?=
 =?utf-8?B?alpmMjN5WjhuMnZ4VzVRRkNUNEZRMllNUHRRMHdacHlCUWh3RkFRa2VObE1W?=
 =?utf-8?B?RFM4ZnVGZDNyT0F2SGJpRzdOM3A3WStyR2M1NDhKWlZPdktOVDVsWEZGNjNH?=
 =?utf-8?B?aTdrMWNPWTAzYUdhT043emJHRldmUUIvMTIwZGR4aFZoMGJVQXliVWpyZXE0?=
 =?utf-8?B?R21ORFluUXp3K0x3VVUwVFl4dWtGSUxaZVRRY0NSWEtEckt3M1o3VWJFMDRh?=
 =?utf-8?B?V2ZyL2tjVGl5amNoQTlOQVVXcjQvSzZQY2JSc1ViUFZEQVM1eXlJS29IRWRs?=
 =?utf-8?Q?uBGrlSLskVjzjNzsBQpQfxumi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e6e173-87c7-4469-474d-08ddd6ccb549
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:26.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8hRZyj1GFUDdfKAoLO1U3lNETANNCpKR/PTMKwyvsWlXgXJRL15L0Ere1Us6o1/4M70So2qZzVqntpjZWgOrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Move number of pad macro to imx6-csi2.c. The number of pads is platform
related feature.

This version just support maximum 32 pads.

Prepare to create common library for dw MIPI CSI2 controller.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 12 ++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 27 ++++++++++++++++++---------
 include/media/dw-mipi-csi2.h               | 21 +++++++++------------
 3 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index b7ea710df07cba33465d79ef57be4792c503958a..062db72a36ef294566272d9f39d82e9414640e9a 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -60,12 +61,23 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 	.registered = csi2_registered,
 };
 
+/*
+ * there must be 5 pads: 1 input pad from sensor, and
+ * the 4 virtual channel output pads
+ */
+#define CSI2_SINK_PAD		0
+#define CSI2_NUM_SINK_PADS	1
+#define CSI2_NUM_SRC_PADS	4
+#define CSI2_NUM_PADS		5
+
 static const struct dw_mipi_csi2_config imx6_config = {
 	.module = THIS_MODULE,
 	.name = "imx6-mipi-csi2",
 	.internal_ops = &csi2_internal_ops,
 	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
 	.gasket_init = csi2ipu_gasket_init,
+	.num_pads = CSI2_NUM_PADS,
+	.sink_pad_mask = BIT(CSI2_NUM_SINK_PADS),
 };
 
 static int csi2_probe(struct platform_device *pdev)
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 4127b927a73aaf2eada1636fcc6101155f41b334..546c6e7c5d13f3be618fc3eeca780695ead6bfe5 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -399,11 +399,11 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	if (!csi2->src_sd)
 		return -EPIPE;
 
-	for (i = 0; i < CSI2_NUM_SRC_PADS; i++) {
+	for (i = 0; i < csi2->num_sink_pads; i++) {
 		if (csi2->sink_linked[i])
 			break;
 	}
-	if (i >= CSI2_NUM_SRC_PADS)
+	if (i >= csi2->num_sink_pads)
 		return -EPIPE;
 
 	/*
@@ -500,7 +500,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (sdformat->pad >= CSI2_NUM_PADS)
+	if (sdformat->pad >= (csi2->num_src_pads + csi2->num_sink_pads))
 		return -EINVAL;
 
 	guard(mutex)(&csi2->lock);
@@ -509,7 +509,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 
 	/* Output pads mirror active input pad, no limits on input pads */
-	if (sdformat->pad != CSI2_SINK_PAD)
+	if (!(csi2->config->sink_pad_mask & BIT(sdformat->pad)))
 		sdformat->format = csi2->format_mbus;
 
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
@@ -574,7 +574,8 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_async_connection *asd)
 {
 	struct dw_mipi_csi2_dev *csi2 = notifier_to_dev(notifier);
-	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+	int sink_index = ffs(csi2->config->sink_pad_mask) - 1;
+	struct media_pad *sink = &csi2->sd.entity.pads[sink_index];
 	int pad;
 
 	pad = media_entity_get_fwnode_pad(&sd->entity, asd->match.fwnode,
@@ -679,12 +680,20 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	csi2->sd.grp_id = config->grp_id;
 	csi2->config = config;
 
-	for (i = 0; i < CSI2_NUM_PADS; i++) {
-		csi2->pad[i].flags = (i == CSI2_SINK_PAD) ?
-		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	if (!config)
+		return -EINVAL;
+
+	for (i = 0; i < config->num_pads; i++) {
+		if (config->sink_pad_mask & BIT(i)) {
+			csi2->pad[i].flags = MEDIA_PAD_FL_SINK;
+			csi2->num_sink_pads++;
+		} else {
+			csi2->pad[i].flags = MEDIA_PAD_FL_SOURCE;
+			csi2->num_src_pads++;
+		}
 	}
 
-	ret = media_entity_pads_init(&csi2->sd.entity, CSI2_NUM_PADS,
+	ret = media_entity_pads_init(&csi2->sd.entity, config->num_pads,
 				     csi2->pad);
 	if (ret)
 		return ret;
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index d3e1c334df692c5dff10b467d759fe4da45b7b5f..12e1db1d149513fcd0db8c191c801cb144d18143 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -11,6 +11,8 @@
 
 struct dw_mipi_csi2_dev;
 
+#define DW_MAX_PAD_NUM		32
+
 struct dw_mipi_csi2_config {
 	struct module *module;
 	const char *name;
@@ -18,22 +20,18 @@ struct dw_mipi_csi2_config {
 	const struct v4l2_subdev_internal_ops *internal_ops;
 	/* Deprecated, should go through phy interface */
 	void (*gasket_init)(struct dw_mipi_csi2_dev *dev);
+	u32	num_pads;	/* Max 64 pad now */
+	u32	sink_pad_mask;
 };
 
-/*
- * there must be 5 pads: 1 input pad from sensor, and
- * the 4 virtual channel output pads
- */
-#define CSI2_SINK_PAD		0
-#define CSI2_NUM_SINK_PADS	1
-#define CSI2_NUM_SRC_PADS	4
-#define CSI2_NUM_PADS		5
-
 struct dw_mipi_csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
 	struct v4l2_async_notifier	notifier;
-	struct media_pad		pad[CSI2_NUM_PADS];
+	struct media_pad		pad[DW_MAX_PAD_NUM];
+	int				num_src_pads;
+	int				num_sink_pads;
+
 	void __iomem			*base;
 	const struct dw_csi2_regs	*regs;
 
@@ -51,8 +49,7 @@ struct dw_mipi_csi2_dev {
 
 	int				stream_count;
 	struct v4l2_subdev		*src_sd;
-	bool				sink_linked[CSI2_NUM_SRC_PADS];
-
+	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
 };
 

-- 
2.34.1


