Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E1651816A
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbiECJoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbiECJoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:44:05 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB2338D8A;
        Tue,  3 May 2022 02:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSaJxgF8TvJjoE8jAQ5hRt6l1voSUARtUXeQy5ayaZCGH3j8inc5krlExx4mKC6v3BKWWPgdhR6phexxgRL8+Bdlp8yOS9p5z6g5KJULieGLbslnjE8QP9rs/lJIhgePoR7uigk+M8WM+Bo0e1cOolhFXTRxlcD9l1CgU0+TAt2ZILmb0tRt/Xt2rHJzhfyET5EnRaH+2UMQjR2RwtCt9GcdyxDLkUq0uJrmZZRPc6riOTCIK7n4gtRRr6qa8hyXtnmO+VwggVssefHVuEY+FIGDA7gl20DoP62aMc70XMEyDuAiFb2QsCSIBZKvuQE26kYlNARPx/iJP7Trl0BIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN20lmi/zq9wu+/za0ZulLi9Fsof+LXSmhkmZ46FCds=;
 b=XgvhZU/+oa3GDDMbx0MuVXJcNqQ7PrYdDFNhi3wf+qBU2H8dKgGTTi/se6WLhFO9zgFGCMhOjhrDfPT1gnbP57gwjQn+NlTcAnaa3ZDSozBHltxWGpkUCUCM8dRF4Q0FuoqagKxsIqqM3BFRATldrhwLx1jVdQ4UW2YUsy+9nk6E4uTH7o96OqSWe00+afqIY7FMoEAwggBcTqrnpcQGnw2box67xRrnjuv9OHpZeZ3wBlZ26b2pLgDXNCg5Hda3UrsLvx27/WOfSC14FG8zO39UqnuBBTHoikKhgrwx4IvA+tgYzaSaj3rkiXnpCWGWEd63ciaJS1K85+yEVapM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN20lmi/zq9wu+/za0ZulLi9Fsof+LXSmhkmZ46FCds=;
 b=H/+VDPuh+6NE462qJGQ4FnTDybE8vJ/8tbyNyrnPSnXhqbJg1ZBKeL/CECajPSnINz5LbTCJs8LaZJ8K5LnJodPLnwFcS3E2YaNkhpwedjNEzmiI3//IrEysMxD2t+jMV/eLFKQtLpZyhby0YU4OS/M2AVJGTnDDzEl6NWITSWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:39:49 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:49 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 4/9] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Tue,  3 May 2022 11:39:20 +0200
