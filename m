Return-Path: <linux-media+bounces-39174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CCB1F0FA
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A94B51893D96
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67FA299922;
	Fri,  8 Aug 2025 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iZSgst47"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56842989BC;
	Fri,  8 Aug 2025 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692932; cv=fail; b=ppbQvUcg3PJldtzaHrEDkOS9NJMz9fv0J8M+95Udgav0VS7S4I9vhzLZV/JCFs20Qpfvw5gmYrhOde2cXmi0v2X2nYwprD4+MjmrEpHXmfLWEktNg1eUWCjRWNhboHbaYjACaAfcP9kF2wDMlvjZ1Y+gyy28qnpoLwJFj6YjQ58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692932; c=relaxed/simple;
	bh=CKp2ZQOs0892QfZbEvYF2XMoej1jqPTxlkHfaq4AStQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uaI+d50EdM9Cp+rmXeO4LyrK/suHcFAjNYttitKSDh3PU1tn2NbVP4awQiq0nXWDOAz9KtJYZTHcaN6z/gdLA94vVv3Ewqt0Y0kVOCc9nezPakS11myuQNiQnLy9prXzvcQ68c6suhaTjp44aDZ+ThLvdZ2Euk2OBSIeEiyaAwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iZSgst47; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcmjzDPcFMS1csZ98Klg1SbyCyRtcT/d2sZBFGG1/IEEyUjBFk/dpWIMx+D7tVeWGe025WHHxYrljXFmI9u0kGDbuQMHDdUJsw55ItQqxVwMX+YdMPnxi9SS8TuVP7Za23sspY44pC4ON45W16doLoShzssFUP0k5VB8I89CgTWttRcRrVvcBMovW3h5jr0ZUBQQHOSu4r4HjnWbQydTRPfLZPTTZfL8lMASQwpW9P0Y7IfywW/JtRMMJchAc9NfiHGjCg6PwXAsEFmQB9CKqD8J4VV7I7MFbTlldwvv6UaD54TAEZK/VcCoaBE9V6IMQ5QPd8B5aDzwRDuhLrGNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoDWYRFapQJ18hkeS5qsj1DuHdGS9YBGcD7UzH11Qmo=;
 b=Oz7XMpsZeAPOz5/saC0wKnZPBQCk29AE+E7HpLWOs618Sr3lNZiJtFUsIB4rYqASby5D15xraoHgsfvJZQ+IAXWybOD50Mqmw0wmBLl6VQ8YREK7TPSZ5uKZElaGH+fa7jG3Qmf6F7O+g42pTv2aYYMYh3BkevFv32A1K3e9WAs+SPnGRaq3Nmpwzk8bBKtcfg2918gph5LzWAEZXci/FrmxyEcMx/xi8z7K/sUuyvR/nFrBMgBM1DxbpN/8bEElU+Rp8HeudYmlMKuTEmwtTFMk6wovCQnp1kkYDlt8grfgD2sl4ksJgmAQ2ubtnH1CLnsqR6azg97d208jTJwm+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoDWYRFapQJ18hkeS5qsj1DuHdGS9YBGcD7UzH11Qmo=;
 b=iZSgst47jWkMgvXKcYQECj44sH3m5axGWV7L5A26Q1aXVvqMpD668O62XfBGN7AEbnZskd3iBV3/zByCEYSnrfQhmEvS7p4PrPhZfE/AooLMoICK2IRvuTVOPlbnJNiUWPxBz3dU+u785JgnWeXoHtZ4wdSLG8rBiIR+m32QfFQCzJ1KSDMR//Oirs3Px1Lhj9o70pk16dCgfoex69jceDgAKuhwyUSfjRPXssef2AdulK3XPf7BOUGs81d9znZasw4xZB7bXT6YVrNddhz+XYst44NNxO262bc/enB9ZWprI84yCOwH25E4wyWYv278KDfdzrrjje/mbDjbE71++w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:07 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:25 -0400
