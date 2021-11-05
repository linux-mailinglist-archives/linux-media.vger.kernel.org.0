Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C0A445F12
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 05:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhKEEQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 00:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhKEEQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 00:16:52 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95316C061714;
        Thu,  4 Nov 2021 21:14:13 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id j21so28563670edt.11;
        Thu, 04 Nov 2021 21:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nk4N0/kA+gKiNDyKV0qtX7zxV9DThweCFXHR52wHEG0=;
        b=fyfuAFCkMP+7w7saahM6V7uKtWvMcJHlQMYPR+rsxKkwO4bu6yo3bl4J9VDUAIGMQN
         xWPOZ6SJGJblN9mhUNaL4CtTTdmCR/Aark09T+8fdOpeugkniQouCzwh6b77eG4rru4t
         gXg6DKfOoQyPH/rYMFeEZhktxB0uNPTymm3kFwPjOaYHgw1AfpYVogrgQDyYJ7v2yyTD
         Hy+pBbJjXPYIcTnWeyaOXOnELrcGJL3mGPjXIVJaq6GRS7SdC/tuWl+um9q97vjU9Pbl
         z7iOxNlCCZMzXnduzj0/nsFLid8DXtGaDqYng4Fp89LE7KdN1KHzoC30nPpKw3cYXMX6
         8omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nk4N0/kA+gKiNDyKV0qtX7zxV9DThweCFXHR52wHEG0=;
        b=qFrO/xOKbDI131u/zcKwt0ixhFp9CHxONtWtf3fFzFrGrnehN+N2p5RUHIF9f7nFII
         c9q/WIzMvJz9gYH40HfRMDPS9ORzRDm5yz+V5a1gVPCtB9eMmCB37qU+XYipapr1wMM3
         l2w+3VwiTBj7Tp+ICsYR961+OwiCWZeUJuHYkD5kxBgQ58zDcp6myIpry+RYPPnX8cpq
         Zq/RBzM+W1vSnYCNbtQoZQCMXwPQHTdy+n40XxksdppAb5oXV+iyz+xzrjhY90+J3Dku
         OHHOsStVSa729A/gNQxB3mN8i6eOt3ma5dyZsQqCxIk1yx38CSe+uuwT+8uCnCdhKegK
         s4WA==
X-Gm-Message-State: AOAM532ue4uD/mW7iPlKHuiCfteEdEY9HLot5quHVnvVIH4V3g308uHs
        AAXg+zUCJs9UDxaNiPlRK8JXrEyVaBM0FNlXAGY=
X-Google-Smtp-Source: ABdhPJy9xl1SljRYxd5yM1Pc4XXiFhuzt8tSXYOQgPAKZ5rs1318yDXaILIDgpdlSND5ZpQ814CjUhcZfulK5Xne2Ls=
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr29955007edv.249.1636085651749;
 Thu, 04 Nov 2021 21:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
 <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
 <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de> <CAJ+vNU0pt73obejn-wnC7QEExRWUAOCfcKRv__4x8+WWdPJsag@mail.gmail.com>
 <CAHCN7xKVS=MK91BENA53p1041WReptiQ3ccLSzCcFWQ5P6TN6A@mail.gmail.com>
 <CAJ+vNU3s9sCMCmaPM+qqE3F9ZuOvCpoNngC4qnk7++SCAhuMtQ@mail.gmail.com>
 <CAHCN7xJb7e2d0X3ZOnLDFRECcTyWVdmVHk5a=N10ipOSjcQE5Q@mail.gmail.com> <CAHCN7x+PTcJyrOm_9y5BKY79dEL9mdc4fimyBCzVzeO=qtDWcA@mail.gmail.com>
In-Reply-To: <CAHCN7x+PTcJyrOm_9y5BKY79dEL9mdc4fimyBCzVzeO=qtDWcA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 4 Nov 2021 23:14:00 -0500
Message-ID: <CAHCN7xKmr_dryBttt6fL7Yd6kKbpudbenpPCVsB2nooseEtz_w@mail.gmail.com>
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
        linux-kernel <linux-kernel@vger.kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

)

