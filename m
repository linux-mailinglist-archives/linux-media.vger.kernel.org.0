Return-Path: <linux-media+bounces-4536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E809C844E09
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 01:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F56428B4D0
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 00:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C6E2119;
	Thu,  1 Feb 2024 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Iv2qUtdN"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2136.outbound.protection.outlook.com [40.107.113.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D53C24;
	Thu,  1 Feb 2024 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706748196; cv=fail; b=b3XkxCpJfvR0E6ckT5egPbFidDoDIVblMo2eiswbZ5rf67PVx3jfBu8NmrVAsV5iH76OlBvVBZ4+BvHDSiyklRLw3bU1FLP3fT+/06y8CR55Y9QM6duDCtsjkhrd9y/ex1tmhUstfqWKrCw8rgeeDtYZSn/3Dm9ZEoUhNE4sD4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706748196; c=relaxed/simple;
	bh=67288pCjgTpvjr4FV9w7bdO/8FxwcH/rK5yGVuc4nd4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SUf7L/hIt9NwarZnTlvAV9Q14bCL5EqBRbUwCbeuMW9tEGXzVoo9sowarGEscTIfyUVwKm4lF2FnlB3VQoWjic4a3EnK5eIsVufbQv4xf/TPRrUoXrpIDjj5835kpUrhiRxlodE03Af1V0olau9oELOGi3yUxepMKyrWcr1wCmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Iv2qUtdN; arc=fail smtp.client-ip=40.107.113.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7LxRi04K6J0bQg7+aqT2qIjXsz6RVpBnBbBoqn0QmZZlb++qMmsZwF3UBcRhjZOgSFFGKkU+uyMxy92uXZ72Tbp9BfvauHfvkAV2W7eJ1Atn7PKAv9q9l2W1ovVnI95VTDkGoTeyQzbvoZOyIdnKaxdyI/J1n63nREjkEvUEtOaWtHCYGP55HDBEYvTfYA2bqmFz1M7tBJFgVIAXGbikMCBp+uEHfrli52MZbfpnTVGG4TMDqwx9ldQObAGWmxguFvGKHoOWtKPhr69LEnTGpXhGZhUVT+fcQ2Ek7BtqiRmZ7auvtD/ChhtKNeM3he2ro4qo6bgI4gRl+NlmZuaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x/p4+pa2t4EKlYXF32cxJddgQjqvTnbKh1fgUp//Vc=;
 b=IdpxK2PZg660W0lI2/Glb9akuXRsHWn4v+f3VsdPIBfZ+sL8BQBuKO5ysWHyAPHVVSaExOXSoJ2YGdxVN7rcMQzto+A3jMLLqQC9A7WI1hHGfo9x844U6hY68nE6hwyod8qjvVCG78kCDlaO2jWKF6vLWIUNn5U7k+MmtYIuGKrNBbIZm0nB0IsTyE071r6HJZ9XLpDUI6iSBqcrI60QVisGb7f1nnz4z3ceJlXdc2fk6goRjPptViPgxjdmqY7kgIltyYFc1sP6lB/SI4A3Nozhxx/2Ii9Vmo9fCDySsLm/7o5r3dWmQ8A69Lr9ZTt8nznUvqtGuoX9JciltpWonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x/p4+pa2t4EKlYXF32cxJddgQjqvTnbKh1fgUp//Vc=;
 b=Iv2qUtdNrQK9kc7/Ki5Xse/joYxtKtc7Lxj0vrItO/huL+KLWoEfGWMbnhT7jasQxDI67HnDJK63Ty3RVNK9ZcYoSHB+l75ZNm32gggWX2XfrHIthrdi78xZF4TygDhxA6nE857ipe2+JZXZ8h1W4Nh42dhOqSAq56rjFrBPWf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYTPR01MB10920.jpnprd01.prod.outlook.com
 (2603:1096:400:39f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 00:43:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Thu, 1 Feb 2024
 00:43:09 +0000
Message-ID: <87le85nher.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,	Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,	linux-sound@vger.kernel.org,	Uwe
 =?ISO-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,	Daniel
 Vetter <daniel@ffwll.ch>,	David Airlie <airlied@gmail.com>,	Frank Rowand
 <frowand.list@gmail.com>,	Helge Deller <deller@gmx.de>,	Jaroslav Kysela
 <perex@perex.cz>,	Liam Girdwood <lgirdwood@gmail.com>,	Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,	Mark Brown <broonie@kernel.org>,	Mauro
 Carvalho Chehab <mchehab@kernel.org>,	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,	Saravana Kannan
 <saravanak@google.com>,	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/13] of: property: add of_graph_get_next_endpoint_raw()
