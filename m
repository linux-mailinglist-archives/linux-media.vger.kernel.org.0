Return-Path: <linux-media+bounces-4052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE758378C3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5D228D909
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7D43D63;
	Tue, 23 Jan 2024 00:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Gx9+u9Uz"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADDD23BD;
	Tue, 23 Jan 2024 00:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968240; cv=fail; b=qqVs696G88Nn3eH/JW0pbFhITWf3Mg5YnbKeM66GUIvq5xRiaH9HJW3WRwGOrmXVFGoOSnT07wYKE2saiifboLCt4pb7SkBSc5Sh54Xn1iHYrMlNPmN7morAUEm9ogCMh/VqhO+syglbteH58i7uU07S/ptlKwuwgqJON7hQV0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968240; c=relaxed/simple;
	bh=LNx/Y3XVBWXRP9qbZzJewNGqiMJzZV1/IPJ4MkOJ+mQ=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=r18+6tvNkAv+4dWS1Bxc1Pj5P23joGyEg6Ktnl7gb8P9Nu5R6VB+TRG8+HsxAlzP8bNMPRYSxugpwS9GTjRYY1TUqnVT4JWOTLUCKrJ56I8xRAJg9sbv5LjNlNgruF922AOssvoOaHjSPPqnQB2HXqXKYkeRDe9fWDhy/gih3uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Gx9+u9Uz; arc=fail smtp.client-ip=40.107.113.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5j02lPiMHFhWBIx7Y1qWfPWQAsQW3Qksmh4Ge7G9zIgRFTC+cHrxqzpVENvvZ9IgK0Ocr/ERyoBuCA3tPPa6t4ROLliqqRVPmyq9FcuTuksUqbvcoZ2/W1CKDYiC0Xel1itNozL8yomyRWylhjiCtS5EmZmBrjAWsG/4joKC3ldlydLhG1ajOt3LkS1O9TmMcQs6FN+VizPV46/q6fENd194smtnsXLyrQ+yeazkChxm66YA5VkN7XBd/po3+pVbl72KtOvQutPOHFPfoq1KpbQ1cDV3HBiO0OH1EZyfnvgG/ePEQPsfMYCRLn1lfYLDh8Spg292tTTap5dJy5jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axjGkc8Pl27E4lkjlasY/HmMl0qJa/xeFIKmgqYuKtU=;
 b=Mie1bFNhB0GA4RfHt/teqkmHYuTc8eOeJsdF4f07UbO3NV/Dwi0wATlZlWyELEAOJtxAYn+r0LOGbQbrEEItImyxyWPAlo4JLekjwtLOOKpgSBdIRrHeaeNG+vOqcKcwxtnAyi0ZYoYHxFbWElA79QlU1hZgO4Cz/xlaUUfD//6s7AZaNZCl9yMvSrdIUoPpILH56GBZY7+sftPAUFdYbQS53VMkEDP4fPO63goS/JX6MsPpQdC7MvVPgkaDjsVtsnt/LDyU1E2WIm3nth84VRF/axDnLPN0Q4fWfy3LPoxgoH9rwPHEB1nUKdGbs0/X9caE7eLIPPRlxDpW2n9S9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axjGkc8Pl27E4lkjlasY/HmMl0qJa/xeFIKmgqYuKtU=;
 b=Gx9+u9UzPWLjy8+Qyjer9WDNOvdRUTD3lRBGCp8WhNVM/pEaqjyV87Ba9bco/OYg4I2uiAmzSFzqG+552/PpLQMveYON3VCNIeApPqn6hGTCrmAuI5BYgoEQ+vfNlfke275AyH2ZEzW7spHP1/6ai3ugt4rmpcEqSv9FTGDFvhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:03:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:03:55 +0000
