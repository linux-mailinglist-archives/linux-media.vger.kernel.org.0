Return-Path: <linux-media+bounces-56667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kALFFmH7wGkwPAQAu9opvQ
	(envelope-from <linux-media+bounces-56667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:35:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC52EE4D7
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10814304AADC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B009E372EC6;
	Mon, 23 Mar 2026 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ORUtmogi"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE93603F7;
	Mon, 23 Mar 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254708; cv=fail; b=iRgNGSzrgW76j+vt+ZD25ogo2UsSD6gwIRpHpzqp6ADzrvHb10U9vnlHH7AjNY0lvL6NKJR8DiSi1VQkKTZ7fdrf/YN0FiVmZVj2tKNrtJWtYgqE76ipXSIhBERfrjVBKWdtTS+7aif/6kyprL2qMX74XaTOI3jtkETsQpK/AmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254708; c=relaxed/simple;
	bh=/Le/mrBaSuTBvsYs6zxJTeaoJRqn6csyUHZF8nO+Ys8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TkEIOSgov4h5wUNjPtCxL1GZAWdltlfwEVeUArtGhRxKWIzk0M45Epv1JT3jpbx+SWZV/6MMPAVgcbTtm/g4mJLNig7PVM8T9LGMQ+q4/YQ0Ureq8exvGrv1kfcXog+ga+K9ZnhRgzxcaBuDhL7px+tyy/5FtR2fQRdqF8S9xSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ORUtmogi; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jffLLSbyZvQre+F1JgH1J05Xic0SK4tyVNpEkyyVzrckN99eX3xjGX4CPK1iwndVNso9u9Be5RxlFCNWa1lsXLbzdAkgZmQErlaXRxQYoXU5aI8BLNT/QjpzLKFS9UbcvEDCOJl7wBEzzcw2D5q6ItLVdfzek6U6xh3fcZ0kKFSywvgvNrQkLtHDLrPyf3GVO5wvgcWmhaGBPSihPWD8QGh3zTisD8hDqzPTt8bZCdFRGuqtQeMdblRORPsi5kQGqB/SJv1ZEUBEil1yBGTYNzJaEDIWv+WTgtpprexisqb/2Niei6zScYSeOYzp3Ts9YB9u9uu8P+kNUFC4xIYYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYZ8rDAq5Z3vZlEXDOgscW1Ba8LPlDYqyQZD9q3ooyM=;
 b=mTBTHEqV1tKqJc/54aMvuTVcvt/xbJj44DnmMizBq5usKx9UKdqzxPitKmB5ZpMPi0Tum4T63Rz2/uUV40jgDpogWEhGT/2FgsMaMZdfnoZ9RI9mZTo9xUqTjgKo9AvIw4SAKqr5WS+plkEmHPuCIP/ek1juaw9v0dF4VCJ8FURV074inIuEetVsf7ehsDIFeuzYaaoRCPl/43PkY+kjNDoqMpG3IS9D00nxiagDsu/eFm3T2ge5THPtXGpFjjaNnfqcXgm0C4OKMlJ6FzcMrGq0u0G/kCKJshv5NWCvdzcD1lXGzOOVR28BUWESmG7Q/8ZfwrNUvqflLgE1FyWlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYZ8rDAq5Z3vZlEXDOgscW1Ba8LPlDYqyQZD9q3ooyM=;
 b=ORUtmogiIIH8QLIGiC+1gB/rmjMF6ka0GnLx27sbrQ+y916Y0W3x1vBLKogJ8+eGM4GKq+Jnhv605dmmCPwcB0Z7fItN7VIgVdRgV++eqJ+scPY7r2FeDLeBLY8liySDp2GDYWwDW4yQW5MSfcWP2YfiF6kOu6Y1GIRl3hFcQaDvN5sQ52Ah7CG0Su4D1s8ABhNxPLXYj2ZKKRAmVrpnYcZiojP5OHu3OMzan01AkdWzNnqEEm5OI/wj94yGHwf/FpOnaE2Dxd5qeugK/bb6m6gZMpchBDVQwtPcYu1X8YX2Dn5susJVXcD5g6oDdMI7nyqhuWBGKtuo3w71P6Bo5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB10993.eurprd04.prod.outlook.com (2603:10a6:150:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 08:31:22 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 08:31:37 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/2] media: nxp: imx8-isi: Fix scaler rounding and
 downscaling limits
Date: Mon, 23 Mar 2026 16:33:29 +0800
Message-Id: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANn6wGkC/1XMQQ6DIBQE0KuYvy4NfAxqV96j6ULwU1kUDTTEx
 nD3ol20Xc5k3mwQKTiKcKk2CJRcdLMvQZ4qMNPg78TcWDIgR8UFIisL1tS2bazW3aAslOUSyLr
 1eLneSp5cfM7hdZwmsbf/PgkmmJFkFKGqrZC9X5ezmR+w64S/Qn4EFsFHLnXLu8a26ityzm8py
 Tb2xgAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Frank Li <frank.li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774254837; l=1455;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=/Le/mrBaSuTBvsYs6zxJTeaoJRqn6csyUHZF8nO+Ys8=;
 b=WaKQNsDrY0ggpFdIp+/IXJhEO2g9B4eNliFl1cucCkJHSIdvMbvc7oqX2WfVIaY+H42obQRAW
 Bj3HgQZvxQMCf3JKev0cCMfr13rme00yWSNuk88X8cXtquNzQxP+JJd
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: 22629862-488d-418a-8382-08de88b6998e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 PPIsN2Apekepsv3F9RancbO6P0njZT5IEFQo6uwwwKcUa2HTwf4A2b0RRqry7Fl0lE1LpOqmruupRIcf7ZI4RLtG35hU0lO9gJ2Z4hoRtLxvH+pE+4qGqY4Z/USGpaAd2pXwUPrmp4cG3t7/spFXcMYTeXOKt3OOGaTSg6CkrTQlL6bFJ9Ciybz8P/eAqE16dCMRqkd8QVSIQn7o7cBFILZZdOzCWtuUvqpJ7M9ljAcTD/+tL4J+Ag9WxO7OeCNHOWbh2oAivdLHxqxhJXgAhya14z+AW8Hmt3v9KmNZP/IMk+5Yx9t11OxrP4OS/OgPytqabgyqkEbnj/VxR4xsU2z51gaTG91BqfGvRi0KOvh7bbkj2vaggOtMBbjIZoYVsY257kOXjifzJbdwIRJlhARwwhwe9ppaEm58kZIcieXiFN+BgtB+zhK9piybOMwjzbauMLfWPuk8bsKzicWWQ6aK4kvDWJQVZpvoZ09xsYAh7jrb++Ox18/BNADUmztMNsDTRnOdEGJNGBhmCme0iLfBWAt5WqooTbnT4jVJXshGnfzRN0IC0IJfONIOy7nOJynMYEXcYIkBdfzxn5nYmwCrP06T3gMtWGpKVEFQhw3F75+VVYph+/aERalkvz0tJ118iNDJ+QW3L4LMjp01YTkqbp9uF/E732evgrnCZ7zQK27RiVBSBfXpAInAZRMU9JlH930l/KIcyNbyK98CSUn9OIVeLpjj13rCwHLStBtN8iF9BOrcbOYYKn2s13+KvOHrKEMMPL8kII6bGs0YN9A13mt7DPmefus06dHzRWlE2rG2sC0xJy3K5FhlcNIttJpps+79E+hCuNGOdFNBZQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eWVGYyt0ZWxNelMzOWtLd3pBR2F3SzRXY3JjRHJkeHpHakJ5WGUyTktKQ1pu?=
 =?utf-8?B?UVZGaU42RjZOOXJadGRkcC9uQktIYm8vTHhubWQ0enM3cU4xVkdmSlVQOURO?=
 =?utf-8?B?K2R5NU5TRGxwN3B3MkFZMVN2QzZQVzZ2bEY5dndLd0lqZkkweUdORnhuUUZJ?=
 =?utf-8?B?em4zWHdEZDNlU284ZkJPZEdYdlZ4TndjUHdGZ0NKQWtWUWxsQVVGKzVDN1JZ?=
 =?utf-8?B?UUhYem4zTE9NNzcwTmNpZmNaampBTGFQSzhJK3NFRnVnRUpxbXVpNTI5UHBB?=
 =?utf-8?B?Mm1rdjQ0ZlRHVURmd3Awb1FpdEdjbld5eXJZQ2gwbmJhb21VYW0yYUNEL2Ra?=
 =?utf-8?B?RWZ6Kzh5bGdxaXVXWmJzeWtQMWVFalJjUm9VNFV6cWtSdmU0YzNzUXFmWWVp?=
 =?utf-8?B?N3BVbTBFT1p5SUM4bXlINXlJazd6UkVFcFEzTHdGVHJDanZwcXhlVDBod09U?=
 =?utf-8?B?dDd2dkdyc0ExUTN1dDNNdE43KzBkWENGM0ptV2J4T0czUEJHQWxtOE9MendH?=
 =?utf-8?B?MGRuSWFHbjA5dHpXMm1oRGhHallZZmk1aHNLeXJIWVhUK2hlMUtzY1lzS1hG?=
 =?utf-8?B?STNBV1hiTGZ1QmlnVVRMNktCcDRscDl4ZGlGQzVSNFFPd3B1SG9xQXh1a3BS?=
 =?utf-8?B?VHdIVG5pN2VUMmFaU0dLWE5PUC9Yb1pzb21LcDJ5ZmY3TFc3RGVTc3h4TXJr?=
 =?utf-8?B?UklzMCtyTW96WVdpYkR0ekJjUFVFRDVkUkdHRWN4L2crVkQvYWdQQXoydDRi?=
 =?utf-8?B?eXBna2x5QmU2a2E2Wm1aU24raWV1N3AyNUdkZDgwU1lKK3FuSWhzanluQU11?=
 =?utf-8?B?SjN2QzNPQTUwQ0NTLysrL3kxN1NkMG1sNjJFcE54N3VUaDM4ZXorYzU5VVhi?=
 =?utf-8?B?MzU5cFhHeWFpYStRcE1ROEhJQmliN201VGtiUlkyNUVnRSs4S1NuSk5mSEQ0?=
 =?utf-8?B?bTFvWm5NVlVJNnRBQnVsY3E3aWxSRVl0THVnRW5iTGNGKzNiV1dObms5RzUx?=
 =?utf-8?B?U0lzeWVmeXFWOWlpcThORXZRcVNUQVVnNGs3NGlURHFHR0hYYS9WS01ZQzNt?=
 =?utf-8?B?cWdzQmNCaElhdjZCWVIvc21KQlVJNEhrU0x0Z3kyVURzWWpqU2hPa1JReTZ3?=
 =?utf-8?B?TEY5eEFzVGhSVWN1alIzK2hMRlY2NlVsSUJVV2dkaEUvdTRvUGpVUEVFUVA2?=
 =?utf-8?B?d0dqcXpKQmxKY2dIVVlzaXBBUW83S3ZvTjU3dkNwRk1QOS9UL3JaZDIzQmFk?=
 =?utf-8?B?SGFXWm5zN1hHLzY0RWp2LzZkK1dzNUNxQ25XQ0NvZzBZQi9lbHZLazl1OWNs?=
 =?utf-8?B?MzRHbnBUTzJIL1lpdUUrOUpkSkJKL3FtUXVnMDAvRERKQkdodnN5SFFnQlVh?=
 =?utf-8?B?c055MElzS0QrTGxtZWtVeVM5eEY1QngwOHd1Wll5c1FPT1lPYWEzUEJGdVI5?=
 =?utf-8?B?bGhOZ1Z4N25mbVhwUk1pMzQyTWV1R1BHd3JiMFViWGhEcDhETTdtSlhDOFpz?=
 =?utf-8?B?ejJkSWtlNTljOHhMcjdmRFUxalc4bTFLWlB3dVpEL1lCQmV0b3lyakpqZUFC?=
 =?utf-8?B?cE5Ud0tUYk5EbWJaT3dBSytMdzhoS2VrRmNneTdjcEc0SkF4a2liTjh1MHla?=
 =?utf-8?B?V09iSnNxbE5QRzhiZmZSN1IvNUtEZHlWUWRtbnNDVzErNnZVOTFmYzFLaTVN?=
 =?utf-8?B?MXNkc0dBelk1U3dVWFhub2ozbWpjMUU2LzVrWnlROENFSVRMSStvenVzeU5B?=
 =?utf-8?B?aktkT2VvOUVPMkVrNHRZZVZNWlp3NGplUUhuQVNkTytNVHRDREptNm1oc1Fs?=
 =?utf-8?B?b29Fa1ZCTEEvWVcyZWxtbnNoaEJRSjBCRVNzb2NDdGtOY0Y1UzZVUXlhZjNJ?=
 =?utf-8?B?WjFwMzB5VlNBdjQraUZvVlRRaVhEaWMyTW1yM0xNSkFWSGthdFFLMVQ5SURK?=
 =?utf-8?B?V1Azbi85NFZpekFSL2FBUzYySjdYbnZvcWE1NjR4ZG02K1pRU2hhWTFBNnBN?=
 =?utf-8?B?bUZPbWt2ZE1SS3JORHl4N0R0YzVneS9QdyttaTlyKzkvTG5QRnVlVHRNOVc0?=
 =?utf-8?B?V01oaGIzZmNKOGlrYXFPOWpPeEJ2M25tcHhxSEtwaEdVRUVUK0luejUwSTRD?=
 =?utf-8?B?R1NiZThnZmtmUVlUT1dBRTBWSVRKRmdMTi8rU1dCeXF6MTMyM21TQ0cvbHdw?=
 =?utf-8?B?TzQ1ZUNGMVBsTDVHT1JobUtDNzRpZ0tnQXBTT0RPcUNEdUQyd1YyMStzWTVN?=
 =?utf-8?B?Y2JqTzRHNjZ6QVd6QVczMThINy9xeTlFQ3ZobGs2WHcyTW1Eem9URUl5cml5?=
 =?utf-8?B?RC9NT2JSblg1MGJvN3BHdHErRG5HcjRtMlF0Y21QRHFvbEJiOW8wdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22629862-488d-418a-8382-08de88b6998e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 08:31:37.7930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECQPujkkfB/k1GIznorrqAUScfFFeYfBY56qE1r6VymhXDVWK83gCb/Bf4StiRQRAAZbRrah6F3RcKRlpoRiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10993
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56667-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDAC52EE4D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Patch 1/2 enforces the 16x downscaling limit to prevent out-of-bounds access.

Patch 2/2 ensures the scale factor accounts for ISI's rounding-up behavior
to avoid producing one extra output line.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- New patch 2/2 to fix scale factor rounding
- Replace CLAMP_DOWNSCALE_16 macro with inline function
- Adjust downscale threshold from 0x4000 to 0x2000
- Clarify downscaling limit in comment
- Link to v2: https://lore.kernel.org/all/20260228-isi-v2-1-f6f9208c6844@nxp.com/

Changes in v2:
- Fix possible side-effects caused by 'max_val' in CLAMP_DOWNSCALE_16 macro.
- Add space line between two paragraph in comment.
- Link to v1: https://lore.kernel.org/r/20260122-isi-v1-1-c3ec6e264f13@nxp.com

---
Guoniu Zhou (2):
      media: nxp: imx8-isi: Fix potential out-of-bounds issues
      media: nxp: imx8-isi: Fix scale factor calculation for hardware rounding

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 13 +++++++++++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 11 ++++++++---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 13 ++++++++-----
 4 files changed, 43 insertions(+), 10 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260122-isi-74f87fbb9a6f

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


