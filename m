Return-Path: <linux-media+bounces-33188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB613AC12E2
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 20:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE7E1C01756
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E73729C338;
	Thu, 22 May 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PBk/3T1l"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F229B8FB;
	Thu, 22 May 2025 17:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936676; cv=fail; b=L0QVflmOaoI4tAekveSQT65pkBR59FhuIOwiD4pB/O6+dp3bvLGc/oBOIUwqZTD3R2LnIAF7TkFt+N+bB0MCqV6X3qRGFwaC0sDru4F9A2WCgAb+5RWJZEbuPWA+xBPyx45Ys9w08PPCt9pAmrkoISvzVS+HWLwPOcudWk57+UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936676; c=relaxed/simple;
	bh=oW5ipeKWAHmosKFFGfvIRVJLzT1z/FcSu6Yka546tVw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qA9oP4fiGKozxg5JhgEGXJqkUD8rcF7XdLYSWWznuVCZlb6Ei977tzW+QvMNEh6qSxFl4pqCbUBx83Fwc89nTcVGUxi+8CEptouwtyy19sHiWTk8UQEwhj3v6M5ZwXLJeJOwfKBYRVGIwFYmv3pP67kmcLIIvxnAaTOCEvjMxyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PBk/3T1l; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYzQz1TpNLTT4ZT8VAQVLDxmzLylIJuJWT2j5LqKzw46Uk3Qk72HkzoqJoUBW3Wm8NTQOsrR6Yv0kzT97x4pyCswfGiG4vZIgsGo8j0+FpC1MY9v+hrG8nZRvCYhtpHq8Jd24A5gentV2k2nk7q6Rle2Keo6ovrcS5Vem/ZyZkGMIcCg1Q+jxc2I47JP5WXWjJOjO46LmO0PiX+x1BsBGzs0iRLdXTeND+ot0EMTWh9CenJx/e5HbgEpxsVt/aXe3SdVSURDrpZMLU11UU1ASAsKNvogDTZnVV1pyokrSEm2zKIl6sgO/evJSISmxOrA6jIESZF6SlUM0r/gHv1Anw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsmGa4p3hq8x8QvfgwAJcxEfigVWmO2iO73/gHLBBBk=;
 b=ymBxbf7+t4tCUTb9zH6BS7CstJPCgNCDwCKNTq/bIuGz9m0+qNV9OdBmT/EWaS6v5LbWwgg1dsROs4Jy3mmVGEhtNerbjAWrdjKGkRMszWqzKWqNO7M7nJkmDUCfwcWnUmeER6sifH5ZgDB9VRShvntIwnoskDBiomscHwKLL5FNZC6OtVavECdCqMNKPK6KcUUhGcUdfssqzy8ckAqSshGv0VM8iS0zuNLoxX36kZJX/NUVpcHtdofo9kYgjOiAgg4RQMYhQfCH/Ktvn40YEOPKMzm9ADX77T5ZhziUMaq2/VegmtXXcNoYUA7mI4tDQvW6RTgv/BhZYBNTi+vLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsmGa4p3hq8x8QvfgwAJcxEfigVWmO2iO73/gHLBBBk=;
 b=PBk/3T1lZvDoglmiRaNVv6ixdiMPU+LfkJcqZUmWqu1Z3+zs6O2COsAAO2upH9ef1U7bq/I9aUAPeR+kV+l1ZD1MbIU67DZXCn+acW+4+eMVmRdy66e/EzHVbwoVRglut+LDIXsyU6OcQZKoK8HDatsKw4RmcDi37618N4a3hT1XPuREeMIfacLZ4b8vofNxKPlkFshlF1fLwcxnAR2cqyJOQdZVOvS/0SuIudWq3r7oHdGfV5L5n+b81doWbjAVAxuHeOE+NajNqn/JsB2frGsiVoLTo5d6VUz0n8iZiDZc6vfLAWCkNWAKfzHeD3zyPp8riI9VCiFXYY0fQDEiwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:49 -0400
