Return-Path: <linux-media+bounces-30568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89BA94C1F
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675D41892691
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 05:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2EF2571D9;
	Mon, 21 Apr 2025 05:28:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021112.outbound.protection.outlook.com [40.107.51.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51B82AE8B;
	Mon, 21 Apr 2025 05:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213334; cv=fail; b=A6KK5/FDI/aVxwpn78gNCkdRiUNBLKd87m5Bgcntr/x0CpGb7PaGlin6URyPGrGtDwq6kL4zF43ywT7ntKjcRSdnTg/IomDZmX4GdutP9k6g1u5QnxlChPB3yckgmXf+NRtKbIQBwT7Ep/nY19+En83U4YGWulfPEzDeXPuqoq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213334; c=relaxed/simple;
	bh=jZgdo34HOoQnwZrBcfcHTGV2Kh5x6ctQToaMTSIZwJs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eroH7Nd3bYqXQPiVIdoroFz5JqyjvoJEhnYHyLBN9KmXvvKz7XKjHU1RVMcWbmXKYVFek39tTF2WE1Cviy+sRZyHPWj9TBo1DOlYtCMd7NvX9pd3Y+OBBAu9cV1F3zGPT+Y08j/dsjGvoZ3nx2ognQwztitDhs304kh1SM63ipc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pH8IQVMhKOWwrcktjI4IZeB8sbhlCtGo6i50tYpWPEtPwiWB+CKIYnZrHkNk6eteokkXJta6bnD0eCdUZo6xPQfI9QYJdkqn7qNBZEC8Ra2iCPIJeCJwqg3L6N8gPZl5x54yVeceM72lFjJFdOnNiA+9tLe+BVfMv5OuNwepEzf2lU1wk+BUMf1FHxsqc7pditW7WD2Lpm/71Z/aRyB7+PI7AgiW7m5Td7dZxGEysgBHfXJ0tVI6ODX0gkCtQr5Dfyj2OBbWC1Y+SNMN3MmpNPQFBF+rE/KDb+YRNYGOy/L1jeIfvxKjVFiPqK4r5A3EqWtCBmKsDq+ASQrnf0UEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J89aWl/UEghlKen2bC7mBWU4d9xAR7aTrBHo44wLnqM=;
 b=xbVAnfQ4Id5boO7Ayferg3ydy5KIKu79zPqx8F2K6lDQywRJyXPSqNlo7+coaM4b7Gue3XRsXPWg42VWYiBwZAHAlF4v+NHwkgxGtX5mrXqLregMX4g7FJ8u+oRw8dIZXFDXpalnvFv8Uu9Z8yht2q1/Kf6SDgxXeO3/LMq0jU56pabo3IiIdYmlxtaCBIZWgIFedWitx4k4C8C50sKlNxHOLg87Kpl+TdwchU0dxtH9SnA7KbK+7zm2rBAJm5SmJxMrrGnX/5BqGCBsggTy/OUVN+OghGGGNGwTwQkCeJRdNmWCFT/ZYjUhjWspuw9Sk5XS72nx5ephwUd3+/Cxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB1028.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 05:28:47 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 05:28:47 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: andy@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] media: atomisp: Remove compat ioctl32 header file
