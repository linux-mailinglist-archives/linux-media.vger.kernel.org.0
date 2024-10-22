Return-Path: <linux-media+bounces-20037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DB9A9D33
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E47D1F220E2
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A7D195809;
	Tue, 22 Oct 2024 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g7L+kyWO"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514BD187864;
	Tue, 22 Oct 2024 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586489; cv=fail; b=JFiTxw5IkBDk6Dty4hS48K4Fe84Dp0eUUf45EZknPev7ctHcc01Pjbq6EmgYtWPvqYRNW/oCKX/nCeguOF6kQLFbST7WP8z7BZih3d+dFkNhoNfbk7IXRzHYF6vT/JVS0mr47RHr8el4dkZKE6weEze9b4LYtBiNInx4iQ/gpa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586489; c=relaxed/simple;
	bh=GLbEl+5LVeDE7BL2JwoiNqyJ8jD8lfsmaYFkLyeA0LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XlIJR+Chy+eiiC8+l8xrUaUGKZQUML4bUsXAvvmltBn0fEBW+POe7SRQeATFwx8lcJMYo1IFisks0pm4zn+C9rARZRhFMnPUiQ3QG0K3or7eLwEmM5fHKYh3oZbiCtxdHkpWr+1Au1NP7pulzvpgVGbGLXrrI/tqgOYVroMGsuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g7L+kyWO; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCicKPC0rpFuhUslYchPgGaxkTbNjQlqMSOmQ85YT1C3Dtmo0MmYaA5djf59+Q2k2t5/63HEmUMOGO48h987ATzbf7jUOQfheJIj8dX8x3QxuEMvVdOWkH4jM6zKXNKtq37kfqrXuM2VVh5t1Jy6A5PgUdG48FTVcD2ov7ni4SGsYXwMROVSMM65N05nklW0Ij6KilSuC3YTFSq9UFaEv4bQn3Im2UykbVTJvoogzjOKS74EoGprVwFfBKNj1XQwfzD2yzcyx2qO1z5oPR5ru+Za0zl0RMKNcZix/L82H/IE6pmk0PzvI5ikbMhfEArdJDjKmIwS8gx3Vu87kk8fCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kNrIVmP/RIPmOKRXkCTPwJ2jcK/8ecXMevlWn1EQ1k=;
 b=XQaPKTU+i7QlKnRg/HMePCeDgIV7IOLZ96/kFvMaM6EzISslWW3QrvFyfWdFefgA1/3DL5y4xg4ztZlyAKUTP/9bZaJUMcwxj52cuyNTzIBOrN/k+85kkZFwq88jJaeJwZY/RonBHDtYEDcq6OEeXm3D5ZBePPeA5B2dxZaHChm7eFwCqTEAYM40uPb7ZXnB7lGSY6N4KvBhEc4gDtwQyKemPyUx00VoJpdhHUXe86APsLGEEhtmu8X9Kkm6KrbHsi4YLqL3EVwAAJQSk3RU8Z5ilkAKcsLbNyKVoFpG6LPRx9m0QcQv92XtIAGfKoCHKHq90XhW7kaZh/fTniWqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kNrIVmP/RIPmOKRXkCTPwJ2jcK/8ecXMevlWn1EQ1k=;
 b=g7L+kyWOWIrSgLzH2DMHJ1MtRBB6WKh/VY48Aw+oF6PYUnNl+dMMSf+LUObeBenlsXSUrdv2oIKZRv9lVFqWjdBHadFhm8jZP1S0qwL7/Q60I87o30i9RqjVxKS1/B80v8LTZbB0pyYCKgnjYx7aTBby9Z/zcBYTRl9jVCKrINHvtFfLEFdN9QoPSh4iqJSfaylexdcsRrxRMNWKknpcmPyD7xbhtLr19jK9vj/zT5NQhZRKPici/gaBadmWW0yXAsbKDFT7dB/5nsYbg7kqZTjmxUL0d0FxyCeIS5JOpRMPLTXdk6zDq2sSYK7HrDuzcYkphIyxUzsqB5uDokS1lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:41:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:41:25 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v3 4/4] media: v4l2-ctrls: Add video encoder ROI ctrls