Subject: [PATCH v5 11/13] arm64: dts: imx8: add capture controller for
 i.MX8's img subsystem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-11-d4be869fdb7e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=17996;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oW5ipeKWAHmosKFFGfvIRVJLzT1z/FcSu6Yka546tVw=;
 b=RAUy60Wwe5S6NB8hzDCVM/fyNeu3Usc/R1zNriZYdoL+VFMqJo5xJ79LyeD3Mwh4UZhldHNiE
 ggGbGbgBQv7BF+5AekpUQAGuZBcYYXRvf50+5CwWcLpm0WOvEj56VSX
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
X-MS-Office365-Filtering-Correlation-Id: b610eb57-dcfd-4bf4-26e0-08dd995a2b60
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a3RVOWVJZDAwbHZHNGl2WCtTTTdXWHZVSDJYbERnTjVMUnNsNGlBYnpGNk5t?=
 =?utf-8?B?YUFWaDhycE1oWW5PRXEwOHVUdWx4eHdDMVQxcEh0QkNjOGl1ZnJ2bVVtWFZI?=
 =?utf-8?B?RXhINGd2ZGRvdFBtS1F2am5KdjVIQ2RRM2o2d0NqTnRPWDg2S0F2ZXJQS0FY?=
 =?utf-8?B?VU5kdEtxMEdXK2dud3F5Q2RKdXVUMVIxNG5iNWdMYm1kSVlYOXRWTGtNL3Y0?=
 =?utf-8?B?SFlNQXg0cVpaNXJtSXhXdkFjM045c09QQi9VTXVkNnJCb3dRc3FGTlkwWm5z?=
 =?utf-8?B?ZTc5OU1vczFjWjR3MXVvODl3ZTNjZFg3T2NDaTJiQ3NPbEtJU0poQ3R6Q2Zz?=
 =?utf-8?B?dTNCTElkQmNzMnF6Y1hIMlQzamZ2QjFCaUlBeEdxU21QYS92ZGEvMUlRVjhE?=
 =?utf-8?B?M1VaeFRqN1p1WWFiL01SamZEd0x2cUFBbmhib2l4RllRZCtkbUJiNHdyUG1l?=
 =?utf-8?B?OXZIMlZCL2FFbmJpaTU5czFJT1NuOUhHMXhCUWp1Ylh0UXJ6SUtEUmlFQ1Zk?=
 =?utf-8?B?cVVUYWxVTzU2NmZoVTZCc216NVY2Qmc0Y3E0QkF4WCt6UGJSZmkzVzJBMlhv?=
 =?utf-8?B?RjFlU0NVL1VhRXZQVHl3Znc2bTRUVjhrZTNkdzlicXM4NW03YytPVVpZL2Jl?=
 =?utf-8?B?aWM0NFF2ZG5rTzR4U3F0eXQxYXllNEZuZUVBSUlHT1RDVGE5ZUJkb2hDbDNM?=
 =?utf-8?B?d3ViWURJMUNveHNldmNEazR0ODRHQkthbUhFTmVTNzN6dG9mc2J3MTVxR1J2?=
 =?utf-8?B?SWJwRDdmSG91YTFVZUlOekFLdTVEcXFMK3h1QlNBeXF6VTNDSlVMb3YycTdk?=
 =?utf-8?B?M1h6cGdJTHVqdHR3MTVjMzlKMFB4NFJTY0x1UjNrMC9TMFhSbWc2ZGtwWFBR?=
 =?utf-8?B?a0k2aCtuOE9Gem9KKzBQNHRER3k1VERqSEthcmpHWTV6L3hrNE53TVNWb0dO?=
 =?utf-8?B?dkRIUERBTDdjQWUzVHRhV3BYQTBWOFRmOTZnMmdiYW1PSjVXR0Y4VFNna29F?=
 =?utf-8?B?Yk9aTjM1eHVUbU1ZMzFTRUsybEZRMkJnUjB5VC9uUU10NENTV2k5ek5uMDls?=
 =?utf-8?B?dmxsbTloREd6bkVvRVJLaVZMLzk3TkVRTmRHUW91Nm8rNE5wZFR3OE5qSm1P?=
 =?utf-8?B?bW1MRm1GbW5pSUl4ejhUZC9WMFBCdVVObjkwUG5YQitGamdlRkk3NENXb1FU?=
 =?utf-8?B?aGpUTk9uZkRsRWgyRUg5MG5FQVplWm9paVBFUzBmRmtrTXNJclJiZkZ5WHMr?=
 =?utf-8?B?dFdvNkJkSzdEeWZiaVJVM2VQYkF1amFTbWdNNGdyV2lJTnN3NTU3aGxnM2Rs?=
 =?utf-8?B?UTRuZzZxdmVHNlRocUFWRDd3R2FJN3ZrVmE4dTA4OWx0MTdsdklIejN5d09E?=
 =?utf-8?B?SC9USVE1bEcvUDZJYTRQRytCMDF5TGpNeUM4UVBwOFRES25ydXBuNjVXSkNp?=
 =?utf-8?B?Q3lxRFphRFdGM2NjRUtXM1IwcktsWVgxQkNHTE9CRzhTTXpLRlR2dTBSK3Fy?=
 =?utf-8?B?Z0ViZ25RMjhWbVMxS0RZWkhMcFFqNzAvbWpqdWZZenJxanFDZHA0alRicHE0?=
 =?utf-8?B?akF3SXRTTForQ0U4dlNQQi9XUFRYcWptb21JdDFzYUhXaXo4L1NsVkhLbTcy?=
 =?utf-8?B?ZHljM2lOUEFiNlAvQ0hUclkzUnc0VHRGQ2haZlowRU1SdlNnUTlGelFVU29B?=
 =?utf-8?B?Z2FZb0pOekFIY3N1enpPamltcjlXUHh3OUcwZzZ3clA2UE9nZzlvY2hzV1g2?=
 =?utf-8?B?OHp4MEZsbkc1QTdCenFJME1Ba1dYbnluL3VwYU4wOVdSUU1WWklXdzZXWnYy?=
 =?utf-8?B?ZEhPNWZvUVAzRys2M1RkRXp6V1Y3NHRvT3V1OUErUTQxMjlFTkpzYnpQTkZC?=
 =?utf-8?B?N203R3JSYktoUDJ3WW02Ylpuc0hCTXFVeGl6TVZjZVZWdWgzaXFORE0zdVBm?=
 =?utf-8?B?ZDdTMUFYQ3JlRkt0UUZyczZaZzZUcGFKT01LaUF6QmhySkpjcndKOWIrTlNO?=
 =?utf-8?Q?tLCIxO9iSyY8RLClw4sHWf+vic7CgM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZnRBQUo1bERzOVdRYVQydGRxNmNQYzh6Q3d6TzkvZVVTd0hEaHdYRmk1VUV4?=
 =?utf-8?B?dmwwYVl4T0ZaN3Q0SE5uWlIybjNkUFBZT2s2UytERmk5ZnN2TDR1ZXNWSHUr?=
 =?utf-8?B?RVB6c3RwcmdVc01qcVpxdnBaV0JFaXV4UUgvZjVEcUV3bnF3Sy9rQ3BGUkdu?=
 =?utf-8?B?aVJFdmVjTzF1M3NqVkdPQ2VEL3hEQS9UOC9LUFdUdDU3T0xEdy93LzBuSHlS?=
 =?utf-8?B?TFBQcGloRnczTTc4MzVTTXZFci93VVRBc0EzTExxQjduQVU1anZlbk9zSm5L?=
 =?utf-8?B?aFZpNG1waTd2U2NTbVRMdThqTE1QK2tZZnV3cC9rMEtBcFlCSW9KaytQN0FI?=
 =?utf-8?B?Z2p5aG9RSGRrYXpwaXZlQ3NaQ1gyeTZOdmtkUmpNZkFrTHFtUDNJMFRpYkh2?=
 =?utf-8?B?U2FnZVNTTFI5eHI2aEV5OGdNTTlBeEx4ZmF0NXZQL3pZTUhCS2lBMGF4ZkJX?=
 =?utf-8?B?VC9DK1A5eHA3YytpK0NiKy9TSGdKd2lwdWdqY3ZYZWxLWGREUlpNT0dpekxW?=
 =?utf-8?B?SDVJalQyTjM1ZUd6R0R1UllOMVZrc3hqZFV4RXlOZEVPM1JTK1U5S2ZuRy9Q?=
 =?utf-8?B?bVVjOHllSXFBci9nZXNXcm5yY2drMCtENE0wR3BoNHd1Mm9DSmFxRXJ4SkJN?=
 =?utf-8?B?d05SL3lySjJ2ckhUc05raDQ1R21kSWxYYkxiUUQ4MmtzRE1PMEVpZXAxTHdm?=
 =?utf-8?B?UHd1YVFFZzFPeVRLSVNZY29ZaXJuanlCY0ZYNlBFSTdSd2swRkZiVUhCWm4x?=
 =?utf-8?B?Z29WemxWeExVbnlzcWs1VkhKNWE0MUVqWjdaZk5lYUFDRm9mT09CTDllWUVY?=
 =?utf-8?B?TlhhcmlUcVAvWm05ZXF6NEUvdU4vUG5FY0xIbk5CRXhpN0RUVFI5R3dKazdo?=
 =?utf-8?B?WDM1R2VocFpkdTgyRmZEWlBucStXK1lFR1JVcG0xUDRRT0Z4WmZicEo4cTMw?=
 =?utf-8?B?VVQzOWJZbU1RWGlqNXhaQ1hqK1VUcXExOEkxUCs0VFVBWGNnS0dhSVJ3YXg5?=
 =?utf-8?B?SjNOdDg5cnRnd3B4Y3ViR0lhYWI2a3NhSGJpK3RYUU90MXVYZWY4Vyt6SCtZ?=
 =?utf-8?B?eWdVTHc0SVdBa1loRUlVRHM3WE9iVUVESFpTaEU3TFRxU29vWVFoUW4vbURy?=
 =?utf-8?B?WWZ6RmlTY0NOZ1FQR2hKYW9aYWJBTHAyUFFZWHpCQTVyVnM2bnFMQVJpaWZW?=
 =?utf-8?B?enlqQ1hwYzViRDcyUGN5YllOVm9iUjhsNWZxZ3NRTkhMLy9kSkhQSThhRjkr?=
 =?utf-8?B?cXp0NmZHTHJ0VWFqWkVtZWNIOFBOWlpxMjRYRU5aU0x6elE3T2ZYdDRzbTIr?=
 =?utf-8?B?UFd1UWhsUnJZU2Z4bTFkR0ZUcktHUlY5cUR5Q3B4WkpjYWhpaHQ4TEZkLzVP?=
 =?utf-8?B?d3lLMTYzKzJ1Qnl5WHJYSTJXRUwyMkdSNUZBdjYvalE3QUx1dGdKcS9rS1dk?=
 =?utf-8?B?Ly84Z0V1RFFFUGMxVWQxS0tFSmVoclZEcWxRb0lWY29xcHpPaVlEZ0p3ZXR4?=
 =?utf-8?B?L1Q2Q2NlUUxzNXdTSldBZHNJVzRDd1R1c01wOVFLT0J3b05jS0YraXI2ampU?=
 =?utf-8?B?TUhuYXQrV0lpSzZuRVBHSElFdDVnTi93ejAzZnBlZCtpQjE0MjdQbVhBelgx?=
 =?utf-8?B?aGZuWFo4SnZIQy9LWDNRdTFWRW1LbGZOYnNKZGFlOGlYT0hSb0FUVnZxM2Ns?=
 =?utf-8?B?ZG1oWGxieG9FQkNyK0FFL0s5K2E3VTdhOFQ1bzFEVW83V0RxR1hvSGduVkxT?=
 =?utf-8?B?K1o1MDBrNGd5QW4xYzlVZmxOQ3ZTdnVaK05WVjlaZmJpMmxYNHpKUUowN3h3?=
 =?utf-8?B?elo4Y1lLeTlDTm1HVXpQNVpjQkt1Sy83Z2RTemNBL2ljdXB3Vk9iZGN0cTVa?=
 =?utf-8?B?M0NWMzZhL2NRQjVrclgrRmVCeUlabytqaTYzWWdKQ0cyUGpYWEFrNmtwclls?=
 =?utf-8?B?b1Myd2hGWHdMd1hINEY5TVlMYVBuMjhhTFoxYVk1MVp0UlVYYnN3UkkvOGtm?=
 =?utf-8?B?OVlrQzIxcnI0bWF2MENTMzN4Ymo0ZVdQeDRmRFBlRlMyMmNWRVk5akwvVTkw?=
 =?utf-8?B?QlFQdHNQSG1PSDhjSVkxT3IwcHdicHpmODhzSGVZZ3FiU0Z0eEtmWkdCZ0Vh?=
 =?utf-8?Q?Kyg+wRHq2a+RiJxoQP2VY1mFy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b610eb57-dcfd-4bf4-26e0-08dd995a2b60
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:51.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilT6WyOBW28pf8v5KYdsfVrAdzX/b8KKbyV06b58GqFjYRI3FJ93VRVbSs4ECsbl32KvfReX8/6XsREIQz0yFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v4 to v5
- remove empty endpoint

