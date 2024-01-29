Return-Path: <linux-media+bounces-4307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DA83FB4F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10BC71F23199
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9B4944C;
	Mon, 29 Jan 2024 00:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Qk1R7AIg"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC28F5B;
	Mon, 29 Jan 2024 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489709; cv=fail; b=s6eWiJaEzYux23uM3fpUGoI2Bi0zIo0zQgw29LSHy/LX+dYm2819/NO9A2ReT/RYuTKM3U38sPOWoG7YOi5mrF9iJXm+MQ58Hbk8gyOM2z0mJvh2aZmldQUvxUiW+xLNRVGqACuP4Ui7UCeejhbRQfNdeZASVTX7KP2o59CGOJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489709; c=relaxed/simple;
	bh=O71FA2E42UYsMrjWzxnrECf7lu1r2wSaetj5Tv9Gp2w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HPXL3fOdlZiClkySZYGeFqocSxfQUhA2SKVIyW6DdX+zejxNaztIt/bHBOwpFOOi8oCzXAycFVlGkjcOE0Kf0nQRsy7A05g+IzrnomA8JiXkMplqhxLl4BsCQbJW51BwIK39tvwgwT6npStCjUsVSlRc4Whv+vl04v4CRK29O0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Qk1R7AIg; arc=fail smtp.client-ip=40.107.114.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcadDx1MEVNpNXvF3dBpUgsgE6Km6BRXt9zDXOI70FduQlDAsty8nAT7d0w81ms5b2zjdIWA4EsDLMXdCwh3sFJKU9x0QZ8EiDt1jRB56zh+vy9JBbIev89LO6Q+ZOo1V1Bn8KYXK9N4XFRxtK1RHzYwAHRhoOZOTNmI48g896R9FipQCEuDqXY2aJveftA/xNn9KMkCu9Yw5Tj1ovxqVdROlE8ZMsrTROH2mxPORFZqQGR1huu3+3sW4duHTbz7am9uQ4Ry9I6QdXxQuGUnQWrQ2fTIfMeqPexzdRGcQ4+85Nu2gbXT9PLg/N9okEENivJZyola+Khcm2PTj2jfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nOTCUJGIMIXj+KvwhKMa89nGXFB5+3ZjUbE8AMOrDw=;
 b=NMs0d2r93ZfXrZqEsOUv7Elbo6EbBIvQ1mzoCCGoegX1bNXSNDGbLEqI/WZySXEPd9W3G6t94Fnq49iUp2tI6W9HVQ3Ojq1JgBxETGgdiOPkYPhyDay9c+BE8Sjl2JJR4JZ9o/ka9CHK/kH3DekNqhIHmGUvpC8omiblxwORiVKyr3VD+1LioPIb26HQr1J8vLjIvr+OHKVDDhU3ditbGp+4qW278PQIvmR4hGhPAbKobbKoqdzGhE2d7ET0blDXgG0SAsGhspKe4A5jM/vKphi97uOtwp+5MTtaknpFn1MZH1y7cMKKtyHmkTqk4dmraqureM4WQgxGYlgryNGn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nOTCUJGIMIXj+KvwhKMa89nGXFB5+3ZjUbE8AMOrDw=;
 b=Qk1R7AIgy7fIalWT8C9s4nTGiwz7r/rlETU1WeZXhBoEnabBIaR4r3JdmvPpdA40vzWT1F2p9JibUWcjck8Ua4WDrvy/X/nbptXAFx0UFubUhnPrexf+emPppPfEDXOdxuGvm7JKVrgDkNyKQU2F2cBNHQe6+iGnmUFX89ryOWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:05 +0000
