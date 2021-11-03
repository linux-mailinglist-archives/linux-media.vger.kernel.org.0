Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD26443A90
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 01:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhKCAsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 20:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhKCAsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 20:48:22 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44391C061714;
        Tue,  2 Nov 2021 17:45:46 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f4so3263228edx.12;
        Tue, 02 Nov 2021 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x92tLUsWI7YAm6Sh/xfIOGFewN0Cie2OV9s6KS9+f4k=;
        b=Kjhx1lk/WwqTx8E2uEYZc4+CwI0+WcMEaVJ7di+GxVMZQkiaSg3pUt67tZmHTKL39u
         DoHnDiR9fcfW/kj5VEYIaGYTN4w1Xxqok/1LyEZrZRfaUU8iF74oTYvpUJTQ1YA0W0BJ
         5ISHFNaVMOybjcpaISiP71AGQwzlnWS2af5mYLkw25DG4+ib19XPPFwXYCjThQq2Br39
         h8h7E6VWigldogjt9VH7KFCFwPBwKY1ILuB4aK11WzfoFrVNkRrfteYAOKt8ptqNqZQW
         hXRcZsezidw4d10XP7TLQn6oqc65S6kgxiePrL8QZBPTqJylaj8ljiBHenvibdulahxm
         Ab4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x92tLUsWI7YAm6Sh/xfIOGFewN0Cie2OV9s6KS9+f4k=;
        b=dLLdkyYlTzuL+Xcg1PToi9hqSEmYv8LxnBnQ1eGAFJW7u6Ygk9WCkNh/yvm/LSmz8T
         fR3JnxSdfd3eT+QPzy3GDnmXuNDWISZZ27dRsDbm9SCheed540ppEkW2TMZi/fkxSLOD
         VPF38fDX5XyP9y9VROCmlHk4yV5rrZq+dJQTBCz/dw9RoefnSCEfV0b3DV+F0O3KKUIG
         mfgp9oG/DaP8HEOjm79OVeijhCgRY6shk3bKsTI8c7EzdQszneITM+yOIX+0CvueSDVy
         KlcRP8q4i8KS2vDhRCc5OxiuSlxMmVZH4WKDd1hP1IZ8pKDDm0Eu3P7om0tVM0gGkWSh
         FjIA==
X-Gm-Message-State: AOAM532c7k+MDfmUBOtHtGzP9RreqfZzwyL+umtktfy5/YMJQjQwPnKo
        BZpdwkXdPy2shlEf7lap0wygMYRiZmDz/TsPxjU=
X-Google-Smtp-Source: ABdhPJzd1oLsMvZqBlYHaIkPN401/XvsRf5x4SJnJohgVHlJJfoTEiY4vUG5D5xOLjQ8H9Nr25sbc3PaIQ2jSeV/KIA=
X-Received: by 2002:a50:be81:: with SMTP id b1mr56186056edk.59.1635900344153;
 Tue, 02 Nov 2021 17:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
 <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
 <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de> <CAJ+vNU0pt73obejn-wnC7QEExRWUAOCfcKRv__4x8+WWdPJsag@mail.gmail.com>
 <CAHCN7xKVS=MK91BENA53p1041WReptiQ3ccLSzCcFWQ5P6TN6A@mail.gmail.com>
 <CAJ+vNU3s9sCMCmaPM+qqE3F9ZuOvCpoNngC4qnk7++SCAhuMtQ@mail.gmail.com> <CAHCN7xJb7e2d0X3ZOnLDFRECcTyWVdmVHk5a=N10ipOSjcQE5Q@mail.gmail.com>
In-Reply-To: <CAHCN7xJb7e2d0X3ZOnLDFRECcTyWVdmVHk5a=N10ipOSjcQE5Q@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 2 Nov 2021 19:45:32 -0500
Message-ID: <CAHCN7x+PTcJyrOm_9y5BKY79dEL9mdc4fimyBCzVzeO=qtDWcA@mail.gmail.com>
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
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000e7161c05cfd7bad5"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000e7161c05cfd7bad5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 2, 2021 at 1:08 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 12:50 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > On Mon, Nov 1, 2021 at 5:30 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Mon, Nov 1, 2021 at 6:05 PM Tim Harvey <tharvey@gateworks.com> wro=
te:
> > > >
> > > > On Fri, Oct 29, 2021 at 4:11 AM Frieder Schrempf
> > > > <frieder.schrempf@kontron.de> wrote:
> > > > >
> > > > > On 28.10.21 02:39, Adam Ford wrote:
> > > > > > On Sun, Oct 24, 2021 at 7:16 AM Fabio Estevam <festevam@gmail.c=
om> wrote:
> > > > > >>
> > > > > >> Hi Adam,
> > > > > >>
> > > > > >> [Adding Frieder on Cc]
> > > > > >>
> > > > > >> On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.com>=
 wrote:
> > > > > >>>
> > > > > >>> The imx8mm appears to have both a CSI bridge and mipi-csi-2 d=
rivers.  With
> > > > > >>> those enabled, both the imx8mm-evk and imx8mm-beacon boards s=
hould be able
> > > > > >>> use an OV5640 camera.
> > > > > >>>
> > > > > >>> The mipi-csi2 driver sets the clock frequency to 333MHz, so t=
he clock parent
> > > > > >>> of the CSI1 must be reparented to a faster clock.  On the cus=
tom NXP kernel,
> > > > > >>> they use IMX8MM_SYS_PLL2_1000M, so that is done in the device=
 tree to match.
> > > > > >>>
> > > > > >>> With the CSI and mipi_csi2 drivers pointing to an OV5640 came=
ra, the media
> > > > > >>> pipeline can be configured with the following:
> > > > > >>>
> > > > > >>>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':=
0[1]"
> > > > > >>>
> > > > > >>> The camera and various nodes in the pipeline can be configure=
d for UYVY:
> > > > > >>>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x48=
0 field:none]"
> > > > > >>>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:no=
ne]"
> > > > > >>>
> > > > > >>> With that, the media pipeline looks like:
> > > > > >>>
> > > > > >>>
> > > > > >>> Media controller API version 5.15.0
> > > > > >>>
> > > > > >>> Media device information
> > > > > >>> ------------------------
> > > > > >>> driver          imx7-csi
> > > > > >>> model           imx-media
> > > > > >>> serial
> > > > > >>> bus info        platform:32e20000.csi
> > > > > >>> hw revision     0x0
> > > > > >>> driver version  5.15.0
> > > > > >>>
> > > > > >>> Device topology
> > > > > >>> - entity 1: csi (2 pads, 2 links)
> > > > > >>>             type V4L2 subdev subtype Unknown flags 0
> > > > > >>>             device node name /dev/v4l-subdev0
> > > > > >>>         pad0: Sink
> > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace=
:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > > >>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> > > > > >>>         pad1: Source
> > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace=
:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > > >>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > > >>>
> > > > > >>> - entity 4: csi capture (1 pad, 1 link)
> > > > > >>>             type Node subtype V4L flags 0
> > > > > >>>             device node name /dev/video0
> > > > > >>>         pad0: Sink
> > > > > >>>                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > > >>>
> > > > > >>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> > > > > >>>              type V4L2 subdev subtype Unknown flags 0
> > > > > >>>              device node name /dev/v4l-subdev1
> > > > > >>>         pad0: Sink
> > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace=
:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> > > > > >>>                 <- "ov5640 1-003c":0 [ENABLED]
> > > > > >>>         pad1: Source
> > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace=
:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> > > > > >>>                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > > > >>>
> > > > > >>> - entity 15: ov5640 1-003c (1 pad, 1 link)
> > > > > >>>              type V4L2 subdev subtype Sensor flags 0
> > > > > >>>              device node name /dev/v4l-subdev2
> > > > > >>>         pad0: Source
> > > > > >>>                 [fmt:UYVY8_1X16/640x480@1/30 field:none color=
space:srgb xfer:srgb ycbcr:601 quantization:full-range]
> > > > > >>>                 -> "imx7-mipi-csis.0":0 [ENABLED]
> > > > > >>>
> > > > > >>> When configured, gstreamer can be used to capture 1 frame and=
 store it to a file.
