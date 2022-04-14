Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D766500616
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 08:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238462AbiDNG1y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 02:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiDNG1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 02:27:53 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C4A4D26A
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 23:25:28 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 5F5E51B002EF
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 09:25:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1649917526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=tmeGI/2AtaoeF3/z5ePdsPJr/OC7uDlr3DkNO1ahPas=;
        b=IY122fl1sTTDspDbPXuppsOEPeBXKnjGzj9kV6TDpgLiODBd9tDaJxT5NgSXRsseWF0UaN
        0D0sVWtubNZTy92WhtjWGTzHpWpDUCBB5XAOwnKh3HEx/yHRudeq5Wko2AG9iRiKphFdU2
        C7sJZ2dgUF9SF6PZ3Ggpq3Dn5wtOZIfXC6oJLxQOGwkA+P8x/GXlobVIXXj0K2FOQ4hv/5
        IM9jQNYBmTVSBq+OqycqWB68RvXDHBp4HIyG7vQRzRRYWcpFCpj0BmKtNx5w8VUGguN+MM
        jqrLvc3bGhkYoT9pxEHp0quHrhG9TjOCQbPaJnmZROzDT6lBkUXRhq4aPOgIXA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C638E634C93
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 09:25:25 +0300 (EEST)
Date:   Thu, 14 Apr 2022 09:25:25 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.19] V4L2 patches
Message-ID: <Yle+VQoHTl2iTQbf@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1649917526; a=rsa-sha256;
        cv=none;
        b=M6lhPW7NPUY+N0xlQuiCZhzE6Y5P1MMJZ2z8wO5lXv4YcrdZ8it/xIJBtGDACrKBAxWeVL
        +YlKqXEBe6r6b82aKDgUof7nOvu+Et3x4kfA3arZPKrtlxd2Q/cqCs52Ts2VkgekRp9Zr2
        UbSAeP7DjGhoB4CygXGQ+FWETebf61J52R7XJxj4ZT3uJ3LeAjr84Btws8TwrDqKtqhOPA
        k8/6J7PYmM+Flpu3Sc1c9tevkOk8uvOekKjtl2LJtbLS/dya29PwdnOunM+7zuD9dGk+9B
        6gI9XUsAYhW4ED30Et7qacMDTLGxbONUD7/xWGy/hgHcSzJwN36b14L9nSs4IQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1649917526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=tmeGI/2AtaoeF3/z5ePdsPJr/OC7uDlr3DkNO1ahPas=;
        b=Nxpv3phkz9j/75a4BdzBnJSupOUCALn/RbZaHWdoAx6LiALavXqIaIj7KDuS9GOvwHj56i
        Oi3bO+Jqp2GNFVSHYbWW31ma416CXqUFxon1jddWZIRHsg/apuGGeL8NNN7yUFbflj3gaN
        YPwftEP/SptMYE3p50URQO2htvbnd3PWfZXkK+m2ldLTfPBuuwEZbrGKMIag86BIxrEthQ
        1xy9/OumlYPULz8li/Czw2GVS88BARIGrLQ2W72aEI50P8JQq8bU2RfrfXFLDZrfYE5c6w
        rjdqlASuLRkhqrI4Qaal3gCVyCHFEnIOjU88qlEqkhJ98/rLYXzWnSHJjGBiwg==
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

Please pull.


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.19-1.2-signed

for you to fetch changes up to 85256cd40c5ea36ca117617010c6e218a4d78108:

  Revert "media: dw9768: activate runtime PM and turn off device" (2022-04-14 08:32:58 +0300)

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

Jacopo Mondi (2):
      media: imx: imx-mipi-csis: Add support for JPEG_1X8
      media: i2c: ov5645: Fix media bus format

Kate Hsuan (1):
      staging: media: ipu3: Fix AF x_start position when rightmost stripe is used

Laurent Pinchart (1):
      media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()

Laurentiu Palcu (1):
      media: i2c: max9286: fix kernel oops when removing module

Randy Dunlap (1):
      media: isl7998x: select V4L2_FWNODE to fix build error

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

 Documentation/driver-api/media/v4l2-subdev.rst     |  69 ++++++
 .../media/mediactl/media-controller-model.rst      |   6 +
 .../userspace-api/media/mediactl/media-types.rst   |  17 +-
 drivers/media/common/saa7146/saa7146_video.c       |   1 -
 drivers/media/i2c/Kconfig                          |   1 +
 drivers/media/i2c/ccs/ccs-core.c                   |  36 ++-
 drivers/media/i2c/dw9768.c                         |   6 -
 drivers/media/i2c/max9286.c                        |  19 +-
 drivers/media/i2c/ov5645.c                         |   6 +-
 drivers/media/mc/mc-device.c                       |  21 +-
 drivers/media/mc/mc-entity.c                       |  46 +++-
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
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     |   2 -
 drivers/media/pci/solo6x10/solo6x10-v4l2.c         |   2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c            |   2 -
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
 drivers/media/radio/radio-maxiradio.c              |   2 -
 drivers/media/v4l2-core/v4l2-async.c               |  33 ++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
 drivers/media/v4l2-core/v4l2-subdev.c              | 214 +++++++++++++++---
 drivers/staging/media/ipu3/ipu3-css-fw.c           |   4 +-
 drivers/staging/media/ipu3/ipu3-css-fw.h           |   4 +-
 drivers/staging/media/ipu3/ipu3-css-params.c       |   9 +
 drivers/staging/media/ipu3/ipu3-v4l2.c             |   1 +
 drivers/staging/media/ipu3/ipu3.c                  |  25 +--
 drivers/staging/media/tegra-video/vi.c             |  10 +-
 include/media/media-device.h                       |  52 ++++-
 include/media/media-entity.h                       |  19 ++
 include/media/v4l2-subdev.h                        | 243 +++++++++++++++++++--
 include/uapi/linux/media.h                         |   1 +
 70 files changed, 752 insertions(+), 245 deletions(-)

-- 
Sakari Ailus
