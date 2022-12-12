Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED7A64985A
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 05:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbiLLEEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Dec 2022 23:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiLLEEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Dec 2022 23:04:33 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2078.outbound.protection.outlook.com [40.107.6.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB55DE88
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 20:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql4T4UbQ0iR2pMhUGPF8PRmKMT88yStdxo6ZzRye/rhGi+GvP69cpjDHF9Vl+aSkqbgViWuLtI0qqcOrKNguqGVuE/1LW/oA2WIcBvuI83ATaJPgDuufg7OVEkFIOBpzgSjN9HNWDbl3sm4j9wUwoTCY28gnUTGWP2eihAz9JE1SCcMgeJyB8HshJmzyFEiwsWmsNMiPsUiDQa2vJHgdjnY6oIM1TK/5RklhckAT6KcPAucVMP6acl4dFoSmolziWb1IWHnIK8SBETPoSnpLI4l3036wFp81Mc0cDjJtgUUa3FKbhrchwuRzpz7h3IfJ4XnAWnG+nfqXZ7Ei1T6/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USTD1T1PvyTp4tpQ7g4QUcjGfs9YlLSLDJeRCVedgik=;
 b=JV553Y2vlCe54n+W9GbByzQ2uVPWbeJMn47AA1zsPi88m1ili4OhfbcNC4I05/NWojDF61nJiG2gf0T9tbLiPcd0dZ9H859/Oiokt0emwm7A863bB8Vvbsyfbc/yqeK5R4KBQBsoR90PSzLpX/HCSOxT3Fa4gdA7Yr/v63AkHxUOXGMDDM2ZOjkN3UOIyDXPpciHGeCcn8sV7x19LcoKwvGbBDkJxIRXMNgNYaA4IbjbLMLt6OZumcKJJ2xBExJ3pZen5SiNh+ZWKyx7Uah6BtR0l/NoVrq5ZYQsOIBc5Wv4eFaIRonI8nJxoOg/k9zoF54N/DlyIWDIy/FCT644+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USTD1T1PvyTp4tpQ7g4QUcjGfs9YlLSLDJeRCVedgik=;
 b=J9CwaAVDe+4vWmJbFI46BLQcDid2PJrvAs93Ai0RMaDZCR+ykgpSykjrdhW+cF0nFK3VPDUyzhhqO5YhDiNT2Oczk7nMg5QMY1nEr9BLvadRzIvnmAVaQnn0Tz9nZqWgewJWNu+mBzzL17uwe5NSfGHiwXbu/w15nJYbOYlD1rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 12 Dec
 2022 04:04:29 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::8116:cfc2:1356:febf]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::8116:cfc2:1356:febf%7]) with mapi id 15.20.5880.014; Mon, 12 Dec 2022
 04:04:29 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org,
        sakari.ailus@linux.intel.com
