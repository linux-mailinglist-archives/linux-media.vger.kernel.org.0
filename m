Return-Path: <linux-media+bounces-25499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B162EA244B5
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9152B3A2A5C
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C101F4299;
	Fri, 31 Jan 2025 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TmtUR1b0"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22B1F3D5A;
	Fri, 31 Jan 2025 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359251; cv=fail; b=GrCL4grgp6KEGpMVATjFN6JsRlOMepVxbcR1YjQbmQYms0liZ1patCQunUcW2TH2hCQjXNwaYA1SELyyHk7fdLWF4WO9TCfyuZ0u5ayahQxKbLPQ6p5mEyQYNLdnb88ZNHQTsRSBh56EGpi5VkdPkrEbwcik+HaigBzgGGdiARk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359251; c=relaxed/simple;
	bh=O/DfegO3FnDVkNBleOb11TI7X1PFuSWNAoj8ZBVwC9I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BM8JbKeJvBzlvkMpndAt2uujj5bwFgItZhUfzMq9kayE4HFylXzgY+zNHrUQI16xly6uaIyM0u2q/WCoXv9JXDP/MC3v8FTiQPUQ2nCnCwb5KySeG4ugNLLN+e8RVF5aUpr7eajqOrc+sAp2bTpBqW9UzQPk0wa2LD6ZhdnZ83k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TmtUR1b0; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiYm68sHIIb6Ntk1DmdhxobKbAwS5phS0IsTXXYfLFyHiSkSLOxotlYekn3xfr9/EVl0wX73cNA6cKncuSLBz5A8muYOxRWUHDeAxBkhuJS32Pv+hLsV6zZn9Y+ZQ2AN62F3tHEICXHwVwW+VTznBIuVt5NoIxViRvw6+IV9NOx6VbEBPPGK8ur1hm8LmlsfpLrjO4QhNXPZGY8cK77NKqNORSyk3Fc+87rMJTZMFQvHQ6Z8EjMXCIkx00CRBebNN1sLCrjLqcMrlUecKW+fgsEDlIndE5X618sO84/3QUQYFXRx9Kn33PZSILdwuoad9S/JrD+ACxGTxw9jxpynwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af2wgKE5GzwhoX2W2BCY5ASceMOOOhZXQpVpW0asK/w=;
 b=FnuDOU0a8XGsuhSuX+uppCDw2XEvtcPbaCENAH8h6/9OhO1Cp7zIe0IJgQV0OK9pBdCFml1ljWq1/ggIerhpWxN/D10+hovLrmnc+vU34Au3WwYL18RUe872t1the6awdIWZI73dS7U4Wc4iSCWJUm5pkru/p0swdw4c2O+vjbPo97yMsY9fKS4SW+u1iE5Fu9/I1O61Kj2oC1nKPnCk+d1pQJtZvgKeGa6i3mppkvDvdxzc5mSAfDk992CdPPLbUOx+TtOD3k1tzupGDcf1926ifL7ARwyUH9JAAu9YCY7SGgTR93EC6ENn1P5BgamDFUzaCo/g7rplmcp0lUII5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af2wgKE5GzwhoX2W2BCY5ASceMOOOhZXQpVpW0asK/w=;
 b=TmtUR1b0eMb+DxDwUfEUNN0pFMEuce75IRET6myt7gU7rN+E5alzNR/Fr7FCHfWO46RYEYChTcALNalXMQdea2lbvgovPt9Y07O9LxjVwq+E/inj8Fzbq8naOMZpFAL18uTvFJB9k2euW1KiaHaTkgA1dvKvs9uyeDbpYCHMAvrsgjfXkL9ejogkWxONq7uE0ZMHW7gYXXbarBn2na1olqMlp8+hzHmbZ5G6MovNL/YdiMOsZjsWgglMfRX/iAIx5AwdcIdyYRGftvC4Rx2Xcjnk00YeT6RmzDuSdX92PCy1PUEISo2GL6ZUlW/KCetimIEkGv98JojNY8dVi10fmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:46 -0500
