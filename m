Return-Path: <linux-media+bounces-48194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142BCA1AAD
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 22:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB0DB3002B13
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 21:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0C12BEC5E;
	Wed,  3 Dec 2025 21:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KPqjnP+z"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E08258EDA;
	Wed,  3 Dec 2025 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764796946; cv=fail; b=ZDFeiJjM0gp3Er4xTcO0RDI+UcTDqMdr7/vbj8mEFfIP3JN8N2c/ouULWecSvRRfMILaBD1MoQa8rUh3zB7JDHHGCnHX+1LmeiLuF80E/rvWIarV0/xKiCmnamh4ZkBGmMAf/0C8FqsS7iuhTqoz2iF+jm0+PRhfPX+6bvEZtVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764796946; c=relaxed/simple;
	bh=svz0025gacLctRNsyMPoKqav8kk/nfSr7FIRp5PhRWs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gt6e3U2I+O16C197Hs0FEQPqm8OSZx6wDTDbV6ZWyGhnlc5Y7ZP+o7hlfGuQPCQLfGngw62+HSOI3uYKHWvRRkGQXBEycS2n6Hp30XR6H36ubgawBu4ZInJ5Rx4qdpa9gyHEwLgoYLdu7sejZSWsXFOLyoeR6GhHS8zlkvOBMbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KPqjnP+z; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMs88y9cqk8g0IVeK9nvw0o6e3NEKqafedLr4OpFYKlB4XKyHkwMLyQvc2EPzRiBvxv3MhF5Nc75xEAoPUvqxEpcS9TGlCOj5JzJI4ZF7jEIohpy6ZGid0e1+rYRr/tix3Qf9Q5VVpR3u0W5eorg74Binc/95Cp6KgHU184dGva0dw27B8Jd9NGt27eUB+ZwQQx1O6y2fictmSiEKqrsUdJIstvtSW86Pw0fK1eZW8uddqfDzDmiEOYC/4tkWv6lzMhn2qsgcLb+OJ3gPKsR9U8zX9V+9AJOD2bb+ys2mj/ynfBiW+lPTp3KJawK37AMp+gFUPkRlkVCyUNISR7xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vWNAeFVZllr84gR8gn8iHnphRB+6RIhxvTdJJ8Kpy8=;
 b=X7EDzCBU9jdOZmTsm1sB+cjlFh8F4kgZzd6dqzLUcOoKBESR6UYj4UaTQrU8kgXULGFZki6AlTlAYHbM4+4aQheMNhJD4QJ69ZOktI8srkjrFsP0xPFjejcVbPtyWSa+ZJw+dckTBpTbWBtuNPz5pW2zMUSP0v+ca6Vj1c0IKzntUwyVFChhMgVp1UOmatzjOzL/ITbtsD6V2F/MBKkUmyKtif+gEgnha6F+VhfEIAwMJ9iw3VehnFoUvBk616krzhrj5zpc27mTEIGzNhD8Y0ehF7a21pT6lEMGVFl+/z6cmSFBPbtgiLqR9oDj8nxLGWBuxP1hfnmft078TihKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vWNAeFVZllr84gR8gn8iHnphRB+6RIhxvTdJJ8Kpy8=;
 b=KPqjnP+zItLKU7w8/b7/1ZDvCEZUEhXcd45tftDuxczQlC7YL6hn39L9aCLhuT/2RvE+jNXFJpQ7G4/7OOHgTFUKYLJKOSZMJ0N5RLtZoC34fmP7npM3T1s0NTjx/DFOhrYRbe3mI5mxYJSvtL646pPv34nqnmzpLotSh8HWWZR3cl+HA3OPrxGEcprVJKBZ6YE9uHZ6PfZfF3WeuRNsgnkrhxPwPqFV50SWfNGtEBcWzrLK9iF2zcl3rNVVs0dCZj37+xhv7z9FWBz4EvE8P/tpOXnZGfeAIiQ/wFSFaBVM5cLlukkUp2PJgbETo2pke+eTrYBWq22//jUwYUVX3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10356.eurprd04.prod.outlook.com (2603:10a6:150:1e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 21:22:19 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 21:22:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	guoniu.zhou@nxp.com,
	ming.qian@oss.nxp.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rui.silva@linaro.org
