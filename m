Return-Path: <linux-media+bounces-4537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0A844EDA
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 02:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702E31F2D49E
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 01:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2081C566F;
	Thu,  1 Feb 2024 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CS6t+frp"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADA4410;
	Thu,  1 Feb 2024 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706752107; cv=fail; b=Ok8453Q35zKZoIgq7yhrtlpnIsqbjDVjHGGJUQw8NpuGo5XNu4L5+QsluCDxFZVmve6KVxc3IXkBRQV/wMusdfAbxtV14rnk5tKkebinzClnhrKyYRVVyVnbSlPSsfsq1OQBlSHPQe6aLbZpKm9e/jnB/EboulQHDzmyUvP6s6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706752107; c=relaxed/simple;
	bh=JWOhP7JL9Sl3u2D1wL9rmIGhQ6mykUgBErmpyxBIpCA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ShoEfEWtEJ+4q0K9o1njVEWI9P/LyX+8ROE4eHH1fiWk69Szq5NljuMjENfawYzXmsk3dKjGj2Vg7FdUiDJQSLPsqYnkt0u8kQ7b5GkKceIG7B3l84/Y9mEG1Su7QkZWMbSFEnKDkjZ49IfPDW7F2Q4Uhy/As9yd+AUQ3kwkEVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CS6t+frp; arc=fail smtp.client-ip=40.107.114.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4o68mupbuHIV7yPw0swscDaE/eJl4pZvbaLWhWnulK8fmKSBdgUXIT93a/Guli5ZtmWKx0tw9GuLxib1IkAOjpirIHiND8loD7LZx0dBHibUXswrwHDib8vzAboBpBGxGGayTjJOJgDEK7AHlLByT63U8dQ/UslUYNnv7NC+cr6bs8mwhsmFDLI/D6p76Nz9QMkGFcA026WzAZFXkkf3L9uFajyu4jCdG7PJlkBVMtzDeUqFEh0rHQ7sWqvNSetnfJgUy79ypytpEZYsNTfgMVyOrKEtRd0O0jze7OcGI8oKDTy6wMey2bzkd11pSRXl2eZ2YzQ7PNVc+NkoC/r5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOPF473m1mNr5SDcv4YReKxWLIFYkl6lPKu8q8ei2MU=;
 b=XO9buhdAwQJz0TW0E9x0X9Gz8yFUsQrgnrXcsDHWYlnC2oA4hesiy1XECjFMyD+RlHVUbmhcuWUVgS7SNNrYkDLPV4qOEnt7Vn0vMcnF7wNkG8jOrmUznrq0QD3CPODPHx/0eAjJUcW4H1c4zcUMjIXh6l64s9/C+LT9fgGPFRnynIK+PNBHd7/p+xhak/KIdBjaVkpeL7eBEkKbO/i6YKnUc4ZdzAFgRHcBMfq3IgIuZzFrsxukQh3/nPKwBhJ7gs0EtxGEzOSZ4jhTkenpMkvuFoW+LOZB8Wi46vh5eyj2a14bI9dfg9Z2A8w5xmaZytXjV//45tfCCHWm7y9lQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOPF473m1mNr5SDcv4YReKxWLIFYkl6lPKu8q8ei2MU=;
 b=CS6t+frpFtU1MGPbCseQbvIlX9NWEBVCLQQhoVD4mD1PxI/8UzBA0nQCLB5ZHJOVbmhUaXQgfW6tEgmQFGOkWbq/FikiiV9raqWqiGlURdTARKRHPaVosA0jT/Z+EXnNRUd+gTX+T1SLUOmxMcS10zWWEKtGJPlcu1oCQnnvoXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9410.jpnprd01.prod.outlook.com
 (2603:1096:604:1d8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 01:48:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Thu, 1 Feb 2024
 01:48:20 +0000
Message-ID: <87jznpnee4.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87le85nher.wl-kuninori.morimoto.gx@renesas.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
	<afea123c-12b0-4bcb-8f9e-6a15b4e8c915@ideasonboard.com>
	<20240129130219.GA20460@pendragon.ideasonboard.com>
	<20240131184347.GA1906672-robh@kernel.org>
	<87le85nher.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 1 Feb 2024 01:48:20 +0000
X-ClientProxiedBy: TY2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:404:42::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: e6694b1d-8d1f-41a5-3f58-08dc22c7de42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CZDXjxauUspbDFQ2eWQx+BM781vzFLqq5wWnX23R/BgfO6mV4P6hXUDim7gwHZvTxHRSJ7dpXkhyFYiV8Z7scyCny2CgLOISaZ/mJbrSFODo0/1CILC+rlkegCP2rzFvcLPwRZaounKGxMtTS5GSJxlWmLsm9XehCQZcJ/Ajx6cGZR/pAa2a02i7EBC/u2ExyKU4lS2UdB1Z6G/q/Drp6Dngmn7ukfS3THucUVICo2EIfCbmWWhOAfnVEt90bWEFSBGenQKZhDp9qfkiwkdGcekDsb4XwYr/CHFKkq/xwbl840/u+9MkJbOBPvwJI9vGOJVsagxjGnvEPhkQ7AGG02LCsPQDBgU5WH6YIXv9ZEGjkBJ3E27itmRgsVFTZxEh5wRTQiPmTsBGMKBOCUs7eJcG12rc51BN0gQqUogvQfFyVfSVmVV7OTdwvU4DL5qdYzdxqU5IUgcXSRtrCVMRQIU/EGk2cVzMyGy8HIldlndFwJ4pEK9fBArK2o4ETe+WbXPHEOuubXth5dSMwbRhNtnod7JSilt5eSSAqLRZvASqdQdsrbV6tSeWFkyHKjy7TPLbl3EvsF9/mDGnFkq5nZw2Tm49/onZ1GmgTFkAOt9IX7G1iNm1GebIbCCndXy4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(66556008)(54906003)(6916009)(66476007)(66946007)(316002)(5660300002)(7416002)(8936002)(52116002)(6512007)(8676002)(2616005)(4326008)(6506007)(2906002)(6486002)(26005)(478600001)(83380400001)(41300700001)(36756003)(38350700005)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AOlR1AcPQxE/Ywq/zICxPIN2+BajfQQWPRDUiJYoWgr6W/HjFV/bwWpLjJT0?=
 =?us-ascii?Q?P9jv2ZzVbJfvTaGGE8RlOZLs6pTjQes1svITIPwfgkbpJk4tB9Wulw7C02qO?=
 =?us-ascii?Q?fiRjPwEpflQSopTMvUDymf7kNNpJ9l8D+HxdpmehsEAw1T3xl7r3oaZWBPVz?=
 =?us-ascii?Q?CBl4TKaaAQav3fDMq1NhRxBi76Rd3K2XY0BFHkYs3sPLCL8d8wW8TKieVcax?=
 =?us-ascii?Q?2lbRCXAyyg2gPIRufhfZS02ECR4rNB5jIYwFkAXodOjHOZzE/e+29WRxtIVu?=
 =?us-ascii?Q?zgwnMllfCUMTrEgONvs3r6KXTefY1e/vUhDACTcakVjaZ/CPaXttVN7K6Uvf?=
 =?us-ascii?Q?DXj2QmNeEZl24Q+GCuMGbc70OsIhgdR/erqfs40/+hOJyj0iywvRbGcTlm6x?=
 =?us-ascii?Q?tdnmRqXlkBHn9v5qk5iHijUB1ocbum+B1oiHgoGT6EK0ZPgHBVJmfYUZelmo?=
 =?us-ascii?Q?4aSW+xIv6VvZKTRaBgbcxHLJD8EO7cb3Y/hWRAvYd3dkuHflnY0jg3qp+pSq?=
 =?us-ascii?Q?veWPzqIPNdLgXKilArUtDXH6spW0lFc/kBsRk0cmdlUTIQ7mIfFy+Lv0kJxP?=
 =?us-ascii?Q?AFVeZES1ELmpMI2Izg89GaVmvMec4sRaiOlOn61HOSFe2UlfMbAn+ZkpGI5A?=
 =?us-ascii?Q?w3oS5J4yNkW+dPkx7N10gTxS51StvL9SfhG21pxbhxaTX7sjTm4IgAVv+4ew?=
 =?us-ascii?Q?LSQI9Q4w1aWLdFt96iUXf7wscSaFmx1RV0sJxYkX+xb8lcMOy44ExGTWWcc3?=
 =?us-ascii?Q?mjndWiSfJY61vKypwQZT3Dyx0b1PjG8/PJ2YSb6j6kcnApwGYj6i1NNzvl7a?=
 =?us-ascii?Q?C6hrDH19Huae3a2qr4VKV0Ht7jVPS4kgYf6ReCdGx5+Ld5xk7R7bLoSJ+oo5?=
 =?us-ascii?Q?Acxf2Ke2W+9GyvvXTtyKs+f8e7YZtKPJGyI4w8//sFpzW/1qWX13P8kM+zwd?=
 =?us-ascii?Q?STn+0CAwlbzJzwyi7Ql399TNYnm1Y98oraz30eGenHGjTyJGriF2o9N79xmG?=
 =?us-ascii?Q?5BWUmeimeYv3XfPjpl8BtOf7s+U8Zkco7uZP+K/N8Lk+pQLbByiD1y0e/exJ?=
 =?us-ascii?Q?AzjtmJmvdVi3bbkHtoomTaL2R2+zYSLo+Q753BaTrL4kTqDwfTU1SDNwNS0s?=
 =?us-ascii?Q?UK1X/0hrbmtO8dvP3HqR4uzHmBwuYpVURzYZaOsLCZWDf9LVZVBvJywNJgAO?=
 =?us-ascii?Q?DPdOKEVtrx4k/inyX3SBjNzzUYPU6lLDwP6yxJyY6Y/6flmLwGK15XMmwIME?=
 =?us-ascii?Q?8OGbTv7FTp1e2fMaO8Uy1cIQHehHE4bolwFYzfDS95uDWraxu+Jm7dGiaRJW?=
 =?us-ascii?Q?xqmRiS7cDtgeOYN35hr55ysZbiKAeWbu6tTLrUxAjNej3kPETUloQDdbgqXo?=
 =?us-ascii?Q?k+s1lrW6AuLxuPXC4hg5m2c2F90tGB0nlq+RP0Otxpr4LvRZ3EJ+VPPoyxyc?=
 =?us-ascii?Q?RPJVOWfLhKDd5t7ElllT0hEPe9MHQI6EjIy2XcS84uw4FAVMZ9QESn7BYoAj?=
 =?us-ascii?Q?+SN0dyhsBVdffOjuoCJFxTLX1oLNpV7miZFUebXhpMc9WY++C/8UWa4kB5qE?=
 =?us-ascii?Q?mwgnR24EVFiih5j5hS8LBkmSPsyMHmvclVFQ7GVA6GA5k14ZP3Om8oz/XVA/?=
 =?us-ascii?Q?lNElI5HNBdJ8d6nQgDowgjM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6694b1d-8d1f-41a5-3f58-08dc22c7de42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 01:48:20.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Yf4Xpf1qpZX+pZLkyZXVw5DzA0GZAKk3rlSS+pVWwps5WxOGXaVOPcAMfTC4Cm3y4827RuGhH25kYcCRLITinBrxzBkQ4cZUz/ThDLRoB52ogG4vB+NybtvwaJYpXcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9410


Hi Rob

> > #define for_each_port_endpoint_of_node(parent, port, child) \
> > 	for (child = of_graph_get_endpoint_by_regs(parent, port, -1); child != NULL; \
> > 	     child = of_get_next_child(parent, child))

Hmm... I noticed it is impossible so for.
of_graph_get_endpoint_by_regs() (A) is based on for_each_endpoint_of_node() (B).
Thus, we can't replace for_each_endpoint_of_node() (B) with by_regs (A)

(A)	struct device_node *of_graph_get_endpoint_by_regs(...)
	{
		...
(B)		for_each_endpoint_of_node(parent, node) {
			...
		}

		return NULL;
	}

> 	- patch-set for reduce/remove to using current next_endpoint()
> 	- patch-set for rename current next_endpoint() to next_device_endpoint()
> 	- patch-set for adding new next_port_endpoint()

So, maybe we can do is,

	0) rename current endpoint functions to device_endpoint

	1) add new port base functions (port_endpoint) which has
	   for_each_of_graph_port_endpoint() loop. It is for port base endpoint loop
	   (I want to use new naming, using of_graph instead of _of_node).

	2) replace above (B) part with port base loops 

	-	for_each_endpoint_of_node(parent, node) {
	+	for_each_of_gprah_port(parent, port) {
	+		for_each_of_graph_port_endpoint(port, endpoint) {

	3) replace current next_endpoint() by next_endpoint_by_regs(),
	   and remove next_endpoint()

What do you think ?

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

