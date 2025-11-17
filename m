Return-Path: <linux-media+bounces-47223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A7C65DC8
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6A1CD356282
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 19:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4199133F399;
	Mon, 17 Nov 2025 18:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DADBkL+w"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31433F365;
	Mon, 17 Nov 2025 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405925; cv=fail; b=PIoXKASs+ORJ72fbZAZB3Aw5UM0C3+ncsUMBS3exfuJkcdyzDelvCNq6nbHLV8gRgp0qA1pprLLuP7fLDQ/3wCZ0DRLB1AmhzTd16EgwHhoemOrS3YPHa9ch3UjYv3oLsZ6v6/chfTcElCkQlmCx58f/K08oGx1OKkVSjbeud9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405925; c=relaxed/simple;
	bh=ARPVaqVAWLk1VA6S3ScOC7ebUNYLCY1YIOO8jKmKuaQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZGEwdFf6xZje92MMTjDB3Hr5F24tu+ej1T/L7gVTtQME0lCEkihLly/FozfMwPQWvO+gSUXeR1cCXaK1+RXFwykQ6x9KhKdZcpxhDYNPKEIOwy8RI9DPjWWoPGw15nzLPs4c5CGQif2Lj1YhtCnjpAdHxRXTlJioyTZX6eVRh74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DADBkL+w; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWiMZzbWiRVnhl15GMyaiCmuhteMX3ny60WzZhDZuWhpWpdi5uy06uCXOGwM6fd4psc/jzReaZMbnD3pJz1DenEgEaNeMadjGyHvpaxvOao79zqZD2pfJ+qhhHpMOaoTx4L9/mu9E8aWKwS8U91Fjb5p9PI/nDzvGzvFOKSlO0DmEtXOmhZJ3pMtxLI+r08vl74Cwn5M8sD2Ev2AbQeN4M/YW1/8BnKAcY87+5ogI4Cr7hwXXPDAHQnziytVeqtxUfdGl/TIWHs20jmpjVpW2e0+iyM84ZV+BlGMFVWm8HLaZQP42jTcDLW4ZC3lYI8DpTMcQP7U/JfChVemo18V9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE3W5LA1JyM4wuWE9oEPumUOCTK4fL3rPZoBerNt4s8=;
 b=KqTpK0n7J2jlQd26cRDg1dUuAAWoYQ8bIzlhJETnsNFa7Vu6NRN29t/l8SPXGrqDEYg6ihJ/5UNHk4jg7lpzDO/grtijErh1Um5gAwN2ToBfJTqsYkNd3JiTB6FinGOy6lQKOmWXCKNzx2NpEw/T1gAGdU+oXbqE8Bwh7VMVXplDsQQKfeok1ME0LuVyzM7BLlo2gQiDi7trSzWwz3WG90LccRaZPtKMd61hWbrRFCLjCwTCLLkSFU62ndYAZoRdik05jygrNnpKdYZDN9nhOkiOteozd2FJ4dNbtxt/LvQN8Fh5a9KrwGZQ0ShINtu2StL3TkVcoDrCkiamP2tfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE3W5LA1JyM4wuWE9oEPumUOCTK4fL3rPZoBerNt4s8=;
 b=DADBkL+wxz604yl/KsoaeZTjNbPvaYQ6C1oVzStP3sM/21lQeMa83Wk0lTatSq6YD0aTsFZUu2rmIlK05j2tZ/IPWtVH5zomtyVZMN+Q3oMvYcc3BUb+dcJ3eYBVrnf9Tzl/RVuqaWylm1qwq1WwpE30/KKS5EChAI/neJa5SiYajBbReaj3n8mSDtfYDCmCa3tr3nA7XtEqW6jsoMRcmj9HfvScl2ivHwCKGswfcaocUbHUrJUwb/jXQYx2P+zxyqO5giSqDfZxymtJvFohdXaSYDHcTU/yoVL4UkgohlUG0UEnuEZCFvook58VzAxv0JFv9u14Etg0vnAsYejqqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB11030.eurprd04.prod.outlook.com (2603:10a6:10:593::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 18:58:38 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:58:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 17 Nov 2025 13:58:11 -0500
Subject: [PATCH 1/4] media: nxp: use devm_mutex_init() simple code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cam_cleanup-v1-1-6cd42872db79@nxp.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
In-Reply-To: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763405910; l=3593;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ARPVaqVAWLk1VA6S3ScOC7ebUNYLCY1YIOO8jKmKuaQ=;
 b=jvxoP+C/ukfiejtuwB20SW+/Pap/iMLcnypOXOCdMCkiU5zEx5TqZrKiadujr23K2wxLd5ZuW
 EGG4nzsJySyAp6hdtwl8OOufrNCJN9atEc4Y+EH0utAVH7CD7UfNhhr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:510:f::17) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU4PR04MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e3c3ce-a861-445e-4e0c-08de260b50ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QXdhczhoMjJ4dHNHNnVFK2t3Mi9zNFJXaExCOFdzaHY4QVNGb0JGbEladHdl?=
 =?utf-8?B?cVBLa052bGQ5d3dZL2w1d1g3N3daRjNuVm9Kb2Q5NzYzWXFScHVlVkhMNVVo?=
 =?utf-8?B?ZzhVdENGRUxIRnpqamNGMVErT1dvQUE4MXRMTFpEL0drVS9rRi8rS2tLZGFm?=
 =?utf-8?B?ZXg5N2FVRTliMlY0YVlTaExVUGZycUJncDczZlBjWTk1R25kZTBwK0ZoTmtK?=
 =?utf-8?B?YVY3cU9iTithR3VLSFFsSEtrNTIwR25PYVcyeFhBTVdBcDRvYll0Y041d1Fn?=
 =?utf-8?B?cmIweWJ5c2NVcG5JR1RGczNWR2o1SVBaTHUwYVhObXM2YU1WdUVhNllBUzlv?=
 =?utf-8?B?WWNFZXZGS2lleEpQdkVHS0I1Uml1cjdtdzRxOXVibXBpQkh3ZDBsa0lZK1pU?=
 =?utf-8?B?VU5zVWFwd3M4UHlwK05qak43a1A4RnhiclErWXhLNEtmdU5iMkVIOEFJd2U2?=
 =?utf-8?B?NnY0d004Q3dsUjhOT3ZUUktvd2o1Szc5Y2J4ZHZLc015eXlQbldNYWNYQ3Ja?=
 =?utf-8?B?dmZZbUhhRHBWa1UwVDJ2bGNlK2NqWmFxTEQ0WFF0Q3VhSkErcnBEZlpKK001?=
 =?utf-8?B?RU5acWxLRUdqN2Q3ZVRqdHNSZkx4VzhoOURGTjNzZEVRR2NQK0ZCc1FkRHV0?=
 =?utf-8?B?WWVJR1VqWUZ0WTJ3bGpqbndnMkI3ZDVnMFVkR2t5MXZEUlIzTUhTTmFYK2xi?=
 =?utf-8?B?MTREMjZwZEM1UDVHUnp1N2tEb1dJUlJkZ0NoNGE0ZlhhSU5KcUhHM3lCeXVv?=
 =?utf-8?B?a0dEb3Y2b1FISzZ3MVJWSmp0SXBVcHcvcHNFa2hiekJScktFWlpFUVRKOEdZ?=
 =?utf-8?B?SU44K2ZUMWNtT0xjR1o5cUlOTmUxZEN4aVViL1d4UFNEOUdrWDcreVJscDdX?=
 =?utf-8?B?aTZUODNuQU5wc3NCK09HcHlNazlHTS9zb1BzME15M25ETjdLZWpKb1NMNXVp?=
 =?utf-8?B?Mlhrc0FCQTEwRHZsT0dQOUVWWDgyb3BsNUFxSy9Zc29razRMVDJFc2cybDhG?=
 =?utf-8?B?NEJ4QndCS012RlRkaWEwTGpzYXorVHU3cTlZT3JmNURVVTBhN04xenRWS3Zz?=
 =?utf-8?B?MDhIN1czSmFsaitqdytsclUwUDl6M0loRTYwbVU3RE5KMmhRYzhYZUFRU0tR?=
 =?utf-8?B?dE1qZEo5d2RtV0lsdTA5ZnNKcW9RNUJ0Snk3NDBveGI4NytCNGZiQWJpTU1U?=
 =?utf-8?B?REJnZHVyYVZDUVNLcFZsTmt5ZFlSNDZnbWU1S2VXWjVDT2FiNVRSZWVXRVht?=
 =?utf-8?B?alZTSVRhdHNkYUlMYVNaOUZyR2drVUhsdTNRd1BOMjJOUmRVdTV1VG9rTGtp?=
 =?utf-8?B?RzFnWnFPWlErUVBOTkhWM3lnLzZrUmg3VkFobEZmVjNVNGRwWVVFMCtlOWZa?=
 =?utf-8?B?c0hNbWJLYW1weEpPZHU2KytVaG5UcVFuQm5Ib0R4Z0ltNVorY1pSTk5ZaFpP?=
 =?utf-8?B?WG1odEVSZjIvbEgrWnBsVTJGekZiK3o0cHYyNi9LbS9PRTRiZkFFZVZLM0Q0?=
 =?utf-8?B?bmlHVjN0V0tYTFAxT2tQbHNsY2F6WUkxOHpYUjlzRTNhbnVZc2twcjhvcWpF?=
 =?utf-8?B?eERNd2Z4cUR3a29jR0RrTGhBK0pLZU1xcEl3UDlIM1BRODVoRU1KaTQwK1ND?=
 =?utf-8?B?TzlJZ3crWWEyV0dreG1renFIa1pvdnRhYWRJYjNyRGxQSHZpOWNVd0pyTFkv?=
 =?utf-8?B?NHJXazNlczdycEIwb01ZVEovdFg1Z0lLK1BBVVlhVGY1VEp6eXd6dFE5NG9n?=
 =?utf-8?B?Zk9WUlhWTi8yMlQ4SitGSVRWYm9QNnpWNzZObURLU1dKNFFzS09wMVZMQWx1?=
 =?utf-8?B?Y25Fek93UG1uN2wzeXFzem9MMkdUVE8zT3A5dkhiYlZnVkxrRFZWQmNhdHB4?=
 =?utf-8?B?amhHVkxIaDZQNUd2NjFmQ2NRUnNHT3k0V09pbzdHZVZTZnZwblBKMng4Vzl4?=
 =?utf-8?B?ejVRYmZINzB1MWpkcFR0VkVTVmVmczhRbWdvNHNhTlB0MDBqM014VlNkb05F?=
 =?utf-8?B?M2RmRG9YZ2p4a3dIdzRrRkRTQkhHejRmU1pDdmFzV3kzb3R4VmdaczBOajdr?=
 =?utf-8?B?S1N5VGZCMVpxcVF1aGV6RzVaQThVTmZpT0V5dz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dE0wMGJoRlBWWjNPRFFkZFdsb1U5S3ZXL0tiZGhTMlRRODNNWDNOTW5YbDVs?=
 =?utf-8?B?RzZIY3pGM0g4aXppTXdEVDBDM204cHhFNG9TZlhHazZzTEdqUEgzUzRma25s?=
 =?utf-8?B?T0dwY1pEb2xmL2I2S2RnQ1VIRjNRL2VTK0Nod0dxNkhUNFlUWmFFQkFCUDhE?=
 =?utf-8?B?Uzd1TlAxZHhOYUczVUpBNk9KZzJUZkkxOXRHekVLNVNUQ2FSM0dhaUZtNnZx?=
 =?utf-8?B?TE44ejRCTm5TM21DSlAydVVXamM5RFRmVm0wNkpmZXZuVEFkeS9hYlVrUlBC?=
 =?utf-8?B?RmU5dDdFdTl3TDQ4YWlTdnpEOE80SnVsRzgyaFUyQk5UaDdyaTVCUEtvL0Ro?=
 =?utf-8?B?VGVLQlVNK1YwTVgzK3JUWmd6ZkVPZ1dmZWxZdWlqcTBhMm9TbFBVTnhhcmpE?=
 =?utf-8?B?VFJQd2F5c3l5eVBTVy92ZEt1WFE4VWhyb0VuTFd4OUZab3BMNGNSeUFXT3BJ?=
 =?utf-8?B?bmYrNWZpT1d2ZWtmdXd2dUhxZDNhMW02VzRYSUFHenhzRWJHRXNOSTNnbFVa?=
 =?utf-8?B?T3JMTzV3cjNnU1hLU1JHT2hMRlg3MXRJWmUzL0IvTUZ3YmIyYmNzS2pua01u?=
 =?utf-8?B?RG1mOVVNRUkzdW1ucCtXc3VFaVNIYXN1aWZITzl6dUU4VnJhL2lsQUFwamtp?=
 =?utf-8?B?UzRocm5HT09SanRnTTJ3U2NTNExhWW9xYVZSV1N5YUJZOWpSejJ1WTFJcG5l?=
 =?utf-8?B?ZU1mb1RxNmR3WEJESXpubkgxYkhzdTNZcUZBdFB1NmQ0ZkdyYTNqZnZncWhJ?=
 =?utf-8?B?RVBaY0E1YWNrREZVMWQ3SEFwcWZadVNLWUlYREhrVjgvcE5WME5aTWpKWHFs?=
 =?utf-8?B?M2ZPSk13WDRLRFJLaE95czl4Y1hCdVRQaUJLek5BdEFZWVNiZGhrb0pmTjgv?=
 =?utf-8?B?aDV0cCtseG5iY2xDbVVqaGl1ZnJVT1FmOGpvbTFKcDArK0cvK1ViVklNKzJs?=
 =?utf-8?B?YmVHTjgwNEN5WVgzNkl2SjVRRGVsRi9xVlp3Snh1UjlwcFBMck83MVlzVjN6?=
 =?utf-8?B?ZVZzSzdJalZCZXIwSGNxeVdZUFR4L1cyamM4MkhQMHVLUDBsYWsvRllienFy?=
 =?utf-8?B?MzlBNDcyN1BlbTFwM0FOV3F3enVCTVlaVGx4V0k4dEJPREl1TnkxT0ZZdTBn?=
 =?utf-8?B?eEhVUENEWnpwQWxOZ0p1RmNYMCs1NHZMYk5NelRjQjRTeWd4eC9CU29TcnMy?=
 =?utf-8?B?ZXJ3cmlIUlhWd3B1dGRzTnhDdVJvZWFCejdlQTNoMkVpbG9WaC9mTzFWaXRh?=
 =?utf-8?B?S1pNd05OVjF6TnZReXhWelpveEQvcXB1UER4OVBzbGs5MGlrSkNJNkEwR2J1?=
 =?utf-8?B?ZUI4RVNNVzFCa1l5TEEzVlgzbWxtVERienNDMzBhR2V6S0ltQUNkT09qbkkz?=
 =?utf-8?B?emwraVhaUEYvcXRNcFdNbTlPSVovWmprcHZHSE4vcTFZS2pvaTZ6eHVPSzhj?=
 =?utf-8?B?QUg5YkI2R1NiRTM2UTUvM2ZwZUF3UG1JYmxSeENFZ1k5Tk5CQm8veFpCdENG?=
 =?utf-8?B?TldmaGpVUkpKYzJXdUVBaDNTZXpla2FBbzRmT3Y4ZThEK2d5RGJQMTh1RFVU?=
 =?utf-8?B?c3JpSzFMTjVYN0pRdURXNEoxY256M1ZMai8vaHJLcFl5U3JqMW12cXgrck90?=
 =?utf-8?B?aVlqMWRzTlpOckxUbEhYQnBGV0RVSWlSWDYyT2ZxdmRzWDJPckpQOEh1Nklq?=
 =?utf-8?B?SjNpV2tyUzFPd3Q2eEdtR1lHbUNZKzVvVXpOOEJjSHp1c1BSUVo3dkVodGF4?=
 =?utf-8?B?bnV2SVMxSk8yS29Yd3g1bXNEMVB3SGxwWktNdkI5T1Z3NlJZK3FTdWUrbzFU?=
 =?utf-8?B?b0p0VDBkVGFWeWhwOVJTd2VZRmQxeGhDbVBJRC9vMEhZcUxHZWxRVXUzTVVl?=
 =?utf-8?B?bEJrR1Y0emJFdEx1NDNJVXY0cjltcDU1RkdMQ2V4bnNkZjhpekZWWnBxbUla?=
 =?utf-8?B?SDFBOFg4Ni9yV3VvNUNSRVBPMDQ3NWFHVXF0RkVGd0RCZEh3dGVNWEh2Mlpi?=
 =?utf-8?B?NTY2Mk9UOXZCamNodWtFT296YnpMdC91MVl3bXgrZlRSQ2tjaXF0UlZ2Rkkw?=
 =?utf-8?B?Nkc5V20wZFR3NXVWa2pKRkovbzJlM1QxNjQ0WEN0cytnVkVyWHJxTlJlYUdj?=
 =?utf-8?Q?DCLZzusMEbh51KIqajthEhc5W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e3c3ce-a861-445e-4e0c-08de260b50ff
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:58:38.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /W0J2ly+y3jThEPSd3NTaA7+HM9toV0UisSwujLOhbvTkQSMaWRAeHIs0KDXQ3HolvtRJGZS0U6oUS90KB+kVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11030

