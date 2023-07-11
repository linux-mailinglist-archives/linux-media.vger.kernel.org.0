Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F75C74FACD
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 00:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbjGKWQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jul 2023 18:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjGKWQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jul 2023 18:16:50 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E099F10DD
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 15:16:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6ef9ed2fdso103204621fa.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 15:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689113806; x=1691705806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITizPuesaDfB/yKLLYppJ2HTXSTIHFoGZvuaDIoCkIQ=;
        b=F3onsppppt7uXwGLmop5racspoxORmsf7uinJ9NVXI+5xcPQswBayCiFbFNwU9A8I1
         RZbJ5P4RADB/lgvpL1YC8hE6SYZfhAceUXIgIR5goRoPbnTIvkKqC6JBJ+j7CtMH4KZF
         9WdyYHx94AEn47EsgVcB8ibyI47Nbel9oYIYS8erV5fbyNxm36ITy2San5KX/zuTFMUz
         2uDxNXArAOUD4iY0hJU27tJ868Em9Y6UYEmmH4kDuCt56YpctsGkKDdL4+N3pfrfjJ9J
         mg5Xn3Slxl0543h8Mf2OSeqpmOIiLge2F7EzvvTHwQOC+VSXA2DIGsC1/osIXflOrFzH
         LlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689113806; x=1691705806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITizPuesaDfB/yKLLYppJ2HTXSTIHFoGZvuaDIoCkIQ=;
        b=cGnPOZEn/qO2UqGr7nOgddr7ehn3MDU5rHMiuOletIk+5InzIVg8kENPQN8ejikDki
         rSJY2OhHtOoqtGp8M9QCS9jueymREuW13AFIzRMYzNYJBlWhzeE1LIjWWes3avcHuJvm
         Dv4Kn5gFZNV6KCgXUAufStNV8OSiKA+ugDumv4Dbq9spfuV1JWMMx/kUUSwuDuECWeCS
         lqPXFWXBoZypHMHWnZNIr/VMxLYCdSJC3jnlMC5mIgwJy0ZDWTCH5n08LpZURiyNiVlM
         kUkpmo9DdcfOzvUNgnaGd2rI6pJkNAHbECxrz/gCxBUwh7iw+GSkWsj+p4FqCTUPiMUv
         ucRw==
X-Gm-Message-State: ABy/qLa6dMLAIRtGNJa2IvxA46V3E6ANpX4DHYi95XYZkHMleNJk8Y2J
        eQ1iIW3WZf45MOiiOhobinMsGN7/1tMAJSaDuqXa6Q==
X-Google-Smtp-Source: APBJJlEv9L8Hnpo3DSiQEkuxueMaWvfJ4KOfZv2aFDBqM32kLpJZgqOFFQNwn0QsAsPOgNf0diUbvWaLbOjEynsRxVI=
X-Received: by 2002:a2e:9196:0:b0:2b6:de52:35a with SMTP id
 f22-20020a2e9196000000b002b6de52035amr15674849ljg.9.1689113805981; Tue, 11
 Jul 2023 15:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com>
 <CAHCN7xKy8gNz5V+9rdh-GhdYbEAsWpRbhNK-HD-C9D=BSO14+w@mail.gmail.com>
 <CAJ+vNU3gpU6ESBpn1n8+0KxRDOJGXQmZohkQ-iCULr6CVQKu4g@mail.gmail.com> <CAHCN7xJmSDsxUdazrKM8Qqk+tVRTW951hHL_cUgj-1YWEho4RA@mail.gmail.com>
In-Reply-To: <CAHCN7xJmSDsxUdazrKM8Qqk+tVRTW951hHL_cUgj-1YWEho4RA@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 11 Jul 2023 15:16:33 -0700
Message-ID: <CAJ+vNU1G0Z-4B9-42fgPFcO+ByA_s3Okpw-8ggcJP3a9+_j1-A@mail.gmail.com>
Subject: Re: imx8mp mipi csi camera overlay: Unable to retrieve endpoint for port@1
To:     Adam Ford <aford173@gmail.com>
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 6:09=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Jul 10, 2023 at 7:59=E2=80=AFPM Tim Harvey <tharvey@gateworks.com=
> wrote:
> >
> > On Fri, Jul 7, 2023 at 6:11=E2=80=AFPM Adam Ford <aford173@gmail.com> w=
rote:
> > >
> > > On Fri, Jul 7, 2023 at 7:28=E2=80=AFPM Tim Harvey <tharvey@gateworks.=
com> wrote:
> > > >
> > > > Greetings,
> > > >
> > > > I have an imx219 camera connected to an imx8mp-venice-gw74xx via th=
e
> > > > following details:
> > > > - camera is a RaspberryPi Camera v2 -
> > > > https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> > > > - has its own on-board 24MHz osc so no clock is required from the b=
aseboard
> > > > - pin 11 on the camera enables 1.8V and 2.8V LDO which is connected=
 to