Subject: [PATCH] media: ov5640: set correct default format for CSI-2 mode
Date:   Mon, 12 Dec 2022 12:05:26 +0800
Message-Id: <20221212040526.3549644-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 25780db8-f1ea-4a03-bd57-08dadbf5f61e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UDaqHIG91j2xxaDKYgh3AV1CIiM81+ebSl/nE+2zUsRxnSt+Va2kx48mc4Wm9wrcEhFGHHdTQcj/EgXISkCcYjZBahQ34yiLJPPo2MdKZwvmglZK+9fXYQxSIfC3ewN/WXFAHyes9PyQ3ydZOu4J55OBPWly7k9KzmTmY3FHoX8Np451KPXU9NjGa7hd4no9X0EfDMFvGkKmljvCifYDGNlxvvHGQVPiP+GFIwPhcB+JtGeWztQFnnRH4UX0hFpWZpUoZSI2YW0BfqMwAuWLKj3f5jCBj3oZwUKPyX9SPHSxKRkPCyIsh3HbQszPttZOmCR0EUaYXtxYHzzMxGwRWncd3+wyLwyS7i22+nbeLJNMOh/+s1bhRdvLFGL4+VUvTRrcIMEefuqFlqoKy4upswkXfLePu0U+UHaHQ290NtYQeL+8KB/nJ3YtK4GmuBo1/2e0syCRk99p7lD3Lpwzj91tqyzgKGFndDjKdSPF5qZJ9Ei/X0v0R7voWLtYadTkqt9LVB9m40OO/4tykTXukdnSCBHz+zKJb+Fvxc0ncVHFCl6xpcs2VP7DQjrxk9h8RZv4o35vIEXMgWLd8Pyp7U7CXi7P/QbNBpBCLhaX1pEW0rGJLrJlmKG25bzRJkMkPf6qKBgWhOQ58Wd3SZ5eS0Q7FqpHwU9yc+zZqEBh8hvzbZ+/IcGhx8BKpuDiUYAL/peUTFvTrWT5SOm7x1HHfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(5660300002)(8676002)(4326008)(6916009)(2906002)(41300700001)(316002)(8936002)(478600001)(6486002)(86362001)(83380400001)(6666004)(38350700002)(38100700002)(26005)(6512007)(52116002)(66946007)(66476007)(66556008)(1076003)(186003)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LXyhSLs+iXBrtWOY3YobX45cJEGIn50xFgEDq74tpcV3svpRRL3AeM0ipdQ2?=
 =?us-ascii?Q?P3MTyNYocHZp4DbxyK5uKQVntbuG2a8g8FLpgql5q1Zsk0IcOqgI2/o4ESfS?=
 =?us-ascii?Q?N4WbmqDvb6bPOSDCaKrMfOZ/GA3oVUhUKJ6Tdm0feHpHx9VWljvN4pPwu8k4?=
 =?us-ascii?Q?Mk6rQ0L3lKmQ0FcM6eNVkkwBPa3V3Ela8jsi4nAUlDVHjfR9+9Lt9IVzv4wC?=
 =?us-ascii?Q?/ucBQ95/5trL0tnVKyxfxLc0m3VWmf8dcA0P7bzEP0oB8elvwDX+uPcT/lHl?=
 =?us-ascii?Q?WkIIRCjVkxSvWvhoZ2sVWw2rmBaemOzhiNl0FSXVfxslJlr7RGgt/jqt636n?=
 =?us-ascii?Q?aZ9XWj5Fjts2koD9XLKtUGiPIqWkJGFPHpzRq1cVdQ1BMae0mg5WQx9wO/26?=
 =?us-ascii?Q?3cAh2Do5oWNq64XVhUm8GtiWVwwFs76uhC3m4mqjBFsGy6pKlIngUhfOhckL?=
 =?us-ascii?Q?XPlzasfLANeRU6EW+tZUZXKsCovnegICRjtIQB8ASsx7ofAsazUrjvXAvaWA?=
 =?us-ascii?Q?QFwtXJMVkJ6dKAU3Q92sFRxWjG2hvSrLg26umXww9xIwmFVbGsYH66yN18o7?=
 =?us-ascii?Q?pPIyM/Bc7/Pi4/DW4quI7R6cRyIRyZVeqj8hVnJyC/VX1sz5X7+sWRPeEYeC?=
 =?us-ascii?Q?2CGNBKtpiBd6YNOzMuekXsuqKMqyCR3A4n8Z/ldn6gEE7dJIpuvNwTNsEDTl?=
 =?us-ascii?Q?OYBqxDzBAoGGxerkolq1wqigsifO5sQvM0o56C/6LOQAC3ijljWhpyXhXUzd?=
 =?us-ascii?Q?GCYiaqAg3LjDrYtmCay52k3vlMNkwb3KLzZlkkCrzuVPz3gvyWtB2qYwCVzS?=
 =?us-ascii?Q?y44IPo2fOR2wn2lA7y+kWcYBmrxMhjZhiXyYwyWGkUjsA+R3wPM7/TgZWalu?=
 =?us-ascii?Q?NFyjdIp5iHB8FntPIRgqp28fVbHmWjcciS96MCd6Agk9QbYTVPDDZZeneH2n?=
 =?us-ascii?Q?0tK/GS7VVz70zaCNJszSCUeCHOP9FKh4Po2URM1/Y3UlrF49/i5ES3cz/eb4?=
 =?us-ascii?Q?O0JPdNUIb3Hz6HLjy9sHo/Ox4UC7hKX2FTavhfl5FGtOINSX3RiT/9BT93Dl?=
 =?us-ascii?Q?na1tRzgt/ty7vbhDbYRbDbU9iUAIzm2TOUgUyu+VJBuzVZbcveUxgFx7ugs7?=
 =?us-ascii?Q?w2/uw206NHeTnSaWaCCEpQeZ5p/6FpQfCOAj/1CKtv0V44y3qIEJHQmGceh9?=
 =?us-ascii?Q?VRdGR8VJjpQ8eDZShbnMfXg5Q34VTTnihy+5/qsD4xsvqvWPsauDDE5Wa+zH?=
 =?us-ascii?Q?nIKg3CuQ00m0ZBOCajMGkrr0U6JZ3OxEF4bMsgL9YOWzo0bkLbJuPAfOkjYv?=
 =?us-ascii?Q?fuwieApKrnCI2De1oj8MQrZPJaxUdt3tmuSods6o9b9OVKiJh6s3G2+hNeGv?=
 =?us-ascii?Q?ynfV+EQsDBYPfmdDrdMFmtUhBHtZpwUqVMLXihhSzm+iHVNalL/2ROOglZPl?=
 =?us-ascii?Q?ueYuc0iscUXmhpSDr11vaLFN8o8wkDaUpSUc1CErLYZr+kTijEb9Xh9m6w4u?=
 =?us-ascii?Q?Oftb3/TsYljLPiBwTnEZsSkdKqIWHpCvxuf8YycwE4f+B07b3JlOoR0xnkwb?=
 =?us-ascii?Q?KuSYQseCGeDU8LGQAp3kXn1QCSU12QDY/6auFoJ8OkdtQO8TeK8uU+w6l+n4?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25780db8-f1ea-4a03-bd57-08dadbf5f61e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 04:04:29.6204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RXfctZHe1mCW5jFvIv+D7PHZ2wgIwgaVEgf7bZfQQ9gL84/QfHFCOk/wIiRVSkzavjz0V//bmgLbdqsSEh4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

