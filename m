Return-Path: <linux-media+bounces-33141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E9AC0DB6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3CA18877C3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C939428CF68;
	Thu, 22 May 2025 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="HnsIETk1"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856B28CF40;
	Thu, 22 May 2025 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922843; cv=fail; b=D7/S3lcwGytTu1O5LipxDdSklPAJYZnsjYgI5r5go6s2JzYbzRC3qR2UaSCZVP/S9owb+YpKYSqnMOlwZBaurgRkA69dPK9aLFX+PZxsSE6bvfcj1pS+2fCqxe4EOoyJ13RJ1VK/Dsr/60IRHoraueAappWLQUEUS4fw87NmDOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922843; c=relaxed/simple;
	bh=cFy0q+oxb81aAMnZBgnZKl58oMAIAQmaAQocPFqZ+FU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TT/1LgszEDD2xMox3p4N/yBnykWc/qMK1lv/G5RPajrHa0M535p1KRgv/Z+xZtvu+JrqXhds0qR273OBfdF3LlBpMqv8VUtWY1jbZZJmOaFMob7baGXfJN4gV6PFZdOvTlF+KBKwxQ6XrSkQC4OsUlsa70FB7jkQ0e+gnci0fco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=HnsIETk1; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfN+n2FHenqAE4F5ztlbBkoL2iLU/aNTCJTKMEhgluog4uDsgULNJ/ec2jnr+M152XDtHsKjPFYcChfTge8g68VBfhL2yMZrZCyr5gRJuLGXksMDOdlC3+z+4fZ645l6g/fKWVzJSVfaZCSQFZ3LKQBTrKTeiWT7MCGHEFDwOSGaDKsC0S57/KcW203d/Zt0mzsTa+g0rxYTGiq9FWzRbIr2TOVehO6wyEi6bqefRrhbTy3IeCft3hr9muhOszUqSSC1zvympOqSfmdu8wjgvqL6bRvZz/45nvFSSuZJLaFQyyPy1uNJogFNeCt5da1RcAZdEFFJrvetnXMWwaqgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBNE5LCuzwyvFwR4ORzgj0SMZ3EikbH2HbbQ8Kiyx+c=;
 b=NoDe0OyCCcW8HPHwLWZ0NcplEz+x0hI/N3YPJZgB6qCdTrLFWRGy9We2/SYjeTtlblYbIvXT2OHcV23eymvmia+xToM6q8Mv1MfST0kU9sxay+KN/hZYPKxw3SO9qonf6pL5FloMmROTj0LuQZE+UYxZD7rLd3LKYJrLA6zIEDoUXXMbkiAuaIZRb6jiQv14lXWhI+ehUF9urUZS2bGtGocIFarJywKsvANKTswGE2g7IVHN5RlMgSWiiOaTw82b4R58bDEDm2BP2kS8iowGte8hYV9amFQqdSt3utTFte1mKJ0XZGKgdtAWex8lZYu2j7xQAhzaTMj3QXC0Uh925w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBNE5LCuzwyvFwR4ORzgj0SMZ3EikbH2HbbQ8Kiyx+c=;
 b=HnsIETk1cRDO/3S58KA5Yhy/3kPrdRX+VBIXwm5LOze0ZW8iLuDEDLeEgtrOUIJCosN4dSuBKik81qAAojfOVEbhFoJMPsh6VaKi70wNsd+wvRU8vBSmBPrgRidmQcvhhPYvkTfhHEWbqvwBIChDacYM6tprSzvPYGgVSt5EZbvc+sMS4Pk0E1ahr1arr5OQVlLKyIKgPJhQm65XeqOgAeAaKCU9gxn11Uj6+cn+PJhFpZDwVVpqJ7Xh0Io0qFPyUN6IoIUOmUzHusxFisQQYfpTNXnysGr1E2soJFufwIMcT1BsCaLiOWMXhvMY8NfgW+dhKJFYPmUzcGb6XEGCIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:07:16 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:07:15 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com,
	stable@vger.kernel.org
