Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D14557DD4
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbiFWOcj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbiFWOch (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:37 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D024457AD;
        Thu, 23 Jun 2022 07:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYFPzKDHeEdHAH1+DeO649xFWjefzP73ctj1R/vY+QH/lEAx+7dp+Pq3JzPOlsjtsaAb1iKumDQLjG9phylTswe3T5vh9LcwpAC+sxTXodoEU7bogwhRQh7rGckQsp1ORjx+RnstNC/dwpRQVvfIMygqu0qFRhY+xdQID8eJ88HEVIxMUprHTEOzy7Wo796JFukKUPcxJzT5b36awifIyZ8PIppp1RXJHnreh1OcDFqj511lP1RsW0z8hwOmk2Vx/4C8o6PNrBCWwK6b+FZpUTYmWuu3ApQFsQqhPIPq0k+UPS6hOvQhajoZVNtnmKgVHDCJdjtgjJQXQMaiqeva6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCHB0D3UBpJv9KZaNO76wIc5dieoM9LsJu7scwvLI+8=;
 b=fIDfvH15AQOvCiqBTIVHKjq9tZUEwBLOHC5Ng2jHf9UFVwNX0OoiuTw1Xf55W4VhHKTjlPydySVoitf+IhdLTazfKydh0wEj1pkzCnV1w7fQ+uwO9O2c6WBiSWGtZ8TEwANEt/X0lfZ+fEhLzQB4fPP8bWs1LpiwjG6S5RKwSlhEh08PcCDNLuNHvpe85o6tgwlHnC8WWyE7FtFrEhFeJlh9c65isfgALxtyLkQYkHfmbyCWmy6uuPFtYIbAjOtjBi4se7uXLJkJ4PMlanLsIcww42nn5gDcSzrAw7fcf5vVZPemZUtiICkPRy3ADlKV8jqiGGViNCDkK8OXjqZLlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCHB0D3UBpJv9KZaNO76wIc5dieoM9LsJu7scwvLI+8=;
 b=ZaxLO3cpYDMeMICB5rKzTFD4ElZ0TrHVfwY6AtpV+TSEk5ysexQn9Up43VWh6jOqWBQ0xtecKm8cOXsb/769BdodXBvgFzk/h8U5WI9cIlwjKNTOJRB7/N7QzYRckwZpxd9ZRdmkjzv7I/QIJfcjshIanMEkGK/v063LU6uycuE=
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
 14:32:32 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 03/14] vivid: add dynamic array test control
