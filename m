Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08CF04D206C
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349645AbiCHSuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349566AbiCHSuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:04 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4CC532DA;
        Tue,  8 Mar 2022 10:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkWfUrJjFRsEooWCt46T8IKqc0ft63Ai4XX3+JotvUe11yOOhgybXwP9Likw7c2AKWcF1Wxrq3xpzan2u7/ngavidlQM6yvXELCkv5J/MRM3wKYTbda1QXqNIxyVP09fgu0VsnsoCXxBmG4pQWKRe6M7qE5v1mwmK9VA60YbLqhznxR18rMRpS1sXmzl2Ceh4mBBZQuKM+E1aH6dMjjPDT6a44arp+LFGhqhgLk1Pfl7bi1q3xiHNfow+E/RpKH5eWVXbj5TZ5kSfiVGuT6YcjbWL/1DsmkR72AOj4vSw18WUscyY8j8LQlDwlnoeNhzOnmoBb30QTm69DPK+JQfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=W7sY2wuU7nAx63ufEKnH0BPNy80f5jvuqcaQddIli1cpPNnmZ/HVnNV9ZRen+DzorUc73MPHo/EcFalMkLTMBr6Jt1i1OUx6af0ja7YqrtE6gqXH3/URmtrdedovl1UqFdglYYNz42tdItbFhcdPGTCV39iwEqfS7i1mu1uxQLxQ3fEDS+FS7zcwJx2xyF6/n0GI6q5uKlCYWOtDRY3ds/d4IUcEBib2EW9jJJtR0xtkorT0W3cJSqImf9neeo6fgn0GqFwNS6O2NLGREAqF5NQ/+8Bmf095tEGXsxus5Jnk4PaLLRZBiMqUArOKYqLjnteqs8ii2zoF1qmjXNzjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=Ap9Ogj3EfXm4TXQKi+bsNNrFDb5VCRC04pLS8m7e7UnnpNoYdhtX9l1KegFTRKDYBdJ8exx8Qsv72BPwg90dCgBQu6P/o/WTp3Q/HiNFjXbAv608VHV3w5tSYzHOuYly7D5rKpl2sjaDjLCD8HSrX/4VpB8FJ+RPwOVyCY5TskQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:02 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:02 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Tue,  8 Mar 2022 19:48:21 +0100
