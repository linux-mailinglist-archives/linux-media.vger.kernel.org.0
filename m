Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEEA94D224E
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 21:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348224AbiCHUMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 15:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234450AbiCHUMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 15:12:06 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA9F3BFAE;
        Tue,  8 Mar 2022 12:11:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSzLr3BpvFV7nJFm5BQ3voRMns+3gqtPla9abqwRtMk05ySzSCN+0NPJwCuqc1xGUdNjP9Mvpj+l2aurCU3Qb85PSubSVfOUdLfs1GiADq3inl3ZZPPwreZstZc4eW7wr1aEg1OzZAB+VdrUf4BWn7HD91wu2LcAgzjTnr3oPCINjiP/GOfb4+ECGuBGuftOnxUlcrvysMQvDJHJiPBRzk/fb57DlUumWk+Pl0MeFzTo7WkdV4eSMHt24vRpv9fz3U7UxOv6jX5nNG3lv8WsN03HWB7V0xZRZKIRkEROWvXW9EYPRYIllZz1EkVFwiopj3NVpRY3iUZsitInTsxy0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=Cswc6RczPhXpPcISaGBwcFpnpVKr2YThz4dOa5WEZs5rPQhLBVzB67/c5i78rnv1q8qLBIW6Rg5WK1pcorCwsWIe9j30Oqm6STUEXdnllBF91pzxw/vLtzp8cSBty7OKKVZlD6QiZ1tagMvdkV9NUYDC3Trbfm150SuZb0/0SnWk/kZ3cUa9lBPfCEacfQwkKXNgHqQkqv0QR03JklKKcnbiYaurS7Lz/7Djyo1ah5fPUizVUKcTa/K36sVLPFX1Zgr6U8PzFJlNi29UKuGZlZm89Ljgcv3+hbZNgD7fVKHJCS/AxQWGa3r+ATVqBJ0Gbb1y1W8XcZAEdgePrKQHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=i5WPctJExLDDx0O3eAboyrLXKd7JsfhsumCdZExUDsE1YdhM+ZMdkbz1jxHazwbsEFOidRNUnBbR908ed6LI74PYsSs9e8MzLTtDUFJued5E1iwvoH0+qQCDOxacSR3tZjbv6MgICXvAQkuH6jwhjeDm0Qx1oCdtSNZR/4xJZR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB7PR04MB4588.eurprd04.prod.outlook.com (2603:10a6:5:35::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 20:11:05 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 20:11:05 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/9] vivid: add dynamic array test control
