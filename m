Return-Path: <linux-media+bounces-4051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B3B8378BE
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4EF1C2751B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5B52100;
	Tue, 23 Jan 2024 00:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gPOYuFDT"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874F1FB2;
	Tue, 23 Jan 2024 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968234; cv=fail; b=GFCfhlAX1pVsS5isg6F0duRbjZlCYbNwS3eFza8XVIdfqj5FZ34oEtPKeSUYNfQxHb0prdrCOWQmKgK+uP9G4DK2j8rIgpw1aKAlDXw+XpTWakTjFwOJUoj4AMEAaOdMWdnwkJLnxMSruWpRlfUJbfKxNOksDdFiQJ8x6EFJ1U8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968234; c=relaxed/simple;
	bh=yvewR6pc93N3Y0GWnksPNQTrp0S2Ek0rP4C+OOW2ccA=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=D5swNdZ7BIMoIXrEolQV5KxYpUdNOKq/HE53EDRVpbnZy3zospcnUSsUaisQ6kKLcNGO8ne5FhlQRgFN9tcLpaUBRg0qIaQlQ2l8P+wtCVJiR52XiOl8BbaDg2UlrMcxfMj+eSNfDFj8/WVBw+o5rP35ba6gOJ34bnAbmJhyibE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gPOYuFDT; arc=fail smtp.client-ip=40.107.113.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/6oLH82UY47Jjo+8X0iOwBSv+khg4m8tLBK5mNJFoOdBx/EJiX2B72lEFxF4gjcu3dneIT1UnTBqCELbuRso5Ca2LF4kgq4YSESbHSneyLmba/jEkeC48j3TqIVqYXH3eIYDuN+zD4tCaLAptTbB1vohWn5Tlzt2EH5xAOtYM2bJdsXr0bje0u+Wng45lJzD3qWKyK0m0E10zZx06HgS8jg1k8ywTDRcHLbOgDszcORr2u8g4vRE59pu5hV1emPcGET1VywUIlUAaQr5xLBP56PKrONr+hkTYaOPojaMjoZt8gNY3uQ5FQrzD/AqDuTfHCQtWcxg9rUiU6b0dj5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZeevCSkJhWnukHfI/O3IFXxrii7TdVIIuL0iuucKkA=;
 b=Dq3Kh7/fGwIN5FvnAhyW7hP6ZAzzy5HChuvvWfKeNfkdR5Adq2FFp5BmdNd529uKjGrRH8/sElXrRDEZMnYPmazhCcxH5LPLb//ZNQkl3bFQT+JxI923RIQcKVxAFssXIN2esKQ73wf30x24fhJ5W2ejvwaNpVkl9xkWBnlbotF5ZjS2Klw77AU7mf/LpB6/BNMUUe3TSamLSAmV6BaFD6CMaycQGaZCBaiV2BzosO8ONv3WeDYV84XR5uJD8v6Q2Oqd4DhUuKuwlofWP/tUF8ByJZUMFIm32KKnqmYo6Ifyb0gymTphWm4sUse6rAgJeeekUahl19dVUYSzS6i13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZeevCSkJhWnukHfI/O3IFXxrii7TdVIIuL0iuucKkA=;
 b=gPOYuFDTvK4Mhpk5j0Br42P6rNRDlxsOAAmW5Xjzj39V0rO1P+5KEOLd3RyybDC2A9TO/bxi+yi92eM/rBhd5yDzM76AQ9zDeMJIF4kBAANr7UeP+74wz4kTnAEMt9AARKfIVSCHJvQQhFUX8lUOdQhPE4xj7V1yl3oe9p9SGtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10899.jpnprd01.prod.outlook.com
 (2603:1096:400:320::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.15; Tue, 23 Jan
 2024 00:03:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:03:48 +0000
Message-ID: <87il3kud98.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 01/13] of: property: add port base loop
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:03:47 +0000
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 7442db6b-035c-432f-a802-08dc1ba6c5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FhPNGpj/q3KyJx9/vyGJeTaZNDWSfXc5NnXZaXdpS2gYJnVHdwJ6Gj8nqSCgaQxWSEWxyfROvVSUyqYTOUZVf2gECMuwF1OiGjvB9PWNsrnHE3e/hYL/spXzzjc6OxLTpaw8sLwADrNFdK4NMRsvvXbrrmKxY5UV2frELlc5tDhORMdrrvGFF5RrHiSsJVdadMHw7YiNKVvtccGl3lXOCDn0X8+o3AeIbqFQ39yD+7WqTO7XItavDh5bdNxuaLiv586CcLC5KlAVfQa/g6z0M6/BO5KZD7IvYu/uJHhkqHTj30QzIQP7kP1H54ZNVguIFkpOzN/8q/WWfnWZ2m3+EwgeHQNhkcJNDYIqRA/94EF8/+fS+Z49DrhZEUD0aCPZ+GbmVfdaUvRtS+RRXeRHsmBR8SD5vAktDNHjnvkVGVUATwUXzUu+cAfSUSmjeKkdMF7xZM0I9GwUFnXIoNHlQf84ypcA4fLJYUGkZfBJ1MILhNp6std/f+I4svf1Z1QNatplJ1d2ep3w1ODx7Oap8WZOxuhfadxQl4+N/Vi5fWDgM6lbPXHWiEl+oHyaAcrYonTKVIpIqsJUF/AvYdyO8njWbOL3CxU4jMtLQNpCLCO+J/W3BZz8efCEZUz/viwEG3S6N3EeNRQRYVIod89xuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(8936002)(52116002)(316002)(66946007)(8676002)(2616005)(6512007)(4326008)(110136005)(478600001)(6486002)(2906002)(6506007)(66476007)(41300700001)(7416002)(5660300002)(38100700002)(921011)(36756003)(66556008)(86362001)(38350700005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JI8it9GyVIw16Z5K+/c6VvgoFRDMGeQwCIDiIq04J0aIJsQbX3U8kc+8q12g?=
 =?us-ascii?Q?1leXawfAUvIK9I2ShmiTii3+dT5jYfDquaulxuYzED2AcqN4WAhN7JW/LHC0?=
 =?us-ascii?Q?qmNrsqLKWL8PGoCfE/nAJfb2zdvYGS1Z9u/77rBQGmDHgDdfulpxyLVbsNsK?=
 =?us-ascii?Q?iKcYvfTFC0YMW2XVzqFmqFLeAgiEs4TE1IH1vN2PWum4Zcos0VbPCj/n9xR8?=
 =?us-ascii?Q?RtncHlWuz+nYMSKofyMooVXQESPjgmhJMSJap/LGd7w0J3VA6F1fd+z6c8Tt?=
 =?us-ascii?Q?z3dF8yObFDgLHchCdS1xRUr/jdepkbgM6l23nw9yJnEw26ZjL7K3z7DCSqff?=
 =?us-ascii?Q?L7uQ4IJ8FKezwkqUB2cEQOeU/wQHKHivMZNWuFUROefYlopJbY3RzMjWi9By?=
 =?us-ascii?Q?qm5mqjcm4M0KYLh9n0ZCUWNfzdtyolF81MLs7cszKkyMSdZSv1T2l3laNjoy?=
 =?us-ascii?Q?pi/o7QvmnVyngwHtfrO/YhP+s/wrGZDUnbSjHjqEOJ1N/6+aw7lOIbha5QWI?=
 =?us-ascii?Q?phXmkzO415zhLbjXfzPXyD0DJaisVTH1MONIKTdooam1XIYBhPmeQRIhpl5X?=
 =?us-ascii?Q?t5Q5h4k1E7cycBm7DcSIDF5fxzSCihSRAQaQKGMXZZTgQSreNJF108bOqJdp?=
 =?us-ascii?Q?2a8bpAih9x8SdsrehkSo0fmCCLqROE6czy7wTUjRTnnh/wJ293nYPNC9G7NM?=
 =?us-ascii?Q?p6hgtfZ5AYN+HwwqcEjypFqXbikIXfmKr29ph5/VENdnUQMg7TMlBJurjVVa?=
 =?us-ascii?Q?4m+LSFRYZi5OWitmcdELjz3AmN49o0S9DgzhMdHEWhld9EfYO+M0Mp0dg23g?=
 =?us-ascii?Q?7k3+yIcAOxfxyxslAlzIOpPNQQQ48tino2cJ+vZHQtCHomEkpM/rBDlINxW+?=
 =?us-ascii?Q?x1Rttw/pmKeaAiKA2sFXsuPNyPxdX+pE8n6exQ03Vf3ez8ulxHpcTD4Z/r7b?=
 =?us-ascii?Q?vK3jZtwE9ZCwlyJzM+qURm1ja9hUxtVBhhxYVav8Sg3n7qOrHoSkTCpN2dSq?=
 =?us-ascii?Q?NNYsUEfyKlfLCDx3UdIqwyk/JMEel8BO1u0+DBFH3HXLxbq88ZKJMcBuDqFt?=
 =?us-ascii?Q?ifRGFzGC9KrGth22350QdU5OeZdxxpUNLeBAg9g+DeeLnZgeelYB6G4Ak/hY?=
 =?us-ascii?Q?uGgdw+ty5M+ZJmhuZW9PK6NOy5uVsp6zUPRTpWNQV+bubIcdk1INpkCWZVM5?=
 =?us-ascii?Q?vcQOhG//fzrzJ7TnePBSLdcyKDGu/uFpeVAcV4ydrylQyPpNf5Yc0PTeXyeC?=
 =?us-ascii?Q?Hw6WaJxrkXSV8mRGDBumr87OrRc/tx0FGF+cMAcmdhxEkXzZ8q1Dw6Yqt15n?=
 =?us-ascii?Q?zfT34d1i8IMGpQDgZs8jTVeq+exFeO0TM0EqrVXypQp/P8A2bXpPeFLHnFr8?=
 =?us-ascii?Q?NJRMff5ZguIIncUncsBVX2gLBgTRlGLEEO+saVoo8ZrC0Kl+F9aP4901OYRG?=
 =?us-ascii?Q?UiG7onnCa6l5XwrTEABrbcagBRb3LDKewG0ViAGnyu8WIOM9/ycIzPUDtwN9?=
 =?us-ascii?Q?b5YgNEwHunEwupYGwZ10LKH5v132e51KD/FgAaTTY0SKVbJDy+G5NceCfsyd?=
 =?us-ascii?Q?yM30SXn6+dwsn8j+N/j31f4hfbIOYYbtqb99QRumd3YJQl7ey5Js+wRL4s2R?=
 =?us-ascii?Q?Grk+wuktpTFRYru38wKES6M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7442db6b-035c-432f-a802-08dc1ba6c5e9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:03:48.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hznNz3yOS/m0rOV1vdeuEpVzJIyJZFBUs6dev1/yIoSO7eo+VHIsVZmMFZVf6pCo0vI+MM5Zodc+SXCRx2vFFYY0Z/RxnMb9yQKix+UA8cGaR/2MNTKuGeN+nzNduydx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10899

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


