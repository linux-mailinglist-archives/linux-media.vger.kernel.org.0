Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51B82C5172
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389674AbgKZJhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389633AbgKZJhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:37:31 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD89C0613D4;
        Thu, 26 Nov 2020 01:37:30 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 146A61F450FA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 12/14] media: controls: Log H264 stateless controls in .std_log
Date:   Thu, 26 Nov 2020 06:36:16 -0300
Message-Id: <20201126093618.137292-13-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126093618.137292-1-ezequiel@collabora.com>
References: <20201126093618.137292-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For now, only print the type of the control. In the future,
we might want to be able to print the values of all
the stateless codec controls currently set in the control handler,
which should be useful for debugging reasons.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index fa96e6aa0a86..2a5e3d3cc756 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1737,6 +1737,24 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_H264_SPS:
+		pr_cont("H264_SPS");
+		break;
+	case V4L2_CTRL_TYPE_H264_PPS:
+		pr_cont("H264_PPS");
+		break;
+	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
+		pr_cont("H264_SCALING_MATRIX");
+		break;
+	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
+		pr_cont("H264_SLICE_PARAMS");
+		break;
+	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
+		pr_cont("H264_DECODE_PARAMS");
+		break;
+	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
+		pr_cont("H264_PRED_WEIGHTS");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
-- 
2.27.0

