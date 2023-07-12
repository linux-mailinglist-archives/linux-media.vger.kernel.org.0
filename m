Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03976750FB1
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 19:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbjGLReR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 13:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232644AbjGLReQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 13:34:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D214E196
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 10:34:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [188.20.72.2])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92C518CC;
        Wed, 12 Jul 2023 19:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689183203;
        bh=s1Ksi7jOhpoevoAh43dlZcM6ucChyVNo3269OGKIsVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R1ZJjlylD2haXucZTRr/UEuwsJ1gKTHV6yrd8JKsu5ueUcfmoZS1ixn5FjEOuQzFW
         52Ly/DM06E+SFumK5t9lJTD2rOZPPLAMSlnrhVvwMjPGDSwZI9tZAbKlGY732UlRqz
         3sX/EGEwuVD328rryGmTm39ryfmHWwcU+KPBTHEM=
Date:   Wed, 12 Jul 2023 20:34:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: imx8mp mipi csi camera overlay: Unable to retrieve endpoint for
 port@1
Message-ID: <20230712173414.GB30092@pendragon.ideasonboard.com>
References: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com>
 <CAHCN7xKy8gNz5V+9rdh-GhdYbEAsWpRbhNK-HD-C9D=BSO14+w@mail.gmail.com>
 <CAJ+vNU3gpU6ESBpn1n8+0KxRDOJGXQmZohkQ-iCULr6CVQKu4g@mail.gmail.com>
 <CAHCN7xJmSDsxUdazrKM8Qqk+tVRTW951hHL_cUgj-1YWEho4RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJmSDsxUdazrKM8Qqk+tVRTW951hHL_cUgj-1YWEho4RA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 08:08:51PM -0500, Adam Ford wrote:
