Return-Path: <linux-media+bounces-4061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB88378F9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8C21C27CB9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD05FB67B;
	Tue, 23 Jan 2024 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZOInIsBE"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2123.outbound.protection.outlook.com [40.107.113.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50E5231;
	Tue, 23 Jan 2024 00:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968305; cv=fail; b=QfJPqbuNiEb307z1PV9Huy2dCRYRJrNJ/Hffb0zKgppe6DnQBV4iuR96T63ZuQ7TSmLb24e3Q+dQSz/4GJ0ogm54FGYrvWOGOQ+CuLO8+beAHQiyCNAkwhbEnOWIVAVaHrDVAMtu2q4e1EdfYenehE2Yr3gLPYb/H2BamPUOBBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968305; c=relaxed/simple;
	bh=qJH3kQTjmsJfD2prCTK3MIezU0QSxHVYSkCk/IduxRI=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=fX2tcfbSR8wgzcYOWOcR/3dkC8P/4ZgoaznGZcUbqLNtv0J74DeQHfIy2Ml45l1WxxUBsbsosdh22z9Um1CtfmNNzmgnI95WyVjCijClTwTjEY3QR8eapCC1qTnk1Lh6MA0GbhOILGLsBsGsR8m+HPPaR7sH07UqMmx3b2l8zPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZOInIsBE; arc=fail smtp.client-ip=40.107.113.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKBz6qS9z81u8eBDIa4ogYMCuB4VnvLVipAB+06urY7m/z7VHYLt0XErWr4Vx68KqgRYrwRVgXiEXr0CODSl1JIveiCoj8urEm68ISPhqqx16nme2UcdRDQRffvBi6T7o0ubEba9/8JpT9UiqNAucDKZHu06+coqxjoMkc6vWuhlfD0uIk8QNs/58yuHUVbMkHyyVFzWwLP+7A51KIS4CheBKsqbmjTKyl3nY1uELZFsXGE8x/AUn9D98pf93YD+eNoZOk+6utXdL5bSiinXydw5rgj04idjIwRNjMvmUWdBYs1YHSp/q4DJniQjxhdFFlk9rASZ0V9fLXi3/f1jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPSsntbmXKvS2rzucUWehFVtWHbccVt0yvz7/CtGjxs=;
 b=R127v7OoGNEdygid+dTTSmM/u/dq2fxMGeK18dvtD6a34sbB7UE2wwW7xcOuocvELmbiZHKEUSmCi7LDhpf6WbHlaM4M5q4Q8kQcRgYDu63mGoFcqnsZcD31BK9BDj4IdtFQ0/gFlurlG2iFoz/gLrnEwExaobbA8FBs5Ns0LhMRYr9tFIXFV9HmCoUeSTGgm6CvOTDdA2SUTTBL3oVm9itpYEhJ7Blg9dxg8BlP0UqphA+kzwyXJRTjv4/9PJ05mnFj+4FQ5rsIDOWpik6EZxGqaPC/rFXh5KxCiHINv3GYw4P5JiYwAjXorhJG48Jt5wEhUw7B7fIiwLjTtjy4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPSsntbmXKvS2rzucUWehFVtWHbccVt0yvz7/CtGjxs=;
 b=ZOInIsBEOkXw86IXVCAKfi49oyOq8FoO2beuLasjVRQb7S1i07NI/SHcOkWHtrQZZkWTZQYumvpJ0oSq3BBXpWmSP4pYUMkfAoEtRI4x3TGW6b+vvbTqLUxi1gGatFrTsQxtNAyyHu/nhYq119BSX9Z5Xv7jTXx/apTblHKGMJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:05:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:05:00 +0000
