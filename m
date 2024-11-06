Return-Path: <linux-media+bounces-20976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D39BDE8C
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9431F248BD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D931BDABF;
	Wed,  6 Nov 2024 06:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h+0gmSrD"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2291A2647;
	Wed,  6 Nov 2024 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873328; cv=fail; b=JJM1LUHpndPobsw1FhT0cTk6SF+vVBqv/399qyxLcp7OoKPr7D2VrDaInmqwLzNXywb6JMr5zT7kY2zu8OvEhfFMgkXPQyVyfp7JZ9OyvLoBvp2nJEj6NAvAMPc03/Op8nEycCnn17hwxcHvlt846GsOReSeSqDp7b4aE/B3ROI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873328; c=relaxed/simple;
	bh=8TmkSyEh8mPOvw8vWrXALSOqGcZ1thlhOQ+VFpBiQqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=icp1+xFCC+MFmPZGOnr5RfysSsFZCQNEfZyyw5jpVkz8dPVm3C52POKj1zKAP38s64w+R8z6HVQeUFFHd+uD7/I2z0Lzq50J2352k+hTsveuz0DQj1LpuXiz5oNoprIMRhhJ6JWYUFQdJF/Rjj18g/C1L7VzaqKri+OtsWPhYyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h+0gmSrD; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzNsBLwgRGU5cWh3EtpR9CK2+BI6PcFukH2RTREgSKCUhXpRMihjbYME/CdmBDuOg6n803IbOpqviZMxuEojj2isFxi5B0p4vqLwYw+IVdye0R6tq2va97MzI7zoO43oLBpGU1qU70pIhfHpnVlBv48TbK74W6psxRD1pMPJDqpZ6H+OK8+ig0d2Q4y37Rq+nTkSEdOuuafnGebGgi9wgM/owQ1TOU2fQ9g2Rd2pT2UT86gOgJOr5lEgXLa9HNY18VKDAvd/FAv9Kmsfcryq81pyHL0DavwC6N594u14EKhXpufFHoikOQIKIItTihuqsJFB/IpAdNvJ7syUswQk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rprtpvc1zdDrvybk3c/IlucgvRa5Vsy9qlFEqM2UhjA=;
 b=g2Hp0r0cd9j72tDI7+tHW69cPTm6bQiFvDpX4t8eEm2n9B4HX6hJ103HWid2yjPPawOdhjXEpyab24fXCkjLg5cg/km+Vyw6HR9Ue3saCM4H3jXGQpoXLzsuXFVEwDBjMKLIpdq9w5k1SmjBC8f1rAfCaqocnJDGAq3/vMNSW/V8iGnHXrt3yrUs2p2ZualyBZnyKvXUqr9xKGn7gxtYR3Mv+x7jeM6U9VGNcwDPfm3NKwWzKQpaMWrJBJCNgeYbxgYFURbCrBmpa+zqRRu64w0xj+wRjEPLgGv9gaHZf8mPXMNfk5fYHhmS0CMmATDR7cHwLGyVthzuX18xWed9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rprtpvc1zdDrvybk3c/IlucgvRa5Vsy9qlFEqM2UhjA=;
 b=h+0gmSrDNljGYVkcSbTK8PtWBE8Tgy229o7HN1trRFq7KJRtdcQFKdw8ZDuPk7QBTHkBlRTTmvbUp0Yj6Hb43oTNbAd2LoJRiNZETCzcfjQktaEvjZ0f6BMW1au2V5LcFs1nNmmLVMW0QJ2pl/8cKco9soE2TqNg1FUcEnW21x64r+XN4Ix5ZJK6foyRQC4ffbNHpm94tCp29Kljm8zznRa4C2x3Fe1E1gv0ChRzFh7+70IQ202AV7sCF1nWvQADEfzKYB2F6GGX1XZi85bHf3pYOnvhIbFVTl2E87y1Qa4YHyNRQiaULSXtT755+Erd3xanBKJIJtBmumnk/mJnEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10506.eurprd04.prod.outlook.com (2603:10a6:102:41e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 06:08:42 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:08:42 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
Date: Wed,  6 Nov 2024 15:07:52 +0900
Message-ID: <20241106060752.205074-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106060752.205074-1-ming.qian@oss.nxp.com>
References: <20241106060752.205074-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10506:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8be844-503b-49bc-6b40-08dcfe2976cf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nj7mKANf0/KR2QjzXzGgC9+pP7eVXSQ2aHZnQ2Ts2ApbTI46KRcs0AQOKUJT?=
 =?us-ascii?Q?MLpcE+hL1yTtcwfKh1nkAImFtw1RmHbjtbIuvnwKcjG6G5hT+kkNgHS0JbaP?=
 =?us-ascii?Q?UOP+Q/t6nMHgNEwxMADkIspgVNmn/7TeNj88VL9oiIVw5bXmMP0lW1somCl3?=
 =?us-ascii?Q?37U6C/oY7U1T+urD/ksajX4lAg1sqYyto6eczw93uVzr5HQ0VYDjRQLb5Tt+?=
 =?us-ascii?Q?PThoW7JLiJmTGet0yEgnqVZXc2qg6HO68J04b8Nt8JpzV8Sr05O8xzbSiV/i?=
 =?us-ascii?Q?75zJt/XlxesHNeVm3qVDcVD4jkthUpNvFLWP2YsSyqFh9hEmqoy6m5NxJ6tM?=
 =?us-ascii?Q?+liluFf/I9fgqGCSA1CvYLDF5ptCGs2JFRBmDeHuS5rm7JdPCeD1maE0JLE+?=
 =?us-ascii?Q?hunE1KDVPOseMb7kzHFSHsXhxchkwJGY7sySQe7cNG4tj7ut6nqBe1hgd3nR?=
 =?us-ascii?Q?DRUW0wZFWoLUIENs2w707WQUh9m9rFIP4IkO6q0z1nPnyjREazbzkuyV50cw?=
 =?us-ascii?Q?IpX9SeJsXHg/8nXEOY89RMgVK21gBc9fNB5WUzLEczckDRa/lelDYDpuDvjg?=
 =?us-ascii?Q?gQ60ejywJIFB/g9rzpGegKrGO/tKNU58V5iTZ6Kg69i5ZFc8QiUD7Ky9S+bq?=
 =?us-ascii?Q?TZwoAQYNUNr/6M6bt+3ZHOdJovMLzUEI01C4BS3oXonbha4YhlnuhEQPKoV6?=
 =?us-ascii?Q?mUxzdoDq87OfBPBPCfOyyc2cB2zPt/WJJhoixP9KN8ldBBlVz0zG7ulLqd1L?=
 =?us-ascii?Q?N/QCUQcP6B00qFpI31lEULG7GRL7MI4CFIrBMv/IQxcE74u9yrj8LeC4Y6P0?=
 =?us-ascii?Q?Zo1SzOa/60S9QpnhQOuk2XFj5MiCviZ6JIgW3L46yG39e9EY6iqRHoKrbu9N?=
 =?us-ascii?Q?xjFuMtIpivTniwU1wpdI5hKnng2ykZmtCHlwboL+uBhVn8jPkOoVpRRItSvV?=
 =?us-ascii?Q?A9mE3le1sK33EgmLisdXUTC3sKsQJojR29VLOeWBdYiMRt85jjCm5f6CYxq8?=
 =?us-ascii?Q?1DoYxe8pNqEln6RcqkhyDDLxi2cvATxpJl0hjDjWZhplsR3aWCMlZmQnzB0z?=
 =?us-ascii?Q?vPQ235i5HQiejIMafwS2qr6u5NbObKcU8vNVkm/P4dLrT1FgsKl2BY5Qi2Vx?=
 =?us-ascii?Q?6x35Hux1v90IFmiuaHXpnYBmeyF6tdFsFakOC3uPn8aLW3oVAtRpxlSYUBV9?=
 =?us-ascii?Q?R4Uit5f30nYGT+i1LPJkZs+tXqq4V/9WzHYNyPMANTOYK65uXwvCvaV1wUpI?=
 =?us-ascii?Q?+PLABim1+bycQgL8Y5x8fWgORRrRrYxqXClBau0Tyj+/HVVn+AKqImjMI9/f?=
 =?us-ascii?Q?ziueN4xShQ3dAOCnZb+T9JSyOljbDQsY8Rk52Vqisi0kVhmWt7986egjgrGN?=
 =?us-ascii?Q?Z6wSlIM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+Y3NiHgveFHzmiz1jIMOHCgqSK//jt3i9HymrnQ/Jk3rGz8ypFjc3J6h15A?=
 =?us-ascii?Q?AWDlb4XqDXN1YJardz9TZXCkueQ0NSVTRB02lXlLqTYVgFNW31P5i36G2U1T?=
 =?us-ascii?Q?i2zH2NnwiFfT5mw7trDfYuTP307y+VcCP6XE2hNLT7tblpCoqoGxKpv0K4JL?=
 =?us-ascii?Q?NFt2zck7E3HPgVip5E+hGM6DRVtPEFwWggX9z8JI7c0XQKrhVAS0jZ5mYSDo?=
 =?us-ascii?Q?j96dnMkJRyVO7VfTIl544fRZhQ8JxpS6w6eB+KIL+iTQn891HGb9rVR+XvXF?=
 =?us-ascii?Q?+8n3iORS50SVs4bSLwHXP26m2vwj2YnEt5SnDzBqIPHjaVMLr0hGPuGo31LM?=
 =?us-ascii?Q?ucDe3IghmMYgYV/8LJvcN6HJvNTv8yrWhFtosee9i776gqENzOPPMCttf5sx?=
 =?us-ascii?Q?RFydbL6RgiodkS753uz4eG+c1nfWBZDDwf7YxrirYwEFM/qDQxnQJo0zdD8f?=
 =?us-ascii?Q?jMtHRkOPtGZSTwE85qQMGLdpB+7EM30SDa8tKsld4/jEPcCwCHDgTFB90IFv?=
 =?us-ascii?Q?UiJEyxsrei6oEtSmJVHncY7IfwJUhTBK66V68O3obVBXqQp0R2mnttjGNCdW?=
 =?us-ascii?Q?LVyAl2EpBvqVT7cLU3ZjCfJTlMTjGR2ewlsP8hU7dJcwU1ZeY6PW4NC2jL9j?=
 =?us-ascii?Q?MVaS3YmnK8cYcqrUwp1Ws0aspuXw0Ua2qfRqK8oqHtce7d0lZs0ASLwalBrD?=
 =?us-ascii?Q?FkGzLKTajkwpDX4UiWPM2PwXD7bO1Ju3+h+pD6dQYjCkSD7vWb15MZcqDljT?=
 =?us-ascii?Q?DdWbajeqiRFV6E2osWR6mSpdr7FI/GjK65yQGwltWsPy9mJ4eh9msOWIgWSR?=
 =?us-ascii?Q?ceUy0sMW6XjLZiISDxi77rD8m/nA1APlNmZPwdimheRppro/TTP6kzs//aUm?=
 =?us-ascii?Q?aPp93E6wUEdWxMBfHw/fjzQIgaWzApHsYhERgpeSUkPB3H9ATm193lK9Ebwp?=
 =?us-ascii?Q?zIEl9yPKB6+BvCNF4JcQ4jOQBsWmJlD5qNf4ktfseUVVkTscA7vf7WuecTA/?=
 =?us-ascii?Q?6MK7dI81W7vAgjTZb4RY4A/RfIZ6vXaBglTg7ocMmrall4kDZDmYyWrnOIPj?=
 =?us-ascii?Q?TGz9UiKWPT4u6xDcBl64TZPjsyRTExPB4mh/YHmeMKnJczgCK9sIgMW4Hypi?=
 =?us-ascii?Q?Ng7GiGT+EPYVchFB/ulcL+A6gf0nVDc+n48TxlrsZiPJqw6Hm9rzk1u8JT6r?=
 =?us-ascii?Q?9Fh4D6GJe/VPpVQRljDL8E8uF5p/2nOmJ9XwSA3eHUlTJ5XagTn2CZO/g18P?=
 =?us-ascii?Q?tMRPgtc9NU2TttqjyHRRhc0oHCBPeEu9Ff4iVisTdCGQQSoYnrqJtHTnb57G?=
 =?us-ascii?Q?WPzrJQ2esOBsBHE62oMNLzcs3MrWBIUqBPeShRAlogzw+W3Rfd7aLFQiyU7T?=
 =?us-ascii?Q?Aj4N4RUctqmUD3lQvch2IhWKfncEa+9X2j8VVRaEIxNBYS+xk9gFf7qfbzc2?=
 =?us-ascii?Q?qSSh0MYtdmw59InTsfUWk/HV59tdQ/p/3fyH6eKQ72iUwOcRy5DP43k8SuNd?=
 =?us-ascii?Q?p49vZG2nf3NUI79r+sWAUaZUEmeermkf/AZrTNgeUcJ9W4leoEJ6GBWsnASg?=
 =?us-ascii?Q?FZl0taiMvbGnLyD/qJbkD37qnfGDyHg9hUyspmWY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8be844-503b-49bc-6b40-08dcfe2976cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:08:42.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQC8GSM8d+UlOgJn0P2/BPIAerAP3I4XrXX2AVcduszmAl6MQnF6iuW5TlGlTYbXOaSHb1dSboPUev4MpaTGsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10506

From: Ming Qian <ming.qian@nxp.com>

Add some ctrls to support the video encoder region-of-interest(ROI)
feature. The ROI QP Map and rectangular configuration are supported.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 136 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 ++++++
 include/uapi/linux/v4l2-controls.h            |  16 +++
 3 files changed, 198 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4a379bd9e3fb..be0ce3e2f081 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1667,6 +1667,142 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    (enum)
+
+enum v4l2_mpeg_video_roi_mode -
+    Indicates Video Encoding region-of-interest (ROI) Mode, enable different
+    encoding strategies based on selected areas within a frame. Choosing a
+    specific mode activates corresponding control or combinations of controls
+    to configure the ROI, e.g. for rectangle delta QP mode, you need to provide
+    V4L2_CID_MPEG_VIDEO_ROI_RECT and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP.
+    Applicable to encoders.
+
+    Possible values are:
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
+      - No ROI in the MPEG stream. Default mode.
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``
+      - Rectangle ROI mode and specifies ROI delta QP.
+        When enabled, define one or more rectangular ROI areas
+        where QP delta is applied. The control
+        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
+        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP is used to
+        set QP delta value.
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``
+      - Rectangle ROI mode and specifies ROI priority.
+        When enabled, define one or more rectangular ROI areas
+        where priority is applied. The control
+        V4L2_CID_MPEG_VIDEO_ROI_RECT is used to set ROI areas
+        and V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY is used to
+        set priority.
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP``
+      - Map ROI mode and specifies ROI delta QP.
+        When enabled, the whole frame is configured into a grid map
+        according to the ROI block region size in raster scan order,
+        and each region can have a QP delta applied.
+        The control V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP
+        is used to configure the ROI Map with QP delta values.
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP``
+      - Map ROI mode and specifies ROI absolute QP value.
+        When enabled, configure a grid ROI map where each region
+        has an absolute QP value assigned. The control
+        V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP is used to
+        configure the ROI Map with absolute QP values.
+
+``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE (struct)``
+    This read-only control returns the ROI block size in pixels. The struct
+    :c:type:`v4l2_area` provides the width and height in separate
+    fields. The resolution of the frame will be rounded up to be
+    aligned to this value when it's partitioned in blocks for QP
+    maps and the number of QP values in those maps will be the
+    number of blocks of these indicated pixel size that comprise
+    a full frame. This control depends on the encoding format,
+    and the detailed encoder hardware.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
+    A struct :c:type:`v4l2_rect` provides the rectangular region
+    described by the position of its top-left corner, the width
+    and the height. The unit is in pixels. And it should be aligned
+    to the ROI block size, which can be queried from
+    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. If it is not aligned to
+    the ROI block size, then X,Y gets rounded down, and width/height up.
+    If the rectangle is outside the frame, then it will be ignored.
+    The maximum number of rectangular regions depends on the hardware.
+    This control is a dynamically sized array.
+    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP`` or
+    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``. For overlapping
+    regions, the value that is first in the ROI array will have priority.
+    Applicable to encoders.
+
+``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP (integer)``
+    Specifies the ROI delta QP of a rectangular region. The delta QP
+    is the value that will be added on top of the frame level QP.
+    It can be positive (more distortion) or negative (less distortion)
+    values. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``, and must be used
+    in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
+    This control is a dynamically sized array, and the array size
+    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If the array sizes
+    do not match, then use the smallest size for both controls and
+    ignore the remaining elements in the larger array.
+    Applicable to encoders.
+
+``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY (integer)``
+    Specifies the ROI priority of a rectangular region. it can
+    be positive (more important) or negative (less important)
+    values and is compared with non-ROI region (taken as value 0).
+    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``, and must
+    be used in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
+    This control is a dynamically sized array, and the array size
+    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If the array sizes
+    do not match, then use the smallest size for both controls and
+    ignore the remaining elements in the larger array.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP (integer)``
+    Configure a frame-wide grid map that divides the entire
+    frame into blocks of the ROI block size, where each
+    region will have a QP delta applied. The ROI map is
+    arranged in raster scan order, and it's configured
+    as an integer array. The block size can be got from
+    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
+    dynamically sized array, the array size can be calculated
+    from video resolution and the ROI block size, and the
+    width and height should be rounded up to be aligned to
+    the block size. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP``.
+    If the array size is mismatch with the frame resolution,
+    the encoder should ignore the control completely.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP (integer)``
+    Configure a frame-wide grid map that divides the entire
+    frame into blocks of the ROI block size, where each
+    region will have an absolute QP applied. The ROI map is
+    arranged in raster scan order, and it's configured
+    as an integer array. The block size can be got from
+    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
+    dynamically sized array, the array size can be calculated
+    from video resolution and the ROI block size, and the
+    width and height should be rounded up to be aligned to
+    the block size. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP``.
+    If the array size is mismatch with the frame resolution,
+    the encoder should ignore the control completely.
+    Applicable to encoders.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..4d89309bf8d0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -612,6 +612,15 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		NULL,
 	};
 
