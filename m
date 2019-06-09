Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E463A669
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 16:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbfFIOiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 10:38:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46084 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbfFIOiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 10:38:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so6558396wrw.13
        for <linux-media@vger.kernel.org>; Sun, 09 Jun 2019 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT145cOmHBvHp5+au2TZxy31k5STP3PpDOo3PdqIDJ8=;
        b=IPnY8mvIy8Zprrk36vEaBlOtsMxy5Ei2rhkeKdqfFVZVIYx56/hnDCSwH+IJbp2tS4
         hYKreR35169ujUfgPWvSlGBS0G4SjsOrkczW2nhfeVMPjNwahyzar/4ye5aacufYRs95
         enWme4Obm6p25t4eI2rIxlQbgNqjgD6hzkTTJwrMR6gaOS+ds1kI/ybc3JnTBcaysa0L
         cQunNBBrHI4XH8JOWIBj7gGizkK2pT0XeylbyVC0xHctA0HBQot60b0rPEu8aT1EErzt
         8BpcQTSV6fBjuD0yP1QGPrJs34A9U2DpMAwpeQUD9yix39LyoTbZAQnjcXSrxm6jz/KC
         OPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aT145cOmHBvHp5+au2TZxy31k5STP3PpDOo3PdqIDJ8=;
        b=TgQN1iJJfBgJ3qxF166m6AOA7E62lmLoyOXLcW7UeAMtJRvhEm4mimYHES396dtE3U
         hr0YA5n0CrfpYRgNq4yHBFdRVGne0H93X+/QcJ2bUT12Hj+/hlTXdorkhRNIwPfiAwIW
         1o7eFwhCuq5fkX/9NeJR6308f616A3oHKYttsZ0zRHppdMTe6Kr2NJAeHX/0vMAwMPpg
         hwLfyre/M1nFYrIfR883pjXmYQm8XPET+zyR6Wg1a2E4Ja/HGt75APgV//JTWiVeq7fp
         sHth6nVFcEqJuUJlf7oqswz5+DhcUtVLUAASS9W8q4azJNMnZug7sq3++spgDBPiGBRx
         0kLg==
X-Gm-Message-State: APjAAAVLm1al2c0LAP38cZHBNLv8Xn+tXSjM8dcy/r58+MXLqXdwv8lD
        H4YFOGU1ZCoXeFaVZroMeaBwzA==
X-Google-Smtp-Source: APXvYqzEWdX1dLa5jrJ7WFynMa9ukpv6QH+rjpKLNuzSGX8vCZD/X1JfHgecs3YUbxbBuWdebzC/TA==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr21209674wro.36.1560091103673;
        Sun, 09 Jun 2019 07:38:23 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr. [85.68.183.99])
        by smtp.gmail.com with ESMTPSA id c17sm6047713wrv.82.2019.06.09.07.38.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 07:38:22 -0700 (PDT)
From:   Maxime Jourdan <mjourdan@baylibre.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic resolution switching
Date:   Sun,  9 Jun 2019 16:38:15 +0200
Message-Id: <20190609143820.4662-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
to tag coded formats for which the device supports dynamic resolution
switching, via V4L2_EVENT_SOURCE_CHANGE.
This includes the initial "source change" where the device is able to
tell userspace about the coded resolution and the DPB size (which
sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
This flag is mainly aimed at stateful decoder drivers.

This RFC is motivated by my development on the amlogic video decoder
driver, which does not support dynamic resolution switching for older
coded formats (MPEG 1/2, MPEG 4 part II, H263). It does however support
it for the newer formats (H264, HEVC, VP9).

The specification regarding stateful video decoders should be amended
to include that, in the absence of this flag for a certain format,
userspace is expected to extract the coded resolution and allocate
a sufficient amount of capture buffers on its own.
I understand that this point may be tricky, since older kernels with
close-to-spec drivers would not have this flag available, yet would
fully support dynamic resolution switching.
However, with the spec not merged in yet, I wanted to have your opinion
on this late addition.

The RFC patches also adds support for this flag for the 4 following
stateful decoder drivers:
 - venus
 - s5p-mfc
 - mtk-vcodec
 - vicodec

Maxime Jourdan (5):
  media: videodev2: add V4L2_FMT_FLAG_DYN_RESOLUTION
  media: venus: vdec: flag OUTPUT formats with
    V4L2_FMT_FLAG_DYN_RESOLUTION
  media: s5p_mfc_dec: flag OUTPUT formats with
    V4L2_FMT_FLAG_DYN_RESOLUTION
  media: mtk-vcodec: flag OUTPUT formats with
    V4L2_FMT_FLAG_DYN_RESOLUTION
  media: vicodec: flag vdec/stateful OUTPUT formats with
    V4L2_FMT_FLAG_DYN_RESOLUTION

 Documentation/media/uapi/v4l/vidioc-enum-fmt.rst   |  7 +++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/vdec.c           | 11 +++++++++++
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 13 +++++++++++++
 drivers/media/platform/vicodec/vicodec-core.c      |  2 ++
 include/uapi/linux/videodev2.h                     |  5 +++--
 9 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.21.0

