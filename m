Return-Path: <linux-media+bounces-25964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF9A2FB42
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DCB3165A4F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B92324CEE5;
	Mon, 10 Feb 2025 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hMJ7EFM2"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F8250BF3;
	Mon, 10 Feb 2025 21:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221228; cv=fail; b=ko7YVwI81ryXf+7a2TvdYgqVblwuD9XMH26vZhkEtEURfq4Kc7KGGwBuRA/0RVYpMMhfg3o3pxuv/Za/S9l6zf8yoWa1aokH5IcifsQOTCAvZTUb0dldL8suescNMJ9YGmHeEyE3CHNMKxWFQRvSaOKX4I37hRsnu9gfJs/R76E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221228; c=relaxed/simple;
	bh=IYpuXHdpNi1ADAGEfpowE6Fvfm7uf+nV9Xe58rcflZA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IIGSP1JXK5u99ks2M4AABAZk5b9J7y+Z9Sqksz4ZCeX1kO13Q8ZDZqSPG4J0y2xamoH1gjb3LTXIkWQ9GAHr1aDXUEsW6bD6eXWLX+J0hfJ6QdJLRW7UJ2JTEfPbT3bJeoVX2WMUAxycV38I8fNOoTf8HEKDXkFX6U0S9ts6Snk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hMJ7EFM2; arc=fail smtp.client-ip=40.107.20.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygWsEx7WSsdIU9kSjYiGT32rBgMJ4CFfdU2y4BU5nzSSd3QOK2DCdpqpiQMLYqkA7bF/mqmkXzv/29FnY6gyOdy4Bl9eDG1OUOnvnxh6wbk2grmgU7tNW6fCVhDfI085WtCTgAwFhvQr9YLfqBbqpyCZ+Y6jjwJkqj6VY0/y27cnQ018kHC8NgYrgK0EStimRi9L8SM/oAAGhq8aDcMFdnDvVcO0ukaQfvaC5TuciViKaa3S8yEbteXe9Lkzngjp8CGx3NirTi+GO2UDnCTQ/nbB33T1kiUe0Ia0di7KOXIQnB0my3ydp2A6Mb2UAlJX0el7jOG8AD2rN4u5mD1w/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p03uJSijvTJl1WYCM/t70RjEhrD5nomucUy/Sv+1Hts=;
 b=r5CQcEgzDJ2H3a55pPRJqyuAWm1TB+5rHqw4+uC4z9SixIfiYPBenZeHlssg8XXRXWThNEPPf7P53svqA53oN5qtwVoqESqTA/GJ29Tnog7B2gUiWrCQmnOdh77+hjpV+0gmCPp5yNoLDNPupRPIFPV2FNr0shF2/GP05/YZdRU2aTGCB0uOH+2OHYtaINbvqtnm762XvXuVZ8wFNeL8OZ4xypZjsqRY9TEhLaSCWvkmeRtXmFTfmFvC8fuamrfdCPqV4zMRWfRjD+whxAG1N+Ik72b+7XY77zqCbEKqgvc++FDEwOR2vQxWrZJEejhNvyhGqh5W4+YFWjrmfOjFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p03uJSijvTJl1WYCM/t70RjEhrD5nomucUy/Sv+1Hts=;
 b=hMJ7EFM2dG6QTaHsi61IDsVF4ft767n9buQQiYo9A3FPA2UcoSKff9zYP/zJu8L6C6VOzthHLXJpiGJVTkG71Gzo1RChxBoiNkiBT2IadvZUH27iappBUhEKvydwbR1Cc7X1SQ3G647hLTYpOZnARiNuWKVCit3BW+3ZR9JxowSZ7hS0oVWfhFZn63F19rNQFcgsaHwxLB96l3Ugzvb5phYfdYVYriUj24dfopCGtSYZ5dfv8duPJr/Zin1TziH2LGy9qBwYwzlZHtG7KSfqDx00uWzw2M/UQ9NSf/LtfGp8hh3+owrEKZOG+WVXdUB5Jt/LIThRA38kD4p0n9Odng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:00:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:26 -0500
