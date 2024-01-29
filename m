Return-Path: <linux-media+bounces-4313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85A83FB64
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5261E283C9B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA1AD2E5;
	Mon, 29 Jan 2024 00:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O5HqOncI"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D304D502;
	Mon, 29 Jan 2024 00:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489740; cv=fail; b=SmWKY7s3p9pg77Hu3kv9HhKvX7GIo7bsUCxMFlHqyCDwxN0pba0sKcMKYvS71BzxvVeyDAyvYL3bn8pazhPUHt9Scur+EoHPsXv2WhupP5cPhDtKD8mC9zGmwf9jfk68oUC58AGpmu0ENWg/jKeAoudUafVGCqlz5QmWMT15ea8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489740; c=relaxed/simple;
	bh=LetAszaW4dFo7pIO2qLTEWoszjj1mQlZBYH1VKPluAI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OUfB4tyI1EbkKlYdXZBhpdhLr6gBJwLjXxdUKSgdvRm4YTbInTQMyFTFLTGSZYNFACyBkg/EN/e69C05+haisoaZVZh2uyXHNd8JsXT2m5vdcpxCshz0DFyOYpyKovb1CtZfnUNxcgSKQUUoyglQyellIOnHR4bCtyjSbgPPgb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O5HqOncI; arc=fail smtp.client-ip=40.107.114.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeMLVxPcWV2G4JGz0lZ2aeVxAThDFFSOzQQArxGH3mXHarA/mu0OlCgSK7EhejpJVDNy2He4zAqkAI+TV3ZMFoSLnfno3gchFqkSPRo5c+PZ2cNkyrfC7gAp30HeC4GbUYmvkdeZH7PeyHNmsDl7249vKL7gLnA/UyWH1t4rtguhSHf4QJe4eGSQj1mCA2wK2TwM6eC4T7C9Nfv10ED5dZCc22roJH2jwp3Zv7eSdCVdUzemwC4oxTxBJWnL4coss/FpQosaGW1jGaEIymyJSqXcj9Q81D6+uexqe5Xul5hRGwbhCWmn+GgD8OoHuoZ86TvqjPmS+6q3I35wIG9z7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8kkPI/MwcS8I3GYRXMHAPjRIL5uTgZdaY7byZyINHI=;
 b=fI7Jfx8vJBcyntUqRoD9XTHs4Lpl7SmSamxg9b6lRzt2vaC83Wy1WuxpKfJo2HQZnrZp7R13ZufoptAx5+yZXOD1LLp9Vjc86WRTZBIRfCNzLhjtlBvtM3JXmMKnURb4h15eF0ndrkPOy/s2z1Qoo0tHfhOKvh2OXYnDVqb75YMJy5aobkMlPU9fC07O+eeY/ivZM6eqPLomcB/Enas/SdDaHfdm4uAE8DYvjERl0ZkppR7M8b52KxMR6TyFDkBLtiEPBu3WKI7IGdJQCqdyYf2A07iiDtt0mhC06pcfPxeien/NP8ENkhgFFSMD+OAcu+Q+vZ3src4zoWIgriHT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8kkPI/MwcS8I3GYRXMHAPjRIL5uTgZdaY7byZyINHI=;
 b=O5HqOncI7WzWqUXYEiJDwgomA7hSOfXseOB6wIDUN17/yuIJs3c+YTOaSW6Q4VU+5ezKMb0cgAawGTuaH2Nf7qRB/i8oBBIt+BwbaGxDvxJz9ZO8ZH3VihdJHZuVvVqFw4293wfTdnA0zzKkp8/tWy+c1Or7iS54KoT8JxDRnxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9881.jpnprd01.prod.outlook.com
 (2603:1096:604:1e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:36 +0000
Message-ID: <871qa1klfc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/13] fbdev: omapfb: use of_graph_get_remote_port()
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
Date: Mon, 29 Jan 2024 00:55:35 +0000
X-ClientProxiedBy: TYAPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: 2358d8eb-01cd-488b-e34d-08dc2065010e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fqXEytYqwC/kswyx6dBvoa5zwyAk+OYPmLuBhPQzc2NUcs7CHIlUe1vQIBVD6/x8Z3BMYVYQsEb4Mn4kmL0+GljCujg38XVgdmgsAOpetLB12W1jGFfXgm03sZnCxxrnlsbabHAQd7U/13/qexnulNDQ8bkAxVjfpltmrYUPFEPaeB4X6ruc5V6Jkdgc0CS3dsdwOqNQsPZNQ6ragsxDuUBmgq66GwYEFPnP54zfz+SX3rUhHKfWvlmueJrCvgs/p3DjPMNAjrEVopICcnIb3FgMgytIel6vAuXOOZILLcuMGCE7A/76C7YYv3ve5orAPn+7MdPVEnUpdPwphnfcb4OWwKgK9DfNLWf3sRaf29Oza2q/eEsD5FDnMxP/T1gWnR9CVoUEeqYOWdPrFrpGNkf5/21A5bPEhVkMQdmg4TsTtiMX/HY4Me6HHpvQU759oju4SZeOZOKZ2Er2Q22IRM+R0Fc34wiCrCdtq3Ig+oSnLsLxUdW97jV2kSHA5xUlrzjWbB9Djiq/2WCxp8QyQVfZ6IBIySX1c0E1gRSI2ZIywZ3niUNvwayAl96pNnNlmrwyDD6LewBG9n8pY/qFfTqQE/Rc1ji61FpspjQ07aoMyrrrtygUN4yMxkEcxe2z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66556008)(8936002)(8676002)(4326008)(2906002)(7416002)(5660300002)(86362001)(110136005)(66946007)(66476007)(316002)(38350700005)(36756003)(38100700002)(52116002)(6506007)(6512007)(478600001)(6486002)(83380400001)(26005)(2616005)(41300700001)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V8WlN41A47MjAOpa86wWww0lGk8nohHlTB84kaBMWJeMhcESAX8ihR1bEI/h?=
 =?us-ascii?Q?6xTE5+7YOLlMZbL2tcdiw2HNQKH8j4mXIG8sGRrra9flPTp22GFD4qTkp5CP?=
 =?us-ascii?Q?CnI+CxTVC9QetEVMRJPKfF31NeZ3pO2SH7a0rd64PKxwZqDttYKjB8XewzSW?=
 =?us-ascii?Q?CNlzJCYBdpXeFn9IO7ZuNOzgeLkosesHsw2uPlbbfFyc51Ee68ECfKbwwaYv?=
 =?us-ascii?Q?I99NRSL37LVEJgfL9HdyhvtsNtj2nO4kai9WD/LMOIPN89KFA2cmIL6Z5eoi?=
 =?us-ascii?Q?4FBss/R23N0Zftbwxgl5muCUhwzwJHD/xUykKsTIEWl0H7S/X6kIp0v3Ignn?=
 =?us-ascii?Q?PltkviHFu0t385+6gvTyWYVsaNNPp61uSlPr4OorO165rCwEOWAMFCnAU54J?=
 =?us-ascii?Q?BrwtxYVyIGRDQt6bf+OF2cOqNrvG+1+M48MxaiVG7ePQ33yfbCcH0a407S7d?=
 =?us-ascii?Q?XHIaj478yycohkZAvM96zKBFiE+vh55zGBw8VpKT33ue0hXBU6iq/u2WWWYs?=
 =?us-ascii?Q?KioVglBg5cIqMslp6QqAbWMokFRY7xDfbNzK5rUEV3xPhLDoPwyhNuHu4JH2?=
 =?us-ascii?Q?TccgEK84IQTdmPEQebZDTfSCT15ETniPIc3PNNTe+cFQwo27Jrz5wb6c9jOs?=
 =?us-ascii?Q?YES2cg67N9EPBCacty1zbTOLxrV2odTa+uuWjlLkEHIP+uZrQ2ADIMLBohkx?=
 =?us-ascii?Q?XXm5S/ytXXjyPmbUezhRB48EggtHR1eaTtr0JOjzmgZ5tON0mccvahqo1CjW?=
 =?us-ascii?Q?sfKawnhmeUbeAd0JrPh8AG0ndw33zFjFQJTEheQKISsoZ9B3VOTZFXdfWAhC?=
 =?us-ascii?Q?1ellhsNetdo+CO0sJ4mAwFY14MFCnWJVH6vDiQMvo/MZHAMWAv56Pmnj8U+Z?=
 =?us-ascii?Q?Y9KNEE1HRwEADWKmGZiKaheS9Jo1N/jaUKBcUUn5JsKsyma1pxVvipzjq73r?=
 =?us-ascii?Q?RV8OsVV49W2B+tMgLNdaDxNWB15LAl9sU6YbmAt0v1yQmhE8L8SqUi6BGxgX?=
 =?us-ascii?Q?ONTMPoAJfd10srHYzO1eLPTAeRwgY5KMV5beNs8DV2JHbj3jVlKYr+1i+1j+?=
 =?us-ascii?Q?4aAmRF7GIwjkcoMTIzy2ZlU7VGuzeKEuQ38ThEHOXagyWzGm4CcYneVqqZ/l?=
 =?us-ascii?Q?au6rud8bvDLTtbAlxv4tdrNxgQkoSgQFYPW3LIFk09a7KK1U2+bxEGdQx91X?=
 =?us-ascii?Q?HfhR5bZelcNbbg54mszsxtDq1u1Dcis36pAdOXuWzHsTsI4oCfe7yrIIWA+4?=
 =?us-ascii?Q?iwbtl2hn2ozhC/hoKP9GlnsVPZ1NvpWeoNHCUfHnfHKIDajnMMgjodiprscY?=
 =?us-ascii?Q?sXqULL2KNKgVI05+2Ywd0g+hxRzUxoFbYZ/qRNnpPadaGgJLS+w9kIZsx5Be?=
 =?us-ascii?Q?H3EMmU+dcXXGNwrtoGAgQ9tYFJI8wKLpIFt+PyDv9bJM6st7TmvHH5YooUdc?=
 =?us-ascii?Q?SZiRoXuCx8c6MzWKgufYO9zc/8WI5APQNFtlnFOmy6gy75pWcH4PmJ/AUk0N?=
 =?us-ascii?Q?9FcWCXiWfeQWVzomygTi1I3rxmGzYFvQlJGroRPuMob6zvgnTmVjoOcz9Sbw?=
 =?us-ascii?Q?RfIOFtdB7yuhq6kWn1LaMcBNM/9vvfst+lC9qN6q/NwivbiW/SfDZvJh2h5T?=
 =?us-ascii?Q?InClPgu56Zm+USUp8IMG6ys=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2358d8eb-01cd-488b-e34d-08dc2065010e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:36.2541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: br99x1MBb40e8XKcqpuifFSAZP+UyICFqhoX4DDZRtXTVBsRSlIS+VQ2ewL35yJ5ZX7NX3/hH7oC2oqbhCBkpHKFqvW8U+BDZ9r8lpyT384Pr3VB1+QQCXaGeVvWxNcK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9881

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..fe6c72d03216 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct device_node *
 omapdss_of_get_first_endpoint(const struct device_node *parent)
 {
@@ -159,7 +146,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.25.1


