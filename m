Return-Path: <linux-media+bounces-4063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D14837903
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FAABB242A9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F83542A88;
	Tue, 23 Jan 2024 00:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TRlFrEEl"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2888DE56B;
	Tue, 23 Jan 2024 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968318; cv=fail; b=mbRIdz/XMZuEveMKDkbr3w9OV7mKLPR3lWeTEsdC6EpDSdtkzWx7UCZWcftx9CMRGjjNoMNBXLEoYsemB4Em9gJDiYBR6zSNm/OgINOVFQhjA9GW4skpKKd+Q1oPWFbzPAFSCy4Y3/exYTSZ4p6ONQB9u8i64Eh+rZRjCq2hsAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968318; c=relaxed/simple;
	bh=Y6kVxd7KIkDnhdpNBH9XtmpjCfNEgN8FLXDGZoRSoI0=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=Xj3Euei2Pg8uuTxSD4pobF9VCLLpDVPwFS3sqr8nKLETiGYe8hCHz7XxIJKjKZwUK8hZYyg065qG8sa9wHIfmiTSzk+1ZL9HudYiC5oazjN7VLJpY7LhKBriItFviMNpzCGbbm4oUfWt2dwz7S2ftDfwUwsM/thirlXo80Wh6AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TRlFrEEl; arc=fail smtp.client-ip=40.107.113.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzEf9nY/emCCZMx8DXEdAIBwQt4EzDhr3G9UVaPstaPwF9xZ238SYaPLKBYjWTN7QpYPq33DGjVPmPPi/GQ3BEhqyIArXyMJ11jcHwLg44CdEUZtWLLVKTEWKORIJ4fnjnyPTHjH7WFNr0ikhXax7m0PjzBe/+oDRNSyOLQq0DTWezYxlL5tQZrZhLXFuQUZ4B9N4Vlp2SrSbC0sQ+FoPcjhYKUeA5vHQCEdDbIQi87xmY+iiIODPOOXhnrH0f7v1Vup99Abx+eoD4XWH0YfvUNxcNs7jyNX8j9XYJr4FdYtt73/xMySwUBxihXj8EelVuh1ijHGF7Z6ktkCqNqbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+e0kuCL9lYC/SuDYXiiMbN9HD6rHmYXhP/eXxxP3i0=;
 b=hcc1x6nCTdI05I3DlziZdyiAzA4eD0iT9pec8WXUnf5fqoj0CiIFMCzaVyKaK5WhU/gfDZqRNW1vHduJKs3QBRUGejIFezo+v9j9oqHCZ6DYBaB8tNuXKQVPAxMjECUXEdp0U9iKThh2M7EGG297+bPXedLABCvyHY/k9IPBozv4P3TocycBgZoN4cfX6d7HR7O+vRLkLK5tCamlTSzKBYPPqthSuFmTaUHouTkaWDkHOkic9WKT7uo7xGXHzAOpEVFRZO2iu05hjhRwl0psBE3hyoqDrz9q45TWYNtpg/XTZ8r893L6HWAfBrzLJPGTLMvDrxTncQpVKLQ6vhFW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+e0kuCL9lYC/SuDYXiiMbN9HD6rHmYXhP/eXxxP3i0=;
 b=TRlFrEElTy5mK4sdSFJ+Qphf6QrOF//sWy5TWCYiIPAXhCssPLsYWFDdLlH246tua94I5ufEWx6RdccQynCkRBKhmOUB2H90MMf3aW2/4j/L0CGtBM5VbTIUtAo+CyPK/pLVqNOzEgqOOulUvajo7msriDUiWDUGg7gYzCnIehU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:05:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:05:13 +0000
