Return-Path: <linux-media+bounces-65156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ivhOM0G9M2qpFgYAu9opvQ
	(envelope-from <linux-media+bounces-65156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:41:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564569EF42
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:41:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=aquzFCiL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65156-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65156-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB4B30071D2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0539C3DDDDD;
	Thu, 18 Jun 2026 09:38:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B9395ADD;
	Thu, 18 Jun 2026 09:38:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775528; cv=fail; b=agkd0sCQYZ2ueEUkhIKX/i7+YvKFXv6nt1PElLNH6/vc+iZq3POHLpnCZo1U2vgRJAz8ziYjgyH21fscVGRk7kyeI0/b8cBTn9W4+/5WM4J9WxO7yzNxEM/R+YjH5OmDcl+KNweIu6zo2Cw6n3IdSpjvBt5CqeaJt+SNhfcdP1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775528; c=relaxed/simple;
	bh=uYmiNmWMzJhK5A2Bbz5oAeqxaQfKdPgRdeTm4NI8HL8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Gm7CWJXw53hPteZO2F8PTyg4nA1tW+6rhBKFU0U4dr/IzAQSFu+bdmDMHasmRaqG0Mw1AH3aFJXn98VgIoMv+x0JBEuHJCM5SKw5iAnUd1Xj27/NgR8maAYiqMoJVVjzHNIBiPZ2cQhI0pHvwQmpnJcbgxN82KVTFMCLyOsH73M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aquzFCiL; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0a+2hQM5yRPJIfxiDm1J++C+3b90tlH1YavfUO5Va/Dgv/17B9SIUlEVXvBY0go9nNmzWvHCGziDXVvXaEw1Lyux4s19mMjjppQK90pWXbWslJltTvaOnB7RyHY0p+bA277oreltvc09GZTphuawD+0WO2cgo5ZZjWgTFKXjQitmG7QeyjYoXvLPG0HCJtv0FT1QigWQhUPe22VB7Zv1SW4VhcvedzgrbHma0hUkxLw1riFFlb1W2Kcju0f01dVbQxbBi+jzDED4M32IQS7SMcHtaR/K5Cx1xTcitV38X1Du73cJSuH80XyYckJkiFQA9czaQSZJ9Ks0LS/5i2kZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86J9SgXNlYwCsA2jgLEQ+3PQW8JF/yhqNILtUr5y8vg=;
 b=TNQ2IdL1jr0QHYMosc7moJkptuxTVrCxCZinRPVE1Fd+j1WFd4hJiGfvq+aisXWep9pMWUXsaGpnDEesewgicacLzIONJ9O4xHFRuWfVuOqXbB4zhJv9o5kQFf/KBrWVNlgOI9ASkET6jBJtsTV3HGoIKOLn/jc3Y6iHsqwt5/iYv0no2lhMFKN6Z6t5CYJuB4A74ZyuNsJvLdc7bX+W3TU8Ovrm16T0pXANj88uAc93JKHvp3SEtq4ELuJu8TfZvbMgBUjWqA1jqVu8qfPT0JEGkqLsXjqm5y36Yr6hfnxFL0qUjvwO6xC8wX8ayXYpYeIb9gYqk3LsT6ZEVX2KeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86J9SgXNlYwCsA2jgLEQ+3PQW8JF/yhqNILtUr5y8vg=;
 b=aquzFCiL1yQeGVfcsay1eBcu1M2BcsUMZUMB5pBL4EMZXglQt9zvGyjYO0yvyQd4C4IBBpWJpo9FxeNW0f3cQh1qn3HCwh217aEh/elLzW+2Xptf1D59SeWj9SbnHDTrVTrUASJiN1hY7Xef2p2FohkAvXIga33sayLa5nkyKOo2r4c8bt4zVziFnfFqJ3AcqlKP4/4SRWX3DoJe56ggKB4UN/0YFxVZZjOcDF5jy1ux+kMkPqX+zGg1FJiPPDhx+ymAM7PmYEtDxW8iY1Lyhelov7vUTlMYTAQ0YnCFLlhw1r82CGMp5WowyZErHSKC1mI4h9UFJF3TmNgd45TAyw==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 09:38:42 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 09:38:42 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v10 0/4] media: nxp: Add CSI Pixel Formatter support
