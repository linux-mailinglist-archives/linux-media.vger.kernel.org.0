Return-Path: <linux-media+bounces-50907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DDD3370A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 876DA303E65B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3456D34403E;
	Fri, 16 Jan 2026 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HL0OUbCE"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E50318ED8;
	Fri, 16 Jan 2026 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580317; cv=fail; b=QottVmnE9yU/LkNEGKO9mSBIPzdRFAjNoO7naS3dnw3u23DK8tz0bm66pCAcB1ixzd5fif7dgLJzuiC7DGAkSVg603zaAH+r4WyVCRm8suIa+NrIB8STRVlydaLohOo35oOPsiw9vXsrujREvvbnqKbr0+Fru16imDET7VgTR60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580317; c=relaxed/simple;
	bh=w1PXdLwG9n+GV5u0MUG1sCJW/oDxYAB795VKDEfiGrI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=f4xinVnY8RBuue2HCaZAUyzWrXUB5N/il/ORyZuL4ZvNMyexZ/NKW4iCKNSmDkW3SS7meVNiOrwnrBRhIDM7EQYACYsDgnfEHJepjQ9r++lz2vNTVRMHaRJm3Izhp/5JTx22sMUO23FmYsb5TdxTgg/m7oDr/AXNBopP93QiXp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HL0OUbCE; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7zIDZs3wQWk1gX2oorgkAA/5CQyafytwA3FNFaQ3FNJD/LraFYpEjM9v+QEN0okjhxctyK4semuk44E+u+Y7X9t3VErKVKjfsm4unesZOMfmVa1Tm3w+nnuUK8M5lUv7S4mZMEZHwaI06YsDvRDcNcG1CfwHvHPZAIyz6ibgmERBEdwEjEYpyiIhUUOR/TcPxEtY6M912d36fH0WYY9R0VuQE5ZlRJjCUULePlbeW7rSNKSnqJXyLyG4Bt0fKIi6WN8CIkOAxqEyuMwVL4YfZf7WCyM7Q9z3N3xjGhqRq5FF6cBqWf4J8GUYZvU5E18Re6SprknZ7ENNWwYKPBBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2njRJkQ5kMp2LWEgzOtov26+yRHeU7d8HYlurrpe400=;
 b=r+0Z4rJHWIJ7WYKDkPsVYnV5WDbQLRgRb/ODLKjZgInqv2edHQv46IognZ+LZC/RP0KozYBKR4SaPWuqzCccYm+NY/GENqj73ZqdHxkik5IdhgP4LEHorGBh22PAcGLwbFK9ZMJdXiIoImyCluJo5QEtNkPQQ0M1eZe9V2xhL5hmXKSEniB+ZHNivkqPjMJiWsf0NePdvn2q6tw5xu5hwCl/U1tWtQCcVYa/1W2I2DQ8nKc8xY4infZm0Yr0ceMOmc8hJATxxzc0H+dscv3RTD1sdbyCPKAf16beMw7umCDcnubsn7iVAqG480Za6x6pppBVo/NgxqeSfHF89KaThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2njRJkQ5kMp2LWEgzOtov26+yRHeU7d8HYlurrpe400=;
 b=HL0OUbCEgzly/9MBcSrAVLGZWOhpI1VvJtvyZnJUa92cKrcgvhFyvYmu4lAw0hFJVE+8YidpOdZA/acqwLFjbUJD9cv6CE7bh7QfojsthXMYCaXvXLufwjkn1ty8rMhs7Aold201LFkX59YG+mvx6Ig+rku76m/Z4/s7R4LiKONpu4FY/yOeo24art+wcLctKnYfgK9SzuTujHrDWRVZJcmw50nBoMqMJpHLS1hfwBzgtrlnWHIBAkMYa+KAwCEZap7/QZi8/7o45GWS1quSrPYN7Gg1/Qa1auyqsjZ4vD/QEa3Wk3Pv7hmVayXK1NLOuqdNEEMpj8TnqlW+8p6RoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:18:31 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:18:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH RESEND v2 0/5] media: staging: media: imx6-mipi-csi2:
 trivial cleanup to prepare convert to common dw mipi csi2
