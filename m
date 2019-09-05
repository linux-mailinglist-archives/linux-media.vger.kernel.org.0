Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C02AA1D5
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 13:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731734AbfIELmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 07:42:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47029 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730412AbfIELmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 07:42:15 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5q9V-0004nt-4s; Thu, 05 Sep 2019 13:42:13 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH] media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active fields
Date:   Thu,  5 Sep 2019 13:42:10 +0200
Message-Id: <20190905114210.9232-1-p.zabel@pengutronix.de>
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

To explain why num_ref_idx_active_override_flag is not part of the API,
describe how the num_ref_idx_l[01]_active_minus1 fields and the
num_ref_idx_l[01]_default_active_minus1 fields are used, depending on
whether the decoder parses slice headers itself or not.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index bc5dd8e76567..b9834625a939 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1630,10 +1630,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       -
     * - __u8
       - ``num_ref_idx_l0_default_active_minus1``
-      -
+      - This field is only used by decoders that parse slices themselves.
     * - __u8
       - ``num_ref_idx_l1_default_active_minus1``
-      -
+      - This field is only used by decoders that parse slices themselves.
     * - __u8
       - ``weighted_bipred_idc``
       -
@@ -1820,10 +1820,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       -
     * - __u8
       - ``num_ref_idx_l0_active_minus1``
-      -
+      - This field is used by decoders that do not parse slices themselves.
+        If num_ref_idx_active_override_flag is not set, this field must be
+        set to the value of num_ref_idx_l0_default_active_minus1.
     * - __u8
       - ``num_ref_idx_l1_active_minus1``
-      -
+      - This field is used by decoders that do not parse slices themselves.
+        If num_ref_idx_active_override_flag is not set, this field must be
+        set to the value of num_ref_idx_l1_default_active_minus1.
     * - __u32
       - ``slice_group_change_cycle``
       -
-- 
2.20.1

