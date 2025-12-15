Return-Path: <linux-media+bounces-48830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE2CC0219
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 23:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6930C3016B84
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 22:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E01A32939C;
	Mon, 15 Dec 2025 22:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CdCIaoAF"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CFC328B43;
	Mon, 15 Dec 2025 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839030; cv=fail; b=QHK7NJG/GgNMO8U04PpfgAZAgnQImBwncY/A/o5+SPrWBylSe6aGpSQ6swGKAQWXraK0XcMfMYQmHjTB45zmXrUrT5h8QZak6ZEddUPTC8vqmDT75DwZivQXeRYQuNObLn+5CVaB2kLoUyHhWpNgQJMVnZd/yE3Ro/SpC79igzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839030; c=relaxed/simple;
	bh=Ak9aTBV1odt9+DYbyvjd8hjlmc6MWJpYvfaY1F9/1Ws=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VCJlWKEFQdsPWlI9Kq32qUTRzzixoMlnT/LpU4M1Sl3AivX0faC+3169vUdEoC4ZUGPrHjW6kHhKcxAWtuabmTTuT3k2I1K2tBAyIOQvMVLa691+5tTIzBtGacnwcJcRdd7gUmBw5/XqZ5ytYR5+KeNdcT6vM/Pi45oq6tOKByo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CdCIaoAF; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKYbwIti9vmWnGDGAq1A0X7jjDwgkYw5fEkAKBw1R1vtRIk0jTVDWQF9Y8JEaAwAAOxrCj/eQPQw6MMqJFaoHykFbiP3ThJI0gX5mXO3dQ2CraZWqChGhBTE4yZUKZkExgslBFToEB8BhSbfDvjUZ/yGsMUeO3S7ByCw9UBkJwwOclC4CH75zYF+x6jKWoMeImR8RuvwifkdK0RRbpwcG+kNTmQHdkqKnj8B6UahsoDn6EOuYumxBXPJZ1G41p63QZZkOda3zpuLSz19z1cuDzqGvBholsEOk2tQBR5mbYgTH1kCgucpCkvIIUVrNkyslOyMhm6oejTxYpiaBgw3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39a6rvM8PrBKT3cOM8LraxAEnxBtsALHjKOSvJwMzxE=;
 b=ScaoXkSCp0YXKMpiFoLDC2VdtBn3JEvIPl5e8PBAcBWYJlK7IRLRK9vacm64LTgu/5qjyle6BTB85LCZw5Z30GbnjC5qrAUnUjdIk/+CvlDadlimC1JSWA4MAltnNP+SIe1E6ldkCvnTUF7dJ3npuja1zZZq0gIwAoRlMlk9PzCC551ujNeDgEkuO8nN2TTrfXyZhAf154TNL1iaN03quHjUDbWyv0bMQBZ9oNtwky/3tqmtPuOkFIDhPFH16OPepgUI8FE61bZojwYPKbKaoFp3/YCVyKNtT5Ggqsq/Vf/xwNRmNJ2UtZlkBltZIlnX1qDEWEA2eW49wjIprEkZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39a6rvM8PrBKT3cOM8LraxAEnxBtsALHjKOSvJwMzxE=;
 b=CdCIaoAF/Apu2A3LTLB6uH9g13LZBpL0kbhDadQZhoEJ06tfh2EGFjEdx32a+Td7rsYaDAcqY5xFec6zgQ1iU7JfBLXVeakzv+FiwPF+7VU4LXLI6vzxYLxnzT9qsXFe+S9raAWPV9kiSEHlBDEDmtPDRX7kpqEd2OrzMqeROXwgfDJCZh8eOGxsHoOd4lks2Ukd2s119cSSPMIjStxamLaSdzRa8sHeyguraJVMzNhYOOisPl57kph7K48RsGt2ydl3tz/vVZJEaQzSp0TpcuYFR8df36E5mZDaY31p5xVI/MrgHsrajoaEL5ZYLXeoh6TCTq0SHjfVJgfQ/UdvKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 22:50:25 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 22:50:25 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 15 Dec 2025 17:49:55 -0500
