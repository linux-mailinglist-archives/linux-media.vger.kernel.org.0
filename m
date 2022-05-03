Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0103551816C
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbiECJob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233848AbiECJnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:43:55 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C8D381B1;
        Tue,  3 May 2022 02:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYIOepKXY+fhqVJPgqzWF4lddUOLdiXv/I2o2vs61/Q1tSqllBE2KoIJHcHBxr9pPgHRiZ3jXvQMjLGiCPQC+8wCijIz1HCHRYdC5Lh9Gpl/EqeLYnQrqxtyTfAoga3uZtmo42RplgxmCMuw/8bEoEqgLqm2NfhbDfKepIqWH4ul3SNdZo61QbUJL3lW0Vcb0ZDmJvFXcXD42BS3q85cqmzw8Fq9CNC/Aflr/Ue7qhFgdFrjNzMdt3kYJeqsC6hkf8Qltl+Y2wqa4z86szGN9dgwMoeNHJkAUt3L25muISj/hZmtmPmScFnzEdVtMnvICvLoJFZCjEYmGR0ZNiFPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/NMxiuvers4CUp3LTTdzKubv7y9Onyr7UrDUHinEZ8=;
 b=DcmxF/oI9aj1BjjcvCyLMS6r58aGbNvaZp0blS6vko9McULju2Bu8ncoZfBJUllpopL8QQyAKQMUss7XCftV5Osp7rhHrfzvwQcDoS6fAamlcSg5rJmx6C/yJ2p4EDor3+xniY1xmp0G12RQF0+jHyHo9uuT6glE/OvglmW5Dt8zkBncvRJjk3NofNjS4XCsTTymcyWJ4u7Wv85Rxac/M3fDj856aTHx3s6w8pP/ccOrR6peAB7Q0j3MSpQNmk+a5dJx/eto8epVsGLkbSPXXpKAkvv2LevkIogQu26AuTf89SgwbCWRy065BKBorwrdyNM7sJnsT0s6i1N9N8OBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/NMxiuvers4CUp3LTTdzKubv7y9Onyr7UrDUHinEZ8=;
 b=SWgsZchIPIUbxcC0rCn2bK0tUn3y2Lhwr8Q1x+ETxHrn2mMqJp0kN4G9H6er1hkGTKn2VpDSNipXGLSpcBymd6CzFRsLIVFQKT7mOeGSuYo+WE8VcTCWhyu8etFjMiUrmoDarGhjpDSzb4ByNapSzFyaPtV/k4/Kw2+wZX/X9ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by PAXPR04MB8878.eurprd04.prod.outlook.com (2603:10a6:102:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 09:39:51 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:51 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 7/9] media: dt-bindings: media: Add i.MX8MP DW100 binding
