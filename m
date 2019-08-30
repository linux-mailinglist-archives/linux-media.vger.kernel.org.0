Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39CDA32AD
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 10:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfH3IeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 04:34:11 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33360 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfH3IeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 04:34:11 -0400
Received: by mail-ed1-f66.google.com with SMTP id l26so6488428edr.0
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 01:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGj+QywDGNf8RU3nCUVn2rf2R0NrS9Bl2cO6UU8tnf4=;
        b=PcpUATAZqIbcoiaTwXtDmO79nO8QPwiLKkXhTdCUd+g/ecm3aSuMclMb5g6Lvo05Wd
         ljsTYFTC1jeYre6R42iRA/ldxSqG6Rdy1Ql1kdT8ZE/p5Lgth47Oo8BlJbiDzUdMMarf
         JiNVgF3T/M0BgRvufmGswlA8JGLWAkaPgtB0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGj+QywDGNf8RU3nCUVn2rf2R0NrS9Bl2cO6UU8tnf4=;
        b=mdy7zSdJhy08XSX7GupyVniAgoJk4S0e9oSfq9kyyjmoFDonAtz69TptuF08jaQP2Y
         jo8bnOJz/cKA8zNy1hJdScu44JMtE7HWR4JjmSUTLqlt1N4ZuftAesVT7U0UlwzMSm1W
         dIsGsgoG5I4/MTEJoDs/mSRFNLjOK81b8gBHvzwud30qmsp9K2N8+pkDHG+iy666p2c2
         S2PIjjkCMiD8TE8om3s8oKeMsOXDGuVZLjrOc812REDiadHeRTe4MHedysS01fHq22TC
         rlJkg4sabBl2mLSrttLi5+IorKgZAzu7uuHN+u3ElJ9qzDTrtEopjomszbk5UfyFBTO6
         zhjw==
X-Gm-Message-State: APjAAAUpmUa/e2uwjcTTKjRb8ez8/wkRLeNa9t/yGwO6OnVItMRQJ5UF
        sWafM0kwXmSxrkKO/9A8FHeqOxX8SJs=
X-Google-Smtp-Source: APXvYqxTLbtPl+BmD86CL9bNtgA85//a5PSL3XUwZ4dfR9CtiCs3rLrW81OWfYUAAm8MbGxfvAZV+Q==
X-Received: by 2002:aa7:ce89:: with SMTP id y9mr14162861edv.135.1567154048531;
        Fri, 30 Aug 2019 01:34:08 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id gh12sm106162ejb.6.2019.08.30.01.34.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 01:34:07 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id v15so6395248wml.0
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 01:34:06 -0700 (PDT)
X-Received: by 2002:a1c:cf88:: with SMTP id f130mr16973336wmg.10.1567154046354;
 Fri, 30 Aug 2019 01:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
 <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com> <1566957625.20680.33.camel@mtksdccf07>
In-Reply-To: <1566957625.20680.33.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 30 Aug 2019 17:33:53 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
Message-ID: <CAAFQd5D-Yg1FjUE_rwmqfS1gvfE0=MZ=r-ziueU_37-uo9QTbw@mail.gmail.com>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        =?UTF-8?B?UG8tWWFuZyBIdWFuZyAo6buD5p+P6Zm9KQ==?= 
        <po-yang.huang@mediatek.com>,
        "shik@chromium.org" <shik@chromium.org>,
        "suleiman@chromium.org" <suleiman@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 28, 2019 at 11:00 AM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > > > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > > >
