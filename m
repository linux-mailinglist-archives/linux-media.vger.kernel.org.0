Return-Path: <linux-media+bounces-41148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507F9B37F5A
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 132F1460D4C
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E4B34AAF7;
	Wed, 27 Aug 2025 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wy25d/L6"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E944A2FA0F3;
	Wed, 27 Aug 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288479; cv=fail; b=NONeVSSPQpb7WJvNWrVV7RB57Aa5bnV2SlRMHtHNAi9RTBzaA2MsDLfh04LnpGHf0DNNOBevJOF+QVCGPJ3iDU/h6iYv0EoK9XQHU18MzaobzGSzxmqN9K/BAj7MAE6SyWTj5vStyRUjvD4Mfs1bYaJ3EZsheyE1U3/+x0yuJ4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288479; c=relaxed/simple;
	bh=TAzhvoXChlcNP0ohb6AsuWFWGtXrmUaEJOHuMNftXsM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jw+7Ms5VT/4Vpqebma5mVMLWZX8/xY2ptr40ZUQUCKU2x1Hx/7UHSuXGkjLE6RDCSu8faGxoEAuQFSbKoAypcTfpP1rtNsrHXB1p8cfBg9gtP72i+5r0xMaZACUBWHtsDITn2Y8y1a1NuN12FWA2FEs48Uy/JRgIu8BEw2N15hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wy25d/L6; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLOplDbpIo2CA24yxSIhHX1F+jTU7ctlypzzGJmY4JVv1pbGhKRIApvAXdouq1ljBfFq1ccF2IQuxcAaVofOa9L0ZrvZUKap1DH09zXZOxKBfKF1hDNF5Xho0+cq4ej2TMD7ADgiW3i1xIhAXQcBYUIjoq5rFqAIvAHB6iW2mvAPk2ppUFYMXdBhDyRFtI33XpQEuzQBd4fwAvhsrmxPtUXBu8MAUQEf3hleDijJRlrNA1jYGNbPlXuL5/wo/+MH+WN+peE9XONIrv2fiUE4WC0ye5GFgotHEboG/yGBRcN3Vy0rGNsTsy2Z8xM5Kzk6yImno9aUXGPlwpP1/XkFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+WK0Xefl0RnALjUgmb1OmqGfLvDaA9HJ1fHHNKH9RE=;
 b=XLracgfBF/+vg2lc5pPiybcGVv0pLsy9unc5yOlN454o5yyy/XV9BmM8JwIuhQ23rv9lT/MiIPbsYtIVWSd17QAlzPm8LwluKVwbXPI6O7l8ALETTGrqz/68K1Q+tJxnXP7E18/2UrdocmWEmaMUWu1LAkCG9n3rgSER2Q3OniuR0YHptdw5ERi3h/i2V/RmwXf83oS9b+nsXu59hlgdJmsL+be6JBfCyv8HtGM3ygDg3F6CUTyCHEm4cxB/bGzbcspc1qFxSRSVMFfpapEBeIIIMAvkRjQO2jhX2jheajDIh5eFP7GqC4liV8aBCO8Ok1kvscFjs7a3DW+gYtxjXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+WK0Xefl0RnALjUgmb1OmqGfLvDaA9HJ1fHHNKH9RE=;
 b=Wy25d/L6NxnKgO/C3EAu9B61OjZADQaJi+xwJGBj0mVWGF0mPkVKc90wVCUhX4z6SDcPLakPEqMbV/S8zGYNt518fPUTsR6vcHqOeZNf84+LBzaO1JAGC+Upf37aIPwdrZWVcUxVZ0ylxkPky2j1wZRyaP7/ASHZX4k9sQaH8/gmOLt2dKg2BN6OjrNVdBDanXR6uOQzI5QHnaPdrajPBRdQKPTD6ABN1oSb/60HN209Tz86UxtGTUWKZUQqjjPltuxIEyUswGZd7aQe7pQzJKt3/9zjyp1+2K5DIMROHGrosojqdCxi9Rpi/0p6nLw4vIGXk4vV1HOvSJ2f8H5KYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8839.eurprd04.prod.outlook.com (2603:10a6:10:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 09:54:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 09:54:33 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 27 Aug 2025 17:53:50 +0800
Subject: [PATCH 3/5] media: nxp: imx8-isi: Add parallel camera input
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-isi_imx93-v1-3-83e6b4b50c4d@nxp.com>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
In-Reply-To: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756288458; l=1708;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=PaSafpcCilhrdkpI2iSFsEUabWSmp6X1DZouALyKUCw=;
 b=88S/U9by+m5Gwlmj/rV44iz+ZCGNtQXTNLzMbZ9Se7RCowMqNAQ6S8kV3oj7DdKncwCAcu/wn
 ltzQmkcGhncBB1tSbSV4OKXk3kF7P/UiK/5fKDFIraVNZ3cJtcFiADV
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: 235056da-95d9-4467-8a3d-08dde54fb96f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|366016|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cTY0VnE3eFZzV1VZNzlkZXNZTUlkRDZjNTRJdnA3M25JRk1XNm1NV3MrYnpn?=
 =?utf-8?B?OXRZMEJHTFR1Z2hKd3ZrZjlHZWh3emY1NlhiUFExclZsTVlNOTZnbVN2OEVO?=
 =?utf-8?B?R3BnaXVPMU45NEs4VGtNVXBqUWsvbGJETlZhTTNIUk5yTG40NG1zTnh6MDJr?=
 =?utf-8?B?dHBUaUhvbnErbmJxYlV1YzlybDVLcjBidTAybGRpYzlWWlVrRU9hK0F5eXlD?=
 =?utf-8?B?VFNLN1N1emVPajlRcjRFY2xkRXo5T0hCVEM2SndPdUdmTGRUUk9TaTFFOWpN?=
 =?utf-8?B?bS95VnBrNjEvbkQ2MElGWHp2cU43N1BUQ3V3eFpsZHI5L3dPbWF2M1Zkd2xp?=
 =?utf-8?B?Tko3ci91NTRWYmhRQWlpSVBreXhrWDI4cndHOW0yVW9MTy9OZVVra0M4R3Vx?=
 =?utf-8?B?aFVsU2Y4WGJkdk5HbVp5SDlTaEtQR0I5eUR6WnNKS0pKV0lPWVQwUzV1YmtJ?=
 =?utf-8?B?bEgzOUZOSTZwR0hPN3AwTWNjZ3NMYXBoWmxZSFJWVU1RUVlxWWhCb1NaYVhS?=
 =?utf-8?B?MVVMTVBzQTVacXFtSXV0RmFPWDA4VXJHVXZDWWx6OE1BaWxLVmZZQmxYUnZL?=
 =?utf-8?B?R2NmZjB0TXdZdGhGaDdDWnRTTHZOMVJWa2VTc0trRW8wRGNJOCsydC8xa3k2?=
 =?utf-8?B?Y3lHWlVObWdBQmdubkZEbTd0SXM4eTc2Zi9MUVh3S3MzRjRNTFVWNzV0Wm1M?=
 =?utf-8?B?T2NUYmNZUWFWZTE4VWNZMzVQTGdWd3ZESnNORzMxZUMxWU4xc241YW0wNmJF?=
 =?utf-8?B?ci9JQ1ppZ05UYWJIMDhXUEpGT0hBSWQzMHpjTzh1ZVFiRlVGdGIxSEZoUlN6?=
 =?utf-8?B?OUJNMHkxaEFvQ2tYYkljOVRBWFRHT1pNdHdpRGxZRllQcmlKY0NpM0hKSU4v?=
 =?utf-8?B?aW4rVlpFNldlOW94NHM5aTkvVzd2Wk15V3h0RERmMkswTWlrQm5xbnRvK0tx?=
 =?utf-8?B?MnZHbm9oY3VWUFp3cGc3bktxSERJQS92M3R6OGJQTEJYV2txRnlJcTExUXVn?=
 =?utf-8?B?bGh0QzZzTmUzZ0RBN2EwZWRlUlNHSk1YRUdlMHVkZGd1ZkFGcGY0NFB2ZFBk?=
 =?utf-8?B?UXdVZ3drbVFUVDJtbTMraW9IUVJmRW9vUUtJVURVcExRYkEvbG9ac08xOU5N?=
 =?utf-8?B?QWM0RGtIampsNEJuSEZHMzBIV1pwcDVYWnN0SCtGYnEvTzJ2ZkpkVVpUeWtU?=
 =?utf-8?B?RmpOclhmclJkbXd5WkQxMEM3ZldhQnlUT2tOTURDVzZtSUw4ZWlwZFVzMEw0?=
 =?utf-8?B?UURrallNdEJOd3Y4OGdPOFRzbU9Ga3dIM1lOcjRSSlQ0T2xpdmcyQlNlcGhU?=
 =?utf-8?B?SVJ0MXlqMGdpclRqZ2lHbXZVYlhPVkNtd3kwVy9tenQxV1U0bUhjRjA4Sm1C?=
 =?utf-8?B?aG54M0JaU0JabHRQMVZUQ054SlM4czJxRk5vQmljeVJvNzk2OXdaRitySzNo?=
 =?utf-8?B?U0Vkd0RNeTY2Q0V2Z2o3aXphS3Fkek5wK0JXdWN5SW1BNVl3ZnRZNEFzSlhk?=
 =?utf-8?B?NklaQzgzR2FSWEltSG9FT3FIQ0wyanptU2lSbTU2bHpMNzZPZGJrUVkyZHNn?=
 =?utf-8?B?MkhVN0UrUHVaMDV1N0tyaUNQQ3AraUcxQ0pFL0NYTzJZcURTYjkvd0NJWVhw?=
 =?utf-8?B?ZkV5bXVHQ3hTTldtQjRaTDB5WXlycCtLWFNqRitPOE9KZS9OSVBaV25wU00z?=
 =?utf-8?B?LzJCb1BBTlFveTQ3LytKaVRnL3h1RWJPb0lYa2o3dkx5d0lZcUZWSEIxNUw5?=
 =?utf-8?B?aERvcGhRc0IwbnprdTA1UStVVjVVdUV6Wm44QmxSOFRsYVNYenRLSm5YZmd1?=
 =?utf-8?B?SWxsRDdyZUhsUDBsTVd1TEtJaEl6S2VidThUWXg2RlplU043OEFad2s1dDl6?=
 =?utf-8?B?MEI5QlZYT2JkUWRKaFFKUy93YXc2dkxycFdKM1dsTldCSWFzcjFlY0FHeE5p?=
 =?utf-8?B?MkNHbWlPSmYxRnV1K1ZQTTlEeTl6YTVFeElPdTlibVcwbmt1R1ZJR3JaUTZt?=
 =?utf-8?Q?Qjlpzikm9WAHT5I+SjisOnR04Q6NlI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c2N6RGozUDFvUHRQK29iTHFoZzJGMXp2cU9jUlZZbmFOMG5xYkZHR0JxUjcr?=
 =?utf-8?B?T2F4SlVSNEpEUlZqQ2YxR05XK003aEpmcFdpMHBSWHVSYU5ET2FhclNwaHpn?=
 =?utf-8?B?L1hWaUJ1OVUwSVZOYngybnpERnQ2SG1NNjVmd29ybWRyVENrSndGanAzbXlz?=
 =?utf-8?B?Z245TGIweFR4QUljZ3ZZeUpLSTViVGtqbGRMOXlzVFBBRFZUa3ZyWGtZbnE0?=
 =?utf-8?B?MUhLVnJEanVxdjg0NWRIQnVFQkVtczR6akM4S2J1Zk1QZFFsbXl5Y3JYZi9U?=
 =?utf-8?B?TTBla284K0R0ZXc3TS9FdjFjb1g3Tk4rallmdnB2VlM5dGR4dUxNc3VscEdo?=
 =?utf-8?B?TlRRNmtKdm82ZVVwMVBkVkdjaTI1WFhjdVVINGN0OHN6YXBlSU1TRHBvbjd5?=
 =?utf-8?B?b0FPRGc0V1RKcDRZR2xYUUF1SEJVS0p6a0pmcHRpbjhibkNoSGdJY2ZoNTBL?=
 =?utf-8?B?eDgvL2l0K2F4bDg4dzBsZkhUTTN1bkU3MHRPUXkvUEQ3cVR3NkF6ZnhVclMy?=
 =?utf-8?B?RFJ0UDloSzA2S05zSHJobEkwbm1jb3pERUF6SzYyNG56NlBjNXBjMm5iejdt?=
 =?utf-8?B?M0RleFU2UmxNSm42Ujdhb2ozZDdBdmlGV0w4eURoSHdkbHh6am45ZEFJUFh6?=
 =?utf-8?B?VWRUR0YrSC9sNmtIM0NtSDh4aWQ5WjNHeGpBeFhsRDhBK0I0VnRaUVRjcHlx?=
 =?utf-8?B?MVpTL1pXSzZ0VS81RGluSnZpMzQ5aDJhQzFIZUM1djQyYldsY3J2bDNVK3pL?=
 =?utf-8?B?RTBNQWl3NXJFL2svTzNIR2REZmo5ZlhrKzV5OTBKNy9odW1uYzdtTjhaMHB1?=
 =?utf-8?B?TjRBUkFzM2RSS2t2MUNBM3lic1I0NzJ3cTNtMXZXSmRqTjVYTjFpYUxZUk1u?=
 =?utf-8?B?eUpUMGg3blVMc21VVW9RdVVWOUNpeDhnL01BcjhzRWRnb2pZNEl5U1Bic251?=
 =?utf-8?B?OUQzNWl5OHB4TWlRSVRkNFZHaExDb1BCcDJNalJGejhVUmpIc0w5R0tzUm9V?=
 =?utf-8?B?aG1rQ3hZNFdNSWIvWnAxOVBwbGw3UWxBWlpTaStibUlMc0JPbGxJTEtub0Er?=
 =?utf-8?B?WmpIaktBNWJNSWNkclIxSzVucmYwRVRDTDlzQy9KQnBza0RoL3p6ZXN1ajJW?=
 =?utf-8?B?cU10cnZ2Zithc1lSSVdRdFZoM1pENXJwamROS2JiTy9selB2bStwWlQ3Z1JW?=
 =?utf-8?B?WmhlbHRJMEMxR05Kb0JydC9aVnVycUdmRERHeXR3QVNxWWwwU05qek9kd2ww?=
 =?utf-8?B?ekN3TWFvSDdURlhPeUpUbWg4SkpBclBvTk8veUI0ZzZmbkVMY3E3OWl2bGF6?=
 =?utf-8?B?L3FudG5HWGJtbmRTVUdkMEJ2eklsVCtIYXB1TFBSN0JtTXVGbXozWTNwcUVT?=
 =?utf-8?B?cU91ZGczd2RSQ2RRTUxFY2dQQUUvRXQ5c1o2QXNtWm5VRjRYM1BJY09yRnFw?=
 =?utf-8?B?eDNnblNXSndRekZScHcwNmRLZ1V6VE9oWlZNaWFhZ2M0Zmt1VGhSMjRYbmtZ?=
 =?utf-8?B?R0x1N3FISy95RU1aSFpxd3V6YU5nYmlvZUFVSWVSMFZZZHRwY0dlSmt2SGx4?=
 =?utf-8?B?bXVKL3hQc3RrSXhBckZiNG14NVRKNHhMbDVHY0o5d2RCWndZcFQxWEdEQzBx?=
 =?utf-8?B?SnNMWjJFUDJBbXRBRGg2K284ZFZXVEVzVWRDaCtyd1RwRS80RDJZQ3hMWTRn?=
 =?utf-8?B?Z0NTeXpkc05jRkltdnlZN3Q4Smd3ZGFvRDlyN0UvN0F1bXFubENMV0MyZFJH?=
 =?utf-8?B?QmJ0M3VMcHBpUGZqM0dndzRJT1NIUVMxQUpmQkl2ckVHWitxTmFvcXVIQjdM?=
 =?utf-8?B?MStpSGk2TXVDNUVrQkswSlQ3REltRytveVQ0OWlHUnRpc3dsZDVlS3dpclZq?=
 =?utf-8?B?K04zSHh5a2FNc0lWSys5MTdFc1o1WWhOL0xiUFE5TE5OVkFYaGZFY3ZYekgx?=
 =?utf-8?B?c1FUbFJrcjJwMTY1b1FpWTBCaVpNRlA1Y2hlOGZ6bkZEUG1KTHA2MFhLcUtZ?=
 =?utf-8?B?SXdjMzJGMzBqRXl1UWRSUzluWHZoMUhWVXIrQVJjQlR3MG56Wk5ZdE5rTnRV?=
 =?utf-8?B?TyttVy8vdElJRmMzRUVCT1NFcWExU1F4SFdLUUFzYld4YkhacjdEVUFqMnFM?=
 =?utf-8?Q?oLrEQnI49hKeCfweJvl1Dz6Jn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235056da-95d9-4467-8a3d-08dde54fb96f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:54:33.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaDKhO2ahO7dohNtSgIjEWLwBl5/fpY0IFaaHbvGrvgJy5xZ7VPbxgdCVv5tQBxum3oygfVdUQ+4IEyzuttufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8839

From: Alice Yuan <alice.yuan@nxp.com>

The ISI module on i.MX93 implements one camera input which can be
connected to either of MIPI CSI-2 or parallel camera. The source
type can be selected by setting camera mux control register.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index c05e26798032367813c8730550a7eec2f237b4eb..139226c46cf96d4086716f9f20a876b20eb0e22a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -59,6 +59,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
 #define DISP_MIX_CAMERA_MUX                     0x30
 #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
 #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
+#define DISP_MIX_CAMERA_MUX_GASKET_SRC          BIT(17)
 
 static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
 				    const struct v4l2_mbus_frame_desc *fd,
@@ -69,6 +70,16 @@ static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
 
 	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
 	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+
+	/*
+	 * CAMERA MUX
+	 * - [17]:	Selects source input to gasket
+	 *		0: Data from MIPI CSI
+	 *		1: Data from parallel camera
+	 */
+	if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL)
+		val |= DISP_MIX_CAMERA_MUX_GASKET_SRC;
+
 	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
 }
 

-- 
2.34.1


