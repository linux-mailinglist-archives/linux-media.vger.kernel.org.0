Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3963E585A0A
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbiG3KZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbiG3KZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:07 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE4417A83;
        Sat, 30 Jul 2022 03:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SewoZVbcer3hlHR0+oowYMGq7RvH9Sj3Ct3Sj17D4Y1jUb3TPkJpC5eS5hXb94aiOqdhB/gx37t/kydFEkG3wvF3z6xkHu1VUZ2Uklu5WM7wRWPGw0lBqD293zCglI9u+l7BjrtZ39H9KC70d1XTyN21GoutUBXfnuRtLxbV041dEP57C1iiTNNnMUplF5p4lO9qMik4kg5kecBFXoxvf77f/xp5l62cK3cB796iW/y7+9WoR6zmS6mPYOgZSSc92qJBG3ouSDoLHAtPlKNj/fGmnIV4GtUm1J1HK3VcFo0EFeWwJi76IzLKVkeEN7l+3zLwUZyrYw3au49TUVeVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3JN9o4QcbBTMt4mLQUCzo+2bIrsNzcVwdzFt4RFoLI=;
 b=d/k/Q7hGHitm02Hme6CVAqpjEyUOgddejh/VFuoEwvuQvgrXUDTe7AVA1BQdExNK4Nkft3BqeeA7axanlH+HeAjzIDSp7J3GkU273XTesK05nwZPnyg58GTk1++zpowOtjKALXXmXFK9Acb9oabNOTS5yQdUM+jMm6AxdIn5mL2+b8FCmzJ3U8FaKX0LcNdbiyhUJtJwb1myi49beUK4kCcjRucKbMbvio4OO/yOX6LxCpwgt+GKCf5tXA8fhGGEWN33gdD9iDVC26EBdYtBQuITDILUsfrCgLmX9dRrbgmB7HUOaGAblSGEhHfEUpevu6Z2x5hs2XN+bjELVdLqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3JN9o4QcbBTMt4mLQUCzo+2bIrsNzcVwdzFt4RFoLI=;
 b=ktgsxXuwYsneyIMClrHeCcrKaavCucgZmrwtLrLmRDrnayaYa8yrnDN1RnXJFkz3wzh3I4h6uF8Obi2pH2g8nVRRsFNycI8RcGYUy+xDGypBUCgnf+t+IlsAM33/lA3pURPd93tsUsa3bIUecbErUidOhlxLoFIkQF5sQaDtGIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:02 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:02 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 3/8] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Sat, 30 Jul 2022 12:24:08 +0200