Subject: [PATCH v2 22/32] media: synopsys: csi2: Add irq support to record
 error count
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-22-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=9303;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=CKp2ZQOs0892QfZbEvYF2XMoej1jqPTxlkHfaq4AStQ=;
 b=V4wPaGuO/Vz4fW8t3X/G0vE4GgC8ic4OHPHRoko9LvHeW/wipB0cUC43fJ/Dq7Uh5ZnTDdi8X
 ogzF9TkX20LDqzdZmWP4Uq+75c5vQKaeWz9aGZIar8k+n6N4VxKeWzu
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 2500a31f-9c4b-4228-fd19-08ddd6cccddb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SEl1a2E0Q056QUNOOHhqOVZJcmErZUJlSkppMjBFcHVPQ0FWaUpMMHVHOTJI?=
 =?utf-8?B?WnVwYTR1YWJCT08yTnNtZ1g5dzNFTlA4RVJYSEt0SzZQL24rVEwwblBMRm01?=
 =?utf-8?B?TjdzYTc2NXNtc0tscEVRS202NUJGMCsvL1EzOHVUZlE1WXZwemV3RXhTYzF2?=
 =?utf-8?B?ZDJhRk5vSGVucEpXcXIySk9oMjYwYVUwRElRMVRGTitFK0pHNzNTWWVlaEFF?=
 =?utf-8?B?eXIzb3U0aXh1enZSNjlPRXlGQjJsbHBzZTdoMHV3dlF1YURwVUpVeExoM3Zj?=
 =?utf-8?B?Y3dyUkxjaTRSSUlDNDFEbzlUZnVrSDMrWm5CWWNBUE9kS0VmbHg2ZCtXSzZq?=
 =?utf-8?B?a0VxSkpqWUpEZTJQS2d4aDVCSW5Fa0RwdWVPRWErSDhIak1BOUdEYVVmQzBD?=
 =?utf-8?B?L1AxdU5saERsY0tZSjlHS1IycUp5THZxak15b1hBeHRYR3VrU0JYOGRjbU5V?=
 =?utf-8?B?cStrUjVFOWc0WUhFS3N0aGZhYWtkNXQxTHRyOEQwSWNrcm9Ddk9RaDVhY0xL?=
 =?utf-8?B?N0VlRkoraHNjL1lYdGcrYlJuN0o4YVp4VVE4ekVZWFhkTExqWTVLSjJFanlI?=
 =?utf-8?B?ZzgvNUNtN1QweGVVcm5XaW9WekVsbnVUdjBlaWJocmZ4cFRLaDBYZy9EYWhm?=
 =?utf-8?B?SzhUd0IzTEJjbUFhTURVcGNMK2pRNXBKb0FjWFhkMFZ4K25GSUNDZEV0bUth?=
 =?utf-8?B?WE1mWlpnMmNFS2NlWTZRWCtDdkZiYWRlUnVMT0xwdkVUY3had01NTDU3ZVYz?=
 =?utf-8?B?RWNodXlUOUhlcE1iYTA1T1NmZ0ptODU2RCt5Yms4TlRvd2xLTzI5QXFlU2lq?=
 =?utf-8?B?QXlRbTlZOW5Wa3RCTHVrdlRqU2pvMlV2WGFwOGo0Ly9CVXQ3WFYzNW1kT2hL?=
 =?utf-8?B?OUJQY21IbHdDTm9vZHlremFldmFUaE9BTDd2SkNybVVZbVd0Myt6WWczbklk?=
 =?utf-8?B?U3dUeXIyV3FNMHQ2Z2hWWWY0Tm5ISlRRZ1VjblIwa0xtV1dyb1U1YnhqWWVo?=
 =?utf-8?B?SUdIdENrampic0VNVVo2M3hyT0FlTzFhTzJEQUZKZ1FYQXhVcDJEcFVVRm93?=
 =?utf-8?B?YWtjT1FFRTFuZ1Z4dmNVU2tlT1FxWWhNMytDblk5Z3Z1MHRoVWsrM01lQ1ls?=
 =?utf-8?B?L0N2T1hCMW9BUm4wdFdtSFViNE9RMjkxWTNJUWNhRm1KcE42MjArMkRFYktl?=
 =?utf-8?B?aFV1Z0NmM00ydWEzcUd4R0JteUZEYXZqVGJhRFZVdDdpTWF0b0lTTmJwZDRu?=
 =?utf-8?B?dEl6NWdCWTJvQWowc2ZRbUhoOVAvRVZFRk0vNUoyejYxY3JXcGJOL3ExUFhE?=
 =?utf-8?B?RkZEZ0NTc3phaWVMYTNhNW1WVTZMVy9iV0MxVnF5QWk2U0FML2NGOXQ0VFRX?=
 =?utf-8?B?OU9uS202cnEzdjRkRVJlS1VNNklBMStDNDlxSFNPcGpSNndKTlRST1ozNVdo?=
 =?utf-8?B?bVhFZWp3RktlbGpRMm9wRS9PMTY5UmF1aU0wSmUxNi9vdHlTTy9VMUNYOVFh?=
 =?utf-8?B?Mng1NG10WVRXNGpDT1hxRmJZVnlnNWtnT2tVSmZMblJLSmVsS1RPTUpvUWMr?=
 =?utf-8?B?R2J5NmJxazYrV2o5UmkvaWNXekd0NTZmVmwvZk5CRkJZZjVaZHcvcDVnTGJr?=
 =?utf-8?B?RTdZY0o2Y1ZXeHBOTzZ4YlQ2Nm9SZTZ4aVg1K2V2ZWQzQ2pSNlZtc0FmcVVM?=
 =?utf-8?B?M0E2OU5ZdHNaT2ZXOStkcmZPZmpxN21XOGRFR0VKdUtJRzQxb2hId3VLMXFM?=
 =?utf-8?B?WHZPbUlEZ3VsZ25RS2tUSmNsVVVTRGh2ZkIwZVUxQ3czenhjelk3R0JDSDhG?=
 =?utf-8?B?ZG5TOGQwMHJtZjNpR24xQWF0cGhqMXZrdk90MDI2ZGlDQmpUSlR1SVpLdWE0?=
 =?utf-8?B?cXdabmp2dTUxUHNmbGFHZE1IY3A3bkpncVhTaWxyQ3BNc0J4TC93TktiajJX?=
 =?utf-8?B?bTdYbkd5eG4vQ1k1MmNlQVpXNCtrRGR6elVvN3ZpL0VLejA4cXl6SldnS1By?=
 =?utf-8?Q?bHMxlJr2eVw0m+NiriGAs/XN6IwZHg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YUJZT29LVFlaWE0wMTNrWnVxTDVjUS80YlJxU2FacklXYTl1RnMreitRZyt3?=
 =?utf-8?B?Z3JxVVUyNlhFeVZHS0ZLZ3VmN0JtbG45dU0xWTJ2eFRtVWh5Z2hhZlRsL2Qv?=
 =?utf-8?B?R1U0akoyVmdVdHByZENLaFJzS0pJMk1Mcklqc0tkcVVqdlhvbUYzYWVZQU5y?=
 =?utf-8?B?R1JJVEx6QkpBVkFzckRBVTh4U2pQNVZCWGhYMzFjalFwV05zeXg1bmU5WUhj?=
 =?utf-8?B?dkgxcEpwblZwalBBOERnaDBnMVJmMG5qUHBPUWU4UnFGTTRqSFZaV3htT3pN?=
 =?utf-8?B?LzhHTWhkSGhlNVZ5VXZHNC9iZWlwSFBhZVl3eXR1ZSszSDJrMnJYdDhqM0VL?=
 =?utf-8?B?Zi9BUDJzNW5QdTRBZWJmQUpTbFJUbllwN0pSd1NjTmQ5bzlWaUFrVlhGbEJr?=
 =?utf-8?B?QVZVc3NXdmh6Q2xzVE9FNVZvRzBWRUEzUXM0QitLZ0tSR05FSTBoQ1hObG0w?=
 =?utf-8?B?V21iZkJ0VWVNWWZtRzVpK2hWSUgrYlk4TjFRRXhlTkU5OWt0ckExWHhyaGRE?=
 =?utf-8?B?SUFSclBxUW80M2dScUJpUVVKMmt0dnV2aVBWekFDalBCOEhCQ21kam5aUnVX?=
 =?utf-8?B?MzBwUXJZTEpMTzJSL2FMazhxK0R2OXpPSitHREpsMHhBNTg0T0dvZjlKakJC?=
 =?utf-8?B?ZlJjMkRQYktTOFEwKzJ5V09qeXBPVzRjN2pObVhlRnlnaVNXNVFEU1lZalQ2?=
 =?utf-8?B?WGRaZnF1RTIydFdycmtzajAzb1hkbzc1NUh0U1A0R2ZyNThQcmdKaHNtam8y?=
 =?utf-8?B?dFVOWHBJNjhaL2hDcy80cUlCaGlKSGF3dHcrOWhodUhlVVBnR2UyMVlGRjVB?=
 =?utf-8?B?TldNZTdzdmhIYzNKMWZqREl1eTlOWU1TeXBMaWpzNWkxc2kxZ2tUeGdnSlRi?=
 =?utf-8?B?aVVXd1dtbWhYOGJ3cTRWbmxibUdJc0FLbzRJVHJNWGJvNXduK0VML204R2w2?=
 =?utf-8?B?dCtCRkVsSmZFVElnenV4SCsvOWpmOStVWENycGFwMGZzakMxMEdpZzErOXBP?=
 =?utf-8?B?WnZ1R3EvMXpSQlFnc2p4am95bnpPMWxtMDZ2NmR4L01xL1pxc3o1ZVloR0Rp?=
 =?utf-8?B?SVRseVNMTU1HeGZkU0FOM0VpZFA3cC9qMDdScDBkMmd2a2xCekxDazRld0ZQ?=
 =?utf-8?B?b0h6UEhaSDhuaUR1NFhaRldFM2dJMWVvMkFseW9pQzREcklXSTNjcjRQQ1ht?=
 =?utf-8?B?aHpmQ1RjYTVRZ0NiYzRReUg4bW9NajdxcVNzSVVaNnBqYjlFTElkYU9UMnFG?=
 =?utf-8?B?ZExHMU50RlFZV2FILzFIV1k2akFtWmt1T0dpSjRobWVzZUU5UW1pMHc4RURO?=
 =?utf-8?B?Q2sxU0ZIVDlWQTRsalpQWERXOWo4T1g4S2JLS2NXczR1MDVTTHQ1eU9WcExl?=
 =?utf-8?B?YUpTTW5wZmlhRi9XeEhBZ0ZzNnVNN1EvdzYyQmdWalFQaDhxbktCY3kyN1Jt?=
 =?utf-8?B?Zk1MdjNHOHVTczlQSnlIZ1dDcXpoRUx2dlNraFVDRit4aHllSnk1VkhTak5i?=
 =?utf-8?B?ZzFndFNKc2JwejFqelpmczg0UkFRZFM1VG5oaXVLNWZPMGlQeWl1OTU4VjhW?=
 =?utf-8?B?RzF6NHdiOU9INE9TNSs4eVloaDRZemt0S1pFQnhiY1VkaWNPbXlsV1Q0N2pP?=
 =?utf-8?B?OVVGSXNMbTJWMUR0STM1V1hWMlROTTdIOEVlVG04WW5DQU16QkQvRlRaT3kv?=
 =?utf-8?B?TW5lWnNGMGFwam5UWGVpeXd5TElNR25tenhQa2t1U2cvQkFIQUE3ZmxGVGla?=
 =?utf-8?B?U2lrRjFsZXFsVm82KzVqbWRySkg4UVF2UUNjSkhjaVMzMC8zUFl1aXRxL0J2?=
 =?utf-8?B?eDBVWlBLdXl5THd3Y29Pa0ZkbC9Za01ac2Z4QVN6b29GbHhDelZzWG9IRzI0?=
 =?utf-8?B?dklHQlIxK2I4Nk5QL1ZLVU1oNnV5dUorZnJwTW9oaVgrTUEyWGZ5UTNESEND?=
 =?utf-8?B?SHZZeXFpYTBZdVVwVEthNW9ZbWt3UG9peldoWEsvWVJ0ZXA0U005Mnp2dmpq?=
 =?utf-8?B?RWRkblVSUW9PMDVaS0tVY3h5UkVzL0pXUG1vZnN6QzhFczBjN0NEVGlIdGdV?=
 =?utf-8?B?UCtKVnc0WUVlZzlaaGdYSURwUnJoOExielIvbEpTUENNbEdDMDduam9XbWxV?=
 =?utf-8?Q?0Ch32UpqQLJEvRLzjVvgn+3FB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2500a31f-9c4b-4228-fd19-08ddd6cccddb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:07.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPIYIm93vwIQlaacm4PU/J8RjVlwbK/9ZMsMmoDb7/gJ7/xPh1+t82kFzSVa/vgYNUi7mbqQJ00z2k0N/B9Qlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add irq support to record error count. Use debugfs to show such error
