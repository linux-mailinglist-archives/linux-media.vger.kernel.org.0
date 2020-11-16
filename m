Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CA62B4458
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgKPNCm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:02:42 -0500
Received: from gw.c-home.cz ([89.24.150.100]:33806 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727978AbgKPNCl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:02:41 -0500
Received: from ubuntu2004.c-home.cz (unifi.c-home.cz [192.168.1.227])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 0AGCuMlV021922;
        Mon, 16 Nov 2020 13:56:27 +0100 (CET)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/6] ARM: dts: sun8i: v3s: Enable video decoder
Date:   Mon, 16 Nov 2020 13:56:11 +0100
Message-Id: <20201116125617.7597-1-m.cerveny@computer.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch extends cedrus capability to all decoders
because V3s missing MPEG2 decoder.

Next two patches add system control node (SRAM C1) and 
next three patches add support for Cedrus VPU.

Tested on "Lichee Zero" V3s platform with testing LCD patch
( https://github.com/mcerveny/linux/tree/media_tree_for-v5.11e )
and V4L2 raw API testing utility (updated to v5.10)
( https://github.com/mcerveny/v4l2-request-test ):
- enabled LCD (DRM dual VI and sigle UI planes)
- added RGB panel
- enabled PWM
- need additional patch https://git.linuxtv.org/media_tree.git/commit/?h=fixes&id=9ac924b98728c3733c91c6c59fc410827d0da49f

There is low memory on V3s (64MB) and maximum must be available to CMA:
- CONFIG_CMA_SIZE_MBYTES=28
- add swap to swapout other processes
- decrease buffers in v4l2-request-test (.buffers_count from 16 to 8)

Only H.264 decoder working - MPEG and H.265 unsupported by V3s,
JPEG/MJPEG still unimplemented, encoder unimplemented

best regards,
Martin

Changes since v2:
- updated/rebased to https://git.linuxtv.org/hverkuil/media_tree.git/?h=for-v5.11e
- some parts of patches implemeted by others
- updated R40
Changes since v1:
- patch 0005 rename
- added testing description

Martin Cerveny (6):
  media: cedrus: Register all codecs as capability
  dt-bindings: sram: allwinner,sun4i-a10-system-control: Add V3s
    compatibles
  ARM: dts: sun8i: v3s: Add node for system control
  media: cedrus: Add support for V3s
  dt-bindings: media: cedrus: Add V3s compatible
  ARM: dts: sun8i: v3s: Add video engine node

 .../allwinner,sun4i-a10-video-engine.yaml     |  1 +
 .../allwinner,sun4i-a10-system-control.yaml   |  3 ++
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 24 ++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 32 +++++++++++++++++--
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  2 ++
 6 files changed, 62 insertions(+), 2 deletions(-)

-- 
2.25.1

