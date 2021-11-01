Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEE74423B8
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 00:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhKAXIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 19:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhKAXIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 19:08:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6F5C061764
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 16:05:44 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id n8so2386111plf.4
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9CpEpS1HhrDtahw6Og/fi/QfGmg5lbMtVJGCvxcpCP8=;
        b=olfAbFQ9Fbh/DoH+pVslXII3B39zAgQ5iJEBwDfouTm7CKTKpaX1glpJULxI/SRuWt
         Qcn2h/maYyuByNXbD4vnBIHmB1CXvN5PhII3/1zjqEVBhnL/djtDdmSGjcgmRv8RSn+I
         tLxY+etgUx99Zf/iE8c2fPBTAbal6NmRtI118uZ8b4bbGlMRcMlfcSyoeqKWEXdyFQbF
         o5b2gnUdwiXyqo/tdjEyDxwHfJivtWo5WAAATSmOYnV7ShBF4ENhtkjxHLgHq8047EcP
         NFlxfFBPqbi4odEWOzpZcoozkOl3p7EGvB5ijw77LuWZ5Yl6riDOkTGmYiIs3anvnmos
         y/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9CpEpS1HhrDtahw6Og/fi/QfGmg5lbMtVJGCvxcpCP8=;
        b=yCV/ax427wCXj8CH32ZvY6qEXPkiXpzz3/2bnnQGELxdHCLHx6uJ/Ex2+h7MPge11n
         g84SXcngc/NUeIGZKosvyr9R20TzwO15P/ibAEhePGcRkCHirZv2ovZSl8fa0vriEAb2
         Kq0yFFsGIVtKDCcSzoURdL7AivEF89TZDcIYwRyJP8fWHcWI2dd73yZby2epvkkWnLyN
         hGMD7nTLwj0PGc0wV2oLcVPqAOeVAZnB+DXSL6WUCUijq6nF/Kz8xC0qIKjfoGZ4OOHc
         Hl60shO7jLZo0AuGheCm0/GwhcG1oad8ZYYqcw7hxbnZ/PJPRh9VdxH4vdMu7PukZUaZ
         APXg==
X-Gm-Message-State: AOAM530BGJMeEG9ReZRCx9sA1m5T5hApG4Poo/RPjzlq4qca0Urcu1Ag
        gf2bXp66BQ0s6bwJVU/GNUX9JWQNV4s6NUQBGa8zXg==
X-Google-Smtp-Source: ABdhPJwNF1IYWjIR6wn7XpoAdbeYz0xSMkAmgL6UzGuX3fBuQuqGNIE25yHenpr8hLJbz6WsWz7qg+nSzus8NkVGSP0=
X-Received: by 2002:a17:90b:1e4b:: with SMTP id pi11mr2134594pjb.179.1635807943331;
 Mon, 01 Nov 2021 16:05:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
 <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com> <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de>
In-Reply-To: <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 1 Nov 2021 16:05:32 -0700
Message-ID: <CAJ+vNU0pt73obejn-wnC7QEExRWUAOCfcKRv__4x8+WWdPJsag@mail.gmail.com>
Subject: Re: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
To:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 4:11 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 28.10.21 02:39, Adam Ford wrote:
> > On Sun, Oct 24, 2021 at 7:16 AM Fabio Estevam <festevam@gmail.com> wrot=
e:
> >>
> >> Hi Adam,
> >>
> >> [Adding Frieder on Cc]
> >>
> >> On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.com> wrote:
> >>>
> >>> The imx8mm appears to have both a CSI bridge and mipi-csi-2 drivers. =
 With
> >>> those enabled, both the imx8mm-evk and imx8mm-beacon boards should be=
 able
> >>> use an OV5640 camera.
> >>>
> >>> The mipi-csi2 driver sets the clock frequency to 333MHz, so the clock=
 parent
> >>> of the CSI1 must be reparented to a faster clock.  On the custom NXP =
kernel,
> >>> they use IMX8MM_SYS_PLL2_1000M, so that is done in the device tree to=
 match.
