Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB09221616
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 22:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgGOUXP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 16:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgGOUXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 16:23:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E010C061755;
        Wed, 15 Jul 2020 13:23:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id F10242A523A
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
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 04/10] media: uapi: h264: Clarify pic_order_cnt_bit_size field
Date:   Wed, 15 Jul 2020 17:22:27 -0300
Message-Id: <20200715202233.185680-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715202233.185680-1-ezequiel@collabora.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

Since pic_order_cnt_bit_size is not a syntax element itself, explicitly
state that it is the total size in bits of the pic_order_cnt_lsb,
delta_pic_order_cnt_bottom, delta_pic_order_cnt[0], and
delta_pic_order_cnt[1] syntax elements contained in the slice.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
[Ezequiel: rebase]
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d1695ae96700..86e30b80a6c1 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1815,7 +1815,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - Size in bits of the dec_ref_pic_marking() syntax element.
     * - __u32
       - ``pic_order_cnt_bit_size``
-      -
+      - Combined size in bits of the picture order count related syntax
+        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
+        delta_pic_order_cnt0, and delta_pic_order_cnt1.
     * - __u8
       - ``cabac_init_idc``
       -
-- 
2.27.0