> > > > > >>>
> > > > > >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,forma=
t=3DUYVY,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3Dte=
st
> > > > > >>>
> > > > > >>> Unfortunately, the video capture never appears to happen.  No=
 errors occur, not
> > > > > >>> interrupts are recorded and no errors are recorded.
> > > > > >>>
> > > > > >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,forma=
t=3DUYVY,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3Dte=
st
> > > > > >>> Setting pipeline to PAUSED ...
> > > > > >>> Pipeline is live and does not need PREROLL ...
> > > > > >>> Pipeline is PREROLLED ...
> > > > > >>> Setting pipeline to [  114.819632] v4l2_get_link_freq: Link f=
requency estimated using pixel rate: result might be inaccurate
> > > > > >>> PLAYING ...
> > > > > >>> New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consid=
er implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> > > > > >>> Clock
> > > > > >>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
=3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)480=
, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colorim=
etry=3D(string)bt709
> > > > > >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: =
caps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(in=
t)480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, co=
lorimetry=3D(string)bt709
> > > > > >>> /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: cap=
s =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)4=
80, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, color=
imetry=3D(string)bt709
> > > > > >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink:=
 caps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(i=
nt)480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, c=
olorimetry=3D(string)bt709
> > > > > >>>
> > > > > >>>
> > > > > >>> If anyone has any insight as to what might be wrong, I'd like=
 feedback.
> > > > > >>> I posted a device tree that I beleive goes with the newer imx=
8mm-evk, but
> > > > > >>> I do not have this hardware, so I cannot test it.
> > > > > >>
> > > > > >> It seems that Frieder on Cc managed to get camera capture to w=
ork on
> > > > > >> i.MX8MM here:
> > > > > >> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommits%2Fv5.10-=
mx8mm-csi&amp;data=3D04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f=
4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637709783=
979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPbGqhzb2mbUA2SD44%2BosK8rNkK12=
m1LRd6W4tvkawno%3D&amp;reserved=3D0
> > > > > >>
> > > > > >> Hopefully, this can help to figure out what is missing in main=
line to
> > > > > >> get camera capture to work on i.MX8M.
> > > > > >>
> > > > > >> I don't have access to an OV5640 camera to connect to the imx8=
mm-evk
> > > > > >> board to try your series.
> > > > > >
> > > > > > Fabio,
> > > > > >
> > > > > > Thanks for the heads up on that repo.  I was able to use that r=
epo and
> > > > > > get still images to capture on an OV5640, but I noticed a fair =
amount
> > > > > > of differences between that repo and what's found in linux-next=
.
> > > > > >
> > > > > > Laurent,
> > > > > >
> > > > > > I haven't exhausted the patch differences, but I found at least=
 a few
> > > > > > that appear to be missiing upstream, and I am curious to know i=
f/what
> > > > > > your opinion is on whether or not they're needed, since the pat=
ches on
> > > > > > Frieder's repo appear to come from you.
> > > > > > [1] - media: imx: imx7-media-csi: Add i.MX8MM identification
> > > > > > [2] - media: imx: imx7_mipi_csis: Don't set reserved CLK_CTRL f=
ield on i.MX8MM
> > > > > > [3] - media: imx: imx7_mipi_csis: Set dual pixel mode for RAW f=
ormats
> > > > > >
> > > > > > media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats
> > > > > >
> > > > > > Maybe these don't need to be applied, but they are 'some' of th=
e
> > > > > > differences that I see between this 5.10 branch and linux-next =
.  I
> > > > > > know there are more, but
> > > > > >
> > > > > >
> > > > > > [1] - https://eur04.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F8a=
c7ec6db0c260a871038721886dbdb6660ed84c&amp;data=3D04%7C01%7Cfrieder.schremp=
f%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646=
f3942daf1%7C0%7C0%7C637709783979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dj=
1iuXWljDd8wA5M44KwLCb%2F21tpdOnKZuJazl25bXbQ%3D&amp;reserved=3D0
> > > > > > [2] - https://eur04.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F0b=
5727c8eba8c370f7db5eace0243f78992a4dbb&amp;data=3D04%7C01%7Cfrieder.schremp=
f%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646=
f3942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Db=
uWbZF0tYfVmibQgBbKJM1PF%2Fw7%2BVO9jhXRCI1zf7TI%3D&amp;reserved=3D0
> > > > > > [3] - https://eur04.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F14=
befa6bc146b10092a6ac5d0ed4d42c87c6cf27&amp;data=3D04%7C01%7Cfrieder.schremp=
f%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646=
f3942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D6=
0iLhs0G0FtQegNp9XtVxAhvZEcltdAGGMNAm2l1cSs%3D&amp;reserved=3D0
> > > > > >
> > > > > > Frieder et al,
> > > > > >
> > > > > > Have you (or anyone) tried CSI cameras on anything newer than 5=
.10?  I
> > > > > > am curious to see if a regression popped in somewhere, but git =
bisect
> > > > > > will make this difficult since there is a fair amount of variat=
ion
> > > > > > between this custom repo and the upstream.
> > > > >
> > > > > No, I haven't done anything with CSI on a more recent kernel. And=
 I only
> > > > > used CSI with the tree above and the ADV7280M bridge. I don't hav=
e any
> > > > > hardware with a sensor/camera.
> > > > >
> > > > > In case you haven't seen this already, here is a thread with some=
 notes
