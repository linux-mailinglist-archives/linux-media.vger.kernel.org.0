Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C2C324DE6
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233984AbhBYKTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbhBYKQo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:16:44 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BF4C06178B
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:26 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t5so4816283pjd.0
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0atpWon12z4IWnuFWgpbQsyQr6nSoFQweJtAwwQcdzg=;
        b=Nr5BqbxSOcyQWzKpp/SIuKrPwvxQi8Q+NaZCxHSiZbKbAa7GL+dL03bUeGe8+Da7W2
         Wh2dyEXlJj21rZwW0q7mdkSY6Y0SBVbJGUE2n9VHhJIa4L2liA1vXmRseWAjFWK0jD01
         EvnCG73mMk8Y5NSKJIBUTqCHAfBnBJJeMf1pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0atpWon12z4IWnuFWgpbQsyQr6nSoFQweJtAwwQcdzg=;
        b=qylRtVpcX2kQwKRRwRFuDGP4kHHW4MD5aDYaJFKuaysjgoVFUBodQ7cHU5la1QAeDQ
         /Ib2eRICOy31rxaMkBpPI/16XT5aJAEPiRBS2ZE0bsmX9jVwKiTdk3ARmFlka9k3UsWL
         aQ4BhjHZLuHTG73s14yKAWRAVS7mQIal6+UN9qbQJ8fakPzZ60A2DbEhVlRbRq+tDQDn
         GfBlwf7k9OtecnAqi5OOBEkDuDQRG0+npuxAoWV/CrgvSa75PAHN4mYuKqY3o+WBzoEs
         OFDEJlcz85Fl6xmbQKEbfUW4dhsuZsMLylz88mGoKOKEkPGZHsRaBXGolQywJdhZ6VAk
         NLuQ==
X-Gm-Message-State: AOAM531+k71Xl2jad/JeGeXy2hwV0jfrkGa3xpb+X4OBzoiDy2xEip6v
        FFl9JArrg1OYatRq1eDK/sPS9A==
X-Google-Smtp-Source: ABdhPJzBmqqLIz2rwI/0pS/Sl2SKlj6SwhdoQHrjNHnPKxBAWzEzxWx61d+Ngoc2E6AzBwVP2WUQsQ==
X-Received: by 2002:a17:90a:d318:: with SMTP id p24mr2744855pju.122.1614248186008;
        Thu, 25 Feb 2021 02:16:26 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
        by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:16:25 -0800 (PST)
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
Subject: [PATCH v2 0/8] media: mtk-vcodec: vdec: support for MT8183
Date:   Thu, 25 Feb 2021 19:16:04 +0900
Message-Id: <20210225101612.2832444-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here is the second version is this patchset, although there has been such a
delay after the first one that probably nobody remembers it has even been sent.

This series adds support for the stateless API into mtk-vcodec, by first
separating the stateful ops into their own source file, and introducing a new
set of ops suitable for stateless decoding. As such, support for stateful
decoders should remain completely unaffected.

This series has been tested with both MT8183 and MT8173. Decoding was working
for both chips, and in the case of MT8173 no regression has been spotted.

v4l2-compliance is also passing, minor a problem when testing requests on
MT8183: the test tries to call S_EXT_CTRLS on the first available control,
which happens to be V4L2_CID_MIN_BUFFERS_FOR_CAPTURE. Since this control is
read-only, the driver returns -EACCESS. I suppose this is a problem with
v4l2-compliance and not the driver.

Alexandre Courbot (4):
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec

Yunfei Dong (4):
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  44 +
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 +++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   9 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 808 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 18 files changed, 1442 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.30.0.617.g56c4b15f3c-goog

