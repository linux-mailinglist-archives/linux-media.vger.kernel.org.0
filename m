Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407F2501E03
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 00:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237254AbiDNWJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 18:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346950AbiDNWJC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 18:09:02 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C18BADD7A
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 15:06:35 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 328351B00124
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 01:06:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1649973993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zW7XHMQo5SkLJi7qzWq4KnfFIYnGfvU+7RW9A5qRF24=;
        b=rmq91rf+mrS+mGTU+5KeAQIF7RPgZQlOIEeU1eII2HzG2vZISsXA+sH5h1GULFnJBomqRb
        yLXF2RUn6yvYCAe1xDSXkdnqtZUYo73UFLHwbKmbarsDFk/gg/TBBz8XQo0LM2HGFpElfw
        65kbHTVSB2cc6YZmK0KUn8b4bz7u2gzc7G+8xobIruVrQby/k5fdlHaa/QZ/g51Ym1XX/i
        vjREBFfwGvb81spbcOxiWyHtqUJs2/BHOgC6hOYDSWNgWvrtOYWqfxayywFgqj9Xj2DGrz
        9BJMQtrZ339JH0JC4AeK9GSqNbN29baUAqvFvwLtvr1EBDvRZ5CPzRzjYTHmYA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D402B634C91
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 01:06:32 +0300 (EEST)
Date:   Fri, 15 Apr 2022 01:06:32 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL V2 FOR 5.19] V4L2 patches
Message-ID: <Ylia6Kq64rz5e+vv@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1649973993; a=rsa-sha256;
        cv=none;
        b=MVCpHVsHBGa+7dgv57obAnEwKst1IIQI1njrfARgjynAuMXb0Wa5hjYaSiFrfD247xC4P7
        vzB514x2OfVmiCz7XV4N4x87OlO0qed/1On2Iyr2rHGR/eoKokpyjoLjDOanwqZ4z4ax6x
        izqWWnBdGAOw0bFQ7mXKMR/0SBNpO0bC67mEh6Kxj6skuq/OfTlVODkN9ou9ZqALe5yhIE
        gD54IpCL3XfH9+aD5h1ixWL4UoI6aeBSl4D8VWWK+7odr0wWeZlt/FO1FZbC2+RrLLh++b
        fZNiNMN4aDqQW8YYndHfwN3N4kX+y2o6llgfFfXVOLMEFdau3bEvxzDEj9Hvfg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1649973993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zW7XHMQo5SkLJi7qzWq4KnfFIYnGfvU+7RW9A5qRF24=;
        b=Y/k96kfcaS7oA6/z2CDPFeNQD74qfxQqXq7AlEuV3SqoQmnTot57kyZM9geBRjRwgejeP0
        Dw3Y/c5AIgQ+QgcXDOLDXS15ySwVvob3IAFKFnJ3j2UVCylKvsi7c5NysfaMMcwQeyRlKC
        qkTmFIv5gj9fLAs+mim3RjwGogot/Ak1V9Wmmb1FRK6k0HtfrHo8ujXngPT2PszHRtZhTh
        5Df5/KaPRdOHfUEUdBBAokTXRU8q+PjrQMCI6TtkzrnfBsWz/5DEScFFbIwaQuZzl8VGcg
        efSMXT8MLfWQK0RPfEuyl0arbxnnG8sBb+mwwYz6WzqGn1blSZEx273d9Alekw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of V4L2 patches for 5.19. The major changes are the addition
of locking of the V4L2 subdev state in the framework, with MC ancillary
links. Also a large number of fixes and improvements to various places are
included.

No new drivers this time.

Since v1:

- Include media ancillary link crash removal fix by Yunke Kao.

- Add more small cleanups and fixes in drivers and MC docs.

- Another IPU3 ImgU parameter handling fix by Kate Hsuan.

- Remove isl7998x fix, this needs to go through the fixes branch.

- Fix V4L2 IOCTL bus_info patch by removing now-redundant local variables.

Please pull.


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.19-1.3-signed

for you to fetch changes up to 16a5ea80a184e6c2a1aeb0c840a8bc7114401009:

  media: video-mux: Use dev_err_probe() (2022-04-14 14:07:08 +0300)

----------------------------------------------------------------
V4L2 patches for 5.19

----------------------------------------------------------------
Daniel Scally (5):
      media: entity: Skip non-data links in graph iteration
      media: media.h: Add new media link type
      media: entity: Add link_type_name() helper
      media: entity: Add support for ancillary links
      media: v4l2-async: Create links during v4l2_async_match_notify()

Hangyu Hua (1):
      media: mc: delete redundant code in __media_device_unregister_entity

Ian Jamison (1):
      media: media-entity.h: Fix documentation for media_create_intf_link

Jacopo Mondi (2):
      media: imx: imx-mipi-csis: Add support for JPEG_1X8
      media: i2c: ov5645: Fix media bus format

Julia Lawall (1):
      media: i2c: ov5695: fix typos in comments

Kate Hsuan (2):
      staging: media: ipu3: Fix AF x_start position when rightmost stripe is used
      staging: media: ipu3: Fix AWB x_start position when rightmost stripe is used

Laurent Pinchart (1):
      media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()

Laurentiu Palcu (1):
      media: i2c: max9286: fix kernel oops when removing module

Masahiro Yamada (1):
      media: media.h: remove unneeded <stdint.h> inclusion

Moses Christopher Bollavarapu (1):
      media: ov7640: Use ARRAY_SIZE instead of manual checking

Philipp Zabel (1):
      media: video-mux: Use dev_err_probe()

