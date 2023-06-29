Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86236741DA8
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 03:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjF2BcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 21:32:03 -0400
Received: from mail-db5eur01on2070.outbound.protection.outlook.com ([40.107.15.70]:23617
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229533AbjF2BcC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 21:32:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9Es6VB7JPfqeWl2j7tcD6KPkIIkiUAU1T9PQcvu5/2U64N+ve6teb1SID8ANiJNPifvPGB1VstQCFgUYEC9i+JplGvOEJP2RUGzMX+d0LYlqRcnWgeVrdCwZ6nG8eDP0cCSQVGhyFNzGcFZcB6eqr6QtdljAtuGvSZvhUO3czFV1SV63cdvyV7CzYqeZ4udbl2NI/mbcowP/FdjbirJh9mhcZ33VljvdrKOeicqY2iYbwL/WsnziSvitDQCQI6e8BF7qNd9KgF3QQglVBzqxSjE58/IUS8BQ39J70eOi7S2arf0cqGraS4ecmzo54o+g1rCpyewTUw11856cbVGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ2n4JnWeEMqgafZoLQ6XCu6gebAuRrrt/yVJ+PpQ6c=;
 b=d9RhFHgqUceuhRofx3YJdemxgGH8My/6cktKJiqYpev7eYNluj5BLvB3oYG0KMaywx+R89NNtPl419R8nyHkZ6elm/KqFwTyvogWDtlMVDyba3pN5mW52fmFgZP/9WP3b3HXdzsFT+WtZcoR+ItO848aJWxmTE2QbZHJ302qi5fFy3SbnPfWujwhMDPB7n0TrpcbTeiV8EVENqUHIxBVoKdo4UBrMBcfk1DkXrABwVagpR8Cu1qHQs02DV3M2Ib0iuN9GpnBUwMeI8ur07U6DrrO2BEhWAq8qR26aLHgcZEcP6sfAJwroQ8Nd1m9CW0ndyr8NTqyt0HGzL49Dj46Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ2n4JnWeEMqgafZoLQ6XCu6gebAuRrrt/yVJ+PpQ6c=;
 b=T2iNHm+/X57tTx5p6DG57bSUmVJNz4MAnQ6pyNQIqscBM/rOKn8s6mkuA7rpjkowUi3cMCl+Cq5rfNOVM0h4EDGrBw4OIDDcezjUxkwYZvvhYNFA2Bvhnx5Uz+/3cMClMOWpC5oQhIYmsgwPf/pdc5kvPp9eBlSLWulQzFg7mDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 01:32:00 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 01:32:00 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v5 1/3] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
