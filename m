Return-Path: <linux-media+bounces-30694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7248A9646E
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F063A4B28
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A9220C000;
	Tue, 22 Apr 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="CwN4R9+H"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022082.outbound.protection.outlook.com [40.107.43.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAADC202C4E;
	Tue, 22 Apr 2025 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314311; cv=fail; b=f7Kc4rLGkeRcclZylgVje/MA9PQ7uBiyjpeuJrTKKC9xWS74aamzD3cBkrWGka6UO5tZwl2Eb65CA1jxtkJ+ErYxmbtzauaiaN2dbZ7Xym0Xv0odjttJNbkb6dXNDt/H94l5m6doLCdXioCemlBYg9aYUUj/0gBLkHL4Nv1F9lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314311; c=relaxed/simple;
	bh=7oq9Vh5+ywyAra2ZAMZktkNPS4Jh8gTl1+BNBtgGuYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cMvXWHidjs1dUKJvbNAKFB5QVfQMK2f0UaX0sm29tKGevrqVaUf9HXCxfB82FmcSWWvkZPCEEFFTDytpVaLs3y+eTzNCtlz6phONwMDq4heJqX++6/juACrHw1H1BoKbROiPeDEmrWllk97gMxZ1hbZNIlGprvq4Rw1am/h+giQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=CwN4R9+H; arc=fail smtp.client-ip=40.107.43.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jx4oMu0hSstTN0YPE3SVbNE4aiRvFvLEIM5Ri/Arh3XnEazUl9nS35QFKx9urlcM3mXNuDdWYSl8cT79Zwtb4S6cDN7ThPUG7FW4oihthKOMAPJ/U/SRxIBwa2VIPC60aEcW4bnntFcUcOTjN2PWulX4tsNWNtGCoSudSZPUe1Hg+ZPEFAcT/BGa93a8wtR9kavnBKTexRVAqViRebufRpG10T45BoyUNcHD8KSPpKqJ3w7jgR6vy8agfs3TAZBW8eWFUbv0DSqhsTyeCWDNapg56ujUOj1/qINOouU9zQY2yHtzE1ObIJR/nJ+mDC2JGxiV2XSVXy7kGI8QqHeF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHr6mqUeabDL4ryu1CgGuyGdJZ8Goyvo6B85wkWruto=;
 b=Ay1l2MFgdCs7q+uDdydGJhIstuDuWoe2rf5X49yqeZ2ip5uJ7AxwZ0eu6hmJTtVIIJt1id0bswmOmIYQ/C8yIV539q2hHhrFm6nxHC9wphXhxFVu7VaJj6n8NxPSS+YeJyawGzddfvtoFOarPDflOdmvr2iyUxwk/uoePonWTcLnq1ScKgJnZK5urnvmceH+NPLtIyUBFxJAS/6G0eZHsS1B2dU3T6TOZm44155dUJFJSsBsT5fXjQe/ZC/fQ8H1xCGwYfx5qgVFbwfjpCzHTu1RbVMymPxRN/nfjAPglZnx0Rn0U6GtqezNHdVUMCcEvpN2EjHxa7BZcHx4nUxytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHr6mqUeabDL4ryu1CgGuyGdJZ8Goyvo6B85wkWruto=;
 b=CwN4R9+Hvawu3duAw5uJzk8VHxuhogFbKdQkx1Cp8J1HUFtKdlZaBxyXffLeYkkzFaQUNLHrxk8lCEqlC3y1AQMns3MhHOSqTXoP3XqwC/OR5d+Dv8ihDbwmxzpcqwDRD7is7gbkoKuA9BUAlYS/B9V4w1SK/qlcC6qZi+lyGDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1521.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.34; Tue, 22 Apr 2025 09:31:37 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 09:31:37 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	marex@denx.de,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v2 4/8] media: chips-media: wave6: Add Wave6 control driver
Date: Tue, 22 Apr 2025 18:31:15 +0900
Message-Id: <20250422093119.595-5-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422093119.595-1-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0120.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1521:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a36259-6376-4550-b6c7-08dd81807a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F2pHQkVTTSXewRyt7ERLHjZmaCvrfduhIjCeZyiB3w/ok0ghKpusTvPM4WC4?=
 =?us-ascii?Q?JO/OTqRyiOl8nIKF5RfAwMwWXBNaGaFVikVdHnJHJbzOocIZySpt3VkJ4pls?=
 =?us-ascii?Q?3JYpUB6oDcIRVIYbi8AFIjWmfAVTl0TpARNaJvFE9YsX1/FCKNM/9+s4YBBl?=
 =?us-ascii?Q?cMgP7L94YW84JC1O+j4MTj2Q+Xw9yO4JRngftLTwBWPn2rYkk5Sj305eOGIc?=
 =?us-ascii?Q?+Hk35yiOFwuDA4npnJ76qFJYGtmIc+nQxQ1FGyjuqQje0zDXkp+SZvXllRTK?=
 =?us-ascii?Q?YOi8SzvyDkA/DT9sfKNCo8rca3z9NbuHoQW2prFFZ2RnWKmHdSg1MZXsyK76?=
 =?us-ascii?Q?qeF27f2z/c+FzhsRCcL+XB60i//y5NluvKXSXFrP4TC/hSbwprsE5Y8EWNtV?=
 =?us-ascii?Q?oo8Bmb9uHvI2c4xEIwokoP5FXCL3VGzxa7n0YIoJRKxcK5cCTgllpXHyV9ef?=
 =?us-ascii?Q?naXVOFDVAAWuZyWn9qpnuzz902E/RNHoVGW/lToXf0IXrjCLYq47+Y2NVaUO?=
 =?us-ascii?Q?OXntpa6RMnx03uczSHDyvwkSt4mWB8Sd7YMA/1QxGlVIiP2Jd224n37aCUa8?=
 =?us-ascii?Q?HxB7vYULUnfOZPV/uRvMB6xt5j4JYl5ZCCwu0FnC4ITcSdtkdgYyRKxRqOeF?=
 =?us-ascii?Q?G46FFkT83u6IQrj7utUZLa4hjo6M81ew7fBd5ahhoCJps7n6QCN/9o2tlRHi?=
 =?us-ascii?Q?XTot30h1HqLoaCsZCMS/TQYjZngR+DHi5WFw0bfggWluI5AvnI7hZ8vJKG6D?=
 =?us-ascii?Q?mhqDwqqWZ/DVJdDsldEk6wfUqFZgq+hgG7+r9hsnJQZVnFK0f7CMOSshmEi0?=
 =?us-ascii?Q?3aGQGs+GiiDdCF64A3BKuMZLItv82U5/u97Kc8LvDgXdZcZwb1n/9WkfzlTv?=
 =?us-ascii?Q?8Z+G/na9HLv+6XQeCktWk9+aWJX5w6cUnCRmCgwcKpnE9pS/qAtGa05dtqCh?=
 =?us-ascii?Q?FycYue5kgY1lzECcw6eo+jdSgJRteC1R1PEfSTjwnXYzUs7pM7tCTL8mXjHw?=
 =?us-ascii?Q?a33iQEPzSaV2MdsJx/LJwNDONSNLFleBpc4Tcf7MRXiaAvR81beEvnOlT29G?=
 =?us-ascii?Q?P0uUGkqrhHxgUs84jt5xZRa7JwRKuICkfR0qlG0k40KvRyh9T266uheg3l61?=
 =?us-ascii?Q?L0IXiTJ0srBGv12yvIplesGCW0I+T25KDo/w0N4GbrsDBIy2Gp5QaLGLuLoy?=
 =?us-ascii?Q?3zN58HTJFEXCOoT98emDLtNROwPn0MJYOaGNo/1ziBVrSpbtuJYlGdZmJsbI?=
 =?us-ascii?Q?8iJlojE2/vyTaHWaKmQqSkPrT+o34GbRzccmZZ5s8FreaGvFOLkjFyobUFRZ?=
 =?us-ascii?Q?qlW0B8m1PotmqIdgeYkE9VghjdRWCiIhdwglP2fsUPW5k5ZrhkQs6DEiX01E?=
 =?us-ascii?Q?GOMkV4FPfyNKYU57OA7PBamCkA4RjUxyhFNHxUgLNvypmeju/7NCgY0lM3jD?=
 =?us-ascii?Q?QBN2/u0evPSHujkzAeIXocnplB+7WXN4JDalMbIg2oKl3aWkwPA5KA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?91IZINNNrE5dxVHftXHHeATSPgUl6CxC1gAH5GB9XF2e50EKzrVnQV/MdJxA?=
 =?us-ascii?Q?wPgX+Gq6LNLrQZc63tJUx2tlJ20pXHVd54dX56neGOHdrKDKI0a3Ja/w7dG/?=
 =?us-ascii?Q?6QiR3KaZa7BEEZ5Tn+mwSA/mEPMgHtbR9eA6Q3aZ9E+LVNn6C+Q3+37aJaEn?=
 =?us-ascii?Q?9WxdzX2SDBUcZWSEcPT/Vtt+8IqEb6Yb0tT2lJlm17zV9F50FtSwb9eu1l6A?=
 =?us-ascii?Q?aPj0suuiwb+69AAMXZwMhztVgUeZ7nWnA2cN+xeYfk7wMU0K4FNZr2HNCtPv?=
 =?us-ascii?Q?6J0tDpirfMQKBDoPM61LxCV5+6M9pJyvnwz8ecTqYbvLnX9h0OMpFoZfPmBl?=
 =?us-ascii?Q?2TuU2mIKDASQZgk+HEjWFYmrtwnm7KarrzdOtOnwdGD2dQ0mDKCH0jT9h6FJ?=
 =?us-ascii?Q?cuKoFzeUmA70i5Wogw4rdB1n6J9nQHAi8x0Rs44yF2Yl9t5Xul2GuyydF4K2?=
 =?us-ascii?Q?I2ozQS8S3mSaotMeP3U/1HHFh5DgneXU7ms/zNXl0QmoAn5vuuCw8YBDfv9s?=
 =?us-ascii?Q?U5p054h8STnyIPYFobtxDfevjDLhi8A++3SQNoQh2CRvSRb8RpG2QUOWn3cf?=
 =?us-ascii?Q?qnBMcfgceP4B5bNmVdu1SjcLJehdGHcLzUHrR/Np6VWnq81I7z3lbrWU63co?=
 =?us-ascii?Q?TOQvKoAqnNo1AGxCyLyJozCwiR5Yi5bSdz745n9jc4dTr0rnYzpOjScxi367?=
 =?us-ascii?Q?SG9GwrvbXuKtGd8ajC47xAky30D7o6Ws0bl5W7klUg9pDnaiSf1A+8O8t4xf?=
 =?us-ascii?Q?j0+EqCV8VrkrabX8mBFVgLfue7FtfB2hCpqfzeELSVDOvdlp5ieJsJaNl3dO?=
 =?us-ascii?Q?1KABCNf+IhaV/j8lMNtVDQeye3lqqsGRW3mKK4+PBgFASHHHbi4kMC2R2aP6?=
 =?us-ascii?Q?57ML2FeOyiyCKOgfc1kFuSMPnv53Kn+Txv38XJo8x8LddnQ8VeAzoMbMupev?=
 =?us-ascii?Q?iKMFtuC7F+GM9vof0CspZxr/WsFyKGRLnp4WaZRb20jSudXJ7biP6sDv3CRE?=
 =?us-ascii?Q?zgwz0sjuRgtwPgfRzRi5Lfbqnz14S9spRFbLuuALsngQhfKVEgkrYDa+N0GX?=
 =?us-ascii?Q?G0x+Sj+25MJBvn8M4/1lvZCG/j0M0o5nA+BJy/STBvYpiYon18Hyr/PnrQT0?=
 =?us-ascii?Q?Fkt/Xuc2glzQZvbNVc/vgyO7oxE/w1nHml0cZ7+Xq8DNlpQGL15yLaPkh+8H?=
 =?us-ascii?Q?w/i1/Xi0/y5COekP0OYI5SrWHgh03/ej8EhcZ0lwD+tKs24BCEjj0Lqti+60?=
 =?us-ascii?Q?NIOZSoNIZdSw9QeX4o9+pk+BgWSp4iYg3TsegB4qgzza5OxD5axF8be8MuhJ?=
 =?us-ascii?Q?FGBy0U+bZK/E9+OpXKw+81fU8KMZXk0NQ2HGMROlvnvONouZMuJ4d5qeU38i?=
 =?us-ascii?Q?LMZvFD+o4Om+yqJ/ObCVIBb3RqIVeHbc8ykcP58+91tvEu44UbhnvaXI90fe?=
 =?us-ascii?Q?2Jo6KtL2EVNqRTx+hHO9KyzAL/r0Nx93j2D/hxyQJbY59odASpYyJIb4QwU3?=
 =?us-ascii?Q?PJhYFQ/TXxrt3CxCxSn0A7769Ai1wuqkF7Q0Syz+FMRS4idt/dWPv1Y36ahS?=
 =?us-ascii?Q?uGDmVBuBFzX8qDeiHL2ToB1wi7f5lfEuCm2CFLBOtzjy9PA79Hf+4OFqNanb?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a36259-6376-4550-b6c7-08dd81807a87
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:31:36.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fv+c5FqO8WKMuMpVVZ4zgxvmaUIwb49h+ReppX5nK8lDCxND64NDWCmd4Aq7Moo2idftryxlP0CoPx5nhVFzXx21XgyYlpc/1sx83P/k1WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1521