count.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 171 ++++++++++++++++++++++++++++
 include/media/dw-mipi-csi2.h                |   8 ++
 2 files changed, 179 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 0386d91522ec7b41694ac9c36ad0c3c37b1e68b3..dcad69cea99f3172786156699513f8cc8771ad2a 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
+#include <linux/debugfs.h>
 #include <linux/export.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
@@ -37,6 +38,19 @@ struct dw_csi2_regs {
 	u32	msk2;
 	u32	phy_tst_ctrl0;
 	u32	phy_tst_ctrl1;
+	u32	int_st_main;
+	u32	int_st_dphy_fatal;
+	u32	int_msk_dphy_fatal;
+	u32	int_force_dphy_fatal;
+	u32	int_st_pkt_fatal;
+	u32	int_msk_pkt_fatal;
+	u32	int_force_pkt_fatal;
+	u32	int_st_dphy;
+	u32	int_msk_dphy;
+	u32	int_force_dphy;
+	u32	int_st_ipi_fatal;
+	u32	int_msk_ipi_fatal;
+	u32	int_force_ipi_fatal;
 };
 
 /* Help check wrong access unexisted register at difference IP version */
@@ -65,6 +79,7 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.version = DW_REG(0x0),
 	.n_lanes = DW_REG(0x4),
 	.resetn = DW_REG(0x8),
