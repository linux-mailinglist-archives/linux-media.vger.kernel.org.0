Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C04F3154F7
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 18:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhBIRYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 12:24:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbhBIRYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 12:24:36 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6E8C061574;
        Tue,  9 Feb 2021 09:23:50 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id C90CE1F451DD
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Jernej Skrabec <jernej.skrabec@siol.net>,
        John Cox <jc@kynesim.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Maheshwar Ajja <majja@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] doc: h264/hevc: Clarify _START_CODE_NONE meaning
Date:   Tue,  9 Feb 2021 12:22:33 -0500
Message-Id: <20210209172337.336737-1-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As some hardware have a knob to enable or disable emulation prevention
bytes removal, driver writers ended up wondering what exactly the
START_CODE_NONE modes meant in this regards. This patch clarify what is
expected with a reference to the specification.

Reported-by: John Cox <jc@kynesim.co.uk>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst     | 4 +++-
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst     | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 01e3b1a3fb99..075cbf14991e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -665,7 +665,9 @@ Stateless Codec Control ID
     * - ``V4L2_STATELESS_H264_START_CODE_NONE``
       - 0
       - Selecting this value specifies that H264 slices are passed
-        to the driver without any start code.
+        to the driver without any start code. The bitstream data should be
+        according to :ref:`h264` 7.3.1 NAL unit syntax, hence contains
+        emulation prevention bytes when required.
     * - ``V4L2_STATELESS_H264_START_CODE_ANNEX_B``
       - 1
       - Selecting this value specifies that H264 slices are expected
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 00944e97d638..5021f1492856 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3631,7 +3631,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - ``V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE``
       - 0
       - Selecting this value specifies that HEVC slices are passed
-        to the driver without any start code.
+        to the driver without any start code. The bitstream data should be
+        according to :ref:`hevc` 7.3.1.1 General NAL unit syntax, hence
+        contains emulation prevention bytes when required.
     * - ``V4L2_MPEG_VIDEO_HEVC_START_CODE_ANNEX_B``
       - 1
       - Selecting this value specifies that HEVC slices are expected
-- 
2.28.0

