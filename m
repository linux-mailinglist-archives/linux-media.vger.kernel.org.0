Return-Path: <linux-media+bounces-4310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E483FB5A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23CBF1C21C86
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EF7C2D6;
	Mon, 29 Jan 2024 00:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DB2ioQQz"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CEA9460;
	Mon, 29 Jan 2024 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489726; cv=fail; b=hmq/wqSWl5wJiAa8jNXqSCTp/jrvb/bQ9pL4xTuV3YB41p9UC+oTMq+eu3Mk2YeVkpuGf43Zrk0uKJ0dD+ftr9/hFxEKLknHWoa7zkFfX7jkP6xMmoDH2bQdX8Bd3DJT6mkGUjYQadXBOsu1cbyL5G5/D+znZcvqaSrkf/sr+f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489726; c=relaxed/simple;
	bh=tynbqH5KYpLUg6XYTK9TNh3jy6TatTHv8KxXvkIsYI8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mP7+9SM/iyzwAV1ptlfDsg7sgveML1mVFfHV7hNWACaPmqsdsA+ETcSAnN6d4GacFCNrxjssnbHkjMPPPe0F7YGNLYAbi8JGvWw/SMNbq5PFO5bQztZrUQVBxK80IQQWJfP4FUneF/J0JGBf3y0ZdyZWonQxigxTZQr3s31CYpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DB2ioQQz; arc=fail smtp.client-ip=40.107.114.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNxog7pJRR/Tf/PRM2/xMM+ECmF2Dbl9k7/Y6Lf83wMR2dad/+ZjFUE0UG24Wc8PhJnDLAwarGoscmTXQpmzuHL0fYdS2vpY5+ciK4gUqN3e78agyDo7Lw1za0ZvzuHosk203eUvP9dKPPHUFJH9dxUPBbsgVvLktYIVn/+rO3GqiLYEgb0QNe82VOIT1QZLjbj/es31Td+cmeAfQru4/OOGmP4H+9wdxcKthiWe+DY+07qH7hbrjBqqV59TOLcimu9/LjveXQwRuHup/gbADyoC6U7eCua5iAJqUqtx8ONGsWBvzKzMRkpC6O2Yn+zGFiDfB0kBtf8LhW81RuG/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpk68IL/BvflDbGBACJ5GaP7BhSLRxtc71o9QOSAGOk=;
 b=cTOfODYpM87Guz6F7GZc1aiIpcadKbsDwIZ/C4aao7roRLp+zo79ZX7hLxdB/8qowhbZQvnzp7B2HNp2+6ZI2POEyemWnAlymOOgMA7L+YABVh9Daddsc6qfxo1nre+s02xzt+oO2fesHNYPY9ThuvcrluJezNHG1fSzYcHUwTMMjZPdbtFjRBgUt5cCY+jG99u+DowQwYfcZBnJU4kM1ji3J7VKEW7XBXAC1c23NRkc11AuE4yDkVpv/X0Y+0GVKHtAq/wgjSMdVlq81kaRYcK7OSI6I0QIg5sRaTYXKgepO1/wBVGUJtRYgUfgrP+y86hzRWBUsjJt7JyZQYYLZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpk68IL/BvflDbGBACJ5GaP7BhSLRxtc71o9QOSAGOk=;
 b=DB2ioQQzTjiv8vZtFuPIWmSiBiPVR3Zn8MAouUFTz53ebi0jA+2g4+YxIU2vlszv/KjEmwjVUHNAjyyTTDJ14vrNBfx5+C8bMgJmFQETv2EK2av3cS1cHfe0GIcWOjr2wV/zXhHMV5hqX1EQGOv2sQ3w6wa1qM8BNfwj7ZPSmI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:22 +0000
