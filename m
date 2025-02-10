Return-Path: <linux-media+bounces-25885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7591A2E749
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EEA1889F72
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2741CD1FD;
	Mon, 10 Feb 2025 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="RuNzMicH"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022096.outbound.protection.outlook.com [40.107.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87C1C5D6F;
	Mon, 10 Feb 2025 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178474; cv=fail; b=sTEGD8FORDtTSsXruLolfVZKhI7/exDTG0COAytWOhWzrwHRNTxo1Kd+NUc1YmLVIVmPVI0wNE1ggTHKNPGcwPjlLDcgUkuXrg+ZAstaDS6rE3aAkR4emZExIM8rUb14vUePOMOt0I8NGVF/zH5ixinPBYbQxkNEGmB8kKRmNTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178474; c=relaxed/simple;
	bh=euKQ1VC9zCxnTUPBulYgKuC3W7TR4Hld54nPhGnywZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MsXtxk4Ptivk+wj7QBFKxX3/caFVCbuY5nFII7TdSbI9xDXgtT8K231f4yNdVgBXo3WX6DW+Q8oE7nvE/7KmZxpoyg0eqDEnbpPi8TOJW7EC9/iRkyLbhoxbU4muUycnjXM1LjO7+KPriYPsWBvQzCn1SUjYCjfC+1vtvXO8y8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=RuNzMicH; arc=fail smtp.client-ip=40.107.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpr5tU5ihQkj7rztSICvI7zNSHgLGRdYay81fELeWUNCWd8yxijJWpJSW/DIQXyw/WoIlUf/uMi5/HqZq4MDq8RKOnwAwo86ZXbqvafk8nSOW4iibXNYfXf8kOFxwO89A1yOrveYM2IrUtuOYWbeYhfAz1C7Vfv9sLSdRso6DYXmrdtwJTqF5IULgAGAZyysTnBx52DLgLfL3uSt2hAxhUIZxOcjocQK4KjWzt7rQfo53nw4wSp9T/rQDfvWFDuKwlP5MrbcouryjXvB/QbgIPZaCGPF984n80EpQMez4OZClyK6IlZCFhaihfbGNYLGQdh98vYfTI2nPQEbSerODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0H5QFIRX42PTjKvtlysdVphj5ex/6LYnVxJb/AESJc=;
 b=evxLDLboI+eneYnlzaKdI+FkktppAhh42r+IUXa1KZNIHFCCSmENzM+Tr9ud5DOiG8p9wolRhF6iAqwYCrRyMMJQEGjhtJBvfKxLRcpgo8iXKqJim7Q8o/1uALQ03ruXylouECRMKsB72Sh1cRlFqYLbQIVf5C01tDMh56B8TTxxgcHgmyqVii9ks0xBNys4QL0ULVPEvkR/e8SHSocHU0wj04vjWeYvjuJDWQB2nD31WE895JqrwArMqXCKxWPyuycWoA91jFa5dYs6awJBI6wmSrep2TtRr0L7Hl4xuYbooXGOE8H/o6zGm3NM2xXXEclaMVe5bwTihORPsBjApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0H5QFIRX42PTjKvtlysdVphj5ex/6LYnVxJb/AESJc=;
 b=RuNzMicHYOZ8K4K1gCOxYRUaFVPAMAp3F/yDbTGIQkhQQ2Bggk/dpdckEhz8Nuj+RXBf13YexXg+Spk01Qd4Qr3j6vzxM6hJdoZeZ/bx6iYxl+tSkC5vPHcd1VtBYXqWXvWmk2QCzfqFu1y6/ZqRfHwyvt9oaJTR/sB3jy0u/AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:37 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:37 +0000
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
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH 5/8] media: chips-media: wave6: Add v4l2 m2m driver
Date: Mon, 10 Feb 2025 18:07:22 +0900
Message-Id: <20250210090725.4580-6-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0178.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PU4P216MB1504:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6131fc-8c72-4b97-e36c-08dd49b25cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|4022899009|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZTAoTVg4qJ/8G7u79obCQVBusbop7lNeYPPeIsndcsknFSc/LXcm7n1aEPqB?=
 =?us-ascii?Q?KY9Ix3lgVxH8NVHNVEFEKqS6EkOcskEZVuTJ1RQHO1D7MdoL2dAjcfPMn5VO?=
 =?us-ascii?Q?wMKOzeUrnoxAqJPLv64DWvRxx/lRQxNxW1FpOgiEQ4lsoKZ/tvO+lNFUANKK?=
 =?us-ascii?Q?65xaSpFZBobekm6HoiXt5hLH1Hi45tbODnQtATUOwKc621eJgE3lSbFu/I89?=
 =?us-ascii?Q?ktPxjk+RcKsXtlExRFflgXkpTqG9cJ4a1ursmgHX9Ke3g9ELbf7mko8fLMYb?=
 =?us-ascii?Q?ypnyEqZggqJ/NdckMH5sAHx43Fto4ZVN9t2mzbNgdmDpn9gXlxrTrYNEoz/m?=
 =?us-ascii?Q?/wxC7jzVMys94UF3vg1R0LeHe5yh88fNM8qAb+8bgIkgImOh8dtx2wbUkcs5?=
 =?us-ascii?Q?QkbwdlKa54rU/sur6qw+QHZDJxl72X70MJ81DVvRIZfghC+kKiIkll1ZbtfX?=
 =?us-ascii?Q?kVJgCMKqnrhVGA0SG77PIFhpMx1xteaK9HTrGXaZPM4blT4gxnfdKZeTogsz?=
 =?us-ascii?Q?oWwyhfdvIrrBkwCFUuDZeRFuQkK//qNBgh4TeCyQhpf8M3eqMFQbzXrBdqpJ?=
 =?us-ascii?Q?Z7uz/8NYvSkFjgMRjkyb88SgkK4/SLUpKMVjBRSQhzICxaCew2Zgc8CRHSno?=
 =?us-ascii?Q?F38E+Mof5dRqcVZ6nYji1cxVHQ7HPINvRi+8D8hSDrJOg+I513W63/40j6YJ?=
 =?us-ascii?Q?LuO3zvPszUI4JclwRvUvvZJpR16Ugz0T6knyA9ZhylOkFcCaQYkBHUACCIgz?=
 =?us-ascii?Q?j+ZjEw85v/sHY7niRfFoBZ9CfFVUa/7G5Ka75154P1fLVrgl69KOVBXHLHMP?=
 =?us-ascii?Q?6w7bFkCK0eZZaEbCVbREp10wfw4EjxsqC4Nk3tzIbv6ZblPvQL0xZ6aG4LHu?=
 =?us-ascii?Q?jTX3bO8uPgMus0gkhMM7JjozXdWjqqubveFEiYYFzcbgQE01FgiJwDfay4yB?=
 =?us-ascii?Q?QuH2oXvM0ZjmbC1Ky5dXOtQhrtI+3qtA5JvffDVL3YkqxxO+ACiwlYS/dkxk?=
 =?us-ascii?Q?/ymGGUTYvOFWGlYkUaVjr/R1mT/hZZuG/Zme3A0xxa7+yVIOSEoJylPSCxVE?=
 =?us-ascii?Q?eTVNxhouj8R7R+cBZK2NSg03oU9ersBnhKhIVyEUehaTCsjvgW8qIPsWzJBj?=
 =?us-ascii?Q?+l4yBJY40+fx1CLZtsql7IwLs06mvMhhvhKo+auT4r+67Qui7q5+PIEenzYv?=
 =?us-ascii?Q?oRYK7QuAPsmr4X/jHK5edHSk7lJSzX9ExWyRHjwhlxiBW5Wtu27lKf/XMVRq?=
 =?us-ascii?Q?flHvMEL+VlkSf5R9mdBtBizvUZx0kXveeYjhJBb3mKh5TbY8QkkYWiHdiwYq?=
 =?us-ascii?Q?7soylOFnbSzi9cSLOR1Mu0dl5Son6yRSpegH0E7rOt0wl0TqE/d2NRrs3s5B?=
 =?us-ascii?Q?jUsGRT4yRSVLezqVvEsgd3klXVdLCm/rEOLJs4Ngpm0Uc7ZDEZuKHEojjCwO?=
 =?us-ascii?Q?r6pKpMKIzuADe1I7MpCtMuEyHaFQ2nlf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(4022899009)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5aFJ4VzennRUkAmYN8bSmdXH/d1Pnh8eolXW0zIH3ehrQFAh++ntn/qr8faZ?=
 =?us-ascii?Q?jSfBnhinfgWp733SgEIOfjitJyojIPuXJZKAUcELu73ToIMIn1/FBTsfVNZi?=
 =?us-ascii?Q?Dppl67mWd7iq95o9n8UlkpHbG2HFFwdb/HGupHK7MbNXlL9AWP57iiieLDP2?=
 =?us-ascii?Q?sVpK/07GZKpG3kHFsW+VuyoS3jkHTTzT6xPjngk7sGmkE7G4sqPB51F3HnXT?=
 =?us-ascii?Q?wG1dHMwMCBv2pu9Q/NQRoTC3h5N7MalL8mvQih92msQ/EEpzwAdh4vs/AUei?=
 =?us-ascii?Q?xtlzWbe6bFyDO4i5rOKQCMZlI4jUeE7adwVTnl1jy9sxrGOz0jDwPhXaVhKH?=
 =?us-ascii?Q?6RQRTewETA4QEVnRJvVBktYXhGZQHTgdTz2d+q3zg1reYwbQpmKKVcKHSV2u?=
 =?us-ascii?Q?k93PElYV+deUvPgcbbvSs7lMDedYgHSvNulCEBe3/bSru7tJ1AMQ8t2luNG/?=
 =?us-ascii?Q?aE76t2MLBEKzFBqXGzBlmNBEYoyjjD9rYWbPaZ6wxFl2NwDQWAGc2QfqfXzo?=
 =?us-ascii?Q?pUSr3wTw+V4J+IvNMGsT7vBYc4Gw9arlHxinOELuZhcR6R0LmoAmNrm5PVL+?=
 =?us-ascii?Q?lFazlyo2q8uuwATKEmxxSGWdl6qQBti8XaQqMlvFlbOPyS+L/WOsWYPQ+T0S?=
 =?us-ascii?Q?+ToEhb4FDp/4DrnBGKA4D63ZUuY8NHowdjLv9cRLizE14lraQ9Fy6HOzGiWW?=
 =?us-ascii?Q?oGCiinzHCqa1zYRZ4GSwPBp3AdtsnPqcPfBXaY57yjwkbMG+S67LdwhAwyC7?=
 =?us-ascii?Q?rBH76P9RkpBjCFbA6kvIiW+19q1o35B5hUX/cf5L8UdDU6ihmVUKe5I0hr8x?=
 =?us-ascii?Q?ZKasq/f9uQbMHZzjFJrYdgHYiK5GyjV0uMYYbI0DNEg4tKVhjq5+KLK5N/78?=
 =?us-ascii?Q?Vsxb9yRO3HhrZVOcZ0VfNwK9bkIZE3zEzRL6mqOQ2AtHEFLlErRnCPtBQa3A?=
 =?us-ascii?Q?UEiCUCITjea0o9xuOCNxSA+eGqqA9nEtDePYvvM8ycnkKwCn1Q/db/Dx7j4m?=
 =?us-ascii?Q?yWQ//qQoZXSSF1Omi6/h02mWfyFMI/r4lkzHn/mUSpU1d1tUOPKXNVYIgh7b?=
 =?us-ascii?Q?MMEs8GOUV4AQVk3h7snVfNtXvDDkQIvDP1fUS2lwlf4Lefbsk73yD34n/xt0?=
 =?us-ascii?Q?vKjk1bQQs+VZQGXtBmjHg7SiwFRLL4+hdeYABxQTEM44Bj0atZfsywikZ3cZ?=
 =?us-ascii?Q?QSSR5gVSTkrsaLA4358APZmxg9yDohgn+l5qlWcQud6vmjkeJQs+gpeqtntS?=
 =?us-ascii?Q?sit4AI359V0FQY35d6cxjq980gxlL7R2quuBNzUls35pcfDMpe71l1eaXcKo?=
 =?us-ascii?Q?LJjjibJ+oKvDgUdYUsfZUNX1FLX+eL9tyt8/FL8BOLmhDA4bwP8InkevQiQb?=
 =?us-ascii?Q?BbzOpe2z6Xr+VXlSJgRTVroruKLqfHxwz/3obqADOYIlyF+EpfAwpFezrp+o?=
 =?us-ascii?Q?U1YmgKdX7iAzyl3R5sUFBjkAFTjrAyjxCfY5kMpGTXDj89/eM2ENNB29XKx1?=
 =?us-ascii?Q?GNiqvOsM2MZvbaoxXE0uac0zFRkBQMq24JiDLTCb2poqGF4Fm+QZkBbv9/z+?=
 =?us-ascii?Q?s/VhkbqIASDMiRPMURGtM+dLeABwBB5zbdmg4+W3y7EqbvmmjQn0G0iEfM7n?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6131fc-8c72-4b97-e36c-08dd49b25cb7
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:37.0390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V81wZk2z3Be5MvjlLfaYJUG6rGFIC515Dwmoci6YE8juSIu8nojwTbbyoqsR2TlfO0xlPfG6dNKlcfErmjWpHQQ9Pcy08MxJWfkeKbrhnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