In commit a89f14bbcfa5 ("media: ov5640: Split DVP and CSI-2 formats"),
it splits format list for DVP and CSI-2 mode, but the default format
defined in commit 90b0f355c5a3 ("media: ov5640: Implement init_cfg")
is only supported by DVP mode, so define a new default format for
CSI-2 mode.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ov5640.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index e0f908af581b..2c37ed7b75d3 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -520,7 +520,18 @@ static u32 ov5640_code_to_bpp(struct ov5640_dev *sensor, u32 code)
  */
 /* YUV422 UYVY VGA@30fps */
 
-static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
+static const struct v4l2_mbus_framefmt ov5640_csi2_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 640,
+	.height = 480,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
+	.field = V4L2_FIELD_NONE,
+};
+
+static const struct v4l2_mbus_framefmt ov5640_dvp_default_fmt = {
 	.code = MEDIA_BUS_FMT_UYVY8_2X8,
 	.width = 640,
 	.height = 480,
@@ -3719,11 +3730,13 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 static int ov5640_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state)
 {
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	struct v4l2_mbus_framefmt *fmt =
 				v4l2_subdev_get_try_format(sd, state, 0);
 	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
 
-	*fmt = ov5640_default_fmt;
+	*fmt = ov5640_is_csi2(sensor) ? ov5640_csi2_default_fmt :
+					ov5640_dvp_default_fmt;
 
 	crop->left = OV5640_PIXEL_ARRAY_LEFT;
 	crop->top = OV5640_PIXEL_ARRAY_TOP;
@@ -3812,7 +3825,6 @@ static int ov5640_probe(struct i2c_client *client)
 	 * default init sequence initialize sensor to
 	 * YUV422 UYVY VGA@30fps
 	 */
-	sensor->fmt = ov5640_default_fmt;
 	sensor->frame_interval.numerator = 1;
 	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
 	sensor->current_fr = OV5640_30_FPS;
@@ -3845,6 +3857,9 @@ static int ov5640_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	sensor->fmt = ov5640_is_csi2(sensor) ? ov5640_csi2_default_fmt :
+					       ov5640_dvp_default_fmt;
+
 	/* get system clock (xclk) */
 	sensor->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(sensor->xclk)) {
-- 
2.37.1

