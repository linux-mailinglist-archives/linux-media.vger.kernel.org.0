Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E2673766C
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 23:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjFTVK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jun 2023 17:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjFTVK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jun 2023 17:10:27 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198EF1727
        for <linux-media@vger.kernel.org>; Tue, 20 Jun 2023 14:10:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Qlzmt0K20z49Q30
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 00:10:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1687295422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=31t5YJ8HKE/QKWrvhFQrszzoSmvVyYasN0yANZ7c2OY=;
        b=TJ/LXUK+BgXxdynP4WyaAdHDkmNakhTBdNgR5X+gEBJi31sHcbUe0PErcx7KSDPRRqOQdk
        wbyWOkjduwHq5IE9qaf5wNY7D4AaMysK/ZKwa67iARW/g5/O6Obws5Z1hHbbu0DaGalDFX
        rXmZJOSusHs5j7HVSwr4fc1YS5YbkU6a0Y4sGoLPJsJLl51xfxMQDHNk8OsGjLksA3OMwi
        t0Gl24wNFd8J8E85p1VjizdLiWopfBmyOnXpdE5QasKPPhvjKIapnLYio40CTQJg/tfFci
        Y6xIvUPPD99KGxl39c4uwNh/dIj7FtS0AHfhkUmFhCNF/tQCCmmx4eR/ax0e4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1687295422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=31t5YJ8HKE/QKWrvhFQrszzoSmvVyYasN0yANZ7c2OY=;
        b=uNpW1tNJ8q0CT9M4dIMwkQ/j+rq5eeokwD1LIi4e4a1eByS5guzZ8oRZ6x0bHPPzTnSbWA
        m4GxAlkn9rPop5jKiu02IJms5J/A6559ERDokiE+mJP8icbmdcen2olxySlGq/NYy9cwqY
        lFoGOgDkN0lquuVQYEmGxagWuF9zh5RdAfRB7SS93Q9yIkKyGfY5BTeHf//3M1KYdglwiZ
        lqP+7f3k2FNFJLs5IB6vdiG0lfNBeSbyvKJAJj7rxzKqnKOzdw8Tio+SLKQx8Zcu5qvSK9
        vNyPZ/jdRrLm4/ZyTuv19ZH3VS/5rw5EeudYvSkU9B5a2A0sVIP6OYRF4Y2UVQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1687295422; a=rsa-sha256;
        cv=none;
        b=L//VRfHfNYhNpzjDwoxNuDRF0820eNWVvVuJZCE8DLlNhjc2zRnCRTA+sFoezBNg0D4UNs
        9QhjIQUqIZN1Ea9/TbduKKiSFC5Z9PK/jA9Tt/P0pje8CuY3NV1m9pFqCOgDp0ZpZBj2Kl
        hqxPZK5dUCLeN6NKx73ryL/0ZuGXLnp+dV2k9FIH/TTJg5oCYWwiIUeXLt/K+ds3Y7cE54
        h02/34OFydIqSML46EzkxZMILgCuItDN9yCJ3CiTCQQbmIMbcHg3+aj6F7++I0fDQ6B768
        ZksScKL4+8F0lb1+MNK5IBFDURK7/o7AN5Ws6te/WVpI/3m+rizcJkmNK+7f8Q==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6A886634C94
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 00:10:21 +0300 (EEST)
Date:   Wed, 21 Jun 2023 00:10:21 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.6] V4L2 patches of all kind plus more
Message-ID: <ZJIVvXtDlP2OtS3X@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a large number of V4L2 patches for 6.6, in particular:

- Rename of the CIO2 bridge as IPU bridge (expect to be used with IPU6).

- OV13B10 driver fixes.

- Miscellaneous fixes (V4L2 fwnode) as well as drivers.

- External PHY support for cadence CSI2RX.

- Removal of of_match_ptr() macro patches from Krzysztof.

- I²C address translator support plus the dependent FPD-link drivers.

- MAINTAINERS changes.

Please pull.


