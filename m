Return-Path: <linux-media+bounces-16102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995994E69A
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D491F2822C7
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 06:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E9915886B;
	Mon, 12 Aug 2024 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Lf4Qq0rb"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020119.outbound.protection.outlook.com [52.101.156.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7514F9EF;
	Mon, 12 Aug 2024 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723444180; cv=fail; b=lEMVlZJ1nIgwGrWG21zT8QO5CKN9YvjG9cOdaeUPoyYiL2LVg35kJCl9jEgCkuzeuA4TJ5nOPTnxd4dEydVB7F1CaoGk2i8j/zTOb1zV/Cbc7tdNVqmwnnrSHkBwd+JEL3+jZMz5oVvq3c1+DQoJF9jW88DmFY0rs97obzjxoUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723444180; c=relaxed/simple;
	bh=ZjbiecUtfz34AcvWzNF0KHkLi7n0+2IdiTTl3P9ld0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yy9Yw9p8qrNx6NNPqPyJauYMAtCUnSpH6jbC0iGSNYfEmIhRVk+1yIGV+uYNC2p7fUkndHiR/d9dlKE4iE0ROMqCMnW17lWpD0b1f2lfjrt18m+JwtCG0YiAb+Q51XR+B7GzoVPREapa3sEMpF1Xe/IBOSzJen++bztCHjYUAXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Lf4Qq0rb; arc=fail smtp.client-ip=52.101.156.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmGy+O7MBqgq4Jd7gnp4h7CTUw8+zr58pJQwGWQuAOC3/ZQeaT9suSkLxivr5kgTZyMZjA5QZy4WMn6sIgrlghefI1IGYOrWHyRUCk27aWaXSqgdlpTUgM8iEIZVlMye+Usf6bHMq0uTB9wBrCv2BDT5Dj1flVdoys1Ej5qAIzwZhtOQ1irOCCm/QoOSsry++qTOUKw/J5mWFCqD3lC5l6wARj1E469zV4a1CBnD6xS0DNKPVUY5nGvbKkYM6JwvyD3RjF1Tg+0ZPS85UER+B8C6BQvwHOd51aqrFPrhGUEWjm3UXyMr6Yo2t/qvrGFEM8xVpq28l6LNQmYqyUE8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrdYPBptrcx70T0L1oyYy/761PBMY5fM0piZwIZYMc4=;
 b=YqBdxxcoIWVIDYrJWTmmk5JNZTuX4i3m1D7IBEaKeWFMvnxD3rhU2KSKcl0LwP7ce3KMa6/YXcmIN0+XfoWYlwhKgPFcMltBMwRCwXuD3msqcXZUQnegmEDIGWl7z3TIeObw4faRw3awKVfaLRoDygXzyHLyrsm6QN2+QSQTaxTBC7tdsTR3DKVZKFh8Xxv0QrXCIeIJAtSqC2f2cvJ8fTV8CLAObK4j2peWf0LKkUwuFgp9o9W9xQemHIdnOVR+rB9JhCwcbmetmNUtgSWkhtfVB60xSCtmMOusJwoaOOGmgSfRwy+BNtmPmMDJJNPwZbuuSbbVs298j0qQCw843A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrdYPBptrcx70T0L1oyYy/761PBMY5fM0piZwIZYMc4=;
 b=Lf4Qq0rbdTW6yHoTdTnrZoDIce5npdDTXhUJjOTBh34WqRj4fQiC7lVwl8Pk0q6oChLMKQnIj+zO5DtchrVRxTQjVCpey1Xmy7JHad3NnM8I1ogXIcg9MIaAazhIaHG6WwH73sBRpJ12tnXGr8oz1PmVhG9l/zYMVico5palVks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1820.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 06:29:30 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:29:30 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v7 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