Subject: [PATCH v5 6/7] media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
Date: Thu, 22 May 2025 16:06:12 +0200
Message-Id: <20250522140613.104963-7-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0036.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::14) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 353897ae-4ced-40fa-f884-08dd9939f4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HoYaWzdaEnpZHzQcOBMPss7iK8f8yyeZyW0CUgRs6NMROq6btwArECjL36kZ?=
 =?us-ascii?Q?hPxVlOPdp5y2F5uPByawev4q8/NUGq/Hp9tASsyEaLEBFAx6q62YL5yX8OTO?=
 =?us-ascii?Q?vGYuIfjK25LQ3rqsthE+Y/7U9u+FsV+4BaY/CJC8+KJ08cuRryeBsdxP5AQ1?=
 =?us-ascii?Q?2kngPFPuH1f3RAA+xrMO5SrNWDhKkJdp8XGqtFVLDbum7VZ1KnV1MmWd4bke?=
 =?us-ascii?Q?vz95b+DHKZsZJombT1XKCPy9bbyXmjLZRRII5Gh5F4CmiycAndJMvh8K5sEQ?=
 =?us-ascii?Q?8MYpfE8l6ksu0uDXfJGSMoGcWG+T/oA69kt3uotWa/o5zOLDtPu048ZpM8+t?=
 =?us-ascii?Q?nPLL/qO2mxyMMEtud0Ocr7lxKFy7FKvG98nQ6fUnAsiTzrBnzeafPsEMVbIJ?=
 =?us-ascii?Q?QeQOkaRZ653N4boWMUKxmnpDUAwYKWwlVJegNN5bz4vbCzfUmrrqqXbmK3P6?=
 =?us-ascii?Q?S89dwMtlCLseRT80dGWSI6Q2Qdtf8IpKsuqNm2AIjcWaM3iS/6WNtPirJu8I?=
 =?us-ascii?Q?BdL1/JzxFlbDNa2edIMpRhfmda5BF9n+RKB/2YUOJ+j8on0y/WBa6ytUo3m9?=
 =?us-ascii?Q?Zw02Uembsh4SnbuX7TF6/PQEYAz1pL2B8YHwJiLQD8oMaXn3YhCAxyOjSf6w?=
 =?us-ascii?Q?0svy4wmpYjDDR+NQeWsYerj9EY7mImMIC//F0RGJeaOjajNeQJ+0DueDvByU?=
 =?us-ascii?Q?/12eRSZNRrvCXCyGbCWdm3uPl0gB+BXDdqLtPbic4Go2brp7/icjkylJSd7z?=
 =?us-ascii?Q?S5ohPHu3gVB5EdYB8Bnt/4XlLDVr+o9VhsfXu/6+u/AyIH60TPkBMUgTCnH9?=
 =?us-ascii?Q?aO4fXPS/eWy3iYliB+NJnY6ZQ+vVTve+WVQeomrP2FPm1P7RYcfm4r3hKdZY?=
 =?us-ascii?Q?PPbIdWuthyZXDjHbrk5BRNqTiGmLCOsAbDfUBl7EkDljhsLH45KnPFKiDAse?=
 =?us-ascii?Q?aHjIJK/94SdL71jBsDB1sSTcmdggBdlL6VjUraTDAmagtPo7OIrJQvg+nFNJ?=
 =?us-ascii?Q?8BpGZmufAxBIsBJndxYvdw8yHjG0DjRqBsD+DzUAMKBr+B1okXCH6Ya4pqxd?=
 =?us-ascii?Q?845AqVSrYf0TWifEJ9jAETQ0I/eDhaunWO4qU/YM41ZzQ71fNM87SARTb7Jn?=
 =?us-ascii?Q?Ods0O5cbzNoAtmXJAtlBSpMnRID4+9KMAByQtISxuiziT0APzfxy+4oTO5mU?=
 =?us-ascii?Q?O5R/Rixp6mAblMHVMKRqryLyh4kqCnwRdigGBfHuiD+cBD4/X2oGpWwOD5/U?=
 =?us-ascii?Q?lShsLHWQ2Pk2v+a2V2p9XX8fRWdHzO9QlNH9fSWltW7dSfLk5rMxhP0w9uLg?=
 =?us-ascii?Q?DPffA25vis2S4zuYWvFBV5vmyR+PToKWHqSe+F/QXZv47KF0w3ptwANPVEkD?=
 =?us-ascii?Q?7P2Gnwt389HfUAI+qdHDMCDUX2VtWh/Wxd95Z6SNgUGkPQXj2eFZ3v9HZHuX?=
 =?us-ascii?Q?TOBf1ilX9gqKRREnVbcp0URYJTvbgFx0jjX8JaHfqks0dwqvjLedgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r1LY5sqsx30Av8DrbiWxrlGOdsyuxTCvoznfqubvlc135VByUE+vt8nzeUut?=
 =?us-ascii?Q?uVeqGHlM2ZgZTc1LlAVfH3LMIc/Snuv1FYKyZdHNEitonUFCqcJJZV8iyaGi?=
 =?us-ascii?Q?R0+tn2OcPQ9JCqmB9sZbOqgOtD4ka1GzWIzSJu4IdqyhXwls9tNMUZC/Xyrz?=
 =?us-ascii?Q?8SFN64jXQoLrlL8UuyqPcVyq8SjTrEnzeS7Bn6HjMZnoUagHLWdgJYRxK6Hm?=
 =?us-ascii?Q?m8TivsLVKW2byZWT+ShTZp9tJ6Wbb9ewVJlciB+w1OsY7ZZuCc4QNrYG1/LX?=
 =?us-ascii?Q?BMgWOVS8LhBEOvtq4ywW9bBA+SzWQIaNOkXP8Kun1QAlKxJPTldo4dFODil5?=
 =?us-ascii?Q?ToV03XnaZp7cGtyTrqtniyxOnw73gtSmzCifW2vK3k84aJ5f+26JosbZD2Me?=
 =?us-ascii?Q?j1HtHnY2wSfGkKA9CC0tcRHfyabJjewyHtLugu9MEXIHHYtjJpaK1ujlBIT3?=
 =?us-ascii?Q?fzRorBT29N69CSBoq1Y435R3XHkE+OczF82zE6LGeQn1c15BQEIp68iVGIOb?=
 =?us-ascii?Q?UhZ9/eTEWUZ86ek+WjsJLLSJSS4XpAal1VBwZf5vWud6si2t1eQuyfMyx9kB?=
 =?us-ascii?Q?A26VevSq9m14SZCuj9leyRQk840GmwLwKztvHIWpKZnIuwqloNPRU0v6ppTv?=
 =?us-ascii?Q?rZKWwdjxnYx9UbiK9CJJoikykc2dvKqDHnJn+B4gf1kiDhi9KRvLfy7bqto4?=
 =?us-ascii?Q?IbcjglMkU6IasNhYe7JjBN6MsqKFGRcRSNBwDj2qiFAwAsamQ80K1Vxkll0w?=
 =?us-ascii?Q?fzwIhGpjn7Q+Rf3aQg3Y5c8l3XVBQv2ikWHoyjwHhHzWQpLzKznqNDoVie5F?=
 =?us-ascii?Q?RZb7KZysOcngo8ySSpvrgEM1IDzf265FYmXPD8bSk6Rcca6XDF2kM3H2sQCA?=
 =?us-ascii?Q?H0+YjKYkJKTQQbAD6nO/46DU2TcnAx+lX9PDXjt1/Rv2o0i8bZjzaSfaGDv0?=
 =?us-ascii?Q?XvX+O42IPjlprdrB0YkREP4LKwsYSquAa2e9b8fUYCRym7ELJOXPntsIndMU?=
 =?us-ascii?Q?rSRNh0QOLtQ3BuGiO/Z+ngK3hLIPEtfU1Vz2u9DXIwJY3Po/LgEgHvJHeq5/?=
 =?us-ascii?Q?aDUEUdxTjCyt/E8Hr//bMrooKaN6GksGhCJPhabdKZfEuiZ6QXa7tXqsEIND?=
 =?us-ascii?Q?30b+sU0yB1x28L/VueYBMmDqzKBZNeWierIVmR/tdmuuE1lTiPebEJTXsdbp?=
 =?us-ascii?Q?BySyqneeY7Qc0qEBjb+jba8XRbW8VRpycK0A49uXcuvwVMbJLfFIySTykuqY?=
 =?us-ascii?Q?VAenQWqsdEDkDUhBdwRRJe3Z2o8J99uhL0ZseXJXhaUFSEN+iw4gdvbqV5HY?=
 =?us-ascii?Q?0GdCIF0WdWLSXQcrAw6k8SV6UsW6SLOYhSeMPvEX56zMbxDF6GrXThBgAqVZ?=
 =?us-ascii?Q?fuh3w/whP6TfYhnpLWT07AvvIUnVA5C4YMWUuTM+vBJ1ALYTiLpQ7995+3/Z?=
 =?us-ascii?Q?t/RbgWuXugSBbSsbYXKG8KIeYwwwLiXmcQkBEvywwi6URyUkS6JJDU7Uq14g?=
 =?us-ascii?Q?1WCxwr4c+M5/5zj0k2QhJEdEm4VuMpH2xPJzFRBgVP2uR43VSa6Aj2oaQzhW?=
 =?us-ascii?Q?ekwkyQSrw6aCQ+0DxaAAmJwArmIjJ31rgQbFZ2np?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353897ae-4ced-40fa-f884-08dd9939f4cc
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:07:15.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VOqJQ7Wtsu0S/yY9bkhWG0tRXomnQUsLK/J2YpXaTekC9YfhnLl9LRJyQfMa2DpYmWqYs8dirW14jnUL1CkOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

