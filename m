Return-Path: <linux-media+bounces-4050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2718378B2
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF4F28C99D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AE817E8;
	Tue, 23 Jan 2024 00:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aVWtJ99k"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C17E9;
	Tue, 23 Jan 2024 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968204; cv=fail; b=olTvt1YakIV7lBWhxkd9inMyAtPXO54RmsHpz3SoF8VA99aca7sv2L6wK0ohbq/7KhYkHVDzpN3wd5/DNh9Vt2S0NJmzdbuWozFelwmMpvSOqId0rE2cvXVtsgtQektmW691KY7877ZmRFthc6M1Rkpna/jT6yTISJ0M6NQm/pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968204; c=relaxed/simple;
	bh=AWlPsis86sut0v8jaAJ8OMCmJRsYem1f7SUYftT1XSE=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=ujY9GKjt4ubQOvxpuzwMC5LBymW8lMS0Huj9rce/I3t34ZJ52ygitd2xMoQ8b8G2FPn6cpWro/S45Y1nJ3X0NBVsX+VBLmcHSyaHyXhB5AlsFvDz8MJ+kOd29DvYNG7sR1Y+xayfSYjUCg1eXAuTYowVtIahCAhmLG7vOMoDPp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aVWtJ99k; arc=fail smtp.client-ip=40.107.113.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P14iL2nks+WJxqU7+C8jOzjC1GfhWyMa4AYP316bcQlPCrsWVq6b4b2jiyTJVpfFfL0r0rQQ+xugrtVuTlMf6DtIsmRpcrc/33w38lKatZbZN3WYY4C6PV4DDPKA91EHnricnZRe4ZzNYPqDkOSu3w+FLd76Ogwx2wkfdfLq4Xq/KONVS9t8DwCH17ZRiEBdUt+u2a3njk1/PTz8/IkcHrrgNPZ5G/TD9cHtkdj52clt7vDkKfgjXDPSSH/OipJ/FRqx3T/vkgJiqgrzvMvqTajVmbGzisrjiOScHNJH7dUm6B1F4fefyUAYUF5bjtsnw0jY8B/euQXZ7r2XG9XAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Vy4mrzmgrIKlrR4afwyTIpk1jDGLbWBYYAp4vUWyFM=;
 b=KSrguvSSblxLCK+nNk3vlHVz+xmQ44irtn5nDuO4LM/G2TEm0z/qXBVIrrxc9p7MHAQCk9wr5kFybZqOHXQ7UYDMQO9sz1AYgmTQsvB8JAXxXVt/Md3dGykM/ad/WKU1yNu2rw8eSFndVt6KYrwgOIRDu5QhINwNZHxi6Q1WGL5ZHpJvRV0zXr258LzZrwMOnTSEumoNEyGNe+IQU3D5LGDOyRve3z/XeRz0iVPyQygjlMNdoqaezhJWT4vNZuXp/QE6wKgm5/39Q9YdvTmIkc+zGtFblMQ52zcXd82Lt+pyPm1pW/srY6EDM1qjPjgg5k9UTszVk83Lbp3SFSHxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Vy4mrzmgrIKlrR4afwyTIpk1jDGLbWBYYAp4vUWyFM=;
 b=aVWtJ99kwaoMds5ChxYQ7RMZ8sQv8AZ3W2uwP5604OdJxqBayKMWx+kIcOwXZGrG4WGwX4jV42zuipaaRqjUXpWqi4lMWNTGfaqi7Kd7ARFYoTfPwn2Q9+UZgdCYpYonHLon+DviRG0NbzBelCvu3uippgkAZbgE+rAI4z7xTJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10899.jpnprd01.prod.outlook.com
 (2603:1096:400:320::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.15; Tue, 23 Jan
 2024 00:03:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:03:17 +0000
Message-ID: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, David
 Airlie <airlied@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Helge
 Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Rob
 Herring <robh+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH 00/13] of: property: add port base loop
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:03:17 +0000
X-ClientProxiedBy: TYCP301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a91ef51-fac0-4cf0-4ecb-08dc1ba6b3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dUUc0LjTjXrowKZuAQIynfucNvy/IpYGDrlS5+ZkdLDYX4jhcgRYyq0HGg5ax+Fs+Qnr7iC7EmKLl83FNWeKaZ4N7/2sdaGfICqkG5sfyVinR5Yl3zZCIT+dp9u+eEbIReNRxEwhsqRjXy0nfhBxgGmPO7Hwyr2Q0v811ZvRUmX1JfIx6E5KlWi5Rj0r9qdWlPSe91WYzs97Ja/kz3GocSlDMIddhtFXTwKRHlr0A13Sd1rwUT9WZTVHZNLOMTOMeDUZK5LKX8LLPxqvkQ8VW5dkATCYVkF9d3HWwdnJjcXyeA3ZD3MCVl3sX5AuSkKD5DdbijO8PSDpf9rZqRYuHzbF9orODUF+rL5fyyepUzwVZYBtpt1nUJgWVgNIFeVedOjQyH0dMD0iSNfBZoSmZz3CE357Lig2vonhoKUbB4VWHdBC478r6LLbfEK/+l5i+dhKl1TftUZ6Nl8Vu5PH9M1UfHnMYrfJnfc5/G7IGL7Ki+z2IsHDl/5LCXrKVKlfn24Uh5A5//MpdYqF+bE/JRd5m7HRsGHYCIGK1WWKdjKWohNOOSforav5dfSlpD9rMilz0tNZj0GbeNIlLb50mvr37qoRf9ZopAeHe6cmlNPVF2qDdXUs7bbaabLcwoX7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(83380400001)(8936002)(52116002)(316002)(66946007)(8676002)(2616005)(6512007)(4326008)(110136005)(478600001)(6486002)(2906002)(6506007)(66476007)(41300700001)(7416002)(5660300002)(38100700002)(921011)(36756003)(66556008)(86362001)(38350700005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zC6LkZZkcFsvBJus+D+hpKE/YVKXXTY150LFPUdWhdupi/O6memVKdjsXMW/?=
 =?us-ascii?Q?Xu/h2zPIcnvGOaQtQVTls32GT3N+QnNgbxJrQwBe6HrQKtknaEkLtHG4UJRY?=
 =?us-ascii?Q?80+I/XEpsbmHC0V6DzmxucEcrIRzuSe9tpb1RXR4SgxsOp3bL5hxbov0zuyx?=
 =?us-ascii?Q?4UDpnaAzo6PtZ/WtaW429VH6qbztwBUkuZuDodLI3MVMtNUy/rvq7RdP2tzJ?=
 =?us-ascii?Q?6eFLRxxy9YKuiRhBYjk1qNDvyOUw5f04hx+/wtMmYJPzBkGZXjx+lMshKNCV?=
 =?us-ascii?Q?/BbY6fg49SUED53h/qZ/+6riFwFr7zWCIdw90tulgujw2tPmJMt9FEHVBDly?=
 =?us-ascii?Q?JZ5vQMuZSiwHgqot95qWYGi1rOI2yeJqh8BErsGEW/Y3DwecVkCJFbm/mPkE?=
 =?us-ascii?Q?mu7eRhrlMr0FHfFfVsrxysKd4CveqHnw9m0N9XcQkc+K72cPAlYJSjgQ29OR?=
 =?us-ascii?Q?I94Jkfh9/MicwjwvAfMEOtL3Idklz6W+Ck+Yr8V7J5AqnFpUgATF0xkvjIRY?=
 =?us-ascii?Q?5moop5gvsDh6JKxNaTl7DZiZFyqi+aPMaZZ7GgydpjDJd2bpIaI2iH3iKKGS?=
 =?us-ascii?Q?vDIlp6bqus66fmwTuK90agkBcOPxExL/TnNvFgDIDmfzP3whnr8J9/CSCjgv?=
 =?us-ascii?Q?W3RTGoLLfp67Ftp+rcDVx4EuZYaG4TLheF+bzQygTKmPNgdzZK6UIiHA32Y9?=
 =?us-ascii?Q?gZtz3OPJ9iKOuufqpCvHOJmfgRj3YCm99R5BP54wey3wHg0tKelAG9kLSV+n?=
 =?us-ascii?Q?qDq+H4v94vLyeyjO3oRyB/cDa0W4cE4xgEhNtJuRFHKrgnmCHXiPZmJOlNmE?=
 =?us-ascii?Q?VRCq5vipxSKjA9NcV1RhTrJWGAAhIXOJV192g7odi88JnGN1DeKVFhJx6tqW?=
 =?us-ascii?Q?z9fdXpOrzWMybTNubean6sB1UoOGJhtYhpoO6IkpU8Nh4PTy198ZCDnkd9bt?=
 =?us-ascii?Q?n1lh2XfqkhprVgjUuBopJziDDPGj28QO4j04SutDgX/ylTtUqeG53/go+sTC?=
 =?us-ascii?Q?Mh2i39AUI86izUV8vtrFDNHFsBqEsywsvqPBH/H18/7uabAn7rjFfflAlSXY?=
 =?us-ascii?Q?fpTo+XwS3MgYNDmabVnlpzL4X8jnLWDip8epBqm9p2EyM83m7ujzvbG/jV5T?=
 =?us-ascii?Q?ban7La80NlxTJbjYqM9jiqbbs7/Y+d/QkG2Z8jqufqRmhvChJBAFp5JM578b?=
 =?us-ascii?Q?2KV3AgmQmgSG6kmeXVLxJUclUVPkMvRYVzgxQb4DumbY0MV6eCAyBxZnQOqk?=
 =?us-ascii?Q?H/7GioVjUaP9B0OUGV6CSLANaNjOZECvIxfEJbi3hH0oEdBFtnWEgweLCLQl?=
 =?us-ascii?Q?v0xFL7LE+bbbB3iYEa1t3nY2XA10jrwhrwUS14JksKUy7FN5m/bPcIV7cBPq?=
 =?us-ascii?Q?RdDdwAJ5o5AKhoTnvUXiox8nL90exqEbdHw+XVu73Y9vXZNAIyKHG6TtIcAY?=
 =?us-ascii?Q?Cqqh9PCyZGk4zqYnpM3WgQmChQ9ZUXGiRUWA/LmSjhlbkFH7Opd+h5UwpQTX?=
 =?us-ascii?Q?8P3wMOUonfuCcsqqSahqiYgHIKJRp+yQli+3+4puYg97Nk+MnpRepBsYWzFF?=
 =?us-ascii?Q?IeZrHVwODC5A1AYq3FeybRA6HN4PkwTn7paAaZMsiqKJAzR65RbZikjdiTJF?=
 =?us-ascii?Q?NLu7gOR69sDj6hz7sMArjpQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a91ef51-fac0-4cf0-4ecb-08dc1ba6b3e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:03:17.7885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4eaAdkTXd4Mdh6w+sjs5xumt4bLw0chvnrgB2jklacNHC047aRGWrsUQCCBfd79Cxuz95F7Np4c+Gsyw/c72CGywB7tDM6/sLj15Pq3P2Z99Bufb6KULyKxOFeu+jP1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10899


