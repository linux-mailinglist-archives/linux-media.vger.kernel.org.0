Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFE79C997
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 08:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfHZGoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 02:44:32 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35610 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729419AbfHZGob (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 02:44:31 -0400
Received: by mail-ed1-f68.google.com with SMTP id t50so24970084edd.2
        for <linux-media@vger.kernel.org>; Sun, 25 Aug 2019 23:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dA2WZyMm67w3lO2i0AwQCrVkkd/5XMnhJesFUl2G2rU=;
        b=C4YDeZtuVwQGdLrgUjSHPgr3obyG56oJ9qOyoHqZVYDtnV3aKIZuzTZ3pvAqLgP+9D
         3o0OcS6arw/aiYkexbBui+5rQIgxrzMnO4OeaU7CYczkUWBuaVHH1y8sp8jO/FeEBaOZ
         eBZJ8YiLcvvqjYk38LgndlGhf2Im4QlTXQfxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dA2WZyMm67w3lO2i0AwQCrVkkd/5XMnhJesFUl2G2rU=;
        b=kFoUxZPSAW05nIlwjjzVrNPgv/psydtVXRn1JLKsqLK6aQgsnURbha5wssC5+TBuuH
         oFo9KSZ4gL7NX++JfrIpsu9fP6G+TeKsLvYKVTa7Sfwq+8sTux7ZE/7wTCeO8jrw2YK9
         h7rAIRtHLrKeLr8WIRdayIm/5K6uJPq5DzOHeV8sVBTmmGGrsKN03G//WNmDZQjkTvbF
         1JlXdZYfmDgLYDeiSvgQzSLWkzouyJqGan8ZdRCRVNAhoucHTvfOIBQGbNyCfbRGoYa1
         4IwgmqoOipbGnFQCM4NRfZCdIwcmTiIjlFtmsWDmHU4FhGKgQuSuohBbLHhPyQmJvBzh
         ItBQ==
X-Gm-Message-State: APjAAAWYt2Nyt0GA3Er4TDdtwlcoFi+etUbRziTl1p/8ubjvRN/4cI/l
        jTCYb9K6Gk8E3cesCDPJi7mzbbhFY+YqMA==
X-Google-Smtp-Source: APXvYqz1e8KrdNqolG+f0TTZiZCNAOItvFXmO4uiRICa3UdsSsi45dOOcFqoMtYFe0qR1QT1RKXPIg==
X-Received: by 2002:a05:6402:1346:: with SMTP id y6mr17077175edw.27.1566801869304;
        Sun, 25 Aug 2019 23:44:29 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id f22sm1093185edr.15.2019.08.25.23.44.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Aug 2019 23:44:29 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id g67so14653020wme.1
        for <linux-media@vger.kernel.org>; Sun, 25 Aug 2019 23:44:29 -0700 (PDT)
X-Received: by 2002:a05:600c:254a:: with SMTP id e10mr20720968wma.113.1566801385282;
 Sun, 25 Aug 2019 23:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
 <20190802082815.GA203993@chromium.org> <1566724680.20680.8.camel@mtksdccf07>
In-Reply-To: <1566724680.20680.8.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 26 Aug 2019 15:36:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
Message-ID: <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
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
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jerry,

On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > >
> > > This patch adds the driver of Face Detection (FD) unit in
> > > Mediatek camera system, providing face detection function.
> > >
> > > The mtk-isp directory will contain drivers for multiple IP
> > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > driver (CAM), sensor interface driver, DIP driver and face
> > > detection driver.
> > >
> > > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > ---
> > >  drivers/media/platform/Makefile               |    2 +
> > >  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
> > >  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  157 +++
> > >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1259 +++++++++++++++++++++++++
> > >  include/uapi/linux/v4l2-controls.h            |    4 +
> > >  5 files changed, 1427 insertions(+)
> > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
> > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > >
> >
> > Thanks for the patch! I finally got a chance to fully review the code. Sorry
> > for the delay. Please check my comments inline.
> >
> I appreciate your comments.
> I've fixed most of the comments and verifying them,
> Sorry for the delay, here is the reply.
>

Thanks for replying to all the comments, it's very helpful. I'll snip
the parts that I don't have any further comments.

[snip]

> > > +   if (usercount == 1) {
> > > +           pm_runtime_get_sync(&fd_dev->pdev->dev);
> > > +           if (mtk_fd_hw_enable(fd_hw)) {
> > > +                   pm_runtime_put_sync(&fd_dev->pdev->dev);
> > > +                   atomic_dec_return(&fd_hw->fd_user_cnt);
> > > +                   mutex_unlock(&fd_hw->fd_hw_lock);
> > > +                   return -EINVAL;
> > > +           }
> > > +   }
> >
> > This is a simple mem-to-mem device, so there is no reason to keep it active
> > all the time it's streaming. Please just get the runtime PM counter when
> > queuing a job to the hardware and release it when the job finishes.
> >
> > I guess we might still want to do the costly operations like rproc_boot()
> > when we start streaming, though.
> >
> Do you mean by moving the pm_runtime_get/put stuff to the job execution
> and job finish place?

Yes.

> the rproc_boot() operation will be done here.
>

How much time does the rproc_boot() operation take?

[snip]

> > > +
> > > +           pm_runtime_put_sync(&fd_dev->pdev->dev);
> >
> > Any reason to use pm_runtime_put_sync() over pm_runtime_put()?
> >
> No special reason to do so, the pm_runtime_put_sync here will be moved
> to the place each job finished.
>

If there is no reason, then the _sync() variant shouldn't be used, as
it could affect the performance negatively.

[snip]

> > > +static int mtk_fd_hw_job_exec(struct mtk_fd_hw *fd_hw,
> > > +                         struct fd_hw_param *fd_param,
> > > +                         void *output_vaddr)
> > > +{
> > > +   struct fd_user_output *fd_output;
> > > +   struct ipi_message fd_ipi_msg;
> > > +   int ret;
> > > +   u32 num;
> > > +
> > > +   if (fd_param->user_param.src_img_fmt == FMT_UNKNOWN)
> > > +           goto param_err;
> >
> > Is this possible?
> >
> Only if user set wrong format, I will remove this.
>

It shouldn't be possible to set a wrong format, because TRY_/S_FMT
should adjust what the user set to something that is valid.

> > > +
> > > +   mutex_lock(&fd_hw->fd_hw_lock);
> > > +   fd_hw->state = FD_ENQ;
> >
> > What is this state for?
> >
> It was for checking status, if a job is processing, the state is
> FD_ENQ,
> then we should wait for the last job to be done when pm_suspend().
>

If so, would it be possible to make it a bool and call is_processing?

[snip]

> > > +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > +                             unsigned int *num_buffers,
> > > +                             unsigned int *num_planes,
> > > +                             unsigned int sizes[],
> > > +                             struct device *alloc_devs[])
> > > +{
> > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > +   struct device *dev = ctx->dev;
> > > +   unsigned int size;
> > > +
> > > +   switch (vq->type) {
> > > +   case V4L2_BUF_TYPE_META_CAPTURE:
> > > +           size = ctx->dst_fmt.buffersize;
> > > +           break;
> > > +   case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > +           size = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > +           break;
> > > +   default:
> > > +           dev_err(dev, "invalid queue type: %d\n", vq->type);
> >
> > We should need to handle this.
> >
> Do you mean by giving a size instead of return -EINVAL?
>

Sorry, typo. I meant we shouldn't need to handle it, because we can't
get any other queue type here.

[snip]

> > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > +{
> > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > +   struct vb2_buffer *vb;
> >
> > How do we guarantee here that the hardware isn't still accessing the buffers
> > removed below?
> >
> Maybe we can check the driver state flag and aborting the unfinished
> jobs?
> (fd_hw->state == FD_ENQ)
>

Yes, we need to either cancel or wait for the currently processing
job. It depends on hardware capabilities, but cancelling is generally
preferred for the lower latency.

> > > +
> > > +   if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > +           vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > +   else
> > > +           vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > +
> > > +   while (vb) {
> > > +           v4l2_m2m_buf_done(to_vb2_v4l2_buffer(vb), VB2_BUF_STATE_ERROR);
> > > +           if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > +                   vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > +           else
> > > +                   vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > +   }
> >
> > We can use v4l2_m2m_buf_remove(). Also we can move the call into the loop
> > condition:
> >
> > while ((vb == v4l2_m2m_buf_remove(...)))
> >       v4l2_m2m_buf_done(...);
> >
> Ok, I will refine as following:
>
> while ((vb = v4l2_m2m_buf_remove(V4L2_TYPE_IS_OUTPUT(vq->type)?
>   &m2m_ctx->out_q_ctx :
>   &m2m_ctx->cap_q_ctx)))
> v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);

Please move the queue type check before the loop and save the queue
context in a local variable.

[snip]

> > > +}
> > > +
> > > +static void mtk_fd_vb2_request_complete(struct vb2_buffer *vb)
> > > +{
> > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > > +
> > > +   v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> > > +}
> > > +
> > > +static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> > > +                             const struct v4l2_pix_format_mplane *sfmt)
> > > +{
> > > +   dfmt->width = sfmt->width;
> > > +   dfmt->height = sfmt->height;
> > > +   dfmt->pixelformat = sfmt->pixelformat;
> > > +   dfmt->field = sfmt->field;
> > > +   dfmt->colorspace = sfmt->colorspace;
> > > +   dfmt->num_planes = sfmt->num_planes;
> > > +
> > > +   /* Use default */
> > > +   dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > +   dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > +   dfmt->xfer_func =
> > > +           V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> > > +   dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> > > +   dfmt->plane_fmt[0].sizeimage =
> > > +           dfmt->height * dfmt->plane_fmt[0].bytesperline;
> > > +   memset(dfmt->reserved, 0, sizeof(dfmt->reserved));
> > > +}
> >
> > Could we unify this function with mtk_fd_m2m_try_fmt_out_mp()? That function
> > should be almost directly reusable for the default format initialization +/-
> > the arguments passed to it.
> >
> Ok, I will try to reuse it as following:
>
> static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
>   const struct v4l2_pix_format_mplane *sfmt)
> {
> dfmt->field = V4L2_FIELD_NONE;
> dfmt->colorspace = V4L2_COLORSPACE_BT2020;
> dfmt->num_planes = sfmt->num_planes;
> dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> dfmt->xfer_func =
> V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
>
> /* Keep user setting as possible */
> dfmt->width = clamp(dfmt->width,
>     MTK_FD_OUTPUT_MIN_WIDTH,
>     MTK_FD_OUTPUT_MAX_WIDTH);
> dfmt->height = clamp(dfmt->height,
>      MTK_FD_OUTPUT_MIN_HEIGHT,
>      MTK_FD_OUTPUT_MAX_HEIGHT);
>
> if (sfmt->num_planes == 2) {
> /* NV16M and NV61M has 1 byte per pixel */
> dfmt->plane_fmt[0].bytesperline = dfmt->width;
> dfmt->plane_fmt[1].bytesperline = dfmt->width;
> } else {
> /* 2 bytes per pixel */
> dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> }
>
> dfmt->plane_fmt[0].sizeimage =
> dfmt->height * dfmt->plane_fmt[0].bytesperline;
> }

