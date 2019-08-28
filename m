Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E269F814
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 04:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfH1CAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 22:00:37 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48335 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726127AbfH1CAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 22:00:36 -0400
X-UUID: e1d51bc4246f46c1b6d51e65a60a5004-20190828
X-UUID: e1d51bc4246f46c1b6d51e65a60a5004-20190828
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 418017695; Wed, 28 Aug 2019 10:00:28 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 28 Aug 2019 10:00:34 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 28 Aug 2019 10:00:34 +0800
Message-ID: <1566957625.20680.33.camel@mtksdccf07>
Subject: Re: [RFC PATCH V2 4/4] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= 
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
Date:   Wed, 28 Aug 2019 10:00:25 +0800
In-Reply-To: <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
         <1562661672-22439-5-git-send-email-Jerry-Ch.chen@mediatek.com>
         <20190802082815.GA203993@chromium.org>
         <1566724680.20680.8.camel@mtksdccf07>
         <CAAFQd5Dw+jaT-+LAUEVeB8W1zdnOgPw7u+aCfDWhYW1SfbzO8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Mon, 2019-08-26 at 14:36 +0800, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Sun, Aug 25, 2019 at 6:18 PM Jerry-ch Chen
> <Jerry-ch.Chen@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Fri, 2019-08-02 at 16:28 +0800, Tomasz Figa wrote:
> > > Hi Jerry,
> > >
> > > On Tue, Jul 09, 2019 at 04:41:12PM +0800, Jerry-ch Chen wrote:
> > > > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > >
> > > > This patch adds the driver of Face Detection (FD) unit in
> > > > Mediatek camera system, providing face detection function.
> > > >
> > > > The mtk-isp directory will contain drivers for multiple IP
> > > > blocks found in Mediatek ISP system. It will include ISP Pass 1
> > > > driver (CAM), sensor interface driver, DIP driver and face
> > > > detection driver.
> > > >
> > > > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > > > ---
> > > >  drivers/media/platform/Makefile               |    2 +
> > > >  drivers/media/platform/mtk-isp/fd/Makefile    |    5 +
> > > >  drivers/media/platform/mtk-isp/fd/mtk_fd.h    |  157 +++
> > > >  drivers/media/platform/mtk-isp/fd/mtk_fd_40.c | 1259 +++++++++++++++++++++++++
> > > >  include/uapi/linux/v4l2-controls.h            |    4 +
> > > >  5 files changed, 1427 insertions(+)
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h
> > > >  create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd_40.c
> > > >
> > >
> > > Thanks for the patch! I finally got a chance to fully review the code. Sorry
> > > for the delay. Please check my comments inline.
> > >
> > I appreciate your comments.
> > I've fixed most of the comments and verifying them,
> > Sorry for the delay, here is the reply.
> >
> 
> Thanks for replying to all the comments, it's very helpful. I'll snip
> the parts that I don't have any further comments.
> 
> [snip]
> 
> > > > +   if (usercount == 1) {
> > > > +           pm_runtime_get_sync(&fd_dev->pdev->dev);
> > > > +           if (mtk_fd_hw_enable(fd_hw)) {
> > > > +                   pm_runtime_put_sync(&fd_dev->pdev->dev);
> > > > +                   atomic_dec_return(&fd_hw->fd_user_cnt);
> > > > +                   mutex_unlock(&fd_hw->fd_hw_lock);
> > > > +                   return -EINVAL;
> > > > +           }
> > > > +   }
> > >
> > > This is a simple mem-to-mem device, so there is no reason to keep it active
> > > all the time it's streaming. Please just get the runtime PM counter when
> > > queuing a job to the hardware and release it when the job finishes.
> > >
> > > I guess we might still want to do the costly operations like rproc_boot()
> > > when we start streaming, though.
> > >
> > Do you mean by moving the pm_runtime_get/put stuff to the job execution
> > and job finish place?
> 
> Yes.
> 
> > the rproc_boot() operation will be done here.
> >
> 
> How much time does the rproc_boot() operation take?
> 

