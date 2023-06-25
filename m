Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB5073CF30
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbjFYIF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjFYIF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:05:26 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09105E75;
        Sun, 25 Jun 2023 01:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1oLhsOEqQ0MsZmnRUUyC9Py56QL8ntOdpnwdbAd7Gr+h1zhxQLMtu9m/1sCmbtnl0WATThNVtYhu9p7O5QkPH4DbpJCAiOaIFV60K1KnsXhhY7nVj1I0WWJkVvQAXChxriXpp7lRMvTsU2VtixsvTp1vXaOIybODPAsWljzixQXlUm7nuwDKa6E6aHagFNaYDUS+cathSQ6xGvVnZh2LXMJOP4eYHOCjDtekU1QrOOCtJi9hhM8GdnNUbYS3qX/pwwb22lgZ/5Qc6qrYb07FUpP/hDKp5ZMY6kU8jJaXCyEJsTKk3bfkeIpcywitDeAlxxEc4ptxuetB09FK+4K9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VuscsxdVKxHWUm9xJLT9I47Jik43Opw+YbPEShMw0c=;
 b=BmeFFChAdXsTnIv+IPxHE3/S6NkKVDKOnot9aPbWL3ztfwum7FkcFEjBiueztlbwJ9SgAUQPdEonKjpzpSBHhwLAjKgwcjnP1QB1vf2vMHWfXznQPoyrsBB2IMakq+L4Lsb01t9ts9poOR1rc37z95F5c/4SakX3Ur2/dc6oqXHqmHGm3c9SnjAt5Jy5vX3smSyhOwGl93b+mgkLTsSZV5LMZOKdusuy1xulnE7jClVuxshGFBFdXILIKm4Nn7t2eQjPrR+rPXU6IWeIJ3DtsQ6ySbAONy19AwoFLx0VE7kvO67nKpmU8k5uzcqCUydOIlXjUAI7XhwOUy+KA41tsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VuscsxdVKxHWUm9xJLT9I47Jik43Opw+YbPEShMw0c=;
 b=MBMZtg2IPPnAjPC5r0hnQBttt9K7AiZrvtOJnwzCn0RdYXV9sp89AZweIDK+WPmMQY7+xQRx7/Ve4SJTrBWYB6STBVEmbKHfb9U8uzDLX1B9oORqaTlPcloH/nYd34/7IPLOebocVPSwNS//i8VdZTc2ulaZfJRZlsfeWU1KLtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9279.eurprd04.prod.outlook.com (2603:10a6:102:2b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sun, 25 Jun
 2023 08:05:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Sun, 25 Jun 2023
 08:05:21 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH 3/4] media: dt-bindings: media: nxp,imx-isi: i.MX93 support
