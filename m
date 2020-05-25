Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270211E0897
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 10:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgEYIR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 04:17:26 -0400
Received: from retiisi.org.uk ([95.216.213.190]:39510 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727894AbgEYIRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 04:17:25 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C7C46634C87
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 11:16:42 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jd8Hq-0002HL-U1
        for linux-media@vger.kernel.org; Mon, 25 May 2020 11:16:42 +0300
Date:   Mon, 25 May 2020 11:16:42 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.8] More camera sensor, documentation patches
Message-ID: <20200525081642.GA8214@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of camera sensor patches and a lone documentation patch for
5.8. In particular, there's a driver for ov2740 and DT support for ov8856.
It'd be nice to get this in to 5.8 if it's still possible.

Please pull.


The following changes since commit 960b2dee908b0fc51cf670841de13b40b44aaaae:

  media: dt-bindings: phy: phy-rockchip-dphy-rx0: move rockchip dphy rx0 bindings out of staging (2020-05-20 15:22:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.8-4-signed

for you to fetch changes up to 82e90cbd2316adb6c53b4d695dc3f8d66c5214e2:

  Documentation: media: Refer to mbus format documentation from CSI-2 docs (2020-05-25 11:12:41 +0300)

----------------------------------------------------------------
Camera sensor patches for 5.8

----------------------------------------------------------------
Bingbu Cao (1):
      media: i2c: Add ov2740 image sensor driver

Dongchun Zhu (1):
      media: dt-bindings: ov8856: Document YAML bindings

Geert Uytterhoeven (1):
      media: i2c: imx219: Drop <linux/clk-provider.h> and <linux/clkdev.h>

Gustavo A. R. Silva (1):
      media: s5k5baf: Replace zero-length array with flexible-array

Robert Foss (2):
      media: ov8856: Add devicetree support
      media: ov8856: Implement sensor module revision identification

Sakari Ailus (1):
      Documentation: media: Refer to mbus format documentation from CSI-2 docs

 .../devicetree/bindings/media/i2c/ov8856.yaml      |  142 +++
 Documentation/driver-api/media/csi2.rst            |    6 +
 MAINTAINERS                                        |   12 +-
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx219.c                         |    2 -
 drivers/media/i2c/ov2740.c                         | 1016 ++++++++++++++++++++
 drivers/media/i2c/ov8856.c                         |  191 +++-
 drivers/media/i2c/s5k5baf.c                        |    2 +-
 9 files changed, 1367 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 create mode 100644 drivers/media/i2c/ov2740.c

-- 
Sakari Ailus
