Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AA5438541
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 22:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhJWUh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 16:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhJWUh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 16:37:58 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25123C061714;
        Sat, 23 Oct 2021 13:35:38 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id n10so632620iod.13;
        Sat, 23 Oct 2021 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRz5WNlfSy+sShjmQTbrU6okPHsh3e5rmhOcPLYt3ew=;
        b=fih7jeOAVQfqyL0t/DxOEXEUlf4DkadilKBrl72TnKq9XBl/BqiU3hil+k5/BK+F/9
         bSZjCOganYq/pimgFyKtIGScOAJEU9lRdVc231en/6uTNa3AbfBus4BbpNbn1bft7OeL
         xm/SEjf4VO2YED08mtIpXghhkjFfTbDL0O4KMN7ZWc4y3MLqSzahJ9NxU2Mz/lPbAmkj
         MtoTHjI+l4JvTmUbKeApYJJEO5rheqiF3kd1bRrb6sFQHH2OqB1G4aIsRvVs0ETgfYgJ
         2SCaGipjHiU5rDurXgaSBjcbGuz3GJOKzDhEuPgj2z9CP/ljP6IvvU342+70b2yHkqNG
         mg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DRz5WNlfSy+sShjmQTbrU6okPHsh3e5rmhOcPLYt3ew=;
        b=6thqeky1TqUMmbLQBzwrbbzII7KcnN0CDly2HUCaNI4ZtGPe8riFWZB5my5sFYLi0O
         BxYbobIsxRlcxUYkfAOKVFT+A+CBmrpdL3s/VGKO6KDZEYUtZ3wmFn3XiA9r7NdGqVWu
         RpOjOR3pwwoMRH4p1k1ptRHsbZUA3d0EQ0VEnLG9WZCg+VgO+QSdPJvLoLnyl6J+5Tn1
         mbLEk77cRNtcbhgxVOOhCD/K1kDxZpQSJ76dRMY8shH20qNQNEyQtg9KUctQfIc1qZ6I
         mY13XZW7Qa+ByP5DDwCX8ZmUdU2H5BDSkVO3uOkUH3ZnI37HM9taMVJ1q9n0zEeQJTIb
         V3Wg==
X-Gm-Message-State: AOAM532YGbugL1mV3SICxG4Dl+aa1Eg2eW/P3015l7pM/7J6cZ4J+UTE
        nnudJlahhhv9j9H/3r19ww4=
X-Google-Smtp-Source: ABdhPJwm3vVRbunRYhaH6vNvk2l+hvDnbNmQcRxs532CQOIH1W2N4gq8GWdNU7jArQcaqbD2EwBCUQ==
X-Received: by 2002:a05:6602:2c07:: with SMTP id w7mr4886406iov.122.1635021338101;
        Sat, 23 Oct 2021 13:35:38 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:1534:f270:7127:bc0a])
        by smtp.gmail.com with ESMTPSA id i5sm6128678ilj.49.2021.10.23.13.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:35:37 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        cstevens@beaconembedded.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
Date:   Sat, 23 Oct 2021 15:34:51 -0500
Message-Id: <20211023203457.1217821-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx8mm appears to have both a CSI bridge and mipi-csi-2 drivers.  With
those enabled, both the imx8mm-evk and imx8mm-beacon boards should be able
use an OV5640 camera.

The mipi-csi2 driver sets the clock frequency to 333MHz, so the clock parent
of the CSI1 must be reparented to a faster clock.  On the custom NXP kernel,
they use IMX8MM_SYS_PLL2_1000M, so that is done in the device tree to match.

With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
pipeline can be configured with the following:

    media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"

The camera and various nodes in the pipeline can be configured for UYVY:
    media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
    media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"

With that, the media pipeline looks like:


Media controller API version 5.15.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial          
bus info        platform:32e20000.csi
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
		<- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
		-> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
	pad0: Sink
		<- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
	pad0: Sink
		[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
		<- "ov5640 1-003c":0 [ENABLED]
	pad1: Source
		[fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
		-> "csi":0 [ENABLED,IMMUTABLE]

- entity 15: ov5640 1-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
	pad0: Source
		[fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
		-> "imx7-mipi-csis.0":0 [ENABLED]

When configured, gstreamer can be used to capture 1 frame and store it to a file.

gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test

Unfortunately, the video capture never appears to happen.  No errors occur, not
interrupts are recorded and no errors are recorded.

gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to [  114.819632] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
PLAYING ...
New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
Clock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
/GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709


If anyone has any insight as to what might be wrong, I'd like feedback.
I posted a device tree that I beleive goes with the newer imx8mm-evk, but
I do not have this hardware, so I cannot test it.

Adam Ford (5):
  arm64: dts: imx8mm: Add CSI nodes
  arm64: defconfig: Enable VIDEO_IMX_MEDIA
  arm64: dts: imx8mm-beacon: Enable OV5640 Camera
  arm64: defconfig: Enable OV5640
  arm64: dts: imx8mm-evk: Enable OV5640 Camera

 .../freescale/imx8mm-beacon-baseboard.dtsi    | 55 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 44 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     | 55 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  2 +
 4 files changed, 156 insertions(+)

-- 
2.25.1

