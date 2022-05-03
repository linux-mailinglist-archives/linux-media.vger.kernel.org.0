Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCDF7518162
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbiECJo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbiECJn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:43:56 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF62E3879C;
        Tue,  3 May 2022 02:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evi3M62+U90mYNduwhg8kgKojXKmPicskk/jAXtlyYCyvbmz3g2pJ5a2br9enDLQENkRmwifChH7qh1xyKMWNawP1GvoO1Kw7rawweqOdOJMp6AL1fQWQe+mpzIgOUO1WTYft8pIejXJlcqEl51blGh2k4crSFh7RMLM9i3oCtgYpbfS8GbMP3LBBJN+TsikoMZcZKydmo4UC7d30IdhgV0AuJSaZvriyZw+fODC7WprwDX5oen5T71MvmKV94MD2F1PPuKC7d7ndQiQBtQKaaxdE6YiI2V9DrN9vrNnBy4ToARF6keKcFTg2ET4zR5+X6/c9i0h+mKHtAMsvMEk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=Flsjw3VfUw9nOIBLneMqMIRBEisvcXA2OnwIRw1tck4KiFBaAF1i9BgukFmt2yExIGdmMSUanddDclcDRE00r7WXodXxRy6S+9c0j0DlHtK66iyU1eieMZ8arFeqt3YR1VWhpNOMSic3GMAVVs5Xnq56wrLtasJ1I10RvfukWX3miQWo5PpeBwgjA+oMLN7KMXJy1ji7ojj9NIWxiUCGE+kK+/kTNoSIWD+v2uROwa2WvGxZsgA7BW3WRP9cJiCh/Fi5i1mG0U6xxFQHvTtozVL4l+Oulv3YuAbuLhlyxscEoC69i86tOLyC/N7AUPol9fweVerwdzLv5wPs3lrtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=CsuPJXRmlnBhef7qTEO74VeWLOn+kujYPH0ZwIE07CwX94yjMzp4EY4Wm226/FzHDhR/pePtRSDDyuhf3KA6cSCjSYRI34AXLIQTKhI3iBtHqJ4dIQYetobZQarDPG2WxxzQ9z2fgRoTcI99ap/REGGzs9x3SkDH2KvG9m6Y6aA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:39:47 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:47 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Tue,  3 May 2022 11:39:17 +0200
