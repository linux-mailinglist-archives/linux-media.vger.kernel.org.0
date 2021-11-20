Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFA6457F01
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 16:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhKTPjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 10:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhKTPjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 10:39:31 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9392C061574;
        Sat, 20 Nov 2021 07:36:27 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id w1so55866911edc.6;
        Sat, 20 Nov 2021 07:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lFBgdagvfj9hhxv3IEdDgaDBd52bTGyq0WBPlUMIXIA=;
        b=EuFwYQiqpqkm9mUUFv3u+9eUrbqyoTO+gtiK5tuX+U3rA55RCyUxDKrCn1OrMEdNid
         K9lYt6jhzqExdcRUMRMR2pL3/YdTz2eA5SrnBgq+QGPf8IMAnB1S3vE03t0yWP4oL77R
         mGLLrPRnO4bpQShcMq/Ew8avvbdbHCbJ263lHt0ev865YxhHiDTLKTc9U9wdczePtR84
         t6d1CdFKOlK0YfXUJ11otswsXe6sFkd6Ja6G4tR86oXT50O94ZhV81D5H9WpRc/OHP6i
         f6NNZcYG5QhCH+vFcetJnMilNcjIpss2CNJndtTJbI2GUr9zLHR3sncvx/JpH6QkgeXj
         cLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lFBgdagvfj9hhxv3IEdDgaDBd52bTGyq0WBPlUMIXIA=;
        b=pl4aoPagdtithe5yIzrFpfeV+p9mVPL4Gws8I0jAuDEE5vDLunsybpadVrLLpzxQMj
         UUjBo4QRM9MNmtJkagEJsrKPbKlz3UgV5FOd1DG6EvnmKUdzvU3IFlQccWYzihx2MJDa
         eYwIUGArE4JmYbGtgLzR4tEcmRrPpC5p8Bx/QKH4oEtroXe+kv+ENsud/lJ0LeIPUepj
         7WA5KWGfWbjWjg+z1iAZXdZanONP8CU0d+Cl71y9ZUZ+zt4Ub3uMvVIfAhzc+dh/EwG3
         Qd0mQL+hiJwOzWI7UsfKfunzlrTwuoZS75jIPadHw5TftT3ToQch35zOLNHbJJDTe9XS
         0qBA==
X-Gm-Message-State: AOAM530lXPpXZTdCPXHILuQnfbSk0bayiGBvKdPmkN+PdSKK1r5hVwEI
        iTzHpPytUpmVpMYuBLQZE0VErJfO4PDsI6Jpys8=
X-Google-Smtp-Source: ABdhPJwf1oM/7o8Qza8mLwNjoE4V0eaLDBF+tVzyW98wajqYlqH36VC/WpDIrPHJprCtda3CK101ib4ne75HgIGnieg=
X-Received: by 2002:a17:907:94c2:: with SMTP id dn2mr7972165ejc.325.1637422585888;
 Sat, 20 Nov 2021 07:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
 <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
 <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
 <d91532c2c0772f9aa708ead36b2a97203727a7ea.camel@ndufresne.ca>
 <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
 <CAHCN7x+0LwwU_rEST+TZxGquswGKL19gnTy9WLofsXtGAtWqdw@mail.gmail.com>
 <7f94eaacfddb8c5434c17f1e069ea87a17657ce9.camel@ndufresne.ca> <CAHCN7xKRzxMBmPbDobWTuvNNSpTXk5XENvfBnfkhRY3eZKhn6w@mail.gmail.com>
