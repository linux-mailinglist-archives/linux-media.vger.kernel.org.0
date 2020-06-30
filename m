Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444DC20F9E0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 18:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389847AbgF3QxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 12:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389821AbgF3QxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 12:53:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185C3C03E97A
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:53:05 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l17so19498991wmj.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PL3gqYes7408Y9j0oN+9/8tWxq6suSL5CFMjvoIOGD8=;
        b=CVgtFTy2QTfqoViXoqnmGJ/iZi91tUj2Bpdip43Pq0diQqzgGNBkGq5N9G2XQWvogo
         68V3n2TQHlygtYUjKpStr7tg1ROHAbvN648GHZPuqq49G5p7U3AlcHrOQaxXfINfdefd
         Gk9ELgymUifA8xcKS3fnlBXshAs1nJ7VDRI+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PL3gqYes7408Y9j0oN+9/8tWxq6suSL5CFMjvoIOGD8=;
        b=bsj2FKofbfwcb81k5OB9C4koUR6tot4Qw5JiOzIeLiRtiJc7E8ShZfHcpiWb00idlv
         FVoZ2499J8UkirsK2eutsxZVhP1ePO0Q8I7seRsPZnRLY4uqLRmSRfCZtICjJY2es3Xc
         PypH6pPEi8O5e/41n5gxRqlfKH1lIsfUx9fYPAnUbS5GEOKK1PTsGuwoKyVMf4bERXYD
         pqcT3N8ZiYTgeypWzrW2lEO3yjYZF0hNacmgKqrLxZMM1fLLLA5TN8iPrxBrRuhROoE1
         CBJCtgk2w5BCtvnRRzYCwr9yX2+dhv83CURSIja2lPFSf25T9AxQ3eVOU0HgcCVgzpZo
         XUrA==
X-Gm-Message-State: AOAM532VxgReqwkFT0SG0fqxAZPQTSl1eFgQnndBFmRRH1M6sN6YxJLK
        ffBcko7SsLxymGr3UDttnnCbsw==
X-Google-Smtp-Source: ABdhPJxKifqOAzYOp4J9Bly4NiQnEMA2gDFLYP7zxPsqUSediKZtqJghVuv6mAfW2Fa0i+QexvGymA==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr22111391wmf.124.1593535983680;
        Tue, 30 Jun 2020 09:53:03 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id f186sm4010614wmf.29.2020.06.30.09.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 09:53:03 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:53:01 +0000
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
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
Message-ID: <20200630165301.GA1212092@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-20-xia.jiang@mediatek.com>
 <20200611184640.GC8694@chromium.org>
 <1593485781.20112.43.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593485781.20112.43.camel@mhfsdcap03>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Tue, Jun 30, 2020 at 10:56:21AM +0800, Xia Jiang wrote:
> On Thu, 2020-06-11 at 18:46 +0000, Tomasz Figa wrote:
> > Hi Xia,
> > 
> > On Thu, Jun 04, 2020 at 05:05:53PM +0800, Xia Jiang wrote:
[snip]
> > > +static void mtk_jpeg_enc_device_run(void *priv)
> > > +{
> > > +	struct mtk_jpeg_ctx *ctx = priv;
> > > +	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > > +	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > > +	unsigned long flags;
> > > +	struct mtk_jpeg_src_buf *jpeg_src_buf;
> > > +	struct mtk_jpeg_enc_bs enc_bs;
> > > +	int ret;
> > > +
> > > +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > +	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> > > +
> > > +	ret = pm_runtime_get_sync(jpeg->dev);
> > > +	if (ret < 0)
> > > +		goto enc_end;
> > > +
> > > +	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > +
> > > +	/*
> > > +	 * Resetting the hardware every frame is to ensure that all the
> > > +	 * registers are cleared. This is a hardware requirement.
> > > +	 */
> > > +	mtk_jpeg_enc_reset(jpeg->reg_base);
> > > +
> > > +	mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf, &enc_bs);
> > > +	mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> > > +	mtk_jpeg_enc_set_config(jpeg->reg_base, ctx->out_q.fmt->hw_format,
> > > +				ctx->enable_exif, ctx->enc_quality,
> > > +				ctx->restart_interval);
> > > +	mtk_jpeg_enc_start(jpeg->reg_base);
> > 
> > Could we just move the above 5 functions into one function inside
> > mtk_jpeg_enc_hw.c that takes mtk_jpeg_dev pointer as its argument, let's
> > say mtk_jpeg_enc_hw_run() and simply program all the data to the registers
> > directly, without the extra level of abstractions?
> I can move the 5 functions into one function(mtk_jpeg_enc_hw_run()), but
> this function will be very long, because it contains computation code
> such as setting dst addr, blk_num, quality.
> In v4, you have adviced the following architecture:
> How about the following model, as used by many other drivers:
> 
> mtk_jpeg_enc_set_src()
> {
>         // Set any registers related to source format and buffer
> }
> 
> mtk_jpeg_enc_set_dst()
> {
>         // Set any registers related to destination format and buffer
> }
> 
> mtk_jpeg_enc_set_params()
> {
>         // Set any registers related to additional encoding parameters
> }
> 
> mtk_jpeg_enc_device_run(enc, ctx)
> {
>         mtk_jpeg_enc_set_src(enc, src_buf, src_fmt);
>         mtk_jpeg_enc_set_dst(enc, dst_buf, dst_fmt);
>         mtk_jpeg_enc_set_params(enc, ctx);
>         // Trigger the hardware run
> }
> I think that this architecture is more clear(mtk_jpeg_enc_set_config is
> equivalent to mtk_jpeg_enc_set_params).
> Should I keep the original architecture or move 5 functions into
> mtk_jpeg_enc_hw_run?

