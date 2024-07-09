Return-Path: <linux-media+bounces-14735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E877592B258
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172AE1C2220D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1BD155C8E;
	Tue,  9 Jul 2024 08:40:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3415573C;
	Tue,  9 Jul 2024 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514409; cv=fail; b=aTSlMXdN5l6lfmgYsv2NmwsssoBS6mpCNIHaJGwMyWRQStcGNbCb44SKYAkhkx/l48hz2VwrK1zlas2TN4pI5BC7JHzTEk1LoXnaO9gwbYbMlEeroGzpcvnmHO5GhEcGnudKP2WNJVWVApei7TqNPSFJb1E41XRD1cA891YkCSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514409; c=relaxed/simple;
	bh=cjyZh2DZx8Wh4SZ1svrjrh1m16lN76Fy9TkFfFl+Hi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pJDG67dv1QR6pKLMciPdTaqYsqpZ7QWVWygjUzPqBIIi6QjUik+yQqxtjWlxjAfmI0Kp1kVri1Q5uU7do7vEljUzon4kF0PRbpsWWEMDQx5iAPfI/mM6XcDw4Vzv6y1Bicn8GCcdltp0tXktTCvPMrlifJErBy9Y3T4FXNZSU7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+c7opmCgoRQwwjkU01bRGBHL7/EQIqCvLojI8xxxw4t99TASoVrc/qwtPGWV8tjNRlfBRK/b30Zz/ydkL5jyFot98MHYwwVO5/7oTQhxR2DTBVMWAYXk8cTgYSW4tnNQpKFU27YWanuLy+Xo+9iEPn2o8BwZQXtMclb+D5LZXfnpVHVHBc8jWG+ifICA3oZXoorvbPple9nNx1b/eAoG3nKZzANwixZyDLSGrrbqtmQuhS5zGhVjiVtKg9amkCOpEIlPMUbk7XWDr4L/cgoQ9gQ639904z8vygNMkb6ga5oL3hFl/bq5uhXinSAd5y1JkhwdWT9Ut0W+hjeGD1w7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCxeJ/zkXFCPOkwt8MN7f14gxtBE3WVzKRnYHHzHmvk=;
 b=NG8qiKbdMPJYxS6ZCSzfDj8E6/KXhdfifGlCs7oZgEqSYqOEv1elEosmUKXaUPq6S4FyTp9n+IA0rL4k7VPhjL6mx5gBv7jgrkl4uTTGhn0v8qh7bL+u1FjEI49QGKVeWSFR5P+mquCWfgmt1U1w891fvfw/pFc4rwkFkSw1DmEkTqmeLTmcTXgaIGrTsZPMHyVEhl8j6+EkX9XP/1CNflewhHyaheIw8INzbzHMVcDtYAtv3YAjWf6lN72+i6AKXEbY7vUo5Gkifavd8toVSO6xNS6a2zOJ+AJ/loZKOLhii3kuKJxbkzGbqQeecpLlqLrEtyAWthbo8QkJUA323g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:47 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 13/14] staging: media: starfive: Drop read support for video capture devices
