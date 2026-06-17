Return-Path: <linux-media+bounces-65142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l1kCMUn7MmoP8QUAu9opvQ
	(envelope-from <linux-media+bounces-65142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:53:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902769C3F8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:53:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=uJU9Hb1O;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65142-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65142-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D80B316440B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA1F391832;
	Wed, 17 Jun 2026 19:51:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F366395ACD;
	Wed, 17 Jun 2026 19:51:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725877; cv=fail; b=UpKeyS8hQFe2B+O3S5VXRddPHS5HNeOxALY+wF8Ks1KaB42T7ljUUg8LZ4+c4Tta+Z3lv3xz2vNVqA5J3Uu6dvFu/BV87vu8lVZ3CxtfSBpeEJY5znTBl8nypUi9qLWQfLkz8AF8W/uBN514Cfm0oOGTHrEgqnk4NpkL31Z04jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725877; c=relaxed/simple;
	bh=AVnE7afSXYAOBMmVQPdpGB3x5BuS8jviHxMRgdQ7+go=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JOfuXPZJBO+mVozSb2hFX+zLLmx6a2xSu5Fir8ELsMEoYzp54GMpAJB6KekKwlKQkpo7HaTXsmaxu/8UT66gImmVEJrhuJfNKyav9Nzt3WQp61FRVqmpLdUqtM4KaQ/WHW+QUncTi73Yl7BEh1o7xVDOjDrVrXjmmdr1l+14Zio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uJU9Hb1O; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPuDPAI2jOibJICM7CSBxlMwn62PqNCVRhO7E0fITyEGfeHvPg6H0fzegyB3ODc8hIlJxk8d/A6Ll6N9HMMCa3Thw7MrHEqmvh647WkTLMWNFyT4C2znaevTndubSg1g9oLwzoD5L5MQI8EnYJAEfUcHfWjuQetOkHrYhKoCHO3A1VXdGX8jgXvIS3oedFn3I+9QGEGKJQdIly85DuwCK2RDgyjK2sHSYtZ6EoR2Jhy8odBsgRirfb36JZlTdBtXSjgtWjVy7EAgPUGS5hiY8iuJBYuRUJol59tjyMJEEmwqSkFHTaaIvzff1/Kogx9yXEVuzvl08zvB5KCKul/UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zsyrtXxuB96H+urayJl+v/+6K24oxEkqqZHj1tP5xk=;
 b=EHzvIlddjxSG4Gygbrw17q7/ZsVQ7x5jEKMhEwU87AZB/SguxH7WMcWEd/pl7WYJ5kVbKMfli2AwaZgASi2DZHH0kFGjAURLo1NjDUWxUqwcYnqne1cMkIKOj28GTgjYQb55OIpyHCsk2WUn4XANlFI1WMUHGNfIt5HckevFmuJ7JNyBI4fWyR/e2JskLYaIfmM1JYkEs0TAY8BL5FW/YdM73urY9+V7110pNuTnTEjVUi0Oygb3N1L46KGiqMuTR1sn/HoNJfpWhL9zKNke2IYMLP+hM+dxvizuNtBXN+oHK6vJxgSUT0x6QNrBUtluXIoPrXDxwfU5zYj1MprJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zsyrtXxuB96H+urayJl+v/+6K24oxEkqqZHj1tP5xk=;
 b=uJU9Hb1ONy8GNhwes5+4mD3T6Vabh62/KACvoFR1sDRLqOiwxJUjUtoxmDu/szLlIBxB+4j6noMiqFrzORabhYuDP7WqrtnkbtqTyV4R4+yo1zjp4rkQLo5n5Em/T31MaCCOuHLKg/n4jzDIJOcn6/pBSoT6vHyL0UbOnkBUHcRp+F6uelNZoJQEe8HiNi3ZWEhRFOfKMU1vZ6DV5MFj/NKUWL/XNVBb6DspBjvvLQF3qKnz3Ld6hj+krlNsSJd2ERKWna1UsVNRazN81fKnirxKqCNOErsb3zr1a1wvcvpRWxGOIWlkxJbe52MQy7c4wv7yiRcWv3n0rdIifcfs4Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:47 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:47 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:16 -0400
Subject: [PATCH v5 6/8] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-6-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
In-Reply-To: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alice Yuan <alice.yuan@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=22137;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gvBUG4vzyUL/98Qu3PY/I+DAvRu6fgkGTiIlw/z1Prg=;
 b=DWny1F49Gfve3kKQUlcPBWr/PxLJGmGv6fIIUuL0a2GMcp4snN9UIGeEQNr0n8MOTfKEl2oNs
 YGNj6M5Lo91AHTToA1GKiHrMt4DS+wMh6QiEDlyI+lHz6+z6xuoUD4x
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:806:24::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 2626825a-b6d1-4aa3-d6b9-08decca9b9ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|3023799007|11063799006|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
 ivqtELrv0FFtdyjqFYteVX/E7cjXd2/t9FLpZEmdQ9DmkdLFDTS2kD+im2s0TX9x3os1cftKr3q3FUYgwzYxFdyfL9lVeaQWH9TDwZtoyNziUeizjDPzMgG4bYYO5tVPNgEuabqavLPsP/93k/ZlNq+vOtpJs8NJYtJ6zjmnPLkCT6maeD6VWXPf9FJErKROTI9fz5JkLAU2A0gupSQkLg+rpRv09VTAKGWv/EVXXwrTXcICdSVfnNmhxXqBrMEj8eBsKFXH5INjEX63sr1S9Ae7mZeoqPhYAnWQilEJu6BNeY0WIHaN4DCsq6XIAqS2tEsu1Z99yyTBnPUoKI6xnhXVoC7swn95/SKHaHYC/X8lgCbsGB8vSGf9dpPKTZbZoif+luvxVZ+do3sNv+p8rKnmg6yP5wm/+Ix4boTNZkEIEWVMLXT66TEbEOjjQR3h/7SuGPlejY9PJSEHqsxGfW0qMtDTq8GDdrM5OE2K/CWV048ZH/ztEb3N1vOqHgKo90jNMX9k92STNM6AKNBCF0cDJ7pihhDQwBtD1NQtW+auDX5oxQbLO0iEsKuSgBwLWN5Pg4qSNQz2IWDKZV8n5hnLqGRUHF5sHA86IZHzw9BM5HL24BkQ6HoGM42BL3p7ENNz0N+Ae2vQCvjw293yrJWvCquDc5zhu1y7CU4YJ0QH3r/xv3h4hbepEc4sCXMoJzdq3XGuYmwpDJkuftjbBDsXVWNbJ0w4yCGOjmVnY8s=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OWlMV3JJdm1LOS8za2treWlYZUVGTXBmWG1YQVZtcHdiRkQ2dFk2dzl3UXh6?=
 =?utf-8?B?dmZHR1A3Tk4wM3M1OVJRTC9SbWNYb2pwNktlcFJVMmY1MDA5WFdJQlBBOXVU?=
 =?utf-8?B?djVrcnM1TkZWOXlZUWowNm1nTmxnQ2g5VXlXYU04aHFUMGk0NGUwY2hTNzFF?=
 =?utf-8?B?NEFWT0wrL0dYOStzK1p5c29FSkx0UWRhSnNPVDVPUFBpcnhmWUJXRHM3aXFE?=
 =?utf-8?B?K091Q0lIQjVERjRmOGJnSk5YYVBQOVdjRk1mNzVQSDRhalRodG5iWXNlaVg3?=
 =?utf-8?B?WTF4NVJrdDZNdWFTcUZ2Z00wUlp0bGRmMmNwak5RUzVSNVdsNGU4aDdTN2Nh?=
 =?utf-8?B?TXIvSW9oeEcrc0g4WmpSQW1yT0cwdExQdmY1RktJWEk3bkI1cDdzb0NQMnRR?=
 =?utf-8?B?bWF4ZklPTW1hYXpUVkhlV0s3eFBIUGtKWW5QeElrU1I1OHNWR1FyNlpZQlcy?=
 =?utf-8?B?d3ZiaHBwbmZObU1RWlo3MzJnRkk0TWZTeDlka25pbEhIMEtnSVAydzEybjBE?=
 =?utf-8?B?UTFJS2tURktRZmJ2WHEvZUZBazduVXlwZ3kxS01EdzZ6bm1ZNitsSElEalJP?=
 =?utf-8?B?TkZ1YWNPOGJCV3pMT21LMTNxeHd5ZC93dU1jamZpakFja3VlNmFkMmRDNFU4?=
 =?utf-8?B?MFJpanlnYTJWNUFjYkpaTUMvSFVqR0FxV3hsQ1R3Zlg3TFRaWFZORlBiaS80?=
 =?utf-8?B?cGkrdG1jay9GZjQrOU5KMGNKcURiSHVaMEt4bG4vWEVlRlFIdWpvcTRzMFZO?=
 =?utf-8?B?SE1TR001Y0JHeFpSeWpGTjJEUWxOUWNHbUxJamJrZnNORzh4MWcyc0ozOFk0?=
 =?utf-8?B?ZmNWYm1CV2JoNSsxajN4L3p4N0xLdFBYRTZYQk9NY2lGUTBnQ1JTblNGeHVY?=
 =?utf-8?B?QURjZnR4ZEFtVldrZTZrY0xnV0xoUW1laTNDR0MybnZqaUxCSlVUZ1ZvcUdh?=
 =?utf-8?B?cVh1M1JHYm83SGNwa0ljV0VUZHdic3BybXNTWUdSTWpJOWJ5ci93dDViMVFJ?=
 =?utf-8?B?V0F3VDltNVNVTVNacktROUU4TjF6b1BOT09uUk9GbE1kNVNGdklWL2k3bTZm?=
 =?utf-8?B?SWRXR3ZCdVd1R2FNSmRJTWN6c0dyQkgzeVdVbkZsNE5mTmZxTFNYTWxpYkNa?=
 =?utf-8?B?VXhCUks1YmtFR0tzamF2azN4cURqenp2NkJBa3ZxREswTVdhTWxOM2I4L01G?=
 =?utf-8?B?MFg5ZzZqTDFMSUdiY1ZXYTUvSjVMeW9tRzdSU1doeVVuWDQ5dkt5OGQyMzRm?=
 =?utf-8?B?V2NmdTExSkhCbTMxTmFwOUtVc1BsRUJjb1RSQks5UDNqRjY1aWtKdkpabWhD?=
 =?utf-8?B?NGVEdndXaFgyc2plZkwyQW8yNGxZY3BGQ3RtdE9BR2VmZGFVUjJrWUNzSFQ5?=
 =?utf-8?B?ZW5UYWxsOTFnYXZVRUZoRE4rRHpVdStOcG5LTko5V0tkL0FnR2ZkZ0E4cmhT?=
 =?utf-8?B?T0Fvdzcydm5HYVlJNEcyNTlxYzkvUjRLV0I2Vklxakp4cDBlMjdabkhrcWw1?=
 =?utf-8?B?TERqNjVLbldXTERCU3diQS9UNU40RnVSOEpjM2czWGpVVENtM09UN2dHTUhQ?=
 =?utf-8?B?enF2eWRlMWRid3BhLzg5Uk5PVHllVnc3ejgvUUlpYitmWjZWaHNUQWxTS09M?=
 =?utf-8?B?cDRGUS9EVzhCZ3h2S0Q3SnhYbXRxa24zMUZLQUMvYVczc3lOU1ByQVgwd1ky?=
 =?utf-8?B?WWtUY3lmQ2pkbFFDWDhZZHc5YmF5SExuYTVKQXVRdWJOM1hCUVFvR2FjaEE1?=
 =?utf-8?B?VjZYK1B0L0RLVFFVblh3TFRXaHl3WlJ1eHJ0YzNhdE5KcFd6WTdXOFZGUWZh?=
 =?utf-8?B?ZlYyY3NZT2lDZEVJMWg3TjdVeThDR1RiVzAzb01NdUU5aFNabEROMEQ2ZVUz?=
 =?utf-8?B?b1NsWlBjbnhvQU9UaHdWc2VQelVBYUNueDUweWZtRndzclh2blVFbkNmQ2tz?=
 =?utf-8?B?S0NpMFFaZDg1SnEzY0ZQTU5VMWFPWFUrTytadVgyZmk1RGVHTVNVOFgrMjc2?=
 =?utf-8?B?OHZ5T1hONjhsNGZFTHFMcVE5Skt1aXoyd1ZFcC96TzFxaFBSS0dQWEtHcFJ6?=
 =?utf-8?B?YmtycUVTMytLRFMwOVJlVCs1dGZwb21FWkoxOFNpU2tmSG1NaERtVXREMEJM?=
 =?utf-8?B?U0hwYUtGRTFaMkw1K01EUzdyOVlXSUx2R0RqMDA5OUMxWWtZdVB5eGhYOVl3?=
 =?utf-8?B?WVl3VmF3ODRMZEpBbWpKRXFxVnA1dVpHdUxmK0dweW55bkNWcnlTWlBKSEhZ?=
 =?utf-8?B?MmhHUmlQdXI1TU5XZVJMMHdyOFZDbjFaQnBYbXE5Y0NhNDBZN29TYmxPMlJj?=
 =?utf-8?B?andUcEFGc3ZtaUpCa21wZFM3b2svUXZYWHlFS2djN2NXamU0ektCV3kwUDBQ?=
 =?utf-8?Q?isYuQIySvaquJMg9uXOGnOWEv+W4SxWGjCmxR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2626825a-b6d1-4aa3-d6b9-08decca9b9ff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:47.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd4qYzmk4Pey7aTun7NtYnETBnIR+hxAl2rfdqASQeb723+BeWrlH0VJ5IEBG/RFUs/c3PoQONlGClsQjYeMWs/pzfs9VAd0dlecsYSJMgDJbChDtu279U8PxMJMHBni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65142-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,sd_1to1.sd:url,i.mx:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3902769C3F8

From: Alice Yuan <alice.yuan@nxp.com>

Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
and enables image data capture through a parallel interface.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v5
- Use subdev_1to1 register function
- Use v4l2_subdev_get_frame_desc_passthrough
- Use dwc csi2 similar logic enable/disable stream
- Add route settup at imx_cpi_init_state()
- Remove V2 register layout support, add it later

change in v4
- remove unnecesary header file.
- use devm_bulk_clk_get().
- update kConfig i.MX8/i.MX9
- Remove define IMX_CPI_DEF_PIX_WIDTH ..., which used once only
- drop get_interface_ctrl_reg1_param
- drop uv-swap
- drop imx_cpi_link_setup by use immutable link.
- use enable/disable_stream() replace depericated .s_stream.
- remove dbg print and reg dump functions.
- use goto/.remove() to do manual cleanup.
- remove imx93 support. Add it later.

change in v3
- replace csi with cpi
- use __free(fwnode_handle) to simpilfy code
- remove imx91 driver data, which is the same as imx93

change in v2
- remove MODULE_ALIAS
- use devm_pm_runtime_enable() and cleanup remove function
- change output format to 1x16. controller convert 2x8 to 1x16 format
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/nxp/Kconfig            |  12 +
 drivers/media/platform/nxp/Makefile           |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c | 614 ++++++++++++++++++++++++++
 4 files changed, 628 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index deeec900ad071..e28b395734ef5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16263,6 +16263,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
+F:	drivers/media/platform/nxp/imx-parallel-cpi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c
 F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
 
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e21..90f7c792003f2 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -39,6 +39,18 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
+config VIDEO_IMX_PARALLEL_CPI
+	tristate "NXP i.MX8/i.MX9 Parallel CPI Driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_1TO1
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
+	  on some iMX8 and iMX9 SoCs.
+
 source "drivers/media/platform/nxp/imx8-isi/Kconfig"
 
 # mem2mem drivers
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb7136525..5346919d2f108 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -7,5 +7,6 @@ obj-y += imx8-isi/
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
+obj-$(CONFIG_VIDEO_IMX_PARALLEL_CPI) += imx-parallel-cpi.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
new file mode 100644
index 0000000000000..00f5d5f47644b
--- /dev/null
+++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
@@ -0,0 +1,614 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * i.MX Parallel CPI receiver driver.
+ *
+ * Copyright 2019-2025 NXP
+ *
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-device-1to1.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CI_PI INTERFACE CONTROL */
+#define IF_CTRL_REG_PL_ENABLE			BIT(0)
+#define IF_CTRL_REG_PL_VALID			BIT(1)
+#define IF_CTRL_REG_DATA_TYPE_SEL		BIT(8)
+#define IF_CTRL_REG_DATA_TYPE(x)		FIELD_PREP(GENMASK(13, 9), (x))
+
+#define DATA_TYPE_OUT_NULL			0x00
+#define DATA_TYPE_OUT_RGB			0x04
+#define DATA_TYPE_OUT_YUV444			0x08
+#define DATA_TYPE_OUT_YYU420_ODD		0x10
+#define DATA_TYPE_OUT_YYU420_EVEN		0x12
+#define DATA_TYPE_OUT_YYY_ODD			0x18
+#define DATA_TYPE_OUT_UYVY_EVEN			0x1a
+#define DATA_TYPE_OUT_RAW			0x1c
+
+#define IF_CTRL_REG_IF_FORCE_HSYNV_OVERRIDE	0x4
+#define IF_CTRL_REG_IF_FORCE_VSYNV_OVERRIDE	0x2
+#define IF_CTRL_REG_IF_FORCE_DATA_ENABLE_OVERRIDE	0x1
+
+/* CPI INTERFACE CONTROL REG */
+#define CPI_CTRL_REG_CPI_EN			BIT(0)
+#define CPI_CTRL_REG_PIXEL_CLK_POL		BIT(1)
+#define CPI_CTRL_REG_HSYNC_POL			BIT(2)
+#define CPI_CTRL_REG_VSYNC_POL			BIT(3)
+#define CPI_CTRL_REG_DE_POL			BIT(4)
+#define CPI_CTRL_REG_PIXEL_DATA_POL		BIT(5)
+#define CPI_CTRL_REG_CCIR_EXT_VSYNC_EN		BIT(6)
+#define CPI_CTRL_REG_CCIR_EN			BIT(7)
+#define CPI_CTRL_REG_CCIR_VIDEO_MODE		BIT(8)
+#define CPI_CTRL_REG_CCIR_NTSC_EN		BIT(9)
+#define CPI_CTRL_REG_CCIR_VSYNC_RESET_EN	BIT(10)
+#define CPI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN	BIT(11)
+#define CPI_CTRL_REG_HSYNC_FORCE_EN		BIT(12)
+#define CPI_CTRL_REG_VSYNC_FORCE_EN		BIT(13)
+#define CPI_CTRL_REG_GCLK_MODE_EN		BIT(14)
+#define CPI_CTRL_REG_VALID_SEL			BIT(15)
+#define CPI_CTRL_REG_RAW_OUT_SEL		BIT(16)
+#define CPI_CTRL_REG_HSYNC_OUT_SEL		BIT(17)
+#define CPI_CTRL_REG_HSYNC_PULSE(x)		FIELD_PREP(GENMASK(21, 19), (x))
+#define CPI_CTRL_REG_UV_SWAP_EN			BIT(22)
+#define CPI_CTRL_REG_DATA_TYPE_IN(x)		FIELD_PREP(GENMASK(26, 23), (x))
+#define CPI_CTRL_REG_MASK_VSYNC_COUNTER(x)	FIELD_PREP(GENMASK(28, 27), (x))
+#define CPI_CTRL_REG_SOFTRST			BIT(31)
+
+/* CPI INTERFACE STATUS */
+#define CPI_STATUS_FIELD_TOGGLE			BIT(0)
+#define CPI_STATUS_ECC_ERROR			BIT(1)
+
+/* CPI INTERFACE CONTROL REG1 */
+#define CPI_CTRL_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(15, 0), (v))
+#define CPI_CTRL_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
+
+#define CPI_CTRL_V2_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(16, 0), (v))
+#define CPI_CTRL_V2_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
+
+/* Need match field DATA_TYPE_IN definition at CPI CTRL register */
+enum cpi_in_data_type {
+	CPI_IN_DT_UYVY_BT656_8 = 0x0,
+	CPI_IN_DT_UYVY_BT656_10,
+	CPI_IN_DT_RGB_8,
+	CPI_IN_DT_BGR_8,
+	CPI_IN_DT_YVYU_8 = 0x5,
+	CPI_IN_DT_YUV_8,
+	CPI_IN_DT_RAW_8 = 0x9,
+	CPI_IN_DT_RAW_10,
+};
+
+enum {
+	PI_GATE_CLOCK_MODE,
+	PI_CCIR_MODE,
+};
+
+enum {
+	PI_V1,
+};
+
+struct imx_cpi_plat_data {
+	u32 version;
+	u32 if_ctrl_reg;
+	u32 interface_status;
+	u32 interface_ctrl_reg;
+	u32 interface_ctrl_reg1;
+};
+
+struct imx_cpi_device {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	struct v4l2_subdev_1to1 sd_1to1;
+
+	const struct imx_cpi_plat_data *pdata;
+
+	u32 enabled_streams;
+	u8 mode;
+};
+
+struct imx_cpi_pix_format {
+	u32 code;
+	u32 output;
+	u32 data_type;
+	u8 width;
+};
+
+static const struct imx_cpi_pix_format imx_cpi_formats[] = {
+	/* YUV formats. */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.output = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = CPI_IN_DT_UYVY_BT656_8,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.output = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = CPI_IN_DT_YVYU_8,
+		.width = 16,
+	},
+};
+
+static const struct imx_cpi_plat_data imx8qxp_pdata = {
+	.version = PI_V1,
+	.if_ctrl_reg = 0x0,
+	.interface_status = 0x20,
+	.interface_ctrl_reg = 0x10,
+	.interface_ctrl_reg1 = 0x30,
+};
+
+static const struct imx_cpi_pix_format *find_imx_cpi_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx_cpi_formats); i++)
+		if (code == imx_cpi_formats[i].code)
+			return &imx_cpi_formats[i];
+
+	return NULL;
+}
+
+static void imx_cpi_sw_reset(struct imx_cpi_device *pcpidev)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Softwaret Reset */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val |= CPI_CTRL_REG_SOFTRST;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	fsleep(500);
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CPI_CTRL_REG_SOFTRST;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_hw_config(struct imx_cpi_device *pcpidev,
+			      const struct imx_cpi_pix_format *pcpidev_fmt)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 flags = pcpidev->sd_1to1.vep.bus.parallel.flags;
+	bool hsync_pol = flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH;
+	bool vsync_pol = flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH;
+	u32 val;
+
+	/* Software Reset */
+	imx_cpi_sw_reset(pcpidev);
+
+	/* Config PL Data Type */
+	val = IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);
+	val |= IF_CTRL_REG_PL_ENABLE | IF_CTRL_REG_PL_VALID;
+	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
+
+	/* Config CTRL REG */
+	val = CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN;
+
+	val |= CPI_CTRL_REG_DATA_TYPE_IN(pcpidev_fmt->data_type) |
+	       FIELD_PREP(CPI_CTRL_REG_HSYNC_POL, hsync_pol) |
+	       FIELD_PREP(CPI_CTRL_REG_VSYNC_POL, vsync_pol) |
+	       FIELD_PREP(CPI_CTRL_REG_PIXEL_CLK_POL, 0) |
+	       CPI_CTRL_REG_MASK_VSYNC_COUNTER(3) |
+	       CPI_CTRL_REG_HSYNC_PULSE(2);
+
+	if (pcpidev_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	    pcpidev_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8)
+		val |= CPI_CTRL_REG_UV_SWAP_EN;
+
+	if (pcpidev->mode == PI_GATE_CLOCK_MODE) {
+		val |= CPI_CTRL_REG_GCLK_MODE_EN;
+	} else if (pcpidev->mode == PI_CCIR_MODE) {
+		val |= (CPI_CTRL_REG_CCIR_EN |
+			CPI_CTRL_REG_CCIR_VSYNC_RESET_EN |
+			CPI_CTRL_REG_CCIR_EXT_VSYNC_EN |
+			CPI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN);
+	}
+
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_config_ctrl_reg1(struct imx_cpi_device *pcpidev,
+				     const struct v4l2_mbus_framefmt *format)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 pixel_width;
+	u32 vsync_pulse;
+	u32 val;
+
+	pixel_width = format->width - 1;
+	vsync_pulse = format->width << 1;
+
+	switch (pcpidev->pdata->version) {
+	case PI_V1:
+		val = CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
+		      CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse);
+		break;
+	default:
+		val = 0; /* Never happen */
+	}
+
+	val = CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
+	      CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse);
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg1);
+}
+
+static void imx_cpi_enable(struct imx_cpi_device *pcpidev)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Enable CPI */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val |= CPI_CTRL_REG_CPI_EN;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable SYNC Force */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~(CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_disable(struct imx_cpi_device *pcpidev)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Enable Sync Force */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val |= CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable CPI */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CPI_CTRL_REG_CPI_EN;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable Pixel Link */
+	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
+	val &= ~(IF_CTRL_REG_PL_VALID | IF_CTRL_REG_PL_ENABLE);
+	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
+}
+
+static struct imx_cpi_device *sd_to_imx_cpi_device(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct imx_cpi_device, sd_1to1.sd);
+}
+
+static const struct media_entity_operations imx_cpi_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int imx_cpi_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *sdformat)
+{
+	struct imx_cpi_pix_format const *pcpidev_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+
+	/*
+	 * The Parallel cpi can't transcode in any way, the source format
+	 * can't be modified.
+	 */
+	if (sdformat->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	pcpidev_fmt = find_imx_cpi_format(sdformat->format.code);
+	if (!pcpidev_fmt)
+		pcpidev_fmt = &imx_cpi_formats[0];
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+
+	fmt->code = pcpidev_fmt->code;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = sdformat->format.colorspace;
+	fmt->quantization = sdformat->format.quantization;
+	fmt->xfer_func = sdformat->format.xfer_func;
+	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
+
+	sdformat->format = *fmt;
+
+	/* Propagate the format from sink to source. */
+	fmt = v4l2_subdev_state_get_format(sd_state, V4L2_SUBDEV_1TO1_PADS_SOURCE);
+	*fmt = sdformat->format;
+
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = pcpidev_fmt->output;
+
+	return 0;
+}
+
+static int imx_cpi_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = V4L2_SUBDEV_1TO1_PADS_SINK,
+			.sink_stream = 0,
+			.source_pad = V4L2_SUBDEV_1TO1_PADS_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	fmt->code = imx_cpi_formats[0].code;
+	fmt->width = 1920;
+	fmt->height = 1080;
+
+	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(false,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, fmt);
+}
+
+static int imx_cpi_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = pcpidev->dev;
+	struct v4l2_subdev *remote_sd;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
+
+	pcpidev->enabled_streams &= ~streams_mask;
+
+	if (!pcpidev->enabled_streams) {
+		imx_cpi_disable(pcpidev);
+		pm_runtime_put_autosuspend(dev);
+	}
+
+	return 0;
+}
+
+static int imx_cpi_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+	const struct imx_cpi_pix_format *pcpidev_fmt;
+	const struct v4l2_mbus_framefmt *format;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = pcpidev->dev;
+	struct v4l2_subdev *remote_sd;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
+					       &streams_mask);
+
+	format = v4l2_subdev_state_get_format(state, V4L2_SUBDEV_1TO1_PADS_SINK);
+	pcpidev_fmt = find_imx_cpi_format(format->code);
+
+	if (!pcpidev->enabled_streams) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		imx_cpi_hw_config(pcpidev, pcpidev_fmt);
+		imx_cpi_config_ctrl_reg1(pcpidev, format);
+		imx_cpi_enable(pcpidev);
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		goto err_cpi_stop;
+
+	pcpidev->enabled_streams |= streams_mask;
+
+	return 0;
+
+err_cpi_stop:
+	/* Stop CSI hardware if no streams are enabled */
+	if (!pcpidev->enabled_streams)
+		imx_cpi_disable(pcpidev);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static int imx_cpi_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	/*
+	 * The PARALLEL CPI can't transcode in any way, the source format
+	 * is identical to the sink format.
+	 */
+	if (code->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->pad != V4L2_SUBDEV_1TO1_PADS_SINK)
+		return -EINVAL;
+
+	if (code->index >= ARRAY_SIZE(imx_cpi_formats))
+		return -EINVAL;
+
+	code->code = imx_cpi_formats[code->index].code;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops imx_cpi_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops imx_cpi_pad_ops = {
+	.enum_mbus_code = imx_cpi_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = imx_cpi_set_fmt,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.enable_streams = imx_cpi_enable_streams,
+	.disable_streams = imx_cpi_disable_streams,
+};
+
+static const struct v4l2_subdev_ops imx_cpi_subdev_ops = {
+	.pad = &imx_cpi_pad_ops,
+	.video = &imx_cpi_video_ops,
+};
+
+static const struct v4l2_subdev_internal_ops imx_cpi_internal_ops = {
+	.init_state = imx_cpi_init_state,
+};
+
+/* ----------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int imx_cpi_runtime_suspend(struct device *dev)
+{
+	struct imx_cpi_device *pcpidev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(pcpidev->num_clks, pcpidev->clks);
+
+	return 0;
+}
+
+static int imx_cpi_runtime_resume(struct device *dev)
+{
+	struct imx_cpi_device *pcpidev = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(pcpidev->num_clks, pcpidev->clks);
+}
+
+static const struct dev_pm_ops imx_cpi_pm_ops = {
+	RUNTIME_PM_OPS(imx_cpi_runtime_suspend, imx_cpi_runtime_resume, NULL)
+};
+
+static void imx_cpi_remove(struct platform_device *pdev)
+{
+	struct imx_cpi_device *pcpidev = platform_get_drvdata(pdev);
+
+	media_async_subdev_1to1_cleanup(&pcpidev->sd_1to1);
+}
+
+static int imx_cpi_probe(struct platform_device *pdev)
+{
+	struct imx_cpi_device *pcpidev;
+	struct device *dev = &pdev->dev;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	pcpidev = devm_kzalloc(dev, sizeof(*pcpidev), GFP_KERNEL);
+	if (!pcpidev)
+		return -ENOMEM;
+
+	pcpidev->dev = dev;
+	platform_set_drvdata(pdev, pcpidev);
+
+	pcpidev->pdata = of_device_get_match_data(dev);
+	pcpidev->mode = PI_GATE_CLOCK_MODE;
+
+	pcpidev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcpidev->regs))
+		return dev_err_probe(dev, PTR_ERR(pcpidev->regs),
+				     "Failed to get regs\n");
+
+	pcpidev->num_clks = devm_clk_bulk_get_all(dev, &pcpidev->clks);
+	if (pcpidev->num_clks < 0)
+		return pcpidev->num_clks;
+
+	sd = &pcpidev->sd_1to1.sd;
+
+	v4l2_subdev_init(sd, &imx_cpi_subdev_ops);
+
+	sd->internal_ops = &imx_cpi_internal_ops;
+	snprintf(sd->name, sizeof(sd->name), "parallel-%s",
+		 dev_name(pcpidev->dev));
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &imx_cpi_entity_ops;
+
+	sd->dev = pcpidev->dev;
+	pcpidev->sd_1to1.remote_bustype_cap_mask = BIT(V4L2_MBUS_PARALLEL);
+
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	return media_async_register_subdev_1to1(&pcpidev->sd_1to1);
+}
+
+static const struct of_device_id imx_cpi_of_match[] = {
+	{ .compatible = "fsl,imx8qxp-pcif", .data = &imx8qxp_pdata },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, imx_cpi_of_match);
+
+static struct platform_driver imx_cpi_driver = {
+	.probe = imx_cpi_probe,
+	.remove = imx_cpi_remove,
+	.driver = {
+		.of_match_table = imx_cpi_of_match,
+		.name = "imx-parallel-cpi",
+		.pm = pm_ptr(&imx_cpi_pm_ops),
+	},
+};
+
+module_platform_driver(imx_cpi_driver);
+
+MODULE_DESCRIPTION("i.MX9 Parallel CPI receiver driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


