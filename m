Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18EB374E306
	for <lists+linux-media@lfdr.de>; Tue, 11 Jul 2023 03:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjGKBJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 21:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbjGKBJi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 21:09:38 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53CE1A2
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 18:09:08 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-262ff3a4659so3831569a91.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689037743; x=1691629743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jer71B9VnUYREmbz2jVtjaAOR4deu615pV9KRGtlA7U=;
        b=p8q+4wvrxjwqdkfsxg9evumRBG+JXUxq5qy3B/YgIM94oAh3mkYxdfY8V+eW1VWGWi
         vb4tDD3hwOI5a+aOfnai6MNmUuDkA/HsTd66hhKsobVptseLdfkNoZylbLR8/39cOw+h
         L+q0UF1i4PzZA2comI7Hly7p8ckjdpTara67arnXYRTSXAm7XJ4RFDgFYDnrOaloi2Vq
         YgrztRiG4o0KQQp+vETXDr8xwxHbfu4MZMu1U7LjA9tGFlZ22DVuf5vG9sahzjadlVNj
         KL86uebxoUFPIPgXYKbtBOg50Ef0+Olb+MsqGqRovlXQVTWOHaGdz0AxS13mjezXVwJx
         OT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689037743; x=1691629743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jer71B9VnUYREmbz2jVtjaAOR4deu615pV9KRGtlA7U=;
        b=gDRVUluYotqmRb487DPy+3wz/f26bBa1kECkFVto+qArIk1t/UMTbj7xHuDRtDL/uT
         Y9CtBYrNWUBh9LvR7rtd5+QdhRyUqjJgnyaptZ2MIciR0Br/knT9t5j4YyIXmh32LRxk
         kSpIpzfWrtOJT42fQPWJpg7qGo3Hox8yK7ULi+6B0MTMSnaRqfcWo9riwiZREAc0igc/
         IHLVrIqWGDfo5YiGpsC1/EvnvDLFNouB/FZJpmZivFPD39Fj3me8SmsazKSyCx1MvgHF
         dc9YZb+jIS3rJiZKQlM3Crvh0Z7SO/Ezi++7YHXwa5OItlAH2irCgS6UuIQ7SRPyyvP/
         aV0Q==
X-Gm-Message-State: ABy/qLaDRv8dn9a9ZmkJ5CkVz3+vCkMGsUx+mL5R5b+u4XdCTX5PoaxH
        hx2I4uHSPAZTmDbJ0Ux5VsXszOUH1aEjk1mj+rQ=
X-Google-Smtp-Source: APBJJlEi89jhiNKD/jWvSmqMMvbLoKYknHoUv1z/z5vOww1CYstcS3bRB9B/HlPQlQF4Qal4TsaAESDZEH2ftwZ+ACw=
X-Received: by 2002:a17:90b:23c7:b0:263:7d57:16e9 with SMTP id
 md7-20020a17090b23c700b002637d5716e9mr14797395pjb.21.1689037743299; Mon, 10
 Jul 2023 18:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com>
 <CAHCN7xKy8gNz5V+9rdh-GhdYbEAsWpRbhNK-HD-C9D=BSO14+w@mail.gmail.com> <CAJ+vNU3gpU6ESBpn1n8+0KxRDOJGXQmZohkQ-iCULr6CVQKu4g@mail.gmail.com>
