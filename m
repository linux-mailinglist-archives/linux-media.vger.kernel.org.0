Return-Path: <linux-media+bounces-45201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D1BFAACA
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 800BD42522D
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860402FFFAA;
	Wed, 22 Oct 2025 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ia5Uo7Ln"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021101.outbound.protection.outlook.com [40.107.42.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56762FD66B;
	Wed, 22 Oct 2025 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119259; cv=fail; b=ghMlBZKPlUaxOEwGbvIjFZOkd/4j8sT4RqWzbWxp9UhhjC7pOufF04uyet8ZNEDCsKAL30QMja3cGu+ZR8pnXrsA/OpBHPQGXDctyG795OK3wyuNL8AiFk2ynPPD308sWTwW06Tyq+pgpk3XoRTHRlxDAOoC7F/K1CAggmkhrCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119259; c=relaxed/simple;
	bh=dssHNFg4VVIu6IRNGpuihEx306KNZXPvCuTAex5i4Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cxvTXyXMgcLg9Q68UYcSQvNEKdu4Dm0dsw+ow4TJNEx3fmTkfKS0EtjBYeQO8iFkKVGKgVC3/EwGL0nwSSNVk4Bwtp1bnLkH6rdEpF2ATllQswvPKkTnQWoLfOjLk98VJSzBkUUHiTHaLsq4XwXn6R6ex04mHgWfrU3NpEo7Bo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ia5Uo7Ln; arc=fail smtp.client-ip=40.107.42.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OL43r4Z5E5Sr1P+HtsMPIKVBFWZBiM69O+fE7ybVcGkf3PyM8ZrRLigpq1HtFAhCrtRllBp2+EbFMPbpluG6AtjqhBiJIEqmtZAxpTuTbGQjelrzNF1m4ABCmsoa+eic6iHRbccDBjf5P2NSExNYbQJe09Rqe6CHdAVNpyKrG+ujPs9aP0lnpAspTMe+dWuFBXVZc5vh5iIDT7/++QxwMX+6m2sAn+RUufETLFBc5SkKBW93JTFo2LPMdD61Lj6cCjPNktH2Pcbp9L1R8qyGm3Le++qBiuI3auisNkOWX6IUXEUfcsCzYURc79Gkg6+hfrLk4fDp5T/dtyQ1lbyojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usZ5J43geuWA/QomYNwc9hTc+6kZUfGovneJPiH3vF0=;
 b=tRfbWipyC4wgbj7eeGMeEgkQ4ajczrNDqq6Gfq2BklNDy26FUjEOwH3sRmFjaJFE/YAO0XEEDAh1670kUF1pBvLiNjZRlf78/a0GavZD/nRf+TH5p2qFwd9zBjL11z2NwCwTREI+YmwZgZMG9C/JEM2zFI6cjLyKeDkUo7YDR1n/WyHDvtA7+UCfNTDg84i0+zlX92ht0mmkRoF9tyXAafMm9LXU39AHVBbTVY4IuTuJjyBA7pcuEqBagiRDByCBi5OfQnq5K53Fyv2ffBkUme5piV3A6l4AWsirCzaANmBlXDoZDfSw6x9wFE1ARCFGlsSK/OTm5Gcm7rhXHoYqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usZ5J43geuWA/QomYNwc9hTc+6kZUfGovneJPiH3vF0=;
 b=Ia5Uo7LnMuP+WH4KR/UIjyMq4lDDoOqZkpqgmgoitZp+J2XuFb7ciFdrx/U0UtdejIZOj/RFlBerjmpmOKYcAX5K5jSyzVtmoMGAfaPQmrf+si3Z43fBocS73Ps0So+cAIjHOZx9PNVDxxxP9p6FFrrUSFFI5TCXd86aXXXYZyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2918.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Wed, 22 Oct 2025 07:47:26 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:25 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v4 4/9] media: chips-media: wave6: Add v4l2 m2m driver support
Date: Wed, 22 Oct 2025 16:47:05 +0900
Message-Id: <20251022074710.575-5-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PUYP216MB2918:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b970d3-caba-4e8a-f16f-08de113f3e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|4022899009|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pAUHqwJn1unM88pqRzB6D2EbGSO9uNoNvvy41YlM4bNQt9iqeE6bgzzf9jTQ?=
 =?us-ascii?Q?1zIpzxfCAPEtvAg6z8CctxhTHLFoKhhpoWVvlwX2telkOeZadfpct+SgBz0k?=
 =?us-ascii?Q?6ABHx005U87YtV8aMKcz3my2cbbE89FAWFMLl6HziEqlREeSQ8MnaRDObRgG?=
 =?us-ascii?Q?cYJgS2pv0SIB2ynutpG3fnojjc4+6P5Ph3xCiy9BcnQi8IX6lUN4kHH5PTyp?=
 =?us-ascii?Q?h4bkXqLEqMfI4cG5I1NySNSIkmZZ7VvOb/2sbGNkth56/Dt9tZjc/6TxHty+?=
 =?us-ascii?Q?BywTFzQwJ8JdQXroIROfjvV9E7nk1nN/zMjjk8KWB25pdab3utHDNsiz2mpq?=
 =?us-ascii?Q?spJTqklURnO8CWwALQp9G6fpDo84M9tkJp5EfSI9Q7g5IiLj9RwG0ACuPwtV?=
 =?us-ascii?Q?uwn24crDxdIVliRQO4PX5WbzQ/4W4QVBg2aC90yd4SYZ9y8rUu+GvxUyeHaZ?=
 =?us-ascii?Q?vnlovbqZ8LrCgQLQIByiIRNcm4p3Bak3Uf5YNTUXTdSQ5iLGGOnu7zeBPLHl?=
 =?us-ascii?Q?LcEVmIIFL4oE+vgHjyZdYnkE3ZrvdZV5qzAWKKEo+bDEn13HXDshaksHUh4+?=
 =?us-ascii?Q?9TZyOcIx4t9QONG+V/fvmzZsOHlpm8s6vt5P3IZCD/fssCJ0FXiiewuql3L8?=
 =?us-ascii?Q?rG07XAV8WMUPZqJk9H7wtMZG7CBFPnTDYzGp5GWWesAxjmNLude9qNPBceds?=
 =?us-ascii?Q?k7aTkupFgyLJlSPBp09KpHBW98LcerWhIudl9ys53x/Pu8y/CDlTAYAKOCf5?=
 =?us-ascii?Q?jYa4d6QYFM4TcAl6peE7lY1SwE0ia+YWJmYAmplELO3ntJ+wmmtvEOztd7pU?=
 =?us-ascii?Q?ips+b6P+NgBSI47q6FsqJ0rRHcJbpV90k8iCFzJQD6Y+y+/ObsHFjH2ce8Is?=
 =?us-ascii?Q?mQrvfigT8OAVA4yC2UebVV8+FH7Eo3cBx6CubDLwdQNUsI9lPIfeXV9kUDGu?=
 =?us-ascii?Q?ZTIrK0hotHfOnJJMWU5Koz+GkPhYaLC7T5h5YtWkQsvOdoeRUvWozVVtrqak?=
 =?us-ascii?Q?JLn2x34rA7DsGmMXu1OPofibzgySD9V6jmUrd2YVXF1z0nHgfm16QxT4alHs?=
 =?us-ascii?Q?33ARcKuu6GsNOK/CD0IdjyLHpDLYvPmYurSGlx5YCJAj16kAqhszBP1mVzqq?=
 =?us-ascii?Q?HSvBcwH3Iu9ipeXzeqsou+IPkHKi55QzFYlg+IgAGKCqKIq9f91UIBwAqg4Z?=
 =?us-ascii?Q?J+TGx34plmbIjFzFvmyDi31uoHiAx/mz3IU0rb/OhW4RPVZqFztqebCzu2d/?=
 =?us-ascii?Q?VGuJq7YHBToqK7X3T7Xw3I4zHuUbV9Z+cXYSCfMaYf8n4ZK8YTqpdUYiSoof?=
 =?us-ascii?Q?7iuhCPZaCW+IQJL1WE6qjL58ti1mn9DRFOo49nzebXj9ZrgE/6NV5swkVR5M?=
 =?us-ascii?Q?zwHe7ZG2uetEm/iucMF++ESqn5i24QzyO7/PBjmnFZ8ekgT6ysOheETdXEcv?=
 =?us-ascii?Q?b314t33n6VYVYAOJCH+C4MhPjNXtDkHIlf2YDVLSQW8dmnvgtJCK7VG7hlma?=
 =?us-ascii?Q?UdRg0UIb2WBDKrVnF3PcDhygPwVSRbhQCv8P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B7QwcCX6nWEoc9LkkiZG10E3zXPMfzGbTSHarc1uNcHb/Mhgd6X3UzzdJUi2?=
 =?us-ascii?Q?dfYlOUtvmy8rSLNy72193IruXtuClUqroRORJf+eZG8OPxYzG7H7G++aRlxD?=
 =?us-ascii?Q?KbVYPn7X1vr6jl4/8KbrieenkzreNlDIEbHCN+vFbY470At1yKWCZ0qbOnol?=
 =?us-ascii?Q?Hhs73LjRtrGsVP+wtkY/R0nrMsIAWKCiDpb2Y7mHA8y6GxKfXILb40YSkI7J?=
 =?us-ascii?Q?LaDKp8N5z5ctguvQh9onLs0nYk1hzJ+rdl8lIz/LNRB3pAMkkbkrNKlmBo/o?=
 =?us-ascii?Q?xcIMAOWxk42v8rPo9reKVQNeyOgGIa27mqIwCiKhIhkMhDl8pi8nCBgyLKBj?=
 =?us-ascii?Q?bmInoLXFBxeoGrNusFK/FLGemXKa9RIEb+Vl2rwShJWEs6RBBKf8eQbrBzsF?=
 =?us-ascii?Q?UYGeweh+2DucoHJkRSQsGllAjschyz5rg9HpTbb0kRXP78H6BqR/tq9tnwb2?=
 =?us-ascii?Q?7XfxNf3XHqNh4vazIv4gBvimqDfo26dcfHmBFLP2wcGwDOTtrA6PasMlHrIz?=
 =?us-ascii?Q?qXeHd1VveRe7g5EZAYBJm8LFjqcdPg/ksAgWkUj/XyQzDYUa4PT0kG5LVVOy?=
 =?us-ascii?Q?wn9vGwA2xubYOY8RAW2CE49mZi6bkYPLiApLXd9tiEA4d9ckEEhIX/65FNdT?=
 =?us-ascii?Q?2nxp5eRigjas9DeXc5C9s1uPRneFO8I1iE2LK7EgFdXQa1BwwcmI/Fi4Wf26?=
 =?us-ascii?Q?oIi85kTjcjre0Srr/y2jjsZHl+vGMmHml39+64OuBWtJJ6vfxpfeu4XtKNqU?=
 =?us-ascii?Q?tZxNLNPWVqIOZ7Kg8qeqZosjtG/vQso/G/3sRJitqrRuchb7ZfEErnLJ0v/n?=
 =?us-ascii?Q?gXCAFLXZevXm6PO2Dcwlu6VK/NNjyA8N8jtUx7TxuATYaeDqSPV6C7+dddy+?=
 =?us-ascii?Q?2Xm8fV6QnFV6tjt10saqdLMplu0pO+LpodA+o46EJNS+3ZXq0hEhqSIfFPvN?=
 =?us-ascii?Q?yCbtqdOX3DL6L6PxHmwORHrZMJQJBGlr/StqTwwNPTrs+bO9khw5TfrWazku?=
 =?us-ascii?Q?HxnDpS43fFBC5BQ1InmmyfVISYgrFL/FariB/B39aicWFXD0pvONszi95oM4?=
 =?us-ascii?Q?qwqMj3XN8JI62ZllUpi/H+YUw95k1vESNhbCP0LT24v/ik4xcrzz2saQBj9n?=
 =?us-ascii?Q?eDUrTK7/8qprm2rduuAHddGBxpKMDnCzMoN3BPKtxcHfRWHMk4AfECePGy6w?=
 =?us-ascii?Q?zpp9VDWkij9R3zTUZpSndOFOer0LsWHs9luGcTn9rYV17u1komuDJVjmZ8sK?=
 =?us-ascii?Q?DEHxFfMndopyEmBS3wNIiIhZVTU0MNsnFbhPKE3PwR5PHw0xY48Wg5FGqs7T?=
 =?us-ascii?Q?jZKAaraSzzPzy/cwMsoVXCF9DxwA0r/qpqIVWzmJs2t4GBOgvSrkq/0/8Vrh?=
 =?us-ascii?Q?r/dfURahR73uMGgIyYDu3QG8kx+lB41XnLsRHEtMVbb2tj2e7E8quHi5Cypd?=
 =?us-ascii?Q?LbgvWZDOArHN4aMorQkcQ973cXWCDV00FHJ1EJHWgCwNyr0h9nDij6ZrDMbN?=
 =?us-ascii?Q?QHwCuO83FAa3WLyPE3Jl9C6NMtAkHNZUWja73NYLa2g9EujoyxWNB4tvqPMQ?=
 =?us-ascii?Q?4QHinA9yMd+kaIxmtMK8eDWwFGxY5f4Ewsf1g18oy/TPdn7973z8PI6n5D0m?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b970d3-caba-4e8a-f16f-08de113f3e29
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:25.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mH09rRSlBekx7US+H64cNx3gsQGkG46VKmulwG+S4oVgHbK4gwo9qsgBxuN+xfva8o2XMyGDxWse2bN7PPn6SnmYW+PTWIa5uvBnh+akOYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2918

Add v4l2 m2m stateful driver support for the
Chips&Media Wave6 video codec IP, including both encoder and decoder.

The following features and formats are supported:
Encoder (8bit only):
- Supported codecs: AVC, HEVC
- Supported input formats:
  * V4L2_PIX_FMT_YUV420/NV12/NV21
  * V4L2_PIX_FMT_YUV422P/NV16/NV61
  * V4L2_PIX_FMT_YUYV
  * V4L2_PIX_FMT_YUV24/NV24/NV42
  * V4L2_PIX_FMT_RGB24
  * V4L2_PIX_FMT_P010
  * V4L2_PIX_FMT_ARGB32
  * V4L2_PIX_FMT_RGBA32
  * V4L2_PIX_FMT_XRGB32
  * V4L2_PIX_FMT_ARGB2101010
- Supports multiplanar format
- Although 10-bit input formats are supported (e.g., P010, ARGB2101010),
  encoded output is limited to 8-bit streams
- Supports crop
- Supports extensive v4l2 encoder control

Decoder (8bit only):
- Supported codecs: AVC, HEVC (8bit only)
- Supported output formats: V4L2_PIX_FMT_YUV420/NV12/NV21
- Supports multiplanar format
- Supports scale down
- Supports dynamic resolution change

Note: While other versions of the Wave6 IP may support VP9 decoding and
AV1 decoding and encoding those formats are not implemented or validated
in this driver at this time.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-dec.c         | 1869 ++++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2693 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  507 ++++
 3 files changed, 5069 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
