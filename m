Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43664585B18
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbiG3PtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235131AbiG3PtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:49:10 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACC915A1D;
        Sat, 30 Jul 2022 08:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRN3QsL2wRXfV2tVS6h5Ic1lsFhzngBGwDFCpXeNn1NsA0awUU04NSUgb7CNVoFfFBHcTZqhvlkQGfKQ65jsrOiMwxbqzep4WGMFzelqxxYTsPwjcdxEagnVq+O89ImE2yWKRt4DpbjLdMQFCG+Faofnqs0PyCainD/wky3Wza+SXq+ZjXM8Ie81n5FwNFVLYoDDIp9EGBCt+LJO503YX/OeOL6nKciMmh/61Q/jWkgGS/yDfNr1tRfKpTeeO5bWtNI98iBfOTyGNlaq4cX04cylfPWrd9TyhWCCPBGdn8GzlExJ7idYGsjCSjmigYGedamWFN6ONbaHjEVGVd9cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJySvM2RzQ8yfyLYrCcr+UHM3X0MJ5/VdC5P5rgGc7E=;
 b=LBFBZGfgltc8v8d3YZpeCaczEMG/0URWZnQHO31bnUyw6JspPbHrpufwvd/lLGns+tds3ypTn4MKbYUac38xyBZ2AzlEFVgGEaNgp07b53dl+LzJYRKkX/zLFhgSe0j2JKKvQXmWtwUXTBlC9Cflu0nr1CFOAeWzakDYA28beXOnmq1RSkWtWrkH8O+qdUzT5gD8kNkuwJEWLJtEFG9d1J0YGGYiYIQQs9qJvIT/W44vBc003VmuqoxADtkl91p4JSLMC0eBq+uiViC2EsDuneu0rFEq97LrqYG7V5mWSBfYCiQWzemOO1iodTo85X4FodiMXCId9GyDgE4irXsAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJySvM2RzQ8yfyLYrCcr+UHM3X0MJ5/VdC5P5rgGc7E=;
 b=ByKowVEPKTI1zxFFonDL2mjTx/uONIo/yCw+sxnBMf1cdbyV2zKU3m3p2FIs0SAf6f4DDRUcNpTa+pEXUVHFIID4jMFZTvD+y4Yg+il/eAmWuo8VjaiP8EUMVimDml0ijiBBFjt96hBvxn1wnNBB9XFOouw8c1aUtDzlJAxgsBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4875.eurprd04.prod.outlook.com (2603:10a6:10:1b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 30 Jul
 2022 15:49:03 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 15:49:03 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 2/8] v4l2-ctrls: Export default v4l2_ctrl_type_ops callbacks
