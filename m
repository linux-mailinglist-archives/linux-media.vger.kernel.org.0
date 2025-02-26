Return-Path: <linux-media+bounces-27075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D92A464C4
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1118A189C3A8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377EB227E84;
	Wed, 26 Feb 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="D+rgpY7E"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC5A227EA8;
	Wed, 26 Feb 2025 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583655; cv=fail; b=Y3YwfgAo+TpPDKCJoFYMU1Fzu04nL+UI01n6F6OTNDEvn0HtuXt5wMLgriRjY+g4pHZ16sdFT6cjiND1cY35yb9MMxHNx1V868Yww82FpDObxSB6ZMLBq0Oai1Fe+0dAl2QbRzdo/E/1h/zWXx7VV7I2cIUdA5zJ2S/hGYoVBX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583655; c=relaxed/simple;
	bh=9DWDlHAmyd0VJNycd3ZXUthqysKNwhsejI1DQdf3ELM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N2Kojfm1OlBElscgThNDEbH+rlujo8Oqz8k5dmgt1LuNm9h4vQ1+9X/HMUej/FHPhNSigPI/8ImYNH5gykGF4wDn88ibCnHiNwNBnViB9R81usDExEs6BMNsMTKKpkNFwKyehU29lyPBaLLWsfrxvLQQjIkCvxn/X+j9XIaQhis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=D+rgpY7E; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLFBhxRSR9ZZKlLToEgMhCpUugclAY6rKO54surjikLWYi207yIedY472aUFa8D0PbrHftv0aLhAJKVT3bj6UYRuvYp1TZIHZIRXadEnG1RwOiXWPMhMgC6My8dtpeza1DD768QI+zLasry1duRYlv4HKPKS9CrsPC/YdagVWBVFLdifW08AR1YOKGnvXlHmbqY/yi6RpH0AspiHyN+pVfy3UBFoP8K8hXmCXaVxDGzKp/T7JzWEVA7XCPPxbRc9DaJkhArxH8k7qI5HWg/XwcE7xvQ3v8lCJ6ZWJupUtpj39pBj7P2W+RI6NJ2yZP1APHWrnIZgLFXBIyTUhckEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9shOnHi2lLf0mwVZQ0UKci5a3+D8SHoLbf0tvXU/1es=;
 b=NeZyfpbnhVNycnksoukCfuOIN2hiQnBopDxiw2PMh1FWyZRVxJGCewk3Kpvr5k6822lB12oe2N54laBsa2lVKJP4MIwN3dD7QpB5HN87fnEg7wIpMnVt3HwEzzZPtBoBMknZx/aiiRodFN0zlHcJUnptSMXV7ZZjW72X3BYJQlD3oqoRrgPwdIbEjSNXrhM4zKpqGBQYDNsoMmozg/Sr71hYDemlIU3omwoykK+fiHpx2qB0fIXeDm6828qQZRWreqOnnFbQBnsXSsEffi6y2FYm6qLqgnUc6uJmuZXXL0JhcCsSvua9FNS3+dsBjyUmUkZ/A7lqZypNSm4nwCw5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9shOnHi2lLf0mwVZQ0UKci5a3+D8SHoLbf0tvXU/1es=;
 b=D+rgpY7EzG9kM3zqzrXH+etKaDoML74Q3RVjQhcjcVJBnxiPWSDlfFlxcdX30hqUOewCFg3eXg+EyZnCoVxXU42/ugQVsaizaXdIm29m7kiS7HOEKNSoID5mF6qa8bpiJrK2fwFpWQ7gz8zanK8tO1TEyIY/w/sTK0RxYLvwQow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB9826.jpnprd01.prod.outlook.com (2603:1096:400:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:27:31 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:27:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/17] media: rzg2l-cru: Add function pointer to configure CSI