Date: Thu, 18 Jun 2026 17:41:34 +0800
Message-Id: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE69M2oC/23RzWrDMAwH8FcpPi/Fkm3Z3qnvMcaIv1Yf2pQ4h
 I7Sd5/TMZa4O0rw+wtJN1bimGNhr7sbG+OcSx7OtQD+smP+2J8/Y5dDbTDkqABQdb7kjzSMp36
 a4thFCmgFUPCRWDWXMaZ8fQS+vdf6mMs0jF+P/BmW7k8SctEkzdDxLjobAaR20sbD+XrZ++HEl
 pwZVxZ0a7FaQiDTJ8MR+NaKtbWtFdUaMjxQMJpb2Fr5a4kDYmvlMjdR8n0AL0S/tWptn/ZV1Qb
 lDBfJkHZpa+nP1ru3lqrlwNFEARjRHYZS9huv1960XlevCJ1WXCkdxbM3K//09dksezuShHU+y
 n/m27Wn1tvqfS+CqUeTXtitv9/v30eE3sWZAgAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781775717; l=11188;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=uYmiNmWMzJhK5A2Bbz5oAeqxaQfKdPgRdeTm4NI8HL8=;
 b=OQ0adlOohqrXABRqbMJPTuoKdlkhxJ3pKf8evlMRpdkkBeyeA9ZqAbOWRc6gahhlzNYhBS2Jy
 /LHA59OQUwuDvZKtoHKlsKZllDTo8eY49aQp6xCzCz2BbV7zbrvj5WE
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|VI1PR04MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e8ce91-7392-4c69-b344-08decd1d6254
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|19092799006|23010399003|1800799024|18002099003|5023799004|11063799006|3023799007|56012099006|921020|6133799003|7136999003;
X-Microsoft-Antispam-Message-Info:
 bCeiF5gq1I9+Ea2hNyuv/v9pOS5wCjihpf+tZ/kJiDXJlc5lfF9MF2yGqyeeIWzPJaW9P8gLO1LWgK9VIzFyHENt7SauyJ3+RaWXyRwWKg1EsSMYWdChUnoPncePDX8wgdo64TxOmFZVw7shxKfpZfdPxn+VkoBmUFvCB11rWRaESCMnSP9cf8mQdkdCGjcNjEiDfA8kWB2dNgKZFGgy88Xq4ziIzOukGsQYVlhL9rZgRIknupXrlsvJC/XfpFCMy8M2hLIb1bZNUd+ONJ3RUPgDsNV9H5S5pZsJkqeruAQZ7EtnxksgrGylnj/sp8rT8XqrGOGtMjrgZWNdLP6Q5/ryjUvjKtAoNY7BciPibGjH3jtkyzw4fkdwxmzsh5M5gshI3nGyjc6jEgio4yCbfgTQ1ni4N7jkOoQ3mpzKT+F10MqM1mgb02g3GumEjcA+cJJKWEdZWH0qcRwGbF7Px0gSQa4dXIALG7Ryd25OpdP3XCi50cOzGZd7ySwZitwpIcjnGbGH6phVqv3qqWguMz/UVpprt46WoAFHL0zwZ5nHNUxw6C6Y7gsak+hp4BeR2gmupO/+BF3fjKiHUoX/JYOFomcU9iBTgSn74F4EvXtDVY/2D795i3NCnLz0jEhjtuXnQqxdRw3igDE74MbxVgwlDbFA8Hxd8mATtgk9BSV8L4oGAKnywQx4DdXf/C9IN+FVY1ians1iJ+wNWvPyHtcPvhkKLJwuvRHBQur2PTE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(19092799006)(23010399003)(1800799024)(18002099003)(5023799004)(11063799006)(3023799007)(56012099006)(921020)(6133799003)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cFpkRDdKRGJMejJicUl4YkN5ZlA5Z1RFbU93V2FzRUE2TFdhNVpCYU91S2Zx?=
 =?utf-8?B?UTBXbFh4L2hMbElFbzVGQnJlVnM4RndWckFUM3R0UUV5emhyQkhVRVhzRy9H?=
 =?utf-8?B?YXUxZzBoekZkMFZhdHh5VmwrQUJzMzNjbVVISFhFQTdzKzZyMytFQTErM3Vq?=
 =?utf-8?B?M1FhYklMdDFqdGxWV0xqNDlVbUFOeklKeW40MnJ3N205ZjJIeFJ3bFpQdEt1?=
 =?utf-8?B?eWw1QzhZTW8vdjB0RjdBancxQjA0ODNWaHRvVkZ6bGE3N1J4V2RBQTk3UWVJ?=
 =?utf-8?B?K1FaS09uQmZMWC9hcml5WEZvVGZiVUpTZlNQNlVYdkVKQU85U295T3ZqQnRt?=
 =?utf-8?B?M25SaFUrd3RTcFZGd3lnRy9xRmVjSWNHaDBndTE3YjRyczlabjhRWXY4QmF4?=
 =?utf-8?B?emI0cFBuZFp6cE53UDFWcXFySStGaitIMXhCVnRyUEk0Q0hMTjJHalBuWVp1?=
 =?utf-8?B?bUd3Z0kzMGpiczkwVGthRDhCYWlQeWhJTWJudUJ2ZjRPY29BUzJrcTZLOVJy?=
 =?utf-8?B?dG54U1lWVDNwYWt6bVpSQ0NWckxhRFIyY3VaQ1lzUWx3U1FNUXZKL0Y2UUc3?=
 =?utf-8?B?cUdoZExJa3lQbXRYMk1RYjlDQ2FXbVBFdjBSbXdidWVzMTlUMTVLWjIxVjNz?=
 =?utf-8?B?eUJQdmhNTU52SHJCMXNmK0dyalpVOGJvS3BmTmc5cEwvT0RNaTh4MGs1T3Vh?=
 =?utf-8?B?ZGZHUld1SS91UTJ0L20rMTh1VVRtVGlLdTFKK2Njeld5R0hNWFhwOVNBd3kv?=
 =?utf-8?B?Z2t5clpNc0VBZWVNNUU1L0xpaFdYNnYvbnp3elJtRHJmc29wUTZweko2Y3Rt?=
 =?utf-8?B?WDRMT1JzWmNxQ3hycGREeDFHSUVjdVFaRFhvTXcxMTJma3R4TU5WVklLdnR6?=
 =?utf-8?B?Q293aG5VaVRyVC9lNEU1QzVSd1hEYXlvWlNOT1JnbDNka3dUNnV5YVRBQnNI?=
 =?utf-8?B?aW1OZkh2em5rblEyNS9mcDc3Zld6Wm9mbi94QzZJRnRrTUw3aVRSUW9Ia1lN?=
 =?utf-8?B?emZxeWFxd2JWV2dPcnV4NWhXWEF3ZExiZDduTTVWNUdiV1ZMNjNzbHFob0RD?=
 =?utf-8?B?M2d5WkxTZ1pyV2RHRy9iRk9sdlZpa1h1RytqY0NBSmZEOXRERDJqNXpMU0FV?=
 =?utf-8?B?Nm1MQm9nSTk0MkhkZE43SENWeEdhcDgwK2szMm1VWitIZnhHS3ovUERnc3pL?=
 =?utf-8?B?Qnl4SW5HajlYZXhEL0Q3dXQyUDlhM2wxTXBTWkZvVi9FVGQ5cmM1cWN1MlJC?=
 =?utf-8?B?VGpQUTA3V2FVNWhDMlVOT1VZYlVhaDEwMVdOUE4vUVdTMElsa2NrKzNuQUJt?=
 =?utf-8?B?clJHOUxWWjBuQkRsRlh1K25uTmJRZXM5bFZBNFhzRk1hSUhOSy9zQzZpUXN2?=
 =?utf-8?B?dEVlclFqZ0QvRWNieDc0ejZDZHNrVHluNG1pRHpJcThVc3AvTlpwUmZVZFN6?=
 =?utf-8?B?OE5HdFROS21oU3BHWFZaS3VieVV1L2NoSUk4cUViUmI5RFd1OHMzZlR5RzFS?=
 =?utf-8?B?TW5PN2hKYkVXZUlmR2NVQW4rZEpzOFdJd1llL3RzckFKNnFFdGRqRGNZbWY3?=
 =?utf-8?B?b21lZXU1aW93cHZpWk5OVjlwdDVHZTZkSk03MEFlVVFLN2tEbzgxcXk2NFg4?=
 =?utf-8?B?UVI5STVPaGRzWXVlWVgrRmFka3VwMUNWdk1RcUdWM3JLTVlsWVIrZDVubXVF?=
 =?utf-8?B?V1M3MVZBWndGMUxSTWNQdlhNT2dxMzZWUUFWbWZZZC9OaW5lQnNHWUhMV21v?=
 =?utf-8?B?UDduL1E1Y1lWbzlHN3BESVJJWWNUa3FFcFdvbGs1blY0MDZxLzNyMUlMczJD?=
 =?utf-8?B?ODR3YUNDV1JjQjltMzVBK2VJZWxPMkU0cXVUK3JmdHM4LzZXeVh0UmNmd2Ir?=
 =?utf-8?B?QzA2L1pPTTlRMEY5THhUdmIwVmN1Q1QxUW9hb3YvWCtIUDk2UTNIR3RBL0pa?=
 =?utf-8?B?dWNNcFU1dmw2aW5DOGt5V0lWTmNtdUtybWlmVFBYRS9jWUk5UElGUk9qZzFy?=
 =?utf-8?B?K2lsd1Z1dWFFZERwenl0YnJCNktTK054MlZ4UkNxVUlSSnl6RlpGQWdEYk5T?=
 =?utf-8?B?bTA1c3lQZFFtRjRkMVdzSjFlNVgvamJ6L3N5SnJSVnFHdklUaGJrSDdFY0Y0?=
 =?utf-8?B?ZjJKYVgzU3hBZTZYRS91NlBseTlqNnBtL0dtNC84aEhDb0N3YURNVGhGUUdH?=
 =?utf-8?B?YTBHRUt0L1ovMUIrSFlVSXg0Ymk4RUlaWGU3ODNacVFBL3oyNDh5aVNzemFR?=
 =?utf-8?B?SVE0cVBTVnY1Vnp2TUZZMGlOQnhMVVBsRCtEVHRQSTIzVjJCbnZ3VFZ3c3o5?=
 =?utf-8?B?dm5RSkgwTzRWakpCQ2hWMkRObmlRUndBRUd3Qm50TmJPTjZmNXVYYzdEL2ph?=
 =?utf-8?Q?+XDLz870aIk1X8wNgWBynQ4txZe+iHhi+bKsg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e8ce91-7392-4c69-b344-08decd1d6254
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 09:38:42.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F99pphokydd4ZPYDz0NXWtBZAWVXL2Irfk9EoTyh1Jud6EyQ2C6kj+Fx8z5qEYIBEYCmyr/DY2ek3lyXL3mnSjVkNshgiPtkeva5mO4bXnbvoEL8LqxBcOF2ZUI206Bb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65156-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2564569EF42

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

