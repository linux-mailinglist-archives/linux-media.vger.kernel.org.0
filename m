Return-Path: <linux-media+bounces-41313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1BB3B64D
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BF901C867FD
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD32D47E7;
	Fri, 29 Aug 2025 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JQYQlw+G"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021107.outbound.protection.outlook.com [40.107.42.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3F22D24A3;
	Fri, 29 Aug 2025 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457262; cv=fail; b=oSkYyarGVUMKeb+48NzVgemrbti4mSess1MGMCCjetbVjBRl/7sGReHlBUuXWWkYwAV+6AsWuUTlr3ET+DJbs/wl++v4AsKecJLBF1bcsVlRaSe0xjWBWIrTomX2oq8QiUIPz7YgNF28lZEIS+WIFnT0Bt5ZQJ0pZlYrJpsiy4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457262; c=relaxed/simple;
	bh=XhezRNAHpEgLkV9wxz6Vd35WKgUtrd0452mgZIkGe+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pGA3KngITRaWexHEaDfj341xVmEGfwZFTL7G1/eWh3fk9J8ixcp68g9HxNSSesnc7qFgVG29lzf0hG1rtBejS7G8Wp6QE7mwBcLBoELZ8FKwySV5J8aZBaFShKa9TrSXq4h+GM9tyjuMimTaJZ3M5/iizL9MPEovpqMlIR6sLEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JQYQlw+G; arc=fail smtp.client-ip=40.107.42.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laD8rksqIzp1JUnKKp3HuPhnRkV0pQcM4wAVUl5ykbMuV1sFxQgiuZoX8/7v/t7ILiD7Sxg7zh1CusAWYLHJk1dHR9/zMQvemKK5pER4AHDqtg6aXx7Vr2grB4TOAvvY5ypUn5a89k+6N06uaeKj9+xKB9ESkcvaDSnlKsOJjlrHL+CZIYxBvgcUuVEJvg/DGvMhB/AOLBHANyyOqXVFFGthbnRENWcFDHDWf7n1A6ErTstALHyxs1kwlsJyRt4JUZmz2UWLQ5bF3I0bkAgrh+3l9rbszTVL8eXaILvoROdZSvB4nhURt30WpzUHe8XRwlNzpUyoKIrRdxAcDzMG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV69FUYmoQRDQAafKu8BYMZYVQLHG2Bw+oDc965awoc=;
 b=j0tmXIIDBwIKlwgXNEOY6ZMZC/RLH8fvTtIpPftwOJC2tkAYok90fkVX705sE65D5mN+Cgj4fAw3cRLi7S51WjNQcbUtNHGhbFhuTDib+A8aRMdjaR03Sq3IPBm8WlJPoU0mAvXV1aESicz8FEt2/VDIpet4JpdHsXMYvVrLzFD3oGTAtabd20GEZ+vAwtfuboxLIwUcFDCjiJYKS3qwjEgP3de+s3mYK7KHKB+9TeRdcRlZR/mWeI0HVy5+PkdtHB4LyxXauEYlGE/6fKpVy9AxfyjWSTxBgQKdeJ0mbnPYINXJab7R0L6SObyvRuY9SPPpexn2fSH9wTZaxStMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV69FUYmoQRDQAafKu8BYMZYVQLHG2Bw+oDc965awoc=;
 b=JQYQlw+GWu4X6eDt1FsobnZPxYyfqKctQuTqz8ElIChSsIC0wYHcQFvTh5VhcpV7we5DkTtFA5e6hdV2OWcKpdHZtD6oLckldzBueuyQKSUE2dT+6GgbiBxmMcwgcmGzuonJP1dWRDQtkI0GhjktgJjzlKsicFDXLFhZgRwgjH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB3039.KORP216.PROD.OUTLOOK.COM (2603:1096:101:283::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:27 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:27 +0000
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
Subject: [PATCH v3 7/9] media: chips-media: wave6: Add Wave6 thermal cooling device
Date: Fri, 29 Aug 2025 17:46:47 +0900
Message-Id: <20250829084649.359-8-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: eaae15d5-8dae-4185-6ace-08dde6d8ae47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Kq4DjyDMOm+OWSlXUbA6qexGt68Et2y+W6Q5SolKlus5R6oF7Fvmv2ryPAp?=
 =?us-ascii?Q?0CWFT5xya7OWaI4pLKxJj7urwaFarIHylmpzj/K8EpwTPcSdK5t4/zOdyhnS?=
 =?us-ascii?Q?gyL6mXu3lMGmxO2A9I542SiEiNE6aIY3MjaLBJrPE9eJxtQGW+rTiO7ifbN6?=
 =?us-ascii?Q?aLbgBINESVR84eTP0ggENb9O4RDSOQdbsHdd4dzH6SJnmXfpWKxUO5eMLSfv?=
 =?us-ascii?Q?2SYDqmwUdm07t0i1xjGeFX2d9P8Z84oCzyO5OUNdkmYcJYAFw0Bj1XC1PXIQ?=
 =?us-ascii?Q?EbjxaNbd24PZZs+zDXaTpTDxg/ATVWBC0uyXUxsHx9edk65N5nFdGL0IrD+C?=
 =?us-ascii?Q?vLvkSDdcsKzTe0RGy/2pPfYwBDjzYwzqg3KO/Hyd4b7D1RHRfcvXL7mvRJSX?=
 =?us-ascii?Q?tp6tn8Qm2V8wIqCVJCa9i3efbIxCN6ORUoQhzM1/uhJM946nRzphQP41wVHS?=
 =?us-ascii?Q?TIO0iOcNPpADByuXWLSsE2qk6+vt5OCQr+J5ZXFAKubgRBlpPDHurz42cRbD?=
 =?us-ascii?Q?RrRUgwEyvhtSoH4aNmXozUgP9mtaFt/CKTN2ZF0OhQ03wWBaNTNpqddL6tIl?=
 =?us-ascii?Q?MY2zi+XWc9OnOOTImPSXDaJuIGIf9lunXY2w+LkqiBf5vAVFxd1J520l/03i?=
 =?us-ascii?Q?ow25RzbBI7lUqCWMhtYb7Imyy73BYFmrKz4DDyxltEGGXe5CB7Go+otOJfj1?=
 =?us-ascii?Q?xLKrDXVGUUP/grxVi4YTOwzQMDxGqDRwaCUwGM9ISpD2EeB9vmVmlt/UYvQK?=
 =?us-ascii?Q?5QHfmADPHCYpfNSXmNvTo2GUezvVn0mgk2ksJzn6oljbIr4NZ4wCvsOU5dDx?=
 =?us-ascii?Q?wBzo9gJGIIrfB1PtWjexk566lC3kM6Qb2Rrun5AxxbCjxwh+j2HT1sVPvbdt?=
 =?us-ascii?Q?dnXqf3whkK3mL4zMKehIDz1q3drM+qJoIT4ykJHmoRZlxWTYOQCJtq++VeYu?=
 =?us-ascii?Q?Cw0b5XZdV3QiFMjgx3mIUqRM9IPP2M+QogcytiTrbaokmpa0ACX41T+MnLgd?=
 =?us-ascii?Q?7jogaTee6yV5qR9ymN6u/YYDQKiO04aWfXicbCEpLoaGHtA1FZe1KEAdP6FL?=
 =?us-ascii?Q?aT4jwabuhe2D5RfWMCJL4+Mi7oj7E7dnRqb2HRGQIOIe562kdii7LikzeRn3?=
 =?us-ascii?Q?PBNNs4YQsuF4IF2IDVjhQ2U9EUQxqjr/mWOWVh+owFu87UN8dh6wcD4mXtku?=
 =?us-ascii?Q?oV/WDtHv1xGjnRHv0a6g6wPGznb0vCO53zgc1jnvtpZeGK/l6piRHL5T/XId?=
 =?us-ascii?Q?uMrAiR0IdHHDUPSnjdnfjty0+S8og15r21IdO6W6ynfIABbrJi/kLV1Gl5HY?=
 =?us-ascii?Q?oYYzC455M+O5a0MTuuWYC74AIT1shOJmO8t3z/2arT5NycLn4huoav3sxIyB?=
 =?us-ascii?Q?AhKRXuc2lOEm6DVvnYTcv080RmcbzklVfbK6/ktNV/MQzeBHZNgbws2lzk9W?=
 =?us-ascii?Q?YfP6oEdb8WX0O6DUBTlXGzrnYScQ++Uz8YL33B1QiZtZ7FWWrVj3cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tqRDCq5IAYCSMMouTLAerJhDKQg+8B56HDykncPwgbriMGwhkWLNq1qDzVer?=
 =?us-ascii?Q?IioAS/r4dxVx+rw3wxOhtqoLjV5cy+Mk0EjjX1XHrTXNxX5VO7HdyTE33HZJ?=
 =?us-ascii?Q?f2xlnaRWTSV1J3IBCQI+ZePnCEdwMWkTJU1nzZh1qXZRv/Sj+Byp82BqXMOA?=
 =?us-ascii?Q?ix2soe0uJPSkiC8trBDcfjB4OnLLXi/GcxM3yI7ONsOFDMScLY/TxTu9t5am?=
 =?us-ascii?Q?XZvUx3Pb57q+yQYhgH3lRT2nVgH8O8q0RNeeJufDNNbU3I2JHuEX4jmWnTR8?=
 =?us-ascii?Q?tXZgfz88ur4nt0b95axK+nLzY80R4U5DFbctk72zgAQSZfVj64IT11pz+dkg?=
 =?us-ascii?Q?zuHQSqOZs330LvvOeSmIU1dw/hFPMHnTvr777IIUEFvtleIbCLtTOHNDitR1?=
 =?us-ascii?Q?OfXKXic7BOIyd8QdL/NXpH7Ji+Qq0Q4N/liLLVgqTFODNF/ZBWOaSOuhYDYJ?=
 =?us-ascii?Q?bVQi6fsGBTKB8jOQ78rsosnJI9MD+1pLFbQ8Lmd9tjhdMjAuw8t2dZxDzXiX?=
 =?us-ascii?Q?fd6ywUBDvcLOx0MZji2WZh+YVVtMem1O2W3QWlJN+6xtJ5YUFyCqZGNWwwDO?=
 =?us-ascii?Q?BxisZHvynd6A7WbE/pWJuPqrdBebnOS12IY4M4PAz0fPpzfpvdTfDnfgzURt?=
 =?us-ascii?Q?kw6jQZccNi22B+m1Z897siTFhywKp5M85EnRzezUQS3Lk/9jOHH+pI7gCZbs?=
 =?us-ascii?Q?BhsAuv953bMTGkH0Q5rSLNb1LzxnI1Dr8gTCfMQZVq1YAAzmpsKY5p88DzSA?=
 =?us-ascii?Q?XDWbHvTC2js47x7T9MECdQf2fmUFBR1K/ogc/n7Oxv8cjRXB7FpoZtGq4vTc?=
 =?us-ascii?Q?le46Q8u5BNaJTejhITF7tk0TFfD55PsF19TgWfFZjnQDxDsEfn4CPwhEg3UG?=
 =?us-ascii?Q?GlIOuVHt6QeLR5iREq4pLiT96YzroOU00lk9mYwDrzBMfX+YSxgr/kgRqbCn?=
 =?us-ascii?Q?+EcqhUpQsPCZErrIoTl6UKVR8/HY6f1jFifDX7AiGgXZR2WNLhDDjmasjCHr?=
 =?us-ascii?Q?cH8AfGuFQS36VRCnKeorblJXpAT8QUnBMWrmZ2gSnl5W4vRJJTbhBOFGFAy6?=
 =?us-ascii?Q?IpAMllEl2C+ECZvwQPzHfroUA0zAXiO22OsyATInmJRfuBr5YzrDMJzbCe8q?=
 =?us-ascii?Q?psPdTDL/DS8UHGcMdt94yxFrn6J+l56hT/fAP4M1/7X9nKZwOfHOwzgUT1Bh?=
 =?us-ascii?Q?q0D3T5Nz1QkYgW/wfyKG42k+zlhM2KKmSIDi+GNqFu/pPtn/rzDze9YBe8Aj?=
 =?us-ascii?Q?8nOyGiZkszF6jk09L9S1KlcRlPkxDJMGCJNDLeMf7D4nK5OdsCWIMeTQ/k9M?=
 =?us-ascii?Q?qNZecfAUnZTZIU3Ma7ulqWDjCeGK0n8DeTzQCFBS9pVoIvsOwhpSsbdNt6Xz?=
 =?us-ascii?Q?4clp2PPG9puIv/rBqa8deHIdfFPlT4G4yWSJ5k/1QrupImOyl7Pygln0rY2L?=
 =?us-ascii?Q?7UqqgZoN25XYn/o+Atm8qE82qS1FCGbDypZWuV3t0s77iF8V43r4WVGojICG?=
 =?us-ascii?Q?be2WWKILITBl0VvGRZISb7uH0rRidpx45GKP+30QoPFkG5vWeFtRM5ADu1wk?=
 =?us-ascii?Q?+oAdkN/q+uNNrn+OyqLsnjvVqLtvduqoC+8JEbsmsLOnD3zkruekO1FCvI6P?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaae15d5-8dae-4185-6ace-08dde6d8ae47
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:27.0341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyhoAzsf+vs3Zy6uyLHQRMfI4UPQ+LP7CGPJxvqzF1QlvE37W9zNQeay5dgClnUDYh5HlzLouD5koRtyCUmVz1vblXAuKninu2vg+sdUDB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3039

This adds a thermal cooling device for the Wave6 VPU.
The device operates within the Linux thermal framework,
adjusting the VPU performance state based on thermal conditions.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../chips-media/wave6/wave6-vpu-thermal.c     | 136 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.h     |  25 ++++
 2 files changed, 161 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
new file mode 100644
index 000000000000..24d897dd72bb
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/units.h>
+#include "wave6-vpu-thermal.h"
+
+static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *thermal,
+					    int state)
+{
+	unsigned long new_clock_rate;
+	int ret;
+
+	if (state > thermal->thermal_max || !thermal->cooling)
+		return 0;
+
+	new_clock_rate = DIV_ROUND_UP(thermal->freq_table[state], HZ_PER_KHZ);
+	dev_dbg(thermal->dev, "receive cooling state: %d, new clock rate %ld\n",
+		state, new_clock_rate);
+
+	ret = dev_pm_genpd_set_performance_state(thermal->dev, new_clock_rate);
+	if (ret && !((ret == -ENODEV) || (ret == -EOPNOTSUPP))) {
+		dev_err(thermal->dev, "failed to set perf to %lu, ret = %d\n",
+			new_clock_rate, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_max;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_event;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	thermal->thermal_event = state;
+	wave6_vpu_thermal_cooling_update(thermal, state);
+
+	return 0;
+}
+
+static struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_vpu_cooling_get_max_state,
+	.get_cur_state = wave6_vpu_cooling_get_cur_state,
+	.set_cur_state = wave6_vpu_cooling_set_cur_state,
+};
+
+int wave6_vpu_cooling_init(struct vpu_thermal_cooling *thermal)
+{
+	int i;
+	int num_opps;
+	unsigned long freq;
+
+	if (WARN_ON(!thermal || !thermal->dev))
+		return -EINVAL;
+
+	num_opps = dev_pm_opp_get_opp_count(thermal->dev);
+	if (num_opps <= 0) {
+		dev_err(thermal->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		return -ENODEV;
+	}
+
+	thermal->freq_table = kcalloc(num_opps, sizeof(*thermal->freq_table), GFP_KERNEL);
+	if (!thermal->freq_table)
+		goto error;
+
+	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+
+		opp = dev_pm_opp_find_freq_floor(thermal->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		dev_pm_opp_put(opp);
+
+		dev_dbg(thermal->dev, "[%d] = %ld\n", i, freq);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		thermal->freq_table[i] = freq;
+		thermal->thermal_max = i;
+	}
+
+	if (!thermal->thermal_max)
+		goto error;
+
+	thermal->thermal_event = 0;
+	thermal->cooling = thermal_of_cooling_device_register(thermal->dev->of_node,
+							      dev_name(thermal->dev),
+							      thermal,
+							      &wave6_cooling_ops);
+	if (IS_ERR(thermal->cooling)) {
+		dev_err(thermal->dev, "register cooling device failed\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+	wave6_vpu_cooling_remove(thermal);
+
+	return -EINVAL;
+}
+
+void wave6_vpu_cooling_remove(struct vpu_thermal_cooling *thermal)
+{
+	thermal_cooling_device_unregister(thermal->cooling);
+	kfree(thermal->freq_table);
+	thermal->freq_table = NULL;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
new file mode 100644
index 000000000000..b8c45f6785c5
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ *
+ */
+
+#ifndef __WAVE6_VPU_THERMAL_H__
+#define __WAVE6_VPU_THERMAL_H__
+
+#include <linux/thermal.h>
+
+struct vpu_thermal_cooling {
+	struct device *dev;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned long *freq_table;
+};
+
+int wave6_vpu_cooling_init(struct vpu_thermal_cooling *thermal);
+void wave6_vpu_cooling_remove(struct vpu_thermal_cooling *thermal);
+
+#endif /* __WAVE6_VPU_THERMAL_H__ */
-- 
2.31.1


