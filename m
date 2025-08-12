Return-Path: <linux-media+bounces-39552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4299B2227E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C1111886D39
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B2629A30D;
	Tue, 12 Aug 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xPb06NpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0F2E7BDA;
	Tue, 12 Aug 2025 09:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989782; cv=fail; b=EyfNA+cJpQw6/VMb1zqntWqNZWyDXpIwySHSzZDejYRTd3RQdA6yJvkSfrU52nHNAvnLFlqNvJkVkoHYyvcrY3gwnnGpEddgT1PtnPbvdhMA0wQQ15KJh85CVf/7tEJV5UAv/So6pBq6y4SMHmC1P4Y+5s3KsideEayMs0k7zTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989782; c=relaxed/simple;
	bh=kTAVMcRTZmmz5ImXsMRqiAf4R675sdhXfc8xwokvDUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qsvXpYyEr0n09xP2VCbz03OW/tNWsaVbd0sTix76QmSsF49N1j9Y13prgnlcHY8sofI34Q0WtQ7jX7QLRczNFNM1LGYqOkCPXr7Zplm12hovyO0fXvAt6kbk9htH/38xOOhwkpfjcE74dk2CzeZ9v5aQrP7BQAf6PAcLqzdoPaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xPb06NpQ; arc=fail smtp.client-ip=52.101.70.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZlo1ueY0EjZcq/yepz2x6P8ULM2YdIpDTCvYRkGo5Qy2+W1V+2XpXSpt0po0jq06120IPGfSuZ+dINXjbKM0LihzcBNbLQSISSwfWoHCNxvaEF2Yrouqt6FpUs5I4cajVxGZVjkJDYN3OHG6y7oO0wIDzqVwV61kfM1QgyewAdVSYVhGPbvO7/4sLCD6UM7gE0GURw6xsOF836XznlIHZp3hqgUMYwz2RzD/v12An5Rw/X34l1TGKmkYFMaoyQ2LSVHOwLV+AZKH0jXcm6g+YE9ZxZA+z9Lb09+HnoN8NFV5C2p9gw1WGNfqYLNSwtpdsyGHL3CQcP2FPW/fztgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMVi+ion8H8A7RFNOWM2d7Ln7dp8q4Xb/gTIR2rQc9U=;
 b=Wkoj/3NLj4MYtPyOvamWMQTCHusJJWxP6d3WKqOVvnUGV2lQD/uN+Z/ajWJc2vpoRHbUFKrYFKQX1//NnA6Huey2HTjQQjXr8ZA+uJ0sP0fVZ7BDkbbdfQRp/dN+KfmHGzljsDA1KRynsbsmnUJDb641RogJA6A6kxx9lHj9u6FsEGBxGXjbAvX2U8Ehx0dj2zQOu0Mt6TmX4V6bHxvxORA8oItXWlpq85Z1KChQb450G3HWVuOmpQlMDVC4jyZue8BWs60q+dPMY+H9nQCA/PvVSYopIk4ELHvsyIXldFsYXyq84IhVwwqTWGLoqCWHRLb3U7Oz/sVpIG1R2Zh15Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMVi+ion8H8A7RFNOWM2d7Ln7dp8q4Xb/gTIR2rQc9U=;
 b=xPb06NpQhf57OZz82NtEWtNKSHd50QCMrz20H0xMFwxORoqRVnWXptetY8t/SgMeLjTa3tFp0QDHNOwKiLXFslxTU/DxFe/8iCgKs9vb78pljwt/XSMPe2IUJgoUEITGYFY36rtexikij+LRT6Bqwy0IA9jDtf1tY1FtRtmx1QN6wVuZvfjB7Hu5g9xE9DaXh58lbjjd7b2+o5kqX41TRebb/tGfGI9Jh/rcPhk1L+HyFOJ85I7OcZCzyYA2+WFlVve5z8ZIVepINZZ35daHpRxIb5gZ5nFbtblUQ1gnvcJbNPRLpZiNDKKnaFxef3LDlJNr+3k17OI6y+0radZMHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 09:09:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:09:36 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v2 1/3] media: imx8mq-mipi-csi2: Add data type field in pixel format
