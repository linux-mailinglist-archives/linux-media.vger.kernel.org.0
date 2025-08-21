Return-Path: <linux-media+bounces-40683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F0B3060F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4B101CE3990
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD39B38892D;
	Thu, 21 Aug 2025 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nErQRUMS"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57543388919;
	Thu, 21 Aug 2025 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807536; cv=fail; b=Q7Qioy7c5PNQKJEqdxAkBuddcQN2Bc0c80ss6qILAMtLD9l/EjzO/Iri3G0oQpgLx6+kNTNG+EDgNe7QHEyVkctqGm5Fs+PYzUew4rRTz9vM0y1blem60e656rNXWN2tys2C0IO+lWIQUAAH6IH6w8BSo1YL+TPZkRR4SFZH3xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807536; c=relaxed/simple;
	bh=ypyi9dWWD6DRA92i+iXhKzNLY/EfU98N3gcGWAudk/4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UVTw4l6Lv1o9ywfS0fORwdkvsbuCl4bcgc/0DFB9qRq9Rm1eeGAWFTcLEDDFSouz/UoyVXbCQ4Yx8SpK81i3V/MeZHtj6PGpWEa4Z+zCHpI2iehPFK8qux199ZPR9LGGiA9C6cGjLsAAxVYSOSlAV3kz1HUIJy01KSx7/JXErbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nErQRUMS; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEovuoelbmtE/UwsxjAXIR9Wo4P2puZxF89I1fJsGsjIj5EDCjyBXHzcfiJZl6vLCZk2G2NQvW7HD+1e8+SXUwdPgkWfA+/RPjgZojqeUYRP/Yx6EvgV7WLLf2XN83/TwOVNLCDiPk541SoIm62w+srNn8k2+HMcndbQAfi5UDL4WokSSkCSHANntE1w1X6BIE+BBSprzOInSbzEl+H330n2wEUZc2nyNkzVaN3Ig/tfeLn5Dbo7z0Q4OtD6cLNO1fjbNYZ2KwirfJVNybi8l+N5RxMnwdXYvWYDGejZ9oJ79Y3J0dY0NNkNvJ8HvEQh+1W1BhmA0ZBs6I3mJVpTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4BQ/23/FwegifJrWHjyYmdRJKa8FoIuJVHKAaPOdEo=;
 b=doAkMO/uWHB/rtzJ1Y4pCNoxp2sVsiXJsFYyxtTPat87+6plPu9GJpfq5+wgF8iXD5L2G5OqOkAVgwYChlgWw5y2BdrxpPqVkVJycJftW4GgExtQwRUxphysF0r3xznWI+p8cm4MVbWgMzELFU2gUUZqnskGnAmydbMv6LlKO1G3XH+ZM8jZQWI+VDiVQD6n7qh2s0uNGyKFYDC623cM6IuF12TMbXqvumO2h9tZteRFNv/kfzVB0B/tCVRZNSix2V6XnQuNWPhryh31Dkg98JLitlJpajwAsPOCzaXLaz8KLAyrnjeapEeyLgyBsr/AQhx9PNyLHwQoexhQ2JD/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4BQ/23/FwegifJrWHjyYmdRJKa8FoIuJVHKAaPOdEo=;
 b=nErQRUMSbXhT2sgmZBi+78exK8l5fKOAusM3OsQ/O3sSARKzLz6k0jKHKvLHhkPUQ/zNl29ssEb0gnVRQ54D45G+LlZvmPvyF0JOZ/ERI6abEL6PHk1L2wu6R6bqz4LJkNurDEskHjbFQFI1L3QUpPpm/g2ApLE/ddCbIXkLuCc8X8MAKOpmlO8pUEJ6kHvKVid852kkOBj1aoGa+KC/Nak9hNxWCYNJ3GFLkF5xZ/htXvnBQkUzaNPNKwxfGCJEChrQy8JCHfYLqbIgOOjZR/TdqnwT3V+vlKNc6GM1UaI0R+DJqMm0DI+u4dgTUoyOijdpFz0OCT2YtZy5JeaERQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:01 -0400
