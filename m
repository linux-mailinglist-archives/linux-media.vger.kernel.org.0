Return-Path: <linux-media+bounces-32964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD59DABE969
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 03:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09841BA77D5
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 01:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E77221567;
	Wed, 21 May 2025 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kFJcvYzz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE4E7081A;
	Wed, 21 May 2025 01:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747792515; cv=fail; b=UFIREd4BbvSb4CFaFhPMt0lOCYliAxZfWZy+3p4Bz7ZMQZqfLW5Q7cb3vHt8kVA+H3D8/6puU1JZtQyq0RpXtPJ+8Q8SUXl0zebuT1euOssQvL1yZGs0vfkujxnQ/jHnNjdpUE/ShUeAcORmBYzwDO7VfxHa3TeUP/xjTgNTvUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747792515; c=relaxed/simple;
	bh=XAR1k72g09SOfumt9KDnms5q1wmLPNU+r2AA7s1U0XY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kU3n+VXltLRttE2vpg3o9cP2wPJ8yqNhoLNcFQIaqiSlIyqgkCN9ImpdcjH0kyhMGJQZbgUUy1MFG7XIjydy4UwquabZbp4kZCoRlKdh+qAvvxso+T4F/7zILvwp7kVq0XdDDPTicQSREGv3ct3eXqEV6UoJ8oRZ7tGAmTqnDdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kFJcvYzz; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N68PJuWQYZgRo6iOWwRcP3157tE7+vylihhnTqET9hVS3cg6uCqJRbH3ipnMSZl2vGXLAGKm14Xwg7rHPfyy4m1ps8bu03FMnMwWaSeitqQdMjm833Hmm4mu6r60laJdsPoWIe9R2a7LzmNVdEyCAWkOOWR5saSnn4r+K9ZeY3nctEsaEq6D3/DAMQUlxk9fn14d+Dnb6w67oMRLr1EEUTBrEjjy/YN8yGlDiQZRyF8dcM24W3lA8oCEOhZxcvzx4nvYr8jXWh5fZEter6wU34gPguNbQd9SHklgSkhMcZKbYEaPJSdtYEsuhvx+lPaXdSDe6Iw+/jxYaTM9yTSA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1l5Y26fE31eA+2VlxwXfT3gELk5pZJS8QoxYnKKdj8=;
 b=gAz+RWhQYYzRNHDFcfTbr5VO9TeFSrvwHbRL36ayv0IcrPrSM3q2658PvRnMJ7ENs4j73YyHDXIb4Ug0eAWERn+3CvR65t3V1vDlaglQ9u3o2VsZeOm1RBVaWi7+Q6EXrIMYQsHd91ZSnS1QOrsTD+xe2Ab7/foMHA1p6MFXIyfpbxi5/1a2JuBtMxgKOAv9kfEJ02rDsHuXRMOtJybZfqLhuyBwt7KKPNi+wVRhSMfPVLUcnFIlzgohhVYxsxQqJwnJp+OR5Jte4aALw6wOpBGsRnPudVW6U0JWz1gEPS0GuZDfn53G4XLpbSPMcNB0KyXsFZDXuhm+28yV5yAWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1l5Y26fE31eA+2VlxwXfT3gELk5pZJS8QoxYnKKdj8=;
 b=kFJcvYzz8zi3nW1qG8dc3uDP+4ryqZ6o0vJV9psHx454m5hyoWs3A/bWn63QWELvJl0Hiz4oAJ9DRlUJNjOv/DqGQPmAiBCAng6sVBrYB2fsQtXhfH3pARQl7ky1b8Mf4vqVW9PBtCz9HD0vyDGzz2fA9PRjiL8ZNmOHUNNv/NyYLHLa0sHDLVE+8Ztye8ejSuR6qkvKgG+mGovqlgpovLgE+4U0dLxmqfl+ue/L594aHt4dCRD3Q6uUbeCSDSoR7upqydWLnm+GoUMzyOgAC+QGoHuNm8H7rU9ExTkIuONU7tDyyxdb2LcSsb6mOTDoka55BV5UrDlVPc+g9UYloQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 01:55:09 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 01:55:09 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
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
Subject: [PATCH v3] media: imx-jpeg: Account for data_offset when getting image address
Date: Wed, 21 May 2025 09:54:07 +0800
Message-ID: <20250521015408.261-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: 062635bc-fcec-4b4c-a32a-08dd980a83db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KHn1+pirKjfhhavRBZwqMd52SHVsW8s1jW6hk6fmpz8IAXgrwAuYJ7e21Mxo?=
 =?us-ascii?Q?2MPMfWI/pLapH8aoWRVdBV9me+hS+zH2jqY/BZ3Qdwl5qceugRL+atxU42Dk?=
 =?us-ascii?Q?LIMuahBdJ7XK2jQjJPtRgT6kP2fEDBk9Zcyf+n6mbrhkpAQbAPrH8Ez6fT6s?=
 =?us-ascii?Q?jv3IvtLupjdeTqbmG+9jeK5rvJGFJ/RxJGgslRn8TinzcpGoXRcm/7QtM6ap?=
 =?us-ascii?Q?aC2/+4/tTBLUuK5nvPh528+jOUuZzhR2y3HRkOv5/HVqnI9aOkf1C0db94Kl?=
 =?us-ascii?Q?go70yFlphgjmuW3PX1oJ0RdlYzKlaiJyyfTd2bizsNK7lezOb1kfHFEsQr7v?=
 =?us-ascii?Q?DMQT1pKkYasiOzdPgR75jqyh23VuBx4Rmop2lXpSFYIyuaai+Kic8QU3V5xt?=
 =?us-ascii?Q?wk5Yy4slmnmq3vSzXjGziHDEYMx4dd38LcALuuz5Do49DQD5nDpFxs/wr+if?=
 =?us-ascii?Q?6OeAhAbG9KFLvqsZN5tquiY2pJltgy4oYebtLMw0I90NKldvUT9Gx/PWJJCk?=
 =?us-ascii?Q?LzQ/2l4lUGk8Fx7nY8RsHmjS1qo8sSOhr+ULJzhd9x6gC5DXu2dN7QEVgSbr?=
 =?us-ascii?Q?7CI21nDcnLanzPKFjL7xRaaO0I7RU1BjZbs6516+jiLytTUg2VarMUjmInmS?=
 =?us-ascii?Q?QFFPmMGPW6snxaW/PCytwBdWmuBgEuV0yQj6sxow4S/63NoZlJq1cJRZFeAl?=
 =?us-ascii?Q?mak81t4Oti7ntO4W4mphOzMA5GZKbyhUb85bLnM2tKjKep3ROXh+nEHsz1Hh?=
 =?us-ascii?Q?OFSG2hfwPspug5yr7zXD7qO8K3oI8pT0+lbwz9glvhDS1vNVSxgASDTOl3Xr?=
 =?us-ascii?Q?5kptvOnGg0RRTmn7F+2CcZe5YHn3rYbyjVzlWj7yJNDq+gOiM9PSL0eLg3t9?=
 =?us-ascii?Q?x5XrP4Ds3dGQCvrmDrGxgDHsPwRAR5o+brVQ+ZGbEdFCcVa7pDbTYBq91oU7?=
 =?us-ascii?Q?w81c8s6Nxqzx14S9GxW97JRi8hMei6ApMakzR75yWiyomyBNYrfcb/gEWesR?=
 =?us-ascii?Q?N1lZrVnwizrQpKbTjSmfDJHHKZT3uZa5dh1r1gTH0WwMCCeJB/E9vGAJ0fEr?=
 =?us-ascii?Q?gk0LdF/84EUroaDslaxjSjqw0EhP1RBM4TDtHAGqBDxfJ0d6oaM3NtGxhGME?=
 =?us-ascii?Q?+tVFcyl7+PZQ6qlgjT3uxlndDYYR9E9q5aVJ1KWOKvOtpeFDh4qYXrHJ9iD6?=
 =?us-ascii?Q?U87ZdDWU5yebrDy/rIP/Wihd6oXK28SgMb8ftFGEVktQvacOQIZEPWbM83rg?=
 =?us-ascii?Q?oT9Ljr+E4tQwrnHzwvPngiKLDe66cJS2TFphtgXuePXYopH5FbrHcsvIsyZx?=
 =?us-ascii?Q?N19dKOkfW1AAVfOYLKVruxxiZ6+985Dk3KCWQ26owBwAyGXuuWoDrnrI+8by?=
 =?us-ascii?Q?b3v/oszAg8m+4I7kRzGZNICeFIxxWC8NPmL0OMHNcE6LIqE9g3eFks9pYrM1?=
 =?us-ascii?Q?isOUbqzA86FbIMTWmn986Qt6OEjxAKW+ZlZwlti0GpdaeHDjJZ2o/w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y7v5X0bvbvmF12aeaPeUDKmjhdrnsXPSIb+swHIQu5duVp9QGDOkVmxZ9xrI?=
 =?us-ascii?Q?2KGu1t354AKuWsr5W/ht7llQKc2icz9wbZMYg1mzan7LMNkyag8t/uONyHbb?=
 =?us-ascii?Q?aqXwGNBp7ZibRtbu+9yIUf9hWYK6k/ysWP6vsu7qdzvWYZqrSbXWN0rXP9F3?=
 =?us-ascii?Q?M35EutiyyhSatocBqrprcJM/uZDMoO8MkyhUmFrjwCpykEvqMfjlx1f4RUH/?=
 =?us-ascii?Q?0xP0Nh9Vdl94rpbpCV5sik43AbaLtmiOMqpp41algmxwGLWH1/FXu6Loeeq8?=
 =?us-ascii?Q?K2FGtxX8zdfvNLC7cNSALhxHfse4K3ov1OeEl5Z28ZrIxaUq3KN7BvcdqzM3?=
 =?us-ascii?Q?DKMEIXsacsOZ99LIBTF3ym89EBjjhrlqYvm/DbmaqZTsB41RsgrNpAgNo8Yu?=
 =?us-ascii?Q?vd0dkBkmT7ZLf5h4xhMoPRl7exH2WQajE/TXHGzsIVPp6UiF/pKvOru0QxRu?=
 =?us-ascii?Q?TK8F+wcHs23dohGGMiDNHPnZYK1ZS+8XvFonPYeug2ynq/Oy32eOq0fvanCy?=
 =?us-ascii?Q?XFxBBOT8jRUOzxUHA6XqH824UWsK8Lg+WoGNL2hMkycJpWcsoRotPYFywTGz?=
 =?us-ascii?Q?bk/UxfG83y6vBaepcQ/Xik0AYWQX7lIR9J5HV11ro0OuIpb1UJGSf9nATHAm?=
 =?us-ascii?Q?rjwEZcA1rrs/atNr2cvyyzAPXm56NvdlL+oIKNnVtSm47zFieftk4ZpIkyJ2?=
 =?us-ascii?Q?g+cYnFbVbOJh2y6H+vRvtWnxwVllf2KEpGVC2girSPNppgHuKUbiEBJS1174?=
 =?us-ascii?Q?ZJ7kPsM721FCbm5C12pYQAfTSwmMrRPtzRlWtQoZwbtHU1XQXd0waYFDeNpj?=
 =?us-ascii?Q?WvMTuc6CoOAI9Ma4QyeoslRewkoMkxl/oU3LHCUx+8prbeLxU+//d9RIOnSj?=
 =?us-ascii?Q?Izr9VJNLGrYBf207JWNTvkZtqSg0EQermdhSXZHQe90Ny+4RSUkErMIyUZ6Z?=
 =?us-ascii?Q?XdhO5YalSPdn8ifP1OUKXIGMcs5WRBnf4SWvylWum93D2wESYDDaJKJwXyRe?=
 =?us-ascii?Q?Usqe07aEPkjZey3S7/ubXmsiFOVw4HDIJ8sj3MW8SLAA6svRovgVbLSDDu4V?=
 =?us-ascii?Q?20/P4jKBCcahFlwUiVqmqodOMeqSa94x1ZQw9tdKs5My2L9P7zEbVZG1aKuh?=
 =?us-ascii?Q?pmUbRpnGXQnDybUKd534HY1vMM5KC9EZeWkup6t3nn45xe56Dssok+b4ZxIO?=
 =?us-ascii?Q?znEJ68kuBJrbaLjIwf4XQNZ2VXopZX6ecIAfIOdvkxX4kVYDhVLNuJPkmW3a?=
 =?us-ascii?Q?s49w05C9yXJ9tfuChWj2ATG2IrFZVXngY05M5l1SWDJZYGSvwv0CfT3P446d?=
 =?us-ascii?Q?SH40VRZAOi8yy4/D0B0kqICKh1oH1YqLPGNmRUSZwD4XWWpLaTEfxlNz93wV?=
 =?us-ascii?Q?Nh2a1T23tbatIh2wEKDDpU+by8XeLvbjotqfV9okQsg+6fD4Ou89soj6uD2l?=
 =?us-ascii?Q?F/dthxGQmIfvOuXAdo0vX71MUNxww5DxuJy5CKrQjXfhuQoVY7ylvPgncg+L?=
 =?us-ascii?Q?iVi8BmX0qizhrhPhFgTVtty6obMB0GxWky1jYOvPjJ2DwPD1pHVkTYixStBw?=
 =?us-ascii?Q?w0CgadRVe3MEeF8vy3eiFakhS5SJ4/zGUqwafTD1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062635bc-fcec-4b4c-a32a-08dd980a83db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 01:55:08.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uye58QsAwZ62W7y0wnV0nu9MatzbsdE3DfvyVA8a7zCh6ZxtagFOSXY1ODOQxkIKX/qycjrrlwUnw6Bo74ncOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948

