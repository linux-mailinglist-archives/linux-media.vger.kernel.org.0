Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B8921C1BEB
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730148AbgEARhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730260AbgEARhQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:37:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E165C061A0E
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:37:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u16so429122wmc.5
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ufxfpcTyMlazNounw3wNzyToYB3UJEzHIn7ulrOGXXU=;
        b=ImQZRdwOETOF5qY/+pyGGb3LTEQ9xFaAZ+Oh5wq1sxFysc+UZ2KddbKYoqax8Vjr7z
         sgvIxkJ+RJgkAZAdTUleV59iJQCJJZSUkKcIN4hgrw7bXJWPsZUfnyvu9Bq4xvrlqXV0
         Wf+83lgasQstrjoJbaTCr0HQGjf3+NCZof2RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ufxfpcTyMlazNounw3wNzyToYB3UJEzHIn7ulrOGXXU=;
        b=h46vLUqVitWeMBb1nsHs/qdcYFC342ndjPitRzsmVRL870drM/udEvbtDr2mvnTqUW
         P0ahUVeJRcz6zh8bR39FR4pgDxF04uH4ghVAPfsnAWbSIjeGtkd7cmonBR+EDCoi4Vjh
         CtFz9C1SrkS48pwWXR0zmrzDgcLo4F/f6WOQcI5ys1O1TUyCtezGLXKXrbXn3hz/kfo1
         SPsHPFEjuetOYbWknffruPt382FCzXHXhMnRCMUv4VP9ExYn58xm5r/wipfvh0jduwtI
         NtnMPD45WpvkKQJEhOIr/p7mMsEXkiq9t441roeLXqOoW4kxXPyCAqZ92N2xOd1NwkJS
         zp0g==
X-Gm-Message-State: AGi0PuYEfDWjKssTeoKvMiZ6vIIkAlq/hvN25QxuSJrUhsiPKIxp/o3M
        ykbncS6+FshhRes13jWCP8Unvw==
X-Google-Smtp-Source: APiQypJyniRJmeRLwjfWdIyj8PkcBx1aKguknLdjRpeiffgQiJ+m2FGrMs2k7mIaQ49bHNdCnwosXA==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr569906wmj.186.1588354634845;
        Fri, 01 May 2020 10:37:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d5sm5373095wrp.44.2020.05.01.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:37:14 -0700 (PDT)
Date:   Fri, 1 May 2020 17:37:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v7 11/11] media: platform: Add jpeg dec/enc feature
Message-ID: <20200501173712.GB218308@chromium.org>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
 <20200303123446.20095-12-xia.jiang@mediatek.com>
 <20200306112337.GA163286@chromium.org>
 <1587009795.24163.87.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587009795.24163.87.camel@mhfsdcap03>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Apr 16, 2020 at 12:03:15PM +0800, Xia Jiang wrote:
