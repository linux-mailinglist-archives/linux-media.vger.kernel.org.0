Return-Path: <linux-media+bounces-37594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D5B03889
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11D1179039
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09140238C26;
	Mon, 14 Jul 2025 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="X2WGoDp6"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012058.outbound.protection.outlook.com [52.101.66.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C331DE2D8;
	Mon, 14 Jul 2025 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479997; cv=fail; b=ZWp4W4rSrtY1ddmrMFPSs+S4Aj00yMOjzk7NnLY1Y9LjXO52+YU6seQeZCCE0pV5RJoXG7EM7CDpSI6af6eqh575tZ0KrvhwPsZ8bDaosAf1VlT2kkii62Co/umOIq9SwC0gdGwiASW28UtAPjR38kzYBFF+dr+XUKstQzNciT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479997; c=relaxed/simple;
	bh=RVyegvtPtAFiYnZO/nPNK7Ka8EHEqPO6tzX4Hnv+Cv4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WpnxH6jjpbOKAyqpjJQOkz+mc4Q1ONpCLBK0d85WJJXgXx+WnotaRpsVHg6BQDZ83+WAR4moNeaTCUlIVRPNIXiQPTfxJ+sk8VQPa+obvLC2LzoC5EZ9YtM6pTfS7LXG9cijNRk/6kLtTSiyIFbfPSzsBgXxZXto4BSxC4kzaP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=X2WGoDp6; arc=fail smtp.client-ip=52.101.66.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZdt06dT0DLSyLzMdVr8k993tPOGNRpCLQwxCJa/mheT7XVtfYAIbgjoWzYYfnXB4uuuUPZBnyjsf0+qzGjZNsEjdg40+7VDM7qFF6ZYtPoAFPqioKTRvGL0aeXheIucjzesmh6VeqPF0ROTuQ29pruE+hj9aMuqfshUSmrxLRMq6jjMv3zrw4ePGWHo6qhC1LUAap1L9L8NE583LaoALy9UHhV6ASyfnl6Jmq6KKt0HpGG6Z1F7rHSg731r5azqPlMe2J00av39VNVq/blAf+pFQRlo8QZ30UrjTK58oiXLyje+Oeh/22oSOLOm+AkDOsAU+BU2nzKVOOb+oijpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CblBdDbJiPjzR8sqWl5RqqhXU9zYkZ0HT03JSvEoMfQ=;
 b=NqIJhgl0YVgWxDsa1sSlLmd3tybIAY8WJKVSGE++cKWdu01HLj5E3QTIL8CP2ouMj2Tlakg2oBauyBowirMlcFKk0q4jJxRRrdpLMA6lAW8+NQXNtRVnW87eqOFMgGxOfW1Bu+SJl+KTvIRscxC4ZlHXByDy/ODdT0vyBJI6sY8Poh70TTQZNzhKfCwVjaPvmDW0V9JCJLEzRZ5hukyQxvwWzwquS1NrZP1jVfJxD1yWMIW93uXU5shmpMPO0WnjGvkdo5YIWzntcrK7h8EU56TzxYMIjirOe8j0jPSruUa19Jz/E+Y1q2be//OkrUDft5jVJmAb6Ra6SGGDf+pI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CblBdDbJiPjzR8sqWl5RqqhXU9zYkZ0HT03JSvEoMfQ=;
 b=X2WGoDp6BdwvBszOjUegNK3N9yHhkxtS9dD2ePiBeD9PJPK7HM9+nxyoh1/N/4TO3fDEthe+JgiXFM47tmDm2g3Mqcqwkvclz3gzgBXb88htUX6rYKjAMimtw3AyIjNFWnEjv5EygE4FJ/qLCHhy0Zr8Jt0BqCJ8dx3b/CHkTTYtFtinSXyfGMmE4NtzM+uM7zvOTCkMzGRZ6LufSM9/dN7jwkWxwiSBJ61VBjWMS9UnlkCrB21dv7ZgpQ8+b5ZyaVorZfmq9eaMithVjbFkuEzAWbN23nNJccfRiCw8S6vcdMHoTDyO0STuroGtC1p9vu0AFUFbIOk5DWVwVaGyfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by GV1PR03MB8837.eurprd03.prod.outlook.com (2603:10a6:150:a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 07:59:51 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 07:59:51 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v8 0/2] MT9M114 driver bugfix and improvements
Date: Mon, 14 Jul 2025 09:59:25 +0200
Message-Id: <20250714075927.511610-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0068.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::11) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|GV1PR03MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc49423-8bd4-46e9-d67b-08ddc2ac694e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5+LmHttl6Cf1QPAac+4iTmxOZeMaX5ZY3BZI6vMu9RDDyZm23JRbri5uA26y?=
 =?us-ascii?Q?mY+HEbfXjFi0IFcMzm8rkmc9Bfd58iKSYf7MkrIprJFHDyE1bWXDiEvli105?=
 =?us-ascii?Q?eQPebVjsS1cpaB7uOATrOhY6HL4bh1/bWO85uZh2OgLsaHf8qIM6kWT87Sce?=
 =?us-ascii?Q?vVsp2FKtLAfzRlbCNuPcWed8ZcoI7TmuxQizj4nB1RH1fvko3y3BNtUzaxDk?=
 =?us-ascii?Q?aSkZzopGaNL9Y492n+838JZR+aRhcHnjHQSV2N9KfLLbggbPYzvSW0gqHnjw?=
 =?us-ascii?Q?djkjuexvD/L8FxnBotM3maT9FDxsg+kEHQLjW30r+ANTp/MsJ2KLi/QBxUUY?=
 =?us-ascii?Q?Llvhgl5xww3m/OfnENXct7J7gg66LhdDXyuU/+NPutfAak8m8i4FH0yO4lkW?=
 =?us-ascii?Q?/gmO3rosMQ+WCGdf7Z+MovAr11rBQ8jAEbXBY+wuKG9rCxbf18Ec1DJl5rEl?=
 =?us-ascii?Q?+shCrcRIkH+IDJ2QEtLZZg09s4ZFVaxGcdYdW35rHeKvi0ASdGbMYC9bh5UI?=
 =?us-ascii?Q?upStolx4IdVV5+3Mywx5nxsmQcS/BciEpLfxz3Trnf7BjFaufi8PWkhTNMaz?=
 =?us-ascii?Q?smPXOd8XNU7x5kTnTmTjdGiFAbLtdRZ/JWH5729N3N/xYGXIenmPyXYrC2e3?=
 =?us-ascii?Q?XdELQMuBMu5jYUZemQIS8kWuoRNswgFUeWciE43sFzefBxbi9N7iJSJ2LRvG?=
 =?us-ascii?Q?IWqZdLJNSogD2JPER0xe//laibyZTLQrSSuoS8Z8VOAl/h/jOwQt8iGMVnve?=
 =?us-ascii?Q?+SsBVxc0Npcf+2FGkpY+Nb++oFUJoCji1mkD0XpF7H/K4yH8tyqVqsRsxLaD?=
 =?us-ascii?Q?HfhvwhAWicchH1tWHMrE1y0NHuhdKUCSuXPH1x9xvPdg39MA2gAjxREX6rBb?=
 =?us-ascii?Q?+YehbJhPNI5m+elgrNcRBPH33EY5qqzMpNYZapCvWljjj8RGyP3i0KpBNwT4?=
 =?us-ascii?Q?Zv9aQVJyjUyDS+a+bzvarF0vgHSt4WDdVId/dBpeUIKGvbyTjkVWohYmFqjO?=
 =?us-ascii?Q?m2i/3eRgfUmmH1Sks6Q+n+nqp9mTHyQ7AIdspT5JMwgkGzkeSLdRJZkV3BPp?=
 =?us-ascii?Q?iM1HalhgOVmZQMXJ+OmP+b+gfErMImeCficCaAlGJEQZXVIW6mOo85txe+k6?=
 =?us-ascii?Q?ldFiRKFWgujUzXIClOWdZH3fJinw3vV1NRjRfWxQoQR9sKR4ABiGjrhhPV+w?=
 =?us-ascii?Q?2/Xg/h4ShCZbNAza6dO0iiWzMrdqWSoouIM1hoWW53JijexkMk3d5scP22qd?=
 =?us-ascii?Q?57/K9x6jAqFpLUjZo2zr5zTPG+J/CoeAHtFWCiPiSeRGvIL74/zQw88vlTjq?=
 =?us-ascii?Q?iL+gEJPBwsshrwGNzJgG1OouoSyqGI4ZaKNH15UiiRaoqifpP0e0zkOjkR8E?=
 =?us-ascii?Q?916tIuthu4ywy6Ju9rlbUNPqdJ6bnKy4t8ROHDY9kkqManuXUilpHkSRTlxD?=
 =?us-ascii?Q?Lu5c2QajhhlzXOckJeA2pJqBolAJ5kcne5vBCNiQA0BeAl/Ib29LywBOA0MF?=
 =?us-ascii?Q?JlM4bnu/R0/J8S8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2J1/hiwKbO6alKTQrfN4j+hSwb1GOzrg7eIbxSd7vLc1YdH/5SDFkmQxKh63?=
 =?us-ascii?Q?cu0e4eV5qGWhSGNE5dvZedGXCnPJYpBxTn8g6DudkWQRZfarvvipF9lehzuq?=
 =?us-ascii?Q?WS/NWXZZzxUp5hoM1bMFdPwyL72zbluUAvDf2flr9D3lDUoJgK9UKcSbXiXK?=
 =?us-ascii?Q?1fuRGhWEiaZp5ZFhvwrk25OO65uhYaxQetcBsdggPe5a4E0bLZaSgF/h9ewF?=
 =?us-ascii?Q?tSSw7qhUPUQbt+8HNb+RVMQjvKfzE8TAQLu407LGGfkrafjg6MgKyzR4THLr?=
 =?us-ascii?Q?nkr5y1V+X3E4nfC5FIgToyo5YKMdhabGFFtibYuBZj8doreMCXmVC1oRXuOQ?=
 =?us-ascii?Q?6cYuLiPLcAYMt0RdmWkkBAAyb7tCo5eeDZuaeUzNZpSCdGmvl4FJW3vBaq1X?=
 =?us-ascii?Q?Guy0JxKWYyWUt3yAQmSggyGqFkhZCxqsBjWyk3LBdtOA4oLI9B+flNMJ+/OX?=
 =?us-ascii?Q?UOTf8sxSvO/kdOUexsYlX0qjivhd99kO9o91rbhY/mDOT9xD5UKQyNH6ottR?=
 =?us-ascii?Q?zcaf2wtSJBpnbu6e0rfjgy/sBTsclorUuPXsy06aMaELnFUoLF3k6D31x7yP?=
 =?us-ascii?Q?ylkz1bHiCFf/3/FWPUz3CBrVaVEDcyaH9C3MjMgZylJ+g8/GHijjpND0n9K0?=
 =?us-ascii?Q?N1+6Rpwx7LbLNcNZTHG75jVvFN6fnwBfvwa7MWJCnaZ3qtN/hhyJT2DcIG0t?=
 =?us-ascii?Q?ltojPS3oghl95TjmnAIgX+48FODy9Tam0MeUYrJEbTWTDoeXtFSRgW8EyBV5?=
 =?us-ascii?Q?0fjx5uGeP6R8IFlZ85DHH+pzzGIu+qTgNCrN8Xh7t7bh2CMRMCFW3jhEAJXg?=
 =?us-ascii?Q?TE8wQheFQcMqpRKe8vT5by2ftS67YLTZzPlcxaiOmeQJKYh0EeCDdmKzsgiC?=
 =?us-ascii?Q?juEqdZWWRHA6u5QPxp5OdoIHU0A6HaJmYARzfQAlmguT5DTXLDAw5tPyvxHN?=
 =?us-ascii?Q?p/nYiXwNXHQEZDfnDveHaZ0yaRkJcLeeR+i6fty2xVyY5vIzWhZfJZWICskB?=
 =?us-ascii?Q?shxQ23FzL7mdiZcs12FrcP/S7vF2pFDAV6f7A7kVGUgJ62il53kUx7MxYDlI?=
 =?us-ascii?Q?/ieB6Ba/f0KJa+TCBCbKehw4LUeJqVu2n9ELmru7IKdTpBkCzdSafW3q5IMW?=
 =?us-ascii?Q?8HmX8yxLP1A90vPqLyhwPBG5Whx8rRumAkbfr3Tdi/7loiLufE6j/Ah5Ax1/?=
 =?us-ascii?Q?KUR6ejlpCN8+LhYyWbnlcCBPE4HxX+1rhjKRI2UCs/Y5gzpNz2WDsaMZ9C4F?=
 =?us-ascii?Q?JmALj5OvwfqNuppTrnreo3n40OSlkwnGiy+GOPeBTa61kru2bFJcUDbwe7XJ?=
 =?us-ascii?Q?gZlb5cszVFNmnj7ltBYzx44wA7uSwPo10Zhv80+OoxajCiGDKAE354l5mkvO?=
 =?us-ascii?Q?7ctfv7O1bvr0XDs0YnyPXenmpMv3NTGlq26ASSPAvCZFxdImHwBcTBHOv1HC?=
 =?us-ascii?Q?CvyPWLz6ZIn9phsnSBBrg1Re1eWEBz6bHIGpcRIBZORwMCFRo8MI5XyRHWVK?=
 =?us-ascii?Q?h1kJKhWqJHD2kR+DJwx482+/H6zmC0iGJ5grpMRLr9+WQnZPblep7x4mGtGL?=
 =?us-ascii?Q?1/mrSkBjVwAYAMb/qwJNbRyt7SxreXMn3fcR2cWQ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc49423-8bd4-46e9-d67b-08ddc2ac694e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:59:51.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUX8tmEPiB3zCojgHJKShTO3oU8CrmgVy6fNlV6CJxmVEiOHybBJclw9CxNTcN0fpLtdOL3ID5aNCUPa7DaAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8837

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:

