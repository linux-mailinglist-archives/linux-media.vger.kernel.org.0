Return-Path: <linux-media+bounces-39785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A64B2463B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92F8F1885966
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B5521256C;
	Wed, 13 Aug 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gnw6rR5g"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013042.outbound.protection.outlook.com [40.107.44.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDB212559;
	Wed, 13 Aug 2025 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078483; cv=fail; b=J7HQNHOtCJOmXmvvmxaAbbYf/mO6+7aPLrti+P32AnQbgWREreFfdSkwJ6MDfp6t/DuWBMeZ7rZqTVmvNZ2PJ+R9koqsQk7nuKn+8HWVSGpYdGB8l9TBMHaILxLd6k6buWIkycFgjKspSsns1cAHoCOl2evRDIVE/7sdXAs3u+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078483; c=relaxed/simple;
	bh=Elnh2wWHvHloYE1b0fbS/6tHCuS3DrFL372l6QCeGP8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YtMs9gfNgnjNXtxOT6PWwu42pnI5Zl73U45HNb/nbbEwoWi7p1KEppb7Uc03Nt7ioF6Vg9jo7GjeQm9OvV40sRSVgC8BDvWTFMnxL2830r2XuQVjShQRpPQMM+AgiXpjycHOBbWN7BeUzyw7xfuPWd2Nd18QFWp1rFm3+dEBgCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gnw6rR5g; arc=fail smtp.client-ip=40.107.44.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ztgid4Z1GVH9GwkFPqZv+szpd9dXyMxJIcugfK674cTmsED43+HIObs09yN4xJk1NENJ/Gc3nSqB4KbR9ERCCPiA+qKpBu92KRE+4mTwvY47ZoJFfwkZwj4Ax7CfR9wZet8QBY1J4Qe6WlEpA51PFB2Kz0uhc025kPbp47H82YVHW4N9M1nNIDktNsoWpPuZ5C+5sm1AzZOaxkCcmtrCriAQ2A8b9KZT5HlxuFrPkNwmGq/UO7p5CJYVuNl7GG1SgXV2zZCXE7Vv40KY8erzRrjQJcnJIiPeRrXUtsE7chDm4Gop41muTL8m2yRfIeEqnRUAxnNsM1uayWybXFXz4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeSu7LyNGxO+KDYxfbhm7yeadkPRYuOZcW9s4CaOS0Y=;
 b=t5EYkFkk+kI2gCrIwBjDZ56B6OXbihzvEDjMaTN8g5WBKxwFqGU0OX3UL7Td0ldWtUQN0LqgXKiq6m3KbF1yMmGFHiEEkKEjN2omI9P/ZU7r8XgYvFfC0jjkSJc7mZtKzYdC2kY2QzX6TsbdS9MBr3dfpWoqgr3kuAML3A8qYf4099dXMfqXO6YRpUHobE5Bl/cOOGju/oHjHxEsbSa4W7INGJXwBM0UoxJtewLhLrB7UR3J94oTPJtY8VIAlUkm8m+61lJQul2u+7Uz1pkvU1Cl4hynwGBvQqoeM2I/k4tDjLk+S1MRSUHRVUiwKKJj7fZHnMkqcv74wQnmp54TaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeSu7LyNGxO+KDYxfbhm7yeadkPRYuOZcW9s4CaOS0Y=;
 b=gnw6rR5gwYfzblUATK8RiXEMdvsczrwXQuXr8DlMM0b09WJvMaSRLvU7NRQFavU61q7//g22/SJ8Iys9K17GR7GIW0ziWkJhGpoGsQcAUVwOI171xoqStuBgrYcmnV0cBjFk15l4uWRf2wuw+328MkdnQNGUbtxvaWZYuXUC7jugQITkNWA5K4o+geAuQyr8BMjdgAnOVN3uehNHwYBwHBuXramoLYzkJDxqH26SZtqFDiLKLbopId1egomoWPsst4Ey4+320qXwnzj6xQzfkT5YjXxXVLO5KeoHqr4rGIADMzpYj+j4x5IiHbdLaQKaF78mPnB/bZDvTeG46vvhYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB6927.apcprd06.prod.outlook.com (2603:1096:101:1ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 09:47:58 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 09:47:58 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:V4L2 CAMERA SENSOR DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] media: imx296: Remove redundant semicolons
