Return-Path: <linux-media+bounces-60885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH2fFnlS/WmKagAAu9opvQ
	(envelope-from <linux-media+bounces-60885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 05:03:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AA4F0F84
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 05:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5734930166C3
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 03:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7363A2C11FE;
	Fri,  8 May 2026 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H+MeXB/F"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF53248896;
	Fri,  8 May 2026 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778209397; cv=fail; b=A7a27X6kJlLvYm3krqXOXIaWrqBNchQI3pPqMUl7Pn0fnjOpL83e3Ruqa4YxchdXwsVJ4DsNCtetMyW6uzh1Od98GBNqt+AivKL+T0MExOmqI3a4/4ZZLWBCV1AufmvlowRzC1rmp2zzfOQma/KDvSrYHpi0KTB8MBH6LuEyn1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778209397; c=relaxed/simple;
	bh=YOTDio0Kknms79aIuGxjnSEKO62Y63EeVptQII60ASg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=iOH8CcxQWdFyg3nibQKgjlrHHRjzS/AxV9UWUsi/zMv9WqK06sOkNfN8RGHU+PVEhACuwPt4QvwrfdfjLaxqp98xhrVFKbMwxyMYEB15Iqm6bg2n2u/Z3oZB6jtCe1CZW6q78Ynqu3xhKrGfdqH2fXo3AoUxZBAaKGxOg4OaenM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H+MeXB/F; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQZJFjQSCb4OJFC5GiC3GcId6fwl7ueaYb9Bo/zFUQAFb53QOXUnOGdh1RdzYPVNZ4nodbU0aCEX+d1TWdmc3EHfiGr/atdFtmHWBBI0edDAgZimvO+16bJ8XuRpMT3iRWL69KL/9hw2Nwdw0lU/btmFKG0OHITOb1LU+GrQX5OKeKaHvuWmBo0wLZNd/VRkdBjZJ5Ne+A/Bm3kzexnn81U5GetanMwUmsz17pviq9BIg8W/nt0y3ntZ9CkZwrKxQKnvcgIGNbRmssfiRFxqutZHGYr4+ZqrbQMQTqilRATYQ8KFBDtgSCyaU1/uuXvQJRSqdCZ6x6dcYgRQlkEXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t2G01UxdXAvRPENh9S86/Jfg6Czfjig9CvnH+UFl3o=;
 b=yVzYEMGz/vIEAKCRfee98YTaSuu4xz2pL8VrYq84B4P96Jqu170AU8c/0e/yLEajMc87kEXbAmYbsPTzjx1M/EUzVuYEHZh4fvFxjTKv9RhLe/h0OTU5KaF4hb1aznJyZMzgySBoVYVTprUyfPt+eyKQu+/n12Hpe2I0vD69wzvcPVDGLTk6SCUhGvhuQ/Wijb8G3gULYFi0RTMVsyxjv2lPeSM3XR+GM2O/a5Ix7w7dJu8bBTNpStVCUCKEmAGmqmSlfFCnUlOAxO1amyxp89zDAy41ALm3Vo2U0ngZgbZrurWLidsuZGBm/mPKo5nhRdJRdZoTjXSMI0iP9F6YJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t2G01UxdXAvRPENh9S86/Jfg6Czfjig9CvnH+UFl3o=;
 b=H+MeXB/FFd/gxWy0rpkPI4uuFxeC5X9451ookqjNDUBdG6EKa2+hCfFEO60ByJYl6YokZ8F2FmODteyrhKsmjsetfNmZddCAovyKYs3TunsDn3o25/k205QrjtTxwJXr4838+fp0iimtH7gplHbTOqMkw1DOZpRhQeGQJWceGDQFv2Ed8BTgDkmDsrs1WJ5VFmwQfaOOLpg4hpXSjl6tjKstdf54fNh0VdzK8Z634RIwwYk5zV0B+FvqFY4m1VlLIxqj7eYr+/NTd5WJyh9izRLUwN+iwLt3Vayy9oqf9gfxlvxYAjA1qtkMqL22Tys9O6MPJMI4xFd33c566ZWvxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8006.eurprd04.prod.outlook.com (2603:10a6:20b:288::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 03:03:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 03:03:12 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v4 0/2] media: nxp: imx8-isi: Add virtual channel and frame
 descriptor support
Date: Fri, 08 May 2026 11:05:39 +0800
Message-Id: <20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAANT/WkC/12P0W7DIAxFfyXieVS2gYT0qf8xTVMAs/LQpIMs6
 lTl38dSKer2eK17ju27KJwTF3Fs7iLzkkqaxhr0SyP8eRg/WKZQsyCgFhT0sjbeFy/JmhgsGtT
 AopavmWO6baLXt0fO/PlV2/NjKNxQWPrpcknzsSFvI2NETRpCZyIBEGPryLW9N54CdRw0evHrO
 qcyT/l7u3HBTfb/nAUlyhjAWVAmoA+n8XY91G2bYKEnCGGHqEKDd7HrgrPcxr+QeoLI7pCSIAd
 Qrh/a+gJ2p6mUww6u6/oD7KaCWlQBAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778209560; l=2686;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=YOTDio0Kknms79aIuGxjnSEKO62Y63EeVptQII60ASg=;
 b=37V7BIQ/9PL42pwwmb6T+YR4uNO07m+XZTc0MdbDrzqsKbWN0YX2MMYNILAJfT4Vp+zmtxbvl
 3vbdb1NQiRqAgt0G3JR8She/uuUCFy5Xwvj5zSGMWRbPz87ffytnqqh
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To DU2PR04MB9081.eurprd04.prod.outlook.com
 (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: eed1cb8f-7180-49d9-6d17-08deacae573b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
 p8R3t9X3ktEm3gMMsSiidBeAx7ku5B88mLoVJi0QWcaa7xDSyaaIDTOz1KY86BrcYqsDpduuzaKs/jOcijv7aVVuNLWhnDh8h4wpwKWhBXM+1pp4jPknFV8rpoM0KxOPTWCbk++/D7hiz159C9fxG+h35eh5o5bN4e8hChVeJjtsxvvGy6E8wK4iGICyqZYyPh81X5VjsvkulKnK9GvwGWEM2tZG4m8Qld8HZzAfbul5+kWKpQR56hoy+MN0myRTfsluz8nCM+60lzjtx/J7wQeQi71BSTTRCIaUDDcptOKxvUqMz20xe1NrCcOgRhTtoieuwIFfCg9FzgJP9S7F3iJPSKYgRAu1pJpHSnONlLojp/qixjzabOUewIy/EgjzwRyDb40MZ/aIzVRobyZo4wpxVenqb+0o87UUXhZSwmoZgXHcrtPs4PMQQrag3YayP3R6ITxiXOeC+WrzwBNLYPDtFuFYX/TP9YFKJwTubSS+uC8LokLX8lQHWuAuhIHVICNtwbDEMnSyPx9DjjW6mj8qPtnw95ktGt5gr9zxlwuW1uVyBbCGQXWDRfNswcs+cLWvVNjKRV72HlLUreg1pqUQ7xpqiUsn8p50HAP1zrP4WwL/KfWv0so4p+zkGcbfLKJSMUnS6iCQNVpICvCo11Kbe6h9unzBpMkeu8fXvSWZSWmaBp899WQhRG1Dgs0YsJtoF9QqhHNYnhiZSrEEYY1d7+uXfszXWBOpyGWkKP0T/B65aZjzVdhQDmRrcpXq
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cEMwZytUOXk1Z3dOYlJCV3pJQlNGaUdPVDdrNDlVZFhMK01lcFJ4bzJmNFJG?=
 =?utf-8?B?YTdjKzBlNGljdThuYzgyMjd6czgvV2dOYzVnRi9QdVIxaUZocXYvSVlnT1hS?=
 =?utf-8?B?NGF3UnMyeU9vV2FGeEUzWGVyVVdIcEU0VVZtYmkxOUpwdnNlV2JUYkFjeU9X?=
 =?utf-8?B?U3RyY2QvY09CY0lvckx0TkYwNmNZRERaWWJJTU5JYkJVK3JQT3JLNjdwTm1v?=
 =?utf-8?B?WE0xclUzZEVPQXpLT24rendHbGd3a0tZVHlvVG9oWGJSclhyZGNTTWEyb09F?=
 =?utf-8?B?WDFRVnpCd1dRd08vYXhlRWpONUl1WkJmakFyeks0QUttcVlPZ1ZweVRXYzBX?=
 =?utf-8?B?MmFHd3lGWlJQZXd6cTRVbndIcjdRTURIVEdGYWdkNlAxbUhrSzZKUVpEK3M5?=
 =?utf-8?B?U2I5RGJwOGtFYUVpUDdIMHRYZmRzV3BXR0Y5ckk2NnVDY3ovZmI5MTJMbUYy?=
 =?utf-8?B?d2MyZ1N1VEkyYjR0eklOZE9lU1dHUEFhWkdiYTlKWUNpc254Y1p1NGNFMzZE?=
 =?utf-8?B?amo2UTRCUnRpYm9LK01WMUs1eWFjYkpORXprL3RlV1VQWjROS1pkQUY4Skow?=
 =?utf-8?B?M3lNclJ3QVNMNHU5YkVldWw4Qm1lcUJxeWh2QmlqTXBZL2Vsai9OZkhvWXZW?=
 =?utf-8?B?T2cwRTFNU2cvUlNmb2gyb1k4RnZRQWhkT0RXUTl4K0piWE5kTnpqT3RseVBW?=
 =?utf-8?B?YzVxWlhycStZZVVvcWZQYWVMcjArVHJ1Y0ZaZG42d1FLT3ZEZ25jbnhiaTdP?=
 =?utf-8?B?U2xEUXJrY1Q4bkY3S2lpa3dONVBid05OV2FCWm1udTI4L1EwNnV0bFBOV2xD?=
 =?utf-8?B?dStnVTVEQktWaVNTV1MxM3A0MUxrbk9WMjljMUg3WHJFRm1pM0pLd2RDclNX?=
 =?utf-8?B?UFlUZHBMMmtTSkJpN0ZZLzNscFp4VjRYeXh3V2ZVYkFvYmloV2UxZjZuYkNa?=
 =?utf-8?B?OXllK3c0MFVXOXgyenRWa1kzc2gyQkhDRzlYVVladjFOc2t6RzdUcG1GU1VX?=
 =?utf-8?B?OG50azk4eFZLd0FQSHYyUG1NcU5LYjRtRW50Q0Zqd29pSDR4YkpBcG8vcy9l?=
 =?utf-8?B?ZW5DeGVDbGVUTmlVYmJuUXdUMktnVW1weEsydFBZNDNjWmZIYk9BVHhsSEFR?=
 =?utf-8?B?cWFQN3FLeEZ0TE50M1ZpaFlMdjFRRzBHdnpqQ2IzM0p3ZVBpSU5ZNERPZnBw?=
 =?utf-8?B?L01BQ1Vaa2NXVDltS1JiRUtwTVBQY05rNm4ycUFzb0IxQTZaVmFGdEYweFpO?=
 =?utf-8?B?OTNTK0Y4b0pJUUlpYVFFamZ0TVhXOFZ3TFlIUHAwUldEU1g0NlNtRDYyMmtP?=
 =?utf-8?B?WGFvdEJzYTBnSTc5L1Z2cXBDVGVtNWd1T1ZrMnBNT0lCbVF1ZjM1Vk01ZUJq?=
 =?utf-8?B?ZkpsQWd6LzFwSDlEelJ2REdGbXJ3VDArWkxjMDFmajkwekpkbk5nZzA5UDlx?=
 =?utf-8?B?SUlYZkh1TWQ4emNRQmp6eXMvUFJDcWlhcGlicGZ3QU92bW13MEJJaHZZVkRs?=
 =?utf-8?B?M0ViZGpvckRYQkppY1BTMTZTLzl2NHdOOXc3SHIvbEZQdks0QURYZlcwRTl3?=
 =?utf-8?B?d204QmUwZnhNemd5NHJ5MkxYbDZrVUZaYS9BOE9rZ0pIT2JhMy90TW83WEJo?=
 =?utf-8?B?WmEvSVBKQUtOY3lRNVo1ckVacUpxSEN1NXpTTzJKeGlkUXpiamVWOUZDZktR?=
 =?utf-8?B?cHpYSWZBYmN4ZFB4bnpPSnBLSUFJdDZwbWE4WTE4WU9zOWk0cVBFU2Y2TGdj?=
 =?utf-8?B?QXBFRkw0RUpHd01QMi92RW5OL1BqY2dIQStXbDd1b05xS3lMSm91Zzkxazk1?=
 =?utf-8?B?T3R4K3lMMU9CWGZtZjUrOENuQUF4RVRwTnNFcW8rV29XNDE0ZEtLa1hDUml6?=
 =?utf-8?B?Y0FEQVJ4dVc2M3VZQzl5K053Y0E3eGNjaUdhbUtCQ3VwVDM0ckRKZnVNbllY?=
 =?utf-8?B?N3MwR0dtRmozRVZsUXV4aE1FZW1RZlZUN3JLUVNxTnhMdkZPbmVVTCsrMW9v?=
 =?utf-8?B?ell4MDE0L0s5bjFDdS9RU09wQWM1NWM2c2YyVG5RWkppaEhXQVRrTEVCY1hi?=
 =?utf-8?B?cE1LRnVrZXVjMmhEM3dIRTBZYU4yU29ab1hySUN0Q1pMRDJDVVVVSlBTbDdN?=
 =?utf-8?B?UG5GdGNveU45QkdkeTJLZlRXTzhzVjk3RDFvVTZIZksvNGIvT1F6Nk96aW1Y?=
 =?utf-8?B?UVRzcGcyeDlLTnJZcVYwRVRhdWRva2tNRHl4aVFFYXRLMFJ5aWhmTUtKMWcy?=
 =?utf-8?B?WkpDd2ZhNjl5aHkvS0FqTTRIa2xxaVJzLzJNMk5LTCtNSDZwUmh1STlpYWY1?=
 =?utf-8?B?aUorREFYdEtJQUx1WUpuTU13NFhUQzVJVE8rSHZQZ0d2d1lwTlNXUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed1cb8f-7180-49d9-6d17-08deacae573b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 03:03:12.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvSOcJ35MDHNQ8GZeraVBo+Hs5acp2tF0JdyKmZQm5djFr0AXnW1rf3XH31dHna0jEn/NIuxAz2JqZgTDrEkYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8006
X-Rspamd-Queue-Id: BA7AA4F0F84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60885-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

This patch series enhances the i.MX ISI driver's with virtual channel
support and adds frame descriptor capabilities to the crossbar subdevice.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Rebase to latest media/next(previous dependency now in mainline)
- Fix VC boundary check: use num_vc (virtual channels count) instead of
  num_channels (ISI pipelines count)
- Set VC to 0 when frame descriptor has no entries
- Move platform-specific comments to block style to fix line length warnings
- Use %d instead of %u for ret variable in error messages
- Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue
- See each patch's changelog for details
- Link to v3: https://lore.kernel.org/r/20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com

Changes in v3:
- Rebased on latest media/next
- Add num_vc field to platform data to indicate VC support
- Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
- Set VC_ID_1 only on platforms with num_vc > 4
- Improve mxc_isi_get_vc() error handling
- Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
- Add xbar get_frame_desc() implementation (feedback from Laurent Pinchart)
- Link to v2: https://lore.kernel.org/r/20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com

Changes in v2:
- Add Rb tag from Frank Li
- Fix typo in comment(s/support/supports/)
- Update commit log to include more details about ISI virtual channel support
  on different platform
- Include bitfield.h file to fix following build error
  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h:23:65: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
- Link to v1: https://lore.kernel.org/r/20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com

Changes in v1:
- Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/

---
Guoniu Zhou (1):
      media: nxp: imx8-isi: Add virtual channel support

Guoniu.zhou (1):
      media: nxp: imx8-isi: Implement get_frame_desc for crossbar subdev

 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  4 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 98 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 14 +++-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 59 +++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 ++-
 6 files changed, 186 insertions(+), 4 deletions(-)
---
base-commit: 2c8fe1f14240d75f2002e16b2b69c5c2d27ed41c
change-id: 20260309-isi_vc-285fd815140e

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


