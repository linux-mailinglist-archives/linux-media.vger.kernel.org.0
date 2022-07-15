Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94CB2576321
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 15:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbiGONyA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 09:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbiGONx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 09:53:58 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AE91ADA4;
        Fri, 15 Jul 2022 06:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNAM2sQolzC4wSMMFKk82ZvHzhrnxqKda9ZtvlyYjxsPPY3oOyOAPO4PgOLbUS7kay2cvOz5k/5WTTwaLSMa+A7WyGVM8tdF4I7GuMKqKbJpHhBkXLTUuXPpRqJKykZCqwurLVMZXGQ/YYzO49KeMuAaURyBk4Ueueik2UvHi7FxECM9BEKVc+5CzNcS3d6BQZj4Mforue7tj07DxC/5omVYFjOEyG8Q5bRhtp6N9a9IRFdXpVIAh/UUxVPqmozLg3gxAAcSxg1S70x+vW0yVGDSedEtvsei/5rK/Jn7XF489rDJfZ3yXUrN+d9jCvnAn714tYYVDpglJ8oAR0tkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ervFkx/u73e7LNB5CzxBael72hFEpKh5geegkyMMdeY=;
 b=nRcUw/XvHvxaWs+jjDMNajSENJ5Mie8ogtqVfvABQPeybGnDaJFNSfpJsg1N7fm/2AYNt6udX5Yq0D9T+OPyV308PBAAG/0Q/mIMl1zYCd9VFJYHubLSUPLBJC9fb4PpatkNaShmzJQkNQSrPkHrvz7J+iALsx4j2OtzCu5aaHVTQONvTlxGxvRmIihcOD8cZYBBfJ7nblKty8HyhKANMeTOjsPJg6XrSBwAuax+K9CKoJrsFNSMNde7tUZSp9F7TJ5otfZHveq8dHX3woxZSHiWJ7Ig4GmTcoUmY/JP4ozdonZMsrwZOCUZWgEbhI59QumFWAAdta+gAccE8L7Wjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ervFkx/u73e7LNB5CzxBael72hFEpKh5geegkyMMdeY=;
 b=I0Pwmp6KYC1LkWjmYAl3Dpn7fKX4vJVAagEYCQ9izQ0xmTuLAoQ/I5aP0rMURRDfCCTrRJgoWEgNjInH2pBcQpuhoNwQBZwWKURWQmo2AfhUuqj5AQ4Qo3nV64x4iSe1ZpAOOY4l9O9xwfMAZBF1YQILB3Fa0miCfDt1DL1jGTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:53:49 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 13:53:49 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v8 3/6] media: uapi: Add a control for DW100 driver
