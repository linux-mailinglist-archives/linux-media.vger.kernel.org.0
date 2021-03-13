Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD447339E16
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 13:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhCMMvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 07:51:52 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45337 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhCMMvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 07:51:24 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L3jjljHF2C40pL3jmlUlso; Sat, 13 Mar 2021 13:51:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615639882; bh=r18wkOvp1Q9imyq1OcwnhjWzp5umQ3ptkBvhLOJ20Bc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hqVRAEB3ujUp+ogjCUj4YTokFx0UE3iN4fAMh0ewoNIWYCiRZ4q1H92jcv1JGacAk
         7g21z59aEiJZaKVF/vMmrCmGs4FsOhqvJTRjPCUE5oh23Frvy03epc3FXitzxj6jTH
         b9sf7zPWySxWMsn7hk8e5noiIulPqlACXoSI7CtF9wUXbfnV8KFqKDuo0ehHgGiD8Q
         AWJBkSPXdwCuvhFvuCfnNW3BjySKn3NrSWSYhLDwKb320nIoqVt+Vjc0DCefXbVJtt
         JfMsqtaIi/AtJt0jOsICWMYThjLvY12LcbXK9cOAheVlOreVCrw2fWvDS885seDGCp
         kv3IljNShf1Rw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] ext-ctrls-codec.rst: fix typos
Message-ID: <54b9d790-5672-8f08-b34c-1689933795ad@xs4all.nl>
Date:   Sat, 13 Mar 2021 13:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHsfug4062cEOqGdzP58xEj79+OGPfheNL2rm+twV2+1KYlKMSt2qwntGmVSF0RjhvpiAoeq5M1Zlxd26mK4jwwbDyhSco1ZGJBemnIZrSLoLU6CItP3
 Qi4/X1/0QBQlaGPc12U1yoL7qfzRXD4b7vb4BJXEhvmKfb1P0F59/WDdKq2z/cqiCtRKmP91wkREQQgNxCyGOsahjh7JuyaY4sk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The _FRAME_SKIP_ enums were missing the _VIDEO prefix.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
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

