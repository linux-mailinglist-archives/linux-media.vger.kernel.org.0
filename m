Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C026D4E9912
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243696AbiC1OPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242898AbiC1OPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:43 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF31DFF0;
        Mon, 28 Mar 2022 07:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtmvPKcplLx6uyVdrR7dyZjfC4IzFpOZ47qwCtGzQdvxV34C6tyTkHotVd45EEfEzRUHSQX/k2HNXR0R4V+TLDtd0CjpEVro8QLffOVEl7tOO07yDIP89rKEEW/GMEvBZRB2RLhLHD+D8fVWsmTo92ZQuS9DBghsmyfuCA7AG/A47oLCrzDkHl0ujr01WmjxBkcAW3a1h1EGkKZ25Lm8/kFjNxR5ZUvHK7hsclyxAjRHIQpD1TrD4ABtOUx6VpL789fCAQR6T9khh3GLauFK9hSLSWubowNiwZ5RJb6NyNd6nAIHWj2U/Dm3i4vOcqujjeG8kz3YnXEQNlPzu8TE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=aAMaOWDzss/pvZ7fOHCfzSPX5OhdhrgtA5zoBhd4k1GNSFNs00myVakGbdcdI+jj3S46m1ZWCO61LwjWwwuKkZ25G3VqXdm5FRTqSQDvDXpeaZj+d5OxXgGp1lAgJ+FGqkSjfYykUi7Thz0BqUP2YvvoYtlma8ByA/9sFVxKm0ji1upiGF2ipiGbRDcF29bDotITRBkMPo5A+vv7Kd0ISrXLqQnFEAh01y/3vq3xuBxhC9JL9SkDcArlc5QOEiFVjrpG59a1dKpdB3wZQUDezJmRmkbnxrhzgi0u/SCXztCI27BKGgBE5pNeptnpQA1SdB9eAG/cBDzEsymuBnjH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=IcVn6nyFoE/78VcDw+WPf0GdOr1JsPNGxISRYHSzqiUEAzKXqSgkpzb+oxEzcmfH9fh9zoawSpII9fp4KQIOwjHFS7BvxmjyIg48+ctaxtBhy6NUF1NnOnwfpDaYp2DSajNgusk1Jz4KKCODpqnHFpa87YLEpIh4C1w0wGx8DzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:13:59 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:13:59 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 3/9] vivid: add dynamic array test control
