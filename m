Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49AD8668532
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 22:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240813AbjALVSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 16:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240774AbjALVRx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 16:17:53 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C52E77AD7;
        Thu, 12 Jan 2023 12:59:13 -0800 (PST)
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C7E06602D59;
        Thu, 12 Jan 2023 20:58:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673557116;
        bh=wlus3ItbPJlKKgtyc4iIkSQkGdha2/qmSLhvIsGYOgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P1bC2BxC39SXJ66hdDZKauBr+s8XAfK/NxeGin7AZJrszz/zAD9M6t29DN6f5DjxT
         7INqYrfNiR+XRJNdNTHiANz08OLMOrc/xIoEnurfCcaoKydH9CLimMnRZixEz+1XgW
         xxepSrerWFKxzOXKs7T9bRIw2CYR8BhT3CZVahS5jUYkbFR5+1sVMcsOgh6wmVeran
         bvT71bJT5Hvan+yE9lRBkQF1GY6kM7I58pc3jA7bMZuibiC+nk/zyHTRCMMDVZEQIX
         /OVvB9jkdmBbiVfpPAstqDddlNF4DFNazF3kZmias4W/HkcIj+Rs1FQIZzQi5FL00P
         ArsSx0Cda7ILg==
Date:   Thu, 12 Jan 2023 15:58:25 -0500
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7, 5/7] media: mediatek: vcodec: Different codec using
 different capture format
Message-ID: <20230112205825.wb5qcqhh5kwvyi3y@notapiano>
References: <20220518123004.18286-1-yunfei.dong@mediatek.com>
 <20220518123004.18286-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220518123004.18286-6-yunfei.dong@mediatek.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 18, 2022 at 08:30:02PM +0800, Yunfei Dong wrote:
> Vp8 need to use MM21, but vp9 and h264 need to use HyFbc mode
> for mt8195. Vp8/vp9/h264 use the same MM21 format for mt8192.

Hi Yunfei,

why do VP9 and H264 need to use HyFbc (is this the same as MT21C?) mode on
MT8195? The SCP firmware on linux-firmware for MT8195 [1] only has MM21
available and based on my testing it works just fine. And contrary to what the
commit message states this logic is also being applied to MT8192, preventing it
to use MM21 when there are more than one format available.

Thanks,
N�colas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek/mt8195/scp.img?id=375d4500d315ff20c59911d12d86b477d4979b1d

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 52e5d36aa912..254649240b34 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -35,6 +35,44 @@ mtk_vdec_find_format(struct v4l2_format *f,
>  	return NULL;
>  }
>  
> +static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
> +{
> +	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
> +	const struct mtk_video_fmt *fmt;
> +	struct mtk_q_data *q_data;
> +	int num_frame_count = 0, i;
> +	bool ret = true;
> +
> +	for (i = 0; i < *dec_pdata->num_formats; i++) {
> +		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
> +			continue;
> +
> +		num_frame_count++;
> +	}
> +
> +	if (num_frame_count == 1)
> +		return true;
> +
> +	fmt = &dec_pdata->vdec_formats[format_index];
> +	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
> +	switch (q_data->fmt->fourcc) {
> +	case V4L2_PIX_FMT_VP8_FRAME:
> +		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> +			ret = true;
> +		break;
> +	case V4L2_PIX_FMT_H264_SLICE:
> +	case V4L2_PIX_FMT_VP9_FRAME:
> +		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> +			ret = false;
> +		break;
> +	default:
> +		ret = true;
> +		break;
> +	};
> +
> +	return ret;
> +}
> +
>  static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
>  					      enum v4l2_buf_type type)
>  {
> @@ -566,6 +604,9 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
>  		    dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
>  			continue;
>  
> +		if (!output_queue && !mtk_vdec_get_cap_fmt(ctx, i))
> +			continue;
> +
>  		if (j == f->index)
>  			break;
>  		++j;
> -- 
> 2.18.0
> 
> 
