Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C5C443521
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 19:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbhKBSLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 14:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbhKBSLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 14:11:02 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8F6C061714;
        Tue,  2 Nov 2021 11:08:26 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z20so448098edc.13;
        Tue, 02 Nov 2021 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5pewbR/xbOgRHQN2bQFKSzI6wkSAYCulG009IRKGmHg=;
        b=UBMJAYq6xOanj88oVeeVWEutHziZ3/e9zunXdCA7PZu59wenlLhsCwnpQPP4mXkb9Y
         GANZXXhG+W8GWStxwZCDv9HZGeG9uuaaGXAx7CaXdJ7Np+AStBBiGIB0tW5DvSND4U/r
         YiB5I792PSM2it+3ms//AEm3P/0ctvMfetVbm/HBVwsgxU9JjQ0IylpK0skReL7QEHYU
         uj+dGBF4pCBXkRxtn8i+2/TrLgoWGKOmM72ZAKcTp2NXBfRxrKRnp3sb8kTmZpw2jkLH
         SSpiF4/18L2y1PVhvbR35YXR4cwx/87eLyjGhCQITGBOaGAEGV8v6PrsEigb1rxJ8dVV
         DcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5pewbR/xbOgRHQN2bQFKSzI6wkSAYCulG009IRKGmHg=;
        b=IxNKCrYeQ/R4Cs/qivZj379yW3jRsq2F58cuX8/nR/5Ufohk/gzzb7PfykSvOpX5Gs
         OgjosZrxJzF6W/lbydiixCDwENQRQTT02JLb9VXzjRLeilO5Kb7aYlDCSvdf5g5/iZy/
         MT+F7ygwOpU/xriMYQ8KkR/OqTiGgTHIOofkrDz9xgB3ILi6fy7XkrwOkZIGSrz/m19y
         xKdptX+/0EYVpDm1yZ22XKa6/96KbfQn5nBFIWswQugSoeX/r7czhKQ4U/bIbq2dC1Aa
         PXzs+7J6RGQbsJchCbHswCoQnV7WOljROIIi47h3+/st1wTz/SMYlkU8r1WcGYx8GIqj
         uGSg==
X-Gm-Message-State: AOAM533WlwE3Hf/f2pqBT4wevZmMeEE2AkEEyzuFhKNd9X9ZesDraeO2
        A45RFrIJ+Dk1/t8pVGwSQUeHPJ2E4VqKok97qPg=
X-Google-Smtp-Source: ABdhPJwip+U/pVDFUtawfERrkL1xo+6usnTPXzBN2cmfOddhBI2cgLygyI+lq5SxW1lGkXCsgIgq6faqsTKhdBf+O5Y=
X-Received: by 2002:a05:6402:26d6:: with SMTP id x22mr53284324edd.165.1635876504677;
 Tue, 02 Nov 2021 11:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
 <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
 <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de> <CAJ+vNU0pt73obejn-wnC7QEExRWUAOCfcKRv__4x8+WWdPJsag@mail.gmail.com>
 <CAHCN7xKVS=MK91BENA53p1041WReptiQ3ccLSzCcFWQ5P6TN6A@mail.gmail.com> <CAJ+vNU3s9sCMCmaPM+qqE3F9ZuOvCpoNngC4qnk7++SCAhuMtQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU3s9sCMCmaPM+qqE3F9ZuOvCpoNngC4qnk7++SCAhuMtQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 2 Nov 2021 13:08:13 -0500
Message-ID: <CAHCN7xJb7e2d0X3ZOnLDFRECcTyWVdmVHk5a=N10ipOSjcQE5Q@mail.gmail.com>
Subject: Re: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>,
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

On Tue, Nov 2, 2021 at 12:50 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Mon, Nov 1, 2021 at 5:30 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Mon, Nov 1, 2021 at 6:05 PM Tim Harvey <tharvey@gateworks.com> wrote=
:
> > >
> > > On Fri, Oct 29, 2021 at 4:11 AM Frieder Schrempf
> > > <frieder.schrempf@kontron.de> wrote:
> > > >
> > > > On 28.10.21 02:39, Adam Ford wrote:
> > > > > On Sun, Oct 24, 2021 at 7:16 AM Fabio Estevam <festevam@gmail.com=
> wrote:
> > > > >>
> > > > >> Hi Adam,
> > > > >>
> > > > >> [Adding Frieder on Cc]
> > > > >>
> > > > >> On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.com> w=
rote:
> > > > >>>
> > > > >>> The imx8mm appears to have both a CSI bridge and mipi-csi-2 dri=
vers.  With
> > > > >>> those enabled, both the imx8mm-evk and imx8mm-beacon boards sho=
uld be able
> > > > >>> use an OV5640 camera.
> > > > >>>
> > > > >>> The mipi-csi2 driver sets the clock frequency to 333MHz, so the=
 clock parent
