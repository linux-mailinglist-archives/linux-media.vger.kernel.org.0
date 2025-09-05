Return-Path: <linux-media+bounces-41797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C29B44E60
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0FD5647B2
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B55D2D47EF;
	Fri,  5 Sep 2025 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Nya80TqV"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836D2D3EDF;
	Fri,  5 Sep 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055388; cv=fail; b=ZTR2K6Nt4S8h7x8YoPo2Vh3158rVWzcP8UxkZ3UhtkEB30leobfl/8NGCsMUhWDKqo34dImtGS0ha5oDwnlXXzc+sV3sOVxlzGqUzmUg0ciaawfnyF8RXKozr14vMdhVnvbtc00sJktCII9vwP3yaWU3SmBTgAelp041j8eAZCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055388; c=relaxed/simple;
	bh=woTtGUqenVf/GxsMpXkz2fD7G7+Fdg7NJedHq3fadSk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FYR31CMXzZAvXuQsqJkSnfSd8rJRTv09ViM6v0aER/XOTfPJ9zCcJIucZlalqrnYf3+UHcDWQKaaGUjNoYadC6K7oaeAuNpGViibKNNUHLPwtZF1xMM/NhqVicwQph87d/g0gQJDTux8HFdm6TqNyAkK0p7hCdaR/cucqOOLfFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Nya80TqV; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esYqFmxpVZ8r4xNdyZia4gEkd1k4yStz/np0gKJLAdnNsvoKAKYKgM6iHE0xRyirmboilubQ9iNx5MqDxxmy67hNClxCQ1UbiPfYnQjoMYopy+LBlaskyRwwj4sO/q+8RPJEYKIPPgvOshH5c8bOsW93esuePOsVEvkUlH3egDkGvfG3lyMo2er1EAuUlrVpg4Qk+CGHHEINLbC5rf5ka1GcYGdQLmbfuykecilnyCCUqG6kD0H6D81EBYhL0lz5QZr4jWYh2eqnV36K009Q3LtIFTd1kopstWvB4aN9qo6bSc7WngoecvZ4pOaRL1+WOEcWzNMe3aXLYQYQsM8tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8R4QwPj48XODtbyO65Cf8ztmvR3mWRiKxA1hjy6rsFM=;
 b=cVV26MpwznNvw8zrpbFadoGLvJckn/ohpM/AciGUKEttJpOyIUIVw93QHoDfcxvaOQjlpU2Pow7UYeW6ldnaBSlGCJ21qJi2QIkjeKAsFlMzQ/hPyypR2jKkHxEurtBjKTFYtDbyyfO5FdbHm7AWoKNYWn3Nh+/Dns//CaFHVjR9dG6Olpg2C0/5AobwhNcKzJ+WHuDDtzeQvoWYHWm3/ZiW3rRyg2sHljtF/Q3PkgMR5qK3irbBNRruRzI/5PIOVYMK0SxKS2dy5f3LsHiu2VOUzn7Kw1KRc6M4es/F2CLIP1ajqFLoWjEUNXqASZwqum/gii0GnFkElEDPZmENCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8R4QwPj48XODtbyO65Cf8ztmvR3mWRiKxA1hjy6rsFM=;
 b=Nya80TqVOJOICrdClBQMRv4m+FGRFGepok6UayjuYK5M1JT/nZ2zs61ajcGG7HeA7ZWp5te/WluYmVSWhtta6MqWrPOyOQ7te6VDvJi9GEdLn0mPQUJHGtEhFg/L1cnyfV1ps8WOkVI2+Yy6uNHZlxwpMpLzeQhCr0rBw68PThgtIqeP//khcDmdq65A9y/voJ/b9/eBn2fw4aaxLmp2xDsHJi8OcfNyv/wpaopMvzBnvQU1N20i11/C8wPwi50xjH4gy5mSMLE4tTUKYD8ym23buM/czuwcGCVh7AvxMZDuFA6s+DQcUlwqyXilI1Jg5tn+Q6HzFyLteCGyk+D60g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:56:23 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:56:23 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 05 Sep 2025 14:55:58 +0800
