Return-Path: <linux-media+bounces-12118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7A8D291E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 01:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F98D1F28F1C
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF675140380;
	Tue, 28 May 2024 23:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WNLiEToa"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2055.outbound.protection.outlook.com [40.107.114.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956DA14036B;
	Tue, 28 May 2024 23:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716940551; cv=fail; b=tqbr7W8C9jm8yMHSvwqzHmMIoQSeLsibdjN0ebcU8y/bj+QSPIY55brBfSU1Qs6Zm2BQ26lnUi0vWHwoK4SfwKh2/Bq8fP0PeQ0W8bQbsAV6OhluXLDWaHkIgC6gmLnRDqDbku7gK3hcfnk5SoGkIewxYQgTJvIV1DwYmu9NBWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716940551; c=relaxed/simple;
	bh=yGo+BsQGRKnwEm9qiTZtNNtiUEVl++DslquQ1Sv3lWM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WyfQUdjPA55NE4Jw9042MoI17qx1tpEuU39towo/DU1YqS9sSh3qi5jb59wh4+iFxl3q2q8ANBVU0XKxEx511LJn+gwSf/PZAgqsA09FUXXSlXdyndQggehj7wzi02aOE5TKZRxzigt50hDYJ+uXLXS7tg7jHYxHqMMY/SfDay0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WNLiEToa; arc=fail smtp.client-ip=40.107.114.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV7Iq7ttIgrPmDYiyzgN8pW2Lh2A1R3tTmDhdny2oYDP2aZ2cdRi2iyGye2YaHLlLns+0wBvUVF8cHiOeAE/oJwh/B03GZ322p3KeLvnbrGSCyFvCUzm0+4Sl7zVAt2QEEyZAWduUPqNnE+n0MmQMr/bvoVfBgR5xY+VxFtbueyrl9XkNGzQ1JMVekfrVyCp4LuiUO5OPy/bv6TlfhjOxZmF7z1EIDbSftkH/uS9EDq9ttIHopQwKynpqhhiW7Q/JFgsh992w45AxNxO697CZvc5C1wvchwJxi7Js+L40Byp15JB4TChjdQwSp+1G6jIEf/iKgz008M8yK220PpxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzjyWAJSzgkqfiftCMVNznL9IrKEexue80iK+S4V1n8=;
 b=WIBpUXq+4VEsAHqFZ4zlp8waNLqnT7PSaqQ7w5nogzhzPg51FXkLfn0NilI9yWMDAL0Kc+aQvc/ae4vk/1w8s7Xl+ul4wu6xrUEQryNVFww6TQECGprtECWyzqrvwb7QQv8xklUsX0dpbhvDsNDmvBQBPc8kWKX+iGtf82nnKT3SlpwiRJOFZIrkJA8zgbt0uy7h+3l80sA6CSi7bh/cN7P3zX1a85zHDn+eHNJMw2tLOYran8nCpxDCpLssMNpEZDLBUOpN/QHN8EHZKC9ZUFkM9OD1DfYA/rW4VEpptlXFwNK1bPoY01R6IkaKNsh4vW+JYT1qttay8ycK/I2uJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzjyWAJSzgkqfiftCMVNznL9IrKEexue80iK+S4V1n8=;
 b=WNLiEToaYBgVgKrf8Oi98f6duA9JEF7eeoh5k3GopGhkTWXIs/m+AmMu6WqfNjsK/v3z0AAIliHBCkW4W22+08cOAnSR7I0qphtoK10TjeTTndAzEgtJhkiwi3nrGqd5GIcmS6dG1PE2GTuqsPe6liT5fWBOFz8ubINqPrKlMNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:47 +0000
