Return-Path: <linux-media+bounces-20034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC2E9A9D2D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 030E3B21135
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82B618DF6B;
	Tue, 22 Oct 2024 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j5Ds5R1U"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98818859B;
	Tue, 22 Oct 2024 08:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586477; cv=fail; b=W3VWwRNNCn9QJAZxT0RL0uxWMlvoPATkvjOWm0EsM77IlLPRLctx/8/2qrX04iCHH6AFFlnNmhFAlskFhCXr8xx/EMa5G5Q8lYMRuxPKjaEv5qri0Dd6fbFTE6rXok9p6zTzkcxY8REAjzw9LgXt39RQ7xCpoQhFASKFxTkoexE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586477; c=relaxed/simple;
	bh=3J7HQukrMTz6WCskrPZNpBJysph2+T+IN+yd5cJXGsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VhOEuNADMxlqDCvWYW3Ohlcpn+ui+Vogk1OZf5ZXJWDBVFa9QQQShv7NJ5ZhGsima4isAyMafo1S2XntIhpByA7WmOYyIS9jVMmQewWPBOmQ8Kh4SA9dAntAT/LmSbvxtjE9BRNbIjuf/Kq+nXXowgBS3gmZxOXrpJ++Ac93O1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j5Ds5R1U; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvJpaYYNR+qPf7FMqEnRUq9xuWxLNwUBMhx7qFwBHF3wS/LQzjR8mXp09sPndWH4tq18oRNCKTw47dg/jFtL18U/ie6eZiJIpffWawKOzz47K6TJeS4msLg0PApNk6fB+sQHIEnj73/NwgEk6OFDI4/kk6qPL9A7S/+TdhD0vHknNGV4GKMqqK1omI9tpEV+DzmzxWolkyFgW1HkMryDjrCp38pI+Gs+gCexav+QnaNbxOWD7iAoanhjgnAmcpk8zJ1Zg5S4ivZuf3bcBcsgsy/0ZTYx6ZxtuQq4GP2gECw+sS0ls1i4djsErpnObq+i88bSlesLblJmEelVbK0PxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3co966d8lg7YhJGpW2PyDhINGAAkGT+8kwYcfIKNyhI=;
 b=JnvgCedhLOgs4DxtklTrS603Dh/XoIPe5yyE70Oxe36hx6Eyf3vTvIpLsdH7/2aLQUAk/OnGSS2MRNTRmB2S+SfMsnJgNuFL4117NReouhRl6oVGdtq19lPy8ZtCsbL3N+dipz3swHFAgzJilDL/0riVRX/xSAEWYwIHxvGuS22d4mL4pGAm8ugEBpse1/zO+PITIJ1UBqXa+RzlOFUesVeqm4PMNaIUgjedemMGFJHSF1pOFBSZZivVNdAJMztgeq2tmEQ1P3n/WHgB+rl7WmJ5/hRvNY5oJt6dUVNWWzDZTDUX6W4MNANOMhzPIjgA8JdJA9nqAX/XLjjHZPB3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3co966d8lg7YhJGpW2PyDhINGAAkGT+8kwYcfIKNyhI=;
 b=j5Ds5R1UpauzqyeRd9YcB3phbW9uers8ObQsJBHfQ+7LCwKQ6VMg6LwP4NqLb5Hp8hJ4T1LsPZB6Thb0/04/kJI07dhX54C0bLYfcdNxlo8ihp+G6Fv2z8wax8iVBU7w8Coii8rDYWnogIqKMGhTu/aobFl2Hohbhv+N7IKr8JhZxRh5bYQl45t1x4Mr8m0aHCOUw9Wv1zPyF9Y9deq7t41eIhGwZ5RD9cyfWe5eiaWZGor0L+evdAMApPbVRzUENVZVZ7uA/za/m9kJ85LLSeqFB3+hXZlPPrlG/g/21wQLSEjfsx4w3gAbh17cDyuBd2yV2iPqPmMgUnr4P8Ou4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:41:10 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:41:10 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v3 1/4] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Date: Tue, 22 Oct 2024 17:40:37 +0900
