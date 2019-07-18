Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39626D4B8
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 21:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403817AbfGRTY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jul 2019 15:24:59 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44375 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403800AbfGRTY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jul 2019 15:24:59 -0400
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4AAE660007;
        Thu, 18 Jul 2019 19:24:56 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Update my email address
Date:   Thu, 18 Jul 2019 21:24:55 +0200
Message-Id: <20190718192455.31244-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use my kernel.org address instead of the bootlin one.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .mailmap    |  2 ++
 MAINTAINERS | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/.mailmap b/.mailmap
index 0fef932de3db..509d258a9e77 100644
--- a/.mailmap
+++ b/.mailmap
@@ -157,6 +157,8 @@ Matt Ranostay <mranostay@gmail.com> Matthew Ranostay <mranostay@embeddedalley.co
 Matt Ranostay <mranostay@gmail.com> <matt.ranostay@intel.com>
 Matt Ranostay <matt.ranostay@konsulko.com> <matt@ranostay.consulting>
 Matt Redfearn <matt.redfearn@mips.com> <matt.redfearn@imgtec.com>
+Maxime Ripard <mripard@kernel.org> <maxime.ripard@bootlin.com>
+Maxime Ripard <mripard@kernel.org> <maxime.ripard@free-electrons.com>
 Mayuresh Janorkar <mayur@ti.com>
 Michael Buesch <m@bues.ch>
 Michel Dänzer <michel@tungstengraphics.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 6743ce648118..0f9e0c458717 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -683,7 +683,7 @@ S:	Maintained
 F:	drivers/crypto/sunxi-ss/
 
 ALLWINNER VPU DRIVER
-M:	Maxime Ripard <maxime.ripard@bootlin.com>
+M:	Maxime Ripard <mripard@kernel.org>
 M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -1408,7 +1408,7 @@ S:	Maintained
 F:	drivers/clk/sunxi/
 
 ARM/Allwinner sunXi SoC support
-M:	Maxime Ripard <maxime.ripard@bootlin.com>
+M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -3573,7 +3573,7 @@ F:	Documentation/filesystems/caching/cachefiles.txt
 F:	fs/cachefiles/
 
 CADENCE MIPI-CSI2 BRIDGES
-M:	Maxime Ripard <maxime.ripard@bootlin.com>
+M:	Maxime Ripard <mripard@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/cdns,*.txt
@@ -5291,7 +5291,7 @@ F:	include/linux/vga*
 
 DRM DRIVERS AND MISC GPU PATCHES
 M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
-M:	Maxime Ripard <maxime.ripard@bootlin.com>
+M:	Maxime Ripard <mripard@kernel.org>
 M:	Sean Paul <sean@poorly.run>
 W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
 S:	Maintained
@@ -5304,7 +5304,7 @@ F:	include/uapi/drm/drm*
 F:	include/linux/vga*
 
 DRM DRIVERS FOR ALLWINNER A10
-M:	Maxime Ripard  <maxime.ripard@bootlin.com>
+M:	Maxime Ripard <mripard@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 F:	drivers/gpu/drm/sun4i/
-- 
2.21.0

