Return-Path: <linux-media+bounces-14209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AF9199A6
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 23:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181931C21EF2
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 21:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86997191461;
	Wed, 26 Jun 2024 21:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="jwg+QmhD"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2138.outbound.protection.outlook.com [40.107.220.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1231667F1
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719436570; cv=fail; b=kTjihZ5Cb7g4quB+YWO4gTav9MeJfe6GHgR1r3fO/YDcV5yPFEWHXOTxafta2fROLPcpMakC30zmYn63Zjxc7b1AhghifxhwwhYJcXmMb0q4t6cRVD4G52rmzPVqXh8Lz/QoZ6slGPZrhdHiBB4WEfrtgYCSgXgJLDm5a6WmuYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719436570; c=relaxed/simple;
	bh=7MqmY5wRyC7KebvpCr4dB47T5336fGuPAhSN+pARZZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qdptx/+5TmFUgTcD4sZlbm3uRIzUxsOleJ4kHrjrT9RUC3gdnhbld77G5HE1wUTyL8hunhsLl3Al8HK25PS4WRE/MKYhUhQUKglnyRTV2q5uMqE5rSQ2Fk1MXrMXYfrIuDHBQkrNT0u6+Ms+JuMJQupfs6vHELj/rLQV4I9E9uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=jwg+QmhD; arc=fail smtp.client-ip=40.107.220.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iscLfYmnM7F8o2TA0lA5K9O5xMhs9cYp3pVhNrrETCwGT0G8jU7B5Z9xr4b5AfukF8bfGLlLYRfqRqh4jxYKNl1D/edjMjBlIKeLQoT9j6tPuiC7O5DQ5Pq9P6G5jSFyVNMshISMRBV/1PwSAHTFSXYtx1ZqyZMtfJ7P0oG/1VxRxcL2k8nYsgJGJTZ10lTSkHTckIa+buekETFzj2xmmPdKZAqb1CUOppp8s4LKfYBj2HMtOCijX9ZEndq2zn+R2cOio4HUfh7ToHu6aZp748DEEBVI2AIvj0YjgB6fu+WpXvSKDct5b9ceB6YvoICkerW2NLJWJsj951EytkjAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rAv8ba004ce6EftndX1JCgFeFKHVmEyiZxRZKropSA=;
 b=VaggUWQWuyHX8K8VgUxsWGsWvhsUp6mXIY7kAvoRHCnp4vUqwEKPb8PH55k/5Sj2qaZjCLURKhLwMnPdFHKWWnzTyR99k9qhgtM9hta3hL7cHfStXdQ3tfT86eB8av6cEU/NOBc/yhHg9uuHABwUFYI75+JrEyN7HBMTrAxeuYNouNyOEVf43WgvmHGoysl+PRqPL6vv/F4762EtXiakSKoAcOnVfqM4znoOPuR7mGTjUDJVuQJidBSBYOSNrVi+8Xd4cERTNGty+rJ/QMWOs9PXQNz29+4HWln0kAVLVZxlDUtAgNVpxZxPLXTe7zqzvrt5OJ4qtvjcCzTV3UPWWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rAv8ba004ce6EftndX1JCgFeFKHVmEyiZxRZKropSA=;
 b=jwg+QmhDQw/97JWeLRra0sdWg5wyydVZh4+PMxoe5NBo3A0YwftUfCXp9eLNkFLIS8W90VoTx4aVO/+hhYAho3mNdhNtQjhwgRiyEJDrudqYXy/GknGC+P1jUNHrzWPOKS4fCOWZct3xKJrvn2I+8mHZhm2oGWXSDzODrqTJq7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 CO6PR14MB4242.namprd14.prod.outlook.com (2603:10b6:5:350::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.22; Wed, 26 Jun 2024 21:16:03 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Wed, 26 Jun 2024
 21:16:03 +0000
From: Spencer Hill <shill@d3engineering.com>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Spencer Hill <shill@d3engineering.com>
Subject: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
Date: Wed, 26 Jun 2024 17:15:28 -0400
Message-Id: <20240626211529.2068473-2-shill@d3engineering.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240626211529.2068473-1-shill@d3engineering.com>
References: <20240626211529.2068473-1-shill@d3engineering.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:610:32::27) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|CO6PR14MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e77c51-bc69-4b01-1c6c-08dc96252f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|1800799022|4022899007|376012|52116012|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O6bnfEvYbccZuu89htbS3vb7E2wqjDas+yrRB3JyLFO5n17LI0dMSciIKaY6?=
 =?us-ascii?Q?CO9XeP5n4WBtenP6jb3tw8xK9zTAEd1XrT2fczZjSXxfTFx9ECTz1cUb/+84?=
 =?us-ascii?Q?bumOZxJlo4Ytt46McN7zMjwJY319mGLKs9HHOH1iXn2YIjVJ2Pv5Fmyi5mYr?=
 =?us-ascii?Q?hqAJK98K4smvUrthEa53ca0/XlfhltxxK+VESSGsiGdCDC9Pu7Xc3OSgCsU1?=
 =?us-ascii?Q?UVQRNG9uGsr8eIujEiK1N0TYgvKGpHIkBLBrFsJn1M/cDoOucu/W42x9xkTP?=
 =?us-ascii?Q?wFmDre3wFhMUrI/xIAU27o6W6NHnRjslBSigYAjL18SOGmo+xeoGJtCSYpie?=
 =?us-ascii?Q?CXLwp0tUQpAjhthVTbffiaJVyuH4h6kdkv+ZHZacVPxILQ/1/nf8K1+NgIhU?=
 =?us-ascii?Q?CsNXZHLSYVrtMBJVi2pfsVQ824pbf/hCyb5K6ijMuB52kp6bvkvjiuzHgRK5?=
 =?us-ascii?Q?zf6+4q2AyAfP6LAPLgKBs4S+EHM8nAI2LQ7JiDESeKRLxfqp9070+n1A2AlG?=
 =?us-ascii?Q?cCVc2sVLPh9UNqwtatsod0zzrsbmVagvqKtG/AD9TnfMMLK6x9pHDSKAUaLW?=
 =?us-ascii?Q?PDZND/CuJ3sq6ctugufiHyvo8alRdiygt1c4lE+RRszRqZjOWlQApTyeqskq?=
 =?us-ascii?Q?507HySPZ5cFQ+OTnC3UegyAZMA0toVr1vj7dBJ/ljR9BVX7SzJP7MS4oPwml?=
 =?us-ascii?Q?M3oP0z5UDY9x1WuHmgnJ7cYpFpxK/FZQO4rffzJdUNfCY05h+N3z5LUr7TWB?=
 =?us-ascii?Q?dzdtowHwgVVpW7M7DVAdBTnmFFCb13Tv/5MRhKJzLPFrT/Z1yAMX11KWJRIx?=
 =?us-ascii?Q?ReHIDGXlPT+8NiJIW0uNhcjf0ossUwqvwiUyp6ahQ1499xMUG3y3VWbuxFvn?=
 =?us-ascii?Q?Bg+nIhC4tPJUVrHhLQcmzBzUSB9UgQPeW66S/IVoeNkCbiJjAGZQXVVrYy6V?=
 =?us-ascii?Q?b7212DMaJRdfPDlinPNg4Xdxx7b0i6MAeH2UGVsCNQoARrCTm4EKNvoQ+kx3?=
 =?us-ascii?Q?qCLlS/feACGp4g5z2UqIh3DREMjOAwuB+oXk7LhJlq6RtF2DvC7wfFme/xHF?=
 =?us-ascii?Q?6ozZHaWI1/15MrH8T6/TsMCuygLY1jPQY4NCOBTdHQY+Jbk6vpxnwYj+AORf?=
 =?us-ascii?Q?VbwFFCCF4iNdX1/rDERp/DpUCMydyIiXAr+qKn0hMakKsbfbvDin10QdrDY4?=
 =?us-ascii?Q?LjhU9co5mKLuejxr6Ep1ryqBFqybcLNwSkpnF764ruyTeDxFvIt3EeMBSmqy?=
 =?us-ascii?Q?8MdfZmZtTH1W0rFXOmGyYEhs2os3fypMH3flfJG+4VRA+7AEWPxRMz1RfI0j?=
 =?us-ascii?Q?eGDAolj6RuRnpvUNcLwM2G8Y31/zooQnNpdzV7i1jZ3onCwYSItsq2ECQVZQ?=
 =?us-ascii?Q?eM/nq+QJFyR+1i/Zm+4apom7tgsof7L+rpb4FGqc8CDNmawxrA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(4022899007)(376012)(52116012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?psi0YYVAZrKB2zaVwSXsaFswGZShF1khjK90scIBKp95E4XWxR7TijWQMT+G?=
 =?us-ascii?Q?Td1D3ZmjbW789zBSWCwNxoWrGknDQiC+2bOVRMtu+3Og4sbaXwjcHA/EUAS/?=
 =?us-ascii?Q?WebU2UnZzHLa4DnNN74BMb16s9eUl/AhbmEqCRGkJHJ1Pv+a5IwTE0aEjlsT?=
 =?us-ascii?Q?alJqfEQrmh+90im1W6dlVSBqQg2TxM4n3MKjaK/e8qpb3mqWr+9OCYjkkqNa?=
 =?us-ascii?Q?bWoG02gj8dyfV/z3C+Nx/etwJO2TwOxelHG2TbO5hzuqMDqwWG8wOVBRrUex?=
 =?us-ascii?Q?FnmtalHDpWMOE179OgyKEIuH7BxpRG9VupKlFy807T3HHymDbhFSujlnXBB7?=
 =?us-ascii?Q?+bnhTX1j1uy/NVpjOKSIQVzzqX5bzg9W4S76jHTWCtlIAV3VdSAD50eU56kE?=
 =?us-ascii?Q?rwmq4bmsQu+KT9CR24rKR5azf+qJQLBHOIDNtNsJAKQhNyH+cdjR37GFpPMI?=
 =?us-ascii?Q?JHV/nqlPqrE4w8gKDCIaLOGmzhvmdgJtgZaIdf+UVMLgs+o/4JoF10dhFEA/?=
 =?us-ascii?Q?27N716T69dP5MdXZwMiObTNqH1+HxldoCtqPMN1GlebtcVDaJG5WfhwZwCkc?=
 =?us-ascii?Q?OTIgzrjhcNHLoxigaCbMtO1eMiSOkmfaShmcEGOWAbS5RA+cd6Gse4BgDRgl?=
 =?us-ascii?Q?PaOuiYOP1FgHCpahB8fRbU69KVDaCvaMFPwyBhRQHeBwhPU1A9uON5JfJUp7?=
 =?us-ascii?Q?25a2+KN6uvu1ed24LHlE5Cm68/v96UNyJTmBxDK+f1SIwTNNYcXS5vvC7Uw0?=
 =?us-ascii?Q?y/ahhfX+O7m3+0aIdxRcPiRQgKcm1R/xs6VzHq9hU0FuEE84gWtvq4y0Xq5b?=
 =?us-ascii?Q?U/+BIRCm3XaAH67RS9fAer8xB/TeG5mLDgdwNp4Mvx41adzfiwJHjhuWbwG1?=
 =?us-ascii?Q?JhjLd0blgA+P1zKVVPlCGLqlAnPP+Ez8ZNRQQPfaOqr1dXQhHt8AEiXfY63v?=
 =?us-ascii?Q?XpJN2oTAql2uN1yYb9gyVdCyOMnDhtYsLZndOoGSAzMvtt1rdPrFbGO7XzgH?=
 =?us-ascii?Q?n0HToDSlJD/5c/DuqeITk+UUxIiHiFVQ4Eoy/4CZAClIsM7L08TFcLxXYDSv?=
 =?us-ascii?Q?t9gyAWYj6+W8V1nCWXQksstS9v8f36BFj2isos+wWVDNeetB4iVB3t0jMWNw?=
 =?us-ascii?Q?bAVF7+QXFX+oZa8MQj16TeHqSyPj/RSAWQt/hnYJaVEgSEGlMVA822VaWDMk?=
 =?us-ascii?Q?KynmTjARGEHjl4tgKtlWwOI9PW4sMJRQq9YiMU7ZCoEnFfgf84sCcbWlHdAB?=
 =?us-ascii?Q?dRfU02wHtZQQyHU9HCxcFFIDtjgOUMB6E8l5OqHX7Gm9BQy+gf8xVAhF3+IT?=
 =?us-ascii?Q?1WaxnwlBxbEt+L9O+OVWKvOt1Pt7nNCzPisqxXdpX2xrx1Wt12tFi1Go+FAx?=
 =?us-ascii?Q?KpMKZU9dZDYJZt9GQ3rjUcZf2FpEp3BDPj33H0z8aoS1Gnl4K/Wbdzx90LPm?=
 =?us-ascii?Q?d/V2FgJnPLBQK6t92KdCUJilf555BNM8KkbEh7sj3csW4f374SdLgpCIod+g?=
 =?us-ascii?Q?d78pKogM7S4PUduygL9VupR5L7dPpDWkIToisw7qrr4ZIX8YH9aRX95S4roY?=
 =?us-ascii?Q?KUQkxF7FiWMmNdWQ7tfat+zPlOOakpX7Z+LVor+JZohEnsVAR6eYjXaBL9tu?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e77c51-bc69-4b01-1c6c-08dc96252f41
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 21:16:03.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FMD2sSDX3gAi1uITstDQZ2OmD56N4kk6XD4s0LFJ5K/bsKNA+b3d6HqNA4WvO6X+JBhm8YGydAsmZUI4b++dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR14MB4242

Add a driver for the Sony IMX728 image sensor.

Signed-off-by: Spencer Hill <shill@d3engineering.com>
---
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx728.c | 1167 ++++++++++++
 drivers/media/i2c/imx728.h | 3458 ++++++++++++++++++++++++++++++++++++
 4 files changed, 4637 insertions(+)
 create mode 100644 drivers/media/i2c/imx728.c
 create mode 100644 drivers/media/i2c/imx728.h

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c6d3ee472d81..46b6463c558a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -233,6 +233,17 @@ config VIDEO_IMX415
          To compile this driver as a module, choose M here: the
          module will be called imx415.

+config VIDEO_IMX728
+       tristate "Sony IMX728 sensor support"
+       depends on OF_GPIO
+       select V4L2_CCI_I2C
+       help
+         This is a Video4Linux2 sensor driver for the Sony
+         IMX728 camera.
+
+         To compile this driver as a module, choose M here: the
+         module will be called imx728.
+
 config VIDEO_MAX9271_LIB
        tristate

diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index dfbe6448b549..1188420ee1b4 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
 obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
 obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
 obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
+obj-$(CONFIG_VIDEO_IMX728) +=3D imx728.o
 obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
new file mode 100644
index 000000000000..b23359133a22
--- /dev/null
+++ b/drivers/media/i2c/imx728.c
@@ -0,0 +1,1167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sony IMX728 CMOS Image Sensor Driver
+ *
+ * Copyright (c) 2024 Define Design Deploy Corp
+ */
+
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/v4l2-mediabus.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+
+#include "imx728.h"
+
+static inline struct imx728 *to_imx728(struct v4l2_subdev *sd)
+{
+       return container_of(sd, struct imx728, subdev);
+}
+
+static int imx728_read(struct imx728 *imx728, u16 addr, u32 *val, size_t n=
bytes)
+{
+       int ret;
+       __le32 val_le =3D 0;
+
+       ret =3D regmap_bulk_read(imx728->regmap, addr, &val_le, nbytes);
+       if (ret < 0) {
+               dev_err(imx728->dev, "%s: failed to read reg 0x%04x: %d\n",
+                       __func__, addr, ret);
+               return ret;
+       }
+
+       *val =3D le32_to_cpu(val_le);
+
+       return 0;
+}
+
+static int imx728_write(struct imx728 *imx728, u16 addr, u32 val, size_t n=
bytes)
+{
+       int ret;
+       __le32 val_le =3D cpu_to_le32(val);
+
+       ret =3D regmap_bulk_write(imx728->regmap, addr, &val_le, nbytes);
+       if (ret < 0)
+               dev_err(imx728->dev, "%s: failed to write reg 0x%04x: %d\n"=
,
+                       __func__, addr, ret);
+
+       return ret;
+}
+
+static int imx728_update_bits(struct imx728 *imx728, u16 addr, u32 val, u3=
2 mask, size_t nbytes)
+{
+       int ret;
+       u32 cfg;
+
+       ret =3D imx728_read(imx728, addr, &cfg, nbytes);
+       if (ret < 0)
+               return ret;
+
+       cfg =3D (val) ? (cfg | mask) : (cfg & (~mask));
+
+       return imx728_write(imx728, addr, cfg, nbytes);
+}
+
+static int imx728_write_table(struct imx728 *imx728,
+                             const struct reg_sequence *regs,
+                             unsigned int nr_regs)
+{
+       int ret;
+
+       ret =3D regmap_multi_reg_write(imx728->regmap, regs, nr_regs);
+       if (ret < 0)
+               dev_err(imx728->dev,
+                       "%s: failed to write reg table (%d)!\n", __func__, =
ret);
+       return ret;
+}
+
+static int imx728_wait_for_state(struct imx728 *imx728, enum imx728_sensor=
_state state)
+{
+       int ret, i;
+       u32 val;
+
+       for (i =3D 0; i < 50; i++) {
+               ret =3D imx728_read(imx728, 0x2CAC, &val, 1);
+               if (ret =3D=3D 0 && val =3D=3D state) {
+                       dev_info(imx728->dev, "%s: Enter state %u\n", __fun=
c__, val);
+                       return 0;
+               }
+               usleep_range(1000, 10000);
+       }
+
+       return -EBUSY;
+}
+
+static void imx728_init_formats(struct v4l2_subdev_state *state)
+{
+       struct v4l2_mbus_framefmt *format;
+
+       format =3D v4l2_subdev_state_get_format(state, 0, 0);
+       format->code =3D imx728_mbus_formats[0];
+       format->width =3D imx728_framesizes[0].width;
+       format->height =3D imx728_framesizes[0].height;
+       format->field =3D V4L2_FIELD_NONE;
+       format->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
+}
+
+static int _imx728_set_routing(struct v4l2_subdev *sd,
+                              struct v4l2_subdev_state *state)
+{
+       struct v4l2_subdev_route routes[] =3D {
+               {
+                       .source_pad =3D 0,
+                       .source_stream =3D 0,
+                       .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+               },
+               {
+                       .source_pad =3D 0,
+                       .source_stream =3D 1,
+               }
+       };
+
+       struct v4l2_subdev_krouting routing =3D {
+               .num_routes =3D ARRAY_SIZE(routes),
+               .routes =3D routes,
+       };
+
+       int ret;
+
+       ret =3D v4l2_subdev_set_routing(sd, state, &routing);
+       if (ret < 0)
+               return ret;
+
+       imx728_init_formats(state);
+
+       return 0;
+}
+
+static int imx728_enum_mbus_code(struct v4l2_subdev *sd,
+                                struct v4l2_subdev_state *state,
+                                struct v4l2_subdev_mbus_code_enum *code)
+{
+
+       if (code->index >=3D ARRAY_SIZE(imx728_mbus_formats))
+               return -EINVAL;
+
+       code->code =3D imx728_mbus_formats[code->index];
+
+       return 0;
+}
+
+static int imx728_enum_frame_sizes(struct v4l2_subdev *sd,
+                                  struct v4l2_subdev_state *state,
+                                  struct v4l2_subdev_frame_size_enum *fse)
+{
+       unsigned int i;
+
+       for (i =3D 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
+               if (imx728_mbus_formats[i] =3D=3D fse->code)
+                       break;
+       }
+
+       if (i =3D=3D ARRAY_SIZE(imx728_mbus_formats))
+               return -EINVAL;
+
+       if (fse->index >=3D ARRAY_SIZE(imx728_framesizes))
+               return -EINVAL;
+
+       fse->min_width =3D imx728_framesizes[fse->index].width;
+       fse->max_width =3D fse->min_width;
+       fse->min_height =3D imx728_framesizes[fse->index].height;
+       fse->max_height =3D fse->min_height;
+
+       return 0;
+}
+
+static int imx728_set_fmt(struct v4l2_subdev *sd,
+                         struct v4l2_subdev_state *state,
+                         struct v4l2_subdev_format *fmt)
+{
+       struct imx728 *imx728 =3D to_imx728(sd);
+       struct v4l2_mbus_framefmt *format;
+       const struct v4l2_area *fsize;
+       unsigned int i;
+       u32 code;
+       int ret =3D 0;
+
+       if (fmt->pad !=3D 0)
+               return -EINVAL;
+
+       if (fmt->stream !=3D 0)
+               return -EINVAL;
+
+       for (i =3D 0; i < ARRAY_SIZE(imx728_mbus_formats); ++i) {
+               if (imx728_mbus_formats[i] =3D=3D fmt->format.code) {
+                       code =3D fmt->format.code;
+                       break;
+               }
+       }
+
+       if (i =3D=3D ARRAY_SIZE(imx728_mbus_formats))
+               code =3D imx728_mbus_formats[0];
+
+       fsize =3D v4l2_find_nearest_size(imx728_framesizes,
+                                      ARRAY_SIZE(imx728_framesizes), width=
,
+                                      height, fmt->format.width,
+                                      fmt->format.height);
+
+       mutex_lock(&imx728->lock);
+
+       format =3D v4l2_subdev_state_get_format(state, fmt->pad, fmt->strea=
m);
+
+       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && imx728->streamin=
g) {
+               ret =3D -EBUSY;
+               goto done;
+       }
+
+       format->code =3D code;
+       format->width =3D fsize->width;
+       format->height =3D fsize->height;
+
+       fmt->format =3D *format;
+
+done:
+       mutex_unlock(&imx728->lock);
+
+       return ret;
+}
+
+static int imx728_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+                                struct v4l2_mbus_frame_desc *fd)
+{
+       struct v4l2_subdev_state *state;
+       struct v4l2_mbus_framefmt *fmt;
+       u32 bpp;
+       int ret =3D 0;
+
+       if (pad !=3D 0)
+               return -EINVAL;
+
+       state =3D v4l2_subdev_lock_and_get_active_state(sd);
+
+       fmt =3D v4l2_subdev_state_get_format(state, 0, 0);
+       if (!fmt) {
+               ret =3D -EPIPE;
+               goto out;
+       }
+
+       memset(fd, 0, sizeof(*fd));
+
+       fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+       bpp =3D 10;
+
+       fd->entry[fd->num_entries].stream =3D 0;
+
+       fd->entry[fd->num_entries].flags =3D V4L2_MBUS_FRAME_DESC_FL_LEN_MA=
X;
+       fd->entry[fd->num_entries].length =3D fmt->width * fmt->height * bp=
p / 8;
+       fd->entry[fd->num_entries].pixelcode =3D fmt->code;
+       fd->entry[fd->num_entries].bus.csi2.vc =3D 0;
+       fd->entry[fd->num_entries].bus.csi2.dt =3D 0x2b;
+
+       fd->num_entries++;
+
+out:
+
+       v4l2_subdev_unlock_state(state);
+
+       return ret;
+}
+
+static int imx728_set_routing(struct v4l2_subdev *sd,
+                             struct v4l2_subdev_state *state,
+                             enum v4l2_subdev_format_whence which,
+                             struct v4l2_subdev_krouting *routing)
+{
+       int ret;
+
+       if (routing->num_routes =3D=3D 0 || routing->num_routes > 1)
+               return -EINVAL;
+
+       ret =3D _imx728_set_routing(sd, state);
+
+       return ret;
+}
+
+static int imx728_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+       struct imx728 *imx728 =3D container_of(ctrl->handler,
+                                       struct imx728, ctrl.handler);
+       int ret =3D 0;
+
+       dev_dbg(imx728->dev, "%s: %s, value: %d\n",
+                       __func__, ctrl->name, ctrl->val);
+
+       if (!pm_runtime_get_if_in_use(imx728->dev))
+               return 0;
+
+       switch (ctrl->id) {
+       case V4L2_CID_EXPOSURE:
+               ret =3D imx728_write(imx728, 0x98DC, ctrl->val, 4);
+               break;
+       case V4L2_CID_ANALOGUE_GAIN:
+               ret =3D imx728_update_bits(imx728, 0x98F8,
+                               (ctrl->val * 10),
+                               0x1FFFF, 4);
+               break;
+       case V4L2_CID_HFLIP:
+               ret =3D imx728_update_bits(imx728, 0x9651,
+                                        ctrl->val, 0x1, 1);
+               ret |=3D imx728_update_bits(imx728, 0xB67C,
+                                         ctrl->val, 0x1, 1);
+               break;
+       case V4L2_CID_VFLIP:
+               ret =3D imx728_update_bits(imx728, 0x9651,
+                                        ctrl->val << 1, 0x2, 1);
+               ret =3D imx728_update_bits(imx728, 0xB67D,
+                                        ctrl->val, 0x1, 1);
+               break;
+       case V4L2_CID_WIDE_DYNAMIC_RANGE:
+       case V4L2_CID_TEST_PATTERN:
+               // Both of these are configured during start stream.
+               ret =3D 0;
+               break;
+       default:
+               ret =3D -EINVAL;
+       }
+
+       pm_runtime_put_noidle(imx728->dev);
+       return ret;
+}
+
+static int imx728_detect(struct imx728 *imx728)
+{
+       int ret;
+       u32 minor, major;
+
+       ret =3D imx728_read(imx728, 0x6002, &major, 1);
+       if (ret !=3D 0) {
+               dev_err(imx728->dev, "Could not read PARAM_MAJOR_VER!");
+               return ret;
+       }
+       ret =3D imx728_read(imx728, 0x6000, &minor, 1);
+       if (ret !=3D 0) {
+               dev_err(imx728->dev, "Could not read PARAM_MINOR_VER!");
+               return ret;
+       }
+       dev_dbg(imx728->dev, "Got version: %d.%d", major, minor);
+
+       return 0;
+}
+
+static int imx728_reset(struct imx728 *imx728)
+{
+
+       if (!IS_ERR_OR_NULL(imx728->xclr_gpio)) {
+               gpiod_set_value_cansleep(imx728->xclr_gpio, 1);
+               usleep_range(1000, 10000);
+               gpiod_set_value_cansleep(imx728->xclr_gpio, 0);
+               msleep(100);
+
+               return 0;
+       }
+
+       return -1;
+}
+
+static int imx728_power_on(struct imx728 *imx728)
+{
+       int ret;
+
+       ret =3D clk_prepare_enable(imx728->clk);
+       if (ret < 0)
+               return ret;
+
+       imx728_reset(imx728);
+       return 0;
+}
+
+static int imx728_power_off(struct imx728 *imx728)
+{
+
+       if (imx728->xclr_gpio) {
+               gpiod_set_value_cansleep(imx728->xclr_gpio, 1);
+
+               usleep_range(1, 10);
+       }
+       clk_disable_unprepare(imx728->clk);
+       return 0;
+}
+
+static int imx728_get_frame_interval(struct v4l2_subdev *sd,
+                                    struct v4l2_subdev_state *sd_state,
+                                    struct v4l2_subdev_frame_interval *fi)
+{
+       struct imx728 *imx728 =3D to_imx728(sd);
+
+       fi->interval.numerator =3D 1;
+       fi->interval.denominator =3D imx728->fps;
+       return 0;
+}
+
+static int imx728_set_frame_interval(struct v4l2_subdev *sd,
+                                    struct v4l2_subdev_state *sd_state,
+                                    struct v4l2_subdev_frame_interval *fi)
+{
+       struct imx728 *imx728 =3D to_imx728(sd);
+       u32 req_fps;
+
+       mutex_lock(&imx728->lock);
+
+       if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator =3D=
=3D 0) {
+               fi->interval.denominator =3D IMX728_FRAMERATE_DEFAULT;
+               fi->interval.numerator =3D 1;
+       }
+
+       req_fps =3D clamp_val(DIV_ROUND_CLOSEST(fi->interval.denominator,
+                                             fi->interval.numerator),
+                           IMX728_FRAMERATE_MIN, IMX728_FRAMERATE_MAX);
+
+       fi->interval.numerator =3D 1;
+       fi->interval.denominator =3D req_fps;
+
+       imx728->fps =3D req_fps;
+
+       mutex_unlock(&imx728->lock);
+       dev_dbg(imx728->dev, "%s frame rate =3D %d\n", __func__, imx728->fp=
s);
+
+       return 0;
+}
+
+static int imx728_powerup_to_standby(struct imx728 *imx728)
+{
+       int ret;
+
+       dev_info(imx728->dev, "powerup -> standby...");
+
+       ret =3D imx728_reset(imx728);
+       if (ret) {
+               dev_err(imx728->dev, "Error resetting: %i", ret);
+               return ret;
+       }
+
+       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_SLEEP);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Could not transition to Sleep state!"=
);
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x1B20, imx728->clk_rate / 1000000, 1)=
;
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write INCK frequency!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x1B1C, 0x1, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write INCK frequency!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x1B05, 0xFF, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write to CK_SLEEP!");
+               return ret;
+       }
+
+       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't transition from Sleep to Sta=
ndby state!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0xFFFF, IMX728_REMAP_MODE_STANDBY, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write regmap mode!");
+               return ret;
+       }
+
+       return 0;
+}
+
+static int imx728_hdr_fixed_brightness(struct imx728 *imx728)
+{
+       int ret;
+
+       // Sony recommended values
+       unsigned int exposure_sp1_sp2_us =3D 10000;
+       unsigned int exposure_sp1vs_us =3D 56;
+       unsigned int sp1h_gain =3D 240;
+       unsigned int sp1l_gain =3D 75;
+       unsigned int sp1ec_gain =3D 21;
+       unsigned int sp2_gain =3D 33;
+       unsigned int sp1vs_gain =3D 84;
+
+       ret =3D imx728_write(imx728, 0x98DC, exposure_sp1_sp2_us, 4);
+       ret |=3D imx728_write(imx728, 0x98E4, exposure_sp1_sp2_us, 4);
+       ret |=3D imx728_write(imx728, 0x98EC, exposure_sp1vs_us, 4);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Failed to write fixed exposure values=
.");
+               return ret;
+       }
+
+       ret =3D imx728_update_bits(imx728, 0x98F8,
+                         sp1h_gain,
+                         0x1FFFF,
+                         4);
+       ret |=3D imx728_update_bits(imx728, 0x98FC,
+                         sp1l_gain,
+                         0x1FFFF,
+                         4);
+       ret |=3D imx728_update_bits(imx728, 0x9900,
+                         sp1ec_gain,
+                         0x1FFFF,
+                         4);
+       ret |=3D imx728_update_bits(imx728, 0x9904,
+                         sp2_gain,
+                         0x1FFFF,
+                         4);
+       ret |=3D imx728_update_bits(imx728, 0x9908,
+                         sp1vs_gain,
+                         0x1FFFF,
+                         4);
+
+       if (ret < 0) {
+               dev_err(imx728->dev, "Failed to write fixed gain values.");
+               return ret;
+       }
+
+       dev_info(imx728->dev, "Wrote fixed brightness for HDR");
+
+       return 0;
+}
+
+static int imx728_hdr_configure(
+       struct imx728 *imx728,
+       struct imx728_ctrl_point *points,
+       int hdr_bits)
+{
+       u32 hdr_norm_x0;
+       u32 hdr_norm_x1;
+       u32 hdr_norm_y0;
+       u32 hdr_norm_y1;
+
+       int ret;
+       int i;
+
+       switch (hdr_bits) {
+       case 20:
+               hdr_norm_x0 =3D 0x2000;
+               hdr_norm_x1 =3D 0x5000;
+
+               hdr_norm_y0 =3D 0x0;
+               hdr_norm_y1 =3D 0xd000;
+               break;
+       case 24:
+               hdr_norm_x0 =3D 0x3000;
+               hdr_norm_x1 =3D 0x5000;
+
+               hdr_norm_y0 =3D 0x0;
+               hdr_norm_y1 =3D 0xe000;
+               break;
+       default:
+               dev_err(imx728->dev, "%i bit HDR not supported.", hdr_bits)=
;
+               break;
+       }
+
+       ret =3D imx728_write(imx728, 0x9C60, hdr_norm_x0, 4);
+       ret |=3D imx728_write(imx728, 0x9C6C, hdr_norm_x0, 4);
+       ret |=3D imx728_write(imx728, 0x9C64, hdr_norm_x1, 4);
+       ret |=3D imx728_write(imx728, 0x9C70, hdr_norm_x1, 4);
+       ret |=3D imx728_write(imx728, 0x9C68, hdr_norm_y0, 2);
+       ret |=3D imx728_write(imx728, 0x9C74, hdr_norm_y0, 2);
+       ret |=3D imx728_write(imx728, 0x9C6A, hdr_norm_y1, 2);
+       ret |=3D imx728_write(imx728, 0x9C76, hdr_norm_y1, 2);
+
+       if (ret < 0) {
+               dev_err(imx728->dev, "Failed when setting HDR Normalization=
 gains: %i", ret);
+               return ret;
+       }
+
+       for (i =3D 0; i < 16; i++) {
+               ret =3D imx728_write(
+                       imx728,
+                       IMX728_REG_CTRL_POINT_X(i),
+                       points->x, 4);
+
+               ret |=3D imx728_write(
+                       imx728,
+                       IMX728_REG_CTRL_POINT_Y(i),
+                       points->y, 4);
+
+               if (ret < 0) {
+                       dev_err(imx728->dev, "Failed to write control point=
 %i", i);
+                       return ret;
+               }
+
+               if ((points+1)->x >=3D 0 && (points+1)->y >=3D 0)
+                       points++;
+       }
+
+       return imx728_hdr_fixed_brightness(imx728);
+}
+
+static int imx728_configure(struct imx728 *imx728)
+{
+       int ret;
+       bool hdr =3D imx728->ctrl.wdr->val;
+       enum imx728_img_raw_mode img_out_mode;
+       enum imx728_drive_mode mode_sel;
+       enum imx728_aemode ae_mode;
+
+       if (hdr) {
+               img_out_mode =3D IMX728_IMG_MODE_HDR;
+               mode_sel =3D IMX728_MODE_3856x2176_40_4LANE_RAW10;
+               ae_mode =3D IMX728_AEMODE_FULL_ME;
+       } else {
+               img_out_mode =3D IMX728_IMG_MODE_LINEAR;
+               mode_sel =3D IMX728_MODE_3856x2176_40_4LANE_RAW10;
+               ae_mode =3D IMX728_AEMODE_FULL_ME;
+       }
+
+       ret =3D imx728_write(imx728, 0x98AC, ae_mode, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't set AE mode!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0xA248, IMX728_AWBMODE_FULL_MWB, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't set full manual white balanc=
e mode!");
+               return ret;
+       }
+
+       ret =3D imx728_update_bits(imx728, 0x1808, 0x1, 0x1, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't enable full manual white bal=
ance mode!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x98E0, IMX728_FME_SHTVAL_UNIT_MICROSE=
CONDS, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write exposure time unit to =
microseconds!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x98E8, IMX728_FME_SHTVAL_UNIT_MICROSE=
CONDS, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write exposure time unit to =
microseconds!");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x98F0, IMX728_FME_SHTVAL_UNIT_MICROSE=
CONDS, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write exposure time unit to =
microseconds!");
+               return ret;
+       }
+
+       if (hdr) {
+               ret =3D imx728_hdr_configure(imx728, imx728_hdr_20bit, 20);
+               if (ret < 0) {
+                       dev_err(imx728->dev, "Couldn't configure sensor for=
 HDR mode: %i", ret);
+                       return ret;
+               }
+       }
+
+       dev_info(imx728->dev, "Disabling metadata...");
+       ret =3D imx728_write(imx728, 0x1708, 0x00, 1);
+       ret |=3D imx728_write(imx728, 0x1709, 0x00, 1);
+       ret |=3D imx728_write(imx728, 0x170A, 0x00, 1);
+       ret |=3D imx728_write(imx728, 0x1B40, 0x00, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Error disabling metadata: %i", ret);
+               return ret;
+       }
+
+       ret =3D imx728_update_bits(imx728, 0x9728,
+                         mode_sel,
+                         0x7FFF,
+                         2);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't write mode select.");
+               return ret;
+       }
+
+       ret =3D imx728_update_bits(imx728, 0xEC7E,
+                         img_out_mode,
+                         0x7,
+                         1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't select image out mode.");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0xEC12, 0x28, 2);
+       ret |=3D imx728_write(imx728, 0xEC14, 0x0, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Error disabling OB output.");
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x1761, 0x0, 1);
+       if (ret < 0)
+               dev_err(imx728->dev, "Error disabling skew calibration from=
 sensor to SER");
+
+       switch (imx728->ctrl.pg_mode->val) {
+       case 0:
+               break;
+       case 1:
+               // Horizontal Color Bars
+               ret =3D imx728_write(imx728, 0x1A2A, 8, 2);
+               ret |=3D imx728_write(imx728, 0x1A30, 0, 3);
+               ret |=3D imx728_write(imx728, 0x1A38, 1, 3);
+               ret |=3D imx728_write(imx728, 0xB58F, 0x0, 1);
+               ret |=3D imx728_write(imx728, 0xB6C5, 0x0, 1);
+               break;
+       case 2:
+               // Vertical Color Bars
+               ret =3D imx728_write(imx728, 0x1A2C, 16, 2);
+               ret |=3D imx728_write(imx728, 0x1A30, 0, 3);
+               ret |=3D imx728_write(imx728, 0x1A38, 1, 3);
+               ret |=3D imx728_write(imx728, 0xB58F, 0x1, 1);
+               ret |=3D imx728_write(imx728, 0xB6C5, 0x1, 1);
+               break;
+       default:
+               break;
+       }
+
+       // Assume that everything except 'disabled' requires pattern gen en=
able
+       if (imx728->ctrl.pg_mode->val !=3D 0) {
+               ret |=3D imx728_write(imx728, 0xB58E, 0x1, 1);
+               ret |=3D imx728_write(imx728, 0xB6C4, 0x1, 1);
+
+               if (ret < 0) {
+                       dev_err(imx728->dev, "Failed to enable PG mode.");
+                       return ret;
+               }
+       }
+
+       ret =3D imx728_update_bits(imx728, 0x9714,
+                         IMX728_RAW_SEL_SP1H,
+                         0x7,
+                         1);
+       ret |=3D imx728_update_bits(imx728, 0xB684,
+                          IMX728_RAW_SEL_SP1H,
+                          0x7,
+                          1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Failed to set subpixel register");
+               return ret;
+       }
+
+       return 0;
+}
+
+static int imx728_start_stream(struct imx728 *imx728)
+{
+       int ret;
+
+       ret =3D imx728_powerup_to_standby(imx728);
+       if (ret < 0)
+               return ret;
+
+       ret =3D imx728_write_table(imx728, imx728_3840x2160, ARRAY_SIZE(imx=
728_3840x2160));
+       if (ret < 0)
+               return ret;
+
+       msleep(100);
+
+       ret =3D imx728_configure(imx728);
+       if (ret < 0)
+               return ret;
+
+       ret =3D __v4l2_ctrl_handler_setup(imx728->subdev.ctrl_handler);
+       if (ret < 0) {
+               dev_err(imx728->dev,
+                       "%s: failed to apply v4l2 ctrls: %d\n", __func__, r=
et);
+               return ret;
+       }
+
+       ret =3D imx728_write(imx728, 0x1B04, 0x5C, 1);
+       if (ret < 0)
+               return ret;
+       ret =3D imx728_write(imx728, 0x1B04, 0xA3, 1);
+       if (ret < 0)
+               return ret;
+
+       ret =3D imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STREAMING=
);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Could not transition to Streaming!");
+               return ret;
+       }
+
+       msleep(20);
+
+       return 0;
+}
+
+static int imx728_stop_stream(struct imx728 *imx728)
+{
+       int ret;
+
+       ret =3D imx728_write(imx728, 0x1B04, 0xFF, 1);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Error sending stop stream command: %i=
", ret);
+               return ret;
+       }
+
+       imx728_wait_for_state(imx728, IMX728_SENSOR_STATE_STANDBY);
+       if (ret < 0) {
+               dev_err(imx728->dev, "Couldn't transition out of Streaming =
mode!");
+               return ret;
+       }
+
+       return 0;
+}
+
+static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
+{
+       struct imx728 *imx728 =3D to_imx728(sd);
+       int ret;
+
+       mutex_lock(&imx728->lock);
+       if (imx728->streaming =3D=3D enable) {
+               mutex_unlock(&imx728->lock);
+               return 0;
+       }
+
+       if (enable) {
+               ret =3D pm_runtime_get_sync(imx728->dev);
+               if (ret < 0) {
+                       pm_runtime_put_noidle(imx728->dev);
+                       goto err_unlock;
+               }
+
+               ret =3D imx728_start_stream(imx728);
+               if (ret < 0)
+                       goto err_runtime_put;
+       } else {
+               ret =3D imx728_stop_stream(imx728);
+               if (ret < 0)
+                       goto err_runtime_put;
+               pm_runtime_mark_last_busy(imx728->dev);
+               pm_runtime_put_autosuspend(imx728->dev);
+       }
+
+       imx728->streaming =3D enable;
+
+       __v4l2_ctrl_grab(imx728->ctrl.wdr, enable);
+       __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
+       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
+       __v4l2_ctrl_grab(imx728->ctrl.pg_mode, enable);
+
+       mutex_unlock(&imx728->lock);
+       return 0;
+
+err_runtime_put:
+       pm_runtime_put(imx728->dev);
+
+err_unlock:
+       mutex_unlock(&imx728->lock);
+       dev_err(imx728->dev,
+               "%s: failed to setup streaming %d\n", __func__, ret);
+       return ret;
+}
+
+static const struct v4l2_subdev_core_ops imx728_core_ops =3D {
+       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
+       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops imx728_subdev_video_ops =3D {
+       .s_stream =3D imx728_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops imx728_subdev_pad_ops =3D {
+       .enum_mbus_code =3D imx728_enum_mbus_code,
+       .enum_frame_size =3D imx728_enum_frame_sizes,
+       .get_fmt =3D v4l2_subdev_get_fmt,
+       .set_fmt =3D imx728_set_fmt,
+       .get_frame_interval =3D imx728_get_frame_interval,
+       .set_frame_interval =3D imx728_set_frame_interval,
+       .set_routing =3D imx728_set_routing,
+       .get_frame_desc =3D imx728_get_frame_desc,
+};
+
+static const struct v4l2_subdev_ops imx728_subdev_ops =3D {
+       .core  =3D &imx728_core_ops,
+       .video =3D &imx728_subdev_video_ops,
+       .pad   =3D &imx728_subdev_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops imx728_ctrl_ops =3D {
+       .s_ctrl =3D imx728_set_ctrl,
+};
+
+static int imx728_probe(struct i2c_client *client)
+{
+       struct imx728 *imx728;
+       struct v4l2_subdev *sd;
+       struct v4l2_ctrl_handler *ctrl_hdr;
+       int ret;
+
+       imx728 =3D devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERNEL);
+       if (!imx728)
+               return -ENOMEM;
+
+       imx728->dev =3D &client->dev;
+
+       imx728->regmap =3D devm_regmap_init_i2c(client, &imx728_regmap_conf=
ig);
+       if (IS_ERR(imx728->regmap))
+               return PTR_ERR(imx728->regmap);
+
+       imx728->xclr_gpio =3D devm_gpiod_get_optional(imx728->dev,
+                                            "xclr", GPIOD_OUT_LOW);
+       if (IS_ERR(imx728->xclr_gpio))
+               return PTR_ERR(imx728->xclr_gpio);
+
+       imx728->clk =3D devm_clk_get(imx728->dev, "inck");
+       if (IS_ERR(imx728->clk))
+               return PTR_ERR(imx728->clk);
+
+       imx728->clk_rate =3D clk_get_rate(imx728->clk);
+       dev_info(imx728->dev, "inck rate: %lu Hz\n", imx728->clk_rate);
+
+       if (imx728->clk_rate < 18000000 || imx728->clk_rate > 30000000)
+               return -EINVAL;
+
+       ret =3D imx728_power_on(imx728);
+       if (ret < 0)
+               return ret;
+
+       ret =3D imx728_detect(imx728);
+       if (ret < 0)
+               return ret;
+
+       sd =3D &imx728->subdev;
+       v4l2_i2c_subdev_init(sd, client, &imx728_subdev_ops);
+
+       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
+                    V4L2_SUBDEV_FL_HAS_EVENTS |
+                    V4L2_SUBDEV_FL_STREAMS;
+
+       imx728->pad.flags =3D MEDIA_PAD_FL_SOURCE;
+       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
+       ret =3D media_entity_pads_init(&sd->entity, 1, &imx728->pad);
+       if (ret < 0) {
+               dev_err(imx728->dev,
+                       "%s: media entity init failed %d\n", __func__, ret)=
;
+               return ret;
+       }
+
+       ctrl_hdr =3D &imx728->ctrl.handler;
+       ret =3D v4l2_ctrl_handler_init(ctrl_hdr, 8);
+       if (ret < 0) {
+               dev_err(imx728->dev,
+                       "%s: ctrl handler init failed: %d\n", __func__, ret=
);
+               goto err_media_cleanup;
+       }
+
+       mutex_init(&imx728->lock);
+       imx728->ctrl.handler.lock =3D &imx728->lock;
+       imx728->fps =3D IMX728_FRAMERATE_DEFAULT;
+
+       imx728->ctrl.exposure =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_=
ops,
+                                                 V4L2_CID_EXPOSURE, 0,
+                                                 33000, 1,
+                                                 IMX728_EXPOSURE_DEFAULT);
+
+       imx728->ctrl.again =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops=
,
+                                              V4L2_CID_ANALOGUE_GAIN, 0,
+                                              102, 1,
+                                              24);
+
+       imx728->ctrl.wdr =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_ops,
+                                            V4L2_CID_WIDE_DYNAMIC_RANGE,
+                                            0, 1, 1, 1);
+
+       imx728->ctrl.h_flip =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_op=
s,
+                                               V4L2_CID_HFLIP, 0, 1, 1, 0)=
;
+
+       imx728->ctrl.v_flip =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctrl_op=
s,
+                                               V4L2_CID_VFLIP, 0, 1, 1, 0)=
;
+
+       imx728->ctrl.pg_mode =3D v4l2_ctrl_new_std_menu_items(ctrl_hdr,
+                                       &imx728_ctrl_ops, V4L2_CID_TEST_PAT=
TERN,
+                                       ARRAY_SIZE(imx728_ctrl_pg_qmenu) - =
1,
+                                       0, 0, imx728_ctrl_pg_qmenu);
+
+       imx728->ctrl.pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdr, &imx728_ctr=
l_ops,
+                                            V4L2_CID_PIXEL_RATE,
+                                            IMX728_PIXEL_RATE,
+                                            IMX728_PIXEL_RATE, 1,
+                                            IMX728_PIXEL_RATE);
+
+       imx728->ctrl.link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdr, &imx728=
_ctrl_ops,
+                                                V4L2_CID_LINK_FREQ,
+                                                ARRAY_SIZE(imx728_link_fre=
q_menu) - 1, 0,
+                                                imx728_link_freq_menu);
+
+       if (imx728->ctrl.link_freq)
+               imx728->ctrl.link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY=
;
+
+       imx728->subdev.ctrl_handler =3D ctrl_hdr;
+       if (imx728->ctrl.handler.error) {
+               ret =3D imx728->ctrl.handler.error;
+               dev_err(imx728->dev,
+                       "%s: failed to add the ctrls: %d\n", __func__, ret)=
;
+               goto err_ctrl_free;
+       }
+
+       pm_runtime_set_active(imx728->dev);
+       pm_runtime_enable(imx728->dev);
+       pm_runtime_set_autosuspend_delay(imx728->dev, IMX728_PM_IDLE_TIMEOU=
T);
+       pm_runtime_use_autosuspend(imx728->dev);
+       pm_runtime_get_noresume(imx728->dev);
+
+       ret =3D v4l2_subdev_init_finalize(sd);
+       if (ret < 0)
+               goto err_pm_disable;
+
+       ret =3D v4l2_async_register_subdev(sd);
+       if (ret < 0) {
+               dev_err(imx728->dev,
+                       "%s: v4l2 subdev register failed %d\n", __func__, r=
et);
+               goto err_subdev_cleanup;
+       }
+
+       dev_info(imx728->dev, "imx728 probed\n");
+       pm_runtime_mark_last_busy(imx728->dev);
+       pm_runtime_put_autosuspend(imx728->dev);
+       return 0;
+
+err_subdev_cleanup:
+       v4l2_subdev_cleanup(&imx728->subdev);
+
+err_pm_disable:
+       pm_runtime_dont_use_autosuspend(imx728->dev);
+       pm_runtime_put_noidle(imx728->dev);
+       pm_runtime_disable(imx728->dev);
+
+err_ctrl_free:
+       v4l2_ctrl_handler_free(ctrl_hdr);
+       mutex_destroy(&imx728->lock);
+
+err_media_cleanup:
+       media_entity_cleanup(&imx728->subdev.entity);
+
+       return ret;
+}
+
+static int __maybe_unused imx728_runtime_resume(struct device *dev)
+{
+       struct i2c_client *client =3D to_i2c_client(dev);
+       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+       struct imx728 *imx728 =3D to_imx728(sd);
+       int ret;
+
+       ret =3D imx728_power_on(imx728);
+       if (ret < 0)
+               return ret;
+
+       return 0;
+}
+
+static int __maybe_unused imx728_runtime_suspend(struct device *dev)
+{
+       struct i2c_client *client =3D to_i2c_client(dev);
+       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+       struct imx728 *imx728 =3D to_imx728(sd);
+
+       imx728_power_off(imx728);
+
+       return 0;
+}
+
+static int __maybe_unused imx728_suspend(struct device *dev)
+{
+       struct i2c_client *client =3D to_i2c_client(dev);
+       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+       struct imx728 *imx728 =3D to_imx728(sd);
+       int ret;
+
+       if (imx728->streaming)
+               imx728_stop_stream(imx728);
+
+       ret =3D pm_runtime_force_suspend(dev);
+       if (ret < 0)
+               dev_warn(dev, "%s: failed to suspend: %i\n", __func__, ret)=
;
+
+       return 0;
+}
+
+static int __maybe_unused imx728_resume(struct device *dev)
+{
+       struct i2c_client *client =3D to_i2c_client(dev);
+       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+       struct imx728 *imx728 =3D to_imx728(sd);
+       int ret;
+
+       ret =3D pm_runtime_force_resume(dev);
+       if (ret < 0)
+               dev_warn(dev, "%s: failed to resume: %i\n", __func__, ret);
+
+       if (imx728->streaming)
+               ret =3D imx728_start_stream(imx728);
+
+       if (ret < 0) {
+               imx728_stop_stream(imx728);
+               imx728->streaming =3D 0;
+               return ret;
+       }
+
+       return 0;
+}
+
+static void imx728_remove(struct i2c_client *client)
+{
+       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
+       struct imx728 *imx728 =3D to_imx728(sd);
+
+       v4l2_async_unregister_subdev(sd);
+       v4l2_ctrl_handler_free(&imx728->ctrl.handler);
+       v4l2_subdev_cleanup(&imx728->subdev);
+       media_entity_cleanup(&sd->entity);
+       mutex_destroy(&imx728->lock);
+
+       pm_runtime_disable(imx728->dev);
+       pm_runtime_dont_use_autosuspend(imx728->dev);
+       pm_runtime_set_suspended(imx728->dev);
+}
+
+static const struct dev_pm_ops imx728_pm_ops =3D {
+       SET_RUNTIME_PM_OPS(imx728_runtime_suspend,
+                          imx728_runtime_resume, NULL)
+       SET_SYSTEM_SLEEP_PM_OPS(imx728_suspend, imx728_resume)
+};
+
+static const struct of_device_id imx728_dt_id[] =3D {
+       { .compatible =3D "sony,imx728" },
+       { /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, imx728_dt_id);
+
+static struct i2c_driver imx728_i2c_driver =3D {
+       .driver =3D {
+               .name =3D "imx728",
+               .of_match_table =3D of_match_ptr(imx728_dt_id),
+               .pm =3D &imx728_pm_ops,
+       },
+       .probe =3D imx728_probe,
+       .remove =3D imx728_remove,
+};
+
+module_i2c_driver(imx728_i2c_driver);
+
+MODULE_DESCRIPTION("Camera Sensor Driver for Sony IMX728");
+MODULE_AUTHOR("Spencer Hill <shill@d3engineering.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/imx728.h b/drivers/media/i2c/imx728.h
new file mode 100644
index 000000000000..6f320214b780
--- /dev/null
+++ b/drivers/media/i2c/imx728.h
@@ -0,0 +1,3458 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Sony IMX728 CMOS Image Sensor Driver
+ *
+ * Copyright (c) 2024 Define Design Deploy Corp
+ */
+
+#include <linux/types.h>
+
+#define IMX728_OUT_WIDTH               3840
+#define IMX728_OUT_HEIGHT              2160
+
+#define IMX728_FRAMERATE_MAX           30
+#define IMX728_FRAMERATE_DEFAULT       30
+#define IMX728_FRAMERATE_MIN           10
+
+#define IMX728_PIXEL_RATE              225504000
+#define IMX728_LINK_FREQ               800000000
+
+#define IMX728_EXPOSURE_DEFAULT                10000
+
+#define IMX728_PM_IDLE_TIMEOUT         1000
+
+
+#define IMX728_REG_CTRL_POINT_X(i) (0xA198 + (i) * 8)
+#define IMX728_REG_CTRL_POINT_Y(i) (IMX728_REG_CTRL_POINT_X(i) + 4)
+
+enum imx728_sensor_state {
+       IMX728_SENSOR_STATE_SLEEP               =3D 0x02,
+       IMX728_SENSOR_STATE_STANDBY             =3D 0x04,
+       IMX728_SENSOR_STATE_STREAMING           =3D 0x10,
+       IMX728_SENSOR_STATE_SAFE                =3D 0x20,
+};
+
+
+enum imx728_remap_mode_id {
+       IMX728_REMAP_MODE_STANDBY =3D 0x00,
+       IMX728_REMAP_MODE_STANDBY_PIXEL_SHADING_COMPENSATION =3D 0x01,
+       IMX728_REMAP_MODE_STANDBY_SPOT_PIXEL_COMPENSATION =3D 0x02,
+       IMX728_REMAP_MODE_STREAMING =3D 0x04,
+       IMX728_REMAP_MODE_STREAMING_PIXEL_SHADING_COMPENSATION =3D 0x05,
+       IMX728_REMAP_MODE_STREAMING_SPOT_PIXEL_COMPENSATION =3D 0x06,
+       IMX728_REMAP_MODE_SLEEP =3D 0x20,
+};
+
+enum imx728_drive_mode {
+       IMX728_MODE_3856x2176_45_4LANE_RAW10 =3D 0x01,
+       IMX728_MODE_3856x2176_45_4LANE_RAW12 =3D 0x02,
+       IMX728_MODE_3856x2176_45_4LANE_RAW16 =3D 0x03,
+       IMX728_MODE_3856x2176_45_4LANE_RAW20 =3D 0x04,
+       IMX728_MODE_3856x2176_45_4LANE_RAW12_HDR =3D 0x05,
+       IMX728_MODE_3856x2176_40_4LANE_RAW10 =3D 0x11,
+       IMX728_MODE_3856x2176_40_4LANE_RAW12 =3D 0x12,
+       IMX728_MODE_3856x2176_40_4LANE_RAW16 =3D 0x13,
+       IMX728_MODE_3856x2176_40_4LANE_RAW20 =3D 0x14,
+       IMX728_MODE_3856x2176_40_4LANE_RAW12_HDR =3D 0x16,
+};
+
+enum imx728_awbmode {
+       IMX728_AWBMODE_ATW =3D 0,
+       IMX728_AWBMODE_ALL_PULL_IN =3D 1,
+       IMX728_AWBMODE_USER_PRESET =3D 2,
+       IMX728_AWBMODE_FULL_MWB =3D 3,
+       IMX728_AWBMODE_HOLD =3D 4,
+};
+
+enum imx728_img_raw_mode {
+       IMX728_IMG_MODE_LINEAR =3D 0x0,
+       IMX728_IMG_MODE_LI =3D 0x1,
+       IMX728_IMG_MODE_HDR =3D 0x2,
+       IMX728_IMG_MODE_LI_HDR =3D 0x3,
+};
+
+enum imx728_aemode {
+       IMX728_AEMODE_AE_AUTO  =3D 0,
+       IMX728_AEMODE_AE_HOLD  =3D 1,
+       IMX728_AEMODE_SCALE_ME =3D 2,
+       IMX728_AEMODE_FULL_ME  =3D 3,
+};
+
+enum imx728_fme_shtval_unit {
+       IMX728_FME_SHTVAL_UNIT_LINES            =3D 1,
+       IMX728_FME_SHTVAL_UNIT_MICROSECONDS     =3D 3,
+       IMX728_FME_SHTVAL_UNIT_FRAMES           =3D 4,
+};
+
+enum imx728_linear_raw_sel {
+       IMX728_RAW_SEL_SP1H =3D 0x0,
+       IMX728_RAW_SEL_SP1L =3D 0x1,
+       IMX728_RAW_SEL_SP1EC =3D 0x2,
+       IMX728_RAW_SEL_SP2 =3D 0x3,
+       IMX728_RAW_SEL_SP1VS =3D 0x4
+};
+
+enum imx728_binn_avg {
+       IMX728_BINN_SIMPLE_AVG,
+       IMX728_BINN_WEIGHTED_AVG,
+};
+
+struct imx728_ctrl {
+       struct v4l2_ctrl_handler handler;
+       struct v4l2_ctrl *wdr;
+       struct v4l2_ctrl *exposure;
+       struct v4l2_ctrl *again;
+       struct v4l2_ctrl *h_flip;
+       struct v4l2_ctrl *v_flip;
+       struct v4l2_ctrl *pg_mode;
+       struct v4l2_ctrl *pixel_rate;
+       struct v4l2_ctrl *link_freq;
+};
+
+struct imx728_ctrl_point {
+       int x, y;
+};
+
+/*
+ * struct imx728 - imx728 device structure
+ * @dev: Device handle
+ * @clk: Pointer to imx728 clock
+ * @client: Pointer to I2C client
+ * @regmap: Pointer to regmap structure
+ * @xclr_gpio: Pointer to XCLR gpio
+ * @subdev: V4L2 subdevice structure
+ * @format: V4L2 media bus frame format structure
+ *             (width and height are in sync with the compose rect)
+ * @pad: Media pad structure
+ * @ctrl: imx728 control structure
+ * @clk_rate: Frequency of imx728 clock
+ * @lock: Mutex structure for V4L2 ctrl handler
+ * @streaming: Flag to store streaming on/off status
+ */
+struct imx728 {
+       struct device *dev;
+
+       struct clk *clk;
+       struct i2c_client *client;
+       struct regmap *regmap;
+       struct gpio_desc *xclr_gpio;
+
+       struct v4l2_subdev subdev;
+       struct v4l2_mbus_framefmt format;
+       struct media_pad pad;
+
+       struct imx728_ctrl ctrl;
+
+       unsigned long clk_rate;
+       u32 fps;
+
+       struct mutex lock;
+       bool streaming;
+};
+
+static const struct v4l2_area imx728_framesizes[] =3D {
+       {
+               .width =3D IMX728_OUT_WIDTH,
+               .height =3D IMX728_OUT_HEIGHT,
+       },
+};
+
+static const u32 imx728_mbus_formats[] =3D {
+       MEDIA_BUS_FMT_SRGGB10_1X10,
+};
+
+static const s64 imx728_link_freq_menu[] =3D {
+       IMX728_LINK_FREQ,
+};
+
+static const struct regmap_config imx728_regmap_config =3D {
+       .reg_bits =3D 16,
+       .val_bits =3D 8,
+};
+
+static const char *const imx728_ctrl_pg_qmenu[] =3D {
+       "Disabled",
+       "Horizontal Color Bars",
+       "Vertical Color Bars",
+};
+
+static struct imx728_ctrl_point imx728_hdr_20bit[] =3D {
+       {0, 0},
+       {1566 >> 4, 938},
+       {105740 >> 4, 1863},
+       {387380 >> 4, 2396},
+       {3818601 >> 4, 3251},
+       {16777215 >> 4, 4095},
+       {-1, -1}
+};
+
+static const struct reg_sequence imx728_3840x2160[] =3D {
+       {0xFFFF, 0x00, 1000},
+       {0x1749, 0x01},
+       {0x174B, 0x01},
+       {0x2DD4, 0x00},
+       {0x2DD5, 0x00},
+       {0x2DD6, 0x00},
+       {0x2DD7, 0x00},
+       {0x2DD8, 0x00},
+       {0x2DD9, 0x00},
+       {0x2DDC, 0x00},
+       {0x2DDD, 0x00},
+       {0x2DE6, 0x00},
+       {0x2DE7, 0x00},
+       {0x2DE8, 0x00},
+       {0x2DE9, 0x00},
+       {0x2DEA, 0x00},
+       {0x2DEB, 0x00},
+       {0x2DEE, 0x00},
+       {0x2DEF, 0x00},
+       {0x2DF8, 0x00},
+       {0x2DF9, 0x00},
+       {0x2DFA, 0x00},
+       {0x2DFB, 0x00},
+       {0x2DFC, 0x00},
+       {0x2DFD, 0x00},
+       {0x2E00, 0x00},
+       {0x2E01, 0x00},
+       {0x2E3A, 0x05},
+       {0x2E3B, 0x00},
+       {0x2EA0, 0xEE},
+       {0x2EA1, 0x31},
+       {0x2EA2, 0x84},
+       {0x2EA3, 0x86},
+       {0x2EDD, 0x01},
+       {0x2F4A, 0x20},
+       {0x2F4B, 0x00},
+       {0x2F56, 0x00},
+       {0x2F57, 0x00},
+       {0x2F98, 0x8D},
+       {0x2F99, 0x00},
+       {0x3018, 0x8D},
+       {0x3019, 0x00},
+       {0x306A, 0x00},
+       {0x306B, 0x00},
+       {0x306C, 0x00},
+       {0x306D, 0x00},
+       {0x306E, 0x01},
+       {0x306F, 0x00},
+       {0x3070, 0x06},
+       {0x3071, 0x00},
+       {0x3072, 0x07},
+       {0x3073, 0x00},
+       {0x3074, 0xC9},
+       {0x3075, 0x08},
+       {0x3082, 0xCC},
+       {0x3083, 0x08},
+       {0x3084, 0xCD},
+       {0x3085, 0x08},
+       {0x30ED, 0x11},
+       {0x30EE, 0x1F},
+       {0x30EF, 0x11},
+       {0x30F0, 0x0D},
+       {0x30F1, 0x1F},
+       {0x30F2, 0x1F},
+       {0x3142, 0x00},
+       {0x315E, 0xD4},
+       {0x315F, 0x01},
+       {0x3176, 0xE0},
+       {0x3177, 0x01},
+       {0x31AA, 0x16},
+       {0x31AB, 0x01},
+       {0x31AE, 0x89},
+       {0x31AF, 0x01},
+       {0x31D4, 0xD5},
+       {0x31D5, 0x01},
+       {0x31EC, 0xE1},
+       {0x31ED, 0x01},
+       {0x3220, 0x17},
+       {0x3221, 0x01},
+       {0x3224, 0x8A},
+       {0x3225, 0x01},
+       {0x3256, 0xFF},
+       {0x3257, 0x07},
+       {0x326E, 0x05},
+       {0x326F, 0x03},
+       {0x32A2, 0xFF},
+       {0x32A3, 0x07},
+       {0x32BA, 0xFF},
+       {0x32BB, 0x07},
+       {0x32D0, 0xFF},
+       {0x32D1, 0x07},
+       {0x32D2, 0xFF},
+       {0x32D3, 0x07},
+       {0x32E8, 0xFF},
+       {0x32E9, 0x07},
+       {0x32EA, 0xFF},
+       {0x32EB, 0x07},
+       {0x331C, 0xFF},
+       {0x331D, 0x07},
+       {0x331E, 0xFF},
+       {0x331F, 0x07},
+       {0x3334, 0xFF},
+       {0x3335, 0x07},
+       {0x3336, 0xFF},
+       {0x3337, 0x07},
+       {0x334C, 0xFF},
+       {0x334D, 0x07},
+       {0x3398, 0xFF},
+       {0x3399, 0x07},
+       {0x33B0, 0xFF},
+       {0x33B1, 0x07},
+       {0x33C6, 0xFF},
+       {0x33C7, 0x07},
+       {0x33D2, 0x00},
+       {0x33D3, 0x03},
+       {0x3402, 0xFF},
+       {0x3403, 0x07},
+       {0x3412, 0xFF},
+       {0x3413, 0x07},
+       {0x3420, 0xFF},
+       {0x3421, 0x07},
+       {0x3422, 0xFF},
+       {0x3423, 0x07},
+       {0x3450, 0xFF},
+       {0x3451, 0x07},
+       {0x3452, 0xFF},
+       {0x3453, 0x07},
+       {0x346C, 0x28},
+       {0x346D, 0x01},
+       {0x3470, 0xFF},
+       {0x3471, 0x07},
+       {0x347C, 0x01},
+       {0x347D, 0x03},
+       {0x34A8, 0x6A},
+       {0x34A9, 0x00},
+       {0x34AC, 0xFF},
+       {0x34AD, 0x07},
+       {0x34BC, 0xFF},
+       {0x34BD, 0x07},
+       {0x3556, 0x03},
+       {0x3557, 0x03},
+       {0x3562, 0xFB},
+       {0x3563, 0x02},
+       {0x357A, 0x45},
+       {0x357B, 0x02},
+       {0x3586, 0x44},
+       {0x3587, 0x02},
+       {0x35B8, 0x04},
+       {0x35B9, 0x03},
+       {0x35C4, 0xFC},
+       {0x35C5, 0x02},
+       {0x35DC, 0x46},
+       {0x35DD, 0x02},
+       {0x35E8, 0x45},
+       {0x35E9, 0x02},
+       {0x35F4, 0xD6},
+       {0x35F5, 0x01},
+       {0x3608, 0x18},
+       {0x3609, 0x01},
+       {0x3636, 0xD5},
+       {0x3637, 0x01},
+       {0x364A, 0x17},
+       {0x364B, 0x01},
+       {0x37B0, 0xC1},
+       {0x37B1, 0x00},
+       {0x37B2, 0xDC},
+       {0x37B3, 0x01},
+       {0x37B4, 0x03},
+       {0x37B5, 0x02},
+       {0x37B6, 0x33},
+       {0x37B7, 0x02},
+       {0x3800, 0xDD},
+       {0x3801, 0x01},
+       {0x3802, 0xC0},
+       {0x3803, 0x00},
+       {0x3804, 0x34},
+       {0x3805, 0x02},
+       {0x3806, 0x02},
+       {0x3807, 0x02},
+       {0x3B10, 0xFF},
+       {0x3B11, 0x07},
+       {0x3B12, 0x00},
+       {0x3B13, 0x00},
+       {0x3B1A, 0x00},
+       {0x3B1B, 0x00},
+       {0x3B20, 0xFF},
+       {0x3B21, 0x07},
+       {0x3B22, 0x00},
+       {0x3B23, 0x00},
+       {0x3B40, 0x00},
+       {0x3B41, 0x00},
+       {0x3B42, 0xFF},
+       {0x3B43, 0x07},
+       {0x3B48, 0x00},
+       {0x3B49, 0x00},
+       {0x3B50, 0x00},
+       {0x3B51, 0x00},
+       {0x3B52, 0xFF},
+       {0x3B53, 0x07},
+       {0x3B66, 0xD4},
+       {0x3B67, 0x01},
+       {0x3BBA, 0x16},
+       {0x3BBB, 0x01},
+       {0x3BF4, 0xD5},
+       {0x3BF5, 0x01},
+       {0x3C48, 0x17},
+       {0x3C49, 0x01},
+       {0x3D0C, 0xFF},
+       {0x3D0D, 0x07},
+       {0x3D0E, 0xFF},
+       {0x3D0F, 0x07},
+       {0x3D5C, 0xFF},
+       {0x3D5D, 0x07},
+       {0x3D5E, 0xFF},
+       {0x3D5F, 0x07},
+       {0x3D7C, 0xCE},
+       {0x3D7D, 0x01},
+       {0x3DD8, 0x10},
+       {0x3DD9, 0x01},
+       {0x3DDA, 0x46},
+       {0x3DDB, 0x01},
+       {0x3DFC, 0x2C},
+       {0x3DFD, 0x01},
+       {0x3E34, 0x6E},
+       {0x3E35, 0x00},
+       {0x3EBA, 0xD7},
+       {0x3EBB, 0x00},
+       {0x3EBE, 0xFF},
+       {0x3EBF, 0x07},
+       {0x3EC2, 0xFF},
+       {0x3EC3, 0x07},
+       {0x3EEE, 0xFF},
+       {0x3EEF, 0x07},
+       {0x3EF2, 0xFF},
+       {0x3EF3, 0x07},
+       {0x3EFA, 0xD7},
+       {0x3EFB, 0x00},
+       {0x3EFE, 0xFF},
+       {0x3EFF, 0x07},
+       {0x3F02, 0xFF},
+       {0x3F03, 0x07},
+       {0x3F08, 0xD8},
+       {0x3F09, 0x00},
+       {0x3F0A, 0xDC},
+       {0x3F0B, 0x00},
+       {0x3F0C, 0xFF},
+       {0x3F0D, 0x07},
+       {0x3F0E, 0xFF},
+       {0x3F0F, 0x07},
+       {0x3F10, 0xFF},
+       {0x3F11, 0x07},
+       {0x3F12, 0xFF},
+       {0x3F13, 0x07},
+       {0x3F3C, 0xFF},
+       {0x3F3D, 0x07},
+       {0x3F3E, 0xFF},
+       {0x3F3F, 0x07},
+       {0x3F40, 0xFF},
+       {0x3F41, 0x07},
+       {0x3F42, 0xFF},
+       {0x3F43, 0x07},
+       {0x3F48, 0xD8},
+       {0x3F49, 0x00},
+       {0x3F4A, 0xDC},
+       {0x3F4B, 0x00},
+       {0x3F4C, 0xFF},
+       {0x3F4D, 0x07},
+       {0x3F4E, 0xFF},
+       {0x3F4F, 0x07},
+       {0x3F50, 0xFF},
+       {0x3F51, 0x07},
+       {0x3F52, 0xFF},
+       {0x3F53, 0x07},
+       {0x3F58, 0xDD},
+       {0x3F59, 0x00},
+       {0x3F5C, 0xFF},
+       {0x3F5D, 0x07},
+       {0x3F60, 0xFF},
+       {0x3F61, 0x07},
+       {0x3F8C, 0xFF},
+       {0x3F8D, 0x07},
+       {0x3F90, 0xFF},
+       {0x3F91, 0x07},
+       {0x3F98, 0xDD},
+       {0x3F99, 0x00},
+       {0x3F9C, 0xFF},
+       {0x3F9D, 0x07},
+       {0x3FA0, 0xFF},
+       {0x3FA1, 0x07},
+       {0x3FAA, 0xC7},
+       {0x3FAB, 0x00},
+       {0x3FAC, 0xE0},
+       {0x3FAD, 0x00},
+       {0x3FEA, 0xC7},
+       {0x3FEB, 0x00},
+       {0x3FEC, 0xE0},
+       {0x3FED, 0x00},
+       {0x3FF8, 0xC8},
+       {0x3FF9, 0x00},
+       {0x3FFA, 0xCC},
+       {0x3FFB, 0x00},
+       {0x4038, 0xC8},
+       {0x4039, 0x00},
+       {0x403A, 0xCC},
+       {0x403B, 0x00},
+       {0x4048, 0xCD},
+       {0x4049, 0x00},
+       {0x404E, 0xDF},
+       {0x404F, 0x00},
+       {0x4088, 0xCD},
+       {0x4089, 0x00},
+       {0x408E, 0xDF},
+       {0x408F, 0x00},
+       {0x4408, 0xFF},
+       {0x4409, 0x07},
+       {0x4410, 0xFF},
+       {0x4411, 0x07},
+       {0x4418, 0xFF},
+       {0x4419, 0x07},
+       {0x4420, 0xFF},
+       {0x4421, 0x07},
+       {0x4428, 0xFF},
+       {0x4429, 0x07},
+       {0x4430, 0xFF},
+       {0x4431, 0x07},
+       {0x4436, 0xFF},
+       {0x4437, 0x07},
+       {0x4444, 0xFF},
+       {0x4445, 0x07},
+       {0x4464, 0xFF},
+       {0x4465, 0x07},
+       {0x4474, 0xFF},
+       {0x4475, 0x07},
+       {0x44A7, 0x2E},
+       {0x4594, 0x1B},
+       {0x4596, 0x1F},
+       {0x459B, 0x1B},
+       {0x459D, 0x1F},
+       {0x45A1, 0x14},
+       {0x45A4, 0x16},
+       {0x45A6, 0x14},
+       {0x45AB, 0x16},
+       {0x45AC, 0x11},
+       {0x45AD, 0x11},
+       {0x45AE, 0x0B},
+       {0x45AF, 0x0B},
+       {0x45B0, 0x0B},
+       {0x45B1, 0x0B},
+       {0x45B2, 0x1F},
+       {0x45B3, 0x0B},
+       {0x45B4, 0x0B},
+       {0x45B5, 0x1F},
+       {0x45B6, 0x1F},
+       {0x45B7, 0x1F},
+       {0x45B8, 0x1F},
+       {0x45B9, 0x1F},
+       {0x45BA, 0x1F},
+       {0x45BB, 0x1F},
+       {0x45BC, 0x1F},
+       {0x45BD, 0x1F},
+       {0x45BE, 0x0D},
+       {0x45BF, 0x0D},
+       {0x45C0, 0x0B},
+       {0x45C1, 0x0B},
+       {0x45C2, 0x0B},
+       {0x45C3, 0x0B},
+       {0x45C4, 0x1F},
+       {0x45C5, 0x0B},
+       {0x45C6, 0x0B},
+       {0x460B, 0x01},
+       {0x465A, 0x08},
+       {0x465B, 0x00},
+       {0x465C, 0x00},
+       {0x465D, 0x00},
+       {0x465E, 0x06},
+       {0x4660, 0x00},
+       {0x4661, 0x00},
+       {0x4662, 0x00},
+       {0x4663, 0x00},
+       {0x4664, 0x00},
+       {0x4665, 0x00},
+       {0x4666, 0x00},
+       {0x4667, 0x00},
+       {0x4668, 0x00},
+       {0x4669, 0x00},
+       {0x466A, 0x04},
+       {0x466C, 0x00},
+       {0x466D, 0x00},
+       {0x466E, 0x06},
+       {0x4670, 0x00},
+       {0x4671, 0x00},
+       {0x4672, 0x00},
+       {0x4673, 0x00},
+       {0x4674, 0x00},
+       {0x4675, 0x00},
+       {0x4676, 0x00},
+       {0x4677, 0x00},
+       {0x4678, 0x00},
+       {0x4679, 0x00},
+       {0x46AE, 0xCA},
+       {0x46AF, 0x00},
+       {0x46B0, 0xB8},
+       {0x46B1, 0x01},
+       {0x46B6, 0x34},
+       {0x46B7, 0x02},
+       {0x46B8, 0x87},
+       {0x46B9, 0x02},
+       {0x46BA, 0x94},
+       {0x46BB, 0x06},
+       {0x46D2, 0xA0},
+       {0x46D3, 0x04},
+       {0x4778, 0x02},
+       {0x4779, 0x02},
+       {0x477A, 0x02},
+       {0x477B, 0x02},
+       {0x477C, 0x02},
+       {0x477D, 0x02},
+       {0x477E, 0x02},
+       {0x477F, 0x02},
+       {0x4782, 0x03},
+       {0x4786, 0x03},
+       {0x4788, 0x03},
+       {0x4789, 0x03},
+       {0x478A, 0x03},
+       {0x478C, 0x03},
+       {0x478D, 0x03},
+       {0x478E, 0x03},
+       {0x4792, 0x03},
+       {0x4796, 0x03},
+       {0x4798, 0x01},
+       {0x4799, 0x02},
+       {0x479A, 0x03},
+       {0x479C, 0x03},
+       {0x479D, 0x03},
+       {0x479E, 0x03},
+       {0x47A3, 0x01},
+       {0x47AB, 0x00},
+       {0x47AD, 0x00},
+       {0x47F4, 0x12},
+       {0x47F6, 0x0C},
+       {0x47FA, 0x09},
+       {0x47FB, 0x0B},
+       {0x47FC, 0x0A},
+       {0x4801, 0x05},
+       {0x4802, 0x04},
+       {0x4803, 0x06},
+       {0x4804, 0x05},
+       {0x4805, 0x04},
+       {0x480A, 0x0D},
+       {0x480B, 0x14},
+       {0x480C, 0x10},
+       {0x480D, 0x12},
+       {0x480E, 0x16},
+       {0x4815, 0x09},
+       {0x4816, 0x05},
+       {0x4817, 0x08},
+       {0x481E, 0x09},
+       {0x481F, 0x09},
+       {0x4820, 0x0D},
+       {0x4827, 0x09},
+       {0x4828, 0x07},
+       {0x4829, 0x0B},
+       {0x482E, 0x0F},
+       {0x482F, 0x0F},
+       {0x4830, 0x0A},
+       {0x4831, 0x0A},
+       {0x48F6, 0xE2},
+       {0x48F7, 0x00},
+       {0x48F8, 0x84},
+       {0x48F9, 0x00},
+       {0x48FA, 0x80},
+       {0x48FB, 0x00},
+       {0x48FC, 0x45},
+       {0x48FD, 0x00},
+       {0x48FE, 0x70},
+       {0x48FF, 0x00},
+       {0x4902, 0xB9},
+       {0x4903, 0x00},
+       {0x4904, 0x45},
+       {0x4905, 0x00},
+       {0x4906, 0x1F},
+       {0x4907, 0x1F},
+       {0x4908, 0x18},
+       {0x4909, 0x1F},
+       {0x490A, 0x1E},
+       {0x490C, 0x0A},
+       {0x490D, 0x1F},
+       {0x490E, 0x00},
+       {0x490F, 0x00},
+       {0x4910, 0x06},
+       {0x4911, 0x00},
+       {0x4912, 0x00},
+       {0x4915, 0x00},
+       {0x491C, 0x78},
+       {0x491D, 0x78},
+       {0x491E, 0x78},
+       {0x491F, 0x78},
+       {0x4924, 0x61},
+       {0x4925, 0x61},
+       {0x4926, 0x61},
+       {0x4927, 0x61},
+       {0x4928, 0x5F},
+       {0x4929, 0x5F},
+       {0x492A, 0x5F},
+       {0x492B, 0x5F},
+       {0x492C, 0x78},
+       {0x492D, 0x78},
+       {0x492E, 0x78},
+       {0x492F, 0x78},
+       {0x4930, 0x78},
+       {0x4931, 0x78},
+       {0x4932, 0x78},
+       {0x4933, 0x78},
+       {0x4934, 0x78},
+       {0x4935, 0x78},
+       {0x4936, 0x78},
+       {0x4937, 0x78},
+       {0x4938, 0x5F},
+       {0x4939, 0x5F},
+       {0x493A, 0x5F},
+       {0x493B, 0x5F},
+       {0x4942, 0x0A},
+       {0x4943, 0x0A},
+       {0x4944, 0x0A},
+       {0x4945, 0x0A},
+       {0x4947, 0x1F},
+       {0x4948, 0x1F},
+       {0x4949, 0x1F},
+       {0x494A, 0x0C},
+       {0x494B, 0x0C},
+       {0x494C, 0x0C},
+       {0x494D, 0x0C},
+       {0x494E, 0x0E},
+       {0x494F, 0x0E},
+       {0x4950, 0x0E},
+       {0x4951, 0x0E},
+       {0x4952, 0x11},
+       {0x4953, 0x11},
+       {0x4954, 0x11},
+       {0x4955, 0x11},
+       {0x4956, 0x0E},
+       {0x4957, 0x0E},
+       {0x4958, 0x0E},
+       {0x4959, 0x0E},
+       {0x495A, 0x10},
+       {0x495B, 0x10},
+       {0x495C, 0x10},
+       {0x495D, 0x10},
+       {0x495E, 0x0E},
+       {0x495F, 0x0E},
+       {0x4960, 0x0E},
+       {0x4961, 0x0E},
+       {0x4970, 0x00},
+       {0x4971, 0x00},
+       {0x4972, 0x00},
+       {0x4973, 0x00},
+       {0x4974, 0x00},
+       {0x4975, 0x00},
+       {0x4976, 0x00},
+       {0x4977, 0x00},
+       {0x4978, 0x04},
+       {0x4979, 0x04},
+       {0x497A, 0x04},
+       {0x497B, 0x04},
+       {0x497C, 0x03},
+       {0x497D, 0x03},
+       {0x497E, 0x03},
+       {0x497F, 0x03},
+       {0x4980, 0x05},
+       {0x4981, 0x05},
+       {0x4982, 0x05},
+       {0x4983, 0x05},
+       {0x4984, 0x00},
+       {0x4985, 0x00},
+       {0x4986, 0x00},
+       {0x4987, 0x00},
+       {0x4A68, 0x72},
+       {0x4A69, 0x00},
+       {0x4A6A, 0x6E},
+       {0x4A6B, 0x00},
+       {0x4A9C, 0x6E},
+       {0x4A9D, 0x00},
+       {0x4BB8, 0x00},
+       {0x4BB9, 0x00},
+       {0x4BBA, 0xFF},
+       {0x4BBB, 0x03},
+       {0x4BC0, 0x00},
+       {0x4BC1, 0x00},
+       {0x4BC2, 0xFF},
+       {0x4BC3, 0x03},
+       {0x4C46, 0x6E},
+       {0x4C47, 0x00},
+       {0x4CDA, 0x28},
+       {0x4CDB, 0x00},
+       {0x4CDE, 0x7B},
+       {0x4CDF, 0x00},
+       {0x4CE2, 0x28},
+       {0x4CE3, 0x00},
+       {0x4EEA, 0x70},
+       {0x4EEB, 0x00},
+       {0x4F00, 0x6C},
+       {0x4F01, 0x00},
+       {0x5072, 0x6C},
+       {0x5073, 0x00},
+       {0x5086, 0x6C},
+       {0x5087, 0x00},
+       {0x55A0, 0x3A},
+       {0x55A1, 0x00},
+       {0x55A6, 0x7A},
+       {0x55A7, 0x01},
+       {0x55A8, 0x3A},
+       {0x55A9, 0x00},
+       {0x55AE, 0xBB},
+       {0x55AF, 0x00},
+       {0x55B2, 0x60},
+       {0x55B3, 0x00},
+       {0x55B4, 0x86},
+       {0x55B5, 0x00},
+       {0x55B6, 0xB7},
+       {0x55B7, 0x00},
+       {0x55B8, 0x17},
+       {0x55B9, 0x00},
+       {0x55BA, 0x5F},
+       {0x55BB, 0x00},
+       {0x55BC, 0x8D},
+       {0x55BD, 0x00},
+       {0x55BE, 0xBB},
+       {0x55BF, 0x00},
+       {0x594C, 0xFF},
+       {0x594D, 0x03},
+       {0x594E, 0xFF},
+       {0x594F, 0x03},
+       {0x5950, 0xFF},
+       {0x5951, 0x03},
+       {0x5952, 0xFF},
+       {0x5953, 0x03},
+       {0x961C, 0x00},
+       {0x961D, 0x03},
+       {0x9722, 0x09},
+       {0x9788, 0x01},
+       {0x9796, 0xD0},
+       {0x9797, 0x0A},
+       {0x9798, 0xE0},
+       {0x9799, 0x00},
+       {0x979C, 0xD0},
+       {0x979D, 0x0A},
+       {0x979E, 0xE0},
+       {0x979F, 0x00},
+       {0x97A0, 0xC0},
+       {0x97A1, 0xDF},
+       {0x97A2, 0x80},
+       {0x97A3, 0xAC},
+       {0x97A4, 0x80},
+       {0x97A5, 0x7A},
+       {0x97A6, 0x00},
+       {0x97A7, 0x4B},
+       {0x97A8, 0x00},
+       {0x97A9, 0x50},
+       {0x97AA, 0x20},
+       {0x97AB, 0x35},
+       {0x97C4, 0xC5},
+       {0x97C5, 0x02},
+       {0xB51D, 0x01},
+       {0xB526, 0x00},
+       {0xB527, 0x05},
+       {0xB52A, 0xC0},
+       {0xB52B, 0x03},
+       {0xB644, 0x70},
+       {0xB645, 0x03},
+       {0xB646, 0x00},
+       {0xB647, 0x00},
+       {0xB68A, 0x00},
+       {0xB68B, 0x03},
+       {0xB6CC, 0x00},
+       {0xB6CD, 0x05},
+       {0xB6D0, 0xC0},
+       {0xB6D1, 0x03},
+       {0xB6E8, 0x51},
+       {0xB6E9, 0x05},
+       {0xB6EA, 0x51},
+       {0xB6EB, 0x01},
+       {0xB6EC, 0x40},
+       {0xB6ED, 0x05},
+       {0xB6EE, 0x55},
+       {0xB6EF, 0x55},
+       {0xB6F0, 0x55},
+       {0xB6F1, 0x55},
+       {0xB6F2, 0x55},
+       {0xB6F3, 0x01},
+       {0xB7DC, 0x01},
+       {0xB7DD, 0x01},
+       {0xB7DE, 0x01},
+       {0xEC40, 0x70},
+       {0xEC41, 0x03},
+       {0xEC42, 0x00},
+       {0xEC43, 0x00},
+       {0xEC7E, 0x00},
+       {0xEC81, 0x01},
+       {0x9714, 0x00},
+       {0xB684, 0x00},
+       {0x2DCC, 0xED},
+       {0x2DCD, 0x07},
+       {0x2DCE, 0xEC},
+       {0x2DCF, 0x07},
+       {0x2DDE, 0xE7},
+       {0x2DDF, 0x07},
+       {0x2DE0, 0xE6},
+       {0x2DE1, 0x07},
+       {0x2E02, 0xEC},
+       {0x2E03, 0x07},
+       {0x2E04, 0xED},
+       {0x2E05, 0x07},
+       {0x2E06, 0xE6},
+       {0x2E07, 0x07},
+       {0x2E08, 0xE7},
+       {0x2E09, 0x07},
+       {0x2E0E, 0xF0},
+       {0x2E0F, 0x07},
+       {0x2E10, 0xEA},
+       {0x2E11, 0x07},
+       {0x2E12, 0xEB},
+       {0x2E13, 0x07},
+       {0x2D98, 0x8A},
+       {0x2D99, 0x00},
+       {0x0000, 0xEE},
+       {0x0001, 0x08},
+       {0x0002, 0x00},
+       {0xEC9E, 0x04},
+       {0xEC9F, 0x01},
+       {0x2E40, 0x27},
+       {0x2E60, 0x57},
+       {0x2E61, 0x00},
+       {0x2E64, 0x17},
+       {0x2E65, 0x00},
+       {0x2E66, 0x1F},
+       {0x2E67, 0x00},
+       {0x2E68, 0x6F},
+       {0x2E69, 0x00},
+       {0x2E6A, 0x27},
+       {0x2E6B, 0x00},
+       {0x2E6C, 0x1F},
+       {0x2E6D, 0x00},
+       {0x2E6E, 0x37},
+       {0x2E6F, 0x00},
+       {0x2E70, 0x1F},
+       {0x2E71, 0x00},
+       {0x2E72, 0x17},
+       {0x2E73, 0x00},
+       {0x2E7A, 0x02},
+       {0xEC08, 0x10},
+       {0xEC09, 0x2B},
+       {0xEC54, 0xB8},
+       {0xEC55, 0xBB},
+       {0xEC56, 0xFF},
+       {0xEC57, 0xFF},
+       {0x2E28, 0xD0},
+       {0x2E29, 0x07},
+       {0x2E2A, 0x00},
+       {0x2E2C, 0xD0},
+       {0x2E2D, 0x07},
+       {0x2E2E, 0x00},
+       {0x2DC0, 0xD5},
+       {0x2DC1, 0x02},
+       {0xB52C, 0x01},
+       {0xB52E, 0x08},
+       {0xB52F, 0x00},
+       {0xB530, 0x00},
+       {0xB531, 0x0F},
+       {0xB532, 0x08},
+       {0xB533, 0x00},
+       {0xB534, 0x70},
+       {0xB535, 0x08},
+       {0xB6B9, 0x01},
+       {0xB6BA, 0x08},
+       {0xB6BB, 0x00},
+       {0xB6BC, 0x00},
+       {0xB6BD, 0x0F},
+       {0xB6BE, 0x08},
+       {0xB6BF, 0x00},
+       {0xB6C0, 0x70},
+       {0xB6C1, 0x08},
+       {0x9789, 0x01, 1000},
+       {0x95C1, 0x01, 1000},
+       {0xFFFF, 0x00, 1000},
+       {0x98B5, 0x00},
+       {0x98B6, 0xD8},
+       {0x98B7, 0xD8},
+       {0x98B8, 0xEC},
+       {0x98CA, 0x0F},
+       {0x98CB, 0x55},
+       {0x98CC, 0x0B},
+       {0x98D2, 0xD8},
+       {0x98D3, 0x27},
+       {0x98EC, 0x38},
+       {0x98ED, 0x00},
+       {0x98EE, 0x00},
+       {0x98EF, 0x00},
+       {0x98F0, 0x03},
+       {0x98F8, 0xB4},
+       {0x98F9, 0x00},
+       {0x98FA, 0x00},
+       {0x98FC, 0x4B},
+       {0x98FD, 0x00},
+       {0x98FE, 0x00},
+       {0x9900, 0x15},
+       {0x9901, 0x00},
+       {0x9902, 0x00},
+       {0x9904, 0x21},
+       {0x9905, 0x00},
+       {0x9906, 0x00},
+       {0x9908, 0x54},
+       {0x9909, 0x00},
+       {0x990A, 0x00},
+       {0x9921, 0x04},
+       {0x9923, 0x02},
+       {0x9925, 0x28},
+       {0x9926, 0x14},
+       {0x9938, 0x4B},
+       {0x993E, 0x15},
+       {0x9960, 0x01},
+       {0x9961, 0x03},
+       {0x9963, 0x02},
+       {0x9968, 0x40},
+       {0x9969, 0x1F},
+       {0x996A, 0x00},
+       {0x996B, 0x00},
+       {0x996C, 0xF8},
+       {0x996D, 0x2A},
+       {0x996E, 0x00},
+       {0x996F, 0x00},
+       {0x9970, 0x01},
+       {0x9971, 0x00},
+       {0x9972, 0x00},
+       {0x9973, 0x00},
+       {0x9975, 0x03},
+       {0x9976, 0x04},
+       {0x9982, 0xB4},
+       {0x9983, 0x00},
+       {0x999C, 0x78},
+       {0x999D, 0x28},
+       {0x99D8, 0x02},
+       {0x99DE, 0x19},
+       {0x99DF, 0x19},
+       {0x99E0, 0x19},
+       {0x99E1, 0x19},
+       {0x99E2, 0x19},
+       {0x99E3, 0x19},
+       {0x99E4, 0x19},
+       {0x99E5, 0x19},
+       {0x99E6, 0x19},
+       {0x99E7, 0x19},
+       {0x99E8, 0x19},
+       {0x99E9, 0x19},
+       {0x99EA, 0x19},
+       {0x99EB, 0x19},
+       {0x99EC, 0x19},
+       {0x99ED, 0x19},
+       {0x99EE, 0x19},
+       {0x99EF, 0x19},
+       {0x99F0, 0x32},
+       {0x99F1, 0x32},
+       {0x99F2, 0x32},
+       {0x99F3, 0x32},
+       {0x99F4, 0x32},
+       {0x99F5, 0x32},
+       {0x99F6, 0x32},
+       {0x99F7, 0x32},
+       {0x99F8, 0x32},
+       {0x99F9, 0x64},
+       {0x99FA, 0x64},
+       {0x99FB, 0x64},
+       {0x99FC, 0x64},
+       {0x99FD, 0x64},
+       {0x99FE, 0x64},
+       {0x99FF, 0x64},
+       {0x9A00, 0x64},
+       {0x9A01, 0x64},
+       {0x9A02, 0x64},
+       {0x9A03, 0x64},
+       {0x9A04, 0x64},
+       {0x9A05, 0x64},
+       {0x9A07, 0x64},
+       {0x9A08, 0x64},
+       {0x9A09, 0x64},
+       {0x9A0A, 0x64},
+       {0x9A0B, 0x64},
+       {0x9A0C, 0x64},
+       {0x9A0D, 0x64},
+       {0x9A0E, 0x64},
+       {0x9A0F, 0x64},
+       {0x9A10, 0x64},
+       {0x9A11, 0x64},
+       {0x9A12, 0x64},
+       {0x9A13, 0x64},
+       {0x9A14, 0x64},
+       {0x9A15, 0x64},
+       {0x9A16, 0x64},
+       {0x9A17, 0x64},
+       {0x9A18, 0x64},
+       {0x9A19, 0x64},
+       {0x9A1A, 0x64},
+       {0x9A1B, 0x64},
+       {0x9A1C, 0x64},
+       {0x9A3A, 0x20},
+       {0x9A3B, 0x00},
+       {0x9A3C, 0x20},
+       {0x9A3D, 0x00},
+       {0x9A3E, 0x20},
+       {0x9A3F, 0x00},
+       {0x9A40, 0x20},
+       {0x9A41, 0x00},
+       {0x9A42, 0x20},
+       {0x9A43, 0x00},
+       {0x9A44, 0x20},
+       {0x9A45, 0x00},
+       {0x9A46, 0x20},
+       {0x9A47, 0x00},
+       {0x9A48, 0x20},
+       {0x9A49, 0x00},
+       {0x9A4A, 0x20},
+       {0x9A4B, 0x00},
+       {0x9A4C, 0x20},
+       {0x9A4D, 0x00},
+       {0x9A4E, 0x20},
+       {0x9A4F, 0x00},
+       {0x9A50, 0x20},
+       {0x9A51, 0x00},
+       {0x9A52, 0x20},
+       {0x9A53, 0x00},
+       {0x9A54, 0x20},
+       {0x9A55, 0x00},
+       {0x9A56, 0x20},
+       {0x9A57, 0x00},
+       {0x9A58, 0x20},
+       {0x9A59, 0x00},
+       {0x9A64, 0xFF},
+       {0x9A65, 0xFF},
+       {0x9A66, 0xFF},
+       {0x9A67, 0xFF},
+       {0x9BDE, 0xFF},
+       {0x9BDF, 0x0F},
+       {0x9BE4, 0x04},
+       {0x9BE5, 0x00},
+       {0x9BE6, 0x00},
+       {0x9BE7, 0x00},
+       {0x9BEA, 0x54},
+       {0x9BEB, 0x00},
+       {0x9BEC, 0x54},
+       {0x9BED, 0x00},
+       {0x9BFA, 0x01},
+       {0x9C58, 0x21},
+       {0x9C5A, 0xC0},
+       {0x9C5B, 0x5D},
+       {0x9C5C, 0x80},
+       {0x9C5D, 0x57},
+       {0x9C60, 0x00},
+       {0x9C61, 0x30},
+       {0x9C62, 0x00},
+       {0x9C63, 0x00},
+       {0x9C64, 0x00},
+       {0x9C65, 0x50},
+       {0x9C66, 0x00},
+       {0x9C67, 0x00},
+       {0x9C6A, 0x00},
+       {0x9C6B, 0xE0},
+       {0x9C6C, 0x00},
+       {0x9C6D, 0x30},
+       {0x9C6E, 0x00},
+       {0x9C6F, 0x00},
+       {0x9C70, 0x00},
+       {0x9C71, 0x50},
+       {0x9C72, 0x00},
+       {0x9C73, 0x00},
+       {0x9C76, 0x00},
+       {0x9C77, 0xE0},
+       {0x9D00, 0x00},
+       {0x9D01, 0x10},
+       {0x9D02, 0x00},
+       {0x9D04, 0x00},
+       {0x9D05, 0x10},
+       {0x9D06, 0x00},
+       {0x9D08, 0x00},
+       {0x9D09, 0x10},
+       {0x9D0A, 0x00},
+       {0x9D0C, 0x00},
+       {0x9D0D, 0x10},
+       {0x9D0E, 0x00},
+       {0x9D10, 0x00},
+       {0x9D11, 0x10},
+       {0x9D12, 0x00},
+       {0x9D14, 0x00},
+       {0x9D15, 0x10},
+       {0x9D16, 0x00},
+       {0x9D18, 0x00},
+       {0x9D19, 0x10},
+       {0x9D1A, 0x00},
+       {0x9D1C, 0x00},
+       {0x9D1D, 0x10},
+       {0x9D1E, 0x00},
+       {0x9D20, 0x00},
+       {0x9D21, 0x10},
+       {0x9D22, 0x00},
+       {0x9D23, 0x00},
+       {0x9D24, 0x00},
+       {0x9D25, 0x10},
+       {0x9D26, 0x00},
+       {0x9D27, 0x00},
+       {0x9D28, 0x00},
+       {0x9D29, 0x10},
+       {0x9D2A, 0x00},
+       {0x9D2B, 0x00},
+       {0x9D2C, 0x00},
+       {0x9D2D, 0x10},
+       {0x9D2E, 0x00},
+       {0x9D2F, 0x00},
+       {0x9D30, 0x01},
+       {0x9D31, 0x00},
+       {0x9D32, 0x00},
+       {0x9D33, 0x00},
+       {0x9D34, 0x00},
+       {0x9D35, 0x00},
+       {0x9D38, 0x01},
+       {0x9D39, 0x00},
+       {0x9D3A, 0x00},
+       {0x9D3B, 0x00},
+       {0x9D3C, 0x00},
+       {0x9D3D, 0x00},
+       {0x9D40, 0x01},
+       {0x9D41, 0x00},
+       {0x9D42, 0x00},
+       {0x9D43, 0x00},
+       {0x9D44, 0x00},
+       {0x9D45, 0x00},
+       {0x9D48, 0x01},
+       {0x9D49, 0x00},
+       {0x9D4A, 0x00},
+       {0x9D4B, 0x00},
+       {0x9D4C, 0x00},
+       {0x9D4D, 0x00},
+       {0xA2E4, 0x23},
+       {0xA2E7, 0x01},
+       {0xA3CC, 0xAA},
+       {0xA3CD, 0x0F},
+       {0xA3CE, 0x81},
+       {0xA3CF, 0x0D},
+       {0xA3D0, 0xFC},
+       {0xA3D1, 0x00},
+       {0xA3D2, 0xC5},
+       {0xA3D3, 0x02},
+       {0xA3B0, 0xE6},
+       {0xA3B1, 0x00},
+       {0xA3B2, 0xE6},
+       {0xA3B3, 0x00},
+       {0x9E7C, 0x87},
+       {0x9E88, 0x6E},
+       {0x9E89, 0x87},
+       {0x9E8A, 0x9B},
+       {0x9E8B, 0xAF},
+       {0x9E8C, 0x6E},
+       {0x9E8D, 0x87},
+       {0x9E8E, 0x9B},
+       {0x9E8F, 0xAF},
+       {0x9E90, 0x28},
+       {0x9E91, 0x00},
+       {0x9E92, 0x50},
+       {0x9E93, 0x00},
+       {0x9E94, 0xB2},
+       {0x9E95, 0x0C},
+       {0x9E96, 0xA6},
+       {0x9E97, 0x0E},
+       {0x9E98, 0x28},
+       {0x9E99, 0x00},
+       {0x9E9A, 0x50},
+       {0x9E9B, 0x00},
+       {0x9E9C, 0xB2},
+       {0x9E9D, 0x0C},
+       {0x9E9E, 0xA6},
+       {0x9E9F, 0x0E},
+       {0x9EA0, 0x28},
+       {0x9EA1, 0x00},
+       {0x9EA2, 0x50},
+       {0x9EA3, 0x00},
+       {0x9EA4, 0xB2},
+       {0x9EA5, 0x0C},
+       {0x9EA6, 0xA6},
+       {0x9EA7, 0x0E},
+       {0x9EA8, 0x28},
+       {0x9EA9, 0x00},
+       {0x9EAA, 0x50},
+       {0x9EAB, 0x00},
+       {0x9EAC, 0xB2},
+       {0x9EAD, 0x0C},
+       {0x9EAE, 0xA6},
+       {0x9EAF, 0x0E},
+       {0x9EB0, 0x28},
+       {0x9EB1, 0x00},
+       {0x9EB2, 0x50},
+       {0x9EB3, 0x00},
+       {0x9EB4, 0xB2},
+       {0x9EB5, 0x0C},
+       {0x9EB6, 0xA6},
+       {0x9EB7, 0x0E},
+       {0x9EB8, 0x28},
+       {0x9EB9, 0x00},
+       {0x9EBA, 0x50},
+       {0x9EBB, 0x00},
+       {0x9EBC, 0xB2},
+       {0x9EBD, 0x0C},
+       {0x9EBE, 0xA6},
+       {0x9EBF, 0x0E},
+       {0x9EC0, 0x28},
+       {0x9EC1, 0x00},
+       {0x9EC2, 0x50},
+       {0x9EC3, 0x00},
+       {0x9EC4, 0xB2},
+       {0x9EC5, 0x0C},
+       {0x9EC6, 0xA6},
+       {0x9EC7, 0x0E},
+       {0x9ED2, 0x01},
+       {0x9ED3, 0x01},
+       {0x9ED4, 0x01},
+       {0x9ED5, 0x01},
+       {0x9ED6, 0x01},
+       {0x9ED7, 0x01},
+       {0x9ED8, 0x01},
+       {0x9EDA, 0xB2},
+       {0x9EDB, 0x0C},
+       {0x9EDC, 0xB2},
+       {0x9EDD, 0x0C},
+       {0x9EDE, 0xB2},
+       {0x9EDF, 0x0C},
+       {0x9EE0, 0xB2},
+       {0x9EE1, 0x0C},
+       {0x9EE2, 0xA6},
+       {0x9EE3, 0x0E},
+       {0x9EE4, 0xA6},
+       {0x9EE5, 0x0E},
+       {0x9EE6, 0xA6},
+       {0x9EE7, 0x0E},
+       {0x9EE8, 0xA6},
+       {0x9EE9, 0x0E},
+       {0x9EEA, 0xB2},
+       {0x9EEB, 0x0C},
+       {0x9EEC, 0xB2},
+       {0x9EED, 0x0C},
+       {0x9EEE, 0xB2},
+       {0x9EEF, 0x0C},
+       {0x9EF0, 0xB2},
+       {0x9EF1, 0x0C},
+       {0x9EF2, 0xA6},
+       {0x9EF3, 0x0E},
+       {0x9EF4, 0xA6},
+       {0x9EF5, 0x0E},
+       {0x9EF6, 0xA6},
+       {0x9EF7, 0x0E},
+       {0x9EF8, 0xA6},
+       {0x9EF9, 0x0E},
+       {0x9EFA, 0xB2},
+       {0x9EFB, 0x0C},
+       {0x9EFC, 0xB2},
+       {0x9EFD, 0x0C},
+       {0x9EFE, 0xB2},
+       {0x9EFF, 0x0C},
+       {0x9F00, 0xB2},
+       {0x9F01, 0x0C},
+       {0x9F02, 0xA6},
+       {0x9F03, 0x0E},
+       {0x9F04, 0xA6},
+       {0x9F05, 0x0E},
+       {0x9F06, 0xA6},
+       {0x9F07, 0x0E},
+       {0x9F08, 0xA6},
+       {0x9F09, 0x0E},
+       {0x9F0A, 0xB2},
+       {0x9F0B, 0x0C},
+       {0x9F0C, 0xB2},
+       {0x9F0D, 0x0C},
+       {0x9F0E, 0xB2},
+       {0x9F0F, 0x0C},
+       {0x9F10, 0xB2},
+       {0x9F11, 0x0C},
+       {0x9F12, 0xA6},
+       {0x9F13, 0x0E},
+       {0x9F14, 0xA6},
+       {0x9F15, 0x0E},
+       {0x9F16, 0xA6},
+       {0x9F17, 0x0E},
+       {0x9F18, 0xA6},
+       {0x9F19, 0x0E},
+       {0x9F1A, 0xB2},
+       {0x9F1B, 0x0C},
+       {0x9F1C, 0xB2},
+       {0x9F1D, 0x0C},
+       {0x9F1E, 0xB2},
+       {0x9F1F, 0x0C},
+       {0x9F20, 0xB2},
+       {0x9F21, 0x0C},
+       {0x9F22, 0xA6},
+       {0x9F23, 0x0E},
+       {0x9F24, 0xA6},
+       {0x9F25, 0x0E},
+       {0x9F26, 0xA6},
+       {0x9F27, 0x0E},
+       {0x9F28, 0xA6},
+       {0x9F29, 0x0E},
+       {0x9F2A, 0xB2},
+       {0x9F2B, 0x0C},
+       {0x9F2C, 0xB2},
+       {0x9F2D, 0x0C},
+       {0x9F2E, 0xB2},
+       {0x9F2F, 0x0C},
+       {0x9F30, 0xB2},
+       {0x9F31, 0x0C},
+       {0x9F32, 0xA6},
+       {0x9F33, 0x0E},
+       {0x9F34, 0xA6},
+       {0x9F35, 0x0E},
+       {0x9F36, 0xA6},
+       {0x9F37, 0x0E},
+       {0x9F38, 0xA6},
+       {0x9F39, 0x0E},
+       {0x9F3A, 0xB2},
+       {0x9F3B, 0x0C},
+       {0x9F3C, 0xB2},
+       {0x9F3D, 0x0C},
+       {0x9F3E, 0xB2},
+       {0x9F3F, 0x0C},
+       {0x9F40, 0xB2},
+       {0x9F41, 0x0C},
+       {0x9F42, 0xA6},
+       {0x9F43, 0x0E},
+       {0x9F44, 0xA6},
+       {0x9F45, 0x0E},
+       {0x9F46, 0xA6},
+       {0x9F47, 0x0E},
+       {0x9F48, 0xA6},
+       {0x9F49, 0x0E},
+       {0x9F4A, 0xB2},
+       {0x9F4B, 0x0C},
+       {0x9F4C, 0xB2},
+       {0x9F4D, 0x0C},
+       {0x9F4E, 0xB2},
+       {0x9F4F, 0x0C},
+       {0x9F50, 0xB2},
+       {0x9F51, 0x0C},
+       {0x9F52, 0xA6},
+       {0x9F53, 0x0E},
+       {0x9F54, 0xA6},
+       {0x9F55, 0x0E},
+       {0x9F56, 0xA6},
+       {0x9F57, 0x0E},
+       {0x9F58, 0xA6},
+       {0x9F59, 0x0E},
+       {0x9F5A, 0xD0},
+       {0x9F5B, 0x07},
+       {0x9F5C, 0xD0},
+       {0x9F5D, 0x07},
+       {0x9F5E, 0xD0},
+       {0x9F5F, 0x07},
+       {0x9F60, 0xD0},
+       {0x9F61, 0x07},
+       {0x9F62, 0xC4},
+       {0x9F63, 0x09},
+       {0x9F64, 0xC4},
+       {0x9F65, 0x09},
+       {0x9F66, 0xC4},
+       {0x9F67, 0x09},
+       {0x9F68, 0xC4},
+       {0x9F69, 0x09},
+       {0x9F6A, 0xD0},
+       {0x9F6B, 0x07},
+       {0x9F6C, 0xD0},
+       {0x9F6D, 0x07},
+       {0x9F6E, 0xD0},
+       {0x9F6F, 0x07},
+       {0x9F70, 0xD0},
+       {0x9F71, 0x07},
+       {0x9F72, 0xC4},
+       {0x9F73, 0x09},
+       {0x9F74, 0xC4},
+       {0x9F75, 0x09},
+       {0x9F76, 0xC4},
+       {0x9F77, 0x09},
+       {0x9F78, 0xC4},
+       {0x9F79, 0x09},
+       {0x9F7A, 0xD0},
+       {0x9F7B, 0x07},
+       {0x9F7C, 0xD0},
+       {0x9F7D, 0x07},
+       {0x9F7E, 0xD0},
+       {0x9F7F, 0x07},
+       {0x9F80, 0xD0},
+       {0x9F81, 0x07},
+       {0x9F82, 0xC4},
+       {0x9F83, 0x09},
+       {0x9F84, 0xC4},
+       {0x9F85, 0x09},
+       {0x9F86, 0xC4},
+       {0x9F87, 0x09},
+       {0x9F88, 0xC4},
+       {0x9F89, 0x09},
+       {0x9F8A, 0xD0},
+       {0x9F8B, 0x07},
+       {0x9F8C, 0xD0},
+       {0x9F8D, 0x07},
+       {0x9F8E, 0xD0},
+       {0x9F8F, 0x07},
+       {0x9F90, 0xD0},
+       {0x9F91, 0x07},
+       {0x9F92, 0xC4},
+       {0x9F93, 0x09},
+       {0x9F94, 0xC4},
+       {0x9F95, 0x09},
+       {0x9F96, 0xC4},
+       {0x9F97, 0x09},
+       {0x9F98, 0xC4},
+       {0x9F99, 0x09},
+       {0x9F9A, 0xD0},
+       {0x9F9B, 0x07},
+       {0x9F9C, 0xD0},
+       {0x9F9D, 0x07},
+       {0x9F9E, 0xD0},
+       {0x9F9F, 0x07},
+       {0x9FA0, 0xD0},
+       {0x9FA1, 0x07},
+       {0x9FA2, 0xC4},
+       {0x9FA3, 0x09},
+       {0x9FA4, 0xC4},
+       {0x9FA5, 0x09},
+       {0x9FA6, 0xC4},
+       {0x9FA7, 0x09},
+       {0x9FA8, 0xC4},
+       {0x9FA9, 0x09},
+       {0x9FAA, 0xD0},
+       {0x9FAB, 0x07},
+       {0x9FAC, 0xD0},
+       {0x9FAD, 0x07},
+       {0x9FAE, 0xD0},
+       {0x9FAF, 0x07},
+       {0x9FB0, 0xD0},
+       {0x9FB1, 0x07},
+       {0x9FB2, 0xC4},
+       {0x9FB3, 0x09},
+       {0x9FB4, 0xC4},
+       {0x9FB5, 0x09},
+       {0x9FB6, 0xC4},
+       {0x9FB7, 0x09},
+       {0x9FB8, 0xC4},
+       {0x9FB9, 0x09},
+       {0x9FBA, 0xD0},
+       {0x9FBB, 0x07},
+       {0x9FBC, 0xD0},
+       {0x9FBD, 0x07},
+       {0x9FBE, 0xD0},
+       {0x9FBF, 0x07},
+       {0x9FC0, 0xD0},
+       {0x9FC1, 0x07},
+       {0x9FC2, 0xC4},
+       {0x9FC3, 0x09},
+       {0x9FC4, 0xC4},
+       {0x9FC5, 0x09},
+       {0x9FC6, 0xC4},
+       {0x9FC7, 0x09},
+       {0x9FC8, 0xC4},
+       {0x9FC9, 0x09},
+       {0x9FCA, 0xD0},
+       {0x9FCB, 0x07},
+       {0x9FCC, 0xD0},
+       {0x9FCD, 0x07},
+       {0x9FCE, 0xD0},
+       {0x9FCF, 0x07},
+       {0x9FD0, 0xD0},
+       {0x9FD1, 0x07},
+       {0x9FD2, 0xC4},
+       {0x9FD3, 0x09},
+       {0x9FD4, 0xC4},
+       {0x9FD5, 0x09},
+       {0x9FD6, 0xC4},
+       {0x9FD7, 0x09},
+       {0x9FD8, 0xC4},
+       {0x9FD9, 0x09},
+       {0x9FDA, 0xD0},
+       {0x9FDB, 0x07},
+       {0x9FDC, 0xD0},
+       {0x9FDD, 0x07},
+       {0x9FDE, 0xD0},
+       {0x9FDF, 0x07},
+       {0x9FE0, 0xD0},
+       {0x9FE1, 0x07},
+       {0x9FE2, 0xC4},
+       {0x9FE3, 0x09},
+       {0x9FE4, 0xC4},
+       {0x9FE5, 0x09},
+       {0x9FE6, 0xC4},
+       {0x9FE7, 0x09},
+       {0x9FE8, 0xC4},
+       {0x9FE9, 0x09},
+       {0x9FEA, 0xD0},
+       {0x9FEB, 0x07},
+       {0x9FEC, 0xD0},
+       {0x9FED, 0x07},
+       {0x9FEE, 0xD0},
+       {0x9FEF, 0x07},
+       {0x9FF0, 0xD0},
+       {0x9FF1, 0x07},
+       {0x9FF2, 0xC4},
+       {0x9FF3, 0x09},
+       {0x9FF4, 0xC4},
+       {0x9FF5, 0x09},
+       {0x9FF6, 0xC4},
+       {0x9FF7, 0x09},
+       {0x9FF8, 0xC4},
+       {0x9FF9, 0x09},
+       {0x9FFA, 0xD0},
+       {0x9FFB, 0x07},
+       {0x9FFC, 0xD0},
+       {0x9FFD, 0x07},
+       {0x9FFE, 0xD0},
+       {0x9FFF, 0x07},
+       {0xA000, 0xD0},
+       {0xA001, 0x07},
+       {0xA002, 0xC4},
+       {0xA003, 0x09},
+       {0xA004, 0xC4},
+       {0xA005, 0x09},
+       {0xA006, 0xC4},
+       {0xA007, 0x09},
+       {0xA008, 0xC4},
+       {0xA009, 0x09},
+       {0xA00A, 0xD0},
+       {0xA00B, 0x07},
+       {0xA00C, 0xD0},
+       {0xA00D, 0x07},
+       {0xA00E, 0xD0},
+       {0xA00F, 0x07},
+       {0xA010, 0xD0},
+       {0xA011, 0x07},
+       {0xA012, 0xC4},
+       {0xA013, 0x09},
+       {0xA014, 0xC4},
+       {0xA015, 0x09},
+       {0xA016, 0xC4},
+       {0xA017, 0x09},
+       {0xA018, 0xC4},
+       {0xA019, 0x09},
+       {0xA044, 0x4B},
+       {0xA045, 0x00},
+       {0xA046, 0x4B},
+       {0xA047, 0x00},
+       {0xA048, 0x4B},
+       {0xA049, 0x00},
+       {0xA04A, 0x4B},
+       {0xA04B, 0x00},
+       {0xA04C, 0x15},
+       {0xA04D, 0x00},
+       {0xA04E, 0x15},
+       {0xA04F, 0x00},
+       {0xA050, 0x15},
+       {0xA051, 0x00},
+       {0xA052, 0x15},
+       {0xA053, 0x00},
+       {0xA054, 0x28},
+       {0xA055, 0x00},
+       {0xA056, 0x28},
+       {0xA057, 0x00},
+       {0xA058, 0x28},
+       {0xA059, 0x00},
+       {0xA05A, 0x28},
+       {0xA05B, 0x00},
+       {0xA05C, 0x28},
+       {0xA05D, 0x00},
+       {0xA05E, 0x28},
+       {0xA05F, 0x00},
+       {0xA060, 0x28},
+       {0xA061, 0x00},
+       {0xA062, 0x28},
+       {0xA063, 0x00},
+       {0xA064, 0x21},
+       {0xA065, 0x00},
+       {0xA066, 0x21},
+       {0xA067, 0x00},
+       {0xA068, 0x21},
+       {0xA069, 0x00},
+       {0xA06A, 0x21},
+       {0xA06B, 0x00},
+       {0xA076, 0x21},
+       {0xA077, 0x00},
+       {0xA078, 0x21},
+       {0xA079, 0x00},
+       {0xA07A, 0x21},
+       {0xA07B, 0x00},
+       {0xA07C, 0x21},
+       {0xA07D, 0x00},
+       {0xA07E, 0x28},
+       {0xA07F, 0x00},
+       {0xA080, 0x28},
+       {0xA081, 0x00},
+       {0xA082, 0x28},
+       {0xA083, 0x00},
+       {0xA084, 0x28},
+       {0xA085, 0x00},
+       {0xA086, 0x54},
+       {0xA087, 0x00},
+       {0xA088, 0x54},
+       {0xA089, 0x00},
+       {0xA08A, 0x54},
+       {0xA08B, 0x00},
+       {0xA08C, 0x54},
+       {0xA08D, 0x00},
+       {0xA09A, 0xA6},
+       {0xA09B, 0x0E},
+       {0xA09C, 0xA6},
+       {0xA09D, 0x0E},
+       {0xA09E, 0xA6},
+       {0xA09F, 0x0E},
+       {0xA0A0, 0xA6},
+       {0xA0A1, 0x0E},
+       {0xA0A2, 0xA6},
+       {0xA0A3, 0x0E},
+       {0xA0A4, 0xA6},
+       {0xA0A5, 0x0E},
+       {0xA0A6, 0xA6},
+       {0xA0A7, 0x0E},
+       {0xA0A8, 0xA6},
+       {0xA0A9, 0x0E},
+       {0xA0AA, 0xA6},
+       {0xA0AB, 0x0E},
+       {0xA0AC, 0xA6},
+       {0xA0AD, 0x0E},
+       {0xA0AE, 0xA6},
+       {0xA0AF, 0x0E},
+       {0xA0B0, 0xA6},
+       {0xA0B1, 0x0E},
+       {0xA0BC, 0xFE},
+       {0xA0BD, 0x01},
+       {0xA0BE, 0xFE},
+       {0xA0BF, 0x01},
+       {0xA0C0, 0xFE},
+       {0xA0C1, 0x01},
+       {0xA0C2, 0xFE},
+       {0xA0C3, 0x01},
+       {0xA0C4, 0xFC},
+       {0xA0C5, 0x03},
+       {0xA0C6, 0xFC},
+       {0xA0C7, 0x03},
+       {0xA0C8, 0xFC},
+       {0xA0C9, 0x03},
+       {0xA0CA, 0xFC},
+       {0xA0CB, 0x03},
+       {0xA0CC, 0xFE},
+       {0xA0CD, 0x01},
+       {0xA0CE, 0xFE},
+       {0xA0CF, 0x01},
+       {0xA0D0, 0xFE},
+       {0xA0D1, 0x01},
+       {0xA0D2, 0xFE},
+       {0xA0D3, 0x01},
+       {0xA0D4, 0xFC},
+       {0xA0D5, 0x03},
+       {0xA0D6, 0xFC},
+       {0xA0D7, 0x03},
+       {0xA0D8, 0xFC},
+       {0xA0D9, 0x03},
+       {0xA0DA, 0xFC},
+       {0xA0DB, 0x03},
+       {0xA0DC, 0xFE},
+       {0xA0DD, 0x01},
+       {0xA0DE, 0xFE},
+       {0xA0DF, 0x01},
+       {0xA0E0, 0xFE},
+       {0xA0E1, 0x01},
+       {0xA0E2, 0xFE},
+       {0xA0E3, 0x01},
+       {0xA0E4, 0xFC},
+       {0xA0E5, 0x03},
+       {0xA0E6, 0xFC},
+       {0xA0E7, 0x03},
+       {0xA0E8, 0xFC},
+       {0xA0E9, 0x03},
+       {0xA0EA, 0xFC},
+       {0xA0EB, 0x03},
+       {0xA0EC, 0xFE},
+       {0xA0ED, 0x01},
+       {0xA0EE, 0xFE},
+       {0xA0EF, 0x01},
+       {0xA0F0, 0xFE},
+       {0xA0F1, 0x01},
+       {0xA0F2, 0xFE},
+       {0xA0F3, 0x01},
+       {0xA0F4, 0xFC},
+       {0xA0F5, 0x03},
+       {0xA0F6, 0xFC},
+       {0xA0F7, 0x03},
+       {0xA0F8, 0xFC},
+       {0xA0F9, 0x03},
+       {0xA0FA, 0xFC},
+       {0xA0FB, 0x03},
+       {0xA11C, 0x01},
+       {0xA126, 0x00},
+       {0xA127, 0x04},
+       {0xA128, 0x00},
+       {0xA129, 0x02},
+       {0xA12A, 0x00},
+       {0xA12B, 0x02},
+       {0xA12C, 0x00},
+       {0xA12D, 0x02},
+       {0xA12E, 0x00},
+       {0xA12F, 0x02},
+       {0xA130, 0x00},
+       {0xA131, 0x02},
+       {0xA132, 0x00},
+       {0xA133, 0x02},
+       {0xA134, 0x00},
+       {0xA135, 0x02},
+       {0xA136, 0x00},
+       {0xA137, 0x02},
+       {0xA138, 0xA6},
+       {0xA139, 0x0E},
+       {0xA13A, 0xA6},
+       {0xA13B, 0x0E},
+       {0xA13C, 0xA6},
+       {0xA13D, 0x0E},
+       {0xA13E, 0xA6},
+       {0xA13F, 0x0E},
+       {0xA140, 0xA6},
+       {0xA141, 0x0E},
+       {0xA142, 0xA6},
+       {0xA143, 0x0E},
+       {0xA144, 0xA6},
+       {0xA145, 0x0E},
+       {0xA146, 0xA6},
+       {0xA147, 0x0E},
+       {0xA148, 0xA6},
+       {0xA149, 0x0E},
+       {0xA14A, 0xA6},
+       {0xA14B, 0x0E},
+       {0xA14C, 0xA6},
+       {0xA14D, 0x0E},
+       {0xA14E, 0xA6},
+       {0xA14F, 0x0E},
+       {0xA150, 0xA6},
+       {0xA151, 0x0E},
+       {0xA152, 0xA6},
+       {0xA153, 0x0E},
+       {0xA154, 0xA6},
+       {0xA155, 0x0E},
+       {0xA156, 0xA6},
+       {0xA157, 0x0E},
+       {0xA15E, 0x09},
+       {0xA15F, 0x08},
+       {0xA160, 0x10},
+       {0xA161, 0x09},
+       {0xA162, 0x01},
+       {0xA163, 0x00},
+       {0xA166, 0x2F},
+       {0xA167, 0x00},
+       {0xA168, 0x01},
+       {0xA169, 0x00},
+       {0xA16A, 0x00},
+       {0xA16B, 0x00},
+       {0xA16C, 0x00},
+       {0xA16D, 0x00},
+       {0xA16E, 0x00},
+       {0xA16F, 0x00},
+       {0xA170, 0x00},
+       {0xA171, 0x00},
+       {0xA172, 0x33},
+       {0xA173, 0x00},
+       {0xA174, 0x33},
+       {0xA175, 0x00},
+       {0xA176, 0x33},
+       {0xA177, 0x00},
+       {0xA178, 0x33},
+       {0xA179, 0x00},
+       {0xA17A, 0x01},
+       {0xA17C, 0xDE},
+       {0xA17D, 0x00},
+       {0xA17E, 0xEA},
+       {0xA17F, 0x00},
+       {0xA180, 0xDE},
+       {0xA181, 0x00},
+       {0xA182, 0xEA},
+       {0xA183, 0x00},
+       {0xA184, 0xDE},
+       {0xA185, 0x00},
+       {0xA186, 0xEE},
+       {0xA187, 0x00},
+       {0xA18A, 0x87},
+       {0xA18B, 0x87},
+       {0xA414, 0x67},
+       {0xA415, 0x09},
+       {0xA416, 0xD8},
+       {0xA417, 0x1A},
+       {0xA418, 0xB4},
+       {0xA419, 0x0C},
+       {0xA41A, 0x7E},
+       {0xA41B, 0x15},
+       {0xA41C, 0x01},
+       {0xA41D, 0x10},
+       {0xA41E, 0x24},
+       {0xA41F, 0x10},
+       {0xA420, 0x1A},
+       {0xA421, 0x14},
+       {0xA422, 0x6A},
+       {0xA423, 0x0E},
+       {0xA424, 0xD5},
+       {0xA425, 0x19},
+       {0xA426, 0xD5},
+       {0xA427, 0x0C},
+       {0xA428, 0xA9},
+       {0xA429, 0x0D},
+       {0xA42A, 0xE1},
+       {0xA42B, 0x13},
+       {0xA42C, 0x10},
+       {0xA42D, 0x0E},
+       {0xA42E, 0x47},
+       {0xA42F, 0x0F},
+       {0xA6AC, 0x02},
+       {0xA6AD, 0x02},
+       {0xA6AE, 0x02},
+       {0xA6AF, 0x02},
+       {0xA6B0, 0x02},
+       {0xA6B1, 0x01},
+       {0xA6B2, 0x40},
+       {0xA6B3, 0x40},
+       {0xA6B6, 0x40},
+       {0xA6B7, 0x40},
+       {0xA6BA, 0x40},
+       {0xA6BB, 0x40},
+       {0xA6BE, 0x40},
+       {0xA6BF, 0x40},
+       {0xA6D3, 0x30},
+       {0xA6DA, 0x23},
+       {0xA6DB, 0x00},
+       {0xA6DC, 0x20},
+       {0xA6DD, 0x00},
+       {0xA6DE, 0x1C},
+       {0xA6DF, 0x00},
+       {0xA6E0, 0x18},
+       {0xA6E1, 0x00},
+       {0xA6E2, 0x46},
+       {0xA6E3, 0x00},
+       {0xA6E4, 0x40},
+       {0xA6E5, 0x00},
+       {0xA6E6, 0x39},
+       {0xA6E7, 0x00},
+       {0xA6E8, 0x31},
+       {0xA6E9, 0x00},
+       {0xA6EA, 0x8C},
+       {0xA6EB, 0x00},
+       {0xA6EC, 0x7F},
+       {0xA6ED, 0x00},
+       {0xA6EE, 0x71},
+       {0xA6EF, 0x00},
+       {0xA6F0, 0x61},
+       {0xA6F1, 0x00},
+       {0xA6F2, 0x18},
+       {0xA6F3, 0x01},
+       {0xA6F4, 0xFF},
+       {0xA6F5, 0x00},
+       {0xA6F6, 0xE2},
+       {0xA6F7, 0x00},
+       {0xA6F8, 0xC2},
+       {0xA6F9, 0x00},
+       {0xA702, 0x02},
+       {0xA703, 0x00},
+       {0xA704, 0x02},
+       {0xA705, 0x00},
+       {0xA706, 0x02},
+       {0xA707, 0x00},
+       {0xA708, 0x02},
+       {0xA709, 0x00},
+       {0xA70A, 0x40},
+       {0xA70B, 0x40},
+       {0xA70E, 0x40},
+       {0xA70F, 0x40},
+       {0xA712, 0x40},
+       {0xA713, 0x40},
+       {0xA716, 0x40},
+       {0xA717, 0x40},
+       {0xA72B, 0x30},
+       {0xA72E, 0x40},
+       {0xA72F, 0x40},
+       {0xA730, 0x40},
+       {0xA731, 0x40},
+       {0xA732, 0x05},
+       {0xA733, 0x00},
+       {0xA734, 0x05},
+       {0xA735, 0x00},
+       {0xA736, 0x05},
+       {0xA737, 0x00},
+       {0xA738, 0x05},
+       {0xA739, 0x00},
+       {0xA73A, 0x09},
+       {0xA73B, 0x00},
+       {0xA73C, 0x09},
+       {0xA73D, 0x00},
+       {0xA73E, 0x09},
+       {0xA73F, 0x00},
+       {0xA740, 0x09},
+       {0xA741, 0x00},
+       {0xA742, 0x13},
+       {0xA743, 0x00},
+       {0xA744, 0x13},
+       {0xA745, 0x00},
+       {0xA746, 0x13},
+       {0xA747, 0x00},
+       {0xA748, 0x13},
+       {0xA749, 0x00},
+       {0xA74A, 0x25},
+       {0xA74B, 0x00},
+       {0xA74C, 0x25},
+       {0xA74D, 0x00},
+       {0xA74E, 0x25},
+       {0xA74F, 0x00},
+       {0xA750, 0x25},
+       {0xA751, 0x00},
+       {0xA75A, 0x02},
+       {0xA75B, 0x00},
+       {0xA75C, 0x02},
+       {0xA75D, 0x00},
+       {0xA75E, 0x02},
+       {0xA75F, 0x00},
+       {0xA760, 0x02},
+       {0xA761, 0x00},
+       {0xA762, 0x40},
+       {0xA763, 0x40},
+       {0xA766, 0x40},
+       {0xA767, 0x40},
+       {0xA76A, 0x40},
+       {0xA76B, 0x40},
+       {0xA76E, 0x40},
+       {0xA76F, 0x40},
+       {0xA782, 0x40},
+       {0xA783, 0x30},
+       {0xA784, 0x40},
+       {0xA785, 0x40},
+       {0xA786, 0x40},
+       {0xA787, 0x40},
+       {0xA788, 0x40},
+       {0xA789, 0x40},
+       {0xA78A, 0x03},
+       {0xA78B, 0x00},
+       {0xA78C, 0x03},
+       {0xA78D, 0x00},
+       {0xA78E, 0x03},
+       {0xA78F, 0x00},
+       {0xA790, 0x03},
+       {0xA791, 0x00},
+       {0xA792, 0x06},
+       {0xA793, 0x00},
+       {0xA794, 0x06},
+       {0xA795, 0x00},
+       {0xA796, 0x06},
+       {0xA797, 0x00},
+       {0xA798, 0x06},
+       {0xA799, 0x00},
+       {0xA79A, 0x0C},
+       {0xA79B, 0x00},
+       {0xA79C, 0x0C},
+       {0xA79D, 0x00},
+       {0xA79E, 0x0C},
+       {0xA79F, 0x00},
+       {0xA7A0, 0x0C},
+       {0xA7A1, 0x00},
+       {0xA7A2, 0x19},
+       {0xA7A3, 0x00},
+       {0xA7A4, 0x19},
+       {0xA7A5, 0x00},
+       {0xA7A6, 0x19},
+       {0xA7A7, 0x00},
+       {0xA7A8, 0x19},
+       {0xA7A9, 0x00},
+       {0xA7B2, 0x02},
+       {0xA7B3, 0x00},
+       {0xA7B4, 0x02},
+       {0xA7B5, 0x00},
+       {0xA7B6, 0x02},
+       {0xA7B7, 0x00},
+       {0xA7B8, 0x02},
+       {0xA7B9, 0x00},
+       {0xA7BA, 0x40},
+       {0xA7BB, 0x40},
+       {0xA7BE, 0x40},
+       {0xA7BF, 0x40},
+       {0xA7C2, 0x40},
+       {0xA7C3, 0x40},
+       {0xA7C6, 0x40},
+       {0xA7C7, 0x40},
+       {0xA7DB, 0x30},
+       {0xA7E2, 0x01},
+       {0xA7E3, 0x00},
+       {0xA7E4, 0x01},
+       {0xA7E5, 0x00},
+       {0xA7E6, 0x01},
+       {0xA7E7, 0x00},
+       {0xA7E8, 0x01},
+       {0xA7E9, 0x00},
+       {0xA7EA, 0x03},
+       {0xA7EB, 0x00},
+       {0xA7EC, 0x03},
+       {0xA7ED, 0x00},
+       {0xA7EE, 0x03},
+       {0xA7EF, 0x00},
+       {0xA7F0, 0x03},
+       {0xA7F1, 0x00},
+       {0xA7F2, 0x0B},
+       {0xA7F3, 0x00},
+       {0xA7F4, 0x0B},
+       {0xA7F5, 0x00},
+       {0xA7F6, 0x0B},
+       {0xA7F7, 0x00},
+       {0xA7F8, 0x0B},
+       {0xA7F9, 0x00},
+       {0xA7FA, 0x2E},
+       {0xA7FB, 0x00},
+       {0xA7FC, 0x2E},
+       {0xA7FD, 0x00},
+       {0xA7FE, 0x2E},
+       {0xA7FF, 0x00},
+       {0xA800, 0x2E},
+       {0xA801, 0x00},
+       {0xA80A, 0x0A},
+       {0xA80B, 0x00},
+       {0xA80C, 0x0A},
+       {0xA80D, 0x00},
+       {0xA80E, 0x0A},
+       {0xA80F, 0x00},
+       {0xA810, 0x0A},
+       {0xA811, 0x00},
+       {0xA832, 0x40},
+       {0xA833, 0x40},
+       {0xA834, 0x40},
+       {0xA835, 0x40},
+       {0xA836, 0x40},
+       {0xA837, 0x40},
+       {0xA838, 0x40},
+       {0xA839, 0x40},
+       {0xA83A, 0x05},
+       {0xA83B, 0x00},
+       {0xA83C, 0x05},
+       {0xA83D, 0x00},
+       {0xA83E, 0x05},
+       {0xA83F, 0x00},
+       {0xA840, 0x05},
+       {0xA841, 0x00},
+       {0xA842, 0x0A},
+       {0xA843, 0x00},
+       {0xA844, 0x0A},
+       {0xA845, 0x00},
+       {0xA846, 0x0A},
+       {0xA847, 0x00},
+       {0xA848, 0x0A},
+       {0xA849, 0x00},
+       {0xA84A, 0x13},
+       {0xA84B, 0x00},
+       {0xA84C, 0x13},
+       {0xA84D, 0x00},
+       {0xA84E, 0x13},
+       {0xA84F, 0x00},
+       {0xA850, 0x13},
+       {0xA851, 0x00},
+       {0xA852, 0x26},
+       {0xA853, 0x00},
+       {0xA854, 0x26},
+       {0xA855, 0x00},
+       {0xA856, 0x26},
+       {0xA857, 0x00},
+       {0xA858, 0x26},
+       {0xA859, 0x00},
+       {0xA862, 0x02},
+       {0xA863, 0x00},
+       {0xA864, 0x02},
+       {0xA865, 0x00},
+       {0xA866, 0x02},
+       {0xA867, 0x00},
+       {0xA868, 0x02},
+       {0xA869, 0x00},
+       {0xA455, 0x00},
+       {0xA456, 0x01},
+       {0xA465, 0x08},
+       {0xA467, 0x0B},
+       {0xA468, 0x0B},
+       {0xA469, 0x0B},
+       {0xA46A, 0x0B},
+       {0xA46B, 0x0B},
+       {0xA470, 0xAF},
+       {0xA471, 0x9B},
+       {0xA472, 0x87},
+       {0xA473, 0x6E},
+       {0xA474, 0xAF},
+       {0xA475, 0x9B},
+       {0xA476, 0x87},
+       {0xA477, 0x6E},
+       {0xA478, 0xAF},
+       {0xA479, 0x9B},
+       {0xA47A, 0x87},
+       {0xA47B, 0x6E},
+       {0xA4B4, 0x70},
+       {0xA4B5, 0x70},
+       {0xA4B6, 0x70},
+       {0xA4B7, 0x70},
+       {0xA4B9, 0x4A},
+       {0xA4BA, 0x44},
+       {0xA4BB, 0x3C},
+       {0xA4BC, 0x19},
+       {0xA4BD, 0x19},
+       {0xA4BE, 0x19},
+       {0xA4BF, 0x19},
+       {0xA4C0, 0x07},
+       {0xA4C1, 0x07},
+       {0xA4C2, 0x07},
+       {0xA4C3, 0x07},
+       {0xA4C4, 0x0B},
+       {0xA4C5, 0x0B},
+       {0xA4C6, 0x0B},
+       {0xA4C7, 0x0B},
+       {0xA4C8, 0x1C},
+       {0xA4C9, 0x1C},
+       {0xA4CA, 0x1C},
+       {0xA4CB, 0x1C},
+       {0xB1E0, 0x80},
+       {0xB1E1, 0x01},
+       {0xB1E2, 0x80},
+       {0xB1E3, 0x01},
+       {0xB1E4, 0x80},
+       {0xB1E5, 0x01},
+       {0xB1E6, 0x80},
+       {0xB1E7, 0x01},
+       {0xB1E8, 0x80},
+       {0xB1E9, 0x01},
+       {0xB1EA, 0x80},
+       {0xB1EB, 0x01},
+       {0xB1EC, 0x80},
+       {0xB1ED, 0x01},
+       {0xB1EE, 0x80},
+       {0xB1EF, 0x01},
+       {0xB1F0, 0x80},
+       {0xB1F1, 0x01},
+       {0xB1F2, 0x80},
+       {0xB1F3, 0x01},
+       {0xB1F4, 0x80},
+       {0xB1F5, 0x01},
+       {0xB1F6, 0x80},
+       {0xB1F7, 0x01},
+       {0xB1F8, 0x80},
+       {0xB1F9, 0x01},
+       {0xB1FA, 0x80},
+       {0xB1FB, 0x01},
+       {0xB1FC, 0x80},
+       {0xB1FD, 0x01},
+       {0xB1FE, 0x80},
+       {0xB1FF, 0x01},
+       {0xB200, 0xC0},
+       {0xB201, 0x00},
+       {0xB202, 0xC0},
+       {0xB203, 0x00},
+       {0xB204, 0xC0},
+       {0xB205, 0x00},
+       {0xB206, 0xC0},
+       {0xB207, 0x00},
+       {0xB208, 0xC0},
+       {0xB209, 0x00},
+       {0xB20A, 0xC0},
+       {0xB20B, 0x00},
+       {0xB20C, 0xC0},
+       {0xB20D, 0x00},
+       {0xB20E, 0xC0},
+       {0xB20F, 0x00},
+       {0xB210, 0xC0},
+       {0xB211, 0x00},
+       {0xB212, 0xC0},
+       {0xB213, 0x00},
+       {0xB214, 0xC0},
+       {0xB215, 0x00},
+       {0xB216, 0xC0},
+       {0xB217, 0x00},
+       {0xB218, 0xC0},
+       {0xB219, 0x00},
+       {0xB21A, 0xC0},
+       {0xB21B, 0x00},
+       {0xB21C, 0xC0},
+       {0xB21D, 0x00},
+       {0xB21E, 0xC0},
+       {0xB21F, 0x00},
+       {0xB220, 0x80},
+       {0xB221, 0x01},
+       {0xB222, 0x80},
+       {0xB223, 0x01},
+       {0xB224, 0x80},
+       {0xB225, 0x01},
+       {0xB226, 0x80},
+       {0xB227, 0x01},
+       {0xB228, 0x80},
+       {0xB229, 0x01},
+       {0xB22A, 0x80},
+       {0xB22B, 0x01},
+       {0xB22C, 0x80},
+       {0xB22D, 0x01},
+       {0xB22E, 0x80},
+       {0xB22F, 0x01},
+       {0xB230, 0x80},
+       {0xB231, 0x01},
+       {0xB232, 0x80},
+       {0xB233, 0x01},
+       {0xB234, 0x80},
+       {0xB235, 0x01},
+       {0xB236, 0x80},
+       {0xB237, 0x01},
+       {0xB238, 0x80},
+       {0xB239, 0x01},
+       {0xB23A, 0x80},
+       {0xB23B, 0x01},
+       {0xB23C, 0x80},
+       {0xB23D, 0x01},
+       {0xB23E, 0x80},
+       {0xB23F, 0x01},
+       {0xB240, 0xC0},
+       {0xB241, 0x00},
+       {0xB242, 0xC0},
+       {0xB243, 0x00},
+       {0xB244, 0xC0},
+       {0xB245, 0x00},
+       {0xB246, 0xC0},
+       {0xB247, 0x00},
+       {0xB248, 0xC0},
+       {0xB249, 0x00},
+       {0xB24A, 0xC0},
+       {0xB24B, 0x00},
+       {0xB24C, 0xC0},
+       {0xB24D, 0x00},
+       {0xB24E, 0xC0},
+       {0xB24F, 0x00},
+       {0xB250, 0xC0},
+       {0xB251, 0x00},
+       {0xB252, 0xC0},
+       {0xB253, 0x00},
+       {0xB254, 0xC0},
+       {0xB255, 0x00},
+       {0xB256, 0xC0},
+       {0xB257, 0x00},
+       {0xB258, 0xC0},
+       {0xB259, 0x00},
+       {0xB25A, 0xC0},
+       {0xB25B, 0x00},
+       {0xB25C, 0xC0},
+       {0xB25D, 0x00},
+       {0xB25E, 0xC0},
+       {0xB25F, 0x00},
+       {0xB260, 0x80},
+       {0xB261, 0x01},
+       {0xB262, 0x80},
+       {0xB263, 0x01},
+       {0xB264, 0x80},
+       {0xB265, 0x01},
+       {0xB266, 0x80},
+       {0xB267, 0x01},
+       {0xB268, 0x80},
+       {0xB269, 0x01},
+       {0xB26A, 0x80},
+       {0xB26B, 0x01},
+       {0xB26C, 0x80},
+       {0xB26D, 0x01},
+       {0xB26E, 0x80},
+       {0xB26F, 0x01},
+       {0xB270, 0x80},
+       {0xB271, 0x01},
+       {0xB272, 0x80},
+       {0xB273, 0x01},
+       {0xB274, 0x80},
+       {0xB275, 0x01},
+       {0xB276, 0x80},
+       {0xB277, 0x01},
+       {0xB278, 0x80},
+       {0xB279, 0x01},
+       {0xB27A, 0x80},
+       {0xB27B, 0x01},
+       {0xB27C, 0x80},
+       {0xB27D, 0x01},
+       {0xB27E, 0x80},
+       {0xB27F, 0x01},
+       {0xB280, 0xC0},
+       {0xB281, 0x00},
+       {0xB282, 0xC0},
+       {0xB283, 0x00},
+       {0xB284, 0xC0},
+       {0xB285, 0x00},
+       {0xB286, 0xC0},
+       {0xB287, 0x00},
+       {0xB288, 0xC0},
+       {0xB289, 0x00},
+       {0xB28A, 0xC0},
+       {0xB28B, 0x00},
+       {0xB28C, 0xC0},
+       {0xB28D, 0x00},
+       {0xB28E, 0xC0},
+       {0xB28F, 0x00},
+       {0xB290, 0xC0},
+       {0xB291, 0x00},
+       {0xB292, 0xC0},
+       {0xB293, 0x00},
+       {0xB294, 0xC0},
+       {0xB295, 0x00},
+       {0xB296, 0xC0},
+       {0xB297, 0x00},
+       {0xB298, 0xC0},
+       {0xB299, 0x00},
+       {0xB29A, 0xC0},
+       {0xB29B, 0x00},
+       {0xB29C, 0xC0},
+       {0xB29D, 0x00},
+       {0xB29E, 0xC0},
+       {0xB29F, 0x00},
+       {0xB2A0, 0x80},
+       {0xB2A1, 0x01},
+       {0xB2A2, 0x80},
+       {0xB2A3, 0x01},
+       {0xB2A4, 0x80},
+       {0xB2A5, 0x01},
+       {0xB2A6, 0x80},
+       {0xB2A7, 0x01},
+       {0xB2A8, 0x80},
+       {0xB2A9, 0x01},
+       {0xB2AA, 0x80},
+       {0xB2AB, 0x01},
+       {0xB2AC, 0x80},
+       {0xB2AD, 0x01},
+       {0xB2AE, 0x80},
+       {0xB2AF, 0x01},
+       {0xB2B0, 0x80},
+       {0xB2B1, 0x01},
+       {0xB2B2, 0x80},
+       {0xB2B3, 0x01},
+       {0xB2B4, 0x80},
+       {0xB2B5, 0x01},
+       {0xB2B6, 0x80},
+       {0xB2B7, 0x01},
+       {0xB2B8, 0x80},
+       {0xB2B9, 0x01},
+       {0xB2BA, 0x80},
+       {0xB2BB, 0x01},
+       {0xB2BC, 0x80},
+       {0xB2BD, 0x01},
+       {0xB2BE, 0x80},
+       {0xB2BF, 0x01},
+       {0xB2C0, 0xC0},
+       {0xB2C1, 0x00},
+       {0xB2C2, 0xC0},
+       {0xB2C3, 0x00},
+       {0xB2C4, 0xC0},
+       {0xB2C5, 0x00},
+       {0xB2C6, 0xC0},
+       {0xB2C7, 0x00},
+       {0xB2C8, 0xC0},
+       {0xB2C9, 0x00},
+       {0xB2CA, 0xC0},
+       {0xB2CB, 0x00},
+       {0xB2CC, 0xC0},
+       {0xB2CD, 0x00},
+       {0xB2CE, 0xC0},
+       {0xB2CF, 0x00},
+       {0xB2D0, 0xC0},
+       {0xB2D1, 0x00},
+       {0xB2D2, 0xC0},
+       {0xB2D3, 0x00},
+       {0xB2D4, 0xC0},
+       {0xB2D5, 0x00},
+       {0xB2D6, 0xC0},
+       {0xB2D7, 0x00},
+       {0xB2D8, 0xC0},
+       {0xB2D9, 0x00},
+       {0xB2DA, 0xC0},
+       {0xB2DB, 0x00},
+       {0xB2DC, 0xC0},
+       {0xB2DD, 0x00},
+       {0xB2DE, 0xC0},
+       {0xB2DF, 0x00},
+       {0xB2E0, 0x00},
+       {0xB2E1, 0x01},
+       {0xB2E2, 0x00},
+       {0xB2E3, 0x01},
+       {0xB2E4, 0x00},
+       {0xB2E5, 0x01},
+       {0xB2E6, 0x00},
+       {0xB2E7, 0x01},
+       {0xB2E8, 0x00},
+       {0xB2E9, 0x01},
+       {0xB2EA, 0x00},
+       {0xB2EB, 0x01},
+       {0xB2EC, 0x00},
+       {0xB2ED, 0x01},
+       {0xB2EE, 0x00},
+       {0xB2EF, 0x01},
+       {0xB2F0, 0x00},
+       {0xB2F1, 0x01},
+       {0xB2F2, 0x00},
+       {0xB2F3, 0x01},
+       {0xB2F4, 0x00},
+       {0xB2F5, 0x01},
+       {0xB2F6, 0x00},
+       {0xB2F7, 0x01},
+       {0xB2F8, 0x00},
+       {0xB2F9, 0x01},
+       {0xB2FA, 0x00},
+       {0xB2FB, 0x01},
+       {0xB2FC, 0x00},
+       {0xB2FD, 0x01},
+       {0xB2FE, 0x00},
+       {0xB2FF, 0x01},
+       {0xB300, 0x80},
+       {0xB301, 0x00},
+       {0xB302, 0x80},
+       {0xB303, 0x00},
+       {0xB304, 0x80},
+       {0xB305, 0x00},
+       {0xB306, 0x80},
+       {0xB307, 0x00},
+       {0xB308, 0x80},
+       {0xB309, 0x00},
+       {0xB30A, 0x80},
+       {0xB30B, 0x00},
+       {0xB30C, 0x80},
+       {0xB30D, 0x00},
+       {0xB30E, 0x80},
+       {0xB30F, 0x00},
+       {0xB310, 0x80},
+       {0xB311, 0x00},
+       {0xB312, 0x80},
+       {0xB313, 0x00},
+       {0xB314, 0x80},
+       {0xB315, 0x00},
+       {0xB316, 0x80},
+       {0xB317, 0x00},
+       {0xB318, 0x80},
+       {0xB319, 0x00},
+       {0xB31A, 0x80},
+       {0xB31B, 0x00},
+       {0xB31C, 0x80},
+       {0xB31D, 0x00},
+       {0xB31E, 0x80},
+       {0xB31F, 0x00},
+       {0xB320, 0x40},
+       {0xB321, 0x40},
+       {0xB322, 0x40},
+       {0xB323, 0x40},
+       {0xB324, 0x40},
+       {0xB325, 0x40},
+       {0xB326, 0x40},
+       {0xB327, 0x40},
+       {0xB328, 0x40},
+       {0xB329, 0x40},
+       {0xB32A, 0x40},
+       {0xB32B, 0x40},
+       {0xB32C, 0x40},
+       {0xB32D, 0x40},
+       {0xB32E, 0x40},
+       {0xB32F, 0x40},
+       {0xB34C, 0x40},
+       {0xB34D, 0x40},
+       {0xB34E, 0x40},
+       {0xB34F, 0x40},
+       {0xB350, 0x40},
+       {0xB351, 0x40},
+       {0xB352, 0x40},
+       {0xB353, 0x40},
+       {0xB354, 0x40},
+       {0xB355, 0x40},
+       {0xB356, 0x40},
+       {0xB357, 0x40},
+       {0xB358, 0x40},
+       {0xB359, 0x40},
+       {0xB35A, 0x40},
+       {0xB35B, 0x40},
+       {0xB378, 0x40},
+       {0xB379, 0x40},
+       {0xB37A, 0x40},
+       {0xB37B, 0x40},
+       {0xB37C, 0x40},
+       {0xB37D, 0x40},
+       {0xB37E, 0x40},
+       {0xB37F, 0x40},
+       {0xB380, 0x40},
+       {0xB381, 0x40},
+       {0xB382, 0x40},
+       {0xB383, 0x40},
+       {0xB384, 0x40},
+       {0xB385, 0x40},
+       {0xB386, 0x40},
+       {0xB387, 0x40},
+       {0xB3A4, 0x40},
+       {0xB3A5, 0x40},
+       {0xB3A6, 0x40},
+       {0xB3A7, 0x40},
+       {0xB3A8, 0x40},
+       {0xB3A9, 0x40},
+       {0xB3AA, 0x40},
+       {0xB3AB, 0x40},
+       {0xB3AC, 0x40},
+       {0xB3AD, 0x40},
+       {0xB3AE, 0x40},
+       {0xB3AF, 0x40},
+       {0xB3B0, 0x40},
+       {0xB3B1, 0x40},
+       {0xB3B2, 0x40},
+       {0xB3B3, 0x40},
+       {0xB3D0, 0x40},
+       {0xB3D1, 0x40},
+       {0xB3D2, 0x40},
+       {0xB3D3, 0x40},
+       {0xB3D4, 0x40},
+       {0xB3D5, 0x40},
+       {0xB3D6, 0x40},
+       {0xB3D7, 0x40},
+       {0xB3D8, 0x40},
+       {0xB3D9, 0x40},
+       {0xB3DA, 0x40},
+       {0xB3DB, 0x40},
+       {0xB3DC, 0x40},
+       {0xB3DD, 0x40},
+       {0xB3DE, 0x40},
+       {0xB3DF, 0x40},
+       {0xA4DC, 0x02},
+       {0xA4DD, 0x12},
+       {0xA68C, 0x34},
+       {0xA68D, 0x00},
+       {0xA68E, 0x00},
+       {0xA690, 0x02},
+       {0xA694, 0x01},
+       {0xA695, 0x01},
+       {0xA696, 0x01},
+       {0xA8C8, 0x19},
+       {0xA8C9, 0x00},
+       {0xA8CA, 0x17},
+       {0xA8CB, 0x00},
+       {0xA8CC, 0x14},
+       {0xA8CD, 0x00},
+       {0xA8CE, 0x11},
+       {0xA8CF, 0x00},
+       {0xA8D0, 0x23},
+       {0xA8D1, 0x00},
+       {0xA8D2, 0x20},
+       {0xA8D3, 0x00},
+       {0xA8D4, 0x1C},
+       {0xA8D5, 0x00},
+       {0xA8D6, 0x18},
+       {0xA8D7, 0x00},
+       {0xA8D8, 0x31},
+       {0xA8D9, 0x00},
+       {0xA8DA, 0x2D},
+       {0xA8DB, 0x00},
+       {0xA8DC, 0x28},
+       {0xA8DD, 0x00},
+       {0xA8DE, 0x22},
+       {0xA8DF, 0x00},
+       {0xA8E0, 0x46},
+       {0xA8E1, 0x00},
+       {0xA8E2, 0x40},
+       {0xA8E3, 0x00},
+       {0xA8E4, 0x39},
+       {0xA8E5, 0x00},
+       {0xA8E6, 0x31},
+       {0xA8E7, 0x00},
+       {0xA8E8, 0x63},
+       {0xA8E9, 0x00},
+       {0xA8EA, 0x5A},
+       {0xA8EB, 0x00},
+       {0xA8EC, 0x50},
+       {0xA8ED, 0x00},
+       {0xA8EE, 0x45},
+       {0xA8EF, 0x00},
+       {0xA8F0, 0x8C},
+       {0xA8F1, 0x00},
+       {0xA8F2, 0x7F},
+       {0xA8F3, 0x00},
+       {0xA8F4, 0x71},
+       {0xA8F5, 0x00},
+       {0xA8F6, 0x61},
+       {0xA8F7, 0x00},
+       {0xA8F8, 0xC6},
+       {0xA8F9, 0x00},
+       {0xA8FA, 0xB4},
+       {0xA8FB, 0x00},
+       {0xA8FC, 0xA0},
+       {0xA8FD, 0x00},
+       {0xA8FE, 0x89},
+       {0xA8FF, 0x00},
+       {0xA900, 0x18},
+       {0xA901, 0x01},
+       {0xA902, 0xFF},
+       {0xA903, 0x00},
+       {0xA904, 0xE2},
+       {0xA905, 0x00},
+       {0xA906, 0xC2},
+       {0xA907, 0x00},
+       {0xA908, 0x80},
+       {0xA909, 0x01},
+       {0xA90A, 0x80},
+       {0xA90B, 0x01},
+       {0xA90C, 0x80},
+       {0xA90D, 0x01},
+       {0xA90E, 0x80},
+       {0xA90F, 0x01},
+       {0xA910, 0x80},
+       {0xA911, 0x01},
+       {0xA912, 0x80},
+       {0xA913, 0x01},
+       {0xA914, 0x80},
+       {0xA915, 0x01},
+       {0xA916, 0x80},
+       {0xA917, 0x01},
+       {0xA918, 0x80},
+       {0xA919, 0x01},
+       {0xA91A, 0x80},
+       {0xA91B, 0x01},
+       {0xA91C, 0x80},
+       {0xA91D, 0x01},
+       {0xA91E, 0x80},
+       {0xA91F, 0x01},
+       {0xA920, 0x80},
+       {0xA921, 0x01},
+       {0xA922, 0x80},
+       {0xA923, 0x01},
+       {0xA924, 0x80},
+       {0xA925, 0x01},
+       {0xA926, 0x80},
+       {0xA927, 0x01},
+       {0xA928, 0x02},
+       {0xA929, 0x00},
+       {0xA92A, 0x02},
+       {0xA92B, 0x00},
+       {0xA92C, 0x02},
+       {0xA92D, 0x00},
+       {0xA92E, 0x02},
+       {0xA92F, 0x00},
+       {0xA930, 0x02},
+       {0xA931, 0x00},
+       {0xA932, 0x02},
+       {0xA933, 0x00},
+       {0xA934, 0x02},
+       {0xA935, 0x00},
+       {0xA936, 0x02},
+       {0xA937, 0x00},
+       {0xA938, 0x02},
+       {0xA939, 0x00},
+       {0xA93A, 0x02},
+       {0xA93B, 0x00},
+       {0xA93C, 0x02},
+       {0xA93D, 0x00},
+       {0xA93E, 0x02},
+       {0xA93F, 0x00},
+       {0xA940, 0x02},
+       {0xA941, 0x00},
+       {0xA942, 0x02},
+       {0xA943, 0x00},
+       {0xA944, 0x02},
+       {0xA945, 0x00},
+       {0xA946, 0x02},
+       {0xA947, 0x00},
+       {0xA948, 0x40},
+       {0xA949, 0x40},
+       {0xA94A, 0x40},
+       {0xA94B, 0x40},
+       {0xA94C, 0x40},
+       {0xA94D, 0x40},
+       {0xA94E, 0x40},
+       {0xA94F, 0x40},
+       {0xA950, 0x40},
+       {0xA951, 0x40},
+       {0xA952, 0x40},
+       {0xA953, 0x40},
+       {0xA954, 0x40},
+       {0xA955, 0x40},
+       {0xA956, 0x40},
+       {0xA957, 0x40},
+       {0xA960, 0x03},
+       {0xA961, 0x00},
+       {0xA962, 0x03},
+       {0xA963, 0x00},
+       {0xA964, 0x03},
+       {0xA965, 0x00},
+       {0xA966, 0x03},
+       {0xA967, 0x00},
+       {0xA968, 0x05},
+       {0xA969, 0x00},
+       {0xA96A, 0x05},
+       {0xA96B, 0x00},
+       {0xA96C, 0x05},
+       {0xA96D, 0x00},
+       {0xA96E, 0x05},
+       {0xA96F, 0x00},
+       {0xA970, 0x07},
+       {0xA971, 0x00},
+       {0xA972, 0x07},
+       {0xA973, 0x00},
+       {0xA974, 0x07},
+       {0xA975, 0x00},
+       {0xA976, 0x07},
+       {0xA977, 0x00},
+       {0xA978, 0x09},
+       {0xA979, 0x00},
+       {0xA97A, 0x09},
+       {0xA97B, 0x00},
+       {0xA97C, 0x09},
+       {0xA97D, 0x00},
+       {0xA97E, 0x09},
+       {0xA97F, 0x00},
+       {0xA980, 0x0D},
+       {0xA981, 0x00},
+       {0xA982, 0x0D},
+       {0xA983, 0x00},
+       {0xA984, 0x0D},
+       {0xA985, 0x00},
+       {0xA986, 0x0D},
+       {0xA987, 0x00},
+       {0xA988, 0x13},
+       {0xA989, 0x00},
+       {0xA98A, 0x13},
+       {0xA98B, 0x00},
+       {0xA98C, 0x13},
+       {0xA98D, 0x00},
+       {0xA98E, 0x13},
+       {0xA98F, 0x00},
+       {0xA990, 0x1A},
+       {0xA991, 0x00},
+       {0xA992, 0x1A},
+       {0xA993, 0x00},
+       {0xA994, 0x1A},
+       {0xA995, 0x00},
+       {0xA996, 0x1A},
+       {0xA997, 0x00},
+       {0xA998, 0x25},
+       {0xA999, 0x00},
+       {0xA99A, 0x25},
+       {0xA99B, 0x00},
+       {0xA99C, 0x25},
+       {0xA99D, 0x00},
+       {0xA99E, 0x25},
+       {0xA99F, 0x00},
+       {0xA9A0, 0x80},
+       {0xA9A1, 0x01},
+       {0xA9A2, 0x80},
+       {0xA9A3, 0x01},
+       {0xA9A4, 0x80},
+       {0xA9A5, 0x01},
+       {0xA9A6, 0x80},
+       {0xA9A7, 0x01},
+       {0xA9A8, 0x80},
+       {0xA9A9, 0x01},
+       {0xA9AA, 0x80},
+       {0xA9AB, 0x01},
+       {0xA9AC, 0x80},
+       {0xA9AD, 0x01},
+       {0xA9AE, 0x80},
+       {0xA9AF, 0x01},
+       {0xA9B0, 0x80},
+       {0xA9B1, 0x01},
+       {0xA9B2, 0x80},
+       {0xA9B3, 0x01},
+       {0xA9B4, 0x80},
+       {0xA9B5, 0x01},
+       {0xA9B6, 0x80},
+       {0xA9B7, 0x01},
+       {0xA9B8, 0x80},
+       {0xA9B9, 0x01},
+       {0xA9BA, 0x80},
+       {0xA9BB, 0x01},
+       {0xA9BC, 0x80},
+       {0xA9BD, 0x01},
+       {0xA9BE, 0x80},
+       {0xA9BF, 0x01},
+       {0xA9C0, 0x02},
+       {0xA9C1, 0x00},
+       {0xA9C2, 0x02},
+       {0xA9C3, 0x00},
+       {0xA9C4, 0x02},
+       {0xA9C5, 0x00},
+       {0xA9C6, 0x02},
+       {0xA9C7, 0x00},
+       {0xA9C8, 0x02},
+       {0xA9C9, 0x00},
+       {0xA9CA, 0x02},
+       {0xA9CB, 0x00},
+       {0xA9CC, 0x02},
+       {0xA9CD, 0x00},
+       {0xA9CE, 0x02},
+       {0xA9CF, 0x00},
+       {0xA9D0, 0x02},
+       {0xA9D1, 0x00},
+       {0xA9D2, 0x02},
+       {0xA9D3, 0x00},
+       {0xA9D4, 0x02},
+       {0xA9D5, 0x00},
+       {0xA9D6, 0x02},
+       {0xA9D7, 0x00},
+       {0xA9D8, 0x02},
+       {0xA9D9, 0x00},
+       {0xA9DA, 0x02},
+       {0xA9DB, 0x00},
+       {0xA9DC, 0x02},
+       {0xA9DD, 0x00},
+       {0xA9DE, 0x02},
+       {0xA9DF, 0x00},
+       {0xA9E0, 0x40},
+       {0xA9E1, 0x40},
+       {0xA9E2, 0x40},
+       {0xA9E3, 0x40},
+       {0xA9E4, 0x40},
+       {0xA9E5, 0x40},
+       {0xA9E6, 0x40},
+       {0xA9E7, 0x40},
+       {0xA9E8, 0x40},
+       {0xA9E9, 0x40},
+       {0xA9EA, 0x40},
+       {0xA9EB, 0x40},
+       {0xA9EC, 0x40},
+       {0xA9ED, 0x40},
+       {0xA9EE, 0x40},
+       {0xA9EF, 0x40},
+       {0xA9F8, 0x02},
+       {0xA9F9, 0x00},
+       {0xA9FA, 0x02},
+       {0xA9FB, 0x00},
+       {0xA9FC, 0x02},
+       {0xA9FD, 0x00},
+       {0xA9FE, 0x02},
+       {0xA9FF, 0x00},
+       {0xAA00, 0x03},
+       {0xAA01, 0x00},
+       {0xAA02, 0x03},
+       {0xAA03, 0x00},
+       {0xAA04, 0x03},
+       {0xAA05, 0x00},
+       {0xAA06, 0x03},
+       {0xAA07, 0x00},
+       {0xAA08, 0x04},
+       {0xAA09, 0x00},
+       {0xAA0A, 0x04},
+       {0xAA0B, 0x00},
+       {0xAA0C, 0x04},
+       {0xAA0D, 0x00},
+       {0xAA0E, 0x04},
+       {0xAA0F, 0x00},
+       {0xAA10, 0x06},
+       {0xAA11, 0x00},
+       {0xAA12, 0x06},
+       {0xAA13, 0x00},
+       {0xAA14, 0x06},
+       {0xAA15, 0x00},
+       {0xAA16, 0x06},
+       {0xAA17, 0x00},
+       {0xAA18, 0x09},
+       {0xAA19, 0x00},
+       {0xAA1A, 0x09},
+       {0xAA1B, 0x00},
+       {0xAA1C, 0x09},
+       {0xAA1D, 0x00},
+       {0xAA1E, 0x09},
+       {0xAA1F, 0x00},
+       {0xAA20, 0x0C},
+       {0xAA21, 0x00},
+       {0xAA22, 0x0C},
+       {0xAA23, 0x00},
+       {0xAA24, 0x0C},
+       {0xAA25, 0x00},
+       {0xAA26, 0x0C},
+       {0xAA27, 0x00},
+       {0xAA28, 0x12},
+       {0xAA29, 0x00},
+       {0xAA2A, 0x12},
+       {0xAA2B, 0x00},
+       {0xAA2C, 0x12},
+       {0xAA2D, 0x00},
+       {0xAA2E, 0x12},
+       {0xAA2F, 0x00},
+       {0xAA30, 0x19},
+       {0xAA31, 0x00},
+       {0xAA32, 0x19},
+       {0xAA33, 0x00},
+       {0xAA34, 0x19},
+       {0xAA35, 0x00},
+       {0xAA36, 0x19},
+       {0xAA37, 0x00},
+       {0xAA38, 0x80},
+       {0xAA39, 0x01},
+       {0xAA3A, 0x80},
+       {0xAA3B, 0x01},
+       {0xAA3C, 0x80},
+       {0xAA3D, 0x01},
+       {0xAA3E, 0x80},
+       {0xAA3F, 0x01},
+       {0xAA40, 0x80},
+       {0xAA41, 0x01},
+       {0xAA42, 0x80},
+       {0xAA43, 0x01},
+       {0xAA44, 0x80},
+       {0xAA45, 0x01},
+       {0xAA46, 0x80},
+       {0xAA47, 0x01},
+       {0xAA48, 0x80},
+       {0xAA49, 0x01},
+       {0xAA4A, 0x80},
+       {0xAA4B, 0x01},
+       {0xAA4C, 0x80},
+       {0xAA4D, 0x01},
+       {0xAA4E, 0x80},
+       {0xAA4F, 0x01},
+       {0xAA50, 0x80},
+       {0xAA51, 0x01},
+       {0xAA52, 0x80},
+       {0xAA53, 0x01},
+       {0xAA54, 0x80},
+       {0xAA55, 0x01},
+       {0xAA56, 0x80},
+       {0xAA57, 0x01},
+       {0xAA58, 0x02},
+       {0xAA59, 0x00},
+       {0xAA5A, 0x02},
+       {0xAA5B, 0x00},
+       {0xAA5C, 0x02},
+       {0xAA5D, 0x00},
+       {0xAA5E, 0x02},
+       {0xAA5F, 0x00},
+       {0xAA60, 0x02},
+       {0xAA61, 0x00},
+       {0xAA62, 0x02},
+       {0xAA63, 0x00},
+       {0xAA64, 0x02},
+       {0xAA65, 0x00},
+       {0xAA66, 0x02},
+       {0xAA67, 0x00},
+       {0xAA68, 0x02},
+       {0xAA69, 0x00},
+       {0xAA6A, 0x02},
+       {0xAA6B, 0x00},
+       {0xAA6C, 0x02},
+       {0xAA6D, 0x00},
+       {0xAA6E, 0x02},
+       {0xAA6F, 0x00},
+       {0xAA70, 0x02},
+       {0xAA71, 0x00},
+       {0xAA72, 0x02},
+       {0xAA73, 0x00},
+       {0xAA74, 0x02},
+       {0xAA75, 0x00},
+       {0xAA76, 0x02},
+       {0xAA77, 0x00},
+       {0xAA78, 0x40},
+       {0xAA79, 0x40},
+       {0xAA7A, 0x40},
+       {0xAA7B, 0x40},
+       {0xAA7C, 0x40},
+       {0xAA7D, 0x40},
+       {0xAA7E, 0x40},
+       {0xAA7F, 0x40},
+       {0xAA80, 0x40},
+       {0xAA81, 0x40},
+       {0xAA82, 0x40},
+       {0xAA83, 0x40},
+       {0xAA84, 0x40},
+       {0xAA85, 0x40},
+       {0xAA86, 0x40},
+       {0xAA87, 0x40},
+       {0xAA90, 0x00},
+       {0xAA91, 0x00},
+       {0xAA92, 0x00},
+       {0xAA93, 0x00},
+       {0xAA94, 0x00},
+       {0xAA95, 0x00},
+       {0xAA96, 0x00},
+       {0xAA97, 0x00},
+       {0xAA98, 0x01},
+       {0xAA99, 0x00},
+       {0xAA9A, 0x01},
+       {0xAA9B, 0x00},
+       {0xAA9C, 0x01},
+       {0xAA9D, 0x00},
+       {0xAA9E, 0x01},
+       {0xAA9F, 0x00},
+       {0xAAA0, 0x01},
+       {0xAAA1, 0x00},
+       {0xAAA2, 0x01},
+       {0xAAA3, 0x00},
+       {0xAAA4, 0x01},
+       {0xAAA5, 0x00},
+       {0xAAA6, 0x01},
+       {0xAAA7, 0x00},
+       {0xAAA8, 0x03},
+       {0xAAA9, 0x00},
+       {0xAAAA, 0x03},
+       {0xAAAB, 0x00},
+       {0xAAAC, 0x03},
+       {0xAAAD, 0x00},
+       {0xAAAE, 0x03},
+       {0xAAAF, 0x00},
+       {0xAAB0, 0x06},
+       {0xAAB1, 0x00},
+       {0xAAB2, 0x06},
+       {0xAAB3, 0x00},
+       {0xAAB4, 0x06},
+       {0xAAB5, 0x00},
+       {0xAAB6, 0x06},
+       {0xAAB7, 0x00},
+       {0xAAB8, 0x0B},
+       {0xAAB9, 0x00},
+       {0xAABA, 0x0B},
+       {0xAABB, 0x00},
+       {0xAABC, 0x0B},
+       {0xAABD, 0x00},
+       {0xAABE, 0x0B},
+       {0xAABF, 0x00},
+       {0xAAC0, 0x17},
+       {0xAAC1, 0x00},
+       {0xAAC2, 0x17},
+       {0xAAC3, 0x00},
+       {0xAAC4, 0x17},
+       {0xAAC5, 0x00},
+       {0xAAC6, 0x17},
+       {0xAAC7, 0x00},
+       {0xAAC8, 0x2E},
+       {0xAAC9, 0x00},
+       {0xAACA, 0x2E},
+       {0xAACB, 0x00},
+       {0xAACC, 0x2E},
+       {0xAACD, 0x00},
+       {0xAACE, 0x2E},
+       {0xAACF, 0x00},
+       {0xAAD0, 0x80},
+       {0xAAD1, 0x01},
+       {0xAAD2, 0x80},
+       {0xAAD3, 0x01},
+       {0xAAD4, 0x80},
+       {0xAAD5, 0x01},
+       {0xAAD6, 0x80},
+       {0xAAD7, 0x01},
+       {0xAAD8, 0x80},
+       {0xAAD9, 0x01},
+       {0xAADA, 0x80},
+       {0xAADB, 0x01},
+       {0xAADC, 0x80},
+       {0xAADD, 0x01},
+       {0xAADE, 0x80},
+       {0xAADF, 0x01},
+       {0xAAE0, 0x80},
+       {0xAAE1, 0x01},
+       {0xAAE2, 0x80},
+       {0xAAE3, 0x01},
+       {0xAAE4, 0x80},
+       {0xAAE5, 0x01},
+       {0xAAE6, 0x80},
+       {0xAAE7, 0x01},
+       {0xAAE8, 0x80},
+       {0xAAE9, 0x01},
+       {0xAAEA, 0x80},
+       {0xAAEB, 0x01},
+       {0xAAEC, 0x80},
+       {0xAAED, 0x01},
+       {0xAAEE, 0x80},
+       {0xAAEF, 0x01},
+       {0xAAF0, 0x0A},
+       {0xAAF1, 0x00},
+       {0xAAF2, 0x0A},
+       {0xAAF3, 0x00},
+       {0xAAF4, 0x0A},
+       {0xAAF5, 0x00},
+       {0xAAF6, 0x0A},
+       {0xAAF7, 0x00},
+       {0xAAF8, 0x0A},
+       {0xAAF9, 0x00},
+       {0xAAFA, 0x0A},
+       {0xAAFB, 0x00},
+       {0xAAFC, 0x0A},
+       {0xAAFD, 0x00},
+       {0xAAFE, 0x0A},
+       {0xAAFF, 0x00},
+       {0xAB00, 0x0A},
+       {0xAB01, 0x00},
+       {0xAB02, 0x0A},
+       {0xAB03, 0x00},
+       {0xAB04, 0x0A},
+       {0xAB05, 0x00},
+       {0xAB06, 0x0A},
+       {0xAB07, 0x00},
+       {0xAB08, 0x0A},
+       {0xAB09, 0x00},
+       {0xAB0A, 0x0A},
+       {0xAB0B, 0x00},
+       {0xAB0C, 0x0A},
+       {0xAB0D, 0x00},
+       {0xAB0E, 0x0A},
+       {0xAB0F, 0x00},
+       {0xAB10, 0x40},
+       {0xAB11, 0x40},
+       {0xAB12, 0x40},
+       {0xAB13, 0x40},
+       {0xAB14, 0x40},
+       {0xAB15, 0x40},
+       {0xAB16, 0x40},
+       {0xAB17, 0x40},
+       {0xAB18, 0x40},
+       {0xAB19, 0x40},
+       {0xAB1A, 0x40},
+       {0xAB1B, 0x40},
+       {0xAB1C, 0x40},
+       {0xAB1D, 0x40},
+       {0xAB1E, 0x40},
+       {0xAB1F, 0x40},
+       {0xAB28, 0x03},
+       {0xAB29, 0x00},
+       {0xAB2A, 0x03},
+       {0xAB2B, 0x00},
+       {0xAB2C, 0x03},
+       {0xAB2D, 0x00},
+       {0xAB2E, 0x03},
+       {0xAB2F, 0x00},
+       {0xAB30, 0x05},
+       {0xAB31, 0x00},
+       {0xAB32, 0x05},
+       {0xAB33, 0x00},
+       {0xAB34, 0x05},
+       {0xAB35, 0x00},
+       {0xAB36, 0x05},
+       {0xAB37, 0x00},
+       {0xAB38, 0x07},
+       {0xAB39, 0x00},
+       {0xAB3A, 0x07},
+       {0xAB3B, 0x00},
+       {0xAB3C, 0x07},
+       {0xAB3D, 0x00},
+       {0xAB3E, 0x07},
+       {0xAB3F, 0x00},
+       {0xAB40, 0x0A},
+       {0xAB41, 0x00},
+       {0xAB42, 0x0A},
+       {0xAB43, 0x00},
+       {0xAB44, 0x0A},
+       {0xAB45, 0x00},
+       {0xAB46, 0x0A},
+       {0xAB47, 0x00},
+       {0xAB48, 0x0E},
+       {0xAB49, 0x00},
+       {0xAB4A, 0x0E},
+       {0xAB4B, 0x00},
+       {0xAB4C, 0x0E},
+       {0xAB4D, 0x00},
+       {0xAB4E, 0x0E},
+       {0xAB4F, 0x00},
+       {0xAB50, 0x13},
+       {0xAB51, 0x00},
+       {0xAB52, 0x13},
+       {0xAB53, 0x00},
+       {0xAB54, 0x13},
+       {0xAB55, 0x00},
+       {0xAB56, 0x13},
+       {0xAB57, 0x00},
+       {0xAB58, 0x1B},
+       {0xAB59, 0x00},
+       {0xAB5A, 0x1B},
+       {0xAB5B, 0x00},
+       {0xAB5C, 0x1B},
+       {0xAB5D, 0x00},
+       {0xAB5E, 0x1B},
+       {0xAB5F, 0x00},
+       {0xAB60, 0x26},
+       {0xAB61, 0x00},
+       {0xAB62, 0x26},
+       {0xAB63, 0x00},
+       {0xAB64, 0x26},
+       {0xAB65, 0x00},
+       {0xAB66, 0x26},
+       {0xAB67, 0x00},
+       {0xAB68, 0x80},
+       {0xAB69, 0x01},
+       {0xAB6A, 0x80},
+       {0xAB6B, 0x01},
+       {0xAB6C, 0x80},
+       {0xAB6D, 0x01},
+       {0xAB6E, 0x80},
+       {0xAB6F, 0x01},
+       {0xAB70, 0x80},
+       {0xAB71, 0x01},
+       {0xAB72, 0x80},
+       {0xAB73, 0x01},
+       {0xAB74, 0x80},
+       {0xAB75, 0x01},
+       {0xAB76, 0x80},
+       {0xAB77, 0x01},
+       {0xAB78, 0x80},
+       {0xAB79, 0x01},
+       {0xAB7A, 0x80},
+       {0xAB7B, 0x01},
+       {0xAB7C, 0x80},
+       {0xAB7D, 0x01},
+       {0xAB7E, 0x80},
+       {0xAB7F, 0x01},
+       {0xAB80, 0x80},
+       {0xAB81, 0x01},
+       {0xAB82, 0x80},
+       {0xAB83, 0x01},
+       {0xAB84, 0x80},
+       {0xAB85, 0x01},
+       {0xAB86, 0x80},
+       {0xAB87, 0x01},
+       {0xAB88, 0x02},
+       {0xAB89, 0x00},
+       {0xAB8A, 0x02},
+       {0xAB8B, 0x00},
+       {0xAB8C, 0x02},
+       {0xAB8D, 0x00},
+       {0xAB8E, 0x02},
+       {0xAB8F, 0x00},
+       {0xAB90, 0x02},
+       {0xAB91, 0x00},
+       {0xAB92, 0x02},
+       {0xAB93, 0x00},
+       {0xAB94, 0x02},
+       {0xAB95, 0x00},
+       {0xAB96, 0x02},
+       {0xAB97, 0x00},
+       {0xAB98, 0x02},
+       {0xAB99, 0x00},
+       {0xAB9A, 0x02},
+       {0xAB9B, 0x00},
+       {0xAB9C, 0x02},
+       {0xAB9D, 0x00},
+       {0xAB9E, 0x02},
+       {0xAB9F, 0x00},
+       {0xABA0, 0x02},
+       {0xABA1, 0x00},
+       {0xABA2, 0x02},
+       {0xABA3, 0x00},
+       {0xABA4, 0x02},
+       {0xABA5, 0x00},
+       {0xABA6, 0x02},
+       {0xABA7, 0x00},
+       {0xABA8, 0x40},
+       {0xABA9, 0x40},
+       {0xABAA, 0x40},
+       {0xABAB, 0x40},
+       {0xABAC, 0x40},
+       {0xABAD, 0x40},
+       {0xABAE, 0x40},
+       {0xABAF, 0x40},
+       {0xABB0, 0x40},
+       {0xABB1, 0x40},
+       {0xABB2, 0x40},
+       {0xABB3, 0x40},
+       {0xABB4, 0x40},
+       {0xABB5, 0x40},
+       {0xABB6, 0x40},
+       {0xABB7, 0x40},
+       {0xA69C, 0x01},
+       {0xA69D, 0x01},
+       {0xA69E, 0x01},
+       {0xA69F, 0x01},
+       {0xA6A0, 0x01},
+       {0xA6A1, 0x01},
+       {0xB1B0, 0x00},
+       {0xB1B1, 0xF0},
+       {0x1808, 0x00},
+       {0x179C, 0x02},
+       {0x179D, 0x03},
+       {0x179E, 0x01},
+       {0x179F, 0x03},
+       {0x17A0, 0x03},
+       {0x17A1, 0x01},
+       {0x17A2, 0x03},
+       {0x17A3, 0x03},
+       {0x17A4, 0x01},
+       {0x17A5, 0x03},
+       {0x17A6, 0x03},
+       {0x17A7, 0x01},
+       {0x17A8, 0x03},
+       {0x17A9, 0x03},
+       {0x17AA, 0x01},
+       {0x17AB, 0x03},
+       {0x17F2, 0x01},
+       {0x17F4, 0x01},
+       {0x17F6, 0xFF},
+       {0x17F7, 0x0F},
+       {0x1792, 0x01},
+       {0x1794, 0x01},
+       {0x1796, 0x01},
+       {0x1798, 0x01},
+       {0x179A, 0x01},
+       {0x16DD, 0x01},
+       {0x16EC, 0x01},
+       {0x16ED, 0x01},
+       {0xA198, 0x00},
+       {0xA199, 0x00},
+       {0xA19A, 0x00},
+       {0xA1A0, 0x3C},
+       {0xA1A1, 0x0C},
+       {0xA1A2, 0x00},
+       {0xA1A8, 0x0C},
+       {0xA1A9, 0x9D},
+       {0xA1AA, 0x01},
+       {0xA1B0, 0x34},
+       {0xA1B1, 0xE9},
+       {0xA1B2, 0x05},
+       {0xA1B8, 0x69},
+       {0xA1B9, 0x44},
+       {0xA1BA, 0x3A},
+       {0xA1C0, 0xFF},
+       {0xA1C1, 0xFF},
+       {0xA1C2, 0xFF},
+       {0xA1C8, 0xFF},
+       {0xA1C9, 0xFF},
+       {0xA1CA, 0xFF},
+       {0xA1D0, 0xFF},
+       {0xA1D1, 0xFF},
+       {0xA1D2, 0xFF},
+       {0xA19C, 0x00},
+       {0xA19D, 0x00},
+       {0xA19E, 0x00},
+       {0xA1A4, 0xAA},
+       {0xA1A5, 0x03},
+       {0xA1A6, 0x00},
+       {0xA1AC, 0x3B},
+       {0xA1AD, 0x07},
+       {0xA1AE, 0x00},
+       {0xA1B4, 0x5C},
+       {0xA1B5, 0x09},
+       {0xA1B6, 0x00},
+       {0xA1BC, 0xB3},
+       {0xA1BD, 0x0C},
+       {0xA1BE, 0x00},
+       {0xA1C4, 0xFF},
+       {0xA1C5, 0x0F},
+       {0xA1C6, 0x00},
+       {0xA1CC, 0xFF},
+       {0xA1CD, 0x0F},
+       {0xA1CE, 0x00},
+       {0xA1D4, 0xFF},
+       {0xA1D5, 0x0F},
+       {0xA1D6, 0x00},
+       {0xA1DC, 0xFF},
+       {0xA1DD, 0x0F},
+       {0xA1DE, 0x00},
+       {0xA1E4, 0xFF},
+       {0xA1E5, 0x0F},
+       {0xA1E6, 0x00},
+       {0xA1EC, 0xFF},
+       {0xA1ED, 0x0F},
+       {0xA1EE, 0x00},
+       {0xA1F4, 0xFF},
+       {0xA1F5, 0x0F},
+       {0xA1F6, 0x00},
+       {0xA1FC, 0xFF},
+       {0xA1FD, 0x0F},
+       {0xA1FE, 0x00},
+       {0xA204, 0xFF},
+       {0xA205, 0x0F},
+       {0xA206, 0x00},
+       {0xA20C, 0xFF},
+       {0xA20D, 0x0F},
+       {0xA20E, 0x00},
+       {0xA214, 0xFF},
+       {0xA215, 0x0F},
+       {0xA216, 0x00},
+       {0xA21C, 0xFF},
+       {0xA21D, 0x0F},
+       {0xA21E, 0x00},
+       {0xAC4D, 0x02},
+       {0x1804, 0x00},
+       {0xEC68, 0x8F},
+       {0xEC69, 0x07},
+       {0xEC6A, 0x4C},
+       {0xEC6B, 0x04},
+};
--
2.40.1

Please be aware that this email includes email addresses outside of the org=
anization.