Date:   Thu, 23 Jun 2022 16:31:04 +0200
Message-Id: <20220623143115.3185297-4-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 78decb7c-4ebe-4157-fdbb-08da5525356f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22886F1AB4A8E49786A8DAE4BAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrMgLPBC3NLYJ/fzp5U9dYDUl92uRctu5jLPSlhcgTj6eru2Q/XsZDhsJX4SHxn+HOb+9H5DdR0BUT5tR420EOVkhJHG35ysySnRR1OtfLz+E9FHpjegFvbx0ea8epqVBZ6Y6/VuZ87qarTuNdv1EgBKxzmu/U0ZDaq7bio2PH0/qgWBf+t3as25e74DqH+K64Q8xnywIlQ6j/gdpFpFCBW5xNG5Rn73oi2UH8i2y1UlS/4V/P19bCij1uEEoeGE2J8k5h5WhBUZF2va2NDwbGbTHr9E6K4/oXbbjcRYZTOfzyXm9O/YgojnZR3JBoZT+A9sHJpewWr1mPQ4l6qrWmWJ6jcKvxkxMAfbdziiA0vwbWPlEoadhpRSNFDVCeV5Ky7k8vSMi0sPgKXffK7IaeMRejtJvP/9QNBTpA7187XNM3uXWMBvwBi8mL5UEXQ6FNnF66hN5gP+cAa8tlG1oS4xdtjRTmGtwEpXot93QCrgL0yGCw1uc2wNT4lPLs8F9m6h2j8eFaXOFHB1NFfkmqPsTrGupcRMw3ZOc800FhYVfBIX0mLHgtApWGubuiuAJcVQaW9+r5+OkBhfykBLEmZXSJ3UyImBflLZiEFVzK1FeHR1UaioIDoLUkIkZgjc1JK5OdhvFJvV05bvsbMP52zk4bSl5/wgEp7QiNNhc1uTllsj+b2Wv6yzC8c9K5guzBz8WIwfhTBNvz3Apn6JWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(7416002)(6512007)(5660300002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bg7pVQdieIJB3p3SejkIq+J++4SleW6UZZmdzCNmh82LX5PK/4tlWasp2hNz?=
 =?us-ascii?Q?dNkvTVnceV169sZCJaDhLdsHPXiRp0roaHgsR62bgLsbrpuv2kEMmIsudV81?=
 =?us-ascii?Q?m6c7rtI2vJjqjzYQgaFXpMQORmyz34PRUk8chZAGXekt3Cz0TLaXzm/gJl0U?=
 =?us-ascii?Q?8DjbEfxlunjOk2mzBxj2ZUxDo6PIYsFLU3KgQnnFMpEEFw4Gm3qnLsTWkltZ?=
 =?us-ascii?Q?qFY4Saqn85u8CzuV1McEQ/3kGDo17JB1YDHQDMNnqAqDaAOLqP87OoR5fpKC?=
 =?us-ascii?Q?NGEfIJcgc4dCcZD9TZ0qFoMCeiV+Bk9K3nYFF+91SmKjz7Tth4GrXHCr4vEN?=
 =?us-ascii?Q?iGSKCjNG8yV6AUa/CWeylY3MdTyQ3xadmooEb4nSyep1j1dhC5RMAKiy79FY?=
 =?us-ascii?Q?LXFs5DqkgMXyVPnF4KWId2Tr3bu0w9rMLp1TNiRGoYcYZGr8zj/elbSWDsjj?=
 =?us-ascii?Q?6TlPgTVOV6TBqaaWr9tIhwOMk1bz61380zYEVdWCbM8KXePcGtgis8oDJlGN?=
 =?us-ascii?Q?X7kVcAIHmauoWjtyQB4+otcjLgVzbPtPzTkuOuaU1lPvQOBOIKuM3/QbVgZ0?=
 =?us-ascii?Q?8yWXMzKJvXeURCrCP5tM22f4I7Hvyd7D+xevTs2qRo8PnliuQvJ7uG/bwG6d?=
 =?us-ascii?Q?s7R8PV4SO9m91rcAox7q97O0ea4/Bh7qzA6fSDokA1iIo8dYqFTXY1cdN+Au?=
 =?us-ascii?Q?jgfQS8KhlL9Y85up+dhrEwnkQEhhM4WJwL2IUDb2WqeybDsGjMm31OqUENqM?=
 =?us-ascii?Q?/yXs1ruLdQBRVmpQOfuM0e3kTgssHNh7D/7BPJvt8nvKEpIQGVZGlPoQWymn?=
 =?us-ascii?Q?JDyQ7n8w3FCFRINtlVuTBnPxx7bOuPF2rBSb/axP5E/alOkwfXzDjPtyA0//?=
 =?us-ascii?Q?re0vMyMLLq9w2No3qFZLAZnN5SI+ugjv7u0GOGM1Hp2Y1BVo1OdoHslzdqo9?=
 =?us-ascii?Q?gbTcbjsr5U3pCZY/vOcWPFbmp+GRfVMrgHzysxvl0Fcti9WvIpUetCAva6oj?=
 =?us-ascii?Q?6UQTO63Gk5Ou4PY5KHrT6kk04uQwOyBobPLx8RaMat7PrPhEurEF6aB7sN6e?=
 =?us-ascii?Q?n0DguffxGr9h8WVu4fLzLQea+NHyqkvl9HkmvPe69n9B1g78eAyW6zHLW7ET?=
 =?us-ascii?Q?x9aCP/Ew++Bd4x6yitQFSK1LDFEMJE0E8hZS3f4guRmNEgrKp205zORlKm4X?=
 =?us-ascii?Q?FK+3hJhxyk3ieDAHIMMh4XoqUlRl7aC2apxysf3yQj2XAUkv2NWB0m5VkKXW?=
 =?us-ascii?Q?gBc361x2iyycI72HuV8xH8dwUVA9RkS4A7HQNG0G3lrbMrIPlOvOOB0YR0Xz?=
 =?us-ascii?Q?kzxJGq5AqLY2OhygZBeNpFvCbwxv5ZOUXaEAc0uk/USdo2plGjpO13k+fnb6?=
 =?us-ascii?Q?+jrnBWvlIp6u+WKS6PUjWjjNNQQqkD7j0dHYfTk4a9vhOUreDy+GqGOimo9O?=
 =?us-ascii?Q?/uTLkoHOtrc9R1uvS8KEGOAqyMOockTgSVgOiWSJ42Mr+9taOvNwPNdIQCvd?=
 =?us-ascii?Q?bQ9eSOR9IpS6mMEb5hL82rfQB6p20e7RxQrPQQ1VH0/WIKa0OU6ojCFq1GGN?=
 =?us-ascii?Q?deDuXVdb/tA8WCaey1DR0Ce8reg8/URBxEqhzejPVi4Y4oxkQY9cfPNpu2Tv?=
 =?us-ascii?Q?ESaHwV9jblQ7wRRUXOBDitIMLmqIPMoCfbtL3ffcdyVlh4Py74zaKpZ6j/dc?=
 =?us-ascii?Q?DOHqPy5s0RmyzmSc2jLoqOZD+LhsHml+EAjknNFvmPEAkyJiG7DirCe4TGzI?=
 =?us-ascii?Q?pvh3EdIqEP80w6HkgmUZg0SZkz/EYYGPbx4CrrjxFjGJSKl5/oOr5xz+MBfq?=
X-MS-Exchange-AntiSpam-MessageData-1: LhRyKATJh/q0hmT3eUmRA4IT0xT9D+51TVM=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78decb7c-4ebe-4157-fdbb-08da5525356f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:32.6279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fquoG1uliQGx13t54BuRHr0o80v+HDCm28bJwCvueu4d7tM4EoZnCQ5bzs93XfuPOfSO3XqkQO1vvfXl0/NJNg==
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
2.36.1

