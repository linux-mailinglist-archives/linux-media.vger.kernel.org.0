Return-Path: <linux-media+bounces-4309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DD83FB56
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 01:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45716283D67
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6FC9443;
	Mon, 29 Jan 2024 00:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U+G79z1A"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281FD944E;
	Mon, 29 Jan 2024 00:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706489720; cv=fail; b=peedkjjrTfciL7hFWz7SKqpomY3349Rk7xq/U5l8GuD2uf1cXjLbixcGUW7bUCruEhD2WWNwli/Uv+GkFAryowwnUGhl1C4dPOiZ69WOsSyazaKDenGAHK+agicmrRz4OXzv0/C/c8ZXIE3mKBPvq4Og5bZl0tDc9CREEVGUico=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706489720; c=relaxed/simple;
	bh=+OSaFJVpkTcck8y6XebnUqDqSPv1A7z8UHFNplh5zRk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZJeWt/RDp38EyUXesyaKP/0AxPKC9RFpV2s+3EjOSI0VTYfXXrPcJAVrD8ljNO2gbyXld0o3Tx3EMCrMeN41T7FJ4cq/TFte0LwrNkVGJknKPdlXyu09uoRyKGRCkfTJbpkZS7zVmIdTVQ9TiMWlZicMqWBlq63JgH5g0EOizJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U+G79z1A; arc=fail smtp.client-ip=40.107.114.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQ5S3IbyMua/zSOg/8zmkykkbi8TiBntrG4QGlEm3KR2F9/BnO6RmHEP2G+ToXamNUbbs80xZZjX1HS39OoYremUSB2E8ynDHR1HN8OWOCIOnjaBjFEPDjCNMgoJJgddgJfDek87jYTvViMbfaO1BfaQAxUWyeTD3yfRvQVnbvcTHxDwnH/8rdu7ElvXQT/gtx/b6/Evz3qfFQK7x1rCqd7THdQpwK7k++wTYjmhDmQ7ztwa0QJ2ekjx/KUUHWOPn4Jq2juGj9R8kXkSxrSybx3zF67H8u/fN4JwdgvoVHzBEl7Xs7H5MvtLLDM77SVVY/Gthy36gVQAMh+ZpYUP4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMIqf0muAwUfbN8dQK2ocuBX9q7rm/EQZ0Dyn6Kcphg=;
 b=lo4By1Kh52htE1qPVTp7y6X0i1Pcb9QsXOiy2z+srB80vif5HizTyc0NOzlfPMpmbwUZ1uIDcvt5Ine28ZO4qo/y0jyB9+xzNDH14oER9bNnYTCHC+8CXElpgFRmvaYyVH0asW8P2noqCxbaaXBFG9Djz3Wh4yVmhDTc2YYhrk6qk1bKnb9R5Jkl15A/Ta+ND42m68UBPZOHagu8lcsG4v7XzLbbuqRrgghziLl2TK97sma8aMsNBPhbrzmvMM9GsrvjldCd8rUtGjiusF3S8V/JAOz/F8bCdbgPMIaqPveLxPh3N6ODDqmd0kyn920DAR4X6femipCiA/aLXMZhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMIqf0muAwUfbN8dQK2ocuBX9q7rm/EQZ0Dyn6Kcphg=;
 b=U+G79z1AHwnyMdczzQwOF74yjiZGaWGeoEjrwn94qOjErM+VDw++1HJn9qw/d2VTYhUL6LwYIMKGHj/8U5mFhz16R4hXbpqXBs8jdWdAiVbxEX9mdNPFjMdC9uxWhQJiRwZk7OqiW8fj9vQj8hkPNZZiG0OmexxfEJy2+daIqgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:16 +0000
