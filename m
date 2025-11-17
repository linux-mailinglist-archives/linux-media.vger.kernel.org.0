Return-Path: <linux-media+bounces-47225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42DC65DDA
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A7CB12ADFE
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 19:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B891345CC1;
	Mon, 17 Nov 2025 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gHNi7jAj"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C633F8DF;
	Mon, 17 Nov 2025 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405931; cv=fail; b=K9UvLzjhk/fHZ391lisoS2OPgBXypc9MRSjvr6d+gvx+sVTOtDw69zD/hQQTeO3WVNA2p2CSMR6i85aSi2ijK1hNTA8vzTs9VsETt088sS6nBpB9D5XF+iDOZw91XOYFlryJQabM4itFehsdDAPpZ+HsFMA5OWPvH8M9Bd18Hto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405931; c=relaxed/simple;
	bh=grCQyCvg3WJlOSaaJek/zESbxo+7gl8Hbsp0Ig31L08=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BTDkiL6PfUtgM5p+7J8EXKR3an3nSPSVkgivFkJNytypoSw5wwtG9m+hhIuoGaEdxOKvCeH53L0LlaOdQXPPZMnRTP7RSrX2HjehF+Ld6X1cd+E8k634DO0OMALkI/lm3z8/2I7e02MpvINscK1UTKggfuNxlJXSHpsTC6HPIxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gHNi7jAj; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyIBrWRKdol59Y/ONT6A4OmmQ5rOJXx2X7nbKnXqDX+DBUyNU84q4vH2ByaE6LEO7LrFjkjBg1pmEj2roZQrbFcPHekItd+zgmu/xKkZNxgPbRU6bapToY00sHmwMLFddPqNjt8HMt+yPjh1CapSJUhOGwvgBETdjI7PM/6fAseeoL+ql3dWcIXsMjJZYEWdN5uvDG3kvVUWJcPhODjiO3vWBe4vG1Lr7ZL2z1ZCXdKz5jy9O23IPeuWkPlyP7qdh3VQ91izpc/GxbwBG7/bcQX10JBCyCqn0QKAPeCZgxsWgPYfy1alJBPGAmHRpVaxMp7RszGGLuDNL6N3GbNuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uKo8yyQIFwaaspLreTnyvJGJ+r6TUa/sTX4zG4pUYs=;
 b=oOWA6WIfEJNLdthDVEG8y7va6COSo/MGXVksIqi3y4zfca83PaIKkxxEcOoStft6EmAv7JKjBrJrjiP0bWxYp7ke4JsqQ8Wd5Twompb2sATHNJCzjKsZF76hmBMjuAB1ZQanfzL9HjgvdPMTa4gGi56WOu8gnXDZNRYF+C9vaT8pDJVCQma6SpVYCrOpazRAC8vwdDrlZF3L0eGSgU4Rc91/pYJkhSZDNLImlFKNrbf5F5f5AJYzlGcR3tF86tMl59FuWugBxULeWYWfcOCotLPGNtIpKEfJsKu4FR9czfNmQUOaC9Dwvx2TWA0hfVBYeK89tJj9kqHP1TwmcGBcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uKo8yyQIFwaaspLreTnyvJGJ+r6TUa/sTX4zG4pUYs=;
 b=gHNi7jAjszYXbHWxw0B4NqrINAp6eYcuB/OrpbalpmhR6rn5jOCJa0Y5Hagjcy4wE/2tqhLYjBSQWUF0Ir+pcTUElXt2ed62LNCafOnqKE+5OwKOQsK9wsbZzqMFd71+wedUpc+QnDzFpy7bCTMax8jk7OuxGV+qNrj4DVdlIvTgT7rwYBUX3AG1cOlZvMDMdtmmLqT5YY1kIBy51TEnI0x9JLk6xgnFqLw0qwJdKHAt0JC8bARF9IhJ0YbwbZND+1yK4uqI7T3Q4GrRCBWeAD24/0TW5a/B3RYFwRDzeO3p67pv9DevZUf1/Bljbc0jsfn827vN3gO7PWUSb76+Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU4PR04MB11030.eurprd04.prod.outlook.com (2603:10a6:10:593::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 18:58:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:58:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 17 Nov 2025 13:58:13 -0500
Subject: [PATCH 3/4] media: nxp: imx8-isi: use devm_pm_runtime_enable() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cam_cleanup-v1-3-6cd42872db79@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763405910; l=1751;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=grCQyCvg3WJlOSaaJek/zESbxo+7gl8Hbsp0Ig31L08=;
 b=fgYIPxv2W9rI4C5s9cWkZMDePsQvNUf6LyzmzPTCKoXb18u2/t3QAK1Xo0tPlpzx5mG8NlMZn
 Pbco6vMHjunBzWVj37ibi9dkDulvbTmVjjpmGE+nVZTTTICbl2WX9EH
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
X-MS-Office365-Filtering-Correlation-Id: b55777dc-a967-4b54-4e28-08de260b5526
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QjQ5UlZLOS9sczJFNHhZTTdWZXJKaUM3L25yTFFTc2hRd1FPaE9NVFNiZEFO?=
 =?utf-8?B?eFNZRzNMbCt1TWs2UjEybnBXZ3U5aUZxeGRwKzByNlZGTUE1aC9EMGRGN2Zk?=
 =?utf-8?B?WmxpVks5UTYycEczMlJ1V3EyUTcyTlg0SlFJZnhJUFE4Y0p5ZjI1S1FYaW9D?=
 =?utf-8?B?SGRuNUI0Qmh2b3VZLzB3WlhZeG1TSEdZMWo2ck12OHF6eUxhcVZ2N2ttVml0?=
 =?utf-8?B?VENLSkI4VGdHLzQxazE4cVlBdUxZdGVMeDVIS2pVN2FWeEJiWGM1T2V3am1S?=
 =?utf-8?B?b29KZnlrQmlMak1JWGYwNkI3Ky9tUlBkQVhPVm1rNVdza0IzT053bmtJR2Nq?=
 =?utf-8?B?MU9IMW9hOTJua2Vkbm11aFZ6VGRydU9Tc2U0clRaRDd6ajJMQTJTMjl4OCtu?=
 =?utf-8?B?cERsVVdQM0tlcldUUEZqZW40dFlGMThtc1JHZDZFelVNbUVQMFliYklPTUpw?=
 =?utf-8?B?VTBzZjN4ME80a2s1VjlSRHBWcUFyb2VFaEJwdFBISVp4TnVVeVpQcnVjdDk5?=
 =?utf-8?B?OUR2S1JDRlhsNkNOV0diRFREMkNZNGdEUnU2LzMvVzNvS0dBUEZycUZaL1JC?=
 =?utf-8?B?REFCYUlYV3AwaGFJS0xEa1ZyTkhqSG5LcllidDgwbW1TYUhhQXdVTndZenBa?=
 =?utf-8?B?Wk53NTFiR29jTUdXU0RscTEvQ29xdlR0UklKT1g2bW5FVWgrRzFCSWpIOWIv?=
 =?utf-8?B?LzVsM0xNQjJhdW1iOHpGYU5NMkc4dXloeFBtc1M1aG9KU2tQbTFEd3kxSVN2?=
 =?utf-8?B?ak52TVVYb1hQdWp6ZVd2bklNTFRaSlo1SlV5cnd4dWdleUE2bnVJem1CNHVn?=
 =?utf-8?B?S3Z0OEJGS0lFUDZEL2tOSklXZWx6cEs2ajJWd014T0k3Q0czNzlubElpNnpn?=
 =?utf-8?B?YnlRaWFQS3k4K0VxMDdubnBnZzBlMEU3clliSy9JZFJ3UWFlZmdINkdZS3lQ?=
 =?utf-8?B?QnQ3V2dQd2RsUmROWW1UeGxEaDE2TXRpM1RrYzFOVEZ0RDZ0L0FsaDJPdWkx?=
 =?utf-8?B?UXpEV1dkbmVLcmQ2b1hYakxFbXVoTHRaWU9FaGJ6V0JBdERaYnVsR0ZWdU56?=
 =?utf-8?B?YkI4VXNpeVdWemJVRU1SeHRqU2VUMld3Tmw4ZEJleExnS0VYdklLOUZ1LzVo?=
 =?utf-8?B?bkpLNXpMdW5qYnBvbUI0ejhzdlIzaXRMUjJCVUg2WmRxcTFHUjhpZU5HZG1P?=
 =?utf-8?B?TXVmM2dRTEpqNHV4WVlZV3ZZaUJBNHB3MklEa1pOeGQ4c3V5NkVDTXhRY1dB?=
 =?utf-8?B?NlgxRXhySGRqWGwzSkxjQ0RSUUEyK1lqb055Tk4ydWxiRTRhRFhsWk0raGVR?=
 =?utf-8?B?eUhzbnBkelpidk5FMHJJd2g0U3BlNXEyOFJWTlgxME9WWGVYUDRCbzRSQXQ3?=
 =?utf-8?B?T3pVVWxJQlRyb0RRMTFHTy9ZOWl5M3FQMEgrb1VqbmprQndyOWtESWN4UzJZ?=
 =?utf-8?B?NXBKUjNpYjc2Vlp3ZjErZG44R2xjWkwzZzNDUkF6eHdiUmZVZ3dHZ3ZVWDZ6?=
 =?utf-8?B?RG5oWHhxdDl6S1FHRU1PQm9pODF1SHBLVW1BT2h2WDAvRlN6MmZYQlZIeGdp?=
 =?utf-8?B?OHhkYlNpUE1oVDlRWDVOR203UjUrRm5OQ21BVUdsSzRPY2l2MjhsR3J3RlFr?=
 =?utf-8?B?cW5lTmo5cS8wQTk5RVVuSGpEV2FNOTl2V05CSGE0M05iTEVXdlFBaEUzMlBp?=
 =?utf-8?B?cEtWdnMraThHeThMVjNzUXVzTTNqQkFuZ0JtUktxK3hSSnl5OUUwaEl4WU9F?=
 =?utf-8?B?cVplbGxlQ0NGalNad0tabE1wM0VPMTFPWkREVnRwMCtWNWFmSWp3VC84NWYv?=
 =?utf-8?B?eEFZYjhCRlFJMkZGNHcyOFdrbG96cDBkZjlEWmhLb3hQcWZXcXM2SGNMUGpL?=
 =?utf-8?B?Y2QzS2lhSlJaU1pWbmRVb2ZYa1E2dmhxN0tlRHpBamxWUEVUS200NnlmNU1z?=
 =?utf-8?B?ajJLd1FVaFhWQkNTUjRDT2tXSUZoZjNPcldieFdJN0hUNURjTytXUlVheDlK?=
 =?utf-8?B?bFBDblo1UHVZUWVNWjFYS0NDcFY3aXRTSUJ3WmhTeXBnaEs1YVBFdFBTVFl4?=
 =?utf-8?B?VkRpUi8wSjBTZmlIUlAvc2x6WHJkdnFMK0xndz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z3J1MDdLY0Rtc1dWVW5JMlU5MGNDZjZsVzNLUm10ZUxuOFhYRXRtU0l5ZmF6?=
 =?utf-8?B?Z0FhVHdqeXBOaEM3SXQwNzBPV3pIRENoNUErelBBV2p6eUgrMUxkdmszM2xF?=
 =?utf-8?B?eUZDc3A4RG9VbTFjVytxY0U1b2ZwMFNycVFOd2FJUHhDZnBRVVhBYzRDM0FB?=
 =?utf-8?B?eFBaSk5oeEpzZUtLeDJiSlhwdlUxKzNiNERGSStYL0MyQmQ1cDZZclFHekta?=
 =?utf-8?B?aUwxN1pPUVBMWkx1TFVJb1NyN21MTE11UzFaSzlhVHZlMVFqMmowWEsxRnNJ?=
 =?utf-8?B?dDhDU3Qxb1NmSkVLRXZTNk41RkpLaWFxM0c0RFFYR29zaUxDcXhoc3U2aXlq?=
 =?utf-8?B?VXBPN0NWdTlFZVQ2cTBYLzAxUXBMYTdOY2NYckpXVkZpYzAvb2FTL1NtYlU2?=
 =?utf-8?B?a1NRS2RldTBtQnNqMlVkU1h3Ty9WV3prb1B6bzdmbEF4RjZueVJtU21pd051?=
 =?utf-8?B?V2ZhRFArSnBDMHFreDduUnZGZy9uMS9qT1hGVit0Rmk3WGFacjJqZ0pqU1VG?=
 =?utf-8?B?enpwa3E2VDZ6QkdVUU1qcHgwUThvOFpOOTkwaFI2aVRIU3haZFZUQkIxMmZY?=
 =?utf-8?B?bTIvdHZPRk5PRjdhSWRFK0diS2pVcE5oVGlqbjVzb2tZbThiSzJueVVsQlAw?=
 =?utf-8?B?Rm1SQWh5cjVvRnlrYWwxNi9Zblh3cjBkWlRlOXVXbkVqT0NLZm1yblZaWmUv?=
 =?utf-8?B?WmU2dmZaVnJtVHpVVmJZNEZzeU5nMGQ3d1FaM29xZmpuNjJIWG92ZCt6S1dD?=
 =?utf-8?B?Z3lKQ09rcVFuTjhqblBuS0UzSzMxQmJTUmI3VTc2VDB5VVExSS9uZEo3QWE5?=
 =?utf-8?B?RG9nY0lUVHhvUll5blEyWWVUZnZ1eTc1ZzJKRC9XQm00Mm5ucFZLajJ6ckpH?=
 =?utf-8?B?eUxEdlh5WnhaVUl2a1dFZkpOVHA0YjBQWk4xeHdJdklHbWdVNmNaU0wzd0t3?=
 =?utf-8?B?RWlPYnJxNGFRSXVVNkpVckpSaWFncWphNVRzTHB0S1dvR25PQTB2RU1udDNV?=
 =?utf-8?B?K0pibWtsQjYxc1hVaGY5c3dydGpHRFZWL0tuWmJZMTRxeG9mN0lFdlhMR0ow?=
 =?utf-8?B?NVRoRHNLai9HK0EwUnhLL3crYU41ZlBDWCtCRXRraXVuay95OThTb29zMkFu?=
 =?utf-8?B?aEJIVXJYaTJYRTVpREdTRmFxVTBtQktVYjhGZG1IajJuRnJUak5mOWNrYVFx?=
 =?utf-8?B?a0RGV2gwaSs4azMvWWJ5RlR5WitwMmRvcTJPZk9DaGhYa2RtVVArNUpQTjdO?=
 =?utf-8?B?bVF1R2haUjlYSjVaS0xVSWZQTDlScmtPei9PT2FFM0daL1ovYnlVN2p1TmVE?=
 =?utf-8?B?amdEZ2RKeTBEU2thbjg0cEF2UDcrWWMxMzVuTkJOTGRic1ZRWXNzMDZYcENO?=
 =?utf-8?B?VlNISjlUREc4eDk1RFJGTXlpOGRpbVNDWlV0MXZiOUNiUUVMc2RsZ2tMZUdy?=
 =?utf-8?B?UE52Z0FMVWtLZTB2Q0RRVHVFekViY2IvSzVWRVRRL2FJSTArS01ZbDFKMWx5?=
 =?utf-8?B?RW1ZSjl6WFlNMmplb0ZiSzY5a1Jaai9wVGQ0VGJYTTdBOGs0YnhmclpGVmI2?=
 =?utf-8?B?RUdzV1RDUjg3M2JHVlRvZUVLa0E1SFNWcTNQUmM0OXI4c0pqZHpTRS9rSGI4?=
 =?utf-8?B?cHdPQlBFZytScThIcThSOFF5ME9BSEQ5YzFBbU1JOHhPQVRFZVJNS1owTU1G?=
 =?utf-8?B?TTc4VlBWMjdiREYwd3lELzN5TmFMc21jOHQwWjRzNFUzckNIbDJjZ1Ziakh3?=
 =?utf-8?B?bG1WeXc4U3pISkIvUzg3d20wSmhEdzFzV2JycVExM2VhcnhLeEIvakR5eTNa?=
 =?utf-8?B?UG1KVTZtUWRVYm5pZlBhakJ6RVVoZnBJOU5uNW9pZ1RBZldNblNUYUhMWnBy?=
 =?utf-8?B?RXZRczl2akMzQ0VxTThacHFBSFV6TkZZZkZkZVdQZWNJWjB2a1FUODVTL1Ir?=
 =?utf-8?B?VnM4YXhGTnl5NjBvQTJ2WFRDbFhhWitEMTVWaWNMb2ZWWlFqWXZhYmIyL0tM?=
 =?utf-8?B?MExiZCthcGlKbXk1QlF1RWJVTHBtQnQ3SWNnUE9WZmJtQ01MOEpveHF5bmtI?=
 =?utf-8?B?S1NxYVh5Zi9BVTR6cXF2OWgxREwzTFNaTWdxcElNZk5zQVRFeGlHOEJhZExr?=
 =?utf-8?Q?h80Rm+5Z8+4J/TtHrUryBMlEQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55777dc-a967-4b54-4e28-08de260b5526
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:58:45.0300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GruYzw9V4BdQ/eVCap2wng2x+1OHdebE7l3e4q4fu+RpbKWBBL8Mpm6aNPDUn+P/xOUO7aIq7BuZ7r6cWUsmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11030

Use devm_pm_runtime_enable() to simplify code. Change to use
dev_err_probe() because previous goto change to return.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c3d411ddf492eb27b372763ce5d344a90c6ec524..a884976ac8f8295120c404941f7ee19b90723924 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret) {
-		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
-		goto err_pm;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize crossbar: %d\n", ret);
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 
 err_xbar:
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
-err_pm:
-	pm_runtime_disable(isi->dev);
+
 	return ret;
 }
 
@@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
 
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
-
-	pm_runtime_disable(isi->dev);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {

-- 
2.34.1


