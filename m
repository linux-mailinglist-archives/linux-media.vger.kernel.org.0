Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0D973D646
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 05:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjFZDXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 23:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjFZDW7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 23:22:59 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE77811C;
        Sun, 25 Jun 2023 20:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQTUurChTsJ6B9J+aVD8iTC41FmGpqf34VaWBR7ffe/R1LvExmHtjD8P9CdNbvV5W5pCUmDUc99j1gbIkANIHUIQgVSyPmlL2N+SfmwmtVRPwtib8VgeHgrqzo12nltJXbqoEJiR+/If85V8KcDSBhwVfgq8u7NqiyatA0HQBfm2RZ0bui/koljCCxU636IPOo6JJxmCCdsWCKpdUfm5TxfR+zKbzX4e0DPv5sdb6yQr2mc1kxo24JWntaXN/OOaqfDjS0n4s+YwIppDQ1Tsocxze4jg1BPzeFnaDudOGM7x9XKFYy3Z6o289rQabX2xxhCgDhUCQz1iySADxE1CgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG2OHCWr66Z8Yoj6KohAORaAHOzM8WZK3Mkec6iCk4Q=;
 b=d15wGiYYhLLG6EvxqipS8WE2170GLhxayBubBsKQgXyaTZS5tdk9cVq/B1no5NNyYDmMQ8OzoHQihAfzZRBS5tQIZo8uvyMRvWe4ujTEE8U9WmSnGvQu7upkQWECC/Pv3PS5qfjClc855ygYcngqu/WZ5Ib4lU3dzigSgSQ2ihD8rcPYAzQPvLZBKCzjNtD0l1wdLO2ub++4Dv0TFxL/nqsI6Fsn/KePPGpQmYk8sSJyCskBXpH0IAwCxE8MqcTlLRavaJnmAI6Pu+HYPec1MDKrlukQRFxlprVIb2rUcUtxosrzvqzK0UO8gwdzoNJm+x2dsSYO3RgyW7WPkaTofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG2OHCWr66Z8Yoj6KohAORaAHOzM8WZK3Mkec6iCk4Q=;
 b=lTBeuBeEzKxodC1JXmuz5ZKk/BexTeYKb5T75bpONAvfhQzhxRaN6hTi5HqNUzrbxEc6HDa8Ap+jVMCem6tQsWITVJLGBwR+c0vqnCb4EjDpaOjFUNhtf6O9mVHcptIosRYFsBA7zWibzgXS5/SFpy0d6r9AWt/iXNrguCrLh60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB9934.eurprd04.prod.outlook.com (2603:10a6:102:380::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 03:22:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 03:22:55 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v2 1/2] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
