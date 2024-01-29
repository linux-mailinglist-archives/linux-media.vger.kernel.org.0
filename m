Return-Path: <linux-media+bounces-4303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EE83FB43
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42F01F2317C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667E28BFB;
	Mon, 29 Jan 2024 00:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PIUDX/KU"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299B53A0;
	Mon, 29 Jan 2024 00:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489671; cv=fail; b=mRmm3IfBE7faWefxBwOVBBY+Q6vZy3Edk+XhsuAtB9SQZWQCBLqTa38z4DhKzv0n/ZCV3fhocA0XSHMGV18jfs4fsKdZ4NksW1Qwx09wSxuUqjlRhuIFDyDahN5sge6H0CjMC6UO7ugqRN1Z9xcYYAQIoERV5KhkWZ2WsFIi71o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489671; c=relaxed/simple;
	bh=eJyh6PH1YNGhWqbld2+4j3eU1miop4tSZqdSMv16bLk=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=iap3JlkLY1gi4kH3IxwCf2uE5C/OibRQlxCLs42BwdbCaX8fllnOsd27zoDmzkx+dUQyfZgID/LUMsonooS12ykNTkDFYd+/EqGwkSswC4/KCPNT5HCXXb85F3x5S3DELDt2NXxN4KkTji0fBFLbLLJXCIIWGlMW881M1et9U8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PIUDX/KU; arc=fail smtp.client-ip=40.107.113.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUDPQ4imPOwAewjOG3YzCjTxCi5ivADM7/fp4AXG7M+O1ahgGNklIjb0OYSJkx8BOOEulzyxK4Jpw0DEWJ8GgQM+p+QNxh+zkYEb5wdBo0dRNHA9pstSWHP8LCMWPHC64ESAIaaqoDJBqpDHJ1uDX8BAYylIMfaf/iCMQ2XGm3RXRlJA7Z1b4CNh5VFJbSAwC40vS+BLZ5jcgun/T1ofUIWD0hGsljgo/ZDGlz82w65rrHuv+YSVC5kYZOnud289oBk6NueacCMOk8vDlw8FE5tUQ6XgeKyXo7z0ohSQbOqnCLzCj1wB/xFLedwv3OlgH56Xp7CALYcfB8c9ToYL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zzp/s6CjOuakOD1iOXfr3m5o1ZgDarp4wdzGsDpngB0=;
 b=CE+Ecp9ALa5vu9kBTa+DQvKeQynv3miLXcG22EQea34FJ+hVKgfpqVx4wlV3tRx5GPOBdu2J6T0fQCvPufLw6kRA48P/ypmS0iP8pSUXuJNaxAPOFmCCPIISelUEaea/4H9FftpJX0nb+s/anMaxKqmteO2jI3VxQdwZQ42UF15qJQ2IWCAJm8jHywa8EAjghHLsABSRiRz7JhJU3cpkb+tyAo24Secy5mw5Qd438fVcUd2Hq/OKVtXD8q9qQtJcMqm55IeEys9cRf2XgCz+LqiSUcyd/4tjxuPVk41f9DKNjZXTFqGfHe9U3pGbzThP0cNtpzl/PA9pLJsMY0pgYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zzp/s6CjOuakOD1iOXfr3m5o1ZgDarp4wdzGsDpngB0=;
 b=PIUDX/KUV48F3HWrY3s86UXU6VLrlFLf2w1noQcOulzU48/eVbFPB0uHM+TnazYhrGsMOoo2pQsMdz0JUHld2o50VEdXaGOsUUcS1c9kMY3QEWOKF+tujVp0g2hCD77i2x9bRpG2SLhMtqqYNNSaVepKGuFhKkhnm/3veFXz9fE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9304.jpnprd01.prod.outlook.com
 (2603:1096:400:190::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:54:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:54:24 +0000
Message-ID: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 00/13] of: property: add port base loop
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jan 2024 00:54:24 +0000
X-ClientProxiedBy: TY2PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:404:a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c430ef-8f19-47aa-af1e-08dc2064d662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	35rXsbHAIQ9G9kCecoXTFM/XUaVWqJevqoa29edEWylnfrphGT+827eY8MFa0EsXi6u7RISNZJTIDjP+MrkfbZL5ePicS9xh//jePKFCZGz2/kIYtNAROJO3PFhPYaLcj6ha0vJuI6ggYRpP5auHNiOOM6nals6wXkSmcvrivH/fup3RRCGSUfu/NtCUopg35zweT8y6vmV91E3T3UQHM3QhhZodUuXQAta4YzGlQM6WJ3szfcaluSQmUPF7tTlLYkG+E5pJSEYmoETxLOPtJoWYXSQ3eroLEAHPtDm7ItGIEcVTQQEZQD8Fdob7N/bj0J6WBx1OhPji0igAl3MCvRilnE8ke3IoKK99QRM35QVVSus7Uw8YRbGwcRuiOEWUQOeMffLvxcaGsIDxZOD6HTwDdlfFWx5rQuAu09Zx7wnKMYs+V3b5U9v6/yNx1AOXYfnX6cQC3w9RSEkjfsM8zHGYPeTbcGj3mk1aeYsnBxPiRNbq6KuDwf8leUbtFVcco2XrQQWL/AGjAAJc3fwVzuV//GpvqSVHaxHQeJ95tojQH1LUEtThAb1AZFWf12XoF68op6lhgGEbn2p2MMjVrNcLfJw2PS5rl1zQZ3Hws/VnVcIFxTMPou3lRj675GYr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(478600001)(2616005)(52116002)(6506007)(6512007)(86362001)(38100700002)(6486002)(2906002)(5660300002)(7416002)(66946007)(110136005)(66476007)(316002)(66556008)(8676002)(8936002)(4326008)(83380400001)(26005)(921011)(36756003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?639FAA8Mnh8oaZ6I6IZGkCjcE66qVdhL5MPY9cNiu/FcXPkR4pCObx0hutmc?=
 =?us-ascii?Q?Kby/it/p2d65nBC/4HdUUj+IOC44/wMlf+7LS8ZSzaBSwvFn7zyRyiwJgGl7?=
 =?us-ascii?Q?5vooFAQvkrEz5psW1A7UMDJH7zwyet1QIDZ00UAvjcU6fPMi8EehKraiyYO9?=
 =?us-ascii?Q?GQ8TxY0kuEOdezgwGyIcrMEi5Rey44l0x//80ELk1WJm53HsBcWGeN+Gxw6x?=
 =?us-ascii?Q?vklXXzdYQkzCr7riQHyAGQlaUEQU2A4iI27V+rbSAjViII5u0WAUPZOszBXa?=
 =?us-ascii?Q?F7ngV5ErXolSMhjkqgGPW8x5KT05hSY986kymseThdY7gt6TAM+6/Rsji8O/?=
 =?us-ascii?Q?GTzWZ+syoJ0LaxYrL4HKD1OBNea+DNQQ6S3vYeNO22RuDR86MokYDGOwlVfq?=
 =?us-ascii?Q?PLoX7OQysFfUshFH/HjRX/BBOm0F+LUJES0lYczMdMzXNZaVgSRr7ogrYx1M?=
 =?us-ascii?Q?69AdHc4bYyEx9u26+m2MjbtPFC6e/odoKmj08LTWnvRzETT8K5oTFAmfqoJB?=
 =?us-ascii?Q?0tuglLheCYqMYQQLQc5zRD1muE7hUrO0zOxx4/VrXUowame+hx2/w5197vGA?=
 =?us-ascii?Q?GztJP4J2+w1HAUzSDoiR+su/M9O+UwwLtAttz4zpps7cmtWe9rRTvMgvNlmz?=
 =?us-ascii?Q?d8uGNeBUxi8q/Y1DZmfKlmihwxlJqpa1XjuCXTZqYOjHFbMdxhd1gRrpgJKM?=
 =?us-ascii?Q?i92vOEK5vLjqA9wf5ymfudCQWhZhQ1ZpIB9hWWzXMUOLYTrdanO7/tnAjryp?=
 =?us-ascii?Q?1Vd0uDvGyeXpSxIykj3wcSIKEjVYIE2H6VRFFCIhh4Qi26AsCd29Gb8Zz3dp?=
 =?us-ascii?Q?ISipecThwV6V3HRfRZvLawtdfWHTVqM7qFiy3+K9FAKL4Uk8YLn5U+aGfIDZ?=
 =?us-ascii?Q?IFFEzwOjWMHrq4mW/00W2yZ8iLQvueej9yDG1uO1v9Ls0FnhFcvicV7NVBpC?=
 =?us-ascii?Q?LmD2uvwXWli4f1zy0dT2ZvQ91wX/PoPNWkMHRRD9gc0TMfCsueQdqMi19T9g?=
 =?us-ascii?Q?Lslq2NAZhNpicgML1d+mgICFt+IgbHnljuRnJa17xCIYqkQC4wRFJw9nd7bc?=
 =?us-ascii?Q?a1d7+eOJiOgYMOw4Ph5FXo2ziyRpmBNCKDeDoH/Ncw6ZkThTm5xXWpRPeI2q?=
 =?us-ascii?Q?S59FuKtcBrNNwvldYQvTJixyiSYzu5LYkX/xxf9uSCxRkue0tDzxJw8QbHfm?=
 =?us-ascii?Q?dHYQNi0nSl1Uo0WwZI8ltQ83zuc2iX6HOkoYmtsFxKcn5IIcOq/SvKOaW6mL?=
 =?us-ascii?Q?Gj4qQT/z0OUgBrH3VnXbZSHVTrcL+/5O3Ykjb3n48e26vlUdN7q3v9yiDeIC?=
 =?us-ascii?Q?29Nu7nVwFV4Wx4ESqg8oTABK1vB1JaAlHhNlX2DsAwR93E1vALVqEcItQaQe?=
 =?us-ascii?Q?rsSP+wgqNKaeuglfyF8V06FmV3Hoi516XcuwrwWCHA1q8Ary61Dexlnrbpd1?=
 =?us-ascii?Q?BOIAOsB9dwQFGaPyNcqIwKGGLyzPe7xVnBfx5sYMCMVncWsH89oGI9Ki2k8f?=
 =?us-ascii?Q?ONhv4eHQ0hmZv3AGz1MNgR1a/wXV4rxQ6y2aQS/2YBw+cgoXlvXbOZC7DZXw?=
 =?us-ascii?Q?xXBSLAX5OPA7fEU4NzvRF8mp1KLIIkW4gJMNiLwjwU/+iFt1XsVDnxZkbeOq?=
 =?us-ascii?Q?uHuT35FPNvzyR3Z2zcvvFkw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c430ef-8f19-47aa-af1e-08dc2064d662
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:54:24.7138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRwLaPnICAxPqs/EFdlrIGXXkmQBVleOKyy4YPorV7gLy7S8ICZ/EE9z5pc87n1voeY0eMwHsLa4kBjK/krKm9HwUNUtDNW3tzLRlwJ39FM25evAjCiDddDz2oVBQA7J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9304


