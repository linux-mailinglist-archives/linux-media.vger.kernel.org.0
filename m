Return-Path: <linux-media+bounces-41310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E9B3B642
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AA2B171F1C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192372BE03E;
	Fri, 29 Aug 2025 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FQOPwfpA"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022100.outbound.protection.outlook.com [40.107.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F329D292;
	Fri, 29 Aug 2025 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457258; cv=fail; b=BiuAyfrpijcyYcEKLN/qWZkmCs/Hz/v/6DlKhHIU5Wja97udwSsXVOChFvDkmjdWgmqdWetYqhB2MteF2siFGoC87XJtkkfjYSXJ2LJUxzvFQFi/OrbwkDZbsVYr0aCvIfPlImzxhvNYz1R1s+72XHCLwFfiDG+w6cnrUPRIhtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457258; c=relaxed/simple;
	bh=Kk5hdtfWPY2taZqMHvwtLxywhK6/wEazvvbYLgCq1MU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MvMXznnQK0i+hLTemNKjpmC0wF0YnUhTnT2OquT3q8pxvKSv463qrLcZyILfeUQc9q7ZxXdhKgRPpWzKLr+XY9TIUqFxagrcbrKHnLT3zMQ7hhlGbPDKQcVnIYKeJC08Cc4ScH/YuJDbIBKiIl2qufFTjTd89MJeWrdZKn5jAcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FQOPwfpA; arc=fail smtp.client-ip=40.107.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxgHAAVEbLojsRMYu4isgRqxoTwd3U6edpK0tMl5E0AzBnuVDb+UEZWr9Sd4Z1grKNvjcr539eTiRZkxpd7qxnRHbQSySIWHSp893Z/UV5KijcT7lEAD6NZZehh+llzh61vwVSmnjS8OLhFNtIwsaofxfh/HEMdt6zoCsH0QQb22E7oHo+HIAFa1UNBOkuPMezVk4gB0xihXy1u9GaMAB2K5QDtIYygCYVg/yVGCZpN4ztMbCBhGJj3gY9hfJO3M9P4gnpvlg54SObio5CR3kRYkyC1OY/avuTB8NSYGVMmvI975tnh4E6ii0o3QsJivCbrJWtzIG0eh8OdiaLC2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gI7UdQs6MkN/StlPu0C26PRVIujRUlGNMmTYFFsxvdw=;
 b=UupN9yEXhpvkTbfyUKmlCgpCozGriDrIlMbyxh482xEIppJfSkvqijewa7w5ngYgHKNkIdbSoDwzqlv2Ya+X4n0VhZlalm6QqUupoMivlpuoZvopURIDUHovTLNz8oeqIG20W1DcdNtI4rJNkmxVOvcCIxmCyl13pn+0n/zFVv/J0J0SsddkG0HdU/tkBRy13yGu5PLAJgcgBWU60MION/SEU9I8Ai3QFGg3axqxqr0wjHeTFtd9snwhGIISRknCBMtS/tmCgKEODhwnx09i1BxjCWoWu+aBhxBJAPVMRocECVF0JkIhUhs1AV3oBWbKVVCKxoDdYfNRsni3p9wyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gI7UdQs6MkN/StlPu0C26PRVIujRUlGNMmTYFFsxvdw=;
 b=FQOPwfpAXnS1j1aNZ6cyTnn2oBB8j11TgMCY6hzg5J/hv60QL+fMMKaM0SRphZVZb4tI3OR6t4C14pYuQhJBN0jQ1mau9enyrZPDtxE5oNIDnI2t3FckcHN4nCC2akdFZCw/yAF3bg8RQRWe4aBhLQjybRfMRESsdBg+m7lEJs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB3039.KORP216.PROD.OUTLOOK.COM (2603:1096:101:283::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:26 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:26 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v3 5/9] media: chips-media: wave6: Add Wave6 core driver
