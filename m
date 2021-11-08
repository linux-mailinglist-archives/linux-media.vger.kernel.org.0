Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4423B4499F3
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 17:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239074AbhKHQg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 11:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238873AbhKHQg2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 11:36:28 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCED8C061570;
        Mon,  8 Nov 2021 08:33:43 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id j21so64682130edt.11;
        Mon, 08 Nov 2021 08:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9Rxa4GOx2fwvlQZ2whnc/TnhfZE1p0pc42KpiRaylhs=;
        b=n/8qnSZC3Cjp/oZ7CLEJ2X6v9P73IFL7f911sxu+p/MF2O04o5WsKr08m6/BfoPYl9
         /GhDWWFwCRE3OQKw6skOR7QTvO9ys2RG48tJh+RAubTHvLvK6bnBuysJ+UK5s9cDoCpK
         SHoCZPXZSgdBh8vCV+qGIHOUBDELv/pNmFqyr/oZUkYWYvV/pUeCPBbslHoP9LUWxHQS
         pTvBRUAIhO1CLl7JzjS7d9jZSNkhIaSaD3mClEVQxA1WXxL3+2OwKmMT3u75VcBabHZX
         uLwh/vHcYU10p/Z5fA7XHumMA60YmwaHkm0SMNnoI5lxJTkUvDdewY+SgYtJBF7/hHrO
         xB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9Rxa4GOx2fwvlQZ2whnc/TnhfZE1p0pc42KpiRaylhs=;
        b=Tk1IcvH97atLRQnbz50J+bSgM2U8cFCDM/M5bHm7G2S+8deQYiJT7pu6e2wz8xbjup
         Kz1UPxP8pzoq82Z/gPi2afKMhdQo+Smr5BNyooBrtO1m89VD6/7Z+VsYLDh4ZJqyAfCu
         xCaMgyYPph+BHgQp01XJztdjI3174Bf6YOXX0YYFfNtgSviGbFloN+O1T/nD/XPpMPPw
         jyD3yOs307l0RSsqQvNQhQlYfAWXogqowZ03OfJCN74LrWCZ8ehEjrVKH/YvO6tWcJ1v
         AzkYt6tr468JUD2idKTkspQERALBLGfVOMFQa7EV9eO5XQ/83sR2DWgwnikB37FMSV+W
         5SIA==
X-Gm-Message-State: AOAM533KeKSthzygSeCWL+xJ9KyxmjFH0lXOCsKh2jDlhJScUgA0R2YJ
        U4/wiS6Xv3QQ9B6sJmyoZKzHLjs7hYgccv/MnN4=
X-Google-Smtp-Source: ABdhPJzUbBKXNcxWwqbBJXazNeHjGX+wrr3eBVTqDpa+ZR9NhtiVwzLUbkHmYS7g+jGomDrMzjw634dhURflNo53ues=
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr448425edd.347.1636389220044;
 Mon, 08 Nov 2021 08:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
In-Reply-To: <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 8 Nov 2021 10:33:28 -0600
Message-ID: <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
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

On Mon, Nov 8, 2021 at 7:59 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Hi Adam,
>
> thanks for you work, I'll try and reply  about the GStreamer questions be=
low, if
> you have further question feel free to ask.
>
> Le samedi 06 novembre 2021 =C3=A0 13:37 -0500, Adam Ford a =C3=A9crit :
> > The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> > to be related to the video decoders used on the i.MX8MQ, but because of
> > how the Mini handles the power domains, the VPU driver does not need to
> > handle all the functions, so a new compatible flag is required.
> >
> > This is an RFC because I don't have functional video on my system yet,
> > and I'm hoping there might be people who do and can help test this.
> > I have only tested this far enough to see they enumerate and appear
> > as /dev/videoX and /dev/mediaX devices.
>
> I will check the patchset, but you need in the mini-variant to disable th=
e G1
> post processor, because this block was fused out. We didn't make it optio=
nal

Thanks for being willing to review this.

> from the start as according to the V1 of the TRM it was there, but that e=
rror
> was corrected in V3.