> > > > > about my testing results:
> > > > > https://patchwork.kernel.org/project/linux-media/cover/2021021504=
2741.28850-1-laurent.pinchart@ideasonboard.com/.
> > > > >
> > > >
> > > > For what it's worth I've got another test setup for IMX8MM CSI
> > > > capture. I have a Raspberry Pi Camera module v2 connected to an
> > > > imx8mm-venice-gw73xx board. This is a IMX219 8.28MP camera with a
> > > > 4-lane CSI connection.
> > > >
> > > > Putting Adam's patch 'arm64: dts: imx8mm: Add CSI nodes' as well as
> > > > the 'blk-ctl series on top of 5.15 and adding support to my dt via:
> > > >
> > > > commit 87f908a57f48bd7375113991434c2923d65506ac (HEAD -> v5.15-veni=
ce)
> > > > Author: Tim Harvey <tharvey@gateworks.com>
> > > > Date:   Wed Oct 27 15:45:23 2021 -0700
> > > >
> > > >     arm64: dts: imx8mm-venice-gw73xx: add rpi camera module v2
> > > >
> > > >     Add support for rpi camera module v2 which is an IMX219 8MP mod=
ule:
> > > >      - https://datasheets.raspberrypi.com/camera/camera-v2-schemati=
cs.pdf
> > > >      - has its own on-board 24MHz osc so no clock required from bas=
eboard
> > > >      - pin 11 enables 1.8V and 2.8V LDO which is connected to
> > > >        GW73xx MIPI_GPIO4 (IMX8MM GPIO1_IO1). imx219 driver does not
> > > >        support powerdown-gpios and using gpio1 as reset-gpios
> > > >
> > > >     Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dts=
i
> > > > b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > > index 7b00b6b5bb38..b708c80d884b 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > > @@ -35,6 +35,13 @@
> > > >                 };
> > > >         };
> > > >
> > > > +       cam24m: cam24m {
> > > > +               compatible =3D "fixed-clock";
> > > > +               #clock-cells =3D <0>;
> > > > +               clock-frequency =3D <24000000>;
> > > > +               clock-output-names =3D "cam24m";
> > > > +       };
> > > > +
> > > >         pcie0_refclk: pcie0-refclk {
> > > >                 compatible =3D "fixed-clock";
> > > >                 #clock-cells =3D <0>;
> > > > @@ -100,6 +107,19 @@
> > > >         };
> > > >  };
> > > >
> > > > +&csi {
> > > > +       status =3D "okay";
> > > > +};
> > > > +
> > > > +&imx8mm_mipi_csi_in {
> > > > +       remote-endpoint =3D <&imx219_to_mipi_csi2>;
> > > > +       data-lanes =3D <1 2>;
> > > > +};
> > > > +
> > > > +&mipi_csi2 {
> > > > +       status =3D "okay";
> > > > +};
> > > > +
> > > >  /* off-board header */
> > > >  &ecspi2 {
> > > >         pinctrl-names =3D "default";
> > > > @@ -132,6 +152,25 @@
> > > >         pinctrl-names =3D "default";
> > > >         pinctrl-0 =3D <&pinctrl_i2c3>;
> > > >         status =3D "okay";
> > > > +
> > > > +       imx219: sensor@10 {
> > > > +               compatible =3D "sony,imx219";
> > > > +               pinctrl-names =3D "default";
> > > > +               pinctrl-0 =3D <&pinctrl_imx219>;
> > > > +               reg =3D <0x10>;
> > > > +               clocks =3D <&cam24m>;
> > > > +               reset-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> > > > +
> > > > +               port {
> > > > +                       /* MIPI CSI-2 bus endpoint */
> > > > +                       imx219_to_mipi_csi2: endpoint {
> > > > +                               remote-endpoint =3D <&imx8mm_mipi_c=
si_in>;
> > > > +                               clock-lanes =3D <0>;
> > > > +                               data-lanes =3D <1 2>;
> > > > +                               link-frequencies =3D /bits/ 64 <456=
000000>;
> > > > +                       };
> > > > +               };
> > > > +       };
> > > >  };
> > > >
> > > >  &pcie_phy {
> > > > @@ -297,6 +336,12 @@
> > > >                 >;
> > > >         };
> > > >
> > > > +       pinctrl_imx219: imx219grp {
> > > > +               fsl,pins =3D <
> > > > +                       MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1       0x4=
1
> > > > +               >;
> > > > +       };
> > > > +
> > > >         pinctrl_pcie0: pcie0grp {
> > > >                 fsl,pins =3D <
> > > >                         MX8MM_IOMUXC_SAI1_RXD4_GPIO4_IO6        0x4=
1
> > > >
> > > > While the IMX219 supports up to 4 MIPI CSI2 lanes and a variety of
> > > > resolutions up to 8MP, the IMX219 driver (drivers/media/i2c/imx219.=
c)
> > > > currently supports only 2 lanes, and a few different resolutions
> > > > including 1080p@30fps (cropped FOV), 1640x1232@30fps (2x2 binned),
> > > > 640x480@30fps (cropped) with RAW8 and RAW10 formats.
> > >
> > > I am hoping to support this camera as well once I get the OV5640 work=
ing.
> > >
> > > >
> > > > I'm setting up the pipeline like this:
> > > > media-ctl --links "'imx219 2-0010':0->'imx7-mipi-csis.0':0[1]"
> > > > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB10/640x480 field:none]=
"
> > > > media-ctl -v -V "'csi':0 [fmt:SRGGB10/640x480 field:none]"
> > > >
> > > > and capture:
> > > > gst-launch-1.0 -v v4l2src num-buffers=3D1 !
> > > > video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D30=
/1 !
> > > > filesink location=3Dtest
> > > >
> > > > The above hangs after:
> > > > Setting pipeline to PAUSED ...
> > > > Pipeline is live and does not need PREROLL ...
> > > > Setting pipeline to PLAYING ...
> > > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D
> > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(i=
nt)480,
> > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > New clock: GstSystemClock
> > > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps =
=3D
> > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(i=
nt)480,
> > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps =3D
> > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(i=
nt)480,
> > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps =
=3D
> > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D(i=
nt)480,
> > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > >
> > > > I've tried Laurent's 'media: imx: imx7_mipi_csis: Set dual pixel mo=
de
> > > > for RAW formats' patch with the same results.
> > >
> > > Same here.
> > >
> > > >
> > > > Let me know if any of you have some ideas here.
> > >
> > > Tim,
> > >
> > > Can you check /proc/interrupts?  I assume that you've got no interrup=
ts either.
> >
> > Adam,
> >
> > like your setup I see:
> >  52:          0          0          0          0     GICv3  48 Level   =
  csi