Background
----------
The Camera CSR binding was upstreamed during the pre-silicon phase when
the hardware integration details were not fully finalized. At that time,
the syscon binding focused on the CSR's primary role as a shared register
provider for clock gating, QoS, and error handling across Camera domain IPs.

However, the Camera CSR hardware is actually a mixed-function register
container with varying control levels over different IP blocks:
- ISP/CSI: Clock gating only
- ISI: QoS configuration
- CSI: Buffer overflow handling
- LPCAC: Error handling only
- ISP: Pixel link selection
- Formatter: Complete IP control (full register set)

Why Child Nodes Now
-------------------
The CSI formatter is unique among these IPs - it's an independent hardware
block whose complete control registers reside within the CSR address
space, not just a few configuration bits. This architectural detail was
not reflected in the original binding because:

1. The pre-silicon binding focused on simple register-level controls
2. The syscon pattern for complete IP control was not initially considered

Discussion with original CSR author(Peng Fan) confirmed this reflects the
intended hardware design that wasn't fully captured during pre-silicon
upstreaming.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 7.1.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v10:
- Rebase to latest media/next
- [NEW PATCH] Use single quotes consistently (Krzysztof Kozlowski)
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes,
  requesting re-review
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message
- Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
- Add MFD_SYSCON dependency to Kconfig
- Fix stream/VC mapping potential mismatch in start/stop_stream functions
- Link to v9: https://lore.kernel.org/r/20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com

Changes in v9:
- [NEW PATCH] Fix formatter as syscon child node issue
- Link to v8: https://lore.kernel.org/r/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com

Changes in v8:
- Rebase to latest media/next
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Link to v7: https://lore.kernel.org/r/20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration
- Link to v6: https://lore.kernel.org/r/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com

Changes in v6:
- Rebase to latest media/next
- Update v4l2-compliace test
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
- Link to v5: https://lore.kernel.org/r/20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com

Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (4):
      dt-bindings: clock: imx95-blk-ctl: Use single quotes consistently
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  66 +-
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  88 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  15 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 775 +++++++++++++++++++++
 6 files changed, 951 insertions(+), 2 deletions(-)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


