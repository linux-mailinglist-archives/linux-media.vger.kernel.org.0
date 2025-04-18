Return-Path: <linux-media+bounces-30524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB8A93365
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B8C3B969C
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95342586E2;
	Fri, 18 Apr 2025 07:19:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021104.outbound.protection.outlook.com [40.107.57.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D01D86D6;
	Fri, 18 Apr 2025 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960781; cv=fail; b=hoVXDvc2XO5U0tVatiZuQt9ybNQG/beZxSPR/LbLzFiLNFSPFb3HMmOc14+QtHRi+maz7oolaiyWTTAO4woRgQkEvoDXT2IOYqlATnEhRNvbuDtIdBEcXl+3uEZWJDMPhgoZArsPRH94z93fSWgqZv2mFXddnM8XRKSPoFNxKsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960781; c=relaxed/simple;
	bh=da2EOLl/dFx7YXQej7HtZqbdvKp9XWCO7aAZGcExifE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZNEruIA0lwV2L6+F/v89Vi2UL88Sd/1ABsDfCcv3zqtHZbUWLCKvBFQoqlgvCXXH7xpHOl38q9NQD0Kwa/2OVbjs/+fXks2nQylPlYxg6af8ce9rfs+ij9GmQf/TkZeCpvCJP2ubiOhimjrr85qYahf8zAYOUmSGvRnFUAiq1Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJ5rm085u27K9Zct9i7oOTqoyGfRtgmWsqhvc01alAPpEiGQQTTEZfsxkb0sXv7QuEABAd3tKwqMQwf+U9iMHcmr/rkEPXW4Re8jc9xL/7x7M1orHvGaUJC1g/eYwIr1L0izuTLTr9SMkJ1tKnADc3JrPU1yqRtphbklPN9vlvny5mIO5v2o+nR5kOLCIMMsPisR81pfjHYP1IofLG0xLesKwvr8UCZb8dkJIGXMCICRo4r8OXIJPJyaSQ+S2XFXHLak90wk+QByonlew6wOZ8ZPgX0PfagOj0ffZGIjh9HlNFUzR45f1goBiMy5+U8U/YzxxYa4lxe8/C7Dpu/gEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwwodVlp/qdJORQqE/X0R12nLsFkRVC/sSHNy3zIk/o=;
 b=YKWnHw7vqOtck1ubbpPMZ/V0D/xj0qUjIepYIz/N1izra0AT4uexBEzxG5SoSfIyILlH3m4kKYlYsVTtm55mI4Sb/vYqTsM1uVPREXzIpdWY6tXiTBAUUmTozVufe30X6PI3e1b7WzomYbIihd6PRDOg41UcmFG0ntw9VsvyFIl7GoLtCTg1/OUp911ZJZzyhVkBJVZ1+Mqcm3KuQ5nxpdHv7T85eBL3CE5ioCq3bE6fqNs3Rys9at0sdy3FgPQi3wP+8F9rqlZznpq74h1uG+y2qUFO62DmOooMHQdt1N4kHKgHr+bTLEIgF0P4OxLoQOfk/tHa59gz3cBUfRM+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB1743.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Fri, 18 Apr
 2025 07:19:35 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%5]) with mapi id 15.20.8655.025; Fri, 18 Apr 2025
 07:19:35 +0000
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
Subject: [PATCH 1/2] media: atomisp: Remove compat ioctl32 header file
Date: Fri, 18 Apr 2025 12:48:17 +0530
Message-Id: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::19) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN2P287MB1743:EE_
X-MS-Office365-Filtering-Correlation-Id: aaed63c3-174c-4c50-550d-08dd7e495f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2rtBVf6lSI/MXVKGkZXkzzocvGXY2y3t+U05eFejptkYjCLxBs9Zlkxih3PS?=
 =?us-ascii?Q?6FjGU0brMUagq3AFQpaVJIdkEONARivT7Yqegw5pUx492BXKaQ+Ye9m5X0oc?=
 =?us-ascii?Q?EW6II1rJflwehuGIS6WujG0+FdQD9718Zai8Kn7phO4aaCN6YbaduXrcRKnf?=
 =?us-ascii?Q?J/s3zFcI7elPUwME8d+o/adSCnq9ERs7cWiHk5aP2HPb8gkf8K1qIm9fnyXh?=
 =?us-ascii?Q?8kF3j6hzMSWFqKeCCZt1DZ5bB97aKiImN6JWk3/ee0ZJN7dMRk4mzHvyV/gl?=
 =?us-ascii?Q?EkgxBbmICa8mNO/IKRSBl5wvLH+jq6SA7/iAIYr24YTQ5j+JiJcwqLGj4QyF?=
 =?us-ascii?Q?DHTGFDpR+JGwn5f/kENzF4IIWkfVby7q0M5vqAOs2yi00NLpfUQHmAmUkC5i?=
 =?us-ascii?Q?O4KK5ZK3evgg+wZtWoJq5vxS7bg/v+8yuT9RFCfjt5PjMUJMIM+C3dLYuBw7?=
 =?us-ascii?Q?uVugFEcRHiK0K80anefzjFX982HVJTSoQt4sA3wsU3P0PSPwQTJ7Nhl7UQdK?=
 =?us-ascii?Q?kqxH8m0KLws4H7geiSJmsXV+xjRFQ0hV04gUpL9zJDRUi62DoHdZIkM5Pd8K?=
 =?us-ascii?Q?Ar/fWsAbu88QhULYDlDjBg4JGtsrGg0Ozndbr3bNwzyQg1f0F8PoMxmyHVKc?=
 =?us-ascii?Q?DFM5DDNcIA+qOw5be5UfDBB6T4dtGQQxxqi9BqK6GFJWvxGR1mHzrPrDUWx5?=
 =?us-ascii?Q?qkO9s5YevIMvXAqSVgDixbeaHYuoSh3thMaDtyeR8394wt0gIcvSILQ3L5Fc?=
 =?us-ascii?Q?jsEP9Y+FC59nkLLXC14+7djdw6+pE3KzWkf4ZWe/CgzzOoxtKTsmiI/0DVlO?=
 =?us-ascii?Q?a1G0Qd92wYIVr1z7VCcIAHrueyTAIbnbOjQEZyH5xgYEubYsQtQNAmZmq6cd?=
 =?us-ascii?Q?lLckHOxmLpUui450q+vAzdKL/86EmzONZSPXv0p+5B7P2ZUs5mewrXL1NJOG?=
 =?us-ascii?Q?2Gj16JUl4NhlZwSeoCvlt5RNDUL/41/RWh751QFi/csgXvUt6F20iyfxpm75?=
 =?us-ascii?Q?yU4mObaHxqSDKHIN6IHqAX8zTtVTX+oqP+Na0wspe9X3gwskfqtFDIqX39Y4?=
 =?us-ascii?Q?vyxLYYdX6ceUeWG5l29ahKxYe3YauTGRwDG0f3ww4lAhMFFro8EAaGpjo8ED?=
 =?us-ascii?Q?GofQ+RA8eDdmieMEXJ6aiu6QbNTFOcbqCckUqpwFcua+v1Mwihe9IFnSRn5W?=
 =?us-ascii?Q?DaaUr2MnMdRdPvsv5JA0QUcCDL8JACoFXtYabhS/wDgwkvqhdEcn3XalOEL1?=
 =?us-ascii?Q?c8iUjAi6pnT/t7obP3Dmc/aPbRoN78JzNJgZ+tovZOt4fm8vkO5Lq7wScc5K?=
 =?us-ascii?Q?9sgp821TEKO2A6nyGiV/LGRd+rYd+5SXNUBFYXfVBl3v4jQQC5FMPMind3BJ?=
 =?us-ascii?Q?0QKDsoUPzO3bv6V9Oa4xhzegXL369k0pgunapHFBAGK9DelXLtbkAPcdkULT?=
 =?us-ascii?Q?YkyZnV+Uc2wYY1q+b24vd6SgTzElHEXDa/vUlBrERbl8EOIh5IBDuI65xHXX?=
 =?us-ascii?Q?v9MBOHMLDFsjK3I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EbYp9F+1iL0GIUjuJPZkcvfgEjvJK2KILbqgH8Y4MJwulZo1mPOUDgWTdHJa?=
 =?us-ascii?Q?qn1fZtV2qG+Xal6Fz9wwtiyWJpkp73oMtg1Q+z1yWxwhP5XmpEpkbGUjakbM?=
 =?us-ascii?Q?mzZ54IZkCYqg8hHgo5kSKSA+THoTcY+oNrZ9i4zthMuUBDYCAxdEYf9uSsul?=
 =?us-ascii?Q?yuAEXO6YBVI4AQmw6piqmsjYOEoUBBeBubv6WelwO7FoZAzl8FyVbpERLHKP?=
 =?us-ascii?Q?xZfdHOEXzc42VWWh3tioxY4thUkiqwyj57ElOBvL9FMNrdFZ+Xwrz+BlSE48?=
 =?us-ascii?Q?Z9xwChs3elKsZ8GpT4KSNbSMd+CWB+1Z0bKTQgToZOt/fs27MDBbGmO0afmO?=
 =?us-ascii?Q?8qFyVseEyhcdK9+8/zy6Ic/jKdEMEMKGr5v+8W4mVswj3kiTGtchPA4syuhQ?=
 =?us-ascii?Q?dADkKuKlDagwjSXA52W2se4RGF09MzH4cLc58MHNfe1dqKdINVyye/I1ns0d?=
 =?us-ascii?Q?tQymm4Wpz2wII7tzoaMzbqyLSdiJWKfb3PJmklKpgAWOcWBJHoFB1VymlI+R?=
 =?us-ascii?Q?hdOoM/jHpbMAllBAPpbWEN4yOmrxwljTUJBS3fG0ZSADYJXaqDibi2hvf0z1?=
 =?us-ascii?Q?hq9Hb5KCsvwlp9umIcEJzfkvsSWOfUeJzz6cqvuwVvpzwIN1MwW20vUJDfMM?=
 =?us-ascii?Q?dhQebQ5ffQEyY2CZj1fW0OpdcL8RGV3jTCY/eK12epJhxc8uFrwzCr199+ei?=
 =?us-ascii?Q?9wli3O/yyWF/ArE5Lei5A+3OqCSZkoO3bWc93K12pgsvgIvzBs31KHgGAv9J?=
 =?us-ascii?Q?5qLPGNXxBB5ebHe8x1QfqHBBO2hpY8LseJEX0UGFY7vVfqgDnuqGUwdsRmp1?=
 =?us-ascii?Q?kWNouHhuy5vV2iYsGkcHNXLIgzoKzzuyjXEiSXyov0yC3pso22tc5XqGXUCk?=
 =?us-ascii?Q?xN9UDsWuid4M7Li/oJbNTY7FXGjIATsmL3GorL11W1NRxp3ec4WHN2GqCIgR?=
 =?us-ascii?Q?N+0YCs+OM9otW3Ac4nR17CHdF0pzysnnavT1TdQbPJCK5tJDiYTspKmeSm67?=
 =?us-ascii?Q?m+DguOUdTUeWOTjJ0BeNSyR720V+ckaJSxe8bAE4n+MKCuJgGJpnJYZ8P1eg?=
 =?us-ascii?Q?gO4h6xHPdacl97Ky9c2eOaGoCbSz3yIetYeEHuGyAw70Y9d175VE6hKmjzVz?=
 =?us-ascii?Q?w5ZyK1xPqHTJR9Qjea+N1I5jNr5WzE+s/C4G2ot3Mm7IH2t+rzzcR0hkeVO9?=
 =?us-ascii?Q?32vFTgq5OOka7D+Ujv+AFdIklO1b9MExoNXRXTo2HcE+Xbnu9QbZiCDD58fI?=
 =?us-ascii?Q?MDuGvXZRWs9WIYynMjwms0mtQppVfPNCOczPfibF0/o43b1F+Cer23Sk1xDU?=
 =?us-ascii?Q?IMrU4GxWvdkZmITuEK6zDwjPHVaXmp81FQcAbQkvqlTrl+DeldzEWiXlJEwF?=
 =?us-ascii?Q?65auABHTan8f4PAzPwASBEzUTNUp54bYI83CINuN5boaU0ys/Ygd4YpidE+z?=
 =?us-ascii?Q?Rd/jj89h6gcyeRvX6+yDfteIadHKNYYs8+PVNywMCTMXzq1hU4zy5OJEZg89?=
 =?us-ascii?Q?1cHuU8NLSd+Ryi6B8xO8vdNdeySVA6V78QHZfK4UB+h12/Do00O9vc8So+Xd?=
 =?us-ascii?Q?KmYBFCTRAYgRDuODyH8iYjZyAInNRUhTRY6aG7IXJ43bwsHENFI6rOYdekX0?=
 =?us-ascii?Q?8S1ShSvrT1RJNL1rlizDIDE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: aaed63c3-174c-4c50-550d-08dd7e495f06
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:19:34.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6BBhz8+Ll+gXkz3cEr7M9iFwwdVUAcPot0uIoWOxOZXKp+yizNTsWklijJa13WE42RmYWQNVIAWLZchmfDRB1sWPQM6PFBC1vyv6t7y9DxDjisNRRbmjKJmeufdk15R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1743

Arnd's patch [1] removed the compat ioctl32 code,
so this header file is no longer needed.

Also, there are no references to this header file
in the atomisp codebase.

Link[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 .../atomisp/pci/atomisp_compat_ioctl32.h      | 244 ------------------
 1 file changed, 244 deletions(-)
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
-- 
2.34.1