> > > > >>> of the CSI1 must be reparented to a faster clock.  On the custo=
m NXP kernel,
> > > > >>> they use IMX8MM_SYS_PLL2_1000M, so that is done in the device t=
ree to match.
> > > > >>>
> > > > >>> With the CSI and mipi_csi2 drivers pointing to an OV5640 camera=
, the media
> > > > >>> pipeline can be configured with the following:
> > > > >>>
> > > > >>>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[=
1]"
> > > > >>>
> > > > >>> The camera and various nodes in the pipeline can be configured =
for UYVY:
> > > > >>>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 =
field:none]"
> > > > >>>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none=
]"
> > > > >>>
> > > > >>> With that, the media pipeline looks like:
> > > > >>>
> > > > >>>
> > > > >>> Media controller API version 5.15.0
> > > > >>>
> > > > >>> Media device information
> > > > >>> ------------------------
> > > > >>> driver          imx7-csi
> > > > >>> model           imx-media
> > > > >>> serial
> > > > >>> bus info        platform:32e20000.csi
> > > > >>> hw revision     0x0
> > > > >>> driver version  5.15.0
> > > > >>>
> > > > >>> Device topology
> > > > >>> - entity 1: csi (2 pads, 2 links)
> > > > >>>             type V4L2 subdev subtype Unknown flags 0
> > > > >>>             device node name /dev/v4l-subdev0
> > > > >>>         pad0: Sink
> > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:s=
rgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > >>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> > > > >>>         pad1: Source
> > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:s=
rgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > >>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > >>>
> > > > >>> - entity 4: csi capture (1 pad, 1 link)
> > > > >>>             type Node subtype V4L flags 0
> > > > >>>             device node name /dev/video0
> > > > >>>         pad0: Sink
> > > > >>>                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > >>>
> > > > >>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> > > > >>>              type V4L2 subdev subtype Unknown flags 0
> > > > >>>              device node name /dev/v4l-subdev1
> > > > >>>         pad0: Sink
> > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:s=
mpte170m xfer:709 ycbcr:601 quantization:lim-range]
> > > > >>>                 <- "ov5640 1-003c":0 [ENABLED]
> > > > >>>         pad1: Source
> > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:s=
mpte170m xfer:709 ycbcr:601 quantization:lim-range]
> > > > >>>                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > > >>>
> > > > >>> - entity 15: ov5640 1-003c (1 pad, 1 link)
> > > > >>>              type V4L2 subdev subtype Sensor flags 0
> > > > >>>              device node name /dev/v4l-subdev2
> > > > >>>         pad0: Source
> > > > >>>                 [fmt:UYVY8_1X16/640x480@1/30 field:none colorsp=
ace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> > > > >>>                 -> "imx7-mipi-csis.0":0 [ENABLED]
> > > > >>>
> > > > >>> When configured, gstreamer can be used to capture 1 frame and s=
tore it to a file.
> > > > >>>
> > > > >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,format=
=3DUYVY,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3Dtes=
t
> > > > >>>
> > > > >>> Unfortunately, the video capture never appears to happen.  No e=
rrors occur, not
> > > > >>> interrupts are recorded and no errors are recorded.
> > > > >>>
> > > > >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,format=
=3DUYVY,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3Dtes=
t
> > > > >>> Setting pipeline to PAUSED ...
> > > > >>> Pipeline is live and does not need PREROLL ...
> > > > >>> Pipeline is PREROLLED ...
> > > > >>> Setting pipeline to [  114.819632] v4l2_get_link_freq: Link fre=
quency estimated using pixel rate: result might be inaccurate
> > > > >>> PLAYING ...
> > > > >>> New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consider=
 implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> > > > >>> Clock
> > > > >>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D=
 video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480, f=
ramerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorimetr=
y=3D(string)bt709
> > > > >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: ca=
ps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)=
480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colo=
rimetry=3D(string)bt709
> > > > >>> /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps =
=3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480=
, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorim=
etry=3D(string)bt709
> > > > >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: c=
aps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int=
)480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, col=
orimetry=3D(string)bt709
> > > > >>>
> > > > >>>
> > > > >>> If anyone has any insight as to what might be wrong, I'd like f=
eedback.
> > > > >>> I posted a device tree that I beleive goes with the newer imx8m=
m-evk, but
> > > > >>> I do not have this hardware, so I cannot test it.
> > > > >>
> > > > >> It seems that Frieder on Cc managed to get camera capture to wor=
k on
> > > > >> i.MX8MM here:
> > > > >> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommits%2Fv5.10-mx=
8mm-csi&amp;data=3D04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f41=
85b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C63770978397=
9195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPbGqhzb2mbUA2SD44%2BosK8rNkK12m1=
LRd6W4tvkawno%3D&amp;reserved=3D0
> > > > >>
> > > > >> Hopefully, this can help to figure out what is missing in mainli=
ne to
> > > > >> get camera capture to work on i.MX8M.
> > > > >>
> > > > >> I don't have access to an OV5640 camera to connect to the imx8mm=
-evk
> > > > >> board to try your series.
> > > > >
> > > > > Fabio,
> > > > >
> > > > > Thanks for the heads up on that repo.  I was able to use that rep=
o and
> > > > > get still images to capture on an OV5640, but I noticed a fair am=
ount
> > > > > of differences between that repo and what's found in linux-next.
> > > > >
> > > > > Laurent,
> > > > >
> > > > > I haven't exhausted the patch differences, but I found at least a=
 few
