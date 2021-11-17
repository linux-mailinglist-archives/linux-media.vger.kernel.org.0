Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8E34546D9
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhKQNJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:09:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49476 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhKQNJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:09:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id DD51F1F43923
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637154406; bh=XT88vmZVnGAA3DUx4qTSK6yoA3E1ZD2YHWTaXApYMl0=;
        h=From:To:Cc:Subject:Date:From;
        b=itSkYpE4aJYHYyqBzPBCktorR6BgopahzZNmzMTfDoTcrp0V2aJrODJn4Fui+uQSM
         EUqeMuSdGejWwMz+yrVT8m9XjbA2j4XAO+BjAoGQcZSbF2gMyiCKqnriI4SO9uv6j6
         inknXWx7PNs0bXlDI6/Zjl+foKmXsl447qdEM3P8bt0JwjVV5XqQ0NFXqo4QK/1Qiu
         jfnq+rXfn7j8DSdii4X7SVX+8JKU8V0cRMcOco1CnCsHQk302x4RuFaL5gLQdWuvyb
         Gp4NK6oH/q/55SokanaML5jIiwqhrGut9TWWEiB131ypFjGMqwu3CA4j4w4gpkWakz
         GClSSMTDtewBw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH v2 0/7] media: mtk-vcodec: few fixes
Date:   Wed, 17 Nov 2021 15:06:28 +0200
Message-Id: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is v2 of patches that fixes issues in the mtk-vcodec encoder
v1 is [1]

patch 1 add support to vp8 profile contorl. Without this control the encoder can't be used with gstreamer.
patches 2-3 are bug fixes
patch 4: fixes the debugging
patch 5-7 are cleanups

changes from v1:
1. some cleanup patches (4-6) are new
2. improve commit log of patches.


[1] https://lore.kernel.org/linux-media/34a3f0e40c5248472d072d2a06cc4370e08ea9ff.camel@ndufresne.ca/T/

Dafna Hirschfeld (7):
  media: mtk-vcodec: enc: add vp8 profile ctrl
  media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is
    released
  media: mtk-vcodec: enc: use "stream_started" flag for
    "stop/start_streaming"
  media: mtk-vcodec: fix debugging defines
  media: mtk-vcodec: replace func vidioc_try_fmt with two funcs for
    out/cap
  media: mtk-vcodec: don't check return val of mtk_venc_get_q_data
  meida: mtk-vcodec: remove unused func parameter

 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   3 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   4 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 206 +++++++++---------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   5 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  10 -
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |  45 +---
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   4 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   9 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   3 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   1 -
 11 files changed, 118 insertions(+), 173 deletions(-)

-- 
2.17.1

