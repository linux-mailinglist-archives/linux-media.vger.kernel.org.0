Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECEB573E99
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 23:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237344AbiGMVL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 17:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237335AbiGMVL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 17:11:57 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC6033374;
        Wed, 13 Jul 2022 14:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIz21XCdbHeBSHnQEIqJFt53ba+xO1bXmFVSro9auwPMRmS1KVdkp25mY/Rq0bI1E5JuoxPBBdM6273qKkoQZrWyQAgJ8coM9YtcFsR2ZxhdK7m0ooalq5xaTV6CeLo8+4rAPa2QMwfNMR/y2IReymSxgjKAIxBPw8mUSoOGmC7/P9Xm5YtfW3p+BSosm9EROJxiqL0RB0CPJdtx17DmHHDbINHx1CAGr0287ZGuwBE+S8Zu5mtxy6KaCrWInDS96UTIp1pdtOINRDeVXiE2Et7uSsArPYOVjVuKJN4TZt+QMVXL5c9oDR8easYIgSz0PKYXv6FjUXD8AJlSabDnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qo/HmeunH1NHG1XXb0xWwHqLuUBAYsnJzAwWvlhyq0U=;
 b=mTn3bVsUOMw5D7X4Em5586TY1os8ORmgjhNmW6Fc1Uix4Cmh7aluaqBZKtLh02LXGsAWYtDECHQ+SHsOW4hinPDqAj0sYYoovbnqkhGr77klzK2phK/u+bHe2cVgjt1HY/V9q5Q3gd1iUtkpxaepSLCzqU+KuCO3DeKp3XXj28fGqasUkixB8Fh3BFx13c+Cc1aN8N5T6VDpS3mzb/hD7l4lpLg/8fQMGNbjv7sq3subOPC23QftE0w+ZtagNve7Vlwu4I8zY3NUVuatwsFVCFX2lMvp2Ff+mDqtvPjSBUYjbP0alRSg26As5HSf73LJuIocNnGeTPPgSxBwloIPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo/HmeunH1NHG1XXb0xWwHqLuUBAYsnJzAwWvlhyq0U=;
 b=Ic+IixFlYmLHS7sL1l8G95XcKId5wT4Q0vyHEdtgENZ7GQke0UDJsCAPMSi1BS8MWjGBGq/1rr3+AwEiyDX4JIjdXWJzu/4MsCuU9jo4yQFi4gphOB3yW9/gjOnCzvQ0rXT7IfrFygmnJqJiBatImTcZXKnHtdrnujeCDUTywk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 21:11:54 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Wed, 13 Jul 2022
 21:11:54 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 1/6] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Wed, 13 Jul 2022 23:11:19 +0200
