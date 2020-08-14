Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2651E244AAE
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 15:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbgHNNiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 09:38:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43430 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgHNNh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 09:37:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 68E7529A825
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 16/19] media: rkvdec: Drop unneeded per_request driver-specific control flag
Date:   Fri, 14 Aug 2020 10:36:31 -0300
Message-Id: <20200814133634.95665-17-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814133634.95665-1-ezequiel@collabora.com>
References: <20200814133634.95665-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the drivers makes no distinction between per_request
and mandatory, as both are used in the same request validate check.

The driver only cares to know if a given control is
required to be part of a request, so only one flag is needed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 6 +-----
 drivers/staging/media/rkvdec/rkvdec.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7c5129593921..cd720d726d7f 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -55,23 +55,19 @@ static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
 
 static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	{
-		.per_request = true,
 		.mandatory = true,
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
 	},
 	{
-		.per_request = true,
 		.mandatory = true,
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
 	},
 	{
-		.per_request = true,
 		.mandatory = true,
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
 	},
 	{
-		.per_request = true,
 		.mandatory = true,
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
 	},
@@ -615,7 +611,7 @@ static int rkvdec_request_validate(struct media_request *req)
 		u32 id = ctrls->ctrls[i].cfg.id;
 		struct v4l2_ctrl *ctrl;
 
-		if (!ctrls->ctrls[i].per_request || !ctrls->ctrls[i].mandatory)
+		if (!ctrls->ctrls[i].mandatory)
 			continue;
 
 		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 2fc9f46b6910..77a137cca88e 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -25,7 +25,6 @@
 struct rkvdec_ctx;
 
 struct rkvdec_ctrl_desc {
-	u32 per_request : 1;
 	u32 mandatory : 1;
 	struct v4l2_ctrl_config cfg;
 };
-- 
2.27.0

