Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B684598F3
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhKWAKI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhKWAKG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:10:06 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D08C06173E
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:06:59 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id o14so15503810plg.5
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s0oVuqT3s4VawtVAHycVSHri8epzVydfMxQmwKD9HIo=;
        b=p+s5ZB/SMmPel1LAU3Xc+xQy+c+KUhWXgxHGJyhBUPAUI17C9PZnGHvucE3grOnLue
         XwpBZz5rd6R/aR3bmcaBnWwnBdenAurxU6sVXO8dW1UOAW4UuGja8K6XDIyt+gqswl8A
         2QzHuJMoyctkM0gpUA6gMoxS0hJXsPqt6H43bS4pbSPg18w9jBBjXxXRgHd4qWqt0gDB
         LBKtT/yKnZ7lU5XJrX4sP3FVffx/BAqI0IP0VYid8Bl5boPSjl5sgXhCRzNLVSO+VvR1
         dNTWN3Vw8o/Xdyy4ABi65sCrvDkqnPAE/xxDmylTbhv7QggLDhMYEnWQ3SSLGauFVK70
         mlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s0oVuqT3s4VawtVAHycVSHri8epzVydfMxQmwKD9HIo=;
        b=GchCbgyUbvVKOczkal5B1F4YNEjviyeW6eF+N01RMjtHJ7VjrxrNM1Gon+vkFyME4D
         NhmF36FWwH9/BYfW28xDmUXydKBm4LEBBFf1huFDmgGcihSGermFrHrPBmzGcKnIfw/S
         Ue5iEoDVvMd1a3jDG3O/H1J9K2f3n4ONMHy2ORN7SwT8/Got7YOhc3rNtrBXt54ASvB4
         e0v8FPDjDgHGBmuRpE0d2HZsp6YvmwgNLKDPIZK+jS03tUZS2hFEsJzEgJqYtlMf9P0c
         u0Jik0N9jnD7DciMtjZdqSwzSjLVwHwcfw7UkTVXwo2eP0QyPSPmnx+VSNUVcTztynNF
         Zo2A==
X-Gm-Message-State: AOAM530MvvSktcEXesnJeBj5bjdysoJVW3/o7ka5u/pyuELjT9B3asQj
        1e4pW7SVRsGJxkAHtI24cqqFTJ+PAx5ea+VgMyi/KA==
X-Google-Smtp-Source: ABdhPJzZ9OQvBWbOJZkTqKu+nfLhBcCCMU7xmUK2qBP+DcS5SxHuZG9twtFuQRWtGN9ikHTyEFB7Cym4Xg1G/lrkN1o=
X-Received: by 2002:a17:90b:17cc:: with SMTP id me12mr1056455pjb.179.1637626018640;
 Mon, 22 Nov 2021 16:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
 <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
 <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
 <d91532c2c0772f9aa708ead36b2a97203727a7ea.camel@ndufresne.ca> <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
In-Reply-To: <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 22 Nov 2021 16:06:47 -0800
Message-ID: <CAJ+vNU2=o=xmFpcFVKd+=2eOYcgm1dDVDTD8vZvw0NKAyxvN2A@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        "open list:HANTRO VPU CODEC DRIVER" 
        <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 18, 2021 at 8:20 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Thu, Nov 18, 2021 at 6:30 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >
> > Le mardi 16 novembre 2021 =C3=A0 15:23 -0800, Tim Harvey a =C3=A9crit :
> > > On Tue, Nov 9, 2021 at 7:57 AM Nicolas Dufresne <nicolas@ndufresne.ca=
> wrote:
> > > >
> > > > Le lundi 08 novembre 2021 =C3=A0 10:33 -0600, Adam Ford a =C3=A9cri=
t :
> > > > > On Mon, Nov 8, 2021 at 7:59 AM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
> > > > > >
> > > > > > Hi Adam,
> > > > > >
> > > > > > thanks for you work, I'll try and reply  about the GStreamer qu=
estions below, if
> > > > > > you have further question feel free to ask.
> > > > > >
> > > > > > Le samedi 06 novembre 2021 =C3=A0 13:37 -0500, Adam Ford a =C3=
=A9crit :
> > > > > > > The i.MX8M has two Hantro video decoders, called G1 and G2 wh=
ich appear
> > > > > > > to be related to the video decoders used on the i.MX8MQ, but =
because of
> > > > > > > how the Mini handles the power domains, the VPU driver does n=
ot need to
> > > > > > > handle all the functions, so a new compatible flag is require=
d.
> > > > > > >
> > > > > > > This is an RFC because I don't have functional video on my sy=
stem yet,
> > > > > > > and I'm hoping there might be people who do and can help test=
 this.