From: Ming Qian <ming.qian@oss.nxp.com>

Applications may set data_offset when it refers to an output queue. So
driver need to account for it when getting the start address of input
image in the plane.

Meanwhile the mxc-jpeg codec requires the address (plane address +
data_offset) to be 16-aligned.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Add Fixes tag, it's a bug fix, as missed consider data_offset

v2
- Verify the address alignment
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 ++++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 5c17bc58181e..8681dd193033 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -598,6 +598,27 @@ static void _bswap16(u16 *a)
 	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
 }
 
+static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return 0;
+	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane_no].data_offset;
+}
+
+static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return NULL;
+	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offset;
+}
+
+static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return 0;
+	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].data_offset;
+}
+
 static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 			  unsigned long len)
 {
@@ -610,11 +631,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 		return;
 
 	for (plane_no = 0; plane_no < buf->num_planes; plane_no++) {
-		payload = vb2_get_plane_payload(buf, plane_no);
+		payload = mxc_jpeg_get_plane_payload(buf, plane_no);
 		if (len == 0)
 			len = payload;
-		dma_addr = vb2_dma_contig_plane_dma_addr(buf, plane_no);
-		vaddr = vb2_plane_vaddr(buf, plane_no);
+		dma_addr = mxc_jpeg_get_plane_dma_addr(buf, plane_no);
+		vaddr = mxc_jpeg_get_plane_vaddr(buf, plane_no);
 		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
 			 "plane %d (vaddr=%p dma_addr=%x payload=%ld):",
 			  plane_no, vaddr, dma_addr, payload);
@@ -712,16 +733,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
 	struct mxc_jpeg_q_data *q_data;
 
 	q_data = mxc_jpeg_get_q_data(ctx, raw_buf->type);
-	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
+	desc->buf_base0 = mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
 	desc->buf_base1 = 0;
 	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
 		if (raw_buf->num_planes == 2)
-			desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
+			desc->buf_base1 = mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
 		else
 			desc->buf_base1 = desc->buf_base0 + q_data->sizeimage[0];
 	}
