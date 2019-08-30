Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53BB7A30D5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 09:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbfH3HUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 03:20:17 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39892 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfH3HUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 03:20:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id u6so1003375edq.6
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 00:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qr5XGJANAvoQWfaWTRC5JqSrFeaKps3Jm6+IxkAVJMY=;
        b=GOXQSOKka6U10VAvctl93NeQXJEePiFSyPYE/yh3BSkHTqLabC7MXm3+D9ES93gZqO
         qsLrD/1PWTtJbeiDZwVKIfxHnkOaxeyNQXyKw9U2wYW3XB1hgIaU33kqg1lDw9WqtdIv
         PNj7aAcwxcKjCgMgYZSPvEx5hQ4qnv3AQEhYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qr5XGJANAvoQWfaWTRC5JqSrFeaKps3Jm6+IxkAVJMY=;
        b=i/rZ4zgE/1lFiSDdqaxjUwYDaAZo4Jiqag4NN2y6JLWKIHkUze7aCb2Ow2Mk/CNLBE
         yCFdaUKVDhAVkvRFJcVoT+1ICbKqKOx4TFzcHkY14FFh/bR/Lv5DVzCtBSuQ+YPyv7gr
         v6vP7/hkhQd/gAUkiSIrPEtwRgNtVPnE2nZhCe9xCxmhbhgkE7Nbb5GivO/3UmzmpUBT
         0kZsLugKG5bH9g2cM0Z0YZhcq1Mgdzba/wamxU1fiURoi/znibvSr1em5nR0zPRyjdAp
         7hluf+B50nurGdQjJHL+BpY9TDROKtSRep5Bnfgkf+7jzyncE2liy2C94MDwR/t9koH8
         zYkg==
X-Gm-Message-State: APjAAAUt91du17QoQaApfqyLYcEmZw+v9UjNoWh7eSFFf/WFE3JKeeoR
        +Rj9zTKegF/rF/ihkbJ6sn8PiDGhfm4bdA==
X-Google-Smtp-Source: APXvYqxRfUMkow9XdrdejdBQrR8ovdPangVUGsTcGq4TzgMsC96+EeHkr4I+NcuIml0QOR5VLKKq2A==
X-Received: by 2002:aa7:df8b:: with SMTP id b11mr13740354edy.6.1567149613100;
        Fri, 30 Aug 2019 00:20:13 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id j26sm104377eds.41.2019.08.30.00.20.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 00:20:12 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id g207so2188281wmg.5
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 00:20:12 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr17222025wml.64.1567149264420;
 Fri, 30 Aug 2019 00:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190708110500.7242-1-frederic.chen@mediatek.com>
 <20190708110500.7242-5-frederic.chen@mediatek.com> <20190731071014.GA43159@chromium.org>
 <1566875772.10064.99.camel@mtksdccf07>
In-Reply-To: <1566875772.10064.99.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 30 Aug 2019 16:14:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B7WM-uExpo-qpEyDMNXLQkvqO=qBDrkpNvERr+iXVhtw@mail.gmail.com>
Message-ID: <CAAFQd5B7WM-uExpo-qpEyDMNXLQkvqO=qBDrkpNvERr+iXVhtw@mail.gmail.com>
Subject: Re: [RFC PATCH V2 4/6] platform: mtk-isp: Add Mediatek DIP driver
To:     Frederic Chen <frederic.chen@mediatek.com>
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
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shik@chromium.org" <shik@chromium.org>,
        "suleiman@chromium.org" <suleiman@chromium.org>,
        =?UTF-8?B?QWxsYW4gWWFuZyAo5qWK5pm66YieKQ==?= 
        <Allan.Yang@mediatek.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        Kurt.Yang@mediatek.com, Alan-YL.Hu@mediatek.com,
        =?UTF-8?B?SHVuZy1XZW4gSHNpZWggKOisnem0u+aWhyk=?= 
        <hung-wen.hsieh@mediatek.com>, Shih-Fang.Chuang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

On Tue, Aug 27, 2019 at 12:16 PM Frederic Chen
<frederic.chen@mediatek.com> wrote:
>
> Dear Tomasz,
>
> I appreciate your comment. I will collaborate more closely with Jungo
> to solve the common issues in DIP and Pass 1(CAM) drivers.
>

