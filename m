Return-Path: <linux-media+bounces-25960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33038A2FB35
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7686E188585B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7E924E4CB;
	Mon, 10 Feb 2025 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bc9ynw8Y"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462024E4B6;
	Mon, 10 Feb 2025 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221207; cv=fail; b=kqUFmXTv2hFcJctIkLVMvkiLWDlyr+G+DZ/eSy+1PVUBTxSPfBceJEzQjKnCw7diBuRrHuVPNu6AzabQs3D6VUKrwoBlilmQxgfc1NLBnKHN1UIy4ZZyODkgiVAN7t4QJk49UDm/lGibHKSshyivq8hv6ByeCo43jMIvK17CDUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221207; c=relaxed/simple;
	bh=5ADr80w8wgeP91LW6+JILnr5BnaCeQlGDcAnm8jSWQg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=coAR52t9vO9KLCfvsgVsJixmcqv9AMvuATxknk9ytEobY0BqfDiMMBxLucESiJsyWgqjOn1dirijQ0hU85Pqp9fgutiTP1R/h8lUBbmR2RHBopD67QAknw7saQK2cn79esd48hj2neglcTfKjL2/VqqQN94LMOMNH2Jr5PuDh0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bc9ynw8Y; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6fBMHs9JoDdMv2qwxSpEF6AVzGE/cs5lyLM95Uzus0jwzYtd1WD5eWAK868xF2wEls9u3AGHSOFXj9uUJ5rpC/iG87/tqasTqjdQJK/yBfje0Ef5Wir6gBM74xmld83E3mkyZx9r1kaeQl51IKK3urCN/v7qFtmPeMY+IVVJX86Gk1BTkHqSjDbRRVkUxzYahRtej9pGfSDkZc7F3fPlS01tey9iHdhD3IH/9fCdNlZoO/RgeysFEMTmgnTRlTHz2jfV299SpnNnnlgVxjrAITY1NZp5P6UdhHQ5YHBP9x/9bUXmaLeznqAGVHvnTV14wJXnwRhEp9IDoKwvzSlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgA4SwhjKnQ4l8vU8pQu8DZo4P/OhoE4ZMNwYY3H92k=;
 b=YvuEJsj/y5qWx5CsOAMAuMVChTnNtqgDYWNwFzJp++xCOoVAbG9ST5jxtH+Gnj0LQEOcQo1+V8I3RhSmyyThZlV6CYU/GJU/Xq0hvgk4TI61uvURi9k5ogX2m4JEfB99xSWvmww9N14tCmuZfpgHrmb4MlfivIsZ6ANdjJFrqftR6ApZicSoFK8p82S9eSBjYIt9fbgti7VnEVCxDJW2/wNP5hl6wfiVjyAIiaeziIZHFt1QHRWpOCwKNd7FnWMNzqq8quPMvO5xh4BzR64+g7b37XrsC3H4TY6iYpisFNL0STjz/2zMxQMtrx8zcKiCZhclpDM37nMAj6rcq1vdrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgA4SwhjKnQ4l8vU8pQu8DZo4P/OhoE4ZMNwYY3H92k=;
 b=Bc9ynw8YjllL8yhFNRrF32kRRq4pKaN5YI0cYfMrDxPPYpCmzI7obe2IfGLVrRIi9xEXzUAm/XKDCiKPSSIfmgsFcZUi+mdtlIj3PH4EB02EVqajLaBmFKxs8ZQhMCAderK/JNEeJ7XnT+rTLt8VjOsOctnvl0qlxzloeO2euAiz9SeYG8aeGfPbELUaVcqEFEWbGgsDxa1ALzjoW3XoPnxZ4QWXd6VlJQCYCy/AMMMU3nnpdO6SOZC7v6ob2h2V21qLvP9b4ihOnSJ7V4jwQy2na6egWajJKFjlCb/fqh+pvjHrIhFKu/6AR5VGi/j80IegG/6CyT17j6IL1LvvXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:00:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:02 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:22 -0500