Change from v3 to v4
- remove unused clock clock-img-axi
- add ports information for isi and csi
- Fix 8qxp clock, irq and power domain
- Fix reg size

Change from v2 to v3
- remove phy and put csr register space under mipi csi2

change from v1 to v2
- move scu reset under scu node
- add 8qm comaptible string for mipi csi2 and mipi csi phys.
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 362 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  79 +++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi         |   5 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  83 +++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi        |   5 +
 5 files changed, 534 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index d39242c1b9f79..2cf0f7208350a 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -10,12 +10,264 @@ img_ipg_clk: clock-img-ipg {
 	clock-output-names = "img_ipg_clk";
 };
 
+img_pxl_clk: clock-img-pxl {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;
+	clock-output-names = "img_pxl_clk";
+};
+
 img_subsys: bus@58000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
 
+	isi: isi@58100000 {
+		reg = <0x58100000 0x80000>;
+		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "per0", "per1", "per2", "per3",
+			      "per4", "per5", "per6", "per7";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>,
+				<&pd IMX_SC_R_ISI_CH1>,
+				<&pd IMX_SC_R_ISI_CH2>,
+				<&pd IMX_SC_R_ISI_CH3>,
+				<&pd IMX_SC_R_ISI_CH4>,
+				<&pd IMX_SC_R_ISI_CH5>,
+				<&pd IMX_SC_R_ISI_CH6>,
+				<&pd IMX_SC_R_ISI_CH7>;
+		status = "disabled";
+	};
+
+	irqsteer_csi0: irqsteer@58220000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58220000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi0: gpio@58222000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58222000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi0_core_lpcg: clock-controller@58223018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58223018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi0_esc_lpcg: clock-controller@5822301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5822301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi0: i2c@58226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58226000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_0: csi@58227000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58227000 0x1000>,
+		      <0x58221000 0x1000>;
+		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_0>;
+		status = "disabled";
+	};
+
+	irqsteer_csi1: irqsteer@58240000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58240000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi1: gpio@58242000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58242000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	csi1_core_lpcg: clock-controller@58243018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58243018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi1_esc_lpcg: clock-controller@5824301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5824301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi1: i2c@58246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58246000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_1: csi@58247000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58247000 0x1000>,
+		      <0x58241000 0x1000>;
+		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	irqsteer_parallel: irqsteer@58260000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58260000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_dummy>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	pi0_ipg_lpcg: clock-controller@58263004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263004 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "pi0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_pxl_lpcg: clock-controller@58263018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263018 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_misc_lpcg: clock-controller@5826301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5826301c 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_misc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c0_parallel: i2c@58266000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58266000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_parallel>;
+		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
+		status = "disabled";
+	};
+
 	jpegdec: jpegdec@58400000 {
 		reg = <0x58400000 0x00050000>;
 		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -40,6 +292,116 @@ jpegenc: jpegenc@58450000 {
 				<&pd IMX_SC_R_MJPEG_ENC_S0>;
 	};
 
+	pdma0_lpcg: clock-controller@58500000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58500000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma0_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pdma1_lpcg: clock-controller@58510000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58510000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH1>;
+	};
+
+	pdma2_lpcg: clock-controller@58520000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58520000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma2_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH2>;
+	};
+
+	pdma3_lpcg: clock-controller@58530000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58530000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma3_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH3>;
+	};
+
+	pdma4_lpcg: clock-controller@58540000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58540000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma4_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH4>;
+	};
+
+	pdma5_lpcg: clock-controller@58550000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58550000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma5_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH5>;
+	};
+
+	pdma6_lpcg: clock-controller@58560000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58560000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma6_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH6>;
+	};
+
+	pdma7_lpcg: clock-controller@58570000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58570000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma7_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH7>;
+	};
+
+	csi0_pxl_lpcg: clock-controller@58580000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58580000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi1_pxl_lpcg: clock-controller@58590000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58590000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi1_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585a0000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
+		power-domains = <&pd IMX_SC_R_HDMI_RX>;
+	};
+
 	img_jpeg_dec_lpcg: clock-controller@585d0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x585d0000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
