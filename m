Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290674E9910
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243693AbiC1OPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241924AbiC1OPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:43 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAD99FFB;
        Mon, 28 Mar 2022 07:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJrMhXfbly3YR9PFanvloVCyPyjJADg6RZp7419HBizFWbXFPPK5uVGXyP0ir9+n6VgKTXx+LNTkql7Suxj0qBKlGRDF6SbVTjt1zCg1JvupRMASJLaXV5srQRNbRDpzptPZcN+22jhVf3mXeCeAYVzAGij5UF/8AzvzR86yO8ZMnPqJwyxqKEUXDNXDjG7Xic7v7F2RiB/NPxsWOSk23tHGgF20+MIOEyofcKxnZDHiNMXWlP3sT6iUGUADOJZ0eyfXMlTfza7DJn85RqlXQhEYy4jT8Wxlup552Ui2ijpxBu6TfHQ1Vezo0DhS8cMviC7reMo07ftKmPUoHyE7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=O3dN10rPaijgospV8FtWUi2ykHl9hG0GTg4QNz1VrZznE8yNl+mu8VntgJjOdwbDXYqbU4eS2Is3ZIOCa1d/3n9I/fpRSAJQFYqSuzDAbVD2musnEjbymccXnmvz8juuNEBzwqn3H2PikPE4FYQ8L///bqIB3f9b3ISxLVIvo+KaEvwCM6FRjlNxnh8e3V4kFnPo8jl4Psen3miQUz+DKTtcBwHjrvpSSVqyEtGxz1qmt0BNk+dff5a8pAL48d4odrS8Xywj08tTQb2WVoSh1I+c3Jj1xMmUs3sZ48q66D8waSfijzvAstvWSKDghF2SOohqFe0M33R3KgocGIvvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcqS8ammh3m96AiUmk9HufueEEmLESmDsN+27wGdJwQ=;
 b=B2NiFwR/xmX/8NMJWoiK2pYqaFkOr4uaUT+xeVzW6ThlHXcB4GLhxN2b6KWyDgmAyBu+0bUmkwXO4pKvM+uhIehwzebHDN1mOlQR0BvDHvPmrMIbfN6Y6zPO7TuPGEP5EKrENO+YyD5snV5lO9c7Jf3L9FVb2pw3CJaqDbQuGhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:13:57 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:13:57 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Date:   Mon, 28 Mar 2022 16:13:01 +0200
