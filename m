Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD5C1C192C
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 17:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729484AbgEAPPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 11:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729439AbgEAPPK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 11:15:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB41BC061A0E
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 08:15:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j1so11896568wrt.1
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KNUORWcwL3FSkeux2ng3gL4l9kURWCa7CLUv75uTN0o=;
        b=kJVtwBWRYjcuIl9VmtqDN/kqtjCrOipvzjcUOFhqY73oSFboipAzh3yGNtu3a5MOBa
         rYCm8PXHh8iXAboqNTn4Oq3sxscZs9eP1KWSWcdTuQFs/B/Y6xE7l9eG1RYLEACRAbF/
         1vm3ktQQNd1jSEVrg5S/imPOX2v9aO+x8jIbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KNUORWcwL3FSkeux2ng3gL4l9kURWCa7CLUv75uTN0o=;
        b=Sdp2mvk00GCBFWFQJ69Wyaur2tzOyk+3iLamliogs0rU8oa9+GSPq1zmDkVrtTZgaQ
         5SVTx8u3+QofbsYF/EwJ34wp85yi4ebZLsz0yI3w5PRWNHtiWeOfkmfxtsLA2+xMu8uU
         dn1BAq1ALqV26FoqQeBkG7p7jfI/QGkzA3Dx0Md1YgCmpeUhTMH1zSwhnVpqkuqybNTB
         T5R6dNO3t6dSIKZA27dm1jQb1De5Ro2rpWX/GodrTxtR3KiJHDg6aHLEYtT8frhy7V11
         ID5adMgV+L0kHWgMQYfCo34LC7t8XSPWuEkTI+5OaZIa+j0e6q8we2bBvhWV6+YIviae
         91pA==
X-Gm-Message-State: AGi0PuYxfAaaE5BgsF3LPFrKBYyXqTgzsIMGq/Wpcn9MZtmyejFFDKDQ
        P/JiiQntSLCimc84EdM/i2I7aA==
X-Google-Smtp-Source: APiQypJkp2XUhMDivkz4wONeUVafHQwd0uBUFo9fxzfQsCOQ3u1sazzz1LSYAjen78ioDAnLXqP8yQ==
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr2052737wrm.43.1588346107231;
        Fri, 01 May 2020 08:15:07 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id n2sm4606805wrt.33.2020.05.01.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 08:15:06 -0700 (PDT)
Date:   Fri, 1 May 2020 15:15:05 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <Rick.Chang@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v4 5/5] media: platform: Add jpeg dec/enc feature
Message-ID: <20200501151505.GA218308@chromium.org>
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
 <20191017084033.28299-6-xia.jiang@mediatek.com>
 <20191023103945.GA41089@chromium.org>
 <1575626384.17879.81.camel@mhfsdcap03>
 <CAAFQd5A8XAT-7kZgaKktbBk1ogdfY3LRsK0xapHps4VqCQ_BZA@mail.gmail.com>
 <1587538807.24163.102.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587538807.24163.102.camel@mhfsdcap03>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

Finally found time to take a look again. Really sorry for the late
reply.