Thank you!

Also thanks for replying to all the comments, it's very helpful.
Please check my replies inline. I've snipped out the parts that I
don't have further comments on.

>
> On Wed, 2019-07-31 at 15:10 +0800, Tomasz Figa wrote:
> > Hi Frederic,
> >
> > On Mon, Jul 08, 2019 at 07:04:58PM +0800, frederic.chen@mediatek.com wrote:

[snip]

> >
> > > +                   dev_buf->vbb.vb2_buf.timestamp =
> > > +                           in_buf->vbb.vb2_buf.timestamp;
> > > +
> > > +           vb2_buffer_done(&dev_buf->vbb.vb2_buf, vbf_state);
> > > +
> > > +           node = mtk_dip_vbq_to_node(dev_buf->vbb.vb2_buf.vb2_queue);
> > > +           spin_lock(&node->buf_list_lock);
> > > +           list_del(&dev_buf->list);
> > > +           spin_unlock(&node->buf_list_lock);
> > > +
> > > +           dev_dbg(&pipe->dip_dev->pdev->dev,
> > > +                   "%s:%s: return buf, idx(%d), state(%d)\n",
> > > +                   pipe->desc->name, node->desc->name,
> > > +                   dev_buf->vbb.vb2_buf.index, vbf_state);
> > > +   }
> >
> > This looks almost the same as what's being done inside
> > mtk_dip_hw_streamoff(). Could we just call this function from the loop
> > there?
>
> I would like to call the function from mtk_dip_hw_streamoff(). The only
> difference is mtk_dip_pipe_job_finish() also remove the buffer from the
> node's internal list.
>

Would anything wrong happen if we also remove the buffer from the
node's internal list in mtk_dip_hw_streamoff()?

Actually, do we need that internal node list? If we have a list of
requests and each request stores its buffer, wouldn't that be enough?

[snip]

> >
> > > +
> > > +   width = ALIGN(width, 4);
> > > +   stride = DIV_ROUND_UP(width * 3, 2);
> > > +   stride = DIV_ROUND_UP(stride * pixel_byte, 8);
> > > +
> > > +   if (pix_fmt == V4L2_PIX_FMT_MTISP_F10)
> > > +           stride =  ALIGN(stride, 4);
> > > +   else
> > > +           stride =  ALIGN(stride, 8);
> >
> > Could you explain all the calculations done above?
>
> If the buffer comes from mtk-cam-p1, the stride setting must be the same
> as p1. I would like to re-implement the codes following p1's design in
> v4 patch as following:
>
> static u32
> mtk_dip_pass1_cal_pack_stride(u32 width, u32 pix_fmt) {
>         unsigned int bpl;
>         unsigned int pixel_bits =
>                 get_pixel_byte_by_fmt(mp->pixelformat);
>
>         /* Bayer encoding format, P1 HW needs 2 bytes alignment */
>         bpl = ALIGN(DIV_ROUND_UP(width * pixel_bits, 8), 2);
>
>         /* The setting also needs 4 bytes alignment for DIP HW */
>         return ALIGN(bpl, 4);;

If we need 4 bytes alignment, wouldn't the bytes per line value end up
different from P1 anyway? Perhaps we can just remove the ALIGN(..., 2)
above and keep this one? It should be the userspace responsibility
anyway to choose a format compatible with both consumer and producer.

By the way, double semicolon in the line above. :)

> }
>
>
> static __u32
> mtk_dip_pass1_cal_main_stride(u32 width, u32 pix_fmt)
> {
>         unsigned int bpl, ppl;
>         unsigned int pixel_bits =
>                 get_pixel_byte_by_fmt(mp->pixelformat);
>
>         /*
>          * The FULL-G encoding format
>          * 1 G component per pixel
>          * 1 R component per 4 pixel
>          * 1 B component per 4 pixel
>          * Total 4G/1R/1B in 4 pixel (pixel per line:ppl)
>          */
>         ppl = DIV_ROUND_UP(width * 6, 4);
>         bpl = DIV_ROUND_UP(ppl * pixel_bits, 8);
>
>         /* 4 bytes alignment for 10 bit & others are 8 bytes */
>         if (pixel_bits == 10)
>                 bpl = ALIGN(bpl, 4);
>         else
>                 bpl = ALIGN(bpl, 8);
>         }

