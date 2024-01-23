Return-Path: <linux-media+bounces-4060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 072568378F3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29FAE1C27E7F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C631C4C7E;
	Tue, 23 Jan 2024 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YNeZJhlt"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B1443E;
	Tue, 23 Jan 2024 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968298; cv=fail; b=DpktLyAG2IaCXhB5duCnYY5GlVz0+zzoDzD21SK1m35UEfW5gaMBr1kDXKdWzjS9OB/wRMNa8PeyhaDF+dKQsfGGgLNQFPx/5mUsQh8haunlwLf+E6posEtHDk6hHAnpQdhLM5NwcFl8DFBniEzW/b0GIPmspYTxmKPcxo5DxCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968298; c=relaxed/simple;
	bh=LetAszaW4dFo7pIO2qLTEWoszjj1mQlZBYH1VKPluAI=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=GZ9E5tq80IsD7WdbQ8zcZ5doL237HOX9hVukCtzQXJLdWpw3tN+5yCy8j1VJQ1afVHK/2f/8PD/FNGitBI2wLfCD3nlfBjBV7PedjDY2uXLZJxBp2w6TEfUPORbI60sGVrqo6P7vEsD28cwluRdQEIUbOG7G+B+byJE6SRYvsCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YNeZJhlt; arc=fail smtp.client-ip=40.107.113.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuXMS0LsMshvenziwMPRxHf8FSVgUaxNh7Zzqj16W+hBhW2IYKlPgg449FkmVZdm28KFlhi1KmM3HPUww8OJcQPJExGh00hCnjACeQSuAhuPZGrtHqRq6c0A/4hy9ymxpYAoRgd1SPevRYiqC7xmWnj/0slYKifigcazlDh6MhYTcyvr4wRfv62sL+rwvFD5LJD6JG0z99T+y0OEZ0C8J6PHp0cfOqSyyzjzoGPaoZwG9jD92v/MGjz+iuSg2MDgyFbUCXqlZAC4+2vwQkxeMA9un/XUD3VRN3sJRCutIrHaKOwSPwAUV+Xg4zHPxyQmx+FTKbI+YdRJjElIF0wSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8kkPI/MwcS8I3GYRXMHAPjRIL5uTgZdaY7byZyINHI=;
 b=QrcrG5fQ/GpQxHQ9v9uNh2r9dLYwOYAXXMit7DEFJeDLDoOFmyI2lCShZhLmbOHWYuaw5liy4HORlpNToLW+CzxQzygJxrbuMt6DYeFJccSSRdmgQ7cnUZWSjFlDir5py6A8fUk6XcMkx4xWFpM5lrnZ6Wdvdqvu/eBSH+Xl+HafjO4hS2rn46qqJ+jYKK71eVJm1qlsKXlyQxOp0aXYIWhxE6F1kFKOC6ObCg1NRn8JgL3swMNw8+F9xzeQUaQaW4AqYdp6V9nFhzk/h/RgX/HyzBJn/zvqXNqzCbhtuV+22Mf3qT0WmHeuvWq4iIRjdHe9+MNySToj1ZKJy732ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8kkPI/MwcS8I3GYRXMHAPjRIL5uTgZdaY7byZyINHI=;
 b=YNeZJhlt41b+1EHqVjq+phxTvw75NKCebdYjt/IoFslXLwhWAdQ3PKoz4kKrYfmmiOoKH9JaiLsmx0ttL8eC8pn6Jy5p9cPK46brbOE51iPvey4cUWDTeWJ8tHkh8tqt/p8NQn1CE9CefZFjpwUHYpHUn0iIZ6GqWgFs2XRH/xE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:54 +0000
