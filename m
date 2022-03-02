Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872264C9AB0
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 02:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238963AbiCBBtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 20:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbiCBBtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 20:49:05 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603531B7A1;
        Tue,  1 Mar 2022 17:48:21 -0800 (PST)
X-UUID: eba753c38ca04e56b82a3090a29072f8-20220302
X-UUID: eba753c38ca04e56b82a3090a29072f8-20220302
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 446460884; Wed, 02 Mar 2022 09:48:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 2 Mar 2022 09:47:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Mar 2022 09:47:57 +0800
Message-ID: <9b619f41abdae2ad4246a4cf63c6561a493b93c8.camel@mediatek.com>
Subject: Re: [PATCH v7, 04/15] media: mtk-vcodec: Read max resolution from
 dec_capability
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        "Steve Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Wed, 2 Mar 2022 09:47:57 +0800
In-Reply-To: <cb7cf296bc7df7334f55cc51ef11b671572559ac.camel@ndufresne.ca>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
         <20220223034008.15781-5-yunfei.dong@mediatek.com>
         <cb7cf296bc7df7334f55cc51ef11b671572559ac.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
X-Spam-Status: No, score=0.7 required=5.0 tests=APP_DEVELOPMENT_NORDNS,
        BAYES_00,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

Thanks for your comments, I will fix this patch according your
suggestion.