> > > > > > > I have only tested this far enough to see they enumerate and =
appear
> > > > > > > as /dev/videoX and /dev/mediaX devices.
> > > > > >
> > > > > > I will check the patchset, but you need in the mini-variant to =
disable the G1
> > > > > > post processor, because this block was fused out. We didn't mak=
e it optional
> > > > >
> > > > > Thanks for being willing to review this.
> > > > >
> > > > > > from the start as according to the V1 of the TRM it was there, =
but that error
> > > > > > was corrected in V3.
> > > > >
> > > > > Thanks for the clarification.  It wasn't obvious to me, because i=
n
> > > > > some instances the PP looked like it was there and sometimes not
> > > > > there.  I'll remove the postproc stuff.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > I am also curious to know if/what gstreamer plugins are neces=
sary.  In
> > > > > > > NXP's custom kernel, there are IMX-specific plugins, and I wa=
s hoping there
> > > > > > > would be more generic plugins that I can use to test.  I am h=
oping some
> > > > > > > of the linux-media experts might chime in on how to best test=
.
> > > > > >
> > > > > > I will recommend using GStreamer 1.19.3 or main branch (GStream=
er is now a
> > > > > > single git repo). You will then be able to test Hantro G1 decod=
ing of MPEG2,
> > > > > > H264 and VP8. Remember that the related plugin depends on libgu=
dev (a glib
> > > > > > binding of udev).
> > > > >
> > > > > Thanks for the tip.
> > > > >
> > > > > >
> > > > > > For the encoder, I believe only JPEG maybe supported, since thi=
s is all there is
> > > > > > mainline for RK3288 (and perhaps other RK). But this will need =
testing and
> > > > > > debugging as the G1 version is slightly newer on NXP SoC.
> > > > >
> > > > > For what it's worth the G1 seems to repond cleanly to the inquiri=
es
> > > > > from v42-compliance.
> > > > > The G2 throws some splat when I run v4l2-compliance, but I am sti=
ll
> > > > > investigating that.
> > > > >
> > > > > [  405.456979] ------------[ cut here ]------------
> > > > > [  405.464173] WARNING: CPU: 0 PID: 563 at mm/page_alloc.c:5344
> > > > > __alloc_pages+0x5a4/0xbe0
> > > > > [  405.472104] Modules linked in: 8021q garp mrp stp llc caam_jr
> > > > > caamhash_desc caamalg_desc crypto_engine rng_core authenc libdes
> > > > > imx7_media_csi(C) crct10dif_ce imx_media_common(C)
> > > > > snd_soc_fsl_asoc_card imx7_mipi_csis(C) snd_soc_imx_audmux
> > > > > snd_soc_simple_card_utils fsl_imx8_ddr_perf imx8m_ddrc brcmfmac
> > > > > brcmutil hantro_vpu(C) v4l2_h264 v4l2_mem2mem videobuf2_vmalloc
> > > > > videobuf2_dma_contig videobuf2_memops cfg80211 ov5640 videobuf2_v=
4l2
> > > > > v4l2_fwnode v4l2_async videobuf2_common videodev etnaviv gpu_sche=
d
> > > > > hci_uart mc btqca btbcm snd_soc_wm8962 at24 spi_imx rtc_pcf85363
> > > > > rtc_snvs clk_bd718x7 spi_bitbang snvs_pwrkey snd_soc_fsl_sai
> > > > > imx_pcm_dma caam error bluetooth imx8mm_thermal ecdh_generic
> > > > > imx_cpufreq_dt ecc rfkill fuse drm ipv6
> > > > > [  405.535835] CPU: 0 PID: 563 Comm: v4l2-compliance Tainted: G  =
    D
