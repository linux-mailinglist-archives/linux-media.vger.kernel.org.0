Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25D4740A50
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 10:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjF1ICD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 04:02:03 -0400
Received: from mail-vi1eur03on2062.outbound.protection.outlook.com ([40.107.103.62]:65121
        "EHLO EUR03-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232820AbjF1IAA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 04:00:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHY8dQxu21Ovy25xH1m8yMkk7GC94pVlq1kjNCuhsKjVR4JofvE1D1Zlg31zN3L5q10s3POwD6MCB/AwN5xViAP8Nxyein9ywTgUSmTzNfaXrXqdFPRthZHDQy/qEb2ukH3sOaJl0DSZma0xvEAROM8Wxm/vDKXsj//UTHSaqpkB6IxaBveBKafB5evtSOSk5C8H4k8aT+PCNVe18dRc51sfik99dvumJJCQ+wc3NidmJr9kqDL5QFLiJnfb0o1w6E5Kg+4IBd7F/yalGzYSjxBqVhkeCeUJKE6zVZP4B+JplsXzlXljbAwniQymZdQ7M/rW4X+rMowHeKexPbFqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ2n4JnWeEMqgafZoLQ6XCu6gebAuRrrt/yVJ+PpQ6c=;
 b=crnCnFpizm0JpIJ2uiYK8u+Us+NioLBisH2of9jRS35mcJxIofdOkidhuIG9QMfr2TY8A6NlJwUliMoRXRAZxm5OecXBwCo5EgLoa3zruSTU0UzuLCgu7IhOCPlakmPyIC1MOXiZC0/37ll/CvVZQFiWfwvGX29Qv8qq9UHmJe4XM24frLv5rxEb4ezuukX1YwugeSO2oj2SKIsG2YwranE1sLAqziqUmKoRiG082odSBBYALmt3Fb7rkw4p0j2rN0l01bGcBBSQRsiLn/UTp+nU7XNU4lAV2076tBFx9JIQugrCN59GMCdD+hcy1R6Y4gBVyP8b4/llcept9pi9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ2n4JnWeEMqgafZoLQ6XCu6gebAuRrrt/yVJ+PpQ6c=;
 b=UCUuy512HyycS7Z89yNhii/OMC+nUjTCHKZLX2lz3gQ7r7cAg9cVHOM+w0RKqYe1ba72BZsl7YG043hSOJAq9jJvdSWBK21KQgPAiIHaGD6Vddu8/qQKWbH8qDi8Rx5+2aWpDjMqVT1/DuWtkmb3MglLQI3EYelz14FHlKWdYz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 06:38:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 06:38:10 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v4 1/3] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