Date:   Tue,  8 Mar 2022 21:10:32 +0100
Message-Id: <20220308201038.48386-4-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a2ef28fc-fc32-42a0-a62d-08da013fc677
X-MS-TrafficTypeDiagnostic: DB7PR04MB4588:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB45887B04BBB3C61DA5987234BA099@DB7PR04MB4588.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AU16BKFXywn+I9NTv6YfKCJeLXpSTgJ6BnZAJv6xkKL5woJgYkpEOIPaDq2nwiugrGEriQxVS4JzXAlwnKnujN8RcGxf/T1jG32pVY3cZcygQ7xz8ZAlTQ31eHaOOs+5H2V3vHNusnTrug7ASFteskSUkS06uVw2nD9NJTgDmQ/NaIvRIY5Qosen7n2+wAVUPmftO/pdnrYo/8VqKBrKvCb/77fTdpkTkSaPtNdQmLpRBlc2kGZa/h4sUpIQw4QUdc2GfkonQP2lq+4rxAEuZ2r9+4mvXHvuJjIKNwNCfEpcbuU/2GIF+LJoCs8fCc4g3JxDKAQAWgc+gds9DUXJkbFYOio1AS4ytOHiYYN1RCO6wxcJVWW5hVLRBB/HSHs5AHOFJpWMCTb63H0EJO7SZJ6l/UH/IWFFf6pwmRV4/k9K9yFRYuo8LzevJ0DHLp9mI10GYUvKLrqv3/u6Qc5Mnux5N0VqAGsYIHdJTu+6Yg/Wv4xh1J6PWCFdndgk9ZUMHfuUS6D9xFowDKnuof6qVTQ5EBPz43RpV3ernQ+cyo7/PkfLEgWnqXxK6ebXDh8Zqv4yCCwiGmRTq2xXizZT/QeBDULFgFeBZAqUYKrta2X4Bmnw7m9DXHklhnwMsM81iTrRpfvdn5U+eh7m3Y8Olw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(52116002)(6666004)(4326008)(2906002)(6512007)(5660300002)(44832011)(8936002)(1076003)(186003)(2616005)(86362001)(38100700002)(6486002)(8676002)(66946007)(498600001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IVALDwM9ubM/7kplCwjn9eoeyPXBI6sOAnkQjOyQDEgICrPAv6RMJf8I3gJS?=
 =?us-ascii?Q?rs5xWQFLdSsaoqWt+RY23sN/NesKOBbOUJpRJZ2Xs0KRbxM+s3gePeKTCl6P?=
 =?us-ascii?Q?v53BMlTwNG7EbAzTOlwXuOCNB9dpmrFzgNVut5P66YFh5KsNYIFaB5Pfs20e?=
 =?us-ascii?Q?fvX36t86MSZq3/6wYTkn9aLFov5onihiyxrpW+/mdfrTh4TkD92ys/iJsFSV?=
 =?us-ascii?Q?09G5CO4HtQ7JNg6FMNqzR3UTOKSTOXg56Ddb1pWWzpVh/EGGihAYicjO4BRG?=
 =?us-ascii?Q?YvuaRL4u52cHGdPpLi5S+XxkK3o8KvZTJ2K6dhijc6JYptuWhWc2uaBRlvlH?=
 =?us-ascii?Q?x90Z0ieJ/SfgerCFccOw6vFZJSebEoVs6hrC3OqdS6rHMC3YPU+bbXMvd1Nw?=
 =?us-ascii?Q?T2Cm56hWsuZSmX2BBSVs11yatf4UztXBhIP+IbFAVGu7RuR9m3EuC/pstBlj?=
 =?us-ascii?Q?CkN7wdZGD7/+iv81cHbb6dNKcX1+s2M+Rlu35YS4wx87kHassrBOfcyj9/Z2?=
 =?us-ascii?Q?qc0ZleYoE/o1Ych1mJkjr7crBu2kagfXRKKTsQC9MJ4ZyppJIEXH7Fvgu+eU?=
 =?us-ascii?Q?dhzfTalqUVleWExkem8seo9NHYIc/l3OpzfYfjZqIUq9j5znuZWEKefpG7i9?=
 =?us-ascii?Q?tXAFk+HjDc8AOFbG4D3pbyWi9+bTrBgNQzfyi/06T5vaepmVah0XKIf/k3Xr?=
 =?us-ascii?Q?DDF80cpLEMtJy7dfiesP6zkvFnn+w2aWQZy7g57lGfF0kgEdefkT7AN3BJLJ?=
 =?us-ascii?Q?NNH1fJC99rEBkhS1TzhFpHa7AQvkX2diDIi2PbVtAaqHP0sdQJyR65hYxB1T?=
 =?us-ascii?Q?OQW1h8DXm5k8Dkaio830pcv9+cWfne9jp4TkFrOj4NbdvsJkHjFE72A4KKyY?=
 =?us-ascii?Q?UywpVWDRUR56IzaVRjoLOz8SK5qfKa5oednNVZfKGeC9/7N1I5hBi42b9/U6?=
 =?us-ascii?Q?kSsn+9rNNmeAIZKBVWEW4agad2cBCj4cvPqmrWrQ1nHnbLVmInAM3j5BMRE5?=
 =?us-ascii?Q?11ayuTr/tGW8hbWEyCi1nyv84mPpA19dwkUhgbdTNYdm28hb8IsG28kxeC5U?=
 =?us-ascii?Q?mjaNYu7hFXnREWvucvwX208gsfg6Qz1Mx8Jc1pkAQm5EIB407B1tBjueMfiR?=
 =?us-ascii?Q?pdzWGa22WMO6RsxsKdzQ/zQM5p5qQF3/8cXLFpSVPocELKV4xKmxSkD3d4iI?=
 =?us-ascii?Q?JQqMcLZZl2+U+JGyQIcJIiQe3/p0Qy0iiyx4/heZLHItkNALP/d35TqbwUE+?=
 =?us-ascii?Q?r7aZhEYOTApDViWUbDoQTRYVPImV26Oya09vKfPpfOoNpUDF6gABEYjeYsd9?=
 =?us-ascii?Q?x6lXIF27IQVhwsrcEAyW0U2C7EVVgOhnRTmVUg/Jdg2/oqslYqvsB42THx9o?=
 =?us-ascii?Q?+fxK9g2egiEnojxDnXO5ErueUrmf3DFUvYZBBrzoFHSqUousVH5Pkr15SkOi?=
 =?us-ascii?Q?PTF5qCjj09bLynbqN7YSlQtTw4Uz59sacjMWWnNngeGF5X93IwcjwLJn5yE0?=
 =?us-ascii?Q?ipD1+8Y1/dG5uoMFDdsoUoM0YZfjo/d7nLuTzg2zmhGLhU8EeWdRKqJEDDgd?=
 =?us-ascii?Q?Ib8UZnnL8PryGr3cao6xzXuNfnU2M/WCQlAWHupUJSHKIfP+e1KlT3sgVpi3?=
 =?us-ascii?Q?7TFGiSbfKNLaCoLFv+I8eF0ucfQTg5rVOyO7VGTrWuLzZRaGyZSR28Wu6dM5?=
 =?us-ascii?Q?pIeH7qcL2Gna1fcJajEjyKPAkgk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ef28fc-fc32-42a0-a62d-08da013fc677
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 20:11:05.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02eF2sA5Hadvh97SPmKK1gZ57ps9T3+2BAPbKvpPrNHGqGZz9fHKJt1XF9zH9RziLh1mqIt3HE2AU5lud9NGBA==
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

