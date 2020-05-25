Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A0D1E0E79
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 14:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390540AbgEYMbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 08:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390504AbgEYMbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 08:31:51 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8E1C061A0E
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 05:31:51 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id z5so20351780ejb.3
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fXAW47hdPi2kDjAiwn3YZvIgp15z2/sg8BcZ41d9VMI=;
        b=Wjp4nQdnlkRhlAZtEvR3Mw06JrUVfwN+j4NGEhxSsSEU1RgNec6mgiIZX55/4td8Q5
         Bd3RZfaSZn5WFNWPHdiW9pO4FtJRkj3l3u92JS+URUKDzpMZL1bcsYcgunuKdBMA3oqN
         owJ0CXSmh9HGAJsYf2cVxJKRbSMfiw4ZsSLR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXAW47hdPi2kDjAiwn3YZvIgp15z2/sg8BcZ41d9VMI=;
        b=nggVDBnsYdR/ehdxfup/FzhIIvX8vn0RbRmIRjC4IR5UTUayelidxmAk0+Z/zUI1iH
         ZCqlZPixub6oU7AHbffdTxlH3aaE8pe71QBb58O876I8x9sG75Yi/EV1dldQha5mEqig
         IshMQPvpYgq6+Wn+rgM4SgOUm55ET9L2pNoNHCgARw8iRWqKqovMdFEFj5usEzCeNHzj
         il3tMX0guoc/zJMyvgiipbAbiTQMe0gvpZtFTgjS9Qr119yAZA4f3hQyMkm2LnzqzlTK
         NcasRamrIrDa/4z8z+HGSUmK/FuC9r82bw1Hs/vJ+w4wq0ps3wAAzyJq/GMKbxQm2Gz+
         cWsA==
X-Gm-Message-State: AOAM532IAr5YWo6szekBm2Ctmr1x/Ka5vQXBrr//6PQBOmVhu82VhwWg
        RpLeIs0osCogKCBmc4ZgtAUgOVrmTk259w==
X-Google-Smtp-Source: ABdhPJySkAHjWmAiEh8CE36LEFaK5SWq0CJRAkJmrUfqBtWr5T8j6/JgLw2J4tcwHx6IrIaVbqyqUg==
X-Received: by 2002:a17:906:bcd3:: with SMTP id lw19mr19504628ejb.276.1590409909708;
        Mon, 25 May 2020 05:31:49 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id o19sm15660126ejc.77.2020.05.25.05.31.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 05:31:49 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id h4so15097931wmb.4
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 05:31:48 -0700 (PDT)
X-Received: by 2002:a1c:bc42:: with SMTP id m63mr13603076wmf.11.1590409487499;
 Mon, 25 May 2020 05:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com> <20200521182825.GA249683@chromium.org>
 <1590156658.27807.84.camel@mtksdccf07>
In-Reply-To: <1590156658.27807.84.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 14:24:34 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
Message-ID: <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
Subject: Re: [RFC PATCH V4 4/4] platform: mtk-isp: Add Mediatek FD driver
To:     Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, yuzhao@chromium.org,
        zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

r

On Fri, May 22, 2020 at 4:11 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Thu, 2020-05-21 at 18:28 +0000, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Wed, Dec 04, 2019 at 08:47:32PM +0800, Jerry-ch Chen wrote:
[snip]
> > > +
> > > +enum face_angle {
> > > +   MTK_FD_FACE_FRONT,
> > > +   MTK_FD_FACE_RIGHT_50,
> > > +   MTK_FD_FACE_LEFT_50,
> > > +   MTK_FD_FACE_RIGHT_90,
> > > +   MTK_FD_FACE_LEFT_90,
> > > +   MTK_FD_FACE_ANGLE_NUM,
> > > +};
> >
> > This enum seems to define values for the V4L2_CID_MTK_FD_DETECT_POSE
> > control. Considering that this is an enumeration and the values are
> > actually integers (-90, -50, 0, 50, 90), perhaps this should be an
> > INTEGER_MENU control instead?
> >
>
> this ioctl let user select multiple face positions(combination of angles
> and directions) to be detected. so I thought I am not able to use the
> INTEGER_MENU for this purpose.

Ah, okay, I thought there is only one selection possible.

>
> A bit-field as following should be used by user.
> I consider adding it to uapi.
>
> struct face_direction_def {
> __u16 MTK_FD_FACE_DIR_0 : 1,
>         MTK_FD_FACE_DIR_30 : 1,
>         MTK_FD_FACE_DIR_60 : 1,
>         MTK_FD_FACE_DIR_90 : 1,
>         MTK_FD_FACE_DIR_120 : 1,
>         MTK_FD_FACE_DIR_150 : 1,
>         MTK_FD_FACE_DIR_180 : 1,
>         MTK_FD_FACE_DIR_210 : 1,
>         MTK_FD_FACE_DIR_240 : 1,
>         MTK_FD_FACE_DIR_270 : 1,
>         MTK_FD_FACE_DIR_300 : 1,
>         MTK_FD_FACE_DIR_330 : 1,
>         : 4;
> };

