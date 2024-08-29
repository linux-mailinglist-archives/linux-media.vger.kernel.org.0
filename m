Return-Path: <linux-media+bounces-17146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C279648A4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5EC3B2C64C
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F23D16A931;
	Thu, 29 Aug 2024 14:33:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0831B0111
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724942022; cv=fail; b=Q5XEHAiEiCQABREEvP+jRzUcRbtLa+bPvmE39J3LoFRepTVonyj7npJ1EApSD90ps41E62ODfVH+NGSOtwnhbp3wPzd/gjb8S80KX6tW/iANUpDgMLTTBuYpjyL1jqXR08jQRFKWmSsAy8/kKVQpKUSxEG6zcvKpCaAR5ZBx5LA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724942022; c=relaxed/simple;
	bh=31pELeVz7w3Sz2YXIdwlumH0LfVS89rG65JLSBMmnmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3RETjdnd7zwVO0B0tL3VCihVPAR6k56GyQyyKnhLCraKTEtU6OxU8QOi/8com6htewaJUU9v0UQqpY1vlCb9hZAet/WEvAKR3aMiybz1UFiaOPFGDm9ERyTpqIufg0wUnC/R8ATiF3AAsnNxhv2rQSsJ55bvcRVJ9rsIgMAIh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqfXylvItWDDf3+GZy7+LPoefnmRexCoh20YHH2z4DYT+jonnQxkZdO1yRQnP5gka9Fs7DJ/XXbMAdfqbTUIZaiThH8HgjIwzhW0JaIq9Z5XUFtiQQxojHjHNBpWFUjha2BxFqmfzO6khRiNkDUiqM8lmVa13csrWfenBly7aHPRJ4rxjSFqqggOk2BSOzWkOjTt5lJ7ID7fHy1pxiPN/BVyztmg5ThGThN4hs/2PnSZ/kpZWArm4TZdfIOVivZxib7gQjJ8ChuCNBh13NsfbZmsjbUA9wERLhZgOKtfjuhwg5tuJ12qWr47cwYkdfp5VJACJya0Yg4PYh+oO3YeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31pELeVz7w3Sz2YXIdwlumH0LfVS89rG65JLSBMmnmg=;
 b=neVWadqbO3NVlnX/hy9U2QIps4CZ7ZZ/n1kCuZodw08TliZ4+W2gdprjiyZsEBLyNNvN7dD7mhPgmC/R0bPlzd4MA3A5rulZfbOdFJPRge7vt15xoa0GGGkweJ6KNzkFOrMomFFGXFNzT46LMiwQcPiVPuG1ezaF0M/kJXRPdHILEm7VsbfHtjZBFKnKiU7Ai2XVYrIjPu/jwPloaM2o7Ctqz27oqUfbLcjXHXj8oLTe60bgpAR2/ViwLg86GoZe02XYl1rAXdYKqlHd+l+349VoRmEV7XmVBjnXibvKwmDRugNh4ff8SOrD14MEpbSIGE14HDgrZZ0kb4ymXxCyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1173.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 12:58:52 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%4])
 with mapi id 15.20.7897.027; Thu, 29 Aug 2024 12:58:52 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: zhangzekun11@huawei.com
