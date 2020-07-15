Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A6B2217B6
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 00:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgGOWVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 18:21:48 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53670 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726356AbgGOWVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 18:21:48 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 214B5634C87;
        Thu, 16 Jul 2020 01:20:30 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jvplO-00039R-5t; Thu, 16 Jul 2020 01:20:30 +0300
Date:   Thu, 16 Jul 2020 01:20:30 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [GIT PULL for 5.9] Camera sensor + V4L2 async patches
Message-ID: <20200715222030.GG836@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a stash of patches for 5.9. I wish there's still time to get them
in.

There are drivers for GMSL deserialiser and serialiser, and improvements in
V4L2 async matching (endpoint support in particular). I also concluded with
Rafael (cc'd) that it's fine to merge the device property patch through the
media tree.

The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.9-2-signed

for you to fetch changes up to fe23e113501488767faeed25127cc5e3168837e5:

  media: v4l2-async: Log message in case of heterogeneous fwnode match (2020-07-15 23:56:03 +0300)

----------------------------------------------------------------
Camera patches for 5.9

----------------------------------------------------------------
Andrey Konovalov (1):
      media: i2c: imx290: replace msleep(10) with usleep_range(10000, 11000)

Dongchun Zhu (2):
      media: dt-bindings: media: i2c: Document DW9768 bindings
      media: i2c: dw9768: Add DW9768 VCM driver

Jacopo Mondi (2):
      dt-bindings: media: i2c: Add bindings for IMI RDACM2x
      media: i2c: Add RDACM20 driver

Kieran Bingham (1):
      media: i2c: Add MAX9286 driver

Laurent Pinchart (5):
      dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
      device property: Add a function to test is a fwnode is a graph endpoint
      media: v4l2-async: Accept endpoints and devices for fwnode matching
      media: v4l2-async: Pass notifier pointer to match functions
      media: v4l2-async: Log message in case of heterogeneous fwnode match

 .../bindings/media/i2c/dongwoon,dw9768.yaml        |  100 ++
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       |  159 +++
 .../bindings/media/i2c/maxim,max9286.yaml          |  366 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   30 +
 drivers/media/i2c/Kconfig                          |   38 +
 drivers/media/i2c/Makefile                         |    4 +
 drivers/media/i2c/dw9768.c                         |  554 ++++++++
 drivers/media/i2c/imx290.c                         |    6 +-
 drivers/media/i2c/max9271.c                        |  341 +++++
 drivers/media/i2c/max9271.h                        |  224 ++++
 drivers/media/i2c/max9286.c                        | 1320 ++++++++++++++++++++
 drivers/media/i2c/rdacm20.c                        |  667 ++++++++++
 drivers/media/v4l2-core/v4l2-async.c               |   83 +-
 include/linux/property.h                           |    5 +
 15 files changed, 3888 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
 create mode 100644 drivers/media/i2c/dw9768.c
 create mode 100644 drivers/media/i2c/max9271.c
 create mode 100644 drivers/media/i2c/max9271.h
 create mode 100644 drivers/media/i2c/max9286.c
 create mode 100644 drivers/media/i2c/rdacm20.c

-- 
Kind regards,

Sakari Ailus
