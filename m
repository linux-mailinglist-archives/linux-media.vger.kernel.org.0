Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1206C80EA
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 16:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjCXPNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 11:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjCXPNK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 11:13:10 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350AB13D59;
        Fri, 24 Mar 2023 08:12:52 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E3D4FE001B;
        Fri, 24 Mar 2023 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1679670771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1pmURX5WiQgok7667LNCdKhn4LBPmmToQ7P/mWQBXOQ=;
        b=kSIc7RsqSmQa+l+Wc/6gZkQKyA2eHwyjnSctaczCtZ/53kUxIZ4X8JtFlaNszeAzTuXE/u
        Z6d5OfG01Q6aakLjKQ8wkgsizTuz7BK5BH0Xxi1A7BPtd8tZW3fKgdKShaWPW1B20cpyGu
        v4ZQCgC/XJbyR9iN403ta3N49XowLYEbpvaBpdW2dbtl0FGWJ0HZK9ZBDthm57t2VvAubX
        lAaiJsWGXWSV5UGSI/f75Wh0NskUANgqksOqWAt5LAIF+9xbtVucdFUzFZICzLtNg4dmSX
        Bo75LHPxRbEbSK0TAxDBkcYs7NVWIAiAzl8sF+hXaY3LpFUQm23SK/qUR6XTwA==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Pigg <adam@piggz.co.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 7/9] media: sun6i-csi: capture: Implement enum_framesizes
Date:   Fri, 24 Mar 2023 16:12:26 +0100
Message-Id: <20230324151228.2778112-8-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
References: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Report available frame sizes as a continuous range between the
hardware min/max limits.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Co-authored-by: Adam Pigg <adam@piggz.co.uk>
Signed-off-by: Adam Pigg <adam@piggz.co.uk>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 9627030ff060..31ba83014086 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -847,6 +847,30 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *private,
 	return 0;
 }
 
+static int
+sun6i_csi_capture_enum_framesizes(struct file *file, void *fh,
+				  struct v4l2_frmsizeenum *frmsizeenum)
+{
+	const struct sun6i_csi_capture_format *format;
+
+	if (frmsizeenum->index > 0)
+		return -EINVAL;
+
+	format = sun6i_csi_capture_format_find(frmsizeenum->pixel_format);
+	if (!format)
+		return -EINVAL;
+
+	frmsizeenum->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	frmsizeenum->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	frmsizeenum->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	frmsizeenum->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	frmsizeenum->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	frmsizeenum->stepwise.step_width = 1;
+	frmsizeenum->stepwise.step_height = 1;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_enum_input(struct file *file, void *private,
 					struct v4l2_input *input)
 {
@@ -884,6 +908,8 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
 
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
+
 	.vidioc_enum_input		= sun6i_csi_capture_enum_input,
 	.vidioc_g_input			= sun6i_csi_capture_g_input,
 	.vidioc_s_input			= sun6i_csi_capture_s_input,
-- 
2.39.2

