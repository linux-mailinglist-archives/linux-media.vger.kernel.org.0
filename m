Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9480E57632A
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbiGONx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 09:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbiGONx5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 09:53:57 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B211AF31;
        Fri, 15 Jul 2022 06:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAwx7y1dze17iZdppYZvoR/p0b8RM2eGQ+R+/E5pIPSIInI8tUQEunVDpO9Y8Qb/IzvrP6oqeDdxVwFLBBpfpKbdYAFqRYkWNfH5ELHxsBcy7RJgbOpM5oixzn5Nahr7WKFcFvH25FlFs53Aas52N+ydEgAemVXkso5f2vc1DOpyly06Zfkt5nhcsz2qwOm8CEqjPFlnhSzxKsys7U8u5h1Cf8Iwr2XzjLb/J2a6F/5PgFIUG4Uk1kGmrAeq3Jjs30vOvy8uBlWNplEUpiUTmjuqHD0NIxduDRiaW3NmPxYJtlSkIIIGo1PUQQ9UKqRmRrXM71990NFboYsOio3KZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo/HmeunH1NHG1XXb0xWwHqLuUBAYsnJzAwWvlhyq0U=;
 b=jenGvhcnOYi38ig/t6KsfnJg177R2+Hrd3OzULrkRRHkaYJcuL8NKx7YvEuGzOUxfF9UTrqWjev9z3oADXsspBCuKrFHz0t9x6lqzrxlzeFazrA3U/uetWRo4u8oEX0wlRdTzP6SMeHZbMrR9Y1AHXOsAQKoLnF3tEduFdfA3Mb22tmArErgAaBvTZzLmV9sIc8x9H2SQOfwtQzuY2GWb7VwpAIoZGq3K/tvi9sTPaJHL/nBhDMBuyZKnZZzJOrHsHe91NzNz90hX5Dowk7FN7MTcMdnDDoXSQizIYuSvmoc+HZEyimAmStebyKh06TWR6iyf7rLXnqrNPnY3umwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo/HmeunH1NHG1XXb0xWwHqLuUBAYsnJzAwWvlhyq0U=;
 b=C2eAXbzTWmTVgPoFFPbuXAD3lrsRv054avv3scFfy+QPp/TPuQHD3F4u1zlQjkA8SoMylBmIuO+h8v6RbN72gLTXUZYb8XV0Mo2Avnn0t7KVnUQ+V8nOztk9NcbtNN1Ch9wOs5D76CJM0rqa3SqfifFVdHiycAGA56BtKcjS0dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:53:48 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 13:53:48 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v8 1/6] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Fri, 15 Jul 2022 15:53:24 +0200
