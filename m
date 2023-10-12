Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E00027C6222
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 03:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbjJLBUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 21:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbjJLBUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 21:20:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9A498;
        Wed, 11 Oct 2023 18:20:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 984E67FC;
        Thu, 12 Oct 2023 03:20:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697073606;
        bh=x38t53j8Sk+I5ukmymqPUmq+7cx33nmVbO4/IqkUf28=;
        h=From:To:Cc:Subject:Date:From;
        b=TCPwOKC1MKjj6yGwWkL244ziYsjygP7QZkz2UvZ0a4+CoI5Q6d4hW/0Qx8lUS52JM
         uGz30cWTO6hDkgNvTb/53Vv3Rj29AMmAuBFbE/RwS1lU8bkpNIrSXFQnVsO9wLjoAX
         jZ8i+TJaqtsjuwNFMrfZDrcW1ZLSuqNpvTjinyIU=
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
Subject: [PATCH v2 0/3] media: i2c: Add driver for THine THP7312 ISP
Date:   Thu, 12 Oct 2023 04:20:13 +0300
Message-ID: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
large number of patches are needed to support the board and the MT8365
SoC. Some of those patches are on their way to mainline, and some, like
the Pumpkin i350 board device tree, will require more work. For
convenience and reference, the needed patches are available in [1].
Example overlays for DT integration of the THP7312 are available in that
branch, in [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.6/pumpkin/camera
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?h=mtk/v6.6/pumpkin/camera&id=e5fd74796c3e0973991bab2692a3534ed1a23d86

Compared to v1, this is a near complete rewrite of the driver that has
taken (to my knowledge) all review comments into account.

Below is the mandatory v4l2-compliance report. Careful readers may
notice that my v4l2-utils version is three commits behind upstream, but
that makes no practical difference as those commits are not related to
v4l2-compliance.

The mainline kernel is currently fairly unstable on the Pumpkin i350
board. For this reason, the driver has primarily been developed against
the Mediatek v5.15-based BSP, and successfully tested there. I managed
to test it on mainline as well, but that requires close to hundred boots
to get a userspace that doesn't segfault. This is why the
v4l2-compliance report below is from a run against the BSP. The thp7312
driver is identical to this version, except for the usage of
.probe_new() on v5.15 that has since been dropped from mainline, and the
return type of the .remove() function that was `int` back then.

If anyone would like to help with getting mainline to run better on the
Pumpkin i350 board, I would  be grateful :-) It would certainly help
maintaining this driver going forward.

# v4l2-compliance -u /dev/v4l-subdev2
v4l2-compliance 1.25.0-5097, 64 bits, 64-bit time_t
v4l2-compliance SHA: b79e00a74fde 2023-09-13 07:19:23

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 5.15.37
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
[  353.331499] thp7312 2-0061: =================  START STATUS  =================
[  353.332515] thp7312 2-0061: Focus, Automatic Continuous: true
[  353.333460] thp7312 2-0061: Focus, Absolute: 0
[  353.334074] thp7312 2-0061: Auto-Focus Method: 2
[  353.334700] thp7312 2-0061: White Balance, Automatic: true
[  353.335432] thp7312 2-0061: Red Balance: 64
[  353.335998] thp7312 2-0061: Blue Balance: 50
[  353.337065] thp7312 2-0061: Brightness: 0
[  353.337627] thp7312 2-0061: Saturation: 10
[  353.338182] thp7312 2-0061: Contrast: 10
[  353.338712] thp7312 2-0061: Sharpness: 8
[  353.339242] thp7312 2-0061: Rotate: 0
[  353.339742] thp7312 2-0061: Auto Exposure, Bias: 0
[  353.340453] thp7312 2-0061: Power Line Frequency: 50 Hz
[  353.341160] thp7312 2-0061: Camera Orientation: Front
[  353.341835] thp7312 2-0061: Camera Sensor Rotation: 0
[  353.342504] thp7312 2-0061: Low Light Compensation: true
[  353.343204] thp7312 2-0061: Noise Reduction Auto: true
[  353.343882] thp7312 2-0061: Noise Reduction Level: 0
[  353.344636] thp7312 2-0061: ==================  END STATUS  ==================
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

 .../bindings/media/i2c/thine,thp7312.yaml     |  225 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/thp7312.rst   |   32 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   16 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 2386 +++++++++++++++++
 include/uapi/linux/thp7312.h                  |   19 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2696 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 include/uapi/linux/thp7312.h


base-commit: a1766a4fd83befa0b34d932d532e7ebb7fab1fa7
-- 
Regards,

Laurent Pinchart