On Wed, Apr 22, 2020 at 03:00:07PM +0800, Xia Jiang wrote:
> On Tue, 2020-03-10 at 13:17 +0900, Tomasz Figa wrote:
> > Hi Xia,
> > 
> > On Fri, Dec 6, 2019 at 6:59 PM Xia Jiang <xia.jiang@mediatek.com> wrote:
> > >
> > > On Wed, 2019-10-23 at 18:39 +0800, Tomasz Figa wrote:
> > > > Hi Xia,
> > > >
> > > > On Thu, Oct 17, 2019 at 04:40:38PM +0800, Xia Jiang wrote:
> > > > > Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> > > > > decode and encode have great similarities with function operation.
> > > > >
> > > > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > > > ---
> > > > > v4: split mtk_jpeg_try_fmt_mplane() to two functions, one for encoder,
> > > > >     one for decoder.
> > > > >     split mtk_jpeg_set_default_params() to two functions, one for
> > > > >     encoder, one for decoder.
> > > > >     add cropping support for encoder in g/s_selection ioctls.
> > > > >     change exif mode support by using V4L2_JPEG_ACTIVE_MARKER_APP1.
> > > > >     change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 65535 by
> > > > >     specification.
> > > > >     move width shifting operation behind aligning operation in
> > > > >     mtk_jpeg_try_enc_fmt_mplane() for bug fix.
> > > > >     fix user abuseing data_offset issue for DMABUF in
> > > > >     mtk_jpeg_set_enc_src().
> > > > >     fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_HEIGHT
> > > > >                         and MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH from
> > > > >                         'int' type to 'unsigned int' type.
> > > > >                         fix msleadingly indented of 'else'.
> > > > >
> > > > > v3: delete Change-Id.
> > > > >     only test once handler->error after the last v4l2_ctrl_new_std().
> > > > >     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new patch.
> > > > >
> > > > > v2: fix compliance test fail, check created buffer size in driver.
> > > > > ---
> > > > >  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 731 +++++++++++++++---
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
> > > > >  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
> > > > >  7 files changed, 1004 insertions(+), 146 deletions(-)
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.h
> > > > >
> > > >
> > > > First of all, thanks for the patch!
> > > >
> > > > Please check my comments below.
> > > >
> > > > My general feeling about this code is that the encoder hardware block is
> > > > completely orthogonal from the decoder block and there is very little code
> > > > reuse from the original decoder driver.
> > > >
> > > > Moreover, a lot of existing code now needs if (decoder) { ... } else {... }
> > > > segments, which complicates the code.
> > > >
> > > > Would it perhaps make sense to instead create a separate mtk-jpeg-enc
> > > > driver?
> > > >
> > > > It would also give us a fresh start in terms of code quality, as the
> > > > existing mtk-jpeg driver has a lot of quality issues unfortunately. (Some
> > > > of my comments to this patch actually relate to the issues with the
> > > > original code, not introduced by this patch, but we need to fix them if
> > > > changing this driver already.)
> > > >
> > > Dear Tomasz,
> > >
> > > I haved fixed the driver by following your advice in general.
> > >
> > > Please check my reply below.
> > 
> > Sorry, I missed this message originally. Replied below.
> 
> Dear Tomasz,
> 
> Thank you for your reply.I have changed the driver in the V8 version
> by following your good advice.
> > 
> > [snip]
> > > > > +   }
> > > > > +   param->enc_w = q_data_src->w;
> > > > > +   param->enc_h = q_data_src->h;
> > > > > +
> > > > > +   if (jpeg_params->enc_quality >= 97)
> > > > > +           param->enc_quality = JPEG_ENCODE_QUALITY_Q97;
> > > > > +   else if (jpeg_params->enc_quality >= 95)
> > > > > +           param->enc_quality = JPEG_ENCODE_QUALITY_Q95;
> > > >
> > > > I'm wondering if the application requests 96, it doesn't expect the quality to
> > > > be _at_least_ 96.
> > > our jpeg enc hw do not support quality 96,only support 15 kinds of quant
> > > table listed here, so if the application requests 96,a nearest and
> > > highest quality will be given.
> > > >
> > 
> > Just to clarify my comment, if I remember correctly, the JPEG standard
> > defines the 100 levels, so if the application requests level 96, but
> > the hardware provides only 95 and 97, the quality should be favored
> > and 97 used.
> done.
> > 
> > [snip]
> > > >
> > > > > +   param->mem_stride = mtk_jpeg_align(width_even, (is_420 ? 16 : 32));
> > > >
> > > > What's the difference between img_stride and mem_stride?
> > >
> > > In theory, mem_stride need >= img_stride,but we use the same is ok
> > > >
> > > > > +   param->total_encdu =
> > > > > +           ((padding_width >> 4) * (padding_height >> (is_420 ? 4 : 3)) *
> > > > > +           (is_420 ? 6 : 4)) - 1;
> > > >
> > > > The comment above the struct says this is the total number of 8x8 blocks.
> > > > Why would it depend on whether the format is YUV 4:2:0? Since we should
> > > > have already aligned the width and height in try_fmt, this should be as
> > > > simple as (width / 8) * (height / 8).
> > > becuase the image size is w*h*1.5 for yuv420 format, but w*h*2 for
> > > yuv422,so for yuv420: w_16/8*h_16/8*1.5-1(because the hw will start at
> > > number 0), yuv422: w_32/8*h_8/8*2-1,this number is equal to my code.
> > 
> > Do you mean that this also includes the Cb and Cr 8x8 blocks separately?
> > If so, could it be rewritten as below to improve the readability?
> > 
> > luma_blocks = width / 8 * height / 8;
> > if (is_420)
> >     chroma_blocks = luma_blocks / 4;
> > else
> >     chroma_blocks = luma_blocks / 2;
> > param->last_encdu = luma_blocks + 2 * chroma_blocks - 1;
> > 
> > Also, does it mean that this number is actually the index of the last
> > block, not the total number of blocks?
> yes.
> > If so, the field should be probably renamed to last_encdu and the
> > description updated accordingly.
> > 
> > [snip]
> > > > Could we instead check the buffer address alignment in .buf_prepare and fail if
> > > > it's not big enough?
> > > >
> > > > > +   bs->dma_addr_offset = p->enable_exif ? MTK_JPEG_DEFAULT_EXIF_SIZE : 0;
> > > > > +   bs->dma_addr_offsetmask = bs->dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;
> > > >
> > > > What is the meaning of this offset mask?
> > > our actual destination address = destination address + offset address+
> > > destination address offset mask.The mask 0:No offset,1~15:offset byte
> > > from the 16-byte aligned
> > 
> > So we have dma_addr, dma_addr_offset and dma_addr_offsetmask. Why do
> > we need dma_addr_offset? Would the same operation be achieved with the
> > code below?
> Because in exif mode, the beginning of the destination buffer(offset) should be reserved
> for the application to fill(I explained this more in my reply to the v7
> revision).