In-Reply-To: <CAHCN7xKRzxMBmPbDobWTuvNNSpTXk5XENvfBnfkhRY3eZKhn6w@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 20 Nov 2021 09:36:14 -0600
Message-ID: <CAHCN7xJFLNi_g+HX8PCy1Rkgf0jnWpO5QGYVz8nH19xrJkwHrA@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Tim Harvey <tharvey@gateworks.com>,
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
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 19, 2021 at 5:37 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Nov 19, 2021 at 10:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> >
> > Hi Adam, Tim,
> >
> > [...]
> > > > > > Nicolas and Adam,
> > > > > >
> > > > > > For the H1 patches in this series: I've been able to test the IMX8MM
> > > > > > H1 JPEG encode using GStreamer 1.18.5:
> > > > > > $ gst-inspect-1.0 | grep -e "v4l2.*enc"
> > > > > > video4linux2:  v4l2jpegenc: V4L2 JPEG Encoder
> > > > > > $ gst-launch-1.0 videotestsrc ! jpegenc ! rtpjpegpay ! udpsink
> > > > >                                   ^ v4l2jpegenc
> > > > >
> > > > > This is just a transcript error ?
> > > >
> > > > Nicolas,
> > > >
> > > > No! Thanks for catching my mistake. I was testing with software encode... ooops!
> > > >
> > > > 'gst-launch-1.0 videotestsrc ! v4l2jpegenc ! fakesink' actually hangs
> > > > the board so likely a power-domain issue there?
> > >
> > > The v4l2-compliance tests fail on the h1 decoder with a hang, but I
> > > think we're writing to registers which are not documented in the Mini
> > > TRM.  The Mini TRM doesn't explicitly show the JPEG encoding as a
> > > feature, but some of the registers state JPEG, but because some of the
> > > registers written for the H1 are not documented in the TRM.  If those
> > > registers are restricted or not in this SoC, I am concerned that it
> > > might be related.  I'll try to run some more tests this weekend to
> > > check on the status of the power-domain stuff.
> >
> > To verify if the HW support JPEG encoding you can read SWREG63 bit 25. This is
> > in the TRM, just not labelled properly. To mimic the decoding side, would be "HW
> > synthesis config register X" with the bit labelled SW_ENC_JPEG_PROF (but
> > PROF/profile is on or off). If your board hang while reading this, you likely
> > didn't get the power bit right.
> >
> > IMX8 has an undocumented control block thing that we have been fighting with in
> > imx8q,  perhaps that's your issue. Few driver was proposed, we are still pending
> > on NXP solution to be submitted (they asked us to wait, still waiting =)).
>
> Nicolas,
>
> Thanks for the suggestion to read offset FC.  There was an attempt
> made by Lucas Stach to develop a VPU blk-ctrl driver to coordinate the
> power-domains with the GPC driver. Unfortunately, it does appear to
> hang, so it might not be operating correctly.
>
> Lucas,
>
> Do you have any idea of stuff I can try to see if the power domain is
> coming online correctly?
>
> [   10.434727] imx-pgc imx-pgc-domain.6: request the vpumix domain to power up
> [   10.463647] imx-pgc imx-pgc-domain.6: request the vpumix ADB400 to power up
> [   10.517155] imx-pgc imx-pgc-domain.6: genpd vpumix success
> [   10.728927] vpu: set fuse bits to enable
> [   10.825500] imx8m-blk-ctrl 38330000.blk-ctrl: power vpublk-g1 GPC domain
> [   10.878986] imx-pgc imx-pgc-domain.7: request the vpu-g1 domain to power up
> [   10.932429] imx-pgc imx-pgc-domain.7: genpd vpu-g1 success
> [   10.971988] imx8m-blk-ctrl 38330000.blk-ctrl: genpd vpublk-g1 success
> [   11.004726] hantro-vpu 38300000.video-codec: registered
> nxp,imx8mm-vpu-dec as /dev/video0
> [   11.040760] imx8m-blk-ctrl 38330000.blk-ctrl: power vpublk-g2 GPC domain
> [   11.066181] imx-pgc imx-pgc-domain.8: request the vpu-g2 domain to power up
> [   11.087887] imx-pgc imx-pgc-domain.8: genpd vpu-g2 success
> [   11.113808] imx8m-blk-ctrl 38330000.blk-ctrl: genpd vpublk-g2 success
> [   11.139634] hantro-vpu 38310000.video-codec: registered
> nxp,imx8mm-vpu-g2-dec as /dev/video1
> [   11.156463] imx8m-blk-ctrl 38330000.blk-ctrl: power vpublk-h1 GPC domain
> [   11.170817] imx-pgc imx-pgc-domain.9: request the vpu-h1 domain to power up
> [   11.232990] imx-pgc imx-pgc-domain.9: genpd vpu-h1 success
> [   11.252546] imx8m-blk-ctrl 38330000.blk-ctrl: genpd vpublk-h1 success
> [   11.266152] hantro-vpu 38320000.video-codec: Checking vpu->enc_base + 0xfc
>
> <hang>
>
> adam
>

