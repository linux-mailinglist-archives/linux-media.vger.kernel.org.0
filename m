Return-Path: <linux-media+bounces-8275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89B893678
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 02:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5041F1C20B1D
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 00:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B16E624;
	Mon,  1 Apr 2024 00:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o7Vz1OSN"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41984385;
	Mon,  1 Apr 2024 00:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711929968; cv=fail; b=kVFoG/ONbtfIou5fBZYmnH0sqD/Oy9oBsfmMmF8CXbzeHSXFe8wrtXK804vVvZj93PfAysivNzmGsOvIjVkgmbw78B1LZM+xJ/vPbRyqkFrKwCRf6Nl9JKi41Q0bK/es5/tFHDpZHORk4M0CTZwXkVjoaOIGsTG6qjkvRyF4lBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711929968; c=relaxed/simple;
	bh=ZINEtZHIguufYRnxIhkuLtY3uOIc8zpwsh3fHgJhrgs=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=CJF8ACjrxCAyYHPykq/OOjbsS7T4s5f/Lot/h3u8eebV3OU+APNfP4p0xd6JyEzt3aSYHT50VDh2sPjTPnPWKM/1lBW21bNZnRBVD1LhZZFHe9i3Df9jXDqNxyJ/VIr4JC4oj3pvCcurvaFpRAQ3UUBSwa3MRGmZoIxl0JOPiuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o7Vz1OSN; arc=fail smtp.client-ip=40.107.114.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUmp6Yy1xAghssIHcNdj37atpF2OQVwDdjmAOobIi9yX1um9El/QzljqMHD539mNSPEH753j30qJ+iTCqPtsDxE+QVLy+3zBUyG5qJlLbwPLuq3eQ6MBoc4xr0mJoZ5BZxi6k6dCst6ZaehfJnT6nLR/ypbrreeRyUb2c6e7KO1k5ct4JHY4mnXVWT7Zdp9nkHXTAKf5QMR8JoJJpbEYLIZPu4TvjB7nJ1HBzNUxxAvAAJaCaVR7Ul0gxgt+0Jzathc902QFID5OdXzsiT7xaY7pH39JcN0U1Ze8XDY7jMi1ywRHPifpvoh9HjLZA8+eHHJyBaC45321JkYeEGTBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jldO+sU+/sBHPSf1MLXLnSJ7p7Zlxtt6VMOzEH9xjg=;
 b=XFBhqYcU04ydo0UUiTCvOqmOjv0vNr+Z94NaIF1+1dko1ChAf8uA0TIgpf0tfP5ajuXjSUAsr0LTtIReHHUyYFxDOjyLsXIBdu8ssbxLzhJyGdUyR4OmwU2k6+xEpJBH9hp0rZ8pySbe06QAGnrAFZ/YEeF5ZUg6+XNpmclc+f49YA2qv++m3i/3bT6Dt6y1brVPGgy/QhBw32XuuBy4AKSaP6rGlX5dJJGH6YmeZ2jGtqt6etGRhQnF+Jq9N3rqy6zu8MHhWQIxP4uY7FZRr99Zh2uTaewbwPl8bqsJy0t6f0vfkBIkwfFi/6S2rCtwhIFfElRfH/up77Hk4N1Qcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jldO+sU+/sBHPSf1MLXLnSJ7p7Zlxtt6VMOzEH9xjg=;
 b=o7Vz1OSNBI4o1H79eQ4k6Y8qH2PCi0VVoZPDYRUzRYxohMn8kWgOEa+g0nysfNyz+yW01AGTveAEGf95ldbph8+irxsWBtyVIyd0UcPVT0m0lNvkTemUp5NXtBoEQj/CE5x38jZoH+4JadHkBm2RWO4VRNMszOANrgJqT5hw5is=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9325.jpnprd01.prod.outlook.com
 (2603:1096:400:1a2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:06:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:06:04 +0000
Message-ID: <875xx2uetw.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 5/8] media: platform: xilinx: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:06:04 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9325:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CPc6S0D3lBo2IsoizOVP3adydcA0O6H58RvrwRwfOwQpnLIVn1Q0A5tfCV5IyUsP0NZptyqtutkzI0ZZcezOCZ3gLwNHwsaLMBSDKdCiQBJRDHeJDhRijMKBdrckIgvZg3tg13gNjpEufqhaEMNO5Brrn1SapgaM2kCbH+CZOwqR1rSG76Ytva67qYMA6/5/a8Rzj6tb1Bc6Jms9gA+lV4adz/inRKs8hFB/WwlNQRD2eOCVyk+eKLDSZAEV9Rydz8SAQQ1YUlOr9cp7NWwlwPx5UEB6ao+x8ZSVzucgIFcygRCAgCs42R14ARc1ZOq64GIc+j4VGtJb6/Hj0P1v1m7F8Ye93iSxoY+YcGcTSgdfg2oXFZBX0uAA2gOG+QsBGew2WvZ8xNh2bKuSY4eAWolVvrQWcNTyEod1pwb4l91St/eirUAcLgsVTTArn6dXePzmicWRgu7b/OX/fSWUsuKguo2GqlcQPHneBLQDtPtbJCo1bbkKSOrT+86/dD9ZO0yjQdjkr7KjyyZODUCR2gOpuu15AiOgEvHiyM7K8U9zRGZpkjuZJzV0mJphbjngiionZZts3EMXuIb9FxVreI/wSdOerVdv3+AQ41zKCUf6xGR3t9zndGfU5BHulyyHyLgLQHSaL6JhhM3G2mmRTuXfIBP+xuXHx9LK1kU9VbJgjKHeEzTH+Xv6IIxGOGj2hbjdFzZ/JIL4rA17wuK9pKo+mrFMjEiFtv3oWTBK1e8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5EXukNg/qMjjPGtOoSkBOHzHvAFuPPUdKYydBUmT1JHYkFxD5v+tkb86gtsV?=
 =?us-ascii?Q?+N9B++GlW9mG3ZDQgl3FejwgJIPUk56fHoxS9LN+iSFoX9yU+bccVmjkIx6T?=
 =?us-ascii?Q?12G63ABLXsvF8JmyI//PK1gAakoBAyhBDrkI3zUUw+YKok6s5AxiAEPOpbrs?=
 =?us-ascii?Q?48dQIHxJnF+uf5nluQufKlQMB/7VGYIyDFyKHhXxQ11iHJ8cOPvo1wP2VfV9?=
 =?us-ascii?Q?fTyazpxvVy31FEOX1wLrDu8eRFi5yRWq7NzRJ2pMOkF6IjaEFMKbtav97/uy?=
 =?us-ascii?Q?ENZ7n4Q8smkiV7IHyZ7ZrUXWHyXcehD0H7B6lLKZnC5cJe9kiCtoXCA1W25R?=
 =?us-ascii?Q?32Lkms3iEsOPFjoMCWa2MYI+k9/kQkxn7TkwgkWodMO71CKd4Ro2JKBJp4St?=
 =?us-ascii?Q?kQxRBjFLGMUwGzyBQdpUzjxJImdQw78b3gRYI++x7WW+S9g0EKnsOn/ivrGf?=
 =?us-ascii?Q?gz7EUuz/g0TQNfROvGqL/NsCXfvgXmp+Qg8q/j3rdeOVu5zGvOF6FGp4lLva?=
 =?us-ascii?Q?NFVhbNMhLd3YYgzT4GLvHV6FdPuM6ieo+iKSmMrxAtKXhdwTKE75/iVNtEmQ?=
 =?us-ascii?Q?dBM3HniSfoFtpwFToCq3vP47rkiP1T+1t8IsmThkN968S+du2WQy/GqVgNsG?=
 =?us-ascii?Q?x08HhkTY8N6xPHNMTH0GHOdhObCzCt1AXZAJoauiT3jdD2euM5nIIjbuMAqi?=
 =?us-ascii?Q?MhJ4LbDlubLAL+AShGxfnZiPm9Z++H44AV9yPeXKmvHVOTqn9z4B4O37rTQv?=
 =?us-ascii?Q?EjP3Mqjq1WbT4JfRKZizxkIwat7SN3m/ZXjwOLGn4C7sOUJSc14A1umv4f3+?=
 =?us-ascii?Q?nUzXcE0q5F2Fz5qeDhUNJH2jy8G4R+Wv6tWFeliorSZYaVK3MCZGs5uKh5En?=
 =?us-ascii?Q?4Sn9BRJKKEv6umQvj4bA0x4oLG8ZBoXNMiRX/69RUuB55habbx+HRJpvEUBn?=
 =?us-ascii?Q?r9WxO87d47eL8uidGgU9OXAhmP+83XIKO4hplDHpjzxlB7Zo0TC9nxLHqnOm?=
 =?us-ascii?Q?M43Owwy83NZvFwF8h9u247i7H33yJIaXYACowJnVMzaYZg6ALqxSd7B8pLc/?=
 =?us-ascii?Q?ytsRxXSsrWIhN8YKv2mgWqF4saALEv8wwPP4nGCCn3ku2fCotApXUdMvLwBs?=
 =?us-ascii?Q?nrjFjmcZJpVOF3zRAP50qjzaNuMMsq022tL1K6PhoIFgCqh+R4PF+dgCOxyz?=
 =?us-ascii?Q?x0ieWI6KW7gekLGQpE4+ELPoXSz7fy+CvgUYB6n573sqeXMFRLLmZXZOvSyF?=
 =?us-ascii?Q?WopVybplk85NpqjcFkGcwdOPWE2GxNlq3qIoF08D6lsD66k30bsm7Ag1J5Yu?=
 =?us-ascii?Q?G3Gar3H2yMKAP6vxal1m97b+Cla7MtPxwyO/oljLCrDv3bGeqQk+PhoknUxS?=
 =?us-ascii?Q?63SvuOe3zNZj/IrZeaHLP+uqkVILY1bUvHFjMAmMRsQKL8nw5x1p097K2O0Z?=
 =?us-ascii?Q?bZoDCvh+ufq8I1RUcpJTXZ+LxjS/zyMO36dgYLPNgOp2l75Hl6LcXQrXsSLY?=
 =?us-ascii?Q?+YwFFeRjMtIojpoMQyTSkZc9zEzqa4ow8JOpvDsm3LkCEk7SO7UJKEbDh3bd?=
 =?us-ascii?Q?94rl/n4r2kBUUP6Q6rN34NhqTqD9ESYvf2W+a52wMwe12qqbHEzGehoaQ6KG?=
 =?us-ascii?Q?GdP7IgQnQEifwc/OwOme/wk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3476b72-21af-46e1-25c6-08dc51df85b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:06:04.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2oXrINXgryTchUmdB6V/dgfJd/WMF1TBBPCO9Ms+PsQ0NEuHNlV/DAameHrm66nSjTkFsL2OkLgRS9Ar/C8DdscA+VDB4gBBPk+aYnqX9uv/fHOybum8VmavpMrybD2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9325

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a73038..38818b82a575 100644
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
2.25.1