Use devm_mutex_init() simple code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-pxp.c          |  5 ++++-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 11 +++++------
 drivers/media/platform/nxp/mx2_emmaprp.c      |  7 +++----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 3f9a67a6bd4d268841f85f9b69af03138300d188..32d39c8013c7eef1f9629f971cc74afecd463ac7 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1805,6 +1805,10 @@ static int pxp_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dev->irqlock);
 
+	ret = devm_mutex_init(&pdev->dev, &dev->dev_mutex);
+	if (ret)
+		return ret;
+
 	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler, 0,
 			       dev_name(&pdev->dev), dev);
 	if (ret < 0) {
@@ -1831,7 +1835,6 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_clk;
 
 	atomic_set(&dev->num_inst, 0);
-	mutex_init(&dev->dev_mutex);
 
 	dev->vfd = pxp_videodev;
 	vfd = &dev->vfd;
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 371b4e81328c107269f89da23818ab0abd0179da..0851f4a9ae52d3096f454da643cfdc5017e000b1 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1033,15 +1033,17 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &state->sd);
 
-	mutex_init(&state->lock);
+	ret = devm_mutex_init(dev, &state->lock);
+	if (ret)
+		return ret;
 
 	ret = imx8mq_mipi_csi_subdev_init(state);
 	if (ret < 0)