Subject: [PATCH v3 4/5] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-cam_cleanup-v3-4-a61995068f38@nxp.com>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
In-Reply-To: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765839009; l=5228;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Ak9aTBV1odt9+DYbyvjd8hjlmc6MWJpYvfaY1F9/1Ws=;
 b=h8TqheMmTygmjYeRNKybrm+Q2xf2xYIvKkIE8KOjs0wX3vzC1vSiFHYOhqUEr5WDyJrBNHFvC
 henfV5X1APXAv18XiXuNNTUqB4WrscITDtlnkQN+v2WUSuO7FzVxKVv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e74eabb-0b82-4889-80fb-08de3c2c5603
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RkNqUjNNbGNVVWk2KzZ6bnBMakJNTzJ2QzQ3TkVveGp4bnl5aWgyRVZXVGJy?=
 =?utf-8?B?NjAxQkZCdW9ONHRjU3d1T2NQbmVGZ1haY0duVExRaU5UNUVjak9Nc1RTUG43?=
 =?utf-8?B?MDdJOG92cEp0NnpTcmR0QUJwQ2RUSlhqa2lNaVFKUVRvY3NXd0J3NTJhU0dv?=
 =?utf-8?B?cTZUbHJYRWNEeEJQSWdYQ3JFaDNWTnhXU1JaOXY3d2p0cWVhZDlYSEJKTEVk?=
 =?utf-8?B?UGtUNEpZOHNBQnVOVEJSSGl5S29EOWxocW8ydGpaSWY0cktUMitaM2JxQzlk?=
 =?utf-8?B?WThJL2IzQzVQMVU0R2c4M3JEb1VGcnhYTGlwckVBZVRmRStkcmllbnF4YU8z?=
 =?utf-8?B?YWJ1aDlCbDlONFNoQWlwanlkcmpJNUhzc0RVS1c4MHZZRzdHMWx0VTdudVhJ?=
 =?utf-8?B?WnBxdG9KSFkwYktQOEhSOW8zV1UxazBmeHVOc3NsRWhKcStHSWtwRlhqS1VX?=
 =?utf-8?B?YXg1a2krZnQvMFk0UkxvdmZrOVVqTFowSWZSYnpKanNBeSs0dnBFOHlUSFlh?=
 =?utf-8?B?ZFVFMmo1Wm81aHFsSkhVVG93TUVTUGpzY25sT0ZKMFMvWWx6aFppbWF0MFhZ?=
 =?utf-8?B?dEhMSSs3S1hDZFkydHU5SVdlaStzbyszazR2UGF6K2Zia3diVDVVcnNrNU40?=
 =?utf-8?B?QlNIR0tPTVNib0JQNTY0bXJPdjY2WDNldzVQNEk5RHd1ZWFWRGpiVk1RQkxY?=
 =?utf-8?B?dVV4S2I0Z2ZuWmpCSzBFb0YvTVFZalNRcXVhNkY4OVBrdlZtV2FIUlZtMzJw?=
 =?utf-8?B?N29VLzRydFExMnBoNUc3ME1oMmxYRTlZSG5WZGhkSy84cFFadnNKcHFta3Js?=
 =?utf-8?B?SzQzKzQ1dHpCZHVWeVAyY25TMkRVQ3g0cDlwendBSU5jQUxqdTBvUFJ4TjRP?=
 =?utf-8?B?YkhTZkxlejZOUmlLY0xPaFBkTFdKWTkwNXJya3dFaWVhbnVZYkVvcGptSjNX?=
 =?utf-8?B?Sk5DRmpDQy9HajZCOWY5T1BEYmVFNUZFUUI3L2RlQ0x0ckNWMTBjWlB5Z3Y0?=
 =?utf-8?B?aU1Pai8vbTJURUZ3d1VMWnRMOGRhYjZIMzM4Sm9QRUtXV0RKOTNTOTJKN3VJ?=
 =?utf-8?B?VTYxV3ErMS9XVlZPbk5FNXdkSE5oc1FMVFVVc2l1Y0JhQXErem1HVDY0NTAr?=
 =?utf-8?B?NXRvUlcvaWxTK0h2TDdaVzVSL0h3R3dxUDNpMHc2cUdUOWFSa3hCNnIvVDc2?=
 =?utf-8?B?M3pSeE8xSUg5VzdLRms3YnJYNHNScjBYUWw4K0RxQ2pyZENQZDlITzVVUFpN?=
 =?utf-8?B?OEg5NFhXQkpZYUtJUkhCcE5WdzZrMmNRbWpoU1NjSkVGVUtSR1J3VFRPbjNI?=
 =?utf-8?B?SmMrMFRQeEFaM2JrZXExTUx3UFlBZ3Bqdjg0VHJsREtLOTcwRjE5TUZaMzJV?=
 =?utf-8?B?bEtBK2dTMVRBZWowT0VVd01HYXY2NExXYVRIQ3dHSm9OWUZYbERvdEhqSTZN?=
 =?utf-8?B?Mlp0OWJuQXZlalJVZ0FDanFVcnRIVUxleWV3Yi9wWmNDaEFKcUgvNGhYbDVj?=
 =?utf-8?B?UmJidnFVVEFERlZqODNxZFNySjdvQk1FcTRBUXFGVG9uNU5MMGZqeUl3eW1s?=
 =?utf-8?B?MkhGUnhBLzJ4THYvaG9yZVRydEttZUdHcStIMnkzdHRPdkVXTmhNZGFSSnZw?=
 =?utf-8?B?OFh0Y3BxbDQ2OXRRdHR4SWlpTTV0bHpWek9ZdytONmtRTG1MZHc0dDEzRExL?=
 =?utf-8?B?TDFUN1kvNXRFbXlmN3pOcEZBTGhiWjR5dE1sNmZoaUEwdk13QSsyemFXMSt2?=
 =?utf-8?B?aS84bm5PczYvcnA5bFpiRitqY29jc1BvaHFwQTBKNThqdDlLcVJZS0diL2Qv?=
 =?utf-8?B?b0VzWkJJdVhJbnNTMWZ6QU5jRGw4VndlcmxoOGlwN2tYaUtLcmx0NThlVlFN?=
 =?utf-8?B?eWRyK1JESUhJQXAydkg2elk5am9HWkxWdS83Q0hhMmJEQzMybDliSlMxTC90?=
 =?utf-8?B?dm1MTkI2R2tnNUt1WUNXcnpnQTg3d2VWQ1pTa2h3Zmlob3htSWZBZldJWFpQ?=
 =?utf-8?Q?BPFIAlM++vNRZdWRNUsrGuC6thzg0M=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z3c4bEVrZVhjdTlGNkRhZ05lM2lpa2d1RUNuaHN0U05ma09YVTZuYmEzZWhX?=
 =?utf-8?B?NDAyRkVGOTFXd2NoZFA3VDM0R0hGS21nbkMxeEdxeDRrR1RXUEd2SFppb1dk?=
 =?utf-8?B?OXMwbzJoNFVnclhWdVA2dDdRS2tBSEZvRmsyTkhPNHFJcStmUndJaWE1ZFc4?=
 =?utf-8?B?NzRYL3poWkJpeTRMWitwK0VpSm5NQy9VeHpFQnBpamo0L1NVOXJOcm9tQUx2?=
 =?utf-8?B?R2JaRlBqbE81c1RwbE1td3ovRExpMm41TkZ5Wm9yNzdkZmJvRWdzWi9NTVQ3?=
 =?utf-8?B?bEgrY0pYZWVUTWd2QWI5S0p3aG1COE9FcXBOY05HNFJodzBpM0pTeVdKai8w?=
 =?utf-8?B?VXJSak52dXBzOHhxcElKMzQrSGtPVFE5ckp5SVUxOWRZaGJiVCt0L1owcHBM?=
 =?utf-8?B?ZnFCNkdTRXdNa3IrSUhpd2YrWlFmQVRuaitsL3E4TTdMMUpnTVhKTWFlMUd3?=
 =?utf-8?B?aDVHQ0VrdnNFZmxSdzA0M1Y0QTZBMFBmSC9Scm1JelVUeXEzaXJVNFp1Mmtm?=
 =?utf-8?B?TDdWWG95RWZFb0FJR2Rqa2lQbTdTcW16R0lNb0txdXdOcHJGcExUcFBURVIw?=
 =?utf-8?B?QjdMN016NXRYZ0ZaOHJRYTQrSmhVSDM1cnRaMmdIa2ZHZHVSdHhOVnUrUTFR?=
 =?utf-8?B?cmYrSjArb0Q5eXd6d2ZSZHVFWXFvQVQ3dWRwMjdtN3FPVTJ1Q0Z3RE1HWUNO?=
 =?utf-8?B?cWhva0lKd1hQMUhSajRvd2JsSlR3TUcwZDVUdWpNQjBwSnl5MXZ2R1Y0eDZX?=
 =?utf-8?B?Y1IvTUNFUS8reUl1cHcwS2lMQ2xtK0I3Ti9pcnBtT3BQbXZxTmttU2huNzJw?=
 =?utf-8?B?clY5M1ZKZXFYVFhQcG8xM2VJUVlvblBCcFhNNkkxeGZJaVBaTXlZbnZEZ1Jv?=
 =?utf-8?B?UHJ2QWdPZk9ITEVDcysxdTZ0OFJNVTFrVTdMWVduZUF2S3ltM2Q0UXNpcEN1?=
 =?utf-8?B?akVnUklYSSs0STA3bmlKR3lMOUIwTDFyMkdJTDUwQzhLYm15VW9PMC9PeXl0?=
 =?utf-8?B?YkNCTkxNRlVISVVIWkV2eUJ3dEJ3bU5oVGNPdlE5SDQ0dTVvRVFKUUJRbTdI?=
 =?utf-8?B?dXg2YWQ3QURCSktLeDBRRS9tdm5tVTg4OTZBZUVuUEZqTTEyVTZMTHFZM2Uw?=
 =?utf-8?B?RFFZRzRkT1NoTUlBcFhjcHZOVU52NnU2ekRwVWx4M0hiMUxPVHh2dnJYWHIz?=
 =?utf-8?B?Y2tIWXFoWUp4eDNyUzlYSmc2bmxMNVZzcUllWU1YTWM2SWpNcmt1Znh0VGtz?=
 =?utf-8?B?dm9HYzdCYTBiTjZBWXBvajY1ekRVTnlCSXpmWVZxZXpGR0QycmgvR1Q5ZGRR?=
 =?utf-8?B?QjkzOTdKc3ZqMUcxUW5IUzl2cGRabEtrYzFxV3ZNYXh0VmROK09TS01iaWhK?=
 =?utf-8?B?L1BEYkJvNWRKU253TWJIMDloaTVXTWt5bHVzT2owU0gzSGxvSTR5RGZ1U3hx?=
 =?utf-8?B?RGtBeURVMWhQTGo2TE5kVGEwZUxaMzBlWXVWS1BNR2toRGg3Ym43MjN2cnJW?=
 =?utf-8?B?cXZRakRjTWt4dmZZdHFITzBOTU96Q0J4ZHdWV290ZnE5cXVQclhoaDZWOVNV?=
 =?utf-8?B?QUg5Z29nUUZIRWRQODVvbkdQOFJPYkhCWjBGZ1h0UVVnZEJnNjNKOU10SWVD?=
 =?utf-8?B?WmdNM3JLak5ra2pjdDRvRDlmZ2k2OVhLcnRwbXBFMlE3UEp2cFRObmRXNUNV?=
 =?utf-8?B?WUpQZC84Rk44dnNBRnNFaFIxRUw2Rk5POFF5amdXNmd6eWR2bFhlYWN1cXgw?=
 =?utf-8?B?TkV6dW5TaDRLWlVTbWJEVExuZWwxUVdBQnRRMFRjdzFIZ1doVHZtaDFhOHk5?=
 =?utf-8?B?SHVlRVIyTUxlYzl0bGt4OVlRbjJ4Y3Ard2xsY1JraEN4UTlSTmFBMllVRlpE?=
 =?utf-8?B?U3AyU1N6MGtFTTUyb1VJNjFKVVJBMldOTkowVC90VHhpQTIvTjRIMnNwaFdi?=
 =?utf-8?B?RkZ6UWo1K054Q1F5dE1GcHNTMFQ0TitkeVRSMU1QMSt4ZVVDRDNaekRQMWdD?=
 =?utf-8?B?Q0UxclBpcVc1K2VTbnd5cm5OYlBMOW9PL3V4bTlnSW1TdXlWdGc3bkNvRWUr?=
 =?utf-8?B?ODdNMDBMVEt3T0YrMnUxaTRNQkZjNzU5SEU3ZldHc0hHTTB5SG1YbEtHYjlk?=
 =?utf-8?Q?QOftNS7/EmF9uCbCaAsMEDS2V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e74eabb-0b82-4889-80fb-08de3c2c5603
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 22:50:25.3263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ll9Qh8/tVcz9+/jRndZ7uYwQ0Q84Yi+azDYqPo9Jjrh9kWDgElmAzN5Jx9nBSMTD5QQylC/9QwnF+SZ7mFARxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

