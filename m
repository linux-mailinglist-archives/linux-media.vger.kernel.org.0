Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21F7557DDA
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbiFWOck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbiFWOci (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:38 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0816E457A8;
        Thu, 23 Jun 2022 07:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXXZZ4L3nnknqm7qq7itRw1D1V6zSAr1eC07LY0vboupk0yMqU4WeTH1Lpreew3OSJThYycCfpqVcylOA0ZhmXleXyRAazlCP3AQR7XpzithKRajuPoTk6DcXCmg7BxLLMEk1PMnAdNoImJq1Cz3dYZhq8iAtcplcijj0GpJftjJ/MOtlKlXSb6E/Bmm3Ch1PJDeht8EhGwqPrpENevomeKBCL9qGwNx0ykHND2MmIe533eCsKnWY2LXqV/JQI9aVOvd1PMaSU8isa9Urs5tQkEJj+9Ig4LUsvAZ3FrOkxs/IZSRkJVyYwDUYXCPlMYkmaTnGPXLkCnOrICQy6XV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eURltwAV4tNodGbg1ojZs9s+OEBwtGLfriuLHC1afSc=;
 b=ZuGTne2paSvd/EtlqW2o8/TZJggEa4Go+psFEy0ZoTm8ZK2pgQi4cIY0UNAFayQrUuLBSb+LxiLlubOTjoygkxJNxzuefWKtLOiXbcYVpr5ksUcdCfljcmfJD4lc9oScV4BRcml4q5K7Rf/7eJFisBc27y5SUpvmyCiSK5vcnm6LAvSovgzlJBfhnqmQBd/C+91ZYN3zHZPN0zSA6S9u2OvPK6l75h8HjRkXTGMJltjlPudh2YCYC+9AGv6jCk7Hxu5xnS3pilXqYpDr/oqKFkfv6UMuZVpp5L/j+BYuL1gVQvtU8BVXAg9F3CYxQcqq4GNFYhPrR7gak6y6MxaygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eURltwAV4tNodGbg1ojZs9s+OEBwtGLfriuLHC1afSc=;
 b=fBucCHlmJOn2E2TlHrQOEQNhFgUFm02Xc6PJgx3ksKFSb1NW5CZRdgEvNLEOQ5AjnlMYwVlgBRZewDIzLQArFu/mkZO1VpJUsWJsh7a3QPYnKddUX+lyU3LohdyfZEGL0YD9TJ7Q5Th1GAVDh1ytODZS3G2QN7BgAYfEeshAGjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:32 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:31 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 01/14] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Thu, 23 Jun 2022 16:31:02 +0200
