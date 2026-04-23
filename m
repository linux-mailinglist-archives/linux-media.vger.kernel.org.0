Return-Path: <linux-media+bounces-59366-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULUYLa3W6WmglQIAu9opvQ
	(envelope-from <linux-media+bounces-59366-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:22:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF9A44E75A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B1E9306C965
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719683BE65A;
	Thu, 23 Apr 2026 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kIW8u75M"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA00264617;
	Thu, 23 Apr 2026 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932459; cv=fail; b=LBzBSPQ/PmqAyU15ombAP8baGYwNIo19vzAEFuU9ZMWfw/SuorwyO0X6WzWWyon4l+JH2p55t1ezmEtTVXiOzBSMwYc5df1IxPaezW9LVzmti96eSzO9dr3FUo03Dn35yDgCTXKy8+gmoRc8FRMicxeInx9XOZUTS0tiDVFWf5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932459; c=relaxed/simple;
	bh=M5ytnD37aRJsb8hpTlFDvZt/O1xYAZHLiqGGzZNe7+8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N9G5iAWzj1eTinx1SdlkwYRzIPwanDTFptz2tCNSomPdYlip5+WS4oi4thfDPsV0ixFRBJDAcqVvfVYi2k9xwCbtRnFzGqHquFjtiP3gVHSX6Xf1ArYG+m22QNZoCj1n7RXJQcJ2jSMUz2K7LJeWHbY/GDnytykLoQaNy4LX9yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kIW8u75M; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vikJlwtEbqJxFoOHkDZ+B/NITFlxrpPp7diX4i/oqL1adqkVMMsdfvoSkZA3OSb38qqu31gjAKqxfPsMeuFe0yA0DYrpi6SQ/WjbOFwfyxmgBDLhTFr6ylYN2d37ukANpjuopjPyL3GW3USqJ2IB9wtiisNqyv3iRE3tA5jcvScYjExZetzkjyAyhD+LXVFjiVpQqo9oPyb8coc/yy5zvOuGzfOYiGixyTQg2iMkZ/+F395K6YtWN5MDOsV/cfGBDI+vz5yX0bIXa0wMYCiZ90C6oJKi39pmBZe5iyoCvMIOzKsMIeSKNfhBxm5Sm84xdTnDK/oc6K+bC12hSVt+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQhb0itghgpwCsSpuP24Eeb4rI3l/NmVLlt3JoHOVkc=;
 b=GFXVBuEHPK6KR2ifSEE0ZOkmRi3utdspMMkl9rVbrepLB7VqsiyGopH7GPH2GdrAikXNAApfZMhbpsU88gIbQY4kic+N9ruXeM5e6h8bGtWbTK0JIDf7sazGr0AZstvebdl11Tt21yLbTTk5CwvCsawu6iX4nT7oyi9ddvExE3+TzLXcLThcEbufDrFPjGpTgBSS8ghzkwqdTsxTlPTnHXPulGT7Mf3GUepU13iXNSs0m4ICVzafMI9Of3lyAGy47C7zBqcI1B7Fz+C6X58efeVTUIA0fr/tvu7U/PmrKzB86JpQqACGM1qIk3A7MuCgM7Pm3gGltgTFS65+keqQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQhb0itghgpwCsSpuP24Eeb4rI3l/NmVLlt3JoHOVkc=;
 b=kIW8u75MPjJJDQH6Wxl23/JGZpBjB6UmUCazAf2K8bNCn1nw1Vh1br4QmsXMsbVwvsa65TFj2409/zZ/eGf3JUnJcSNCs342c/VGDm1cI8d/t0aw8k3lGuGV+GG2c0c5LawuPRMJUom7YkzEhZgIsJvUF0aSeyiCszehdNXnj89UUJ728C1LNkVO/4hIBKIkbK5N6wmFjObkkIWfR/4fG0znF4aLVLZjJ7qM4csmB9fkLQHNU179pmGL03LRr+dH42O+nWjZD+aeVrMqxUcOvOFtTOwZmhJWDhnHPQun/lOdYtLCyDjUO+/xKDOVPVwXs+KNQjoayXpAP5XXyqujIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:20:54 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:20:54 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:22:56 +0800
Subject: [PATCH v2 1/7] media: synopsys: Fix out-of-bounds check in
 enum_mbus_code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-1-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=1020;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=M5ytnD37aRJsb8hpTlFDvZt/O1xYAZHLiqGGzZNe7+8=;
 b=nCPRJvSCL1teFJED5RPilLweDzBpvOqAQMWOwfKqIpRbv0lQFJQIzmriKg6lwsc0A/PEA9svA
 dvZMX9EJPXGA7aSI3snuGQWjZcM1olIc0QIc/sUhDmh2J8KQl+NEjJQ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: c63895d8-9da4-4195-4e46-08dea1113d2d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 tIR76gEL8gYJatSN9qYtm3tizgRenVWzBYiR4CLZGFvustvBsFIp2ST6bRha/WfuEIJlsgBZGtIg0c94+5SqqQBSa8heTgcrRocorLCT7zWTi1cDayOng0jUiDJsoAtH/GHnGi7K0PmhzJJGlLQjlny4YTWYyhunacAsoMTrQoDoaNHpCkz2ic/j3vv91qQHxW/HacLnFLAnfHvibspqK4S642hgA80gGWp/feJlakCEAEgbN2cLoecf0zNuN5yzqtaCHcEnNp+C0xh87CHX9UC1nJFWWpyjyWAjces6QJIqmMG5Zt0xa0pD3wS8ZWgBk0LaFRfPSPxNV0aTvx/fmO1YY+ISqYs99j9QONNq9wdwKSZX9F3ZvkZND3oev7agR4DKkePAHRnLOAeCzjZbBj/w654dHKwQn8svAmGfNpZeMDwWn8IFOqFZ0+Vugg2UMtscdKAhDe4/1dfVxbWqI0WuRJhtaBEJY4JdzzhfECK6zt35jCYbBOl7iUiGyeoAFp7oTXmDIJh7hQ/T6T5jfNLwnYvhlDQIsO4X3AUFnwf6WJQtwN3NyXwlEF1kzaDa93Ph0a5eKOuIHJPZs9XBfwWCPD4WB1nwi9306nsHNIH2w29AbKkj4hl6zArxz8yJxk8q2UN5pMKpUA8pkIobGjqBOJ9wQUuYYizJAkRZgDD2NPoxtbE1HExys87VC8klHV7z7TV7sTfJMTv7P7eSzJ5wKkJ1+cXKIU0n8G65JK9gipCVJNB3chpiEUdy6HGlOEZFI2Zuge3A5aWxdxUTiaU664yQ+Wm+leZAkAyTvScMg61lrJLdlTZNMI2GMUYh
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cWJZczROSi9RWkxMMmJEeFp1NTd2dXlFRlNKWkdRTkx4U1owUjFZYTRsOTFF?=
 =?utf-8?B?ZHNvcEphV092VlBYSTFVeW1PQ3pjbHQ2S3kwVG5HaVRwdFRHZlVydHExYXRH?=
 =?utf-8?B?UEs5eFRORnlhVjNSbUxvYk9TeTYxdnc3QUdGZGExbmtQNGVtRVJpQ3Z0eWQx?=
 =?utf-8?B?UzdBZ0RMSXhvcmlnUVVudzZnTFRlbTZqWWg5LzZIUCtMb0FaUHA0ZnRmbzhF?=
 =?utf-8?B?WG8xZjFiY3V2WFhpS2tTTUVGYmJxZWVWOGJvWGROMEJHL3NNQU1BbzlqRGJT?=
 =?utf-8?B?OEFWMVpkZnJDRXovQThLRVlQcFAwaGp4RTkwRTNrWWFtcUFCQTJyUFBidGFD?=
 =?utf-8?B?eTVETlR0cHBXemNwYzRockxSMGtCZHRYWmltK1Z4UnpOQ3podVBlano3cnV2?=
 =?utf-8?B?YWthRHVReEVrZFM1M0lxT0ExOHFVOTB2WG1TUENPdkZzT3hjQVBPVjNpWjBu?=
 =?utf-8?B?dEp0OUdTNzRSRU5vTW5CUy80QWxINFEvV0grMTBoTmZETmxULy9XQU9DMXJE?=
 =?utf-8?B?OVZ3Nm5vbkxGTU9LejNBV0RYT1RBNElQNlRXemh6RU8wSm5DcFdQMCt1S08y?=
 =?utf-8?B?djhrczZPck11alQ4RURodHd5MWFmMTlsanpKWG1KY2JrekpKazFoRExsN01h?=
 =?utf-8?B?UVlHWGVnNmVGdWlERXlKL0d2a3Z5OURsV3g0bzJXYzlEM0FwcFhqZ3Nsajgy?=
 =?utf-8?B?WHRGamVpUzdQbklWdG54bGF2bTVESis0blhnb2Z2QzE4dWtUVkc5QndVUHgw?=
 =?utf-8?B?b3FiRmd1Y1VnM3o0SDVXZ0tneE15UkFwdzA2WnVBUjVVNVVVWFI0em5BbVpz?=
 =?utf-8?B?Zko3OWJXcDMyeFdnaUFLL09XSFI2dXY4d2ZOSkpZdWZMakFCU0k0c3ZxemFW?=
 =?utf-8?B?K0RReGkyd29kVEdqOUZhVWdtbExJbkVxWFNmaUtVSnU5SEh1UTBrOC9mMmJx?=
 =?utf-8?B?WElDN0VwVFgrRER3Q2Zpam5EYUd0TVkwdWthNHNkRTZ1Wkd3cjlpRG1BM2Js?=
 =?utf-8?B?T2ZPcDRTQmw1ZzBBWGZ6Nnk2VEQ5ZVQvQ01SQU94QThUNnd3aXhwVU1JSzBk?=
 =?utf-8?B?NDFqLzZSbm1GZUVFNmJyczR0bCtaVVlXZkxQeEY4ckc0aEN4LytjS29BUVEr?=
 =?utf-8?B?MlBDcmFLYmNlTTRRNmRqaEw0SlFOVVhTWEtSalVheTN4T0dPaGFnMlI5cHkw?=
 =?utf-8?B?SE10SHlZYzJ0aUZQcWJ1S1hQankzeVd6SUVqTGMwVERxR0pQeW1oU01lSE1N?=
 =?utf-8?B?KzFldFE3Q3NwK2JLU05PT0dYVVhtYWtyc1kvc1RLd05neFZsYTNyZzc4bEky?=
 =?utf-8?B?dHlJU3Z2UXVkQWhHRDJhMHRkQXhOODRCTmUxSnFWK3c3M25hbDE5Nks1MEE4?=
 =?utf-8?B?M0RvVHRubm45OEd4a3YrM3hMNU9COW9IKzh2cVFheFhJVFNGb2pHbExUZ2F2?=
 =?utf-8?B?TzRFN2FLZVdKNDlwazB3RmVtd2F5RHFEeG9XakFmVXpFd2swZjkvL2xMM3VU?=
 =?utf-8?B?aC9zdHdkMDIrWEhMc0ljb1J5Qm9PalMySnBPRTNkRDJWTzBEZTdwZ1E1bG9E?=
 =?utf-8?B?Q3JJbE5CU1BGZVEyUVB5QnJTRTFUTStZMEdwSmRNN1dYUWxTSTFEYjZnRG1G?=
 =?utf-8?B?c2xOUFVQajJlOSsrWDJBRVE4TXJxZFBSVkNvYnlNUDhKTWZRZVZNaVN0dDZY?=
 =?utf-8?B?YzFFWEJjUTFmL0RDMXI1QitYTFpUcEdvNGowcC93RXRvV0t1M1RKMW9FSGJR?=
 =?utf-8?B?MUNxNnROcTI0Y0ZrR2E2Nk5xbU96UzVsblMwOUpXNTJVbTZDUzFuQnRrNEN5?=
 =?utf-8?B?WXgzb2tkMHF6aDczS1hFdTZ6V21PcFhnak9BZjhEUEhuUERvQy8yeHhFMlI1?=
 =?utf-8?B?K2hSZ3R1WW5aT2g0RzEySUpiMG9hTmNqaWdVZE9TUTVBM1c2OXlIYlVhQm9C?=
 =?utf-8?B?aUk5VTA4WFd2S0U0dGxnSU8zdnVTUWtUUGhDN2tpUFozMVd3bXJkQ081a3k5?=
 =?utf-8?B?T3V1N2NUbnd2YXV1ejZrRXlwZExReWN6bnBENWFXZCtmTmduMzJIWU4rL3lQ?=
 =?utf-8?B?U3pCQno5NSthb1d4czVHQUpvY3d6eGlzRnBZNHI0Y3VmMFVhWlZJem1maThu?=
 =?utf-8?B?SHdpSG9IVithSDFSYTFBaWxsb1drNTJOZmlZSFpyNFNoS0NTd2xlQ2JYandY?=
 =?utf-8?B?bzVrK1F0UnJEVDU0YkRseUo1OGxBRVJVa2RHbzZtejFHS3JDVXpZQ1lTSGVq?=
 =?utf-8?B?VXJIclhVQytxY3JJUDVUZWhobTFqbnlUdCtrNDc2aXRHcXBHU0M1UTNacFNU?=
 =?utf-8?B?Sm43a0hWOTVjV3ZLWFBMdzRZMVp2UTNKQ0lEZnRKUlkzMlVMWEI2Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63895d8-9da4-4195-4e46-08dea1113d2d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:20:54.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vi7G+v1H7S2P4FV6uMyFDTf5iD/Btj0Wq1t0rTiW9+pc++AnlloncF+XsUDqDm42lDzSyhLYXlvPqd5a9NqsDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59366-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.105.105.114:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 6CF9A44E75A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dw_mipi_csi2rx_enum_mbus_code() contains an off-by-one error in the
bounds check for code->index, allowing an access past the end of the
formats array.

Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- New added in v2
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index ce17f986279e..02eb4a6cafad 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -430,7 +430,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 
 		return 0;
 	case DW_MIPI_CSI2RX_PAD_SINK:
-		if (code->index > csi2->formats_num)
+		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
 		code->code = csi2->formats[code->index].code;

-- 
2.34.1


