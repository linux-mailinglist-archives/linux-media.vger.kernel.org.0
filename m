Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBC66404E9
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 11:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbiLBKl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 05:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232306AbiLBKlu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 05:41:50 -0500
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2044.outbound.protection.outlook.com [40.107.103.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3AFCE43D
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 02:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLy2YQvTm5eq2n0Viu+CtFgAnoa6vvFcvus3Lo4wzFo6+cKw1LQRrOj1n/4XPve2wZNIBlZ6yFcy9YJ66F+8UsKaoQuTHNEidwyIDI3ScCj13Ckjcv/DxcdoHLSbJ5dLDddAaHBdrhiIoNVc3YoEXgXLrMsvFjAHwa+8Jzzzm4qUlzjIPF9I3UQBrKYi5/cxy47Fy4zT7NkVsvBUk1xPyLKaf0oxyhEIoLtRFI464fLRjWGteQOg/YgXl9lqvI3HMWS6DBi9Oy9AL37tiR0IIW7gDBPl4CkSKYOnQ3OuIaa3qWwsusxKJgUQLgI77Vg50+lvQjPIxYPwFmTkN21srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/a5ty7kvKqG5IF4pzizaAJFRw1A5ixxpqlM2ej5Rlw=;
 b=mfhqgKuChJI2uImzi/RcA/b7X1rQXv9qK7xUp0um3QW7FHcH3fgEnl35m25oClxAqgrtE0I6f1Ndt1NAIeVUj+2w7zY3anuujmjR5a0RXAFNggOubLk2FRBWnI/+xC0lGYHrKte6xnEMBCtU4xo5pL6e9YxjnnJXgBTtrdXwSNj3iBmBDW/eJI31UHHEKRiC/csWlXU2N7UEPyjPQ24AN6Y6FtQe51FKqE6Fdrx9COzX9/947g0ec5qKKjzwijqun/DXy8XeUI3SZnhMkQ8ex3zxcQk1qehZ+8BXw7mNQ7qvx1lAkxLfu04Umg/GdsLDTO4g5Ue+ZH8gMFLN/RXTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/a5ty7kvKqG5IF4pzizaAJFRw1A5ixxpqlM2ej5Rlw=;
 b=RT6+WTZBNHVE7mYDKflKJa2+3Fm/glpeT3vO+ZN7cY6hSFjpsJ9H7ABVfSqq/Bu3XKWbMHcixKNlpPYYxYkb+VX9B5EIZxvfN+uAb8obHqhZPmC1T2NaO3s6jl+fwFRF/kglthewv9XIwujBTSgDNDN2VRc0+z4DjS/XKMmr+cY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 10:41:46 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 10:41:46 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     linux-media@vger.kernel.org
Cc:     slongerbeam@gmail.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        sakari.ailus@linux.intel.com
Subject: [PATCH] media: ov5640: report correct frame rate to user
Date:   Fri,  2 Dec 2022 18:42:50 +0800
Message-Id: <20221202104250.2634726-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:3:18::33) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 99531912-15d3-4994-fb18-08dad451cf45
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FumEB+e7W3RPYSLgIltpHsj91jp+L1vX8H1QXEenRyaORF/acQ9OvpgtXPa0dTiMRUdsRPAKJlYZwCtPFalSIg/bWg6cuoWRiyVcEryoeBOAbS3G3sw6pnGIPP45VNonBsaZ2xN5Fj5QBnan+gvrhPr0+s2+hAk8zPtK1KwGPpZptcSeSV1nbwmDUeFGLeTJEv9ogIhLFl1AdOY0+mtKGBrIbim/5b+I23yGgdzwsiP5i7ig0WiQyoILJsig1W/CFBt7domHh0Lw9TisVXhe2wbk30fn1bHYYp86q6KgXmnCHBRdAI3lr170/Q83/E4RXnxJkW6k4LqggqKGNuanUoPqXhrlK3TbG7eoQ2ufnmiQLAvqITVh7QG8UxrQScdxYQzhHff0u5KTLeTRwfHDsma3LsQ1U049Lm+UUqP1eUuhSWiimFCLUaV62P0+HXLx+HKga527kXnd/qgOTJWsX0uO9BQODuQq/gsjAn81r8FWdwlf6GD1y83pi0qieWcX06nzb2OngNsWLyNdxGO5BxvGq9xOq16Ccv6LuXkUezIVOpsUxVTgJxEXbA7Q6FlrBxpxdMg6vsdjVP3yt+eNUId91fXTX9KodPo3EcAcvUQTDJXl9vUfcAj8eyxoh6WO35p+55T4fHPnbWYgjN2wI2v0IqFsRZO+78gq57KbHeoTqERfCB8CMPBVKiAXA2aKt3g3KLuiVUPvvEtLWky/UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(1076003)(2616005)(4326008)(66556008)(66476007)(66946007)(6486002)(8676002)(41300700001)(186003)(2906002)(316002)(38350700002)(38100700002)(83380400001)(6916009)(5660300002)(8936002)(26005)(86362001)(478600001)(6666004)(6512007)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XSQqrweJdcyG9wZ1mw7siK51Hbv/GlfoscbSZZtNJw4rNCJWgvijP8FMh0N+?=
 =?us-ascii?Q?DYYdKDCxSX6UR3n64hilzwpvJ0Iuy0CoMTvgJJCTH3trHukOW/8C4XkYp2E4?=
 =?us-ascii?Q?tSbFaO8SQCNzSY27hHRj1SP11PgKc/OJLe0KSP0ysP4mtyxJcaLhcKw3aX5h?=
 =?us-ascii?Q?nzK5Lm74Sgru1GToiQEZY16NbUtVeEE95RadFkJb2B+AAz3sMaR3A+qbnqBr?=
 =?us-ascii?Q?df+KJ10sReCVEVMk3TfL9nGEZW6d9Y91BebA/QfsuX4cwcG9tpeVYL+NzvN3?=
 =?us-ascii?Q?MMJyeXwlbsHitvlCJ6puOg38pQiPxZEUt/HtLhq8Q1JAR3l6rtkCj0Mpe3XX?=
 =?us-ascii?Q?LlGPueRGFC6F3rw0RlYuY25sowArnQ1ZPq5lkgIpvEnWR9hEq0T5nGu13PKl?=
 =?us-ascii?Q?HwTlktdlO9q5rXABwmd8Y36nzWUr26pS5ZXXV7xfe4Z8Shpp21qJJSsaRRpj?=
 =?us-ascii?Q?aqcqOYc0Ip2p2r4K5K+rSo/jpVGEj3NLX3GKqbxtRGB7lcYSDYDxq3CFNbXT?=
 =?us-ascii?Q?kGOZhwQUVGkC3or3ewq0ZTJ8gLCPkyKhAVDp+dkn7hN1HesMBiN6VKoCDy77?=
 =?us-ascii?Q?I7xcTvv5jBRvhSfKfrzKpa6ZzaePXaUaWTlo+E4jpC7aaJP9pvDfIr5AjUCb?=
 =?us-ascii?Q?lu0bXhTYEc/2WvpR0XYqgXkqZFRHlQzJZHsSxCie7D/g17z8wmXeBawdMQZz?=
 =?us-ascii?Q?C31VarZlHYnwq0ghwGExfUQ7HVgzhpSDB1cNHDmwW9AkBPA/IOVskPeROPlA?=
 =?us-ascii?Q?0XqrHCpTo6Ud9Rcc14aAaOV0meHy4//nccONn/hwfJe/X95VQev9TmkMPiIe?=
 =?us-ascii?Q?1aq49C2Idvml6aSlzHuMZ4IMsDG9ZgguNQkwq2btMDR+1a6BGFvjrpPWVsU4?=
 =?us-ascii?Q?ehsIjaE94+vD2k1dCOfnUh3+gPxBG41YbVBiFB4Z1jx+a9YSZv5KAIGcAK6/?=
 =?us-ascii?Q?h17uBU8IJOTfYiHOgRCMOXak4Y4tBZA45K2okAZ3aYbvFs/Pw29rkNoCYc9C?=
 =?us-ascii?Q?P/YqzHcxDNbruAfkbwnOEjL/O4glP/cvAghw0RCCCIQYhTcF3dnvk2BSVUtQ?=
 =?us-ascii?Q?5dE0FJLqrC0iwTD984W2Kp5t2fR9RwMsLXjoWMgyUMdMNJixULO9a3ME4jJQ?=
 =?us-ascii?Q?+0zivvWO7zOBHvQ5Ugt/Jh6KclWQCPVbFBw67wmNEQa4lVy0ZeDUJklRbPzK?=
 =?us-ascii?Q?otFF074q9i+1iTtMx5nOf5O+kWQMKTtL5QQSKmhioAEbMg4cSekjMp1xkLu8?=
 =?us-ascii?Q?/RQrKxJmrR2rZ+PGaBX/JjVWVaLY0EYUJDme2COcsg7esJ18Hc6xGAlIeiKn?=
 =?us-ascii?Q?mO1gZirnHOeclZHM0DsBlx6/O0bfLZb3lSZRzkYy+vNHiCyvY5UGdisX4OBf?=
 =?us-ascii?Q?xc7g1zfIBiHbi+Etod0Tn1/8EIZLbDJga4Maw00I60evkjBHiZqTIVG9YkN+?=
 =?us-ascii?Q?0Qye66Cy4YRPSZ0MyydR2HrPvYftSLS6C1GSjT+YHhbyGnJmKXDQbelheQyq?=
 =?us-ascii?Q?KjwQ0MgamrajGnvFF97vC31BdGfPT2G28UktZhTIRIWZzDnmLAOrkU6q3p5t?=
 =?us-ascii?Q?7BkSRKs8s2C61In/+hXQ40r2MUhUJBz+xrnSl8EL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99531912-15d3-4994-fb18-08dad451cf45
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 10:41:46.5630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKk3Bc8L7nkUubpZZeCxrUTdOfXQAU/qE01CBcdS+p/z4+Hub1mYVF7zaC8fjL/nff5N/7cfOrf2qdAwPPESpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

In commit 3145efcdb4d0 ("media: ov5640: Rework timings programming"),
it defines max_fps field in ov5640_mode_info structure to store maximum
frame rate supported by each mode. But in ov5640_try_frame_interval(),it
assumes the maximum frame rate supported by all modes is 60. But actully,
only VGA support it. For others, the maximum frame rate supported is 30.
So correct it by taking the maximum frame rate supported by each mode as
the initialization value of the local variable maxfps.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ov5640.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 3f6d715efa82..a396f3eaf054 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2722,13 +2722,17 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 	int minfps, maxfps, best_fps, fps;
 	int i;
 
+	mode = ov5640_find_mode(sensor, width, height, false);
+	if (!mode)
+		return -EINVAL;
+
 	minfps = ov5640_framerates[OV5640_15_FPS];
-	maxfps = ov5640_framerates[OV5640_60_FPS];
+	maxfps = ov5640_framerates[mode->max_fps];
 
 	if (fi->numerator == 0) {
 		fi->denominator = maxfps;
 		fi->numerator = 1;
-		rate = OV5640_60_FPS;
+		rate = mode->max_fps;
 		goto find_mode;
 	}
 
-- 
2.37.1

