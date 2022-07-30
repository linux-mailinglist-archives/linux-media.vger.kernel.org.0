Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA52585B1A
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbiG3PtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234814AbiG3PtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:11 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630F115A3D;
        Sat, 30 Jul 2022 08:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L39TZiEHvbVgQ8Vao2iP5hKuvH4fke9Cj94U7cq1X9l7qLij8UWL2XYcuY5h1jPLpAN22wWtKD/it+hWooT3s52AeNmvzBygn/ESQdTC0e5vMumNuPcoxgnenwtD7zlopUCURVJvQYdQRvI1znXHrKnFpMZ2gpP87VYUQ2blUHC5Bup4tSjvTR0OwzZDJ+tyEaLD4km1U96QS7nw70HIxBR8niHG2sMob7zC1zHP3j0GtKqH2Vd+Aqqr+Ba8fvi8Wah+/gZcKb5CClFOMzvSsXLNFPX/Oxo2NifmQ4JHeI+YOxVIrccAdn87jWmukX8WNeM1nZ8pgtpBr67rqYKMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3JN9o4QcbBTMt4mLQUCzo+2bIrsNzcVwdzFt4RFoLI=;
 b=VDKFDKxkXVVb4Z7aHLZZhrEXLRSMgmkJIJLPqvxTpltqCN1TR+kPOjKlQDX8AEGgKRReDpIIa/1WtYU8XsU+Pm5m5E58TWbcY/ISQd//esl9/h10rvMduzWFQbKLDekwt6Bfc2p43BBHIwNvlma1B3ACGyrFvfH2M1DFhRLguLssCw7YYHmi/8xDc2Cx4HnQviuklBwU3pMyqpOTJdo5uxy6NCjYwrZjpHaf4q0dSF2HvG7DfBsaCQvAymd2bd5knqHU1IGkaqcQZzkwz0XIf1xfkzfkialtACWdGn3JPMA11GGbs+/jf6hP9n3IMyKkJqHPewds3AWDRJ7NFMIR5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3JN9o4QcbBTMt4mLQUCzo+2bIrsNzcVwdzFt4RFoLI=;
 b=CUZumkoOUoItCMGfOd3ge93FpnjGvza5MqGStoaCt7atr/knrOd8IOaJidNaor5Q0D3R2PYeJ57nt4vrmK/fVTTSewVAr7829Za1XzK/1txv0vzfm1LvbRvvOPFKtnAAxwIDL5pQj+c901PPOg4J2sgRrKGfxz/HZm1fJXM33Rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:04 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 3/8] media: Documentation: dw100: Add user documentation for the DW100 driver
