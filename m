Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DBC4D224A
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243858AbiCHUMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240501AbiCHUMF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:05 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC4C427D9;
        Tue,  8 Mar 2022 12:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy5WhtlKB54oVb3NZG97Jzy+WtR5Q41dfDSXU43hFmgl7WPrh9kqlQqjocwTfPLPsDavbV8ggrPc90ww4RnAJl8U1rS2R71j2ygcP+voobus4kGxDk+HskO9R/DcOLtB/yoi/vL3GDDTBKxloELdIVkqaodUZKtB7I9jFgLvUKgy6VUCblAoe+gTSnQgv4MY2UO2vFAoUkCNlx4CG4cj7YXafwajD0vMS4lJ5DHXEO/bfInRnrB+KS9YXrRxBSccUAiV9iVxR2AI+R+VbernqtgPf+9r2lm68Nq95C/pR9Sps2+WSGzVnNoEZDV4kooYFn72Qi2lMCrVatSOxQNc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=nF3rAgb5oZX9jVox8/0xiKZuqxCg6mxl4g8JY3CmL2ctehi1NecW2XJ3Dkmv2GT3ZXR+8JaYWNANcibxPQIjvr1iCt9FgWEJQIH9vVIKw5ccQFtHDOHO6M/coFS3HnRz6GmJR+/oKuvjZ0cl4jFkiRLGYAY5cUNkdfCTZZFHLPFyNQ8GEVcXCFBRICTlqrfDkMWbJZA2p7PZBCjy8GFar7TACLEtFgKTwIjNjo4JRvmRBfU0sT98xZnSA/1JyjAimnoHstxvlv23042qEwh0pl0+T57vUxv6brAxmBUbJZbe9WFPx4yH2TAgoBl6l/t5Zo4zaVZQlGuiFzC+nFYOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=MRv94akLtQyd51yverN6ZFiDz8oeCmdzUdm4h/sTWVIYBYtsARKZRd7aWKOpKkOLgGwz/Dygqf5V8clC40OwWR7KOD2SthAGZ4gzn8f+rnNrg7nO0NQt7vJETZFlhc8envpYwOP5GcoCXzDX2XwDENR+UaQ7vEv17vz9QqRp/EU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:04 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Tue,  8 Mar 2022 21:10:30 +0100