In-Reply-To: <CAJ+vNU3gpU6ESBpn1n8+0KxRDOJGXQmZohkQ-iCULr6CVQKu4g@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 10 Jul 2023 20:08:51 -0500
Message-ID: <CAHCN7xJmSDsxUdazrKM8Qqk+tVRTW951hHL_cUgj-1YWEho4RA@mail.gmail.com>
Subject: Re: imx8mp mipi csi camera overlay: Unable to retrieve endpoint for port@1
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 7:59=E2=80=AFPM Tim Harvey <tharvey@gateworks.com> =
wrote:
>
> On Fri, Jul 7, 2023 at 6:11=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
> >
> > On Fri, Jul 7, 2023 at 7:28=E2=80=AFPM Tim Harvey <tharvey@gateworks.co=
m> wrote:
> > >
> > > Greetings,
> > >
> > > I have an imx219 camera connected to an imx8mp-venice-gw74xx via the
> > > following details:
> > > - camera is a RaspberryPi Camera v2 -
> > > https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> > > - has its own on-board 24MHz osc so no clock is required from the bas=
eboard
> > > - pin 11 on the camera enables 1.8V and 2.8V LDO which is connected t=
o
> > > IMX8MP GPIO1_IO1 so we use that as a gpio regulator
> > > - MIPI_CSI1 lanes 0 and 1 are used
> > >
> > > I'm using Linux 6.4 with Laurent's pending patch to add the MIPI CSI
> > > DT nodes to imx8mp.dtsi [1] as follows:
> > >
> > > #include <dt-bindings/gpio/gpio.h>
> > > #include "imx8mp-pinfunc.h"
> > >
> > > /dts-v1/;
> > > /plugin/;
> > >
> > > &{/} {
> > >         compatible =3D "gw,imx8mp-gw74xx", "fsl,imx8mp";
> > >
> > >         reg_cam: regulator-cam {
> > >                 pinctrl-names =3D "default";
> > >                 pinctrl-0 =3D <&pinctrl_reg_cam>;
> > >                 compatible =3D "regulator-fixed";
> > >                 regulator-name =3D "reg_cam";
> > >                 gpio =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> > >                 enable-active-high;
> > >                 regulator-min-microvolt =3D <1800000>;
> > >                 regulator-max-microvolt =3D <1800000>;
> > >         };
> > >
> > >         cam24m: cam24m {
> > >                 compatible =3D "fixed-clock";
> > >                 #clock-cells =3D <0>;
> > >                 clock-frequency =3D <24000000>;
> > >                 clock-output-names =3D "cam24m";
> > >         };
> > > };
> > >
> > > &i2c3 {
> > >         #address-cells =3D <1>;
> > >         #size-cells =3D <0>;
> > >
> > >         imx219: sensor@10 {
> > >                 compatible =3D "sony,imx219";
> > >                 reg =3D <0x10>;
> > >                 clocks =3D <&cam24m>;
> > >                 VDIG-supply =3D <&reg_cam>;
> > >
> > >                 port {
> > >                         /* MIPI CSI-2 bus endpoint */
> > >                         imx219_to_mipi_csi2: endpoint {
> > >                                 remote-endpoint =3D <&mipi_csi_0_in>;
> > >                                 clock-lanes =3D <0>;
> > >                                 data-lanes =3D <1 2>;
> > >                                 link-frequencies =3D /bits/ 64 <45600=
0000>;
> > >                         };
> > >                 };
> > >         };
> > > };
> > >
> > > &mipi_csi_0 {
> > >         status =3D "okay";
> > >
> > >         ports {
> > >                 port@0 {
> > >                         mipi_csi_0_in: endpoint {
> > >                                 remote-endpoint =3D <&imx219_to_mipi_=
csi2>;
> > >                                 data-lanes =3D <1 2>;
> > >                         };
> > >                 };
> > >         };
> > > };
> > >
> > > &iomuxc {
> > >         pinctrl_reg_cam: regcamgrp {
> > >                 fsl,pins =3D <
> > >                         MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01     0x41
> > >                 >;
> > >         };
> > > };
> > >
> > > imx-mipi-csis fails to probe due to a missing port1 endpoint and I'm
> > > not clear what to do with that:
> > > imx-mipi-csis 32e40000.csi: Unable to retrieve endpoint for port@1
> > > imx-mipi-csis: probe of 32e40000.csi failed with error -2
> > >
> > > Any suggestions?
> >
> > I think the port needs to point to an ISI node or a ISP node.
> > Linux-next shows port@1 pointing to  isi_in_0.  In the patch you're
> > referencing, it appears that node@1 is missing.
> >
> > Check out:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=3Dnext-20230707&id=3D9da15c=
4c850dd53309e07d5611f33655f8f8c05d
> >
> > See if that helps.
> >
> > adam
> >
>
> Hi Adam,
>
> Thanks for the info. I didn't realize those patches were already in
> linux-next and I missed the fact that the ISI was related to the CSI
> (so I was missing the ISI patch and enabling that driver).
>
> I'm now using 6.5.0-rc1 which has the patches that add CSI and ISI
> nodes to the imx8mp.dtsi with the following dt fragment:
> #include <dt-bindings/gpio/gpio.h>
>
> #include "imx8mp-pinfunc.h"
>
> /dts-v1/;
> /plugin/;
>
> &{/} {
>         compatible =3D "gw,imx8mp-gw74xx", "fsl,imx8mp";
>
>         reg_cam: regulator-cam {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_reg_cam>;
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "reg_cam";
>                 gpio =3D <&gpio1 4 GPIO_ACTIVE_HIGH>;
>                 enable-active-high;
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <1800000>;
>         };
>
>         cam24m: cam24m {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
>                 clock-frequency =3D <24000000>;
>                 clock-output-names =3D "cam24m";
>         };
> };
>
> &i2c4 {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         imx219: sensor@10 {
>                 compatible =3D "sony,imx219";
>                 reg =3D <0x10>;
>                 clocks =3D <&cam24m>;
>                 VDIG-supply =3D <&reg_cam>;
>
>                 port {
>                         /* MIPI CSI-2 bus endpoint */
>                         imx219_to_mipi_csi2: endpoint {
>                                 remote-endpoint =3D <&mipi_csi_0_in>;
>                                 clock-lanes =3D <0>;
>                                 data-lanes =3D <1 2>;
>                                 link-frequencies =3D /bits/ 64 <456000000=
>;
>                         };
>                 };
>         };
> };
>
> &isi_0 {
>         status =3D "okay";
> };
>
> &mipi_csi_0 {
>         status =3D "okay";
>
>         ports {
>                 port@0 {
>                         mipi_csi_0_in: endpoint {
>                                 remote-endpoint =3D <&imx219_to_mipi_csi2=
>;
>                                 data-lanes =3D <1 2>;
>                         };
>                 };
>         };
> };
>
> &iomuxc {
>         pinctrl_reg_cam: regcamgrp {
>                 fsl,pins =3D <
>                         MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04     0x41
>                 >;
>         };
> };
>
> Now I'm getting:
> # dmesg | grep imx219
> [    1.764111] imx219 2-0010: supply VANA not found, using dummy regulato=
r
> [    1.770953] imx219 2-0010: supply VDDL not found, using dummy regulato=
r
> [    5.520396] imx219 2-0010: Consider updating driver imx219 to match
> on endpoints
> # dmesg | grep mipi
> [    2.080468] imx-mipi-csis 32e40000.csi: lanes: 2, freq: 500000000
> # cat /sys/bus/media/devices/media*/model
> FSL Capture Media Device
> hantro-vpu
> hantro-vpu
> # cat /sys/class/video4linux/video*/name
> mxc_isi.0.capture
> mxc_isi.1.capture
> mxc_isi.m2m
> nxp,imx8mm-vpu-g1-dec
> nxp,imx8mq-vpu-g2-dec
> # media-ctl /dev/media0 -p
> Media controller API version 6.5.0
>
> Media device information
> ------------------------
> driver          mxc-isi
> model           FSL Capture Media Device
> serial
> bus info        platform:32e00000.isi
> hw revision     0x0
> driver version  6.5.0
>
> Device topology
> - entity 1: crossbar (5 pads, 4 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "csis-32e40000.csi":1 [ENABLED,IMMUTABLE]
>         pad1: Sink
>                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>         pad2: Sink
>                 <- "mxc_isi.output":0 [ENABLED,IMMUTABLE]
>         pad3: Source
>                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]
>         pad4: Source
>                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "mxc_isi.1":0 [ENABLED,IMMUTABLE]
>
> - entity 7: mxc_isi.0 (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg
> xfer:srgb ycbcr:601 quantization:full-range
>                  compose.bounds:(0,0)/1920x1080
>                  compose:(0,0)/1920x1080]
>                 <- "crossbar":3 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg
> xfer:srgb ycbcr:601 quantization:full-range
>                  crop.bounds:(0,0)/1920x1080
>                  crop:(0,0)/1920x1080]
>                 -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]
>
> - entity 10: mxc_isi.0.capture (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video0
>         pad0: Sink
>                 <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]
>
> - entity 18: mxc_isi.1 (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev2
>         pad0: Sink
>                 [fmt:UYVY8_1X16/1920x1080 field:none colorspace:jpeg
> xfer:srgb ycbcr:601 quantization:full-range
>                  compose.bounds:(0,0)/1920x1080
>                  compose:(0,0)/1920x1080]
>                 <- "crossbar":4 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:YUV8_1X24/1920x1080 field:none colorspace:jpeg
> xfer:srgb ycbcr:601 quantization:full-range
>                  crop.bounds:(0,0)/1920x1080
>                  crop:(0,0)/1920x1080]
>                 -> "mxc_isi.1.capture":0 [ENABLED,IMMUTABLE]
>
> - entity 21: mxc_isi.1.capture (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video1
>         pad0: Sink
>                 <- "mxc_isi.1":1 [ENABLED,IMMUTABLE]
>
> - entity 29: mxc_isi.output (1 pad, 1 link)
>              type Node subtype V4L flags 0
>         pad0: Source
>                 -> "crossbar":2 [ENABLED,IMMUTABLE]
>
> - entity 36: csis-32e40000.csi (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev3
>         pad0: Sink
>                 [fmt:UYVY8_1X16/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 <- "imx219 3-0010":0 []
>         pad1: Source
>                 [fmt:UYVY8_1X16/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 -> "crossbar":0 [ENABLED,IMMUTABLE]
>
> - entity 41: imx219 3-0010 (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev4
>         pad0: Source
>                 [fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range
>                  crop.bounds:(8,8)/3280x2464
>                  crop:(8,8)/3280x2464]
>                 -> "csis-32e40000.csi":0 []
>
> # enable imx219 to csi link
> media-ctl --device /dev/media0 --links "'imx219
> 3-0010':0->'csis-32e40000.csi':0[1]"
>
> # v4l2-ctl --device /dev/video0 --all
> Driver Info:
>         Driver name      : mxc-isi
>         Card type        : mxc-isi-cap
>         Bus info         : platform:32e00000.isi
>         Driver version   : 6.5.0
>         Capabilities     : 0xa4201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x24201000
>                 Video Capture Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : mxc-isi
>         Model            : FSL Capture Media Device
>         Serial           :
>         Bus info         : platform:32e00000.isi
>         Media version    : 6.5.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 6.5.0
> Interface Info:
>         ID               : 0x0300000c
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x0000000a (10)
>         Name             : mxc_isi.0.capture
>         Function         : V4L2 I/O
>         Pad 0x0100000b   : 0: Sink
>           Link 0x0200000e: from remote pad 0x1000009 of entity
> 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable
> Priority: 2
> Video input : 0 (mxc_isi.0.capture: ok)
> Format Video Capture Multiplanar:
>         Width/Height      : 640/480
>         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
>         Field             : None
>         Number of planes  : 1
>         Flags             :
>         Colorspace        : sRGB
>         Transfer Function : sRGB
>         YCbCr/HSV Encoding: ITU-R 601
>         Quantization      : Limited Range
>         Plane 0           :
>            Bytes per Line : 640
>            Size Image     : 307200
>
> User Controls
>
>                 horizontal_flip 0x00980914 (bool)   : default=3D0 value=
=3D0
>                   vertical_flip 0x00980915 (bool)   : default=3D0 value=
=3D0
>                 alpha_component 0x00980929 (int)    : min=3D0 max=3D255
> step=3D1 default=3D0 value=3D0
>
> # try to capture a frame
> v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=3Dx.raw --stream-=
count=3D1
>                 VIDIOC_STREAMON returned -1 (Broken pipe)
> ^^^ fails... not sure why
>
> # try to use gstreamer
> gst-launch-1.0 v4l2src device=3D/dev/video0 !
> video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
> fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> ../sys/v4l2/gstv4l2src.c(759): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Internal data stream error.
> Execution ended after 0:00:00.005517125
> Additional debug info:
> ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> Setting pipeline to NULL ...
> Freeing pipeline ...
> ^^^ not sure what the memory allocation failure is about. It was
> complaining about cma memory until I added cma=3D256M to the cmdline
>
> I'm now at the point where I likely need help from the video4linux and
> linux-media (cc'd) gurus.


The video format from the camera doesn't match the video format
through the ISI and the crossbar, so you're getting the broken pipe.
My experience with the ISI is that they all need to match since the
ISI isn't an ISP.
Laurent would likely suggest libcamera, but I haven't used it yet.
I'm waiting for the 8MP's ISP driver to get finalized.  However, the
ISI on the Nano is similar to the ISI on the Plus, so if you want to
take a look at the patch I did for the Beacon Nano board, it might
give you some ideas on how to set the video formats.  The patch I
submitted uses a different video format, but I would expect it to work
if you change the video format to the RGGB from the IMX219 camera.

Hopefully this patch [1] can give you some idea on how to set the
video formats for each of the subdevs.

adam

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi?h=3Dv6.5-rc=
1&id=3D6bc3ea47332648a4211926ba7afc1e1fb935c71a

>
> best regards,
>
> Tim
>
>
>
> >
> > >
> > > Best regards,
> > >
> > > Tim
> > > [1] https://patchwork.linuxtv.org/project/linux-media/patch/202304181=
53104.21337-2-laurent.pinchart@ideasonboard.com/
