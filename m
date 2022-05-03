Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5C5518168
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbiECJoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbiECJn7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:43:59 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4A538BD6;
        Tue,  3 May 2022 02:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgvjGyWAQKqO//szeAzt9XzBGI6JfiS+DvlWMGf7E7oFiNMf6QsaYY7QLuvk4SSk36P0h6EVzPyN/J0GFARUNVsYLna2vZ9MQa1miNPe1wt96CFHkQbEuQ4RmySxXeZ8gEEJEjyERWnZ+Doh9Li9ABceingWLe6g4DeErYeZ7eA3r1u9WijCALLgcDkdly6cBwNEvUcP/3hlqniBLRWt53x9eLwiA/wdIzs0+Tk9Ul/aGfoB3XtFFYFSeXsKAbHlZrl9oLdZdg18J+EQUIHJdlaqes/Scnt30ikoDCNO1d4Oty6qH/Qmdl5Ew4En74BTvWORmJoUmKz/T7KDNdccFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=Abqob/Hn1Ve7Of+mHbO2suUGfcf8wwOGpFSAbQJRY14owL3HBhGWVh3JodqJBpuxKAl6rNpxVZ14ZUzIh9kQt1AXBIrCFatG3IHXw6050lN+THpuwvXvjY+8VA/KLiK5N00I5aQ/xL8sX5Bs/iwiQSyEbcXJmup1TfxOx0iqEnfOkkdapc2hE3SB79bqLTpMNc/5Q1hIvlM7ldwenHeTY1QGbJW4zUu5Rnm9nid2Uv130wiUN/evpEKz9rtX2mYgHlw4Bv7mPcuBYRU7KRaJoyDziyFLULZmQJPod2e7MBgfWVi3wIYMG7xq7LvZQTKsrzuxCk+87aG5lPdLohT9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=EJRG1jzC3AYkN/zDI+4HCruqrNtBhZx+WuweK4Om9Ty+BneBgqm6LpzL63UyGqqYoyoOypmp6O2LO+tcUzuKgROuLOGan3aki/K3Rexe0pQA0Corq5/SUD7WXcRzFglqZd+E1A3xthigvcFhuekbaLSCISzfik/wo5fCKNSJBiQ=
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
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 3/9] vivid: add dynamic array test control
Date:   Tue,  3 May 2022 11:39:19 +0200
Message-Id: <20220503093925.876640-4-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ce5b8ae1-a822-435f-8a44-08da2ce8dd9b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB25591BD95719B005E6567F39BAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtR2/3Xq5M+yVj6lBMIDamK7O0PO9bVCc4WEtnnYu9LJ+2ZPC8vJ15J2y/WlB2swVNA1JCH9B+vXFIxfbiI0OfgxFhhNt6njr7FQnvisxKf68dmXM0v+KpZrsVafcX/Hy5QUJXCAr7EiQZtJchISmOpFGDI6PMwWmeD8EBrZFbnrO9ZGMinL5WL0fJTWKS4nzo3AKjZ+phNcp1cyMD0V0BCKGlEjup0oFUm6oevUs6sp9bqmmZo0hcjUjE3ZQv1KIkqVS+CATcR5Lcqlx4ZhlBkdMH10OLGD+VrP+6awpM2eq+O52WACCsOt9IlJmMvssxUwJwK543jpjAV8xyNCsDkV1dsXLpCE8/nBe4hTjTehy+eGxdJ8SFY1mdtLwuEJSGVgK/s/nbABa5coi16UusCoFh3iv4CrEUTIrxNr6HmFHIZfxCw0HzJPf3VdelcONLX21b+4c5f94vdRYGABGO6zMwLw7+mtAZJFAWQ+XIbQHyntcZTzoneXQ4KklAri88qXCKGMbb5yGjpiYMoU39XN8gdFasKnuda3qBerROKL4Zdpb80jKUZKQn/RoyAEZTgQq6Z7D4SCZhfzRSFNzH6tXsQI+ma1MibnhDsrE+3Nru9EHwyQL4ckbus5rQOCxhedMQ3s+dHgEzmvEVu+mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(5660300002)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IRW5e+nhydIHSwzpvKn4VkFZACZonnz11T2o5gLjchX7doRTxWdsTPSzuQ2P?=
 =?us-ascii?Q?j9wG/to+vmhcXZgYxSSoSRPbFRQTu5QaxGJkwt9VZsrv4SyvWyml/kktrwLR?=
 =?us-ascii?Q?o/D2cogJ0ePg7rncW0s8bdZa6Lq7Iu35yJMGRINzlufPuvBqYoEwgZihF1Lw?=
 =?us-ascii?Q?y9NjGdh/Rr5upABDcw8bVQVW3K4mnfY7PSfUgzwQ4/yq6MjJvx3/kZN+jFaw?=
 =?us-ascii?Q?1j7fi00Hq3EhSGzStRMwYFdcT890oLGqyJwrFedyKp52Fv1s8JOkI58w9OHO?=
 =?us-ascii?Q?jcjUf07r4Ol11dyrj3+sylDYBvr0UXmnNQe6IWVScyE0QndyMITvGL+DgR64?=
 =?us-ascii?Q?17h/5RnI5IZmW5DRGZarDOOoZvkz75hshltKyBq7xHoXOWAkFxY7MffZXy5U?=
 =?us-ascii?Q?BY9AeSATWj1SO9glc2vL0s2cn1VhKJLjlq+DCP9fTLk68R3JwjoN42c7/97i?=
 =?us-ascii?Q?VAv/ijUMsoHKpmAiYJkgiWYuf6QGUNCXLgglxDrCHOLZrnPQef6dmJCbeNpT?=
 =?us-ascii?Q?9eR0XeUxTKhCswtwXMYoikSjgvWDyCl43uBbu+aDmDWMS+e01hPTFVE83Aw2?=
 =?us-ascii?Q?R3PwXsiP6l43S32SD2/0lBLIm3qJzFAvlndUt3jlmNgvJvK2ZmoG11SbooLa?=
 =?us-ascii?Q?ixi/C/hLStfGsnq0lArfVBUMyYJRNQVHB+hu2yxSLTCZyTBetTNpLsBwLuXa?=
 =?us-ascii?Q?Y0HQBNRURscnzkvh7r/nDp4XryFd+QPguF17Cq31BAAtkGmHvQ/TdfY7XH2B?=
 =?us-ascii?Q?HEalNJ3jGVFGXngzoGTDSj8DjtA9R0OokbzM8dSwtRB5dvLm6zPEmCjKIDNn?=
 =?us-ascii?Q?ytj3oyVxXzIp2el/ayIg6mYN0T0Bw6t4vCirIbihz4RDzvj+dfggKWlpzNb4?=
 =?us-ascii?Q?hbo8CAl3QjEXhs69aqzuQd8bvYA5GKOiFyX0wcZqBuubInIQoiZeRQ+iq/P9?=
 =?us-ascii?Q?xHwNs45JbJesQen1POTkUPn4/Xtpoul59gITmjdD2eiDW160C5IwcqI4Vm3S?=
 =?us-ascii?Q?domS3EVbz1sAr+8Epy0lvV4TJzp9FuXtHXu14i6fI6uHgbWQMhRJFpfxnQoM?=
 =?us-ascii?Q?kpDD+gTkjFSjy8WvkDS7dNAKINx8iZi39Unj2nmTz8+IvCiQL7shh6BlU1qN?=
 =?us-ascii?Q?e+z6edqcpZgPCyDnFwBDbxdN5U+5l7FsgPrzju811VOoigMiGEdHqijikO/B?=
 =?us-ascii?Q?CnnsHKyyU0xulrJNAAcmOzYRLIG9ECJ5QFetW5Cn2w5tH9jtYVNAiWpuTxyN?=
 =?us-ascii?Q?nyZMxovlowyTQUl0xQOG6CcgBoTnDvrpp5FhSWn5XlItRzcSMn7matk9URvr?=
 =?us-ascii?Q?GEziDc06xnKbK3UpJXG/2HMrqa5kYyk26v4u5FeAUzJ5ksvaIe0Upcwk1+2H?=
 =?us-ascii?Q?MpJyBwDd1KQoOpWpYmLB3lOaw86ae2OGOlpoi9QQyahO4deqLs64h2ebA9wn?=
 =?us-ascii?Q?LKvh7qNf6YnJuACJ1TbvHusXQdwNfINzqm+f8nClxcsSrrnVjXnpR4xglZCB?=
 =?us-ascii?Q?pN/XrghCU4pNIvX8UmHOYd8lChCAi6z9Lxw8O0We1lte3EO+zHf/Sf1EScaL?=
 =?us-ascii?Q?gNAioR6S6rsvA/MbHYfEJvVh/y0upVajouF6d30tPXk8GFeeRf5O4COGQqvB?=
 =?us-ascii?Q?6NRhd9Sg3PWhj3O4ctO2wber5xAdSdTlOcyYle4RYKELKoDLyxZSMpOliYNy?=
 =?us-ascii?Q?2dbZAENlcg8t6gCVKQPqW48TeZEP6RMx46aQF0RrNirgcUjHemFMcC+QrFSA?=
 =?us-ascii?Q?Netx27TCEmSENnpknB7E5ovO5Metm6iIvE4d1LP5lBouHPsNHxJHopXRZVBZ?=
X-MS-Exchange-AntiSpam-MessageData-1: qOMZ1hgsmO3ISglePpz/EQS4lacV4pztCAU=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5b8ae1-a822-435f-8a44-08da2ce8dd9b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:48.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJ00N1o6uGW96ZQ4d+UuLh1xb9F0f2t4JUo8pf936hFuM35Vq7dzkOrFocFiGRe1z4a13f6kaXsvmuujd29bJg==
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

Add a dynamic array test control to help test support for this
feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index e7516dc1227b..7267892dc18a 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -34,6 +34,7 @@
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.dims = { 1 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U32_DYN_ARRAY,
+	.name = "U32 Dynamic Array",
+	.type = V4L2_CTRL_TYPE_U32,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+	.def = 50,
+	.min = 10,
+	.max = 90,
+	.step = 1,
+	.dims = { 100 },
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U16_MATRIX,
@@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
 
-- 
2.35.1

