Return-Path: <linux-media+bounces-33190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D35AC12E8
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DAA6A427AA
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9832C29CB4B;
	Thu, 22 May 2025 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bKac0BMT"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70853199252;
	Thu, 22 May 2025 17:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936686; cv=fail; b=MoF5OK/AlRmejmNppdxIDlM8rPaIoNP/x7kl+5j+JYxTdceFYoI3jMGWDf1csy6xnFwH5ypm/pjIFTKpai1XdcFCHDLLsc9cZZW/cQfUzk2O46KakdSTv95HCWZF6oR/Cv5AgaBjuiHpIpXceq+dDs2v/ylEJfU+UlsUr4/aJfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936686; c=relaxed/simple;
	bh=L8Yl1POgxokxfkJXEyXHiVMQ7MBhX1CushJashNA5Dw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Th4BsKZU1N7Mxe6Z7IULsC830yr+StKnRaYJ28QSw6Ioy/6ptx3PsEwsGeUMmEUv/nx4orJAhV/6sR402lSi6KPJgCziacEVdqkOWLG40vbixmibMdjq6vOtqaJdMSt8mEaY6TDEHFEE4kb5grYk9oBhS8KSI7qBke8Lsr2WKKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bKac0BMT; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH/epAuKBKC2fCMHwjBxNvuJU4lPXcwh18GHXWzUrz8KDjcXLqOqQQyRHAxPyi71OqEqWrzly088ewiQXu6CiPkeHoWTxrEISU+v6hTXf6Dq8tNUu+LaY07UIJ7V3Y/I/qGKvVCMEk4lodbY4eoVK6VuJV4lpZKWD3HGsh4mt4PUkF9O47GG2RjIsGg0oXaT8uRnYT2uBRyDYuwpdZgOjgrsa3eDsZAF1Be13hellPVTe+841ER/VIDxAjl1w4I1u4O47IUquvqt4CwvATw+tZ1yy3wsW6NxtRtuCU5uDuITGT1MN2xntYu2CLhm4GA+hMudhLJYnyKeK2Ipnpo1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o0zU7p4ORmCEUYQmiNjUpswrffkkv0jFJVprY3Rci0=;
 b=OpWDLf2yNNQ83DWoYSqlGy3ztfD9hjLJQfyFkG0iGB2P1f39ad6x51uuJd+gtuW15naf+/QhdV532eSCS3aB1tLY+K/YL0P0qaUJFpFKF8lPBawIC/MvUWmynOTH5jJ/4CGNLc+vBGerwpzbiIfbYnO0QuF3TsrrwT5Dv/6yuuDDpvtafFWM21AodK3advhUHxTrBCuzkRJpAUEnQtKuTiCERHMnEFiAr8/Ru6j2Y3dP+el3XISBX3353Eye7+q8YsjH5wb9rqRUyBIT3vhUKXRE7enL6YVUqX0xJA3FMWJGMAm9SGcWgkYJVDtqXqDeRe+06MK7+9tkMA2GInPNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4o0zU7p4ORmCEUYQmiNjUpswrffkkv0jFJVprY3Rci0=;
 b=bKac0BMT35qaRjZVa3FvJG0uJYpK+bMwCin/E2haf8iu+ZSVjNjbpJFv3zA89+Eq0qln2B6a6AWky+HaHWvQRP5+SpveOqYs4jIq1dx8cNcBAOQ+Moh9BVLAwWMefjbUCJxcVjVkQYPiA+x+pn7nvx/GL159MUQzA9gHct3EAWARCHTOfN6DpasRErtpE47oCTpL7lt/8S0eO18fXbNTvyb15oR5k8QwDnO/5oP6fBL4T8Muyu8TVUm/6yQtSaKCuUvVAI4Wj/Vp4UDUo9+UpeVZ7l+7st7ikwGEP1xUQ4hViM7GIdrFU0aRkQ5p2QMbL/dPFw7R63mWaf4vRWpGKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:58:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:58:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:51 -0400