Subject: [PATCH 01/14] dt-bindings: phy: Add MIPI CSI PHY for i.MX8Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-1-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=1598;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=O/DfegO3FnDVkNBleOb11TI7X1PFuSWNAoj8ZBVwC9I=;
 b=QJa++5IuxVbhDvFng7GlhNjhle96UIRj2ilSE7Q5uo7yMMwbUjjHhw+x//Y8iVt/PSYdd4UwR
 K7mC41xB5b+Bzk9vzsAEZZkZfLBSYNl/67e321rOM0lFu6ryJCBtrpF
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
X-MS-Office365-Filtering-Correlation-Id: 9b64777d-9783-4771-e136-08dd423efd64
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MzY2SjJUUXZNZjNzSHpCR1ZDSXJjMVAyZTV4dmczMHJ5b0J1dnVWNFFJMkxJ?=
 =?utf-8?B?UnpBL3FFRHowdzdja01ncTM0YjNZdng1b0FiQ3Z5ekRVRFUvbmljOE5IMHky?=
 =?utf-8?B?ZEFhWjdkdnZOSzRWbXcreThTYWRZQVpabGVZSmZIR0tWVUdaVGVWbmwyQnFH?=
 =?utf-8?B?SzEzd1NUL0E3UUszQVpXNXFqY3h6d1ZUK3ZVRzlGTkRWdlptSFB6Um9VemVD?=
 =?utf-8?B?ZVJLa0FuR2syVFhNMyt4OVJmQ1FDcGNkdzNBRVlDOURieGNQMGRJM1pGQzRQ?=
 =?utf-8?B?aS90MUpjSjFXQ01ldHNkeGZWNVdpVFV5S3VuU1p6cWlQTUFadjJCS0thVFJq?=
 =?utf-8?B?WFY4QVJDVmdxYlk4SFdZMmFLOVRFUXQ5RmRpN1N4aTZQelg0VkNpbmRZc09J?=
 =?utf-8?B?WlF5QmQ4dGpyRVdvK3F5R3VZdms1Znpobmo0TUpLNjl2Ujc0OTRCOTlNeVRO?=
 =?utf-8?B?L0J6Y1JBdnFBeUVDRTJod2lHeTJySTVsMnNJZXZhVkUzbEsveFRTNXlDSnU2?=
 =?utf-8?B?MW0vVG8zVHJGL2pRRGI5dUFFbVl3R2YwVjZnM0FaQnRkQ245ejV2RHE2SUtn?=
 =?utf-8?B?Uk0wWUpiUllvTzV3Q2pxSW1oYUoxaWtLaU1mc0Z6bG5QaXhaWjJPdnFoUXo4?=
 =?utf-8?B?a1FtdStLcGhqR1RwT01yRlg0YUczMGRLU3lISXd4YUlqT2t6S1lGQ29mV3RP?=
 =?utf-8?B?NW1TdklYcHdxT2REMG1WQ3VjRWYrTC9VUzlSdFJ6RWtCOW9UbUVnZDA3dzIv?=
 =?utf-8?B?anBWOUlyVWlIRVNWT0IrWGs5elpNTjZWZFZCMVczSldnN2hSbEUxTFpSb2NJ?=
 =?utf-8?B?NnlvQ3RhYi8xeGFzUVpGakNUL0xkMnJra3NTeExkNXFiZzVublNiOTJDV2NW?=
 =?utf-8?B?TUJpOW9VeGYwT1gvckJJczNBY055Qk5wK3doNFRMUWUwcDdqN2ljb29LUldD?=
 =?utf-8?B?RWttbVNZUFlyQlNEZ2pkdUU2NEIwSCtrbkQ0bjBxeHVqa0lGNWtVcnZqejRx?=
 =?utf-8?B?cjN0cnlzd3NudkN0K0RDOFNMZWJZVmxHS2I4eXNMaDJZVHRwT0xOekhhRGhn?=
 =?utf-8?B?OTlNR21qbjlFbkIvdVIxMDF3SDdqMEtPTjFoZG9jaEhRbFhockFlQVdOck5v?=
 =?utf-8?B?dWFTUDFhYW1YemdsSFNjSFYyYUd3SVlXNGJkdXJHSmlSQzlTVndQWWhtRHhl?=
 =?utf-8?B?VlBQSUtDQTdwRmtUYXIvOTlPOU1mT3BuNFlyOTMyNTV3aUVzMjVucTNJL2R1?=
 =?utf-8?B?V1RpNFNUU3F3L3FwVXpWMEpST09NTk9ZWWpWL0p2QkRZempsWHR1QmhSakJL?=
 =?utf-8?B?bENFV1JEVHVMVmt5Q21wYVpUQlY3WXlsbmdKUUNPSmplQy9YNlUrQ0NYdjVU?=
 =?utf-8?B?MHFSYUcrVDNBbTk4dEZHTEY3WXJWUS9raVdYTmpLTEVuZlI2aGJSNEsyQ2pV?=
 =?utf-8?B?M09xcUNiY0o0azA0RDdLbll0K3o5cEZWQkU0NEVDN0hUZW9rQ0dEVkNFUUdy?=
 =?utf-8?B?STFEZlNWUlNoOUxVbzgwREFZb1hLWlNXbVBXMDR6WFVtUDRKbWoybzN3QURJ?=
 =?utf-8?B?TmN0VnNFS3FQOTg5SXNSUkZHdTYwcWVrWitOaEtxSUlidmhncE9YR2RLSUVK?=
 =?utf-8?B?QVRwK083TmpMSGgyYkdTdXgvTGhOZDdiV1FxL1dLZ1pjWDFKcUtwbC9oQlBj?=
 =?utf-8?B?RExGNWpiZUVyUnlVQ0FxTDJWREJiQTNHTkNXRTZBYmdIOWsrc3AxTDVMb3hN?=
 =?utf-8?B?N1lCSlB5ckpHNGFxeW93Wkp3WmRYMm1CSFNzTksxWE9ncmJBYXJSMTE5aGh2?=
 =?utf-8?B?a0diMGpTQTgxMktEbm5vb3ZRKy95bTdZV0FvcmZBMGZMdjdsaS9XMEJJV2Vw?=
 =?utf-8?B?N0hlZHZnUWRXQ1dJN0t6QWh2dWRwNkdwc0xka2Jtc200cHc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Qkdqa1NNVTRkcXpaenR6VEVBb2J5Y0ZpbUlwbVY3MGNCb3grUkZEU2ViT0VO?=
 =?utf-8?B?dWJXTzdvUUFxMWkvYklIcmxSM3IrQ1F3aWsxN3VVNE5mckxjaGx1cXhyMHI2?=
 =?utf-8?B?YXlweUJ0cnRWaDZhdjNIUjhuZE5XWHZoTTMzMzU4dG1WRndPdmNhb3ZZM0Js?=
 =?utf-8?B?ellEbExDYitGRnp1bTZxK0xuS21CUm1hbU5mWnlSeWxvUmgwQU53azhySVBo?=
 =?utf-8?B?L0VyOWRKT2pMR2FHL1FkaWFNZVF6d2xrWHNjeDFja05xRFlvclVHalMwZmxQ?=
 =?utf-8?B?aU00MUpqTFpjS1FIejE2M3MxakFWbDZhemNrbndZQS9JWTZINEw4Mzd5bi8x?=
 =?utf-8?B?dU9samRKNkZiMWVROWJnSDBibmtadlBkdndSMy9KQUxHWGRaMjc3Z1V6czFw?=
 =?utf-8?B?cjhaS09qSnlrTXNFSkY2eUE5cTA2L1hrVWFoSkIyQkJLL0NLVnI1MHBYM2VY?=
 =?utf-8?B?c1RxejJ5Snl6QVlPUE9Xc2xZcHRSUUF2azZudzlQYkN6ZEdGQ0I0bWd4YVhw?=
 =?utf-8?B?a1RKamlJZitZU0JGMnFabEpiYmY5UUYwNEd0SmtESVhkMkk1aTJYQ3VEeDZR?=
 =?utf-8?B?Zk53a1RPVWdaM1Roa3BlcGRJS2J1VmFUQjdnVXllRUQ0dndERkNSZzdlN2xa?=
 =?utf-8?B?U0JYN0VtWGpTVE1OaGR6QXc3YmY0YkZISU0ybXE0ZGVSeUFMUGx6dThsUEdk?=
 =?utf-8?B?cmI3blB0NnpvanRNMDN0ODZrV3pQTkU5MytZL0NiUk5yblQ4UmJaTC9YZFpM?=
 =?utf-8?B?MCtCR2NkMFFJNHEwN3JraE5RMk81Tks3MEx3ZWpoTUR5M1FtcUNoMFozbnRY?=
 =?utf-8?B?ajY1SHFURkdsdGo4cXNzQ21sK2VJMjdXZmppLzN2ZSs2d3FIeDZ3WHJFN1pC?=
 =?utf-8?B?NmJsR1ZxTjRZTTJVZjVQNkwyVVU0bXFLQ3h6Z2tsYWw2Z3oxeU1yUGhBcGhX?=
 =?utf-8?B?VllwNEo4Zk9BSGh3U2Y0Wkx4TEdtaHpyYW9vNnRzWUlPZExacC9zUFByTDlY?=
 =?utf-8?B?NDlxc216ZzdsZ2ZKN2lXdG1abjJkdmNnaWVjaG4zWmhEdTdvVmszbHJxSHU4?=
 =?utf-8?B?QzVTTHE4aHZ5d1FtYXg0K0ltR0doZksxUGh4RVpLWlFWYnJxOEc0NVZjY0Js?=
 =?utf-8?B?TzhXRXFYelppRDJpVCtCV29YWjlCMnlDQllEYkRMUmYwWTNlRjczS0Z6NStX?=
 =?utf-8?B?L0lYaGdUcExzbmF6VzVkWFhYSHdHVDVwRlRHSzlyZWdGTUFsSldTZ2xWd3Mr?=
 =?utf-8?B?ZTg0OVdaNzg1SEdEYmxnYTJkNmt4UzlVT1pubWtFTGQ5bUJpaDVnMjljOEM4?=
 =?utf-8?B?ZUR2T1k5OU9BOHluRE0xMHRVbU1SOHBRYTFuWkxRYy9ZVzM4T3RJYXpZVDJp?=
 =?utf-8?B?NFI0cHlwYmdNOHpXT2N4Z0pLd21GRG8zVks3Q3hIUFl2bTlwRTB5c1VxSWVP?=
 =?utf-8?B?L3YwTGFiZjJmS2o5b2V0SGx5cmlncEFlem8vVFhVOE1WNUhnMVFtS2Q0T0Uv?=
 =?utf-8?B?cFAyZmRlM21pM216eTJHOWJoUWEvVnJIOUNKam1qYVZqUXhOTkpLbHRtdzc3?=
 =?utf-8?B?djdNRkZDNG4xbWtxZ2xacFNvYjZTR2djbll4WFBIVkVmNUl3alNBVG1GZXVU?=
 =?utf-8?B?NzBQbjVOd21sNDNWZmJONlZKRVNJVjVUeHg3MVpaTmgwQTQxVnZja25XY1Vn?=
 =?utf-8?B?aExZNi9reVRuRlM1M2x1MXFNbnA2U1RnSU9kN3FNWE00WW9CQWZQMzZ4N2Vv?=
 =?utf-8?B?S3JhV0VqZXhRMDM0aUU0NzdmTXEzNUpITjVpcWdFYjRnYVRJVWp0RWtzL2c1?=
 =?utf-8?B?VlE3a3hnRXdvV1pYY2EvSEJkd3dVaWY3dkI1cFNKc3FtZzJVSDRac2hFSHhE?=
 =?utf-8?B?WVJwR2ZpMVJKNDV2b2loSGxsQkYybC9rZVliTVZLakZtNkRtQ2VESkEwQitu?=
 =?utf-8?B?Y2Q1Ri8xRVFRNGVEQU5UQ0lmdTVFT2pWTHhQaHRiYlBTYmFoNVhVMWcvcTgw?=
 =?utf-8?B?cU1vMjhJWmN6cFRkYy9GZm5ya2twREtYdVBFR1l5Z1hqaFo5VEwwU1JBU01z?=
 =?utf-8?B?U3dhU1dhcVFVZVFuY3JyTTRtZ2hZNmNwUnV3VnhRUFUrV2RSQnBSMDhiMXR2?=
 =?utf-8?Q?yYjM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b64777d-9783-4771-e136-08dd423efd64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:06.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0JVYJhJL7eTlxwHZum9tqxOAAUQfNBhy7viDivfj+NmY49GSl5bSl4jJld9cVPu3DBQmX2DBvEVag8vYyUhhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add MIPI CSI phy binding doc for i.MX8QXP, i.MX8QM and i.MX8ULP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/phy/fsl,imx8qxp-mipi-cphy.yaml        | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
new file mode 100644
index 0000000000000..c6cbedd9ed114
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8qxp-mipi-cphy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8qxp-mipi-cphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8 SoC MIPI CSI PHY
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  "#phy-cells":
+    const: 0
+
+  compatible:
+    enum:
+      - fsl,imx8qxp-mipi-cphy
+      - fsl,imx8ulp-mipi-cphy
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - "#phy-cells"
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-cphy
+    then:
+      required:
+        - reg
+        - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@58221000 {
+            compatible = "fsl,imx8qxp-mipi-cphy";
+            reg = <0x58221000 0x10000>;
+            #phy-cells = <0>;
+            power-domains = <&pd 0>;
+    };
+

-- 
2.34.1


