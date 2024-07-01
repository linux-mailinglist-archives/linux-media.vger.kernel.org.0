Return-Path: <linux-media+bounces-14438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A787691D627
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 04:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4662802BA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 02:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45414B676;
	Mon,  1 Jul 2024 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F6G95ptW"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2056.outbound.protection.outlook.com [40.107.113.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3074C144
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719801183; cv=fail; b=NzEA4mZeUlVFqJHmGxT3qKGS00YMpY7zAyv4uG2pnklRATng2VaY0HfnPSDlVKjO2fuLyimuZ9j2nrXbJ/BkYNBZiSwq/hPgedSC5sCCum3JrPG+UyRvbB78lFBgwoPygvQRH3MMDXxxCtYZrzWy75A2EEvDBD16qYTDPNpjQ6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719801183; c=relaxed/simple;
	bh=DwLtoxNla6DkvikOOTVjb3y53SRtnptzaIjj6rURwoE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZoP5IQkd3F8uHDpgXEW2sQV4HdP+tpAiOggEbTdcgw+Fql+b/JmnLTm3/iuGCWqcPa/RMPk61+A6Q3BrTZFZ4IbxaGtIHKC2u5W9gKCvHCzHggGCZtCvgRiUvvtemkR5LU9RfAD+eMi8Y8R5If7aLlh/XgFcpHFq/zgS0V9Wvd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F6G95ptW; arc=fail smtp.client-ip=40.107.113.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebiKrYAEWxFASlBFsuzlmcXZNNWCMrrbQw7DXTuVMN+TmbJsTUyliSzrORcGOeYnYkgtILOZZEdw/XMwrl74TuqZk9BaSziy/p8SwXvY4ikQr35+4EoQig6T4j2FeXZ70TWepFjDeKY4x3fmQ1OtBJRGzpsW/GM7i7hsUNEGNoHKC4U1hmMb56J54+z2ffxIdtm7Xz9I/VwCslaSFaaTzA0tx8/yvY4Gx1KTHb0kTfhqADVs/iIGojhPhQQcueT7JcMWnobjZL4lAoGyeWSUPb5cG13IojmQUZB65FGm6Mjp4Pe74686a2Kk7JltqSN+LyvjUvN+W2VnCrDBG17Gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EizFzsMXfbQm3/2Lb/FDIskE2XZqm0mVAacTe880PQ0=;
 b=mkRhnJqibcUd6vWBKWJRzWlT/Ly0Xnkt5K0S5WLo0JNMYBfwdQ0HCYXpujIp25T23OJC8RDclPt9kcqaxENS5JQ8V8LISjHQQGaBIHnzsZiOb45FxjtUdX7+2C0uWckXWfbVEYzW2IofZ6ijJa85pSbLW6/DVLae2HU9WUqJr/nVKKmqH+1aSKdKFU9xKBT12Rp3VrAvB9t26se94KGPGa/hjmUzdK51Vq3efcL5pkMed0gbTpJKklchi8ETECow3IVuQRicp7hFaeEV/8hLr6HEQqQjtLTGVRMLSggYuvb0ehk7TM4hB3IKaTk4uWebfJidUBxh3q8OHXgDM0fYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EizFzsMXfbQm3/2Lb/FDIskE2XZqm0mVAacTe880PQ0=;
 b=F6G95ptW6F7U68hg22+Ew8KoEpcPoLjv/x4Yo5M4Hzw4d/2jNlhIfQUfJZS9E6CmKutqmRM6ysb7CWzHadC8l+W8Zt3wndEEjlrKh4pDwNtQNDUsN9UluCiS53ZcATv6Xx4przRF8i16813+blHhI3AhYTPgAQ6i7Ug6wNm51eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6704.jpnprd01.prod.outlook.com
 (2603:1096:400:9f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 02:32:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:32:55 +0000
Message-ID: <874j9996zs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 6/7] media: platform: xilinx: use for_each_endpoint_of_node()
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	coresight@lists.linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
In-Reply-To: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 02:32:55 +0000
X-ClientProxiedBy: TYAPR04CA0023.apcprd04.prod.outlook.com
 (2603:1096:404:15::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc68beb-1644-4f31-2218-08dc99761d48
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jik6/g3BrnM/eChqqIJ4btqWtMkY5t4/7gAgoWn/ABMyOLn+h1h1x5s4ZyjB?=
 =?us-ascii?Q?Gu+5a1SWau1HvkiOx7Lla8M1k0YRc5sssU6KVVBaZSWm/Ubmcs1pD7M5JRir?=
 =?us-ascii?Q?IUeUE+GToq/Ieh38XnqjnBkySxy88Gpr111fnViBaGUFnBeTZMFu7pjTSr2o?=
 =?us-ascii?Q?UwjaadNJEHsoA3BlSFZ929uMBoWHNMobg/eB7FJjfrt1q1FYYs7qshn26oAR?=
 =?us-ascii?Q?r5Ov+UjzffMPLziYD19nu8P2dQpGmh/UtZ3/82PD/c8/g3vsRPbEjG7ZNq9D?=
 =?us-ascii?Q?Zb9uFKb3ZOAOAeMa7PIqIzu6fkMwR5loV1ZyqWny5FQDyWCKiquGIAcTYL5D?=
 =?us-ascii?Q?mZqaBRWn2aCKam2c1+I5H3UhzzhL0LIqIvrK1MJgcRVxYX/ABARCR6Z42bWC?=
 =?us-ascii?Q?EaWZV0UPrTxg6VG3/2cvN89pNm6NUbXEejfqUMkmmMPZGRpn2OCqfIa+KLku?=
 =?us-ascii?Q?85oLfHlBYiEjx4dEh+eXTHw9SmGXuzKMWTfLdfmfTjWFIOjfIFzqUEkhPak5?=
 =?us-ascii?Q?t16XD6tc0Jan2Z5CsPopQlc2KOsMxx+8rfroX6tg1l2K/vA78L5ef26sS6+C?=
 =?us-ascii?Q?0bpcKC3GIkcNRGT+KlYHWLIE80MKWTWnl2Bkb1TB06xpgmH9xr/AunzsAk3j?=
 =?us-ascii?Q?BG1Dz+TnHjJPJ9rZLCB+yOQe5upcZYnK8EkZPOJZ6trwUP2Nspauue5kmqHn?=
 =?us-ascii?Q?/vfAzq66hOnMdZwziBN9jtP7gvsA7VzLOfFnYOz9lyVs7imLPYmiF0pmU0vU?=
 =?us-ascii?Q?sSyVfzZspKEoLVyMbgRpPLvTD/DFHGCrmT58vihBstUhbr2QfucyCpir4QY7?=
 =?us-ascii?Q?rsCeXVY/Yq0tbbN94tjlDAIykOYOlAVqQdFZr3w0Xt9yHY3tJkBmCVh5EdBM?=
 =?us-ascii?Q?2n0T/xhZmHnVUFuoIShmaZfC0UcCw6Pt6B5pwfZAWOBGR5TH67S4KrOLR6NR?=
 =?us-ascii?Q?Pi6/feNBnnSxyrVAzwPRk9xj3OEGWgqc3YHleTm/AVK/znYn0OdoOXGV6Yl4?=
 =?us-ascii?Q?FhcbHdv9VOGB9qNrwmzhFWaAfSGCBRXmdlKnH0hkwqm9PNhilekumYZmJ1Ti?=
 =?us-ascii?Q?i7tUjsh6fTsQ0I1iIj8Kz0MRwZ6CrtsxQB9KdJXBf1HDkzIlEwiMw69nKvYH?=
 =?us-ascii?Q?C5ri5xAIAVjn1FWZImwpFpGu9RagrpuQ5N3+F/Gb1V66UscZ2ru5mtH/USiA?=
 =?us-ascii?Q?HiK28DHCFSuAy8tTscpnVwpwgHQQEkSisoUL7TSdrHqMwyBx8Xmmzz3Phmoo?=
 =?us-ascii?Q?/myuJ+2I88+KMx4o4wrQUa3WN+8aDOlo+wCaCVXmz+t2BWoyuBjfck8mY+Tv?=
 =?us-ascii?Q?OEPTF7p9qRLEPj3/qsQ5bREokF+TJD60kVDsB0i7GQtmA3I9E5DHqQnjaf78?=
 =?us-ascii?Q?djmd3I1O5DJm1cxRqdwyC5PIvlVffJhhJqkeQ4ybcxGt5bs+7dNqIz8VfgxW?=
 =?us-ascii?Q?xSAa61jmaSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C94I2FmY2raftHtrXTHSVKsSoqUg9mD3Tgr3YeJgkbJ9QUkIUR1CTmYgOOp9?=
 =?us-ascii?Q?vXHhslM+lIsBxJSvHR4R0apSvzTCefVnv80pwl76gmZ8nM+ORGP3Mmo3HwFe?=
 =?us-ascii?Q?DG0j4RAFkz8QCW6B/9dHM3J+pUBO4KsUYaaiitN5Ph9nwbqTn83QjbwqkLl9?=
 =?us-ascii?Q?J8b9k1Rm5MD4/OlXqHsRVYxkutzMUqZQ3nEdRaDsYPEqTVjwp4TWXyFoabaO?=
 =?us-ascii?Q?2OLJHih0TrJ6Nk6niqSqozv2TtB9AeKj6bP9Qyvig8ovHepQJurrkkoXCnbK?=
 =?us-ascii?Q?J/E3uqjwR6RkxafK8V4ZKLjAE2jKi0CX7yiR3aIWDwIVRKFH1m85KEcrSNpD?=
 =?us-ascii?Q?ohtggqZFYYIO2T/WZYBp1ZP/6iKAmXUOZtR/zOsNtLrSJrarcaomjK6u69Mu?=
 =?us-ascii?Q?LhV1H9jgOo4C2S/E1vc5jLDsZ6M8z5bvsG7sixkvL7unD5NF1oBJcQrEyQhc?=
 =?us-ascii?Q?WykvdOYiZ4LAx8DQtoMLiopTM+PZ6c5Faa+2xleYv0tPToBeLLnBTirEsJQp?=
 =?us-ascii?Q?bArdgzdSTmtQpvgV87TpWHkUx2qmEH5xm0gSdB0hF8JoqM0zNvo4URtTI46o?=
 =?us-ascii?Q?cJqYXVZx+sWBhdPDxZppLoNBwUe4M53jf0Q2vO/RDeigzvpcu881gwrNvkMr?=
 =?us-ascii?Q?pS4CIzf6Hbm4RFE8M6R7nvg3rMl8u+db4rrpQYQBSJqKP6Kh0F2r/jEaucDS?=
 =?us-ascii?Q?E9To1mhTRXtrbLpTrJZr4ojc07HWNUk16T2OcYIYfxqPXlmoYp5/96M3LmR2?=
 =?us-ascii?Q?F/eqW3Uk0dWrQ4np7WJBvViBEz2nXJIq/IcZHx6ggYahbsDy3c/bASB//bT8?=
 =?us-ascii?Q?ykklelGxJ1ixMlMc8cAatFEdavOhOVJyRoSZJbX8KyWZq6Lglzf6N9kNhgbI?=
 =?us-ascii?Q?OOFvO5cfYwaR8qILNuzFDOU08XrJTC6K2jqEcHvb1lS+pSpigavSKtK6vaVb?=
 =?us-ascii?Q?LpgDNbpCFcSpCnRIV1Ky3EpgUmQVLMZCu9zoWeHHo+ssIHcBEQBEnLUVnvZ+?=
 =?us-ascii?Q?wnjn8gb4O/5IcfZY0NkuBydUM1KleuGW0U94yNbcLcOVKvfSWfsxQA4aaBux?=
 =?us-ascii?Q?0tD/CznPJPSAI9iTM93hhn2xzWNcOCQa27CuM7ZjGHyDzSY3a+Mg4bPZmncz?=
 =?us-ascii?Q?kE6UjJmAK1NyOMwM6JsNdiF+u5sT72BNa44NvVj+O2HRCUi2pFFw2/SG68GH?=
 =?us-ascii?Q?uqDacG1GxtgvD7P1/t8OI2TyitT63ozOcu8O/YbmpnCNLvmZ0o2mGyzQb85N?=
 =?us-ascii?Q?XkyVJBW8OcD2mAVggmc7SYvf/MizrI8qlkX72Cj2EkHP+kbVaZC9BxM2j4he?=
 =?us-ascii?Q?zIRJDf/jlyl+r5raQhoduD895+mbOfSxqqj6jKeI8Fcext9Dgtv7AhwGuGXK?=
 =?us-ascii?Q?Tvurm+y6N5EhxiIO81anreXH+OIRSPoM3wUT2TejpX47FO46PbC90Vv9Oo4W?=
 =?us-ascii?Q?0EfhyZomVF1EfudkycDlepzQs2/4dt6F7BhIqDMKyZRHLi5sN6OU+oDiV0hv?=
 =?us-ascii?Q?HvSKNaJUkSF9+Idizt3X/3+dcwFUjcTPl1mAeHuPvZrIAWVxWFBS+/ripDZu?=
 =?us-ascii?Q?8CK4I4tff225F+qBr5xa+ylYki4mCkBLi7PiSgpRwWqHD5IJDZdHd8UYI8Fj?=
 =?us-ascii?Q?nTMnTbnArPytfbsi6HqlQ4I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc68beb-1644-4f31-2218-08dc99761d48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:32:55.7071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/spJ6PT47PjhrhWOgnS2y9w3qKvry55nIcImbl5IJauCmvp7qOigfnI1Y9TRvmy7Ii4ZRRE5652GJhyO+Rr0e3ISJhBkUj/O5Mm5N9MpVLk2MibUi55UY57BhAxny1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6704

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a73038..bfe48cc0ab52 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -199,18 +199,13 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 	struct media_pad *sink_pad;
 	struct xvip_graph_entity *ent;
 	struct v4l2_fwnode_link link;
-	struct device_node *ep = NULL;
+	struct device_node *ep;
 	struct xvip_dma *dma;
 	int ret = 0;
 
 	dev_dbg(xdev->dev, "creating links for DMA engines\n");
 
-	while (1) {
-		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
-		if (ep == NULL)
-			break;
-
+	for_each_endpoint_of_node(node, ep) {
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
 		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-- 
2.43.0