Date: Fri, 29 Aug 2025 17:46:45 +0900
Message-Id: <20250829084649.359-6-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250829084649.359-1-nas.chung@chipsnmedia.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB3039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5287b7-db2f-4132-a502-08dde6d8ad54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eaIdVOHc/KZQbj7b9JdsNH2d+fBokJVNBegy+h+LDilukLhglhuBL3JoWLT5?=
 =?us-ascii?Q?NNinWb5oTSI5gwmaOWO21Ot+mA6xyxjsgtbZ4CfILK55v0cftyhvasJZiAaL?=
 =?us-ascii?Q?Augk3OPGXFygub1OGKFdy6boQAOLA0rLYCD+lkVRiLU15/A+oU3uKHw06SiD?=
 =?us-ascii?Q?kAeXOvnx4vSSAOzeKiyi4OCYdGWSl+/eFHa4m/ttP0EtUevyuXh/ROc6LnCv?=
 =?us-ascii?Q?6+FYui3qWCrwh04qxC9zINQ43S55ruoM40gsvv86Kob94OrpTx7I8gR1uahE?=
 =?us-ascii?Q?i+pnGBy8ZNSD4QcRS0Kv7dI9fjXzVDAS7M+whyM5hLcaDIwUoG8Mvc7vlRHq?=
 =?us-ascii?Q?fJrjPcTHXnVTrsjgl/j85cH2LAGp4q5LzOfNkYEx98IzT7XcEBnfhFUPvYzV?=
 =?us-ascii?Q?GBjwQ52O7VMYl6CEYpv+FNCktMMv6ztsUEDZeivjNG5Xr3dEUR6aEZcRvCQH?=
 =?us-ascii?Q?5UAdMWI+YmGHrdjUPZ07m6wvsLK8bKuiFoI0tZO4IpN0mSCh6YI6LYCf/E6Y?=
 =?us-ascii?Q?5c3YpRdS4ks6nlsV/SMexf7MNRrDGJC5YDreb8QaW8obtxkf4KyEFxL/EJMi?=
 =?us-ascii?Q?vVC902R30LGEpBLZRjtZOq4OmiLJHxIXMkjaJEpegkOorlHXUm/7EEaUtSOl?=
 =?us-ascii?Q?PhFWVrnfKwxsqrnFcZy9CcedQevA0RR1SQ5P/MjmoYh470ADZtjISMocUN85?=
 =?us-ascii?Q?0UofWy1isRl9MxKGLnCLoJmb10Jt2kXkDCl5VhVOFiUsxUEyigCi7fytJpkr?=
 =?us-ascii?Q?+6MiLlWAhcfuT55jYrkZXBGKn3c02GpKPmLrOnOguUIUupcshgjFeZ/V11Po?=
 =?us-ascii?Q?9JTVQLrtH6LkeLfbMPADhiA3luruhUyNZla8/NfXn8oce7piGAtoDbGDjrD0?=
 =?us-ascii?Q?e2tIFDyT3HGkv/mP34JGWX3CX3gtAXTwZEhUKRvMadbNwOKQWAKlYJ7nukhM?=
 =?us-ascii?Q?aAg4EzflAO2AWM4uxf9n9OuCnB2cV9o9YR6jmRXXmlxgtHDB+PQGPL0Ky8M/?=
 =?us-ascii?Q?w/vJHlos5AaN70kUWAM7N9TjyPtsTzIj4k9fgdYWeEDrTEbOAiSVcI9OwjqE?=
 =?us-ascii?Q?h0659EfGZvMEDkztQeXrIN6gFaFBY55U/mGyTD7+N26JOIdUkx7H3mKaecEk?=
 =?us-ascii?Q?3bhNWspB9gj21lTX99AOYcxc+jtGjPylISsGAhpdi3rxt2FDCxM3NDGU9T+M?=
 =?us-ascii?Q?yqWCMmvpBKmKd8vSyEiLJ1t3h564dxXfO0+2TyprHkVFqcCtsJ4EH87poXd3?=
 =?us-ascii?Q?pDjX1N+esVt0uTpo731tXNvBjUt8uOKO0ce4+S096A1/oONpzyge8lkry68L?=
 =?us-ascii?Q?q+6ev2HnqBVva2xSpwzePOwxWaGGCFXBMkYpu3sILPNEyd4s7y2Zi9ykhFCL?=
 =?us-ascii?Q?ML3XvUmHtUc74umapl12zRP5Ji7coV/Mh2gOehS0CKy09iBx/aJto0p8Sehy?=
 =?us-ascii?Q?kPQNxycQtkA9GaVYn2HHvw6j0/HkyobJ0mPLKPP5ucKQst+h/hcYzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8KgLRGaRwkFG3xnY+l5SM9FDrPz2dhQ6Qo8f8wziajmqVIJHrLXbhiPs+bqA?=
 =?us-ascii?Q?iEu8VbOXgvPFcx3ejl/xkEfBcN3E0Gy480YHvcmsW8pMbXX9h8CpG1HzjHhe?=
 =?us-ascii?Q?HdZkYfm5gcRgiHxuSRU0Ocwb+pmiYfxqI9/BC1kcO+qGxazkh7+myi9WXWCo?=
 =?us-ascii?Q?9a3/GpAASk4YTMriiOhEPDlOCwrr1LuRPIICFl6U7FOH04h1JJfFXivdH1ct?=
 =?us-ascii?Q?ZlkJ4hUVHObik1535IJXWBsNtD+DIWWmC9gOW7R75bmyfO22bJSMpxPAlD0u?=
 =?us-ascii?Q?aCIkrQTn9Q+Nb9+kq1xOV/2s4tAb2Z8QiEbDqfJBPsB1kA+/L18ZtsHwwLMf?=
 =?us-ascii?Q?a7QzQtlw105YII6XQpFyddG4Lbvz2sEbwq7PmgFMgTFHImPEBWavhw1+8/aD?=
 =?us-ascii?Q?arMMk6rayeF5AMF+w6fflCqZBcntdxeklX452toK40emb6XkmyS/f5/U0z1K?=
 =?us-ascii?Q?fZY2svkvOAn2EGaaKrnpWfV7pxgUUpLReAj3/MStpg/tbLtFKKKiQB+ZFFF5?=
 =?us-ascii?Q?qgLbPMUsKOj+AjtRvC+2F1uo0O4ilXipiQchzjoetbHXetbvqGmhhx6iEmfK?=
 =?us-ascii?Q?J4rVnrl7jAzunJyL14y/ewoC0v40nxdzn/nEEd9vC+uKVL1P7444PBBfqtjk?=
 =?us-ascii?Q?e0l0NgxE1aO5dKY/7cx5i6tpmjzfe0OHPS0CqlCc7Ia2IsEBaBHhP4oUrBs/?=
 =?us-ascii?Q?Y3Y7iW6OIrRyqmxhi91HkZuUVAUECU+O48kBaE1Wq2BkEl2gn5KmE35ecVMy?=
 =?us-ascii?Q?m/X5YjIYVbmiBflhWExqM7D5hF0zFWadKlWUWFI4pMKwTJRQtjeQQXeK3m3D?=
 =?us-ascii?Q?qTPJ5SaWnmkCWh5fvUuzHHsDsf/aJMo3etCWe9B/DP/fsyv4apLXSVEnUw6I?=
 =?us-ascii?Q?qg5JYfMCP6bW5bIYql30B8TrfGeqbglVorOa9+SGNB4wf9LzQGIy4w/W89TO?=
 =?us-ascii?Q?6nDZ4hXMYSbGVEjyLSVHTCxsluQH3y9Y5hqZS+TcOJSg385Prj7VkqgbNcXV?=
 =?us-ascii?Q?6KbYRxXk+/s7aArqhAA/sBWUL2SL5ku+UwShOUmCwkiDueum9WuesspEg9tG?=
 =?us-ascii?Q?nnB7iiV8jc+24sbfy8qqTgF1dGx/d8lQ4ePbq4QXUZcAN5r/JBA5DBoOsqZo?=
 =?us-ascii?Q?Q7RdmrRZdhUMaC7QsZYRHJcpQPvFnRCKp4Y/Yzvv+ipZjgwdnQQ1R4swJPhV?=
 =?us-ascii?Q?SA5Ukx7MvQ8i0K9MtGbVIvrt01RFwFPW4zuaJcjSi0+aOH3kS1MCU20R5Dcf?=
 =?us-ascii?Q?9d/R4KWuCHuktu5aGRTqvXuz+b+KVNUcHSX6ik7Tv4H4vlv/0POdGcpMKnZV?=
 =?us-ascii?Q?CjUKxn+L4ttvef7mQI4VeK+IuwTdZvVdn/DyivEWiH1Q69BqItnPMsutcDzV?=
 =?us-ascii?Q?r2HI1JQz8sjhdPwqQim28t9E/PLLtr363sakO/ZtZVFr4Dcxbva2fXgFsoAq?=
 =?us-ascii?Q?YbKJAizNnSFsuZle+JjAz64vEEcmjTHRTZhNQcvqRNyiM4y4BgBUO/xEpL63?=
 =?us-ascii?Q?N5F3RdazyZwpLfSyzCdMBVjRCxApunO+XUlkInhqU2dC6nOmHLRXjA9XiB6U?=
 =?us-ascii?Q?YHSwJub/s5HD0nCGgzY2Hdl4HxSzbJVeEaKUZCS6XkRa0wH4szWsEtiDN0DQ?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5287b7-db2f-4132-a502-08dde6d8ad54
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:25.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cs+N2RR2cCbQvrpym8tPQGRxWXT4s15TC4dsouFvtvJdAnRPk86DHTwinle0b0zGfIa6vpLHa4Xc+3R0S9MKSDPrMDV99Yb5e34zdLTSzZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3039