Message-ID: <87h6j4ud90.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 02/13] of: property: use of_graph_get_next_port() on of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:03:55 +0000
X-ClientProxiedBy: TYAPR04CA0020.apcprd04.prod.outlook.com
 (2603:1096:404:15::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 12786880-fa90-45b8-adc9-08dc1ba6caa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0RVjouyy7R3LZmyAeAUSaZH5DlobK4G7F6pD5mwe+bIqbK0/fAw6gANWaJHW1pl983ARTHtn8R2WHWCjolnp80NHQDnld2A9u3VS+xL6aSNnKG2myXFPB+ZH47PQAd/F71zlOJ60C8qDl4qMKE6MgIqHdhSgNkewaRFAl3SO7F2lasIVM/4fsSpJDzqex8ilFM8eMzhtT3YqJ8fO56QE9XLqgTqvhyBYV8hq2TfBV0aywtn1EnneoUVD6aIEpdF+8Rsdtjh8WwGMQWT8M+DbIjNCh4XUADbmh696m5kXsJh4MjTe5kfJ3/BqdTF99BhZ80b/APXHEzIxEEw63KMvp5p7T1wir61e5SC6Fuj9b207ru7CnfODkco6vJjNB6VNfuURyuWy3y2rgsTGr+leq1LziH1y67zHuRO1hmklBVmIrh5RCkgPuWJD9EFSurGgaZ3qpDDGqe9YAIoja0z2WAc6ZFHfADPludFCtgwPqARmfUXCXxxJmQ85kIPSByacfv5r4Izp/pcF7dv2niVJpbFtuHMs3Clq7c1C5hcxC58zCPfhcEVTQhkAquZf8BQE7GqmaHL6RwsDd7b8uZLq1XCX5eHcuTff7XyXZqjIeEFbTBjtJDw4gOJyfwZEnFQh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UmhlPfhRwfzhojmRdFJsIkkugW9zvyMVs6+hhMZOIm6S51H3zXbFJYDaOBGZ?=
 =?us-ascii?Q?GtSCj4fUcLnypWaKmIla26642hkAJHyo6h/NpSGRz9VfXbwch9sTlhrOjRAJ?=
 =?us-ascii?Q?kDtiJ0BWfat3ByR8+L7GCxfgargIctWGuHOhKMJk414af7UpnRCFADGqAFMv?=
 =?us-ascii?Q?79qo/SZW3m0lk9wNLgC8bEhbh2Rauw6wlBOb22iSikXt7RCkvG7w18d0B42V?=
 =?us-ascii?Q?2Bc83CM5dIr0hNRcf3jBeczx/hAH6+zZJGimG0uYSr6I6/noMhtsZkxyK9+E?=
 =?us-ascii?Q?hOzfPlXOnZ+bg0zSAGx9+hp/BWp0rEpsdntDzEFCgpQoa0BsdGwMknTAYA8b?=
 =?us-ascii?Q?Ug6o/pGp4XZu4CTB9H+1c0tCsYpi4Pw2UKwX36NeZLlAUp1PKP3oCEImf5CQ?=
 =?us-ascii?Q?wapn6dqKzaWmPeDNVLwubcZPgg6X5itGqH/ucuw6CGqYe4k3h8pF+v4Ln/j/?=
 =?us-ascii?Q?xFpd8DJVohCNSkDVPt0RtPRiyXAwFubn+5ewDhg7ki8u2O4qNa42xALYMgbn?=
 =?us-ascii?Q?uiIH1wo91rofEphBuAGSf6gGB9Fg7/+H0UU4ZJzV9IqrJuMaBISnLJpkA3Ps?=
 =?us-ascii?Q?k5oD7gGhy7a4KhGNc6hqTIIwPlYp+PPefMRDu32u21L8pS583llQinKru8Qt?=
 =?us-ascii?Q?/zzGWPKmHpnJiyQAcFtYPdPy60LGVZYEv+XtobdRBFncXkeIH4pHY1df7pXt?=
 =?us-ascii?Q?tzBA5Yrbnfm1/3xTWxPEt57+iVEjpmosorVYGO4zAXZFrIULnXwb14wGSB9I?=
 =?us-ascii?Q?nE5g78kk7Pgvkxx/QbuWF+TQfoEt9Txkw//f8ORoIXpXTmXGFdRjDvhtIH8S?=
 =?us-ascii?Q?eKtEpKiFG7GW5d8gmPRSe8IXA99kEnchj+LImvtmzg30zsAOdG0VhEps3hMu?=
 =?us-ascii?Q?EBAcPvMV1Z3HsEkbRtmxhhEXABJq+QoC6sfsqJONR2z07rbRIFOvN9aMp5Cx?=
 =?us-ascii?Q?ZuwW/ONSbyF0T3FuZwY0j9M6kHB3SctL4+jeZVyJYUdzwbHrapSDWxgT8daV?=
 =?us-ascii?Q?DbqSjXF+ixL9+kEkpqm4sLLcBs0yfAHUmqFX0KCtyxN4osfu/RZs+FW/pQiM?=
 =?us-ascii?Q?hTLEVjVJVeseRbk92OPHQdjhtiIdta3JRUM/hjOpgvhYzFy6r4Kpo8rvZ5av?=
 =?us-ascii?Q?cx2H81lMV6tjEKHKyk9g0jorl4xJBKVlX7DLC4LoczR2U/fGGTzZh0B4pP1q?=
 =?us-ascii?Q?p3zdO4jqmf8pFpLuySkHsXjX9jop5euqsD8b+jr8bY2Zs/SsxBTbmDXOARVY?=
 =?us-ascii?Q?tbxUq4+Ov/HAFUdSQsiqDHOQfHb3F4frY7xl9ELUf3d2PQCzJbQtnrq0fSDP?=
 =?us-ascii?Q?b+wMi5KdChwLKA9fnJJBs/noS9x1aSZa0wzUJ+qCGziTAg0hvdze0xfN3p3/?=
 =?us-ascii?Q?Lfnysfx4V0hwcW6s5c+9gWhsCbqaH9B/eWOHgrokucJJFSACygtpxSX3oRUj?=
 =?us-ascii?Q?NwCZht1sxeUZ9qXJFyc9YcimbhIbKJoyhCQURKvmrqxny2O1BWVBQtAY2VqS?=
 =?us-ascii?Q?ku19gFWvLkjfs5q11+14o+9GIavzkhbXUPt2vY2GAwkYgZiL5uECFBI6EzeC?=
 =?us-ascii?Q?BtH56yb/8qQJwbrGEXFw9HkkccZbUZK7aqxZFqFS8H2SR5LegReMtdFvDb54?=
 =?us-ascii?Q?3JOzMtxBTLFD8T1TTVT7N6A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12786880-fa90-45b8-adc9-08dc1ba6caa5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:03:55.9225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvkAVCS1iaGJaC4U4D7Um3eBmuZMF+M0X/uCKoCz6T0tdb8asYvH9hnxM7dlET0hG1td0t7DgL8bEOl2XGTRP06Yhhb7X80LpaounCcpVKNI5fAeN+lIRaIN60Ywf7p4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We have of_graph_get_next_port(), use it on of_graph_get_next_endpoint().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 9e670e99dbbb..14ffd199c9b1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -690,15 +690,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 	 * parent port node.
 	 */
 	if (!prev) {
-		struct device_node *node;
-
-		node = of_get_child_by_name(parent, "ports");
-		if (node)
-			parent = node;
-
-		port = of_get_child_by_name(parent, "port");
-		of_node_put(node);
-
+		port = of_graph_get_next_port(parent, NULL);
 		if (!port) {
 			pr_err("graph: no port node found in %pOF\n", parent);
 			return NULL;
@@ -725,11 +717,9 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		/* No more endpoints under this port, try the next one. */
 		prev = NULL;
 
-		do {
-			port = of_get_next_child(parent, port);
-			if (!port)
-				return NULL;
-		} while (!of_node_name_eq(port, "port"));
+		port = of_graph_get_next_port(parent, port);
+		if (!port)
+			return NULL;
 	}
 }
 EXPORT_SYMBOL(of_graph_get_next_endpoint);
-- 
2.25.1


