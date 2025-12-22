Return-Path: <linux-media+bounces-49315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51ACD5303
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D18F3022B44
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1560C30C614;
	Mon, 22 Dec 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D+FnZG4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974DB30DD27;
	Mon, 22 Dec 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393420; cv=fail; b=kRkf31e/8ljgiheQj5MA6b8Wet2s2E2DuvfPZSWsUQu4w2iNxoATrMeNhVuvX5eDg0DBwL4wL7nW37cSnCGuLmTu3n7U1km6NkGBuyMAVgGo7qvDIYiRvkmMdR2MfzQpC4ndqv6+yiGLvIiHHj+h0+RvBn1aN4P9+fQuRetEOzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393420; c=relaxed/simple;
	bh=0e2OAXc29mKU3v4XAK/gph23aowZ8Txa6UiKJSC/otM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kMbDASAzXOXdIEsmdEXXSWglDnBRTSJJQ3PIgdiB6dLIkMXchd8siozTy8ZcBcK346yYrTn7fVOxWlM3+7lNtlSmZS5VR5yP3nFPf1jRcpeKa0YqagjT/EIHyhAV8hCu9JU/dK7ALzOymHK2BwZxxn7tU94K+f9/yTX4BfqT0/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D+FnZG4Y; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxxvRcXehqEbdG5qLAXW1PGDso4ahy3tSazAePZL1UjnCi1t7r5B1EspxkhXifu4pd4esOb4C4qoJ80obZLdeDbhPfNW6hu4KwwE2LDPLh9EHR34zC/AaAcwlHU9fkvS7WNrAV9EA6AtZWom694937mHqqX1lgAEAlNGqC8XbjxbJixdzhPZezoF50xauK14zP3VPLcW/Mmc7fk82SR8DeYq4VYOcxEtg18xg1mjKe6vCKmJH39X629GqMbitvpQDpEt2xYW42ZIYVtV/JFED25z6WQ/Fl4W+c8ntMfNeaze7Q9jChe2tSxIioxuSSHtEyArQoiEnInF6NBUiPhFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH0aikwDCHX3/Mw6lDJM4JiwRBsWubF+yf2JwRLQl6A=;
 b=vihOyd9KEEwSvjP1hqVflyw+h+RXsx3LoTbmZjGJUQckmUlTy/yHvWoPZyQleJwi9zYwomMurlZK6BZJuyjq066CjJnWMP2Z1cuCzNupNKXwHrJDFM3iVgb4H2I0DKSGpbyB7uIYNs8DSNRaY0u/s4wGEOnPqfV7cEz+085V4+gjHrs94gbBWG3kmLZ1CP+UT16dpKe7FZ4Sm/dKGz+sGqF9Wgl0woPQe34QIW6Zm8SM4W2CHMxfmdZqJ9kAAmHfzYSIzHQ/wUNY70pFaf9/HbEjFv9dDaf46yRZpP1R7NNUy2IFfoGYp+qaPqDFslokFenQUQE3QRWmTR/UynOaXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dH0aikwDCHX3/Mw6lDJM4JiwRBsWubF+yf2JwRLQl6A=;
 b=D+FnZG4YrxftEwDu6tzzX53HNWeZTvBj4leYWu0a0EUhudwVgojv0/f+zAlrTgOvyKNz6TwXzaVQCn26cawEyD5tDA/+NL4xeGtpJYe/K5sykyWvKgI2z3GPHLFSdupjEJlYU+yVTKy8pAkal0n57QJjwj6f0+754CHSM99aW4cEoSCfYxO7O+9EGZUkBRuxkCxsv7nBAXDRMAWA44K8PyBqHaslcOEmUDx5QqaVZBkkCPUnYGDFEe2RrpdxFOVMjz7prREj6M73aXWYGxUWioBV3gEVKebVBtG74ONKJz/wKaGceXDM8y2c0kGSxFisN5GYB2Gm+PCOYufdyYppWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 08:50:12 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 08:50:12 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: amphion: Use kmalloc instead of vmalloc