Subject: [PATCH v5 13/13] arm64: dts: imx8q: add camera ov5640 support for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=11637;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=L8Yl1POgxokxfkJXEyXHiVMQ7MBhX1CushJashNA5Dw=;
 b=ZOtKF3gL5H6DE+YsM9tVlHOJnGczgJzZi7NdiIG+Y4areNS9lIzHMSA09V+9ddBd0JLZxhmjJ
 JeUvXCC4b7vCFh9DU/RiG/A2cAl/9pKgcLzHcKlhyN0cJI7ua7k0WDT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2e51e1-ddd6-462c-86f4-08dd995a3152
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WmhJQk9kVUpGb1JSQ1g2dTdkSkMwd1hNRTEyN1FBcG9leEEvUkpLdmpEVm1r?=
 =?utf-8?B?RVAyOXVCekFpVHhHbTBwNnhxQXd1L3NhTU85MjVGQ3p5b1lONVJ3L0N2bGJh?=
 =?utf-8?B?b3hxT3hqVEsvaXRTbW81Mjdlc0g0djRlUzZhdm1uNWhLUlNKY05vUENRYkM1?=
 =?utf-8?B?STB6bkhUU01FcU5URW5VYUYrb0IxajRSRzFwYTNxNlFta21NZFRoQzlmT0Zp?=
 =?utf-8?B?RFNpRCtvTG1RK2VQeEJnL3FvUFV4WTNaQWE1Zm0zRnNnODYwZnUxdGpEeDJV?=
 =?utf-8?B?QndXeU1US1EzaWhLbXdpaXZpWmd1VnF5OFArSC9ISFQ4UjdjSm1rbkJFa1gw?=
 =?utf-8?B?Sy9SM3RmdE5aU0ZHSVZ1ZjFIUU5iV0NmTEY0NVBVQkFGK1kycU5HNS9aZWQr?=
 =?utf-8?B?bmxvVzI1UytjTUxNUEFBenJQb2Z1UGR0bFR6SnNCWEJvaGR5eVNEdWt3WGtu?=
 =?utf-8?B?TGJLZ0h2Tm4zWEl4T2Z2QW92QnRkc2kvdXROU3I1dURLYTNvL0sxdmZBVW9R?=
 =?utf-8?B?THowbjVDUDdZNDlEdndWRmVQRGc2WElWUHFzK2FhcXd4U3RSVWpudHdtcTdu?=
 =?utf-8?B?VUMrTUhrWllzMjVMSEpIQ05BSXhoaE96OGtjNUI0bCtva1hic25iUmdudUVk?=
 =?utf-8?B?NDd5TDdyZXhGd2p6eUpYRlRmUVRCbDNYclg5dktsU2M1Zm1WSkI5bElWaExI?=
 =?utf-8?B?aXRGRUZtSVdHc044SCtsRno2Q3lnYjdub1d0MTB6bTgrWTBZNlJLdzFsYWNK?=
 =?utf-8?B?SjUzQUpUcFZuZjRSd2IzOHFLL0YxRGZ6RWo1eE1PaWZvakdsVGsvcEMyUnR3?=
 =?utf-8?B?WEUvNmNRdDd4MklGSXo2UDZyTWgxU2l2c1ZjelB0Y2VGQmdzWU1jVkQ0M2dW?=
 =?utf-8?B?R0hLNGo4ZnVaS3orekhWanRWZ0hhTjBEUW1ETkVYUlFHR1VVVnFmbDVWNlJ1?=
 =?utf-8?B?MkZvRnNEYkhoeFhDSktVQ0xBUkQ5bjRSZnl6YkgwTGRicW05VTNFYUNSYUhy?=
 =?utf-8?B?Z3RFUm1FQkxRY3BuWWFMTTJNK3ZOUjM2Z0pUMUtYS1JvWnlocWxiUVllMHFX?=
 =?utf-8?B?V3IyNElSRUFCRGhXaGJPUHJUbUNCUnhPM3VORXFOQ3ljQXN1STFyTEJSQmlT?=
 =?utf-8?B?RUhlei9rampLUmp5eE9jckY0RktwV0lnaUVkUFVubDBMNTZNOGJoRE4vVVFH?=
 =?utf-8?B?TkRxYXczeENzWHFnOEtHRnJsUUQvcWNLU2MvUHNrNlpHbFNVTkdxK1pseGMv?=
 =?utf-8?B?RUZpODdFR0dCcjRKNHFxTkswMzg1Z1NsUEJRd1BWdDlhUXVmU01oZWZCYm9j?=
 =?utf-8?B?QTlOekorQXlWaTJkRXZ0d01md3diV3M2bEx4YUQ5MW9PQ1hIcUM4RDMvenpO?=
 =?utf-8?B?L3M0R3pnWFVxUWdJbDVlbGdKYmZ3V1lFK2xxdG5HSVZVbjBpWEVFczFpK205?=
 =?utf-8?B?ZzNGVXZKSy9XUjR6bkZ6WUlwdnk4aE1SQXd4NFNzVUwwaHRTZU0xZzRyZjI3?=
 =?utf-8?B?MHhuZHQvcUl1NGkrdjlLd25seHFab0Z6aDRiV2VYVHg4dmU3VGR6SUo0RnlZ?=
 =?utf-8?B?RGhFWjFEWWlKN1JQOWYzbkh6YkdPWkZDODhzb1hKc1VMRW5MRzhpMXN1a1lU?=
 =?utf-8?B?MXVkbUVTamVLSnQ4dEFIRHdCK1NKZ01ZRUg3REtHTWdVVTIrU3V3RDh0czBu?=
 =?utf-8?B?eE93c3V5K3NTK0VmQTZxdjg5TjRnc3VtaHI3STM2NUM0cDBmd3VjWGF2eUxU?=
 =?utf-8?B?VVJIckNVQzBqaG1wZVFQZ0RWMVZ5bWZJZG1nTnE4c29sRFk0N2IzNWRQb29n?=
 =?utf-8?B?YWxpYVVQSCtqbFEyQkI2bHFHZjF2bEJzRlZ2Ky9PTHBBNWpESHc3aDA0N1FC?=
 =?utf-8?B?dkhWbTN3SEdvOXZEMDh1QWUzQVJlUmg4RGYxaEFSZnhJdlpJdmE2NG1WMFRp?=
 =?utf-8?B?TVBpM2d1cUxheWxrMWQveU94SjhZSDBGc0E3N2kwQWdIaXBjQkNiZERWNDZS?=
 =?utf-8?Q?fnKil0kOu1IBc1QJJ+LlhFlV33N0OM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d1Y3R2V5OU0wTEhXZy9BZlgxVVRwVUt1T1pTcVFCaElPVzFCQ1JhemhvUHFW?=
 =?utf-8?B?MFdwVm9sbW5CYnpQcEhxN3g2M0tncENLTDJ1b2ZlRjlnWk9nWG5vWW5xb3Jl?=
 =?utf-8?B?QjlUTEZaclp1bmtWOExzcWlrSnUvWG9XNWRueXFNakdzU2p5eG9SV1p2aVB2?=
 =?utf-8?B?dlBVL1dKWCtSUXVZaXgzcjFEd3JwSkdndGZLd2NBS2dUWmdNMUltdGl3ekdi?=
 =?utf-8?B?cVpHSUVrK2lnUU1JanBuVmd3UDJoRzhFbGR1Yk5CYUZLYnRackRUNDlyVity?=
 =?utf-8?B?SHlRRStEaE00NS85dUxtbm5ncHRLVE5jUGNVSzYvNEM5a0d4VmpWTzM0RkJa?=
 =?utf-8?B?MURwdEloeWFINk9DU3lSYjQ4dFI4UGxKMm1pb204WnRhWm1LQWxLUDlhZXFM?=
 =?utf-8?B?Z2ZzQUVpZ1dvbjZnMFN3UE9OUkxUMVdZVU9LeDZoQkEzZ055WHdENE5tWS9Z?=
 =?utf-8?B?QzFLZVFPSmovUk1mZ3IvVGhXN0FBZWdzdTdSb0NLZ3NYcEU3dGtjQllmQlBN?=
 =?utf-8?B?Z3RmY2Z2Vjl2Vm9WVW9RQklvcHFacHJEN2RNZ1RuNnFjdGQ1VjNJdVl0aTAw?=
 =?utf-8?B?bjdhRDlTUUVzeExDYXdrVS9RRU80aDdLS0I2QTFVbDBsQ3NaalNnZW9BbkdL?=
 =?utf-8?B?VytkODhCeWdqaFgrd2lNY0pzZGZteEVxUzNacWhyczN5dVdyaXFpb1lUTHdv?=
 =?utf-8?B?bU96a2VDeHVsVzQwYVArRzk1Wm5pcFhaQkwzVFhrdUErY2J6UVhlUndiclhJ?=
 =?utf-8?B?Y05TalNMeUhnb2dUa1Eya0VEdUhtZExjTmVwWUVodnhrWkYzcHJJZFFzR1Z4?=
 =?utf-8?B?VkJKVTh6RnljeXVlMWhGSkVPUW81K3h1cVpQeE0vdWpMSHFIY1BiWkcrOUhR?=
 =?utf-8?B?VHAydks5amQ0YnZvaUV2Q0NUUStTVFN3RHZvYTlnb3ZRTW1ZdGo5aWJGUEZQ?=
 =?utf-8?B?NUY5TklNRjJaYzZ3RUZDVHNDSWJkVmRBZDhSOVJyanZGT1dkZUp4QXJUTXhM?=
 =?utf-8?B?VHpRc1ZFWDRkYldiNkpYQVNPdzFWSGk5bnBCcG1kbFBGR3FlL3BDbnphb2Zi?=
 =?utf-8?B?T0RhUGZWMXUvOGkwNiswYTFjODdselRzZmJvNG12dWZPWEIyazhrY2VObTFJ?=
 =?utf-8?B?bDJBcjFDTlN2M1VyM0liamkwVld5bGZwaUxBcVpsZFd2NlQ4K1ptdjMwZlJS?=
 =?utf-8?B?S2V3b3Z5bk1TZ2VxQ0poMmdyUzZmNkpIRW84alhrME12U0JPeERoVWtCdGsz?=
 =?utf-8?B?dlBJYWZWL2M5MC9DWWRpcmRIeWhHQ3cyV2dXWEluV0xJUzFNMXRkT3NSWDBX?=
 =?utf-8?B?K3lzRXByYXBOSWpuS0hYa3JPekdyL1dKTUZSR3FobXZkWlh4MWJsVkFpdTJB?=
 =?utf-8?B?d0o2YjNpVm1jSFNYUmRMVzdoWTVUckUvcDhKWVc5VjlWZHJQVXpSUm1jRzUy?=
 =?utf-8?B?OHFaLzNOVGN4NEg3UlE1Wjd3NWoyYWk4angvTjM2c0VkMjQ4WWVBcUc1eUZD?=
 =?utf-8?B?bEpGd0tVZDJCUnRHOFdTQzBSNjdwaUJ2c0N4RVluRHFIbzRkVXhwMmJhTGli?=
 =?utf-8?B?SVhPSWM1alRHYThTdXl2ZlY5Z2NpTXFkblRyNmlsYTRycWdad2FrR01qSUtK?=
 =?utf-8?B?MXVqK3FoeTk4akhaci9JYnZqN1ByUkhHNzNEVFJZUTFEdTdmUlhPV0sxR3pG?=
 =?utf-8?B?eTg1eEQyMyticmpzaFl2T0U4NVo4THB2T3h6c0VqbE5ISDBTWENZYldId2NP?=
 =?utf-8?B?Qndra1gyOFIwV0FoV1N4ZlArZ2p5TWw2NkNXYjRwQWIwaGtEcExLR3d2Rzlh?=
 =?utf-8?B?NFREZVlXMDhaWWlBVWpoN1FQSlR5c2ZrSlN0eS90N3ZxZTJkTVNqeFp3c1A1?=
 =?utf-8?B?MHBtRXM3RUJiRkxhZE9BeTVWU1VwL2VnU0RMTy9JZ2F6NE9VajB0RDQvM3BH?=
 =?utf-8?B?dnNOS0JmNDQzd014Skord0N0eitCTEdjMGk5Mjd2S0Y3NVJvM1dObloyVHdO?=
 =?utf-8?B?NjRaVTMrVjZ4VEV0dWwrN3ZTM2YyR2loc0FYNDJGYWd6Tm55WVViTU1QeDQ3?=
 =?utf-8?B?UjdIeFpwOEpPSm8yOHN3cVFianFKNWFkU1U5N29qNTdWV0ZzUS8vamowMFM1?=
 =?utf-8?Q?C+UfNAhDQe1Ab4DxT6mGUsa7P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2e51e1-ddd6-462c-86f4-08dd995a3152
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:58:01.1583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SK3XLO/ZwgidJ+MrKedDP0Ffzb9vSPm3AS8rGEa5RsE3B+1VPzFMHouUuXMNaNRtwJIR4+5bbeuCC0npkhzCxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
connect different CSI port. So use dts overlay file to handle these
difference connect options.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v4 to v5
- use fullpath for csi endpoint

