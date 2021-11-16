Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A67E453CAD
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 00:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhKPX0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 18:26:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbhKPX0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 18:26:23 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E716C061764
        for <linux-media@vger.kernel.org>; Tue, 16 Nov 2021 15:23:25 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id o14so519595plg.5
        for <linux-media@vger.kernel.org>; Tue, 16 Nov 2021 15:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zxTey4bXWx+umOajsjEd+wFlBARgJ1fw718xKlGewME=;
        b=khMbQcTLL176UaHQQoN33nz+qfqyiiE6fzArLs0h2APd/BiBtAg4qXtlitiUC6oT5f
         ZBQzNX7qMfWv3uUqt/qR028LjhLXuroa1bY29yRTy/L9TZVktqO0I4vmetajar90SHlw
         3ZzO/vXBq3tsTvIZYTy36V2nQs8M39JUvP1uqa7QGXXfzwXrryCjPV/LutlJMFY7gPMO
         xmx4alxBjwLjDzQgDhINKtkf8MOYWt2CdSIoSk7yVkT4WPGS5vHOWXhkij/ZiMF1hUR8
         7SQk9ZcgIWC3sHwlm7d/WOeD/d1fkMQfoQ1Y4YWABBWiCTmSU3CjdxhrvlXNfJCvvgrg
         EPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zxTey4bXWx+umOajsjEd+wFlBARgJ1fw718xKlGewME=;
        b=cPb8OZUqQJhfmh2Z+tgNZyNv4GbKVK7yQadiu8Tqz7tXTRbwYHTc9fmq07bfpfaiWN
         eybHTD/iaCrYr3+BKh4vPSxKneUA5z8t4k7dLuBE+g7ZMZ50oOSaziGSyWGZ0r05M0sl
         g2mP0jkv39zT2ZJP9U6e+tG15iaZDVz6LJi8o+cJjFVkJsnwhh31pnAJRYQTR6MbAPCZ
         2im3I0enj4EyhBOcwY1Cg8lmDDJxr4cxr/YXX3oGRHTYllMac0B+DkYI73sq4frXbL4d
         kvW0jlLDo9Q1BnsN2v2OCEaivRdNm9d1NKCcqlLlc2lqSsD0EIX9kFR9+Km4jgX4SUu2
         5qiQ==
X-Gm-Message-State: AOAM532lzQG4ki2Idcnof09Nq0BFgVjrjjujpgzyAqpixw2A3FWbF94B
        dYQu69hl3sTJle+sP6SJbHHq3VyqZd/TmoRf82V9mQ==
X-Google-Smtp-Source: ABdhPJwkH8r6CzV6bw0meyrOKgEahj/nKlvNwR7HOcT6Ca5olMjh9DK15n31Z4qxPSBebnSgnwlQeaVoycjkpSPp/dI=
X-Received: by 2002:a17:902:7c8a:b0:143:bb4a:7bb3 with SMTP id
 y10-20020a1709027c8a00b00143bb4a7bb3mr34042567pll.46.1637105004862; Tue, 16
 Nov 2021 15:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com> <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
In-Reply-To: <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 16 Nov 2021 15:23:13 -0800
Message-ID: <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
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

On Tue, Nov 9, 2021 at 7:57 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le lundi 08 novembre 2021 =C3=A0 10:33 -0600, Adam Ford a =C3=A9crit :
> > On Mon, Nov 8, 2021 at 7:59 AM Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
> > >
> > > Hi Adam,
> > >
> > > thanks for you work, I'll try and reply  about the GStreamer question=
s below, if
> > > you have further question feel free to ask.
> > >
> > > Le samedi 06 novembre 2021 =C3=A0 13:37 -0500, Adam Ford a =C3=A9crit=
 :