Date: Mon, 12 Aug 2024 15:29:18 +0900
Message-Id: <20240812062919.78-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
References: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f37e5b6-0e96-4a56-fcf7-08dcba981f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Eo7gtVx+NMigycVRWLaiuq7l6oEjdn0GrEd3E2vSxi7tjCb0fyqJlGe2Aly9?=
 =?us-ascii?Q?6f+qKNAs6kSW36CqhOMeacGE0thil4tsuRHi2pEH0ODhP7ocgSM81HTPP4pt?=
 =?us-ascii?Q?auFKCfr9qicOSRgYysaPanoqCBMsc+XyF1432h+43yLDz+sT04c2k69QicX7?=
 =?us-ascii?Q?6oZU/VW1hysCAifaZRJyDy+sg5aiMpZY/lICJ+MBg6hgAPtpPeArY4pk+S02?=
 =?us-ascii?Q?SzzL6nCVjG8twUiegrFC6N4G0DaL0oJDEssta8GsMxzRvsQ4kZvIvCLlXze5?=
 =?us-ascii?Q?Z4YhTKVdF8wyK++JNxmyIoBjUaG4RKsgAX6lmm9K+GOmEqUWH/6NF1zMYD0S?=
 =?us-ascii?Q?/mNpoaWpeXZDvTCzHps3pesIqogJKsyj+/MbCuLdMxRgKyVgxBkkcgt8FQgG?=
 =?us-ascii?Q?v5Sh6jvNRdIUiGBMeQX37yCMOe6hcQbKiKEtoqiZ2Nye0HcEImvxj+jpH6bv?=
 =?us-ascii?Q?8vbeh8WnIKtOaAAn+v2N+witWk3il0oJWu2246oWTluholwuJFBPseQ3ZFc/?=
 =?us-ascii?Q?A02kHdnqwe/LSYsaDuRR+ygVBPUAOaVjFnIoHNHnsWYx885aM+UvyjCju6Fy?=
 =?us-ascii?Q?/A/g49ndx6NRRLtFxfwKi/bwPkCGU5DIQzifW5zEQ+eqtyKhdp/Pf4KVciKb?=
 =?us-ascii?Q?hAmOzhvkHf86eFel4OU82zGMc42At8G3Hm/GR2rR3ywdEZOZh386NpdPoOfA?=
 =?us-ascii?Q?ou2a9NJl3RApV0vI07PI+Sdqp4DqyqEx7H1r49kPiHdSZizmK7LMfVWoHo0V?=
 =?us-ascii?Q?zQxuHt2gg8niuoYAY9FQklRnm8ExsfPLwDPRUFUmUHm2edWoOiWMmS+qwzAK?=
 =?us-ascii?Q?VcvqZsoDgztTIbq1R11frPbTX2ZuETVgQKJQRbadQdijLMd3tpnyACzZpyDF?=
 =?us-ascii?Q?Ja1min7n31Rw8V3KsBdMXsVTmUa1T2+lkxMLcaG2aLYL88P4a1D4L/061uOx?=
 =?us-ascii?Q?HQNZrehDd0KCimo0kdfMHqmnEYaw1V1C9w/J8RFySdDcAlufsFCBnTQHPKKq?=
 =?us-ascii?Q?sEZM6JpXQG+gna3AJjpUS7Hzv1taHFSz2zgo3t1+YC0peHm/+SLzMPO/i34l?=
 =?us-ascii?Q?jmCkuNPMMDbMRnFjpjkro7dbB3eqsdgCXdvgkj/gGAb9lNx7q94daTpvlRti?=
 =?us-ascii?Q?4hxxd5kVvi5O0QlMUPKJ0A36t8RkIu4mPCf9MIQ9qDFnDa9l01um052CB0Ok?=
 =?us-ascii?Q?6FQO+GWzt+jMop9nUeBx/ZjIXCQS1Ar0zMyoOE1fFOvJU70194leOzpM5xic?=
 =?us-ascii?Q?3V6dIjIHwGcsFVwGPqcmiJJNA8Z1PIV7nykZs3b7YtL9aWX1/6uib/ac738p?=
 =?us-ascii?Q?JZW5AczrFJTp1P3d4cq0n7aOCdDasTHSYzeOPShS9W+y/QmmWiHT9Xlvk+b5?=
 =?us-ascii?Q?vUVojyqfeJG1D9HvKKH5MbGnOU0ow4/UlyWfUvWwn5/S2Dy+5Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bSWNGwmLq5244ggOn3GAmNd5I55PnkZ0mEZ/kAGxVCeaNxyKDQhCQV5WlAKQ?=
 =?us-ascii?Q?gqEvUf2Lq5uD8bnZY5qz1vc1RPob/eC5aNH8w4rAcdy197N3re4w64A5iTJM?=
 =?us-ascii?Q?ANGYIM3zIHC77lXYaKeXRAWMmJbZ9HZOiixec1zbxAy2GrhmhDsn8ydbbmLc?=
 =?us-ascii?Q?F8xuWcngEaOCaFlG0HjCqpsaem+NLSCYq4veLSXpnvqLJ5giOgX1NAW49QyU?=
 =?us-ascii?Q?CWzT2dyoYZVGW4I31YSdMSRysPuzah3O6m4Nx1fUNOh7lj+g63OnSV5yIeQm?=
 =?us-ascii?Q?Nq7RGnIjKWPlWBu2dBViagaw90Qu/b01G02zrGa4BO6BWXTAPKAYQdphIMGm?=
 =?us-ascii?Q?a7/zKDOYyS6BTmv32/8b51Tc4IdXqOGg//BZwLR9UpO2NpgFVTfRLQgQeLTm?=
 =?us-ascii?Q?q+Ojm7f6eNyIvyhaF7cOtYXK1CGxVcqk0EhbKGGgwv6aDz+o/VScOsUiEPF6?=
 =?us-ascii?Q?H8KSph07SRUW0b+LOByI2Lq1b6PvzeU21q4+AvOq2M/waC3LjQ2iruZ06Ti+?=
 =?us-ascii?Q?opTpczjs8UUOiBi9Vl/92GsT/SOZz7m5+e+jqoIh4czff0sccgZ7Ao/p7h48?=
 =?us-ascii?Q?uWTDhekJAIPGWT0qAMRu3JHgT/hRjlzyC89SoHvQmnYtHtiFFoXDL58b4aD6?=
 =?us-ascii?Q?pdXyRF0vlRMNCVWr1InC1P3Mx9i1buxkfFOI7hDzc1PIVYExNLSUNRjuuA/u?=
 =?us-ascii?Q?iqx4wIt4viotO+Kb6KW3/EYEyl03CQsSTyuqEA3fPpZl/kqakKScp28OUMjB?=
 =?us-ascii?Q?7oaCXbmGphe94Yrme6RX05PAmNggOsOUvvraP78GpS5ShV9OesPRZCyQehzC?=
 =?us-ascii?Q?zYAoRmOS2GCsc6gClGWqLJ4Wh29eLycXRkOPoFbzMnveBdKbyP8AExg5/oL+?=
 =?us-ascii?Q?vVgjoi4Oe2W4u2D4phm4dL3LiTfrebq9MN6JRz/uU/7y8/p41VBVaVbfaO9A?=
 =?us-ascii?Q?1/w1ctHyMSlstknds2BRKy+K+q8ma0NE8zc+u8RhrYE5S+fOMaRHHgbZkADO?=
 =?us-ascii?Q?cFqshJSlwi1hBhi+7MTDgEuBU63nT/wGeNO9FrfI7MA/NoiF6gE3uFEj8XQ0?=
 =?us-ascii?Q?LaQaK6JH+hjhk24nwCZL8KV+9IP2kmNCQdtjrOnsPbor7WvrnUtejwi5QYS5?=
 =?us-ascii?Q?9C4V50dD6J9Due8fUvEHn1x8mwnOiemtB0Bhu39AqRqxDgV5NHA5JjHuI2pP?=
 =?us-ascii?Q?MGVt9rgFPaHnzJ8pRONGGMooaNKYfler7tarRaIgZzMZDJ7vV2lxdvV9Vv/N?=
 =?us-ascii?Q?MqmqPV6IQ6MJ1t3Kd/ySu7WJVAnKAoneEBHA4y7Ps5wH7mmnVtsnPsdes1cL?=
 =?us-ascii?Q?rZ9FkAvDdNNZnoRWLf4Al29qpYJIh1nVkbxHs6bRkyeTW9OhPV2YdN3jDhvi?=
 =?us-ascii?Q?jkcxLMGj7ns0zQsidOKAbPrm49JgMUVxPuP6aAo5UlpBJ7hrWsh5Vy8LJbbw?=
 =?us-ascii?Q?TgzVRTwPbgBY+xgGVtnu7i+2fZQK9XV7K3fuBhy9JarfZdOLLWwgcqdjLEtc?=
 =?us-ascii?Q?NtNVSpEz5YoKZL6WMYRsxF/u9lBACNo9vfKrNg0WHbiPRpsb2agOQ1jlaG8b?=
 =?us-ascii?Q?dve0XOFW9MOwugWD6IRAqe6+VsOkE1LeT26dpD7gvxHtbwSQ+45qwMgbGpDo?=
 =?us-ascii?Q?aA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f37e5b6-0e96-4a56-fcf7-08dcba981f2a
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:29:30.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLe6U/bDG5LfsYu8lhFPoQjSlakX5KhKK9azmbCqK/+awatY0q3VW5Wv1GYJVqOmKxhbSzFk4moYya44eDBoMOoC1na04YA5i8MWNlzicQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1820