Date:   Wed, 28 Jun 2023 14:42:49 +0800
Message-Id: <20230628064251.1774296-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
References: <20230628064251.1774296-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 6830d82d-7ca2-4a5a-b17a-08db77a23d60
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqZy4oRhtQjb6/39GqfrgjECPdUWaUWMwIZMtrfJMrokHOwB7GBc+nEmiA5ZDjADAoaadeo21cwPY579PYvPHMOW9CjCWF5r84RmmtTVgClf+GHB+wvtdWTaK9vtMUQJQggcNU8Muk2HzXJtbBpMxBEirRQzG3XFJ84IZmivXPL8WMhkKxS5GPh7ziPBi4KNIJ/r393CAlMFDLYF3aelA4mZk+zJgA3hWTNeAXy8QxmCVivwtA3NKviK5OzK5CWzq4hebLG0tSUeu+ZL+XC9+dCAXwGeajWqbdLm5ckgXuEcnnpLc2OozCZd9LcF5aguMZItKlG3HIx/aBJKfimIzEkR0VUADNXAb1mlYWQyg7jRAAk8nypoO4gQMPWsibOTvI3/z4ndUOvwQJ94LKbRLm6qjS0QU8ig6+psR1Yw1pfiSDbk/5FBV3EuOTAcYcSo02n6IfGjHuKBAt2+EKXrulruDrt9Hw6Y4y5NjSAH0GNzKd5bf2zwg8uYSOFvZhHfQzQmNaOewwymbFtOcZ441OLEbmkyiw0d4Q/cSBuZLp6FHcKvOMS7h3pYvQEv2eKMAyWlyB0nD8zhJhfWtpfgt/mg4uFv9oC30ss+LrNT3cIVRlaQAtXPqhG423Pnu4nS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(38350700002)(38100700002)(83380400001)(86362001)(2616005)(6486002)(52116002)(6666004)(41300700001)(66556008)(66946007)(316002)(66476007)(8676002)(1076003)(26005)(9686003)(4326008)(6512007)(186003)(6506007)(8936002)(2906002)(478600001)(5660300002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zYLtyPAXOJ9M02ZVoHTWjrQEhxI7xLb/tvoASE1IFonwOX/0rqHKJcuR5Dzq?=
 =?us-ascii?Q?BbI1DnYp8PneIkbhpEC0X68qDlp3UF4wXjV/ikqdjh17Ur9iqE8MtFeTnQ/r?=
 =?us-ascii?Q?IzBuFprVGnKSs6Z6eaz3tg1sSgjruu9oA0ApS+l9tbYatlvgW8c411lltDwI?=
 =?us-ascii?Q?5MddolxOH9obGZPBZcIjRBu7l3TWgx2OynG3eqs1Ih658676415u/Zq63L4P?=
 =?us-ascii?Q?dUsK4S+s0VMcJlf981NCQaXyd5ooLp/CRX7P1qxBTYTDhf/Cz3ZDDqW50I8V?=
 =?us-ascii?Q?kib+YYwy3Ycyxy9H0Z9HkwErDxE/lio5mG4HZR0J4s5IyJwaTRRQC5pRjgbJ?=
 =?us-ascii?Q?/7g9Faf6qfbfpb0bJ6V+IP5z5QLOQmdaWrYFYhytfzT061LRLgip/hnuJ/o4?=
 =?us-ascii?Q?QkgEkxBKr20HAkkWFl26QlY5GBQLhb2daCjaYrM/iUpWVRY3i3IxTAAb3qS4?=
 =?us-ascii?Q?cJnGEqcCSXTskkM20lM0fVatSvYG7Fm2ybCVTEEjMbUOBKt9DzKpGvhMRHJ/?=
 =?us-ascii?Q?P/qbaMzhkW9g+s2Mehwzc3QE6cFxXhGdQ5L5AZ7yX/IhXUsWMlYos2Kd42Qy?=
 =?us-ascii?Q?KtVsOvGtuTVOmJ/KFNS6aXDPMfDwXGPdKmjdWnQkK9cm3+eQ9IFLScxYMnfk?=
 =?us-ascii?Q?iOykNMJ3OClnnUZnbxLhT2vFZj7MrsVhf0SdeYPGE1OOgW161VD/w0v+1Cq8?=
 =?us-ascii?Q?d0pBg2Ln+y86r+akdZCOPR94yHwvOJX0d1COfvSLOtBz8EDBkUkmTPZbfle0?=
 =?us-ascii?Q?iGTPlGnAQFCkZbtfX2TaI2x1O0/6nnOF9p40nCkrLDO+nMdwBvNIAztW83/v?=
 =?us-ascii?Q?Ra0d+fAlm1D0ScCFg13bBlgVFpSdNPNB4kW6aHYOMKIkw7W76lqs2hbX9tky?=
 =?us-ascii?Q?paRPEckcZWXkZpgPGgjs8aA1xG0STHHK3bYuspGZP9+P9RfgybLk2FNrhLNj?=
 =?us-ascii?Q?PU1xdRnL0Dn/eHoJ1Eq16gNIUPtifYCgRwnxw3dYbmtfN8P9zA4lL22w8gHz?=
 =?us-ascii?Q?yu46Xbl9JQXzFP6VwkvMseP6rxCwuo8WmOj1QVp4vOgPUl7nXYZeS7EKDOo3?=
 =?us-ascii?Q?ApgieLm4f47GhjuTD1T7W1dZ6d7Ckj/cHzHjgVE5HAwjPkHcfxS957AQMEUB?=
 =?us-ascii?Q?S/oNAHsUmtI+As5megR0V4hnf8/Didpn4cy6ePTJ/O50AvhEysLN5U1UrQWi?=
 =?us-ascii?Q?1si35fN+xOcrWuK2a9TC6WpDV22/6S7Zfv4Gf5dICjzTm6c4SUFa1zI+aeg6?=
 =?us-ascii?Q?C4XPOMzTBgFIjss+reO/x94E0xo6XevCYNXTLekz2f6Bu3UcfI1OtIqc6/fS?=
 =?us-ascii?Q?XB3+DCwVY0GuIXKLErf7wa2q3n6tR9eckcd8a8j+D0147lIaK2uaXYeBln4/?=
 =?us-ascii?Q?sj0+TSLS47wcPeRXpr4BpFaLXa82MTDZhVkzAb6mswLtDJP1sGJdNa2cB3gN?=
 =?us-ascii?Q?XJSsvhNOTEhEY4Y7HJ7XaLoJe+2Kod/8b7jnepygtDr+45jIBnF3EbcVPpdB?=
 =?us-ascii?Q?pU+4x5FVgbLaGr41PZx8EjOhMzcgxfOQnUP2qwkQwb2d+nmR4wW80fbsQrWc?=
 =?us-ascii?Q?JIJJh1EyP43LGu8erdd7pORUtnKJXBoaGv3MWdDL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6830d82d-7ca2-4a5a-b17a-08db77a23d60
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 06:38:10.4516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gqe8Tmj8y/rjJu3EzkC03eGN1xCWiOwfNdYUF/pBVF+SkG7fJeUL9AaN4DYGoqQXbnpQfd/Vnst4x0sWeyKAJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add the compatible string support for i.MX93 ISI.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 6038b9b5ab36..e4665469a86c 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
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

