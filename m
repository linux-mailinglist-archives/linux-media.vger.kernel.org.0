Return-Path: <linux-media+bounces-14740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4892B2A8
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA0D1C20F83
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21A5154429;
	Tue,  9 Jul 2024 08:54:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2131.outbound.protection.partner.outlook.cn [139.219.17.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DC1534E7;
	Tue,  9 Jul 2024 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515270; cv=fail; b=V6bP30jUJdRM9bn+FCqrcfde/RktW31qvMOLR7J8aUa/EImYNup5gex+JO20sIcUDggBYd6clAgqMruVJ7nNmWImG5KmEg/fOBkYm82atlJvO2dAe+4Cm4D/7jex0CLIjyPq5/fLjssDBFlqKGKbfl60HxnJrGHEoAKmYvuw/Y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515270; c=relaxed/simple;
	bh=/mxQu4WduGh6JD4sZXvDc1CLTky9/6p47pP4582ec9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnbBcVHN8Xl32DKnEV19FOBU/pdwECRn3wt9I8MNhQHpNymx8WTEOomOYkkg/GjoZHvRQ9/n6LNKQ8BJxDWQ2TqaN4/iqVCGXbJkyZpfTR2Pv40afZYfjG3VX+D3pSNLLpTvlbiaTdNc6N1hzJGmkcSee35yBnjXhSLqz6FiJ08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iebXpODS6qmxvWY/FJ2otgk76khKVmD9c7N1kuqHmxU87/0cKPHDb2tGF4E+85e5L0OgueZT2kCuN4UP27QF3o9egrLItcdLhg+FGKti6qYLGfxVDet/w5ySsi99ZxLWP+tMaYYMy+cxd3JqQ5QRkG2D9m1GFu0lIvt/qSx5f+hUdZ6JsqYvbtgS0GBlQqMj5PEvhsxLQXVn/AA+Wx+dIYkim7aHj6WuTbILjvA4pkLxYlyEOL5fGn46lUvocqgWUlnTNVcxio5drCiGIFHHt+S6fYnyZtHkluxTgJj/wMPc583iDLD6C8BnUqZDiRZ/tlnOxHApNRqBtmbeAKvyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzJBv6I7SOZTWtP6BxFOw4KAIl21sUnsGEZ9hjJVPDc=;
 b=UFvw4YkDo1ILEZcYrTgtj0tJpKntmanOT+oiU0dwTcsuQZfUmdMEQLUGpwMXsF48EdiN48v2xpnvPNCs3tX10nxdk3QcmQFbudA5Bn5nZnK2xM7uvqU3rT891vYz0dE2KB/bWJ0zfq5OtMs1mks2C5nqCZ+bei+Iv6JlijNTelDsi2t9tBaoL1CklDfwJPchZWCWHugWhiRXul+B54sCa+RILmAGy0Dp8d+kud7AKxP2twwM2x71o0gD9NpvKxjEw1WMUUjXaYijRvHWPm3S0HC9IuYQyrH20F5tcGDwrkDLpeW7CJzW3dBuoWNEd1Dm27feICwdMQdV9bmPmsIksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:34 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:34 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 02/14] media: Documentation: Add description for StarFive ISP metadata formats