Cc: hdegoede@redhat.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	changhuang.liang@starfivetech.com
Subject: [PATCH] media: atomisp: Remove unused declartions
Date: Thu, 29 Aug 2024 05:58:45 -0700
Message-Id: <20240829125845.708915-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827071122.26706-1-zhangzekun11@huawei.com>
References: <20240827071122.26706-1-zhangzekun11@huawei.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0004.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::22) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1173:EE_
X-MS-Office365-Filtering-Correlation-Id: b413bd0e-2d33-4a60-b442-08dcc82a5547
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|41320700013|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Eq80NJfjOB9tuIWu5XlUpKMAnGxhHZorFfJHjDQwd7Mv9UbIqsB/Davtz+7oFbbHj9pjnqX3s1XCgXHi9kv6bA9K5I4cJhRbt63Vft715JLb+S6ikRYgvAcX9qlOhT9+mUomPr4GaA8OAep7n0Bg9YYm/RoTYbOjC9xMV7NoZ6APfRicPhKqOa6gNGt7gZaRhZpTzAOafgKVOYkwAU8eW6fC/GHNV6bBefJCLbxbC7bB3c+5EdCShBxzaAVoqqoC3/XexR8Ebb9zBKjbzUClAOHm63/hro4X2uFrXIEhvotaERXhinDtIMVS+NgVUyInZiBgu50EDNnBwwm/otu16gk72kPtt+6yAd6l/paWaSr9TSA7JGXis3pje64x4Jm4eY4nwrzrLy3jMUvV2auKrMOGvqHYMERxrrH6JKemMrF3oEqCBfC++BICCRjCo8zlKZSx2SXUnokkr/ZsA/w1Y7oXICV09HPuP7iYzx2+0cHSFy1/lERwBDxHmsoy2y9P0rh5Vi5F66W1Gf1fD0giiGzvAnS07ni63hyfk+LMQkDkLmUWslL+/n4aNzcGAEdA/feVlPh29MIJ6BYRsHXf0h/+5ld2w8Bgg4PacPKDGo/jnEn3FkCYgMjRttH8f4tr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l8x972s+gxgjtM3Ta0d7lTwAh2Ac+faVTD5r/GZSsIjlZchVnakduq+K5K8x?=
 =?us-ascii?Q?83no7+UXnUHmLCpj0fiMmlUU41oRmnzJSABM5lREf2EhW+o68xp/lVL8B2SN?=
 =?us-ascii?Q?mIf3JpXl7I8wsIYQS68R435H6GcND9d0kZZovbs5LkiItI3/mM/EgU9mZ3wB?=
 =?us-ascii?Q?K2d2C4lG8KxX0Ig4ph+ZnZocIl/FoQp8ddwFqDMCZoK7xI+Vn4QCDQ9/wmIt?=
 =?us-ascii?Q?bbmc4z05/uKeXNfnd0/IPV8VzYgV91zqRQRvN2ah+HjRUjaj5poJmK4E1rhG?=
 =?us-ascii?Q?K55IrMqFPDdl6GCk2jJINDhcXL7O2rrum85LJj/1Mm/YzaJiqwec5QfssQX0?=
 =?us-ascii?Q?uJ0roCbVVfFH0CGbqSYA90byV9OH8BmA7A8s58I3vCgpWQ89cNK8KcCYaeIM?=
 =?us-ascii?Q?VEvmxUsjE3Zv2txQHs17jWpoCZXmAbk3IRupjj1M2QdC6SW/61mBh6k8b1uX?=
 =?us-ascii?Q?1G+RREdK41hv4S8qU52qni9/UKfen+rlRo+PeewlWdYnwoXoexTsxLKHui9T?=
 =?us-ascii?Q?YCZ66csJD1Oy78eNS1YBdL6VM7TGLVOul0yNeYWhpk8e4ACU8r4HBsxtQAeg?=
 =?us-ascii?Q?Ys8ORkQq5XpcfjT78QIYvYqj+dl65lSoiK67W1oHifJeQTG1aIebRjCapjTL?=
 =?us-ascii?Q?aWFsGHHhYiNdkXhiWmZ321iXy9tIuQ0DNfLSphjf+lcTu+8J/uLJgjVWQWh+?=
 =?us-ascii?Q?ED2aTR9l4GPOu9uu73Ti3sk81rVPny1z+jSHg9aGPtpG9piDdq8kY4AS5mfB?=
 =?us-ascii?Q?8qiQCXXNipNoWs78eLDGEkAhfUJwgZqAPL5zMBrPGmnSEjvPFBSi+p/1ifSX?=
 =?us-ascii?Q?1pzy/mdnIZovnBISLsy13Kj8hbU2TtPWspeOuc0oOIWuECt4QRij/1KP9T3I?=
 =?us-ascii?Q?gY1DJ0y8p6P1VHQHBK1qxDdE4RjQNl4+VzIBSwxQeNiQtFuZuc0UEihUXz82?=
 =?us-ascii?Q?LhhKKd0K0TwOKzMQEN/pgcyUMCJdeLtop0IS3cAvUyLGFywN6VxyXCa99mH7?=
 =?us-ascii?Q?EFyicA1kGZikyRG6P3OJT0nimMWpn3gyj3bWlO/cOyAdABMCfXO3jesbFCmS?=
 =?us-ascii?Q?PJdbNtDl6e0MPeEQKKTqF4NwDkSD5YLWRzFO+j63Xc3RDrZAp+pORM3xlq9V?=
 =?us-ascii?Q?62KFJuGhZCMUqIjoJggUNccZaZ4tc/293Fo+bReWulejNvdZk3q1y/NRRYSP?=
 =?us-ascii?Q?mxuD0gtsxRH2+Rhiz1+wB9yCffg7smLPSBHIv7iuy0avB/lXnIL8DGfEGBTi?=
 =?us-ascii?Q?o7vjprtZ/IYzV8MCAlf6xKCc9kziLXXhioHkT3RZw9jq4PzvlhlWDyOQxV4m?=
 =?us-ascii?Q?BbQMqDfUvvbf25zs4x20nJgr1d2pRdd1paOgOmxgfqMdBQA1Dm67u1bUJ1wI?=
 =?us-ascii?Q?6PY1m4j0ZN7JUgvnN6HUlcX96ciw9Ko0hXnlpwrYWTq3IOz5K3D8jGHOWKbf?=
 =?us-ascii?Q?kMs9iEIr0OnIzxaD/nR5s0Os3bO9NYeZYpn5I3F+KF/F0oUAk/qYVXeR6z/+?=
 =?us-ascii?Q?jrImNDTLsX3757fjLeN/QozpJwit7uMtvyUEr1ZDzfeqddzcJiXnioWCHXnV?=
 =?us-ascii?Q?1O3s+yfbV038wdbS6YjaaJY6ymSu3yNn+RRPQx1f5HnPpSN4mHUww2W7Hq4j?=
 =?us-ascii?Q?3tRwnbh74qmavIHFwEqCxNU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b413bd0e-2d33-4a60-b442-08dcc82a5547
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:58:52.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3eeD+AXGGnjn3WtQbF9s0psP+hEEaQmd2R/nxOn4tcz2U0ojLXKpC9epczw8BfT/r+dXLwCee241CtMfnADl2k1X+75c19FsN4fk0W64cpEXQurBKbgonej4Wimv8Ri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1173

Hi, Zekun

> v4l2_get_acpi_sensor_info() has been removed since commit d80be6a10cd3
> ("media: atomisp: Drop v4l2_get_acpi_sensor_info() function"), remain
> the declarations untouched in the header files. So, let's remove these
> unused declartions.
>

You just remove one declartion.
Or:
declartions => declartion.
these => this.

Best Regards,
Changhuang