Date: Tue, 12 Aug 2025 17:08:42 +0800
Message-Id: <20250812090843.1035800-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
References: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: a82f66c8-cfd7-4141-1e5f-08ddd97ff5df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a3E1TU9kOFhrOW1GVUZ5dVo4WGMxcnBRZ0J4R2pFNzFsU1E0UFJLQmYzTFhM?=
 =?utf-8?B?a0sycG93R2RZeFZTK3NZMlgxY3UrbVRSZzNQT1pUdnNYWTd2SjVLUFZ2TXNt?=
 =?utf-8?B?UXhhWDlmeHNQeENuRldWMjMyQzhUZm9FZ3p4VFVMalNXcitwODhXV3NuT0sx?=
 =?utf-8?B?U2xkc2QvMTJ5MERkZ0ZrNVFMSUwrUGVTWUp1MnR3NFdRMUtBUmtYc3Y3eUc3?=
 =?utf-8?B?b2VEekR3SGVuek8wUGhHODF4Z3dSd1RBd2x4UGNaa1hqU2JrV0djaFFXdHUr?=
 =?utf-8?B?QzArYlB4ZkpWMC90MEFEN2Q1ZWJPWDc0dW52dnNmWjNRbWdWYzRGNGpyWGhj?=
 =?utf-8?B?SkVydkpUeWw0R0tZTDh0YksraVVkL09XaXRQN0FIOGJQZk1TdXRONWtReCs0?=
 =?utf-8?B?MnQzMDhBOFpjcXNsdUhkN3NXQkIycWFZV3J3SUY0d2FGTWxqdkZkRDJmNFc0?=
 =?utf-8?B?TGw4VnpCbTVYVmNTZFluWS82bGxIalNXOTB0MmpKUUViSjNXRzFtK3BjSGM1?=
 =?utf-8?B?bTBKMlZzUS9VYWVOc3NxMjlBaWpvbFBzZFY4MEt1ckd5TktpVEJVQjc3RkxX?=
 =?utf-8?B?K0tLRmV5NFptencrdGI2R2kvZnVxVXljWm1ySFNWZWc3bzFjc1FTaGszRE9I?=
 =?utf-8?B?WGtvNXoxelVUSmg0WWIzdEhPenpDM1lMMDlPbHlhRTYwQjNRRHF5WlFsNGFN?=
 =?utf-8?B?VVB6SWY1VnJEaXByWTZuZ25UTEpSN3BFVmZLWjlyMElJY1luL2hjeVU4RVhS?=
 =?utf-8?B?ZUo4aW96d3g0TEsrL2hQdWR3VnJmc01iSGV3Z3hCWk1DMmJRWTFJZkx5c3Jz?=
 =?utf-8?B?azdWdTUvcjFZa1o5c3pSUUd6Z2R4SzBuVDhxeEY5ai9tR0VDaytiRFBrYUcx?=
 =?utf-8?B?WHJRUkFuYUdiWUFMYU5mZWE5UkZ0WFIzUlozcStHQzkyZ3JWMzA2TmhudE5p?=
 =?utf-8?B?MjhlbUlsQnA3c3cvUHBzamtQdTAyaVQ4NDZwSnR2WURDOEpIbk9NeHZCeENx?=
 =?utf-8?B?aENvSVZ2em5rUEp0UlZqaENtV08vcG1uZ0pnZ2JXNUNGVk9XdGFiYkpKU2l5?=
 =?utf-8?B?YXNQK2xJdFJVRzRjalBXQWdUdElObTVQWlBoaEdjOEt5K3R4aElYclBoU2FQ?=
 =?utf-8?B?d21VV2cxckJQemFmTUtQSVZOK1dpejRnMFJHQnZYY2pDMmFOOG92a0lXQy8y?=
 =?utf-8?B?TjU2SXg5d29TbWpIV2tXaXN2TlZhZFZyS09kUTczY1BjRUlDbStDMVpOMHJ1?=
 =?utf-8?B?UXhHQXZKM1hoU0xGNDFyYjZXZ29veHBkY2YwZ0pEVDFNVTJ5VWtReUdxTnJI?=
 =?utf-8?B?Nlh3aGhVbTdDSVhSRDFPMTVRTGF5L1d1MWNjZlFWUGxhbEdvenZTYWd3U3Jl?=
 =?utf-8?B?M2lYbWhEVHFIb0g5SzBDK3hJTGpCaXMyMGZ6SWhicUY2U2RlMkRpL0UyYzJo?=
 =?utf-8?B?WnR4dS9RRDNKOHF4UWdISE9jOTcrRkVxOHdMZVRxbHJUanU5RVVqbkJJeEVB?=
 =?utf-8?B?RmR6TzNoUTVYL2ZHQnYyaFk4bERuYWNublpkcERpZUhvMzhLbFB6WHVQZVBv?=
 =?utf-8?B?dTFGa3V6ZStGVzErNlVyQVByQ3VIQ2krRjhOUHpwOGZDdzAzbmYwZnNyVWpB?=
 =?utf-8?B?VC9HdEVadkpQbTJBdU4xYXE1YmMrOVREclRYaDhpZG1nZnkyY1ZIejdrMVhh?=
 =?utf-8?B?M1NRNkMyNlV1Y3k2aDJ4Y0ZQTVpQcUtwVmtxbjkxWW92UktEaXdWaGVIRVUx?=
 =?utf-8?B?R2RoMHdsa0JEdEh2TFJmVlVEL2x3QWdlNmhDamdJeDJxTUhGa0lIMEVWWTBh?=
 =?utf-8?B?TzlIbkRpcUMyT21zSVBwRm4rZUhOOWhhZWtBbTBoRlJMeE9YVWljclcrT245?=
 =?utf-8?B?M3FWVXFNZVpxYTZQZzZiKy9IUVFUMVdPc1hEemladnpQcmd3TVhPenhyczVJ?=
 =?utf-8?B?K0crM1hhZElhK1JnbHVJKzNtakJpQkgzZUtzVmZ0NVVWOG5XYWp5bzJJeGYr?=
 =?utf-8?B?Ymt6QVNCTC9nPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a2lOTkpCRzllYVFXMEx5cXhiU2hwb0l0bWc1R2hZT1dBejJaekFOZzdFNkl0?=
 =?utf-8?B?aCtDbUtyMFdIOExrMlllZDBJSDcvYkl3OFMxUjk2SVBqT0NFbVVBZVRadm9C?=
 =?utf-8?B?OHBOb2xFMWczWUlxdkxRS3o0UDBnNk5HSXkvbnZsbzc1bSsrYnRWSHNWYnlN?=
 =?utf-8?B?ckx0VU5VQkVFbXUrTGM5SUtKVitrOVc0cmE3RDhjd053UDJwcWp1dXNiVHNM?=
 =?utf-8?B?RzdEKzFBTjV0UU5BeWVRM1hIei9qelovc05zT3QvZmt1NWpiNnJFdEk2Vlpm?=
 =?utf-8?B?a3h2bllLUFV3L214cll0SmZIMzkrNVgxVGNMc1lGeXNnTmFDLytMampkNmk0?=
 =?utf-8?B?Y3lTN2VWYTRYc0RpRlZsc3FCbzI5d1kwQzZMNldQR3dsa3NmZUlxSFBjYlJy?=
 =?utf-8?B?czBZNjRnZ3l5ZHM0V2txLzU5MHhDYUxpand1TjdOWlNyV2NndjFOYS9XTkNU?=
 =?utf-8?B?MEdTc1puWWtWaWZvUWhsdEkzSmlnR0NucGtBclRtMXJQaTBwYW5MMDNwUjhK?=
 =?utf-8?B?UktNOXVpcGpZUmJtL2pwaEJUWXVCNTduWmRUWTJiK3NLaGNZdjVMS0F1MGtO?=
 =?utf-8?B?dXYwYmlYK0cxTE1oc2x4d3pNZ08xWUdITnphSFY3a0NLRzY0a21kQzhlOU52?=
 =?utf-8?B?Ty9QdldZL0thSE5uTUU4MVYwOHgxOUQ1SHlrUGFFa29yZ3Y2eSt4Y2hBZGtJ?=
 =?utf-8?B?eDcyRFd2bVBYaDdRS2NqMlNGb29scW9ITHpGYkNFRUIwelhhakYzb0pnOGJh?=
 =?utf-8?B?Tk1yRC8vblVtcE12SzhzbHkwZDdYMGkxKzVGeXFhcytvd0t0SmhzK2pBWjBm?=
 =?utf-8?B?dGdJekdDT3IvcUdnUGFZNEwrSDRuZCtvUy9oMFowck5JV3VDUTBoMlhtbGtD?=
 =?utf-8?B?dWZsVnNaNnpRWkVUMGJnQnJoK1VOS2Q4OE5SQzBxTGxCbVV4dUYvUkxDNjEz?=
 =?utf-8?B?YTZWOVhRMkgyVVJvaUY1cktueU5QWmVsbG5qOGl1RUNZZWVxQ1JXcGRzVXNi?=
 =?utf-8?B?TFlJYXh0VkhUTitndEhGTGxVMXlmNTRpNUlweVZBdnVReUdlMjFFNUV4WTBp?=
 =?utf-8?B?NldQa2I4NEJod1Buc0diRmo0ZGdtMEpiZENUTHhiZWUxZy9ZMkYvZjVHVGJH?=
 =?utf-8?B?NEUxK3RHTGlVTFZieXp5Y2s2cjZ3RElqajFnTXJrN3pQa3pRQzlBVlRqWHV1?=
 =?utf-8?B?OEdJeW9xRGt4RjhGa3JJSWF3SUNCdzhSYzRHdjVlaGFmUjk5MzY4Y29Pc1F5?=
 =?utf-8?B?NXBvb1dMSm8rd0tPRWE4UXpTRUgwTGJFMWh2Y1licmR4WXQ3dTlKWVpXUkRQ?=
 =?utf-8?B?N0RCYkpSSFF5VElxNWtnTUYyeE41azExNFZxbVBNVlZzZTN4ZEtYWG1ucHIw?=
 =?utf-8?B?YkdTbmN0bFFxc094VmN1d29MclhFZVFpMnM2U0RwY0NLbytWUWpoOG1vMGpD?=
 =?utf-8?B?ZmJRLzFGay9YekxYRldOZjZydStNYzRmaDdSdG5LRVZ6QXRGRzRzQ3RvRi9F?=
 =?utf-8?B?eE13VndNQzdyNDVNUFVUS0MzWkpDeGMwVWZ0Tm44YXg3UU9uQzkwQytkdStz?=
 =?utf-8?B?MXgrcFpJTnVwRzg5M2xGb1p0U2lzYS9lS3VEQXM0STRlSE9CNjdDSElvb29x?=
 =?utf-8?B?NzNUUlQ2U0lvV2ZmalFHa29JYXFEcU1JQ1RIQ2NSd3pNTlorcFRZY2k4amxz?=
 =?utf-8?B?OHlvVTIxRU1RNmg2VGxXTzRyNFdhcG93dVExREovdUkxZTR1aFZIeUswL2Va?=
 =?utf-8?B?U3dqWC9sd29jdmJ2QnJ2TnJuWmUyQ3lHV256dWhndEhBWVFzdmdhODhGcG0z?=
 =?utf-8?B?amErb1lWcXQ2cHB2WmYySTh5WVlZQlY5VkpJNWttN2xjZFRtM0JZR3NIY3Q2?=
 =?utf-8?B?VngvZHlsS3NYbHZYbTZLNjgzVlRsVUY3Z2c3L1ZlbmFNejFuY1lIQnQvVW03?=
 =?utf-8?B?bDRiMGNNeDJRekw5Y29VTjFZL0p2TjBDZVFEbWpKdlFUb3hKa3JHcVJMSUtW?=
 =?utf-8?B?UXY0UmtoWEZMa0RXNndjQTR2TVMrMXI1OVVwbUhsYU8rUnVQQWtFZFMyaE5z?=
 =?utf-8?B?Vkt1L2hSTlB5bG9qazlGeXd6L1JPVCtyUGs2R1h5dnlpYXpCdlMwUXo3d0FX?=
 =?utf-8?Q?Bk/y1d7Ds/hxAt88Q3nLgtfoG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82f66c8-cfd7-4141-1e5f-08ddd97ff5df
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:09:36.9005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TDgxHBMkjKJO87iiPNyoCxf2Vp3MRIi9mLx/G4T4MtgrSNqGE9UwqmDDUhQ8xKrv1Szzb+JJANelEtyC+pX9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add data type field in CSI pixel format info since the downstream
subdev in the pipeline need to know.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44..7495400adc22 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -25,6 +25,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -138,6 +139,7 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
+	u32 data_type;
 	u8 width;
 };
 
@@ -262,68 +264,89 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	},
 	/* YUV formats */
 	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	}
 };
-- 
2.34.1