Date: Mon, 22 Dec 2025 16:49:10 +0800
Message-ID: <20251222084912.747-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0de619-4252-4b77-eeae-08de41371e24
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gVse2xLrJWM4kSGqoOmGB6ghiNcxoZWDcpOLvBNtWz9qfIBihrT0+2wfSSVY?=
 =?us-ascii?Q?M/bBE/47sX3VeJr8cpXBvvh8k76+AUcCxZzhVqJ1KJz3KLa9YO1eb+zevcPL?=
 =?us-ascii?Q?DwrI7qcyYWQiYsgDalVo4OgQiBi8WfJRJfrEhSrwVV981pHtOBA6haG+DnH2?=
 =?us-ascii?Q?KVTSJpzyeX1eSY4+DNrL5UibPnAyLBmQWG2JKXrfjFo63Twz8SsYncdboWJY?=
 =?us-ascii?Q?BGILyNRVebR5BNpEZFGY97QGMUzV9IdKhk3RI38Y7Iaow3wA34fXOSpn5Awm?=
 =?us-ascii?Q?OXRk60CF35R/lDs9Qd5WkBl8UrDzny+FFi+WiIGriXAsIqaNn35Slo9CsAEV?=
 =?us-ascii?Q?hQmQLIll9VN3UXP6gFUXi1TZwUlDbQTHdRYIhpfPj2D8udBAFZB9ZhpspmDo?=
 =?us-ascii?Q?tG0zU9d/BF3lGC8VSRalFNF3C09gkb2J6KinPm/ua2JMMbYg7ENVcC260EPB?=
 =?us-ascii?Q?FWs61wU8luPvI1ASWBy0uZayDvkxUReZNhYc5fg4bTa9HOVZDtK/p9nAgpfy?=
 =?us-ascii?Q?XI4kNyV1f0fWFrH2KEFjcvenkeugWCKRzWqUPFjA4kJjdOl/p9rmQlHrV9eT?=
 =?us-ascii?Q?0AeWnJ096x7m0BUygJtA33wOLp9N/BMhRNOkFStPKXuWvgj5fB5MN6r5FTEj?=
 =?us-ascii?Q?cYQu+smz57IGxghSn3LBkmASoXL1jRM44r5BMTx7eOVHQnQu+/70UWVfStb8?=
 =?us-ascii?Q?KOfVJvj/cETOuoQJ0qvtSfGoD9idXdfhMxj8RLlGdNjKSaDrloUGX8XtHsNp?=
 =?us-ascii?Q?lKCpDv7Js9EWOgCnv02JUFnyRJ7T70+8ArUssDsrFTqNhQ2mTIJ5NMj+96c8?=
 =?us-ascii?Q?VRpDe8+p/BFH2ABTaGAiJRcvdjxNBY99iP7Oq1W/46PEUM0CdqnwlRU0t+uo?=
 =?us-ascii?Q?JQCNWKKVKmxZ8om+BfHbkDonQyvBQKTEzP2lP9pEuwT9K77ZzngloUA0N6mg?=
 =?us-ascii?Q?MZnXxgRVq4CYqNAFvNVUXLy9LKL0AUbrGFnlufTfIgNv7YoRicctOamxOXCY?=
 =?us-ascii?Q?mpTpdXROiYpneaNNpLcYswMrxJuIOt/zorCzv0aujlo+CFc0aUVENQML+nLB?=
 =?us-ascii?Q?FjRYwuqk3ks1IM9fzrcQMmQ88s03tpOAqOQDffbNTM5UNSTNh7FpreNZA+ol?=
 =?us-ascii?Q?Jn3ZiAk8+GvmTAqo1mVWwtYxUOCrmxrpWEmipa3kvJian+GXWpYja/fbdvnI?=
 =?us-ascii?Q?Hs0kPVGCRM0e4FpXRHCCeE/edtxHPfzNrDjwELyWg4X0VOdzFokqIC6Pvs3t?=
 =?us-ascii?Q?b6/Yo0p52vGNaQO1bY+LRaQUELV52jSx1KZvbx25yzGDSg6bfFOGnomsnIXu?=
 =?us-ascii?Q?4TzuwYvbczuKBr8yCWuruNX/isBcPFhlz7sH6kOrHRHtZX3jF0hmsmhueoB8?=
 =?us-ascii?Q?Be0AIH3pFAp1ce+oEK+xngCeCsPKiPZ1DOHjLOcIdZJ3wSba4Hu5YAoj5piP?=
 =?us-ascii?Q?6CR2sfZwr2pNPqfEQGMxRz00xcJiMNUyBBAM6R4SZJNgnqfxV7kq3EDdvHxM?=
 =?us-ascii?Q?jA1/i/Aq8Iuu+8FV0Le9swlLaHpFnSMQgwch?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UumAMCNA6KaXSEAbRLbxqJL96bdVsV+oZRbJ81ajRFWB8u2qIivH1X0/VwU1?=
 =?us-ascii?Q?BVQABzVMIEf6zH1/j+SO23tO4z/N4WaA3glRhXnsiNodKx6qeCR8wHZ1+sDi?=
 =?us-ascii?Q?QLSvZmj0MslxZfJ7ktgxQige8J9QOSOS4ksXllYMQMSX4HZWDdzQCLJ6Hfk6?=
 =?us-ascii?Q?zD4+UljMZ3EauUhG0oDtrwcW5lcQXn9HpxSSd94th95DbQWogSWzJUX+w4AB?=
 =?us-ascii?Q?/LzzXVFVVvt5HzKEQndhYl57cJ0r8KK9JRpJKAeYnBgFTBQvwBKWCCzvkxIz?=
 =?us-ascii?Q?a8mL8FegmOtFR3nT5YThYmL+9UvbVBrnTjVZVA29wrEYzsyAEMma3cP7mxVE?=
 =?us-ascii?Q?eZAJ1uasoVDF1BFCsGK0WvKh+K8ueYKDnYKqPSqCQIpd8wKOnRDqV78Rafmi?=
 =?us-ascii?Q?jcI2p8D/i6kHX7oG0/Bwsn7Dz/N7CB+yG8qq8kgrSXQTRykejoce8V8/F15/?=
 =?us-ascii?Q?dASzljJgxKbUH4kMY4f+czmXP45fXo32HKpZKuWodapgW5GWrBJsoncjMqmW?=
 =?us-ascii?Q?Z8OHVqBiCfq8v0amrzb58lsXQSvbwQhz7sgJVkG9iaFsCUqcHkITSg+A65fV?=
 =?us-ascii?Q?QxqbOPSbnKrNNlsF3pyxlU/5XHAYp+kSlDkKoco7QuM4dzBPmvedHLkdfvWE?=
 =?us-ascii?Q?3bBfbY1VPd03JtarLe263pi0THtXoRHwoT/iURZPRLkFV6oNy3Q8cIXotXAB?=
 =?us-ascii?Q?tEHTx5kTUI/ep8xRgltTOF5KeunvSENrZlD/KfemXc2l5mqfNTIFbe0JOtt2?=
 =?us-ascii?Q?FtNsy7nDxtK7PRBDO7LO6rdHJRQX4Wk/cDXicj8o8GbHsMoOnb1i26VPyz0h?=
 =?us-ascii?Q?K4cWEdHWYMsRKzWZB/5a/uzXEbxxfFCSkR139MfXgOFueFS6OvANpT+TyxTb?=
 =?us-ascii?Q?6pJFAcer9fVYXu2kSGwOrm7hWfVUwAU2lu2EL8h09hdjVWDIY9lHnKL0nDoA?=
 =?us-ascii?Q?xDGJmFiI1kCFiWgA5L4uDR4lmxHQS5IeydlbPn5dz+5VpeVB+yrIquR9Rdzq?=
 =?us-ascii?Q?EZ2Nn9B0+QUFK1d26EhIoHJcFaoF3fkAWnI4/G0VxclwMucS9p1MFTjx4Ffh?=
 =?us-ascii?Q?EFCRvicN9GjSMAiwDJB69o0dkZyUTyFjY3BZCP21bQrZe9qaMltabyITIDbY?=
 =?us-ascii?Q?Rmi3s86cCuYH1Xk1Ewbx9rBVXPmYhPKEjBn4OQJeQvWgjSnMOFjqGIkiELao?=
 =?us-ascii?Q?M9ia2o6+7r74XOnbWkLtHHSNWh0kPTRWe4DeKZ3LNhWzGucRVMYT3j/GHoBg?=
 =?us-ascii?Q?Zup2M2sw9QCyNimmFa/7lvlF/y54ru3kOtWxIls39VPAx8STzPmRTTTVQE9a?=
 =?us-ascii?Q?ycV8zgVLaTzPEZKrfBFSmRors5y4E/WKM/QzgxsNDa/y6/OIps/Qpb7+9FZH?=
 =?us-ascii?Q?1wyUwd0L28jOizjyMPEQebpODA1nIK4lcpcHxebmuuNba/Aq/k9vb/3UTXgS?=
 =?us-ascii?Q?YRHZZ1oXnAHGGev+n082hvfo75PqwRg0qEwNM8KQfGva3wm0d1gbDR9shIEO?=
 =?us-ascii?Q?Bq1lF1u/sIDF6EnJF0xRm5dezcRxkXqKSvkB4XCQdtAWdbF3YCLNDpFKz2sp?=
 =?us-ascii?Q?rXJQqHSq87I5N0KMk2CiLso3rD01bQCGiJ+1bzMkZzCooAGPHM+9jzcZzu+c?=
 =?us-ascii?Q?Is+HnNCyrDd2Yok+DoAEYa8u0HDfwgGTsNwJ/a3hwKi6nFR6vCZnCuptkJTX?=
 =?us-ascii?Q?nQgvHEmIpeQFTiiNOw2Q0ZB0KMMInsJDQWaKm7Lw1ikbTcwevhCCRu1noTp0?=
 =?us-ascii?Q?ZnVwyF27Pw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0de619-4252-4b77-eeae-08de41371e24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 08:50:12.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TsGDaeomHpd2QatNbpIHY1cs4yiCO93O6JAihh3SIBlGDdIhLOBElVES7qeShvlnBLoDXq611UcJMf8+iYvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001

