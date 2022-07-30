Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64403585B1E
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiG3PtS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbiG3PtM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:12 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916C315A04;
        Sat, 30 Jul 2022 08:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MM/9hCDsgnwgmCsbbEGx26pVjrjrVyj3Iqw+3eHJL2v0haVgZSW1eIuUe25p4JgutaM3s+DsOOgDQZuDOERgyJ/88TNqPMfXLG2bTsAKFmCg1nzXXPfIb3yHHS14TO24CY1aLeCkP8KxBpeJjqa0QDbfqBmiGvjBG6XSHIZ4RHKAZsvBI/lg4do8lzsbhH5SqGfRKQ283woR0CAYZ5nL9tsaO2bsc9cFd8q74btP+g0UegmiYQGmicGqPUAe7qMZML3cG1AsL5bNFVxeDntcFLPKkwk7id9E6h9q3J4si9GVbcx8hTQ+VRWEefXdsEAYhAmHYdijnqE/fSq1HXfyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA35iNsFgg6Bh38FSsqTx/VG1RcGEYb11t6EST8qKK0=;
 b=BqVUtl3M4B4po7M4MzXHhFCAFQcQ8AdjTygM6eyFeQxGBaVIwbFZpZwW8bfeWVYQdo/sVh9LG5KE1v2Iu3zJhzg5v/2lWSvRLdAJsX0LPo9rpBnItAvkTwA5glHAtCFyaAy19U+tSUoqI9um+sWtR1H9g7bqGouJHlJj3C0xmE9Ac5oFvKiyVT1Yh7ZI33Oip1EAMVD4M84w8DAUZ8VH9lxDMpjdzupmtBjMQW/eI2UT7QM9L7tOq5bkjfbYyLMtliwSp1OboIrrd8X/IeVwf/OyJId3c/h+MY1vWsEPgHSaGCVRvF7zm8JSSrC9GBxoiPTNFZ65LemDm9BBvGahYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA35iNsFgg6Bh38FSsqTx/VG1RcGEYb11t6EST8qKK0=;
 b=gdMtHBhpZ61lHgSMsUKZu4+23LNhnkFmuf5I8icVJfPsi/lZ8j5X1CBigj7ImLnmLfDpDLlon909cCHMj0WPsp2iMdb0hvmUkxJtcywJ49/57GpvQ7U6pWD5Z/qEOe8v3H5g1/oI8DmX8fr7GNUOXIq3aMIrgjXYDVHVJKc091U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:05 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:05 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 5/8] media: uapi: Add a control for DW100 driver