Subject: [PATCH v3 03/12] media: dt-bindings: Add binding doc for i.MX8QXP
 and i.MX8QM ISI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=8382;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5ADr80w8wgeP91LW6+JILnr5BnaCeQlGDcAnm8jSWQg=;
 b=Ba4sXYDME/Tc/RaSmmV8iDKndSBpclCil9xm1cYV6ZvmNZ3mDkA+oKuRZYOUqCO+DYfeJ7tB/
 HwKJGAYjELwAodHGsGmf/oYQcKCJ347QdZVhmo9deA64v/FN1Qe1pzo
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
X-MS-Office365-Filtering-Correlation-Id: d0215a88-e7a3-47b3-be66-08dd4a15e384
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|13003099007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RnpZT2Rpdlg4T1haenFJM0lrYXc4T1hLKzN6VGxVV3JqZDhUR1JHT2JEd3FN?=
 =?utf-8?B?dUxPV0tCZUhFdjQ4eFRqTkg5Q3dBYktaVHhUcHQ5Z0I4ei9kQktSYzc3VHdk?=
 =?utf-8?B?SzcvVkJJUVhkYzZ4MndkSCtwcGJMUGdFTXJGQTBHdkFUQTFhYis0eFZXamlY?=
 =?utf-8?B?aXVwcmJHNUNxQVVVSUNVdzVtZXBvWjVyc2Q1NWtsd3BqUTVFV01xaGdyZjNv?=
 =?utf-8?B?MUpEZEVhLzE0THM1UTkzRkpVdWZhZExaUCthUUtWVTF6LzdKdXk2clovb3VX?=
 =?utf-8?B?c0NjQTRTL0RmMmszY0FrQ1hXU0h1SEJYNEhOeWh6dHR2aVcrQ050MzRMUms2?=
 =?utf-8?B?TW0yaTI5VjhYZ0YycEdVWWRycFRmaDFoM3FUdGpGamdDdGdhNHNkZkEyKzdM?=
 =?utf-8?B?YkxQWGQwc1dMbkV1OFIyT05ZRXoyN3QycEl6YThLVHZRUWRoY2RkTU9mZHZ3?=
 =?utf-8?B?elZkeVBjQ0lDT0kwQTJNcC8zNXltTHVnOEdVYkdmQ24zUWhmTHU2YXpGcmUz?=
 =?utf-8?B?clV2WkdJMjkzSHJuOWpHWW82NklSS2JLcU5tRm15ZE9NUVVPRzdocS9IM2E2?=
 =?utf-8?B?ek9DeHNmb3I1anRpeDllRnEyWnJZQW9Ec1FTRmxHU0YyekhDMm5DZzIrckgz?=
 =?utf-8?B?Sm45Mm1wdE5oTEhvZUo0Q3p1SVlPNHRCa0UybEs0c2J6U2d4bHRVM1pWWVBr?=
 =?utf-8?B?a3BRYzBOK1Q1T2RGODNRRXR3VmpZRTRucFhWMWlCTk8yNitqaThJSUxpSTc2?=
 =?utf-8?B?WlF2QnRPNCtXcDRWVGhRUC81VmpOQmtuL2ZHRGIxUGRXU2VocXhlaER1aUY1?=
 =?utf-8?B?Ui9Ga2pTS3FJL09ORkhHNjRqbjlmdUV5c3Z3Zm9XcytoZnFlaWZOTllQazhQ?=
 =?utf-8?B?VDlvQ09kelErMEI3Y05CbStyQ2V6K0ZDNkVtSjBLWE5iQVFERnNUNVdxVjY4?=
 =?utf-8?B?UUpnTGFGTDRLc0I1VWdQR0U5UTZETlc5cnlaaTRqWkp6Tk5Vc2ZObzg2M0hw?=
 =?utf-8?B?dHdna04vYzQyNlhJdUpXZWJ6WlFwWnNDYm1Ec0oxZTlHZXlBTkFCcTcrNzI3?=
 =?utf-8?B?cWJBQXpoTEN0VFIzWC9ROVZkK0VueEQ4N3dDd1lFQTZBQ1lXRXVQb3VxRC8x?=
 =?utf-8?B?dUU1T3dWaFhaTWdxTzdTRW1NQzNKZHV2d0ZtZXJkK3lnOU8zQmxyUnBFVXJZ?=
 =?utf-8?B?bjNITnJzNUFnUGRqYW15cHAxbDMySnBOSVNQVzIyZDE4RGlRN0xBTXZ6SGtM?=
 =?utf-8?B?WGY1MWxZQXpPSmlGbEpWdkMxdms4MXV1a29ic3VycVh2eGF5bXhXOHJpaHQw?=
 =?utf-8?B?OFB1Q1NyV2hXQUgwTXZyd3VsY0lsWHV1Z2JPM29DcEpKTDVDbkNIa0M2d0Uy?=
 =?utf-8?B?c1JJd29ieG55YjYvTThvMkdXK3BFWld2Y0FtVDh0TlkyaVlkTGpBTUdFdXNs?=
 =?utf-8?B?a1ZGcFByZFpIK3hIdGV6SmY1ckorVVhadERUb1BVNC9qTE5GVUZKVE9KSGZF?=
 =?utf-8?B?dDVNR2JhMGdRUmYzd291K0hYVWQrS3Axa0Q5NFBnUlRaRXlLRFhVdUNEOTBm?=
 =?utf-8?B?aU40bTFLNTM3NjkwU0VmQ1prUHBJWjRaRW9VeGlDYjlVek9zRkVoKzFQaVY5?=
 =?utf-8?B?OE1rMnhNejFpaFNsNWt0ZDNyZzQwQVJ4c0J6ak1JUXV2Nm9IZTRLUkV4K1NM?=
 =?utf-8?B?VVkvYldFYlhmUjY0V3FzbVFLN0ZKcGw2SHBOdkZXSHZhUjNJa1J1Y1Z6bFA4?=
 =?utf-8?B?YzVtMG92SEJndGtOampZa09DOGRwbGhvbzQvK291MjdLRHRwWXpoNEJxSUpM?=
 =?utf-8?B?dllmVmJQZWtSTVkyS3FybklhKzNDWE04SXZhSC9xbEF3dy9EQ0NJM3pIRjA5?=
 =?utf-8?B?VkhBc1E1ZEt0ejVyUFFhYzdEUzg1aSt2T1VXdU1CWFQwWmc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(13003099007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WURyaDBxNmtNQU5ieE1zbmRoK3k4cVoyY1VTT2U0UjJSbk42OGZ1R3ljNmkw?=
 =?utf-8?B?QzZOalJlUi81Y0cwcXJ3a0ViMUxpWUZ0cFVCQy9GNTUvamNxWk94aHZOZmVv?=
 =?utf-8?B?Z3dHRmZqdVIyazE0WmJBWERZbW5CYlZTUTZJcnk1bGpkVHgwOXBxNmdUV1Uv?=
 =?utf-8?B?TVhLRDl6K1V5WVFIOC8xQkZhZHFTdGNVaDdJZ01vbVRnZlh4L2MzS0FaVEFM?=
 =?utf-8?B?VU5xMXcreVp5M3VUeVZJSURHd2Yzc2E3elJBK2FGajRCa3NqZFdlWDdwUk83?=
 =?utf-8?B?dE45a0RSVy91Y2JUdTVtc2RGWC95L3JXMWlXalF6TU1OTDdZNkVtTnc3VmEw?=
 =?utf-8?B?U2tvTTFYdUVtWU9Qam5DM1NwVVp1cmNybUFRUmJGM2o4cmVwMDA0Q3RlbER2?=
 =?utf-8?B?QllOQ0hLZTVYQ0w0V25jcytlRkRla3FMZEFKdmZNb0pqWTkva3ljRjFBMTc0?=
 =?utf-8?B?UG5mVnpJdUJPa1RNQVlNQyttOVdQRzVkWkU4Q2k4QWR1L2pCM2lYNk5GSGkr?=
 =?utf-8?B?bUkrV2N3L3l1SkRoMjRxTXZiRzN2dlZOaVk3b2VhZWNTSUlYa1Jyc2dBNFBo?=
 =?utf-8?B?eUw4ZXpIclhidVh3M1c0aWRmS2t2UnErQzViTitNbHlZaStIM0RWUTBsczRz?=
 =?utf-8?B?dG1teE9RbTQ3UHJKZzdnT0VvM1g4S3Z3NkN6RUx1RTg4Zk5TV0ZoQ2paTmRy?=
 =?utf-8?B?NzVBUzE0ZEJRK3VEYVZQMU1Td1d5bysvR0l3NFNaSjFuaDFYRU43cjNTcFFr?=
 =?utf-8?B?bUVYbzRlSkllOHVDVXVoOC9jMDloOStZYUd5eHF6dEZGRk5jM2VIaVUwbHUv?=
 =?utf-8?B?Z2NTOFNtM2I1RENmN1VyT2V0dUVBcUE5SjljWGRkUHZvV0tHdlF5QklzKzlq?=
 =?utf-8?B?UGlKUEVUL1FXaC9TZGI5RkFXTlRmbzdmVDQ4NkJGbi9Oa3NuaFErL2NhakFI?=
 =?utf-8?B?eUtkUEgzWUlGNjUzV01oUGJKZ1Y1ay9BSlAzVGc5SjYvNnRIVEtxYjFQUStJ?=
 =?utf-8?B?RGpSL1FTUUMwb1diZzBaREdsNVJaWHFVWmxHY29nVEIxNDlnby9tLytHQi9y?=
 =?utf-8?B?L0txS2hIbHVlVlhHQXIvNXdKOUdzNXp5K1p0MTltRXA3dFk5NFF5REFVYUJX?=
 =?utf-8?B?WU93Z3BqVTRTaU42R2xuRXoxVXlOTDRjV1A1VmZGS2RDa1VzeHlOMUR5aW8w?=
 =?utf-8?B?K1BSNS9IODJkSnhtY2ZrMGZPWXNsK2lPcnZXanoyVzVmL0Vud0hIRVZxNERI?=
 =?utf-8?B?TjdiN1dhZGFlV1Q1Uy9zeWUySG1vK0hocUc2RUZ0dDFWUytGRnlrY2NZOWxz?=
 =?utf-8?B?aWdBaGtqMWZxUDVCaDlHZ0dPVlR5Y2UvT29ValROUktUZTV2dnRPY3NYbGJz?=
 =?utf-8?B?amkyOWt2VjF4UisxT3FkeVhXT1dzR1RJTTEwamxybG5QZHZFcXFvVWJWOFJk?=
 =?utf-8?B?YU1uSXdTc3JOUU8zUzBuMUFHeW9yWk9kZ2R6Um9mR2NzS3lLK2N3Tk5WSXZC?=
 =?utf-8?B?d1J4Y3hobTc0end6TjVXbC9QWWZDeUtvSWlTSE1xU3FSS3ZRSHFIQ2hOM0lr?=
 =?utf-8?B?eHBYMHBBbklKTkZoaDdPc3lzRENxNjNZSGFkMFBLQUxiczVoak1FWXBxLzZT?=
 =?utf-8?B?bTNNVXd0T1Z4SzQrTW1Ma3l2MGhlUEFrNEQ3K2luZG16UFhKUWNZcnl2bktW?=
 =?utf-8?B?eUxRajJZSEVhenRlVTZhYnZ1eWUrUGFGMzRiT2lSU0F0RTdEZ1Y3WlNyODR5?=
 =?utf-8?B?RnltZENqZWV3MkxvOTlTYTNHZWxYbzBBTnoweGhzd1NhVUNLeEZZS2dDVkhs?=
 =?utf-8?B?ME9EYVRrVGhoS2FyeGRNQVNvZ0FPb3ZlMVgwWkxBK04xQUxyMERjVSsvVnk0?=
 =?utf-8?B?TTRva3lyOTdSZm9GTGFwSEZ5blNMRCtUdWVxUDFNMU9ZZFN5dTBUeEZBN3FR?=
 =?utf-8?B?L29iakhLWHFUTUVjWThpS09iOUtGNUVBWkQ2aTNQWjQ5SkVKck1CK2lHZDlx?=
 =?utf-8?B?cnJVQjFmSE1ESDRFVE9waktWRTZFb2ZVMFJrR05HTGczcHplSFdPMGdrbmRa?=
 =?utf-8?B?Q3podUJyVDZlZlUrNVhTMFJkNWF2bExVdTNMQjBaS1haVml1cXY1RFAwTTRC?=
 =?utf-8?Q?84x1Q4yBS+mVFOV+nK2fbOsUT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0215a88-e7a3-47b3-be66-08dd4a15e384
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:02.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSntmx9emAaE10LBidEYfn2GTmwqIncWg0t4rQ9s+ZEFOgJDvsHbMK+400ZKcpUBJx5eA6hTvR5YY3ICts8uMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
power-domains, and ports differ significantly from the existing
nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.

Add new file to MAINTAINERS.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- none
change from v1 to v2
- create new file for 8qm and 8qxp accroding rob's suggestion.
---
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 221 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
new file mode 100644
index 0000000000000..61c551673e2a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QM Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per1
+      - const: per2
+      - const: per3
+      - const: per4
+      - const: per5
+      - const: per6
+      - const: per7
+
+  interrupts:
+    maxItems: 8
+
+  power-domains:
+    maxItems: 8
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 1
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qm-isi";
+        reg = <0x58100000 0x90000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per1", "per2", "per3",
+                      "per4", "per5", "per6", "per7";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
+                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
+                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
new file mode 100644
index 0000000000000..818fea0e4679f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QXP Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per4
+      - const: per5
+      - const: per6
+      - const: per7
+
+  interrupts:
+    maxItems: 5
+
+  power-domains:
+    maxItems: 5
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: CSI-2 Parallel RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qxp-isi";
+        reg = <0x58100000 0x90000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per4", "per5", "per6", "per7";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>,
+                        <&pd IMX_SC_R_ISI_CH5>, <&pd IMX_SC_R_ISI_CH6>,
+                        <&pd IMX_SC_R_ISI_CH7>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 40d1b7ec30fde..f243257ef7653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17000,6 +17000,7 @@ NXP i.MX 8M ISI DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
 F:	drivers/media/platform/nxp/imx8-isi/
 

-- 
2.34.1


