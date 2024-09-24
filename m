Return-Path: <linux-media+bounces-18488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD8983AEF
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 03:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 109D61F222E0
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 01:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321158BFF;
	Tue, 24 Sep 2024 01:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ATK/TOzz"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2057.outbound.protection.outlook.com [40.107.255.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C4ECF;
	Tue, 24 Sep 2024 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727141845; cv=fail; b=nKDMAdbHstaQxtKSX4q+31apezoMVBTV24QmLTJiRnNTwpFvY+lDkjFz226r6E8X61uFyzMjhxHCmMkdeIkjN/QBDX8OcSXAqD0TD6Hs0dryBXG5edUFQS/PbjzU4isZ6Se1Ij7BLkTuEZ9LMj0WcAjzkQmcC0SFWVEm3HpLnbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727141845; c=relaxed/simple;
	bh=Oaq+DKu1163IHXg11lnZdYofmFthDsQETuED88D6nMM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WpBeh8sQIj3o8/WB4CTKK1q9aL147KZlOwFSjJFTvs35vsNHMjYEjOzWz2SFZHHd1clmjP/zUbZ5Qr9IenvEoDSNjtOJTIwkpOAQn8OdhZGGn+jdkF8V5tkH6BkTF8vdERpFLPHKbNaA66BbuqH3MKMeI6bfNTdqpsMPmZhi48o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ATK/TOzz; arc=fail smtp.client-ip=40.107.255.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CC1Ia6pp9BdJ23MpgpOux3gztfsBvrrR5ofahmwtoGajdxTCsiPCWREk8sJGXLl67SCQemVTk0QN9VfENXcGbns2q0nknMaW/0QlCZIBGgPLtqPeIz7AZKQkI4U/ErdoHkg86NLlQI5S9tvPbFpigsYdvU6TWP8lC76P4SAtIPjN2l12e87xbNHSjhZdciCIE+3zrWKkO8GCGwQSILuTBe1e3QJwULsReKIn2kkEYQSl6nj0j3XttjyytNm8TazhgfrvlUmMb395W/V7g2Va+uY0HtHNQvwElsJlfLvxk1V0wovfzBnnlaNR1zUV9Vq8nyHIWQsHi0lNWk4yFn1ceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3exlML4kgEXs9O29EpZv3Fgly1eJr99SOqJaJIh3sH4=;
 b=SX4Wtnb3O5DrU7/giOeCXHi5qq2oVtvLDDIE/yPwU/wk1x+fZplrcYVpQgsRfRwuEfqPwliWdBJxfneOYn5A26JKJPz/VqWMyZj3yx1evc8AAnftDBDqzryUNNA1sV9jtol9rLMkjaYwNUPBPXlyHsm4fpN5+RX+ay2cj3REFsqp53jhXErPAQTcsEc4vy//wxnTig7GRSG7bOpBP7cVdK2j+DHfV/96JcMMMe0qUe3t9lQ7DKx+CDoKk2rIWkwJQUOp82aYT3c9qJ0fVdmm4iPDM8Mv8R3Zf3coSonndKgwZingFzDwy4AOudoolMP4yn+o5l4RaOtXKFk2JKRvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3exlML4kgEXs9O29EpZv3Fgly1eJr99SOqJaJIh3sH4=;
 b=ATK/TOzz+B0dtrQxvZiY9CNoJ1vMnwyvqWSreKdL8A2D26f2G5fRcOqUvle5NY98QTpvVQotZbIMMaXHGwiGvXFKVuhEmFZIS+rC5DntWZ8A1ny/36pH5a+0md3gLHTbktinom3YuddO36AiLxRwXWEcYEiZw2byiAU3yLEr2je6iF7lvNtkcQLDUGXQqtuI9YiCcbD4LNLw8HRTkAOOXq95wbz5kQDTOEG6gkOwRw7H9ECBPcQdw5x1DzqAMNKe1H1u4nML1Lw/PLprhTYTiRefyz3b65vQxLsFyRCE9nMV1NxYs/fM9hMJQOhU1hW4JSpkhMuDwClnUu48munv3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5483.apcprd06.prod.outlook.com (2603:1096:400:288::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 01:37:19 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 01:37:19 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xingquan Liu <b1n@b1n.io>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v2] media: atomisp: Fix typos in comments across various files
