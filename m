Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3052D7A632D
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 14:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbjISMi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 08:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbjISMi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 08:38:27 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF06418F
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 05:38:16 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Rqh5x4swXz49Psw
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 15:38:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1695127093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=WU+vnNNj1djej3VWr3ymem2oRwL9MLd2bQEQPoiKcMA=;
        b=CiS3zvlpfHzpSileuH1E8HnAdm+9ZArI67PdKmFUKtdjy5ZAzpU9pl/X0udFJD9jdan3/0
        ow/a/n69N7dwOmjewJmYH4UcIea7iaobcVVK0efzVwDCMxc39j1IOGz9lePe0N5pDUOwWy
        aMh9l9YT0IhV9uCeb7XOzcScLeor6kZtskTW+yOcN9Cco6Q5GLja4n5W5qFYSaU1UQANCX
        SJ76GvNx1U5t3xoQVC5V1eY2MvtdWV2NSwf0pKdgb4LWmz/wGwitn7AT0Xku4aVTAI8rXR
        4nC7y05llh9LjNI5NXCzd/FRnaHUj+d/X8SUPFhWIDn6AeGl7h4FlJ/rNRW3wA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1695127093; a=rsa-sha256;
        cv=none;
        b=vjZypwltptH/Ud49Zm1ilf0pgSEVMufn0lrIGk4bLutGXxp9zUKC4AxcYLyaDfm5THLi0M
        6KurWD3buD9L/RPuphaYSW7TmUhUVz+JCaIRrWllMnqxyUlUEM4xWHlEDMHHWOd97mJ+/7
        lQSQ79OiqeYkm8n8bIepKHRKM8r5cjI/J24lW8ClRtS1gNrqg3NrwciCmUTIiXIA4VIrTf
        /xsyYQMx45og1CKfaKukm4yzn8iIHTKj8TN2Eddpul8bBlKIBS9NrRfwskhkrDZrJQIijW
        y+t4otzn2Vj9tzv68CAd5X+EcI+MVdUXFX9FVPt5gREaJG4LpWUNw3EqZX6I0g==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1695127093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=WU+vnNNj1djej3VWr3ymem2oRwL9MLd2bQEQPoiKcMA=;
        b=TqnDKqoDIwcmK0XnaynPnp7f7RYT1pTwsjPZJS8cAB1T2NJKOueRwQcWtBEcuFlL5RQ4nR
        v1IKNAvrjs3b+l4JjIDiH4B/ZVUvEFaBXnP80SE0K6uOP7eGI7pehXRbVebaBvciR0eWhB
        68ZN//eiWf+PInOC+b7oTHx73wvJebegcLaqqBz0UG+VgjcFEdxyXpI5IkWoRbOYccgvFG
        XbvpWFpRr5MZVQZTv/TIIk02Y2UBV+cUWKB1iu8FfG7WTWv+vNtP08XssYVfcVjmZIv7fD
        MDzfbDVrMUmtlkV4Ek9AcLsUoMOXZDULTw1R/e6zDyttslE97BjGCeKjGpewnw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E8C87634C94
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 15:38:12 +0300 (EEST)
Date:   Tue, 19 Sep 2023 12:38:12 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.7] Mostly camera and VCM V4L2 patches
Message-ID: <ZQmWNBmWw0eQXll6@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a nice set of mostly camera sensor related patches for 6.7.

In particular, there's a set by Laurent for cleanup and improved
documentation of sensor drivers (62 patches). The rest are odd fixes,
cleanups and other improvements. Ov5642 bindings are included but there's
no driver (at least not yet).

Please pull.


