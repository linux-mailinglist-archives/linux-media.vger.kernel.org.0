Return-Path: <linux-media+bounces-38241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F4B0EFBB
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A99458370D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABED28D83A;
	Wed, 23 Jul 2025 10:26:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021077.outbound.protection.outlook.com [40.107.57.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6E28A407;
	Wed, 23 Jul 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266365; cv=fail; b=f3HhvvJSp0nH8Yox0sRNQs4xWIS3Y61e2TKAMf6QCvB9XGcgoKO0P3TGOfKXMPkwAQgqVddaIdNNi7ki9rBAwb2f16YLHKKLSHjXn1T7vUKJ+JLjpoS2OxfVTlqzfg2b0H1vlQzYPzWe3w047jJ9xF7FwftN0SMQt9n30yjLCWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266365; c=relaxed/simple;
	bh=Lj+WRQ31BHR92etfW/U7yo2oWYpHS52cyD2SKx/tgxA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KzZkJtUkx1dhmx+y2axw8anr33mTA0O6IYMyF8R19ldxMqVXIK6jJWEXjM++v+Ew+nVu0/OV0muJw4JoCTL2A75U6cYvkXiM1ptzQDlEZmLBrofPXRN6F1xAj5cryTqNiDZE7YBeYVxl8KDv8fE49wx2ulUVhXeDIZWTjv+DmO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDPnOm5PTOMWZaBlOVLz9g5IQJf7tSr1ewWTIDSDMvjTShLRQJXOLIkf2c3XgLBawBHyqtZ3JK0dTelVuZ9/t1PhPoCAS+duDPekxmo30dc29sVHtWAAx9o0+Z3lbBvewp+jbEtdiPqUK5DHfL/m4CywVEi7rQAJQqbqbVejTVGfe9xbEUXv7wSv/6fKuYK6khS+nWnpNKIPV+WLIRpk3Z2EZK1jDoH2wVXI8QI0LwqzDQ9k/Lqr9sHGkfob+5+RuuN14ywRHAeN7vC3eCk9qaoXdXeGDsGQGFdSi4jtvnTUZGXRfAQBtYjP0aGCWfRvyBJ0CJ3E3zh5DsKUXbDCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ftll1+qMBfUyVi2xBlb3LCrDFetJc/49hlj06+AWj4=;
 b=aLYSyOfqYcf5tObTCoeDEkAKOw2YerCmFsJmCLtBexVcsCISSPK9HH1UwMA6/XO+Bsh5hx3Gelwr/j9Gpxb0CX8AxjNWGuHz/KASy/nPl5bEJEz1lmwED33hzLA2uya2q7KEyQ9K6MFD+Izvq5zNAmpXf/GJ2bPFzqSTqZfNPUCxdeyLCFuF4mIdpU9hhwWiZd712Ghy7PTMI6s+d9MqkFKf1WmLUp+DLyFzEzarF7Bq73yG+YcwcqudaiRaVHS/KDYJ413PXDEdAJCNnC8/afbU111eqrc5tjsncZGLNO2TztR82r05U0YRThRQpwKTnab798Aew6R9CZDOQ1+T+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4064.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:25:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:25:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Yunke Cao <yunkec@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: Add devm-managed helper functions for media and V4L2 subsystems
Date: Wed, 23 Jul 2025 15:55:04 +0530
Message-Id: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA5P287MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da574a4-79bc-438b-18b5-08ddc9d34f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kAyjzfgfrVB1GKkkYrqzYaeaqCGMQ1otJOa3F68l7anERUII/TzUfXgLVRfG?=
 =?us-ascii?Q?hO86Cl1SrlwBDW7XoxnICGMGhEl7NenemgVrX4B+l1ydBsB0axEv6uiNi9CR?=
 =?us-ascii?Q?ZQ52LKyPFPwPQdZFJsIA02GTfz16BT5Sw2a6+shQonzX1Caz7ZfD9RLMOgUD?=
 =?us-ascii?Q?Y9vFr9ywJ0MWLMCDa47VMKDhhTyPlqgrmD9Ap9GleHzg9DjAlDliVLjwMQSP?=
 =?us-ascii?Q?G/2SYzegnj4aGAY6ZSzX6+xYYWqjvVIxEm+TWky+eWJBi1p0AISaltwHcdKl?=
 =?us-ascii?Q?Rlf0c0ZxDEnffUdI0M609IaGPxEQnm+ZeKkJsHX5SZoozUMmOqWMbCpvmJhi?=
 =?us-ascii?Q?94OfxocZnt/VaSvT454dx4jlvCcn7mL8g+mYeQ6QeFepHXcTUCSGyQj5UKXC?=
 =?us-ascii?Q?LYrWHvOPH1l4dzjoeaNQet2eR1uo1ZfOnZnMvrjPdvxWVnlS8DAxmkw+A3fu?=
 =?us-ascii?Q?tp/Bmapk04pXzQJyPYLnUmeXUExfVlmBMf64DVekpKNap2oRw7Xba3zFoNWn?=
 =?us-ascii?Q?HjxkSOT0/W+nxW//28pJ/HRaNO1G71KmS6lWBfkBtrao6S+tAFB0A5Z67c+P?=
 =?us-ascii?Q?on0kPfR7V7Kxs0KUPCDT2FAzB20EVD0yg9Tb+YnDu6PMqpwLQx5tk6pn6HHR?=
 =?us-ascii?Q?78hqJ/kQAPv3YkDuJ6ibkzSPdBwEWXP4wgmr2xQe7UsVBbos+deFMOs+7Z4p?=
 =?us-ascii?Q?Prq3TTVrmIBTerlEHPoJ7+zBX9UH0AdpQWxySXd9EPtbrvJOnfvBKVb20Q9p?=
 =?us-ascii?Q?bS4KpprfnOrvfIbD9hF/TcycJaEy1TBJsJZs4eoHR14lU9AOVAkcpzQXlJMd?=
 =?us-ascii?Q?x3LwOfRvZCou1FTAD99se2A2HfYas1qCBg1hEsuVJBP0nFdir8giYOQb/wSr?=
 =?us-ascii?Q?k+nSZguYi/QdQLawG2HlueflCANiESLSxdSPp5aHbEE76DdW/wbxiEs1U632?=
 =?us-ascii?Q?U1ngVIoKvwY0dnT8ywpm7Z7i+OaJLt+kU2tmNDka6wFDpuz2u9x1fdCTXegt?=
 =?us-ascii?Q?GAKzhlnHB8M1EDbWtLhUr/+DiCV9IK5Pqz+lGZDBDuA+cTqD7q+Q5uS93mX6?=
 =?us-ascii?Q?D7PNCvhQtBCD6cQDGoxhMsJeOD/cS4FHgsYSQk8sJ1GXpRjwdw/0guH8AoO6?=
 =?us-ascii?Q?0PAw2hRPU+v/TJL0caXlBwxZnTspa36F10OQMZyYJ1vt6G8lbm6ZtzatdXGS?=
 =?us-ascii?Q?kuRUn4017FRPEt8lBoXM9efKI8HKjKOAksDJOTt8/j3lL7maswWAtNl/MAyd?=
 =?us-ascii?Q?r7y42snSbytzsY4tsndYwrXFcCSECh2Nap3WhFrXeYs+JQsGnLAiq/gNS0AL?=
 =?us-ascii?Q?9L1B3337VH+Xq2y5rlIKo5SBBXT/dnWNVZgC2c1v+Fzf5HomrgZRAW20imT4?=
 =?us-ascii?Q?btriL2w7FAnhJExh+hzAOFuuFPciz19u3PxNsDmNbNIZCobFGexAhNemX2Ej?=
 =?us-ascii?Q?7uWC2RCkZHL3S+Vo2REr/+lyqPRnKoiByG+3mUk882fD6Su9Kg6EYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xuQGUi2uw8xOsJ2pAuRHj3fTkP38CHeKLwFWm43343lW79O/BnQHJYafg59a?=
 =?us-ascii?Q?4lpUtuPJ1vZlN2t4ZEePytJjymiaOkw7GquI74Mhhwpy/4dRFYhUrrXgYgrm?=
 =?us-ascii?Q?XbrCz5Tjjx+/Dlc8x4wmfdppaYWC6+AwZBLluGc6RkDjG5SiKfECM4yVjWD6?=
 =?us-ascii?Q?cQrVHNN0n62dgbEd6u0CWVzHC0O7B8//pcao3ZJJqpgJ0ALSqtGW5kwlHsLF?=
 =?us-ascii?Q?OYfHSzTu5mfNZozvYag+6M2rcVzXITfkAx/hsDVDBhRVnd3MrS/Girz0zPdj?=
 =?us-ascii?Q?pHitTCBHdcVb5yaacrVk3H6h/h7L+fNV4bG5XjpbfuzY77jjTBhvz24fJsVT?=
 =?us-ascii?Q?Wz1Ssh14gF/CMh92OMnP7mJN/cHRv0jEu/cGPqVZ3MBQ5KyXAcCxaR3N2YwY?=
 =?us-ascii?Q?ZoUbkikpjE4E54krz6xRIVumfRJnrN3rSFdeR4jvlcSw1sayMp6sOQm9oUGs?=
 =?us-ascii?Q?Cf1oTVX7/A4xro9JPt0OXS+PUL/BRgOk5IEMFVBO7urYGYCF9m3meOS+Eo2w?=
 =?us-ascii?Q?I2rWWz9JZH1kyIRSRac+sS8kCdIS9ly9dqb7OYRsxL0ATJn//9bl/nMeWlv9?=
 =?us-ascii?Q?mMMoLvyoSOG9QwQDdF/FzVkxFTAM8V1AMEVIo4tuAncEcewL7i3VsPiufeSD?=
 =?us-ascii?Q?77Rs1IhsS7d5dC+I9c1YWiJ087nBPayxGSzrdHFOq91IdXcweGLvJnNWOZhU?=
 =?us-ascii?Q?5R+ZMCfxqqsUThLhxu1VgDkpXIS9zoHauySJ5ndSQqNG2SwfIho2U0/EEgwQ?=
 =?us-ascii?Q?D+LoAOl6aZeB3wQv4f6TZ8W7/LFzR99RKYXIvvsLwV4nkofiabtz4njU4ird?=
 =?us-ascii?Q?Uq0yz2GiaFClRrRwTt7q9ONwwd2FhQ+NXUGJGerE3IgnPT5NdlTwdmPzyDyH?=
 =?us-ascii?Q?6HrrxCo2v9tbh/INg8Gm9kHbSctbyrWakI/U0JaX4egzKrNm9qD30eeok+CN?=
 =?us-ascii?Q?JzFVEq52pPrfXdFkXpshgm8HQHTerP4BmkujWYBW9qskOZ1dBg2uNTKPl/aq?=
 =?us-ascii?Q?TX9eaK/C6R1oSV0Hsi7cSYNe1ILbi0YZt3pkpf0FcT/O0N7zN9uZKvyxR1p1?=
 =?us-ascii?Q?wrik3cfn6b1jAzuNpldDdmM1uxVElFL4r7oyU1zHi1hiSrFEMBPQHjQ3E3wv?=
 =?us-ascii?Q?xZxNYqaIKa1BmpAO6Yth3Cydik+WUhhKbRHDV546VfKUT7RRHNHyU/ukmCST?=
 =?us-ascii?Q?Ktzjzq8llmxkI4vQjk9WzDnYMpurJi3kcef+dKgj4qXlxKWEb4Zhjco6fjgv?=
 =?us-ascii?Q?MwSy2TTMQ2MMeIzdsYV1HlUvSlD6e95qMlJH/JofVTPGMc348vozeBivum8c?=
 =?us-ascii?Q?dQ7D89zzBwj8ms7rHdXJeIQcwI/OyvC2+msgYwkBnQlu2s/dSulf1fN+pxpB?=
 =?us-ascii?Q?7QgbLO1b+9cfKsFWqCCw2R4ST4nPTZDc8Hqnk3Ay72uYIjwP8XydF8kdxTj+?=
 =?us-ascii?Q?13KjUcuIOD9RxTo8gmEDr7LjUK9iAtFg3tCAaMcL4tit0AqCLPaGz44Kko7R?=
 =?us-ascii?Q?iu50j9sJ/B300oSMy7+R2KXy2DEQjNXWvf4X3xIa1K1LB4XIEGm2mWOVw+Ln?=
 =?us-ascii?Q?5cgk4pwbRlJPe5qheuBSA2wE0n3ys7vzcDYhWmRL+/9yfWU9qsE24H+M6q0r?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da574a4-79bc-438b-18b5-08ddc9d34f28
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:25:56.0627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LUeKK53CyLVWlO0iQSs0zW7TPYHtNmlgJJPMyqEBGCWCFBIPBDUgQWG/d6yKPOByRe7YU92hARzJf/5lXH48oSSfW0qEmdrwxWhf0rKm+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4064

This patch series introduces devm-managed versions of several commonly used
media and V4L2 initialization functions. These helpers simplify resource
management by leveraging the devres infrastructure, ensuring automatic
cleanup when the associated device is detached or the driver is unloaded.

Tested with IMX219 and OV2735 camera sensors on an i.MX8MP-based platform.

Tarang Raval (4):
  media: mc: Add devm_media_entity_pads_init() helper
  media: v4l: async: Add devm_v4l2_async_register_subdev_sensor() helper
  media: v4l2: subdev: Add devm_v4l2_subdev_init_finalize() helper
  media: v4l2-ctrls: Add devm_v4l2_ctrl_handler_init() helper

 drivers/media/mc/mc-entity.c              | 19 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-async.c      | 19 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c     | 18 ++++++++++++++++++
 include/media/media-entity.h              | 20 ++++++++++++++++++++
 include/media/v4l2-async.h                | 18 ++++++++++++++++++
 include/media/v4l2-ctrls.h                | 19 +++++++++++++++++++
 include/media/v4l2-subdev.h               | 17 +++++++++++++++++
 8 files changed, 150 insertions(+)

-- 
2.34.1


