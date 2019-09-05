Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4705AA3FE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 15:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbfIENND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 09:13:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40761 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388400AbfIENNC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 09:13:02 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5rZN-0007Sc-HM; Thu, 05 Sep 2019 15:13:01 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH 2/2] media: uapi: h264: clarify pic_order_cnt_bit_size field
Date:   Thu,  5 Sep 2019 15:12:55 +0200
Message-Id: <20190905131255.10150-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905131255.10150-1-p.zabel@pengutronix.de>
References: <20190905131255.10150-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since pic_order_cnt_bit_size is not a syntax element itself, explicitly
state that it is the total size in bits of the pic_order_cnt_lsb,
delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
delta_pic_order_cnt[1] syntax elements contained in the slice.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index c281bc7ed1b3..08b49b2bbfa8 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1799,7 +1799,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - Size in bits of the dec_ref_pic_marking() syntax element.
     * - __u32
       - ``pic_order_cnt_bit_size``
-      -
+      - Size in bits of the pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
+        delta_pic_order_cnt[0], and delta_pic_order_cnt[1] syntax elements.
     * - __u8
       - ``cabac_init_idc``
       -
-- 
2.20.1

