Return-Path: <linux-media+bounces-36478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641BAF0636
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C0E01C02CA2
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC438302CD6;
	Tue,  1 Jul 2025 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ScRz1iT8"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45996302CC3;
	Tue,  1 Jul 2025 22:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407606; cv=fail; b=PxNfMGyLAlHFBFhRYUy4gFw8EV/K5UVYQOVjyXac6xvFBWyPDJEfUBhZ+Y3EyV4Gn16IAKdedq0oa4vXCJwTB75aKJBLtSD8HmpHxJ/UawGOBAM3EYVcUrDiQs9eui6i91OmkskuEJNfOPEirnu6cHVlH71BH2MaIKNN+qmMs+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407606; c=relaxed/simple;
	bh=wDe01qeuQ8D9N9G2qQMq1R3H77ZrtqG5Z6NVqfo/H3c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LATP+e4Ajmexc8OId1n5blsH57ONFdiRZVhllL2CbHFn467l957YdUaPcfVzV76TC0oG0lY9PEpdTh4zMNXUa3LPDZohsrum0uff8aPy/LdPtq+q7gbFnFw9tgxub3ojbSG6lMWaxxF9XZhMCK8dycsmNJQlFY1X5ueqK1DLlC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ScRz1iT8; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvScRxVIvzEKdz3pijxWdj0Zv1a9+9cZsSdvDYQWkXHgylBNdqfTusZWR3mPbiusHkvpoNiporb6Vn9uPalkJwBxCRmzoHAv56pyoy8pmyuFtbOTX+OVsASBk4JsWVY7OHqpfHb51yKM5lTqGOXvj5iS3GWCa1WYe6MNXKp5H1A4unecDq1KJRkNxgiDaYcir2ESjwyABO1T6+cSeQcxCd9yFc2Hc+Ii12w3RWu6+rPTCAzWS2EsGUvt84Kvfx2VfSZbCKHapTvRHkTWhHT7p4zlZ1h6u0ABXJuXyRq4WvwY/AnMp/Sb9d6jP2D9k14Ks7Fu6eYSqyClPxX5LfaT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnJVOU/FFcrm9cCMtXusmi04w0LborOgehzoITd+Ees=;
 b=EfdW/uFBwpwFbpZxN69D07S6U4iKtdZ7N1JxqDPyKhgCd3EK99HM8+FWxjM8/f9vNIUhDxmqhH6cjf8likcNG3Lu8lA367/M46B7R8yqu2SuoS1yKS+aHqpuX0JDUcaJWPNP1Jpncl1UNwb4jQo/nbjDs130qtEgI81vM4bkTjlbwYip0cpz+efTmHejsSxuGKXwUOCTI5G1F8LapI8rEFf+ngRgkoG7/fgzg/IQ0hYrvk5/U+nRv3JdC8puGLspeLpx2ImaD3Y5XvqLHIQFKVD3oexLlhVvJSgzgj0mt5YrlO6puA2uIbLPdnhK7E6CXJvaM3T2pfZJmUEre0mz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnJVOU/FFcrm9cCMtXusmi04w0LborOgehzoITd+Ees=;
 b=ScRz1iT8O48KBNq/LyhN9eEX00ub4iVvMg/96h29onMbJLBBdT/jbmG068fNBAhrZ1vNcNmF5ITB9A5knBfn7rRx7kVgv7dBMBYoRtwaTYc3jcuw6siD2oXfwDJ3qY9qPf/KtxzKxZdm/gi9N/at9wDGZnb3qW8yAfK2T29ZGOHmaTMwEGPztlspvl0L3YyjTyqUL7CpuP/8vsnsulEaRieDTSyKISPsM1Wzsl6juVGZ7j1G7k3yfo1eerBuHtkZx/9dyWkCGeBtyJfKhz6FuNot0VHBAWRtP7/MfUh0FMbuRWFYFQcNfPJ4lYynJiV0KQ88dKgUCXAgSNl1K20eKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 22:06:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 22:06:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 01 Jul 2025 18:06:07 -0400