Use v4l2-common helper functions to calculate bytesperline and sizeimage,
instead of calculating in a wave5 driver directly.

In case of raw(YUV) v4l2_pix_format, the wave5 driver updates
v4l2_pix_format_mplane struct through v4l2_fill_pixfmt_mp() function.

Encoder and Decoder need same bytesperline and sizeimage values
for same v4l2_pix_format.
So, a wave5_update_pix_fmt is refactored to support both together.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |  24 ++
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../chips-media/wave5/wave5-vpu-dec.c         | 301 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 197 +++++-------
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 6 files changed, 240 insertions(+), 319 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index a20d84dbe3aa..2c9d8cbca6e4 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -7,6 +7,8 @@
 
 #include "wave5-helper.h"
 
+#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
+
 const char *state_to_str(enum vpu_instance_state state)
 {
 	switch (state) {
@@ -217,3 +219,25 @@ void wave5_return_bufs(struct vb2_queue *q, u32 state)
 		v4l2_m2m_buf_done(vbuf, state);
 	}
 }
+
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize)
+{
+	v4l2_apply_frmsize_constraints(&width, &height, frmsize);
+
+	if (pix_fmt_type == VPU_FMT_TYPE_CODEC) {
+		pix_mp->width = width;
+		pix_mp->height = height;
+		pix_mp->num_planes = 1;
+		pix_mp->plane_fmt[0].bytesperline = 0;
+		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
+						     pix_mp->plane_fmt[0].sizeimage);
+	} else {
+		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
+	}
+	pix_mp->flags = 0;
+	pix_mp->field = V4L2_FIELD_NONE;
+}
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 6cee1c14d3ce..9937fce553fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -28,4 +28,9 @@ const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx,
 						   const struct vpu_format fmt_list[MAX_FMTS]);
 enum wave_std wave5_to_vpu_std(unsigned int v4l2_pix_fmt, enum vpu_instance_type type);
 void wave5_return_bufs(struct vb2_queue *q, u32 state);
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 698c83e3082e..01423daea78f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -11,111 +11,92 @@
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
 #define VPU_DEC_DRV_NAME "wave5-dec"
 