How would the implementation of TRY_FMT look in this case?

[snip]

> > > +static int mtk_fd_m2m_enum_fmt_out_mp(struct file *file, void *fh,
> > > +                                 struct v4l2_fmtdesc *f)
> > > +{
> > > +   int i;
> > > +
> > > +   for (i = 0; i < NUM_FORMATS; ++i) {
> > > +           if (i == f->index) {
> > > +                   f->pixelformat = in_img_fmts[i].pixelformat;
> > > +                   return 0;
> > > +           }
> > > +   }
> >
> > Why don't we just check if f->index is within the [0, ARRAY_SIZE()-1] bounds
> > and then just use it to index the array directly?
> >
> I will refine as :
>
> static int mtk_fd_m2m_enum_fmt_out_mp(struct file *file, void *fh,
>       struct v4l2_fmtdesc *f)
> {
> if ((f->index >= 0) && (f->index < NUM_FORMATS)) {

f->index is unsigned

> f->pixelformat = in_img_fmts[f->index].pixelformat;
> return 0;
> }
>
> return -EINVAL;
> }

nit: The usual convention is to check for invalid values and return early, i.e.

if (f->index >= NUM_FORMATS)
    return -EINVAL;

f->pixelformat = in_img_fmts[f->index].pixelformat;
return 0;

> > > +
> > > +   return -EINVAL;
> > > +}
> > > +
> > > +static int mtk_fd_m2m_try_fmt_out_mp(struct file *file,
> > > +                                void *fh,
> > > +                                struct v4l2_format *f)
> >
> > I think we could just shorten the function prefixes to "mtk_fd_".
> >
> Do you mean by replace mtk_fd_m2m_* with mtk_fd_ ?
>

Yes.

[snip]

> > > +static int mtk_fd_request_validate(struct media_request *req)
> > > +{
> > > +   unsigned int count;
> > > +
> > > +   count = vb2_request_buffer_cnt(req);
> > > +   if (!count)
> > > +           return -ENOENT;
> >
> > Why -ENOENT?
> >
> Reference the return code in vb2_request_validate()

You're right, -ENOENT seems to be the right error code here.

> I consider refining as following:
> static int mtk_fd_request_validate(struct media_request *req)
> {
> if (vb2_request_buffer_cnt(req) > 1)
> return -EINVAL;
>
> return vb2_request_validate(req);
> }
> or maybe I don't need to worry the request count greater than 1,
> just remove this function and set vb2_request_validate as .req_validate
> directly?
>

Given that we only have 1 queue handling requests, we should be able
to just use vb2_request_validate() indeed.

Best regards,
Tomasz
