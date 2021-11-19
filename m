Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEAB457245
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 17:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbhKSQDN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 11:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbhKSQDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 11:03:12 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C326CC061574
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 08:00:10 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id y16so13325399ioc.8
        for <linux-media@vger.kernel.org>; Fri, 19 Nov 2021 08:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CzDhnBYrIWCmbBZJRky5D2oCgX/sSqmYTvB1Vt37Vfo=;
        b=fa0xr6f09xAV9zx/WfI/tmWv8Ikuoej2kMVUW+OEWPKoIZzssNw+T4Y3TZExLu7nej
         VfCp5u1dC1ST5uNKwNufcB40fJ3jagxMBeZbJ6R64qjQtImtlnaZXhwsMgACaWdm7+9Q
         rP4RARCPmG2Bcj+JDkMxRMlbitADjShkbCLSJXQuG+X+7tHijelRW4UBVKmdsEHpLL8R
         nvlw6vz6H0spXdWfvNjoiQYVzIxHJ/D3+gdo7HThJZsiqPCoLzRs2mifLOMLAfOOyHMP
         EX4DrS0QDp2lRf+uBmA5hrQ1tepvALcWHA2F6Rr59JqN3tJ8EmhrABLSX7LFL4G8aEO7
         SOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CzDhnBYrIWCmbBZJRky5D2oCgX/sSqmYTvB1Vt37Vfo=;
        b=3yYBRD/0wNEqY52n0+4WOfJ0HQ3rvreL8qSHX+f9KkoPn/tmLtmNV2Ll6jLX3cUigu
         +pH1C7l3/GMvLXoxPVJfjnCbsylBfpxatIzJAjaQSmNO3ECRc8jEQ2FJJpX97/7XmmeC
         EU/SrQyEFBFT7kCZ4gi5c0XxL0fB7alrPjUlIMTED8rma824s5wrC21VrZH/bS0eI574
         F0/euShyfcmcX3AEu7OpCI9gl0M7YdFvRgWgna7yyoLtSaPda/Gt6mn2IEEnFQp+JzOr
         Aya+Y57ImDwJ236mD5KsADopRkXSo2lHOH2LnLAxFxX0zvOVFGxAZCp8v8UGkiJEOAu5
         mflw==
X-Gm-Message-State: AOAM531LXQowYRAmbo8jgrUFxt3MDGPu0S07tWFSHBn4JamQcSa8Kr7j
        vsNOC6auQahyjKSDOOB98XrQHA==
X-Google-Smtp-Source: ABdhPJxKzuc5TzSBPZkYIoBfS4UseX9DrbkBy7awo0aGJZ6Z8Ph8k5D3DAv6+0Qic/hHB26SMRGDNg==
X-Received: by 2002:a05:6638:25c8:: with SMTP id u8mr28978236jat.23.1637337609816;
        Fri, 19 Nov 2021 08:00:09 -0800 (PST)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id l1sm66114ioj.29.2021.11.19.08.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:00:09 -0800 (PST)