Spurious }.

>
>         return bpl;
> }
>

Looks good to me, thanks!

>
> >
> > > +
> > > +   return stride;
> > > +}
> > > +
> > > +static int is_stride_need_to_align(u32 format, u32 *need_aligned_fmts,
> > > +                              int length)
> > > +{
> > > +   int i;
> > > +
> > > +   for (i = 0; i < length; i++) {
> > > +           if (format == need_aligned_fmts[i])
> > > +                   return true;
> > > +   }
> > > +
> > > +   return false;
> > > +}
> > > +
> > > +/* Stride that is accepted by MDP HW */
> > > +static u32 dip_mdp_fmt_get_stride(struct v4l2_pix_format_mplane *mfmt,
> > > +                             const struct mtk_dip_dev_format *fmt,
> > > +                             unsigned int plane)
> > > +{
> > > +   enum mdp_color c = fmt->mdp_color;
> > > +   u32 bytesperline = (mfmt->width * fmt->row_depth[plane]) / 8;
> > > +   u32 stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
> > > +           / fmt->row_depth[0];
> > > +
> > > +   if (plane == 0)
> > > +           return stride;
> > > +
> > > +   if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > > +           if (MDP_COLOR_IS_BLOCK_MODE(c))
> > > +                   stride = stride / 2;
> > > +           return stride;
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +/* Stride that is accepted by MDP HW of format with contiguous planes */
> > > +static u32
> > > +dip_mdp_fmt_get_stride_contig(const struct mtk_dip_dev_format *fmt,
> > > +                         u32 pix_stride,
> > > +                         unsigned int plane)
> > > +{
> > > +   enum mdp_color c = fmt->mdp_color;
> > > +   u32 stride = pix_stride;
> > > +
> > > +   if (plane == 0)
> > > +           return stride;
> > > +
> > > +   if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
> > > +           stride = stride >> MDP_COLOR_GET_H_SUBSAMPLE(c);
> > > +           if (MDP_COLOR_IS_UV_COPLANE(c) && !MDP_COLOR_IS_BLOCK_MODE(c))
> > > +                   stride = stride * 2;
> > > +           return stride;
> > > +   }
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +/* Plane size that is accepted by MDP HW */
> > > +static u32
> > > +dip_mdp_fmt_get_plane_size(const struct mtk_dip_dev_format *fmt,
> > > +                      u32 stride, u32 height,
> > > +                      unsigned int plane)
> > > +{
> > > +   enum mdp_color c = fmt->mdp_color;
> > > +   u32 bytesperline;
> > > +
> > > +   bytesperline = (stride * fmt->row_depth[0])
> > > +           / MDP_COLOR_BITS_PER_PIXEL(c);
> >
> > Hmm, stride and bytesperline should be exactly the same thing. Could you
> > explain what's happening here?
>
> The stride here is specific for MDP hardware (which uses the same MDP
> stride setting for NV12 and NV12M):
>
>         bytesperline = width * row_depth / 8
>         MDP stride   = width * MDP_COLOR_BITS_PER_PIXEL /8
>
> Therfore,
>
>         bytesperline = MDP stride * row_depth / MDP_COLOR_BITS_PER_PIXEL
>         MDP stride   = bytesperline * MDP_COLOR_BITS_PER_PIXEL/ row_depth
>

I'm sorry I'm still confused. Is there an intermediate buffer between
DIP and MDP that has stride of |MDP stride| and then MDP writes to the
final buffer that has the stride of |bytesperline|?

[snip]

> >
> > > +           u32 sizeimage;
> > > +
> > > +           if (bpl < min_bpl)
> > > +                   bpl = min_bpl;
> > > +
> > > +           sizeimage = (bpl * mfmt_to_fill->height * dev_fmt->depth[i])
> > > +                   / dev_fmt->row_depth[i];
> >
> > Shouldn't this be bpl * fmt->height?
>
> Row_depth is the bits of the pixel.
> Depth means the bytes per pixel of the image format.
>
> For example,
> Image: 640 * 480
> YV12: row_depth = 8, depth = 12

YV12 has 3 planes of 8 bits per pixel. Not sure where does this 12 come from.

> Bytes per line = width * row_depth / 8 = 640 * 8/ 8 = 640
> Image size = Bytes per line * height * (depth/ row_depth)
>            = 640 * 480 * 1.5
>

I think we might be having some terminology issue here. "row" is
normally the same as "line", which consists of |width| pixels +
padding, which is |bytesperline| bytes in total.

Perhaps you want to store a bits_per_pixel[] and vertical and
horizontal subsampling arrays for all planes of the formats in the
format descriptor.

By the way, have you considered using the V4L2 format helpers [1]?

[1] https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/media/v4l2-core/v4l2-common.c#L561

> >
> > > +           dev_dbg(&pipe->dip_dev->pdev->dev,
> > > +                   "Non-contiguous-mp-buf(%s),total-plane-size(%d),dma_port(%d)\n",
> > > +                   buf_name,
> > > +                   total_plane_size,
> > > +                   b->usage);
> > > +           return 0;
> > > +   }
> > > +
> > > +   for (; i < MDP_COLOR_GET_PLANE_COUNT(b->format.colorformat); ++i) {
> >
> > I don't see these MDP_ macros defined anywhere. Please don't use macros
> > defined from other drivers. We can embed this information in the
> > mtk_dip_dev_format struct. One would normally call it num_cplanes (color
> > planes).
> >
> > However, I would just make this driver support M formats only and forget
> > about formats with only memory planes count != color planes count.
>
> Since the non-M formats are still used by 8183's user lib now, may I add
> num_cplanes and support the both formats?
>

Okay, let's keep them for now.

[snip]

> > > +
> > > +   /* Tuning buffer */
> > > +   dev_buf_tuning =
> > > +           pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_TUNING_OUT];
> > > +   if (dev_buf_tuning) {
> > > +           dev_dbg(&pdev->dev,
> > > +                   "Tuning buf queued: scp_daddr(%pad),isp_daddr(%pad)\n",
> > > +                   &dev_buf_tuning->scp_daddr[0],
> > > +                   &dev_buf_tuning->isp_daddr[0]);
> > > +           dip_param->tuning_data.pa =
> > > +                   (uint32_t)dev_buf_tuning->scp_daddr[0];
> > > +           dip_param->tuning_data.present = true;
> > > +           dip_param->tuning_data.iova =
> > > +                   (uint32_t)dev_buf_tuning->isp_daddr[0];
> >
> > Why are these casts needed?
>
> This structure is shared between CPU and scp and the pa and iova is
> defined as 32bits fields.
>
> struct tuning_addr {
>         u32     present;
>         u32     pa;     /* Used by CM4 access */
>         u32     iova;   /* Used by IOMMU HW access */
> } __attribute__ ((__packed__));
>

I see, thanks.

[snip]

> >
> > > +#define DIP_COMPOSING_MAX_NUM              3
> > > +#define DIP_MAX_ERR_COUNT          188U
> > > +#define DIP_FLUSHING_WQ_TIMEOUT            (16U * DIP_MAX_ERR_COUNT)
> >
> > Any rationale behind this particular numbers? Please add comments explaining
> > them.
>
> I would like to adjust the time out value to  1000 / 30 *
> (DIP_COMPOSING_MAX_NUM) * 3.
>
> To wait 3 times of expected frame time (@30fps) in the worst case (max
> number of jobs in SCP).
>

With high system load it could be still possible to hit this. Since it
should normally be impossible to hit this timeout on a system working
correctly, how about just making this something really long like 1
second?

[snip]

> >
> > > +
> > > +   dev_dbg(&dip_dev->pdev->dev,
> > > +           "%s: wakeup frame_no(%d),num(%d)\n",
> > > +           __func__, req->img_fparam.frameparam.frame_no,
> > > +           atomic_read(&dip_hw->num_composing));
> > > +
> > > +   buf = req->working_buf;
> > > +   mtk_dip_wbuf_to_ipi_img_addr(&req->img_fparam.frameparam.subfrm_data,
> > > +                                &buf->buffer);
> > > +   memset(buf->buffer.vaddr, 0, DIP_SUB_FRM_SZ);
> > > +   mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.config_data,
> > > +                                   &buf->config_data);
> > > +   memset(buf->config_data.vaddr, 0, DIP_COMP_SZ);
> > > +
> > > +   if (!req->img_fparam.frameparam.tuning_data.present) {
> > > +           /*
> > > +            * When user enqueued without tuning buffer,
> > > +            * it would use driver internal buffer.
> > > +            */
> > > +           dev_dbg(&dip_dev->pdev->dev,
> > > +                   "%s: frame_no(%d) has no tuning_data\n",
> > > +                   __func__, req->img_fparam.frameparam.frame_no);
> > > +
> > > +           mtk_dip_wbuf_to_ipi_tuning_addr
> > > +                           (&req->img_fparam.frameparam.tuning_data,
> > > +                            &buf->tuning_buf);
> > > +           memset(buf->tuning_buf.vaddr, 0, DIP_TUNING_SZ);
> > > +   }
> > > +
> > > +   req->img_fparam.frameparam.state = FRAME_STATE_COMPOSING;
> > > +   mtk_dip_wbuf_to_ipi_img_sw_addr(&req->img_fparam.frameparam.self_data,
> > > +                                   &buf->frameparam);
> > > +   memcpy(buf->frameparam.vaddr, &req->img_fparam.frameparam,
> > > +          sizeof(req->img_fparam.frameparam));
> >
> > Is img_fparam really used at this stage? I can only see ipi_param passed to
> > the IPI.
>
> The content of img_fparam is passed to SCP.
>
> The dip frame information is saved in req->img_fparam.frameparam (in
> mtk_dip_pipe_ipi_params_config()).
>
> The content of req->img_fparam.frameparam is copied to
> buf->frameparam.vaddr.
>
> Since we set ipi_param.frm_param.pa to the buf->frameparam.scp_daddr in
> mtk_dip_wbuf_to_ipi_img_sw_addr(), the content of img_fparam is pass to
> SCP through ipi_param.

Okay, I see. Thanks,

[snip]

> >
> > > +   } else {
> > > +           for (i = 0; i < *num_planes; i++) {
> > > +                   if (sizes[i] < fmt->fmt.pix_mp.plane_fmt[i].sizeimage) {
> > > +                           dev_dbg(&pipe->dip_dev->pdev->dev,
> > > +                                   "%s:%s:%s: invalid buf: %u < %u\n",
> > > +                                   __func__, pipe->desc->name,
> > > +                                   node->desc->name, sizes[0], size);
> > > +                                   return -EINVAL;
> > > +                   }
> > > +                   sizes[i] = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
> >
> > For VIDIOC_CREATEBUFS we also need to handle the case when *num_planes > 0
> > and then we need to honor the values already present in sizes[]. (Note that
> > the code above overrides *num_planes to 1, so we lose the information. The
> > code needs to be restructured to handle that.)
>
> We overrides *num_planes when *num_planes is 0. Is the modification I
> need to do to keep the original value of size[]?

Yes.

>
> if (!*num_planes) {
>         *num_planes = 1;
>         sizes[0] = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> }
>

[snip]

> >
> > > +   dev_dbg(&pipe->dip_dev->pdev->dev,
> > > +           "%s:%s:%s cnt_nodes_not_streaming(%d), is_pipe_streamon(%d)\n",
> > > +           __func__, pipe->desc->name, node->desc->name, count,
> > > +           is_pipe_streamon);
> > > +
> > > +   if (count && is_pipe_streamon) {
> >
> > For v4l2_subdev_call() shouldn't this be !count && is_pipe_streamon?
>
> Do you mean that pipe->subdev's stop stream should be called after all
> video device are stream off, not the first video device's stream off?
>

Partially. See the comment below. We should stop the subdev when the
first video node stops streaming, but the media pipeline only when all
the nodes stopped.

> >
> > > +           ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 0);
> > > +           if (ret)
> > > +                   dev_err(&pipe->dip_dev->pdev->dev,
> > > +                           "%s:%s: sub dev s_stream(0) failed(%d)\n",
> > > +                           pipe->desc->name, node->desc->name, ret);
> > > +           media_pipeline_stop(&node->vdev.entity);
> >
> > We should do this one when the last node stops streaming to solve the
> > enable state locking issue as described in my comment to _start_streaming().
>
> I will do this when the last node stops streaming.
>

Ack.

> >
> > > +   }
> > > +
> > > +   mtk_dip_return_all_buffers(pipe, node, VB2_BUF_STATE_ERROR);
> > > +}
> > > +
> > > +static int mtk_dip_videoc_querycap(struct file *file, void *fh,
> > > +                              struct v4l2_capability *cap)
> > > +{
> > > +   struct mtk_dip_pipe *pipe = video_drvdata(file);
> > > +
> > > +   strlcpy(cap->driver, pipe->desc->name,
> > > +           sizeof(cap->driver));
> > > +   strlcpy(cap->card, pipe->desc->name,
> > > +           sizeof(cap->card));
> > > +   snprintf(cap->bus_info, sizeof(cap->bus_info),
> > > +            "platform:%s", dev_name(pipe->dip_dev->mdev.dev));
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int mtk_dip_videoc_try_fmt(struct file *file, void *fh,
> > > +                             struct v4l2_format *f)
> >
> > I don't see this function returning any error codes. Please make it void.
>
> mtk_dip_videoc_try_fmt() is used as vidioc_try_fmt_vid_out_mplane op.
> Using void seems to make it incompatible with
> vidioc_try_fmt_vid_out_mplane.
>
> .vidioc_try_fmt_vid_out_mplane = mtk_dip_videoc_try_fmt,
>
> int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *fh,
>                                      struct v4l2_format *f);
>

