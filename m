Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34E13CEFC4
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 01:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245293AbhGSWjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 18:39:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44674 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387508AbhGSUNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 16:13:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A10AD1F42015
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kever Yang <kever.yang@rock-chips.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 00/10] hantro: Enable H.264 VDPU2
Date:   Mon, 19 Jul 2021 17:52:32 -0300
Message-Id: <20210719205242.18807-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for H.264 decoding on the PX30, RK3328
and RK3326 platforms, enabling the VDPU2 core. This core is available
on other SoCs as well, such as RK3568/RK3566.

Patches 1, 2 and 3 are just low-hanging fruit that was on my backlog.

Patches 4 and 5 add some helpers to avoid duplicating some processes
between Hantro G1 and VDPU2. Patches 6 and 7 enable the VDPU2 H.264.
The implementation is based on a patch from Jonas Karlman [1], which
I forwarded ported to mainline.

Finally, patches 8 to 10  add support for the VPU on Rockchip PX30 SoCs.
These patches are based on patches submitted by Paul Kocialkowski [2],
which I ported and adjusted a bit.

I'd like to thank Jonas and Paul for the good work, and Alex Bee
for the additional testing.

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

v3:

* Keep a single compatible string "rockchip,px30-vpu",
  instead of making it compatible with rk3399. The SoCs may
  have small (but important) differences in their integration
  so it's better to just make sure the proper compatible is mandatory.

Ezequiel Garcia (6):
  hantro: vp8: Move noisy WARN_ON to vpu_debug
  hantro: Make struct hantro_variant.init() optional
  media: hantro: Avoid redundant hantro_get_{dst,src}_buf() calls
  media: hantro: h264: Move DPB valid and long-term bitmaps
  media: hantro: h264: Move reference picture number to a helper
  media: hantro: Enable H.264 on Rockchip VDPU2

Jonas Karlman (1):
  media: hantro: Add H.264 support for Rockchip VDPU2

Paul Kocialkowski (3):
  media: hantro: Add support for the Rockchip PX30
  dt-bindings: media: rockchip-vpu: Add PX30 compatible
  arm64: dts: rockchip: Add VPU support for the PX30

 .../bindings/media/rockchip-vpu.yaml          |   1 +
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  23 +
 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         |   4 +-
 drivers/staging/media/hantro/hantro_drv.c     |  11 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c |  48 +-
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |  31 +-
 drivers/staging/media/hantro/hantro_h264.c    |  24 +
 drivers/staging/media/hantro/hantro_hw.h      |   8 +
 .../media/hantro/rockchip_vpu2_hw_h264_dec.c  | 491 ++++++++++++++++++
 .../media/hantro/rockchip_vpu2_hw_vp8_dec.c   |  32 +-
 .../staging/media/hantro/rockchip_vpu_hw.c    |  43 +-
 .../staging/media/hantro/sama5d4_vdec_hw.c    |   6 -
 13 files changed, 649 insertions(+), 74 deletions(-)
 create mode 100644 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c

-- 
2.32.0