-#define DEFAULT_SRC_SIZE(width, height) ({			\
-	(width) * (height) / 8 * 3;					\
-})
+static const struct v4l2_frmsize_stepwise dec_hevc_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_h264_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_32_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_32_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_raw_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_RAW_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_RAW_STEP_HEIGHT,
+};
 
 static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_hevc_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = 8192,
-			.min_width = 32,
-			.max_height = 4320,
-			.min_height = 32,
+			.v4l2_frmsize = &dec_h264_frmsize,
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 	}
 };
@@ -234,74 +215,6 @@ static void wave5_handle_src_buffer(struct vpu_instance *inst, dma_addr_t rd_ptr
 	inst->remaining_consumed_bytes = consumed_bytes;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_NV16M:
-	case V4L2_PIX_FMT_NV61M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_SRC_SIZE(width, height),
-						     pix_mp->plane_fmt[0].sizeimage);
-		break;
-	}
-}
-
 static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -389,6 +302,8 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 	}
 
 	if (p_dec_info->initial_info_obtained) {
+		const struct vpu_format *vpu_fmt;
+
 		inst->conf_win.left = initial_info->pic_crop_rect.left;
 		inst->conf_win.top = initial_info->pic_crop_rect.top;
 		inst->conf_win.width = initial_info->pic_width -
@@ -396,10 +311,27 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 		inst->conf_win.height = initial_info->pic_height -
 			initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
 
-		wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
-		wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
+		vpu_fmt = wave5_find_vpu_fmt(inst->src_fmt.pixelformat,
+					     dec_fmt_list[VPU_FMT_TYPE_CODEC]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->src_fmt,
+				     VPU_FMT_TYPE_CODEC,
+				     initial_info->pic_width,
+				     initial_info->pic_height,
+				     vpu_fmt->v4l2_frmsize);
+
+		vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat,
+					     dec_fmt_list[VPU_FMT_TYPE_RAW]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->dst_fmt,
+				     VPU_FMT_TYPE_RAW,
+				     initial_info->pic_width,
+				     initial_info->pic_height,
+				     vpu_fmt->v4l2_frmsize);
 	}
 
 	v4l2_event_queue_fh(fh, &vpu_event_src_ch);
