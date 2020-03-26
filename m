Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60D21946D9
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 19:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgCZS4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 14:56:33 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:34200 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgCZS4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 14:56:33 -0400
Received: by mail-lj1-f169.google.com with SMTP id p10so7379581ljn.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FQJjc+2AYMJ+DoiAAXqGVIXuEYW03Rs6ihqQ1f+H9Qc=;
        b=oRU5GBqlXUuC1/7FSSokQFM6PSK6/OUxXntf+Zvt+ssChP/MED2cZTzyQTIxDxODoO
         4MH5mvGbwIPo/OnTw7a8iqRPcIlg70Vqunit6Uit1OK83SCVOO0ndkqqXQRPo3CHEEn9
         hWNgshvWT93d00VexQeX8P93Q1/FQSZiecYyE4PKS6iYTbc1FWyUwMKLGjLgIi7xnjQC
         9+boKeyml7BBQzTnm22XWWIMMKh6BjGHOOnV7piWlO6QdNp63NR1oJwmjRUb9zKV6nPI
         wMZUIwYARHaq9DC73B7Xf1t6BRQUzCZZ0ExJICSiBrnZ9Wl5NCAMQNphEPofr6kEtFv/
         zOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FQJjc+2AYMJ+DoiAAXqGVIXuEYW03Rs6ihqQ1f+H9Qc=;
        b=fkM/f0H3WY8VcrjScDd5NHdHjCjf0775Ad/N93VRi5KtV6nRfSUh15jsW9V+ZifiZ1
         OQU6pNM2p9I7fMYFeH0dUerPN1i0LAguUFmVSi3ol3b5zXO++NEKVJnjZ97Nqpyr/BYm
         B70ZwbUsseKtyXZWVRilBkduoYFAS4d0vANXpkrf0o/st0hm2n8zruh1YbWT+FmvL6RH
         MkK7o0bmyrWuI2jTRbsFF/JAjVG4ZliRegfhXS87EoCe/P0Fiothu5HCf3KhQUOm8cQb
         fgJcAwIcmEwm3TmnpQLA6NXsQqPrOoxi5dQ6stqJkRHievgZau8iaofiOiVmd+pR20SZ
         oZ/w==
X-Gm-Message-State: AGi0PuZpbBX0fE4O/04b2Al2CZwVq6nuWDT1+HbcxMOderbXNw/vljwB
        FWHbIO4yR0ygS/HR1JC2mf0FhLChTkb3HaK9iRZw1Soq
X-Google-Smtp-Source: ADFU+vv7lt3HmPtx0nt6ThQlOqn2LQPGfH/4H1MALcpLdApaKfGVBqfGU51Hi9cd8ebhEto4v716yphtaK/pbRh1Gcs=
X-Received: by 2002:a2e:a0d3:: with SMTP id f19mr5929175ljm.117.1585248988788;
 Thu, 26 Mar 2020 11:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
In-Reply-To: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 26 Mar 2020 15:56:20 -0300
Message-ID: <CAOMZO5B3NXBEmQdUqKDSTYpf=Y5LLZYz7mJLqRMh8T3+O6WvqA@mail.gmail.com>
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
To:     =?UTF-8?B?0JzQuNGF0LDQudC70L7QsiDQkNC70LXQutGB0LXQuSDQkNC90LDRgtC+0LvRjNC10LLQuNGH?= 
        <minimumlaw@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding Steve and Philipp in case they have some ideas.


