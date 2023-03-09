Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 451F26B24BB
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjCIM6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbjCIM63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:58:29 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D27DF1687
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:57:46 -0800 (PST)
Received: from localhost.localdomain (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C2E476602FE7;
        Thu,  9 Mar 2023 12:57:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678366624;
        bh=Fa+K5mx43H80PRxNz8HGFdjywzLARrxyM7AGivxbkmM=;
        h=From:To:Cc:Subject:Date:From;
        b=eop0JHHVRbR2cemyFzYWv12A3q9MNdjNt3rzrRbPizk5Mlcqx+EHcTm6kGLNdXhoz
         ESfuq8UAz5PUQgibHuCIg96U3xKfeLOPFcHup7aTan1gnc8kVLJhz0C1OT2F8XiQBW
         hkbC11Qh+pBRM1L7FW5s7SujC5oookzK/xmxtkc/6jnYRZyGowS1Nn2ixd3n5CaPLo
         rh+4I5woJSfNa+bVPo9knDITeJElECBJpIgPz8u80S44ZrSPAKvzcFKS+toNl0iFpW
         ExL3klAwlWSv/i1JvvPncxeSzh+NRJqbG9s3HYmTyFKnlxRsA3RYphQ30HHbR0kuLT
         V2/DwWLTxh75Q==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [RFC 0/2] VP8 stateless V4L2 encoding uAPI + driver
Date:   Thu,  9 Mar 2023 13:56:49 +0100
Message-Id: <20230309125651.23911-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear All,

This two-patch series adds uAPI for stateless VP8 encoding
and an accompanying driver using it.

It has been tested on an rk3399 board and there exists
a gstreamer user:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3736

example pipeline:

gst-launch-1.0 videotestsrc num-buffers=500 ! video/x-raw,width=640,height=480 \
! v4l2slvp8enc ! queue ! matroskamux ! filesink location=test_vp8.mkv

I kindly ask for comments.

Notably, the documentation for the added uAPI is missing,
that is to be addressed when sending a patch series proper (not RFC).

For the RFC I also did not care to replace a BUG_ON() in the boolean encoder.

Rebased onto v6.2.

Regards,

Andrzej

Andrzej Pietrasiewicz (2):
  media: uapi: Add VP8 stateless encoder controls
  media: rkvdec: Add VP8 encoder

 drivers/media/platform/verisilicon/Makefile   |    2 +
 drivers/media/platform/verisilicon/hantro.h   |   10 +
 .../platform/verisilicon/hantro_boolenc.c     |   69 +
 .../platform/verisilicon/hantro_boolenc.h     |   21 +
 .../media/platform/verisilicon/hantro_drv.c   |   18 +-
 .../media/platform/verisilicon/hantro_hw.h    |   90 +
 .../media/platform/verisilicon/hantro_v4l2.c  |    5 +-
 .../media/platform/verisilicon/hantro_vp8.c   |  118 ++
 .../verisilicon/rockchip_vpu2_hw_vp8_enc.c    | 1574 +++++++++++++++++
 .../platform/verisilicon/rockchip_vpu2_regs.h |    1 +
 .../platform/verisilicon/rockchip_vpu_hw.c    |   23 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   16 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    5 +
 include/media/v4l2-ctrls.h                    |    1 +
 include/uapi/linux/v4l2-controls.h            |   91 +
 include/uapi/linux/videodev2.h                |    3 +
 16 files changed, 2041 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.h
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_enc.c


base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
-- 
2.25.1

