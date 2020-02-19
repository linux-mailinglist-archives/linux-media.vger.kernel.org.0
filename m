Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38B69164210
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 11:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgBSK1k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 05:27:40 -0500
Received: from retiisi.org.uk ([95.216.213.190]:33910 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726453AbgBSK1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 05:27:40 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 8DA92634C87
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 12:26:56 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j4MZF-0001Wg-4q
        for linux-media@vger.kernel.org; Wed, 19 Feb 2020 12:26:57 +0200
Date:   Wed, 19 Feb 2020 12:26:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.7] Sensor driver patches
Message-ID: <20200219102657.GC5023@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of mostly sensor driver patches for 5.7. Most notably, the
pull request includes a driver for IMX219 sensors.

Please pull.


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.7-1-signed

for you to fetch changes up to 5f3770911e25ca97436af5bbff15de9c380252a0:

  MAINTAINERS: Sort entries in database for TI VPE/CAL (2020-02-18 15:33:07 +0200)

----------------------------------------------------------------
Sensor driver patches for 5.7

----------------------------------------------------------------
Andrey Konovalov (1):
      dt-bindings: media: i2c: Add IMX219 CMOS sensor binding

Andy Shevchenko (1):
      MAINTAINERS: Sort entries in database for TI VPE/CAL

Bingbu Cao (1):
      media: ipu3.rst: add imgu pipe config tool link

Dave Stevenson (1):
      media: i2c: Add driver for Sony IMX219 sensor

Jean-Baptiste Jouband (1):
      staging: media: ipu3: Change 'unsigned long int' to 'unsigned long'

Shawn Tu (1):
      ov5675: add vflip/hflip control support

 .../devicetree/bindings/media/i2c/imx219.yaml      |  114 ++
 Documentation/media/v4l-drivers/ipu3.rst           |   11 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx219.c                         | 1312 ++++++++++++++++++++
 drivers/media/i2c/ov5675.c                         |   82 +-
 drivers/staging/media/ipu3/TODO                    |    2 -
 drivers/staging/media/ipu3/ipu3-mmu.c              |    4 +-
 9 files changed, 1531 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
 create mode 100644 drivers/media/i2c/imx219.c

-- 
Sakari Ailus
