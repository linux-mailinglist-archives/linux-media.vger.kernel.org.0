Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C336D221612
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 22:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgGOUXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 16:23:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37114 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgGOUXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 16:23:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8E2442A518C
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
Subject: [PATCH 02/10] media: uapi: h264: Further clarify scaling lists order
Date:   Wed, 15 Jul 2020 17:22:25 -0300
Message-Id: <20200715202233.185680-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715202233.185680-1-ezequiel@collabora.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 0b0393d59eb4a ("media: uapi: h264: clarify
expected scaling_list_4x4/8x8 order") improved the
documentation on H264 scaling lists order.

This commit improves the documentation by clarifying
that the lists themselves are expected in matrix order.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c2e17c02f77e..16bfc98ab2f6 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1725,12 +1725,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``scaling_list_4x4[6][16]``
       - Scaling matrix after applying the inverse scanning process.
         Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
-        Inter Cb, Inter Cr.
+        Inter Cb, Inter Cr. The values on each scaling list are
+        expected in matrix order.
     * - __u8
       - ``scaling_list_8x8[6][64]``
       - Scaling matrix after applying the inverse scanning process.
         Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
-        Intra Cr, Inter Cr.
+        Intra Cr, Inter Cr. The values on each scaling list are
+        expected in matrix order.
 
 ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS (struct)``
     Specifies the slice parameters (as extracted from the bitstream)
-- 
2.27.0