Message-ID: <875xzkud7e.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 10/13] fbdev: omapfb: use of_graph_get_remote_port()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:53 +0000
X-ClientProxiedBy: TY2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:404:a6::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fef25b-a527-485c-b2df-08dc1ba6ed5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qMw4tYi3rjrqdbkwqIWgGBEofXOs6gpL3PUSD52felfGyKCoNTFQt/fbyU66CZdpIk09+FRI0RCzm5UWD18uYHWYMU4JF7PUbJkS7/JJUX8oMODI2jnjfi7XE6t5uVg5AFw7TiOjPKiRsH2e8dMRlltXczBV6ipRJYMAkUaahXKjLh7AdKK1rvL+nuii/LN2dvvBmFe9t1rs2cAO6pa0+abh7MaSEG5kGISsASkbyrK9n53gt6nmU99elOoyTC7tNq7IEPmCAE/kwS7QbmSIpdQykwMpC6yJb7D+MAq6MjM3OzRVY4COVxCRmMEcQdW1OrzjCfbBo1gl8+BpZf2jbacl4fV1Eh845Nx78rBwZuq+DqbF/ZAMLkeFh2xwQGobbt4RmMfNa3VBtbu5WeBXH/L41GzGxhuKgAvcgy7PmA8oP04R+TXLDFBUDYwxGfpEPY55on04kZHqFuieOHaAJVMt3/O0LENASNf42zD9Pfk7W0iYdAkLkdrEOkrMqw+X/pkEsDW1xSOSlWuZMpog/ZzXDcOhkXDfpsuhyTfvnPruVXPAu+mMdjv8zBiauSMh4MeVxTysvtp3KbfKQ/4NZh+CywjZ1s2f1POHwnTD1e+sfA0+I1HWq+i7DXf2uaUX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gmjtTLifCrkVk2rIIqxySEBXlElTdPZsB9lANZdW9xm+ftq/AIZrKS3nXk56?=
 =?us-ascii?Q?BAfXSeSSN+3EiyILQMSW6dbASiwx8IH33s1Ay3EJTHpFNzQix5DaWY9gTKAQ?=
 =?us-ascii?Q?hJBcxbAPrrKVoEF5tumDWh/+N12YQSBwvxrZ7NI3DecImyLEVHkAM3fPstoj?=
 =?us-ascii?Q?8y/t2rnaCUBmXJZdTZGMQPvNbZq0utrDELRBuqR4jhUbFtlkkWHs0WBecDuB?=
 =?us-ascii?Q?qltq/SfLCuYKuo0K8t8KF5y9W5tt5I4Hd+rlWl879vgloUci2RkLx805ci6G?=
 =?us-ascii?Q?mLWbAwkrkWhoSyGfWPkqNCnA1lKN93ot40gfjryil2Nwe8yCTZPMvug1eM3K?=
 =?us-ascii?Q?aJV9UlMO2SChY6FOe+KpCs+DFvwrvpOcxGnzJ+d+afJYeSP+8rZZMFZkeZlr?=
 =?us-ascii?Q?a4Snw4BWauGFtHIUf6AgJF2SkVMj2kb14so9QnexZOQlzJnqTmg/d6Nq4Gjh?=
 =?us-ascii?Q?Pp5wYukTtzsY4qWVqnnKLycEfO80kybfeE7D42ozo5v7aHr7HRbwGxYWUc5J?=
 =?us-ascii?Q?kKJdfnoWZNBUnUyCrVP0A9AetxO5WPDHbfdSKVBrDlH9kO3B7Yp7f8GGl060?=
 =?us-ascii?Q?qheMSRqF71omm0RPcflbmgK+cZtSwhm+OEHjRU/JfcXWDDeHHKsdS/M6ZYM/?=
 =?us-ascii?Q?t1GFa91DS4+8AO3XXwsmkdSaDfXhx1hv+KyV/r/mgjJ36xEAEmJCVbh+IazC?=
 =?us-ascii?Q?sODHXbobrcx4UZ1iLS1q/LTZwzqo7nQ2sTYWbxl16avkYhh/Lvt91XYBhNeS?=
 =?us-ascii?Q?34CjysrELQ6cpHBVW1LW/Zn2q/xS2dlbttN9WPWw3PB6I6zdeK8egIGMBh0n?=
 =?us-ascii?Q?jYhzk/umDKbF3tst70+Mwft8uLBPUWMyhHtzHLQAy7iaQh/sKAP0d7muS969?=
 =?us-ascii?Q?BHpxLuJkpReooUCO4wnPnDnaCxc4HOKQVVfxLJSuGZP3aEtOBVmG7FKbPV5H?=
 =?us-ascii?Q?CDjqSkWZ4ejdfMhRTANMQXAzp52TLRueY4eTxYMqt2d3kBCIC+Nvtlbq4rQx?=
 =?us-ascii?Q?gHpwonnnYjR/p8HYzwSnrJkMikcUeOdodjA9b/x7aJYP91biSI1KrL8zJR09?=
 =?us-ascii?Q?wOYl03bUFyY4vd75427PhfpKDV3s5l5GDAgR+TetZ/89iU2Bsdor0V4PpoCF?=
 =?us-ascii?Q?2a4SapYHOzTVrH2IeEoSgPUpDqHS0UU5teamledzRpJ4hlNud8UAxsk1L0RJ?=
 =?us-ascii?Q?EIWWvCbuPVC623IWmPwPsAgO3IQmHcmoR5xI8OkMvU/NjUVEVCJjhQpgJ2Y0?=
 =?us-ascii?Q?zFzQB43rLmzxuoDRDFwVHCDK241TWDL55AKgL0/rTMRvrezKM53VnneA3C3G?=
 =?us-ascii?Q?gnKKw4Vj5e+VKFMwQpBuNFFWxtAQfOhBZEP0C8Fn1yj+Xxtem26rSqKLKAvy?=
 =?us-ascii?Q?TayhBI+KeKQgDmtAzmR1PcfOkWyuFWSbsMEiQ6y/I/2hH8lV9k67e5u7OZUD?=
 =?us-ascii?Q?95T30b+zFxEBeoZY2zaGNRnQWKV57mr281w8LpoW+wcnwBV3/JmxAyM/fQBq?=
 =?us-ascii?Q?8lHg1d3YYeQyn35kQjEGGksVeMBeBTUjgjiRUHfzXVX0pEMOGxmyO6E7wvEe?=
 =?us-ascii?Q?3TiQDxbQaYGzv96U2ttKUkKIXgtYOdN2fdtRzhVd2Jk4pBY6tTbjL9UIHTzJ?=
 =?us-ascii?Q?adFVt+5EZwGj4/Z6UmnI2L0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fef25b-a527-485c-b2df-08dc1ba6ed5b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:54.1359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwE8jYfF7gMdO3/+lCQsDD9trEv3cS6BaP6Hr4OVly/8xs40TPieqyPc4dBixSoJuJUV1iBA4rhfYsJl62VVtnluRgNS2PNALDUP8WpkN/VYT5qjYwIhS2lSJBzj7TTM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 0282d4eef139..fe6c72d03216 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct device_node *
 omapdss_of_get_first_endpoint(const struct device_node *parent)
 {
@@ -159,7 +146,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.25.1