In-Reply-To: <20240131184347.GA1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
	<afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
	<20240129130219.GA20460@pendragon.ideasonboard.com>
	<20240131184347.GA1906672-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 1 Feb 2024 00:43:08 +0000
X-ClientProxiedBy: TYAPR01CA0214.jpnprd01.prod.outlook.com
 (2603:1096:404:29::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYTPR01MB10920:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4ff4fa-7226-4886-89a0-08dc22bec300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UvPuEJvicTZl7DvMIUS/uELbmvNxod1jEPWvObRHNHBhKXMF/WaZoLhwKRjmpMsFlX/B5xMgMFBUlRZW1+R+l7fChKqHn2ZtWMtrfDOFdyZ8ffMse5qWoP2d7aM5hFL8ChlrYORCe2I79IiKX9iZEeiPVUzXdS79Vy+NmlQAP7GMN/ZR6GlY1uIvu04uuKfnDjSYz1i3xBfa5BKYvJ+z1nWsoDOTsw6lvidydamGzfVspdDQR4+eRelEJ4+26hE0pKmffwZ3s4dMeAMi1cSMm5ZUeRQZ6hlExGQXX1bfbrYvY//ScuxgbrAeiO/gN6uLDHXR83aTZUyiO0NPoGTOqnGBFfXQK+QgDH76qfzYbIHUJm3+l3IdOxUQTrCOECegqxvB3xAdJfpeQSv+YCA85EkF2vA8P+auzz4bAfhD5uGIzlkDeOdopW1hUv4B0XJPsVWtL7EC5ITCIAK3mGc8Tp4Hq9qDgZ6pGe5nFZe+kVuTb5rXHP76AewchQxftKY7t1NXwT7CYF/J8zlHf19fz6NEgKippaAZnf3zYOMlWLlkNKsyXYyf1BlD1A0Yt6k7n/YSQV0sCywJBpUhs8dUBkIXt1ndGt3w0ZmMXf2XyLkcndBSA9WwtZK+OO+XF6RV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66946007)(38100700002)(8676002)(316002)(6916009)(54906003)(4326008)(66556008)(36756003)(66476007)(8936002)(6486002)(52116002)(6506007)(41300700001)(2906002)(86362001)(38350700005)(7416002)(5660300002)(26005)(2616005)(6512007)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mw8hXk1ZoL7KhPEDFLdPatjFmILDqO4wCymbLHDFt4hlj2b1g6ZTIQR3nWuO?=
 =?us-ascii?Q?2k3BXSUtY5tfemqUzFsKFFzcv8UN1IF5NrRo6ilI3mnClKwvSUKzmIcIbIZ3?=
 =?us-ascii?Q?xBi+EJYb4GX8JVVkotdw43LM/cR33qWaGXlJSXjLm0DB70/PXGn+JP2ju/W2?=
 =?us-ascii?Q?4S4kyk7FcMawqbDuV2zwpTDNM+ctvvOl1GFUVgNizsZuC6Df6EtB7KWVI+Ja?=
 =?us-ascii?Q?ANWWkpcftJR2JGSbJfWv0rXxWaGIes0nnyYj5n1x9VVLU6xpaEwrABzxuqr7?=
 =?us-ascii?Q?q/dtZYj/+8N+vP3AeGeD4dICf6XVMaAGdbYFe0dyTiJQFAIoDLupwgSwMCHj?=
 =?us-ascii?Q?HQUUUQTjuf8a69jh0gX0NEoCT5slx38WvaH9wEJTWAtMkCONkuD2VK1Yeiwq?=
 =?us-ascii?Q?1/fJKws0FUIwtYkyj5yQcqCTLENbhSUEIDyhbzuYknA/hRxHWmD2qWu1PnSI?=
 =?us-ascii?Q?Qj6BCqZnE06nWBMRI5SseCOEYozAWSxwQTHw0sfoC1BAyAeeHGOGoJFTr/4H?=
 =?us-ascii?Q?H4GvHKmt6vpO9Lm1S2xIv7kWp84Zzif1NW7yLWVEnVvkIr+7zsr0zFPaFI1U?=
 =?us-ascii?Q?jGTFa4QIzpOweo1fb1Yio0DXKAUtz+IRl6ZAD549pQnPz2jlwoRQqzUXo7Cs?=
 =?us-ascii?Q?VezrDoYxDfpruugb9sT1Kc6Hlduxl79s9sLqChGNOjz65cjpwshcwo/Hszaw?=
 =?us-ascii?Q?/qxln8SsyyA1WWIFavdJAXvmQFHvVAVTSHGmbk8UhAyYLIF9Rn8ZlrguNk4V?=
 =?us-ascii?Q?1vHwRfDRleSx9441qu8ki/n3F8RLCcmnTr14BVjaGdEcOWni7NyrU5o3EOWH?=
 =?us-ascii?Q?hvzEpsTL7r/4GUM5UgFG2kgsQhBszO1bXS8LRp3rUynm7Q+YwkaX2aUnuLpg?=
 =?us-ascii?Q?Xul4ZkrLQxK2yEKxO6RK86pSdqIoSMLidoienCeYPhrs29VMchawE8lUe16I?=
 =?us-ascii?Q?Wpopj/Pw4Fso+v+67iC6qHJx3I5G5xsDFv8bqIe/V+niv8MrP1ra5H2zDIag?=
 =?us-ascii?Q?Dx+zvRfJ/uN/DNmj8K2CrcvggR2CcOp6tEeNt/FoqspWJi4k89It2xIPhfFk?=
 =?us-ascii?Q?i0uFSZrfonATLhAWQCVaHoN0GQ5uFY+uajo9G1GF34f2KpcJQ5K1EUh57PCN?=
 =?us-ascii?Q?dixOpTbWQLz2ZJBCAEqjXD3wL4CNaNx3zzax172638LBFylJp1GyWY+KzTsx?=
 =?us-ascii?Q?w+1rX3mjj4Pscxlo91oOz9Zgw8pAf4zDVlyo3d0/yQd4vDMUYFuwRzIRug9X?=
 =?us-ascii?Q?0PpfEf0RwHqRR9Zg5S2X8HQVQ31I8IlmPpiW7LbqM2WRecivolVjxH1FReT+?=
 =?us-ascii?Q?O3enHc9E48FyKPwJtWr/OID+8T9qZ2Sr5WfxCCoQR+UxrInFyug3fPAex0Nv?=
 =?us-ascii?Q?+qObMWZQCBQLmU3wU3bNWCynm10drvRXVMdjHJh79MuT3CiMiqjc9LyUvAVT?=
 =?us-ascii?Q?QHxoOzqxeAdIdpu6lzdvodYFCtFVPZCIXQoqEDFDogG8zIXRWnqGL8QZ6GZr?=
 =?us-ascii?Q?jWRZ+Iqwyuae0dTWEIx7kyb/g6eupzDSb0N7cU43q4j9HcuCaABdPh3H9dT2?=
 =?us-ascii?Q?k9bBgzJY5f8a/R/tE3axy2gnL7YSEowwV3ty/cQcgP1viedOQX6+ort1iHa8?=
 =?us-ascii?Q?JGZZJLESeFxvQIThkGqcdDc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4ff4fa-7226-4886-89a0-08dc22bec300
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 00:43:09.1693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrzBvLoTrGknaVnbUZ0wtRJ496pXnFW/35y4H56GiBlHdUdmECZkQ6kRc/k/HP45QssxRWyAbxjZPh5OXM0gDPoysitGXYmXwsECb+GrxBGiV9kR4FsM7bWbvHXMgHfl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10920


Hi Rob

> I think we should get rid of or minimize of_graph_get_next_endpoint() in 
> its current form. In general, drivers should be asking for a specific 
> port number because their function is fixed in the binding. Iterating 
> over endpoints within a port is okay as that's usually a selecting 1 of 
> N operation. 
> 
> Most cases are in the form of of_graph_get_next_endpoint(dev, NULL) 
> which is equivalent to of_graph_get_endpoint_by_regs(dev, 0, 0). 
> Technically, -1 instead of 0 is equivalent, but I'd argue is sloppy and 
> wrong.
> 
> I also added of_graph_get_remote_node() for this reason and cleaned a 
> lot of these (in DRM) up some time ago. Because in the end, a driver 
> generally just wants the remote device it is connected to and details of 
> parsing the graph should be mostly opaque.
> 
> Wouldn't something like this work for this case:
> 
> #define for_each_port_endpoint_of_node(parent, port, child) \
> 	for (child = of_graph_get_endpoint_by_regs(parent, port, -1); child != NULL; \
> 	     child = of_get_next_child(parent, child))

I see.
I will split this patch-set to like below

	- patch-set for reduce/remove to using current next_endpoint()
	- patch-set for rename current next_endpoint() to next_device_endpoint()
	- patch-set for adding new next_port_endpoint()


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