Date:   Mon, 28 Mar 2022 16:13:03 +0200
Message-Id: <20220328141309.177611-4-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4a56995c-21f5-4f63-0b32-08da10c53399
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB441817F35D599044FE5870C0BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzPgF5bspNaIPNuxUt5N867HivQle5LHmDqkjPk0NyM9JCZUz1tqdF9o/xc3LPuEd7svUWnL0UAGPNMCHKg95Ne8uitecuPaH57e2E3500Ea9hQIukMbSP30FFUkhem+jN6F0reyZjT/c7KV4mfFVtF7h4gGbLPVN6PnGFFOsk0ryDueJNPLcoV0XHB7iOQGyAjdUDSoACM4NNJelEjwSBcgG3KbEvJoGMvmGqjUbix6JKg4k1mUCSk4hjhxw68U5eK2C/uJ8H02zvWpGM7xevxlvqHAgzijkjKSVtL4zAkfyQ/KAUU6EVShRu0L3R2LhTB2YwoGAuZMjkOu/1Wd5gTZIPn2AfJKqGe1Qa/xPqKplYSmk3eMKn3ATDJ+wrKZJHnDqdoJ8QGmw4khweabSPeQTPLUlZbKiZi2SfuuNBFVz9mtPDk0qm6Z/yPyH/6qE8e6zaqjdgCTMDfi4sXjTqr9z8tb3xZFra+PkyBc7tZM/RNTnWWwV4YPAH1fJuBHsFNX4TiWYceTiPCsANLyE3GCs/15ulJxhxR/IvZO9tLvWmYfg20h3P6lk3TZ0qrsgT+SU2OfAy//7jdy4EBLQGLOM00ACjaAS2g0ZSoXMY4zJ1Gmul5IGMsEkwcjZEue1krMG3lbZ8bNuhiyk5Fo9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(6506007)(38100700002)(66476007)(8676002)(6486002)(1076003)(5660300002)(6666004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hAn4yS0txtZ0SOeXTnC9P4hWHfBZEy1RMN1jNrevMhDYp8RknbDRdurxYwAP?=
 =?us-ascii?Q?x9zGydhpvjg9hkXKvtt6v7drAuRiu9eDWuxpMm4nsrUGmygfkKlvBhrqAtWk?=
 =?us-ascii?Q?5tz9TG04IiPSZhX1yB519hSENTKuNe42yXws3EDBhWPcppB+b/EPvEeR1pOQ?=
 =?us-ascii?Q?T3eD5Tkzlj8M9AmfjajgXioPOt3ofS6771z4d7yi+cCbRAbeFjHzwjXtFJ/N?=
 =?us-ascii?Q?+Wg/pjbrO0nLYodXSga2aho8VO1416VEDUr7pmB4V4+vK8pwu5Aq26907HQ/?=
 =?us-ascii?Q?VhAaSDiI70ph2JX1VH/4jCBk+C+bxeL9luhbYK4ohMpVTZO5AJJxgGvpE2pC?=
 =?us-ascii?Q?5qEm8Pqb790pY7boWxDtA7XHXTcY7bKLXYjacQAV/GL6bJ32YVxOw8d3r9iz?=
 =?us-ascii?Q?O7fKvf+DUrYLuZUAlSJi/qK0KY26r6d/2DCA+7lucMqTXBHoMR2taLBDsqq4?=
 =?us-ascii?Q?xCu/7jAHIFT7P9nMktRsFh0Dl69eYujxSz8E0PFGSHamaEvcYyyW0AWzQLR/?=
 =?us-ascii?Q?m4ze3k85DocKucxyncAAEz+viJiSnEPPfIHvAEizZFRQMPUuxsTl+VY9qBTr?=
 =?us-ascii?Q?prNCLJFNihF5bNOcO3vfWhKeLrrdx3xHMWIN31gaSLBEDzhL4oX9+3gzR1SJ?=
 =?us-ascii?Q?gt+BDzSqqy5+HrjATjOPbvw++6a9pnsfqUmSSTSHcYfUQWTDK5pmq+WsPgXc?=
 =?us-ascii?Q?BM083nshmri/+PXmZUmuF6xN2TC5nFV+4mhYji+DEn2CuoWMDa1ZS7qsXuVJ?=
 =?us-ascii?Q?bpikiKctPzQOHyaKKlgmQE/3b6t+1Xiyn4ns/ihrhRkXjTDEPpe+0b61J77B?=
 =?us-ascii?Q?uGuxKm33zcp3lWQwDhW5tfBxRUwCk56Tlg1eZKpmZbZE2kJxsIklfBZX3DHo?=
 =?us-ascii?Q?6wok0OxITA57kvLKxTczdU6wAyvFjXnZL/VdReTVojS5Y3+PZR1fiXY63kKW?=
 =?us-ascii?Q?qnQG4xZH7W95slGxPsJTdnGXAQHSYfBgJ9gGh30HXyNYTHbviEb9QWtgq44f?=
 =?us-ascii?Q?f+/kt+n8t0suhP+2Pqwb/l3eCkF4CcGUvKE+2HDjcKHg+hKVxgcFdqgMuKsa?=
 =?us-ascii?Q?gDfSWZ9a7tz41yID0zbPOqasfSEpEROHzqhQU5MlNqsfu078JhWSfVFKKG2r?=
 =?us-ascii?Q?IE9JH2TRS0H4KS2aiylbKXeCjb390vdssihBKEepsWiUYsSjDURiGcWT23Hy?=
 =?us-ascii?Q?ZgP6AbRBNOaWHSsURsd8a7XaNMqfOwOtbg5VCDlY+p5PEpLdqwLgeB1AiQSm?=
 =?us-ascii?Q?VQ/1NZk5z23jbNavFMbkA4xBUfcEvDu7EkOlm+QlK/OGeKIcQ3rbyho23eHi?=
 =?us-ascii?Q?qG48Iq4/rR0INByeFqQncconfdltrf3uNzCgRkM+P22k5ycknzNTkvNtFugx?=
 =?us-ascii?Q?xTob4/1uD6lflYJY0b9qt5lRe6s0sCV8/ISIWmtMZMUSN/tNSHCz7YYGVtRf?=
 =?us-ascii?Q?zM1+QXiFg2/powfIJ6TIgr4bQLCR6dY3lTQH0r4Qlz+TlmaUdTMt4aTNCT6r?=
 =?us-ascii?Q?Vnk0uXjmGvVkxiTxwGTNRkMD203OLCLuhjGdyxn9YY5UTGPaTP5m78IjOJGv?=
 =?us-ascii?Q?EBwuZhItpR933YwZyYnos4XbRst2J0I/cMt4EXnrH9oFEdXlN4NVo5Nuu+lZ?=
 =?us-ascii?Q?CnOmxPlQMfsiMpd1x/ziSdESl2HIQEyKIZRjigtngm8O4ZhTgF6l6amx8BpQ?=
 =?us-ascii?Q?m6fiaGof5qvskBJV8GcK1CFLWbNZufPXSbjjbpnaNF845O4dIJujui5ZCvei?=
 =?us-ascii?Q?dfPyOBfVkMP3lAMZDczEMBJT+U78teEXYmBbFqQY9mm3XOGXm3bRbFj7igUV?=
X-MS-Exchange-AntiSpam-MessageData-1: sa+80sbfQcGSJZ0k1co+dV7EB1uqJsSFH4k=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a56995c-21f5-4f63-0b32-08da10c53399
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:13:59.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBchpxqjCOU1hQB4qZAt6PDnWP2Tsv7wtvMaX4GCDeVW8fDBfRZi30+ouPrT+ZoUBNWl+VrWdlMarwi6n2bHMw==
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

