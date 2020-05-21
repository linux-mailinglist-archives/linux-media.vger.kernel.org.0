Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61B41DD228
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 17:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgEUPln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 11:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgEUPll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 11:41:41 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E6EC061A0E
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:41:40 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i15so7058116wrx.10
        for <linux-media@vger.kernel.org>; Thu, 21 May 2020 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t7kKQGIL/+XUIy8BYKyhP6eLPzYXGhlw9lo6TwqgMyA=;
        b=l1/Sb2B5nvypUAkBTKIFKxmseFrBYGzJgZAiEZH08EkPJG07KLikxvLrN1lrztGzEl
         2CcYvw/8C9cwD+l5f/vdnpyqsTdvzpWbpFgNjLsYwRy6Kt0M/9oy/rmy9Dmeu5Pse+3O
         IqPyAr9YObZJhacol6137kvWDN0EtPUfiVwFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t7kKQGIL/+XUIy8BYKyhP6eLPzYXGhlw9lo6TwqgMyA=;
        b=mkwQo57AxvIpozFC33J2M5/GoCIbmxmk9BcTkYcDGhA8zGgp5Q+bv7HlsmR9tTXKoc
         Q/vDG0D6D8SsFjs8KzsLHayqK+o/PUmVVbb4Ju0NuEPOh5upBotuxi826q0Wd9QNPDwD
         98BJVMrpRToT/Vn/ks8nvvBi8zObtuOzMbswP3WxJhjAPEF+iruFCUmBRYqvhAL6gCOm
         yjfrOCSniRStMgHKibWUYcojCFn+jxFaNSc5+BocRO3Y8hyeWmEwSZSzMLK4j2+Dk+i2
         M+RHPr9ftlS1C8XNdxF9I2VJUgX+8stmUUjmKRdOAAb8MF647+zm873H97eBwpSYQkVA
         0K1Q==
X-Gm-Message-State: AOAM532tQC3IX7fwq4LLxCToTCTyYh1yYQ1hLDNG8Vc9xVmCQXjUe+8T
        IXqbmhcf0HtoOsixXs6ZDqz3hg==
X-Google-Smtp-Source: ABdhPJy6oE1juN6diFyNCGUfm0SoL9QOIbTs8hFQ0ct0TZDPOLo0YnuQnJY1G0k6GJgxa5xJTervjw==
X-Received: by 2002:adf:e682:: with SMTP id r2mr8576889wrm.378.1590075699420;
        Thu, 21 May 2020 08:41:39 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id x1sm6508480wrt.86.2020.05.21.08.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:41:38 -0700 (PDT)
Date:   Thu, 21 May 2020 15:41:37 +0000
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
Subject: Re: [PATCH v8 07/14] media: platform: Use kernel native functions
 for improving code quality
Message-ID: <20200521154137.GG209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-8-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-8-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:26PM +0800, Xia Jiang wrote:

Thank you for the patch. Please see my comments inline.

nit: I'd remove "for improving code quality" from the subject, as it's
obvious that we don't intend to make the code quality worse. ;)
On the contrary, I'd make it more specific, e.g.

media: mtk-jpeg: Use generic rounding helpers

WDYT?

