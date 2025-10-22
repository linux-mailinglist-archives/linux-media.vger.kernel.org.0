Return-Path: <linux-media+bounces-45197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D00BFAA9C
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF8C74E4D15
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C68E2FD69D;
	Wed, 22 Oct 2025 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OM++QOgK"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021101.outbound.protection.outlook.com [40.107.42.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B152FD1D9;
	Wed, 22 Oct 2025 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119251; cv=fail; b=RId/aG9JCsIfH/cHp+XzX8v0pDpun36OOplYNkja3NLUxcq2AiVE7YiTZB4smE08Kyqd7UlSBFshWBvtP1cxfyNtuw6lDjOKr/3r/Frisl3+YZS/6FlwECG4T3XLvqxZoxE7pQrvmljCkgn6nq0Qor+UEJzzVcCYvxecAmCvfo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119251; c=relaxed/simple;
	bh=R7qD92dc/MFY7gmbVUzcpDdP+QkQusjbLaiR+LiFeNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QelAKD+9k1foHcx4lYNdzb6QrfDiznUntBbO/ygjBvI2JslYJRn5vA6HEsGzcMrKJavnAve8yMBAb9rRwJrHiXydB0z8ZBAAJ3wMxrEbyZ3lthhEte1ScgH4VvdTpNbnC7NiHc5JSXiNkScVPk5ZV68rYu29rDm6OqI5tU5iE7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OM++QOgK; arc=fail smtp.client-ip=40.107.42.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQLYoy7Kmq9NCTamrPpVIWcdK9ad/INDJFedyV2SFtxQoUg+sIpU33kn+ii7ArO77HhbmxBRvVGAQx0BId8LBhn5nPLTYHjz8x5Wl+Hn/zW+GB/Ue2G6+3nFGymf8JRWbhbhMqlbbunvPHg2oMY3nNJ/VK5PUUZbAj3DvJ4bdFECMKocF5KFNhWqomCUbX0GfMhVX7OB4BOxVURmL+Os+/ltg588TUUnFW2c317lz/vZus9DCBqVZsmSoYGLi3qluJYHbWCxkUL5TsODqCjzQ6EBmoxF8UvShjluwb32zrHVn1nwXE77TVGX8A3G6Em2zcZ2kh5Z7fz+UZTMFV80cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBPLYm6bTWyimkVz2bMdEY682qG/wlhDD6kaMz90nsQ=;
 b=WkwX+2N7ZxJR3ahgtPHr36Hfd5fl+X/UufDTwhOnjpL8JXLQTcRva7cGrB4k8Jmnr8SDBb19AdehBpZo8wij7eKSpfoQKzIkbNgCnQG9ZQwHmrNO/jVzIBhjoOHRrm7o0A5HqlKHIU4+AyjYjAevDW5u8GoxwD4Y/t/an/qJGkqknuwN5PdKMa1OLHJ0asuyMq43QuQfYjU06Egkx5P9XnBELf786I4OvBU1WFKm5mWPvIhPkbyp4Yx9OjY6xn7LNr0f2F6g5noJseL0CJIdwIyMTpHK2LEkoIIN/CfX3RyCDo7lJ1R+KUtOiNcs/xd92hAAotIXGJKekhfx5Q8zyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBPLYm6bTWyimkVz2bMdEY682qG/wlhDD6kaMz90nsQ=;
 b=OM++QOgK47ykk/d4LEUXQjxILaDQp5McSbblJ/Vb7NsPws/48zuOk4q+BpDldJ+7lG0V1a/AG7Wu/7sdGECsEL7uSb7bHE4sE+MjbU3QVm8zLhEVS52zH8tdyMyNs3xidln4Lw89s5T1veYsADakd0Yzpo5IUsH6M3s5Geq87UQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB2918.KORP216.PROD.OUTLOOK.COM (2603:1096:301:159::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Wed, 22 Oct 2025 07:47:26 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:26 +0000
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
Subject: [PATCH v4 5/9] media: chips-media: wave6: Add Wave6 core driver
Date: Wed, 22 Oct 2025 16:47:06 +0900
Message-Id: <20251022074710.575-6-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: e8a677bf-fc89-4af3-7fee-08de113f3e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N7JuTz9dtyhRe5E+OFao7mVAoWV6XYANvRI5DwdNksfwOy0KQhQRLeBG38ih?=
 =?us-ascii?Q?5Hg1qMoZzHqs9a3vuuaqV/dC9ZXOT8x9SSqy9DD4o/cCOj4xvdlKAiCFCDN+?=
 =?us-ascii?Q?IU9UykLMJQhH2Hs2YaGSVvIr4vUEBt9jIFHDeLt/ZKYGiXb8bFx5DdN48c1n?=
 =?us-ascii?Q?NP4XyCYeQhjMMcp11p+tdEj1EFc1rV3OVjJLxNcbieOUxJ9AwjvkBGLyGbsj?=
 =?us-ascii?Q?jeKYvV0gL4e7EplpqtvsQRYEfdJIeWo7I1QMPs6vmFJUkT5ojhIxXLTnXzXK?=
 =?us-ascii?Q?tKtVjWzU0/CKwUktPwXdWGPIWSWzsGTopD0ofinzTbK8lSjSBvS3byrnN/tC?=
 =?us-ascii?Q?kNjx2YzwnpE3WbUx70QARUTcYziRB6eLOqOFuznQFDAiiA/x91bX/ijOjztH?=
 =?us-ascii?Q?KvVNfIfCkpIj3zGe5K5kN+aQQecX53lMSOvDHYJqK3sOB66dbBoQAw7vqe50?=
 =?us-ascii?Q?jNYz140qXc5lnPJNADyhr318SOePnZuYYfwd2vIFhNRkthmZSkKsqziW7g0X?=
 =?us-ascii?Q?4z7v7/QkjxsN8wsQghCcvH9k9kAhKQBHaC/t2MTiZnEE+SFDTEpiR8jLVs6c?=
 =?us-ascii?Q?5OWP0FJ36ktMcbacKhVf1vMqFHY1Dvqy3OiQGUW61ZMie/kdPLrrHqydTOEZ?=
 =?us-ascii?Q?kQ5YJOLtSqGhF4miYOnLrglKkq6mj/Txo5xr1EfW930tX/xO5/+M01VNWYdI?=
 =?us-ascii?Q?f9S3dxoweoZm4laP0S4bXSfN4jrnWK0ZNbsfKZoIp+IhVPSnmAGHL/s8VJ0q?=
 =?us-ascii?Q?SdfTmzrL2rJi2T6HecrpKl1+dEblxRk/CeOJb5ekEtwjWPUJ6cz0Nhhv4T31?=
 =?us-ascii?Q?IxEPqZWNNy7cVXetyEy3uAmBqx4ohPAJvbdWO4g3/Hg1+mIJ06bznfRLOK/6?=
 =?us-ascii?Q?t6pNLgfqM17DI9+X2LGEMxObvG0jmR5WSPvRjxYt96kcz2ZKNUsyN/39te+9?=
 =?us-ascii?Q?0N61LdRI0V1J5Bm1AbcoAmh7y8aPSoyrjRFQFvnXHA4MMU68jc/owfi7drvN?=
 =?us-ascii?Q?iB4OqAVwLJB8jLydyX5T/SXssMQFFve7fu1lOHRDHCuJP8oDgx6gDZk/SB5b?=
 =?us-ascii?Q?qRD4dNdsyf3oyAFrXjVJA//aF/jKj0wFAk9v91HKsT7fo0J4aFDT3A1zwtS5?=
 =?us-ascii?Q?cdV20I5GiEdMjoqulRUElLxW/fl2yYhoQAJYAmFxRCbd0VuQBdKWTGa4b2A7?=
 =?us-ascii?Q?AcZ18qJbZ9a3hsnMbDrWcUBcQZrZ3UGR46K+oQ8UGS6Xs2jlSHst8k1r5FsC?=
 =?us-ascii?Q?Q/9TlRTDhA06c+9uZ8NP3O2ls/X1QZqCDnSiy81Iet1vPyJfMY7U+ssjsRu8?=
 =?us-ascii?Q?030hkqEOopHg1P230+S/QU+6MVYDRO7lS/1ptxkfJ+GA6u55VTyiRUj/U3Rp?=
 =?us-ascii?Q?DKPGiMJEXEpbUhS+hu5pzsbwbJWzsI585TrEyt85RP2pPPTBsPOUQxw8c1cS?=
 =?us-ascii?Q?K4qGCdj9yWuH0ADtRiTPePUgXaO2jlVva0XPtn1EXEwMj3nimKLLfmmh5q9n?=
 =?us-ascii?Q?GIro9CJDAig4cPu+N5qwtG3qUIxr2sikYXvN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqyJgWu9HoEeWEGms0CcFrPOclHneMfHchYLVw2dKXADvaPa2JppqVZdz7yY?=
 =?us-ascii?Q?Oj8DfKe3MozDTSXy9POgKPJhXdqq/xWBI4JAgFW+X8ozkt0jSWbxhDjiWT/3?=
 =?us-ascii?Q?KEvmnaX6ti0AJRvwnc0H3bZ8jzfRIXNjIjmys+hWIErjIq9xgtE0fHGPEXiZ?=
 =?us-ascii?Q?agM8QrwuGFBnTVI53oLAo7h4h0LiCJvarr1hLhvWGU6f6NYFZqEcQbn52ugD?=
 =?us-ascii?Q?YI178fduTLih7P/P8KLfifyBL/wcvXXFjXHuuVOCFBJwlVmd8hJtiqVYc8Yg?=
 =?us-ascii?Q?ygw360+cw5vrwx8kEeUOKyImFvbvKq/93R28Ew2BAfQoNl1sx8wNsvTlHMUF?=
 =?us-ascii?Q?+mksS3JkA8NrhgjbMApA/ZUuzzZFTuqt5aXWa4wCCw5r+v04nXTqJ3rUvIey?=
 =?us-ascii?Q?wuBsGp0aSky9TXcscLa4r6tzdh2NYobz4KGBDdIQ93bSJBWdZXEs2cDMjXuW?=
 =?us-ascii?Q?HFGKS33Zn7fkGH29wZ/d1rG0pmF2ZKe5cul6m3W4FHhX+LAObjY6LfCJnu1c?=
 =?us-ascii?Q?K8xorzMqJbjU1hwoPQ3cGgF+bqC2cGJeRpJUNFaNnTLDZDqDBq/5pDxucQH4?=
 =?us-ascii?Q?7UE5gzVwBT1mvXQLrqKkkf0rQ5V+UzfwA1L3MaEP4fbzbv9py9zRed+Zg/co?=
 =?us-ascii?Q?bBymUC4/6suXM/4sJKyLixuQ4pwtlh+ojYuUwZ9fa3eI9TLzJOUmlpvsWaXE?=
 =?us-ascii?Q?QlM7c5yozAwbha//+a9IuUtjTBsfTMGv/TVqtTQLxJLUVHyxN9zjCMz5b/Zw?=
 =?us-ascii?Q?+ml2hxJrL1eLf3+ZwNqYBblWd+2ohmGcnowKaOZqn4EleNaPCVh/vTeEAzsC?=
 =?us-ascii?Q?izv7MT5ch8VMCpz8VjzyU0bjfiWRZ0tRIXfgwA+nBR/E9tZNS/bdUYugZs1/?=
 =?us-ascii?Q?KWyg/845hgYiyNWXV097gDDAiJiYEM2yko9uKYB+zcOQ9l3U+QSZK5ivg8pu?=
 =?us-ascii?Q?4ujkKBkuoTtw74kcQ9OoosXIBkJwA7j/ZjRFykjB1JqNQiyn4AQfWSixQ9LD?=
 =?us-ascii?Q?5JTKGoTvB6HOBm63HiJJQg7xLdjUHfXlsHx3qDAJmZnqa9Cmv3qKa2C/MTrG?=
 =?us-ascii?Q?alGcqUwsj8ExbkTyYtTKLZ+OZSzzHSa9jmmRE9wKkuNca5lMNgO0eslYfM/z?=
 =?us-ascii?Q?bXFYrObm6JwqMoZzgpIpkefYEq8rAZ5LAmBtcfaBjXtL41kkGZJ5ckrvHzrF?=
 =?us-ascii?Q?T0sRLPPpod3l0EHmV8MhKlvY7sIahShBURu5PUdhmnncvdnzj7BsZuArSDSx?=
 =?us-ascii?Q?QbaIJxxOlyacd7KVP4krZfwBwWyGSVuPYQ9OWVbgP5+HK7iznGKL7vCTfgjR?=
 =?us-ascii?Q?vJ9LGify7vS7/wW+bvxbtVKtRZn0UiTmEYzNIPvGlO1kSvewhM0lzAZ9Zj1a?=
 =?us-ascii?Q?MNSy5jhkJMbFqbJsLFkFM1WqmhJcQDeFe9KlQJkBjO27hg00RyqG06bmSz4P?=
 =?us-ascii?Q?nLc3ROuZcxXxrHqslTODM2FhGTQ9NW9SUL6ZhtBKs856OR1+GzU1m92wQsSn?=
 =?us-ascii?Q?hWx5z77sfcNoIOyASRmBWdPNOiiTGhi3047GsTzAwFh87xbqU1vj9J7qwPgU?=
 =?us-ascii?Q?3QRolgUnpDvA5tdYXiou3Pr323Js147JaUqDq4RlCixgPUswNP4akWcLiies?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a677bf-fc89-4af3-7fee-08de113f3e7c
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:26.4238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hqp/gR0iYMaIC1p9f6zSmFckhsFxy5bOLd8GeShWi8ThbOZVMXE1aQIx6NSCxNg8jaSByiWcuwIXNvBDFfXdr+JqQ9gqHgltoJX3VYOqDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2918

Add the core driver for the Chips&Media Wave6 video codec IP.

The core region provides the encoding and decoding capabilities of
the VPU and depends on the control region for firmware and shared
resource management.

This driver configure the v4l2 m2m video device and handles
communication with the Wave6 hardware to perform video processing tasks.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-core.c        | 410 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 133 ++++++
 2 files changed, 543 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..5e89516b6a63
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/debugfs.h>
+#include <linux/iopoll.h>
+#include "wave6-vpu-core.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+#include "wave6-vpu-dbg.h"
+
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
+#define WAVE6_IS_ENC BIT(0)
+#define WAVE6_IS_DEC BIT(1)
+
+static const struct wave6_vpu_core_resource wave633c_core_data = {
+	.codec_types = WAVE6_IS_ENC | WAVE6_IS_DEC,
+	.compatible_fw_version = 0x2010000,
+};
+
+static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_irq irq_info;
+
+	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
+		return IRQ_NONE;
+
+	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
+	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
+
+	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
+	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
+	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
+
+	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
+
+	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+		if (core->vpu)
+			core->vpu->req_work_buffer(core->vpu, core);
+
+		return IRQ_HANDLED;
+	}
+
+	kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq));
+
+	return IRQ_WAKE_THREAD;
+}
+
+static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_device *core,
+							u32 inst_idc)
+{
+	struct vpu_instance *inst;
+
+	guard(spinlock)(&core->inst_lock);
+
+	list_for_each_entry(inst, &core->instances, list) {
+		if (BIT(inst->id) & inst_idc)
+			return inst;
+	}
+
+	return NULL;
+}
+
+static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_instance *inst;
+	struct vpu_irq irq_info;
+
+	while (kfifo_len(&core->irq_fifo)) {
+		bool error = false;
+
+		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
+			break;
+
+		inst = wave6_vpu_core_get_instance(core, irq_info.inst_idc);
+		if (!inst)
+			break;
+
+		if ((irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_info.status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&inst->irq_done);
+			continue;
+		}
+
+		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		if (inst->ops && inst->ops->finish_process)
+			inst->ops->finish_process(inst, error);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void wave6_vpu_core_check_state(struct vpu_core_device *core)
+{
+	u32 val;
+	int ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	ret = read_poll_timeout(vpu_read_reg, val, val != 0,
+				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				false, core, W6_VPU_VCPU_CUR_PC);
+	if (ret)
+		return;
+
+	wave6_vpu_enable_interrupt(core);
+	ret = wave6_vpu_get_version(core);
+	if (ret) {
+		dev_err(core->dev, "wave6_vpu_get_version fail\n");
+		return;
+	}
+
+	dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		core->attr.product_code,
+		FW_VERSION_MAJOR(core->attr.fw_version),
+		FW_VERSION_MINOR(core->attr.fw_version),
+		FW_VERSION_REL(core->attr.fw_version),
+		core->attr.fw_revision,
+		core->attr.hw_version);
+
+	if (core->attr.fw_version < core->res->compatible_fw_version)
+		dev_err(core->dev, "fw version is too low (< v%d.%d.%d)\n",
+			FW_VERSION_MAJOR(core->res->compatible_fw_version),
+			FW_VERSION_MINOR(core->res->compatible_fw_version),
+			FW_VERSION_REL(core->res->compatible_fw_version));
+}
+
+void wave6_vpu_core_activate(struct vpu_core_device *core)
+{
+	core->active = true;
+}
+
+static void wave6_vpu_core_wait_activated(struct vpu_core_device *core)
+{
+	if (core->active)
+		wave6_vpu_core_check_state(core);
+}
+
+static int wave6_vpu_core_probe(struct platform_device *pdev)
+{
+	struct vpu_core_device *core;
+	const struct wave6_vpu_core_resource *res;
+	int ret;
+	int irq;
+
+	res = device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&core->inst_lock);
+	INIT_LIST_HEAD(&core->instances);
+	dev_set_drvdata(&pdev->dev, core);
+	core->dev = &pdev->dev;
+	core->res = res;
+
+	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
+	    !strcmp(pdev->dev.parent->driver->name, WAVE6_VPU_PLATFORM_DRIVER_NAME))
+		core->vpu = dev_get_drvdata(pdev->dev.parent);
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	core->num_clks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					wave6_vpu_core_irq,
+					wave6_vpu_core_irq_thread,
+					0, "vpu_irq", core);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(core);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	ret = kfifo_alloc(&core->irq_fifo,
+			  MAX_NUM_INSTANCE * sizeof(struct vpu_irq),
+			  GFP_KERNEL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_m2m_dev_release;
+	}
+
+	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (IS_ERR_OR_NULL(core->debugfs))
+		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
+	pm_runtime_enable(&pdev->dev);
+
+	if (core->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_dec: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (core->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_enc: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
+		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
+	return 0;
+
+err_dec_unreg:
+	if (core->res->codec_types & WAVE6_IS_DEC)
+		wave6_vpu_dec_unregister_device(core);
+err_temp_vbuf_free:
+	wave6_vdi_free_dma(&core->temp_vbuf);
+err_kfifo_free:
+	kfifo_free(&core->irq_fifo);
+err_m2m_dev_release:
+	wave6_vpu_release_m2m_dev(core);
+err_v4l2_unregister:
+	v4l2_device_unregister(&core->v4l2_dev);
+
+	return ret;
+}
+
+static void wave6_vpu_core_remove(struct platform_device *pdev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	wave6_vpu_enc_unregister_device(core);
+	wave6_vpu_dec_unregister_device(core);
+	wave6_vdi_free_dma(&core->temp_vbuf);
+	kfifo_free(&core->irq_fifo);
+	wave6_vpu_release_m2m_dev(core);
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static int __maybe_unused wave6_vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	/*
+	 * Only call parent VPU put_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute sleep only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		core->vpu->put_vpu(core->vpu, core);
+
+	if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	if (core->num_clks) {
+		ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clocks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Only call parent VPU get_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute boot only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		ret = core->vpu->get_vpu(core->vpu, core);
+
+	if (!ret)
+		wave6_vpu_core_wait_activated(core);
+	else if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return ret;
+}
+
+static int __maybe_unused wave6_vpu_core_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	v4l2_m2m_suspend(core->m2m_dev);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(core->m2m_dev);
+
+	return ret;
+}
+
+static int __maybe_unused wave6_vpu_core_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	v4l2_m2m_resume(core->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
+			   wave6_vpu_core_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
+				wave6_vpu_core_resume)
+};
+
+static const struct of_device_id wave6_vpu_core_ids[] = {
+	{ .compatible = "nxp,imx95-vpu-core", .data = &wave633c_core_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_core_ids);
+
+static struct platform_driver wave6_vpu_core_driver = {
+	.driver = {
+		.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME,
+		.of_match_table = wave6_vpu_core_ids,
+		.pm = &wave6_vpu_core_pm_ops,
+	},
+	.probe = wave6_vpu_core_probe,
+	.remove = wave6_vpu_core_remove,
+};
+
+module_platform_driver(wave6_vpu_core_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU CORE V4L2 driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
new file mode 100644
index 000000000000..9b247e5c3c9f
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CORE_H__
+#define __WAVE6_VPU_CORE_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+#include "wave6-vpuapi.h"
+
+#define vpu_write_reg(CORE, ADDR, DATA) wave6_vpu_writel(CORE, ADDR, DATA)
+#define vpu_read_reg(CORE, ADDR) wave6_vpu_readl(CORE, ADDR)
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
+	u32 average_qp;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+#define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
+#define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
+#define VPU_FMT_FLAG_10BIT		BIT(2)
+#define VPU_FMT_FLAG_RGB		BIT(3)
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+	enum frame_buffer_format fb_fmt;
+	enum endian_mode endian;
+	enum csc_format_order csc_fmt_order;
+	unsigned int flags;
+};
+
+/**
+ * struct wave6_vpu_core_resource - VPU CORE device compatible data
+ * @codec_types:		Bitmask of supported codec types
+ * @compatible_fw_version:	Firmware version compatible with driver
+ */
+struct wave6_vpu_core_resource {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+static inline struct vpu_instance *wave6_fh_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_file_to_vpu_inst(struct file *filp)
+{
+	return wave6_fh_to_vpu_inst(file_to_v4l2_fh(filp));
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+void wave6_vpu_core_activate(struct vpu_core_device *core);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int  wave6_vpu_dec_register_device(struct vpu_core_device *core);
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
+int  wave6_vpu_enc_register_device(struct vpu_core_device *core);
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst,
+				  struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+
+#endif /* __WAVE6_VPU_CORE_H__ */
-- 
2.31.1