> > > > > that appear to be missiing upstream, and I am curious to know if/=
what
> > > > > your opinion is on whether or not they're needed, since the patch=
es on
> > > > > Frieder's repo appear to come from you.
> > > > > [1] - media: imx: imx7-media-csi: Add i.MX8MM identification
> > > > > [2] - media: imx: imx7_mipi_csis: Don't set reserved CLK_CTRL fie=
ld on i.MX8MM
> > > > > [3] - media: imx: imx7_mipi_csis: Set dual pixel mode for RAW for=
mats
> > > > >
> > > > > media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats
> > > > >
> > > > > Maybe these don't need to be applied, but they are 'some' of the
> > > > > differences that I see between this 5.10 branch and linux-next . =
 I
> > > > > know there are more, but
> > > > >
> > > > >
> > > > > [1] - https://eur04.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F8ac7=
ec6db0c260a871038721886dbdb6660ed84c&amp;data=3D04%7C01%7Cfrieder.schrempf%=
40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3=
942daf1%7C0%7C0%7C637709783979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dj1i=
uXWljDd8wA5M44KwLCb%2F21tpdOnKZuJazl25bXbQ%3D&amp;reserved=3D0
> > > > > [2] - https://eur04.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F0b57=
27c8eba8c370f7db5eace0243f78992a4dbb&amp;data=3D04%7C01%7Cfrieder.schrempf%=
40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3=
942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DbuW=
bZF0tYfVmibQgBbKJM1PF%2Fw7%2BVO9jhXRCI1zf7TI%3D&amp;reserved=3D0
> > > > > [3] - https://eur04.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F14be=
fa6bc146b10092a6ac5d0ed4d42c87c6cf27&amp;data=3D04%7C01%7Cfrieder.schrempf%=
40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3=
942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D60i=
Lhs0G0FtQegNp9XtVxAhvZEcltdAGGMNAm2l1cSs%3D&amp;reserved=3D0
> > > > >
> > > > > Frieder et al,
> > > > >
> > > > > Have you (or anyone) tried CSI cameras on anything newer than 5.1=
0?  I
> > > > > am curious to see if a regression popped in somewhere, but git bi=
sect
> > > > > will make this difficult since there is a fair amount of variatio=
n
> > > > > between this custom repo and the upstream.
> > > >
> > > > No, I haven't done anything with CSI on a more recent kernel. And I=
 only