Message-ID: <871qa8ud6u.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 13/13] fbdev: omapfb: use of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:05:13 +0000
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b57cd2b-a461-4c99-b057-08dc1ba6f923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wNr63tAtAjeS3nSBgMokSjZufHAmeRAgaGSoAocL8uTgPTIG9hvcPsu/in2Z/BxhgJkvESSMtEhCXQNk+V/ACMNFWNcGjTR4iuUQ09z2GLjtUBc2CaeyTrkIeO0aKDoSIHYtiKMrbLvBW091dgrwpcR2q+a9XZLBKM6Y4P9+8yWaQvxLwMN4kOtvlBMxBwrk2POd+he37mUvgCOm3jxJ17inA/P5KoOfvpRUG2+1PiE2J+LEiMNlNFEel8BXEL5oQPtEEnVBer1xU/1B465oJmzl3RgVrAPsSVNDxBQY7fmPdbaZsGSazkGJobGPC9zuWI4qX3w5xrUAbl2Bb9Is9D/3gYL930VaKUfgBJ2ZwUd9sgSDvNb+EnS1BshKnBa+7XEAP8ZPIvzTd3pto2Bd9jT8yLoahi5LACkYmgSnW8PElOoshgquLeclTR3mkz4J1sn/znzEPdCo2U4hrzZKfzTWcD10HgpUoqkMFsdlze8qXBeD6/FJxu5wpPOX0A3RUKwahRY7A1lZYaATJmZ5J7RcVkJlL26BGP8moCscaR74tx+nQLNlGJfpWt1Lgw1brqdstmJit4UZ5QR+zFTINwUb6DzIMj8bDK0FqcSnJx1hZsJFmSONixz8eVu8a9qLnAHArgR1mJpQxwaS5w1e8q88Nlre2pFnyKenEoLmAbY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zCd2c+lNgehgxM1z4L8yOoL/w/zxETNjTEA4xN81c/wdA/xTOAnaNyE7CMhI?=
 =?us-ascii?Q?Bt9MXcrgN8RoZXU/14l9+WKur+RLsIEv0u+FI+B6EtN5Ax7gzEgv9nXBGJuY?=
 =?us-ascii?Q?Gkq8hIW/MNSMS+HdAQJVfhNY0yuOQPKIssAg9Vs9MdaxjAUaFNfJHdkg34L1?=
 =?us-ascii?Q?30889QvBhsKMEsxfKDH6qsVhMR7LAIjsM8bnAKSE6MSCUmCd6D86vQfB0adr?=
 =?us-ascii?Q?LjhXGey0EggMsImcSBkqsczot/yY+0u/4vDZ0PGyZK2PqrWEsBKBWqoAt0QL?=
 =?us-ascii?Q?5ELTRrFsQ5JL4thTUYVUv7sQvpyjhVFz/QTc9JlZ8aDYlRnTGbcEr/Wjns0c?=
 =?us-ascii?Q?H/4O28msPK3PAdsdw1d6+1pvCGDga7hBO0osj/3BMxM4aeeKro4thRCukVew?=
 =?us-ascii?Q?ImOi7V9tkZ3xSLmfu9xJmxSb/9sHFblJocPSqeJ6lJysqg33WKECUILh11Gp?=
 =?us-ascii?Q?dWYyucUw5F9kA2HbtJdi0n01qcNDX18FRQLWs4JfnX/0vAQc2o65ZiBMKHkv?=
 =?us-ascii?Q?15Z4L/V9bZ/B5v4TuOoU5FBPsha2dBj9/uMkTVYqLaB3hnFukBHg4Y5BjUJs?=
 =?us-ascii?Q?TzDcCKxZBpXIOHLC3JWJNrRJEyhgER07TKr0l5nUsWUO2UXBwsOtkabGfIM8?=
 =?us-ascii?Q?IkLw6hiUPAZEeQObrWWPotOIyr+G5CQ1lMqvmMgQ7s3sI4vlU54jIu5OoA5r?=
 =?us-ascii?Q?pvVxLZJu4UkjvOVCN0VV1/CxVIXRWyVa1sVkTaL/EM2uQn2oYkiBlySXZT13?=
 =?us-ascii?Q?6LnI1+hzc5sHukkbzhB43W4b19hi2qqU+1NOiFjjJ93nL4WMOdPam/IT5EKd?=
 =?us-ascii?Q?pQGrmthVvY7DlfT7AfivCyrAjw490YIq1S6K2Lqb9lgZFKHPuLWOMmRnvpKj?=
 =?us-ascii?Q?A98awxx8a3mJ7sPwUAfQzo5ZPLHrdwyv35pElLFMs+giY2MuyAxK7rXgogKV?=
 =?us-ascii?Q?SPbn+d3Rf1oLvQgKrswmapnFqN+tk+Spu4hw2nuK/Ftn1dvs2nJIKnmi5I/3?=
 =?us-ascii?Q?z1Wn75D1/MAAlhKtf6cCZYw0z2Qn6G08AwJcvj+jozIeO75XBTZkeo+ODr93?=
 =?us-ascii?Q?L4SSdCOwF0WcA5TsXYNE4JqqWHvJhj7tkXp6cpoGoxWG1RqYlfDIy/vF49jR?=
 =?us-ascii?Q?/524Wniq7NGO95PKVoa/hNQr9p3Sf/T8q6zTVBspxGxP4GyO0IwXZGwoyTuz?=
 =?us-ascii?Q?2qD2wcfm/GKtWwWxkSAiN92aorEDrGvmA2Atb4Ug42dp7xNo7iIxFRAg3Fh9?=
 =?us-ascii?Q?qfyOlZnVTEjdxeu2TKxJpQs0qLG85Ol/ymn4cgcnMjI6KS+hnmrB78i635lr?=
 =?us-ascii?Q?ZpWgo1tVpWWjJVQx9Cmg7T0TwtFz0giWfSqAgNmq0mhgpdiqKMD6cVZg2VTk?=
 =?us-ascii?Q?SRea3Dajo/s9y8Mte/LvTXQQ/Pzvk/RVhKPKeK1H9FtVTRMVx72OlSw6P2sr?=
 =?us-ascii?Q?q2H8RHYVTmtZ2Phyrn/PJPXX4msycTShlOId+83nFdy9hmzdVrbZeRRPVjwK?=
 =?us-ascii?Q?FZCh57ejwD1TQAul7PmKArW2IId1uaQzSqMihLqz6Ajf9A8oyXH5Y3dQe6rD?=
 =?us-ascii?Q?pV3ABPVeou3LqFw9QawvCp4u5QbbycakzYPbvrCpgH6G2beOfx0jPoh5CFXt?=
 =?us-ascii?Q?cy8fAcZhtj7EGGhd2FihvkI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b57cd2b-a461-4c99-b057-08dc1ba6f923
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:05:13.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIaa/rzeMhbdXx3a+WOa/E1OEOEkn/M73pVhnR0V4O2itq9GMbk/P4jhrvY5MQY9BfA4McWLAj3pPWsKdgx1g82jE0OVH4j8GuZKrLdrJcXptvqI4ez4vOQ9g/z1g/ot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

omapdss_of_get_first_endpoint() is same as
of_graph_get_next_endpoint(xxx, NULL). Replcase it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  2 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  2 +-
 include/video/omapfb_dss.h                    |  3 ---
 6 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index b7eb17a16ec4..7a13c4451855 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -5079,7 +5079,7 @@ static int dsi_probe_of(struct platform_device *pdev)
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
index f05b4e35a842..ba84ec179ee7 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -529,7 +529,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index 03292945b1d4..3468a3c22a65 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -561,7 +561,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
 	struct device_node *ep;
 	int r;
 
-	ep = omapdss_of_get_first_endpoint(node);
+	ep = of_graph_get_next_endpoint(node, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index c9d40e28a06f..889a28694b39 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -764,7 +764,7 @@ static int venc_probe_of(struct platform_device *pdev)
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