index 2bbdacb1313f9..4b7e685daa024 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
@@ -3,6 +3,31 @@
  * Copyright 2021 NXP
  */
 
+&isi {
+	compatible = "fsl,imx8qm-isi";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			isi_in_3: endpoint {
+				remote-endpoint = <&mipi_csi1_out>;
+			};
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
 };
@@ -10,3 +35,57 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_0 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi1_out: endpoint {
+				remote-endpoint = <&isi_in_3>;
+			};
+		};
+	};
+};
+
+&pi0_ipg_lpcg {
+	status = "disabled";
+};
+
+&pi0_misc_lpcg {
+	status = "disabled";
+};
+
+&pi0_pxl_lpcg {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8f..c6a17a0d739c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -333,6 +333,11 @@ iomuxc: pinctrl {
 			compatible = "fsl,imx8qm-iomuxc";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 3a087317591d8..50015f8dd4e43 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -4,6 +4,85 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&csi1_pxl_lpcg {
+	status = "disabled";
+};
+
+&csi1_core_lpcg {
+	status = "disabled";
+};
+
+&csi1_esc_lpcg {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c_mipi_csi1 {
+	status = "disabled";
+};
+
+&irqsteer_csi1 {
+	status = "disabled";
+};
+
+&isi {
+	compatible = "fsl,imx8qxp-isi";
+	reg = <0x58100000 0x60000>;
+	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma5_lpcg IMX_LPCG_CLK_0>;
+	clock-names = "per0", "per1", "per2", "per3", "per4", "per5";
+	power-domains = <&pd IMX_SC_R_ISI_CH0>,
+			<&pd IMX_SC_R_ISI_CH1>,
+			<&pd IMX_SC_R_ISI_CH2>,
+			<&pd IMX_SC_R_ISI_CH3>,
+			<&pd IMX_SC_R_ISI_CH4>,
+			<&pd IMX_SC_R_ISI_CH5>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qxp-jpgdec";
 };
@@ -11,3 +90,7 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a57..c078d92f76c0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -241,6 +241,11 @@ scu_key: keys {
 			status = "disabled";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};

-- 
2.34.1