> >  53:          0          0          0          0     GICv3  49 Level
> >   32e30000.mipi-csi
> > Err:          0
> >
> > clk_summary:
> >                                  enable  prepare  protect
> >                   duty  hardware
> >    clock                          count    count    count        rate
> >  accuracy phase  cycle    enable
> > -----------------------------------------------------------------------=
--------------------------------
> >  sys_pll2                             6        6        0  1000000000
> >         0     0  50000         Y
> >     sys_pll2_out                      1        1        0  1000000000
> >         0     0  50000         Y
> >        sys_pll2_1000m                 3        3        0  1000000000
> >         0     0  50000         Y
> >           csi1_phy_ref                2        2        0  1000000000
> >         0     0  50000         Y
> >           csi1_core                   1        1        0   333333334
> >         0     0  50000         Y
> >              csi1_root_clk            3        3        0   333333334
> >         0     0  50000         Y
> >
> > >
> > > I've added a bunch of debug code to the 5.10 NXP kernel and dumped a
> > > bunch of the regisgters and compared it to the ov5640 running on the
> > > beacon board.  As of now, I think the issue is somewhere in the CSI
> > > Bridge driver.  I've made a few changes to make the CSI bridge
> > > registers match that of the 5.10 NXP kernel, but I haven't found the
> > > magic register yet.  In my setup, I can get the CSIS driver registers
> > > to match the NXP kernel, so I'm leaning toward either the CSI bridge
> > > driver or an order of operations difference between the mainline
> > > kernel and NXP's.
> > >
> > > I'm working on this in my spare time, so I'll keep you posted if I
> > > make any progress.
> > >
> >
> > Sounds good, let me know if you need more testing.
> >
> > I also have an imx8mm-evk here with the ov5640 camera so can do some
> > testing there as well. I'm not clear how to use the imx8mm-evk with
> > NXP's lf-5.10.y downstream vendor kernel in order to compare as it
> > uses their proprietary platform capture driver instead of using the
> > media controller API and I'm not clear how to set that device up for
> > capture.
> >
> > However if I test that board using the 5.15 with your series (adjusted
> > for the ov5640 camera on i2c3 for the imx8mm-evk) I get the same
> > results as you do also - no interrupts.
>
> I have put together a list of registers that are set (and in what
> order).  I'll try to clean it up and post them.  I think there are a
> few registers being set differently, but I am not a CSI-2 expert, so I
> do not necessarily know what the 'right' register setting is.
>
> I also noticed that there is a CSIS driver [1]  that's not in the
> staging area that seems to be similar to that of the iMX8M Mini, so
> I've been tempted to review those register settings to see if it could
> be adapted to fit the imx7 and the 8MM, but I think the area to focus
> is the CSI Bridge and not the CSIS. I could be wrong, but my CSIS
> registers are nearly identical to a working register set from an older
> NXP kernel.
>
> adam
>
> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/media/platform/exynos4-is/mipi-csis.c?h=3Dv5.15
> >

--Deleted device tree mailing list since we're not really discussing
device tree issues at this point.

A few more updates:

I am attaching two files.  One with working registers and one without
for comparison.  I did a manual find-replace for the different
registers, so I hope I didn't mess it up, but if something seems wrong
in the working version, I can re-test.

I am still not operational, but I found a few items between the
working version and non-working version that I want to discuss.

In the CSI-Bridge, the IRQ enable function sets a different bit by
name.  I think I have patched the upstream one to match.  I think the
upstream one wrongly enables BIT_RFF_OR_INT when it should be
BIT_RF_OR_INTEN.  I also noticed that the working version has
BIT_SOF_INTEN enabled.  The IRQ handler doesn't currently check for
the SOF interrupt, so it's likely we don't want to enable that IRQ,
but the custom driver does enable it.

@@ -251,7 +252,8 @@ static void imx7_csi_hw_enable_irq(struct imx7_csi *csi=
)
 {
        u32 cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);

-       cr1 |=3D BIT_RFF_OR_INT;
+       cr1 |=3D BIT_SOF_INTEN;
+       cr1 |=3D BIT_RF_OR_INTEN;
        cr1 |=3D BIT_FB1_DMA_DONE_INTEN;
        cr1 |=3D BIT_FB2_DMA_DONE_INTEN;

@@ -262,7 +264,8 @@ static void imx7_csi_hw_disable_irq(struct imx7_csi *cs=
i)
 {
        u32 cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);


-       cr1 &=3D ~BIT_RFF_OR_INT;
+       cr1 &=3D ~BIT_SOF_INTEN;
+       cr1 &=3D ~BIT_RF_OR_INTEN;
        cr1 &=3D ~BIT_FB1_DMA_DONE_INTEN;
        cr1 &=3D ~BIT_FB2_DMA_DONE_INTEN;

In the working kernel, the csi configure enables both bits for
BIT_BASEADDR_SWITCH_EN  and  BIT_BASEADDR_SWITCH_SEL.  I don't know
why we want or don't want these, but these do apear to be selected in
the custom kernel.

@@ -464,7 +467,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
        } else {
                cr1 |=3D BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC;

-               cr18 |=3D BIT_DATA_FROM_MIPI;
+               cr18 |=3D BIT_DATA_FROM_MIPI | BIT_BASEADDR_SWITCH_EN |
BIT_BASEADDR_SWITCH_SEL;

                switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {

In the CSIS driver, the interrupt enable in the working driver enables
the interrupt with 0xf00fffff, but upstream is ffffffff.  Looking at
the data sheet, both appear to me to be setting reserved values.
The upstream driver also enables MIPI_CSIS_DBG_INTR_MSK which doesn't
appear to be documented in the 8MM.

 static void mipi_csis_enable_interrupts(struct csi_state *state, bool on)
 {
-       mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
-       mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0)=
;
+       mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xf00fffff : 0);
+       /* mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ?
0xffffffff : 0); */
 }

Since I am not an expert in these drivers, I am hoping someone who
understands this better might be able to better explain what some of
these registers do.

I'll keep working again when I have more spare time.

adam

> > Best regards,
> >
> > Tim

--000000000000e7161c05cfd7bad5
Content-Type: application/octet-stream; name=8mm-csi-capture-not-working
Content-Disposition: attachment; filename=8mm-csi-capture-not-working
Content-Transfer-Encoding: base64
Content-ID: <f_kviscnw20>
X-Attachment-Id: f_kviscnw20

