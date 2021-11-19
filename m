Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4652F45799F
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 00:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235994AbhKSXke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 18:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235960AbhKSXke (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 18:40:34 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44C1C061574;
        Fri, 19 Nov 2021 15:37:31 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z5so49105197edd.3;
        Fri, 19 Nov 2021 15:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YElH7fDjQntk4O6oWmKV9CpChk3+XDAXIgAyTvCwk/o=;
        b=MlsqkbYesK3dxd/H4c0ua70hxauFyFyOCcRN5R8BahVc9rkz7EKCbkgh9DoHnzX6f3
         4Rq90CarVs+RHB3Qjju2KTkWd8uC/K2+dYVRUbrYu5hWfKUsZXOVFtRHtRNqUUHnSA1M
         6EqTn0Ss0QP644yqbYejA0R0XYFbp6rNvgoQLYfHf1R8EIkrHdYeeuS60u6PuEpQFrCo
         875VZ6fxaf4K8ORy5gKLTjj1AGeG4ItoIG0jdfSkm43YAwfpfWbN5h3fXd5ghLI0mFuv
         KK9yltBMGW5yyQ0q3ULUM6L48L/1YrR4kKSwQliD2EBf293zd84Uw6h56rm/7S4NyAwo
         KpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YElH7fDjQntk4O6oWmKV9CpChk3+XDAXIgAyTvCwk/o=;
        b=Rb/tDdGteZuAOBHXcZlv+TIv3PVvhAyoMCL9DbMMVKdyr9Eoe3Vc8pCSJsH6ratdzR
         SoYYSNpoQr19r8vYbaymhP22ZkkB3O7dZS7zH4nipblGKZlrmxhl1s/90mmZ/eVTJkUv
         cUijsBOtQu81HO5YYQ3ntriW90XE2qHsCaDZhxZt3D3YLTJWNzvILP+gm1OEcVsyi2rF
         rvrJWpdhx05pSe3baFKc7snJ4P855vlo8xrnbBeYzsJCBMLTkTcZyU4iXDrgMoMGWEsG
         RHVnqgUEWOMX4pR3CXc15diBMpoh24eCAXmUvzQvLlAo/HGpu2xrwANHCBTFibzFvzn4
         f/mQ==
X-Gm-Message-State: AOAM533pROrWFhvKhx51J1upgYqQpxJXSTnAYjDTaFYGrjlgkvdYseZe
        mUaVKO7j7TE88HhWiwXqgIWNCAPug6gi2VwJui0=
X-Google-Smtp-Source: ABdhPJxJ4ZWYivE0w4Q4WW7YZS7F/iJXk9r+NIHyQvxAUA774a966nD2JYYjEnuNp/44x3wmF0FV7AD6YohoamlMQzg=
X-Received: by 2002:a17:907:94c2:: with SMTP id dn2mr717004ejc.325.1637365049993;
 Fri, 19 Nov 2021 15:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
 <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
 <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
 <d91532c2c0772f9aa708ead36b2a97203727a7ea.camel@ndufresne.ca>
 <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
 <CAHCN7x+0LwwU_rEST+TZxGquswGKL19gnTy9WLofsXtGAtWqdw@mail.gmail.com> <7f94eaacfddb8c5434c17f1e069ea87a17657ce9.camel@ndufresne.ca>
In-Reply-To: <7f94eaacfddb8c5434c17f1e069ea87a17657ce9.camel@ndufresne.ca>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 19 Nov 2021 17:37:18 -0600
Message-ID: <CAHCN7xKRzxMBmPbDobWTuvNNSpTXk5XENvfBnfkhRY3eZKhn6w@mail.gmail.com>
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

On Fri, Nov 19, 2021 at 10:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi Adam, Tim,
>
> [...]
> > > > > Nicolas and Adam,
> > > > >
> > > > > For the H1 patches in this series: I've been able to test the IMX8MM
> > > > > H1 JPEG encode using GStreamer 1.18.5:
> > > > > $ gst-inspect-1.0 | grep -e "v4l2.*enc"
> > > > > video4linux2:  v4l2jpegenc: V4L2 JPEG Encoder
> > > > > $ gst-launch-1.0 videotestsrc ! jpegenc ! rtpjpegpay ! udpsink
> > > >                                   ^ v4l2jpegenc
> > > >
> > > > This is just a transcript error ?
> > >
> > > Nicolas,
> > >
> > > No! Thanks for catching my mistake. I was testing with software encode... ooops!
> > >
> > > 'gst-launch-1.0 videotestsrc ! v4l2jpegenc ! fakesink' actually hangs
> > > the board so likely a power-domain issue there?
> >
> > The v4l2-compliance tests fail on the h1 decoder with a hang, but I
> > think we're writing to registers which are not documented in the Mini
> > TRM.  The Mini TRM doesn't explicitly show the JPEG encoding as a
> > feature, but some of the registers state JPEG, but because some of the
> > registers written for the H1 are not documented in the TRM.  If those
> > registers are restricted or not in this SoC, I am concerned that it
> > might be related.  I'll try to run some more tests this weekend to
> > check on the status of the power-domain stuff.
>
> To verify if the HW support JPEG encoding you can read SWREG63 bit 25. This is
> in the TRM, just not labelled properly. To mimic the decoding side, would be "HW
> synthesis config register X" with the bit labelled SW_ENC_JPEG_PROF (but
> PROF/profile is on or off). If your board hang while reading this, you likely
> didn't get the power bit right.
>
> IMX8 has an undocumented control block thing that we have been fighting with in
> imx8q,  perhaps that's your issue. Few driver was proposed, we are still pending
> on NXP solution to be submitted (they asked us to wait, still waiting =)).