-		goto mutex;
+		return ret;
 
 	ret = imx8mq_mipi_csi_init_icc(pdev);
 	if (ret)
-		goto mutex;
+		return ret;
 
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
@@ -1068,8 +1070,6 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&state->sd);
 icc:
 	imx8mq_mipi_csi_release_icc(pdev);
-mutex:
-	mutex_destroy(&state->lock);
 
 	return ret;
 }
@@ -1087,7 +1087,6 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 	media_entity_cleanup(&state->sd.entity);
 	v4l2_subdev_cleanup(&state->sd);
-	mutex_destroy(&state->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 	imx8mq_mipi_csi_release_icc(pdev);
 }
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 02d57229b9b3a600303cc0429e102139385071d6..384a2672884e96d17cca542ef51fbef62328b66a 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -824,7 +824,9 @@ static int emmaprp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	mutex_init(&pcdev->dev_mutex);
+	ret = devm_mutex_init(&pdev->dev, &pcdev->dev_mutex);
+	if (ret)
+		return ret;
 
 	vfd = video_device_alloc();
 	if (!vfd) {
@@ -878,8 +880,6 @@ static int emmaprp_probe(struct platform_device *pdev)
 unreg_dev:
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 
-	mutex_destroy(&pcdev->dev_mutex);
-
 	return ret;
 }
 
@@ -892,7 +892,6 @@ static void emmaprp_remove(struct platform_device *pdev)
 	video_unregister_device(pcdev->vfd);
 	v4l2_m2m_release(pcdev->m2m_dev);
 	v4l2_device_unregister(&pcdev->v4l2_dev);
-	mutex_destroy(&pcdev->dev_mutex);
 }
 
 static struct platform_driver emmaprp_pdrv = {

-- 
2.34.1