Message-ID: <874jf4ud77.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 11/13] fbdev: omapfb: use of_graph_get_next_port()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:05:00 +0000
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0f66c0-b169-43ee-5cce-08dc1ba6f14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LEoQOrmr/Bfg/7536AB3jxurNjdQNNPNoYWqfXGVcxWx7RuebXE/f/93uDn6X6f89IvhxEItZcU4jBEgkoolZQHD4HZmMVUdNDW6dzdCKEL/7f0M3Fv5wraLGpzuVUW8SV3mLQ4q8LMqqCRdunb9gOkuNieUAuW30e/wD1PbpXTY6wv17oCej5iQlezfguW4/LtGQGz8NLD2A8xtVJ7qbFmMsIZjnI1kTi/ZDvLRzbxCWQsXYjsHRexrerkfXLjz5jaILxNoiuGi3ugKdcHQqVZNh2/ZoIcPA8rBI+soICoxEbzhZkSZETGHuHmgrusS3E+uxBdSYxnetZaIMxwzTWtal3aHnUQcUmmblzsxA9NlppVnRwlIgyhjhzATTVn2eLYuz3VESVNtmc5DnX+YmatlNrTak+QbYmkeAg70Al7n8WZmgmSgEv89KZkoYRhByLlEpaLuwE+HqV9BmjXSMfl+dohiLLoTH7ZvdWV2UESQpQKVtivQodHXvgCqtaG2EdKXgOmgRFNro2f+WxXSGWl2GT/3mEIMJu/jh7faWSoB5S2FLdj3lCGGmjFh1fNhTA6mmVHtAdwrHhbgBKTLYTQ6Fnh/452gwfXLOgtItmkSdKJOhiwjoJb68HB++Zgb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2dFI+OvYKoH+rpSE3sAFBnEFGYGRaUM66vANePNpTgpA9QAc4Diw5eR1Ieu2?=
 =?us-ascii?Q?WAFhTrJ1ypx4rmjqLPkm0XpI5FDkLLyGEgFNRbZi3SrOyfk6rRxylst0DMQ1?=
 =?us-ascii?Q?Toiem1/dcBX5dvk7i0jDfdnSDM34Ue5wkV59PIGKBVVFfEV0+vgolqiSirrk?=
 =?us-ascii?Q?q8cnDmKGsRN/DheMqGvzoD4Xfm5ffaCSpJyYfOsTbk2hN6cIDSk0z+3EMcsC?=
 =?us-ascii?Q?BYMHaV0QxdUfXAzmINSD2raZwl2OFqRfaD5lNa0g7jUi+DVSzI3GGCYXlHt6?=
 =?us-ascii?Q?1QrQmTGnCABh5CJw0LLUBF7IW7kM0F02toa9qLB7CtQ1xk7tobevgF1YqrV4?=
 =?us-ascii?Q?vSmsw0NuWCZPOdKuQ4kztGc7zASkfx/NzxighxbG7kAHP6AIJqnEZmtUViww?=
 =?us-ascii?Q?2WYfk0DBoBFYusoo27t2XXh+GGQruwmYe63KJ7u4G1oY0WIeDhUfmAPpoAVx?=
 =?us-ascii?Q?JQ5pjJrJhOl8FUl5q/xj7JP5x4oRt7cNv9ZPLeqkzGQdea783LPUHPIFzAlm?=
 =?us-ascii?Q?JZLNjqnjyMkq2eU4HekttUMMT+ayh9G4GO4GnEucGWvLOpcnoNe1zIE6/oXb?=
 =?us-ascii?Q?hWbz1HKgboRW3F08v91JhobIG9F3+lvwy0Rx5sxzRnPbIU3r8o1CGCVoTVia?=
 =?us-ascii?Q?ny3vkyj6+AdUJAUulbfyKGwkxtSxUqLVKwmXncFNWkuev1EoEf33DazxKKzM?=
 =?us-ascii?Q?4wkn2bAkDSxWsuzQAoRkKzGj7C0qvXN5H4W42QNRWXGw82TJ320/XTgniubb?=
 =?us-ascii?Q?t4oaD2zn15PW/xEU5Fo6kQPfKJQ1L8JLS09XZ1phPP/aKvaoQE/rm1sJs0VL?=
 =?us-ascii?Q?zAtU8se0nYaGtyHx9R3fO5nb0n/Xw1w6tUre1SiipAtqAU2tsbHVlgj7RLZv?=
 =?us-ascii?Q?1vFdH3nHLkF+Hb+NY3B5BjTYr8AwPgND/7m7qzO21UCCDyPJ7zYfNpMl6XyB?=
 =?us-ascii?Q?nwOfQ/rDABqW3nUwK/ZoZhBJYey0FkdkJmwO1wfIlgT0Zg/yJFppEJU/ToA2?=
 =?us-ascii?Q?ZdSgZhwpZVuflcq50d3+LLGTT2VG0p89XZvBGUkEsj/MRV1Zr3I3tGZLQQxx?=
 =?us-ascii?Q?2cbXL/+j/pMZ4pkr6zkInabkKPb38nI2KGLUyWiPRbHYku0Gfnx/mJx2fpOE?=
 =?us-ascii?Q?UezByMO0eXTfaWqZiNal1lPTALia3YdgoZa1rK1RxV81HZL9F2ZLgzJh9dnw?=
 =?us-ascii?Q?gzfVQ4Na8djei84xN6TW4gVD0HCp/q6FSuJ/u6Ab+dRZ6dK6y998PSCKWiaX?=
 =?us-ascii?Q?I6W7nxZFAEwDCxXIuc99L98K1nVUg1g05tH/jpg0M2tEBlm8vXosQoT+VFmR?=
 =?us-ascii?Q?54QS62uAX8wxnamxeN59x4UzYN4SMhNugDlRESQieMERRIzcuE5yDSV5kXR5?=
 =?us-ascii?Q?4sZr08Dkp6XcrW9usAzA06fGOiZFLzFxtszZ3RK+eKXNidyVqZ3ybIWpNZC3?=
 =?us-ascii?Q?9d3D+YsL85GEYDx8Nehn6tH6uBaI+yeF8s4LAkNnVXJe1huEguxFZDhX2VuY?=
 =?us-ascii?Q?7gPMCajLWMB51QEMEXY15LBGgD8xVh5edKvSRdGYkFAo7nf+2D2MILO/dfN8?=
 =?us-ascii?Q?s5tklllZR7wAIzV62/Xg5LqbGR15679BUqyYIO1tb2KseJxwJikoeYi0hM+B?=
 =?us-ascii?Q?bmR+p/zheiGpZPHOewZ4NsA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0f66c0-b169-43ee-5cce-08dc1ba6f14b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:05:00.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pg0rreJ8RBEooRzVCs01T3CRDu2PloRTRjlEcKwfLSFMX5EUpGw2WwZsYE+43PJAAyUKco7e+YfLR7vx61shAa+g0NrmITd5L3XKeWQo32TH0cnknVa/xmkCn1DmtsLb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

