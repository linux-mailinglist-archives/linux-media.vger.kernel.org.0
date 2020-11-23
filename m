Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5A92C0975
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 14:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388696AbgKWNHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 08:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732867AbgKWMtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 07:49:08 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69979C061A4E
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 04:49:05 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id y4so16936057edy.5
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 04:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GyUtXV4I7oufOCmRehbSbZihfE2dNAsjJjjjrmEuICw=;
        b=xzdEz6kB4zBik1uOatoshaBm6LaSKmUojijYt8h9dh2QGrUS76eruUvLIzkSH0eGEe
         DOl+Li0VGvprWuzJGUffQBqShHCUBvn0FG05F8PWA7Ix6v7nmuwvqau9BuAUXtBuzc9P
         biFtftXYWUdPL666mAAt48VYycPt4mDE/nFamResc8Jm6tepnfAiJpTSHUAnPk79ypk0
         LDR50k++wjeWldDm+gC03roaoqPBQQqL0fsaZikOBH87K99u1MRrLTd13dwLHowdkXpQ
         ztf6f/03UDNnrWdRmhDlhaGsgjm9AQ0a+uIiw96KobpddpBrzU5tcbP8H1dC1S7gVEf2
         xPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GyUtXV4I7oufOCmRehbSbZihfE2dNAsjJjjjrmEuICw=;
        b=iVyl3rd/ZOje67NjPX8kc+wXBrV5qAY8ZNHOQ1qPmB7BQDfj3Hrc/mmtZD0EfyUEGd
         eMnP64GaVzCy3lnhrHbiboNUVakqnTo1CMh8tO7HY2zJCWAd/XUyfjhX1QYR8zFiZswe
         CIW4yyxVbz9WLoF9zfTqujZLCL2MFkGal1BY/NOUTntjf64dqh73VB2iV+Ufh66QNtCi
         XKl/xewEwkUn+pqWqEifc+i+/Y+dpdfGCvzMqop04TI5xFft6dfrgYSnGtuKISZWqFW5
         8s+Slad6br3V0XLnsDSHv24m5xBPkIs+gpaE/qr2+ZTvuDYiM6Jw5CQ2x1ldih6rPBub
         2CWw==
X-Gm-Message-State: AOAM532nkHWR3PvRhJfuThlXN74OFPXRIzuX+3KhazEb8TvUUN+fNkuw
        AW1+6P4oLUrpo4CjrTZj4LMQr1u85DR8xJo4qsvqoQ==
X-Google-Smtp-Source: ABdhPJzlanZtbb9BGdfii0DcE9OSCvj2yyVYSpep2MYBMNOh1SH5wMpSHxztxzQJLoz9y7yPdd5mKxJnY6cjP3OZ38I=
X-Received: by 2002:aa7:cb52:: with SMTP id w18mr38774344edt.362.1606135744041;
 Mon, 23 Nov 2020 04:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20200922165535.1356622-1-maxime.chevallier@bootlin.com>
 <20200922165535.1356622-3-maxime.chevallier@bootlin.com> <CAAEAJfCcPRnyjPozXG9rjovO+cJ6ZZBadShs_X9DQCrjSj7mUw@mail.gmail.com>
 <20201123082122.49a08ebb@bootlin.com>
In-Reply-To: <20201123082122.49a08ebb@bootlin.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 23 Nov 2020 09:48:51 -0300
Message-ID: <CAAEAJfD9r=skAPAEZX50Y-EnbeZRy+LEnERR_rvkcoghESEn2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: rockchip: Introduce driver for Rockhip's
 camera interface