> > > > >  C        5.15.0-next-20211105-00010-g4bb8e8a25d3c-dirty #28
> > > > > [  405.547401] Hardware name: Beacon EmbeddedWorks i.MX8M Mini
> > > > > Development Kit (DT)
> > > > > [  405.554797] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -S=
SBS BTYPE=3D--)
> > > > > [  405.561762] pc : __alloc_pages+0x5a4/0xbe0
> > > > > [  405.565861] lr : __dma_direct_alloc_pages+0x17c/0x1e0
> > > > > [  405.570917] sp : ffff800012443810
> > > > > [  405.574232] x29: ffff800012443810 x28: 0000000000000000 x27: f=
fff000005288220
> > > > > [  405.581375] x26: 0000000000000034 x25: 0000000000000000 x24: f=
fff000000259010
> > > > > [  405.588517] x23: ffff80001011ab7c x22: ffff000000259010 x21: 0=
0000000ffffffff
> > > > > [  405.595659] x20: 0000000000000cc1 x19: 0000000000000000 x18: 0=
000000000000000
> > > > > [  405.602803] x17: 0000000000000000 x16: 0000000000000000 x15: 0=
000000000000000
> > > > > [  405.609947] x14: 0000000000000001 x13: 0000000000000000 x12: 0=
000000000000000
> > > > > [  405.617090] x11: ffff80001241d000 x10: ffff00000528833a x9 : f=
fff00000528832a
> > > > > [  405.624232] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0=
000000000000cc0
> > > > > [  405.631378] x5 : 00000000bfffffff x4 : ffff000009e30dc0 x3 : 0=
000000000000000
> > > > > [  405.638520] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0=
000000000000cc1
> > > > > [  405.645666] Call trace:
> > > > > [  405.648113]  __alloc_pages+0x5a4/0xbe0
> > > > > [  405.651862]  __dma_direct_alloc_pages+0x17c/0x1e0
> > > > > [  405.656569]  dma_direct_alloc+0x70/0x310
> > > > > [  405.660494]  dma_alloc_attrs+0x7c/0xe4
> > > > > [  405.664246]  hantro_hevc_get_ref_buf+0x15c/0x184 [hantro_vpu]
> > > > > [  405.670021]  hantro_g2_hevc_dec_run+0x3b8/0x1910 [hantro_vpu]
> > > > > [  405.675791]  device_run+0xac/0x110 [hantro_vpu]
> > > > > [  405.680345]  v4l2_m2m_try_run+0xac/0x1b0 [v4l2_mem2mem]
> > > > > [  405.685598]  v4l2_m2m_ioctl_streamon+0x84/0xa0 [v4l2_mem2mem]
> > > > > [  405.691366]  v4l_streamon+0x28/0x34 [videodev]
> > > > > [  405.695877]  __video_do_ioctl+0x178/0x3dc [videodev]
> > > > > [  405.700897]  video_usercopy+0x368/0x6dc [videodev]
> > > > > [  405.705745]  video_ioctl2+0x1c/0x30 [videodev]
> > > > > [  405.710246]  v4l2_ioctl+0x44/0x64 [videodev]
> > > > > [  405.714574]  __arm64_sys_ioctl+0xac/0xf0
> > > > > [  405.718502]  invoke_syscall+0x48/0x114
> > > > > [  405.722258]  el0_svc_common.constprop.0+0xd4/0xfc
> > > > > [  405.726969]  do_el0_svc+0x2c/0x94
> > > > > [  405.730286]  el0_svc+0x28/0x80
> > > > > [  405.733348]  el0t_64_sync_handler+0xa8/0x130
> > > > > [  405.737619]  el0t_64_sync+0x1a0/0x1a4
> > > > > [  405.741287] ---[ end trace 270ed4a899803006 ]---
> > > > >
> > > > > The H1 encoder seems to hang the system when I run v4l2-complianc=
e on
> > > > > it when H1 is set up as I submitted the patch.  I tried dropping =
all
> > > > > the encoder formats except the JPEG format, and it doesn't hang a=
ny
> > > > > more, but it also doesn't really do anything.
> > > > > The datasheet only references VPU_H1 as supporting VP8 and H.264,=
 so I
