Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B376F3B359C
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 20:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhFXS2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 14:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXS2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 14:28:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7C5C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 11:26:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 792551F4420A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 00/12] hantro: Enable H.264 VDPU2 (Odroid Advance Go)
Date:   Thu, 24 Jun 2021 15:26:00 -0300
Message-Id: <20210624182612.177969-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for H.264 decoding on the PX30, RK3328
and RK3326 platforms, enabling the VDPU2 core.

Given it's tested on the Odroid Advance Go, patches 1 and 2
add the basic support to report the panel orientation to
userspace (Heiko, if you like them, feel free to pick them).
Weston (for instance) picks up the orientation automagically
and rotates the render.

Patches 3 and 4 are just low-hanging fruit that was on my backlog.

Patches 5, 6 and 7 add some helpers to avoid duplicating some processes
between Hantro G1 and VDPU2. Patches 8 and 9 enable the VDPU2 H.264.
The implementation is based on a patch from Jonas Karlman [1], which
I forwarded ported to mainline.

Finally, patches 10 to 12 add support for the VPU on Rockchip PX30 SoCs.
These patches are based on patches submitted by Paul Kocialkowski [2],
which I ported and adjusted a bit.

Tested on i.MX8MQ EVK and RK3326 Odroid Advance Go, the latter
is able to decode a 1080p sample at ~100fps nicely.

Fluster conformance testing is looking good as well, and producing
expected results:

RK3326:
  Ran 135 tests in 480.067s
  FAILED (failures=9, errors=54)

i.MX8MQ:
  Ran 135 tests in 337.491s
  FAILED (failures=9, errors=54)

[1] https://lore.kernel.org/linux-media/HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com/
[2] https://lore.kernel.org/patchwork/cover/1361795/

Ezequiel Garcia (8):
  drm/panel: kd35t133: Add panel orientation support
  arm64: dts: rockchip: Add panel orientation to Odroid Go Advance
  hantro: vp8: Move noisy WARN_ON to vpu_debug
  hantro: Make struct hantro_variant.init() optional
  media: hantro: Avoid redundant hantro_get_{dst,src}_buf() calls
  media: hantro: h264: Move DPB valid and long-term bitmaps
  media: hantro: h264: Move reference picture number to a helper
  media: hantro: Enable H.264 on Rockchip VDPU2

Jonas Karlman (1):
  media: hantro: Add H.264 support for Rockchip VDPU2

Paul Kocialkowski (3):
  dt-bindings: media: rockchip-vpu: Add PX30 compatible
  arm64: dts: rockchip: Add VPU support for the PX30
  media: hantro: Add support for the Rockchip PX30

 .../bindings/media/rockchip-vpu.yaml          |   3 +
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  23 +
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |   1 +
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  |   8 +
 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         |   4 +-
 drivers/staging/media/hantro/hantro_drv.c     |  11 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c |  48 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  31 +-
 drivers/staging/media/hantro/hantro_h264.c    |  24 +
 drivers/staging/media/hantro/hantro_hw.h      |   8 +
 .../media/hantro/rockchip_vpu2_hw_h264_dec.c  | 491 ++++++++++++++++++
 .../media/hantro/rockchip_vpu2_hw_vp8_dec.c   |  32 +-
 .../staging/media/hantro/rockchip_vpu_hw.c    |  54 +-
 .../staging/media/hantro/sama5d4_vdec_hw.c    |   6 -
 15 files changed, 671 insertions(+), 74 deletions(-)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c

-- 
2.30.0

