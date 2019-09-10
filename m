Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495DBAE7F4
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 12:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbfIJKWp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 06:22:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48993 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbfIJKWo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 06:22:44 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i7dIJ-0002V8-7E; Tue, 10 Sep 2019 12:22:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH v2] media: uapi: h264: clarify num_ref_idx_l[01]_(default_)active fields
Date:   Tue, 10 Sep 2019 12:22:39 +0200
Message-Id: <20190910102239.23545-1-p.zabel@pengutronix.de>
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

Since the uapi does not contain the num_ref_idx_active_override_flag,
drivers for decoders that do not parse slices themselves don't know
how to choose between the num_ref_idx_l[01]_default_active and the
num_ref_idx_l[01]_active override fields.

Instead, userspace must set the override fields to the default values
if the slice does not have the num_ref_idx_active_override flag set.
The drivers will then always enable the override internally and ignore
the default fields completely.

Clarify this requirement in the API documentation.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1:
 - Drop sentences about num_ref_idx_l[011](_default)_active_minus1
   fields only being used by decoders that do/do not parse slice
   headers.
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index bc5dd8e76567..6b3bb71655a3 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1820,10 +1820,12 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       -
     * - __u8
       - ``num_ref_idx_l0_active_minus1``
-      -
+      - If num_ref_idx_active_override_flag is not set, this field must be
+        set to the value of num_ref_idx_l0_default_active_minus1.
     * - __u8
       - ``num_ref_idx_l1_active_minus1``
-      -
+      - If num_ref_idx_active_override_flag is not set, this field must be
+        set to the value of num_ref_idx_l1_default_active_minus1.
     * - __u32
       - ``slice_group_change_cycle``
       -
-- 
2.20.1