-	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
-		offset;
+	desc->stm_bufbase = mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset;
 }
 
 static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_fmt *fmt)
@@ -1029,8 +1049,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
 		}
 		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
-			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
-			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
+			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
+			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
 	}
 
 	/* short preview of the results */
@@ -1889,8 +1909,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx, struct vb2_buffer *vb)
 	struct mxc_jpeg_sof *psof = NULL;
 	struct mxc_jpeg_sos *psos = NULL;
 	struct mxc_jpeg_src_buf *jpeg_src_buf = vb2_to_mxc_buf(vb);
-	u8 *src_addr = (u8 *)vb2_plane_vaddr(vb, 0);
-	u32 size = vb2_get_plane_payload(vb, 0);
+	u8 *src_addr = (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
+	u32 size = mxc_jpeg_get_plane_payload(vb, 0);
 	int ret;
 
 	memset(&header, 0, sizeof(header));
@@ -2027,6 +2047,11 @@ static int mxc_jpeg_buf_prepare(struct vb2_buffer *vb)
 				i, vb2_plane_size(vb, i), sizeimage);
 			return -EINVAL;
 		}
+		if (!IS_ALIGNED(mxc_jpeg_get_plane_dma_addr(vb, i), MXC_JPEG_ADDR_ALIGNMENT)) {
+			dev_err(dev, "planes[%d] address is not %d aligned\n",
+				i, MXC_JPEG_ADDR_ALIGNMENT);
+			return -EINVAL;
+		}
 	}
 	if (V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type)) {
 		vb2_set_plane_payload(vb, 0, 0);
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index fdde45f7e163..44e46face6d1 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -30,6 +30,7 @@
 #define MXC_JPEG_MAX_PLANES		2
 #define MXC_JPEG_PATTERN_WIDTH		128
 #define MXC_JPEG_PATTERN_HEIGHT		64
+#define MXC_JPEG_ADDR_ALIGNMENT		16
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */

base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.43.0-rc1