Message-Id: <20220308184829.38242-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 715f90c2-be30-476a-12f8-08da01345079
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4311D3BB64851C26E71C9DFDBA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DbWWe/kBbnYyuTRrPs+c2A9qyGQkJI3+sR17q6g8QiofunoCe1kcXhcXIuqWnAK85Wdf8lKkB/eoESatF45LAlbQm542DO5pGbXlPgOy76uQG8g13AzizWUqMvsrp3B8FzL2AE/+FXpSGFkbmGUXl6YnCMy3hUCh8eVEuENuaexU1ZGmSpK87JYrn/OkBt77lYa4qd6x1jyISxgdDs9tcQ51v1KIfrXyDrFExeJeK84S3JUVnwwxtYyjdgDn9lXwXVOw0WcsrDkSa2lrL0kqkbaBUg2grip3RG3nbu45tNPdcLEM8nyKs/BRBghyLhOqT1KN1QPfw1VLNUASxJbtxJCii7Nl+dvbnW6HUVAOPFuqRPocoFS8CBds83zQ4aqsqPFsSyZSjCkOrcMNXv551j/FHVywGYO3C9W9fTeg7ZtLkSWMx1HxuujB5z6kIEzfOd5kEVHbGnvfbSG+0Q+oT/fCTJCsX59Y/KXUtzSN0Iy349FlXGTdJyZKRUwtjLfCiIXR0h6QplBGAk/PJ9EV16zCPB72xZ7sSsswm7MEnCQnuVsskuDst0nkrJfucB6CFBBjQj/jYyBP4utiQ6flvk6JdfPn7JceUI/gwUt9DPR99wEKLqhYEgbIhdN2SUgJJrq3sYOUnJvmlzu9yZxuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(83380400001)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2wQkzvODs8xi4C3VG90LghwIkHvBCO9yhaZ/PrsVc3iMlX60zUJ+6OLb1kXg?=
 =?us-ascii?Q?ktgtLGnFIggeNIJeR/UmxK4KLJmuNBqTDzOrIXkjfaOPcubkE8D/wVKbrKjj?=
 =?us-ascii?Q?zq7Gs35p5BixDZuQbbzTthUIJkO6g4fov7Q5+ANm3rwDQ1sL/sLt5LOUupek?=
 =?us-ascii?Q?W+kx7k5t8rCNvL3TAk/Mi4yCKEUIazIMKImiLa73vAfy27CAOfnGwIfq1nS+?=
 =?us-ascii?Q?0Fg/D5azygAOqDuuSiGXngLyAmQZz/JZjem5kFeMgR38aBXkrvEBDrARgZMa?=
 =?us-ascii?Q?uSohPpWjgc2ZW9tVxfA0h496LIXYsQnEC5oJdrQtYzSK3W4nT9+xLgNuGZNM?=
 =?us-ascii?Q?dgZVXJbayn1RGlviVbrihbPxQqU0n+7WePcaUi86dEpYCFwlLxiX7kjkkXEu?=
 =?us-ascii?Q?lJXC/Eg/CKoLFpFnMgitlrHuK9buJRTWBIEKBgW9+01aknomgO0ICs33bxPr?=
 =?us-ascii?Q?B6WMWGt0PtJhxbLRMwmqbdkd1yadRWdGYlKZuTJ/MKCcvwQJC0HVDM021rVA?=
 =?us-ascii?Q?S2vmF91oq/9IFWzOvtKFlJryYFhE7YPSV+HRUDwvLFfUjIDDHPpGfs++091c?=
 =?us-ascii?Q?PqKgDzfzF+OA3aMW3+bLeVywP1bcIfnRHj8XyFjex2P5XyEzHpOy+b2iTjBR?=
 =?us-ascii?Q?nmb3CbCFVc6UTR2P/AC7E6pCWNifSC/XHNc6+Gu6wgU+ps/l6xDveUSikC65?=
 =?us-ascii?Q?Jp0XiaZchGT/ZLZehoEF/fzgGJcdety8fu/SUSkAWxgYIVGrDy7revmdf6qR?=
 =?us-ascii?Q?MFRqVKxdP0MRWyn0k/vCZLDJyqhCgugMNPURWT5+CaJy172Fj5cG2CvCA+pH?=
 =?us-ascii?Q?jP97bQWplL1/oqdW93ipPuIySqqWahZODT0towT820YjXbBnGQYPwoj3uu3P?=
 =?us-ascii?Q?n/2HrqnA7ucK4E5YrcIMhsNMbFOC9N+5GyfWtiWo9LGVSeBLQyPlqgXb9Dbo?=
 =?us-ascii?Q?WUhk8fTg+fP+N1zGVqH1aB5BGNqQRjXMd0qMGFeUlegGm0smaz6IKY3Mt8WX?=
 =?us-ascii?Q?6L9zOdPECUIu6HItBs+KYQ2aXENYza8Mhn52qw4np0fTLJ2Smzi+NYE9hDbp?=
 =?us-ascii?Q?W/SItDGj/pHGG9Fz7anBmjvNH97mnNFlbNnslAxooJHrIlo6GIuo4f9IbKli?=
 =?us-ascii?Q?gtHGEMGc3a077lyfbhfWiNjJNu4HMGxqPMaYZpsR33gbuyUV1+vkwftYPV9u?=
 =?us-ascii?Q?E/XxaDeFIfETgMsZz8TYpED2mGTAJ5r0tU08EVuwKX53EaSevT5R9hMSYSer?=
 =?us-ascii?Q?mDMowcnOcibWFR3jVUo1UfHemIFJPQEO7QqblowOhKXHKT+JIuzbJmwgSEDJ?=
 =?us-ascii?Q?+P0Eg9TjZ3OsILXpZcNv/kS5nFblSP2a35WOy164wOUW+Bg1gr65d6LUA2zY?=
 =?us-ascii?Q?a4hYTNq29R3EzOssI2RCOBpZULAqDqySOh3aBo+1ZFYG7IVmsIM5LPiCDr0r?=
 =?us-ascii?Q?seclNGDxzf0r+gHg0KX81J2cLh1kc4CLrzWQLXV0501ZgpPuRW6GoZME6Wko?=
 =?us-ascii?Q?ytJBPy26JeJNst1HFbkToEg/LM1oDk2re6Vn5clFbihaVlzEbnkQs7BvxS03?=
 =?us-ascii?Q?zdHGHF6Zd3uRGGQUqIm/SeCUf3BiuRr2XyHYjZoYjwJkE7M7P38HCLKChcMj?=
 =?us-ascii?Q?4CiSCZtmjUrRnPTmt3fFlF8Y76RfiXsmMYVw8dzLoPTFJqmJrRlejj0ICw8X?=
 =?us-ascii?Q?DCiYhieqv1ezw+uoY8Wy4NEnuog=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715f90c2-be30-476a-12f8-08da01345079
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:02.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmtxw6CcroDFivZxsmJOimsZPXZDnAv2t2Mccf1+bYkuHU+x1eT0WPOORRbi8/t/pje3hYNW9FhLsvkt0o/aRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
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

