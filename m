Return-Path: <linux-media+bounces-38636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21521B150E3
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 18:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44D34E6562
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 16:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3F8299924;
	Tue, 29 Jul 2025 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jKWDGdaL"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8F293C79;
	Tue, 29 Jul 2025 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805248; cv=fail; b=oIH3VWjiH+TcMsiW64neJNCK07NnfnJYkB3HF+JrOG39TkLCTnX9bk/VWdsS9hbcpYYj+bNflCU7kQVnLAcIJDiV8WvbOz4/fc4c7c0GBqRyi2LIPGLip7SCuLBUTkbeNyJeMG/0fi7ZcqeuLuOC2m4lxetQ2qUqqNz41xi/iOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805248; c=relaxed/simple;
	bh=BRDOycBqVuICskJy1RE0YM8e7O+IwDPiZexNHMs8lvg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=robCIHcpF0kbk/BcMizFUUTb6X73Wc+ZB2eX6LbU9cPG1THTwRKWqMHTXd7D1D6bkJ8YFa54lrIrMFTkGE5yU1zYgSiR3175u8ro6muYx3W2B0PFbFdGgGkGMox9Z/7DsJiHlveZyj5sj72+4KE+FSgHL3jgd8A+spGaTzLzJqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jKWDGdaL; arc=fail smtp.client-ip=52.101.70.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk9PVOm9k6AX0FHzeUP1/wB2JkrCsx+ihJcN4OQOfXqd2tSVFmNQjiryoq660o8DBIvOARCPjaZv7ZrMEZaF4szWvBvdfw1tBrfFnDznoedCJ71AAEIpGFMtv8OgGEy6kC3O0cXJmxk2ROWSsnhxyJcqHCaSTT4CBBlPjHYPjuMXC30WBKXaftYBhS66G6RdEgRCPhO4cAwLB4WbcwwwJQ6xH2T5DuUfDo2iZWCND2FHw34ApK6IdNT0MIhrF32SlXhmzjBV4IlwUHQz8YEMFtXtv04yM0x7MOaE2JEsU26moU/V+0zaf3KZx7j9UpZNHJk8kpXYrKh+K5Abq+KqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvvtgL39q3k9QFLS835psf1aCDytvQu6r3BE7sKJE4o=;
 b=sSMCgEKmfBHVqxDlDcvbON+YWeZLfeH6ojyKda5+lsBFJEE1t+D2PqUAB/VvxBmJaMvWlhYKT+R7OEKgqeOI1Zp0baMLQoAUrSarP2wHNx8p/t5bVidSou3OK5xHUqUIoIV+x2A9hZvdpByYSrRIi+HlDSqwsAjyIvIYOjDqR2uIDYm4iA2l8/AMdD/yAKQqBi909LXv3XGmqfQCBCqkRxHHD8lh2FAQD+YM70NOH1ew3ZPI/PnTGGyuH2mtsSk535TeUl2sKbk+yA0J0PG/UxK2/tfOyuzVc9VK+g7T2Y4X2LeP2IJdPRVplR3A2b7wVe7nbxTCzmwi+JdcQ5smBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvvtgL39q3k9QFLS835psf1aCDytvQu6r3BE7sKJE4o=;
 b=jKWDGdaLK9SmKAZJ2PBD1br7HHJRQ2hneGMHocAHYDcWXdKdVtLglQgy8Z173KaIcVJNA8fB2A/hAMTuh8oxJEZtUwP/Jj1cbz/QXIaaidPzDyo9pkD/VFS7hjLKEcmn+oRpTRB/vrMVj6+3rdPMjQxPWHCWq2c1lluEiQ/EOy7WnJY9VftD8fXtMTMpoaGZ0HHhaNQdl1FS5jKtIxQi66+DJCJEZGASCm4jcFyMDpF6V2aPnvGUaL/Hq+cVklJtu2HrYNzuXfMWagqGMX55NUBPdHs/RMywjAfvfoGwMh4BIHgAW+B4xHtIdPwNgmplYHbNakoqeBE6VZU32WJ1Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:07:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:07:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 29 Jul 2025 12:06:24 -0400