Message-Id: <20220713211124.2677275-2-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fdf31417-4d31-4a99-044d-08da65145029
X-MS-TrafficTypeDiagnostic: AM9PR04MB8874:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4zCgc2YaFZGbrsc+ukQoLonU7gQ19enyUc7KZXSR4cAe1yFv1lrups0CFC1KYARDCmpESCpavlFHxqoMrQ1g2vDVwfSzQLNsTiHf4yMwZxdI+cbGkxsO2Crnfhc09X75K0v6Gl5q0sIfg9VdxWbjXWP4jnXUbop2/EAY2cfgqTi1wwoLbb8RDlqlN5z+jGlLTIR/1/tNVlSBmYnkEAKtaK52QCLkSox69RqqTjOL+PmPPrPyumTV7BE/d1f3IGJC1Yt3jA+nmDQ+sp/W1PuZ2ShklS9A79F1lJRVCFpr6JiKkSc96IhWOx6/ukQIo9fkD1HT6YS69mXzkKTe2+rYCeuJe599gb2ZC03hUq5bl1NeFPPLTKJqZyZgD5CzjV2Z/lrI5c1HkpKWos1KClG4YbFJUv5IvlRULzOl+XRWFJIkV2+iFpgjXilz32fM0JV7vS64JfO8zS20A1TeG3vBPQZBqZ98tR/qVK2SMmo8zCKhnZO099I55qdpVuVlR4egf79dMh78wKh5R0owMsY6IYIjuGlQZJEtYjh/niQjuV92I3KU1EaW2BZK3wKU6luOF4tVU3k6tVo5zlXVLq0UtTrUy8y4GpG5rhvXUNhGUzRNyh0fJsFx5hWpesqAiBDi0IJw2xP4/2MKcueSVFf3cnWLDzWCdTMcePZLiCJH4/jZEeVrzmVs4PWuA1Epn4tGIdR6lmp7MaM4Y9K3t2lFE7lOhHRdubbaStSlGeuGtBoV1OmhTordh2BngT8j5lrmpjKM5zpAYF6WbTt940dgMp4KWfPwQaNMpqqFkrIcUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(41300700001)(8936002)(44832011)(7416002)(186003)(83380400001)(5660300002)(2906002)(6486002)(6666004)(966005)(38100700002)(4326008)(478600001)(316002)(52116002)(66556008)(66476007)(8676002)(6506007)(66946007)(2616005)(6512007)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGnndqLLRy4yt90Yx77rtWK7MonxjP2C4/Usu5MH3gvSsBgejH6BjeMK3d9Z?=
 =?us-ascii?Q?XbnZ0h/LZOvC7Bu97wsnPfVhyVc9up2qYN6Yxkr8YCzpC54Vamf6ka7r3HKG?=
 =?us-ascii?Q?nrWKyauCF1pYiq9cO9Sz1b5CQE3sFO6RmueH0TvyLSfU/qpUHW4g2D+CUwMO?=
 =?us-ascii?Q?sBy3Sce3E7HueT81lUoVuGnYVSMumjUOJX3jV471ntrP/FbjCPflJjttknXZ?=
 =?us-ascii?Q?oJeCyp1qvho1UoAeLE4oc45ibl+yrvSja6tYuQPTFgsafaS8CSQZgAuSCttQ?=
 =?us-ascii?Q?UQ0if7cczQrLHkz2BMfYMZ/Ix+rWbcSpU6lVqbX3HFCefdf5MojNIuamfhss?=
 =?us-ascii?Q?rxFIMr5SKN9VXAtr9CHXjOAqhhy1qhRUuIKwOd9i2W1gesBRunqJWIkCPnZ9?=
 =?us-ascii?Q?zWAvHYK7T41OU13XD8gCjcyIIJs2l+9GtVgKpYojiRSXBzQcN9LUPHp4vT+Z?=
 =?us-ascii?Q?oJSE+AdohdagIgRZK7fW7MPuxllGw1RV999YBFhbLFyYu4okKjSebIKBgcLk?=
 =?us-ascii?Q?gN6w69WL3FOLbNraSCDCQNSVJtKUwiiN5+Q7wJeY9jPxfuCW5oeOg1+pLtgs?=
 =?us-ascii?Q?v5AWBBggprOk7H26+wt3DtYbx4VnxWhKuFx5rTPx2UIDhgZ6RPVv9vUMKS92?=
 =?us-ascii?Q?Wy67nRium5M51obxVAHRs8p9ITd+Etjukxr8bdOl9OB9HpwVCjddeDUqH89S?=
 =?us-ascii?Q?Z81KDBEm6JyQOouXLrY4tgrdT0Tk4vwayAtiM7O2HDR8Lhr6ewirzGeTpKYc?=
 =?us-ascii?Q?+cELxXvt+MAEEe82ItjO3xqHs5BTKm56MWs1TUZExy1DLt+VpOtnsdIShcli?=
 =?us-ascii?Q?j/QSafXymmQJ+4aplBtPVtbqCHZzveO9tQ7Ccl0Z62cdQ8j2CqrmQjnYYIbG?=
 =?us-ascii?Q?Y415Z8teYDJjlJ0UM+VO9MBVVl52onJVsBUeS6l7lVPFM2eb8DPzwaEzTmoF?=
 =?us-ascii?Q?5uKj5F+IpneF6ifK63bBzAnqFo242Rk5Vg9Hf2Qhy7GmGOb+g1CkaV+VYnTF?=
 =?us-ascii?Q?iSaFjD5NPB8DOGNQ8S8RD5skb1wXVWoRQC3YKffwMl5cki6gLuXLI0PcXSWo?=
 =?us-ascii?Q?hNUhEP5oS/gzfjAWKUTas8WCJ1KUcVru+jKfRENKK0MmSydZLja0tVexQeA9?=
 =?us-ascii?Q?DV1OIJyqO1rQvEteHIYgsQXIadmr7OiMxqQwpLkKt93B4PbqpWfx6Y/keoYZ?=
 =?us-ascii?Q?DYfKWyJh/BBoVtXZPA2bkoY7Mt72/lT7asfD2vEdb1cQuhw1C32ck3w/stJf?=
 =?us-ascii?Q?i91mLsQrR00McZEhmvprA26uCbcodU01+eHoC0k6Qrt7A/6klWDxZgzo0Xi0?=
 =?us-ascii?Q?rG39SSo3e8QumRX4FBK+6amQJN/VybIGxWCGUx2YEsZPToOXxpRP6YJtOZaP?=
 =?us-ascii?Q?ZjfIsuHt1GdWGFTTWPBxAxHTG3nztmP2P1IUAGZ3CNTTANz2ByQMKBInHNbM?=
 =?us-ascii?Q?+WvnWWVWUxaBplV9lU9PfZPdcExX1ZNKCUUN5MXhXZNZSsts7VqB1CQLNDIr?=
 =?us-ascii?Q?VevdmjUt48P4KbW/ZkkvLOxmZ2YdcbWP67tfpfNcde7qzVRRvEJZWguYFsuM?=
 =?us-ascii?Q?zH5XEMC0rBsn11klpTyerGgUgBqOelINm0yBRXhf1Pm28T2gOtMcZcLQXNFx?=
 =?us-ascii?Q?96bjZ8GitGH+gEy+dnqdjZ7DmV+zscPzb0aATcspln4SkcFaFqm6MkzURwp3?=
 =?us-ascii?Q?Se4IDg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf31417-4d31-4a99-044d-08da65145029
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 21:11:54.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuhU2Q7cMmSVLGFWRr0W0sTfnBoXHFI1L+4x/CUdQ9m292W1CZZCavTzkg5vghAUiCIQ8bUG74nsfCyaLlglbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874
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