From: Ming Qian <ming.qian@oss.nxp.com>

Replace vmalloc/vfree with kmalloc/kfree for allocating small
driver structures (vpu_inst, vdec_t, venc_t, vpu_cmd_t, and
frame objects).

vmalloc() is designed for large memory allocations and incurs
unnecessary overhead for small objects due to virtual memory
mapping. kmalloc() is more appropriate as it allocates physically
contiguous memory with lower overhead.

ftrace measurements of vpu_alloc_cmd() show significant improvement:

  Before (vmalloc):  35-72 us   (avg ~45.7 us)
  After (kmalloc):   11-26 us   (avg ~16.8 us)

This reduces allocation time by approximately 63%.

No functional changes are intended.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vdec.c     | 16 +++++++---------
 drivers/media/platform/amphion/venc.c     | 20 +++++++++-----------
 drivers/media/platform/amphion/vpu_cmds.c | 15 +++++++--------
 drivers/media/platform/amphion/vpu_core.c | 11 ++++-------
 4 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index c0d2aabb9e0e..7a1c58cac02d 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -9,7 +9,6 @@
 #include <linux/list.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/vmalloc.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -17,7 +16,6 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
-#include <media/videobuf2-vmalloc.h>
 #include "vpu.h"
 #include "vpu_defs.h"
 #include "vpu_core.h"