Hi Rob

This is v2 of port base loop patch-set

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

v1 -> v2
	- tidyup function explain
	- add missing header on each files

Kuninori Morimoto (13):
  of: property: add port base loop
  of: property: use of_graph_get_next_port() on of_graph_get_next_endpoint()
  of: property: add of_graph_get_next_endpoint_raw()
  drm: omapdrm: use of_graph_get_next_endpoint_raw()
  media: xilinx-tpg: use of_graph_get_next_endpoint_raw()
  ASoC: audio-graph-card: use of_graph_get_next_endpoint_raw()
  ASoC: audio-graph-card2: use of_graph_get_next_port()
  ASoC: audio-graph-card2: use of_graph_get_next_endpoint_raw()
  ASoC: test-component: use for_each_port_of_node()
  fbdev: omapfb: use of_graph_get_remote_port()
  fbdev: omapfb: use of_graph_get_next_port()
  fbdev: omapfb: use of_graph_get_next_endpoint_raw()
  fbdev: omapfb: use of_graph_get_next_endpoint()

 drivers/gpu/drm/omapdrm/dss/dpi.c             |   2 +-
 drivers/gpu/drm/omapdrm/dss/sdi.c             |   2 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   2 +-
 drivers/of/property.c                         |  92 +++++++++++++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 101 +-----------------
 drivers/video/fbdev/omap2/omapfb/dss/dss.c    |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |   3 +-
 include/linux/of_graph.h                      |  23 ++++
 include/video/omapfb_dss.h                    |  11 --
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         |  31 ++----
 sound/soc/generic/test-component.c            |   2 +-
 17 files changed, 133 insertions(+), 162 deletions(-)

-- 
2.25.1