> >>>
> >>> With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the =
media
> >>> pipeline can be configured with the following:
> >>>
> >>>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
> >>>
> >>> The camera and various nodes in the pipeline can be configured for UY=
VY:
> >>>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:=
none]"
> >>>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
> >>>
> >>> With that, the media pipeline looks like:
> >>>
> >>>
> >>> Media controller API version 5.15.0
> >>>
> >>> Media device information
> >>> ------------------------
> >>> driver          imx7-csi
> >>> model           imx-media
> >>> serial
> >>> bus info        platform:32e20000.csi
> >>> hw revision     0x0
> >>> driver version  5.15.0
> >>>
> >>> Device topology
> >>> - entity 1: csi (2 pads, 2 links)
> >>>             type V4L2 subdev subtype Unknown flags 0
> >>>             device node name /dev/v4l-subdev0
> >>>         pad0: Sink
> >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xf=
er:srgb ycbcr:601 quantization:lim-range]
> >>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> >>>         pad1: Source
> >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xf=
er:srgb ycbcr:601 quantization:lim-range]
> >>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 4: csi capture (1 pad, 1 link)
> >>>             type Node subtype V4L flags 0
> >>>             device node name /dev/video0
> >>>         pad0: Sink
> >>>                 <- "csi":1 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> >>>              type V4L2 subdev subtype Unknown flags 0
> >>>              device node name /dev/v4l-subdev1
> >>>         pad0: Sink
> >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte17=
0m xfer:709 ycbcr:601 quantization:lim-range]
> >>>                 <- "ov5640 1-003c":0 [ENABLED]
> >>>         pad1: Source
> >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte17=
0m xfer:709 ycbcr:601 quantization:lim-range]
> >>>                 -> "csi":0 [ENABLED,IMMUTABLE]
> >>>
> >>> - entity 15: ov5640 1-003c (1 pad, 1 link)
> >>>              type V4L2 subdev subtype Sensor flags 0
> >>>              device node name /dev/v4l-subdev2
> >>>         pad0: Source
> >>>                 [fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:sr=
gb xfer:srgb ycbcr:601 quantization:full-range]
> >>>                 -> "imx7-mipi-csis.0":0 [ENABLED]
> >>>
> >>> When configured, gstreamer can be used to capture 1 frame and store i=
t to a file.
> >>>
> >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,format=3DUYVY=
,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3Dtest
> >>>
> >>> Unfortunately, the video capture never appears to happen.  No errors =
occur, not
> >>> interrupts are recorded and no errors are recorded.
> >>>
> >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,format=3DUYVY=
,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3Dtest
> >>> Setting pipeline to PAUSED ...
> >>> Pipeline is live and does not need PREROLL ...
> >>> Pipeline is PREROLLED ...
> >>> Setting pipeline to [  114.819632] v4l2_get_link_freq: Link frequency=
 estimated using pixel rate: result might be inaccurate
> >>> PLAYING ...
> >>> New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consider imple=
menting support for V4L2_CID_LINK_FREQ in the transmitter driver
> >>> Clock
> >>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D video=
/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480, framera=
te=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorimetry=3D(s=
tring)bt709
> >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D=
 video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480, f=
ramerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorimetr=
y=3D(string)bt709
> >>> /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps =3D vi=
deo/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480, fram=
erate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorimetry=
=3D(string)bt709
> >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =
=3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480=
, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorim=
etry=3D(string)bt709
> >>>
> >>>
> >>> If anyone has any insight as to what might be wrong, I'd like feedbac=
k.
> >>> I posted a device tree that I beleive goes with the newer imx8mm-evk,=
 but
> >>> I do not have this hardware, so I cannot test it.
> >>
> >> It seems that Frieder on Cc managed to get camera capture to work on
> >> i.MX8MM here:
> >> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommits%2Fv5.10-mx8mm-cs=
i&amp;data=3D04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f4185b1c6=
08d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C63770978397919594=
5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPbGqhzb2mbUA2SD44%2BosK8rNkK12m1LRd6W4=
tvkawno%3D&amp;reserved=3D0
> >>
> >> Hopefully, this can help to figure out what is missing in mainline to
> >> get camera capture to work on i.MX8M.
> >>
> >> I don't have access to an OV5640 camera to connect to the imx8mm-evk
> >> board to try your series.
> >
> > Fabio,
> >
> > Thanks for the heads up on that repo.  I was able to use that repo and
> > get still images to capture on an OV5640, but I noticed a fair amount
> > of differences between that repo and what's found in linux-next.
> >
> > Laurent,
> >
> > I haven't exhausted the patch differences, but I found at least a few
> > that appear to be missiing upstream, and I am curious to know if/what
> > your opinion is on whether or not they're needed, since the patches on
> > Frieder's repo appear to come from you.
> > [1] - media: imx: imx7-media-csi: Add i.MX8MM identification
> > [2] - media: imx: imx7_mipi_csis: Don't set reserved CLK_CTRL field on =
i.MX8MM
> > [3] - media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats
> >
> > media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats
> >
> > Maybe these don't need to be applied, but they are 'some' of the
> > differences that I see between this 5.10 branch and linux-next .  I
> > know there are more, but
> >
> >
> > [1] - https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F8ac7ec6db0=
c260a871038721886dbdb6660ed84c&amp;data=3D04%7C01%7Cfrieder.schrempf%40kont=
ron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf=
1%7C0%7C0%7C637709783979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dj1iuXWljD=
d8wA5M44KwLCb%2F21tpdOnKZuJazl25bXbQ%3D&amp;reserved=3D0
> > [2] - https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F0b5727c8eb=
a8c370f7db5eace0243f78992a4dbb&amp;data=3D04%7C01%7Cfrieder.schrempf%40kont=
ron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf=
1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DbuWbZF0tY=
fVmibQgBbKJM1PF%2Fw7%2BVO9jhXRCI1zf7TI%3D&amp;reserved=3D0
> > [3] - https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F14befa6bc1=
46b10092a6ac5d0ed4d42c87c6cf27&amp;data=3D04%7C01%7Cfrieder.schrempf%40kont=
ron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf=
1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D60iLhs0G0=
FtQegNp9XtVxAhvZEcltdAGGMNAm2l1cSs%3D&amp;reserved=3D0
> >
> > Frieder et al,
> >
> > Have you (or anyone) tried CSI cameras on anything newer than 5.10?  I
> > am curious to see if a regression popped in somewhere, but git bisect
> > will make this difficult since there is a fair amount of variation
> > between this custom repo and the upstream.
>
> No, I haven't done anything with CSI on a more recent kernel. And I only
> used CSI with the tree above and the ADV7280M bridge. I don't have any
> hardware with a sensor/camera.
>
> In case you haven't seen this already, here is a thread with some notes
> about my testing results:
> https://patchwork.kernel.org/project/linux-media/cover/20210215042741.288=
50-1-laurent.pinchart@ideasonboard.com/.
>