Date: Tue, 24 Sep 2024 09:37:03 +0800
Message-Id: <20240924013705.2628576-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:15::31) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5483:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac42bda-e13f-4121-8853-08dcdc396d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EKr39g0n8YLWrzIlSm2iUmK1KZFdKAEQwzYU0aeDLRjVsYVIOHFrwVOlLVSV?=
 =?us-ascii?Q?WV/jnbalrtEzkpMtQHAx7ApOGuVjyOd5sX3MDE4SOo//56ZGVe4c+OsHcdOa?=
 =?us-ascii?Q?vdZ9ov+MS02+NNNxk8O6JsLYdWUY1wc0H7R+X5FnZX6qm9lBPcsR0iKthGfo?=
 =?us-ascii?Q?iIAPCV/Yiv3M42N0CqWH71JUrShI6z/zB8KwUsRvXtGmoxAYv+oTSrybxGBY?=
 =?us-ascii?Q?IicP4tmGqy5+29UNBu+bPRENOkJDMS4UbOSEWiXex/OpW6fUqjt+R93dK9K+?=
 =?us-ascii?Q?9TLASm8wriVBBroF2eF38BSvjvVO7MlPK2hJfXgiyCC+zSK2QtvJlWBoWr68?=
 =?us-ascii?Q?phCPyhP7sqvhmx/arALIn/M8+KqEiUILGCOAQlMx4wQiI9+3ah/E4FwaeYgh?=
 =?us-ascii?Q?hUucF9aVxtus6P/Hlvs21p6AJnj21oBSJLStTFXBk9J4aVSdKkal9rYRMP5Q?=
 =?us-ascii?Q?pakdbuVeHKV5EjsiZhgMPbg1NBiEIZZn2H3iDWpgg6sg+ZAaTXSlB8tjlF1N?=
 =?us-ascii?Q?x/atIk+21+6q2Z0B1LpAGkcG5hh4BO/lGVB+1V26G8CGdUywLCe75CdCLj8j?=
 =?us-ascii?Q?XrYhc9R8M8qmtDZhWoip9Ns/lolO4RzoIqlgBP50KMdO17IggSzP6rmWHd6c?=
 =?us-ascii?Q?tKCTagNartdmdHqmeKT6Foud67lNttHR8izrC1ySb204m+ID5LJponByrkz5?=
 =?us-ascii?Q?f/JiXn2tVHlNx2WpWHCToFBZUabj09oFwJysaQvGQuilCwlGoecQiuQsRaZe?=
 =?us-ascii?Q?r8fsJ7oeb+Ze2RAEhJcDp/sm1RtZYXQBDdVsZFQgewyBU4vYbwMoBnWdXBfs?=
 =?us-ascii?Q?7b0A47LuyZSU5s00G31u6AwV39uss0AvwEqYqWFEYL51hOUr7YFPyzKuyvZO?=
 =?us-ascii?Q?yb71/pZns/aF/eI8H9zLeBBJYX/1QoWdqsaHherYWrUjKbgGwC+fvF4knaob?=
 =?us-ascii?Q?wNS89OeLgS0D7hHaqly3miIIrFKtcTEoIWUtmISAZGob32Dwg5slLvkhPW13?=
 =?us-ascii?Q?Qtnn8nsHxgQ4lzE41E+6OZy77oux6v5yqkGJUUbKlZ1uSLWbrXPoYeowvbZn?=
 =?us-ascii?Q?Zc4LVD4Rsn1OK8xnmGKv3R1gwdprHkjQhymm0hJ1iXAwz5Nk7J73Z+GIdoOF?=
 =?us-ascii?Q?uBWwbH2lYsg56Q4FzL30dlaWzfzmEg9+D+6PBe+xD9rT9VUlWefYeWnlMNx8?=
 =?us-ascii?Q?Ev7WegpzbWYjZ8gBhlMGJj9S3md+Cnja5vKzg5A/564RZlTtXOPS84uVrO5+?=
 =?us-ascii?Q?QJyQNxV4dEY3nh17Ex97vR6GOHC7ycl4uCJ0IAGHQY7yWWDeT6BbKflUti6V?=
 =?us-ascii?Q?uWAQ71pn7n0uvfzh04hJaH31ZJ49cN+XL7fuJ1sggXSaEGmj+NTm4ZYzelkX?=
 =?us-ascii?Q?0bQNf5kR+iYyszQP1wU1YxnPzLofG5wp9VHONBq1P7f3BILARQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N2PA/VBZ/4gCgK+GWRYwJ8tU/QcJaJrWD53OBcMq4jVb8sJLLiPpNPvard4F?=
 =?us-ascii?Q?gB1JB2xgZbI/VAwtkNMKMvmsGLnkWPfpXe+ZFFYO1BOhlWsyzeshBTSRQax0?=
 =?us-ascii?Q?1fqG3RySWbf2j5AnzLm43jbEscs+tOqlaJ8Si8GBByaRhJ0ysLKR/MdT52Hg?=
 =?us-ascii?Q?I0+gDHQHkAAMxcPP2t1yzqJNezCTTz7AABoOAv/zO/pdpTr4n6q4e7bPr+kV?=
 =?us-ascii?Q?obVML0PTbX4qiYq67virhJuQErQuWo5u6WpqOGwq41juW2Y6JDRrb5oWiq4d?=
 =?us-ascii?Q?wXVCaG1yQKE6bcAou8ZiWhtAW+/Ba8937gDLlvUOTKW2/emw86Mpt19aHTfJ?=
 =?us-ascii?Q?nIqy8x2LjubhEs54nyzRLnLK2CSrByUBCpDhNQr0x1rofviX5wX+zDx2p1T3?=
 =?us-ascii?Q?/Bp7hh70jflUhHFfJ1RK/vmjNea1ikRRE7v3NjLIIOxCfyz1QUY3Ocxx24os?=
 =?us-ascii?Q?Ohf4G+x5/b1tlViy5qvcGTkAZDhy4uWpNSfsr8gI3AoltXtvar+P80ia8O3+?=
 =?us-ascii?Q?J7znwEfOVbYGI3hhIJdy3pHrPVuINm1A01vcWr6MKf0YMHfXvnFtbPzgI4+9?=
 =?us-ascii?Q?gn4H2gAhvgX7u62nImvB6xEhKvTiUBEwcVtrJqzUJ3efOwK9aHCipZxDzkpw?=
 =?us-ascii?Q?T6vMg+xjq3xRGAoRmMi5CluV8mdwRsTn0gmMfPArk1cdzR1lXuqYu7hrGL+U?=
 =?us-ascii?Q?RLU3W2HX1GbFr3g4chaqAz9igUdF8Z1Bd258j9PUvdkMhs5GQa+H9Peg0Vwf?=
 =?us-ascii?Q?PY+vuH4l2ydi05kxAfrO3Iwt5DVb5/5wlZfW17B/xG9iiuZOS93FS+WG1aWW?=
 =?us-ascii?Q?78i+xY+dRZ/Ad4uFf/K0qi2CalOGpXrA3Ueup221WoIPj68JSe3tbbg+xH7M?=
 =?us-ascii?Q?2l7b2ZbwIlgMeyxbufCHoaTXyNUIOZnEbdTE5eQ/KhlUNdoJj5++ez0yoDIZ?=
 =?us-ascii?Q?jZdnyIdImhdeSfq6UZ3ebMuC6T48mck5U05KejfUQPRDi7arPZVcV2GBma1I?=
 =?us-ascii?Q?o7ksjlZchlKNBLSVq7YprWOdjJqBiHVfTigWjQaCVGyvih4J7g1dgXoIjgz6?=
 =?us-ascii?Q?wRvPVr6DYwEBllZWmOwcq4fsbEUpYRe+zlIb7fzxWaxae6I8WZ0Vp+63aIyo?=
 =?us-ascii?Q?PpuJr2t1AKc9uWy34Hf8j+JUqGnJaT2m/Bym3wV6v9rakjoSr0lDD5L/Byuf?=
 =?us-ascii?Q?wftCULTdu+HZhoepp5hVnnLAw9T65+MwVjdgZo62dERAzWHVLnnVbU3QImSi?=
 =?us-ascii?Q?cfwZdoLLFOziTcZv2VBcTcEB/tfIkrAtN4lHXvfql1ySHCP8hLlzX5lyAC8x?=
 =?us-ascii?Q?jNY8Zg47gGS4/f4y937yw1sGSRTBr3EWHMmzmnjE3m7ht8TzqBpacTSR/UIc?=
 =?us-ascii?Q?KPpl9RjtSa552i/2DnsdvsQfnKba5DbVIhFGY2nL3FQ6Glrc1Dy887zPz6Vw?=
 =?us-ascii?Q?h1SQrB5CjcShj3RBdSHFTbKSJm9953WJI5xq+yZUXeGCCoPKZVLfLMquZECg?=
 =?us-ascii?Q?ze3MDSDH4l98xosV/fputeAfB9HlO9Wtb4Kvol1U6wpv262uGkYgj1DgzVGS?=
 =?us-ascii?Q?JklPwfkG6oqNqhlxw09H33812lzSSi4IcCKyZqnQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac42bda-e13f-4121-8853-08dcdc396d96
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 01:37:19.1636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQFLxNWU9ZOH4Y21cazb0EqGKrCWuUjfdWKN2Kk2W3xDrcakw/31JjqAuNCJH+t7MqE9k0sJoQ2O4sDNXus8Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5483

