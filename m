Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40DA2B7F52
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 15:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgKROYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 09:24:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34902 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgKROYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 09:24:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 735D41F45180
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        zhengsq@rock-chips.com, linux-kernel@vger.kernel.org,
        sfr@canb.auug.org.au, kernel@collabora.com
Subject: [PATCH] media: admin-guide/pixfmt-meta-rkisp1.rst: pixfmt reference conforming with macro
Date:   Wed, 18 Nov 2020 11:24:00 -0300
Message-Id: <20201118142400.3540109-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix warnings from make htmlddocs:

Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta-fmt-rk-isp1-params (if the link has no caption the label must precede a section header)
Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta-fmt-rk-isp1-stat-3a (if the link has no caption the label must precede a section header)

Fixes: df22026aebd8 ("media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format")

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/admin-guide/media/rkisp1.rst                   | 4 ++--
 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/media/rkisp1.rst b/Documentation/admin-guide/media/rkisp1.rst
index 42e37ed255f6..2267e4fb475e 100644
--- a/Documentation/admin-guide/media/rkisp1.rst
+++ b/Documentation/admin-guide/media/rkisp1.rst
@@ -86,7 +86,7 @@ the driver through the rkisp_params node to improve image quality during a
 video stream.
 The buffer format is defined by struct :c:type:`rkisp1_stat_buffer`, and
 userspace should set
-:ref:`V4L2_META_FMT_RK_ISP1_STAT_3A <v4l2-meta-fmt-stat-rkisp1>` as the
+:ref:`V4L2_META_FMT_RK_ISP1_STAT_3A <v4l2-meta-fmt-rk-isp1-stat-3a>` as the
 dataformat.
 
 .. _rkisp1_params:
@@ -100,7 +100,7 @@ and others.
 
 The buffer format is defined by struct :c:type:`rkisp1_params_cfg`, and
 userspace should set
-:ref:`V4L2_META_FMT_RK_ISP1_PARAMS <v4l2-meta-fmt-params-rkisp1>` as the
+:ref:`V4L2_META_FMT_RK_ISP1_PARAMS <v4l2-meta-fmt-rk-isp1-params>` as the
 dataformat.
 
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
index f3671472d410..922fa1d59898 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. _v4l2-meta-fmt-params-rkisp1:
-.. _v4l2-meta-fmt-stat-rkisp1:
+.. _v4l2-meta-fmt-rk-isp1-params:
+.. _v4l2-meta-fmt-rk-isp1-stat-3a:
 
 *****************************************************************************
 V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s')
-- 
2.29.2