Subject: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data for
 different compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=4303;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mCQ0dpoMb0cB3d9MY8XgzIv35NywEgot9HMoXjS7eMA=;
 b=Uq/XYUrtjJsU7iObC06oX4CNuzdjxzupaMPUAAI2AZI2DyU6e/tLBFr03OmlutWCVBzemptxr
 3K8n52DJJJfCmWvUSSWZ6Pjgqu5wANNoz9OjSEX1173+GHyoUPega4M
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea9a009-5256-4451-20f9-08dd4a15eff7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?L0tScnFwOUhYQVdvK1NWV2plRmk5QlRkdTMwUnBiMkVpc0RTYzZSNEZGa3Rm?=
 =?utf-8?B?S0dVNXlxZlUvK0dFejM5Q0Mvc2RRQ2ZLRjAwUHozWEhsNTRtS3ZNaGdVOFRI?=
 =?utf-8?B?czVoNzZGYUVvSU11LzI1SzA1MVhhSXF3K1ZjMDlzL2oxMnpwNEdyWEs0c0tB?=
 =?utf-8?B?MGJGVk5DV3VGR0VSVUMvMElXUU1yVzc5OExudTJPanRYeEFWV1pSeHZVR0VO?=
 =?utf-8?B?dFdzSmZEcFVEN0pFN2R5ZGhNd2RSTmU5V1oyT2k0YlNpRm5ScCtJZTRIc1VG?=
 =?utf-8?B?cFVqQXN0ckxoWjVTdUU1N2t4OEx3c3NHMXNHK0cyekN1SFBPL29TQzczbGtS?=
 =?utf-8?B?dVQ2b0ZMR0twYU1NSDZ1dmlFdjdSaGFIaDVNOHk1YUFmY3hrZ2owVUtIVnVR?=
 =?utf-8?B?am50Y09EWGRaR1N3bWphdHpROTVjcGZSd1lOVFg4aGxrcTFCblN1cnFWWXZt?=
 =?utf-8?B?MFRWbWVwb0czaTFvb0o1WnVrTlF4WXh1QmJTL2ZSZXR6MUE1NkxCejJ4aWRk?=
 =?utf-8?B?MWhGaTdiWHNFTHdTM2lZNnBYVG5oK01pR2RzU2hnR2hGbjNyWnRoOGlYenRv?=
 =?utf-8?B?cGFVZ1ZiZzJIYWcyZ0V2aTRQaVlaNXRNejRmYzJJTXVPOXk4d2JQZDNyVS9z?=
 =?utf-8?B?Z0pPV1U2enBEYTRqM2FuR0RzU01MdUx6b0dubXk4SFdCdGFmaFVlazg1bG1F?=
 =?utf-8?B?a0l6Uzl5a2x4NkNjOWZYRHVuSGZsaVlJT0pkSjZPRHU4ZTRuUU0wNjlGVkl2?=
 =?utf-8?B?L01DaDBVMm9GOTl0Z3pjVjJYWkVXTVFORW5Qd1l4c1RRVFdtNEJvWXlmamRj?=
 =?utf-8?B?R1d0VzhUUmdCa2RXVG0xd3VkK0JJOXlTUGEyemdGK2NFZTBlUENGY3RDV0Fx?=
 =?utf-8?B?OHduRnBJR2NpQVkrVjJDNm5NODB2bXYwV1I1bU1Cc3h6MmdCdGVpUzVsbCtH?=
 =?utf-8?B?ZlkxRmF3U1g5ZUVRY2RXR29HT0Zodm56TGdtclpvWldQMEtGVjA5RHFKcGxp?=
 =?utf-8?B?aVQvVkF0aUVhWW80ZmduNnByWTBMSEFrOXYwTy9FWjAyNzZuaU1sUTZxdDdn?=
 =?utf-8?B?Sm41U08yOFRUYzlNSGNIa3owZWNQMlVqbnB0T01VWEpkbjZFZ2hYMWxIZkkz?=
 =?utf-8?B?RGZwVjhQaFA1K1Z3UmFEREV2L09tODlwUVNkYk9LTXlRU2JuQmQ2Q1hudGFi?=
 =?utf-8?B?bHBnY2hDbEV3UDNrQVVyOWx5c1dKUFVUME14cHV2YlJFWGhqRGY2Y3RzcExn?=
 =?utf-8?B?RkFZUjhUQW90NE1Ccjl4WmtJUDVtcVgyWjRoMTJXd3JxU2VsMGJSOU5KYU5P?=
 =?utf-8?B?WlNHdm9CZk1Jc1Ftb0V5d0tqdk1hMWZtVWdBbEtCdG1ZRGtOaUR2YStNdkNr?=
 =?utf-8?B?YmgyS09pais3UUpBbkpzMlhxanJVU29qSWxFOUpxWEFzeW5nWk5mZ0dTK0lX?=
 =?utf-8?B?ZmMvNFRVbVNxeWV5cmlUV0dWQndvZEdEalNsc0JjN0dPeWRXSWx3Q3RuWGNH?=
 =?utf-8?B?bFNPMVZwVjdlUEtsbHpGeW1sSjdILzR0MElGZWJISTlZaHpad3R5M3VhZFpk?=
 =?utf-8?B?WUhtc0Rxelp2QW4zanRLYXRmYnlLRml6NFBUTmtNbERQNS8wbzJnQytTZXJM?=
 =?utf-8?B?cXdwMURYRkZLc1BJU2x6NVBzbSswYTBOV1lwM2Z0L3FVSTJoeE9uSEo1ZTkz?=
 =?utf-8?B?OFZuZ1B6T2Nrb09ZSDQzY3U2RXA1SnQ3b2VoWWNGR0QxUU9OWFNRTXdJS2dC?=
 =?utf-8?B?dytRclhocHNIVGxYeHpBWUd3c0JrSUFaeUxyQTVpa2FCZDBPSlVMdzNXdVhO?=
 =?utf-8?B?dTVsY0RNVE1jeHN1ZS9kcVAvbXdkVUR1YzVPaWFxRmhmYWN5YUhIUmYwTk4w?=
 =?utf-8?B?a0NjTWcxNTYwK0hLdXNJRTNQNWdYVEp0ZDFtT1UweXRGSkIyRFY2SnNLWm1Q?=
 =?utf-8?B?THZhbDNiaEN4eGhTRTRTRWlMMlJhaGxTMTMrM3BCaDV1aXl3Vmowd0hPbThk?=
 =?utf-8?B?TFdMZ3Z3QnB3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c2FQemFpZnJueUxuZ2hwc29CRm1meU5WdHFNTVFzcFBHR1pyQmxaUEVtSEx3?=
 =?utf-8?B?WjlnWlNNb0lhR0x0U1F2UjdDenpGdGQyRVJYY3JlZUp5UEl3cVF6VC83MEdH?=
 =?utf-8?B?OU9Oa3BnZDlKN2lEYjdidWM4dmpyUHRjd2FWcWV2U3RZSHhsakJVTlB3MTU1?=
 =?utf-8?B?TTUvOGdlbVgxdkZQS1lKLzJSK2dHY25nOXZNR29lSWlNNGFVdlQ0ak0waTBG?=
 =?utf-8?B?SzNQMGhRcG1yWWF3SENMSHVHMCtsSFo4LzNDNzR2Yjg4MHRPd29NWDRjTXZF?=
 =?utf-8?B?UlZIZjFvY3pDY2gyVTRmUTlxaHNxbnZ3ek5yWGxhS0Y4ekpiSWpBL1gxV3g2?=
 =?utf-8?B?QUR4U2s0ODR6TnVic0tTK0pZdFJoL3RYeU1SYm9sZHVNZlZFSEJWb0pMbVdv?=
 =?utf-8?B?MmN4MFFMN1Rrd2NCRm1yTVVmSEcvR3RVd0tnS2FqNC84NEFON2wyZ0xJVDFz?=
 =?utf-8?B?VGY5R2dHMVlnd010QVF3eFR0SGNQZzRiRnVxOUlNOGszTDVVNjFFSURuSU1D?=
 =?utf-8?B?VVI3MG1Xb1lzMVhjT1lacDFKK2MvUEtKR3ZUNWs5b0thNUphSlJ4MjRIRk4v?=
 =?utf-8?B?WUpuYWVsZGhERkRUS0YveDE0aXhlUW5GTXJOSHpyK3R5cDcrRDNQb0NGNmtZ?=
 =?utf-8?B?L0RHZTRySWNTNTM2REcvdEhtN21YVFEvRksyek9Ib2tBNHpaL1VDTE5UQWVv?=
 =?utf-8?B?NXlKYTNMM2U1aHFpbzloZkY3VWtxaHhiVzU2emgzWG9hZEs3MnpJTnh6VGNh?=
 =?utf-8?B?THBrbG8rUG91dFVOYktnVm5DSkFFZ0JsZW9jYU5DdUZmeTNQQ1NKNjU5MU9X?=
 =?utf-8?B?dVVYdG1mMXc3dzN5OTNpdDQ0YmlXcEV5QUxMbUJ1bzhzWDE1RURPdjRDYzZq?=
 =?utf-8?B?a0xyd3hKUEFyS1p1a2xjRDJ1N0xKRUJkRDFHRTdFSzc1WmtQeFVhNkIxSEpo?=
 =?utf-8?B?aURtWGF4TzIwdThidTZKYXlKd2pwWldrQ01UaklZUm5oRDZkOHJRd3VoZ1B0?=
 =?utf-8?B?Um8rM1NGVVlrZjNwbmQ5TGRra3JidW9Sbm0zTVZQS1BzbmRkMHJWZmFOYjlJ?=
 =?utf-8?B?cjgza0t4bTZQVTVHellxQzFVOE9ueVBOYWhGTUZFQU5KUDNMaDBNb2tOQitQ?=
 =?utf-8?B?MHphcVQwc2V3b3psVWd0dlBoOFlEdUF1RXdlTjl5MGRERnpxR3JnbmFoc1JT?=
 =?utf-8?B?VW53RjJRbEtiRWxFcXJydVBPUkl6M0lyQ0dTcFBDTERKNEVRUHduUW1jKzdm?=
 =?utf-8?B?NXNXeG5KSy9vZGlPS3dLODM0dlM5SkIzSjFoVEtkT2RXVlV3TnUzTitVQ01N?=
 =?utf-8?B?blpTY0NyRVJDU2pzbjErZ01yMlJvSHM1VEpQdEJMcnFsOHpLRlBXUisyMHpK?=
 =?utf-8?B?UGs5Ky9Jc0NxQXloYlllN1lUMkY5OHlUSXZvWk13TE95aGZhOTIycHBMUGN2?=
 =?utf-8?B?OFpISkszd3BLNDhGLy9iaTlJZllwZmNVRWVIbWU4ejR6Vm51cDFyL2NDdEd5?=
 =?utf-8?B?UXM5S3NJUUgwcXJXdHNhenpVOVM2L2dlNGdXaS9yVWtWMmxGVHlkSlBRNHZH?=
 =?utf-8?B?SXUxNExvbldzN05Yb2hTTG1zanh1VnU0TUZnTzlKRUFySzljbkxBTlpMODNO?=
 =?utf-8?B?d1pVdmxDL3JEN0NjUkZnS2Z4b3dPUjdsR1N1TVpDWSt5NXBxcU00c2pmUWZL?=
 =?utf-8?B?VEtxUzAwbnFHM2FvUjdKRVpjUFJWQkh5R09oTVRRQ2VqVkdyM2dhajRBbEFk?=
 =?utf-8?B?NEs5cUNWNzZSMGxvNDBkVzBqZk9qbURvdDUrMHJ6amRsaVBua1lxemswRmgw?=
 =?utf-8?B?RVlJdDhFdE03Q0VUZGJUaTRJUzNXYTBFa1QwdGVtY2d5MElxVGRRazZmZGRo?=
 =?utf-8?B?dG05amp6eSs1Tm9CQUxJOUVmbC9keWlYYWliRFdaSUYzVzE4ejdNWnZicm9P?=
 =?utf-8?B?cDlWWkxNUStXR01SK2NwbFllTFZDSlp0ejh2ejMwcHdyakhqam41NVhDajJq?=
 =?utf-8?B?VHNRaUFNL3M0YW8wRlBBN3NNQWpnVjd5b2hsdDVhZTFzQmtWZjRmVnFUcW9y?=
 =?utf-8?B?QVZZY3YrbitNTVhJTTdpeEtjUHp3ZVZ2aXJRc2QySXpiK3cySk00bWJhcDNh?=
 =?utf-8?Q?nAXs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea9a009-5256-4451-20f9-08dd4a15eff7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:23.8606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYUE540J78fCkkX6sc8DzO32QHmFdUDb4zF2Kt6xbH4yydeYZiEVbEtt82ukSWJyy7CO799LQcCuw/ulPUXv2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Introduce `imx8mq_plat_data` along with enable/disable callback operations
