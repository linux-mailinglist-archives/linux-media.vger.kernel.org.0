Return-Path: <linux-media+bounces-8271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9589366C
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 02:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C5F4282124
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 00:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACD2621;
	Mon,  1 Apr 2024 00:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VIOdsMhF"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C947F;
	Mon,  1 Apr 2024 00:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711929944; cv=fail; b=RmCRbVCKn3ilmr5yRsZODe0OIyM8pJFDI2ulnW77ZDIzRsYVWXBGvf6kcJ4veMoT6bQcLxT660jTn2Pmid1ZE8v5VQ2Okv77htvJs408HZIkRJACPeUW35TEMSOZ7tWidqhEWS+F7pRq7zDhIML/+5dUhMIknb4m2KalLcfVzZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711929944; c=relaxed/simple;
	bh=+OzyFz8qEq+fvSCCLYMKxODLTLiOofNVDgQtB++Astc=;
	h=Message-ID:To:In-Reply-To:References:From:Date:Subject:
	 Content-Type:MIME-Version; b=QGhhnK5qJQ8KizwCDK3jxwQ5DZ8+PDT3P7SfBlwydr6V1Ip7kdsjIAlZTdu36FypKfCOImm6Brd02tSzQ4s6jo7PawobJHwdzBBEnDrj7GNC4iSTxBLfOXGRaGYSag6IoOmoaWzaV5OAqheXI/UIHA6Po8cNx1x/oEpw19zj7RI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VIOdsMhF; arc=fail smtp.client-ip=40.107.113.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhe1sbMVPUfd1NaqRHVeRGdUP230iKaeZJEcNdgvWRc1QQnEFctG4Gcp5EWZ+1bMCFS3JW7scdnDfdxyhpSRqQzWzk6mZKcug0GBe9d9Q6X8miQHGHnOrlWdh4TJ2rBgksVM6cgQvTZO9DuMcCPblL/dp/f95d6HzzEXTnwQp+IvcAJ0ajIweqcai8JagAhFRSuF3/II7ZnJhJKvblkOoZgJLUAiirqnP5Ybo9k7MYNjc9QJvg/HCOjk5zUsLChIHzt7RYkIucOUaqZBiQ3jWSnIGb5MIw6YsE83Qjlg5jgTqhglxmeHYIuNDUyhLcyvLcpkUUq8mnB2yNw9lXpy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU/WFUEU9+Vgl1x0Z0UzrTl7yEXRkmD9+IO2Fh9GS2Q=;
 b=V09FbeJ1A+GsPbFdRi1K5MfSYiQvrzm/0I2fKb11+w0ltFSQn+srkHP9SsUCHd/GZrWNBqAqIEevEv/CGv3m+p1Cta5paO4XGXvNe14ZWjzdSvX6wxgFDK+jiyfi+KbC8vjS76D0s7887Og0+TtI0tTOEfmPUEKsnGLeCJE09kZcDuvcp6v/mxRKUSsgQYnG7JtxKcIxBahTp5gsFQks23HwVvgmEC2Zs7lYJsjaDbALO3ju8hAoqmv2ThXZce1HOXtbtXLXT88CASKwU9e3bmMhdgOSOgo7fhhflYM7KErP084gZl++SOHsBi4wfwJPNnPssVCEeBDBt+elyiI6cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU/WFUEU9+Vgl1x0Z0UzrTl7yEXRkmD9+IO2Fh9GS2Q=;
 b=VIOdsMhF69zrXgI1hrOaJxMjOrGwLLy+LyrBLLTn73te33iEr/XsllkFyjP328kbGf1aFtjlmy3Zd6OTo8L6YPihvUumysxdhYNmwkMEnjy54HTfqOERT9MaqqJdVaXa+Oi5MpJrs69hDfdBTYvMdIW6/QYaGb9Gm+iE9rlgOZc=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7826.jpnprd01.prod.outlook.com
 (2603:1096:604:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:05:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:05:36 +0000
Message-ID: <87bk6uueun.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
References: <87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 2 Feb 2024 10:28:56 +0900
Subject: [PATCH v2 1/8] gpu: drm: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0194.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7826:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IXAMnrVnqtyCoy0IpCs69EmBVumd6E79XZd06iNA2Ijoi2/Y4DJIh5BYNgW4Go1yulH0V9mjt0rDPdkelnEn/+H0iMr6cFPix3DtHsAUPpjPHO+YDwaoYiETbCaaepHidk/z1ZCm4ch+VO7jHUBAFj6m5Ea58nWpzOSIgn9GsxGObNKlvNkFkogv6/h9dPJpGmdmRLsPX6ajpjg53S/aMgZFvPT0/rc8kAiuVxYbBsj8vmuUBEupJo/4XzrPErDMX/ZBpLLllGLhSl6XdZcEHlbY+1KKNaH+N3yHVxkqqCzFmOlt7HRO7QOSTIQ0pJbayncGdZAuRWdjgEq+l7d0+KHILzN2eV6YZbQ5jP6KB5p8rJxn3MSCMxv3PmbZEs42QqzaFv2UCogKaYO3+bosoaTdrgRRXAcni7ECbelBrCA5EmptZjequEn1cZp2t0v4xArFU4NsVY+x+MvXMAdNWOnRqIFujwQJwZ2NI8lMUk5z310CTKvjh+pBaauAegYKnI0apinswWxbnjijkMTazPU7BNib2AGcJs5ieRObYoR2l9hCEnrBgbH8UJ1NqWinqOEGfFrfX7XoemyfvQkvmUQhuz/HjuNr0XJTw/57eY+ZBqzd1Xmy9GutNnaL6dL+5RlQBm5fcHtzo17hjqVKrURyZ+nj/6Z5/3ER+h0rLzC217cvH0BEL/VhasOFI1p3mEWI0rd85wl4mJhMXezNzP1TvltpSff87vm1J6a67vY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PAJehzQwQnUnRzbxqxlc107kYsbh7VyFwii8PJDeFpbOeZ4rRCcaFtlulUoS?=
 =?us-ascii?Q?uxW+AOvHDrVNrAQPSqWboUX/zMl3FPThNc5qiBvAckY1wrzxntLAdwMzBPvy?=
 =?us-ascii?Q?KWs0cA655Mi56NfiiEdWNOCkaHBc6+8ILA4MtX9msND1mnv0Dh/0qrIlMKFP?=
 =?us-ascii?Q?KF/1kVDX34nQT6m+MOkhF24+vCbyKvJ/QNHstYeKlBQx73cm/2jF16AbkE75?=
 =?us-ascii?Q?SAevodD7RZ/kg5A+eHGm2lQBg7WgPzL0E4NVXW1NVAcqbVplTXps21MQFHwT?=
 =?us-ascii?Q?iLbTpc3BdNxDtj/RRIDQFScwvmjsQ364s2//il2ad7UzZUJq3MFhLtLJz0bx?=
 =?us-ascii?Q?jZW4j2wdVBlqntPvu4Jhc6GfPv7K6azTFe60JlVKVlwLsCfs66AqD2jvmySZ?=
 =?us-ascii?Q?95gMx08AokH0xxFVvQqSnEO1i0kJFJZns0l91WoXVBfLKy707mKvNcqakBEn?=
 =?us-ascii?Q?Z3QmLymhVf5FGXPtyJmKrHJx09XYhQ6lkbyz5/Us0R55I/VNaVoeNpi2nBgl?=
 =?us-ascii?Q?sN9B8F1qN/6CRTIdFdJyDhAIHa7rxACfvSztKQnUCPAMy2HtlEsYBp0SQ8Vd?=
 =?us-ascii?Q?iBLp1DiK3Vaqz7hWMeE1hGbrqcKXTItIPMcPFO58g8bmhRgp/wz8WI2vT0xc?=
 =?us-ascii?Q?nguSj4qvCMmhMvSgdUH3Ew5IXhmQJae3s5Vnj1b75aKRdgPnqrTaYR+3k9Tb?=
 =?us-ascii?Q?NVtTiKZwBag+8zXKteiJhj214uzzoPIGfxateDTWMzNeL3+zCsQs8jSUUQ+K?=
 =?us-ascii?Q?ZoX8pI5uKVaiLKgEbZP0ofvk0ahJyERaq5bo9SV+Xm6RtPsoyBD+I04iGMjh?=
 =?us-ascii?Q?lhxBdht1h0OhIZtC+1SsOOVJo5ApLw5dSDGeyPLGKudoQXkrBk6kEAmXT0Bs?=
 =?us-ascii?Q?tX/43LD5ExKfSOnC+0NI5TlJeljvP6Evgy714a7x3XTaJz9aQUvwE6FXWzYY?=
 =?us-ascii?Q?Ch0ogcRztSKPJeRPYNK0G7vJ3N+QYTLiOkBJE4zOp8cOe9JdXZ+yJKlEcaHC?=
 =?us-ascii?Q?B12ZLPC8w0hYF3G7SxFK3RAYkcrvp7LUxDUefHL4HnA9ytW8wfgCwCqX75jG?=
 =?us-ascii?Q?Ze1fBz2NqiDu+URI+6bWHhIocIDkeMOAli7JtwQ56vLCrG57QxyaPgdwcZiz?=
 =?us-ascii?Q?QZ3FCpY4T8kCJdouQwsc68bK2WvTroMd8XCfqnH8xCZejZPRKs32k91ns9Of?=
 =?us-ascii?Q?v30+b5N/sotA3P7hh+7/3IWnx+jbciZz0aSLyexXmhmogazajogUo+HXGoPB?=
 =?us-ascii?Q?LhxUrHSM06mHgNOsFakTywk0HONKt+ZArqA4BBYxuwm3XuCa8YQb5Asq49Rg?=
 =?us-ascii?Q?r4bzXkbg2pZNuYvAIWMlG0jXflo+3c9NTi6FSXx2PoK5QA+ITtJTWMPeY9Se?=
 =?us-ascii?Q?lS3rlqfbOcEo3a6GZBWp/LetUubvbGe7DE5bTrVdKHGHRksfCAfbabtUzvD3?=
 =?us-ascii?Q?n539oy3zkkw15G1zuy58R7sZ2MOdkie1DkE3uRpkcZMpr3Cmlb8fHzQ4JINi?=
 =?us-ascii?Q?rIpYoKeGhAUByENAu+Bmf+1Nu7FepFaeIe0TSo7SX0HIBoTp6569rkjaPO9s?=
 =?us-ascii?Q?n7WD1/NJSFakOm5w/TZW0HhoKow4/uWMHih0q0xfYxPwAlvsNBYxFZKrIuuc?=
 =?us-ascii?Q?KgD0ZNygvT2fYcnWAeYm/eM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdafe737-9558-468d-88f2-08dc51df7548
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:05:36.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7L8GDgR/ptrjKah+GxZY80Txy3+TrtZiQz0I9t4sHcFH/F9PM+7aZ+CSPPvZAO+bBqs9jXl3FETmHoS+WWjF/04rvvdJLpeLOe+2YrWEuNk3s1uRW4uW6G8gU4YnDA3r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7826

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac5..5f8002f6bb7a 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -242,8 +242,7 @@ static void omapdss_walk_device(struct device *dev, struct device_node *node,
 
 	of_node_put(n);
 
-	n = NULL;
-	while ((n = of_graph_get_next_endpoint(node, n)) != NULL) {
+	for_each_endpoint_of_node(node, n) {
 		struct device_node *pn = of_graph_get_remote_port_parent(n);
 
 		if (!pn)
-- 
2.25.1