Subject: [PATCH v3 26/31] media: synopsys: csi2: Add v150 lane stop state
 register bit define
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-26-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=3480;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ypyi9dWWD6DRA92i+iXhKzNLY/EfU98N3gcGWAudk/4=;
 b=b30j8PtvOU6R66ws6xR1hhypMFASxpYqbhPBKQ/2fHPkODrUUF07WBdeE3oaAd73MFNflAHJq
 z3IoSoIw0AABwVyCBvbT2wBEJ+69XRliQVS2xPIdZf76Vzsaer0f4aC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c560c7-b3a1-4853-630f-08dde0eff1e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZFlDTnNXMW91aFVmUjA1a29BWGdXOERZV2tYN1Z4TzBPbnNmQ28xazdtclBU?=
 =?utf-8?B?dDlzZXA3SWxuMGloTGdJQlZpa3p3MVI0eTVpR2hWNmxmOUZTTHdLTndJNC9p?=
 =?utf-8?B?MFJLTVZuL2xYa2tsTmxjSFlwZVZxOEM5bURmeDVoSFdTSlJreUxOa1EyaHQr?=
 =?utf-8?B?d2FGRjdNQ0NCRC9kZFVlbk51dEk2anF0SE12VmtqZktrSDRBaVBDOUpJSTBG?=
 =?utf-8?B?SFlFREwvR1pZbVl4REVYY09jVWZBVFdrVnQ3WEVlckl3RHBjUnB5Z1dmbGJT?=
 =?utf-8?B?VmRHNnJTSkhjSmtNenpVK3FKSVcrcGQwVGJjTTdyOVJ2WEY2WHhMdEFEWUVJ?=
 =?utf-8?B?cCtRb3J3dm1Ya0lCUGhuS0ZFU0UzQWZ2clAzdlprb0dLTXg5S3QyQ0Q2cXRR?=
 =?utf-8?B?WGQvb1pTN3NhNElPRnhvdXZ1ZlpjUktmMlg1SjJtMzBCdnFFVzdKM25oQjJG?=
 =?utf-8?B?UDlPcENHK0l0OTZXWnpZcjhMVE14eTBHV2Y5eUNOek02VEM1aTVKOWxEdzZG?=
 =?utf-8?B?bWhERENQU21DK0g4bTd2RXVVUnpBVURPRW5uRWJEcm5OMTR3d1hlWHRnWC8y?=
 =?utf-8?B?ejh1UURGS2xQaUZXTU9qektVTEplQjRoSjQvMmpqam5pTHZJcitabnNxZGJM?=
 =?utf-8?B?ajhFMFg3NXVHR3VmRlV4bGJZVE1td0YwajZuWWdLT256a2h5ZDlGY1UwdFVS?=
 =?utf-8?B?Y3JwMFEyeDNGdUZVR3MrMU55QjVlcHAzd2lVRkZ3aTBaUW9wZkw2dFptMU9C?=
 =?utf-8?B?aUJJOGRvZ081em9hYzZMZ1E0VURtY0NnTUl4akVWVVBhWGg2OGJHUkkyQ1Ri?=
 =?utf-8?B?MEZCZEdEb1VIc0JXNkJIcnl5bENMZVlkRW9Nd3NXV3hZck80RW56NmlUKzR2?=
 =?utf-8?B?enRWVTc1LzZ0MEdmUEk3dVFJc1haZDUwTm9NMVYwNHJ3aS9nVjQ0S2UxUkhF?=
 =?utf-8?B?a1VqOUZzZGc4SWZhYjBBRjJIcUJDUTdDbmd1ZGpyT0JGQ0NHZTBwN3RxSTRz?=
 =?utf-8?B?Q1BXYnNneUR1UEJ2VkdYZ1o1bm5pelpiK1hlZTA1VkphcHVEZVdSdmdjUFl3?=
 =?utf-8?B?OXhXd2NDR3RweVArUlZhd0NCY3JXdXE0dVd6RHVCWXNGeVA0TUxXVG1NaGs3?=
 =?utf-8?B?bS8wZC9Da2xzZjUvbU1sT1VZSk5BclppZ0RzcGxSb29kWXlZb25lckw4SSty?=
 =?utf-8?B?YytKS3pwOXgxcW4rYXVNaTZqbVNEL1VEVFhIVE5XV2JHZ1owVVcxWVVKUG5p?=
 =?utf-8?B?WTJtbFdzNHZqTHhPY3R3c01yZWYwK1VsRDQwVFJvUnE4RjU3eklvRnJWSzc2?=
 =?utf-8?B?KzE1eVVVSVBCZ1ovZFJvSUkra0RnTzA1cnAxdnJWT3M0bW1xNXNXWjF6VENr?=
 =?utf-8?B?d1M3M2d2eCtWU29kTS9mTktOdXhiV1ZuSXFnQmRhd2FKcktPbnNFcG45NndQ?=
 =?utf-8?B?WDFxaFEwUHhvS3Nudm9sWjNKRkNuN3FpMGxKdmlQWUFwUTZ2NXlUUXBWZkp0?=
 =?utf-8?B?OVNoMU01anBKazBVOFp2TURSZm54bjYwNjk2bHVjU1lZbUlZQ1k4OXpuUHV3?=
 =?utf-8?B?cW9jd1drL3FOZjkvemMvTURDSnlPcFlHVis5bEx4Z0dVV0dVVjFkK2Fxak1y?=
 =?utf-8?B?cEYwOUxlZnNmQmNqeE1PSURVcEgrOUZZRFduY1c3S1FYdlY1T0hSTVM4dFFT?=
 =?utf-8?B?WldENFE4NEpQWDNjYTZUVkdXS05qZWUwY1JldlI2dUJyZEdNTHN0ZHBHQm03?=
 =?utf-8?B?WElLUEMxcndtZEk5MmhWN0cydHg4emluV1hEM2RhMFliNjd4bVd5ak1VNDFU?=
 =?utf-8?B?OVlhRU84cEZqUlhQM0p6a1RKRUV5ZWpxcnVyV01Od09KZzllMmNXRU83QS9H?=
 =?utf-8?B?Z3NNYmozTWcwUTNjdE1wNXhIVmFGbFNrOXVsa0VkbHI2M0N3Unl3bDNpSDEw?=
 =?utf-8?B?QWs0Q3FVSDZ4WjI1eUNSMFRPUkxKQkhVN2lRZ3JQaE5SdnpSM1YwN2Myeits?=
 =?utf-8?Q?ZIbWaMpvHtUHq9/BXz9RtxnJJ3kLDs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NmJKWEJvN3k5NHRxUGE5dEZEdjUvWVVQMUFwWE84amhadCthV2NDR0FpcDFs?=
 =?utf-8?B?V05Oa1NUR1JmdW5aL2lDdmdGSGcyMUFqd3dlWUgzK2JBRnhTMGFrNFVFWERs?=
 =?utf-8?B?T3lrblhqdTc5TFhuT1lLdEN4VnNWWnpyUFpYMWxFTkdEb21hRTRkYVVXZFIz?=
 =?utf-8?B?enlOeUpoeUgvTHZXcWV1Z0FiN296aFdnMS9zV1dTOWFvK0lpYml0UWVYRXVh?=
 =?utf-8?B?c0laYkZqQkt0Qm9ZV21VKzlyL05IU201SWw2blFYM3ZhajRSVnBrYk5RRFRB?=
 =?utf-8?B?OW9XZmNNcFVTU0FOQzhzd2VFYlFReU1QanNBK3Z4RTdrZjJ5NUNJRUg4TmE4?=
 =?utf-8?B?bGs3aXRZWTY0b2FMOU1rdWo4MWwyWjg4bFV0bkJnUW5uYjNDUEthOFZYaGpt?=
 =?utf-8?B?RU1ScG9JbTViVGxqdGhXZ2ZRRE5Ha1J1WEgrM1JjY2J4emVVaUVZdW11Y1Nu?=
 =?utf-8?B?eEI4dGhRaEZQdUdHU3dnWVhNYmtQbDlmOHV4Ym9Kd2t3UG1aejc3Q2k1ZDhD?=
 =?utf-8?B?WHRrZWNtamhkN1BBMkN1QWVEYXAvMDZ3S1BSUW5RdjM0V2Nhbkc2b0tsSG4w?=
 =?utf-8?B?Mlo4RnFnSVJxLytlUEJtRDZOQm83dFVmSVN2ZjBKUGh4dWVFeEZEZkE5V0tk?=
 =?utf-8?B?dTBKTDlQOHU2cXlCOVFJSUNjYVEzcUlWc3R2TDAvc0s5cmUvK0dEMGx4T2JC?=
 =?utf-8?B?ME8zMEovcjgybHBrejRRV1hFMjV1T0ZiWlNOQVh2UEhnVmZKbU41MkpaYkRz?=
 =?utf-8?B?cVp2RE8zWFNaUkFiaDY2cGZSM2RwTGpZN0JVNGhXT3ZWclpBWXRvQ3dnU3Q5?=
 =?utf-8?B?a3dHeS8wd2lyV0tQUjIySTF2NFJQVXYwS0RSQzhuS0tmM3FiZldQY21nY0NF?=
 =?utf-8?B?S0tGY2ViKzBBWVhRNWd5NUlSRk5RUmg2MG5ZK0NvaDBvZFV0V2c2U0tHUlcz?=
 =?utf-8?B?T0JtclRJWEVQV3VDb21WQXkvS2hJcGZQK2pPekZaUGhnODZ1dk1PT2tsRXRk?=
 =?utf-8?B?Y1UycXFkcWJCQTk0UTA2TzE2L3hKRjFGOVN1RHdpZ1RsZHErZU03ajFxTTlJ?=
 =?utf-8?B?aE1MVEtIWS9nTThQbEgrSkc3QnoxanNJYzB6bXAza0pjUkdYaWhaTXhwRmx0?=
 =?utf-8?B?c3lIUUErWjV5NnpsN0F5d1plYmNHVTB5ZFUrN3NXcGU2UW42MlZwcEx0NGty?=
 =?utf-8?B?Qmg2VDd0Tktrc1RhVWxWNlJzZVc3NDJvSFlLWUtuWmM1VkFQUy8rbWg2bHVh?=
 =?utf-8?B?U2JTNlpWU05ZYjUvLzRpTEZlMXFPMEw2U296NE9CMFk2dTM2UkZDQWc4Y1I3?=
 =?utf-8?B?MUZJOVhZaVNGT2hMS2xCVWwybUxhVnZiN0s1cmJSdnBKckgrcTFvbkZWeXBV?=
 =?utf-8?B?SXpwcXFjR0MvS1lteXJKWVNGQk44S25HOFJKMXFQS1d2U3laaWhrc2U3VGNz?=
 =?utf-8?B?Z2VYTkdqZGR1RGpFcTltb3Q4UHBaTHhSdFdtTkR2ZG1Sb1hpRlczdzRDdzAw?=
 =?utf-8?B?TUErRXlxZnJoSnoxaTZWcEhuaER1QUJoeXNwWHNZR2NKdlozOFpHZUJQaWVO?=
 =?utf-8?B?SDE0Mm02YzR4dzFBYnBPaTBKdjNESk1aNzF4aVJrbzIvNGhDOTFtWFE3czdL?=
 =?utf-8?B?WUFKUS9KNWtiN2dNTEpodEZwU0xBNHJCYlZuQkZaT2NpVEZmcjhHKzNLMDRT?=
 =?utf-8?B?bVpQOHBQdnRIUHpEMFFaczFTUTc0clM5OVhNeTV0cE1KWjdLSk85ZC9VeWtI?=
 =?utf-8?B?SVRtaEZ5enZQL2h6OEpndjFhZjB0R2Z4aGhGa2QvQ1hrbDJvV3BIWGFQVHBt?=
 =?utf-8?B?dUNBUlRXUmJtU016cHlSQ3psanNGczYzcldOb3V2S2R4dlhYbnhVMUpaUDFJ?=
 =?utf-8?B?S0VSK3dQRWlGZys2bnVQM3lEdXJ3anBoUmxMdWNweTNuY2NFZ3Zacmdoeko4?=
 =?utf-8?B?bHpCSW1LVWozTUpZVktxYWpqWXA1VHo3eTV3TC9ZTThIUWQ5ZTh3UzlWZWh3?=
 =?utf-8?B?b0djQ1Q4MkQ2N000REVNWnA0cFN3Z3FYNC9QUS9mRWdVQ3krUnFZdEZiU0hK?=
 =?utf-8?B?bVo0ZHB0MitJS3NpVjNTUmxtLy9nU1dBdnhyUTVPTi9LbUNHcm5jNmFUT0c1?=
 =?utf-8?Q?lwhU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c560c7-b3a1-4853-630f-08dde0eff1e4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:51.7985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQAGvGfWDLXZnGSM4SPLJklHtZBKTauF02jan+vimQ8ymg1eRKnR4tPTZ4OJyRXyUBzr9KIx6IK1hTscglcjpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

