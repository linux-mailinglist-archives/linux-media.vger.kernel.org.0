Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C9725E286
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgIDUSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:08 -0400
Received: from gw.c-home.cz ([89.24.150.100]:41821 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbgIDUSH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:07 -0400
X-Greylist: delayed 967 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Sep 2020 16:18:04 EDT
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 084K1Ed8002405;
        Fri, 4 Sep 2020 22:01:19 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     devicetree@vger.kernel.org
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/6] ARM: dts: sun8i: v3s: Enable video decoder
Date:   Fri,  4 Sep 2020 22:01:06 +0200
Message-Id: <20200904200112.5563-1-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch extends cedrus capability to all decoders
because V3s missing MPEG2 decoder.

Next two patches add system control node (SRAM C1) and 
next three patches add support for Cedrus VPU.

Best regards,
Martin

Martin Cerveny (6):
  media: cedrus: Register all codecs as capability
  dt-bindings: sram: allwinner,sun4i-a10-system-control: Add V3s
    compatibles
  ARM: dts: sun8i: v3s: Add node for system control
  media: cedrus: Add support for V3s
  media: allwinner,sun4i-a10-video-engine: Add V3s compatible
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