@@ -1642,9 +1640,9 @@ static void vdec_cleanup(struct vpu_inst *inst)
 		vdec->slots = NULL;
 		vdec->slot_count = 0;
 	}
-	vfree(vdec);
+	kfree(vdec);
 	inst->priv = NULL;
-	vfree(inst);
+	kfree(inst);
 }
 
 static void vdec_init_params(struct vdec_t *vdec)
@@ -1909,13 +1907,13 @@ static int vdec_open(struct file *file)
 	struct vdec_t *vdec;
 	int ret;
 
-	inst = vzalloc(sizeof(*inst));
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (!inst)
 		return -ENOMEM;
 
-	vdec = vzalloc(sizeof(*vdec));
+	vdec = kzalloc(sizeof(*vdec), GFP_KERNEL);
 	if (!vdec) {
-		vfree(inst);
+		kfree(inst);
 		return -ENOMEM;
 	}
 
@@ -1923,8 +1921,8 @@ static int vdec_open(struct file *file)
 				    sizeof(*vdec->slots),
 				    GFP_KERNEL | __GFP_ZERO);
 	if (!vdec->slots) {
-		vfree(vdec);
-		vfree(inst);
+		kfree(vdec);
+		kfree(inst);
 		return -ENOMEM;
 	}
 	vdec->slot_count = VDEC_SLOT_CNT_DFT;
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index aced76401b69..9e5cbc2b0d3f 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -13,14 +13,12 @@
 #include <linux/videodev2.h>
 #include <linux/ktime.h>
 #include <linux/rational.h>
-#include <linux/vmalloc.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
-#include <media/videobuf2-vmalloc.h>
 #include "vpu.h"
 #include "vpu_defs.h"
 #include "vpu_core.h"
@@ -844,7 +842,7 @@ static int venc_get_encoded_frames(struct vpu_inst *inst)
 					       v4l2_m2m_dst_buf_remove(inst->fh.m2m_ctx)))
 			break;
 		list_del_init(&frame->list);
-		vfree(frame);
+		kfree(frame);
 	}
 
 	return 0;
@@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, void *arg)
 	if (!info)
 		return -EINVAL;
 	venc = inst->priv;
-	frame = vzalloc(sizeof(*frame));
+	frame = kzalloc(sizeof(*frame), GFP_KERNEL);
 	if (!frame)
 		return -ENOMEM;
 
@@ -912,9 +910,9 @@ static void venc_cleanup(struct vpu_inst *inst)
 		return;
 
 	venc = inst->priv;
