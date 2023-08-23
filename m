Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0812785A5D
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 16:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbjHWOYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 10:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbjHWOYF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 10:24:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C93E47
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 07:24:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAC25639C0
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 14:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F53C433C9;
        Wed, 23 Aug 2023 14:24:01 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 0/3] Split up v4l2-mem2mem.c into a core and codec part
Date:   Wed, 23 Aug 2023 16:23:56 +0200
Message-Id: <20230823142359.602411-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This RFC series splits up v4l2-mem2mem.c into a core and codec part.

This is a first stab at this, I'm not entirely happy with the
fact that v4l2_m2m_qbuf has to call to _v4l2_codec_qbuf helper
for some codec specific handling.

In any case, splitting this up makes it easier to maintain (IMHO)
and probably makes it easier as well to improve the codec part.

Regards,

	Hans

Hans Verkuil (3):
  media: split up v4l2-mem2mem.c into a core and codec part
  media: include v4l2-mem2mem-codec.h in codec drivers
  media: v4l2-mem2mem.h: move codec bits to v4l2-mem2mem-codec.h

 .../media/platform/allegro-dvt/allegro-core.c |   2 +-
 drivers/media/platform/amphion/vdec.c         |   2 +-
 drivers/media/platform/amphion/venc.c         |   2 +-
 .../media/platform/chips-media/coda-common.c  |   2 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    |   2 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   2 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   2 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h |   2 +-
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |   2 +-
 .../media/platform/verisilicon/hantro_drv.c   |   2 +-
 .../media/platform/verisilicon/hantro_v4l2.c  |   2 +-
 .../media/test-drivers/vicodec/vicodec-core.c |   2 +-
 drivers/media/test-drivers/visl/visl-dec.c    |   2 +-
 drivers/media/v4l2-core/Makefile              |   2 +
 drivers/media/v4l2-core/v4l2-mem2mem-codec.c  | 359 +++++++++++++++
 .../{v4l2-mem2mem.c => v4l2-mem2mem-core.c}   | 422 +-----------------
 drivers/media/v4l2-core/v4l2-mem2mem-priv.h   | 100 +++++
 drivers/staging/media/meson/vdec/vdec.c       |   2 +-
 drivers/staging/media/rkvdec/rkvdec.c         |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |   2 +-
 include/media/v4l2-mem2mem-codec.h            | 187 ++++++++
 include/media/v4l2-mem2mem.h                  | 202 +--------
 25 files changed, 691 insertions(+), 619 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-codec.c
 rename drivers/media/v4l2-core/{v4l2-mem2mem.c => v4l2-mem2mem-core.c} (72%)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-priv.h
 create mode 100644 include/media/v4l2-mem2mem-codec.h

-- 
2.40.1

