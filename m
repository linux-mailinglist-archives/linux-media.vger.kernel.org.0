Return-Path: <linux-media+bounces-15493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0494026E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37AB1C228B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 00:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDB010E9;
	Tue, 30 Jul 2024 00:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bH2kATYT"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549517D2
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722299696; cv=fail; b=HSBSNNJDaWX98aMkkZa4to9AwfoAA4YZyHeJUT2t5oXLX+xYUKMkeEE1jqhd7jM9oqHWaCWlFDnIOpu2iplCQ/lCCDv75wKeGudoGIPJBxt6fZuJf9XIPxP6tM7/+L7T4X0A5fHO7FpYMLssekCas0JBGQzOThz2WQt/tUsv4Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722299696; c=relaxed/simple;
	bh=wKjEPyL1kLmEa1RWUv0Xk7JzIG9DlELiQlr9OfVxw3c=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=SxKDuXUnSJcCbI3xRWYlJtvoj0ZBT0KS/y0ttxdLT2eDNhXPNH6CSxK5GyMLc9dkl8I+b5uYMAs+gVXUqKZty8comG00mrLfPcN9NPiWWzwDI43eu+43AVGgrwvjLus9tMPIrwWrVjgMmm9LAzJWKJYyoKsUNdPu3IEInPA0S0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bH2kATYT; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvao1BWD2N9z2uTZKfeB8yhtYb5+rYbELlSR3JvHWIYMCcJugepiM8ijs/B76SAk80CUEobjIWxSeUyNc5DUMJSbU9F58hVMMS6pc0NVqH0KgNiMu1jOd78h92rwcbg5bkd5s37bp4qzNeQ6cvE6v37LtJCA9hFgZk39/of0SZoeLWq66HNm38Q+QZP3lXMHPCKUDAEQvFf0iA6b031av3d/FEdey2VdGL3LOWyfWVZUWrddEHFEM5X6PMp/go/0EMrYF/GuiPSTbo1eQdhRpbleioaw3e45/560Kx4E0MZ0NQfr88i4K3ioO5PN1H/6x0xd2gbmFJ8afURWKF+5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=Uhjc/rU6HhS+QKC5oBJuBqp1dIcfL0bj6T3y7wq6hCwzAXHQ3he99XcJINYxSuX++WxGSupHJ13QQ9yIlD0tsFNtwclJhKdYnehEOydT0qt0Q7AOMKwNFtTD0bG566p0Y+yLUIgYNnUj9Nmq/ZudcAAwq+b7dmNjh5qylOHdEaKtpAFrZD+zTV7zZPbIpPXgMfwQN+26wEqFkKprcFLvpDw81bbxxr+brKtdzhJfBWFf2jQtSQFQdnCSx8jKDDwVgfllJKy1j3HRPIIDAv06rPY1Lzw20G4iVzOk3Qx2pJZSfuCni5H6L+nDTI5cqB8hVk1Dob5Xy2gCkXW3IiFJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=bH2kATYTGTGycMqyPaJaQrvFRv0cvxTja7s8vLmM1Z4iJjl1wEqkUARi0jVbUtsjOiHKAXlOUWY//57RqzSuxc0VLfGQS7B9LVWEhvTmEuieedZbQ/ZH2UNm7dd9/PXEG/m2New8lWCXkOlTKIFOt/90mqPdehVuAR/ezoFlw4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6972.jpnprd01.prod.outlook.com
 (2603:1096:604:13a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 00:34:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:34:51 +0000
Message-ID: <87ikwnlnth.wl-kuninori.morimoto.gx@renesas.com>
To: Eugen Hristev <eugen.hristev@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] media: platform: microchip: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 00:34:51 +0000
X-ClientProxiedBy: TY2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:404:e2::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4121a7-8776-49f4-f7e3-08dcb02f6ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZoH+K2kqORPQtErr4CsK2PMOENrFLVV4fiG/YdOYgLmQrem9erfwBksbcf3k?=
 =?us-ascii?Q?l13p2tsGSs7KtAzPRg8NzyvySIciGvoECJkpe1pprr6qJHUBF96AMn9ZtbQE?=
 =?us-ascii?Q?o56/g11BvWtLQAsnUniKNVxxF+JooaB6qCkp9d0KWLoxXevj7tAJlBv6wIzJ?=
 =?us-ascii?Q?g1+GyNdRPjFdDTYC6IBu1x4e2PwPh6KoTerSXscRz0V+qX4FF/2OhhQcKNSl?=
 =?us-ascii?Q?s7WOxEtaxM03/8C3lCqqYYiO0oCHJ8M0KhwtHZzpPE4jv48qN5HlEm+MDg1e?=
 =?us-ascii?Q?iga1xYT2UrT6X0H14sgKfr9UdEbwiiZ90cqlF9ZDmJ7r61ufUsPjmszB4ucx?=
 =?us-ascii?Q?4oLvA8RgwejutEahhIMem9/VSjFFjLyju+za0mpwgsPbepbllZYOR0DopsiY?=
 =?us-ascii?Q?kDL5Ro8b5E9pH1401qrK49xY9iWTTIiA9i4NgNevRivJXWmOxe1/z+aeYjrY?=
 =?us-ascii?Q?JQtLgxwCX/szhMTmX3pXF43E/iqQrSpIOKls8Bb/IH1I9WOxYfTA6ZicTnuQ?=
 =?us-ascii?Q?besqeu0I4Jgu4SG2tyLpAV6aJGiZpSMrIS4kvL8JP7ghih56xPDpKzombOu0?=
 =?us-ascii?Q?EJOq39yS7bxhkwklXjOyF8mMdtlPdYQTsM1wVQNQnOE9SOafG4XHcMztYir8?=
 =?us-ascii?Q?fe2g9LWulrnLX7KbTo6QkqaPzRleRynOgAZ3IntDFHKDlNiNck6zEk9B0C+j?=
 =?us-ascii?Q?KrieM2mBkjOTUPBYVGMxLPt9BkiWMDQyhFGdKmhbbkEeBberA3u2KHVt5dDM?=
 =?us-ascii?Q?PzzGACwMxBGY2gac8WJNWvtCdV8vGui5xH1MDOt0I7iiDsl0cJeiztivFnqB?=
 =?us-ascii?Q?07z5RKBqGLMkZDemet5fADdfyp7L4HKI8kPWe6nwPcMHnvSVzL/p4NZod0+L?=
 =?us-ascii?Q?p8258sydbEMuQTYrCw0U5ebnzOxiU9MiYDiCvhHXJSVdShczmLScEh90ujCM?=
 =?us-ascii?Q?JxeLi5m6WY6T8TAHHztEUXZiNIAfdoXFMexOq5Tkkx+kwV8SGq3fwTJjlAFS?=
 =?us-ascii?Q?UXk+PobqZOugCHEgivnLLp9KJCOcUPshcP4ap0S5tOBJEjIP+khdfwYTZ2tg?=
 =?us-ascii?Q?39HW+7Bh4LB+T9iBbSo25JFV07lSrdZYHsU1gEJfqmCfjUdC/D/bJi5DHHwe?=
 =?us-ascii?Q?mQ1DKhQDeIc465fasEsOAgTlWqw9hl+K87mAbiKEyo10YXPzlURxjFIwhtpx?=
 =?us-ascii?Q?U5EoPWuTq9DQUnpAFk9K/y7AVSmMIBORDeOu0zyye6/2bVXJDKSVMvt9irtW?=
 =?us-ascii?Q?d3U+4BZn3ZazibQlpUHrHJM2l92HWQxqOGIr2BuFuiGdSTLcRSfpLitHhnsb?=
 =?us-ascii?Q?USMv2mMQvZkB5QCGkX4eIoUeecSsdorHE9Yq7RjcTXwgNC3WKqt6qUka+2OY?=
 =?us-ascii?Q?LvkLF5B9Zcl+0xbH+sj9xNTYJ11U2+VwQu/wdaKva4qnwzTEKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bzIZ2uUQ4gWCcCaLipruIozsiZtW9yFV1bJ6ZPsWkhAlvYCsNFgusCP8Lk1w?=
 =?us-ascii?Q?7s0xRGkIjcz1+Z0zc7CBM8c3aHWkvcQnqcHnMdiItec5Pfoe6TbaAZcP7Meq?=
 =?us-ascii?Q?BOWRxxky249uVKWiVT5bq5h9Y+QQC5Pxmot4sqJOp8T00wGesq9PvxzzMMuN?=
 =?us-ascii?Q?d0qiKxCP41ClJkSgUWggB8/GhKJgsXFSbeuHRb3M9nNqQRns5mP+bhWD4/ek?=
 =?us-ascii?Q?yH7eRH+OEbc2opwA8t4VJFXEWzHmH+UO2dkScjIfmRRJzBB/GxyWi44KWR4o?=
 =?us-ascii?Q?+jz9m2E1bGM+/2aHt0KlRit+xWg24RX5Ly1E9bo4odb2+Bn45B6x+VkglJIy?=
 =?us-ascii?Q?j0dHkulLiln+pcD0kvPT7A+Oov1Go6EhlkCSnTHcHwgMWhOAByvyoMU1Fl1U?=
 =?us-ascii?Q?2tUyQ1C8k8KcuCLB/SF/RhJHvVANFkuC0T8BbCPwJ7wa1rbVrb7h/0T32nCT?=
 =?us-ascii?Q?SKp+FhpCvaMYk9wSJKnbWwEfVu/u7fTOB3Q9IhXEaEkqraJBxfY6ACdXmc+W?=
 =?us-ascii?Q?JzYjbeSwp1xjb9oNHaQbUkvMUADN9Cwfxv6uwU+5QoQV2ZMS9d2wTUJ85/oz?=
 =?us-ascii?Q?VFZXAuzyyQVuBzBUL1YTbDGVdJDD84vmImgHTVjEHiNaFxyMaT9JdfGiBLQC?=
 =?us-ascii?Q?1dO9sNhkn4jfooZ6JD5gT9y/nCvFfjkAdecoIFkAPTgyyr/9WhgXfZsElO5Q?=
 =?us-ascii?Q?UGGBKPhA4Gs88TuF8020D/2HCregUTSGj/GaD5ZLzT5U7LqPQUNxSdsh3GoU?=
 =?us-ascii?Q?+9cZC7Do6j44DE2gvLcZqVYmsqBMBcxdE3VMamTVBZQrM5OoLZm9Wm3ui+vw?=
 =?us-ascii?Q?oEN8tOErdalBL3s/a31ofiS0GwyRJnG9cJCQ1ec1O5OqwhyKuCnxK4EmlDp5?=
 =?us-ascii?Q?GUv/ys9zkagAbwY/ew8wuaRUqh1AwJAJrPL49CKZj5IhCjf7vG2pFZUSUruX?=
 =?us-ascii?Q?fsS0Y4H6kbxszO72OwWtgMYok5CZz3KKqjyYuGyaqAkR49JbIiYKaw4J5su1?=
 =?us-ascii?Q?BwTxYKka6nR/VrTtFV9aIF+a2iatXVQBHUyi7MgA5C9LGGmZdIDyRTWhr2FL?=
 =?us-ascii?Q?y0QzVT97SEvYT0cz5pblPCjSc4mWp4XD3e+VvIhknCgSjU8DiXDA9GVvBX/V?=
 =?us-ascii?Q?dAxnFj2R+7HFfStWexB3KLf9b61WDz4NEy5Thu5boswk1X6YY7LndW6I4plI?=
 =?us-ascii?Q?8Rf/YNmZ7SzZHkK5U8RXOK7JcE8Nf5cIJqFApeD415LL9gGTydENFenKsQ/n?=
 =?us-ascii?Q?OdtfwIJ0ompYCJWrtOUmCtfWNGAT5Stlrbp5IlDhmr+wlqevRn1YUrxzF5q3?=
 =?us-ascii?Q?v5P/DjmkRFHk5a98MVxnLl3YNabhuvrvAwmR8r79an6BG7oRIcQRu0/bkLzU?=
 =?us-ascii?Q?be0PN2Bp96SWFI2DE+XkoRSB5BW3tm4f6x6ludSvKIdlE+cvkl3TJX0OMfaO?=
 =?us-ascii?Q?L19+752up/zcUkuuZZBkmo00Q26zb0xMV/+dMUT4DHb8KqRzofIB64dCNTIT?=
 =?us-ascii?Q?ze4KCAdjRVS9sHu6dTvP2ioJbI9YHjdYHiJrScYsADOH3G4jXosdCrRYMwpi?=
 =?us-ascii?Q?cUVNt9lrWgFrZHJcU19KCJm6gHtvWqILANTTfOUIlGJhAT5vIv4fOoCK68pJ?=
 =?us-ascii?Q?3Qtam4+wJ5N6acBT7itRpag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4121a7-8776-49f4-f7e3-08dcb02f6ca6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:34:51.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGlSyhZ3nl9+qstaiqh/MRRyO6ShnBW+6IFbVR632v9qeZ5oOsOAVW8pOrpxbeew5f+eEzq0GxM37+Pw9T3+PfWm+pH/H0keio9iwKm5V8JL3zOmiusV7s0hpo7ey7Ay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6972

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5ac149cf3647f..60b6d922d764e 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -353,33 +353,29 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -400,9 +396,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_isc_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 73445f33d26ba..e97abe3e35af0 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -336,36 +336,32 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -389,9 +385,8 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_xisc_probe(struct platform_device *pdev)
-- 
2.43.0


