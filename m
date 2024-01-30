Return-Path: <linux-media+bounces-4381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A05ED8417A4
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 01:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4D471C22B58
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 00:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803511E4B0;
	Tue, 30 Jan 2024 00:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BeDbtDZ8"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4072D05B;
	Tue, 30 Jan 2024 00:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706575071; cv=fail; b=Nwg33ZP66W3M1BiTLbVLv/lT7rhCSTPhfnATo7ViXso1H2InS4oz49b5nBiy2NJa3uC5zgYr6zcgZzWwrhezf5LctQ68H4SKM4SSgJfmO7BNzKfp2NWazTvh1YfKDOqTXX9DYCPbkgUF7ZJyjHuUwjGMylJKoHgRZweQwL1++2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706575071; c=relaxed/simple;
	bh=Yexlh4LJvzuoOZ+hRVeWJRHxlpn9fuIKvLlWkUrrlUs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Zm9+4TUTg8L6GgCM9nQRLgIbWWi4dm60t+sUlHDhEa/6DS2EAHTJsWR/pt+ASbIIJsNZ4Y3Aj4m2M3b3iVGU4mwbq939Gdx1J+HBx4i1wke184TRav2uxFtwhoP6jaOw60Hnf3tAZrVFiYN9W7o3Wy5tERFo9T+u1e1pCm8m5f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BeDbtDZ8; arc=fail smtp.client-ip=40.107.114.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sm1ZiQ6ZqhMcAVRZWvEu5ft5R4zbLlXU/stC41UFhvO+yizOSVN2xxvzFBpzf2GbOernLRNPlGfEak2CER4VN4+TKJgDyvaEYWyMk83Gj3rg45RMGmYJYthPWxb2gkfBvCGTCMMF8rNS43u0NUfy8nz3yFv5t2HZohCGkpY7ZdHM6lDXaz4cqC+7HiQFoSQwpRyj25iTXFgUAPQf2o3dZWyf4n3mCPvxHZuu06UZ+dhiqcJ7ghLgN6WWu2P0PArnlWqu0K9GbgFIHitOVpnI3O3QfOAA2yNzwi1csHGgcthRjUz9kvqr2jXbHx9CRWR/qaBNjNZqURfGkUHims/wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K0+/wZZS+uYkhsGf9dQBg6bUpwv3BXEX3V4AdPLka0=;
 b=mZOyLwWtDha36Ah8IoNke9IlSw60laotagO1burAcNpkhrU7AE0/gLuAi6tDy3LDR2lAfVDC4Jn4Sw4cKQL4BFHfGhuA508KzE2aKwm5ww1wNq6v0YgUqY6NeBgC6aJ5247NtvPmk4fOpxt/ol/u6vugNu31Wa7SbUzRzlkQ29mcd74VnEHEbTELwNL7kDPNU7e8msUCFxHMLZB9HOh+D/EtewDsJ6PQL4hOlkJqUkCdVTrdDTEzTtoGupK3YzpsHRR+0B5moajh1WwGByF0KfnEV5N+Q9TfqOqtJdkR6gl53KtrsLHdDK3lHPOu/+14WI9tEV1d7gZGbb/TsQEW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K0+/wZZS+uYkhsGf9dQBg6bUpwv3BXEX3V4AdPLka0=;
 b=BeDbtDZ8nTUsRTfZaGyBMyROT2AT4NQFkXkvNiXzAh8okM3t3rDaiaH4+wq2Q3+ZiAn3sAmLAZ46rwpN7h1s/z+DrENgE2c52kV8BZdj4npqtePH4Ybj7Nfq/4QN67CYOj6h8VCPeQDaTvm2iVTzRqeHlUhi9yhrWrBfdMLrzu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7926.jpnprd01.prod.outlook.com
 (2603:1096:400:fc::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.12; Tue, 30 Jan
 2024 00:37:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Tue, 30 Jan 2024
 00:37:45 +0000
Message-ID: <87y1c7irl4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	alsa-devel@alsa-project.org,	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 03/13] of: property: add of_graph_get_next_endpoint_raw()
In-Reply-To: <ZbeqGhfBiXarlhtu@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<87bk95klgc.wl-kuninori.morimoto.gx@renesas.com>
	<ZbeqGhfBiXarlhtu@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jan 2024 00:37:44 +0000