Subject: [PATCH 2/7] dt-bindings: soc: imx-blk-ctrl: add MIPI CSI2 dphy
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-95_cam-v1-2-c5172bab387b@nxp.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
In-Reply-To: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407588; l=1620;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wDe01qeuQ8D9N9G2qQMq1R3H77ZrtqG5Z6NVqfo/H3c=;
 b=l4iRnkwE26E2YIEDX8J71ySHocqbTfjCAhI9BJWqViP8MgkH9G9lRMpShgkXh3HapJlicCZwd
 GatMavEa1+1Be7S5nQ6w09fVu08v8RGrRg9xqvv7+RiBjB1b1yb9GeD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: afa036d8-b480-45e5-c652-08ddb8eb8f1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cGw0ekVpUlMxYVFRSTBjNzVQV1FURnVYSjJMd2d4dHB3aE5YSklKUE94Kysv?=
 =?utf-8?B?eWRKVDNQMlptb1p6ZHRsN0xqN2dhZmw5SEt2emJsUGt1amRUaWlEeHhTbTNu?=
 =?utf-8?B?L25ldWpsOEJLS3RkOHZwa0dZdDBsYklIemF1Q1NDSTV4Q2t4cTdLc0xTR2Ur?=
 =?utf-8?B?VDJnSG5ISzQ4clJWaXlrc2R3RTBRaTVsc1UySE1PWkpRTmpQSEtjRUs2elFp?=
 =?utf-8?B?bm9KNm9aWG84SGI5d1JMOE9lKzdtNFNEa3ZxRzhRY0twbUJJbzBPOG13bmJD?=
 =?utf-8?B?NWJRL0tBSngxbm5LWnpuRkthVEVzdmpybStleld1dTk1WUkrZW1OM2U3bzJD?=
 =?utf-8?B?bHZ6RHZ5SjRoUTVGekpqbUszc3o5VjFGWGxlUXRGcVpmdW5iQ3VuazZJN0Ev?=
 =?utf-8?B?OWYrV29wcFBNNHd1Ymh6ZkE1WVlhS1pNWjlmejM2QWR2KzRuRHZIWmNxY2ZJ?=
 =?utf-8?B?QnJRTG93ejM2WlNJWkRiUmFsUThOWk5GdU9MVlNjdzRpbGs1Q2tFNDMvRVRn?=
 =?utf-8?B?L1NZSnNNMXhzcEdmcDBvVU94NCt3US95c0VRdCsvSjE0eUJaZmZlQ3V6OVpJ?=
 =?utf-8?B?a1hyT1RwMGw3b2hZUEJnTVYvNTUwTjZ5MHo5NEJScFZpbUk4UDliQ05QWHox?=
 =?utf-8?B?SEt3czl6enpYc0w5WkZNTnlZSi9PRzBIaithRE1MbllxQ2NVQ2hTcVVDKzVq?=
 =?utf-8?B?WWNqb2prZVEyc1h3UFFkNDFkMjIza2hISzRZYjUvYWdIK3J4S1kzZWtySmxh?=
 =?utf-8?B?YURQZnppdjVKcVNZbUt5YnZFSnJJU21sNm9MblFoT2JhRTJzU3A3aEdOeVoz?=
 =?utf-8?B?ZlFOYXJmUi9tVkJzYS82Mk4vQ1JURVRSc3pRTnJxMjhTS2U0UXdGdFRlRnV6?=
 =?utf-8?B?YXlna09SV1ZkYjA5aDVqZjJZaituQlhYWjFZOHJ3V2FVcUNYMlM0Y2Z6aERE?=
 =?utf-8?B?eDhmSzUwdmNER0ZzTW9zNk5YOFg4OGFCRmdvOVpWZ1lDYlo1WXJUNWJzbzZr?=
 =?utf-8?B?ZnNtZ0hiQTlzdUU2TXdSczhodytkeVFtOGZvMmxOcGwzcDZaWU92UGY3SlB5?=
 =?utf-8?B?OHluNmZPZmlhVTFYM25hNGJjU0ZqVUJETTZ5aWptbHl2VXFWa0xQNHM0K2hz?=
 =?utf-8?B?R3haSzhmM3k4Yzl3OTJZTGNYMEkxNEk1Vy82VDhGZnRPME5wRy9MUGxQMlJz?=
 =?utf-8?B?Umc3bXNrRFY0cVhRU0VrcW41N2JRK3JFNEJCS3lNOUlkTjBqdWZBdzl4bTEx?=
 =?utf-8?B?Y213a2w1NCtqVXBTcUhXVk5pNGk4Q0lRTXorbHJLblh0QVlieXNuc2xjWmg2?=
 =?utf-8?B?UVYwekRFLzBDSklTbWNFWmJxT3h5R3g4OWcyVVlUSXFKWWxjNUZ0SGN4TzNE?=
 =?utf-8?B?cm1nSXRobFkvZWtjQzhmZ2ZwV3BOam1sM1ZwZUF0elFacGFyajJTS0VwMHRX?=
 =?utf-8?B?Y1BwK25Tb1hpb2FVY3pVYzZMdVIzNVk4VWtnbjJIQWxUNVRpNkZCdW0rSlBS?=
 =?utf-8?B?ek5CVEJ4dnJ3VEtGOGprM1Rsd0dFT3owTnpHOWVjTlVua2gxdTFWL0l6TkpR?=
 =?utf-8?B?ZTgwTlBXVWMvTnl3aDlFbW44NUNydHZjQWFyYnk4U3pYNUhwOWN1Y2NXZDlY?=
 =?utf-8?B?TlAzV0FVZkg2MHpXSEhCNitlRFZkQjZxVWpnOFlZTlFwdmpTUUhxOWJjc0o0?=
 =?utf-8?B?UUdLc0Z5dk5QVVNDQnQ4NXNrdWxoQ0h3R3kxZFJLbkZiYVBYa2FKVUk0bWsw?=
 =?utf-8?B?K1EyMUgydmRDYUZ4bjRqZTFhYWp6akFJSiszREoxUHJIRjBsMHp2UHhBWkxm?=
 =?utf-8?B?SmRQMTVYWFYzSUxKZHFVMlNraC80QVRHR0VDWG5HUUM3SUUrc3UrRkplWFNq?=
 =?utf-8?B?N0hQbXVzbGRYRjQwZmczRDdWdnI5SWxLbmRMdktDRmJQMTJXZXJRdW9lSFBZ?=
 =?utf-8?B?MnZFRzFKVG9qUHZ2bWsrMThNNHZuOFd6bHBsTm1NK0lXVGU1TjBQZXNZWTB6?=
 =?utf-8?B?akxOOWkybGFzZDllMG9vTVdKbnU0OStnUVpLWUtmQnRmaDNyNkErS2VQMG9q?=
 =?utf-8?Q?kwNqTB?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UTdiWExJMWhVbnRtSVIwYU5NT3gwZ3M5WlAzbFNvN2pzNWVzSkt1dHNLVkVZ?=
 =?utf-8?B?WllUakFjQ0Zvdk53SzIwZ1F1WnIySm8wSkVBaWRhNGl0dXorWVFhU1Zmc1RC?=
 =?utf-8?B?dWJFbmd3cHhWcW5EZ3FBM1JvUnE4TkliYi8yUHQzWWt3Vkh6T3ZtSkFCQVBk?=
 =?utf-8?B?Mm9TN0FjLzJJK0JiUXE2clBxVWtzaGJWdUU2RGNCQnkwZjFtWHVIUy9YbE5N?=
 =?utf-8?B?RVppZTROc1ZVaTFwYlZNNjBSN245TWVocFBZKzY4dDJmMFYrNUlhNlNwMkty?=
 =?utf-8?B?czBUb01ncnJwQUVMOUxBMjNpTEhCK3FPYnJ5RkZJTVVLR2dWL2xlMEtYL1pQ?=
 =?utf-8?B?OXM5b1pyU2owd0doaVVjMElMdzZFVXA4a1lxbE1TTjh5YysvRHpJcXdKTnBz?=
 =?utf-8?B?VkNoWVI1VFlYbnZKNmdCVTVWaG4wMEVyZmZZek1CUHQ2cWJNdVdPR3hLbFdE?=
 =?utf-8?B?bmZ2ZzF4MFBuVW5ScU9RRkdJdjFCMjJ4N2RTRDF4bC9TVnBmZUkycHFYZUh1?=
 =?utf-8?B?OVJHRHJWYThsMTZreGVIYnY1OXBzTTJhVWU1aW5QUXJoOXdsQWhxajh3M21x?=
 =?utf-8?B?Q0dXMjV0Z2xBRTZiZ1QrcysxMkFUQnhreUNxbDJ2cmpsQWZJUlh3bzdYYmFx?=
 =?utf-8?B?WWVIdExGalRUTEZNWExUOFR6ZTNMNDhCczQrT3Y5STlidU45VnFIUVQvb3E0?=
 =?utf-8?B?YTVCSnRYSDl2NU0zbjBCS0puamNxbTlybDlnVlo4M3NRTXh5UlBPR21Hc1Zo?=
 =?utf-8?B?QjhVdHFZa01ra1ErK2FiQ1ZQTTFhSjZuWVIzVzBEZmdtSFk5eGF0VWUxU3A3?=
 =?utf-8?B?Z1FDUzNORFRXVU5rMjRxV2E5eW0vYW5EVkxqVUNlUG5SeFV5ZTFMZ2M1V0VQ?=
 =?utf-8?B?bGxTMGZmN3lwcDRaM1pTY1J5YWNydCtTdFlTY09IN281cVlsOFdsTjVMQnp4?=
 =?utf-8?B?ZTl3K0piSlFrRzEvbG9IMkgvY2hlU0lwVGRRWld6bXJlNU5ndklYZFBHUTJq?=
 =?utf-8?B?SkZZdDZtU2loYU9xY0tzdGxPQjhnVzNVZkx5aHpaNjIyQ08yeXNrcktiZ25P?=
 =?utf-8?B?clM5ZHpkS0RUUk1ZTG5zSzZwZ1NiK3oyTzF5OWJMNTBzbEpRWG9TTk9LRXI1?=
 =?utf-8?B?SUdBVXlYOVQzc2tBUUQwMnF1bmpZVFNoTmpYcUlIZEM2aytPM2pPWmFvN0k4?=
 =?utf-8?B?SWRoVkVYejN5eDlyOGF3QmhxcUluUU9PSWJNdUdPUm1MUmdsdnBZaHJxVVAv?=
 =?utf-8?B?ZEZ2QXBpYlBRUXFhaXUxM1U1REU3dFRFVTNhNEY4ajhxN2NITXVoUHJDb0Vu?=
 =?utf-8?B?cHZ3ekd3TWJxdVpCdWROd2VQTFBmeWFBUnMyTmh6WHk3a1U1UFVpS1R6QkdP?=
 =?utf-8?B?UzdEc1lsNERyZDlXY3EwZjVWVDhLcTRMU0szeGwyYmh2Nm9EalRpQ1l3WlVi?=
 =?utf-8?B?b1g4OWVuQzZOOW8xbFhVM2Jxb1lqbnBKdTExTWpMckFSNEFTeUJ4TFc4UzJM?=
 =?utf-8?B?NVI2Zm9TYXpXT2VUNVh5UHIrbk90YzJlalBjbEZYaEZPQU5ibUtNVFN3dnU5?=
 =?utf-8?B?cVpYVkl0M2NlckM1T3dyNDlMRWFkU1UrZVp1NHQ3OTVGZ1hhMm85dlVsYjdD?=
 =?utf-8?B?aFY2T0dhUDhOalpZb0F4eXROMkM3MngwcGtFVmJSKzd0WjRGa0hicERiNXVB?=
 =?utf-8?B?bjhBTWhzT1RESlErbU1STGVkaUV4MDVTSjl2a2Q3WjFJVGhYYlZ1Q3JEeVg3?=
 =?utf-8?B?WlF6bk92WXgwNmFveUk2RFNWUnR3dXZhb1JoeDRHOXBuNnFGMmVaZ1EvZ3F2?=
 =?utf-8?B?TDlPK285K2pFUWNKbE1ScmFkQ0hVSzB0WmVKUUxJUWl4RlQ3cmI0QnZhYUxS?=
 =?utf-8?B?MUdaTEtMRFVvVkFzcXh3dnFtYWJFRlNZbFcwMGdoenhRM1RSWmVyQm5hTmFB?=
 =?utf-8?B?VDFFVTdHMElRVC8yeFh1VVNRT3BURjRwWkNoWEw0Y0ZINFg4aS81anJlQ2Ir?=
 =?utf-8?B?TlhUMTBqWTVYSmVhRkhITGxGa0pqK1ZhRVdPMUpyaHNWRzBsVjJzTDh4MXM3?=
 =?utf-8?B?bmx4V3RlVWpiK0lBZ0U4RGlMMUlxTEJSOGlGOTA5MGVVOENka01KNEFrRGsx?=
 =?utf-8?Q?s3uDZnY9ecKcbq6US0a8LB8N6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa036d8-b480-45e5-c652-08ddb8eb8f1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:06:41.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5RHonBbrxyM6gx5pvLn6T0NjDzoYuWnbdtxIN7B1b5R0L7Mn1hxPx0B9NRSH+GJ7/U3OsiDboVZ2PUxbE40Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

Add child node dphy-rx, which export phys interface to MIPI CSI2
controller.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
imx media blk ctrl combined many small glue logic registers for display
, camera, power, clk and reset.

There are some discussion at
https://lore.kernel.org/all/4414669.ejJDZkT8p0@steina-w/
to define whole schema for this.

But there are some difficults to cover whole once.

Plan use two steps to complete it
- add all camera related property and subnode
- add all display related property and subnode
---
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76d..708cd00f2b896 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -46,6 +46,34 @@ properties:
       - const: csi
       - const: dsi
 
+  dphy-rx:
+    type: object
+    properties:
+      compatible:
+        enum:
+          - fsl,imx93-dphy-rx
+
+      clocks:
+        maxItems: 1
+
+      clock-names:
+        items:
+          - const: cfg
+
+      '#phy-cells':
+        const: 0
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - '#phy-cells'
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg

-- 
2.34.1


