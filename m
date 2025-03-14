Return-Path: <linux-media+bounces-28232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C26A613F0
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC5627AE6FC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB5520110B;
	Fri, 14 Mar 2025 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="N7EZXaig"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731E1990BA;
	Fri, 14 Mar 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741963583; cv=fail; b=VTKxK6hhEjp2VhqxupHs9TwaQ6/sTLXbq8AdlfG4BtbNRxhS25yjS0k4rhhq8tuAjl2hHl5QklOfUEzmZ7TL/4xF9iaOFqHB5X/ppbXUcg+4CMoVH8VH00SOAlaWt5BMUMlnn29vlyntWA3I/o0BBWr5IE3dL3EdZjjLyYkSbgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741963583; c=relaxed/simple;
	bh=zrZJE1SQwUV8YIDym7vMruuUPOPAdciS04ObPbl7GKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhwbLyXsx1X+vyoRbRs8pYQAIQktmDFaw+2txmM1FyTHO4/2DiaKr2IMsF7yfWko6tbc5KUhNGbwOYvyQXBrHsLnMEUANvO/wkU+V9eddsrDLHSKtvbdeZtlDD8J2VOankCTbmbx2Pk9YTyrPZh2y5HtmaJivYWZtm1rq7vbSCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=N7EZXaig; arc=fail smtp.client-ip=40.107.162.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5U1cXBj7XGZudtEBDhtqL+SAoYSKjF4Yc/woA4iYp9k/kaBT0I8i4rRkjdya72O9E7n0ApcovqS5aGE+ofYRKRy2WrAx2Rsa0rqbTvVkAuhx1Ske0b8iQY13XfzPlHizQeMBqYwanjkBWbWX8sfPaEMAc1RHWcestn/bAKVzfwa5+vqo1c4hxsMSqjr3WgbUNOuLieHcrhoJQ6cLxwlS6PJyImQzAixeWkiMYPPbLN0LyiFSxHTmptUx40Zyetifh+l7BUEKLe8rAUzrEYmTZaffVMXajqwLDBnATktx/rWxGdZa74NbTG5qQ062J84pMHNXaXDHV8GB9ROKQXdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON3V7YtH/qR1tqarWspQ7zeUE8pqKgUK7jAGyBfOzfo=;
 b=cvOm2hZCFnBRbKuk8HT2jfy62Dn5ACaNSwjLUK+95e0/Wa5QIlT+1fGYWKYjj028pFPHPIhg/R09qh5t1qrTASSzQpOc7NFtRKaat3LBcgocHK6gm6WKdDE1REFgU0KsaXoHy7MSbVIUqACqQGqktsiMh9E71N/Z4KyYsmQFBAlyEX1/RQDxVbnOEkB6tZebrrsuN1UG5JP6/feZyl8dR7BZgVO+5P+V2ufN+wMaKaocYjj9j2bqyj4Ytsks9ukuVoVEUlwCJV0lxW/zT6OkgflgXE6wqb/c7lJ6bWD/Mhf/0q7n8SDCQLMTb7SJ3QjC/ykntxXipcZlclCaSHQ4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON3V7YtH/qR1tqarWspQ7zeUE8pqKgUK7jAGyBfOzfo=;
 b=N7EZXaig2IKXRPM6VY8XbPgnICPR5AjGZDRMs2WEd/bWXBumNMHbduFgOVCzPVxyQucf8OTzJncFBXwPCLOq9V4mSBnae6Wtnjv08G62paAxelfL3Sbc0LA8pkn1RlEo9uUY+zMiZP8xqLI7QPyXgvD0df6O7w+v99d48MeFjTikkcUVw56TUKLq103ni8WNRq//INkPvLr4ycff1hAHW/jUUoBORSuN+J00jwdsKb9zPM5vzeTQWkSdfZY3CNOU8AYmB3ND4b1jsWO3WDDL8IrbuWQYNzHaZj7CDALSn2duRXmCpXjmANTd1V2vTY13bHbmSRXv01GbPV6GJOLtLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DBBPR03MB7097.eurprd03.prod.outlook.com (2603:10a6:10:1f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 14:46:18 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 14:46:18 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 1/1] media: imx: csi: Parse link configuration from fw_node