Subject: [PATCH v4 3/5] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-imx8qxp_pcam-v4-3-4dfca4ed2f87@nxp.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753805222; l=24973;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YB+UpO8c8EV7Dgibk5QPQ9269SHdKfM0FyTnTEzirhg=;
 b=3iePwGH5I9HG6kz/uRMeZh+bmFDIPFIzu9tz3MjbSALXLA0aupFTVPZiJSOzUPyBFJfp90QxM
 MYBiFhLKsUrBkCP8PFSO4tQebnzEuLg6QnQZQQVSKOX1CEjJToeJ6Sz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: a397bbe9-c44d-4970-ed88-08ddceba00f5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MWRYeEt2R1AramE5UGtjZ2N2M3FQUkQ3OGdlOG52cEhmNnp0M29FM2ZSSVds?=
 =?utf-8?B?T29RbDVDaHVkVGFTbUl0aHBqYzV1a0lIaWlwdFdqKzkrb1BMTkd6RHJCcGN5?=
 =?utf-8?B?Y2RoNndiSlpmVWJtQ1NtNGNYM1ZoN29ieklzbFBzcnlRWklNRG8vU0ZYRyti?=
 =?utf-8?B?a2hTcW5zRnVkTXBsbFBFSWpBK056VzlsK2grL1pMdkxJZU12eGlDTkRvTzV1?=
 =?utf-8?B?QXlkVGkxWmpUM1BkbzU3TWpMb1lvMjFsc3RmVFlxRVd1L3JlV2Q1aHgydUNr?=
 =?utf-8?B?TkVkdlNmN2J3SCtuS1E1THBHSHM0Q1VoRHcraEpRMDk3RUoxUVR3RFhCQjdR?=
 =?utf-8?B?ajZwOVgzenZjYWgyY0M0bEJScEduMnQwTStTZThGRkkyOXZmajRvMkFUODEw?=
 =?utf-8?B?ekZzK2JpSUl4S2VJNndXM2ZDd2QwakUrNlRIZlA5ZVFIY2QzN09WcEg2SnM5?=
 =?utf-8?B?dWVBNHZFY1lFYjYwRUNpTjN3SmprbkxWeEgzQW81ZWtyL1djNUU2a09HRTNZ?=
 =?utf-8?B?Y2QyUUFyMFVQcVRCVzRDZzRvbkRSam8yYUYvelJzVTRJK2JLRzhZTkVZVi9N?=
 =?utf-8?B?eUJSVXRxYkhaWDkvOUdDdGlFM1ZoM2Z4ZStpN0pMVW1PcDJLVzlsdEl6Qmph?=
 =?utf-8?B?ZGFSRS96V1NDR1ZlRy9MNUxMekhURS9XWFRyK0NJUmhJUmxmdk9HQkxtT0VG?=
 =?utf-8?B?RWYvY2l3elExWERaMkg0YVdtUUl4cXluSERSVkpkR1dzMTdSUTdjZWp0U09o?=
 =?utf-8?B?SG1adkpYWHBkMExXYnQ1Y2E1K2d0bHlUd3J6Q3E2VGZxRU5PaWpZSkJBQmdS?=
 =?utf-8?B?MmZENW9xb01YQU01b2dPQVZOanNDb0JXQk5SRWRGczBHRGZTYjljeFFxbTNm?=
 =?utf-8?B?bUh3VlovVmpkdUFZaHN6ejVVT1VvN2NSTkRxYWMvL050SnAwK0xBUVUwazVN?=
 =?utf-8?B?azdob0FHYklhOWpxdGdRUkZhdTJMMEJQNWNRdHRVdGVQNFcreENBQmc1cUZx?=
 =?utf-8?B?L0FMRmM3SCtKUlNGNWxKNGprZlhQR2VzNCtEZnZ6ajBwd0VqWUNtMWNWbUI1?=
 =?utf-8?B?NkRId1REMW1FSlk5ZjFSelUyYysxREE1aFcveE5CN1FGdGorTVU2K3BBeUtI?=
 =?utf-8?B?b09YTGhqOWx4UEl5eXFsbGpNNUV2UDFwYWNQSXAvMzFSUGdsTGEveFpsU3RV?=
 =?utf-8?B?WVJXemM5cFFQNHRRU2FKOCtkNWwvR1ptaFlnajluc2VVUjhBVXhUZm5aMFo3?=
 =?utf-8?B?TDhnWjM3Vm03bWhlWkw2VHp4UXJuWmhzUXJoYWNicU4ybzVIeGFYQnA1azIv?=
 =?utf-8?B?WGEzS1E2bXphZHk4eCt2cWdUdlBlb2paS0wzbmR0N2YrbTRyVXNzYzJZK3ps?=
 =?utf-8?B?OVRaYTZEYjVHb01HK3M5T3dlaUVDeW04K2t2YmEyZmc2TlZpS3ZWU2c4QVBI?=
 =?utf-8?B?OHJYbWtLeXN5NHlMNmliYjRmTHBLZDBnRGYzWjV6N2MzOWpNNUNlRFdGZWhT?=
 =?utf-8?B?S1d0bWhFNy9NdVk5dTk0ZndLczcrQXF4S3AwMzRVZWxqV09IUEt0dUlEQVFi?=
 =?utf-8?B?YnBUMlBxeFRYWmRCNEdaUFlxa3o5SC9mblRaRFVYUzhwc0RGQXlURnBVWlQ3?=
 =?utf-8?B?TDBTS25UWUxUY25sWFZvY2NQQlVkekxpTFpSdnE5aDhkVDdaZHlkeXFFd2E5?=
 =?utf-8?B?cnUvQ2phRElQaGI2dWlsRXdDRXZSNEdHWHpHeE9WeUR6K1Brc0F2NFk3VXpG?=
 =?utf-8?B?R1NnTU9sMVJ2ZUs1QTNxRnBmdzAweVRlL1NlUlBvRm9kVFZkN3A1REQ3Zlhy?=
 =?utf-8?B?MHZiL3l4MzJBNzJYbVo2UXVyTEZWOWgwbW1hOGhCbmM4STAyN2ZGRGtGdFFt?=
 =?utf-8?B?MlV0cGhZVS9GSlk3b2Y3SHBiTEMyY0ZVU0M5RGpTUFErMG1SUDNZc3R3THVK?=
 =?utf-8?B?bUg4MXl6eWZ5STlQWXAwREdHS294Z2EwdE4yVWhYZEF4WnRKRy9LdzZvM2Va?=
 =?utf-8?Q?eAdp3Y6ro7CBFEeU1dsKUJXTpcRlBY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UUpwZDRxNUMrSEJMbmo5L0x3OEpQQ3NGSXlhUnRuNW55ZjR1bWNDai9xcFNu?=
 =?utf-8?B?U0xiUWsrWDFYWDRUYmR1Ukt5U1NpN2hWZ2ZlUDFvNFNKUlNXQ2FrTGtTTllw?=
 =?utf-8?B?UFNwbE1henBkSWsvbkpOeW55YlplSXJqeUV6ZHNLaWtKOXB2azdqZ3h6QThR?=
 =?utf-8?B?QWpWZ3YwUkppcHRhaEo5QU85cDBHZHVsS3FpZjNNY3JRV3JUb2cwalp4MjZT?=
 =?utf-8?B?cGVXTUJndjRBNGJSKzhZQU1PbjdxdkEyU2hwSGhzdjJMNUl1bzVxVUdEV1dM?=
 =?utf-8?B?Z2hHWjZaQ0ZzdU5zOFpSV2VUNS8vUFpvd1oySTBpQjlkNHJ6aUpBa1NFVWtQ?=
 =?utf-8?B?KzNmYmpId3VyMmtmVHA5OXNYNWRrc1dOMFVqd3VSMEFuNEU0STBPcEx0MDlX?=
 =?utf-8?B?akZDZHh4a2FUZmExOUFxK0UyZzV5Nlh6bld1RjhJSTQ2Qzk1VnZrdkFVNU5R?=
 =?utf-8?B?dmE4TXhzLzFsWEIyeXVBZzhONXNvWnZxQzlSaWdMN0FjSW1sbG03eVNSS25s?=
 =?utf-8?B?emtsQTlINGx3MU4wOFEyeXlmbHhoN1JUdlZTQVZTeXVZUkU1aE9KaWtnbHRJ?=
 =?utf-8?B?Q0tiM0RpL0tRVG13d1ZnR01JOEZWTE8rZVBGakFvUTJ0Mi9zMUNXenZBZURm?=
 =?utf-8?B?T1J0ZEUxZkR6Qm5SQUtFV3J4SFdzSmJPTGFGOWM3UENJcklxbGdjWnFzU05G?=
 =?utf-8?B?bVV0Ny81N0dnSTJqSmp3WnVaQS9lL2wyZzNLOU1CMHZKVkN4VGNqd0pwQTht?=
 =?utf-8?B?SUxFV0pzYW9nbExPRW9tK2Npb1hVaDdGVnVRK2QzaS9CcUNLVXRVMFVpYzU2?=
 =?utf-8?B?V0xkdW0xVTNVSUI2b2I5SFFOcGJVNEJWZTFWUDgxdXUzdWRMTmVybkJOZTRJ?=
 =?utf-8?B?R3RsNlJMbjI3SlFXS0NLMWtJNHdkTXR6YmMwVGpFRkpMaFFmREpQZ3FCYzgy?=
 =?utf-8?B?VGNiWlFaM1FhbExmaGRIUTZYMDdGQ01wMVZrbGVvZUgyWGdkUkY1cVFZQlAr?=
 =?utf-8?B?c1pmRWdHZzZ4bEkvdWtTMTVVOGlZenBPbE9reVZXUEJyVXBvM1pURzl6RjNo?=
 =?utf-8?B?THBRR2V0OW1CZk9qYmE4UTRyOVZlbGxCbFNEUnJxbDA5a21jYUs3ZUFGZ0hD?=
 =?utf-8?B?SzZRZmVHeWFiVkh3YWEzZktkUkVIWitIbVBqNXNYbCtqK0dENU1LUFdTRllD?=
 =?utf-8?B?QXhrYUxoMTlpK05xcjFxSmM5eU0xd2hNZTA0bi9IRkg5a0ZaMXZWVy9WZjFD?=
 =?utf-8?B?ZHVzcllpMHVmeEJUY2lIdTd5eG9xbmtNa3NZdU54Mld3LzZVUU1nT1FETjcr?=
 =?utf-8?B?WDVWdG4wdlp3cy9tU2lKS09oelFJU2NxNEJveEhYS3NGVU9sR1hIRG5VaWI3?=
 =?utf-8?B?dUdTSmFmaFNrbnZIa3BtNmFaYmtZK1Z6L3lvUmtKVnRsT0d3VUZmcjNMYmlv?=
 =?utf-8?B?dEpaOStJeHBPQUdJbkYxdktjaSt0LzZxYW9zR2U0L3E5WVJkUHdGWVM3aVZh?=
 =?utf-8?B?M212V1hnRVBZSzZ3WXFBbFBkeGdVZ1pUblh2M1hCbkVWaVVEeDNIVnlwNFVK?=
 =?utf-8?B?MjZhTG1DL1Q5N20xZ3JoSnp0OE1VRFJJWWVmelYySnczblpCSmNOUTZuVWx3?=
 =?utf-8?B?NUREbS9lM3llNlQyRDgvNGdFSytmMU1UVEpwR2x2Q1BMRnVjSWhZNFNQOEhk?=
 =?utf-8?B?TU90ckpzb1Z5OFkrVXpxK2tsaWlvUHVQM3JKR0phNWNacSt4SnRSUlBmeWp3?=
 =?utf-8?B?NzBXRXUvcnBLblpqUWRrR2RSSFhTY2hpMmRkZFVPbzZFcjBiTWFlcVdYbnFj?=
 =?utf-8?B?UjllTUpxUVY4d2pQVHgwS0xuYXAzQ0dkVEN4UTNEQkltN1IzTE9vZzVNNG9B?=
 =?utf-8?B?dktTaDBuRHJ0S2E2WHZ3Y2FrRmF2SmJLcGZUSko5MXk1SjhBYTBzaTFSWGpr?=
 =?utf-8?B?TUVjNTV1SEF6YldJd2ZQS0lWanhtOWJqSEdydU9ESGRvV3dNTG9SWUExQ2ZZ?=
 =?utf-8?B?MmpBOThqUnVUOFNYLzljVm1zVmVzd0dOd1Zya3d0R1M5bTBGbS9sSDRKSHhz?=
 =?utf-8?B?eE1vVkJvMVVma0c1bUF4YUZPZlQzY1VKMzZjSHZXTlZPSTlPZzFQWEJ2bjgv?=
 =?utf-8?Q?TL2twLYOryEeOBcr1LyQzlL0N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a397bbe9-c44d-4970-ed88-08ddceba00f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 16:07:23.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UM2Cp22iBCKllZfm4MNEbff9mtaMbJH2vcLnroiRX7Ll+eo7AOyNwhGgAerwO5YZbTnXZ69y3miu3DG7kjhKLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551

