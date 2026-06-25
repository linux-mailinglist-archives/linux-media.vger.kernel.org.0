Return-Path: <linux-media+bounces-65650-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZPNEqk4PWqMzQgAu9opvQ
	(envelope-from <linux-media+bounces-65650-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:18:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB4A6C6864
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=gYaeMmnx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65650-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65650-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99877300E02F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B3364053;
	Thu, 25 Jun 2026 14:17:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158235BDA4;
	Thu, 25 Jun 2026 14:17:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397075; cv=fail; b=ed4wNnFNFWsep03q6bvwkhGFE9bqPAr6SNr3Y1rHfDGFNe3hkHTQA2qCjl62vBbmBQkdWv741aTXmxu4zdBqbIt3RuLGx0SbPKbXWbdjtN8B3ePoeEmrRi3t6RtomWJvMv9EdsjhJExJDYLsDmLgQkn+hGhVV1w60zwb6dhnmbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397075; c=relaxed/simple;
	bh=o6GWR+6NGIoRaLpzBjFXh0dVNGiJ+5wd7r1iovzHSps=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qFj6bAf9Ar84MmG1ZWZ/rGMkzO3A7FL105aO+FRClA+0ko+3nYGtVJKtnYI/QoQLUWHeLlOkB7crZ77WZFjAJ/OcLMxly1Cvhlx/Rdk9TrbmeLHPc9DKTFMdhN23uVjsGrIqOIWSfG2Yw8+v1+TTvFWswzPPayLTAwi3b0TOOm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gYaeMmnx; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BClC7J50DjebflfNNA8cR8FYepprNuYbzdQ6xqn6cMej9yIQ0VQ/uUxFvHBEkIfNqpB/G8ig6WykM2D43fAsEC9sh6GWH5IJM1qmCuX0p2TpJ3P285js5kZLMYQOu90vAd76wKkKurIRo99V+qWeFpVE0WKvh7O6vrKeReTL8SSmm1ms3Bq1UBwEM3RzelX2SejUhTA3zVKys8n+zGgxArUsk8Ngxqp4wd26UuPrqsL56HIXT291UBM+lviHJ7ydioyGW6slN1b/qJtuyvkFQPn9ZvU7iEJN5FuFa7OrQeaPspG1uAAEU1Ax1P0TwT4rxCh78463DTfDhKBWp/6gFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fyoTkrbgDuS5DYQMSLkW73sDpL2wS+uHOnrztI8DqU=;
 b=elCVE8yRnCHEPtidDzZC7uzDXsgKr6GedXblA8MaqMwv6ji2eaYY/3OAkGWXosVXeSoYh0WRhJL69vXn0lU9wHnB7Ty0S0ZMEiOqxhVY6cDnaJ3fSUz6ZodqWfwVHBOqfi++9I+xOzV79VR4CzfDSwGfi7GfabxIAXApp6IOLAMpw5PonwtwByJsobbjOhSXiOP1IC0+NdNO3QHcZ23sZAFtw26uuxHXLlkQvAv8Xd1OWV43GDWhpXJD8+uZ8ONQBMCmuAJWIVfr8PHFlp/StzWtSgUXk1srPqLm9KxosPnr2dsDMT8Cyi01llcRV+3Df7rXXt2l0I4gfkLVACC7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fyoTkrbgDuS5DYQMSLkW73sDpL2wS+uHOnrztI8DqU=;
 b=gYaeMmnx2SHyrLPAOhnuAsHZt5vkXcwAUADeXdGF7rSwkI+qBrFfxI/mR5s7beDNC823Zd+RCo+ID14axdgNXxICIbG4G3ufmTj4LXGUgKepZWC9oB7FGiTsvR7yxXmPqPryo3cPtBbd7F5rnlLnMR+1qyApYVdGc0nxE6GlLen0kG8n3bXNcuiG9G5LtDo2kA2sP8uXlPKLYRiyDIFdq27WukqQ+ihrRoimS+KJi9iAUGliPdF5vW791yLUZLQxJgIdjnvJyNv65aoPPPHI09ekwOlFm767fImIGj4t6G/ccBFPLbZEOMQytEj4Ut/qEPARHipvgn04aekvZbE7Fg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11888.eurprd04.prod.outlook.com (2603:10a6:102:519::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 14:17:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:17:42 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 25 Jun 2026 10:17:22 -0400
Subject: [PATCH v3 2/4] media: mc: use
 fwnode_graph_for_each_endpoint_scoped() to simpilfy code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-fw_scoped-v3-2-ffd0868e498d@nxp.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
In-Reply-To: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782397047; l=1390;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Lw+X+NkNlWW2xcIoLkIt4WGP9pw37V0RCU0khlS+b9c=;
 b=34WqCz8/mopT/VkPh8gQR0zFCokTeYq/nGhcff2ZHqiOg7me+VaLPSNy62ZTcUnstTvxZAeao
 Pa8vYUX3zRdBO9OI2UaSaVLR2r6c3ziiMUsvU6DB3rvXNKzFsskUeVV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:806:122::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f5e350-2378-4fac-f7f0-08ded2c48517
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 OL5w488Rce8wIx9fWTN8ZPkFO8D6WVaJLuENYYRWULtpCnNK4KVJvJzPhLmEnvX+HQI0V4TIeg1uHmlP+Nye5sWhSZDZwa9Y1tA/Cbn1uZYIBuiNEkSJzPzbM6nWnHByCVlt3mvGcqQP32wyzLauSeqhnwQWe1jpbdeCJ3UTMd0MFKvqqt43ERF7CgN+iuQmHJZv+5B7wBh5e4vsP6zsjbYxOjPwI9z03RhyV09BqO/7lpkVJTttOWIOWXxyAZNcsBQKL3AN6MeOiBloHL3n4LlGqRBJg91KSijRP6aUSYGjZpMZw55Dp0aPlEaqooP2m1N1ZLWIJNTINOPvPT09NpIaNZyp7UtlFQz0Bmvthum5kG3JExUENHE6RYoLqZRVgiStGfWVyj46N5fE2th5LBrF6mVxm0yGJYvuDOmhCxpq/EXhQAS6B5VOrd6Q9y8WdtlWU6TKZG0tHQEJ1oU0xAzJD511etz/Xk1jIY/XYyuhlVeH+ZvJyeNY2CxaceOxIOlUhB/eyJFqRBB8bay+WlIlrcBTVOxNPuqxXzLT1/JPESWybvhn3JjKyu/jR4JtcBKf8TnPWjdKsx1wt9Sy+KDEiV3/fGGzlDFvlEFJRIkoihbQ7GhYgPLszrMZfWRXrcLKrZtIrJlYUVC5tJnaMpYJyGOXuZbSZUmK+AcUY0rVcpZJCslYMBLc9Ag26e2mnin/bB8W7Bl8Cg6TbhpTVw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z01vazBndDV6NE5ab0NDL1hSV0VycjdGVHUyeEk0WktVT1pTdmF5UmUzNU1i?=
 =?utf-8?B?VzJUWnNPSG1UTmhrQTBraUVGNkNKczNZNmZQdzRJZU5DWlFUOWF6dVpFVlVu?=
 =?utf-8?B?b0VWUHBvb2ZyK2tJNWlKNHY1Q2JVZWdlYlRGaXdYa0NkT1A3cGp0Z3kyWHZi?=
 =?utf-8?B?dDNKVjByZWpxS1RBekZKb3dzSFZ2WTZZNTNQY3d6L3dOMEh2bkdxditNQjAy?=
 =?utf-8?B?QWhONDdWeHdBTnVTVkpBdllOMmJLTHlZa0lBNUdLOXJ2SFVOVDY2a3h6VlhO?=
 =?utf-8?B?bVU4TWlmaExTR3ZpUlkwQ1BZY1BuYWxtZXp1eitQWUxWQWtmVmhoMzh5c2lJ?=
 =?utf-8?B?NFpldndJUkQ1SE5sUUlGL0tJbkJkM0NyeWRCdDN2TlFJNWcvU3YwUVVWaDR5?=
 =?utf-8?B?KzNCblg2eHdFSFJHZUIyNGFybUNzK040MGhiRlVoUldkb0RXbFVFc21sbnNR?=
 =?utf-8?B?Y2hOMVVoNWFvNFFJTlFlTG9hOEc1K0RkVS81QXRkUmhWbm14dHhJUWVuRU9N?=
 =?utf-8?B?MENweVhjQnpDZ2FmdnU4cUhMN1pvcXEyTURiVUdMNk1Lb3V5cE91eXRsMSt4?=
 =?utf-8?B?bzgzTFRvdEJtNE5BSDBrQlIxc2lTbEF0eS80Q1JKYVpXU3JnLzlZYmc5MXh5?=
 =?utf-8?B?cEJORVJpMEFYRHdmQTM4TURVbGdtamRUenJMYjdjN1k5Q2lwNkdxTXZSRWxL?=
 =?utf-8?B?K0daTVNlSGVSUEwxYURlV25vaTBBZWk3R3djNkRMbUYxbC8xU25vMnBROGVY?=
 =?utf-8?B?bXYyRVlHaFBkeExDSUppSEpZeCtCYUxYQ0pKbmttWDBYREtOejl3QlpyeHNs?=
 =?utf-8?B?b0QzeFFEM0I5dWRRYnZScFZCN0VaL01hMHB6VnB2dWpvdS9xRFY2VnpONHlM?=
 =?utf-8?B?ZWI3N1JWWWQ5ckVpNHpTTEs3dUhsMURxSmVjSDVrRURrSkNjUFN2RHhRWVZI?=
 =?utf-8?B?ZkZucnZZRTVmQW0wTmh0dnd2N3M3NHByc3FNVUh4VElCeUFGTGlZSzVWN3lF?=
 =?utf-8?B?czR1emxuWEw3UTcyeVJ3ektOSHd3MWgzZERzUUhHWWx1ZTZsRzM2QWd5RExH?=
 =?utf-8?B?Sy9iTUVleTFiZnZtNEZIejlrbmlPUzREK2x2d1J6d2pIYm5DS0xZUEtnRldC?=
 =?utf-8?B?VVQzWUNES1Y5Z1lBa05TMkpxenhyeUxiZk16Q0RuekRiTFpxWjl3NzNhV2Jy?=
 =?utf-8?B?UlN2WGhrYjA2ZzBvR3RJeW51QW1oMlJJY2ZDditpaFVDTEhtbFc5UmlKc0Nj?=
 =?utf-8?B?M3M2YmgydEtOYlQ4RFJtbnZJNmZlOXJQNFlaTnFsMmIzdDB3YUNGZEEvK2k5?=
 =?utf-8?B?OCtpcThQcnF0NERZUDN3RmhzcXVyUUlocEpVL1pWYWsxT21vd2lDV1JIVHl5?=
 =?utf-8?B?RzhaQzFZOG1jMTA1R3FxT2FOK0RtT2hjd040d3BDa3owMkJMR0x3NjZzTnRG?=
 =?utf-8?B?T3FYc3FCQXJBSUNTeUVZNUtwRDFBekVnY1NuRUJ2VmZhemZTZDllcDNIZXVv?=
 =?utf-8?B?NDhlSWNuL3kzOGJTdlhxeEpTN0Erd3VYN3YwTFQzWjB2S0hnV2lzNHZIR0pO?=
 =?utf-8?B?UUxTamNZaWlZTGxRLzAxblJXVmNMcDlNaGZ3TnlMTXdmVG5KOFpWejNMSkRh?=
 =?utf-8?B?UFIxUFhlZ1g5d3N0Nkh4c01yQkxpQnh2dDRZaW1PM3EvMWIvODZIcFZXeWlI?=
 =?utf-8?B?bXMvRGUxWDN6VEI4a2M4SXhIZ0hESmJpZkhDSjlOb3cxYUY4dVZyWUxsQWV3?=
 =?utf-8?B?cTFzLzRCS3hIRFloZVFPeHBWRG9hNkdNK1pOaHBnOEtzcllseGVyWnVneE9K?=
 =?utf-8?B?MXBjUDl3a01TbXFENHJBSjZob1FPUzgxangzcTczOVFJSGk2aysvbDN6QkF0?=
 =?utf-8?B?RmxOb3p1TzMzbjVjWHZ0Njc1cFFLR2ppTnpCT0tENTRRYlRqRUEyemhzRXNT?=
 =?utf-8?B?T1kwYXNtTGFaS2xiMTBiNytNQ1h6Y0Ewc3dBRXhzcDRac2NKdmtmNTQ4Q1pp?=
 =?utf-8?B?ZEx0ZlNaamNhb2FEYVpBSFhnRDRlaXBGc2psS2x4T09yNFZWYUlTY3V2TGxo?=
 =?utf-8?B?dXp4bHkwaGhVa05VMmRaVTFtNm5pd3pNM25mM1gwUHpRSE1EQVp4V0VlNlVK?=
 =?utf-8?B?NjRLWlJ6a2FDckNESTM2d2Rma3J4Yzd4b1VHUlVnS2VsbmZhd2R5Smd2M044?=
 =?utf-8?B?aHVEV3pVeFF1bjZ0OTFDVGNsSnJDUWp1TStUL1B1b1IyMDVWcVV2NW9TSHYv?=
 =?utf-8?B?OGxUSWYrL0RTSUY1eURmNDFNVGJOZnhkQjhuMnJlU050WjlxUEhZUGVDbi9w?=
 =?utf-8?B?b2VkTi92ejFsMzJadk53Zi9nVXR4ellSeU5oWG8raXk4WFRKN1ZHNzJ4M1Nu?=
 =?utf-8?Q?o29Lm46QGNChEcVN5gPAbPushuG54VMcXhueo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f5e350-2378-4fac-f7f0-08ded2c48517
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:17:42.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5a1M4QL7bXN2V6ofwhtdWap5MSWkEsqfFa4BhFALoHmBurR76PUtEclsPnbA3brcXbPT4rYfYm81kFeVJSeELAhhrhn3/o2lkSTiE9FQua54FHKYKRM13Vmf5y2Gb7S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart+renesas@ideasonboard.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65650-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,intel.com:email,oss.nxp.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CB4A6C6864

From: Frank Li <Frank.Li@nxp.com>

Use cleanup helper fwnode_graph_for_each_endpoint_scoped() to simpilfy
code.

Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 937d358697e19..5d7fcd67dc42e 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -324,12 +324,10 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
 int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				    struct media_pad *sink, u32 flags)
 {
-	struct fwnode_handle *endpoint;
-
 	if (!(sink->flags & MEDIA_PAD_FL_SINK))
 		return -EINVAL;
 
-	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
+	fwnode_graph_for_each_endpoint_scoped(src_sd->fwnode, endpoint) {
 		struct fwnode_handle *remote_ep;
 		int src_idx, sink_idx, ret;
 		struct media_pad *src;
@@ -397,7 +395,6 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				src_sd->entity.name, src_idx,
 				sink->entity->name, sink_idx, ret);
 
-			fwnode_handle_put(endpoint);
 			return ret;
 		}
 	}

-- 
2.43.0