> > > > > This patch adds the driver of Face Detection (FD) unit in
> > > > > Mediatek camera system, providing face detection function.
> > > > >
> > > > > The mtk-isp directory will contain drivers for multiple IP
> > > > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > > > driver (CAM), sensor interface driver, DIP driver and face
> > > > > detection driver.
> > > > >
> > > > > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > > > ---
> > > > >  drivers/media/platform/Makefile               |    2 +
> > > > >  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
> > > > >  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  157 +++
> > > > >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1259 +++++++++++++++++++++++++
> > > > >  include/uapi/linux/v4l2-controls.h            |    4 +
> > > > >  5 files changed, 1427 insertions(+)
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > > > >
> > > >
> > > > Thanks for the patch! I finally got a chance to fully review the code. Sorry
> > > > for the delay. Please check my comments inline.
> > > >
> > > I appreciate your comments.
> > > I've fixed most of the comments and verifying them,
> > > Sorry for the delay, here is the reply.
> > >
> >
> > Thanks for replying to all the comments, it's very helpful. I'll snip
> > the parts that I don't have any further comments.
> >
> > [snip]
> >
> > > > > +   if (usercount == 1) {
> > > > > +           pm_runtime_get_sync(&fd_dev->pdev->dev);
> > > > > +           if (mtk_fd_hw_enable(fd_hw)) {
> > > > > +                   pm_runtime_put_sync(&fd_dev->pdev->dev);
> > > > > +                   atomic_dec_return(&fd_hw->fd_user_cnt);
> > > > > +                   mutex_unlock(&fd_hw->fd_hw_lock);
> > > > > +                   return -EINVAL;
> > > > > +           }
> > > > > +   }
> > > >
> > > > This is a simple mem-to-mem device, so there is no reason to keep it active
> > > > all the time it's streaming. Please just get the runtime PM counter when
> > > > queuing a job to the hardware and release it when the job finishes.
> > > >
> > > > I guess we might still want to do the costly operations like rproc_boot()
> > > > when we start streaming, though.
> > > >
> > > Do you mean by moving the pm_runtime_get/put stuff to the job execution
> > > and job finish place?
> >
> > Yes.
> >
> > > the rproc_boot() operation will be done here.
> > >
> >
> > How much time does the rproc_boot() operation take?
> >
>
> About 0.7~1.3ms, average 0.8ms (14 measurements)
>

Okay, I think we may want to call it when we start streaming then.

[snip]