Thanks. I'll check the explanation in v7.

> > dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> > if (p->enable_exif)
> >     dma_addr += MTK_JPEG_DEFAULT_EXIF_SIZE;
> > bs->dma_addr = dma_addr & ~JPEG_ENC_DST_ADDR_OFFSET_MASK;
> > bs->dma_addr_offset = 0;
> > bs->dma_addr_offsetmask = dma_addr & JPEG_ENC_DST_ADDR_OFFSET_MASK;
> > 
> > Or does the hardware write something directly at bs->dma_addr (some
> > tags?) and then the encoded image at the final desintation address?
> > 
> Hardware just write encoded image at the final destination address.

Okay, so it sounds like we should be able to simplify the calculation.

> > [snip]
> > > > > -static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
> > > > > +static void mtk_jpeg_set_enc_default_params(struct mtk_jpeg_ctx *ctx)
> > > > > +{
> > > > > +   struct mtk_jpeg_q_data *q = &ctx->out_q;
> > > > > +   int align_w, align_h;
> > > > > +
> > > > > +   ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> > > > > +
> > > > > +   ctx->colorspace = V4L2_COLORSPACE_JPEG,
> > > > > +   ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > > > +   ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > > > +   ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > > > > +
> > > > > +   q->w = MTK_JPEG_MIN_WIDTH;
> > > > > +   q->h = MTK_JPEG_MIN_HEIGHT;
> > > > > +
> > > > > +   q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_YUYV,
> > > > > +                                 MTK_JPEG_FMT_TYPE_OUTPUT);
> > > > > +
> > > > > +   align_w = q->w;
> > > > > +   align_h = q->h;
> > > > > +   align_w = round_up(align_w, 2);
> > > > > +   v4l_bound_align_image(&align_w, MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH,
> > > > > +                         5, &align_h, MTK_JPEG_MIN_HEIGHT,
> > > > > +                         MTK_JPEG_MAX_HEIGHT, 3, 0);
> > > > > +   align_w = align_w << 1;
> > > > > +
> > > > > +   if (align_w < MTK_JPEG_MIN_WIDTH &&
> > > > > +       (align_w + 32) <= MTK_JPEG_MAX_WIDTH)
> > > > > +           align_w += 32;
> > > > > +   if (align_h < MTK_JPEG_MIN_HEIGHT &&
> > > > > +       (align_h + 8) <= MTK_JPEG_MAX_HEIGHT)
> > > > > +           align_h += 8;
> > > > > +
> > > > > +   q->sizeimage[0] = align_w * align_h;
> > > > > +   q->bytesperline[0] = align_w;
> > > > > +
> > > > > +   q = &ctx->cap_q;
> > > > > +   q->w = MTK_JPEG_MIN_WIDTH;
> > > > > +   q->h = MTK_JPEG_MIN_HEIGHT;
> > > > > +   q->fmt = mtk_jpeg_find_format(ctx, V4L2_PIX_FMT_JPEG,
> > > > > +                                 MTK_JPEG_FMT_TYPE_CAPTURE);
> > > > > +   q->bytesperline[0] = 0;
> > > > > +   q->sizeimage[0] = MTK_JPEG_DEFAULT_SIZEIMAGE;
> > > > > +}
> > > >
> > > > Could we just create an arbitrary v4l2_pix_format_mplane struct and call
> > > > s_fmt instead? In general, all of the constant values and alignments should
> > > > be already ensured by try_fmt, so this function should be redundant.
> > > if cancel this function,the v4l2-compliance test will fail
> > 
> > Sorry, I guess my comment was not clear. We need to initialize the
> > default parameters. However, the contents of this function seem to
> > heavily duplicate with the code that should be in try_fmt, so could we
> > just call try_fmt from here instead of repeating the calculations?
> done.
> > 
> > [snip]
> > > > > -   ret = devm_request_irq(&pdev->dev, dec_irq, mtk_jpeg_dec_irq, 0,
> > > > > +   ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_irq, 0,
> > > > >                            pdev->name, jpeg);
> > > > >     if (ret) {
> > > > > -           dev_err(&pdev->dev, "Failed to request dec_irq %d (%d)\n",
> > > > > -                   dec_irq, ret);
> > > > > -           ret = -EINVAL;
> > > >
> > > > This removal of ret assignment looks like a separate fix that should be
> > > > done in its own patch.
> > > this change is because of the adding of jpeg enc driver,not the orignal
> > > driver' question, should I move it to the orignal driver's patch?
> > 
> > Yes, please.
> done.
> > 
> > > >
> > > > > +           dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> > > > > +                   jpeg_irq, ret);
> > > > >             goto err_req_irq;
> > > > >     }
> > > > >
> > > > > @@ -1140,33 +1602,35 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
> > > > >             goto err_m2m_init;
> > > > >     }
> > > > >
> > > > > -   jpeg->dec_vdev = video_device_alloc();
> > > > > -   if (!jpeg->dec_vdev) {
> > > > > +   jpeg->vfd_jpeg = video_device_alloc();
> > > > > +   if (!jpeg->vfd_jpeg) {
> > > > >             ret = -ENOMEM;
> > > > > -           goto err_dec_vdev_alloc;
> > > > > +           goto err_vfd_jpeg_alloc;
> > > > >     }
> > > > > -   snprintf(jpeg->dec_vdev->name, sizeof(jpeg->dec_vdev->name),
> > > > > -            "%s-dec", MTK_JPEG_NAME);
> > > > > -   jpeg->dec_vdev->fops = &mtk_jpeg_fops;
> > > > > -   jpeg->dec_vdev->ioctl_ops = &mtk_jpeg_ioctl_ops;
> > > > > -   jpeg->dec_vdev->minor = -1;
> > > > > -   jpeg->dec_vdev->release = video_device_release;
> > > > > -   jpeg->dec_vdev->lock = &jpeg->lock;
> > > > > -   jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
> > > > > -   jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> > > > > -   jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
> > > > > +   snprintf(jpeg->vfd_jpeg->name, sizeof(jpeg->vfd_jpeg->name),
> > > > > +            "%s-%s", MTK_JPEG_NAME,
> > > > > +            jpeg->mode == MTK_JPEG_ENC ? "enc" : "dec");
> > > > > +   jpeg->vfd_jpeg->fops = &mtk_jpeg_fops;
> > > > > +   jpeg->vfd_jpeg->ioctl_ops = &mtk_jpeg_ioctl_ops;
> > > > > +   jpeg->vfd_jpeg->minor = -1;
> > > > > +   jpeg->vfd_jpeg->release = video_device_release;
> > > > > +   jpeg->vfd_jpeg->lock = &jpeg->lock;
> > > > > +   jpeg->vfd_jpeg->v4l2_dev = &jpeg->v4l2_dev;
> > > > > +   jpeg->vfd_jpeg->vfl_dir = VFL_DIR_M2M;
> > > > > +   jpeg->vfd_jpeg->device_caps = V4L2_CAP_STREAMING |
> > > > >                                   V4L2_CAP_VIDEO_M2M_MPLANE;
> > > > >
> > > > > -   ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, 3);
> > > > > +   ret = video_register_device(jpeg->vfd_jpeg, VFL_TYPE_GRABBER, -1);
> > > >
> > > > The change from 3 to -1 also looks like something for a separate patch.
> > > same as the above reply
> > 
> > Ditto.
> done.
> > 
> > [snip]
> > > > > @@ -17,23 +18,77 @@
> > > > >
> > > > >  #define MTK_JPEG_FMT_FLAG_DEC_OUTPUT       BIT(0)
> > > > >  #define MTK_JPEG_FMT_FLAG_DEC_CAPTURE      BIT(1)
> > > > > +#define MTK_JPEG_FMT_FLAG_ENC_OUTPUT       BIT(2)
> > > > > +#define MTK_JPEG_FMT_FLAG_ENC_CAPTURE      BIT(3)
> > > > >
> > > > >  #define MTK_JPEG_FMT_TYPE_OUTPUT   1
> > > > >  #define MTK_JPEG_FMT_TYPE_CAPTURE  2
> > > > >
> > > > > -#define MTK_JPEG_MIN_WIDTH 32
> > > > > -#define MTK_JPEG_MIN_HEIGHT        32
> > > > > -#define MTK_JPEG_MAX_WIDTH 8192
> > > > > -#define MTK_JPEG_MAX_HEIGHT        8192
> > > > > +#define MTK_JPEG_MIN_WIDTH 32U
> > > > > +#define MTK_JPEG_MIN_HEIGHT        32U
> > > > > +#define MTK_JPEG_MAX_WIDTH 65535U
> > > > > +#define MTK_JPEG_MAX_HEIGHT        65535U
> > > >
> > > > Why is it okay to change this from 8192 to 65535?
> > > our hw support max width/height to 65535
> > 
> > Does this also apply to the JPEG decoder on MT8173 for which the
> > driver was developed?
> yes.

Okay, then the limit change should be a separate patch that fixes the
wrong limits in existing code. It could be also merged to stable
kernels.

Best regards,
Tomasz

