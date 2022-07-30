Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0094585A06
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbiG3KZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbiG3KZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:21 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9730E0EB;
        Sat, 30 Jul 2022 03:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dx4Xw4RsJNg6+DgSpuuUwuFK7ia+ymh6kUZj6bN+gZdA9WNtycf1SMrYcN+i+XgiT17clUgYY+FP+2dMQ3I6IUk8EVry8tHil4eX8MWY9y8CDQAixzMmThlkrkKXaHe5mLm673QyDapHlyMoiCMmBB14LZoJrjryZXoSw/9A0Jhx9ypmJROtFJMM6WfMhGQcJ94KeVJseMY00x1nSS+TaTP42J5JIW14DQGlPCtiiej9Gsu6+l9kpxbOVCjRxlj5ohgo/pd2rHvgWtJVKyKTruSPbecaDRmUIHwNmyp5cotYHtFLvDwLzjaZhKG0o40VMiUahtbBaNa1hSMY0A+/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA35iNsFgg6Bh38FSsqTx/VG1RcGEYb11t6EST8qKK0=;
 b=UHORgtLuZFk1Vlp92Fl24b2TDFJkiADUs2T4gPslBqFY3ih8IJ38IcFHP2NwubAFQnSqQtz5h9EYD/Ywm39stdytL/SZdyA0Lk7JHKnBaNlgHwz4sdJ1Jdi9jLIa8UJ29e0Ss64blZtD9YswsdvthrlG8Z1/FrzsI44JOS46tcWJkFnnq8kkZhv22kYe0ZmwNE9ukNN/BomCB0JIrWT8a5MOSVzSQHZSH6bObVOh2qYjt+WQ3fHWbzTZ4gQHTgHpNf+m6nuWHsl8C4w2e7gy8B23wg2g96g5VcwIxh2UsLhEi3hI01sVGUuobUFwKld/1IFlNM57EdOZusTdcXj5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA35iNsFgg6Bh38FSsqTx/VG1RcGEYb11t6EST8qKK0=;
 b=mFMYg8DklA8jaR9boXDqKiCMVKj/5R2ShkFqNAnJHh7yOWKfsFMkVNmOMX8zQYTVVB8o8JVzzirJ07lFusy1FIrQYpkNK3T2sf3JKASVjbNtgD1iHcJBXJlG0XoFlCEFXCg3ANMq6GRzRrnj10ZX4OEztrf7gZwwDjnrjxOFFzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:17 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:16 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 5/8] media: uapi: Add a control for DW100 driver