Date:   Sun, 25 Jun 2023 16:09:15 +0800
Message-Id: <20230625080916.3553621-4-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 62205275-a99e-4a84-1324-08db7552ec0b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zi99kMoCyjCGcNHKGjYZW9Wt/mnGI87KPYpWW9MWt+69KP/ajcZcb3MZrBEl2z+82vPvg9gzq6sJzsCzeA0lk1g/GXxdvhDIocix6XZ2ubovgwg1+EI2oIIZX2K5s9/xliqfyIyi/bGeptVTkHg7WSIbTwfjv67LEhh5F5ryW00XYAQOAOdpcnEurQpnm6V+0tPhZlfeNB7L60nHMKzUfTEELuueYRPcyKjocYrZWnUGZ6X0m3Rhcntio7uU2KlvcyVehNEVRy8BuTz3TUpKRXUneudnC32rda4CIe4sUWkxNrMZSRApaLCbSnlkpTv+BM/cFypBuE9+ZlVIlHoyQMymbGrnHWdZgevtGW0JFTr6L8w7q/HktTHOBZzacFcemu4W80vcIGfOdcFnxZgeBo1edBuIyg/bpMOFTTAQwoGBsuUQQ9lHJ+G/W5u/x66iDuKDfGBy2aIueKyAxIGjE9iIgZX0aji+z59tiCgz5EhclHmldkS4OCINsQNvb6u8U+zA95K5u5ewxZ5QC06pJvqU67bqIBadvgCQ3xcTNlvTx9m+m+qtxER9xo844mI9ib/9FOEMqzfnLKeu9QP2ABnPVmMRQTPYUl7eGY8ojhA2ERQHIlZ05UedlZssl4ZB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199021)(8676002)(8936002)(66946007)(66556008)(41300700001)(66476007)(316002)(4326008)(6506007)(1076003)(26005)(6512007)(9686003)(186003)(2616005)(478600001)(6666004)(52116002)(6486002)(2906002)(4744005)(5660300002)(7416002)(38100700002)(38350700002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8N9BW445tJ/ev0Rkw8ghmY+WZopD9sw63GZFEaxJMxf/Ukd/PuOBU1j+4I8?=
 =?us-ascii?Q?x/dzpddOEUk2IFEaOIxESCg+0+YU2o9kq/KfsCQfcJ642Ro5M0tPfQHXuSR2?=
 =?us-ascii?Q?FhjhxyRgGSjVollaQUPbQM82urh5tlZ0FXtVRLkbqPCR4ImDWqhnF6vsIW+a?=
 =?us-ascii?Q?9rfN7C5K2hAiIiTRDjk8tN6XYiXUPuR0G7GRaZmfXi6UeGdmTC+BpcK7/wjp?=
 =?us-ascii?Q?xONSbOLomjCtVc9Da1A1wejM1NpnyyA9Tl4v40WxN5FS2RawOWAUTJ0i7gQa?=
 =?us-ascii?Q?Bl0aDEq54jfY27JqyyJF+/PiqUHwoappWibkTHKEbrHOYe6PJMwpAbPEDmXA?=
 =?us-ascii?Q?3mhTAGRopF+3u+KEK8bn+m6bSbUuI7Psl3kH0pyftoz1jJPazU8fAaXuLxfe?=
 =?us-ascii?Q?T0/m3PTygrUG/n75FSJQ5rRofE8OcUKbeVWta7cYunLuFANrWQJJy+2hrGIy?=
 =?us-ascii?Q?USRsgIBR4giwdunijX1nsyMs9ymhY0ZBTvXpFJTfkhZsrj/gnXH98Gkv/cqm?=
 =?us-ascii?Q?4Jz0X5LMtZGUcWcPJV/iE0AZLrczHdW1lyi20mxxq6BsoujWVSBYZxJHm4F4?=
 =?us-ascii?Q?h17qGGJPfuA+gpPFIfXkUeXSR2GTkGFL7+JLQI7wjrruLYoUKgNF0d+GNPo3?=
 =?us-ascii?Q?urL0SWAHWAQUSVf1RwdeKhKZ9QTKMMjPEHTn7q6+37L25OMVIJ/gg4s8LWON?=
 =?us-ascii?Q?3kHFSj8Uy0zeDAv9d2fB656ca4UIwgpbZVH5BrB8Ifu73+cTeueR+2XIYB50?=
 =?us-ascii?Q?l5WhjXPn6scsDnJmDojjjEqhEkgi3aJj8QaIGZZgYvp8dZDrxYUWnMwjVGce?=
 =?us-ascii?Q?1Jr8bnH/WmZu52gg/y26JWc0w5Qm7+GCPSiLTvBahnxTRq8mob92cLq6R5i4?=
 =?us-ascii?Q?wU4vunQXxAXnG08elY3DUfx7rzgng6qylq81v2F+fg2j/W5kF0jMLA7p3KTV?=
 =?us-ascii?Q?cX3qVrCWWLjFmogXm57xESSLe40UyVE5VS4fBXFPURGbJaNfOeidTcVb2TmB?=
 =?us-ascii?Q?GdNiLDtLgaGVdD7+J4f2SkpBileI61smWQOptU7IsXt/YK53f/rX9vrY0Zdu?=
 =?us-ascii?Q?FJro5QIo0b77qCYVHhs/Gc48HKt/hkYy/zI8VyOjw78v6kgjxHPJ1XCQjKhK?=
 =?us-ascii?Q?s+xIi0KltuOtrJS78xc3tBiCaXbYXJrqENWHj4i8tOoyLkvRFENUoRpQnJMQ?=
 =?us-ascii?Q?7K6jgtS/WzRfeEJxJV/9D+WHEQ1Nrq8QxIf3dMGqJZb1lLYr6PB53Q7BUgh5?=
 =?us-ascii?Q?S8XgU9fhtovk9qYWqMBncF9Go137G5DPconFx7pxiddzBnXIsN3GrxGlhVsF?=
 =?us-ascii?Q?Uaiue14m2cQ2vxmj52XrNCVpFpCDKc23zI7bfjJOD/KnNWvhwpnrMjnUFWSZ?=
 =?us-ascii?Q?tgwPJTCQ1UOJAj1RHuCmPb6OH+uE+utpVr+jRqiyA6t3KzaeswrLCTpaFAHt?=
 =?us-ascii?Q?QYHTe4HnzzY6dvvRkUFMY5jBDdRFKDwJC9sW7aVtocZlKG4yPOnBhlEZPDJ2?=
 =?us-ascii?Q?/pNNku6RzohCHKXh+rqK1Zha5bQVplsgAxd8qllywT39l3g2GrcGlValg/a8?=
 =?us-ascii?Q?v20UdIIlZyyD96IGdeeTagbqDrNIFrEMBEThEw4V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62205275-a99e-4a84-1324-08db7552ec0b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 08:05:21.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ud73aUL1WDfuh4YukJ/GG1x+ELP2GgYK/2j4ivMy0HhKk5YBO4aelFJBjMp6tvK2cTMpMxPJiFz0kvEkchAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9279
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add i.MX93 support since it reuse ISI which used in i.MX8M family.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/nxp,imx-isi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
index 1ce9440bde32..ddad1d8778f3 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
+      - fsl,imx93-isi
 
   reg:
     maxItems: 1
@@ -72,7 +73,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx8mn-isi
+            enum:
+              - fsl,imx8mn-isi
+              - fsl,imx93-isi
     then:
       properties:
         interrupts:
-- 
2.37.1

