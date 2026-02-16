Return-Path: <linux-media+bounces-52926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM/rNwluk2kd4gEAu9opvQ
	(envelope-from <linux-media+bounces-52926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:20:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A514743D
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC8BF3030B38
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 19:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B66C2F8BD3;
	Mon, 16 Feb 2026 19:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nQQ/Axhs"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650821B185;
	Mon, 16 Feb 2026 19:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771269548; cv=fail; b=LQJpS3WWA6KXMKteYoR8c/mTKa5iJs0Q5sib3bWRn6Uhdzf2PmPP/4h9/eVxan1ekiF61Z0iJbIiGYfLI2vQ9fJjHpDOqUSO56Z9LH/4IN3SzE1jcyzBfmRCmMghYk9SraY0eItInWU1WWELt3ISa7JTmKXmqKtPAZCvxZgrwZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771269548; c=relaxed/simple;
	bh=Cjezjar3shdw6ttu3IcHGeGSH6aMDH8ac/oQSUwXflk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dj8Xodjf2k80KxbBY+pCCKl6VIsrQMpMeL/SVF3KHS4Spf3iRPjYU2P+eTX4hfF7fuz1JwC+grhyCgwWqhD5r8yFbDz3rpDRsdmA1h6mcKq9nvLSlV/IiEdL2Fc9rvdyVkk/ZQmFFTX3MVWZV8PFnWx/mKBim9iaZE3MRzwEX6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nQQ/Axhs; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly3EvUKKZDVJX1YGRDYGJ6tCLB1phUbdcF/XW87MNX/NGhz25++8OxwYVIED3Hz0Bclhh5f+920wx0u8pIDMIbx6k0hhPw6WzPneshka78Bgqcg8KNr40MLZ5IdZ18+ziZWPINAvC01VUZ21u0hGKxVQnVhUhYb8nV4xTPQ6dKuH/mhycGqCpR1Hs3R9geL04KiLf3P5yOkIyHUpfZ23MWfiVtYw1I7mbD9fVeYlWAW38L9xnk/S5GwkYk36lDkHeiA6U+b1u6mb281OTSIl9qbk/5cnxTSvhVTMDgXbj2C0Tk8TInhOHdbbGVfrGG8CVi3SCHdc72JetyaQ5OIexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiNFKP8xpynxYTnk06N33jrgAYkbD9gL2+WTEV1bVRw=;
 b=nRGSIBxjr3ClZWpvQRNROuvaxkXU5rPDyRn/JJjER8I+YYNGCMJwm2wyDLz+54M+05ZLEdNrIRhkslyLVzcu875oDWMt/D8IF/T8AcH4E6vRYoKCMAwAYBoggFiRiZg/DABesngggd5LoOcqvTtSOfbc2kQODVcLfgQjhgOa+bRLxVpKjj2UFV2bi2jCqpRsdUM6adqZP9RgFv9VAPenv3nftKtP7+adVmQwIZ28qMTQIx9oe1qBnnCJia7DN+6CJzfwqUGiZTxul0ZMpvR/RYG3wvHKy/9zIx5poDJRCyxOBZjEvTz81ec6BfgE1Hop//AZ3y5HmdBf8aOXMMe0dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiNFKP8xpynxYTnk06N33jrgAYkbD9gL2+WTEV1bVRw=;
 b=nQQ/AxhsAfH4EVyCV8yYdXzkFluPPhajk6dIoV2hDQJlFnHWiHPbbS0kEFtj0/2RW6lLKy/gVY8PD4O18Zbt97HUylpjCa9+trToZ3fVYaYWmMeSiMlYS4sZQlmWOlZRuPTkT4YLextG39ZrjxGVYnvgTQF9qX/faA6d+xutw2Qk2AFG1axJFNtLnk17SwpWRfcbwPIur/S5/4kFcjOkRQRC+L2ILFGQPikrzHjAox9q9D42EI4xZHEqZ3rMbu2SFflPnZU2dLvtdERHKsBiuzL1xwki23pXQz294gSDkl3w6gMUoB/DHhDIGKaz9RC7e+4vxD/qkLdKeeJpz7HHsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7599.eurprd04.prod.outlook.com (2603:10a6:102:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 19:19:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:19:02 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 16 Feb 2026 14:18:41 -0500
Subject: [PATCH v3 3/6] media: synopsys: csi2rx: implement
 .get_frame_desc() callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771269529; l=1830;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Cjezjar3shdw6ttu3IcHGeGSH6aMDH8ac/oQSUwXflk=;
 b=gbfbnaGjgdphPyD8It+jAYnlMOhUflHKPg8U1s1LUXI9pGjjoG8Lib8vW42TJmEx+G0ry+5lG
 TpRyWdZNGm9CbNwjOUfVuRRgD3rPTHQ21FXd90aoecwnxoH4WFSrCtO
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: a7dbb6fa-c8d9-4209-c675-08de6d903e91
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Ykxad2RiVE9DWkdGaTlsdTBmNldqV0psMWxIMTZiZk1YaFM2R1BvTnFQTHRQ?=
 =?utf-8?B?aFRyaXJFbzBpSFVYMUtSY0YxN0tHR044aFpEaFVpQWY1cURIaE93STRoWnht?=
 =?utf-8?B?YitFRUIzcFREM1Y5cFloRHVXTG5Ha3kvaTZyVkV0bVlDSHcyblo0YzVhZTJU?=
 =?utf-8?B?MldEZ2IvTk9WeUJBaVZjQXNmenByMlN2WW44UEs4Wmo0UFQ0a2RFeTdLcnA1?=
 =?utf-8?B?ZWlVb0h4TGpOMXpZbWhXOS8rMUc1N1paSVhnUDFEdmV2RlBzK2diVXVUNTJw?=
 =?utf-8?B?MkE3WU1oUktzejhuL0ROQkRQRjBHNDk4QkczdVUwY1VTQzc3c3VTL1NWVEV0?=
 =?utf-8?B?NHlzUkhxUDllanNLZEMzUmYxcmJjekxWVnZoUGEwc2ZOWFFmOUZUY1YyNFp4?=
 =?utf-8?B?dmk2ZGJSM2xudkJrbktZajlpdTZWWVZZaTQyNU1YV3pQdzRTQnY3cXJMZG8x?=
 =?utf-8?B?bnNNb0toK3JOSDJibUdmVVpFUG42NGtQbWdTUEY1R2E2K1VrSGt1anJTVWtY?=
 =?utf-8?B?d1ZRK1F4bHhEUzJiZTRRSUV5M3BRWnpzc2Q1NlMrL1pWQUxtYm5pRUkvYUhv?=
 =?utf-8?B?M0FvZm42bmxWQjlJU2ZCc25oRm45NXkra29FWHlSaFVyMkpLVHFwckxlWE9U?=
 =?utf-8?B?MlVLV3I3WTJBSUpkbU5pV1A0WWlkWm5zT2NITFhxNVhRMmVRYlExN2VMbis3?=
 =?utf-8?B?bUVIQnJHOXoxWHR5NnBoOW12YVo4N2tNVFU3MUw5U3Vaa2FPcFJGK3FHeFlx?=
 =?utf-8?B?b2lvYncvaFNPci9QUFAwWWFRZGlsdUg5dkhEalAweXQwalM3OHZLbFBWTnBT?=
 =?utf-8?B?NTZsRG5YSHVQSHF3VHN3am1QQXJoYnQ1UGI5RFJVVERyUkhvYi9aRlNaanZC?=
 =?utf-8?B?U2huZFNVT0VGdUhqVmt5YnNPcGtRSDFqakREV3h2U2VSbGNUb2FPeGE4NVJ6?=
 =?utf-8?B?NjVkM1hVNU9HdWRjdFhQMGdhSWV4emFTMGxXYTBnS040VHRzREgxajJzKzBK?=
 =?utf-8?B?dzAvVlcwS1pTY1lQNTV2bTNLNTZrWDdLb2pHRUd6NGdoTGYwWXpmU0N4OURl?=
 =?utf-8?B?UGNPd09nZTBpT2F0MVBBSnUyRmdpQXZHYi8rdjV6dytKMGJHUSsrVWl6Y3ph?=
 =?utf-8?B?RXN0QkhxRHhNVHUrWUxtL1dDZGxDQUh2ZWxCMGw3SmZDSHJZbWlCRWpzd21D?=
 =?utf-8?B?WURIVmpUQ1lNK2pnUlNZY1l1ZEpCYXFpb1Fac2tpeCtRNjU1emNkempWWjQ3?=
 =?utf-8?B?bEwvMWg2SDhYczNxdnAwZDROT0czY05tc25wUEJ2OGk1cnU3SFRwL292dnJD?=
 =?utf-8?B?aVZ2ZmhYcjJiRGJzMW82ejJIZHd5d1orUDY3WC9NOXkrSCtac2N0VWorekVk?=
 =?utf-8?B?azErVVY4ZHhDcXovZnJxZmhhZUVIOU4wSnVwOGliSGVJWDFRY2xzZzdTbHBk?=
 =?utf-8?B?M3RucDlVSFZWWlpPUnJMT3IyQXp4bEMwRVBiVUhtcFJRaEZENVB4QUxaMVpS?=
 =?utf-8?B?Z2VFNFp3WmNCRXUvM2hUYlpXUVNSOXR6V01xNUpPRUwxU1laNzZORllFQXVQ?=
 =?utf-8?B?RlhSdEtmOUxNMFk3bU1yL1FWakFJbUtab3RMakdGQWlBUlNsRFJXZmxGUUUw?=
 =?utf-8?B?d2ZQZFNsNlBDZk94NTZBV2pNMGYyQ0lvMFRXV0tKOVIvdXlhcW9DQWhUR0NF?=
 =?utf-8?B?TVdXdjJZcjNsdC9ZdWgrK3doNmRmMlc4T3RYRndndm9tWlI3WkUwZVdZQWYw?=
 =?utf-8?B?UWMyM1VWY2h2Sms4Y2dsYUtzcWx2RGtMU0p1dy9qZ0YwRnpUYTk0WE5xWjJq?=
 =?utf-8?B?RzIwYzc3Qk4zUjM0ak5SbGlkcExlSHZKd2FoUit1QkUvUnI3Wmg0QnNPcnpF?=
 =?utf-8?B?Qk9GVTVzeHkzUWdka3lQeXArbTd1QVQzcXIvMVpLNS9MaEtxOGVDSzlGQlJU?=
 =?utf-8?B?bDUxbkNyZnJRRGloYjExa21hZE5sQ1BHQWdUYStxM1JobnBLeExsUmwrQ2dm?=
 =?utf-8?B?NHJKMTJGOWd0MktqenI5Y3pPRGVrZStvWldZRTFPM2s2TTRnRWxmM0pUNmFF?=
 =?utf-8?B?N2F1NFVUTFk1dzlSQk0wcEF2RU1vWTdGcEF2OHM0NjVRWmw0L05lbFIvTkp1?=
 =?utf-8?B?TDg5dm1JOVpObkptci9HSTJzYndJc2pTZmxHMFNiK0RxY3Q4NjVTMnJEVUVZ?=
 =?utf-8?Q?JqPvKVUhXomp+mWlpM3MVn8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bHdPUUNuWXpjTzNldzRFbDFrRXlWemNORGt4UGFYazlzQVg3a2pQcWh6UGMz?=
 =?utf-8?B?aFN2eFlYc2JCaUx5WUNwMTVCYzRzdjFHOUlNRHE3VTFiL2tvd0ZEQytIaUpr?=
 =?utf-8?B?V0hFVDA3WVVxYkUzbnhKLzdFbXFnUWIzZE93WFc3SUxxWjFxdW9ZdFdaaFdC?=
 =?utf-8?B?MkdWNUFRZm1ycTdLSnBSTkp6OC9QeDlkTEJYNTlwd1ZJQ2c0RE14MGRVZ05k?=
 =?utf-8?B?Sm9Xd0I5clZzdHlBbXBaZkVzempnUENzU29EcENXSzRQNTA1N0tSekY5UU9O?=
 =?utf-8?B?ZnF3dXlTcXMrYldkYzJHRllBenVnR2E4bk9oLzRaOW9TeXlGUmxITzNKc08y?=
 =?utf-8?B?LzhSVGJNME4wK1ljM0lEUTZ0NnFZRDRaczY0RWJQTENGQkVpa3YzdjVDL0JQ?=
 =?utf-8?B?d2RyT0cxZVVZSjM3UzlsZWd6MmM3eXhKdlN0K1A2ZkRZc3FSb1htdHA4aDg2?=
 =?utf-8?B?SW9HaVA5UjR1RkxEN1p0aHV6SEVtQ1o1dFRBd3k1NTVQdWhrbm9uUk1MM3hT?=
 =?utf-8?B?SWpKTVpIRnJKelVwRTJ5Y2Zlb1NQK2VXbmw5OHpCTXJCL2l6TjJvTCt2UU1j?=
 =?utf-8?B?RmRya29KOTBXaXpJVDg2ZVQxc3A4WEp4djVRQ3dhcDRCaXFSYURYQnJ6Z3Bp?=
 =?utf-8?B?U0sxcEdOU295Vy9JZmFOeEw1bnlIZkc1dlNML3pudnlYRjBjMEZqZlJCK09L?=
 =?utf-8?B?akgwMFliY0N1dzN1MGdBVktNUE9YN0txUGdpbHVYZ0k3eHVITTRBY3NhQ3cw?=
 =?utf-8?B?QmF2cDRTZEtYaTk1T2JFOU5hZktvTkhMdmZXaXVha2d1UkZTaGhhdUduMVdJ?=
 =?utf-8?B?RjFIdTZ5cmVaRmc4OEJ0OXJweXlra3h2eEhGdW1icGFURk02L0d1L2p2T3hs?=
 =?utf-8?B?bFNSRkxHdENITzZhbDVLc1NhTDZsWGhQRXdlY3FpL3R3bWwyVTQrVkRZMjNl?=
 =?utf-8?B?V1BLQUt0cUVvcjA0a21qeUJNYkFuOFEwVjR4ZVlvN0owM24vSVIzNFAzYllR?=
 =?utf-8?B?KzVPaWVSWXBheGZKWmVrd1Z0ekpJZWpUSDYxckpJcHhFWUZ6YSsxOVlUUXJw?=
 =?utf-8?B?WmtQZFpWU1VoU2hoV3BtZ3ZtWnFrbk45ZnJWendTV2VJQ1h5c1FBblhQbTY4?=
 =?utf-8?B?ZGlSTDZkVXdjVHpjRmo3WXc0VHFvYzYwUVJnZU9ZeUFzTmY4L1RiT2czVTk5?=
 =?utf-8?B?RUVZNGxMeGpuUkN0M2g0WnNyYURmeXgrTHpjaktMclczUTYxeDEzTTI5R0JZ?=
 =?utf-8?B?d3Jtd1hVVzlaWm96M0tIL3FDUmFyV3JIaDRuN2RFVjlaUE5ZSUF4Y2ROd21u?=
 =?utf-8?B?N0JxcElCRy9CblVBYlZVTEVKTDhTd2E4dHFGWXU3VzdQSlAvdEZoZ294cXA2?=
 =?utf-8?B?R0Z1L25KcXEwRjNtalZhT0F1MWFWRnBvRVNlMFlyYzVlbVRPeEhvY1RGSXoz?=
 =?utf-8?B?RGlPdGkvOEVMTG9Ua2xmalRmSE5IT254dlpvTlBuVk94ZUZRNjlLY0llaElq?=
 =?utf-8?B?RHcyYW44TFZtRE9aKzhEUm5OdEg1OTFaZ3hwVHdXb0dIeFB2ZDJJdHNXUyto?=
 =?utf-8?B?bTh3VFRBVVdqU2ljMXE5Q2hWNXdsTGRpRi82NjE5ZGpaTnNybWQ1MDFjVk9M?=
 =?utf-8?B?VGZKV0FwYXJaajhvckRIYWhwRXF1MktFNnh1Qk5paCtkMDAxbGNqOVF1VXJl?=
 =?utf-8?B?dmhha2Vka1MvOUI1T1BMTmdyR1g0dFlmU0UrWVNjY2Fhc2cwZzBkQllvbk1V?=
 =?utf-8?B?WGNvRjIrbXI0MVVEQ3lEMU9WemUrVFZnVDJ1SDJDdHhGSzVkc3ZIMzBMRTBQ?=
 =?utf-8?B?eWFlRmUzS3J6UXByZFExQjlTRDNWUEJHMmk5K0VaMVpUNlpaK3lRNWJyTENS?=
 =?utf-8?B?Snp4VGw2NEJjRFR0SytVdTA2R1J3dzMxcmt0YlBYd1BEc1hDOUpKUGIvZVFi?=
 =?utf-8?B?OGlqWXZyLzZvQkhYemtqM1puZnYrN2NON2tiU3pSTG45NE5oZFN1bXNWeXcr?=
 =?utf-8?B?SmdORDk3MXNLOUdvWFgxeTRWc0prcko1NGpYcnNUSHBFTGdxckovZEhHMkNS?=
 =?utf-8?B?TnNyK1JkRnV2cHVFTVBLcWQ3VDUwUTVRUmtaV1kyOVkzU00wWk05MDdlNVE0?=
 =?utf-8?B?WWhuVDNqdDVGUmhuUTY1Yi9aZmROOXB3MWZWVVpnb1UrUFVZYjJ2a0FUd2kv?=
 =?utf-8?B?SlFxOXdUSnV3U3kyREJZZUkxL0FGSW1kUm5SZG1NUStVUDNXSmI0eXFjL1Yy?=
 =?utf-8?B?cmlVdHh4ejZHODJIdmtyTjB0ZDdQbzFHNnpWdEx2R1NkbEtvL3YzaGdqTEJI?=
 =?utf-8?Q?Ls5KdclCyOik2y7xOa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dbb6fa-c8d9-4209-c675-08de6d903e91
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:19:02.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TDCLJwKOaYh8owG+7RFI5Zb8azwZGrnTNHxn1jJSJVrr5K1G9xiHFORPIshFEvZfCTwPylr+/nCrbaIfjt3dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52926-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 4A0A514743D
X-Rspamd-Action: no action

Implement the .get_frame_desc() callback to fetch information from the
remote endpoint.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- use media_entity_to_v4l2_subdev()

change in v2
- add csi2rx in subject
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f03fe01280013bf9a832433c6b06dab691bf8f4c..bcbf109a0bfd040c568c0652e28752c94a1bc30d 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -429,10 +429,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int
+dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			      struct v4l2_mbus_frame_desc *fd)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+
+	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+	if (IS_ERR(remote_pad)) {
+		dev_err(csi2->dev, "can't get remote source pad\n");
+		return PTR_ERR(remote_pad);
+	}
+
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
+	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,

-- 
2.43.0