Message-Id: <20220308201038.48386-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f8::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d5b81dd-972d-477d-4ac2-08da013fc5c0
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB458817F9B98B3C5F7B0F05AFBA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oz7dcqnp0zH/Egmnoqx4nU9dTlU82+fV7AnuCU9pkrCRDcSADzlOPcUZYtQj6DNse+21BJhPCZXd0GrKoiI5SF8WS39JHU2R0UQ5Y1USeHDKJ9udvloNXwqHI8I28/3eANfNan1bo5uo+Sn3skLZAjg/1gPU9pjyqaRmjbjvuL/XNYMJk99nfuBpAds1dJDKWkvJbExfM2abGFVTWy8ka3Tw/vRsFp8adbdrIuH18PXFO4h2pbTCFZ5YHLutCKPmaCS3i4hY8gHVgm+dNSeAdbeLcH6200hE/8X34ns45PFF5qIASGLoPwqdho71SGO5uudrb7sqnhWvG6wYqMmfKJ8XdKRNovhaFnMKWhwVzyYDBd6qOtRFXTt3I2gbphj7u7DzCwIlAcMORLn9TMEp7XDCdMNzh8/MB9qTBlizMYhUjwaHkkFcwcepSJ4NDisMWCwsgoA9CiFHROwGUZciPM2+ZTBXccLDS/Zsa8h5WLxWwFbwAO2rJh05Wi4pYSpSWJD7tRLyNKcI/zbVvN8z9IzWSBqYzfJ8XymDimVhN9KhqdENH35NEwqWZdPscOSxgFa8j8uDbibBQCQ67riVczzy7IUMtzeo7VWnL+sfgWJN+W/tGmb4Fk4M3gUvP/t7Ltq8IcW24D1v5Y9ODC4sjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(1076003)(186003)(2616005)(86362001)(83380400001)(38100700002)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VirxSSwhvl17jyuRLyqhQ9nc4mFJ7QatKCtgstEOnJDS8Z9CYTmbtJbUXXq4?=
 =?us-ascii?Q?9S9P7+Rb1qJCgllQvi5ZpNovpHC6IxYJ/B9NFb5J79sCqN2zvDkNUfp/DB4I?=
 =?us-ascii?Q?YLR2QRvMcYRc3m7tK0sZz52ybp2IbQH06FswKkhf4O2zRRff+7IbFs9/TqmE?=
 =?us-ascii?Q?DSjtuNkOBx5czk/p1V6isFzOft5dzr+y1IxeLnd1tG1XBsp9BavJM9gAD9sU?=
 =?us-ascii?Q?E89G6rt7ASm2qth+rljYpnWuTSSVlc/zXyODcy97CzMADof5PfvotVS0BrIV?=
 =?us-ascii?Q?EXVirO9BR3IL5MZ6jo586DhVYkQsEfAS7PRE/P/FlUJtPsmMPvdrpKcLwvPu?=
 =?us-ascii?Q?hEuvkIg1Ka9h8Qk+MRqC4HTi4W0eyxdFQ8RO38Ubm2f8XHhaJG2shfX9Nobh?=
 =?us-ascii?Q?6xvziiewbay5pc+6eVfSIEq79yiB8Iw73au+GiiemL4LduWoxXpjnss4qio1?=
 =?us-ascii?Q?gcvqILs1Zdix2x5Lbu6srIPXzX7nmz+uCp0RNou3AvyeJECqIew8Zej6ffZg?=
 =?us-ascii?Q?aDtmcYB1p7UOHH5DNf6vS3hfOLRSLAP3eyX7WxCWvVpm+4nepBMmlDupIBds?=
 =?us-ascii?Q?LmCDFoOR5tZ9sq/cqnCb0MAgcqw5yhh+uD9lyWz8/pE7r3qeziR13Tr/3FCc?=
 =?us-ascii?Q?pm82Ii7915qwlCEDq9z8JEUh9Nh3aJpiLWyoAvB+7MPUVwkuHDbJQO4gKptf?=
 =?us-ascii?Q?O185ZgaqMvFk3ckEBQDiDfvqCTZGE6CgELTR6Iw8kJJgbQMtlfNugB8QthZ2?=
 =?us-ascii?Q?f7INyJXZwSkl/ZLWb9Hd6cnfinl9q2PoEQoTD9AMQ8+/TF0nsQ1r7oHtA0eW?=
 =?us-ascii?Q?YUGDXjsjHvCSTztGt6thjIjKtkbglXu4bcog4wW1aIYbYZz3gSc0+JQRb6Yt?=
 =?us-ascii?Q?uOBbDClvfu2d5dSh0tA3N2+SYPPtmopLdguew6NLrcERD3yzwUWVZKYZUikJ?=
 =?us-ascii?Q?ePl4wsbv0t3hvDk3fpCecFa7qTV1KiTpM/EtAZUWQIrFGf5hZNGISdjWFXRa?=
 =?us-ascii?Q?ed9sNM8DAwtNdkP/XFRwQ8e2S+YYu969S6SFrlkSdoFv01undCiMaqjScEsM?=
 =?us-ascii?Q?eyrSbJ7dmujDpTswAt9G1uZDyjAUp5iteNXexnp1qamt35K1ql+lrxpW0BW5?=
 =?us-ascii?Q?MAB+b5rCDNM9ME4JgAKfWPjRz+IfjNlB7YeDrGeB4RyIE8CV897nF7v7iUL5?=
 =?us-ascii?Q?gkw7mOgCjPJUecH00E2fI5BM2nbBWwyRhbx+rb/Xhl3oe35Ia9/ikT6q/3kh?=
 =?us-ascii?Q?e9cb4G/Pq1SDhs6K78xrpqKHN5d75Rj5wdquwnasZd3/Gl/O50WEf+gBLJVH?=
 =?us-ascii?Q?BhGCd+xRxR3eXgjg9Wj4QXOsZOHRoKdM7ZLO+V3bQS1DcjGpcjJDVCW2ddlP?=
 =?us-ascii?Q?EdV/jA2tW/yGxjuldsRKB/OByYlN8eXu1gEGcSdbMqXTYG3a6u0MnRzntTWf?=
 =?us-ascii?Q?BVaUHtMeUndHd1d9NkvHRzJlwwSL7U1UI9e4paelOmHw10pO7m98pA7QDGGK?=
 =?us-ascii?Q?eY6GTKUrPNdS8w42jjxqJ8j7m9Ubojr/MCr+urpdHugH1/Y/N2seTLThQQhw?=
 =?us-ascii?Q?sTHZ8P6NVCGiN0wQGqrztjQ5bDVDjTflkNcDTgs0ThhhUhgvpULuAUM58wK9?=
 =?us-ascii?Q?4M+a1adZJuJcmuAqWPxFBrm4joDiqm3IrJlQSpmri8lsslORRYYnkGXKYElG?=
 =?us-ascii?Q?OTSeD+woJbWKy/2v5A7L7Bq5RDg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5b81dd-972d-477d-4ac2-08da013fc5c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:04.1582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxxLNpaUs9OF9BQnLeMI7TeLx02eo8VP7E2vdmwCbv6PT7cpDP88J6Y7tOwQlm7FY+e4AK2wNa9J7xVWNEPBRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4588
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add a new flag that indicates that this control is a dynamically sized
array. Also document this flag.

Currently dynamically sized arrays are limited to one dimensional arrays,
but that might change in the future if there is a need for it.

The initial use-case of dynamic arrays are stateless codecs. A frame
can be divided in many slices, so you want to provide an array containing
slice information for each slice. Typically the number of slices is small,
but the standard allow for hundreds or thousands of slices. Dynamic arrays
are a good solution since sizing the array for the worst case would waste
substantial amounts of memory.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
 include/uapi/linux/videodev2.h                            | 1 +
 2 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 88f630252d98..a20dfa2a933b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -625,6 +625,14 @@ See also the examples in :ref:`control`.
 	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
 	streaming is in progress since most drivers do not support changing
 	the format in that case.
+    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
+      - 0x0800
+      - This control is a dynamically sized 1-dimensional array. It
+        behaves the same as a regular array, except that the number
+	of elements as reported by the ``elems`` field is between 1 and
+	``dims[0]``. So setting the control with a differently sized
+	array will change the ``elems`` field when the control is
+	queried afterwards.
 
 Return Value
 ============
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3768a0a80830..8df13defde75 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1886,6 +1886,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.35.1