> On Fri, 2020-03-06 at 20:23 +0900, Tomasz Figa wrote:
> > Hi Xia,
> > 
> > On Tue, Mar 03, 2020 at 08:34:46PM +0800, Xia Jiang wrote:
> > > Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jpeg
> > > decode and encode have great similarities with function operation.
> > 
> > Thank you for the patch. Please see my comments inline.
> 
> Dear Tomasz,
> 
> Thank you for your reply. I have followed your advice and submited v8
> version patch.
> 
> Please check my reply below.
[snip]
> > 
> > >  
> > > -	switch (s->target) {
> > > -	case V4L2_SEL_TGT_COMPOSE:
> > > -		s->r.left = 0;
> > > -		s->r.top = 0;
> > > -		ctx->out_q.w = s->r.width;
> > > -		ctx->out_q.h = s->r.height;
> > > -		break;
> > > -	default:
> > > -		return -EINVAL;
> > > +		switch (s->target) {
> > > +		case V4L2_SEL_TGT_CROP:
> > > +			s->r.left = 0;
> > > +			s->r.top = 0;
> > > +			ctx->out_q.w = s->r.width;
> > > +			ctx->out_q.h = s->r.height;
> > 
> > What happens if the userspace provides a value bigger than current format?
> we need get the min value of userspace value and current value,changed
> it like this:
> ctx->out_q.w = min(s->r.width, ctx->out_q.w);
> ctx->out_q.h = min(s->r.height,ctx->out_q.h);

Since ctx->out_q is modified by this function, wouldn't that cause
problems if S_SELECTION was called two times, first with a smaller
rectangle and then with a bigger one? We should store the active crop
and format separately and use the latter for min().

[snip]
> > >  
> > >  	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
> > >  		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> > > @@ -772,6 +1011,45 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
> > >  	return 0;
> > >  }
> > >  
> > > +static void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> > > +				 struct vb2_buffer *dst_buf,
> > > +				 struct mtk_jpeg_enc_bs *bs)
> > > +{
> > > +	bs->dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> > > +	bs->dma_addr_offset = ctx->enable_exif ? MTK_JPEG_DEFAULT_EXIF_SIZE : 0;
> > 
> > Could you explain what is the meaning of the dma_addr_offset and where the
> > default EXIF size comes from? Also, how is the encoder output affected by
> > the enable_exif flag?
> If enabled the exif mode, the real output will be filled at the locaiton
> of dst_addr+ dma_addr_offset(exif size).The dma_addr_offset will be
> filled by the application.
> The default exif size is setted as constant value 64k according to the
> spec.(Exif metadata are restricted in size to 64kB in JPEG images
> because according to the specification this information must be
> contained within a signed JPEG APP1 segment)

Okay, thanks. Then it sounds like MTK_JPEG_MAX_EXIF_SIZE could be a more
appropriate name.

[snip]
> > > +}
> > > +
> > >  static void mtk_jpeg_device_run(void *priv)
> > >  {
> > >  	struct mtk_jpeg_ctx *ctx = priv;
> > > @@ -782,6 +1060,8 @@ static void mtk_jpeg_device_run(void *priv)
> > >  	struct mtk_jpeg_src_buf *jpeg_src_buf;
> > >  	struct mtk_jpeg_bs bs;
> > >  	struct mtk_jpeg_fb fb;
> > > +	struct mtk_jpeg_enc_bs enc_bs;
> > > +	struct mtk_jpeg_enc_fb enc_fb;
> > >  	int i;
> > >  
> > >  	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > @@ -792,30 +1072,47 @@ static void mtk_jpeg_device_run(void *priv)
> > >  		for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
> > >  			vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
> > >  		buf_state = VB2_BUF_STATE_DONE;
> > 
> > About existing code, but we may want to explain this.
> > What is this last frame handling above for?
> if the user gives us a empty buffer(means it is the last frame),the
> driver will not encode and done the buffer to the user.
>

An empty buffer is not a valid way of signaling a last frame in V4L2. In
general, I'm not sure there is such a thing in JPEG, because all frames
are separate from each other and we always expect 1 input buffer and 1
output buffer for one frame. We might want to remove the special
handling in a follow up patch.

> > > -		goto dec_end;
> > > +		goto device_run_end;
> > >  	}
> > >  
> > > -	if (mtk_jpeg_check_resolution_change(ctx, &jpeg_src_buf->dec_param)) {
> > > -		mtk_jpeg_queue_src_chg_event(ctx);
> > > -		ctx->state = MTK_JPEG_SOURCE_CHANGE;
> > > -		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > > -		return;
> > > -	}
> > > +	if (jpeg->mode == MTK_JPEG_ENC) {
> > > +		spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > +		mtk_jpeg_enc_reset(jpeg->reg_base);
> > 
> > Why do we need to reset every frame?
> We do this operation is to ensure that all registers are cleared.
> It's safer from the hardware point of view.

Wouldn't this only waste power? If we reset the hardware after powering
up, the only registers that could change would be changed by the driver
itself. The driver should program all registers properly when starting
next frame anyway, so such a reset shouldn't be necessary.

> > 
> > > +
> > > +		mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf,
> > > +				     &enc_bs);
> > > +		mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf,
> > > +				     &enc_fb);
> > > +		mtk_jpeg_enc_set_ctrl_cfg(jpeg->reg_base, ctx->enable_exif,
> > > +					  ctx->enc_quality,
> > > +					  ctx->restart_interval);
> > > +
> > > +		mtk_jpeg_enc_start(jpeg->reg_base);
> > > +	} else {
> > > +		if (mtk_jpeg_check_resolution_change
> > > +			(ctx, &jpeg_src_buf->dec_param)) {
> > > +			mtk_jpeg_queue_src_chg_event(ctx);
> > > +			ctx->state = MTK_JPEG_SOURCE_CHANGE;
> > > +			v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > 
> > This is a bit strange. Resolution change should be signaled when the
> > hardware attempted to decode a frame and detected a different resolution
> > than current. It shouldn't be necessary for the userspace to queue a pair
> > of buffers to signal it, as with the current code.
> If the the resolution is bigger than current, the current buffer will
> not be enough for the changed resolution.Shouldn't it tell the userspace
> to queue new buffer and stream on again?

The V4L2 decode flow is as follows:
 - application configures and starts only the OUTPUT queue,
 - application queues an OUTPUT buffer with a frame worth of bitstream,
 - decoder parses the bitstream headers, detects CAPTURE format and
   signals the source change event,
 - application reads CAPTURE format and configures and starts the
   CAPTURE queue,
 - application queues a CAPTURE buffer,
 - decoder decodes the image to the queued buffer.

In case of subsequent (dynamic) resolution change:
 - application queues an OUTPUT buffer and a CAPTURE buffer,
 - decoder parses the bitstream, notices resolution change, updates
   CAPTURE format and signals the source change event, refusing to
   continue the decoding until the application acknowledges it,
 - application either reallocates its CAPTURE buffers or confirms that
   the existing buffers are fine and acknowledges resolution change,
 - decoding continues.

For more details, please check the interface specification:
https://www.kernel.org/doc/html/latest/media/uapi/v4l/dev-decoder.html

[snip]
> > > -	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_GRABBER, 3);
> > > +	ret = video_register_device(jpeg->vfd_jpeg, VFL_TYPE_GRABBER, -1);
> > 
> > FYI the type changed to VFL_TYPE_VIDEO recently.
> I changed VFL_TYPE_GRABBER to VFL_TYPE_VIDEO,but builded fail.

What kernel version are you building with?

> > >  	if (ret) {
> > >  		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
> > > -		goto err_dec_vdev_register;
> > > +		goto err_vfd_jpeg_register;
> > >  	}
> > >  
> > > -	video_set_drvdata(jpeg->dec_vdev, jpeg);
> > > +	video_set_drvdata(jpeg->vfd_jpeg, jpeg);
> > >  	v4l2_info(&jpeg->v4l2_dev,
> > > -		  "decoder device registered as /dev/video%d (%d,%d)\n",
> > > -		  jpeg->dec_vdev->num, VIDEO_MAJOR, jpeg->dec_vdev->minor);
> > > +		  "jpeg device %d registered as /dev/video%d (%d,%d)\n",
> > 
> > Here it would be actually useful to special case the encoder and decoder,
> > because it would be easier for the user to know which device is which.
> > 

Just making sure this wasn't overlooked.

[snip]
> > > +
> > > +void mtk_jpeg_enc_reset(void __iomem *base)
> > > +{
> > > +	writel(0x00, base + JPEG_ENC_RSTB);
> > > +	writel(JPEG_ENC_RESET_BIT, base + JPEG_ENC_RSTB);
> > > +	writel(0x00, base + JPEG_ENC_CODEC_SEL);
> > > +}
> > > +
> > > +u32 mtk_jpeg_enc_get_int_status(void __iomem *base)
> > > +{
> > > +	u32 ret;
> > > +
> > > +	ret = readl(base + JPEG_ENC_INT_STS) &
> > > +		    JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> > > +	if (ret)
> > > +		writel(0, base + JPEG_ENC_INT_STS);
> > > +
> > > +	return ret;
> > > +}
> > 
> > Does it make sense to have a function for what is essentially just 2 lines?
> > Also, the name is misleading, as the function not only gets but also
> > clears.
> Make all hw register setting in mtk_jpeg_enc_hw.c is one part of current
> architecture.
> I have changed the function name to
> mtk_jpeg_enc_get_and_clear_int_status.

As I mentioned before, this driver needs a big clean up and that's why I
suggested starting over with a new one for the JPEG encoder part. Since
we decided to extend this one in the end, would you be able to improve
this aspect as well? Thanks.

Best regards,
Tomasz
