Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35476FBF95
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 08:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbjEIGwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 02:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbjEIGvz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 02:51:55 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::627])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27582729
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 23:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYTKkuOi04I/p6FcbOtPgoio0akPFHvIj7mHOGe1gcU1A20AQUBZiHwqi/mloPlB9isQZtU2FXSMtVX0/v6h8eMMx1XThlSDYBHcdbrStmFU5bodbl8lFdXMdeuIye6W3deM08xCY7lwwGtuRCbrUjFSv09wiTqcg63tClcTT1ta47St9sPWDp5NnESNbYHRfFDzsQ/WRjJ7rc1iYSXTZMEM62xFC2Hfw2xPbwCEalu1ggOSmWhRF+nN3uxYj4XtqMkuCqrchVMezxRf2fNjoPzCbZp+eHB6o6OHZEkcrHyuMXiy+RZUdZb3I8UAV0EJu3vRQfymcg8VwgkKaGClkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/AFAtrp0gbyjehVzRFXNePkfgURA4+eHA922BPmz+o=;
 b=HdTKbxsrYf92KOLYy7A75BVHQ0OBf/QjL4vLq5PqPkmGLcdMzBxnL0eSs9cEfGoww1NyCrH41Gs+6e9ZGf0eoCiRWK6diV/L4iaDNYxtpKZZXBsmBnAa/Wed8O3aNvh6o5prftZNZAS7UquxpKNwf21Oo2OLNF1naCmue57DHASVzeG68TgYO2dDAQDIUNQyBxw0pWvo5B8CqgCBJHt3c891waJKe6i0nvTNoEJPGFmv06En5vGaoJymEgxrltmzLRc/uiqfP2CcjX78BB8ZzXSi53v+KZXWDONHpHtY6l/b0gFmXA0iqqT8ROhLUVA9OnXkjsmYuakZ7VwZktRZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/AFAtrp0gbyjehVzRFXNePkfgURA4+eHA922BPmz+o=;
 b=UGDH9om1JUcuhn7w6/13Qc/qTzdw89acayRWW0Phev1TtlNgdr2FIGWU7S0XtNpKnYVGuuN9u+hb43vbZUTGK5t+fXiVGTygaVvWiqmfnZPGmVqFA1DbJqQVFHtmxawxXih5YGhfto+nkYG5CfLKBM9MKRhnC+mlXZRrw/GIpQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8434.eurprd04.prod.outlook.com (2603:10a6:20b:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Tue, 9 May
 2023 06:51:48 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:51:48 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     laurent.pinchart@ideasonboard.com
Subject: [PATCH v3] media: ov5640: correct comments for default VGA to avoid confusion
Date:   Tue,  9 May 2023 14:56:45 +0800
Message-Id: <20230509065645.2827855-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8434:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1f2fc2-bf2f-4463-a0a4-08db5059dc20
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfbvd0dzbarML3FX0qdTtXDr6lFTlJ3t+BmvxIlbBD0+RcUrQaUF2nZezY/VGz0S+FGpkGlvU0gBhuTPmYCvE0hi0sCYcI3eDAYO7JhL0N0BKlsGqYKtzgddH1/3BFIzLT2GJU2KJZsfM+h71+dqXSc7LtTVYthx/maenRfmnsJWvxZ5o574QpQjoeFpWhvsjtsV6wm9vKulDmHpOCAVUG6WeNa+uPmWiZ2PpxL6bX04ES0IX7fYRAK+3vzMdg7asQitrqryt+uy4havQqPgXIwrNTZAQ2b+a/SFSHwcBMM9WFfAMyAWpROkUClHCm2P4liH9QlsxqSC/hHu07kXncylJ15v1XNW7s2bPLstM6/1ZGS9a+9/tRP9H4QApHMnbSLBMTzStLmSlVUgyBC7Cq8GgHt7X104qtxJ8r216eppoaPL60SSp/gfIZGpKaVed4VY4+SNQZgUy9OjInIXLDMv3pHHB6oQX8n180Uq7lHwNdH7g7YBSQD2t9fe5R6FIv/vn5YD/Egnvfq8MxryrLdseR+4WV0M6YLNw34Hulzz+MPlvtLGCsIK42dmZ6O6puzpzYqz5QHxbfJw/6tnz9DSseJgR+dudPAq1nsdRd3/refzirqXyUj8+MpowZY6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(86362001)(6486002)(2616005)(38100700002)(38350700002)(6512007)(26005)(1076003)(186003)(9686003)(83380400001)(2906002)(5660300002)(6506007)(8676002)(478600001)(6666004)(52116002)(316002)(8936002)(66946007)(66476007)(66556008)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXYHusNkvT+0qxJ+3h4j5snGNjK6SnjHz83vHoc1pOUmilq/XyilTu4KCFTa?=
 =?us-ascii?Q?vvzMm7gUSKfpDDtlal3HngMLgsTCkXlUMtVf9A7rA/R32VMO6h0/FdXhMOQM?=
 =?us-ascii?Q?U2ndETV3zzKMZ9lNhb2trzYIuIhi4g8OUGBeBP5ruj1WMxUIvoDza3sr/rPg?=
 =?us-ascii?Q?r3SgbCx6wNKvdZzfYdE1NzEhrs+kM50OTIPyZixhHLTug7Yqk3JWpz7xYTT3?=
 =?us-ascii?Q?sfEHLMrpPDh4cLr+r/AGEZPl7BWCCqP1Jv5ItDCUZI/JM+t65yrnBpyF0nfK?=
 =?us-ascii?Q?rat1jhlM24qM9tscy7PkxRwLsgi/uT0tLzwhrpaNttaVhhxvrPgXlC4EOEuK?=
 =?us-ascii?Q?z4Mpwpgn0pqyhOVL1ivfGZjWWbxNZ7Bv9ogEaOLZ+rXgioF7CnnbWKem6JOg?=
 =?us-ascii?Q?JXNShuHfHWfdtKZ5JaguuYdWRuAPWNYBQctNiZcVkCCBKO2Aj0fxyvV8gZMI?=
 =?us-ascii?Q?wHtNDQ1w/b/lFliyXgNCz2FrW+2wi0mc35lboK7Fedh8pv41CVZiNXUnkz2p?=
 =?us-ascii?Q?CoEGnIQsvBSWo9VpW+rvEqOxq1ZqVAI8J8AnoUmct/tbMForlCWKp9HsnGC8?=
 =?us-ascii?Q?BCUisiUFNQrRyk/pFuauR5AGlTrNsw/OSw/yblnQpBgvO8ztj1Jel1oT5q+d?=
 =?us-ascii?Q?pZHwS4uvIGW9R36H+8PodWEN6j2KPhw029VQL4VkTuNPJ4p4THz3dwdWHCkr?=
 =?us-ascii?Q?hQQIKP4sK87AMaMP1aHSiv0W80iBDkihEjlX70DZ5x+aQ5TFd+OFM4ryl6Iy?=
 =?us-ascii?Q?yY5VsbtBLIRycRXJ2uEi2NAsFxzqFWCT9a7NSvpuYlCaPEc0ziulwBY8UyRY?=
 =?us-ascii?Q?uUUYxJr0A4jG5JnBb5YaEVyhOp0YaIvCjAnDAN9V960/HerXFze102Xfh9QJ?=
 =?us-ascii?Q?dQBX1yurW7NNSAspGan9CzCp2FaeKOxToACGk3f8n6up2GS8I4irEPfuRDtk?=
 =?us-ascii?Q?QlEF+W+7mIzg9h5sA7pjXIy9NQ8wEJKHgLBOkzP1h4do/eZg5BVcUVnZMql5?=
 =?us-ascii?Q?XHjfaNYVXAyAHC3faXrHhkOXvbKyxmUGlLrJSfJ4JkAOnUehQWdkqfpLpiHd?=
 =?us-ascii?Q?JlJ00Z74363+TA/NOTL4Xy1T7BNwvBOs4zvEoNa+LRLIV/gph9YNoqZJPsZ0?=
 =?us-ascii?Q?jf8ztR+DDJbhf9cTNqXhMoXj85GIWuKtA5nvwf14B3ebLEibSPIs/CkUg3FV?=
 =?us-ascii?Q?DMUnbvLqQTPSvKtMqbBa7GcDh9Kxo3P0LXwAU0rI64i2VU9qUAglzPitKHKf?=
 =?us-ascii?Q?HP9C3xIJeuWH/g3W6t9JyP2KXNt1I1AI9qwjA4C4/UiO2fc4N8F+pZaCZH9g?=
 =?us-ascii?Q?E5pu/6+cib7hSXuMR5jX+Jl9lIbdU1KPPR7U/L4BihGY0JLmt46U5Q+67IyK?=
 =?us-ascii?Q?s48FZWZQ83Zp9hIM82wFJXftldNL6uK/1w0QHcN361tInOozUmsURsihI5gW?=
 =?us-ascii?Q?RMxZwo1mEfluwzeNptduaGoqToJezB/1bagJp8OfRI4ThxN31oG1hNUUzTRD?=
 =?us-ascii?Q?xvK+FDFxbEk3/d4i5gr/W+vbUV5Z4tUigEuBzo+rK/CfpAfgbQM2Lg7yRIV0?=
 =?us-ascii?Q?XpUjTF0GvVpgkW3qIRTUOFH5SSghV94+7Isllvow?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1f2fc2-bf2f-4463-a0a4-08db5059dc20
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:51:48.0677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWiae+3BS2/siqWqaXbaYPXq6ygVrwW4/lTzB4iZgn9MnSwT72bEmMC+PtYjZfHAYB8YNFK9Q1ApTAk1/TNnww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8434
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

When OV5640 work at DVP mode, the default initialization settings
make it output 30 frames per second. But when it work at CSI-2 mode
the default link frequency will make it output 60 frames per second,
so correct the comments to make it more clear.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
v2->v3:
  1) modify patch title from "fix incorrect frame frate issue for
     defulat VGA" to "correct comments for default VGA to avoid
     confusion" to make it more accurate description about this
     patch.
  2) remove code change about frame_interval parameters
  3) remove tag since my misunderstand
  4) update commit log

v1->v2:
  1) fix typo issue(s/runn/run)
  2) keep original OV5640 default link frequency
  3) correct comments and frame_interval parameters to match actual
     frame rate
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..e9100988a028 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3851,7 +3851,7 @@ static int ov5640_probe(struct i2c_client *client)
 
 	/*
 	 * default init sequence initialize sensor to
-	 * YUV422 UYVY VGA@30fps
+	 * YUV422 UYVY VGA(30FPS in parallel mode, 60 in MIPI CSI-2 mode)
 	 */
 	sensor->frame_interval.numerator = 1;
 	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
-- 
2.37.1

