Return-Path: <linux-media+bounces-4053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A16998378CA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2214FB23646
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE79F9D8;
	Tue, 23 Jan 2024 00:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dsd0i7my"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66F95243;
	Tue, 23 Jan 2024 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968247; cv=fail; b=TqptNwBiwSjFKxmqOrrmy1Qjm/OJp8vpgGrtuNft8+F8+k81/4sIFB9EShM9O7z6Ir0KznonAof2abNuo7Z2BjD87UocCb4TvEJllEAPzHLKxg3yVXn6HRqLYDPToC3fLM0A7NgHp8IBpMHIUhK4Ptc+HAIDBpza1DhqWlIqlCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968247; c=relaxed/simple;
	bh=OvdRsSVEWjTzHOrFd8LI+hpavpreqh9zTlx2fciKJVo=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=XYddhlXGyAmWxqmjzliZEAT9HyOIDLwCRP+EBO2BpQXhT3LdQP/dZ+r6NrYyGrfOxFFBBgZxj4wmXwqgKJIYOSviIvS03eo92bBu9e+Q40eXrS1l9qp+QJiVIMzU22QKtQvGilDfSB7jhQ0Zw+SKsJAktABE6i8LyIMJ+uNDbL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dsd0i7my; arc=fail smtp.client-ip=40.107.113.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUtsWflZySevDZ2Tr9rVjeI8fd7+qsnqaQx4wMmzgxHq9pSrjpit8tpj9sT/ayBGJWrwzsco5DP8esW77YZTdWX/5E9tA+wJt4794T33g1YqHPXzY2KBZnwxc3rFRgVyZmdVSP8wFPIOGqoCYht73sBXudJbURcAoMRqGLv9THUITR8YEyfsuFyQPZDMpdGu8O9iHOARvaQFyuaGykAWPdzQy4c+ZOCAM2LzfNGf0raxEWbN30yl2oRQwqPSMLx4JnZUi8x7K8V/EZCW4TlJCdy+PuWHc+eDsJbet9eRaQs1dhesiiYoOkkMU4kCGCa0HbznvC3EQ+0Rxgy4RjWV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xv4bYvzdFJkNE2eLwLJ239oK10SoDUOyrVQoToNnyNE=;
 b=CWLwvMfv1D0zdT18EIRY1nEzG2g8QMA9eo0rqJIvOcHuvKTb8bRPXlp3Zv7wNLZ30poDGo8rTZ7oAkygyJU01qUIZMGOGK0Y304j4W+No4Ga2wxHoUBAMG2dwEQ9B9brQylj0gR2I2V8VRb5kwclgoUi9Hx3LTyL6vSaVvuJvi5wzcPINmGjCdnkM40EfKRbhs+YJ7f4SOd4HGy/RQIeQgL64LkPtop8jikUlEoD+Q4oXV0GHsxcMr3L/p6vq2vQRX6tMAusZHs8Ir5yVcp6v+FTNVDQaWsOxBbwk+Bhdi7FaYuP1SR/8g7fC6eGD9Z4eqB8CSDSDsjTzlF2ncgIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv4bYvzdFJkNE2eLwLJ239oK10SoDUOyrVQoToNnyNE=;
 b=dsd0i7myYhC+st7W/B0CPSBuDCQn3z+0C4g8pp7cP6uERJjlgIQCcLWgDpdwKYNsQEr68wwHVX+eFWYfJSGLa1Aaokl/DkSKZsl8SleujeRatjI7Q1TnfceTnvm30F3lSgVYMQgFr79xeJnSgbMor7LtYcUMl2CViWMC4LLqrIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:03 +0000