> On Mon, Jul 10, 2023 at 7:59 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > On Fri, Jul 7, 2023 at 6:11 PM Adam Ford <aford173@gmail.com> wrote:
> > > On Fri, Jul 7, 2023 at 7:28 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > > >
> > > > Greetings,
> > > >
> > > > I have an imx219 camera connected to an imx8mp-venice-gw74xx via the
> > > > following details:
> > > > - camera is a RaspberryPi Camera v2 -
> > > > https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> > > > - has its own on-board 24MHz osc so no clock is required from the baseboard
> > > > - pin 11 on the camera enables 1.8V and 2.8V LDO which is connected to
> > > > IMX8MP GPIO1_IO1 so we use that as a gpio regulator
> > > > - MIPI_CSI1 lanes 0 and 1 are used
> > > >
> > > > I'm using Linux 6.4 with Laurent's pending patch to add the MIPI CSI
> > > > DT nodes to imx8mp.dtsi [1] as follows:
> > > >
> > > > #include <dt-bindings/gpio/gpio.h>
> > > > #include "imx8mp-pinfunc.h"
> > > >
> > > > /dts-v1/;
> > > > /plugin/;
> > > >
> > > > &{/} {
> > > >         compatible = "gw,imx8mp-gw74xx", "fsl,imx8mp";
> > > >
> > > >         reg_cam: regulator-cam {
> > > >                 pinctrl-names = "default";
> > > >                 pinctrl-0 = <&pinctrl_reg_cam>;
> > > >                 compatible = "regulator-fixed";
> > > >                 regulator-name = "reg_cam";
> > > >                 gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> > > >                 enable-active-high;
> > > >                 regulator-min-microvolt = <1800000>;
> > > >                 regulator-max-microvolt = <1800000>;
> > > >         };
> > > >
> > > >         cam24m: cam24m {
> > > >                 compatible = "fixed-clock";
> > > >                 #clock-cells = <0>;
> > > >                 clock-frequency = <24000000>;
> > > >                 clock-output-names = "cam24m";
> > > >         };
> > > > };
> > > >
> > > > &i2c3 {
> > > >         #address-cells = <1>;
> > > >         #size-cells = <0>;
> > > >
> > > >         imx219: sensor@10 {
> > > >                 compatible = "sony,imx219";
> > > >                 reg = <0x10>;
> > > >                 clocks = <&cam24m>;
> > > >                 VDIG-supply = <&reg_cam>;
> > > >
> > > >                 port {
> > > >                         /* MIPI CSI-2 bus endpoint */
> > > >                         imx219_to_mipi_csi2: endpoint {
> > > >                                 remote-endpoint = <&mipi_csi_0_in>;
> > > >                                 clock-lanes = <0>;
> > > >                                 data-lanes = <1 2>;
> > > >                                 link-frequencies = /bits/ 64 <456000000>;
> > > >                         };
> > > >                 };
> > > >         };
> > > > };
> > > >
> > > > &mipi_csi_0 {
> > > >         status = "okay";
> > > >
> > > >         ports {
> > > >                 port@0 {
> > > >                         mipi_csi_0_in: endpoint {
> > > >                                 remote-endpoint = <&imx219_to_mipi_csi2>;
> > > >                                 data-lanes = <1 2>;
> > > >                         };
> > > >                 };
> > > >         };
> > > > };
> > > >
> > > > &iomuxc {
> > > >         pinctrl_reg_cam: regcamgrp {
> > > >                 fsl,pins = <
> > > >                         MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01     0x41
> > > >                 >;
> > > >         };
> > > > };
> > > >
> > > > imx-mipi-csis fails to probe due to a missing port1 endpoint and I'm
> > > > not clear what to do with that:
> > > > imx-mipi-csis 32e40000.csi: Unable to retrieve endpoint for port@1
> > > > imx-mipi-csis: probe of 32e40000.csi failed with error -2
> > > >
> > > > Any suggestions?
> > >
> > > I think the port needs to point to an ISI node or a ISP node.
> > > Linux-next shows port@1 pointing to  isi_in_0.  In the patch you're
> > > referencing, it appears that node@1 is missing.
> > >
> > > Check out:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=next-20230707&id=9da15c4c850dd53309e07d5611f33655f8f8c05d
> > >
> > > See if that helps.
> > >
> > > adam
> > >
> >
> > Hi Adam,
> >
> > Thanks for the info. I didn't realize those patches were already in
> > linux-next and I missed the fact that the ISI was related to the CSI
> > (so I was missing the ISI patch and enabling that driver).
> >
> > I'm now using 6.5.0-rc1 which has the patches that add CSI and ISI
> > nodes to the imx8mp.dtsi with the following dt fragment:
> > #include <dt-bindings/gpio/gpio.h>
> >
> > #include "imx8mp-pinfunc.h"
> >
> > /dts-v1/;
> > /plugin/;
> >
> > &{/} {
> >         compatible = "gw,imx8mp-gw74xx", "fsl,imx8mp";
> >
> >         reg_cam: regulator-cam {
> >                 pinctrl-names = "default";
> >                 pinctrl-0 = <&pinctrl_reg_cam>;
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "reg_cam";
> >                 gpio = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> >                 enable-active-high;
> >                 regulator-min-microvolt = <1800000>;
> >                 regulator-max-microvolt = <1800000>;
> >         };
> >
> >         cam24m: cam24m {
> >                 compatible = "fixed-clock";
> >                 #clock-cells = <0>;
> >                 clock-frequency = <24000000>;
> >                 clock-output-names = "cam24m";
> >         };
> > };
> >
> > &i2c4 {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >
> >         imx219: sensor@10 {
> >                 compatible = "sony,imx219";
> >                 reg = <0x10>;
> >                 clocks = <&cam24m>;
> >                 VDIG-supply = <&reg_cam>;
> >
> >                 port {
> >                         /* MIPI CSI-2 bus endpoint */
> >                         imx219_to_mipi_csi2: endpoint {
> >                                 remote-endpoint = <&mipi_csi_0_in>;
> >                                 clock-lanes = <0>;
> >                                 data-lanes = <1 2>;
> >                                 link-frequencies = /bits/ 64 <456000000>;
> >                         };
> >                 };
> >         };
> > };
> >
> > &isi_0 {
> >         status = "okay";
> > };
> >
> > &mipi_csi_0 {
> >         status = "okay";
> >
> >         ports {
> >                 port@0 {
> >                         mipi_csi_0_in: endpoint {
> >                                 remote-endpoint = <&imx219_to_mipi_csi2>;
> >                                 data-lanes = <1 2>;
> >                         };
> >                 };
> >         };
> > };
> >
> > &iomuxc {
> >         pinctrl_reg_cam: regcamgrp {
> >                 fsl,pins = <
> >                         MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04     0x41
> >                 >;
> >         };
> > };
> >
> > Now I'm getting:
> > # dmesg | grep imx219
> > [    1.764111] imx219 2-0010: supply VANA not found, using dummy regulator
> > [    1.770953] imx219 2-0010: supply VDDL not found, using dummy regulator
> > [    5.520396] imx219 2-0010: Consider updating driver imx219 to match
> > on endpoints
> > # dmesg | grep mipi
> > [    2.080468] imx-mipi-csis 32e40000.csi: lanes: 2, freq: 500000000
> > # cat /sys/bus/media/devices/media*/model
> > FSL Capture Media Device
> > hantro-vpu
> > hantro-vpu
> > # cat /sys/class/video4linux/video*/name
> > mxc_isi.0.capture
> > mxc_isi.1.capture
> > mxc_isi.m2m
> > nxp,imx8mm-vpu-g1-dec
> > nxp,imx8mq-vpu-g2-dec
> > # media-ctl /dev/media0 -p
> > Media controller API version 6.5.0
> >
> > Media device information
> > ------------------------
> > driver          mxc-isi
> > model           FSL Capture Media Device
> > serial
> > bus info        platform:32e00000.isi
> > hw revision     0x0
> > driver version  6.5.0
> >
> > Device topology
> > - entity 1: crossbar (5 pads, 4 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 <- "csis-32e40000.csi":1 [ENABLED,IMMUTABLE]
> >         pad1: Sink
> >                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >         pad2: Sink
> >                 <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]
> >         pad3: Source
> >                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]
> >         pad4: Source
> >                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]
> >
> > - entity 7: mxc_isi.0 (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  compose.bounds:(0,0)/1920x1080
> >                  compose:(0,0)/1920x1080]
> >                 <- "crossbar":3 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  crop.bounds:(0,0)/1920x1080
> >                  crop:(0,0)/1920x1080]
> >                 -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]
> >
> > - entity 10: mxc_isi.0.capture (1 pad, 1 link)
> >              type Node subtype V4L flags 0
> >              device node name /dev/video0
> >         pad0: Sink
> >                 <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]
> >
> > - entity 18: mxc_isi.1 (2 pads, 2 links)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev2
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  compose.bounds:(0,0)/1920x1080
> >                  compose:(0,0)/1920x1080]
> >                 <- "crossbar":4 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  crop.bounds:(0,0)/1920x1080
> >                  crop:(0,0)/1920x1080]
> >                 -> "mxc_isi.1.capture":0 [ENABLED,IMMUTABLE]
> >
> > - entity 21: mxc_isi.1.capture (1 pad, 1 link)
> >              type Node subtype V4L flags 0
> >              device node name /dev/video1
> >         pad0: Sink
> >                 <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]
> >
> > - entity 29: mxc_isi.output (1 pad, 1 link)
> >              type Node subtype V4L flags 0
> >         pad0: Source
> >                 -> "crossbar":2 [ENABLED,IMMUTABLE]
> >
> > - entity 36: csis-32e40000.csi (2 pads, 2 links)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev3
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/640x480 field:none
> > colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 <- "imx219 3-0010":0 []
> >         pad1: Source
> >                 [fmt:UYVY8_1X16/640x480 field:none
> > colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 -> "crossbar":0 [ENABLED,IMMUTABLE]
> >
> > - entity 41: imx219 3-0010 (1 pad, 1 link)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev4
> >         pad0: Source
> >                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
> > xfer:srgb ycbcr:601 quantization:full-range
> >                  crop.bounds:(8,8)/3280x2464
> >                  crop:(8,8)/3280x2464]
> >                 -> "csis-32e40000.csi":0 []
> >
> > # enable imx219 to csi link
> > media-ctl --device /dev/media0 --links "'imx219
> > 3-0010':0->'csis-32e40000.csi':0[1]"
> >
> > # v4l2-ctl --device /dev/video0 --all
> > Driver Info:
> >         Driver name      : mxc-isi
> >         Card type        : mxc-isi-cap
> >         Bus info         : platform:32e00000.isi
> >         Driver version   : 6.5.0
> >         Capabilities     : 0xa4201000
> >                 Video Capture Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         Device Caps      : 0x24201000
> >                 Video Capture Multiplanar
> >                 Streaming
> >                 Extended Pix Format
> > Media Driver Info:
> >         Driver name      : mxc-isi
> >         Model            : FSL Capture Media Device
> >         Serial           :
> >         Bus info         : platform:32e00000.isi
> >         Media version    : 6.5.0
> >         Hardware revision: 0x00000000 (0)
> >         Driver version   : 6.5.0
> > Interface Info:
> >         ID               : 0x0300000c
> >         Type             : V4L Video
> > Entity Info:
> >         ID               : 0x0000000a (10)
> >         Name             : mxc_isi.0.capture
> >         Function         : V4L2 I/O
> >         Pad 0x0100000b   : 0: Sink
> >           Link 0x0200000e: from remote pad 0x1000009 of entity
> > 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable
> > Priority: 2
> > Video input : 0 (mxc_isi.0.capture: ok)
> > Format Video Capture Multiplanar:
> >         Width/Height      : 640/480
> >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> >         Field             : None
> >         Number of planes  : 1
> >         Flags             :
> >         Colorspace        : sRGB
> >         Transfer Function : sRGB
> >         YCbCr/HSV Encoding: ITU-R 601
> >         Quantization      : Limited Range
> >         Plane 0           :
> >            Bytes per Line : 640
> >            Size Image     : 307200
> >
> > User Controls
> >
> >                 horizontal_flip 0x00980914 (bool)   : default=0 value=0
> >                   vertical_flip 0x00980915 (bool)   : default=0 value=0
> >                 alpha_component 0x00980929 (int)    : min=0 max=255
> > step=1 default=0 value=0
> >
> > # try to capture a frame
> > v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw --stream-count=1
> >                 VIDIOC_STREAMON returned -1 (Broken pipe)
> > ^^^ fails... not sure why
> >
> > # try to use gstreamer
> > gst-launch-1.0 v4l2src device=/dev/video0 !
> > video/x-bayer,format=rggb,width=640,height=480,framerate=10/1 !
> > fakesink
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Pipeline is PREROLLED ...
> > Setting pipeline to PLAYING ...
> > New clock: GstSystemClock
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> > to allocate required memory.
> > Additional debug info:
> > ../sys/v4l2/gstv4l2src.c(759): gst_v4l2src_decide_allocation ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Buffer pool activation failed
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Internal data stream error.
> > Execution ended after 0:00:00.005517125
> > Additional debug info:
> > ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > streaming stopped, reason not-negotiated (-4)
> > Setting pipeline to NULL ...
> > Freeing pipeline ...
> > ^^^ not sure what the memory allocation failure is about. It was
> > complaining about cma memory until I added cma=256M to the cmdline
> >
> > I'm now at the point where I likely need help from the video4linux and
> > linux-media (cc'd) gurus.
> 
> 
> The video format from the camera doesn't match the video format
> through the ISI and the crossbar, so you're getting the broken pipe.
> My experience with the ISI is that they all need to match since the
> ISI isn't an ISP.

I've written a guide that explains how to use the MC and V4L2 subdev
userspace APIs to configure a pipeline. You can find it at
https://git.ideasonboard.org/doc/mc-v4l2.git/. It only assumes knowledge
of the traditional V4L2 API, and should hand-hold you through the rest.
If anything is unclear there, please let me know (or submit a patch
:-)).

> Laurent would likely suggest libcamera, but I haven't used it yet.

How did you know ? :-)

> I'm waiting for the 8MP's ISP driver to get finalized.  However, the
> ISI on the Nano is similar to the ISI on the Plus, so if you want to
> take a look at the patch I did for the Beacon Nano board, it might
> give you some ideas on how to set the video formats.  The patch I
> submitted uses a different video format, but I would expect it to work
> if you change the video format to the RGGB from the IMX219 camera.
> 
> Hopefully this patch [1] can give you some idea on how to set the
> video formats for each of the subdevs.
> 
> adam
> 
> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi?h=v6.5-rc1&id=6bc3ea47332648a4211926ba7afc1e1fb935c71a
> 
> > > > [1] https://patchwork.linuxtv.org/project/linux-media/patch/20230418153104.21337-2-laurent.pinchart@ideasonboard.com/

-- 
Regards,

Laurent Pinchart
