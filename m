Return-Path: <linux-media+bounces-40660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1DB305B5
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AB901C86227
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C9E34A313;
	Thu, 21 Aug 2025 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P5XG03iS"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651FD335BAB;
	Thu, 21 Aug 2025 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807392; cv=fail; b=Ye5Yq9be7deiE5uJTALcluK3fiZQG0b6VKFCUwWUzDa1n9q3UL8t+IUmmMGqmZFQlVEx0WiTmS397gshPxNkTl4fcacTsxoUYdyIGFomaT1OMWKJnY1wZdtGomTxeVxcTD61aDu6M8c5x0p1ju0lur8h+h5wfCkNrq5ozOuDKWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807392; c=relaxed/simple;
	bh=NE6j6tTYEJg2WyyX2y2FyEBvCvcCUuqfoyIVylB+eEc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iPybbhEMrvWWNLMwlxfwbupOVXEJ2yjTftG5/9jNEqN65oHS+3hCBqX+Eex02mo0ZlHKMmrFOxJ/p9GH9qR5ViLRIRJydi/TMmu4/dV5DIZtt9VyVGq/4XcMeJwk2wKRPkfegqHZP725G7t5NCVQmaIYLiR4vU6mB+AmARvb+hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P5XG03iS; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnrzcthrpFdQG+eSP1cLGi93FUMm/Hekxel/nRL8jdTqXM1npVYTnJFpXnpoRP+6WLX73WapHL6WRWqhvHiIwdsKzb5XpNWSMqX86y0RaWD82qI1XiOQDZ2GLvv+3ylHD2yUsdW+FT9z3/3EJyB0qzBABROOqTVsyXK1hK7bYEmkQsickJUxDgI+wRRQ8rugfBqqJmbmnDKCEncWldpYXm8Ujo9rmf9u1FiK6Wk/E6LpCx/MsXztNLmWfiRD6+h9ue5nDhF//r5L/p4zdF9PwOK0hE70Ii0pljTwoBllV+BzLUfFE74LcsDgtrCUCL6BOKCVgs0Gm+MsRI1KU0kFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV8eCJe9DwpiMf17kdUY7SuVvO252dOHstr3jr2Ra7w=;
 b=UlmCYYsbo3kFiCFPZ33h2GWymWkhRW6tbHvAiZf7GfnogZ7wQWAMGP4KBvH8OE0c+fQ/Qfn+7c9WPFQuZRLZyUPAlGB3GcqsrpHOI2yOhM6wEqWUkqJ75JY625kTDmIygv1x7A7BCUyGEVLOcBIIPhlbsZIiXfx9cUmDk1lpMukj13TjnOmpqk1ojom+nlrUSGu+ahc90YDRMzw4oLEZ3QCStkMZp8d18yONqZl0TpgCdX0GdHXx9qOti/n4H6TbdSpuIXrxAvUIKCdPVxur3iUjg5o6Vwfdrt6D1gjuqI+Dqj0QVGta2QCCqo3QT8QLU3FTkbEf/OcA/tV31q/RKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV8eCJe9DwpiMf17kdUY7SuVvO252dOHstr3jr2Ra7w=;
 b=P5XG03iSu9fU3SQQCYZySTBPj4tgJMZ6k4E/2icUDMDFFKzRBGtXg/V1urio4P1N4vDI72+bmQp6ECSNi4uXfJdmEK418Qc0mxpvklYO71AsT9Ez1B0GrnTc/+ciILlwF5MHBafsxN8GdLlA4op6SO3NwatUXTE4hJn6WVxsxh5VIVNl3RNJSrt3cPDEFFv4G4/kv0EMaPOhtEej1wdrY0auT7qoT7RzlY78WfuAYrv53p6E3lJEaezbEfHxxwZeVeaDWeC3y815nVZmVazz0/77f+yODq9o586r4QFKVpEnuSEaNbmfpvTpmq2gsJ2KWzgTlxZ1tBj+5dc9RpK1wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:27 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:38 -0400