Message-Id: <20220623143115.3185297-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50bc2ca6-5d0a-4080-984c-08da552534bf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22886F6058708F23C2466917BAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I3BQO6PQEB5k7MWt0v6x0glSWVfGVHW1uqUHMxo7ORuwCp98Q5hAG954cnH7ACFMSsLefAkWK4RA0HDSnfd9HW4CvwWV09BVD47s/aakAMwrg8UpYcIDXB8vTWASeEDjj5CaFk3nCZpSNm+Xk7oJ7vFuMLMQmmeOJ8iyVRvM3hTZBR4hh7AJgi4YvT0IzRldvXUg/D7HqSpO1bQap+AKcJqpWHrjdFXbgazBi8XiJJps07bsVR+4fSVib45ttWicV6Lu4kG6i1y2fRNLaFpgqGZn23rbMdGPnG+IHtMuP2ug5AtOM8VzIJjai08MBpY9HGnVBSThxdYDenXa51teYTEW5wawS0hKmZuxD5cQCTjukWpD4oOgtC3kuV74NPtRjAH0pa+lNVMYjrTmTa4wYDOeknCSrQ/qmj2/viTCUsnk1BqmVvpwb+gAhOdzRDPWuhDchb1pjTxEC/1kd72qibWrKrBLoQPg8BBJHn6n9P+2AKwn/d6GQcg6ksMqKoeiK33To7oYr+uwDlQVApRIQB/QuJH6q6j3F1/vyqCuhq+t8hBpfLqjTBzuHbgIMTO7psr7bf+ahXKBPVtuPbzwIYqil2lYHXov/pUpIF0gnPSgbPL7n3OG6KI2lMWiFk5C+05G2xa7s4CFRWCbLLWUTHB7tNA2UaTpv1/TRNCmrn/Ws2YZTfXjKlbW3jIX9I5OMGsHemTYY4DIbkWyq5CiTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y4Qkw8Y7fBzr4nwteS3ta+yTo2qs3cd/yApj8Nlb18mYNIQikhqbh+0wrUbI?=
 =?us-ascii?Q?9Z0PFfyOIjrUGTUPwEt37YDrVyM7T/kSzzbqpCRStnfDe0aq3bOrhX6BlrCa?=
 =?us-ascii?Q?vf5njdTHQN4mnhSc9XOsKoj7iGMbz6j7H9t4JmTBBchPhZB0v/9XZ8A9gXMH?=
 =?us-ascii?Q?lue5L13B6gci9UcYfwyAU2ctk7CJdQSWPcpXleBbKtCqy706GEu+YqZFS9vz?=
 =?us-ascii?Q?VBcibp/2JDKoJZf3+K6pzieHfPy78emEp8KO17c2bGCPl5tVeMukuUgnTWZw?=
 =?us-ascii?Q?6ebkQ20/0u/aCsa96WxBUa4CCsOsFSwKO30N+Di/afRHAspYsO9QCq3jevW1?=
 =?us-ascii?Q?tuFuDZDiLWlo5iOGzbNNVQ10MBowZIXa+8sWtqQ3qdWg/hHjJxHNa/iPuqvn?=
 =?us-ascii?Q?GZ+RJNj+fEguyqTXzqg4a54ISiNj2DTVizjoAwIPtjpiSUbBhbkYfeCi8gcW?=
 =?us-ascii?Q?7Hg02djMt7TFK1MCfJBPdobPSuJg7whcqJr+JFAH8GBadaNkdVgLAbSAAxvE?=
 =?us-ascii?Q?zCRbaSerybtYf2q8pEwVc9+4vr7XI6S0ZGIeZmzYTDRjSEK1nXZLSXgZN2ku?=
 =?us-ascii?Q?JF1cwKIrMkTAmCJM7FmhHD9yqCBW7sP7/RDejnVlV/C9ZgrwWtAU3tjOa31v?=
 =?us-ascii?Q?e3oTob6tDDGzmRJ/wOcaq32+3PAm7auZ8YqTVPmGOeVaLcxyEiZ/Mf/OQhx4?=
 =?us-ascii?Q?ePKEE+VVD0Lcc0fDnoeetrHnUv7TGAW76z7GFoU2sVtsayNkd+PCi03jNJOD?=
 =?us-ascii?Q?tOzxU3qbMmDl6rZOoi1DLVml9HzFl/aSOa/5TxTesIyuIpHwqahyte6Oh9VS?=
 =?us-ascii?Q?XnYhm/g857USllWfvskpeMPRR6/s7iWYlk6et0WcTW4Yphr9AcnBQhGaOQcJ?=
 =?us-ascii?Q?ltc2PGBJ0iloNwmeOiSL46oWkzGkji+SfN/vFMdnc+OGAmP0Zzlrg3w4qP6u?=
 =?us-ascii?Q?XVWvtu+CUnRz3c2+K07iBTSlJkAIehapKQOzMY2QpVV/B614Ebfov0Kr3iJR?=
 =?us-ascii?Q?IklwkPQyQi3WLhTZNOYRurkmUA+ZPpSDPm6tZhunLpCpWtua35BuoUtkwRLG?=
 =?us-ascii?Q?UmtqZUtOvEHBj6yWRsjbrOWTpZD0wfcGhgacmq85jQ3c0G9xtigFNpcDam3R?=
 =?us-ascii?Q?OssSWeorJ/YLmlfxsWbf97UyXDnUxbDOfob/zlg8IbKPcXUpM38K3j97zb4T?=
 =?us-ascii?Q?ptn0M9C2DaOC4M7jKTQWTk8TtuDIQWg+Kj7ENMQlJvg6YEzhXYaNidIV+X2w?=
 =?us-ascii?Q?iRrHv6naboMEITBP8s9IThdCfs+tOggKSo/LdazR7pSC9w1PjCc+87NKpupb?=
 =?us-ascii?Q?OnrtUZlGed+l57Hc0Hf/ZGKiyg1O1GxpJxlG6bFV5n/wKsbsDQOU+qizN0z0?=
 =?us-ascii?Q?/DPeib99Ec8ft8KmKiI1Cwxw/zZmHzwUUIuiSg0CX3Aghq/lztLk1yFNrE6G?=
 =?us-ascii?Q?ijznHUtoIqXTiv7kBVDgHmGYPRN+uPl1cYuRpmG6ywbOsQXrhbrAwo+JvORU?=
 =?us-ascii?Q?/+JY09ZYNkCeENc/nw96aSJi6+PWS0BBrZsRi5SoFQZhsN00F9LzDJK1uMin?=
 =?us-ascii?Q?la4PWaoH+zhJlyvG0u1oXjOz50X7WzbWU7k7uZEzxSCUxKp07QxYOtOGsYES?=
 =?us-ascii?Q?WFiZMxuiz6KNYxmCcnKJYBtHB3+7tEZFEpuDYFKn2afHjItmxoQzLtshUHuL?=
 =?us-ascii?Q?OPxtDX/UAi7rwDyJfb8OyOCRi2+Iy002g6YqRL9suZDjMVV6s0SM8bMtdxmi?=
 =?us-ascii?Q?2eNZWNuIQSLubMc6nHdgVTqNiIoPirz6dNpdchp3TzgycC/OJLLkttgb52al?=
X-MS-Exchange-AntiSpam-MessageData-1: uOxpGIesddbX9IsCghUihEoU7cuAwtvthD4=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bc2ca6-5d0a-4080-984c-08da552534bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:31.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsaispBxIdTNw5JImvEFimsbc4KCFPQIPpna2KOdZdFi//0EkuA8KWQIVkymMJRfHBfC63UDv+eqtUAY4b4p+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
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
index 343b95107fce..5c45ca18fac9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1889,6 +1889,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.36.1

