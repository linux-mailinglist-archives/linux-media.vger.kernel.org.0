Return-Path: <linux-media+bounces-4304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3583FB47
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53F9BB222FE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123268BFB;
	Mon, 29 Jan 2024 00:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XXmjXXgP"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C144F8F48;
	Mon, 29 Jan 2024 00:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489690; cv=fail; b=FxJqVWG2Yq+ta2PnEuexI38/+5fDpSPRAjusX+OVHT5FfB+GgB+RXzPzHAHSYJT283clR4FCYTf5yX+jFVv1bt3TzoedwdSOBGpVT2EVrynzSDTzNRZzFIMaSW8Flqfp4fNPgVUBxjKgb26TO3WKuYZROPnqBG52LsjmH+G+OWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489690; c=relaxed/simple;
	bh=yvewR6pc93N3Y0GWnksPNQTrp0S2Ek0rP4C+OOW2ccA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Dxjls8gRgAMLYNiEyYAy6HqRtmG6hTwDdO6IuRFoXLG1gWGpnNCGJTQxvMi6l/OxyBDGa+SecrqWFMP546gRyRfPVrBAltMZ7wvtJ0vH4+Zzxidx4KG+XnVyaft4Dx3r9sLWzVmHYFu5zHzmvFeiCkq2ppZMeY+AVDbyuT0BTao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XXmjXXgP; arc=fail smtp.client-ip=40.107.114.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlSL6IRLQhz1X14k2ruoQ33kJgmpLZhxyoENxvp2aoBF1EbLdG0UEwsguc/0JeKhI9z9L7FcCdAZVDUfSAus9S5fSAAL1jzgt3cOpvjIvYHjQZjkdFLHI+IxDS6MrcnFt/c9vzLrrg5TsG8olxZedqgz2Pc+ycAiaATd8ftHpkfIgHkmUUyXEHLek8RjWwlg3E+P2+u2PM7iUsLRDnaZXS8ciEVQFsRoqKKQETUla1lok0p40PGQr21t2MCXkq1R+NAMExYA2x+FtAuTxDIKMX3FwGdFf5967pJEqKRwGJ1sGqHjlkWyjypyTx4sg/f62vIh70ZGqhUEVm29DiwJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZeevCSkJhWnukHfI/O3IFXxrii7TdVIIuL0iuucKkA=;
 b=My2JXLwLYtKDcfbWm20MIdqYBxUjL6fPCMKeYBBqiSfIxblLYgpAQSi8/ep/Iz4U7j5qjnj03Jv/8Qob+PYIX30FBTFbSREGyzTXcYQlLvpKbuka5h7/bSPstJTBWX2wJVi3BU4UfzT5lj/ONhSmo+QKREPuMcE+FJf3k+5AoiYw2gAhQxq/Bt+bYUzkysPit51seIZYV7TGQdLi7w6PBzX/VoYTab1s50V7BIYENM0qkJ1KPS6g2XeUpUYKqlPFjlE8EKQU17+dTM3RtofuaeekTBopeniQBnPza1GxCilL9+sU5pOZuxo8Oaq1cIll4IZ0Y2rkV/KNy8hRn53nDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZeevCSkJhWnukHfI/O3IFXxrii7TdVIIuL0iuucKkA=;
 b=XXmjXXgPhkT+J7E3SEgG756DgFhJZcV78c4ELs501s0pO4byCoyZzPqVvCfl3BOHCspsPIkASljOW1w4LbkfP7U76ziX4tPQgqFATCxScYRSt/UMwgixL39JAbtgVmU3pvgOZflBqsCdiz6jfPXpz4aIf5s0xrnXl/WXdbAPl/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9304.jpnprd01.prod.outlook.com
 (2603:1096:400:190::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:54:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:54:45 +0000
Message-ID: <87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/13] of: property: add port base loop
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
Date: Mon, 29 Jan 2024 00:54:44 +0000
X-ClientProxiedBy: TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d607a67-e464-424c-7fc4-08dc2064e2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2QCe0NaOmMZhosQKIwj0Q1WixOEtEnUA7E6vvC1G1LPXJyiD08QVDf9HmtoUMWfMDjhDiSa22NVZPLzE0rYnZz1gKniFCVKOw0AECJrZ2ZFmZ4Vk6rLvpr2oiv2+Jjb1BPqsz+m793d50Xeg1YRLB/sVJc20bvW1RjW4/7v400m5WV6TxyckppYdUMQr0ngmS79gTuhEitZf+FN199J2yrU3GPa5Kq1IegIx3IR+rSoZfqW0iL1/PqsHq4TzbE/PjxMJ7k4Oi+TYKbPbf5qEBIjjuxDyxly+KADt2BcTvQB+8zS8qiSegg8qHa9zEkKN2sHx2QTwAgXvsrQpN5jpVuDiB+h+Y2tA7TD8QqzEwQVnx8zNcQUk7v5elX95uS5fgovQ5V0+SxQ+eO1mf3HwuOk46jkzuvrTaGoSWmZShbRLBQNQBXmXhfjNWN51+KJmkyRzDnV2F5Ke/xT2PFwsgtsxpS1367PiRrP6f64BjxjGMDPeCtEVGKbK68b9EOSuzyqNIzHNl9Aw/HU8ffaw53NEXFaG/v5+/z3R4OOF8rXbY95QE28LIW6QVY8QdoHYAUZDv7ocQyLYc5R+GgnW8AiuXlwdWj2A6pCFEW+qMiLTt8nayGenk0YCQQi2Y4YMt5lLjc2rHfbtZu1H0/aoRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(478600001)(2616005)(52116002)(6506007)(6512007)(86362001)(38100700002)(6486002)(2906002)(5660300002)(7416002)(66946007)(110136005)(66476007)(316002)(66556008)(8676002)(8936002)(4326008)(26005)(921011)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y532ykRldd9sawv3wzzVGlFCHOSurnIqJljghRTko1ByUTlnZs0BuzFhcPBZ?=
 =?us-ascii?Q?uMSgDpvCG1g4YxNjgtMa2QpaTie3XkdFyi42A2BFonF0bVSMwzDm9Yh0fEvP?=
 =?us-ascii?Q?ekCG4kIk7f1vZWwtd/7byOjZt8YItxXwIchuxn7kiJGtld2xJ8lpOl+g3X+/?=
 =?us-ascii?Q?AItDyim2YJgnKQA8slc8WEB/ZzkCv3OUuiaZrR9yNuQnyIPtD/H+o46+wAT4?=
 =?us-ascii?Q?/A2aDphx/EtAOwwXMQF7CXg53NWvvZldysJj7ABUd5qinXnsNBT7FhG6+Hgz?=
 =?us-ascii?Q?PxXWaFD43RNf4PXYvHkc66+myGc1dNbCM1GgyIglstGJcim0/pmNw5AcvJo6?=
 =?us-ascii?Q?F1wnJJPuuk6Nfgcs74vUiWl50k/6WhijAVfkmgVFNsKqZuN9/UvgVQXbRuo2?=
 =?us-ascii?Q?h9TW+S9Y0yLFrz8Y1JOL6VKngLFE2+f/D9WOem83qggASc+fStdWMdqtpORb?=
 =?us-ascii?Q?IMncj9tpboG5wPESSX29ZfvdwHvWIqtlcPtpulCdx/9FFjLsDcKCiRbPQJX/?=
 =?us-ascii?Q?7OMbXWLQ9GB8y6QWPk87X+eDs12ab5XkJkYG8SvMOEM2m+uLdqx9SK6DJ5xX?=
 =?us-ascii?Q?VU82uvqY3vKGFxU7OBQG7a/LsJnKkHuZs8kEygI6A5KnfyU4569sGD01rGOo?=
 =?us-ascii?Q?SO1BF4Gt1+CKZdmzDrfb+iPVE3V0PYD1X554lnmJthatb0GhgUzOsCv3aZiE?=
 =?us-ascii?Q?FEm9K0nqOa2M2DyeRk9OfrchhQlNyGA2kmX/QEJKhq88avZUB9edFFa9twF3?=
 =?us-ascii?Q?T8X5v/D/BGsjzH0n5N97JqjXkidf0d2W+TL8lewNk5npnMldrUeXseczWQDN?=
 =?us-ascii?Q?JePQn3cow4gs5BrjTm42igjLYzV2ZV6B6noOpgsV9pc0HdCPk+Ucz8vV9xCZ?=
 =?us-ascii?Q?0YvXACy5SIg9TxSu9sXVJnrPMJ6qY19eCc+mijjbDxfRJ4CkmJ3nkJwpmFgC?=
 =?us-ascii?Q?WJUdevkCfz9T1cyMQKKF3oYGbQHGY/NpWZcVDzWQEQH0rxl5/75D1+E/KjOi?=
 =?us-ascii?Q?g/R6AXu2H1qy3uRMDWkDGcQ//qCVi+pv1Dg3wm0EFIMMXa0IYZbk7y4/qSNJ?=
 =?us-ascii?Q?Tdx9bhETDTqRfSAFpho+mezAMLIA85P/WHAaE1GKJLMkbNHuDBbNfPY5DAA/?=
 =?us-ascii?Q?+iRN24R2BLTa7fGQJY8KH9D7NgRhcDkFiqbTQI3dUSqkHF65ThS352Gw+ZN4?=
 =?us-ascii?Q?GM+yCJeTH9iMWMXcJdMq36+tUZ6kSCtw9CbcophyL/moQ6oLcQ4XYzgzmw/c?=
 =?us-ascii?Q?Pofrug2AykrmRTYQwQOshKmBkMU6MsQGPIEFyHwqA26QbMPeHplB8IzsjdqU?=
 =?us-ascii?Q?qzDinUGGvUnZwfrRQ+x1u/Tpxd5gbGlCvNaUS6rShsWjDJhUEQ6Pf2FNoGe0?=
 =?us-ascii?Q?OT5jc8kK6va27roNDdgbMCJApqdxbSEfZn6z8g1CXvnvRmlS/KIjmA4rjeds?=
 =?us-ascii?Q?fMTyWPQOqw0N6FUqXQNTxrew9EubtX98+VsTbGxYHvwib6KO2xaaTgcPgoLI?=
 =?us-ascii?Q?u0GXwOK2TWGzkfkoz/a4nSe79twkjB5QmfZOrTqiPUMo5bLlqP4EjFHo/O6Z?=
 =?us-ascii?Q?cYnCd0lYBX+TdqM/VBB/yOzw1yGFKQOucshOGbRhrdk0aY63B4WkTQdTPKYv?=
 =?us-ascii?Q?GCrTlbVTeOtZMmcKJk4hVN0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d607a67-e464-424c-7fc4-08dc2064e2a9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:54:45.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNb01pg5Zt1xXmh53GLmZvqhfp6CbGqRlbRDxnuEjn6ZrfKjn5HvGS7TY4LqCUjMkMvwHx64fyV/0B74rOkXfOrzOZ4AwtyGNtZq87MgV+mT1zo/r54O/Me6uLzcqsT1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9304