About 0.7~1.3ms, average 0.8ms (14 measurements)

> [snip]
> 
> > > > +
> > > > +           pm_runtime_put_sync(&fd_dev->pdev->dev);
> > >
> > > Any reason to use pm_runtime_put_sync() over pm_runtime_put()?
> > >
> > No special reason to do so, the pm_runtime_put_sync here will be moved
> > to the place each job finished.
> >
> 
> If there is no reason, then the _sync() variant shouldn't be used, as
> it could affect the performance negatively.
> 

Ok, I will use pm_runtime_put();

> [snip]
> 
> > > > +static int mtk_fd_hw_job_exec(struct mtk_fd_hw *fd_hw,
> > > > +                         struct fd_hw_param *fd_param,
> > > > +                         void *output_vaddr)
> > > > +{
> > > > +   struct fd_user_output *fd_output;
> > > > +   struct ipi_message fd_ipi_msg;
> > > > +   int ret;
> > > > +   u32 num;
> > > > +
> > > > +   if (fd_param->user_param.src_img_fmt == FMT_UNKNOWN)
> > > > +           goto param_err;
> > >
> > > Is this possible?
> > >
> > Only if user set wrong format, I will remove this.
> >
> 
> It shouldn't be possible to set a wrong format, because TRY_/S_FMT
> should adjust what the user set to something that is valid.
> 

Ok, this will be removed.

> > > > +
> > > > +   mutex_lock(&fd_hw->fd_hw_lock);
> > > > +   fd_hw->state = FD_ENQ;
> > >
> > > What is this state for?
> > >
> > It was for checking status, if a job is processing, the state is
> > FD_ENQ,
> > then we should wait for the last job to be done when pm_suspend().
> >
> 
> If so, would it be possible to make it a bool and call is_processing?
> 
> [snip]
> 
> > > > +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > > +                             unsigned int *num_buffers,
> > > > +                             unsigned int *num_planes,
> > > > +                             unsigned int sizes[],
> > > > +                             struct device *alloc_devs[])
> > > > +{
> > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > +   struct device *dev = ctx->dev;
> > > > +   unsigned int size;
> > > > +
> > > > +   switch (vq->type) {
> > > > +   case V4L2_BUF_TYPE_META_CAPTURE:
> > > > +           size = ctx->dst_fmt.buffersize;
> > > > +           break;
> > > > +   case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > > +           size = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > > +           break;
> > > > +   default:
> > > > +           dev_err(dev, "invalid queue type: %d\n", vq->type);
> > >
> > > We should need to handle this.
> > >
> > Do you mean by giving a size instead of return -EINVAL?
> >
> 
> Sorry, typo. I meant we shouldn't need to handle it, because we can't
> get any other queue type here.
> 

Ok, I see, I will remove it.
also, this function will be updated as following due to the 2 plane
case.

static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
				  unsigned int *num_buffers,
				  unsigned int *num_planes,
				  unsigned int sizes[],
				  struct device *alloc_devs[])
{
	struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
	struct device *dev = ctx->dev;
	unsigned int size[2];

	switch (vq->type) {
	case V4L2_BUF_TYPE_META_CAPTURE:
		size[0] = ctx->dst_fmt.buffersize;
		break;
	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
		size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
		if (*num_planes == 2)
			size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
		break;
	}

	if (*num_planes == 1) {
		if (sizes[0] < size[0])
			return -EINVAL;
	} else if (*num_planes == 2) {
		if ((sizes[0] < size[0]) && (sizes[1] < size[1]))
			return -EINVAL;
	} else {
		*num_planes = 1;
		sizes[0] = size[0];
	}

	return 0;
}

> [snip]
> 
> > > > +static void mtk_fd_vb2_stop_streaming(struct vb2_queue *vq)
> > > > +{
> > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > > +   struct vb2_buffer *vb;
> > >
> > > How do we guarantee here that the hardware isn't still accessing the buffers
> > > removed below?
> > >
> > Maybe we can check the driver state flag and aborting the unfinished
> > jobs?
> > (fd_hw->state == FD_ENQ)
> >
> 
> Yes, we need to either cancel or wait for the currently processing
> job. It depends on hardware capabilities, but cancelling is generally
> preferred for the lower latency.
> 
Ok, it the state is ENQ, then we can disable the FD hw by controlling
the registers.

for example:
	writel(0x0, fd->fd_base + FD_HW_ENABLE);
	writel(0x0, fd->fd_base + FD_INT_EN);

> > > > +
> > > > +   if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > > +           vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > > +   else
> > > > +           vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > > +
> > > > +   while (vb) {
> > > > +           v4l2_m2m_buf_done(to_vb2_v4l2_buffer(vb), VB2_BUF_STATE_ERROR);
> > > > +           if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > > +                   vb = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > > +           else
> > > > +                   vb = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > > +   }
> > >
> > > We can use v4l2_m2m_buf_remove(). Also we can move the call into the loop
> > > condition:
> > >
> > > while ((vb == v4l2_m2m_buf_remove(...)))
> > >       v4l2_m2m_buf_done(...);
> > >
> > Ok, I will refine as following:
> >
> > while ((vb = v4l2_m2m_buf_remove(V4L2_TYPE_IS_OUTPUT(vq->type)?
> >   &m2m_ctx->out_q_ctx :
> >   &m2m_ctx->cap_q_ctx)))
> > v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> 
> Please move the queue type check before the loop and save the queue
> context in a local variable.
> 

Ok, I will refine as following:

	struct v4l2_m2m_queue_ctx *queue_ctx;

	queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ?
					&m2m_ctx->out_q_ctx :
					&m2m_ctx->cap_q_ctx;
	while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);

> [snip]
> 
> > > > +}
> > > > +
> > > > +static void mtk_fd_vb2_request_complete(struct vb2_buffer *vb)
> > > > +{
> > > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > > > +
> > > > +   v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> > > > +}
> > > > +
> > > > +static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> > > > +                             const struct v4l2_pix_format_mplane *sfmt)
> > > > +{
> > > > +   dfmt->width = sfmt->width;
> > > > +   dfmt->height = sfmt->height;
> > > > +   dfmt->pixelformat = sfmt->pixelformat;
> > > > +   dfmt->field = sfmt->field;
> > > > +   dfmt->colorspace = sfmt->colorspace;
> > > > +   dfmt->num_planes = sfmt->num_planes;
> > > > +
> > > > +   /* Use default */
> > > > +   dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > > +   dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > > +   dfmt->xfer_func =
> > > > +           V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> > > > +   dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> > > > +   dfmt->plane_fmt[0].sizeimage =
> > > > +           dfmt->height * dfmt->plane_fmt[0].bytesperline;
> > > > +   memset(dfmt->reserved, 0, sizeof(dfmt->reserved));
> > > > +}
> > >
> > > Could we unify this function with mtk_fd_m2m_try_fmt_out_mp()? That function
> > > should be almost directly reusable for the default format initialization +/-
> > > the arguments passed to it.
> > >
> > Ok, I will try to reuse it as following:
> >
> > static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> >   const struct v4l2_pix_format_mplane *sfmt)
> > {
> > dfmt->field = V4L2_FIELD_NONE;
> > dfmt->colorspace = V4L2_COLORSPACE_BT2020;
> > dfmt->num_planes = sfmt->num_planes;
> > dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > dfmt->xfer_func =
> > V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> >
> > /* Keep user setting as possible */
> > dfmt->width = clamp(dfmt->width,
> >     MTK_FD_OUTPUT_MIN_WIDTH,
> >     MTK_FD_OUTPUT_MAX_WIDTH);
> > dfmt->height = clamp(dfmt->height,
> >      MTK_FD_OUTPUT_MIN_HEIGHT,
> >      MTK_FD_OUTPUT_MAX_HEIGHT);
> >
> > if (sfmt->num_planes == 2) {
> > /* NV16M and NV61M has 1 byte per pixel */
> > dfmt->plane_fmt[0].bytesperline = dfmt->width;
> > dfmt->plane_fmt[1].bytesperline = dfmt->width;
> > } else {
> > /* 2 bytes per pixel */
> > dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> > }
> >
> > dfmt->plane_fmt[0].sizeimage =
> > dfmt->height * dfmt->plane_fmt[0].bytesperline;
> > }
> 
> How would the implementation of TRY_FMT look in this case?
> 