Date: Wed, 26 Feb 2025 16:23:40 +0100
Message-ID: <20250226152418.1132337-17-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f75829-5715-41b8-a250-08dd567a15fd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7M1ZkleUtrjmBPUtS22MjoT+ZKi4iU5ERjiS8/woL7noUycrSjmZiUm6S51c?=
 =?us-ascii?Q?8JXS5dH8Xm4ahMWIDS+yf1H+HNuiuyRFDwj3wjn8LZ1HwnksJQCogncC3yI7?=
 =?us-ascii?Q?hkLRAZiqRkjBoFopAxo1uLwTer2leRqjvdgipM+ed6t8JCjqdc2jtkOQX3fo?=
 =?us-ascii?Q?E+5B0SR0b/MxdL5ommksRTOxXYX/8J5swfAHD+zSm/tUQnc+ifHJ96LJGNJ6?=
 =?us-ascii?Q?K1+3a4CFO0JSh458nezZ2q+golZddkigKbQUbTDN4fp+Kyxm7RFTHpzvsOov?=
 =?us-ascii?Q?1af9f/o3n+O57VnWoBTnLFov1swjksR/Er+ICKcAyKTyjHbXiStf5mYc+6fP?=
 =?us-ascii?Q?Cg4C3rQ5Pjpfqi0gk64gts6hr0boAU9hwXsIzQWCT4okObHO4DiPmyoHl7ZF?=
 =?us-ascii?Q?HFRx1zdcNAAFncavq6k8/wDLDT+cvF6hHoG5lHVmEEdX9eGeK8UvCZrdNGcG?=
 =?us-ascii?Q?bCQTmR/0oeyc0tDf5y9asCj+9OSTniRoIG4oBxpyE8gXbeKUbcscbBiREbsX?=
 =?us-ascii?Q?xw50ZTs07AmHYKxrc+W3Msila3qix9p48WREQ73g145w3j54flJ9VEemZtwL?=
 =?us-ascii?Q?Ad+ogr3q3h+W0ycuwXCf0n6zPKseR1XMZWb7VO8E424ky4Gpd2GgfV4gh7Nd?=
 =?us-ascii?Q?w6YDDbuY0g6GqRrrYiMvRTklO9lW7pZsZCmWYKJe5ssFBQmMZ0b4SrCdaVdz?=
 =?us-ascii?Q?ueAypn8odo3sbV8gNQOE1sUqrsEl1S36qhcjxrmeJ+qsvqqDcujGTpmvmLlz?=
 =?us-ascii?Q?Txt+u17LuZuOXERdeY91jJiwEtBltGeZB2Rma/dABMiMz19kNJfgA0Z+nZee?=
 =?us-ascii?Q?peE347BuY/+HNYQX3dK29pr5ULhgTZkj2nWfnr3YTGXhIz6DQLZCtQW1NnUr?=
 =?us-ascii?Q?EZIg4Y9+h5acYWejA9F8LDTrENeKMrsnQwsf67cmCmdKnm/OkuiplbqSgAcy?=
 =?us-ascii?Q?DH0h7h3CbgPbc3GcULrLed1gny4VTcwQWPCvX6fAaTQHK4VyHiLZ1pLSI72p?=
 =?us-ascii?Q?0yNaB7HKmfzlU7PENnZpq5eOTJJiRYJdNEh16E8Oh6OoU6nCvd06q5OoPmMA?=
 =?us-ascii?Q?3Gno6w2JzeL59d8J0TL8lFk7oJaKV+twcURVZVL7t5vhSM8XM+btsqiJhK09?=
 =?us-ascii?Q?cW1iKf/HpcG3Mfeij93Yn/fLDIxcxPiMH4cIYUS2IOcOI+1mW/eNsEBWF7be?=
 =?us-ascii?Q?iZwNLy8KYCMxeCryRpeQeTsUptcSMH3qKlOvVJJbphRX0+fx6lXvFr3VRhQI?=
 =?us-ascii?Q?eJhM46sxYuGLUCfo9hTVchA3xFGnMu1TkNsgvkqJNuZudtfAkq0fLf3A9ZWT?=
 =?us-ascii?Q?sCN+8JAu3/bY0783iPyP4sE6q8brP4Rk7KmenAIoGxqxvI7n2yILHk8u9nPV?=
 =?us-ascii?Q?8KM9ljJKult5xV73FupfeuNUBZHc3vddUi9pEVK2U9H+mquIlpwwfHHMJSV6?=
 =?us-ascii?Q?FSdcquGxBhrA9R6mvimyHEg/CMeLOeO1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3G6UqnxQDyCWmhP8NrbxqLZZOzQGZPbyCBNFTs8CuHBST+rFX1AHMFprXJA5?=
 =?us-ascii?Q?nZs/yPBItGpsHmTrRjQzWErotHryx8PPs6JhNUBR2aP63oQyOBxij8c/k0jF?=
 =?us-ascii?Q?oLXWE4a/I8/XdnywBhY34kA9eVmBqDaWTtzcsEqQ+oadOvB9L/FmAJCperBS?=
 =?us-ascii?Q?/X9TgtD1+2l44uqSed6orcQ5zpBglJVs78ItG/uFp6swgsn0qg0reAjnnnKZ?=
 =?us-ascii?Q?o+Kkn28tsmvGR9P95u/THqtSBbYqR1RCdYZw2MbaXudHlmvFjtf6YaYcc2xn?=
 =?us-ascii?Q?xoMP8Kpt+ef45+5R5mtrsuw4DNs0dOKUnf7bHx6a+Qx6NH/0Tb4vLpw2CfwV?=
 =?us-ascii?Q?41s6axp2g49mstjdrxLm0VLMDy3Z2PJA+VTL1rLu2IVbFAJvoPs7HTnrDHBK?=
 =?us-ascii?Q?/+RKDTyimeYJIO+cdlqG3KSaBESpzmJP6kC1jpu6UN5zPg1mjC6A7S9storY?=
 =?us-ascii?Q?P/NHnE5vugParCPfzPfr52vAzaOTbTOrZ0o7/ZVVacXjLmdpHgC7LFbDk1UK?=
 =?us-ascii?Q?903UAlzExaaHg0IdvpxIgMAsCSujXbr3nKBVlVO6oAWg1/KpEAcdoPLw/ik7?=
 =?us-ascii?Q?wQepk8Gr5T3QbqiNkJqRMfs7tyiV1KghrD8vC/hPc2OWcew0DwtCp8OPnM2i?=
 =?us-ascii?Q?W+zWorET0zzdjYZYgRXqUmivaHg9cH6MY+eGPKLKgAajL10NNl3tI6L8b6ci?=
 =?us-ascii?Q?EyeY9H6+WMlGj1Kwq4uroAOCxAtmchypZM6KszamDVn4qaP/vR/Y0wq5gHsW?=
 =?us-ascii?Q?oTRf4x9iQHsAXp9zi2DcsFuKhcYL0v48Gy/2WlGOuelEcimCGX7ayfczQ9/s?=
 =?us-ascii?Q?LXxyZ3WKnp3U2oZoaMY1s87j2hL+4UiHDXitmGltoxN6qBD5Nf4zBSczV0uN?=
 =?us-ascii?Q?+OdMh/d4EUTCJke+V6sfz1lvjFfvxq4DQXGZ0HdFMEbgU4GcsnRJJ7vjjxKA?=
 =?us-ascii?Q?+Z1fo/b0Z0rj5FH+PVZn1Cx9AyAACTL7h3EvnR7ZwfYvq9iGG7UySDqF06x3?=
 =?us-ascii?Q?jMsyk9abIazhz4xOHmSUA1e0cajp9oQPxGiDsXKgn5KpDUKICsPoezNeTz9v?=
 =?us-ascii?Q?Xwp4G/5Y/BuCXkg9gVv3kUEF6doQ7LxP/oiNL/nNxTZChTh6143MWUwtg8BR?=
 =?us-ascii?Q?ESOKVqdfPKusQ1LYe4AV6UjxXPNOaE/CxO2VutxECvnNNJkufFpyWncsrNCp?=
 =?us-ascii?Q?7RdeYRdBzFoxMFCiA1MuF5iQmzjViG0rrolbX3JKb7qRNdsyGDFWC5QNlaZL?=
 =?us-ascii?Q?DOWtSft7ieKY25UBOnAZWjxYkZmoBFkya4Kk47Xt09hMGvbDVBpCtRekNK+g?=
 =?us-ascii?Q?lMVj0UwW35Csh7BWP4zG7VoszTX0oerlVeAYoHudpBJ1PoCmqcxQ1UFUbNrT?=
 =?us-ascii?Q?0iJu5cr2KY1iWv/QABSx3TnxME/ygzAxV4V69zRUpYxh/FnuB2qcFRqjC4pz?=
 =?us-ascii?Q?pLPmdVeCM3NDysoUGKQUpmVBpzkF99p3/5IT+3SjIWOlD8MtQ0i+2eIwkaOx?=
 =?us-ascii?Q?3PNvjxZ860320Vvt/GIF6KvS8vaAKdutWg2kLajboPbLnFrlyZcy+lELzIOr?=
 =?us-ascii?Q?TjDiLUC7HnL4OTItRcfNDrgk0zvQOstmuFTxeBo2HgHOYYE2NvfJKTJXoNWQ?=
 =?us-ascii?Q?R10OCe9cbCgPl6AyBGq//c0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f75829-5715-41b8-a250-08dd567a15fd
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:27:31.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjBWDTagkm0MMxwJsntMOD9xQB9YgZtW5s8fMvlz8uFZ3ITsD+Y+b6JdQSUiA6WGVL/CXF0eoFyRVfiivTi4e/NTaMnyvc5jmnqBvLY4DGfu0xVAhBWrlW3YLTKIZfsk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9826

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
register configurations are required compared to the RZ/G2L SoC.

Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
pointer and update the code to use it accordingly.

This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e4fb3e12d6bf..3ae0cd83af16 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -363,6 +363,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
+	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2e17bfef43ce..ccaba5220f1c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -89,6 +89,9 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
+	void (*csi_setup)(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 };
 
 /**
@@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 83d7baa07dc7..a3c4e2a0bef6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -242,9 +242,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-				 const struct rzg2l_cru_ip_format *ip_fmt,
-				 u8 csi_vc)
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
@@ -266,7 +266,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
+	info->csi_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.43.0


