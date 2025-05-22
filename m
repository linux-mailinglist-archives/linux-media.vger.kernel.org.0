Return-Path: <linux-media+bounces-33156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AEBAC0E5A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E924C16C2A2
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1E528DF54;
	Thu, 22 May 2025 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="v2K71i5F"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6AA28D8C3;
	Thu, 22 May 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924585; cv=fail; b=Q9fbIafKKm0UR6YlTJGYpzIa919gKA+1LH6C9zRK0Sn9TKHRu8q0FM7ajLIqowP9YEEwQrz8FamSJRppV0g/ced4MLOTPfKLb8+R3fzr4X76OzwxtrgQrKdirWQ4qVJlz4gR0Lo7/bT9MegAuSSih/QzZ5L/w9FFS7qI7NMOKr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924585; c=relaxed/simple;
	bh=YneiCF4vE40XKjl+xpFf7sQB89VRFhnHTMAr4Ofbw/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DOykpm43kVubHT9EMbsT1KO8eroFWVmSN8cga2ksDRjQHd1VUY5S/6ojq8E3RPmY4BuqYLPfeGJ4dIYysbW3oKeqkdyEK61DtQ0dhofR15rufg/6yHolxzt+RzQgSUV5oygO2m2acdIiGNCkJyXkn3zU7dETzA2Z40PBMD7UEjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=v2K71i5F; arc=fail smtp.client-ip=40.107.20.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLgb9NDgN3vzhIXdGKCQBOfOiWOMXAY98JNzgAf/QyVNAkEgx9h/PzgYPX8uAbX7QsE9bUPeQajxdkT2txYaSvyZ4DwVtlxzfRfAHeUCZRDKZNg7/hyOGUnPtgZggQEbKOo41bSFPZzx5pxiZlqT3fhTraAaKxPflHYALSMkWdjfRffhhSdYPTHPsYtkSM0gJF5rjGhcLKBP3jSLTF1tghg5esGKZHQBWcgDioo6sZcZZmxiTL7Jtrn8x6Gp5Q8DCiC0X+KviuTIn1tnsrschOPiabnVEC2zLw3BlljEqr9VnUgGLqOO4Jc2GOpzXffu8NhMT7wc53+lJPwdP5V4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeoL+AkUHHYsziBlbpL4bK3vrxkf6d/3FmYe1hnZQlU=;
 b=lf+vBZ+Qr0caB8OekjTNgRfWD17ixX8eZ0XODJBBFk4rvTaAZjcL9HoSiiRd8R3wOh7LK4E95/aQzG2Jfx97QySDwxxfvX6TzKFSfCrNsgfznqoH87ai/qR/b0yIguEGxyUVwZrDT7zIeN+WnM/Fnuh5HetDhmpjfn7zsmOzZltZgy+YfC5aGCbwn7+Q2ZgjvXgNvtnr7VttGlszwBR9SDjUHQWzMmIXuJ2xuJxaHwzH55SYWmA0AxLAJXql1lwS2Ckhz3tVGV+Hc/y02SCGDteg7y2r/JQiECgRhyL3bj+itLKQMEsYzRnLcXheDGOH82c6p/Urs2VEA6pK8us6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeoL+AkUHHYsziBlbpL4bK3vrxkf6d/3FmYe1hnZQlU=;
 b=v2K71i5F2l//LgFQfs8/COxZXPCJjutSqoQY1A96/cJPMjG5+r05Oqa0Y8i6UvhLGdk/GSNbTUKQcxFeIK9EDGrkaDLK10wKgociIeYWQ1dy/h5FQBP6Mtwuwn6HmJjUbIYzDemx+Ho6wc3y/C7m5QPUrT8qQe9Rneqr0wpjXLQfAcSmBhak9tXL53g7eu/YV2yAVUt0GgV26XkV2+9fB76GDimrwSG/VL5dOgjk1R2sHAb8KSNeFCE14qceNuJ/0vaMOXOGy6orLQtwcsJibjKOGdpD+UFUqq3ZHddmOPcDrfeNz/PQRW11roWdc0xK13yGgABZF+BtiqAaR+PLfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:36:21 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:36:21 +0000
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
Subject: [PATCH v6 6/7] media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
Date: Thu, 22 May 2025 16:35:10 +0200
Message-Id: <20250522143512.112043-7-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::17) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa5c8cc-26e8-4a84-769c-08dd993e051e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PYMMl9KjMTcCiOl4ldztkXNQNhyonM7HSxQ8BrPkpZxzF1tg8YCXsJrnSllu?=
 =?us-ascii?Q?IZduV0FI/TvSL5lLEWlSP+v5NjkANICiN2jGHEgzEthLGwLec4daxthEXBAb?=
 =?us-ascii?Q?pkyXl+B5dNodm3vEnsCOhuzoWYsng6e+fuGLLX7WviFpmhFV8RPhwlUIt0YC?=
 =?us-ascii?Q?5qStoQGJgJGMAuHX4sLvNV8XCoKw9Czt/QA5GwtgAFufcK5W5bzzx54KU9nf?=
 =?us-ascii?Q?3mO6Hidb6eLHVxADbfI3gLEajAJWAGWy2XuFrbxpz2GyXnIoWf7mZyhT0faZ?=
 =?us-ascii?Q?3Z57+n2Rdf5frwjrVyTwIflC5xnyqiOpnUxPWmKWMu73Z3XRvpBaXnEzko/y?=
 =?us-ascii?Q?oS0D7L10lSp++vI35Whe1thYzTSQQXQHihQr987CnY+PJW2gFJ6DGOpT7g5c?=
 =?us-ascii?Q?NX7Rockf3dLS2KMXu3P9kMahsSAkNBYiVS1CSYHyF4oq+OgOQDb9AjmDvxdq?=
 =?us-ascii?Q?6ZN7elqbUFNpJm3aV/4eak/6r91vFUXTkfmCz59GvEARFhVZCX+LD5e6IS+O?=
 =?us-ascii?Q?/W0ZIg2Psgd+xo/wDft4Agdiak3eIn5zct1qIcB8u4ngRvrRPqPHJUqxz7lp?=
 =?us-ascii?Q?VmIz8bdSgXmvwR2i5/kN4Q9lEbTl6rU/YjkxNeDEd0ClLvgq3ggJe9CuXcMH?=
 =?us-ascii?Q?5tX223W0rvrsZ4zTZRu1zzbqlZiNtNTHQndpYokQvptMBtZR5R3fTjIbDnGY?=
 =?us-ascii?Q?OmjuTG9zcepZI3asqBsdsyPf6TkPZJz/2GheL8ozyZ9i1Dco7SoVfVyZCND8?=
 =?us-ascii?Q?MRLUiX3A2jiMaIn0a7+dOAmOYGTog0NwRd8IVWnXNC15ADmYsHZWWS1dHI2J?=
 =?us-ascii?Q?GD8nPz8XrOLCFviujiH4K02bEK2aGR6wAFW5scU96F+xgOz9g5g99jyU2QhU?=
 =?us-ascii?Q?S5rDdVVzz6DkgcvhXdvNAo/LlAHG3CrQN3JL+w2abyQWQT29GaqI7DmjQmIA?=
 =?us-ascii?Q?/jNJ6d16ElwqbtFcpLudumz7P/8LlvdgbjhMzfH+udQRi/TCS45UslGxroh7?=
 =?us-ascii?Q?p0mKPD7oQHUF+KO8olReen/9n0c9/PUlwHHC+GBrJxN27eBtEmpmpDB3fsGF?=
 =?us-ascii?Q?zunpPhykEl2GhWqkSGpJj09UVsDkJjWDg1etI7vjUi0P2Eb6Nh/W11nVMJLR?=
 =?us-ascii?Q?r0Z0doVMoX619XtHGTqyWd4FXPHOBzkbthlrni2mxO3pCmbVJMG79g/rvk7t?=
 =?us-ascii?Q?ehf6Jk79oE9DHvr3sDALqh3Qz+byliVa3bwukfrboEVgUwT35C1O0GQDm5Zu?=
 =?us-ascii?Q?1xiZAfhlbjHPniuhEeoXC5fn42yA7ptydgHDliOtMAV82/VRHFwKuWZJhJVW?=
 =?us-ascii?Q?YHbyirO+qDFk401xNQPr0SJmDaMv+ifxKLb3EEW85LfYNfyFiTBFcIo/ub8n?=
 =?us-ascii?Q?8UJYRSogi5E4sOhp1t0n1a6QHJ1O0nlnnKpsEOkBY1oeI8FJrTlGayvJIxpx?=
 =?us-ascii?Q?ziGoYuYTBUtm+3FRxSxRwlOarW9Ma5bVMwEbtUsUEKCzz4O3tkG6DQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pRJc2tto8qKnPSEacKnnbEp+Yzr0bmv+MmFWg0MZc+Oj5WT0Bt599Mygp2vO?=
 =?us-ascii?Q?UxtB70n3JZtd66nR6HyTr7NsNqlQsWgX26EO4V/gT49bY8kJ4H4MTBreEklY?=
 =?us-ascii?Q?a1jKCosPB+sa+uIH7KixgHUfU9YOOzVpUPm+dI8KsAkWoEwczc5rgTm+Vpmq?=
 =?us-ascii?Q?jm4UaktyHI/WSnMIn6uAq3nMnGD6pIiFM1XMDkYeL6qpn4/0fACABdK/JtJ5?=
 =?us-ascii?Q?qFHdxTpef2u7G5SLJPheEwuIKHUlhgBou+hh6XdK3NYu7akNDxn0jTIZc/Rz?=
 =?us-ascii?Q?XWcVJPtRw77rmxbDSqYfSbc9zJ6ww8Kbs1q5Xyd0xB4HhCM1U8p+iwJKYgwG?=
 =?us-ascii?Q?E1J/LKKHcd2zKLSgkW+cCCvLf7M/t2JRRKyOIdn0b2GTrBuUPopVjfIGFX0e?=
 =?us-ascii?Q?OJLZoM+c608qam4Gpg+glDiR9Ze2RvEeGNNmBgxc74LY8MKHsEuVu3cIaq21?=
 =?us-ascii?Q?GzwiDR8C++UGDFOGhSprg6WphfIl3XTW0d4lhjU4LLjTpU3Vymn4gUJ/aBBm?=
 =?us-ascii?Q?3Txv9Ejw4NwQ2nz9AK1UOWtkC5z0ok178+o6XUA0pL8zNnWUs5ZA+hduPz92?=
 =?us-ascii?Q?Rv/zORMeWTLZKPiCufbTl9xcrDTvjEN/viUAc9hp3QgnI+Q0ELsxN8clFolW?=
 =?us-ascii?Q?vxccne99Acns51JFdj0b4SDCBqHs/Vwg7MVvoPq5WdZHYmo7d/V0YiqOBr+/?=
 =?us-ascii?Q?fVFCwONuEfxRtKDY0uJylq9SSI+2l3OwvWJN5u1jde54P8+EjaXp1BweSjC1?=
 =?us-ascii?Q?QhkmTcZ8cG4olB+IV++c40sIihn+w3OEclrP1cgvcgWT8BLoDlVundqCxSZR?=
 =?us-ascii?Q?fSpW2AMfoqEHPbd0Pr7QOPjfb/6tZEKopdHr8qBy23gegOMfsYK4Ml+Nb1z1?=
 =?us-ascii?Q?bfeXvXhs8C9b3Q6o8JNxYWKSvE0zDZnJbDeNsdxOiQJYZw/4Y04WlURz4qn9?=
 =?us-ascii?Q?NXn73WLHMvPAerVl2L5XDERrTDzA/LFUd+vGs5bR2QAiwdt2VXalcBNvyMA5?=
 =?us-ascii?Q?NdwUgTiMvW9VGVAOJAhhaC3x7M8r0gJ+stjnEW3jSHjlub4/0vQdbO5gNsC9?=
 =?us-ascii?Q?WHa0ig6YwueZlLsUkFmlsvHKYug0JaX9cUD9OeDGGXAXpJZjlx+7MKHH6OgT?=
 =?us-ascii?Q?b9hzAqtRvL+Ygivtmre3NGWICqXKgx2huYfzJEjm2Mwls8N7FURKlv3Vx4Qf?=
 =?us-ascii?Q?bpL3McF32oTH9rFyU3LG5jzxVMTQ4u9eYWpMnfw5d6cunFhmdm+ScZw6DaC8?=
 =?us-ascii?Q?U9+vM3j5Yedt+nOzkRgk63yB9KhEYlUbJteAQvJR00Rg9wCk9D77wwln70Mf?=
 =?us-ascii?Q?dDUVepwj1YZBYv3cvBglS5GPg+6jc2VavJCeox9W3p2TSrEjHrVOljyI1AoB?=
 =?us-ascii?Q?bW4GESkscpBgHsS7+SeZPyhXYgld5DLgZrqkz4/rClMgkeN75NedyUCxex/+?=
 =?us-ascii?Q?kY+ZNzbx4jSes7qg4Kn5cx3P/FkA8RJiCGaN3ocuh4Nb/jq6dVKxAIZLTFjG?=
 =?us-ascii?Q?gMu/Wxpul6ZCzk1O8q1KY3SUezvJQiIYcDA0mhs4I8PdKrjpghAIrK0X0KPu?=
 =?us-ascii?Q?jmGWzleTgbyGlMnJMbed+3eTxONMp9b6eKBA089h?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa5c8cc-26e8-4a84-769c-08dd993e051e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:36:21.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4D1drWQsuAh6q+MS9Sqc57Okitxhzu3CC4M6RmvhBggYWyS4rH9CBesPOTR36/c/2yPqO6RujbbfpEaFjySEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912

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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