Thanks for the clarification.  It wasn't obvious to me, because in
some instances the PP looked like it was there and sometimes not
there.  I'll remove the postproc stuff.

>
> >
> > I am also curious to know if/what gstreamer plugins are necessary.  In
> > NXP's custom kernel, there are IMX-specific plugins, and I was hoping t=
here
> > would be more generic plugins that I can use to test.  I am hoping some
> > of the linux-media experts might chime in on how to best test.
>
> I will recommend using GStreamer 1.19.3 or main branch (GStreamer is now =
a
> single git repo). You will then be able to test Hantro G1 decoding of MPE=
G2,
> H264 and VP8. Remember that the related plugin depends on libgudev (a gli=
b
> binding of udev).

Thanks for the tip.

>
> For the encoder, I believe only JPEG maybe supported, since this is all t=
here is
> mainline for RK3288 (and perhaps other RK). But this will need testing an=
d
> debugging as the G1 version is slightly newer on NXP SoC.

For what it's worth the G1 seems to repond cleanly to the inquiries
from v42-compliance.
The G2 throws some splat when I run v4l2-compliance, but I am still
investigating that.

[  405.456979] ------------[ cut here ]------------
[  405.464173] WARNING: CPU: 0 PID: 563 at mm/page_alloc.c:5344
__alloc_pages+0x5a4/0xbe0
[  405.472104] Modules linked in: 8021q garp mrp stp llc caam_jr
caamhash_desc caamalg_desc crypto_engine rng_core authenc libdes
imx7_media_csi(C) crct10dif_ce imx_media_common(C)
snd_soc_fsl_asoc_card imx7_mipi_csis(C) snd_soc_imx_audmux
snd_soc_simple_card_utils fsl_imx8_ddr_perf imx8m_ddrc brcmfmac
brcmutil hantro_vpu(C) v4l2_h264 v4l2_mem2mem videobuf2_vmalloc
videobuf2_dma_contig videobuf2_memops cfg80211 ov5640 videobuf2_v4l2
v4l2_fwnode v4l2_async videobuf2_common videodev etnaviv gpu_sched
hci_uart mc btqca btbcm snd_soc_wm8962 at24 spi_imx rtc_pcf85363
rtc_snvs clk_bd718x7 spi_bitbang snvs_pwrkey snd_soc_fsl_sai
imx_pcm_dma caam error bluetooth imx8mm_thermal ecdh_generic
imx_cpufreq_dt ecc rfkill fuse drm ipv6
[  405.535835] CPU: 0 PID: 563 Comm: v4l2-compliance Tainted: G      D
 C        5.15.0-next-20211105-00010-g4bb8e8a25d3c-dirty #28