Date: Tue, 22 Oct 2024 17:40:40 +0900
Message-ID: <20241022084040.3390878-5-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241022084040.3390878-1-ming.qian@nxp.com>
References: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c64fde8-d3b6-49e3-7b2b-08dcf2754fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R/uqbIPHIYWNJJzUGfPRFLJMhHv60maErZI+w/8M2aHk0YnNJhDVZxWG5piK?=
 =?us-ascii?Q?pAzvqORX7X2T1Xxrg+gYPVjwkfNWKFZ+5giOhV81J/vnh07rgnz3udn12acM?=
 =?us-ascii?Q?JbLjNkxcI1gCXVFeNa2Q5JuiGUr02V12AEQxagl/Ej5FavDqpmvfvtr+Mboi?=
 =?us-ascii?Q?2ZZWBeUMWOkjqkUuphJbEZM3gpYMaeNNQtM7+UkV1iy8WzWJCvqAKUV/g7d2?=
 =?us-ascii?Q?tHolniI/CjDHR7t0tR9fAWbGBQ7oU2t5PfO2SGaLf/LTVWbPPoG1AnJm3DvE?=
 =?us-ascii?Q?oOB2s32UWNnbGJPCUWal7eyAvJS26njRoGIvURPaVyAElTWdGuLgIYlWJJ+W?=
 =?us-ascii?Q?L1BArn8wyLerK10Pn1sS3/gYKlfqFEqk32vAVfsxx4JZyFgb+hPIiEnilSmy?=
 =?us-ascii?Q?58kvu5varUruVtwp3nCWbDsSoesROGQYUAYa4yGa5Z5605Em24ACPRJtyPJX?=
 =?us-ascii?Q?jOHnW5P/Rx4GdFXg/gpjf6IXe9tHsM5tCuTzhET7RNUOoqSfTmnILuvnhOn+?=
 =?us-ascii?Q?8x1EouBGQD85L9jDSj1Nw7eBh4cN8p/VLVNsViCdCbtEIUm41A5PLa46sSmO?=
 =?us-ascii?Q?VAlZpsGNLXQWzDdTSVUvbc4oy7hI2gnhveSFg1l8PewtO9ep2PyRGcc440dY?=
 =?us-ascii?Q?0PkGTTjOJtnerjlUGix8mzidCzXojMedaRJuORybehNUncbj9G6WKPs2fJh1?=
 =?us-ascii?Q?xR6r6veN77teFn6+ClL63GkyocBP5baFoZkL9thGi3tf1KuyxJ0pYYpe93zj?=
 =?us-ascii?Q?/SeFjvzSfMo6vgHXV+r8/UvshNd3MnRfG4h59Dk9CQMRRRfGBRVUZCd4Az7j?=
 =?us-ascii?Q?fmpBaMuk2Ez/cngJso9pWiDxezonP3GcjANnAKXNpESzvDNKRZW3lnpAQCGQ?=
 =?us-ascii?Q?V5c8v2VmDqRz8eZNJFGG2QP4JdFBvaIDGtZyc/o4t1LK++cOAzk/HCaow4nB?=
 =?us-ascii?Q?d84XFJUH/a4zDtb3UfO4w+fFEKzQtshEjPAWwlZtO+3P68ofNQjnk1rY0pGz?=
 =?us-ascii?Q?/CYxt2arakyGHrwNqkX0y3BnYzNQ14QX15mQaZV6icm5hd3CU9XpMVXJ+HHO?=
 =?us-ascii?Q?ujtQGAtHueg0X9U95kQhta5ndzuaI08VAB5IiZhHmCYwXdJpL10NItNQMMHD?=
 =?us-ascii?Q?yJKgmhMtK51IsYJrjuoRT2czCxR7rAjtCl0DNkuRhDPWUkERfANLhty0T9Iy?=
 =?us-ascii?Q?rxEv0nNpwhZZwpeNrWpBcIca4PGW8qJlJkHPgzR6OKfAfURsNnGsrZdu+mOV?=
 =?us-ascii?Q?t51OGLroXN/vGxph/TXSeFYqvpnmrmDbTuAIbsXcQl9/Ooy2L2XdbkOsFQKD?=
 =?us-ascii?Q?R5yaXyAQ9eqIJutsvfTiPFknPStOul8hq66DBS2riaV5q+pYkOKXb2BikYki?=
 =?us-ascii?Q?p1a6kvU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OV2vj4AFz2mSThnkkzRecXOPrJyL6ZpAbWF9LU6Uik0jUAkfB7JfyO5b4utF?=
 =?us-ascii?Q?olKUg66GdA6hZ6O4A14xU2k2unBo8dIyGNYtxBw48uNJXRAMpxM3jo7aYJTS?=
 =?us-ascii?Q?RxVJsPkzsGnHLOss/XKUq1gBi9uche9h6uhGfC7nCWPcVCQIi6zB12taqdUE?=
 =?us-ascii?Q?WL9D6KxiyoMlEL7YOMAFzoJq9XvlYB5oU9NMEV9eM0z+VvPvvSivYeBGT5y2?=
 =?us-ascii?Q?Ikr+5IrOWS+/omtGDNCWPPA/dFRniCxzXlfeDO48MfmvBL9C89o6XvOlAACi?=
 =?us-ascii?Q?BHJ37Zt1o+3rhBQLHShVYy5K5ylt61XLTUWDIDmFMvBQQn/f/TXJ88/QHUE7?=
 =?us-ascii?Q?zdP5SYxqMDz+qxkGL8eFUI+iYVHb3LiHEzymQ9VfjJMHJ6cU9sshak9rPMTN?=
 =?us-ascii?Q?Dkd4Vp+6zA9xfN910bNqTYTRTjINbsuoillVlZMYtTdNxbBLdhKp9INjbxZE?=
 =?us-ascii?Q?X1TcFsokdwJu0Mlo9P1vkR5aL9z98f7IYAwcFS8Qt0cu2wVog0twUIs0A4VT?=
 =?us-ascii?Q?NA9MT1oMkdzudcx/GPEPKuqC0Z+0fOfzpRQ2JJUMSFKeqpARnDtMxufHcBUT?=
 =?us-ascii?Q?Q6u09IV+UX9F4o1STCUc2czKf56c4ibNBWAHZZhZdK6bIWroQfv0Sk6OWj2r?=
 =?us-ascii?Q?fFF5F0PjArCYwTHvkg7Q3HI7GQMknnZKodkisv15gnC9kJ8zpjbX9IuR1DSK?=
 =?us-ascii?Q?9Q/hkWcN/V6Hz032gXcCe7ppHVhrEUznjP2K5n+Mm7AdRQEaQjMsD/bim3gr?=
 =?us-ascii?Q?cZ70MuSthj+MY9D4LnDPaMBzDvhI5lK606U+jdy8A5KS0bkltfeI6ixEW+b+?=
 =?us-ascii?Q?+BP9uWyi3eaOJDYgYXZv9Pj/scwV7201WF+4tLCXzCW+7yanLqXCElYti/tM?=
 =?us-ascii?Q?/ydRhW1blUKCZtfjOEpArat3dlNtUZKXlliRqZA08b69fiOEGARAj2n96pEE?=
 =?us-ascii?Q?pVMZgN6iFEaY+ZuaVfypOoiD++QUIbVZXtNZK8lDrImmOKEMbKg+e0CkexXc?=
 =?us-ascii?Q?s9+ktjIoq6WsUefqaPVpTJY8tNLN+12EgSFxfeXLCHZ2bdLz4Ozf9pHsJuIs?=
 =?us-ascii?Q?ARhxuy7iTYId3XIVA01XPZFXwAcHJq81z5AE6ftE+GTaSeG1eLZjojjHYK3O?=
 =?us-ascii?Q?qhKS5wOZu10QACdLNIUMJx5WUBdkfcdMWmQg03D1HxeyURRPpDtHygDMhgJ3?=
 =?us-ascii?Q?dF8DSzLKXP6WYctws2LRPCoUFbXRJZMYcY075zMPXzQu/CI+U6SgS4uR8Uyb?=
 =?us-ascii?Q?NiiUUr98Xl6IVbY/KCmmr/VEsU/8UTt+aEINqFomoVg+/JZu5Z/RGtak0lqU?=
 =?us-ascii?Q?2M1mzSvsZyMDSzH/OXATCDuKUyOrxUREKw03D073rfV/O3tXP107/qlRkpij?=
 =?us-ascii?Q?IjcZ6LBZP8+SXcWI6haChfbDJj/Imd2m2FCV3W1t60dGp1Rh774R14D3PoDQ?=
 =?us-ascii?Q?Op7y9yB2U/EaxT2DCYsqN6a4sKKQYn8POrVhZxdvFBm6u52vd8/IMpkjVmcu?=
 =?us-ascii?Q?3rlhvMfLlSzkd/SLthKInJAPkL+qzCZyA5PfUmsrYADSlVxgZHSU2M2dkGRS?=
 =?us-ascii?Q?JM8VIkHcTSpqGJKfE4hFsosuJ9ybZdBJSshjaZX5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c64fde8-d3b6-49e3-7b2b-08dcf2754fff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:41:25.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3IrJGAuSKdyW/uMmhc99j7v6vrjZY0wi1fH8NXywjO5UICuhDYmhEDWFVDZEVmOF9HgEKeu0n2tdh4Y1Ll5bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831

