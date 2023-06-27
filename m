Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3917B73F45A
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 08:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjF0GQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 02:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjF0GQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 02:16:04 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5D82115;
        Mon, 26 Jun 2023 23:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwd5qwk+OFHUY298hPdmRrLVgqFLeSEB3fhnyBqw8IiP0+RYpSlvC+vsdR6lDMXnJAOSmocaZwEuJ2ZiXPjzyHgZjCDyWAf+yPmoCKJbYrm79pMJifRAHEl4H1XaGva6fJesSwaf3aYBYD/RCbiYqj//FHvr5taudw0NfZBWvfC7YIvUr9ji8mw8qzBCHJ7JtCOqHMaAA5FfK/FJ4Jkyok324JTLqXRBiJBl0JtAXvxxP/Fe2cG0Q0HkFP/BYQDT5EhjzA7F5aQ3GxKEkWLVy+R/SX75A33OKFZziz7ENhYLBXlqeZ4On6g9Bkk3HDcwljpLowM1C7pfwKGgBawO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W51bwjDDfB9q1THw6i3Y2SDwyyfbQwaMbZjg7qwpW3U=;
 b=QXTEdPiuOZ9pRrWTk4jf0JebtVfiojdTcit1SpOZilxGvKmQMveryWRVO0250yVl2xXre9SobLJ941/8RCDN5tUSOK3JBeMPdA3J84V2/zvvoFga6tnm88R15W4G/3SRmH30CKjOsDa9Qbre2oOZeEHZW8274fiNnesQauPPiHbI/mK8ACOPYAW4Rcdi2Otyw6RnrJKFoAAyEvTABfV3rfM0lPckKVXkzBxY3hNDTelWnouPWu75+qoY8r/TOkwTirHZbT7LIQN9jCTdNfm07PyGFgdFbcUt49brTMPe3WLMPbk9kdM7LCr4PjKqr4NITcYcoFtjatcv8A2CceqyDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W51bwjDDfB9q1THw6i3Y2SDwyyfbQwaMbZjg7qwpW3U=;
 b=VHwnkJCikFHFNCetbBWBLYTE4BiLGqCGaObtOCwHTxS4/Rij0P/oKBoUr1Py3kLJRBPgoPhjzybjGPjHyt46A97K4OsHVmFhWtcLX6DJe0/rg8d8ZR1PDi7X+W7EoHbqtI50W9jV5n+QPm/A0GblkmbZyEwF3gkx2uKKCZBj3JM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB8PR04MB7004.eurprd04.prod.outlook.com (2603:10a6:10:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 06:15:39 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 06:15:39 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v3 1/3] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
