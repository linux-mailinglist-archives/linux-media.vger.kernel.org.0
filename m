Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247CA573E98
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 23:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237353AbiGMVMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 17:12:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237345AbiGMVL7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 17:11:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F8433400;
        Wed, 13 Jul 2022 14:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRisGBsJT9FizAZ42VsZ+p22a1zJ2hDird7+AOzgPDQM9Lppcng9igd4vbPpHo6aJEUXTIkNY2UqRDYYZDEG7m9j1hF7ueJwt6yvAeKkPJhiCeDTX8lz27TV489xpzBMPsCUxmi96idF3Fu8UbCwD12ZXMK4rCBkCuGQ1yR9Gh2s2GwGxrN29y3iuspIqLlXEYB2+NsyQW6FguZDgufyud1WXv464XX9oe66LRDlNZIbLWf+On/Bkekz6x4URqF1LLjByTuw8k87HR+Rgw+aLvgFjNUym/UuxDogo9pn1xQu/qSbgmVO1XLHzocq4nMSsgSVKiPD9M+F6FYrYvNiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ervFkx/u73e7LNB5CzxBael72hFEpKh5geegkyMMdeY=;
 b=JKtZ0VUJrtWO3i2IryiuDp/l9YFDX9CLCH1aSIjzbCGdvuJkOAqN407VYoD1/NC9dtv/oU5pE3KQsqzBZBqbhpPQTFTA8gmSG4uOntIPVDVxh5rp/GqCApr5YiF0MZDdwUo/Wf8kr7+UMzvyap8EU5z1aEkP7Xg7YuEKuWvvtKfTGFt/y+hgWI9LSeTyGSRS6HLRDm9dzsJwf7Jlr8Et3CnPKMe4sAjNQcSnRlSbOWWv6VRMFGqTbOBR94ugNBlT6AiDQfH4ofb52BR+Kr/HINLsjSXE4h/Qf+96m2pgyvA1vym1Zhbnmj7qaDDWGAbmrSZinsvL3QzVnQXKlnCqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ervFkx/u73e7LNB5CzxBael72hFEpKh5geegkyMMdeY=;
 b=RDU0wK/ioFsjZwRXxlr0/jHf3ToWBsFe1NgH9+TLhnHp4NkohntweXp8Jpkj4wQbeRdZ8R5YyMlogaAy8zvjlSgcEkiWEZ4soS3vKfk4aN0lBSKTtRUQm5YDsEkRJ1SCplE28/pQvw9Oz/E2iILMrqa8ppNtbbtdw4XcHnwOKc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:11:55 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 21:11:55 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 3/6] media: uapi: Add a control for DW100 driver