> > > > The i.MX8M has two Hantro video decoders, called G1 and G2 which ap=
pear
> > > > to be related to the video decoders used on the i.MX8MQ, but becaus=
e of
> > > > how the Mini handles the power domains, the VPU driver does not nee=
d to
> > > > handle all the functions, so a new compatible flag is required.
> > > >
> > > > This is an RFC because I don't have functional video on my system y=
et,
> > > > and I'm hoping there might be people who do and can help test this.
> > > > I have only tested this far enough to see they enumerate and appear
> > > > as /dev/videoX and /dev/mediaX devices.
> > >
> > > I will check the patchset, but you need in the mini-variant to disabl=
e the G1
> > > post processor, because this block was fused out. We didn't make it o=
ptional
> >
> > Thanks for being willing to review this.
> >
> > > from the start as according to the V1 of the TRM it was there, but th=
at error
> > > was corrected in V3.
> >
> > Thanks for the clarification.  It wasn't obvious to me, because in
> > some instances the PP looked like it was there and sometimes not
> > there.  I'll remove the postproc stuff.
> >
> > >
> > > >
> > > > I am also curious to know if/what gstreamer plugins are necessary. =
 In
> > > > NXP's custom kernel, there are IMX-specific plugins, and I was hopi=
ng there
> > > > would be more generic plugins that I can use to test.  I am hoping =
some
> > > > of the linux-media experts might chime in on how to best test.
> > >
> > > I will recommend using GStreamer 1.19.3 or main branch (GStreamer is =
now a
> > > single git repo). You will then be able to test Hantro G1 decoding of=
 MPEG2,
