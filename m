Return-Path: <linux-media+bounces-4062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3859F8378FD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79352839A1
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B5F1A290;
	Tue, 23 Jan 2024 00:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R8W8pRSE"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CEDBE71;
	Tue, 23 Jan 2024 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968311; cv=fail; b=qicjuNXq8i9b8BNdbPtsBELjQBfwdg7e5OJ9OSWDHA5mfJVwaQA1tyd0FOBBSCNQMbvWanj6U3N6ZSKOXy/7Espa52ZC61Z0aXCksBG3Ufq2cFun1jN7UhYLgOVajsw1psQzLjcqzBs2XeeZRgs8VnOmUr98TFFJVl9ZKHW/fKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968311; c=relaxed/simple;
	bh=HJuj17k02Wy4MIWn61IABxtSoHKgnGKK1mVEJC5WBGo=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=vGcf+GudSlPMhdEwi83gKuYxX1aRVjX+e9ZvqAkSk6OoJlhfufTVdLP/MP99qFGDLULpt4qq9x5XY6VzLududcAVw0ZOIAXHjtksmdve8GV5sDFqmSDiTd7nzd+JiexjuUzx0nb4ryoMnj+CqjKDPbUoltuyA+q0kk8lgT5ldLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R8W8pRSE; arc=fail smtp.client-ip=40.107.113.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjZly+5v+d5FTGJItDRxTBsDzf9ZLjTw0RNjXneFPBB1xeLUxNIXaB0qgHwZ0YyDY0SxeZKdfg1RP0t6Ecqvu6LTM8rQxidOY/KAlUtTeusNYacN/35KtqEBqnL6ZHkf3wTara5QwDzTfMVfFXz29/JpW/l2WvTvDY2Vpn0Q+CcW2fynxq4SLGF2XOH6ETdHlqQjNpC2wotNHIT3HE4gry148FGj58u74GeYo0ZEHdAgkLDNeDPc4UdzCWuF+Nyiv9y3e5hyx0Xd9MlSh2BH0HmnpPMrqf5PB5C+D7IhZ9SbwAy7EL6kvNI809U2AA4VoWWelFBW7roEhj7JZ1+ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cInWHtK9e2Re+g2Z4kawMzOb6heitPB03TjvSzZeqmY=;
 b=ZJa7Vk+Xkpd5p2H7AMm2js0OfzoOHYBGT7oOgPU9beWc/GnzAvcODzxXZ5ofDlKMFRWt9BjoHL8taTXRwo0sRdunu18eB/PEgmTeH27EuoQTMZeColatYts09+b/2MbNkUN/nHWsDDbRHBi7AZKAhgIU3F2g9UwcnnYSW+ZBwmnvD1s6euEgsCA4CJLnQyxYYDbjAmnR1yfaje2EzUwjj5/g7CsAEezqVlDTpoHE2derVaTe7DzZJagS84vxuhzEdpGiCH6WC+DboWe1rje94XPYUAtqTH1MGc3ufYtM32P8cSeTcDbnC2Z+mx8qRjqto5XgG465fxE4vX8kIA6pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cInWHtK9e2Re+g2Z4kawMzOb6heitPB03TjvSzZeqmY=;
 b=R8W8pRSEwjZQ+N9Qe9MAll6Lr1rpS/467KlAeSGc815o0y3vKJCeCPp7wA3v4fzJD0vg/xNkMTrBTKuJiqoy1JKWQGs++pJ+G2kWTkDVNSaALwZQxgLjnHvEngz/e3wV6z+lvn3UjjNQFjtpbE44/Z9HLi1gyxR78bzcuZMFRc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:05:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:05:07 +0000