Message-Id: <20220328141309.177611-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0032.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e8adc63-79f0-4617-f43c-08da10c532c4
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4418EB367429EE74FABF7215BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydrjzG6hBvEPZlHYlfeEaY7+kYnleHdIaDcLJ94qf3RdArwSppxQSk72vaLH2MR1KseS1ck+2Guji4+R7O62C8s48knGw2ACMxsgE4fML6201jj7uxRXQyDa0+mL/x7BvAgKB6C59f/GRGuug9SotWjaOefgo3YqBRn57KT4uHCFInRcj2l3n1im9TDH7UO3TUTjSPeTqqGkryx14tfBIVQk8BbDwo26kWu8aq4vBuJQJ3alycYnn5pNRai5eh8TsVdicKr2ieeLTNXJOvVjCe8B/vgFz0c+/GLKC7WIE10+qOu7BorDWbLeytTCAjkNvBgfwDYXARiV6mNEIi894OAvI3wHwu7NUB1nEUXHNncGkxJrTl4mWL653xhHcPUI1XkVbeJiOvZJjZJjALeEqLkzWlTJeM/0s3B4qVmlQ6u9OSnk0fefX9khTTXFAfhFcRLJBnMY6+EzgkH+RbkVpgVUABgKmO/BMrKsK8WzPOiO5F2PNFohxrmj6LXFZ/7B84WcShwy/+KZMZJQN+0Lsrn1T29D5umgLftNU5/3xgMuwjfc0Zh4sfZW2xel8oEF+leBaSzGuusMhTSQHZnDHKH946M+u9+LMSxOYIp1HIi4VvHHPxEuFP8PCWCwMnG8EHHGRKE2iX875wuerhi+7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(6506007)(38100700002)(66476007)(83380400001)(8676002)(6486002)(1076003)(5660300002)(6666004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gHxIE3qvycPWt6HmcPqOhTEsm+G8KeMN1MFzcJ4ujeooJMERBMKes7PjP77I?=
 =?us-ascii?Q?nDBqzyXDVXJhaZy2tpPKAz54LmtCfHjGeTFtiOJ823qLCfSZuqz9yvQ1Ji89?=
 =?us-ascii?Q?YqhiCayrv6XagHn9mj0Bftny40av6dY135oQjNeuyvgmP5Rhw+jH7EZ6QoB5?=
 =?us-ascii?Q?c1+MsFeARNAStvNH4CCcBIewOt2OOuVM+2+vMLdrIs4IqlJyZOLR65VWPfU6?=
 =?us-ascii?Q?ilGvfRpteAWEjO/abRU8FxlZSK0LEMJSiXqtDecWiXnDmrgK2ThXM5+37LbW?=
 =?us-ascii?Q?vjuCFvUutSYNx4IT8Rwl+YFf49WGOtWV848wB3bjPmcndMQFQ6jYsAgO+rto?=
 =?us-ascii?Q?tRt3Q4/4XvM2lVOEyHI90jbdKI7PzU47MAOR85Iy/u38ynpfjFikhr3knySA?=
 =?us-ascii?Q?VUUfAKSVsvKJJB7VA/9Wllk/QcPfbfYQjECdwBtOgtad+nukSj8ruWvMo8XH?=
 =?us-ascii?Q?twC8hbvJYK9j7XOfxvA0rS/rKwvPR7cBdbRazpm2FxS6kZnfnH7T5qdpiCg1?=
 =?us-ascii?Q?8us/O9DEX6FOlUwp+ELtYwmYlUdXfaynDlVgZQ0uTHxlRyj5PUWAK+IfVzlB?=
 =?us-ascii?Q?QKmO8schWCSrpbfwwm0yrHnKi5a6k5yluVapgY3M+L5AYymahuscavd1ZLEM?=
 =?us-ascii?Q?Nn0mI0KEjeQvKb2km2akZxiM99fL0N4ikeBFeYyGlHZo+8GGZqLHuHx1jq91?=
 =?us-ascii?Q?CFmbUft9goXdbLt+tQxnE8RakphV8ICb5+bC5igXqQIeDhhAGsy2v48V1+QO?=
 =?us-ascii?Q?Ga8Na6EH8TiuJMXLC4KJPcwz1/LiRHzex1kI5pSELKfWs3kp6jHoaxHq4xOE?=
 =?us-ascii?Q?0u1xa0PKNavylHwkig5YTlSIyLZd1uXja3YnB8NueWXTkeeS+mwhw3C504jk?=
 =?us-ascii?Q?bMrEk7ffavXkzno0nI7PF1tqRRCGbIQPh1gKweUGFNm7ySEZLA6voHD4qeny?=
 =?us-ascii?Q?rVV0lshYj2H9aZ5ibSioUEP2rTdJZD0HUsIyYZcPI5pEgPM/HqpSjgQL2///?=
 =?us-ascii?Q?WL6vN64O6aDZbOpVUVmH0MxQRiD/W+fiGR9fFbJrGj+xBtcC9QyAOh2N2xWs?=
 =?us-ascii?Q?qPA1rvbeCziiXBHvpsMVCgi2Dap5L8zkIIPOm8+qK4UIY2EKceGkpka89Wsm?=
 =?us-ascii?Q?YprxCujoPc9Utit8sbz0EzXe7373I1Gi/s+iwTIMA5xU7+bsAlA37Y/89l4t?=
 =?us-ascii?Q?dCWnxCfn7nwPBHWCgYnUXgypQQJ3a6O2f7i0DdWob0hDOiBWYUUm8I4Bpywu?=
 =?us-ascii?Q?UIxKxhc7aRnIWWZqfBSKMPUgV6Wh5ao+56NaDJyRK6k4WyMVMOEbpTkhourq?=
 =?us-ascii?Q?Px/6bgRVsAnr/LQH2kKz747Dft4qQC8ahxS2kr4JZBfTqBauaXWXBK6IGHAY?=
 =?us-ascii?Q?jQVADO90dNNN0fWgS+9EDR4JCdB6isTCN1Hhe6L2GFEmbk7bvvN4Q48FBjuL?=
 =?us-ascii?Q?F3gU8NCaPAga5AcvddJCv+Her58HqvJeCmXWGVSWYVKiECU7i6i0/AIS/d8s?=
 =?us-ascii?Q?AZ4vzqBWPb6aLpJ7Z2t3g71UKz/huluyO7TyEh/fEUumaf+bnG81oG4oBCrH?=
 =?us-ascii?Q?TAOjHB0W0GPqCkO0NvFo3KtLRbZgRoTl9PxXF/d3Qbx/4GVFTutJhV5Hr3Co?=
 =?us-ascii?Q?WYJFo7V+r2+Oio77k0pKjz7gq3poeGKN1S4fp/9CFnm+XTf0pYn7CyMo5ov6?=
 =?us-ascii?Q?bftx7P5dgf2KH0dmDTjOBLgqUMCxV1piwJaQsH+tnilecXIqDpD4DMdYNAVu?=
 =?us-ascii?Q?Fd7RVQzqfKt+2971hqIxFWx2CjxVv2xXWB/IUgPmlg0KCci4xv3cjEBhFQ3Z?=
X-MS-Exchange-AntiSpam-MessageData-1: smxvWDr1qY0oAaJUT1zpcAOFkHt6iFsu5rU=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8adc63-79f0-4617-f43c-08da10c532c4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:13:57.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr9O2IyvnJ/m/entGl3XdKeOZy1cayoYZ3Hq5ZEIckDh46I6RY4DScM/gk8dgrzn8TSF50hP0+e8WLUdMzMt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
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

