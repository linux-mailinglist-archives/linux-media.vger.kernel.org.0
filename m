Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E84247ED53
	for <lists+linux-media@lfdr.de>; Fri, 24 Dec 2021 09:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352044AbhLXInU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Dec 2021 03:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343611AbhLXInR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Dec 2021 03:43:17 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749ECC061401
        for <linux-media@vger.kernel.org>; Fri, 24 Dec 2021 00:43:17 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id v19so6226467plo.7
        for <linux-media@vger.kernel.org>; Fri, 24 Dec 2021 00:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DsPt2zNbbtIU1NI6wS2ot/7njOz7ta1uGVnZDlkFWM=;
        b=odTBL+Ss8EO5+U+uct7LVs0Pve7LC5QfIaNtLt32WSB6piHr9KdMp+/19pIllXd9zp
         qqullEMewlissvvB5beEXjBRmG2GkmKb3xVskbcX0xeGcFDFxH/jBcSZjCxpNSoOWql/
         Fi8hQhJE9K1K3FUT6DUkN00QUE0FjpE0lFVRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DsPt2zNbbtIU1NI6wS2ot/7njOz7ta1uGVnZDlkFWM=;
        b=NVN0+Xi/qD7JLN172wC207XlfWTzx9s6udr4h6ceGX7uArcluY7XiOXvnLnFASm+Pa
         oMpvso1N4kuH5SONboqdwC1uBSKLNy6syfbWIl9MzH7q6TYCTBwnscU7+hsJeqWC78Aq
         uyiD/czUIzJwvv3caMiptaO81p3KGa5Fx13uSEotUWKpC+6k3iNazxpCx67rFFqONl21
         Xh479WV09kNV1gdwAoEuBd/bvPu8IjRSDhlsPwTc2OhczxIGVHWTMlwQcAK2AsD3fU/l
         i35CugPXy5Nfqy3ZbZiOLdfRIpbENXJ0AIE6omT5iMiP2jD8FnlLCb2jhZI4Ng7lbIb3
         ICpQ==
X-Gm-Message-State: AOAM532TclkYh4O0Nrah66qrXFey32in3xk5YqeQN5H15rfsU5HDhc0j
        Sb3iE5zUBqOVso8Iqud623ijEw==
X-Google-Smtp-Source: ABdhPJyPRMLCBGrr/ppBW8e99WjUWf52RcTgYPg35ndZ15IoYOS+iG4iZ/CRCFWBrFVNLgJvmIUWlg==
X-Received: by 2002:a17:902:bd44:b0:148:a2f7:9d85 with SMTP id b4-20020a170902bd4400b00148a2f79d85mr5795145plx.164.1640335397029;
        Fri, 24 Dec 2021 00:43:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd40:cbd0:c42a:3c26])
        by smtp.gmail.com with ESMTPSA id p13sm436369pgl.23.2021.12.24.00.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:43:16 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT 0/7] media: hantro: jpeg: Various improvements
Date:   Fri, 24 Dec 2021 16:42:41 +0800
Message-Id: <20211224084248.3070568-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Here are some improvements to the Hantro JPEG encoder driver. This
finishes two of the TODO items.

Patch 1 cleans up the final register write sequence in the JPEG encoder
driver. This particular bit was a bit confusing and hard to understand
given the lack of context around the original wmb(). Was it used to
force all the register writes to finish or to make sure memory writes
were completed? In the end I stuck with what the other hantro decoders
were doing.

Patch 2 fixes a misleading register name.

Patch 3 implements cropping on the output queue with the selection API
for the JPEG encoder. This allows specifying the visible area slightly
smaller than the macroblock-aligned coded size. This bit can be reused
by other stateless encoders once they are implemented.

Patch 4 adds a JFIF APP0 segment to the JPEG encoder output.

Patch 5 adds a COM segment to the JPEG encoder output. This is used to
align the SOS segment payload area.

Patch 6 implements the V4L2_CID_JPEG_ACTIVE_MARKER control. This is only
used to signal the segments added to userspace. The driver ignores any
changes requested.

Patch 7 lets the encoder output directly into the capture buffer,
getting rid of the DMA bounce buffer.


Please have a look and test. I only tested this on the RK3399 with
gstreamer. The H1 variant is untested by me.

To test the selection API bits with gstreamer, the v4l2videoenc plugin
needs to be patched. A gst_v4l2_object_set_crop() call should be
inserted after gst_v4l2_object_set_format() in
gst_v4l2_video_enc_set_format().


Regards
ChenYu


Chen-Yu Tsai (7):
  media: hantro: jpeg: Relax register writes before write starting
    hardware
  media: hantro: Fix overfill bottom register field name
  media: hantro: Support cropping visible area for encoders
  media: hantro: jpeg: Add JFIF APP0 segment to JPEG encoder output
  media: hantro: jpeg: Add COM segment to JPEG header to align image
    scan
  media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
  media: hantro: output encoded JPEG content directly to capture buffers

 drivers/staging/media/hantro/TODO             |  7 --
 drivers/staging/media/hantro/hantro.h         |  1 -
 drivers/staging/media/hantro/hantro_drv.c     | 51 ++++++++----
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 44 ++++++-----
 drivers/staging/media/hantro/hantro_h1_regs.h |  2 +-
 drivers/staging/media/hantro/hantro_hw.h      | 11 ---
 drivers/staging/media/hantro/hantro_jpeg.c    | 51 ++++--------
 drivers/staging/media/hantro/hantro_jpeg.h    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c    | 77 +++++++++++++++++++
 .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c  | 47 ++++++-----
 .../staging/media/hantro/rockchip_vpu_hw.c    |  6 --
 11 files changed, 186 insertions(+), 113 deletions(-)

-- 
2.34.1.448.ga2b2bfdf31-goog

