Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A564074C
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 13:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbiLBM6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 07:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiLBM6u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 07:58:50 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2057.outbound.protection.outlook.com [40.107.14.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D938E1007D
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 04:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeLDPn9KylTR2Ydf+SmHZRmLyC1TslSL//hmEWnyoruUAgr5g1rgq/LBFfNQTGhup7zjUg8i5QkkU30a22XwLL1wmtgs+URdgpMXzZtbaDH+nSphpuOK71KbdHxOQnxWdg1OPw+IQl1fTXlt87dyE9frDljvKASnCxM1hHLeOecRtlQvbNDVHBKyc99msM1w3ZgY1P3dNuZ7mLTzZwywI+JgNkDI6YGV9wjOrMGtJP41e4PuEGha62ZaNdX3iUniK0/GRQQk/pPHZVUq7i4Ca3Yy50q8nelKEnXwLEEIasjoZC4zXVe9ZmjY4qBmuJMhBDQUnvCFJJEWQBP5yfN2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgJ3VFwIjoNo74ZT2hiEtGWx6CRbZ1K/jPyHUXTbXS8=;
 b=dwcneslKWobz00PjKkWtUCTQu4SjRJcGcsHXO18dUsWrwmUTFaioY9SHt9qeo7SGyBJQskC/uWQuwm3JVrCm8IZdTldvsuersPLrfrxiFqfnw51AFo2kT8IG/Lo+4RIwC8Kz4spl8Lusb5yb/xP40TG4i4odwDrscXFvY8nnLNDwiSimmsK+91Nu0aupWob8ZJKHVB17dTSlZGv/1V7LYc+WX+w7setmrO4iAybfv6gT/LOAxUAOn66B79FdTpLfPEAR46gn6vMbfIr+A9DmvZOMQkLYKfKsE8j7U0zOStDzBD2NjI3emK+pWit9IOoXkqpqF15FgevEO5BBr31APQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgJ3VFwIjoNo74ZT2hiEtGWx6CRbZ1K/jPyHUXTbXS8=;
 b=Zyx9QPI3tZ/ePjag9NeRNTp3iDgYXDbkylDJGPlUY+YrPAQQYLIyQhS3eA2YVjvbk5AS+Mdw/T+UPoAvxfRvr3AVRajd93m+Lb0a4Wgj8tmV8+nZnixKAxZGetC4pvJs7URQFCrHVkg5Bl451DbsaYQcoSuaBXT59iHvsx1RVf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM7PR04MB6774.eurprd04.prod.outlook.com (2603:10a6:20b:104::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 12:58:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 12:58:45 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     linux-media@vger.kernel.org
Cc:     slongerbeam@gmail.com, mchehab@kernel.org, jacopo@jmondi.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/1] media: ov5640: report correct frame rate to user
Date:   Fri,  2 Dec 2022 21:00:00 +0800
Message-Id: <20221202130000.2719562-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM7PR04MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6dea91-a22d-4acb-9b06-08dad464f091
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7AtK5TA7JyDau+H1eaENCTprt5R1O1WppH1RpaJP0lSaz/NVm/ZFScOvsTbhwzePS6IYSZ5w3ffTV+6kmWIUAWQgNbbDdZHzXxkCPNhC5VtPpKhQlz3JsMC/V7gbjXY1AGFAFfQmURVo2zIPZXs29yGWeyDJS6hV3K+BUnv7/7u94B/j7XAnS7k5Wino+FFmhpibQsc1Sm3wxHWQ3tzE4q1f0AHu7BQ3cmcCGY6nrw5AD8tpBrRG0kWsk7W2ORYi/NnaDA2LyddIWvRdFHhKfnqFgF7hRG1jxCMe0+dkaWKIVQnITvZSh1mL5+tEgdRv4MIotkH4dpgQaZ6ct5hLlWtrD6QFZ2HQAHDeScTrSwOfgspjn7V30vvK/6Lm5/MYVsYmJ/VcNHXrdSmXD8HIbcBGJMxHwLHT7nZtorJAI1oDqn9XUNnfLs5WPoWh9deldAUkvXnwG7vJRgHdmYNKBbV4ZuNJQnzFRe+2I4WF76N6mf3+bIxgaZJuYldXGOxkBWgKCSIFDB+0JmiBqFDNTbHUHKt0LgXzEerGcbFuG4svvID7q+Kt6EMZXy2skvArki+4Vz26GyG9RYsyMMHSg5e2KJnw9hTjcILE8riBarqHEL+h71oVrUx86wNKWe6/riM6VQrfLtJSvd8tzdDM26z1mklFBUwX0+YyYhn+FsZJJ7HIArPH/zD4+Sy6jnw3EKGOhKNvWGaSQ2YWCLMm28awGnflbAPlpcvHZV/YqD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(2906002)(83380400001)(66556008)(1076003)(41300700001)(2616005)(186003)(86362001)(6916009)(38100700002)(52116002)(26005)(8936002)(6512007)(38350700002)(4326008)(5660300002)(8676002)(66946007)(66476007)(478600001)(6666004)(316002)(6506007)(6486002)(461764006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RjNcLE/w5NviFAm6zSEzr2ZFSBGQMIvtRoVViwL6+uArEf2LJebzf9wEjgZb?=
 =?us-ascii?Q?IFyA2S4CNhWZBoU9+h0s5Xz/V3Gp3VJK8i6kvHKJhsDlaNBVGi8g/f6ORgPN?=
 =?us-ascii?Q?fNkh5NukWygiWOsXJ9EDLfCP2MWO7/hDvWK5T99Oom211DuKTzecKXabw2uB?=
 =?us-ascii?Q?Wr1PGUFxsHDHYaBrWQz4AJD7bH0Sa05u6J48g3shjwWTc7nMC9i+gxIljVAn?=
 =?us-ascii?Q?n9jEKBP9TNTUKcrLh0ZNzvPfMmf1ESbZK+u8Dg6QFhDUZ4keIiz+woRODGlX?=
 =?us-ascii?Q?8KhqQar5NeVHk5ad9GoKzH9g6veT/bJ6Y9MkJBb6hk+uTjEbnwQJplFeuVdM?=
 =?us-ascii?Q?gDSZeBJyci/DmwYmMSRKQ+swQWdLLlY6SCb8WS6v4ixSV3WqWV952qQ8rdZL?=
 =?us-ascii?Q?OneZeZlHaMzot/uC94xyZLt5Tm2nl8tfopZzwu2snQl5Pto+Yn36S2yj0Mw4?=
 =?us-ascii?Q?wu0ikYUQGydDV+XJNgE3zasiE73I0Kr34qZECQbQzMuWfXmSBvaXGkSpRXwT?=
 =?us-ascii?Q?ThtxXrZ0g9JcUQrss8roglDQfOAzmn8eHGzdVKelrCnAWYqn5zhWrCRIZFfp?=
 =?us-ascii?Q?IuYlf8JYKyfMCkpoqUqBsv/Qh7AKWvvijChbNBE8h+WLYBUTAiIcGUglyATq?=
 =?us-ascii?Q?zr2DuX4bSVVDc/cAR6EV/SowOMzHr4hsoZQMWZZseWS6rZGXyMaHRUaoMqsO?=
 =?us-ascii?Q?vy3zw+xnwICnt07oKcz/D7ji+IjH/SMh1W2+yfluomc4ZOPTkZbcvdNz7Vew?=
 =?us-ascii?Q?h1m4g6mqQZnKThD9JyR5raUiqmy+IsAP+ecxl3kZkamEgfGb0sJzyzWNklqi?=
 =?us-ascii?Q?00NB01XKl1Eqaq4w88V+ZCgLOQlLxRoUPQMNJkDKGWm2/D3aNr/FZ7KmTqgz?=
 =?us-ascii?Q?7utB7StTbDWJWtDb9RexvXikMa8GxIuSvzQS112fWTdQ3fpvO6q+65ZH7TM2?=
 =?us-ascii?Q?/jgY/4yGIQbYJ2ny2UPTweq4m4n0e0RcahXeZ/KkJOTu+wDPQeRmuR3dvhzx?=
 =?us-ascii?Q?9Sjh1y4X+lG865v9F+Y5we9PD/TVjmGzog+vINmRhugwNcNOIRv07jHdfB4l?=
 =?us-ascii?Q?juc/I5TQGQl57nciZyNvOUGviwNE6ChsLA4L/B4jfu24Oz+NoYb3TqH1qMAL?=
 =?us-ascii?Q?yFKClotrK2V/nqXqDXjyUKswRCkNLVNMidffll/PwQL7oOZT1IDOWn966Sfe?=
 =?us-ascii?Q?OoR67qQNfIf25WAef2P90OyoO+aXafHdTN1oAmD4RBXR65WP46L7JUMs7KHo?=
 =?us-ascii?Q?q4B7PU08ryeAq/QooBeQxs46V+aJus/GdZf4j4x/XeCnbo9gynWbOeswb7IL?=
 =?us-ascii?Q?jjdRrjcXHmZMzpaGwDQELU2v1nDfihxR+2UkjGGv5tFOXoQZuPW5cEx7KT+1?=
 =?us-ascii?Q?dzgWTykh1/smFryRKQaFUfHJbUEgXKK8mL6LieDsXtoubcftVvmZdP7/WatY?=
 =?us-ascii?Q?QtnQG3X7YbFQLppTSDUKjbXmgMhWU0wIYgX+h1CfYeIH2/nq5PvkZ+Pqt176?=
 =?us-ascii?Q?/yNWknvcOrXk67dmRWUX8zskizn8aMCqbTonUOpEpniP9M+yfoyszGw6XM+b?=
 =?us-ascii?Q?Z00NJyWPfhNG6owxKFdHpYwY3IKvpdXJgtOL57pd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6dea91-a22d-4acb-9b06-08dad464f091
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 12:58:45.3978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lton/H8DoCCZwXH29cA9aFwNMJ63ziyUZUWBSUFtKqrdZB7qjR20LGJo/mhRrbyXPHUUl2RTMMMIrq/WDyDKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6774
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
frame rate supported by each mode. But in ov5640_try_frame_interval(), it
assumes the maximum frame rate supported by all modes is 60. But actually,
only VGA support it. For others, the maximum frame rate supported is 30.
So correct it by taking the maximum frame rate supported by each mode as
the initialization value of the local variable maxfps.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Correct two typo issues(s/,it/, it/ and s/actully/actually/)
  - Move the ov5640_find_mode() call to ov5640_enum_frame_interval(), and
    pass the mode to ov5640_try_frame_interval().
---
 drivers/media/i2c/ov5640.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 3f6d715efa82..e0f908af581b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2715,20 +2715,20 @@ static int ov5640_sensor_resume(struct device *dev)
 
 static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 				     struct v4l2_fract *fi,
-				     u32 width, u32 height)
+				     const struct ov5640_mode_info *mode_info)
 {
-	const struct ov5640_mode_info *mode;
+	const struct ov5640_mode_info *mode = mode_info;
 	enum ov5640_frame_rate rate = OV5640_15_FPS;
 	int minfps, maxfps, best_fps, fps;
 	int i;
 
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
 
@@ -2749,7 +2749,7 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
 	fi->denominator = best_fps;
 
 find_mode:
-	mode = ov5640_find_mode(sensor, width, height, false);
+	mode = ov5640_find_mode(sensor, mode->width, mode->height, false);
 	return mode ? rate : -EINVAL;
 }
 
