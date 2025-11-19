Return-Path: <linux-media+bounces-47418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 58585C712A5
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4E13A2AF95
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC83307AE0;
	Wed, 19 Nov 2025 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fjmyDpkx"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E16302170;
	Wed, 19 Nov 2025 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588085; cv=fail; b=KSwtRBCkas5N2NaPwH2s77euGJF1oX5520CGLZbn2P9lw1nkTmlzxl8d66fSVUTNwgZvfQnoFmc7cjgqI40SezswfSJ7N732JLMsGL7t5Sgh8X+YH9229N5PrXTWYGFb8pVVJTwu3fRTqp3BhXIgrojP4FD4dMylRZApaaTJ/pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588085; c=relaxed/simple;
	bh=ARPVaqVAWLk1VA6S3ScOC7ebUNYLCY1YIOO8jKmKuaQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b8vDDdzfrFbiE7aU8aisi7TtMU2ISA3hEEtK8irzXdD4poYUHBVRBacxtNYcqO1O0jWlCMBhZe6YQR5WFpdAWTzj568F7xaA3M/g6IWk+Oz2qwlvB8mimHM284gJ8Gc6gnvsh6XsEK3xQVoJFBy2mnRiXunHa+LJvCev5EywHHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fjmyDpkx; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfdRTJgDrCoZV39yLDbHIsWiZN7xs7cYtR0MGTa8Izp7DqIAflBLsVOagdFUgUBhH1fCUxNzoNyGl9zAppq5DGpIU5nzoTip0TvI3HO3lCC5wspH5szySCeNtMC+KFBYVXulOzgBDrQp/uifipDo16mFA3/T4DzwG8CGMJyuX6896Ar5Oc0J5tMdJf5AyWYLRBdOtTnLDOuAZOYBryOD1mtJZj/N821DrdwEAfXTjtZDgUbp7EMiFpuGoNkg2V/uMnXg1/9nm/iSImXmZbUL4zBk1cjIbzLhx9BI4wVD3KJYlXWymMq0kwuPnzHsjHGF5AxAswFmYiqplpddGSa9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE3W5LA1JyM4wuWE9oEPumUOCTK4fL3rPZoBerNt4s8=;
 b=dv1Rkjk4KU14oZHnlmT+JBY2ju7q5HbJ1uoi6cglXHIjG/I/DqPYzgVC21TDxahXSp/whkn3s/+3KG4p9CbwTjg+G11qwY9TmfuTD+krjAydLHN9miL3Zhs1nmM7d74H5DdTs0cF9Tcztqw/r0KsMC7/NNThtyzWHjv7A8/w+JLynT0UuTlSTGtRr3Neiv4vjZ7whUcnVFxmIoXMdUxBwIDisi2Rpiay50cykF+3oWxsPhh8LSUo+IUPnrV+vSaT/9WU+UAS4U3dY9+i4F/qeej5h/VD95AWYVeyS+Jc3C5GEbeJg4tSi0xLMEDq7HOZ+kVTKbqqKxtbM+n5zRkGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE3W5LA1JyM4wuWE9oEPumUOCTK4fL3rPZoBerNt4s8=;
 b=fjmyDpkxalH36h2+VHAMBQEA6SVsi/osJ2Q4RuEAm4UxznpAtvSkyXkHBtxNtu0dyjgiJ7mKUQG/U9wb2AL0DEM2hZt9lmB9TeY4McSjQelE5MScLMPG/cSvHAC/cYUe30VP51kqjQIUWhLGpRzKioyAlhnDUL+p0gpqjW+DcRvc0/Vfdd9u23KbddAb41N4T3Miw7K2R24sREuqfRgMpboVERbA7/LZEPbQxaTIzSQleAyWZBSDn10t3ZSnqvX4jJzwR1/IpQQa8wfZm7pplPYt9fujFvQtcVGdTIRAclqc8G/Pn1O3pLllbFt4fOgw1lcB7HlcKZjR++AnawAcDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 21:34:41 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:34:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 19 Nov 2025 16:34:24 -0500