Sakari Ailus (9):
      media: ccs: Use %u for printing unsigned values, remove extra debug print
      media: ccs: Use unsigned int as index to an array
      mc: Remove redundant documentation
      mc: media_device_init() initialises a media_device, not media_entity
      mc: Provide a helper for setting bus_info field
      mc: Set bus_info in media_device_init()
      v4l: ioctl: Set bus_info in v4l_querycap()
      staging: media: ipu3-imgu: Request specific firmware binary
      Revert "media: dw9768: activate runtime PM and turn off device"

Tom Rix (1):
      media: i2c: cleanup comments

Tomi Valkeinen (10):
      media: v4l2-subdev: fix #endif comments
      media: v4l2-subdev: drop extra #ifdef
      media: subdev: rename subdev-state alloc & free
      media: subdev: add active state to struct v4l2_subdev
      media: subdev: rename v4l2_subdev_get_pad_* helpers
      media: subdev: pass also the active state to subdevs from ioctls
      media: subdev: add subdev state locking
      media: subdev: add locking wrappers to subdev op wrappers
      media: subdev: add v4l2_subdev_get_fmt() helper function
      media: Documentation: add documentation about subdev state

Umang Jain (2):
      media: staging/intel-ipu3: Reset imgu_video_device sequence
      media: staging/intel-ipu3: Cleanup dummy buffers via helper

Uwe Kleine-König (1):
      media: i2c: dw9714: Return zero in remove callback

Yunke Cao (1):
      media: entity: skip non-data link when removing reverse links

Zheyu Ma (1):
      media: i2c: dw9714: Disable the regulator when the driver fails to probe

 Documentation/driver-api/media/v4l2-subdev.rst     |  69 ++++++
 .../media/mediactl/media-controller-model.rst      |   6 +
 .../userspace-api/media/mediactl/media-types.rst   |  17 +-
 drivers/media/common/saa7146/saa7146_video.c       |   1 -
 drivers/media/i2c/ccs/ccs-core.c                   |  36 ++-
 drivers/media/i2c/dw9714.c                         |   2 +-
 drivers/media/i2c/dw9768.c                         |   6 -
 drivers/media/i2c/max9286.c                        |  19 +-
 drivers/media/i2c/ov5645.c                         |   6 +-
 drivers/media/i2c/ov5695.c                         |   2 +-
 drivers/media/i2c/ov7640.c                         |  33 +--
 drivers/media/mc/mc-device.c                       |  21 +-
 drivers/media/mc/mc-entity.c                       |  80 +++++--
 drivers/media/pci/bt8xx/bttv-driver.c              |   2 -
 drivers/media/pci/cx18/cx18-ioctl.c                |   2 -
 drivers/media/pci/cx88/cx88-blackbird.c            |   1 -
 drivers/media/pci/cx88/cx88-video.c                |   1 -
 drivers/media/pci/dt3155/dt3155.c                  |   3 -
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   6 -
 drivers/media/pci/ivtv/ivtv-ioctl.c                |   1 -
 drivers/media/pci/meye/meye.c                      |   1 -
 drivers/media/pci/saa7134/saa7134-video.c          |   1 -
 drivers/media/pci/saa7164/saa7164-encoder.c        |   1 -
 drivers/media/pci/saa7164/saa7164-vbi.c            |   1 -
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |   3 -
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |   4 -
 drivers/media/pci/sta2x11/sta2x11_vip.c            |   4 -
 drivers/media/pci/tw5864/tw5864-video.c            |   1 -
 drivers/media/pci/tw68/tw68-video.c                |   3 -
 drivers/media/pci/tw686x/tw686x-video.c            |   2 -
 drivers/media/platform/allegro-dvt/allegro-core.c  |   5 -
 drivers/media/platform/marvell/cafe-driver.c       |   1 -
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |   2 -
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   4 -
 drivers/media/platform/nxp/imx-mipi-csis.c         |  28 +++
 drivers/media/platform/qcom/camss/camss-video.c    |   4 -
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   2 -
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  13 +-
 drivers/media/platform/renesas/rcar_jpu.c          |   2 -
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     |   2 -
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  10 +-
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   2 -
 drivers/media/platform/renesas/vsp1/vsp1_video.c   |   2 -
 .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |   5 -
 drivers/media/platform/samsung/exynos4-is/common.c |   2 -
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |   4 -
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |   2 -
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   |   2 -
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   |   2 -
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   2 -
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |   2 -
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |   4 -
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |   2 -
 drivers/media/platform/ti/cal/cal-video.c          |   4 -
 drivers/media/platform/ti/cal/cal.c                |   2 -
 drivers/media/platform/ti/davinci/vpbe_display.c   |   2 -
 drivers/media/platform/ti/davinci/vpif_capture.c   |   2 -
 drivers/media/platform/ti/davinci/vpif_display.c   |   2 -
 drivers/media/platform/video-mux.c                 |   4 +-
 drivers/media/radio/radio-maxiradio.c              |   2 -
 drivers/media/v4l2-core/v4l2-async.c               |  33 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 drivers/media/v4l2-core/v4l2-subdev.c              | 214 +++++++++++++++---
 drivers/staging/media/ipu3/ipu3-css-fw.c           |   4 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |   4 +-
 drivers/staging/media/ipu3/ipu3-css-params.c       |  20 ++
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   1 +
 drivers/staging/media/ipu3/ipu3.c                  |  25 +--
 drivers/staging/media/tegra-video/vi.c             |  10 +-
 include/media/i2c/mt9t112.h                        |   2 +-
 include/media/i2c/wm8775.h                         |   2 +-
 include/media/media-device.h                       |  52 ++++-
 include/media/media-entity.h                       |  21 +-
 include/media/v4l2-subdev.h                        | 243 +++++++++++++++++++--
 include/uapi/linux/media.h                         |   4 +-
 75 files changed, 806 insertions(+), 290 deletions(-)

-- 
Sakari Ailus
