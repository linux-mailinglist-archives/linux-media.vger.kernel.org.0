Return-Path: <linux-media+bounces-25884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD5A2E744
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E123B3A4BA7
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974DA1CAA70;
	Mon, 10 Feb 2025 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="GobkFfGB"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021140.outbound.protection.outlook.com [40.107.42.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE01C5F1B;
	Mon, 10 Feb 2025 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178471; cv=fail; b=PXF6/t0apZKwR1jQIYHDoeCaTF/uY7k0Nqsz1musmPtKgWYLjs09lH5qbrLGGFfpO6/u+lW61W1W9nF5DrnMi+iO0X9G9K+6ebpmnSctG8jS0SSgfVuTcc4D50OrKZ3zmhjW1rAV6iwhJ1j6KWMxZ/OHFPcRd21iI3E1C1nz4PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178471; c=relaxed/simple;
	bh=VZPStha1B1C6vG3Aj4sHnIEkIAUK+Sd8GHuzSArdX+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MLT0vMHYBztnE0vcD6LQf6i+WKY4o6n+rgDOrHR+mdjyW33a8jOKCvR5jPElc6BiL7wcsL4rslZMN9FobNdU9ST0T8FpvBG0IcNRw4bJ4AHmZ9OKYZROjAAeGOjqjozHhJ8SLb0AlLo7F6ssnjiOZ4d3WYcmOKOv/1Afe3XxSf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=GobkFfGB; arc=fail smtp.client-ip=40.107.42.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLTdorCAiKGaQGleOMzLs+Iruy/2kapW52o1fkjpqoLuIlLhlW71ufgACmj6ncuU6zpOi600K85OGNwWfzZPoYzjRPpKyYztxNokc3Bk0bczFbu7mBaenqzZevFngM4k8C9f0R12hSgHmu27+Ndo4+H32k04VP6gUQhao3hXp9xEtH36qnurnNLdpj1j9A7hH2NLn6xFImtm3neUDVIvIyTeFWRZlZg5dfkKSrV/ID+AfxpJgb1w+LTkVfRoE3Q5OuDfSwVz2AlGdRSyH9giqRxEHz6X0Bs+H20XzxOhnjyNVkg7dIapdsH/Szn5wv+lRhaO9UDWT9Xv/36uL7kL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQH4kYKtrUZjcO5i91V4ihay/qEdlDytmqfWXXoUD8k=;
 b=cZ/pn2mdfnkK3m4QIvh1ewMTm3BKOYrFzfMWzRE07qerrAczVk3XsNCbE6Jdv5DtXuYpMGKKw79GUqXkIqRG74oa9RY2DrLyK/5vpnRig7/w39MEuufaA1EE6okhv2tIhDVjo78Ct0YaT13lT9bp+QXSNQbuvkqqFRAQ5JIW28K8Vzcep+ghpAvIFkVlvIn1jn/E9whgD3aDZzOsAn3uyBEYsVS0TQv/bHIzAT+tKxmvb7gKcr2bj03pMa+XwXZfctGhfXCRyJRaoOUvrLhMqxjvKtzyBDlPpwk4rfGA0DI/xUCnvxeqBr3XifaWTiVlf1fkUlzkfbnFS57Tp5XhOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQH4kYKtrUZjcO5i91V4ihay/qEdlDytmqfWXXoUD8k=;
 b=GobkFfGBc87oIsVEmwXPYZIm+1mcwP5V2oCICFLvNaJTi+YLrBFAofCII4M5EX+ILa7cwPCW6CaZCrcbMR3ZvJGLjjKrKNUozPwYvSHP8KIXfHrcKORstRxVI3hhakSmYfcQ7+vCtrZh0by7YJSZHwuOjAmRgXsqVGFZpQ/JViA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1504.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Mon, 10 Feb 2025 09:07:38 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 09:07:38 +0000
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
Subject: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Date: Mon, 10 Feb 2025 18:07:24 +0900
Message-Id: <20250210090725.4580-8-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 86dd117d-5e98-488b-67a2-08dd49b25d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+uPDfhzWa1RRQcQG1eggMJhOhO1ug/y2xBeMMlvH2hL6mbEb8YV6QsIvoOLd?=
 =?us-ascii?Q?2EspIodvSBZsf1WkrJ0jiU+BhIHV3jr2MZGXKLclEYdL5z68OihpoM+WBJF/?=
 =?us-ascii?Q?yXlIDxfF1Xicb/JFZ2JMYMi7IAeqHkJowQ57RbKJQ6s9nrpgP9s5trVH+sXv?=
 =?us-ascii?Q?iGMxataCT/IfCGcFkOs9SBrys91LvKGRC8tN7aU3yZuLJK/r/BfdsQhbJdq+?=
 =?us-ascii?Q?boaKIHz+/nlXrZ0K5WvFEGjiZj8wkHYNKMblalAV4gj9NwJ3o94F5JOZb0AW?=
 =?us-ascii?Q?lr6yIkINphYF6uNuYkZlOaKmhuIMTX+MWijptDnAVLqiWd9HFbnjmN4kyQ/V?=
 =?us-ascii?Q?eB7w3kym0SjBa+MauIjp2+RhhuY2RQU9+AX2cyUPVlJKGkeTirrHw/3YKxk3?=
 =?us-ascii?Q?JK9J8Ml06mRN6ZGXQOZPodoc7pfFd+aO7TCTTFhd3lDH89ECfMZe1ueLRNRO?=
 =?us-ascii?Q?Cn9L6g7e85QRk6hlw5h5Z7eK7SFikLe48I42U1IwUMwgvIwYzZKr7pZg2Sr3?=
 =?us-ascii?Q?rmPGTpJHpa59qArfxuQAenWIIinjgX/0oHOE5Wk7Qe0VWTft6ZZ/6Vn+Bnjp?=
 =?us-ascii?Q?QFl7NT2cEnL9lSVxYwXybOoGuNvpAyTmCsHajgLYtgZq98mKFgc8B+DzYAjv?=
 =?us-ascii?Q?OMLvPMOPrReWrFE/6FYaXGOOek/YfK3olno2ukHM1GDUVGNU4ltKr04qBSk5?=
 =?us-ascii?Q?8cyukLylILlUSM5Ubu7xnyTVtqCAZ6NJ6BBBNfNSGLVHkhkAdgEyjGnDKUnS?=
 =?us-ascii?Q?lq4d88g9csjYpalzicsXs/79iHtif0dlpFB+Mq+tPgPPpxwPSXh9LkrB8TOP?=
 =?us-ascii?Q?Jg/Nj/b8PW84sG+3KYwu4Qwp7jRoyjESi1Atu8pUdKTiRSyI5rEN5dZmDptA?=
 =?us-ascii?Q?tQtfurKbNORVjihHw62yUO7+jxM2RX5+N1lh3GA447TthXJ25EPrNkv2ssTe?=
 =?us-ascii?Q?mdh6aOZ35Cqj3FMgTRtljSNOJmOdj4jbBGbqchWa5MtosJ0hOv/l7BOt8BCl?=
 =?us-ascii?Q?qj/ze+lXJ5NN651Uczf7Pk28xmlAEaDJV2ROI8hQI200lPHFX0yoon06PViT?=
 =?us-ascii?Q?zY7LOlHqnnyodok8nEaRM6+vQNROkRC3pMSRZaypVFI5WzHUSIqdMzEl08kU?=
 =?us-ascii?Q?+rqcCP5PSDS86zgQTHHTiU92rbXKPLrjY+aO9yWsZZaX4UBQPxP18wOymwD6?=
 =?us-ascii?Q?lmwlJtP8JAl5ybw0FNw1fD1d6VtvfRjFmznl/e1yUoTKhjwHGKcGmqjyRIg9?=
 =?us-ascii?Q?NRXfnZpK4W17CArN2oWAbvOyUmZP+F+S9dDvZ1BgRgK/RmZqMGOtInSEXMhd?=
 =?us-ascii?Q?Xxpon9vTjEAQC9P6Br5zgHRTBY90cBfMrfpoVViDZHL4K6qgpAz0oqWusBUq?=
 =?us-ascii?Q?0s07NmDF5ABGKQrWmCBVFRxxtlvEdsBYi18Ci7wisQUJHunWbICeUyk6++Yx?=
 =?us-ascii?Q?NPLFRs4cBXc7o5N1G4SKDzJdWX/FR0+s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2tgQC+ntlkkwLFt6LlFVckbCLb2ufm9kGDw1yTmNx2vv3gJKldzIEEGCPCO?=
 =?us-ascii?Q?BtwnL1iEQ5YJxbrkVL5qus0aAO6uuFf06P286livbM36J3DL4r72mym8ByhI?=
 =?us-ascii?Q?tJAH25djUvukghE2DN6wtQojx1xpBOrAJAXkslB2exAYmnyS0tEwGiXZpcrl?=
 =?us-ascii?Q?qzdn3ZTtNRgVcFLlX+/xRlK3Hi9XjpU05j3TQAJl0LHGrt7TlURDv8vJzgan?=
 =?us-ascii?Q?oNXGPSpR942EBCMkLZ+Yq6mrT2qQA5pzth/PuEGg6L5fWZ27maAxY+51C/uM?=
 =?us-ascii?Q?VcbkGOkBk9Oyd1uFif7fWZFlp/nBeH/eEM1KGRXwz4WMoxbWKlkh0u5Eqr5l?=
 =?us-ascii?Q?+f9AM54bPyH1gtlppmDCHXTn5wAc4mRFGjBz7HGNMy1z86tvg4n4K+nDzf9v?=
 =?us-ascii?Q?TGZaNlv0CJbM/QpJ7dHPV/hp2U/9gMT5i77ySsLTRZsoUeCYGQzobQ0IiSId?=
 =?us-ascii?Q?OxRhi7+jyiI1r1+t0Xoiu6xYdEQ5wkh7KFiP8d+5yIaJ/iU4me9zIKJ1o9jd?=
 =?us-ascii?Q?STciQxq/LiDJhvj+h1mtCFYKpIwUY5U5exSRefw3Kxv/F/O3JgM5yRRli9TD?=
 =?us-ascii?Q?BBM0phPkWqRcrq4N5e0IlOwO8Yf363wg1UEm+4I5xv1t0SXFyu7AUXyXf31/?=
 =?us-ascii?Q?WItHWCI3YQWqp90yh8iB1Nx9d6l8XSK9ceXZjDzp8R+PHNUDVlmw6ml5XEL7?=
 =?us-ascii?Q?FCl+lbEoEu1Wxzkh2aE3y3yVncg+KDHJqdMn9bVXzQ+7ssC6HS4QK7TGrlSi?=
 =?us-ascii?Q?h0FswS/gp+i/GBYXuRcMHjHJIkzXTkLkYpQGATpEXr7F86kaemMJRj6RSAxQ?=
 =?us-ascii?Q?S8H4/u5bira9UOmc5srkTNz31WCu5ui3jVlXXQ9UQn8lyhHOAbvuuyqKcasx?=
 =?us-ascii?Q?NVPLThp6BWhag1oyvha0Q97+YFQJSqa9RXhhMPCnih7xKJxGSfJMTZinRTUn?=
 =?us-ascii?Q?Vtc/Fhp+UiHlWXc7HtVwSVvjncNcLvPHZB1giEamxByrNkwsoazgjHVytH54?=
 =?us-ascii?Q?lvEx8tnkjKXTiNrX7AqseCcUGp+BZbzttV7d28VaXMr26GsA/bZ74m/3qSTr?=
 =?us-ascii?Q?HaxyiTNKQaExkFi1e+scxY1C15P5C6r6nAlS6UarAzZxTeybnN+GQZrXole9?=
 =?us-ascii?Q?/M2h3+zyRLrzkvVrRoIYPf7gUFnaxH2ZBSk9pngHI2y2e5VLIyRe12CWDP+G?=
 =?us-ascii?Q?L/kYZjU2/linv6qwbrD5dYqp9WWagsUhl+RWeHatdEGcR2Rz/wWE2yB0ss4L?=
 =?us-ascii?Q?qGyvbwgI/D/iEmACblXr8tXgOvERRYjWiW+amTY43CojRdYYDN9lGZxLlvnJ?=
 =?us-ascii?Q?H1poLDwwHeIM2IBZW9ATBfEgazApJKL0FoYmp62k/W/6biYxzX0DwCd4gSJj?=
 =?us-ascii?Q?sHfRssueer6AB+yrHxyFnWQ+cV69GYGSjgtZsNYZ6t1qFnJ1YYsm/II/mGkc?=
 =?us-ascii?Q?gWdsj8tMKahltRhz0emi1SOpM98/Cf4D2DvhBsiUi/qnB72JIUuli/Il/cUD?=
 =?us-ascii?Q?OQOgmtAVIJ5Hww47/qtXpk198END4i7Rn47/g7yb+B9H7FL0HCBhorXLLcar?=
 =?us-ascii?Q?pvnDo4Bjxoq8/k/w6p0MO5xmufrTuP/pWvUZ5piUOIcNPW+VWeYOpW5SDQ3d?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dd117d-5e98-488b-67a2-08dd49b25d62
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:07:38.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFnJev1Ee5e9y0kDlWelCqAbjmyTiw+eFpSv1lR0shh9GqTiK8qqBsJgXb+T2ikqwA6RnWbdEzF+vnYBA5JC+O7j38SEHtM3c+W3aWTGFWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1504

Chips&Media Wave6 control driver.
The control driver manages shared resources such as firmware
access and power domains and clock.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../chips-media/wave6/wave6-vpu-ctrl.c        | 1020 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-ctrl.h        |   38 +
 2 files changed, 1058 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
new file mode 100644
index 000000000000..fa7bf5ccc0d0
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c
@@ -0,0 +1,1020 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 control driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+#include <linux/thermal.h>
+#include <linux/units.h>
+#include <linux/pm_opp.h>
+#include <linux/freezer.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vdi.h"
+#include "wave6-vpu-ctrl.h"
+
+#define VPU_CTRL_PLATFORM_DEVICE_NAME "wave6-vpu-ctrl"
+
+static unsigned int debug;
+module_param(debug, uint, 0644);
+
+static bool wave6_cooling_disable;
+module_param(wave6_cooling_disable, bool, 0644);
+MODULE_PARM_DESC(wave6_cooling_disable, "enable or disable cooling");
+
+#define dprintk(dev, fmt, arg...)					\
+	do {								\
+		if (debug)						\
+			dev_info(dev, fmt, ## arg);			\
+	} while (0)
+
+#define wave6_wait_event_freezable_timeout(wq_head, condition, timeout)		\
+({										\
+	int wave6_wait_ret = 0;							\
+	unsigned long _timeout = timeout;					\
+	unsigned long stop;							\
+	stop = jiffies + _timeout;						\
+	do {									\
+		if (wave6_wait_ret == -ERESTARTSYS && freezing(current))	\
+			clear_thread_flag(TIF_SIGPENDING);			\
+		_timeout = stop - jiffies;					\
+		if ((long)_timeout <= 0) {					\
+			wave6_wait_ret = -ERESTARTSYS;				\
+			break;							\
+		}								\
+		wave6_wait_ret = wait_event_freezable_timeout(wq_head, condition, _timeout);	\
+	} while (wave6_wait_ret == -ERESTARTSYS && freezing(current));		\
+	wave6_wait_ret;								\
+})
+
+struct vpu_ctrl_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+struct vpu_ctrl_buf {
+	struct list_head list;
+	struct vpu_buf buf;
+};
+
+struct vpu_ctrl {
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct vpu_dma_buf boot_mem;
+	u32 state;
+	struct mutex ctrl_lock; /* the lock for vpu control device */
+	struct wave6_vpu_entity *current_entity;
+	struct list_head entities;
+	const struct vpu_ctrl_resource *res;
+	struct gen_pool *sram_pool;
+	struct vpu_dma_buf sram_buf;
+	struct list_head buffers;
+	bool support_follower;
+	wait_queue_head_t load_fw_wq;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	struct dev_pm_domain_list *pd_list;
+	struct device *dev_perf;
+	int clk_id;
+	unsigned long *freq_table;
+};
+
+#define DOMAIN_VPU_PWR	0
+#define DOMAIN_VPU_PERF	1
+
+static const struct vpu_ctrl_resource wave633c_ctrl_data = {
+	.fw_name = "wave633c_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static void wave6_vpu_ctrl_writel(struct device *dev, u32 addr, u32 data)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	writel(data, ctrl->reg_base + addr);
+}
+
+int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb || !vb->size)
+		return -EINVAL;
+
+	vaddr = dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+
+	vb->vaddr = vaddr;
+	vb->daddr = daddr;
+	vb->dev = dev;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wave6_alloc_dma);
+
+void wave6_free_dma(struct vpu_buf *vb)
+{
+	if (!vb || !vb->size || !vb->vaddr)
+		return;
+
+	dma_free_coherent(vb->dev, vb->size, vb->vaddr, vb->daddr);
+	memset(vb, 0, sizeof(*vb));
+}
+EXPORT_SYMBOL_GPL(wave6_free_dma);
+
+static const char *wave6_vpu_ctrl_state_name(u32 state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static void wave6_vpu_ctrl_set_state(struct vpu_ctrl *ctrl, u32 state)
+{
+	dprintk(ctrl->dev, "set state: %s -> %s\n",
+		wave6_vpu_ctrl_state_name(ctrl->state), wave6_vpu_ctrl_state_name(state));
+	ctrl->state = state;
+}
+
+static int wave6_vpu_ctrl_wait_busy(struct wave6_vpu_entity *entity)
+{
+	u32 val;
+
+	return read_poll_timeout(entity->read_reg, val, !val,
+				 10, W6_VPU_POLL_TIMEOUT, false,
+				 entity->dev, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_ctrl_check_result(struct wave6_vpu_entity *entity)
+{
+	if (entity->read_reg(entity->dev, W6_RET_SUCCESS))
+		return 0;
+
+	return entity->read_reg(entity->dev, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_ctrl_get_code_buf_size(struct vpu_ctrl *ctrl)
+{
+	return min_t(u32, ctrl->boot_mem.size, WAVE6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_ctrl_remap_code_buffer(struct vpu_ctrl *ctrl)
+{
+	dma_addr_t code_base = ctrl->boot_mem.dma_addr;
+	u32 i, reg_val, remap_size;
+
+	for (i = 0; i < wave6_vpu_ctrl_get_code_buf_size(ctrl) / W6_REMAP_MAX_SIZE; i++) {
+		remap_size = (W6_REMAP_MAX_SIZE >> 12) & 0x1ff;
+		reg_val = 0x80000000 |
+			  (WAVE6_UPPER_PROC_AXI_ID << 20) |
+			  (0 << 16) |
+			  (i << 12) |
+			  BIT(11) |
+			  remap_size;
+		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_VADDR_GB, i * W6_REMAP_MAX_SIZE);
+		wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_PADDR_GB,
+				      code_base + i * W6_REMAP_MAX_SIZE);
+	}
+}
+
+static int wave6_vpu_ctrl_init_vpu(struct vpu_ctrl *ctrl)
+{
+	struct wave6_vpu_entity *entity = ctrl->current_entity;
+	int ret;
+
+	dprintk(ctrl->dev, "cold boot vpu\n");
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+				       ctrl->sram_buf.dma_addr);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+				       ctrl->sram_buf.size);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CORE_START_GB, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "init vpu timeout\n");
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "init vpu fail, reason 0x%x\n", ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void wave6_vpu_ctrl_on_boot(struct wave6_vpu_entity *entity)
+{
+	if (!entity->on_boot)
+		return;
+
+	if (!entity->booted) {
+		entity->on_boot(entity->dev);
+		entity->booted = true;
+	}
+}
+
+static void wave6_vpu_ctrl_clear_firmware_buffers(struct vpu_ctrl *ctrl,
+						  struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	dprintk(ctrl->dev, "clear firmware work buffers\n");
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	entity->write_reg(entity->dev, W6_VPU_HOST_INT_REQ, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "set buffer failed\n");
+		return;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "set buffer failed, reason 0x%x\n", ret);
+		return;
+	}
+}
+
+int wave6_vpu_ctrl_require_buffer(struct device *dev, struct wave6_vpu_entity *entity)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	struct vpu_ctrl_buf *pbuf;
+	u32 size;
+	int ret = -ENOMEM;
+
+	if (!ctrl || !entity)
+		return -EINVAL;
+
+	size = entity->read_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_SIZE);
+	if (!size)
+		return 0;
+
+	pbuf = kzalloc(sizeof(*pbuf), GFP_KERNEL);
+	if (!pbuf)
+		goto exit;
+
+	pbuf->buf.size = size;
+	ret = wave6_alloc_dma(ctrl->dev, &pbuf->buf);
+	if (ret) {
+		kfree(pbuf);
+		goto exit;
+	}
+
+	list_add_tail(&pbuf->list, &ctrl->buffers);
+	entity->write_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_ADDR, pbuf->buf.daddr);
+exit:
+	entity->write_reg(entity->dev, W6_CMD_SET_CTRL_WORK_BUF_SIZE, 0);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_require_buffer);
+
+static void wave6_vpu_ctrl_clear_buffers(struct vpu_ctrl *ctrl)
+{
+	struct wave6_vpu_entity *entity;
+	struct vpu_ctrl_buf *pbuf, *tmp;
+
+	dprintk(ctrl->dev, "clear all buffers\n");
+
+	entity = list_first_entry_or_null(&ctrl->entities,
+					  struct wave6_vpu_entity, list);
+	if (entity)
+		wave6_vpu_ctrl_clear_firmware_buffers(ctrl, entity);
+
+	list_for_each_entry_safe(pbuf, tmp, &ctrl->buffers, list) {
+		list_del(&pbuf->list);
+		wave6_free_dma(&pbuf->buf);
+		kfree(pbuf);
+	}
+}
+
+static void wave6_vpu_ctrl_boot_done(struct vpu_ctrl *ctrl, int wakeup)
+{
+	struct wave6_vpu_entity *entity;
+
+	if (ctrl->state == WAVE6_VPU_STATE_ON)
+		return;
+
+	if (!wakeup)
+		wave6_vpu_ctrl_clear_buffers(ctrl);
+
+	list_for_each_entry(entity, &ctrl->entities, list)
+		wave6_vpu_ctrl_on_boot(entity);
+
+	dprintk(ctrl->dev, "boot done from %s\n", wakeup ? "wakeup" : "cold boot");
+
+	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_ON);
+}
+
+static bool wave6_vpu_ctrl_find_entity(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	struct wave6_vpu_entity *tmp;
+
+	list_for_each_entry(tmp, &ctrl->entities, list) {
+		if (tmp == entity)
+			return true;
+	}
+
+	return false;
+}
+
+static void wave6_vpu_ctrl_load_firmware(const struct firmware *fw, void *context)
+{
+	struct vpu_ctrl *ctrl = context;
+	struct wave6_vpu_entity *entity = ctrl->current_entity;
+	u32 product_code;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ctrl->dev);
+	if (ret) {
+		dev_err(ctrl->dev, "pm runtime resume fail, ret = %d\n", ret);
+		mutex_lock(&ctrl->ctrl_lock);
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		ctrl->current_entity = NULL;
+		mutex_unlock(&ctrl->ctrl_lock);
+		release_firmware(fw);
+		return;
+	}
+
+	if (!fw || !fw->data) {
+		dev_err(ctrl->dev, "No firmware.\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	if (fw->size + WAVE6_EXTRA_CODE_BUF_SIZE > wave6_vpu_ctrl_get_code_buf_size(ctrl)) {
+		dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
+			fw->size, ctrl->boot_mem.size);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	product_code = entity->read_reg(entity->dev, W6_VPU_RET_PRODUCT_VERSION);
+	if (!PRODUCT_CODE_W_SERIES(product_code)) {
+		dev_err(ctrl->dev, "unknown product : %08x\n", product_code);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	memcpy(ctrl->boot_mem.vaddr, fw->data, fw->size);
+
+exit:
+	mutex_lock(&ctrl->ctrl_lock);
+	if (!ret && wave6_vpu_ctrl_find_entity(ctrl, ctrl->current_entity)) {
+		wave6_vpu_ctrl_remap_code_buffer(ctrl);
+		ret = wave6_vpu_ctrl_init_vpu(ctrl);
+	} else {
+		ret = -EINVAL;
+	}
+	mutex_unlock(&ctrl->ctrl_lock);
+
+	pm_runtime_put_sync(ctrl->dev);
+	release_firmware(fw);
+
+	mutex_lock(&ctrl->ctrl_lock);
+	ctrl->current_entity = NULL;
+	if (ret)
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+	else
+		wave6_vpu_ctrl_boot_done(ctrl, 0);
+	mutex_unlock(&ctrl->ctrl_lock);
+
+	wake_up_interruptible_all(&ctrl->load_fw_wq);
+}
+
+static int wave6_vpu_ctrl_sleep(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	dprintk(ctrl->dev, "sleep firmware\n");
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_CMD_INSTANCE_INFO, 0);
+	entity->write_reg(entity->dev, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	entity->write_reg(entity->dev, W6_VPU_HOST_INT_REQ, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "sleep vpu timeout\n");
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_ctrl_wakeup(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	dprintk(ctrl->dev, "wakeup firmware\n");
+
+	wave6_vpu_ctrl_remap_code_buffer(ctrl);
+
+	entity->write_reg(entity->dev, W6_VPU_BUSY_STATUS, 1);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+				       ctrl->sram_buf.dma_addr);
+	entity->write_reg(entity->dev, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+				       ctrl->sram_buf.size);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vpu_ctrl_writel(ctrl->dev, W6_VPU_REMAP_CORE_START_GB, 1);
+
+	ret = wave6_vpu_ctrl_wait_busy(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "wakeup vpu timeout\n");
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_ctrl_check_result(entity);
+	if (ret) {
+		dev_err(ctrl->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		return -EIO;
+	}
+
+	wave6_vpu_ctrl_boot_done(ctrl, 1);
+
+	return 0;
+}
+
+static int wave6_vpu_ctrl_try_boot(struct vpu_ctrl *ctrl, struct wave6_vpu_entity *entity)
+{
+	int ret;
+
+	if (ctrl->state != WAVE6_VPU_STATE_OFF && ctrl->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	if (entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC)) {
+		dprintk(ctrl->dev, "try boot directly as firmware is running\n");
+		wave6_vpu_ctrl_boot_done(ctrl, ctrl->state == WAVE6_VPU_STATE_SLEEP);
+		return 0;
+	}
+
+	if (ctrl->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_ctrl_wakeup(ctrl, entity);
+		return ret;
+	}
+
+	wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_PREPARE);
+	ctrl->current_entity = entity;
+	ret = request_firmware_nowait(THIS_MODULE,
+				      FW_ACTION_UEVENT,
+				      ctrl->res->fw_name,
+				      ctrl->dev, GFP_KERNEL,
+				      ctrl,
+				      wave6_vpu_ctrl_load_firmware);
+	if (ret) {
+		dev_err(ctrl->dev, "request firmware %s fail, ret = %d\n", ctrl->res->fw_name, ret);
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		return ret;
+	}
+
+	return 0;
+}
+
+bool wave6_vpu_ctrl_support_follower(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	if (!ctrl)
+		return false;
+
+	return ctrl->support_follower;
+}
+EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_support_follower);
+
+int wave6_vpu_ctrl_resume_and_get(struct device *dev, struct wave6_vpu_entity *entity)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	bool boot;
+	int ret;
+
+	if (!ctrl)
+		return -EINVAL;
+
+	if (!entity || !entity->dev || !entity->read_reg || !entity->write_reg)
+		return -EINVAL;
+
+	mutex_lock(&ctrl->ctrl_lock);
+
+	ret = pm_runtime_resume_and_get(ctrl->dev);
+	if (ret) {
+		dev_err(dev, "pm runtime resume fail, ret = %d\n", ret);
+		mutex_unlock(&ctrl->ctrl_lock);
+		return ret;
+	}
+
+	entity->booted = false;
+
+	if (ctrl->current_entity)
+		boot = false;
+	else
+		boot = list_empty(&ctrl->entities) ? true : false;
+
+	list_add_tail(&entity->list, &ctrl->entities);
+	if (boot)
+		ret = wave6_vpu_ctrl_try_boot(ctrl, entity);
+
+	if (ctrl->state == WAVE6_VPU_STATE_ON)
+		wave6_vpu_ctrl_on_boot(entity);
+
+	if (ret)
+		pm_runtime_put_sync(ctrl->dev);
+
+	mutex_unlock(&ctrl->ctrl_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_resume_and_get);
+
+void wave6_vpu_ctrl_put_sync(struct device *dev, struct wave6_vpu_entity *entity)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	if (!ctrl)
+		return;
+
+	if (entity == ctrl->current_entity)
+		wave6_vpu_ctrl_wait_done(dev);
+
+	mutex_lock(&ctrl->ctrl_lock);
+
+	if (!wave6_vpu_ctrl_find_entity(ctrl, entity))
+		goto exit;
+
+	list_del_init(&entity->list);
+	if (list_empty(&ctrl->entities)) {
+		if (!entity->read_reg(entity->dev, W6_VPU_VCPU_CUR_PC))
+			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		else
+			wave6_vpu_ctrl_sleep(ctrl, entity);
+	}
+
+	if (!pm_runtime_suspended(ctrl->dev))
+		pm_runtime_put_sync(ctrl->dev);
+exit:
+	mutex_unlock(&ctrl->ctrl_lock);
+}
+EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_put_sync);
+
+int wave6_vpu_ctrl_wait_done(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	int ret;
+
+	if (!ctrl)
+		return -EINVAL;
+
+	if (ctrl->state == WAVE6_VPU_STATE_OFF)
+		return -EINVAL;
+
+	if (ctrl->state == WAVE6_VPU_STATE_ON)
+		return 0;
+
+	ret = wave6_wait_event_freezable_timeout(ctrl->load_fw_wq,
+						 wave6_vpu_ctrl_get_state(dev) ==
+						 WAVE6_VPU_STATE_ON,
+						 msecs_to_jiffies(W6_BOOT_WAIT_TIMEOUT));
+	if (ret == -ERESTARTSYS || !ret) {
+		dev_err(ctrl->dev, "fail to wait vcpu boot done,ret %d\n", ret);
+		mutex_lock(&ctrl->ctrl_lock);
+		wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
+		mutex_unlock(&ctrl->ctrl_lock);
+		return -EINVAL;
+	}
+
+	mutex_lock(&ctrl->ctrl_lock);
+	wave6_vpu_ctrl_boot_done(ctrl, 0);
+	mutex_unlock(&ctrl->ctrl_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_wait_done);
+
+int wave6_vpu_ctrl_get_state(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	if (!ctrl)
+		return -EINVAL;
+
+	return ctrl->state;
+}
+EXPORT_SYMBOL_GPL(wave6_vpu_ctrl_get_state);
+
+static void wave6_vpu_ctrl_init_reserved_boot_region(struct vpu_ctrl *ctrl)
+{
+	if (ctrl->boot_mem.size < WAVE6_CODE_BUF_SIZE) {
+		dev_warn(ctrl->dev, "boot memory size (%zu) is too small\n", ctrl->boot_mem.size);
+		ctrl->boot_mem.phys_addr = 0;
+		ctrl->boot_mem.size = 0;
+		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
+		return;
+	}
+
+	ctrl->boot_mem.vaddr = devm_memremap(ctrl->dev,
+					     ctrl->boot_mem.phys_addr,
+					     ctrl->boot_mem.size,
+					     MEMREMAP_WC);
+	if (!ctrl->boot_mem.vaddr) {
+		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
+		return;
+	}
+
+	ctrl->boot_mem.dma_addr = dma_map_resource(ctrl->dev,
+						   ctrl->boot_mem.phys_addr,
+						   ctrl->boot_mem.size,
+						   DMA_BIDIRECTIONAL,
+						   0);
+	if (!ctrl->boot_mem.dma_addr) {
+		memset(&ctrl->boot_mem, 0, sizeof(ctrl->boot_mem));
+		return;
+	}
+
+	dev_info(ctrl->dev, "boot phys_addr: %pad, dma_addr: %pad, size: 0x%zx\n",
+		 &ctrl->boot_mem.phys_addr,
+		 &ctrl->boot_mem.dma_addr,
+		 ctrl->boot_mem.size);
+}
+
+static int wave6_vpu_ctrl_thermal_update(struct device *dev, int state)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (wave6_cooling_disable || !ctrl->dev_perf || state > ctrl->thermal_max || !ctrl->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(ctrl->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(dev, "receive cooling set state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(ctrl->dev_perf, new_clock_rate);
+	dev_dbg(dev, "clk set to %lu\n", clk_get_rate(ctrl->clks[ctrl->clk_id].clk));
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(dev, "failed to set perf to %lu (ret = %d)\n", new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				       unsigned long *state)
+{
+	struct vpu_ctrl *ctrl = cdev->devdata;
+
+	*state = ctrl->thermal_max;
+
+	return 0;
+}
+
+static int wave6_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+				       unsigned long *state)
+{
+	struct vpu_ctrl *ctrl = cdev->devdata;
+
+	*state = ctrl->thermal_event;
+
+	return 0;
+}
+
+static int wave6_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+				       unsigned long state)
+{
+	struct vpu_ctrl *ctrl = cdev->devdata;
+	struct wave6_vpu_entity *entity;
+
+	ctrl->thermal_event = state;
+
+	list_for_each_entry(entity, &ctrl->entities, list) {
+		if (entity->pause)
+			entity->pause(entity->dev, 0);
+	}
+
+	wave6_vpu_ctrl_thermal_update(ctrl->dev, state);
+
+	list_for_each_entry(entity, &ctrl->entities, list) {
+		if (entity->pause)
+			entity->pause(entity->dev, 1);
+	}
+
+	return 0;
+}
+
+static struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_cooling_get_max_state,
+	.get_cur_state = wave6_cooling_get_cur_state,
+	.set_cur_state = wave6_cooling_set_cur_state,
+};
+
+static void wave6_cooling_remove(struct vpu_ctrl *ctrl)
+{
+	int i;
+
+	if (!ctrl->pd_list)
+		return;
+
+	thermal_cooling_device_unregister(ctrl->cooling);
+
+	kfree(ctrl->freq_table);
+	ctrl->freq_table = NULL;
+
+	for (i = 0; i < ctrl->pd_list->num_pds; i++) {
+		struct device *pd_dev = ctrl->pd_list->pd_devs[i];
+
+		if (!pm_runtime_suspended(pd_dev))
+			pm_runtime_force_suspend(pd_dev);
+	}
+
+	dev_pm_domain_detach_list(ctrl->pd_list);
+	ctrl->pd_list = NULL;
+	ctrl->dev_perf = NULL;
+}
+
+static void wave6_cooling_init(struct vpu_ctrl *ctrl)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = (const char *[]) {"vpumix", "vpuperf"},
+		.num_pd_names = 2,
+	};
+	int ret;
+	int i;
+	int num_opps;
+	unsigned long freq;
+
+	ctrl->clk_id = -1;
+	for (i = 0; i < ctrl->num_clks; i++) {
+		if (!strcmp("vpu", ctrl->clks[i].id)) {
+			ctrl->clk_id = i;
+			break;
+		}
+	}
+	if (ctrl->clk_id == -1) {
+		dev_err(ctrl->dev, "cooling device unable to get clock\n");
+		return;
+	}
+
+	ret = dev_pm_domain_attach_list(ctrl->dev, &pd_data, &ctrl->pd_list);
+	ctrl->dev_perf = NULL;
+	if (ret < 0)
+		dev_err(ctrl->dev, "didn't attach perf power domains, ret=%d", ret);
+	else if (ret == 2)
+		ctrl->dev_perf = ctrl->pd_list->pd_devs[DOMAIN_VPU_PERF];
+	dev_dbg(ctrl->dev, "get perf domain ret=%d, perf=%p\n", ret, ctrl->dev_perf);
+	if (!ctrl->dev_perf)
+		return;
+
+	num_opps = dev_pm_opp_get_opp_count(ctrl->dev_perf);
+	if (num_opps <= 0) {
+		dev_err(ctrl->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		goto error;
+	}
+
+	ctrl->freq_table = kcalloc(num_opps, sizeof(*ctrl->freq_table), GFP_KERNEL);
+	if (!ctrl->freq_table)
+		goto error;
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(ctrl->dev_perf, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(ctrl->dev, "[%d] = %ld\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		ctrl->freq_table[i] = freq;
+		ctrl->thermal_max = i;
+	}
+
+	if (!ctrl->thermal_max)
+		goto error;
+
+	ctrl->thermal_event = 0;
+	ctrl->cooling = thermal_of_cooling_device_register(ctrl->dev->of_node,
+							   (char *)dev_name(ctrl->dev),
+							   ctrl,
+							   &wave6_cooling_ops);
+	if (IS_ERR(ctrl->cooling)) {
+		dev_err(ctrl->dev, "register cooling device failed\n");
+		goto error;
+	}
+
+	return;
+error:
+	wave6_cooling_remove(ctrl);
+}
+
+static int wave6_vpu_ctrl_probe(struct platform_device *pdev)
+{
+	struct vpu_ctrl *ctrl;
+	struct device_node *np;
+	const struct vpu_ctrl_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
+		return ret;
+	}
+
+	res = of_device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	mutex_init(&ctrl->ctrl_lock);
+	init_waitqueue_head(&ctrl->load_fw_wq);
+	INIT_LIST_HEAD(&ctrl->entities);
+	INIT_LIST_HEAD(&ctrl->buffers);
+	dev_set_drvdata(&pdev->dev, ctrl);
+	ctrl->dev = &pdev->dev;
+	ctrl->res = res;
+	ctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->reg_base))
+		return PTR_ERR(ctrl->reg_base);
+	ret = devm_clk_bulk_get_all(&pdev->dev, &ctrl->clks);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+
+	ctrl->num_clks = ret;
+
+	np = of_parse_phandle(pdev->dev.of_node, "boot", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			ctrl->boot_mem.phys_addr = mem.start;
+			ctrl->boot_mem.size = resource_size(&mem);
+			wave6_vpu_ctrl_init_reserved_boot_region(ctrl);
+		} else {
+			dev_warn(&pdev->dev, "boot resource is not available.\n");
+		}
+	}
+
+	ctrl->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (ctrl->sram_pool) {
+		ctrl->sram_buf.size = ctrl->res->sram_size;
+		ctrl->sram_buf.vaddr = gen_pool_dma_alloc(ctrl->sram_pool,
+							  ctrl->sram_buf.size,
+							  &ctrl->sram_buf.phys_addr);
+		if (!ctrl->sram_buf.vaddr)
+			ctrl->sram_buf.size = 0;
+		else
+			ctrl->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								   ctrl->sram_buf.phys_addr,
+								   ctrl->sram_buf.size,
+								   DMA_BIDIRECTIONAL,
+								   0);
+
+		dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
+			 &ctrl->sram_buf.phys_addr, &ctrl->sram_buf.dma_addr, ctrl->sram_buf.size);
+	}
+
+	if (of_find_property(pdev->dev.of_node, "support-follower", NULL))
+		ctrl->support_follower = true;
+
+	wave6_cooling_init(ctrl);
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static void wave6_vpu_ctrl_remove(struct platform_device *pdev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	wave6_vpu_ctrl_clear_buffers(ctrl);
+	wave6_cooling_remove(ctrl);
+	if (ctrl->sram_pool && ctrl->sram_buf.vaddr) {
+		dma_unmap_resource(&pdev->dev,
+				   ctrl->sram_buf.dma_addr,
+				   ctrl->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(ctrl->sram_pool,
+			      (unsigned long)ctrl->sram_buf.vaddr,
+			      ctrl->sram_buf.size);
+	}
+	if (ctrl->boot_mem.dma_addr)
+		dma_unmap_resource(&pdev->dev,
+				   ctrl->boot_mem.dma_addr,
+				   ctrl->boot_mem.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+	mutex_destroy(&ctrl->ctrl_lock);
+}
+
+#ifdef CONFIG_PM
+static int wave6_vpu_ctrl_runtime_suspend(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ctrl->num_clks, ctrl->clks);
+	return 0;
+}
+
+static int wave6_vpu_ctrl_runtime_resume(struct device *dev)
+{
+	struct vpu_ctrl *ctrl = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(ctrl->num_clks, ctrl->clks);
+}
+#endif
+
+#ifdef CONFIG_PM_SLEEP
+static int wave6_vpu_ctrl_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int wave6_vpu_ctrl_resume(struct device *dev)
+{
+	return 0;
+}
+#endif
+static const struct dev_pm_ops wave6_vpu_ctrl_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_ctrl_runtime_suspend, wave6_vpu_ctrl_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_ctrl_suspend, wave6_vpu_ctrl_resume)
+};
+
+static const struct of_device_id wave6_ctrl_ids[] = {
+	{ .compatible = "nxp,imx95-wave633c-ctrl", .data = &wave633c_ctrl_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_ctrl_ids);
+
+static struct platform_driver wave6_vpu_ctrl_driver = {
+	.driver = {
+		.name = VPU_CTRL_PLATFORM_DEVICE_NAME,
+		.of_match_table = of_match_ptr(wave6_ctrl_ids),
+		.pm = &wave6_vpu_ctrl_pm_ops,
+	},
+	.probe = wave6_vpu_ctrl_probe,
+	.remove = wave6_vpu_ctrl_remove,
+};
+
+module_platform_driver(wave6_vpu_ctrl_driver);
+MODULE_DESCRIPTION("chips&media VPU WAVE6 CTRL");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.h
new file mode 100644
index 000000000000..21cfd1d2e7d4
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 control driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CTRL_H__
+#define __WAVE6_VPU_CTRL_H__
+
+#include <linux/device.h>
+
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+struct wave6_vpu_entity {
+	struct list_head list;
+	struct device *dev;
+	u32 (*read_reg)(struct device *dev, u32 addr);
+	void (*write_reg)(struct device *dev, u32 addr, u32 data);
+	void (*on_boot)(struct device *dev);
+	void (*pause)(struct device *dev, int resume);
+	bool booted;
+};
+
+int wave6_alloc_dma(struct device *dev, struct vpu_buf *vb);
+void wave6_free_dma(struct vpu_buf *vb);
+int wave6_vpu_ctrl_resume_and_get(struct device *dev, struct wave6_vpu_entity *entity);
+void wave6_vpu_ctrl_put_sync(struct device *dev, struct wave6_vpu_entity *entity);
+int wave6_vpu_ctrl_get_state(struct device *dev);
+int wave6_vpu_ctrl_wait_done(struct device *dev);
+int wave6_vpu_ctrl_require_buffer(struct device *dev, struct wave6_vpu_entity *entity);
+bool wave6_vpu_ctrl_support_follower(struct device *dev);
+#endif /* __WAVE6_VPU_CTRL_H__ */
-- 
2.31.1