Message-ID: <87fryoud8t.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 03/13] of: property: add of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:02 +0000
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 95764876-599a-453c-4998-08dc1ba6ceec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a5QxWOxk8OYJQ+DdH2z7dGDX6UE0lTWHe5/qBGhmYlk7WFlOyoisOmpRsULRxVqrygP3LDEOOiIdpwY4K/N8rOaI4XiwRXuA9sNhLrBErYzV0/apNERely2/IU1vdJvyXc/RNnDPsLPNLPGJxTbR0hYwuy4nYEO7oeeD0Ei9WQI4t1cwtOHkDqrWVA3Acg1aDj69i+hOaIT6UDiufnNYKGokwXBl/NpJWFYz2ky/cgD+Setr1cYE2aQCe4buSypO760isSfOdhzpnZ5YZ+eU+wpZi9s6GzMpmNp0Vu2cQAsFXI3RXYP63PT+09erT3aVABsK2i5eI5VtET5MxdUXhK6n1uGXACiQ1xjPHOljb8g7Mnl1sAYzwAq4cYbaV/fEYw1Hf2ThmpjxwdFbN3teBRA39tIN/yYp/RCmZQk8IGePv/awx8zch8IskoJh34X/jkx635UTYg2JoAZzNbG2GWLIqECygKAC3U0mL2piXh9CtDojr0Tu5YVrHjs7IGVRTvOQJSsOpS3Avu3Z/c2LtOQAOUdGQxcPYQa/WbkYGndkr4JDKRKo7e8pYqxdiy+RPjXVnKjgdk/ig1MciI9PZvZ9tn9uQLn8/fh2Y8PbZWcbxOek8uE+1nN6Osm1/7AKYbSztFIZFKTuzmJf2sMD7qlFLWOqPzJor9Zd6skfwE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ofzf1KJDaPi9+PQBpBPKTXm4cy7aZ7yzQqrfpeClJRz65AmWLp4GtXU9qhhD?=
 =?us-ascii?Q?/LVROUnaSvPJbnBXKfGHTvfzTGiT7wqx/Th+npQemQa16pU2lBvrr/EPxcQ6?=
 =?us-ascii?Q?bActLdple+tQHZlpMHQ4o5YsOTUwbi/tJN874tGMFr/YYORVDJ2SGJx6hpAh?=
 =?us-ascii?Q?9O5W0dkqrlLOITRQiU6Lxel7IAYYrGaltRs0E+goFZcQ8QtR5tQdRUD1w0YQ?=
 =?us-ascii?Q?TA8NQthdkukYvckTQ2pHtww0oSNjmvA7GcWnDwGN4IUI2jnAqEq51b119roJ?=
 =?us-ascii?Q?sBfvDmd3Ssx5l2xubtjTEWy/JwVJOGkYZV9GnLSHvgdJcGVHpkX/p17bVPHa?=
 =?us-ascii?Q?bKgnouTcAxsPJzZpGKzu8rQkzv3qxwU1RGJHNNvIeS+5cq1pmwX3Xwiy3UBO?=
 =?us-ascii?Q?bV1NkJJWqoJRPy7juF0AvBzj+gmY/Dbf1w94CcNhXAyNwJFlUtc7iWS8VhaP?=
 =?us-ascii?Q?TdOYlTVFYYmzLRfDK64VBkShQz0fNVdek+hbsSoCqABytU69lm/pwUQIUfg3?=
 =?us-ascii?Q?GnIpB6NLzqjcHsyiu9JVb7vmuL7LeCleDfjcRPxQVBr9HE3sVWxcAGbMIZXU?=
 =?us-ascii?Q?PejE26rT070U+E/FFJ8H421YNcKQ8yoCg861kl7vHZbQ4mkUSwahgnZVn9ON?=
 =?us-ascii?Q?knVgKebJbgbNyyVdmHqA3FzxGLcwjVxgkP1Ku7Ur+W9kwiqFQwujcPutGpp3?=
 =?us-ascii?Q?LEc8QTTOg3s0qDmQAxoYS7p/R0+wYgnIrviePEtXrSLoiTHCzEHQlCe2ncDs?=
 =?us-ascii?Q?+56NBUC4VLUJ5ps2DruX04i1ATiTaDXkohrGW1xZm4ejFTHQ9YIO39x5XvHS?=
 =?us-ascii?Q?C1dWDf8BI05edX7AI92KSJKBCyax2/Q7dEp+lxfroJLY8zyvPm08jKLSsiqi?=
 =?us-ascii?Q?gkKjwuuaISX39au1PSeMyZtRpbqS/2m4QUXYcwulZIXQn7/MAtv5S3Jijy74?=
 =?us-ascii?Q?jTuTxyepxgOQitXHC6nN4QihbVTP+ZoE9ZgevHJVn15Ktzrf1XBmtIwO1qSU?=
 =?us-ascii?Q?5t1NucZEURBFX8MzwsUH79ItRyb22t8UxaB7Wvh3O81C3+Ofk0qXTk0rH6Sh?=
 =?us-ascii?Q?pTdY6hc5T3fJx8Go5SqeLmI6asV/wPparsM4XvHMEB0oednMad1AKiIIVol4?=
 =?us-ascii?Q?0Y/gBZHHcB7qdPill6UzBp+h6idErKVfBptdg5G4VWvXmxKTdf1FbkkVcTFZ?=
 =?us-ascii?Q?EnXMQNnL5+icK6s98xo1jaPxnJ44VYcEwXsWPx4KejmmddMxu0m0clRwXgiN?=
 =?us-ascii?Q?rlg+DYA2p4oaTgQNs7USROtmzM4q4BxYQr5fPGF2+vzEUxCeizVx2L0hY+zN?=
 =?us-ascii?Q?ZkaJpnYAvNHbkOkwPXO23qr83XFvPXmWd9HsyXTqjJzbx0R9DJiLaTusxaNt?=
 =?us-ascii?Q?i/eLdXjzd6vlWcEyY0Lv7QkV5wEX5TiFwdnYQj3iqTmNfre/lwe8/G6HZRDt?=
 =?us-ascii?Q?XgxY+wHsB1aAx5rO5T+6iECiHKqCbp8BbzpXBc0JyKsvk30w4GB3U3ttjT9p?=
 =?us-ascii?Q?zLv3z14EoPC0Y6hQbAu1U5Ah7juXk7hZ/YGPUw8tu4e8GdujH5PEtB+c89ef?=
 =?us-ascii?Q?FkN3Q42ALvRqQBKJVNA5vjMQ+YcP4TpfitYMETtFb6V2Vbbjf4JGLF4PcP1D?=
 =?us-ascii?Q?O4SuyDBPSEZSG2Rz41ffIa8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95764876-599a-453c-4998-08dc1ba6ceec
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:03.0927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/gDVMILAYMwsThzuxyK0RTIJN8bF3Lr53cCIFL36B7bLEWbWAqkAHDlzQCU11C2nKWd82CfIYGP5CE1gMl4NFc1z+qA3BJUE6xK4I1XmKmNBLFGvQWgbGMpnyhnlQSG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We already have of_graph_get_next_endpoint(), but it is not intuitive
to use.

