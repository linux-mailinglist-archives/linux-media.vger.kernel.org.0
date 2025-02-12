Return-Path: <linux-media+bounces-26086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61220A33032
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085B11644F7
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E710620012B;
	Wed, 12 Feb 2025 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="JCPSQtGn"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2110.outbound.protection.outlook.com [40.107.92.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE731FFC60;
	Wed, 12 Feb 2025 19:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390243; cv=fail; b=KlWYaqMDG29MO5RoslY/oFPL+6LAdpJ/loFhvnCNloEvazyowyM9NAUhQrfc4U7aNg0xGAwhp80Jv50O4k8qcTa9Eph5/VHZSCESHjhaocbNrYM6D8R/jI3T/oFv/jqBUnkrHtVk63Jg5TnFpQ7JAyivyyufjyzc28E/EwQ+owQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390243; c=relaxed/simple;
	bh=3Uw9yRxwA6Nz2Av8Yu5ZOrQeQ6/8TVg4gYs5p5kIPGI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Rx+LFfgZLyc6uWzivHFi9EaOZrPTdElsDRcRR5upZUfGYAMOvBa1at9w84cQ6MyyAnMLLXRI/lpBQ2rNG9vCWpMslMX+nA1ZrXFaiWOo0wNxdNw6UR/IUQVpkzhLuI6WgO2CnJpnSII5oFcc2yiZtPI4TfbuGLumbrZcFqvHqns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=JCPSQtGn; arc=fail smtp.client-ip=40.107.92.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXJou1foGhBtMMnyIF8hOFQaqbNri3eKCLt4U7bFd1wLZJOIzbRc4YTeOQcC57Q5QrW3cJNCNrrN5aF02d/NEyBduEBwEYf7OxEVhs1C1MY8m4KmRNOHQPlZrJ1yfpGLm7/4jmDKXKmc7p9iVECUMeMnTvngMwclY3bHbKfSzvJV7sPSgP5h9Ka/KEZrSH6s7dRjhuaHCxl1kq5JZQ6QzuyxeJSRZI7crIY1Enxsb53a6axxl4i0wlxkk4tw5vrtqn5wF2FTOaBVJp/W0YmQS5uSa516tJH7KdzyGYC420bDW/kt7k7IKcIJVowiFqcRX3JvLO3AWgD0CJK39uxHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQLcN7eQICEh05rlrlxJSfyc1AkNtvCum6IfdEPPQd4=;
 b=oKrqnJnq8S3hPYH5vwfGAKKgmyjK4mcQec50376MN3oya/byLqccoiGbjopU78P5Dht5x6rfKZ/jk9kxo3XDFhRkCLxnBWpeRr2an5jdBiUvF5QO6HurUFrcHs4OfjBXPjn9eDSqCqvbm3Qw/2ZDTME4i87e7yroyUMfH43a83MBRUo19Wymm21iMtSfxY9wXxMQd+XdIAJSwNaOAczsNwzWtS0WvBWzbB4Gv5lFm4Lz8B1hH7AOAl9n4JzhxSi25qmXzv9tsYgunkO3e8zJQy6tz3WpezYJ7uZaKNjrHnFXiU8Vw1+T2/OM9c4Hsa1qNEz5BGXHtYk6mSenyF005w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQLcN7eQICEh05rlrlxJSfyc1AkNtvCum6IfdEPPQd4=;
 b=JCPSQtGn0eQbIcmyAkKm2Vpob31hab3GxKRw2RVnbbtA5Pnd+maQdJ8AXt/nhJWc+gWBEdM9pzD9fsFzOYCXZaP1n9/noSn/xsT3CYUALzoISovsNGkgsbXbzBH/AM99RDwUBBsGuwAMnHsZw24ueHzGXjTHP4k3GyjS10riefc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from BY5PR14MB4194.namprd14.prod.outlook.com (2603:10b6:a03:20a::7)
 by PH0PR14MB5496.namprd14.prod.outlook.com (2603:10b6:510:14c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 19:57:11 +0000
Received: from BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665]) by BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 19:57:10 +0000
From: Sebastian LaVine <slavine@d3embedded.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Achath Vaishnav <vaishnav.a@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jianzhong Xu <xuj@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian LaVine <slavine@d3embedded.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stuart Burtner <sburtner@d3embedded.com>,
	Tero Kristo <kristo@kernel.org>,
	Thakkar Devarsh <devarsht@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Will Deacon <will@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>
