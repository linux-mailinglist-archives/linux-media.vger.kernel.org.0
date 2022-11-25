Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F2B6385F9
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 10:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiKYJTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 04:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKYJTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 04:19:08 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2041.outbound.protection.outlook.com [40.107.13.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095871F2CB
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 01:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzcJJp7BCHnBgJ1AOuHP34T3TKwKMGV8eDSI4I2gXufwd8fZWYqLP6UOjobuK8MukUxvJ8vxj+AE7BFZXECpfRIBOkiPS/HZmaf48CF+rkYznLN31XTHY8GZkSHWjAj5ntn3hIfet4gDCuRpThMRcM5mFLBazKx0V0oqYCD/GpXuBg1Uah2rk0wztZJUDHhgQvWO28QKG5qr0IquIsyxgqEKf+QdUxH63dvNKj6wPJgsvbn7z8RzwFVndO2/Z3RzthwB0O9pHJ59SooqwzbswNTxXKPNtdtnfK0o90ic0qbmiotu8p1BK+fEJTZVnvUHAH3gtg0vCDYxKqEncMmYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3bcwGPvSwxnRcpg1nWFdAlgZ4hKEoFuAKH0vGmw1x4=;
 b=LsiU8lwta5v2Jvc87l5PzQTGTwiyHihX2Stw2cpoqCEN6pi5j44n9d1pctyd1g4WxNeSApZOGv+EYrV/zb4Hn1KI7/5+sHJyjnpuViifjv8uH0f13UaxPNn6hMnE/Chi7ePa93l2oLB8TdL2wAoNDr4sxZyxPOGaSikwtHZzh0MEiL6stfbfJNhu8BoaD/dtysbizgj4qNsjpFoE70e/xz22HPzx8HloA4+oVBS/cY+aDZz8+EPeHOp1wYa8jSEfOAoVFZTIysIWwXqpRcb5Uf2PYEVkT1KxDrKGNHfp8KX3ZqyGqtWj5T7c6Moaf8ozOpc3LDMKLyytkZHg1WIZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3bcwGPvSwxnRcpg1nWFdAlgZ4hKEoFuAKH0vGmw1x4=;
 b=MCzBCAAzU7/rN6vv/M43LfK8ga3+stbF3Sr+ohe5FBlu/jdZ3rWwnuYQ570AoigFEZLyFDHsflkUAhOxCTwfjBh4KTdF1DBHiBjZ4/6F1f4NUnJbensp88omRJpVY5Zzu/I2mwehmchg89E3Wd0cyIqlSOZ9DsXxeMhJo/iaEgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7677.eurprd04.prod.outlook.com (2603:10a6:102:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 09:19:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 09:19:04 +0000
From:   "Guoniu.zhou" <guoniu.zhou@nxp.com>
To:     linux-media@vger.kernel.org
Cc:     slongerbeam@gmail.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hugues.fruchet@st.com,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v3] media: ov5640: set correct default link frequency
Date:   Fri, 25 Nov 2022 17:20:24 +0800
Message-Id: <20221125092024.2866111-1-guoniu.zhou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c57869d-9029-441d-803f-08dacec617c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4ojcKAGaQIsIDNPgVGodd4FdfqlOPIBNrSm/WfjW+jN7d+d/5wWG546sr0shyog08OlZtpmQDuPYzLFdy3S/cxDwvA7QGTeeYbPSzDK1TXp2ofWR8EOQGVedzaxfCcrA7N+9+UvJITdhyu6tiKjESK16usujSSOJmF0rKotpijrwHfGbfn8tw0nIpU0xuIvuYyjFP7mxn44dSYF7PEv/M3bh+GVWClS6QMpIe5Ull55OtqL2yWhLb3OHct8lIsirKy0AzLjkTG22ZRsYTADIlW90OwQ6sWwxEB38D3AvS18xYU6RhvSXrmvn3rglqZ3P3YD2twGqMiuDcKeweAfqIpZ44uHf7mtAlVBGp1ZsNG5bOMMcGLEr5CMGU0NipQvxIDcJg+3mqEsWXLmgf3mvbdbJ04WtIr0Fi/dlfffbT+l8UIawOG8kA/YmrdhUQ7zPpZXuf0uaeHRlKgfkcwz1L8GW49Ka2KW6x+DbqoDw+C4sVnxkX3YmUnNy4GbTvFM/V16AQart1Z9G4IlV/5pbu5GOdU82/majVXNjs1/n1538IodMU7GLk/OkBn1vrg3d+gzyHbYUip1XvfJvh1nMvKrVSQqdSK7mFzhe4WlLDxP/cN3MCo/5XeDO/2xMlmS2D3URV3OIonSfGxVfSqulQolExuH5HE4herNsFqf1kbo6MZmPx2tFtCNflvWIQ+z9MTlq6NDLnkzO8cvaza9mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(36756003)(2906002)(83380400001)(41300700001)(186003)(2616005)(5660300002)(8936002)(1076003)(86362001)(38100700002)(38350700002)(6916009)(26005)(316002)(6512007)(6506007)(52116002)(6486002)(478600001)(6666004)(8676002)(4326008)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ull/aJxrxD4EEtDIOIjGn3YgDFFCYvIlz/69GsN86gFMacWan0v9R14oHkL?=
 =?us-ascii?Q?jFN8rVLcX1AEOatjfdZqVRzbhqcHyI5lFIbaSqI2siKMX6CRlo9RaJpI0JXz?=
 =?us-ascii?Q?xUchH3McsZnopre00jC1AjuQTXklLihp9zrTaQxDyxwQ7ZBEPdCtyCR4jQ1m?=
 =?us-ascii?Q?CuwJMDSWDJL56TiJ3i3G8dm2YXNSTAv32SMJScpif8f5zMn5KzGXn4Ovdj4t?=
 =?us-ascii?Q?beBLJplJEGpBdzx/i3F2AQLbOO7adejhXGePJp4Rr0c1ta0+fDDkq2piusbf?=
 =?us-ascii?Q?F/zM4uiJP+OtpOkalTE2lCaRRG8yWN/jJjN5p9VWi+9AORuPxz0/1Gn5AHxl?=
 =?us-ascii?Q?wu60xS4al5DaDLpkwY/M90COdUJKDDw7hkelEcMtaS3C127WeQVtL57aF9Ji?=
 =?us-ascii?Q?xNyxlIYV8FZOJrslfL8pVfLfpGTUL030s6gQxOFfALMIawux8GG7c68m5n3X?=
 =?us-ascii?Q?SIWPlP3GFdCi0HGrxfhu9TV+8jmtDTCdYidOKCdb1Z3ZAPBS8LBsxmGWtgp2?=
 =?us-ascii?Q?OYlDH5pqZoQh/1aXyJF/3GUVL/7BC0nQ9B5h0try8sYrbqdBQvHd2VfMs9fb?=
 =?us-ascii?Q?WndLl3eU3V7SPScDZ0o5cDIqScqQaMCGezBVl8vySVP2agRHiDGRESZS4pQK?=
 =?us-ascii?Q?RJig40pxz/IEWQifPLjtercQnQ17+IeqBY/yHBltFXHE+wZwffS3xI4xz3AR?=
 =?us-ascii?Q?SzaTZ9OUVWBUpvT/WLoQTADOcE2TpJwal/dlcOQpxr+T8iJBPDZw/Ki6IOG3?=
 =?us-ascii?Q?FCRAMrTKKi+pBfPF/vhM7qPoJ1ximYqknVALmR0mwtLzn/grCUxi25NHOu6T?=
 =?us-ascii?Q?U5YSkCO6wRumTBJFDemeSjT4KV7Pemo41xDgmGul+Bw7iNkuQhdrxMvf3ZmN?=
 =?us-ascii?Q?IM74bO1rA9jadO+DSFHusuSE92hzrB0iKr9SnCwmrBM1ZSwC4RwVIOgRiESf?=
 =?us-ascii?Q?d34BX/kReo1D77iQ1HonPbc4z3p7Obi21tNSGwvUnFqR75uIh6nZRJZiL3Jl?=
 =?us-ascii?Q?gEy2QndP82mIWhhbasHJYx2W+j0+ZSUu7xtB0A35z11i/nU0jAWrStJ9DqeK?=
 =?us-ascii?Q?4Yj6zf883RbHaO5FEiLcaIha3aOVuamIyJYYIC9vb6idOoj+YU+RLk89LtLw?=
 =?us-ascii?Q?rDIVEsrGheHj+kiOlDM9pQxdoUVpFIXnOEt94Z55yxnwgwTcP6u1FYx3JRIM?=
 =?us-ascii?Q?4EGO9Wxkb8stRB5bmUlL/5wKSuTYdquvMfpBc5m0AiqiVrcRMp+lqfZ/o0eC?=
 =?us-ascii?Q?OfJ3Zc50Ov36BNrxOkGGLMfancI/HsmqrGSQA/E2fyRzlIlfqaisS8h5ME9y?=
 =?us-ascii?Q?gPA+4gDZefms/S7G1QuSXRYEGU8on0vO+VXUFgp4lEBsjhJPcTRlm0Lfjmwi?=
 =?us-ascii?Q?gyRyHk967fLPBf3xwTzKlfd0tuGCl9DpZZsj8xvC9PeEIAlAHWfZ5YI1Mf63?=
 =?us-ascii?Q?2JivrZA0oYnEFZPX9PnffNI/zJWbsqOtMh6brLHi4WS2YLaPG6nan7OyNOQe?=
 =?us-ascii?Q?Syg1ku2Yn5Un7yZuzVytDVxP3XEhS7bWW+m+IDuZl7xQUlxmUueWFZvhz/Iq?=
 =?us-ascii?Q?G3hpEP2WpSDcVyMOoPnLg/x+ggqF6w9aFZGoisjK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c57869d-9029-441d-803f-08dacec617c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 09:19:04.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8LARPpaMr7ROUff5lOMPCMy0WiWct5m4NeoXidghrqLPhAWK8FYdYY0zGtujwxNMGLWqtmAJxIpApbYkhBC0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7677
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

current_link_freq field in ov5640_dev structure is link frequency,
not link frequency array index, so correct it.

Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")
Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Acked-by: Jacopo Mondi <jacopo@jmondi.org>
---
v3:
  - Remove empty line after Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")
  - Add "Acked-by: Jacopo Mondi <jacopo@jmondi.org>"

v2:
 - Correct typo issue(s/structrue/structure)
---
 drivers/media/i2c/ov5640.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2d740397a5d4..3f6d715efa82 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3817,7 +3817,8 @@ static int ov5640_probe(struct i2c_client *client)
 	sensor->current_mode =
 		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
 	sensor->last_mode = sensor->current_mode;
-	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
+	sensor->current_link_freq =
+		ov5640_csi2_link_freqs[OV5640_DEFAULT_LINK_FREQ];
 
 	sensor->ae_target = 52;
 
-- 
2.37.1

