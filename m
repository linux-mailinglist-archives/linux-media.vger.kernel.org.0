Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9744758EE6
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 09:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjGSHZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 03:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjGSHZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 03:25:34 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2069.outbound.protection.outlook.com [40.107.6.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CD5E60
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 00:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A94pD4DKIz0FkayURUg2iIOu+txwGHeswXhbbaxbF0QKDedy+uKRN9HQUn6q/whDMvpi/uhmfhkHhalcAMAw7NTr0whhyTam0o7imS7RPXFGUhrIzqs0vzVLsbh6/xtwEe1rM+YknTaqM1Dj1JIwPXuhE4jtyaN0LCbYs0UGslpu159pVTW2+M1qML0C++p+6al1bjKmwOjw7EyXe831fpmR7wdEwOA2NTxZb+pMbqbsKcJPb3vVhyxCQVr4xGAuRhJYm/vg8JjwPqBAUAOY9KAQSkub2t3CufNm5XcH1RfjAvJNibck943Hv6crDmO6pvDqwADefy1PlWeYsR6gsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXwPFtMC7x7ox8za48tlSTjaz6uzjbFLOTm7B+ONjB8=;
 b=KshjX6I+rVIPfIc6gggPOxYD24PDBNqqosv1CXJgg5BhPgpsuM6KoFUuzM2rJNljPGKaPJtNIcE88jceps//aoYMtiOpE6yu62OJNyuoxIZZChou58TbIX+ZRcIOm5yPoqvehFqCmMEuARZchq0BN7ZrNXIjfcUbqnnBV7XwHPE42eHU/L3Ceb1jC2MONYPHpK7m3ibYwzBm8WZ5JAGS4ksDhwhr39u9aDDvkvkWr68SvVAuMoqiHtreE1+YZBJe/KKtkX8wOZ0Kj7vlIzezn3V9c98aQrkgPO0UdsCz9Ft53SzdYtJ6Oh4++7EgDDLibVelCU1DcuYFzqR2rL+BgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXwPFtMC7x7ox8za48tlSTjaz6uzjbFLOTm7B+ONjB8=;
 b=i84EoKHaodSNymfapoHk5Fgne0Jej97S1eqyVXdps5RwCTaLGGGMvV7COub5fv9hac1CM0/zdH0IAgX25YP3qII92Vsi0eXyecVXWnBPxnilodh9jHkfaMCimKdYFAavQjJdyDlOnA9vCJBuml6ggfqnoeOWkmlf9LohFuM85+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 07:25:29 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d253:6cce:4b4d:ec08]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d253:6cce:4b4d:ec08%3]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 07:25:29 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, slongerbeam@gmail.com,
        sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] media: ov5640: fix vblank unchange issue when work at dvp mode