@@ -3554,6 +3554,7 @@ static int ov5640_enum_frame_interval(
 	struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode;
 	struct v4l2_fract tpf;
 	int ret;
 
@@ -3562,11 +3563,14 @@ static int ov5640_enum_frame_interval(
 	if (fie->index >= OV5640_NUM_FRAMERATES)
 		return -EINVAL;
 
+	mode = ov5640_find_mode(sensor, fie->width, fie->height, false);
+	if (!mode)
+		return -EINVAL;
+
 	tpf.numerator = 1;
 	tpf.denominator = ov5640_framerates[fie->index];
 
-	ret = ov5640_try_frame_interval(sensor, &tpf,
-					fie->width, fie->height);
+	ret = ov5640_try_frame_interval(sensor, &tpf, mode);
 	if (ret < 0)
 		return -EINVAL;
 
@@ -3605,9 +3609,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 
 	mode = sensor->current_mode;
 
-	frame_rate = ov5640_try_frame_interval(sensor, &fi->interval,
-					       mode->width,
-					       mode->height);
+	frame_rate = ov5640_try_frame_interval(sensor, &fi->interval, mode);
 	if (frame_rate < 0) {
 		/* Always return a valid frame interval value */
 		fi->interval = sensor->frame_interval;
-- 
2.37.1

