Return-Path: <linux-media+bounces-39178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5625EB1F10A
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52FCB7B8387
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C5829CB4A;
	Fri,  8 Aug 2025 22:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OpKgaE99"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED129B22F;
	Fri,  8 Aug 2025 22:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692956; cv=fail; b=sW/YIVJoHmXIVKUlAwIQ/1qiBE9kWDzdSfQtL4qVnjAlWcAfVZBXLyvQk+zfP80L5hltQUwAie9NI6GIk83pBW9gipa2B4kQmA/lW+CSu5Mmfvn9JgE4e1B7KNNOxCtYomvvLZUt4BaYiH3RdgjvZ1b5x5PtU7Qdj3q0d9Bvzj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692956; c=relaxed/simple;
	bh=99pwjnV6SnWKo2MAVHJ9zIsnyzaUGjuWX4mqfw+Jie0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qycifX3PGujGGCoG2nYU197L5rFkwodtr9jYqx7jkSFkCoWJvOYe6LGwYJ1KeQmox4RSfdkVZaUHkRd/mjn+4gcaN6va8EeIotfKy6DbKOT+X26apyQAIZMLIuyVRIbHT8Uf5YxzoM/ZyloaEpZvWZaIHQaZGcniqUHQGAEfX/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OpKgaE99; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdR1XyjtJSLHKVSKyIgXwiMfzDso+jC+KcCEELPl/qOFKI4SnG3WEjs9vS4x1M+HIDzdBFQ+MjH+KtQNk4blnFsz/JMmJ4V0OuRw5zkNDjbcfBGJqFCH1Spfcu4gMxw20k5/5khGQDjH2Tq/qUj/mG3jPvFG3yZfPhLZ1nHMcf2ziGUJY3qYvttRAPFSmQcT4uga/MaixWGgSkhRmf5lVfDJ1ATd/kpBNxGatlcoq7Tpc7m1/tTkymMa9nUdmQJJ8IBzKl6x/3/otXLYGO2B1DCzeoic565WQoQQZBket6kN5ipgvJR51xMzFNY3hMcsPKI4+TRhcfZlr5rPi53o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLMxwvPnxQWtAkaZr4SvlhX1PL5rnGf+ssDsOjB0Ejw=;
 b=OW6jicVBOkvGvypa0Mt51h8A7EHkWaJiGz69Z7XcxC0Ol41kOz3cQ5pSRu+yNPuIsvsNOwN6zw+SubAnh3vALwUdriGyoecWLjOs2zFFyOTOBcoDmm6ZcNtg0h4S9qeJXAaAh7tzzV+JjxsRRoDa6P81La8t/RFHCLkJ0GkSMmhRIrTggE0ASE8t2QR7KOY3/Vy2yxXjIFByoXJIWwbBQCPkOfgSB/Oqd/tkW0M0JyWgJRrTaxwfn8rJc5MqxCZlc3///ydzwhGOu2PnEFwYfMqR4zvskWi6gOpbM+ZyTwZzr7Wt6LuUEX4MqGWOq0GjzkE44ggdUu0WjQjMTglxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLMxwvPnxQWtAkaZr4SvlhX1PL5rnGf+ssDsOjB0Ejw=;
 b=OpKgaE993YjdOEfl43wMP69gdI7BD2GDgsUCJbBSVI3JEUQ2l/3pjI/EnJabTD0UEY4f0tQahVruQdhzZpuAYwdabJrLqQyZtdYnPhHzIWlWTaViWyMXZc0ajbHGh+V2bIiLOSFfuffo/hLPjEH38EvWJfcLFLDbCkXgQXmkxcpDMaOgWhwF78SnCJlRuotBk3x05DGWVOah9G7nsOgije8PJ3QaRmfkBiyobeTR1Fug8dsSJTFkZ09jPzheMbxZ1SAAnILnB+XYN611Bd26GTXAOdKbx3GT6yYdfv/1VN8T2uRxV+SZ9Kv0P88yn5QEmXxtpaaHHDUi8G53SUfiaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:42:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:42:30 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:29 -0400
