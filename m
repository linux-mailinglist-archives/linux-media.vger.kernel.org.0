Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CDA36496
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 21:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfFETXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 15:23:37 -0400
Received: from casper.infradead.org ([85.118.1.10]:58886 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfFETXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 15:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uJLdj/hJn3gAr828xhuBrMt76xjXc3h7qiDuE4oiaq0=; b=I2lXbd6VMOAwpQ4fOorQwlkktH
        G2btDH6smcGNpVKhTilphni+Wu7rgeD7n/IONJ1ebs5I3keIQtzeWlkOSFL5ti7zHurqtBnZGFcuF
        LtE/gRsM4woCWdyHOUcs8wXxB3tYkf5kz5ZuRK6hH4b9eBgXVqnoIhHTX3uIOpQ8jZCjPYQ6crrTb
        38ZZt2plPBAmOVsjbA92q+7b5mKLqMx0mrYymnztOUsEZztKOkI92vDFyEzBMSj6HxKJUui0sgFxi
        HM4QUTtty7dQH2nOF48j5UAgZiyAn1ULA6b2toAqI9z2nPtfMgUgLvhnE7vMku22H/Rt1wbfeh2b9
        FCSeva0w==;
Received: from [179.182.172.34] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYbVP-0003zc-Rn; Wed, 05 Jun 2019 19:23:28 +0000
Date:   Wed, 5 Jun 2019 16:23:22 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] media: mtk-vcodec: avoid unneeded pointer-to-long
 conversions
Message-ID: <20190605162322.56b909e1@coco.lan>
In-Reply-To: <20190604093737.172599-3-acourbot@chromium.org>
References: <20190604093737.172599-1-acourbot@chromium.org>
        <20190604093737.172599-3-acourbot@chromium.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue,  4 Jun 2019 18:37:34 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

> The interface used to communicate with the firmware casts pointers
> into unsigned longs and back again in order to store private
> references, all of this for pointers that remain purely in the kernel.
> Replace these unsigned longs with void pointers to make the code a bit
> sturdier and easier to follow.
> 
> Also simplify some interfaces by removing arguments that could be
> infered from others.

This generate lots of sparse warnings:


 drivers/media/platform/mtk-vcodec/vdec_drv_if.c:64:32:  warning: Using plain integer as NULL pointer
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c:87:32:  warning: Using plain integer as NULL pointer
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c:99:32:  warning: Using plain integer as NULL pointer
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c:108:27:  warning: Using plain integer as NULL pointer
 drivers/media/platform/mtk-vcodec/venc_drv_if.c:86:32:  warning: Using plain integer as NULL pointer
 drivers/media/platform/mtk-vcodec/venc_drv_if.c:95:27:  warning: Using plain integer as NULL pointer

Please fix and re-submit.

Regards,
Mauro

> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h   |  2 +-
>  .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c    | 12 ++++++------
>  drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c | 12 ++++++------
>  drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c | 12 ++++++------
>  drivers/media/platform/mtk-vcodec/vdec_drv_base.h    |  8 ++++----
>  drivers/media/platform/mtk-vcodec/vdec_drv_if.c      |  2 +-
>  .../media/platform/mtk-vcodec/venc/venc_h264_if.c    | 10 +++++-----
>  drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c | 10 +++++-----
>  drivers/media/platform/mtk-vcodec/venc_drv_base.h    |  8 ++++----
>  drivers/media/platform/mtk-vcodec/venc_drv_if.c      |  2 +-
>  10 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index d7b43caf7988..4b10996e6532 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -268,7 +268,7 @@ struct mtk_vcodec_ctx {
>  
>  	const struct vdec_common_if *dec_if;
>  	const struct venc_common_if *enc_if;
> -	unsigned long drv_handle;
> +	void *drv_handle;
>  
>  	struct vdec_pic_info picinfo;
>  	int dpb_size;
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> index d725ea54b1c1..0c0660d2560b 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> @@ -262,7 +262,7 @@ static void get_dpb_size(struct vdec_h264_inst *inst, unsigned int *dpb_sz)
>  	mtk_vcodec_debug(inst, "sz=%d", *dpb_sz);
>  }
>  
> -static int vdec_h264_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
> +static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
>  {
>  	struct vdec_h264_inst *inst = NULL;
>  	int err;
> @@ -291,7 +291,7 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
>  
>  	mtk_vcodec_debug(inst, "H264 Instance >> %p", inst);
>  
> -	*h_vdec = (unsigned long)inst;
> +	ctx->drv_handle = inst;
>  	return 0;
>  
>  error_deinit:
> @@ -302,7 +302,7 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
>  	return err;
>  }
>  
> -static void vdec_h264_deinit(unsigned long h_vdec)
> +static void vdec_h264_deinit(void *h_vdec)
>  {
>  	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
>  
> @@ -327,7 +327,7 @@ static int find_start_code(unsigned char *data, unsigned int data_sz)
>  	return -1;
>  }
>  
> -static int vdec_h264_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
> +static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  			    struct vdec_fb *fb, bool *res_chg)
>  {
>  	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
> @@ -447,8 +447,8 @@ static void vdec_h264_get_fb(struct vdec_h264_inst *inst,
>  	list->count--;
>  }
>  
> -static int vdec_h264_get_param(unsigned long h_vdec,
> -			       enum vdec_get_param_type type, void *out)
> +static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
> +			       void *out)
>  {
>  	struct vdec_h264_inst *inst = (struct vdec_h264_inst *)h_vdec;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> index 8de997875b6b..1e3763881e0d 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> @@ -383,7 +383,7 @@ static void free_working_buf(struct vdec_vp8_inst *inst)
>  	inst->vsi->dec.working_buf_dma = 0;
>  }
>  
> -static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
> +static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
>  {
>  	struct vdec_vp8_inst *inst;
>  	int err;
> @@ -414,7 +414,7 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
>  	get_hw_reg_base(inst);
>  	mtk_vcodec_debug(inst, "VP8 Instance >> %p", inst);
>  
> -	*h_vdec = (unsigned long)inst;
> +	ctx->drv_handle = inst;
>  	return 0;
>  
>  error_deinit:
> @@ -424,7 +424,7 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
>  	return err;
>  }
>  
> -static int vdec_vp8_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
> +static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  			   struct vdec_fb *fb, bool *res_chg)
>  {
>  	struct vdec_vp8_inst *inst = (struct vdec_vp8_inst *)h_vdec;
> @@ -560,8 +560,8 @@ static void get_crop_info(struct vdec_vp8_inst *inst, struct v4l2_rect *cr)
>  			 cr->left, cr->top, cr->width, cr->height);
>  }
>  
> -static int vdec_vp8_get_param(unsigned long h_vdec,
> -			      enum vdec_get_param_type type, void *out)
> +static int vdec_vp8_get_param(void *h_vdec, enum vdec_get_param_type type,
> +			      void *out)
>  {
>  	struct vdec_vp8_inst *inst = (struct vdec_vp8_inst *)h_vdec;
>  
> @@ -594,7 +594,7 @@ static int vdec_vp8_get_param(unsigned long h_vdec,
>  	return 0;
>  }
>  
> -static void vdec_vp8_deinit(unsigned long h_vdec)
> +static void vdec_vp8_deinit(void *h_vdec)
>  {
>  	struct vdec_vp8_inst *inst = (struct vdec_vp8_inst *)h_vdec;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index 02b65298c87e..589b2fc91da2 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -751,7 +751,7 @@ static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
>  	return 0;
>  }
>  
> -static void vdec_vp9_deinit(unsigned long h_vdec)
> +static void vdec_vp9_deinit(void *h_vdec)
>  {
>  	struct vdec_vp9_inst *inst = (struct vdec_vp9_inst *)h_vdec;
>  	struct mtk_vcodec_mem *mem;
> @@ -773,7 +773,7 @@ static void vdec_vp9_deinit(unsigned long h_vdec)
>  	vp9_free_inst(inst);
>  }
>  
> -static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
> +static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
>  {
>  	struct vdec_vp9_inst *inst;
>  
> @@ -797,7 +797,7 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
>  	inst->vsi = (struct vdec_vp9_vsi *)inst->vpu.vsi;
>  	init_all_fb_lists(inst);
>  
> -	(*h_vdec) = (unsigned long)inst;
> +	ctx->drv_handle = inst;
>  	return 0;
>  
>  err_deinit_inst:
> @@ -806,7 +806,7 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec)
>  	return -EINVAL;
>  }
>  
> -static int vdec_vp9_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
> +static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  		   struct vdec_fb *fb, bool *res_chg)
>  {
>  	int ret = 0;
> @@ -963,8 +963,8 @@ static void get_crop_info(struct vdec_vp9_inst *inst, struct v4l2_rect *cr)
>  			 cr->left, cr->top, cr->width, cr->height);
>  }
>  
> -static int vdec_vp9_get_param(unsigned long h_vdec,
> -		enum vdec_get_param_type type, void *out)
> +static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
> +			      void *out)
>  {
>  	struct vdec_vp9_inst *inst = (struct vdec_vp9_inst *)h_vdec;
>  	int ret = 0;
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
> index 014712b1312e..4453f7de9f87 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_drv_base.h
> @@ -13,7 +13,7 @@ struct vdec_common_if {
>  	 * @ctx     : [in] mtk v4l2 context
>  	 * @h_vdec  : [out] driver handle
>  	 */
> -	int (*init)(struct mtk_vcodec_ctx *ctx, unsigned long *h_vdec);
> +	int (*init)(struct mtk_vcodec_ctx *ctx);
>  
>  	/**
>  	 * (*decode)() - trigger decode
> @@ -22,7 +22,7 @@ struct vdec_common_if {
>  	 * @fb      : [in] frame buffer to store decoded frame
>  	 * @res_chg : [out] resolution change happen
>  	 */
> -	int (*decode)(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
> +	int (*decode)(void *h_vdec, struct mtk_vcodec_mem *bs,
>  		      struct vdec_fb *fb, bool *res_chg);
>  
>  	/**
> @@ -31,14 +31,14 @@ struct vdec_common_if {
>  	 * @type   : [in] input parameter type
>  	 * @out    : [out] buffer to store query result
>  	 */
> -	int (*get_param)(unsigned long h_vdec, enum vdec_get_param_type type,
> +	int (*get_param)(void *h_vdec, enum vdec_get_param_type type,
>  			 void *out);
>  
>  	/**
>  	 * (*deinit)() - deinitialize driver.
>  	 * @h_vdec : [in] driver handle to be deinit
>  	 */
> -	void (*deinit)(unsigned long h_vdec);
> +	void (*deinit)(void *h_vdec);
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> index 6835cb7d090a..5d8d76d55005 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> @@ -34,7 +34,7 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  
>  	mtk_vdec_lock(ctx);
>  	mtk_vcodec_dec_clock_on(&ctx->dev->pm);
> -	ret = ctx->dec_if->init(ctx, &ctx->drv_handle);
> +	ret = ctx->dec_if->init(ctx);
>  	mtk_vcodec_dec_clock_off(&ctx->dev->pm);
>  	mtk_vdec_unlock(ctx);
>  
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index 0cf08dd7b6e3..bfe61d5dc1cb 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -452,7 +452,7 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
>  	memset(p, 0xff, size);
>  }
>  
> -static int h264_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
> +static int h264_enc_init(struct mtk_vcodec_ctx *ctx)
>  {
>  	int ret = 0;
>  	struct venc_h264_inst *inst;
> @@ -478,12 +478,12 @@ static int h264_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
>  	if (ret)
>  		kfree(inst);
>  	else
> -		(*handle) = (unsigned long)inst;
> +		ctx->drv_handle = inst;
>  
>  	return ret;
>  }
>  
> -static int h264_enc_encode(unsigned long handle,
> +static int h264_enc_encode(void *handle,
>  			   enum venc_start_opt opt,
>  			   struct venc_frm_buf *frm_buf,
>  			   struct mtk_vcodec_mem *bs_buf,
> @@ -578,7 +578,7 @@ static int h264_enc_encode(unsigned long handle,
>  	return ret;
>  }
>  
> -static int h264_enc_set_param(unsigned long handle,
> +static int h264_enc_set_param(void *handle,
>  			      enum venc_set_param_type type,
>  			      struct venc_enc_param *enc_prm)
>  {
> @@ -631,7 +631,7 @@ static int h264_enc_set_param(unsigned long handle,
>  	return ret;
>  }
>  
> -static int h264_enc_deinit(unsigned long handle)
> +static int h264_enc_deinit(void *handle)
>  {
>  	int ret = 0;
>  	struct venc_h264_inst *inst = (struct venc_h264_inst *)handle;
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 3fb9e0c79b4f..af23367cf1dd 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -318,7 +318,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
>  	return ret;
>  }
>  
> -static int vp8_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
> +static int vp8_enc_init(struct mtk_vcodec_ctx *ctx)
>  {
>  	int ret = 0;
>  	struct venc_vp8_inst *inst;
> @@ -344,12 +344,12 @@ static int vp8_enc_init(struct mtk_vcodec_ctx *ctx, unsigned long *handle)
>  	if (ret)
>  		kfree(inst);
>  	else
> -		(*handle) = (unsigned long)inst;
> +		ctx->drv_handle = inst;
>  
>  	return ret;
>  }
>  
> -static int vp8_enc_encode(unsigned long handle,
> +static int vp8_enc_encode(void *handle,
>  			  enum venc_start_opt opt,
>  			  struct venc_frm_buf *frm_buf,
>  			  struct mtk_vcodec_mem *bs_buf,
> @@ -386,7 +386,7 @@ static int vp8_enc_encode(unsigned long handle,
>  	return ret;
>  }
>  
> -static int vp8_enc_set_param(unsigned long handle,
> +static int vp8_enc_set_param(void *handle,
>  			     enum venc_set_param_type type,
>  			     struct venc_enc_param *enc_prm)
>  {
> @@ -437,7 +437,7 @@ static int vp8_enc_set_param(unsigned long handle,
>  	return ret;
>  }
>  
> -static int vp8_enc_deinit(unsigned long handle)
> +static int vp8_enc_deinit(void *handle)
>  {
>  	int ret = 0;
>  	struct venc_vp8_inst *inst = (struct venc_vp8_inst *)handle;
> diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_base.h b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
> index 2de37b47fe73..be368fcb01e6 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_drv_base.h
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_base.h
> @@ -13,7 +13,7 @@ struct venc_common_if {
>  	 * @ctx:	[in] mtk v4l2 context
>  	 * @handle: [out] driver handle
>  	 */
> -	int (*init)(struct mtk_vcodec_ctx *ctx, unsigned long *handle);
> +	int (*init)(struct mtk_vcodec_ctx *ctx);
>  
>  	/**
>  	 * (*encode)() - trigger encode
> @@ -23,7 +23,7 @@ struct venc_common_if {
>  	 * @bs_buf: [in] bitstream buffer to store output bitstream
>  	 * @result: [out] encode result
>  	 */
> -	int (*encode)(unsigned long handle, enum venc_start_opt opt,
> +	int (*encode)(void *handle, enum venc_start_opt opt,
>  		      struct venc_frm_buf *frm_buf,
>  		      struct mtk_vcodec_mem *bs_buf,
>  		      struct venc_done_result *result);
> @@ -34,14 +34,14 @@ struct venc_common_if {
>  	 * @type: [in] parameter type
>  	 * @in: [in] buffer to store the parameter
>  	 */
> -	int (*set_param)(unsigned long handle, enum venc_set_param_type type,
> +	int (*set_param)(void *handle, enum venc_set_param_type type,
>  			 struct venc_enc_param *in);
>  
>  	/**
>  	 * (*deinit)() - deinitialize driver.
>  	 * @handle: [in] driver handle
>  	 */
> -	int (*deinit)(unsigned long handle);
> +	int (*deinit)(void *handle);
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> index 25c1e100f5a1..318af1b4b6e7 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> @@ -31,7 +31,7 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  
>  	mtk_venc_lock(ctx);
>  	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
> -	ret = ctx->enc_if->init(ctx, (unsigned long *)&ctx->drv_handle);
> +	ret = ctx->enc_if->init(ctx);
>  	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
>  	mtk_venc_unlock(ctx);
>  



Thanks,
Mauro
