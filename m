Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCD73260C9
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbhBZKCo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbhBZKCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:02:40 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343EAC061574
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:00 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s16so5036171plr.9
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rdHQrIoRBZis59jo/BlYAHJNjsS+NHQ7VVed8ginGb0=;
        b=MsQ/EITikSwmceNc01UidROuZO8i86fefQVWuDj88ZnuaRnex8jZbEqMBSj7xJf3vk
         4MS4W+RN09mFDHeWU1V+lzeZfBb3IKOUdtA19n09rxA3lFEfiL0bWn0xbd9GXQ0NHTJH
         rCmhueTb2eC3VliCroGN3UeXgb2iCmHbps2jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rdHQrIoRBZis59jo/BlYAHJNjsS+NHQ7VVed8ginGb0=;
        b=bubQQvwEOWr+37RWV/FOxkKKK4cQaFA5ffFwk/GtCXQeElQBPD4tJU7bFWSDFn4Vgg
         4gSGs5B81USH+OqK1mgQ6a77FCFhkdJeg2SPjl3D37FqFT/GDLrdO8Dn8wIh1x1bkFOW
         /PfGs/EqzbUC/UDymv79coKXfMTvCsT4e5JTBIlX7CM5QFTTu469p9O9SzC8JIZ7CbwF
         HyitHnM/b/ZXtsn3VL2joOJjBVGYgzlaI87rPWCVY2LZ3oNZhQj4GPUwyMf61nPb0Vmu
         g63oXLpnT5riJD7AWmmQPmrdqc2eQCTJwo8m5ddPnqQIKSbY61NtL/WwMR+Tts8HflcK
         hUiw==
X-Gm-Message-State: AOAM530OE1lCbfVCVGQrHzEFDvlN+PQg7NiQ30TiFYSZVPBXApryfIEY
        j8s1bWefBJtIXGCek0xbPH6wcuXUlGxb3w==
X-Google-Smtp-Source: ABdhPJzTeUwT5lTjJeqNtc/Vnuyz+cdz8j6lb2R9rH9Z7Ae4N0P6WxL+lS+AF39HONEWvZwP7VfhRQ==
X-Received: by 2002:a17:90a:ce88:: with SMTP id g8mr2635720pju.107.1614333719701;
        Fri, 26 Feb 2021 02:01:59 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:01:59 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 00/15] media: mtk-vcodec: support for MT8183 decoder
Date:   Fri, 26 Feb 2021 19:01:33 +0900
Message-Id: <20210226100148.1663389-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please ignore the v2 of this series since I neglected a final check on
it and realized later it did not compile. >_<

This series adds support for the stateless API into mtk-vcodec, by first
separating the stateful ops into their own source file, and introducing
a new set of ops suitable for stateless decoding. As such, support for
stateful decoders should remain completely unaffected.

This series has been tested with both MT8183 and MT8173. Decoding was
working for both chips, and in the case of MT8173 no regression has been
spotted.

Patches 1-9 add MT8183 support to the decoder using the stateless API.
MT8183 only support H.264 acceleration.

Patches 10-15 are follow-ups that further improve compliance for the
decoder and encoder, by fixing support for commands on both. Patch 11
also makes sure that supported H.264 profiles are exported on MT8173.

Changes since v2:
* Actually compiles (duh),
* Add follow-up patches fixing support for START/STOP commands for the
  encoder, and stateful decoder.

Alexandre Courbot (8):
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec
  media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
  media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
  media: mtk-vcodec: make flush buffer reusable by encoder
  media: mtk-vcodec: venc: support START and STOP commands

Hirokazu Honda (1):
  media: mtk-vcodec: vdec: Support H264 profile control

Hsin-Yi Wang (1):
  media: mtk-vcodec: venc: make sure buffer exists in list before
    removing

Yunfei Dong (5):
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 800 +++--------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  30 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 647 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 +++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 807 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2360 insertions(+), 704 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

-- 
2.30.1.766.gb4fecdf3b7-goog

