Return-Path: <linux-media+bounces-4055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8318378D4
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3EC01C276D5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6132C1B7;
	Tue, 23 Jan 2024 00:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZAk/VbYW"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E7EEB9;
	Tue, 23 Jan 2024 00:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968263; cv=fail; b=QLez4mk2QSFQVPqJx5U1aqBHOOn1cLRV54lbYGYT3JD/C4AzQXrfeABK0iULEOU6paWyFRkrN/mav+gujxuKky84TVqPVbNnWzCnMCatHT7SfpUqu3drRfKh6iYOQGvKkVUjmxKmq+ClM4P80FAT3M1xBBTWhOAMAZnJWdScv5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968263; c=relaxed/simple;
	bh=ffS14aV1Ln+TfLGSo/g586z4rf34Vf14zbKTRPb7wEg=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=NvCQ4+EyrsBDQuAeW1kpf48+vnQkPXE7V55ZQxpJNmD7W9EfoohwmA+oHPRNliTZN7N9qgiSAi6FNqZl52So7Zb0nZ2F+VtCeweb7zYv9Q5PDANsymQogPUzebMFPKqLL5kNPnZXDsyNeuIr0ra4s2/SZBC7QZq/AE50I/Sisl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZAk/VbYW; arc=fail smtp.client-ip=40.107.113.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLv4Y1sL0aNB0LIDDakcNIHTwT3sFK4CyQ0gA9fdqkyATsAxl8ki0GxPOrSbQZL7nFOJOdvsuXOysL2JMdZhC0IsNhvRZQ04TLS579H4+Ca4GhLUET6D43JwCP/2u+BvHXuGQfJey5jP3nALPD8zjUb5iSYrd8HUVytQeBzpNJHm//SIrun9NC7Ny5u+xOZ3opsFQRkRHqTWDebCP0BaoVqY3BwsW11XdNAV4hbAu4ISWVpTDxNpfFL9F9+96uCYqGqQoy9xgYBG7fCScwhPfJbKZx2CYtX9N41XF9Ki1NnkY3VhqpUdna3cLAZb6atk54ZopP3Xu6A6cqFw96l8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doHBcvAYo0yrIjFUYG+DMNg2fMRtjrbfAePeAn8BweE=;
 b=USRsXq1IKe7v047MgzWkjciNwH94rAehYC3JR0w8HFzp7MQUwoqBNT2ouHtxqEDsl4DXk5ggP8EtI7AeINFuryzEOj73xMrOtOQsb6YA7gKC0FmZ6R+AyLh4ZdMk6AEpzSSgRmVXqIVWjBzIvBFb5p0s4P9tWyCaZjrAqVpH9ozZJXxjf+bAjuDvEQj6idEWuEtOtyjLQWruvkV2z+zSh7OLcPFIQN5CVfhQVboyQJ/tkQqoccG0mB1L8K0zoZMXQeVHBgyLUK4ZQHQTw5cxRAtNdGbWMVbSJdAVz8NGpegsN/cxH+Lin0G5FD2KSjG7gQEKBUbrCpKM00GNeU81/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doHBcvAYo0yrIjFUYG+DMNg2fMRtjrbfAePeAn8BweE=;
 b=ZAk/VbYWPdkN4O47A0/XoLMC4P5Bg7N7l3gi0+2OXID8G2pp8drwcvaRMhl6eB//He59RxVcqHVUf2dh1gRPt656bF8yWFXwocAWkNtslVcqe6GoVW2Mdhs6qB1DUh0ikK7qmiDNcjnRMY43YWSuTgK/oGY0uqaGbJbcLlIUX18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:19 +0000