Oops, sorry, I'm not sure why I suggested that.

[snip]

> > > +   /* Initialize subdev */
> > > +   v4l2_subdev_init(&pipe->subdev, &mtk_dip_subdev_ops);
> > > +
> > > +   pipe->subdev.entity.function =
> > > +           MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> > > +   pipe->subdev.entity.ops = &mtk_dip_media_ops;
> > > +   pipe->subdev.flags =
> > > +           V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> > > +   pipe->subdev.ctrl_handler = NULL;
> > > +   pipe->subdev.internal_ops = &mtk_dip_subdev_internal_ops;
> > > +
> > > +   for (i = 0; i < pipe->num_nodes; i++)
> > > +           pipe->subdev_pads[i].flags =
> > > +                   V4L2_TYPE_IS_OUTPUT(pipe->nodes[i].desc->buf_type) ?
> > > +                   MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
> >
> > Isn't this the other way around?
>
> I checked the document of MEDIA_PAD_FL_SINK and MEDIA_PAD_FL_SOURCE. It
> seems that the codes match the description.
>
> RAW Ouput video device: MEDIA_PAD_FL_SOURCE --> DIP sub dev:
> MEDIA_PAD_FL_SINK
> DIP sub dev: MEDIA_PAD_FL_SOURCE --> MDP Capture video device:
> MEDIA_PAD_FL_SINK
>
> MEDIA_PAD_FL_SINK: Input pad, relative to the entity. Input pads sink
> data and are targets of links.
> MEDIA_PAD_FL_SOURCE: Output pad, relative to the entity. Output pads
> source data and are origins of links.
>