Use cleanup __free(fwnode_handle) simplify code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- Rollback to v1 version to align guide at cleanup.h.
- Ref similar link

    Link: https://lore.kernel.org/r/20240904044825.1048256-1-dmitry.torokhov@gmail.com
    Link: https://patch.msgid.link/20251208020750.4727-3-krzysztof.kozlowski@oss.qualcomm.com

452e0adff2618 Input: iqs7222 - use cleanup facility for fwnodes
52776177d8b7e Input: iqs626a - use cleanup facility for fwnodes
9a540b67a9c26 Input: iqs269a - use cleanup facility for fwnodes
cc3b18f9fedec i3c: master: Fix confusing cleanup.h syntax

change in v2.
- move variable define to top.
- remove dev_err_probe() change
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 25 ++++++++-----------------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 25 ++++++++-----------------
 2 files changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index ce93d868746f002c22e2f86b1e0aa84ec1a76061..9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -12,6 +12,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1349,27 +1350,26 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
-					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
 		return -ENOTCONN;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(csis->dev,
 				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
+			return -EINVAL;
 		}
 	}
 
@@ -1381,12 +1381,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
@@ -1395,11 +1391,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		return ret;
 
 	return v4l2_async_register_subdev(&csis->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index a007c582b4d91660a97910a6a0d53c9b6fcd73e9..550f9f725cc18fae910282ad72aa1dde37af0b47 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -717,27 +718,26 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
 	unsigned int i;
 	int ret;
 
 	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
-					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
 		return -ENOTCONN;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		goto err_parse;
+		return ret;
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
 		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
 			dev_err(state->dev,
 				"data lanes reordering is not supported");
-			ret = -EINVAL;
-			goto err_parse;
+			return -EINVAL;
 		}
 	}
 
@@ -749,12 +749,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_parse;
-	}
-
-	fwnode_handle_put(ep);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
@@ -763,11 +759,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		return ret;
 
 	return v4l2_async_register_subdev(&state->sd);
-
-err_parse:
-	fwnode_handle_put(ep);
-
-	return ret;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