+	.int_st_main = DW_REG(0xc),
 	.data_ids_1 = DW_REG(0x10),
 	.data_ids_2 = DW_REG(0x14),
 	.phy_shutdownz = DW_REG(0x40),
@@ -72,8 +87,48 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.phy_state = DW_REG(0x48),
 	.phy_tst_ctrl0 = DW_REG(0x50),
 	.phy_tst_ctrl1 = DW_REG(0x54),
+	.int_st_dphy_fatal = DW_REG(0xe0),
+	.int_msk_dphy_fatal = DW_REG(0xe4),
+	.int_force_dphy_fatal = DW_REG(0xe8),
+	.int_st_pkt_fatal = DW_REG(0xf0),
+	.int_msk_pkt_fatal = DW_REG(0xf4),
+	.int_force_pkt_fatal = DW_REG(0xf8),
+	.int_st_dphy = DW_REG(0x110),
+	.int_msk_dphy = DW_REG(0x114),
+	.int_force_dphy = DW_REG(0x118),
+	.int_st_ipi_fatal = DW_REG(0x140),
+	.int_msk_ipi_fatal = DW_REG(0x144),
+	.int_force_ipi_fatal = DW_REG(0x148),
 };
 
+#define INT_ST_MAIN_FATAL_ERR_PHY		BIT(0)
+#define INT_ST_MAIN_FATAL_ERR_PKT		BIT(1)
+#define INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL	BIT(2)
+#define INT_ST_MAIN_FATAL_ERR_SEQ_FRAME		BIT(3)
+#define INT_ST_MAIN_FATAL_ERR_CRC_FRAME		BIT(4)
+#define INT_ST_MAIN_FATAL_ERR_PLD_CRC		BIT(5)
+#define INT_ST_MAIN_ERR_DID			BIT(6)
+#define INT_ST_MAIN_ERR_ECC			BIT(7)
+#define INT_ST_MAIN_ERR_PHY			BIT(16)
+#define INT_ST_MAIN_FATAL_ERR_IPI		BIT(18)
+
+#define INT_MSK_DPHY_FATAL_ERR_SOT_LANE0	BIT(0)
+#define INT_MSK_DPHY_FATAL_ERR_SOT_LANE1	BIT(1)
+
+#define INT_ST_PKT_FATAL_ERR_ECC		BIT(0)
+#define INT_ST_PKT_FATAL_ERR_PAYLOAD	BIT(1)
+
+#define INT_MSK_PKT_FATAL_ERR_ECC		BIT(0)
+#define INT_MSK_PKT_FATAL_ERR_PAYLOAD		BIT(1)
+
+#define INT_ST_IPI_FATAL_ERR_IFFIFO_UNDERFLOW	BIT(0)
+#define INT_ST_IPI_FATAL_ERR_IFFIFO_OVERFLOW	BIT(1)
+#define INT_ST_IPI_FATAL_ERR_FRAME_SYNC		BIT(2)
+#define INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY	BIT(3)
+#define INT_ST_IPI_FATAL_ERR_HLINE_TIME		BIT(4)
+#define INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW	BIT(5)
+#define INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW	BIT(6)
+
 static int dw_csi2_reg_err(struct dw_mipi_csi2_dev *csi2, const char *name)
 {
 	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
@@ -108,6 +163,25 @@ static inline struct dw_mipi_csi2_dev *notifier_to_dev(struct v4l2_async_notifie
 	return container_of(n, struct dw_mipi_csi2_dev, notifier);
 }
 
+struct dw_csi2_event {
+	u32 mask;
+	const char * const name;
+	u32 counter;
+};
+
+static const struct dw_csi2_event dw_events[] = {
+	{ INT_ST_MAIN_FATAL_ERR_IPI, "IPI Interface Fatal Error" },
+	{ INT_ST_MAIN_ERR_PHY, "PHY Error" },
+	{ INT_ST_MAIN_ERR_ECC, "Header Single Bit Error" },
+	{ INT_ST_MAIN_ERR_DID, "Data ID Error" },
+	{ INT_ST_MAIN_FATAL_ERR_PLD_CRC, "Payload CRC Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_CRC_FRAME, "Frame CRC Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_SEQ_FRAME, "Frame Sequence Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_BNDRY_FRAMEL, "Frame Boundaries Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_PKT, "Packet Construction Fatal Error" },
+	{ INT_ST_MAIN_FATAL_ERR_PHY, "PHY Fatal Error" },
+};
+
 /*
  * The required sequence of MIPI CSI-2 startup as specified in the i.MX6
  * reference manual is as follows:
@@ -338,6 +412,40 @@ static int dw_mipi_csi2_phy_prep(struct dw_mipi_csi2_dev *csi2, int bpp)
 	return ret;
 }
 
+static void dw_csi2_enable_irq(struct dw_mipi_csi2_dev *csi2)
+{
+	u32 val;
+
+	/* Define errors to be enabled */
+	val = INT_MSK_DPHY_FATAL_ERR_SOT_LANE0 |
+	      INT_MSK_DPHY_FATAL_ERR_SOT_LANE0;
+	dw_writel(csi2, val, int_msk_dphy_fatal);
+
+	val = INT_ST_PKT_FATAL_ERR_ECC | INT_ST_PKT_FATAL_ERR_PAYLOAD;
+	dw_writel(csi2, val, int_msk_pkt_fatal);
+
+	val = INT_MSK_PKT_FATAL_ERR_ECC | INT_MSK_PKT_FATAL_ERR_PAYLOAD;
+	dw_writel(csi2, val, int_msk_dphy);
+
+	val = INT_ST_IPI_FATAL_ERR_IFFIFO_UNDERFLOW |
+	      INT_ST_IPI_FATAL_ERR_IFFIFO_OVERFLOW |
+	      INT_ST_IPI_FATAL_ERR_FRAME_SYNC |
+	      INT_ST_IPI_FATAL_ERR_FIFO_NOT_EMPTY |
+	      INT_ST_IPI_FATAL_ERR_HLINE_TIME |
+	      INT_ST_IPI_FATAL_ERR_FIFO_OVERFLOW |
+	      INT_ST_IPI_FATAL_ERR_PD_FIFO_OVERFLOW;
+
+	dw_writel(csi2, val, int_msk_ipi_fatal);
+}
+
+static void dw_csi2_disable_irq(struct dw_mipi_csi2_dev *csi2)
+{
+	dw_writel(csi2, 0, int_msk_dphy_fatal);
+	dw_writel(csi2, 0, int_msk_pkt_fatal);
+	dw_writel(csi2, 0, int_msk_dphy);
+	dw_writel(csi2, 0, int_msk_ipi_fatal);
+}
+
 static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 {
 	unsigned int lanes;
@@ -393,6 +501,8 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2, int bpp)
 	if (ret)
 		goto err_stop_upstream;
 