> > > > used CSI with the tree above and the ADV7280M bridge. I don't have =
any
> > > > hardware with a sensor/camera.
> > > >
> > > > In case you haven't seen this already, here is a thread with some n=
otes
> > > > about my testing results:
> > > > https://patchwork.kernel.org/project/linux-media/cover/202102150427=
41.28850-1-laurent.pinchart@ideasonboard.com/.
> > > >
> > >
> > > For what it's worth I've got another test setup for IMX8MM CSI
> > > capture. I have a Raspberry Pi Camera module v2 connected to an
> > > imx8mm-venice-gw73xx board. This is a IMX219 8.28MP camera with a
> > > 4-lane CSI connection.
> > >
> > > Putting Adam's patch 'arm64: dts: imx8mm: Add CSI nodes' as well as
> > > the 'blk-ctl series on top of 5.15 and adding support to my dt via:
> > >
> > > commit 87f908a57f48bd7375113991434c2923d65506ac (HEAD -> v5.15-venice=
)
> > > Author: Tim Harvey <tharvey@gateworks.com>
> > > Date:   Wed Oct 27 15:45:23 2021 -0700
> > >
> > >     arm64: dts: imx8mm-venice-gw73xx: add rpi camera module v2
> > >
> > >     Add support for rpi camera module v2 which is an IMX219 8MP modul=
e:
> > >      - https://datasheets.raspberrypi.com/camera/camera-v2-schematics=
.pdf
> > >      - has its own on-board 24MHz osc so no clock required from baseb=
oard
> > >      - pin 11 enables 1.8V and 2.8V LDO which is connected to
> > >        GW73xx MIPI_GPIO4 (IMX8MM GPIO1_IO1). imx219 driver does not
> > >        support powerdown-gpios and using gpio1 as reset-gpios
> > >
> > >     Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > index 7b00b6b5bb38..b708c80d884b 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > @@ -35,6 +35,13 @@
> > >                 };
> > >         };
> > >
> > > +       cam24m: cam24m {
> > > +               compatible =3D "fixed-clock";
> > > +               #clock-cells =3D <0>;
> > > +               clock-frequency =3D <24000000>;
> > > +               clock-output-names =3D "cam24m";
> > > +       };
> > > +
> > >         pcie0_refclk: pcie0-refclk {
> > >                 compatible =3D "fixed-clock";
> > >                 #clock-cells =3D <0>;
> > > @@ -100,6 +107,19 @@
> > >         };
> > >  };
> > >
> > > +&csi {
> > > +       status =3D "okay";
> > > +};
> > > +
> > > +&imx8mm_mipi_csi_in {
> > > +       remote-endpoint =3D <&imx219_to_mipi_csi2>;
> > > +       data-lanes =3D <1 2>;
> > > +};
> > > +
> > > +&mipi_csi2 {
> > > +       status =3D "okay";
> > > +};
> > > +
> > >  /* off-board header */
> > >  &ecspi2 {
> > >         pinctrl-names =3D "default";
> > > @@ -132,6 +152,25 @@
> > >         pinctrl-names =3D "default";
> > >         pinctrl-0 =3D <&pinctrl_i2c3>;
> > >         status =3D "okay";
> > > +
> > > +       imx219: sensor@10 {
> > > +               compatible =3D "sony,imx219";
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&pinctrl_imx219>;
> > > +               reg =3D <0x10>;
> > > +               clocks =3D <&cam24m>;
> > > +               reset-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> > > +
> > > +               port {
> > > +                       /* MIPI CSI-2 bus endpoint */
> > > +                       imx219_to_mipi_csi2: endpoint {
> > > +                               remote-endpoint =3D <&imx8mm_mipi_csi=
_in>;
> > > +                               clock-lanes =3D <0>;
> > > +                               data-lanes =3D <1 2>;
> > > +                               link-frequencies =3D /bits/ 64 <45600=
0000>;
> > > +                       };
> > > +               };
> > > +       };
> > >  };
> > >
> > >  &pcie_phy {
> > > @@ -297,6 +336,12 @@
> > >                 >;
> > >         };
> > >
> > > +       pinctrl_imx219: imx219grp {
> > > +               fsl,pins =3D <
> > > +                       MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1       0x41
> > > +               >;
> > > +       };
> > > +
> > >         pinctrl_pcie0: pcie0grp {
> > >                 fsl,pins =3D <
> > >                         MX8MM_IOMUXC_SAI1_RXD4_GPIO4_IO6        0x41
> > >
> > > While the IMX219 supports up to 4 MIPI CSI2 lanes and a variety of
> > > resolutions up to 8MP, the IMX219 driver (drivers/media/i2c/imx219.c)
> > > currently supports only 2 lanes, and a few different resolutions
> > > including 1080p@30fps (cropped FOV), 1640x1232@30fps (2x2 binned),
> > > 640x480@30fps (cropped) with RAW8 and RAW10 formats.
> >
> > I am hoping to support this camera as well once I get the OV5640 workin=
g.
> >
> > >
> > > I'm setting up the pipeline like this:
> > > media-ctl --links "'imx219 2-0010':0->'imx7-mipi-csis.0':0[1]"
> > > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB10/640x480 field:none]"
> > > media-ctl -v -V "'csi':0 [fmt:SRGGB10/640x480 field:none]"
> > >
> > > and capture:
> > > gst-launch-1.0 -v v4l2src num-buffers=3D1 !
> > > video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D30/1=
 !