Message-ID: <20241022084040.3390878-2-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241022084040.3390878-1-ming.qian@nxp.com>
References: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d2e0a4-fe54-4d2e-f470-08dcf2754755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYE8KXw2aw2fZW8M8wQ6FRtyh+cHFHZAVbD2aXiWp+WJZZ7y7wxwk5nlKVi4?=
 =?us-ascii?Q?YbqBIFjZPhtlzm79byyxrmQm6YpyzwYZ8DtK0KnMAc6SOQ8/xNd72UEyP2+x?=
 =?us-ascii?Q?PEurR+hC8e5EkudseSWw1wx2YBTwuUfvtE1rLjqD1A1Zih/zOVjjcwsq0TVj?=
 =?us-ascii?Q?hheVSnSwPe3nWPTimou8C27nBG9fCMEIyhvhoiwUqY6V+3UT6nmljb+Zu6Fv?=
 =?us-ascii?Q?tfFDjEcT8Acp8Mz0RBA1WX0yqiq8Q81qHi1ZPfvAHBswmCCuBmK2NfbzBAIv?=
 =?us-ascii?Q?nvqEr4dX7or2lFZZ2GugOs8OnDLmgP5NR61agOyvJUDhIQ3yrm6zo5Vj/sLl?=
 =?us-ascii?Q?CQJNbtWXRr3YkjbmepeLhnT7wAcSbbbrJl9KLcZgd3kuTkKZaDKjdr2l3vrH?=
 =?us-ascii?Q?lS7+xBqP8Nr7//dBc5QlgB7oXcuopuE8cMQNA44Iyk7dNsXiw9UQhnjcyYpz?=
 =?us-ascii?Q?W1qRtQDABmdXZa2IMbBm4HHNrWfMdn5tUvHnfrvm517jXto21+XsPHPgKE3c?=
 =?us-ascii?Q?vHm5yxTnEHOL/lBa3brVaWY64DmS7J8Az600wPMgMDQW9w7OPqDTH3qumkog?=
 =?us-ascii?Q?v+8tuG/C1YVdLdAkwOmDLiC9vQeI+zwPBhmmpcVxUlclcZft8AKg/By0eOrV?=
 =?us-ascii?Q?XCniz1D1yIqsX4DuBa0Nc6m883X64xQ6StL+qEEr5xa0q/ouCZyC1tLDi+/J?=
 =?us-ascii?Q?0aaUwexKCBSWszfF9cc40FvqDN+3anEXIjd4FzNTObdt1ZqavkymCMLKuOBT?=
 =?us-ascii?Q?OPXKystDTOKBJ0ts+CyGnb4yDVH09bJqB9wInZv2X5DRJRjPUCwG9dGvpsFH?=
 =?us-ascii?Q?NGhCegHkteCxB7gKW3ixwjbuBAj7NGZoVYyGKpD/LddRhtb8CKxKwR4/vK/7?=
 =?us-ascii?Q?sDmSG+eoiFAVS7unTxtFr0qMDxx8P6tBh0SsggkpPJV1H2tnLtTjUWUamsUt?=
 =?us-ascii?Q?QykTadjv4nu0A7/k7mkg6YP/gv9hDyOtJDxykSfP9HrLvTvCXJ45U6jlAZKl?=
 =?us-ascii?Q?khml1rjL1mgr2b454QB5P+d8GYsuEDub36PXBgFEspP9e4QZiOoRDpsIy37W?=
 =?us-ascii?Q?OSW1eArhNOpdQ14bTRjwuZ8QIcxQwLv8rRZg/qANXsGm4rGxauEDgRd0TQ1N?=
 =?us-ascii?Q?17qvr0Lj6P2s1T1xkhPjxzfxSecG3hRcMlKlEiHvsFHGQ06nqwO6tymtoWf7?=
 =?us-ascii?Q?lgHcvmqSr9LdumFcsJc+T6YESZiJ0MwkDyHBtPnVFXN+9Osz7vMgQjQKqvvY?=
 =?us-ascii?Q?e+mWmO/Gvb5c+OGhrhlyv1uE5lMlUbG5TjyvJqri3tiRk2PUK0u+ngRZ/z7V?=
 =?us-ascii?Q?3XBktNMeGBXFV0xhLWX7y5jOMre7V/0Hml6eBWxQ7tknBSFMPMiP/iaXiWfE?=
 =?us-ascii?Q?vfXC+5w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dD0DL/l9IteabI8952yCnh+CoS1r1L0+bm6TmkzzKIlErabI4x+UoY0myRb2?=
 =?us-ascii?Q?ESXoheIT6sZehA9CWNfu0rs+hSf5odrRx9ovOk8AEKStD04TEhdmGjFJUmgq?=
 =?us-ascii?Q?D7P+UlTDFjMmhTHg3n/OKQHMKDvUQwMNdWd3yla+c9mxIOFICVdjL7YlxaLi?=
 =?us-ascii?Q?tDIFeUanqjlu1MhOUSdcyBP132qGo3fr0athILRnkeReF6NCGhn7kD3wixrd?=
 =?us-ascii?Q?Xj4KlRs8Ao9e9/74NqNwyoIbfhI3ouH/VWL/oWZiu0BqrPhswHH11Yj8Xamc?=
 =?us-ascii?Q?Dvs9xzc7gHJ77c7xFR8+AJfNjoh2idMJ5EzFbSqsANXjsoHuF+er7z1V/iA0?=
 =?us-ascii?Q?nbadXdLHa+dNZI8s2kQUmstdc7LjHkkOaIBP/msX7ECUhaCS5q8G2aboQy4U?=
 =?us-ascii?Q?f/0uznZIXbd6T8ie1LNoJ0BshSocbcaNu7I3eO5IEcoh8/+RStqh8yBVwa4n?=
 =?us-ascii?Q?LIaX7fNiBZj3x7+RfPsI2fc3FtvN3JKozvvPElP4x9bs2Kr3JdKskADscN9o?=
 =?us-ascii?Q?OqErQ4rEkBxFIpYjwHLk26Vzfbtw71lkXEqdhhCJ0TWdF2uNjqpjGo4gxZhX?=
 =?us-ascii?Q?QaoWaYQlUutW8obIy7cCBefqqe8fZDxgmlFilg68HpteegQbdrH0XQ85l/Uc?=
 =?us-ascii?Q?5pVooDeRK17o2ob9t7LUoNGNGAg5yagOIpjf4OU0B7jIm/V8kLB+3orysy0D?=
 =?us-ascii?Q?3wsEu5Q92x1SZ9ZW224mx3wY2GnAKZtVuaFKxwcCbUiZm+1MCrDz4fnd+7Lh?=
 =?us-ascii?Q?ouX+WZ+d9EzqASGQ0BUWxbfYKKiqcWXxMze18nAKfNVfrJH2wmayok2HlAQU?=
 =?us-ascii?Q?aAxcux+Ira9UazkfM9FkcxO17Q33Qv1TYUqTkg10BARi45fmp5dphr1QTLZi?=
 =?us-ascii?Q?QsGMsaowcOpegZazq+QG7Jm8TujvI71H5mcjR220ZRtGG0lbbX2e+SEWoVmn?=
 =?us-ascii?Q?Z2+QYekNGXzPRLqpViVNVtcYG4s3/AIyqJhG6sGuMZd2zd6Qz+t6NBmNwRY7?=
 =?us-ascii?Q?Dcmv8yfJEBRqeIye+8Yt6xS2ts2y79mjyfZLcNW/1FBdrCjshizHk0XdutkX?=
 =?us-ascii?Q?9lxPeUVbq7ohT1EBVGRoNzUBkkDVUQLkWWo5Hn67RpuXalgZIywnErk9etci?=
 =?us-ascii?Q?MkdjGW9YPqvwsk08CQ83fXfIPYSNIj0F4v5E+0wi7zlpFdqD9N0cuLGELWjY?=
 =?us-ascii?Q?ItErFMT2WAmndFpLp83VFJEr8LydyHWvaPkEOWnBnLeBQGFKoTwhXYX3di+T?=
 =?us-ascii?Q?EDwuLz7VX+q34sZlH05pnBa6qPtDIfjaLwCFrigxha42jrOW9Re0VLQV0zGV?=
 =?us-ascii?Q?OI9RZV6zOeQ1HrNxc+4wcXXXLdPPnRPzJSvqr6ob3IjKyu+fQiz5DjS2z6/0?=
 =?us-ascii?Q?B1X2hcu5z8y+SQ5wFV4GKCVsTBRNqFveFOKW0su2cKVLdJPT+zPaC7RqkN+A?=
 =?us-ascii?Q?rkTc6EgNe8scOugbmen5SowVeiMp088dkeILs1k7DQMhrhYf1/+vVaq2Z3VM?=
 =?us-ascii?Q?BZ4E7D7vYoOGlRaO0NXafjP1fpzqVXzNciDwV0oPQgThJYrr8ajiRYj/0Tdm?=
 =?us-ascii?Q?eDCaa8R8+ARkLdx65z7mndWF1/EX6Lqfe+PaduFA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d2e0a4-fe54-4d2e-f470-08dcf2754755
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:41:10.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgbvxXuKe0qi7zTRbpI2MaudruAjbSs0TTTFmwWgX7cj8voV5xXwWo59aHunUKp1aU6MKKy+Gru2PNIgckiHvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831

From: Yunke Cao <yunkec@google.com>

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst             |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst |  7 +++++++
 .../media/videodev2.h.rst.exceptions             |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c        | 16 +++++++++++++++-
 include/media/v4l2-ctrls.h                       |  2 ++
 include/uapi/linux/videodev2.h                   |  2 ++
 6 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 4d56c0528ad7..b74a74ac06fc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -199,6 +199,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_rect``
+      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_RECT``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..56d5c8b0b88b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_RECT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
+	the position of its top-left corner, the width and the height. Units
+	depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 429b5cdf05c3..3cf1380b52b0 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..4c8744c8cd96 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -370,7 +370,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
-
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("%ux%u@%dx%d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -815,6 +819,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1172,6 +1177,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		rect = p;
+		if (!rect->width || !rect->height)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1872,6 +1883,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		elem_size = sizeof(struct v4l2_rect);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..b0db167a3ac4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..c1c2ae150d30 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1859,6 +1859,7 @@ struct v4l2_ext_control {
 		__s32 __user *p_s32;
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1929,6 +1930,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.43.0-rc1