For what it's worth I've got another test setup for IMX8MM CSI
capture. I have a Raspberry Pi Camera module v2 connected to an
imx8mm-venice-gw73xx board. This is a IMX219 8.28MP camera with a
4-lane CSI connection.

Putting Adam's patch 'arm64: dts: imx8mm: Add CSI nodes' as well as
the 'blk-ctl series on top of 5.15 and adding support to my dt via:

commit 87f908a57f48bd7375113991434c2923d65506ac (HEAD -> v5.15-venice)
Author: Tim Harvey <tharvey@gateworks.com>
Date:   Wed Oct 27 15:45:23 2021 -0700

    arm64: dts: imx8mm-venice-gw73xx: add rpi camera module v2

    Add support for rpi camera module v2 which is an IMX219 8MP module:
     - https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
     - has its own on-board 24MHz osc so no clock required from baseboard
     - pin 11 enables 1.8V and 2.8V LDO which is connected to
       GW73xx MIPI_GPIO4 (IMX8MM GPIO1_IO1). imx219 driver does not
       support powerdown-gpios and using gpio1 as reset-gpios

    Signed-off-by: Tim Harvey <tharvey@gateworks.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
index 7b00b6b5bb38..b708c80d884b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
@@ -35,6 +35,13 @@
                };
        };

+       cam24m: cam24m {
+               compatible =3D "fixed-clock";
+               #clock-cells =3D <0>;
+               clock-frequency =3D <24000000>;
+               clock-output-names =3D "cam24m";
+       };
+
        pcie0_refclk: pcie0-refclk {
                compatible =3D "fixed-clock";
                #clock-cells =3D <0>;
@@ -100,6 +107,19 @@
        };
 };

+&csi {
+       status =3D "okay";
+};
+
+&imx8mm_mipi_csi_in {
+       remote-endpoint =3D <&imx219_to_mipi_csi2>;
+       data-lanes =3D <1 2>;
+};
+
+&mipi_csi2 {
+       status =3D "okay";
+};
+
 /* off-board header */
 &ecspi2 {
        pinctrl-names =3D "default";
@@ -132,6 +152,25 @@
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&pinctrl_i2c3>;
        status =3D "okay";
+
+       imx219: sensor@10 {
+               compatible =3D "sony,imx219";
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_imx219>;
+               reg =3D <0x10>;
+               clocks =3D <&cam24m>;
+               reset-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
+
+               port {
+                       /* MIPI CSI-2 bus endpoint */
+                       imx219_to_mipi_csi2: endpoint {
+                               remote-endpoint =3D <&imx8mm_mipi_csi_in>;
+                               clock-lanes =3D <0>;
+                               data-lanes =3D <1 2>;
+                               link-frequencies =3D /bits/ 64 <456000000>;
+                       };
+               };
+       };
 };

 &pcie_phy {
@@ -297,6 +336,12 @@
                >;
        };

+       pinctrl_imx219: imx219grp {
+               fsl,pins =3D <
+                       MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1       0x41
+               >;
+       };
+
        pinctrl_pcie0: pcie0grp {
                fsl,pins =3D <
                        MX8MM_IOMUXC_SAI1_RXD4_GPIO4_IO6        0x41

While the IMX219 supports up to 4 MIPI CSI2 lanes and a variety of
resolutions up to 8MP, the IMX219 driver (drivers/media/i2c/imx219.c)
currently supports only 2 lanes, and a few different resolutions
including 1080p@30fps (cropped FOV), 1640x1232@30fps (2x2 binned),
640x480@30fps (cropped) with RAW8 and RAW10 formats.

I'm setting up the pipeline like this:
media-ctl --links "'imx219 2-0010':0->'imx7-mipi-csis.0':0[1]"
media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB10/640x480 field:none]"
media-ctl -v -V "'csi':0 [fmt:SRGGB10/640x480 field:none]"

and capture:
gst-launch-1.0 -v v4l2src num-buffers=3D1 !
video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D30/1 !
filesink location=3Dtest

The above hangs after:
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D
video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int)480,
framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
New clock: GstSystemClock
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D
video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int)480,
framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
/GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps =3D
video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int)480,
framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
/GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =3D
video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int)480,
framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive

I've tried Laurent's 'media: imx: imx7_mipi_csis: Set dual pixel mode
for RAW formats' patch with the same results.

Let me know if any of you have some ideas here.

Best regards,

Tim
