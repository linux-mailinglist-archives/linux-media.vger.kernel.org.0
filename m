Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4300265BE7D
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 11:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237090AbjACK4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 05:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233135AbjACK4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 05:56:44 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2078.outbound.protection.outlook.com [40.107.241.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B609AE43
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 02:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVX/bOLK5mHSpia40g7w+tP5mtwXAsmZwXGl+RSUC0ULi8K8WoqdTIuDFykAqXHGK5R6B7WqGqnsxWEb9wWpGvr7ffLHkJDXA7UxUT5rHIX3CLjVpCCEIw0bztjoGUnx346SL/rQlqwr5TqBGM5j1obM6QScmwhpuxRg36zF3258skqpbgRXhXMtRSl6KwgskHWVaQbVSOKSVt6MGJnmzhT/sLGBGifduwbcBIBsjXwGMrfMqWmEZJSxK0THVmPQJcy2y0HK3IzqgJsGRxvz3OnQUvjHCD976hthjHxIXZkylY2WdPlbMC5iQnvTGKQMsGhs+S4B7LX/ZzjliaktuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKZv19mzzyLzrZFxlMMF7YHUVJxojnoCmXakBERIXLM=;
 b=HKonTXppTQUndepP1VKts53cfpq4NFTIg5gKizRUtpQPNNz+r3/6+Pu3Fp+53myMfPx+qLyvZInDn6YpMy+J4ycLSYns5T87pUq+1WNWRJ9bcRzKujEpqU+QEuT21JtRqcXXECpEtSyxFDyfbLXYvocelus/jbPGkwiPsTdEEqyfO17IgblHcKqY7FLb92PyCIPssMlTA3TCfNzK/eo0f5/jXuyOb3AC+i7SM8ypdRvBJn9+WGvwqlXEi4ltq1r3DTq2zmA92KRkBjJlp5sqv3p4zlEQGbamh4OV5Z8dQ0trAag9xFhMmokJUv3QvjzpQmHUS04Y0VRCEGoWXDpi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKZv19mzzyLzrZFxlMMF7YHUVJxojnoCmXakBERIXLM=;
 b=Tj1bsadO8V+kWVKJYNcZYWOITkaNXoyYJhb0gN7wNOXLqrK5p/Mw5U3lD5tzwk1C/qVt/dfIvtbPRxzlj2sGTbkqO9WT/V/pJVvlzMBPFXUdOypMzqyduFmJtU9+82g7GQZTTm/O1+y1l64ea5xncZWAHUD2vlJJb5da8Hi1nYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM9PR04MB7713.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 10:56:40 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::19a6:6003:3641:13b2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::19a6:6003:3641:13b2%7]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 10:56:40 +0000
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH] media: dw100: Add a missing unwind goto in dw100_probe()
Date:   Tue,  3 Jan 2023 11:55:34 +0100
Message-Id: <20230103105534.3018257-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::12) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_|AM9PR04MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b9679b-6569-4364-6195-08daed793124
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WpdLgiUldO84fV4pCSKjKLkENRzUiWZ8UoTrKTedC8ZoZ5r6pk1yyyfoRelXiIk0zAbZGc4M9do0MvNp+JeaF2oTr/luOGyz1+D31jT3Xck84ROXM35F8TW3MYyvh1Z92ETAHvXpfO0VeYJLpzEBR65DEMoYI851bjACBMnyNzvq/tpSey4aMmfuXN5gmxJZSDrTp1NbeCEa4dvWrVxBqgZxcSUPR2N1KeiqWWOQpNCJv8G2OBDRePsabQqXgmk206YksLaxcCEROeN50TrDbS/xAAt/XkRftMpuAVgvKw6azmOG/4h3rJHVUukOAqD3VrqsWKk3mxNvlMGAD9qcIcycf5nOfV6KAytA8Ogtgg8GHNz5vWErZGDAge6szbutiWomL7o4upjGk3d7d+BEzXVjH5BnbNV3Xxv1W6CmRCoI4jUCcqmYX7InPNt+36f1CMLTz1FIHe8vCCx3L6UVsiVpky4lBWVRhk5jSuFDm3JjZDtu82bVmGdai9dSBUIpcGWhgPQN0cT3JtNByJPMSUUCmliOMvkn7o1NNsKTaN+MlQge0bFQer6Ypfg5sEfaytrQA3A/+MNi9RJNnGawN5INgqW5XIY4bMWFalY5RC8bJwkC5na8N8L/t5jSbu2GueK3U44Xti/vI6RIBHRwhQJx8Nb3cGeGIULmkoeDggyIYWboObkw5X40ECgUejn09bXrL1aKc3zINJUpXpwCjMlZX/VqrtAlDhDC3z6sAUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(83380400001)(1076003)(6512007)(26005)(6666004)(6506007)(86362001)(38350700002)(38100700002)(2616005)(186003)(478600001)(41300700001)(8676002)(4326008)(2906002)(5660300002)(8936002)(6486002)(52116002)(66556008)(66946007)(66476007)(54906003)(316002)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CsxsDTMY2Doa322iz9zHhygHbeerQujGvA7mUhREPNQ6O2XHNvEgxeOC9xOG?=
 =?us-ascii?Q?p0KX7CLREEizeXk79T+bp50uRoj/tJoMsZeKWGbqSrNLObH51qiy8lSr9+ER?=
 =?us-ascii?Q?t6D/TNEo2xkZhbcYYWRHYtdJKKMZDGiW2q+f2Tj6m0RQe5PAZjz2JjgeU8qH?=
 =?us-ascii?Q?N2FTeZawzAiRY2rZh2g+marUFOas6XXZs0gBIsZHZCYrPClqthYB4uNf/Iml?=
 =?us-ascii?Q?uBBeMt8zWz7pgsO9nSStJgM9bODZAeLlj+lRzeuEnrcgwHEY4TINNiColxcT?=
 =?us-ascii?Q?/G4V9UEImxPoiSVwhW6V1sF4G2Bt9QYQngdM8V35J0JJ/9SF1azfecdtA8Rs?=
 =?us-ascii?Q?gFxQ1MlptW/p+ejWisOkqf5N4IP19s7V2pV75kuP8S6i4VrnmXeGO5u0W4FH?=
 =?us-ascii?Q?lSLslpppKC7VcQ0LDCz5Pgyl3w7ihftBsKUgWa9cMfrsp3WCdnr1WKwIbi8u?=
 =?us-ascii?Q?f2s1GBS9l8eesXLBehJtQMIw92QMpGirIrIbZiqdcCBc/Q7osKPel1f0vR+Z?=
 =?us-ascii?Q?DSWEW5nL7W96+25KAY3RB5BRYH6CNK1ie1SYYvqMosmC/HJXkMH8vusMd7kr?=
 =?us-ascii?Q?eotnq76dHqwPwYt9bBY7gTEl4AAIKNDrI7BdNhL18jY12ovfWQas4cJuR4sR?=
 =?us-ascii?Q?Zmz/Ni8XsqZEl0kzdj7Vj77KXJiouE0rsYueeRvHldJTw+zEZknE26LYNZ/X?=
 =?us-ascii?Q?117uZSL78rC6t+h+6mFzOxo+FbJGdqY//Hq6GHDHYVEprcTVOrIBoJZQ7MR8?=
 =?us-ascii?Q?ySI6wgGgus1HpdJyPvC5+5GS06gnE462VMsacAGoACKb4JPIrtvrftSKAWcA?=
 =?us-ascii?Q?QidDtGmDhQVxr6iD9wF1ScWnM/xnpjq7S6XF6r06fbmiRm5lM1v46uHt/nI1?=
 =?us-ascii?Q?bkP5EfOiYWAWv8j6fkuchEKZZyWSvwA/S/SHESPXXRpeSY11TVb3s6OEiQDF?=
 =?us-ascii?Q?SQuTywAv5pjzBAeUl8LVDvFRWzpBrp2bD1ypbUSlwIJxVS+H+B1ghQ9Ng01t?=
 =?us-ascii?Q?BI8gvZDBx1S/3xrV6pjwbbmtJeuKv7izOLgMnHgASSG6uqT8s1Y0rHT5DqBn?=
 =?us-ascii?Q?nGNMdbReVjJWO4pn0r1CyDqwaEsEhvW2L0K1M3vcmORMLQFnEYWAfCEdARcz?=
 =?us-ascii?Q?LgStLXqWbkFGoLzWNoN1pbl1bWfYl/Ukd1IAlNVhu8ZsdwDKxFtnxXyIXWVo?=
 =?us-ascii?Q?ogCQNpm9duHVnw8ebOzwOdoj7YNRJCr6nlXywGqRQ6PR/vd1HNs67BCiKkQN?=
 =?us-ascii?Q?0itPNhu2VMkyMNpQP5evtTZ8iacM6328slQQlcenDqWDimKel5iAx/XAAUeX?=
 =?us-ascii?Q?3aXhvZhJB/GOLzCLjU2fRLACHuQtzvQUufh5JlZI88xlmw2u9Y38GnCsdcck?=
 =?us-ascii?Q?mupVypRoVMVJuHZUgitQiN/T0tAwbYV1oVG7Z3kSLxH20NE+dS504Kfuvfsd?=
 =?us-ascii?Q?eib/IMioMjWBCURPznc1wR24c+nKe1PNePhTWVNGRMtdE4Dm/LRuEFxY4A3j?=
 =?us-ascii?Q?FsiuKZXQlmoXyae6U0MMH2+iFyAuo+qLfTL1UnbgWOtmv7MuMNbum1SBTRz4?=
 =?us-ascii?Q?z1JwKI0+3NlpEmmi8ohSnIVTedAzeVOg3ZQRzySIozPIBAXwv71xeGANFmXN?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b9679b-6569-4364-6195-08daed793124
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 10:56:40.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xar6+ruQdtFjQ2vgiXe/WIAT71EcQdQwPexwiLr8AFQqQeRqy5x2E/UmBQzgk0OJnlriAf+TTsZeQChu/oz3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7713
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Xavier Roumegue <xavier.roumegue@oss.nxp.com>

In case the IRQ allocation returns an error in dw100_probe(), the pm
runtime is not disabled before to return.

Add the missing unwind goto on the error handling path of the IRQ
allocation request.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/platform/nxp/dw100/dw100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index f6d48c36f386..189d60cd5ed1 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -1571,7 +1571,7 @@ static int dw100_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), dw_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
-		return ret;
+		goto err_pm;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
-- 
2.39.0