Sounds good to me.

My biggest issue with the code that it ends up introducing one more
level of abstraction, but with the approach you suggested, the arguments
just accept standard structs, which avoids that problem.

[snip]
> > > +
> > > +	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> > > +	ctx->colorspace = V4L2_COLORSPACE_JPEG,
> > > +	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > +	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > +	ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > 
> > Since we already have a v4l2_pix_format_mplane struct which has fields for
> > the above 4 values, could we just store them there?
> > 
> > Also, I don't see this driver handling the colorspaces in any way, but it
> > seems to allow changing them from the userspace. This is incorrect, because
> > the userspace has no way to know that the colorspace is not handled.
> > Instead, the try_fmt implementation should always override the
> > userspace-provided colorspace configuration with the ones that the driver
> > assumes.
> > 
> > > +	pix_mp->width = MTK_JPEG_MIN_WIDTH;
> > > +	pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> > > +
> > > +	q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> > > +				      MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> > > +	vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> > > +				    fmt.pix_mp), q->fmt);
> > > +	q->w = pix_mp->width;
> > > +	q->h = pix_mp->height;
> > > +	q->crop_rect.width = pix_mp->width;
> > > +	q->crop_rect.height = pix_mp->height;
> > > +	q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> > > +	q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;
> > 
> > Actually, do we need this custom mtk_jpeg_q_data struct? Why couldn't we
> > just keep the same values inside the standard v4l2_pix_format_mplane
> > struct?
> I think that we need mtk_jpeg_q_data struct.If we delete it, how can we
> know these values(w, h, sizeimage, bytesperline, mtk_jpeg_fmt) belong to
> output or capture(output and capture's sizeimages are different, width
> and height are differnt too for jpeg dec )?We have
> s_fmt_vid_out_mplane/cap_mplane function to set these values.
> 
> But we can use standard v4l2_pix_format_mplane struct replacing the w, h
> bytesperline, sizeimage in mtk_jpeg_q_data struct like this:
> struct mtk_jpeg_q_data{
> 	struct mtk_jpeg_fmt *fmt;
> 	struct v4l2_pix_format_mplane pix_mp;
> 	struct v4l2_rect enc_crop_rect
> }
> Then delete ctx->colorspace ctx->ycbcr_enc ctx->quantization
> ctx->xfer_func, becuase v4l2_pix_format_mplane in q_data has contained
> them and assign them for out_q and cap_q separately.
> 
> WDYT?

Sounds good to me. I was considering just making it like

struct mtk_jpeg_ctx {
	struct mtk_jpeg_fmt *src_fmt;
	struct v4l2_pix_format_mplane src_pix_mp;
	struct v4l2_rect src_crop;

	struct mtk_jpeg_fmt *dst_fmt;
	struct v4l2_pix_format_mplane dst_pix_mp;
	struct v4l2_rect dst_crop;
};

but I like your suggestion as well, as long as custom data structures
are not used to store standard information.
[snip]
> > > @@ -1042,8 +1619,12 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
> > >  		return jpeg_irq;
> > >  	}
> > >  
> > > -	ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, 0,
> > > -			       pdev->name, jpeg);
> > > +	if (jpeg->variant->is_encoder)
> > > +		ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_enc_irq,
> > > +				       0, pdev->name, jpeg);
> > > +	else
> > > +		ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq,
> > > +				       0, pdev->name, jpeg);
> > 
> > Rather than having "is_encoder" in the variant struct, would it make more
> > sense to have "irq_handler" instead? That would avoid the explicit if.
> Do you mean to delete "is_encoder"? It is used 8 times in the
> driver.Should I move them all to the match data?

Yes. It would make the code linear and the varability between the
decoder and encoder would be self-contained in the variant struct.

Best regards,
Tomasz