Subject: [PATCH v2 26/32] media: synopsys: csi2: Add default simple
 dw_csi2_subdev_init_state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-26-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=2835;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=99pwjnV6SnWKo2MAVHJ9zIsnyzaUGjuWX4mqfw+Jie0=;
 b=DDjaA0oYMPfmx79agwHFMRo3nOoXTVN8zqX1RXbo0ocwqEswVO6nDeG2BZVkPDhjfHI4hna8m
 U1/ISQnrMAVDP8pGWHQ89eNRemTczoyc+Devw4JHhCdslMK0nsnqmFh
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c82c0a-c774-482c-e2a0-08ddd6ccdbb4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TFpXTnBtRlArSWJzdndmd2RTVExPUEkrZG5Ca0dhVlJmYTlhN1dNaXd1QWhD?=
 =?utf-8?B?ME8rK050OFAzR1pnOFl1cGFqSnI2WG5PZ0hyNHcxTVl6TC9xUFQ1MmpPdkZR?=
 =?utf-8?B?ZzBkUUt2TWFvaE1tc00rV09TdlVxUzYwYnpkWVVWU01pVWQxSDBOSWd0UXcx?=
 =?utf-8?B?R0NnVHpEKzEyaExMNHcvOFJLWU0wcjFYZzhHT2dBMkdSTklYYU4yaW10T3h4?=
 =?utf-8?B?MnhnR1BWcUdJRTVTQmFnbUxQYk4yNDdMall0b1d4TEJOeUlVWjlGdTlTSGpX?=
 =?utf-8?B?MGs0Y0JWaisxa3c5WkZtZVNmOVNxVCtIYUd4Rk02OEdKaTNHL3U0V2FLd0x4?=
 =?utf-8?B?SEszdEx6UmpKZlIxWnUrTnUrMzRqV2lacGdCYm52MS9VZkVjSitvZE9Uai82?=
 =?utf-8?B?ZitDQTJvQmhYQk9xVStnZVcvck4wUGFGNzFZeWQyM3BoeTV4TDNIdkFQNXIy?=
 =?utf-8?B?V3ZBWmFheU96UFlZK3pMT29zUFMxNDJORFBmT0xFTUZLYUd1aDZvMWgrQitC?=
 =?utf-8?B?Vmd3eTRoWFpVVlBGUE5jMTBwZTZuYVc2N3RBRlA4bXpJWjk4K1hrNHBhc01r?=
 =?utf-8?B?WnpubXNCekx2V2JRekJtN055ckxCemE1OFNKR1dzRmYyRWkrdFJVQjVuODgx?=
 =?utf-8?B?QWgxL3FKQkhDNVZOdDBBMk1oWU5xZUIweUlnaGR3ZzMvb1pYV3hpZDdoVDl1?=
 =?utf-8?B?ZTFDYWhrOXBncDN4V2tMM3F0L1dza2tZOVROY1dkUWRQTHoxdTJTeXFOeU05?=
 =?utf-8?B?Tkd1NkZrYnZpQUJSeksyYUgzWWVTTi9ldFB4a3JXb05hcXVaQ3o3ZE5nUEJV?=
 =?utf-8?B?U0QvdDdpbURIS3dDMXUrbTNWNW5FNnNuQ1F3UXBleUgxTFgwQjljaDQvL3My?=
 =?utf-8?B?d0dJWDlXbklYdlhuV0FPalB5UGw0M0IzU1hhMVc0YkszUVpIQ3pkUERWS3Rv?=
 =?utf-8?B?d1cxaWt3RUZPeHBTWWQ5dTRGaFJkWmR2em9YeXM0V0ZJeElPcjJhTjhqUXcw?=
 =?utf-8?B?aHB2VjJaT1dEWjhDQ0gxc0FWVzBURWw1OXR6K2VuVENCYWorL3BNUGFFdGVS?=
 =?utf-8?B?czgxdkE4eDNrU283aEZkd0xhMitYYmxNOU5wekh4d3EydE9oRXZ5WW5Xckcz?=
 =?utf-8?B?cnRCdmtpV0QxYW5pRC9HN2xMb1h0TDkxNHV5UUxFN09kN1Nwci84VGxQV1NS?=
 =?utf-8?B?Tk1pbDRKdEhQdHROZEo1em1PRjgvZDM1Qm0yZjJjdXIzOVR0UEpWeHltVnFD?=
 =?utf-8?B?ZWVEMVQ5Yy8yWnZDVTh2RHN2eS9PZldURnVJVXBWZ0pNWEVscU9QL2dXeGNQ?=
 =?utf-8?B?Vy9qenZHTVk4R052dlgrck5reGRrZW9JNm1Uc081bDJGUUZWVE9SN0lmeWNl?=
 =?utf-8?B?MkJvZFZTZjhuSUQ5RXhmYWM1QUp0aENHd2ZSRVJjRzc0eGN1dEhSRm05OEV6?=
 =?utf-8?B?SVVoWCtla2ZNbXRTLzNtK1RPWjJlbGF4SVM2ZUdPa3pqSno3b1B2MU56d2xC?=
 =?utf-8?B?ZWpsb2NXYWo1Z3I4N3FROEZVb21vMEgzSXhGM3BXMUVybkw3SGtrcmYwU2NP?=
 =?utf-8?B?akJDY1AvaWFlWDRhYUhhQmlUSFVmTDQ4dGtLVjJrMk9rR3MzM01iVFhmZmd2?=
 =?utf-8?B?bVRjY0NOTnFrQ3BZU20rNEliWG41WXpFUU1xeURzeFYzOG10VXZjYlpxUWIx?=
 =?utf-8?B?NENBekp6SGRhWGdqRmNsbkluQUVZYUdvVjMya2Y2dVBIRnVpcm1KTUFCNzFr?=
 =?utf-8?B?eXpFRHVweUwxL1NtMllhdzlLWFQvQ25VQVc0dVBoU0p6NTBab2llYW1JZDUw?=
 =?utf-8?B?WjYxRzlqWmZqK3NmU0xBN0I0NVNON1lDbndMbXVTYitHL3pqYWpXR3dJTmFF?=
 =?utf-8?B?dHdCS25SWGMySVpIOFFxc2x4U3IxakVkQzhaQWlXMENjZ0pOSkNLK3Urckt6?=
 =?utf-8?B?Uk1SU09TOXdHU2dZSHh5NlVkT1I3Sy9BdkhEWHZYcnp2WlJodEowL2tCVXRM?=
 =?utf-8?Q?7f9SmDufsggJEMGIlYbmf9zJh8EFMM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TzI4MjNtWllqc2F2cDRTakU1TmFLc2htdFZtRitRVUcxMnZUbjZMalhkMm5O?=
 =?utf-8?B?cUFZOFZtYkoxVlgva0g4a2Y5STBuNldnQitGRkZ3VW8vYlRoWVFlVXVndEh2?=
 =?utf-8?B?T1FJcUI5WVpOUVovOGcrR1FMQ0loQUE1bkZseWhIS2pXbmp1Zk54c3Vadzdm?=
 =?utf-8?B?UGM4MmgrejJGU1FWRTRwcU5ZQ1JnMUJlVXoyQ3lpYUdlUjFnUktoZzgwSy9j?=
 =?utf-8?B?N0FOZnRxMDF1VGtweG51UkgxN2oyMEpMa3g2UURwSXdmeWdqdkp2czdZV0d3?=
 =?utf-8?B?RzlLelFrUlp6YUY3dlkxeDQ3QXlJYWNkcDJZcmp3WHh2cTh5aC9zeUpJdENp?=
 =?utf-8?B?d1RVL0QvV29xMUN2OHN6MEo2MDRWOUdXVVdvSHdadURDSTlqZzdzUWZyWmNx?=
 =?utf-8?B?MTZldG45NHhGVUI1UGpLSlZhVGc1TGUyRkZBUjcxcmorbEg4SUpwM3FlRFlK?=
 =?utf-8?B?Sk5pOU9xalFYWWd2MDJlSW5PdUppSXF1T3liUnVyUVZOcnhLeTgxbW02OUhZ?=
 =?utf-8?B?cGpDU2FaQ1hiOGZtbWFvdk5Zd0dQNGJRZHZYdENpZzhTeHJqQXhHMkY1ZFVV?=
 =?utf-8?B?VC96YjBMWTZwZ2N3RlE4OWMrOFNnVDNSekhiQ2FhT1dDOUx2T283eWNoaCto?=
 =?utf-8?B?RUlSWjA5WWZtNFozRlNISHBVMk5qNzZZSnFINkhIOVYyMXVEUnl3TjlYMWt2?=
 =?utf-8?B?RmM0ZTE1UVpEeGRJUGVTeTFtbk1HaDFLem50akY4OXN6OXh3MzhCU0FRbXAv?=
 =?utf-8?B?eVB3VlJPU2NscFhFdXRwSmtsV3ovZUhVa1J5T1dmQmRDelRURlRPaDNiRy96?=
 =?utf-8?B?U1AwdnM0YzV1WEtvRHFpNEZhSzE4ZzYwaWpTaU05MjQrUk9ybmpqSjArRUtB?=
 =?utf-8?B?OWplckdURzZmNHMrczlSR3JTTjcvQzdLb1BRc1dtY1BPZnNUMWpJeXpkNDRI?=
 =?utf-8?B?RjFxWWIxTEVla01sNThXa2ZjMmVOWDZSRWh0RW5HYVZKUVhndWR2WG9oSEwz?=
 =?utf-8?B?Q05icTl3dzZZaVBHVThIc1RqL2hzSVJ3aHREYkJUb3NIa1dCUlJWTklldko4?=
 =?utf-8?B?M09GOFJnY3JualdSTlRqRFRPdUZ1T05FM1BVeDJGU2NMUjkwZW5ac1pQNVdY?=
 =?utf-8?B?cTBxdVk0aG1NNWhoSm5nLy9kSjNmUjYrR0JaU0FPRnQ2elFVQW45bXVWeHAy?=
 =?utf-8?B?eFRmM2JnQU5XSlJ1cFpuME1Ob21wWnVScExzUGNIc0R5VDVGaFdZamJseGhL?=
 =?utf-8?B?RnY0cmNnTFNLSGdZWi96aTMwNWgvRk03SHVBV01DamRacHdBZUJCYWp4OWRM?=
 =?utf-8?B?RWNTRGpONDlQbGlnZ0Jsd2pyWTN0WmVLVGxFNnF3M2l4SmJid3AwU21ZSHdT?=
 =?utf-8?B?ZmVPWERZa3hBYmhZdloxN1laL1c1TDhEMXRjWFhhRzVOSXoxYXBRd0Z3MWh3?=
 =?utf-8?B?RkxSZWs5ZEdiNFhnSUlxOUZpZGtzUzlDT2thcy82V0hBemRXUU5iSENyQUd0?=
 =?utf-8?B?bDc1VWxZOUFYM280TDRtdWJ0dXBlS3lHT0tFRlZvUTdFNDNwaDFvRUNmcEkr?=
 =?utf-8?B?VzM1dGp5cEUrSFNWeUc1Y3pwNTVhbDRaWFRSK3ZxdzBoQ3ZaeTA1eEtkQ2Fu?=
 =?utf-8?B?QWlxZ1BxaTIzcGJEeklMdjR6NHBmTWIyZkN0VkxUOHEzRVl0RlhKN2pPd0Q5?=
 =?utf-8?B?bTU5Rm16Slh3cUZQaFdyZlh0d1dqVjJwSm5XSmxjRHUvWVorc1hveTYzSHUw?=
 =?utf-8?B?R2dEL3Z2NHJQWTh3QnFZUXd4ZFpIeFhOMjRmZFlveFNsQmFBVXliNTAxdWov?=
 =?utf-8?B?MVpsMXVOMFJaSjVmTjhZaXkwRHhCZmZsWGxMa1RFSWhtZFRZTktjNEtCdzBJ?=
 =?utf-8?B?K2JBQ2NRU05DaUR4UWIrdmxrK1pvbnkreEZZOWg1SlpJMjY2THNvYytnZC9W?=
 =?utf-8?B?VTFEYm5pYTRTUUt4dU9qQzhaZjlJcG4weVpOd09xMjBkUWdkMlpiOWo2WnVU?=
 =?utf-8?B?cE9Xb3IzYUF0SS9lS3QvVEhySDRZMEZKNDZaeXB2R2FROFpVaGpoUDFRK3c5?=
 =?utf-8?B?Y2w4cG13WXBtanNSV0ZQMitHMjR6Qjc1eWVrNUYwZ2FoU09Od3FZS3hLZisz?=
 =?utf-8?Q?/W8ijklIUfJF658AD2ncCFwqw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c82c0a-c774-482c-e2a0-08ddd6ccdbb4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:42:30.6195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L52z+Yqrv4v/vWUZYvBAMm+SVHHTSngTj9CnGsH+fDWgP/12Xth7M7drHqb9AjfpxSVFER7DoeqirupcdlCvHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346