Message-Id: <20220730102413.547698-4-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7a3ec279-a8e9-48cf-55e4-08da7215c30e
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyR5KuaAxkj8QxBjoFepPvpPo/57ywXu2rd65BqOty41dW2KRFuAnRrTzL191/1driNBqh5OKJgzdjwQmdRwfdNo7M1R/n7FxuQJzoJEXlKAab7VSRGino951t4pv0KcFrgSxTNTfc6wCF3PQmJ04HftrX8wXqVCKBpA377TMgBb/SInELWEWdwSiGje4eAJdu8VRKwgqxEQWXBsX2Jdw+JOsmqqMIMrj6awIw1hAGnFdYwQprkXIPkzAWyVdH4Ka/l0EI4FM3upKcniRnE5AHpHiOag/eTUFJPBh4x01VKIyLhHyN+ucjUM+jy7ceuYtJRpVh23KPk4wDJmggn4x+sEX5VbYX3KfViA6jGMhcroNdRLHJg7LH2pDkGdc1chE84FIaPt/XaItzMovKZXQn99d+ck7+djy4AZEzkYRbDY3q5p3NSoZFL1eiX4a2BbqLohDMBYe/hOgK+J5FQEMxfUmjHsmIpVrHHefpfHNdPSnjlra4n/+BQMjCMjvJJoTTiYhk43AajJhESpDoOuUzgCjojZU1xw5RwdsofeCXVMRaw3vTWvqS323zD/PBRXvWOmob4VgcK603rMcSdM8TVbsMlls54ktBrEAVW1m6W/DmtpnP2yBV6PcNxf3r+cUhotC5VN4C9lQlM+Y660kYti0jvGyyTJ/YsfmY+73ezsSCPtQKCOJ9ybi4T/3hL6g3dsuGfclPjCvXLqLRNG1yTFo7Zmoh7Y2+FAUoc1NRrVt81tEyJI/uekOPuo1+jq70J0xJvtX7Kh9ZAXqn3aZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(83380400001)(52116002)(66556008)(6506007)(38100700002)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(966005)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V/gYn5jNMi4djXAU8duQANOS7lyNIowGhFDaxUKj/hFKUfZOg5/zkQnJW063?=
 =?us-ascii?Q?OwPmkhtA7qV8vJg6+oyaTb4qmGOdtjYfbU+skxxwg6y/LGu7M2v6N/qKl3Gg?=
 =?us-ascii?Q?2BUr4Xo0WcXdcu4FbPfNh9gCDpI+jrPZr+mqRbiimr6xLA8LMfbcAvKxYrsG?=
 =?us-ascii?Q?EB75Jc5SlYfDl1U/+5nB5tWBbPX+ASgohPH1vOt5aQcNBZG+ZSGsBu9gKU9b?=
 =?us-ascii?Q?VLhkZoGlA9+k5p52RptNv+eRAchc4CgZAyDpF3TEY48nOT8PD/yDdHnvi0/q?=
 =?us-ascii?Q?KcDDFCv2i32W8+K1xjhvh85NtB7ypoMaYGFZpAYPDm9Vz0mv0a1tVuSGOTcE?=
 =?us-ascii?Q?5j8Jzw16sygUCBf+y7LzNTn/TBiJ4EiFyshpMHarh/qBM6zv21cycuVAJ4KG?=
 =?us-ascii?Q?VT07IIvWYKi1c/QtC4G/p8sPyvmyhmr2nMgwYeDrwywlStsJlcOttupvU7jT?=
 =?us-ascii?Q?AliDr8i6xch+TFlRCTZSfqpLVdccfKGWpVbPYsuBcMWF0x8JEqoIeYiE3TN2?=
 =?us-ascii?Q?cnxD2yYoq3ZbKe2UxHvyqtZv9mmnQZcIDE0qfZ7T2ifwuqyQvjhusKT8nNQS?=
 =?us-ascii?Q?N4lHXWe4Db8a88wDpjeMXu7/9nGtJe7u/yePpkuzBAZ5KiuXoqgiUTMTjBre?=
 =?us-ascii?Q?X87RkINuZtKJxr8D12Hq+UefVGJxVE0/bQshkoDU9BIr64JGluZThIUhL6pf?=
 =?us-ascii?Q?20Jm2vHJfSNm2oJDqs12y3g8H0UZTPE/PSSXYtSAAcQ8kub2B8nzV5p9YOAf?=
 =?us-ascii?Q?o8rF9D0bBVB54KWEhoQ7mdOfU4fFqVYQ7yeR8V8UHkZkmw5fsecF7vjD6ZS1?=
 =?us-ascii?Q?Cm5qLrTPuPZ47V2DL80Bwgb/XE5ilNFSUcWyMxigMnb3xov8zpRYl0APX0Na?=
 =?us-ascii?Q?FoOiZ2hjSoy3MIfdAbkjniV917oy55fFvFVQokcrsqrp517esOcZaPOrxRQV?=
 =?us-ascii?Q?0Clo4m8I1QAH0a8O0S3pcrBQdCe+wv6cwA2KLa0Ta50DcJ1ITUjqAlE4KxVx?=
 =?us-ascii?Q?2QgIWBgTwS3XxPegqF5YBwdyRZTpSL+uwLxBSPzy32yMt1m/r4OvOjQ/oMoM?=
 =?us-ascii?Q?w6Gcm28s1ABq0KuTSKrK+ORW43cBw7X+tB5qMNXa5ecE3IF0Qt6m+LqiL9ae?=
 =?us-ascii?Q?JcSQdwS/SZzVug1BGMeLS6mvmdQzM34HVPkDc1MUzgoCwmBQXXBb09Mn5k9o?=
 =?us-ascii?Q?6Uhamm+hXj+1PUjjbaR/mtH8NzLXmh8EeKp3+WGhuykafkFVRMUq0/SUd/S7?=
 =?us-ascii?Q?ejHqQk78PrywOQQoyd9yBPL/cHoYVbTdPvwxxfAi6668G3vI0m/hOIskWgHU?=
 =?us-ascii?Q?A/kHRT3dQFPpA4AHzqiypuAw517tUxblJM4DR3O/mzDfjDu19QnTrET3JffR?=
 =?us-ascii?Q?rF3lo84nyimdgxbdcqWABGg6mzyzLvCfeeulwQWJ6zjBDhaAac5jzcWnhd5N?=
 =?us-ascii?Q?lvbx/Pp1Epu+0jwPexC5Q74k0xc/Hddhgwg23QnMKEPexxGg2RcJIfepmXp6?=
 =?us-ascii?Q?iY5GZJg+50opMD6M+GaK/tAKdj1bIViOq4wMowNdiyH20h6Et/Ndd6Iq718o?=
 =?us-ascii?Q?Hx/z1biK3dDeymrb7GaZ8dn2s2cDNjKFG4zNvhmE3DVYDV2EYYzGMBpF0+Rd?=
 =?us-ascii?Q?j3FSJ7e9n8tP+WIy0hPfTaRfjNzilYGco80qkTFsby4PA6tW/EoOUJO+hq9D?=
 =?us-ascii?Q?K3/DGA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3ec279-a8e9-48cf-55e4-08da7215c30e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:01.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+rBZKCTHY19Ze2DECeGUxPXewqvvPXoavbW+Eo+6g9TPCOBlcpN1CNkUER6EM9PWacVfLoQaZ495yFnmslEtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
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
index 0000000000000..1ca6fa55f539e
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
index 12e3c512d7185..0c720ca1a27d2 100644
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
2.37.1