Message-Id: <20220715135329.975400-2-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5a0bd0cd-f13c-4198-6bc8-08da666970c0
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3F9IgbXWuWEc80QrUAt/UpcFJtIgn0ZWQHXn444tfwoPR2wuob+7FJdA/SV0cJnIWBeMmpNWft32oF18RKTa5oTycG0k7NUCJVNCF4g6HLg9F3FkU+gFwP2gUgDnP1n6QAJiNOmSlKjSofBPk66VbYHt0Wzq8t9dReu3EWySlBFFp+zvfs4OviyDtzTDxfApv9eF0qw1jgp+Xq6lJCBSeGTRHfywBEYPSaq3wojguO0Np+o6+zN0JOmtw+WOnAHyoL5o7emvDowKwnppfwartvkiHdjl6cCNPdghJYNQxv+hSU37BmEiB8p2+J8bq2Cbx1LG+n0OEI6fPaJFCSobGPh0MbzImVl5WQVw7ANiOkjRRn1lG6vp1glJKa4IvjrECmwn90GdOkMdzFaRvCC60R5eq9Mff5M5VAkuXZpGlNS2ux3qMUZmd2lqb6gk1LitMMa3QtiT0uQ6cCVhdLguGTWkyRhqnSmhQcHKsl6s3vyw58n5zOor7z3p5g2Lc3ObmP+bwINUC9dPOKG94C8vGLQP+4wF1G2lwznIS1CpMG/d73RwwkGPMex3iMNzJb/9u6+NyLDC6w3+g5hTQc2KeONX4bpKolZz7JD7BmfjhkDp6VwZrgDbJULA/AOVmbj/2qwnznLGsEOAPCIq6d+nNefpwhkpUclrUoYANQjaOZG8Z+3A2uhdiaP+pOo3wQuEvBhx8HSXdZ7ZYKBeA2jNedI8khoGwXjOJnyQzkRCRgMpu0S4a2slSXqXwBr2rReaJOkpgjb/YsaiTYrgiyGqpMmwZ1HkXHCRcBrDuAS6Pyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(52116002)(6486002)(86362001)(478600001)(966005)(6512007)(66556008)(66476007)(6666004)(5660300002)(41300700001)(38100700002)(66946007)(316002)(2616005)(1076003)(83380400001)(8676002)(2906002)(8936002)(44832011)(7416002)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HBV14PU0G/Rh6PV1MO1yozsZzL6bPdkW4ZDOPyA8mY+Bf9m7ADsPNcaQ/RKb?=
 =?us-ascii?Q?BEU6JY/HdtYLyZLHKUb5lNEzzuQCXB1sS/yAopO4q+As6H3RPK1v4bFFcIAC?=
 =?us-ascii?Q?KyXUeAf+tdO/xPBwsotnXDLmcSljcvpYQnOz7rXMsdXvLcGKsGlKVWCJsY11?=
 =?us-ascii?Q?6mQD/DjNrI654KfkJEcr6pEo2fRPnoReY/8s+MsrrMLPkCyMzcNAaKCcdaDv?=
 =?us-ascii?Q?irICVtyxUC19wV3fEag4N5O83Puf3iLz2kyMxJbMqAYGkDUkWkJk4QXsMWg8?=
 =?us-ascii?Q?dYgo6W1ScGhU2jP5ovvEycmvYBfQAyU/ae3SnX2x3vo+FzUdubWSPHgVIhtJ?=
 =?us-ascii?Q?MHLcB/Xv+a9z3Ilc+KCpbt+6Th4P0JM8hOAKrlX5xhDaW3jgRf8ua+j8ifAj?=
 =?us-ascii?Q?1K3bl/jbJzv/oKuWlrOSTOkTOqFdF4yBbwr8LrUcsD76PqH4XUpFkhpryUjY?=
 =?us-ascii?Q?DhG/j8XGX+FOwxoaDubv+EEHoY5x+HOVQ5mvPX1IQYiZ7ZTO2SqoroXb/xnc?=
 =?us-ascii?Q?3Gp5uVTSC0P+clwWvSx/ef/TC0fslKbGkoarAHKYmUYksze8u2+ueBlLtpAd?=
 =?us-ascii?Q?heVpqlzgIKIxB9x0xAas2BG3ZCLTSyofhTml6/EF5r9L8j0CEViii4tqnn16?=
 =?us-ascii?Q?qRRuP8PxoCe87mFwKpZ0AojicdVqczrvxb/WYnDIBwlHLviwl0OrEw9fUHg9?=
 =?us-ascii?Q?Ky1TVqEJR7+CRzGGFmBZy9DCjAawgigWGREIBBicIM4jOvSvIBTWTNIWlQZi?=
 =?us-ascii?Q?WDDA1IBxDwwBbstv0oN27I3+d95DWP4/h1aOZiCBOFOQLVZc/IlfG59p8uMz?=
 =?us-ascii?Q?4XmbY4brbc/vBPr8vXDbuYJiV8nlP+js12+HwUJq4PBy/YhQDIzQVtC58jP+?=
 =?us-ascii?Q?0qHypI2UaLs0P0OhWKHMAlgsF3xRMpTeJIMmjUoZTVIXG5jx0bo9v/qsrYKc?=
 =?us-ascii?Q?6oWcmGUOk0iUSYYMMe6F0O6yBA6KYiBIvIqqJSWA4GVnoGYczFQBR24G7Ri0?=
 =?us-ascii?Q?mr0UNYmo1z/Vdh2zzQ4HiwSw6JT4ijWT7hoMKi1cdUqn0EFpMz+I3AFSWuW+?=
 =?us-ascii?Q?YfVEMDZEKCDRdLfyapJ41FbqER8nyJuikX9d/2iL6qunUkVgyXxXnyrMJ53M?=
 =?us-ascii?Q?IsR9bOXEbUrLGarhwOaR10rlGdg4LisAYZsKWBm7S/ewV6XN3m+6z6gsFgwi?=
 =?us-ascii?Q?aAAf2hXJ6Yh9gvHZ1g444+jDjpFOPsG5aPxeYboSwp5q3JXpLy6gO9sr0b3U?=
 =?us-ascii?Q?v1VI0qOfgAxTFjPgo8JZn7BhbBsxSS5wzIZ+IJWomwr+BN8BTEV3/WzXnlui?=
 =?us-ascii?Q?f20hvIpgox6aj1sHNSgF6lLe29DPrmf74t9aU3jogi6V7h22gTNHmsezZLkg?=
 =?us-ascii?Q?yR+JM8TqkxQ2x4M2GrtDh6t1+xPQVab19KjXQURGietQrrijBkCT2zSqEBMK?=
 =?us-ascii?Q?QAsjkKVn4RBDeq658xlh9Sr9fVFZVdKffkOgv437DmXUkZ0kRhSLzp3PEbi0?=
 =?us-ascii?Q?3VFRPFHrn/AyMea6ykw/n/ldG7QYq/MMuw49YWwbVNtl3Oof2WpTwix1ndRv?=
 =?us-ascii?Q?hb175XE/jsGaVIgPwpUBYUriLz0BM+ySaQTCfW9SJzcVRfsk6nrFPl2SjOcV?=
 =?us-ascii?Q?xqT1wbRwBUZW+m63Ku2gyzhxw2JOmHxIbQAgWsYvW7MB8vMixzXWiWI8xU0t?=
 =?us-ascii?Q?mVbMlQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0bd0cd-f13c-4198-6bc8-08da666970c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:53:47.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwUjMoaKoyiVtLNLKr/J0NHS8QPsSujXFh7+slnW1QlUCDYLO8Dq0TL2+HsXydEpUEJznbfwE+CUZD6Hmvwrrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the DW100 driver.