Nicolas, Tim, and Lucas,

I think I have the hanging resolved in the power domains, and I'll be
pushing the fix to the GPCv2.

For the H1 Encoder, I added some debugging code to read the offset
0xfc and print some data based on the findings of that VPU-h1 offset.
I basically check the various bits per the TRM to see if they are set
and print some splat to indicate whether or not the function is
supported.

[    8.861865] hantro-vpu 38320000.video-codec: Checking vpu->enc_base + 0xfc
[    8.870594] hantro-vpu 38320000.video-codec: Stabilization supported by HW
[    8.889341] hantro-vpu 38320000.video-codec: VP8 encoding supported by HW
[    8.899386] hantro-vpu 38320000.video-codec: H.264 encoding supported by HW
[    8.918171] hantro-vpu 38320000.video-codec: RGB to YUV conversion
supported by HW
[    8.934067] hantro-vpu 38320000.video-codec: registered
nxp,imx8mm-vpu-h1-enc as /dev/video2

Unfortunately, JPEG is not listed as supported.  :-(

However, the hanging stops occurring, so I'll be posting a patch to
update the GPCv2 code.  I can reduce sone device tree duplication, and
the G2 throws some splat, but that will be a separate discussion.

I can also run v4l2-compliance on the H1 node, and it responds without hanging.

root@beacon-imx8mm-kit:~# v4l2-compliance -d2
v4l2-compliance SHA: not available
, 64 bits, 64-bit time_t

Compliance test for hantro-vpu device /dev/video2:

Driver Info:
Driver name      : hantro-vpu
Card type        : nxp,imx8mm-vpu-h1-enc
Bus info         : platform: hantro-vpu
Driver version   : 5.16.0
Capabilities     : 0x84204000
Video Memory-to-Memory Multiplanar
Streaming
Extended Pix Format
Device Capabilities
Device Caps      : 0x04204000
Video Memory-to-Memory Multiplanar

< snip>

Total for hantro-vpu device /dev/video2: 46, Succeeded: 46, Failed: 0,
Warnings: 0

I'll do an RFCv2 on the Hantro G1 and G2 with the H1 removed based on
the updated GPCv2 code I'll be pushing shortly, but at least the
system doesn't hang, so I'm fairly confident the power domains are
working better now even if we cannot support the JPEG.

adam

> >
> > > >
> > > > >
> > > > > > host=192.168.1.146 port=5000
> > > > > > viewed on client@192.168.1.146 via:
> > > > > > $ gst-launch-1.0 udpsrc port=5000 ! application/x-rtp,payload=96 !
> > > > > > rtpjpegdepay ! jpegdec ! autovideosink
> > > > > >
> > > > > > For the G1/G2 patches in the series I don't see any Gstreamer
> > > > > > 'v4l2.*dec' elements. Perhaps I need a newer version of Gstreamer.
> > > > >
> > > > > Most likely yes, I suggest building gstreamer/ branch "main", GStreamer has now
> > > > > a single repository. We are very close to 1.20, which will include stable API
> > > > > support of H264, MPEG2 and VP8 decoding.
> > > > >
> > > >
> > > > Ok, let me see if I can navigate through the build process and I'll
> > > > get back to you.
> > > >
> > > > Thanks,
> > > >
> > > > Tim
> > > >
> > > > > >
> > > > > > I have CSI capture and DSI display currently working on
> > > > > > imx8mm-venice-gw73xx-0x that I can play with. The CSI sensor only
> > > > > > supports RAW8/RAW10 (and gstreamer currently only supports RAW8) and I
> > > > > > can't efficiently convert to something the JPEG encoder likes without
> > > > > > bayer2rgbneon (a libneon version).
> > > > > >
> > > > > > I see from the IMX8MMRM that the 2D GPU supports scaling etc with a
> > > > > > wide range of data formats but I'm not sure how to tap into this as
> > > > > > that hardware is managed by the vivante driver. On the IMX6QDL there
> > > > > > is a separate IPU block that Philipp Zabel wrote a nice mem2mem
> > > > > > csc/scaler driver for but I don't see any equivalent currently for
> > > > > > IMX8MM.
> > > > > >
> > > > > > Best regards,
> > > > > >
> > > > > > Tim
> > > > >
> >
