Return-Path: <linux-media+bounces-19787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67D9A1E29
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345BC1C24944
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1771DACB8;
	Thu, 17 Oct 2024 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LxogGT2f"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588BF1DA618;
	Thu, 17 Oct 2024 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156858; cv=fail; b=UEVtdn04ncKcjkncpVJU8MvO2We05BOrwfP/EnmRJ0IEc7VpiQMH4KsW5BYDi4hrEUDBrVV+OKhw4S8skPZFx/1BNph5dUS/UI0adeeInZ44RGGsfdOeDudk/8zUbEJtDdG7gc1thUrteIqHRb+p3zW+oAVfNhzJP3o5Wx8gytA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156858; c=relaxed/simple;
	bh=D4IRcKZCnkjN9EjG9IxCX+O4mLIRLm+owwFW2jdAYrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Frtdtg9LAh5/ShJlDKq0Dc9f0FR33GpOCTpRFBYFPkJzWh3UGj6Pi7R0m6XUrmsALWsotAAsTnZmK0OUJ1afaM+AEEgJxblWrTtJ5BovOkximHUfup8b7Cgc208SF6MfA/bT48YMCRQm1mT/i+KDsnwVPGdGGDE7y2lobgTExwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LxogGT2f; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sk2YwWDL4B0R9e/y+5DiU9q9KPWMnb1zLdL8aV283X1kEEKCObPKz76Ux5yWOCll5VNY49f1mJzTKA2ZM+BqNL9bGC+5obpQLUX8dOb+3iQgwvfuGEc1kdMrTGE9yC8CzNcssVycTEHY9e+JN1RgfJsR6rm9D3BPa8YFKgvUi2jFMYWjvBqAVHFXjLr9sjNHX+/JdG4SspjSsI1/RwbsGzyb2L+zhtk3o5WbGRZ/yVBQ+xfD8rag9aeKFKtTla3MJ8xOy6zPrL8DeHRuMbFp6SVpiqVOOmweQjTJMAzFWomNhiyw2OaTRF+SSnI3kmy7IxeEmw+Rg340JTnUQEewfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVQIg1NtixnAym91jG7PkhCcVeo4YiC9WHQhU8FXYOA=;
 b=e9/7VZJWldTVmVHcspkvKz6UgP37/+G+P0lPjGQC/NRCOoJBhnOHP92lL1fnAbi+feB+MhVdPT1ppoweGmw8M93VRvTBwjRneywBflFKM7Ig8KIu9z9nTVWohHYf1tgecVLtoP5zBH/3/KK0LMlhh625vXqB9MXVfTh2lk5ST8wNPFijubIHzniwdeHre1zV0X3yjp3vl0O1VP5CrfeSieNQgMqxH1K+AC04RgvJvs2FsEzjMYKXfC+94HIMdALw2nXg3DZ8dq2TxnGr196CUa3OAFyziH5n4vqrjzKAJ1qeSCzVIZNFv9q9VIYooKq8oQoFeo+ovcL9yyePuF0Ycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVQIg1NtixnAym91jG7PkhCcVeo4YiC9WHQhU8FXYOA=;
 b=LxogGT2fp88ZgAdQTMQAqYeo1ImpXB/kJ1RAjXyusS0zgIsaOoJcFBPC8kvq7uWSj1UpQSuKGdqD6O/zYACwFGQ3lwTGQnGvfqVkAcT/jwc4d4qC22uaTsH3L9YZGsCOypgRHPWAgYX9CuhQRG61cqaPykYmUvNdFzkP9O6BK4bxyFH4avDFVdk0BDEvv46QguzWn7KgOf/jMqnUT7MUU4RayBOgJQo1nEO8MIcC/DDyOEmixQ414uxnkYQcy/OrYGiJ09iyGQmYfaENXHDO/tA+UrTDZU8sveRMjMM5ek5MwmLDJmITBZb6Up/8ac6W1zuxBnjg9n4TXjdZ9ravWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:20:48 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:20:48 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
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
Subject: [RFC 5/6] media: v4l2-ctrls: Add video roi ctrls
Date: Thu, 17 Oct 2024 18:19:50 +0900
Message-ID: <20241017091951.2160314-6-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241017091951.2160314-1-ming.qian@nxp.com>
References: <20241017091951.2160314-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9b58f6-b9f6-4821-1c60-08dcee8cfcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CwsiRQWVmKoBnia5lG0+idq5Zhj4UqOyNK30+JctBr0HQIud0eWplF7Z16wt?=
 =?us-ascii?Q?SLgnrTRj4WFu2NSKjebJZ2JkL7Fga7Ei5Z6cc8GudxlfxWjEfhlnHDnvB21S?=
 =?us-ascii?Q?lEHA7YuP4s8V1EAlqJdHBR3Z7c1mc3B9bNs+8s2heIcZpg7a0/wrQIQVoaeD?=
 =?us-ascii?Q?2RwEXai82j9pqbgG8vDjq1H/BfXsxm7VrFP2kh940C8kz0eGU8W9xdh6j+az?=
 =?us-ascii?Q?7G7eWmhx1yjQX4e/e1eCG7Ccj5EIRDVkm5RVw+qA0lLO1rPOadN7bbYAZKzD?=
 =?us-ascii?Q?wyxqLZ1WRh2TzM7O1v4fQaR1XN7KVJx3HsOLmvFa2LlQ5AxbOORoQBLTMEWb?=
 =?us-ascii?Q?1aZ21Jv+zg520COra0bSrfcaPzMWV/EyO+HVEdCBG4/K5FPQ1dMr13sKNdIU?=
 =?us-ascii?Q?a+clBbwWZq0uRp49YvixRPcs9SAATVstSl4d+alzFZFHee0lfEcbry6+0/tJ?=
 =?us-ascii?Q?kAma3buV3sAmIU1BlDoxIubrVyUeZ7WvWy9CbUTV7PgCDz6gQq92jZ1rfg+N?=
 =?us-ascii?Q?1qxrfDj2yGk6MF4EB/mSAecFRDrSzE6QFOhkHlHcStQ5JBp56lL8I7mkbiK9?=
 =?us-ascii?Q?GHBd+zmSriv1hZbkjMAQ597b8Xwg5BTITToechk9S8Lqgy4QMIysoFHf1qdO?=
 =?us-ascii?Q?A9fqDpigS3j5KhkhTN+CvW8Owp1uRdatI1GSI6rbEwSoivOSgfFx1HNtmaYF?=
 =?us-ascii?Q?M/mLPBdbnfFsJEse5a6dY+Z8ZTWu3nvYJPT3cHyaJNSGFs1xFW5YPWYoYL7l?=
 =?us-ascii?Q?B3CDzbHrP8xA/UJkrxYtGlAGf93/fFJ+CLd2Z14BF+zgcDZrvB4e674C7h4e?=
 =?us-ascii?Q?sZOugIqrptv2T4BSOMbOqrX68uilNAwTT92y994JfY97rR9zm+2AAIXofdP9?=
 =?us-ascii?Q?w4pBUCgTCLprhJjZUfJZRA83pQeEBVKgWU8PJAIn+TqEBXm1xAkLYOe1qDF2?=
 =?us-ascii?Q?641j+OEiIHchZVk2g88DlD4Hvaq0Tg6+ZCkvZWCbDqG03dft7f4UYKinyKYE?=
 =?us-ascii?Q?0xVPSTtPa9uKHddXkRFqYKJ86wlbnkw9Cz+2CrBSYO9RZwq7JYbzALo5EVw1?=
 =?us-ascii?Q?KONO6Xi1w2rLSSGmdHmCXcExxP8IBJ4Izk1ZLO9pqLjkxXCol+Zmb6WQ2j9x?=
 =?us-ascii?Q?ESWIx/ugjB8gBG4iEhuxcWOTs+sIvcNiwdB7nkltFfxX9WZEH11V1IMd1eaL?=
 =?us-ascii?Q?3nBH4mKwSO1wURPOWpgqpa7TUfldOmT1nHAY3ZgK8VN+fcTEn7vetjPd933T?=
 =?us-ascii?Q?s0tf7s1TowCgEJj2VvjnfZrQ8AMvGBf03AzU50nhZBs2q+LEOtxUKSTzN38L?=
 =?us-ascii?Q?maBfJLQ7QCoZAg3Db4213Q4zqoGJ5NFvL85yRNe4mHdgBM3ZNYkyODnfGPgP?=
 =?us-ascii?Q?UFEwT/s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mcLdnghg3vAoGlEdISG20UQVOAxB5+G1sMCLaDrjqx2MLkEwz9ztO6FTOBJL?=
 =?us-ascii?Q?lilpFkL6Lu/IWORP2QB8t5/+yb/ofDyLrcu5SHBlppY7H0pIPjTZ5Ti04BpL?=
 =?us-ascii?Q?P4OwA2C35L5sx3cnmFz7skwUf5jyPGjV4h/Pc7nY+Icus4gyxQlWRQ3E1f0U?=
 =?us-ascii?Q?zfQNvFTz6c/V0ATBPtSIParcsawszTF33wD4q506liF0Y0xkIVZ3p2NydgYB?=
 =?us-ascii?Q?uH07I6TqsiNlGAmgnP1tEMfJHpr4vDNbIqEO551/qpCWMKLCH3ZOfCiyJ1Fu?=
 =?us-ascii?Q?Psq1lhp6H5Z277/F6nyj2wmcPZ2CHaIvlaJAfmcpXq8EkGlZFVTJq9vo78sz?=
 =?us-ascii?Q?WzOX7v2MAVSNJCgyUOqXeQ8RLnbtQlU4zLkV6tQuWdi1y9W4th3ELHIutlAA?=
 =?us-ascii?Q?O8T1+pLvy1qcssQgYdR3tj7HmGrswViGh566G8LqNNyXV10lmNhUBp/cFeLw?=
 =?us-ascii?Q?P6XkLq0iCFZC4SoyLPBl29zkt1Cyr3/fP59g3X6XJ9m8yzTG5qMPmUXsKmmX?=
 =?us-ascii?Q?dtgn0IBi5YmLRbF2suAfxY1bqAQ2MM51ZUwkTUgO3kHSOfzlETyX4GZOWkhe?=
 =?us-ascii?Q?tRezbyWkY7zydYTOzwbZuz5OnoakWBFIIM2yKQdCGDsNV1v9EuC7kTYvKGFT?=
 =?us-ascii?Q?8T75CpNF4VoK1AsjB6BbD5Hv28dLFhwaXq40xzL66pkbgXEDdFQOYbNISnEn?=
 =?us-ascii?Q?rvkmyBBaVIBSO/7WpyvmebRNfBZw1YpHABlV+cxkKRbv0XnqqAP1Ge6qW6Dw?=
 =?us-ascii?Q?8ib2y/0L/IEr/Y1Bp7Rb5ly/5/nA6Ht+Ok3AOJRvPjGH5ooCrg0Qv+vOK/3e?=
 =?us-ascii?Q?jaGkU3PunozbVw9FVUoUM+P5su9H9P73CxXmfQANeXVF2EfMV8MukVMgwFxO?=
 =?us-ascii?Q?M+36m8KCkfIljE5KOJi/ZYaHuhtWp9mS/+C1tab5t23Q385IBDB2giBSfuhL?=
 =?us-ascii?Q?knWrWFqCmweqZlBJU2C/zt49dxqHYSI1gdJW3ZcY/XaZrZ+agJQgkSSX/RX7?=
 =?us-ascii?Q?8Hokv8jaeqk9ywIo7tSzjAA8NfQfR9A444pNbHHN4fgSb9dnOsZVWQQRjVMq?=
 =?us-ascii?Q?SHt/htDkJKqGp5bg4U33wlYBPJcELid2P4wkL27e320dUTNit8Z+gMJqJfpf?=
 =?us-ascii?Q?nO5E47rf584IGBO1NNCvVWCnHS27VIc+pJ6/A0mXtole7pK3c+H7sqB0yC3q?=
 =?us-ascii?Q?zWDxoZrxKblmngm/a2iHKmp8MrvKpkdwKHjJXt/qcY72DT20xcsOSIQQfIoi?=
 =?us-ascii?Q?v65T+DorR4i89hcO+XpjJGDs0L9HANRc8Sf2/gYRdQeq3SL6CzNLXxhtLS+7?=
 =?us-ascii?Q?ZTazIJGT+sHfRr+bye7+0jUMJAExsp15WqqAGAL+/Ft/UJA4IzTAgtbNHFwi?=
 =?us-ascii?Q?AwDOFA7XipECRReWIRTeicMzM4Su7TmKRPLSpmXD0K+ab/edfnfHigyiETks?=
 =?us-ascii?Q?Oh6ZcMVH5zg8KL3bVfxQr2QHmFn+e+vfXowXFbjxgtvgyqpqrcykDnSgnqPN?=
 =?us-ascii?Q?bwqp3kzXlmdplufpQ77kz4iYkmnDTeG4mv8rApYHOqRlQX3Eh4CrgazJLRnI?=
 =?us-ascii?Q?23OzVc0rppEUfmsI3vqswSEJ5QTXEWUEZIVBTH+N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9b58f6-b9f6-4821-1c60-08dcee8cfcf2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:20:48.8110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nC5dd2QdlxhljMcGyDLkhtbpwkCUsdsMkx548O91SSBXZ13vP6KSYxmGJ1ht5DqVVHF4xeRsEzGx7XtaDbVwdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