Date: Tue,  9 Jul 2024 01:38:12 -0700
Message-Id: <20240709083824.430473-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: 222ee995-6f60-4249-6ec1-08dc9ff2851a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	so+phR7o1IN0Glh0NEJhpZ5q/Yy3ig6RMee5B2U9zUgJQIgsESKeCrKAOXUzuoSI3ie/cGMzgCbIB1peRzuOOEQ9orDConVSBVAWkCa6qm8NzfDM1i42B9F8ZUYXWXJ7EKmXWuEoDT2NOYFWvl39IQcJVCaXSw+Bz5VQKtWnlL1OK6Yye6VZ/8vOpsAbdMEpKqEQViD5tXxjRuoUcQZD+l8D100X0IYJWxfUvwruNnJft+KhCqD1Y7NkB6SiIT90U8KLfGuesDoWZ1Syu0BDPYithzHBvFwY5v6KugsmpcJsNOlqMn1Y9KfE8iiuEW0RA6jKgA7T+FOdm97ZeBocKuDCo1hWeeIHVSZsJVYmSJXlkzijvEYx8piNFeYt9/ej7kpY1VqUY6ZcgjgTu6ZV2wCiLzPc9YVhs9lDc+W7h4wVDW3QXM96Ru7N5TgwtrWF8F59wf0vSvCmH+TvVvlMaT15wwXZdwXtuYLHDNiwt2qZGLpwfsZ9XTU8LXfMj2ZEGTm5Ff33mm7ArSgautf6UtEDqGmLy7FRg8B3OTG8BSAoXyq50iylyPC1zOeWTed/5LTmRVueCHil9aMve4JztTC97Nc+IOOa46U+L8V+SV19uJCBC/bo/FkLEhL2WjSy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zae6CNFFcYnprjyK+X4HyedggtaQ3e+MUVVraTQrtZuzsSBcXrg8cxTd2PZP?=
 =?us-ascii?Q?kUHltGK4/ZSNPHpOxvbJRuAiBkVd+JZCpZAZXp567rVVrwUtT1byU811QhXc?=
 =?us-ascii?Q?hPnpKO5QyF7dCmJFQdqZ491LbUz39eBdIy8NMKfe1VDEj9+B9m3S2dQgTcLB?=
 =?us-ascii?Q?3LkTK+gR4E7rjr0uo3ed36V1JnmJBPUd9Scj/VNew6JIz4JeqIkuCVM0e/Qv?=
 =?us-ascii?Q?kiF8Fzf4hX0Tsm7s+SjbXWURPfU+EVFJT3XRjEg3lxoosFRosRT/mB7qrMRa?=
 =?us-ascii?Q?AaBU+SM8iFHE+VpwXe+rGvzj1bJnVsnJDKvug02soNa8ubJ/A/a3iWIj1T5e?=
 =?us-ascii?Q?tLiwH06UoVsVC5VcqopIsFckSrliqCrEr/SnEa3p6g5+wK3dHumEAd1ybtJO?=
 =?us-ascii?Q?Rne1KXqlVlsi20xZmwz0zjceDKr7wWCi7pp1en8CBI7hbMmCDQIVIg0wsUH0?=
 =?us-ascii?Q?3cc8jD3JFeEr2WrjrzdC+zfkukdHBT6D8mfKrstNRs7WX3lNKB2p3ZILIyT7?=
 =?us-ascii?Q?NX2cjT1JTXrYtWyioiHljGHqAZRw5lfHy9WMWH13OelIDZ3E6dFSCojutzoq?=
 =?us-ascii?Q?DSnF3EetkFo9h5kQ5OLgdcVzlOhsvVuC7kcqgDDw5+l3Ca0+m2lg3AEOpro8?=
 =?us-ascii?Q?wuPfXHPgGNiLAp6nZoHwqoqG3//WN5oX9ss3tSXqimhnqXc83JJFud01MbdZ?=
 =?us-ascii?Q?NVTS5GlsFmEpYixcHxvMTeP68UypUgvN/R+R72c998mztjOjo0Riae8epXaO?=
 =?us-ascii?Q?j1ODTi4lQGykve8NF22jP5QpJyBy45xCvjLNtNxUx8MqPukjRdnVGT4jc2af?=
 =?us-ascii?Q?mLcRbzKtN33JY6FFsE9Kser/XSmPUg3kJnqdN1dZvONaKHcY5mk3ce6Nl/gR?=
 =?us-ascii?Q?4w7cTwGnbOMY/DkwMDMvQs1j4CGzGjtRF9B9C8W1PQF9xsyKnCJPHwL4oi1K?=
 =?us-ascii?Q?ctu9ARO8R4KYi0ceNw1Wp19G3AlwUyuzrG41lvDR5khAVPe5+TGAySiaVnGS?=
 =?us-ascii?Q?fDMfnAYwkiKQplE82ecIo/0GYUycV1pDrt6sNddLgQnlDjrBSOG0ktvd41qM?=
 =?us-ascii?Q?3Qx2Ww+gQdQf3jo1hg61sjW/NqLd0YiXDYz/v8XXFsyjCT3Wy4rlqzfF/Hp+?=
 =?us-ascii?Q?64ylxcpN3lXWIiLw7S/+9//l+IxdP8dY9sSYRiojrzJ207U0Ozsza/MwlPHC?=
 =?us-ascii?Q?8eGVPfdTC0wBAPEWATzUBIAM63Az02gATjW0LLkGR5jcvk0YxOB577UFrimT?=
 =?us-ascii?Q?FFGE3uzGG8/+t3nluxOjmduhgZLFxqgBoMWBPchPdCwpbagwCOajM/5GOuhj?=
 =?us-ascii?Q?1dP5u6NTLZMu30lLdwED3f8I4FZukjWePzQIxhsw4SWrNFbyAcShud4SXiSt?=
 =?us-ascii?Q?VZqdb7u7CDbrxD23MRO3eC4UCdIsw5EXXnII9W0t1NwT/RUMtkTz8WQSUKeU?=
 =?us-ascii?Q?nX3/b7cZDSStmEh+rwi74ryBt+VvsWNY5eMzaoMz1jHscGZ1/9aSszfoWErd?=
 =?us-ascii?Q?uw/Wlk2MvIHVfPXzcp1GE9C2PeEjpa1gTg73yr5TIWN/2qnw3s2xsISnWIjJ?=
 =?us-ascii?Q?owxhG/OX6vylzbybr6Um3iSxWmOLYUNq03u78TUfdgFPItuOA5AoT2J9A1Mw?=
 =?us-ascii?Q?hFRSKrDEJu3ruRBI0ABUjcM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222ee995-6f60-4249-6ec1-08dc9ff2851a
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:34.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab2xpvlk/MJP5Vyqg9yzl3fPI/hxBz3A2TbM96N5DH+vzvtEMYRDHVDLL1JrsHswUCdi3RF8Zvo9++XYjGSmeK0LhpgmWqJsIu4O1hZe31eZ+YpoVXKXyClFQzt3fqi6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add description for V4L2_META_FMT_STF_ISP_PARAMS and
V4L2_META_FMT_STF_ISP_STAT_3A meta data formats.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../media/v4l/metafmt-starfive-isp.rst        | 75 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst

