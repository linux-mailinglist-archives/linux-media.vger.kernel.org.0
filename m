Return-Path: <linux-media+bounces-15135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6E93748D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C17A1C21E2B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 07:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9E25E091;
	Fri, 19 Jul 2024 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mCceScxE"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1B77109;
	Fri, 19 Jul 2024 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721375458; cv=fail; b=PrpMtg+c2dNL7LWWaw3Q9yJl1OzsYuyEqbxqOX1n5gW0KjciTcC+eSvGB9P/25q5mSXHdjpxOe38VJxY3Gjr7LVOVuA76mHyRLtMDNovZ26Mdu3ZQKUSWxCnvCuU7UDa+A0uaPPrAoXDyf8sELrX09hERfK4OeTqaqwjiMABc8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721375458; c=relaxed/simple;
	bh=Oop76aR9p9vlrwLahGwMcIpl/dGvcKoySnZLM1aJJVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j8UVuXCdzTXfBQ5MccKK5fJb8bWh6WFqOLrvTD5ndJWxiwPu8VndecBKfFyVUG4gePxmFTiE9W9eENn/v6cMV7vTH92zm5Kj5ixikLTQXFoEShE6GmB35PlM014OO9v5tARYpvIIC4jGMAaYSwbXYscqpBSF+3qDZJfdppAylcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=mCceScxE; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6m4E23wHOiJC35odVmp/TTvVdVwsB+4D4IBZIKmsl2TnJC6m1GRRTbrFRQlitnvjF5ZwLjcWVf6gNyZ570NoEyTXYxWa/jICqG92EFfyEbcz5oq379sBCQH78DBLjUb0ZCr5aHU2NoMIxWE00QdA26RBkSUt6DpIVzUV23peC9Y7+ufnRuZD7lm8ETn9Yvxt56yglroO74ybNvrrt58XZLVe1Plf/Fi0oxfz0+WWkGhB+dFjF71FBO37fu5T8TxktB9R2yyX3qPISPShZc3h/ub5d2jx9LY8302FSGTHcI6lPZA6DIhhgzaLHnzDcK9Upx6IVNlRCCLmTrkCDwWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tksjlkC2qYUPNV8qBJuLmInrtcjTgRVbapRbRxFOuM=;
 b=uuOT4qu0Xoi3bhwQDv7u68och7OJLQwCGqFr7Cy/hkUmyU459y9DTqh/xuaYKNPg6E4MP3/tQeyd4KFLDE5iaS7E7Czihsotmm3X400X0dtV7U/lLgnbhANkPYVLAWqQg+5n6bXb/wEdvWe4XHucQ0OzVg5KW1KhwVhcjfhpRg/VEt4/LJrSroGqOQohC8aOBRtkhLDdFkHy3EQTGOitDbFelq6RURm8UbSdlFaGg8Vo4U6XUOg/oG15HYxIkX0D3bkxVZTv/6HkZjBY/2MlwWWyy3piMhtOp/nEWOSpVILXcQnAa8GZqEnuE1nPVwN8ibZdNyXkKzKupkDAlSF/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tksjlkC2qYUPNV8qBJuLmInrtcjTgRVbapRbRxFOuM=;
 b=mCceScxEamy/tBFAVu72Rpe6AUY5jujP4jkp5wgHmWt9WP803Q9BCmdeZ6miQA8GbzMbCavONR7f1xLKQDcJVGDRXffyWnwXe6uVJXONTJV6YCe6cq9kxk/SmOkbmJm2JaDJHTWRzpDgsLPR3kqLuYNijd/3TV5pYOLivBLtBYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6912.eurprd04.prod.outlook.com (2603:10a6:803:134::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 07:50:39 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 07:50:39 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: amphion: Add H264 and HEVC profile and level control
Date: Fri, 19 Jul 2024 16:50:07 +0900
Message-ID: <20240719075007.384342-2-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20240719075007.384342-1-ming.qian@nxp.com>
References: <20240719075007.384342-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de516a7-390a-45dd-2375-08dca7c77b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S+Gn+5tlkZDapFkMA64nS4EoZTo4K5ai9QmMGCEUhmQsL+/J675NH0NHgDE3?=
 =?us-ascii?Q?wGR4dCpS8827eTgtSSTPw0i8ysS0DAlOqaUnSAem/ksrC15VfetM9KWpxmRk?=
 =?us-ascii?Q?G9mbwiba1kzmcSAfzq6rVuTKlcxjNzsPPCJc0YFH0miwJBDoql8NoLcKJQ/e?=
 =?us-ascii?Q?9z6irSj2ohLrmU2SMekP4HKlolC7qifn7oQUXFgzMH/ewdTqYvgtZqbSdPMQ?=
 =?us-ascii?Q?0mVB3CjFxUqRGNl7UjLJ+7uo5wfgUq0iXaldekBP4vH/eib5DuZCvbWiV0zN?=
 =?us-ascii?Q?Ae1k9XICB0Oa8CKQQjCPnlDHqlTB4j0TvFRnvOTi5FofzKseodsyjv89bxCh?=
 =?us-ascii?Q?IjEOD7rq/xv9D0QPP+vxb8KcbKsthUstxeys2v/Z7D6CcJpDdn3AsO+fGOzy?=
 =?us-ascii?Q?5nvKVQ6kHKuVIx4T0l2Zj4sCbsrrXcJLaknryyvvYFNB2slgULfaFufI/n0t?=
 =?us-ascii?Q?+KsW+bYv6kaPj3WLfMrcS8wJF87HWVJQlO7q7BHQkRYFL0uW4oYaCb2U3NcM?=
 =?us-ascii?Q?b4JaTouEx8Z7tagnvb/383RCAJdkbbKENlUl0A1ORlzQFzle8AUcAEBoMFlY?=
 =?us-ascii?Q?jMIhDXMPyNJvD85S3S5SkI578RDvjV5VDAHSUd4v0O9K+K+PPJR/5OG/tcaY?=
 =?us-ascii?Q?g4LxuGbIKv7WbxhxdJ3AflA3JUbVJO2kfEepvZ+GzuqG6vcMHAj4K2pMJukX?=
 =?us-ascii?Q?9oGvidJ8nHXZ1M057WfUX0ypg96po5eTqHnzLoSsf/rqqBCV1bK3+CbSLnzx?=
 =?us-ascii?Q?u3Th/OEDx5TRHJoL9mUklAb4S5rKK6Kaqq5FIkXv6AcSXDjSLPhYRjIEXjls?=
 =?us-ascii?Q?6y7be6GNZuOfT4olSypw42qeqoiSuGv7Vgb2F1Dqa1D50F20Ln6JtfT7RnEB?=
 =?us-ascii?Q?6pp+qI7fPpGS5D3aNjiUVrdEWR4cQREb1hhN1DfjTUkeHYT17WYLh4tAz43M?=
 =?us-ascii?Q?txwT58mrIHeASqWU0xh0vClppv3+N5RftGXs8Weu7annuhOmRpoQrqHm7nrL?=
 =?us-ascii?Q?RD0edQrKTVCTyOcpvmSEpwi6uUnm2HKYYg68pVj6tduQJDTF0ZwyFh8gAetI?=
 =?us-ascii?Q?SQDCDJq3mSbRp6C4oEOeM/+IhZwLGbKGfoeMm71TyP7EXRBumLJ8L1Qb7FuR?=
 =?us-ascii?Q?HfBcM5TIee6aYP5QMBh4E6L3GqZbdG/DFf/P0bzd+MyuSC/5zRUoV4uql5Mv?=
 =?us-ascii?Q?6m2He/bVZRyapr5ZKoTOG4/fYC4fP4+8a7hTmTg+c44x6VuKLEbLRcUgT7yA?=
 =?us-ascii?Q?xk/3YAVGmCq1BI8Z+NzSFBN/jXR/73ux9053AO6OSgI/M/fSERIE3ngx82p0?=
 =?us-ascii?Q?wRuDe1PKDFioGgzMurKUnsHXxUjsW5fe4i4Gi91+vI7ajwRGuMGkTizNrVoy?=
 =?us-ascii?Q?MUGzvT/f2Pg9C/EHQwvaVUVtB2tOCBXujdjuMer6tyi8EtK4VA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vK+Mk/UGUtB9U/ZtMd7Qb2sliax9p+Saqip6YH4gkeo3ax6kna3dJ62LmagX?=
 =?us-ascii?Q?Xjk3pEowwYElwlv84SpM9/h4DG9Qtjsso83TKR6HikBX8GpU0Fis8XVj7g10?=
 =?us-ascii?Q?lm3c7yHvGkPtXfKUSBxH/F+GZAIQszgZu/Cy2nSGL3R0Cux3LZzwQwphZOua?=
 =?us-ascii?Q?C1ixDzg7v/XLiPEORAy6kKLd05BWSIApZDmlQOxBMEyH0MluCLnsfcT78H1r?=
 =?us-ascii?Q?QR54dmGL3Ut9BEHyTBj+VUWDJDEgDtT+ZfJatRDdAr2JDf4bsR0zMDXbRd2B?=
 =?us-ascii?Q?+8Pi8l2NJNSh+3/EWCDKJhw5kO4Qkqk13EewdCPv2YlRoIFgG48a4wksJ2Yd?=
 =?us-ascii?Q?PII7Y+FC90Nie0FM6Bv4KfUsJnWLdz8PA1hlmfvrQI+V0tcU2BGgJE8FhfZL?=
 =?us-ascii?Q?si71wMahdMQOk9SQyuYgJ7ceZKejW7qZQ99gC9YAvorsp8hDwmtNRtBVNUi9?=
 =?us-ascii?Q?lYR8P2GC7RizXeJIyteqeLH/EJ91yKUZKj7dD1EMFLs96ietGZBxTnguGOHp?=
 =?us-ascii?Q?ScOShxidQkkbmuFnC+yIn5KGX0C1I0QmU/vjS8BHv/p4MyCusA4GS4OLpcUq?=
 =?us-ascii?Q?R5HJx5SKjwC16BdkaEtaL/+Mg6hRIcu9lJ3DMKqokMjFnlBG0MzPPBgRzyd1?=
 =?us-ascii?Q?vSQpvEEVoHfFngzym/sLtkJpK14k62ga56Gv0Xxx+CccxNlQBCldjqxmdio5?=
 =?us-ascii?Q?InA/xZNHXvkDJBg+dW5yDR+JvSRYmM3lKJN6DvkZYXVhAULEVCT7RZimsImV?=
 =?us-ascii?Q?acGtyLE2BQViZEo4lhIz6eFVn1wKumh+PikE8u8z2QvYMriTAsddbDC5L7cS?=
 =?us-ascii?Q?3Md84OnXzc1DAh8p1KAC4zebv5iQWXI4ip7o7MFmJ0gIZjp+kM2zrhKwx1XV?=
 =?us-ascii?Q?5YxxyCuuhYh2/Z4gG7XuqkJ2o3zzTzc12WvIihYLK4L94EOJxnvEPXbEGRPi?=
 =?us-ascii?Q?aaC7ON+bZxbYoFsKqp6A3PLCEf8Exg7Ba/U2yV9owUhA7nzMUcNsohIh5TwK?=
 =?us-ascii?Q?PE7+mSVhhBZVDxTtV6LElY7iDS90ErzPVWxTPm5btfKN0RU+ZleF1q0+xMMk?=
 =?us-ascii?Q?9xGXVadgBxO5QIj2UD7Z5UqB7Dzo+4IPRaMZIRWCUZH7DBEbzMgosAF3GeOl?=
 =?us-ascii?Q?NF+x2QvUyveeNbRgNgZwNYk8hxxwZP3QYg7Vcg1NSrlX37gRQxv3QVOENAjl?=
 =?us-ascii?Q?nwiCQXz1HATKJmsZdCK4UNSHEQedSf5rT1onb5Aj/hV2h92QNivK4+1pfRUv?=
 =?us-ascii?Q?UJNSzNkh0A53C79SarTyMfwfTZbecyBQMyhUWnxCetT/wJwLoGZvd47bGFTK?=
 =?us-ascii?Q?Lot5mYhCYX6frLv7qGeyK/nIWj6ewnao3cNALvNGhu2k2yErYPQQHUlRSQKA?=
 =?us-ascii?Q?boJ5ATM6LYMqhw82sQ7WcCzypUVPty4CXMTc/utKgZ+DeJGa956V0U+bBjix?=
 =?us-ascii?Q?3OiXiREfu9xN0loWolY8NQAFmGaA5Z7FrzGEUn+ygD3h2GVzYh4o1p8omkAI?=
 =?us-ascii?Q?FDjCoAg3WlquH9TZoDNuPIijMTQVo0q/RwoV9DIoNkSQ6Ys8CXQfQ87mnI03?=
 =?us-ascii?Q?LwyakHqs6NJLwF8RfrQJR02/qAzD6RvqwzvVEohx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de516a7-390a-45dd-2375-08dca7c77b54
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:50:39.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BRMS5lNvf56Wg4Nj+iZGusFE0O3AxhGqEdpxeyG9rT8gWgpTURxvxxBT3VyUoYeYgmvfUgqV2c5zf6adZJu4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6912

For format H264 and HEVC, the firmware can report the parsed profile idc
and level idc to driver, there information may be useful.
Implement the H264 and HEVC profile and level control to report them.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 drivers/media/platform/amphion/vdec.c        | 60 +++++++++++++
 drivers/media/platform/amphion/vpu_defs.h    |  1 +
 drivers/media/platform/amphion/vpu_helpers.c | 93 ++++++++++++++++++++
 drivers/media/platform/amphion/vpu_helpers.h |  5 ++
 drivers/media/platform/amphion/vpu_malone.c  |  3 +-
 5 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index ca8f7319503a..e414d1b56133 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -232,6 +232,36 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
 			  0, 1, 1, 0);
 
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+			       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
+				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+			       ~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+
+	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+			       0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
+
 	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
 				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
 	if (ctrl)