This adds the core driver for the Chips&Media Wave6 video codec IP.

The core region provides the encoding and decoding capabilities of
the VPU and depends on the control region for firmware and shared
resource management.

This driver configure the v4l2 m2m video device and handles
communication with the Wave6 hardware to perform video processing tasks.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../chips-media/wave6/wave6-vpu-core.c        | 406 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 133 ++++++
 2 files changed, 539 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..35c749ab1a14
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,406 @@
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
+	u32 irq_status;
+
+	if (vpu_read_reg(core, W6_VPU_VPU_INT_STS)) {
+		irq_status = vpu_read_reg(core, W6_VPU_VINT_REASON);
+
+		vpu_write_reg(core, W6_VPU_VINT_REASON_CLR, irq_status);
+		vpu_write_reg(core, W6_VPU_VINT_CLEAR, 0x1);
+
+		trace_irq(core, irq_status);
+
+		kfifo_in(&core->irq_status, &irq_status, sizeof(int));
+
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void wave6_vpu_core_response_work_buffer(struct vpu_core_device *core)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(core->dev);
+	if (ret)
+		return;
+
+	if (core->vpu)
+		core->vpu->req_work_buffer(core->vpu, core);
+
+	pm_runtime_put_sync(core->dev);
+}
+
+static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_instance *inst;
+	int irq_status, ret;
+
+	while (kfifo_len(&core->irq_status)) {
+		bool error = false;
+
+		ret = kfifo_out(&core->irq_status, &irq_status, sizeof(int));
+		if (!ret)
+			break;
+
+		if (irq_status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+			wave6_vpu_core_response_work_buffer(core);
+			continue;
+		}
+
+		if ((irq_status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&core->irq_done);
+			continue;
+		}
+
+		if (irq_status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		inst = v4l2_m2m_get_curr_priv(core->m2m_dev);
+		if (inst && inst->ops && inst->ops->finish_process)
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
+	if (!res) {
+		dev_err(&pdev->dev, "missing resource\n");
+		return -EINVAL;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
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
+	init_completion(&core->irq_done);
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
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+	core->num_clks = ret;
+
+	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "v4l2_device_register fail: %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(core);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "failed to get irq resource\n");
+		ret = -ENXIO;
+		goto err_m2m_dev_release;
+	}
+
+	ret = kfifo_alloc(&core->irq_status, 16 * sizeof(int), GFP_KERNEL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_m2m_dev_release;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					wave6_vpu_core_irq,
+					wave6_vpu_core_irq_thread,
+					0, "vpu_irq", core);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to register interrupt handler: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "alloc temp of size %zu failed\n",
+			core->temp_vbuf.size);
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
+			dev_err(&pdev->dev, "wave6_vpu_dec_register_device fail: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (core->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev, "wave6_vpu_enc_register_device fail: %d\n", ret);
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
+	kfifo_free(&core->irq_status);
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
+	kfifo_free(&core->irq_status);
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