Subject: [PATCH v3 03/31] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-3-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=11959;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NE6j6tTYEJg2WyyX2y2FyEBvCvcCUuqfoyIVylB+eEc=;
 b=VQZT3eOC9j/3t90jJb1UaKWd9mQvZ2Ff7PBXjtIL/ZR/fHdHgtkcLAOY31ui+P+fKd7ZW2H38
 r8QGoCi1xxWCG1e3itr+j1Nz99SYEd7cKog27gvDmImjk9t8hNL/2gt
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a737de3-e7bb-41fb-ae26-08dde0ef9be2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Sk9BUFNER0dFdE1oRXpPUTBKdXd2bC9uRzJBcEVvYTIxTkxwQnVldDJFSlNh?=
 =?utf-8?B?eURzL2dmcUxWSE56YXlucllWcVhnek8zemtRUVI2dm9vZEtCcDRPRTZlb2gz?=
 =?utf-8?B?NC9VZlhoY0xSWnJFUnV2ZUJ3bENJRXJHU0IyN25TRzNhQkZQcXFzRDd2SE9E?=
 =?utf-8?B?SFhhblZETnNvT2JRZXRENlZzSml4TTVLTCtEVnI4am4ydjRNWjZxeCtTZEpY?=
 =?utf-8?B?VmMxUUVmdEF2TStrTisyQ3ZKYzBCbDBVVk9hdXNtNlc0SzZwK2Z0dWhITE11?=
 =?utf-8?B?Rk81WEEvbEw2TUFRbDRTTXg5Zm1mZ1lEUFJNVit6ODVXZHVRbUJRMGtUQ1pu?=
 =?utf-8?B?c1Bva0s1YitLWEczbEhVTFVZdTBUbDY5T1pjY0FkYThzNWw4Z1BBV01Camcx?=
 =?utf-8?B?eG5QMzJURlVlanR2SnRZOC9tWHR6Y011VEE4Y2tIVFFUWEJuM3JxNERiQ0Jz?=
 =?utf-8?B?ZlFBb3UwOXQySndjOUhpZGs3cHAxMmFWUnJYQW1aTXVQQ080RW1OTjMySGE4?=
 =?utf-8?B?WllaWXQyWnNGQUEzSkdKN0k2aFRIVHJ2WlVsVFgvWW9adUlpakJBaGpyNFha?=
 =?utf-8?B?MStjWklOM1BtZGVKcHBzSUVmaEx1Ty8xZWZZSWNvYzZzWCt6eGRJUUF6Qlg2?=
 =?utf-8?B?aU5yVVZObzJtWTJJeTNFNGEvSThsa0dOUkM0NW5YUHVEZmRtTHpmVXErYUxO?=
 =?utf-8?B?ZytKanhKRzkxT3RYM0VsNlhOaXU2ZlloSnhPaWltc2NUUEZBUytYb0JUVnJ5?=
 =?utf-8?B?ekpXMmFWNFRSV0JvOG1Pc0JUc0V2QnAxUW9iWlNSM2d1SythbWpqaWg4UllK?=
 =?utf-8?B?dGovRktPR3NaZHFtMUFUSEM0UTVOWEdoYWp0a2dHcVd5T1VOZ1pTalU0Q3hW?=
 =?utf-8?B?UWtsdGtHbTlNY2xJSnNCV2FHeXVoRHZJTFhCMkh0eFJnaThWdjViZmIrYXQ4?=
 =?utf-8?B?RmFta0xBallrazd5cVBPOVU3Z0czcDRSUVNUNlQ3R2Z4RGNyOS9tN0hnN293?=
 =?utf-8?B?QkNhbHFUL3hIOWVCdjFEQUs4TVRtQUdJT1BweVJBemwxU1FYaHhvaXo3V0ZW?=
 =?utf-8?B?dFVHc1Z0Q0F4RkpCdHpPL1BFeUsvMGx1cE5FU2lJRlBNMzN2T3pYOC9pR1Ju?=
 =?utf-8?B?YjYySmNPQ04zWUFncWQwNUNqdGpleXRhTkprRG9FQnZrT24vK3o0SDRhb3Fn?=
 =?utf-8?B?TkIrNUZUL3NUalBUNk1uN3NXeG5iZHZrK2Q5SmRBb00vOVRUOXZzSnRXN2x2?=
 =?utf-8?B?YlB5Q09sS1hjM3BmcWo3Szc4aXlGTitwSU5uTjBGZk9KSXV0UmFoeEk5RVJX?=
 =?utf-8?B?MkFzc3RaOGM2OU1LckZiSk85MmM0bkFzVDRZaTFkcnplZWx5ZVI2R1RsSGhm?=
 =?utf-8?B?VS9tY1Q3c1BaM3J1VVBKWWVsVUF5MGtLenRENFYxdXM4eW5BUXRDcWZTTFIy?=
 =?utf-8?B?YmpMalRhYUlCNFdUbmpCZlFCUXpodXY4cnVoVllxMWtZbzFhNXdERHNPRmxC?=
 =?utf-8?B?WjFvQm1IcTVYOGoxMHhYZ1FqZHE1UjZCM1lzMHp4dFo2MzZxbDB1ME14RitU?=
 =?utf-8?B?SEk2cFUvdU4wdUdDZ1lxeDBUb0hLS293VDRIZy8rWHBtUVZvTnF3c3FMcmRs?=
 =?utf-8?B?UWo4cHpIWG0zZTdqYWZlWW5mKy9MYTgwYTg2d2k5eVpYaUhyM1BQeEluckV3?=
 =?utf-8?B?dzNpQ1liWVRFZm9CL1hRUTZSeFhSVE5JMDdCUmFUejFDVkVOSTZBSW15TkMw?=
 =?utf-8?B?M0tWQTJBOUk5YWNDQWplVmo2QkpjU3FwOGVKU1Z6RzVPSk1Ca2tTdGk0c3NW?=
 =?utf-8?B?Q214RzhYWUNGNk1JVUdXZE1qZzFMZDVoU252d2M4WVA0TmI0MkRWK2lXSjNT?=
 =?utf-8?B?cWlubS9YZkZicHI3Tlo0OEdCNlRVN0d3SzlDSU1WRE5BQTR2M1RKeUxlZnM2?=
 =?utf-8?B?S0YzMFdsbnU1OExyYmpVRTJLVGpJT1ZGRUZGYnNBNGtVdk9MQzdrMEVzTlNm?=
 =?utf-8?Q?wTRWyAWda0vLuO8oEEpTsx+krh5ZAY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M1RkTXZueWNVWkU0QjVHV0dyWExFMlZqcSsrZzVMaGlGM1B1bHBXNm9HaDlQ?=
 =?utf-8?B?dHZxNkF0N2JFZ1JRU3JCSEVYYk05eEY2aWVKdTJnUmxMdVdkMHFwU2psM3RX?=
 =?utf-8?B?QncvNE41eUh1dFppMWNZeFBHTXFpM003VXZkeTJycUIxS2Vjc0tDeWFVUmtP?=
 =?utf-8?B?RXNvYW4xbyttT0pSaXRyZFgwaVZjMEtQZ242UFI0QkFzMWVsbkN0L3AxTEZw?=
 =?utf-8?B?TFprUXRad0lWWXZvS0hhZ3RUK1ZKYWx6TG1EQzRmWHVSR2tUcG8zbmdQYWhs?=
 =?utf-8?B?cVFZNExwelZmekRmSGFjdklVZUhSUmRNcXJENUI5eEpxNWlQZ0N4VVV5T2lh?=
 =?utf-8?B?bE4vTUNpU3pMdUxFK3RFa2hDNU5ON1lhdU5YYTlacXd2Visza0hjbmFNbk9h?=
 =?utf-8?B?YU82RHFwVWVreHRhQWFkUmV4TnFUMnBqLzFQZ3F2RHJ6NWVmZmVvaHFHZGds?=
 =?utf-8?B?K2NDb3FWaVgzU2p4eTVORkJMczF0UWZja0tzSlFEUyt0RkljeXdWNHZiazYr?=
 =?utf-8?B?d3pSUDVHTU9RYXQ5TTFVSnlRNVlJL2RRbDdWY0grZ2FkMStJdnZsU1IvblFa?=
 =?utf-8?B?QnM4Y3ZoV1ZQOERPRitraFllOC83OFd3V3hhSFZpVW83b1diTHRpbmNhMGoz?=
 =?utf-8?B?SUFqNkNKMllzMkEwUU9jY0FQSDZXLzZMRzVuanhLbkZid2RzQ0hTWElEYmFw?=
 =?utf-8?B?QUJPSEVCa2l0eDhEdU9yZk9WWkc0TDdXK0lqOGdqMWhVQUlMM1hUUDl6eFc4?=
 =?utf-8?B?R2JJRXBMVUUvb05XdXRyakgyVWxOTFRTWHRaUGtYZU52ZXNrMzlTeDFKbVhC?=
 =?utf-8?B?NXZXRWFwREZyVHZsaENmNGxZRmVxYmI3Y0RsUXFVVElrNlQ2bFZMbzFtY09G?=
 =?utf-8?B?bk1VZWU2M29meGxLc2NRRHZwN2J2ZUlQZ3BsUk1HK1pVZ29pTjVFQXEzbHFY?=
 =?utf-8?B?RUFERHVlQ0Q3dEpFTTFQUk9uTzVqc3lEeFM5MlFHVHhqOEIyZHJnUXNzM011?=
 =?utf-8?B?MzJnQlJwS2o3NTlPblB1V3N2ellBR3JnVHp4SWVHRHpKUkpId2NSZkQ2VWQw?=
 =?utf-8?B?TDNCM1ZlYTZiN0VVdXpQWHlQczlKSU5TdVF0eFhvaDVWUDRqOHorNnNWMGVr?=
 =?utf-8?B?clhlY1dSSXpxVE5ZS1V0WXM2dUxuYy82WlFHbkc2NlJDRi9FclBONUlJOEJJ?=
 =?utf-8?B?d1NWYXhJNWNNQU1SK3BNNTN2UXNEazFZVnpKWitOVmdpVWd2TGd3YUVkNXNM?=
 =?utf-8?B?dHY3cExzc2ZqeE1EWk9YVW9adm42WTVWTGRPa0FPd21ucWVLcCtEMGR5MkRH?=
 =?utf-8?B?SGZjQjlyWGhoWDJ0WVpUem0ydzQxdWRKa2tYL1lqLzlvUllDMWsxSG9EZnBy?=
 =?utf-8?B?T0JZTXFjTGZJemtUL2RKVCtBTzRUTDJLR0ErTldPaWsxYW1Ja1RLVFpZcUpz?=
 =?utf-8?B?TXVCSlRIT0JpU1U0NnZLTmhkbjBUdG5sK1hCbWR0UUJxSmd5a0NiUXhYcjc3?=
 =?utf-8?B?Z0UrZXRZbExKYjQ0K0JHSm02bStkMG9zeFk4VUtBRGpmUGgzNXJ1RFRRYTlZ?=
 =?utf-8?B?ckxGTXowTnV1K1JoK0t0Tkg0dVB6TENFdUkzaGVIaEFXMUpVcWR0Qk01Y2hC?=
 =?utf-8?B?U0xoQVNnUlA5UGZhWDc0aUpmRTA4d01yRzFpVkpVd2ZjL3VDcnlGNTZJekVJ?=
 =?utf-8?B?VG5sRGRaemRkZ3RoSm5Rc2ZZZEhKNTNwUlMrUVY3cHFxK0ZZQ1dzbHZ6Wndo?=
 =?utf-8?B?RkQ0YXpCZ1l0M1Fkb0JPQTkrM2VlNzJGK2VEeDlFOU1jbkpKbDNvMVk3T013?=
 =?utf-8?B?NUtId3d4RGJ5MVo2d3R2S2RlbENtQStUS0NONE96U0ZqVmlVOVlYQy9aSGlw?=
 =?utf-8?B?bFY2M0tQblNadzNNT2w1TERZNGhlMUN4WDRpdnFRcTBKRzQxeGFadWxDc0xE?=
 =?utf-8?B?dmJFNkhsUjZlaFdnRnZ0V0MrMTJiVkd4RFpYbHR3YWFpdzZvQW9td1pWMnNO?=
 =?utf-8?B?SStMOEtpMDYxYmZ5bWttRTdYMzBvanFTcWFqWm1nKzAzNEFZYzhsWlZkK1BQ?=
 =?utf-8?B?N1V0dUZXdldwVzhLL3Y5cHFHQXY2ZVNBSGlMWTUwM0wwekxBU1ZFNS9KVVlv?=
 =?utf-8?Q?D9RFpPOlvEyXIlfa268svnjEd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a737de3-e7bb-41fb-ae26-08dde0ef9be2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:27.5672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8nST42oWRJLVoW6Vz3A2cC9bkZR5jDrnc0T+fqo/sp88M7PgTWzHhAAA3D+x7a8c4WvWXnOnJO1X2chNRYbRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Add helper function media_bus_fmt_to_csi2_bpp() to get media bus fmt's bpp