Date: Mon, 21 Apr 2025 10:57:58 +0530
Message-Id: <20250421052804.11721-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::8) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN2P287MB1028:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe9cea1-6feb-4e81-206d-08dd80956408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FoVnyXI4M3z8fIMbB53myYhc1YWfXxlG4S6dS6/au5+BsT70p9NfZax3MUMN?=
 =?us-ascii?Q?dTrGF9s4xW7fjUtqpf0nufNU6YcAFizT340e/YQjpkSSxuIE+6De30938sgi?=
 =?us-ascii?Q?6YlnI82kgOOVX03O2tW0Za141x6mFcDpz2qF2CMZq7/1iVMiEK9tb88N8p1j?=
 =?us-ascii?Q?i8xlHWFlHgg8pBafE0SZhyeMDLzVA3p1IPhqZXT0vSWsZ6OiTAG0nWhafajB?=
 =?us-ascii?Q?8JhOj8rL7QWtnmQsv6FzWQC1c27X180SX/x6YqKO2s2iwNLYZ0Yh/kyJRmn5?=
 =?us-ascii?Q?AVkCGqrbIzspG6PDK3TQXewnCMkjzWukKxsPFNVXRvhXFeN/MyZkfsc5ni7Y?=
 =?us-ascii?Q?Zg8AeRjSedlsoCPZvgK4KcMOwFP3ZEs+seevQXp2my31eWkMxn0pUZk4adUH?=
 =?us-ascii?Q?1pO8Kv1fxY3Iz1ewWgU8iRZKWbVmJ8SjRIO9p5FHudgmoxAAZ922Xc35dUbC?=
 =?us-ascii?Q?Gtx9lZtOUxYgAfkD1LhAVHuMjoj/5IoY2XvwCo9JSZDqsfnDnIbej0mtvZeA?=
 =?us-ascii?Q?u6xWvxkW3FjKK5x0npq/M2QUMdF0HZ46Snr9m9CorhFzWDvWnPp/iYKuqaUj?=
 =?us-ascii?Q?3rOOPu6Ol2JWk/oHDSDtvWiyfYyMWPjZ0FOb+IFEalLsK9amiD/D670pCqlh?=
 =?us-ascii?Q?PNe/FO/KRCJqM3wZrfUG9RChrOwJQ84DP7SawtUADGFi212I1OS9XQ+xaxJA?=
 =?us-ascii?Q?7BvgQRBEqzGZ+s5n/3stbnLasIXjQpGOydI1slwFych3CNz1tJ5Jgs4a1zLR?=
 =?us-ascii?Q?zgsW6PCI+0F7X0NiKqzba3vu42to1Y/YBVCNQgMPu028fccU6FeNI4S6yMMz?=
 =?us-ascii?Q?7yTikBt5eysRRXHJoR0R+GvpM14VXFr0QWEL5+S+/kAsQjaJmwSs4Rj7hyv2?=
 =?us-ascii?Q?RDe9zJ+Pnx41DF7f3wgiDMHkXD0+KMflJff7euSu4qh3ihIvtdUmvzcykQol?=
 =?us-ascii?Q?YVu7P8WNbkAnLYXIbWpznNy64l+kTMboPjBRoXYBk/J9Lx9c3qMwkfNUXBa+?=
 =?us-ascii?Q?Md39aZ66MGW1RxR4jq4QuQTiOR++TqITs2bfwwQDzcc/qB9pHM5haaTe6HCK?=
 =?us-ascii?Q?m3d1qqwbueUvp6mDLruByaT95GchTjWem14UP5EmDnCOZrSGyXSWOjGNgXiZ?=
 =?us-ascii?Q?E8Lf5mfSRxN8HaUwrNKWIUbvkJT5/eLkZKSMhpwr+8/j4/WSPtgFW5Hk54U1?=
 =?us-ascii?Q?tfWfnCXLhb4yApwewcHCqCk0RU1zJo1qOeBb/F8w7JZlBQxZOXVT6NuJaYYi?=
 =?us-ascii?Q?x3xO74SP9zttNnhMqRRd9riJ/APGhtLIU9tq7A2PJh7IDBaMuxb8M/QcgzkF?=
 =?us-ascii?Q?bkKxlaaVfqnFVSwAosFLRE3K3DNB2uoDL8ec26R3rsiIQx4nrBkMz9+6CquS?=
 =?us-ascii?Q?iOaYfAiU1ZqDtxTHZEnegsgWb4RpvO//NRTXzWyn2YkCakGwtolEsJvAsSd1?=
 =?us-ascii?Q?Smjq6FO1hrTsUr5uRl0jlvuWS970DD7Wab4SjxtU6VkfbBx3qz5LG4wwf0gV?=
 =?us-ascii?Q?/4crx38QOS8q8Yg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hTL3fpG9sNCg6r8pt/ZXJnM1S8iXk8F4O/wyXkJ4zFmZXrKlK9nxqVwHCgCx?=
 =?us-ascii?Q?hEwHUKZMNa0UPF+RAqBxn/u8uMqCkh+TyVCVnSaSM94a8fpGopEwk6lD8zaC?=
 =?us-ascii?Q?0bZPs7gBJHngWyfvxGgmOPxmdOa7XlQa+ieuBADAnqMC/dNxoxM0opxMrT5A?=
 =?us-ascii?Q?yQUUXrwXpzBmtp1YZnbahNvyzjY4YKsxTIlb6Z1n0a61XjFakJ5OHtgIC4LB?=
 =?us-ascii?Q?5qrxnmRvb1kutKo7h/j5aNY9+wcDK11qFEx8FuLQuTA1PhAev/+CMb13zCeY?=
 =?us-ascii?Q?uMlazL+tL5UBo5vasco/gGtKlfDcci2bMD2jH7Flkuv2DfRpQYqkoyQw2Qnc?=
 =?us-ascii?Q?xamI51rYZRuZZbgI5vjoPzgMx+7Lun0/dDo1MNnaBBS+2Q7PtP9/9ST9SzTe?=
 =?us-ascii?Q?a2pya4xIqqErG0VElHpLCPlSpLfDjtjUWTQYT3VGG6KGGxEGsYlHzHJynpqB?=
 =?us-ascii?Q?8VHOsi2Xg23A0kRUAJE2po3iyg96+zXENEGCJi0XRODtmjP3kflU2nTDabgx?=
 =?us-ascii?Q?952g7liKoJC2kK3OcOEtDnDFIJfVPobavwAudDjXNAKXeT7dK4bf9ARQe3QD?=
 =?us-ascii?Q?392GVmbCRg9C282QAfMXPzTosJDr9IxNxW25g2+iEwCBH9d3iF8+Vb7n0t/3?=
 =?us-ascii?Q?Zgs1PmLgVU7vkbsJqdNyGDJ/u72DQi7Z9CXDsKFV87lzNP/uc+hD1myjUnzZ?=
 =?us-ascii?Q?HjZyRAfwERFHZf1JvDHYV2a0z58FJ+ihGEulz5OcwerycROC6W2tyayzUGam?=
 =?us-ascii?Q?6/h6NU0+OHNgaDkbE7+2Z+ky4Ru65l7ZEBQ7FVtPWyopO2zmKsykxl9A0NRX?=
 =?us-ascii?Q?kjjpTrEQ7/AKvUgnOMFavDS57Zh6sdMsf/gmj0ICA38lmcLt4S4jkS/8ohuM?=
 =?us-ascii?Q?1eAhNdwfPvm7XLjnBouOkrvdJHOEnTUooF3vwNpIMS3LhGr/Ka7kAhTT6uYK?=
 =?us-ascii?Q?8lCufMzKxG4zbkvJ7nIwAbRXmfiTyPzq8ONV0gQEn3mMdNS3Ce+FK3GXakZ/?=
 =?us-ascii?Q?6e5h9+M65gahMxF5RMlf4WtnHHV2+mKxnR8EKjCltt4K10u87AZk3uPxBm5r?=
 =?us-ascii?Q?iV0fZU73V2w+OY5z8jWVfp+0frdMtqKrfwKkSe0kg1W9l9Ej+gO0h5SzFwnJ?=
 =?us-ascii?Q?vQ1UpbMnjB6EsvXZDg1ZN7nTwjxNHzxqbhki5s+VqpbUQYVDMwQrksuxYgpV?=
 =?us-ascii?Q?/2eKUQUSNcsrJWNUWRKS9d+OetBJnFpP4gl4gQT7bavDXsQJU04DdkxNI2hc?=
 =?us-ascii?Q?Xfcl3zRqy9A/tIjHjEoRM/rutEGLqwkp/XhiTGU/ygDZurz/Crq9zooxY1Tw?=
 =?us-ascii?Q?cVnSkb6j9UFB6vmCL+iHnSa5umvV2rdwD7WFMXfg6Ku8s08hy21UBG2zKonO?=
 =?us-ascii?Q?xLIbB4cCnC60fhuCmClx3rwY7ciQkITnXaeVI6wy0IqCx9lUQbV3bFY6xyHX?=
 =?us-ascii?Q?Bd12UEhcBXgx3lA1rFSOBc3NllMtQ3B39fbMAlQ4Xo+n3mK7PaVFyCBzPJrR?=
 =?us-ascii?Q?lyXnN6najkXUm7JLtFukevdOTBxSfIEyha8mFmNRlyDcrkTUwQdCBbpjTus8?=
 =?us-ascii?Q?fW7jB4QUbJx4rMVbJ6iPHiWcs1dRDancMi/FRyg1YIxFSa2+buvVX0vT1q5B?=
 =?us-ascii?Q?CtMfCoP54SzLOmhOJ2nVr5Q=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe9cea1-6feb-4e81-206d-08dd80956408
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 05:28:47.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDb5VGEcEh/0er7jI6jAW/X6n/KPCbhHnynEzb6mBJe1FLvOzM//2m6iDU3WxvKyGQ8oZe5WBZZ6ij+Clr7z0Gfxq+nW/a+71uBUy6zZrRoSvr/hUebFpFw4651Sk+jM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1028