> > > > IMX8MP GPIO1_IO1 so we use that as a gpio regulator
> > > > - MIPI_CSI1 lanes 0 and 1 are used
> > > >
> > > > I'm using Linux 6.4 with Laurent's pending patch to add the MIPI CS=
I
> > > > DT nodes to imx8mp.dtsi [1] as follows:
> > > >
> > > > #include <dt-bindings/gpio/gpio.h>
> > > > #include "imx8mp-pinfunc.h"
> > > >
> > > > /dts-v1/;
> > > > /plugin/;
> > > >
> > > > &{/} {
> > > >         compatible =3D "gw,imx8mp-gw74xx", "fsl,imx8mp";
> > > >
> > > >         reg_cam: regulator-cam {
> > > >                 pinctrl-names =3D "default";
> > > >                 pinctrl-0 =3D <&pinctrl_reg_cam>;
> > > >                 compatible =3D "regulator-fixed";
> > > >                 regulator-name =3D "reg_cam";
> > > >                 gpio =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> > > >                 enable-active-high;
> > > >                 regulator-min-microvolt =3D <1800000>;
> > > >                 regulator-max-microvolt =3D <1800000>;
> > > >         };
> > > >
> > > >         cam24m: cam24m {
> > > >                 compatible =3D "fixed-clock";
> > > >                 #clock-cells =3D <0>;
> > > >                 clock-frequency =3D <24000000>;
> > > >                 clock-output-names =3D "cam24m";
> > > >         };
> > > > };
> > > >
> > > > &i2c3 {
> > > >         #address-cells =3D <1>;
> > > >         #size-cells =3D <0>;
> > > >
> > > >         imx219: sensor@10 {
> > > >                 compatible =3D "sony,imx219";
> > > >                 reg =3D <0x10>;
> > > >                 clocks =3D <&cam24m>;
> > > >                 VDIG-supply =3D <&reg_cam>;
> > > >
> > > >                 port {
> > > >                         /* MIPI CSI-2 bus endpoint */
> > > >                         imx219_to_mipi_csi2: endpoint {
> > > >                                 remote-endpoint =3D <&mipi_csi_0_in=
>;
> > > >                                 clock-lanes =3D <0>;
> > > >                                 data-lanes =3D <1 2>;
> > > >                                 link-frequencies =3D /bits/ 64 <456=
000000>;
> > > >                         };
> > > >                 };
> > > >         };
> > > > };
> > > >
> > > > &mipi_csi_0 {
> > > >         status =3D "okay";
> > > >
> > > >         ports {
> > > >                 port@0 {
> > > >                         mipi_csi_0_in: endpoint {
> > > >                                 remote-endpoint =3D <&imx219_to_mip=
i_csi2>;
> > > >                                 data-lanes =3D <1 2>;
> > > >                         };
> > > >                 };
> > > >         };
> > > > };
> > > >
> > > > &iomuxc {
> > > >         pinctrl_reg_cam: regcamgrp {
> > > >                 fsl,pins =3D <
> > > >                         MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01     0x4=
1
> > > >                 >;
> > > >         };
> > > > };
> > > >
> > > > imx-mipi-csis fails to probe due to a missing port1 endpoint and I'=
m
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
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/arch/arm64/boot/dts/freescale/imx8mp.dtsi?h=3Dnext-20230707&id=3D9da1=
5c4c850dd53309e07d5611f33655f8f8c05d
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
> >         compatible =3D "gw,imx8mp-gw74xx", "fsl,imx8mp";
> >
> >         reg_cam: regulator-cam {
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&pinctrl_reg_cam>;
> >                 compatible =3D "regulator-fixed";
> >                 regulator-name =3D "reg_cam";
> >                 gpio =3D <&gpio1 4 GPIO_ACTIVE_HIGH>;
> >                 enable-active-high;
> >                 regulator-min-microvolt =3D <1800000>;
> >                 regulator-max-microvolt =3D <1800000>;
> >         };
> >
> >         cam24m: cam24m {
> >                 compatible =3D "fixed-clock";
> >                 #clock-cells =3D <0>;
> >                 clock-frequency =3D <24000000>;
> >                 clock-output-names =3D "cam24m";
> >         };
> > };
> >
> > &i2c4 {
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >
> >         imx219: sensor@10 {
> >                 compatible =3D "sony,imx219";
> >                 reg =3D <0x10>;
> >                 clocks =3D <&cam24m>;
> >                 VDIG-supply =3D <&reg_cam>;
> >
> >                 port {
> >                         /* MIPI CSI-2 bus endpoint */
> >                         imx219_to_mipi_csi2: endpoint {
> >                                 remote-endpoint =3D <&mipi_csi_0_in>;
> >                                 clock-lanes =3D <0>;
> >                                 data-lanes =3D <1 2>;
> >                                 link-frequencies =3D /bits/ 64 <4560000=
00>;
> >                         };
> >                 };
> >         };
> > };
> >
> > &isi_0 {
> >         status =3D "okay";
> > };
> >
> > &mipi_csi_0 {
> >         status =3D "okay";
> >
> >         ports {
> >                 port@0 {
> >                         mipi_csi_0_in: endpoint {
> >                                 remote-endpoint =3D <&imx219_to_mipi_cs=
i2>;
> >                                 data-lanes =3D <1 2>;
> >                         };
> >                 };
> >         };
> > };
> >
> > &iomuxc {
> >         pinctrl_reg_cam: regcamgrp {
> >                 fsl,pins =3D <
> >                         MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04     0x41
> >                 >;
> >         };
> > };
> >
> > Now I'm getting:
> > # dmesg | grep imx219
> > [    1.764111] imx219 2-0010: supply VANA not found, using dummy regula=
tor
> > [    1.770953] imx219 2-0010: supply VDDL not found, using dummy regula=
tor
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
> >                 horizontal_flip 0x00980914 (bool)   : default=3D0 value=
=3D0
> >                   vertical_flip 0x00980915 (bool)   : default=3D0 value=
=3D0
> >                 alpha_component 0x00980929 (int)    : min=3D0 max=3D255
> > step=3D1 default=3D0 value=3D0
> >
> > # try to capture a frame
> > v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=3Dx.raw --strea=
m-count=3D1
> >                 VIDIOC_STREAMON returned -1 (Broken pipe)
> > ^^^ fails... not sure why
> >
> > # try to use gstreamer
> > gst-launch-1.0 v4l2src device=3D/dev/video0 !
> > video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1 !
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
> > complaining about cma memory until I added cma=3D256M to the cmdline
> >
> > I'm now at the point where I likely need help from the video4linux and
> > linux-media (cc'd) gurus.
>
>
> The video format from the camera doesn't match the video format
> through the ISI and the crossbar, so you're getting the broken pipe.
> My experience with the ISI is that they all need to match since the
> ISI isn't an ISP.
> Laurent would likely suggest libcamera, but I haven't used it yet.
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
> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/arch/arm64/boot/dts/freescale/imx8mn-beacon-baseboard.dtsi?h=3Dv6.5-=
rc1&id=3D6bc3ea47332648a4211926ba7afc1e1fb935c71a
>

Hi Adam,

Thanks, this helped point me in the right direction and proves the
video capture device works with v4l2.

For the imx219 which can capture 640x480 raw 8bit bayer:
# configure media entities for 8-bit raw bayer 640x480
media-ctl -v -V "'imx219 3-0010':0 [fmt:SRGGB8/640x480 field:none]"
media-ctl -v -V "'crossbar':0 [fmt:SRGGB8/640x480 field:none]"
media-ctl -v -V "'mxc_isi.0':0 [fmt:SRGGB8/640x480 field:none]"
# configure for RGGB (8-bit bayer) 640x480
v4l2-ctl --device /dev/video0
--set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
# capture a frame
v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=3Dframe.raw
--stream-count=3D1
convert -size 640x480 -depth 8 gray:frame.raw frame.png # convert to png
# stream to display
gst-launch-1.0 v4l2src ! \
      video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D10/1=
 ! \
      bayer2rgb ! fbdevsink

best regards,

Tim



Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Setting pipeline to NULL ...
Freeing pipeline ...