Now we can use of_graph_get_next_port() for port parsing.
Use it on omapfb.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 48 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  8 ++--
 include/video/omapfb_dss.h                    |  4 --
 3 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index fe6c72d03216..321ae18f2747 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,52 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev)
-{
-	struct device_node *port = NULL;
-
-	if (!parent)
-		return NULL;
-
-	if (!prev) {
-		struct device_node *ports;
-		/*
-		 * It's the first call, we have to find a port subnode
-		 * within this node or within an optional 'ports' node.
-		 */
-		ports = of_get_child_by_name(parent, "ports");
-		if (ports)
-			parent = ports;
-
-		port = of_get_child_by_name(parent, "port");
-
-		/* release the 'ports' node */
-		of_node_put(ports);
-	} else {
-		struct device_node *ports;
-
-		ports = of_get_parent(prev);
-		if (!ports)
-			return NULL;
-
-		do {
-			port = of_get_next_child(ports, prev);
-			if (!port) {
-				of_node_put(ports);
-				return NULL;
-			}
-			prev = port;
-		} while (!of_node_name_eq(port, "port"));
-
-		of_node_put(ports);
-	}
-
-	return port;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
-
 struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev)
@@ -122,7 +76,7 @@ omapdss_of_get_first_endpoint(const struct device_node *parent)
 {
 	struct device_node *port, *ep;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 
 	if (!port)
 		return NULL;
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index d814e4baa4b3..cbcc10af29b6 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -922,7 +922,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return 0;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -953,7 +953,7 @@ static int dss_init_ports(struct platform_device *pdev)
 			break;
 		}
 	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+		 (port = of_graph_get_next_port(parent, port)) != NULL);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -969,7 +969,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +1000,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 		default:
 			break;
 		}
-	} while ((port = omapdss_of_get_next_port(parent, port)) != NULL);
+	} while ((port = of_graph_get_next_port(parent, port)) != NULL);
 }
 
 static int dss_video_pll_probe(struct platform_device *pdev)
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index e8eaac2cb7b8..426d12881132 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,10 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_port(const struct device_node *parent,
-			 struct device_node *prev);
-
 struct device_node *
 omapdss_of_get_next_endpoint(const struct device_node *parent,
 			     struct device_node *prev);
-- 
2.25.1


