Return-Path: <linux-media+bounces-4312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF883FB60
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC56A1F23111
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD51D2EE;
	Mon, 29 Jan 2024 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IQZ2oXHL"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D03D268;
	Mon, 29 Jan 2024 00:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489735; cv=fail; b=Dk8ODlFtvSc/sGapLHQqZMLKaP2n2y804p2C1RCVnLLlV1l3udpRjVMhkxUonpESJbEuiGmwaEMa7FdL52hnr036DucaIbSqP53LH8kt27V2jEQkjVg7b/X1ukq/URTTv3/SqobDS6IKIGB70P4q4pHaA67StWySS87AVXOXTcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489735; c=relaxed/simple;
	bh=2BjPQdIp6UHDlcmv00uBrxqQJzZ4qHWJAJniszuCto4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DjBZP+KGlc0tuTDYQ9i51Otbwj6eAT7dX1t54326rpXkw754zJODWFlG2pvcOPhpUqsvT4PR6hNi6w16v9oKk9VwFUCmHNPihW63DyoXwlEC4XGkFDbQzuXY5y493c2wxK8DlRr7nO1w/ZI56mlOiv6uxBxcxW6Zdu/pjRviYhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IQZ2oXHL; arc=fail smtp.client-ip=40.107.114.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2XUoi8XANY9vfNRf7FPzqdYeBB72Em3kw9fxVoRQz24UdZb0DI1jUvDIt5P3A9G/XSTl5Ddj0gi4cKAdbb9LiNDsgi/APAuaLcTAyhqpuJBWIrpJf1Wb0DICTHrWjGcgWWcRthL/WIGV0+mUDkB7i1QxA+FtdmvI9MES3+zHle6kkK3hB8EIp0mRnGAc4Fjh/FNPdoedbQ/I92NxfRjGRmVSanw5LzBeAO5/UXg9GDqgXlr9fPq6iMb1yfsCZuvh+z/MIZT0HDN6ke7CDPV9falz2TYLi4IF3uQusv5x6gS+3Od0tfNkdzxJmILb8PbXO/tararTSFjYu2TZWsKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB8eKp1LM0RONSWqEImVz5fkdtmN34mzUPQSse4mj/U=;
 b=NVbC4lhFA+/FIJcI7wL2PYL5NvMgAf1a8qvB++XoyJ3lMhIl7cMsCvpv9UbXpSbByODb0rYwhAmsQwr9b2O5kR2v4y3IxXRw97ljtsglJhpXNiw2FSWxuQLffKBFFJ2DzlFbUJoYcLwQ+PvieoOojtGMCfbXYzHh7+UgmhHrTNMjVBEvVQOeV+w+UuxJo0k8ldCA9Ue6ROVBT7dYBZ5avgLSD1PKzsaN3M6W5fOqQVX7DQ6+i57RLdB0hu9mLE2KyI0caZO4r+H0x85vLzhsRSPGJ/1IFU1X3/+RDYYTpBgrtxoqrtnqq1QAsKgKYYQlKibLoTEmlf8uJsOlR2anYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB8eKp1LM0RONSWqEImVz5fkdtmN34mzUPQSse4mj/U=;
 b=IQZ2oXHLSyDcCDw1msbdI7x/EPOvIp76nTT+j00PuR+JGk2TvIJ7XubytrxGtRHhRCb3wUsdAu4fq3zosEnPU0Tau6zbJaa7JAdd+m6FjYyRtFidkeNA/5r6qgRcKpxQV1OjoZnWO3QcaJUZgSX/QgVB8Zn/xo0z1miorvK70Qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:31 +0000