We have endpoint base functions
	- of_graph_get_next_endpoint()
	- of_graph_get_endpoint_count()
	- for_each_endpoint_of_node()

Here, for_each_endpoint_of_node() loop finds each endpoints

	ports {
		port@0 {
(1)			endpoint {...};
		};
		port@1 {
(2)			endpoint {...};
		};
		...
	};

In above case, for_each_endpoint_of_node() loop finds endpoint as
(1) -> (2) -> ...

Basically, user/driver knows which port is used for what, but not in
all cases. For example on flexible/generic driver case, how many ports
are used is not fixed.

For example Sound Generic Card driver which is used from many venders
can't know how many ports are used. Because the driver is very
flexible/generic, it is impossible to know how many ports are used,
it depends on each vender SoC and/or its used board.

And more, the port can have multi endpoints. For example Generic Sound
Card case, it supports many type of connection between CPU / Codec, and
some of them uses multi endpoint in one port.
Then, Generic Sound Card want to handle each connection via "port"
instead of "endpoint".
But, it is very difficult to handle each "port" by
for_each_endpoint_of_node(). Getting "port" by using of_get_parent()
from "endpoint" doesn't work. see below.

	ports {
		port@0 {
(1)			endpoint@0 {...};
(2)			endpoint@1 {...};
		};
		port@1 {
(3)			endpoint {...};
		};
		...
	};

