Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F3A2185DB
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 13:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgGHLQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 07:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728857AbgGHLQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 07:16:21 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E572C08E6DC
        for <linux-media@vger.kernel.org>; Wed,  8 Jul 2020 04:16:21 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g20so41167819edm.4
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2020 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CdwpVavIhJUD7vXYln0/fSWFQcR1sKy4c4EKyNGt1KE=;
        b=Rs2Sa1lnkQKChXkd7xhZlGwreJr9QaH1p6239KxXihfwiVyXNZOgAUdWxiHMMUvt55
         CeVSJTZqvi6HXZ2/FJrWrskIMQsbz1GnKwLHLfKDMNUay9vMlRkDfBLpUssylt6OzaoF
         riqSgNx6iqbXp3y7TtU5UeG82csNA2jr4Gua0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CdwpVavIhJUD7vXYln0/fSWFQcR1sKy4c4EKyNGt1KE=;
        b=VKzWwkC0RsLeTOG2v8KqA5psz+dpiceCAxkvRjzIwPIYkqJBhODWx3/eAJE3xpW28i
         /HTN8/1C9Sk56x49lE+RxU+Lm/7uQjYS/ILV9Lnd62Gyz1zA3HRgPsxalse4Y0WAKfGM
         h7jk4q9soCsmUrIeJrqr82/QeTHBZB9T1nk7ci0TMqTyK/spaqhp4wwtYZ6trxGRK0M+
         zdGWn6XWWXqYsapedvgA3ALQWCasahiJPPdEZ3d9RPpcuQiw7+8MAz+hawpmEc2C9YSs
         DO9htRsWMfseeMgLnYcYUB1/tc5Ce60Ae9JAoz+7rNGFYOUWleF2+Wr9sDeqq3Idq/4d
         cqnw==
X-Gm-Message-State: AOAM530VEw9lDt4rrc41N1mqxqYiBxFaFmF8cregzaShzxYLIeTziwJf
        pDXa2Ikppme7DVGhHiOD43mD8LG+YQOL6w==
X-Google-Smtp-Source: ABdhPJxM7CEokKmZnvR/tbhhRtzIkxeAMcvLerKZRcPrent0k2FZ72PGSlWh11LEvZL76/otAPvlzA==
X-Received: by 2002:a50:e387:: with SMTP id b7mr64669434edm.190.1594206979844;
        Wed, 08 Jul 2020 04:16:19 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id u60sm28248836edc.59.2020.07.08.04.16.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:16:18 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id b6so48479799wrs.11
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2020 04:16:18 -0700 (PDT)
X-Received: by 2002:adf:f34f:: with SMTP id e15mr58865505wrp.415.1594206977532;
 Wed, 08 Jul 2020 04:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-20-xia.jiang@mediatek.com> <20200611184640.GC8694@chromium.org>
 <1593485781.20112.43.camel@mhfsdcap03> <20200630165301.GA1212092@chromium.org>
 <1594104314.4473.24.camel@mhfsdcap03> <CAAFQd5CONkGrESiq2hZ9RWZK8FU0av4LjEQi4bc_c5Nu+sRPEA@mail.gmail.com>
 <1594192410.14412.11.camel@mhfsdcap03>