@@ -545,15 +477,16 @@ static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 		vpu_fmt = wave5_find_vpu_fmt(fsize->pixel_format, dec_fmt_list[VPU_FMT_TYPE_RAW]);
 		if (!vpu_fmt)
 			return -EINVAL;
+		return -ENOTTY;
 	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->stepwise.min_width = vpu_fmt->v4l2_frmsize->min_width;
+	fsize->stepwise.max_width = vpu_fmt->v4l2_frmsize->max_width;
+	fsize->stepwise.step_width = W5_DEC_CODEC_STEP_WIDTH;
+	fsize->stepwise.min_height = vpu_fmt->v4l2_frmsize->min_height;
+	fsize->stepwise.max_height = vpu_fmt->v4l2_frmsize->max_height;
+	fsize->stepwise.step_height = W5_DEC_CODEC_STEP_HEIGHT;
 
 	return 0;
 }
@@ -576,6 +509,7 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
 
@@ -589,14 +523,12 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		width = inst->dst_fmt.width;
 		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
+		frmsize = &dec_raw_frmsize;
 	} else {
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
-		width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
 	if (p_dec_info->initial_info_obtained) {
@@ -604,9 +536,8 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		height = inst->dst_fmt.height;
 	}
 
-	wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+			     width, height, frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -718,7 +649,9 @@ static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev,
 		"%s: fourcc: %u width: %u height: %u num_planes: %u colorspace: %u field: %u\n",
@@ -727,20 +660,19 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, dec_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
+		frmsize = &dec_hevc_frmsize;
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+			     width, height, frmsize);
 
 	return 0;
 }
@@ -748,6 +680,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev,
@@ -782,7 +715,13 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, dec_fmt_list[VPU_FMT_TYPE_RAW]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_RAW,
+			     f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			     vpu_fmt->v4l2_frmsize);
 
 	return 0;
 }
