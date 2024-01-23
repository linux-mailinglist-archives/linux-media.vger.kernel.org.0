Return-Path: <linux-media+bounces-4059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342328378EF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58E851C27F91
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E534846B3;
	Tue, 23 Jan 2024 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="USOmf6H5"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCF107B6;
	Tue, 23 Jan 2024 00:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968291; cv=fail; b=nh8ZnZKM1xp4c9OJSVEoe7fLyrkRNNCAB2IYAsOX005gMPd67xvPsIVoK5z4rYkw/RhaqLca05kc+Lu8fNHynM/09EibU8l6bg2jn4kxGs3cQ03X2xATrty6KgLpGrE94JpTZkLcJAFOFrxn+JPlwj/oJAd/5Pc9zA3c3TMBYmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968291; c=relaxed/simple;
	bh=2BjPQdIp6UHDlcmv00uBrxqQJzZ4qHWJAJniszuCto4=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=RIyT/8xbdwA5M3gN/F5PQYoEI0c372ccGBOtIaUaL2dZRP/8TjSOBLQLf4ieOfX+FVftRG1sIztFqKSO9n593JB5rt/5xOMsJWCGSdrAHOnZvZudse+N3pi41LxsFFKE9esOQRQzNa11S1z0CwnsSy+72ITxboB9RWIGGYjuVxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=USOmf6H5; arc=fail smtp.client-ip=40.107.113.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsI0Y7u2luRmLzhso2sXHlvIFwzNwnAwwOXPZH4vERvdqdYaHtt0HBh8h0N66D7ORd5LKQ+6qzbAJu7V4VYPJUqPW/jHM6GvJjj7u84zeAi/pz8L10zMZHeKOMxCUoP1aLKYZ/IUZZ2yBeeJ5KPFtzlU26IpB9SHiCHVG/HSB7AiPWYn+KmusEPq82HVhC6JvVXL2qfwVGbtFtjYMxpyDWrOavprmDXZD9Gck++FFGzlQp6cT/J0XXu+9cByMueNCreP/02egfAoDGnJCl3pmsaka5x1+N+pft16AqHACy53TH8sHMeXwi6EMZ4W15F+j4l9ekcibk/+rbTmrTdyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB8eKp1LM0RONSWqEImVz5fkdtmN34mzUPQSse4mj/U=;
 b=DcnSPgUK6xkl/EhElMZQiD6s7MnnIXnv9HwS0HB6mfg5zXtygLm8CySPXPqejqLvY9mRCllvWoP+5nEQHyZaBAl3pnFQ827EqB+mBS8/4Mh9KCfwY10jrozNYo0mpq1HvaDOiGscCm75FSZLbyOHuROwgcdelGcU8cWlknS2Rit7rT9dE11pvjP6/Rv4zz3cBMXPe5VKx9IhpReBlFkKJPErhIBGv0gCUOq3SezvQoylx5lpFPjp5tzSRzj3+fjZLQyQs3ZYJ7mtEgKudfLBqXfebqnEptlEWkCRiEQ9oGbtmcaqUflkXsGjxqqymLvxeyeGOoEOi31P5gmLpiWYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB8eKp1LM0RONSWqEImVz5fkdtmN34mzUPQSse4mj/U=;
 b=USOmf6H57fDi+OBGFgFVpDHnNJQHMA1/Lrj9hyi+FDNJALNr5ExfpJbtCvXC4v5SgQk0xR8hNP9r3LfkvgwwmbxDvrjstmhK9ASsPeP45qx4dzBqYo8wWXpfjG1gfGL5QdbCjcGk3E6MEZKIMUqZ1yeaVOd7rZI4KX2kmE4RVNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:47 +0000
