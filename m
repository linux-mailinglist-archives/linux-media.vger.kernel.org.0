Return-Path: <linux-media+bounces-4057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E828378E3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4C11F26057
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CF4144629;
	Tue, 23 Jan 2024 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gw2xyP3J"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C493C29;
	Tue, 23 Jan 2024 00:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968279; cv=fail; b=HUpZzfi7wAn2Z49XmcgsdWO55blq8QNtT74RDYzo0b/XteVAGZKWoc1P9s0rERJLYBA150oGCbckmcPGFQ+7QG/YuQWPs3GRPMTcluG+NODFrA5jDc6FNK2U4UnDtSp69/zYaReO4TnanvCewFm8YbUMcmpjFazhkPOYeu3790k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968279; c=relaxed/simple;
	bh=tynbqH5KYpLUg6XYTK9TNh3jy6TatTHv8KxXvkIsYI8=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=q9MDsuNMRVzTuqYXnVhXe1XvN340720HBWX5RdJ7wmLH33td7ZDLF7vD3owkcqhy9aLUMJlECQpQfnTmgR1cplc+8NWYeVfPTcWojEaQUkMQoPyWigjLeI/csnHsnPEeg42/x/tamqTwyANxFsUMwYGKRzPB+pbjpvY6O+xG4V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gw2xyP3J; arc=fail smtp.client-ip=40.107.113.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B38zfUJODslL2RkWKfwoFjkgRp+zxjwsFuLEZSg15bdd4EkERlFKE1cMyuGqGMolqE9eN7YXefIcl5SkExu6iSbHfkP+rUM8bM/OyDheCPXpIVLQ1ro91j/QlZv2iK/WFS9oN65KxJEXqv9Ii9vW7+ZzRHiG1wDa3UeXe2AFTWQ6YaoHrFGE87iWbS26i218jQJVlAnKd3EMV9D6onUw+VODTnVSs3lzqdmnNQmMNzW4KbeAwClBDQrmD+DmvdKLj52XWbiTGKsNMHbi7njQAQ/wPjAEhcRTDn9/8c6jO7UajgWM/Bt4spao6aWXDW3PXpUfjzOB/UuazHBwvOw/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpk68IL/BvflDbGBACJ5GaP7BhSLRxtc71o9QOSAGOk=;
 b=KFdrzG2Nu7mSitTmh1tMYbdM8kDV9SrZ5M6qlRectP19OODcsRa3Y6LFXXbMW95XkHYz9T98+/l4nWYJwtfCg8XDbOqaEz+ey/FWFjGJBEhJXhKyg12q0O94Xe9zn+LEOwp1Q5N+nF+KQs8NQLbzcRh7YxHgUKz7iLmpByinSyuGdLsTtajyADdBb5vQX4INy+ZT1QE0fW8fpTmW4qnPWLc15ozC0IMwGtAxm+yb1CPK5wnnGPBS6jDHGHei5oF/I/hE0SpdIhL1NlWEOsSJVmfUeVrZQmO8wm9Dcu5o3SAvDuTpR/9M7b486fi0/FbtPvmEGRe6S8u+DGjCww88jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpk68IL/BvflDbGBACJ5GaP7BhSLRxtc71o9QOSAGOk=;
 b=gw2xyP3JrwRC+2syp6z1UFm9Gx3wrX/NvZZTHlhx8dO6Dd3hWoRDjsdWclPmBsLSytdPhl9/scYene26nYlrNBVR0sRyjc2blpiU7bBzMchTTBaaCXj1/6P8qs7FBPRxdkMmEomfCdxUXpb9ijZi+swDZU7HfLPz535c+8s2OKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:33 +0000