Message-ID: <877cjtklfv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/13] ASoC: audio-graph-card: use of_graph_get_next_endpoint_raw()
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
Date: Mon, 29 Jan 2024 00:55:16 +0000
X-ClientProxiedBy: TY2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:404:42::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 81234255-c482-46b7-f5af-08dc2064f581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1tt+C6jeUihbXLkrOUgzEhFN4+OdCwcw+PVpz/WfBas7x4UXLwt0DQMjsdsu5KcghvBnQvziQCtVjOmp4/eJVj1hlZnu/TYFAd+Ezn4nqYQu7qaf/NSjAB9VvpNYC1grzCcZYgvRp6bbXTnkzy/3MgTyi0XJe695lAyiEwzvkVTKQQp2OcTO0GpuryesrIfPgIoX6fdfUKmjedS51NI6kV9UkGLXGtCgXa5Z96YrJ6W6LM11+UBKfsH54cASLCTKVxayxlXMosvZ6nNxJcgvYP2rrAJTzHFMQre5midhTG9N72ctBg9XwTayaV+TXmCqZVXI6cStoMdhBn7lxVn5k43DlbWOTbo0SW2fLIZWJx1UHFApUnka6S+Z1iZqiq5p6fsXCbTVM6CcNDwDhfzSzCX27YA2CwhJLn3YjbSJu5wjPjNn61BsOwwuDRYtM4XYeUX/nnktiQHaeNtBOmHhA05C6zxfiIhcJxZxEwtuplYQU9CGJpAv3eriXTPZGO/Bm9ZDuymQR+ZWt+ulX60Yda+fMQvEXX5RBTGZDV6Q84vWNW3xJ1OT910kBbrFQMVxKB8L01M4sU5du2MU+Ofa/TXHVoeft9NpClBpMvN7oqG4YyREVTtOWEfxkDgC26VxmcWYiSzAhRLdd+u+zAHlVEPDTIOowx0MPe0BKGtXsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(4744005)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4eC/qlyhGRoLtdG2Rs3g2BodsB0Sp467jsLG4ML9iT0pM4T1Pb7ZCBl7GqFr?=
 =?us-ascii?Q?5Ak2YsO/p9BCFzC/4nqY6T9iKIdJZGWn4z2nQqZ3+ETTbIVDjHRad2liQRfN?=
 =?us-ascii?Q?suwAxNa2G2Nffhyvz3CB2lI3/ggeCdqY56XNybZT0qLQrFbSW3I1xn50XYhU?=
 =?us-ascii?Q?XKGB4wuD7dGWHGTCucf7ft8rW0b0Gp/7jfZeqHOKbhr+HszBiXxg8Bx8JtJl?=
 =?us-ascii?Q?/8y/hD2XMuQMPvIp6wyePHfn06jjmg5IvbOzwyvItMk5MysyVWUblQSfxgem?=
 =?us-ascii?Q?npgiDsdyJVyDo/Vx1N1MB7xUtFnI/g8W0by5fuMxpKKCyaWRY7sJ2v0jTzuU?=
 =?us-ascii?Q?MOcfQ/iqgl2jeQG4AXddD5usgDl3ACCwgYmoZ0iaj7BpGnsF74P/2xw/a1YI?=
 =?us-ascii?Q?79xUatr6rfVJGcIYNQ5PLCI5drzXxjtA1obV+ViLoChPSaSZhWOoI/MrHEJE?=
 =?us-ascii?Q?gXHZQ8d0w1y5x9goYzShewMYdqi0BeGsWyTEjka7Ojy3s1en0QtKQfacrOsw?=
 =?us-ascii?Q?VmMXAdYaP5hDJzInGU+sK5M7DmP2cNxxNx2llJvsVjCgWr9y2oWc7Dy6VCBT?=
 =?us-ascii?Q?Gkk/KzAX0hueGndHkyUvoAFVAhc1esbQmAlM/6CoKKaIs/8ScEVAMt12xeUr?=
 =?us-ascii?Q?P1Q9oBurxff1sAa3pvH4PBVlpWhvWmxHPlMzMrR2Pmr3um6k+qvQ9VvkDUXx?=
 =?us-ascii?Q?fsNeHNLK+iIyfFvODo3YSYZjZIIS+x4m6J4t6BKGwNHRCY00EFp+EMdCgTE3?=
 =?us-ascii?Q?KHdgYuMOoXJ3GHCoHfLeKwr63VrbLvJ6SB5B37BtxEmPhYBjMN1Xv0wcF5Go?=
 =?us-ascii?Q?O0qDipXB/8wJHqeYw7vHLtkSN6vzzNLxYCgIYctYOtGhRgtUlejgmTeav9BK?=
 =?us-ascii?Q?q3D1PEI4qjFgsl/G6NA5q6dVNKOzIFvzDuWv8Y2uL3nzWTGJ8oPbF+pvc42R?=
 =?us-ascii?Q?KsspJ7JBdZ1oOK7dqOchgPv3EKCzal366TR6vlP3MVRxDnks1jMddBS2ydXE?=
 =?us-ascii?Q?Rq9LVE6jL07hsn6gcTFY05zvVB/Ge4+7ngRzLV35W3HapJIHkexKhJaHmOeY?=
 =?us-ascii?Q?RnDw0s8gCUQnN0LensWr8F5Yszpo3h+FH8ThzHwyFcMj9DQQe4ZDbWKqFj9q?=
 =?us-ascii?Q?cvVEpAzV62zd2FiArFnyawBgmhwF1skIXZVLH9J7PJK49a/KALTND8ODZRk1?=
 =?us-ascii?Q?9yAfLOn2npmRTeFNli2M8YCMoPnttAKPmtmwp475qYv1qyty92tfeujxvr9z?=
 =?us-ascii?Q?xMxvO1INGZMBx9XO8mVlTxuAGg9WCac2l3JrSTBpOdm8/Cb2JmdZM61d5/Tn?=
 =?us-ascii?Q?gFOWCC99BoEX7kmPUhjzzqLrVE+9bcgLWYcJju8tfRjJ6Xq+Rvs22Hd8p68+?=
 =?us-ascii?Q?FIh0ZqgNdMFF3uUu1RyfQxm3Xu01PN8HwL2l8d1bI8DLGmB0tWj3fFLBusoI?=
 =?us-ascii?Q?8Jx5jwmm9QR01d5802xaAekzyDIUfLx3XHqnbHwxhpP25xVq1LGaqxVv6MgQ?=
 =?us-ascii?Q?GeYIuLK8ndw4++5D9RE8P/4X+hQzTiYZGeA+9lqGf/18m4XDvNgfoWJsRDxm?=
 =?us-ascii?Q?T1PjJEWvH9/kwHDETq/zbkOs73W1YNxLFZS2rKDph6EZeAUT3rUeWqrCixuE?=
 =?us-ascii?Q?z5WFsb6otVXMMIxgQquuX80=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81234255-c482-46b7-f5af-08dc2064f581
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:16.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+kzJKChupgjrajqqA6B/CUILLZ+DEnIW81KU6/UXTkrwvJn3UCcczqtEUZ6/dGvpFXYNvhlgorzWc780toDA3r1MeiIqodoAC4gOyvJlNjXHdlzYakXoov0eDKrhOuA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd..29bd7c234fed 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -344,7 +344,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 
 		/* loop for all CPU endpoint */
 		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
+			cpu_ep = of_graph_get_next_endpoint_raw(cpu_port, cpu_ep);
 			if (!cpu_ep)
 				break;
 
-- 
2.25.1