Message-ID: <877ck0ud7l.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 09/13] ASoC: test-component: use for_each_port_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:47 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: e65f044c-2a12-4972-03ee-08dc1ba6e949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R1fOf3BWvdJAE8t/MHUJqEfiRZmysqEyF8RMSVo1WQmdz2x+XCQ17N6vtL9DWjJqklRNWAy2VxGkB8rftiQgJFmH3N7oGL9fruaPN8k+lB4aRFUZxdefhX2+FSV8Vz1WAdJ6kXjnvMJAqZ9ksSAJaWV0juKPhXwJqYn40dM+McL/CPGRf/J68AsrrUm7c1zNqWyHXpLpASC+Z1JhC+MZXBuMVmhwitHh3yfwUzWeKKaOy3cwWEzVr0ZFchIMWrMPT/qpzKGV3CpnXKOePwihhA10uUDbaiLfDVzkWcba8UXa6i+A8wD/WvuSU9gsaW4kn37SQyiVEff5bzOAUyF4zDGL2mTbf12Zb47Qd/wtN62C7A+PZVfIghFilKkJ9DGeGQrL/gwm/IaARmhFPwbHj3J4Ut/BTyV1Dxlqkz2Iedf3HYq6nifnu6GgPmxIBoYTZdwb8kN/GXOsIXlx7LI9yG9jx3fcepe6PgxK/bHSB4PGZjJge3+dfzdknL5VjAgEZRVOpl6xEOyiZVTeVMc6NzrPZw2pPuPbhncDi00a2QLrnopCFBxIkUEAsxF2vFSdsTSl07h7a0zp0PjgqHEpqYkYqaLmcEYMTihOZfaGYEJlvHWHKI3qLXf5l4rMyQ1Se5kC8GJBHKiz3zZkeFe9ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(4744005)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdlMUkrgcYeOCCeb0jLDDu1CaXTyNSu5yEoxsF7SQzSkKCWV/JIrCUvCVrte?=
 =?us-ascii?Q?poSqK8w4080bVLSDzuQgAY39E5z9cNi6JdhmWNiutc0Ea2IloMbkuqZ/9Z6O?=
 =?us-ascii?Q?V2xqufvDDliw/6/TKYrtQ4B27yQmU1VEuFfS3LeSMR8D8lycjLiLbHIIHQ7V?=
 =?us-ascii?Q?iUOVPwBariZEfx8t6jaHXHuUYzKzmt/F1+FwtApsqfnFCwOJmns+h/TJHbhK?=
 =?us-ascii?Q?W9/jnI1UB4GIeKpAh8eE+uvxVqanYqxwRIXJj6g5cybtBFMhyWFLhkqtHVTj?=
 =?us-ascii?Q?pCuA5mjWig0iLtLNPK0e4bA6xulrDNqvUblwesq7bTV6z6Cwrr8rrXTN49ZQ?=
 =?us-ascii?Q?QAYGk7nBi0dTQmjDeSE9yzf8ZRaahs0YuTIQjrOtUfCk/rpyf2725AVeejQk?=
 =?us-ascii?Q?O+VbTMpqiLH1EXsfmGIZGGahAduo6VE6lANW/T7ofLfIfseAdYlPzUz8YFU/?=
 =?us-ascii?Q?WV/pGrfg10zHD/82PrzOQIKLTHk/laPRN4Fty8ToqtZmGeK1WifPfZc0XZCx?=
 =?us-ascii?Q?uzdrRMzVWodHIa2X/5iu/G3zACthlMjvSF9OK8JjJRE6o1q6f5Fzt7fsmDLn?=
 =?us-ascii?Q?xCCWK7So/i9GmTeRhzZi3JnjPn6RFw7tnSTs0duzJykSlfPTPdthpAszKdrP?=
 =?us-ascii?Q?RUxH6gLm9P0WkPQgTcUDHK4gzjnBk7hcVWa4otBxj0x1EFVjhnALT8JKTpGZ?=
 =?us-ascii?Q?1TzncklRXiT9Sz1vMBkcIuKo6dffDz1j5Q2hths2PJBYu0f5O/5nQFbAODQq?=
 =?us-ascii?Q?LjZVf3OKa4hvCwP9qmdcgQ3Psyst3IMp3E40Bf4h6EFoYDGQH8dGBMYznyle?=
 =?us-ascii?Q?NlHXSCDT/mAI1qpfAIk9bWKfV0Lel8u2yCNStSYLzBmVn4gZik9no05N6wZn?=
 =?us-ascii?Q?OVtE1t43wQMDf/HYxmuyUPlm6mnpUYh0cLdVSPf1AQ6YtScJA/LYmYI3lN69?=
 =?us-ascii?Q?yj9bkAhMzfK08HkGQ2dF7vgjTG6K+EZgo+MFg9l6DrRIPiz19EM+RfaahNp0?=
 =?us-ascii?Q?/Gu6MHrLWhiho3tFuQK/hFm3hdTAfEXipt8QyM/+ga6V/wQy0b0dttZv9pzb?=
 =?us-ascii?Q?HBHUhP8JLwyxhH5/C2mcteIXE/uTkn4q9z0Vr9e8CktmxgsEL/DvhN+d4H5m?=
 =?us-ascii?Q?8zuyMUiqFYTBGYcTORuZAPO1BELJqnDh2MJop5yYW5xeBX97//x/zIQQvaXF?=
 =?us-ascii?Q?r1DtmMi6EifxZcybNVzdbWL9FgVExTGfXD5M+Xqnt4pz+apHH2h6LGE2/NIA?=
 =?us-ascii?Q?lrfXD/TsSKknnp2MgD3Ww3GAqKNK5IFSdu9NJahIySWMgTHvI01gLsdut5zg?=
 =?us-ascii?Q?vmERxqpb1zle8wM3VEXdFhw/szdrS1EFKDRFFuAkC0aFnaQ7lDm4Tf3wZent?=
 =?us-ascii?Q?342M37kQtPzJF0e8YyLG8iB+mlH08m76xdSkmEm4Pm8eyR9FNLOhapNty1z/?=
 =?us-ascii?Q?TgD25K30ZdRxxLWfNrK7lSGIq6qmYX/ql4b+ZqmO/z+G7bVvlQp2FtI+xAYz?=
 =?us-ascii?Q?z/bjEN4ZYDs9QfwC4AU/Ua+7bJI7GP2WKi0TehwzvlLevW4YfJSRYc8IwSZG?=
 =?us-ascii?Q?ICLnSLVIb7RFn3Yiu6Q92KruodRzNFQAD2va4trePxc5Z2PQQBixZqRi3Au9?=
 =?us-ascii?Q?mRR2ibMmo0iIv+WGNWtrjmg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65f044c-2a12-4972-03ee-08dc1ba6e949
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:47.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPGm9+44sC0qbS+yKfq1WpCFG1A7S1e4c9sA91hggADbUKSfGzL1p5MVGg9ID6Sswtr7ActM9Z+kwH8jXOiF7foWiBywgPPZIjRrPuBgqEMNoYvRxUJG0a2Sh5qROw/M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

Current test-component.c is using for_each_endpoint_of_node() for parsing,
but it should use "port" base loop instead of "endpoint", because
properties are "port" base instead of "endpoint".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/test-component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e4967540a2e1..4bc83f141fa2 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -600,7 +600,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_endpoint_of_node(node, ep) {
+	for_each_port_of_node(node, ep) {
 		snprintf(dname[i].name, TEST_NAME_LEN, "%s.%d", node->name, i);
 		ddriv[i].name = dname[i].name;
 
-- 
2.25.1


