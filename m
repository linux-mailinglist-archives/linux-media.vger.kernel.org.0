Return-Path: <linux-media+bounces-49127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6ECCE309
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A30B4305FAAF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A31231A55;
	Fri, 19 Dec 2025 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KWhzvEzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8834503B;
	Fri, 19 Dec 2025 01:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766108998; cv=fail; b=tPquYQQHwM32wzAg7Mq1Y6VWqtwQ9srlwT3UJwVhUB+XwS6/yptyVZwdSuPS1C4EJn/KFbq8CFaiow4QsSu6Tl4zh521wia9U20+MI+IUwgCBJllm3WW653VvPx/QcZuLxYeMAQlXu1pw6XSEZzR/PdRUTA/0QhmlIYSe/iGmPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766108998; c=relaxed/simple;
	bh=teOQdXV9leUg/7sXmTq931mM9vVQ5wMuO5MuHMJVI38=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FK1EdFu30i+JIZGfiYu5X05iLcPQkUD8DtA8zdNOAlt1+4MW+m6n+H+qFqnkGP+U0E9urpezACjIEk4otksvQarZp6jiEZuSqeHPd6etvOPJSnDW0tT2Ia83hmK/dBSqWNIDZbsyvqLxrRD2j0kdaOGrTOoWy/EGLA2V7dKJVtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KWhzvEzJ; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM93vVz6g3pAhbRD3j7flhwWptmtDWnHXGgw2ZVfi6S7jeuUMb0ICezh59vGSxOvCfE4iimUPlRcpqWUHKypvbpVwC19QHWGF9rsQpcpLh9XhHkscijUSBsIodx8AHJpnBKkm4534sgM1hZxSLd2NYV6KdcU7tLiivfKgqMiYAyJTkekwFk7ekk16KV7NjJq4YZax4+PwbKAUSP6NUpBDlv7Ut/sAfkIjmLLDJG8p1j2pFiVNZkWCpIKZy3/ITKUoE0Xdmw6kdjXqO+MlI5uUWNSVh+ztpunVtLyLsROvpxB88aR1LMlLaYCUBdXiXf7jOaaQxNjSOBi4h91RB4RrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nx4PQA9x1vAA6HYIOulX6LyWf51tcujbzfM3HrVDTL0=;
 b=aqGEVDo3DpVB4dXRoj7E7qB4TaHZiBOPhfwoHjZbHxZGx+f/6xjWgbB59cASrHO65EyNzUOx0JcrEO+pPlQEYqKl2uLvePJ4koB9V7lOULnOOGoGMurS2E99jHp5eIhx+KbzLIxlb2i0YFWO8HDoUrN6fgspnz0wK4f7lenlhStoMqbe54g5J9IErWGC3ox5qwMc52mgrEVZemIZqNFqXOs7fZXXEshtWV2owSgb8LWn/jE6AKyPy9zwyd3FdfCdtIoDi834eS0LKhmc+HtUNFl0YQR7tusSMS+mZPh3wxLmwe8Xw7HwrFy+LcrBn1o+Iye4mcA2pIkuSppCzPo3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nx4PQA9x1vAA6HYIOulX6LyWf51tcujbzfM3HrVDTL0=;
 b=KWhzvEzJ7WSkBBhx3rvnOAGC8V7F4uFN/goiw+qlmtlZZxuauBWUTo/0dHyMowEYeGpLJB0HuMB5EIDrtaUCIpUV1xVfXzvlqXsbmRq3Bw1v/JQUJUMYq9KkIHb3ay2azeQxmzQ07qoV7XGrRIeYJ+FTaSl7nBIvFL2p9KkfAjMEro0URbQq/Wlbk/sBzuqX+JNoDhjhAtvKPp/3SmBigMJQijQSAhNoRopuCIw7NzxB/zYtlfgSCxMiugbBbN9+Qdq8B+P7ciix7SF7OnE4FXPSSXqdiVUaAiOrT4C3NTkFL2zQncbeZfyNUGaY6Ri6lBLG9FQRTg3/tzLCCh3eUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 01:49:52 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 01:49:52 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 19 Dec 2025 09:50:57 +0800