Message-ID: <87a5owud7z.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 07/13] ASoC: audio-graph-card2: use of_graph_get_next_port()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:32 +0000
X-ClientProxiedBy: TYCP286CA0139.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbdae83-6548-425f-170e-08dc1ba6e0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DacMYK2p2ve2d1Cur6hh9YOzriZFwPztcK+SF25Hpwgm8iP+u61GBeD6HxYFxKuzbrT6fY1LtCkxfTdF+OZsjZQnBxGnJJubPUWwjtWgbeXarYVn8cXb1mBsGDJdUFlP88Qdw4IApyoMtQNR/gpu9a+QYTEbFHzflyCGQQg61BWl3NDRXUiPH8pwpoQ1M2kygO91MtA2xUPSPsDGNDlpAIzoEVvKvzZpQtR/9aqYlEV4wX8sfHNAuzzye511WUQZv7SvcwuPKdWn38rQRry3w9LYxeocxL3qXz9CJ3tYb+msL9zCBYGRtl04Gkgzr8oUrd8cKJZYhg315BILG28oh6Ct6xl1t0MFj8nCBZmLJHAbCykyFxYi7S+03tmoxxU62HF5p44YjLDntvXbGKnCwgQWvNbU0USmA5M9afp/A1ZoS3ssF99KOY1NuMMdaz+2KK1hNKZh7bAoiZqeabZ80xuAsa+Hc7H67zwguCCNedp/lBZmuaYucgDJ5pHf8X9VcCITLF0BEPo8E9uj3U9sPNzDSBgzXewH5eTcnvAEtDdTQDIzV2li1/d5z0amT7H09QUGiEwN2SJqo+2CqYbQEMBQEJaJ1PZwP9Smw4oxPW4qgdGlqYNnhb1DIZMNJPY809YVsO0PrhnKMur+YN4hiKbAdkxQmYAKv0+iavRNt4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(2013699003)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gq6WBlFwn0xS9keYnnexpSMPaF2AIToPxGiF6IGW4x1NwmkAtNWc2Ac2H4Zq?=
 =?us-ascii?Q?LNs1lZvsCwx6t662iTDTPCHcCQk6ucITC7tV8QG3QywXQHLMw/PoFWiBGLZR?=
 =?us-ascii?Q?y4ELjh33T2tdOfk82h2/ZxrnpxdxYtSnJ+9fo2Qr6shvsRzNgspjN2+vzUlN?=
 =?us-ascii?Q?wGIEV6SdrP6PnjsDV4UMvmvmnnmq1S0OEO3HorekuqB/jDlNoWGe36sjJi/O?=
 =?us-ascii?Q?aaRR/8RTxNRJhkh3EAErh6tmpsAbUHfgXkAlT/flpWNUNEPljPN+ssz1Vlmu?=
 =?us-ascii?Q?p+wx7/THI3XhuFHHnHUsAGyv20N3XoMf7JyrGMQJ/haEW7pbz9QqAmUqFISG?=
 =?us-ascii?Q?0+7tgOuskchW3oh95CKTQSya8/YRilrTCjOvFMcX3A9Mjg5fzs6BCXIS9Tf3?=
 =?us-ascii?Q?MOMlzBW4PVeyB2WU75ys3AhvXGAWdLKab9Wv2AQ1SMVmfX7Y+/VLtgKUs6iV?=
 =?us-ascii?Q?w/l3+jiODL9vhxrus5S6pGSQl4FMOVkUhW4zUSNB1iyISwv3Y8lU7+ZQ1n6O?=
 =?us-ascii?Q?N+HisSar6EAanyMrTNQaCYLEZDXwhIZPViNKlZYWQnEmpPOlo+kVQwUxteWT?=
 =?us-ascii?Q?vNgOYOnmdHsymeTcCRKPmZZWzIcc5uTVkikEU06T6o9S43U7dcww8ceK9Hdl?=
 =?us-ascii?Q?GuyZrgrDqmmteZx9dluPDNczx+8C3zO+BH8usOvhO5xPucgW9tuv3hki4cUc?=
 =?us-ascii?Q?JK5Gh7sj2VqX2/hs9tVPNiJAz0J8GTMXGpAnc5/js89ILZbQYFkBxoj4LdqV?=
 =?us-ascii?Q?4kLBXQ1oFRIB6GrR2uypnmjxBKOlifMRnGfExImWHknUCd9XPy8m3Y17JUHL?=
 =?us-ascii?Q?BydJQbW/Ks0oVghTcfP84U8bR0WAk8Y9JBIyF6fK+uFpIJA6hg1l9OrS2WK5?=
 =?us-ascii?Q?acsNi65gHVKZJZTMUSy8kO2KO/NDBJ4JP23ce+gVwHXpjEFqkf/dCYg/iutk?=
 =?us-ascii?Q?2Ly+MDxB9ODOf5DxrQoCyEuj4S3RjnqHFwPcdurJsvOMusIzVzYHtmYvdToP?=
 =?us-ascii?Q?Yy2axwLLysWnxHsT8qzDeirYUwmaXWzqVxydv5IqXqZ/YurSeH+o9QZW6y5p?=
 =?us-ascii?Q?uaLWFnZew2A0zGsFSfcdSZ0G5BlOkAIQ2k8I1ii7QwHvgO05TLJqdNTzpRzo?=
 =?us-ascii?Q?/z4YD7eUGvtAJEXdkmgB+PKTJG6cTT1V5gbK+5U+JhVdmVA6xXGjjbTGLTIw?=
 =?us-ascii?Q?+JXBcqcC5ENzPYeLBb900djT+WvFr7kCi1j5YUAl5mHYkwCkmbUzZVIawfmx?=
 =?us-ascii?Q?MeJLOiGBf2xyoz1RYvhXX8K5vtkiHyb/xXswes0Aeb9nlBRgmkMOgirfYbkv?=
 =?us-ascii?Q?5NphUrmRAxPdtDpY8la5/SWJwZdIIHoS9IvClKCQLrlbhTWlxucZpvUPJefX?=
 =?us-ascii?Q?ZWtSgpCicOkmvnkSHRvEogfnbYKxgIebf10csYzynIU3xpcACgeajpqFFBhx?=
 =?us-ascii?Q?vOI94KYqlJHHf9MmkT12qvbz89mBHQPvwqAcEDAt+DJO9JyRDHw7eBIRV31Z?=
 =?us-ascii?Q?mB7Ue2Q4MM7QUeAqv3oNS728sVvQm7qbo4qKPxtBXFyFHpySAeDIB5MdPshM?=
 =?us-ascii?Q?EgaU9zNtLCzIMcWXsqLF45TyOHHBIQF0kqzesO0gKuypb3oONXvb2zH1kJTf?=
 =?us-ascii?Q?z33CF4V3WiwxXXk8t6lKWks=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbdae83-6548-425f-170e-08dc1ba6e0cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:33.0721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loQp43bkzH8f5gEWNOQNKW5ymUm9fP7L99ziqH8co3/36Tkfn5KjEBQpHmJeufknqP2AJLsIgkWR6fnxsl+2HcK8+byTIEbQdPXI+Xnpm5CujLyOz/+9LR7GdAybEjmx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

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