@@ -1166,6 +1196,35 @@ static void vdec_clear_slots(struct vpu_inst *inst)
 	}
 }
 
+static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val)
+{
+	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler, id);
+
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, val);
+}
+
+static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
+{
+	switch (inst->out_format.pixfmt) {
+	case V4L2_PIX_FMT_H264:
+	case V4L2_PIX_FMT_H264_MVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+				      vpu_get_h264_v4l2_profile(hdr->profile_idc));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+				      vpu_get_h264_v4l2_level(hdr->level_idc));
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+				      vpu_get_hevc_v4l2_profile(hdr->profile_idc));
+		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+				      vpu_get_hevc_v4l2_level(hdr->level_idc));
+		break;
+	default:
+		return;
+	}
+}
+
 static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
 {
 	struct vdec_t *vdec = inst->priv;
@@ -1189,6 +1248,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
 	vdec_init_crop(inst);
 	vdec_init_mbi(inst);
 	vdec_init_dcp(inst);
+	vdec_update_v4l2_profile_level(inst, hdr);
 	if (!vdec->seq_hdr_found) {
 		vdec->seq_tag = vdec->codec_info.tag;
 		if (vdec->is_source_changed) {
diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
index 428d988cf2f7..606f9d61a265 100644
--- a/drivers/media/platform/amphion/vpu_defs.h
+++ b/drivers/media/platform/amphion/vpu_defs.h
@@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
 	u32 decoded_height;
 	struct v4l2_fract frame_rate;
 	u32 dsp_asp_ratio;
+	u32 profile_idc;
 	u32 level_idc;
 	u32 bit_depth_luma;
 	u32 bit_depth_chroma;
diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
index d12310af9ebc..108b75ceb4ae 100644
--- a/drivers/media/platform/amphion/vpu_helpers.c
+++ b/drivers/media/platform/amphion/vpu_helpers.c
@@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_codec_state state)
 	}
 	return "<unknown>";
 }
