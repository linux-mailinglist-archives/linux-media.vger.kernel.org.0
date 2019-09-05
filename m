Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAC9AA3FB
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 15:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388395AbfIENNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 09:13:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45117 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388392AbfIENNA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 09:13:00 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5rZL-0007Sc-Lp; Thu, 05 Sep 2019 15:12:59 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH 1/2] media: uapi: h264: clarify dec_ref_pic_marking_bit_size fields
Date:   Thu,  5 Sep 2019 15:12:54 +0200
Message-Id: <20190905131255.10150-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

Since dec_ref_pic_marking_bit_size is not a syntax element
itself, explicitly state that this is the size in bits of
the dec_ref_pic_marking() syntax element contained in the
slice.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index b9834625a939..c281bc7ed1b3 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1796,7 +1796,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       -
     * - __u32
       - ``dec_ref_pic_marking_bit_size``
-      -
+      - Size in bits of the dec_ref_pic_marking() syntax element.
     * - __u32
       - ``pic_order_cnt_bit_size``
       -
-- 
2.20.1

