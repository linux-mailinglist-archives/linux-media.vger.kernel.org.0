Return-Path: <linux-media+bounces-14741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C192B358
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 11:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B53A1F23464
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81B11552E4;
	Tue,  9 Jul 2024 09:12:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2119.outbound.protection.partner.outlook.cn [139.219.146.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB2D153820;
	Tue,  9 Jul 2024 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720516351; cv=fail; b=f82a8e0dZ5nZRnkVtIwp9NH2BhSqibk0KtAZ9Qr6bOItCPjuDJTkEcAtmsIaSM6vOwiWOFWrjAdZRCbBPxZ6EDX9R7XIy6I7VnhC5nqqg1zse15H6Swkz/HyjxsWk4tpujqdBvTEKh8UOQpOqYowaaW/AksxbitW+7iX9BwkfIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720516351; c=relaxed/simple;
	bh=vuW0MghvQk8lyOzG380nCj7MP1pcGYfW4BjZqCcwbn4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pkD9oIho5QCmk1Lx3i12bazoLKNh17mikbfaHyp9XlLdsajJEoer79A3JDSG6rvRsr+ub13LrFzfrhILfcgPfW8F5MTqKoHSg91EdVCT6cYLGtIlKDgG+rX7fC45g5FIYv7EmFB4DgpLJWAC/F2oEzF9+9dK1P1YY+IANcSBxrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpwoQdwA6+RxoFb4TgOPQK2Su0Jz+aT1QlWXcuYh3xnmPQRWeYY2gSq3x7bqUTKOBfhE3yX3y8reUkQdgY5uqtm+FBAJChh0ZSlQ63otFHbzbsKhhcYfOR9NGpJ6AydQxkElOYh7k54nzg+nL41cIW+TC+XKMDN2XPMyGmgBH9XzA6pIcKW52+Ipl/lrNTHLSUiXiL4qzGNqZ3OtyA3ai07RF/2za3mb2GoEyhURK5fqU2gKCXyvUOTUK0vAv58+tDtn0V1zqAPsSizC8bMp84I4pU9Xa3eguhZQhUD0/8NH70NYRYfsFxLksVOaIIWhVMcehcUyOMzqohko47WDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmntXUNq1t/9ERF2Yi3c7CL3wjvxFpC22TLPemHaeqE=;
 b=PhSY8QIkUlCsXOtLS4Esx4IXpnergObxvL6QcOGJWcEeorR7zPS+lnEW7zQ4SA75a/ie8XyCjGKDl+/tDQaIjwBjCaLW5nzOaIuefn89RCRnju9bZ5yXkz0clLVq/jOVeAtr2yVq3zc/1gr9NmyN7c48ell4xOL2gNocVKl9U/FlHeKujjqmf6JkeVfQNAAOZMxuOAgtj5oSb4f4pNHPWbpnop3+ejX0Kaf+1uwG8ydT7IPbeuLyWr/4bpNVp/HVh9iXWuN/AWScGGVjvCCPMzVu50l+Cw3CcHIHKMvnrtRDd3FKpNbWGhnmP2eY5jns5PUprUcgKJsnPyZTK7hvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:33 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:33 +0000
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
Subject: [PATCH v5 01/14] media: starfive: Add JH7110 ISP module definitions
Date: Tue,  9 Jul 2024 01:38:11 -0700
Message-Id: <20240709083824.430473-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-Office365-Filtering-Correlation-Id: 87ae9ad8-c412-4a25-7b77-08dc9ff2845e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	nt5A2ptF5d6HFp3NlkDJJyw27LI+8TtRlrjNCIGxCj50cewCSuVBselpyI58Ceut+8oCBuFJvHuC1cDTypV3CYN7iooAueD6bVpxSDgrnKqfnKhPWIQCinWb5snSk/6kB4MHEkjt+JGMPLw1nGuCYgTB/qRAJGMXqQ8Oi1035L0aVqzI7coroLOkRBJjipkLKsBZBgUXHBxDmAuKH5vnOLSq7va35u66eLNjYCaEWKF1FbQhRRH+nKcrSCYhDILGXROv6eYlgaUxBaQW/W7hCTupSca1CvWgIHUvB+bkitKsNM97qd1CiTXthKauZUatoEVWG4BcUja99oNFq2gW6sY4PlRTFtXkZa7S2eLMd+QQ1ZmsV2VhfdZgO/MUAWz+xlhjo1gAPoJhN1IA816B5yiohp7LXKcFcSMtefmDDMW9IStLTpnJiKvbAiaHjIg/duLBtFJRP6qAhbEXmm2CkPb4frHT+g0gFODIzEM0f1IRdi4V3X2cSow7KkkU1s5pagsrY7D6tVB/xKhs1BT9PyO4M/MphiGaWj558TVzRWaxx9caHLfRz5YIyGCiacJNBxxjiWeBdUC2eoOqz/1YIeVK0tqVwRS0IwEu6oe6Q3zoTWqRzVhSPqjJcotFrhhu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEhSNDhkeGppQlJQZXVZcGhOS1VYMWFUTjdlRjF6MXhmUmc0cW00aEpncmJM?=
 =?utf-8?B?aDlDYmtwUEQwTXprL01nS3BuKzM3NEVhRkkwZUhmRG1Ua3RzczFXTTRHN1Bw?=
 =?utf-8?B?R2ZmRm1xbEprUzBYTHpaWXVxcTBVbVB2TkJPK1hHblhtZ1FIaVIyQUV1bGUv?=
 =?utf-8?B?NzdPMERaZWtmcnFKdmpubmZzdEJ5ZlYxYWlxQktpSkFreG1uZjRMeUVlM3lN?=
 =?utf-8?B?Vis2L3VBT0NzN0VaU1lFUUF2UEVFcEpRcDRPSUpZL3JuM3NuUUlvV0NzL2NP?=
 =?utf-8?B?OTJVN2JKdytTR0doQ3FUa3U3OW1KSmFBQUNnS3NRQXBYY0R1OWdZekVxdGY4?=
 =?utf-8?B?VW1HUU8rSTV4V05TT2VqeUtLK1dBYWcwMjlZa1BnOW16SjNhRHg0VVhzNnRH?=
 =?utf-8?B?RVh3RU1sblZyWHJYbGU3VkZkLzBoVVdQZ1dKMUxFb2tDYmtua3N4N0ZVNE1B?=
 =?utf-8?B?ajdOSGFldjJZUzM5ZVQxZUEzVUhPcUx0cDA4RnIraDVuRklXTDlKSmJqNFZB?=
 =?utf-8?B?bU40VVhMMWRtb2FpZG5zaE4zVExNTklTNFB5NGNCWklZUlpwN1BmVWNMbG90?=
 =?utf-8?B?QkU1M0NXZENEZ2hMVWVsbVRiZFBjMGdwWU1iTXVISldNa3FORmpCL1dhck51?=
 =?utf-8?B?MjFIeFpTbDMxNXpTNVRNMG8xdGdKZnloM0RhUlV6SXVXYXFUeWZXK29TSkVI?=
 =?utf-8?B?NGdXRE1UcXJsQ1diRm52YndJSmVBbmRvMlBqYkI0WU9HT2VQdVF6SkNkbm41?=
 =?utf-8?B?c3VvU2tUUkpHZFJQZEthR0hWRXhaYWpGYkw4QXJvMVVBTVUxanEzQVVMVWl0?=
 =?utf-8?B?bUpOamlHalZkNnB1SmNtUWFXN0lQK0hhR0lBNzVpaHpFYXNwZ3RQRFpJM0Fp?=
 =?utf-8?B?Z1M3a0VpdWNYNFpndmdkU2JlWlY1SEJWc1ZRc2lnK0t2dFVJNlFGRXlMZ3d2?=
 =?utf-8?B?b0ZvUzdPRFAwaWJENXU3bWtkRGsxeHYySmhiNlRCTEFjbHNOZ1FmVGdNL0dE?=
 =?utf-8?B?ZmRXUW54V0JzWTlYSXdNQ3c5NnRTWFZybHZZZjROYkJOQzQyMVZkTlhLWTUr?=
 =?utf-8?B?d2g5ZlVjSjh6YmZGZ1IySnVkalc5T1hLRUhUdFE0WjhxTGtGQ0dMcnFMNVk4?=
 =?utf-8?B?ditZdkpHdlZFR0RxeC9WSFZtbWx1QTBGY2NWUzlabXB5U1luVXFoL2o3ZTdK?=
 =?utf-8?B?Zjhzd1VUYkZWS25scVNXVWFpcG15a0lGSzdlaUxMd1E1TjVNZTJHL1l5aC9a?=
 =?utf-8?B?RFJPcktyd2tpTEhiaEo4WmVTY2hLWGZwblNoR0IyL0tDRlN3UTh1Z0lvLy94?=
 =?utf-8?B?WWU1dm81eVBNMmpocGE5cDFlcTFUVkdGRzVZdUF5ZXM5Rnl2V0o2YTJEb3lL?=
 =?utf-8?B?emphVG55RWxIWklsQ2g2eEhFbnBxeEpINmRYNzZCSzB0ZlUvNld6aEY1eHhJ?=
 =?utf-8?B?NUJuaXZYNktrb1hoRE1hZE9vZTRNMnNPSVhiclJ3eFNIanVrTXFLaEw4UWpl?=
 =?utf-8?B?d0ZuQnNhSDZwUGRweTcyNnViQjdYcDk0YTdaOUZaNnJoSWREdzZlSmF5VHhS?=
 =?utf-8?B?OUFtbGF3ZDhhSmwzaHErV1IvRmhZT0NsRXhXVUtpV1JFeXBOWWZqTmtSay9t?=
 =?utf-8?B?UUVPWVBHT3hrazdMbUgxcGR4Z0FENVlKUzZldm9zTy96dXozS1lmUExlTjNX?=
 =?utf-8?B?R0FuZlEzR1plNWtxeHlZVHYxYWlrUEQ4UFQwQUdCMlEreTRCN1dQbGJaU092?=
 =?utf-8?B?SUNSR2x5aEl1cjNwektlTVhySSsxaFJpL1dhSWt3R051QWhVWWpmQ2NWNk45?=
 =?utf-8?B?aEljVkJEclBVdlhjdStKb0JXOThoU2lyZllTMzlEN2hwUDY2clNqMlI4M1JF?=
 =?utf-8?B?UTQvMmRvRkJjYTlwcXdCaHB6VFQvcW1tWEpqSWtzN29PT1MzT2pvRk5FOGdK?=
 =?utf-8?B?YzNTQmtwdHpQOWgwbk1VOHA4Y3dMR1ZFZXVVa01HS3Jkb1BGY3c2OGpJa3hr?=
 =?utf-8?B?SVZBbXNCNWN3amExV1BqKzN5d0FvSHZtTXMxb3JsY1Q4a3ZZeENHL3owbmxI?=
 =?utf-8?B?djNwTHc3RVNJc0lwaTdLZkNWeGZBTGFsazFVeEpsc2o5Zk5FTUNQZzhpai9z?=
 =?utf-8?B?WmJFckNNTmtzY0dsdU1Ma1JsNjVJakRyYVlGWDQ4Z0prSzJ0MUY0STcwSlV1?=
 =?utf-8?Q?e4ZAycsawjhO5Ux5iG26Z/4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ae9ad8-c412-4a25-7b77-08dc9ff2845e
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:33.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4wlKUbbHBKtRyD8fFa2MXcjekYr9IAE1i87vmCp1exO+Ln/BYz+leZ7jYBZbnQeGFYmv0C0ZVTrucjWMvpTzfxT2iV+k0J7ZQn/0ecy3NDUU5lbNbo2GfIdNvuTQItR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add JH7110 ISP module definitions for user space.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Signed-off-by: Zejian Su <zejian.su@starfivetech.com>
---
 MAINTAINERS                     |   1 +
 include/uapi/linux/jh7110-isp.h | 739 ++++++++++++++++++++++++++++++++
 2 files changed, 740 insertions(+)
 create mode 100644 include/uapi/linux/jh7110-isp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 507f04a80499..890604eb0d64 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21305,6 +21305,7 @@ S:	Maintained
 F:	Documentation/admin-guide/media/starfive_camss.rst
 F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 F:	drivers/staging/media/starfive/camss
+F:	include/uapi/linux/jh7110-isp.h
 
 STARFIVE CRYPTO DRIVER
 M:	Jia Jie Ho <jiajie.ho@starfivetech.com>
diff --git a/include/uapi/linux/jh7110-isp.h b/include/uapi/linux/jh7110-isp.h
new file mode 100644
index 000000000000..4939cd63e771
--- /dev/null
+++ b/include/uapi/linux/jh7110-isp.h
@@ -0,0 +1,739 @@
+/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * jh7110-isp.h
+ *
+ * JH7110 ISP driver - user space header file.
+ *
+ * Copyright © 2023 StarFive Technology Co., Ltd.
+ *
+ * Author: Zejian Su <zejian.su@starfivetech.com>
+ *
+ */
+
+#ifndef __JH7110_ISP_H_
+#define __JH7110_ISP_H_
+
+/**
+ * ISP Module Diagram
+ * ------------------
+ *
+ *  Raw  +-----+    +------+    +------+    +----+
+ *  ---->| OBC |--->| OECF |--->| LCCF |--->| WB |-----+
+ *       +-----+    +------+    +------+    +----+     |
+ *                                                     |
+ *  +--------------------------------------------------+
+ *  |
+ *  |    +-----+    +-----+    +-----+    +-----+
+ *  +--->| DBC |--->| CTC |--->| CFA |--->| CAR |------+
+ *       +-----+    +-----+    +-----+    +-----+      |
+ *                                                     |
+ *  +--------------------------------------------------+
+ *  |
+ *  |    +-----+    +--------+    +-----+    +------+
+ *  +--->| CCM |--->| GMARGB |--->| R2Y |--->| YCRV |--+
+ *       +-----+    +--------+    +-----+    +------+  |
+ *                                                     |
+ *  +--------------------------------------------------+
+ *  |
+ *  |    +-------+    +-------+    +-----+    +----+
+ *  +--->| SHARP |--->| DNYUV |--->| SAT |--->| SC |
+ *       +-------+    +-------+    +-----+    +----+
+ *
+ */
+
+/* Auto White Balance */
+#define JH7110_ISP_MODULE_WB_SETTING			(1U << 0)
+/* Color Artifact Removal */
+#define JH7110_ISP_MODULE_CAR_SETTING			(1U << 1)
+/* Color Correction Matrix */
+#define JH7110_ISP_MODULE_CCM_SETTING			(1U << 2)
+/* Color Filter Arrays */
+#define JH7110_ISP_MODULE_CFA_SETTING			(1U << 3)
+/* Crosstalk Correction */
+#define JH7110_ISP_MODULE_CTC_SETTING			(1U << 4)
+/* Defect Bad Pixel Correction */
+#define JH7110_ISP_MODULE_DBC_SETTING			(1U << 5)
+/* Denoise YUV */
+#define JH7110_ISP_MODULE_DNYUV_SETTING			(1U << 6)
+/* RGB Gamma */
+#define JH7110_ISP_MODULE_GMARGB_SETTING		(1U << 7)
+/* Lens Correction Cosine Fourth */
+#define JH7110_ISP_MODULE_LCCF_SETTING			(1U << 8)
+/* Optical Black Correction */
+#define JH7110_ISP_MODULE_OBC_SETTING			(1U << 9)
+/* Opto-Electric Conversion Function */
+#define JH7110_ISP_MODULE_OECF_SETTING			(1U << 10)
+/* RGB To YUV */
+#define JH7110_ISP_MODULE_R2Y_SETTING			(1U << 11)
+/* Saturation */
+#define JH7110_ISP_MODULE_SAT_SETTING			(1U << 12)
+/* Sharpen */
+#define JH7110_ISP_MODULE_SHARP_SETTING			(1U << 13)
+/* Y Curve */
+#define JH7110_ISP_MODULE_YCRV_SETTING			(1U << 14)
+/* Statistics Collection */
+#define JH7110_ISP_MODULE_SC_SETTING			(1U << 15)
+
+/**
+ * struct jh7110_isp_wb_gain - auto white balance gain
+ *
+ * @gain_r: gain value for red component.
+ * @gain_g: gain value for green component.
+ * @gain_b: gain value for blue component.
+ */
+struct jh7110_isp_wb_gain {
+	__u16 gain_r;
+	__u16 gain_g;
+	__u16 gain_b;
+};
+
+/**
+ * struct jh7110_isp_wb_setting - Configuration used by auto white balance gain
+ *
+ * @enabled: enabled setting flag.
+ * @gains: auto white balance gain setting.
+ */
+struct jh7110_isp_wb_setting {
+	__u32 enabled;
+	struct jh7110_isp_wb_gain gains;
+};
+
+/**
+ * struct jh7110_isp_car_setting - Configuration used by color artifact removal
+ *
+ * @enabled: enabled setting flag.
+ */
+struct jh7110_isp_car_setting {
+	__u32 enabled;
+};
+
+/**
+ * struct jh7110_isp_ccm_smlow - Color correction matrix
+ *
+ * @ccm: color transform matrix with size 3 by 3.
+ * @offsets: the offsets of R, G, B after the transform by the ccm.
+ */
+struct jh7110_isp_ccm_smlow {
+	__s32 ccm[3][3];
+	__s32 offsets[3];
+};
+
+/**
+ * struct jh7110_isp_ccm_setting - Configuration used by color correction matrix
+ *
+ * @enabled: enabled setting flag.
+ * @ccm_smlow: Color correction matrix.
+ */
+struct jh7110_isp_ccm_setting {
+	__u32 enabled;
+	struct jh7110_isp_ccm_smlow ccm_smlow;
+};
+
+/**
+ * struct jh7110_isp_cfa_params - demosaic parameters
+ *
+ * @hv_width: detail smooth factor
+ * @cross_cov: Cross covariance weighting.
+ */
+struct jh7110_isp_cfa_params {
+	__s32 hv_width;
+	__s32 cross_cov;
+};
+
+/**
+ * struct jh7110_isp_cfa_params - Configuration used by demosaic module
+ *
+ * @enabled: enabled setting flag.
+ * @settings: demosaic parameters.
+ */
+struct jh7110_isp_cfa_setting {
+	__u32 enabled;
+	struct jh7110_isp_cfa_params settings;
+};
+
+/**
+ * struct jh7110_isp_ctc_params - crosstalk remove parameters
+ *
+ * @saf_mode: smooth area filter mode.
+ * @daf_mode: detail area filter mode.
+ * @max_gt: the threshold for imbalance detection when pixel intensity is close to maximum.
+ * @min_gt: the threshold for imbalance detection when pixel intensity is close to 0.
+ */
+struct jh7110_isp_ctc_params {
+	__u8 saf_mode;
+	__u8 daf_mode;
+	__s32 max_gt;
+	__s32 min_gt;
+};
+
+/**
+ * struct jh7110_isp_ctc_params - Configuration used by crosstalk remove
+ *
+ * @enabled: enabled setting flag.
+ * @settings: corsstalk remove parameters.
+ */
+struct jh7110_isp_ctc_setting {
+	__u32 enabled;
+	struct jh7110_isp_ctc_params settings;
+};
+
+/**
+ * struct jh7110_isp_dbc_params - defect pixels correction parameters
+ *
+ * @bad_gt: bad pixel threshold for the green channel.
+ * @bad_xt: bad pixel threshold for the red and blue channels.
+ */
+struct jh7110_isp_dbc_params {
+	__s32 bad_gt;
+	__s32 bad_xt;
+};
+
+/**
+ * struct jh7110_isp_dbc_params - Configuration used by defect bad pixels correction
+ *
+ * @enabled: enabled setting flag.
+ * @settings: defect pixels correction parameters.
+ */
+struct jh7110_isp_dbc_setting {
+	__u32 enabled;
+	struct jh7110_isp_dbc_params settings;
+};
+
+/**
+ * struct jh7110_isp_dnyuv_params - yuv domain denoise parameters
+ *
+ * @y_sweight: ten coefficients of 7x7 spatial filter for Y channel.
+ * @y_curve: intensity difference (similarity) weight lookup table for Y channel.
+ * @uv_sweight: ten coefficients of 7x7 spatial filter for U and V channel.
+ * @uv_curve: intensity difference (similarity) weight lookup table for U and V channel.
+ */
+struct jh7110_isp_dnyuv_params {
+	__u8 y_sweight[10];
+	__u16 y_curve[7];
+	__u8 uv_sweight[10];
+	__u16 uv_curve[7];
+};
+
+/**
+ * struct jh7110_isp_dnyuv_params - Configuration used by yuv domain denoise
+ *
+ * @enabled: enabled setting flag.
+ * @settings: yuv domain denoise parameters.
+ */
+struct jh7110_isp_dnyuv_setting {
+	__u32 enabled;
+	struct jh7110_isp_dnyuv_params settings;
+};
+
+/**
+ * struct jh7110_isp_gmargb_point - RGB Gamma point
+ *
+ * @g_val: RGB gamma value.
+ * @sg_val: RGB gamma slope value.
+ */
+struct jh7110_isp_gmargb_point {
+	__u16 g_val;
+	__u16 sg_val;
+};
+
+/**
+ * struct jh7110_isp_gmargb_setting - Configuration used by RGB gamma
+ *
+ * @enabled: enabled setting flag.
+ * @curve: RGB Gamma point table.
+ */
+struct jh7110_isp_gmargb_setting {
+	__u32 enabled;
+	struct jh7110_isp_gmargb_point curve[15];
+};
+
+/**
+ * struct jh7110_isp_lccf_circle - len circle
+ *
+ * @center_x: center X distance from capture window.
+ * @center_y: center Y distance from capture window.
+ * @radius: len circle radius.
+ */
+struct jh7110_isp_lccf_circle {
+	__s16 center_x;
+	__s16 center_y;
+	__u8 radius;
+};
+
+/**
+ * struct jh7110_isp_lccf_curve_param - lens correction cosine fourth curve param
+ *
+ * @f1: F1 parameter.
+ * @f2: F2 parameter.
+ */
+struct jh7110_isp_lccf_curve_param {
+	__s16 f1;
+	__s16 f2;
+};
+
+/**
+ * struct jh7110_isp_lccf_setting - Configuration used by lens correction cosine fourth
+ *
+ * @enabled: enabled setting flag.
+ * @circle: len circle.
+ * @r_param: lens correction cosine fourth curve param for Bayer pattern R.
+ * @gr_param: lens correction cosine fourth curve param for Bayer pattern Gr.
+ * @gb_param: lens correction cosine fourth curve param for Bayer pattern Gb.
+ * @b_param: lens correction cosine fourth curve param for Bayer pattern B.
+ */
+struct jh7110_isp_lccf_setting {
+	__u32 enabled;
+	struct jh7110_isp_lccf_circle circle;
+	struct jh7110_isp_lccf_curve_param r_param;
+	struct jh7110_isp_lccf_curve_param gr_param;
+	struct jh7110_isp_lccf_curve_param gb_param;
+	struct jh7110_isp_lccf_curve_param b_param;
+};
+
+/**
+ * struct jh7110_isp_obc_win_size - optical black correction window size
+ *
+ * @width: window width.
+ * @height: window height.
+ */
+struct jh7110_isp_obc_win_size {
+	__u32 width;
+	__u32 height;
+};
+
+/**
+ * struct jh7110_isp_obc_gain - optical black correction symbol gain
+ *
+ * @tl_gain: gain at point A for symbol.
+ * @tr_gain: gain at point B for symbol.
+ * @bl_gain: gain at point C for symbol.
+ * @br_gain: gain at point D for symbol.
+ */
+struct jh7110_isp_obc_gain {
+	__u8 tl_gain;
+	__u8 tr_gain;
+	__u8 bl_gain;
+	__u8 br_gain;
+};
+
+/**
+ * struct jh7110_isp_obc_offset - optical black correction symbol offset
+ *
+ * @tl_offset: offset at point A for symbol.
+ * @tr_offset: offset at point B for symbol.
+ * @bl_offset: offset at point C for symbol.
+ * @br_offset: offset at point D for symbol.
+ */
+struct jh7110_isp_obc_offset {
+	__u8 tl_offset;
+	__u8 tr_offset;
+	__u8 bl_offset;
+	__u8 br_offset;
+};
+
+/**
+ * struct jh7110_isp_obc_setting - Configuration used by optical black correction
+ *
+ * @enabled: enabled setting flag.
+ * @win_size: optical black correction window size.
+ * @gain: optical black correction symbol gain.
+ * @offset: optical black correction symbol offset.
+ */
+struct jh7110_isp_obc_setting {
+	__u32 enabled;
+	struct jh7110_isp_obc_win_size win_size;
+	struct jh7110_isp_obc_gain gain[4];
+	struct jh7110_isp_obc_offset offset[4];
+};
+
+/**
+ * struct jh7110_isp_oecf_point - oecf curve
+ *
+ * @x: x coordinate.
+ * @y: y coordinate.
+ * @slope: the slope between this point and the next point.
+ */
+struct jh7110_isp_oecf_point {
+	__u16 x;
+	__u16 y;
+	__s16 slope;
+};
+
+/**
+ * struct jh7110_isp_oecf_setting - Configuration used by opto-electric conversion function
+ *
+ * @enabled: enabled setting flag.
+ * @r_curve: red pixel oecf curve.
+ * @gr_curve: green pixel oecf curve in GR line.
+ * @gb_curve: green pixel oecf curve in GB line.
+ * @b_curve: blue pixel oecf curve.
+ */
+struct jh7110_isp_oecf_setting {
+	__u32 enabled;
+	struct jh7110_isp_oecf_point r_curve[16];
+	struct jh7110_isp_oecf_point gr_curve[16];
+	struct jh7110_isp_oecf_point gb_curve[16];
+	struct jh7110_isp_oecf_point b_curve[16];
+};
+
+/**
+ * struct jh7110_isp_r2y_matrix - RGB to YUV color conversion matrix
+ *
+ * @m: The 3x3 color conversion matrix coefficient.
+ */
+struct jh7110_isp_r2y_matrix {
+	__s16 m[9];
+};
+
+/**
+ * struct jh7110_isp_r2y_setting - Configuration used by RGB To YUV
+ *
+ * @enabled: enabled setting flag.
+ * @matrix: RGB to YUV color conversion matrix.
+ */
+struct jh7110_isp_r2y_setting {
+	__u32 enabled;
+	struct jh7110_isp_r2y_matrix matrix;
+};
+
+/**
+ * struct jh7110_isp_sat_curve - Saturation curve
+ *
+ * @yi_min: the minimum input Y value.
+ * @yo_ir: the ratio of Y output range to input range.
+ * @yo_min: the minimum output Y value.
+ * @yo_max: the maximum output Y value.
+ */
+struct jh7110_isp_sat_curve {
+	__s16 yi_min;
+	__s16 yo_ir;
+	__s16 yo_min;
+	__s16 yo_max;
+};
+
+/**
+ * struct jh7110_isp_sat_hue_info - Chroma Saturation Hue Factor
+ *
+ * @cos: COS hue factor.
+ * @sin: SIN hue factor.
+ */
+struct jh7110_isp_sat_hue_info {
+	__s16 cos;
+	__s16 sin;
+};
+
+/**
+ * struct jh7110_isp_sat_info - Saturation information
+ *
+ * @gain_cmab: Chroma saturation magnitude amplification base for gain.
+ * @gain_cmmd: Chroma saturation magnitude amplification delta for gain.
+ * @threshold_cmb: Chroma saturation magnitude base threshold.
+ * @threshold_cmd: Chroma saturation magnitude delta threshold.
+ * @offset_u: Chroma saturation U offset.
+ * @offset_v: Chroma saturation V offset.
+ * @cmsf: Chroma saturation magnitude scaling factor.
+ */
+struct jh7110_isp_sat_info {
+	__s16 gain_cmab;
+	__s16 gain_cmmd;
+	__s16 threshold_cmb;
+	__s16 threshold_cmd;
+	__s16 offset_u;
+	__s16 offset_v;
+	__s16 cmsf;
+};
+
+/**
+ * struct jh7110_isp_sat_setting - Configuration used by Saturation
+ *
+ * @enabled: enabled setting flag.
+ * @curve: Saturation curve.
+ * @hue_info: Chroma Saturation Hue Factor.
+ * @sat_info: Saturation information.s
+ */
+struct jh7110_isp_sat_setting {
+	__u32 enabled;
+	struct jh7110_isp_sat_curve curve;
+	struct jh7110_isp_sat_hue_info hue_info;
+	struct jh7110_isp_sat_info sat_info;
+};
+
+/**
+ * struct jh7110_isp_sharp_weight - Sharpe weight
+ *
+ * @weight: Sharpen filter weight.
+ * @recip_wei_sum: Sharpen amplification filter weight normalization factor.
+ */
+struct jh7110_isp_sharp_weight {
+	__u8 weight[15];
+	__u32 recip_wei_sum;
+};
+
+/**
+ * struct jh7110_isp_sharp_strength - Sharpen strength
+ *
+ * @diff: Sharpen Edge amplification delta level.
+ * @f: Sharpen Edge amplification factor.
+ * @s: Sharpen Edge amplification factor slope.
+ */
+struct jh7110_isp_sharp_strength {
+	__s16 diff[4];
+	__s16 f[3];
+	__s32 s[3];
+};
+
+/**
+ * struct jh7110_isp_sharp_setting - Configuration used by Sharpen
+ *
+ * @enabled: enabled setting flag.
+ * @weight: Sharpe weight.
+ * @strength: Sharpen strength.
+ * @pdirf: Positive Factor Multiplier.
+ * @ndirf: Negative Factor Multiplier.
+ */
+struct jh7110_isp_sharp_setting {
+	__u32 enabled;
+	struct jh7110_isp_sharp_weight weight;
+	struct jh7110_isp_sharp_strength strength;
+	__s8 pdirf;
+	__s8 ndirf;
+};
+
+/**
+ * struct jh7110_isp_ycrv_curve - Y Curve parameters table
+ *
+ * @y: Y curve L parameters value.
+ */
+struct jh7110_isp_ycrv_curve {
+	__s16 y[64];
+};
+
+/**
+ * struct jh7110_isp_ycrv_setting - Configuration used by Y Curve
+ *
+ * @enabled: enabled setting flag.
+ * @curve: Y Curve parameters table.
+ */
+struct jh7110_isp_ycrv_setting {
+	__u32 enabled;
+	struct jh7110_isp_ycrv_curve curve;
+};
+
+/**
+ * struct jh7110_isp_sc_config - statistics collection crop configure
+ *
+ * @h_start: Horizontal starting point for frame cropping.
+ * @v_start: Vertical starting point for frame cropping.
+ * @sw_width: Width of statistics collection sub-window.
+ * @sw_height: Height of statistics collection sub-window.
+ * @hperiod: Horizontal period.
+ * @hkeep: Horizontal keep.
+ * @vperiod: Vertical period.
+ * @vkeep: Vertical keep.
+ */
+struct jh7110_isp_sc_config {
+	__u16 h_start;
+	__u16 v_start;
+	__u8 sw_width;
+	__u8 sw_height;
+	__u8 hperiod;
+	__u8 hkeep;
+	__u8 vperiod;
+	__u8 vkeep;
+};
+
+/**
+ * struct jh7110_isp_sc_af_config - statistics collection auto focus configure
+ *
+ * @es_hor_mode: Horizontal mode.
+ * @es_sum_mode: sum mode.
+ * @hor_en: Horizontal enable.
+ * @ver_en: Vertical enable.
+ * @es_ver_thr: Vertical threshold.
+ * @es_hor_thr: Horizontal threshold.
+ */
+struct jh7110_isp_sc_af_config {
+	__u8 es_hor_mode;
+	__u8 es_sum_mode;
+	__u8 hor_en;
+	__u8 ver_en;
+	__u8 es_ver_thr;
+	__u16 es_hor_thr;
+};
+
+/**
+ * struct jh7110_isp_sc_awb_ps - statistics collection auto white balance pixel sum
+ *
+ * @awb_ps_rl: Lower boundary of R value for pixel sum.
+ * @awb_ps_ru: Upper boundary of R value for pixel sum.
+ * @awb_ps_gl: Lower boundary of G value for pixel sum.
+ * @awb_ps_gu: Upper boundary of G value for pixel sum.
+ * @awb_ps_bl: Lower boundary of B value for pixel sum.
+ * @awb_ps_bu: Upper boundary of B value for pixel sum.
+ * @awb_ps_yl: Lower boundary of Y value for pixel sum.
+ * @awb_ps_yu: Upper boundary of Y value for pixel sum.
+ * @awb_ps_grl: Lower boundary of G/R ratio for pixel sum.
+ * @awb_ps_gru: Upper boundary of G/R ratio for pixel sum.
+ * @awb_ps_gbl: Lower boundary of G/B ratio for pixel sum.
+ * @awb_ps_gbu: Upper boundary of G/B ratio for pixel sum.
+ * @awb_ps_grbl: Lower boundary of (Gr/R + b/a * Gb/B) for pixel sum.
+ * @awb_ps_grbu: Upper boundary of (Gr/R + b/a * Gb/B) for pixel sum.
+ */
+struct jh7110_isp_sc_awb_ps {
+	__u8 awb_ps_rl;
+	__u8 awb_ps_ru;
+	__u8 awb_ps_gl;
+	__u8 awb_ps_gu;
+	__u8 awb_ps_bl;
+	__u8 awb_ps_bu;
+	__u8 awb_ps_yl;
+	__u8 awb_ps_yu;
+	__u16 awb_ps_grl;
+	__u16 awb_ps_gru;
+	__u16 awb_ps_gbl;
+	__u16 awb_ps_gbu;
+	__u16 awb_ps_grbl;
+	__u16 awb_ps_grbu;
+};
+
+/**
+ * struct jh7110_isp_sc_awb_ws - statistics collection auto white balance weight sum
+ *
+ * @awb_ws_rl: Lower boundary of R value for weight sum.
+ * @awb_ws_ru: Upper boundary of R value for weight sum.
+ * @awb_ws_grl: Lower boundary of Gr value for weight sum.
+ * @awb_ws_gru: Upper boundary of Gr value for weight sum.
+ * @awb_ws_gbl: Lower boundary of Gb value for weight sum.
+ * @awb_ws_gbu: Upper boundary of Gb value for weight sum.
+ * @awb_ws_bl: Lower boundary of B value for weight sum.
+ * @awb_ws_bu: Upper boundary of B value for weight sum.
+ */
+struct jh7110_isp_sc_awb_ws {
+	__u8 awb_ws_rl;
+	__u8 awb_ws_ru;
+	__u8 awb_ws_grl;
+	__u8 awb_ws_gru;
+	__u8 awb_ws_gbl;
+	__u8 awb_ws_gbu;
+	__u8 awb_ws_bl;
+	__u8 awb_ws_bu;
+};
+
+/**
+ * struct jh7110_isp_sc_awb_point - statistics collection auto white balance point
+ *
+ * @weight: Weighting value at point.
+ */
+struct jh7110_isp_sc_awb_point {
+	__u8 weight;
+};
+
+/**
+ * struct jh7110_isp_sc_awb_config - statistics collection auto white balance configure
+ *
+ * @ps_config: statistics collection auto white balance pixel sum.
+ * @awb_ps_grb_ba: auto white balance b/a value.
+ * @sel: input mux for statistics collection auto white balance.
+ * @ws_config: statistics collection auto white balance weight sum.
+ * @awb_cw: Weighting value at 13x13 point.
+ * @pts: statistics collection auto white balance point.
+ */
+struct jh7110_isp_sc_awb_config {
+	struct jh7110_isp_sc_awb_ps ps_config;
+	__u8 awb_ps_grb_ba;
+	__u8 sel;
+	struct jh7110_isp_sc_awb_ws ws_config;
+	__u8 awb_cw[169];
+	struct jh7110_isp_sc_awb_point pts[17];
+};
+
+/**
+ * struct jh7110_isp_sc_setting - Configuration used by statistics collection
+ *
+ * @enabled: enabled setting flag.
+ * @crop_config: statistics collection crop configure.
+ * @af_config: statistics collection auto focus configure.
+ * @awb_config: statistics collection auto white balance configure.
+ */
+struct jh7110_isp_sc_setting {
+	__u32 enabled;
+	struct jh7110_isp_sc_config crop_config;
+	struct jh7110_isp_sc_af_config af_config;
+	struct jh7110_isp_sc_awb_config awb_config;
+};
+
+/**
+ * struct jh7110_isp_params_buffer - StarFive JH7110 ISP Parameters Meta Data
+ *
+ * @enable_setting: enabled setting module (JH7110_ISP_MODULE_* definitions).
+ * @wb_setting: Configuration used by auto white balance gain.
+ * @car_setting: Configuration used by color artifact removal.
+ * @ccm_setting: Configuration used by color correction matrix.
+ * @cfa_setting: Configuration used by demosaic module.
+ * @ctc_setting: Configuration used by crosstalk remove.
+ * @dbc_setting: Configuration used by defect bad pixels correction.
+ * @dnyuv_setting: Configuration used by yuv domain denoise.
+ * @gmargb_setting: Configuration used by RGB gamma.
+ * @lccf_setting: Configuration used by lens correction cosine fourth.
+ * @obc_setting: Configuration used by optical black compensation.
+ * @oecf_setting: Configuration used by opto-electric conversion function.
+ * @r2y_setting: Configuration used by RGB To YUV.
+ * @sat_setting: Configuration used by Saturation.
+ * @sharp_setting: Configuration used by Sharpen.
+ * @ycrv_setting: Configuration used by Y Curve.
+ * @sc_setting: Configuration used by statistics collection.
+ */
+struct jh7110_isp_params_buffer {
+	__u32 enable_setting;
+	struct jh7110_isp_wb_setting wb_setting;
+	struct jh7110_isp_car_setting car_setting;
+	struct jh7110_isp_ccm_setting ccm_setting;
+	struct jh7110_isp_cfa_setting cfa_setting;
+	struct jh7110_isp_ctc_setting ctc_setting;
+	struct jh7110_isp_dbc_setting dbc_setting;
+	struct jh7110_isp_dnyuv_setting dnyuv_setting;
+	struct jh7110_isp_gmargb_setting gmargb_setting;
+	struct jh7110_isp_lccf_setting lccf_setting;
+	struct jh7110_isp_obc_setting obc_setting;
+	struct jh7110_isp_oecf_setting oecf_setting;
+	struct jh7110_isp_r2y_setting r2y_setting;
+	struct jh7110_isp_sat_setting sat_setting;
+	struct jh7110_isp_sharp_setting sharp_setting;
+	struct jh7110_isp_ycrv_setting ycrv_setting;
+	struct jh7110_isp_sc_setting sc_setting;
+};
+
+/**
+ * Statistics Collection Meta Data Flag
+ */
+#define JH7110_ISP_SC_FLAG_AWB			0x0
+#define JH7110_ISP_SC_FLAG_AE_AF		0xffff
+
+#pragma pack(1)
+
+/**
+ * struct jh7110_isp_sc_buffer - StarFive JH7110 ISP Statistics Collection Meta Data
+ *
+ * @y_histogram: Y histogram data for saturation control.
+ * @reserv0: reserve byte.
+ * @bright_sc: bright statistic. If flag is JH7110_ISP_SC_FLAG_AE_AF, This field is
+ *             saved auto exposure and auto focus. If flag is JH7110_ISP_SC_FLAG_AWB,
+ *             This field is saved auto white balance.
+ * @reserv1: reserve byte.
+ * @ae_hist_y: Y histogram for auto exposure.
+ * @reserv2: reserve byte.
+ * @flag: Statistics Collection Meta Data Flag (JH7110_ISP_SC_FLAG_* definitions)
+ */
+struct jh7110_isp_sc_buffer {
+	__u32 y_histogram[64];
+	__u32 reserv0[33];
+	__u32 bright_sc[4096];
+	__u32 reserv1[96];
+	__u32 ae_hist_y[128];
+	__u32 reserv2[511];
+	__u16 flag;
+};
+
+#pragma pack()
+
+#endif
-- 
2.25.1


