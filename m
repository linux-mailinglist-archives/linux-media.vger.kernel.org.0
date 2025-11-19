Return-Path: <linux-media+bounces-47419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A4C712AE
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 62C2130058
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A196C30AD19;
	Wed, 19 Nov 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iwriVULe"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD39303A19;
	Wed, 19 Nov 2025 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588091; cv=fail; b=aJ11g7Vl2/zYOmE7+G4KNy5SJoRpQQKLyXlaHSFVdixkDk5U/OAtiu28la/rgNsWbnBEk9mkGnu+OyJY0X1uVtB2tb0m5WkBL1ZJdTmg8NOvimE8U+1agN0h/2hegZg+UM41587xfv7sOgQDjri/0/jeGbezImyo7PrWazM/5Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588091; c=relaxed/simple;
	bh=8ZRGC0HOcXdF4yY0Klkdzev0fb+EGZKR4sxFFWOvq/Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QVDWsaJGGnP9FDzReagVe0Kzgn0fcaAXN91v5ID9dvqG6NDRAhQKzZ46JnjEx5W2CfGCDY5SpUmYx+l/T2OlWJkDjUy7GdjhhgNKheEPBd+nSWDnQBayumwBYz7rwG6pW0lGrfllmcXotU3rv0AOnaLaN0Taij+8lK6LCvCMZ3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iwriVULe; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUJYssZVsFDBgbfxXknAuAumMwOeSLvPUbUxlVN0fqrLPXgy2w3LTCauAi5WRi9L/oQWYpq2cCV1noLq26m681qXOD8YDXTzBlX7bc8bpyQNI0iLsgDxdSvPviVrwX+g4eSS34Pstqv4p16+2R/snki98aAawt8rcU3eHutvRRNxCAC0gAzTf0xsyHkN2M7Rh7IBGlQFDpkHk7oITwoyEjGN2n9FxvvmX9RpeNLMaDIAGFC5iEFG+LstzAGAzi7DNsvuHfy14KBygP0H4i+3mAJ2UEziPSXMTnnwCkqnQbHQdAw3sfyF88YBO62adRwKCMC8Sy0N5DFVjGQFpoAG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08qB5mwk/VJd8IPFbwD0PBx2hVv/tdtoaLkQk4flIrI=;
 b=JxEbvQ05RgGkO2gM6e2sTvgyAMnaKSQ7rEWCyuj4JFR9KHgxMy7PdgFIN6MttfwQg85BE9P+s4olZsi8/3qVT+5LLFKqvsNd8m+3V0Lbgpp61d3X82LmW1zpaPBGv0V/m+QVBuNGDF7NkExXAoRUaGVaax+mzw2lqHC+OygM20kGdig/wkkqjqVKV2Ocq06ybluKqmKb9CB3PpBAN/Td4bMpSU3+Uo8kU79TBX7sTP10MCTgX3HbWsoKKusQdNy2qI76YWLEYcD9celYCfZstiOapsyEy2ga5FZONUR8J4hasWHVgxnyB23eEfEvKQl2zpkaaBji2AJqQeT5eVd5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08qB5mwk/VJd8IPFbwD0PBx2hVv/tdtoaLkQk4flIrI=;
 b=iwriVULeU2YipyC4iGAvCGwcbqwBzO3jIJgKSH8rchoE9tX/ElBs84YvoNp3dt7dYg7esr/T/6gSdsrBZgpwzaT0nSZFikYk7YznF7A6AQ71X2Pw7ZIUXD5i4kUkYVN5L2ayryvpmpUmTytPZK+0dT9TNRhQp+ajLbnA6xvNUDJOXTheM9Zbyvfa5bk6UwYVSL7gKIA4hYqCKSvitAr9SBm5Z0wwvh/FCn6MX2vP19M3R6P/4XSss9jfUEaoj6OPf72NbWr4PYAhLAOG2rvCe2Hsk0XTVQlOT/gO5OJnVnwDsyhI/p6mBLxbDyvHucBqmhzddkLwqXDjED3zrym+6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:34:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:34:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 19 Nov 2025 16:34:25 -0500