+
+struct codec_id_mapping {
+	u32 id;
+	u32 v4l2_id;
+};
+
+static struct codec_id_mapping h264_profiles[] = {
+	{66,  V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
+	{77,  V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
+	{88,  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
+	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
+	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
+	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
+};
+
+static struct codec_id_mapping h264_levels[] = {
+	{10,  V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
+	{9,   V4L2_MPEG_VIDEO_H264_LEVEL_1B},
+	{11,  V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
+	{12,  V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
+	{13,  V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
+	{20,  V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
+	{21,  V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
+	{22,  V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
+	{30,  V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
+	{31,  V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
+	{32,  V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
+	{40,  V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
+	{41,  V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
+	{42,  V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
+	{50,  V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
+	{51,  V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
+	{52,  V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
+	{60,  V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
+	{61,  V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
+	{62,  V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
+};
+
+static struct codec_id_mapping hevc_profiles[] = {
+	{1,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
+	{2,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
+};
+
+static struct codec_id_mapping hevc_levels[] = {
+	{30,  V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
+	{60,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
+	{63,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
+	{90,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
+	{93,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
+	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
+	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
+	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
+	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
+	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
+	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
+	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
+	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
+};
+
+static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 array_sz)
+{
+	u32 i;
+
+	if (!array || !array_sz)
+		return 0;
+
+	for (i = 0; i < array_sz; i++) {
+		if (id == array[i].id)
+			return array[i].v4l2_id;
+	}
+
+	return 0;
+}
+
+u32 vpu_get_h264_v4l2_profile(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_profiles));
+}
+
+u32 vpu_get_h264_v4l2_level(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_levels));
+}
+
+u32 vpu_get_hevc_v4l2_profile(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
+}
+
+u32 vpu_get_hevc_v4l2_level(u32 idc)
+{
+	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_levels));
+}
diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
index 0eaddb07190d..dc5fb1ca2d33 100644
--- a/drivers/media/platform/amphion/vpu_helpers.h
+++ b/drivers/media/platform/amphion/vpu_helpers.h
@@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfu
 
 int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
 int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
+
+u32 vpu_get_h264_v4l2_profile(u32 idc);
+u32 vpu_get_h264_v4l2_level(u32 idc);
+u32 vpu_get_hevc_v4l2_profile(u32 idc);
+u32 vpu_get_hevc_v4l2_level(u32 idc);
 #endif
diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index 4769c053c6c2..5c6b2a841b6f 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
 	info->frame_rate.numerator = 1000;
 	info->frame_rate.denominator = pkt->data[8];
 	info->dsp_asp_ratio = pkt->data[9];
-	info->level_idc = pkt->data[10];
+	info->profile_idc = (pkt->data[10] >> 8) & 0xff;
+	info->level_idc = pkt->data[10] & 0xff;
 	info->bit_depth_luma = pkt->data[13];
 	info->bit_depth_chroma = pkt->data[14];
 	info->chroma_fmt = pkt->data[15];
-- 
2.43.0-rc1


