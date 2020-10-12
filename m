Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7125D28C3AA
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 23:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbgJLU6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:58:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49752 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgJLU6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id C2D091F40F09
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] Add Hantro regmap and VC8000 h264 decode support
Date:   Mon, 12 Oct 2020 23:59:39 +0300
Message-Id: <20201012205957.889185-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

This series introduces a regmap infrastructure for the Hantro driver
which is used to compensate for different HW-revision register layouts.
To justify it h264 decoding capability is added for newer VC8000 chips.

This is a gradual conversion to the new infra - a complete conversion
would have been very big and I do not have all the HW yet to test (I'm
expecting a RK3399 shipment next week though ;). I think converting the
h264 decoder provides a nice blueprint for how the other codecs can be
converted and enabled for different HW revisions.

The end goal of this is to make the driver more generic and eliminate
entirely custom boilerplate like `struct hantro_reg` or headers with
core-specific bit manipulations like `hantro_g1_regs.h` and instead rely
on the well-tested albeit more verbose regmap subsytem.

To give just two examples of bugs which are easily discovered by using
more verbose regmap fields (very easy to compare with the datasheets)
instead of relying on bit-magic tricks: G1_REG_DEC_CTRL3_INIT_QP(x) was
off-by-1 and the wrong .clk_gate bit was set in hantro_postproc.c.

Anyway, this series also extends the MMIO regmap API to allow relaxed
writes for the theoretical reason that avoiding unnecessary membarriers
leads to less CPU usage and small improvements to battery life. However,
in practice I could not measure differences between relaxed/non-relaxed
IO, so I'm on the fence whether to keep or remove the relaxed calls.

What I could masure is the performance impact of adding more sub-reg
field acesses: a constant ~ 20 microsecond bump per G1 h264 frame. This
is acceptable considering the total time to decode a frame takes three
orders of magnitude longer, i.e. miliseconds ranges, depending on the
frame size and bitstream params, so it is an acceptable trade-off to
have a more generic driver.

This has been tested on next-20201009 with imx8mq for G1 and an SoC with
VC8000 which has not yet been added (hopefuly support lands soon).

Kind regards,
Adrian

Adrian Ratiu (18):
  media: hantro: document all int reg bits up to vc8000
  media: hantro: make consistent use of decimal register notation
  media: hantro: make G1_REG_SOFT_RESET Rockchip specific
  media: hantro: add reset controller support
  media: hantro: prepare clocks before variant inits are run
  media: hantro: imx8mq: simplify ctrlblk reset logic
  regmap: mmio: add config option to allow relaxed MMIO accesses
  media: hantro: add initial MMIO regmap infrastructure
  media: hantro: default regmap to relaxed MMIO
  media: hantro: convert G1 h264 decoder to regmap fields
  media: hantro: convert G1 postproc to regmap
  media: hantro: add VC8000D h264 decoding
  media: hantro: add VC8000D postproc support
  media: hantro: make PP enablement logic a bit smarter
  media: hantro: add user-selectable, platform-selectable H264 High10
  media: hantro: rename h264_dec as it's not G1 specific anymore
  media: hantro: add dump registers debug option before decode start
  media: hantro: document encoder reg fields

 drivers/base/regmap/regmap-mmio.c             |   34 +-
 drivers/staging/media/hantro/Makefile         |    3 +-
 drivers/staging/media/hantro/hantro.h         |   79 +-
 drivers/staging/media/hantro/hantro_drv.c     |   41 +-
 drivers/staging/media/hantro/hantro_g1_regs.h |   92 +-
 ...hantro_g1_h264_dec.c => hantro_h264_dec.c} |  237 +++-
 drivers/staging/media/hantro/hantro_hw.h      |   23 +-
 .../staging/media/hantro/hantro_postproc.c    |  144 ++-
 drivers/staging/media/hantro/hantro_regmap.c  | 1015 +++++++++++++++++
 drivers/staging/media/hantro/hantro_regmap.h  |  295 +++++
 drivers/staging/media/hantro/hantro_v4l2.c    |    3 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |   75 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |    5 +-
 include/linux/regmap.h                        |    5 +
 14 files changed, 1795 insertions(+), 256 deletions(-)
 rename drivers/staging/media/hantro/{hantro_g1_h264_dec.c => hantro_h264_dec.c} (58%)
 create mode 100644 drivers/staging/media/hantro/hantro_regmap.c
 create mode 100644 drivers/staging/media/hantro/hantro_regmap.h

-- 
2.28.0