From: Alice Yuan <alice.yuan@nxp.com>

Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
and enables image data capture through a parallel interface.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
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
 drivers/media/platform/nxp/Kconfig            |  11 +
 drivers/media/platform/nxp/Makefile           |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c | 728 ++++++++++++++++++++++++++
 4 files changed, 741 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4eb0d0de16299a3bcd5c2f6f6445e416c8fa0a48..5fa349a2942ca05313b1dd6d754be039b565f12e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15240,6 +15240,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
+F:	drivers/media/platform/nxp/imx-parallel-cpi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c
 F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
 
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e213fdc5da70821dc0b420e1821f4f..99d5ee4208cce7361827d27ed432abf71d0f627c 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -39,6 +39,17 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
+config VIDEO_IMX_PARALLEL_CPI
+	tristate "NXP i.MX8/i.MX9 Parallel CPI Driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
+	  on some iMX8 and iMX9 SoCs.
+
 source "drivers/media/platform/nxp/imx8-isi/Kconfig"
 
 # mem2mem drivers
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..5346919d2f1083b51ec99b66981c5d38b3df960c 100644
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
index 0000000000000000000000000000000000000000..57d7c116d9f5b1cbc41e4a6f138828697601dcdc
--- /dev/null
+++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
@@ -0,0 +1,728 @@
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
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#define IMX_CPI_PAD_SINK			0
+#define IMX_CPI_PAD_SOURCE			1
+#define IMX_CPI_PADS_NUM			2
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
+	PI_V2,
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
+	struct v4l2_subdev sd;
+	struct media_pad pads[IMX_CPI_PADS_NUM];
+	struct v4l2_async_notifier notifier;
+
+	const struct imx_cpi_plat_data *pdata;
+	struct v4l2_fwnode_endpoint vep;
+
+	struct {
+		struct v4l2_subdev *sd;
+		const struct media_pad *pad;
+	} source;
+
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
+	usleep_range(500, 1000);
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CPI_CTRL_REG_SOFTRST;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_hw_config(struct imx_cpi_device *pcpidev,
+			      const struct imx_cpi_pix_format *pcpidev_fmt)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 flags = pcpidev->vep.bus.parallel.flags;
+	bool hsync_pol = !!(flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH);
+	bool vsync_pol = !!(flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH);
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
+	case PI_V2:
+		val = CPI_CTRL_V2_REG1_PIXEL_WIDTH(pixel_width) |
+		      CPI_CTRL_V2_REG1_VSYNC_PULSE(vsync_pulse);
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
+static void imx_cpi_start_stream(struct imx_cpi_device *pcpidev,
+				 const struct v4l2_mbus_framefmt *format,
+				 const struct imx_cpi_pix_format *pcpidev_fmt)
+{
+	imx_cpi_hw_config(pcpidev, pcpidev_fmt);
+	imx_cpi_config_ctrl_reg1(pcpidev, format);
+	imx_cpi_enable(pcpidev);
+}
+
+static void imx_cpi_stop_stream(struct imx_cpi_device *pcpidev)
+{
+	imx_cpi_disable(pcpidev);
+}
+
+/* -----------------------------------------------------------------------------
+ * Async subdev notifier
+ */
+
+static struct imx_cpi_device *
+notifier_to_imx_cpi_device(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct imx_cpi_device, notifier);
+}
+
+static struct imx_cpi_device *
+sd_to_imx_cpi_device(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct imx_cpi_device, sd);
+}
+
+static int imx_cpi_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *sd,
+				struct v4l2_async_connection *asd)
+{
+	struct imx_cpi_device *pcpidev = notifier_to_imx_cpi_device(notifier);
+	struct media_pad *sink = &pcpidev->sd.entity.pads[IMX_CPI_PAD_SINK];
+	int idx = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+					      MEDIA_PAD_FL_SOURCE);
+	if (idx < 0) {
+		dev_err(sd->dev, "no source pad found\n");
+		return idx;
+	}
+
+	pcpidev->source.sd = sd;
+	pcpidev->source.pad = &sd->entity.pads[idx];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink,
+			 MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static const struct v4l2_async_notifier_operations imx_cpi_notify_ops = {
+	.bound = imx_cpi_notify_bound,
+};
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
+	unsigned int align;
+
+	/*
+	 * The Parallel cpi can't transcode in any way, the source format
+	 * can't be modified.
+	 */
+	if (sdformat->pad == IMX_CPI_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	pcpidev_fmt = find_imx_cpi_format(sdformat->format.code);
+	if (!pcpidev_fmt)
+		pcpidev_fmt = &imx_cpi_formats[0];
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 16 (2 ^ 4).
+	 * We thus need to align the width for formats that are not multiples of
+	 * 16 bits.
+	 */
+	align = v4l_get_required_align_by_bpp(pcpidev_fmt->width, 4);
+
+	v4l_bound_align_image(&sdformat->format.width, 1,
+			      U16_MAX, align,
+			      &sdformat->format.height, 1,
+			      U16_MAX, 0, 0);
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
+	fmt = v4l2_subdev_state_get_format(sd_state, IMX_CPI_PAD_SOURCE);
+	*fmt = sdformat->format;
+
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = pcpidev_fmt->output;
+
+	return 0;
+}
+
+static int imx_cpi_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(sd_state, 0);
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
+	return 0;
+}
+
+static int imx_cpi_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+
+	v4l2_subdev_disable_streams(pcpidev->source.sd,
+				    pcpidev->source.pad->index, BIT(0));
+
+	imx_cpi_stop_stream(pcpidev);
+
+	pm_runtime_put_autosuspend(pcpidev->dev);
+
+	return 0;
+}
+
+static int imx_cpi_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+	const struct v4l2_mbus_framefmt *format;
+	const struct imx_cpi_pix_format *pcpidev_fmt;
+	int ret;
+
+	format = v4l2_subdev_state_get_format(state, IMX_CPI_PAD_SINK);
+	pcpidev_fmt = find_imx_cpi_format(format->code);
+
+	ret = pm_runtime_resume_and_get(pcpidev->dev);
+	if (ret < 0)
+		return ret;
+
+	imx_cpi_start_stream(pcpidev, format, pcpidev_fmt);
+
+	ret = v4l2_subdev_enable_streams(pcpidev->source.sd,
+					 pcpidev->source.pad->index, BIT(0));
+	if (ret < 0)
+		goto err_stop;
+
+	return 0;
+
+err_stop:
+	imx_cpi_stop_stream(pcpidev);
+	pm_runtime_put_autosuspend(pcpidev->dev);
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
+	if (code->pad == IMX_CPI_PAD_SOURCE) {
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
+	if (code->pad != IMX_CPI_PAD_SINK)
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
+static int imx_cpi_get_frame_desc(struct v4l2_subdev *sd,
+				  unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != IMX_CPI_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, IMX_CPI_PAD_SOURCE);
+	v4l2_subdev_unlock_state(state);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = fmt->code;
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
+	.get_frame_desc = imx_cpi_get_frame_desc,
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
+static int imx_cpi_subdev_init(struct imx_cpi_device *pcpidev)
+{
+	struct v4l2_subdev *sd = &pcpidev->sd;
+	int ret;
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
+
+	pcpidev->pads[IMX_CPI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+						MEDIA_PAD_FL_MUST_CONNECT;
+	pcpidev->pads[IMX_CPI_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+						  MEDIA_PAD_FL_MUST_CONNECT;
+
+	ret = media_entity_pads_init(&sd->entity, IMX_CPI_PADS_NUM,
+				     pcpidev->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static void imx_cpi_remove(struct platform_device *pdev)
+{
+	struct imx_cpi_device *pcpidev = platform_get_drvdata(pdev);
+
+	media_entity_cleanup(&pcpidev->sd.entity);
+	v4l2_subdev_cleanup(&pcpidev->sd);
+	v4l2_async_nf_unregister(&pcpidev->notifier);
+	v4l2_async_nf_cleanup(&pcpidev->notifier);
+	v4l2_async_unregister_subdev(&pcpidev->sd);
+}
+
+static int imx_cpi_probe(struct platform_device *pdev)
+{
+	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
+	struct v4l2_async_connection *asd;
+	struct imx_cpi_device *pcpidev;
+	struct device *dev = &pdev->dev;
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
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(pcpidev->dev), 0, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	pcpidev->vep.bus_type = V4L2_MBUS_PARALLEL;
+	ret = v4l2_fwnode_endpoint_parse(ep, &pcpidev->vep);
+	if (ret)
+		return ret;
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
+	ret = imx_cpi_subdev_init(pcpidev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_async_subdev_nf_init(&pcpidev->notifier, &pcpidev->sd);
+	pcpidev->notifier.ops = &imx_cpi_notify_ops;
+
+	asd = v4l2_async_nf_add_fwnode_remote(&pcpidev->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd))
+		goto err_nf_add;
+
+	ret = v4l2_async_nf_register(&pcpidev->notifier);
+	if (ret)
+		goto err_nf_register;
+
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev(&pcpidev->sd);
+	if (ret)
+		goto err_register;
+
+	return 0;
+
+err_register:
+	v4l2_async_nf_unregister(&pcpidev->notifier);
+	v4l2_async_nf_cleanup(&pcpidev->notifier);
+err_nf_register:
+err_nf_add:
+	media_entity_cleanup(&pcpidev->sd.entity);
+	v4l2_subdev_cleanup(&pcpidev->sd);
+
+	return ret;
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
2.34.1