@@ -1005,6 +944,7 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_pix_format_mplane inst_format =
 		(q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : inst->dst_fmt;
+	unsigned int i;
 
 	dev_dbg(inst->dev->dev, "%s: num_buffers: %u | num_planes: %u | type: %u\n", __func__,
 		*num_buffers, *num_planes, q->type);
@@ -1018,31 +958,9 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 		if (*num_buffers < inst->fbc_buf_count)
 			*num_buffers = inst->fbc_buf_count;
 
-		if (*num_planes == 1) {
-			if (inst->output_format == FORMAT_422)
-				sizes[0] = inst_format.width * inst_format.height * 2;
-			else
-				sizes[0] = inst_format.width * inst_format.height * 3 / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u\n", __func__, sizes[0]);
-		} else if (*num_planes == 2) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422)
-				sizes[1] = inst_format.width * inst_format.height;
-			else
-				sizes[1] = inst_format.width * inst_format.height / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u\n",
-				__func__, sizes[0], sizes[1]);
-		} else if (*num_planes == 3) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422) {
-				sizes[1] = inst_format.width * inst_format.height / 2;
-				sizes[2] = inst_format.width * inst_format.height / 2;
-			} else {
-				sizes[1] = inst_format.width * inst_format.height / 4;
-				sizes[2] = inst_format.width * inst_format.height / 4;
-			}
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u | size[2]: %u\n",
-				__func__, sizes[0], sizes[1], sizes[2]);
+		for (i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "%s: size[%u]: %u\n", __func__, i, sizes[i]);
 		}
 	}
 
@@ -1568,20 +1486,15 @@ static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int dst_pix_fmt = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *dst_fmt_info = v4l2_format_info(dst_pix_fmt);
-
 	src_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = 1;
-	wave5_update_pix_fmt(src_fmt, 720, 480);
-
-	dst_fmt->pixelformat = dst_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = dst_fmt_info->mem_planes;
-	wave5_update_pix_fmt(dst_fmt, 736, 480);
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_CODEC,
+			     W5_DEF_DEC_PIC_WIDTH, W5_DEF_DEC_PIC_HEIGHT,
+			     &dec_hevc_frmsize);
+
+	dst_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_RAW,
+			     W5_DEF_DEC_PIC_WIDTH, W5_DEF_DEC_PIC_HEIGHT,
+			     &dec_raw_frmsize);
 }
 
 static int wave5_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 985de0c293e2..ef9aa1562346 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -11,65 +11,60 @@
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
 #define VPU_ENC_DRV_NAME "wave5-enc"
 
+static const struct v4l2_frmsize_stepwise enc_frmsize[FMT_TYPES] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_CODEC_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_CODEC_STEP_HEIGHT,
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_RAW_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_RAW_STEP_HEIGHT,
+	},
+};
+
 static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 	}
 };
@@ -106,46 +101,6 @@ static int switch_state(struct vpu_instance *inst, enum vpu_instance_state state
 	return -EINVAL;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = round_up(width, 32) * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 2;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = width * height / 8 * 3;
-		break;
-	}
-}
-
 static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -360,13 +315,8 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 			return -EINVAL;
 	}
 
-	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = enc_frmsize[VPU_FMT_TYPE_CODEC];
 
 	return 0;
 }
@@ -391,7 +341,9 @@ static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -399,20 +351,19 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fmt.height);
+		frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC];
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+			     width, height, frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -499,7 +450,9 @@ static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -507,28 +460,26 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_RAW]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
+		frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW];
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+			     width, height, frmsize);
 	return 0;
 }
 
 static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -568,7 +519,15 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_CODEC,
+			     f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			     vpu_fmt->v4l2_frmsize);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 
 	return 0;
 }
@@ -584,12 +543,17 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-	case V4L2_SEL_TGT_CROP:
 		s->r.left = 0;
 		s->r.top = 0;
 		s->r.width = inst->dst_fmt.width;
 		s->r.height = inst->dst_fmt.height;
 		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->conf_win.width;
+		s->r.height = inst->conf_win.height;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -612,8 +576,10 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 
 	s->r.left = 0;
 	s->r.top = 0;