> > > filesink location=3Dtest
> > >
> > > The above hangs after:
> > > Setting pipeline to PAUSED ...
> > > Pipeline is live and does not need PREROLL ...
> > > Setting pipeline to PLAYING ...
> > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D
> > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int=
)480,
> > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > New clock: GstSystemClock
> > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =3D
> > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int=
)480,
> > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps =3D
> > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int=
)480,
> > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =
=3D
> > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(int=
)480,
> > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > >
> > > I've tried Laurent's 'media: imx: imx7_mipi_csis: Set dual pixel mode
> > > for RAW formats' patch with the same results.
> >
> > Same here.
> >
> > >
> > > Let me know if any of you have some ideas here.
> >
> > Tim,
> >
> > Can you check /proc/interrupts?  I assume that you've got no interrupts=
 either.
>
> Adam,
>
> like your setup I see:
>  52:          0          0          0          0     GICv3  48 Level     =
csi
>  53:          0          0          0          0     GICv3  49 Level
>   32e30000.mipi-csi
> Err:          0
>
> clk_summary:
>                                  enable  prepare  protect
>                   duty  hardware
>    clock                          count    count    count        rate
>  accuracy phase  cycle    enable
> -------------------------------------------------------------------------=
------------------------------
>  sys_pll2                             6        6        0  1000000000
>         0     0  50000         Y
>     sys_pll2_out                      1        1        0  1000000000
>         0     0  50000         Y
>        sys_pll2_1000m                 3        3        0  1000000000
>         0     0  50000         Y
>           csi1_phy_ref                2        2        0  1000000000
>         0     0  50000         Y
>           csi1_core                   1        1        0   333333334
>         0     0  50000         Y
>              csi1_root_clk            3        3        0   333333334
>         0     0  50000         Y
>
> >
> > I've added a bunch of debug code to the 5.10 NXP kernel and dumped a
> > bunch of the regisgters and compared it to the ov5640 running on the
> > beacon board.  As of now, I think the issue is somewhere in the CSI
> > Bridge driver.  I've made a few changes to make the CSI bridge
> > registers match that of the 5.10 NXP kernel, but I haven't found the
> > magic register yet.  In my setup, I can get the CSIS driver registers
> > to match the NXP kernel, so I'm leaning toward either the CSI bridge
> > driver or an order of operations difference between the mainline
> > kernel and NXP's.
> >
> > I'm working on this in my spare time, so I'll keep you posted if I
> > make any progress.
> >
>
> Sounds good, let me know if you need more testing.
>
> I also have an imx8mm-evk here with the ov5640 camera so can do some
> testing there as well. I'm not clear how to use the imx8mm-evk with
> NXP's lf-5.10.y downstream vendor kernel in order to compare as it
> uses their proprietary platform capture driver instead of using the
> media controller API and I'm not clear how to set that device up for
> capture.
>
> However if I test that board using the 5.15 with your series (adjusted
> for the ov5640 camera on i2c3 for the imx8mm-evk) I get the same
> results as you do also - no interrupts.

I have put together a list of registers that are set (and in what
order).  I'll try to clean it up and post them.  I think there are a
few registers being set differently, but I am not a CSI-2 expert, so I
do not necessarily know what the 'right' register setting is.

I also noticed that there is a CSIS driver [1]  that's not in the
staging area that seems to be similar to that of the iMX8M Mini, so
I've been tempted to review those register settings to see if it could
be adapted to fit the imx7 and the 8MM, but I think the area to focus
is the CSI Bridge and not the CSIS. I could be wrong, but my CSIS
registers are nearly identical to a working register set from an older
NXP kernel.

adam

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/media/platform/exynos4-is/mipi-csis.c?h=3Dv5.15
>
> Best regards,
>
> Tim