Date:   Tue,  3 May 2022 11:39:23 +0200
Message-Id: <20220503093925.876640-8-xavier.roumegue@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 22f7b813-9e00-4e72-1427-08da2ce8df1e
X-MS-TrafficTypeDiagnostic: PAXPR04MB8878:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <PAXPR04MB88787CC3EFDF635B07C079EFBAC09@PAXPR04MB8878.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W89viVG3GTsnFiOleXBhWTBk/X6HnDwye7E+gIMtqQvrHPrFi/EXjG+QWw1rB5OQf6SjSvWQLUlzfhtTMvyODrDXkopxhwA8XFY9rQ6WS7/KRE2NThVlOXfcU9/N1a1QzZIPL0Cox7DdP9Ub/lxdjDyJhlTkDbq5pNxIa1rs+kMq9s8Q3PU67HSspHBV63NO/4WdzaoovLIfoG+k/horLFBQ+3dCpXdUbxLteSMN+S/Qjnye0Apf8SERcUhwy0EHcKeq338f9ZEKu6ky5yvHeSksqJfesYjygCJVyfpUo1MI6TOR0yNtc7lW227WGZgl0iiyq7RMFcKnTalU1Y9j4L4wJnJVoSEpx/LAv16dxKyFCDk/npajJb6fLMxP4UoTE0JpDw3lRRJLsecUoFl+1oWKZT3qL/Qwpf1PGTEZfFW0Ed2vCqNlA7+we9KFQZZQMZYldjWwIH+1JX8oR/fymJo0ILNE6NNxFH1MdkfuLntTWHJILz48ngfpieRfYR92xzUDQ5Y2NGFNyf5amyDrPsrFPnW4fz3dVNI7IAux86bWwDCxYBeEdSdrOEQuR+vCUzUNzjawLTAopsRoYA75GTRsiZ4J5v1daIIarcCkQwX+BL8gbKikurho5VFFvG7Rv2AW53mA/6EVPZ0W3hUopuoDWxipWzPTqQ62GBonkkLQ61ois6uJqR1ymKCSUcvAeDMlIRCAQtkByhfmM9deEzxHg5Gr3+fatFUfeQCd8Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(52116002)(6666004)(6506007)(966005)(6486002)(38100700002)(508600001)(83380400001)(2616005)(5660300002)(6512007)(186003)(1076003)(4326008)(8676002)(8936002)(44832011)(2906002)(66946007)(7416002)(316002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/uBg2VWIDyFtBqbn7SU0K1eaOFzJrUink6HsKgmlAkRr0lPqQQB6lRTU73ht?=
 =?us-ascii?Q?z/9NmI7m5CVlYEwzBCTYGzJ7y15RAn9DjwMFS/pErHeqqDEbVGvGbkskfz4p?=
 =?us-ascii?Q?GyKdiBox/FtQ2yISBREemMaYyBfDt5aJJJ+vN4wAIpMCWPrjWRiVsD4x3XOy?=
 =?us-ascii?Q?ydUHNNMyPyrN3lXJ9Hn/SO4g7BYRNVZpbYbw0/1yCbjRD6lTWFHIPd2lh9xl?=
 =?us-ascii?Q?ZpaVDiPKdg4q/rRd1GSC0qWwHwYMvwqqVhPXu1RWwVDjhXmkBjy6cGq2mNFY?=
 =?us-ascii?Q?xAdDObBK74scq4IRcv167ZJ8xb9l2fOyRvmo1p/Z4HKn45qpP3hmK3yg+/JA?=
 =?us-ascii?Q?00dgNGc5qs3Y5Ntm1sFCSusmKJtTVcTCFCwhO4qOFX+Pmk9kfpXgSJcwDsdJ?=
 =?us-ascii?Q?gSqJ5YS6cwwVydgqXiafcAuK54P6KsFLIsNTvQYunO6lWYyjw9xjzKncSYcc?=
 =?us-ascii?Q?1yZDrdisoME1J/EVn1OGyA6YRB91N/BuKrbgaCvc35Taxdyk5d8ImkPIXv10?=
 =?us-ascii?Q?XMIP/FwV/ChpgBsJNNU+uyyuSeDLQC3rggWrsHKRcXmeRwPiatcvU1fN0YH0?=
 =?us-ascii?Q?S/7oPvyina0wQLmw49CiMqQYZZBED9xZxG2bZEFfnB19KpHi9U/bN/Fg4ZPB?=
 =?us-ascii?Q?rDbTg+w5kd1uXD+4kThVqQQl7R8qkVtf7t+CP/uoG+y48Mjp5/ouMa5Ewlme?=
 =?us-ascii?Q?DIcg0Ix9eOLdHYuWY08n41NeConWkOt5KAR4PXRBtQgAOAMWZHzX/6agv7Py?=
 =?us-ascii?Q?FdQpoDbTJcyQoA/k8KSUk/xCOuW3bFPI8J7m8txt/ypWWxWdXaNHMcPI/387?=
 =?us-ascii?Q?yeQBzQnMkxlqC2t0OQhLhL8Y6F6UVluTcaI+H/FKX0SwZIeMBZ25LNP6RPx3?=
 =?us-ascii?Q?fnNXHGhWbWANp1SIDn6XqDJ+YcE1qHfFPBkB7AUv6EgQOqTAQ5v3aXdEseBK?=
 =?us-ascii?Q?nXauFMyX1ujnbcbRrpGg+1zXz87ah9tUX0UZvrTN+OjsVEK+XveCz0AobWoV?=
 =?us-ascii?Q?EiUSBPQ6ZLYNwya24nU48x8/SOqEDuL2/m5KS7EDzePma+nojjkE4l86CfcO?=
 =?us-ascii?Q?ErIC+1bpN9J0lkopixmv3mJ7y1AuK5SEMNTtxPxPn6/Ereh7FZwvE8r7iZvq?=
 =?us-ascii?Q?D2v31WUHQQuYQvS5Ke/vLP+e0JqNuf+5NWUYmxcrBPlfo11XXFDxmCU6zxVX?=
 =?us-ascii?Q?M3lOs6NzUyXRiHY2I2V2kdWJ5athn+SvrXIqj/tKfPZFgjFR0NPef2eOsykk?=
 =?us-ascii?Q?gaFjW8F9HwDjlnMytuNQfpY4Qh3HfAovlvYgrzPPutXZRUS8wjp7Qo8+QJBg?=
 =?us-ascii?Q?cUOXARrsIqNhyv2zFXWlQrpy6xVMTo8BDuuAkog6Uq7CrRy3Pxy4r+YAXdpN?=
 =?us-ascii?Q?ixc0VKIPhr4/WRVjXcnhVstdl7xuggqA9U/mtsT8ph27/VDT8PY0sTL59YL2?=
 =?us-ascii?Q?IzQI/H9ML2upbMFR3dpj68V1yK8INCOkr3XpwTzj9pGoNKqPkkfyfb919Jxz?=
 =?us-ascii?Q?mRLdmU3AWmhAdF7e4mfTfb2fQAuwPnGOOYtwO/Dnuh8IuqMKFtS6FqcVM7c9?=
 =?us-ascii?Q?6bYEs9V8rUSmAJ0Uo/XiqwfLSEKeo7gonW1m9/wf/qimVkwPKnEmxS6bupLM?=
 =?us-ascii?Q?UxAaBBiy0pVj1UeugCcizsPJDBc+Ql16OSe2PlTq0mJtIUL/SrCyUkcV/en2?=
 =?us-ascii?Q?85tjHwkqWoLkZLhoteH+hqR4LspHbQtBHOGGdzqnqDLD1b3QNntQ/S9Yl2LI?=
 =?us-ascii?Q?Df+xs3fq5MqWAVuvYFxrGSLkSeartVhgYVGvBCouZfSEGxr1bKfneiVECWP1?=
X-MS-Exchange-AntiSpam-MessageData-1: UcdqMGaOErf+UKHn/D/4WLhi34HcIKrLmGU=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f7b813-9e00-4e72-1427-08da2ce8df1e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:51.6015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ti1+uapG9n/Uyi9gSCBF6ZcutrnLwubRimIpp4ldcyjEjHfowjIrYvXrPihzI3qfaXmk3mVfarBYflBNE+1Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8878
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT binding documentation for the Vivante DW100 dewarper engine found
on NXP i.MX8MP SoC

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/media/nxp,dw100.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,dw100.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,dw100.yaml b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
new file mode 100644
index 000000000000..21910ff0e1c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,dw100.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,dw100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MP DW100 Dewarper core
+
+maintainers:
+  - Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+
+description: |-
+  The Dewarp Engine provides high-performance dewarp processing for the
+  correction of the distortion that is introduced in images produced by fisheye
+  and wide angle lenses. It is implemented with a line/tile-cache based
+  architecture. With configurable address mapping look up tables and per tile
+  processing, it successfully generates a corrected output image.
+  The engine can be used to perform scaling, cropping and pixel format
+  conversion.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx8mp-dw100
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The AXI clock
+      - description: The AHB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    dewarp: dwe@32e30000 {
+            compatible = "nxp,imx8mp-dw100";
+            reg = <0x32e30000 0x10000>;
+            interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+                     <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+            clock-names = "axi", "ahb";
+            power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+    };
-- 
2.35.1