Message-ID: <8734uhklfg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/13] ASoC: test-component: use for_each_port_of_node()
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
Date: Mon, 29 Jan 2024 00:55:31 +0000
X-ClientProxiedBy: TYWPR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3bbee5-d5a8-4567-2962-08dc2064fe56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A8PBvK7fHSt5ERef+OcoLIqJl5/xtmaX7UcJ6olB9Ht0HrekZq4aZ9fJysufXARpMIBpB338pZOE1aHNpfEs8e0GmTwaDXF+M2429dN9BAkMISeckAQVQUrw92TDNFM8/f07VYCtyWwi2jrmklh0ijEi1aa2UAsv3/EqsaB08sgoCGv1Gt2lYQxnciMezTVbR8t7ycgVfurOMx+3W3v+kjCylMDvoBM2jfQY4FgwpXVlhuQMjo9e/SYX1dVAYWrqLwWkZbRyMEGgSbotRUt2aEO46q9F+Vo6QA/T9kPQ3w1Zht801hyQbXhUiB9N18/mnX4BGcuWtggBlRTAOqXgCyEnYR5po3kSae8y10jNUjydV6NOM8dGPHAABig2X+eFyRJwxzDHENtgHW3S7MqrLlQJxR4AWWrY2Zoe2cZ6xO3Klbg4bMbBq+FIDUfNHbsjqePwACvxn9KDgE5bAft1VLh6ZH0CQG4sl7Ce5eRWHFWXOlxQRROi8j7dU7tiKkCO+eA9r4MdwLztdSMVnEgjCDmyKGc7svGhV0ChzUN155Cn6VVWzcP2CHXG+6DnHnqr/KFj5bTmW5XyCJqvzoc04gOfzjMFE2H95+0E9+r00dkPRbnC/RvPYI+RlxlR/CBQgt2ISMIm5JKX8hJp5BF/ZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(4744005)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9+6ixCgkCAMKmwaUXm56kB/3PNc+lkCarP07aMD+RvgmGi26724B2RHR+jfK?=
 =?us-ascii?Q?XFt99FFZBAOsXTKr6+8YokVpvnVKDk1TECoQAwLqkZhKg35W2x2Q5Byg4rF3?=
 =?us-ascii?Q?w2maPIyfRi99oT6B1AIACCDm8VNavbPfTgrUI41ei4RJ+wT5r9yRuKTN0JXg?=
 =?us-ascii?Q?Cx4TB2Laf9N7xhWx3oq1JPygUZyThnqLd5F3BqGIi+WF4U2ZNNdpDu2bdxHW?=
 =?us-ascii?Q?sdIEhVPjlJrljXTpHDg9D+7pIpuP6PcRlcREQpbP/o27slBAKlC3WlrQel4x?=
 =?us-ascii?Q?3cUErdd/YLeN7PGGoP4iQm8YZw67ggfc72Rsv2FsgMll+V2WAgNKzgGzNxsm?=
 =?us-ascii?Q?T5UB7XxW2Wi3voyDnGCD/mYwBgV2dkduMfTqfknKp/AYEAdnW/k7w9iKZd15?=
 =?us-ascii?Q?phVemAmxdaPL+oexZDGfd28z2q3xHULiAHs9vHm9XUzNICoAV6PabCTHswJm?=
 =?us-ascii?Q?EQOJu3lHI2sCMfwOdEExurIzrMxLiJbKX4BjXOk7KvQTJQF2iO/eOqOymH3B?=
 =?us-ascii?Q?qgietxgKZGf8Kgq0MGEp0a38xgtEaG/Qpm/a0nvqAqqjSHJOt1N9gcAeN3xl?=
 =?us-ascii?Q?DShx1JrWNQsXJVQ1GXfe+3S63aR1eAHG0KtDBT5miG3R1IDmZK6gD8fBzk+a?=
 =?us-ascii?Q?Mo9jfa6a6uCGEFADVWIwiv0hn8H+tPyMOdF4NXa/2FcGq+eV6jgfub2FKnZ9?=
 =?us-ascii?Q?G4nHToVXl9FBhGHAysEaNyZwKpQsOXuqJhQgB4LR4t2N8PZhoLL8nCxCgZCi?=
 =?us-ascii?Q?OdLPMV8lURMdQxaJRry1ATKmVQ5e0cDU0t7v3c4Lj39A8kFIRUuKavDg/wrB?=
 =?us-ascii?Q?zb1/0+BIdJTfqEby7yoEEddkZWQM4wjHZRthhlgw8lWfPkggDEvqbUFLjNJR?=
 =?us-ascii?Q?8ZNyS7Wpuf1KzS0eTaKK3mRXMiC31SRKKD/RM+PGh4WgPbbGJ4fkKD+zbMwr?=
 =?us-ascii?Q?VPDkwV3N4a4aq6vsm8yq2JRTylb/178U0pSh2ECeA0+e48JoqUoVx2U9OiP5?=
 =?us-ascii?Q?aJQJo79K8FdpsZGrmbY7etga90pGHZSA28m9P5u67y36JK58Y0gz4xrplnIw?=
 =?us-ascii?Q?88OZSdt2yDNd1Yiw97gIg7zeGTVvFA9+6d3iXyxbqqEQbiNEGEcHFIfpR05+?=
 =?us-ascii?Q?z5r5xRgbI5o/lDTt73Mx9WWRzp2OL/7AEXfhNze5eQ+Bw7IdO/nPxE52g2MW?=
 =?us-ascii?Q?uTvG9j1Rkf7Y4/9jI4RmjTGYubi4ENlnH5XMyaH/aI9XDiEJ6EKpKeW+cucJ?=
 =?us-ascii?Q?MwabF3X+SfpNUScXbSM9nV3n22+xeJIsg++LG6ZEuK6wt3U5EzUmUd6rZeO4?=
 =?us-ascii?Q?iNiaWDP5hWZStAQqJaJmQ7Kn/ZPlOhWsfx9jo6YWHwvgRoo/RsPbo6t28V19?=
 =?us-ascii?Q?atNtVpuwUoz5IMjVozc7993MkEB51EwzgVwTu47BOrj+anPbguXWNmA3D8mP?=
 =?us-ascii?Q?Bsv3w3/2hrawgLUhDP0DvWhBydSwZmfHJci6Vj4r+4iVU2LEIMP8H62de21K?=
 =?us-ascii?Q?3X82FqoxuNrMWVvr3Tm/WmCQ2/EyL1urGLySITbwHjQ9Xa5rqzAYfHvpFAP9?=
 =?us-ascii?Q?Ue2VZSBGl3LrisBMqRDfw0HdumWUNJLUzeLIMS4pKxPtW9LIKUSxdPMV3g+V?=
 =?us-ascii?Q?lsrylUnE2D5lbU9yjH2xh2w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3bbee5-d5a8-4567-2962-08dc2064fe56
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:31.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dodn5/r0YcuPYr51l8Q3GYSgIlnREzm3jfvXi7YYfy/C5GZaLDVyU5UhW9Pe61dNHtx4yw9U6mdBDSIpYWL/WArPoYnBckOIJLQZipVENPzD8acNnU4bVYQpngYfisME
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996

Current test-component.c is using for_each_endpoint_of_node() for parsing,
but it should use "port" base loop instead of "endpoint", because
properties are "port" base instead of "endpoint".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/test-component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e4967540a2e1..4bc83f141fa2 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -600,7 +600,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_port_of_node(node, ep) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.25.1


