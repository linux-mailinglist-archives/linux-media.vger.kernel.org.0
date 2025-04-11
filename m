Return-Path: <linux-media+bounces-30004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A712FA855C3
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 09:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DEE4C6866
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 07:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7252980A3;
	Fri, 11 Apr 2025 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tBRb8viB"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A93296176;
	Fri, 11 Apr 2025 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357489; cv=fail; b=mgnuKmODuSd5rnX5elH5xpyoT5Yf3TGODkPfVjl3wpryFi8hxMmhubh/telKCaKh8F8AfwXFgcGKdF0ljoLgOyL9uu/5kzTwmng8NRrraN8Tkyq7rV7qtZC4GlsKVcpJgXocwpPmtZRVt4ulR5ZkQTgxzOxl10xWyjA5hldNyd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357489; c=relaxed/simple;
	bh=h/a6R84tZSNGNYzEQY4fjS3S11R9XHSqC8vxyBAkU98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ciAQuaSraRGPuw7sDIXd4h633n1R3Eg1eA7625YglQoZDWfmmsa9GbnbiKiFc2yb0WVCvodWIOltnuOIVX3wtqzOknUX4w6FM4HZPTzMu80nwRReTjWeCMGcwqfCHqUnuiQM0f0UHvIW6IuhJPKikL72DXeMxM76Q4hsTskOhEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tBRb8viB; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x61mNRK5dHeyZy8SkeosuS2cTPoD2gPn4RXjYyyTJMFkQ7ZmA6QWSrtwgcE7NLO8926no+fCHT2JUKwmRFvUhr4HHPFGlyXtFgHnhyuA3SY3R8wj7LdlcreGXNrOJ2WEd13OMhd9SIh7//bQq+u+70PQO7uPL6iYp5pxb2aKraEE/2EMLIWomYN518kNZbaWBkZlEy3ni6JSQMB5J7jEZNl6m4EhW2fWA797SWJxl/4zMkn9Oku14FEfStkXAq6D+6OuByRIePmYOjey2SC5xyRK6RzQJfGf8UzU/8EVSFiE2LX9FJOGq52o2q+lb1CDXRqIrvnHRe3Tn4dOmY+hZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk0JxtcS7MqWePPyvFrhebpnHRZ+4tRIcOdHGdyzUfw=;
 b=bfmIvciReMDTjRWLF0F3bqJkiVFl2k81gvvf+ks7p1LN0gwzPdD5FBV/dDabN6yDZFDtdOzZdF3yJwhXmxp2NI/ynYpK9pkW5f2O9aUD5jnz2LFeYeIq3aPcXHda9NFZsLEmsXirtHZL6YASYatC3WdAvLWEx2WRHU4+9IYNPRUcb0S+qZPvgB93JGBaZXFkpvXqMlV9RSexfQTR7pMwfs3Urwr8k3eAg8j4RHlb3G5fdjbBafnwBDz8VIA6/pNtc0RNwtrq1puzgYqyNiqVaaYvoX9f+bXFUYhOvDnCzyfpx9foMPV8q7oEGEDCBzilCr0moLIbUXhitZySz5rf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk0JxtcS7MqWePPyvFrhebpnHRZ+4tRIcOdHGdyzUfw=;
 b=tBRb8viBTWAFeGGBX4c/cHTU6bGZMJO4Lxo4KcAyxOigP6epqrxq+3VqghwtSS7bzZzB4CJwjyG4dA4tLMnjSrw/JIcg0xkwaCxg6I0gOQkyw/mb367hChJRpeRRCB4eF750QjvZ/2eiD6nAku1amcUTlF+D7s0JoYT9ZO84jB35bsq41sxlerlgbpYo29fiI0mF1m4G05h9a4BshfsZNjPc25oLH13UwRj1k+pSUwmaJ1OzmHkIrWIpYv7v78eiSn6wJaftUHNLFjOEjEkN7h2DPyp3mUZf8uwTI5xGGZEjcA+yjs0jvMKCt5qoFMOr1BbbOF/OmalHq880r4dLdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB8028.eurprd04.prod.outlook.com (2603:10a6:10:1e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 07:44:44 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 07:44:44 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] media: imx-jpeg: Check decoding is ongoing for motion-jpeg