On Thu, Mar 26, 2020 at 5:30 AM =D0=9C=D0=B8=D1=85=D0=B0=D0=B9=D0=BB=D0=BE=
=D0=B2 =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 =D0=90=D0=BD=D0=B0=D1=82=
=D0=BE=D0=BB=D1=8C=D0=B5=D0=B2=D0=B8=D1=87
<minimumlaw@gmail.com> wrote:
>
> Hi!
>
> We build custom CPU Module with NXP/Freescale IMX6QuadPlus CPU.I use
> latest stable kernel from kernel.org. This time kernel version 5.5.11.
> Also I connect to I.MX MIPI cameras from RaspberryPI (Rev 2.1 with Sony
> IMX219). For IMX219 used actual driver from [1]. Usersapce based on
> Gentoo Linux, have media-utils version 1.2.1, v4l2-utils version 1.18.0,
> gstreamer version 1.14.5 with v4l2 plugins. Also Wayland version 1.17
> based graphics with XWayland.
>
> Camera write in DTB:
> =3D=3D=3D=3D cut: DTB fragments =3D=3D=3D=3D
> / {
> [skiped]
>         imx219_clk: camera-clk {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
>                 clock-frequency =3D <24000000>;
>         };
>
>         imx219_1v2_reg: cam1v2_regulator {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "IMX219_1V2";
>                 regulator-min-microvolt =3D <1200000>;
>                 regulator-max-microvolt =3D <1200000>;
>                 vin-supply =3D <&p3v3_reg>;
>                 regulator-always-on;
>         };
>
>         imx219_1v8_reg: cam1v8_regulator {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "IMX219_1V8";
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <1800000>;
>                 vin-supply =3D <&p3v3_reg>;
>                 regulator-always-on;
>         };
>
>         imx219_2v8_reg: cam2v8_regulator {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "IMX219_2V8";
>                 regulator-min-microvolt =3D <2800000>;
>                 regulator-max-microvolt =3D <2800000>;
>                 vin-supply =3D <&p3v3_reg>;
>                 regulator-always-on;
>         };
> [skiped]
> csi_i2c: i2c-mux@1 { /* CSI camera */
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>         reg =3D <1>;
>         sensor@10 {     /* Raspberry Camera V2 */
>                 compatible =3D "sony,imx219";
>                 reg =3D <0x10>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>                 clocks =3D <&imx219_clk>;
>                 clock-names =3D "xclk";
>                 DOVDD-supply =3D <&imx219_1v8_reg>; /* 1.8v */
>                 AVDD-supply =3D <&imx219_2v8_reg>;  /* 2.8v */
>                 DVDD-supply =3D <&imx219_1v2_reg>;  /* 1.2v */
>
>                 port {
>                         csi_sensor_out: endpoint {
>                                 remote-endpoint =3D <&csi_port_in>;
>                                 link-frequencies =3D /bits/ 64 <456000000=
>;
>                                 clock-lanes =3D <0>;
>                                 data-lanes =3D <1 2>;
>                         };
>                 };
>         };
> };
> [skiped]
> &mipi_csi {
>         status =3D "okay";
>
>         port@0 {
>                 reg =3D <0>;
>                 csi_port_in: endpoint {
>                         remote-endpoint =3D <&csi_sensor_out>;
>                         clock-lanes =3D <0>;
>                         data-lanes =3D <1 2>;
>                 };
>         };
> };
> [skiped]
> =3D=3D=3D=3D cut: DTB fragments =3D=3D=3D=3D
>
> I use script for init connected camera
>
> =3D=3D=3D=3D cut: Camera init script =3D=3D=3D
> #!/bin/bash
>
> # sensor output format and resolutions
> # RaspberryPI Camera rev 2.1 (Sony I.MX219)
> I_FORMAT=3DSRGGB10_1X10
> I_RESOLUTION=3D1920x1080
> CROP=3D(0,0)/640x480
>
> # capture format and resolution
> O_FORMAT=3DAYUV32
> O_RESOLUTION=3D640x480
>
> # viewport format and resolution
> V_FORMAT=3DAYUV32
> V_RESOLUTION=3D640x480
>
> # Reset all media links
> media-ctl -r
>
> # Sersor to IPU and PRP path
> # RaspberryPI Camera rev 2.1 (Sony I.MX219)
> media-ctl -l "'imx219 9-0010':0 -> 'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> media-ctl -l "'ipu1_csi1':1 -> 'ipu1_ic_prp':0[1]"
> # media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]" # /dev/video3
> (unused, unprocessed)
> # IPU to capture
> media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
> media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]" #
> /dev/video1
> # IPU to viewport
> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]" #
> /dev/video2
>
> # RaspberryPI Camera rev 2.1 (Sony I.MX219)
> media-ctl -V "'imx219 9-0010':0 [fmt:${I_FORMAT}/${I_RESOLUTION}
> field:none]"
> media-ctl -V "'imx6-mipi-csi2':2 [fmt:${I_FORMAT}/${I_RESOLUTION}
> field:none]"
> media-ctl -V "'ipu1_csi1':0 [crop:${CROP}]"
> media-ctl -V "'ipu1_csi1':1 [fmt:${I_FORMAT}/${O_RESOLUTION} field:none]"
>
> media-ctl -V "'ipu1_ic_prp':1 [fmt:${O_FORMAT}/${O_RESOLUTION} field:none=
]"
> media-ctl -V "'ipu1_ic_prpenc':1 [fmt:${O_FORMAT}/${O_RESOLUTION}
> field:none]"
>
> media-ctl -V "'ipu1_ic_prp':2 [fmt:${V_FORMAT}/${V_RESOLUTION} field:none=
]"
> media-ctl -V "'ipu1_ic_prpvf':1 [fmt:${V_FORMAT}/${V_RESOLUTION}
> field:none]"
> =3D=3D=3D=3D cut: Camera init script =3D=3D=3D
>
> I try start system with V2.1 camera and start capture frames:
> [...]
> # ./camera_init.sh
> # gst-launch-1.0 -v v4l2src device=3D/dev/video2 ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D
> video/x-raw, format=3D(string)YUY2, framerate=3D(fraction)30000/1001,
> width=3D(int)640, height=3D(int)480, colorimetry=3D(string)2:4:7:1,
> interlace-mode=3D(string)progressive
> /GstPipeline:pipeline0/GstFakeSink:fakesink0.GstPad:sink: caps =3D
> video/x-raw, format=3D(string)YUY2, framerate=3D(fraction)30000/1001,
> width=3D(int)640, height=3D(int)480, colorimetry=3D(string)2:4:7:1,
> interlace-mode=3D(string)progressive
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> /var/tmp/portage/media-plugins/gst-plugins-v4l2-1.14.5/work/gst-plugins-g=
ood-1.14.5/sys/v4l2/gstv4l2src.c(656):
> gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.014952667
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
> # media-ctl -p
> Media controller API version 5.5.13
>
> Media device information
> ------------------------
> driver          imx-media
> model           imx-media
> serial
> bus info
> hw revision     0x0
> driver version  5.5.13
>
> Device topology
> [...]
> - entity 15: ipu1_ic_prp (3 pads, 5 links)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev2
>          pad0: Sink
>                  [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  <- "ipu1_csi0":1 []
>                  <- "ipu1_vdic":2 []
>                  <- "ipu1_csi1":1 [ENABLED]
>          pad1: Source
>                  [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu1_ic_prpenc":0 [ENABLED]
>          pad2: Source
>                  [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu1_ic_prpvf":0 [ENABLED]
>
> - entity 19: ipu1_ic_prpenc (2 pads, 2 links)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev3
>          pad0: Sink
>                  [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  <- "ipu1_ic_prp":1 [ENABLED]
>          pad1: Source
>                  [fmt:AYUV8_1X32/640x480@1/30 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                  -> "ipu1_ic_prpenc capture":0 [ENABLED]
>
> - entity 22: ipu1_ic_prpenc capture (1 pad, 1 link)
>               type Node subtype V4L flags 0
>               device node name /dev/video1
>          pad0: Sink
>                  <- "ipu1_ic_prpenc":1 [ENABLED]
>
> - entity 28: ipu1_ic_prpvf (2 pads, 2 links)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev4
>          pad0: Sink
>                  [fmt:AYUV8_1X32/640x480@1001/30000 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>                  <- "ipu1_ic_prp":2 [ENABLED]
>          pad1: Source
>                  [fmt:AYUV8_1X32/640x480@1001/30000 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                  -> "ipu1_ic_prpvf capture":0 [ENABLED]
>
> - entity 31: ipu1_ic_prpvf capture (1 pad, 1 link)
>               type Node subtype V4L flags 0
>               device node name /dev/video2
>          pad0: Sink
>                  <- "ipu1_ic_prpvf":1 [ENABLED]
>
> - entity 47: ipu1_csi1 (3 pads, 4 links)
>               type V4L2 subdev subtype Unknown flags 0
>               device node name /dev/v4l-subdev5
>          pad0: Sink
>                  [fmt:SRGGB10_1X10/1920x1080@1/30 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
>                   crop.bounds:(0,0)/1920x1080
>                   crop:(0,0)/640x480
>                   compose.bounds:(0,0)/640x480
>                   compose:(0,0)/640x480]
>                  <- "imx6-mipi-csi2":2 [ENABLED]
>          pad1: Source
>                  [fmt:SRGGB10_1X10/640x480@1/30 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu1_ic_prp":0 [ENABLED]
>                  -> "ipu1_vdic":0 []
>          pad2: Source
>                  [fmt:SRGGB10_1X10/640x480@1/30 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu1_csi1 capture":0 []
> [...]
> - entity 121: imx6-mipi-csi2 (5 pads, 5 links)
>                type V4L2 subdev subtype Unknown flags 0
>                device node name /dev/v4l-subdev12
>          pad0: Sink
>                  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  <- "imx219 9-0010":0 [ENABLED]
>          pad1: Source
>                  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu1_csi0_mux":0 []
>          pad2: Source
>                  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu1_csi1":0 [ENABLED]
>          pad3: Source
>                  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu2_csi0":0 []
>          pad4: Source
>                  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "ipu2_csi1_mux":0 []
> [...]
> - entity 135: imx219 9-0010 (1 pad, 1 link)
>                type V4L2 subdev subtype Sensor flags 0
>                device node name /dev/v4l-subdev15
>          pad0: Source
>                  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                  -> "imx6-mipi-csi2":0 [ENABLED]
> localhost ~ # dmesg -c
> [...]
> [   51.941858] ipu1_ic_prpvf: pipeline start failed with -32
> localhost ~ #
>
> I think EPIPE (-32) caused by link between pad1 ipu1_csi1
> (fmt:SRGGB10_1X10/640x480@1/30) and pad0 ipu1_ic_prp
> (fmt:AYUV8_1X32/640x480@1/30) - format mismatch. But I don't know how
> fix this trouble. Theory, I also have RaspberryPI camera rev 1.3 with
> OmniVision OV5647 camera. Unfortunately, she did not work either.
>
> Anybody can help me?
>
> [1] https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/imx219.=
c