Date:   Sat, 30 Jul 2022 17:48:37 +0200
Message-Id: <20220730154843.791378-3-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b233ed5c-2c69-439c-5248-08da7243071a
X-MS-TrafficTypeDiagnostic: DB7PR04MB4875:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zXzPjzEOer8Wv6ghcJmxDEP+ZUjFrdjiXB3EdX0qotC7NPpsGY3fw17h0SritpjunBBAVwLJKAwF5giF0wJEz55DAUgqzRzwZ4Cr3p6TJ+Am785qnzXl1T3FsjExkqZTW+Qyv7kRdzNask4mBn8moFyEEqw94HMh8D1qVr2XMH0iRs2S5T0gjMWD9ppyUvaCj+uj7nVwqEChfHAe3/LuUr40oM13doI/9p2YZSoI64tsYiJSwtu1K/q5e+1mZwpJSzxJEj2SDy8lY/DfXC7qLZx9Bdk5F/y/c7BjcWR05R45xuxqhPgqrzgEizoLvYAtZtqRY77ZT7rO+1YHHhc1hEb9VUL4QEDUQWxieGICqvlM3AA29zfwGnFasGj+01/2i5wM6D7BKyqlMvIU6ZUwHA8Kj5/yuKoaoWVOZNLPsgAUwFlx5Dz5YZcdNB5psbEFD6/+d8t/bwNHb15bnwfd57DOCZoj5Fb3HJMaozD8lkwwwDHYEGFFlTW5nXMbhbIKI/qM/bSMS7zn5DDvr/hGBHRgpw0vAKIbWKUh2ubd9AyfYWa8mwxALoneCUJ6wB8ZciPlMDKPMXIoh0ngRhUxzOClJMLwoEfqGQEqqLZZthbHzpOR10Zjnmne+2ekWzW5jFPxsj94+3kQG306x8ipxVoIMVq0cL77rn3irHZF99r5NunOyZW+FhCsI/bAHJk9TOT3fU04Kax9XUGfIOws8JHdOj6Vj99wDRJUl+kw28lrAw2XY2/ecEnq18kehjq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(41300700001)(6666004)(478600001)(52116002)(66556008)(316002)(66476007)(66946007)(6486002)(6512007)(6506007)(83380400001)(38100700002)(186003)(2616005)(8936002)(1076003)(5660300002)(2906002)(8676002)(7416002)(44832011)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z+MbchgH6kqNhyeyWC86BkgMbIaRDsZHSPs/mw1awqw14Nxs6BtpZsPeZOgt?=
 =?us-ascii?Q?jZH1ZdIEiJBkMgLvGTwHu2XcZ6pIQoPmAAQwUmu7bKBeOBUelrit+uTys+aB?=
 =?us-ascii?Q?XgrF4umOU22PVkPA4GCNINUKikGT8vFIUl31lLAu64C8m03onoZUQMw5iEaZ?=
 =?us-ascii?Q?h+YZJm5ERsDHyg6MctF8OtJiQnkbg25x+/r+7iTsONRq33UheufhmlMXAf+N?=
 =?us-ascii?Q?oN85pN2vPfCnKevFxI3vaF6/ppg+f4rMKXss+FnlGCFeu9kGho5da+pYjR61?=
 =?us-ascii?Q?OASvF2iJ356RjnS5jkA0RzxTs95dqXYc/Ztf5uq8slZcyQq6VmnnreH/UU4R?=
 =?us-ascii?Q?3BPoSPJwhD0XD2Ba/fNYj7/L4UmUfLbp6oylgPcCwvih++NkNfYlHGqDPegN?=
 =?us-ascii?Q?ajK70O3yjZ2GGg9MT/APMxV3STfozaZCy8PA4eUXrU4Pu0sjoWwg02yvIXC2?=
 =?us-ascii?Q?8/tNIc03xMbGy+YIX0+RBqsD5UkrS9cLAS0IGsI26CzL2aOOdDcZNG4dz2TU?=
 =?us-ascii?Q?fmztt/W88vgic+XeLJCLTP/y8YGdU8t9LVXgFYz+KIucTd2914hb86eCTaYr?=
 =?us-ascii?Q?qf/bkhShC3fBG9buOTXD0lfx5s7jriqL9Wb0Hp3t19tVGairBXqqBCNpBu3w?=
 =?us-ascii?Q?6+IYGnloLkyuttsS7QS3WbfL3CZX71OTwTCBcfq6UxSx1/h+l3kbVoIMP3ng?=
 =?us-ascii?Q?y5E5g+FpK4xb2EZu6YEoVmK6srSoHoSas1R8v+1EALSqhfTqkxGWvkhvFJgY?=
 =?us-ascii?Q?e+SxsRtgtyaAerN+sycVZfsDskGjG/Vk//z252KPiA/1TuVPMspWffcQN8RK?=
 =?us-ascii?Q?ih/AkfOtSh2ygRn3LP50H+hYuQU2Qo9QTfuetPB3ZYAiQVHLOg51jAA2U4fQ?=
 =?us-ascii?Q?zekrgQfBaToxs3Mc5yGb8ZyDgf+M4uuO/+bROz9m8Fo+5B0QUgATQO14Axo3?=
 =?us-ascii?Q?ypefGNGiz5d5dfY22JeSn8Wm7U7k6CyfIqq9btkgbD/EeAwkJta93z+ESxBu?=
 =?us-ascii?Q?y1t+XqsLmAB0s+npVqArdlg5HWfVQ2tiUEZgU3D2XRtg8A6jC+pkCK+00vrw?=
 =?us-ascii?Q?ALtlIGS1frOwX4sxjXqtUmo+EKfLxzv9vsIwDprsh76BMFbZmeEmkgVJuFLg?=
 =?us-ascii?Q?7GSIfFbfDxPGSIuG9Bkl8sDftIunULj3pkIcR3KzKClY1ZPrErz/sPqPedaQ?=
 =?us-ascii?Q?uEWHz3j3i1y53C77tyjiNXeZRsOzgyZMkw86UtZ4oWDt+V4HjhsaCqhCiHm7?=
 =?us-ascii?Q?Smk/1N7yybFZsP/bADquok7K6v2dY/AvbC68vRruErY5JXBg+wztOWSu5HyY?=
 =?us-ascii?Q?HMW5p4k7wSHCvFiTlakx5Dq6r6xr0ci8MGSdxB3oXFWR5w0egRTJhISPS0Td?=
 =?us-ascii?Q?e8vHRr7h0bbMBgWSh0YezUtC7ibhs+EIKq3RuCG5HeNBBI/gCseo8GyTDATs?=
 =?us-ascii?Q?cuMwvZ75QZGNUPYI1R1m2E7fzVB8pS5wEpfZ7eXGSuzpdHw02Vh1ng3GfVB9?=
 =?us-ascii?Q?aijjSqvpZQmefoE2m+ku22bdsNYsgIwRkV46Jmp5NO1zRhGA1A1qxZs52scc?=
 =?us-ascii?Q?Fu2BCLqYRJ7CpQz8ED4HTGCHODMnu4Nx2pwqUn7On5n4tw/3eWYWWAxd9bWr?=
 =?us-ascii?Q?Q2S6Vj7mG9wjWoOEwoME9q9NsZwzCiA9emdNF0b/rp6/NgJKF1OdUCQsG1rH?=
 =?us-ascii?Q?BVi/2Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b233ed5c-2c69-439c-5248-08da7243071a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 15:49:03.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIGiG7d7W3XYeFpv6La9ZjKRgXL/KK5+v7r6/6x0DmOKvUjdMs8Z9wS8C4wzBj9htRC88U7K+JCL9hwt5zndug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4875
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Export the callback functions of the default v4l2 control type operations
such as a driver defining its own operations could reuse some of them.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 30 ++++++++------
 include/media/v4l2-ctrls.h                | 48 +++++++++++++++++++++++
 2 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 4faba8ffe426a..ead5159f39c77 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -65,9 +65,8 @@ void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes)
 			v4l2_event_queue_fh(sev->fh, &ev);
 }
 