to facilitate support for new chips. No functional changes.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- none
change from v1 to v2
- remove internal review tags
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 1f2657cf6e824..b5eae56d92f49 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -62,6 +62,8 @@
 #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
 #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
 
+struct csi_state;
+
 enum {
 	ST_POWERED	= 1,
 	ST_STREAMING	= 2,
@@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 #define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
 
-#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
-#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
-#define	GPR_CSI2_1_HSEL			BIT(10)
-#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
-#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+struct imx8mq_plat_data {
+	const char *name;
+	int (*enable)(struct csi_state *state, u32 hs_settle);
+	void (*disable)(struct csi_state *state);
+};
 
 /*
  * The send level configures the number of entries that must accumulate in
@@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 struct csi_state {
 	struct device *dev;
+	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
 	struct clk_bulk_data clks[CSI2_NUM_CLKS];
 	struct reset_control *rst;
@@ -137,6 +140,35 @@ struct csi2_pix_format {
 	u8 width;
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8MQ GPR
+ */
+
+#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
+#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
+#define	GPR_CSI2_1_HSEL			BIT(10)
+#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
+#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+
+static int imx8mq_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	regmap_update_bits(state->phy_gpr,
+			   state->phy_gpr_reg,
+			   0x3fff,
+			   GPR_CSI2_1_RX_ENABLE |
+			   GPR_CSI2_1_VID_INTFC_ENB |
+			   GPR_CSI2_1_HSEL |
+			   GPR_CSI2_1_CONT_CLK_MODE |
+			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+
+	return 0;
+}
+
+static const struct imx8mq_plat_data imx8mq_data = {
+	.name = "i.MX8MQ",
+	.enable = imx8mq_gpr_enable,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -364,14 +396,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 	if (ret)
 		return ret;
 
-	regmap_update_bits(state->phy_gpr,
-			   state->phy_gpr_reg,
-			   0x3fff,
-			   GPR_CSI2_1_RX_ENABLE |
-			   GPR_CSI2_1_VID_INTFC_ENB |
-			   GPR_CSI2_1_HSEL |
-			   GPR_CSI2_1_CONT_CLK_MODE |
-			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+	ret = state->pdata->enable(state, hs_settle);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -379,6 +406,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
 {
 	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
+
+	if (state->pdata->disable)
+		state->pdata->disable(state);
 }
 
 /* -----------------------------------------------------------------------------
@@ -869,6 +899,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	state->dev = dev;
 
+	state->pdata = of_device_get_match_data(dev);
+
 	ret = imx8mq_mipi_csi_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
@@ -946,7 +978,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
-	{ .compatible = "fsl,imx8mq-mipi-csi2", },
+	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