Date: Wed, 13 Aug 2025 17:47:46 +0800
Message-Id: <20250813094746.557013-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::26) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 850bce22-02c2-4a5d-eb59-08ddda4e7bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DwwNhcMlx8lpFVzn1/mSjMTQ5HSW4+R2w1AGUpqpWBk0HZDgGGb9WpMF8D63?=
 =?us-ascii?Q?dsFjsikj6Qq0F86J/o/cvqyLcEzb03rGCCridrSBwYlc0sjV8HoIJMZz+6nh?=
 =?us-ascii?Q?DdepMjUdFo9o5KsPxlgNXXGLweAFjWfP771IzGfuYOFrRDA5pohf9/XY45uG?=
 =?us-ascii?Q?/3cwfyT8aqWgNZIjhy9g5+DCD0pAedKtK8GvL7R7gdsHRe6y8oihCmQQsSOc?=
 =?us-ascii?Q?RV7TnTvRypQuIF9khhojT84GA4XBsSq2Wq2veFv7u/xo9Az76mEqO7zDG4Va?=
 =?us-ascii?Q?fsGqe0KXjSdW5PwJgMV8oRJaAMj3A6sMvcDg7+WFKvFlighE1ODIccTQAiZ5?=
 =?us-ascii?Q?Q9SZwNUJ/02ZJfpt0DkFhJa0eKIPlksLKCyJMr9Ki4X5jm9jTyX2lBDA/VOV?=
 =?us-ascii?Q?xaI40Qp9RVtfgcA7y7GTmKVt5DJExXAPb/NJEdBcwQu7SYPUbJI/CO7EEAtG?=
 =?us-ascii?Q?YlJ2FUSyOESEyMCs6KHKwidpFnn7J4AO1Hik28m7cesO2TmrGDboQIllrKqK?=
 =?us-ascii?Q?KyEB0am4p4WI9dpSl5IBjKTLpSEpJD9UFH8goH1S1IjDPk2aKM+paG5iidMu?=
 =?us-ascii?Q?MIGA5jzB1nG0TZxVrEKNwZwXqGsJMOCQ6DPkUnH4OVtHZOTnKOvSPWN+T35i?=
 =?us-ascii?Q?pgKRvkOnTyWUUuN66AEKFYfeu3Ul6m0h8jYlXqfoCTF4xL7qUdJRNzg2GU1s?=
 =?us-ascii?Q?GXZmgE0wznBIOhhCKu2tkf1k4J8MllJ77vUKs/xUy3rfZ9Utugy/f45wun4y?=
 =?us-ascii?Q?W0nFpbHBnDkU4ZLifdy+42SdPbWcr42Z/bb7LIgUdIeY9r6AkoBQLzusRUUI?=
 =?us-ascii?Q?sVvJ9zA/lj5oceS2psAZRolOATFFN5vrYLJxnWfk3o1omfzzFtTLVJSuqkXx?=
 =?us-ascii?Q?L0rgzGdYO6faE7mKJKacnj1ECLhZ2unyhMhbtSgy+nIEEIrfGAK/M4epkf4a?=
 =?us-ascii?Q?Ii07yrk7I6GbWm+rOsjsBZ8SuilK8+C6vyN29GAEjXlJY8Zx4Li3MlNTshGb?=
 =?us-ascii?Q?jWz/Rwzc2fUz77fUYb5Y8joWjUMzwlOKoT/g5Vd11JcRK1Enz5d4ZUCYN4pF?=
 =?us-ascii?Q?NdRB5vlFvToOpa+QeS+nZD9pYP5qEHRrra0iJYhWz+GUB8EU2WNQTfSSn4g/?=
 =?us-ascii?Q?wpLKWgBzH+m3IMZQQ3ihEJAuGfd0t07xoPdPxm+UwpZa2Pe3fu6zp4MfM1Ku?=
 =?us-ascii?Q?W79dHAGGmmKNQZQejCfVJ5Vq7EZ4pFJ2iirUi7OeOKC/S5oVKUyCMYkqYIy7?=
 =?us-ascii?Q?7CoGaHVuB+hUuFmOsjboDU0C9hSfL11HOXGS9rFnNUahZxfxV1uk+8Ijt4Qa?=
 =?us-ascii?Q?M5euuVstA9YS6ktp8gJWSRW921W491k5BZByr7owAl+Hy1EsKR+cfqHXl4Wr?=
 =?us-ascii?Q?lWsp2zF6ULftf3YnHSsIJcp5ksywqEp3NHQPIy+QzKYbPdeTwv9mPAg/M9+u?=
 =?us-ascii?Q?OW1A0qX1MxVwP9QKHVKIMCOOC2zyPV6sRwYtGElv/UAdhtnJpQGxHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XzRahhCUXgUuTSo5E+Rkz48VmqzQW2bOad9SrIUHMwYVivu/vKlkxpJmw97n?=
 =?us-ascii?Q?1D+dGVlVlOyYMCmjkFmcd8Fh5l2I4ohDJQbuq3EGLKfnAxw2In1KUOZFjT0w?=
 =?us-ascii?Q?z3t5BwBIUUgMAAlPU8Rg1tmyYZBACfzdypUZMQI6f7osZRymUzBw/SW3qCgw?=
 =?us-ascii?Q?wHqOLKcwibPe+zAneQQrDgBtGEgZHNFfvm1oHYL0xSX4DZmld/LZ2dtWYFVk?=
 =?us-ascii?Q?I+QZ0dA5Gu2QEIf2OAeFR0EFEkHwtaCOZFV1iJCmIv8LHhKQMSATjHTDBXJW?=
 =?us-ascii?Q?uo7zXGEV+iQaJjxvlsmBAtHnGDpqEKPqHQMxiCatc0LqrA91f855caGXvuX4?=
 =?us-ascii?Q?rsgozf3R2K6KtLOaR+cyTzuRfnknDZBH0FsAMiF95h9Idkul7k7fQ0caEbf3?=
 =?us-ascii?Q?NM++vQ6sCsgojMTPkVXodzUch+uaBQkCeJyRk4jTHh9JptNoXdS3hqXYqx1J?=
 =?us-ascii?Q?PfX0ZLFdP1I0OUk7QaHNQg2TRpiMVDkQAnW8k9bC9tRcOUkHgDYRB44ZWyU9?=
 =?us-ascii?Q?XTm8dlRBwO7uQ9BCbXWBMWA5TrBq7y3WJpHcjM3nJJ06QhX6N17Eol14lBRZ?=
 =?us-ascii?Q?DaJEY5zA/P9cwa/WAmO6EyWUke8r3UrakVVCRxPT/7ZD2FpRE3JlMWaMAxRR?=
 =?us-ascii?Q?hz25GPdryk7e9oFknlSU34oZ1+vQvWtMEuB13C/j6tlJ3Dp2nVzJj4TUQ9QT?=
 =?us-ascii?Q?CfccDDEM3oVzkpN+d9RkUQNIYIPuXR3x0IGWB72lTM0N/46uONS+tHL/xZWi?=
 =?us-ascii?Q?UaZEtTJOmTIPcb4BSYOm8WpWISeOTMh/jUZ9V9/82T4ez5dQo9VrfOswhgR/?=
 =?us-ascii?Q?x8DvGUjSb8BwM9IM7ayVc7DxyJ9MIquLXRu8CkAgDPq4dkLUzyEbHaCY3qYr?=
 =?us-ascii?Q?kAzUolpT0P5N21IMV63oOwVwyljYUEgqS6wVw8a+kYQ4zQANHg87rOLCV+js?=
 =?us-ascii?Q?frazozcieLYj520aQ7QGgelJ7/BHrivWh4cxP8p0cT65zyh5HRC9/A4Covid?=
 =?us-ascii?Q?ZSSGWwef6gWk6W4D/yHCKLxq6cbuNAmNzDxt647HvkOMhp2chSN3R+GrxGVT?=
 =?us-ascii?Q?21PPFTQTUj7jnIqVk5m58YlPzTxxQ7oqIcdLH5v6pQ4xXOEqP3O1eZ4JHndn?=
 =?us-ascii?Q?eLXAqo9JhlhE7ekGyhxTuDFJsnQVC7alyyK0/lszKmURldGHOk6GWPefXsNV?=
 =?us-ascii?Q?rSDBx/npmkX/h/+MNm3xwzf84SCc1YIIeJTjNJpJR4h1Q+LJW4QhMQYU2nps?=
 =?us-ascii?Q?jSiO1qrB5pn4q5rshhoSwa6oIV0+sqqegmgkvqDcuYb8hPig7YyZTsk77m0u?=
 =?us-ascii?Q?mcLx8ock1ZiSBSsAInq32GAY07rcmoNYsEcnMre+riTyZgwOGsIrwnKo07OP?=
 =?us-ascii?Q?G1WSFDAPINuCqbrwxWezIoNo3QMH1Vsh+MyKMIDmY0UXHkUaGMGmAvtDnirU?=
 =?us-ascii?Q?ttvb/+6RIhldddiRoBIvAZktO8HUJWDZpku4nxe+4JVohwtU42XD7Ua+wKeo?=
 =?us-ascii?Q?9Kyx+rUH2Xr6JV7RhMGdJysdi0Q89ca4qynhFqI8pFJ73+pI1yCN/9uBhGgj?=
 =?us-ascii?Q?+/0yo+Gph2iffFqKFYbAfZccDlbENKG37tOBkXCD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850bce22-02c2-4a5d-eb59-08ddda4e7bec
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:47:58.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoeYvMuwee/nCbTZFIKiNW8avjVLyH6NHOLr4xwuGumrmWRDaLIWAi4hMG7XyiLBqQSp1eijhybV/HU3dz6wmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6927

Remove unnecessary semicolons.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/media/i2c/imx296.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index f3bec16b527c..cbbe0e7a37a9 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -922,7 +922,7 @@ static int imx296_read_temperature(struct imx296 *sensor, int *temp)
 
 	tmdout &= IMX296_TMDOUT_MASK;
 
-	/* T(°C) = 246.312 - 0.304 * TMDOUT */;
+	/* T(°C) = 246.312 - 0.304 * TMDOUT */
 	*temp = 246312 - 304 * tmdout;
 
 	return imx296_write(sensor, IMX296_TMDCTRL, 0, NULL);
-- 
2.34.1