-static bool std_equal(const struct v4l2_ctrl *ctrl, u32 elems,
-		      union v4l2_ctrl_ptr ptr1,
-		      union v4l2_ctrl_ptr ptr2)
+bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
+			     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2)
 {
 	unsigned int i;
 
@@ -88,6 +87,7 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 elems,
 			       elems * ctrl->elem_size);
 	}
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_equal);
 
 /* Default intra MPEG-2 quantisation coefficients, from the specification. */
 static const u8 mpeg2_intra_quant_matrix[64] = {
@@ -177,8 +177,8 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-static void std_init(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
-		     union v4l2_ctrl_ptr ptr)
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    u32 elems, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 
@@ -240,8 +240,9 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
 		break;
 	}
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
-static void std_log(const struct v4l2_ctrl *ctrl)
+void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
 
@@ -334,6 +335,7 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 		break;
 	}
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
 
 /*
  * Round towards the closest legal value. Be careful when we are
@@ -527,7 +529,8 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
 
 /*
  * Compound controls validation requires setting unused fields/flags to zero
- * in order to properly detect unchanged controls with std_equal's memcmp.
+ * in order to properly detect unchanged controls with v4l2_ctrl_type_op_equal's
+ * memcmp.
  */
 static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 				 union v4l2_ctrl_ptr ptr)
@@ -989,8 +992,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 
 }
 
-static int std_validate(const struct v4l2_ctrl *ctrl, u32 elems,
-			union v4l2_ctrl_ptr ptr)
+int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,
+			       union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 	int ret = 0;
@@ -1019,12 +1022,13 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 elems,
 		ret = std_validate_elem(ctrl, i, ptr);
 	return ret;
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 
 static const struct v4l2_ctrl_type_ops std_type_ops = {
-	.equal = std_equal,
-	.init = std_init,
-	.log = std_log,
-	.validate = std_validate,
+	.equal = v4l2_ctrl_type_op_equal,
+	.init = v4l2_ctrl_type_op_init,
+	.log = v4l2_ctrl_type_op_log,
+	.validate = v4l2_ctrl_type_op_validate,
 };
 
 void v4l2_ctrl_notify(struct v4l2_ctrl *ctrl, v4l2_ctrl_notify_fnc notify, void *priv)
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 62052e1874bdf..121ea19d3da8c 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1544,4 +1544,52 @@ int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
 int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 				    const struct v4l2_ctrl_ops *ctrl_ops,
 				    const struct v4l2_fwnode_device_properties *p);
+
+/**
+ * v4l2_ctrl_type_op_equal - Default v4l2_ctrl_type_ops equal callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @elems: The number of elements to compare.
+ * @ptr1: A v4l2 control value.
+ * @ptr2: A v4l2 control value.
+ *
+ * Return: true if values are equal, otherwise false.
+ */
+bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
+			     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
+
+/**
+ * v4l2_ctrl_type_op_init - Default v4l2_ctrl_type_ops init callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @elems: The number of elements to initialize.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    u32 elems, union v4l2_ctrl_ptr ptr);
+
+/**
+ * v4l2_ctrl_type_op_log - Default v4l2_ctrl_type_ops log callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
+
+/**
+ * v4l2_ctrl_type_op_validate - Default v4l2_ctrl_type_ops validate callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @elems: The number of elements in the control.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,
+			       union v4l2_ctrl_ptr ptr);
+
 #endif
-- 
2.37.1

