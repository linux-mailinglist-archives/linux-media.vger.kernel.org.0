Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C51C267AD9
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgILObU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:31:20 -0400
Received: from gw.c-home.cz ([89.24.150.100]:33021 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgILObT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:31:19 -0400
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 08CEUtMx007223;
        Sat, 12 Sep 2020 16:31:01 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/6] ARM: dts: sun8i: v3s: Enable video decoder
Date:   Sat, 12 Sep 2020 16:30:46 +0200
Message-Id: <20200912143052.30952-1-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch extends cedrus capability to all decoders
because V3s missing MPEG2 decoder.

Next two patches add system control node (SRAM C1) and 
next three patches add support for Cedrus VPU.

Tested on "Lichee Zero" V3s platform with testing LCD patch
( https://github.com/mcerveny/linux/tree/v3s_videocodec_v4 )
and V4L2 raw API testing utility
( https://github.com/mcerveny/v4l2-request-test ):
- enabled LCD (DRM dual VI and sigle UI planes)
- added RGB panel
- enabled PWM

There is low memory on V3s (64MB) and maximum must be available to CMA:
- CONFIG_CMA_SIZE_MBYTES=28
- add swap to swapout other processes
- decrease buffers in v4l2-request-test (.buffers_count from 16 to 6)

Only H.264 decoder working - MPEG and H.265 unsupported by V3s,
JPEG/MJPEG still unimplemented, encoder unimplemented

best regards,
Martin

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
 .../allwinner,sun4i-a10-system-control.yaml   |  6 ++++
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 33 +++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 28 +++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c |  2 ++
 6 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.17.1