Nicolas,

Thanks for the suggestion to read offset FC.  There was an attempt
made by Lucas Stach to develop a VPU blk-ctrl driver to coordinate the
power-domains with the GPC driver. Unfortunately, it does appear to
hang, so it might not be operating correctly.

Lucas,

Do you have any idea of stuff I can try to see if the power domain is
coming online correctly?

[   10.434727] imx-pgc imx-pgc-domain.6: request the vpumix domain to power up
[   10.463647] imx-pgc imx-pgc-domain.6: request the vpumix ADB400 to power up
[   10.517155] imx-pgc imx-pgc-domain.6: genpd vpumix success
[   10.728927] vpu: set fuse bits to enable
[   10.825500] imx8m-blk-ctrl 38330000.blk-ctrl: power vpublk-g1 GPC domain
[   10.878986] imx-pgc imx-pgc-domain.7: request the vpu-g1 domain to power up
[   10.932429] imx-pgc imx-pgc-domain.7: genpd vpu-g1 success
[   10.971988] imx8m-blk-ctrl 38330000.blk-ctrl: genpd vpublk-g1 success
[   11.004726] hantro-vpu 38300000.video-codec: registered
nxp,imx8mm-vpu-dec as /dev/video0
[   11.040760] imx8m-blk-ctrl 38330000.blk-ctrl: power vpublk-g2 GPC domain
[   11.066181] imx-pgc imx-pgc-domain.8: request the vpu-g2 domain to power up
[   11.087887] imx-pgc imx-pgc-domain.8: genpd vpu-g2 success
[   11.113808] imx8m-blk-ctrl 38330000.blk-ctrl: genpd vpublk-g2 success
[   11.139634] hantro-vpu 38310000.video-codec: registered
nxp,imx8mm-vpu-g2-dec as /dev/video1
[   11.156463] imx8m-blk-ctrl 38330000.blk-ctrl: power vpublk-h1 GPC domain
[   11.170817] imx-pgc imx-pgc-domain.9: request the vpu-h1 domain to power up
[   11.232990] imx-pgc imx-pgc-domain.9: genpd vpu-h1 success
[   11.252546] imx8m-blk-ctrl 38330000.blk-ctrl: genpd vpublk-h1 success
[   11.266152] hantro-vpu 38320000.video-codec: Checking vpu->enc_base + 0xfc

<hang>

adam

>
> > >
> > > >
> > > > > host=192.168.1.146 port=5000
> > > > > viewed on client@192.168.1.146 via:
> > > > > $ gst-launch-1.0 udpsrc port=5000 ! application/x-rtp,payload=96 !
> > > > > rtpjpegdepay ! jpegdec ! autovideosink
> > > > >
> > > > > For the G1/G2 patches in the series I don't see any Gstreamer
> > > > > 'v4l2.*dec' elements. Perhaps I need a newer version of Gstreamer.
> > > >
> > > > Most likely yes, I suggest building gstreamer/ branch "main", GStreamer has now
> > > > a single repository. We are very close to 1.20, which will include stable API
> > > > support of H264, MPEG2 and VP8 decoding.
> > > >
> > >
> > > Ok, let me see if I can navigate through the build process and I'll
> > > get back to you.
> > >
> > > Thanks,
> > >
> > > Tim
> > >
> > > > >
> > > > > I have CSI capture and DSI display currently working on
> > > > > imx8mm-venice-gw73xx-0x that I can play with. The CSI sensor only
> > > > > supports RAW8/RAW10 (and gstreamer currently only supports RAW8) and I
> > > > > can't efficiently convert to something the JPEG encoder likes without
> > > > > bayer2rgbneon (a libneon version).
> > > > >
> > > > > I see from the IMX8MMRM that the 2D GPU supports scaling etc with a
> > > > > wide range of data formats but I'm not sure how to tap into this as
> > > > > that hardware is managed by the vivante driver. On the IMX6QDL there
> > > > > is a separate IPU block that Philipp Zabel wrote a nice mem2mem
> > > > > csc/scaler driver for but I don't see any equivalent currently for
> > > > > IMX8MM.
> > > > >
> > > > > Best regards,
> > > > >
> > > > > Tim
> > > >
>
