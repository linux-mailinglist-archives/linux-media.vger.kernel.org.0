Return-Path: <linux-media+bounces-38242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298CCB0EFBF
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C495837E7
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7536E28F935;
	Wed, 23 Jul 2025 10:26:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021104.outbound.protection.outlook.com [40.107.57.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8293E28C5CC;
	Wed, 23 Jul 2025 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266377; cv=fail; b=XhJsh5aqMQAjErDF74hqXssfx65GrE8oHQmS21abMxHbDzKGvMH5PHce23YAfTxOnesh6IB8g7KqHiy1DJb1fdx9gp5KAYFzqiIwG1lIwtC5yHu6aTR0iPjDffrPPXNNKTeLjfH36U++mwdR0w6CJfQAo6gipyUNtTX94pDBXh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266377; c=relaxed/simple;
	bh=sqXuZYEdRo7wqk4sX9Px2lh47eyWUaV8TD061bm9RFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ovRW6UEjd+oXc5TE04+gLIKerDVNi0HVzjZYQYnqN2cOOHW0S/ZU5sAkD9UI4mRNkEycMEuht6TRu2Ht/97GIdOx4hNuqcfcd5Oca5L59BGlqQxKXVDftdCfD3/FVFiQqlkg/14EdeZa7lDaDPpmXMKwPCJddE+1C8HW/rAzntw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9b+ctNZolL25YbUzX4o2s80xa+9tUAKNvm43C1LWRe9sy3XDzsoe2kj0EdHWOXbL+EeiBncDDmDzgD6wXpLFuGQ0TDkdHJKeB4+pwX+LwvJj4pC7ZG/SXIpz0hvAh5oJqwPjXkoedE3HCQEKdawtg1QJi2jzl/jhlo6h7zaq1HZ5U52LW0PK8gm2y6vYHStja3iYmqeOyxpUFccvTlb5EIBJGNiBWecYy/UX3si+ioqx5MKSc/SOZmfBJgr4owci2T5sgbK8HVCkQPCizPX4HSA1+wWDGVYV+1NeOsb5aowNKac1523hmyDVMQ++pytHkgOvYH8gyiaHKPtCFP+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5V/EML5UZLL+xpw9oeG6mPZiRwfrSv3Gmx4m/mfAo0=;
 b=PaJSmG/ajtW9kK8mhphSq2nNpUdrKGVugsL3ByGC/uhtsZ1wj6uksI/49bGDy1RRZk8PHYonqFxp4X3cJXP9usl360wKRr0RhMl0VVkzjD820tvHNMg2HqXrh8nxRyqeQtNlsvFMe/qjxFlGR34XIr5GzgAMICozDtU834NBhwIUjMrSOoGihXNJXWHJt5AXO44mLIMh+p5rDcNey5vtCgJR4YGzSrMbC4ucg+Fag1r7FVbLdSMYFJaUIEl9nYOE6evKgL5O4kIDXwLci8yy2nfO6ZcKp+lDabGG/skwb68qYQVs4YCiWy/E7sSJPZ9uwbRgRXNpQWUS5zIsBzdzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4176.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:26:07 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:26:07 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: mc: Add devm_media_entity_pads_init() helper
Date: Wed, 23 Jul 2025 15:55:05 +0530
Message-Id: <20250723102515.64585-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA5P287MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f22e124-91b6-42b8-e834-08ddc9d355ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGGWeuG3sYaI06cn+NY4JYFkpMIhZxRdK4Cw9Np6MemTZW2gleL1BdG0LIQf?=
 =?us-ascii?Q?3W3e5DgDdJFC6cZiO/Gfa5OoZdiVHQ1pONle9FpHvOpF38gqkwaPburceTpm?=
 =?us-ascii?Q?P3NQfhbm2u9OlzjkaO5AghdDhwpP0k5tkQgUxmagro1x8EeZ+RfSuprouqOX?=
 =?us-ascii?Q?anMLl9Su2xFi/K4U4YUczZ2b/nHQ0inuMvfv2C22aA3/lZLw3AYOAns5v4K2?=
 =?us-ascii?Q?jKOYadY0HTSzn/v1Mf+Hkhx3If1UuHbB1nP6h4h6iGxZ9SGpzoKeXkAJzmPP?=
 =?us-ascii?Q?HX+yBQgBZh7mNMSXCQnsZfQgZZXzm6gIm0SHs8oWMD2v3k+eLD2aD8VkzeIj?=
 =?us-ascii?Q?xHUMwY2QbexWfkCO9Ah6EwujMcoti5GjHsYzdYKgF1+g5zXEvvv/CY4EyxGs?=
 =?us-ascii?Q?EsRxogVIbCpYxA2AfiBAYMOxQPFi34B4//nRzOifeG8XRB9no3vpUpFEk5IY?=
 =?us-ascii?Q?hkg9N2A+ijlc6445RxzTrdAw0RvKuW57LqFblrFFrNuuATfViOWk562GyJJz?=
 =?us-ascii?Q?xbVIaeVVGCj5oU2QHMRDrRHG7J3v1oEU+QOqVhc+qzSQk0hKZyqpa8HdwuJ7?=
 =?us-ascii?Q?O0iylQPjqBaS9k3h1D2VtrWV3wgeK0voQ2swzLbAIMoHZrUvIMS//68dMGrf?=
 =?us-ascii?Q?aEfaqapypTjOKteYK4MyeyWIQL/RSOnpJWNs9UHxGmUCRUREBVqrwqp+cjMI?=
 =?us-ascii?Q?JKaZA7PnFCNZ0ZC5OidFFuDYIFy7G6gUpIGqCTocGAtzWM11YW206CcGZukM?=
 =?us-ascii?Q?T9hDQPbHaZdkBXPtYMYLfJdujHdeuuVy9heB1xobu8obr8qDp033wpYJUZ7v?=
 =?us-ascii?Q?Hvs3Kw781885otXCdnmid82b7X3ldLYG/rMRwjDzX11GVpjZkik5lcthXCBF?=
 =?us-ascii?Q?fbR4PBb8f+9XnxIiHqxmB3rsZmjURnGgOeX1pX8LL4WRWABtEZvF5QDildwt?=
 =?us-ascii?Q?51+ejm8711Ynl5wAoqzN1OB/RFhxGZ9XuamRQnlKy+9kgfeMbMRiHAAxxqsm?=
 =?us-ascii?Q?8FVGDNNeRP9gCGT4Rp7TDAIgVNC33cbv546rioJ+o6/Er9bvQEE7s8oGPp1l?=
 =?us-ascii?Q?q5+TaQaR7JfO8+lIjwn6OtsIRRQCXu9TssK1aRWawkahVkIwu21/R28r//Ma?=
 =?us-ascii?Q?OwnOXPg51+t4vQGrnNDlJKctzfkhm/Thtk2zrft9CDjUcEWwEkAwAmcaUqne?=
 =?us-ascii?Q?9QHmMlbUI2soSYLgvwtklKfZ1KQJWu/QAiYQwo0hvPYb3ToNsxICkWU6+lwV?=
 =?us-ascii?Q?7FSCp8pkYdhuvqgHwIROvg8e/wlQQOD8mpZYkjVnDxl2sjI6Nt0XghrhCKsJ?=
 =?us-ascii?Q?t9xguUfcY7miF0aAeCNDhj2hpGu4Iffs6HwiSlwtNN+ym0riI7yLLYZbGUo/?=
 =?us-ascii?Q?mPAK6H2C0UGoQjAiHjQBqVNNh/XE//e0PznDx3iMooRXu6un41WiLA5pW7vl?=
 =?us-ascii?Q?06/n4hfy4pKFnb5JWIh80b4rSUEdkgNCFwBTT/dAit3iaAejXCLt3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q5+BypQkSdnRQvoo20Tg83nbA6XM5L71AIppje6HNWKhX9HNfgAtvtqdi2kJ?=
 =?us-ascii?Q?R4LePiPVGY4KDEsH1/0PoVv0MUkLim+r7tCrxfF7u1q1xP1CMA3SwQLbMhpp?=
 =?us-ascii?Q?XEWplveDxmZJ75O77zwS6H6HluhKSfBfhlInnD0ZjUMzb83c4XFuWceDh+WN?=
 =?us-ascii?Q?g25dh/4P3+p8VpZgb8PJnKxalmvNagOVZlIuATXrjPV/GmwmOM1y8UAtP8rm?=
 =?us-ascii?Q?0qmrXaZQ60CYBFK6PSmd2mzsBLJ24U+cxCi1Rk+Hdyd2g96Y8qE9NzYOSwWM?=
 =?us-ascii?Q?foDCAybfhFcRq3/yActqPY+/QElCq2uWqCmw2wcUrAhVXEQyuuAUQRUl68La?=
 =?us-ascii?Q?BVTm6uWyn+t2oCCMWM10H5tqhn6moexKTEX7k5qL+GgRJpVRAupmcYfofrqk?=
 =?us-ascii?Q?rMkMBX9F7wm7ikG8UY4nxGctjiaPWKPgxji+iOcEi10knlBD4HyebfjteVCN?=
 =?us-ascii?Q?AM7CgANanX8Qs5nPimlQP7eSAQTcrdQzZ88R49m2KbxmFMaNDEIyHmEDRIKH?=
 =?us-ascii?Q?yqZgTguKpeuzmOchf5Ofbcof2t7odxoD/MnLsvdFXK4D4vuwD9CQhim4juFY?=
 =?us-ascii?Q?lIOnRKwxABOvYiPwtx9JbJXnSJNCzcY8SM+ZGmWqT4wZgii7FoJmU/o3t3J5?=
 =?us-ascii?Q?BXc1hCV8OE9mjWLgQzOtabwi0bF2fw1eSlB6CIs+8uDLIC7ijG9x10G/xSt/?=
 =?us-ascii?Q?I8uDuA9exUgWydnjPFSWnP6JmTi8pEM1w6iLPexnIzH8GWWE9GR/0OiBSSWp?=
 =?us-ascii?Q?bnWU5X+RjneN7enNIXhpUWOLdb0PG8XruFnZzgIeqwKDI5oewsNA2UNQBtYT?=
 =?us-ascii?Q?XgB7Ffkr7/kcrmzs0tYqBr+p9caRe4qygA/O17pte5f5XdReZGue3rBrNcjB?=
 =?us-ascii?Q?WkRzOI/i1Qdjwp4RmhDLofhWV6AJvLcWMCOzhfRI6pP7spruHhZqPTqAebG2?=
 =?us-ascii?Q?DhfgZVet9pXtCA1aiKk/CDezcc1r6IykYeaRNhCU9dvkVSA/tnAr5LyE2X/0?=
 =?us-ascii?Q?2bVNQ4epCZn/7oQnUNrSu8D/XGkvGEMWNMZstwlhVr5dk33LBoyDZoVNTM9h?=
 =?us-ascii?Q?x1yBpNz1/g48svFa/5d2NtuRMISrI+DaMbyAO9drVi27pm8a+d5/QIT5//M2?=
 =?us-ascii?Q?Bqk5SNfwYbEg+bpbxtJgOylDNCHeb9RQ887sf0gjcjuGOY/PaziGCkk6D32g?=
 =?us-ascii?Q?X01RWgrJ8a/AXevVtyoYxm8yj6tQuqptwJ5tbr9eGjxLqQ8jdBRIr5IAZa4D?=
 =?us-ascii?Q?PWBIOFGa0AXbSMOMh6s4/ljS7AF5MneRqnmRZBA5mwu6k3WqgsHQTXttWKEZ?=
 =?us-ascii?Q?xdVrtqhgMjeggR01YbwUK/hLnh7kjOGjID21S0Dc+Ml6jTM/D2PQv55b6fbp?=
 =?us-ascii?Q?4UyQtWM2QnXguhO9XFfkETra6a1Syp3KjHiZ2aSXLGtHPageJ0Ca5HQDMM/u?=
 =?us-ascii?Q?MBby1LJ0kNBQmZQ3roPWAC1022etwGe5uuT1SIaGSVA1Xti8/GsVoWI7Gl6C?=
 =?us-ascii?Q?1zEe44ejPlbbm/MeXKdJ68jDOoLSgclraVldsQuopH7uvpYmcqNiam09+bT2?=
 =?us-ascii?Q?Bcca0yllgPLO+lSxjU15sYfsZuBOMzdw5PISBWzG4kLnMzpPYDs0OKJDgqCw?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f22e124-91b6-42b8-e834-08ddc9d355ff
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:26:07.5577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGhzjiSaOLrDV4MTdu9mpRtchmCoHyWrVCboCd4/sQVaK9kTjZZeOuGui1YC4q0al/XBSS7lN8OfoAepCe002dpH9nerKEauRdBdHXIjslc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4176

Add a devm-managed version of media_entity_pads_init() to simplify
pad initialization and cleanup using devres.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/mc/mc-entity.c | 19 +++++++++++++++++++
 include/media/media-entity.h | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 045590905582..fe50da3faf08 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -8,6 +8,7 @@
  *	     Sakari Ailus <sakari.ailus@iki.fi>
  */
 
+#include <linux/device/devres.h>
 #include <linux/bitmap.h>
 #include <linux/list.h>
 #include <linux/property.h>
@@ -235,6 +236,24 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 }
 EXPORT_SYMBOL_GPL(media_entity_pads_init);
 