> > > > > +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > > > +                             unsigned int *num_buffers,
> > > > > +                             unsigned int *num_planes,
> > > > > +                             unsigned int sizes[],
> > > > > +                             struct device *alloc_devs[])
> > > > > +{
> > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > +   struct device *dev = ctx->dev;
> > > > > +   unsigned int size;
> > > > > +
> > > > > +   switch (vq->type) {
> > > > > +   case V4L2_BUF_TYPE_META_CAPTURE:
> > > > > +           size = ctx->dst_fmt.buffersize;
> > > > > +           break;
> > > > > +   case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > > > +           size = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > > > +           break;
> > > > > +   default:
> > > > > +           dev_err(dev, "invalid queue type: %d\n", vq->type);
> > > >
> > > > We should need to handle this.
> > > >
> > > Do you mean by giving a size instead of return -EINVAL?
> > >
> >
> > Sorry, typo. I meant we shouldn't need to handle it, because we can't
> > get any other queue type here.
> >
>
> Ok, I see, I will remove it.
> also, this function will be updated as following due to the 2 plane
> case.
>
> static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
>                                   unsigned int *num_buffers,
>                                   unsigned int *num_planes,
>                                   unsigned int sizes[],
>                                   struct device *alloc_devs[])
> {
>         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
>         struct device *dev = ctx->dev;
>         unsigned int size[2];
>
>         switch (vq->type) {
>         case V4L2_BUF_TYPE_META_CAPTURE:
>                 size[0] = ctx->dst_fmt.buffersize;
>                 break;
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
>                 if (*num_planes == 2)
>                         size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
>                 break;
>         }
>
>         if (*num_planes == 1) {
>                 if (sizes[0] < size[0])
>                         return -EINVAL;
>         } else if (*num_planes == 2) {
>                 if ((sizes[0] < size[0]) && (sizes[1] < size[1]))
>                         return -EINVAL;

Can we just use a loop here and combine the 2 cases above?

Also, we need to fail with -EINVAL if *num_planes is > 2.

>         } else {
>                 *num_planes = 1;
>                 sizes[0] = size[0];

This should be the case if *num_planes == 0 and the number of planes
and sizes should match the currently active format.

>         }
>
>         return 0;
> }
>
> > [snip]
> >
> > > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > > +{
> > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > > +   struct vb2_buffer *vb;
> > > >
> > > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > > removed below?
> > > >
> > > Maybe we can check the driver state flag and aborting the unfinished
> > > jobs?
> > > (fd_hw->state == FD_ENQ)
> > >
> >
> > Yes, we need to either cancel or wait for the currently processing
> > job. It depends on hardware capabilities, but cancelling is generally
> > preferred for the lower latency.
> >
> Ok, it the state is ENQ, then we can disable the FD hw by controlling
> the registers.
>
> for example:
>         writel(0x0, fd->fd_base + FD_HW_ENABLE);
>         writel(0x0, fd->fd_base + FD_INT_EN);
>

What's exactly the effect of writing 0 to FD_HW_ENABLE?

[snip]

> > > > > +}
> > > > > +
> > > > > +static void mtk_fd_vb2_request_complete(struct vb2_buffer *vb)
> > > > > +{
> > > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > > > > +
> > > > > +   v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> > > > > +}
> > > > > +
> > > > > +static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> > > > > +                             const struct v4l2_pix_format_mplane *sfmt)
> > > > > +{
> > > > > +   dfmt->width = sfmt->width;
> > > > > +   dfmt->height = sfmt->height;
> > > > > +   dfmt->pixelformat = sfmt->pixelformat;
> > > > > +   dfmt->field = sfmt->field;
> > > > > +   dfmt->colorspace = sfmt->colorspace;
> > > > > +   dfmt->num_planes = sfmt->num_planes;
> > > > > +
> > > > > +   /* Use default */
> > > > > +   dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > > > +   dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > > > +   dfmt->xfer_func =
> > > > > +           V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> > > > > +   dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> > > > > +   dfmt->plane_fmt[0].sizeimage =
> > > > > +           dfmt->height * dfmt->plane_fmt[0].bytesperline;
> > > > > +   memset(dfmt->reserved, 0, sizeof(dfmt->reserved));
> > > > > +}
> > > >
> > > > Could we unify this function with mtk_fd_m2m_try_fmt_out_mp()? That function
> > > > should be almost directly reusable for the default format initialization +/-
> > > > the arguments passed to it.
> > > >
> > > Ok, I will try to reuse it as following:
> > >
> > > static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> > >   const struct v4l2_pix_format_mplane *sfmt)
> > > {
> > > dfmt->field = V4L2_FIELD_NONE;
> > > dfmt->colorspace = V4L2_COLORSPACE_BT2020;
> > > dfmt->num_planes = sfmt->num_planes;
> > > dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > dfmt->xfer_func =
> > > V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> > >
> > > /* Keep user setting as possible */
> > > dfmt->width = clamp(dfmt->width,
> > >     MTK_FD_OUTPUT_MIN_WIDTH,
> > >     MTK_FD_OUTPUT_MAX_WIDTH);
> > > dfmt->height = clamp(dfmt->height,
> > >      MTK_FD_OUTPUT_MIN_HEIGHT,
> > >      MTK_FD_OUTPUT_MAX_HEIGHT);
> > >
> > > if (sfmt->num_planes == 2) {
> > > /* NV16M and NV61M has 1 byte per pixel */
> > > dfmt->plane_fmt[0].bytesperline = dfmt->width;
> > > dfmt->plane_fmt[1].bytesperline = dfmt->width;
> > > } else {
> > > /* 2 bytes per pixel */
> > > dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> > > }
> > >
> > > dfmt->plane_fmt[0].sizeimage =
> > > dfmt->height * dfmt->plane_fmt[0].bytesperline;
> > > }
> >
> > How would the implementation of TRY_FMT look in this case?
> >
>
> It will be looked like:
>
> static int mtk_fd_try_fmt_out_mp(struct file *file,
>                                      void *fh,
>                                      struct v4l2_format *f)
> {
>         struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>         const struct v4l2_pix_format_mplane *fmt;
>
>         fmt = mtk_fd_find_fmt(pix_mp->pixelformat);
>         if (!fmt)
>                 fmt = &mtk_fd_img_fmts[0];      /* Get default img fmt */
>
>         mtk_fd_fill_pixfmt_mp(pix_mp, fmt);
>         return 0;
> }
>

Okay, thanks!

Best regards,
Tomasz
