Return-Path: <linux-media+bounces-12420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B98D799D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 03:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E3902813EA
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 01:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6997D4A02;
	Mon,  3 Jun 2024 01:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X8p4hsj8"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35BB4436;
	Mon,  3 Jun 2024 01:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377507; cv=fail; b=Vo1yLJyzC/z/kDs5R4+vFWIpE+3Fmltj/sqF38MiajvA0fQrt6TAO50LNFsx8NS0YdndGQe6FHsvKCquAluxJi0D9Tg3cS5zEbI+J/Jdllp3Hm/bOf4ZhO3IPkyQQ+xqru9xK90KRUhcXEFIJcsUwLq41LGyZmrOLvYVW5mFlvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377507; c=relaxed/simple;
	bh=wKjEPyL1kLmEa1RWUv0Xk7JzIG9DlELiQlr9OfVxw3c=;
	h=Message-ID:To:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=mlJAn0A3I0DdlE7DJbe4umM51Oo/LvGIgFfRj1zmeOUBcuCs2BZ9dGvcyAUX16j7lOWqditRuwsNXYej7RHRzFIovCvFVQtHjRj0eF6eCXodpq2GMCFA6ZFTVdelP1FAKX/1JKMaR88dvtBnJUsVV9Khta88k18ogxxtmbFtSeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X8p4hsj8; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIdmzN/fim6RUMCSd/VCUAjb0XdyG5+rQCeP363XAxsmLDX/cxu4KKojL7PMMujHsZPY8mqFisBrNTF/HYmXWCCyvO3ax5qRHS67qak99ukAVnYcrveoJMPPEdnUHG3tX3rx/TQGQXDVSh66IEZYB7oRcFxLVtkwlYxV+V1vQzm9obxsvDK4JTI8CgbJ3Tyc/SoafNps6XIiCvPST2xU9UgPYKyiaamG+8wq4iHOWXGQLtGvPPHcYx5uur8lIjzBbtmmfhLQQ/Bh1RfJXixZECxYRpwIdlEVXDRBrdTS/14dmdnANSV1bHSk5uYPoppsxSnwlMqfBBPz5RA+aJ5fGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=ZV0nPY/HPn6s3uBcmIcugoKfE/FUxlp68mo15SO3hk3nOl+qaRXO9EsGRyGKS+WvsDe0ZGuV1fngwahJw4t5IspNpkS3DdNh+4YlEsAOqH+iu6ulBa7Kht2EfUFaQf3Accype1SasTMdlDZ3+bYW96EMNvnGAkzT6KYu52dmD8LvApAxmb+k4y2NxfmtEDSR+n7A1moh4LOh2yvRrNkq4ADOcHyC91+2PUcVt7F006tOEGspsw7zVXcvbgLoqkz8Vs2NeguncgCjaISGR2g5K7DHuF3JpGS26CiBbF9exgSnmIEue137RLh5nP0mKjfAVSkCBJ+FHC7KfGSk6OJ/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rI+ZNkzrLrVhQsiJK5pQe/ZrYozduef8K4ZYQXjwTg=;
 b=X8p4hsj8wUtuyl0JWwZoJGCwx5qtBHO4JMHYNK2GldN3JEgyveSX7pPsChS6NHCCQ84fb3bic/jL78o6qKBt6ZrtZqexB3rOA76J2KcxpEPhBP7yPhp7OyxjOOEhzE9aA8pkzCqWB+PsVq/F8DvA5Rbxxn03DcK8r66f1NSJGdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11318.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Mon, 3 Jun
 2024 01:18:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:18:22 +0000