Message-ID: <8734uoud70.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/13] fbdev: omapfb: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:05:07 +0000
X-ClientProxiedBy: TYCP286CA0353.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: c7150629-543b-4f74-a446-08dc1ba6f55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b3yp4sgS7DWyBdp6D0XNL/6cG8FlXapQqBuTJrIq6qiVpqC9zDlpaWPvxxNmvls5EwOrjqgFA6I+rq7gAjRO10s1EgmiMPHLmqxgkSH1b0XKh6UN1JzlsrEzECcrPHpq1+waVbFqYKxJ0Uxr179eZaX3+PKOThRTkvtrmRFZHOHPTnA3i0Pw3G9wvfyvAoVskhvoRpzEj7s8JRaPHc2/Aff3NK8TCubb0WQHHwzXW6I7fFz7GXnA0gJ+3WkpBmDFpF7nFQaEsRF4N8cWCDsLKz/Hsa3Lul3T5nJwmHS89Gcu24YGJYv6LGtf9scE63NV5hRbAqyFt2JlRd241bg3qacN6ZmjH0971+9OPQpiD2kS7152EaqKqwOH8fS+gs+JEyAr9LKY0CTU1sQ4jQ15Utm+U0GtyG7OD3kMQzM6ybsbxEWzfSOH+gW1R1FSuc65JWDLk6dK6Ki3nSVk/xEsu6LH+ffirRyEXTKMvjbmu8/ggLJXzRP835yi2jQELwDSBzxiaMZulo4hPP9XCqSpOr+iH0W1EfOmuB0uak7zOKyaScbu2WaHFbG9pVRk49VVywsjZt+1S4o0JV4IWQOEAPCpXULkllVTH+baq7XAjUtcFh3V9BAPJZtGSshCoW8nzYuk+NUYWhlgFG/cnU429A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NkCQjXhFUH1qiOXDp6nvAVZ4vWrwZr7FImTZwsyYRbGCSYMGMphvJmsnax9S?=
 =?us-ascii?Q?hu+2aOvQsoRIrjGL+w3RjV+c/XTThiUjtAVpKBxR892DaT/h+6WKG1DGbA0k?=
 =?us-ascii?Q?xHs7UGoXaukIrLi5JIP1/+qhMgmoWT8yZ/MjU7hn59+uAE2mBwzZoMdi11bL?=
 =?us-ascii?Q?+goCSk9jQZZ2lNAmzjVfDBzb7/VyGf5j0BGTR2ZEUC30QEOaebAqoz8BmiQh?=
 =?us-ascii?Q?z3Gwrf9/X6RK0hgghgwYDAfpkSTgVqRDW9GrYu/YDgyDk9mA1SCILOtS6x0s?=
 =?us-ascii?Q?bpgIFJ+TZq+PP+WZAikCGu1Vd2nCXBU5DEdSGUQjPa4kW2JQ1IbgpJpIXa3I?=
 =?us-ascii?Q?2NH4hQPxh1aqg3F/PcAA/R4NUJj61gqyHNe+3u2ZOZYOYzfCegykYOO8CYCE?=
 =?us-ascii?Q?20NEtsoHg7uJ6keeWbtiKoQGPV5Xn1oRicNmyb+z+La6AvWuyHWXUBzCEhmP?=
 =?us-ascii?Q?tZGyQAhivvmBBKPBU8riH45uFCiav3Et2eMZK8IsLr9w/PwEyMqetKLBzpSH?=
 =?us-ascii?Q?WO34mb6W3KNOyB3etkodVHXa64BAHUdpVT5RwOng4gvMm9XW4f1QIe4SwiNn?=
 =?us-ascii?Q?0bbCw/zXC3HBLcjVVZ4d9NJ2GTMBmujESO/Lw6N3Sus8djvV6rxhoXEIby15?=
 =?us-ascii?Q?7ZCz1rsGf3CkH2sYwgkcHTvc4gbmcw10cdQlKANHg+t+9lbJ8JDerssxPTIn?=
 =?us-ascii?Q?/XbYVgmmvbBpkhnQU2EP/9BxTg8sNHy+3M0rCxElDVijca88qhiywBVI0RBl?=
 =?us-ascii?Q?OFq1P8T5OWatCMtBKq+3Cd4Ei/+MaMqA5i0W2yDJriKcfC0PVyPpBliEtnL3?=
 =?us-ascii?Q?bB1gcLYb6ltXiz4SvmUu79gVfZ5k/EgfZ2l/1lbBWK2UEYYU94W+t+oA+XsQ?=
 =?us-ascii?Q?zp8Sac5BBReJq07dFDoWqQqiWtzapsDORMJepmWjEoRuEXYMAXoOtQezLF/q?=
 =?us-ascii?Q?N6Vw5E78jkvy8QXRPJlPJY9GIdvmKf3M8r7yxZARqLjyuQWr+X7//d9ryVbp?=
 =?us-ascii?Q?E7M0RUitYv4GL0NwKVTmCrtX0RnE5w7ZWpr+xuafYLn1Ehr2iBcWpqgSHxIg?=
 =?us-ascii?Q?8lDaMZhGlZr//WXA4PNn4loDuUHSjI/A48AeCGPqVTcARxJmTYTeyPHUeCHo?=
 =?us-ascii?Q?4/FGRHhYCjYaAowZSf9NXfKCEIHf7OK+WKOJmjSgkVz0bXE3f4qpY2kF2g2c?=
 =?us-ascii?Q?x+RrxO/TV3vjb9QFZvc9pe5J24IhSQVwW5NaZp10RgElhriHLArqgHLhDGsW?=
 =?us-ascii?Q?LUS9lj6qr20o7Xz6/5nXgSFpIs0A7Cgr4i9Q8KherYdXo2+IXpbukPlxsY1k?=
 =?us-ascii?Q?9L6oV9XtxeT5U4nF013Xq602Cr9GwNW/E10egds9VVH1QNVrABlhHGINBtXZ?=
 =?us-ascii?Q?Kr3e3M9pzLMpWC5SkCJYTrWxOEdBZYuBSWZ/xr5ijUrCW3Zsr79DsYfAaPga?=
 =?us-ascii?Q?cpIPwHMgzow5+Co5VUN22cdzdjRWFy9JoVwolCu3QQlzfZzvRX9vg3kC0e6Y?=
 =?us-ascii?Q?g3Qe5uOkEsyex9pP1iuJVRDHenqBVILWjP/5vsjDl5xf8RM3jcWXoGXU5PTT?=
 =?us-ascii?Q?+aASsSsVwIcgW7B8uc8G24k/Ss2NLeM4OpMaNXg10yRxqRrcUmBAOQyDFeWM?=
 =?us-ascii?Q?rJkbHrdbYwIqxncs8kLFvqg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7150629-543b-4f74-a446-08dc1ba6f55f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:05:07.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5nIyIc/KggxfguZvCybZ0QXipaOS2x28FrSmYVyjqQlPGTQIasZSfYhMQ77naW9flvudYUhp9xssRicFJ6aYLPwqSpd/xujqPzgqMK28dNS/25/R+zr5yMI+drEEPFU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 22 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  2 +-
 include/video/omapfb_dss.h                    |  4 ----
 4 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389a..bc6346cdf849 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -845,7 +845,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 321ae18f2747..8aa2bfc2825f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,26 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (!of_node_name_eq(ep, "endpoint"));
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
@@ -81,7 +61,7 @@ omapdss_of_get_first_endpoint(const struct device_node *parent)
 	if (!port)
 		return NULL;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 
 	of_node_put(port);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b16..92da25a2d9a2 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -405,7 +405,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index 426d12881132..fc106aaa75bf 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,10 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
 struct device_node *
 omapdss_of_get_first_endpoint(const struct device_node *parent);
 
-- 
2.25.1