Date:   Sat, 30 Jul 2022 17:48:40 +0200
Message-Id: <20220730154843.791378-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
References: <20220730154843.791378-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0082.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aac941ed-902e-4271-990b-08da724307fa
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVl3AjuO4P+vhXzN8kgjI5kQRXKUKlggtaoJdPmroOJ2kswDyMnfy6XxVwQT1D/gwNxz1bwcz/lnt7ikjFMuOWRM2/cXbGCusJE1mFTsF6T2xf3ChFVRGHwJIF5ecUmRtQfStmtPqR2DWrmvqCKym17GKnJXtN3qm6IBDYn16Az+mgrgYLlZe+gpgRn7GBdM+EKOcS5SyVS/jM6GMA7WU+cOhdiHwyfdPilJpdnmGLZL1wm/1gH1MJF6VAYefV5+x8xvlqV1OqpNpfCM64DTLFWQjW1yp3hFab6OumSg0mWIjmX9RAWeTsGMrsrRZgctILi15edLBnQzm75bfxhS/MTWHMMngJD/EGw7LAaK43Ag2HHqrOfxwX0rKI6ldnbWyxzQj9QvyOg/tWBHQXyS2Y/bLiALzaLT8aSPdeHm+ca78Wx+B6343L7x/qJPcHFz0Duu2aIDQNEiVy1rsW0KiXvU13EoPCUL3weOgQnKjdPwPAtZl8982UV4Tyq2kLJs7ilaj9cg9+TZKygsKxBqiUH9v0Dx7cIcmKmG/Zn5D5Uc8CxM6AhdkekZyDN+9NCt6mph2pQkCNf0ZCFc4OZKs+A1K+XlAHo4ORfilJqkgRUTtj70i99CsKfZuNeIVzi08Vx45uDVuZfiMn+1wvdQCgEBpbSAeBL+f4VbiC3ehpFuW6joyV+qZzFT2cfRlrXmauf+hNkZY0vDOocK+8JhNHvPDLcEcFwm0FcA/Wv/7RHBMV2MXFcYgfIJ0+WSYHQojLgZlA3p3aza1/aUuoxZJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(83380400001)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(966005)(8676002)(7416002)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toYpqnjNgRVDUuH8RAPH5Luiai4OfDge+cQmULSPi+Vks8XSJ6MykQhdlvfw?=
 =?us-ascii?Q?JwpXfPzd8JxjNLFFGQfSQlBlzBy97FjEmsVqBM4tkgaTlCOzyKOTX7m6fnfq?=
 =?us-ascii?Q?rB6ARYAgYMmCbjkzrYXoV84/YZFxPMK0BKHol0xizX1SkK2cqcG29y4ul17I?=
 =?us-ascii?Q?hnuzNtTfakrQbZai9rAE/s5DIgM0RbUrrmWhNfnWIBqebm+oYu62Gv2xdovI?=
 =?us-ascii?Q?EXpC7c9HGWBWNiXhqsl1ElptFleL8eAxdQuMtaGPfoASJW6sNuUH+oxbPTCc?=
 =?us-ascii?Q?qRvyVyMlPrxgBDl0p2HlmI444Vz0brcY0RnCfTI3OnpS6XNM9C3+NqJl6qpJ?=
 =?us-ascii?Q?cWSRlwU4hvoiKM08BRfEEvej+yUR7hkUH0r2lGiH5Bm/lxiWJD1zJNVNh0PJ?=
 =?us-ascii?Q?Qw0+Y7/3sHm7UePftlufPKWdgxiIwn8qT1nu5jOOukjWsWenEh4GgFZ7gQzG?=
 =?us-ascii?Q?jf9aHH+3I3KifObV7neYDHRFCLYDDREEi0f4XYFDi2p+DFTCGZcIFU+Zk/pm?=
 =?us-ascii?Q?RJbzACN7KK2X3EdWDVoZkpVyl5LlSgvT3MSLvE9XYMRd6UGsCsXoHQ0BWTVq?=
 =?us-ascii?Q?4c2mXNILQX4UgAwdytd5WBCojAKcSl2UPt9hgjGcCZMm3brSF64JpiaE6tmY?=
 =?us-ascii?Q?8XmVT6XZUM54B7JAESHzT/PZblzjtq9ynTBtADgQ+RkMqdNGaJPBWwMIjkWq?=
 =?us-ascii?Q?BVmQhZRHF3n0e7y5Qbo72RK6zr3FpnG0kultry7f3S1bF0RThazMCMBBasqt?=
 =?us-ascii?Q?31MzKmsjaj8upKzt3Yhjjii+HF6LBGoEs/bbkgf0J3qqzoZUZ9scc6SPolhu?=
 =?us-ascii?Q?FpAxBDo96bB8qJTLDi1NH4/OOpMXojZwYSrlG80rke3T6qkj9xlJrOUTBL8S?=
 =?us-ascii?Q?KW7DPZUVlsJqpVVUn61FtmDT4mopBMNNLCTST0bSrC5hP8vJscv6+t4mTjdO?=
 =?us-ascii?Q?5N+3gAhBGvO1Wzr3cADty8H1cw5G6xUR6dxtblXjxFQUXRHsw/BelBhc0szC?=
 =?us-ascii?Q?6LtVrs3CgEYI20vnlbsO4AHzBbRCeLh7L+rBLWbBdL+ZE5560aHsq99BoMzV?=
 =?us-ascii?Q?HiKsANa75vHK/5omzHqXuBsNtBPq7oJfjhyeguWYxkmKh5BEUeB2/zp4FH/5?=
 =?us-ascii?Q?d0R/kuUkBsl0w7Qf6RkglwqpKWASl6VsR/zzO2c3SF9CGRjoaNjT814y29iG?=
 =?us-ascii?Q?UFeGLzjOJ2n6+8mtRpb6rkPx2DGsUoenEJ+tl47ugFMBblCtsvkmMWLJYFgH?=
 =?us-ascii?Q?FpiDS/MOA2DuHov6kom6rwx8kWRKAofHS3oQA9mGarnQr+kKY8hoBvMDDblh?=
 =?us-ascii?Q?MfQnqsjE62RmJVnJUuy8LooeC+2joMIrliGlZEVj1ETSHIZtjLEAHe3ZsHOj?=
 =?us-ascii?Q?BYAe/iCTjAxVd3QsXmiJn7DrNpCeUrV/3/9ahGxUvxc58RcsCa4zUgRlEC9d?=
 =?us-ascii?Q?573LeBukdJ9GcmdNJodq5mSzIYm2fgsP0EOjkZdUl+hWCWArwaiWgl576s3N?=
 =?us-ascii?Q?e8M5TB52PaJ4Xe/RMhe0qaRwtFiKaXAxO4Ok9wYMVpq/3rs3DEQZlP/uFNzr?=
 =?us-ascii?Q?mQY9hgg0q37+Oe9V9eLnumsxAg0uHZaYhj1FyQwl6prS+sQFx2iCqwj71FJr?=
 =?us-ascii?Q?qftrfZM/8dadMyUBlsJEZGtA52tw8Fa+8JKYYbPotInxOOk0oB6TCPgwWyoL?=
 =?us-ascii?Q?8kCwPg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac941ed-902e-4271-990b-08da724307fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:04.9679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9egBGRDOmpnsI5pf7mK7uShtDt34sad2nucXNu/Aado/J2CkoUpuR3+WpZrmV+utp2sW5n28Li2jHZ3AJnTt5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DW100 driver gets the dewarping mapping as a binary blob from the