Message-ID: <875xzdklfq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/13] ASoC: audio-graph-card2: use of_graph_get_next_port()
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
Date: Mon, 29 Jan 2024 00:55:21 +0000
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: c14da518-c333-4f48-7855-08dc2064f888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZjqiPdcfJWhOLGQqO/1oDbfV4D6p4XOPzBROMykKLHcnWeHF2X3Q1TdD7Yv2PpPqZT5Zeh3slE+OIe76UL9nT+w6pzPU91gdTXqepYru/KhjwwG7he1OYNvOKrlpXR25JD9BTcYilZUTnuOURp0ornXvDpNW5rqcCBjz4lA2pWPzmAGCArHPsO5LlOiamWOQNgiDeEwDrg3Qa8oLf/Rju6jiTQc23GAm4MFavzV2/9+OKTUZPaqiUuFJDPemrsgB8zlMR3f3P8C9MWq7C/HFVUvJxvW6uL7+rFx/uSD0zORPjmTiLYCfWZE1+v3tK+dY/pNtpcsyiYJmvmXTv+mNTtbDXGuEgYEbGSpdLLNMfHHcpJ7Vmb4z2KX0XS74kp6IQbZd3fUynZgBfkPJqHMyK1ahbVfXtktOM4M6xOFfmngZn6RtiVND1uk7W8J2zII9l2tSmmRUfZESBcMC2W4xR3VJP0AKfD6Xm2LuWIYzckZO0DiSLQU3JMaD1xJikPEzEZiiVP2qwhTo17AfH/kZYTPZ6EldJHN7wwoso89V9K+5uvCh5Q3rKHoi5JAnogeUvJ2bYiDJX0kw29ODPO35aHs0VECwa1dK/IVLnM2dM2iraip8jXUuKEjwMnZkGlNV/MaT5paV/E/A078VFwr44YrBQTkwq03gHMMcufR+sU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y5ypzHls831jW8Fy/x+/h3rwpOKFUhLemqdgPlBRcj7MLC4hkb5OtOVXtW1l?=
 =?us-ascii?Q?CVwgQy/dAr0w+rstpvanqYOa9ZBcZPQ2Gv8lZ4wwQ/q2BgOaVAegdYLtxbHv?=
 =?us-ascii?Q?GySRK+3kYGy7K0ja+5fmjkzC93Pe8ziiicizEaz00UJkgZNnbMpIpvplz2UB?=
 =?us-ascii?Q?1jNb33u+fBhhlYnsB1LlgZK+ZVwU2oy8MQF74GVf5TYQrUS9zJBGCbOT9jsl?=
 =?us-ascii?Q?V7SQE7a0ZzHC8e88DLRvbtcUYbCIdIbyzbtquK59X6UVVZvx72IIJNrN+W0L?=
 =?us-ascii?Q?Mz+pcP5swp5/MsUwxZCwhWMKyOpEkNCq8cABH95BL5T6qTKUqYIfQ2M4JoNb?=
 =?us-ascii?Q?2nUM+E+2hO/CCF0NPKBM4Nw1dxTU8lf9zzarfYioybWbyk7rH6oe1G5f1b10?=
 =?us-ascii?Q?FUzOBlCMcgcP9rbzCYBQGOjPmRh/rCMJy8FXhTqRj+ZauoROAIjIvcT/PouR?=
 =?us-ascii?Q?UEcVkwCewTPVTFIDlNzQ3ogZsw7D/qcYYhvlTNoAebpOlHrjQyIxeftaB2Uj?=
 =?us-ascii?Q?Ief3GPZ1amYVFznEiLqYTUz+qXrymqGrxv2hJZ1ICs8i+1XFze/wO4WVQJny?=
 =?us-ascii?Q?ggHm+HDn5C67H47nvRLDmwWnoOzgV9kYWoUZXgVxqo5YnnMSTXOsbM+E5gBN?=
 =?us-ascii?Q?9q8VhNV0xEG8/35LOh2+C62kXDuI8txcVU4sf4JYpaPvKMcumT+T7vynmnSJ?=
 =?us-ascii?Q?L4E8bJEWWdAzVbzt1QW5nJ0IhSZIIt4D4jaChVuocRO0o42LbmH3ZBdmK1X9?=
 =?us-ascii?Q?dW1QXAVfXPXHqczsb54PyBVlP6AUYOr5cSWL51DJ4aYEoh7CjDVK5gvUqH65?=
 =?us-ascii?Q?XInctDwiMgXWOUIIdNkHKIEyIOrHcmHSTL2vqLhVkNpmixltv3HFialWwgzt?=
 =?us-ascii?Q?iFsYSh4OmEaMkY9PrFb7M8QkoxayYiAeGRUbG7DIDKrUmpu3pWK8JERiZVVA?=
 =?us-ascii?Q?DIK4m99egWO4AFn7PWAot2hMu//43G4t7XLTyOGM6ex0qV1F/ak4sjRLh8tl?=
 =?us-ascii?Q?NXcqjRKwl/L/c0XYtI2egjdm5Ttc+3P+847WwsJnoiBzRJcOe2FwFsW5zqhC?=
 =?us-ascii?Q?xJ6R3/JkoQwrnD/qpk2lmRE531voXZ1HaoGOBBfd1QVTQN1quHVN0XuwNLzc?=
 =?us-ascii?Q?YNqjmt++Jl0jxw9yhCvNabs90O/lwfXKjbH39yWGbNp+kh2xbwkATGFCoBlr?=
 =?us-ascii?Q?iCsIdJWxRUw2ozaNi0sSKOPV0/ZQ4qCNjbVPtikhT3XnuE6qZ1vYnn1mjQXx?=
 =?us-ascii?Q?0PobxmXpPvZR78/4OwVM7z7f/veO6FRxrSj5aUDwfGqygBkdLeTTGIn29s03?=
 =?us-ascii?Q?/ZcPBeZSg0RuFCoyfLrTzHLBeAtiST8/trH7oXrRUeMVSKsfi++/f2KC8ea0?=
 =?us-ascii?Q?SSk/q9mWwdsCycK/GK4tENtL/pInIbzyfX+BgSaoHLWJTdggmGpvoOIxGjNM?=
 =?us-ascii?Q?+BewNe9V8ma2YlvTcZ6eE9gpwYbhOsVt6HkEc7r0Zo7HakvFUdPvkAELN3c3?=
 =?us-ascii?Q?/TDt1N50QuQQKc/Z/+tH5BK58s90i+q7k8i0dHSZgfsVsb3F1f79X1Q5jNIV?=
 =?us-ascii?Q?iJoXW1V9hr6jFdGcqfnCFTp0cGGHJfXHfcNlxOFGEnR4+lkrWFtK5uBq6op+?=
 =?us-ascii?Q?8zUjDQnBAsdrECxyGOfz570=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14da518-c333-4f48-7855-08dc2064f888
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:21.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0L84oiVTvngAOn+BansiKXFhAzT122c6s+0j40IEclGXGtf7FPSbewF9+Rm+BHXM5o3RRtypCrFtTVscsLJtlTDAJFTmxOA/HKZwOX3KHBD9tBQT3rYxOmMTPnXU6iMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996