(X)	node {
(Y)		ports {
			port@0 { endpoint { remote-endpoint = ...; };};
(A1)			port@1 { endpoint { remote-endpoint = ...; };
(A2)				 endpoint { remote-endpoint = ...; };};
(B)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= A1, A2),
I want to use like below

	A1 = of_graph_get_next_endpoint(port1, NULL);
	A2 = of_graph_get_next_endpoint(port1, A1);

But 1st one will be error, because of_graph_get_next_endpoint() requested
"parent" means "node" (X) or "ports" (Y), not "port".
Below are OK

	of_graph_get_next_endpoint(node,  NULL); // node/ports/port@0/endpoint
	of_graph_get_next_endpoint(ports, NULL); // node/ports/port@0/endpoint

In other words, we can't handle A1/A2 directly via
of_graph_get_next_endpoint() so far.

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get A1 pointer for some way, and if I want to
handle port@1 things, I would like use it like below

	/*
	 * "endpoint" is now A1, and handle port1 things here,
	 * but we don't know how many endpoints port1 has.
	 *
	 * Because "endpoint" is non NULL, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (endpoint = of_graph_get_next_endpoint(port1, endpoint))

But it also not worked as I expected.
I expect it will be A1 -> A2 -> NULL,
but      it will be A1 -> A2 -> B,    because of_graph_get_next_endpoint()
will fetch endpoint beyond the port.

It is not useful on generic driver like Generic Sound Card.
It uses of_get_next_child() instead for now, but it is not intuitive,
and not check node name (= "endpoint").

To handle endpoint more intuitive, create of_graph_get_next_endpoint_raw()

	of_graph_get_next_endpoint_raw(port1, NULL); // A1
	of_graph_get_next_endpoint_raw(port1, A1);   // A2
	of_graph_get_next_endpoint_raw(port1, A2);   // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 26 +++++++++++++++++++++++++-
 include/linux/of_graph.h |  2 ++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 14ffd199c9b1..e2d179cf7d26 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -667,6 +667,30 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_endpoint_raw() - get next endpoint node
+ * @parent: pointer to the target port node
+ * @endpoint: current endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
+						   struct device_node *endpoint)
+{
+	if (!port)
+		return NULL;
+
+	do {
+		endpoint = of_get_next_child(port, endpoint);
+		if (!endpoint)
+			break;
+	} while (!of_node_name_eq(endpoint, "endpoint"));
+
+	return endpoint;
+}
+EXPORT_SYMBOL(of_graph_get_next_endpoint_raw);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
@@ -708,7 +732,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		 * getting the next child. If the previous endpoint is NULL this
 		 * will return the first child.
 		 */
-		endpoint = of_get_next_child(port, prev);
+		endpoint = of_graph_get_next_endpoint_raw(port, prev);
 		if (endpoint) {
 			of_node_put(port);
 			return endpoint;
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index fff598640e93..427905a6e8c3 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -57,6 +57,8 @@ int of_graph_get_port_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
+						   struct device_node *prev);
 struct device_node *of_graph_get_next_port(const struct device_node *parent,
 					   struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
-- 
2.25.1