Add default simple dw_csi2_subdev_init_state, which have 1 sink and 1
source pad, 1920x1080p and MEDIA_BUS_FMT_UYVY8_1X16 format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 57 ++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index d1f08c8384ad45d47ffe81b6dc5f225aed43e21a..7a3776df3e074aa823ae89c824bb942475c95045 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -831,6 +831,59 @@ static const struct v4l2_async_notifier_operations csi2_notify_ops = {
 	.unbind = csi2_notify_unbind,
 };
 
+static const struct v4l2_mbus_framefmt dwc_csi_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920,
+	.height = 1080,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static int dw_csi2_subdev_set_routing(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &dwc_csi_default_fmt);
+}
+
+static int dw_csi2_subdev_init_state_simple(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = 0,
+			.sink_stream = 0,
+			.source_pad = 1,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return dw_csi2_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static const struct v4l2_subdev_internal_ops dw_csi2_simple_internal_ops = {
+	.init_state = dw_csi2_subdev_init_state_simple,
+};
+
 static int csi2_async_register(struct dw_mipi_csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
@@ -954,7 +1007,9 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 
 	csi2->sd.owner = config->module;
 	strscpy(csi2->sd.name, config->name, sizeof(csi2->sd.name));
-	csi2->sd.internal_ops = config->internal_ops;
+	csi2->sd.internal_ops = config->internal_ops ?
+					config->internal_ops :
+					&dw_csi2_simple_internal_ops;
 	csi2->sd.grp_id = config->grp_id;
 	csi2->config = config;
 

-- 
2.34.1


