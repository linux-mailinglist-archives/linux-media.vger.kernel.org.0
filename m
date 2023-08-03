Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033B076F452
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 22:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjHCUyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 16:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbjHCUyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 16:54:08 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559214680
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 13:54:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RH1Kd3BMBz49QCh
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:53:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1691096037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=G8grh/xJwcfLWqYqapZ+YbhYOQBZSbP2ZBE79qkP9DA=;
        b=C2LB/uP5njTWooDF025HAFk+kpovNZfF0qBNR9za7g3pRK3f7PO6ayTXJ2Al4GwaNUQfCw
        ObfWijW3WyTvqODYd6I5jd5mmYvOpmX2/jtwMzTqST7RlITlfA9luDLVHfQGvii3+VRE18
        tSSSINB+SQNjEuQSs44TDD5DVPJ3YTWxRcqxXXKzaVt6igwR95SmHWjjb4DgtihQeNWbnU
        VGxk1WrH4gMK+SjZHD8eXb5PEiX+9nE3pfa9QhEy18WqjddAVZvyQyWBZ0IPNHmycIJDgJ
        zuaVzGBtCDf52LsBJRftXRP0Er5FHgdrbEnS8CXxoSZs6mA5lrNTkuZExHhW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1691096037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=G8grh/xJwcfLWqYqapZ+YbhYOQBZSbP2ZBE79qkP9DA=;
        b=r+7wbzAkfMuL5ms14Im61Fhw7Mo7WCuYaefF1kAozS+ZaPsHbuxcNs2hZkJrTXiw45f1HC
        T6p/CjhQkOyR39cXejfHhYn03VAQCxfr2JcZ1r6zyxdD6TfAcEg9Ou7AfF3ZlQzhbG5z+w
        qblCsCgkG/FnPeAoKbuRM0iLyhxcC74gN1IIPSFhka4n2mA0rWc9mDGIGlwXs3HeoLXDhc
        w0prNdoAFAR0BzjsnRz1FR8ZmwDuhuIFasD0PIPBlcjvb46XUoYLKlGJeE/fXsYpMEzTNE
        Qr6J+X7A8gg6scf5AogTaPIZrbqMEaE4fhgJb0DJ8bfBDatXjabqiXTosjiY0w==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1691096037; a=rsa-sha256;
        cv=none;
        b=uVa9lrCOZoAInQ7JlYFqPPHXraWxaOIDTojR35UvUrg4yCH6QKYcXMGtGjhIsdojbL/TIO
        UHiC6itnUCe9Pm4rnbz2BSgdV9ySWjUB9aMYOdAXx1Ssjar9/1eqiEPF1JvQMxxgprIAOB
        oahunrhuuyrLZFk/3f/17KAAFvpB6CRdnFOfKBvHG5JZOfvjdVSLqPvs004okNeAfzpHqd
        KMEXD9DW0xNBdqlXO5hEOAECsm8GuMhaRIpeDs7zlIga278BlWtfCxbPURFIKTnwALvDzU
        Y4G3b3+V1dmE9awwe7E6uo75c85j10TDi5nPyY44+/JkA7EP6YKq82p4W7dTjg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B0391634C23
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:53:55 +0300 (EEST)
Date:   Thu, 3 Aug 2023 20:53:55 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.6] V4L2 patches for 6.6
Message-ID: <ZMwT47FMjDGIBgNe@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set contains a large number of patches, many from Hans de Goede.

In particular, we have:

- V4L2 CCI helpers, very nice for camera sensor drivers
- Intel VSC support
- IPU bridge fixes and IPU6 support for IPU bridge
- DW9719 VCM driver (MS Surface Go 2 (maybe others, too))
- Switch atomisp to use ipu-bridge
- ov2680 driver updates
- imx219 driver improvements
- V4L2 routing documentation fix
- Streams workaround removal
- Lots of fixes to a number of drivers and some to V4L2 framework, too
- Remove atomisp version of ov2680
- MAINTAINERS changes (preparation for process change)

Please pull.