to reduce codes such as

	static const struct imx7_csi_pixfmt pixel_formats[] = {
        {
                .fourcc = V4L2_PIX_FMT_UYVY,
                .codes  = IMX_BUS_FMTS(
                        MEDIA_BUS_FMT_UYVY8_2X8,
                        MEDIA_BUS_FMT_UYVY8_1X16
                ),
                .yuv    = true,
                .bpp    = 16,
        },
	....

.bpp can be removed from pixel_formats with this helper function.

CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
See section 9.4.

Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
MIPI defined data type and avoid below duplicated static array in each CSI2
drivers.

	{
		.code = MEDIA_BUS_FMT_UYVY8_1X16,
		.data_type = MIPI_CSI2_DT_YUV422_8B,
	}

Only add known map for dt type. Need update media_bus_fmt_info when new
mapping used.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v3:
- squash two help function patch to one.
- use media_bus_fmt_info to do map.
---
 drivers/media/v4l2-core/v4l2-common.c | 149 ++++++++++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  30 +++++++
 2 files changed, 179 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a5334aa35992e5f57fb228c33d40c51fdafdc135..a75987aa5fc69d6368709b7d521bede666da9513 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -46,6 +46,7 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/div64.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -757,3 +758,151 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
 	return clk_hw->clk;
 }
 EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