Date:   Wed, 19 Jul 2023 15:30:12 +0800
Message-Id: <20230719073012.3739998-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1268ab-c2a6-4b21-46d7-08db88295449
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1ye8NqjnR+UyEbODYEVWMMhtQrVbey+nvDhLgbigGMhuaR/E9ArGlUbMMtB2245oKa555eV0zGFPOqo27sUCCgmGbak4Z/wuIlTwf/ztj2y2hiHq0wY13kGyjdDTu0wNc4FEU+1pnG61pISvO/BrPS/AaASD+SWZ5MKSz4cyHi6Nn8RHvlYwrjdPIss475ZvotYeiRAyS8insjcHwnhNTh03S0t3g/rB20BgMvRzmCcy52mcNH9quY/QcOPAp10dvaFsHQxuZxu6xtz62k3cteNGNcVpbcBZPgXs5R7hbUwFQgSwOY6PV52NKiiZbjVUWkVQ7DYHY5JXck5bB51lc3hGLgpiWmK1+3XUYim7vxHikJgTI+7HlrVE5UKdbd2ST4TSq8Gk1e4DXTkfjWXIEGnxdSMtF9hNphgg0qzC5NbUOuPx7IhEfQfdnIRVJCou/lZHra6OPxSjnry2mQlzxECyXMO6eqPWpzr6I6u1cKEw/kgHBoys83GquDVCHuOYqD2mT19X9LvISXV2+fVfvaXYKk1euxn9wHEj1DxZE1/uWBN7IWuvGyeXxliROFraRBrLs7ZSOY9EbWA7oT9r7TmH6umreU4OCcNcuyLMM+FmD8cOf+gg2bE7NJxlFpx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(9686003)(26005)(6506007)(1076003)(38100700002)(38350700002)(478600001)(5660300002)(8676002)(8936002)(4326008)(66946007)(66556008)(6916009)(52116002)(66476007)(6512007)(86362001)(316002)(41300700001)(6486002)(6666004)(2616005)(186003)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kcg9U2Nw5MQOfejX7Z8hJVFXMoAjWfdictJAqKR1QjQNQLc+Q6kH2xkT1Eom?=
 =?us-ascii?Q?HkZxvCTfyRI+DvMrnuuroooURtQler32var0RW1Kl19IpLbu+4YG95KZcIKK?=
 =?us-ascii?Q?MqU3vC/4WuU5riX6+/Ne/OvKPfNY8Uw5Bmp+n1tm3tvAI8/i7TWjQ2xeowIw?=
 =?us-ascii?Q?n12tUu6nKCeY1Dsr/g9b6TJZN6Bz7q7PB3k2z0GD29iX7KUa/e+UEw4TzuaA?=
 =?us-ascii?Q?do9v394FKNjyKT7Arj/oZCz9h06AMFcGuX5WO67Fqtq0BLJRj0+9STrnwwul?=
 =?us-ascii?Q?I9IcToVPBAu/cAGjWHwuOpfQ++kkcETyhpf0xRyd+aMhICQCy+PFM3Y1fvxG?=
 =?us-ascii?Q?rmTJFoplthTKx5mVDAC3lgYhBnqyviTN1ECKKOqKHGqoq26QgmLykvdBvNN1?=
 =?us-ascii?Q?McQ4Qwi/VVr9jvFmdP9GNm6wo9YpiqkNNr+ZEg4nBdk9svHxMFZDNnvXnEgm?=
 =?us-ascii?Q?FPRsj4f93KGHDocuMScc96Ny9z67M8+0GwNwkEAVNwYII9W2mvDKTnWklTWj?=
 =?us-ascii?Q?N++WEMMpB6cRDfWeRgAv8UsVgVg68jpJOdLjabdgF4EVhBQd3TPDx6iWpJN9?=
 =?us-ascii?Q?HRwca236MUL08GPidXz+mAp1f4jB7NtUVEE/eoUEjKPH6Epdkd4rEWrTcjFW?=
 =?us-ascii?Q?J28xLHHhqf1bUkWmK6ihdQEY12yvC6rGL/f2VJ83lEYp/69MygYeHBLgsXB1?=
 =?us-ascii?Q?vEJw84mzthMAg55dpUPtvfY8OrI/r21bteDoOZDPW3V3N8EIfGeELd5MGg9m?=
 =?us-ascii?Q?m46V+Hh9fQIfsmye/9zCHCCqXWo8EZpCnoa+hkSX5zbaDaUGjRWuRB40b4W+?=
 =?us-ascii?Q?81e1fZgtMnzeoOZwAWBB8WajfJFh9A7uCTiUKSrziyj/JAijxGvRm7Zdne4C?=
 =?us-ascii?Q?VcrUElnwV2SAdxEEG1Uta+fUlVURKzkUtdTw7S/qzn1aHYKcF3wmV54XZMzd?=
 =?us-ascii?Q?WjArAhkKgmjUe3UFZ6Q8BCRTOF6EnAh9x8i+lur+Q6y1OqQageNScEgI+CFS?=
 =?us-ascii?Q?N4sVnjKh49eAgXOsIPIwW0YMwRpu39SuX3jPAPpzHz5X7vjlbCsL6BJU4xhN?=
 =?us-ascii?Q?Uvr379NuPQ6Euqao2/CXndb7OMQ+DRYQWEBI5XMBd4hGb2KHBj2II/O+MFwx?=
 =?us-ascii?Q?+54Z1Febiew+sc8XnnF91i5e8SvpvyAygHOTaImHFJZb34eidEXcxeH+g+AZ?=
 =?us-ascii?Q?t9wtWtlsp/2GSDBVGD3YHfdiSF08YgOdG8yeih7GC/MBkscH9IHT62btATrR?=
 =?us-ascii?Q?pHyV1JVcrqqniIqwzMxQp8Os86I+IjMcIPxy3VscQxn5fanZnTliY6EhDXY2?=
 =?us-ascii?Q?m88woCfKwaI+NWcglS+Q7d2Z68BqBBRqMIiaEw0YSImvsDEmPADsMy/i52Pj?=
 =?us-ascii?Q?vMigaKNWZDODp9J81V/um67wT6ZJlq2+uDvk6bfme/frBLbp9zcLhIVUala1?=
 =?us-ascii?Q?1l3kSNZ+dCSZ9lE6DBYKsA/HphShsVLf9QE0JTdGh9C4KWb3sepoUqTynGoa?=
 =?us-ascii?Q?wUi/SQLVX015B126eY/iT0pYNjylVIPmo/KVKkhwVCLuxlQ30uV5M2yV2EOG?=
 =?us-ascii?Q?yiF6mgLj2kcmWTx52/3tcfZ98MJ8roKt+767wHdN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1268ab-c2a6-4b21-46d7-08db88295449
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 07:25:29.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoV+shJ6bxW3ISHgyNk3KUeoV9DkdHBZRDlQXjdt4FC1Fd5mkswVQjQRupplv8LRwxz9imlHZYXdmI8WfxJzFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

The value of V4L2_CID_VBLANK control is initialized to default vblank
value of 640x480 when driver probe. When OV5640 work at DVP mode, the
control value won't update and lead to sensor can't output data if the
resolution remain the same as last time since incorrect total vertical
size. So update it when there is a new value applied.

Fixes: bce93b827de6 ("media: ov5640: Add VBLANK control")
Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ov5640.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 36b509714c8c..2f742f5f95fd 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2854,12 +2854,22 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static void __v4l2_ctrl_vblank_update(struct ov5640_dev *sensor, u32 vblank)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
+				 OV5640_MAX_VTS - mode->height, 1, vblank);
+
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
+}
+
 static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 {
 	const struct ov5640_mode_info *mode = sensor->current_mode;
 	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
 	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
-	const struct ov5640_timings *timings;
+	const struct ov5640_timings *timings = ov5640_timings(sensor, mode);
 	s32 exposure_val, exposure_max;
 	unsigned int hblank;
 	unsigned int i = 0;
@@ -2878,6 +2888,8 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
 					 ov5640_calc_pixel_rate(sensor));
 
+		__v4l2_ctrl_vblank_update(sensor, timings->vblank_def);
+
 		return 0;
 	}
 
@@ -2920,15 +2932,12 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
 	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
 
-	timings = ov5640_timings(sensor, mode);
 	hblank = timings->htot - mode->width;
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
 				 hblank, hblank, 1, hblank);
 
 	vblank = timings->vblank_def;
-	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
-				 OV5640_MAX_VTS - mode->height, 1, vblank);
-	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
+	__v4l2_ctrl_vblank_update(sensor, vblank);
 
 	exposure_max = timings->crop.height + vblank - 4;
 	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
-- 
2.37.1