Add v4l2 m2m drivers which support stateful decoder and encoder.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave6/wave6-vpu-dec.c         | 1883 ++++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2698 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  381 +++
 3 files changed, 4962 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
new file mode 100644
index 000000000000..f6ed078a2824
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
@@ -0,0 +1,1883 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 stateful decoder interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include "wave6-vpu.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
+
+#define VPU_DEC_DEV_NAME "C&M Wave6 VPU decoder"
+#define VPU_DEC_DRV_NAME "wave6-dec"
+#define V4L2_CID_VPU_THUMBNAIL_MODE (V4L2_CID_USER_BASE + 0x1001)
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
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 3,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 2,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 2,
+		},
+	}
+};
+
+static int wave6_vpu_dec_seek_header(struct vpu_instance *inst);
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
+		wave6_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+	}
+}
+
+static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst)
+{
+	u32 fail_res;
+	int ret;
+
+	dprintk(inst->dev->dev, "[%d] destroy instance\n", inst->id);
+	wave6_vpu_remove_dbgfs_file(inst);
+
+	ret = wave6_vpu_dec_close(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
+			ret, fail_res);
+	}
+
+	wave6_vpu_dec_release_fb(inst);
+
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
+	trace_dec_pic(inst, src_buf ? src_buf->vb2_buf.index : -1, src_size);
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
+	aligned_width = round_up(width, 32);
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
+		ret = wave6_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
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
+	dma_addr_t buf_addr_y, buf_addr_cb, buf_addr_cr;
+	u32 buf_size;
+	u32 fb_stride = inst->dst_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = fb_stride * inst->dst_fmt.height;
+	u32 chroma_size = (fb_stride / 2) * (inst->dst_fmt.height / 2);
+	struct frame_buffer disp_buffer = {0};
+	struct dec_initial_info initial_info = {0};
+	int consumed_num = wave6_vpu_get_consumed_fb_num(inst);
+	int ret;
+
+	wave6_vpu_dec_give_command(inst, DEC_GET_SEQ_INFO, &initial_info);
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
+			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
+			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
+			buf_addr_cb = buf_addr_y + luma_size;
+			buf_addr_cr = buf_addr_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes == 2) {
+			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0) +
+				   vb2_plane_size(&dst_buf->vb2_buf, 1);
+			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
+			buf_addr_cb = wave6_get_dma_addr(dst_buf, 1);
+			buf_addr_cr = buf_addr_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes == 3) {
+			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0) +
+				   vb2_plane_size(&dst_buf->vb2_buf, 1) +
+				   vb2_plane_size(&dst_buf->vb2_buf, 2);
+			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
+			buf_addr_cb = wave6_get_dma_addr(dst_buf, 1);
+			buf_addr_cr = wave6_get_dma_addr(dst_buf, 2);
+		}
+		disp_buffer.buf_y = buf_addr_y;
+		disp_buffer.buf_cb = buf_addr_cb;
+		disp_buffer.buf_cr = buf_addr_cr;
+		disp_buffer.width = inst->src_fmt.width;
+		disp_buffer.height = inst->src_fmt.height;
+		disp_buffer.stride = fb_stride;
+		disp_buffer.map_type = LINEAR_FRAME_MAP;
+		disp_buffer.luma_bitdepth = initial_info.luma_bitdepth;
+		disp_buffer.chroma_bitdepth = initial_info.chroma_bitdepth;
+		disp_buffer.chroma_format_idc = initial_info.chroma_format_idc;
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
+				    struct dec_initial_info *initial_info)
+{
+	struct color_param *color = &initial_info->color;
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
+				    struct dec_initial_info *info)
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
+	if (inst->state == VPU_INST_STATE_OPEN) {
+		ret = wave6_vpu_dec_seek_header(inst);
+		if (ret) {
+			vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+			vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+		}
+		return -EAGAIN;
+	}
+
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
+		v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
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
+		dprintk(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->sequence);
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
+	dprintk(inst->dev->dev, "[%d] skip frame %d\n", inst->id, inst->sequence);
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
+		dprintk(inst->dev->dev, "[%d] recycle display buffer\n", inst->id);
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
+		dprintk(inst->dev->dev, "[%d] discard frame %d\n", inst->id, dst_buf->sequence);
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
+		dprintk(inst->dev->dev, "[%d] eos\n", inst->id);
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
+static void wave6_vpu_dec_handle_source_change(struct vpu_instance *inst,
+					       struct dec_initial_info *info)
+{
+	static const struct v4l2_event vpu_event_src_ch = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	dprintk(inst->dev->dev, "pic size %dx%d profile %d, min_fb_cnt : %d | min_disp_cnt : %d\n",
+		info->pic_width, info->pic_height,
+		info->profile, info->min_frame_buffer_count, info->frame_buf_delay);
+
+	wave6_vpu_dec_retry_one_frame(inst);
+	wave6_vpu_dec_give_command(inst, DEC_RESET_FRAMEBUF_INFO, NULL);
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
+	trace_source_change(inst, info);
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
+	ret = wave6_vpu_dec_get_output_info(inst, &info);
+	if (ret)
+		goto finish_decode;
+
+	trace_dec_done(inst, &info);
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
+		struct dec_initial_info initial_info = {0};
+
+		v4l2_m2m_mark_stopped(m2m_ctx);
+
+		if (info.frame_display)
+			wave6_handle_display_frames(inst, &info);
+
+		if (info.release_disp_frame_num)
+			wave6_handle_discard_frames(inst, &info);
+
+		wave6_vpu_dec_give_command(inst, DEC_GET_SEQ_INFO, &initial_info);
+		wave6_vpu_dec_handle_source_change(inst, &initial_info);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+			      vpu_fmt->min_width, round_up(inst->src_fmt.width, 32));
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
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
+	if (inst->dst_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
+	    inst->dst_fmt.pixelformat == V4L2_PIX_FMT_NV12M) {
+		inst->cbcr_interleave = true;
+		inst->nv21 = false;
+	} else if (inst->dst_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
+		   inst->dst_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
+		inst->cbcr_interleave = true;
+		inst->nv21 = true;
+	} else {
+		inst->cbcr_interleave = false;
+		inst->nv21 = false;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+			    round_up(inst->src_fmt.width, 32));
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+		dprintk(inst->dev->dev, "[%d] drain\n", inst->id);
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
+	trace_s_ctrl(inst, ctrl);
+
+	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
+		__func__, ctrl->name, ctrl->val);
+
+	switch (ctrl->id) {
+	case V4L2_CID_VPU_THUMBNAIL_MODE:
+		inst->thumbnail_mode = ctrl->val;
+		break;
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
+static const struct v4l2_ctrl_config wave6_vpu_thumbnail_mode = {
+	.ops = &wave6_vpu_dec_ctrl_ops,
+	.id = V4L2_CID_VPU_THUMBNAIL_MODE,
+	.name = "thumbnail mode",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.def = 0,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_WRITE_ONLY,
+};
+
+static void wave6_set_dec_openparam(struct dec_open_param *open_param,
+				    struct vpu_instance *inst)
+{
+	open_param->inst_buffer.temp_base = inst->dev->temp_vbuf.daddr;
+	open_param->inst_buffer.temp_size = inst->dev->temp_vbuf.size;
+	open_param->bs_mode = BS_MODE_PIC_END;
+	open_param->stream_endian = VPU_STREAM_ENDIAN;
+	open_param->frame_endian = VPU_FRAME_ENDIAN;
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
+	wave6_vpu_activate(inst->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret) {
+		dev_err(inst->dev->dev, "runtime_resume failed %d\n", ret);
+		return ret;
+	}
+
+	wave6_vpu_wait_activated(inst->dev);
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
+	dprintk(inst->dev->dev, "[%d] decoder\n", inst->id);
+
+	if (inst->thumbnail_mode)
+		wave6_vpu_dec_give_command(inst, ENABLE_DEC_THUMBNAIL_MODE, NULL);
+
+	wave6_vpu_create_dbgfs_file(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
+	inst->v4l2_fh.m2m_ctx->ignore_cap_streaming = true;
+	v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, true);
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
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	fb_num = p_dec_info->initial_info.min_frame_buffer_count;
+	mv_num = p_dec_info->initial_info.req_mv_buffer_count;
+
+	fb_stride = ALIGN(inst->src_fmt.width, 32);
+	fb_height = ALIGN(inst->src_fmt.height, 32);
+
+	for (i = 0; i < fb_num; i++) {
+		struct frame_buffer *frame = &inst->frame_buf[i];
+		struct vpu_buf *vframe = &inst->frame_vbuf[i];
+		unsigned int l_size = fb_stride * fb_height;
+		unsigned int ch_size = ALIGN(fb_stride / 2, 32) * fb_height;
+
+		vframe->size = l_size + ch_size;
+		ret = wave6_alloc_dma(inst->dev->dev, vframe);
+		if (ret) {
+			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
+				vframe->size);
+			goto error;
+		}
+
+		frame->buf_y = vframe->daddr;
+		frame->buf_cb = vframe->daddr + l_size;
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
+	ret = wave6_vpu_dec_register_frame_buffer_ex(inst, fb_num, fb_stride,
+						     fb_height,
+						     COMPRESSED_FRAME_MAP);
+	if (ret) {
+		dev_err(inst->dev->dev, "register frame buffer fail %d\n", ret);
+		goto error;
+	}
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	return 0;
+
+error:
+	wave6_vpu_dec_release_fb(inst);
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
+	if (V4L2_TYPE_IS_OUTPUT(q->type) &&
+	    inst->state == VPU_INST_STATE_SEEK) {
+		wave6_vpu_pause(inst->dev->dev, 0);
+		wave6_vpu_dec_destroy_instance(inst);
+		wave6_vpu_pause(inst->dev->dev, 1);
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dec_seek_header(struct vpu_instance *inst)
+{
+	struct dec_initial_info initial_info;
+	int ret;
+
+	memset(&initial_info, 0, sizeof(struct dec_initial_info));
+
+	ret = wave6_vpu_dec_issue_seq_init(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed wave6_vpu_dec_issue_seq_init %d\n", ret);
+		return ret;
+	}
+
+	if (wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT) < 0)
+		dev_err(inst->dev->dev, "failed to call vpu_wait_interrupt()\n");
+
+	ret = wave6_vpu_dec_complete_seq_init(inst, &initial_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "vpu_dec_complete_seq_init: %d, reason : 0x%x\n",
+			ret, initial_info.err_reason);
+		if ((initial_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT) ||
+		    (initial_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT_PROFILE)) {
+			ret = -EINVAL;
+		} else if ((initial_info.err_reason & HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND) ||
+			   (initial_info.err_reason & AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND)) {
+			wave6_handle_skipped_frame(inst);
+			ret = 0;
+		}
+	} else {
+		wave6_vpu_dec_handle_source_change(inst, &initial_info);
+		inst->v4l2_fh.m2m_ctx->ignore_cap_streaming = false;
+		v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, false);
+		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx)))
+			wave6_handle_last_frame(inst, NULL);
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
+	trace_start_streaming(inst, q->type);
+
+	wave6_vpu_pause(inst->dev->dev, 0);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		fmt = &inst->src_fmt;
+		if (inst->state == VPU_INST_STATE_NONE) {
+			ret = wave6_vpu_dec_create_instance(inst);
+			if (ret)
+				goto exit;
+		}
+
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
+	wave6_vpu_pause(inst->dev->dev, 1);
+	if (ret)
+		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
+
+	dprintk(inst->dev->dev, "[%d] %s %c%c%c%c %dx%d, %d buffers, ret = %d\n",
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
+	trace_stop_streaming(inst, q->type);
+
+	dprintk(inst->dev->dev, "[%d] %s, input %d, decode %d error %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		inst->queued_src_buf_num, inst->processed_buf_num, inst->error_buf_num);
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		goto exit;
+
+	wave6_vpu_pause(inst->dev->dev, 0);
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
+	wave6_vpu_pause(inst->dev->dev, 1);
+
+exit:
+	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
+}
+
+static int wave6_vpu_dec_buf_init(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct dec_initial_info initial_info = {0};
+	int i;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	wave6_vpu_dec_give_command(inst, DEC_GET_SEQ_INFO, &initial_info);
+	if (initial_info.chroma_format_idc != YUV400)
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
+	src_vq->min_queued_buffers = 1;
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
+	dst_vq->min_queued_buffers = 1;
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
+	.start_process = wave6_vpu_dec_start_decode,
+	.finish_process = wave6_vpu_dec_finish_decode,
+};
+
+static int wave6_vpu_open_dec(struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+	struct vpu_device *dev = video_drvdata(filp);
+	struct vpu_instance *inst = NULL;
+	int ret;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	inst->dev = dev;
+	inst->type = VPU_INST_TYPE_DEC;
+	inst->ops = &wave6_vpu_dec_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data = &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh);
+
+	inst->v4l2_fh.m2m_ctx =
+		v4l2_m2m_ctx_init(dev->m2m_dev, inst, wave6_vpu_dec_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret = PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(&inst->v4l2_ctrl_hdl, 10);
+	v4l2_ctrl_new_custom(&inst->v4l2_ctrl_hdl, &wave6_vpu_thumbnail_mode, NULL);
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
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN, 0,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
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
+	return ret;
+}
+
+static int wave6_vpu_dec_release(struct file *filp)
+{
+	struct vpu_instance *inst = wave6_to_vpu_inst(filp->private_data);
+
+	dprintk(inst->dev->dev, "[%d] release\n", inst->id);
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
+	mutex_lock(&inst->dev->dev_lock);
+	if (inst->state != VPU_INST_STATE_NONE) {
+		wave6_vpu_pause(inst->dev->dev, 0);
+		wave6_vpu_dec_destroy_instance(inst);
+		wave6_vpu_pause(inst->dev->dev, 1);
+	}
+	mutex_unlock(&inst->dev->dev_lock);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh);
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
+int wave6_vpu_dec_register_device(struct vpu_device *dev)
+{
+	struct video_device *vdev_dec;
+	int ret;
+
+	vdev_dec = devm_kzalloc(dev->v4l2_dev.dev, sizeof(*vdev_dec), GFP_KERNEL);
+	if (!vdev_dec)
+		return -ENOMEM;
+
+	dev->video_dev_dec = vdev_dec;
+
+	strscpy(vdev_dec->name, VPU_DEC_DEV_NAME, sizeof(vdev_dec->name));
+	vdev_dec->fops = &wave6_vpu_dec_fops;
+	vdev_dec->ioctl_ops = &wave6_vpu_dec_ioctl_ops;
+	vdev_dec->release = video_device_release_empty;
+	vdev_dec->v4l2_dev = &dev->v4l2_dev;
+	vdev_dec->vfl_dir = VFL_DIR_M2M;
+	vdev_dec->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_dec->lock = &dev->dev_lock;
+	video_set_drvdata(vdev_dec, dev);
+
+	ret = video_register_device(vdev_dec, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void wave6_vpu_dec_unregister_device(struct vpu_device *dev)
+{
+	video_unregister_device(dev->video_dev_dec);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
new file mode 100644
index 000000000000..36417a7fef99
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
@@ -0,0 +1,2698 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 stateful encoder interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/pm_runtime.h>
+#include "wave6-vpu.h"
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
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUYV,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV42,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 3,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 3,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGB24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_P010,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_ARGB32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_XRGB32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGBA32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGBX32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_ARGB2101010,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
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
+		wave6_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+		wave6_free_dma(&inst->aux_vbuf[AUX_BUF_SUB_SAMPLE][i]);
+	}
+}
+
+static void wave6_vpu_enc_destroy_instance(struct vpu_instance *inst)
+{
+	u32 fail_res;
+	int ret;
+
+	dprintk(inst->dev->dev, "[%d] destroy instance\n", inst->id);
+	wave6_vpu_remove_dbgfs_file(inst);
+
+	ret = wave6_vpu_enc_close(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
+			ret, fail_res);
+	}
+
+	wave6_vpu_enc_release_fb(inst);
+	wave6_free_dma(&inst->ar_vbuf);
+
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
+	bool is_10bit = false;
+
+	if (!(inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGB24) &&
+	    !(inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB32) &&
+	    !(inst->src_fmt.pixelformat == V4L2_PIX_FMT_XRGB32) &&
+	    !(inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBA32) &&
+	    !(inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBX32) &&
+	    !(inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB2101010))
+		return;
+
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB2101010)
+		is_10bit = true;
+
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBA32 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBX32)
+		pic_param->csc.format_order = 8;
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
+	size_info.mirror_direction = inst->enc_ctrls.mirror_direction;
+	size_info.rotation_angle = inst->enc_ctrls.rot_angle;
+
+	ret = wave6_vpu_enc_get_aux_buffer_size(inst, size_info, &size);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Get size fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		inst->aux_vbuf[type][i].size = size;
+		ret = wave6_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
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
+	struct enc_initial_info initial_info;
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
+	if (wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT) < 0) {
+		dev_err(inst->dev->dev, "seq change timeout\n");
+		return ret;
+	}
+
+	wave6_vpu_enc_complete_seq_init(inst, &initial_info);
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
+			pic_param.force_pic_type_enable = true;
+			pic_param.force_pic_type = ENC_FORCE_PIC_TYPE_IDR;
+			inst->error_recovery = false;
+		}
+		if (src_vbuf->force_frame_qp) {
+			pic_param.force_pic_qp_enable = true;
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
+	trace_enc_pic(inst, &pic_param);
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
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
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
+		dprintk(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->sequence);
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
+	dprintk(inst->dev->dev, "[%d] eos\n", inst->id);
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
+	ret = wave6_vpu_enc_get_output_info(inst, &info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "vpu_enc_get_output_info fail %d  reason: %d | info : %d\n",
+			ret, info.error_reason, info.warn_info);
+		goto finish_encode;
+	}
+
+	trace_enc_done(inst, &info);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
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
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV16 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV24 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV16M ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGB24 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV24 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_P010 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB32 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_XRGB32 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBA32 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBX32 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB2101010) {
+		inst->cbcr_interleave = true;
+		inst->nv21 = false;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV61 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV42 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV61M) {
+		inst->cbcr_interleave = true;
+		inst->nv21 = true;
+	} else {
+		inst->cbcr_interleave = false;
+		inst->nv21 = false;
+	}
+
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	int i;
+
+	dev_dbg(inst->dev->dev, "\n");
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type))
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	a->parm.output.timeperframe.numerator = 1;
+	a->parm.output.timeperframe.denominator = inst->frame_rate;
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
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
+
+	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type))
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	if (a->parm.output.timeperframe.denominator && a->parm.output.timeperframe.numerator) {
+		inst->frame_rate = a->parm.output.timeperframe.denominator /
+				   a->parm.output.timeperframe.numerator;
+	} else {
+		a->parm.output.timeperframe.numerator = 1;
+		a->parm.output.timeperframe.denominator = inst->frame_rate;
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
+	trace_s_ctrl(inst, ctrl);
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
+		p->rot_angle = ctrl->val;
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
+		output->en_lf_cross_slice_boundary = 0;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
+		output->en_dbk = 1;
+		output->en_lf_cross_slice_boundary = 1;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		output->en_dbk = 1;
+		output->en_lf_cross_slice_boundary = 0;
+		break;
+	default:
+		break;
+	}
+	output->intra_period = ctrls->i_period;
+	output->beta_offset_div2 = ctrls->loop_filter_beta;
+	output->tc_offset_div2 = ctrls->loop_filter_alpha;
+	if (output->profile >= H264_PROFILE_HP)
+		output->en_transform8x8 = ctrls->_8x8_transform;
+	output->en_constrained_intra_pred = ctrls->constrained_intra_prediction;
+	output->cb_qp_offset = ctrls->chroma_qp_index_offset;
+	output->cr_qp_offset = ctrls->chroma_qp_index_offset;
+	if (output->profile >= H264_PROFILE_MP)
+		output->en_cabac = ctrls->entropy_mode;
+	output->en_auto_level_adjusting = DEFAULT_EN_AUTO_LEVEL_ADJUSTING;
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
+		output->en_lf_cross_slice_boundary = 0;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
+		output->en_dbk = 1;
+		output->en_sao = 1;
+		output->en_lf_cross_slice_boundary = 1;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		output->en_dbk = 1;
+		output->en_sao = 1;
+		output->en_lf_cross_slice_boundary = 0;
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
+	output->beta_offset_div2 = ctrls->lf_beta_offset_div2;
+	output->tc_offset_div2 = ctrls->lf_tc_offset_div2;
+	output->en_constrained_intra_pred = ctrls->const_intra_pred;
+	output->en_strong_intra_smoothing = ctrls->strong_smoothing;
+	output->en_temporal_mvp = ctrls->tmv_prediction;
+	output->num_ticks_poc_diff_one = DEFAULT_NUM_TICKS_POC_DIFF;
+	output->en_auto_level_adjusting = DEFAULT_EN_AUTO_LEVEL_ADJUSTING;
+	output->en_intra_trans_skip = DEFAULT_EN_INTRA_TRANS_SKIP;
+	output->en_me_center = DEFAULT_EN_ME_CENTER;
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
+
+	open_param->source_endian = VPU_SOURCE_ENDIAN;
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV420 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21 ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV420M ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV12M ||
+	    inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV21M) {
+		open_param->src_format = FORMAT_420;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV422P ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV16 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV61 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV422M ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV16M ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV61M) {
+		open_param->src_format = FORMAT_422;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV24 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_NV42) {
+		open_param->src_format = FORMAT_YUV444_24BIT;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUV24) {
+		open_param->src_format = FORMAT_YUV444_24BIT_PACKED;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_YUYV) {
+		open_param->src_format = FORMAT_YUYV;
+		open_param->packed_format = PACKED_YUYV;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGB24) {
+		open_param->src_format = FORMAT_RGB_24BIT_PACKED;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_P010) {
+		open_param->src_format = FORMAT_420_P10_16BIT_MSB;
+		open_param->source_endian = VDI_128BIT_LE_BYTE_SWAP;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB32 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_XRGB32 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBA32 ||
+		   inst->src_fmt.pixelformat == V4L2_PIX_FMT_RGBX32) {
+		open_param->src_format = FORMAT_RGB_32BIT_PACKED;
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_ARGB2101010) {
+		open_param->src_format = FORMAT_RGB_P10_32BIT_PACKED;
+		open_param->source_endian = VDI_128BIT_LE_WORD_BYTE_SWAP;
+	}
+	open_param->line_buf_int_en = true;
+	open_param->stream_endian = VPU_STREAM_ENDIAN;
+	open_param->inst_buffer.temp_base = inst->dev->temp_vbuf.daddr;
+	open_param->inst_buffer.temp_size = inst->dev->temp_vbuf.size;
+	open_param->inst_buffer.ar_base = inst->ar_vbuf.daddr;
+	open_param->pic_width = inst->codec_rect.width;
+	open_param->pic_height = inst->codec_rect.height;
+
+	output->custom_map_endian = VPU_USER_DATA_ENDIAN;
+	output->gop_preset_idx = PRESET_IDX_IPP_SINGLE;
+	output->temp_layer_cnt = DEFAULT_TEMP_LAYER_CNT;
+	output->rc_initial_level = DEFAULT_RC_INITIAL_LEVEL;
+	output->pic_rc_max_dqp = DEFAULT_PIC_RC_MAX_DQP;
+	output->rc_initial_qp = DEFAULT_RC_INITIAL_QP;
+	output->en_adaptive_round = DEFAULT_EN_ADAPTIVE_ROUND;
+	output->q_round_inter = DEFAULT_Q_ROUND_INTER;
+	output->q_round_intra = DEFAULT_Q_ROUND_INTRA;
+
+	output->frame_rate = inst->frame_rate;
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
+	output->en_vbv_overflow_drop_frame = (ctrls->frame_skip_mode) ? 1 : 0;
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
+	output->color.video_signal_type_present = DEFAULT_VUI_VIDEO_SIGNAL_TYPE_PRESENT_FLAG;
+	output->color.color_range = to_video_full_range_flag(inst->quantization);
+	output->color.color_description_present = DEFAULT_VUI_COLOR_DESCRIPTION_PRESENT_FLAG;
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
+	wave6_vpu_activate(inst->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret) {
+		dev_err(inst->dev->dev, "runtime_resume failed %d\n", ret);
+		return ret;
+	}
+
+	wave6_vpu_wait_activated(inst->dev);
+
+	inst->ar_vbuf.size = ALIGN(WAVE6_ARBUF_SIZE, 4096);
+	ret = wave6_alloc_dma(inst->dev->dev, &inst->ar_vbuf);
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
+	dprintk(inst->dev->dev, "[%d] encoder\n", inst->id);
+	wave6_vpu_create_dbgfs_file(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
+
+	return 0;
+
+error_open:
+	wave6_free_dma(&inst->ar_vbuf);
+error_pm:
+	pm_runtime_put_sync(inst->dev->dev);
+	return ret;
+}
+
+static int wave6_vpu_enc_initialize_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct enc_initial_info initial_info;
+	struct v4l2_ctrl *ctrl;
+
+	if (inst->enc_ctrls.mirror_direction) {
+		wave6_vpu_enc_give_command(inst, ENABLE_MIRRORING, NULL);
+		wave6_vpu_enc_give_command(inst, SET_MIRROR_DIRECTION,
+					   &inst->enc_ctrls.mirror_direction);
+	}
+	if (inst->enc_ctrls.rot_angle) {
+		wave6_vpu_enc_give_command(inst, ENABLE_ROTATION, NULL);
+		wave6_vpu_enc_give_command(inst, SET_ROTATION_ANGLE,
+					   &inst->enc_ctrls.rot_angle);
+	}
+
+	ret = wave6_vpu_enc_issue_seq_init(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init fail %d\n", ret);
+		return ret;
+	}
+
+	if (wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT) < 0) {
+		dev_err(inst->dev->dev, "seq init timeout\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_enc_complete_seq_init(inst, &initial_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init error\n");
+		return ret;
+	}
+
+	dev_dbg(inst->dev->dev, "min_fb_cnt : %d | min_src_cnt : %d\n",
+		initial_info.min_frame_buffer_count,
+		initial_info.min_src_frame_count);
+
+	ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+			      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, initial_info.min_src_frame_count);
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
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+
+	fb_num = p_enc_info->initial_info.min_frame_buffer_count;
+	mv_num = p_enc_info->initial_info.req_mv_buffer_count;
+
+	fb_stride = ALIGN(inst->codec_rect.width, 32);
+	fb_height = ALIGN(inst->codec_rect.height, 32);
+
+	for (i = 0; i < fb_num; i++) {
+		struct frame_buffer *frame = &inst->frame_buf[i];
+		struct vpu_buf *vframe = &inst->frame_vbuf[i];
+		unsigned int l_size = fb_stride * fb_height;
+		unsigned int ch_size = ALIGN(fb_stride / 2, 32) * fb_height;
+
+		vframe->size = l_size + ch_size;
+		ret = wave6_alloc_dma(inst->dev->dev, vframe);
+		if (ret) {
+			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
+				vframe->size);
+			goto error;
+		}
+
+		frame->buf_y = vframe->daddr;
+		frame->buf_cb = vframe->daddr + l_size;
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
+	return 0;
+
+error:
+	wave6_vpu_enc_release_fb(inst);
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
+		vpu_buf->force_frame_qp = (!inst->enc_ctrls.frame_rc_enable) ? true : false;
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
+	struct v4l2_pix_format_mplane *fmt;
+	struct vb2_queue *vq_peer;
+	int ret = 0;
+
+	trace_start_streaming(inst, q->type);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		fmt = &inst->src_fmt;
+		vq_peer = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	} else {
+		fmt = &inst->dst_fmt;
+		vq_peer = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+	}
+
+	dprintk(inst->dev->dev, "[%d] %s %c%c%c%c %dx%d, %d buffers\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		fmt->pixelformat,
+		fmt->pixelformat >> 8,
+		fmt->pixelformat >> 16,
+		fmt->pixelformat >> 24,
+		fmt->width, fmt->height, vb2_get_num_buffers(q));
+
+	if (!vb2_is_streaming(vq_peer))
+		return 0;
+
+	wave6_vpu_pause(inst->dev->dev, 0);
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
+	wave6_vpu_pause(inst->dev->dev, 1);
+	if (ret)
+		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct vb2_queue *vq_peer;
+
+	trace_stop_streaming(inst, q->type);
+
+	dprintk(inst->dev->dev, "[%d] %s, input %d, decode %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		inst->queued_src_buf_num, inst->sequence);
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		goto exit;
+
+	if (wave6_vpu_both_queues_are_streaming(inst))
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_STOP);
+
+	wave6_vpu_pause(inst->dev->dev, 0);
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
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		vq_peer = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	else
+		vq_peer = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	if (!vb2_is_streaming(vq_peer) && inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_enc_destroy_instance(inst);
+
+	wave6_vpu_pause(inst->dev->dev, 1);
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
+	struct vpu_device *dev = video_drvdata(filp);
+	struct vpu_instance *inst = NULL;
+	struct v4l2_ctrl_handler *v4l2_ctrl_hdl;
+	int ret;
+
+	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+	v4l2_ctrl_hdl = &inst->v4l2_ctrl_hdl;
+
+	inst->dev = dev;
+	inst->type = VPU_INST_TYPE_ENC;
+	inst->ops = &wave6_vpu_enc_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data = &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh);
+
+	inst->v4l2_fh.m2m_ctx =
+		v4l2_m2m_ctx_init(dev->m2m_dev, inst, wave6_vpu_enc_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret = PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(v4l2_ctrl_hdl, 50);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN, 0,
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
+			  1, 1500000000, 1, 2097152);
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
+	wave6_update_crop_info(inst, 0, 0, inst->dst_fmt.width, inst->dst_fmt.height);
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	inst->frame_rate = 30;
+
+	return 0;
+
+err_m2m_release:
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+free_inst:
+	kfree(inst);
+	return ret;
+}
+
+static int wave6_vpu_enc_release(struct file *filp)
+{
+	struct vpu_instance *inst = wave6_to_vpu_inst(filp->private_data);
+
+	dprintk(inst->dev->dev, "[%d] release\n", inst->id);
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
+	mutex_lock(&inst->dev->dev_lock);
+	if (inst->state != VPU_INST_STATE_NONE) {
+		wave6_vpu_pause(inst->dev->dev, 0);
+		wave6_vpu_enc_destroy_instance(inst);
+		wave6_vpu_pause(inst->dev->dev, 1);
+	}
+	mutex_unlock(&inst->dev->dev_lock);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh);
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
+int wave6_vpu_enc_register_device(struct vpu_device *dev)
+{
+	struct video_device *vdev_enc;
+	int ret;
+
+	vdev_enc = devm_kzalloc(dev->v4l2_dev.dev, sizeof(*vdev_enc), GFP_KERNEL);
+	if (!vdev_enc)
+		return -ENOMEM;
+
+	dev->video_dev_enc = vdev_enc;
+
+	strscpy(vdev_enc->name, VPU_ENC_DEV_NAME, sizeof(vdev_enc->name));
+	vdev_enc->fops = &wave6_vpu_enc_fops;
+	vdev_enc->ioctl_ops = &wave6_vpu_enc_ioctl_ops;
+	vdev_enc->release = video_device_release_empty;
+	vdev_enc->v4l2_dev = &dev->v4l2_dev;
+	vdev_enc->vfl_dir = VFL_DIR_M2M;
+	vdev_enc->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_enc->lock = &dev->dev_lock;
+	video_set_drvdata(vdev_enc, dev);
+
+	ret = video_register_device(vdev_enc, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void wave6_vpu_enc_unregister_device(struct vpu_device *dev)
+{
+	video_unregister_device(dev->video_dev_enc);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
new file mode 100644
index 000000000000..e614eda01a5a
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
@@ -0,0 +1,381 @@
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
+	stride_y = round_up(stride_y, 32);
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
+const char *wave6_vpu_instance_state_name(u32 state)
+{
+	switch (state) {
+	case VPU_INST_STATE_NONE: return "none";
+	case VPU_INST_STATE_OPEN: return "open";
+	case VPU_INST_STATE_INIT_SEQ: return "init_seq";
+	case VPU_INST_STATE_PIC_RUN: return "pic_run";
+	case VPU_INST_STATE_SEEK: return "seek";
+	case VPU_INST_STATE_STOP: return "stop";
+	}
+	return "unknown";
+}
+
+void wave6_vpu_set_instance_state(struct vpu_instance *inst, u32 state)
+{
+	trace_set_state(inst, state);
+
+	dprintk(inst->dev->dev, "[%d] %s -> %s\n",
+		inst->id,
+		wave6_vpu_instance_state_name(inst->state),
+		wave6_vpu_instance_state_name(state));
+
+	inst->state = state;
+	if (state == VPU_INST_STATE_PIC_RUN && !inst->performance.ts_first)
+		inst->performance.ts_first = ktime_get_raw();
+}
+
+u64 wave6_vpu_cycle_to_ns(struct vpu_device *vpu_dev, u64 cycle)
+{
+	if (!vpu_dev || !vpu_dev->clk_vpu || !clk_get_rate(vpu_dev->clk_vpu))
+		return 0;
+
+	return (cycle * NSEC_PER_SEC) / clk_get_rate(vpu_dev->clk_vpu);
+}
+
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&inst->dev->irq_done,
+					  msecs_to_jiffies(timeout));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	reinit_completion(&inst->dev->irq_done);
+
+	return 0;
+}
+
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub)
+{
+	struct vpu_instance *inst = wave6_to_vpu_inst(fh);
+	bool is_decoder = (inst->type == VPU_INST_TYPE_DEC) ? true : false;
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
+u32 wave6_vpu_get_used_fb_num(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+	u32 num = 0;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+		if (vpu_buf->used)
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
+	if (inst->type == VPU_INST_TYPE_DEC && inst->state == VPU_INST_STATE_OPEN)
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
+	struct vpu_device *dev = container_of(dwork, struct vpu_device, task_timer);
+	struct vpu_instance *inst = v4l2_m2m_get_curr_priv(dev->m2m_dev);
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
+	int ret;
+
+	dev_dbg(inst->dev->dev, "[%d]%s: state %d\n",
+		inst->id, __func__, inst->state);
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
+void wave6_vpu_handle_performance(struct vpu_instance *inst, struct vpu_buffer *vpu_buf)
+{
+	s64 latency, time_spent;
+
+	if (!inst || !vpu_buf)
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
+	if (!inst)
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
+		dprintk(inst->dev->dev,
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
+int wave6_vpu_init_m2m_dev(struct vpu_device *dev)
+{
+	dev->m2m_dev = v4l2_m2m_init(&wave6_vpu_m2m_ops);
+	if (IS_ERR(dev->m2m_dev)) {
+		dev_err(dev->dev, "v4l2_m2m_init fail: %ld\n", PTR_ERR(dev->m2m_dev));
+		return PTR_ERR(dev->m2m_dev);
+	}
+
+	INIT_DELAYED_WORK(&dev->task_timer, wave6_vpu_device_run_timeout);
+
+	return 0;
+}
+
+void wave6_vpu_release_m2m_dev(struct vpu_device *dev)
+{
+	v4l2_m2m_release(dev->m2m_dev);
+}
-- 
2.31.1