userspace application through a custom control.
The blob format is hardware specific so create a dedicated control for
this purpose.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/dw100.rst         | 15 +++++++++++++++
 include/uapi/linux/dw100.h                        | 14 ++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 include/uapi/linux/dw100.h

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
index 1ca6fa55f539e..fceea6ece6221 100644
--- a/Documentation/userspace-api/media/drivers/dw100.rst
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -66,4 +66,19 @@ map.
 More details on the DW100 hardware operations can be found in
 *chapter 13.15 DeWarp* of IMX8MP_ reference manual.
 
+The Vivante DW100 m2m driver implements the following driver-specific control:
+
+``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (__u32 array)``
+    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
+    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
+    dynamic array. The image is divided into many small 16x16 blocks. If the
+    width/height of the image is not divisible by 16, the size of the
+    rightmost/bottommost block is the remainder. The dewarping map only saves
+    the vertex coordinates of the block. The dewarping grid map is comprised of
+    vertex coordinates for x and y. Each x, y coordinate register uses 16 bits
+    (UQ12.4) to record the coordinate address, with the Y coordinate in the
+    upper bits and X in the lower bits. The driver modifies the dimensions of
+    this control when the sink format is changed, to reflect the new input
+    resolution.
+
 .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
new file mode 100644
index 0000000000000..3356496edd6b0
--- /dev/null
+++ b/include/uapi/linux/dw100.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/* Copyright 2022 NXP */
+
+#ifndef __UAPI_DW100_H__
+#define __UAPI_DW100_H__
+
+#include <linux/v4l2-controls.h>
+
+/*
+ * Check Documentation/userspace-api/media/drivers/dw100.rst for control details.
+ */
+#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
+
+#endif
-- 
2.37.1

