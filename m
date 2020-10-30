Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA412A0607
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 13:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgJ3M5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 08:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3M5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 08:57:44 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE90FC0613CF
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 05:57:43 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B7602634C87
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 14:56:57 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kYTxi-00024s-Tt
        for linux-media@vger.kernel.org; Fri, 30 Oct 2020 14:56:58 +0200
Date:   Fri, 30 Oct 2020 14:56:58 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] V4L2 cleanups and fixes mostly
Message-ID: <20201030125658.GD6899@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a big bunch of mostly camera sensor related patches for v5.11.

It's mostly fixes and cleanups (getting subdev pointer with less hassle, 22
of the patches). There are also fwnode fixes (bus-type parsing), improved
documentation and ipu3-cio2 fixes. Also there's a new 160x120 mode for
ov5640, and quite a few bindings are converted to YAML.

Please pull.


The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:

  Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-1-signed

for you to fetch changes up to a3cb874e0eff5bd469c2ec0bd51d19b26ac59a71:

  imx258: Remove Jason Chen's e-mail (2020-10-30 12:22:38 +0200)

----------------------------------------------------------------
V4L2 patches for 5.11

----------------------------------------------------------------
Alain Volmat (1):
      media: stm32-dcmi: add 8-bit Bayer formats support

Bingbu Cao (1):
      media: ov2740: change the minimal exposure value to 4

Etienne Carriere (1):
      media: stm32-dcmi: don't print an error on probe deferral

Eugen Hristev (2):
      media: imx274: remove binning enum
      media: imx274: add support for sensor mode6, 1280x540

Hugues Fruchet (3):
      media: ov5640: add support of 160x120 resolution
      media: stm32-dcmi: remove deprecated dmaengine_terminate_all()
      media: ov5640: fix support of BT656 bus mode

Jacopo Mondi (5):
      dt-bindings: media: mt9v111: Convert to json-schema
      dt-bindings: media: imx214: Convert to json-schema
      dt-bindings: media: ov772x: Convert to json-schema
      dt-bindings: media: ov772x: Make bus-type mandatory
      dt-bindings: media: ov772x: Document endpoint props

Kieran Bingham (1):
      media: v4l2-async: Fix trivial documentation typo

Krzysztof Kozlowski (24):
      media: i2c: imx219: simplify getting state container
      media: i2c: imx290: simplify getting state container
      media: i2c: imx319: simplify getting state container
      media: i2c: imx319: silence unused acpi_device_id warning
      media: i2c: imx355: simplify getting state container
      media: i2c: imx355: silence unused acpi_device_id warning
      media: i2c: ad5820: simplify getting state container
      media: i2c: adp1653: simplify getting state container
      media: i2c: adv7180: simplify getting state container
      media: i2c: ak7375: simplify getting state container
      media: i2c: dw9768: simplify getting state container
      media: i2c: et8ek8: simplify getting state container
      media: i2c: hi556: simplify getting state container
      media: i2c: ov13858: simplify getting state container
      media: i2c: ov2680: simplify getting state container
      media: i2c: ov2685: simplify getting state container
      media: i2c: ov2740: simplify getting state container
      media: i2c: ov5670: simplify getting state container
      media: i2c: ov5675: simplify getting state container
      media: i2c: ov5695: simplify getting state container
      media: i2c: ov7740: simplify getting state container
      media: i2c: ov8856: simplify getting state container
      media: i2c: smiapp: simplify getting state container
      media: i2c: tvp5150: simplify getting state container

Lad Prabhakar (4):
      media: v4l2-fwnode: Return -EINVAL for invalid bus-type
      media: i2c: ov772x: Parse endpoint properties
      media: i2c: ov772x: Add support for BT.656 mode
      media: i2c: ov772x: Add test pattern control

Niklas Söderlund (5):
      dt-bindings: adv7604: Fix documentation for hpd-gpios
      dt-bindings: adv7604: Convert bindings to json-schema
      MAINTAINERS: Add ADV7604 bindings documentation
      rcar-csi2: Switch to using fwnode instead of OF
      rcar-csi2: Set bus type when parsing fwnode

Philipp Zabel (1):
      media: dt-bindings: convert CODA VPU bindings to yaml