This adds the control driver for the Chips&Media Wave6 video codec IP.

The control region manages shared resources such as firmware loading,
firmware memory allocation, and synchronization required by the core.
It is a functional sub-device of the main Wave6 driver and cannot
operate independently.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/chips-media/wave6/Kconfig  |  11 +
 .../media/platform/chips-media/wave6/Makefile |   3 +
 .../chips-media/wave6/wave6-regdefine.h       | 675 ++++++++++++++
 .../chips-media/wave6/wave6-vpu-ctrl.c        | 860 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |  84 ++
 5 files changed, 1633 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h

diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
index 3d7369ca690c..9ca428f9d20c 100644
--- a/drivers/media/platform/chips-media/wave6/Kconfig
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -22,3 +22,14 @@ config VIDEO_WAVE6_VPU_SUPPORT_FOLLOWER
 	default n
 	help
 	  Indicates whether the VPU domain power always on.
+
+config VIDEO_WAVE6_VPU_CTRL
+	tristate "Chips&Media Wave6 Codec Control Driver"
+	depends on VIDEO_WAVE6_VPU
+	default VIDEO_WAVE6_VPU if ARCH_MXC || COMPILE_TEST
+	help
+	  Chips&Media Wave6 control driver.
+	  The control driver manages shared resources such as
+	  firmware memory.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6-ctrl.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 255fc90bc642..7bbc8615c5b9 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -2,3 +2,6 @@
 
 wave6-objs += wave6-vpu.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
