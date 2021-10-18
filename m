Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945204311C4
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 10:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhJRIEe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 04:04:34 -0400
Received: from mail-eopbgr1310094.outbound.protection.outlook.com ([40.107.131.94]:13608
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231130AbhJRIEZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 04:04:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6SifAGdABadd0PJQrAtEPxTwPBu3hHOwlhyaWQvjCTyOo0DPoRXZcfF2u2pgheq5ks28PtHDzimzsctN9sn2kB7pMZXi8nxS16H7aIyahVkbF4sl6a9PVB6BueiH5Qz7t9Eu7ONIKx5NwfqTYN8fcGUvVcX+AN4SvBgtKi+JtkdRGPJDOiXubZMg8VTs/bag1AXhKJVTF/yLGsOeESMcfQ7XIdQqpBbcQAZ/pk6VEfbMSUDmC/eF65J+Kmr9ILOAKwTOE8MRfW2nWa7OgMV+vwPk2XcmcuNzpEHEbqBi+s0ZUvd2aYGhLWX0NLjxzYTZlD/P/tg4BM60DbJGtK8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4O86sOQAbabQgTUcFLdZ41x44OMVi9CmoYEOs8wZO0=;
 b=PwuwwmIwc0swl3b/S2GEhVQQi7rA58roZYYhHVF5yL7P15K9YJut1YsaWwp6e6o/EDEX2OnosopalQhyjoedN0zofCvuhvIXWBCqsUQewduzer91ORexO45Qb5PLzFSQHWWIGK2p589LsRGDpsNA0PlMGEKYqwDgooK769MDT/wM1Fjtqaju21MeX9ASiIZV3rfOqoTfkY16NCem5ZRSJr4fgIQSVAFpr2jbxUGWcLwlFD296x/4bCtQd4jwFqPStaOXjHiagu6z2n7sWbyl3jbbOp9VmAI4ridZfPiX1wp7K7IgMH+jN6j+PhYnhKCFdFVKkOPHI65KwOwgUjzamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4O86sOQAbabQgTUcFLdZ41x44OMVi9CmoYEOs8wZO0=;
 b=nr3ha10QGu8vvq6OA1kNAXVy5KpqI70wQJSgkGqfSAWd6pygrUzzxqGJFS0Fmf6sSDnmYrspK1AtC72XS3Ac3tYQLGH2N3fTwXfuWf45tGsfBc4LwIc3L9BSp4Uclmicrd/tJmufuWSdXvALqvSxVuF5KkdGPZTdp1OieInyurs=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3387.apcprd06.prod.outlook.com (2603:1096:100:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Mon, 18 Oct
 2021 08:00:47 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:00:47 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH V2] media: i2c: ccs: replace snprintf in show functions with sysfs_emit
Date:   Mon, 18 Oct 2021 01:00:36 -0700
Message-Id: <1634544036-36868-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0143.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::23) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by SG2PR01CA0143.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 08:00:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8199ea28-50ee-4e74-6a76-08d9920d64cd
X-MS-TrafficTypeDiagnostic: SL2PR06MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB338796D09A9249C8A28697E4BDBC9@SL2PR06MB3387.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8EExe0be9OsB3RJZcy9XruFoLJLjwytio3Sm23pe/ik2b6hiUdFHrCj/MLKQUTtTpOxCtBDNBAQCESTbj5RaWpfSgOz+WZMzqCERS3OGbaJjb6aUhlA/cHKFYC8DRT5reYzWF11W5tlPQmAlH9wNjDFXU+12P/tcZEkPaFN6k6M9mbHCttZNMYVU3oZTddLT/aFBWSMm/TtHjqH0VssW/E1v17/l3s9s1AMEjyuE6IigW6V+QcFwq6km8XDbb1CDHuZ2w33/iz85TOqyJcEIKGKXOh9smOc+rZsBFnI47+OfMDEcYFVwg/5u6dh8Fv8cfFKJ++Rb46cwtb3hHeb6sxIj/vJdVYOmeYMB1OiWLF4CqWYRYp+K2n7fnEn55tA1K1hE/i7tmp1Re+mMAmcGjeoQJoj7Y+LSxfNeOYwtlUw+9Zn5v82FGoUS6g51BN3n+yqsZhd7g+ROEXQX01Tc4xxP4zyIS2xrDjNu1NtVmvBZd2xYsA3EoK8CSUQV0gMkj3HTWVv8sJpnsISCPpw9DN/RNC2zhljxy3jpb8vlcAFkfozzBIvGy7ZhrvjtWm/yuvfWUrfxD1AukKeXHhceN/xfM+Uw6Jf+E/i2V5aOVQfxGz2jP8DLMt4qdXZdBvqKGlNICjvbgFx9v80Cd5x/0uae6OsLWdZI0Q1/h3CDH+eAP0VS4Z+x2oV0wDttNli+0m7FW9KRUUT2kxng1WzBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(36756003)(52116002)(6666004)(316002)(5660300002)(110136005)(2906002)(8676002)(186003)(38100700002)(4326008)(38350700002)(86362001)(6486002)(8936002)(508600001)(6512007)(26005)(6506007)(107886003)(956004)(2616005)(66946007)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MPcXa7KzrtrqlSIiIIN5LgkAYgIz9v8Nj13bfDgYokQF85bzAhYMxIig5vR0?=
 =?us-ascii?Q?vX1UQqouNKh3AdhvXQ8Q2hvCI9pUI7+y8pk4IwgB2xPQfcm02XUBtdX9KTkC?=
 =?us-ascii?Q?hv80sSr9WaQsIEgcT0G6uuJmytyI5UdCpuM4QzxpZ+//uBFUzxXYwlRBXeWI?=
 =?us-ascii?Q?i8fB40GVzxBSWp/TA2vb5oEvl5FQWZPzgmFq0+AJ0dpvBwwUHsCEFP2A2++f?=
 =?us-ascii?Q?ueXO3932p4LP656jHqwyLakLPgPYotS5ksbNbNGFY8FBaORtN4rdtE5HsGIi?=
 =?us-ascii?Q?6czc6mPWub+j8JH9a8R3y6kwd+Wc98BlVxiO+PS7bLiN/aTvbi1BoUCiSjq/?=
 =?us-ascii?Q?2b8kijgwzoKqYW/GuBtKBGSQPWb3lyNwI+B2Bqs+aqi7kaL4hlc9lO2AOEl4?=
 =?us-ascii?Q?p1ib68fVfK3LIMl7HGjGDcrHI2dIW+Hth11hrI8vnJdKwdK/8+mbj9ZBUbRt?=
 =?us-ascii?Q?Zm/gxVnBj7Dl3z6wbyNDX/RPbYeKaz1ac4Z1BR9ns9tDxR3Dn/TXiiSg8XFg?=
 =?us-ascii?Q?PnXMfMXvuFussg3uIvskEDaQk2rJ2NYFJgx7qPt1iiZrrgC/acUXdfnfIB9g?=
 =?us-ascii?Q?03CGL+kMtIesQ4LSdb51c0Ke/CrsUhB6CDuV/7wdJ/7yOitbwwzvxPjCLsF3?=
 =?us-ascii?Q?C0du6JfJawKNDPeKAHoAH0S8+IdtwlnDqMwdtOCbxKxnWobHANVhmwtPM6sN?=
 =?us-ascii?Q?uMjCBAWnHMBGTEC5ga0B216Cm87B4M1USJ7ltC1YEzoMDyRaili88G7nvEUo?=
 =?us-ascii?Q?9HGVZ6tSQcJq9grSlUP1jpjABCIB6yoYsCxSyGr+tNSD8IrSXpOSb6h1edCq?=
 =?us-ascii?Q?udaEqP9KwNIhVoxaXGssTDdFhJETgAgvGvRnFxQJI6S6anyOBb7GG7oWesKF?=
 =?us-ascii?Q?oeMwVGIvR85J5DpByy02rHIsvBTSNqgAusoDa4WLl23zlp4Qjsce8AiibpO8?=
 =?us-ascii?Q?TqoOXZTIYxBcKas1bxcq5gftuIeJLCJbdFRyrbk1Sefc0ACN9f1G+aKfd2cr?=
 =?us-ascii?Q?zRE+EDYNZ4e5QoAcU0BzWAp1K+/ajzEzLwj23BA/qVeUBTWi6NEqOmQl40vb?=
 =?us-ascii?Q?xTXXvhAcmleG1p96rT8YzijAAC37WtqjmccVCFCDpLXh9Xd3wGo4FxrEq8kk?=
 =?us-ascii?Q?WEpNHCdmtwirlLapQ/S40zTRTCQYAQwjXaD6DKuB7VEBtI9G4kyVRkDSdd+k?=
 =?us-ascii?Q?ZvUOUiBoJGqcGTWvQvfNZ8ZKMWIC1mg4vgEJ9ANlMG0JMRYK7RtXApUZSXoy?=
 =?us-ascii?Q?PkDPOUVSfsfjs5PTLbwVDQG2jKdo5yLvPo0buO/CEa4cuVoDTougaKmZaAS+?=
 =?us-ascii?Q?JwpeUfDgjFQwCn5hpCIOmFDi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8199ea28-50ee-4e74-6a76-08d9920d64cd
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:00:47.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4P+Fq1C2KYZqSb4csRpMgbnftYBIC3rhe9FAdEmFV8Bob7X+yMRte9dQRlRZ/CeOBiGgfRFmTialiepILoMXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3387
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

show() should not use snprintf() when formatting the value to be
returned to user space.

Fix the following coccicheck warning:
drivers/media/i2c/ccs/ccs-core.c:3761: WARNING: use scnprintf or sprintf.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 5363f3b..9158d3c
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2758,13 +2758,13 @@ ident_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct ccs_module_info *minfo = &sensor->minfo;
 
 	if (minfo->mipi_manufacturer_id)
-		return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
-				minfo->mipi_manufacturer_id, minfo->model_id,
-				minfo->revision_number) + 1;
+		return sysfs_emit(buf, "%4.4x%4.4x%2.2x\n",
+				    minfo->mipi_manufacturer_id, minfo->model_id,
+				    minfo->revision_number) + 1;
 	else
-		return snprintf(buf, PAGE_SIZE, "%2.2x%4.4x%2.2x\n",
-				minfo->smia_manufacturer_id, minfo->model_id,
-				minfo->revision_number) + 1;
+		return sysfs_emit(buf, "%2.2x%4.4x%2.2x\n",
+				    minfo->smia_manufacturer_id, minfo->model_id,
+				    minfo->revision_number) + 1;
 }
 static DEVICE_ATTR_RO(ident);
 
-- 
2.7.4