Note that bit fields are not recommended in UAPI because of not being
well specified by the language. Instead bits should be defined using
macros with explicit masks or sometimes enums.

>
> User can also select some face directions of each face angle in one
> ioctl, for example:
>
> /*
>  * u16 face_directions[MTK_FD_FACE_ANGLE_NUM] = {0};
>  *
>  *      face_directions[MTK_FD_FACE_FRONT] = 0x7; //angle:0, dir:0,30,60
>  *      face_directions[MTK_FACE_RIGHT_50] = 0x2; //angle:50, dir:30
>  *
>  */

Makes sense, thanks.

>
> > > +
> > > +struct fd_buffer {
> > > +   __u32 scp_addr; /* used by SCP */
> > > +   __u32 dma_addr; /* used by DMA HW */
> > > +} __packed;
> fd buffer is used for scp ipi
>
> > > +
> > > +struct fd_face_result {
> > > +   char data[16];
> > > +};
> fd_face_result is used for user, so it should be moved to
> include/uapi/linux.
> In fact, it has bit-field definition for user, so I would like to define
> it in include/uapi/linux as following:
>
> struct fd_face_result {
>   __u64 face_idx : 12,
>         type : 1,
>         x0 : 10,
>         y0 : 10,
>         x1 : 10,
>         y1 : 10,
>         fcv1 : 11;
>   __u64 fcv2 : 7,
>         rip_dir : 4,
>         rop_dir : 3,
>         det_size : 5;
> };
>

Indeed this should be defined, but as per my comment above, please
avoid using the bitfield construct and define shifts and masks
instead.

>
> > > +
> > > +struct fd_user_output {
> > > +   struct fd_face_result results[MTK_FD_MAX_RESULT_NUM];
> > > +   __u16 number;
> >
> > Is this perhaps the number of results? If so, would num_results be a better
> > name?
> >
> yes, fixed.
> > > +};
> >
> > Since this struct is the meta buffer format, it is a part of the userspace
> > interface and should be defined in a header under include/uapi/linux/.
> >
> Ok, I will create include/uapi/linux/mtk_fd_40.h
> which suppose to include structures that userspace will use.
> should the private IOCTLs be placed in it together?
>

Sorry, what private IOCTLs are you referring to? If you mean private
control IDs, then yes, they should go to that header.

[snip]
> > > +static int mtk_fd_vb2_queue_setup(struct vb2_queue *vq,
> > > +                             unsigned int *num_buffers,
> > > +                             unsigned int *num_planes,
> > > +                             unsigned int sizes[],
> > > +                             struct device *alloc_devs[])
> > > +{
> > > +   struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
> > > +   unsigned int size[2];
> > > +   unsigned int plane;
> > > +
> > > +   switch (vq->type) {
> > > +   case V4L2_BUF_TYPE_META_CAPTURE:
> > > +           size[0] = ctx->dst_fmt.buffersize;
> > > +           break;
> > > +   case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> > > +           size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
> > > +           if (*num_planes == 2)
> > > +                   size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
> > > +           break;
> > > +   }
> >
> > Is this code above needed? The code below sets sizes[] and it uses a for loop,
> > without opencoded assignment for the second plane.
> >
>
> Looks like not really useful here,
> it should check sizes and num_planes if num_plane not zero,
> and for V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, it will at most have 2
> planes, maybe no need for loop as well.

Loops generally make the code cleaner and there might be some desire
to add support for more formats in the future, e.g. in case a next
generation of the hardware shows up.

> I will refine this function as following:
> mtk_fd_vb2_queue_setup(...)
> {
>         struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);
>
>         if (*num_planes == 0) {
>                 if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
>                         sizes[0] = ctx->dst_fmt.buffersize;
>                         *num_planes = 1;
>                         return 0;
>                 } else if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>                         *num_planes = ctx->src_fmt.num_planes;
>                         sizes[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
>                         if (*num_planes == 2)
>                                 sizes[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
>                         return 0;
>                 }
>                 return -EINVAL;
>         }
>
>         /* If num_plane not zero, check the num_plane and sizes*/
>         if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
>                 if ((*num_planes == 1) &&
>                     (sizes[0] <= ctx->dst_fmt.buffersize))
>                         return 0;

nit: The typical convention is to check for problems and return the
error code earlier, with the success handled at the end of the block.

>                 else
>                         return -EINVAL;
>         }
>         if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>                 if ((*num_planes == 1) &&
>                     (sizes[0] <= ctx->src_fmt.plane_fmt[0].sizeimage))
>                         return 0;
>                 else if ((*num_planes == 2) &&
>                          (sizes[0] <= ctx->src_fmt.plane_fmt[0].sizeimage) &&
>                          (sizes[1] <= ctx->src_fmt.plane_fmt[1].sizeimage))
>                         return 0;

Wouldn't a loop eliminate the need to if/else if through the various
supported cases and duplicate the size checks?

>                 else
>                         return -EINVAL;
>
>         }
>         return 0;
> }

How about the following?