Date:   Sat, 30 Jul 2022 12:24:10 +0200
Message-Id: <20220730102413.547698-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8ce2a5f-618d-4654-8cf8-08da7215c736
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NidusxkLkrQHWkprdzl88sta4QhYK7AXhLum0uKFA6Vjw9FNQKgVf0mKL/qBHFK6ga7dL3XYn8ikYRpQrIazV8ogxi+luyHyz+GZKewtTjoFh4IKRmUFNOkLymRwDaI4TYJZmHEE4hq+tbjHf5aRH6S4Li06G9TnDCHBdSuejX1Mw60IPb10jnGA5El7f5Wq6+Uw+USeTzfOc70NyR2Mt4Mjk2MhJBpZCUJ7O8edNuaR7HmVpJbz7QJtfdFIf4i34pIEMxmX05LYSwf3JKU/QKGWCNkSJqbzSGnwbpqeRtrT+q0CBYRKbqj3k2F16YefZtoLxxthbe5LG/tW2ZhFHRMIpiydIV5IL1nt/qnCvPtUAawo/0s64h/TVE+MDAbunEcEbBrAmy3yVGXqa/Ui+dm+8QFxSNFHNcpYeuprwXXp5IC/ltFLkWDQ0tSn2Y/0QT/disYwj3NU9m3pXft2YxVq/Yyw9JYikfIvRLS2xq8yWq1I7YhxD4u9xoB0Sm5mUf5PIvZ4Yl41zPXsVxFAxeAeMayHkTG/kmk1Zgv0YUya+VJ1bqAp+7A3NI3wSGneUgLcQFEllUqkNMFjrpID0DUx89l4UC3kiK5B9B744f8Go/njENJeSGvNOx8MWpiUNgg9/k/FGFnyQxtBFw/tKPe1WdK8eEjimWqX5Q+pPCUK8r9hSsECOK/PDQ1NZTJwloMCpqaLwvITA/RPxVdOJA4YJqaSV+/LjVg1y0Xhu2CGuEHaEpocGP5oscbxvdNGuhHfi0wNn7iNxOMEIXFrPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(83380400001)(52116002)(66556008)(6506007)(38100700002)(6666004)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(966005)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gLEn/XGEgreJo4RvbxZJXJK7qxlSywmyT9EsDJit9OMTronU6laMagxJGujz?=
 =?us-ascii?Q?yTSoH9LARJn/Ug86acNKvmlB3kg64sqpAEgsna9gbdrgZxxIa++gyiflBhrM?=
 =?us-ascii?Q?OnrkwIMwBwDILABPIdSZ41Rk1W/lXCh3AKw6w73a/1EmJNOdrhxOTrzG+Der?=
 =?us-ascii?Q?yUU4J9uhwPBs0BhocayaGPMW+amGRufkr2zDFCGzHQGyaCvdxlJMDF2BJtBM?=
 =?us-ascii?Q?GipbHbNOAwKQeFtfrETXkWTDjp5PGWcLHGL4AJl842f9ZeLOQVVD1VBFV/t8?=
 =?us-ascii?Q?o9B3eP9SzjOeBNGm6gGDJGrijRqGPlwhpA7aea2m4CYD6vfKzMxUpd4apnFy?=
 =?us-ascii?Q?N5qEllHpv2Z0hbtE+7H8yJLplgPOmAF7Zt/hqaV30Z+LS+QY/WrJ5VVorHQA?=
 =?us-ascii?Q?gOlKk4LPbIIed1bopeZS0sysI+z98xSUQzttYCchj3zJW73Y8uxd6dm7nL4l?=
 =?us-ascii?Q?9xle3rIxhrGoTXzxz4q5dsPXLsrZI7YwfiDyCbdrETZ5VIPKbTWZzkMMEPbr?=
 =?us-ascii?Q?V2OiVJHZSK9m/5Bwb46S/8VLNFdX5v9TFgNC2nYscEu8thUClj6ctJH5PLj9?=
 =?us-ascii?Q?J6rHPXSLVrapXSumrD+ipvL9SDxhTbF0WvJg0HsRzLeSUffRpduITFkwysSG?=
 =?us-ascii?Q?ny5s0ID0NfmdtSemF3N5yQqPHNpGH4eslTyVvfgcOTTqOmAg/BEox8DHJ+zE?=
 =?us-ascii?Q?eoC4PqZEw58oaRdxc0hwkcZvVa5ablpy4MktT3tKvBpkwbLnRrFDaB5Cu+E4?=
 =?us-ascii?Q?4IquNBKzzmYCwYUhvBw9A6oz6+QqR6dJW1ydtim5qXhtXuXg9ID1LMC8ItSC?=
 =?us-ascii?Q?3SBmSipuF+ukOXkpgP554W+fy9a0fQ0VRdWYQUH8hD0Sikoo93ZNTDwmZa0Z?=
 =?us-ascii?Q?bq0AYEvVCOL2AZyquwQxAlc9SlYYOE5MLy5GnqjyxWrTmuHeRWyEH1cRzWuF?=
 =?us-ascii?Q?VSlXr9y6bSWq8U6TgOqhw+RmY4fz8jdAO1i/DHqkB1HV8GP7Lhr5SaR0lxqV?=
 =?us-ascii?Q?ILNfElLTKof9UfljOkuvBLWc3boOdZ9dFEC9MZvpeCFOKNenL+6/X3h3ujTB?=
 =?us-ascii?Q?tXpoNxpbRzASgf21JJ7057fFZzeDPI33HfyOsD7l1dHNqBo3QmXvvFx4xvbP?=
 =?us-ascii?Q?36NOPdTis1HhQXr34Bfi+Wus7Uepdx0+N1m06j1X6ywepuQ79kUm7h/Q/o9T?=
 =?us-ascii?Q?IM6U9B1wvBh7GivfAy1NVvK7ptl4/KNnMXZUmEgUjH+Gx/BOM7GEyKlUbxvJ?=
 =?us-ascii?Q?2N/6ABq2Ogws4XUPmaD8NJZFJxP+g0VtRXIzQ5E6TVcEieWDs4obcybERUZU?=
 =?us-ascii?Q?paXwWi5GooyjXFYGY30ACdyec+1TM/JMMzE4Pbou7saBzewvRITC1bxfSb0P?=
 =?us-ascii?Q?ugUYMTHdVWUDgkkz1fudPLPxTc6ROvBlvuFkWP9xcsgI+Z/rMy493FR2Jf61?=
 =?us-ascii?Q?vWlDzTtpP0gHu57BFV7rkbqE/qJzW6it1HfP0MYMrRL/Xt9Xa6n74Qg0YRqB?=
 =?us-ascii?Q?msZZeFSzCsCs2F2NqLuhzYFNyzRXK1sICiFIDqDTG+rRE79/q3f0i7f/jsgy?=
 =?us-ascii?Q?hBN8enoInF0Krw9gfuL8wjo3S6x/W+Tq1gH1IgvZP04k0wW6FO/zHy0b8Y87?=
 =?us-ascii?Q?YDvGezGjgyNz6nMzqYx8XYA8FzthJj5r4h+RdH/I7xSjPKhkjxEVBZrdfzv2?=
 =?us-ascii?Q?izbzdg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ce2a5f-618d-4654-8cf8-08da7215c736
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:08.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8MmZJa5m01B2+PiCZdW14CI5Vu2TSG/voVox/xgusxn+A1b67IVfa+kI5KkYQYroGxehM5bPu6kiqp7L7KHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
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