> Use clamp() to replace mtk_jpeg_bound_align_image() and round() to
> replace mtk_jpeg_align().
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 41 +++++--------------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++--
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c |  8 ++--
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h |  5 ---
>  4 files changed, 19 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 2fa3711fdc9b..4e64046a6854 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -157,25 +157,6 @@ static struct mtk_jpeg_fmt *mtk_jpeg_find_format(struct mtk_jpeg_ctx *ctx,
>  	return NULL;
>  }
>  
> -static void mtk_jpeg_bound_align_image(u32 *w, unsigned int wmin,
> -				       unsigned int wmax, unsigned int walign,
> -				       u32 *h, unsigned int hmin,
> -				       unsigned int hmax, unsigned int halign)
> -{
> -	int width, height, w_step, h_step;
> -
> -	width = *w;
> -	height = *h;
> -	w_step = 1 << walign;
> -	h_step = 1 << halign;
> -
> -	v4l_bound_align_image(w, wmin, wmax, walign, h, hmin, hmax, halign, 0);
> -	if (*w < width && (*w + w_step) <= wmax)
> -		*w += w_step;
> -	if (*h < height && (*h + h_step) <= hmax)
> -		*h += h_step;
> -}
> -
>  static void mtk_jpeg_adjust_fmt_mplane(struct mtk_jpeg_ctx *ctx,
>  				       struct v4l2_format *f)
>  {
> @@ -218,25 +199,25 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  	if (q_type == MTK_JPEG_FMT_TYPE_OUTPUT) {
>  		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[0];
>  
> -		mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> -					   MTK_JPEG_MAX_WIDTH, 0,
> -					   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> -					   MTK_JPEG_MAX_HEIGHT, 0);
> +		pix_mp->height = clamp(pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> +				       MTK_JPEG_MAX_HEIGHT);
> +		pix_mp->width = clamp(pix_mp->width, MTK_JPEG_MIN_WIDTH,
> +				      MTK_JPEG_MAX_WIDTH);
>  
>  		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));
>  		pfmt->bytesperline = 0;
>  		/* Source size must be aligned to 128 */
> -		pfmt->sizeimage = mtk_jpeg_align(pfmt->sizeimage, 128);
> +		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
>  		if (pfmt->sizeimage == 0)
>  			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
>  		goto end;
>  	}
>  
>  	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> -	mtk_jpeg_bound_align_image(&pix_mp->width, MTK_JPEG_MIN_WIDTH,
> -				   MTK_JPEG_MAX_WIDTH, fmt->h_align,
> -				   &pix_mp->height, MTK_JPEG_MIN_HEIGHT,
> -				   MTK_JPEG_MAX_HEIGHT, fmt->v_align);
> +	pix_mp->height = clamp(round_up(pix_mp->height, fmt->v_align),
> +			       MTK_JPEG_MIN_HEIGHT, MTK_JPEG_MAX_HEIGHT);
> +	pix_mp->width = clamp(round_up(pix_mp->width, fmt->h_align),
> +			      MTK_JPEG_MIN_WIDTH, MTK_JPEG_MAX_WIDTH);
>  
>  	for (i = 0; i < fmt->colplanes; i++) {
>  		struct v4l2_plane_pix_format *pfmt = &pix_mp->plane_fmt[i];
> @@ -751,8 +732,8 @@ static void mtk_jpeg_set_dec_src(struct mtk_jpeg_ctx *ctx,
>  {
>  	bs->str_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
>  	bs->end_addr = bs->str_addr +
> -			 mtk_jpeg_align(vb2_get_plane_payload(src_buf, 0), 16);
> -	bs->size = mtk_jpeg_align(vb2_plane_size(src_buf, 0), 128);
> +		       round_up(vb2_get_plane_payload(src_buf, 0), 16);
> +	bs->size = round_up(vb2_plane_size(src_buf, 0), 128);
>  }
>  
>  static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 999bd1427809..28e9b30ad5c3 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -21,10 +21,10 @@
>  #define MTK_JPEG_FMT_TYPE_OUTPUT	1
>  #define MTK_JPEG_FMT_TYPE_CAPTURE	2
>  
> -#define MTK_JPEG_MIN_WIDTH	32
> -#define MTK_JPEG_MIN_HEIGHT	32
> -#define MTK_JPEG_MAX_WIDTH	8192
> -#define MTK_JPEG_MAX_HEIGHT	8192
> +#define MTK_JPEG_MIN_WIDTH	32U
> +#define MTK_JPEG_MIN_HEIGHT	32U
> +#define MTK_JPEG_MAX_WIDTH	8192U
> +#define MTK_JPEG_MAX_HEIGHT	8192U

This change is not mentioned in the commit message. It should go to a
separate patch, possibly merged with other really minor stylistic changes
like this, e.g. patch 08/14.

Otherwise the patch looks good, so after addressing the above minor changes
please feel free to add

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