Subject: [PATCH v2 1/5] media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-isi_imx93-v2-1-37db5f768c57@nxp.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
In-Reply-To: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757055383; l=1740;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=JHsH1IgaXqzyAFfTgJiewqjAb8TTJTCtZ/yiy6r1Q0w=;
 b=Av4FGTFJpZv6T2IUzZmPyP0XxdIFyq8uoMyMf1fR0syPsr+AR8mBcwRB1XroVLiM8VClifMwh
 jObInZ40IdUCMac/mjWZ9k0yc9JYYGnRu0s7wxQwGKDrlQ+LGDQBbpb
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a450c3-d84f-476d-1742-08ddec495357
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RkZHL2xHeHdTMmp5WTFmYlFYdU51ZEhQOWthUHJqd3JxMXJZVUNwZVZTSG9y?=
 =?utf-8?B?ZXBDekE4MTJUMUMwWVJvZFZmTVhPL2xEOVorSk5GTzRVVEQ0UnM1anZWeld5?=
 =?utf-8?B?TWRBK2FCQ2JjcFFoSEZTS1JyaW8yMzFYejRTTHBYRFNPUHNoQnBDN01qQkkv?=
 =?utf-8?B?NEh0Q0pKdjl6SFpVcGlEYk5LemRzRCtER3BNOTdQSGlsWjZNQmxXc2k0VEFO?=
 =?utf-8?B?K3pyYlFMR0NBcG1kUzNqZ0dubFFzVzM4TTdzUXpodW5hcmhPUTJ2WXFyTFVv?=
 =?utf-8?B?U0NJQkl2SU5yNnpuOXdRVGsyOW9iY0VhSnBzVkR1Um85MDMra0dMRklkM216?=
 =?utf-8?B?aTZCSTE2T0NZOWcxMDRkMFY0cE9BZXJvN09aanJPcHpHaWpHRHlOeDgvUjVJ?=
 =?utf-8?B?RFZlcWVDL0FtNkdYbFp5YWdFMkJiU0dIQVJmMjZxZnM3RnVkSXNLUmZNSjdp?=
 =?utf-8?B?UEttSEozbWFEWUtFdDlILzBDWkZ0WkcxeFI4bFo5aUJBbmtidWwvdzNvcEZN?=
 =?utf-8?B?NVp5ak52T0dYb3ptUEtVZEVVTk9FSmlwditubFRCd2s1U2N6SXJKWlJWTlNI?=
 =?utf-8?B?UFh1YlUzSEVMT3JNVnBBaTUrUjBiQ3VHUzA2d3QrOHZZMkFQdytJVk5RV0Uz?=
 =?utf-8?B?ZzJUekNNWVRiem5vUitpallCM3UvRXhScG0wYzRyMWdXS2pqeFJKcnFuSjEw?=
 =?utf-8?B?b21OejEwMTZYWTZPM2l6ZlczaG5KeEk5bFdaZjVPL2pFL2VpYit2RE9qTXRh?=
 =?utf-8?B?c1lzdXEyVmFyT1AyZHNsL2NNM0NEdEJVQURxaWV2NFIySVpyNXMzVGZNQWJx?=
 =?utf-8?B?VlljZVhqdWF6bENwU1pVVGpBUHR5NjZTd0ZYKzlHSjZEaFhSQkIyZThlMHNU?=
 =?utf-8?B?bXBIRzRnQjNiYkREZklMaDdoZjVPc2kvQkIvRHpwaUtkUVBJM2xSODFJUjlq?=
 =?utf-8?B?dllEcEhHdG4yUkZDYkFhUW0zMy93L1h3M09IdHJLdWRDVys3L1h0R2dtWXF5?=
 =?utf-8?B?anJsNmpqQmlldHhlOEVOd0xPYWNvaGpPR1Y4S2wrbmc3clFKZmh1cmlrN25S?=
 =?utf-8?B?MnN3K0I5Q21nbHBRa2V0ZHpNeC9IVTVQeHlFSmt3ODFsYVIyaGtGNGtXWWdX?=
 =?utf-8?B?S3cyMlRJSXk4c0JiV2Q4RDJwNDVHU2Roc2h4MHFjMlR2cmtWUHR0SGlZdU8r?=
 =?utf-8?B?eE5kaXNySG0vV2o3SjRoVHRxeUFhQXk1a1ZzZVhhSXFVRkdSZStMZit1MU81?=
 =?utf-8?B?K042TlhOaWwxMWl4dEVGc1lBYzBBUUkvdEJMZ2p5bnlNcnhEQjAyb05tKysv?=
 =?utf-8?B?OHhKaGs0T2UyWllmQm0yVUZSb0NOODFOYXV5aFIrQTQrNjlyWWVSc29ySjlq?=
 =?utf-8?B?Tmp3bzJIOHlxbGFYNTVjc1B6ZkZoQUh1cnB1UXBoTHVobldHaTBOWlpoM0hJ?=
 =?utf-8?B?UC9vUVZzZ3pLY0xIU2RDQ09rT2JZWUF6UjhkNXZWbE1qS244aE5iU005ZWxp?=
 =?utf-8?B?WTlnd0VpRFZHQmNKNHBMYlYvY1hQUnR0VUJyTWV0ZHdUNGlkZ3c4VFVqRWJa?=
 =?utf-8?B?QTNpbzV4bWxlZXQxcU1FSElmMTk0TVkrSWJBNk8zTGh3OEd0WWVDUzA0Qy9X?=
 =?utf-8?B?SWoyaG5KMEM3TzVZU3VLcnN4Zk5MQUVUNk5nNkhOZU1jL2NwSTd3dUk1U082?=
 =?utf-8?B?VW5BeTFZVjhzZjRqVlZIZjl6QWExYncxL2haZ3AzWis0U1ZyandESXZtaFVh?=
 =?utf-8?B?cmtieDlOc1RVOTVIN09ZSmhoQ1NQa0ZMV2c2OFh1bXo5SXQyS2NaVEhsV3N1?=
 =?utf-8?B?bEljbUlSNUJscUwxeDRBNGUvcW5UV2F1aGJzVVkzd3hrL2dpenBlbTVyeWkw?=
 =?utf-8?B?MmhIZ1hOREZlbEdJZjJ6bjlpRW5QdFhLYVNSVDJUT1RaTEZMbys2dUk2OVJI?=
 =?utf-8?B?VVplOU9VNXUzZndXYStXNThVbXhpeVFFbUh5eVhwMk1yTExza0FCS2JUL0xN?=
 =?utf-8?Q?E2HDGZ2LYw/aWm0JZFkCEY6NcFlAGY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?anFBdVdpd0g2RFFyL2RtVENUVmhxTXhsakd5ajIyYXhEbGdRNW9WeFlVb2ZL?=
 =?utf-8?B?QVcrOU5rMURPNC9YeGJiM3A2M0h2MUgxdDNhMjgzb05tdzBDdkxpaU9oM1c5?=
 =?utf-8?B?N2UwaFJ6L0tmS3FWR1YzZndGcjBGV0FUa1NEOCtlcHB3U05YOS9YSWdlNXps?=
 =?utf-8?B?bzFGWUoxSkoyd0tOMTc4WGJwcTRXMGlhNWh6QldzcXFKbGdGT0R2YWUwcDJ3?=
 =?utf-8?B?UWFKcVV2WklXRndjSHQ4WG1pbEdNZXZJUE40WXVEa2xXZnFETEN6SHA4NEZI?=
 =?utf-8?B?UkNmS1ZZb0xIc3RJRmZtRDJZU1QyNW5hWk9OVWlkYzRDTHBscHNUd1V6MHAy?=
 =?utf-8?B?UUhKNnRDR2xwVzJKcEF0OEs4OWhDR0ZZdkxYS2ZMME5WL2NuRGw5djRMd0tU?=
 =?utf-8?B?eFRwS3JYUXdDLzROTnBvYytEZXZPeStxNGhVV01kTHd3eFVybDh1SVdOamJh?=
 =?utf-8?B?QWoySUp0aHRLdkNYbkR4VXY5VjlCdkZqaFJRR2lwWDNMUWlVRTFtSHZBbDgw?=
 =?utf-8?B?R3ZFQk9oMFhRRDRyUm5MQTdZUmJjOUs5Wm5MMkV3ZSsyNjdlN3N2ME1iTCtK?=
 =?utf-8?B?ak15djNDeDhodkNGUHJvbXBQSG05NmtUbkQxS2JIQ2J6NS9xQ1pVKzRyTDJK?=
 =?utf-8?B?MWZOc3cyZHBjcDRHME0zVUhBNjJjdmtTK0dvaGh5a1R3T2U4bkZOQ2htS2hK?=
 =?utf-8?B?d2tYV1NxeCtxZUVLbWdzZlJxbzJUK2NMTE5haS80dVU3eTlodm9IcjZhTzdP?=
 =?utf-8?B?bkE0ZExBU2k5N01RWEtudHlZblEvd1ZKUjBvZFhWWnRYTFVCdEJRcjZIZXJ4?=
 =?utf-8?B?dGQwUFlGYmF5UFRndXR3MnFYZENsUUFqZVFST0FsLzlISHNEVVVtUkZKRzRI?=
 =?utf-8?B?dS9Fd1NDK2NlcXFFc3MxYkc3blk4VmZEbzBBazIwNGw5WSsrZnBVWTFTbDA1?=
 =?utf-8?B?UHltbnNVOWcvRlJNUlhETFdZeVIvVFp4S1NodCttUVY1eEJGbVYvWGwzSlhl?=
 =?utf-8?B?QldiSHJRZjR2bEpvMkV5L1I5SDRxUzlnN0ljRUc4c2xWc2k1b2oveWRGcnJU?=
 =?utf-8?B?ODBMQnBIenFHRXpJYzNqZEJydEdFcjJ3dkpzNnBwajRoY3JRMFJLYm5wTUFm?=
 =?utf-8?B?UStSRisrOEtMNXh4MFEvMnNySlpkTWxHUWNkUTE1ek1mYlpza0FtL2FGYTlK?=
 =?utf-8?B?S2RXUE83MnFIQkZ3VUx1SjJ3VmVCYzN1enB6UVpWS293U2U4eklDN2g0RlVL?=
 =?utf-8?B?LzZ6Q2xQRENycTFZV3F5am9hQkprcllkbWR1RkxjYlJqcC81MmNKL0kyQ282?=
 =?utf-8?B?TFpsOTMvMEZVVHIyN2E3ZERQU3JMRnp6UDdZaXpEcUpvMGdzM3daZGE4YTM4?=
 =?utf-8?B?SjJTeW9QdWZrL3V1V2lJbVliMzFBRCtUeXBsOVFjZ0JFMytjQlE3MmhuZnlq?=
 =?utf-8?B?NENHMVJKV1M5U21mRDIwdFdteGJTdU1jcU9OdkNKOFJidm4raWRWaTJLQ1Ri?=
 =?utf-8?B?eTdYLzNGcmtZcUo5K3FNb1JWbVVHTHJWK2NzY045M0JuQlcwVi9KeCtQRmJV?=
 =?utf-8?B?cFBaS2ttNUlxVTI0Wm8vRVJ2WmtXeEVwa1M1bTkvYXlMTnhHQkJNZi9WZFlC?=
 =?utf-8?B?SUVTQVhieE9idHJkSmljcmJjL2NIR2NMd2ErSlcrN29EZm4xU2dYUU5FSytv?=
 =?utf-8?B?YkF2RitDQmdhUUdZY3A4R1hJUUN4cnIrNXVzdm5sQk5TQy9tSG82K2E2cTRQ?=
 =?utf-8?B?Z0dVN1Y5SFhTNmhPRDZDbjdzbHdTNndKT1kvQnNxV0VsTFJxZGdJbFJCV0o1?=
 =?utf-8?B?aW9aazVXN21mT1JDWGRpV1hxRTVnRHhFREoxNW01RHFUbUVyWEwxTjRaSWN1?=
 =?utf-8?B?aU1Jc0ZRYjY0TTgwWEhkaThzbC9wMVlsT1laUEVrU0pGSTc0WHRrb2dIdjE1?=
 =?utf-8?B?VnAyR2RHU1oyTEF4SWNONFBwdUpsNktmMlNTUGNHWXJNQkIwT0JIOUp3d08v?=
 =?utf-8?B?V2pHUGtWcktsYTdQTjJLTC9XbG0xQ3JJRWRtdnR1T2xjWmRCVUlGUW1JWTdr?=
 =?utf-8?B?NVdFYWFUcjJ6ekdFWHBmVklIYUs2ZWlNb0pXdDc3eVlic3JaTTM4QmFmMDZr?=
 =?utf-8?Q?WbvO+i/9kK5ql6upJWL1P/wha?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a450c3-d84f-476d-1742-08ddec495357
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:56:23.5356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtXkvt71N7HRpmFhERx16vIliwIKo7P6PymFvclcXkumwOBSgV9xax6Cg4bh7h/z6Zn0HabO3UuMfuoWOJ3iqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

From: Alice Yuan <alice.yuan@nxp.com>

The ISI module on i.MX91 is reused from i.MX93 and implements one channel
and one camera input which only can be connected to parallel camera input.
So needn't to select camera source like i.MX93 in gasket ops.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..001a0d9b71e096db3f543adaad40b84af378d707 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -22,6 +22,7 @@ properties:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
       - fsl,imx8ulp-isi
+      - fsl,imx91-isi
       - fsl,imx93-isi
 
   reg:
@@ -66,7 +67,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - fsl,blk-ctrl
   - ports
 
 allOf:
@@ -77,6 +77,7 @@ allOf:
             enum:
               - fsl,imx8mn-isi
               - fsl,imx8ulp-isi
+              - fsl,imx91-isi
               - fsl,imx93-isi
     then:
       properties:
@@ -109,6 +110,16 @@ allOf:
             - port@0
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: fsl,imx91-isi
+    then:
+      required:
+        - fsl,blk-ctrl
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