On Mon, 2022-02-28 at 16:29 -0500, Nicolas Dufresne wrote:
> Hi Yunfei,
> 
> this patch does not work unless userland calls enum_framesizes, which
> is
> completely optional. See comment and suggestion below.
> 
> Le mercredi 23 février 2022 à 11:39 +0800, Yunfei Dong a écrit :
> > Supported max resolution for different platforms are not the same:
> > 2K
> > or 4K, getting it according to dec_capability.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 29 +++++++++++--
> > ------
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 +++
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 130ecef2e766..304f5afbd419 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -152,13 +152,15 @@ void mtk_vcodec_dec_set_default_params(struct
> > mtk_vcodec_ctx *ctx)
> >  	q_data->coded_height = DFT_CFG_HEIGHT;
> >  	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
> >  	q_data->field = V4L2_FIELD_NONE;
> > +	ctx->max_width = MTK_VDEC_MAX_W;
> > +	ctx->max_height = MTK_VDEC_MAX_H;
> >  
> >  	v4l_bound_align_image(&q_data->coded_width,
> >  				MTK_VDEC_MIN_W,
> > -				MTK_VDEC_MAX_W, 4,
> > +				ctx->max_width, 4,
> >  				&q_data->coded_height,
> >  				MTK_VDEC_MIN_H,
> > -				MTK_VDEC_MAX_H, 5, 6);
> > +				ctx->max_height, 5, 6);
> >  
> >  	q_data->sizeimage[0] = q_data->coded_width * q_data-
> > >coded_height;
> >  	q_data->bytesperline[0] = q_data->coded_width;
> > @@ -217,7 +219,7 @@ static int vidioc_vdec_subscribe_evt(struct
> > v4l2_fh *fh,
> >  	}
> >  }
> >  
> > -static int vidioc_try_fmt(struct v4l2_format *f,
> > +static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct
> > v4l2_format *f,
> >  			  const struct mtk_video_fmt *fmt)
> >  {
> >  	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
> > @@ -225,9 +227,9 @@ static int vidioc_try_fmt(struct v4l2_format
> > *f,
> >  	pix_fmt_mp->field = V4L2_FIELD_NONE;
> >  
> >  	pix_fmt_mp->width =
> > -		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W,
> > MTK_VDEC_MAX_W);
> > +		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, ctx-
> > >max_width);
> >  	pix_fmt_mp->height =
> > -		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H,
> > MTK_VDEC_MAX_H);
> > +		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, ctx-
> > >max_height);
> >  
> >  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> >  		pix_fmt_mp->num_planes = 1;
> > @@ -245,16 +247,16 @@ static int vidioc_try_fmt(struct v4l2_format
> > *f,
> >  		tmp_h = pix_fmt_mp->height;
> >  		v4l_bound_align_image(&pix_fmt_mp->width,
> >  					MTK_VDEC_MIN_W,
> > -					MTK_VDEC_MAX_W, 6,
> > +					ctx->max_width, 6,
> >  					&pix_fmt_mp->height,
> >  					MTK_VDEC_MIN_H,
> > -					MTK_VDEC_MAX_H, 6, 9);
> > +					ctx->max_height, 6, 9);
> >  
> >  		if (pix_fmt_mp->width < tmp_w &&
> > -			(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
> > +			(pix_fmt_mp->width + 64) <= ctx->max_width)
> >  			pix_fmt_mp->width += 64;
> >  		if (pix_fmt_mp->height < tmp_h &&
> > -			(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
> > +			(pix_fmt_mp->height + 64) <= ctx->max_height)
> >  			pix_fmt_mp->height += 64;
> >  
> >  		mtk_v4l2_debug(0,
> > @@ -294,7 +296,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct
> > file *file, void *priv,
> >  		fmt = mtk_vdec_find_format(f, dec_pdata);
> >  	}
> >  
> > -	return vidioc_try_fmt(f, fmt);
> > +	return vidioc_try_fmt(ctx, f, fmt);
> >  }
> >  
> >  static int vidioc_try_fmt_vid_out_mplane(struct file *file, void
> > *priv,
> > @@ -317,7 +319,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct
> > file *file, void *priv,
> >  		return -EINVAL;
> >  	}
> >  
> > -	return vidioc_try_fmt(f, fmt);
> > +	return vidioc_try_fmt(ctx, f, fmt);
> >  }
> >  
> >  static int vidioc_vdec_g_selection(struct file *file, void *priv,
> > @@ -445,7 +447,7 @@ static int vidioc_vdec_s_fmt(struct file *file,
> > void *priv,
> >  		return -EINVAL;
> >  
> >  	q_data->fmt = fmt;
> > -	vidioc_try_fmt(f, q_data->fmt);
> > +	vidioc_try_fmt(ctx, f, q_data->fmt);
> >  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> >  		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> >  		q_data->coded_width = pix_mp->width;
> > @@ -545,6 +547,9 @@ static int vidioc_enum_framesizes(struct file
> > *file, void *priv,
> >  				fsize->stepwise.min_height,
> >  				fsize->stepwise.max_height,
> >  				fsize->stepwise.step_height);
> > +
> > +		ctx->max_width = fsize->stepwise.max_width;
> > +		ctx->max_height = fsize->stepwise.max_height;
> 
> The spec does not require calling enum_fmt, so changing the maximum
> here is
> incorrect (and fail with GStreamer). If userland never enum the
> framesizes, the
> resolution get limited to 1080p.
> 
> As this only depends and the OUTPUT format and the device being
> open()
> (condition being dev_capability being set and OUTPUT format being
> known / not
> VP8), you could initialize the cxt max inside s_fmt(OUTPUT) instead,
> which is a
> mandatory call. I have tested this change to verify this:
> 
I will fix it in your suggestion, thanks.

Best Regards,
Yunfei Dong
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 044e3dfbdd8c..3e7c571526a4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -484,6 +484,14 @@ static int vidioc_vdec_s_fmt(struct file *file,
> void *priv,
>  	if (fmt == NULL)
>  		return -EINVAL;
>  
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> +	    !(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)
> &&
> +	    fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
> +		mtk_v4l2_debug(3, "4K is enabled");
> +		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
> +		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
> +	}
> +
>  	q_data->fmt = fmt;
>  	vidioc_try_fmt(ctx, f, q_data->fmt);
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> @@ -574,15 +582,9 @@ static int vidioc_enum_framesizes(struct file
> *file, void *priv,
>  
>  		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>  		fsize->stepwise = dec_pdata-
> >vdec_framesizes[i].stepwise;
> -		if (!(ctx->dev->dec_capability &
> -				VCODEC_CAPABILITY_4K_DISABLED) &&
> -				fsize->pixel_format !=
> V4L2_PIX_FMT_VP8_FRAME) {
> -			mtk_v4l2_debug(3, "4K is enabled");
> -			fsize->stepwise.max_width =
> -					VCODEC_DEC_4K_CODED_WIDTH;
> -			fsize->stepwise.max_height =
> -					VCODEC_DEC_4K_CODED_HEIGHT;
> -		}
> +		fsize->stepwise.max_width = ctx->max_width;
> +		fsize->stepwise.max_height = ctx->max_height;
> +
>  		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
>  				ctx->dev->dec_capability,
>  				fsize->stepwise.min_width,
> @@ -592,8 +594,6 @@ static int vidioc_enum_framesizes(struct file
> *file, void *priv,
>  				fsize->stepwise.max_height,
>  				fsize->stepwise.step_height);
>  
> -		ctx->max_width = fsize->stepwise.max_width;
> -		ctx->max_height = fsize->stepwise.max_height;
>  		return 0;
>  	}
>  
> 
> 
> >  		return 0;
> >  	}
> >  
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index bb7b8e914d24..6d27e4d41ede 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -284,6 +284,8 @@ struct vdec_pic_info {
> >   *	  mtk_video_dec_buf.
> >   * @hw_id: hardware index used to identify different hardware.
> >   *
> > + * @max_width: hardware supported max width
> > + * @max_height: hardware supported max height
> >   * @msg_queue: msg queue used to store lat buffer information.
> >   */
> >  struct mtk_vcodec_ctx {
> > @@ -329,6 +331,8 @@ struct mtk_vcodec_ctx {
> >  	struct mutex lock;
> >  	int hw_id;
> >  
> > +	unsigned int max_width;
> > +	unsigned int max_height;
> >  	struct vdec_msg_queue msg_queue;
> >  };
> >  
> 
> 