while at it, replace spaces with tab on drivers list.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/dw100.rst     | 69 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  3 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
new file mode 100644
index 000000000000..1ca6fa55f539
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DW100 dewarp driver
+===================
+
+The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
+programmable geometrical transformation on the input image to correct distortion
+introduced by lenses.
+
+The transformation function is exposed by the hardware as a grid map with 16x16
+pixel macroblocks indexed using X, Y vertex coordinates.
+::
+
+                          Image width
+           <--------------------------------------->
+
+      ^    .-------.-------.-------.-------.-------.
+      |    | 16x16 |       |       |       |       |
+   I  |    | pixel |       |       |       |       |
+   m  |    | block |       |       |       |       |
+   a  |    .-------.-------.-------.-------.-------.
+   g  |    |       |       |       |       |       |
+   e  |    |       |       |       |       |       |
+      |    |       |       |       |       |       |
+   h  |    .-------.-------.-------.-------.-------.
+   e  |    |       |       |       |       |       |
+   i  |    |       |       |       |       |       |
+   g  |    |       |       |       |       |       |
+   h  |    .-------.-------.-------.-------.-------.
+   t  |    |       |       |       |       |       |
+      |    |       |       |       |       |       |
+      |    |       |       |       |       |       |
+      v    '-------'-------'-------'-------'-------'
+
+            Grid of Image Blocks for Dewarping Map
+
+
+Each x, y coordinate register uses 16 bits to record the coordinate address in
+an unsigned 12.4 fixed point format (UQ12.4).
+::
+
+    .----------------------.--------..----------------------.--------.
+    |         31~20        | 19~16  ||         15~4         |  3~0   |
+    |       (integer)      | (frac) ||       (integer)      | (frac) |
+    '----------------------'--------''----------------------'--------'
+    <-------------------------------><------------------------------->
+                Y coordinate                     X coordinate
+
+                           Remap Register Layout
+
+The dewarping map is set from applications using the
+V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control. The control contains
+an array of u32 values storing (x, y) destination coordinates for each
+vertex of the grid. The x coordinate is stored in the 16 LSBs and the y
+coordinate in the 16 MSBs.
+
+The number of elements in the array must match the image size:
+
+.. code-block:: C
+
+    elems = (DIV_ROUND_UP(width, 16) + 1) * (DIV_ROUND_UP(height, 16) + 1);
+
+If the control has not been set by the application, the driver uses an identity
+map.
+
+More details on the DW100 hardware operations can be found in
+*chapter 13.15 DeWarp* of IMX8MP_ reference manual.
+
+.. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 12e3c512d718..0c720ca1a27d 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,7 +33,8 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	ccs
 	cx2341x-uapi
-        hantro
+	dw100
+	hantro
 	imx-uapi
 	max2175
 	meye-uapi
-- 
2.36.1