Message-ID: <5d23258a954eb0076cacf89d6c88b5e6ef13695f.camel@ndufresne.ca>
Subject: Re: [PATCH] media: hantro: Hook up RK3399 JPEG encoder output
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date:   Fri, 19 Nov 2021 11:00:07 -0500
In-Reply-To: <20211119074654.470729-1-wenst@chromium.org>
References: <20211119074654.470729-1-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 19 novembre 2021 à 15:46 +0800, Chen-Yu Tsai a écrit :
> The JPEG encoder found in the Hantro H1 encoder block only produces a
> raw entropy-encoded scan. The driver is responsible for building a JPEG
> compliant bitstream and placing the entropy-encoded scan in it. Right
> now the driver uses a bounce buffer for the hardware to output the raw
> scan to.
> 
> In commit e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG
> codec_ops.done"), the code that copies the raw scan from the bounce
> buffer to the capture buffer was moved, but was only hooked up for the
> Hantro H1 (then RK3288) variant. The RK3399 variant was broken,
> producing a JPEG bitstream without the scan, and the capture buffer's
> .bytesused field unset.
> 
> Fix this by duplicating the code that is executed when the JPEG encoder
> finishes encoding a frame. As the encoded length is read back from
> hardware, and the variants having different register layouts, the
> code is duplicated rather than shared.
> 
> Fixes: e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This was developed on the downstream ChromeOS 5.10 kernel (with a hack
> for .data_offset) and tested with ChromeOS's jpeg_encode_accelerator_unittest
> patched to accept non-JFIF JPEG streams (https://crrev.com/c/3291480).
> 
> This was then forward-ported to mainline (name and filename changes) and
> compile tested only.

Tested with GStreamer on top of 5.16-rc1 from media_stage.git. Not perfect but
at least the the output it valid. Test command was:

  gst-launch-1.0 videotestsrc num-buffers=2 ! v4l2jpegenc ! filesink
location=test.jpg

Notice that I encode two frames, it seems like the draining flow is broken in
this driver. GStreamer will queue the frame and issue CMD_START immediately, the
driver will skip the encode, leaving me with an empty file.

Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> 
> ---
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c   |  2 +-
>  drivers/staging/media/hantro/hantro_hw.h        |  3 ++-
>  .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c    | 17 +++++++++++++++++
>  drivers/staging/media/hantro/rockchip_vpu_hw.c  |  5 +++--
>  4 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> index 56cf261a8e95..9cd713c02a45 100644
> --- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> +++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> @@ -140,7 +140,7 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
>  	return 0;
>  }
>  
> -void hantro_jpeg_enc_done(struct hantro_ctx *ctx)
> +void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
>  	u32 bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 267a6d33a47b..60d4602d33ed 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -239,7 +239,8 @@ int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
>  int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx);
>  int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
>  void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
> -void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
> +void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx);
> +void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx);
>  
>  dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
>  				   unsigned int dpb_idx);
> diff --git a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
> index 991213ce1610..5d9ff420f0b5 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu2_hw_jpeg_enc.c
> @@ -171,3 +171,20 @@ int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx)
>  
>  	return 0;
>  }
> +
> +void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	u32 bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
> +	struct vb2_v4l2_buffer *dst_buf = hantro_get_dst_buf(ctx);
> +
> +	/*
> +	 * TODO: Rework the JPEG encoder to eliminate the need
> +	 * for a bounce buffer.
> +	 */
> +	memcpy(vb2_plane_vaddr(&dst_buf->vb2_buf, 0) +
> +	       ctx->vpu_dst_fmt->header_size,
> +	       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
> +			      ctx->vpu_dst_fmt->header_size + bytesused);
> +}
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> index d4f52957cc53..0c22039162a0 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -343,7 +343,7 @@ static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
>  		.run = hantro_h1_jpeg_enc_run,
>  		.reset = rockchip_vpu1_enc_reset,
>  		.init = hantro_jpeg_enc_init,
> -		.done = hantro_jpeg_enc_done,
> +		.done = hantro_h1_jpeg_enc_done,
>  		.exit = hantro_jpeg_enc_exit,
>  	},
>  	[HANTRO_MODE_H264_DEC] = {
> @@ -371,7 +371,7 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>  		.run = hantro_h1_jpeg_enc_run,
>  		.reset = rockchip_vpu1_enc_reset,
>  		.init = hantro_jpeg_enc_init,
> -		.done = hantro_jpeg_enc_done,
> +		.done = hantro_h1_jpeg_enc_done,
>  		.exit = hantro_jpeg_enc_exit,
>  	},
>  	[HANTRO_MODE_H264_DEC] = {
> @@ -399,6 +399,7 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
>  		.run = rockchip_vpu2_jpeg_enc_run,
>  		.reset = rockchip_vpu2_enc_reset,
>  		.init = hantro_jpeg_enc_init,
> +		.done = rockchip_vpu2_jpeg_enc_done,
>  		.exit = hantro_jpeg_enc_exit,
>  	},
>  	[HANTRO_MODE_H264_DEC] = {