Now we can use of_graph_get_next_port() for port parsing.
Use it on audio-graph-card2 driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 29 ++++++++-------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 62606e20be9a..59a5db12bb5c 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -339,12 +339,7 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 *	port@1 { rep1 };
 	 * };
 	 */
-	do {
-		*port = of_get_next_child(ports, *port);
-		if (!*port)
-			break;
-	} while (!of_node_name_eq(*port, "port"));
-
+	*port = of_graph_get_next_port(ports, *port);
 	if (*port) {
 		ep  = port_to_endpoint(*port);
 		rep = of_graph_get_remote_endpoint(ep);
@@ -539,7 +534,8 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 */
 	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
 	struct device_node *mcpu_ep_n		= mcpu_ep;
-	struct device_node *mcpu_port_top	= of_get_next_child(of_get_parent(mcpu_port), NULL);
+	struct device_node *mcpu_ports		= of_get_parent(mcpu_port);
+	struct device_node *mcpu_port_top	= of_graph_get_next_port(mcpu_ports, NULL);
 	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
 	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
 	struct device_node *mcodec_port_top	= of_get_parent(mcodec_ep_top);
@@ -572,12 +568,12 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 			goto mcpu_err;
 
 		codec_idx = 0;
-		mcodec_port_i = of_get_next_child(mcodec_ports, NULL);
+		mcodec_port_i = of_graph_get_next_port(mcodec_ports, NULL);
 		while (1) {
 			if (codec_idx > dai_link->num_codecs)
 				goto mcodec_err;
 
-			mcodec_port_i = of_get_next_child(mcodec_ports, mcodec_port_i);
+			mcodec_port_i = of_graph_get_next_port(mcodec_ports, mcodec_port_i);
 
 			if (!mcodec_port_i)
 				goto mcodec_err;
@@ -967,7 +963,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	of_node_get(lnk);
 	port0 = lnk;
 	ports = of_get_parent(port0);
-	port1 = of_get_next_child(ports, lnk);
+	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1099,21 +1095,12 @@ static int graph_counter(struct device_node *lnk)
 	 */
 	if (graph_lnk_is_multi(lnk)) {
 		struct device_node *ports = of_get_parent(lnk);
-		struct device_node *port = NULL;
-		int cnt = 0;
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.
 		 * We can't use of_graph_get_endpoint_count() here
 		 */
-		while(1) {
-			port = of_get_next_child(ports, port);
-			if (!port)
-				break;
-			cnt++;
-		}
-
-		return cnt - 1;
+		return of_graph_get_port_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
@@ -1197,7 +1184,7 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 {
 	struct device_node *ports = of_get_parent(lnk);
 	struct device_node *port0 = lnk;
-	struct device_node *port1 = of_get_next_child(ports, lnk);
+	struct device_node *port1 = of_graph_get_next_port(ports, port0);
 	struct device_node *ep0 = port_to_endpoint(port0);
 	struct device_node *ep1 = port_to_endpoint(port1);
 	struct device_node *codec0 = of_graph_get_remote_port(ep0);
-- 
2.25.1


