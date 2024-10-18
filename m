Return-Path: <linux-media+bounces-19823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2A89A346A
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFDE12851DB
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4FC17C9F1;
	Fri, 18 Oct 2024 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ebvUIEWd"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70538186E4A;
	Fri, 18 Oct 2024 05:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230351; cv=fail; b=NCUijY2k2DTVULJHTc1pV1U1g/IJv3p6hZ4WcY4hx+3rqU5/XqW2gpFc+WBnY61ouYdYswmg0C6kCQlUw3KZQdu99L+VI7u0piQX2TZjkp57+vaQbRjiq/Yjf4I4eEvEI2SHXko0dJfW3IwO08ZlJIBGvImDoqKg3oqNfM/ThA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230351; c=relaxed/simple;
	bh=lklxAnXDrYHpoSq0emddoKYRrbLBif5sXKUDM3gX1DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mNppY0Zb+6CoNKka/umSug+AsmAAHXYr1SqI0UHMorwmFddW+gXqRB4UsOkXHst+lobwwWw2HcBlMgTR85P55y/TbAQcjlkogKzTveoIoutMxJf1efcYmFIg6LYWBe3NO7wySxVuQjy2S3yePuAl1NlHoPDYGIT+Z8MXZcCQK0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ebvUIEWd; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsOmkVyVWVloDVeF62C6xmlDPUL9oimW9hHZfk9jkUSVko+3GgMdC4Sd0MSeu8cf4p9MXXqiQIFbjcUb9cXN2f355juZhRWXVgOINROSyjxj9L55bPwqZxEmZmx6/s6KQo9GW0uUFg3XdvYw5jHl+3AhBIFKHgywAWjrtYzVp+/wz+0w90QooxWetnAUeRKekKAZzYnd3kA2zOLY4hWf49DBJpm3vaU7MZ9XBd1vSP9V05m/CYU2ZPiSuwcw0+mQ9znAtav1Lf842OYUe06srp1vhkitR/auRldBTu+rpo0OV0vyFNzxb5ViztH5efxbIdU9pNNUf2NEu4hCX7xMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9PzfpCy8VITzYYkrLd2PN0k6Gc/8tbXXgoVtrDYriY=;
 b=gUNqd/lvL4HdLOZEZ/k+B4GqDbtlRVFHxteDaAMhfJ7VZIgOP2RG5X0vB6Cx1FERfWMDramz2zq3sqVfgFSM9LkYQ5ArXk5dqx85BzlhQ14lsTvJpe8JGpBCIBl3eynkQJOiIzP1AdUZMIHVcvNhInkGlgYm9REi0ULCoQ5qnyRfomigA0aA10fKsxYM/kYOwOr6o6ywySRrdcB/pD+H9KTHBzEwIF5Y/GPhstzCBAQWozGBiAvDfNXYFLTXMid5g69JE+JjwP50OY1Q/eWljhioUEykTCfHjcmRzL/IcAxF0q6YU71ev043meQ9GaUoV0ViLBTuTuj/LLRGvIyULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9PzfpCy8VITzYYkrLd2PN0k6Gc/8tbXXgoVtrDYriY=;
 b=ebvUIEWd5eRzzJSBGQTX8+MqCRdrJ8Eu+4MU76n0Mmpp465d36H/1Qx3M5nKwMQWS4IQqmUCwsjkcjY6XqpBzThM9fupRjaLMsWe69HMb8U2i0a6MpUQ5AMu4tPDgdB35d5Q67RjWiZhZQa7BQ5K3BdMBYXRoebjPkZHUmptBVmVd64Todrdcfgcwd3syWZydxat64IthHl33owEhngdVLHEtdfMD0tV2xXFpWoXVJ+DuD9+83FU4FKsEPIHmoqts7rFklK78cDXBb4xlcttcRmC6pSs0Kggp0oRWcG++cyRI3yRnF5hBdPEVqp9oDZrCTi4XGQyXQZhr91KrGf8LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 05:45:46 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:46 +0000
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
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v2 5/6] media: v4l2-ctrls: Add video roi ctrls
Date: Fri, 18 Oct 2024 14:44:47 +0900
Message-ID: <20241018054448.3190423-6-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241018054448.3190423-1-ming.qian@nxp.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 189c8452-548c-42d6-e3c2-08dcef381d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yd+j6T8AgtU4unf1knDDwUiH3JLGXoaGS33UiLIzGGRUmYaMAZk46KqOKvTp?=
 =?us-ascii?Q?enLRl2qvEW+6lC9zJDltJ1aXl+yYu86NeLQK8jMdNG0t0Mf613rHGk1CMFQO?=
 =?us-ascii?Q?S99J4IvTp1bG2VACQdaSyXX8Zydbr1BCfoA6oVJeFKTdVZOx0tpyT7DKkLMx?=
 =?us-ascii?Q?8lwdgxw7zwPpKtjgX836qWtty9FuackE8/b5QtW706oaJWecg0yL1YAL7Tr6?=
 =?us-ascii?Q?U/XZruPtLFK6Xq41boXsYb78sIwyBFaesFzxoA9bw0KBoz5/HG7g72CcPtYq?=
 =?us-ascii?Q?IIoHHQA40dVIfsGMgJPS3XJrAbgMR+ngY9tc2uIXnoViKlTz2UOCdD2NmqE1?=
 =?us-ascii?Q?Hjunk8x3iyVEqlTocgR7J5ZB3m0dN6av7PJdkyct+Mu+iDHxN6M1Ij8c5/aW?=
 =?us-ascii?Q?2LHczsZ9oH4rUUlTHaK6DWJ7MjidFKOkjD5czZX1WF5Xd/06Rs1bRdGqARyj?=
 =?us-ascii?Q?Vx6yvWuxx0EeShu/OgTwUOo+tmr3HHX2qFihBaNW08X5HA6G1qECnIAJd8kW?=
 =?us-ascii?Q?ERhN0XT0F12X4pLZUIIiy4PV9i94hG+Bgdlme0a37kCckPcgGH4mu9jwhcAL?=
 =?us-ascii?Q?dN7tHxDVGRto30/XTywfv2mxiTLlLe09MAfuv9ug9ypjZa6n0HoRTT64OWJD?=
 =?us-ascii?Q?LVyAGARxLe4PZpY656oL2DJjFIaBA/Ms0gsCXSrdRLNoDfTzF+c/ygpylhFo?=
 =?us-ascii?Q?DeOxqtRhOXX7lHkNfji52mnH1UusHlgnL/ZdD61eUjlfazZuMCSFuCxH+jrr?=
 =?us-ascii?Q?XPyaU/H8Y3T5r2nmyYXybQlVVZ1DwnWkuHd+hGHXYfT9iupcbaOlmGCOK2NB?=
 =?us-ascii?Q?U5HN8HTRGV4xfkbAj8KmOc4AJZHP1kWz7OaNOWGZb7ojWwIJP8nfuvxlxGOj?=
 =?us-ascii?Q?w42zsre/eEwAKQppSZDycQNxyVHakruXkJFscyUz9zB02oreGkPfRyb/i8ql?=
 =?us-ascii?Q?eqXBthT5t3OmRwFWhvCRvdu7Zd8sIG9AZenhBuGxqOZqmmNyZ2v7FR0++DwP?=
 =?us-ascii?Q?15rlJn1G7Ghjc0CORFlWfUNmQETUCzhWiVeda0AYpidBtF8/gZbyXbQY9Lmm?=
 =?us-ascii?Q?SxllD/+MsCDzRuUqDdo22xY14t9p8WXdsdkur+Oxd8j9qnbdlnYXvxmLoi0E?=
 =?us-ascii?Q?VnsQTFBqZJEJ+IR3YieV1xkPtqw8FstPEP1FnHUe5HI0j+gcBxAQ42/6ng1g?=
 =?us-ascii?Q?elR6kDaww25vt5fZBO87kZI7KGox64iFJmnu5Kx1g+1/gQ755CfwlgBfHncd?=
 =?us-ascii?Q?T5YiNXS5C/rAYWl55hiB61F/OU+/CFISsAS+AF4zGKbw3Z06t4GKNQQTxI5O?=
 =?us-ascii?Q?/TOkNJrqpvdjo8E6VJQwvZtnKSlQJcYXm+PFnZpv3bRJxlhrvRMGRe/q1BAr?=
 =?us-ascii?Q?6sjAeEo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MuuB43tEzOYh+2Y8LE9zDBiotfwcVICfZMXFJzG6PFNjKvFXO6vqemxcxbAj?=
 =?us-ascii?Q?mcX183j5mL7GvNHH9cLuhnnYlQvUyb+3AwG6Pym7uBac2l0ASperOzeRNGr+?=
 =?us-ascii?Q?lGngX5K5pJA0EZXf1CPi2vDUjTyr7DzGJqS1YYVQ22RzEVyKuQcLgYgyx63f?=
 =?us-ascii?Q?jA96T4P1VJB8uqjNk3zGl6YwutYh3a2sFKiWrH1wpNG3ot4kFbFYi4mvjVdE?=
 =?us-ascii?Q?Q+q5Fr9w+mZDWh3I+W9kt1EFK1eyNHDTgd6Hj3UN9eAJ+4nAgRQGed0PFaAx?=
 =?us-ascii?Q?5KaNOwyN/Aa5VbYjZ0pmZWxMkiWXIUiRoGtb4ghWLwpAMFTKopNBnPQ2p8ub?=
 =?us-ascii?Q?xNQHxNi1HOb1uJ8g8etNZ2b4/asymDbpjZfdpx7pyrcPIj1sVB1FqXGA9u6i?=
 =?us-ascii?Q?AooapVSICZfOrjJlf1gjVUFh8LTC090UmK9QEb1Fw0uni32b/QzzaIKRE1nP?=
 =?us-ascii?Q?DPakTCE+cNC74oSnG+43dXe31WnAe9IDmAEIt+T/FrX+a9kaw8oetygD+Qv/?=
 =?us-ascii?Q?N19GTF2Hsjop67XdR89EZNkvyN2lmyUWweJAtppCpWch7C150eGL58DUvXWb?=
 =?us-ascii?Q?iKuBVg3ZWLqeoAPQKNdAsR+V3k3gmJOkrqaqaufQ/wVi2O9jvXAT3hAvQGN6?=
 =?us-ascii?Q?ZJ+oskrEu//6dv3akwrPRVh/ChEPnkCiSQCeuqpIpADThGxzc0tPgJgTuciN?=
 =?us-ascii?Q?KyeIzZBOWS4B+5xLlkE7L6l03wBMynrgzYFzCdjl1NFPvGz0qcBBX96idMNR?=
 =?us-ascii?Q?Cc8fPJ50W4kzM8aMLTWDCx/shtKyklqCopmn57ANmNAtAN3Pck3DGm4YeAu1?=
 =?us-ascii?Q?wTteIZthJXL8ZZCZDas66keJx91GN3ysIwrc2MCyjj1ysZlojstDCSJUPhhg?=
 =?us-ascii?Q?mxaPG4l2f8bk0Gu0v3su94yixFekSqk/Zq+u+t60S6rVFP0sk8EsMwn7yvXO?=
 =?us-ascii?Q?14yk5cd1QTful4lN1sk82LbFgg4AvWe5rWoo5sO/+o7wBmP6i8ixIzn9Pon6?=
 =?us-ascii?Q?Q+HyDEFd4o9mCbEZAoCrF+wubl65R31tpB7gLUnNof4CHxFTTZWVSLdXBnh8?=
 =?us-ascii?Q?oT7Vw2pjELJhmxFEzpdgdgryuYGl7YOIXambOtvlzmwp1u+F3O5bN74S9j1i?=
 =?us-ascii?Q?CqhjaxacMZU/eHpRo/PG4jNcaor5CuqltIzeRbx7b2RjRw7sohAipfauAvWy?=
 =?us-ascii?Q?ITgY+nNKO3r04SjQ5oruz3FqNdOrumR/lGzCE2YwgzzuuuNrAY8XtwZ02BjJ?=
 =?us-ascii?Q?RGJuJRiVTZJDunFwAevhbOdEdUAS6ztqxRO35ClBYqCFzcEX1wJOi6CG3jIL?=
 =?us-ascii?Q?NPhZiqXGAV/tDC2axH1fhyc3MTCxLeyE/itNtBWehrjrFRVRtzKFeqrJFnte?=
 =?us-ascii?Q?veMSF70PSh5o9/O1PsgqjlBr2BmLqLQDa92v1dnKIjvYwd/wMj5/SEU9TNF+?=
 =?us-ascii?Q?+v1AN4j0iQIkSYQsYHIJAOpA51UYoqH9ul1kdPbp+CPf3ujH4Aaqbrh59U2Z?=
 =?us-ascii?Q?dJQLzf3C+MudnVw4cU6/I5l0NOYjHPOb/enpxrVHCnp//2JHf8y4PBs6a3EZ?=
 =?us-ascii?Q?DaapqedkKYypvtV00GPfheNQTvbTAixinBAPrfEd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189c8452-548c-42d6-e3c2-08dcef381d02
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:46.5461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX+3LYDHQ/N/bnRGjiiykedGTwGRPVTvOc/APOjbiQ1w+K8PWrvMBezOp0oPEGB+5ZEfzGGRibYDNoDlqARAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

Add some ctrls to support the video encoder ROI feature.
Support 2 encoder ROI configurations that are rectangular region and
QP map

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 73 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 29 ++++++++
 include/uapi/linux/v4l2-controls.h            | 11 +++
 3 files changed, 113 insertions(+)

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
index 974fd254e573..169a676fd64c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -900,6 +900,17 @@ enum v4l2_mpeg_video_av1_level {
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
 
+enum v4l2_mpeg_video_roi_mode {
+	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
+	V4L2_MPEG_VIDEO_ROI_MODE_RECT,
+	V4L2_MPEG_VIDEO_ROI_MODE_MAP
+};
+
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