In-Reply-To: <1594192410.14412.11.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 8 Jul 2020 13:16:06 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DeV9uEnhKRa9-fcyDK53Zn2meKUg5Nwm3QORz+ZhGpAQ@mail.gmail.com>
Message-ID: <CAAFQd5DeV9uEnhKRa9-fcyDK53Zn2meKUg5Nwm3QORz+ZhGpAQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        mojahsu@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <maoguang.meng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        Xia Jiang <xia.jiang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 8, 2020 at 9:14 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Tue, 2020-07-07 at 15:35 +0200, Tomasz Figa wrote:
> > On Tue, Jul 7, 2020 at 8:47 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
> > >
> > > On Tue, 2020-06-30 at 16:53 +0000, Tomasz Figa wrote:
> > > > Hi Xia,
> > > >
> > > > On Tue, Jun 30, 2020 at 10:56:21AM +0800, Xia Jiang wrote:
> > > > > On Thu, 2020-06-11 at 18:46 +0000, Tomasz Figa wrote:
> > > > > > Hi Xia,
> > > > > >
> > > > > > On Thu, Jun 04, 2020 at 05:05:53PM +0800, Xia Jiang wrote:
> > > > [snip]
> > > > > > > +static void mtk_jpeg_enc_device_run(void *priv)
> > > > > > > +{
> > > > > > > +       struct mtk_jpeg_ctx *ctx = priv;
> > > > > > > +       struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > > > > > > +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > > > > > > +       enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > > > > > > +       unsigned long flags;
> > > > > > > +       struct mtk_jpeg_src_buf *jpeg_src_buf;
> > > > > > > +       struct mtk_jpeg_enc_bs enc_bs;
> > > > > > > +       int ret;
> > > > > > > +
> > > > > > > +       src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > > > > > +       dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > > > > > +       jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> > > > > > > +
> > > > > > > +       ret = pm_runtime_get_sync(jpeg->dev);
> > > > > > > +       if (ret < 0)
> > > > > > > +               goto enc_end;
> > > > > > > +
> > > > > > > +       spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > > > > > +
> > > > > > > +       /*
> > > > > > > +        * Resetting the hardware every frame is to ensure that all the
> > > > > > > +        * registers are cleared. This is a hardware requirement.
> > > > > > > +        */
> > > > > > > +       mtk_jpeg_enc_reset(jpeg->reg_base);
> > > > > > > +
> > > > > > > +       mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf, &enc_bs);
> > > > > > > +       mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> > > > > > > +       mtk_jpeg_enc_set_config(jpeg->reg_base, ctx->out_q.fmt->hw_format,
> > > > > > > +                               ctx->enable_exif, ctx->enc_quality,
> > > > > > > +                               ctx->restart_interval);
> > > > > > > +       mtk_jpeg_enc_start(jpeg->reg_base);
> > > > > >
> > > > > > Could we just move the above 5 functions into one function inside
> > > > > > mtk_jpeg_enc_hw.c that takes mtk_jpeg_dev pointer as its argument, let's
> > > > > > say mtk_jpeg_enc_hw_run() and simply program all the data to the registers
> > > > > > directly, without the extra level of abstractions?
> > > > > I can move the 5 functions into one function(mtk_jpeg_enc_hw_run()), but
> > > > > this function will be very long, because it contains computation code
> > > > > such as setting dst addr, blk_num, quality.
> > > > > In v4, you have adviced the following architecture:
> > > > > How about the following model, as used by many other drivers:
> > > > >
> > > > > mtk_jpeg_enc_set_src()
> > > > > {
> > > > >         // Set any registers related to source format and buffer
> > > > > }
> > > > >
> > > > > mtk_jpeg_enc_set_dst()
> > > > > {
> > > > >         // Set any registers related to destination format and buffer
> > > > > }
> > > > >
> > > > > mtk_jpeg_enc_set_params()
> > > > > {
> > > > >         // Set any registers related to additional encoding parameters
> > > > > }
> > > > >
> > > > > mtk_jpeg_enc_device_run(enc, ctx)
> > > > > {
> > > > >         mtk_jpeg_enc_set_src(enc, src_buf, src_fmt);
> > > > >         mtk_jpeg_enc_set_dst(enc, dst_buf, dst_fmt);
> > > > >         mtk_jpeg_enc_set_params(enc, ctx);
> > > > >         // Trigger the hardware run
> > > > > }
> > > > > I think that this architecture is more clear(mtk_jpeg_enc_set_config is
> > > > > equivalent to mtk_jpeg_enc_set_params).
> > > > > Should I keep the original architecture or move 5 functions into
> > > > > mtk_jpeg_enc_hw_run?
> > > >
> > > > Sounds good to me.
> > > >
> > > > My biggest issue with the code that it ends up introducing one more
> > > > level of abstraction, but with the approach you suggested, the arguments
> > > > just accept standard structs, which avoids that problem.
> > > >
> > > > [snip]
> > > > > > > +
> > > > > > > +       ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> > > > > > > +       ctx->colorspace = V4L2_COLORSPACE_JPEG,
> > > > > > > +       ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > > > > > +       ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > > > > > +       ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > > > > >
> > > > > > Since we already have a v4l2_pix_format_mplane struct which has fields for
> > > > > > the above 4 values, could we just store them there?
> > > > > >
> > > > > > Also, I don't see this driver handling the colorspaces in any way, but it
> > > > > > seems to allow changing them from the userspace. This is incorrect, because
> > > > > > the userspace has no way to know that the colorspace is not handled.
> > > > > > Instead, the try_fmt implementation should always override the
> > > > > > userspace-provided colorspace configuration with the ones that the driver
> > > > > > assumes.
> > > > > >
> > > > > > > +       pix_mp->width = MTK_JPEG_MIN_WIDTH;
> > > > > > > +       pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> > > > > > > +
> > > > > > > +       q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> > > > > > > +                                     MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> > > > > > > +       vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> > > > > > > +                                   fmt.pix_mp), q->fmt);
> > > > > > > +       q->w = pix_mp->width;
> > > > > > > +       q->h = pix_mp->height;
> > > > > > > +       q->crop_rect.width = pix_mp->width;
> > > > > > > +       q->crop_rect.height = pix_mp->height;
> > > > > > > +       q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> > > > > > > +       q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;
> > > > > >
> > > > > > Actually, do we need this custom mtk_jpeg_q_data struct? Why couldn't we
> > > > > > just keep the same values inside the standard v4l2_pix_format_mplane
> > > > > > struct?
> > > > > I think that we need mtk_jpeg_q_data struct.If we delete it, how can we
> > > > > know these values(w, h, sizeimage, bytesperline, mtk_jpeg_fmt) belong to
> > > > > output or capture(output and capture's sizeimages are different, width
> > > > > and height are differnt too for jpeg dec )?We have
> > > > > s_fmt_vid_out_mplane/cap_mplane function to set these values.
> > > > >
> > > > > But we can use standard v4l2_pix_format_mplane struct replacing the w, h
> > > > > bytesperline, sizeimage in mtk_jpeg_q_data struct like this:
> > > > > struct mtk_jpeg_q_data{
> > > > >     struct mtk_jpeg_fmt *fmt;
> > > > >     struct v4l2_pix_format_mplane pix_mp;
> > > > >     struct v4l2_rect enc_crop_rect
> > > > > }
> > > > > Then delete ctx->colorspace ctx->ycbcr_enc ctx->quantization
> > > > > ctx->xfer_func, becuase v4l2_pix_format_mplane in q_data has contained
> > > > > them and assign them for out_q and cap_q separately.
> > > > >
> > > > > WDYT?
> > > >
> > > > Sounds good to me. I was considering just making it like
> > > >
> > > > struct mtk_jpeg_ctx {
> > > >       struct mtk_jpeg_fmt *src_fmt;
> > > >       struct v4l2_pix_format_mplane src_pix_mp;
> > > >       struct v4l2_rect src_crop;
> > > >
> > > >       struct mtk_jpeg_fmt *dst_fmt;
> > > >       struct v4l2_pix_format_mplane dst_pix_mp;
> > > >       struct v4l2_rect dst_crop;
> > > > };
> > > >
> > > > but I like your suggestion as well, as long as custom data structures
> > > > are not used to store standard information.
> > >
> > > Dear Tomasz,
> > >
> > > I used the structure like below:
> > >  struct mtk_jpeg_q_data{
> > >         struct mtk_jpeg_fmt *fmt;
> > >         struct v4l2_pix_format_mplane pix_mp;
> > >         struct v4l2_rect enc_crop_rect
> > > }
> > > Then delete ctx->colorspace ctx->ycbcr_enc ctx->quantization
> > > ctx->xfer_func, becuase v4l2_pix_format_mplane in q_data has contained
> > > them and assign them for out_q and cap_q separately.
> > >
> > > Then the v4l2_compliance test will fail, the fail log as below:
> > > Format ioctls:
> > >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > >         test VIDIOC_G/S_PARM: OK (Not Supported)
> > >         test VIDIOC_G_FBUF: OK (Not Supported)
> > >         test VIDIOC_G_FMT: OK
> > >         test VIDIOC_TRY_FMT: OK
> > >                 fail: v4l2-test-formats.cpp(836):
> > > fmt_cap.g_colorspace() != col
> > >         test VIDIOC_S_FMT: FAIL
> > >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > >         test Cropping: OK
> > >         test Composing: OK (Not Supported)
> > >         test Scaling: OK (Not Supported)
> > >
> > > The source code of  v4l2-test-formats.cpp as below:
> > >
> > > static int testM2MFormats(struct node *node)
> > > {
> > >         cv4l_fmt fmt_out;
> > >         cv4l_fmt fmt;
> > >         cv4l_fmt fmt_cap;
> > >         __u32 cap_type = node->g_type();
> > >         __u32 out_type = v4l_type_invert(cap_type);
> > >         __u32 col, ycbcr_enc, quant, xfer_func;
> > >
> > >         fail_on_test(node->g_fmt(fmt_out, out_type));
> > >         node->g_fmt(fmt_cap, cap_type);
> > >         fail_on_test(fmt_cap.g_colorspace() != fmt_out.g_colorspace());
> > >         fail_on_test(fmt_cap.g_ycbcr_enc() != fmt_out.g_ycbcr_enc());
> > >         fail_on_test(fmt_cap.g_quantization() != fmt_out.g_quantization());
> > >         fail_on_test(fmt_cap.g_xfer_func() != fmt_out.g_xfer_func());
> > >         col = fmt_out.g_colorspace() == V4L2_COLORSPACE_SMPTE170M ?
> > >                 V4L2_COLORSPACE_REC709 : V4L2_COLORSPACE_SMPTE170M;
> > >         ycbcr_enc = fmt_out.g_ycbcr_enc() == V4L2_YCBCR_ENC_601 ?
> > >                 V4L2_YCBCR_ENC_709 : V4L2_YCBCR_ENC_601;
> > >         quant = fmt_out.g_quantization() == V4L2_QUANTIZATION_LIM_RANGE ?
> > >                 V4L2_QUANTIZATION_FULL_RANGE : V4L2_QUANTIZATION_LIM_RANGE;
> > >         xfer_func = fmt_out.g_xfer_func() == V4L2_XFER_FUNC_SRGB ?
> > >                 V4L2_XFER_FUNC_709 : V4L2_XFER_FUNC_SRGB;
> > >         fmt_out.s_colorspace(col);
> > >         fmt_out.s_xfer_func(xfer_func);
> > >         fmt_out.s_ycbcr_enc(ycbcr_enc);
> > >         fmt_out.s_quantization(quant);
> > >         node->s_fmt(fmt_out);
> > >         fail_on_test(fmt_out.g_colorspace() != col);
> > >         fail_on_test(fmt_out.g_xfer_func() != xfer_func);
> > >         fail_on_test(fmt_out.g_ycbcr_enc() != ycbcr_enc);
> > >         fail_on_test(fmt_out.g_quantization() != quant);
> > >         node->g_fmt(fmt_cap);
> > >         fail_on_test(fmt_cap.g_colorspace() != col);  // line 836
> > >         fail_on_test(fmt_cap.g_xfer_func() != xfer_func);
> > >         fail_on_test(fmt_cap.g_ycbcr_enc() != ycbcr_enc);
> > >         fail_on_test(fmt_cap.g_quantization() != quant);
> > > }
> > >
> > > It needs that cap's colorspace equals out's colorspace when userspace
> > > just set out's colorspace and then get cap's colorspace. However, cap's
> > > colorspace which getted from driver equals V4L2_COLORSPACE_JPEG, because
> > > the code in g_fmt() like this:
> > > pix_mp->colorspace = q_data->pix_mp.colorspace;
> > > pix_mp->ycbcr_enc = q_data->pix_mp.ycbcr_enc;
> > > pix_mp->xfer_func = q_data->pix_mp.xfer_func;
> > > pix_mp->quantization = q_data->pix_mp.quantization;
> > >
> > > How should I handle this case? Should I store them(colorspace,
> > > sfer_func, ycbcr_enc, quatization) in ctx as the orinal desin? Then I
> > > can get them from g_fmt() like this:
> > > pix_mp->colorspace = ctx->colorspace;
> > > pix_mp->ycbcr_enc = ctx->ycbcr_enc;
> > > pix_mp->xfer_func = ctx->xfer_func;
> > > pix_mp->quantization = ctx->quantization;
> >
> > Why would there be any other colorspace accepted? I suppose that the
> > hardware only supports the JPEG color space, so it shouldn't accept
> > any other colorspace in TRY_FMT (and thus S_FMT) anyway.
> >
> > Still, for correctness, I would suggest propagating the colorspace
> > (and related) information from OUTPUT format to CAPTURE format in
> > S_FMT(OUTPUT).
> Dear Tomasz,
> If the driver doesn't accept any other colorspace from userspace(means
> the colorspace always equals V4L2_COLORSPACE_JPEG on my understanding),
> the v4l2_compliance will fail at line 831:
>   fail_on_test(fmt_out.g_colorspace() != col); // line 831
>
> The v4l2_compliance needs driver can accept other colorspace and capture
> colorspace equals output colorspace.
>
> I try to propagate the colorspace from OUTPUT format to CAPTURE foramt
> in S_FMT, the compliance test succeed.
>
> Should the jpeg driver can accept other colorspace?

Hans, could you advise on what is the proper behavior regarding
colorimetry support?

Best regards,
Tomasz
