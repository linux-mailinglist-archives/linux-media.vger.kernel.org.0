Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B89314426C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 17:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgAUQsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 11:48:32 -0500
Received: from retiisi.org.uk ([95.216.213.190]:37374 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726555AbgAUQsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 11:48:32 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D5368634C87
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 18:48:16 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1itwhM-0000y9-Sx
        for linux-media@vger.kernel.org; Tue, 21 Jan 2020 18:48:16 +0200
Date:   Tue, 21 Jan 2020 18:48:16 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.6] Sensor, V4L2 fwnode and ImgU driver patches
Message-ID: <20200121164816.GW856@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set that contains a driver for imx290 as well as fixes and
improvements for other sensors and ImgU.

This replaces my earlier pull request which I marked as superseded.

Please pull.


The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:

  media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.6-3.1-signed

for you to fetch changes up to de44ad35385894b1a2af5be57f48eadcae09e62c:

  media: staging/intel-ipu3: remove TODO item about acronyms (2020-01-21 18:06:12 +0200)

----------------------------------------------------------------
Sensor, fwnode and ImgU patches for 5.6

----------------------------------------------------------------
Andrey Konovalov (1):
      dt-bindings: media: i2c: Add IMX219 CMOS sensor binding

Bingbu Cao (3):
      Revert "media: staging/intel-ipu3: make imgu use fixed running mode"
      media: ipu3.rst: add imgu pipe config tool link
      media: staging/intel-ipu3: remove TODO item about acronyms

Dave Stevenson (1):
      media: i2c: Add driver for Sony IMX219 sensor

Julia Lawall (1):
      media: mt9v111: constify copied structure

Sakari Ailus (1):
      v4l2-fwnode: Print the node name while parsing endpoints

Shawn Tu (1):
      ov5675: add vflip/hflip control support

 .../devicetree/bindings/media/i2c/imx219.yaml      |  114 ++
 Documentation/media/v4l-drivers/ipu3.rst           |   17 +-
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx219.c                         | 1312 ++++++++++++++++++++
 drivers/media/i2c/mt9v111.c                        |    2 +-
 drivers/media/i2c/ov5675.c                         |   82 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |    6 +-
 drivers/staging/media/ipu3/TODO                    |    5 -
 drivers/staging/media/ipu3/include/intel-ipu3.h    |    4 +
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   74 +-
 drivers/staging/media/ipu3/ipu3.h                  |    5 +-
 13 files changed, 1607 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 drivers/media/i2c/imx219.c

-- 
Sakari Ailus