Add some ctrls to support the video encoder ROI feature.
Support 2 encoder ROI configurations that are rectangular region and
QP map

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 73 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 29 ++++++++
 include/uapi/linux/v4l2-controls.h            | 10 +++
 3 files changed, 112 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4a379bd9e3fb..6b972247778c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1667,6 +1667,79 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    (enum)
+
+enum v4l2_mpeg_video_roi_mode -
+    Video roi mode. Possible values are:
+
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
+      - No ROI in the MPEG stream
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``
+      - Rectangle ROI mode
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``
+      - Map ROI mode
+
+``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
+    Select rectangular regions and specify the QP offset. The
+    struct :c:type:`v4l2_ctrl_video_region_param` provides the
+    rectangular region and the parameter to describe QP offset.
+    The maximum number of rectangular regions depends on the
+    hardware.  This control is a dynamically sized array. This
+    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT``. Applicable to
+    encoders.
+
+.. c:type:: v4l2_ctrl_video_region_param
+
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{4.0cm}|p{4.0cm}|p{4.0cm}|
+
+.. flat-table:: struct v4l2_ctrl_video_region_param
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 1
+
+    * - struct :c:type:`v4l2_rect`
+      - ``rect``
+      - The rectangular region
+    * - __s32
+      - ``parameter``
+      -
+    * - __u32
+      - ``reserved[2]``
+      -
+
+.. raw:: latex
+
+    \normalsize
+
+``V4L2_CID_MPEG_VIDEO_ROI_MAP (integer)``
+    Specifies the QP offset for each block. This control is a
+    dynamically sized array. The array size can be calculated
+    from video resolution and the roi map block size which can
+    be got from ``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE``. This
+    control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    value is ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. Applicable to
+    encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE (struct)``
+    This control returns the roi block size in pixels. The struct
+    :c:type:`v4l2_area` provides the width and height in separate
+    fields. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_MPEG_VIDEO_ROI_MODE_MAP``. This control depends on the
+    encoding format. Applicable to encoders.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..54219a3b215a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -612,6 +612,13 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		NULL,
 	};
 
