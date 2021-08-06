Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47D23E2267
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242733AbhHFEQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242766AbhHFEQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:41 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35146C061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id g11-20020a25ae4b0000b02905792fb55b0bso8338316ybe.9
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Rsk8mIk4NwGxcjmp10DQpgJja1pgzgMacDksVnB64/o=;
        b=E83KNjyD6f2ijKsOirozZyWrM3b9FzL5lre5NgdVK3PpHsDxEAnljSjqikUGv+uznH
         Cv5fr7wOv0r93E9RyZWV0pbqwBG5EylwUyPJJ20qd3YAtbzqjhXAyL1ySXNevTsDvgI8
         Q6OglpVh/rglb/jayX5U2qhUbA7nW/eVeGNRleNg//Bbs0qwDkgmqRTaUnUXOA6QUIhl
         38rTajZWL3w0cpgv0+a6EfFavEhbweMbRr9VMjBJ0gd4plcH6G9yE4Pkw6kiJ8cH5F6c
         bopVOVk9n5IfXVdUeP/MvEaHIypuKMLZK7iIdXThWDEVYDRJFUsXQsel/BQ5VlyLAc1z
         6ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Rsk8mIk4NwGxcjmp10DQpgJja1pgzgMacDksVnB64/o=;
        b=l+FBZxI4g5p+lXNJufmEdXQ0NKRJZQK4pK4raa6kS0tGQKylh9HF3ev5ABv6jnyiCS
         TWpMvokDHk+lf9QzGbIScxD4iWbn/rBDGQ843kc7GTxnAOoxd5xa2Mpymwm6js39kGE9
         Xt0LSyLB+TAn+iE1V3xbSijzu7OB9B75bGCEia6pKX1UPXXJh8q0mPcHYfnIcEohaH91
         qF5aRRYFEb9pqa+A9SAG+ueVssge0bvjUH524TBAcXb0qQklkkn0hdvLvqPid5wbcImY
         s25rucupmh8e3RHKrnK4uXUj59aKNvL1dZqbwVf7KMIRmp54/ivPV9wNYGv+5oP/xm8x
         nu8Q==
X-Gm-Message-State: AOAM532Cb4FYexLI7aZtgeiLlviaDk1496GzNRU6MPeD4GxizjF0WqFq
        1KD9nH5o+26nb5QBhBv3juKU4HzXg7RO
X-Google-Smtp-Source: ABdhPJxsM4qGrQbL2g5YSGWG8rqFeBL4viRpVSL06TzLyTQO4wOhxnYyLr43IoMyC0RrGixmrTlDLQp+8UzG
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:8445:: with SMTP id
 r5mr11095742ybm.20.1628223385460; Thu, 05 Aug 2021 21:16:25 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:25 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-10-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 09/14] media: add Mediatek's MM21 format
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format by the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 0b879c0da713..42357b0b3535 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -246,6 +246,13 @@ please make a proposal on the linux-media mailing list.
 	It is an opaque intermediate format and the MDP hardware must be
 	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
 	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
+    * .. _V4L2-PIX-FMT-MM21:
+
+      - ``V4L2_PIX_FMT_MM21``
+      - 'MM21'
+      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
+	This is an opaque intermediate format and the MDP3 hardware can be
+	used to convert it to other formats.
     * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
 
       - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 05d5db3d85e5..b394a2b7cfd7 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1346,6 +1346,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
 	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit Block Format"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..bc1dc5adc071 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -733,6 +733,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.32.0.605.g8dce9f2422-goog