Date:   Wed, 13 Jul 2022 23:11:21 +0200
Message-Id: <20220713211124.2677275-4-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
References: <20220713211124.2677275-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::35) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0741499-6413-48fe-9e5b-08da651450c1
X-MS-TrafficTypeDiagnostic: AM9PR04MB8874:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7RwkW5jpj1MDhq1NrOTjEX+E3PWHpjK2Kwr3VC5007y7Nx0sT6Vaz1FP6OvlIpJf5e4m581ZablJKTIVNyKQqA/P5aP9PppW+dDaJNPGFzMkbh5ri/g1CZJpC2lIeOmdXUW5wk+0v5DoSM2v067kOLdhsD9oGHZTTqgZshQjpYQMdD7J/iz/TsbtIPFp/84M8XO9M6xgh/p/r/uWnoYcYtC0ISI5Y4C8igkUDu5pHQr9i7hALGtV3EUdnVCieHZK70YAGvYnyWThsdtrxIYIeeCYjIpbCZwlXCshNp5yseyU5p6dvrNFRZspwBaHED1PGGMWdkxjtdCko/Beo9zOXkFohSv3JpIM89FdvvDml+TgI9VP8vl94GW8uMAZTQHim/Rxa7RI59jjZjVBuWhTvbvbOlwyB4W/gxgFYZQplpd7FK11S5Wg00wAggOBjmd6WjJXXArfad0iOlgFG+ERbywFoqhk2UzKqr7j88deJMudhTULmobkOdx2U++lArorZxl0olJrwedDUg/w9k6IaP9jd3pFf0miYurs2GuLbhFb1CpARVbbRHqoddTyTUuqhFpPLmQUEBRynPOU+xCrpUHczU+dRm+Tx5GRs5UYOfiHhxgNzPoedk9Kr7OKHx2MMb8P/gYh6NLASPf71NK/dul9M6HYQKdSEhohhktWUNmCWmEZTrekejqKQc79/vQBpzKWkKrpTVfzn2ZrTnKbwJBaSn/m5f228Ma6wNZq04JXvTuW/Gs0ngosjSwyEshmRgUMOZ6/UO/B3vmXz4CvwPp7LPgcYywwqxKcgUz7ft8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(41300700001)(8936002)(44832011)(7416002)(186003)(83380400001)(5660300002)(2906002)(6486002)(6666004)(966005)(38100700002)(4326008)(478600001)(316002)(52116002)(66556008)(66476007)(8676002)(6506007)(66946007)(2616005)(6512007)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4A1EEPzV784W7r798IBYQU8fFMop/CqtLDnvZI9mUksvAutEiKBHDRk5YP42?=
 =?us-ascii?Q?gnBqsmNDMla6esfxYoBjLKDQTLyReeUPwUubl1zgqms4yZx/MeWGxOlgBISg?=
 =?us-ascii?Q?Drm0gfD6oS11U1MgM+cY8fpBsk3Fo/x48ogUvUaFFa/YjXv7Mb4Odvee3T1f?=
 =?us-ascii?Q?tMyRRkdQeD3DRUGZ6i8xkNHESXhkjjUG/3Pv0kG1a63x2ZMKN7oWItLFU7u1?=
 =?us-ascii?Q?UOTejGXmXH3RZAG61b1tWlxITekOTGWYWzLzeiGspLT4RQYs3CCiqGCJgQ/u?=
 =?us-ascii?Q?FiJT2Zdfrhkfz1oT5Y6hIoPK63mYHpLwAkylIPtJgXwhHX8IsKs+6p5ktWOw?=
 =?us-ascii?Q?qxqjOXML0J/44EZ9pMmuqOI72oYqNMII9hTmMJYNrvjVIer/sBH918q93X+C?=
 =?us-ascii?Q?gghd8HGOKEOg7zX7Jj2WFCmFcThlugHlgJCKzZ7qFOKz6/6YSEM3f9Nv36dU?=
 =?us-ascii?Q?btP2Z0LG6nyMVmk2bcGlkJwoEAoT5l5xFLFkhttVfQMMa5nLxAc4povT60ch?=
 =?us-ascii?Q?RqY5xcYGVsaD6VaNIoBBmLfr6JtKtMEpdZKZu8EO6EYNXtm4a7SUrK98vReZ?=
 =?us-ascii?Q?Nd8KWzFp+SGG3Btm1TfKORlOTbx8pVn/eTG8D2Hz0AAAmuFFirn2yUWrLu7R?=
 =?us-ascii?Q?p+k8F+bf8Puzv6NJkO214wPW9GRS0gnRCvze+/Ztn5iO6GKyWUg9xYwPbnrd?=
 =?us-ascii?Q?Lx8pVb2VZOQ5lYNqYOz67UnFF3FdZfakYXY3Aw6L3YvVHExoMyqFOSbtEvPb?=
 =?us-ascii?Q?gkpGTEBNA3IFGOajEaGx/M2HUBX90wjvlDA4uhBP9pCkXpITTMwhmjZvEf7P?=
 =?us-ascii?Q?AVn4FIEkHkG5z6TuD/2faw0e3ur66Qkdj3pi2o74Op56HsaTX0wg9vbJSY36?=
 =?us-ascii?Q?yUaJn3Nav/+tjKg3bVfMJ477wPcf261Zycn6zJW1UAGg7+3HYqocUAP4sDyB?=
 =?us-ascii?Q?4QcVDWSK1cvUb7Zj8+l+doLYItUiiTxw8ltXrXkzMNoCJ4EXvUns76c0nw2/?=
 =?us-ascii?Q?zjZnD5ccKfaoLTOzogCNFzXMXGcvW2uti93ivGob/zj/yXoEzZF1mJYGnxJ8?=
 =?us-ascii?Q?0+M3SFr2DmN1zobFPyeFc4yK80yatCHEGs3JThU/mIzlXrAyA68w0KvASN8E?=
 =?us-ascii?Q?py1xp/rqrwiozGhE79r7LGELim/38iXDjRYiJxdDGmUWpMOjtW1pBxZ0jxBV?=
 =?us-ascii?Q?hkarsaz4TcEPuwDiBsSoT5qZyrXuoHu64MDWfCRws5W+P31D8HDxM52fLOdT?=
 =?us-ascii?Q?OAE2b8iUsl/fv/kyDYRDPT1Sw8yKvYFHFzrm9cyzivqwfNshalGr7VEuZja/?=
 =?us-ascii?Q?Q1trhvV3mK8Xj1OBgw9nt4sVIZjzFdj6rr3mAAPNss3NKZsnWMreN5Ugb5In?=
 =?us-ascii?Q?8GZ9mDm4SvDPtKJij7n0uVkTguip6ri2TTzSuuWoWifSfA2nSQ284otmjTbJ?=
 =?us-ascii?Q?qxFySoYca7OsPwfk3WdYmeb5WZ7wg/qmPrMGFiTTVYwHCwuTPDf/peIpUejA?=
 =?us-ascii?Q?7eZw/tHK0cXe+Ep1zgRducy7O3hXLKde1gpPxJjo+Ya5WdajVDpXlRYysRZu?=
 =?us-ascii?Q?wgi2OVIncN+bcO395HBXvv6dbQOfydxlm/QTo/IFy5PFX0SSXCDajLQ8RIIt?=
 =?us-ascii?Q?jyYiCjQtWaqgvLbpX1Eu7ph8RlUTjZxJxmh9vKidG/a0mJxmGIK0eC+0xV7L?=
 =?us-ascii?Q?fk3dKA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0741499-6413-48fe-9e5b-08da651450c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:11:55.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nn3mLrp+Qbfs8hi/E8rZLqIvYOkicnmEcwG9LlmwzNAAnD4zMwLOADpKqDS8wsJZfTuXHKr7fOKDAtoeLA4JwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