Message-ID: <87a5opklg7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/13] drm: omapdrm: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jan 2024 00:55:05 +0000
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 736dc3f8-a546-4dda-b155-08dc2064eeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0KHdj1pYqpGkJkTrjQp5E03VMn43krHKJ5eOFWaYUvRP2qiF97a1j80tDLk0mqu0DUjUkFffKXBS+4BySWPbudr5IKkxMYfR5ivmRCpuRWKAbmwZp35QbSbY1h7R2V9yPLChfPpxs+bSRFEp8sWZ4uYe7RAxj/NYx2ZTkbQ9HjoTBqTbrZX1z/j/tQaRWkWamY3Ta6+JmcDyK6Llfewm07mVQKRBMyX4EEfHnGkbKvG3Y1/YkwQ3JzZc6zv1Y+WUCYRIJaPlRpa8V7Snz0bawX/Zzfhxv6Sx2nAGVPlGo/N0WKePjPySxmW5uWW/yk984SIYJfC66ywXnJIfJLmZ5XXl8unFk3qQD6Y/yzJ93/SzKCKSELtWvjCZoE105JJqde86LzFofkpXp0JT4DzaLO6b+upxg1f4l3lt2SWCpBDiEUK1W2Mo0CKITtgQGORB6uaYwEoo0LTUE9TtWKzPA5wkDLiDss+MYnIH+rnwCMSHQOH/Xq7t0gJIObk6xx4mzWzCnJQs8yEWDrRf4RPo9YmyxYr+NwA3+ntmojL3HFIGfEkYLsVzyGenNDE7s/3VLk/7a8Y2Mv1vHZaZgtf+isOVQ8eGExLgd8lzNBQqxwNHfxfNeCGqmvCabXh4LDFbunh24x+/eXlgOwI7qE4e7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mwC20YEcbPremXTUySINeAiQ9nGGQtSzeWQN514EiJOila4LKeoLbmsXDUAw?=
 =?us-ascii?Q?xdOb6TufQrcFEYNFbzMn8pmWwESjC6Kz3pQZcxIYLRoOfjnkxWMUisdbkcK6?=
 =?us-ascii?Q?X5FXdgH4g/W+ItOlQxrGs6bShYPaI4LXL+SkD7wfMRTwe7Z/X6UaSxZ5y9k9?=
 =?us-ascii?Q?1WRZ8EKqGmhtWfBcPbDMvZgE91sYsM97O+tKkgdRxyC0aQJ9v9Dtr8N7JYMT?=
 =?us-ascii?Q?IZsqfmCKv7UJSgra7Z0UEaQwxXp95wwFeiDKCUvSSdknghAiHcA3YdoqCOPu?=
 =?us-ascii?Q?E1Sl4DZoIFDoD9Q21ybJlXgLXm4iob7C90Lw8H5g2NaA6jDVe+P2W+MUydyw?=
 =?us-ascii?Q?bTh/1btTrqz8RXfyw/FSajn2oJMPhfMu38/z0hP6VBzPp9ODePeGMhs59Vp/?=
 =?us-ascii?Q?Rq6XKKBghFFpZB6Ws9vc7/Eku/538YidrU/g7z/2tXplcPRh2sPnxt7b3AkB?=
 =?us-ascii?Q?IvNNXrPFjgyrZbLeWpt+VapV9lQKfcwC8KfQlC6dMsjpbEfyn4uiwE3ycHw6?=
 =?us-ascii?Q?sfzbYK9hsZdTd8ePMFVicrSSXJ1omsAKRI2W4Rp9jBYvMj/pnc1OwiAquvmn?=
 =?us-ascii?Q?kDYN/3JxuE5nDD6Wfg8D1WbGWEJReun2Tqjn9mP/Pe5hdxPE7dZhZ3GXhj+M?=
 =?us-ascii?Q?KH+ANoxKT0axu/H3wIJM1IVt6HWXyoL1KkVo/UBNP0CiLgadn8/wLo6CXTi8?=
 =?us-ascii?Q?P7mRiTtemPiJW1aRDG5O2HDjHzSa0hGPJ4siL+D76ib9BXE1gXurhon0iU9d?=
 =?us-ascii?Q?KPCSoutodXlvDv49lQQabAtgXe4Xd2Sg6ECh3lLZI2byvKTNKQZR+MhpdKQk?=
 =?us-ascii?Q?b+AiCL56pHGOvZGDYyhUZLPeRSndL0TOQ5FbYRWqP1EVJ34IdCQyD+TIVlmB?=
 =?us-ascii?Q?jn8vpF+YqNxkModKqzOABwku6AHvjoB2xI7fbCr4vtCwpK2IgiW/oFOAa/tM?=
 =?us-ascii?Q?I05CjALwgVj6hAZQc2JCgaJfQlxio4DFvf16yx745Vof4/pOXk8OovJCqVwQ?=
 =?us-ascii?Q?BzF0bsUKlOKDp8FsgK2o6QM42lRpIhDGMbCJhzYO9ZeJ3cILOHYqO7HNRVSp?=
 =?us-ascii?Q?3KbjAwvEDYso/YdXobBQdYM3B2HGGHoqetxVC2yda6rejZFaXo6DYD4P3wN2?=
 =?us-ascii?Q?PvTnlqMnh0mOD5PetuY3oZVnLfrV25OMADMOveirFFAVwjXhdbu7UUl8JwD3?=
 =?us-ascii?Q?MlFLzH5hty5SKQeUpTw8N5R9gVfxU3diWNEzRYrj0gDEPcseJb/UxNQoYrtH?=
 =?us-ascii?Q?MRuIGwJn95RX99eNHwYD7Kk0gjT2bNI516ToJ1cGCsc+q9WZUYgvsSDMNbAY?=
 =?us-ascii?Q?fg4dTMujMTqJfGadOGmxlQ+2752TKn0NkLYP9TjSxF3dFxFBmGftVCUxe1tb?=
 =?us-ascii?Q?bwUB/yBzjTX90X+mUSGvkwE5aCOX86zslSf38cgrXZ0K+cmH8r6K4fqovSyz?=
 =?us-ascii?Q?cNCaqheiBy6vxVdMYQsr1mjoflLZHp+abL/ZCeO2res7pAeCc6Fjc35A0PKH?=
 =?us-ascii?Q?lWyKw9ZiSjLGcs5QeZftWfkK7/gxo875BRFSu0uFQp7j9AVyBnyhJTyCbDNo?=
 =?us-ascii?Q?IUANiMshMLFGl5uI/dcHTJ55k1NlWCToxon9gp3XitCjhd02gqjBX2/wEBmC?=
 =?us-ascii?Q?uKF/I+RzswQeTduAO+548l4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736dc3f8-a546-4dda-b155-08dc2064eeb4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:05.4253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EX6Xli5VZarnm3AyxXO8dWOZ8TuhwBaJ22jFUifi76cYxIbGo40Qmuf9n6lYY1gX3Ni3EghWJ0IapbCdOt1QT/BrdNzLNq9VB9EQhGGMw4UdNEkMbarmYtqYjNQ5lVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c | 2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 030f997eccd0..edcf7f4fb149 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -709,7 +709,7 @@ int dpi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 91eaae3b9481..0308dfc00058 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -346,7 +346,7 @@ int sdi_init_port(struct dss_device *dss, struct platform_device *pdev,
 	if (!sdi)
 		return -ENOMEM;
 
-	ep = of_get_next_child(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep) {
 		r = 0;
 		goto err_free;
-- 
2.25.1