Subject: [PATCH v2 2/5] media: nxp: use dev_err_probe() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cam_cleanup-v2-2-df732cc83ff1@nxp.com>
References: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
In-Reply-To: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763588074; l=5112;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=8ZRGC0HOcXdF4yY0Klkdzev0fb+EGZKR4sxFFWOvq/Y=;
 b=AMk4Sfq7iHsT3kuG7VtGfnIOsVwYlIzZRKT3VwYamsJS3760EN+AaZ7mV9PjPEK5juQSZSMcv
 86YTF0COBkKC9kgqORVH97f9VqXcYouv+MmpPm7Xnm0dGe6yYAt46FJ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI1PR04MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb7bba7-bdf8-432c-6239-08de27b37506
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cmJoeFNSZU5Qc1RURG1FNFlPL3lka25iWjd3aTZTZzBseW1zblVmQ082VWpB?=
 =?utf-8?B?ODIyeldEOHRUdTFSMEJvbkNmZW1CY2YwT1lVQXQrZEg1cXhNckhHeXdYWDRx?=
 =?utf-8?B?bUlrYVVFMGRoRklkcUxyK2tFTTFXMWcxbU9hZzJpVDBCVk1DZERmUWMwSEZh?=
 =?utf-8?B?L0FKTWhyNnU3ZEVqK21pNUptemdCUG9MdGt2d2Y0eWtSVkt0ZWpkN2ZoMHlO?=
 =?utf-8?B?ekZic0FvOC9ZV0NHdnNXQXJyTytINmoydjZDc254RHRSVWl6eXlVTHFzdHNh?=
 =?utf-8?B?dWRDbHA4eWxzNUtGa25SbzlneTJWNmt3OWh0N1N1U21oL0hTb2VxTCs5QjJa?=
 =?utf-8?B?UEJpWExYUHoyMlVlNHFGaHJSL1drWWYyRHlFOUJGSlBqZHhpN29QODlYMmdH?=
 =?utf-8?B?LzlKTERScjVuOCtvbHFRVHRRYmEyZ3B3ZGFidUUyVWtjdnJpNkhlaitNWWVC?=
 =?utf-8?B?UDRLVUlBVC95NlcxNjRVRWdLT0ozajd5emk0STNLNjd2OWV0QjVoaHlQZzRV?=
 =?utf-8?B?NXJ6TUQ0WEczZzIzK2I0U2hNbUpIbUNiOVBBU3lCYTZnVE9QS2NUZnNwZVdr?=
 =?utf-8?B?eUFXR3Z1WmMycFpYbUpQUVNCaW51Ri9ucXJueElldW91U2RPeitrTnFGUkFO?=
 =?utf-8?B?MzNVMHdhTUlrMCtDNFMrK2FDWHdtN3NmMTRadEJ4WGNwSll6NXdaQzJlbnRP?=
 =?utf-8?B?T0ttUkFLSDJ1NDAxMTVtVzMrSllGZVVpNHdDV0lnZ3NjMnpYR2xwQ1VMc29Z?=
 =?utf-8?B?L2VxSHRVQXoxaUQ1Y0ZKeXI5UktybGt1K0lnZDRmOFRQRjZSekcwdC9JcHF6?=
 =?utf-8?B?Zlh4Vm5vYjJ5OHg0Uk5oc1dSNmxLYkN3a2VsZkE5SnBNUFpWQjQ1ditLREdQ?=
 =?utf-8?B?L2ZIQTdIZ09qYU9SaEo1TEJqWkVib3NHdmI5SDk0STJuSndqWUFEVDArWklV?=
 =?utf-8?B?TXdLRnMzeXJGcUs5OE9WcElMWEVtVzhIVGZUbEcwdTZoWjlxVkdYcUJXdUdn?=
 =?utf-8?B?akNzUzhBU1JqNFRkZ09rUERLQ1FyTU1kQUhQZUp4N0NpdmJPNG1QdktQS1Jm?=
 =?utf-8?B?NEhKVEsyZzJOT3FJaTVGUGUrdmd3VGd3U1FCU2s3VnJaUFRyUkJVWnRoQ01D?=
 =?utf-8?B?cXJJR1VYek9lY29XeDRGY09aaHdocGRhOVF4UTlHTDYyOCtXUnZVbWN4eWk2?=
 =?utf-8?B?ckZZNm56amZTOUxjL2lnWnUwTzhsakNCbVN4OGdselQ3UU5vWWxmR2RxWXdH?=
 =?utf-8?B?RWVNTG1sQUxSSjJQZW9uMXVQaUJJNmpjcFFCVnRxS20wWkFDTE1uVGVURkxG?=
 =?utf-8?B?RnpxNnZRMVhscjVGTGdNTFRqTmluOFV4TEdCNEl5dmF3ZmZYbGF5T0JQRVhP?=
 =?utf-8?B?T3BSZHJ4dGJLaXZIQXFHMjJ0Um5zSis3SmpYK1RmSDd4OG52bS85ZWJPMzdC?=
 =?utf-8?B?c1hpeEs0SjFXQXIrT0NqZ2Z0N2VKMVlxSElRNStUcXY4UG9MZlRSNnhiZHFE?=
 =?utf-8?B?YU13NjR2MjhnWXh3aHNNT0VjWmMxQnV1TWlRSmtpWS9qQjRCU003QldWazZL?=
 =?utf-8?B?MHhSdXE0MUFQckJScHFtTjErYUFNRVNXdS81YmtKSGgvWTJrY3R3aGJXVDU3?=
 =?utf-8?B?MjR0ZG5lalEzSXNGeXBvMXQ3MUhUeDQ2bVJHamFoeG1HdU9oMEVidmdBL0N5?=
 =?utf-8?B?SHhQeEc0S1lrVWlOZ2hUQlBieC9zMzRmU0xXNUtIZ2VOR2t3S3JNbnp0Rjkz?=
 =?utf-8?B?dklmWmZOZTJHeGVpVGs5WllQbitRRHhUNnRweVAvZ1crQ1M0bmV0cjdBbU93?=
 =?utf-8?B?M3paL3RrYmxRR3R2TDhveHpNa0I1ZGhQT0NOdldWYjN5azJabmtBc2pxejRx?=
 =?utf-8?B?MlVTaXliUmM2OFcrN2VwS0FlWVNlandlRVV6bzlVYkpLYTYrZlBjTWV4elRS?=
 =?utf-8?B?eElibGZYa0NjNDQyTWVDZ1BLWnE2WDJoWmRVV1JsM2dERnEweURGanRUSk9X?=
 =?utf-8?B?b1VMYVVBVjZxdEE0emJTUTlwVTVpNVAvdUNaQ0VxSnBqQmRVT2NUcUpsamZj?=
 =?utf-8?B?Qk1SU3Jhdi9YVm9jY296QU8zOXNqbWxidWx2dz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cEtaZjdOL1o4U1g2V0c3b0lYNjBQSHhMc0FvblJyUTlPNEx5YlpESER0aTBt?=
 =?utf-8?B?a2g5NVN0MzY2WTJ1MmUveE1DOFBYck1Gam16dG81QmxiK3k5UkxiKzZzWlho?=
 =?utf-8?B?cGtqbThMekFYTGpYdlk2YWtxZWVjenlYTnljUW1BWWszSXl3LzB0NmswS0dw?=
 =?utf-8?B?NElSUXFZeUtXVG43MjRQNktQS3hWdlE4WWx6TUVTdXZjQ1dFamlOR0JSOWUr?=
 =?utf-8?B?b2xxQlYwbDd4bjlEcjlkL0FiNmpTWFpTbmw5RWIvSUg4ZGdwNU1mdm1VK2cz?=
 =?utf-8?B?V3hBaUkva1VrdXFvMERoNDRUeEpuc2dEcDByQ0xranlQQlpLeUpWUDhxOHZB?=
 =?utf-8?B?S3JqNmRnQW16UGNNd2lyZGRwWmVQaXBNUnpEd08rMTRZWUEvYmJ1Q1VPcU1O?=
 =?utf-8?B?azFnb0ZWdjNROWZSMi9ReXIwdmIyYWVVdDIrODBwcjBoMTB6d3JDSmpnL0dx?=
 =?utf-8?B?M082ZjljREx3dVljajhUUFEzR080amRxMHVMN2NFMUEvNGZHcVNaQVFMcy9J?=
 =?utf-8?B?OXJ6L0J2UW1PZ2l0RW04U0VtK1krSmM5RDFOaVFiQmVhdWFycWFiaG9EMTYw?=
 =?utf-8?B?RkVQSHZJdjVzc0VYaSttYmgvZkwxcU9ERk9GSWQvcDcxeHZvMTJDRkFaRmlY?=
 =?utf-8?B?TWdNUXdwZC9qaWJvRzd2UjY3Nkc2cUVDdUdBQmJ2WlplUGo5Y3RBYlBlS3BT?=
 =?utf-8?B?MFpLQ2ROSGhTVmxEU2djTkR6QyszZDdueCtKbExhU3YvSWcvRVpiN0NqaHhn?=
 =?utf-8?B?UnFoZ0ptdVZzMU1yZURzeklMSzlhVlV0UkdFZW1sY0FMeTMzbWFnVTJWVDFR?=
 =?utf-8?B?MEN6MkdycWwyeEtQZ0dTTUJjL0ZJSHRyRXNHbHhSSkgvVHdNTWE0bTRzbVZv?=
 =?utf-8?B?R1ZJTldNVzRTdzdyNDBVKzF0Zk5DVVNqZHFhb1NrYlY0cTBZbnJmZFU5cGZY?=
 =?utf-8?B?VHQrTTF3MzVMUUthL1djQW95eW16bHRNcWNXaEs0UGpqYVdvdnNzR2FCUXFn?=
 =?utf-8?B?Nk92RzczTUtUdDFYRVo3ZXFGcm5lNnh0eHl3QndnZU5hbGsxbXoyaEU3TW0w?=
 =?utf-8?B?cThFdE1qRE5NS0w3Q290S1o1QTNJWHRPMDh0bjg3OG9SQVlOci9OSFBOSzFo?=
 =?utf-8?B?b0N6QmVHS1NnNmdnZ0gxODRHOGlKV05iNWMrK3NzdExVZTh0cnFzV3pSNzMw?=
 =?utf-8?B?VzBNdXZNVCtaUzNjYkNvSktWK2FTcXdiRXcrbTBmdDdHUGYwSUR5a0VCOFMz?=
 =?utf-8?B?WVQ3Ri9LVU5WcW12WlVwMU9LWHlHZTJwU1pGdEZMNW9JUE02bU9jUW5hZFhy?=
 =?utf-8?B?c0JSVmZHSklyd044VlczTVkzVGFTbjE0Tml2dVJHS3c1azRVaHczdjdBOFZ3?=
 =?utf-8?B?bWw0ZWhFN01sVnh2cDJJNDBxOXVJK0ZwdGJ1aXZndS9kdGdTdWVLdHlIUVpi?=
 =?utf-8?B?d3ZKbmdmWGpNeWlvN1VVSnNxdDVBU3IyZmhlbkZ3YW1ZN0Y0VjRZTkdOc3pJ?=
 =?utf-8?B?Q1BHaElsMVpxQnhYQlNvTlFsbkFkUDNUWUx2WTJBcG1xZnVKbitXUDJZWkxR?=
 =?utf-8?B?SHJtQ2NMYllXNDhPUGttZWZXN3JLelczOGgyT1hyZDJJWlRFVi9SZmFGNlhJ?=
 =?utf-8?B?amhFREc0Qk0yOGtvY3BreDUxRGhOR2RQTC92bzdQV0w0NG1CQktHTmwzaGds?=
 =?utf-8?B?NXFoZWhqRk42U0pyeWw5dmF5Vzc1SmxNaFNoOFV1YW50MktyMGZKMGtBVWdN?=
 =?utf-8?B?aW13RG50SGFmbjh2WFVTb2FPd2FRV3JmK0wvUGpBOXNaWHZZeDhueFlFTysy?=
 =?utf-8?B?OGk1UkhaWHZxTDh4ZmkyM1E3d3gxN3VFSVBtU29rOElaVlNob09OK0p6dTVu?=
 =?utf-8?B?YS9mUGVBR3hMSmVnNFpUN2VhNDVORlNFWEtiRk90L0xNdFNNblBoZmdqK0do?=
 =?utf-8?B?YzkrRG5YTzhNZnpYTThDNGdrQXE0bjNPOG9Hdk1oRFFhMHRRcjVxWTlJTWFp?=
 =?utf-8?B?NlJqSUU4azFXUTlSNkxDSzNWbUowYlhlQ1pVVmVSdGxFNFBLKzRQTmlpYlFw?=
 =?utf-8?B?eFJvMkwxUmtGbWh2ZUtRbTZJYnI3MEp5bXNkZTZvSUo4eUlOT2RCR21OUVli?=
 =?utf-8?Q?st0XfgMNt1m8ntUGeLSUs55CJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb7bba7-bdf8-432c-6239-08de27b37506
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:34:45.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zavDwjMoPAKTMKhCGMw97HnE6C+KbAmkrLv9WHzE9CgAyoPBTQ0wUYagFv6NJv1FIjv4BrRTIg18e/A/5g8ArQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071