Subject: [PATCH v2 1/5] media: nxp: use devm_mutex_init() simple code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-cam_cleanup-v2-1-df732cc83ff1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763588074; l=3593;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ARPVaqVAWLk1VA6S3ScOC7ebUNYLCY1YIOO8jKmKuaQ=;
 b=Edr2M1OFgteUJ8Oc1jeOv48lUgqV0rdgoenkH+Sr76F453ASzF40Y+k8LadXgHJJGg73krV6H
 XhSO1z31qEKBx2c8yJitojlRbR+sZ7QQQHJggk+sNs//6WoLlC1vl5U
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
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0913d3-c7ed-4919-6f28-08de27b372e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S0MxU09oSVRZblRPYlZKTDR0V0tlUlVxeUNzK29idWdvWVh5aFlaRlBjb1h3?=
 =?utf-8?B?bXVkU2FaYlNuS2tmVHhRL0dDQVZwc3pYZWhHUTkxcEJ2d1Y2Yi9IRWZMWmll?=
 =?utf-8?B?NXliWFFIVFlORmIxS25lb1REdVJBOWczWmVDUklhay9pUjlETXN6YlB0MjM4?=
 =?utf-8?B?TmZYOUJYZkEzdCtGVFgvNVRLWGdmNGhBTVpDSmtwN3FXa3VYWVJLTzRRQmtK?=
 =?utf-8?B?QjJDU0pIS2M5Y0twaFYyckloZ0FJQng3TXVid0VKeks3YWNqaVpTTm1TWGpi?=
 =?utf-8?B?K0ppa0drMVpobWtBcnd6MWtycnRjaE1CUkZvZGg0YnBKVkd6eEJqVXJ3cmhI?=
 =?utf-8?B?NDlKd0s1d2pUa3J5eWhBd2IyMTg2U0NpbUtOczhMM094eGFxeUhTaFBLZWVT?=
 =?utf-8?B?RlhRUGZtSEMyTjVrb3hrazNDMDN4eExiZDY1M0dXRkNSai9FOC9tNlpIMEla?=
 =?utf-8?B?Ri9YRHRmZGdiOE15ZHdUNENsSXI5bW5OOEcySEJaRkY1czhyQmt6K2RiR1Js?=
 =?utf-8?B?aWVDTUF1RUd3VU0xWVNPeE5TeG5lODBienpUVzJsZ1BnV0Z2dmdDeFJFS0lx?=
 =?utf-8?B?VjVpbG5RVjdBTGlWbTR0SDZKZ3JzZy9JSEozcmpOV2x0OE1JZFNJcEZydGpr?=
 =?utf-8?B?am5tU01tUW5XVjhXNDRBWGhodG1DMDU3WmZCL3BYb0ljQ3NvWm41a256TS8v?=
 =?utf-8?B?TWljNWRVaEYxTFl4Q1lGSkJhQ0JvbUQvS1FNbm9HOC9LSlFITVBzbkpIWTBj?=
 =?utf-8?B?REJBVkdpZW1YSEJaRW9JdUNLeTJzSEo4M2xzQ3dyVDJGNWxQQWZtWWhveGk0?=
 =?utf-8?B?T1c3TEZxZXZ0QlQwT2xVTnJ1TG1lRythMTEvZVl3OHJ6RnlJSDdPQWFieUhz?=
 =?utf-8?B?MlNubll1ZmNabjlmU0N4WTdia0M4cGxNNlZjRStvNnJrM0lta3d5M3V5Q0Vp?=
 =?utf-8?B?K3B0VlM1ZHlCVmpoSDdyU3k5SjZKblRxWCtPNWFxMVpSU0djQkJIVkFyT2E3?=
 =?utf-8?B?dUt2YlhzajczSy83SVdRdVhLcTh5RjRwVzBUem9lbnNiTlYzV3RtMkhCTHI0?=
 =?utf-8?B?dzRtdzU0eUg2M1U1NlVaT3dMcUtEeXNRVkNQQ0tvc2FlTUduSkg3NTljQmR4?=
 =?utf-8?B?MTN3eVhzbkl4ZFdVL3dIT09XWmdIVzltTW80QmdrUjBRN0dyS3hmMVphSHdU?=
 =?utf-8?B?VWZRSGM4Y0RzK3ZhOHhkWVJyNkU3NDdlNmV4akQzellhY3RHekV5ZXhpUmR4?=
 =?utf-8?B?czRJL1B6bGgvLysvbnc1NXp5S0swSFJjVXc0bnpEd3k4UWJlYmZ2ck0zRkxT?=
 =?utf-8?B?L1dJVmszTWQwTnJueHF3T3pZTFM2NjlNbVBtQzRhcDJ1aXVsRWlGekxWNGtD?=
 =?utf-8?B?Q2J5ekMwM21QLzIrRnB2bjdjUVFqeTYzTGNKVUI4Z2Q3NXVGdUZZOVREUTNW?=
 =?utf-8?B?NElpK0tBR0RtNlpkRGZOWENwbVdlR0RvdWxLazYrb0M4R0tFM1ZyVENGbjA1?=
 =?utf-8?B?QWlIelpKTUp6emVQU0VzZlMvOEtiMTFpMXJ0cFpxeXBXUG1jUGxCNW5ScUg1?=
 =?utf-8?B?ekRMVzgxQnFQUEVObEdHWi81NXRza09jaGh0ZUtDWkhsYUJRT1lJNHNmUDRI?=
 =?utf-8?B?ZG84d0JzZzk1R1Vab3E2ZE5lTHg4U2Y4V0ZDWlFNTGpNbG5WdlF4cnlORjI5?=
 =?utf-8?B?cG45Wjg4WFRxWUpQczdBOUZpUzBCbjlGVDBJeHJ5Q1FlQXIrUDRONFFScnFV?=
 =?utf-8?B?WitKUlJJa2ZkZjE2V0dNWGlHc1ZrWFQzOHc0VTNWM29WY0VraHMzdTRpVEdj?=
 =?utf-8?B?VENEYVNjcDhSKzdRYm92UXhMa0dRajcrZEhJWElEeTUza2w4SG9Pd3Flc1Fl?=
 =?utf-8?B?R3RzeXB4MXZBaFArT3RtR01KdUlBRkJPV1dnOCszcUoxeFp4RS8rUnNHckFp?=
 =?utf-8?B?djEzbjIvOFlPTWJrS00vVDkxYWdkWkdTTnkvNlp5TkZTdXFOMEtrM3hmNUQ2?=
 =?utf-8?B?YW56d1lNeHMzL01tN0ozbWY2R3o5bERWZFh6Q3BFdGZDMFo2S0dGYWFLbVlB?=
 =?utf-8?B?ZDdxaUx3WEtHUlJ6QnBWK0ZFekpWNytNNHVYZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bzhXV3RxMTRaVEVDb3hoOEMwQWhuREgrcXVKOGkrM1ZSV1NXbU80dWlSVEdF?=
 =?utf-8?B?K1NXMFFsamhYbk9NdzAwbWM0WmU4MnBWVTZHdWc0UG1yUWw2TEV1bXI2emdB?=
 =?utf-8?B?TFd2eStOSXNwdXRReU8ySktZQ2ZqZ2NPaUtDUVZXaFB3WE93R04weGpNL0tP?=
 =?utf-8?B?UTZabmtmNmh4ZUZQSVlCV1VqYnBubjBkVHRKVE1hbm9nY0pYYkNFd1Jrd1hH?=
 =?utf-8?B?eHBxcVJCNHpxdEE1amhBVHpDQXhYck9POUxORFJxQXoxSjNlOFAzbTB1Nk9p?=
 =?utf-8?B?RGJUdEJraEFlcFI5UlFMT3dHSnlqeEFna3pzaDlYRmVWbmU4MFFsU3NzcUpW?=
 =?utf-8?B?dzF0QVJXV3Mydkcwc2x0NVRTYXZXb3ZaNWdxd2hnREljd2Q3TS9WY3lIdnBJ?=
 =?utf-8?B?MkEwOVhCMDJqTmh3eUIxMG1laEROZ2hzUnNwUVcybmFjcFFIVWNUQjdlc1oz?=
 =?utf-8?B?UGhkWDR6SXM2TEx5dDg5cy8va2xobER5SFFYWlBGSGdvVGtNODdkZEIrS3N6?=
 =?utf-8?B?MjNjR0VaOWFqdktId29qOWd4N213d29ENndGRkoxNitWbit4RWR6TDh2c3Qx?=
 =?utf-8?B?eUYxaWRrWW5mOEpFTzNpbHYxcFdYNTJlNDlWUEhGenR6TUc0THkyQ2lncTRI?=
 =?utf-8?B?M3ExenhBaVE4TjkyTU5KY2Y4dmxWaXBqeGxMY1IzV3NneE1pRDc4d1RCcytG?=
 =?utf-8?B?L1grNTJMRWZpbEdZT2dQam9iMUZaVWNYb3AwVjB5QWdtNTY3cC9BN0tlL3JW?=
 =?utf-8?B?bTFVNFQzLzVTZVhneU85cm5yL3ZHTWJUTW14UkptcUZQb0NpN29IZEc5Z1NW?=
 =?utf-8?B?Q09ZRFFHL0tiWXo4aHQyeUxSWTlLWE8zVU9LWDdjb2YyOTlOWDFjdG5HbU1V?=
 =?utf-8?B?dXVDU0NBeEE3S2U0dU15VE9jWTN2NXNRUEp3VHUvZWhrTFA3eUJ0UEtpenJK?=
 =?utf-8?B?R0srTHI2QytkWXJjOWRGaGxYaHFzbUpqVGZUOTdDVUpnMFpLRi9TZHJESThm?=
 =?utf-8?B?NXdTdUY1VXJaYzF4enhZb2JsakFMZDQxZ2ozYUJORnd1aCtMdzBrRTNQUVhj?=
 =?utf-8?B?MG9YQ1pLMnM4ZkovdkQ5cTV4WU5lcWRFb0xLdDFEUGRlaDZvcGg4WUtzdVpj?=
 =?utf-8?B?TFNBTmx4SFV1MWJrWUNTMmM3WkdyV1RJczhURW91ZmRROXk2TFVmRlNKa1Mw?=
 =?utf-8?B?ZW5OVVNmci9iNDlPZ3NQTmRUVldMVnBuazgxbTJnb3VQVDI4SkJRbzZsU2dC?=
 =?utf-8?B?ZUE4VVZldmlqTVBxVFJYTDZ6QlVUUGw4cGlRbStoLzdQbEhveHFha0hGeCtZ?=
 =?utf-8?B?MW8zMlJyVFFhY3R3MXA1eDhVZkFQNUQ4czc3QzdEaW1DaDJqWjRDL2hKcVRR?=
 =?utf-8?B?QWM1RFBDY1ZOZjNlV3BZT1VaZ2JGOUVFdmJtSUZSSGlnUlR0Uy8xVndZb0I0?=
 =?utf-8?B?NlI5MmM0dFArOU9LOHYwTnRnb2s0UmhXa0V5SkRLbU10T3BPVFc3LzltYTRi?=
 =?utf-8?B?TzBlT1ZtclRSTGJnSllnalJmdEd1NEZadngxUXBmT2ZQVmNhenZxcFQzSHY4?=
 =?utf-8?B?U2dIWk5nZFRvM0kwWjVIL3hwMmphZWoxdUE4U1o1TjVPeFlmbmY5Qlk4QmtK?=
 =?utf-8?B?bURrSFB1dENDckZiR3NqZytueDFjeWFtTTZEc1lvUkFoWGhjREprZ3FPcUxn?=
 =?utf-8?B?ZHZDcFBJWFlOZWpXaEc0M1RkTkVNL3o5d01PUVp1LzdnZXR1ckpidTRCZTFo?=
 =?utf-8?B?VmZrTEFHTitrcVJ0T005STVlbU0rQkJiUmZhclBGczlKMEJWeXlEQ29EVnFJ?=
 =?utf-8?B?Q0E4QkZ4ckRTSFdJZTZ1Rng4V0E5OVVhMFFmbUg1MStJZGViMVYyUmJzazlh?=
 =?utf-8?B?dEI5dFk2dUFLWG91VjJ3cXhHZVF4dzdRZXNseTNRZ3hLeWdsRWc3T1NYTGlq?=
 =?utf-8?B?MkR2aGRJdEVlamRVckFjeEV1eHZrUzVETzdrVUhPbHJoT0tYbVAxNW5RdHhP?=
 =?utf-8?B?Y1N6Y3luRGNHOTdqS1M0TmF5aFpkc05IZFlEK21lQ3UyY0c5elB0TGU4ZEpp?=
 =?utf-8?B?bHBwZ3ZTUkxWeG5EbzI1ZzhzbHM1RXRraEU5OEdvM2JTb1R1VnRNcTNycE0v?=
 =?utf-8?Q?Ro7x18e/rRrT2HegRfNp4lfLB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0913d3-c7ed-4919-6f28-08de27b372e8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:34:41.6461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNhVPcLGir7/m4YWHYxrc3tQKL4Nar9+JSz/7ybtc4Y61RwkzY5bCC/BdqXWiEesE9fnJTQ0DJmcv6iABThAMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

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