The following changes since commit a0e657a03ffbd26332f316f13c3e5dbc98cb1fca:

  media: mediatek: vcodec: Fix possible invalid memory access for encoder (2023-08-03 08:45:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.6-2.2-signed

for you to fetch changes up to 10dd3e5d4ff6c841431e785c5c2fc39360bc7bc5:

  media: i2c: ccs: Check rules is non-NULL (2023-08-03 18:23:32 +0300)

----------------------------------------------------------------
V4L2 patches for 6.6

----------------------------------------------------------------
Daniel Scally (1):
      media: i2c: Add driver for DW9719 VCM

Hans de Goede (52):
      media: Add MIPI CCI register access helper functions
      media: ov5693: Convert to new CCI register access helpers
      media: imx290: Convert to new CCI register access helpers
      media: atomisp: ov2680: Convert to new CCI register access helpers
      media: Remove ov_16bit_addr_reg_helpers.h
      media: ipu-bridge: Fix null pointer deref on SSDB/PLD parsing warnings
      media: ipu-bridge: Do not use on stack memory for software_node.name field
      media: ipu-bridge: Move initialization of node_names.vcm to ipu_bridge_init_swnode_names()
      media: ipu-bridge: Make ipu_bridge_init() take a regular struct device as argument
      media: ipu-bridge: Store dev pointer in struct ipu_bridge
      media: ipu-bridge: Only keep PLD around while parsing
      media: ipu-bridge: Add a ipu_bridge_parse_ssdb() helper function
      media: ipu-bridge: Drop early setting of sensor->adev
      media: ipu-bridge: Add a parse_sensor_fwnode callback to ipu_bridge_init()
      media: ipu-bridge: Move ipu-bridge.h to include/media/
      media: ipu-bridge: Add GalaxyCore GC0310 to ipu_supported_sensors[]
      media: ipu-bridge: Add a runtime-pm device-link between VCM and sensor
      media: atomisp: csi2-bridge: Switch to new common ipu_bridge_init()
      media: atomisp: csi2-bridge: Add dev_name() to acpi_handle_info() logging
      media: atomisp: csi2-bridge: Add support for VCM I2C-client instantiation
      media: ov2680: Remove auto-gain and auto-exposure controls
      media: ov2680: Fix ov2680_bayer_order()
      media: ov2680: Fix vflip / hflip set functions
      media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
      media: ov2680: Don't take the lock for try_fmt calls
      media: ov2680: Add ov2680_fill_format() helper function
      media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY not working
      media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
      media: ov2680: Convert to new CCI register access helpers
      media: ov2680: Store dev instead of i2c_client in ov2680_dev
      media: ov2680: Add runtime-pm support
      media: ov2680: Check for "powerdown" GPIO con-id before checking for "reset" GPIO con-id
      media: ov2680: Drop is_enabled flag
      media: ov2680: Add support for more clk setups
      media: ov2680: Add support for 19.2 MHz clock
      media: ov2680: Wait for endpoint fwnode before continuing with probe()
      media: ov2680: Add support for ACPI enumeration
      media: ov2680: Fix ov2680_enum_frame_interval()
      media: ov2680: Annotate the per mode register setting lists
      media: ov2680: Add ov2680_mode struct
      media: ov2680: Make setting the mode algorithm based
      media: ov2680: Add an __ov2680_get_pad_format() helper function
      media: ov2680: Implement selection support
      media: ov2680: Fix exposure and gain ctrls range and default value
      media: ov2680: Add a bunch of register tweaks
      media: ov2680: Drop unnecessary pad checks
      media: ov2680: Read and log sensor revision during probe
      media: ov2680: Add link-freq and pixel-rate controls
      media: ov2680: Add bus-cfg / endpoint property verification
      MAINTAINERS: Add Hans de Goede as OV2680 sensor driver maintainer
      media: ipu-bridge: Add link-frequency to OV2680 ipu_supported_sensors[] entry
      media: atomisp: Drop atomisp-ov2680 sensor driver

Jacopo Mondi (5):
      media: i2c: imx219: Complete default format initialization
      media: i2c: imx219: Fix colorspace info
      media: i2c: imx219: Use subdev active state
      media: i2c: imx219: Simplify format assignment
      media: i2c: imx219: Simplify code handling in s_fmt

Jean-Michel Hautbois (2):
      media: i2c: imx219: Rename mbus codes array
      media: i2c: imx219: Switch from open to init_cfg

Lukas Bulwahn (1):
      MAINTAINERS: correct file entry in MEDIA DRIVERS FOR FREESCALE IMX7/8

Marek Vasut (2):
      media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
      media: ov5640: Fix initial RESETB state and annotate timings

Niklas Söderlund (1):
      media: rcar-csi2: Add support for C-PHY on R-Car V4H

Ruan Jinjie (3):
      media: camif-core: Do not check for 0 return after calling platform_get_irq()
      media: verisilicon: Do not check for 0 return after calling platform_get_irq()
      media: platform: ti: fix the return value handle for platform_get_irq()

Sakari Ailus (6):
      media: i2c: Add a camera sensor top level menu
      media: i2c: Remove common dependencies from sensor drivers
      media: MAINTAINERS: Add entry for V4L2 async and fwnode frameworks
      media: MAINTAINERS: Split sensors and lens drivers, add documentation
      media: v4l: async: Avoid a goto in loop implementation
      media: i2c: ccs: Check rules is non-NULL

Tomi Valkeinen (7):
      media: subdev: Drop implicit zeroing of stream field
      media: subdev: Constify v4l2_subdev_set_routing_with_fmt() param
      media: subdev: Add debug prints to enable/disable_streams
      media: Documentation: Fix [GS]_ROUTING documentation
      media: i2c: ds90ub913: Fix use of uninitialized variables
      media: i2c: ds90ub953: Fix use of uninitialized variables
      media: i2c: ds90ub960: Fix PLL config for 1200 MHz CSI rate

Wentong Wu (3):
      media: pci: intel: ivsc: Add CSI submodule
      media: pci: intel: ivsc: Add ACE submodule
      media: pci: intel: Add IVSC support for IPU bridge driver

Yang Yingliang (1):
      media: davinci: vpif_capture: fix error return code in vpif_probe()

 Documentation/driver-api/media/v4l2-cci.rst        |    5 +
 Documentation/driver-api/media/v4l2-core.rst       |    1 +
 .../media/v4l/vidioc-subdev-g-routing.rst          |    7 +-
 MAINTAINERS                                        |   35 +-
 drivers/media/i2c/Kconfig                          |  251 +---
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ccs/Kconfig                      |    5 +-
 drivers/media/i2c/ccs/ccs-data.c                   |  101 +-
 drivers/media/i2c/ds90ub913.c                      |    2 +-
 drivers/media/i2c/ds90ub953.c                      |    6 +-
 drivers/media/i2c/ds90ub960.c                      |    1 +
 drivers/media/i2c/dw9719.c                         |  350 ++++++
 drivers/media/i2c/et8ek8/Kconfig                   |    4 -
 drivers/media/i2c/imx219.c                         |  292 ++---
 drivers/media/i2c/imx290.c                         |  360 +++---
 drivers/media/i2c/ov2680.c                         | 1286 +++++++++++---------
 drivers/media/i2c/ov5640.c                         |   15 +-
 drivers/media/i2c/ov5693.c                         |  587 ++++-----
 drivers/media/pci/intel/Kconfig                    |    1 +
 drivers/media/pci/intel/Makefile                   |    1 +
 drivers/media/pci/intel/ipu-bridge.c               |  544 +++++++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |   10 +-
 drivers/media/pci/intel/ivsc/Kconfig               |   12 +
 drivers/media/pci/intel/ivsc/Makefile              |    9 +
 drivers/media/pci/intel/ivsc/mei_ace.c             |  579 +++++++++
 drivers/media/pci/intel/ivsc/mei_csi.c             |  825 +++++++++++++
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |  291 +++++
 .../media/platform/samsung/s3c-camif/camif-core.c  |    4 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |    4 +-
 drivers/media/platform/ti/davinci/vpif_capture.c   |    1 +
 drivers/media/platform/ti/omap3isp/isp.c           |    4 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |    4 +-
 drivers/media/v4l2-core/Kconfig                    |    9 +
 drivers/media/v4l2-core/Makefile                   |    1 +
 drivers/media/v4l2-core/v4l2-async.c               |   24 +-
 drivers/media/v4l2-core/v4l2-cci.c                 |  166 +++
 drivers/media/v4l2-core/v4l2-subdev.c              |   31 +-
 drivers/staging/media/atomisp/Kconfig              |    3 +
 drivers/staging/media/atomisp/i2c/Kconfig          |   12 -
 drivers/staging/media/atomisp/i2c/Makefile         |    1 -
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |  849 -------------
 drivers/staging/media/atomisp/i2c/ov2680.h         |  249 ----
 drivers/staging/media/atomisp/pci/atomisp_csi2.h   |   67 -
 .../media/atomisp/pci/atomisp_csi2_bridge.c        |  406 ++----
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |    1 +
 .../media/pci/intel => include/media}/ipu-bridge.h |   46 +-
 include/media/ov_16bit_addr_reg_helpers.h          |   92 --
 include/media/v4l2-cci.h                           |  125 ++
 include/media/v4l2-subdev.h                        |    2 +-
 49 files changed, 4320 insertions(+), 3362 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
 create mode 100644 drivers/media/i2c/dw9719.c
 create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
 create mode 100644 drivers/media/pci/intel/ivsc/Makefile
 create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
 create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
 create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov2680.h
 rename {drivers/media/pci/intel => include/media}/ipu-bridge.h (69%)
 delete mode 100644 include/media/ov_16bit_addr_reg_helpers.h
 create mode 100644 include/media/v4l2-cci.h

-- 
Sakari Ailus