Date: Tue,  9 Jul 2024 01:38:23 -0700
Message-Id: <20240709083824.430473-14-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d03c85-1b83-4360-1070-08dc9ff28cd6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	lahEubP316T5xzkQvE5CmHcFw6DJ2uH+W3X+4eYsLfjorPiOCYS8b/19K+WU9QVpsIst9JzUaatE4FqJc734TzqbK4+HfGfRfiettVHOWqs/fnmS/QjpYRSuMq8j2+gymHUSU9A3JJ5l1TGp6jJ5YCbgFaPoybQbg3VM0QpILIItiJnHZ80+GFqtnV4OrITJMn1yWVTyoyxl5UuzMhdh69xzl+nAajjEyps2swpfe7TLYDizLXXZWTaPsNeeakMpkC/Q9OTJeVd7npRIcQ5mQHn4nAai8Rn8i5Xx3RXls2UKU7P3UEneYwWtP71LSoQW97SeK+3jNYWyxNexrssuyeZ3y8oyuAUiiE9Vd0/Y+q26VLoBoICW66f2pH6KsxIdtCxVKnJZOsL3oJl8FZprS/5LU6W+rLoS/r84hwBUg8TY4L5YuHkYHMHZvJwFoiL/Tqwq+vHnaYu+B6jgOsvS4uXITuwnK7ZcXqGnL1R43oT8HxcwVgt2hJsW8IOB9aOMyF5hT+dwzp9ZepagKW2dObuu88TnXe7T/zHskdV0r926HR/sJT4ScjmpXZ5pzeAeziCtXYctCKohKQ07b5y2yzWp98cNIUOo7R0Eaz7Ti9l20ssEjFckAoFUFiYNe+li
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cb2vRZ7Gfmq9et6z5DxBn62b+shMzMAdOZsJy5qwnZc2lWAHrzDnCr3dDA21?=
 =?us-ascii?Q?624jDx+Wq5yhcQ0SQiIA7w8NR0JrS+nVoJFgv6g3xqMjWthO7QacV2FHwXh7?=
 =?us-ascii?Q?WQ7iFuRVLN2K7HI2DNJXzwFzzKpRy5rLD8XP3yUJfCiB6f1kZ3svU4Sgmshr?=
 =?us-ascii?Q?ksh/YXoU39r4PGajL90Yms/hBZ3Cd5zblMkTBxI+YcpOo1992gibvaXai7hC?=
 =?us-ascii?Q?7resGH85evwWnkMJp61QgDklJfVHbcolWd5cSANyF58P7yxcw1ncHVNM6Zzg?=
 =?us-ascii?Q?6TO13DCfrrF689QFAgwMfLANTloB0WOFGmDa/sn7Zda8n4OruMAN9UYZ/fg9?=
 =?us-ascii?Q?oQO7O+adNJoRdvT0JBi2e5TLn0lJR59l/pspN1UISPvur5IeUcN3TUXiRBJk?=
 =?us-ascii?Q?sAu68DSAuxlv1HDTwGoUoOK+72R/CqraN6Iv7LhCPzT+O9XvQw860OfpeZD7?=
 =?us-ascii?Q?kQZWpY1a4tiZbDLG2yTOlOPzohn5vgrJfWC7c10jiVTWJIQQKr2wmgdsFjjE?=
 =?us-ascii?Q?EaphCB7dhSgmEcn7NDH+GrL1WMwXsHUljzMzf7UyXeo7unnS62FsitGoQU4J?=
 =?us-ascii?Q?DUyAJV9buCMsoSeMVEIjdp15R9gg9HMfKmHVYdRGfcIyee+a19ncch98fVPB?=
 =?us-ascii?Q?8pl79YfhijhnOpBVtmKvFludqRQ0uTHW2kAZIkxR/jej07gtKxbNotZLfixL?=
 =?us-ascii?Q?s9sgYUf5IS4U4iRJQ06YU075i/7Du4nv014FoTC3lVBy1J92Z/P1pRTpHtWs?=
 =?us-ascii?Q?Agrmih0vP629auYD1BXiCjpF4MVEYxpeG9xACyFZSAAV5oFgfSMzZitiO5JK?=
 =?us-ascii?Q?+UkFuFtRZ2gIwmc4jiU9Xf+YAH3vupilzUA+dRa3nBnlw7J8kOWPaLk/N9Dd?=
 =?us-ascii?Q?aiomtSYHEbyH2f3mLj4lgkJVot4FDf+IAHnAaYSqGsiYZ0JUj1g92fwSP+S0?=
 =?us-ascii?Q?PRR/w+rWnChEQc46affqZdQ+7SMEuyiZ+wz72DbZ1ZpEPztvKAso2ph8cbTZ?=
 =?us-ascii?Q?KWwp1iRwQ86sKKwlVzYyaKKp8ZzeOd2GaE2E7meuo++OL7OVHgUQspzBX0aG?=
 =?us-ascii?Q?f5byscdZJJbG2hP6M7RtHkKY1pE09z5WnbmUKbmMrBkmtb6J1NizU1CGeQ+u?=
 =?us-ascii?Q?mWxXttE8yy7u5c+GDMw45P1bgUupIm3zPTcgGdUKn2LRBjA19l3vu5gQhcY7?=
 =?us-ascii?Q?pV4SgTrht1nKa5GEziILW8YAOyNGxgr01lLPObsSGyd8YlVWlzZQDfa1rOkJ?=
 =?us-ascii?Q?+8y77D8PD+9bpjLtYy0Hh88c+/yDCcE1Qw7vNHkmaxq+IkKzr0kYGxLh4qfm?=
 =?us-ascii?Q?nRISTn++00djO1t1UGZU1n9TwSMM5+ZCnpZm4P/h/7l4uXdJ4K0GXQpermXj?=
 =?us-ascii?Q?/YAhV+XApcLOeFURn+lkYf8zHxIqwAUnnwVvFeYOMk+FMjtwIY4vR9cjVlcB?=
 =?us-ascii?Q?YosAKLcsYWX5jhGTlv8KC8c5pg70e85vnQd8dhnegP2HSOlb6ajwkFQYXa2d?=
 =?us-ascii?Q?+fByIQUGyNPtaBkevaRPjXdvmppxEaAdTC/JeyKc7tvA0aqryxBSL8ykqzNV?=
 =?us-ascii?Q?Bzc/e1KA33iln7sd27FgsgEoeaHTluLY6VgFCNsIMh2nnTbF5z2b6rMyfEUy?=
 =?us-ascii?Q?X74zCzHpB1MFOBKuPLFx7gk=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d03c85-1b83-4360-1070-08dc9ff28cd6
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:47.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7aIWalvVNafmMN5XoaSwzbl/bXDn/acU6XGZRb0jLbKQZkLaHgfjF95I2kKRSwhsqwLlBN2vh7pdVplPGHu2/vGf+gktYZHJWj02VU3EXA6otEqainF8LLgd2c4txXB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

StarFive video capture devices is not support VB2_READ queue access
method. Drop the implementation of the read hook.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
index 8c6c45d8b7a1..28e6679ee9b9 100644
--- a/drivers/staging/media/starfive/camss/stf-video.c
+++ b/drivers/staging/media/starfive/camss/stf-video.c
@@ -570,7 +570,6 @@ static const struct v4l2_file_operations stf_vid_fops = {
 	.release        = vb2_fop_release,
 	.poll           = vb2_fop_poll,
 	.mmap           = vb2_fop_mmap,
-	.read           = vb2_fop_read,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.25.1