Date: Fri, 11 Apr 2025 15:43:43 +0800
Message-ID: <20250411074347.809-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250411074347.809-1-ming.qian@oss.nxp.com>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 2867ca7b-e9be-4d19-5257-08dd78ccb8df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oz/oqUJFikDNj4lkbsD3AQmL6+ZO/+Enz/TXcbp4O+9qI1+IDOEtul2D9um6?=
 =?us-ascii?Q?oOWa/MoP9ObkGKSUAEZkp5wPm6/oTZKTc8O+5uFySK4g+EAyNNrqbyZNFydd?=
 =?us-ascii?Q?PA4LfNZrYgqlqeIFc/mqJv8rCz8TdlxnLWuxcp34vq2ToLiS8gfD6KcxLrCm?=
 =?us-ascii?Q?JX/KJzlLW2RzO9aS5bMfj1r7eo/qX5wwgEt8yoItvUKTZ9wj1pmMaK2EwS0S?=
 =?us-ascii?Q?xYGFt1u3/on4ubNKJtZVgQ6fh+VUK/5WPbltEN5puDnmQ+pQ3QB+Eb44/HbT?=
 =?us-ascii?Q?znq3hYLmc7b3SSsXJ/VEc6T5v9p2fJSurlRZ1qFbfnR0xJ9bWsY7ar3AoGDW?=
 =?us-ascii?Q?U8CU63a2gsh3GYxPMxDgFEK+PKTsjndiEsDHH+IajvWO/ZjJZb606VUk/D4w?=
 =?us-ascii?Q?7XD/VCvcwVdYx9YUksJ+em091KYWlWLXbMGN0SbVM3dmC6MWdW75rjVvAUvY?=
 =?us-ascii?Q?rNKAOoyvsF05MkDqka6NKeH0wuIYf1RGushqmtc6HkR2PPXyH53hcLAgRgtf?=
 =?us-ascii?Q?TCa2TPIChId+f2Z5WVIl+xJiB+KFgpYUiQ/G9y85fA2fkL7nsaQwQaOSOSts?=
 =?us-ascii?Q?+n1RESUJACw0R4yxlzvPIciShlncx5sjgtSsEE2kEVw2LiiorXkrbXBpwURm?=
 =?us-ascii?Q?hasLy7aTIjWoK/8A+kiwL/1/oGlVZuEI050RuhRMpQZkUAG51HcMmRbUXNn1?=
 =?us-ascii?Q?HeQdm6KtK15EVVTW5Q22gnDea8XfYzl7fyKwlGO/4essl62FlT+Wnqz+uUCZ?=
 =?us-ascii?Q?QhytLyoApFZVNXQ2JHcODOzRgjKP1shaVw8BKnBrc+nMBN14sdBtMwTWpHYz?=
 =?us-ascii?Q?Afvv7XDjZNJeMZMh/28y0MvYbb5rPAJ8xZFU3d5zHMXP9n+SPsnygb0oCOq7?=
 =?us-ascii?Q?MNOKbCu6hTeJyQMXfOzWpHO7+eVL85hO8Jnf3JajU3ghHz4v+9yW9RMybJFh?=
 =?us-ascii?Q?SVEkCgyK055/+dfZCOC9laJHNwKh0DPboibKQ96v+Av1nOwoPz1SBBgZZeAj?=
 =?us-ascii?Q?xvCaCq5THjHaSqdOqoRUUyV76E5jon1n8N03Cv2jv7SM0OzYAsFztM+XRPvx?=
 =?us-ascii?Q?lthY3Trnfe+xFUJD0gUM5JMh53OvDgO7nhTVKmoLrZCTToTcuk7a7xlh25pp?=
 =?us-ascii?Q?FaSzdJH5avPBNQYAhhW/ba/fQxIBo5GnzRoY1j9VjGMRo2MiZdKIzIRhIU0k?=
 =?us-ascii?Q?RqLYxjJFe7D/AZr87qg2qpH1N63z0PNia4a4WcvbHKUdrunfl++n4oqD17To?=
 =?us-ascii?Q?pT7x/+9xOuGuKpRyz2wbbnzavv2NiDXVBoLLN0uCs9X551cLxT97DnJXK7mt?=
 =?us-ascii?Q?oXe1sdf260O3my4bXiyvqwqB4/RaCaZdVH83UmIvdArqxAiBnHyRaDedHqqy?=
 =?us-ascii?Q?h33kf0XXBC7BaZMcnB3LNjFagCrvJVSIMNcqioYLspEBT41kF6x7Kqz3xKSK?=
 =?us-ascii?Q?0fbud348IUEGGdYMYPiMqTAW6pk53jodA4a6TAMKn/cycIZGUlQpd4XJqxM9?=
 =?us-ascii?Q?Im8UZUVKZvirSh8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U7o3eZm6w5m/qNK3bdOr2yzTZ8Rf2W4FBhB0N8342bPhzLQ4r9LyX/RJ81Ky?=
 =?us-ascii?Q?ymG1rmx9NPb1UlCNl/w82vuZ76plGDE+6UNFYaxDK9ZUXc43wVTsWZv/z63S?=
 =?us-ascii?Q?WyMVekbv3Eo8iLfA3xq2pn2L5RcG/KWJz8DcsGrsL18ZoW82NNqUTTaoctnl?=
 =?us-ascii?Q?ccPLvHby13vhSXxX1GN2e+fbF+NZfJ1FfYYFKCeowSmIv0hpWHtB6MfpWWVZ?=
 =?us-ascii?Q?9/mxM6y/9H52jGNsf7pX88uu02G6z7ozlnlxfkJf6zOF+SWehRmBzZRwC3Ez?=
 =?us-ascii?Q?6Z5LYAVLfY0LhAwMMVK/cc+SRmY7pMVeX/Pyh/MOu+SNs4tmv9opEsEeJzkE?=
 =?us-ascii?Q?nMj9Hg18ryHr6iS/SID3KI1LSdKpZanJh9ca3GSzv/m3d26psoOTVRu0JV3R?=
 =?us-ascii?Q?ibXyq58zYMQfOsDb5cowtuXgBw/L7Bvcygz5uygus8k1x+/AsIWKVEQdI9r4?=
 =?us-ascii?Q?756m4kqCty8zz/2m4w6m6o11GmYpZBLp0NgXuHHFSf1/28zFP4Zb1PC0OB81?=
 =?us-ascii?Q?ZNuypzry1wtmowOsLLH/U6OeUUV3Y00dUWcRvDz/TmM3uj1K9vHWSBMNH5Gb?=
 =?us-ascii?Q?jVF1RLKFpuxe0UII1ohNeweIMqew3eFSBzeW+bwNuh+xvbpZjWKnblT4ftrp?=
 =?us-ascii?Q?NbbSHQpm9HU0L0FNP2PyVYyX2n05O9qEXkqiLli9r5cYJh6W7Xee41VfSVP/?=
 =?us-ascii?Q?DdQBHPDpzJHtLGseVdg7kTTMQOW915FJp/CMjwmiCo/vsb23OOKaax4cJKsS?=
 =?us-ascii?Q?OB8Rk4GNtCfL3vrizxD2uc7iVTgGzXT9cYriSZtlZ5Tul626XGVHU7wOfWgU?=
 =?us-ascii?Q?pXYubfrjV1MaGf1GVneH82Iy4y96dtyRXw6u1ZYP2/+3fMZd639Q2EGZiws4?=
 =?us-ascii?Q?uGBxL1XzmEAgFZtJoRcqSI1Sv8NNrP96qRZwZnBM8JhekGu5AA3BC2r4WjO6?=
 =?us-ascii?Q?z1gPZjo8IuNnuXmC27c73Nu64uSDWATvq5ZKW1mGxpRuq5UZ91kWSbIP3eUg?=
 =?us-ascii?Q?Lr0GkbATCMtv/V/RmujpPmou4NPXsudOQUJWgHsHV/7FcDR5bk8zHx3PuUSA?=
 =?us-ascii?Q?3Y+5xFYufas8GsYhHXToCS6ZEw3sc+eo5/hinJgL/aDq8uXQmJhcEB7WWyS6?=
 =?us-ascii?Q?gknt6ThX0GTEYqA2d07DUnXJ6iYTcz2tEjpByIFbzJ++zkjV42+MPeKied3Q?=
 =?us-ascii?Q?EpzjYbkeCb9TEe1e89u9aFrSH/UsbiAOlVuYvEVSeL+uBn4VmwMQyzMXkk83?=
 =?us-ascii?Q?QhX/ZQfn4JqUeLJwPxMVPdAsCb2nekY1J6MJ0teIE7RQ5S3dqG6RroPPvWVB?=
 =?us-ascii?Q?rWjtJplFtlR8SceotyyCb/ybjzInC9U/li91bFMmJJfwzSILwqjPPi3oTENE?=
 =?us-ascii?Q?qmQxaqt5ziORUbZGN4rsxieCkQCuXby5he5pUo57PkIkTUsRtItHasb2r4cb?=
 =?us-ascii?Q?o0g27Vgm2JOJa7Vq+YvSWwWK3S+pbSdC3gDpCCmM/RHfNF5zQl0GSga1aw/v?=
 =?us-ascii?Q?nmIvPeqYnWSpAEbav4jp3AHeTKJe/0sCTtHMgjxvy3H6estg728VWMSAKQii?=
 =?us-ascii?Q?H0kVM4aKMteeFW48D6ifMfoPJy9a73yrpQ0Ps5Im?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2867ca7b-e9be-4d19-5257-08dd78ccb8df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:44:44.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLWeJ6EliMZhJylV6eQ+l/Jo04fNoQLv4Zs9zM0Gvm3r2vkmZbbXNHw5WNIl/w83jUsQhX7J2lJSF2B8s3SaDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8028

