Return-Path: <linux-media+bounces-4314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4C83FB67
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04DB4283D47
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B843DD502;
	Mon, 29 Jan 2024 00:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z0sfHBDl"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C813D516;
	Mon, 29 Jan 2024 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489745; cv=fail; b=NWn0xcX5nQw7pnWsR1MaBprvlRIC5oYhnhdHBC9OuQaju3WRU2M4lJEAe/m2MkIT5eUYTDcKrquvXnBSSD3pqYY1A5dk3tI3+rYVezFbVjrdB5+pjNQwmtAZnrU1GVvECBpu8VmPIcHBpL/aoQuNJ1kvI3vzZZLxBIv2pE5o3SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489745; c=relaxed/simple;
	bh=5VAs1KQTNTzCnb3g7QL1QAT/oL29+yJC87qcISM0iWg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NAjCBqFkQufKnlnDaQQsPZeWn44s4tn+ltZo76uuB2QdP/o+PE/n5nnLWXqVZb7w1tbtMvLsFWqL7B7v8830j3SNpGpw4kKIr/j5WvS79PwiWNTN2uErEr2NdtOP/0VAjni1FBViuQaQXy5G4LqqB39ElHzmbq+pPPf60ZdM7/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z0sfHBDl; arc=fail smtp.client-ip=40.107.114.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciNOfKRuKuKAnbnKT2n8KoJ7insCDhZiwJm4txWkC9MEVh0dn2pHam8trgs9BPExxC4zhp7X94T5tDPJtiuN3wAdhcacO/S2R3TP7+OOAlxDHlLVyyOQmd1+t8d/F2l3epSS+HXCVzlJbS6yCrDogc/KUd+iq0tSeqAxSKP+CM/EbeqjR2mFm20CWXQ6Fp/C8K8DfQVn2hemAHztG/TZhTno24fnIFEQ5nMrfiTzctG+EPlasBbs4ud+/74gddnwCuk+Nq9lRseHNV9aSEgeNq0QcOI9eYe65+FF+heCfLBVU18QPKxxNqiGYM09m+VAv+ftZDxH3EoAfePDeVKTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkQMqMHNzGBNFV13iuUeVRTw/iMGfmTezXaXKaO5b0M=;
 b=V+CaZ3lS8yuQjX9lV5tBV+lzPpDPd79ezHnOzmsXUoMoPNulm2chRFxTBFaVwrYgEVJOPlbjLrC4r63QLZ/loWeqerMYxwVXW/Om2Z70o5LRxupDtsAp+FfRNRyEumhVans/v0jHGHj4PtAww0u51JrFlNQLxzITMrf4vPhIzoLmGhHShxgm30FyX+VewL4hPEmUuaY5A0nvd0sGnhPGB+iONdGrEz56GyO5yFAn1rDq5W5Hi4PZvBfOh07Ggn6kywFDtBoBymxgo/KVPz3BIFmy3zzSxu4hVIXJSB1N0+rfSOys4j9tbefGi2DB/HrQUVcWVWo+pY7qqybZ5a4crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkQMqMHNzGBNFV13iuUeVRTw/iMGfmTezXaXKaO5b0M=;
 b=Z0sfHBDlHpiAuJN+9qoxWMG02sESVx3jQjFwik4pTzX4uiGDR8t8xrIg5CreutPyYQsuwWiBQZ1mooEG2Ok8WpzRt3WlnQDRzyf6fyc0hKuv1Pq6Aj5rg6AqK53HxI4BJs3yHuLvO7aANPEjGLP1Wz4tojxLh0wpM7MLGnbr+1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9881.jpnprd01.prod.outlook.com
 (2603:1096:604:1e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:40 +0000
Message-ID: <87zfwpj6ur.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/13] fbdev: omapfb: use of_graph_get_next_port()
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
Date: Mon, 29 Jan 2024 00:55:40 +0000
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb41083-3608-4840-bbbd-08dc206503a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GfbepQvUFeMHclDTSIxFmtz4yQJVDrpVsaO7a/Pmw1qx5r71ohzXCDOwZA4ColP50OcQBwe9GBrPKgGBgHtpRUPOrwxSu5F6NdmU4zQhmvtX6fKsnU1VgToXsLfPbwGBc3/TB+DhYg9iv/xAHvTuv2zWKfE5kIE9z0RPwmPW4XO31JrRBZD1ujNbqiV43OpDUplmCPY9ts1J+W3+IDj7HadRUXEb6Ltoafx/DDVnWXc+2V9BF8vBfpIrNQY1LcphQGlkVshaKKzHL9wdQmehkF3xbiD/NtDP9/CkcxXH5Gw6h6HC0Gk1nuFegMJYiA+KyIOkkUyX3m/pS3pdC+4cej1XLyYM5l8/p5haJ3PaBFdHSm2ioyWl7BKmSOfh0CQ47vrLVIxwYoORj61X9FGEWIg6N9EhdvzkG3QM05rRpzEGEwiBA1g3Jg1GlIg9q1AEE4jakmiIJmcgF6siUhb8O3xggrgHK+kVW3A2+r0Z+OI/A7LZyxXTr9IaPLIuyAwqGdg+aAKIz5AW8Z8HtHJspThVadGkHcuf9IlbH+YuK+hRNJqbUrjIFYqXgebqsvcOXnL83syziBE7JJYjP9qfK+4gVhtqU7j/xWaxbX12Plvjjg16hGq1sTwPU76v4Nad
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66556008)(8936002)(8676002)(4326008)(2906002)(7416002)(5660300002)(86362001)(110136005)(66946007)(66476007)(316002)(38350700005)(36756003)(38100700002)(52116002)(6506007)(6512007)(478600001)(6486002)(83380400001)(26005)(2616005)(41300700001)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wOEXD6nsiBVIFRHg03KcVoPw/B8Z1ASJLWzggrinmpcUuA+IUpGDXyCq0bp0?=
 =?us-ascii?Q?c446lZrNxCAkXZV1M6yoC7BTuNbV74P2RYFfiEsF4koQMxDTBT7eGMtjCyqN?=
 =?us-ascii?Q?8H/mTAYVMYtSjuTwTEnaZ4WIzGJ5PTuK3VhvToLoyNvNJ/2YePPxK4Mu90Mx?=
 =?us-ascii?Q?5Xab3snsmUAjd1joH+F0TwEXUTSyf8KrL9zYWUs2vG/jNOHnnzHgRgNhTewe?=
 =?us-ascii?Q?EyqIfwmsHuJW+JMfwGjJlpDghhvNHOozirVUu3Nn/6LOCIWWW8kTCcpkMlKN?=
 =?us-ascii?Q?Y4ys4kD+24zQThy8+uoQU4RcVooqMBv9i1i+z+7NyKoILxQ0FruvwVJsB4Lr?=
 =?us-ascii?Q?v8c++kWfhWOpcL3f1cMqakwdqtVYEpnhISLMvsA5ee2Shdc79WtPDya0b/8O?=
 =?us-ascii?Q?OHjE7dcdQqn44LqdcOcpAbIrq4+P43KuKN7/MAfaQxf61JnW/8a675bHVwl0?=
 =?us-ascii?Q?Et6I/3Zx3lJ7KdtADoTWjkEo43pCehBwiewlZgPmDDamM/0Eox7ihVNIcDbR?=
 =?us-ascii?Q?sDncylMlP2vnznysFTGzT9x7euMLyuZWB+cXPCmFNcTA1NrI5jLtVEr5Fr55?=
 =?us-ascii?Q?5BoKgBSzj2Eib3rkiIO2Yse5AK9Bp7UTlPNmz132Hjx2s6jEeJcgA7JrauW4?=
 =?us-ascii?Q?TXSJ9s1USLEZfLx4hqYCsqb3rzJhOCvl0Wxj5HPGrbL9MwzD+flZzQUocBQx?=
 =?us-ascii?Q?8D/MVbqjvc+xpWg2N5I3pHuk8nvwzsY6nQ+tkf9FZFjpvwxyr4NYMHID6Pef?=
 =?us-ascii?Q?aS2qkBZ+S1raDhAx53C7YUi1cChPxIvbxxC3Mjkr4CqIbR1CgyN1nOLf1fPB?=
 =?us-ascii?Q?6XzCX2A7WwUb97Bf3HGxoOV64RJUti2Wr3dBPT79Mv7y0pMG3BwLLn9cFXrS?=
 =?us-ascii?Q?p/RZbq/cz+88kuBBVE3z9TcFqbn9X4UQzoZgMVyTz9Fh5pE5TQdLipb/WSHT?=
 =?us-ascii?Q?XHK0CrRkU4GWDtB7eWte0+Y4+7BvsUqP3bNJxiX8B7woIP70GOdb8Qyd7u21?=
 =?us-ascii?Q?NaxJDoSPc1o4wfBy7MFADTUhoFu5mWI72vxnsdcME630BzXWhqvSHpEQGO3r?=
 =?us-ascii?Q?oE3/RV6zS25ZWSB/BwTId0X8S0d0Gugcfd4JipOvPySDQG+3MMfODhxO7E6H?=
 =?us-ascii?Q?DzaPR8aWx1QXqtXJtMb1NwGTtRIB5asVJREoUXVf4S/+gEklDfeN1aaDzAFN?=
 =?us-ascii?Q?MTbLuN4v2MTnjsnFku2KC747T59F67n6miu1sHAAdVeeNNO5U4CL/dVWgPl3?=
 =?us-ascii?Q?e+XgCFIMrUBTZ/IsZLAthnlpoqycMYmkCjD+Xn2K3jSJ47h+0UZSnYS1fNb8?=
 =?us-ascii?Q?f2O9EzWUJHe3uCfclfPERnRhVkOb9edBvr/15g/Rz2Wz1niFnNSBnshC7wio?=
 =?us-ascii?Q?QG8itwk9i/+0Me1VnGC1foVVq4HCDDWDFaMO1Zf7f/nADkGnxs8e+wrdhMpq?=
 =?us-ascii?Q?vOctMB+CcqzyOdqeNz7BfYUqJxA9YHsbdZmOAUYp7AV2bqxsoUyY3GBZPPT9?=
 =?us-ascii?Q?p6HlniymH7zOoLRaOHanDrqjvHFl4Bxz8nU6Lj6Uscym5KeiMMvcWSt4D8mU?=
 =?us-ascii?Q?J3fv+b7K0dZU3H563/B2rAvGnu2zrzOqmXDJ43CG8v9MWelpGgH2SMOGwXMi?=
 =?us-ascii?Q?8o6O0msGhFcH/UWPO7waFjM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb41083-3608-4840-bbbd-08dc206503a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:40.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7wjZT301/s67SFJTrRDfkkuGspy3a1i3QDDRBpHNnF7hfqmDJ31oCPc1NlNLAw/utvlyXBPKjxpOZRj04A+FZCMbZzYklfv5j8DeyZXgN2f6cJq2uBm1ZxuErL5z+Cq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9881

Now we can use of_graph_get_next_port() for port parsing.
Use it on omapfb.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 48 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  9 ++--
 include/video/omapfb_dss.h                    |  4 --
 3 files changed, 6 insertions(+), 55 deletions(-)

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
index d814e4baa4b3..5cab317011ee 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
 #include <linux/component.h>
@@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return 0;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return 0;
 
@@ -953,7 +954,7 @@ static int dss_init_ports(struct platform_device *pdev)
 			break;
 		}
 	} while (!ret &&
-		 (port = omapdss_of_get_next_port(parent, port)) != NULL);
+		 (port = of_graph_get_next_port(parent, port)) != NULL);
 
 	if (ret)
 		dss_uninit_ports(pdev);
@@ -969,7 +970,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
 	if (parent == NULL)
 		return;
 
-	port = omapdss_of_get_next_port(parent, NULL);
+	port = of_graph_get_next_port(parent, NULL);
 	if (!port)
 		return;
 
@@ -1000,7 +1001,7 @@ static void dss_uninit_ports(struct platform_device *pdev)
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