> > > H264 and VP8. Remember that the related plugin depends on libgudev (a=
 glib
> > > binding of udev).
> >
> > Thanks for the tip.
> >
> > >
> > > For the encoder, I believe only JPEG maybe supported, since this is a=
ll there is
> > > mainline for RK3288 (and perhaps other RK). But this will need testin=
g and
> > > debugging as the G1 version is slightly newer on NXP SoC.
> >
> > For what it's worth the G1 seems to repond cleanly to the inquiries
> > from v42-compliance.
> > The G2 throws some splat when I run v4l2-compliance, but I am still
> > investigating that.
> >
> > [  405.456979] ------------[ cut here ]------------
> > [  405.464173] WARNING: CPU: 0 PID: 563 at mm/page_alloc.c:5344
> > __alloc_pages+0x5a4/0xbe0
> > [  405.472104] Modules linked in: 8021q garp mrp stp llc caam_jr
> > caamhash_desc caamalg_desc crypto_engine rng_core authenc libdes
> > imx7_media_csi(C) crct10dif_ce imx_media_common(C)
> > snd_soc_fsl_asoc_card imx7_mipi_csis(C) snd_soc_imx_audmux
> > snd_soc_simple_card_utils fsl_imx8_ddr_perf imx8m_ddrc brcmfmac
> > brcmutil hantro_vpu(C) v4l2_h264 v4l2_mem2mem videobuf2_vmalloc
> > videobuf2_dma_contig videobuf2_memops cfg80211 ov5640 videobuf2_v4l2
> > v4l2_fwnode v4l2_async videobuf2_common videodev etnaviv gpu_sched
> > hci_uart mc btqca btbcm snd_soc_wm8962 at24 spi_imx rtc_pcf85363
> > rtc_snvs clk_bd718x7 spi_bitbang snvs_pwrkey snd_soc_fsl_sai
> > imx_pcm_dma caam error bluetooth imx8mm_thermal ecdh_generic
> > imx_cpufreq_dt ecc rfkill fuse drm ipv6
> > [  405.535835] CPU: 0 PID: 563 Comm: v4l2-compliance Tainted: G      D
> >  C        5.15.0-next-20211105-00010-g4bb8e8a25d3c-dirty #28
> > [  405.547401] Hardware name: Beacon EmbeddedWorks i.MX8M Mini
> > Development Kit (DT)
> > [  405.554797] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  405.561762] pc : __alloc_pages+0x5a4/0xbe0
> > [  405.565861] lr : __dma_direct_alloc_pages+0x17c/0x1e0
> > [  405.570917] sp : ffff800012443810
> > [  405.574232] x29: ffff800012443810 x28: 0000000000000000 x27: ffff000=
005288220
> > [  405.581375] x26: 0000000000000034 x25: 0000000000000000 x24: ffff000=
000259010
> > [  405.588517] x23: ffff80001011ab7c x22: ffff000000259010 x21: 0000000=
0ffffffff
> > [  405.595659] x20: 0000000000000cc1 x19: 0000000000000000 x18: 0000000=
000000000
> > [  405.602803] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000=
000000000
> > [  405.609947] x14: 0000000000000001 x13: 0000000000000000 x12: 0000000=
000000000
> > [  405.617090] x11: ffff80001241d000 x10: ffff00000528833a x9 : ffff000=
00528832a
> > [  405.624232] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000=
000000cc0
> > [  405.631378] x5 : 00000000bfffffff x4 : ffff000009e30dc0 x3 : 0000000=
000000000
> > [  405.638520] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000=
000000cc1
> > [  405.645666] Call trace:
> > [  405.648113]  __alloc_pages+0x5a4/0xbe0
> > [  405.651862]  __dma_direct_alloc_pages+0x17c/0x1e0
> > [  405.656569]  dma_direct_alloc+0x70/0x310
> > [  405.660494]  dma_alloc_attrs+0x7c/0xe4
> > [  405.664246]  hantro_hevc_get_ref_buf+0x15c/0x184 [hantro_vpu]
> > [  405.670021]  hantro_g2_hevc_dec_run+0x3b8/0x1910 [hantro_vpu]
> > [  405.675791]  device_run+0xac/0x110 [hantro_vpu]
> > [  405.680345]  v4l2_m2m_try_run+0xac/0x1b0 [v4l2_mem2mem]
> > [  405.685598]  v4l2_m2m_ioctl_streamon+0x84/0xa0 [v4l2_mem2mem]
> > [  405.691366]  v4l_streamon+0x28/0x34 [videodev]
> > [  405.695877]  __video_do_ioctl+0x178/0x3dc [videodev]
> > [  405.700897]  video_usercopy+0x368/0x6dc [videodev]
> > [  405.705745]  video_ioctl2+0x1c/0x30 [videodev]
> > [  405.710246]  v4l2_ioctl+0x44/0x64 [videodev]
> > [  405.714574]  __arm64_sys_ioctl+0xac/0xf0
> > [  405.718502]  invoke_syscall+0x48/0x114
> > [  405.722258]  el0_svc_common.constprop.0+0xd4/0xfc
> > [  405.726969]  do_el0_svc+0x2c/0x94
> > [  405.730286]  el0_svc+0x28/0x80
> > [  405.733348]  el0t_64_sync_handler+0xa8/0x130
> > [  405.737619]  el0t_64_sync+0x1a0/0x1a4
> > [  405.741287] ---[ end trace 270ed4a899803006 ]---
> >
> > The H1 encoder seems to hang the system when I run v4l2-compliance on
> > it when H1 is set up as I submitted the patch.  I tried dropping all
> > the encoder formats except the JPEG format, and it doesn't hang any
> > more, but it also doesn't really do anything.
> > The datasheet only references VPU_H1 as supporting VP8 and H.264, so I
> > am not sure JPEG is even supported.
>
> If JPEG is not supported, then there is nothing left for mainline in this
> regard. The kernel control interface and encoding flow needs to be design=
ed and
> specified for encoders like VP8 and H264. Some prototypes and prior-art e=
xist
> though, but nothing ever got formalized in the form of a specification.
>
> >
> > The log from v4l2-compliance on the H1 with everything except the JPEG
> > removed looks like:
> >
> > root@beacon-imx8mm-kit:~# v4l2-compliance -d2
> > v4l2-compliance SHA: not available
> > , 64 bits, 64-bit time_t
> >
> > Segmentation fault
> > root@beacon-imx8mm-kit:~#
> > Message from syslogd@  at Thu Jan  1 00:05:07 1970 ...
> > : Internal error: Oops: 96000004 [#2] SMP
> >
> > Message from syslogd@  at Thu Jan  1 00:05:07 1970 ...
> > : Code: 52800001 aa1403e0 d2801802 95c31ab9 (b9400aa1)
> >
> > I want to install Gstreamer, but I don't have functioning DSI video,
> > so I am not entirely sure how I will go about testing the decoders
> > except by using fakesink
>
> We too don't have an mainline DSI to test the CODECs on recent NXP SoC. F=
or
> decoders we use fluster, a tool that runs publicly available conformance =
test.
> It will simply decode to disk and compare a checksum of the decoded image
> against the compliant checksum (produced by the reference decoders). For =
you
> interested, it uses the new videocodectestsink, which is specialized for
> producing or calculating conformance image/checksum.
>
> https://github.com/fluendo/fluster
>
> We have added support for GStreamer stateless decoders already.
>
> >
> > If the G1 ends up working with some of the newer Gstreamer stuff, I
> > might just submit a formal patch to just enable the G1 for now.
>
> This looks like a good idea indeed.
>
> >
> > adam
> > >
> > > >
> > > > Lastly, I didn't update any device tree binding YAML files, because
> > > > I know there have been some discussions about the power domains on =
the
> > > > imx8mq, and I wasn't sure if the imx8mm should get a separate YAML =
file
> > > > or if the existing one for te imx8mq should just be modified.
> > > >
> > > > This will likely require the following series in order to apply cor=
rectly:
> > > > https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=
=3D576407
> > > >
> > > > Adam Ford (5):
> > > >   media: hantro: Add support for i.MX8M Mini
> > > >   arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
> > > >   media: hantro: Rename ROCKCHIP_VPU_ENC_FMT to HANTRO_VPU_ENC_FMT
> > > >   media: hantro: Add H1 encoder support on i.MX8M Mini
> > > >   arm64: dts: imx8mm:  Enable Hantro H1 Encoder
> > > >
> > > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  61 ++++++++
> > > >  drivers/staging/media/hantro/hantro_drv.c     |   3 +
> > > >  drivers/staging/media/hantro/hantro_hw.h      |  19 ++-
> > > >  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 143 ++++++++++++++=
++++
> > > >  .../staging/media/hantro/rockchip_vpu_hw.c    |  26 ++--
> > > >  5 files changed, 231 insertions(+), 21 deletions(-)
> > > >
> > >
>

Nicolas and Adam,

For the H1 patches in this series: I've been able to test the IMX8MM
H1 JPEG encode using GStreamer 1.18.5:
$ gst-inspect-1.0 | grep -e "v4l2.*enc"
video4linux2:  v4l2jpegenc: V4L2 JPEG Encoder
$ gst-launch-1.0 videotestsrc ! jpegenc ! rtpjpegpay ! udpsink
host=3D192.168.1.146 port=3D5000
viewed on client@192.168.1.146 via:
$ gst-launch-1.0 udpsrc port=3D5000 ! application/x-rtp,payload=3D96 !
rtpjpegdepay ! jpegdec ! autovideosink

For the G1/G2 patches in the series I don't see any Gstreamer
'v4l2.*dec' elements. Perhaps I need a newer version of Gstreamer.

I have CSI capture and DSI display currently working on
imx8mm-venice-gw73xx-0x that I can play with. The CSI sensor only
supports RAW8/RAW10 (and gstreamer currently only supports RAW8) and I
can't efficiently convert to something the JPEG encoder likes without
bayer2rgbneon (a libneon version).

I see from the IMX8MMRM that the 2D GPU supports scaling etc with a
wide range of data formats but I'm not sure how to tap into this as
that hardware is managed by the vivante driver. On the IMX6QDL there
is a separate IPU block that Philipp Zabel wrote a nice mem2mem
csc/scaler driver for but I don't see any equivalent currently for
IMX8MM.

Best regards,

Tim