Subject: [PATCH 1/1] MAINTAINERS: Promote Frank Li as i.MX7/8 media maintainer
Date: Wed,  3 Dec 2025 16:22:05 -0500
Message-Id: <20251203212205.1320623-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:806:a7::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10356:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcbf063-0651-4aae-95cb-08de32b20a1a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?AYjvdeFOjhC7cYLzdFZw3zgtGYG58TLtSg2WmkEoEHFPM6SqFMOXmhAHc8Ab?=
 =?us-ascii?Q?wR80Y4jp6rpMRGrJnS9s/HCW5ZVVl5hGDdcnKVdFVKD4lo3XHQv+N81ZnP/F?=
 =?us-ascii?Q?wYxXavkDiyWIhLliQvSp2CRAvyLEdWE3PaOKpmsWt8UvQRWU39oXy7VHbfFn?=
 =?us-ascii?Q?lr9hcFnY4RoXzHnzVZ47mvpCr0g9pl2Hqy73UsppHFn9ofuZJxzd0555oMOn?=
 =?us-ascii?Q?zKBNGQkwP7Skvq5Utl5EMnRXua/HrSa0LCnlC7yRB7GK/qbFaBIkfML4an0Y?=
 =?us-ascii?Q?tZECErh3Lwk7ENT6feW6d9TA5p4pDq8DVu9hqSRS1myUDKGhUCTgop2myFZm?=
 =?us-ascii?Q?JrOtP7mp4zFvNLpylZrd+p8YEduWpcGLyVcSEaJfiV1G5kftrAA3DwDFHBpM?=
 =?us-ascii?Q?zYMAByYOeu3h/yGifWYDCpWfqdhnvVRlBUvGG2HfV9MVM7qx1NppqfAZZqzN?=
 =?us-ascii?Q?yh6+Vet10D3SZWS9oRfV05nDNFpfes3jW462IsK8QL3pUGAF+gCQUTx/t7An?=
 =?us-ascii?Q?eGniEzKkWpI4QRYX5E1imj8WITVU81e7Ib8USta+rN81iK5FvjBMDoxbkyTI?=
 =?us-ascii?Q?aRO3zYyainKYiTMxlfOeAJLaCYoCLr/DKOHVH9LvoqO2z3KDsjCf6iVGcLEj?=
 =?us-ascii?Q?XIwHY8JpUXIiQ8NV3PAzPatd8eJyt/H1YOiEldPa73zJsW6UZsJ13kt2KY3Q?=
 =?us-ascii?Q?sPkGyEedySY0vzVMBfBOu9dDfD1cuu+V5tuYnR8WLdhHq5ip0tq7LmiDMnsk?=
 =?us-ascii?Q?zq3Rj6FHd6zhNh2cFbpTR5XzpegNXYyVrVdtqM4BRjAsNyXTPlWPrkiPIoM4?=
 =?us-ascii?Q?Qj2PaaMEsZenS2Zu9j2uzORVqDTp5xgRRRS/uFiY2N9sYoS6Lt9GSAUKxYWw?=
 =?us-ascii?Q?MmGl9NCpNwulwaQAT/6EDsCgr5Gjsf+k/s30Pw0kSk180SOYS1150weFYSbU?=
 =?us-ascii?Q?juNTgPuV8c8JRpAiY6DaXxT7Dl8pLPCsbFj+Oc0+tGvO0i+QPhUP13Im2Zs1?=
 =?us-ascii?Q?9ougZmKlQByedGlXkugamOZULkZLLHUb9VZEDeIlw+frziKhDwYbvMTKLJzH?=
 =?us-ascii?Q?ZOidr1uF/fNkDiyaUBfsr1P5P/twxZuW3v09RBrzcFDXlApJ17JE0Y6K/mUr?=
 =?us-ascii?Q?L1rRC2I0Cc79eInEQfgWZ8aitNceXxfLVWtO+B0wASLmo0HnyUqJ+Gy1LIRn?=
 =?us-ascii?Q?nGR4VLFNq1I5Fosx0di2deP2iqL+ZkADoDMgNp2L6G5v5XodN264t2/DESEs?=
 =?us-ascii?Q?gNKHgUzTTI530oHSvxPVTaKTSV/jrVJDYK8o/T5MgXMy7pGQt7amk/r1Tk6F?=
 =?us-ascii?Q?e6ftdqLHto1NWawH74kmEtXjpN8SZfestodLfhvAlqrlNyqPQ5gqiOkBgQeq?=
 =?us-ascii?Q?NQ/0aqxCoZ4a8MPO+LvhC0JtWs7v3gKyGeASfg/oq23YiqUzpVtjmiq1edvs?=
 =?us-ascii?Q?WjGXOJQpYhZUduBoDU1KO8lYhoeox0cUNDe2MTCQ7tZE5VyPqADRR4DYO0Pb?=
 =?us-ascii?Q?qEtU7oU5PEtBgryEq/5SmeuJtMUFzVuPlf4n?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nyxbKb6UCP8Sif5vpYi7QyztLw8HJmnvtrPqp8C54oyneXrXghz4zKjuGY7r?=
 =?us-ascii?Q?eyoHVOjahPLfXP7V2sdZURcHGomlo+bFL2xpyxNUvfjhUPV5UAlXcd7ZYJuh?=
 =?us-ascii?Q?cSsd9SXOxwxZsmG4yrlQe4j/qWHZ/kLm7wGe2ZNcEN4wK08B2fy3DvfdjiHd?=
 =?us-ascii?Q?5ALQc1ZnQBuHQxZuPqRRWhznLerMbV6ijG/8JDTXrwp/B35jKa7C0pfQAff8?=
 =?us-ascii?Q?5UQmL5j9im3vIsBKqouiTQCWG1eR0gJs8yyWPMpxVBDeoP7GU3OKIQAuZMRw?=
 =?us-ascii?Q?K+TgL8JJy9rNUDVvSWbTqvV2gA/H+2OxSYln/Hjvslyuxjv7ANjvum7v8LPT?=
 =?us-ascii?Q?YfvFeKXfTR5NEdWTW9NwmiOr7wDTGuqtjZHVVe/YA8UjARKVPpdzcHpY2UCy?=
 =?us-ascii?Q?vDMuH94r4oyI/5oIaP/g03SLGqr6qTpgbQ8yW8rZ0XIj/NPxTjeRTQFJsqDM?=
 =?us-ascii?Q?b7rhEm9pp5yk51Gl6bxyQG2QMsM0MLVfk0JFmvpCJgzK+FqmysFfUbItLLPG?=
 =?us-ascii?Q?oiB2zemj94/gNN1WT1Al8oiTtxlth5mMbyUHeb/s3lfqGae8TFFqT5fogxLp?=
 =?us-ascii?Q?8iNRi8DqhBQuwy2Bb0MhICcNHkGq1zEoEFff1L7YfIbDcNrbvakYB60oQTw6?=
 =?us-ascii?Q?c3ckgDc5P8emAcNGJYtGPQ77voq+ee6rwMSbURXMIJIEvnKUmrGe2ittlCrA?=
 =?us-ascii?Q?MaK0vyh3Cx0zd2M6C+Ct7IdHXGZ9cTxDLtJBuAIPc7H+WMbSNKwaoeKQnD5G?=
 =?us-ascii?Q?0hy3FfOOL0ARPROzJBlgFNs/evhwpmCWTAnOtx2szU2equzvVBxjD35eZnov?=
 =?us-ascii?Q?5nLBpz6qel9l9Nl5QZSFTpXkVOZc/+BjxLzWg+4KcYI1FzPTDOa5YP9mKH3H?=
 =?us-ascii?Q?KudhW48iO5vIKRp9qwiVdnGPpucdaNbDg/w5pxt/gmrknifRPDRQOpXVmr2k?=
 =?us-ascii?Q?6Z3nwePzxeh7HRNd0vatsX9F5RI97tVpLPVn//M0tYgkyqYCuLU7/ziBk9EF?=
 =?us-ascii?Q?wd2pEsX5Z7kfELrHM9tShgvPmukxeMZHvNYHT79uOv9cgx6BXrEMapw5eIuy?=
 =?us-ascii?Q?mE2DO9iim6wFHEIV4ADPVvBu1yHmyu3VhN+zCl+j/zqE6T/KMcSFc5YaHzdE?=
 =?us-ascii?Q?RrdFLByV6C8YDy8eJMDBFn2Fv7MXkXx/N5fZwzJZeQ68zmxbY8tviFKLzuYO?=
 =?us-ascii?Q?tyve69/UuCeMxhZnBw2Ny+l7ZSSuBIhhu1F6pXNSOZwz1ahUK07s2dupolby?=
 =?us-ascii?Q?mnBsI+hTOmftJ4ndp+DEH3L59m3aBfhA1aVkdtUwoOSFjWwJOOgDU55+UVUg?=
 =?us-ascii?Q?ZpkHSKv4/XBRTH4vWTZlr3HIQrS41pNf8nORcl9KtHb7/lRnK55gfb3KA7tr?=
 =?us-ascii?Q?6xJTg+0zUVb05QgVKV4NWDlYLyR+kDKPdqJUsfGiQMbN0V/0dXPBMx/6Tepc?=
 =?us-ascii?Q?VEB9w1wO5828s6yuzuhAnARubBdDYEIYq/SkJrI9jwysuAvSATZ1U/2qN1uK?=
 =?us-ascii?Q?ndIWPME7LEtXTGKeJNGt91CYq2gmcmICFISPK7wbWskNkxdvzfMhdJDpDDGC?=
 =?us-ascii?Q?D0Vs56YDWlcvcfltaRUm80zI6/muY/WonR9p1PRp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcbf063-0651-4aae-95cb-08de32b20a1a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:22:19.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVvW5B0FYebKoi+98FCyeAM8d7VQ9BtW2zr0l1PNd1yFdfk2r+iNKaD5AsG+4LVmmRLdyhRj9/7W4IxooD3hnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10356

Move Rui Miguel Silva to reviewer since he does not have sufficient time to
maintain i.MX7/8 media drivers. Frank Li has the hardware, complete
documentation, and has participated actively in patch review. Promote him
as the i.MX7/8 media drivers maintainer.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
According to discussion at
https://lore.kernel.org/linux-media/DEOKQZMPDTLY.3H4NBUEC3LNHE@linaro.com/,
Rui agrees that Frank Li will maintain i.MX7/8 media drivers, and moves
himself to reviewer due to workload. Thanks to Rui for his contributions
and maintenance of these drivers in the past
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48810529994a5..900d5237f3ff2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15704,11 +15704,11 @@ F:	include/linux/imx-media.h
 F:	include/media/imx.h
 
 MEDIA DRIVERS FOR FREESCALE IMX7/8
-M:	Rui Miguel Silva <rmfrfs@gmail.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Martin Kepplinger-Novakovic <martink@posteo.de>
+R:	Rui Miguel Silva <rmfrfs@gmail.com>
 R:	Purism Kernel Team <kernel@puri.sm>
-R:	Frank Li <Frank.Li@nxp.com>
 L:	imx@lists.linux.dev
 L:	linux-media@vger.kernel.org
 S:	Maintained
-- 
2.34.1