Date:   Fri, 15 Jul 2022 15:53:26 +0200
Message-Id: <20220715135329.975400-4-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
References: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::15) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8ac96ae-6e76-4bc6-9f24-08da66697175
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHOqb+4DEcRy2ZfLJR4BpL6Baj1Uwz216m55rirRCWbGCeKXoNdBQ/tDR1e0Q+OGSKlfPxPN3YJWM0OpFzq6UA8x8w8iqZzwNypBTYP67/wYOp9ZcB3TbRQMdaIOey9yzEzjXzWdacXjuGPjWeGhG44cuQ7WDRmSwIf6J9zvtATt++IObm0C1n7kNUQK16P/qcunVnoU9pJx3j0lrkDePKr3UUXnQBGt78IwZvhW7o46jS+uhqaerH5UbW3iY13LvAwz3mO2f+Qkue4fzO5vfTxihNHq0icNMnUo6DjKDSsT1SP3/cZNRqxtauLj+l1pRwprMq4fOw23IHMdZGgWQqvrWHVbnEM9Azo89MmEE7X5L/nG0XjeATwM8XbYqpoO4yrRMQFR1muQcHycFb6DYqMZAQJt2ofVqUmvBOyKmTfRvDYPS+SQ97EmNm926S4dbxcNuI6CR3LayZ6p27PE2I3dqsgPxfKgHfaHy8p0BgS2OkUWsEp/Lywie8VgH6GRsTvfo89sot+WZy5C9zgFGBVugNb5nvKWnjasGi5wgtIWGQkZ/Fyoqqn9UKWa2drUCXPHH+mUKBLpdywF1MMoXOMCbVegWXjhSmrAYw9mmYTcAXAm8S8BvqN0phvXPygnnFVQ1qR5uPArO9XPVrbL2UpJAvYYdxlGaNZ+afwTGwsUF5r5BxrF0rQTRmNqXyzsfwvuaaNl4o7MjbrRCzMGLvSJBmTX0mXTqRp76htVoI4MCLWGKgU6dqmKRNhm/b5Yy45ruGmiDYh8Z8+mOzFaQHBJHzvrlhdIGIcppIOA4A0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(52116002)(6486002)(86362001)(478600001)(966005)(6512007)(66556008)(66476007)(6666004)(5660300002)(41300700001)(38100700002)(66946007)(316002)(2616005)(1076003)(83380400001)(8676002)(2906002)(8936002)(44832011)(7416002)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0cSz7R7mF8sE61aEjAXnnDHrNimWhOdmP+C0NcoCa/IH0o1qwZNQDXk7sK6B?=
 =?us-ascii?Q?I5AC2eP8q827Neki5txu98T/aioGkUvlQrCVzTbOZKQyISAZ34izxu2H+Iyv?=
 =?us-ascii?Q?3vfztNfdLSs9yu+IeT7q7BWMR7R947RWXrvLwL2OWzkFPoLdkH50U5igVsWo?=
 =?us-ascii?Q?5hc4WdrhjcaBrxwhQV2vuKm0cidk9jfD/9s7ZFi/p3rYw4yxSAe9ADx32aT9?=
 =?us-ascii?Q?c4gOkNCjm1XVdxjSvzLQuI+9t0XnzL6HLCTqhO/wu8aQjAC9UChKzwjl1u5C?=
 =?us-ascii?Q?NNd9HiFU9daCxtMbw2jbEwfN9RxMJPu/kgwsoDIA8fIoD7RoXJVkXbfNAw66?=
 =?us-ascii?Q?aKgiZJB3uZA7gMz2434lsM3bEGI9YcTDf6PudLnhQfzKPIAZ+7FUWxibdvfW?=
 =?us-ascii?Q?PD/5+4LLPaPPQ5sjkVtNlOWq7ldds9tgJmNhLpiccqPADME8R7u8HLbM25pR?=
 =?us-ascii?Q?OKmG88RkoOTu5+RMcDCiiya9o/EJ5OngprA/tJs2M97amZRGzjDCw5zvdNCU?=
 =?us-ascii?Q?7gjodBujyiJIxtpmVei1ak8zvq9z8qA0YHa008e8wDPzJdVFIQ3XQJkP1Og7?=
 =?us-ascii?Q?BGQmrg2BH3pmqzG0W8RhZj9BRlR6KVbOwskBX1VsyQJHOqeQc/AWb06+P3zD?=
 =?us-ascii?Q?uS1wldYu1gPubEjsS3CIGfkMZDgOGGyvtkVQ37tO9Nruq1rGkI82IqjHt0u0?=
 =?us-ascii?Q?3PZrkooEwm14iA9SAksEqmYKde9JELnQyP+XV4DUcYu3f3Mi4EbhOYwGbPWO?=
 =?us-ascii?Q?7RHk3UfMsPwU2J58OenVWaU1cx0Ww0ysWavxuCjj1RekdV2avJcqMmDT+ox4?=
 =?us-ascii?Q?2O0LuOCVD9psOv70+UKS04JN900IFHclwJ7bsTvZVe37/f6gQMAO0h9Zo9ht?=
 =?us-ascii?Q?On2YM2EhX9mmHQDOkTGaBCrvI2ZnRvjJJ6ZwKFaIuOoatfwfQa4AHV4/+X1E?=
 =?us-ascii?Q?5l3czg76m8Ess11/N+vOtOPMX3S96azQKoTYops5tOWlS6kN/stccp+jxcXV?=
 =?us-ascii?Q?JW5hMNvFJEXT1ZBqgpduzmIHg9g2To+YJnqwPN5y7YRm36XNw7XAz68EcFx0?=
 =?us-ascii?Q?wV6bIbhMSTtgUk3eEACLTt3LlrX0qm6pFKL23F8SyvNr0pmsogVQByXl0ii5?=
 =?us-ascii?Q?fVhy8mUxkrf5JD/KJ7KxR6DWCk4zoeYWDZNBiqy/SZ0qexzst3KaNyec61IT?=
 =?us-ascii?Q?YrCuTMG49CAYiZLHgADQ0axK64N5pCnUrAIXL7wd3tkB74bBBPVQpqgag+DS?=
 =?us-ascii?Q?jdxyGYoR+Ed8RrtObsXn7WnT93EQYE92xCd5i0laNLE7V/zPIJ6tAuDM3lMJ?=
 =?us-ascii?Q?cOATt+A+Da3ntSORRzO58QVCtEO9e0xuK8aQWDl2lkjwSPxeC7nxIGebqYHK?=
 =?us-ascii?Q?oTj804pOrXY0VS+gqne/BW19tvJxIuIejQrZT/WM74f3fbQ7bH5AEQCt2qyh?=
 =?us-ascii?Q?xuUKiQaa7V+jWu6IlB2WYrkUKdRjpogDaEwTqgKzL24YFLC7pILkVRcDfIir?=
 =?us-ascii?Q?du0bCek8JF6OlRN2NtHYV9sitoR+NuUabSYy//DxNOoK3FQgW21cZcMsTd2X?=
 =?us-ascii?Q?Nmgfq7/0f2Poj5HBXMcb31IU9GSQI70UAYTfZAUJwjtWsUwndZPzfWZCWmS7?=
 =?us-ascii?Q?VT2rRELzboslwqInhlrg6X5cUNSE6jKDQLGnR1Ksgw9jEFlECDj12ZZMvXfR?=
 =?us-ascii?Q?XYBWxA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ac96ae-6e76-4bc6-9f24-08da66697175
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:53:48.8573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfUYaOxyG8Qq4W7uvlkSQnXQ4/EXM0KOzg59p4uTQlXWIYziMc3mK8jVjewIMQUlNkzuUJTmBnrlAm/9D6senw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
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
index 1ca6fa55f539..fceea6ece622 100644
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
index 000000000000..3356496edd6b
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
2.36.1

