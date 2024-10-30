Return-Path: <linux-media+bounces-20550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E19B59E7
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B438F1C22D1B
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317C81946C9;
	Wed, 30 Oct 2024 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pb2RA2YZ"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013008.outbound.protection.outlook.com [52.101.67.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC0D1C3F0D;
	Wed, 30 Oct 2024 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730254952; cv=fail; b=a6Agf4esoZ4aeLUrbtW80vib2LtOylCpexj8xH9MNdRQW4EBNUc2+kKwxtLgyy+r/wi/VMzvmJbJO8CvyUzBG6oSdDpdhvnrsQGJ6Kiy+2vLF1GZMvhqeqyqbXi/D6lQMut63vgLLdeE7rK1Q4NV0o+6dxqHlheRXiU6g6zEUJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730254952; c=relaxed/simple;
	bh=SY0GV+c/N+VDgcZRcsaREGLlZn5wHMFCW9SHvdpgAvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qeaKEWDUTVP2YfGuPNJlvRt6O+m8ykRNzZfYk7qSzpTsqmXEwSwGSrzxfnDx8LMAsbXMmH3ipRcj4GaDp73oIFoj6REhYSUv3FyFszHnYTuyZjOH8JDX27xtxn9SkvOo9z+onCZ5ITd9cy79iQIMAztARxpyGpGGSf+aaVsXn4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pb2RA2YZ; arc=fail smtp.client-ip=52.101.67.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkrC/jTYZF5at5M4lT4igD8NcUTzbJpGj5Ca9kuSdlmAWWisu7nD9DMjgDRXOWPhlyBNMvlVGllhTjXHLKMFyAtnagDwdMY6PTAttEFaZ1f8XENxL2Uh9hvMhSrvJDLREaMZMkf4yW9U/4FKRyU0kyawJIuMPeOwK4xIHAVqTMA5Bo8Ls/z7NcdwU6sAGAZkOP5L+qbT9r1Fqznp6+yKEjmtXGS+rNhKU5NOtGFBDDqSTLCGY3hOd/SJHA07rI5PKQ0OtUCzm+wdiqtqa3nlAISAfFKmShMTm9DeN05pnOU7/T2piCOxsLGZgcFMLJbhrIyxg4Z+jamph6ImHVCuzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5TvcF8N9GZyht/lUPnUCnLWkfK2hUkPwF3iS5kuBe4=;
 b=hvS+9mq2mCEAQunRsvxgs9ly1kzZ5RkUdSyn9PH4Ojaq41BAlg4d2921COpHOuDAD5xdoc+Vyz+qavsCWzv7kYSNBCktZrTqcyIFX3ZEvYJDoFyTJR021160xKWZPUUt3MfcA7EpMQvHtYkznrdDrDpvzS7Uzh/hud+i/1G6Y7z+vllcTEEAid0CZL6Va3V6ghZDFXcCJsWawvgOGaBKHb/3BRDoE8Sh808+QOndy93a84+x1pRzgOTTMRHVNTzrUQbr76crcMibwq/JQZN0HL/6vzHti4Sx2raMEKYENTdwQoLV9uy870MQoqw5RPCWi8OldRteaZr/RMT6AUEG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5TvcF8N9GZyht/lUPnUCnLWkfK2hUkPwF3iS5kuBe4=;
 b=pb2RA2YZ8kKsf3pkTGxPJaP7rTnaGUq5maEIE4qnX2hhV8y+BYxywBNnfdku31FH3whHmvosoXHyC2bzhC43ouluNZdd+6Z1xW7UKmUl5bT/kvA/PSHppyxS7nye62n1RxFb68xpsEeSG6YwpP+ep1Q5PHKSWUf9Y8r4DRaE3QXvdso82ZAyltupMgLTnVaUkcw50QsVItJfwS27FBpqMWoRozqKfbseMjAzGyOffa3k3v9BP0nnWQlZCCafqHmkqUQ6QaWLB1ogRXvD/P+88UgMUBshO/A1eozWN2lhFszv4Pms1TXIGa6K7rV8YaMM6LbFw47ygcJSkcOdNLxjRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:22:26 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:22:26 +0000
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
Subject: [RFC v4 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
Date: Wed, 30 Oct 2024 11:21:34 +0900
Message-ID: <20241030022134.1098589-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 5216e4d7-ee99-4f89-cc40-08dcf889b20a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LSXjkSrc1ZHXxmBVHKt4Sa68OIf7jxNC50ikU37SGI1RhqkNrowsfTEbGics?=
 =?us-ascii?Q?UtXAAz7rghLKBtXC51tA/vd0dbdA6wro+Gk+EUnjNOgMAqoCeXTfCyV6Q/Mq?=
 =?us-ascii?Q?OpNVEe4mq5KtuvljyfxoNfO20nc3+JkMfkIE2hF64MZNeS0VNguskA8KkdIB?=
 =?us-ascii?Q?1ogkgTIc4uIZUWIt7/zxATSkjNyeQ1c8pKWMAmfI9Vre6LhyypkZqNxSv84g?=
 =?us-ascii?Q?QDU4ZA843Tp54xvrq5TwRNqEsRpbdKbC+zfmDP5HJH4IuAPDv6RhFneHOiOi?=
 =?us-ascii?Q?AOSV+q//o4UsTyGA/mUUJGF3dwI8bCZTYHjuMa4aOufvkMjErWXCAH7OfAEz?=
 =?us-ascii?Q?TvmgjC0y+45+2mbaTnDxmneoqr70eZsALVdIViR5L09CyC8/EDn5AioWO5gV?=
 =?us-ascii?Q?0XM5jJZubKB/PQdoWfcFEkUmPYnXSvasqStER2oW/e1EmiFKXoYC/tI4nFKz?=
 =?us-ascii?Q?v5UhjHli3dj7vep3P+/CI7FMmkgfMPBvnVH/z983igZxomleUmBTNXlCyWx9?=
 =?us-ascii?Q?ecp5HW7yKc1Kb5tpfvksufj0oUpyTZgLEKDVW8tkAtac9oFPORMKd4gXmRrD?=
 =?us-ascii?Q?pngF/i/RbjpocIhBw6EATbzWcxhCE7WyKLZGgeg8+VMG2c3loB5W5AhBBj9/?=
 =?us-ascii?Q?9Q3pVcqVbHDR3wirwHB4KBLPpO7WqGSxNP5Ln2c4sf7Ct0eNAumljj1bElGo?=
 =?us-ascii?Q?P/2mUMy/WBuZoFe2W49OXcNz+G5rQJail/rp07jY9LLJU1KO3n+l+dBYwRRh?=
 =?us-ascii?Q?aVzpqHdMzMdWkgo+gEd5XRWoI6y4sEXVbmwcor5Om/wa2zzBX3kusYPO/bvc?=
 =?us-ascii?Q?wQYpp/g352u8ci01L8XxvIiZESf8AogCFfy93XW5UyEeaCdaweNNkL6iYo4s?=
 =?us-ascii?Q?j1MFE8uJU2OB5jOqvcigsV0p1yhbvEISnHKADm/clRD+EPGQkwbf4Q5IWIvA?=
 =?us-ascii?Q?ExvHB0vDljJ+tKVtD817qO+BcSUyyXtmoyroN+oY3o6L9EuPvDNdlsyiqRnW?=
 =?us-ascii?Q?dD2jUUzg4pYFI5OgN/KDyNBqwFatY1gxbTBgo/W3GTEXKAVl/vGtG/Kp92jm?=
 =?us-ascii?Q?qjNhQuKnYxcxCaLY0VGd5dy/JJqJE+Ij3QgAaMBVyfjAu/KeThqHKv/H7kVu?=
 =?us-ascii?Q?AufbdLZyc18viiqGxG9d/fytasaI37tv5k1BwMmVAavVo68tBNXdHcfcAbpS?=
 =?us-ascii?Q?rDX7qm97O7jHHtGJIor7rws74n5t1k4I5cAMXHKp6Eo5F/TN+Fuc/C4qJGm6?=
 =?us-ascii?Q?vywVxJs5OEOt2Xdi6ARFqb8yV4JuLZPOHG9sM+a7sGG3kUcWU4sQtqePeYNy?=
 =?us-ascii?Q?Hzyp/kDgYpYZCAZUUehERXEMlxA0Xug/2sKFBnqlvMz5ECPNAOsvTQc/+noJ?=
 =?us-ascii?Q?LcHuN8I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eff69SYj1zwU8Qkx31WirkRDswxHPW1UiEYCHeQzOZXYpvUoRuh30fdgJViE?=
 =?us-ascii?Q?2YXwhJweMUsDmO/W9JFLKzhalgPH5CqKozzL/Ym0NRj4a8BJ+2d619wyRK+F?=
 =?us-ascii?Q?oaM3gIRtBUZLT9c0tGVx7mETrslW6hDzIjteXWztHrBQGlzTg4w75g3XXwA7?=
 =?us-ascii?Q?rmGQc51CCgnz88sLqCsfoPmGpJ8C46+kFwYcdZGLxt2/q1HidkiXt57jRn4t?=
 =?us-ascii?Q?KZ5B6ZsvkRkScKW820/Ht6h6im1IPvICZSc1POCiG69YUDc+yDg3VrRnOTJT?=
 =?us-ascii?Q?l5PXYAweqTwW37z2ua60ZxnSM6PmYcd31FDDEpFNgAKYoN3T0sp+gkue7Qce?=
 =?us-ascii?Q?HLBt78w+6kv1xu7AVweukOjDq6Xyu2l51zgTFfe7ATKgMS3cbA/8BhiHxu/p?=
 =?us-ascii?Q?Nyl38NN70aa9o5XJaQEOzoAqXOKShkw+sShMJxD3rcwj5fl014/Orjsf1KRj?=
 =?us-ascii?Q?ljmb1pFJgDKIfyt/3ZMrezo+zQbSLIlSfuGSAcpWzMYJ/MXVbtsnzQk4+lGQ?=
 =?us-ascii?Q?il3nwZ27LLMzfasByfkrtL1pBrRgaSrpbCC2mnR9dP/S/uiIGoOsxheez8h2?=
 =?us-ascii?Q?aw+VOBPp5TdXqpFAqcp8dwKQ+n94TA9TeUgeBZIMzPgTvsnQIC6ryn8W9EPy?=
 =?us-ascii?Q?M9CwYDB5THgOadLFCIP09KzUTtyjTwa6J/fqqk63pmkZExuzXlobUG48YU1C?=
 =?us-ascii?Q?VEjsWhf+4Y+AcYSFp44Jx1rqpLyRRXEj2k66Gw649u0SOncic1OJH1I+RxZw?=
 =?us-ascii?Q?aal4KDG+T0dxgH0JhEImWpPnQT/i7QtSc5ThQJ0/xPl20uNFL7Qv2/C74UGJ?=
 =?us-ascii?Q?jLwW2LYkpRfvjboebffDozxawFiwzbiXTm2jjplv/LRUncYgZ+VyClShMitM?=
 =?us-ascii?Q?q2W+hTdLzMvajM2nom+OHguRCsHByriVA0Jg/J9asSdLyAHoO+brbH8XXLtQ?=
 =?us-ascii?Q?vD/wsscm/hS1BZ5y0EXCoEgBcJyNnOq6m+0EWUiIAvIDdOuyT7HaW6uKz3Ye?=
 =?us-ascii?Q?pEi/dwryHGiLuHfU/GPRrlwbVbwsE4gBOCEYPVJSfdGJv/X++7e+4i7yBXbk?=
 =?us-ascii?Q?AI1hCTIMIMvtxiu0pxdcBy1vHCp2aWDNYr4b8jWE1juxA/CIVtodGTB7C52I?=
 =?us-ascii?Q?ag7jPqPlfzF6XLcS8W3cFWiRrD7zDAoKueD8F37z0SirpbbPSjARnu8ci2C9?=
 =?us-ascii?Q?u+PlpQt+Npi5wNqMd0QYjgIHhkbmch0ZNygCqMtHm+qNBTFtpXnWXOtIG4wC?=
 =?us-ascii?Q?4UCSf8pF/yNzORuHRvwGvWVuRPq10hTQhJ31j8+drccvAaW/Ms/QIx3TDZPW?=
 =?us-ascii?Q?ZMamaSBDYvfEQvMYCtKmPg6ccPJMR6/MvNMVlXCZEZEzExJPmLcgufAm31p6?=
 =?us-ascii?Q?1fjpWyBwPcuXhhcaXwp55dejEXp6eh7advhkxGuoAVw6bBucCEraHTNKWDmT?=
 =?us-ascii?Q?YdCP/T2MmGO7VHrr+fvCgGGpR/2E1B8PWqZAdfF8DmdiOyEiPcSPKMY3H083?=
 =?us-ascii?Q?T463DJ7wtnB/XWyYx5lZzK/zqPIt5DCSioYAbVdH0ef3RyYBaWWkpWC+X/0M?=
 =?us-ascii?Q?rDrIFWZwMpvKahSHKZkbjLK7lKK+wZH3eWxaFWyt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5216e4d7-ee99-4f89-cc40-08dcf889b20a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:22:26.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL76osGuNcNLhkd0vJK2y1JoQD/d57fD7rY5F7shs10qtTkOvDSE86X7dRx7PpRRi4jinATkudAXzs6dKcY7+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705

From: Ming Qian <ming.qian@nxp.com>

Add some ctrls to support the video encoder region-of-interest(ROI)
feature. The ROI QP Map and rectangular configuration are supported.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 131 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 ++++++
 include/uapi/linux/v4l2-controls.h            |  16 +++
 3 files changed, 193 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4a379bd9e3fb..7b4327c4a14e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1667,6 +1667,137 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
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
+    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
+    the number of configured regions is the minimum value.
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
+    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``. If not match,
+    the number of configured regions is the minimum value.
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
+    If the array size is too small, the control should
+    return error. Applicable to encoders.
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
+    If the array size is too small, the control should
+    return error. Applicable to encoders.
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