The following changes since commit be9aac187433af6abba5fcc2e73d91d0794ba360:

  Merge tag 'v6.4-rc5' into media_stage (2023-06-09 10:12:41 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.6-1.4-signed

for you to fetch changes up to 08784f9591c8a894046b489a8b456c39cf8caa22:

  media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link() (2023-06-20 23:54:15 +0300)

----------------------------------------------------------------
V4L2 patches for 6.6

----------------------------------------------------------------
Bingbu Cao (6):
      media: ipu3-cio2: rename cio2 bridge to ipu bridge and move out of ipu3
      media: ipu-bridge: use IPU_MAX_PORTS for bridge instead of CIO2_NUM_PORTS
      media: ipu3-cio2: rename ipu3-cio2-main.c back to ipu3-cio2.c
      media: ov13b10: Defer probe if no endpoint found
      media: ov13b10: support new ACPI HID 'OVTI13B1'
      media: ov13b10: add PM control support based on power resources

Christophe JAILLET (1):
      media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()

Claudiu Beznea (1):
      media: i2c: tvp5150: check return value of devm_kasprintf()

Guoniu.zhou (1):
      media: ov5640: fix low resolution image abnormal issue

Hans de Goede (1):
      media: ad5820: Drop unsupported ad5823 from i2c_ and of_device_id tables

Jack Zhu (5):
      media: dt-bindings: cadence-csi2rx: Convert to DT schema
      media: dt-bindings: cadence-csi2rx: Add resets property
      media: cadence: Add operation on reset
      media: cadence: Add support for external dphy
      media: cadence: Add support for JH7110 SoC

Jason Chen (1):
      media: ov08x40: Fix hblank out of range issue

Krzysztof Kozlowski (25):
      media: cec: ch7322: drop of_match_ptr for ID table
      media: cec: meson: drop of_match_ptr for ID table
      media: cec: tegra: drop of_match_ptr for ID table
      media: rc: gpio-ir-recv: drop of_match_ptr for ID table
      media: rc: gpio-ir-tx: drop of_match_ptr for ID table
      media: rc: ir-rx51: drop of_match_ptr for ID table
      media: platform: allegro-dvt: drop of_match_ptr for ID table
      media: platform: intel: pxa: drop of_match_ptr for ID table
      media: platform: samsung: s5p-jpeg: drop of_match_ptr for ID table
      media: platform: ti: am437x: drop of_match_ptr for ID table
      media: platform: verisilicon: drop of_match_ptr for ID table
      media: platform: marvell: drop of_match_ptr for ID table
      media: platform: mdp3: drop of_match_ptr for ID table
      media: platform: mdp3: mark OF related data as maybe unused
      media: platform: sun6i-csi: drop of_match_ptr for ID table
      media: platform: sun6i-mipi-csi2: drop of_match_ptr for ID table
      media: platform: sun8i-a83t-mipi-csi2: drop of_match_ptr for ID table
      media: platform: mdp: mark OF related data as maybe unused
      media: platform: jpeg: always reference OF data
      media: i2c: isl7998x: drop of_match_ptr for ID table
      media: i2c: mt9m111: drop of_match_ptr for ID table
      media: i2c: ov2640: drop of_match_ptr for ID table
      media: i2c: ov2680: drop of_match_ptr for ID table
      media: i2c: ov7740: drop of_match_ptr for ID table
      media: i2c: max9286: drop of_match_ptr for ID table

Luca Ceresoli (1):
      i2c: add I2C Address Translator (ATR) support

Nicolas Ferre (1):
      MAINTAINERS: Orphan the OV7740 driver

Sakari Ailus (5):
      media: MAINTAINERS: Assign Shawn Tu's sensor drivers to myself
      media: MAINTAINERS: Add an entry for V4L2 sensor and lens drivers
      media: MAINTAINERS: Orphan dw9768 and ov02a10 drivers
      media: MAINTAINERS: Pick ov5670 maintenance
      media: i2c: Remove Shawn's and Chiranjeevi's e-mail addresses

Tomi Valkeinen (7):
      dt-bindings: i2c: Add I2C Address Translator (ATR)
      dt-bindings: media: add TI DS90UB913 FPD-Link III Serializer
      dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
      dt-bindings: media: add TI DS90UB960 FPD-Link III Deserializer
      media: i2c: add DS90UB960 driver
      media: i2c: add DS90UB913 driver
      media: i2c: add DS90UB953 driver

Tommaso Merciai (1):
      media: i2c: imx290: drop format param from imx290_ctrl_update

 Documentation/devicetree/bindings/i2c/i2c-atr.yaml |   34 +
 .../devicetree/bindings/media/cdns,csi2rx.txt      |  100 -
 .../devicetree/bindings/media/cdns,csi2rx.yaml     |  201 +
 .../bindings/media/i2c/ti,ds90ub913.yaml           |  133 +
 .../bindings/media/i2c/ti,ds90ub953.yaml           |  134 +
 .../bindings/media/i2c/ti,ds90ub960.yaml           |  427 +++
 Documentation/i2c/i2c-address-translators.rst      |   96 +
 Documentation/i2c/index.rst                        |    1 +
 MAINTAINERS                                        |   54 +-
 drivers/i2c/Kconfig                                |    9 +
 drivers/i2c/Makefile                               |    1 +
 drivers/i2c/i2c-atr.c                              |  710 ++++
 drivers/media/cec/i2c/ch7322.c                     |    2 +-
 drivers/media/cec/platform/meson/ao-cec.c          |    2 +-
 drivers/media/cec/platform/tegra/tegra_cec.c       |    2 +-
 drivers/media/i2c/Kconfig                          |   47 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/ad5820.c                         |    2 -
 drivers/media/i2c/ds90ub913.c                      |  906 +++++
 drivers/media/i2c/ds90ub953.c                      | 1400 +++++++
 drivers/media/i2c/ds90ub960.c                      | 4051 ++++++++++++++++++++
 drivers/media/i2c/hi556.c                          |    2 +-
 drivers/media/i2c/hi847.c                          |    2 +-
 drivers/media/i2c/imx208.c                         |    2 +-
 drivers/media/i2c/imx290.c                         |    7 +-
 drivers/media/i2c/imx319.c                         |    2 +-
 drivers/media/i2c/imx355.c                         |    2 +-
 drivers/media/i2c/isl7998x.c                       |    2 +-
 drivers/media/i2c/max9286.c                        |    2 +-
 drivers/media/i2c/mt9m111.c                        |    2 +-
 drivers/media/i2c/og01a1b.c                        |    2 +-
 drivers/media/i2c/ov08x40.c                        |   16 +-
 drivers/media/i2c/ov13858.c                        |    2 +-
 drivers/media/i2c/ov13b10.c                        |  129 +-
 drivers/media/i2c/ov2640.c                         |    2 +-
 drivers/media/i2c/ov2680.c                         |    2 +-
 drivers/media/i2c/ov2740.c                         |    2 +-
 drivers/media/i2c/ov5640.c                         |    7 +-
 drivers/media/i2c/ov5670.c                         |    2 +-
 drivers/media/i2c/ov5675.c                         |    2 +-
 drivers/media/i2c/ov7740.c                         |    2 +-
 drivers/media/i2c/tvp5150.c                        |    4 +
 drivers/media/pci/Kconfig                          |    2 +-
 drivers/media/pci/intel/Kconfig                    |   21 +
 drivers/media/pci/intel/Makefile                   |    4 +-
 .../pci/intel/{ipu3/cio2-bridge.c => ipu-bridge.c} |  179 +-
 .../pci/intel/{ipu3/cio2-bridge.h => ipu-bridge.h} |   57 +-
 drivers/media/pci/intel/ipu3/Kconfig               |   19 -
 drivers/media/pci/intel/ipu3/Makefile              |    3 -
 .../intel/ipu3/{ipu3-cio2-main.c => ipu3-cio2.c}   |    4 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h           |    6 -
 drivers/media/platform/allegro-dvt/allegro-core.c  |    2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       |  107 +-
 drivers/media/platform/intel/pxa_camera.c          |    2 +-
 drivers/media/platform/marvell/mmp-driver.c        |    2 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |    6 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c |    4 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c |    4 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |    2 +-
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |    2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |    2 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |    2 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |    2 +-
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |    2 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |    2 +-
 drivers/media/rc/gpio-ir-recv.c                    |    2 +-
 drivers/media/rc/gpio-ir-tx.c                      |    2 +-
 drivers/media/rc/ir-rx51.c                         |    2 +-
 drivers/media/v4l2-core/v4l2-fwnode.c              |   18 +-
 include/linux/i2c-atr.h                            |  116 +
 include/media/i2c/ds90ub9xx.h                      |   22 +
 73 files changed, 8756 insertions(+), 356 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-atr.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.txt
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
 create mode 100644 Documentation/i2c/i2c-address-translators.rst
 create mode 100644 drivers/i2c/i2c-atr.c
 create mode 100644 drivers/media/i2c/ds90ub913.c
 create mode 100644 drivers/media/i2c/ds90ub953.c
 create mode 100644 drivers/media/i2c/ds90ub960.c
 create mode 100644 drivers/media/pci/intel/Kconfig
 rename drivers/media/pci/intel/{ipu3/cio2-bridge.c => ipu-bridge.c} (68%)
 rename drivers/media/pci/intel/{ipu3/cio2-bridge.h => ipu-bridge.h} (72%)
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2-main.c => ipu3-cio2.c} (99%)
 create mode 100644 include/linux/i2c-atr.h
 create mode 100644 include/media/i2c/ds90ub9xx.h

-- 
Kind regards,

Sakari Ailus