To:     Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Mon, 23 Nov 2020 at 04:21, Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi Ezequiel, and thanks a lot for the review !
>
> On Fri, 2 Oct 2020 14:35:28 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
> > Hi Maxime,
> >
> >Thanks to Dafna, I found the patch ^_^
> >
> >The driver looks real good. Just a few comments below.
> >
> >Is the driver passing latest v4l2-compliance tests?
>
> I'll post them along with the next iteration of the series.
>
> >> +config VIDEO_ROCKCHIP_VIP
> >> +       tristate "Rockchip VIP (Video InPut) Camera Interface"
> >> +       depends on VIDEO_DEV && VIDEO_V4L2
> >> +       depends on ARCH_ROCKCHIP || COMPILE_TEST
> >> +       select VIDEOBUF2_DMA_SG
> >> +       select VIDEOBUF2_DMA_CONTIG
> >> +       select V4L2_FWNODE
> >> +       select V4L2_MEM2MEM_DEV
> >> +       help
> >> +         This is a v4l2 driver for Rockchip SOC Camera interface.
> >> +
> >> +         To compile this driver as a module choose m here.
> >> +
> >
> >Please add ... "the module will be called {the name}".
>
> Sure, I will do !
>
> [...]
>
> >> +#define VIP_REQ_BUFS_MIN       1
> >
> >I think you might want to have more than 1 buffer
> >as minimum. How about 3? Two for the ping and pong,
> >and one more in the queue.
>
> Yes you're correct, 3 should be the strict minimum required buffers
> here, I didn't update that after adding the dual-buffering mode.
>
> >> +#define VIP_MIN_WIDTH          64
> >> +#define VIP_MIN_HEIGHT         64
> >> +#define VIP_MAX_WIDTH          8192
> >> +#define VIP_MAX_HEIGHT         8192
> >> +
> >> +#define RK_VIP_PLANE_Y                 0
> >> +#define RK_VIP_PLANE_CBCR              1
> >> +
> >> +#define VIP_FETCH_Y_LAST_LINE(VAL) ((VAL) & 0x1fff)
> >> +/* Check if swap y and c in bt1120 mode */
> >> +#define VIP_FETCH_IS_Y_FIRST(VAL) ((VAL) & 0xf)
> >> +
> >> +/* Get xsubs and ysubs for fourcc formats
> >> + *
> >> + * @xsubs: horizontal color samples in a 4*4 matrix, for yuv
> >> + * @ysubs: vertical color samples in a 4*4 matrix, for yuv
> >> + */
> >> +static int fcc_xysubs(u32 fcc, u32 *xsubs, u32 *ysubs)
> >
> >See below, you should be using v4l2_fill_pixfmt_mp.
> >
> >> +{
> >> +       switch (fcc) {
> >> +       case V4L2_PIX_FMT_NV16:
> >> +       case V4L2_PIX_FMT_NV61:
> >> +               *xsubs = 2;
> >> +               *ysubs = 1;
> >> +               break;
> >> +       case V4L2_PIX_FMT_NV21:
> >> +       case V4L2_PIX_FMT_NV12:
> >> +               *xsubs = 2;
> >> +               *ysubs = 2;
> >> +               break;
> >> +       default:
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct vip_output_fmt out_fmts[] = {
> >> +       {
> >> +               .fourcc = V4L2_PIX_FMT_NV16,
> >> +               .cplanes = 2,
> >
> >From what I can see, you are only using this
> >information to calculate bytesperline and sizeimage,
> >so you should be using the v4l2_fill_pixfmt_mp() helper.
>
> You're correct, it indeed makes things much easier and allowed to
> removed a lot of redundant info here !
>
>
> >> +static void rk_vip_set_fmt(struct rk_vip_stream *stream,
> >> +                          struct v4l2_pix_format_mplane *pixm,
> >> +                          bool try)
> >> +{
> >> +       struct rk_vip_device *dev = stream->vipdev;
> >> +       struct v4l2_subdev_format sd_fmt;
> >> +       const struct vip_output_fmt *fmt;
> >> +       struct v4l2_rect input_rect;
> >> +       unsigned int planes, imagesize = 0;
> >> +       u32 xsubs = 1, ysubs = 1;
> >> +       int i;
> >> +
> >
> >I was expecting to see some is_busy or is_streaming check
> >here, have you tested what happens if you change the format
> >while streaming, or after buffers are queued?
>
> Yes correct. I used the stream->state private flag here, but I it was
> also brought to my attention that there also exists a vb2_is_busy()
> helper, but I'm unsure if it would be correct to use it here.
>

Long story, short: when the application creates buffers,
with e.g. REQBUF (see vb2_core_reqbufs), it will call
the driver (vb2_ops.queue_setup), to get the planes' sizes.

In the current model, for a given vb2 queue, all the buffers
are the same size. In practice, the simpler way to express
this is not allowing S_FMT if there are buffers allocated
in the queue (vb2_is_busy).

You could relax the vb2_is_busy requirement in your driver,
but I usually find it's not worth the trouble.

>
> >> +
> >> +static int rk_vip_g_input(struct file *file, void *fh, unsigned int *i)
> >> +{
> >> +       *i = 0;
> >> +       return 0;
> >> +}
> >> +
> >> +static int rk_vip_s_input(struct file *file, void *fh, unsigned int i)
> >> +{
> >
> >Only one input, why do you need to support this ioctl at all?
>
> I actually saw a fair amount of existing drivers implementing these
> callbacks even for only one input, so I don't really know if I should
> remove it or not ?
>

S_INPUT is used e.g. on capture devices that have multiple
inputs and can capture from one input at a time.

If the ioctl is empty like this, the driver can simply not support
the ioctl.

Best regards,
Ezequiel