WyAgIDU3LjUyOTA4Ml0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMDAwMjA5MDIK
WyAgIDU3LjUzMzEyM10gMzJFMl8wMDA0IENTSS1CcmlkZ2UgKENTSV9DUjIpID0gYzAwMDAwMDAK
WyAgIDU3LjUzNzI0Nl0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gMDAwMDgwMDAK
WyAgIDU3LjU0MTMwMF0gMzJFMl8wMDQ4IENTSS1CcmlkZ2UgKENTSV9DUjE4KSA9IDNjNDJkMDMw
ClsgICA1Ny41NDU0MzZdIDMyRTJfMDAxNCBDU0ktQnJpZGdlIChDU0lfUlhDTlQpID0gMDAwMTJj
MDAKWyAgIDU3LjU0OTU3Ml0gMzJFMl8wMDM0IENTSS1CcmlkZ2UgKENTSV9JTUFHX1BBUkEpID0g
MDI4MDAxZTAKWyAgIDU3LjU1Mzg4NV0gMzJFMl8wMDMwIENTSS1CcmlkZ2UgKENTSV9GQlVGX1BB
UkEpID0gMDAwMDAwMDAKWyAgIDU3LjU1ODg0M10gMzJFMl8wMDI4IENTSS1CcmlkZ2UgKENTSV9E
TUFTQV9GQjEpID0gOTIwMDAwMDAKWyAgIDU3LjU2NTI4Nl0gMzJFMl8wMDJjIENTSS1CcmlkZ2Ug
KENTSV9ETUFTQV9GQjIpID0gOTIxMDAwMDAKWyAgIDU3LjU2OTQyM10gdjRsMl9nZXRfbGlua19m
cmVxOiBMaW5rIGZyZXF1ZW5jeSBlc3RpbWF0ZWQgdXNpbmcgcGl4ZWwgcmF0ZTogcmVzdWx0IG1p
Z2h0IGJlIGluYWNjdXJhdGUKWyAgIDU3LjU4MTQ5Nl0gdjRsMl9nZXRfbGlua19mcmVxOiBDb25z
aWRlciBpbXBsZW1lbnRpbmcgc3VwcG9ydCBmb3IgVjRMMl9DSURfTElOS19GUkVRIGluIHRoZSB0
cmFuc21pdHRlciBkcml2ZXIKWyAgIDU3LjU5NDQwNV0gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJ
X0NTSV9DU0lTX0NPTU1PTl9DVFJMKSA9IDAwMDA0MDAyClsgICA1Ny42MDExNTddIDMyRTNfMDAw
NCBNSVBJLUNTSSAoTUlQSV9DU0lfQ1NJU19DT01NT05fQ1RSTCkgPSAwMDAwNDEwMApbICAgNTcu
NjA3OTE1XSAzMkUzXzAwNDAgTUlQSS1DU0kgKE1JUElfQ1NJX0lTUF9DT05GSUdfQ0gwKSA9IDAw
MDAwMDc4ClsgICA1Ny42MTQ3NzldIDMyRTNfMDA0NCBNSVBJLUNTSSAoTUlQSV9DU0lfSVNQX1JF
U09MVVRJT05fQ0gwKSA9IDAxZTAwMjgwClsgICA1Ny42MjE2NDldIDMyRTNfMDAyNCBNSVBJLUNT
SSAoTUlQSV9DU0lfRFBIWV9DT01NT05fQ1RSTCkgPSAwZDgwMDAwMApbICAgNTcuNjI4NTE5XSAz
MkUzXzAwMjQgTUlQSS1DU0kgKE1JUElfQ1NJX0lTUF9TWU5DX0NIMCkgPSAgMDAwMDAwMDAKWyAg
IDU3LjYzNTM4M10gMzJFM18wMDA4IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NMT0NLX0NUUkwp
ID0gMDAwZjAwMDEKWyAgIDU3LjYzOTMyMl0gMzJFM18wMDMwIE1JUEktQ1NJIChNSVBJX0NTSV9E
UEhZX01BU1RFUl9TTEFWRV9DVFJMX0xPVykgPSAwMDAwMDFmNApbICAgNTcuNjQzMzUzXSAzMkUz
XzAwMzQgTUlQSS1DU0kgKE1JUElfQ1NJX0RQSFlfTUFTVEVSX1NMQVZFX0NUUkxfSElHSCkgPSAw
MDAwMDAwMApbICAgNTcuNjQ3Mzg2XSAzMkUzXzAwMDQgTUlQSS1DU0kgKE1JUElfQ1NJX0NTSVNf
Q09NTU9OX0NUUkwpID0gMDAwMTQxMDQKWyAgIDU3LjY1NDE2N10gMzJFM18wMDA0IE1JUEktQ1NJ
IChNSVBJX0NTSV9DU0lTX0NPTU1PTl9DVFJMKSA9IDAwMDA0MTA1ClsgICA1Ny42NjA5NDZdIDMy
RTNfMDAyNCBNSVBJLUNTSSAoTUlQSV9DU0lfRFBIWV9DT01NT05fQ1RSTCkgPSAwZDgwMDAwNwpb
ICAgNTcuNjY0OTcyXSAzMkUzXzAwMTAgTUlQSS1DU0kgKE1JUElfQ1NJX0lOVEVSUlVQVF9NQVNL
XzApID0gZjAwZmZmZmYKWyAgIDU3LjY2OTAwM10gb3Y1NjQwX3NldF9zdHJlYW1fbWlwaSAxICMg
T1Y1NjQwIFN0YXJ0IFN0cmVhbWluZwpbICAgNTcuNjczMjA4XSAzMkUyXzAwMDAgQ1NJLUJyaWRn
ZSAoQ1NJX0NSMSkgPSAwMDAyMDgwMgpbICAgNTcuNjc5NDg0XSAzMkUyXzAwMDAgQ1NJLUJyaWRn
ZSAoQ1NJX0NSMSkgPSAwMDAyMDgyMgpbICAgNTcuNjg2MzY2XSAzMkUyXzAwMDAgQ1NJLUJyaWRn
ZSAoQ1NJX0NSMSkgPSAwMDAyMDkwMgpbICAgNTcuNjkzMjEzXSAzMkUyXzAwMDggQ1NJLUJyaWRn
ZSAoQ1NJX0NSMykgPSAwMDAwYzAwMApbICAgNTcuNzAzMDkyXSAzMkUyXzAwMTggQ1NJLUJyaWRn
ZSAoQ1NJX1NSKSA9IDgwMDA0MDAwClsgICA1Ny43MDk3MjhdIDMyRTJfMDAwMCBDU0ktQnJpZGdl
IChDU0lfQ1IxKSA9IDAxMWIwOTAyClsgICA1Ny43MTY1OTNdIDMyRTJfMDAwOCBDU0ktQnJpZGdl
IChDU0lfQ1IzKSA9IDAwMDAxMGEwClsgICA1Ny43MjM0NTddIDMyRTJfMDA0OCBDU0ktQnJpZGdl
IChDU0lfQ1IxOCkgPWJjNDJkMDMwClsgICA2NC40MTk0ODRdIGNzaTogd2FpdCBsYXN0IEVPRiB0
aW1lb3V0ICAgIyBDT05UUk9MLUMgUHJlc3NlZCBIZXJlClsgICA2NC40MjMyNzVdIDMyRTJfMDAw
MCBDU0ktQnJpZGdlIChDU0lfQ1IxKSA9IDAwMDIwOTAyClsgICA2NC40MjczMTddIDMyRTJfMDAw
OCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAwMDAwMDIwClsgICA2NC40MzEzNTddIDMyRTJfMDAw
MCBDU0ktQnJpZGdlIChDU0lfQ1IxKSA9IDAwMDIwOTAyClsgICA2NC40MzUzOTNdIDMyRTJfMDA0
OCBDU0ktQnJpZGdlIChDU0lfQ1IxOCkgPSAzYzQyZDAzMApbICAgNjQuNDM5NTE2XSBvdjU2NDBf
c2V0X3N0cmVhbV9taXBpIDAgICAjIE9WNTY0MCBTdG9wIFN0cmVhbWluZwpbICAgNjQuNDQ1ODYx
XSAzMkUzXzAwMTAgTUlQSS1DU0kgKE1JUElfQ1NJX0lOVEVSUlVQVF9NQVNLXzApID0gMDAwMDAw
MDAKWyAgIDY0LjQ0OTg5M10gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NPTU1P
Tl9DVFJMKSA9IDAwMDA0MTA0ClsgICA2NC40NTM4NDRdIDMyRTNfMDAyNCBNSVBJLUNTSSAoTUlQ
SV9DU0lfRFBIWV9DT01NT05fQ1RSTCkgPSAwZDgwMDAwMApbICAgNjQuNDU3OTE0XSAzMkUzXzAw
MTAgTUlQSS1DU0kgKE1JUElfQ1NJX0lOVEVSUlVQVF9NQVNLXzApID0gMDAwMDAwMDAKWyAgIDY0
LjQ2MTk1Ml0gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NPTU1PTl9DVFJMKSA9
IDAwMDA0MTA0ClsgICA2NC40NjIxOTNdIDMyRTJfMDAwMCBDU0ktQnJpZGdlIChDU0lfQ1IxKSA9
IDAwMDIwOTEyClsgICA2NC40NjU4OTldIDMyRTNfMDAyNCBNSVBJLUNTSSAoTUlQSV9DU0lfRFBI
WV9DT01NT05fQ1RSTCkgID0gMGQ4MDAwMDAKWyAgIDY0LjQ3Mzk0Ml0gMzJFMl8wMDA0IENTSS1C
cmlkZ2UgKENTSV9DUjIpID0gMDAwMDAwMDAKWyAgIDY0LjQ3Nzk3NF0gMzJFMl8wMDA4IENTSS1C
cmlkZ2UgKENTSV9DUjMpID0gMDAwMDgwMDAKWyAgIDY0LjQ4MjAwN10gMzJFMl8wMDM0IENTSS1C
cmlkZ2UgKENTSV9JTUFHX1BBUkEpID0gMDMyMDAyNTgKWyAgIDY0LjQ4NjEzOV0gMzJFMl8wMDA4
IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gMDAwMDQwMDAKWyAgIDY0LjQ5MDE3Ml0gMzJFMl8wMDA4
IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gMDAwMDAwMDAKCgo=
--000000000000e7161c05cfd7bad5
Content-Type: application/octet-stream; name=8mm-csi-capture-working
Content-Disposition: attachment; filename=8mm-csi-capture-working
Content-Transfer-Encoding: base64
Content-ID: <f_kviscnwx1>
X-Attachment-Id: f_kviscnwx1