-	s->r.width = inst->src_fmt.width;
-	s->r.height = inst->src_fmt.height;
+	s->r.width = min(s->r.width, inst->dst_fmt.width);
+	s->r.height = min(s->r.height, inst->dst_fmt.height);
+
+	inst->conf_win = s->r;
 
 	return 0;
 }
@@ -1151,8 +1117,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 	open_param->wave_param.lambda_scaling_enable = 1;
 
 	open_param->line_buf_int_en = true;
-	open_param->pic_width = inst->dst_fmt.width;
-	open_param->pic_height = inst->dst_fmt.height;
+	open_param->pic_width = inst->conf_win.width;
+	open_param->pic_height = inst->conf_win.height;
 	open_param->frame_rate_info = inst->frame_rate;
 	open_param->rc_enable = inst->rc_enable;
 	if (inst->rc_enable) {
@@ -1456,20 +1422,15 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int src_pix_fmt = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *src_fmt_info = v4l2_format_info(src_pix_fmt);
-
-	src_fmt->pixelformat = src_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = src_fmt_info->mem_planes;
-	wave5_update_pix_fmt(src_fmt, 416, 240);
+	src_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_RAW,
+			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
+			     &enc_frmsize[VPU_FMT_TYPE_RAW]);
 
 	dst_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = 1;
-	wave5_update_pix_fmt(dst_fmt, 416, 240);
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
+			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
+			     &enc_frmsize[VPU_FMT_TYPE_CODEC]);
 }
 
 static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
@@ -1733,6 +1694,8 @@ static int wave5_vpu_open_enc(struct file *filp)
 	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
 
 	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 	inst->colorspace = V4L2_COLORSPACE_REC709;
 	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 32b7fd3730b5..3847332551fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -38,10 +38,7 @@ enum vpu_fmt_type {
 
 struct vpu_format {
 	unsigned int v4l2_pix_fmt;
-	unsigned int max_width;
-	unsigned int min_width;
-	unsigned int max_height;
-	unsigned int min_height;
+	const struct v4l2_frmsize_stepwise *v4l2_frmsize;
 };
 
 static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index e4bc2e467cb5..1ea9f5f31499 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -32,10 +32,29 @@
 
 #define MAX_NUM_INSTANCE                32
 
-#define W5_MIN_ENC_PIC_WIDTH            256
-#define W5_MIN_ENC_PIC_HEIGHT           128
-#define W5_MAX_ENC_PIC_WIDTH            8192
-#define W5_MAX_ENC_PIC_HEIGHT           8192
+#define W5_DEF_DEC_PIC_WIDTH            720U
+#define W5_DEF_DEC_PIC_HEIGHT           480U
+#define W5_MIN_DEC_PIC_8_WIDTH          8U
+#define W5_MIN_DEC_PIC_8_HEIGHT         8U
+#define W5_MIN_DEC_PIC_32_WIDTH         32U
+#define W5_MIN_DEC_PIC_32_HEIGHT        32U
+#define W5_MAX_DEC_PIC_WIDTH            8192U
+#define W5_MAX_DEC_PIC_HEIGHT           4320U
+#define W5_DEC_CODEC_STEP_WIDTH         1U
+#define W5_DEC_CODEC_STEP_HEIGHT        1U
+#define W5_DEC_RAW_STEP_WIDTH           32U
+#define W5_DEC_RAW_STEP_HEIGHT          16U
+
+#define W5_DEF_ENC_PIC_WIDTH            416U
+#define W5_DEF_ENC_PIC_HEIGHT           240U
+#define W5_MIN_ENC_PIC_WIDTH            256U
+#define W5_MIN_ENC_PIC_HEIGHT           128U
+#define W5_MAX_ENC_PIC_WIDTH            8192U
+#define W5_MAX_ENC_PIC_HEIGHT           8192U
+#define W5_ENC_CODEC_STEP_WIDTH         8U
+#define W5_ENC_CODEC_STEP_HEIGHT        8U
+#define W5_ENC_RAW_STEP_WIDTH           32U
+#define W5_ENC_RAW_STEP_HEIGHT          16U
 
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
-- 
2.43.0


