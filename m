Return-Path: <linux-media+bounces-12419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7128D799A
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 03:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D051F1C20D96
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 01:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D194F257D;
	Mon,  3 Jun 2024 01:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FjrEG/uL"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF9A5250;
	Mon,  3 Jun 2024 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377499; cv=fail; b=WH53Xu5cGBwCbL95jNWhHn3VKU7vf5JaxrnGW9RaTK6niPukUi6+qQ/Vrmnn2dY3WdTSEW939QhCvW3rahooRKudyRVhefFQ9HApU85TWPLJ8nKFyfnNdbSYgSEmtkMP5wZNjENXBRC52uXHd9WI/Ccgkd5akZetDv6mOW5gut8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377499; c=relaxed/simple;
	bh=jMWV2tOCFT+tH5YSEcEM1qE+Db6K54NPiGd0CJ3jOh8=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=ss9rGIG0k7+r8DQY8tY2ZDxy9LBy/Hcln0FC2rEn0aemImJQwLIsZX4yTuUlF33KFIajkEA7OdaxckgT4tK8ei05JkAcgB3wkZt81jVloXX/8Vyqn9y72aw+M98kqvuMCBFFrBz7Ezg8bZpoWZQnHTTOa9uVmSugiTMbjNY0L78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FjrEG/uL; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+nY7WJmg+HQT5cgpM/nb67Zj7IVdqlvk7G8Vh8WXtJ1PjH8u5lM5GTAf1Kmdps9b5wss61OZpSkZaBXIIsR/uwmh+5CTP8NXTSgJrzEu2TCHJVy2KYkDVpTHosdHMjXVqU6aEXYRrv9/osaSfe00jLsSkLb4KJDjLT8nzz1ZIYUaSPPMpCfzhcnrHsPUrhXkz+g1MPi1i3RqGAVX8MI9eQFaEO5Sn2Zi/NUCf1Chwo6UjZtqEgGYHy/Y1z9oZ+nnYuTqD5s9Iq/n0foqC9OOegKstS4de7NuRagGmEch+2BX+j7GEsGEA5JqXP2ZtoXlI+SNRPNP0lJPOuJBwqSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REllXbKiXbTph1LoY5sZTemVlDAhDPlDjVQgZtSkG30=;
 b=dsEYSD7Dd27JRMwnAGY8OHrEyJa60001Vrm6I50mZv+Q7DuK8Nmd3FEZRoOVJrTdULwshB++i0ctcdf3t+pqQHI3I9sbd643XdBYgfRfEvIPFe7+fy6r/fo08ykOItKWw7RoUnGA+84X2FRLqfAEwFL/BuoWft3oodbvEBgnFOFAUTOVw8C8A+4WCJoE8aNP9ukbXXqwC9S6aEcJqjij0q3A/6h9uslwPZ7jZERrF/RLptTM2WE/QnutXWh7DKzU5vZVL8Kfn+NxblCdnyOoEXW7B+862O/OM/TEvnu8stLwbLFX1D8K3Hh4Xe3MnUl61cEQ3AhjrAJpzkNrIga+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REllXbKiXbTph1LoY5sZTemVlDAhDPlDjVQgZtSkG30=;
 b=FjrEG/uLwrQ5KsivEjwp8wXjiO/Qb8Pkmi+nvYLqBxfJWE2wyd9kM7uvFyQBhQi0QRdynXSK8pf1iAYRFDHvjs4h8VNxXzg+o9ssOj1ALY2+1e2Q2eiL48wSUh9bfUjyJ73HEkNiGX1n0ERDer+AjB77iIBEMAMfm+cM7WHHWt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9479.jpnprd01.prod.outlook.com
 (2603:1096:400:1a6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Mon, 3 Jun
 2024 01:18:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:15 +0000
Message-ID: <87r0de4yeh.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
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
	linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev
In-Reply-To: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/9] hwtracing: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:15 +0000
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e6b40a-8e8f-4fff-6d59-08dc836b0b33
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|7416005|1800799015|366007|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bYMWnG+v/jlR7xJwqBuPp/DHmbFsqtin+uVdL15/JKucXSceR5pPICNY04R/?=
 =?us-ascii?Q?Jjv1wq4yynLXh0C4PC381ImDWT8AmKA3TdUEmUYE3D9KSdVElxKDdoNOCs5G?=
 =?us-ascii?Q?TKx4IHtpjdhIJM0hi8HqJz9p3SfbNtGtt5QQcj3g8fVG8onNqFC++gt2mNrW?=
 =?us-ascii?Q?Mls30GyeFKX6HaiRC6GeZhJpjLM4J26fo2r6sRWM3gjZirrV3h6E24lTEvWs?=
 =?us-ascii?Q?S2iZe82k3zCPNzqQIaToSVOmavguNdNEudWgFlQzeFUIyajGe4GDpOi60auY?=
 =?us-ascii?Q?hEVz1bsEgg1kJ+9B0x+ce6KXTVkWVj38e9Iv79ZterxHKKsWzDeNhfgvnaMT?=
 =?us-ascii?Q?AenJ5yVYwkwlOGcwMRCMGYYyX/4zvyzTtGA7aqepN78pQJCOVB/wCoU3BJq1?=
 =?us-ascii?Q?zkeWX9SzZUX+/FdsPcC8UjNt3M9Z9KbN5izNh3RrcXILgnNxLzWoLAN5vFXI?=
 =?us-ascii?Q?0NWQxI6mCbM0Uv9S5rjox+xGEUIj8/SGwa89NHHOFONFeEgbwBJ+l7w25Q2t?=
 =?us-ascii?Q?eEfzx3gNn+5dd946eYHE7+uK6G9t7VsfZMRB9KtuTJSyjU5+vK/XIC346k3p?=
 =?us-ascii?Q?nV+jVF85oa+VqSmEBAORwGuhTCQLipo9vLJs3PWDG+6lPG68CSMylsyH92Wp?=
 =?us-ascii?Q?YzZjKo/y40eiribesTOo9f+LKJcU+WozuaRaacFCuZ7kfdW9gw4GUVBVIMR1?=
 =?us-ascii?Q?3v85LeAByINmobnxnzRoEuH1trTXJjdQZBcGGxu0ZDJVyTy0WCNPwGqpT7BR?=
 =?us-ascii?Q?nxHTw/6HXNLRvafEeIrEs9idlXJnoyRteSWZZIPa5tVILZTJS2S+p1Cq4OqW?=
 =?us-ascii?Q?/iDwm0/jEmwur4OR7Mouc9kOVFgzQRYXyufngZRz3aP/ycpQn6opCojsAEwN?=
 =?us-ascii?Q?p1IpQIymVmgD7bRNVHjuQAXJmVcBLeBmqXDOgdc1+HfLczUfmwXYu3kppnG5?=
 =?us-ascii?Q?wU+JUlqhADTIMAIu77CknBOnUCqAuCYzVxKLAVQRKmzgid+Sjkdsi1KNgnQY?=
 =?us-ascii?Q?yIbeDOR5NkeBEUkpBSvie9LfhFxafRhabdKZWtnq8DunqBAd79N9EnOTcGMf?=
 =?us-ascii?Q?dfdRKXWsaBMgKpbPxy4P8lpMN5k8q0dAAu70Tey99ixtEifd3YFIjCYdEPk9?=
 =?us-ascii?Q?/47cWawikxwHE8HtAh0nnGwcA7Yy4LItyIPCe/tNtM1EnTpJYaOC8jRcKMlx?=
 =?us-ascii?Q?FnsQI6DMeAPtsPjSg6YRJIaWDrETUviUfVbegS3iN23Nhxm5UaL7+ji60Plx?=
 =?us-ascii?Q?awvVFhldi9Wg+CetL5uW+Y0vb1O+vdV84Kzf5IkD4iY068UMexj5UNgYAN+O?=
 =?us-ascii?Q?rVLWwgjLha7ULqYgMZ78pdbQG5lXncOverF+Rld/ensEEn409J9TWfFvlFCl?=
 =?us-ascii?Q?uEOaC5c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNzVercjvde8aSXTF8K7yqIcAagzJ5hp76o2IytoDwmBgZVZEt+ANK86OGJe?=
 =?us-ascii?Q?SwkToUHaZmHLVS0QIVvS3hHd/bgRm2r2nsX0TyhxYqvJ2L7nHDlKoUmGGpB1?=
 =?us-ascii?Q?bZkmGz1k+wa86Az5Y61UrIFT9mhaExHzxvbCKsA87xCHHZ2b537f74+5A584?=
 =?us-ascii?Q?jsJ/GMcXrhGYcfD78Cz/NVyin3P0arC53Yf1hPOFsj5ZL7sai9VvY8Rd46Ag?=
 =?us-ascii?Q?E+Q1ICwSeiPmC2AP5MIdEduOaw1Ru+0DGKUjELNMDIx3CJfJkil5yggOUeEx?=
 =?us-ascii?Q?dtWaY4VdebNkpkvCA+wK+yNDozS/+45RhWfgi7R1/n+DDGHpoTPVu59Csn+I?=
 =?us-ascii?Q?4ttb1aZSNCNk80t9Wc6DpTrwbGlv96WW+FSEC1bPzhUk0RHRzpDk8EGUSuZ7?=
 =?us-ascii?Q?BM5P13l/9A0ED4DgbsYdGWLKwadc/bJ6AOyliNjqYMdL/7csnxA30dqiSu2H?=
 =?us-ascii?Q?EsSTrJhqKJktVS+2Np1M2VFpa+9hql5VfqHwS83KlaA/ld5LjUrjaWkdjKXc?=
 =?us-ascii?Q?jVSAKmsiymuH7BohQYQdBnfkUc+62iupe5SZsq4MFNxTwq/fAV8tC6FlpA5T?=
 =?us-ascii?Q?pR6tOYGePnZ6UvqR6Tca4PkJanz9i1joy7FImGCfZLev0rvq5QWMdFBXWTeQ?=
 =?us-ascii?Q?S6uGtshz0wA5UoMXO3nfefTmG1GswBA4avlvB4bup9Rz//eX7jwYenudxzUr?=
 =?us-ascii?Q?2f573sYFgp3HlnfJEzHmD9NO9SKKKDATxxxNwD9fgyqMjUusrtYldoQdn9Mk?=
 =?us-ascii?Q?fCM94uAqiKvqh7tdU+mYOZzRi4lTEnH25IuafijzxbHsTfe767qHFXaVWrBK?=
 =?us-ascii?Q?bYlMAquBHXgh03isoZ+WGcTJMr/Tm8saZx+2+DXkQNLu1+rEVW8YcalUpApo?=
 =?us-ascii?Q?6VaykzLr7xEMIcGvdKf5fvwAnGhMEzOVKAohsasy7ZH7+sMcH72AJgFOSCEB?=
 =?us-ascii?Q?kjzRsKD+RyoxTwZZ1BS0nIdEThSNzm4nscYIhmuu9mv0KtRHRq+AP5ObWs4X?=
 =?us-ascii?Q?yeGG/gg0LpskBv3vJvuCo9yqQfog2va998w7yIGNBBvww7fmcq+2SCNzrqMa?=
 =?us-ascii?Q?W4by/Z27/+AGlRo3GxR0wdBv+t4WDwRf7O4j5c+/yrYLkHIPAEoe2y1WNiaE?=
 =?us-ascii?Q?yLsOZ9c/UF9Ur0AkDbP9RHRgq1bskPtA+Dvsxv1O4MiCLfoc+CbsiDyyIP7b?=
 =?us-ascii?Q?jZnxNKOi6bI/zX3Vi+R7jj9V3uN6ZgBsLxXWKk5ezOfhp48T7SwXPpgCViHQ?=
 =?us-ascii?Q?JL1jZVX9R24JkH/33i5elJFn9gmr1t3OJ19YRIPXxaFacsy6MqyWWnJbyGb9?=
 =?us-ascii?Q?L8LMYFgmjatvSiSMyDjp0P6azbEY+p1YoVDXDxluYSNwM33L2yvWSCOUewrs?=
 =?us-ascii?Q?b14iKGzKgriL2F4QvTS48mV0407se2LjVioUzTbzo+T9i9NBRSapV1iNFSQG?=
 =?us-ascii?Q?0cCTDZPoOxBXQJTbwAkPtRAzfyBDyjhiCMF9iwMaNfx+KjTMyJ9CgI5pYYMm?=
 =?us-ascii?Q?p/Khw4LnknolmQCHh7c2g5mJbUDvvrzm+2V4sJV+tdYn/EhHr5EZTj6HTxqW?=
 =?us-ascii?Q?dXQkn1b+vnyLySANdqINUbTjZDoeOCNCTqb9y73akr1Yv2jodB3QFhtbRbGu?=
 =?us-ascii?Q?H81ZXDXOykXQ4Pp1oOzrTSA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e6b40a-8e8f-4fff-6d59-08dc836b0b33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:15.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyFMt5AirVVY39Jd6xIgIB6aTxIk1OmFXGYsIgTtu7wK9pj3Z4Y+WX1nCILiucLRKhuM3VfUJsqGQ50QAwkZCrwB0DbYgmpA/boVKWwevQZLFOm7SDJMkPhQ33TH0mmY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9479

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa8..e9683e613d520 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	 */
 	if (!parent) {
 		/*
-		 * Avoid warnings in of_graph_get_next_endpoint()
+		 * Avoid warnings in for_each_endpoint_of_node()
 		 * if the device doesn't have any graph connections
 		 */
 		if (!of_graph_is_present(node))
@@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	}
 
 	/* Iterate through each output port to discover topology */
-	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
+	for_each_endpoint_of_node(parent, ep) {
 		/*
 		 * Legacy binding mixes input/output ports under the
 		 * same parent. So, skip the input ports if we are dealing
-- 
2.43.0