Date: Fri, 14 Mar 2025 15:46:09 +0100
Message-Id: <20250314144609.219486-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314144609.219486-1-mathis.foerst@mt.com>
References: <20250314144609.219486-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::21) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DBBPR03MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 70aa4691-b5f8-47d6-033a-08dd6306f9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RmTSfGtpn1WjeUUwqRSpFMnNTvuDOBJW0IUwT7fvw9lCb//Vgi4vqDLkNMBk?=
 =?us-ascii?Q?fSgSto0jX00U6AJoJ1qCyGHTCmN04GvD3WnJR8wh4FSvU+oajzbuSKJs+Kfz?=
 =?us-ascii?Q?Yug11MPyKiHwwB+DIH+OiDE01jOxG7UIHMJp/f3y6aWvi8Yn7KxPGtBOyMFN?=
 =?us-ascii?Q?zJdho+7g0kbwL4RH0Srg/QyMDN59sJ2Lu/w3h/HeLweMn3oueLVfwVYO/LKL?=
 =?us-ascii?Q?FIp0JoGtO2bNl9GeD+q5KY0+g4NojPolB9l/tn/JfXoqLKcyYgznFR7MQBgU?=
 =?us-ascii?Q?3U7ODsfGoWnyQai97/k1qOJYD+dG+HSWrjGG8kR4uVKY1q8ePTt3u1Qei9Pw?=
 =?us-ascii?Q?BqkHitrvy8Hp3R3EJ2gCIDitf2ytxf0qvcoyGMF6FgkaILzzGy1YtK3Ya7CP?=
 =?us-ascii?Q?bcq3EVyaOnytNh77Mvuld+KG744W7S2/OzY4ZLynYSyQKzSfdbcxaP07MY3t?=
 =?us-ascii?Q?pyz7Wy1COsdtd/A2nMC1u5n8YBABEZ+4JuL0dRpJgMQT6e//4cKvpinEBqen?=
 =?us-ascii?Q?hlwgZBW2QRBkQsqEdADHdBX4fCMbbpcCAQKlL+tMQLpgugxLZNEMBc03dqr3?=
 =?us-ascii?Q?ptpmZBs0EWiAqLd8dbQgJW9DIx++Qbx7rtcW+tPOYTgUR9YMPdfcVgBvqZF0?=
 =?us-ascii?Q?M8SNEavBhGx5va7mpKtNymK4P93jca3hiWsoENLEs8EzIhAMzAa3uXQ+65LO?=
 =?us-ascii?Q?I09TAhjB+matacgoqMqijL7IP6xZkaVCYVaImJPEwaugqfkENq72TkCZmbNU?=
 =?us-ascii?Q?2k2o4wk5GnC9sYS7eoolTEeovUh5vS9TMu+cNEIVLPlJ+caz2cWqtT/vyeQ2?=
 =?us-ascii?Q?8Tyz61PAybP5+wf/fyWG+5p0/+7fJLg+AjkWxoNsQoH+ZFsumc34KTusHi60?=
 =?us-ascii?Q?SiYCJpdimL2hBkM6X2/11oUIDZrKFdwREiVZ80pRC9dju4w/0vAfKadWf1XQ?=
 =?us-ascii?Q?KAuPFBvd81p7zh7z1cgYVrS0Wfqhq1oNrCGWUck1ikw51EpIvTot58Yq7ymh?=
 =?us-ascii?Q?Sa8aLDyY/okqF/HMqGKMzyDhlYGyu4+BWxOoI1uygP7W7wmwmuF85gQsaBdV?=
 =?us-ascii?Q?SYfFn6MUJvvj21LXGOQjAXr25wpUDFPS/0MPNNmaYUnFY8mwWxs7n6D4uVVU?=
 =?us-ascii?Q?MO2eG6y6lkD1EzJTMSEalJQuGRcdBLULbFUQh6lk54IF5cnHD8wr4wy8zLZ2?=
 =?us-ascii?Q?lmSFRIKAeBsJ06OHjHR+oMpxwtNgPVFK5+EGr9D/DfkSI7QDuceZ+qwGtW48?=
 =?us-ascii?Q?18jSdquTnoRPvtxtiYANUg6n1uACeQ70k3B1DqAN8uL2o7iFKt6yCfQ8uEEF?=
 =?us-ascii?Q?bW4LGKHapl3KLA0hmusJzJuEq5ia4s4UTy8t4OykHmxOuAm6eY+2q+Zcupxo?=
 =?us-ascii?Q?pGyC3yM5X3QHwcuMuLKUM/CIq+rDjS6B2yaXfo9B/wDJcGy2Ya24N1vApUEt?=
 =?us-ascii?Q?r1SVHH8vG4YUJDdpZlr041JC84SDUU3R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zoHdNVaEBYpX83fFHp1szniplrdtlK5DjKKtmYNXKJG/lYx13eLQlGtvCd7E?=
 =?us-ascii?Q?C1mVMPiXf4r21NAlUVFd4aS8MBf9jR65OSvqYgngpe5OprozCjF13HLHBrVo?=
 =?us-ascii?Q?v6P9R8Rto58fDadwnCWkPtOU2kTacYWKd0q2xULwQRfEbd7TRBoWl3c6Jy//?=
 =?us-ascii?Q?oQ1Mtxh9LgryrcH6UtjXCvOQSXeM+HZ+Amd6f5bbxJ2WRTh2dsIjEFbaToG6?=
 =?us-ascii?Q?cojHTLLImI6RrLuNIo+lysTBN2lilSPYyjXP9A8kLgbyGPXxc0jSCu2fubLe?=
 =?us-ascii?Q?nf/lMjmrGsugev0Ny7YAs3BV3m4GJW9ssFiFudw69VZ4Icm7GMw6dAMpzM0K?=
 =?us-ascii?Q?vvhDm8YozlhTAKiwx4LPT4uauKoj3Fyyi1E+TnVThlasomE57bABsieM1sKo?=
 =?us-ascii?Q?XTGaElBMvbZwj8LkX3YAF8siNJo3jKqS9Gi6OpGnmI2bufE3cHZpGjig5NYe?=
 =?us-ascii?Q?QuuvaIhTZfGHBuXAHdTtT5bZq5BJZ87BJHcMfKfRsN8pgKG6B8/dLu20wXq5?=
 =?us-ascii?Q?adGBllvErl6NNUjOA3ToAo8urhe6WTvJ3TVJce8P5Pnnn7w4jHJBXdjqJrGA?=
 =?us-ascii?Q?ZoUNdxhayBaR5OWzTDLiF4oIK9CFxn/oBJixCXR5UyX7yusIPl4c1jNheRTJ?=
 =?us-ascii?Q?YLij1i4Jn+yqqXmCB0s7X80D4qjZiKG2uoXyqrGhsJM+YkRHo6WSEN5KPD6D?=
 =?us-ascii?Q?/ktsh2MDbC9z5omyxiETZzSBBj35Ame1nigUC8LabdIyDq2l6HnKa9C178uI?=
 =?us-ascii?Q?NleYfN8/Sl+jfyZD9jOJ78gdIRPZXqde8V3IXK6AB/FNZw1moGk4zPROceV7?=
 =?us-ascii?Q?Rolv71+GgKByEQRbgnKLsfdb06wiqEKVIM19JHoOm9t02P718vRm2NnNrEAg?=
 =?us-ascii?Q?pvVtlHDx/z4gyJ9T8MF3SpI63KHPVfRAOXNDlSxxjxolJu2q/+yuWE1N7p0j?=
 =?us-ascii?Q?G00i6qCEvx5KUwCzkCYVR4ngo09sMwi/tp9eR2WbNGDMGCvOSKZLSuQywKgQ?=
 =?us-ascii?Q?xdqACpcHgu99uO8rnBA7R8+pvqd9uO116drismRiswMe+/M0ENrwarIKUOpf?=
 =?us-ascii?Q?xmqIbpgWeiilSipDafLsL9pf1L40tB3a1ZNcuHxdlk7r7DAJfLS/H45I4BrO?=
 =?us-ascii?Q?yofGDf9ugOfgkK0JK3EIlKDfai1qkTjzQBEEKq2Xz6FIGBxLAMV8OXthndKb?=
 =?us-ascii?Q?NfhAvI2ua6AaepKrZZOGwUZsY/Aku3c4LZII+RKmtdvlOQsq1DygzkDEcdTk?=
 =?us-ascii?Q?Jp14RxaiR3K5wVdPmojeenX130PStMHK1zvcby1UHFMpxyiixFjtlDc6GWw1?=
 =?us-ascii?Q?D2UVHcAm7DshSp1WEk3qGjX0wEbzjsomAHm35XpE1mNGvT1exJ6I0zqZXo3V?=
 =?us-ascii?Q?YuoaFnzmmdkd5pXth2fqGnucYjAzRznbnnJ2fbaBurdEiIrSvslluSDkHw7m?=
 =?us-ascii?Q?FVQkgaiWBbpKyH8F+td8TvIETtJfGWxkVV5P+PBaZx3322z843fNocVDbKA2?=
 =?us-ascii?Q?/aiuV6v7DMyosDyQBurnFNGhkLDknDaoXwThY8zcUd6Kn4c7rArCe/qgR2VS?=
 =?us-ascii?Q?zBi90pbGL0+wToWGJrh4nKvrE+BSwtvQSquR/Sq1?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70aa4691-b5f8-47d6-033a-08dd6306f9bc
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 14:46:16.8907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKPtlBq+L5M13GKErjqQHbnwe2Gp4+UEs6ekxKZDH3qmN4Yfr2kTfQxbXPpAhFT7Ag9P5k1yYVm8HS6FZAZ0YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7097