Date:   Tue, 27 Jun 2023 14:20:15 +0800
Message-Id: <20230627062017.1135114-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
References: <20230627062017.1135114-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB8PR04MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c9c2a-4608-44b4-d551-08db76d5ed93
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvg8a0gz3UKDg86enDeyOrFlTnSgOgDZdATT4eNFt6MA7+WMUfvvJJdoUIlSvWVJvgk2nEHYntOwo98jLwNTEvlafdjgawPSfvfZLBuVgsdSrJBZiklSLmmeZ6lnOcPelVxxU4nTYXngna6n0/ZG0/8Oaof5Tr3OXSViXJ6vKXqhKjtu9nIY235G9Lyn1jT7E7dR9EomuVteaqNuMcQVwAF6/QdUN9YXhnxgDJUT7Eedt0RKWZY1yhuoUyGZ/S6zPx/Q0qcZLD3hUR5k+wfQTumT2BP/HbzCt0cBOt9rV550NoBEJS02HxqSbntMSYQ+KmZPYBiA0m+MjEeL8QgmdsGjouEnuomipGHlk0iBc0TUj/QjtNg4w61SA1z3Lvj4XnfhSG3Lxak8mzj2yLTMXS08BYrtnY7MpabouSXIdxuOoOo4b4jHE1K8BIumW+smNEx9DjY2IBrl8oSR/sq8MPDEIhBvwwD8JWilwYPIoCF2A1AZ1xSlZijJpk/KDYPyZLPR5BlMrEGy63O5nmfRPm37Hda28YsfNHKJxtYKd1WNFQXB08WSOP5PrlICuKYehAweb8LsoEUZkR59nFAdh5/5Uyg+G1F5JLX3ENhWV4C4+ijCQmBWmDU7R902BWBs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(186003)(4744005)(2906002)(26005)(1076003)(52116002)(38350700002)(2616005)(38100700002)(6512007)(6506007)(5660300002)(41300700001)(9686003)(66556008)(83380400001)(66476007)(66946007)(8936002)(8676002)(6666004)(7416002)(316002)(478600001)(86362001)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bbn36VA8rXgdU2D7MTn4yXkHTts4zrI2SFuOmP1CVLTwkv8aOYYz58nCHTbD?=
 =?us-ascii?Q?LXG2ZI8Hl/p0BC/tjbUx4M1TYDdJkC18hNLk4xkZ40qsMEPEyejVQaAwVU+n?=
 =?us-ascii?Q?n5hB7M8dUcCwRCsjz548gUzN9c4jwl+wrpoW078EMdzLrY+INPE3JuIjfv0j?=
 =?us-ascii?Q?v1ciWogSjcZzuUXOBXU60wCGOSW4cr0v2UE/FwR0KJYODc7JgAshH0wJ5MOa?=
 =?us-ascii?Q?2mV6fjUuit2YyJUQKFWsyMdoF18OvwmeSdnjswol9Qw6DIFmuHAp4tIw0Xrt?=
 =?us-ascii?Q?WA4pSMnmn05HQrjM18u9GLnLILmXwDDj+6ObV9ZQDn/TBTTNBCGAakUkxM8/?=
 =?us-ascii?Q?E5MrhnTah66ipL1Ta7y7qIromG0KCVVYF9HKEZj/WmXUvrmPRzzEAypuO3fg?=
 =?us-ascii?Q?thBbYTnU74vQ+IRqp9P5enUNk6XoyGjrWETqp9TdqvFVbJ7ibi+1ewbYSHM0?=
 =?us-ascii?Q?nmv0jx4xbw3V4o/33nuvwut8bFfkDO2h2sEMFThkwa3zQM254Kyvg3DCtNWK?=
 =?us-ascii?Q?wTYMjpl1QIv7eLa51TQb0Ls2Bzub++K8iR4/0+n4SC7Nt03Jph27jFhKSX+E?=
 =?us-ascii?Q?IKH3KshDz9Ktstyv1pDZf3M29flozvdVGFOrQHs2EknLQaIZK+EvArU61eC8?=
 =?us-ascii?Q?f7C2P1VhCNQfW20xV2TPSIV2m8Ego905/Yj5P9LVQ14NkZhm1QqJOnId//tB?=
 =?us-ascii?Q?/eZVvdnZZa+W/UdPvNxXnwn9KMsfJSchdmAnRuPQucGUho8l0E4LpIGmJ9Uk?=
 =?us-ascii?Q?85XwXHqRS5/+6g4xh3LceTLyghzovnCiwg0f/pndvzK9Q+4r7LTVjda5nza5?=
 =?us-ascii?Q?STPvce7FtMw3SjgPRrabcohCH5GlH4/z09q/LpGDN5R6os+XHRVJoCZFDbeI?=
 =?us-ascii?Q?GHEJFZNlk64bK4V0cx2AuKUFYXZGXJBjC7GDY/loRRxwn54ZBwBy10CwR3ZU?=
 =?us-ascii?Q?aaGU6WHEYR/zu24/S98GNMwaWXl3Sb4dGirq14zpKZTt0HKDjLOnxcsT9w0/?=
 =?us-ascii?Q?+VMg5qm50mXM6dfpWJzXn5AqPxGq8haRToFtnquYCyCkCSC0Ha5DR7xYXGlN?=
 =?us-ascii?Q?gYWwjTbcB/2zIJzDpfoV8IW2AoP7wVa7klFMgxyg+/rJk/kG24eB5bPJPkgm?=
 =?us-ascii?Q?c9YvC65bpa0BdZE5/iTV1dKWYyNmviJMtP0jN5vf3L2JZ6C/dYqxI4gN3Yzw?=
 =?us-ascii?Q?D5zH0YvmjqRwv/U6T/0nJe0Xh50w+tiq6oZl6AI9VxdOPUCd/VRErRIoCqI/?=
 =?us-ascii?Q?c0+5Ptx+NleL7zkkQZ/abM2y9AOUfadVH9G6zphU0NumVAMXCsCtxCYCaK4o?=
 =?us-ascii?Q?D5Qwv3i1V/ulN1RPO7+f89Edl7cuiOwKtQxElO+Dj4aitPFDdgcQHvYIzSti?=
 =?us-ascii?Q?hzU787V0McVhYOrcL1gWgE5pPRy1fgZxrDlOTIrexEt5m2hZxG3ZGewqg8ub?=
 =?us-ascii?Q?giOZeOM3xGipOUkUt2hQm4O37e/df8mWBUPqD49wn7TuQRk68UefeMKaLIDx?=
 =?us-ascii?Q?1sXcegiuzVZJr5NiOymbA+b1Ge8bXa0c+Iw3wCdM6fyLnlnm3S9gkHpKetkt?=
 =?us-ascii?Q?Ry5qQ8bVWqbvdihYwsfgYd+ZxgJnARWRao3npwfp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c9c2a-4608-44b4-d551-08db76d5ed93
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 06:15:39.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpy4fbEBIfhtfGk9aXrw/OSLQMOcQLQeuvszOvnfRiyNcgBywJ2VbzM96n6kcCqVVAtvfBdLbrJX4pQMbUStwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7004
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add the compatible string support for i.MX93 ISI.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

