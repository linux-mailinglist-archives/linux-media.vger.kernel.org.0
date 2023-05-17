Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31D27072E8
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 22:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjEQUWu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 16:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjEQUWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 16:22:49 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6B77AA9
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 13:22:47 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QM4Kc4GwWzyTW
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 23:22:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684354964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=LatqQicGY82ElhIKZGhT2By1YFb5DCCa+Fv7hC1+iBE=;
        b=BQoe/tuBPvFNHnveQlG/q9PSdpldRtIRNYtIib6mX3EO++wEksFTIeeiPxedWQYVu60UtH
        sgwRcuv0+MImoFCX1VUH20i8rOqEYFEjddYjdRWT+gxycIZiC3hIPFxCb+bAPJ7fIOLSb7
        wNmbLd+FYjzfieUclq0ms3Y6B50r45c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684354964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=LatqQicGY82ElhIKZGhT2By1YFb5DCCa+Fv7hC1+iBE=;
        b=uA+AmtHpxrP6GBN2NCImHycUGKzWoB1ZEl/58xKRqHrnkbX6jJMTKNHpq/WIxp82LD3qhl
        EAOrdgbCJsB3hcxN4Ai/GFKECvu5lGZvp/E/m+vTTe/uuc+zvUazKDizGklglhquTuW/yr
        X09XGggrIufofAKyWb64szcw+WAxfTA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684354964; a=rsa-sha256; cv=none;
        b=q+W/mPay3s6Ymv91aEbAQRmH1kCoFrP/rmqVes/Gf5o1SukjbvkIbDNjnhjaPl2o7TRq77
        Lm9d2UMJkajFNwJM4MxksoxLXnyj00MoF1/Jwty+qsjuo1/WFl7M7PF39diTw6AGQVshTo
        K0WbsqrD/8Ivt1O+pT2MCyWMmpYV1Qg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CC500634C94
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 23:22:43 +0300 (EEST)
Date:   Wed, 17 May 2023 23:22:43 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.5] Camera sensor, CSI-2 related patches plus more
Message-ID: <ZGU3kwC9CdTuq4zx@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a bunch of media patches for 6.5. In particular, there's a new
driver for ov01a10, fixes and improvements for hi846, ov5640, imx7,
mipid02, max96712, fdp1, rcar-*, c8sectpfe and imx334 drivers, as well as
C-PHY support for rcar-csi2. Cleanups for others, too, and rename of meta
format files.

Please pull.


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.5-1-signed

for you to fetch changes up to 32f5fd37fa351d3b9fda9ab1b1aba469fb5a8285:

  media: sti: c8sectpfe: drop of_match_ptr() to avoid unused variables (2023-05-17 23:19:03 +0300)

----------------------------------------------------------------
V4L2 patches for 6.5

----------------------------------------------------------------
Alain Volmat (1):
      media: sti: c8sectpfe: drop of_match_ptr() to avoid unused variables

Alexander Stein (4):
      media: video-mux: Add missing media_entity_cleanup upon async register fail
      media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
      media: imx: imx7-media-csi: Remove incorrect interlacing support
      media: imx: imx7-media-csi: Relax width constraints for non-8bpp formats

Arnd Bergmann (1):
      media: platform: mtk-mdp3: work around unused-variable warning

Bingbu Cao (1):
      media: i2c: add ov01a10 image sensor driver

Christophe JAILLET (1):
      media: ov5693: Simplify an error message

Dan Carpenter (1):
      media: i2c: imx296: fix error checking in imx296_read_temperature()

Daniel Scally (2):
      media: i2c: Correct format propagation for st-mipid02
      media: st-mipid02: Propagate format from sink to source pad

Dmitry Torokhov (1):
      media: c8sectpfe: switch to using gpiod API

Geert Uytterhoeven (1):
      media: renesas: fdp1: Identify R-Car Gen2 versions

Guoniu.zhou (1):
      media: ov5640: correct comments for default VGA to avoid confusion

Jack Zhu (1):
      media: admin-guide: Update rkisp1.rst

Jacopo Mondi (2):
      media: ov5640: Remove unused 'framerate' parameter
      media: ov5640: Drop dead code using frame_interval

Krzysztof Kozlowski (2):
      media: dt-bindings: qcom: camss: correct unit address
      media: i2c: video: constify pointers to hwmon_channel_info

Laurent Pinchart (1):
      media: imx: imx7-media-csi: Init default format with __imx7_csi_video_try_fmt()

Martin Kepplinger (1):
      media: hi846: fix usage of pm_runtime_get_if_in_use()