This patch fixes typos in comments in the atomisp driver.
These changes improve code readability without affecting
functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
v2:
- Updated commit message.
- Rebased the code to be based on the latest staging-testing branch.
v1:
- https://lore.kernel.org/all/84c96000-e198-4502-b37d-0ca15c311968@gmail.com/
- https://lore.kernel.org/all/25ec1b00-02fc-4ecb-853c-de9c8a12f9fc@gmail.com/
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c                | 2 +-
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 +-
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c   | 2 +-
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c     | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c                 | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c9984f155..eb46ba4f4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -55,7 +55,7 @@
 /* G-Min addition: pull this in from intel_mid_pm.h */
 #define CSTATE_EXIT_LATENCY_C1  1
 
-/* cross componnet debug message flag */
+/* cross component debug message flag */
 int dbg_level;
 module_param(dbg_level, int, 0644);
 MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8f2f4e8ed..c18f62fe6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -406,7 +406,7 @@ input_system_err_t input_system_configuration_reset(void)
 	config.unallocated_ib_mem_words			 = IB_CAPACITY_IN_WORDS;
 	//config.acq_allocated_ib_mem_words		 = 0;
 
-	// Set the start of the session cofiguration.
+	// Set the start of the session configuration.
 	config.session_flags = INPUT_SYSTEM_CFG_FLAG_REQUIRED;
 
 	return INPUT_SYSTEM_ERR_NO_ERROR;
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index b0f904a5e..91342091f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -950,7 +950,7 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	unsigned int i;
 
 	assert(descr);
