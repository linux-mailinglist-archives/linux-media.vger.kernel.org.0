Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BD1339E9B
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234051AbhCMOnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:49 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39887 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234014AbhCMOn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:28 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UFlV5cV; Sat, 13 Mar 2021 15:43:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646607; bh=jKdVJI+q0U6oMvWn83VF0vu1qbM3ykBj/enzfRyJLoE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=PfTbscATwPWZAkf19lPJwrcpL1ZS6+beCHBbhoov46LBqtjDMwYNeIxe8ydP3LUv6
         FcXOj3cQmB6XjZq9PiFzCWGRy+Kvf5vtlsbH1TQ/GSV5zjgA2TAptlr/Ou84prUBJM
         ZPhteBvjFjVJFaTilx2wjML4nRzGJMgE3WsiIukB7pQyuDZ7xmed1XCDYEW2s3a5xY
         gJZ+nIgS5/BDojw3tg4kI4wwo0x2wlxb7+2kYjDf5HwJk/+Q+NAEphMLSBt4dF4GL1
         lJ5IYt1RWjVl+ldfWzkYJb2uZXHZau5rVPErNg9/QYF7y8iRJfIpT+xTonI44HA4qg
         v4f+d327mGrwQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/15] ext-ctrls-codec.rst: fix typos
Date:   Sat, 13 Mar 2021 15:43:09 +0100
Message-Id: <20210313144323.143600-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfC6oyS35tArlVT3Tnt89cA2C4XNyiVAN7tzIh2jmRj56uarUG0Tiv/X88SAJj0ej6pZYerU9UVVbFdMNCl+eVw8QIESNcP7LB7Y4odaF7qNzoRGvPBO2
 3fujnFXXO2XzoCVsZVR3qlBIucI5Q6rHGdSuG9u7riMOpBaUAQmGJzw3YSXkcWU3TzNhpNWPYGruNR+B0BuDzk88WrNbFEf5Ddzqm2l/1iXQ/Ers2/swnYaV
 A4lja3B5a4mCB3vk6mEHS/qoDF44xmpJB9YTFZXTYojTbI3o+ltxWrrBPU982DNTLFoq6UuUmmyfAoYEqOPnuwxg12YW9xL7iexvbNmw2k4CCsPQnSAt8jOV
 uR1TxR/woqu3Yw/Ky/q78yWBikpEYw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The _FRAME_SKIP_ enums were missing the _VIDEO prefix.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 7ee8ae073b91..e2d7c4a87fea 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -615,12 +615,12 @@ enum v4l2_mpeg_video_frame_skip_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_FRAME_SKIP_MODE_DISABLED``
+    * - ``V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED``
       - Frame skip mode is disabled.
-    * - ``V4L2_MPEG_FRAME_SKIP_MODE_LEVEL_LIMIT``
+    * - ``V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the chosen
         level and is defined by the standard.
-    * - ``V4L2_MPEG_FRAME_SKIP_MODE_BUF_LIMIT``
+    * - ``V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the
         :ref:`VBV (MPEG1/2/4) <v4l2-mpeg-video-vbv-size>` or
         :ref:`CPB (H264) buffer size <v4l2-mpeg-video-h264-cpb-size>` control.
@@ -2244,12 +2244,12 @@ enum v4l2_mpeg_mfc51_video_frame_skip_mode -
     :header-rows:  0
     :stub-columns: 0
 
-    * - ``V4L2_MPEG_MFC51_FRAME_SKIP_MODE_DISABLED``
+    * - ``V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_DISABLED``
       - Frame skip mode is disabled.
-    * - ``V4L2_MPEG_MFC51_FRAME_SKIP_MODE_LEVEL_LIMIT``
+    * - ``V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the chosen
 	level and is defined by the standard.
-    * - ``V4L2_MPEG_MFC51_FRAME_SKIP_MODE_BUF_LIMIT``
+    * - ``V4L2_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT``
       - Frame skip mode enabled and buffer limit is set by the VBV
 	(MPEG1/2/4) or CPB (H264) buffer size control.
 
-- 
2.30.1