Message-ID: <87plsy4yea.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v4 4/9] media: platform: microchip: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:18:22 +0000
X-ClientProxiedBy: TYAPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae0706b-ce0f-4e61-845a-08dc836b0f5f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|376005|52116005|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?76yclHiJfplWJCMzqOSqpWxrN4PzG0Fs4Dr6KVvOMkKupWx+RNfNJBkyFahO?=
 =?us-ascii?Q?G4v0ttU4lUsHvcn8wrDJeF82XHeZ4TlFyqqhL89Qt42d1KHXxptWv+MphPb2?=
 =?us-ascii?Q?AC+x1qwms7F6D38rB8FNohB9ANYFnmJvczUjo8h1IyFc3qBkQePgakbICsat?=
 =?us-ascii?Q?LoTU0YSi3knRL2E3KIxi2X9NIvg+kdESrR+09c/XeQnZvh9VVjnr10NYZXRO?=
 =?us-ascii?Q?YOxEqNxuAf9GACcFdKGAfsYaFPRl+Lsum6/JfQWN/H+8gtziqItKoSfiVpfy?=
 =?us-ascii?Q?OlbqhihC/WmjZszyOcSd2r2VB/LOZknWooTaUP91ZH433WQYZ2TYkdV+rRXK?=
 =?us-ascii?Q?1o65s4h8EcT4vicFdCB/eipgt1jYn4uJam4VKrRXr9hc901cEqIZmbjfyaoL?=
 =?us-ascii?Q?UyW+bLRBcC6uTcoC02RLJg7UYfm8axlWoTvHY7YFTHWx3X+ViHphavEeA7KE?=
 =?us-ascii?Q?FpSZxl6/cbNbt5MlSjEgXw3dIpJlC6i5gTZQih/r5dFJDA4nI7Wblm5EYF7X?=
 =?us-ascii?Q?OuMdz/QekwNnK9OZth5/lCSU18Z4FLTAziYBxB51he0Qt8+qhx6I48RwSx8u?=
 =?us-ascii?Q?BK5hVoBnqZQUktJIhNi0/9NnupltzFPZgnieRO0YxH+M+1F6qH5TE4iiy/6r?=
 =?us-ascii?Q?vrXKsXk0Ws4LrkzwWsBjCcNv6wfL4GZRByCvW3gJ14ExxxjhufSV1Vzv6TlB?=
 =?us-ascii?Q?5mMh1mfC7ylf1mNE4aaYeIuOCkDD8HiNGW7AKZoOre9z+BrErLnT++zV1JSx?=
 =?us-ascii?Q?Sw5PnRLMpNlFLHvuMPJBVYfUpfseLDGZdN1doUrjNoBGCsYz+yUf77n8nSKm?=
 =?us-ascii?Q?aP8teFgXuviewovhHWS9bJ9o8iYuulfG+rJbe+ltizGCuROpc/85shxq0EVj?=
 =?us-ascii?Q?9gC5kjCxAnQXaKneBuV0ZB1oyX6fpy21cUBfKwLCdd8B3a4J+qYcIwjyOXdz?=
 =?us-ascii?Q?VPwWmuPRipa5dAA6SXho3MlsTIGC991bHl7CgDifLljRQB/h05gR96Ljrzc5?=
 =?us-ascii?Q?gtqID5yzOpW7u+Ctj70QMFgqsPqj580Rd8McitMH0TK4Cjl9v67dLj8BMXsQ?=
 =?us-ascii?Q?nu5vfn/L3t9JftIJnA5y4+Rbih9SJuRcs9u1on7jniBqfTcaB1d63UZ/rFQU?=
 =?us-ascii?Q?WfK3PcWZIsymHa0ZfSDDSDMSZ9pXck5abcGfwRAOTVaCEr++h4xwSya4Ct6V?=
 =?us-ascii?Q?N+1M37ZCTkKzWwgSjAAo0+mOLPdu3KaORZc0sOxjD5PiEmLSvG2S9QcRviSw?=
 =?us-ascii?Q?GwMTdyBz80K3zceUxmeFKrVKTrLeOWAwxVtaNVjEenp//H0AkKcjZar8DL9h?=
 =?us-ascii?Q?7KR9GyS+f4aIs11HPn1qw/v/D7Ri4kQKNHQ7xsApNF46AA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(52116005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JVbNc0Mf5sfLSqN107dQUQST5m0ARZonI7j0Vjr1g1AI8vVByaKlGa9LmQd0?=
 =?us-ascii?Q?k0tB7Cyzmk5ki0iJXOCfiuqsYkGlcb6zNqMfZ9eNpAZMM5WhlL5m3pUGeMze?=
 =?us-ascii?Q?Na4vnr8SmvoO+bRCr3Th+KEcQe5EWNl+aX5BhP9fS8N38d2Zfat1wgFwiR36?=
 =?us-ascii?Q?QP7CZG2hLD64EYHnfUbD1lDK/fzocLkAGMBnyqDm4ux1keM+4W5N7Utj1p6A?=
 =?us-ascii?Q?ckgxFjaRpKlOYlEWKjv1EU3mSKCkKgXzdKalKGCPmOnGSx1VQKAwMSIHJ1Wf?=
 =?us-ascii?Q?6h+evYkD/TW/t1nci+VJgDU2Sy6VPriY4SnggLbhu+FD2EUcsDIPzxU5FPfd?=
 =?us-ascii?Q?1eKmJ6Im8wAK1jCxVxpUYi9Ypq7cZFUWbCSJyGE8yntCeV0W4O60AbnATqo4?=
 =?us-ascii?Q?HPvPSeB4syLRwJpJExjpG6tbiEkDufdAx0L1lcKF/LKVP8gVhZy1j9Gi+lpn?=
 =?us-ascii?Q?pLueXwxiDsWTbx5Bzo9lM+KJdMWBMsoeSbKTvsD3njQjNTsyngM75CCRGzwm?=
 =?us-ascii?Q?qIPaj+JB66+WBOpOxqNU36rohFaeqMCFod97Y97neTRNc4hLqGAXLrbuqglp?=
 =?us-ascii?Q?t1Gc7AUUVWOHtAaZUzfxLRAjgr2D+QIGeq4YOCofLVFs5IywUtDEa+ktuws9?=
 =?us-ascii?Q?PwnkgkfJs+JSvyTMVO1G4uFd4fzinT8coNNb9o/sUBsogcQ2N9PNOYgj9ngo?=
 =?us-ascii?Q?vicaY7bZDm/pFMKhiag2hjQwd/+5xJ1D5PF1QgmhqvdIN/+lpemomorpm7oI?=
 =?us-ascii?Q?ncLQ//N62wyjRMToBfikpQRNEsJjYe/RN1puPEuWloXJA15KrXt47/2MSkWw?=
 =?us-ascii?Q?2OlAppDN3TMncU7bwB1boBQ8YzTXnz0JOK5Swmd9WsJA1jAYUOKzoegkTO9n?=
 =?us-ascii?Q?x4aOTsC0BQpYhJ90u7gshVMxZic83MvpMHtHMFWcINU2n2u4W64DJiBQy44m?=
 =?us-ascii?Q?0gSnGXgGKVjNA/VPSLTaXCDJmHwuonm33OpXcCu0sfcOWSgL58vZ7H+gVN95?=
 =?us-ascii?Q?uE9FjCTslaasqewP+Y77rdawd7n/FXUkrr0ilibQly6vo0Px8gTOKq7EJhOf?=
 =?us-ascii?Q?zWrnfoszZTpwj9KJHH/D2YBU3JBVr9NPOdLXsXrYerMh+xbXdfBpz+xsAjB6?=
 =?us-ascii?Q?erYvnLnjSThVQOBOgRWXGXQSr6Rj59Uqzr5ub/R2bVqKAF5aZlGN4hzG59TO?=
 =?us-ascii?Q?ZWjQ+yiqSY0rDPEeaXQOiDeg/urbDRUrinCKxt5A6ro+Q5au/7yR7IH8S9Bf?=
 =?us-ascii?Q?qmt5bSFXNYqXv6YGq8iWqxJTl4iqohkM1ByJDH/ga7786XfYxCqLcjtmnpg9?=
 =?us-ascii?Q?xi51gmkHv5h5oy4ygnLC4PTaLnreTeV5/Tvgb6AreDXBXCORVcslmhYSwZFd?=
 =?us-ascii?Q?lQeGQJis4hiDEJQ+7rgbDLfwP5Bp/euQ3/3t1/Rj1RMFShqepcqDcTSnCk25?=
 =?us-ascii?Q?66F2YEeGeoW9mntc2Ag1v9ELYsIH9MVrAB41VPrhk5sqLKQA7pW9m0aK+Yig?=
 =?us-ascii?Q?iky9ty9c7hz7D9Sw43IesTb1/3FSl86Y6rPBGluJDeJNGxCYituvwYE84fUy?=
 =?us-ascii?Q?A//VZFoV/S41vN4TLrly8YB2tloJQ1p53Qh4XTE/EgGp5CrBACflWJ8XM+TO?=
 =?us-ascii?Q?hKfa+ToEMsXwdVQICVzFKKM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae0706b-ce0f-4e61-845a-08dc836b0f5f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:18:22.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qtbydkpDRF+swxn6pQgKJRDSb87Db3FYimr+62zZh3FeJ/QFNQtgQQ5Id63uzihIrcIFtQ2qyMzbDmnmfjKewK7MhaActWlrlPs4mTLxjbtaMuUp1VTiZVrW31iEb2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11318

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


