Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A780B73527
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 19:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbfGXRRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 13:17:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34464 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbfGXRRQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 13:17:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2CDFB28B603
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/7] hantro: Add RK3399 VP8 decoding support
Date:   Wed, 24 Jul 2019 14:16:55 -0300
Message-Id: <20190724171702.9449-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds VP8 decoding support on RK3399 SoC.

I'm including a set of commits from Boris' recent H264 series [1].
These commits add some helpers that are also useful for RK3399 VP8,
and at the same time cleanup the driver nicely.

Finally, there's a fix by Francois Buergisser from Chromium team.

VP8 and MPEG-2 tested on RK3399 RockPi and RK3288 Rock2 boards.

[1] https://patchwork.kernel.org/cover/11003971/

Boris Brezillon (4):
  media: hantro: Simplify the controls creation logic
  media: hantro: Constify the control array
  media: hantro: Add hantro_get_{src,dst}_buf() helpers
  media: hantro: Add helpers to prepare/finish a run

Ezequiel Garcia (1):
  media: hantro: Move VP8 common code

Francois Buergisser (1):
  media: hantro: Set DMA max segment size

Jeffy Chen (1):
  media: hantro: Support RK3399 VP8 decoding

 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         |  15 +-
 drivers/staging/media/hantro/hantro_drv.c     |  53 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  14 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  34 +-
 .../staging/media/hantro/hantro_h1_jpeg_enc.c |  11 +-
 drivers/staging/media/hantro/hantro_hw.h      |   7 +
 drivers/staging/media/hantro/hantro_vp8.c     |  15 +
 drivers/staging/media/hantro/rk3399_vpu_hw.c  |  22 +-
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |  12 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  14 +-
 .../media/hantro/rk3399_vpu_hw_vp8_dec.c      | 597 ++++++++++++++++++
 12 files changed, 711 insertions(+), 84 deletions(-)
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c

-- 
2.22.0

