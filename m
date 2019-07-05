Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A394B60865
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 16:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbfGEOwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 10:52:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36322 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfGEOwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 10:52:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3DF3728B494
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 3/4] media: v4l2-ctrl: Validate VP8 stateless decoder controls
Date:   Fri,  5 Jul 2019 11:50:49 -0300
Message-Id: <20190705145050.25911-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705145050.25911-1-ezequiel@collabora.com>
References: <20190705145050.25911-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only one field needs to be validated: 'num_dct_parts'.
This field is used to iterate over the user-provided array
'dct_part_sizes'.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes from v2:
* New patch
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b2c9f5816c4a..b51b89b841c1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1637,6 +1637,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 				 union v4l2_ctrl_ptr ptr)
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
 	switch ((u32)ctrl->type) {
@@ -1696,6 +1697,17 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
+		p_vp8_frame_header = p;
+
+		switch (p_vp8_frame_header->num_dct_parts) {
+		case 1:
+		case 2:
+		case 4:
+		case 8:
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