X-ClientProxiedBy: TY2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:404:e2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 6811c750-7cbd-45ab-1ebf-08dc212bad44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8N2JiEcC1O/N7Hx+fglB428UjUH+lpecLMx4jWwKQMFg/EqIBj1oUWTxt3Ccj/cXT0O3yeDnWp1Sz9dO2MT5ygMHXIXC9zbO8bwDcChltRGTPhW4AV4jRHfvX9dR7yJDJfqqEJqxUHdOiOqTfj8WXqzSThxuCFQmWtrU3w2/kgzPfZWgSvq8mYpHfwspGC3sd913d43p/vfWVua3cHn4pd3j3trQFMWZzoNiwM+uc3Tv5ovvTwPR0T2L4BD/Bheb67r+sYhKeOWvnSt+AdQTtu1wt1ZwkBprzn4cTNhpoEqux3r2n7kTauVMYTYZZ8kWFQdQSlyaBqmv7CT97XQ3zJk33CQz/P4OUmG2GKryytjDuppH1cxKAmugYS48Uosd43rx5lyq2DcK8rqKKCWiOb1+AK0v8eDXSqFWIHKuJf8ToeVH5R0H4PUjIGRVcEUeTB7bdUEnOH8APyZX7nA+oxWwR7A4ClbP/GNUSg1vod9hP5j3O2eyANWkBiLy0NVjjREKC2sg7NeGGJMsoPAZ3ClMAOcwS0LnXl8P1MKP6BKqNR4mb4nOK56B+yd4gQ4DQP4QBwtSZmTb9ZJIeVCo6rLPrnC9ekBlXnMwpRk4nM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2616005)(8676002)(6506007)(6512007)(26005)(41300700001)(38350700005)(6916009)(2906002)(4744005)(7416002)(4326008)(8936002)(36756003)(316002)(54906003)(66556008)(5660300002)(66946007)(66476007)(86362001)(52116002)(478600001)(6486002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zo+MmCHU4Fa5uBT1Al3L+MVsmcLWpSerF8KYyaa4m8U+KgPk57ysk1PcvlXU?=
 =?us-ascii?Q?SLXkP37k7oLE0EkScgbWcj6nvLFdPPDK+myt1ukWVgcmkIuabQZ8OrtcZ5NE?=
 =?us-ascii?Q?7yjFoPszKRmvlq3OPOFq7lZg4rSDZU/IApAzkXKDKIt/64VNdcxxluuw0+7v?=
 =?us-ascii?Q?+C5v+7TV4HbjCTRt3HiV2ejAd8odroaHWs3hzGnvRH1/I0UA3e7E+TKdyf9x?=
 =?us-ascii?Q?bs9aXNuQjEhR74L2eejxJBAPp+r0FshCaWZr55MHQ/ntw38rcRlFyKX2HQM5?=
 =?us-ascii?Q?/EWZO0Wv7jBFt4cgYtPP5sT6P9QJizZCpyOnmDJ9y3ew4IF9lFVx0/T6rA3M?=
 =?us-ascii?Q?55hBBUTEfwK5B/+iXtnKbhW4Drv+qraTaL3pdY0DduCYmEiNjDIxC1ohDUJ8?=
 =?us-ascii?Q?+YebCciA0I/6xw9lKNRcimgVENYREEienOzAZAo1AcGUCimpdsreR6f5rVKD?=
 =?us-ascii?Q?Mb9Mm8JuoF0q3WigBLpbyD62cIHFcEtxLxCkjNrerXjvxP8vPwq4PAqkOEXX?=
 =?us-ascii?Q?4lgL4ipoFdsiHBy259tZvYF6DE4J5ct0O5gFeWxcBvd99Wlqc0x6ZQt5+i6b?=
 =?us-ascii?Q?hezc6lcPIn/6zWBq7RtiGlPMcY4wkkU9SUKvgzyEuZOXtPUFyZTB/9jXPGNf?=
 =?us-ascii?Q?FLgpvP1zMcEDL+n8ETEc0tv8GXUzx+d1qbqCCis+sIPjDccjbHd5YnnZsodN?=
 =?us-ascii?Q?KbfW87cjdvk+HjJTAcgJg3OS8VZUHu2yiWUFq3OH5FauPNK67tE72YxWeW5a?=
 =?us-ascii?Q?I36PIwthpbqc80YxGIsPZk/ym1R3T4YCYz7rASOFxq+kyx3/zs7QuW//vS2G?=
 =?us-ascii?Q?NVjyagvq3QHgof/64rxdga/WmpRuhrkksJ3eEGzkN6+Ea3z2gn7YtNoWtq86?=
 =?us-ascii?Q?inV+jwTuth6Lk6grJVe0v+zwvw23Z5rclDVcSCMiHJBoPxnklIE2jhHC/2vM?=
 =?us-ascii?Q?O8zhDHJ9rMCkloQVJ7Zppr90J+/G5m/J3jheqJ8MZsNLTLF5vK/98OkgXrFv?=
 =?us-ascii?Q?GDLAKDGpkK2JNNLuoj9aJ0GzxVZ/F3RoeJMlHrciSABaw3lecht/jQJFxABQ?=
 =?us-ascii?Q?wk3kzlqONxdWQndOOh7B2AFUf9w3XMfm02LW0D/P1WFvujN45YzdQyoHSSON?=
 =?us-ascii?Q?rYbIsG/5TfQ5jCqBMEzYfidOOu/9fbkJULa7W8pFvG0YARfa/yIR/EtUEEnH?=
 =?us-ascii?Q?19udCW2n57OWjtc/5NDGcR/+J60nbsujS2NaTilCllHq3C0SLKyZYa2xvkgW?=
 =?us-ascii?Q?qLjiX0CMEnZA85GlY/Np28nYTu9ko3sWXYQJVCxeICe2oYCMM3aJHVw7nx2c?=
 =?us-ascii?Q?8dgZmMyT4rnmVLIpR7OFyU9hYPSU78R6QRQPVTdMQ40bRXc0zhsItdyM7fDA?=
 =?us-ascii?Q?WzKFkxbNY6WmuzRvtTo8SFUYVGa8RQlmoPbXLXnf3D3JrjGM4l0jDj02yR1G?=
 =?us-ascii?Q?yrJQ2rnTSfRlQIZqLqqDi2P3JQjzypdMW+Zkg/erJabzUr4yTcpZyNLrNdxG?=
 =?us-ascii?Q?NuxbJ+OS8fHC/MAvFeDUVTBDB/csTPKU+jZ8T+bxcgY5yYpbUfWLMelsWVtM?=
 =?us-ascii?Q?b2iHqlE/jqHjysDLFz9CFLwZCLWFms1OPfINGJt4SwJNAFsYUl2LnjwEO6RE?=
 =?us-ascii?Q?MkMt9LcKJxZNWa/a8FtfNLI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6811c750-7cbd-45ab-1ebf-08dc212bad44
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 00:37:45.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT2vSI+q/aPvLUkQMeKMA1zisKyexXi+ZjRaLBscON3wq1Cq2AxVKof6VLOVkE+zdIB2PygX07WNXVWT3JMU3xHyLydU6Ig9tRpFSGeXTZpRxPyx7tcJIL1J/TTIq3z1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7926


Hi Sakari

> > +struct device_node *of_graph_get_next_endpoint_raw(const struct device_node *port,
> > +						   struct device_node *endpoint)
> > +{
> > +	if (!port)
> > +		return NULL;
> 
> of_get_next_child() returns NULL if node is NULL, hence there's no need to
> check this.

Thanks, will fix in v3


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

