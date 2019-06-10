Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1FD3B14B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 10:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388567AbfFJIw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 04:52:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55942 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388011AbfFJIw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 04:52:58 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7639428545F;
        Mon, 10 Jun 2019 09:52:56 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 3/3] media: uapi: h264: Get rid of the p0/b0/b1 ref-lists
Date:   Mon, 10 Jun 2019 10:52:50 +0200
Message-Id: <20190610085250.3255-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610085250.3255-1-boris.brezillon@collabora.com>
References: <20190610085250.3255-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those lists can be extracted from the dpb, let's simplify userspace
life and build that list kernel-side (generic helpers will be provided
for drivers that need this list).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v2:
* None
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index e3b9ab73a588..8be0ca5c96ab 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1949,15 +1949,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u16
       - ``nal_ref_idc``
       - NAL reference ID value coming from the NAL Unit header
-    * - __u8
-      - ``ref_pic_list_p0[32]``
-      - Backward reference list used by P-frames in the original bitstream order
-    * - __u8
-      - ``ref_pic_list_b0[32]``
-      - Backward reference list used by B-frames in the original bitstream order
-    * - __u8
-      - ``ref_pic_list_b1[32]``
-      - Forward reference list used by B-frames in the original bitstream order
     * - __s32
       - ``top_field_order_cnt``
       - Picture Order Count for the coded top field
-- 
2.20.1