Add "port" base functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 48 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 21 ++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index afdaefbd03f6..9e670e99dbbb 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -631,6 +631,42 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
 }
 EXPORT_SYMBOL(of_graph_get_port_by_id);
 
+/**
+ * of_graph_get_next_port() - get next port node
+ * @parent: pointer to the parent device node
+ * @port: current port node, or NULL to get first
+ *
+ * Return: An 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *port)
+{
+	if (!parent)
+		return NULL;
+
+	if (!port) {
+		struct device_node *node;
+
+		node = of_get_child_by_name(parent, "ports");
+		if (node) {
+			parent = node;
+			of_node_put(node);
+		}
+
+		return of_get_child_by_name(parent, "port");
+	}
+
+	do {
+		port = of_get_next_child(parent, port);
+		if (!port)
+			break;
+	} while (!of_node_name_eq(port, "port"));
+
+	return port;
+}
+EXPORT_SYMBOL(of_graph_get_next_port);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
@@ -823,6 +859,18 @@ int of_graph_get_endpoint_count(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_graph_get_endpoint_count);
 
+int of_graph_get_port_count(const struct device_node *np)
+{
+	struct device_node *port;
+	int num = 0;
+
+	for_each_port_of_node(np, port)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_port_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 4d7756087b6b..fff598640e93 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -37,14 +37,28 @@ struct of_endpoint {
 	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
 	     child = of_graph_get_next_endpoint(parent, child))
 
+/**
+ * for_each_port_of_node - iterate over every port in a device node
+ * @parent: parent device node containing ports/port
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manually.
+ */
+#define for_each_port_of_node(parent, child)			\
+	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
+	     child = of_graph_get_next_port(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 int of_graph_get_endpoint_count(const struct device_node *np);
+int of_graph_get_port_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_next_port(const struct device_node *parent,
+					   struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -86,6 +100,13 @@ static inline struct device_node *of_graph_get_next_endpoint(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg)
 {
-- 
2.25.1