Date:   Mon, 26 Jun 2023 11:27:34 +0800
Message-Id: <20230626032735.49500-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
References: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: 362cec48-4224-4114-8fbd-08db75f4a19b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Kqi2qpR7W4eP+lrlpgxoPbBj/LaDiHoSSzCugASC2+rjfSLxCexCeOm31GJn5rJR70Do69L/IpDeORHbbEmREFSg71BWLwLCSNz9E47mK0+h2R471nVXQ1H8pbIqL5cY2aHQRzto8ToThs7QMiLsnxnlVyCvne5LJ2DeJuBwn3u2EbGoPUJd7+OEn23dcrDlTPsGuZDydREhYywVaEqyQLZtY1uhIXgz/annC4AXaglkOWNQ+GWray+RKPT6mWOeFLLt+PC51xbOcAiz+3khBaps6wzXVG5nGbpm3u/viR4s4+OU1/KKE2Me/HaKvWo+Bxeh+HWmzVaVL0yA1lSOVYJaD56+pVFt9/zA67jkKI6e3MOhE/Vqmd09Hqd2NE5blQiy56wX0TrhBcE/pN8ImhNUV7Yi5n94yqJBBL6Iay+N7GWAUguU2GK3IbN80q/mAMCZR0khj7qem2BCctErFTJt+8EHzRw9Z4LvA39Gjohx7ADEmgOKkJS38Pn3xEShrJqVaGK4HgpnWYTXOo2NTthtnR1MlL0oYDDBdycghwHs6+kHgdBLmfx7EqBgICon++JhB8WlzZ/EkObiwFYGh91Tka/z3NivPrAow77lOPSocLGSDNsgep5xjHyrJuA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(316002)(66946007)(66556008)(66476007)(4326008)(478600001)(5660300002)(8936002)(8676002)(7416002)(4744005)(2906002)(86362001)(41300700001)(6486002)(186003)(9686003)(1076003)(6512007)(6506007)(26005)(38100700002)(38350700002)(52116002)(6666004)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zqdl57KrLnXDGI+3pp5lGvhJkWl5PB0Q297EbC4SBXLKi+ekn4otYMiAF9rk?=
 =?us-ascii?Q?lL4XWelq3wvL4zjNaxaQA+WlsxoGZ2Gb51vgDj4gmGn/DWu/dX6vK7zWBYsI?=
 =?us-ascii?Q?kgBIkP55YEksKbXdxZUjQZ9PatLKu4EKuwMAB/C+0Qr+7vobSfRKZRU2ZGrP?=
 =?us-ascii?Q?aalNlvmJIH/xyhbOkHNYBukXrVUrxIhvd6kkcaTetBVzt0+WF5Tv20QpoALW?=
 =?us-ascii?Q?3qmF8d06TfmrVxgk/mUVWzod8Ov1dBEkhUDIec0APITG4ttgFxf3x9/SVGdk?=
 =?us-ascii?Q?GPm9ZSyKQ1ML1DX4eXzsBfnYfydShJsRSNaEUm9WkkfrYm60QDrK0RPqWE4L?=
 =?us-ascii?Q?4YwI+2SwR1Tbe3PD+v5HeFGV7VxeaI8kLWqi53UYXheiXfhP0h5URKfSlURn?=
 =?us-ascii?Q?aaT24Zk8fw5c1jthM4bn4rzFc+fOKK985Xy7F/Lal61s4hXXE6DLo18O7aYV?=
 =?us-ascii?Q?8wgTmBi8YZEwk+fIz7MSw+3Bis6cqFoWlhu/fDJWsZ1Kd8oouz+mw2D+fTrp?=
 =?us-ascii?Q?SPEf2/Lh/LOPpC7aAvRmYvb2XZViI6TPMaLlPBx9Vfs0bGgL3KVjE56iHjAX?=
 =?us-ascii?Q?yYBM+hxDep6nhEA0aorIqAtZ3lRI/KfuxIHq0h47DBpyE7BcMtQDgySz39ev?=
 =?us-ascii?Q?SnFjFgYvd1AadS3cRFvP+fCyo5cU83JWwXYMsW3+2WHK0wzOk3oUNfEV6FdR?=
 =?us-ascii?Q?B+uOYfX1KDXxR38/vZtSza+RiSjll5VisgGk8QeyC1IAdhnmZira4E/zyfZg?=
 =?us-ascii?Q?rz/QAEPnXS4fK9jCIdGDHs2gZj+/p6wVsJ3cIUhT5aNeF1FgHQ6g6fSNQIpX?=
 =?us-ascii?Q?DRmYkS+vZ6aX7SqM+NBMhX0LSiF1e+g444Su2X3U71k6wwVCry5cG2PvenJB?=
 =?us-ascii?Q?oRzY+/iyvt1dP7yEzlOe2p36HdwyEIq+c+D3puftaa+klmr3Zv/ibXv4DRf8?=
 =?us-ascii?Q?hXI6EPAtwNqUxwOb3kwZUcXq4zr12XBUmS9ejp8zvTDxbeQYvi+sVdmSIg2C?=
 =?us-ascii?Q?R6XuGwxfKEtZ+yR/ZDz6xpw/df9f37YkFJP6XbUZzo2wan+R1EH9IGFg+A7Q?=
 =?us-ascii?Q?d+mD/AEi6BLYF+bC89uaOVDwIpWMwLOkmB47Qsd8qaWRJj9g3sgpgoazmvZ/?=
 =?us-ascii?Q?OW8/PAYkeH41y/6RkgdTZjILKF2VRw5iUKII9X56o1XCT2ivkIlgo84E4EWe?=
 =?us-ascii?Q?jiEliRb+ds5sp21ZajOil5G0ydo6Qs5ulUKtt5LtNBVeHJxiLm/Jd2k8Cork?=
 =?us-ascii?Q?SgXAQI74GSNfVfHAvwJvQFo5UD2d0H098Hjz5Mu9I3zJ/DRkM0Wj4Ri75Dbe?=
 =?us-ascii?Q?uFYwYONM5FWco7tbJ0xJRltmFV8Q/ayLxBYvZwoFMT2RciKI8jSbK2WiTNYr?=
 =?us-ascii?Q?9u9P+ogCC9KrvAMym7/+59iJTOs1YHIgRz4iO6qiR2BOd1nmJvX/VQBN+AOZ?=
 =?us-ascii?Q?WLPb+n9L6k275OOEFFfimQCBb9Vb40PI45zS79JFxMP+EEmHaVqmKNR4ZQbu?=
 =?us-ascii?Q?OYSuby2KBplJUOdOg6sUuOqk+l5TmQ9N94xHiXZyIpVZmQtm7iBHOFXyNTWr?=
 =?us-ascii?Q?wLqE5qjq5HjEKF5Goo5tRkS202Xs0houEr1Sq239p6J4GInfchntjo7/PTCC?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362cec48-4224-4114-8fbd-08db75f4a19b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 03:22:55.0331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdGz5LsuuaNRJRlMHhpCsnYnSphqiOrcuPHAzdvw0QfyrybOabbchgjGA38hWbbXJDIrNp8lnsWpZqo0aXGhMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9934
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