Arnd's patch [1] removed the compat ioctl32 code, so this
header file is no longer needed.

Additionally, the definition of atomisp_compat_ioctl32()
was deleted in Arnd's patch [1], making its declaration
unused as well.

Moreover, there are no references to this header file or
the function(atomisp_compat_ioctl32) in the atomisp codebase.

Link URL[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 .../atomisp/pci/atomisp_compat_ioctl32.h      | 244 ------------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   4 -
 2 files changed, 248 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h b/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
deleted file mode 100644
index 23d798f3085c..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.h
+++ /dev/null
@@ -1,244 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for Intel Camera Imaging ISP subsystem.
- *
- * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- */
-#ifndef __ATOMISP_COMPAT_IOCTL32_H__
-#define __ATOMISP_COMPAT_IOCTL32_H__
-
-#include <linux/compat.h>
-#include <linux/videodev2.h>
-
-#include "atomisp_compat.h"
-
-struct atomisp_histogram32 {
-	unsigned int num_elements;
-	compat_uptr_t data;
-};
-
-struct atomisp_dvs2_stat_types32 {
-	compat_uptr_t odd_real; /** real part of the odd statistics*/
-	compat_uptr_t odd_imag; /** imaginary part of the odd statistics*/
-	compat_uptr_t even_real;/** real part of the even statistics*/
-	compat_uptr_t even_imag;/** imaginary part of the even statistics*/
-};
-
-struct atomisp_dvs2_coef_types32 {
-	compat_uptr_t odd_real; /** real part of the odd coefficients*/
-	compat_uptr_t odd_imag; /** imaginary part of the odd coefficients*/
-	compat_uptr_t even_real;/** real part of the even coefficients*/
-	compat_uptr_t even_imag;/** imaginary part of the even coefficients*/
-};
-
-struct atomisp_dvs2_statistics32 {
-	struct atomisp_dvs_grid_info grid_info;
-	struct atomisp_dvs2_stat_types32 hor_prod;
-	struct atomisp_dvs2_stat_types32 ver_prod;
-};
-
-struct atomisp_dis_statistics32 {
-	struct atomisp_dvs2_statistics32 dvs2_stat;
-	u32 exp_id;
-};
-
-struct atomisp_dis_coefficients32 {
-	struct atomisp_dvs_grid_info grid_info;
-	struct atomisp_dvs2_coef_types32 hor_coefs;
-	struct atomisp_dvs2_coef_types32 ver_coefs;
-};
-
-struct atomisp_3a_statistics32 {
-	struct atomisp_grid_info  grid_info;
-	compat_uptr_t data;
-	compat_uptr_t rgby_data;
-	u32 exp_id;
-	u32 isp_config_id;
-};
-
-struct atomisp_morph_table32 {
-	unsigned int enabled;
-	unsigned int height;
-	unsigned int width;	/* number of valid elements per line */
-	compat_uptr_t coordinates_x[ATOMISP_MORPH_TABLE_NUM_PLANES];
-	compat_uptr_t coordinates_y[ATOMISP_MORPH_TABLE_NUM_PLANES];
-};
-
-struct v4l2_framebuffer32 {
-	__u32			capability;
-	__u32			flags;
-	compat_uptr_t		base;
-	struct v4l2_pix_format	fmt;
-};
-
-struct atomisp_overlay32 {
-	/* the frame containing the overlay data The overlay frame width should
-	 * be the multiples of 2*ISP_VEC_NELEMS. The overlay frame height
-	 * should be the multiples of 2.
-	 */
-	compat_uptr_t frame;
-	/* Y value of overlay background */
-	unsigned char bg_y;
-	/* U value of overlay background */
-	char bg_u;
-	/* V value of overlay background */
-	char bg_v;
-	/* the blending percent of input data for Y subpixels */
-	unsigned char blend_input_perc_y;
-	/* the blending percent of input data for U subpixels */
-	unsigned char blend_input_perc_u;
-	/* the blending percent of input data for V subpixels */
-	unsigned char blend_input_perc_v;
-	/* the blending percent of overlay data for Y subpixels */
-	unsigned char blend_overlay_perc_y;
-	/* the blending percent of overlay data for U subpixels */
-	unsigned char blend_overlay_perc_u;
-	/* the blending percent of overlay data for V subpixels */
-	unsigned char blend_overlay_perc_v;
-	/* the overlay start x pixel position on output frame It should be the
-	   multiples of 2*ISP_VEC_NELEMS. */
-	unsigned int overlay_start_x;
-	/* the overlay start y pixel position on output frame It should be the
-	   multiples of 2. */
-	unsigned int overlay_start_y;
-};
-
-struct atomisp_shading_table32 {
-	__u32 enable;
-	__u32 sensor_width;
-	__u32 sensor_height;
-	__u32 width;
-	__u32 height;
-	__u32 fraction_bits;
-
-	compat_uptr_t data[ATOMISP_NUM_SC_COLORS];
-};
-
-struct atomisp_parameters32 {
-	compat_uptr_t wb_config;  /* White Balance config */
-	compat_uptr_t cc_config;  /* Color Correction config */
-	compat_uptr_t tnr_config; /* Temporal Noise Reduction */
-	compat_uptr_t ecd_config; /* Eigen Color Demosaicing */
-	compat_uptr_t ynr_config; /* Y(Luma) Noise Reduction */
-	compat_uptr_t fc_config;  /* Fringe Control */
-	compat_uptr_t formats_config;  /* Formats Control */
-	compat_uptr_t cnr_config; /* Chroma Noise Reduction */
-	compat_uptr_t macc_config;  /* MACC */
-	compat_uptr_t ctc_config; /* Chroma Tone Control */
-	compat_uptr_t aa_config;  /* Anti-Aliasing */
-	compat_uptr_t baa_config;  /* Anti-Aliasing */
-	compat_uptr_t ce_config;
-	compat_uptr_t dvs_6axis_config;
-	compat_uptr_t ob_config;  /* Objective Black config */
-	compat_uptr_t dp_config;  /* Dead Pixel config */
-	compat_uptr_t nr_config;  /* Noise Reduction config */
-	compat_uptr_t ee_config;  /* Edge Enhancement config */
-	compat_uptr_t de_config;  /* Demosaic config */
-	compat_uptr_t gc_config;  /* Gamma Correction config */
-	compat_uptr_t anr_config; /* Advanced Noise Reduction */
-	compat_uptr_t a3a_config; /* 3A Statistics config */
-	compat_uptr_t xnr_config; /* eXtra Noise Reduction */
-	compat_uptr_t dz_config;  /* Digital Zoom */
-	compat_uptr_t yuv2rgb_cc_config; /* Color
-							Correction config */
-	compat_uptr_t rgb2yuv_cc_config; /* Color
-							Correction config */
-	compat_uptr_t macc_table;
-	compat_uptr_t gamma_table;
-	compat_uptr_t ctc_table;
-	compat_uptr_t xnr_table;
-	compat_uptr_t r_gamma_table;
-	compat_uptr_t g_gamma_table;
-	compat_uptr_t b_gamma_table;
-	compat_uptr_t motion_vector; /* For 2-axis DVS */
-	compat_uptr_t shading_table;
-	compat_uptr_t morph_table;
-	compat_uptr_t dvs_coefs; /* DVS 1.0 coefficients */
-	compat_uptr_t dvs2_coefs; /* DVS 2.0 coefficients */
-	compat_uptr_t capture_config;
-	compat_uptr_t anr_thres;
-
-	compat_uptr_t	lin_2500_config;       /* Skylake: Linearization config */
-	compat_uptr_t	obgrid_2500_config;    /* Skylake: OBGRID config */
-	compat_uptr_t	bnr_2500_config;       /* Skylake: bayer denoise config */
-	compat_uptr_t	shd_2500_config;       /* Skylake: shading config */
-	compat_uptr_t	dm_2500_config;        /* Skylake: demosaic config */
-	compat_uptr_t	rgbpp_2500_config;     /* Skylake: RGBPP config */
-	compat_uptr_t	dvs_stat_2500_config;  /* Skylake: DVS STAT config */
-	compat_uptr_t	lace_stat_2500_config; /* Skylake: LACE STAT config */
-	compat_uptr_t	yuvp1_2500_config;     /* Skylake: yuvp1 config */
-	compat_uptr_t	yuvp2_2500_config;     /* Skylake: yuvp2 config */
-	compat_uptr_t	tnr_2500_config;       /* Skylake: TNR config */
-	compat_uptr_t	dpc_2500_config;       /* Skylake: DPC config */
-	compat_uptr_t	awb_2500_config;       /* Skylake: auto white balance config */
-	compat_uptr_t
-	awb_fr_2500_config;    /* Skylake: auto white balance filter response config */
-	compat_uptr_t	anr_2500_config;       /* Skylake: ANR config */
-	compat_uptr_t	af_2500_config;        /* Skylake: auto focus config */
-	compat_uptr_t	ae_2500_config;        /* Skylake: auto exposure config */
-	compat_uptr_t	bds_2500_config;       /* Skylake: bayer downscaler config */
-	compat_uptr_t
-	dvs_2500_config;       /* Skylake: digital video stabilization config */
-	compat_uptr_t	res_mgr_2500_config;
-
-	/*
-	 * Output frame pointer the config is to be applied to (optional),
-	 * set to NULL to make this config is applied as global.
-	 */
-	compat_uptr_t	output_frame;
-	/*
-	 * Unique ID to track which config was actually applied to a particular
-	 * frame, driver will send this id back with output frame together.
-	 */
-	u32	isp_config_id;
-	u32	per_frame_setting;
-};
-
-struct atomisp_dvs_6axis_config32 {
-	u32 exp_id;
-	u32 width_y;
-	u32 height_y;
-	u32 width_uv;
-	u32 height_uv;
-	compat_uptr_t xcoords_y;
-	compat_uptr_t ycoords_y;
-	compat_uptr_t xcoords_uv;
-	compat_uptr_t ycoords_uv;
-};
-
-#define ATOMISP_IOC_G_HISTOGRAM32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 3, struct atomisp_histogram32)
-#define ATOMISP_IOC_S_HISTOGRAM32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 3, struct atomisp_histogram32)
-
-#define ATOMISP_IOC_G_DIS_STAT32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_statistics32)
-#define ATOMISP_IOC_S_DIS_COEFS32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_coefficients32)
-
-#define ATOMISP_IOC_S_DIS_VECTOR32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dvs_6axis_config32)
-
-#define ATOMISP_IOC_G_3A_STAT32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 7, struct atomisp_3a_statistics32)
-
-#define ATOMISP_IOC_G_ISP_GDC_TAB32 \
-	_IOR('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table32)
-#define ATOMISP_IOC_S_ISP_GDC_TAB32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 10, struct atomisp_morph_table32)
-
-#define ATOMISP_IOC_S_ISP_FPN_TABLE32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 17, struct v4l2_framebuffer32)
-
-#define ATOMISP_IOC_G_ISP_OVERLAY32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay32)
-#define ATOMISP_IOC_S_ISP_OVERLAY32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 18, struct atomisp_overlay32)
-
-#define ATOMISP_IOC_S_ISP_SHD_TAB32 \
-	_IOWR('v', BASE_VIDIOC_PRIVATE + 27, struct atomisp_shading_table32)
-
-#define ATOMISP_IOC_S_PARAMETERS32 \
-	_IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters32)
-
-#endif /* __ATOMISP_COMPAT_IOCTL32_H__ */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 4feaa0338cb4..57f608f9db56 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -33,8 +33,4 @@ void atomisp_stop_streaming(struct vb2_queue *vq);
 
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
-/* compat_ioctl for 32bit userland app and 64bit kernel */
-long atomisp_compat_ioctl32(struct file *file,
-			    unsigned int cmd, unsigned long arg);
-
 #endif /* __ATOMISP_IOCTL_H__ */
-- 
2.34.1


