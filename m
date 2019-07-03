Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 343045E3E6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 14:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfGCM25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 08:28:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38656 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCM25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 08:28:57 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EE57828A929;
        Wed,  3 Jul 2019 13:28:54 +0100 (BST)
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
Subject: [PATCH v3 3/3] media: uapi: h264: Get rid of the p0/b0/b1 ref-lists
Date:   Wed,  3 Jul 2019 14:28:49 +0200
Message-Id: <20190703122849.6316-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703122849.6316-1-boris.brezillon@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
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
Changes in v3:
* None

Changes in v2:
* None
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 47ba2d057a92..237c8e8e6bca 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1946,15 +1946,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
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
2.21.0

