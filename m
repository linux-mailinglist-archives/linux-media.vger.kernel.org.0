Return-Path: <linux-media+bounces-57008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI+LG6PPw2nuuAQAu9opvQ
	(envelope-from <linux-media+bounces-57008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:05:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE263246AF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E32231228F8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C503D47C8;
	Wed, 25 Mar 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="MdSv5pby"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020117.outbound.protection.outlook.com [52.101.227.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A83D1CC0;
	Wed, 25 Mar 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439272; cv=fail; b=TZRhCc3JFl28ixmqnC0p1G65qcQGOWYYz6ZndcUlDZGawAZ4tk+V5eoGy7So8BHWDd+BKoLLt+VKPz6MZh1u7UuZEQIg9pYiT3/DQQdxVg3l3JriIiPujLYiZEYuXisj91DUdXSfMnvmrYErxPHvh2TK/49ufozQHdRb1r50qBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439272; c=relaxed/simple;
	bh=gX9mn3wuDX1yBRmG5gFeT/aYslwp2JHUCQb8gh7YS6U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PiEWAkoouqTpxOAik9gqWSQpzOKpt4k0v7+fd1E361ql/tFNQ5N9Vcdwsu6kQWOXxjf2qpKM0Qzw5p0e6oYhsgXiCu8Xa9pqYrFw8OBCGVmZ6O8NZOkEW2dNLxvCU5ITEnzK1j0MRv+QmkdI2FsK+HkMzV8xUQqlCXpUyH91aAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MdSv5pby; arc=fail smtp.client-ip=52.101.227.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFpWTSrxPBIaicqntTW1uD30cSACctfIBS6hOMZDpoq3yeXG+YVXKigvKUZG6Nl7/ObhrgniHIEcI8XnT81bEGthMQvBoh2SpUHbVnDxZ+RrirumrvjlVp2UBhAYnD9QsA9zqKEAycSCmcWb2/Xxa8O18YYNnADAT4RSs7aMWPxW5OEOVZmNWDL1v2kkVyiW8vtpFUe897Tv3OKCzkFuaFyvt7XjpDfnaweKR5HCNGdxhi+Jkd26YMuMNpzRy9tarWiOv9eQ54qXWW5xClaeCcSjHmzShVw6w4SoOqLxur5M3+ZHYJ+vPo5tkSf5lo/xfum6ESmgq5SUxSBH4u/nYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yg2CnANZW4m3CptM0Td2WkiyB7eit3Sf9FhnKNcttLI=;
 b=TnkGrI/1NxXV2jpChSIqrrJCE/XWf79qltygZUHfMOxNcjzGtoKJ5aSOVWpDHBEvVdqbyJ+kj4wlUUvjTff+KSqjHmrrO7CrxB/GD/FG78nEYvIThWDUCPYW/zuGvzcLrZESgQRYUhzYWWFWPpY77ekNEM8TSm3Mh07KhEKVx4QhsVNzTHDJhsMR97R67fe14g8Z+BNPeII4K2UA3sLd37FTywREAmy3cW2VcRXp9wHvWFozatpSafpmumC1jLISMAAOpWIxrcmPljp5CmyudxevligqX30bfZ+9B/sIOzQ+gHfhRUyiXnFuBEZgKhCq6lSZ0cxC1ZJBpPhUZX7tOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg2CnANZW4m3CptM0Td2WkiyB7eit3Sf9FhnKNcttLI=;
 b=MdSv5pbyO/CA2Mh87g6Y2Fyougz/oCykgo2dqivblu7G3YF354qhdTYAiedXs1J47XxRChU8MXCFqZosiVX0mTosY9y9DZNYzw8IHM4APDxWjOAS92eweQc1jin5vDX91WwHJicQABKgX9RLsyG0DTGey4BepXyDHIzIJDc6hxjrQmhf6078Jv7AK8iixrGs9ZI4GzbfXKULfIHPf73tdPCQfEqp2B0FblxFU7yRMTIot/utypb/qnq0L/dvgaB+5cHYhvrQ1WFMopHhzAm5ZABmDvhxj+GAlFPvQgnuFUbtqMA9aOPeOV2EOr0EVi/YVKu8R6xxpWi53MbTbr2SvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4294.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:47:47 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:47 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/15] media: i2c: os05b10: Add test pattern options
Date: Wed, 25 Mar 2026 17:13:53 +0530
Message-Id: <20260325114404.95188-8-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db4c79f-0623-44a3-0efe-08de8a645608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YVCh/jgmg/f/KaSALG4EABitS4KYaMNfjenmKEqUYGBoceU5WppI6GLufI5pNuqZ27xVXZ0l3OxnZ2syQZlmcz2dftUsGGJDZE18bsIbBhbpk177qOWZiAP7IpeaHeo20KiXZcrT9eoNQTrKq6DilQ9R2+we8gv/W+m063wg3fRcb0CZmNZyCnm+IYSXPz+K9g8LBxEoCU+OwUPR7XHYh8gxbY8jPwlOoyuI6PWj3s9u81bYpwJ0b3rjfnkpfwZwTw+5HdY+77/jopAwnMxzMLu1V6dwO886KCpew86McQ6u8q1s2876QSwgTgFLSfKYyVg0wvhV+OWTAQ7yuM9Y++ZvraBOLiufj+eeg1rKTY2QaOSahcRZv9FNkZHYHYMzlzKsCAHmtzzXACkhuvZOJLzSgk3yqZLwXWSTQndMSdyVotv6SLsBtdfDk4XDIGxBXcJBJRFDSNouB9BQjlRto+EalNfOFKyu1Prm+Uh/U4wygLaK66GCBkdftwkV2iP6j//gWUoSm9/TmG+vKKHzIv2u6QxjgGB8ihklKx2IubCRO0Tc48pdWiRsbhEtB7AteyQuHPJQQtnloT5kP6Y2hGAHfLbD/dYHosdGPG+eBUlcg53WW8oWNnaZfP9Gr7iUNz71YNFKbyECUXKnDbg4agZpvPptli3nBCQ6yryB4pEEco0ffoVpvbPXiLzE2CbKS4ri+2R091cnjhY/iuzaJjcB4/o20gGS6sRpzPhGbBQeppLsUB2hqfBGTNLd0aQht+vRCt8+5GFG8mR/9SgIx3w4eEc6Nib/WE3NIzLvGiE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DUFcE1o1S1wDC4oayxJy9GJYQl/jdlzlJt15ISz34fJj2vHITjuKdMuc/da1?=
 =?us-ascii?Q?IyJfeAOwEk6Uz1+MkRBOhGhE4ZnVPqrPLWtBcUPcrwGlt9nR3YDIebiyyxfM?=
 =?us-ascii?Q?ZRn0SNUObBnZi/zgCxN9MRVsO7sjvT/f20SUNBsdOUOA9Iya9+fgdF7sSFlU?=
 =?us-ascii?Q?4/j0i1RKkIqU9vL+0wlA4alLt0C4Fz4v7H1PcAl5FItJyWmmnC/QwjOgV5s0?=
 =?us-ascii?Q?h5aFgs5FR7BkHayCT8pHHkUYkN9++yLulTYzl5YS8aK+pDTTytkIixP5uZci?=
 =?us-ascii?Q?Jw6xgNK1DgEn/H3VEuFYx1fXZA+awjUsrjfFt+gg4BUYcePOWbH3an4OVPmb?=
 =?us-ascii?Q?qWtBSHGXoWhnM54yf18sWosCvjETIxly8YAWorSMWCSj/f/ve3cCO358619S?=
 =?us-ascii?Q?+InzKlBh0gQ6c33bo0iBRubVKaDIEgUHT3tcXDD4QD1cz0LyEvvavIKUOm5s?=
 =?us-ascii?Q?0HkloYwlWpPsEVXkMML2JogAKfQQWH8OhrDstXLKM6rtQZq4SdVfsHGmToot?=
 =?us-ascii?Q?ivTIC2hPmAqrgLyEcOz9bdy7hazQ3bKKsbZw4fLHyMEtO6XkZAYTd7R9EVov?=
 =?us-ascii?Q?/LUE+Kp09wjMbnMEI9avhYQP4kvj4fdu2cA6A+H4kAUvJGZMmkRGvsjy+ny4?=
 =?us-ascii?Q?dGKa/9PayE09eKaXeJpd+gz/BvjjmWHM+Tjc9HMURVeSa0Q+aRi/J6AkkW09?=
 =?us-ascii?Q?MOZauyf4MywwOqbLeGR1cBz+lpL1qkRlLFP/jMQzTsDhmAAK0ev4NItXs1dK?=
 =?us-ascii?Q?flN62LAAtTsuPafh/YGbhCF5F5CIWqtQLUF0vjCNYbMRAPL8Fbcc93G2CYIF?=
 =?us-ascii?Q?tM31JVo1SlqA4yCRGBV3mTaap0yChlUaqM78ZvItiULjVIelMVQuoiavsEbE?=
 =?us-ascii?Q?mUyM1mawJk1uhV1ScKr82UNvyPE8Iv5QeUCuUAOjhcB7v6kk4+ZaUk9/zbIE?=
 =?us-ascii?Q?eK2xoY+s/Pg92lVsXLbS++yFbDRZvjRYN8YVLBPaZ0tZmkBtUy0a0MwzZs2u?=
 =?us-ascii?Q?4/xubSzaj0hv2awPlV7U6pBpEynuklKCyA8e4ZwqcNmz1rZFZQYoBhqUJvkN?=
 =?us-ascii?Q?cQYUH1zps5wEAwwe/LJ1NjVSnync35D1nteLWM/EgOZpqxHWGAQD5lK1rP/T?=
 =?us-ascii?Q?tZp+lJYZ4yiwdDBrSlMylEx/MvX1fxkFMUH9IEYiP6ZE61LzKkY0ZsWFpcTH?=
 =?us-ascii?Q?iS0QCDwvsk1L5CG66zsKcbLoDAnft9HE7c/cL/m3z34Ft/DAp33sZ2pdPPpf?=
 =?us-ascii?Q?CUWqUZ0uzmzviXtdYU4+JTEN0n69xHR910IS6mP+LTDn9iLK71Kscn45Egsr?=
 =?us-ascii?Q?/Vq1laD+xj6WkBS7TYRpGE6tP2HSEMF5w+hRlgkZmlixHwhiBF3IULPTFTcl?=
 =?us-ascii?Q?3l05TEBJeRoQjGxDhsc3MnOCjDnZPSvi1InqdThlntMokHu5X2XZFER+zCwM?=
 =?us-ascii?Q?kGTBF6JREF67RAvQD5uNHz1hUCkwu9MlAnWS/FB1m6KIbG5YbUyC7Dd4JSp4?=
 =?us-ascii?Q?MoM6ErS7TAkSPmB0hk7TDVRNgwiMVuxxGWvdD/P3E8VJ9o1ndqLwo855spuV?=
 =?us-ascii?Q?i5i0lZXgRmsq0XzVKeStQcWLWWlM7c1CPg/rf1/5MiL6DlcpBuoTyHNhoXTg?=
 =?us-ascii?Q?FMgszTtwJKRQT4SGmaE4vxSZayNOvocE/Dy1DQ16SLiPgm9vkLqgKpSSnn8k?=
 =?us-ascii?Q?vkOm1yWAwDjI/jWMxvR3cmY//m4oKD5aza7hURrCBtpfL3LvdcXkhA+xbtu3?=
 =?us-ascii?Q?Lsaq6XZU9grNcK+9YKw9RKGIcMiLj5c=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db4c79f-0623-44a3-0efe-08de8a645608
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:47.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu8RZXMf9YEztm0yuF8GzhCQQBehXSnxZaM0bIAvNnAg1zYQQsM7P4UQj8GoNhEx/iLHQB92JRgPrBpIGC+/532y5TK2ViGhGFIRMtN4jbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4294
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57008-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: 8AE263246AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern modes
and program them via register 0x5080. Drop the fixed 0x5080 setting from
the common register sequence so the pattern is selected only through the
control.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index bf848eb9ba52..c8de7f5601bf 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -103,6 +103,17 @@
 #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
 #define OS05B10_HDR_ENABLE		0x04
 
+#define OS05B10_REG_PRE_ISP_20_0	CCI_REG8(0x5080)
+#define OS05B10_DISABLED		0x00
+#define OS05B10_COLOR_BAR_1		0x80
+#define OS05B10_COLOR_BAR_2		0x84
+#define OS05B10_COLOR_BAR_3		0x88
+#define OS05B10_COLOR_BAR_4		0x8c
+#define OS05B10_COLOR_SQUARE		0x82
+#define OS05B10_BW_SQUARE		0x92
+#define OS05B10_TRANSPARENT_EFFECT	0xa0
+#define OS05B10_ROLLING_BAR_EFFECT	0xc0
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -396,7 +407,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5004), 0x00 },
 	{ CCI_REG8(0x5005), 0x0e },
 	{ CCI_REG8(0x5036), 0x00 },