Niklas Söderlund (10):
      media: rcar-vin: Gen3 can not scale NV12
      media: rcar-vin: Fix NV12 size alignment
      media: rcar-vin: Select correct interrupt mode for V4L2_FIELD_ALTERNATE
      dt-bindings: i2c: maxim,max96712: Require setting bus-type property
      media: rcar-csi2: Prepare for Gen4 support
      media: rcar-csi2: Prepare for C-PHY support
      media: rcar-csi2: Add support for C-PHY on R-Car V4H
      media: staging: max96712: Add support for 3-lane C-PHY
      media: rcar-isp: Add support for R-Car V4H
      media: rcar-vin: Add support for R-Car V4H

Sakari Ailus (8):
      Documentation: v4l: Document rotation and orientation for sensor drivers
      media: mc: Make media_entity_get_fwnode_pad() fwnode argument const
      media: pci: ipu3-cio2: Obtain remote pad from endpoint
      media: mc: Make media_get_pad_index() use pad type flag
      media: Documentation: Rename meta format files
      media: uapi: Use unsigned int values for assigning bits in u32 fields
      media: uapi: Fix [GS]_ROUTING ACTIVE flag value
      media: ipu3-cio2: Fix container_of() macro wrapper arguments

Shravan Chippa (1):
      media: i2c: imx334: update pixel, hblank and link frequency

 Documentation/admin-guide/media/rkisp1.rst         |    4 +-
 .../bindings/media/i2c/maxim,max96712.yaml         |    7 +
 .../bindings/media/qcom,msm8916-camss.yaml         |    2 +-
 .../bindings/media/qcom,msm8996-camss.yaml         |    2 +-
 .../bindings/media/qcom,sdm660-camss.yaml          |    2 +-
 .../bindings/media/qcom,sdm845-camss.yaml          |    2 +-
 Documentation/driver-api/media/camera-sensor.rst   |   22 +
 .../userspace-api/media/v4l/ext-ctrls-camera.rst   |    3 +
 .../userspace-api/media/v4l/meta-formats.rst       |   14 +-
 .../v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} |    0
 ...-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} |    0
 .../{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} |    0
 .../v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst}   |    0
 .../{pixfmt-meta-vivid.rst => metafmt-vivid.rst}   |    0
 ...xfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} |    0
 ...xfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} |    0
 .../media/v4l/vidioc-subdev-g-routing.rst          |    2 +-
 MAINTAINERS                                        |   11 +-
 drivers/media/dvb-core/dvbdev.c                    |    4 +-
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/hi846.c                          |    3 +-
 drivers/media/i2c/imx296.c                         |    4 +-
 drivers/media/i2c/imx334.c                         |   62 +-
 drivers/media/i2c/ov01a10.c                        | 1004 ++++++++++++++++++++
 drivers/media/i2c/ov5640.c                         |   19 +-
 drivers/media/i2c/ov5693.c                         |    4 +-
 drivers/media/i2c/st-mipid02.c                     |   15 +-
 drivers/media/i2c/video-i2c.c                      |    2 +-
 drivers/media/mc/mc-entity.c                       |   18 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c      |   31 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |    3 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |   94 +-
 drivers/media/platform/renesas/rcar-isp.c          |    1 +
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   13 +
 .../media/platform/renesas/rcar-vin/rcar-csi2.c    |  388 +++++++-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   21 +-
 drivers/media/platform/renesas/rcar_fdp1.c         |    5 +
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |   33 +-
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.h     |    4 +-
 drivers/media/platform/video-mux.c                 |    1 +
 drivers/media/usb/au0828/au0828-core.c             |    2 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |   38 +-
 drivers/staging/media/max96712/max96712.c          |   38 +-
 include/media/media-entity.h                       |    6 +-
 include/uapi/linux/media.h                         |   28 +-
 46 files changed, 1692 insertions(+), 234 deletions(-)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-d4xx.rst => metafmt-d4xx.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-intel-ipu3.rst => metafmt-intel-ipu3.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-rkisp1.rst => metafmt-rkisp1.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-uvc.rst => metafmt-uvc.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vivid.rst => metafmt-vivid.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgo.rst => metafmt-vsp1-hgo.rst} (100%)
 rename Documentation/userspace-api/media/v4l/{pixfmt-meta-vsp1-hgt.rst => metafmt-vsp1-hgt.rst} (100%)
 create mode 100644 drivers/media/i2c/ov01a10.c

-- 
Kind regards,

Sakari Ailus