From: Ming Qian <ming.qian@oss.nxp.com>

As the first frame in "repeat-mode" is the pattern, the pattern done
interrupt is ignored by the driver. With small resolution bitstreams,
the interrupts might fire too quickly and hardware combine two irqs to
once because irq handle have latency. Thus the driver might miss the
frame decode done interrupt from the first actual frame.

In order to avoid the driver wait for the frame done interrupt that has
been combined to the pattern done interrupt and been ignored, driver
will check the curr_desc and slot_status registers to figure out if the
decoding of actual frame is finished or not.

Firstly we check the curr_desc register,
- if it is still pointing to the pattern descriptor, the second actual
frame is not started, we can wait for its frame-done interrupt.
- if the curr_desc has pointed to the frame descriptor, then we check the
ongoing bit of slot_status register.
- if the ongoing bit is set to 1, the decoding of the actual frame is not
finished, we can wait for its frame-done interrupt.
- if the ongoing bit is set to 0, the decoding of the actual frame is
finished, we can't wait for the second interrupt, but mark it as done.

But there is still a small problem, that the curr_desc and slot_status
registers are not synchronous. curr_desc is updated when the
next_descpt_ptr is loaded, but the ongoing bit of slot_status is set
after the 32 bytes descriptor is loaded, there will be a short time
interval in between, which may cause fake false. Consider read register
is quite slow compared with IP read 32byte from memory, read twice
slot_status can avoid this situation.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 31 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
index d579c804b047..adb93e977be9 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
@@ -89,6 +89,7 @@
 /* SLOT_STATUS fields for slots 0..3 */
 #define SLOT_STATUS_FRMDONE			(0x1 << 3)
 #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
+#define SLOT_STATUS_ONGOING			(0x1 << 31)
 
 /* SLOT_IRQ_EN fields TBD */
 
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 45705c606769..4346dcdc9697 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -910,6 +910,34 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
 	return size;
 }
 
+static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	u32 curr_desc;
+	u32 slot_status;
+
+	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
+	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
+		return true;
+
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	/*
+	 * The curr_desc register is updated when next_descpt_ptr is loaded,
+	 * the ongoing bit of slot_status is set when the 32 bytes descriptor is loaded.
+	 * So there will be a short time interval in between, which may cause fake false.
+	 * Consider read register is quite slow compared with IP read 32byte from memory,
+	 * read twice slot_status can avoid this situation.
+	 */
+	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
+	if (slot_status & SLOT_STATUS_ONGOING)
+		return true;
+
+	return false;
+}
+
 static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mxc_jpeg_dev *jpeg = priv;
@@ -979,7 +1007,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
 		goto job_unlock;
 	}
-	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
+	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
+	    mxc_dec_is_ongoing(ctx)) {
 		jpeg_src_buf->dht_needed = false;
 		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
 		goto job_unlock;
-- 
2.43.0-rc1