It will be looked like:

static int mtk_fd_try_fmt_out_mp(struct file *file,
				     void *fh,
				     struct v4l2_format *f)
{
	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
	const struct v4l2_pix_format_mplane *fmt;

	fmt = mtk_fd_find_fmt(pix_mp->pixelformat);
	if (!fmt)
		fmt = &mtk_fd_img_fmts[0];	/* Get default img fmt */

	mtk_fd_fill_pixfmt_mp(pix_mp, fmt);
	return 0;
}

> [snip]
> 
> > > > +static int mtk_fd_m2m_enum_fmt_out_mp(struct file *file, void *fh,
> > > > +                                 struct v4l2_fmtdesc *f)
> > > > +{
> > > > +   int i;
> > > > +
> > > > +   for (i = 0; i < NUM_FORMATS; ++i) {
> > > > +           if (i == f->index) {
> > > > +                   f->pixelformat = in_img_fmts[i].pixelformat;
> > > > +                   return 0;
> > > > +           }
> > > > +   }
> > >
> > > Why don't we just check if f->index is within the [0, ARRAY_SIZE()-1] bounds
> > > and then just use it to index the array directly?
> > >
> > I will refine as :
> >
> > static int mtk_fd_m2m_enum_fmt_out_mp(struct file *file, void *fh,
> >       struct v4l2_fmtdesc *f)
> > {
> > if ((f->index >= 0) && (f->index < NUM_FORMATS)) {
> 
> f->index is unsigned
> 
> > f->pixelformat = in_img_fmts[f->index].pixelformat;
> > return 0;
> > }
> >
> > return -EINVAL;
> > }
> 
> nit: The usual convention is to check for invalid values and return early, i.e.
> 
> if (f->index >= NUM_FORMATS)
>     return -EINVAL;
> 
> f->pixelformat = in_img_fmts[f->index].pixelformat;
> return 0;
> 
Ok, Done.

> > > > +
> > > > +   return -EINVAL;
> > > > +}
> > > > +
> > > > +static int mtk_fd_m2m_try_fmt_out_mp(struct file *file,
> > > > +                                void *fh,
> > > > +                                struct v4l2_format *f)
> > >
> > > I think we could just shorten the function prefixes to "mtk_fd_".
> > >
> > Do you mean by replace mtk_fd_m2m_* with mtk_fd_ ?
> >
> 
> Yes.
> 
Done.

> [snip]
> 
> > > > +static int mtk_fd_request_validate(struct media_request *req)
> > > > +{
> > > > +   unsigned int count;
> > > > +
> > > > +   count = vb2_request_buffer_cnt(req);
> > > > +   if (!count)
> > > > +           return -ENOENT;
> > >
> > > Why -ENOENT?
> > >
> > Reference the return code in vb2_request_validate()
> 
> You're right, -ENOENT seems to be the right error code here.
> 
> > I consider refining as following:
> > static int mtk_fd_request_validate(struct media_request *req)
> > {
> > if (vb2_request_buffer_cnt(req) > 1)
> > return -EINVAL;
> >
> > return vb2_request_validate(req);
> > }
> > or maybe I don't need to worry the request count greater than 1,
> > just remove this function and set vb2_request_validate as .req_validate
> > directly?
> >
> 
> Given that we only have 1 queue handling requests, we should be able
> to just use vb2_request_validate() indeed.
> 

Ok, it will be refined as following:

static const struct media_device_ops fd_m2m_media_ops = {
	.req_validate	= vb2_request_validate,
	.req_queue	= v4l2_m2m_request_queue,
};

Thanks and best regards,
Jerry

> Best regards,
> Tomasz