Subject: [PATCH v3 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-csi_formatter-v3-1-8680d6d87091@nxp.com>
References: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
In-Reply-To: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766109067; l=2769;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=qR92AX7S1XwKJWCSNwngN3OoE8dUE6EtEzdaIP87AWs=;
 b=46dknBXqSDYzhJYtWRtSz9KuQt0o/GIlJTz8tvULpzy6jThjAnkTpSNd5r59Oo5HoPKByQwnU
 aeslTYpJ9KtDnkAKO1mzRN+0z/B5lyyOCMSxfqWUSfIhgWASEIVgsWP
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bc3ca2-fa14-446e-b1b3-08de3ea0e6e2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?K0Z6L2hocDlIRDU0ZW9Lb2o4V0ZKd2RwMmEzTkYzTDJQRkZFekJkQ2Z6Z0Qz?=
 =?utf-8?B?Q2FkUzlqYjhVYUF1UFR0aUMvQndRemZCZE5WMGlqUmJURlNIZURzUHpYelhF?=
 =?utf-8?B?WHVWaGRVZUlhRGhNb2p6L3JqQlBEcXVMZ0NyQ3czUktwOTViblJ0UDRLK2ox?=
 =?utf-8?B?R0gzem5kM3FFUlFQNGtLU3MyWHpWRXNlMVNDczBLOHI3dllKZ3g4b1FDcWs2?=
 =?utf-8?B?N1VUS1dVUDdJRmIydjVKL1NnSFBTNk9tV05qSEQ4cHJYYzFHVURDOFM4aDh0?=
 =?utf-8?B?NnNSZWh2eGtyQkYzZHNOU2doS2E2d0o5SFNDZzRaTlpzWTZvaHVqTHRBOUtQ?=
 =?utf-8?B?aXVBQXA3cHhTOFhXSTR0ZUQ1cTB6YitsS3B6UVZjUHNCUFNOcWhjYTVLQ1ND?=
 =?utf-8?B?REZ3TmJwWVRTY3EyaU55N2tUWitqWVpOazRmZ2s2MENXdXJoeUtrNUUwUWxr?=
 =?utf-8?B?T1RxbkRDVjE5OFQ3bW9wNXhlVU1RQ3BFOThDc1FNSHdIVzFUZkM2OUxVU2dh?=
 =?utf-8?B?Z012WTRJSHBsanN1SVBUaFI0NkJ3aVZzVGUwNVhMb1hVK3kyS0JvTEJuNTl6?=
 =?utf-8?B?ZWVCcThnVDhlQnlHTUhUU1ZJcENQLzlKOXVGT3Q4elpJbDZrVU5Ma042c0ZC?=
 =?utf-8?B?TkZ0VmU3bEJTWkpaU1l5SmZXVDV1UDczV3hNMXc2YjAxOWZQS2txcWlBUFFJ?=
 =?utf-8?B?Vk41M3IwNFhwSFA0dllrdXlJQmxENWlnS1E1TGtScUs5TDA0bk9NQVU3WjlZ?=
 =?utf-8?B?MmR3TTVoeEVKN0lId0pYTE53dHF2SmNteC9VWGF4VXZabGxMWUFpZUpNUGZB?=
 =?utf-8?B?NXVGNGM0SVNOWG5zWmNSTnljL2FvM2xtSzNaL0tCZ3VuR1NtSXYwS2huWEVw?=
 =?utf-8?B?WVl5ZUQyV0ROZWxVa1ZuU2RrSVBuK1Zmam93bEh5cUJuY2I3N2lGYm9KWXdk?=
 =?utf-8?B?eGF0VkF1VWNBbktFMkZUVXJjODNpU01SdDhJMFE5VW5DZHV0UEpPSUdkeEpp?=
 =?utf-8?B?VnR1K1plQXRFeDhYaE5ldzZTYXU2TmtNYTVwYzYwN3JoSFVNblV3dWpseUJY?=
 =?utf-8?B?UnhHaGVKdVQvRTd3eHAzRldDa3NrR1ZDWmJvV09ZMGpsU2JkbG4wVnhmVVF3?=
 =?utf-8?B?L3laN3QrTFg3VTJJYzBkaEN3bE11TE5OVUhiRHQ2MU5GQy9FaWNCdTJyWmdB?=
 =?utf-8?B?azFVMG4wY292VXVnc3UwQUovc2hxYVptaFBWRFY3a1FGUU1uT3FNTmlIUzNF?=
 =?utf-8?B?dy9vZVZWNnpsRWd5VVg3cDRhangyOEtyZ2FkeGdsQ1RuZFFRYXV6U2JLb2g4?=
 =?utf-8?B?ZXdxSG1jbDlpR1ZGTnFqRlhMdHF3Y0phVFhuR3dvNzFrdHFGSVFKRU9vY2tz?=
 =?utf-8?B?TlhGdWdma0dKNmJmcWlWdHRWN0U4eHJnT2Q5aklXZis4RWpxaWxnUC9rcC96?=
 =?utf-8?B?ajdiUiswd29Nd1pXUGVGaTN4SU4zV0dRc0dDZS9KV2lGcnNTbFpHOVpwck55?=
 =?utf-8?B?VDRUWTBJU21CNS82UC9PbEgwbXh4L0ZIcG5WbEd0UmFESVJWSU1TbUwxM3hp?=
 =?utf-8?B?amNIajNTZWdXalJjTFFsL2p4MjJZWVZXanFHOG9oV2dKNSs1Z0gweG1BQm5j?=
 =?utf-8?B?WWZyWTJadTI5Q0wvZjhnMnEvdVFIMENWUDgzV3IwNXdjMW9wUzlqQUtWNm11?=
 =?utf-8?B?c1RGNU90SzBCZkpvVmN2WGNtbjhHQzZjL3JrU01XbUJoakVVUzdudkIxem1x?=
 =?utf-8?B?V2NDUVBoMXNOVzRqamRoSXl3SWFzck5mM3A4aGtYcTZ3TTZrYUZFV3VFVEwz?=
 =?utf-8?B?SXdZUUc2Y0JRZkZLb21zZEtSK3NldFZONkpISzU2bGRmVklqWEo0ZEVCTUxn?=
 =?utf-8?B?VmpaUnlSWEZLZEJvaXJZR09XR0c1bS9MNnFERmxVaGxaWVpJeFhLd3B1L0Rz?=
 =?utf-8?B?OHprN2s4anZXTHloQzNWQzB5NGhPTWdzM0cwL1N5ek5sTTMrRzdvODAzU3FO?=
 =?utf-8?B?UWNZZUhRSUZRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dmoyVldpNEZvcjlrL2dBRm00Z0FaT3BMMTlobGJFaDAwNEZKOTFEdm44YUw1?=
 =?utf-8?B?cE1SK1N0NHoyc0FvYlBIV1BIR2dUMEJEUndDdjMzRm1QNEQ4UGZMVzQ2cDlo?=
 =?utf-8?B?S2E3eXVYUG5aR2tyNVZxcVFWMENkcUpUZ1dnN1VMbjlBME1LTnBNdWNHQUtX?=
 =?utf-8?B?OGhsV0IybElDY0tkejIyTGdlVXhnQUFvYU13QWV6MDBsSzhXcWk3bWpvSkdk?=
 =?utf-8?B?Sno0N0Q4YmhPSWZ3eXpxaVY0MWZYcXIxcXpKMTBKWFpEeHFqcFBqTEd6NHNO?=
 =?utf-8?B?ZlFBUHQvRm91RGJLVGM2MVIrM1kyODBqcFU5ejlYSGlxK3BTSGlyQmVHVkla?=
 =?utf-8?B?U0UxVWVQbCtVWS9sUS83N2lsNGRTZ1kvaFNSRytVRXFMZUs0Z1NqQndTWVJk?=
 =?utf-8?B?cmFUdGw2R0wrQlJWQnBOQ2wwWXVqakNVN1pRdm9FeXpwZUxnazhjeHQrSDNr?=
 =?utf-8?B?ZDY4S08zUEN5OHRIRkswSFpNNzduc01nZWQ1YWV3d01RWEI0MWFzYm43dE04?=
 =?utf-8?B?RzgySFFaeW5qdS9WTjQ1eUk5ZUlmb2dSV255WnpXZ2VIY0FuOVFHZXN6dkpr?=
 =?utf-8?B?WHlYMU5rY0FKRlg3STE2Z2NpYXJsRFptS0NBaHVsUG11d1RCeTkrNjNQdlI5?=
 =?utf-8?B?b3ZNTEw0V3BseWxvZnl3NTBRUVhXMmo3ZG9YQzQzYnlFNGV5TkdKTjZWK2Ez?=
 =?utf-8?B?T25EZmRsZ2lkNWZ3azNhTVNialBNNENibVkrSHRSdDhPUmI3VlZqMDA0N21y?=
 =?utf-8?B?SUZNNGpNMVh6VzRGRHpUczlnYStMOSt1MERWOXpCT2c4VXdSMnJNUStuMUJW?=
 =?utf-8?B?K01OMHplSlNUVWVsL3cxVGtpNkc5L2YvV20rSXRWWWNXR0NsTWJHRzJCY1FR?=
 =?utf-8?B?bGZGeW4xeCt2ODI4WVROVTZwNEo5RkNqYyt0UEdNNGNnSWRZdmM0eXQ1UHVt?=
 =?utf-8?B?MGcwRnArVnRWTW03enpBeUk3WGpRMllaTU5rbFVVR2pCT3BQZSt2aDRIV0pV?=
 =?utf-8?B?ODM0L2tPc2dLeU1pRVZvSU8waHRVOG9oZ1Y2eW1YQjlmSkFleDNCY29SNXVm?=
 =?utf-8?B?VW5LRW41ZWhDdjROSFluell1WjNrRXhnZ2krd2FkbU1ZTTVVNnBZTnZQWWtQ?=
 =?utf-8?B?UlJTQm1ZQUxjakNtTTFnbEtla016QWFUNEE5K1ZuNHRNOWxmRUxnZ09XWjNX?=
 =?utf-8?B?QXpjaXBTNG1EdGg3OWlMTEtMY2RPL0Jhd0R2WHpjbjByRTR4TVBoYllaMlNU?=
 =?utf-8?B?RVdEZ0Z5U3B6NHljeW9aNGx1cWdoNHlFelJZaGVUZGN3cVhNODN4UWJmYUxJ?=
 =?utf-8?B?OWxEbWhXQmdMa25BeXhiNXR4eTRRTFpvNTk0TE5vU0ZaNkZpbXFHbjN1Z2Vm?=
 =?utf-8?B?d25udkRZYnpLZDRDb0I2L08vYkhDYy9OYUc3ZzQ5dllpYko1L2JwalRXMzhS?=
 =?utf-8?B?VlF6eWQ3eG1tTjFRalRVQWt1ck5nVHJtdUtwa2RWNDRHRWo3dkRrekh5eUlk?=
 =?utf-8?B?RTRLUEswZkhuSUZjTXNPSmlxZ2ZGOWsvQ1FhWXFRellaT1hYdUh4NnFoMlZu?=
 =?utf-8?B?cCtYN1piRitlSUR6VHQyVTVaUk5iV1hidm9OUVBkVDVFRnNyUUFEcDJuQU5j?=
 =?utf-8?B?SlNOL0k1bDZ2V291QTJLanA1cVpURmxYTG53R2NIQzNwYjV4bk5NSjFJRUwz?=
 =?utf-8?B?S29uTisrSDl5SjR0K3NvUnZrNFU3djBhNUFaSXhRdUV1ZVRwdXkyc1hEUGZx?=
 =?utf-8?B?OEZKSTNsWUx4STczaW9OdWFCVmw4RzFrV25WSWRMczBQZ0toTFR5Rk92bjFZ?=
 =?utf-8?B?Z2k5N3NJTlZMcTlVdUhzaWV6V1JXMWRncUZ4elZWUGljNyszSHp6M2ZBc1M4?=
 =?utf-8?B?UVhOM0tCd0lrbm1mU0xoaVRJWWFjb0NIRGovMkRObTMvRkNWUXRla3JaRm44?=
 =?utf-8?B?YWx4TW1MZXdzRWJOUE5JZUVlQzdrbEhkaStjcWZvNEF1VTVaR245WUo3NWlo?=
 =?utf-8?B?TG00THR4TkdGSVZ6TVZCZ1lQcEU2ZitEYnNzZHNiUXRBK2JSNkFBUUliQTUw?=
 =?utf-8?B?VElSTUEzTHorVXg5TFAyMWhuZHJRMURsa3QrQUM3MEtKcVJPRGFUbVZWVndJ?=
 =?utf-8?Q?iJRJcwFY9pDFoYumXuwtJ9HEh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bc3ca2-fa14-446e-b1b3-08de3ea0e6e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 01:49:52.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BaBT4QISXf2/HGFdp83McOqr7uc3pHwN0u613YQCQfhz1Fx/76Rizguix46u6/qHxKT6RHpv1PzUL7hp62g7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..774d37d2b987a679f0bb6378897a6dd196ea4f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx9-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