-	/* MW: used after an error check, may accept NULL, but doubtfull */
+	/* MW: used after an error check, may accept NULL, but doubtful */
 	assert(binary);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 2d7fddb11..0ab83e1b5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -362,7 +362,7 @@ void ia_css_frame_free_multiple(unsigned int num_frames,
 int ia_css_frame_allocate_with_buffer_size(struct ia_css_frame **frame,
 					   const unsigned int buffer_size_bytes)
 {
-	/* AM: Body coppied from frame_allocate_with_data(). */
+	/* AM: Body copied from frame_allocate_with_data(). */
 	int err;
 	struct ia_css_frame *me = frame_create(0, 0,
 					       IA_CSS_FRAME_FORMAT_NUM,/* Not valid format yet */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 80f0395cc..710744ff0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -169,7 +169,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	/* ceil(words_per_odd_line/8); mem_word = 32 bytes, 8 words */
 	mem_words_for_first_line = (words_for_first_line + 7) >> 3;
 	mem_words_per_even_line  = (words_per_even_line + 7) >> 3;
-	mem_words_for_EOF        = 1; /* last line consisit of the optional (EOL) and EOF */
+	mem_words_for_EOF        = 1; /* last line consist of the optional (EOL) and EOF */
 
 	mem_words = ((embedded_data_size_words + 7) >> 3) +
 	mem_words_for_first_line +
-- 
2.34.1


