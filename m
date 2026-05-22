Return-Path: <linux-media+bounces-62623-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EaymOuxqEGoAXQYAu9opvQ
	(envelope-from <linux-media+bounces-62623-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:40:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EACE5B64EB
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7980B31C56E4
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD990428822;
	Fri, 22 May 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JMbvuONN"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6C04508EB;
	Fri, 22 May 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460299; cv=fail; b=CewSeAPgy4AUry0PeMJiBiWT7r64Esnau3to8QMzzeOx/cHohIa9yi11+2QyBv8Fh/Ne+vFnEnN4eoodcNbiqRKlnQ9ayK/RjKS4PQQ02MgD0p7rfFZo0jVg7FMPnTlkyKr/tK6lLJPXdV54Lh4D/qlOQbgaC4QKCrolI/bey0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460299; c=relaxed/simple;
	bh=Jt90+ogTfuwCRJvEP+oqY0urNg5t9GzSgEPtjbCjw/4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CHrsz86kfH9g+y/uxlL4pdnUYILFfaexfuLFxDUd4CSFxGHtX6Tm6yif7ToW8cbiYSvRm23bx0YlRsaDvf/6EMbijLouwqZlv0vIlD888pdP9hxUZ3ssAe4S2zUB+czEURfce2+/bxO0R/Fh+6ZGsgTXlGZ9+rfMn4Kf7j+Z/Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JMbvuONN; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAmWJclFU80SdHc88JUskkH0riSUvM+Tm6uTogFxHXNogmrBZhCWwk6XklFoYsTsZqmx2KPKas/fnhhTmKnxtWaeB2FK8qJJ6IL5EPxlW/ngQgeYfa/VXCBTHC48uuJD6s2xUFZL8V66VZMcy5H93MOdATVDZbdyvJzYPk6xcDHZJy+OQsNcD9Bc3hU+C04yrSfweJ69CykgEb9jdQTo/nNQRP6SSES1KfwJC0axATrlXp6wmwxB+7KLEKSBrhZKt8Uj/FWD9+JlomEOronk5Rz2JvI67S+M723JZ30fMLe7Mikqaf7Hv/DGUbYsT6rXbdP/oIHg6PaqQDhCEks5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84xqj+vzZvILxdVtIOJjcTQdZKvlgK/kNlMcqZFKmKo=;
 b=ZbZAN8yQN8PPj2g/UE0zKRww56K4dNEqEVTG3xh4ll17+f9kL3lrKs8KL1xaZhjzk8Yt2veo68KVx8gdkB4rKfDKwpbgIKrAlGHGiRRf60SRmzzAlNHNp1JqTE7Kxr23F4oPvvXL+T1fLj8eBNeFuD78bwxoZT4VwywR/x1Z1UVZs5Wz6HWP0+jJZLWbthh8+TGE/Ys7ulZy9bB2AmFG3hH7uFCGv4cPnkksFDCtFUypVyyOh21hhp07m0QffPPyRTbz2+5BZu1y5+DBawf+quLgNUyd81HaaEysJHFgJYIyf3pfTFIbTgcDOzkdz4m4NsD+S3SM1KS/ziFY65zj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84xqj+vzZvILxdVtIOJjcTQdZKvlgK/kNlMcqZFKmKo=;
 b=JMbvuONNIMEqXMoFk6+td8Dl7N2GwZqIoXYI8WHlm9CBw103VbqzS/75VkN618m9pqSD+Oc0s7n31GEgzpoGcWpClHefRIaGz6KSZfVgGJ0ti7IRKTR7o8X9jFw/OvflpSZ1VqhqNyy8tcZIjJFV+X4xzB/rRAq/kFlGfbAIPfpxPqdCtuIuirkD9DwOHTILY51hj1quBcN8KVCQSn/9mfefyEx5Iuaxh4mB31j6c0nONnCFkana5kQz5s0zwGxqfw+1+At8aYfkGNkMTdr5oS4a0juTSBghBEw8Gekdep9tNL2kcs9PbD667UkiPQ+PPDm8AJ8mjv35xd8N1cBhUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by VI0PR04MB11724.eurprd04.prod.outlook.com (2603:10a6:800:2eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:31:32 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:31:32 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Frank.Li@nxp.com
Cc: laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com,
	guoniu.zhou@nxp.com,
	robby.cai@nxp.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2] media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_subdev_sensor()
Date: Fri, 22 May 2026 17:31:20 +0300
Message-ID: <20260522143120.690330-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|VI0PR04MB11724:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f77bb7-a745-48bc-0f6f-08deb80ed185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|11063799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OOw7AESYEu2z4O4VDUXcZbwbUnwbdb03BLWpggDSBX5Jb07osFR0ZminjcdKhJ8pQUKvRmVQZ+slbbZ6qTJvLvfT7T4IDPHp+ozSmVhP3OW1L/giEyOOOHmBw2C8G4oq8ks94NB58jKOfu6sHoUreruUvFfwB6stUFc2CnaA5UknWZQDOajc4iprvzAkGG/KPnsBtG+GPQ3Hfh+zjhWnK/YQvHuVqTvtOeqUjLWOD5Ey0DLC11JA4KSdx7QhLtqq4wgf2R+/W4OWGzY0R2gxPGYTu5He2qhQmg2ZQiK5PWCKSJec9r7sHj9YF6fu1+/gL4ve8bFM+8ALva87Yy27dsABKlQ8mZejrylULITKwIFBFaktjVe8jfwpoO5otfCjA4YRjEJy56C6T0CM6jq4uiA0EFpFLqeLAeKzNcMKMt0MiZkChKoJWZYa4zhv26o5ICohojRW0KobaAsyP8t/wrMJUUfQOQ+r7jznbJv9liSy3zamL1NzwN2Oho3kiS6WQg8k0FveUiG78R9hU/6RRfhSjhiZx9gZYfWLA40Hsr/YO2OUf22rP6jL2gaV9QE3RSw30jKfD4XbKEL8APQMAt8y93Efe6JBtw5GRTLnJEQGTBtHlM1FAi4kcVdq7hNB9667/Adx1f+egigdfHHb+Qds9GByKtIkrzgBkqDhrIjRAbpoFu0NyOaPRja5y4KaBgyOwKMh4rwGrjP02pUINcfPKwLbxYN07OQeZ5Seh//wiLZ91UpWaPnGPPrigj/y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xwpucv0KBldIAuJon2CRDS85CkXokTc3FIUmf0/7YQNoK9vIllDfApqZ4o60?=
 =?us-ascii?Q?lKi7mb9qXYiVpYdok7oZOh/B4BH8EKczH6x2EZwTMByimrrueDmIDE1TfwV2?=
 =?us-ascii?Q?cwQdlui7kTC4bEcoTc5v2Wpfcjia76sbNFUsYWSztlhrhI9FHXKGLNswLdQ7?=
 =?us-ascii?Q?qGNuV2Gk5VGGe43HkerIaDgRIZDc/z5jQmjT884pliPPQMAGxK9e/vkWycPW?=
 =?us-ascii?Q?fMj+EqT4ddhXnsnBMpZBKWJW6qowvfHYuuYNsLEz2cmK/RgHOfbSMXFbVDna?=
 =?us-ascii?Q?eXI1qq3dnGt00ci0oYTbGxBqUqPEnQYIO2I+zE7HaT5P7uvfQLJAKqtOvR/U?=
 =?us-ascii?Q?X/i+jROnwrx06wCGhEJ4bCIOx/mh/XnzuYxz/YYX6DFR0MsOBL8pLNAqXuZZ?=
 =?us-ascii?Q?AjN1sJCqpOne32tjsVcqOz25UlhkXyPmFgZcwPyCPLjHTxkbaLyI8KaEEwiO?=
 =?us-ascii?Q?iI65h24PkFtCOXL2pLAianVEALigjLqj39Y+JA+1xGzt/X0ZUm87ye7h3ksm?=
 =?us-ascii?Q?dCbERVhT9dC+WBs6pmjjnuNQtICOLiQymxvX3xbt7agoHQdApxqLR3Krt4mJ?=
 =?us-ascii?Q?sP4L6xXlfJeI5hCQ/f3tgTilwJciQYNbOAR6TZjz6HhAGU5ZDBSMNlWUn4jH?=
 =?us-ascii?Q?RzlGc31loN3HIZsW3BGtGqjZBsFwaTEUd2xewXaINazCE3hk65AoB34Wt8r/?=
 =?us-ascii?Q?oJztIdU5+qvyP1tXWRe1LS1VAe+p+94r0E+kxSxABvyP3T/nAJcccEUc+VkU?=
 =?us-ascii?Q?vx+q+ss0IojoBUwOuH9XdykftYtX9quImEOi8cOzQSxDVd9yCMMQNpJ4gd7p?=
 =?us-ascii?Q?jDMVmqKUC2gkzavSgXntB/vF6I0Gdh9x5ee9DNbZhBUJcSC9uBleaUbYUQ4c?=
 =?us-ascii?Q?Sn7AMX8ToSQ3NHEbHEUTZ15b2SDDuOhRgLGfpKBBDVHMlKMMG1TQj6BWoaPg?=
 =?us-ascii?Q?4cvT7Kb6Bc0li4RZqEtE0HSjfn9hi4t1G2g8mNmuOw6fBcyy2PCql1Z5IGlj?=
 =?us-ascii?Q?PE1ztLbvIJo19CPWYcUej/clEefCz1HykJExpuCpq4pyMTXBvE+uLoH/UkGC?=
 =?us-ascii?Q?/rK1JKBw9RMbxg97t/6+bBYnxDugV2yXiRHWk/jLSC1cdwtQuv9Oh53vjiXg?=
 =?us-ascii?Q?zh8jTrIgFLZFRCy3is+nWXRlqIGc/q9aarr8MqMGBLJNyhcMZIBWbVfihXsg?=
 =?us-ascii?Q?rVh3Nw8B+A+pyPBrPHoqZr5glXctVMs4S72eBu+OTniYhkrR4kOxAT+OisAj?=
 =?us-ascii?Q?lRCLdSaBEvnuOK4JQE++v976X+b7sXQJgU9JceTmLhZq+Xm9yMAI9vMzt591?=
 =?us-ascii?Q?IWffB2hM/VnAfEtmCe1Wmlvxoq8Uhl/yrkUo8MBdrCwLea6Rl26caxY24O8Y?=
 =?us-ascii?Q?K5HZyARzvB5YebUtecDzrcdrywfMnsdHh3G2XihjSDS2x4r//0t/8yqSz8T1?=
 =?us-ascii?Q?NErJ1/mMsnElDbJGyieaKPnArdt0vpw32LSR37yKK2UqvfFqgqhcnzKfbo0P?=
 =?us-ascii?Q?qwtCid44Z44JRT6i6TRRn9kBg5SHcsbPIQ+fcEaP9eAvn3kbmiAvI+oWlaha?=
 =?us-ascii?Q?HnzcZwvYhtMK1nA5GLTuqGPV9pnQ+z6JfF76bRGAeIyLU9Je3Y1BHODSCaV/?=
 =?us-ascii?Q?WDn8OLWDqXf7NA7HgGbbkCbDpI2ls91iyRX3MlAyy26XYEHSa4ntDjuIGTMA?=
 =?us-ascii?Q?MhhCvAq1ODMWGJnUxBsivKAcx0sJ1F+zTB8lRGYpbZ3pfu3TAM6plpkBJldt?=
 =?us-ascii?Q?9RpgwXffhQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f77bb7-a745-48bc-0f6f-08deb80ed185
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:31:31.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QpCdbnyWDPQPnpT7w0V7QQICU8Ko/2vQAkoFr+x53I0ylpXGWoeK671RLp3R8d+ZxAQGIPb6n24afCHuXvYtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11724
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-62623-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8EACE5B64EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The v4l2 helper v4l2_async_register_subdev_sensor() calls
v4l2_async_register_subdev(), which is a macro that expands to
__v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
rather than the sensor driver module that originally set sd->owner. When
v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
overwrites the sensor driver's owner with NULL.

This causes the problem that the sensor module's reference count is never
incremented during async registration, so the module can be removed while
the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
bridge driver).

