Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7E743798C
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 17:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbhJVPGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 11:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbhJVPGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 11:06:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4510C061766;
        Fri, 22 Oct 2021 08:04:19 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:50fa:5c7d:20f4:e8d3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7F37C1F4120F;
        Fri, 22 Oct 2021 16:04:17 +0100 (BST)
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
Subject: [PATCH 0/3] media: mtk-vcodec: few fixes
Date:   Fri, 22 Oct 2021 17:04:07 +0200
Message-Id: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

3 fixes to mtk-vcodec

1. we found out that the vp8 encoder
should support the vp8 profile ctrl for the gstreamer to work
2. some bug fix related the streaming start/stop
3. some cleanup

Dafna Hirschfeld (3):
  media: mtk-vcodec: enc: add vp8 profile ctrl
  media: mtk-vcodec: enc: use "stream_started" flag for
    "stop/start_streaming"
  meida: mtk-vcodec: remove unused func parameter

 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h |  4 ++++
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c | 18 ++++++++++++++++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c    |  9 +++------
 .../platform/mtk-vcodec/venc/venc_vp8_if.c     |  3 +--
 .../media/platform/mtk-vcodec/venc_vpu_if.c    |  1 -
 .../media/platform/mtk-vcodec/venc_vpu_if.h    |  1 -
 6 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.17.1