The following changes since commit 0835b195d034ab98b148b8e9c81a862c0c557bb7:

  media: ivsc: Depend on VIDEO_DEV (2023-09-13 15:04:06 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.7-1.1-signed

for you to fetch changes up to 210635f038a66dbce55af6ae0a7653ab4a48c552:

  media: i2c: ov9734: Drop system suspend and resume handlers (2023-09-19 15:31:48 +0300)

----------------------------------------------------------------
V4L2 patches for 6.7

----------------------------------------------------------------
Biju Das (5):
      media: i2c: video-i2c: Convert enum->pointer for data in the match tables
      media: i2c: mt9v032: Extend match support for OF tables
      media: i2c: mt9v032: Drop CONFIG_OF ifdeffery
      media: i2c: ov7670: Extend match support for OF tables
      media: i2c: ov7670: Drop CONFIG_OF ifdeffery

Christophe JAILLET (3):
      media: i2c: max9286: Remove an incorrect fwnode_handle_put() call
      media: imx-mipi-csis: Remove an incorrect fwnode_handle_put() call
      media: i2c: max9286: Fix some redundant of_node_put() calls

Dan Carpenter (1):
      media: ov13b10: Fix some error checking in probe

Fabio Estevam (1):
      media: dt-bindings: Add OV5642

Guoniu.zhou (1):
      media: ov5640: fix vblank unchange issue when work at dvp mode

Hao Yao (1):
      media: ov13b10: Add 1364x768 register settings

Jacopo Mondi (1):
      media: i2c: Drop ifdeffery from sensor drivers

Jean-Michel Hautbois (1):
      media: staging: ipu3-imgu: Initialise height_per_slice in the stripes

Krzysztof Kozlowski (1):
      media: platform: use capital "OR" for multiple licenses in SPDX

Laurent Pinchart (62):
      media: v4l2-subdev: Document that routing support depends on streams
      media: i2c: Use pm_runtime_resume_and_get()
      media: i2c: ov5693: Drop the unused streaming flag
      media: i2c: imx415: Replace streaming flag with runtime PM check
      media: i2c: imx296: Replace streaming flag with runtime PM check
      media: v4l2-subdev: Document and enforce .s_stream() requirements
      media: i2c: hi556: Drop check for reentrant .s_stream()
      media: i2c: hi846: Drop check for reentrant .s_stream()
      media: i2c: imx208: Drop check for reentrant .s_stream()
      media: i2c: imx214: Drop check for reentrant .s_stream()
      media: i2c: imx219: Drop check for reentrant .s_stream()
      media: i2c: imx258: Drop check for reentrant .s_stream()
      media: i2c: imx319: Drop check for reentrant .s_stream()
      media: i2c: imx334: Drop check for reentrant .s_stream()
      media: i2c: imx335: Drop check for reentrant .s_stream()
      media: i2c: imx355: Drop check for reentrant .s_stream()
      media: i2c: imx412: Drop check for reentrant .s_stream()
      media: i2c: mt9m001: Drop check for reentrant .s_stream()
      media: i2c: og01a1b: Drop check for reentrant .s_stream()
      media: i2c: ov01a10: Drop check for reentrant .s_stream()
      media: i2c: ov08d10: Drop check for reentrant .s_stream()
      media: i2c: ov08x40: Drop check for reentrant .s_stream()
      media: i2c: ov13858: Drop check for reentrant .s_stream()
      media: i2c: ov13b10: Drop check for reentrant .s_stream()
      media: i2c: ov2685: Drop check for reentrant .s_stream()
      media: i2c: ov2740: Drop check for reentrant .s_stream()
      media: i2c: ov4689: Drop check for reentrant .s_stream()
      media: i2c: ov5647: Drop check for reentrant .s_stream()
      media: i2c: ov5670: Drop check for reentrant .s_stream()
      media: i2c: ov5675: Drop check for reentrant .s_stream()
      media: i2c: ov5695: Drop check for reentrant .s_stream()
      media: i2c: ov7740: Drop check for reentrant .s_stream()
      media: i2c: ov8856: Drop check for reentrant .s_stream()
      media: i2c: ov9282: Drop check for reentrant .s_stream()
      media: i2c: ov9734: Drop check for reentrant .s_stream()
      Documentation: media: camera-sensor: Fix typo and vocabulary selection
      Documentation: media: camera-sensor: Use link to upstream DT bindings
      Documentation: media: camera-sensor: Move power management section
      Documentation: media: camera-sensor: Improve power management documentation
      media: i2c: ar0521: Drop system suspend and resume handlers
      media: i2c: ccs: Drop system suspend and resume handlers
      media: i2c: hi556: Drop system suspend and resume handlers
      media: i2c: hi846: Drop system suspend and resume handlers
      media: i2c: hi847: Drop system suspend and resume handlers
      media: i2c: imx208: Drop system suspend and resume handlers
      media: i2c: imx214: Drop system suspend and resume handlers
      media: i2c: imx219: Drop system suspend and resume handlers
      media: i2c: imx258: Drop system suspend and resume handlers
      media: i2c: imx319: Drop system suspend and resume handlers
      media: i2c: imx355: Drop system suspend and resume handlers
      media: i2c: og01a1b: Drop system suspend and resume handlers
      media: i2c: ov01a10: Drop system suspend and resume handlers
      media: i2c: ov02a10: Drop system suspend and resume handlers
      media: i2c: ov08d10: Drop system suspend and resume handlers
      media: i2c: ov08x40: Drop system suspend and resume handlers
      media: i2c: ov13858: Drop system suspend and resume handlers
      media: i2c: ov2740: Drop system suspend and resume handlers
      media: i2c: ov13b10: Drop stream handling in runtime PM handlers
      media: i2c: ov5670: Drop system suspend and resume handlers
      media: i2c: ov5675: Drop system suspend and resume handlers
      media: i2c: ov8856: Drop system suspend and resume handlers
      media: i2c: ov9734: Drop system suspend and resume handlers

Mikhail Rudenko (1):
      MAINTAINERS: fix file path for Omnvision OV4689

Ruan Jinjie (1):
      media: ov2640: Use the devm_clk_get_enabled() helper function

Sakari Ailus (3):
      media: ivsc: Improve Kconfig help text
      media: v4l2-mc: Make v4l2_pipeline_pm_{get,put} deprecated
      media: Documentation: Mention CCS tools

Shravan Chippa (1):
      media: i2c: imx334: add support for test pattern generator

Suhrid Subramaniam (1):
      media: v4l: Fix documentation for 12-bit packed Bayer

Tommaso Merciai (1):
      media: dt-bindings: ov5693: fix maintainer email address

Umang Jain (1):
      media: i2c: imx415: Use v4l2_subdev_get_fmt()

Wentong Wu (3):
      media: ivsc: csi: remove name identifier
      media: ivsc: ace: remove name identifier
      media: ivsc: ace: probe ace device after IPU bridge is initialized.

Xiaolei Wang (1):
      media: ov5640: Fix a memory leak when ov5640_probe fails

 .../devicetree/bindings/media/i2c/ovti,ov5642.yaml | 141 +++++++++++++++++++++
 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml |   2 +-
 .../devicetree/bindings/trivial-devices.yaml       |   2 -
 Documentation/driver-api/media/camera-sensor.rst   | 107 ++++++++++------
 Documentation/driver-api/media/drivers/ccs/ccs.rst |   8 ++
 .../userspace-api/media/v4l/pixfmt-srggb12p.rst    |   4 +-
 MAINTAINERS                                        |   2 +-
 drivers/media/i2c/ar0521.c                         |  30 +----
 drivers/media/i2c/ccs/ccs-core.c                   |  43 +------
 drivers/media/i2c/hi556.c                          |  50 --------
 drivers/media/i2c/hi846.c                          |  34 +----
 drivers/media/i2c/hi847.c                          |  57 +--------
 drivers/media/i2c/imx208.c                         |  61 +--------
 drivers/media/i2c/imx214.c                         |  40 ------
 drivers/media/i2c/imx219.c                         |  44 -------
 drivers/media/i2c/imx258.c                         |  40 ------
 drivers/media/i2c/imx296.c                         |  16 +--
 drivers/media/i2c/imx319.c                         |  44 -------
 drivers/media/i2c/imx334.c                         |  66 ++++++++--
 drivers/media/i2c/imx335.c                         |   9 --
 drivers/media/i2c/imx355.c                         |  45 -------
 drivers/media/i2c/imx412.c                         |   9 --
 drivers/media/i2c/imx415.c                         |  45 +++----
 drivers/media/i2c/max9286.c                        |   3 -
 drivers/media/i2c/mt9m001.c                        |   6 -
 drivers/media/i2c/mt9m111.c                        |  13 +-
 drivers/media/i2c/mt9v011.c                        |   6 -
 drivers/media/i2c/mt9v032.c                        |  26 ++--
 drivers/media/i2c/mt9v111.c                        |  14 --
 drivers/media/i2c/og01a1b.c                        |  55 +-------
 drivers/media/i2c/ov01a10.c                        |  59 +--------
 drivers/media/i2c/ov02a10.c                        |   2 -
 drivers/media/i2c/ov08d10.c                        |  52 --------
 drivers/media/i2c/ov08x40.c                        |  44 -------
 drivers/media/i2c/ov13858.c                        |  44 -------
 drivers/media/i2c/ov13b10.c                        |  98 ++++++++------
 drivers/media/i2c/ov2640.c                         |  21 +--
 drivers/media/i2c/ov2659.c                         |  16 +--
 drivers/media/i2c/ov2685.c                         |  19 ---
 drivers/media/i2c/ov2740.c                         |  45 -------
 drivers/media/i2c/ov4689.c                         |   9 +-
 drivers/media/i2c/ov5640.c                         |  24 +++-
 drivers/media/i2c/ov5647.c                         |   6 -
 drivers/media/i2c/ov5670.c                         |  36 ------
 drivers/media/i2c/ov5675.c                         |  44 -------
 drivers/media/i2c/ov5693.c                         |   9 +-
 drivers/media/i2c/ov5695.c                         |  25 ----
 drivers/media/i2c/ov7251.c                         |   8 +-
 drivers/media/i2c/ov7670.c                         |  72 ++++-------
 drivers/media/i2c/ov772x.c                         |   4 -
 drivers/media/i2c/ov7740.c                         |  30 +----
 drivers/media/i2c/ov8856.c                         |  47 -------
 drivers/media/i2c/ov9282.c                         |   9 --
 drivers/media/i2c/ov9734.c                         |  50 --------
 drivers/media/i2c/st-vgxy61.c                      |   9 +-
 drivers/media/i2c/video-i2c.c                      |  12 +-
 drivers/media/pci/intel/ivsc/Kconfig               |  12 +-
 drivers/media/pci/intel/ivsc/mei_ace.c             |   9 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |   5 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |   2 -
 .../platform/verisilicon/rockchip_av1_filmgrain.c  |   2 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  17 ++-
 drivers/staging/media/ipu3/ipu3-css-params.c       |  44 +++----
 include/media/v4l2-mc.h                            |   6 +
 include/media/v4l2-subdev.h                        |   9 +-
 65 files changed, 516 insertions(+), 1406 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5642.yaml

-- 
Sakari Ailus