Message-Id: <20220503093925.876640-5-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f180247-987e-4fc9-1254-08da2ce8ddfb
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2559B37E4EAA04F031D98590BAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cU8JgjXaAtKawBUyyZ4gVgUWQgNVIBkavIlh+aYbzC1opApXEnHQ4JHZ5zMDbqGh+EJpsZgdR4gJIrupra53zeOctOKzCdxvPmoB1k564q88kv9otQfitX0lqhC9NHZVFffNmsy7kMwMAuBf8YXsZP1Pip6DBW5TqOi5IHqII1Fyepr0ed4xhiH26qZWRPnZfL40wWVVNVnX4MgBBCETL6ptbKGG9vhsfRVbkDMk7xNH4rWwQEZdl3wLEQE30HzIYtRVkOSre67gzg8hy4inVfrA6AiV2OHvnclsWrKocj8KvQ1XukPyMRaJQS1PaGYfXFhuQNPnEZktbW2fLhOhF8uyZjxgt2cX/P03sPTpHiOq2VFGJ6/dstmrAw7iK7tVcL4GQLPzUGMoGAoS0+ud0QzHmATLAVfiaz4ZfRcpb+HCdDin8O+ZxkQGOns8cZmFECHGB4qoyaADp5jf8XFbq6greyH6kkfe48ZukBFUSL/u3AHyzKRnQN5Q660/64Ru/ukhirOvy+jovrMevt+eRN30k0IKYFvrutq30yT+9ViL9vuCiqvc9djFn0lDEDsxNc4DBE6h3g4o4wDHdfGCd7RSUg+rKhOmPZBSEqjXqMQPDqkku0+gcn8+xDVxmWkLZOlrOItHOjLVI/hD0mGwlOBcc3SfQknXbX8WEv54wYni0KVBJsP0dLOgTuuNOySLaUkEz+NGFmQ0SlyIjoC+Ny2+4o2VRKQCVRvcO73xvq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(83380400001)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(5660300002)(966005)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdmoOEP4jTIr6SnBZqXnG4LPc8t6+hZhQk2BQ+BQm5NPXRKXZiQ2zJ4pxDLa?=
 =?us-ascii?Q?SaK9D2iy3XMXIrj2BWlbnsQAILhs5PYKs1RrLotIEFOYXLXzdEQekgGPL4rR?=
 =?us-ascii?Q?981qh9DhGTtRtkCGGN7PwsZSwcS3EsFjm9nyzYO98pfPWRggYEUgxd+SrCXe?=
 =?us-ascii?Q?mHOqorPPodSfy2xclYsbth6y65OtHHjHk503jgMGb3ZW5ab6RsvnuF7PfAib?=
 =?us-ascii?Q?OyTlcOYFQQ6DxGDBv2QiRlGG2fv31rdUpsg+w+VgTrIgvVugXT6+CuWpSU2+?=
 =?us-ascii?Q?6aucpM0vCd8ygUKwTTb+hXEdrOpK7j4bkDWoFsfUEjZJqcGHhDPcfNrIHJh8?=
 =?us-ascii?Q?HhfNqkewACu/2vMgserAbQRUupeqaksQ4G1fKX/eadeAHCc5AH74b1LAg6yE?=
 =?us-ascii?Q?0kTPAGAyU2f9HEbPAKo6o+ntRV/zjY/KMNd3WqK2xev8Fz40m5pvQLfw12oC?=
 =?us-ascii?Q?J4FbYnHoYGPMQm+jSHO8FYA9Kts0yiMfQfgpHh4WQ5st137G83DsrZR6qnWn?=
 =?us-ascii?Q?7Kk/cKNb5C6CNVXePpTPm+x+YpQtujffd2HO+0K8DquROLK4QoL0ByVR24wh?=
 =?us-ascii?Q?9ep53Jol7JgMLFEQ0ka1uR5hf3o82+5oKMWSC7EwakwATo3QL7JWv8HHmaSl?=
 =?us-ascii?Q?XaCtyddK3FvOsgcQSfetP5V5DzWi4LJZJPRfbW6JL80wIlkO/kaPg5W/hzCS?=
 =?us-ascii?Q?MbA/FNlZKfSBvylBXIaOsyROFnCjTZcI5BfK7YEs+b+agSoiK6L9Vm8hm9gi?=
 =?us-ascii?Q?tBXD32x6NjmUT2gJOGuDZSUXTtnIABG0dkrxgDtWNK10/KoinkERIJ3Xrqpc?=
 =?us-ascii?Q?Jq56MT8fFx6dM37PNkKsQiL+i+pEKHH+lZTTOyR9WbHvUDTFBd5nIEntGsVr?=
 =?us-ascii?Q?Oy0OtVjvN6MGmhMaLwr6MKyiB9lnQ8Bpdn+ELZ4ixpJ2k2FtAZC0dXm0CE+J?=
 =?us-ascii?Q?eMqDgVIuOjt/8Fh1fZwmuLorxextXy6lDPiQYJsmJcdZ5gIL/IgTiWaTIvSh?=
 =?us-ascii?Q?XB+Dq8YSarNQjaH2zclYXzujf1VWxuiFhfUQc0GoMhebQCXihqalExHjNEQ9?=
 =?us-ascii?Q?7ezqgX6vuLf6iTdU8GtngvN34G1/gKhiRxxg6Y2uF6YAjGgmXThpZi5jYG9i?=
 =?us-ascii?Q?x255p5pVvwxqOBmNzrSJjFKlXB4oKI6PrqDT1sXhxqLy53Qzo4t/a3LRr+Qj?=
 =?us-ascii?Q?esYQQXdP2G9dFBL8ZB/Bi0plomgMWS7EgX9XcdXV+q1T4XoxBETWm/pwqYpQ?=
 =?us-ascii?Q?nzYuNJdZ0tYu6Pm8Rh2mvamUvSdvkY1ajltc5MZYLuctrN4UhgBQPvFIKjzN?=
 =?us-ascii?Q?wwZytguG/hS3SQh8IGT4DuJqlALa6rzk3L6iTn7AFPvzcvEWiUbInG+AgsOm?=
 =?us-ascii?Q?BXQo7iJxTh0//vhw/sHPI18ss/r82Vq0iwN0MlgrAj1O1unX72owOUCW7hih?=
 =?us-ascii?Q?iKykWVL5Dttbpsj/LBJQx4PNSQm4CrAOFcrGo1ZrTC4FPTPedcEP/F7+K6O5?=
 =?us-ascii?Q?A5XxBhCQyLrOXlZMUvYZwaDiDUAftYi2gwq+MA890UyxBs2ZYC51lIiiLy31?=
 =?us-ascii?Q?i4Zjvd4jh7f0DzCDnKN3+2JxPsApm1ei1L+RRxVcPwLfXaWlYnsM24s3zcdG?=
 =?us-ascii?Q?3zfxNI1pQhZV/EEfvQBDNHOMHY6JSiN+8iaw8M4YJo+qQ/OjlokdMBlhJlFs?=
 =?us-ascii?Q?qpJRso7ZSECRXuWfJ5BJ3cmn+jIcJJck2RGGujC7KoiRG1EdbI1OIBrwqOYj?=
 =?us-ascii?Q?lJm3lyBZCH219W+x1j5jPnE8sDXx5UXDnKLEvTiOTlFtcdi+p+/8tuDs2Sks?=
X-MS-Exchange-AntiSpam-MessageData-1: Hv0f+llh+ZiTYDyqKsh1Sw5XZVatAwAzm1g=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f180247-987e-4fc9-1254-08da2ce8ddfb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:49.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMJwSlvkDSNBrUk2cNHbM0iTyDtmcCXLUpHpPMP2gnTE5eholrKsp8bhg0By6CUXNhjoZAaC6MryazlXS8RSDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add user documentation for the DW100 driver.

while at it, replace spaces with tab on drivers list.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 .../userspace-api/media/drivers/dw100.rst     | 90 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  3 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/userspace-api/media/drivers/dw100.rst

diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
new file mode 100644
index 000000000000..1e606459cf47
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/dw100.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DW100 dewarp driver
+===================
+
+The Vivante DW100 Dewarp Processor IP core found on i.MX8MP SoC applies a
+programmable geometrical transformation on input image to correct distortion
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
+The dewarping remap contains two interpolations: coordinate interpolation and
+pixel interpolation as shown in the figure below.
+::
+
+                           P1                 P2
+                        (x1, y1)           (x2, y2)
+                           .-----------------.
+                           |                 |
+                           |      P          |
+                           |   (x, y)        |
+                           |      *          |
+                           |                 |
+                           |                 |
+                           '-----------------'
+                           P3                P4
+                        (x3, y3)          (x4, y4)
+
+                          Remap with Coordinate
+                          and Pixel Interpolation
+
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
+If the control doesn't contain the correct number of elements, the driver uses
+an identity map.
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
2.35.1

