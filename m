Return-Path: <linux-media+bounces-28979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE4A75462
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1ECB7A8273
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BEC1ADC9B;
	Sat, 29 Mar 2025 05:45:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021123.outbound.protection.outlook.com [40.107.57.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368331ADC7F;
	Sat, 29 Mar 2025 05:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227144; cv=fail; b=YBzBpxXcYRHMuINot4WZ19RaCIV2f/A5PyzTaSTVrRXTX23Hurb1KzQVhum2MNnfYzW8+nNJF6mltVid8g1vTUFdZ6xMZ9ie/JEcH0++oNHBDljrErzpu4VnS9lS7U5O3Px6DpfG8Q51cfRCTcUXKxP7sOkq1bsGpA06PU2C1GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227144; c=relaxed/simple;
	bh=6a9I32LonJ8NRmEo1vrjcWwHqalQmswIA2RjzYUTxyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jyqc/CTrTL7bjffPdCU8Oh7DAAxUXw7qJ6/gqaGP+BvTy/RL92Op6i9hUlnYDkW/5GfXE1a7kKNSmyFOCxIM0R4ANcGpJiDrMBS9kNVEYxRCe8hvI+iAiKxNdAuwpnA5xQk06AUcJgxYJCGOzG+ZAXGnughrfMXX08ChEN/3ytQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y76pHloG0aziOzH5ZLctf9YLK3tfBxT8UeBgDMvrUEeI6tCAM93Wz7vHXQGoVEOV2X1EOV7QBx4xlCqrw29ApLE7p5oYV2vZxtk9IY3K8SwUlP5W7iBqlY7sY0AW8M5zEnZZkx358ublypFhR3cjcOiS4u6OjOO1A6jDltqg//nRpWV9o44BOV3Jd0QHw1I3am86bMpSTgeGqG9zG4gaeq0RU8guoJqDm35K+NzREeLgrUVTLJOF4SS7eKyWs3gNZ8TtGHqIHzbhso+YhXc5/Xf7PI+oCeHKoyjF81yHob9UvuL45wfDflf6J6wTO8HD78Sj+tsX8G8x58nvVNs5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dszm1Xu3vn82UX0LS7a7CASGu/2sx7EC2Q3wcdMX7pE=;
 b=GJ7YPSCl5lepk7HiZvEN49eV2SBXasN0y+7XA6oq9hV0t1jjyi2FuSGFPlRrEE1ZcL09i5Za9iiP9XgQD69T1lw87K6+TTCA7nTzdp//TwlMbXDAZCkRZWZdpTGaEWa+47XKROyv0eU6c7s/nsIT7BQnjLHawpSW0C4m7CKnXRSwVU3dtWLOTcdi+B/55VBKHIGiVIafQfRsC8kozVInjEGiEK3n0D24wp39TKK/LTyxzukdD/cq8AcSKR9cZuP4I9wvFRSWW1y5ZKbrfPyWdJh4iHw8/tBbylp6wIF1r1B2ReYw1W/GxCtSpgY7jUajGmQlalWMM9znpUM6jyg+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:40 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:40 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Luis Garcia <git@luigi311.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] media: i2c: imx334: Fix runtime PM handling in remove function
Date: Sat, 29 Mar 2025 11:13:28 +0530
Message-Id: <20250329054335.19931-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac44836-3a75-4de7-3dd2-08dd6e84f046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yW30YdQzPnHHBXf3eqH3v9tG/HoUFYnpQCM99JzDFubY1CfXr+eQHsSM7j99?=
 =?us-ascii?Q?psIVL/XB63B/TKZ/jCGt/FCIgmmtNbGRwp3RsDGTTNshGiOznlnvHB6JTyAm?=
 =?us-ascii?Q?EUkhwBx3LuvW7G5NsDgF942ZkWloATm+gTIao6KEklq7cFIP9gF57+gMtnUe?=
 =?us-ascii?Q?+FUOgJ00YqNwHdE4Ac4aqnnTeENzPH4Z6YQwsirwkBmrbOVWtK3qT3t2C4PZ?=
 =?us-ascii?Q?PtPhnZ8fSK9pMrVgfjUsquYgdcU5miXb3JFLvpsh+v1X9AZ0S65sHwnf6OBX?=
 =?us-ascii?Q?qWnATOJshlj5tFLVY0Nzx97rMoKYOfRXeP1vQ1SBRSLtsXoewY4ZlF9dSTeG?=
 =?us-ascii?Q?6B/M2KP2dJ2KL+AfXd4AFQxD/lHsrTHJy1WOUm3IT3WqUd0ER/Xg/cQVQVb8?=
 =?us-ascii?Q?Sy3Ylh1ZzihC5c7KN57/Ta+BXl7U+SULh3OTyqXb42WMNJKji6WwDL+zOVV0?=
 =?us-ascii?Q?3vYN2G66nelRbkgqDRKf+8xR2sMaRtJg/8VWzeWrjQ3fjO9Dwh25uBOweX5M?=
 =?us-ascii?Q?CvU9uUqyw7XNKVZiyF+gW88Fydn+Edr8U+l5g4tFZ+nfVttojtZiNqAdENhG?=
 =?us-ascii?Q?RMZVZtLg/PrXayal34pF5TGTvpaf2uOKjHSydPpsC7J7PCZLaU0tpBJtIHoP?=
 =?us-ascii?Q?WfzHasJMPPenfvdcCVrv9bryfCTUu2Faeja91g+LoiAPg+I+O+3J6PsiBr5O?=
 =?us-ascii?Q?wAqe5wlFwtBCDEj4FTF29nRZZVqbr7gfKGKY0oAaBgSsyE7w2u/AO3/8Wk6i?=
 =?us-ascii?Q?GL14vE0VFVeCoGX9rWiO1XpbWM7pc2KFvhkRYKdz/DR3jY0G0m8cid/r9V8o?=
 =?us-ascii?Q?4IGZlwPt58BejXMUj8Gg1qbt9tk4XyZwJYfm0+nM1m1+wf/SQm556ktFQL55?=
 =?us-ascii?Q?d16wqkfmrz4FOuhQwy8qW3t/5Fbro+qgo47jtSkH/qB4PmHxZWbGZ+RMgKeu?=
 =?us-ascii?Q?OkGRIUf3gj7/4EzrNBGp78J8S80rFOk9cMj312FOmqXdNKmPG8VaMAY4IAxr?=
 =?us-ascii?Q?iNCOjZwbK4UQp+t6WRZzCgBcGyiBwUvTtKGjLTMrvLlYazHNhDyk+qKIcgHc?=
 =?us-ascii?Q?vrxiMhZVgbWt2mJcYV1WwQFJRbbu+oZHA3A5e1uTNzFMlIog39vBvAaotioI?=
 =?us-ascii?Q?eX/AuK+wlcXVCjkL27IxLc1KLOUAvmnFOc1P391A1gw30VZHEhECsQSukcyO?=
 =?us-ascii?Q?hiePkd0C66Ev3OgI5E2/zXk3pEWVVt/LzS+nzDbrlpJ/O1QFYtRQIkw7Ws1R?=
 =?us-ascii?Q?BwTr0CnlBm40T1JJky9q8rS8mVyfBZqPm0WnXkXKKG1lnLjUABigmJns8OID?=
 =?us-ascii?Q?8e/BqYYZ8eLNEzp4U6d4WBz45S86Goez3o6wGhUjooRBrwomSqbHfrpk8PbG?=
 =?us-ascii?Q?+wOWSQJVc8MeB3a6Kj4vAFjpvX++qAPdzL35Wfvqm1X1eyjhutV9NvLxOL6S?=
 =?us-ascii?Q?YkVo6s+sT7PdIumOimmJdanrSimK68sSEY/8TRzK4v2PqHHw3J46dg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SeT+Q2YJCuBGoJxRK1TNnWMQ0pdKE0PxcgRgpv2XdgGtZGECuIBFgm1QWwtS?=
 =?us-ascii?Q?4aItXMVjrpK68OWkKP4oyBIZs5Mhvgps49UhUKZNHSrpzN/iQ2GC3igjIfi9?=
 =?us-ascii?Q?xLyWJnBXpz860ZpnCea3cik0TPr1Z5npmtwyHSkM/dAG6G3SNpP0On6KuSJy?=
 =?us-ascii?Q?JnhanTJYmIyFd+7jYLWw2yIrBX17iu78SBzfcejTA5RDU2TvUITE52ubpHyQ?=
 =?us-ascii?Q?/9vVs097sBTOHqUq/tPMumGZ3wmS8wvs8q10nYyCwwTo6wj4gyz/M4PJW41X?=
 =?us-ascii?Q?8v326BzmJeAL9o4EdGCj79kAocXGkbi1zhVvDHjRrAa+RtB4ev+Dq1iYhYQ4?=
 =?us-ascii?Q?2er2O6LREaZhxvKrGZs1kKrfjEz7Kz0zkyiYeeEiif+qxeGOOlTCneIz69/b?=
 =?us-ascii?Q?kzpxCnvBTnFhxSDyQVPKjv6W/hRp5mCG4/MRe5TdFTh28kGURn7GISDLW41H?=
 =?us-ascii?Q?2cF4o55sOPaTBqqm2C62M37JAluGHx/SwbzbLp3z19seUY+QFO/BdJw6OEBh?=
 =?us-ascii?Q?tNa6yCTM9u9ss/O9u+aUy2eZ5Oglegq63tctLytjj3gkzT1xh3gglDIH/ZkE?=
 =?us-ascii?Q?AwRPA6XMRu1QciaEq16jGgzFnXpKtL2Sp1h70zTjdcsWsj/Q3PvesUPH4J7U?=
 =?us-ascii?Q?B/1lnDK3Rngnj2OH1eNy88K2XNfBEZEAuYvkJQDy+hX005i3X0Y1yLmYp5aI?=
 =?us-ascii?Q?GuQyAnX7qLU8wfKe7/CsNbs+/eIeQH99dks90MAaBTYiymy/KnzgXdFHV5Ww?=
 =?us-ascii?Q?wh65VCzzRqxhvr48m4qZDOmq7qb0/vJcvmWtVFl8T3iPoJ70X3nbsQV/1nnc?=
 =?us-ascii?Q?WbBCisoWFcBsSjCLJuL1FsCE9E4cM0ElajtyLwByg2/TP3/3C8Yy3+PZi8dP?=
 =?us-ascii?Q?jzwtaO6Aa5haGkqpEVDozasUAw7LQ0rnQoo5GHNFKtBMw+Me0F8oJ677JOGa?=
 =?us-ascii?Q?7EatGXdY9Ef7sOSIRQ0JAEw5wVJrVVQi60PLPhYxaOhy4gidsvxCEOm2du1S?=
 =?us-ascii?Q?ZH+46DHkz/tAYrEjtjOC523LtFFVJ+RgtWjN2J8SzSjP5pwXFkDvJI1F7G71?=
 =?us-ascii?Q?pbTiyiFht+lyODrMEg7rH8TM3AJx5kq3U3F8AMabxWCAKLgxfEAGfaE4tbpx?=
 =?us-ascii?Q?BUyXhX2W8x9tbXEbDldKfhK2NHnWu32CkcbQWaoqJkDrL0fkNjwKrN8xMQCg?=
 =?us-ascii?Q?i3NhsQyvpJGu7NLwRgI+sshY4R3RrLfwDUP9VjW3yDe2/WMQ+Qn8R2HquT56?=
 =?us-ascii?Q?8tG9VU6FiE9AjZPRo2cUuHcrSCV6+Ko6VSD2yIp29kCmkv1GrMmhbxHBdekE?=
 =?us-ascii?Q?D9riAGBPgE0tzbmfDMPJPa6PdysETS4UUKL85/GCRNhLhDKoP0Wx6/PaJpPk?=
 =?us-ascii?Q?+xBM6AF1i6NvHfvlRiqQH/pFNsaEbK0CIIwuaifNLBd0gtk9aymuuoVyZwKw?=
 =?us-ascii?Q?BuL7fr08PnWm0VrGZcmlp0NV10l2Otim/sBPLdFdS4fsNXx6DYhiBu1hx2p9?=
 =?us-ascii?Q?xcsWwFQAO6rEd0mr/fO7+qLGvnERpAP+8WgyDmCfj8nvGcuuf/dUMvUbV0+R?=
 =?us-ascii?Q?Gr5gaXcoQOjN12tmJfkcYMh1Ohund/cqTjQYfyzaGx3PuQOawIaSPa32rnXx?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac44836-3a75-4de7-3dd2-08dd6e84f046
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:40.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKIUXweFRYN8prGxD1A/YuIcB9xmDREfnIZGmWmF/aXO2fYWkwtOnlEKPY6sp2/9TWOKCUXOSt62sRbgl8NbQGZZl7W9/ceJn8B70tMjef4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

pm_runtime_suspended() only checks the current runtime PM status and does
not modify it, making it ineffective in this context. This could result in
improper power management if the device remains active when removed.

This patch fixes the issue by introducing a check with
pm_runtime_status_suspended() to determine if the device is already 
suspended. If it is not, it calls imx334_power_off() to power down the 
device and then uses pm_runtime_set_suspended() to correctly update the 
runtime PM status to suspended.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 56d5576ccf94..ad28f12c29b3 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1328,7 +1328,10 @@ static void imx334_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
-	pm_runtime_suspended(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		imx334_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	mutex_destroy(&imx334->mutex);
 }
-- 
2.34.1