Ah, that's right, sorry for the noise.

[snip]

> > > +   {
> > > +           .format = V4L2_PIX_FMT_NV12M,
> > > +           .mdp_color      = MDP_COLOR_NV12,
> > > +           .colorspace = V4L2_COLORSPACE_BT2020,
> > > +           .depth          = { 8, 4 },
> > > +           .row_depth      = { 8, 8 },
> >
> > What is depth and what is row_depth? They both seem to not match NV12, which
> > should have 16 bits per sample in the CbCr plane.
>
> Fow_depth is the bits of the pixel.

Bits of a YCbCr plane pixel is 16 for NV12.

> Depth means the bytes per pixel of the image foramt.
>
> For example,
> Image: 640 * 480
> YV12: row_depth = 8, depth = 12
> Bytes per line = width * row_depth / 8 = 640 * 8/ 8 = 640
> Image size = Bytes per line * height * (depth/ row_depth)
>            = 640 * 480 * 1.5
>
> Image: 640 * 480
> Bytes per line(Y) = width * row_depth/ 8 = 640
> Bytes per line(CbCr) = width * row_depth/ 8 = 640
>
> Image size(Y) = Bytes per line * height * (depth/ row_depth)
>            = 640 * 480 * 8/8 = 640 * 480 * 1
>
> Image size(CbCr) = Bytes per line * height * (depth/ row_depth)
>            = 640 * 480 * 4/8 = 640 * 480 * 0.5
>

I'd suggest either using the V4L2 format helpers, as suggested in
another comment above with a link OR adopting the typical convention
of having the .depth mean the pixel value size, i.e. 16-bit for CbCr
plane of NV12 and then use subsampling factors to calculate the plane
bytesperline and sizeimage.

[snip]

> > > +static const struct mtk_dip_video_device_desc
> > > +reprocess_output_queues_setting[MTK_DIP_VIDEO_NODE_ID_OUT_TOTAL_NUM] = {
> > > +   {
> > > +           .id = MTK_DIP_VIDEO_NODE_ID_RAW_OUT,
> > > +           .name = "Raw Input",
> > > +           .cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
> > > +           .buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> > > +           .smem_alloc = 0,
> > > +           .flags = MEDIA_LNK_FL_ENABLED,
> > > +           .fmts = in_fmts,
> > > +           .num_fmts = ARRAY_SIZE(in_fmts),
> > > +           .default_fmt_idx = 5,
> > > +           .default_width = MTK_DIP_OUTPUT_MAX_WIDTH,
> > > +           .default_height = MTK_DIP_OUTPUT_MAX_HEIGHT,
> > > +           .dma_port = 0,
> > > +           .frmsizeenum = &in_frmsizeenum,
> > > +           .ops = &mtk_dip_v4l2_video_out_ioctl_ops,
> > > +           .description = "Source image to be process",
> > > +
> > > +   },
> > > +   {
> > > +           .id = MTK_DIP_VIDEO_NODE_ID_TUNING_OUT,
> > > +           .name = "Tuning",
> > > +           .cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
> > > +           .buf_type = V4L2_BUF_TYPE_META_OUTPUT,
> > > +           .smem_alloc = 1,
> > > +           .flags = 0,
> > > +           .fmts = fw_param_fmts,
> > > +           .num_fmts = 1,
> > > +           .default_fmt_idx = 0,
> > > +           .dma_port = 0,
> > > +           .frmsizeenum = &in_frmsizeenum,
> > > +           .ops = &mtk_dip_v4l2_meta_out_ioctl_ops,
> > > +           .description = "Tuning data for image enhancement",
> > > +   },
> > > +};
> >
> > The entries here seem to be almost the same to output_queues_setting[], the
> > only difference seems to be default_fmt_idx and description.
> >
> > What's the difference between the capture and reprocess pipes?
>
> The reprocess pipe is completely the same as capture one except the
> default format of the input.
>

Does the default format really matter here? The userspace should set
its own desired format anyway. Then we could just unify the settings
of both pipes.

[snip]

> >
> > > +
> > > +   return num;
> > > +}
> > > +
> > > +static int __maybe_unused mtk_dip_suspend(struct device *dev)
> > > +{
> > > +   struct mtk_dip_dev *dip_dev = dev_get_drvdata(dev);
> > > +   int ret, num;
> > > +
> > > +   if (pm_runtime_suspended(dev)) {
> > > +           dev_dbg(dev, "%s: pm_runtime_suspended is true, no action\n",
> > > +                   __func__);
> > > +           return 0;
> > > +   }
> > > +
> > > +   ret = wait_event_timeout(dip_dev->dip_hw.flushing_hw_wq,
> > > +                            !(num = mtk_dip_get_scp_job_num(dip_dev)),
> > > +                            msecs_to_jiffies(200));
> >
> > Is 200 milliseconds a reasonable timeout here, i.e. for any potential use
> > case it would always take less than 200 ms to wait for all the tasks running
> > in the ISP?
>
> I would like to adjust the time out value to  1000 / 30 *
> (DIP_COMPOSING_MAX_NUM) * 3.
>
> To wait 3 times of expected frame time (@30fps) in worst case (max
> number of jobs in SCP).
>

As I suggested in another comment above, the worst case for the
hardware might be still better than the scheduling latency we could
get for a heavy loaded system. While that wouldn't really apply here,
because nothing else happening in parallel when the system is
suspending, we could just stick to some really long time out anyway,
e.g. 1 second. We shouldn't hit it anyway - it's just a safety guard
to prevent the system hanging if something goes really bad.

Best regards,
Tomasz