+	static const char * const mpeg_video_roi_mode[] = {
+		"None",
+		"Rectangle Delta QP",
+		"Rectangle Priority",
+		"Map Delta QP",
+		"Map Absolute QP",
+		NULL,
+	};
+
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
 		return mpeg_audio_sampling_freq;
@@ -750,6 +759,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return camera_orientation;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 		return intra_refresh_period_type;
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
+		return mpeg_video_roi_mode;
 	default:
 		return NULL;
 	}
@@ -971,6 +982,13 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:		return "Video ROI Mode";
+	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:	return "Video ROI Block Size";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT:		return "Video ROI Rectangle Region";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:	return "Video ROI Rectangle Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:	return "Video ROI Rectangle Priority";
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:	return "Video ROI Delta QP Map";
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:	return "Video ROI Absolute QP Map";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1512,6 +1530,34 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
+		*type = V4L2_CTRL_TYPE_MENU;
+		*flags |= V4L2_CTRL_FLAG_UPDATE;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:
+		*type = V4L2_CTRL_TYPE_AREA;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
+		*type = V4L2_CTRL_TYPE_RECT;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..bf67d53af737 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -900,6 +900,22 @@ enum v4l2_mpeg_video_av1_level {
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
 
+enum v4l2_mpeg_video_roi_mode {
+	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
+	V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP,
+	V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY,
+	V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP,
+	V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP
+};
+
+#define V4L2_CID_MPEG_VIDEO_ROI_MODE			(V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE		(V4L2_CID_CODEC_BASE + 659)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT			(V4L2_CID_CODEC_BASE + 660)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP		(V4L2_CID_CODEC_BASE + 661)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY		(V4L2_CID_CODEC_BASE + 662)
+#define V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP		(V4L2_CID_CODEC_BASE + 663)
+#define V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP		(V4L2_CID_CODEC_BASE + 664)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
-- 
2.43.0-rc1