+static void devm_media_entity_cleanup(void *data)
+{
+	media_entity_cleanup(data);
+}
+
+int devm_media_entity_pads_init(struct device *dev, struct media_entity *entity,
+				u16 num_pads, struct media_pad *pads)
+{
+	int err;
+
+	err = media_entity_pads_init(entity, num_pads, pads);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_media_entity_cleanup, entity);
+}
+EXPORT_SYMBOL_GPL(devm_media_entity_pads_init);
+
 /* -----------------------------------------------------------------------------
  * Graph traversal
  */
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 64cf590b1134..28b904fe34ae 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -717,6 +717,26 @@ void media_gobj_destroy(struct media_gobj *gobj);
 int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		      struct media_pad *pads);
 
+/**
+ * devm_media_entity_pads_init - Managed initialization of media entity pads
+ *
+ * @dev:        Device that manages the lifecycle of the media entity.
+ * @entity:     Entity where the pads belong.
+ * @num_pads:   Total number of sink and source pads.
+ * @pads:       Array of @num_pads pads.
+ *
+ * This function initializes the pads for the given media entity and registers
+ * a managed cleanup action to be performed automatically when the device is
+ * detached or the driver is unloaded.
+ *
+ * This is a managed version of media_entity_pads_init(), and simplifies resource
+ * management using devres.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int devm_media_entity_pads_init(struct device *dev, struct media_entity *entity,
+				u16 num_pads, struct media_pad *pads);
+
 /**
  * media_entity_cleanup() - free resources associated with an entity
  *
-- 
2.34.1