Getting / Setting the frame interval using the V4L2 subdev pad ops
get_frame_interval/set_frame_interval causes a deadlock, as the
subdev state is locked in the [1] but also in the driver itself.

In [2] it's described that the caller is responsible to acquire and
release the lock in this case. Therefore, acquiring the lock in the
driver is wrong.

Remove the lock acquisitions/releases from mt9m114_ifp_get_frame_interval()
and mt9m114_ifp_set_frame_interval().

[1] drivers/media/v4l2-core/v4l2-subdev.c - line 1129
[2] Documentation/driver-api/media/v4l2-subdev.rst

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index e909c1227e51..9ff46c72dbc1 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1652,13 +1652,9 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
 	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(sensor->ifp.hdl.lock);
-
 	ival->numerator = 1;
 	ival->denominator = sensor->ifp.frame_rate;
 
-	mutex_unlock(sensor->ifp.hdl.lock);
-
 	return 0;
 }
 
@@ -1677,8 +1673,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(sensor->ifp.hdl.lock);
-
 	if (ival->numerator != 0 && ival->denominator != 0)
 		sensor->ifp.frame_rate = min_t(unsigned int,
 					       ival->denominator / ival->numerator,
@@ -1692,8 +1686,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	if (sensor->streaming)
 		ret = mt9m114_set_frame_rate(sensor);
 
-	mutex_unlock(sensor->ifp.hdl.lock);
-
 	return ret;
 }
 
-- 
2.34.1