Message-Id: <20220503093925.876640-2-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 861b00e7-3851-4fa6-f2a2-08da2ce8dc54
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB255973288A1CF4F3EE0E7BA5BAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mYq3405c88LzNI9V1LOerM6Vya1mx2UFrJgmTKSL17MuYW9vJ8/AX1qEVBlQ8e3IVvW/isG4fVE4HeDw48f5q7AgeCaVoGjyKr0SLvT30/blbYK9+0KX+5XDNHWwH7Q811wgnkETSUY4ZQpCpCTeLJAKxnCkfEeRzbLs7gJP9cGbK6XAnOkXqKxZ1ys16lPm5aigbu4ShPqxX5EyCde1FVJoPvqrLPZrX6+ZraYBaSkUzxOzzSuzViL3Cgf7Rdc+oYxiYlgRuCdvMi5vABw7NUfFWVQjQQH2JNKXmjB0rocLDHxbRaX0z25IDh2CpSPElWedFCsbev8KhOU2+LA4UBZgmjoAaBcatlcVhrFnrS6QbyUx84nv69rGZ4dlXaD6Li1a783Zta4UA4fcXWlHpRgQtWu1MWkdmQtVVYV1cncWuOAnGUY3Y7q/Z3pjADFIn3Fc+RNU4vHsPO/ssyGziCuFU0owq/gvLbHCBNN/2iZQ1kknpzZkf/oY8AayVEW/vxTFAvrPTrXFj95HSIbLl+W68bevVHGlZJRBpycimIgSHcZCLb9hjGlquCYXk9bZyoEME0i7GAKXLA4u05XInN/F2m/TwZleXZf66SnH/0/IbeJCbLBJc94KPq71coWvkcO+o6uM5ULlBESI8oDKLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(83380400001)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(5660300002)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qV/8/goVC1Pm4dflraUw5vVYLtspqCneJW+ApmSxfXTf3qF15Tt3tQI8jANa?=
 =?us-ascii?Q?fHFobvIbwHvhoYjvZHn/Xn9le5SlRrn2UJy25OeUeq/t/El3aTO3+Ml8fIGd?=
 =?us-ascii?Q?ojRKuv7/4f9xNiEWuE/qlAJbHQTVKOnInqL52PbUikmr7lTmKqKqigHHPnex?=
 =?us-ascii?Q?6hrfqIJLr853TB4P/6VFOgT4vYvA2MWFdrYquKMR2Zn+gw8f45vsuI5P+TJ9?=
 =?us-ascii?Q?8fU7T8Jty8NjDO8k6XW3WETalsHeysOZWl8wujyTX9dxj8S+BMdwtBOus9TS?=
 =?us-ascii?Q?SR+nMMTKONXDgkUEsTlCYO+AxSk/QAYKub881LLytlxquuXAx0Sxe3mDM41U?=
 =?us-ascii?Q?xg2UKvqs4VWXSRXgHHwtnYg7ir/cV9mISwcyPKKUS3Hogo/u/fYjJiI6/MpJ?=
 =?us-ascii?Q?RyWmTPlOxdBSw1nPHGNdHzilWmP2VjBBV7fkfEuR6YOsAvobW/8RCZy+CgLn?=
 =?us-ascii?Q?9GQp7S5btUHk4NbQvZkl/ZX+QCOxWffR67G24B+rbBYBHzmW4GVUTPNKrfzO?=
 =?us-ascii?Q?Am8XwFOoG6Cah5Dl8wX/9eEU1WItPA6ze6+KNTXiBECG52K91GuD9M/5J9Ak?=
 =?us-ascii?Q?DQjmcdYZgm7JwQaBNWxM8oPdCuPvXtGT2mLWocQgADj2Sw82WzC6aIoHtOiT?=
 =?us-ascii?Q?e18MQBB9TSFGSehCIzzg550hYmGxLAM0aoSan79Lag8UJnyXj8ZAk6rGGBg0?=
 =?us-ascii?Q?P3wDBJ1NzTzYP85aEbE6MXZ6C7sk/iAC1VVA0f2nBL+Jk8RQt0ngt3l4uLnC?=
 =?us-ascii?Q?EVgbBL+pL25/JVt8v/23tP2c0Nzix/aJUYvlyAxFKXLggx7k0up2RVhw7Mp/?=
 =?us-ascii?Q?n1djAtWNzlVIXf+7ieim7nGe6+h32AdcFclrWIYe2jfvHs3yz+BbBV8j/b3R?=
 =?us-ascii?Q?ObVm3Da0bH+pbO/TbQLFh3u4CH5cGf2UjTgo54JPkdWvA/JLyoii0SmfH0W7?=
 =?us-ascii?Q?XdQJNnZ6AGlqzRQcTXKGOqh1R0zwPDxV7/W34CM5gd5Fxsspf8tDtUTkakQQ?=
 =?us-ascii?Q?wmu+xaSY73eaPXFe3GkflyYrgpNbb4y83ga7TfNxqFHnrseocmt+AurV3t5A?=
 =?us-ascii?Q?2rmzNnwKkAqyn+QVk0KhlpWWhE81e5QjH7wLQPKKemmqd94cgAxL7ywKFfT4?=
 =?us-ascii?Q?bn8hiQrcCiT2wlVaD0yclPFH0EzrsXrMpH3syQZT1QHPgb3PQGbG9JYrEYuS?=
 =?us-ascii?Q?wKGzmPB0z2c+MuBrcAxGgOguwhZmY2vwuWJPx2UmVdogdq22Zug0QN0vUyDl?=
 =?us-ascii?Q?BpaRbFsA5YKrOwACq7IMOiWRsn6hffEql6IWrYbTbU9XmlxlGPSZT1yrqi64?=
 =?us-ascii?Q?YR10lSIGODxNFQiErdz2redKF41WdbGqmmms69IhwB2nOYDE8zS5EJdZmTrb?=
 =?us-ascii?Q?/Yms7UmARjDymow8tRHPTCDt9Q/a8XTaVgI6goRCyPNVXFyWFXblW0auTIVs?=
 =?us-ascii?Q?3Hlef/JjO1X3KcSC9j2wSm6DwMvpgQSlb6eCP8BwosmQ3mb7Ui20qbyH6A/S?=
 =?us-ascii?Q?jWWIE/gbpkEN/ZnUfoyzzgHK66aM5D+niTHSlj1QFbsXgAWOJnF+iB9VEPJ+?=
 =?us-ascii?Q?HtLiobwjYq94aBO7teSWBmKCxSyslzNiE8CeW9L9eBeqHi2+Ojgdcz3V6GoY?=
 =?us-ascii?Q?QELaGamfSkN/15k6p3kEpQbRlVDbFq1jsJB2//mJ2GKYRJmunqrXBFRKaW/b?=
 =?us-ascii?Q?ZVAMLoxTu9n710H+fxkIuoXkXQvd3d0b+CeurMihRdVFvczKWr1VJYXpcSsY?=
 =?us-ascii?Q?0F9ce2fkgRVNaoivP6f3dC6toK8ifrEAJYadlF0iC9I0p9X4asoSO2Md8+BA?=
X-MS-Exchange-AntiSpam-MessageData-1: Nb5GDFqrUNyjd5MxNolltv+4bB+IqSyPA5Q=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b00e7-3851-4fa6-f2a2-08da2ce8dc54
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:47.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyTCDE2dVGv4Ije2bDuHM6C/3GwyDt9OJA1LZfKneccAunZVEh3KVvqtUYDmgQmMlnmXlf1w8bnOcb/iJaVW2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
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

