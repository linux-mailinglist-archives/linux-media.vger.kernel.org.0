Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E6D752E91
	for <lists+linux-media@lfdr.de>; Fri, 14 Jul 2023 03:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbjGNBeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 21:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjGNBea (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 21:34:30 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE922D48
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 18:34:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so2437550e87.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 18:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689298467; x=1691890467;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wMAdkmHMOyafQ1a5jjAEVCPH3YLHv42tt24VqxNJPnQ=;
        b=eJJXo9XeomaxTKZcR3FaeqLCH2IXBKOJAOuHW/PG1QAvHY/jZiuZsoGDJ8QJfAz7yD
         31vsnV2/VEqgrzOEvUZDZ0Y92hYcS/WKDEhXBGRhTh2JDAJD7W2v+bEW1HX4XILp8k3L
         xPbB3rzUU60366zSPeeaLGWh+324nZlTyP+e9uuK+K+SS1enZE8jv7xQttslZgsdnS/a
         vEEHIEnPbUwb5bK5lA7PjYSUIQNMjuQC20765JmYea4S/2dCkFaNsq8AoXCABtuxkHSO
         SviZyy6Lf92xMo6jZJTEuOS8+uq9Zt5cRzm7IUAa1iXaDtUzWEf4Hp9sBi6M4S9Ht8ua
         bZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689298467; x=1691890467;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wMAdkmHMOyafQ1a5jjAEVCPH3YLHv42tt24VqxNJPnQ=;
        b=bo2enj9WiDiDZs7S7ANaixnW9a/ySEktKmnAFxQR2vBy7OMZKZ0wj941K3v8nNEKmO
         Rh+mkoWBVVKtsPmwGK36YKsMurHTZ+W0zm4gYU5Qy2HPqjyCl3/qh3AtF5a9NV9ybWU2
         5Hvwu9IyCjx1lc6nUvRwCI2JbjdhDjxknmVftGNtOLNLxWZvHPK4oEWRzngcj9WzD9Yy
         ggGgBPgdWK3F2vI6qe3Ys4MpdGYH5lL/rlWRq5xsle7qQ83Kz06TPwXooLn+TtGEUtVH
         R/Y7C+tM4Tce1J09UXcyb3DJ67k0F2rLpiro5ic1WGfQsiiQiyf3CgJq9M0N9yj2qCzt
         h4ng==
X-Gm-Message-State: ABy/qLZLfeQI1PiklqYCsh6r5oYwxt0ED1Kl/tcHUXADpN5oLd8qp5bx
        7vQbOFgpc0G8dLAWAUvzlK08LkVi2GvW3Y6hiZxyeZFMqHoJ0bPK2e8=
X-Google-Smtp-Source: APBJJlFWXeJeIk2Xb8wit9R55KrMg/WMxVwY4EzT/3PcDomS5wdZS3gjZHVLUTuIY8YeKHOJwWDmu6+w5AafbjeqIMI=
X-Received: by 2002:a19:6748:0:b0:4fb:7666:3bbf with SMTP id
 e8-20020a196748000000b004fb76663bbfmr1985616lfj.26.1689298467189; Thu, 13 Jul
 2023 18:34:27 -0700 (PDT)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 13 Jul 2023 18:34:15 -0700
Message-ID: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
Subject: Re: media: imx: imx7-media-csi: Get rid of superfluous call to
 imx7_csi_mbus_fm t_to_pix_fmt
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Alexander,

I found that commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get
rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") introduced
an issue causing me to not be able to capture anymore on an imx8mm
with an imx219 camera.

I'm using a RaspberryPi Camera v2 which has an IMX219 8MP camera module:
- https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
- has its own on-board 24MHz osc so no clock required from baseboard
- pin 11 enables 1.8V and 2.8V LDO which is connected to a GPIO I use
as a regulator enable

I'm using the imx8mm-venice-gw72xx-0x-imx219 dt overlay [1] to test this.

Here is some additional information about how I'm using the camera module:
# cat /sys/bus/media/devices/media*/model
imx-media
hantro-vpu
hantro-vpu
# cat /sys/class/video4linux/video*/name
csi capture
nxp,imx8mm-vpu-g1-dec
nxp,imx8mq-vpu-g2-dec
# enable imx219 to csi link
media-ctl --reset
media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
# configure for 640x480 raw8
media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:none]"
media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
# configure for RGGB (8-bit bayer), 640x480 resolution
v4l2-ctl --device /dev/video0
--set-fmt-video=width=640,height=480,pixelformat=RGGB --verbose

before commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get rid of
superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") this would report
back 640x480 resolution:
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture:
        Width/Height      : 640/480
        Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
        Field             : None
        Bytes per Line    : 640
        Size Image        : 307200
        Colorspace        : Default
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :

And after the commit it reports back an invalid 768x480 resolution:
VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture:
        Width/Height      : 768/480
        Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
        Field             : None
        Bytes per Line    : 768
        Size Image        : 368640
        Colorspace        : Default
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :

This resolution and frame size mis-match causes issues for example
when using gstreamer to capture and stream frames.

I noticed you have several outstanding patches pending for
imx7-media-csi... perhaps there is something there you already know of
that addresses this issue?

best regards,

Tim
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtso
