Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDDA2B8421
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 19:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgKRSsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 13:48:01 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37748 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgKRSsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 13:48:01 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8EB2A1F4499B
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
Subject: [PATCH v3 11/13] media: controls: Log H264 stateless controls in .std_log
Date:   Wed, 18 Nov 2020 15:46:58 -0300
Message-Id: <20201118184700.331213-12-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118184700.331213-1-ezequiel@collabora.com>
References: <20201118184700.331213-1-ezequiel@collabora.com>
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
index 472b46e8290b..e2c61d39b6b1 100644
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