change from v3 to v4
- add board level xtal24m
- remove reduntant ports information at dtso because chip leave already add
it.

change from v2 to v3
- remove phy nodes

change from v1 to v2
- none
---
 arch/arm64/boot/dts/freescale/Makefile             | 11 ++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso | 64 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso | 64 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 58 ++++++++++++++++++++
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso | 63 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 36 ++++++++++++
 6 files changed, 296 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d1200..d376b4233fe8a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -301,6 +301,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
+
+imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
+imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi1.dtb
+imx8qm-mek-ov5640-dual-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo imx8qm-mek-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-dual.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
@@ -311,6 +319,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 
+imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
new file mode 100644
index 0000000000000..7510556323b1c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi_0: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi0>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_0_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi0_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi0 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_csi0_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_0_ep>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
new file mode 100644
index 0000000000000..080e31cdd7d3e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi_1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi1>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio1 31 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio1 30 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_1_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi1_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi1 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_csi1_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_1_ep>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 68442c8575f3f..503e0acd7963d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -32,6 +32,13 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
+	xtal24m: clock-xtal24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal_24MHz";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -155,6 +162,27 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -824,6 +852,20 @@ IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
 		>;
 	};
 
+	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
+			IMX8QM_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
+		>;
+	};
+
+	pinctrl_i2c_mipi_csi1: i2c-mipi-csi1grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI1_I2C0_SCL_MIPI_CSI1_I2C0_SCL		0xc2000020
+			IMX8QM_MIPI_CSI1_I2C0_SDA_MIPI_CSI1_I2C0_SDA		0xc2000020
+		>;
+	};
+
 	pinctrl_i2c0: i2c0grp {
 		fsl,pins = <
 			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
@@ -1017,6 +1059,22 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
 		>;
 	};
 
+	pinctrl_mipi_csi0: mipi-csi0grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xC0000041
+			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xC0000041
+			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
+	pinctrl_mipi_csi1: mipi-csi1grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xC0000041
+			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xC0000041
+			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
 	pinctrl_pciea: pcieagrp {
 		fsl,pins = <
 			IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
new file mode 100644
index 0000000000000..153fca99af299
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi0>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 8 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi0_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi0 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			mipi_csi0_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_ep>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 44bda183492cb..c95cb8acc360a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -64,6 +64,27 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_pcieb: regulator-pcie {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -789,6 +810,13 @@ IMX8QXP_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x21
 		>;
 	};
 
+	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
+		fsl,pins = <
+			IMX8QXP_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
+			IMX8QXP_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
+		>;
+	};
+
 	pinctrl_ioexp_rst: ioexprstgrp {
 		fsl,pins = <
 			IMX8QXP_SPI2_SDO_LSIO_GPIO1_IO01			0x06000021
@@ -829,6 +857,14 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_mipi_csi0: mipi-csi0grp {
+		fsl,pins = <
+			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xC0000041
+			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xC0000041
+			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021

-- 
2.34.1