mtk_fd_vb2_queue_setup(...)
{
        struct mtk_fd_ctx *ctx = vb2_get_drv_priv(vq);

        if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
                if (*num_planes == 0) {
                        *num_planes = 1;
                        sizes[0] = ctx->dst_fmt.buffersize;
                        return 0;
                }

                if (*num_planes != 1 || sizes[0] < ctx->dst_fmt.buffersize)
                                return -EINVAL;

                return 0;
        }

        /* V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE */
        if (*num_planes == 0) {
                        *num_planes = ctx->src_fmt.num_planes;
                        for (i = 0; i < ctx->src_fmt.num_planes; ++i)
                                sizes[i] = ctx->src_fmt.plane_fmt[i].sizeimage;
                        return 0;
        }

        if (*num_planes < ctx->src_fmt.num_planes)
                return -EINVAL;

        for (i = 0; i < ctx->src_fmt.num_planes; ++i)
                if (sizes[i] < ctx->src_fmt.plane_fmt[i].sizeimage)
                        return -EINVAL;

        return 0;
}

Note that it fully separates the code dealing with each queue and thus
improves the readability.

In this case, it could actually be beneficial to split the vb2_ops
implementation into one that deals only with video_output_mplane and
one only with meta_capture. This would allow eliminating the special
casing based on vq->type and thus further simplify the code. Not sure
if it applies to the other vb2 callbacks, though.

[snip]
> > > +static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
> > > +                             const struct v4l2_pix_format_mplane *sfmt)
> > > +{
> > > +   dfmt->field = V4L2_FIELD_NONE;
> > > +   dfmt->colorspace = V4L2_COLORSPACE_BT2020;
> > > +   dfmt->num_planes = sfmt->num_planes;
> > > +   dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > +   dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > +   dfmt->xfer_func =
> > > +           V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> > > +
> > > +   /* Keep user setting as possible */
> > > +   dfmt->width = clamp(dfmt->width,
> > > +                       MTK_FD_OUTPUT_MIN_WIDTH,
> > > +                       MTK_FD_OUTPUT_MAX_WIDTH);
> > > +   dfmt->height = clamp(dfmt->height,
> > > +                        MTK_FD_OUTPUT_MIN_HEIGHT,
> > > +                        MTK_FD_OUTPUT_MAX_HEIGHT);
> > > +
> > > +   if (sfmt->num_planes == 2) {
> > > +           /* NV16M and NV61M has 1 byte per pixel */
> > > +           dfmt->plane_fmt[0].bytesperline = dfmt->width;
> > > +           dfmt->plane_fmt[1].bytesperline = dfmt->width;
> > > +   } else {
> > > +           /* 2 bytes per pixel */
> > > +           dfmt->plane_fmt[0].bytesperline = dfmt->width * 2;
> > > +   }
> > > +
> > > +   dfmt->plane_fmt[0].sizeimage =
> > > +           dfmt->height * dfmt->plane_fmt[0].bytesperline;
> >
> > Could some of the code above be replaced with v4l2_fill_pixfmt_mp()?
> >
> I would like to refine as following
>
> mtk_fd_fill_pixfmt_mp(...){
>         v4l2_fill_pixfmt_mp(dfmt, sfmt->pixelformat, dfmt->width,
> dfmt->height);
>
>         dfmt->field = V4L2_FIELD_NONE;
>         dfmt->colorspace = V4L2_COLORSPACE_BT2020;
>         dfmt->num_planes = sfmt->num_planes;

num_planes should be already filled in by the helper. That actually
raises a question on whether there is any need to have sfmt passed to
this function at all. Perhaps all we need is the value of pixelformat?

>         dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>         dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>         dfmt->xfer_func =
>                 V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
> }
>

Isn't still a need to clamp() width and height to min/max, though?

[snip]
> > > +   fd_param.user_param.src_img_fmt =
> > > +           get_fd_img_fmt(ctx->src_fmt.pixelformat);
> > > +   if (ctx->src_fmt.num_planes == 2)
> > > +           fd_param.src_img[1].dma_addr =
> > > +                   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
> >
> > nit: Could this be moved above, to be just below src_img[0] initialization,
> > for readability reasons?
> >
> Ok, this function will be refined as
>
> static void mtk_fd_device_run(void *priv)
> {
>         struct mtk_fd_ctx *ctx = priv;
>         struct mtk_fd_dev *fd = ctx->fd_dev;
>         struct vb2_v4l2_buffer *src_buf, *dst_buf;
>         struct fd_enq_param fd_param;
>
>         src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>         dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>
>         fd_param.src_img[0].dma_addr =
>                 vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>         if (ctx->src_fmt.num_planes == 2)
>                 fd_param.src_img[1].dma_addr =
>                         vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);

How about making this a loop in terms of ctx->src_fmt.num_planes?

>         fd_param.user_result.dma_addr =
>                 vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>         fd_param.user_param.src_img_fmt =
>                 get_fd_img_fmt(fd->dev, ctx->src_fmt.pixelformat);
>
>         mtk_fd_fill_user_param(&fd_param.user_param, &ctx->hdl);
>
>         /* Complete request controls if any */
>         v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
>
>         fd->output = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>         mtk_fd_hw_job_exec(fd, &fd_param);
> }

Best regards,
Tomasz
