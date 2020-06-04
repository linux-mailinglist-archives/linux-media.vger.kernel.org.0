Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B718D1EE5F6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgFDNx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728738AbgFDNx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 09:53:29 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E110FC08C5C0
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 06:53:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r7so6228423wro.1
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RNKgisTvCxKeIfzFNw79PawPgsdQpi+VTBw2eOrL7UI=;
        b=O51Osu4UdCOGnotGhmGHJ94XsvwJxmD+RL/BS27sj3XsP9eR4kHTb7INzvbmhlBvlN
         rkWYTnjyEYtr0YDzMY3DYmpmeBHD2VZQvLtyScigshpv1/y2n7nlH55NZ53DLwvzu8by
         F1ZhUQ3WBqgq9FXPVN5C5mTbOQ6NvqI0rcuRpD0nK/pH2TBrBdpobdxf3G3nRR1vekki
         iO3f9lHdG9jEFpKK4mFfiAuFO/Pa8ZBPE2z6kKu7JTDk6G+cEQaRzinD7/0foyg048Gh
         9khvPqsS5YZSCB+wa+8s2lk2PFqPmadl0+6QZSiJcMHWbBEI+8U71HcphuUVlhgucVKj
         mTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RNKgisTvCxKeIfzFNw79PawPgsdQpi+VTBw2eOrL7UI=;
        b=fG0sjff58eUPMFBNboTTA/Vl3Bv91MuhTs1uIl56tgx7iakqH7esMacXF8phcuq1N7
         gShG0Pav55Mh7pXwzj3ahE6WVXRoA6IUP+7CSBHeshLoa4Y2LBXU0gaX37g7iV53LrTP
         go21YJJ48hD7WwcsfMgcsfZ2ezd2NV5dCfScwz4dWWG2WOm/X9EWLtXP2m9Ewy3QKUDA
         BPF3Df9yhZF4OlNJxWQ2T36AOA8Q7kZBo1Pz3d30Z9HzmfARBd8ByHZZnAcoEHvHKM2t
         hqE3kYQ3AcUbfrChZ9p1q9JBjJm33iUp/bfSIr3ZQRLwok3d+f0maeAP6SDdgu2seS/H
         s+XA==
X-Gm-Message-State: AOAM531xQZw7tSQkQn2tOV3BcFXwzxxljzwHlhTX8P7xAAxgeI8Z5/A6
        1qTLlqZhjBByLcku6uixndMfFh76I4jyHQ==
X-Google-Smtp-Source: ABdhPJxqdqJHN5Y5b9X1Q7kP0UxYnF1bBarO0Pdw4x0ipWE20qFJ7SzK27MiQOP21FgZk4r2/ND1+Q==
X-Received: by 2002:adf:e782:: with SMTP id n2mr4462910wrm.417.1591278807326;
        Thu, 04 Jun 2020 06:53:27 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id i74sm8185599wri.49.2020.06.04.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:53:26 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] media: meson: vdec: Add support for compressed framebuffer
Date:   Thu,  4 Jun 2020 15:53:12 +0200
Message-Id: <20200604135317.9235-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset add support for compressed framebuffer while decoding VP9
8bit and 10bit streams.

First, it adds two generic Compressed Framebuffer pixel formats to be used
with a modifier when imported back in another subsystem like DRM/KMS.

These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
used to describe the underlying compressed buffers used for ARM Framebuffer
Compression. In the Amlogic case, the compression is different but the
underlying buffer components is the same.

Then, in order to handle Compressed Framebuffer support, we need to handle
the switch between 8bit and 10bit frame output.
Add the necessary changes to decode VP9 8bit and 10bit streams into
compressed buffers to be imported back into DRM/KMS using a modifier.

Finally, add the necessary to add support for negociating the compressed buffer
pixel format with the V4L2 M2M consumer, and allocating the right
buffers in this case.

Until a proper mechanism exists to pass a modifier along the pixel format,
only the generic V4L2_PIX_FMT_YUV420_8BIT and V4L2_PIX_FMT_YUV420_10BIT
format are passed in v4l2_pix_format_mplane struct for consumer.

Maxime Jourdan (5):
  media: videodev2: add Compressed Framebuffer pixel formats
  media: meson: vdec: handle bitdepth on source change
  media: meson: vdec: update compressed buffer helpers
  media: meson: vdec: add support for compressed output for VP9 decoder
  media: meson: vdec: handle compressed output pixel format negociation
    with consumer

 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 drivers/staging/media/meson/vdec/codec_h264.c |   3 +-
 .../media/meson/vdec/codec_hevc_common.c      | 133 +++++++-----------
 .../media/meson/vdec/codec_hevc_common.h      |  13 +-
 drivers/staging/media/meson/vdec/codec_vp9.c  |  29 ++--
 drivers/staging/media/meson/vdec/vdec.c       |  46 ++++++
 drivers/staging/media/meson/vdec/vdec.h       |   4 +
 .../staging/media/meson/vdec/vdec_helpers.c   |  68 +++++++--
 .../staging/media/meson/vdec/vdec_helpers.h   |  11 +-
 .../staging/media/meson/vdec/vdec_platform.c  |   9 +-
 include/uapi/linux/videodev2.h                |   9 ++
 11 files changed, 203 insertions(+), 124 deletions(-)

-- 
2.22.0