WyAgMTAwLjQzNzM0Ml0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gODAwMApbICAx
MDAuNDQwNDg5XSAzMkUyXzAwMDAgQ1NJLUJyaWRnZSAoQ1NJX0NSMSkgPSA0MDAwMDgwMApbICAx
MDAuNDQzOTQ3XSAzMkUyXzAwMDQgQ1NJLUJyaWRnZSAoQ1NJX0NSMikgPSAwClsgIDEwMC40NDY3
NjNdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAKWyAgMTAwLjQ0OTU1NV0gMzJF
Ml8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjFiMTIKWyAgMTAwLjQ1MjcxN10gMzJFMl8w
MDM0IENTSS1CcmlkZ2UgKENTSV9JTUFHX1BBUkEpID0gMjgwMDNjMApbICAxMDAuNDU2MTM1XSAz
MkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NSMykgPSA0MDAwClsgIDEwMC40NTkyMjBdIDMyRTJf
MDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAKWyAgMTAwLjQ2MjA4MV0gMzJFMl8wMDA4IENT
SS1CcmlkZ2UgKENTSV9DUjMpID0gODAwMApbICAxMDAuNDY1MTgyXSAzMkUyXzAwMDAgQ1NJLUJy
aWRnZSAoQ1NJX0NSMSkgPSA0MDAwMDgwMApbICAxMDAuNDY4NjAyXSAzMkUyXzAwMDQgQ1NJLUJy
aWRnZSAoQ1NJX0NSMikgPSAwClsgIDEwMC40NzE0MTFdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChD
U0lfQ1IzKSA9IDAKWyAgMTAwLjQ3NDIwM10gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEp
ID0gMjFiMTIKWyAgMTAwLjQ3NzM3OV0gMzJFMl8wMDM0IENTSS1CcmlkZ2UgKENTSV9JTUFHX1BB
UkEpID0gMjgwMDNjMApbICAxMDAuNDgwODAyXSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NS
MykgPSA0MDAwClsgIDEwMC40ODM4NzNdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9
IDAKWyAgMTAwLjQ4NjY4MV0gMzJFM18wMDEwIE1JUEktQ1NJIChNSVBJX0NTSV9JTlRFUlJVUFRf
TUFTS18wKSA9IDAKWyAgMTAwLjQ4NjY4NF0gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJX0NTSV9D
U0lTX0NPTU1PTl9DVFJMKSA9IDQwMDAKWyAgMTAwLjQ5MDEyM10gMzJFM18wMDI0IE1JUEktQ1NJ
IChNSVBJX0NTSV9EUEhZX0NPTU1PTl9DVFJMKSA9IDAKWyAgMTAyLjg1MTk3MF0gMzJFMl8wMDA4
IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gODAwMApbICAxMDIuODU4NDYwXSAzMkUyXzAwMDAgQ1NJ
LUJyaWRnZSAoQ1NJX0NSMSkgPSA0MDAwMDgwMApbICAxMDIuODYxOTE1XSAzMkUyXzAwMDQgQ1NJ
LUJyaWRnZSAoQ1NJX0NSMikgPSAwClsgIDEwMi44NjQ3NTNdIDMyRTJfMDAwOCBDU0ktQnJpZGdl
IChDU0lfQ1IzKSA9IDAKWyAgMTAyLjg2NzYwNF0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9D
UjEpID0gMjFiMTIKWyAgMTAyLjg3MDc3OF0gMzJFMl8wMDM0IENTSS1CcmlkZ2UgKENTSV9JTUFH
X1BBUkEpID0gMjgwMDNjMApbICAxMDIuODc0MTc5XSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJ
X0NSMykgPSA0MDAwClsgIDEwMi44NzcyNTZdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1Iz
KSA9IDAKWyAgMTAyLjg4MDE1NF0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gODAw
MApbICAxMDIuODgzMjM0XSAzMkUyXzAwMDAgQ1NJLUJyaWRnZSAoQ1NJX0NSMSkgPSA0MDAwMDgw
MApbICAxMDIuODg2NjM0XSAzMkUyXzAwMDQgQ1NJLUJyaWRnZSAoQ1NJX0NSMikgPSAwClsgIDEw
Mi44ODk0NDZdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAKWyAgMTAyLjg5MjI2
MV0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjFiMTIKWyAgMTAyLjg5NTQ1Ml0g
MzJFMl8wMDM0IENTSS1CcmlkZ2UgKENTSV9JTUFHX1BBUkEpID0gMjgwMDNjMApbICAxMDIuODk4
ODc3XSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NSMykgPSA0MDAwClsgIDEwMi45MDE5MzFd
IDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAKWyAgMTAyLjkwNDc1MF0gMzJFM18w
MDEwIE1JUEktQ1NJIChNSVBJX0NTSV9JTlRFUlJVUFRfTUFTS18wKSA9IDAKWyAgMTAyLjkwNDc1
M10gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NPTU1PTl9DVFJMKSA9IDQwMDAK
WyAgMTAyLjkwODE3Ml0gMzJFM18wMDI0IE1JUEktQ1NJIChNSVBJX0NTSV9EUEhZX0NPTU1PTl9D
VFJMKSA9IDAKWyAgMTAyLjkxODc3MV0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0g
ODAwMApbICAxMDIuOTI1MzEyXSAzMkUyXzAwMDAgQ1NJLUJyaWRnZSAoQ1NJX0NSMSkgPSA0MDAw
MDgwMApbICAxMDIuOTI4NzM0XSAzMkUyXzAwMDQgQ1NJLUJyaWRnZSAoQ1NJX0NSMikgPSAwClsg
IDEwMi45MzE1NTZdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAKWyAgMTAyLjkz
NDM0OF0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjFiMTIKWyAgMTAyLjkzNzUw
OF0gMzJFMl8wMDM0IENTSS1CcmlkZ2UgKENTSV9JTUFHX1BBUkEpID0gMjgwMDNjMApbICAxMDIu
OTQwOTYxXSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NSMykgPSA0MDAwClsgIDEwMi45NDQw
MzZdIDMyRTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDAKWyAgMTAyLjk0OTM2N10gMzJF
Ml8wMDA0IENTSS1CcmlkZ2UgKENTSV9DUjIpID0gMmQwMDAKWyAgMTAyLjk1MjY1OF0gMzJFMl8w
MDMwIENTSS1CcmlkZ2UgKENTSV9GQlVGX1BBUkEpID0gMApbICAxMDIuOTU1NTk3XSAzMkUyXzAw
MzQgQ1NJLUJyaWRnZSAoQ1NJX0lNQUdfUEFSQSkgPSAyODAwMWUwClsgIDEwMi45NTkwMTldIDMy
RTJfMDAwOCBDU0ktQnJpZGdlIChDU0lfQ1IzKSA9IDQwMDAKWyAgMTAyLjk2MjA3Ml0gMzJFMl8w
MDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjA5MDIKWyAgMTAyLjk2NTIyOV0gMzJFMl8wMDA0
IENTSS1CcmlkZ2UgKENTSV9DUjIpID0gM2M0MmQwMDAKWyAgMTAzLjYyMDE4MV0gMzJFMl8wMDI4
IENTSS1CcmlkZ2UgKENTSV9ETUFTQV9GQjEpID0gODFhMDAwMDAKWyAgMTAzLjYyMzY4MV0gMzJF
Ml8wMDJjIENTSS1CcmlkZ2UgKENTSV9ETUFTQV9GQjIpID0gODFiMDAwMDAKWyAgMTAzLjYyNzMz
M10gMzJFMl8wMDA0IENTSS1CcmlkZ2UgKENTSV9DUjIpID0gM2M0MmQwMDAKWyAgMTAzLjYzMDg2
Ml0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjA4MDIKWyAgMTAzLjYzNDAxM10g
MzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjA4MjIKWyAgMTAzLjYzNzE4OF0gMzJF
Ml8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gYzAwMApbICAxMDMuNjUwNjUzXSAzMkUyXzAw
MDAgQ1NJLUJyaWRnZSAoQ1NJX0NSMSkgPSAyMDkwMgpbICAxMDMuNjUzNzk2XSAzMkUyXzAwMTgg
Q1NJLUJyaWRnZSAoQ1NJX1NSKSA9IDgwMDA0MDAwClsgIDEwMy42NTc0MTRdIDMyRTJfMDAwNCBD
U0ktQnJpZGdlIChDU0lfQ1IyKSA9IGJjNGFkMDMwClsgIDEwMy42NjA5NTJdIDMyRTJfMDAwOCBD
U0ktQnJpZGdlIChDU0lfQ1IzKSA9IDEwYTAKWyAgMTAzLjY2NDA0Ml0gMzJFMl8wMDA0IENTSS1C
cmlkZ2UgKENTSV9DUjIpID0gYzAwMDAwMDAKWyAgMTAzLjY2NzQ3N10gMzJFMl8wMDAwIENTSS1C
cmlkZ2UgKENTSV9DUjEpID0gMTFiMDkwMgpbICAxMDMuNjcwOTMyXSAzMkUyXzAwMDQgQ1NJLUJy
aWRnZSAoQ1NJX0NSMikgPSBiYzRhZDAzMApbICAxMDMuNjc0NDI3XSAzMkUzXzAwMDQgTUlQSS1D
U0kgKE1JUElfQ1NJX0NTSVNfQ09NTU9OX0NUUkwpID0gNDAwMgpbICAxMDMuNjc0NDQwXSAzMkUz
XzAwMDQgTUlQSS1DU0kgKE1JUElfQ1NJX0NTSVNfQ09NTU9OX0NUUkwpID0gNDEwMApbICAxMDMu
Njc4MDM5XSAzMkUzXzAwMDQgTUlQSS1DU0kgKE1JUElfQ1NJX0NTSVNfQ09NTU9OX0NUUkwpMCA9
IDg3OApbICAxMDMuNjgxNjMzXSAzMkUzXzAwMDQgTUlQSS1DU0kgKE1JUElfQ1NJX0NTSVNfQ09N
TU9OX0NUUkwpNCA9IDFlMDAyODAKWyAgMTAzLjY4NTI0NV0gMzJFM18wMDI0IE1JUEktQ1NJIChN
SVBJX0NTSV9EUEhZX0NPTU1PTl9DVFJMKSA9IGQ4MDAwMDAKWyAgMTAzLjY4OTIxMF0gMzJFM18w
MDA0IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NPTU1PTl9DVFJMKTAgPSA3OApbICAxMDMuNjkz
MTQ5XSAzMkUzXzAwMDQgTUlQSS1DU0kgKE1JUElfQ1NJX0NTSVNfQ09NTU9OX0NUUkwpOCA9IDAK
WyAgMTAzLjY5NjY3OF0gMzJFM18wMDA4IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NMT0NLX0NU
UkwpID0gZjAwMDEKWyAgMTAzLjcwMDA5N10gMzJFM18wMDMwIE1JUEktQ1NJIChNSVBJX0NTSV9E
UEhZX01BU1RFUl9TTEFWRV9DVFJMX0xPVykgPSAxZjQKWyAgMTAzLjcwMzc3OF0gMzJFM18wMDM0
IE1JUEktQ1NJIChNSVBJX0NTSV9EUEhZX01BU1RFUl9TTEFWRV9DVFJMX0hJR0gpID0gMApbICAx
MDMuNzA3MzY4XSAzMkUzXzAwMDQgTUlQSS1DU0kgKE1JUElfQ1NJX0NTSVNfQ09NTU9OX0NUUkwp
ID0gMTQxMDQKWyAgMTAzLjcxMDc4Nl0gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lT
X0NPTU1PTl9DVFJMKSA9IDQxMDUKWyAgMTAzLjcxNDQ0N10gMzJFM18wMDI0IE1JUEktQ1NJIChN
SVBJX0NTSV9EUEhZX0NPTU1PTl9DVFJMKSA9IGQ4MDAwMDcKWyAgMTAzLjcxODA1Nl0gMzJFM18w
MDEwIE1JUEktQ1NJIChNSVBJX0NTSV9JTlRFUlJVUFRfTUFTS18wKSA9IGYwMGZmZmZmClsgIDEw
My43MjIwMDNdIG92NTY0MF9taXBpIDEtMDAxMDogc19zdHJlYW06IDEKWyAgMTAzLjc1Nzc5MV0g
MzJFMl8wMDE4IENTSS1CcmlkZ2UgKENTSV9TUikgPSA4MDAxNDAwMApbICAxMDMuNzk0MzQ4XSAz
MkUyXzAwMTggQ1NJLUJyaWRnZSAoQ1NJX1NSKSA9IDgwMDE0MDAwClsgIDEwMy44MjcyMTRdIDMy
RTJfMDAxOCBDU0ktQnJpZGdlIChDU0lfU1IpID0gOGEyYTQwMDAKWyAgMTAzLjgzMDcxNV0gMzJF
Ml8wMDI4IENTSS1CcmlkZ2UgKENTSV9ETUFTQV9GQjEpID0gODFjMDAwMDAKWyAgMTAzLjgzNDIz
Ml0gMzJFMl8wMDE4IENTSS1CcmlkZ2UgKENTSV9TUikgPSA4NDIxNDAwMApbICAxMDMuODQ2MTcy
XSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NSMykgPSAyMDAyMApbICAxMDMuODQ5MzY1XSAz
MkUyXzAwMDAgQ1NJLUJyaWRnZSAoQ1NJX0NSMSkgPSAyMDkwMgpbICAxMDMuODQ5NDU0XSAzMkUy
XzAwMTggQ1NJLUJyaWRnZSAoQ1NJX1NSKSA9IDhiMjY0MDAxClsgIDEwMy44NTI1NTRdIDMyRTJf
MDAyOCBDU0ktQnJpZGdlIChDU0lfRE1BU0FfRkIxKSA9IDAKWyAgMTAzLjg1NTk5Nl0gbXg2cy1j
c2kgMzJlMjAwMDAuY3NpMV9icmlkZ2U6IG14NnNfY3NpX2lycV9oYW5kbGVyIFJ4IGZpZm8gb3Zl
cmZsb3cKWyAgMTAzLjg1NTk5OV0gMzJFMl8wMDA0IENTSS1CcmlkZ2UgKENTSV9DUjIpID0gM2M0
YWQwMzAKWyAgMTAzLjg1NjAwNF0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjA4
MDIKWyAgMTAzLjg1NjAwN10gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjA4MjIK
WyAgMTAzLjg1NjAxMF0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9DUjEpID0gMjA5MDIKWyAg
MTAzLjg1NjAxNl0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gMjQwMjAKWyAgMTAz
Ljg1NjAyMV0gMzJFMl8wMDA0IENTSS1CcmlkZ2UgKENTSV9DUjIpID0gYmM0YWQwMzAKWyAgMTAz
Ljg1ODkzOF0gMzJFMl8wMDJjIENTSS1CcmlkZ2UgKENTSV9ETUFTQV9GQjIpID0gMApbICAxMDMu
ODg4NzgwXSAzMkUyXzAwMzAgQ1NJLUJyaWRnZSAoQ1NJX0ZCVUZfUEFSQSkgPSAwClsgIDEwMy44
OTE2NzhdIDMyRTJfMDAwNCBDU0ktQnJpZGdlIChDU0lfQ1IyKSA9IDNjNGFkMDMwClsgIDEwMy44
OTUyNDBdIG92NTY0MF9taXBpIDEtMDAxMDogc19zdHJlYW06IDAKWyAgMTAzLjkwMDExM10gMzJF
M18wMDEwIE1JUEktQ1NJIChNSVBJX0NTSV9JTlRFUlJVUFRfTUFTS18wKSA9IDAKWyAgMTAzLjkw
MDExOF0gMzJFM18wMDA0IE1JUEktQ1NJIChNSVBJX0NTSV9DU0lTX0NPTU1PTl9DVFJMKSA9IDQx
MDQKWyAgMTAzLjkwMzU1Ml0gMzJFM18wMDI0IE1JUEktQ1NJIChNSVBJX0NTSV9EUEhZX0NPTU1P
Tl9DVFJMKSA9IGQ4MDAwMDAKWyAgMTAzLjkwODA1OF0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENT
SV9DUjMpID0gMjgwMjAKWyAgMTAzLjkxNTIyMV0gMzJFMl8wMDAwIENTSS1CcmlkZ2UgKENTSV9D
UjEpID0gNDAwMDA4MDAKWyAgMTAzLjkxODYyMl0gMzJFMl8wMDA0IENTSS1CcmlkZ2UgKENTSV9D
UjIpID0gMApbICAxMDMuOTIxNDM3XSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NSMykgPSAw
ClsgIDEwMy45MjQyNjFdIDMyRTJfMDAwMCBDU0ktQnJpZGdlIChDU0lfQ1IxKSA9IDIxYjEyClsg
IDEwMy45Mjc0MTldIDMyRTJfMDAzNCBDU0ktQnJpZGdlIChDU0lfSU1BR19QQVJBKSA9IDI4MDAz
YzAKWyAgMTAzLjkzMDg0MF0gMzJFMl8wMDA4IENTSS1CcmlkZ2UgKENTSV9DUjMpID0gNDAwMApb
ICAxMDMuOTMzODkyXSAzMkUyXzAwMDggQ1NJLUJyaWRnZSAoQ1NJX0NSMykgPSAwClsgIDEwMy45
MzY3MzBdIDMyRTNfMDAxMCBNSVBJLUNTSSAoTUlQSV9DU0lfSU5URVJSVVBUX01BU0tfMCkgPSAw
ClsgIDEwMy45MzY3MzRdIDMyRTNfMDAwNCBNSVBJLUNTSSAoTUlQSV9DU0lfQ1NJU19DT01NT05f
Q1RSTCkgPSA0MTA0Cgo=
--000000000000e7161c05cfd7bad5--