Use dev_err_probe() to simplify the code. Drop the explicit error message
after returning from imx8mq_mipi_csi_parse_dt(), as the error is already
reported by this helper.

No functional change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- add  Laurent Pinchart review tags
- wrap error message to new line
- remove error code print in dev_err_probe();
- drop error messaage at imx8mq_mipi_csi_parse_dt()
---
 drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
 drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++---------------
 3 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	/* Now that the hardware is initialized, request the interrupt. */
 	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
 			       dev_name(dev), csis);
-	if (ret) {
-		dev_err(dev, "Interrupt request failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Interrupt request failed\n");
 
 	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(csis);
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007013821f67d783898a15461f 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	/* Acquire resources and install interrupt handler. */
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(csi->mclk)) {
-		ret = PTR_ERR(csi->mclk);
-		dev_err(dev, "Failed to get mclk: %d", ret);
-		return ret;
-	}
+	if (IS_ERR(csi->mclk))
+		return dev_err_probe(dev, PTR_ERR(csi->mclk),
+				     "Failed to get mclk\n");
 
 	csi->irq = platform_get_irq(pdev, 0);
 	if (csi->irq < 0)
@@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
 			       (void *)csi);
-	if (ret < 0) {
-		dev_err(dev, "Request CSI IRQ failed.\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
 
 	/* Initialize all the media device infrastructure. */
 	ret = imx7_csi_media_init(csi);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a97910a6a0d53c9b6fcd73e9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 	int ret = 0;
 
 	state->rst = devm_reset_control_array_get_exclusive(dev);
-	if (IS_ERR(state->rst)) {
-		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
-		return PTR_ERR(state->rst);
-	}
+	if (IS_ERR(state->rst))
+		return dev_err_probe(dev, PTR_ERR(state->rst),
+				     "Failed to get reset\n");
 
 	if (state->pdata->use_reg_csr) {
 		const struct regmap_config regmap_config = {
@@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
-	if (ret) {
-		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "no %s property found\n",
+				    "fsl,mipi-phy-gpr");
 
 	ph = *out_val;
 
 	node = of_find_node_by_phandle(ph);
-	if (!node) {
-		dev_err(dev, "Error finding node by phandle\n");
-		return -ENODEV;
-	}
+	if (!node)
+		return dev_err_probe(dev, -ENODEV,
+				     "Error finding node by phandle\n");
+
 	state->phy_gpr = syscon_node_to_regmap(node);
 	of_node_put(node);
-	if (IS_ERR(state->phy_gpr)) {
-		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
-		return PTR_ERR(state->phy_gpr);
-	}
+	if (IS_ERR(state->phy_gpr))
+		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+				     "failed to get gpr regmap\n");
 
 	state->phy_gpr_reg = out_val[1];
 	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
@@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	state->pdata = of_device_get_match_data(dev);
 
 	ret = imx8mq_mipi_csi_parse_dt(state);
-	if (ret < 0) {
-		dev_err(dev, "Failed to parse device tree: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Acquire resources. */
 	state->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.34.1


