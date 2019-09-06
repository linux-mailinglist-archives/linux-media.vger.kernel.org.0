Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8BD2AB783
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389271AbfIFLzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:55:31 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36420 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731552AbfIFLzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:31 -0400
Received: by mail-pg1-f193.google.com with SMTP id l21so3382712pgm.3
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2GTZqYEpAHU3zxK7mUSVan2/q7zCWudSwqJMCAWjdU=;
        b=Q7hjPYGL9bDK+x4kJfT32W6MDCaBCdgo+h9aVnGOuZ+iYpet306mnAp6DyCY6tc4fg
         pZZ7wqT4fL6+2ze22yCAOfc4Cx015rbU9orx6nTX1jOVUrYfesR/ULw+H9XG+2k1UizP
         C5PGPQAuvFwgC7DEpcCDuUBKx1X5mZScZVpQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2GTZqYEpAHU3zxK7mUSVan2/q7zCWudSwqJMCAWjdU=;
        b=Z2XwnmgpUaR7n8D5VB/0zNNtADFBrbtcGavD7sH8aqspBVTiKacK5qKE8cJx1mLDuo
         IQ0YGDVJKEd1WVnatOqFPcrKaF+4oK1/MgeFTCtjoEQGvKcUBGmZAS72JvImnwvlcQQ7
         XTOfTEuIKr7OGKq22Md0Kr4mkAddXbijr0MY3g9pStokK4vYQZVbqdH8ZhlAjOMDIWEe
         93qRdz6F4jq4Uefxy7cuhBBvf8jBubFJJXyxSbtZEhkHrDLWfI9o2u7kaqyt4qDwfpoP
         3JEzf6n/wi/VsVorBgJMunDYPFvwQTp3t1Ng8za4gI5OZYBcgJ88h3o5QuWgSvZKqebD
         QbhQ==
X-Gm-Message-State: APjAAAVNJJd2WltIPsm4EKb1MC2LEUnIlRdA2mnCWvEKp3NiMwfuY7h7
        iEnTBihp1brTQc/N4cT85nrAeA==
X-Google-Smtp-Source: APXvYqwUaIkWwSCm/jZjM27LsOAEyV1Cy9HbtXfWDAxFW5q0aoylVsZqC0rL9vmjw5uuYMy0KYSKkQ==
X-Received: by 2002:a17:90a:a78b:: with SMTP id f11mr9476022pjq.16.1567770929971;
        Fri, 06 Sep 2019 04:55:29 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:29 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 00/12] media: mtk-vcodec: support for MT8183 decoder
Date:   Fri,  6 Sep 2019 20:55:00 +0900
Message-Id: <20190906115513.159705-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Another spin [1] of the support for the MT8183 stateless decoder taken from the
Chrome OS tree. This version is updated to work with the latest revision of
the stateless API. It requires the SCP support patchset [2] and thus is not yet
suitable for merging, except maybe the first 3 to 6 patches.

Patches 1 to 3 are cleanup/fixes and can be merged as-is.

The mtk-vcodec driver already supports the MT8173 chip, which uses the stateful
codec API. Therefore the first step, since MT8183 uses the stateless codec API,
is to isolate the stateful ops from the common code and into its own file, which
is what patch 4 does.

Patches 5 and 6 abstract the firmware in the same way, and add a firmware
version number that will be used by MT8183 firmware.

Patch 7 adds support for communicating with a SCP firmware, and requires the SCP
support series to compile.

Patches 8 and 9 add the documentation and declarations of the MM21 format, a
proprietary block format that MT8183 decodes into. The MDP3 m2m block is capable
of converting this format into something more common.

Patch 10 and 11 add general support for stateless codecs, and support for
decoding a H.264 stream using a stateless codec.

Patch 12 adds support for the media device required to create requests for
stateless decoding.

Finally, patch 13 enables MT8183.

Although the code is not mergeable yet, I thought it would be interesting to
publish it as a RFC that illustrates how another driver implements the stateless
codec API. Reviews are also of course welcome.

[1] https://patchwork.kernel.org/cover/10963719/
[2] https://lkml.org/lkml/2019/9/5/63

Alexandre Courbot (5):
  media: mtk-vcodec: vdec: set VPI IPI handler in one place
  media: mtk-vcodec: vdec: clean up vidioc_vdec_s_fmt a bit
  media: mtk-vcodec: vdec: handle firmware version field
  media: add Mediatek's MM21 format
  media: doc: Add documentation for MM21 video format

Yunfei Dong (8):
  media: mtk-vcodec: vdec: fix incorrect pointer dereference
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../media/uapi/v4l/pixfmt-reserved.rst        |  10 +
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 770 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  30 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 103 ++-
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 631 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 494 +++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  60 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  49 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 208 +++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 -
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 627 ++++++++++++++
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 -
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 -
 .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   4 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |   7 +
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  40 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  20 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  15 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   8 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |   2 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  15 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 33 files changed, 2397 insertions(+), 763 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.23.0.187.g17f5b7556c-goog