Message-ID: <87bk4p4hkt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 5/8] media: platform: xilinx: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:46 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: c81909aa-4e1c-4725-8c9d-08dc7f71b1a7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5n0bnXX8/3ktsdKvB2uf5CM+QxNVFTLCNolzVxUGlNoSXZMzuOhrY3J0WXou?=
 =?us-ascii?Q?3srAW6W6g+R8lSvGPkGoOBkfRLHGC5o3zKTJroXrs0snRczcc4at+QOdMAXC?=
 =?us-ascii?Q?gvbkweU+YxigcPaO4T667hOuWMdp3Cd7mwoMFGvd25gaCmTq2ORhQLjrRKCS?=
 =?us-ascii?Q?vDzB42U3YBnIRZQ/tuoxkqTqsNFALO656xmO4hnWPd3On9imnZqheEbFDihM?=
 =?us-ascii?Q?IqPmMVHSfHIYMbJQJmqtmlXpkTCrSzzjhbVgtzKo5T/bMFXcvcD5NcM7BD94?=
 =?us-ascii?Q?kxqW1PLv/J0T8ipl9GKQlUi80UNT2HBTTbzR/p56b0/voXX5E0iJbNfh5F/h?=
 =?us-ascii?Q?7Ua96RAq/5gyUE+q/iXWFRqTlCwNC9PpDdfeCP2SSUUvRgRU/V1zvfDbEtfe?=
 =?us-ascii?Q?LYjcosiiPsEcLJvpLphWtUp50BSWkqXPoWSNfZzRQAJHpLIZmYuUZpeogG24?=
 =?us-ascii?Q?OYdg+mcC/LTeJxytpiOtPhlWqedB23WVg4c0GMQmMjErK8STNndO9V1//Eks?=
 =?us-ascii?Q?V5i6ydJ3wDNDGM60Xf90r7/kB05gVbogQflqaR1J+CRLI/51QNjy2OgzUsww?=
 =?us-ascii?Q?mdXcuBXP4UBBa3IiI3DX4jTlRgs3RFKMEb0MgCBEE/UW2oywBHtN/VcMET4F?=
 =?us-ascii?Q?fTbS3Ax808SyMle77AIS56smNdgQrsNeWCecXHRMmOAGK0KglsBIw4ClB9xg?=
 =?us-ascii?Q?l+KotN9KOXfutYkKWFQyepXXf/3HMhuHa3hjbRUWx4MK6N59CTflMkAIt4Yi?=
 =?us-ascii?Q?fu/UUhi8IqeW0kxRqSlBNykIMC0Nk0u/9Fcc4NVjp1J7CdeQ1aMtnaiu8TGf?=
 =?us-ascii?Q?rugKvO63sAukE6U+w0XPIFsQqAfqXGLvSaabgIyJDBKyOk6uZcbggamGb7jH?=
 =?us-ascii?Q?QQfZ28sO44OAHSnPCpTCI+PO2QD4B4CVqLxzWIC7sTLmBMvigfdFD0M9T9rN?=
 =?us-ascii?Q?MDbzUM14eVL4g9ORxkPaiJo7gS8nNsMduaxWR68JV8jRlvZNkBakUXcF+RY9?=
 =?us-ascii?Q?N2PO6kxOpFxh/BkAY5SMelLAgz7dAKxvmtgqcMsBLfGeoEXhQ+UMy+vL3GFP?=
 =?us-ascii?Q?T6BrDuOcDsDo7I0dyurQiiEfYgGPbELnfpm9+VD9oIM658V6RUhoubyWXdLL?=
 =?us-ascii?Q?iR4uuwYv/HhiOqna/rAj//CigSQyQoJJOMeZWIqKNLbNklLFHVTzHrhifm5h?=
 =?us-ascii?Q?l20ese2uar56+g7RFwt5obVsNFRomcrh8bWPKX3bkr+TqPyxcKigd3AUN/dv?=
 =?us-ascii?Q?E3Z8FYeXzAdLalzud0NMILEZqd/3K8YaCdNfRF8FWXc5P0+EHtFAYL/fxfIe?=
 =?us-ascii?Q?hOVonKV5MCRxQjLsvinEH6/zG7CkbPO54RwawUdDl7mae9VrsgYGXPtLP7KY?=
 =?us-ascii?Q?j9MtiME=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AZEv+CanD469tSYJ03SPL9EAoY9eIZ9psDyA+kaundTjdaiScJY7BLGDC+qX?=
 =?us-ascii?Q?8UxwQP0siF9jHkEPxVoPeloXc/s8xMSDLzjvN0JvPtzrOcJND3n0vDQfv4NZ?=
 =?us-ascii?Q?W4/hJeIsmium0sCvao9rQZyubmFLIqNq1Qx5ZvWrylD/u/FwHsB/FwVkuUEq?=
 =?us-ascii?Q?MOwbS9S/1qz5hkbmwHJoVaFdrEgJgCvAe6ahnE0fHvhB3zHZuCjPEkz/0niu?=
 =?us-ascii?Q?LGHz4uvqk68p40UV2CcihOE5+MD/ZnAr+SG2PbhaO95snnZSa9m15VBcZa6q?=
 =?us-ascii?Q?ILK0TIbm6FipUyTW5udS+8xBmzMpi2Xff1Z4ApnrY60H5hYlDNBjz016+GVC?=
 =?us-ascii?Q?uwrh5x2abG3fp7rFqbrg+wbMopv+k3Ydyz8fPWrPqnYknwLllkAXeDrZXgyP?=
 =?us-ascii?Q?WiQq1A7Ep3g8vETLSQ/v3S/4TVDLhwiPFxUkdPFLXQ7iGmAEJPDS8MCqsaPl?=
 =?us-ascii?Q?n4Tk9eDeWz0cglzzA7g75cW+Y+cfF1EeislxIJ3JUZV08/KR1L7wzU3StIM+?=
 =?us-ascii?Q?oygS1fHy2ClW6akI/MXG5lmJRd8wzl933goga6z+vXvW826eMcGw+0PLBzSM?=
 =?us-ascii?Q?W70cJKeLVAiBapiy8w62mnA70zWXY2XNQHnoCiyj6CRxrSJg4iK0ydhwMucR?=
 =?us-ascii?Q?Amos1ac2koYpHV2IDxsnZHAxc0iWijl9WpRcoofsoS9GHDrF358qwFgmNLAM?=
 =?us-ascii?Q?nCh1jo2ZOdOci+XEITnAQg+s3eDjMLMCbtCIRPhM3eOByxBWN45rSsUXspDL?=
 =?us-ascii?Q?h+EyDPItmMdl/mTuZCSb+aqpvW0zUDdPyNAd7+Ks6JkXnZ8rE5qBnwxEtYYI?=
 =?us-ascii?Q?q3v5iv1PM6KFpiJEb8tB0PPcmem1gj8qs5IcHURMBWwLQfpldIQsGxBu9Iqr?=
 =?us-ascii?Q?3iRc/ftsOx0QPENU0ToX/AqHDplrSSoiProOlITtgun3Hu4DK8oLX6X5WUHk?=
 =?us-ascii?Q?fak+cPhiwqk3Hx6i9W547qJcupJvKmIShbtg2EuuxdTWJft5vLkF4K/a4+o1?=
 =?us-ascii?Q?nbeUwui4IyZDahemiSR0YYiAjOLQ2jAQWqgNE2ADwxSNQLOh8IP9SLQUQkES?=
 =?us-ascii?Q?ReRAlBqIwMKfLTLOq83z9kofKFtAurARmcL1ruzOYXa2kj3YxVLpzADPHXvE?=
 =?us-ascii?Q?AMjoy0feKoP8CEZCDfbIsW9Xky8iAXlbC5dSwfluR9/LeTnBkL9ZARWoYZG9?=
 =?us-ascii?Q?Su0mp5KnwbW39ZL4mXG11C/qPsUNFXXhLwJJ/jDUIgOdAhaBimKtvCWE+zWH?=
 =?us-ascii?Q?Di0ByICsaGJV94LSHK3w/3Zrn4B+pHBwOwQ8qCOfzW//V4yn21JRkBbDUK4G?=
 =?us-ascii?Q?dOtxz/fWbLz2kt+oa9FfttD1dFy0GRYT4TeWVAMpsx/QrgePVvVvyIu+WmcT?=
 =?us-ascii?Q?iM2kmUUZnnKbQA6/fpgZuBrWA4S1HDcZD+vSWzJ87OEje6HB6MUcDpGu3WeJ?=
 =?us-ascii?Q?iRkZT8QuslPqq0gEtTPAlkVdhLucbELjxrqF5P3NqGius3ccYuat1p2cgWLq?=
 =?us-ascii?Q?+LN6XYDS5jFBPXkjikwF4UdB232zJPDind1GhXtKukbENZa0FRYtevOwizVR?=
 =?us-ascii?Q?pyhIo+iZYiqcI3APirGfZQQ3KKHknOnPF4WMu9s6YvnbqDnahCnac2k2bhxn?=
 =?us-ascii?Q?Afg/Jai+ZiC6qa+i58O/mVk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81909aa-4e1c-4725-8c9d-08dc7f71b1a7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:46.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6DHFTtlQbQ3dMQJwmp0l0Qjm7dy+RvsL4YedZOS4+9jFonjQhYUL9NiZ3SZG2j5gvx0EE1W63T6+iQ5dqsfmFKmcmG5k9UhWgR4Glzvtpv6WyeUZB13gTGYpbPaV7Dn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a730383..38818b82a575e 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -205,12 +205,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 
 	dev_dbg(xdev->dev, "creating links for DMA engines\n");
 
-	while (1) {
-		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
-		if (ep == NULL)
-			break;
-
+	for_each_endpoint_of_node(node, ep) {
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
 		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-- 
2.43.0