[  405.547401] Hardware name: Beacon EmbeddedWorks i.MX8M Mini
Development Kit (DT)
[  405.554797] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  405.561762] pc : __alloc_pages+0x5a4/0xbe0
[  405.565861] lr : __dma_direct_alloc_pages+0x17c/0x1e0
[  405.570917] sp : ffff800012443810
[  405.574232] x29: ffff800012443810 x28: 0000000000000000 x27: ffff0000052=
88220
[  405.581375] x26: 0000000000000034 x25: 0000000000000000 x24: ffff0000002=
59010
[  405.588517] x23: ffff80001011ab7c x22: ffff000000259010 x21: 00000000fff=
fffff
[  405.595659] x20: 0000000000000cc1 x19: 0000000000000000 x18: 00000000000=
00000
[  405.602803] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000=
00000
[  405.609947] x14: 0000000000000001 x13: 0000000000000000 x12: 00000000000=
00000
[  405.617090] x11: ffff80001241d000 x10: ffff00000528833a x9 : ffff0000052=
8832a
[  405.624232] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 00000000000=
00cc0
[  405.631378] x5 : 00000000bfffffff x4 : ffff000009e30dc0 x3 : 00000000000=
00000
[  405.638520] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000000=
00cc1
[  405.645666] Call trace:
[  405.648113]  __alloc_pages+0x5a4/0xbe0
[  405.651862]  __dma_direct_alloc_pages+0x17c/0x1e0
[  405.656569]  dma_direct_alloc+0x70/0x310
[  405.660494]  dma_alloc_attrs+0x7c/0xe4
[  405.664246]  hantro_hevc_get_ref_buf+0x15c/0x184 [hantro_vpu]
[  405.670021]  hantro_g2_hevc_dec_run+0x3b8/0x1910 [hantro_vpu]
[  405.675791]  device_run+0xac/0x110 [hantro_vpu]
[  405.680345]  v4l2_m2m_try_run+0xac/0x1b0 [v4l2_mem2mem]
[  405.685598]  v4l2_m2m_ioctl_streamon+0x84/0xa0 [v4l2_mem2mem]
[  405.691366]  v4l_streamon+0x28/0x34 [videodev]
[  405.695877]  __video_do_ioctl+0x178/0x3dc [videodev]
[  405.700897]  video_usercopy+0x368/0x6dc [videodev]
[  405.705745]  video_ioctl2+0x1c/0x30 [videodev]
[  405.710246]  v4l2_ioctl+0x44/0x64 [videodev]
[  405.714574]  __arm64_sys_ioctl+0xac/0xf0
[  405.718502]  invoke_syscall+0x48/0x114
[  405.722258]  el0_svc_common.constprop.0+0xd4/0xfc
[  405.726969]  do_el0_svc+0x2c/0x94
[  405.730286]  el0_svc+0x28/0x80
[  405.733348]  el0t_64_sync_handler+0xa8/0x130
[  405.737619]  el0t_64_sync+0x1a0/0x1a4
[  405.741287] ---[ end trace 270ed4a899803006 ]---

The H1 encoder seems to hang the system when I run v4l2-compliance on
it when H1 is set up as I submitted the patch.  I tried dropping all
the encoder formats except the JPEG format, and it doesn't hang any
more, but it also doesn't really do anything.
The datasheet only references VPU_H1 as supporting VP8 and H.264, so I
am not sure JPEG is even supported.

The log from v4l2-compliance on the H1 with everything except the JPEG
removed looks like:

root@beacon-imx8mm-kit:~# v4l2-compliance -d2
v4l2-compliance SHA: not available
, 64 bits, 64-bit time_t

Segmentation fault
root@beacon-imx8mm-kit:~#
Message from syslogd@  at Thu Jan  1 00:05:07 1970 ...
: Internal error: Oops: 96000004 [#2] SMP

Message from syslogd@  at Thu Jan  1 00:05:07 1970 ...
: Code: 52800001 aa1403e0 d2801802 95c31ab9 (b9400aa1)

I want to install Gstreamer, but I don't have functioning DSI video,
so I am not entirely sure how I will go about testing the decoders
except by using fakesink

If the G1 ends up working with some of the newer Gstreamer stuff, I
might just submit a formal patch to just enable the G1 for now.

adam
>
> >
> > Lastly, I didn't update any device tree binding YAML files, because
> > I know there have been some discussions about the power domains on the
> > imx8mq, and I wasn't sure if the imx8mm should get a separate YAML file
> > or if the existing one for te imx8mq should just be modified.
> >
> > This will likely require the following series in order to apply correct=
ly:
> > https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D57=
6407
> >
> > Adam Ford (5):
> >   media: hantro: Add support for i.MX8M Mini
> >   arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
> >   media: hantro: Rename ROCKCHIP_VPU_ENC_FMT to HANTRO_VPU_ENC_FMT
> >   media: hantro: Add H1 encoder support on i.MX8M Mini
> >   arm64: dts: imx8mm:  Enable Hantro H1 Encoder
> >
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  61 ++++++++
> >  drivers/staging/media/hantro/hantro_drv.c     |   3 +
> >  drivers/staging/media/hantro/hantro_hw.h      |  19 ++-
> >  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 143 ++++++++++++++++++
> >  .../staging/media/hantro/rockchip_vpu_hw.c    |  26 ++--
> >  5 files changed, 231 insertions(+), 21 deletions(-)
> >
>
