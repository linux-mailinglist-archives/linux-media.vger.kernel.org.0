Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACD77C7707
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 21:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442450AbjJLThk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 15:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442407AbjJLThi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 15:37:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6383D7;
        Thu, 12 Oct 2023 12:37:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97BED8C;
        Thu, 12 Oct 2023 21:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697139447;
        bh=L+wv19PM7x/xXr/z3O//0TkRxpU4Mv28RyY6tp937+Q=;
        h=From:To:Cc:Subject:Date:From;
        b=Q9JvKVrAJdLNy0mUdxQMRM5cZyJf91YII1Ax5XcuEaGpvFnB2K+GGUytlnOu0AH6I
         NKyx+foXpdPQ/lScIvTWCRPl/MFuNESd4EqyzXF+oHif/jy/tFpqq8n2P1rCw8YAKj
         SmFlbrp5GpazZFRNzo2RawplOQevuQ6lkmsyfqtQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] media: i2c: Add driver for THine THP7312 ISP
Date:   Thu, 12 Oct 2023 22:37:34 +0300
Message-ID: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a new driver for the THine THP7312 ISP. It has
been tested on an OLogic Pumpkin i350, which has a Mediatek MT8365 SoC,
with the THine THSCG101 camera module.

Technically the driver itself (and its bindings) have no dependencies,
but to run/test this on the Pumpkin i350 with the mainline kernel, a
number of patches are needed to support the board and the MT8365 SoC.
Some of those patches are on their way to mainline, and some, like the
Pumpkin i350 board device tree, will require more work. For convenience
and reference, the needed patches are available in [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.6/pumpkin/camera

Example overlays for DT integration of the THP7312 are available in that
branch, in
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso and
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso.

Compared to v2, all comments received for the DT bindings in v1 have now
been properly taken into account (as far as I can tell). The driver has
also been improved slightly. Please see individual patches for detailed
changelogs.

I also managed to get the mainline kernel running properly on the
Pumpkin board, so this series has been properly tested on v6.6-rc5.

Below is the mandatory v4l2-compliance report. Careful readers may
notice that my v4l2-utils version is three commits behind upstream, but
that makes no practical difference as those commits are not related to
v4l2-compliance.

root@buildroot ~ # v4l2-compliance -u /dev/v4l-subdev2
v4l2-compliance 1.25.0-5097, 64 bits, 64-bit time_t
v4l2-compliance SHA: b79e00a74fde 2023-09-13 07:19:23

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.6.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 17 Private Controls: 4

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev2: 43, Succeeded: 43, Failed: 0, Warnings: 0

Laurent Pinchart (1):
  media: uapi: Add controls for the THP7312 ISP

Paul Elder (2):
  dt-bindings: media: Add bindings for THine THP7312 ISP
  media: i2c: Add driver for THine THP7312

 .../bindings/media/i2c/thine,thp7312.yaml     |  226 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/thp7312.rst   |   32 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   16 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 2330 +++++++++++++++++
 include/uapi/linux/thp7312.h                  |   19 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2641 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 include/uapi/linux/thp7312.h


base-commit: a1766a4fd83befa0b34d932d532e7ebb7fab1fa7
-- 
Regards,

Laurent Pinchart