Add some ctrls to support the video encoder region-of-interest(ROI)
feature. The ROI QP Map and rectangular configuration are supported.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 95 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     | 46 +++++++++
 include/uapi/linux/v4l2-controls.h            | 16 ++++
 3 files changed, 157 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4a379bd9e3fb..7188d8212677 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1667,6 +1667,101 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    (enum)
+
+enum v4l2_mpeg_video_roi_mode -
+    Indicates Video Encoding region-of-interest (ROI) Mode.
+    Possible values are:
+
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_NONE``
+      - No ROI in the MPEG stream
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``
+      - Rectangle ROI mode and specifies ROI delta QP.
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``
+      - Rectangle ROI mode and specifies ROI priority.
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP``
+      - Map ROI mode and specifies ROI delta QP
+    * - ``V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP``
+      - Map ROI mode and specifies ROI absolute QP value
+
+``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE (struct)``
+    This control returns the ROI block size in pixels. The struct
+    :c:type:`v4l2_area` provides the width and height in separate
+    fields. The resolution of the frame will be rounded up to be
+    aligned to this value when it's partitioned in blocks for QP
+    maps and the number of QP values in those maps will be the
+    number of blocks of these indicated pixel size that comprise
+    a full frame. This control depends on the encoding format,
+    and the detailed encoder hardware.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_RECT (struct)``
+    A struct :c:type:`v4l2_rect` provides the rectangular region
+    described by the position of its top-left corner, the width
+    and the height. The unit is in pixels. And it should be aligned
+    to the ROI block size, which can be queried from
+    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. X,Y gets rounded down,
+    and width/height up. The maximum number of rectangular regions
+    depends on the hardware. This control is a dynamically sized array.
+    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP`` or
+    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``. For overlapping
+    regions, the value that is first in the ROI array will have priority.
+    Applicable to encoders.
+
+``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP (integer)``
+    Specifies the ROI delta QP of a rectangular region. The delta QP
+    is the value that will be added on top of the frame level QP.
+    It can be positive (more distortion) or negative (less distortion)
+    values. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP``, and need to be used
+    in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
+    This control is a dynamically sized array, and the array size
+    should match ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
+    Applicable to encoders.
+
+``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY (integer)``
+    Specifies the ROI priority of a rectangular region. it can
+    be positive (more important) or negative (less important)
+    values and is compared with non-ROI region (taken as value 0).
+    This control is applicable when ``V4L2_CID_MPEG_VIDEO_ROI_MODE``
+    value is ``V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY``, and need
+    to be used in combination with ``V4L2_CID_MPEG_VIDEO_ROI_RECT``.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP (integer)``
+    This is to configure ROI as a map as an integer array,
+    each value represents the delta QP of a block region
+    in raster scan order. The block size can be got from
+    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
+    dynamically sized array, the array size can be calculated
+    from video resolution and the ROI block size, and the
+    width and height should be rounded up to be aligned to
+    the block size. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP``.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP (integer)``
+    This is to configure ROI as a map as an integer array,
+    each value represents the absolute QP of a block region
+    in raster scan order. The block size can be got from
+    ``V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE``. This control is a
+    dynamically sized array, the array size can be calculated
+    from video resolution and the ROI block size, and the
+    width and height should be rounded up to be aligned to
+    the block size. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_ROI_MODE`` value is
+    ``V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP``.
+    Applicable to encoders.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..4d89309bf8d0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -612,6 +612,15 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		NULL,
 	};
 