On Tue, Nov 2, 2021 at 7:45 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 1:08 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Tue, Nov 2, 2021 at 12:50 PM Tim Harvey <tharvey@gateworks.com> wrot=
e:
> > >
> > > On Mon, Nov 1, 2021 at 5:30 PM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > On Mon, Nov 1, 2021 at 6:05 PM Tim Harvey <tharvey@gateworks.com> w=
rote:
> > > > >
> > > > > On Fri, Oct 29, 2021 at 4:11 AM Frieder Schrempf
> > > > > <frieder.schrempf@kontron.de> wrote:
> > > > > >
> > > > > > On 28.10.21 02:39, Adam Ford wrote:
> > > > > > > On Sun, Oct 24, 2021 at 7:16 AM Fabio Estevam <festevam@gmail=
.com> wrote:
> > > > > > >>
> > > > > > >> Hi Adam,
> > > > > > >>
> > > > > > >> [Adding Frieder on Cc]
> > > > > > >>
> > > > > > >> On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.co=
m> wrote:
> > > > > > >>>
> > > > > > >>> The imx8mm appears to have both a CSI bridge and mipi-csi-2=
 drivers.  With
> > > > > > >>> those enabled, both the imx8mm-evk and imx8mm-beacon boards=
 should be able
> > > > > > >>> use an OV5640 camera.
> > > > > > >>>
> > > > > > >>> The mipi-csi2 driver sets the clock frequency to 333MHz, so=
 the clock parent