Date:   Thu, 29 Jun 2023 09:36:19 +0800
Message-Id: <20230629013621.2388121-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d62bdd-2c2a-4f44-1d38-08db7840a248
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jquw96FkzFplEQgyMxwo5GEA9DZdWK6snh9kLP/N0XUbEWzp/5QpbgYn1P4WxQ9h43i7oNh5DmuKhMfwqw+IMLKjLiG3CxMzETJa7S6P6ybHY5KEuJvdAS19bX1pr+qq2AYPaN5cLTbI1+6U+Bd/yrVKUopfmJnPutYl8eKKEgWck98MJESyNNXWqbHPAjY7HgQgIQqQCvNuSfGTN8oRVgLbY8wy7ij18Qd6Oz9/PNJN0SRE8CF0/vQ+5ARlmk/ZfIFLW0ZzwOldm64e8OdLSvh4bDnkTIYE679OBiFucqzSfJS3Sv+hsok49ObNxA7MhoDHRrzJ2/pl5kITa/PGlFYzp9a2L7t4wT1CIzmMpPNFWUdBfDNzC6209qb4yd3jgK1FfOdp/f55u/6HUdZWsFZt6IEfBos8irkNwQoT89edc/NpYSR3J+g6OA4lVxykjgz50RLLfJK9WcLPZlKMjkLVslKDZlVtSUrSdCkYt+wTKDAnBlYyNc5qGjQXWLqVDNmuzjpTf++oM7zAnNXLMwyI2z/oEZIqA61+fOsD6y/gJdq3lJFlNIvADhCNnnuOOklQzl6q6BtdCJ2RCF9hPClHFDWwl2JoQDJqNAPPRH00c6s5/5M/6StP5qyezlQ6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(6512007)(1076003)(5660300002)(7416002)(66556008)(8936002)(4326008)(66946007)(316002)(66476007)(8676002)(478600001)(6506007)(86362001)(2906002)(41300700001)(26005)(52116002)(6486002)(186003)(9686003)(2616005)(6666004)(38100700002)(38350700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kpvQ8y8oqsZCU8JqPpIG/xpHq5rBPiumMUD8lqaWXktlBvW5jKghz0kiZU3O?=
 =?us-ascii?Q?QGu8c12bB77xVJ678vO5p6E8WNzE109UfezTUmEPWAfOlSqlahUyHK9NxB6C?=
 =?us-ascii?Q?kPsukFK514w/XiympFAhxGur7D+guih9mazx32KcnnTOCIZw0LzS+/M1Sutm?=
 =?us-ascii?Q?a0vWzChB3EacXbXN0Ltfz9Q6dSAsemBS1iDRgRU1eQoIPAStzDy2aNrpxMsK?=
 =?us-ascii?Q?HJ4J9WqbHRbWIMd5Ty+uvNgUHXC5Yy0L8HpX0ksUh+aRX9LoHL7JmHcnfmUG?=
 =?us-ascii?Q?vF7YJ/pyVR/+BLFKGQMRIKO1UWT+48QitfHbl4tKz87Kg1MDlznl1kSJENrP?=
 =?us-ascii?Q?6h+GGk13onqSe7QuPvicZGMd/Ytfc808cZfA553hZlgVS/nc/320OgiWe6a0?=
 =?us-ascii?Q?yzmWthPFmKXkv33eYd0Lz2QUtg/r60Og/SiZt48VSLeATz6f2I7Aky38iACf?=
 =?us-ascii?Q?2VIbI6/KWaLrbojW8BUQj+fERG6E+vhyaghlEXQmdwc4QYE0RgiYMFIP35pp?=
 =?us-ascii?Q?N60BmSqDx0sp3XTeLDw+9aqdddDvgVJfhZMXuDhYTYIT4kysj0kjRErAjoOh?=
 =?us-ascii?Q?KtykTRDqMVtam6Z4lU15ZT0IQZo/6d6dVeMMwIocAsqfBWfQ181Tb2WjRf/E?=
 =?us-ascii?Q?hULgR7QpRZKh9t81Vs5xA5mx5xc+L/NjxLH0bsqyIZzqytnfMVT0R17gG5SF?=
 =?us-ascii?Q?02BXW8B3MhhWcI4uLAmWRo93YzvgMn6wwxgJSHLENzHqSC7Jl6mCxcyNLrTq?=
 =?us-ascii?Q?yDzCn4Zql8D6xcFv7oBeDBrRFhuK+JKWMfJ0LWD+3TDqLeAV2SpdyZyxohS3?=
 =?us-ascii?Q?qKgo7GUrb61ro9WksJ43zieFGWB0MKMiaLHUBKxJJHmcea+NhGf6w4k4HBE8?=
 =?us-ascii?Q?p2Go6Z5sWBcsJu0iacSBGoklUncApvg5n0TKDO8AGttpzut5O+Pozdz/8tiE?=
 =?us-ascii?Q?oH6TG7EapE168InUGhFxofdY09hwl7n/r53EvPzRPlNq3GZY/9PeZRvuzhFB?=
 =?us-ascii?Q?+DyuvjfKwPU+nVhDCNi7dz4qGG4twuuafrXvsDHZ7eXtqj/EWdnHWmqLwaI7?=
 =?us-ascii?Q?W+J2EofalOp+TJaVrk3B2fCCCCSrpCobBB80H2blN3kKor0/AeVDFDVWTe6l?=
 =?us-ascii?Q?aX5yqcJHaNu90xL61qzoOCIln1Wj29VrKfpmBdzWy9d/F9Bmg7PBjCTb2IRB?=
 =?us-ascii?Q?QE8sEc3rLeMFqTdtoC9Zg9PEM+Ev4R7MtI49jxJFo6MrPzJblDWWU4D5dLvu?=
 =?us-ascii?Q?9ncvYaHT4zC9PD3+eIls3JceaKblbAGw5ZkibDg3mxF8FCSa+Bt/l/kxleI+?=
 =?us-ascii?Q?zj1APcwv6C0Es1Tn9NXbdkqlMn78QyMme7yf5GMfx0cxdVRzKhIVPWFyPDqf?=
 =?us-ascii?Q?Lz+2bp8kMQ7A1cv6YB+awNVTUrxlPFzKxVaMvkElz6ytYrrdRYh0qbrMEl1S?=
 =?us-ascii?Q?l23qF8Uv+1YVwvPETh4cO9C1m6aGFA9wPuCzelfXYiRdr8WVeMYkR/YNjHss?=
 =?us-ascii?Q?06I+e9zB5WlvHRvXngl/Bxw3rEaT0kXw3efwCvnlSiPxY7XQSyRf0P3UjIX2?=
 =?us-ascii?Q?zY/rGUPQ8Dn/5hx59RwpphNVyPt4aD5n8HigVRod?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d62bdd-2c2a-4f44-1d38-08db7840a248
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 01:32:00.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTc2vgw7hQqw8f4CQwrpKuXfJzmfor2pf9AtkqkeyBLOUEpBXfFN275p9VrJxe3sc2pJ8ARuVjt8JJx67Lis4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
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