+	static const char * const mpeg_video_roi_mode[] = {
+		"None",
+		"Rectangle",
+		"Map",
+		NULL,
+	};
+
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
 		return mpeg_audio_sampling_freq;
@@ -750,6 +757,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return camera_orientation;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 		return intra_refresh_period_type;
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
+		return mpeg_video_roi_mode;
 	default:
 		return NULL;
 	}
@@ -971,6 +980,10 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:			return "Video ROI Mode";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT:			return "Video ROI Rectangle";
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP:			return "Video ROI Map";
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:		return "Video ROI Map Block Size";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1512,6 +1525,22 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
+		*type = V4L2_CTRL_TYPE_MENU;
+		*flags |= V4L2_CTRL_FLAG_UPDATE;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
+		*type =	V4L2_CTRL_TYPE_REGION;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE:
+		*type = V4L2_CTRL_TYPE_AREA;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..f6ed8e2f2de6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -900,6 +900,16 @@ enum v4l2_mpeg_video_av1_level {
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
 
+enum v4l2_mpeg_video_roi_mode {
+	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
+	V4L2_MPEG_VIDEO_ROI_MODE_RECT,
+	V4L2_MPEG_VIDEO_ROI_MODE_MAP
+};
+#define V4L2_CID_MPEG_VIDEO_ROI_MODE		(V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT		(V4L2_CID_CODEC_BASE + 659)
+#define V4L2_CID_MPEG_VIDEO_ROI_MAP		(V4L2_CID_CODEC_BASE + 660)
+#define V4L2_CID_MPEG_VIDEO_ROI_MAP_BLOCK_SIZE	(V4L2_CID_CODEC_BASE + 661)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
-- 
2.43.0-rc1