> > > > > > >>> of the CSI1 must be reparented to a faster clock.  On the c=
ustom NXP kernel,
> > > > > > >>> they use IMX8MM_SYS_PLL2_1000M, so that is done in the devi=
ce tree to match.
> > > > > > >>>
> > > > > > >>> With the CSI and mipi_csi2 drivers pointing to an OV5640 ca=
mera, the media
> > > > > > >>> pipeline can be configured with the following:
> > > > > > >>>
> > > > > > >>>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0=
':0[1]"
> > > > > > >>>
> > > > > > >>> The camera and various nodes in the pipeline can be configu=
red for UYVY:
> > > > > > >>>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x=
480 field:none]"
> > > > > > >>>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:=
none]"
> > > > > > >>>
> > > > > > >>> With that, the media pipeline looks like:
> > > > > > >>>
> > > > > > >>>
> > > > > > >>> Media controller API version 5.15.0
> > > > > > >>>
> > > > > > >>> Media device information
> > > > > > >>> ------------------------
> > > > > > >>> driver          imx7-csi
> > > > > > >>> model           imx-media
> > > > > > >>> serial
> > > > > > >>> bus info        platform:32e20000.csi
> > > > > > >>> hw revision     0x0
> > > > > > >>> driver version  5.15.0
> > > > > > >>>
> > > > > > >>> Device topology
> > > > > > >>> - entity 1: csi (2 pads, 2 links)
> > > > > > >>>             type V4L2 subdev subtype Unknown flags 0
> > > > > > >>>             device node name /dev/v4l-subdev0
> > > > > > >>>         pad0: Sink
> > > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspa=
ce:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > > > >>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> > > > > > >>>         pad1: Source
> > > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspa=
ce:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> > > > > > >>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > > > >>>
> > > > > > >>> - entity 4: csi capture (1 pad, 1 link)
> > > > > > >>>             type Node subtype V4L flags 0
> > > > > > >>>             device node name /dev/video0
> > > > > > >>>         pad0: Sink
> > > > > > >>>                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > > > >>>
> > > > > > >>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> > > > > > >>>              type V4L2 subdev subtype Unknown flags 0
> > > > > > >>>              device node name /dev/v4l-subdev1
> > > > > > >>>         pad0: Sink
> > > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspa=
ce:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> > > > > > >>>                 <- "ov5640 1-003c":0 [ENABLED]
> > > > > > >>>         pad1: Source
> > > > > > >>>                 [fmt:UYVY8_1X16/640x480 field:none colorspa=
ce:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> > > > > > >>>                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > > > > >>>
> > > > > > >>> - entity 15: ov5640 1-003c (1 pad, 1 link)
> > > > > > >>>              type V4L2 subdev subtype Sensor flags 0
> > > > > > >>>              device node name /dev/v4l-subdev2
> > > > > > >>>         pad0: Source
> > > > > > >>>                 [fmt:UYVY8_1X16/640x480@1/30 field:none col=
orspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> > > > > > >>>                 -> "imx7-mipi-csis.0":0 [ENABLED]
> > > > > > >>>
> > > > > > >>> When configured, gstreamer can be used to capture 1 frame a=
nd store it to a file.
> > > > > > >>>
> > > > > > >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,for=
mat=3DUYVY,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3D=
test
> > > > > > >>>
> > > > > > >>> Unfortunately, the video capture never appears to happen.  =
No errors occur, not
> > > > > > >>> interrupts are recorded and no errors are recorded.
> > > > > > >>>
> > > > > > >>> gst-launch-1.0 -v v4l2src num-buffers=3D1 ! video/x-raw,for=
mat=3DUYVY,width=3D640,height=3D480,framerate=3D60/1 ! filesink location=3D=
test
> > > > > > >>> Setting pipeline to PAUSED ...
> > > > > > >>> Pipeline is live and does not need PREROLL ...
> > > > > > >>> Pipeline is PREROLLED ...
> > > > > > >>> Setting pipeline to [  114.819632] v4l2_get_link_freq: Link=
 frequency estimated using pixel rate: result might be inaccurate
> > > > > > >>> PLAYING ...
> > > > > > >>> New clock: GstSystem[  114.829203] v4l2_get_link_freq: Cons=
ider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> > > > > > >>> Clock
> > > > > > >>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps=
 =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int)48=
0, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, colori=
metry=3D(string)bt709
> > > > > > >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src=
: caps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(=
int)480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, =
colorimetry=3D(string)bt709
> > > > > > >>> /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: c=
aps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D(int=
)480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive, col=
orimetry=3D(string)bt709
> > > > > > >>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sin=
k: caps =3D video/x-raw, format=3D(string)UYVY, width=3D(int)640, height=3D=
(int)480, framerate=3D(fraction)60/1, interlace-mode=3D(string)progressive,=
 colorimetry=3D(string)bt709
> > > > > > >>>
> > > > > > >>>
> > > > > > >>> If anyone has any insight as to what might be wrong, I'd li=
ke feedback.
> > > > > > >>> I posted a device tree that I beleive goes with the newer i=
mx8mm-evk, but
> > > > > > >>> I do not have this hardware, so I cannot test it.
> > > > > > >>
> > > > > > >> It seems that Frieder on Cc managed to get camera capture to=
 work on
> > > > > > >> i.MX8MM here:
> > > > > > >> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommits%2Fv5.1=
0-mx8mm-csi&amp;data=3D04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f734738=
5f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C6377097=
83979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DPbGqhzb2mbUA2SD44%2BosK8rNkK=
12m1LRd6W4tvkawno%3D&amp;reserved=3D0
> > > > > > >>
> > > > > > >> Hopefully, this can help to figure out what is missing in ma=
inline to
> > > > > > >> get camera capture to work on i.MX8M.
> > > > > > >>
> > > > > > >> I don't have access to an OV5640 camera to connect to the im=
x8mm-evk
> > > > > > >> board to try your series.
> > > > > > >
> > > > > > > Fabio,
> > > > > > >
> > > > > > > Thanks for the heads up on that repo.  I was able to use that=
 repo and
> > > > > > > get still images to capture on an OV5640, but I noticed a fai=
r amount
> > > > > > > of differences between that repo and what's found in linux-ne=
xt.
> > > > > > >
> > > > > > > Laurent,
> > > > > > >
> > > > > > > I haven't exhausted the patch differences, but I found at lea=
st a few
> > > > > > > that appear to be missiing upstream, and I am curious to know=
 if/what
> > > > > > > your opinion is on whether or not they're needed, since the p=
atches on
> > > > > > > Frieder's repo appear to come from you.
> > > > > > > [1] - media: imx: imx7-media-csi: Add i.MX8MM identification
> > > > > > > [2] - media: imx: imx7_mipi_csis: Don't set reserved CLK_CTRL=
 field on i.MX8MM
> > > > > > > [3] - media: imx: imx7_mipi_csis: Set dual pixel mode for RAW=
 formats
> > > > > > >
> > > > > > > media: imx: imx7_mipi_csis: Set dual pixel mode for RAW forma=
ts
> > > > > > >
> > > > > > > Maybe these don't need to be applied, but they are 'some' of =
the
> > > > > > > differences that I see between this 5.10 branch and linux-nex=
t .  I
> > > > > > > know there are more, but
> > > > > > >
> > > > > > >
> > > > > > > [1] - https://eur04.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F=
8ac7ec6db0c260a871038721886dbdb6660ed84c&amp;data=3D04%7C01%7Cfrieder.schre=
mpf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b16=
46f3942daf1%7C0%7C0%7C637709783979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3Dj1iuXWljDd8wA5M44KwLCb%2F21tpdOnKZuJazl25bXbQ%3D&amp;reserved=3D0
> > > > > > > [2] - https://eur04.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F=
0b5727c8eba8c370f7db5eace0243f78992a4dbb&amp;data=3D04%7C01%7Cfrieder.schre=
mpf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b16=
46f3942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DbuWbZF0tYfVmibQgBbKJM1PF%2Fw7%2BVO9jhXRCI1zf7TI%3D&amp;reserved=3D0
> > > > > > > [3] - https://eur04.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F=
14befa6bc146b10092a6ac5d0ed4d42c87c6cf27&amp;data=3D04%7C01%7Cfrieder.schre=
mpf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b16=
46f3942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3D60iLhs0G0FtQegNp9XtVxAhvZEcltdAGGMNAm2l1cSs%3D&amp;reserved=3D0
> > > > > > >
> > > > > > > Frieder et al,
> > > > > > >
> > > > > > > Have you (or anyone) tried CSI cameras on anything newer than=
 5.10?  I
> > > > > > > am curious to see if a regression popped in somewhere, but gi=
t bisect
> > > > > > > will make this difficult since there is a fair amount of vari=
ation
> > > > > > > between this custom repo and the upstream.
> > > > > >
> > > > > > No, I haven't done anything with CSI on a more recent kernel. A=
nd I only
> > > > > > used CSI with the tree above and the ADV7280M bridge. I don't h=
ave any
> > > > > > hardware with a sensor/camera.
> > > > > >
> > > > > > In case you haven't seen this already, here is a thread with so=
me notes
> > > > > > about my testing results:
> > > > > > https://patchwork.kernel.org/project/linux-media/cover/20210215=
042741.28850-1-laurent.pinchart@ideasonboard.com/.
> > > > > >
> > > > >
> > > > > For what it's worth I've got another test setup for IMX8MM CSI
> > > > > capture. I have a Raspberry Pi Camera module v2 connected to an
> > > > > imx8mm-venice-gw73xx board. This is a IMX219 8.28MP camera with a
> > > > > 4-lane CSI connection.
> > > > >
> > > > > Putting Adam's patch 'arm64: dts: imx8mm: Add CSI nodes' as well =
as
> > > > > the 'blk-ctl series on top of 5.15 and adding support to my dt vi=
a:
> > > > >
> > > > > commit 87f908a57f48bd7375113991434c2923d65506ac (HEAD -> v5.15-ve=
nice)
> > > > > Author: Tim Harvey <tharvey@gateworks.com>
> > > > > Date:   Wed Oct 27 15:45:23 2021 -0700
> > > > >
> > > > >     arm64: dts: imx8mm-venice-gw73xx: add rpi camera module v2
> > > > >
> > > > >     Add support for rpi camera module v2 which is an IMX219 8MP m=
odule:
> > > > >      - https://datasheets.raspberrypi.com/camera/camera-v2-schema=
tics.pdf
> > > > >      - has its own on-board 24MHz osc so no clock required from b=
aseboard
> > > > >      - pin 11 enables 1.8V and 2.8V LDO which is connected to
> > > > >        GW73xx MIPI_GPIO4 (IMX8MM GPIO1_IO1). imx219 driver does n=
ot
> > > > >        support powerdown-gpios and using gpio1 as reset-gpios
> > > > >
> > > > >     Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.d=
tsi
> > > > > b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > > > index 7b00b6b5bb38..b708c80d884b 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
> > > > > @@ -35,6 +35,13 @@
> > > > >                 };
> > > > >         };
> > > > >
> > > > > +       cam24m: cam24m {
> > > > > +               compatible =3D "fixed-clock";
> > > > > +               #clock-cells =3D <0>;
> > > > > +               clock-frequency =3D <24000000>;
> > > > > +               clock-output-names =3D "cam24m";
> > > > > +       };
> > > > > +
> > > > >         pcie0_refclk: pcie0-refclk {
> > > > >                 compatible =3D "fixed-clock";
> > > > >                 #clock-cells =3D <0>;
> > > > > @@ -100,6 +107,19 @@
> > > > >         };
> > > > >  };
> > > > >
> > > > > +&csi {
> > > > > +       status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&imx8mm_mipi_csi_in {
> > > > > +       remote-endpoint =3D <&imx219_to_mipi_csi2>;
> > > > > +       data-lanes =3D <1 2>;
> > > > > +};
> > > > > +
> > > > > +&mipi_csi2 {
> > > > > +       status =3D "okay";
> > > > > +};
> > > > > +
> > > > >  /* off-board header */
> > > > >  &ecspi2 {
> > > > >         pinctrl-names =3D "default";
> > > > > @@ -132,6 +152,25 @@
> > > > >         pinctrl-names =3D "default";
> > > > >         pinctrl-0 =3D <&pinctrl_i2c3>;
> > > > >         status =3D "okay";
> > > > > +
> > > > > +       imx219: sensor@10 {
> > > > > +               compatible =3D "sony,imx219";
> > > > > +               pinctrl-names =3D "default";
> > > > > +               pinctrl-0 =3D <&pinctrl_imx219>;
> > > > > +               reg =3D <0x10>;
> > > > > +               clocks =3D <&cam24m>;
> > > > > +               reset-gpios =3D <&gpio1 1 GPIO_ACTIVE_HIGH>;
> > > > > +
> > > > > +               port {
> > > > > +                       /* MIPI CSI-2 bus endpoint */
> > > > > +                       imx219_to_mipi_csi2: endpoint {
> > > > > +                               remote-endpoint =3D <&imx8mm_mipi=
_csi_in>;
> > > > > +                               clock-lanes =3D <0>;
> > > > > +                               data-lanes =3D <1 2>;
> > > > > +                               link-frequencies =3D /bits/ 64 <4=
56000000>;
> > > > > +                       };
> > > > > +               };
> > > > > +       };
> > > > >  };
> > > > >
> > > > >  &pcie_phy {
> > > > > @@ -297,6 +336,12 @@
> > > > >                 >;
> > > > >         };
> > > > >
> > > > > +       pinctrl_imx219: imx219grp {
> > > > > +               fsl,pins =3D <
> > > > > +                       MX8MM_IOMUXC_GPIO1_IO01_GPIO1_IO1       0=
x41
> > > > > +               >;
> > > > > +       };
> > > > > +
> > > > >         pinctrl_pcie0: pcie0grp {
> > > > >                 fsl,pins =3D <
> > > > >                         MX8MM_IOMUXC_SAI1_RXD4_GPIO4_IO6        0=
x41
> > > > >
> > > > > While the IMX219 supports up to 4 MIPI CSI2 lanes and a variety o=
f
> > > > > resolutions up to 8MP, the IMX219 driver (drivers/media/i2c/imx21=
9.c)
> > > > > currently supports only 2 lanes, and a few different resolutions
> > > > > including 1080p@30fps (cropped FOV), 1640x1232@30fps (2x2 binned)=
,
> > > > > 640x480@30fps (cropped) with RAW8 and RAW10 formats.
> > > >
> > > > I am hoping to support this camera as well once I get the OV5640 wo=
rking.
> > > >
> > > > >
> > > > > I'm setting up the pipeline like this:
> > > > > media-ctl --links "'imx219 2-0010':0->'imx7-mipi-csis.0':0[1]"
> > > > > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB10/640x480 field:non=
e]"
> > > > > media-ctl -v -V "'csi':0 [fmt:SRGGB10/640x480 field:none]"
> > > > >
> > > > > and capture:
> > > > > gst-launch-1.0 -v v4l2src num-buffers=3D1 !
> > > > > video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=3D=
30/1 !
> > > > > filesink location=3Dtest
> > > > >
> > > > > The above hangs after:
> > > > > Setting pipeline to PAUSED ...
> > > > > Pipeline is live and does not need PREROLL ...
> > > > > Setting pipeline to PLAYING ...
> > > > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =3D
> > > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D=
(int)480,
> > > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > > New clock: GstSystemClock
> > > > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps=
 =3D
> > > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D=
(int)480,
> > > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > > /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps =
=3D
> > > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D=
(int)480,
> > > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: cap=
s =3D
> > > > > video/x-bayer, format=3D(string)rggb, width=3D(int)640, height=3D=
(int)480,
> > > > > framerate=3D(fraction)30/1, interlace-mode=3D(string)progressive
> > > > >
> > > > > I've tried Laurent's 'media: imx: imx7_mipi_csis: Set dual pixel =
mode
> > > > > for RAW formats' patch with the same results.
> > > >
> > > > Same here.
> > > >
> > > > >
> > > > > Let me know if any of you have some ideas here.
> > > >
> > > > Tim,
> > > >
> > > > Can you check /proc/interrupts?  I assume that you've got no interr=
upts either.
> > >
> > > Adam,
> > >
> > > like your setup I see:
> > >  52:          0          0          0          0     GICv3  48 Level =
    csi
> > >  53:          0          0          0          0     GICv3  49 Level
> > >   32e30000.mipi-csi
> > > Err:          0
> > >
> > > clk_summary:
> > >                                  enable  prepare  protect
> > >                   duty  hardware
> > >    clock                          count    count    count        rate
> > >  accuracy phase  cycle    enable
> > > ---------------------------------------------------------------------=
----------------------------------
> > >  sys_pll2                             6        6        0  1000000000
> > >         0     0  50000         Y
> > >     sys_pll2_out                      1        1        0  1000000000
> > >         0     0  50000         Y
> > >        sys_pll2_1000m                 3        3        0  1000000000
> > >         0     0  50000         Y
> > >           csi1_phy_ref                2        2        0  1000000000
> > >         0     0  50000         Y
> > >           csi1_core                   1        1        0   333333334
> > >         0     0  50000         Y
> > >              csi1_root_clk            3        3        0   333333334
> > >         0     0  50000         Y
> > >
> > > >
> > > > I've added a bunch of debug code to the 5.10 NXP kernel and dumped =
a
> > > > bunch of the regisgters and compared it to the ov5640 running on th=
e
> > > > beacon board.  As of now, I think the issue is somewhere in the CSI
> > > > Bridge driver.  I've made a few changes to make the CSI bridge
> > > > registers match that of the 5.10 NXP kernel, but I haven't found th=
e
> > > > magic register yet.  In my setup, I can get the CSIS driver registe=
rs
> > > > to match the NXP kernel, so I'm leaning toward either the CSI bridg=
e
> > > > driver or an order of operations difference between the mainline
> > > > kernel and NXP's.
> > > >
> > > > I'm working on this in my spare time, so I'll keep you posted if I
> > > > make any progress.
> > > >
> > >
> > > Sounds good, let me know if you need more testing.
> > >
> > > I also have an imx8mm-evk here with the ov5640 camera so can do some
> > > testing there as well. I'm not clear how to use the imx8mm-evk with
> > > NXP's lf-5.10.y downstream vendor kernel in order to compare as it
> > > uses their proprietary platform capture driver instead of using the
> > > media controller API and I'm not clear how to set that device up for
> > > capture.
> > >
> > > However if I test that board using the 5.15 with your series (adjuste=
d
> > > for the ov5640 camera on i2c3 for the imx8mm-evk) I get the same
> > > results as you do also - no interrupts.
> >
> > I have put together a list of registers that are set (and in what
> > order).  I'll try to clean it up and post them.  I think there are a
> > few registers being set differently, but I am not a CSI-2 expert, so I
> > do not necessarily know what the 'right' register setting is.
> >
> > I also noticed that there is a CSIS driver [1]  that's not in the
> > staging area that seems to be similar to that of the iMX8M Mini, so
> > I've been tempted to review those register settings to see if it could
> > be adapted to fit the imx7 and the 8MM, but I think the area to focus
> > is the CSI Bridge and not the CSIS. I could be wrong, but my CSIS
> > registers are nearly identical to a working register set from an older
> > NXP kernel.
> >
> > adam
> >
> > [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/media/platform/exynos4-is/mipi-csis.c?h=3Dv5.15
> > >
>
> --Deleted device tree mailing list since we're not really discussing
> device tree issues at this point.
>
> A few more updates:
>
> I am attaching two files.  One with working registers and one without
> for comparison.  I did a manual find-replace for the different
> registers, so I hope I didn't mess it up, but if something seems wrong
> in the working version, I can re-test.
>
> I am still not operational, but I found a few items between the
> working version and non-working version that I want to discuss.
>
> In the CSI-Bridge, the IRQ enable function sets a different bit by
> name.  I think I have patched the upstream one to match.  I think the
> upstream one wrongly enables BIT_RFF_OR_INT when it should be
> BIT_RF_OR_INTEN.  I also noticed that the working version has
> BIT_SOF_INTEN enabled.  The IRQ handler doesn't currently check for
> the SOF interrupt, so it's likely we don't want to enable that IRQ,
> but the custom driver does enable it.
>
> @@ -251,7 +252,8 @@ static void imx7_csi_hw_enable_irq(struct imx7_csi *c=
si)
>  {
>         u32 cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);
>
> -       cr1 |=3D BIT_RFF_OR_INT;
> +       cr1 |=3D BIT_SOF_INTEN;
> +       cr1 |=3D BIT_RF_OR_INTEN;
>         cr1 |=3D BIT_FB1_DMA_DONE_INTEN;
>         cr1 |=3D BIT_FB2_DMA_DONE_INTEN;
>
> @@ -262,7 +264,8 @@ static void imx7_csi_hw_disable_irq(struct imx7_csi *=
csi)
>  {
>         u32 cr1 =3D imx7_csi_reg_read(csi, CSI_CSICR1);
>
>
> -       cr1 &=3D ~BIT_RFF_OR_INT;
> +       cr1 &=3D ~BIT_SOF_INTEN;
> +       cr1 &=3D ~BIT_RF_OR_INTEN;
>         cr1 &=3D ~BIT_FB1_DMA_DONE_INTEN;
>         cr1 &=3D ~BIT_FB2_DMA_DONE_INTEN;
>
> In the working kernel, the csi configure enables both bits for
> BIT_BASEADDR_SWITCH_EN  and  BIT_BASEADDR_SWITCH_SEL.  I don't know
> why we want or don't want these, but these do apear to be selected in
> the custom kernel.
>
> @@ -464,7 +467,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>         } else {
>                 cr1 |=3D BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FC=
C;
>
> -               cr18 |=3D BIT_DATA_FROM_MIPI;
> +               cr18 |=3D BIT_DATA_FROM_MIPI | BIT_BASEADDR_SWITCH_EN |
> BIT_BASEADDR_SWITCH_SEL;
>
>                 switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
>
> In the CSIS driver, the interrupt enable in the working driver enables
> the interrupt with 0xf00fffff, but upstream is ffffffff.  Looking at
> the data sheet, both appear to me to be setting reserved values.
> The upstream driver also enables MIPI_CSIS_DBG_INTR_MSK which doesn't
> appear to be documented in the 8MM.
>
>  static void mipi_csis_enable_interrupts(struct csi_state *state, bool on=
)
>  {
> -       mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
> -       mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : =
0);
> +       mipi_csis_write(state, MIPI_CSIS_INT_MSK, on ? 0xf00fffff : 0);
> +       /* mipi_csis_write(state, MIPI_CSIS_DBG_INTR_MSK, on ?
> 0xffffffff : 0); */
>  }
>
> Since I am not an expert in these drivers, I am hoping someone who
> understands this better might be able to better explain what some of
> these registers do.
>
> I'll keep working again when I have more spare time.

+Lucas Stach
I think I found the issue of the camera hanging. It appears to be
related to the disp-blk-ctrl virtual power domains.

In the NXP kernel, the dispmix power domain in ATF sets bits 16 and 17
of 32e2_8008 (GPR_MIPI_RESET_DIV), but the disp-blk-ctl driver only
configures 32e2_8000 (SFT_RSTN_CSR) and 32e2_8004 (CLK_EN_CSR).  As
soon as I set those extra bits, the hanging went away, and I got an
image and the image looked good.  I'll try to work on this tomorrow or
the weekend to submit a patch with a fixes tag to make sure the
IMX8MM_DISPBLK_PD_MIPI_CSI power domain properly configures the extra
register.

With this change, I didn't need to modify either the CSI-bridge driver
nor the mipi_csi driver, so when I get the blk-ctrl fix, I'll resubmit
this series on top of that with the corrections suggested as a proper
patch without the RFC.

adam
>
> adam
>
> > > Best regards,
> > >
> > > Tim