+	dw_csi2_enable_irq(csi2);
+
 	return 0;
 
 err_stop_upstream:
@@ -422,6 +532,8 @@ static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
 
 	csi2_enable(csi2, false);
 
+	dw_csi2_disable_irq(csi2);
+
 	pm_runtime_put(csi2->dev);
 }
 
@@ -729,6 +841,42 @@ static int dw_detect_version(struct dw_mipi_csi2_dev *csi2)
 	return 0;
 }
 
+static irqreturn_t dw_csi2_irq_handler(int irq, void *priv)
+{
+	struct dw_mipi_csi2_dev *csi2 = priv;
+	u32 status;
+	int i;
+
+	/* Hardware auto clean after read */
+	status = dw_readl(csi2, int_st_main);
+
+	for (i = 0; i < csi2->num_event; i++) {
+		struct dw_csi2_event *event = &csi2->event[i];
+
+		if (status & event->mask)
+			event->counter++;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void dw_mipi_csi_create_debugfs(struct dw_mipi_csi2_dev *csi2)
+{
+	int i;
+
+	csi2->debugfs_root = debugfs_create_dir(dev_name(csi2->dev), NULL);
+
+	if (!csi2->debugfs_root)
+		return;
+
+	for (i = 0; i < csi2->num_event; i++) {
+		struct dw_csi2_event *event = &csi2->event[i];
+
+		debugfs_create_u32(event->name, 0600, csi2->debugfs_root,
+				   &event->counter);
+	}
+}
+
 int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi2,
 		      const struct dw_mipi_csi2_config *config)
 {
@@ -798,6 +946,27 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to detect IP version");
 
+	if (config->has_irq) {
+		int irq;
+
+		csi2->event = devm_kmemdup(&pdev->dev, dw_events, sizeof(dw_events), GFP_KERNEL);
+		csi2->num_event = ARRAY_SIZE(dw_events);
+
+		if (!csi2->event)
+			return -ENOMEM;
+
+		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return dev_err_probe(&pdev->dev, irq, "Failed to get IRQ\n");
+
+		ret = devm_request_irq(&pdev->dev, irq, dw_csi2_irq_handler, 0,
+				       dev_name(&pdev->dev), csi2);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret, "Failed to request IRQ\n");
+	}
+
+	dw_mipi_csi_create_debugfs(csi2);
+
 	return csi2_async_register(csi2);
 
 }