+
+wave6-ctrl-objs += wave6-vpu-ctrl.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU_CTRL) += wave6-ctrl.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
new file mode 100644
index 000000000000..05d563cf9d55
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -0,0 +1,675 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 register definitions
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_REGDEFINE_H__
+#define __WAVE6_REGDEFINE_H__
+
+enum wave6_command {
+	W6_CMD_INIT_VPU		= 0x0001,
+	W6_CMD_WAKEUP_VPU	= 0x0002,
+	W6_CMD_SLEEP_VPU	= 0x0004,
+	W6_CMD_CREATE_INSTANCE	= 0x0008,
+	W6_CMD_FLUSH_INSTANCE	= 0x0010,
+	W6_CMD_DESTROY_INSTANCE	= 0x0020,
+	W6_CMD_INIT_SEQ		= 0x0040,
+	W6_CMD_SET_FB		= 0x0080,
+	W6_CMD_DEC_PIC		= 0x0100,
+	W6_CMD_ENC_PIC		= 0x0100,
+	W6_CMD_ENC_SET_PARAM	= 0x0200,
+	W6_CMD_DEC_SET_DISP	= 0x0400,
+	W6_CMD_INIT_WORK_BUF	= 0x1000,
+	W6_CMD_QUERY		= 0x4000,
+};
+
+enum wave6_init_seq_option {
+	W6_INIT_SEQ_OPT_NORMAL		= 1,
+	W6_INIT_SEQ_OPT_W_THUMBNAIL	= 17,
+};
+
+enum wave6_set_param_option {
+	W6_SET_PARAM_OPT_COMMON		= 0,
+	W6_SET_PARAM_OPT_CHANGE_PARAM	= 1,
+};
+
+enum wave6_dec_pic_option {
+	W6_DEC_PIC_OPT_NORMAL		= 0,
+	W6_DEC_PIC_OPT_W_THUMBNAIL	= 16,
+	W6_DEC_PIC_OPT_SKIP_NON_IRAP	= 17,
+	W6_DEC_PIC_OPT_SKIP_NON_REF_PIC	= 19,
+};
+
+enum wave6_enc_pic_option {
+	W6_ENC_PIC_OPT_HEADER_IMPLICIT	= 1,
+	W6_ENC_PIC_OPT_VCL		= 2,
+};
+
+enum wave6_query_option {
+	W6_QUERY_OPT_GET_VPU_INFO	= 0,
+	W6_QUERY_OPT_GET_RESULT		= 2,
+	W6_QUERY_OPT_GET_FLUSH_CMD_INFO	= 10,
+};
+
+enum wave6_interrupt_bit {
+	W6_INT_BIT_INIT_VPU		= 0,
+	W6_INT_BIT_WAKEUP_VPU		= 1,
+	W6_INT_BIT_SLEEP_VPU		= 2,
+	W6_INT_BIT_CREATE_INSTANCE	= 3,
+	W6_INT_BIT_FLUSH_INSTANCE	= 4,
+	W6_INT_BIT_DESTROY_INSTANCE	= 5,
+	W6_INT_BIT_INIT_SEQ		= 6,
+	W6_INT_BIT_SET_FB		= 7,
+	W6_INT_BIT_DEC_PIC		= 8,
+	W6_INT_BIT_ENC_PIC		= 8,
+	W6_INT_BIT_ENC_SET_PARAM	= 9,
+	W6_INT_BIT_SET_DISP		= 10,
+	W6_INT_BIT_REQ_WORK_BUF		= 12,
+	W6_INT_BIT_BSBUF_ERROR		= 15,
+};
+
+enum wave6_param_change_enable_bit {
+	W6_PARAM_CHANGE_ENABLE_BIT_RC_TARGET_RATE = 10
+};
+
+#define W6_REG_BASE	0x00000000
+#define W6_CMD_REG_BASE	0x00000200
+#define W6_CMD_REG_END	0x00000600
+
+#define W6_VPU_VCPU_CUR_PC                            (W6_REG_BASE + 0x0004)
+#define W6_VPU_VINT_REASON_CLR                        (W6_REG_BASE + 0x0034)
+#define W6_VPU_HOST_INT_REQ                           (W6_REG_BASE + 0x0038)
+#define W6_VPU_VINT_CLEAR                             (W6_REG_BASE + 0x003C)
+#define W6_VPU_VPU_INT_STS                            (W6_REG_BASE + 0x0044)
+#define W6_VPU_VINT_ENABLE                            (W6_REG_BASE + 0x0048)
+#define W6_VPU_VINT_REASON                            (W6_REG_BASE + 0x004C)
+#define W6_VPU_REMAP_CTRL_GB                          (W6_REG_BASE + 0x0060)
+#define W6_VPU_REMAP_VADDR_GB                         (W6_REG_BASE + 0x0064)
+#define W6_VPU_REMAP_PADDR_GB                         (W6_REG_BASE + 0x0068)
+#define W6_VPU_REMAP_CORE_START_GB                    (W6_REG_BASE + 0x006C)
+#define W6_VPU_BUSY_STATUS                            (W6_REG_BASE + 0x0070)
+#define W6_VPU_RET_PRODUCT_VERSION                    (W6_REG_BASE + 0x0094)
+
+/* COMMON */
+#define W6_COMMAND_GB                                 (W6_REG_BASE + 0x104)
+#define W6_COMMAND                                    (W6_REG_BASE + 0x200)
+#define W6_QUERY_OPTION                               (W6_REG_BASE + 0x204)
+#define W6_CMD_INSTANCE_INFO                          (W6_REG_BASE + 0x210)
+#define W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0            (W6_REG_BASE + 0x364)
+#define W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0            (W6_REG_BASE + 0x368)
+#define W6_CMD_SET_CTRL_WORK_BUF_ADDR                 (W6_REG_BASE + 0x5F0)
+#define W6_CMD_SET_CTRL_WORK_BUF_SIZE                 (W6_REG_BASE + 0x5F4)
+#define W6_RET_SUCCESS                                (W6_REG_BASE + 0x208)
+#define W6_RET_FAIL_REASON                            (W6_REG_BASE + 0x20C)
+#define W6_RET_INSTANCE_ID                            (W6_REG_BASE + 0x220)
+#define W6_RET_CQ_IN_TICK                             (W6_REG_BASE + 0x23C)
+#define W6_RET_FW_RUN_TICK                            (W6_REG_BASE + 0x240)
+#define W6_RET_HW_RUN_TICK                            (W6_REG_BASE + 0x244)
+#define W6_RET_HW_DONE_TICK                           (W6_REG_BASE + 0x248)
+#define W6_RET_FW_DONE_TICK                           (W6_REG_BASE + 0x24C)
+#define W6_RET_RQ_OUT_TICK                            (W6_REG_BASE + 0x250)
+
+/* COMMON - QUERY : GET_VPU_INFO */
+#define W6_RET_FW_VERSION                             (W6_REG_BASE + 0x300)
+#define W6_RET_PRODUCT_NAME                           (W6_REG_BASE + 0x304)
+#define W6_RET_PRODUCT_VERSION                        (W6_REG_BASE + 0x308)
+#define W6_RET_STD_DEF0                               (W6_REG_BASE + 0x30C)
+#define W6_RET_STD_DEF1                               (W6_REG_BASE + 0x310)
+#define W6_RET_CONF_FEATURE                           (W6_REG_BASE + 0x314)
+#define W6_RET_CONF_DATE                              (W6_REG_BASE + 0x318)
+#define W6_RET_CONF_REVISION                          (W6_REG_BASE + 0x31C)
+#define W6_RET_CONF_TYPE                              (W6_REG_BASE + 0x320)
+#define W6_RET_FW_API_VERSION                         (W6_REG_BASE + 0x32C)
+#define W6_RET_SHA_ID                                 (W6_REG_BASE + 0x330)
+
+/* DECODER - CREATE_INSTANCE */
+#define W6_CMD_DEC_CREATE_INST_BS_PARAM               (W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_CREATE_INST_ADDR_EXT               (W6_REG_BASE + 0x318)
+#define W6_CMD_DEC_CREATE_INST_DISP_MODE              (W6_REG_BASE + 0x31C)
+#define W6_CMD_DEC_CREATE_INST_CORE_INFO              (W6_REG_BASE + 0x330)
+#define W6_CMD_DEC_CREATE_INST_PRIORITY               (W6_REG_BASE + 0x334)
+#define W6_CMD_DEC_CREATE_INST_TEMP_BASE              (W6_REG_BASE + 0x348)
+#define W6_CMD_DEC_CREATE_INST_TEMP_SIZE              (W6_REG_BASE + 0x34C)
+#define W6_CMD_DEC_CREATE_INST_TIMEOUT_CYCLE_COUNT    (W6_REG_BASE + 0x3A8)
+
+/* DECODER - INIT_SEQ */
+#define W6_CMD_DEC_INIT_SEQ_OPTION                    (W6_REG_BASE + 0x204)
+#define W6_CMD_DEC_INIT_SEQ_BS_RD_PTR                 (W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_INIT_SEQ_BS_WR_PTR                 (W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_INIT_SEQ_BS_OPTION                 (W6_REG_BASE + 0x308)
+
+/* DECODER - SET_FB */
+#define W6_CMD_DEC_SET_FB_OPTION                      (W6_REG_BASE + 0x204)
+#define W6_CMD_DEC_SET_FB_COMMON_PIC_INFO             (W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_SET_FB_PIC_SIZE                    (W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_SET_FB_NUM                         (W6_REG_BASE + 0x308)
+#define W6_CMD_DEC_SET_FB_FBC_Y0                      (W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_SET_FB_FBC_C0                      (W6_REG_BASE + 0x314)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET0               (W6_REG_BASE + 0x318)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET0               (W6_REG_BASE + 0x31C)
+#define W6_CMD_DEC_SET_FB_MV_COL0                     (W6_REG_BASE + 0x320)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED0                (W6_REG_BASE + 0x324)
+#define W6_CMD_DEC_SET_FB_FBC_Y1                      (W6_REG_BASE + 0x328)
+#define W6_CMD_DEC_SET_FB_FBC_C1                      (W6_REG_BASE + 0x32C)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET1               (W6_REG_BASE + 0x330)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET1               (W6_REG_BASE + 0x334)
+#define W6_CMD_DEC_SET_FB_MV_COL1                     (W6_REG_BASE + 0x338)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED1                (W6_REG_BASE + 0x33C)
+#define W6_CMD_DEC_SET_FB_FBC_Y2                      (W6_REG_BASE + 0x340)
+#define W6_CMD_DEC_SET_FB_FBC_C2                      (W6_REG_BASE + 0x344)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET2               (W6_REG_BASE + 0x348)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET2               (W6_REG_BASE + 0x34C)
+#define W6_CMD_DEC_SET_FB_MV_COL2                     (W6_REG_BASE + 0x350)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED2                (W6_REG_BASE + 0x354)
+#define W6_CMD_DEC_SET_FB_FBC_Y3                      (W6_REG_BASE + 0x358)
+#define W6_CMD_DEC_SET_FB_FBC_C3                      (W6_REG_BASE + 0x35C)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET3               (W6_REG_BASE + 0x360)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET3               (W6_REG_BASE + 0x364)
+#define W6_CMD_DEC_SET_FB_MV_COL3                     (W6_REG_BASE + 0x368)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED3                (W6_REG_BASE + 0x36C)
+#define W6_CMD_DEC_SET_FB_FBC_Y4                      (W6_REG_BASE + 0x370)
+#define W6_CMD_DEC_SET_FB_FBC_C4                      (W6_REG_BASE + 0x374)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET4               (W6_REG_BASE + 0x378)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET4               (W6_REG_BASE + 0x37C)
+#define W6_CMD_DEC_SET_FB_MV_COL4                     (W6_REG_BASE + 0x380)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED4                (W6_REG_BASE + 0x384)
+#define W6_CMD_DEC_SET_FB_FBC_Y5                      (W6_REG_BASE + 0x388)
+#define W6_CMD_DEC_SET_FB_FBC_C5                      (W6_REG_BASE + 0x38C)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET5               (W6_REG_BASE + 0x390)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET5               (W6_REG_BASE + 0x394)
+#define W6_CMD_DEC_SET_FB_MV_COL5                     (W6_REG_BASE + 0x398)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED5                (W6_REG_BASE + 0x39C)
+#define W6_CMD_DEC_SET_FB_FBC_Y6                      (W6_REG_BASE + 0x3A0)
+#define W6_CMD_DEC_SET_FB_FBC_C6                      (W6_REG_BASE + 0x3A4)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET6               (W6_REG_BASE + 0x3A8)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET6               (W6_REG_BASE + 0x3AC)
+#define W6_CMD_DEC_SET_FB_MV_COL6                     (W6_REG_BASE + 0x3B0)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED6                (W6_REG_BASE + 0x3B4)
+#define W6_CMD_DEC_SET_FB_FBC_Y7                      (W6_REG_BASE + 0x3B8)
+#define W6_CMD_DEC_SET_FB_FBC_C7                      (W6_REG_BASE + 0x3BC)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET7               (W6_REG_BASE + 0x3C0)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET7               (W6_REG_BASE + 0x3C4)
+#define W6_CMD_DEC_SET_FB_MV_COL7                     (W6_REG_BASE + 0x3C8)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED7                (W6_REG_BASE + 0x3CC)
+#define W6_CMD_DEC_SET_FB_FBC_Y8                      (W6_REG_BASE + 0x3D0)
+#define W6_CMD_DEC_SET_FB_FBC_C8                      (W6_REG_BASE + 0x3D4)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET8               (W6_REG_BASE + 0x3D8)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET8               (W6_REG_BASE + 0x3DC)
+#define W6_CMD_DEC_SET_FB_MV_COL8                     (W6_REG_BASE + 0x3E0)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED8                (W6_REG_BASE + 0x3E4)
+#define W6_CMD_DEC_SET_FB_FBC_Y9                      (W6_REG_BASE + 0x3E8)
+#define W6_CMD_DEC_SET_FB_FBC_C9                      (W6_REG_BASE + 0x3EC)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET9               (W6_REG_BASE + 0x3F0)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET9               (W6_REG_BASE + 0x3F4)
+#define W6_CMD_DEC_SET_FB_MV_COL9                     (W6_REG_BASE + 0x3F8)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED9                (W6_REG_BASE + 0x3FC)
+#define W6_CMD_DEC_SET_FB_FBC_Y10                     (W6_REG_BASE + 0x400)
+#define W6_CMD_DEC_SET_FB_FBC_C10                     (W6_REG_BASE + 0x404)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET10              (W6_REG_BASE + 0x408)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET10              (W6_REG_BASE + 0x40C)
+#define W6_CMD_DEC_SET_FB_MV_COL10                    (W6_REG_BASE + 0x410)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED10               (W6_REG_BASE + 0x414)
+#define W6_CMD_DEC_SET_FB_FBC_Y11                     (W6_REG_BASE + 0x418)
+#define W6_CMD_DEC_SET_FB_FBC_C11                     (W6_REG_BASE + 0x41C)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET11              (W6_REG_BASE + 0x420)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET11              (W6_REG_BASE + 0x424)
+#define W6_CMD_DEC_SET_FB_MV_COL11                    (W6_REG_BASE + 0x428)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED11               (W6_REG_BASE + 0x42C)
+#define W6_CMD_DEC_SET_FB_FBC_Y12                     (W6_REG_BASE + 0x430)
+#define W6_CMD_DEC_SET_FB_FBC_C12                     (W6_REG_BASE + 0x434)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET12              (W6_REG_BASE + 0x438)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET12              (W6_REG_BASE + 0x43C)
+#define W6_CMD_DEC_SET_FB_MV_COL12                    (W6_REG_BASE + 0x440)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED12               (W6_REG_BASE + 0x444)
+#define W6_CMD_DEC_SET_FB_FBC_Y13                     (W6_REG_BASE + 0x448)
+#define W6_CMD_DEC_SET_FB_FBC_C13                     (W6_REG_BASE + 0x44C)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET13              (W6_REG_BASE + 0x450)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET13              (W6_REG_BASE + 0x454)
+#define W6_CMD_DEC_SET_FB_MV_COL13                    (W6_REG_BASE + 0x458)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED13               (W6_REG_BASE + 0x45C)
+#define W6_CMD_DEC_SET_FB_FBC_Y14                     (W6_REG_BASE + 0x460)
+#define W6_CMD_DEC_SET_FB_FBC_C14                     (W6_REG_BASE + 0x464)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET14              (W6_REG_BASE + 0x468)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET14              (W6_REG_BASE + 0x46C)
+#define W6_CMD_DEC_SET_FB_MV_COL14                    (W6_REG_BASE + 0x470)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED14               (W6_REG_BASE + 0x474)
+#define W6_CMD_DEC_SET_FB_FBC_Y15                     (W6_REG_BASE + 0x478)
+#define W6_CMD_DEC_SET_FB_FBC_C15                     (W6_REG_BASE + 0x47C)
+#define W6_CMD_DEC_SET_FB_FBC_Y_OFFSET15              (W6_REG_BASE + 0x480)
+#define W6_CMD_DEC_SET_FB_FBC_C_OFFSET15              (W6_REG_BASE + 0x484)
+#define W6_CMD_DEC_SET_FB_MV_COL15                    (W6_REG_BASE + 0x488)
+#define W6_CMD_DEC_SET_FB_SUB_SAMPLED15               (W6_REG_BASE + 0x48C)
+#define W6_CMD_DEC_SET_FB_DEFAULT_CDF                 (W6_REG_BASE + 0x494)
+#define W6_CMD_DEC_SET_FB_SEGMAP                      (W6_REG_BASE + 0x498)
+#define W6_CMD_DEC_SET_FB_MV_COL_PRE_ENT              (W6_REG_BASE + 0x4DC)
+#define W6_CMD_DEC_SET_FB_FBC_CR0                     (W6_REG_BASE + 0x4F0)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET0              (W6_REG_BASE + 0x4F4)
+#define W6_CMD_DEC_SET_FB_FBC_CR1                     (W6_REG_BASE + 0x4F8)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET1              (W6_REG_BASE + 0x4FC)
+#define W6_CMD_DEC_SET_FB_FBC_CR2                     (W6_REG_BASE + 0x500)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET2              (W6_REG_BASE + 0x504)
+#define W6_CMD_DEC_SET_FB_FBC_CR3                     (W6_REG_BASE + 0x508)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET3              (W6_REG_BASE + 0x50C)
+#define W6_CMD_DEC_SET_FB_FBC_CR4                     (W6_REG_BASE + 0x510)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET4              (W6_REG_BASE + 0x514)
+#define W6_CMD_DEC_SET_FB_FBC_CR5                     (W6_REG_BASE + 0x518)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET5              (W6_REG_BASE + 0x51C)
+#define W6_CMD_DEC_SET_FB_FBC_CR6                     (W6_REG_BASE + 0x520)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET6              (W6_REG_BASE + 0x524)
+#define W6_CMD_DEC_SET_FB_FBC_CR7                     (W6_REG_BASE + 0x528)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET7              (W6_REG_BASE + 0x52C)
+#define W6_CMD_DEC_SET_FB_FBC_CR8                     (W6_REG_BASE + 0x530)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET8              (W6_REG_BASE + 0x534)
+#define W6_CMD_DEC_SET_FB_FBC_CR9                     (W6_REG_BASE + 0x538)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET9              (W6_REG_BASE + 0x53C)
+#define W6_CMD_DEC_SET_FB_FBC_CR10                    (W6_REG_BASE + 0x540)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET10             (W6_REG_BASE + 0x544)
+#define W6_CMD_DEC_SET_FB_FBC_CR11                    (W6_REG_BASE + 0x548)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET11             (W6_REG_BASE + 0x54C)
+#define W6_CMD_DEC_SET_FB_FBC_CR12                    (W6_REG_BASE + 0x550)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET12             (W6_REG_BASE + 0x554)
+#define W6_CMD_DEC_SET_FB_FBC_CR13                    (W6_REG_BASE + 0x558)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET13             (W6_REG_BASE + 0x55C)
+#define W6_CMD_DEC_SET_FB_FBC_CR14                    (W6_REG_BASE + 0x560)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET14             (W6_REG_BASE + 0x564)
+#define W6_CMD_DEC_SET_FB_FBC_CR15                    (W6_REG_BASE + 0x568)
+#define W6_CMD_DEC_SET_FB_FBC_CR_OFFSET15             (W6_REG_BASE + 0x56C)
+
+/* DECODER - SET_DISP */
+#define W6_CMD_DEC_SET_DISP_OPTION                    (W6_REG_BASE + 0x204)
+#define W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO           (W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_SET_DISP_PIC_SIZE                  (W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_SET_DISP_PIC_INFO                  (W6_REG_BASE + 0x308)
+#define W6_CMD_DEC_SET_DISP_Y_BASE                    (W6_REG_BASE + 0x30C)
+#define W6_CMD_DEC_SET_DISP_CB_BASE                   (W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_SET_DISP_CR_BASE                   (W6_REG_BASE + 0x314)
+#define W6_CMD_DEC_SET_DISP_SCL_PARAM                 (W6_REG_BASE + 0x318)
+#define W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE              (W6_REG_BASE + 0x31C)
+
+/* DECODER - DEC_PIC */
+#define W6_CMD_DEC_PIC_OPTION                         (W6_REG_BASE + 0x204)
+#define W6_CMD_DEC_PIC_BS_RD_PTR                      (W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_PIC_BS_WR_PTR                      (W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_PIC_BS_OPTION                      (W6_REG_BASE + 0x308)
+#define W6_CMD_DEC_PIC_USE_SEC_AXI                    (W6_REG_BASE + 0x30C)
+#define W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG         (W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1              (W6_REG_BASE + 0x318)
+#define W6_CMD_DEC_PIC_TIMESTAMP                      (W6_REG_BASE + 0x32C)
+
+/* DECODER - QUERY : GET_RESULT */
+#define W6_RET_DEC_BS_RD_PTR                          (W6_REG_BASE + 0x30C)
+#define W6_RET_DEC_SEQ_PARAM                          (W6_REG_BASE + 0x310)
+#define W6_RET_DEC_COLOR_SAMPLE_INFO                  (W6_REG_BASE + 0x314)
+#define W6_RET_DEC_ASPECT_RATIO                       (W6_REG_BASE + 0x318)
+#define W6_RET_DEC_BIT_RATE                           (W6_REG_BASE + 0x31C)
+#define W6_RET_DEC_FRAME_RATE_NR                      (W6_REG_BASE + 0x320)
+#define W6_RET_DEC_FRAME_RATE_DR                      (W6_REG_BASE + 0x324)
+#define W6_RET_DEC_NUM_REQUIRED_FBC_FB                (W6_REG_BASE + 0x328)
+#define W6_RET_DEC_NUM_REORDER_DELAY                  (W6_REG_BASE + 0x32C)
+#define W6_RET_DEC_NOTIFICATION                       (W6_REG_BASE + 0x334)
+#define W6_RET_DEC_PIC_SIZE                           (W6_REG_BASE + 0x33C)
+#define W6_RET_DEC_CROP_TOP_BOTTOM                    (W6_REG_BASE + 0x340)
+#define W6_RET_DEC_CROP_LEFT_RIGHT                    (W6_REG_BASE + 0x344)
+#define W6_RET_DEC_AU_START_POS                       (W6_REG_BASE + 0x348)
+#define W6_RET_DEC_AU_END_POS                         (W6_REG_BASE + 0x34C)
+#define W6_RET_DEC_PIC_TYPE                           (W6_REG_BASE + 0x350)
+#define W6_RET_DEC_PIC_POC                            (W6_REG_BASE + 0x354)
+#define W6_RET_DEC_RECOVERY_POINT                     (W6_REG_BASE + 0x358)
+#define W6_RET_DEC_DECODED_ADDR                       (W6_REG_BASE + 0x360)
+#define W6_RET_DEC_DISPLAY_ADDR                       (W6_REG_BASE + 0x364)
+#define W6_RET_DEC_ERR_CTB_NUM                        (W6_REG_BASE + 0x370)
+#define W6_RET_DEC_DISPLAY_FLAG                       (W6_REG_BASE + 0x3A8)
+#define W6_RET_DEC_RELEASE_IDC                        (W6_REG_BASE + 0x3AC)
+#define W6_RET_DEC_DISP_IDC                           (W6_REG_BASE + 0x3B0)
+#define W6_RET_DEC_STREAM_END                         (W6_REG_BASE + 0x3C0)
+#define W6_RET_DEC_DECODED_FLAG                       (W6_REG_BASE + 0x3C4)
+#define W6_RET_DEC_WARN_INFO                          (W6_REG_BASE + 0x3CC)
+#define W6_RET_DEC_ERR_INFO                           (W6_REG_BASE + 0x3D0)
+#define W6_RET_DEC_DECODING_SUCCESS                   (W6_REG_BASE + 0x3D4)
+#define W6_RET_DEC_TIMESTAMP                          (W6_REG_BASE + 0x3D8)
+#define W6_RET_DEC_LAST_FRAME_FLAG                    (W6_REG_BASE + 0x3E0)
+#define W6_RET_DEC_NUM_REQUIRED_COL_BUF               (W6_REG_BASE + 0x3E4)
+#define W6_RET_DEC_DISP_LINEAR_ADDR_0                 (W6_REG_BASE + 0x3E8)
+#define W6_RET_DEC_DISP_LINEAR_ADDR_30                (W6_REG_BASE + 0x460)
+#define W6_RET_DEC_COLOR_CONFIG                       (W6_REG_BASE + 0x57C)
+
+/* DECODER - QUERY : GET_FLUSH_CMD_INFO */
+#define W6_RET_DEC_FLUSH_CMD_DISP_ADDR_0              (W6_REG_BASE + 0x300)
+#define W6_RET_DEC_FLUSH_CMD_DISP_ADDR_1E             (W6_REG_BASE + 0x378)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_UNUSED_IDC     (W6_REG_BASE + 0x57C)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USED_IDC       (W6_REG_BASE + 0x580)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USING_IDC      (W6_REG_BASE + 0x584)
+
+/* ENCODER - CREATE_INSTANCE */
+#define W6_CMD_ENC_CREATE_INST_BS_PARAM               (W6_REG_BASE + 0x310)
+#define W6_CMD_ENC_CREATE_INST_SRC_OPT                (W6_REG_BASE + 0x314)
+#define W6_CMD_ENC_CREATE_INST_ADDR_EXT               (W6_REG_BASE + 0x318)
+#define W6_CMD_ENC_CREATE_INST_CORE_INFO              (W6_REG_BASE + 0x330)
+#define W6_CMD_ENC_CREATE_INST_PRIORITY               (W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_CREATE_INST_TEMP_BASE              (W6_REG_BASE + 0x348)
+#define W6_CMD_ENC_CREATE_INST_TEMP_SIZE              (W6_REG_BASE + 0x34C)
+#define W6_CMD_ENC_CREATE_INST_AR_TABLE_BASE          (W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_CREATE_INST_TIMEOUT_CYCLE_COUNT    (W6_REG_BASE + 0x3A8)
+
+/* ENCODER - SET_PARAM */
+#define W6_CMD_ENC_SET_PARAM_OPTION                   (W6_REG_BASE + 0x204)
+#define W6_CMD_ENC_SET_PARAM_ENABLE                   (W6_REG_BASE + 0x300)
+#define W6_CMD_ENC_SET_PARAM_SRC_SIZE                 (W6_REG_BASE + 0x304)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN        (W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_SET_PARAM_SPS_PARAM                (W6_REG_BASE + 0x30C)
+#define W6_CMD_ENC_SET_PARAM_PPS_PARAM                (W6_REG_BASE + 0x310)
+#define W6_CMD_ENC_SET_PARAM_GOP_PARAM                (W6_REG_BASE + 0x314)
+#define W6_CMD_ENC_SET_PARAM_INTRA_PARAM              (W6_REG_BASE + 0x318)
+#define W6_CMD_ENC_SET_PARAM_CONF_WIN_TOP_BOT         (W6_REG_BASE + 0x31C)
+#define W6_CMD_ENC_SET_PARAM_CONF_WIN_LEFT_RIGHT      (W6_REG_BASE + 0x320)
+#define W6_CMD_ENC_SET_PARAM_RDO_PARAM                (W6_REG_BASE + 0x324)
+#define W6_CMD_ENC_SET_PARAM_SLICE_PARAM              (W6_REG_BASE + 0x328)
+#define W6_CMD_ENC_SET_PARAM_INTRA_REFRESH            (W6_REG_BASE + 0x32C)
+#define W6_CMD_ENC_SET_PARAM_INTRA_MIN_MAX_QP         (W6_REG_BASE + 0x330)
+#define W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE            (W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE           (W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_SET_PARAM_RC_PARAM                 (W6_REG_BASE + 0x33C)
+#define W6_CMD_ENC_SET_PARAM_HVS_PARAM                (W6_REG_BASE + 0x340)
+#define W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE           (W6_REG_BASE + 0x344)
+#define W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE       (W6_REG_BASE + 0x348)
+#define W6_CMD_ENC_SET_PARAM_INTER_MIN_MAX_QP         (W6_REG_BASE + 0x34C)
+#define W6_CMD_ENC_SET_PARAM_ROT_PARAM                (W6_REG_BASE + 0x350)
+#define W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK        (W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_SET_PARAM_TIME_SCALE               (W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE   (W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT        (W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT        (W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_SET_PARAM_BG_PARAM                 (W6_REG_BASE + 0x36C)
+#define W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM            (W6_REG_BASE + 0x370)
+#define W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR            (W6_REG_BASE + 0x374)
+#define W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR            (W6_REG_BASE + 0x378)
+#define W6_CMD_ENC_SET_PARAM_QROUND_OFFSET            (W6_REG_BASE + 0x380)
+#define W6_CMD_ENC_SET_PARAM_QUANT_PARAM_1            (W6_REG_BASE + 0x384)
+#define W6_CMD_ENC_SET_PARAM_QUANT_PARAM_2            (W6_REG_BASE + 0x388)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PARAM         (W6_REG_BASE + 0x38C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_0   (W6_REG_BASE + 0x390)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_1   (W6_REG_BASE + 0x394)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_2   (W6_REG_BASE + 0x398)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_3   (W6_REG_BASE + 0x39C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_4   (W6_REG_BASE + 0x3A0)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_5   (W6_REG_BASE + 0x3A4)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_6   (W6_REG_BASE + 0x3A8)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_7   (W6_REG_BASE + 0x3AC)
+#define W6_CMD_ENC_SET_PARAM_TILE_PARAM               (W6_REG_BASE + 0x3D0)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_0          (W6_REG_BASE + 0x3D4)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_1          (W6_REG_BASE + 0x3D8)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_2          (W6_REG_BASE + 0x3DC)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_3          (W6_REG_BASE + 0x3E0)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_4          (W6_REG_BASE + 0x3E4)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_5          (W6_REG_BASE + 0x3E8)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_6          (W6_REG_BASE + 0x3EC)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_7          (W6_REG_BASE + 0x3F0)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_8          (W6_REG_BASE + 0x3F4)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_9          (W6_REG_BASE + 0x3F8)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_10         (W6_REG_BASE + 0x3FC)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_11         (W6_REG_BASE + 0x400)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_12         (W6_REG_BASE + 0x404)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_13         (W6_REG_BASE + 0x408)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_14         (W6_REG_BASE + 0x40C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_15         (W6_REG_BASE + 0x410)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_16         (W6_REG_BASE + 0x414)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_17         (W6_REG_BASE + 0x418)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_18         (W6_REG_BASE + 0x41C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_19         (W6_REG_BASE + 0x420)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_20         (W6_REG_BASE + 0x424)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_21         (W6_REG_BASE + 0x428)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_22         (W6_REG_BASE + 0x42C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_23         (W6_REG_BASE + 0x430)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_24         (W6_REG_BASE + 0x434)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_25         (W6_REG_BASE + 0x438)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_26         (W6_REG_BASE + 0x43C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_27         (W6_REG_BASE + 0x440)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_28         (W6_REG_BASE + 0x444)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_29         (W6_REG_BASE + 0x448)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_30         (W6_REG_BASE + 0x44C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_31         (W6_REG_BASE + 0x450)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_32         (W6_REG_BASE + 0x454)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_33         (W6_REG_BASE + 0x458)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_34         (W6_REG_BASE + 0x45C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_35         (W6_REG_BASE + 0x460)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_36         (W6_REG_BASE + 0x464)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_37         (W6_REG_BASE + 0x468)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_38         (W6_REG_BASE + 0x46C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_39         (W6_REG_BASE + 0x470)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_40         (W6_REG_BASE + 0x474)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_41         (W6_REG_BASE + 0x478)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_42         (W6_REG_BASE + 0x47C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_43         (W6_REG_BASE + 0x480)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_44         (W6_REG_BASE + 0x484)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_45         (W6_REG_BASE + 0x488)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_46         (W6_REG_BASE + 0x48C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_47         (W6_REG_BASE + 0x490)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_48         (W6_REG_BASE + 0x494)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_49         (W6_REG_BASE + 0x498)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_50         (W6_REG_BASE + 0x49C)
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_51         (W6_REG_BASE + 0x4A0)
+#define W6_CMD_ENC_SET_PARAM_TEMPORAL_LAYER_0_QP      (W6_REG_BASE + 0x4A4)
+#define W6_CMD_ENC_SET_PARAM_TEMPORAL_LAYER_1_QP      (W6_REG_BASE + 0x4A8)
+#define W6_CMD_ENC_SET_PARAM_TEMPORAL_LAYER_2_QP      (W6_REG_BASE + 0x4AC)
+#define W6_CMD_ENC_SET_PARAM_TEMPORAL_LAYER_3_QP      (W6_REG_BASE + 0x4B0)
+#define W6_CMD_ENC_SET_PARAM_SCL_SRC_SIZE             (W6_REG_BASE + 0x4B4)
+#define W6_CMD_ENC_SET_PARAM_SCL_PARAM                (W6_REG_BASE + 0x4B8)
+#define W6_CMD_ENC_SET_PARAM_COLOR_PARAM              (W6_REG_BASE + 0x4F8)
+#define W6_CMD_ENC_SET_PARAM_SAR_PARAM                (W6_REG_BASE + 0x4FC)
+#define W6_CMD_ENC_SET_PARAM_SAR_EXTENDED             (W6_REG_BASE + 0x500)
+
+/* ENCODER - SET_FB */
+#define W6_CMD_ENC_SET_FB_OPTION                      (W6_REG_BASE + 0x204)
+#define W6_CMD_ENC_SET_FB_PIC_INFO                    (W6_REG_BASE + 0x300)
+#define W6_CMD_ENC_SET_FB_PIC_SIZE                    (W6_REG_BASE + 0x304)
+#define W6_CMD_ENC_SET_FB_NUM                         (W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_SET_FB_FBC_STRIDE                  (W6_REG_BASE + 0x30C)
+#define W6_CMD_ENC_SET_FB_FBC_Y0                      (W6_REG_BASE + 0x310)
+#define W6_CMD_ENC_SET_FB_FBC_C0                      (W6_REG_BASE + 0x314)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET0               (W6_REG_BASE + 0x318)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET0               (W6_REG_BASE + 0x31C)
+#define W6_CMD_ENC_SET_FB_MV_COL0                     (W6_REG_BASE + 0x320)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED0                (W6_REG_BASE + 0x324)
+#define W6_CMD_ENC_SET_FB_FBC_Y1                      (W6_REG_BASE + 0x328)
+#define W6_CMD_ENC_SET_FB_FBC_C1                      (W6_REG_BASE + 0x32C)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET1               (W6_REG_BASE + 0x330)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET1               (W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_SET_FB_MV_COL1                     (W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED1                (W6_REG_BASE + 0x33C)
+#define W6_CMD_ENC_SET_FB_FBC_Y2                      (W6_REG_BASE + 0x340)
+#define W6_CMD_ENC_SET_FB_FBC_C2                      (W6_REG_BASE + 0x344)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET2               (W6_REG_BASE + 0x348)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET2               (W6_REG_BASE + 0x34C)
+#define W6_CMD_ENC_SET_FB_MV_COL2                     (W6_REG_BASE + 0x350)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED2                (W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_SET_FB_FBC_Y3                      (W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_SET_FB_FBC_C3                      (W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET3               (W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET3               (W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_SET_FB_MV_COL3                     (W6_REG_BASE + 0x368)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED3                (W6_REG_BASE + 0x36C)
+#define W6_CMD_ENC_SET_FB_FBC_Y4                      (W6_REG_BASE + 0x370)
+#define W6_CMD_ENC_SET_FB_FBC_C4                      (W6_REG_BASE + 0x374)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET4               (W6_REG_BASE + 0x378)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET4               (W6_REG_BASE + 0x37C)
+#define W6_CMD_ENC_SET_FB_MV_COL4                     (W6_REG_BASE + 0x380)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED4                (W6_REG_BASE + 0x384)
+#define W6_CMD_ENC_SET_FB_FBC_Y5                      (W6_REG_BASE + 0x388)
+#define W6_CMD_ENC_SET_FB_FBC_C5                      (W6_REG_BASE + 0x38C)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET5               (W6_REG_BASE + 0x390)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET5               (W6_REG_BASE + 0x394)
+#define W6_CMD_ENC_SET_FB_MV_COL5                     (W6_REG_BASE + 0x398)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED5                (W6_REG_BASE + 0x39C)
+#define W6_CMD_ENC_SET_FB_FBC_Y6                      (W6_REG_BASE + 0x3A0)
+#define W6_CMD_ENC_SET_FB_FBC_C6                      (W6_REG_BASE + 0x3A4)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET6               (W6_REG_BASE + 0x3A8)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET6               (W6_REG_BASE + 0x3AC)
+#define W6_CMD_ENC_SET_FB_MV_COL6                     (W6_REG_BASE + 0x3B0)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED6                (W6_REG_BASE + 0x3B4)
+#define W6_CMD_ENC_SET_FB_FBC_Y7                      (W6_REG_BASE + 0x3B8)
+#define W6_CMD_ENC_SET_FB_FBC_C7                      (W6_REG_BASE + 0x3BC)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET7               (W6_REG_BASE + 0x3C0)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET7               (W6_REG_BASE + 0x3C4)
+#define W6_CMD_ENC_SET_FB_MV_COL7                     (W6_REG_BASE + 0x3C8)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED7                (W6_REG_BASE + 0x3CC)
+#define W6_CMD_ENC_SET_FB_FBC_Y8                      (W6_REG_BASE + 0x3D0)
+#define W6_CMD_ENC_SET_FB_FBC_C8                      (W6_REG_BASE + 0x3D4)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET8               (W6_REG_BASE + 0x3D8)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET8               (W6_REG_BASE + 0x3DC)
+#define W6_CMD_ENC_SET_FB_MV_COL8                     (W6_REG_BASE + 0x3E0)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED8                (W6_REG_BASE + 0x3E4)
+#define W6_CMD_ENC_SET_FB_FBC_Y9                      (W6_REG_BASE + 0x3E8)
+#define W6_CMD_ENC_SET_FB_FBC_C9                      (W6_REG_BASE + 0x3EC)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET9               (W6_REG_BASE + 0x3F0)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET9               (W6_REG_BASE + 0x3F4)
+#define W6_CMD_ENC_SET_FB_MV_COL9                     (W6_REG_BASE + 0x3F8)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED9                (W6_REG_BASE + 0x3FC)
+#define W6_CMD_ENC_SET_FB_FBC_Y10                     (W6_REG_BASE + 0x400)
+#define W6_CMD_ENC_SET_FB_FBC_C10                     (W6_REG_BASE + 0x404)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET10              (W6_REG_BASE + 0x408)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET10              (W6_REG_BASE + 0x40C)
+#define W6_CMD_ENC_SET_FB_MV_COL10                    (W6_REG_BASE + 0x410)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED10               (W6_REG_BASE + 0x414)
+#define W6_CMD_ENC_SET_FB_FBC_Y11                     (W6_REG_BASE + 0x418)
+#define W6_CMD_ENC_SET_FB_FBC_C11                     (W6_REG_BASE + 0x41C)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET11              (W6_REG_BASE + 0x420)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET11              (W6_REG_BASE + 0x424)
+#define W6_CMD_ENC_SET_FB_MV_COL11                    (W6_REG_BASE + 0x428)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED11               (W6_REG_BASE + 0x42C)
+#define W6_CMD_ENC_SET_FB_FBC_Y12                     (W6_REG_BASE + 0x430)
+#define W6_CMD_ENC_SET_FB_FBC_C12                     (W6_REG_BASE + 0x434)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET12              (W6_REG_BASE + 0x438)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET12              (W6_REG_BASE + 0x43C)
+#define W6_CMD_ENC_SET_FB_MV_COL12                    (W6_REG_BASE + 0x440)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED12               (W6_REG_BASE + 0x444)
+#define W6_CMD_ENC_SET_FB_FBC_Y13                     (W6_REG_BASE + 0x448)
+#define W6_CMD_ENC_SET_FB_FBC_C13                     (W6_REG_BASE + 0x44C)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET13              (W6_REG_BASE + 0x450)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET13              (W6_REG_BASE + 0x454)
+#define W6_CMD_ENC_SET_FB_MV_COL13                    (W6_REG_BASE + 0x458)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED13               (W6_REG_BASE + 0x45C)
+#define W6_CMD_ENC_SET_FB_FBC_Y14                     (W6_REG_BASE + 0x460)
+#define W6_CMD_ENC_SET_FB_FBC_C14                     (W6_REG_BASE + 0x464)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET14              (W6_REG_BASE + 0x468)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET14              (W6_REG_BASE + 0x46C)
+#define W6_CMD_ENC_SET_FB_MV_COL14                    (W6_REG_BASE + 0x470)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED14               (W6_REG_BASE + 0x474)
+#define W6_CMD_ENC_SET_FB_FBC_Y15                     (W6_REG_BASE + 0x478)
+#define W6_CMD_ENC_SET_FB_FBC_C15                     (W6_REG_BASE + 0x47C)
+#define W6_CMD_ENC_SET_FB_FBC_Y_OFFSET15              (W6_REG_BASE + 0x480)
+#define W6_CMD_ENC_SET_FB_FBC_C_OFFSET15              (W6_REG_BASE + 0x484)
+#define W6_CMD_ENC_SET_FB_MV_COL15                    (W6_REG_BASE + 0x488)
+#define W6_CMD_ENC_SET_FB_SUB_SAMPLED15               (W6_REG_BASE + 0x48C)
+#define W6_CMD_ENC_SET_FB_DEFAULT_CDF                 (W6_REG_BASE + 0x494)
+#define W6_CMD_ENC_SET_FB_FBC_CR0                     (W6_REG_BASE + 0x4F0)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET0              (W6_REG_BASE + 0x4F4)
+#define W6_CMD_ENC_SET_FB_FBC_CR1                     (W6_REG_BASE + 0x4F8)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET1              (W6_REG_BASE + 0x4FC)
+#define W6_CMD_ENC_SET_FB_FBC_CR2                     (W6_REG_BASE + 0x500)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET2              (W6_REG_BASE + 0x504)
+#define W6_CMD_ENC_SET_FB_FBC_CR3                     (W6_REG_BASE + 0x508)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET3              (W6_REG_BASE + 0x50C)
+#define W6_CMD_ENC_SET_FB_FBC_CR4                     (W6_REG_BASE + 0x510)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET4              (W6_REG_BASE + 0x514)
+#define W6_CMD_ENC_SET_FB_FBC_CR5                     (W6_REG_BASE + 0x518)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET5              (W6_REG_BASE + 0x51C)
+#define W6_CMD_ENC_SET_FB_FBC_CR6                     (W6_REG_BASE + 0x520)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET6              (W6_REG_BASE + 0x524)
+#define W6_CMD_ENC_SET_FB_FBC_CR7                     (W6_REG_BASE + 0x528)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET7              (W6_REG_BASE + 0x52C)
+#define W6_CMD_ENC_SET_FB_FBC_CR8                     (W6_REG_BASE + 0x530)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET8              (W6_REG_BASE + 0x534)
+#define W6_CMD_ENC_SET_FB_FBC_CR9                     (W6_REG_BASE + 0x538)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET9              (W6_REG_BASE + 0x53C)
+#define W6_CMD_ENC_SET_FB_FBC_CR10                    (W6_REG_BASE + 0x540)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET10             (W6_REG_BASE + 0x544)
+#define W6_CMD_ENC_SET_FB_FBC_CR11                    (W6_REG_BASE + 0x548)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET11             (W6_REG_BASE + 0x54C)
+#define W6_CMD_ENC_SET_FB_FBC_CR12                    (W6_REG_BASE + 0x550)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET12             (W6_REG_BASE + 0x554)
+#define W6_CMD_ENC_SET_FB_FBC_CR13                    (W6_REG_BASE + 0x558)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET13             (W6_REG_BASE + 0x55C)
+#define W6_CMD_ENC_SET_FB_FBC_CR14                    (W6_REG_BASE + 0x560)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET14             (W6_REG_BASE + 0x564)
+#define W6_CMD_ENC_SET_FB_FBC_CR15                    (W6_REG_BASE + 0x568)
+#define W6_CMD_ENC_SET_FB_FBC_CR_OFFSET15             (W6_REG_BASE + 0x56C)
+
+/* ENCODER - ENC_PIC */
+#define W6_CMD_ENC_PIC_BS_START                       (W6_REG_BASE + 0x300)
+#define W6_CMD_ENC_PIC_BS_SIZE                        (W6_REG_BASE + 0x304)
+#define W6_CMD_ENC_PIC_BS_OPTION                      (W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_PIC_USE_SEC_AXI                    (W6_REG_BASE + 0x30C)
+#define W6_CMD_ENC_PIC_REPORT_PARAM                   (W6_REG_BASE + 0x310)
+#define W6_CMD_ENC_PIC_MV_HISTO_CLASS0                (W6_REG_BASE + 0x318)
+#define W6_CMD_ENC_PIC_MV_HISTO_CLASS1                (W6_REG_BASE + 0x31C)
+#define W6_CMD_ENC_PIC_CUSTOM_MAP_OPTION_PARAM        (W6_REG_BASE + 0x320)
+#define W6_CMD_ENC_PIC_CUSTOM_MAP_OPTION_ADDR         (W6_REG_BASE + 0x324)
+#define W6_CMD_ENC_PIC_SRC_PIC_IDX                    (W6_REG_BASE + 0x32C)
+#define W6_CMD_ENC_PIC_SRC_ADDR_Y                     (W6_REG_BASE + 0x330)
+#define W6_CMD_ENC_PIC_SRC_ADDR_U                     (W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_PIC_SRC_ADDR_V                     (W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_PIC_SRC_STRIDE                     (W6_REG_BASE + 0x33C)
+#define W6_CMD_ENC_PIC_SRC_FORMAT                     (W6_REG_BASE + 0x340)
+#define W6_CMD_ENC_PIC_SRC_AXI_SEL                    (W6_REG_BASE + 0x348)
+#define W6_CMD_ENC_PIC_CODE_OPTION                    (W6_REG_BASE + 0x34C)
+#define W6_CMD_ENC_PIC_PIC_PARAM                      (W6_REG_BASE + 0x350)
+#define W6_CMD_ENC_PIC_LONGTERM_PIC                   (W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR            (W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_PIC_PREFIX_SEI_INFO                (W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR            (W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_PIC_SUFFIX_SEI_INFO                (W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_PIC_CSC_COEFF_0                    (W6_REG_BASE + 0x374)
+#define W6_CMD_ENC_PIC_CSC_COEFF_1                    (W6_REG_BASE + 0x378)
+#define W6_CMD_ENC_PIC_CSC_COEFF_2                    (W6_REG_BASE + 0x37C)
+#define W6_CMD_ENC_PIC_CSC_COEFF_3                    (W6_REG_BASE + 0x380)
+#define W6_CMD_ENC_PIC_TIMESTAMP                      (W6_REG_BASE + 0x3F8)
+
+/* ENCODER - QUERY : GET_RESULT */
+#define W6_RET_ENC_RD_PTR                             (W6_REG_BASE + 0x300)
+#define W6_RET_ENC_WR_PTR                             (W6_REG_BASE + 0x304)
+#define W6_RET_ENC_NUM_REQUIRED_FBC_FB                (W6_REG_BASE + 0x308)
+#define W6_RET_ENC_MIN_SRC_BUF_NUM                    (W6_REG_BASE + 0x30C)
+#define W6_RET_ENC_PIC_TYPE                           (W6_REG_BASE + 0x310)
+#define W6_RET_ENC_PIC_POC                            (W6_REG_BASE + 0x314)
+#define W6_RET_ENC_PIC_IDX                            (W6_REG_BASE + 0x318)
+#define W6_RET_ENC_PIC_SLICE_NUM                      (W6_REG_BASE + 0x31C)
+#define W6_RET_ENC_PIC_SKIP                           (W6_REG_BASE + 0x320)
+#define W6_RET_ENC_PIC_NUM_INTRA                      (W6_REG_BASE + 0x324)
+#define W6_RET_ENC_PIC_NUM_MERGE                      (W6_REG_BASE + 0x328)
+#define W6_RET_ENC_PIC_NON_REF_PIC_FLAG               (W6_REG_BASE + 0x32C)
+#define W6_RET_ENC_PIC_NUM_SKIP                       (W6_REG_BASE + 0x330)
+#define W6_RET_ENC_PIC_AVG_CTU_QP                     (W6_REG_BASE + 0x334)
+#define W6_RET_ENC_PIC_BYTE                           (W6_REG_BASE + 0x338)
+#define W6_RET_ENC_GOP_PIC_IDX                        (W6_REG_BASE + 0x33C)
+#define W6_RET_ENC_USED_SRC_IDX                       (W6_REG_BASE + 0x340)
+#define W6_RET_ENC_PIC_NUM                            (W6_REG_BASE + 0x344)
+#define W6_RET_ENC_VCL_NUT                            (W6_REG_BASE + 0x348)
+#define W6_RET_ENC_PIC_DIST_LOW                       (W6_REG_BASE + 0x350)
+#define W6_RET_ENC_PIC_DIST_HIGH                      (W6_REG_BASE + 0x354)
+#define W6_RET_ENC_PIC_MAX_LATENCY_PICTURES           (W6_REG_BASE + 0x358)
+#define W6_RET_ENC_HISTO_CNT_0                        (W6_REG_BASE + 0x360)
+#define W6_RET_ENC_HISTO_CNT_1                        (W6_REG_BASE + 0x364)
+#define W6_RET_ENC_HISTO_CNT_2                        (W6_REG_BASE + 0x368)
+#define W6_RET_ENC_HISTO_CNT_3                        (W6_REG_BASE + 0x36C)
+#define W6_RET_ENC_HISTO_CNT_4                        (W6_REG_BASE + 0x370)
+#define W6_RET_ENC_WARN_INFO                          (W6_REG_BASE + 0x3AC)
+#define W6_RET_ENC_ERR_INFO                           (W6_REG_BASE + 0x3B0)
+#define W6_RET_ENC_ENCODING_SUCCESS                   (W6_REG_BASE + 0x3B4)
+#define W6_RET_ENC_SUM_ME0_X_DIR_LOWER                (W6_REG_BASE + 0x3B8)
+#define W6_RET_ENC_SUM_ME0_X_DIR_HIGHER               (W6_REG_BASE + 0x3BC)
+#define W6_RET_ENC_SUM_ME0_Y_DIR_LOWER                (W6_REG_BASE + 0x3C0)
+#define W6_RET_ENC_SUM_ME0_Y_DIR_HIGHER               (W6_REG_BASE + 0x3C4)
+#define W6_RET_ENC_SUM_ME1_X_DIR_LOWER                (W6_REG_BASE + 0x3C8)
+#define W6_RET_ENC_SUM_ME1_X_DIR_HIGHER               (W6_REG_BASE + 0x3CC)
+#define W6_RET_ENC_SUM_ME1_Y_DIR_LOWER                (W6_REG_BASE + 0x3D0)
+#define W6_RET_ENC_SUM_ME1_Y_DIR_HIGHER               (W6_REG_BASE + 0x3D4)
+#define W6_RET_ENC_SRC_Y_ADDR                         (W6_REG_BASE + 0x3E8)
+#define W6_RET_ENC_CUSTOM_MAP_OPTION_ADDR             (W6_REG_BASE + 0x3EC)
+#define W6_RET_ENC_PREFIX_SEI_NAL_ADDR                (W6_REG_BASE + 0x3F0)
+#define W6_RET_ENC_SUFFIX_SEI_NAL_ADDR                (W6_REG_BASE + 0x3F4)
+#define W6_RET_ENC_TIMESTAMP                          (W6_REG_BASE + 0x400)
+#define W6_RET_ENC_NUM_REQUIRED_COL_BUF               (W6_REG_BASE + 0x404)
+
+#endif /* __WAVE6_REGDEFINE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
new file mode 100644
index 000000000000..bcd4be119c3e
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
@@ -0,0 +1,860 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 control driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+#include <linux/thermal.h>
+#include <linux/units.h>
+#include <linux/pm_opp.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpu.h"
+
+#define VPU_CTRL_PLATFORM_DEVICE_NAME "wave6-vpu-ctrl"
+
+static bool wave6_cooling_disable;
+module_param(wave6_cooling_disable, bool, 0644);
+MODULE_PARM_DESC(wave6_cooling_disable, "enable or disable cooling");
+
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+struct vpu_ctrl_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+struct vpu_ctrl_buf {
+	struct list_head list;
+	struct vpu_buf buf;
+};
+
+struct vpu_dma_buf {
+	size_t size;
+	dma_addr_t dma_addr;
+	void *vaddr;
+	phys_addr_t phys_addr;
+};
+
+struct vpu_ctrl {
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct vpu_dma_buf boot_mem;
+	u32 state;
+	struct mutex lock; /* the lock for vpu control device */
+	struct list_head entities;
+	const struct vpu_ctrl_resource *res;
+	struct gen_pool *sram_pool;
+	struct vpu_dma_buf sram_buf;
+	struct list_head buffers;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned long *freq_table;
+	bool available;
+};
+
+static const struct vpu_ctrl_resource wave633c_ctrl_data = {
+	.fw_name = "wave633c_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static void wave6_vpu_ctrl_writel(struct device *dev, u32 addr, u32 data)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	writel(data, ctrl->reg_base + addr);
+}
+
+static const char *wave6_vpu_ctrl_state_name(u32 state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static void wave6_vpu_ctrl_set_state(struct vpu_ctrl *ctrl, u32 state)
+{
+	dev_dbg(ctrl->dev, "set state: %s -> %s\n",
+		wave6_vpu_ctrl_state_name(ctrl->state), wave6_vpu_ctrl_state_name(state));
+	ctrl->state = state;
+}
+
+static int wave6_vpu_ctrl_wait_busy(struct wave6_vpu_entity *entity)
+{
+	u32 val;
+
+	return read_poll_timeout(entity->read_reg, val, !val,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, entity->dev, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_ctrl_check_result(struct wave6_vpu_entity *entity)
+{
+	if (entity->read_reg(entity->dev, W6_RET_SUCCESS))
+		return 0;
+
+	return entity->read_reg(entity->dev, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_ctrl_get_code_buf_size(struct vpu_ctrl *ctrl)
+{
+	return min_t(u32, ctrl->boot_mem.size, WAVE6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_ctrl_remap_code_buffer(struct vpu_ctrl *ctrl)
+{
+	dma_addr_t code_base = ctrl->boot_mem.dma_addr;
+	u32 i, reg_val, remap_size;
+
+	for (i = 0; i < wave6_vpu_ctrl_get_code_buf_size(ctrl) / W6_REMAP_MAX_SIZE; i++) {
+		remap_size = (W6_REMAP_MAX_SIZE >> 12) & 0x1ff;
+		reg_val = 0x80000000 |
+			  (WAVE6_UPPER_PROC_AXI_ID << 20) |
+			  (0 << 16) |
+			  (i << 12) |
+			  BIT(11) |
+			  remap_size;
+		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_VADDR_GB, i * W6_REMAP_MAX_SIZE);
+		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_PADDR_GB,
+				      code_base + i * W6_REMAP_MAX_SIZE);
+	}
+}
+
+static int wave6_vpu_ctrl_init_vpu(struct vpu_ctrl *ctrl,
+				   struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+				       ctrl->sram_buf.dma_addr);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+				       ctrl->sram_buf.size);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CORE_START_GB, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "init vpu timeout\n");
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "init vpu fail, reason 0x%x\n", ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void wave6_vpu_ctrl_on_boot(struct wave6_vpu_entity *entity)
+{
+	if (!entity->on_boot)
+		return;
+
+	entity->on_boot(entity->dev);
+}
+
+static void wave6_vpu_ctrl_clear_firmware_buffers(struct vpu_ctrl *ctrl,
+						  struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	entity->write_reg(entity->dev, W6_VPU_HOST_INT_REQ, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "set buffer failed\n");
+		return;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "set buffer failed, reason 0x%x\n", ret);
+		return;
+	}
+}
+
+static int wave6_vpu_ctrl_require_buffer(struct device *dev,
+					 struct wave6_vpu_entity *entity)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	struct vpu_ctrl_buf *pbuf;
+	u32 size;
+	int ret = -ENOMEM;
+
+	if (!ctrl || !entity)
+		return -EINVAL;
+
+	size = entity->read_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_SIZE);
+	if (!size)
+		return 0;
+
+	pbuf = kzalloc(sizeof(*pbuf), GFP_KERNEL);
+	if (!pbuf)
+		goto exit;
+
+	pbuf->buf.size = size;
+	ret = wave6_alloc_dma(ctrl->dev, &pbuf->buf);
+	if (ret) {
+		kfree(pbuf);
+		goto exit;
+	}
+
+	list_add_tail(&pbuf->list, &ctrl->buffers);
+	entity->write_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_ADDR, pbuf->buf.daddr);
+exit:
+	entity->write_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_SIZE, 0);
+	return ret;
+}
+
+static void wave6_vpu_ctrl_clear_buffers(struct vpu_ctrl *ctrl)
+{
+	struct wave6_vpu_entity *entity;
+	struct vpu_ctrl_buf *pbuf, *tmp;
+
+	entity = list_first_entry_or_null(&ctrl->entities,
+					  struct wave6_vpu_entity, list);
+	if (entity)
+		wave6_vpu_ctrl_clear_firmware_buffers(ctrl, entity);
+
+	list_for_each_entry_safe(pbuf, tmp, &ctrl->buffers, list) {
+		list_del(&pbuf->list);
+		wave6_free_dma(&pbuf->buf);
+		kfree(pbuf);
+	}
+}
+
+static void wave6_vpu_ctrl_boot_done(struct vpu_ctrl *ctrl, int wakeup)
+{
+	struct wave6_vpu_entity *entity;
+
+	if (ctrl->state == WAVE6_VPU_STATE_ON)
+		return;
+
+	if (!wakeup)
+		wave6_vpu_ctrl_clear_buffers(ctrl);
+
+	list_for_each_entry(entity, &ctrl->entities, list)
+		wave6_vpu_ctrl_on_boot(entity);
+
+	dev_dbg(ctrl->dev, "boot done from %s\n", wakeup ? "wakeup" : "cold boot");
+
+	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_ON);
+}
+
+static bool wave6_vpu_ctrl_find_entity(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	struct wave6_vpu_entity *tmp;
+
+	list_for_each_entry(tmp, &ctrl->entities, list) {
+		if (tmp == entity)
+			return true;
+	}
+
+	return false;
+}
+
+static int wave6_vpu_ctrl_boot(struct vpu_ctrl *ctrl,
+			       struct wave6_vpu_entity *entity)
+{
+	u32 product_code;
+	int ret = 0;
+
+	product_code = entity->read_reg(entity->dev, W6_VPU_RET_PRODUCT_VERSION);
+	if (!PRODUCT_CODE_W_SERIES(product_code)) {
+		dev_err(ctrl->dev, "unknown product : %08x\n", product_code);
+		return -EINVAL;
+	}
+
+	wave6_vpu_ctrl_remap_code_buffer(ctrl);
+	ret = wave6_vpu_ctrl_init_vpu(ctrl, entity);
+	if (ret)
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+	else
+		wave6_vpu_ctrl_boot_done(ctrl, 0);
+
+	return ret;
+}
+
+static int wave6_vpu_ctrl_sleep(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_CMD_INSTANCE_INFO, 0);
+	entity->write_reg(entity->dev, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	entity->write_reg(entity->dev, W6_VPU_HOST_INT_REQ, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "sleep vpu timeout\n");
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_ctrl_wakeup(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	wave6_vpu_ctrl_remap_code_buffer(ctrl);
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+				       ctrl->sram_buf.dma_addr);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+				       ctrl->sram_buf.size);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CORE_START_GB, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "wakeup vpu timeout\n");
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		return -EIO;
+	}
+
+	wave6_vpu_ctrl_boot_done(ctrl, 1);
+
+	return 0;
+}
+
+static int wave6_vpu_ctrl_try_boot(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	if (ctrl->state != WAVE6_VPU_STATE_OFF && ctrl->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	if (entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC)) {
+		dev_dbg(ctrl->dev, "try boot directly as firmware is running\n");
+		wave6_vpu_ctrl_boot_done(ctrl, ctrl->state == WAVE6_VPU_STATE_SLEEP);
+		return 0;
+	}
+
+	if (ctrl->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_ctrl_wakeup(ctrl, entity);
+		return ret;
+	}
+
+	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_PREPARE);
+	return wave6_vpu_ctrl_boot(ctrl, entity);
+}
+
+static int wave6_vpu_ctrl_resume_and_get(struct device *dev,
+					 struct wave6_vpu_entity *entity)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	bool boot;
+	int ret;
+
+	if (!ctrl || !ctrl->available)
+		return -EINVAL;
+
+	if (!entity || !entity->dev || !entity->read_reg || !entity->write_reg)
+		return -EINVAL;
+
+	if (wave6_vpu_ctrl_find_entity(ctrl, entity))
+		return 0;
+
+	ret = pm_runtime_resume_and_get(ctrl->dev);
+	if (ret) {
+		dev_err(dev, "pm runtime resume fail, ret = %d\n", ret);
+		return ret;
+	}
+
+	boot = list_empty(&ctrl->entities) ? true : false;
+	list_add_tail(&entity->list, &ctrl->entities);
+	if (boot)
+		ret = wave6_vpu_ctrl_try_boot(ctrl, entity);
+	else if (ctrl->state == WAVE6_VPU_STATE_ON)
+		wave6_vpu_ctrl_on_boot(entity);
+
+	if (ret)
+		pm_runtime_put_sync(ctrl->dev);
+
+	return ret;
+}
+
+static void wave6_vpu_ctrl_put_sync(struct device *dev,
+				    struct wave6_vpu_entity *entity)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	if (!ctrl || !ctrl->available)
+		return;
+
+	if (!wave6_vpu_ctrl_find_entity(ctrl, entity))
+		return;
+
+	list_del_init(&entity->list);
+	if (list_empty(&ctrl->entities)) {
+		if (!entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC))
+			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		else
+			wave6_vpu_ctrl_sleep(ctrl, entity);
+	}
+
+	if (!pm_runtime_suspended(ctrl->dev))
+		pm_runtime_put_sync(ctrl->dev);
+}
+
+static const struct wave6_vpu_ctrl_ops wave6_vpu_ctrl_ops = {
+	.get_ctrl = wave6_vpu_ctrl_resume_and_get,
+	.put_ctrl = wave6_vpu_ctrl_put_sync,
+	.require_work_buffer = wave6_vpu_ctrl_require_buffer,
+};
+
+static void wave6_vpu_ctrl_init_reserved_boot_region(struct vpu_ctrl *ctrl)
+{
+	if (ctrl->boot_mem.size < WAVE6_CODE_BUF_SIZE) {
+		dev_warn(ctrl->dev, "boot memory size (%zu) is too small\n", ctrl->boot_mem.size);
+		ctrl->boot_mem.phys_addr = 0;
+		ctrl->boot_mem.size = 0;
+		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
+		return;
+	}
+
+	ctrl->boot_mem.vaddr = devm_memremap(ctrl->dev,
+					     ctrl->boot_mem.phys_addr,
+					     ctrl->boot_mem.size,
+					     MEMREMAP_WC);
+	if (!ctrl->boot_mem.vaddr) {
+		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
+		return;
+	}
+
+	ctrl->boot_mem.dma_addr = dma_map_resource(ctrl->dev,
+						   ctrl->boot_mem.phys_addr,
+						   ctrl->boot_mem.size,
+						   DMA_BIDIRECTIONAL,
+						   0);
+	if (!ctrl->boot_mem.dma_addr) {
+		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
+		return;
+	}
+}
+
+static int wave6_vpu_ctrl_thermal_update(struct device *dev, int state)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (wave6_cooling_disable || state > ctrl->thermal_max || !ctrl->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(ctrl->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(dev, "receive cooling set state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(ctrl->dev, new_clock_rate);
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(dev, "failed to set perf to %lu (ret = %d)\n", new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				       unsigned long *state)
+{
+	struct vpu_ctrl *ctrl = cdev->devdata;
+
+	*state = ctrl->thermal_max;
+
+	return 0;
+}
+
+static int wave6_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+				       unsigned long *state)
+{
+	struct vpu_ctrl *ctrl = cdev->devdata;
+
+	*state = ctrl->thermal_event;
+
+	return 0;
+}
+
+static int wave6_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+				       unsigned long state)
+{
+	struct vpu_ctrl *ctrl = cdev->devdata;
+	struct wave6_vpu_entity *entity;
+
+	ctrl->thermal_event = state;
+
+	list_for_each_entry(entity, &ctrl->entities, list) {
+		if (entity->pause)
+			entity->pause(entity->dev, 0);
+	}
+
+	wave6_vpu_ctrl_thermal_update(ctrl->dev, state);
+
+	list_for_each_entry(entity, &ctrl->entities, list) {
+		if (entity->pause)
+			entity->pause(entity->dev, 1);
+	}
+
+	return 0;
+}
+
+static struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_cooling_get_max_state,
+	.get_cur_state = wave6_cooling_get_cur_state,
+	.set_cur_state = wave6_cooling_set_cur_state,
+};
+
+static void wave6_cooling_remove(struct vpu_ctrl *ctrl)
+{
+	thermal_cooling_device_unregister(ctrl->cooling);
+
+	kfree(ctrl->freq_table);
+	ctrl->freq_table = NULL;
+}
+
+static void wave6_cooling_init(struct vpu_ctrl *ctrl)
+{
+	int i;
+	int num_opps;
+	unsigned long freq;
+
+	num_opps = dev_pm_opp_get_opp_count(ctrl->dev);
+	if (num_opps <= 0) {
+		dev_err(ctrl->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		goto error;
+	}
+
+	ctrl->freq_table = kcalloc(num_opps, sizeof(*ctrl->freq_table), GFP_KERNEL);
+	if (!ctrl->freq_table)
+		goto error;
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(ctrl->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(ctrl->dev, "[%d] = %ld\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		ctrl->freq_table[i] = freq;
+		ctrl->thermal_max = i;
+	}
+
+	if (!ctrl->thermal_max)
+		goto error;
+
+	ctrl->thermal_event = 0;
+	ctrl->cooling = thermal_of_cooling_device_register(ctrl->dev->of_node,
+							   (char *)dev_name(ctrl->dev),
+							   ctrl,
+							   &wave6_cooling_ops);
+	if (IS_ERR(ctrl->cooling)) {
+		dev_err(ctrl->dev, "register cooling device failed\n");
+		goto error;
+	}
+
+	return;
+error:
+	wave6_cooling_remove(ctrl);
+}
+
+static int wave6_vpu_ctrl_register_device(struct vpu_ctrl *ctrl)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(ctrl->dev->parent);
+
+	if (!vpu || !vpu->ops)
+		return -EPROBE_DEFER;
+
+	return call_vop(vpu, reg_ctrl, ctrl->dev, &wave6_vpu_ctrl_ops);
+}
+
+static void wave6_vpu_ctrl_unregister_device(struct vpu_ctrl *ctrl)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(ctrl->dev->parent);
+
+	if (!vpu || !vpu->ops)
+		return;
+
+	call_void_vop(vpu, unreg_ctrl, ctrl->dev);
+}
+
+static void wave6_vpu_ctrl_load_firmware(const struct firmware *fw, void *context)
+{
+	struct vpu_ctrl *ctrl = context;
+	int ret;
+
+	mutex_lock(&ctrl->lock);
+
+	if (!fw || !fw->data) {
+		dev_err(ctrl->dev, "No firmware.\n");
+		return;
+	}
+
+	if (!ctrl->available)
+		goto exit;
+
+	if (fw->size + WAVE6_EXTRA_CODE_BUF_SIZE > wave6_vpu_ctrl_get_code_buf_size(ctrl)) {
+		dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
+			fw->size, ctrl->boot_mem.size);
+		ctrl->available = false;
+		goto exit;
+	}
+
+	memcpy(ctrl->boot_mem.vaddr, fw->data, fw->size);
+
+	ret = wave6_vpu_ctrl_register_device(ctrl);
+	if (ret) {
+		dev_err(ctrl->dev, "register vpu ctrl fail, ret = %d\n", ret);
+		ctrl->available = false;
+		goto exit;
+	}
+
+exit:
+	mutex_unlock(&ctrl->lock);
+	release_firmware(fw);
+}
+
+static int wave6_vpu_ctrl_probe(struct platform_device *pdev)
+{
+	struct vpu_ctrl *ctrl;
+	struct device_node *np;
+	const struct vpu_ctrl_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
+		return ret;
+	}
+
+	res = of_device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	mutex_init(&ctrl->lock);
+	INIT_LIST_HEAD(&ctrl->entities);
+	INIT_LIST_HEAD(&ctrl->buffers);
+	dev_set_drvdata(&pdev->dev, ctrl);
+	ctrl->dev = &pdev->dev;
+	ctrl->res = res;
+	ctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->reg_base))
+		return PTR_ERR(ctrl->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &ctrl->clks);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+	ctrl->num_clks = ret;
+
+	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			ctrl->boot_mem.phys_addr = mem.start;
+			ctrl->boot_mem.size = resource_size(&mem);
+			wave6_vpu_ctrl_init_reserved_boot_region(ctrl);
+		} else {
+			dev_warn(&pdev->dev, "boot resource is not available.\n");
+		}
+	}
+
+	ctrl->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (ctrl->sram_pool) {
+		ctrl->sram_buf.size = ctrl->res->sram_size;
+		ctrl->sram_buf.vaddr = gen_pool_dma_alloc(ctrl->sram_pool,
+							  ctrl->sram_buf.size,
+							  &ctrl->sram_buf.phys_addr);
+		if (!ctrl->sram_buf.vaddr)
+			ctrl->sram_buf.size = 0;
+		else
+			ctrl->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								   ctrl->sram_buf.phys_addr,
+								   ctrl->sram_buf.size,
+								   DMA_BIDIRECTIONAL,
+								   0);
+	}
+
+	wave6_cooling_init(ctrl);
+
+	pm_runtime_enable(&pdev->dev);
+	ctrl->available = true;
+
+	ret = firmware_request_nowait_nowarn(THIS_MODULE,
+					     ctrl->res->fw_name,
+					     &pdev->dev,
+					     GFP_KERNEL,
+					     ctrl,
+					     wave6_vpu_ctrl_load_firmware);
+	if (ret) {
+		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	pm_runtime_disable(&pdev->dev);
+	wave6_cooling_remove(ctrl);
+	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
+		dma_unmap_resource(&pdev->dev,
+				   ctrl->sram_buf.dma_addr,
+				   ctrl->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(ctrl->sram_pool,
+			      (unsigned long)ctrl->sram_buf.vaddr,
+			      ctrl->sram_buf.size);
+	}
+	if (ctrl->boot_mem.dma_addr)
+		dma_unmap_resource(&pdev->dev,
+				   ctrl->boot_mem.dma_addr,
+				   ctrl->boot_mem.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+	mutex_destroy(&ctrl->lock);
+
+	return ret;
+}
+
+static void wave6_vpu_ctrl_remove(struct platform_device *pdev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
+
+	mutex_lock(&ctrl->lock);
+
+	ctrl->available = false;
+	wave6_vpu_ctrl_clear_buffers(ctrl);
+	wave6_vpu_ctrl_unregister_device(ctrl);
+
+	mutex_unlock(&ctrl->lock);
+
+	pm_runtime_disable(&pdev->dev);
+	wave6_cooling_remove(ctrl);
+	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
+		dma_unmap_resource(&pdev->dev,
+				   ctrl->sram_buf.dma_addr,
+				   ctrl->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(ctrl->sram_pool,
+			      (unsigned long)ctrl->sram_buf.vaddr,
+			      ctrl->sram_buf.size);
+	}
+	if (ctrl->boot_mem.dma_addr)
+		dma_unmap_resource(&pdev->dev,
+				   ctrl->boot_mem.dma_addr,
+				   ctrl->boot_mem.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+	mutex_destroy(&ctrl->lock);
+}
+
+static int __maybe_unused wave6_vpu_ctrl_runtime_suspend(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ctrl->num_clks, ctrl->clks);
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_ctrl_runtime_resume(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(ctrl->num_clks, ctrl->clks);
+}
+
+static const struct dev_pm_ops wave6_vpu_ctrl_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_ctrl_runtime_suspend,
+			   wave6_vpu_ctrl_runtime_resume, NULL)
+};
+
+static const struct of_device_id wave6_vpu_ctrl_ids[] = {
+	{ .compatible = "nxp,imx95-vpu-ctrl", .data = &wave633c_ctrl_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ctrl_ids);
+
+static struct platform_driver wave6_vpu_ctrl_driver = {
+	.driver = {
+		.name = VPU_CTRL_PLATFORM_DEVICE_NAME,
+		.of_match_table = wave6_vpu_ctrl_ids,
+		.pm = &wave6_vpu_ctrl_pm_ops,
+	},
+	.probe = wave6_vpu_ctrl_probe,
+	.remove = wave6_vpu_ctrl_remove,
+};
+
+module_platform_driver(wave6_vpu_ctrl_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU CTRL driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
new file mode 100644
index 000000000000..838e426b3317
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - product config definitions
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUCONFIG_H__
+#define __WAVE6_VPUCONFIG_H__
+
+#define WAVE617_CODE                    0x6170
+#define WAVE627_CODE                    0x6270
+#define WAVE633_CODE                    0x6330
+#define WAVE637_CODE                    0x6370
+#define WAVE663_CODE                    0x6630
+#define WAVE677_CODE                    0x6670
+
+#define PRODUCT_CODE_W_SERIES(x) ({					\
+		int c = x;						\
+		((c) == WAVE617_CODE ||	(c) == WAVE627_CODE ||		\
+		 (c) == WAVE633_CODE || (c) == WAVE637_CODE ||		\
+		 (c) == WAVE663_CODE || (c) == WAVE677_CODE);		\
+})
+
+#define WAVE627ENC_WORKBUF_SIZE         (512 * 1024)
+#define WAVE637DEC_WORKBUF_SIZE         (2 * 512 * 1024)
+#define WAVE637DEC_WORKBUF_SIZE_FOR_CQ  (3 * 512 * 1024)
+
+#define MAX_NUM_INSTANCE                32
+
+#define W6_MAX_PIC_STRIDE               (4096U * 4)
+#define W6_PIC_STRIDE_ALIGNMENT         32
+#define W6_FBC_BUF_ALIGNMENT            32
+#define W6_DEC_BUF_ALIGNMENT            32
+#define W6_DEF_DEC_PIC_WIDTH            720U
+#define W6_DEF_DEC_PIC_HEIGHT           480U
+#define W6_MIN_DEC_PIC_WIDTH            64U
+#define W6_MIN_DEC_PIC_HEIGHT           64U
+#define W6_MAX_DEC_PIC_WIDTH            4096U
+#define W6_MAX_DEC_PIC_HEIGHT           4096U
+#define W6_DEC_PIC_SIZE_STEP            1
+
+#define W6_DEF_ENC_PIC_WIDTH            416U
+#define W6_DEF_ENC_PIC_HEIGHT           240U
+#define W6_MIN_ENC_PIC_WIDTH            256U
+#define W6_MIN_ENC_PIC_HEIGHT           128U
+#define W6_MAX_ENC_PIC_WIDTH            4096U
+#define W6_MAX_ENC_PIC_HEIGHT           4096U
+#define W6_ENC_PIC_SIZE_STEP            8
+#define W6_ENC_CROP_X_POS_STEP          32
+#define W6_ENC_CROP_Y_POS_STEP          2
+#define W6_ENC_CROP_STEP                2
+
+#define W6_VPU_POLL_DELAY_US            10
+#define W6_VPU_POLL_TIMEOUT             300000
+#define W6_BOOT_WAIT_TIMEOUT            10000
+#define W6_VPU_TIMEOUT                  6000
+#define W6_VPU_TIMEOUT_CYCLE_COUNT      (8000000 * 4 * 4)
+
+#define HOST_ENDIAN                     VDI_128BIT_LITTLE_ENDIAN
+#define VPU_FRAME_ENDIAN                HOST_ENDIAN
+#define VPU_STREAM_ENDIAN               HOST_ENDIAN
+#define VPU_USER_DATA_ENDIAN            HOST_ENDIAN
+#define VPU_SOURCE_ENDIAN               HOST_ENDIAN
+
+#define USE_SRC_PRP_AXI         0
+#define USE_SRC_PRI_AXI         1
+#define DEFAULT_SRC_AXI         USE_SRC_PRP_AXI
+
+#define COMMAND_QUEUE_DEPTH             (1)
+
+#define W6_REMAP_INDEX0                 0
+#define W6_REMAP_INDEX1                 1
+#define W6_REMAP_MAX_SIZE               (1024 * 1024)
+
+#define WAVE6_ARBUF_SIZE                (1024)
+#define WAVE6_MAX_CODE_BUF_SIZE         (4 * 1024 * 1024)
+#define WAVE6_CODE_BUF_SIZE             (1 * 1024 * 1024)
+#define WAVE6_EXTRA_CODE_BUF_SIZE       (256 * 1024)
+#define WAVE6_TEMPBUF_SIZE              (3 * 1024 * 1024)
+
+#define WAVE6_UPPER_PROC_AXI_ID     0x0
+
+#endif /* __WAVE6_VPUCONFIG_H__ */
-- 
2.31.1