Fix this by renaming v4l2_async_register_subdev_sensor() to
__v4l2_async_register_subdev_sensor() with an added explicit module
argument and introducing a wrapper macro:
    #define v4l2_async_register_subdev_sensor(sd) \
        __v4l2_async_register_subdev_sensor(sd, THIS_MODULE)

This ensures the sensor driver module is properly referenced even when
the sensor driver does not init the owner field before calling
v4l2_async_register_subdev_sensor() and prevents premature module removal.

Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
Suggested-by: Frank Li <Frank.Li@nxp.com>
Link: https://lore.kernel.org/linux-media/20240315073125.275501-2-sakari.ailus@linux.intel.com/
Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	Do not rely on sd->owner set by v4l2_i2c_subdev_init(), introduce v4l2_async_register_subdev_sensor wrapper macro	
	Added Suggested-by: Frank Li <Frank.Li@nxp.com>
	Added Link: to Sakari's similar commit for v4l2_async_register_subdev macro

The v1 patch is also valid, as from what I see, all sensor drivers that use
v4l2_async_register_subdev_sensor also use v4l2_i2c_subdev_init(), which
sets sd->owner


 drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++---
 include/media/v4l2-async.h            | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 77f3298821b5..62a3a452f788 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1256,7 +1256,7 @@ v4l2_async_nf_parse_fwnode_sensor(struct device *dev,
 	return 0;
 }
 
-int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
+int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module)
 {
 	struct v4l2_async_notifier *notifier;
 	int ret;
@@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	if (ret < 0)
 		goto out_cleanup;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = __v4l2_async_register_subdev(sd, module);
 	if (ret < 0)
 		goto out_unregister;
 
@@ -1300,7 +1300,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
+EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
 
 MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
 MODULE_LICENSE("GPL");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f26c323e9c96..54a2d9620ed5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -333,8 +333,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
  * An error is returned if the module is no longer loaded on any attempts
  * to register it.
  */
+#define v4l2_async_register_subdev_sensor(sd) \
+	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
 int __must_check
-v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
+__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module);
 
 /**
  * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
-- 
2.43.0