Sakari Ailus (20):
      adv748x: Zero entire struct v4l2_fwnode_endpoint
      v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must init vep argument
      v4l2-fwnode: Don't zero parts of struct v4l2_fwnode_endpoint anymore
      v4l2-fwnode: Rework v4l2_fwnode_endpoint_parse documentation
      v4l2-fwnode: Say it's fine to use v4l2_fwnode_endpoint_parse
      v4l: subdev: Improve link format validation debug messages
      ipu3-cio2: Return actual subdev format
      ipu3-cio2: Serialise access to pad format
      ipu3-cio2: Validate mbus format in setting subdev format
      ipu3-cio2: Make the field on subdev format V4L2_FIELD_NONE
      ipu3-cio2: Use unsigned values where appropriate
      ipu3-cio2: Remove explicit type from frame size checks
      ipu3-cio2: Rename CIO2_IMAGE_MAX_LENGTH as CIO2_IMAGE_MAX_HEIGHT
      ipu3-cio2: Remove traces of returned buffers
      ipu3-cio2: Check receved the size against payload size, not buffer size
      Documentation: v4l: Fix language
      Documentation: v4l: Document required controls on camera sensors
      v4l: Add a helper for obtaining the link frequency
      ipu3-cio2: Use v4l2_get_link_freq helper
      imx258: Remove Jason Chen's e-mail

Sergey Senozhatsky (1):
      media: ov2740: select regmap

Sowjanya Komatineni (3):
      media: i2c: imx274: Fix Y_OUT_SIZE register setting
      media: i2c: imx274: Remove stop stream i2c writes during remove
      media: i2c: imx274: Add IMX274 power on and off sequence

Tom Rix (1):
      media: ov7670: do not aggregate returns

 Documentation/devicetree/bindings/media/coda.txt   |  31 ---
 Documentation/devicetree/bindings/media/coda.yaml  | 108 ++++++++
 .../devicetree/bindings/media/i2c/adv7604.txt      |  88 -------
 .../devicetree/bindings/media/i2c/adv7604.yaml     | 178 +++++++++++++
 .../bindings/media/i2c/aptina,mt9v111.txt          |  46 ----
 .../bindings/media/i2c/aptina,mt9v111.yaml         |  75 ++++++
 .../devicetree/bindings/media/i2c/ov772x.txt       |  40 ---
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml | 134 ++++++++++
 .../devicetree/bindings/media/i2c/sony,imx214.txt  |  53 ----
 .../devicetree/bindings/media/i2c/sony,imx214.yaml | 133 ++++++++++
 Documentation/driver-api/media/camera-sensor.rst   |  13 +
 Documentation/driver-api/media/csi2.rst            |   7 +-
 MAINTAINERS                                        |   9 +-
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/ad5820.c                         |   6 +-
 drivers/media/i2c/adp1653.c                        |   6 +-
 drivers/media/i2c/adv7180.c                        |   6 +-
 drivers/media/i2c/adv748x/adv748x-core.c           |   3 +-
 drivers/media/i2c/ak7375.c                         |   7 +-
 drivers/media/i2c/dw9768.c                         |   6 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |   8 +-
 drivers/media/i2c/hi556.c                          |   6 +-
 drivers/media/i2c/imx219.c                         |  16 +-
 drivers/media/i2c/imx258.c                         |   2 +-
 drivers/media/i2c/imx274.c                         | 280 +++++++++++++++------
 drivers/media/i2c/imx290.c                         |  10 +-
 drivers/media/i2c/imx319.c                         |   8 +-
 drivers/media/i2c/imx355.c                         |   8 +-
 drivers/media/i2c/ov13858.c                        |   6 +-
 drivers/media/i2c/ov2680.c                         |   6 +-
 drivers/media/i2c/ov2685.c                         |   6 +-
 drivers/media/i2c/ov2740.c                         |   8 +-
 drivers/media/i2c/ov5640.c                         | 108 +++++---
 drivers/media/i2c/ov5670.c                         |   6 +-
 drivers/media/i2c/ov5675.c                         |   6 +-
 drivers/media/i2c/ov5695.c                         |   6 +-
 drivers/media/i2c/ov7670.c                         |  96 ++++---
 drivers/media/i2c/ov772x.c                         |  71 +++++-
 drivers/media/i2c/ov7740.c                         |   6 +-
 drivers/media/i2c/ov8856.c                         |   6 +-
 drivers/media/i2c/smiapp/smiapp-core.c             |  28 +--
 drivers/media/i2c/tvp5150.c                        |   6 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           | 111 ++++----
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           | 157 ++++++------
 drivers/media/platform/rcar-vin/rcar-csi2.c        |  18 +-
 drivers/media/platform/stm32/stm32-dcmi.c          |  26 +-
 drivers/media/v4l2-core/v4l2-common.c              |  33 +++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  18 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  48 +++-
 include/media/v4l2-async.h                         |   2 +-
 include/media/v4l2-common.h                        |  21 ++
 include/media/v4l2-fwnode.h                        |  74 ++++--
 include/media/v4l2-mediabus.h                      |   2 +
 53 files changed, 1435 insertions(+), 728 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/coda.txt
 create mode 100644 Documentation/devicetree/bindings/media/coda.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov772x.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml

-- 
Kind regards,

Sakari Ailus
