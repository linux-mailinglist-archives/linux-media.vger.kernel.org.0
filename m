Return-Path: <linux-media+bounces-4316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9783FB6E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6221F22377
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E1DDB3;
	Mon, 29 Jan 2024 00:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I5VUEv4l"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63758D528;
	Mon, 29 Jan 2024 00:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489758; cv=fail; b=Jh5ooAJShAjy41lIFVuwiVEOORHGgzqytUFhNP64TWxd5Ayu5jOzFPCdVFXrWaJsbcSa9qF/q0IxxIZc3+qIfCPrpifE8gZKfXR79LhWokiQYbFxvMM2pdRXHxZWzL/vvXTRq/lfs5V/1e6qq5KdlLMCBuLpJKggWGwEWX4/380=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489758; c=relaxed/simple;
	bh=L97gldjhPAaN74NzEXmSjFMqwLTTfTDhmO8pJ+flifo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=htqjBAcg1dFJaCp4JJKmzT6VWWiyaFcx5DViEQHCqZ/W9/ONOOEySud3nonDyWHFJZG4c5jjVdhkRMKkEHlw+VOkkAwghIwZv/S1heeEGRvfO90jxp2Gu1I6IonTEqN1ZeL1bNToRl/aRiSb9pZbNFpmQ5L+YrvAEQpxumUhono=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I5VUEv4l; arc=fail smtp.client-ip=40.107.114.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXKEdCM7UOA5BQfdWdcgrAXDsk/s1VZOrVj4/nGMPnI8YsZ1VsuLDWtXBOjCPXy326QcPOieNhbsASH8QkaguU/7yEIjS9WgCj4bPEcT8S+OL927tZ/LkdIFkauvIbyzpSRrToWCACawSxizQdNDcAfxrVLTc8Lt+IovvJctp7NPYogIPZL1MvXJqR0WVKpm0ArLB5afLwkXAcacTJlr5fyw400f2tknYyEbDW+uOLS8VsnGV3vW95YG8BI6LmXSygP7KPA9ly315hJBew6tqeG0JjoF9caLCSIZ4wSkx4OClbTKdd+FXOQq+ojU8/x7KHk9uO2e2eZ7T5thXBvIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IHKBzeEcUZQfmcDU6NiPxc3v8a75Rb9dHE1d6hECT0=;
 b=HdM4PjSXuCRfP9O8Yx9i8c410XHrUDnIDOhotzIr/km8M1xl6Tk3vlMdSmEulXgoBBkMms1vftUMyH1aXI3jP9LszOOGJVuvC+xXt+iySjlkN2KfkyD3xWmQJ0DUlq+1tVnhXhH1Md2F+q1OXMenxFN0iDHcV6Sar1oIDZlsW7XDV/YsDys77C/UpuiSz8sNE7LUip6OTb/MZvXOko6pf7N2X8eZ2OKjHbUSS/LDvxx/VW7U/5HFLgDW92mK1gUXAnIKYusebg/6Y5wXxPFYzshuB/P8qIDCN/fE926U3lIlyShkell+5n4ePxXxc9jpOLAMBn9VnLgoYYhPpEGTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IHKBzeEcUZQfmcDU6NiPxc3v8a75Rb9dHE1d6hECT0=;
 b=I5VUEv4lObV4bltx1OIzwDMo/bF2wl9VbMXUs3tS6NqN4pp9SoZUTiJNPvgiWYxteELEwHVX95GA4907Uk22TURXcTcV/d9SWedom5lca3hiiVqPjGnj6ndsfho/HxgnBOcKVTItM/s4qRhPWe000gX4FBezXe34Re1SOj7Way8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9881.jpnprd01.prod.outlook.com
 (2603:1096:604:1e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:54 +0000
Message-ID: <87wmrtj6ue.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/13] fbdev: omapfb: use of_graph_get_next_endpoint()
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
Date: Mon, 29 Jan 2024 00:55:53 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: 148a8932-cced-4b6c-08a9-08dc20650baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n6pRXDYEYib9VjoEnibu12yFAVc5LtclP2re0z7Mcm8oLYk7KkB5vYss+JxK48YAGjRfe/qsR9aiT16P74BDOdFMyRJ4mtzpDtfhEqFkBF3J6utKA38XwIMogXsPYV7MQVWxGYbDu/aC+Z1KPKq2EfrhKFTMSFEFk8ylrJDfVlgxHwSOMtFicPXrwI6crcWVTh/QA4qVIvsrI+fJ3RLlupFed3KuUMUbAY9LdeMnDAvp5qSbh3PtAIj5AgoJpIhoMtoA/r1IaS4gPvmywVePT0qVRTeQ9+4RYwJdB6G74wzRqpM2jDnrhMqL5NUP5LUqRA6vit7lFgHzlMhTpOHEJFt62U14y5zPG6MrgTGGz+VS0ppjYkgUAmvI3QuUfoXL2M8umKqVS1zDGfeeillcOTUEpHxsMgCQ/RTg8gfJSKx0IJwhjjHRBjgiZMoVrv2fTiOnIRyIkFVamwlgJ3DTJrKX/qtGsHt9QfT36B9RzNMhe8cLZdiOaDlhp6kPK4P1Gozz3l+s3r6K0UQkQbgEPaP1x71VWkEqqFUMizRFlPyYVdBMTqsZh0D2L3K86A8TfXcyFUtMS9Xx6ybFnBa/oGgFXMwgCPWs+E6efzXramssgin9r+fXw+eGjxXXG9xn2CZuY7G7CSxNJcwFtOLi7XYbU8zdu4fh49YxJQb+jeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66556008)(8936002)(8676002)(4326008)(2906002)(7416002)(5660300002)(86362001)(110136005)(66946007)(66476007)(316002)(38350700005)(36756003)(38100700002)(52116002)(6506007)(6512007)(478600001)(6486002)(83380400001)(26005)(2616005)(41300700001)(921011)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kr+zOy+bLQ43kStVDcqp2oXs1OHP8kblVcDPfhRRI1zrUQgFIJBA4nX8S2xw?=
 =?us-ascii?Q?TS1rqbcN51QP/tO8qsMRenUJvFpYFvBrPW6wtCft1kDjAaf66iW/kguX2YOV?=
 =?us-ascii?Q?TfIspPGxnSO1xV27DXKp6BLR7Au3UdBcpHjG3mRv4ryTjoaPNR/vVSwcstoH?=
 =?us-ascii?Q?aQ4pI3X2R6EIEVdHJNOTakj0DG5EazbR6W2MukAZ4TMp35AipGPUKWB26ip7?=
 =?us-ascii?Q?7WnG3cne5WK7clxekP/hMsTNp95UCEvrVPtL0SK8ll96rpwNhsOdC6HGxqmL?=
 =?us-ascii?Q?piNHN4wjBayCmOQpvrpHjXjMT/zSR4GUuxKxqThVClchFeHzXzVFF74VkUba?=
 =?us-ascii?Q?TwgKGje/3SSQWLhxqz49Ji6UksMGDXQteaewuVIiPez+QqMwtgK0z5iw1VSd?=
 =?us-ascii?Q?m0iOceATwXSFV5cAa2K7SnPxMlRp1USiOyIwb6zz5ypaj7znA4khcPXbS2FK?=
 =?us-ascii?Q?EqGfjKatAU2sE/6b74YfmwYGjVH+F09LRddEmmDiv70QUOGd+Z00uahkC4CK?=
 =?us-ascii?Q?K98sV7Y57PMyE2s3cuaKaChn1LHx0fEUykFB6YrPyDh4S8OS5JA0eZvZk0YR?=
 =?us-ascii?Q?dQ7p51+idOk9nDAdN5ppxKyTVmtbguPLhHnpbzX5gpiH9Y+bH108TzKdUDY7?=
 =?us-ascii?Q?2B9EE9lVBtP5VJ/gV2QmYGlulgHVEe3lJbbZsS7p8pspMz3PxSupVCtFsJJA?=
 =?us-ascii?Q?srqitwd9pGmSJ2cLhbyvtY5xbMnikIFvEARMMxm6h3jsymB02CgQcCHwdsCU?=
 =?us-ascii?Q?iKDtQ3aYLZA+pKCWdeB0jUK0FHpf4w1uHNmhURmXAho9pI01SBXkcWJ63zkX?=
 =?us-ascii?Q?LYRTelxM8S48/NFDhq8LElrMjdkDi9wEb4YCa0RMid1Yi7VnEkINSqB3SuIN?=
 =?us-ascii?Q?dymxmbIxOYtKX0uQCbCdevHg4J4buQAQG3PEhBYdTKoRHsLM1GDNI4IMaJDd?=
 =?us-ascii?Q?sHIg2+YXCT0Jo8RL+HJAvmRSH0UDHjyJHl8PWvpEp+7IICWHsbCKJBOk5f86?=
 =?us-ascii?Q?5qDVzRYUaOIw0lDR/vDriEpKKUXdRfqHPn9eK+UOM7m8Gfe3/HmdIipp1dQ/?=
 =?us-ascii?Q?uCerebhG1iImrKkW6qMNs2HYBL0bTfuvReVQaLyqGTRNRBYTZM8SzSpN2Jqn?=
 =?us-ascii?Q?iWfyYXZ3ovXerdy5MNvrBXqO3bOv/8D8V86ZqV+RNIPIiuDpPx48X+M9WYlJ?=
 =?us-ascii?Q?+6+EVh7zGlf8m8bk9pBa+3BPPjEpZyJZm1Hr73k3OvuLzKEYlMp8utcaXXbv?=
 =?us-ascii?Q?vvaOe2iqOxu9hWRceomNa76ZVNoQ95UrdGdVPfV3QeNG5JNAo8VLkF1PS87F?=
 =?us-ascii?Q?ZIntX2gW0XOtJGwbP7LVuanzKL0J/ystInytHA27DQqtQDd39vI7uBz+QMWH?=
 =?us-ascii?Q?di6Imd6KL7zSTXg6AKIe6dX3tNafnVKqm0gN53Iz0mQgdh4lfFkKNm+Mb5hz?=
 =?us-ascii?Q?YIWPYwvfziR6G4JgMX5bOPf4cYRHq2VD6dHox7rkkUGwcMt1LNQUFieEE8Fc?=
 =?us-ascii?Q?N8pAb3Wsya0NwLhA0btfLhQmJowXYI+QWpAVbQ2TULNj5Dl1pWlEkXrS92h/?=
 =?us-ascii?Q?mH/s/f/MxLIV7JS0FUf9OtIT4oLv8HZaTv6gdRHHcICYSg4/fJX7I3Bbp4GN?=
 =?us-ascii?Q?kZ6IQFPBJuQWinP4Ip8rGiA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148a8932-cced-4b6c-08a9-08dc20650baa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:54.0436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2mIQIUXOZa4VjVjOCekXhrNdIv7lCvvBCD3fB4hIs0Rn6DpHJtZNwJH1CHbKdm4TxYLLSaqvxkVuAAQdGMeQi3B9YNsUAD19392rOJX08xGjeCVTZRdH/IoFXAMWPqx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9881

omapdss_of_get_first_endpoint() is same as
of_graph_get_next_endpoint(xxx, NULL). Replcase it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
 include/video/omapfb_dss.h                    |  3 ---
 6 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..50fdfb9e9411 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -28,6 +28,7 @@
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/of_platform.h>
 #include <linux/component.h>
 
@@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	struct omap_dsi_pin_config pin_cfg;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 8aa2bfc2825f..1cd3e7251964 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -51,24 +51,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent)
-{
-	struct device_node *port, *ep;
-
-	port = of_graph_get_next_port(parent, NULL);
-
-	if (!port)
-		return NULL;
-
-	ep = of_graph_get_next_endpoint_raw(port, NULL);
-
-	of_node_put(port);
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -76,7 +58,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	struct device_node *src_port;
 	struct omap_dss_device *src;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index f05b4e35a842..83f53858e5b5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..427258d04e18 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
 #include <video/omapfb_dss.h>
@@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..30d90476f90b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -24,6 +24,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
 	u32 channels;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index fc106aaa75bf..d133190e3143 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,9 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_first_endpoint(const struct device_node *parent);
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node);
 #else
-- 
2.25.1