-	vfree(venc);
+	kfree(venc);
 	inst->priv = NULL;
-	vfree(inst);
+	kfree(inst);
 }
 
 static int venc_start_session(struct vpu_inst *inst, u32 type)
@@ -1067,7 +1065,7 @@ static void venc_cleanup_frames(struct venc_t *venc)
 
 	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
 		list_del_init(&frame->list);
-		vfree(frame);
+		kfree(frame);
 	}
 }
 
@@ -1151,7 +1149,7 @@ static int venc_process_capture(struct vpu_inst *inst, struct vb2_buffer *vb)
 		return ret;
 
 	list_del_init(&frame->list);
-	vfree(frame);
+	kfree(frame);
 	return 0;
 }
 
@@ -1309,13 +1307,13 @@ static int venc_open(struct file *file)
 	struct venc_t *venc;
 	int ret;
 
-	inst = vzalloc(sizeof(*inst));
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (!inst)
 		return -ENOMEM;
 
-	venc = vzalloc(sizeof(*venc));
+	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
 	if (!venc) {
-		vfree(inst);
+		kfree(inst);
 		return -ENOMEM;
 	}
 
diff --git a/drivers/media/platform/amphion/vpu_cmds.c b/drivers/media/platform/amphion/vpu_cmds.c
index 5695f5c1cb3e..ab69412e0aa7 100644
--- a/drivers/media/platform/amphion/vpu_cmds.c
+++ b/drivers/media/platform/amphion/vpu_cmds.c
@@ -13,7 +13,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/delay.h>
-#include <linux/vmalloc.h>
 #include "vpu.h"
 #include "vpu_defs.h"
 #include "vpu_cmds.h"
@@ -84,13 +83,13 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data
 	int i;
 	int ret;
 
-	cmd = vzalloc(sizeof(*cmd));
+	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
 	if (!cmd)
 		return NULL;
 
-	cmd->pkt = vzalloc(sizeof(*cmd->pkt));
+	cmd->pkt = kzalloc(sizeof(*cmd->pkt), GFP_KERNEL);
 	if (!cmd->pkt) {
-		vfree(cmd);
+		kfree(cmd);
 		return NULL;
 	}
 
@@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst *inst, u32 id, void *data
 	ret = vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, data);
 	if (ret) {
 		dev_err(inst->dev, "iface pack cmd %s fail\n", vpu_id_name(id));
-		vfree(cmd->pkt);
-		vfree(cmd);
+		kfree(cmd->pkt);
+		kfree(cmd);
 		return NULL;
 	}
 	for (i = 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
@@ -118,8 +117,8 @@ static void vpu_free_cmd(struct vpu_cmd_t *cmd)
 		return;
 	if (cmd->last_response_cmd)
 		atomic_long_set(cmd->last_response_cmd, cmd->key);
-	vfree(cmd->pkt);
-	vfree(cmd);
+	kfree(cmd->pkt);
+	kfree(cmd);
 }
 
 static int vpu_session_process_cmd(struct vpu_inst *inst, struct vpu_cmd_t *cmd)
diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 168f0514851e..85cc4a14f8ed 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -17,7 +17,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/firmware.h>
-#include <linux/vmalloc.h>
 #include "vpu.h"
 #include "vpu_defs.h"
 #include "vpu_core.h"
@@ -265,7 +264,7 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
 	INIT_WORK(&core->msg_work, vpu_msg_run_work);
 	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
 	buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
-	core->msg_buffer = vzalloc(buffer_size);
+	core->msg_buffer = kzalloc(buffer_size, GFP_KERNEL);
 	if (!core->msg_buffer) {
 		dev_err(core->dev, "failed allocate buffer for fifo\n");
 		ret = -ENOMEM;
@@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, struct vpu_core *core)
 
 	return 0;
 error:
-	if (core->msg_buffer) {
-		vfree(core->msg_buffer);
-		core->msg_buffer = NULL;
-	}
+	kfree(core->msg_buffer);
+	core->msg_buffer = NULL;
 	if (core->workqueue) {
 		destroy_workqueue(core->workqueue);
 		core->workqueue = NULL;
@@ -308,7 +305,7 @@ static int vpu_core_unregister(struct device *dev, struct vpu_core *core)
 
 	vpu_core_put_vpu(core);
 	core->vpu = NULL;
-	vfree(core->msg_buffer);
+	kfree(core->msg_buffer);
 	core->msg_buffer = NULL;
 
 	if (core->workqueue) {

base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce
-- 
2.52.0