v7 -> v8:
- Add missing braces in 1.
- Fix formatting issues as suggested in review.

v6 -> v7:
- Remove already picked patches 1, 2, 3 and 6.
- Remove patch 4 as suggested in review.
- Fix formatting issues
- Return -EBUSY from mt9m114_pa_set_selection if the cropping size changes
  while in streaming state.

v5 -> v6:
- Add 'Reviewed-By:' tags. Sorry for forgetting this in the previous versions

v4 -> v5:
- Apply reformatings and small refactorings as suggested in review comments
- Split PATCH 4 into two parts: One for applying HFLIP / VFLIP while 
  streaming, one for applying set_selection while streaming.
- Add condition to apply set_selection immediately only if the size of the
  cropping rectangle does not change in PATCH 5
- Use device_property_read_u32 instead of of_property_read_u32 in PATCH 7

v3 -> v4:
- Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
  requested in the review comment.

v2 -> v3:
- Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
  Based on the comments, this issure won't be fixed in the MT9M114
  driver but in "imx-media-csi.c" in a separate patch.
- Renumbered patches accordingly.
- Fix the incomplete renaming of the DT property from 'pad-slew-rate'
  to 'onnn,slew-rate' in PATCH 1 and 6.
- Fix checkpatch formatting suggestions in PATCH 2 and 6.

v1 -> v2:
- Fix the subjects of the patches
- Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
  detected if the PLL should be bypassed.
- Renumbered patches accordingly
- Switch to uint32, add default value and clarify documentation in PATCH 1
- Add 'Fixes' and 'Cc' tags as suggested in PATCH 6

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
Link to v2 discussion:
https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
Link to v3 discussion:
https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/
Link to v4 discussion:
https://lore.kernel.org/linux-media/20250307093140.370061-1-mathis.foerst@mt.com/

Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

New Features:
- Bypass the internal PLL if EXTCLK matches the configured link_frequency
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration while the sensor is in streaming 
  state

Thanks,
Mathis

Mathis Foerst (2):
  media: mt9m114: Allow set_selection while streaming
  media: mt9m114: Set pad-slew-rate

 drivers/media/i2c/mt9m114.c | 69 ++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 16 deletions(-)


base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
-- 
2.34.1