Date: Fri, 16 Jan 2026 11:17:55 -0500
Message-Id: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580309; l=1487;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=w1PXdLwG9n+GV5u0MUG1sCJW/oDxYAB795VKDEfiGrI=;
 b=4aKAAnoww841i0kMYcTHahW+sPenpRz7Dmvc2WbhU3o/0dWnAW9VZ2T8PFFK5dv8AOFMrwjhz
 sFcPPAbw+8HBQ1D/GkArIQd0kPi5UVg5XZogE6pRjsbr5zsEXIuKAz0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: aa27b23e-bad0-42b6-d770-08de551ae412
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a2ppMXN0bWx0aFpGemN5REEwTno2YXAwVTRCd2ZXZUZoc1BjSmhFT2FlNkRO?=
 =?utf-8?B?TVFoZmhtUFM1WTAydnVueFBLa3diRVZ6bzU4N0V4eThmNk9IcXhKcHYyZDZI?=
 =?utf-8?B?TkxMTVVQV0RJT0JFWDJCWFVtRWM2VDlHbjFIRE5PSzM2aG4vSmxUaUE0VWsw?=
 =?utf-8?B?S0ZjT3BPaTRBVDRUQzFUNncxY1JFb1ZoS3lFZ2NGKzZSbHQwNVVUVjF4eUNY?=
 =?utf-8?B?dnc0TXBoYy9nallxMUwvbTBSbHVXc1hTZEM1MWdRQlkvY3pZOU4wS0JYcDF4?=
 =?utf-8?B?Y1JJRDljZ2ZRWks3S0FmeTFHaGU1cFFsa2tkY2lTTk93RG9JWFJXREc1QkUx?=
 =?utf-8?B?UnR3YmI4Mml3MDlGMmJqN2VlOHRyQ1d6MU1mZTdzVjlmZkl4SkhkSUxzdUk2?=
 =?utf-8?B?cFhBWExraUFWdlJIbjB5NEwyUTdNcjN0bGxZbkJDNk5acEV2cUlIOEp0TjVk?=
 =?utf-8?B?VWtiekVNaDFiR2I2SHI3aFRyT2pKbzlHNWRHWi9jWjk2TkptOUNSMTBkYXFi?=
 =?utf-8?B?N0pxbDVua0dHV0RPNVJrdUpnTEY4QnNlWk9tRENFOGdqc2hBZXgvZEp6Nncv?=
 =?utf-8?B?RmdJaHZIZG1URy8zeEJwSWVnSFY0Wmhuc3UzMTNScG83V1JFUStDcHNwaHFs?=
 =?utf-8?B?SUV3UHUwVDd2L09FeTdxOERseDBSQllHQzEwd3hJNFVWRjJteTcxY3drWHln?=
 =?utf-8?B?K21lL0JYaFdjWlBmOENEUlZ6KzFkSUY2OGNSeGhJdTIyZ2lCVjE5ZzhGWS9o?=
 =?utf-8?B?OWQxd1JLRGF2MnltVWllbUpxMDVEQmVrdG1Wa041TEs3ZFpvU1cyQ3VibGtw?=
 =?utf-8?B?eGpvaURqRndhQzBxWE9NS1ZRUk5tOVQ4S0lQV1BYNktUUFltRi8rNjk5V2Zz?=
 =?utf-8?B?Q2VyOGNvay9INzgrZFZkRnFPYnNBa0hkL1ZRTy9SdEc3TXNGYW9CSC9MTW1Z?=
 =?utf-8?B?VjlRUkFHQUdSME1JMHltS3RmdVQ5WXp5aWpaditGQk9yVTFFTHE4czNEZFor?=
 =?utf-8?B?RzNHY0piU2V1REU1VlRPd0hkTWJyb1ZyOXRkaWFIbW5sb1FMOWhwUE9qRTV3?=
 =?utf-8?B?UUpKQUo0dE4wZEZ6akZhVTFnd0c1OURRZHl3YnZhcDhOQ1ZkbHBFS1JXcm9D?=
 =?utf-8?B?dmlTb1pQQ05qeDRkNXppMG5XelRUanRwTWJycmNZc2M4Y3ZzTFRjZnI4eXFM?=
 =?utf-8?B?TnZqcFFMTWo4cVpQenBMamFwc1RURlZ0Tm9nbWtWc3ptNVlyWm45SUNaNEhC?=
 =?utf-8?B?cVUzNW84SHFLYWkzSWZ1dFZFYU9Jb0FTWnBiMElDVFlaeVpTZWZXYkdCSERh?=
 =?utf-8?B?N2xMeG1hUjk3bnpaRXo4RkZMaWx6dEhmd3R0NXJldm15T3NtczREMWlJdUEw?=
 =?utf-8?B?eFJCMG9odld0NUUxVC9JYlJaQWJDQlo3bE1rYnRLekhFSjRZdkxwaUdkK2xO?=
 =?utf-8?B?d3VUa0pHbkpQcmtqaFdsYVRCelBCNWtlTnpRNG4zQUplUEFxckJsSjNKU0c0?=
 =?utf-8?B?aVp6MTNmYVlNMldkelZJcUtGMDlKWlRhVUwxbWZkSGFTL2FVZ2VNZ3ZEc2kr?=
 =?utf-8?B?VjJTbFVOYkV5bHFjUzc0YkdmcmVTdnVlMm0xWDluME5Ec0FobmxZcWZCM0hn?=
 =?utf-8?B?ZnNEZGxBOVBBaUVJV1ZkdmNjVDFzUVNaMUFsKzF3Y2p1VGlCTkVQVm5pblhr?=
 =?utf-8?B?blIxZnRNTjNnK242b3QvZFl1NkMySjc4UVhaNW9GSjRLZWRkUWJnNFg0SzF1?=
 =?utf-8?B?emFXc0lsT0YzcEU1M1ZXVXIwYkJOV040aWxScmY5dEpCWkg2dkt0ZFBjN2V0?=
 =?utf-8?B?ZTRtVXU5Q09nbHZQWHJLOVVvblZla2xOeHhGNnk2cENWU1JkR3hwYnJKSTRl?=
 =?utf-8?B?cHQySU00ZDk0SjNzWVloYzFvN3FTczJTdSs5cHR5RzgwR2ExUlNRbEJ2SU1P?=
 =?utf-8?B?MTNYaWNCN2hTV1ZnbkFRU01vaUs2UnRMZDlhTndKNU55NVNTUTJiQ2tCc1M3?=
 =?utf-8?B?WHloRkJ3ZVFvdXo0Q2swTWplZER2ZGc2M0ZWRXVWOUcxeTNSc2lGUFpxNm9S?=
 =?utf-8?B?SzZOSld6SzhFMTFldUp0NjZ3NlU4Y0h4ZEc5OUNlNFZKdHN1WXlHbFFNU1lB?=
 =?utf-8?B?V3FVYm9VSW9ZVlpKa3oxdEtYdTlzQUlTVjJZTUIxWUg1Yk1XRFptbVhJTDRV?=
 =?utf-8?Q?k1iH0hf2yDL4GeSv4DbP/p0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S28wa2xkYmNDREpJWFlIbmRnaG1RaXlpdUkxL0ZHSGNSVG5STGpXYko0cnZt?=
 =?utf-8?B?amhpeEl3NHNOTEEwN0UxWHZxVG1JcWlzRC9vNE5vdUs0SURXRUZVSGRpOVNM?=
 =?utf-8?B?M3I3Z0JyeVBydzlxT3ZsZDJiMThwWWJLcjJBSFhNNE9kRmU5cUl2WDV6dEdZ?=
 =?utf-8?B?WG4wZCtnOW5memZ6QThld3B0WHpESHFYWTRBR21ncHYrckx4ODJYMTNrV2pu?=
 =?utf-8?B?ZStackVNZjBVMnFrVnRVbS9rVkovU1NEQkJ1UFJJWHBIMDlrU21VS3FlRE9N?=
 =?utf-8?B?VDFmVWpTN2ZNNmVtZEEvcGVjWkZSUUxJVHJQdGVFbzJJZEFWMGNYTng2MWor?=
 =?utf-8?B?WmtIOUhPUGVXRG5xV1FQTldpQmFaUDZ6c3ZJeTdNekJmdGNTY1hGdXlBRG1Y?=
 =?utf-8?B?NlZCZ2xlTjczditXdFhZTHpZTmxFaWZ3K1pvNlRUeTBiVG5lS1plYnF0bGUy?=
 =?utf-8?B?ZkhmdnZDVXgrYjlwY2gxc25UdnEvOXUrZHhSb2RvdmM1MFNuQmtOOFB3YXUv?=
 =?utf-8?B?NjFBU0F0dXRzVEYrNG5HTWI1NDNGZEo3UG9mSjlOUllGRTF2bUZqVE1lMUlk?=
 =?utf-8?B?Mk1NdFEwVmhncUVTbkdRQXV3eDRROHZxQUdCaTVIUlB4OGloOVB6THdKbUxG?=
 =?utf-8?B?U2k1b1hjTG9ybXErVlJuM1dGSXhhOCtOSFR2SUZ6aDVZMUpBb2J1Wm1HTWxi?=
 =?utf-8?B?cThDcEo1QU9Bb3hZM0dUK2RFeHlyQUh5OVp1SzFqSWVZVjdtQXJoTVJKSEh5?=
 =?utf-8?B?aW5HdHVjaHIrMXBBOTJrcnBISmh1aWZCdHBRQkdXSHpaaVBENzdzYng0VzJP?=
 =?utf-8?B?cm1FYlJzSnErNWJmQmg4OVNwVnk4VloyUkdXSGY5SUVNa3VhNmd3NEhTWG5W?=
 =?utf-8?B?S3E0ME83RFp2VFRvWTN6MW5BbDNaNUdLSU1yQnN4U050Yk5kZWdFR1VWUHJQ?=
 =?utf-8?B?aXRYd3dTSTY2aURTL0RLT1d3dzdHTjNKWnJwanZBZnROdk9LeUdiUDdudWoy?=
 =?utf-8?B?QTZ2THpzclhxRkV2RjJ0T1p3L29ESHppMjFnN29xV1pDRlZqbHRoM2g1V1Rm?=
 =?utf-8?B?bGJHVUdrQ3RmZCtUeDVkaGFOelpPdEhHY3FZWU1QVkwrNmt6cndJR0dhdXdK?=
 =?utf-8?B?emJYVDJnSjZZbEEvcGc1OEZ4Ui95cUtwODJtMlV0RWM0cGxKano0cFJSTzhz?=
 =?utf-8?B?bWpSSG91c1IvTTkxcVc0MlJSQTJDVDVRN3pBMEFHdm04TjN4WVFsSFhoM3Zy?=
 =?utf-8?B?QVI3elJLVDN2dGxGbnhjWWxYUWVyUU5LL3FPaFh6REMxZ3h6THZWOUVndWtH?=
 =?utf-8?B?SUI5YXFNLzAxajdMZUxoVVo5MnBGUE1QcEl1V1M2V1oya0JrZXJ5V05YYXBW?=
 =?utf-8?B?Z0hpdVhFMFh4VUswR2ZqVkVGV2xCWnRPNVhxakxtbE4rc0d6R2pLRE1CcXFV?=
 =?utf-8?B?SzBnRHJLdjJGbnU5bVlTNEMvTFgxWmRBWWNZeXlVd2tBM29QVm1sS0VoNTZK?=
 =?utf-8?B?blkyM2ZwZHFORklVNmVCYVRWdHYxTHZ5bDB0TSs3MG82Vm56dUlYQmVENzVM?=
 =?utf-8?B?ZWplSCtFQTY3NnZrd2c2aFN2NmtLT0M4bTcxUER1VDN3TExCdmE2QW5Kem9B?=
 =?utf-8?B?c2QrQS83cXNsYkxaRjFLbGlBQXBvNm1jeXZ4TUpURFhGQlVXczFuMGNNNmls?=
 =?utf-8?B?TnNDSnAvaTdJWGc4cVA4UjlSS0lWM3lRK1hnVlgyZ215S0Fpb05ZeUo3NXVS?=
 =?utf-8?B?d2lDVUdVZHhLbE96VCtzdDdjMW4xQjZMemJyRVN0dWsvYm9lT0J2c2lPM3pN?=
 =?utf-8?B?ZjUvYy8yNmhta3hoK0RHdUZRblJpUkVqNWtESjY5ZXkrUklqVnlHTlJPY2tw?=
 =?utf-8?B?YWI5UFlmdXB1MitrQytxb0tySHRnWmlEK2hqenRjU3hsWW1kRnM3azNoSk5R?=
 =?utf-8?B?ckpSU09LcEZEWWpBSzlCT05ENGpub3BpWVZxajVXcHRPRTNKa1pySHZ0WE5q?=
 =?utf-8?B?RG15Nlp6SW5hUkJMNlhDcWkyK2NFZFNCSk8rMXJZR1NhM1F6QkN0OUJqV1Y2?=
 =?utf-8?B?K2loUmVXTWEwMnJIVTVNWEpJNWtNbEwvZXNqVkM3NWZyeEtHWWYvQmxlZTRI?=
 =?utf-8?B?TFFIQTI2amNCNWtmeE1tbkc1ek1FSENzd3ZPZjNzcHRFWUxJQmVlWEZuYmpG?=
 =?utf-8?B?WnNVRHFtMlV5ZTdRZlZpLzl6UUVDY2dYMlp3UmptSFdvaXVUb0l1VHNESHl1?=
 =?utf-8?B?dXN0R3ZoUk8vRkdhRFlTdndFZ0xPWjJESjRVMnQrT0owQnhhbmZWOG11ZWtU?=
 =?utf-8?Q?v9XnstJ/sMAJ7OYOv7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa27b23e-bad0-42b6-d770-08de551ae412
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:18:31.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OC6R5GfBwVvVvxX/JYCPUr5ma4SO3vlq8TkJSdapNi3u5XNXbzCGhFN6uq9GoYRpgMjiFnG/qCCJoMlTBXpag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

Previous https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
There are too much patches (32) in above thread.

Just extract first 6 cleanup patches to review easily. The overall road
map see above 32 patch serise.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- collect review by tags
- drop media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
  need more time to understand nf_unregister() and subdev_unregister()'s relationship.
- detail change see each patch's change log
- move devm_mutex_init() patch to second one
- Link to v1: https://lore.kernel.org/r/20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com

---
Frank Li (5):
      media: staging: media: imx6-mipi-csi2: replace spaces with tabs for alignment
      media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
      media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
      media: staging: media: imx6-mipi-csi2: use guard() to simplify code
      media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code

 drivers/staging/media/imx/imx6-mipi-csi2.c | 209 +++++++++++------------------
 1 file changed, 80 insertions(+), 129 deletions(-)
---
base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
change-id: 20251106-stage-csi2-cleanup-6db1715fd187

Best regards,
--
Frank Li <Frank.Li@nxp.com>
-- 
Frank Li <Frank.Li@nxp.com>