Date:   Sat, 30 Jul 2022 17:48:38 +0200
Message-Id: <20220730154843.791378-4-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fbbb9258-e92b-449d-9b1d-08da72430766
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZK9CweoP68cMKZUzs0rj7EU66/r+hkEp5JuEWPVkK7XcWdUa+Z6dHHktSbt/4e+cYvNzvrHFgeAz1IGW87MZKv6R/XPz9njdl1jhqTx/6Vy0DGzGJqGmiGRvR0ulNajMxW6hC6oodDBngBpnZCJEoK4nDwemWkOD76fVgtvnicUiVBcMIheXFgi1OXQcJvpH95wq+TTPKlDXCeYV1fFwGs71t3BwXPQ4AMUWkkh4sN3GY+JtgePuvVqGs9r6t3nmJ8ZW3RVyLdPO5yn9N7FcJg8zXM1oETp69SVIa8WVU+tKOrNiyR45pNZVqerYsUIUcvxxRLrNMIeXXMnYLkwri7u4lXPff89hZvj08wadBt0M0h8vV0WyyqZGl/mUkW3q/smoAlFoDagJZeOt9wU/O6J9jbUe5DoUoiGSTuxNG++Q1x87HB2hebfSkI/fK8Ih5CXLsT3dqghKwh6U+A+x4w/kQDaxfuV7Qo/1pedGW7GkrPxN+arTFbVBNLZLG9fRHUCTOtLpKW1EXx2N4zztJBpdoExi0Hn9hj1vUJKysUFfXjCypBkACq2kyPPAKowYQMRmM9NSEkkvvHDWdj0pZfa17meXYNXXoBfQ+NxohYSkG+LLpvjE7QU2cemq0iHo5F63RSxF4BceyhehtyiIXBRRlUwT+O77xMAjYv0C3ftc7P77DnVieZiLvWQtHJU1XAM3Z+IEVsBrLiCy3O8tSmB9pkBW/O5Ncw9WA4acKROp2Fa4U2VhraPe9hujGl+NsuQmZlfWb+qRVumWwQYCmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(83380400001)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(966005)(8676002)(7416002)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tKjSMhuEktmDAWQt4W3thW5P3cM4Mtv0juWpojVh8xnCDQdlv7l0QDVo86H8?=
 =?us-ascii?Q?obuIzd0blCiZmYMruK4BcH+ftm6amrVdZlQdzeobSWAZyEkeChG9thdAvxAd?=
 =?us-ascii?Q?P4Zbym5fgpicwlPClFbQ1CZPzRztaiueZN0Zp5Py3PF6dV5F3UZb1OHnYUfh?=
 =?us-ascii?Q?/8Gamcl9g98hqblY97Kk2QOSO1msV6TqaXs8RRvBs4pHcWI2ANQhsoNotUJf?=
 =?us-ascii?Q?XnAJFUbcj4N77eWsAidz+AtO1p4Efkk5jMg9Wk5nOICaX7+9rnzeqCRR4ACr?=
 =?us-ascii?Q?hDLhT7CEC7OSbEgWMf9Jdtvb7b8Put5WhfextecEf+SQNA+gOgRngjxkUeRL?=
 =?us-ascii?Q?KvcwKB7bBAqWapKuMGbWLn/79nxMNXOT+sWbfPELZdM+/YaT9vwEuH46ghjG?=
 =?us-ascii?Q?u6j4+4tuWa87kwlCOx2gmuZ7E+anV4WFiyRbWCOTHSWr5KVFJpH1jyi4MyVy?=
 =?us-ascii?Q?rmd2SKBAPMMnGnWgR53j4DU2OWPM8KNqIemuvpsa0Puz5+FqpgSbM/dYICrL?=
 =?us-ascii?Q?Q21DNFQgNgtMrvQq3uqnZkwna034qdCXO6w6lv8Sdj6bfQlA8/4V/OGAcV3L?=
 =?us-ascii?Q?Nua0IDvZWYTMLedHduA+42WCoQZxkY006lLkuwz+8FffkWB/UQfnPSs/6yZd?=
 =?us-ascii?Q?0jUo3IbAQxP0tJa770seIAeijh5tLTmybcQKaYugwiIJxcnkSIPPkon+Y08E?=
 =?us-ascii?Q?OVPRpegCuIjtJIaLn/RMs8FGKgTgWIpcQD4aVtjwr2x9m4tq0KHz3q0MtbJf?=
 =?us-ascii?Q?VVDSVDrc2DsuHBW55JQ3mp9axTkKnggbsrSmUazDRvhWma66/s6Yj+rTClC8?=
 =?us-ascii?Q?ggeT1xLy5kW1j0nHaZZk5fQlvPJJwAIGLhfBgNKIHAyNK3ke9laIZIHsYaix?=
 =?us-ascii?Q?rHUEf87unWTsOE4KYP1qIXTOtirFfiLMTy9VDmPLxzty1Su7fIwqHGLRWSPu?=
 =?us-ascii?Q?56aN6d6i+NY8Eo7hn2Wfck/ZHN7BRDbOmk78/OYp1JUZRDxmvmuj7kXAM2Q0?=
 =?us-ascii?Q?ivVEEOq9NVuajpgYxkgHeleCcsBvLru/HGA5GgPfe5epu1CgsUvVh3yxnX6R?=
 =?us-ascii?Q?jyGAEqc+ldCWG9OtzYVYYbHJpoZQrTyax4X3LXub+MqatMqdpZH0HL8MrNKl?=
 =?us-ascii?Q?OT2sAxM1M99yDRNm53MlrSjbKM8rX1V8AbOt1rxU3wiZUkNYUBQ9dC+CY16i?=
 =?us-ascii?Q?Q6d/J2BiLbr6K53S42fThYEJKugw9udSMuev9W7iQP8b4JmBPs8+4DQDijDi?=
 =?us-ascii?Q?EBv9YTl964sd2JlfDlywYqy1g/qdCO6EF1h81k79qVRuvICUTi0EPDfUhhfA?=
 =?us-ascii?Q?LWWdspvaXnbXr9nU0QBcO6T5A6wkMH/e04AbK3BoQQ1LlY6t+KygB3zmbDTK?=
 =?us-ascii?Q?N1O5zKidCktUHV3QnuDxyp4GcN1wt5gVm5hEiX4TerM++OINbdrMyuJrAnTv?=
 =?us-ascii?Q?BeZnHumX1qZWC3hY4L+afgQWw9FrUUdk5xLUOxCzJHmonBOJ39aCBvrNpA/7?=
 =?us-ascii?Q?JLWjGxWyc66o5P+zIgMONEILoaNlEhLMdqSFIkrq8vouKaedbK5hPowJTyaj?=
 =?us-ascii?Q?kuvzoOhluUYYa1FzUC9c/7h3E71D22lzIoPbIcaf6O0nbfX9je1p/PAc8S+G?=
 =?us-ascii?Q?D4Rb5pxvhXQgv+r3eKAjeXwBO4jblhUO54r+fYi+vpO2xi8F9DcuW1NHejBE?=
 =?us-ascii?Q?bOKbpg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbb9258-e92b-449d-9b1d-08da72430766
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:03.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avaeWvCxU8fu/A/5O1ixaTwCOzvFvYOWGLERavqr4SF32A5j1v6nay/mVwIeZtgDaTvdEKjShkhEcQA+LFsD0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
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