Hi Rob

We have endpoint base functions
	- of_graph_get_next_endpoint()
	- of_graph_get_endpoint_count()
	- for_each_endpoint_of_node()

But to handling "port" base things, it is not useful. We want to have
"port" base functions, too. This patch-set adds it.

Because current existing drivers couldn't use "port" base functions,
it were implemented in a different way. This patch-set doesn't try
to full-replace to avoid unknown bug, try easy / quick replace only
for now, but easy to know how "port" base functions are needed.

Because I can't test the driver which I can't use, non-ASoC drivers
needs Tested-by, Acked-by.

Kuninori Morimoto (13):
  of: property: add port base loop
  of: property: use of_graph_get_next_port() on of_graph_get_next_endpoint()
  of: property: add of_graph_get_next_endpoint_raw()
  drm: omapdrm: use of_graph_get_next_endpoint_raw()
  media: xilinx-tpg: use of_graph_get_next_endpoint_raw()
  ASoC: audio-graph-card.c: use of_graph_get_next_endpoint_raw()
  ASoC: audio-graph-card2: use of_graph_get_next_port()
  ASoC: audio-graph-card2.c: use of_graph_get_next_endpoint_raw()
  ASoC: test-component: use for_each_port_of_node()
  fbdev: omapfb: use of_graph_get_remote_port()
  fbdev: omapfb: use of_graph_get_next_port()
  fbdev: omapfb: use of_graph_get_next_endpoint_raw()
  fbdev: omapfb: use of_graph_get_next_endpoint()

 drivers/gpu/drm/omapdrm/dss/dpi.c             |   2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   2 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   2 +-
 drivers/of/property.c                         |  92 +++++++++++++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 101 +-----------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   8 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   2 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |   2 +-
 include/linux/of_graph.h                      |  23 ++++
 include/video/omapfb_dss.h                    |  11 --
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         |  31 ++----
 sound/soc/generic/test-component.c            |   2 +-
 17 files changed, 126 insertions(+), 162 deletions(-)

-- 
2.25.1