+
+static const struct media_bus_fmt_info media_bus_fmt_info[] = {
+	{ .fmt = MEDIA_BUS_FMT_RGB444_1X12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB565_1X16, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_BGR565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_BE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB565_2X8_LE, .dt = MIPI_CSI2_DT_RGB565, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_RGB666_1X18, .bpp = 18},
+	{ .fmt = MEDIA_BUS_FMT_RGB666_2X9_BE, .bpp = 18},
+	{ .fmt = MEDIA_BUS_FMT_BGR666_1X18, .bpp = 18},
+	{ .fmt = MEDIA_BUS_FMT_RBG888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_BGR666_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB565_1X24_CPADHI, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG, .bpp = 21},
+	{ .fmt = MEDIA_BUS_FMT_BGR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_BGR888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_GBR888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_1X24, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_BE, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_2X12_LE, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8, .dt = MIPI_CSI2_DT_RGB888, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_3X8_DELTA, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG, .bpp = 28},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA, .bpp = 28},
+	{ .fmt = MEDIA_BUS_FMT_RGB666_1X30_CPADLO, .bpp = 30},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_1X30_CPADLO, .bpp = 30},
+	{ .fmt = MEDIA_BUS_FMT_ARGB8888_1X32, .bpp = 32},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_1X32_PADHI, .bpp = 32},
+	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X30, .bpp = 30},
+	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG, .bpp = 35},
+	{ .fmt = MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA, .bpp = 35},
+	{ .fmt = MEDIA_BUS_FMT_RGB666_1X36_CPADLO, .bpp = 36},
+	{ .fmt = MEDIA_BUS_FMT_RGB888_1X36_CPADLO, .bpp = 36},
+	{ .fmt = MEDIA_BUS_FMT_RGB121212_1X36, .bpp = 36},
+	{ .fmt = MEDIA_BUS_FMT_RGB161616_1X48, .bpp = 48},
+
+	{ .fmt = MEDIA_BUS_FMT_Y8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_UV8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_UYVY8_1_5X8, .bpp = 40},
+	{ .fmt = MEDIA_BUS_FMT_VYUY8_1_5X8, .bpp = 40},
+	{ .fmt = MEDIA_BUS_FMT_YUYV8_1_5X8, .bpp = 40},
+	{ .fmt = MEDIA_BUS_FMT_YVYU8_1_5X8, .bpp = 40},
+	{ .fmt = MEDIA_BUS_FMT_UYVY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_VYUY8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_YUYV8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_YVYU8_2X8, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_Y10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
+	{ .fmt = MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_UYVY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_VYUY10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_YUYV10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_YVYU10_2X10, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_Y12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_UYVY12_2X12, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_VYUY12_2X12, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_YUYV12_2X12, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_YVYU12_2X12, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_Y14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
+	{ .fmt = MEDIA_BUS_FMT_Y16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_UYVY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_VYUY8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_YUYV8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_YVYU8_1X16, .dt = MIPI_CSI2_DT_YUV422_8B, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_YDYUYDYV8_1X16, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_UYVY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_VYUY10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_YUYV10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_YVYU10_1X20, .dt = MIPI_CSI2_DT_YUV422_10B, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_VUY8_1X24, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_YUV8_1X24, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_UYYVYY8_0_5X24, .dt = MIPI_CSI2_DT_YUV420_8B, .bpp = 120},
+	{ .fmt = MEDIA_BUS_FMT_UYVY12_1X24, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_VYUY12_1X24, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_YUYV12_1X24, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_YVYU12_1X24, .bpp = 24},
+	{ .fmt = MEDIA_BUS_FMT_YUV10_1X30, .bpp = 30},
+	{ .fmt = MEDIA_BUS_FMT_UYYVYY10_0_5X30, .bpp = 150},
+	{ .fmt = MEDIA_BUS_FMT_AYUV8_1X32, .bpp = 32},
+	{ .fmt = MEDIA_BUS_FMT_UYYVYY12_0_5X36, .bpp = 180},
+	{ .fmt = MEDIA_BUS_FMT_YUV12_1X36, .bpp = 36},
+	{ .fmt = MEDIA_BUS_FMT_YUV16_1X48, .bpp = 48},
+	{ .fmt = MEDIA_BUS_FMT_UYYVYY16_0_5X48, .bpp = 240},
+
+	{ .fmt = MEDIA_BUS_FMT_SBGGR8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB8_1X8, .dt = MIPI_CSI2_DT_RAW8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB10_1X10, .dt = MIPI_CSI2_DT_RAW10, .bpp = 10},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB12_1X12, .dt = MIPI_CSI2_DT_RAW12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB14_1X14, .dt = MIPI_CSI2_DT_RAW14, .bpp = 14},
+	{ .fmt = MEDIA_BUS_FMT_SBGGR16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SGBRG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SGRBG16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_SRGGB16_1X16, .dt = MIPI_CSI2_DT_RAW16, .bpp = 16},
+
+	{ .fmt = MEDIA_BUS_FMT_JPEG_1X8, .bpp = 8},
+
+	{ .fmt = MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp = 8},
+
+	{ .fmt = MEDIA_BUS_FMT_AHSV8888_1X32, .bpp = 8},
+
+	{ .fmt = MEDIA_BUS_FMT_META_8, .bpp = 8},
+	{ .fmt = MEDIA_BUS_FMT_META_10, .bpp = 10},
+	{ .fmt = MEDIA_BUS_FMT_META_12, .bpp = 12},
+	{ .fmt = MEDIA_BUS_FMT_META_14, .bpp = 14},
+	{ .fmt = MEDIA_BUS_FMT_META_16, .bpp = 16},
+	{ .fmt = MEDIA_BUS_FMT_META_20, .bpp = 20},
+	{ .fmt = MEDIA_BUS_FMT_META_24, .bpp = 24},
+};
+
+const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++)
+		if (media_bus_fmt_info[i].fmt == bus_fmt)
+			return &media_bus_fmt_info[i];
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_info_get);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d779ab5dfa7d2fe16e6f1382c07d4..3227d28224b7c32ef2745548391da9e792cfa559 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -8,6 +8,8 @@
 #ifndef _MEDIA_MIPI_CSI2_H
 #define _MEDIA_MIPI_CSI2_H
 
+/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
+
 /* Short packet data types */
 #define MIPI_CSI2_DT_FS			0x00
 #define MIPI_CSI2_DT_FE			0x01
@@ -44,4 +46,32 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+/**
+ * struct media_bus_fmt_info - information about a media bus format
+ * @fmt: media bus format identifier (MEDIA_BUS_FMT_*)
+ * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
+ * @bpp: bit width per pixel
+ */
+struct media_bus_fmt_info {
+	u32 fmt;
+	u32 dt;
+	u8 bpp;
+};
+
+const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt);
+
+static inline int media_bus_fmt_to_csi2_dt(int bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	return info ? info->dt : 0;
+}
+
+static inline int media_bus_fmt_to_csi2_bpp(int bus_fmt)
+{
+	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
+
+	return info ? info->bpp : 0;
+}
+
 #endif /* _MEDIA_MIPI_CSI2_H */

-- 
2.34.1