diff --git a/Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
new file mode 100644
index 000000000000..ebb4291833d6
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
@@ -0,0 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-stf-isp-params:
+
+.. _v4l2-meta-fmt-stf-isp-stat-3a:
+
+*****************************************************************************
+V4L2_META_FMT_STF_ISP_PARAMS ('stfp'), V4L2_META_FMT_STF_ISP_STAT_3A ('stfs')
+*****************************************************************************
+
+.. jh7110_isp_params_buffer
+
+Configuration parameters
+========================
+
+The configuration parameters are passed to the "output_params" metadata output
+video node, using the :c:type:`v4l2_meta_format` interface. They are formatted
+as described by the :c:type:`jh7110_isp_params_buffer` structure.
+
+.. code-block:: c
+
+	struct jh7110_isp_params_buffer {
+		__u32 enable_setting;
+		struct jh7110_isp_wb_setting wb_setting;
+		struct jh7110_isp_car_setting car_setting;
+		struct jh7110_isp_ccm_setting ccm_setting;
+		struct jh7110_isp_cfa_setting cfa_setting;
+		struct jh7110_isp_ctc_setting ctc_setting;
+		struct jh7110_isp_dbc_setting dbc_setting;
+		struct jh7110_isp_dnyuv_setting dnyuv_setting;
+		struct jh7110_isp_gmargb_setting gmargb_setting;
+		struct jh7110_isp_lccf_setting lccf_setting;
+		struct jh7110_isp_obc_setting obc_setting;
+		struct jh7110_isp_oecf_setting oecf_setting;
+		struct jh7110_isp_r2y_setting r2y_setting;
+		struct jh7110_isp_sat_setting sat_setting;
+		struct jh7110_isp_sharp_setting sharp_setting;
+		struct jh7110_isp_ycrv_setting ycrv_setting;
+		struct jh7110_isp_sc_setting sc_setting;
+	};
+
+.. jh7110_isp_sc_buffer
+
+3A and histogram statistics
+===========================
+
+The ISP device collects different statistics over an input Bayer frame.
+Those statistics are obtained from the "capture_scd" metadata capture video
+node, using the :c:type:`v4l2_meta_format` interface. They are formatted as
+described by the :c:type:`jh7110_isp_sc_buffer` structure.
+
+.. code-block:: c
+
+	struct jh7110_isp_sc_buffer {
+		__u32 y_histogram[64];
+		__u32 reserv0[33];
+		__u32 bright_sc[4096];
+		__u32 reserv1[96];
+		__u32 ae_hist_y[128];
+		__u32 reserv2[511];
+		__u16 flag;
+	};
+
+The statistics collected are Auto Exposure, AWB (Auto-white balance), Histogram
+and AF (Auto-focus). See :c:type:`jh7110_isp_sc_buffer` for details of the
+statistics.
+
+The 3A statistics and configuration parameters described here are usually
+consumed and produced by dedicated user space libraries that comprise the
+important tuning tools using software control loop.
+
+JH7110 ISP uAPI data types
+======================
+
+.. kernel-doc:: include/uapi/linux/jh7110-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 890604eb0d64..8fd613c93e62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21304,6 +21304,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/starfive_camss.rst
 F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
+F:	Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
 F:	drivers/staging/media/starfive/camss
 F:	include/uapi/linux/jh7110-isp.h
 
-- 
2.25.1