> > > > > am not sure JPEG is even supported.
> > > >
> > > > If JPEG is not supported, then there is nothing left for mainline i=
n this
> > > > regard. The kernel control interface and encoding flow needs to be =
designed and
> > > > specified for encoders like VP8 and H264. Some prototypes and prior=
-art exist
> > > > though, but nothing ever got formalized in the form of a specificat=
ion.
> > > >
> > > > >
> > > > > The log from v4l2-compliance on the H1 with everything except the=
 JPEG
> > > > > removed looks like:
> > > > >
> > > > > root@beacon-imx8mm-kit:~# v4l2-compliance -d2
> > > > > v4l2-compliance SHA: not available
> > > > > , 64 bits, 64-bit time_t
> > > > >
> > > > > Segmentation fault
> > > > > root@beacon-imx8mm-kit:~#
> > > > > Message from syslogd@  at Thu Jan  1 00:05:07 1970 ...
> > > > > : Internal error: Oops: 96000004 [#2] SMP
> > > > >
> > > > > Message from syslogd@  at Thu Jan  1 00:05:07 1970 ...
> > > > > : Code: 52800001 aa1403e0 d2801802 95c31ab9 (b9400aa1)
> > > > >
> > > > > I want to install Gstreamer, but I don't have functioning DSI vid=
eo,
> > > > > so I am not entirely sure how I will go about testing the decoder=
s
> > > > > except by using fakesink
> > > >
> > > > We too don't have an mainline DSI to test the CODECs on recent NXP =
SoC. For
> > > > decoders we use fluster, a tool that runs publicly available confor=
mance test.
> > > > It will simply decode to disk and compare a checksum of the decoded=
 image
> > > > against the compliant checksum (produced by the reference decoders)=
. For you
> > > > interested, it uses the new videocodectestsink, which is specialize=
d for
> > > > producing or calculating conformance image/checksum.
> > > >
> > > > https://github.com/fluendo/fluster
> > > >
> > > > We have added support for GStreamer stateless decoders already.
> > > >
> > > > >
> > > > > If the G1 ends up working with some of the newer Gstreamer stuff,=
 I
> > > > > might just submit a formal patch to just enable the G1 for now.
> > > >
> > > > This looks like a good idea indeed.
> > > >
> > > > >
> > > > > adam
> > > > > >
> > > > > > >
> > > > > > > Lastly, I didn't update any device tree binding YAML files, b=
ecause
> > > > > > > I know there have been some discussions about the power domai=
ns on the
> > > > > > > imx8mq, and I wasn't sure if the imx8mm should get a separate=
 YAML file
> > > > > > > or if the existing one for te imx8mq should just be modified.
> > > > > > >
> > > > > > > This will likely require the following series in order to app=
ly correctly:
> > > > > > > https://patchwork.kernel.org/project/linux-arm-kernel/list/?s=
eries=3D576407
> > > > > > >
> > > > > > > Adam Ford (5):
> > > > > > >   media: hantro: Add support for i.MX8M Mini
> > > > > > >   arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
> > > > > > >   media: hantro: Rename ROCKCHIP_VPU_ENC_FMT to HANTRO_VPU_EN=
C_FMT
> > > > > > >   media: hantro: Add H1 encoder support on i.MX8M Mini
> > > > > > >   arm64: dts: imx8mm:  Enable Hantro H1 Encoder
> > > > > > >
> > > > > > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  61 ++++++++
> > > > > > >  drivers/staging/media/hantro/hantro_drv.c     |   3 +
> > > > > > >  drivers/staging/media/hantro/hantro_hw.h      |  19 ++-
> > > > > > >  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 143 ++++++++=
++++++++++
> > > > > > >  .../staging/media/hantro/rockchip_vpu_hw.c    |  26 ++--
> > > > > > >  5 files changed, 231 insertions(+), 21 deletions(-)
> > > > > > >
> > > > > >
> > > >
> > >
> > > Nicolas and Adam,
> > >
> > > For the H1 patches in this series: I've been able to test the IMX8MM
> > > H1 JPEG encode using GStreamer 1.18.5:
> > > $ gst-inspect-1.0 | grep -e "v4l2.*enc"
> > > video4linux2:  v4l2jpegenc: V4L2 JPEG Encoder
> > > $ gst-launch-1.0 videotestsrc ! jpegenc ! rtpjpegpay ! udpsink
> >                                   ^ v4l2jpegenc
> >
> > This is just a transcript error ?
>
> Nicolas,
>
> No! Thanks for catching my mistake. I was testing with software encode...=
 ooops!
>
> 'gst-launch-1.0 videotestsrc ! v4l2jpegenc ! fakesink' actually hangs
> the board so likely a power-domain issue there?
>
> >
> > > host=3D192.168.1.146 port=3D5000
> > > viewed on client@192.168.1.146 via:
> > > $ gst-launch-1.0 udpsrc port=3D5000 ! application/x-rtp,payload=3D96 =
!
> > > rtpjpegdepay ! jpegdec ! autovideosink
> > >
> > > For the G1/G2 patches in the series I don't see any Gstreamer
> > > 'v4l2.*dec' elements. Perhaps I need a newer version of Gstreamer.
> >
> > Most likely yes, I suggest building gstreamer/ branch "main", GStreamer=
 has now
> > a single repository. We are very close to 1.20, which will include stab=
le API
> > support of H264, MPEG2 and VP8 decoding.
> >
>
> Ok, let me see if I can navigate through the build process and I'll
> get back to you.

Nicolas,

I've built gstreamer 1.19.3 from git and still don't see any decoder elemen=
ts:

[gst-main] root@focal-venice:~# dmesg | grep -i hantro
[    8.048311] hantro_vpu: module is from the staging directory, the
quality is unknown, you have been warned.
[    8.069029] hantro-vpu 38300000.video-codec: registered
nxp,imx8mm-vpu-dec as /dev/video0
[    8.070164] hantro-vpu 38310000.video-codec: registered
nxp,imx8mm-vpu-g2-dec as /dev/video1
[    8.072553] hantro_vpu: module is from the staging directory, the
quality is unknown, you have been warned.
[    8.074205] hantro-vpu 38320000.video-codec: registered
nxp,imx8mm-vpu-h1-enc as /dev/video2
[    8.088548] hantro_vpu: module is from the staging directory, the
quality is unknown, you have been warned.
[gst-main] root@focal-venice:~# ls -l /lib/firmware/vpu
total 604
-rwxr-xr-x 1 root root 522024 Nov 23 00:02 vpu_fw_imx8_dec.bin
-rwxr-xr-x 1 root root  91920 Nov 23 00:02 vpu_fw_imx8_enc.bin
[gst-main] root@focal-venice:~# cat /sys/class/video4linux/video*/name
nxp,imx8mm-vpu-dec
nxp,imx8mm-vpu-g2-dec
nxp,imx8mm-vpu-h1-enc
[gst-main] root@focal-venice:~# gst-inspect-1.0 --version
gst-inspect-1.0 version 1.19.3
GStreamer 1.19.3 (GIT)
Unknown package origin
[gst-main] root@focal-venice:~# gst-inspect-1.0 | grep v4l2
video4linux2:  v4l2deviceprovider (GstDeviceProviderFactory)
video4linux2:  v4l2jpegenc: V4L2 JPEG Encoder
video4linux2:  v4l2radio: Radio (video4linux2) Tuner
video4linux2:  v4l2sink: Video (video4linux2) Sink
video4linux2:  v4l2src: Video (video4linux2) Source

The v4l2jpegenc encoder element is there because I haven't disabled it
from Adam's patch yet.

Is there some debugging you want me to add to gstreamer?

Thanks,

Tim