Subject: [PATCH 0/4] media: i2c: Add driver for Sony IMX728
Date: Wed, 12 Feb 2025 14:56:52 -0500
Message-Id: <20250212195656.69528-1-slavine@d3embedded.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0033.prod.exchangelabs.com
 (2603:10b6:207:18::46) To BY5PR14MB4194.namprd14.prod.outlook.com
 (2603:10b6:a03:20a::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR14MB4194:EE_|PH0PR14MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 6504dc63-2554-4714-be1b-08dd4b9f6fce
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?G96zaT19wDOd1J6mE6VLFc94DTzh7zm5K1kUS5wxdtW0uQpnadzg0yxHpP/y?=
 =?us-ascii?Q?N8vBgDhcoP2NWzhlrd1f9wEHTBZ/dmvQ/R73KOR9nfrLrFBLk1Ag22M/UHVS?=
 =?us-ascii?Q?vBCC7OUCVQCHKSdIrX30GL/RC1UpMEkDIxaFBFiwmJ+Nzeojxz8Vnqrj9PZd?=
 =?us-ascii?Q?TkNFtA0anhkQTHzJIVUZ2ypAZzLtNiE592lmIJeiYQ6rDdFH1v/13EL62UfO?=
 =?us-ascii?Q?eDPeYDZTO8dSmimdmKgO7XjYelGg9nTxU3lDDYYKEW/2Yay4trJ14tJKRomT?=
 =?us-ascii?Q?rwURLA0Nd5cKN+RgxS120ZSqTI6SqOrwdf7h7kLAQFm9AuW2rurk1NWdcKXP?=
 =?us-ascii?Q?oFDX3EYMvr7HX5BppKXoLg9XkoX38mm+d+YnBdqSFfyu4YB38SpeGaE5MLrB?=
 =?us-ascii?Q?tf2BnQAuzWS6a3GQgg1JgBeha1RQE2gN+zmePzi9jACdSPb33gvUzzt7RgO6?=
 =?us-ascii?Q?hjGt+Ir16lWsX+LGhk5A7WY9KbTGjCe53zV3WPTCvt7L972GVpn77ai5P0zS?=
 =?us-ascii?Q?x7B+1DCOm8x7NGRlLZfFaV2wyPDcBS9s151+ENwgwmPp4dhRbfR6HaVo+Jz1?=
 =?us-ascii?Q?6gvDOb6rFsqYDglsXLrq/AWpUtH01tExZnXHoriqzZrvS57Blx1IC4syS/65?=
 =?us-ascii?Q?J6SifoOakHmWia6ko2uOd/+nPhkOO7emqID5MJH2p4lVEiEFfpdGJeSMNhw8?=
 =?us-ascii?Q?B8FWjakTk+lD1qY3YrlkBi+06KemBYGIb//80o7g8JdMNMDBdPeb6cim6vmy?=
 =?us-ascii?Q?hOi4JRLNziALjvbQcTMaHq8IZ27+stLFnBGLO1OwUsqLitp5fOd+5aR6F/tX?=
 =?us-ascii?Q?8+lUs4WfyvjSvdtkbAcBQqgBLV1L3mxzQqeuwqyztn/a5tkthHymN6KVBNWk?=
 =?us-ascii?Q?wASGPOO3TvICUH75VhhdaHZ6NW8/fjkVoZ8Jv3JEiXdU+PssCOX8iv6Jpjcl?=
 =?us-ascii?Q?TI4J3PE2aV3/mZhLW6aV+/Gnt1kEHIfC9kHyo/HvwDKhvWKmzS74cfQeqnp5?=
 =?us-ascii?Q?Knj/oNikOTtZV8XjE/kZj5kKzl9J6/uwqni8Wb7bEzDSAgdbeYKYyttMhi2B?=
 =?us-ascii?Q?fHm5E2tClP/OCEVfzl+nSrGxO2K4MXlnVi2d9li0pKpm3nbcrpExLWiYVr2F?=
 =?us-ascii?Q?3yjssdvoI9a+2qMMgnKRxQ0/eEy2BygtEx40LMvr6xYGN2V8CbQITnCCwRRs?=
 =?us-ascii?Q?qNKLT5EJcQzcJU+SbIpsX97wPVHWjwIDNNeR1gypvnLaMjtYAQdJ5m3uOH8Y?=
 =?us-ascii?Q?GkvXIFQ0mSz2gxwmJuYbxcodLosZ8xFfYby6wOO+6Ai9q1AJ6sG5CRP2ssYR?=
 =?us-ascii?Q?y2DJHqW+1Hzq4h+6Tydq4YYZwGMAl4R5rJdOldSs/00lwM+tEYl9J4nrmSRT?=
 =?us-ascii?Q?E8DSJKsUAgaQzEi0liurP/XBXlVv?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR14MB4194.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0CPN8OodVMuQXrHhwjPMoSWYPjMJB9MxvQOaaa0ijgZP2IDpdC5EImQmIVwx?=
 =?us-ascii?Q?PI8f5VvbLyFMPbyfZYbj1UntRIovZ0Udl4VtzvDXIZE8E9zKd0DC9St4XAYm?=
 =?us-ascii?Q?/5spkif4rOtVecfSAeJnRa8EI5QrR95YGl5iuRJlCnVxrxrIinVdqEUYjcq1?=
 =?us-ascii?Q?/GqAkNJD7cHa8zrpgnCrwVezlKtiKjgDn/OSFUSlBoC1kPS3KpPmv7k7rwH6?=
 =?us-ascii?Q?7+u8HbcrxtHREhCWsfOmKXAhRLWu5RiseQna3RAoExp3LQBjoEg5ABPKxhfh?=
 =?us-ascii?Q?hApF4oUCRnU1vg5BnCmvHctlFleN2s4LgpFhXzBalnYLxtY6Fef5nhpXQFA1?=
 =?us-ascii?Q?mulKOsjHuVqTj1GqAlS7nV9yfqN3hW5JyEHU5Oo83aM+U3NyWy2S9W5FmpFJ?=
 =?us-ascii?Q?Fzgn2wb0gGboXVErsR4GQBbsjT8N0pdmTNEyp7diQnhhs3B6o8bs3hm6SGHU?=
 =?us-ascii?Q?sCI61csDqHGFs7fwkWvOsoC5daP6xndZfgAvpPMXTy0VguwJkug+hAej74lA?=
 =?us-ascii?Q?xIOIks/LkkxFujjO58aMSMc0FHlrLkvYeY5f2uul4guxKJ9zcHsMinXp7/WH?=
 =?us-ascii?Q?YeGspAuNbAhYOnjHR6T8qAy80Oz9CgJYYtH4vU6FEpwPMyviqARXyvJEeHCv?=
 =?us-ascii?Q?vo1EwZh3vFeNO6fePTNa7u1uDTkHplnFfPqQ1yLPdHkz2dbX6KsHo7lfpVft?=
 =?us-ascii?Q?rNYz5Wptyh6fODvJQQvm61TnOXCEpB3JGnYtDntcnFiAJO2eWVuIx/lK2UnP?=
 =?us-ascii?Q?TBBWFnXk2UtPhNAC+9Y2lGYieQ/QgeSI8LfOKGH988ZZpUZ05TBestgRhldM?=
 =?us-ascii?Q?JkavhrbW8OtfzgBVN9NVs+xBd8w91VjieHh/Z7Zf5b2ck/gYl4PrkK9V3N/4?=
 =?us-ascii?Q?yP8tCrNpeXwiD03dTMSLvsrNETFiHL8b/YVX750GKNy3FJelSvoPUQdKNlSO?=
 =?us-ascii?Q?2zFdfUE2/L90qkp/Qw5AVKQbL80oPS0BPamIA4CltCMSgZu9Zjai9204uJ1B?=
 =?us-ascii?Q?G+dGyTkXUwdiZ8aYZZPqnpedXtKy/7EGhPOezjCWWxCNvcxkmjIaaAqeyYzH?=
 =?us-ascii?Q?QH9VSlFLAgXonGUk7BU2eHyER+MyBcbIl1sfI0VE50BjQWL7wsM1samt6ahF?=
 =?us-ascii?Q?rgvewnnDW2LaMMSeBA3CDcEh+ND87bQ5yzOq2ukcep0D25w7oBlS+zJpEsrp?=
 =?us-ascii?Q?p+h25HKTtSMIzlJBeqdeO+GNKTmd3RcOUASVeu9nwF+7z+r6KAYI0NceiFYf?=
 =?us-ascii?Q?iiEXnnqSFKLrfSRakHNREnHj2xnMkp5CGyMnmTgi88BdvKx+yAnqaDz/WfBF?=
 =?us-ascii?Q?MfbTi/dIE2an/4SbrR2O0LgDbfg9Si9Ya4LcXQew1/fbkcrL7bEmxUOOUpqy?=
 =?us-ascii?Q?gQIBEwNJBQ05fHN12C5Tz1vnj75PTjf0ztwHSZyPYqRLZZFUiVwOtJoUtURw?=
 =?us-ascii?Q?qUPSXHnbAK3UEe2So+wcm+eJnW5zjdN7y23evYh/tfhbVol18fl0wyj4cCcT?=
 =?us-ascii?Q?SAGa1yWvxZdMMnfUEnGXnRouab+16X02CQBGa7hb6z/P2MUpL1zvV2AEI9q6?=
 =?us-ascii?Q?7imDjH8WXheOizbvMhuBanufiVgrKZV4wht+1TpYPmGD9HSnHzq+yizZ7DeR?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6504dc63-2554-4714-be1b-08dd4b9f6fce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB4194.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 19:57:10.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+CqqcEEVxchQLwCs3ndJKFJsnpc9XEVLmq+7m9W3P9W+Tj67nF0llx1+CLemjqnGPY5kaW0f2PKdT//ebZrqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR14MB5496

This series adds a V4L2 sensor driver for the Sony IMX728, and related
devicetree overlays.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.12.9
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 44, Succeeded: 44, Failed: 0, Warnings: =
0


This is a v3 of a series that was originally sent last summer[0].

[0]: https://lore.kernel.org/r/linux-media/20240628-imx728-driver-v2-0-80ef=
a6774286@d3engineering.com/

v2 -> v3:
- Update maintainer
- Update bindings example
- Add devicetree overlays
- The driver now supports SRGGB12_1X12, not SRGGB10_1X10
- The driver now outputs at 3856x2176, not 2840x2160
- Fixed exposure, again controls
- Removed duplicate register writes (removed repeat HDR writes, etc)
- Fixed imx728_wait_for_state use of the cci_* API
- Re-added _imx728_set_routing (necessary for imx728_init_state)

Sebastian LaVine (4):
  media: dt-bindings: Add Sony IMX728
  media: i2c: Add driver for Sony IMX728
  arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion 2 board
  arm64: dts: ti: Add overlays for IMX728 RCM

 .../bindings/media/i2c/sony,imx728.yaml       |   96 +
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/ti/Makefile               |    4 +
 .../boot/dts/ti/k3-am62a7-sk-fusion-2.dtso    |  115 +
 .../dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso     |  108 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx728.c                    | 9655 +++++++++++++++++
 9 files changed, 10001 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx728=
.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso
 create mode 100644 drivers/media/i2c/imx728.c

--
2.34.1
Please be aware that this email includes email addresses outside of the org=
anization.