v150 move lane stop state into new register phy_stopstate and field
position also changed.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 40 +++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 0b3bb099329017e81d2fb41387a3671e429dfe1c..7225285c772edf6ca3372408dd3cb0637b47e0c0 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -31,6 +31,7 @@ struct dw_csi2_regs {
 	u32	dphy_rstz;
 	u32	resetn;
 	u32	phy_state;
+	u32	phy_stopstate;
 	u32	data_ids_1;
 	u32	data_ids_2;
 	u32	err1;
@@ -86,6 +87,7 @@ static const struct dw_csi2_regs dw_csi2_v150 = {
 	.phy_shutdownz = DW_REG(0x40),
 	.dphy_rstz = DW_REG(0x44),
 	.phy_state = DW_REG(0x48),
+	.phy_stopstate = DW_REG(0x4c),
 	.phy_tst_ctrl0 = DW_REG(0x50),
 	.phy_tst_ctrl1 = DW_REG(0x54),
 	.int_st_dphy_fatal = DW_REG(0xe0),
@@ -147,10 +149,13 @@ readl((csi2)->base + ((csi2)->regs->__name & ~DW_REG_EXIST)) : \
 dw_csi2_reg_err(csi2, #__name))
 
 #define PHY_STATE_STOPSTATEDATA_BIT	4
+#define PHY_STATE_STOPSTATEDATA_BIT_V150	0
 #define PHY_STATE_STOPSTATEDATA(n)	BIT(PHY_STATE_STOPSTATEDATA_BIT + (n))
 #define PHY_STATE_RXCLKACTIVEHS	BIT(8)
+#define PHY_STATE_RXCLKACTIVEHS_V150	BIT(17)
 #define PHY_STATE_RXULPSCLKNOT	BIT(9)
 #define PHY_STATE_STOPSTATECLK	BIT(10)
+#define PHY_STATE_STOPSTATECLK_V150		BIT(16)
 
 #define DPHY_TEST_CTRL0_TEST_CLR		BIT(0)
 #define DPHY_TEST_CTRL0_TEST_CLKEN	BIT(1)
@@ -289,7 +294,8 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct dw_mipi_csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
+static void csi2_dphy_wait_stopstate_v0(struct dw_mipi_csi2_dev *csi2,
+					unsigned int lanes)
 {
 	u32 mask, reg;
 	int ret;
@@ -303,13 +309,43 @@ static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2, unsigned int
 	}
 }
 
+static void csi2_dphy_wait_stopstate_v150(struct dw_mipi_csi2_dev *csi2,
+					  unsigned int lanes)
+{
+	u32 mask, reg;
+	int ret;
+
+	mask = PHY_STATE_STOPSTATECLK_V150 | (((1 << lanes) - 1) <<
+	       PHY_STATE_STOPSTATEDATA_BIT_V150);
+
+	ret = read_poll_timeout(dw_readl, reg, (reg & mask) == mask, 0, 500000,
+				0, csi2, phy_stopstate);
+	if (ret) {
+		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
+		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
+	}
+}
+
+static void csi2_dphy_wait_stopstate(struct dw_mipi_csi2_dev *csi2,
+				     unsigned int lanes)
+{
+	if (csi2->regs == &dw_csi2_v0)
+		return csi2_dphy_wait_stopstate_v0(csi2, lanes);
+
+	csi2_dphy_wait_stopstate_v150(csi2, lanes);
+}
+
 /* Wait for active clock on the clock lane. */
 static int csi2_dphy_wait_clock_lane(struct dw_mipi_csi2_dev *csi2)
 {
+	u32 mask;
 	u32 reg;
 	int ret;
 
-	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_STATE_RXCLKACTIVEHS),
+	mask = csi2->regs == &dw_csi2_v0 ?  PHY_STATE_RXCLKACTIVEHS :
+					    PHY_STATE_RXCLKACTIVEHS_V150;
+
+	ret = read_poll_timeout(dw_readl, reg, (reg & mask),
 				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",

-- 
2.34.1