-	{ CCI_REG8(0x5080), 0x04 },
 	{ CCI_REG8(0x5082), 0x00 },
 	{ CCI_REG8(0x5180), 0x00 },
 	{ CCI_REG8(0x5181), 0x10 },
@@ -514,6 +524,30 @@ static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 };
 
+static const char * const os05b10_test_pattern_menu[] = {
+	"Disabled",
+	"colour bar type 1",
+	"colour bar type 2",
+	"colour bar type 3",
+	"colour bar type 4",
+	"color square",
+	"black-white square",
+	"transparent effect",
+	"rolling bar effect",
+};
+
+static const int os05b10_tp_val[] = {
+	OS05B10_DISABLED,
+	OS05B10_COLOR_BAR_1,
+	OS05B10_COLOR_BAR_2,
+	OS05B10_COLOR_BAR_3,
+	OS05B10_COLOR_BAR_4,
+	OS05B10_COLOR_SQUARE,
+	OS05B10_BW_SQUARE,
+	OS05B10_TRANSPARENT_EFFECT,
+	OS05B10_ROLLING_BAR_EFFECT,
+};
+
 static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 {
 	return container_of_const(sd, struct os05b10, sd);
@@ -531,6 +565,15 @@ static u32 os05b10_get_format_code(struct os05b10 *os05b10)
 	return code;
 }
 
+static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
+{
+	if (pattern >= ARRAY_SIZE(os05b10_test_pattern_menu))
+		return -EINVAL;
+
+	return cci_write(os05b10->cci, OS05B10_REG_PRE_ISP_20_0,
+			 os05b10_tp_val[pattern], NULL);
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -589,6 +632,9 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 				OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
 				NULL);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -970,7 +1016,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1026,6 +1072,11 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	if (os05b10->vflip)
 		os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os05b10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os05b10_test_pattern_menu) - 1,
+				     0, 0, os05b10_test_pattern_menu);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1