+	static const char * const mpeg_video_roi_mode[] = {
+		"None",
+		"Rectangle Delta QP",
+		"Rectangle Priority",
+		"Map Delta QP",
+		"Map Absolute QP",
+		NULL,
+	};
+
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
 		return mpeg_audio_sampling_freq;
@@ -750,6 +759,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return camera_orientation;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 		return intra_refresh_period_type;
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
+		return mpeg_video_roi_mode;
 	default:
 		return NULL;
 	}
@@ -971,6 +982,13 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:		return "Video ROI Mode";
+	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:	return "Video ROI Block Size";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT:		return "Video ROI Rectangle Region";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:	return "Video ROI Rectangle Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:	return "Video ROI Rectangle Priority";
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:	return "Video ROI Delta QP Map";
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:	return "Video ROI Absolute QP Map";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1512,6 +1530,34 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MODE:
+		*type = V4L2_CTRL_TYPE_MENU;
+		*flags |= V4L2_CTRL_FLAG_UPDATE;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE:
+		*type = V4L2_CTRL_TYPE_AREA;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT:
+		*type = V4L2_CTRL_TYPE_RECT;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY | V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..bf67d53af737 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -900,6 +900,22 @@ enum v4l2_mpeg_video_av1_level {
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
 
+enum v4l2_mpeg_video_roi_mode {
+	V4L2_MPEG_VIDEO_ROI_MODE_NONE,
+	V4L2_MPEG_VIDEO_ROI_MODE_RECT_DELTA_QP,
+	V4L2_MPEG_VIDEO_ROI_MODE_RECT_PRIORITY,
+	V4L2_MPEG_VIDEO_ROI_MODE_MAP_DELTA_QP,
+	V4L2_MPEG_VIDEO_ROI_MODE_MAP_ABSOLUTE_QP
+};
+
+#define V4L2_CID_MPEG_VIDEO_ROI_MODE			(V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE		(V4L2_CID_CODEC_BASE + 659)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT			(V4L2_CID_CODEC_BASE + 660)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT_DELTA_QP		(V4L2_CID_CODEC_BASE + 661)
+#define V4L2_CID_MPEG_VIDEO_ROI_RECT_PRIORITY		(V4L2_CID_CODEC_BASE + 662)
+#define V4L2_CID_MPEG_VIDEO_ROI_MAP_DELTA_QP		(V4L2_CID_CODEC_BASE + 663)
+#define V4L2_CID_MPEG_VIDEO_ROI_MAP_ABSOLUTE_QP		(V4L2_CID_CODEC_BASE + 664)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
-- 
2.43.0-rc1