new file mode 100644
index 000000000000..926c6dc11664
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
@@ -0,0 +1,1869 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 stateful decoder interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
+
+#define VPU_DEC_DEV_NAME "C&M Wave6 VPU decoder"
+#define VPU_DEC_DRV_NAME "wave6-dec"
+
+static const struct vpu_format wave6_vpu_dec_fmt_list[2][6] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 3,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+	}
+};
+
+static const struct vpu_format *wave6_find_vpu_fmt(unsigned int v4l2_pix_fmt,
+						   enum vpu_fmt_type type)
+{
+	unsigned int index;
+
+	for (index = 0; index < ARRAY_SIZE(wave6_vpu_dec_fmt_list[type]); index++) {
+		if (wave6_vpu_dec_fmt_list[type][index].v4l2_pix_fmt == v4l2_pix_fmt)
+			return &wave6_vpu_dec_fmt_list[type][index];
+	}
+
+	return NULL;
+}
+
+static const struct vpu_format *wave6_find_vpu_fmt_by_idx(unsigned int idx,
+							  enum vpu_fmt_type type)
+{
+	if (idx >= ARRAY_SIZE(wave6_vpu_dec_fmt_list[type]))
+		return NULL;
+
+	if (!wave6_vpu_dec_fmt_list[type][idx].v4l2_pix_fmt)
+		return NULL;
+
+	return &wave6_vpu_dec_fmt_list[type][idx];
+}
+
+static void wave6_vpu_dec_release_fb(struct vpu_instance *inst)
+{
+	int i;
+
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+	}
+}
+
+static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst)
+{
+	u32 fail_res = 0;
+	int ret;
+
+	wave6_vpu_remove_dbgfs_file(inst);
+
+	ret = wave6_vpu_dec_close(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
+			ret, fail_res);
+	}
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_del_init(&inst->list);
+	wave6_vpu_dec_release_fb(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
+
+	if (!pm_runtime_suspended(inst->dev->dev))
+		pm_runtime_put_sync(inst->dev->dev);
+}
+
+static void wave6_handle_bitstream_buffer(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	u32 src_size = 0;
+	int ret;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (src_buf) {
+		struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(src_buf);
+		dma_addr_t rd_ptr = wave6_get_dma_addr(src_buf, 0);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "%s: Already consumed buffer\n",
+				__func__);
+			return;
+		}
+
+		vpu_buf->ts_start = ktime_get_raw();
+		vpu_buf->consumed = true;
+		wave6_vpu_dec_set_rd_ptr(inst, rd_ptr, true);
+
+		src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+	}
+
+	if (!src_size) {
+		dma_addr_t rd = 0, wr = 0;
+
+		wave6_vpu_dec_get_bitstream_buffer(inst, &rd, &wr);
+		wave6_vpu_dec_set_rd_ptr(inst, wr, true);
+	}
+
+	trace_wave6_vpu_dec_pic(inst, src_buf ? src_buf->vb2_buf.index : -1, src_size);
+
+	ret = wave6_vpu_dec_update_bitstream_buffer(inst, src_size);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Update bitstream buffer fail %d\n",
+			__func__, ret);
+		return;
+	}
+}
+
+static void wave6_update_pix_fmt_cap(struct v4l2_pix_format_mplane *pix_mp,
+				     unsigned int width,
+				     unsigned int height,
+				     bool new_resolution)
+{
+	unsigned int aligned_width;
+
+	if (new_resolution)
+		pix_mp->plane_fmt[0].bytesperline = 0;
+
+	aligned_width = round_up(width, W6_DEC_BUF_ALIGNMENT);
+	wave6_update_pix_fmt(pix_mp, aligned_width, height);
+}
+
+static int wave6_allocate_aux_buffer(struct vpu_instance *inst,
+				     enum aux_buffer_type type,
+				     int num)
+{
+	struct aux_buffer buf[WAVE6_MAX_FBS];
+	struct aux_buffer_info buf_info;
+	struct dec_aux_buffer_size_info size_info;
+	unsigned int size;
+	int i, ret;
+
+	memset(buf, 0, sizeof(buf));
+
+	size_info.width = inst->src_fmt.width;
+	size_info.height = inst->src_fmt.height;
+	size_info.type = type;
+
+	ret = wave6_vpu_dec_get_aux_buffer_size(inst, size_info, &size);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Get size fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	num = min_t(u32, num, WAVE6_MAX_FBS);
+	for (i = 0; i < num; i++) {
+		inst->aux_vbuf[type][i].size = size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: Alloc fail (type %d)\n", __func__, type);
+			return ret;
+		}
+
+		buf[i].index = i;
+		buf[i].addr = inst->aux_vbuf[type][i].daddr;
+		buf[i].size = inst->aux_vbuf[type][i].size;
+	}
+
+	buf_info.type = type;
+	buf_info.num = num;
+	buf_info.buf_array = buf;
+
+	ret = wave6_vpu_dec_register_aux_buffer(inst, buf_info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Register fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void wave6_vpu_dec_handle_dst_buffer(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+	u32 fb_stride = inst->dst_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = fb_stride * inst->dst_fmt.height;
+	u32 chroma_size = (fb_stride / 2) * (inst->dst_fmt.height / 2);
+	struct frame_buffer disp_buffer = {0};
+	struct dec_seq_info *seq_info = &inst->codec_info->dec_info.seq_info;
+	int consumed_num = wave6_vpu_get_consumed_fb_num(inst);
+	int ret;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		dst_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(dst_buf);
+
+		if (vpu_buf->consumed)
+			continue;
+
+		if (consumed_num >= WAVE6_MAX_FBS)
+			break;
+
+		if (inst->dst_fmt.num_planes == 1) {
+			disp_buffer.buf_y = wave6_get_dma_addr(dst_buf, 0);
+			disp_buffer.buf_cb = disp_buffer.buf_y + luma_size;
+			disp_buffer.buf_cr = disp_buffer.buf_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes == 2) {
+			disp_buffer.buf_y = wave6_get_dma_addr(dst_buf, 0);
+			disp_buffer.buf_cb = wave6_get_dma_addr(dst_buf, 1);
+			disp_buffer.buf_cr = disp_buffer.buf_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes == 3) {
+			disp_buffer.buf_y = wave6_get_dma_addr(dst_buf, 0);
+			disp_buffer.buf_cb = wave6_get_dma_addr(dst_buf, 1);
+			disp_buffer.buf_cr = wave6_get_dma_addr(dst_buf, 2);
+		}
+		disp_buffer.width = inst->src_fmt.width;
+		disp_buffer.height = inst->src_fmt.height;
+		disp_buffer.stride = fb_stride;
+		disp_buffer.map_type = LINEAR_FRAME_MAP;
+		disp_buffer.luma_bit_depth = seq_info->luma_bit_depth;
+		disp_buffer.chroma_bit_depth = seq_info->chroma_bit_depth;
+		disp_buffer.c_fmt_idc = seq_info->c_fmt_idc;
+
+		ret = wave6_vpu_dec_register_display_buffer_ex(inst, disp_buffer);
+		if (ret) {
+			dev_err(inst->dev->dev, "fail register display buffer %d", ret);
+			break;
+		}
+
+		vpu_buf->consumed = true;
+		consumed_num++;
+	}
+
+	if (!inst->fbc_buf_registered) {
+		unsigned int fb_num = seq_info->min_frame_buffer_count;
+		unsigned int fb_stride = ALIGN(inst->src_fmt.width, W6_FBC_BUF_ALIGNMENT);
+		unsigned int fb_height = ALIGN(inst->src_fmt.height, W6_FBC_BUF_ALIGNMENT);
+
+		ret = wave6_vpu_dec_register_frame_buffer_ex(inst, fb_num, fb_stride,
+							     fb_height, COMPRESSED_FRAME_MAP);
+		if (ret)
+			dev_err(inst->dev->dev, "register frame buffer fail %d\n", ret);
+		else
+			inst->fbc_buf_registered = fb_num;
+	}
+}
+
+static enum v4l2_quantization to_v4l2_quantization(u32 video_full_range_flag)
+{
+	switch (video_full_range_flag) {
+	case 0:
+		return V4L2_QUANTIZATION_LIM_RANGE;
+	case 1:
+		return V4L2_QUANTIZATION_FULL_RANGE;
+	default:
+		return V4L2_QUANTIZATION_DEFAULT;
+	}
+}
+
+static enum v4l2_colorspace to_v4l2_colorspace(u32 colour_primaries)
+{
+	switch (colour_primaries) {
+	case 1:
+		return V4L2_COLORSPACE_REC709;
+	case 4:
+		return V4L2_COLORSPACE_470_SYSTEM_M;
+	case 5:
+		return V4L2_COLORSPACE_470_SYSTEM_BG;
+	case 6:
+		return V4L2_COLORSPACE_SMPTE170M;
+	case 7:
+		return V4L2_COLORSPACE_SMPTE240M;
+	case 9:
+		return V4L2_COLORSPACE_BT2020;
+	case 11:
+		return V4L2_COLORSPACE_DCI_P3;
+	default:
+		return V4L2_COLORSPACE_DEFAULT;
+	}
+}
+
+static enum v4l2_xfer_func to_v4l2_xfer_func(u32 transfer_characteristics)
+{
+	switch (transfer_characteristics) {
+	case 1:
+		return V4L2_XFER_FUNC_709;
+	case 6:
+		return V4L2_XFER_FUNC_709;
+	case 7:
+		return V4L2_XFER_FUNC_SMPTE240M;
+	case 8:
+		return V4L2_XFER_FUNC_NONE;
+	case 13:
+		return V4L2_XFER_FUNC_SRGB;
+	case 14:
+		return V4L2_XFER_FUNC_709;
+	case 16:
+		return V4L2_XFER_FUNC_SMPTE2084;
+	default:
+		return V4L2_XFER_FUNC_DEFAULT;
+	}
+}
+
+static enum v4l2_ycbcr_encoding to_v4l2_ycbcr_encoding(u32 matrix_coeffs)
+{
+	switch (matrix_coeffs) {
+	case 1:
+		return V4L2_YCBCR_ENC_709;
+	case 5:
+		return V4L2_YCBCR_ENC_601;
+	case 6:
+		return V4L2_YCBCR_ENC_601;
+	case 7:
+		return V4L2_YCBCR_ENC_SMPTE240M;
+	case 9:
+		return V4L2_YCBCR_ENC_BT2020;
+	case 10:
+		return V4L2_YCBCR_ENC_BT2020_CONST_LUM;
+	default:
+		return V4L2_YCBCR_ENC_DEFAULT;
+	}
+}
+
+static void wave6_update_color_info(struct vpu_instance *inst,
+				    struct dec_seq_info *seq_info)
+{
+	struct color_param *color = &seq_info->color;
+
+	if (!color->video_signal_type_present)
+		goto set_default_all;
+
+	inst->quantization = to_v4l2_quantization(color->color_range);
+
+	if (!color->color_description_present)
+		goto set_default_color;
+
+	inst->colorspace = to_v4l2_colorspace(color->color_primaries);
+	inst->xfer_func = to_v4l2_xfer_func(color->transfer_characteristics);
+	inst->ycbcr_enc = to_v4l2_ycbcr_encoding(color->matrix_coefficients);
+
+	return;
+
+set_default_all:
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+set_default_color:
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static enum v4l2_mpeg_video_hevc_profile to_v4l2_hevc_profile(u32 profile)
+{
+	switch (profile) {
+	case HEVC_PROFILE_MAIN:
+		return V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN;
+	case HEVC_PROFILE_STILLPICTURE:
+		return V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
+	default:
+		return V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN;
+	}
+}
+
+static enum v4l2_mpeg_video_h264_profile to_v4l2_h264_profile(u32 profile)
+{
+	switch (profile) {
+	case H264_PROFILE_BP:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	case H264_PROFILE_MP:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_MAIN;
+	case H264_PROFILE_EXTENDED:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED;
+	case H264_PROFILE_HP:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
+	default:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	}
+}
+
+static void wave6_update_v4l2_ctrls(struct vpu_instance *inst,
+				    struct dec_seq_info *info)
+{
+	struct v4l2_ctrl *ctrl;
+	u32 min_disp_cnt;
+
+	min_disp_cnt = info->frame_buf_delay + 1;
+	ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+			      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, min_disp_cnt);
+
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_HEVC) {
+		ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+				      V4L2_CID_MPEG_VIDEO_HEVC_PROFILE);
+		if (ctrl)
+			v4l2_ctrl_s_ctrl(ctrl, to_v4l2_hevc_profile(info->profile));
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_H264) {
+		ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+				      V4L2_CID_MPEG_VIDEO_H264_PROFILE);
+		if (ctrl)
+			v4l2_ctrl_s_ctrl(ctrl, to_v4l2_h264_profile(info->profile));
+	}
+}
+
+static int wave6_vpu_dec_start_decode(struct vpu_instance *inst)
+{
+	struct dec_param pic_param;
+	int ret;
+	u32 fail_res = 0;
+
+	memset(&pic_param, 0, sizeof(struct dec_param));
+
+	wave6_handle_bitstream_buffer(inst);
+	wave6_vpu_dec_handle_dst_buffer(inst);
+
+	ret = wave6_vpu_dec_start_one_frame(inst, &pic_param, &fail_res);
+	if (ret) {
+		struct vb2_v4l2_buffer *src_buf = NULL;
+
+		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
+
+		src_buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (src_buf) {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			inst->sequence++;
+			inst->processed_buf_num++;
+			inst->error_buf_num++;
+		}
+	}
+
+	return ret;
+}
+
+static void wave6_handle_decoded_frame(struct vpu_instance *inst,
+				       struct dec_output_info *info)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct vpu_buffer *vpu_buf;
+	enum vb2_buffer_state state;
+
+	state = info->decoding_success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (!src_buf) {
+		dev_err(inst->dev->dev, "[%d] decoder can't find src buffer\n", inst->id);
+		return;
+	}
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	if (!vpu_buf || !vpu_buf->consumed) {
+		dev_err(inst->dev->dev, "[%d] src buffer is not consumed\n", inst->id);
+		return;
+	}
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, info->frame_decoded_addr);
+	if (dst_buf) {
+		struct vpu_buffer *dst_vpu_buf = wave6_to_vpu_buf(dst_buf);
+
+		if (wave6_to_vpu_buf(dst_buf)->used) {
+			dev_warn(inst->dev->dev, "[%d] duplication frame buffer\n", inst->id);
+			inst->sequence++;
+		}
+		v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+		dst_vpu_buf->used = true;
+		if (state == VB2_BUF_STATE_ERROR)
+			dst_vpu_buf->error = true;
+		dst_vpu_buf->ts_input = vpu_buf->ts_input;
+		dst_vpu_buf->ts_start = vpu_buf->ts_start;
+		dst_vpu_buf->ts_finish = ktime_get_raw();
+		dst_vpu_buf->hw_time = wave6_vpu_cycle_to_ns(inst->dev, info->cycle.frame_cycle);
+	}
+
+	v4l2_m2m_src_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, src_buf);
+	if (state == VB2_BUF_STATE_ERROR) {
+		dev_dbg(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->sequence);
+		inst->error_buf_num++;
+	}
+	v4l2_m2m_buf_done(src_buf, state);
+	inst->processed_buf_num++;
+}
+
+static void wave6_handle_skipped_frame(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vpu_buffer *vpu_buf;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (!src_buf)
+		return;
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	if (!vpu_buf || !vpu_buf->consumed)
+		return;
+
+	dev_dbg(inst->dev->dev, "[%d] skip frame %d\n", inst->id, inst->sequence);
+
+	inst->sequence++;
+	inst->processed_buf_num++;
+	inst->error_buf_num++;
+	v4l2_m2m_src_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, src_buf);
+	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+}
+
+static void wave6_handle_display_frame(struct vpu_instance *inst,
+				       dma_addr_t addr, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+	struct vpu_buffer *vpu_buf;
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, addr);
+	if (!dst_buf)
+		return;
+
+	vpu_buf = wave6_to_vpu_buf(dst_buf);
+	if (!vpu_buf->used) {
+		dev_dbg(inst->dev->dev, "[%d] recycle display buffer\n", inst->id);
+		vpu_buf->consumed = false;
+		return;
+	}
+
+	if (inst->dst_fmt.num_planes == 1) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+				      inst->dst_fmt.plane_fmt[0].sizeimage);
+	} else if (inst->dst_fmt.num_planes == 2) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+				      inst->dst_fmt.plane_fmt[0].sizeimage);
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 1,
+				      inst->dst_fmt.plane_fmt[1].sizeimage);
+	} else if (inst->dst_fmt.num_planes == 3) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+				      inst->dst_fmt.plane_fmt[0].sizeimage);
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 1,
+				      inst->dst_fmt.plane_fmt[1].sizeimage);
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 2,
+				      inst->dst_fmt.plane_fmt[2].sizeimage);
+	}
+
+	vpu_buf->ts_output = ktime_get_raw();
+	wave6_vpu_handle_performance(inst, vpu_buf);
+
+	if (vpu_buf->error)
+		state = VB2_BUF_STATE_ERROR;
+	dst_buf->sequence = inst->sequence++;
+	dst_buf->field = V4L2_FIELD_NONE;
+	if (state == VB2_BUF_STATE_ERROR)
+		dev_dbg(inst->dev->dev, "[%d] discard frame %d\n", inst->id, dst_buf->sequence);
+	v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+	v4l2_m2m_buf_done(dst_buf, state);
+}
+
+static void wave6_handle_display_frames(struct vpu_instance *inst,
+					struct dec_output_info *info)
+{
+	int i;
+
+	for (i = 0; i < info->disp_frame_num; i++)
+		wave6_handle_display_frame(inst,
+					   info->disp_frame_addr[i],
+					   VB2_BUF_STATE_DONE);
+}
+
+static void wave6_handle_discard_frames(struct vpu_instance *inst,
+					struct dec_output_info *info)
+{
+	int i;
+
+	for (i = 0; i < info->release_disp_frame_num; i++)
+		wave6_handle_display_frame(inst,
+					   info->release_disp_frame_addr[i],
+					   VB2_BUF_STATE_ERROR);
+}
+
+static void wave6_handle_last_frame(struct vpu_instance *inst,
+				    struct vb2_v4l2_buffer *dst_buf)
+{
+	if (!dst_buf) {
+		dst_buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (!dst_buf) {
+			inst->next_buf_last = true;
+			return;
+		}
+	}
+
+	if (inst->dst_fmt.num_planes == 1) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+	} else if (inst->dst_fmt.num_planes == 2) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
+	} else if (inst->dst_fmt.num_planes == 3) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 2, 0);
+	}
+
+	dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+	dst_buf->field = V4L2_FIELD_NONE;
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+
+	if (inst->state != VPU_INST_STATE_INIT_SEQ) {
+		dev_dbg(inst->dev->dev, "[%d] eos\n", inst->id);
+		inst->eos = true;
+		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
+	}
+}
+
+static void wave6_vpu_dec_retry_one_frame(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vpu_buffer *vpu_buf;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (!src_buf)
+		return;
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	vpu_buf->consumed = false;
+}
+
+static void wave6_vpu_dec_handle_source_change(struct vpu_instance *inst)
+{
+	static const struct v4l2_event vpu_event_src_ch = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+	struct dec_seq_info *info = &inst->codec_info->dec_info.seq_info;
+
+	dev_dbg(inst->dev->dev, "pic size %dx%d profile %d, min_fb_cnt : %d | min_disp_cnt : %d\n",
+		info->pic_width, info->pic_height,
+		info->profile, info->min_frame_buffer_count, info->frame_buf_delay);
+
+	wave6_vpu_dec_retry_one_frame(inst);
+	wave6_vpu_dec_reset_frame_buffer_info(inst);
+	inst->fbc_buf_registered = 0;
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
+
+	inst->crop.left = info->pic_crop_rect.left;
+	inst->crop.top = info->pic_crop_rect.top;
+	inst->crop.width = info->pic_crop_rect.right - inst->crop.left;
+	inst->crop.height = info->pic_crop_rect.bottom - inst->crop.top;
+
+	wave6_update_v4l2_ctrls(inst, info);
+	wave6_update_color_info(inst, info);
+	wave6_update_pix_fmt(&inst->src_fmt, info->pic_width, info->pic_height);
+	wave6_update_pix_fmt_cap(&inst->dst_fmt,
+				 info->pic_width, info->pic_height,
+				 true);
+
+	trace_wave6_vpu_source_change(inst, info);
+
+	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_src_ch);
+}
+
+static void wave6_vpu_dec_handle_decoding_warn_error(struct vpu_instance *inst,
+						     struct dec_output_info *info)
+{
+	if (info->warn_info)
+		dev_dbg(inst->dev->dev, "[%d] decoding %d warning 0x%x\n",
+			inst->id, inst->processed_buf_num, info->warn_info);
+
+	if (info->error_reason)
+		dev_err(inst->dev->dev, "[%d] decoding %d error 0x%x\n",
+			inst->id, inst->processed_buf_num, info->error_reason);
+}
+
+static void wave6_vpu_dec_finish_decode(struct vpu_instance *inst, bool error)
+{
+	struct dec_output_info info;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	int ret;
+
+	memset(&info, 0, sizeof(info));
+
+	ret = wave6_vpu_dec_get_output_info(inst, &info);
+	if (ret)
+		goto finish_decode;
+
+	trace_wave6_vpu_dec_done(inst, &info);
+
+	dev_dbg(inst->dev->dev, "dec %d dis %d noti_flag %d stream_end %d\n",
+		info.frame_decoded, info.frame_display,
+		info.notification_flags, info.stream_end);
+
+	if (info.notification_flags & DEC_NOTI_FLAG_NO_FB) {
+		wave6_vpu_dec_retry_one_frame(inst);
+		goto finish_decode;
+	}
+
+	if (info.notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE) {
+		v4l2_m2m_mark_stopped(m2m_ctx);
+
+		if (info.frame_display)
+			wave6_handle_display_frames(inst, &info);
+
+		if (info.release_disp_frame_num)
+			wave6_handle_discard_frames(inst, &info);
+
+		wave6_vpu_dec_handle_source_change(inst);
+
+		wave6_handle_last_frame(inst, NULL);
+
+		goto finish_decode;
+	}
+
+	wave6_vpu_dec_handle_decoding_warn_error(inst, &info);
+
+	if (info.frame_decoded)
+		wave6_handle_decoded_frame(inst, &info);
+	else
+		wave6_handle_skipped_frame(inst);
+
+	if (info.frame_display)
+		wave6_handle_display_frames(inst, &info);
+
+	if (info.release_disp_frame_num)
+		wave6_handle_discard_frames(inst, &info);
+
+	if (info.stream_end && !inst->eos)
+		wave6_handle_last_frame(inst, NULL);
+
+finish_decode:
+	wave6_vpu_finish_job(inst);
+}
+
+static int wave6_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, VPU_DEC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VPU_DEC_DRV_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" VPU_DEC_DRV_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int wave6_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
+{
+	const struct vpu_format *vpu_fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_RAW);
+		if (!vpu_fmt)
+			return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = vpu_fmt->min_width;
+	fsize->stepwise.max_width = vpu_fmt->max_width;
+	fsize->stepwise.step_width = W6_DEC_PIC_SIZE_STEP;
+	fsize->stepwise.min_height = vpu_fmt->min_height;
+	fsize->stepwise.max_height = vpu_fmt->max_height;
+	fsize->stepwise.step_height = W6_DEC_PIC_SIZE_STEP;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_CAPTURE(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
+		pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+		pix_mp->num_planes = inst->dst_fmt.num_planes;
+	} else {
+		width = clamp(pix_mp->width,
+			      vpu_fmt->min_width,
+			      round_up(inst->src_fmt.width, W6_DEC_BUF_ALIGNMENT));
+		height = clamp(pix_mp->height,
+			       vpu_fmt->min_height, inst->src_fmt.height);
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	if (inst->state >= VPU_INST_STATE_INIT_SEQ) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
+	}
+
+	wave6_update_pix_fmt_cap(pix_mp, width, height, false);
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	ret = wave6_vpu_dec_try_fmt_cap(file, fh, f);
+	if (ret)
+		return ret;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	inst->dst_fmt.width = pix_mp->width;
+	inst->dst_fmt.height = pix_mp->height;
+	inst->dst_fmt.pixelformat = pix_mp->pixelformat;
+	inst->dst_fmt.field = pix_mp->field;
+	inst->dst_fmt.flags = pix_mp->flags;
+	inst->dst_fmt.num_planes = pix_mp->num_planes;
+	for (i = 0; i < inst->dst_fmt.num_planes; i++) {
+		inst->dst_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->dst_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	inst->cbcr_interleave = !!(vpu_fmt->flags & VPU_FMT_FLAG_CBCR_INTERLEAVED);
+	inst->nv21 = !!(vpu_fmt->flags & VPU_FMT_FLAG_CRCB_ORDER);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i;
+
+	pix_mp->width = inst->dst_fmt.width;
+	pix_mp->height = inst->dst_fmt.height;
+	pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+	pix_mp->field = inst->dst_fmt.field;
+	pix_mp->flags = inst->dst_fmt.flags;
+	pix_mp->num_planes = inst->dst_fmt.num_planes;
+	for (i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->dst_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->dst_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "%s: index %d\n", __func__, f->index);
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+	f->flags = V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
+		pix_mp->pixelformat = inst->src_fmt.pixelformat;
+		pix_mp->num_planes = inst->src_fmt.num_planes;
+	} else {
+		width = pix_mp->width;
+		height = pix_mp->height;
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	wave6_update_pix_fmt(pix_mp, width, height);
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane in_pix_mp = f->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	ret = wave6_vpu_dec_try_fmt_out(file, fh, f);
+	if (ret)
+		return ret;
+
+	pix_mp->colorspace = in_pix_mp.colorspace;
+	pix_mp->ycbcr_enc = in_pix_mp.ycbcr_enc;
+	pix_mp->quantization = in_pix_mp.quantization;
+	pix_mp->xfer_func = in_pix_mp.xfer_func;
+
+	inst->src_fmt.width = pix_mp->width;
+	inst->src_fmt.height = pix_mp->height;
+	inst->src_fmt.pixelformat = pix_mp->pixelformat;
+	inst->src_fmt.field = pix_mp->field;
+	inst->src_fmt.flags = pix_mp->flags;
+	inst->src_fmt.num_planes = pix_mp->num_planes;
+	for (i = 0; i < inst->src_fmt.num_planes; i++) {
+		inst->src_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->src_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	inst->colorspace = pix_mp->colorspace;
+	inst->ycbcr_enc = pix_mp->ycbcr_enc;
+	inst->quantization = pix_mp->quantization;
+	inst->xfer_func = pix_mp->xfer_func;
+
+	wave6_update_pix_fmt_cap(&inst->dst_fmt,
+				 pix_mp->width, pix_mp->height,
+				 true);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i;
+
+	pix_mp->width = inst->src_fmt.width;
+	pix_mp->height = inst->src_fmt.height;
+	pix_mp->pixelformat = inst->src_fmt.pixelformat;
+	pix_mp->field = inst->src_fmt.field;
+	pix_mp->flags = inst->src_fmt.flags;
+	pix_mp->num_planes = inst->src_fmt.num_planes;
+	for (i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->src_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->src_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+
+	dev_dbg(inst->dev->dev, "%s: type %d target %d\n",
+		__func__, s->type, s->target);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->dst_fmt.width;
+		s->r.height = inst->dst_fmt.height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.left = 0;
+		s->r.top = 0;
+		if (inst->scaler_info.enable) {
+			s->r.width = inst->scaler_info.width;
+			s->r.height = inst->scaler_info.height;
+		} else if (inst->crop.width && inst->crop.height) {
+			s->r = inst->crop;
+		} else {
+			s->r.width = inst->src_fmt.width;
+			s->r.height = inst->src_fmt.height;
+		}
+		break;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->src_fmt.width;
+		s->r.height = inst->src_fmt.height;
+		if (inst->crop.width && inst->crop.height)
+			s->r = inst->crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dec_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	int step = 4;
+	int scale_width, scale_height;
+	int min_scale_width, min_scale_height;
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	if (s->target != V4L2_SEL_TGT_COMPOSE)
+		return -EINVAL;
+
+	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
+		s->flags |= V4L2_SEL_FLAG_LE;
+
+	scale_width = clamp(s->r.width, W6_MIN_DEC_PIC_WIDTH,
+			    round_up(inst->src_fmt.width, W6_DEC_BUF_ALIGNMENT));
+	scale_height = clamp(s->r.height, W6_MIN_DEC_PIC_HEIGHT,
+			     inst->src_fmt.height);
+	if (s->flags & V4L2_SEL_FLAG_GE) {
+		scale_width = round_up(scale_width, step);
+		scale_height = round_up(scale_height, step);
+	}
+	if (s->flags & V4L2_SEL_FLAG_LE) {
+		scale_width = round_down(scale_width, step);
+		scale_height = round_down(scale_height, step);
+	}
+
+	if (scale_width < inst->src_fmt.width ||
+	    scale_height < inst->src_fmt.height)
+		inst->scaler_info.enable = true;
+
+	if (inst->scaler_info.enable) {
+		min_scale_width = ALIGN((inst->src_fmt.width / 8), step);
+		min_scale_height = ALIGN((inst->src_fmt.height / 8), step);
+
+		if (scale_width < W6_MIN_DEC_PIC_WIDTH)
+			scale_width = W6_MIN_DEC_PIC_WIDTH;
+		if (scale_width < min_scale_width)
+			scale_width = min_scale_width;
+		if (scale_height < W6_MIN_DEC_PIC_HEIGHT)
+			scale_height = W6_MIN_DEC_PIC_HEIGHT;
+		if (scale_height < min_scale_height)
+			scale_height = min_scale_height;
+
+		inst->scaler_info.width = scale_width;
+		inst->scaler_info.height = scale_height;
+	}
+
+	s->r.left = 0;
+	s->r.top = 0;
+	s->r.width = scale_width;
+	s->r.height = scale_height;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dc)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: cmd %d\n", __func__, dc->cmd);
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
+	if (ret)
+		return ret;
+
+	switch (dc->cmd) {
+	case V4L2_DEC_CMD_STOP:
+		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, true);
+		v4l2_m2m_try_schedule(inst->v4l2_fh.m2m_ctx);
+		break;
+	case V4L2_DEC_CMD_START:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops wave6_vpu_dec_ioctl_ops = {
+	.vidioc_querycap = wave6_vpu_dec_querycap,
+	.vidioc_enum_framesizes = wave6_vpu_dec_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap = wave6_vpu_dec_enum_fmt_cap,
+	.vidioc_s_fmt_vid_cap_mplane = wave6_vpu_dec_s_fmt_cap,
+	.vidioc_g_fmt_vid_cap_mplane = wave6_vpu_dec_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap_mplane = wave6_vpu_dec_try_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out = wave6_vpu_dec_enum_fmt_out,
+	.vidioc_s_fmt_vid_out_mplane = wave6_vpu_dec_s_fmt_out,
+	.vidioc_g_fmt_vid_out_mplane = wave6_vpu_dec_g_fmt_out,
+	.vidioc_try_fmt_vid_out_mplane = wave6_vpu_dec_try_fmt_out,
+
+	.vidioc_g_selection = wave6_vpu_dec_g_selection,
+	.vidioc_s_selection = wave6_vpu_dec_s_selection,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd = wave6_vpu_dec_decoder_cmd,
+
+	.vidioc_subscribe_event = wave6_vpu_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int wave6_vpu_dec_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst = wave6_ctrl_to_vpu_inst(ctrl);
+
+	trace_wave6_vpu_s_ctrl(inst, ctrl);
+
+	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
+		__func__, ctrl->name, ctrl->val);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
+		inst->disp_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops wave6_vpu_dec_ctrl_ops = {
+	.s_ctrl = wave6_vpu_dec_s_ctrl,
+};
+
+static void wave6_set_dec_openparam(struct dec_open_param *open_param,
+				    struct vpu_instance *inst)
+{
+	open_param->inst_buffer.temp_base = inst->dev->temp_vbuf.daddr;
+	open_param->inst_buffer.temp_size = inst->dev->temp_vbuf.size;
+	open_param->disp_mode = inst->disp_mode;
+}
+
+static int wave6_vpu_dec_create_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct dec_open_param open_param;
+
+	memset(&open_param, 0, sizeof(struct dec_open_param));
+
+	wave6_vpu_record_performance_timestamps(inst);
+
+	wave6_vpu_core_activate(inst->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret) {
+		dev_err(inst->dev->dev, "runtime_resume failed %d\n", ret);
+		return ret;
+	}
+
+	inst->std = wave6_to_codec_std(inst->type, inst->src_fmt.pixelformat);
+	if (inst->std == STD_UNKNOWN) {
+		dev_err(inst->dev->dev, "unsupported pixelformat: %.4s\n",
+			(char *)&inst->src_fmt.pixelformat);
+		ret = -EINVAL;
+		goto error_pm;
+	}
+
+	wave6_set_dec_openparam(&open_param, inst);
+
+	ret = wave6_vpu_dec_open(inst, &open_param);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed create instance : %d\n", ret);
+		goto error_pm;
+	}
+
+	dev_dbg(inst->dev->dev, "[%d] decoder\n", inst->id);
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_add_tail(&inst->list, &inst->dev->instances);
+	wave6_vpu_create_dbgfs_file(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
+
+	return 0;
+
+error_pm:
+	pm_runtime_put_sync(inst->dev->dev);
+
+	return ret;
+}
+
+static int wave6_vpu_dec_prepare_fb(struct vpu_instance *inst)
+{
+	int ret;
+	unsigned int i;
+	unsigned int fb_num;
+	unsigned int mv_num;
+	unsigned int fb_stride;
+	unsigned int fb_height;
+	unsigned int luma_size;
+	unsigned int chroma_size;
+	struct dec_seq_info *seq_info = &inst->codec_info->dec_info.seq_info;
+
+	fb_num = seq_info->min_frame_buffer_count;
+	mv_num = seq_info->req_mv_buffer_count;
+
+	fb_stride = ALIGN(inst->src_fmt.width, W6_FBC_BUF_ALIGNMENT);
+	fb_height = ALIGN(inst->src_fmt.height, W6_FBC_BUF_ALIGNMENT);
+
+	luma_size = fb_stride * fb_height;
+	chroma_size = ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT) * fb_height;
+
+	for (i = 0; i < fb_num; i++) {
+		struct frame_buffer *frame = &inst->frame_buf[i];
+		struct vpu_buf *vframe = &inst->frame_vbuf[i];
+
+		vframe->size = luma_size + chroma_size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, vframe);
+		if (ret) {
+			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
+				vframe->size);
+			goto error;
+		}
+
+		frame->buf_y = vframe->daddr;
+		frame->buf_cb = vframe->daddr + luma_size;
+		frame->buf_cr = (dma_addr_t)-1;
+		frame->width = inst->src_fmt.width;
+		frame->stride = fb_stride;
+		frame->height = fb_height;
+		frame->map_type = COMPRESSED_FRAME_MAP;
+	}
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_Y_TBL, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_C_TBL, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_MV_COL, mv_num);
+	if (ret)
+		goto error;
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	wave6_vpu_record_performance_timestamps(inst);
+
+	return 0;
+
+error:
+	wave6_vpu_dec_release_fb(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				     unsigned int *num_planes, unsigned int sizes[],
+				     struct device *alloc_devs[])
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane inst_format =
+		(V4L2_TYPE_IS_OUTPUT(q->type)) ? inst->src_fmt : inst->dst_fmt;
+	unsigned int i;
+
+	dev_dbg(inst->dev->dev, "%s: num_buffers %d num_planes %d type %d\n",
+		__func__, *num_buffers, *num_planes, q->type);
+
+	if (*num_planes) {
+		if (inst_format.num_planes != *num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < *num_planes; i++) {
+			if (sizes[i] < inst_format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = inst_format.num_planes;
+		for (i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "size[%d] : %d\n", i, sizes[i]);
+		}
+
+		if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+			struct v4l2_ctrl *ctrl;
+			unsigned int min_disp_cnt = 0;
+
+			ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+					      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+			if (ctrl)
+				min_disp_cnt = v4l2_ctrl_g_ctrl(ctrl);
+
+			*num_buffers = max(*num_buffers, min_disp_cnt);
+
+			if (*num_buffers > WAVE6_MAX_FBS)
+				*num_buffers = min_disp_cnt;
+		}
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type) && inst->state == VPU_INST_STATE_SEEK)
+		wave6_vpu_dec_destroy_instance(inst);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_seek_header(struct vpu_instance *inst)
+{
+	struct dec_seq_info seq_info;
+	int ret;
+
+	memset(&seq_info, 0, sizeof(struct dec_seq_info));
+
+	ret = wave6_vpu_dec_issue_seq_init(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed wave6_vpu_dec_issue_seq_init %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to call vpu_wait_interrupt()\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_dec_complete_seq_init(inst, &seq_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "vpu_dec_complete_seq_init: %d, reason : 0x%x\n",
+			ret, seq_info.err_reason);
+		if ((seq_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT) ||
+		    (seq_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT_PROFILE)) {
+			ret = -EINVAL;
+		} else if ((seq_info.err_reason & HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND) ||
+			   (seq_info.err_reason & AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND)) {
+			wave6_handle_skipped_frame(inst);
+			ret = 0;
+		}
+	} else {
+		wave6_vpu_dec_handle_source_change(inst);
+		inst->v4l2_fh.m2m_ctx->ignore_cap_streaming = false;
+		v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, false);
+		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx)))
+			wave6_handle_last_frame(inst, NULL);
+	}
+
+	return ret;
+}
+
+static int wave6_vpu_dec_prepare_decode(struct vpu_instance *inst)
+{
+	int ret = 0;
+
+	wave6_handle_bitstream_buffer(inst);
+	if (inst->state == VPU_INST_STATE_OPEN) {
+		ret = wave6_vpu_dec_seek_header(inst);
+		if (ret) {
+			vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+			vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+		}
+	}
+
+	return ret;
+}
+
+static void wave6_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	vbuf->sequence = inst->queued_src_buf_num++;
+	vpu_buf->ts_input = ktime_get_raw();
+
+	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+}
+
+static void wave6_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	inst->queued_dst_buf_num++;
+	if (inst->next_buf_last) {
+		wave6_handle_last_frame(inst, vbuf);
+		inst->next_buf_last = false;
+	} else {
+		v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+	}
+}
+
+static void wave6_vpu_dec_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+
+	vpu_buf->consumed = false;
+	vpu_buf->used = false;
+	vpu_buf->error = false;
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		wave6_vpu_dec_buf_queue_src(vb);
+	else
+		wave6_vpu_dec_buf_queue_dst(vb);
+}
+
+static int wave6_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane *fmt;
+	int ret = 0;
+
+	trace_wave6_vpu_start_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		fmt = &inst->src_fmt;
+		if (inst->state == VPU_INST_STATE_NONE) {
+			ret = wave6_vpu_dec_create_instance(inst);
+			if (!ret) {
+				inst->v4l2_fh.m2m_ctx->ignore_cap_streaming = true;
+				v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, true);
+			}
+		}
+		if (inst->state == VPU_INST_STATE_SEEK)
+			wave6_vpu_set_instance_state(inst, inst->state_in_seek);
+	} else {
+		fmt = &inst->dst_fmt;
+		if (inst->state == VPU_INST_STATE_INIT_SEQ) {
+			ret = wave6_vpu_dec_prepare_fb(inst);
+			if (ret)
+				goto exit;
+		}
+	}
+
+exit:
+	if (ret)
+		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
+
+	dev_dbg(inst->dev->dev, "[%d] %s %c%c%c%c %dx%d, %d buffers, ret = %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		fmt->pixelformat,
+		fmt->pixelformat >> 8,
+		fmt->pixelformat >> 16,
+		fmt->pixelformat >> 24,
+		fmt->width, fmt->height, vb2_get_num_buffers(q), ret);
+
+	return ret;
+}
+
+static void wave6_vpu_dec_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
+	trace_wave6_vpu_stop_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
+	dev_dbg(inst->dev->dev, "[%d] %s, input %d, decode %d error %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		inst->queued_src_buf_num, inst->processed_buf_num, inst->error_buf_num);
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		goto exit;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		wave6_vpu_reset_performance(inst);
+		inst->queued_src_buf_num = 0;
+		inst->processed_buf_num = 0;
+		inst->error_buf_num = 0;
+		inst->state_in_seek = inst->state;
+		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_SEEK);
+		inst->sequence = 0;
+	} else {
+		if (v4l2_m2m_has_stopped(m2m_ctx))
+			v4l2_m2m_clear_state(m2m_ctx);
+
+		inst->eos = false;
+		inst->queued_dst_buf_num = 0;
+		inst->sequence = 0;
+		wave6_vpu_dec_flush_instance(inst);
+	}
+
+exit:
+	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
+}
+
+static int wave6_vpu_dec_buf_init(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct dec_seq_info *seq_info;
+	int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		return 0;
+
+	seq_info = &inst->codec_info->dec_info.seq_info;
+	if (seq_info->c_fmt_idc != C_FMT_IDC_YUV400)
+		return 0;
+
+	for (i = 0; i < inst->dst_fmt.num_planes; i++) {
+		void *vaddr = vb2_plane_vaddr(vb, i);
+
+		if (vaddr)
+			memset(vaddr, 0x80, vb2_plane_size(vb, i));
+	}
+
+	return 0;
+}
+
+static const struct vb2_ops wave6_vpu_dec_vb2_ops = {
+	.queue_setup = wave6_vpu_dec_queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_queue = wave6_vpu_dec_buf_queue,
+	.start_streaming = wave6_vpu_dec_start_streaming,
+	.stop_streaming = wave6_vpu_dec_stop_streaming,
+	.buf_init = wave6_vpu_dec_buf_init,
+};
+
+static void wave6_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
+				     struct v4l2_pix_format_mplane *dst_fmt)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_CODEC);
+	if (vpu_fmt) {
+		src_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		src_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt(src_fmt,
+				     W6_DEF_DEC_PIC_WIDTH, W6_DEF_DEC_PIC_HEIGHT);
+	}
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_RAW);
+	if (vpu_fmt) {
+		dst_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		dst_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt_cap(dst_fmt,
+					 W6_DEF_DEC_PIC_WIDTH, W6_DEF_DEC_PIC_HEIGHT,
+					 true);
+	}
+}
+
+static int wave6_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct vpu_instance *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->ops = &wave6_vpu_dec_vb2_ops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	src_vq->drv_priv = inst;
+	src_vq->lock = &inst->dev->dev_lock;
+	src_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->ops = &wave6_vpu_dec_vb2_ops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	dst_vq->drv_priv = inst;
+	dst_vq->lock = &inst->dev->dev_lock;
+	dst_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct vpu_instance_ops wave6_vpu_dec_inst_ops = {
+	.prepare_process = wave6_vpu_dec_prepare_decode,
+	.start_process = wave6_vpu_dec_start_decode,
+	.finish_process = wave6_vpu_dec_finish_decode,
+};
+
+static int wave6_vpu_open_dec(struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+	struct vpu_core_device *core = video_drvdata(filp);
+	struct vpu_instance *inst = NULL;
+	int ret;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	init_completion(&inst->irq_done);
+	inst->dev = core;
+	inst->type = VPU_INST_TYPE_DEC;
+	inst->ops = &wave6_vpu_dec_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data = &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh, filp);
+
+	inst->v4l2_fh.m2m_ctx =
+		v4l2_m2m_ctx_init(core->m2m_dev, inst, wave6_vpu_dec_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret = PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(&inst->v4l2_ctrl_hdl, 10);
+	v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY,
+			  0, 0, 1, 0);
+	v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+			       0, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+	v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH, 0,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+
+	if (inst->v4l2_ctrl_hdl.error) {
+		ret = -ENODEV;
+		goto err_m2m_release;
+	}
+
+	inst->v4l2_fh.ctrl_handler = &inst->v4l2_ctrl_hdl;
+	v4l2_ctrl_handler_setup(&inst->v4l2_ctrl_hdl);
+
+	wave6_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	return 0;
+
+err_m2m_release:
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+free_inst:
+	kfree(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_dec_release(struct file *filp)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(filp);
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
+	if (inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_dec_destroy_instance(inst);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh, filp);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	kfree(inst);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations wave6_vpu_dec_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_open_dec,
+	.release = wave6_vpu_dec_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = v4l2_m2m_fop_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+int wave6_vpu_dec_register_device(struct vpu_core_device *core)
+{
+	struct video_device *vdev_dec;
+	int ret;
+
+	vdev_dec = devm_kzalloc(core->v4l2_dev.dev, sizeof(*vdev_dec), GFP_KERNEL);
+	if (!vdev_dec)
+		return -ENOMEM;
+
+	core->video_dev_dec = vdev_dec;
+
+	strscpy(vdev_dec->name, VPU_DEC_DEV_NAME, sizeof(vdev_dec->name));
+	vdev_dec->fops = &wave6_vpu_dec_fops;
+	vdev_dec->ioctl_ops = &wave6_vpu_dec_ioctl_ops;
+	vdev_dec->release = video_device_release_empty;
+	vdev_dec->v4l2_dev = &core->v4l2_dev;
+	vdev_dec->vfl_dir = VFL_DIR_M2M;
+	vdev_dec->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_dec->lock = &core->dev_lock;
+	video_set_drvdata(vdev_dec, core);
+
+	ret = video_register_device(vdev_dec, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core)
+{
+	video_unregister_device(core->video_dev_dec);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
new file mode 100644
index 000000000000..eafabd7b3171
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
@@ -0,0 +1,2693 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 stateful encoder interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/pm_runtime.h>
+#include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
+
+#define VPU_ENC_DEV_NAME "C&M Wave6 VPU encoder"
+#define VPU_ENC_DRV_NAME "wave6-enc"
+
+static const struct vpu_format wave6_vpu_enc_fmt_list[2][23] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUYV,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUYV,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUV444_24BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUV444_24BIT,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV42,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUV444_24BIT,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 3,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 3,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_P010,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420_P10_16BIT_MSB,
+			.endian = VDI_128BIT_LE_BYTE_SWAP,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_10BIT,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGB24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_24BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_RGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_ARGB32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_ARGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_XRGB32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_ARGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGBA32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_RGBA,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGBX32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_RGBA,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_ARGB2101010,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_P10_32BIT_PACKED,
+			.endian = VDI_128BIT_LE_WORD_BYTE_SWAP,
+			.csc_fmt_order = CSC_FMT_ORDER_ARGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB |
+				 VPU_FMT_FLAG_10BIT,
+		},
+	}
+};
+
+static const struct vpu_format *wave6_find_vpu_fmt(unsigned int v4l2_pix_fmt,
+						   enum vpu_fmt_type type)
+{
+	unsigned int index;
+
+	for (index = 0; index < ARRAY_SIZE(wave6_vpu_enc_fmt_list[type]); index++) {
+		if (wave6_vpu_enc_fmt_list[type][index].v4l2_pix_fmt == v4l2_pix_fmt)
+			return &wave6_vpu_enc_fmt_list[type][index];
+	}
+
+	return NULL;
+}
+
+static const struct vpu_format *wave6_find_vpu_fmt_by_idx(unsigned int idx,
+							  enum vpu_fmt_type type)
+{
+	if (idx >= ARRAY_SIZE(wave6_vpu_enc_fmt_list[type]))
+		return NULL;
+
+	if (!wave6_vpu_enc_fmt_list[type][idx].v4l2_pix_fmt)
+		return NULL;
+
+	return &wave6_vpu_enc_fmt_list[type][idx];
+}
+
+static u32 wave6_cpb_size_msec(u32 cpb_size_kb, u32 bitrate)
+{
+	u64 cpb_size_bit;
+	u64 cpb_size_msec;
+
+	cpb_size_bit = (u64)cpb_size_kb * 1000 * BITS_PER_BYTE;
+	cpb_size_msec = (cpb_size_bit * 1000) / bitrate;
+
+	if (cpb_size_msec < 10 || cpb_size_msec > 100000)
+		cpb_size_msec = 10000;
+
+	return cpb_size_msec;
+}
+
+static void wave6_vpu_enc_release_fb(struct vpu_instance *inst)
+{
+	int i;
+
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_SUB_SAMPLE][i]);
+	}
+}
+
+static void wave6_vpu_enc_destroy_instance(struct vpu_instance *inst)
+{
+	u32 fail_res = 0;
+	int ret;
+
+	wave6_vpu_remove_dbgfs_file(inst);
+
+	ret = wave6_vpu_enc_close(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
+			ret, fail_res);
+	}
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_del_init(&inst->list);
+	wave6_vpu_enc_release_fb(inst);
+	wave6_vdi_free_dma(&inst->ar_vbuf);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
+
+	if (!pm_runtime_suspended(inst->dev->dev))
+		pm_runtime_put_sync(inst->dev->dev);
+}
+
+static struct vb2_v4l2_buffer *wave6_get_valid_src_buf(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf = NULL;
+
+	v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "no consumed src idx : %d\n",
+				vb2_v4l2_buf->vb2_buf.index);
+			return vb2_v4l2_buf;
+		}
+	}
+
+	return NULL;
+}
+
+static struct vb2_v4l2_buffer *wave6_get_valid_dst_buf(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "no consumed dst idx : %d\n",
+				vb2_v4l2_buf->vb2_buf.index);
+			return vb2_v4l2_buf;
+		}
+	}
+
+	return NULL;
+}
+
+static void wave6_set_csc(struct vpu_instance *inst, struct enc_param *pic_param)
+{
+	const struct vpu_format *vpu_fmt;
+	bool is_10bit;
+
+	vpu_fmt = wave6_find_vpu_fmt(inst->src_fmt.pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return;
+
+	if (!(vpu_fmt->flags & VPU_FMT_FLAG_RGB))
+		return;
+
+	is_10bit = !!(vpu_fmt->flags & VPU_FMT_FLAG_10BIT);
+	pic_param->csc.fmt_order = vpu_fmt->csc_fmt_order;
+
+	if (inst->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT ||
+	    inst->ycbcr_enc == V4L2_YCBCR_ENC_601) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.299(R)    0.587(G)    0.114(B)
+			 * Cb -0.16874(R) -0.33126(G)  0.5(B)
+			 * Cr  0.5(R)     -0.41869(G) -0.08131(B)
+			 */
+			pic_param->csc.coef_ry = 0x099;
+			pic_param->csc.coef_gy = 0x12d;
+			pic_param->csc.coef_by = 0x03a;
+			pic_param->csc.coef_rcb = 0xffffffaa;
+			pic_param->csc.coef_gcb = 0xffffff56;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff2a;
+			pic_param->csc.coef_bcr = 0xffffffd6;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			/*
+			 * Y   0.258(R)   0.504(G)   0.098(B)
+			 * Cb -0.1484(R) -0.2891(G)  0.4375(B)
+			 * Cr  0.4375(R) -0.3672(G) -0.0703(B)
+			 */
+			pic_param->csc.coef_ry = 0x084;
+			pic_param->csc.coef_gy = 0x102;
+			pic_param->csc.coef_by = 0x032;
+			pic_param->csc.coef_rcb = 0xffffffb4;
+			pic_param->csc.coef_gcb = 0xffffff6c;
+			pic_param->csc.coef_bcb = 0x0e0;
+			pic_param->csc.coef_rcr = 0x0e0;
+			pic_param->csc.coef_gcr = 0xffffff44;
+			pic_param->csc.coef_bcr = 0xffffffdc;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_709) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.2126(R)   0.7152(G)   0.0722(B)
+			 * Cb -0.11457(R) -0.38543(G)  0.5(B)
+			 * Cr  0.5(R)     -0.45415(G) -0.04585(B)
+			 */
+			pic_param->csc.coef_ry = 0x06d;
+			pic_param->csc.coef_gy = 0x16e;
+			pic_param->csc.coef_by = 0x025;
+			pic_param->csc.coef_rcb = 0xffffffc5;
+			pic_param->csc.coef_gcb = 0xffffff3b;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff17;
+			pic_param->csc.coef_bcr = 0xffffffe9;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			pic_param->csc.coef_ry = 0x05e;
+			pic_param->csc.coef_gy = 0x13b;
+			pic_param->csc.coef_by = 0x020;
+			pic_param->csc.coef_rcb = 0xffffffcc;
+			pic_param->csc.coef_gcb = 0xffffff53;
+			pic_param->csc.coef_bcb = 0x0e1;
+			pic_param->csc.coef_rcr = 0x0e1;
+			pic_param->csc.coef_gcr = 0xffffff34;
+			pic_param->csc.coef_bcr = 0xffffffeb;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_BT2020) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.2627(R)   0.678(G)    0.0593(B)
+			 * Cb -0.13963(R) -0.36037(G)  0.5(B)
+			 * Cr  0.5(R)     -0.45979(G) -0.04021(B)
+			 */
+			pic_param->csc.coef_ry = 0x087;
+			pic_param->csc.coef_gy = 0x15b;
+			pic_param->csc.coef_by = 0x01e;
+			pic_param->csc.coef_rcb = 0xffffffb9;
+			pic_param->csc.coef_gcb = 0xffffff47;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff15;
+			pic_param->csc.coef_bcr = 0xffffffeb;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			pic_param->csc.coef_ry = 0x074;
+			pic_param->csc.coef_gy = 0x12a;
+			pic_param->csc.coef_by = 0x01a;
+			pic_param->csc.coef_rcb = 0xffffffc1;
+			pic_param->csc.coef_gcb = 0xffffff5e;
+			pic_param->csc.coef_bcb = 0x0e1;
+			pic_param->csc.coef_rcr = 0x0e1;
+			pic_param->csc.coef_gcr = 0xffffff31;
+			pic_param->csc.coef_bcr = 0xffffffee;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_SMPTE240M) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.2122(R)  0.7013(G)  0.0865(B)
+			 * Cb -0.1161(R) -0.3839(G)  0.5(B)
+			 * Cr  0.5(R)    -0.4451(G) -0.0549(B)
+			 */
+			pic_param->csc.coef_ry = 0x06d;
+			pic_param->csc.coef_gy = 0x167;
+			pic_param->csc.coef_by = 0x02c;
+			pic_param->csc.coef_rcb = 0xffffffc5;
+			pic_param->csc.coef_gcb = 0xffffff3b;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff1c;
+			pic_param->csc.coef_bcr = 0xffffffe4;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			pic_param->csc.coef_ry = 0x05d;
+			pic_param->csc.coef_gy = 0x134;
+			pic_param->csc.coef_by = 0x026;
+			pic_param->csc.coef_rcb = 0xffffffcc;
+			pic_param->csc.coef_gcb = 0xffffff53;
+			pic_param->csc.coef_bcb = 0x0e1;
+			pic_param->csc.coef_rcr = 0x0e1;
+			pic_param->csc.coef_gcr = 0xffffff38;
+			pic_param->csc.coef_bcr = 0xffffffe7;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_XV601) {
+		if (inst->quantization == V4L2_QUANTIZATION_LIM_RANGE) {
+			/*
+			 * Y   0.2558(R)  0.5021(G)  0.0975(B)
+			 * Cb -0.1476(R) -0.2899(G)  0.4375(B)
+			 * Cr  0.4375(R) -0.3664(G) -0.0711(B)
+			 */
+			pic_param->csc.coef_ry = 0x083;
+			pic_param->csc.coef_gy = 0x101;
+			pic_param->csc.coef_by = 0x032;
+			pic_param->csc.coef_rcb = 0xffffffb4;
+			pic_param->csc.coef_gcb = 0xffffff6c;
+			pic_param->csc.coef_bcb = 0x0e0;
+			pic_param->csc.coef_rcr = 0x0e0;
+			pic_param->csc.coef_gcr = 0xffffff44;
+			pic_param->csc.coef_bcr = 0xffffffdc;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = 0x0;
+			pic_param->csc.offset_cr = 0x0;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_XV709) {
+		if (inst->quantization == V4L2_QUANTIZATION_LIM_RANGE) {
+			/*
+			 * Y   0.1819(R)  0.6118(G)  0.0618(B)
+			 * Cb -0.1003(R) -0.3372(G)  0.4375(B)
+			 * Cr  0.4375(R) -0.3974(G) -0.0401(B)
+			 */
+			pic_param->csc.coef_ry = 0x05d;
+			pic_param->csc.coef_gy = 0x139;
+			pic_param->csc.coef_by = 0x020;
+			pic_param->csc.coef_rcb = 0xffffffcd;
+			pic_param->csc.coef_gcb = 0xffffff53;
+			pic_param->csc.coef_bcb = 0x0e0;
+			pic_param->csc.coef_rcr = 0x0e0;
+			pic_param->csc.coef_gcr = 0xffffff35;
+			pic_param->csc.coef_bcr = 0xffffffeb;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = 0x0;
+			pic_param->csc.offset_cr = 0x0;
+		}
+	}
+}
+
+static void wave6_update_crop_info(struct vpu_instance *inst,
+				   u32 left, u32 top, u32 width, u32 height)
+{
+	u32 enc_pic_width, enc_pic_height;
+
+	inst->crop.left = left;
+	inst->crop.top = top;
+	inst->crop.width = width;
+	inst->crop.height = height;
+
+	inst->codec_rect.left = round_down(left, W6_ENC_CROP_X_POS_STEP);
+	inst->codec_rect.top = round_down(top, W6_ENC_CROP_Y_POS_STEP);
+
+	enc_pic_width = width + left - inst->codec_rect.left;
+	inst->codec_rect.width = round_up(enc_pic_width, W6_ENC_PIC_SIZE_STEP);
+
+	enc_pic_height = height + top - inst->codec_rect.top;
+	inst->codec_rect.height = round_up(enc_pic_height, W6_ENC_PIC_SIZE_STEP);
+}
+
+static int wave6_allocate_aux_buffer(struct vpu_instance *inst,
+				     enum aux_buffer_type type,
+				     int num)
+{
+	struct aux_buffer buf[WAVE6_MAX_FBS];
+	struct aux_buffer_info buf_info;
+	struct enc_aux_buffer_size_info size_info;
+	unsigned int size;
+	int i, ret;
+
+	memset(buf, 0, sizeof(buf));
+
+	size_info.width = inst->codec_rect.width;
+	size_info.height = inst->codec_rect.height;
+	size_info.type = type;
+
+	ret = wave6_vpu_enc_get_aux_buffer_size(inst, size_info, &size);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Get size fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		inst->aux_vbuf[type][i].size = size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
+		if (ret) {
+			dev_dbg(inst->dev->dev, "%s: Alloc fail (type %d)\n", __func__, type);
+			return ret;
+		}
+
+		buf[i].index = i;
+		buf[i].addr = inst->aux_vbuf[type][i].daddr;
+		buf[i].size = inst->aux_vbuf[type][i].size;
+	}
+
+	buf_info.type = type;
+	buf_info.num = num;
+	buf_info.buf_array = buf;
+
+	ret = wave6_vpu_enc_register_aux_buffer(inst, buf_info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Register fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void wave6_update_frame_buf_addr(struct vpu_instance *inst,
+					struct frame_buffer *frame_buf)
+{
+	const struct v4l2_format_info *fmt_info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 offset;
+
+	fmt_info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!fmt_info)
+		return;
+
+	offset = inst->codec_rect.top * stride + inst->codec_rect.left * fmt_info->bpp[0];
+	frame_buf->buf_y += offset;
+
+	stride = DIV_ROUND_UP(stride, fmt_info->bpp[0]) * fmt_info->bpp[1];
+	offset = inst->codec_rect.top * stride / fmt_info->vdiv / fmt_info->hdiv
+			+ inst->codec_rect.left * fmt_info->bpp[1] / fmt_info->hdiv;
+	frame_buf->buf_cb += offset;
+	frame_buf->buf_cr += offset;
+}
+
+static int wave6_update_seq_param(struct vpu_instance *inst)
+{
+	struct enc_seq_info seq_info;
+	bool changed = false;
+	int ret;
+
+	ret = wave6_vpu_enc_issue_seq_change(inst, &changed);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq change fail %d\n", ret);
+		return ret;
+	}
+
+	if (!changed)
+		return 0;
+
+	ret = wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq change timeout\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_enc_complete_seq_init(inst, &seq_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq change error\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
+{
+	int ret = -EINVAL;
+	struct vb2_v4l2_buffer *src_buf = NULL;
+	struct vb2_v4l2_buffer *dst_buf = NULL;
+	struct vpu_buffer *src_vbuf = NULL;
+	struct vpu_buffer *dst_vbuf = NULL;
+	struct frame_buffer frame_buf;
+	struct enc_param pic_param;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = (stride * inst->src_fmt.height);
+	u32 chroma_size;
+	u32 fail_res;
+
+	memset(&pic_param, 0, sizeof(struct enc_param));
+	memset(&frame_buf, 0, sizeof(struct frame_buffer));
+
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV420 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV420M)
+		chroma_size = ((stride / 2) * (inst->src_fmt.height / 2));
+	else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV422P ||
+		 inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV422M)
+		chroma_size = ((stride) * (inst->src_fmt.height / 2));
+	else
+		chroma_size = 0;
+
+	ret = wave6_update_seq_param(inst);
+	if (ret)
+		goto exit;
+
+	src_buf = wave6_get_valid_src_buf(inst);
+	dst_buf = wave6_get_valid_dst_buf(inst);
+
+	if (!dst_buf) {
+		dev_dbg(inst->dev->dev, "no valid dst buf\n");
+		goto exit;
+	}
+
+	dst_vbuf = wave6_to_vpu_buf(dst_buf);
+	pic_param.pic_stream_buffer_addr = wave6_get_dma_addr(dst_buf, 0);
+	pic_param.pic_stream_buffer_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
+	if (!src_buf) {
+		dev_dbg(inst->dev->dev, "no valid src buf\n");
+		if (inst->state == VPU_INST_STATE_STOP)
+			pic_param.src_end = true;
+		else
+			goto exit;
+	} else {
+		src_vbuf = wave6_to_vpu_buf(src_buf);
+		if (inst->src_fmt.num_planes == 1) {
+			frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
+			frame_buf.buf_cb = frame_buf.buf_y + luma_size;
+			frame_buf.buf_cr = frame_buf.buf_cb + chroma_size;
+		} else if (inst->src_fmt.num_planes == 2) {
+			frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
+			frame_buf.buf_cb = wave6_get_dma_addr(src_buf, 1);
+			frame_buf.buf_cr = frame_buf.buf_cb + chroma_size;
+		} else if (inst->src_fmt.num_planes == 3) {
+			frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
+			frame_buf.buf_cb = wave6_get_dma_addr(src_buf, 1);
+			frame_buf.buf_cr = wave6_get_dma_addr(src_buf, 2);
+		}
+		wave6_update_frame_buf_addr(inst, &frame_buf);
+		frame_buf.stride = stride;
+		pic_param.src_idx = src_buf->vb2_buf.index;
+		if (src_vbuf->force_key_frame || inst->error_recovery) {
+			pic_param.force_pic = true;
+			pic_param.force_pic_type = ENC_FORCE_PIC_TYPE_IDR;
+			inst->error_recovery = false;
+		}
+		if (src_vbuf->force_frame_qp) {
+			pic_param.force_pic_qp = true;
+			pic_param.force_pic_qp_i = src_vbuf->force_i_frame_qp;
+			pic_param.force_pic_qp_p = src_vbuf->force_p_frame_qp;
+			pic_param.force_pic_qp_b = src_vbuf->force_b_frame_qp;
+		}
+		src_vbuf->ts_start = ktime_get_raw();
+	}
+
+	pic_param.source_frame = &frame_buf;
+	wave6_set_csc(inst, &pic_param);
+
+	if (src_vbuf)
+		src_vbuf->consumed = true;
+	if (dst_vbuf) {
+		dst_vbuf->consumed = true;
+		dst_vbuf->used = true;
+	}
+
+	trace_wave6_vpu_enc_pic(inst, &pic_param);
+
+	ret = wave6_vpu_enc_start_one_frame(inst, &pic_param, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
+
+		dst_buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (dst_buf) {
+			dst_buf->sequence = inst->sequence;
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+		}
+
+		src_buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (src_buf) {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			inst->sequence++;
+			inst->processed_buf_num++;
+			inst->error_buf_num++;
+		}
+	} else {
+		dev_dbg(inst->dev->dev, "%s: success\n", __func__);
+	}
+
+exit:
+	return ret;
+}
+
+static void wave6_handle_encoded_frame(struct vpu_instance *inst,
+				       struct enc_output_info *info)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct vpu_buffer *vpu_buf;
+	struct vpu_buffer *dst_vpu_buf;
+	enum vb2_buffer_state state;
+
+	state = info->encoding_success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	src_buf = v4l2_m2m_src_buf_remove_by_idx(inst->v4l2_fh.m2m_ctx,
+						 info->enc_src_idx);
+	if (!src_buf) {
+		dev_err(inst->dev->dev, "[%d] encoder can't find src buffer\n", inst->id);
+		return;
+	}
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	if (!vpu_buf || !vpu_buf->consumed) {
+		dev_err(inst->dev->dev, "[%d] src buffer is not consumed\n", inst->id);
+		return;
+	}
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, info->bitstream_buffer);
+	if (!dst_buf) {
+		dev_err(inst->dev->dev, "[%d] encoder can't find dst buffer\n", inst->id);
+		return;
+	}
+
+	dst_vpu_buf = wave6_to_vpu_buf(dst_buf);
+
+	dst_vpu_buf->average_qp = info->avg_ctu_qp;
+	dst_vpu_buf->ts_input = vpu_buf->ts_input;
+	dst_vpu_buf->ts_start = vpu_buf->ts_start;
+	dst_vpu_buf->ts_finish = ktime_get_raw();
+	dst_vpu_buf->hw_time = wave6_vpu_cycle_to_ns(inst->dev, info->cycle.frame_cycle);
+	dst_vpu_buf->ts_output = ktime_get_raw();
+	wave6_vpu_handle_performance(inst, dst_vpu_buf);
+
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+	v4l2_m2m_buf_done(src_buf, state);
+
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, info->bitstream_size);
+	dst_buf->sequence = inst->sequence++;
+	dst_buf->field = V4L2_FIELD_NONE;
+	if (info->pic_type == PIC_TYPE_I)
+		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
+	else if (info->pic_type == PIC_TYPE_P)
+		dst_buf->flags |= V4L2_BUF_FLAG_PFRAME;
+	else if (info->pic_type == PIC_TYPE_B)
+		dst_buf->flags |= V4L2_BUF_FLAG_BFRAME;
+
+	v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+	if (state == VB2_BUF_STATE_ERROR) {
+		dev_dbg(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->sequence);
+		inst->error_recovery = true;
+		inst->error_buf_num++;
+	}
+	v4l2_m2m_buf_done(dst_buf, state);
+	inst->processed_buf_num++;
+}
+
+static void wave6_handle_last_frame(struct vpu_instance *inst,
+				    dma_addr_t addr)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, addr);
+	if (!dst_buf)
+		return;
+
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+	dst_buf->field = V4L2_FIELD_NONE;
+	dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+	v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	dev_dbg(inst->dev->dev, "[%d] eos\n", inst->id);
+	inst->eos = true;
+
+	v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
+}
+
+static void wave6_vpu_enc_finish_encode(struct vpu_instance *inst, bool error)
+{
+	int ret;
+	struct enc_output_info info;
+
+	if (error) {
+		vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
+		inst->eos = true;
+
+		goto finish_encode;
+	}
+
+	memset(&info, 0, sizeof(info));
+
+	ret = wave6_vpu_enc_get_output_info(inst, &info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "vpu_enc_get_output_info fail %d\n", ret);
+		goto finish_encode;
+	}
+
+	trace_wave6_vpu_enc_done(inst, &info);
+
+	if (info.enc_src_idx >= 0 && info.recon_frame_index >= 0)
+		wave6_handle_encoded_frame(inst, &info);
+	else if (info.recon_frame_index == RECON_IDX_FLAG_ENC_END)
+		wave6_handle_last_frame(inst, info.bitstream_buffer);
+
+finish_encode:
+	wave6_vpu_finish_job(inst);
+}
+
+static int wave6_vpu_enc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, VPU_ENC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VPU_ENC_DRV_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" VPU_ENC_DRV_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int wave6_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
+{
+	const struct vpu_format *vpu_fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_RAW);
+		if (!vpu_fmt)
+			return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = vpu_fmt->min_width;
+	fsize->stepwise.max_width = vpu_fmt->max_width;
+	fsize->stepwise.step_width = W6_ENC_PIC_SIZE_STEP;
+	fsize->stepwise.min_height = vpu_fmt->min_height;
+	fsize->stepwise.max_height = vpu_fmt->max_height;
+	fsize->stepwise.step_height = W6_ENC_PIC_SIZE_STEP;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "index : %d\n", f->index);
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_CAPTURE(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
+		pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+		pix_mp->num_planes = inst->dst_fmt.num_planes;
+	} else {
+		width = pix_mp->width;
+		height = pix_mp->height;
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	wave6_update_pix_fmt(pix_mp, width, height);
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	ret = wave6_vpu_enc_try_fmt_cap(file, fh, f);
+	if (ret)
+		return ret;
+
+	inst->std = wave6_to_codec_std(inst->type, pix_mp->pixelformat);
+	if (inst->std == STD_UNKNOWN) {
+		dev_err(inst->dev->dev, "unsupported pixelformat: %.4s\n",
+			(char *)&pix_mp->pixelformat);
+		return -EINVAL;
+	}
+
+	inst->dst_fmt.width = pix_mp->width;
+	inst->dst_fmt.height = pix_mp->height;
+	inst->dst_fmt.pixelformat = pix_mp->pixelformat;
+	inst->dst_fmt.field = pix_mp->field;
+	inst->dst_fmt.flags = pix_mp->flags;
+	inst->dst_fmt.num_planes = pix_mp->num_planes;
+	for (i = 0; i < inst->dst_fmt.num_planes; i++) {
+		inst->dst_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->dst_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i;
+
+	pix_mp->width = inst->dst_fmt.width;
+	pix_mp->height = inst->dst_fmt.height;
+	pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+	pix_mp->field = inst->dst_fmt.field;
+	pix_mp->flags = inst->dst_fmt.flags;
+	pix_mp->num_planes = inst->dst_fmt.num_planes;
+	for (i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->dst_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->dst_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "%s: index %d\n", __func__, f->index);
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
+		pix_mp->pixelformat = inst->src_fmt.pixelformat;
+		pix_mp->num_planes = inst->src_fmt.num_planes;
+	} else {
+		width = clamp(pix_mp->width,
+			      vpu_fmt->min_width, vpu_fmt->max_width);
+		height = clamp(pix_mp->height,
+			       vpu_fmt->min_height, vpu_fmt->max_height);
+
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	wave6_update_pix_fmt(pix_mp, width, height);
+
+	if (pix_mp->ycbcr_enc == V4L2_YCBCR_ENC_BT2020_CONST_LUM)
+		pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_BT2020;
+	if (pix_mp->ycbcr_enc == V4L2_YCBCR_ENC_XV601 ||
+	    pix_mp->ycbcr_enc == V4L2_YCBCR_ENC_XV709) {
+		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			pix_mp->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int i, ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	ret = wave6_vpu_enc_try_fmt_out(file, fh, f);
+	if (ret)
+		return ret;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	inst->src_fmt.width = pix_mp->width;
+	inst->src_fmt.height = pix_mp->height;
+	inst->src_fmt.pixelformat = pix_mp->pixelformat;
+	inst->src_fmt.field = pix_mp->field;
+	inst->src_fmt.flags = pix_mp->flags;
+	inst->src_fmt.num_planes = pix_mp->num_planes;
+	for (i = 0; i < inst->src_fmt.num_planes; i++) {
+		inst->src_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->src_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	inst->cbcr_interleave = !!(vpu_fmt->flags & VPU_FMT_FLAG_CBCR_INTERLEAVED);
+	inst->nv21 = !!(vpu_fmt->flags & VPU_FMT_FLAG_CRCB_ORDER);
+	inst->colorspace = pix_mp->colorspace;
+	inst->ycbcr_enc = pix_mp->ycbcr_enc;
+	inst->quantization = pix_mp->quantization;
+	inst->xfer_func = pix_mp->xfer_func;
+
+	wave6_update_pix_fmt(&inst->dst_fmt, pix_mp->width, pix_mp->height);
+	wave6_update_crop_info(inst, 0, 0, pix_mp->width, pix_mp->height);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i;
+
+	pix_mp->width = inst->src_fmt.width;
+	pix_mp->height = inst->src_fmt.height;
+	pix_mp->pixelformat = inst->src_fmt.pixelformat;
+	pix_mp->field = inst->src_fmt.field;
+	pix_mp->flags = inst->src_fmt.flags;
+	pix_mp->num_planes = inst->src_fmt.num_planes;
+	for (i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->src_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->src_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+
+	dev_dbg(inst->dev->dev, "%s: type %d target %d\n",
+		__func__, s->type, s->target);
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->src_fmt.width;
+		s->r.height = inst->src_fmt.height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r = inst->crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	u32 max_crop_w, max_crop_h;
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type))
+		return -EINVAL;
+
+	if (s->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
+		s->flags |= V4L2_SEL_FLAG_LE;
+
+	if (s->flags & V4L2_SEL_FLAG_GE) {
+		s->r.left = round_up(s->r.left, W6_ENC_CROP_STEP);
+		s->r.top = round_up(s->r.top, W6_ENC_CROP_STEP);
+		s->r.width = round_up(s->r.width, W6_ENC_CROP_STEP);
+		s->r.height = round_up(s->r.height, W6_ENC_CROP_STEP);
+	}
+	if (s->flags & V4L2_SEL_FLAG_LE) {
+		s->r.left = round_down(s->r.left, W6_ENC_CROP_STEP);
+		s->r.top = round_down(s->r.top, W6_ENC_CROP_STEP);
+		s->r.width = round_down(s->r.width, W6_ENC_CROP_STEP);
+		s->r.height = round_down(s->r.height, W6_ENC_CROP_STEP);
+	}
+
+	max_crop_w = inst->src_fmt.width - s->r.left;
+	max_crop_h = inst->src_fmt.height - s->r.top;
+
+	if (!s->r.width || !s->r.height)
+		return 0;
+	if (max_crop_w < W6_MIN_ENC_PIC_WIDTH)
+		return 0;
+	if (max_crop_h < W6_MIN_ENC_PIC_HEIGHT)
+		return 0;
+
+	s->r.width = clamp(s->r.width, W6_MIN_ENC_PIC_WIDTH, max_crop_w);
+	s->r.height = clamp(s->r.height, W6_MIN_ENC_PIC_HEIGHT, max_crop_h);
+
+	wave6_update_pix_fmt(&inst->dst_fmt, s->r.width, s->r.height);
+	wave6_update_crop_info(inst, s->r.left, s->r.top, s->r.width, s->r.height);
+
+	dev_dbg(inst->dev->dev, "V4L2_SEL_TGT_CROP %dx%dx%dx%d\n",
+		s->r.left, s->r.top, s->r.width, s->r.height);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *ec)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: cmd %d\n", __func__, ec->cmd);
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	if (ret)
+		return ret;
+
+	if (!wave6_vpu_both_queues_are_streaming(inst))
+		return 0;
+
+	switch (ec->cmd) {
+	case V4L2_ENC_CMD_STOP:
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
+		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, true);
+		v4l2_m2m_try_schedule(inst->v4l2_fh.m2m_ctx);
+		break;
+	case V4L2_ENC_CMD_START:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+
+	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type))
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	a->parm.output.timeperframe.numerator = 1;
+	a->parm.output.timeperframe.denominator = inst->enc_ctrls.frame_rate;
+
+	dev_dbg(inst->dev->dev, "%s: numerator : %d | denominator : %d\n",
+		__func__,
+		a->parm.output.timeperframe.numerator,
+		a->parm.output.timeperframe.denominator);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct enc_controls *ctrls = &inst->enc_ctrls;
+
+	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type))
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	if (a->parm.output.timeperframe.denominator &&
+	    a->parm.output.timeperframe.numerator) {
+		ctrls->frame_rate = a->parm.output.timeperframe.denominator /
+				    a->parm.output.timeperframe.numerator;
+	} else {
+		a->parm.output.timeperframe.numerator = 1;
+		a->parm.output.timeperframe.denominator = ctrls->frame_rate;
+	}
+
+	dev_dbg(inst->dev->dev, "%s: numerator : %d | denominator : %d\n",
+		__func__,
+		a->parm.output.timeperframe.numerator,
+		a->parm.output.timeperframe.denominator);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops wave6_vpu_enc_ioctl_ops = {
+	.vidioc_querycap = wave6_vpu_enc_querycap,
+	.vidioc_enum_framesizes = wave6_vpu_enc_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap = wave6_vpu_enc_enum_fmt_cap,
+	.vidioc_s_fmt_vid_cap_mplane = wave6_vpu_enc_s_fmt_cap,
+	.vidioc_g_fmt_vid_cap_mplane = wave6_vpu_enc_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap_mplane = wave6_vpu_enc_try_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out = wave6_vpu_enc_enum_fmt_out,
+	.vidioc_s_fmt_vid_out_mplane = wave6_vpu_enc_s_fmt_out,
+	.vidioc_g_fmt_vid_out_mplane = wave6_vpu_enc_g_fmt_out,
+	.vidioc_try_fmt_vid_out_mplane = wave6_vpu_enc_try_fmt_out,
+
+	.vidioc_g_selection = wave6_vpu_enc_g_selection,
+	.vidioc_s_selection = wave6_vpu_enc_s_selection,
+
+	.vidioc_g_parm = wave6_vpu_enc_g_parm,
+	.vidioc_s_parm = wave6_vpu_enc_s_parm,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd = wave6_vpu_enc_encoder_cmd,
+
+	.vidioc_subscribe_event = wave6_vpu_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int wave6_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst = wave6_ctrl_to_vpu_inst(ctrl);
+	struct enc_controls *p = &inst->enc_ctrls;
+
+	trace_wave6_vpu_s_ctrl(inst, ctrl);
+
+	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
+		__func__, ctrl->name, ctrl->val);
+
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		p->mirror_direction |= (ctrl->val << 1);
+		break;
+	case V4L2_CID_VFLIP:
+		p->mirror_direction |= ctrl->val;
+		break;
+	case V4L2_CID_ROTATE:
+		p->rotation_angle = ctrl->val;
+		break;
+	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+		break;
+	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+		p->gop_size = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		p->slice_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		p->slice_max_mb = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		p->bitrate_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		p->bitrate = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		p->frame_rc_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+		p->mb_rc_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		p->force_key_frame = true;
+		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		p->prepend_spspps_to_idr = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		p->intra_refresh_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		p->frame_skip_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		p->hevc.profile = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		p->hevc.level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+		p->hevc.min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+		p->hevc.max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+		p->hevc.i_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+		p->hevc.p_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+		p->hevc.b_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
+		p->hevc.loop_filter_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
+		p->hevc.lf_beta_offset_div2 = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
+		p->hevc.lf_tc_offset_div2 = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
+		p->hevc.refresh_type = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:
+		p->hevc.refresh_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:
+		p->hevc.const_intra_pred = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:
+		p->hevc.strong_smoothing = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:
+		p->hevc.tmv_prediction = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		p->h264.profile = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		p->h264.level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+		p->h264.min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+		p->h264.max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+		p->h264.i_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+		p->h264.p_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+		p->h264.b_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+		p->h264.loop_filter_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+		p->h264.loop_filter_beta = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+		p->h264.loop_filter_alpha = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+		p->h264._8x8_transform = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
+		p->h264.constrained_intra_prediction = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:
+		p->h264.chroma_qp_index_offset = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+		p->h264.entropy_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
+		p->h264.i_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
+		p->h264.vui_sar_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+		p->h264.vui_sar_idc = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:
+		p->h264.vui_ext_sar_width = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:
+		p->h264.vui_ext_sar_height = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
+		p->h264.cpb_size = ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops wave6_vpu_enc_ctrl_ops = {
+	.s_ctrl = wave6_vpu_enc_s_ctrl,
+};
+
+static u32 to_video_full_range_flag(enum v4l2_quantization quantization)
+{
+	switch (quantization) {
+	case V4L2_QUANTIZATION_FULL_RANGE:
+		return 1;
+	case V4L2_QUANTIZATION_LIM_RANGE:
+	default:
+		return 0;
+	}
+}
+
+static u32 to_colour_primaries(enum v4l2_colorspace colorspace)
+{
+	switch (colorspace) {
+	case V4L2_COLORSPACE_SMPTE170M:
+		return 6;
+	case V4L2_COLORSPACE_REC709:
+	case V4L2_COLORSPACE_SRGB:
+	case V4L2_COLORSPACE_JPEG:
+		return 1;
+	case V4L2_COLORSPACE_BT2020:
+		return 9;
+	case V4L2_COLORSPACE_DCI_P3:
+		return 11;
+	case V4L2_COLORSPACE_SMPTE240M:
+		return 7;
+	case V4L2_COLORSPACE_470_SYSTEM_M:
+		return 4;
+	case V4L2_COLORSPACE_470_SYSTEM_BG:
+		return 5;
+	case V4L2_COLORSPACE_RAW:
+	default:
+		return 2;
+	}
+}
+
+static u32 to_transfer_characteristics(enum v4l2_colorspace colorspace,
+				       enum v4l2_xfer_func xfer_func)
+{
+	if (xfer_func == V4L2_XFER_FUNC_DEFAULT)
+		xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(colorspace);
+
+	switch (xfer_func) {
+	case V4L2_XFER_FUNC_709:
+		if (colorspace == V4L2_COLORSPACE_SMPTE170M)
+			return 6;
+		else if (colorspace == V4L2_COLORSPACE_BT2020)
+			return 14;
+		else
+			return 1;
+	case V4L2_XFER_FUNC_SRGB:
+		return 13;
+	case V4L2_XFER_FUNC_SMPTE240M:
+		return 7;
+	case V4L2_XFER_FUNC_NONE:
+		return 8;
+	case V4L2_XFER_FUNC_SMPTE2084:
+		return 16;
+	case V4L2_XFER_FUNC_DCI_P3:
+	default:
+		return 2;
+	}
+}
+
+static u32 to_matrix_coeffs(enum v4l2_colorspace colorspace,
+			    enum v4l2_ycbcr_encoding ycbcr_enc)
+{
+	if (ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+		ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(colorspace);
+
+	switch (ycbcr_enc) {
+	case V4L2_YCBCR_ENC_601:
+	case V4L2_YCBCR_ENC_XV601:
+		if (colorspace == V4L2_COLORSPACE_SMPTE170M)
+			return 6;
+		else
+			return 5;
+	case V4L2_YCBCR_ENC_709:
+	case V4L2_YCBCR_ENC_XV709:
+		return 1;
+	case V4L2_YCBCR_ENC_BT2020:
+		return 9;
+	case V4L2_YCBCR_ENC_BT2020_CONST_LUM:
+		return 10;
+	case V4L2_YCBCR_ENC_SMPTE240M:
+		return 7;
+	default:
+		return 2;
+	}
+}
+
+static void wave6_set_enc_h264_param(struct enc_codec_param *output,
+				     struct h264_enc_controls *ctrls)
+{
+	switch (ctrls->profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		output->profile = H264_PROFILE_BP;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		output->profile = H264_PROFILE_MP;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		output->profile = H264_PROFILE_EXTENDED;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		output->profile = H264_PROFILE_HP;
+		output->internal_bit_depth = 8;
+		break;
+	default:
+		break;
+	}
+	switch (ctrls->level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		output->level = 10;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		output->level = 9;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		output->level = 11;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		output->level = 12;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		output->level = 13;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		output->level = 20;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		output->level = 21;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		output->level = 22;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		output->level = 30;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		output->level = 31;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		output->level = 32;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		output->level = 40;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		output->level = 41;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		output->level = 42;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		output->level = 50;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		output->level = 51;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_2:
+		output->level = 52;
+		break;
+	default:
+		break;
+	}
+	output->qp = ctrls->i_frame_qp;
+	output->min_qp_i = ctrls->min_qp;
+	output->max_qp_i = ctrls->max_qp;
+	output->min_qp_p = ctrls->min_qp;
+	output->max_qp_p = ctrls->max_qp;
+	output->min_qp_b = ctrls->min_qp;
+	output->max_qp_b = ctrls->max_qp;
+	switch (ctrls->loop_filter_mode) {
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
+		output->en_dbk = 0;
+		output->en_lf_slice_boundary = 0;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
+		output->en_dbk = 1;
+		output->en_lf_slice_boundary = 1;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		output->en_dbk = 1;
+		output->en_lf_slice_boundary = 0;
+		break;
+	default:
+		break;
+	}
+	output->intra_period = ctrls->i_period;
+	output->beta_offset_div2 = ctrls->loop_filter_beta;
+	output->tc_offset_div2 = ctrls->loop_filter_alpha;
+	if (output->profile >= H264_PROFILE_HP)
+		output->en_transform8x8 = ctrls->_8x8_transform;
+	output->en_const_intra_pred = ctrls->constrained_intra_prediction;
+	output->cb_qp_offset = ctrls->chroma_qp_index_offset;
+	output->cr_qp_offset = ctrls->chroma_qp_index_offset;
+	if (output->profile >= H264_PROFILE_MP)
+		output->en_cabac = ctrls->entropy_mode;
+}
+
+static void wave6_set_enc_hevc_param(struct enc_codec_param *output,
+				     struct hevc_enc_controls *ctrls)
+{
+	switch (ctrls->profile) {
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+		output->profile = HEVC_PROFILE_MAIN;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+		output->profile = HEVC_PROFILE_STILLPICTURE;
+		output->internal_bit_depth = 8;
+		output->en_still_picture = true;
+		break;
+	default:
+		break;
+	}
+	switch (ctrls->level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		output->level = 10 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		output->level = 20 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		output->level = 21 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		output->level = 30 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		output->level = 31 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		output->level = 40 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		output->level = 41 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		output->level = 50 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		output->level = 51 * 3;
+		break;
+	default:
+		break;
+	}
+	output->qp = ctrls->i_frame_qp;
+	output->min_qp_i = ctrls->min_qp;
+	output->max_qp_i = ctrls->max_qp;
+	output->min_qp_p = ctrls->min_qp;
+	output->max_qp_p = ctrls->max_qp;
+	output->min_qp_b = ctrls->min_qp;
+	output->max_qp_b = ctrls->max_qp;
+	switch (ctrls->loop_filter_mode) {
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
+		output->en_dbk = 0;
+		output->en_sao = 0;
+		output->en_lf_slice_boundary = 0;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
+		output->en_dbk = 1;
+		output->en_sao = 1;
+		output->en_lf_slice_boundary = 1;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		output->en_dbk = 1;
+		output->en_sao = 1;
+		output->en_lf_slice_boundary = 0;
+		break;
+	default:
+		break;
+	}
+	switch (ctrls->refresh_type) {
+	case V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE:
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_NON_IRAP;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR:
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
+		break;
+	default:
+		break;
+	}
+	output->intra_period = ctrls->refresh_period;
+	if (output->idr_period) {
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
+		output->intra_period = output->idr_period;
+		output->idr_period = 0;
+	}
+	if (output->profile == HEVC_PROFILE_STILLPICTURE) {
+		output->gop_preset_idx = PRESET_IDX_ALL_I;
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
+		output->intra_period = 0;
+		output->idr_period = 0;
+	}
+	output->beta_offset_div2 = ctrls->lf_beta_offset_div2;
+	output->tc_offset_div2 = ctrls->lf_tc_offset_div2;
+	output->en_const_intra_pred = ctrls->const_intra_pred;
+	output->en_intra_smooth = ctrls->strong_smoothing;
+	output->en_temporal_mvp = ctrls->tmv_prediction;
+	output->num_ticks_poc_diff_one = DEFAULT_NUM_TICKS_POC_DIFF;
+	output->intra_4x4 = DEFAULT_INTRA_4X4;
+}
+
+static void wave6_set_enc_open_param(struct enc_open_param *open_param,
+				     struct vpu_instance *inst)
+{
+	struct enc_controls *ctrls = &inst->enc_ctrls;
+	struct enc_codec_param *output = &open_param->codec_param;
+	u32 ctu_size = (inst->std == W_AVC_ENC) ? 16 : 64;
+	u32 num_ctu_row = ALIGN(inst->src_fmt.height, ctu_size) / ctu_size;
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt(inst->src_fmt.pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return;
+
+	open_param->src_format = vpu_fmt->fb_fmt;
+	open_param->source_endian = vpu_fmt->endian;
+	open_param->inst_buffer.temp_base = inst->dev->temp_vbuf.daddr;
+	open_param->inst_buffer.temp_size = inst->dev->temp_vbuf.size;
+	open_param->inst_buffer.ar_base = inst->ar_vbuf.daddr;
+	open_param->pic_width = inst->codec_rect.width;
+	open_param->pic_height = inst->codec_rect.height;
+	open_param->mir_dir = inst->enc_ctrls.mirror_direction;
+	open_param->rot_angle = inst->enc_ctrls.rotation_angle;
+
+	output->gop_preset_idx = PRESET_IDX_IPP_SINGLE;
+	output->temp_layer_cnt = DEFAULT_TEMP_LAYER_CNT;
+	output->rc_initial_level = DEFAULT_RC_INITIAL_LEVEL;
+	output->pic_rc_max_dqp = DEFAULT_PIC_RC_MAX_DQP;
+	output->rc_initial_qp = DEFAULT_RC_INITIAL_QP;
+	output->qround_inter = DEFAULT_QROUND_INTER;
+	output->qround_intra = DEFAULT_QROUND_INTRA;
+
+	output->frame_rate = ctrls->frame_rate;
+	output->idr_period = ctrls->gop_size;
+	output->rc_mode = ctrls->bitrate_mode;
+	output->rc_update_speed = (ctrls->bitrate_mode) ? DEFAULT_RC_UPDATE_SPEED_CBR :
+							  DEFAULT_RC_UPDATE_SPEED_VBR;
+	output->en_rate_control = ctrls->frame_rc_enable;
+	output->en_cu_level_rate_control = ctrls->mb_rc_enable;
+	output->max_intra_pic_bit = inst->dst_fmt.plane_fmt[0].sizeimage * 8;
+	output->max_inter_pic_bit = inst->dst_fmt.plane_fmt[0].sizeimage * 8;
+	output->bitrate = ctrls->bitrate;
+	output->cpb_size = wave6_cpb_size_msec(ctrls->h264.cpb_size, ctrls->bitrate);
+	output->slice_mode = ctrls->slice_mode;
+	output->slice_arg = ctrls->slice_max_mb;
+	output->forced_idr_header = ctrls->prepend_spspps_to_idr;
+	output->en_skip_frame = (ctrls->frame_skip_mode) ? 1 : 0;
+	if (ctrls->intra_refresh_period) {
+		output->intra_refresh_mode = INTRA_REFRESH_ROW;
+		if (ctrls->intra_refresh_period < num_ctu_row) {
+			output->intra_refresh_arg = (num_ctu_row + ctrls->intra_refresh_period - 1)
+						    / ctrls->intra_refresh_period;
+		} else {
+			output->intra_refresh_arg = 1;
+		}
+	}
+	output->sar.enable = ctrls->h264.vui_sar_enable;
+	output->sar.idc = ctrls->h264.vui_sar_idc;
+	if (output->sar.idc == V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED)
+		output->sar.idc = H264_VUI_SAR_IDC_EXTENDED;
+	output->sar.width = ctrls->h264.vui_ext_sar_width;
+	output->sar.height = ctrls->h264.vui_ext_sar_height;
+	output->color.color_range = to_video_full_range_flag(inst->quantization);
+	output->color.color_primaries = to_colour_primaries(inst->colorspace);
+	output->color.transfer_characteristics = to_transfer_characteristics(inst->colorspace,
+									     inst->xfer_func);
+	output->color.matrix_coefficients = to_matrix_coeffs(inst->colorspace, inst->ycbcr_enc);
+	output->conf_win.left = inst->crop.left - inst->codec_rect.left;
+	output->conf_win.top = inst->crop.top - inst->codec_rect.top;
+	output->conf_win.right = inst->codec_rect.width
+					- inst->crop.width - output->conf_win.left;
+	output->conf_win.bottom = inst->codec_rect.height
+					- inst->crop.height - output->conf_win.top;
+
+	switch (inst->std) {
+	case W_AVC_ENC:
+		wave6_set_enc_h264_param(output, &ctrls->h264);
+		break;
+	case W_HEVC_ENC:
+		wave6_set_enc_hevc_param(output, &ctrls->hevc);
+		break;
+	default:
+		break;
+	}
+}
+
+static int wave6_vpu_enc_create_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct enc_open_param open_param;
+
+	memset(&open_param, 0, sizeof(struct enc_open_param));
+
+	wave6_vpu_record_performance_timestamps(inst);
+
+	wave6_vpu_core_activate(inst->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret) {
+		dev_err(inst->dev->dev, "runtime_resume failed %d\n", ret);
+		return ret;
+	}
+
+	inst->ar_vbuf.size = ALIGN(W6_ARBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(inst->dev->dev, &inst->ar_vbuf);
+	if (ret) {
+		dev_err(inst->dev->dev, "alloc ar of size %zu failed\n",
+			inst->ar_vbuf.size);
+		goto error_pm;
+	}
+
+	wave6_set_enc_open_param(&open_param, inst);
+
+	ret = wave6_vpu_enc_open(inst, &open_param);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed create instance : %d\n", ret);
+		goto error_open;
+	}
+
+	dev_dbg(inst->dev->dev, "[%d] encoder\n", inst->id);
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_add_tail(&inst->list, &inst->dev->instances);
+	wave6_vpu_create_dbgfs_file(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
+
+	return 0;
+
+error_open:
+	wave6_vdi_free_dma(&inst->ar_vbuf);
+error_pm:
+	pm_runtime_put_sync(inst->dev->dev);
+
+	return ret;
+}
+
+static int wave6_vpu_enc_initialize_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct enc_seq_info seq_info;
+	struct v4l2_ctrl *ctrl;
+
+	ret = wave6_vpu_enc_issue_seq_init(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init fail %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init timeout\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_enc_complete_seq_init(inst, &seq_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init error\n");
+		return ret;
+	}
+
+	dev_dbg(inst->dev->dev, "min_fb_cnt : %d | min_src_cnt : %d\n",
+		seq_info.min_frame_buffer_count,
+		seq_info.min_src_frame_count);
+
+	ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+			      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, seq_info.min_src_frame_count);
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_prepare_fb(struct vpu_instance *inst)
+{
+	int ret;
+	unsigned int i;
+	unsigned int fb_num;
+	unsigned int mv_num;
+	unsigned int fb_stride;
+	unsigned int fb_height;
+	unsigned int luma_size;
+	unsigned int chroma_size;
+	struct enc_seq_info *seq_info = &inst->codec_info->enc_info.seq_info;
+
+	fb_num = seq_info->min_frame_buffer_count;
+	mv_num = seq_info->req_mv_buffer_count;
+
+	fb_stride = ALIGN(inst->codec_rect.width, W6_FBC_BUF_ALIGNMENT);
+	fb_height = ALIGN(inst->codec_rect.height, W6_FBC_BUF_ALIGNMENT);
+
+	luma_size = fb_stride * fb_height;
+	chroma_size = ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT) * fb_height;
+
+	for (i = 0; i < fb_num; i++) {
+		struct frame_buffer *frame = &inst->frame_buf[i];
+		struct vpu_buf *vframe = &inst->frame_vbuf[i];
+
+		vframe->size = luma_size + chroma_size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, vframe);
+		if (ret) {
+			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
+				vframe->size);
+			goto error;
+		}
+
+		frame->buf_y = vframe->daddr;
+		frame->buf_cb = vframe->daddr + luma_size;
+		frame->buf_cr = (dma_addr_t)-1;
+		frame->stride = fb_stride;
+		frame->height = fb_height;
+		frame->map_type = COMPRESSED_FRAME_MAP;
+	}
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_Y_TBL, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_C_TBL, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_MV_COL, mv_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_SUB_SAMPLE, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_vpu_enc_register_frame_buffer_ex(inst, fb_num, fb_stride,
+						     fb_height,
+						     COMPRESSED_FRAME_MAP);
+	if (ret) {
+		dev_err(inst->dev->dev, "register frame buffer fail %d\n", ret);
+		goto error;
+	}
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	wave6_vpu_record_performance_timestamps(inst);
+
+	return 0;
+
+error:
+	wave6_vpu_enc_release_fb(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_enc_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				     unsigned int *num_planes, unsigned int sizes[],
+				     struct device *alloc_devs[])
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane inst_format =
+		(V4L2_TYPE_IS_OUTPUT(q->type)) ? inst->src_fmt : inst->dst_fmt;
+	unsigned int i;
+
+	dev_dbg(inst->dev->dev, "%s: num_buffers %d num_planes %d type %d\n",
+		__func__, *num_buffers, *num_planes, q->type);
+
+	if (*num_planes) {
+		if (inst_format.num_planes != *num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < *num_planes; i++) {
+			if (sizes[i] < inst_format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = inst_format.num_planes;
+		for (i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "size[%d] : %d\n", i, sizes[i]);
+		}
+
+		if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+			struct v4l2_ctrl *ctrl;
+			unsigned int min_src_frame_count = 0;
+
+			ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+					      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT);
+			if (ctrl)
+				min_src_frame_count = v4l2_ctrl_g_ctrl(ctrl);
+
+			*num_buffers = max(*num_buffers, min_src_frame_count);
+		}
+	}
+
+	return 0;
+}
+
+static void wave6_vpu_enc_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		vbuf->sequence = inst->queued_src_buf_num++;
+
+		vpu_buf->ts_input = ktime_get_raw();
+		vpu_buf->force_key_frame = inst->enc_ctrls.force_key_frame;
+		inst->enc_ctrls.force_key_frame = false;
+		vpu_buf->force_frame_qp = !inst->enc_ctrls.frame_rc_enable;
+		if (vpu_buf->force_frame_qp) {
+			if (inst->std == W_AVC_ENC) {
+				vpu_buf->force_i_frame_qp = inst->enc_ctrls.h264.i_frame_qp;
+				vpu_buf->force_p_frame_qp = inst->enc_ctrls.h264.p_frame_qp;
+				vpu_buf->force_b_frame_qp = inst->enc_ctrls.h264.b_frame_qp;
+			} else if (inst->std == W_HEVC_ENC) {
+				vpu_buf->force_i_frame_qp = inst->enc_ctrls.hevc.i_frame_qp;
+				vpu_buf->force_p_frame_qp = inst->enc_ctrls.hevc.p_frame_qp;
+				vpu_buf->force_b_frame_qp = inst->enc_ctrls.hevc.b_frame_qp;
+			}
+		}
+	} else {
+		inst->queued_dst_buf_num++;
+	}
+
+	vpu_buf->consumed = false;
+	vpu_buf->used = false;
+	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+}
+
+static void wave6_vpu_enc_buf_finish(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+	struct v4l2_ctrl *ctrl;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return;
+
+	ctrl = v4l2_ctrl_find(inst->v4l2_fh.ctrl_handler, V4L2_CID_MPEG_VIDEO_AVERAGE_QP);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, vpu_buf->average_qp);
+}
+
+static int wave6_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	int ret = 0;
+
+	trace_wave6_vpu_start_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
+	if (inst->state == VPU_INST_STATE_NONE) {
+		ret = wave6_vpu_enc_create_instance(inst);
+		if (ret)
+			goto exit;
+	}
+
+	if (inst->state == VPU_INST_STATE_OPEN) {
+		ret = wave6_vpu_enc_initialize_instance(inst);
+		if (ret) {
+			wave6_vpu_enc_destroy_instance(inst);
+			goto exit;
+		}
+	}
+
+	if (inst->state == VPU_INST_STATE_INIT_SEQ) {
+		ret = wave6_vpu_enc_prepare_fb(inst);
+		if (ret) {
+			wave6_vpu_enc_destroy_instance(inst);
+			goto exit;
+		}
+	}
+
+exit:
+	if (ret)
+		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+
+	trace_wave6_vpu_stop_streaming(inst, V4L2_TYPE_IS_OUTPUT(q->type));
+
+	dev_dbg(inst->dev->dev, "[%d] %s, input %d, decode %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		inst->queued_src_buf_num, inst->sequence);
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		goto exit;
+
+	if (wave6_vpu_both_queues_are_streaming(inst))
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		wave6_vpu_reset_performance(inst);
+		inst->queued_src_buf_num = 0;
+		inst->processed_buf_num = 0;
+		inst->error_buf_num = 0;
+		inst->sequence = 0;
+		v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
+	} else {
+		inst->eos = false;
+		inst->queued_dst_buf_num = 0;
+	}
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_enc_destroy_instance(inst);
+
+exit:
+	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops wave6_vpu_enc_vb2_ops = {
+	.queue_setup = wave6_vpu_enc_queue_setup,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_queue = wave6_vpu_enc_buf_queue,
+	.buf_finish = wave6_vpu_enc_buf_finish,
+	.start_streaming = wave6_vpu_enc_start_streaming,
+	.stop_streaming = wave6_vpu_enc_stop_streaming,
+};
+
+static void wave6_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
+				     struct v4l2_pix_format_mplane *dst_fmt)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_RAW);
+	if (vpu_fmt) {
+		src_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		src_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt(src_fmt,
+				     W6_DEF_ENC_PIC_WIDTH, W6_DEF_ENC_PIC_HEIGHT);
+	}
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_CODEC);
+	if (vpu_fmt) {
+		dst_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		dst_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt(dst_fmt,
+				     W6_DEF_ENC_PIC_WIDTH, W6_DEF_ENC_PIC_HEIGHT);
+	}
+}
+
+static int wave6_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct vpu_instance *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->ops = &wave6_vpu_enc_vb2_ops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	src_vq->drv_priv = inst;
+	src_vq->lock = &inst->dev->dev_lock;
+	src_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->ops = &wave6_vpu_enc_vb2_ops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	dst_vq->drv_priv = inst;
+	dst_vq->lock = &inst->dev->dev_lock;
+	dst_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct vpu_instance_ops wave6_vpu_enc_inst_ops = {
+	.start_process = wave6_vpu_enc_start_encode,
+	.finish_process = wave6_vpu_enc_finish_encode,
+};
+
+static int wave6_vpu_open_enc(struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+	struct vpu_core_device *core = video_drvdata(filp);
+	struct vpu_instance *inst = NULL;
+	struct v4l2_ctrl_handler *v4l2_ctrl_hdl;
+	int ret;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+	v4l2_ctrl_hdl = &inst->v4l2_ctrl_hdl;
+
+	init_completion(&inst->irq_done);
+	inst->dev = core;
+	inst->type = VPU_INST_TYPE_ENC;
+	inst->ops = &wave6_vpu_enc_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data = &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh, filp);
+
+	inst->v4l2_fh.m2m_ctx =
+		v4l2_m2m_ctx_init(core->m2m_dev, inst, wave6_vpu_enc_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret = PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(v4l2_ctrl_hdl, 50);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE, 0,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1, 0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_5);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+			  0, 51, 1, 8);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+			  0, 51, 1, 51);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE,
+			       V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY, 0,
+			       V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE,
+			       V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR,
+			       BIT(V4L2_MPEG_VIDEO_HEVC_REFRESH_CRA),
+			       V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD,
+			  0, 2047, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH, 0,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_5_2, 0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_5_0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+			  0, 51, 1, 8);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+			  0, 51, 1, 51);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+			       V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY, 0,
+			       V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET,
+			  -12, 12, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+			       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC, 0,
+			       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+			  0, 2047, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE, 0, 1, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC,
+			       V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED, 0,
+			       V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH,
+			  0, 0xFFFF, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT,
+			  0, 0xFFFF, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_HFLIP,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_VFLIP,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_ROTATE,
+			  0, 270, 90, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
+			  0, 18750000, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_BITRATE,
+			  1, 240000000, 1, 2097152);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+			  0, 2047, 1, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
+			       V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB, 0,
+			       V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB,
+			  0, 0x3FFFF, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
+			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+			       BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD,
+			  0, 2160, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+			       BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT),
+			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, NULL,
+			  V4L2_CID_MPEG_VIDEO_AVERAGE_QP, 0, 51, 1, 0);
+
+	if (v4l2_ctrl_hdl->error) {
+		ret = -ENODEV;
+		goto err_m2m_release;
+	}
+
+	inst->v4l2_fh.ctrl_handler = v4l2_ctrl_hdl;
+	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
+
+	wave6_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->std = wave6_to_codec_std(inst->type, inst->dst_fmt.pixelformat);
+	wave6_update_crop_info(inst, 0, 0, inst->dst_fmt.width, inst->dst_fmt.height);
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	inst->enc_ctrls.frame_rate = 30;
+
+	return 0;
+
+err_m2m_release:
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+free_inst:
+	kfree(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_enc_release(struct file *filp)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(filp);
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
+	if (inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_enc_destroy_instance(inst);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh, filp);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	kfree(inst);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations wave6_vpu_enc_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_open_enc,
+	.release = wave6_vpu_enc_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = v4l2_m2m_fop_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+int wave6_vpu_enc_register_device(struct vpu_core_device *core)
+{
+	struct video_device *vdev_enc;
+	int ret;
+
+	vdev_enc = devm_kzalloc(core->v4l2_dev.dev, sizeof(*vdev_enc), GFP_KERNEL);
+	if (!vdev_enc)
+		return -ENOMEM;
+
+	core->video_dev_enc = vdev_enc;
+
+	strscpy(vdev_enc->name, VPU_ENC_DEV_NAME, sizeof(vdev_enc->name));
+	vdev_enc->fops = &wave6_vpu_enc_fops;
+	vdev_enc->ioctl_ops = &wave6_vpu_enc_ioctl_ops;
+	vdev_enc->release = video_device_release_empty;
+	vdev_enc->v4l2_dev = &core->v4l2_dev;
+	vdev_enc->vfl_dir = VFL_DIR_M2M;
+	vdev_enc->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_enc->lock = &core->dev_lock;
+	video_set_drvdata(vdev_enc, core);
+
+	ret = video_register_device(vdev_enc, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core)
+{
+	video_unregister_device(core->video_dev_enc);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
new file mode 100644
index 000000000000..0e3e5853cc06
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
@@ -0,0 +1,507 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 driver helper interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/clk.h>
+#include <linux/math64.h>
+#include "wave6-vpu.h"
+#include "wave6-vpu-core.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
+
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height)
+{
+	const struct v4l2_format_info *fmt_info;
+	unsigned int stride_y;
+	int i;
+
+	pix_mp->width = width;
+	pix_mp->height = height;
+	pix_mp->flags = 0;
+	pix_mp->field = V4L2_FIELD_NONE;
+	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
+
+	fmt_info = v4l2_format_info(pix_mp->pixelformat);
+	if (!fmt_info) {
+		pix_mp->plane_fmt[0].bytesperline = 0;
+		if (!pix_mp->plane_fmt[0].sizeimage)
+			pix_mp->plane_fmt[0].sizeimage = width * height;
+
+		return;
+	}
+
+	stride_y = width * fmt_info->bpp[0];
+	if (pix_mp->plane_fmt[0].bytesperline <= W6_MAX_PIC_STRIDE)
+		stride_y = max(stride_y, pix_mp->plane_fmt[0].bytesperline);
+	stride_y = round_up(stride_y, W6_PIC_STRIDE_ALIGNMENT);
+	pix_mp->plane_fmt[0].bytesperline = stride_y;
+	pix_mp->plane_fmt[0].sizeimage = stride_y * height;
+
+	stride_y = DIV_ROUND_UP(stride_y, fmt_info->bpp[0]);
+
+	for (i = 1; i < fmt_info->comp_planes; i++) {
+		unsigned int stride_c, sizeimage_c;
+
+		stride_c = DIV_ROUND_UP(stride_y, fmt_info->hdiv) *
+			   fmt_info->bpp[i];
+		sizeimage_c = stride_c * DIV_ROUND_UP(height, fmt_info->vdiv);
+
+		if (fmt_info->mem_planes == 1) {
+			pix_mp->plane_fmt[0].sizeimage += sizeimage_c;
+		} else {
+			pix_mp->plane_fmt[i].bytesperline = stride_c;
+			pix_mp->plane_fmt[i].sizeimage = sizeimage_c;
+		}
+	}
+}
+
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf, unsigned int plane_no)
+{
+	return vb2_dma_contig_plane_dma_addr(&buf->vb2_buf, plane_no) +
+			buf->planes[plane_no].data_offset;
+}
+
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vb2_v4l2_buffer *dst_buf = NULL;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		if (addr == wave6_get_dma_addr(vb2_v4l2_buf, 0)) {
+			dst_buf = vb2_v4l2_buf;
+			break;
+		}
+	}
+
+	return dst_buf;
+}
+
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt)
+{
+	enum codec_std std = STD_UNKNOWN;
+
+	if (v4l2_pix_fmt == V4L2_PIX_FMT_H264)
+		std = (type == VPU_INST_TYPE_DEC) ? W_AVC_DEC : W_AVC_ENC;
+	else if (v4l2_pix_fmt == V4L2_PIX_FMT_HEVC)
+		std = (type == VPU_INST_TYPE_DEC) ? W_HEVC_DEC : W_HEVC_ENC;
+
+	return std;
+}
+
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state)
+{
+	switch (state) {
+	case VPU_INST_STATE_NONE:
+		return "none";
+	case VPU_INST_STATE_OPEN:
+		return "open";
+	case VPU_INST_STATE_INIT_SEQ:
+		return "init_seq";
+	case VPU_INST_STATE_PIC_RUN:
+		return "pic_run";
+	case VPU_INST_STATE_SEEK:
+		return "seek";
+	case VPU_INST_STATE_STOP:
+		return "stop";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_instance_transition(struct vpu_instance *inst,
+						enum vpu_instance_state next)
+{
+	bool is_decoder = (inst->type == VPU_INST_TYPE_DEC);
+
+	switch (inst->state) {
+	case VPU_INST_STATE_NONE:
+		/* to OPEN: instance created */
+		if (next == VPU_INST_STATE_OPEN)
+			return true;
+		break;
+	case VPU_INST_STATE_OPEN:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to INIT_SEQ: sequence header parsed */
+			/* to SEEK: output stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_INIT_SEQ ||
+			    next == VPU_INST_STATE_SEEK)
+				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to INIT_SEQ: encoder parameter configured */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_INIT_SEQ)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_INIT_SEQ:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to PIC_RUN: frame buffers registered */
+			/* to SEEK: output stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_PIC_RUN ||
+			    next == VPU_INST_STATE_SEEK)
+				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to PIC_RUN: frame buffers registered */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_PIC_RUN)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_PIC_RUN:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to INIT_SEQ: new sequence header parsed */
+			/* to SEEK: output stop_streaming called */
+			/* to STOP: decode command failed */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_INIT_SEQ ||
+			    next == VPU_INST_STATE_SEEK ||
+			    next == VPU_INST_STATE_STOP)
+				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to STOP: */
+			/*   encode command failed, encode frame failed */
+			/*   V4L2_ENC_CMD_STOP called, stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_STOP)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_SEEK:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to OPEN/INIT_SEQ/PIC_RUN/STOP: */
+			/*   previous state restored on output start_streaming */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_OPEN ||
+			    next == VPU_INST_STATE_INIT_SEQ ||
+			    next == VPU_INST_STATE_PIC_RUN ||
+			    next == VPU_INST_STATE_STOP)
+				return true;
+		}
+		break;
+	case VPU_INST_STATE_STOP:
+		if (is_decoder) {
+			/* to NONE: instance destroyed */
+			/* to SEEK: output stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_SEEK)
+				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to PIC_RUN: last frame encoded */
+			/* to STOP: */
+			/*   encode command failed, encode frame failed */
+			/*   V4L2_ENC_CMD_STOP called, stop_streaming called */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_PIC_RUN ||
+			    next == VPU_INST_STATE_STOP)
+				return true;
+		}
+		break;
+	}
+
+	dev_err(inst->dev->dev, "[%d] invalid transition: %s -> %s\n",
+		inst->id,
+		wave6_vpu_instance_state_name(inst->state),
+		wave6_vpu_instance_state_name(next));
+
+	return false;
+}
+
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state)
+{
+	if (!wave6_vpu_valid_instance_transition(inst, state))
+		return;
+
+	trace_wave6_vpu_set_state(inst, state);
+
+	dev_dbg(inst->dev->dev, "[%d] %s -> %s\n",
+		inst->id,
+		wave6_vpu_instance_state_name(inst->state),
+		wave6_vpu_instance_state_name(state));
+
+	inst->state = state;
+}
+
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle)
+{
+	unsigned long rate;
+
+	if (!core->num_clks || !core->clks)
+		return 0;
+
+	rate = clk_get_rate(core->clks[0].clk);
+
+	return (cycle * NSEC_PER_SEC) / rate;
+}
+
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&inst->irq_done,
+					  msecs_to_jiffies(timeout));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	reinit_completion(&inst->irq_done);
+
+	return 0;
+}
+
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub)
+{
+	struct vpu_instance *inst = wave6_fh_to_vpu_inst(fh);
+	bool is_decoder = inst->type == VPU_INST_TYPE_DEC;
+
+	dev_dbg(inst->dev->dev, "%s: [%s] type: %d id: %d | flags: %d\n",
+		__func__, is_decoder ? "decoder" : "encoder", sub->type,
+		sub->id, sub->flags);
+
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		if (is_decoder)
+			return v4l2_src_change_event_subscribe(fh, sub);
+		return -EINVAL;
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *buf;
+	int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(type)) {
+		while ((buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx)))
+			v4l2_m2m_buf_done(buf, state);
+	} else {
+		while ((buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx))) {
+			for (i = 0; i < inst->dst_fmt.num_planes; i++)
+				vb2_set_plane_payload(&buf->vb2_buf, i, 0);
+			v4l2_m2m_buf_done(buf, state);
+		}
+	}
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+	u32 num = 0;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+		if (vpu_buf->consumed)
+			num++;
+	}
+
+	return num;
+}
+
+static bool wave6_vpu_check_fb_available(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->used)
+			return true;
+	}
+
+	return false;
+}
+
+static int wave6_vpu_job_ready(void *priv)
+{
+	struct vpu_instance *inst = priv;
+
+	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
+		inst->id, __func__, inst->state);
+
+	if (inst->state == VPU_INST_STATE_OPEN)
+		return 1;
+	if (inst->state < VPU_INST_STATE_PIC_RUN)
+		return 0;
+	if (inst->state == VPU_INST_STATE_STOP && inst->eos)
+		return 0;
+	if (!wave6_vpu_check_fb_available(inst))
+		return 0;
+
+	return 1;
+}
+
+static void wave6_vpu_device_run_timeout(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct vpu_core_device *core = container_of(dwork, struct vpu_core_device, task_timer);
+	struct vpu_instance *inst = v4l2_m2m_get_curr_priv(core->m2m_dev);
+	struct vb2_v4l2_buffer *src_buf = NULL;
+	struct vb2_v4l2_buffer *dst_buf = NULL;
+
+	if (!inst)
+		return;
+
+	dev_err(inst->dev->dev, "[%d] sequence %d timeout\n", inst->id, inst->sequence);
+	src_buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+	if (src_buf) {
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		if (inst->type == VPU_INST_TYPE_DEC)
+			inst->processed_buf_num++;
+		inst->error_buf_num++;
+	}
+
+	dst_buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+	if (dst_buf)
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+
+	vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+	vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+
+	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+static void wave6_vpu_device_run(void *priv)
+{
+	struct vpu_instance *inst = priv;
+	int ret = -EINVAL;
+
+	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
+		inst->id, __func__, inst->state);
+
+	if (inst->state < VPU_INST_STATE_PIC_RUN && inst->ops->prepare_process) {
+		ret = inst->ops->prepare_process(inst);
+
+		v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+		return;
+	}
+
+	ret = inst->ops->start_process(inst);
+	if (!ret)
+		schedule_delayed_work(&inst->dev->task_timer, msecs_to_jiffies(W6_VPU_TIMEOUT));
+	else
+		v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+void wave6_vpu_finish_job(struct vpu_instance *inst)
+{
+	cancel_delayed_work(&inst->dev->task_timer);
+	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
+}
+
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst)
+{
+	if (WARN_ON(!inst))
+		return;
+
+	if (inst->state == VPU_INST_STATE_NONE &&
+	    !inst->performance.ts_start)
+		inst->performance.ts_start = ktime_get_raw();
+
+	if (inst->state == VPU_INST_STATE_PIC_RUN &&
+	    !inst->performance.ts_first)
+		inst->performance.ts_first = ktime_get_raw();
+}
+
+void wave6_vpu_handle_performance(struct vpu_instance *inst, struct vpu_buffer *vpu_buf)
+{
+	s64 latency, time_spent;
+
+	if (WARN_ON(!inst || !vpu_buf))
+		return;
+
+	inst->performance.ts_last = vpu_buf->ts_output;
+
+	latency = vpu_buf->ts_output - vpu_buf->ts_input;
+	time_spent = vpu_buf->ts_finish - vpu_buf->ts_start;
+
+	if (!inst->performance.latency_first)
+		inst->performance.latency_first = latency;
+	inst->performance.latency_max = max_t(s64, latency, inst->performance.latency_max);
+
+	if (!inst->performance.min_process_time)
+		inst->performance.min_process_time = time_spent;
+	else if (inst->performance.min_process_time > time_spent)
+		inst->performance.min_process_time = time_spent;
+
+	if (inst->performance.max_process_time < time_spent)
+		inst->performance.max_process_time = time_spent;
+
+	inst->performance.total_sw_time += time_spent;
+	inst->performance.total_hw_time += vpu_buf->hw_time;
+}
+
+void wave6_vpu_reset_performance(struct vpu_instance *inst)
+{
+	if (WARN_ON(!inst))
+		return;
+
+	if (inst->processed_buf_num) {
+		s64 tmp;
+		s64 fps_act, fps_sw, fps_hw;
+		struct vpu_performance_info *perf = &inst->performance;
+
+		tmp = MSEC_PER_SEC * inst->processed_buf_num;
+		fps_act = DIV_ROUND_CLOSEST(tmp, (perf->ts_last - perf->ts_first) / NSEC_PER_MSEC);
+		fps_sw = DIV_ROUND_CLOSEST(tmp, perf->total_sw_time / NSEC_PER_MSEC);
+		fps_hw = DIV_ROUND_CLOSEST(tmp, perf->total_hw_time / NSEC_PER_MSEC);
+		dev_dbg(inst->dev->dev,
+			"[%d] fps actual: %lld, sw: %lld, hw: %lld, latency(ms) %llu.%06llu\n",
+			inst->id, fps_act, fps_sw, fps_hw,
+			perf->latency_first / NSEC_PER_MSEC,
+			perf->latency_first % NSEC_PER_MSEC);
+	}
+
+	memset(&inst->performance, 0, sizeof(inst->performance));
+}
+
+static const struct v4l2_m2m_ops wave6_vpu_m2m_ops = {
+	.device_run = wave6_vpu_device_run,
+	.job_ready = wave6_vpu_job_ready,
+};
+
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core)
+{
+	core->m2m_dev = v4l2_m2m_init(&wave6_vpu_m2m_ops);
+	if (IS_ERR(core->m2m_dev)) {
+		dev_err(core->dev, "v4l2_m2m_init fail: %ld\n", PTR_ERR(core->m2m_dev));
+		return PTR_ERR(core->m2m_dev);
+	}
+
+	INIT_DELAYED_WORK(&core->task_timer, wave6_vpu_device_run_timeout);
+
+	return 0;
+}
+
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core)
+{
+	v4l2_m2m_release(core->m2m_dev);
+}
-- 
2.31.1


