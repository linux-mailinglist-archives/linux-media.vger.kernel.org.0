Return-Path: <linux-media+bounces-42612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F0B59295
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2CAD189B051
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 09:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A702E041A;
	Tue, 16 Sep 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FJg0s4hZ"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FAC2C0272;
	Tue, 16 Sep 2025 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015847; cv=fail; b=pxuikTM3i9PjeZD3A6TtepeUFx8L58ks98a7QJhfJod1Z465XuOCmOuKf9VCTT1ik30Ritadz8Ud+NZpG4RhM+ElPP3oNI3EEkzzBAg/QfPDGcXKSh+dlwzgoAlXnJkA4MAVLLeClqcJ8Bh8MB+YZRxxMYGpIr47nF+sTgvs7Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015847; c=relaxed/simple;
	bh=VTmnZ7S8BWvdgTz7rxnnUHkxMToXR6AyS/9t2keLPlo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dw00bU72Gm83EeoGHRJufTvUwbh7UL17ceH28EGPT2I380avMm745hrUngTdyRjBbKllWu0ze9wyH+UjOh/kXYKGqDvy3dRTFa+x3LXKzD4sy2RzxazI0uCVJ1hj9aV+hWdaeKu6FJ05GUAp84TUtavlvBSrXeLTPRu5qtl05q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FJg0s4hZ; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaR9zbgWzHdSoUVaBMA+qEu06zdjrzRegeybgn3n5rJU5+H2J/CywNVhw/dD+f7fztEe8+niq/3K4XktjRJHWl80++DSYDIWp8ahwgHRkj5Zhm8BwyXeyekUYD5Hwdo0f3P8NAg5dYyE8V26ayKFBmekPQRrvwGtbRXh/o8tUeaXw/RJ1A2XtHaRlo4LxA5PMT7e4qTQ3E09ALoiPuP3rjBNoIq5amoLmu+wsqe/x6y6yvc16Cg1nHSL+MznGRIGUT3rNy5ryIzaZ56OutH7xnXzSUOO8jnQsX086K2ilZFt7NkHKz3ResmwSiIEMn2md0otNeFi7GAQo3I3+b0N8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t5eujBMtSEj+IYY/842KtEXElZmvRooYpYpE8W3VZs=;
 b=vp+W0lF6ibDGNX6oMYyQb5FLxa7100HhOsdBpSJtMYKhOXbfK0jlRBtDu1jT7efFLbFsvvfsEujGjplHFjn9IcQqZB/2+2McOQyPUSD1rzE8ljfydlrLqQuEP/wSZ20ZX6En36VV1TgSXRVHV6sZKQzqlGAZTeAP09tIMUC575iHlXk9+aCFLyMzB0IehCCHbNPnH+HHCiFZYcVkIU5e++j7VVdKIbAB3HnO888fC22hNVFq20ypz9J4x0lPlGF39Y26+qcPzpmGo3nSwrIuH8mcLXux12mUluSv2EQu2M8e4hQiMNEp+vFbz4b74ZzuKv+UrHdUjqAhKU7/WQaKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t5eujBMtSEj+IYY/842KtEXElZmvRooYpYpE8W3VZs=;
 b=FJg0s4hZsDO0xSSXmVeNjJ++kNePhyLzttuMHoAOMZSzMxCmTz1g5VRCMjhNYdOCEnQ53YhPDXTlrAKiNCSuAbeNqIDvglukUm/RP7+bpXpUw25le4I8QKxMw7LA83Lr9y9QFjd9N3XpgqrjevefXg5dbb7Vz7okg5aTMM1xaYNynHCwslkcxGF/qj8pnfFNLncMGb7XkLGWt5CwehwWKhDMuyUPJSdJlEGoSqQzNNsrSyckT6wKaitU/WxcrqzhEVko5kMH3lfB9Kxsuq2dTq0d7PwYKp2pw0y+PgJcb9PGyxrgGqQ/WkOCxMyH76+2huCR7aVBoczMNWJ+Y5j9/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB6833.eurprd04.prod.outlook.com (2603:10a6:208:17d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 09:44:02 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9115.015; Tue, 16 Sep 2025
 09:44:02 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 16 Sep 2025 17:43:45 +0800
Subject: [PATCH v3 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-ds90ub953-v3-3-bb7bc6545da7@nxp.com>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
In-Reply-To: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758015845; l=2586;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=VTmnZ7S8BWvdgTz7rxnnUHkxMToXR6AyS/9t2keLPlo=;
 b=AcLFrMaEx+68nGHG5+u6TKhzniI31LTzmp0ABXU7xzT5qc4nk6gdtX3QPvvrG1cpz0O1UbO1z
 9KMhhRFhNPuBjCn76KDOV570aD8J/sKe2eCvkOGkrfnuXCtHQP3Twxa
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM0PR04MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d60ecb9-9828-42c2-caca-08ddf5059165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTFwZm5GOVdNY1pTdmIvcTNJNmoyREoraVRlc0doQUxUVW50SC9IcXlVcmxn?=
 =?utf-8?B?aE5lcjNTcnljSGg2VWhuMzVsaVVGMnRxY3d2SEI0bnV1RkhReHhEY0Q5Uk5L?=
 =?utf-8?B?MlhUbWZPQURkejBHUGp5cDBxY0p6cEZiY0hxQkw0REFUUVB3cTkvQVc0N2gw?=
 =?utf-8?B?Z2VQNDl5ZnNxY2dKKzY3TUxnSHpXR0Yyd3I0ZjFxc1dUOEhlNjY1V09VNzhE?=
 =?utf-8?B?VkZrMzhWYndqcGhFL3E3RGtCR0FOT3lrd1BpY0ZkcERSbFlNNGFuZElRdWtj?=
 =?utf-8?B?Sllwc2hWZFJ1ZXFZTlJGeFJnZDZzNXgxQ1hublBXd1puZk1RcE1ZV2pjV3lt?=
 =?utf-8?B?NnlSYTEvL2trMDYySkkvVWRFM0FvUUhINlh0TG1IRSt2cEM2eGJvNkZuNjhE?=
 =?utf-8?B?bHBvWHE0dlI3cUMzanI5cWFYeW5yN3NRTXRHZ2ZSTEV0MUlrQ2t3RmVxTXc1?=
 =?utf-8?B?eUhvM0ZWSnJtK2tqSFZKY3ZsbnB1cENBbWlaYnRYcXpXeUZVSXZhUndLdit0?=
 =?utf-8?B?cGR1MnZ0WXNReUxKZUNLbVZVWmIwbE05Zlp3RWtlVEw3Vzdmdnh1aks1dk5t?=
 =?utf-8?B?TmEzeGJPZU01cndqSis3YmV6Y3ZUYjNaR25YdmpLS2VWTVB6QmpBREN1RlNE?=
 =?utf-8?B?YTcwVTdZbHNQTDNTSGwzeFFhbXFKRUd0M1h2dWVpV216WDc1ZFNKV1RMbGVV?=
 =?utf-8?B?OUdFai9YVDNpT2srakhFQ0RLRFEvMU1XZW9Uc2lEalVBd3NERG5aUHMrL2dH?=
 =?utf-8?B?WTk2azFRYTRHeHlRZnF1alFtR280UFVZWUZmTWs2WEd1cm0zTHQ4TjA4YzVo?=
 =?utf-8?B?NHNFNEtsRC9KdDhsbWdDWlQwNUwwc1M5c1QzbkVvTzZXcEhRalF5UmxiK0hL?=
 =?utf-8?B?bXJjTWlFMWFhM2NnTndQQXo1TEZnVTNtT09sVlptaENLQXI4UmFqQXhOUUhY?=
 =?utf-8?B?WFBwZEN6UC9sd1hxdmFTcEhyeXJmY3hLUTFZdmFLM0VqaEovOGdQZ2JOQVdn?=
 =?utf-8?B?Sm96MDZnbDNyMUczbXFDelYwbXJ5SXJETHhIQmpLWVdJSmhlNnFmMzY4ZXRm?=
 =?utf-8?B?Umh0YXl6SDd4YjcvUWI0Tk1EajVFeTBNb2g4L1pVZEJMMG5udTJqUWlrNHNU?=
 =?utf-8?B?ekR6OVFjVVB0ekdKQW5FWmczdklYbmFlT0ZsVE85Unc4TkRjdDlOdjlPMWpi?=
 =?utf-8?B?NHVkbzdXWEVSUEpxNlhEQXpzWkdrZk05K0txeVRrUFd6VWwyNjFEMERyNE9o?=
 =?utf-8?B?SDhRRzVjZVJ3Y0N2aHl3VVhXOFlDbXdPZWNtQ0taODArOE1KakNEbTVaL3ZF?=
 =?utf-8?B?Z0R2M0ZoV0dBNHQwWkw2RHJqYnlwRlB5Zlk2VWZHK3A1MmFmUjdLU3N4bEhq?=
 =?utf-8?B?anJZUmhmazRKMks1bWEweWFsQnlwMVZmRzZxV0owUnc5dFJSZUNrVW1zKzln?=
 =?utf-8?B?SDB4RC85dERGcDFwZ253SDZSRFlFdkp2bXJGaFZVZ0xOZXpqMWg4aW9kUWll?=
 =?utf-8?B?bGwyZHhZNU1LYmZOQWxEWDlrdjFEeDUvUjVvT1ZmRTl2Zk1tVHJpa1VaTkV1?=
 =?utf-8?B?NFIwUU1VZEhHZVQ5cWZqaGt5cWdpVU9UcjBWOWJ5MGtjVWV2TkZuYTRLbzNI?=
 =?utf-8?B?eHZsV3dFcHFnY0JLSGU2dStQY3Rmb1M4ZTJwYkFiNXVpRDM3RHZHclpzenp1?=
 =?utf-8?B?dzdTMmx1dE9aRkQyM3Joc2ZETTdOYkcrT1BmVC8zNm1YTzB1NDJoVWRvM1Zj?=
 =?utf-8?B?Y3czTm9aVmJLZGZHNkdJbEJ6MkV0blBHeHVvbEgvQkwwT1E0cFQ3UnNBSVV3?=
 =?utf-8?B?RmhCMkx6WGpsb3NtakZKQkpMT0hiTHlpakVoaWpuZUowRGl6QWVIcjlJTkJ3?=
 =?utf-8?B?b0M1R2hIR0l5L2kxdE1adXFBVFRHaTJ3SnI2RGVLcTlFNTNrYTdoendNOGFC?=
 =?utf-8?B?Q0dtdFUvdGVSOGRzRzFueGpmUjd4bGtaYlNGYXJHQXoyS1J4ZTd6TXFWTUVI?=
 =?utf-8?B?WU52bkZQcFpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnN1U2x1OHF0UkNIR1I5VlJUNlpCRTZ1bUIyR3F5VHM0NTRtQW9ieVNVSWxp?=
 =?utf-8?B?UnM4b1VOem05cERnQUx0OWxZYm9iSjNVY1I0L29mNDM2U0JiVmtWVFUrYklI?=
 =?utf-8?B?Z2xkRGxtQXduUitRTVR6Qm4xMC9wWXN1ZkNka2JOZ3lKUlpkRWZPdGpma21l?=
 =?utf-8?B?L054RmxaYm95bGhYVjdtc1Rta2hxdjVuUUNzSkNyUXNwdVRPbHhJN0xUU2tl?=
 =?utf-8?B?OEVRRFg1T2FYT1kwMXhBU0dCWXowWVp2V0FOdEF1TU5RWWlPUU1PTWM3WlNN?=
 =?utf-8?B?clpBRjFtVGYwV2hQSi9nbjNLakJoSVFjL3VLeDArQ0hQWEdWckJFbCtaNHkw?=
 =?utf-8?B?T3B3M1lmdWpPOVdsNHkwTmM3dzZXMnNYVkpDWFBTR0dvS2FyUkEzWVhWaUV2?=
 =?utf-8?B?cU5UT1RwaVduQ3NtUmJmTXpna1ZqZEhlbUt6VTZGZ0c2d1pINmZuR2xFOUZH?=
 =?utf-8?B?bWtkNGJ0aWp2d1Z0Um8wMDZQYzE4QkI3SzRmaCtTcy90Rk8zM0pwYlhTTGkr?=
 =?utf-8?B?QmtDMVkrMnJtNUZZRzhYM0JRM0ZyNlc3S1BhQmtGZWVKTE0ydTQ0d0EwUFdu?=
 =?utf-8?B?OTBoTzFqZWxOdHlNd0djbDVLMEFRQks5MkxjUVNkQTFnMVNCM2ZOR3BoMms3?=
 =?utf-8?B?UXl1bzRnd25Nc2F1bk1QbkJzeUhXNG5kc2ZEdXdaSnhLbEJnV3djQUIvS2Yv?=
 =?utf-8?B?ak8rODluR3JBejN3SzNZbXorbkFCaHBMd2hBSlBZdFZsMDdYMXl1bGl2a0U0?=
 =?utf-8?B?Ymh0ZWszcXZYeVRsK3dkN0RnTHFWUUMrZ1J2djUxMGZ5VThPNmVrWlI1QTA5?=
 =?utf-8?B?NTZmSTdnQTI4Ym1VSS85VDZXSUZTem5Wa2NzWDllWGhBQ2Z1c1lsK2tqeDVD?=
 =?utf-8?B?aUZQZXdGLzR6V0Nieklrc3l4QVFGMnhPRmh6cnRwaVdlL016dHhXMlM0WjM1?=
 =?utf-8?B?bW83SHJhOHQyZUp0NzZQN1RqWGdLcGFHZk5aZmRnOHkzQTFVNWJNS2svSFlp?=
 =?utf-8?B?QTlBM3N3eUVDV2NPZnh4empUUWtJRzBFd3FiZ1IyYWtyZUkzTUwzY0cxRk9O?=
 =?utf-8?B?WFB1ZjRwdHIxUWxlcksvKzFhN2tLSUhwakpqRjBDZE5oTXJjWXlVY290VDFv?=
 =?utf-8?B?Q2VEOElIbTJUcStQdzVhZGVEeitoZzFHWFgySTJCK0Zrb0tXdGxvTWJCZW9p?=
 =?utf-8?B?OG1QbmJwSnYvcUV4TTkvNHdhTjExVURRWXkzNlNsbHF6RUF4SHR1d0svMHE4?=
 =?utf-8?B?czZwQVlOOEVJdXZCN3FuL0ROTmJGWUtoc0lVS1oyTVVCcWYyQWtzVmxrb0NU?=
 =?utf-8?B?OUZjYzIvZGVDME05OHNpT0N1a1Y4MEdMMCtNUjA1Wlg2VEtTUVFHM0FlK3JJ?=
 =?utf-8?B?T21UTGxsUEdJMlhOZFVDM1N6ck1uRHV3VHRvOTh1Tjk1YmpPVmI3MVBaWmpZ?=
 =?utf-8?B?SGlZbUhSWmtySWQyRHdMemZFemNPLzJOSXgweHU3RzZLaUVvU05IOXBCZ3No?=
 =?utf-8?B?L1oxcnptdW1KV1prRCtYajYrRFUvQVgrZmtYeEw0RnpqOWRLSEV1eWtsNWFC?=
 =?utf-8?B?TTF1Ujc5T2xDNVh3TkdJWjdOZi8xeFFSMVhnM3FVaCt4KytjaHMxQnJabDc5?=
 =?utf-8?B?OEY5d0JyMW1ES1VjR01sZGs1QWZDelhib2pvOHYvUnp1UW1WaS9EcWwvemE0?=
 =?utf-8?B?STh5R1hKNlpnN2xDUEhKL1BOVEFrYVlzbzA2aC9BTlJMYVRUKzNXdWR0Qitw?=
 =?utf-8?B?dnFkUW1kKzY5N2I0ZEgya1o2VldvcXNiZ2VqcXoyNlh0M1JOQVppT0FCeEsr?=
 =?utf-8?B?OHlBa1dqTGk1Z0t3MEl1SGFBYmxMWjlJeklsRHRFOE1uRVdpRWYrZEhITEtn?=
 =?utf-8?B?VUs2cFhJWmFQS1I4STd6N3EyTEJVZ3AraEo3aWR5Wi8rTk9LbUdaRVM4NEg1?=
 =?utf-8?B?UGowTGdyUWJPQ05nNkllb3NVTFJjZHY4RURqVnd4QldNWi91ZWVqZ1ZqWit3?=
 =?utf-8?B?MlVRcWl6Z0JtdjI3MGllYmJHWVJ6TTl4azBCc0hmdXREOS9EMHJKVThiOTJv?=
 =?utf-8?B?Rkl6eWVuRnVhb0w2QjRmdHpac3lZT2l2cGxQNGZKS3hscFpUOGV2ZTdEV2Ez?=
 =?utf-8?Q?vWCCmEu3l5K7l5g7pr7mqiG1L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d60ecb9-9828-42c2-caca-08ddf5059165
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:44:02.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD6lVWuZFIEsPNF43XlNIRriqCA4vuno51I4Gfb5CT8GS8PvScwQ3cBwD6Raw7yNldVUYBDBK8Ha48R9CHjpdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6833

Use devm_mutex_init() to simplify the code. No functional change.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index c6b77e4982a3449896e564a288ff1562cb1dcb79..47e7c0a5aae7737182e6a1f2797be01e7ecc8142 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1342,7 +1342,9 @@ static int ub953_probe(struct i2c_client *client)
 	if (!priv->plat_data)
 		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
 
-	mutex_init(&priv->reg_lock);
+	ret = devm_mutex_init(dev, &priv->reg_lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * Initialize to invalid values so that the first reg writes will
@@ -1351,32 +1353,26 @@ static int ub953_probe(struct i2c_client *client)
 	priv->current_indirect_target = 0xff;
 
 	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		ret = PTR_ERR(priv->regmap);
-		dev_err_probe(dev, ret, "Failed to init regmap\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to init regmap\n");
 
 	priv->clkin = devm_clk_get_optional(dev, "clkin");
-	if (IS_ERR(priv->clkin)) {
-		ret = PTR_ERR(priv->clkin);
-		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "Failed to parse 'clkin'\n");
 
 	ret = ub953_parse_dt(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_hw_init(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
 
 	ret = ub953_register_clkout(priv);
 	if (ret) {
@@ -1400,8 +1396,6 @@ static int ub953_probe(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
-err_mutex_destroy:
-	mutex_destroy(&priv->reg_lock);
 
 	return ret;
 }
@@ -1416,7 +1410,6 @@ static void ub953_remove(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
-	mutex_destroy(&priv->reg_lock);
 }
 
 static const struct ub953_hw_data ds90ub953_hw = {

-- 
2.34.1