The imx-media-csi driver requires upstream camera drivers to implement
the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
implement this function are not usable on the i.MX6.

The docs for get_mbus_config [1] say:
@get_mbus_config: get the media bus configuration of a remote sub-device.
            The media bus configuration is usually retrieved from the
            firmware interface at sub-device probe time, immediately
            applied to the hardware and eventually adjusted by the
            driver.

Currently, the imx-media-csi driver is not incorporating the information
from the firmware interface and therefore relies on the implementation of
get_mbus_config by the camera driver.

To be compatible with camera drivers not implementing get_mbus_config
(which is the usual case), use the bus information from the fw interface:

The camera does not necessarily has a direct media bus link to the CSI as
the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
between them on the media pipeline.
The CSI driver already implements the functionality to find the connected
camera sub-device to call get_mbus_config on it.

At this point the driver is modified as follows:
In the case that get_mbus_config is not implemented by the upstream
camera, try to get its endpoint configuration from the firmware interface
usign v4l2_fwnode_endpoint_parse.
For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
configuration.
For all other mbus_types, return an error.

Note that parsing the mbus_config from the fw interface is not done during
probing because the camera that's connected to the CSI can change based on
the selected input of the video-mux at runtime.

[0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
[1] include/media/v4l2-subdev.h - line 814

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3edbc57be2ca..394a9321a10b 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 {
 	struct v4l2_subdev *sd, *remote_sd;
 	struct media_pad *remote_pad;
+	struct fwnode_handle *ep_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	int ret;
 
 	if (!priv->src_sd)
@@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 
 	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
 			       remote_pad->index, mbus_cfg);
-	if (ret == -ENOIOCTLCMD)
-		v4l2_err(&priv->sd,
-			 "entity %s does not implement get_mbus_config()\n",
-			 remote_pad->entity->name);
+	if (ret == -ENOIOCTLCMD) {
+		/*
+		 * If the upstream sd does not implement get_mbus_config,
+		 * try to parse the link configuration from its fw_node
+		 */
+		ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),
+							  0, 0,
+							  FWNODE_GRAPH_ENDPOINT_NEXT);
+		if (!ep_node)
+			return -ENOTCONN;
+
+		ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+		fwnode_handle_put(ep_node);
+		if (ret)
+			return ret;
 
+		mbus_cfg->type = ep.bus_type;
+		switch (ep.bus_type) {
+		case V4L2_MBUS_PARALLEL:
+		case V4L2_MBUS_BT656:
+			mbus_cfg->bus.parallel = ep.bus.parallel;
+			break;
+		case V4L2_MBUS_CSI2_DPHY:
+			mbus_cfg->bus.mipi_csi2 = ep.bus.mipi_csi2;
+			break;
+		default:
+			v4l2_err(&priv->sd, "Unsupported mbus_type: %i\n",
+				 ep.bus_type);
+			return -EINVAL;
+		}
+	}
 	return ret;
 }
 
-- 
2.34.1


