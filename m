Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94CBF7C6E82
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 14:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343995AbjJLMx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 08:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343867AbjJLMx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 08:53:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8ACE91;
        Thu, 12 Oct 2023 05:53:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 544B47FC;
        Thu, 12 Oct 2023 14:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697115200;
        bh=jfmNcgh7uAOZlzRx94YU82ELNUgJ5za28cq9/WfJDEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JnQIH0og0gU+Fl0dFwNKehs8GCN39qgCkBW6BWRWYkg61xco5cYbi0UYKuVlVDoKg
         r6fI+oDiqF+j+1FjNEDzrppPMDWQI6ZnXjLqrDJuhVP3mbJjSB9UkK1b6WbGvX93cC
         EOThTVZJR1YNSqQstdPqJiurm8YqrLex00CIVTlA=
Date:   Thu, 12 Oct 2023 15:53:30 +0300
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
Subject: Re: [PATCH v2 0/3] media: i2c: Add driver for THine THP7312 ISP
Message-ID: <20231012125330.GB11243@pendragon.ideasonboard.com>
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 12, 2023 at 04:20:13AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds a new driver for the THine THP7312 ISP. It has
> been tested on an OLogic Pumpkin i350, which has a Mediatek MT8365 SoC,
> with the THine THSCG101 camera module.
> 
> Technically the driver itself (and its bindings) have no dependencies,
> but to run/test this on the Pumpkin i350 with the mainline kernel, a
> large number of patches are needed to support the board and the MT8365
> SoC. Some of those patches are on their way to mainline, and some, like
> the Pumpkin i350 board device tree, will require more work. For
> convenience and reference, the needed patches are available in [1].
> Example overlays for DT integration of the THP7312 are available in that
> branch, in [2].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.6/pumpkin/camera
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?h=mtk/v6.6/pumpkin/camera&id=e5fd74796c3e0973991bab2692a3534ed1a23d86
> 
> Compared to v1, this is a near complete rewrite of the driver that has
> taken (to my knowledge) all review comments into account.
> 
> Below is the mandatory v4l2-compliance report. Careful readers may
> notice that my v4l2-utils version is three commits behind upstream, but
> that makes no practical difference as those commits are not related to
> v4l2-compliance.
> 
> The mainline kernel is currently fairly unstable on the Pumpkin i350
> board. For this reason, the driver has primarily been developed against
> the Mediatek v5.15-based BSP, and successfully tested there. I managed
> to test it on mainline as well, but that requires close to hundred boots
> to get a userspace that doesn't segfault. This is why the
> v4l2-compliance report below is from a run against the BSP. The thp7312
> driver is identical to this version, except for the usage of
> .probe_new() on v5.15 that has since been dropped from mainline, and the
> return type of the .remove() function that was `int` back then.
> 
> If anyone would like to help with getting mainline to run better on the
> Pumpkin i350 board, I would  be grateful :-) It would certainly help
> maintaining this driver going forward.

It turned out not to be too complex after all:

commit f39c64ed01f56dbac5a3a3570cb3214f18a3ffec
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Thu Oct 12 04:21:49 2023 +0300

    arm64: dts: mediatek: mt8365-pumpkin: Add reserved memory region for BL31

    The Pumpkin i350 boot loader doesn't seem to populate reserved memory
    regions in the device tree, forcing them to be described statically. The
    mt8365-pumpkin device tree already includes a reserved memory region for
    BL32, which seems enough for proper operation with the Mediatek
    v5.15-based BSP kernel.

    With the mainline kernel, however, userspace processes currently crash
    very randomly. Adding a reserved memory region for BL31, copied from the
    mt8365-evk device tree, fixes the issue.

    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
index 8924bb8dae17..465c20e174da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts
@@ -52,6 +52,12 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;

+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		bl31_secmon_reserved: secmon@43000000 {
+			no-map;
+			reg = <0 0x43000000 0 0x30000>;
+		};
+
 		/* 12 MiB reserved for OP-TEE (BL32)
 		 * +-----------------------+ 0x43e0_0000
 		 * |      SHMEM 2MiB       |


I've updated the mtk/v6.6/pumpkin/camera branch linked above, and can
now run v4l2-compliance reliably on v6.6-rc5. Apart from the driver
version now being 6.6.0, the output is the same.

> # v4l2-compliance -u /dev/v4l-subdev2
> v4l2-compliance 1.25.0-5097, 64 bits, 64-bit time_t
> v4l2-compliance SHA: b79e00a74fde 2023-09-13 07:19:23
> 
> Compliance test for device /dev/v4l-subdev2:
> 
> Driver Info:
>         Driver version   : 5.15.37
>         Capabilities     : 0x00000000
> 
> Required ioctls:
>         test VIDIOC_SUDBEV_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/v4l-subdev2 open: OK
>         test VIDIOC_SUBDEV_QUERYCAP: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
> [  353.331499] thp7312 2-0061: =================  START STATUS  =================
> [  353.332515] thp7312 2-0061: Focus, Automatic Continuous: true
> [  353.333460] thp7312 2-0061: Focus, Absolute: 0
> [  353.334074] thp7312 2-0061: Auto-Focus Method: 2
> [  353.334700] thp7312 2-0061: White Balance, Automatic: true
> [  353.335432] thp7312 2-0061: Red Balance: 64
> [  353.335998] thp7312 2-0061: Blue Balance: 50
> [  353.337065] thp7312 2-0061: Brightness: 0
> [  353.337627] thp7312 2-0061: Saturation: 10
> [  353.338182] thp7312 2-0061: Contrast: 10
> [  353.338712] thp7312 2-0061: Sharpness: 8
> [  353.339242] thp7312 2-0061: Rotate: 0
> [  353.339742] thp7312 2-0061: Auto Exposure, Bias: 0
> [  353.340453] thp7312 2-0061: Power Line Frequency: 50 Hz
> [  353.341160] thp7312 2-0061: Camera Orientation: Front
> [  353.341835] thp7312 2-0061: Camera Sensor Rotation: 0
> [  353.342504] thp7312 2-0061: Low Light Compensation: true
> [  353.343204] thp7312 2-0061: Noise Reduction Auto: true
> [  353.343882] thp7312 2-0061: Noise Reduction Level: 0
> [  353.344636] thp7312 2-0061: ==================  END STATUS  ==================
>         test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 17 Private Controls: 4
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev2: 43, Succeeded: 43, Failed: 0, Warnings: 0
> 
> Laurent Pinchart (1):
>   media: uapi: Add controls for the THP7312 ISP
> 
> Paul Elder (2):
>   dt-bindings: media: Add bindings for THine THP7312 ISP
>   media: i2c: Add driver for THine THP7312
> 
>  .../bindings/media/i2c/thine,thp7312.yaml     |  225 ++
>  .../userspace-api/media/drivers/index.rst     |    1 +
>  .../userspace-api/media/drivers/thp7312.rst   |   32 +
>  MAINTAINERS                                   |   10 +
>  drivers/media/i2c/Kconfig                     |   16 +
>  drivers/media/i2c/Makefile                    |    1 +
>  drivers/media/i2c/thp7312.c                   | 2386 +++++++++++++++++
>  include/uapi/linux/thp7312.h                  |   19 +
>  include/uapi/linux/v4l2-controls.h            |    6 +
>  9 files changed, 2696 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
>  create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
>  create mode 100644 drivers/media/i2c/thp7312.c
>  create mode 100644 include/uapi/linux/thp7312.h
> 
> 
> base-commit: a1766a4fd83befa0b34d932d532e7ebb7fab1fa7

-- 
Regards,

Laurent Pinchart