Message-ID: <87cytsud8d.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 05/13] media: xilinx-tpg: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:18 +0000
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: c6454cd0-13dd-41b4-04d3-08dc1ba6d87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C9eKte8c5bqvP/Be6seKClBHLOY/xdCQhslMdiVAWMWMwCcJYnU0GBOdaCbDiCfy2AKJKiXlPvErZal0HHYqlpJVpNCxPOj9mjcNeLmVXHOSX48Rmi5r6jROUP28TsbOJGxBJnVPw+zhadbsooVVtDeCp9VDUCeTrmkjgbs2kXZgOAv+kOQFSEnXGtU288LI2swCzyglr2h2BVUiC0/LNT8DKzJCx+Rbch0ntKSRiXTXUMyx3FlCvA0yuY/JOJP1kb7WZ4RMo1awBOyzIMoFPP0nH46zOMwv0V+WmnZvUkVBkaz58G2qWSZYDkOCqdF6L4PpeafCiS0j8k4N+KZ7LoJ3SMUP2kgy/bMOjTRAgRkX1LaV2i8K0lEKy0YUq0HSWDVD5mafc0sSYzltO4rfZV1RmZBc3Wi0oVDw1EumJnV0spQRcIOrX20IOxNWEFbxK1ia860H6AlNtgwy4VZwMBOukBnnijhdQLh0dPQZrUtkw3irc9b58fEQrFICLEWIUhkuInESDLDtXUFoflPpnsMLjbhcKvmbRXtCzQBk7i3ctE+7/HozOwivwYbfNeC4UhBSIHxPoZ8D7KlAMCOjuk8IrLgooVlbHVTwwG1bG6SwDSdnwg2R0ZNGS3wz67qB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(4744005)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Z1HJCW6/9/4FxCpbeg0l/NJ2qOtGnd14ArlNBz0dHtIWNgcSIIN+x7om5XC?=
 =?us-ascii?Q?LD7RjPVfwu2s30nNCfpBLsNqeFbX4fDc3VecH5y/TORh1ASE3TE6oybRfMe7?=
 =?us-ascii?Q?hKWmv3i9hMBUxxF0Hs9daphH4A68AdrajrUqBjyJxp75rhxuKJ9NQRxhbxPC?=
 =?us-ascii?Q?STAqan5cl8toQlVnrD32Y4lz5qAjrhJU3chYji5LBytCufHFK8ObP/HIwRZM?=
 =?us-ascii?Q?ySUwfz8ma+NEJ+9+w6XBMJ+xfHV95IZM9ey5LQYDdTrDGkyNVy5Hk1ddylpY?=
 =?us-ascii?Q?He2PtP/ZA5DyVdUbOUmEKAj2Be6a5QN2hAlGvGl5Ibavlr675oEdEDmKh0Ui?=
 =?us-ascii?Q?ANtHBJ9nNPacBs+6bLwb/ofGL8UpejSNEtPFGUh4cfjsstw3EAQjrIxffZxI?=
 =?us-ascii?Q?6/Ym6PkHaqdYL25MpyjnPiUYatyOaRNHeLbVBEblWwtkhBUbAbZ5Ikd1wI/I?=
 =?us-ascii?Q?wpBfR9oawkfNuVg4NX8Au8+zB8XSIaeTWu2/eWAw9gkB4XN/hHW6c8aAr//l?=
 =?us-ascii?Q?iZKCYyvwoVPf9VhE0B0NJ/qPD/gwWTOwNgc8WNYKOJkB7lHuuvi34QC75R7X?=
 =?us-ascii?Q?b0KZb7HC9rfet+a+A8TsxCpJdLTU3kugJ6jWfAyQhiSzAPd3tcZRimsgJp+M?=
 =?us-ascii?Q?QSY1ojCO8SaWcMpiJb+xm34xHAEBRcNQS89x0tQNVYSR7L4Szz8w9z47sxtu?=
 =?us-ascii?Q?4l1lKnARmsfTu3W2tVO83wzxkko4wX4QhdE7Hva5SCTnTLfCEjUTo6vk1GXq?=
 =?us-ascii?Q?WEZOG49X1K/8bl/D5D1y5/OWLxG6JkoTOr90ryn3mW/KeSR7Xo/SINfhUOx1?=
 =?us-ascii?Q?HfedOoCAHPuYDTWFwGCGDW0rq4fTrofDpwZCQy2spHvnRsyur7u1KQJTq2uP?=
 =?us-ascii?Q?s4R22hbK/O1BxYQcO6pzlxt14RXf1eAp+ciwbyCvGMgYRW0yhYNwqsWKNmdM?=
 =?us-ascii?Q?E593ptlu9PAJVeQ1KEqVIQt3mDH4/GQodg4QPqlcfXk26QC/0Z4pDaxjHY/P?=
 =?us-ascii?Q?RHGUrSpvAkJJmQqxDBmy9+3+x3AYbufbWhjQfukaVnjy3tntWU1xzZ81xO9z?=
 =?us-ascii?Q?HjFPby0DqMEPNVt34zl0BM1tuFWvjbFfv1UNFCg+nSyqaM/GkJMj7i7Fyzie?=
 =?us-ascii?Q?adEMTuB8rklD4DP+k9iV3uKadCJ3ISW//9gPYcubkMp6hCvjSO+K7myUvLae?=
 =?us-ascii?Q?7ZdT3IPO9cbMXQZvwY5/vJt3XUJm7+d0FGAgZ7DAgRHX2VK/g8C6iB50KU7m?=
 =?us-ascii?Q?nbuPbeshDz2MHRJB2epwKcT0sY1rV7L5n7Ny+0jGskG1PCD2Jb4xJj30R++m?=
 =?us-ascii?Q?2Rr6eQLMe69m0Ak/c9VE32Ics3G8uUL8yP/qSzuPx2i8wiISFl9CUQiFjuOS?=
 =?us-ascii?Q?L7XyRl6lLQqTRBJ090uJGIwCtF2ee5KJo4r5g/Ck2aa6fuPWJYuSJnrHQnV2?=
 =?us-ascii?Q?dYtVEGlfYKEOo5Am4SA+f/y66Z8DLns7aZ+eUxYStp4vyuz7RZ8vYKsS29X3?=
 =?us-ascii?Q?DFekgZIzrE5LWDrferSQcUODhAkyqrzs/YL4Af1gKxE6TgKmYL9pd4s69xE3?=
 =?us-ascii?Q?pZ/eM6SaqaJe99uWqhZJLImhpywIh8le3+Lp1Y3XEjIDvrsalCDSz4bXJgss?=
 =?us-ascii?Q?xqgxtiT4NfE7Jwa36ovIeDk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6454cd0-13dd-41b4-04d3-08dc1ba6d87e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:19.1473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7HVhQpsfFIyASFNggCqA7uQ+D2pY/gLz0T3DInsUn7qYJZmsPBlcxQ/+5rsKS8YnXZxQnYNvbUwk7MKYL93UFB5hmqGtGlsJRmH7YAKSlinC8S8iCJjEFMfRkvQlXEG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 80353ca44402..97908533466c 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -745,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_endpoint_raw(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.25.1