@@ -807,5 +976,7 @@ void dw_mipi_csi2_deinit(struct dw_mipi_csi2_dev *csi2)
 {
 	v4l2_async_unregister_subdev(&csi2->sd);
 	media_entity_cleanup(&csi2->sd.entity);
+
+	debugfs_remove(csi2->debugfs_root);
 }
 EXPORT_SYMBOL_GPL(dw_mipi_csi2_deinit);
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 14a80c09fd273c334f91ea70d955dcf92b6646ce..20ce6a21f0674cad54f01edb508dce14cd07a8dd 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -27,6 +27,7 @@ struct dw_mipi_csi2_config {
 	u32	num_pads;	/* Max 64 pad now */
 	u32	sink_pad_mask;
 	bool	has_phy: 1;
+	bool	has_irq: 1;
 };
 
 struct dw_mipi_tstif {
@@ -44,6 +45,8 @@ static inline int dw_mipi_tstif_write(struct dw_mipi_tstif *tstif, u32 indice, u
 	return  tstif->write(tstif, indice, data);
 }
 
+struct dw_csi2_event;
+
 struct dw_mipi_csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
@@ -74,6 +77,11 @@ struct dw_mipi_csi2_dev {
 	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
 
+	struct dw_csi2_event		*event;
+	int				num_event;
+
+	struct dentry			*debugfs_root;
+
 	struct dw_mipi_tstif		tstif;
 };
 

-- 
2.34.1


