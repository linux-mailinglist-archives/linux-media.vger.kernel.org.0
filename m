Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307A27B1781
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 11:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbjI1Jhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 05:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjI1Jht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 05:37:49 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22E012A;
        Thu, 28 Sep 2023 02:37:45 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AA4001A059B;
        Thu, 28 Sep 2023 11:37:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7270B1A1C86;
        Thu, 28 Sep 2023 11:37:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8AE34181D0C0;
        Thu, 28 Sep 2023 17:37:42 +0800 (+08)
From:   Shengjiu Wang <shengjiu.wang@nxp.com>
To:     hverkuil@xs4all.nl, sakari.ailus@iki.fi, tfiga@chromium.org,
        m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v5 06/11] media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
Date:   Thu, 28 Sep 2023 17:00:14 +0800
Message-Id: <1695891619-32393-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_CAP_AUDIO_M2M is similar to V4L2_CAP_VIDEO_M2M flag.

It is used for audio memory to memory case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst    | 3 +++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions | 1 +
 include/uapi/linux/videodev2.h                               | 1 +
 3 files changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
index 6c57b8428356..0b3cefefc86b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-querycap.rst
@@ -259,6 +259,9 @@ specification the ioctl returns an ``EINVAL`` error code.
         video topology configuration, including which I/O entity is routed to
         the input/output, is configured by userspace via the Media Controller.
         See :ref:`media_controller`.
+    * - ``V4L2_CAP_AUDIO_M2M``
+      - 0x40000000
+      - The device supports the audio Memory-To-Memory interface.
     * - ``V4L2_CAP_DEVICE_CAPS``
       - 0x80000000
       - The driver fills the ``device_caps`` field. This capability can
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3e58aac4ef0b..da6d0b8e4c2c 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -197,6 +197,7 @@ replace define V4L2_CAP_META_OUTPUT device-capabilities
 replace define V4L2_CAP_DEVICE_CAPS device-capabilities
 replace define V4L2_CAP_TOUCH device-capabilities
 replace define V4L2_CAP_IO_MC device-capabilities
+replace define V4L2_CAP_AUDIO_M2M device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 78260e5d9985..3decf7d73870 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -508,6 +508,7 @@ struct v4l2_capability {
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
 #define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+#define V4L2_CAP_AUDIO_M2M              0x40000000  /* audio memory to memory */
 
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
-- 
2.34.1

